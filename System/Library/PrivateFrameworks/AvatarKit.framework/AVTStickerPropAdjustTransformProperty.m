@interface AVTStickerPropAdjustTransformProperty
- (AVTStickerPropAdjustTransformProperty)initWithPresetCategory:(int64_t)a3 presetValue:(id)a4 position:rotation:scale:;
- (__n128)position;
- (__n128)rotation;
- (__n128)scale;
- (id)presetValue;
- (int64_t)presetCategory;
- (void)applyAdjustmentIfNeededToNode:(id)a3 forMemoji:(id)a4 ignoreScaleZ:(BOOL)a5;
@end

@implementation AVTStickerPropAdjustTransformProperty

- (AVTStickerPropAdjustTransformProperty)initWithPresetCategory:(int64_t)a3 presetValue:(id)a4 position:rotation:scale:
{
  long long v15 = v5;
  long long v16 = v6;
  long long v14 = v4;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerPropAdjustTransformProperty;
  v11 = [(AVTStickerPropAdjustTransformProperty *)&v17 init];
  v12 = v11;
  if (v11)
  {
    *(_OWORD *)v11->_rotation = v15;
    *(_OWORD *)v11->_scale = v16;
    *(_OWORD *)v11->_position = v14;
    v11->_presetCategory = a3;
    objc_storeStrong(&v11->_presetValue, a4);
  }

  return v12;
}

- (void)applyAdjustmentIfNeededToNode:(id)a3 forMemoji:(id)a4 ignoreScaleZ:(BOOL)a5
{
  BOOL v5 = a5;
  id v25 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v8, "presetForCategory:", -[AVTStickerPropAdjustTransformProperty presetCategory](self, "presetCategory"));

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id presetValue = self->_presetValue;
  if (isKindOfClass)
  {
    v12 = [v9 identifier];
    char v13 = [presetValue isEqualToString:v12];

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_6:
    [(AVTStickerPropAdjustTransformProperty *)self position];
    float32x4_t v23 = v16;
    [v25 simdPosition];
    objc_msgSend(v25, "setSimdPosition:", *(double *)vaddq_f32(v23, v17).i64);
    [(AVTStickerPropAdjustTransformProperty *)self rotation];
    v23.i64[0] = v18;
    [v25 simdEulerAngles];
    objc_msgSend(v25, "setSimdEulerAngles:", *(double *)vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0)).i64);
    if (v5)
    {
      [v25 simdScale];
      float32x4_t v24 = v20;
      [(AVTStickerPropAdjustTransformProperty *)self scale];
    }
    else
    {
      [(AVTStickerPropAdjustTransformProperty *)self scale];
      float32x4_t v24 = v22;
      [v25 simdScale];
    }
    objc_msgSend(v25, "setSimdScale:", *(double *)vmulq_f32(v24, v21).i64);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = self->_presetValue;
    long long v15 = [v9 identifier];
    LODWORD(v14) = [v14 containsObject:v15];

    if (v14) {
      goto LABEL_6;
    }
  }
LABEL_10:
}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (id)presetValue
{
  return self->_presetValue;
}

- (__n128)position
{
  return a1[2];
}

- (__n128)rotation
{
  return a1[3];
}

- (__n128)scale
{
  return a1[4];
}

- (void).cxx_destruct
{
}

@end