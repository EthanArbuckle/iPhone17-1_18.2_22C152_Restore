@interface AGXG17FamilyIndirectRenderCommandEncoder
- (AGXG17FamilyIndirectRenderCommandEncoder)initWithBuffer:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
@end

@implementation AGXG17FamilyIndirectRenderCommandEncoder

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v3 = [[AGXG17FamilyIndirectRenderCommand alloc] initWithEncoder:self->_impl withIndex:a3];

  return v3;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl) {
    MEMORY[0x24566ED90](impl, 0xA0C40BD48D6D6);
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyIndirectRenderCommandEncoder;
  [(AGXG17FamilyIndirectRenderCommandEncoder *)&v4 dealloc];
}

- (AGXG17FamilyIndirectRenderCommandEncoder)initWithBuffer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyIndirectRenderCommandEncoder;
  v3 = [(AGXG17FamilyIndirectRenderCommandEncoder *)&v5 init];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      operator new();
    }
    [(AGXG17FamilyIndirectRenderCommandEncoder *)v3 dealloc];
    return 0;
  }
  return v3;
}

@end