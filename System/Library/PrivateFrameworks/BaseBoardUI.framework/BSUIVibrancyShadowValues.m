@interface BSUIVibrancyShadowValues
+ (CAColorMatrix)_colorizedShadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
+ (CAColorMatrix)_darkeningShadowMatrix;
+ (CAColorMatrix)_lighteningShadowMatrix;
+ (CAColorMatrix)_shadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5;
- (CAColorMatrix)vibrantColorMatrix;
- (id)transformShadowColor:(id)a3;
- (void)calculateValuesForConfiguration:(id)a3;
@end

@implementation BSUIVibrancyShadowValues

- (void)calculateValuesForConfiguration:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  long long v26 = v5;
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  long long v23 = *MEMORY[0x1E4F39AD8];
  long long v24 = v6;
  if (v4)
  {
    v7 = v4;
    double v8 = 1.0;
    do
    {
      float32x4_t v21 = 0u;
      float32x4_t v22 = 0u;
      float32x4_t v19 = 0u;
      float32x4_t v20 = 0u;
      float32x4_t v18 = 0u;
      uint64_t v9 = [v7 effectType];
      v10 = [v7 color];
      +[BSUIVibrancyShadowValues _shadowColorMatrixForType:heroColor:backgroundType:](BSUIVibrancyShadowValues, "_shadowColorMatrixForType:heroColor:backgroundType:", v9, v10, [v7 backgroundType]);

      v17[2] = v25;
      v17[3] = v26;
      v17[4] = v27;
      v17[0] = v23;
      v17[1] = v24;
      v16[2] = v20;
      v16[3] = v21;
      v16[4] = v22;
      v16[0] = v18;
      v16[1] = v19;
      objc_msgSend(v7, "blendAmount", *(double *)_lerpColorMatrices((uint64_t)&v23, (float32x2_t *)v17, v16, v8).i64);
      double v12 = v11;
      v13 = [v7 blendConfiguration];

      if (!v13) {
        break;
      }
      double v8 = v8 * v12;
      v7 = v13;
    }
    while (v8 > 0.00000011920929);
  }
  long long v14 = v26;
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v25;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v14;
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v27;
  long long v15 = v24;
  *(_OWORD *)&self->_vibrantColorMatrix.m11 = v23;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v15;
}

- (id)transformShadowColor:(id)a3
{
  id v4 = a3;
  [(BSUIVibrancyShadowValues *)self vibrantColorMatrix];
  long long v5 = _transformUIColor(v4, &v7);

  return v5;
}

+ (CAColorMatrix)_lighteningShadowMatrix
{
  *retstr = *(CAColorMatrix *)byte_1A2B29150;
  return result;
}

+ (CAColorMatrix)_darkeningShadowMatrix
{
  *(_OWORD *)&retstr->m11 = xmmword_1A2B291A0;
  *(_OWORD *)&retstr->m15 = xmmword_1A2B291B0;
  *(_OWORD *)&retstr->m24 = xmmword_1A2B291C0;
  *(_OWORD *)&retstr->m33 = xmmword_1A2B291D0;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&byte_1A2B29150[64];
  return result;
}

+ (CAColorMatrix)_shadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v14 = a5;
  switch(a4)
  {
    case 0:
    case 2:
      if (!a6 || a6 == 2)
      {
        [a2 _darkeningShadowMatrix];
      }
      else
      {
        if (a6 != 1) {
          goto LABEL_6;
        }
        [a2 _lighteningShadowMatrix];
      }
      break;
    case 1:
LABEL_6:
      [a2 _colorizedShadowColorMatrixForType:a4 heroColor:v14 backgroundType:a6];
      break;
    case 3:
      v10 = (_OWORD *)MEMORY[0x1E4F39AD8];
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
      *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
      *(_OWORD *)&retstr->m33 = v11;
      *(_OWORD *)&retstr->m42 = v10[4];
      long long v12 = v10[1];
      *(_OWORD *)&retstr->m11 = *v10;
      *(_OWORD *)&retstr->m15 = v12;
      break;
    default:
      break;
  }

  return result;
}

+ (CAColorMatrix)_colorizedShadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  double v35 = 0.0;
  double v36 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  [a5 getRed:&v36 green:&v35 blue:&v34 alpha:&v33];
  HIDWORD(v13) = HIDWORD(v36);
  *(float *)&double v13 = v36;
  float v9 = v35;
  HIDWORD(v10) = HIDWORD(v34);
  *(float *)&double v10 = v34;
  float v11 = v33;
  float v12 = 0.0;
  *(float *)&double v13 = (float)((float)((float)((float)(v9 * 0.7152) + (float)(*(float *)&v13 * 0.2126))
                                 + (float)(*(float *)&v10 * 0.0722))
                         + (float)(v11 * 0.0))
                 + 0.0;
  if (!a6 || a6 == 2)
  {
    LODWORD(v10) = 0.5;
    float v17 = _curve(v13, 0.3, v10, (__n128)xmmword_1A2B291E0);
    *(float *)&double v18 = 1.0 - v11;
    LODWORD(v19) = 1053609165;
    float v12 = (float)((float)((float)(v17 + -0.3) / 0.2) + 0.0)
        + (float)((float)(1.0 - (float)((float)((float)(v17 + -0.3) / 0.2) + 0.0))
                * (float)(_curve(v18, 0.0, v19, (__n128)xmmword_1A2B290E0) / 0.4));
  }
  else if (a6 == 1)
  {
    LODWORD(v10) = 1062836634;
    float v14 = _curve(v13, 0.65, v10, (__n128)xmmword_1A2B291E0);
    LODWORD(v15) = 1.0;
    *(float *)&double v16 = v11;
    float v12 = (float)((float)((float)((float)(v14 + -0.65) / 0.2) + 0.0)
                * (float)((float)(_curve(v16, 0.6, v15, (__n128)xmmword_1A2B291F0) + -0.6) / 0.4))
        + 0.0;
  }
  float32x4_t v31 = 0u;
  float32x4_t v32 = 0u;
  float32x4_t v29 = 0u;
  float32x4_t v30 = 0u;
  float32x4_t v28 = 0u;
  [a2 _lighteningShadowMatrix];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  [a2 _darkeningShadowMatrix];
  v22[2] = v25;
  v22[3] = v26;
  v22[4] = v27;
  v22[0] = v23;
  v22[1] = v24;
  v21[2] = v30;
  v21[3] = v31;
  v21[4] = v32;
  v21[0] = v28;
  v21[1] = v29;
  _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)v22, v21, v12);
  return result;
}

- (CAColorMatrix)vibrantColorMatrix
{
  long long v3 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self->m35;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[1].m13;
  long long v4 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

@end