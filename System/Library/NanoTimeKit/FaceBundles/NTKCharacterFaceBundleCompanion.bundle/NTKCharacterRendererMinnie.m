@interface NTKCharacterRendererMinnie
- (NTKCharacterRendererMinnie)initWithLoader:(id)a3;
- (float)_getBlinkDuration;
- (int)getBlinkFrameFor15sTime:(float)a3;
- (void)_drawBodyWithEncoder:(id)a3;
- (void)_drawFlowerWithEncoder:(id)a3;
- (void)_drawHeadWithEncoder:(id)a3;
- (void)_drawSkirtWithEncoder:(id)a3;
- (void)_drawTappingFootWithEncoder:(id)a3;
- (void)loadFootTextures;
- (void)setupBodyState;
- (void)setupGeometry;
@end

@implementation NTKCharacterRendererMinnie

- (NTKCharacterRendererMinnie)initWithLoader:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCharacterRendererMinnie;
  v3 = [(NTKCharacterRenderer *)&v6 initWithCharacter:0 loader:a3 prefix:@"Minnie"];
  v4 = v3;
  if (v3)
  {
    [(NTKCharacterRenderer *)v3 _setPoseSpecs:&minniePoseSpecs];
    [(NTKCharacterRenderer *)v4 _setStateSpecs:&minnieStateSpecs];
    [(NTKCharacterRendererMinnie *)v4 _getBlinkDuration];
    -[NTKCharacterRenderer _setBlinkDuration:](v4, "_setBlinkDuration:");
  }
  return v4;
}

- (void)loadFootTextures
{
  v3 = +[NSMutableArray arrayWithCapacity:12];
  v4 = self->_footTexs[0];
  self->_footTexs[0] = v3;

  v5 = +[NSMutableArray arrayWithCapacity:12];
  objc_super v6 = self->_footTexs[1];
  self->_footTexs[1] = v5;

  id v14 = [(NTKCharacterRenderer *)self loader];
  for (uint64_t i = 0; i != 12; ++i)
  {
    v8 = +[NSString stringWithFormat:@"FootStand_%02d", i];
    v9 = [(NTKCharacterRenderer *)self prefix];
    v10 = [v14 textureWithName:v8 prefix:v9];
    [(NSMutableArray *)self->_footTexs[0] setObject:v10 atIndexedSubscript:i];

    v11 = +[NSString stringWithFormat:@"FootLean_%02d", i];
    v12 = [(NTKCharacterRenderer *)self prefix];
    v13 = [v14 textureWithName:v11 prefix:v12];
    [(NSMutableArray *)self->_footTexs[1] setObject:v13 atIndexedSubscript:i];
  }
}

- (void)setupGeometry
{
  v29.receiver = self;
  v29.super_class = (Class)NTKCharacterRendererMinnie;
  [(NTKCharacterRenderer *)&v29 setupGeometry];
  v3 = [(NTKCharacterRenderer *)self loader];
  v4 = (_Skirt *)objc_opt_new();
  skirt = self->_skirt;
  self->_skirt = v4;

  objc_super v6 = (_Flower *)objc_opt_new();
  flower = self->_flower;
  self->_flower = v6;

  v8 = [(NTKCharacterRenderer *)self prefix];
  v9 = [v3 textureWithName:@"Skirt-2-3" prefix:v8];
  v30[0] = v9;
  v10 = [(NTKCharacterRenderer *)self prefix];
  v11 = [v3 textureWithName:@"Skirt-1-4" prefix:v10];
  v30[1] = v11;
  v12 = +[NSArray arrayWithObjects:v30 count:2];
  [(_Skirt *)self->_skirt setTexs:v12];

  v13 = [(NTKCharacterRenderer *)self prefix];
  id v14 = [v3 textureWithName:@"Flower" prefix:v13];
  [(_Flower *)self->_flower setTex:v14];

  -[_Geometry setMtlBufOffset:](self->_skirt, "setMtlBufOffset:", [v3 bufferOffsetSkirt]);
  -[_Geometry setMtlBufOffset:](self->_flower, "setMtlBufOffset:", [v3 bufferOffsetFlower]);
  v15 = [(NTKCharacterRenderer *)self body];
  LODWORD(v16) = 1060418741;
  [v15 setWidth:v16];

  v17 = [(NTKCharacterRenderer *)self body];
  LODWORD(v18) = 1058568312;
  [v17 setHeight:v18];

  v19 = [(NTKCharacterRenderer *)self head];
  LODWORD(v20) = 1058938398;
  [v19 setWidth:v20];

  v21 = [(NTKCharacterRenderer *)self head];
  LODWORD(v22) = 1058691674;
  [v21 setHeight:v22];

  LODWORD(v23) = 1051289961;
  [(_Flower *)self->_flower setWidth:v23];
  LODWORD(v24) = 1046602210;
  [(_Flower *)self->_flower setHeight:v24];
  v25 = [(NTKCharacterRenderer *)self arms];
  LODWORD(v26) = 1029647859;
  [v25 setLeftShoulderAdjustment:v26];

  v27 = [(NTKCharacterRenderer *)self arms];
  LODWORD(v28) = -1119556529;
  [v27 setRightShoulderAdjustment:v28];
}

- (void)setupBodyState
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCharacterRendererMinnie;
  [(NTKCharacterRenderer *)&v4 setupBodyState];
  v3 = [(NTKCharacterRenderer *)self head];
  [v3 setOffset:0.000064625463];
}

- (void)_drawFlowerWithEncoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCharacterRenderer *)self head];
  unsigned int v6 = [v5 inAnimation];

  if (!v6)
  {
    float v7 = minnieStateSpecs[12 * [(NTKCharacterRenderer *)self curState] + 5];
    v8 = [(NTKCharacterRenderer *)self loader];
    [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
    v9 = [(_Flower *)self->_flower tex];
    v10 = [v8 getMTLTexture:v9];

    [v4 setFragmentTexture:v10 atIndex:0];
    objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_flower, "mtlBufOffset"), 0);
    [(NTKCharacterRenderer *)self _applyClothingColorWithEncoder:v4];
    [(NTKCharacterRenderer *)self curTimeMod1Sec];
    float v12 = (float)(v11 + 0.22) * 5.96902597;
    double v13 = cosf(v12);
    id v14 = [(NTKCharacterRenderer *)self head];
    [v14 bone];
    float v16 = v15 + v13 * 0.01;
    float v56 = v16;
    v17 = [(NTKCharacterRenderer *)self head];
    [v17 bone];
    *(float *)&uint64_t v18 = v56;
    uint64_t v57 = v18;

    v19 = [(NTKCharacterRenderer *)self head];
    [v19 curHeadTilt];
    float v53 = 0.0;
    if (v20 > 0.0)
    {
      v21 = [(NTKCharacterRenderer *)self head];
      [v21 curHeadTilt];
      float v23 = v22 * -0.00320512821 * 30.0;
      float v53 = v23;
    }
    double v24 = [(NTKCharacterRenderer *)self head];
    [v24 curHeadTilt];
    float v26 = (float)(v7 * v25) * -0.3;

    [(NTKCharacterRenderer *)self characterScale];
    float v54 = v27;
    [(NTKCharacterRenderer *)self headMatrix];
    v59[0] = v28;
    v59[1] = v29;
    v59[2] = v30;
    v59[3] = v31;
    uint64_t v60 = v57;
    uint64_t v61 = 0;
    [(NTKCharacterRenderer *)self globalScale];
    uint64_t v62 = v32;
    [(_Flower *)self->_flower width];
    unsigned int v51 = v33;
    [(_Flower *)self->_flower height];
    v34.f32[0] = v7 * v54;
    v34.f32[1] = v54;
    float32x2_t v58 = v34;
    float32x2_t v63 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vmul_f32(v34, (float32x2_t)__PAIR64__(v35, v51))), (float64x2_t)xmmword_15110));
    [(NTKCharacterRenderer *)self globalOffset];
    float32x2_t v37 = v36;
    [(NTKCharacterRenderer *)self globalScale];
    float32x2_t v39 = vmul_n_f32(v38, v54);
    v40 = [(NTKCharacterRenderer *)self body];
    [v40 offset];
    *(float *)&unsigned int v55 = v41 + v26;
    v42 = [(NTKCharacterRenderer *)self head];
    [v42 curHeadX];
    unsigned int v52 = v43;
    [(NTKCharacterRenderer *)self neckBone];
    unsigned int v50 = v44;
    v45 = [(NTKCharacterRenderer *)self head];
    [v45 offset];
    [(NTKCharacterRenderer *)self neckBone];
    float32x2_t v64 = vmla_f32(v37, vadd_f32((float32x2_t)__PAIR64__(LODWORD(v53), v55), vmla_f32((float32x2_t)__PAIR64__(v49, v52), (float32x2_t)vdup_n_s32(0x3D4CCCCDu), (float32x2_t)__PAIR64__(v48, v50))), v39);
    float32x2_t v65 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(v58), (float64x2_t)xmmword_15120), (float64x2_t)vdupq_n_s64(0x3F6A41A41A41A41AuLL)));

    [v4 setVertexBytes:v59 length:112 atIndex:1];
    [v4 drawPrimitives:4 vertexStart:0 vertexCount:8];
  }
}

- (void)_drawSkirtWithEncoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCharacterRenderer *)self body];
  if ([v5 state])
  {
    unsigned int v6 = [(NTKCharacterRenderer *)self body];
    unsigned int v7 = [v6 waitingForFootRaise];

    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  float v8 = minnieStateSpecs[12 * [(NTKCharacterRenderer *)self curState] + 3];
  v9 = [(NTKCharacterRenderer *)self loader];
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  v10 = [(_Skirt *)self->_skirt texs];
  float v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[NTKCharacterRenderer curPose](self, "curPose"));
  float v12 = [v9 getMTLTexture:v11];

  [v4 setFragmentTexture:v12 atIndex:0];
  [(NTKCharacterRenderer *)self _applyClothingColorWithEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_skirt, "mtlBufOffset"), 0);
  [(NTKCharacterRenderer *)self characterScale];
  float v40 = v13;
  [(NTKCharacterRenderer *)self curTimeMod1Sec];
  float32x2_t v15 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)vdup_lane_s32(v14, 0), (float32x2_t)1048576000)), (float64x2_t)xmmword_15130));
  float v37 = v15.f32[0];
  float v38 = cosf(v15.f32[1]);
  v16.f32[0] = cosf(v37);
  v16.f32[1] = v38;
  float32x2_t v17 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v16), (float64x2_t)xmmword_15140));
  simd_float4 v18 = matrix_identity_float4x4.columns[1];
  v41[0] = matrix_identity_float4x4.columns[0];
  v41[1] = v18;
  simd_float4 v19 = matrix_identity_float4x4.columns[3];
  v41[2] = matrix_identity_float4x4.columns[2];
  v41[3] = v19;
  float v20 = [(NTKCharacterRenderer *)self body];
  [v20 bone];
  float32x2_t v42 = vmul_n_f32(v21, v40);
  [(NTKCharacterRenderer *)self dampenBones];
  float32x2_t v43 = vmul_n_f32(v17, v22);
  [(NTKCharacterRenderer *)self globalScale];
  uint64_t v44 = v23;
  v17.f32[0] = v8 * v40;
  double v24 = [(NTKCharacterRenderer *)self body];
  [v24 width];
  float v39 = (float)(v8 * v40) * v25;
  float v26 = [(NTKCharacterRenderer *)self body];
  [v26 height];
  *(float *)&uint64_t v27 = v39;
  *((float *)&v27 + 1) = v40 * v28;
  uint64_t v45 = v27;
  [(NTKCharacterRenderer *)self globalOffset];
  float32x2_t v30 = v29;
  [(NTKCharacterRenderer *)self globalScale];
  float32x2_t v32 = vmul_n_f32(v31, v40);
  unsigned int v33 = [(NTKCharacterRenderer *)self body];
  [v33 offset];
  float32x2_t v35 = vmla_f32(v30, v34, v32);
  v36.f64[0] = (float)(v17.f32[0] * 0.0);
  v36.f64[1] = v40 * 5.0;
  float32x2_t v46 = v35;
  float32x2_t v47 = vcvt_f32_f64(vmulq_f64(v36, (float64x2_t)vdupq_n_s64(0x3F6A41A41A41A41AuLL)));

  [v4 setVertexBytes:v41 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:8];

LABEL_6:
}

- (void)_drawHeadWithEncoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCharacterRendererMinnie;
  id v4 = a3;
  [(NTKCharacterRenderer *)&v5 _drawHeadWithEncoder:v4];
  -[NTKCharacterRendererMinnie _drawFlowerWithEncoder:](self, "_drawFlowerWithEncoder:", v4, v5.receiver, v5.super_class);
}

- (void)_drawTappingFootWithEncoder:(id)a3
{
  footTexs = self->_footTexs;
  id v5 = a3;
  unsigned int v6 = footTexs[[(NTKCharacterRenderer *)self curPose]];
  unsigned int v7 = [(NTKCharacterRenderer *)self foot];
  [v7 setTexs:v6];

  v8.receiver = self;
  v8.super_class = (Class)NTKCharacterRendererMinnie;
  [(NTKCharacterRenderer *)&v8 _drawTappingFootWithEncoder:v5];
}

- (void)_drawBodyWithEncoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCharacterRendererMinnie;
  id v4 = a3;
  [(NTKCharacterRenderer *)&v5 _drawBodyWithEncoder:v4];
  -[NTKCharacterRendererMinnie _drawSkirtWithEncoder:](self, "_drawSkirtWithEncoder:", v4, v5.receiver, v5.super_class);
}

- (float)_getBlinkDuration
{
  return 0.15;
}

- (int)getBlinkFrameFor15sTime:(float)a3
{
  double v3 = a3;
  if (v3 >= 0.1) {
    int v4 = 1;
  }
  else {
    int v4 = 2;
  }
  if (v3 < 0.05) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void).cxx_destruct
{
  footTexs = self->_footTexs;
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&footTexs[i], 0);
  objc_storeStrong((id *)&self->_skirt, 0);

  objc_storeStrong((id *)&self->_flower, 0);
}

@end