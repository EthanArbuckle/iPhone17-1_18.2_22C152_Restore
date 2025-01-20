@interface GLKReflectionMapEffect
- (BOOL)dirtyUniforms;
- (GLKEffectPropertyTexture)textureCubeMap;
- (GLKMatrix3)matrix;
- (GLKReflectionMapEffect)init;
- (id)description;
- (int)matrixLoc;
- (void)dealloc;
- (void)prepareToDraw;
- (void)setDirtyUniforms:(BOOL)a3;
- (void)setMatrix:(GLKMatrix3 *)matrix;
- (void)setMatrixLoc:(int)a3;
@end

@implementation GLKReflectionMapEffect

- (GLKReflectionMapEffect)init
{
  v7.receiver = self;
  v7.super_class = (Class)GLKReflectionMapEffect;
  v2 = [(GLKBaseEffect *)&v7 init];
  v3 = (GLKReflectionMapEffect *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 56) = -1;
    *((_DWORD *)v2 + 46) = 1065353216;
    *(void *)&long long v4 = 0;
    *((void *)&v4 + 1) = 0x3F80000000000000;
    *(_OWORD *)(v2 + 188) = v4;
    *((_DWORD *)v2 + 51) = 0;
    *((void *)v2 + 26) = 0;
    *((_DWORD *)v2 + 54) = 1065353216;
    v5 = objc_alloc_init(GLKEffectPropertyTexture);
    v3->_textureCubeMap = v5;
    [(GLKEffectPropertyTexture *)v5 setTarget:34067];
    [(GLKEffectPropertyTexGen *)[(GLKEffectPropertyTexture *)v3->_textureCubeMap texGenS] setMode:3];
    [(GLKEffectPropertyTexGen *)[(GLKEffectPropertyTexture *)v3->_textureCubeMap texGenT] setMode:3];
    [(GLKEffectPropertyTexGen *)[(GLKEffectPropertyTexture *)v3->_textureCubeMap texGenR] setMode:3];
    [(NSMutableArray *)[(GLKBaseEffect *)v3 propertyArray] addObject:v3->_textureCubeMap];
    v3->_dirtyUniforms = 1;
  }
  return v3;
}

- (void)setMatrix:(GLKMatrix3 *)matrix
{
  float m22 = matrix->m22;
  long long v4 = *(_OWORD *)&matrix->m[4];
  *(_OWORD *)&self->_matrix.m00 = *(_OWORD *)&matrix->m00;
  *(_OWORD *)&self->_matrix.m[4] = v4;
  self->_matrix.float m22 = m22;
  self->_dirtyUniforms = 1;
}

- (void)prepareToDraw
{
  v5.receiver = self;
  v5.super_class = (Class)GLKReflectionMapEffect;
  [(GLKBaseEffect *)&v5 prepareToDraw];
  if (self->_dirtyUniforms)
  {
    if ([(GLKEffectPropertyTexture *)self->_textureCubeMap enabled])
    {
      GLint params = 0;
      glGetIntegerv(0x8B8Du, &params);
      int UniformLocation = glGetUniformLocation(params, "reflectionMapMatrix");
      self->_matrixLoc = UniformLocation;
      glUniformMatrix3fv(UniformLocation, 1, 0, &self->_matrix.m00);
      self->_dirtyUniforms = 0;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GLKReflectionMapEffect;
  [(GLKBaseEffect *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v3, "appendFormat:", @"self = %p\n{\n", self);
  objc_msgSend(v3, "appendFormat:", @"textureCubeMap = %p\n", -[GLKReflectionMapEffect textureCubeMap](self, "textureCubeMap"));
  [v3 appendFormat:@"%@\n", -[GLKEffectPropertyTexture description](-[GLKReflectionMapEffect textureCubeMap](self, "textureCubeMap"), "description")];
  [v3 appendString:@"matrix\n{\n"];
  long long v4 = *(_OWORD *)&self->_matrix.m[4];
  *(_OWORD *)&matrix.m00 = *(_OWORD *)&self->_matrix.m00;
  *(_OWORD *)&matrix.m[4] = v4;
  matrix.float m22 = self->_matrix.m22;
  [v3 appendFormat:@"%@\n", NSStringFromGLKMatrix3(&matrix)];
  [v3 appendString:@"}\n"];
  v6.receiver = self;
  v6.super_class = (Class)GLKReflectionMapEffect;
  objc_msgSend(v3, "appendString:", -[GLKBaseEffect description](&v6, sel_description));
  [v3 appendString:@"}"];
  return v3;
}

- (GLKEffectPropertyTexture)textureCubeMap
{
  return self->_textureCubeMap;
}

- (BOOL)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(BOOL)a3
{
  self->_dirtyUniforms = a3;
}

- (GLKMatrix3)matrix
{
  long long v3 = *(_OWORD *)&self[5].m[5];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self[5].m[1];
  *(_OWORD *)&retstr->m[4] = v3;
  retstr->float m22 = self[6].m00;
  return self;
}

- (int)matrixLoc
{
  return self->_matrixLoc;
}

- (void)setMatrixLoc:(int)a3
{
  self->_matrixLoc = a3;
}

@end