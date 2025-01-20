@interface MPCreateRadioStationCommandEvent
- (BOOL)isRequestingPlaybackInitialization;
- (MPCreateRadioStationCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSNumber)privateListeningOverride;
- (NSURL)stationURL;
@end

@implementation MPCreateRadioStationCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);

  objc_storeStrong((id *)&self->_stationURL, 0);
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (BOOL)isRequestingPlaybackInitialization
{
  return self->_requestingPlaybackInitialization;
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (MPCreateRadioStationCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCreateRadioStationCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v16 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F777C8]];
    v11 = (void *)[v10 copy];

    if ([v11 length])
    {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      stationURL = v9->_stationURL;
      v9->_stationURL = (NSURL *)v12;
    }
    v14 = [v8 objectForKey:*MEMORY[0x1E4F77790]];
    v9->_requestingPlaybackInitialization = [v14 BOOLValue];
  }
  return v9;
}

@end