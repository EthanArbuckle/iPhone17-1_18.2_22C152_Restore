@interface BKSHIDEventRedirectAttributes
+ (id)protobufSchema;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation BKSHIDEventRedirectAttributes

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventRedirectAttributes;
  [(BKSHIDEventBaseAttributes *)&v6 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendInteger:self->_pid withName:@"pid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventRedirectAttributes;
  id result = [(BKSHIDEventBaseAttributes *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 12) = self->_pid;
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_271 != -1) {
    dispatch_once(&protobufSchema_onceToken_271, block);
  }
  v2 = (void *)protobufSchema_schema_270;
  return v2;
}

uint64_t __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_273];
  uint64_t v2 = protobufSchema_schema_270;
  protobufSchema_schema_270 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_pid" forTag:1];
}

@end