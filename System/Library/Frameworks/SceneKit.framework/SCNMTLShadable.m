@interface SCNMTLShadable
- (id)bufferAtIndices:(id)a3;
- (id)samplerAtIndices:(id)a3;
- (id)textureAtIndices:(id)a3;
- (int64_t)geometryModificationCount;
- (int64_t)materialModificationCount;
- (void)dealloc;
- (void)setGeometryModificationCount:(int64_t)a3;
- (void)setMaterialModificationCount:(int64_t)a3;
- (void)setResource:(id)a3 ofType:(unint64_t)a4 atIndices:(id)a5;
@end

@implementation SCNMTLShadable

- (void)setResource:(id)a3 ofType:(unint64_t)a4 atIndices:(id)a5
{
  char var0 = a5.var0;
  uint64_t v8 = *(void *)&a5.var0 >> 8;
  int var1 = a5.var1;
  if (a4 == 3)
  {
    if (a5.var0 != 255)
    {
      id v14 = a3;
      v15 = (id *)(&self->super.isa + var0);

      v15[125] = a3;
    }
    if (var1 != 255)
    {
      id v16 = a3;
      v17 = (id *)(&self->super.isa + (char)v8);

      v17[141] = a3;
    }
  }
  else if (a4 == 2)
  {
    if (a5.var0 != 255)
    {
      id v18 = a3;
      v19 = (id *)(&self->super.isa + var0);

      v19[63] = a3;
    }
    if (var1 != 255)
    {
      id v20 = a3;
      v21 = (id *)(&self->super.isa + (char)v8);

      v21[94] = a3;
    }
  }
  else if (a4)
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLShadable setResource:ofType:atIndices:]();
    }
  }
  else
  {
    if (a5.var0 != 255)
    {
      id v10 = a3;
      v11 = (id *)(&self->super.isa + var0);

      v11[1] = a3;
    }
    if (var1 != 255)
    {
      id v12 = a3;
      v13 = (id *)(&self->super.isa + (char)v8);

      v13[32] = a3;
    }
  }
}

- (void)setMaterialModificationCount:(int64_t)a3
{
  self->materialModificationCount = a3;
}

- (void)setGeometryModificationCount:(int64_t)a3
{
  self->geometryModificationCount = a3;
}

- (id)bufferAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexBuffers[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentBuffers[a3.var1];
  }
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLShadable bufferAtIndices:]();
  }
  return 0;
}

- (void)dealloc
{
  for (uint64_t i = 0; i != 31; ++i)
  {
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
  }
  for (uint64_t k = 0; k != 16; ++k)
  {
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNMTLShadable;
  [(SCNMTLShadable *)&v6 dealloc];
}

- (id)textureAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexTextures[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentTextures[a3.var1];
  }
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLShadable bufferAtIndices:]();
  }
  return 0;
}

- (id)samplerAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexSamplers[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentSamplers[a3.var1];
  }
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLShadable bufferAtIndices:]();
  }
  return 0;
}

- (int64_t)materialModificationCount
{
  return self->materialModificationCount;
}

- (int64_t)geometryModificationCount
{
  return self->geometryModificationCount;
}

- (void)setResource:ofType:atIndices:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Invalid resource type", v2, v3, v4, v5, v6);
}

- (void)bufferAtIndices:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Not indices are bound!?!", v2, v3, v4, v5, v6);
}

@end