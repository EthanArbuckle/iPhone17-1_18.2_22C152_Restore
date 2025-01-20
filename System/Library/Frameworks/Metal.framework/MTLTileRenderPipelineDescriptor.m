@interface MTLTileRenderPipelineDescriptor
+ (MTLTileRenderPipelineDescriptor)allocWithZone:(_NSZone *)a3;
- (BOOL)supportAddingBinaryFunctions;
- (NSArray)preloadedLibraries;
- (NSUInteger)maxCallStackDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMaxCallStackDepth:(NSUInteger)maxCallStackDepth;
- (void)setPreloadedLibraries:(NSArray *)preloadedLibraries;
- (void)setSupportAddingBinaryFunctions:(BOOL)supportAddingBinaryFunctions;
@end

@implementation MTLTileRenderPipelineDescriptor

+ (MTLTileRenderPipelineDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLTileRenderPipelineDescriptor *)+[MTLTileRenderPipelineDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLTileRenderPipelineDescriptor;
    return (MTLTileRenderPipelineDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSArray)preloadedLibraries
{
  return self->_preloadedLibraries;
}

- (void)setPreloadedLibraries:(NSArray *)preloadedLibraries
{
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_supportAddingBinaryFunctions;
}

- (void)setSupportAddingBinaryFunctions:(BOOL)supportAddingBinaryFunctions
{
  self->_supportAddingBinaryFunctions = supportAddingBinaryFunctions;
}

- (NSUInteger)maxCallStackDepth
{
  return self->_maxCallStackDepth;
}

- (void)setMaxCallStackDepth:(NSUInteger)maxCallStackDepth
{
  self->_maxCallStackDepth = maxCallStackDepth;
}

@end