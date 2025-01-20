@interface LPFetcherAudioResponse
+ (id)audioPropertiesForFetcher:(id)a3;
- (LPAudio)audio;
- (LPFetcherAudioResponse)initWithAudio:(id)a3 fetcher:(id)a4;
@end

@implementation LPFetcherAudioResponse

+ (id)audioPropertiesForFetcher:(id)a3
{
  v3 = objc_alloc_init(LPAudioProperties);

  return v3;
}

- (LPFetcherAudioResponse)initWithAudio:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherAudioResponse;
  v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audio, a3);
    v10 = v9;
  }

  return v9;
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
}

@end