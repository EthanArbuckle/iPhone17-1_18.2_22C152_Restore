@interface MCMXPCMessageUserManagedAssetsPath
- (BOOL)createIfNecessary;
- (BOOL)isRelative;
- (MCMXPCMessageUserManagedAssetsPath)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageUserManagedAssetsPath

- (MCMXPCMessageUserManagedAssetsPath)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  xpc_dictionary_set_uint64(v8, "ContainerClass", 2uLL);
  v12.receiver = self;
  v12.super_class = (Class)MCMXPCMessageUserManagedAssetsPath;
  v10 = [(MCMXPCMessageWithContainerBase *)&v12 initWithXPCObject:v8 context:v9 error:a5];

  if (v10)
  {
    v10->_relative = xpc_dictionary_get_BOOL(v8, "IsRelative");
    v10->_createIfNecessary = xpc_dictionary_get_BOOL(v8, "CreateIfNecessary");
  }

  return v10;
}

- (BOOL)isRelative
{
  return self->_relative;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

@end