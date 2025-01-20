@interface MCMXPCMessageWithContainerClassBase
- (MCMContainerConfiguration)containerConfig;
- (MCMXPCMessageWithContainerClassBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithContainerClassBase

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageWithContainerClassBase;
  unsigned int v3 = [(MCMXPCMessageBase *)&v6 disposition];
  if (v3 == 1)
  {
    v4 = [(MCMXPCMessageWithContainerClassBase *)self containerConfig];
    unsigned int v3 = [v4 disposition];
  }
  return v3;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (MCMXPCMessageWithContainerClassBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMXPCMessageWithContainerClassBase;
  v9 = [(MCMXPCMessageBase *)&v20 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    v10 = v9;
    xpc_dictionary_get_uint64(v8, "ContainerClass");
    uint64_t v11 = container_class_normalized();
    v12 = [(MCMXPCMessageBase *)v10 context];
    v13 = [v12 globalConfiguration];
    v14 = [v13 staticConfig];
    uint64_t v15 = [v14 configForContainerClass:v11];
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v15;

    v17 = v10->_containerConfig;
    if (v17)
    {
      if ([(MCMContainerConfiguration *)v17 supportedOnPlatform]) {
        goto LABEL_10;
      }
      unint64_t v18 = 72;
    }
    else
    {
      unint64_t v18 = 20;
    }
  }
  else
  {
    unint64_t v18 = 1;
  }
  v10 = 0;
  if (a5) {
    *a5 = v18;
  }
LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
  p_containerConfig = &self->_containerConfig;

  objc_storeStrong((id *)p_containerConfig, 0);
}

@end