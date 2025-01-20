@interface MCMXPCMessageSetTestLock
- (BOOL)enable;
- (MCMXPCMessageSetTestLock)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unint64_t)requestedLocks;
@end

@implementation MCMXPCMessageSetTestLock

- (BOOL)enable
{
  return self->_enable;
}

- (unint64_t)requestedLocks
{
  return self->_requestedLocks;
}

- (MCMXPCMessageSetTestLock)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageSetTestLock;
  v9 = [(MCMXPCMessageBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    v9->_requestedLocks = xpc_dictionary_get_uint64(v8, "TestLock");
    v9->_enable = xpc_dictionary_get_BOOL(v8, "Enable");
  }

  return v9;
}

@end