@interface MCMXPCMessageCrashTest
- (MCMXPCMessageCrashTest)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unint64_t)crashCount;
- (unint64_t)setTestLocks;
@end

@implementation MCMXPCMessageCrashTest

- (unint64_t)setTestLocks
{
  return self->_setTestLocks;
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (MCMXPCMessageCrashTest)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageCrashTest;
  v9 = [(MCMXPCMessageBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    v9->_crashCount = xpc_dictionary_get_uint64(v8, "NumRetryCrashes");
    v9->_setTestLocks = xpc_dictionary_get_uint64(v8, "TestLock");
  }

  return v9;
}

@end