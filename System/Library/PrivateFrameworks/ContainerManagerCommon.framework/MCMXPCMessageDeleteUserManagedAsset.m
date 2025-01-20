@interface MCMXPCMessageDeleteUserManagedAsset
- (MCMXPCMessageDeleteUserManagedAsset)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)sourceRelativePath;
@end

@implementation MCMXPCMessageDeleteUserManagedAsset

- (void).cxx_destruct
{
  p_sourceRelativePath = &self->_sourceRelativePath;

  objc_storeStrong((id *)p_sourceRelativePath, 0);
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (MCMXPCMessageDeleteUserManagedAsset)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  xpc_dictionary_set_uint64(v8, "ContainerClass", 2uLL);
  v14.receiver = self;
  v14.super_class = (Class)MCMXPCMessageDeleteUserManagedAsset;
  v10 = [(MCMXPCMessageWithContainerBase *)&v14 initWithXPCObject:v8 context:v9 error:a5];

  if (v10)
  {
    uint64_t v11 = [(MCMXPCMessageBase *)v10 nsStringValueFromXPCObject:v8 key:"SourcePath"];
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    if (!v10->_sourceRelativePath)
    {
      if (a5) {
        *a5 = 11;
      }

      v10 = 0;
    }
  }

  return v10;
}

@end