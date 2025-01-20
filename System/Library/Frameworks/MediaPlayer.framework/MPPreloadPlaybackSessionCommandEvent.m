@interface MPPreloadPlaybackSessionCommandEvent
- (MPPreloadPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSDictionary)metadata;
- (NSString)identifier;
- (NSString)revision;
- (NSString)type;
- (NSURL)playbackSessionDataFilePath;
- (int64_t)priority;
@end

@implementation MPPreloadPlaybackSessionCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_playbackSessionDataFilePath, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSURL)playbackSessionDataFilePath
{
  return self->_playbackSessionDataFilePath;
}

- (NSString)revision
{
  return self->_revision;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPPreloadPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MPPreloadPlaybackSessionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v27 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77710]];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77730]];
    type = v9->_type;
    v9->_type = (NSString *)v12;

    v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77720]];
    uint64_t v15 = [v14 integerValue];
    uint64_t v16 = v15 == 512;
    if (v15 == 1024) {
      uint64_t v16 = 2;
    }
    v9->_priority = v16;

    v17 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77708]];
    if (![v17 length])
    {

      v25 = 0;
      goto LABEL_12;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:0];
    playbackSessionDataFilePath = v9->_playbackSessionDataFilePath;
    v9->_playbackSessionDataFilePath = (NSURL *)v18;

    uint64_t v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77728]];
    revision = v9->_revision;
    v9->_revision = (NSString *)v20;

    metadata = v9->_metadata;
    v9->_metadata = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v23 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77718]];
    if ([v23 length])
    {
      v24 = [MEMORY[0x1E4F28F98] propertyListWithData:v23 options:0 format:0 error:0];
      if (_NSIsNSDictionary()) {
        objc_storeStrong((id *)&v9->_metadata, v24);
      }
    }
  }
  v25 = v9;
LABEL_12:

  return v25;
}

@end