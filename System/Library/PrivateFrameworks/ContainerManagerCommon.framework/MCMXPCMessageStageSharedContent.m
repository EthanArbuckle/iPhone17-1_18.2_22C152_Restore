@interface MCMXPCMessageStageSharedContent
- (MCMXPCMessageStageSharedContent)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)destinationRelativePath;
- (NSString)sourceRelativePath;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageStageSharedContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRelativePath, 0);

  objc_storeStrong((id *)&self->_sourceRelativePath, 0);
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageStageSharedContent;
  unsigned int v2 = [(MCMXPCMessageBase *)&v5 disposition];
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 dispositionForContainerClass:13];
  }
  return v2;
}

- (MCMXPCMessageStageSharedContent)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMXPCMessageStageSharedContent;
  v9 = [(MCMXPCMessageWithIdentifierBase *)&v16 initWithXPCObject:v8 context:a4 error:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(MCMXPCMessageBase *)v9 nsStringValueFromXPCObject:v8 key:"SourcePath"];
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    uint64_t v13 = [(MCMXPCMessageBase *)v10 nsStringValueFromXPCObject:v8 key:"DestPath"];
    destinationRelativePath = v10->_destinationRelativePath;
    v10->_destinationRelativePath = (NSString *)v13;
  }
  return v10;
}

@end