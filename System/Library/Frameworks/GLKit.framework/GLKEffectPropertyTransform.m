@interface GLKEffectPropertyTransform
- (GLKEffectPropertyTransform)init;
- (GLKMatrix3)normalMatrix;
- (GLKMatrix4)modelviewMatrix;
- (GLKMatrix4)projectionMatrix;
- (_GLKMatrix4)invModelviewMatrix;
- (_GLKMatrix4)mvpMatrix;
- (id)description;
- (int)invModelviewMatrixLoc;
- (int)modelviewMatrixLoc;
- (int)mvpMatrixLoc;
- (int)normalMatrixLoc;
- (int)projectionMatrixLoc;
- (void)bind;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)loadIdentity:(int)a3;
- (void)loadMatrix:(int)a3 matrix:(_GLKMatrix4 *)a4;
- (void)setInvModelviewMatrix:(_GLKMatrix4 *)a3;
- (void)setInvModelviewMatrixLoc:(int)a3;
- (void)setModelviewMatrix:(GLKMatrix4 *)modelviewMatrix;
- (void)setModelviewMatrixLoc:(int)a3;
- (void)setMvpMatrix:(_GLKMatrix4 *)a3;
- (void)setMvpMatrixLoc:(int)a3;
- (void)setNormalMatrixLoc:(int)a3;
- (void)setProjectionMatrix:(GLKMatrix4 *)projectionMatrix;
- (void)setProjectionMatrixLoc:(int)a3;
- (void)setShaderBindings;
@end

@implementation GLKEffectPropertyTransform

- (GLKEffectPropertyTransform)init
{
  v4.receiver = self;
  v4.super_class = (Class)GLKEffectPropertyTransform;
  result = [(GLKEffectProperty *)&v4 init];
  if (result)
  {
    result->_invModelviewMatrix = GLKMatrix4Identity;
    result->_mvpMatrix = GLKMatrix4Identity;
    result->_modelviewMatrix = GLKMatrix4Identity;
    result->_projectionMatrix = GLKMatrix4Identity;
    *(void *)&long long v3 = 0;
    *((void *)&v3 + 1) = 0x3F80000000000000;
    result->_normalMatrix.m00 = 1.0;
    *(_OWORD *)&result->_normalMatrix.m[1] = v3;
    result->_normalMatrix.m12 = 0.0;
    *(void *)&result->_normalMatrix.m[6] = 0;
    result->_normalMatrix.m22 = 1.0;
  }
  return result;
}

- (void)dirtyAllUniforms
{
}

- (void)loadIdentity:(int)a3
{
  GLKMatrix4 v3 = GLKMatrix4Identity;
  [(GLKEffectPropertyTransform *)self loadMatrix:*(void *)&a3 matrix:&v3];
}

- (void)loadMatrix:(int)a3 matrix:(_GLKMatrix4 *)a4
{
  if (a3 == 1)
  {
    long long v8 = *(_OWORD *)&a4->m[12];
    long long v10 = *(_OWORD *)&a4->m00;
    long long v9 = *(_OWORD *)&a4->m[4];
    *(_OWORD *)&self->_modelviewMatrix.m[8] = *(_OWORD *)&a4->m[8];
    *(_OWORD *)&self->_modelviewMatrix.m[12] = v8;
    *(_OWORD *)&self->_modelviewMatrix.m00 = v10;
    *(_OWORD *)&self->_modelviewMatrix.m[4] = v9;
    [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x20000000000];
  }
  else
  {
    if (a3) {
      return;
    }
    long long v5 = *(_OWORD *)&a4->m[12];
    long long v7 = *(_OWORD *)&a4->m00;
    long long v6 = *(_OWORD *)&a4->m[4];
    *(_OWORD *)&self->_projectionMatrix.m[8] = *(_OWORD *)&a4->m[8];
    *(_OWORD *)&self->_projectionMatrix.m[12] = v5;
    *(_OWORD *)&self->_projectionMatrix.m00 = v7;
    *(_OWORD *)&self->_projectionMatrix.m[4] = v6;
  }
  unint64_t v11 = [(GLKEffectProperty *)self dirtyUniforms] | 0x40000000000;

  [(GLKEffectProperty *)self setDirtyUniforms:v11];
}

- (void)setShaderBindings
{
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_modelviewMatrixLoc = glGetUniformLocation(params, "modelviewMatrix");
  self->_normalMatrixLoc = glGetUniformLocation(params, "normalMatrix");
  self->_mvpMatrixLoc = glGetUniformLocation(params, "mvpMatrix");
  [(GLKEffectPropertyTransform *)self dirtyAllUniforms];
}

- (_GLKMatrix4)mvpMatrix
{
  result = [(GLKEffectProperty *)self dirtyUniforms];
  if (((unint64_t)result & 0x40000000000) != 0)
  {
    float32x4_t v6 = *(float32x4_t *)&self->_projectionMatrix.m00;
    float32x4_t v7 = *(float32x4_t *)&self->_projectionMatrix.m[4];
    float32x4_t v8 = *(float32x4_t *)&self->_projectionMatrix.m[8];
    float32x4_t v9 = *(float32x4_t *)&self->_projectionMatrix.m[12];
    float32x4_t v10 = *(float32x4_t *)&self->_modelviewMatrix.m00;
    float32x4_t v11 = *(float32x4_t *)&self->_modelviewMatrix.m[4];
    float32x4_t v12 = *(float32x4_t *)&self->_modelviewMatrix.m[8];
    float32x4_t v13 = vmulq_n_f32(v6, v10.f32[0]);
    float32x4_t v14 = vmulq_n_f32(v6, v11.f32[0]);
    float32x4_t v15 = vmulq_n_f32(v6, v12.f32[0]);
    float32x4_t v16 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)&self->_modelviewMatrix.m[12])), v7, *(float32x2_t *)&self->_modelviewMatrix.m[12], 1), v8, *(float32x4_t *)&self->_modelviewMatrix.m[12], 2), v9, *(float32x4_t *)&self->_modelviewMatrix.m[12], 3);
    *(float32x4_t *)&self->_mvpMatrix.m00 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(v13, v7, *(float32x2_t *)v10.f32, 1), v8, v10, 2), v9, v10, 3);
    *(float32x4_t *)&self->_mvpMatrix.m[4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(v14, v7, *(float32x2_t *)v11.f32, 1), v8, v11, 2), v9, v11, 3);
    *(float32x4_t *)&self->_mvpMatrix.m[8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(v15, v7, *(float32x2_t *)v12.f32, 1), v8, v12, 2), v9, v12, 3);
    *(float32x4_t *)&self->_mvpMatrix.m[12] = v16;
  }
  long long v17 = *(_OWORD *)&self->_mvpMatrix.m[4];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self->_mvpMatrix.m00;
  *(_OWORD *)&retstr->m[4] = v17;
  long long v18 = *(_OWORD *)&self->_mvpMatrix.m[12];
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self->_mvpMatrix.m[8];
  *(_OWORD *)&retstr->m[12] = v18;
  return result;
}

- (GLKMatrix3)normalMatrix
{
  result = [(GLKEffectProperty *)self dirtyUniforms];
  if (((unint64_t)result & 0x20000000000) != 0)
  {
    if (self) {
      result = [(GLKEffectPropertyTransform *)self invModelviewMatrix];
    }
    else {
      memset(v8, 0, sizeof(v8));
    }
    float32x4_t v6 = (const float *)v8;
    float32x4x4_t v9 = vld4q_f32(v6);
    v9.val[0].i32[3] = v9.val[1].i32[0];
    *(float32x4_t *)&self->_normalMatrix.m00 = v9.val[0];
    *(int8x16_t *)&self->_normalMatrix.m[4] = vextq_s8(vextq_s8((int8x16_t)v9.val[1], (int8x16_t)v9.val[1], 0xCuLL), (int8x16_t)v9.val[2], 8uLL);
    LODWORD(self->_normalMatrix.m22) = v9.val[2].i32[2];
  }
  long long v7 = *(_OWORD *)&self->_normalMatrix.m[4];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self->_normalMatrix.m00;
  *(_OWORD *)&retstr->m[4] = v7;
  retstr->m22 = self->_normalMatrix.m22;
  return result;
}

- (_GLKMatrix4)invModelviewMatrix
{
  result = [(GLKEffectProperty *)self dirtyUniforms];
  if (((unint64_t)result & 0x20000000000) != 0)
  {
    BOOL isInvertible = 0;
    long long v6 = *(_OWORD *)&self->_modelviewMatrix.m[4];
    *(_OWORD *)&v12.m00 = *(_OWORD *)&self->_modelviewMatrix.m00;
    *(_OWORD *)&v12.m[4] = v6;
    long long v7 = *(_OWORD *)&self->_modelviewMatrix.m[12];
    *(_OWORD *)&v12.m[8] = *(_OWORD *)&self->_modelviewMatrix.m[8];
    *(_OWORD *)&v12.m[12] = v7;
    result = GLKMatrix4Invert(&v13, &v12, &isInvertible);
    long long v8 = *(_OWORD *)&v13.m[4];
    *(_OWORD *)&self->_invModelviewMatrix.m00 = *(_OWORD *)&v13.m00;
    *(_OWORD *)&self->_invModelviewMatrix.m[4] = v8;
    long long v9 = *(_OWORD *)&v13.m[12];
    *(_OWORD *)&self->_invModelviewMatrix.m[8] = *(_OWORD *)&v13.m[8];
    *(_OWORD *)&self->_invModelviewMatrix.m[12] = v9;
  }
  long long v10 = *(_OWORD *)&self->_invModelviewMatrix.m[4];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self->_invModelviewMatrix.m00;
  *(_OWORD *)&retstr->m[4] = v10;
  long long v11 = *(_OWORD *)&self->_invModelviewMatrix.m[12];
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self->_invModelviewMatrix.m[8];
  *(_OWORD *)&retstr->m[12] = v11;
  return result;
}

- (void)setProjectionMatrix:(GLKMatrix4 *)projectionMatrix
{
  long long v4 = *(_OWORD *)&projectionMatrix->m[12];
  long long v6 = *(_OWORD *)&projectionMatrix->m00;
  long long v5 = *(_OWORD *)&projectionMatrix->m[4];
  *(_OWORD *)&self->_projectionMatrix.m[8] = *(_OWORD *)&projectionMatrix->m[8];
  *(_OWORD *)&self->_projectionMatrix.m[12] = v4;
  *(_OWORD *)&self->_projectionMatrix.m00 = v6;
  *(_OWORD *)&self->_projectionMatrix.m[4] = v5;
  unint64_t v7 = [(GLKEffectProperty *)self dirtyUniforms] | 0x40000000000;

  [(GLKEffectProperty *)self setDirtyUniforms:v7];
}

- (void)setModelviewMatrix:(GLKMatrix4 *)modelviewMatrix
{
  long long v4 = *(_OWORD *)&modelviewMatrix->m[12];
  long long v6 = *(_OWORD *)&modelviewMatrix->m00;
  long long v5 = *(_OWORD *)&modelviewMatrix->m[4];
  *(_OWORD *)&self->_modelviewMatrix.m[8] = *(_OWORD *)&modelviewMatrix->m[8];
  *(_OWORD *)&self->_modelviewMatrix.m[12] = v4;
  *(_OWORD *)&self->_modelviewMatrix.m00 = v6;
  *(_OWORD *)&self->_modelviewMatrix.m[4] = v5;
  [(GLKEffectProperty *)self setDirtyUniforms:[(GLKEffectProperty *)self dirtyUniforms] | 0x20000000000];
  unint64_t v7 = [(GLKEffectProperty *)self dirtyUniforms] | 0x40000000000;

  [(GLKEffectProperty *)self setDirtyUniforms:v7];
}

- (void)bind
{
  if ([(GLKEffectProperty *)self dirtyUniforms])
  {
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x20000000000) != 0)
    {
      GLint normalMatrixLoc = self->_normalMatrixLoc;
      if (normalMatrixLoc != -1)
      {
        [(GLKEffectPropertyTransform *)self normalMatrix];
        glUniformMatrix3fv(normalMatrixLoc, 1, 0, value);
      }
      glUniformMatrix4fv(self->_modelviewMatrixLoc, 1, 0, &self->_modelviewMatrix.m00);
    }
    if (([(GLKEffectProperty *)self dirtyUniforms] & 0x40000000000) != 0)
    {
      GLint mvpMatrixLoc = self->_mvpMatrixLoc;
      [(GLKEffectPropertyTransform *)self mvpMatrix];
      glUniformMatrix4fv(mvpMatrixLoc, 1, 0, &v5);
    }
    [(GLKEffectProperty *)self setDirtyUniforms:0];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  [v3 appendFormat:@"\tmodelviewMatrix\n\t{\n"];
  long long v4 = *(_OWORD *)&self->_modelviewMatrix.m[4];
  *(_OWORD *)&matrix.m00 = *(_OWORD *)&self->_modelviewMatrix.m00;
  *(_OWORD *)&matrix.m[4] = v4;
  long long v5 = *(_OWORD *)&self->_modelviewMatrix.m[12];
  *(_OWORD *)&matrix.m[8] = *(_OWORD *)&self->_modelviewMatrix.m[8];
  *(_OWORD *)&matrix.m[12] = v5;
  [v3 appendFormat:@"\t%@\n", NSStringFromGLKMatrix4(&matrix)];
  [v3 appendFormat:@"\t}\n"];
  [v3 appendFormat:@"\tprojectionMatrix\n\t{\n"];
  long long v6 = *(_OWORD *)&self->_projectionMatrix.m[4];
  *(_OWORD *)&matrix.m00 = *(_OWORD *)&self->_projectionMatrix.m00;
  *(_OWORD *)&matrix.m[4] = v6;
  long long v7 = *(_OWORD *)&self->_projectionMatrix.m[12];
  *(_OWORD *)&matrix.m[8] = *(_OWORD *)&self->_projectionMatrix.m[8];
  *(_OWORD *)&matrix.m[12] = v7;
  [v3 appendFormat:@"\t%@\n", NSStringFromGLKMatrix4(&matrix)];
  [v3 appendFormat:@"\t}\n"];
  [v3 appendFormat:@"\tnormalMatrix\n\t{\n"];
  long long v8 = *(_OWORD *)&self->_normalMatrix.m[4];
  *(_OWORD *)&matrix.m00 = *(_OWORD *)&self->_normalMatrix.m00;
  *(_OWORD *)&matrix.m[4] = v8;
  matrix.m20 = self->_normalMatrix.m22;
  [v3 appendFormat:@"\t%@\n", NSStringFromGLKMatrix3((GLKMatrix3 *)&matrix)];
  [v3 appendFormat:@"\t}\n"];
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyTransform;
  [(GLKEffectProperty *)&v2 dealloc];
}

- (GLKMatrix4)modelviewMatrix
{
  long long v3 = *(_OWORD *)&self[1].m[8];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self[1].m[4];
  *(_OWORD *)&retstr->m[4] = v3;
  long long v4 = *(_OWORD *)&self[2].m00;
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self[1].m[12];
  *(_OWORD *)&retstr->m[12] = v4;
  return self;
}

- (GLKMatrix4)projectionMatrix
{
  long long v3 = *(_OWORD *)&self[2].m[8];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self[2].m[4];
  *(_OWORD *)&retstr->m[4] = v3;
  long long v4 = *(_OWORD *)&self[3].m00;
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self[2].m[12];
  *(_OWORD *)&retstr->m[12] = v4;
  return self;
}

- (void)setInvModelviewMatrix:(_GLKMatrix4 *)a3
{
  long long v3 = *(_OWORD *)&a3->m[12];
  long long v5 = *(_OWORD *)&a3->m00;
  long long v4 = *(_OWORD *)&a3->m[4];
  *(_OWORD *)&self->_invModelviewMatrix.m[8] = *(_OWORD *)&a3->m[8];
  *(_OWORD *)&self->_invModelviewMatrix.m[12] = v3;
  *(_OWORD *)&self->_invModelviewMatrix.m00 = v5;
  *(_OWORD *)&self->_invModelviewMatrix.m[4] = v4;
}

- (void)setMvpMatrix:(_GLKMatrix4 *)a3
{
  long long v3 = *(_OWORD *)&a3->m[12];
  long long v5 = *(_OWORD *)&a3->m00;
  long long v4 = *(_OWORD *)&a3->m[4];
  *(_OWORD *)&self->_mvpMatrix.m[8] = *(_OWORD *)&a3->m[8];
  *(_OWORD *)&self->_mvpMatrix.m[12] = v3;
  *(_OWORD *)&self->_mvpMatrix.m00 = v5;
  *(_OWORD *)&self->_mvpMatrix.m[4] = v4;
}

- (int)mvpMatrixLoc
{
  return self->_mvpMatrixLoc;
}

- (void)setMvpMatrixLoc:(int)a3
{
  self->_GLint mvpMatrixLoc = a3;
}

- (int)modelviewMatrixLoc
{
  return self->_modelviewMatrixLoc;
}

- (void)setModelviewMatrixLoc:(int)a3
{
  self->_modelviewMatrixLoc = a3;
}

- (int)projectionMatrixLoc
{
  return self->_projectionMatrixLoc;
}

- (void)setProjectionMatrixLoc:(int)a3
{
  self->_projectionMatrixLoc = a3;
}

- (int)normalMatrixLoc
{
  return self->_normalMatrixLoc;
}

- (void)setNormalMatrixLoc:(int)a3
{
  self->_GLint normalMatrixLoc = a3;
}

- (int)invModelviewMatrixLoc
{
  return self->_invModelviewMatrixLoc;
}

- (void)setInvModelviewMatrixLoc:(int)a3
{
  self->_invModelviewMatrixLoc = a3;
}

@end