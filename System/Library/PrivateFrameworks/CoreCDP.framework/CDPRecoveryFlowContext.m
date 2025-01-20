@interface CDPRecoveryFlowContext
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPeersForRemoteApproval;
- (BOOL)isWalrusEnabled;
- (CDPContext)context;
- (CDPRecoveryFlowContext)initWithCoder:(id)a3;
- (double)rpdProbationDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasPeersForRemoteApproval:(BOOL)a3;
- (void)setIsWalrusEnabled:(BOOL)a3;
- (void)setRpdProbationDuration:(double)a3;
@end

@implementation CDPRecoveryFlowContext

- (CDPRecoveryFlowContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CDPRecoveryFlowContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (CDPContext *)v6;

    v5->_hasPeersForRemoteApproval = [v4 decodeBoolForKey:@"_hasPeersForRemoteApproval"];
    v5->_isWalrusEnabled = [v4 decodeBoolForKey:@"_isWalrusEnabled"];
    [v4 decodeFloatForKey:@"_rpdProbationDuration"];
    v5->_rpdProbationDuration = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  context = self->_context;
  id v6 = a3;
  [v6 encodeObject:context forKey:@"_context"];
  [v6 encodeBool:self->_hasPeersForRemoteApproval forKey:@"_hasPeersForRemoteApproval"];
  [v6 encodeBool:self->_isWalrusEnabled forKey:@"_isWalrusEnabled"];
  double rpdProbationDuration = self->_rpdProbationDuration;
  *(float *)&double rpdProbationDuration = rpdProbationDuration;
  [v6 encodeFloat:@"_rpdProbationDuration" forKey:rpdProbationDuration];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CDPRecoveryFlowContext);
  uint64_t v5 = [(CDPContext *)self->_context copy];
  context = v4->_context;
  v4->_context = (CDPContext *)v5;

  v4->_hasPeersForRemoteApproval = self->_hasPeersForRemoteApproval;
  v4->_isWalrusEnabled = self->_isWalrusEnabled;
  v4->_double rpdProbationDuration = self->_rpdProbationDuration;
  return v4;
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)hasPeersForRemoteApproval
{
  return self->_hasPeersForRemoteApproval;
}

- (void)setHasPeersForRemoteApproval:(BOOL)a3
{
  self->_hasPeersForRemoteApproval = a3;
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (double)rpdProbationDuration
{
  return self->_rpdProbationDuration;
}

- (void)setRpdProbationDuration:(double)a3
{
  self->_double rpdProbationDuration = a3;
}

- (void).cxx_destruct
{
}

@end