@interface MCMXPCMessageFlushContainerCache
- (BOOL)transient;
- (MCMXPCMessageFlushContainerCache)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageFlushContainerCache

- (BOOL)transient
{
  return self->_transient;
}

- (MCMXPCMessageFlushContainerCache)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageFlushContainerCache;
  v9 = [(MCMXPCMessageWithContainerClassBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9) {
    v9->_transient = xpc_dictionary_get_BOOL(v8, "Transient");
  }

  return v9;
}

@end