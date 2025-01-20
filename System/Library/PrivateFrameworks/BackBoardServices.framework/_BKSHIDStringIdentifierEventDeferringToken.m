@interface _BKSHIDStringIdentifierEventDeferringToken
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BOOL)_isString;
- (BOOL)isEqual:(id)a3;
- (_BKSHIDStringIdentifierEventDeferringToken)init;
- (_BKSHIDStringIdentifierEventDeferringToken)initWithCoder:(id)a3;
- (id)_initWithString:(id)a3;
- (id)_string;
- (id)description;
- (id)initForProtobufDecoding;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BKSHIDStringIdentifierEventDeferringToken

- (unint64_t)hash
{
  return [(NSString *)self->_stringIdentifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (_BKSHIDStringIdentifierEventDeferringToken)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
  v5 = [(BKSHIDEventDeferringToken *)&v21 _init];
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringIdentifier"];
    if ([v13 length])
    {
      v14 = (void *)v5[1];
      v5[1] = v13;

      v12 = v5;
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v18 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringToken: empty string"];
    v25[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v20 = [v16 errorWithDomain:v17 code:4866 userInfo:v19];
    [v4 failWithError:v20];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringToken: subclasses are not allowed : %@", objc_opt_class()];
    v23 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
    [v4 failWithError:v11];
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_stringIdentifier length]) {
    [v4 encodeObject:self->_stringIdentifier forKey:@"stringIdentifier"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_BKSHIDStringIdentifierEventDeferringToken *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      char v6 = [(NSString *)self->_stringIdentifier isEqual:v4->_stringIdentifier];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = [(_BKSHIDStringIdentifierEventDeferringToken *)self _string];
  id v5 = (id)[v6 appendObject:v4 withName:0 skipIfNil:0];
}

- (id)_string
{
  return self->_stringIdentifier;
}

- (id)_initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
  id v5 = [(BKSHIDEventDeferringToken *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (id)description
{
  return self->_stringIdentifier;
}

- (id)initForProtobufDecoding
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
  id v3 = [(BKSHIDEventDeferringToken *)&v10 _init];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v6 = [NSString stringWithFormat:@"cannot subclass BKSHIDEventDeferringToken"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      id v16 = v3;
      __int16 v17 = 2114;
      v18 = @"BKSHIDEventDeferringToken.m";
      __int16 v19 = 1024;
      int v20 = 175;
      __int16 v21 = 2114;
      uint64_t v22 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA43A24);
  }
  return v3;
}

- (BOOL)_isString
{
  return self->_stringIdentifier != 0;
}

- (_BKSHIDStringIdentifierEventDeferringToken)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on _BKSHIDStringIdentifierEventDeferringToken"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BKSHIDEventDeferringToken.m";
    __int16 v17 = 1024;
    int v18 = 137;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (_BKSHIDStringIdentifierEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_54 != -1) {
    dispatch_once(&protobufSchema_onceToken_54, block);
  }
  v2 = (void *)protobufSchema_schema_53;
  return v2;
}

@end