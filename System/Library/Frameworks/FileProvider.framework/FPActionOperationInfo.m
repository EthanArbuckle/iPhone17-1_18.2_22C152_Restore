@interface FPActionOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)_t_clearItemURLs;
- (BOOL)_t_clientDrivenReader;
- (BOOL)attachSandboxExtensionsOnXPCEncoding;
- (FPActionOperationInfo)initWithCoder:(id)a3;
- (FPActionOperationInfo)initWithOperationID:(id)a3 roots:(id)a4;
- (NSArray)roots;
- (NSString)operationID;
- (unint64_t)_t_moveQueueWidth;
- (unsigned)qos;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachSandboxExtensionsOnXPCEncoding:(BOOL)a3;
- (void)setOperationID:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)setRoots:(id)a3;
- (void)set_t_clearItemURLs:(BOOL)a3;
- (void)set_t_clientDrivenReader:(BOOL)a3;
- (void)set_t_moveQueueWidth:(unint64_t)a3;
@end

@implementation FPActionOperationInfo

- (FPActionOperationInfo)initWithOperationID:(id)a3 roots:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPActionOperationInfo;
  v9 = [(FPActionOperationInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationID, a3);
    objc_storeStrong((id *)&v10->_roots, a4);
    v10->_qos = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPActionOperationInfo *)self attachSandboxExtensionsOnXPCEncoding])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_roots;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "attachSandboxExtensionOnXPCEncoding", (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_operationID, @"_operationID", (void)v10);
  [v4 encodeObject:self->_roots forKey:@"_roots"];
  [v4 encodeInteger:self->_qos forKey:@"_qos"];
  [v4 encodeInteger:self->__t_moveQueueWidth forKey:@"__t_moveQueueWidth"];
  [v4 encodeBool:self->__t_clientDrivenReader forKey:@"__t_clientDrivenReader"];
  [v4 encodeBool:self->__t_clearItemURLs forKey:@"__t_clearItemURLs"];
}

- (FPActionOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPActionOperationInfo;
  v5 = [(FPActionOperationInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_operationID"];
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    long long v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_roots"];
    roots = v5->_roots;
    v5->_roots = (NSArray *)v11;

    v5->_qos = [v4 decodeIntegerForKey:@"_qos"];
    v5->__t_moveQueueWidth = [v4 decodeIntegerForKey:@"__t_moveQueueWidth"];
    v5->__t_clientDrivenReader = [v4 decodeBoolForKey:@"__t_clientDrivenReader"];
    v5->__t_clearItemURLs = [v4 decodeBoolForKey:@"__t_clearItemURLs"];
  }

  return v5;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (NSArray)roots
{
  return self->_roots;
}

- (void)setRoots:(id)a3
{
}

- (BOOL)attachSandboxExtensionsOnXPCEncoding
{
  return self->_attachSandboxExtensionsOnXPCEncoding;
}

- (void)setAttachSandboxExtensionsOnXPCEncoding:(BOOL)a3
{
  self->_attachSandboxExtensionsOnXPCEncoding = a3;
}

- (unsigned)qos
{
  return self->_qos;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (unint64_t)_t_moveQueueWidth
{
  return self->__t_moveQueueWidth;
}

- (void)set_t_moveQueueWidth:(unint64_t)a3
{
  self->__t_moveQueueWidth = a3;
}

- (BOOL)_t_clientDrivenReader
{
  return self->__t_clientDrivenReader;
}

- (void)set_t_clientDrivenReader:(BOOL)a3
{
  self->__t_clientDrivenReader = a3;
}

- (BOOL)_t_clearItemURLs
{
  return self->__t_clearItemURLs;
}

- (void)set_t_clearItemURLs:(BOOL)a3
{
  self->__t_clearItemURLs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roots, 0);

  objc_storeStrong((id *)&self->_operationID, 0);
}

@end