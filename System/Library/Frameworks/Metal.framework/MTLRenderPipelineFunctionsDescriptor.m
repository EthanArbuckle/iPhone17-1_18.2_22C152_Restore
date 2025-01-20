@interface MTLRenderPipelineFunctionsDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLRenderPipelineFunctionsDescriptor)init;
- (NSArray)fragmentAdditionalBinaryFunctions;
- (NSArray)meshAdditionalBinaryFunctions;
- (NSArray)objectAdditionalBinaryFunctions;
- (NSArray)tileAdditionalBinaryFunctions;
- (NSArray)vertexAdditionalBinaryFunctions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setFragmentAdditionalBinaryFunctions:(NSArray *)fragmentAdditionalBinaryFunctions;
- (void)setMeshAdditionalBinaryFunctions:(id)a3;
- (void)setObjectAdditionalBinaryFunctions:(id)a3;
- (void)setTileAdditionalBinaryFunctions:(NSArray *)tileAdditionalBinaryFunctions;
- (void)setVertexAdditionalBinaryFunctions:(NSArray *)vertexAdditionalBinaryFunctions;
@end

@implementation MTLRenderPipelineFunctionsDescriptor

- (MTLRenderPipelineFunctionsDescriptor)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPipelineFunctionsDescriptor;
  v2 = [(MTLRenderPipelineFunctionsDescriptor *)&v4 init];
  if (v2)
  {
    v2->_vertexAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_fragmentAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_tileAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_objectAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_meshAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineFunctionsDescriptor;
  [(MTLRenderPipelineFunctionsDescriptor *)&v3 dealloc];
}

- (unint64_t)hash
{
  bzero(v9, 0x28uLL);
  vertexAdditionalBinaryFunctions = self->_vertexAdditionalBinaryFunctions;
  if (vertexAdditionalBinaryFunctions) {
    v9[0] = [(NSArray *)vertexAdditionalBinaryFunctions hash];
  }
  fragmentAdditionalBinaryFunctions = self->_fragmentAdditionalBinaryFunctions;
  if (fragmentAdditionalBinaryFunctions) {
    v9[1] = [(NSArray *)fragmentAdditionalBinaryFunctions hash];
  }
  tileAdditionalBinaryFunctions = self->_tileAdditionalBinaryFunctions;
  if (tileAdditionalBinaryFunctions) {
    v9[2] = [(NSArray *)tileAdditionalBinaryFunctions hash];
  }
  objectAdditionalBinaryFunctions = self->_objectAdditionalBinaryFunctions;
  if (objectAdditionalBinaryFunctions) {
    v9[3] = [(NSArray *)objectAdditionalBinaryFunctions hash];
  }
  meshAdditionalBinaryFunctions = self->_meshAdditionalBinaryFunctions;
  if (meshAdditionalBinaryFunctions) {
    v9[4] = [(NSArray *)meshAdditionalBinaryFunctions hash];
  }
  return _MTLHashState((int *)v9, 0x28uLL);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  int v7 = MTLCompareArray(self->_vertexAdditionalBinaryFunctions, *((void **)a3 + 1), 1, 0);
  BOOL result = 0;
  if (v7)
  {
    int v8 = MTLCompareArray(self->_fragmentAdditionalBinaryFunctions, *((void **)a3 + 2), 1, 0);
    BOOL result = 0;
    if (v8)
    {
      int v9 = MTLCompareArray(self->_tileAdditionalBinaryFunctions, *((void **)a3 + 3), 1, 0);
      BOOL result = 0;
      if (v9)
      {
        int v10 = MTLCompareArray(self->_objectAdditionalBinaryFunctions, *((void **)a3 + 4), 1, 0);
        BOOL result = 0;
        if (v10)
        {
          meshAdditionalBinaryFunctions = self->_meshAdditionalBinaryFunctions;
          v12 = (void *)*((void *)a3 + 5);
          return MTLCompareArray(meshAdditionalBinaryFunctions, v12, 1, 0);
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  if (v5)
  {
    v5[1] = [(NSArray *)self->_vertexAdditionalBinaryFunctions copyWithZone:a3];
    v5[2] = [(NSArray *)self->_fragmentAdditionalBinaryFunctions copyWithZone:a3];
    v5[3] = [(NSArray *)self->_tileAdditionalBinaryFunctions copyWithZone:a3];
    v5[4] = [(NSArray *)self->_objectAdditionalBinaryFunctions copyWithZone:a3];
    v5[5] = [(NSArray *)self->_meshAdditionalBinaryFunctions copyWithZone:a3];
  }
  return v5;
}

- (NSArray)vertexAdditionalBinaryFunctions
{
  return self->_vertexAdditionalBinaryFunctions;
}

- (void)setVertexAdditionalBinaryFunctions:(NSArray *)vertexAdditionalBinaryFunctions
{
}

- (NSArray)fragmentAdditionalBinaryFunctions
{
  return self->_fragmentAdditionalBinaryFunctions;
}

- (void)setFragmentAdditionalBinaryFunctions:(NSArray *)fragmentAdditionalBinaryFunctions
{
}

- (NSArray)tileAdditionalBinaryFunctions
{
  return self->_tileAdditionalBinaryFunctions;
}

- (void)setTileAdditionalBinaryFunctions:(NSArray *)tileAdditionalBinaryFunctions
{
}

- (NSArray)objectAdditionalBinaryFunctions
{
  return self->_objectAdditionalBinaryFunctions;
}

- (void)setObjectAdditionalBinaryFunctions:(id)a3
{
}

- (NSArray)meshAdditionalBinaryFunctions
{
  return self->_meshAdditionalBinaryFunctions;
}

- (void)setMeshAdditionalBinaryFunctions:(id)a3
{
}

@end