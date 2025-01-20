@interface BLSBacklightChangeSourceEventSuppressionMetadata
+ (BOOL)supportsSecureCoding;
- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithCoder:(id)a3;
- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithType:(unint64_t)a3 reason:(unint64_t)a4;
- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)reason;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeSourceEventSuppressionMetadata

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithType:(unint64_t)a3 reason:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BLSBacklightChangeSourceEventSuppressionMetadata;
  result = [(BLSBacklightChangeSourceEventSuppressionMetadata *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_reason = a4;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  if (self->_type == 1) {
    v5 = @"Suppress";
  }
  else {
    v5 = @"Unsuppress";
  }
  [v3 appendString:v5 withName:@"type"];
  v6 = NSStringFromBLSAlwaysOnSuppressionReason(self->_reason);
  [v4 appendString:v6 withName:@"reason"];

  objc_super v7 = [v4 build];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_type];
  id v5 = (id)[v3 appendInteger:self->_reason];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t type = self->_type;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke;
  v18[3] = &unk_1E6107400;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendInteger:type counterpart:v18];
  unint64_t reason = self->_reason;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke_2;
  v16 = &unk_1E6107400;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendInteger:reason counterpart:&v13];
  LOBYTE(reason) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return reason;
}

uint64_t __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

uint64_t __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reason];
}

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"type" UTF8String];
  unint64_t v6 = (const char *)[@"reason" UTF8String];
  int64_t int64 = xpc_dictionary_get_int64(v4, v5);
  int64_t v8 = xpc_dictionary_get_int64(v4, v6);

  return [(BLSBacklightChangeSourceEventSuppressionMetadata *)self initWithType:int64 reason:v8];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"type" UTF8String];
  id v5 = (const char *)[@"reason" UTF8String];
  xpc_dictionary_set_int64(xdict, v4, self->_type);
  xpc_dictionary_set_int64(xdict, v5, self->_reason);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"reason"];

  return [(BLSBacklightChangeSourceEventSuppressionMetadata *)self initWithType:v5 reason:v6];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end