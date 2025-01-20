@interface HSLoginRequest
+ (id)supportedVideoQualities;
- (HSLoginRequest)init;
- (HSLoginRequest)initWithAction:(id)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation HSLoginRequest

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[HSResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  v5 = +[HSResponseDataParser parseResponseData:v4];

  objc_msgSend(v3, "setSessionID:", objc_msgSend(v5, "unsignedIntValue"));
  return v3;
}

- (HSLoginRequest)initWithAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HSLoginRequest;
  v3 = [(HSRequest *)&v19 initWithAction:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F089D8] string];
    v5 = [(id)objc_opt_class() supportedVideoQualities];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          uint64_t v11 = [v4 length];
          uint64_t v12 = [v10 intValue];
          if (v11) {
            v13 = @",%d";
          }
          else {
            v13 = @"%d";
          }
          objc_msgSend(v4, "appendFormat:", v13, v12);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }
    [(HSRequest *)v3 setValue:v4 forArgument:@"preferredVideoQuality"];
  }
  return v3;
}

- (HSLoginRequest)init
{
  return [(HSLoginRequest *)self initWithAction:@"login"];
}

+ (id)supportedVideoQualities
{
  if (supportedVideoQualities_onceToken != -1) {
    dispatch_once(&supportedVideoQualities_onceToken, &__block_literal_global_1927);
  }
  v2 = (void *)__videoQualities;
  return v2;
}

void __41__HSLoginRequest_supportedVideoQualities__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  v1 = (void *)__videoQualities;
  __videoQualities = (uint64_t)v0;

  MSVGetMaximumScreenSize();
  if (v2 >= v3) {
    double v4 = v3;
  }
  else {
    double v4 = v2;
  }
  if (v4 > 720.0)
  {
    v5 = (void *)__videoQualities;
    uint64_t v6 = [NSNumber numberWithInt:2];
    [v5 addObject:v6];
  }
  if (v4 > 480.0)
  {
    uint64_t v7 = (void *)__videoQualities;
    uint64_t v8 = [NSNumber numberWithInt:1];
    [v7 addObject:v8];
  }
  uint64_t v9 = (void *)__videoQualities;
  id v10 = [NSNumber numberWithInt:0];
  [v9 addObject:v10];
}

@end