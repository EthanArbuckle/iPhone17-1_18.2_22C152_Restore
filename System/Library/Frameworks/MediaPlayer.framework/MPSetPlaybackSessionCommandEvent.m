@interface MPSetPlaybackSessionCommandEvent
- (MPSetPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSData)playbackSessionData;
- (NSString)identifier;
- (NSString)type;
@end

@implementation MPSetPlaybackSessionCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPSetPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MPSetPlaybackSessionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v20 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F77700]];
    uint64_t v11 = MRPlaybackSessionCreateFromExternalRepresentation();
    if (v11)
    {
      v12 = (const void *)v11;
      uint64_t v13 = MRPlaybackSessionCopyIdentifier();
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v13;

      uint64_t v15 = MRPlaybackSessionCopyType();
      type = v9->_type;
      v9->_type = (NSString *)v15;

      uint64_t v17 = MRPlaybackSessionCopyPlaybackSessionData();
      playbackSessionData = v9->_playbackSessionData;
      v9->_playbackSessionData = (NSData *)v17;

      CFRelease(v12);
    }
  }
  return v9;
}

@end