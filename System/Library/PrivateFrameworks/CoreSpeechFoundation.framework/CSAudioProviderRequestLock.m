@interface CSAudioProviderRequestLock
- (CSAudioProviderRequestLock)initWithClientIdentity:(unint64_t)a3;
- (NSString)UUIDString;
- (unint64_t)clientIdentity;
@end

@implementation CSAudioProviderRequestLock

- (void).cxx_destruct
{
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (CSAudioProviderRequestLock)initWithClientIdentity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSAudioProviderRequestLock;
  v4 = [(CSAudioProviderRequestLock *)&v9 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    UUIDString = v4->_UUIDString;
    v4->_UUIDString = (NSString *)v6;

    v4->_clientIdentity = a3;
  }
  return v4;
}

@end