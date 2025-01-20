@interface APRKPlayerItem
+ (id)UUIDFromItemDictionary:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startPosition;
- (APRKPlayerItem)initWithDictionary:(id)a3 resourceLoaderHelper:(id)a4 contentKeyHelper:(id)a5 options:(id)a6;
- (BOOL)enabledStateForTrackWithID:(int)a3;
- (BOOL)expectsSecureStop;
- (BOOL)isAudioOnly;
- (CGSize)naturalSize;
- (NSDate)startDate;
- (NSString)UUIDString;
- (id)UUIDOnlyDictionaryRepresentation;
- (id)description;
- (id)outOfBandAlternateTracks;
- (id)playbackAccessLog;
- (id)playbackErrorLog;
- (id)selectedMediaArray;
- (int64_t)actionAtItemEnd;
- (void)setActionAtItemEnd:(int64_t)a3;
- (void)setEnabledState:(BOOL)a3 forTrackWithID:(int)a4;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartPosition:(id *)a3;
- (void)setTextStyleRulesUsingArray:(id)a3;
- (void)setUUIDString:(id)a3;
@end

@implementation APRKPlayerItem

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_UUIDString];
}

+ (id)UUIDFromItemDictionary:(id)a3
{
  return (id)[a3 objectForKey:*MEMORY[0x263F01398]];
}

- (APRKPlayerItem)initWithDictionary:(id)a3 resourceLoaderHelper:(id)a4 contentKeyHelper:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = [v10 objectForKey:*MEMORY[0x263F01398]];
    if (v14)
    {
      memset(&v59, 0, sizeof(v59));
      v15 = [MEMORY[0x263EFF9A0] dictionary];
      v16 = [v10 objectForKey:*MEMORY[0x263F01358]];
      uint64_t v17 = [v16 integerValue];

      v18 = [NSNumber numberWithUnsignedInteger:v17];
      [v15 setObject:v18 forKey:*MEMORY[0x263EFA2A8]];

      uint64_t v19 = [v10 objectForKey:*MEMORY[0x263F01338]];
      if (v19) {
        [v15 setObject:v19 forKey:*MEMORY[0x263EFA278]];
      }
      v54 = (void *)v19;
      v20 = [v10 objectForKey:*MEMORY[0x263F01318]];
      v21 = NSNumber;
      v53 = v20;
      if (v20) {
        uint64_t v22 = [v20 BOOLValue];
      }
      else {
        uint64_t v22 = 0;
      }
      v24 = [v21 numberWithBool:v22];
      [v15 setObject:v24 forKey:*MEMORY[0x263EFA260]];

      if (v13) {
        [v15 addEntriesFromDictionary:v13];
      }
      v25 = [v10 objectForKey:*MEMORY[0x263F01310]];
      v26 = +[APRKReachability reachabilityForInternetConnection];
      uint64_t v27 = [v26 currentReachabilityStatus];

      if ((v25 && v27
         || ([v10 objectForKey:*MEMORY[0x263F012F8]],
             uint64_t v28 = objc_claimAutoreleasedReturnValue(),
             v25,
             (v25 = (void *)v28) != 0))
        && ([NSURL URLWithString:v25], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v30 = (void *)v29;
        uint64_t v31 = [objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v29 options:v15];
        v50 = v30;
        id v51 = v11;
        v52 = (void *)v31;
        if (v31)
        {
          v32 = (void *)v31;
          [v11 registerAVURLAsset:v31];
          [v12 registerAVURLAsset:v32];
          v33 = [v10 objectForKey:*MEMORY[0x263F012C8]];

          if (v33)
          {
            uint64_t v34 = [v33 longValue];
            v35 = [v32 resourceLoader];
            [v35 setAllowedCommonMediaClientDataKeys:v34];

            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              uint64_t v49 = [v33 longValue];
              LogPrintF();
            }
            v30 = v50;
          }
        }
        else
        {
          [v12 registerAVURLAsset:0];
          v33 = v25;
        }
        v58.receiver = self;
        v58.super_class = (Class)APRKPlayerItem;
        v37 = -[APRKPlayerItem initWithAsset:](&v58, sel_initWithAsset_, v52, v49);
        v38 = v37;
        if (v37)
        {
          [(APRKPlayerItem *)v37 setUUIDString:v14];
          objc_storeStrong((id *)&v38->_contentLocation, v30);
          CFDictionaryRef v39 = [v10 objectForKey:*MEMORY[0x263F01448]];

          if (v39)
          {
            CMTimeMakeFromDictionary(&v59, v39);
            CMTime v57 = v59;
            [(APRKPlayerItem *)v38 setForwardPlaybackEndTime:&v57];
          }
          CFDictionaryRef v40 = [v10 objectForKey:*MEMORY[0x263F01478]];

          if (v40)
          {
            CMTimeMakeFromDictionary(&v56, v40);
            CMTime v59 = v56;
            CMTime v55 = v56;
            [(APRKPlayerItem *)v38 setReversePlaybackEndTime:&v55];
          }
          v41 = [v10 objectForKey:*MEMORY[0x263F01370]];

          if (v41) {
            objc_storeStrong((id *)&v38->_startDate, v41);
          }
          CFDictionaryRef v42 = [v10 objectForKey:*MEMORY[0x263F01378]];

          if (v42)
          {
            CMTimeMakeFromDictionary(&v56, v42);
            long long v43 = *(_OWORD *)&v56.value;
            v38->_startPosition.epoch = v56.epoch;
            *(_OWORD *)&v38->_startPosition.value = v43;
          }
          v44 = [v10 objectForKey:*MEMORY[0x263F01170]];

          if (v44) {
            v38->_expectsSecureStop = [v44 BOOLValue];
          }
          v45 = [v10 objectForKey:*MEMORY[0x263F01420]];

          if (v45) {
            v38->_isAudioOnly = [v45 BOOLValue];
          }
          v46 = [v10 objectForKey:*MEMORY[0x263F01418]];

          v38->_actionAtItemEnd = (int64_t)v46;
          v47 = [v10 objectForKey:*MEMORY[0x263F01488]];

          if (v47) {
            [(APRKPlayerItem *)v38 setTextStyleRulesUsingArray:v47];
          }
          v33 = [v10 objectForKey:*MEMORY[0x263F01340]];

          if (v33) {
            -[APRKPlayerItem setRestrictions:](v38, "setRestrictions:", [v33 integerValue]);
          }
          v30 = v50;
        }
        self = v38;

        v25 = v33;
        v23 = self;
        v36 = v53;
        id v11 = v51;
      }
      else
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v23 = 0;
        v36 = v53;
      }
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)outOfBandAlternateTracks
{
  return self->_outOfBandAlternateTracks;
}

- (id)playbackAccessLog
{
  v2 = [(APRKPlayerItem *)self accessLog];
  v3 = [v2 _accessLogArray];

  return v3;
}

- (id)playbackErrorLog
{
  v2 = [(APRKPlayerItem *)self errorLog];
  v3 = [v2 _errorLogArray];

  return v3;
}

- (id)UUIDOnlyDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setValue:self->_UUIDString forKey:*MEMORY[0x263F01398]];
  return v3;
}

- (void)setTextStyleRulesUsingArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v14 = self;
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(MEMORY[0x263EFA8B0], "textStyleRuleWithTextMarkupAttributes:", v11, v13);
          if (v12)
          {
            [v5 addObject:v12];
            if (gLogCategory_AirPlayReceiverKit <= 10
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              id v13 = [v12 debugDescription];
              LogPrintF();
            }
          }
          else if (gLogCategory_AirPlayReceiverKit <= 60 {
                 && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          }
          {
            id v13 = v11;
            LogPrintF();
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      [(APRKPlayerItem *)v14 setTextStyleRules:v5];
    }
  }
}

- (BOOL)enabledStateForTrackWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = [(APRKPlayerItem *)self asset];

  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    uint64_t v8 = [(APRKPlayerItem *)self asset];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__APRKPlayerItem_enabledStateForTrackWithID___block_invoke;
    v12[3] = &unk_264EA2010;
    v14 = &v15;
    uint64_t v9 = v6;
    id v13 = v9;
    [v8 loadTrackWithTrackID:v3 completionHandler:v12];

    if (dispatch_semaphore_wait(v9, v7)
      && gLogCategory_AirPlayReceiverKit <= 60
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  char v10 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v10;
}

intptr_t __45__APRKPlayerItem_enabledStateForTrackWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isEnabled];
  }
  id v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (void)setEnabledState:(BOOL)a3 forTrackWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_time_t v7 = [(APRKPlayerItem *)self asset];

  if (v7)
  {
    uint64_t v8 = [(APRKPlayerItem *)self asset];
    uint64_t v9 = [v8 trackWithTrackID:v4];

    if (v9)
    {
      [(APRKPlayerItem *)self tracks];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            long long v16 = objc_msgSend(v15, "assetTrack", (void)v18);
            int v17 = [v16 isEqual:v9];

            if (v17)
            {
              [v15 setEnabled:v5];
              goto LABEL_13;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
}

- (id)selectedMediaArray
{
  v2 = [(APRKPlayerItem *)self currentMediaSelection];
  uint64_t v3 = [v2 propertyList];

  return v3;
}

- (CGSize)naturalSize
{
  v2 = [(APRKPlayerItem *)self asset];
  uint64_t v3 = [v2 tracksWithMediaType:*MEMORY[0x263EF9D48]];

  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    [v4 naturalSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (int64_t)actionAtItemEnd
{
  return self->_actionAtItemEnd;
}

- (void)setActionAtItemEnd:(int64_t)a3
{
  self->_actionAtItemEnd = a3;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)expectsSecureStop
{
  return self->_expectsSecureStop;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startPosition
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setStartPosition:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startPosition.value = *(_OWORD *)&a3->var0;
  self->_startPosition.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_outOfBandAlternateTracks, 0);
  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end