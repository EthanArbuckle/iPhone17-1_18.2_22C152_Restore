@interface BSUIVibrancyEffectValues
+ (CAColorMatrix)_colorizedMaterialBackdropMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
+ (CAColorMatrix)_colorizedVibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
+ (CAColorMatrix)_materialBackdropColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
+ (CAColorMatrix)_vibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
- (CAColorMatrix)backdropColorMatrix;
- (CAColorMatrix)vibrantColorMatrix;
- (NSString)groupName;
- (id)transformBackdropColor:(id)a3;
- (id)transformColor:(id)a3 withVibrantMask:(id)a4;
- (id)transformVibrantColor:(id)a3;
- (void)calculateValuesForConfiguration:(id)a3;
@end

@implementation BSUIVibrancyEffectValues

- (void)calculateValuesForConfiguration:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  long long v51 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  long long v52 = v5;
  long long v53 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  float32x4_t v49 = *(float32x4_t *)MEMORY[0x1E4F39AD8];
  long long v50 = v6;
  long long v46 = v51;
  long long v47 = v5;
  long long v48 = v53;
  float32x4_t v44 = v49;
  long long v45 = v6;
  uint64_t v7 = [v4 groupName];
  v8 = (void *)v7;
  if (v4)
  {
    double v9 = 1.0;
    do
    {
      v10 = [v4 color];
      uint64_t v11 = [v4 effectType];
      uint64_t v12 = [v4 backgroundType];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      float32x4_t v39 = 0u;
      +[BSUIVibrancyEffectValues _materialBackdropColorMatrixForType:v11 heroColor:v10 backgroundType:v12];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      float32x4_t v34 = 0u;
      +[BSUIVibrancyEffectValues _vibrancyMatrixForType:v11 heroColor:v10 backgroundType:v12];
      long long v31 = v51;
      long long v32 = v52;
      long long v33 = v53;
      float32x4_t v29 = v49;
      long long v30 = v50;
      long long v26 = v41;
      long long v27 = v42;
      long long v28 = v43;
      float32x4_t v24 = v39;
      long long v25 = v40;
      _lerpColorMatrices((uint64_t)&v49, (float32x2_t *)&v29, &v24, v9);
      long long v31 = v46;
      long long v32 = v47;
      long long v33 = v48;
      float32x4_t v29 = v44;
      long long v30 = v45;
      long long v26 = v36;
      long long v27 = v37;
      long long v28 = v38;
      float32x4_t v24 = v34;
      long long v25 = v35;
      objc_msgSend(v4, "blendAmount", *(double *)_lerpColorMatrices((uint64_t)&v44, (float32x2_t *)&v29, &v24, v9).i64);
      double v14 = v13;
      v15 = [v4 blendConfiguration];

      if (!v15) {
        break;
      }
      double v9 = v9 * v14;
      id v4 = v15;
    }
    while (v9 > 0.00000011920929);
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
    v15 = 0;
    if (v7)
    {
LABEL_6:
      v16 = NSString;
      long long v41 = v51;
      long long v42 = v52;
      long long v43 = v53;
      float32x4_t v39 = v49;
      long long v40 = v50;
      unint64_t v17 = _colorMatrixHash(v39.f32);
      long long v41 = v46;
      long long v42 = v47;
      long long v43 = v48;
      float32x4_t v39 = v44;
      long long v40 = v45;
      v18 = [v16 stringWithFormat:@"%@-%lu-%lu", v8, v17, _colorMatrixHash(v39.f32)];
      goto LABEL_9;
    }
  }
  v18 = 0;
LABEL_9:
  objc_storeStrong((id *)&self->_groupName, v18);
  if (v8) {

  }
  long long v19 = v52;
  *(_OWORD *)&self->_backdropColorMatrix.m24 = v51;
  *(_OWORD *)&self->_backdropColorMatrix.m33 = v19;
  *(_OWORD *)&self->_backdropColorMatrix.m42 = v53;
  long long v20 = v50;
  *(float32x4_t *)&self->_backdropColorMatrix.m11 = v49;
  *(_OWORD *)&self->_backdropColorMatrix.m15 = v20;
  long long v21 = v48;
  long long v22 = v46;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v47;
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v21;
  long long v23 = v45;
  *(float32x4_t *)&self->_vibrantColorMatrix.m11 = v44;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v23;
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v22;
}

- (id)transformVibrantColor:(id)a3
{
  id v4 = a3;
  [(BSUIVibrancyEffectValues *)self vibrantColorMatrix];
  long long v5 = _transformUIColor(v4, &v7);

  return v5;
}

- (id)transformBackdropColor:(id)a3
{
  id v4 = a3;
  [(BSUIVibrancyEffectValues *)self backdropColorMatrix];
  long long v5 = _transformUIColor(v4, &v7);

  return v5;
}

- (id)transformColor:(id)a3 withVibrantMask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BSUIVibrancyEffectValues *)self transformBackdropColor:v6];
  [v7 alphaComponent];
  double v9 = objc_msgSend(v8, "colorWithAlphaComponent:");
  v10 = [v6 _colorBlendedWithColor:v9];
  uint64_t v11 = [(BSUIVibrancyEffectValues *)self transformVibrantColor:v10];
  [v7 _luminance];
  double v13 = v12;
  [v7 alphaComponent];
  v15 = [v11 colorWithAlphaComponent:v13 * v14];
  v16 = [v10 _colorBlendedWithColor:v15];

  return v16;
}

+ (CAColorMatrix)_materialBackdropColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v10 = a5;
  id v15 = v10;
  if ((unint64_t)a4 < 2)
  {
    [a2 _colorizedMaterialBackdropMatrixForType:a4 heroColor:v10 backgroundType:a6];
    goto LABEL_11;
  }
  if (a4 == 3) {
    goto LABEL_9;
  }
  if (a4 != 2) {
    goto LABEL_11;
  }
  if (a6 && a6 != 2)
  {
    if (a6 == 1)
    {
      *(_OWORD *)&retstr->m21 = 0u;
      *(_OWORD *)&retstr->m25 = 0u;
      *(_OWORD *)&retstr->m42 = 0u;
      *(_OWORD *)&retstr->m34 = 0u;
      *(_OWORD *)&retstr->m12 = 0u;
      retstr->m11 = 0.88;
      retstr->m22 = 0.88;
      retstr->m33 = 0.88;
      retstr->m44 = 1.0;
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v11 = (_OWORD *)MEMORY[0x1E4F39AD8];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
    *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
    *(_OWORD *)&retstr->m33 = v12;
    *(_OWORD *)&retstr->m42 = v11[4];
    long long v13 = v11[1];
    *(_OWORD *)&retstr->m11 = *v11;
    *(_OWORD *)&retstr->m15 = v13;
    goto LABEL_11;
  }
  *(_OWORD *)&retstr->m11 = xmmword_1A2B29090;
  *(_OWORD *)&retstr->m15 = xmmword_1A2B290A0;
  *(_OWORD *)&retstr->m24 = xmmword_1A2B290B0;
  *(_OWORD *)&retstr->m33 = xmmword_1A2B290C0;
  *(_OWORD *)&retstr->m42 = xmmword_1A2B290D0;
LABEL_11:

  return result;
}

+ (CAColorMatrix)_colorizedMaterialBackdropMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v8 = a5;
  double v35 = 0.0;
  double v36 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  [v8 getRed:&v36 green:&v35 blue:&v34 alpha:&v33];
  if (a4)
  {
    HIDWORD(v9) = HIDWORD(v34);
    float v10 = v36;
    float v11 = v35;
    float v12 = v34;
  }
  else
  {
    double v34 = 0.9;
    double v35 = 0.9;
    double v36 = 0.9;
    float v12 = 0.9;
    float v11 = 0.9;
    float v10 = 0.9;
  }
  float v13 = v33;
  *(_OWORD *)&retstr->m24 = xmmword_1A2B29270;
  *(_OWORD *)&retstr->m33 = unk_1A2B29280;
  *(_OWORD *)&retstr->m42 = xmmword_1A2B29290;
  *(_OWORD *)&retstr->m11 = xmmword_1A2B29250;
  *(_OWORD *)&retstr->m15 = unk_1A2B29260;
  LODWORD(v9) = 0.5;
  _curve(COERCE_DOUBLE(__PAIR64__(unk_1A2B29264, LODWORD(v13))), 0.0, v9, (__n128)xmmword_1A2B290E0);
  if (a4)
  {
    LODWORD(v15) = 0.5;
    *(float *)&double v14 = v13;
    _curve(v14, 0.0, v15, (__n128)xmmword_1A2B290E0);
  }
  *(_OWORD *)&v27[16] = xmmword_1A2B29270;
  *(_OWORD *)&v27[32] = unk_1A2B29280;
  *(_OWORD *)&v27[48] = xmmword_1A2B29290;
  long long v26 = xmmword_1A2B29250;
  *(_OWORD *)long long v27 = unk_1A2B29260;
  CAColorMatrixConcat();
  long long v16 = v31;
  *(_OWORD *)&retstr->m24 = v30;
  *(_OWORD *)&retstr->m33 = v16;
  *(_OWORD *)&retstr->m42 = v32;
  long long v17 = v29;
  *(_OWORD *)&retstr->m11 = v28;
  *(_OWORD *)&retstr->m15 = v17;
  long long v18 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v27[16] = *(_OWORD *)&retstr->m24;
  *(_OWORD *)&v27[32] = v18;
  *(_OWORD *)&v27[48] = *(_OWORD *)&retstr->m42;
  long long v19 = *(_OWORD *)&retstr->m15;
  long long v26 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)long long v27 = v19;
  CAColorMatrixConcat();
  long long v20 = v31;
  *(_OWORD *)&retstr->m24 = v30;
  *(_OWORD *)&retstr->m33 = v20;
  *(_OWORD *)&retstr->m42 = v32;
  long long v21 = v29;
  *(_OWORD *)&retstr->m11 = v28;
  *(_OWORD *)&retstr->m15 = v21;
  if (a4)
  {
    long long v22 = *(_OWORD *)&retstr->m33;
    float v23 = v13 * 0.25 / (v13 * 0.5 + -0.25 - v13 + 1.0) + 0.0;
    long long v30 = *(_OWORD *)&retstr->m24;
    long long v31 = v22;
    long long v32 = *(_OWORD *)&retstr->m42;
    long long v24 = *(_OWORD *)&retstr->m15;
    long long v28 = *(_OWORD *)&retstr->m11;
    long long v29 = v24;
    long long v26 = xmmword_1A2B29090;
    *(float *)long long v27 = v10 * 0.2;
    *(_OWORD *)&v27[4] = xmmword_1A2B29100;
    *(float *)&v27[20] = v11 * 0.2;
    *(_OWORD *)&v27[24] = xmmword_1A2B29110;
    *(float *)&v27[40] = v12 * 0.2;
    *(_OWORD *)&v27[44] = xmmword_1A2B290F0;
    *(_DWORD *)&v27[60] = 0;
    _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)&v28, (float32x4_t *)&v26, (float)((float)(v23 * 0.9) + 0.1));
  }

  return result;
}

+ (CAColorMatrix)_vibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v10 = a5;
  id v15 = v10;
  if ((unint64_t)a4 < 2) {
    goto LABEL_8;
  }
  if (a4 == 3)
  {
    float v11 = (_OWORD *)MEMORY[0x1E4F39AD8];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
    *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
    *(_OWORD *)&retstr->m33 = v12;
    *(_OWORD *)&retstr->m42 = v11[4];
    long long v13 = v11[1];
    *(_OWORD *)&retstr->m11 = *v11;
    *(_OWORD *)&retstr->m15 = v13;
    goto LABEL_12;
  }
  if (a4 != 2) {
    goto LABEL_12;
  }
  if (!a6 || a6 == 2)
  {
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m15 = 0u;
    retstr->m15 = 1.25;
    retstr->m25 = 1.25;
    retstr->m35 = 1.25;
    goto LABEL_11;
  }
  if (a6 != 1)
  {
LABEL_8:
    [a2 _colorizedVibrancyMatrixForType:a4 heroColor:v10 backgroundType:a6];
    goto LABEL_12;
  }
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m15 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
LABEL_11:
  retstr->m44 = 1.0;
LABEL_12:

  return result;
}

+ (CAColorMatrix)_colorizedVibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  double v32 = 0.0;
  double v33 = 0.0;
  double v30 = 0.0;
  double v31 = 0.0;
  [a5 getRed:&v33 green:&v32 blue:&v31 alpha:&v30];
  if (!a4)
  {
    double v31 = 0.9;
    double v32 = 0.9;
    double v33 = 0.9;
  }
  float v8 = v30;
  float v9 = v33;
  float v10 = v32;
  float v11 = v31;
  *(_OWORD *)&retstr->m24 = xmmword_1A2B29270;
  *(_OWORD *)&retstr->m33 = unk_1A2B29280;
  *(_OWORD *)&retstr->m42 = xmmword_1A2B29290;
  *(_OWORD *)&retstr->m11 = xmmword_1A2B29250;
  *(_OWORD *)&retstr->m15 = unk_1A2B29260;
  *(_OWORD *)&v23[16] = xmmword_1A2B29270;
  *(_OWORD *)long long v24 = unk_1A2B29280;
  *(_OWORD *)&v24[16] = xmmword_1A2B29290;
  long long v22 = xmmword_1A2B29250;
  *(_OWORD *)float v23 = unk_1A2B29260;
  CAColorMatrixConcat();
  long long v12 = v28;
  *(_OWORD *)&retstr->m24 = v27;
  *(_OWORD *)&retstr->m33 = v12;
  *(_OWORD *)&retstr->m42 = v29;
  long long v13 = v26;
  *(_OWORD *)&retstr->m11 = v25;
  *(_OWORD *)&retstr->m15 = v13;
  if (a4)
  {
    long long v22 = 0uLL;
    float v14 = v8 * 0.2 / (v8 * 0.4 + -0.2 - v8 + 1.0) + 0.0;
    long long v15 = *(_OWORD *)&retstr->m33;
    long long v27 = *(_OWORD *)&retstr->m24;
    long long v28 = v15;
    long long v29 = *(_OWORD *)&retstr->m42;
    long long v16 = *(_OWORD *)&retstr->m15;
    long long v25 = *(_OWORD *)&retstr->m11;
    long long v26 = v16;
    *(float *)float v23 = v9;
    *(void *)&v23[12] = 0;
    *(void *)&v23[4] = 0;
    *(float *)&v23[20] = v10;
    *(void *)&v23[24] = 0;
    *(void *)long long v24 = 0;
    *(float *)&v24[8] = v11;
    *(_DWORD *)&v24[20] = 0;
    *(void *)&v24[12] = 0;
    *(void *)&v24[24] = 1065353216;
    _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)&v25, (float32x4_t *)&v22, (float)((float)(v14 * 0.95) + 0.05));
  }
  *(_OWORD *)&retstr->m41 = xmmword_1A2B29140;
  retstr->m45 = 0.0;
  long long v17 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v23[16] = *(_OWORD *)&retstr->m24;
  *(_OWORD *)long long v24 = v17;
  *(_OWORD *)&v24[16] = *(_OWORD *)&retstr->m42;
  long long v18 = *(_OWORD *)&retstr->m15;
  long long v22 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)float v23 = v18;
  result = (CAColorMatrix *)CAColorMatrixConcat();
  long long v20 = v28;
  *(_OWORD *)&retstr->m24 = v27;
  *(_OWORD *)&retstr->m33 = v20;
  *(_OWORD *)&retstr->m42 = v29;
  long long v21 = v26;
  *(_OWORD *)&retstr->m11 = v25;
  *(_OWORD *)&retstr->m15 = v21;
  return result;
}

- (CAColorMatrix)backdropColorMatrix
{
  long long v3 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[1].m15;
  long long v4 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (CAColorMatrix)vibrantColorMatrix
{
  long long v3 = *(_OWORD *)&self[2].m11;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[1].m42;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[2].m15;
  long long v4 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m24;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
}

@end