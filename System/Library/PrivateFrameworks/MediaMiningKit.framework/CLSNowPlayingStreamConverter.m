@interface CLSNowPlayingStreamConverter
+ (id)recognizedMusicSources;
+ (unint64_t)defaultOptions;
- (BOOL)_canUseEvent:(id)a3;
- (CLSNowPlayingStreamConverter)init;
- (id)eventFromDuetKnoweledgeEvent:(id)a3;
- (id)eventsFromDuetKnowledgeEvents:(id)a3;
- (unint64_t)options;
- (void)setOptions:(unint64_t)a3;
@end

@implementation CLSNowPlayingStreamConverter

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)_canUseEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  v6 = [v4 localStartDate];
  uint64_t v7 = [v4 localEndDate];
  v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (!v6 || !v7) {
    goto LABEL_27;
  }
  v10 = [v4 localEndDate];
  v11 = [v4 localStartDate];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  v14 = [v5 durationInSeconds];
  [v14 doubleValue];
  double v16 = v15;

  unint64_t v17 = [(CLSNowPlayingStreamConverter *)self options];
  if (!v17)
  {
LABEL_19:
    LOBYTE(v9) = 1;
    goto LABEL_27;
  }
  char v18 = v17;
  if (v17)
  {
    v19 = [v5 album];
    v20 = [v5 artist];
    v21 = [v5 title];
    if (![v19 length] && !objc_msgSend(v20, "length") && !objc_msgSend(v21, "length"))
    {

      goto LABEL_25;
    }
  }
  if ((v18 & 0xA) != 0)
  {
    LOBYTE(v9) = 0;
    if (v13 == 0.0 || v16 == 0.0) {
      goto LABEL_27;
    }
    if (v13 < 300.0 && v13 / v16 < 0.2) {
      goto LABEL_26;
    }
  }
  if ((v18 & 4) != 0)
  {
    v24 = [v5 title];
    v19 = [v24 lowercaseString];

    if (v19 && [v19 length])
    {
      char v25 = [v19 hasPrefix:@"track"];

      if ((v25 & 1) == 0) {
        goto LABEL_15;
      }
LABEL_26:
      LOBYTE(v9) = 0;
      goto LABEL_27;
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_15:
  if ((v18 & 0x10) != 0 && v13 > v16 * 4.0) {
    goto LABEL_26;
  }
  if ((v18 & 0x20) == 0) {
    goto LABEL_19;
  }
  v22 = [(id)objc_opt_class() recognizedMusicSources];
  v23 = [v5 source];
  int v9 = [v22 containsObject:v23];

  if (v9) {
    goto LABEL_19;
  }
LABEL_27:

  return v9;
}

- (id)eventsFromDuetKnowledgeEvents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CLSNowPlayingStreamConverter eventFromDuetKnoweledgeEvent:](self, "eventFromDuetKnoweledgeEvent:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)eventFromDuetKnoweledgeEvent:(id)a3
{
  id v4 = a3;
  v5 = [[CLSNowPlayingStreamEvent alloc] initWithDuetKnowledgeEvent:v4];

  if ([(CLSNowPlayingStreamConverter *)self _canUseEvent:v5]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (CLSNowPlayingStreamConverter)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLSNowPlayingStreamConverter;
  v2 = [(CLSNowPlayingStreamConverter *)&v4 init];
  if (v2) {
    v2->_options = [(id)objc_opt_class() defaultOptions];
  }
  return v2;
}

+ (id)recognizedMusicSources
{
  if (recognizedMusicSources_onceToken != -1) {
    dispatch_once(&recognizedMusicSources_onceToken, &__block_literal_global_5383);
  }
  v2 = (void *)recognizedMusicSources_musicSources;
  return v2;
}

uint64_t __54__CLSNowPlayingStreamConverter_recognizedMusicSources__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"multisourceMusicEnabled"];

  if (v1) {
    v2 = &unk_1F28F2E10;
  }
  else {
    v2 = &unk_1F28F2E28;
  }
  recognizedMusicSources_musicSources = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  return MEMORY[0x1F41817F8]();
}

+ (unint64_t)defaultOptions
{
  return 3;
}

@end