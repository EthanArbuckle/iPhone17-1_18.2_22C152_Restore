@interface MCMXPCMessageDeletePluginDataContainerContents
- (MCMXPCMessageDeletePluginDataContainerContents)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageDeletePluginDataContainerContents

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageDeletePluginDataContainerContents;
  unsigned int v2 = [(MCMXPCMessageWithContainerBase *)&v5 disposition];
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 dispositionForContainerClass:4];
  }
  return v2;
}

- (MCMXPCMessageDeletePluginDataContainerContents)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  xpc_dictionary_set_uint64(v9, "ContainerClass", 4uLL);
  v12.receiver = self;
  v12.super_class = (Class)MCMXPCMessageDeletePluginDataContainerContents;
  v10 = [(MCMXPCMessageWithContainerBase *)&v12 initWithXPCObject:v9 context:v8 error:a5];

  return v10;
}

@end