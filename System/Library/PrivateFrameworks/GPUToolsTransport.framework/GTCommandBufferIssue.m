@interface GTCommandBufferIssue
+ (BOOL)supportsSecureCoding;
- (GTCommandBufferIssue)initWithCoder:(id)a3;
- (NSArray)faultingEncoders;
- (NSData)commandBufferCommitCallstackData;
- (NSString)metalLogMessage;
- (unsigned)commandBufferCommitCallstackFramesNum;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandBufferCommitCallstackData:(id)a3;
- (void)setCommandBufferCommitCallstackFramesNum:(unsigned int)a3;
- (void)setFaultingEncoders:(id)a3;
- (void)setMetalLogMessage:(id)a3;
@end

@implementation GTCommandBufferIssue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCommandBufferIssue)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTCommandBufferIssue;
  v5 = [(GTCommandBufferIssue *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalLogMessage"];
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandBufferCommitCallstackData"];
    commandBufferCommitCallstackData = v5->_commandBufferCommitCallstackData;
    v5->_commandBufferCommitCallstackData = (NSData *)v8;

    v5->_commandBufferCommitCallstackFramesNum = [v4 decodeInt32ForKey:@"commandBufferCommitCallstackFramesNum"];
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"faultingEncoders"];
    faultingEncoders = v5->_faultingEncoders;
    v5->_faultingEncoders = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  metalLogMessage = self->_metalLogMessage;
  id v5 = a3;
  [v5 encodeObject:metalLogMessage forKey:@"metalLogMessage"];
  [v5 encodeObject:self->_commandBufferCommitCallstackData forKey:@"commandBufferCommitCallstackData"];
  [v5 encodeInt32:self->_commandBufferCommitCallstackFramesNum forKey:@"commandBufferCommitCallstackFramesNum"];
  [v5 encodeObject:self->_faultingEncoders forKey:@"faultingEncoders"];
}

- (NSString)metalLogMessage
{
  return self->_metalLogMessage;
}

- (void)setMetalLogMessage:(id)a3
{
}

- (NSData)commandBufferCommitCallstackData
{
  return self->_commandBufferCommitCallstackData;
}

- (void)setCommandBufferCommitCallstackData:(id)a3
{
}

- (unsigned)commandBufferCommitCallstackFramesNum
{
  return self->_commandBufferCommitCallstackFramesNum;
}

- (void)setCommandBufferCommitCallstackFramesNum:(unsigned int)a3
{
  self->_commandBufferCommitCallstackFramesNum = a3;
}

- (NSArray)faultingEncoders
{
  return self->_faultingEncoders;
}

- (void)setFaultingEncoders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultingEncoders, 0);
  objc_storeStrong((id *)&self->_commandBufferCommitCallstackData, 0);
  objc_storeStrong((id *)&self->_metalLogMessage, 0);
}

@end