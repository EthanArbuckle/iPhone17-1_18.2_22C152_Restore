@interface MTLRenderPipelineDescriptor
+ (MTLRenderPipelineDescriptor)allocWithZone:(_NSZone *)a3;
- (BOOL)supportAddingFragmentBinaryFunctions;
- (BOOL)supportAddingVertexBinaryFunctions;
- (NSArray)fragmentPreloadedLibraries;
- (NSArray)vertexPreloadedLibraries;
- (NSUInteger)maxFragmentCallStackDepth;
- (NSUInteger)maxVertexCallStackDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFragmentPreloadedLibraries:(NSArray *)fragmentPreloadedLibraries;
- (void)setMaxFragmentCallStackDepth:(NSUInteger)maxFragmentCallStackDepth;
- (void)setMaxVertexCallStackDepth:(NSUInteger)maxVertexCallStackDepth;
- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)supportAddingFragmentBinaryFunctions;
- (void)setSupportAddingVertexBinaryFunctions:(BOOL)supportAddingVertexBinaryFunctions;
- (void)setVertexPreloadedLibraries:(NSArray *)vertexPreloadedLibraries;
@end

@implementation MTLRenderPipelineDescriptor

+ (MTLRenderPipelineDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPipelineDescriptor *)+[MTLRenderPipelineDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPipelineDescriptor;
    return (MTLRenderPipelineDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSArray)vertexPreloadedLibraries
{
  return self->_vertexPreloadedLibraries;
}

- (void)setVertexPreloadedLibraries:(NSArray *)vertexPreloadedLibraries
{
}

- (NSArray)fragmentPreloadedLibraries
{
  return self->_fragmentPreloadedLibraries;
}

- (void)setFragmentPreloadedLibraries:(NSArray *)fragmentPreloadedLibraries
{
}

- (BOOL)supportAddingVertexBinaryFunctions
{
  return self->_supportAddingVertexBinaryFunctions;
}

- (void)setSupportAddingVertexBinaryFunctions:(BOOL)supportAddingVertexBinaryFunctions
{
  self->_supportAddingVertexBinaryFunctions = supportAddingVertexBinaryFunctions;
}

- (BOOL)supportAddingFragmentBinaryFunctions
{
  return self->_supportAddingFragmentBinaryFunctions;
}

- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)supportAddingFragmentBinaryFunctions
{
  self->_supportAddingFragmentBinaryFunctions = supportAddingFragmentBinaryFunctions;
}

- (NSUInteger)maxVertexCallStackDepth
{
  return self->_maxVertexCallStackDepth;
}

- (void)setMaxVertexCallStackDepth:(NSUInteger)maxVertexCallStackDepth
{
  self->_maxVertexCallStackDepth = maxVertexCallStackDepth;
}

- (NSUInteger)maxFragmentCallStackDepth
{
  return self->_maxFragmentCallStackDepth;
}

- (void)setMaxFragmentCallStackDepth:(NSUInteger)maxFragmentCallStackDepth
{
  self->_maxFragmentCallStackDepth = maxFragmentCallStackDepth;
}

@end