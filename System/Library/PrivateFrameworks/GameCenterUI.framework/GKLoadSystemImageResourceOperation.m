@interface GKLoadSystemImageResourceOperation
- (GKLoadSystemImageResourceOperation)initWithSystemImageName:(id)a3;
- (NSString)systemImageName;
- (void)main;
@end

@implementation GKLoadSystemImageResourceOperation

- (GKLoadSystemImageResourceOperation)initWithSystemImageName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLoadSystemImageResourceOperation;
  v5 = [(GKLoadSystemImageResourceOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;
  }
  return v5;
}

- (void)main
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (([(GKLoadSystemImageResourceOperation *)self isCancelled] & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E4FB1818];
    id v4 = [(GKLoadSystemImageResourceOperation *)self systemImageName];
    v5 = [v3 _systemImageNamed:v4];

    if (v5)
    {
      [(GKLoadResourceOperation *)self didCompleteWithResource:v5 error:0];
    }
    else if (([(GKLoadSystemImageResourceOperation *)self isCancelled] & 1) == 0)
    {
      uint64_t v6 = NSString;
      v7 = [(GKLoadSystemImageResourceOperation *)self systemImageName];
      v8 = [v6 stringWithFormat:@"No system image found for %@", v7];

      objc_super v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = v8;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v11 = [v9 errorWithDomain:@"GKLoadSystemImageResourceOperation" code:560557415 userInfo:v10];

      [(GKLoadResourceOperation *)self didCompleteWithResource:0 error:v11];
    }
  }
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
}

@end