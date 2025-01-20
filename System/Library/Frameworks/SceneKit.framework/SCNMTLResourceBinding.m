@interface SCNMTLResourceBinding
- (BOOL)needsRenderResource;
- (MTLArgument)argument;
- (MTLArgumentEncoder)argumentEncoder;
- (NSMutableArray)usedResources;
- (NSString)name;
- (SCNMTLResourceBinding)init;
- (id)bindBlock;
- (id)description;
- (unint64_t)type;
- (void)dealloc;
- (void)setArgument:(id)a3;
- (void)setArgumentEncoder:(id)a3;
- (void)setBindBlock:(id)a3;
- (void)setNeedsRenderResource:(BOOL)a3;
@end

@implementation SCNMTLResourceBinding

- (void)setArgument:(id)a3
{
}

- (SCNMTLResourceBinding)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLResourceBinding;
  result = [(SCNMTLResourceBinding *)&v3 init];
  *(_DWORD *)&result->_indices.vertexIndex = -1;
  result->_usedResources = 0;
  return result;
}

- (void)setNeedsRenderResource:(BOOL)a3
{
  self->_needsRenderResource = a3;
}

- (void)setBindBlock:(id)a3
{
}

- (id)bindBlock
{
  return self->_bindBlock;
}

- (unint64_t)type
{
  return [(MTLArgument *)self->_argument type];
}

- (BOOL)needsRenderResource
{
  return self->_needsRenderResource;
}

- (NSString)name
{
  return [(MTLArgument *)self->_argument name];
}

- (MTLArgumentEncoder)argumentEncoder
{
  return self->_argumentEncoder;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLResourceBinding;
  [(SCNMTLResourceBinding *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@: %p> \"%@\", NSStringFromClass(v4), self, -[MTLArgument name](self->_argument, "name"")];
  return v3;
}

- (NSMutableArray)usedResources
{
  result = self->_usedResources;
  if (!result)
  {
    result = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    self->_usedResources = result;
  }
  return result;
}

- (MTLArgument)argument
{
  return self->_argument;
}

- (void)setArgumentEncoder:(id)a3
{
}

@end