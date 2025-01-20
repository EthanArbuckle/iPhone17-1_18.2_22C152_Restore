@interface BKSHIDEventKeyboardAttributes
+ (id)protobufSchema;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)GSModifierState;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setGSModifierState:(unsigned int)a3;
@end

@implementation BKSHIDEventKeyboardAttributes

- (void)setGSModifierState:(unsigned int)a3
{
  self->_GSModifierState = a3;
}

- (unsigned)GSModifierState
{
  return self->_GSModifierState;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventKeyboardAttributes;
  [(BKSHIDEventBaseAttributes *)&v6 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendUnsignedInteger:self->_GSModifierState withName:@"GSModifierState" format:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventKeyboardAttributes;
  BOOL v5 = [(BKSHIDEventBaseAttributes *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_GSModifierState == v4[12];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventKeyboardAttributes;
  id result = [(BKSHIDEventBaseAttributes *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 12) = self->_GSModifierState;
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__BKSHIDEventKeyboardAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_622 != -1) {
    dispatch_once(&protobufSchema_onceToken_622, block);
  }
  v2 = (void *)protobufSchema_schema_621;
  return v2;
}

uint64_t __47__BKSHIDEventKeyboardAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_624];
  uint64_t v2 = protobufSchema_schema_621;
  protobufSchema_schema_621 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __47__BKSHIDEventKeyboardAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_GSModifierState"];
}

@end