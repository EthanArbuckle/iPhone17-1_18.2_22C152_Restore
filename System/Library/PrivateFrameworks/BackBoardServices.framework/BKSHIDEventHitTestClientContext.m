@interface BKSHIDEventHitTestClientContext
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)protobufSchema;
- (BKSHIDEventHitTestClientContext)initWithBSXPCCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (unsigned)contextID;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setPid:(int)a3;
@end

@implementation BKSHIDEventHitTestClientContext

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventHitTestClientContext)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventHitTestClientContext;
  v5 = [(BKSHIDEventHitTestClientContext *)&v7 init];
  if (v5)
  {
    v5->_pid = [v4 decodeInt64ForKey:@"pid"];
    v5->_contextID = [v4 decodeInt64ForKey:@"contextID"];
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt64:pid forKey:@"pid"];
  [v5 encodeInt64:self->_contextID forKey:@"contextID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_pid == v4[2] && self->_contextID == v4[3];

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"pid:%d contextID:%X", self->_pid, self->_contextID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[BKSHIDEventHitTestClientContext allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_pid;
  *((_DWORD *)result + 3) = self->_contextID;
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2481 != -1) {
    dispatch_once(&protobufSchema_onceToken_2481, block);
  }
  v2 = (void *)protobufSchema_schema_2482;
  return v2;
}

uint64_t __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_2483];
  uint64_t v2 = protobufSchema_schema_2482;
  protobufSchema_schema_2482 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_pid"];
  [v2 addField:"_contextID"];
}

@end