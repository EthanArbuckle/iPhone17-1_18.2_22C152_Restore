@interface CSAudioStreamHoldRequestOption
+ (id)defaultOptionWithTimeout:(double)a3;
- (BOOL)requireListeningMicIndicatorLock;
- (BOOL)requireRecordModeLock;
- (CSAudioStreamHoldRequestOption)initWithTimeout:(double)a3 clientIdentity:(unint64_t)a4 requireRecordModeLock:(BOOL)a5 requireListeningMicIndicatorLock:(BOOL)a6;
- (CSAudioStreamHoldRequestOption)initWithXPCObject:(id)a3;
- (double)timeout;
- (id)xpcObject;
- (unint64_t)clientIdentity;
@end

@implementation CSAudioStreamHoldRequestOption

- (BOOL)requireListeningMicIndicatorLock
{
  return self->_requireListeningMicIndicatorLock;
}

- (BOOL)requireRecordModeLock
{
  return self->_requireRecordModeLock;
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (id)xpcObject
{
  keys[4] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "timeout";
  keys[1] = "clientIdentity";
  keys[2] = "requireRecordModeLock";
  keys[3] = "requireListeningMicIndicatorLock";
  values[0] = xpc_double_create(self->_timeout);
  values[1] = xpc_uint64_create(self->_clientIdentity);
  values[2] = xpc_BOOL_create(self->_requireRecordModeLock);
  values[3] = xpc_BOOL_create(self->_requireListeningMicIndicatorLock);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  for (uint64_t i = 3; i != -1; --i)

  return v3;
}

- (CSAudioStreamHoldRequestOption)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSAudioStreamHoldRequestOption;
  v5 = [(CSAudioStreamHoldRequestOption *)&v7 init];
  if (v5)
  {
    v5->_timeout = xpc_dictionary_get_double(v4, "timeout");
    v5->_clientIdentity = xpc_dictionary_get_uint64(v4, "clientIdentity");
    v5->_requireRecordModeLock = xpc_dictionary_get_BOOL(v4, "requireRecordModeLock");
    v5->_requireListeningMicIndicatorLock = xpc_dictionary_get_BOOL(v4, "requireListeningMicIndicatorLock");
  }

  return v5;
}

- (CSAudioStreamHoldRequestOption)initWithTimeout:(double)a3 clientIdentity:(unint64_t)a4 requireRecordModeLock:(BOOL)a5 requireListeningMicIndicatorLock:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CSAudioStreamHoldRequestOption;
  result = [(CSAudioStreamHoldRequestOption *)&v11 init];
  if (result)
  {
    result->_timeout = a3;
    result->_clientIdentity = a4;
    result->_requireRecordModeLock = a5;
    result->_requireListeningMicIndicatorLock = a6;
  }
  return result;
}

+ (id)defaultOptionWithTimeout:(double)a3
{
  xpc_object_t v3 = [[CSAudioStreamHoldRequestOption alloc] initWithTimeout:0 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:a3];
  return v3;
}

@end