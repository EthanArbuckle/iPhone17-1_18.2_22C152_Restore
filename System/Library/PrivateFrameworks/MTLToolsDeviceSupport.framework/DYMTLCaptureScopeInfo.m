@interface DYMTLCaptureScopeInfo
+ (BOOL)supportsSecureCoding;
+ (id)capturableObjectType;
- (BOOL)isDefaultCapturable;
- (BOOL)isEqual:(id)a3;
- (DYMTLCaptureScopeInfo)initWithCaptureScope:(id)a3;
- (DYMTLCaptureScopeInfo)initWithCoder:(id)a3;
- (NSString)capturableObjectType;
- (NSString)description;
- (NSString)displayName;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)deviceAddress;
- (unint64_t)scopeAddress;
- (unint64_t)scopeStreamRef;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DYMTLCaptureScopeInfo

- (DYMTLCaptureScopeInfo)initWithCaptureScope:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCaptureScopeInfo;
  v5 = [(DYMTLCaptureScopeInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 device];
    v5->_deviceAddress = (unint64_t)v6;

    v5->_scopeAddress = (unint64_t)v4;
    uint64_t v7 = [v4 label];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_isDefaultCapturable = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLCaptureScopeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLCaptureScopeInfo;
  v5 = [(DYMTLCaptureScopeInfo *)&v9 init];
  if (v5)
  {
    v5->_deviceAddress = [v4 decodeInt64ForKey:@"deviceAddress"];
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
  [v5 encodeInt64:self->_scopeAddress forKey:@"scopeAddress"];
  [v5 encodeInt64:self->_scopeStreamRef forKey:@"scopeStreamRef"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeBool:self->_isDefaultCapturable forKey:@"isDefaultCapturable"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 24) = self->_deviceAddress;
    *(void *)(v4 + 32) = self->_scopeAddress;
    uint64_t v6 = [(NSString *)self->_label copy];
    uint64_t v7 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v6;

    *(unsigned char *)(v5 + 8) = self->_isDefaultCapturable;
    id v8 = (id)v5;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->_scopeAddress == v4[4];

  return v6;
}

- (NSString)displayName
{
  if (!self->_displayName)
  {
    label = self->_label;
    if (label)
    {
      uint64_t v4 = label;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Capture Scope 0x%llx", self->_scopeAddress);
      uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = self->_displayName;
    self->_displayName = v4;
  }
  BOOL v6 = self->_displayName;
  return v6;
}

+ (id)capturableObjectType
{
  return (id)*MEMORY[0x263F3FA50];
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x263F3FA50];
}

- (unint64_t)streamRef
{
  return self->_scopeStreamRef;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, self->_label];
}

- (BOOL)isDefaultCapturable
{
  return self->_isDefaultCapturable;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)scopeAddress
{
  return self->_scopeAddress;
}

- (unint64_t)scopeStreamRef
{
  return self->_scopeStreamRef;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end