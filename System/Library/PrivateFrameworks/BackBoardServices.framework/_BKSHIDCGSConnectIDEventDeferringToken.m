@interface _BKSHIDCGSConnectIDEventDeferringToken
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BOOL)_isIdentifierOfCGSConnection;
- (BOOL)isEqual:(id)a3;
- (_BKSHIDCGSConnectIDEventDeferringToken)initWithCoder:(id)a3;
- (id)_initWithCGSConnectionID:(unsigned int)a3;
- (id)description;
- (id)initForProtobufDecoding;
- (unint64_t)hash;
- (unsigned)_identifierOfCGSConnection;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BKSHIDCGSConnectIDEventDeferringToken

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5 = a3;
  id v4 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", -[_BKSHIDCGSConnectIDEventDeferringToken _identifierOfCGSConnection](self, "_identifierOfCGSConnection"), 0, 1);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%x", self->_CGSConnectionID);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_BKSHIDCGSConnectIDEventDeferringToken *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_CGSConnectionID == v4->_CGSConnectionID;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_CGSConnectionID ^ 0x191FFLL;
}

- (_BKSHIDCGSConnectIDEventDeferringToken)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BKSHIDCGSConnectIDEventDeferringToken;
  uint64_t v5 = [(BKSHIDEventDeferringToken *)&v18 _init];
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    int v16 = [v4 decodeInt32ForKey:@"CGSConnection"];
    if (v16)
    {
      v5[2] = v16;
      v15 = v5;
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v21 = *MEMORY[0x1E4F28588];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to decode BKSHIDEventDeferringToken: invalid connectionID : %i", 0);
    v22[0] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = (void **)v22;
    v12 = &v21;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringToken: subclasses are not allowed : %@", objc_opt_class()];
    v20 = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = &v20;
    v12 = &v19;
  }
  v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  v14 = [v7 errorWithDomain:v8 code:4866 userInfo:v13];
  [v4 failWithError:v14];

  v15 = 0;
LABEL_6:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t CGSConnectionID = self->_CGSConnectionID;
  if (CGSConnectionID) {
    [a3 encodeInt32:CGSConnectionID forKey:@"CGSConnection"];
  }
}

- (id)initForProtobufDecoding
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_BKSHIDCGSConnectIDEventDeferringToken;
  id v3 = [(BKSHIDEventDeferringToken *)&v10 _init];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v6 = [NSString stringWithFormat:@"cannot subclass BKSHIDEventDeferringToken"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      id v16 = v3;
      __int16 v17 = 2114;
      objc_super v18 = @"BKSHIDEventDeferringToken.m";
      __int16 v19 = 1024;
      int v20 = 281;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA433E8);
  }
  return v3;
}

- (unsigned)_identifierOfCGSConnection
{
  return self->_CGSConnectionID;
}

- (BOOL)_isIdentifierOfCGSConnection
{
  return self->_CGSConnectionID != 0;
}

- (id)_initWithCGSConnectionID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_BKSHIDCGSConnectIDEventDeferringToken;
  id result = [(BKSHIDEventDeferringToken *)&v5 _init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___BKSHIDCGSConnectIDEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_79 != -1) {
    dispatch_once(&protobufSchema_onceToken_79, block);
  }
  v2 = (void *)protobufSchema_schema_78;
  return v2;
}

@end