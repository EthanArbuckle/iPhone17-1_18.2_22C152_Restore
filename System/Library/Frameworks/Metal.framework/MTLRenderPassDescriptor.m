@interface MTLRenderPassDescriptor
+ (MTLRenderPassDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLRenderPassDescriptor)renderPassDescriptor;
- (NSUInteger)getSamplePositions:(MTLSamplePosition *)positions count:(NSUInteger)count;
- (NSUInteger)imageblockSampleLength;
- (NSUInteger)threadgroupMemoryLength;
- (NSUInteger)tileHeight;
- (NSUInteger)tileWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setImageblockSampleLength:(NSUInteger)imageblockSampleLength;
- (void)setThreadgroupMemoryLength:(NSUInteger)threadgroupMemoryLength;
- (void)setTileHeight:(NSUInteger)tileHeight;
- (void)setTileWidth:(NSUInteger)tileWidth;
@end

@implementation MTLRenderPassDescriptor

+ (MTLRenderPassDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassDescriptor *)+[MTLRenderPassDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPassDescriptor;
    return (MTLRenderPassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (MTLRenderPassDescriptor)renderPassDescriptor
{
  v2 = objc_alloc_init(MTLRenderPassDescriptorInternal);

  return (MTLRenderPassDescriptor *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSUInteger)getSamplePositions:(MTLSamplePosition *)positions count:(NSUInteger)count
{
  return 0;
}

- (NSUInteger)imageblockSampleLength
{
  return self->_imageblockSampleLength;
}

- (void)setImageblockSampleLength:(NSUInteger)imageblockSampleLength
{
  self->_imageblockSampleLength = imageblockSampleLength;
}

- (NSUInteger)threadgroupMemoryLength
{
  return self->_threadgroupMemoryLength;
}

- (void)setThreadgroupMemoryLength:(NSUInteger)threadgroupMemoryLength
{
  self->_threadgroupMemoryLength = threadgroupMemoryLength;
}

- (NSUInteger)tileWidth
{
  return self->_tileWidth;
}

- (void)setTileWidth:(NSUInteger)tileWidth
{
  self->_tileWidth = tileWidth;
}

- (NSUInteger)tileHeight
{
  return self->_tileHeight;
}

- (void)setTileHeight:(NSUInteger)tileHeight
{
  self->_tileHeight = tileHeight;
}

@end