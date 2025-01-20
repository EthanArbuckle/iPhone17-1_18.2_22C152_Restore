@interface CSAudioStreamHolding
- (CSAudioStreamHolding)initWithName:(id)a3 clientIdentity:(unint64_t)a4;
- (NSString)listeningMicIndicatorLockUUIDString;
- (NSString)name;
- (NSString)recordModeLockUUIDString;
- (unint64_t)clientIdentity;
- (void)dealloc;
- (void)setListeningMicIndicatorLockUUIDString:(id)a3;
- (void)setRecordModeLockUUIDString:(id)a3;
@end

@implementation CSAudioStreamHolding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningMicIndicatorLockUUIDString, 0);
  objc_storeStrong((id *)&self->_recordModeLockUUIDString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setListeningMicIndicatorLockUUIDString:(id)a3
{
}

- (NSString)listeningMicIndicatorLockUUIDString
{
  return self->_listeningMicIndicatorLockUUIDString;
}

- (void)setRecordModeLockUUIDString:(id)a3
{
}

- (NSString)recordModeLockUUIDString
{
  return self->_recordModeLockUUIDString;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(CSAudioStreamHolding *)self name];
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioStreamHolding dealloc]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Dealloc audioStreamHolding : %{public}@", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioStreamHolding;
  [(CSAudioStreamHolding *)&v6 dealloc];
}

- (CSAudioStreamHolding)initWithName:(id)a3 clientIdentity:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAudioStreamHolding;
  v8 = [(CSAudioStreamHolding *)&v11 init];
  __int16 v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_clientIdentity = a4;
  }

  return v9;
}

@end