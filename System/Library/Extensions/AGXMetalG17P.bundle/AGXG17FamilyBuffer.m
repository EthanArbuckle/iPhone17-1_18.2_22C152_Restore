@interface AGXG17FamilyBuffer
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (void)dealloc;
- (void)initResourceGroupUsage;
@end

@implementation AGXG17FamilyBuffer

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
  if (v3) {
    free(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyBuffer;
  [(AGXBuffer *)&v4 dealloc];
}

- (void)initResourceGroupUsage
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]) = 0;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  v6 = [(AGXTexture *)[AGXG17FamilyTexture alloc] initWithBuffer:self desc:a3 offset:a4 bytesPerRow:a5];
  if (v6) {
    atomic_fetch_or((atomic_ullong *volatile)([(IOGPUMetalResource *)self device] + 816), 0x20000uLL);
  }
  return v6;
}

@end