@interface DYGTMTLCaptureScopeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultCapturable;
- (DYGTMTLCaptureScopeInfo)initWithCoder:(id)a3;
- (NSString)label;
- (unint64_t)commandQueueStreamRef;
- (unint64_t)deviceAddress;
- (unint64_t)deviceStreamRef;
- (unint64_t)scopeAddress;
- (unint64_t)scopeStreamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandQueueStreamRef:(unint64_t)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setDeviceStreamRef:(unint64_t)a3;
- (void)setIsDefaultCapturable:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setScopeAddress:(unint64_t)a3;
- (void)setScopeStreamRef:(unint64_t)a3;
@end

@implementation DYGTMTLCaptureScopeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLCaptureScopeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYGTMTLCaptureScopeInfo;
  v5 = [(DYGTMTLCaptureScopeInfo *)&v9 init];
  if (v5)
  {
    v5->_deviceAddress = [v4 decodeInt64ForKey:@"deviceAddress"];
    v5->_deviceStreamRef = [v4 decodeInt64ForKey:@"deviceStreamRef"];
    v5->_commandQueueStreamRef = [v4 decodeInt64ForKey:@"commandQueueStreamRef"];
    v5->_scopeAddress = [v4 decodeInt64ForKey:@"scopeAddress"];
    v5->_scopeStreamRef = [v4 decodeInt64ForKey:@"scopeStreamRef"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_isDefaultCapturable = [v4 decodeBoolForKey:@"isDefaultCapturable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t deviceAddress = self->_deviceAddress;
  id v5 = a3;
  [v5 encodeInt64:deviceAddress forKey:@"deviceAddress"];
  [v5 encodeInt64:self->_deviceStreamRef forKey:@"deviceStreamRef"];
  [v5 encodeInt64:self->_commandQueueStreamRef forKey:@"commandQueueStreamRef"];
  [v5 encodeInt64:self->_scopeAddress forKey:@"scopeAddress"];
  [v5 encodeInt64:self->_scopeStreamRef forKey:@"scopeStreamRef"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeBool:self->_isDefaultCapturable forKey:@"isDefaultCapturable"];
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_unint64_t deviceAddress = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (unint64_t)commandQueueStreamRef
{
  return self->_commandQueueStreamRef;
}

- (void)setCommandQueueStreamRef:(unint64_t)a3
{
  self->_commandQueueStreamRef = a3;
}

- (unint64_t)scopeAddress
{
  return self->_scopeAddress;
}

- (void)setScopeAddress:(unint64_t)a3
{
  self->_scopeAddress = a3;
}

- (unint64_t)scopeStreamRef
{
  return self->_scopeStreamRef;
}

- (void)setScopeStreamRef:(unint64_t)a3
{
  self->_scopeStreamRef = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isDefaultCapturable
{
  return self->_isDefaultCapturable;
}

- (void)setIsDefaultCapturable:(BOOL)a3
{
  self->_isDefaultCapturable = a3;
}

- (void).cxx_destruct
{
}

@end