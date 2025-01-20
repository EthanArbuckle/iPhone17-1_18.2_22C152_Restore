@interface MPPlaybackSessionCommandEvent
- (MPPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSString)identifier;
- (NSString)revision;
- (int64_t)priority;
@end

@implementation MPPlaybackSessionCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)revision
{
  return self->_revision;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPPlaybackSessionCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v18 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77710]];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77728]];
    revision = v9->_revision;
    v9->_revision = (NSString *)v12;

    v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77720]];
    uint64_t v15 = [v14 integerValue];
    uint64_t v16 = v15 == 512;
    if (v15 == 1024) {
      uint64_t v16 = 2;
    }
    v9->_priority = v16;
  }
  return v9;
}

@end