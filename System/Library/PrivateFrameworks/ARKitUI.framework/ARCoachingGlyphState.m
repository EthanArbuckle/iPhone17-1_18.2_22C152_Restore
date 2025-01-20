@interface ARCoachingGlyphState
- (ARCoachingGlyphState)init;
- (ARCoachingGlyphStateDelegate)delegate;
- (BOOL)isVertical;
- (__n128)bottomPlaneTranslationTarget;
- (__n128)quaternionTarget;
- (__n128)scaleTarget;
- (__n128)topPlaneTranslationTarget;
- (int8x16_t)computeBottomPlaneTranslationTarget;
- (int8x16_t)computeScaleTarget;
- (int8x16_t)computeTopPlaneTranslationTarget;
- (uint64_t)computeQuaternionTarget;
- (unint64_t)snapState;
- (void)setBottomPlaneTranslationTarget:(ARCoachingGlyphState *)self;
- (void)setDelegate:(id)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)setQuaternionTarget:(_OWORD *)a3;
- (void)setScaleTarget:(ARCoachingGlyphState *)self;
- (void)setSnapState:(unint64_t)a3;
- (void)setTopPlaneTranslationTarget:(ARCoachingGlyphState *)self;
@end

@implementation ARCoachingGlyphState

- (ARCoachingGlyphState)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARCoachingGlyphState;
  result = [(ARCoachingGlyphState *)&v3 init];
  if (result) {
    result->_snapState = 1;
  }
  return result;
}

- (unint64_t)snapState
{
  return self->_snapState;
}

- (void)setSnapState:(unint64_t)a3
{
  self->_snapState = a3;
  v4 = [(ARCoachingGlyphState *)self delegate];

  if (v4)
  {
    v5 = [(ARCoachingGlyphState *)self delegate];
    [v5 snapStateChanged];

    [(ARCoachingGlyphState *)self computeQuaternionTarget];
    v9[0] = v9[2];
    v9[1] = v9[3];
    [(ARCoachingGlyphState *)self setQuaternionTarget:v9];
    [(ARCoachingGlyphState *)self computeScaleTarget];
    v8[0] = v8[2];
    v8[1] = v8[3];
    [(ARCoachingGlyphState *)self setScaleTarget:v8];
    [(ARCoachingGlyphState *)self computeTopPlaneTranslationTarget];
    v7[0] = v7[2];
    v7[1] = v7[3];
    [(ARCoachingGlyphState *)self setTopPlaneTranslationTarget:v7];
    [(ARCoachingGlyphState *)self computeBottomPlaneTranslationTarget];
    v6[0] = v6[2];
    v6[1] = v6[3];
    [(ARCoachingGlyphState *)self setBottomPlaneTranslationTarget:v6];
  }
}

- (__n128)quaternionTarget
{
  __n128 result = *(__n128 *)(a1 + 16);
  long long v3 = *(_OWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setQuaternionTarget:(_OWORD *)a3
{
  long long v4 = a3[1];
  a1[1] = *a3;
  a1[2] = v4;
  v5 = [a1 delegate];

  if (v5)
  {
    id v6 = [a1 delegate];
    [v6 quaternionTargetChanged];
  }
}

- (__n128)scaleTarget
{
  __n128 result = *(__n128 *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setScaleTarget:(ARCoachingGlyphState *)self
{
  long long v4 = v2[1];
  *(_OWORD *)self->_scaleTarget = *v2;
  *(_OWORD *)&self->_scaleTarget[16] = v4;
  v5 = [(ARCoachingGlyphState *)self delegate];

  if (v5)
  {
    id v6 = [(ARCoachingGlyphState *)self delegate];
    [v6 scaleTargetChanged];
  }
}

- (void)setTopPlaneTranslationTarget:(ARCoachingGlyphState *)self
{
  long long v4 = v2[1];
  *(_OWORD *)self->_topPlaneTranslationTarget = *v2;
  *(_OWORD *)&self->_topPlaneTranslationTarget[16] = v4;
  v5 = [(ARCoachingGlyphState *)self delegate];

  if (v5)
  {
    id v6 = [(ARCoachingGlyphState *)self delegate];
    [v6 topPlaneTranslationTargetChanged];
  }
}

- (void)setBottomPlaneTranslationTarget:(ARCoachingGlyphState *)self
{
  long long v4 = v2[1];
  *(_OWORD *)self->_bottomPlaneTranslationTarget = *v2;
  *(_OWORD *)&self->_bottomPlaneTranslationTarget[16] = v4;
  v5 = [(ARCoachingGlyphState *)self delegate];

  if (v5)
  {
    id v6 = [(ARCoachingGlyphState *)self delegate];
    [v6 bottomPlaneTranslationTargetChanged];
  }
}

- (uint64_t)computeQuaternionTarget
{
  uint64_t result = [a1 snapState];
  switch(result)
  {
    case 0:
      if (a1[88])
      {
        long long v6 = xmmword_20B2321A0;
        long long v7 = xmmword_20B2321B0;
      }
      else
      {
        long long v6 = xmmword_20B2321C0;
        long long v7 = xmmword_20B2321D0;
      }
      goto LABEL_14;
    case 1:
    case 2:
      float64x2_t v5 = (float64x2_t)xmmword_20B232190;
      a2[1] = xmmword_20B232190;
      goto LABEL_9;
    case 3:
      +[ARCoachingTransformations lookAt:-0.0000305175781 center:0.0 up:0.0078125];
      uint64_t result = (uint64_t)+[ARCoachingTransformations fromMatrix:](ARCoachingTransformations, "fromMatrix:");
      float64x2_t v5 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_20B232130, (float64x2_t)0, 1), (float64x2_t)xmmword_20B232160, 0.0), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_20B232170, (float64x2_t)0, 1), (float64x2_t)xmmword_20B232180, 0.0));
      a2[1] = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_20B232140, (float64x2_t)0, 1), (float64x2_t)xmmword_20B232150, 0.0), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_20B232130, (float64x2_t)0, 1), (float64x2_t)xmmword_20B232160, 0.0));
LABEL_9:
      *a2 = v5;
      break;
    case 4:
      if (a1[88])
      {
        long long v6 = xmmword_20B2320F0;
        long long v7 = xmmword_20B232100;
      }
      else
      {
        long long v6 = xmmword_20B232110;
        long long v7 = xmmword_20B232120;
      }
LABEL_14:
      *a2 = v7;
      a2[1] = v6;
      break;
    default:
      uint64_t result = [a1 quaternionTarget];
      break;
  }
  return result;
}

- (int8x16_t)computeScaleTarget
{
  uint64_t v4 = [a1 snapState];
  result.i64[0] = 0x3FB999999999999ALL;
  unint64_t v6 = 0x3FB999999999999ALL;
  *(void *)&long long v7 = 0x3FB999999999999ALL;
  switch(v4)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
      result.i64[0] = 1.0;
      unint64_t v6 = 1.0;
      *(void *)&long long v7 = 1.0;
      break;
    case 4:
      result.i64[0] = 0x3FD3333333333333;
      unint64_t v6 = 0x3FD3333333333333;
      *(void *)&long long v7 = 0x3FD3333333333333;
      break;
    default:
      objc_msgSend(a1, "scaleTarget", 0.1, 0.1, 0.1);
      int8x16_t result = v8;
      unint64_t v6 = vextq_s8(result, result, 8uLL).u64[0];
      *(void *)&long long v7 = v9;
      break;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v7;
  return result;
}

- (int8x16_t)computeTopPlaneTranslationTarget
{
  uint64_t v4 = [a1 snapState];
  result.i64[0] = 0;
  unint64_t v6 = 0;
  *(void *)&long long v7 = 0;
  switch(v4)
  {
    case 0:
    case 4:
      break;
    case 1:
    case 2:
      result.i64[0] = 0;
      unint64_t v6 = -2.0;
      goto LABEL_5;
    case 3:
      result.i64[0] = 0;
      unint64_t v6 = -1.0;
LABEL_5:
      *(void *)&long long v7 = 0;
      break;
    default:
      objc_msgSend(a1, "topPlaneTranslationTarget", 0.0, 0.0, 0.0);
      int8x16_t result = v8;
      unint64_t v6 = vextq_s8(result, result, 8uLL).u64[0];
      *(void *)&long long v7 = v9;
      break;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v7;
  return result;
}

- (int8x16_t)computeBottomPlaneTranslationTarget
{
  unint64_t v4 = [a1 snapState];
  *(void *)&long long v5 = 0;
  result.i64[0] = 0;
  unint64_t v7 = 0;
  if (v4 >= 3 && v4 != 4)
  {
    if (v4 == 3)
    {
      result.i64[0] = 0;
      unint64_t v7 = 1.0;
      *(void *)&long long v5 = 0;
    }
    else
    {
      objc_msgSend(a1, "bottomPlaneTranslationTarget", 0.0, 0.0, 0.0);
      int8x16_t result = v8;
      unint64_t v7 = vextq_s8(result, result, 8uLL).u64[0];
      *(void *)&long long v5 = v9;
    }
  }
  result.i64[1] = v7;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (ARCoachingGlyphStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARCoachingGlyphStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (__n128)topPlaneTranslationTarget
{
  __n128 result = *(__n128 *)(a1 + 112);
  long long v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)bottomPlaneTranslationTarget
{
  __n128 result = *(__n128 *)(a1 + 144);
  long long v3 = *(_OWORD *)(a1 + 160);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

- (void).cxx_destruct
{
}

@end