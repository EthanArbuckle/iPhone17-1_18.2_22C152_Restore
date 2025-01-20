@interface BKSHIDEventSmartCoverAttributes
+ (id)protobufSchema;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)smartCoverState;
- (int)wakeAnimationStyle;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setSmartCoverState:(int)a3;
- (void)setWakeAnimationStyle:(int)a3;
@end

@implementation BKSHIDEventSmartCoverAttributes

- (void)setWakeAnimationStyle:(int)a3
{
  self->_wakeAnimationStyle = a3;
}

- (int)wakeAnimationStyle
{
  return self->_wakeAnimationStyle;
}

- (void)setSmartCoverState:(int)a3
{
  self->_smartCoverState = a3;
}

- (int)smartCoverState
{
  return self->_smartCoverState;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventSmartCoverAttributes;
  [(BKSHIDEventBaseAttributes *)&v7 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendUnsignedInteger:self->_smartCoverState withName:@"smartCoverState"];
  id v6 = (id)[v4 appendUnsignedInteger:self->_wakeAnimationStyle withName:@"wakeAnimationStyle"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventSmartCoverAttributes;
  BOOL v5 = [(BKSHIDEventBaseAttributes *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_smartCoverState == v4[12]
    && self->_wakeAnimationStyle == v4[13];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventSmartCoverAttributes;
  id result = [(BKSHIDEventBaseAttributes *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 12) = self->_smartCoverState;
  *((_DWORD *)result + 13) = self->_wakeAnimationStyle;
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventSmartCoverAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_658 != -1) {
    dispatch_once(&protobufSchema_onceToken_658, block);
  }
  v2 = (void *)protobufSchema_schema_657;
  return v2;
}

uint64_t __49__BKSHIDEventSmartCoverAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_660];
  uint64_t v2 = protobufSchema_schema_657;
  protobufSchema_schema_657 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __49__BKSHIDEventSmartCoverAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_smartCoverState"];
  [v2 addField:"_wakeAnimationStyle"];
}

@end