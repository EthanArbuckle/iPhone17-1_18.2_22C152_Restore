@interface BKSHIDEventProximityAttributes
+ (id)protobufSchema;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)proximityDetectionMode;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setProximityDetectionMode:(int)a3;
@end

@implementation BKSHIDEventProximityAttributes

- (int)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (void)setProximityDetectionMode:(int)a3
{
  self->_proximityDetectionMode = a3;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_640 != -1) {
    dispatch_once(&protobufSchema_onceToken_640, block);
  }
  v2 = (void *)protobufSchema_schema_639;
  return v2;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventProximityAttributes;
  id v4 = a3;
  [(BKSHIDEventBaseAttributes *)&v6 appendDescriptionToFormatter:v4];
  v5 = NSStringFromBKSHIDServicesProximityDetectionMode(self->_proximityDetectionMode);
  objc_msgSend(v4, "appendString:withName:", v5, @"proximityDetectionMode", v6.receiver, v6.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventProximityAttributes;
  BOOL v5 = [(BKSHIDEventBaseAttributes *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_proximityDetectionMode == v4[12];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventProximityAttributes;
  id result = [(BKSHIDEventBaseAttributes *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 12) = self->_proximityDetectionMode;
  return result;
}

uint64_t __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_642];
  uint64_t v2 = protobufSchema_schema_639;
  protobufSchema_schema_639 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __48__BKSHIDEventProximityAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_proximityDetectionMode"];
}

@end