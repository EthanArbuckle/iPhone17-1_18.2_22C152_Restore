@interface LPiTunesMediaOffer
+ (BOOL)hasAudioForOffer:(id)a3;
+ (BOOL)hasVideoForOffer:(id)a3;
+ (id)previewURLForOffer:(id)a3;
+ (id)typeForOffer:(id)a3;
- (BOOL)hasAudio;
- (BOOL)hasVideo;
- (LPiTunesMediaOffer)initWithDictionary:(id)a3;
- (NSString)type;
- (NSURL)previewURL;
@end

@implementation LPiTunesMediaOffer

- (LPiTunesMediaOffer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPiTunesMediaOffer;
  v5 = [(LPiTunesMediaOffer *)&v12 init];
  if (v5
    && (+[LPiTunesMediaOffer typeForOffer:v4],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        type = v5->_type,
        v5->_type = (NSString *)v6,
        type,
        v5->_type))
  {
    uint64_t v8 = +[LPiTunesMediaOffer previewURLForOffer:v4];
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v8;

    v5->_hasAudio = +[LPiTunesMediaOffer hasAudioForOffer:v4];
    v5->_hasVideo = +[LPiTunesMediaOffer hasVideoForOffer:v4];
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)hasAudioForOffer:(id)a3
{
  return hasAssetWithFlavorContainingCaseInsensitiveString(a3, @"audio");
}

+ (BOOL)hasVideoForOffer:(id)a3
{
  return hasAssetWithFlavorContainingCaseInsensitiveString(a3, @"video");
}

+ (id)previewURLForOffer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v3 = [v20 objectForKeyedSubscript:@"assets"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    id v6 = 0;
    if (v5)
    {
      uint64_t v7 = *(void *)v22;
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            objc_super v12 = [v11 objectForKeyedSubscript:@"flavor"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = [&unk_1EF712978 indexOfObject:v12];
              if (v13 < v8)
              {
                id v14 = v11;
                v15 = v6;
                id v6 = v14;

                uint64_t v8 = v13;
              }
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);
    }

    if (v6)
    {
      v16 = [v6 objectForKeyedSubscript:@"preview"];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v17 = [v16 objectForKeyedSubscript:@"url"];
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
        }
        else
        {
          v18 = 0;
        }
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)typeForOffer:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"type"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_previewURL, 0);
}

@end