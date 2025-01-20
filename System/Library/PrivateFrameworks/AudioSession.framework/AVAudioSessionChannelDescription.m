@interface AVAudioSessionChannelDescription
+ (id)privateCreate:(id)a3 portUID:(id)a4 channelNumber:(unsigned int)a5;
+ (id)privateCreateArray:(id)a3 portUID:(id)a4;
- (AVAudioSessionChannelDescription)init;
- (AudioChannelLabel)channelLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (ChannelDescriptionImpl)privateGetImplementation;
- (NSString)channelName;
- (NSString)owningPortUID;
- (NSUInteger)channelNumber;
- (id)description;
- (void)dealloc;
@end

@implementation AVAudioSessionChannelDescription

+ (id)privateCreateArray:(id)a3 portUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (uint64_t v7 = [v5 count]) != 0)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    uint64_t v9 = 0;
    do
    {
      v10 = [v5 objectAtIndex:v9];
      uint64_t v11 = v9 + 1;
      id v12 = +[AVAudioSessionChannelDescription privateCreate:v10 portUID:v6 channelNumber:v9 + 1];
      if (v12) {
        [v8 insertObject:v12 atIndex:v9];
      }

      ++v9;
    }
    while (v7 != v11);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)privateCreate:(id)a3 portUID:(id)a4 channelNumber:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (as::client *)a4;
  uint64_t v9 = v8;
  if (v7)
  {
    v10 = objc_alloc_init(AVAudioSessionChannelDescription);
    uint64_t v11 = [(AVAudioSessionChannelDescription *)v10 privateGetImplementation];
    id v12 = (id)*MEMORY[0x1E4F76838];
    v13 = [v7 objectForKey:v12];

    id v14 = (id)*MEMORY[0x1E4F76830];
    v15 = [v7 objectForKey:v14];

    if (v13)
    {
      uint64_t v16 = [[NSString alloc] initWithString:v13];
      v17 = *(void **)v11;
      *(void *)uint64_t v11 = v16;
    }
    if (v9)
    {
      uint64_t v18 = [[NSString alloc] initWithString:v9];
      v19 = *(void **)(v11 + 8);
      *(void *)(v11 + 8) = v18;
    }
    if (v15) {
      *(_DWORD *)(v11 + 20) = [v15 unsignedIntValue];
    }
    *(_DWORD *)(v11 + 16) = a5;
  }
  else
  {
    v20 = *(id *)as::client::gSessionClientLog(v8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      v23 = "AVAudioSessionChannelImpl.mm";
      __int16 v24 = 1024;
      int v25 = 133;
      _os_log_impl(&dword_1A169D000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected nil channel description", (uint8_t *)&v22, 0x12u);
    }
    v10 = 0;
  }

  return v10;
}

- (ChannelDescriptionImpl)privateGetImplementation
{
  return (ChannelDescriptionImpl *)self->_impl;
}

- (AVAudioSessionChannelDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioSessionChannelDescription;
  if ([(AVAudioSessionChannelDescription *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A6235030](impl, 0x1080C40CC6EE3FDLL);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionChannelDescription;
  [(AVAudioSessionChannelDescription *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AVAudioSessionChannelDescription *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(AVAudioSessionChannelDescription *)self isEqualToChannel:v5];

  return v6;
}

- (BOOL)isEqualToChannel:(id)a3
{
  objc_super v4 = (AVAudioSessionChannelDescription *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    id v5 = [(AVAudioSessionChannelDescription *)self channelName];
    BOOL v6 = [(AVAudioSessionChannelDescription *)v4 channelName];
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) != 0
      && ([(AVAudioSessionChannelDescription *)self owningPortUID],
          v8 = objc_claimAutoreleasedReturnValue(),
          [(AVAudioSessionChannelDescription *)v4 owningPortUID],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v8 isEqualToString:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      NSUInteger v11 = [(AVAudioSessionChannelDescription *)self channelNumber];
      BOOL v12 = v11 == [(AVAudioSessionChannelDescription *)v4 channelNumber];
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (NSString)channelName
{
  return (NSString *)*(id *)self->_impl;
}

- (NSString)owningPortUID
{
  return (NSString *)*((id *)self->_impl + 1);
}

- (NSUInteger)channelNumber
{
  return *((unsigned int *)self->_impl + 4);
}

- (AudioChannelLabel)channelLabel
{
  return *((_DWORD *)self->_impl + 5);
}

- (id)description
{
  impl = self->_impl;
  objc_super v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  objc_msgSend(v4, "stringWithFormat:", @"<%@: %p, name = %@; label = %u (0x%x); number = %d; port UID = %@>",
    v6,
    self,
    *impl,
    *((unsigned int *)impl + 5),
    *((unsigned int *)impl + 5),
    *((unsigned int *)impl + 4),
  char v7 = impl[1]);

  return v7;
}

@end