@interface MPVocalsControlCommandEvent
- (MPVocalsControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSNumber)active;
- (NSNumber)level;
@end

@implementation MPVocalsControlCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);

  objc_storeStrong((id *)&self->_active, 0);
}

- (NSNumber)level
{
  return self->_level;
}

- (NSNumber)active
{
  return self->_active;
}

- (MPVocalsControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPVocalsControlCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v15 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F777E8]];
    active = v9->_active;
    v9->_active = (NSNumber *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F777F0]];
    level = v9->_level;
    v9->_level = (NSNumber *)v12;
  }
  return v9;
}

@end