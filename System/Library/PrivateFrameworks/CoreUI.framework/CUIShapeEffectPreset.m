@interface CUIShapeEffectPreset
+ (_CUIVibrantColorMatrixOptions)monochromeVibrantColorMatrixOptions;
+ (_CUIVibrantColorMatrixOptions)standardVibrantColorMatrixOptionsForColor:(SEL)a3;
+ (_CUIVibrantColorMatrixOptions)vibrantColorMatrixOptionsWithColor:(SEL)a3 saturation:(CGColor *)a4 brightness:(double)a5;
+ (id)caFilterFromCUIEffectBlendMode:(unsigned int)a3;
+ (id)requiredEffectParametersForEffectType:(unsigned int)a3;
+ (int)cgBlendModeFromCUIEffectBlendMode:(unsigned int)a3;
+ (unsigned)cuiEffectBlendModeFromCGBlendMode:(int)a3;
+ (void)configureVibrantColorMatrixFilter:(id)a3 withOptions:(_CUIVibrantColorMatrixOptions *)a4;
- ($BEFD66571C471BB2AEB14086D2581294)valueForParameter:(unsigned int)a3 inEffectAtIndex:(unint64_t)a4;
- (CUIShapeEffectPreset)init;
- (CUIShapeEffectPreset)initWithConstantPreset:(id *)a3;
- (CUIShapeEffectPreset)initWithEffectScale:(double)a3;
- (double)effectScale;
- (float)minimumShadowSpread;
- (id)CUIEffectDataRepresentation;
- (id)debugDescription;
- (id)layerEffectsRepresentation;
- (uint64_t)setScaleFactor:(uint64_t)result;
- (unint64_t)_parameterCount;
- (unint64_t)effectCount;
- (unsigned)effectTypeAtIndex:(unint64_t)a3;
- (void)_insertEffectTuple:(id)a3 atEffectIndex:(unint64_t)a4;
- (void)addBevelEmbossWithHighlightColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 shadowColorRed:(unsigned int)a7 green:(unsigned int)a8 blue:(unsigned int)a9 opacity:(double)a10 blur:(int)a11 soften:(int)a12 bevelStyle:(unsigned int)a13;
- (void)addColorFillWithRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blendMode:(unsigned int)a7 tintable:(BOOL)a8;
- (void)addColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withNewEffectType:(unsigned int)a7;
- (void)addDropShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10;
- (void)addEffectsFromPreset:(id)a3;
- (void)addEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5;
- (void)addExtraShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10;
- (void)addFloatValue:(double)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5;
- (void)addGradientFillWithTopColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 bottomColorRed:(unsigned int)a6 green:(unsigned int)a7 blue:(unsigned int)a8 opacity:(double)a9 blendMode:(unsigned int)a10;
- (void)addHueSaturationWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 angle:(int)a6 width:(int)a7 tintable:(BOOL)a8;
- (void)addInnerGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 blendMode:(unsigned int)a8;
- (void)addInnerShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 offset:(int)a8 angle:(int)a9 blendMode:(unsigned int)a10;
- (void)addOuterGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8;
- (void)addOutputOpacityWithOpacity:(double)a3;
- (void)addShapeOpacityWithOpacity:(double)a3;
- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5 atEffectIndex:(unint64_t)a6;
- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5;
- (void)appendAngleValue:(int64_t)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5;
- (void)appendColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withEffectType:(unsigned int)a7;
- (void)appendEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5;
- (void)appendFloatValue:(double)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5;
- (void)appendValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5;
- (void)getEffectTuples:(id *)a3 count:(unint64_t *)a4 atEffectIndex:(unint64_t)a5;
- (void)setMinimumShadowSpread:(float)a3;
@end

@implementation CUIShapeEffectPreset

- (id)layerEffectsRepresentation
{
  v3 = objc_alloc_init(CUIPSDLayerEffects);
  unint64_t v4 = [(CUIShapeEffectPreset *)self effectCount];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      int v8 = [(CUIShapeEffectPreset *)self effectTypeAtIndex:v6];
      if (v8 <= 1198678371)
      {
        switch(v8)
        {
          case 1131375730:
            v9 = OBJC_CLASS___CUIPSDLayerEffectColorOverlay_ptr;
            goto LABEL_19;
          case 1148350320:
            v9 = OBJC_CLASS___CUIPSDLayerEffectDropShadow_ptr;
            goto LABEL_19;
          case 1164796531:
            v9 = OBJC_CLASS___CUIPSDLayerEffectBevelEmboss_ptr;
            goto LABEL_19;
        }
      }
      else if (v8 > 1768837991)
      {
        if (v8 == 1768837992)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectInnerShadow_ptr;
          goto LABEL_19;
        }
        if (v8 == 1866951799)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectOuterGlow_ptr;
          goto LABEL_19;
        }
      }
      else
      {
        if (v8 == 1198678372)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectGradientOverlay_ptr;
          goto LABEL_19;
        }
        if (v8 == 1766288503)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectInnerGlow_ptr;
LABEL_19:
          id v10 = [objc_alloc(*v9) initWithEffectFromPreset:self atIndex:v7];
          [(CUIPSDLayerEffects *)v3 addLayerEffectComponent:v10];
        }
      }
      unint64_t v6 = (v7 + 1);
      unint64_t v7 = v6;
    }
    while (v5 > v6);
  }
  return v3;
}

- (CUIShapeEffectPreset)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIShapeEffectPreset;
  result = [(CUIShapeEffectPreset *)&v3 init];
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_minimumShadowSpread = 0.0;
  }
  return result;
}

- (CUIShapeEffectPreset)initWithEffectScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CUIShapeEffectPreset;
  result = [(CUIShapeEffectPreset *)&v5 init];
  if (result)
  {
    result->_scaleFactor = a3;
    result->_minimumShadowSpread = 0.0;
  }
  return result;
}

+ (id)requiredEffectParametersForEffectType:(unsigned int)a3
{
  if ((int)a3 <= 1215653202)
  {
    if ((int)a3 > 1164796530)
    {
      if (a3 == 1164796531) {
        return &unk_1EF4A6CC0;
      }
      if (a3 != 1180787813)
      {
        BOOL v3 = a3 == 1198678372;
        unint64_t v4 = &unk_1EF4A6C48;
LABEL_10:
        if (v3) {
          return v4;
        }
        else {
          return 0;
        }
      }
      return &unk_1EF4A6C18;
    }
    int v6 = 1131375730;
    unint64_t v7 = &unk_1EF4A6C30;
    v9 = &unk_1EF4A6CA8;
    if (a3 != 1148350320) {
      v9 = 0;
    }
  }
  else
  {
    if ((int)a3 <= 1766288502)
    {
      if (a3 == 1215653203) {
        return &unk_1EF4A6CF0;
      }
      if (a3 != 1397715043)
      {
        BOOL v3 = a3 == 1484026465;
        unint64_t v4 = &unk_1EF4A6CD8;
        goto LABEL_10;
      }
      return &unk_1EF4A6C18;
    }
    int v6 = 1766288503;
    unint64_t v7 = &unk_1EF4A6C60;
    if (a3 == 1866951799) {
      int v8 = &unk_1EF4A6C90;
    }
    else {
      int v8 = 0;
    }
    if (a3 == 1768837992) {
      v9 = &unk_1EF4A6C78;
    }
    else {
      v9 = v8;
    }
  }
  if (a3 == v6) {
    return v7;
  }
  else {
    return v9;
  }
}

- (double)effectScale
{
  return self->_scaleFactor;
}

- (unint64_t)effectCount
{
  unsigned int v2 = 0;
  do
    unsigned int v3 = v2;
  while (self->_effectIndex[v2++]);
  return v3;
}

- (unsigned)effectTypeAtIndex:(unint64_t)a3
{
  if (a3 > 0x18 || !self->_effectIndex[a3])
  {
    +[NSException raise:NSInvalidArgumentException, @"Invalid effect index %lu for effect preset", a3 format];
    if (a3) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v5 = 0;
    return self->_parameterList[v5].effectType;
  }
  if (!a3) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v5 = *((int *)&self->_parameterList[124].effectValue.angleValue + a3 + 1);
  return self->_parameterList[v5].effectType;
}

- ($BEFD66571C471BB2AEB14086D2581294)valueForParameter:(unsigned int)a3 inEffectAtIndex:(unint64_t)a4
{
  if (a3 == 6) {
    unsigned int v7 = 90;
  }
  else {
    unsigned int v7 = 0;
  }
  if (a4 <= 0x18 && self->_effectIndex[a4])
  {
    if (a4)
    {
LABEL_7:
      int v8 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + a4 + 1);
      goto LABEL_10;
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Invalid effect index %lu for effect preset", a4 format];
    if (a4) {
      goto LABEL_7;
    }
  }
  int v8 = 0;
LABEL_10:
  unsigned int v9 = self->_effectIndex[a4];
  BOOL v10 = __OFSUB__(v9, v8);
  int v11 = v9 - v8;
  if ((v11 < 0) ^ v10 | (v11 == 0))
  {
LABEL_14:
    unint64_t v13 = 0;
  }
  else
  {
    v12 = (unsigned int *)((char *)&self->_parameterList[v8].effectValue.intValue + 2);
    while (*(unsigned int *)((char *)v12 - 6) != a3)
    {
      v12 += 4;
      if (!--v11) {
        goto LABEL_14;
      }
    }
    unsigned int v7 = *((unsigned __int16 *)v12 - 1);
    unint64_t v13 = ((unint64_t)*v12 << 16) | ((unint64_t)*((unsigned __int16 *)v12 + 2) << 48);
  }
  return ($BEFD66571C471BB2AEB14086D2581294)(v13 | v7);
}

- (void)_insertEffectTuple:(id)a3 atEffectIndex:(unint64_t)a4
{
  effectIndex = self->_effectIndex;
  unsigned int v5 = self->_effectIndex[a4];
  int v6 = self->_effectIndex[a4 + 1];
  if (a4 && !v5)
  {
    unsigned int v7 = &effectIndex[a4];
    unsigned int v5 = *(v7 - 1);
    *unsigned int v7 = v5;
  }
  if (v6 >= 1 && a4 + 1 <= 0x18)
  {
    unint64_t v9 = a4;
    do
      ++self->_effectIndex[++v9];
    while (v9 != 24);
  }
  self->_parameterList[v5] = ($227A92AB6917B72AF7983ACE8C3D385D)a3;
  ++effectIndex[a4];
}

- (void)getEffectTuples:(id *)a3 count:(unint64_t *)a4 atEffectIndex:(unint64_t)a5
{
  if (a5 <= 0x18 && self->_effectIndex[a5])
  {
    if (a5)
    {
LABEL_4:
      int v9 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + a5 + 1);
      goto LABEL_7;
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Invalid effect index %lu for effect preset", a5 format];
    if (a5) {
      goto LABEL_4;
    }
  }
  int v9 = 0;
LABEL_7:
  uint64_t v10 = (int)self->_effectIndex[a5];
  if (a3) {
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_parameterList[v9];
  }
  if (a4) {
    *a4 = v10 - v9;
  }
}

- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5 atEffectIndex:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  if (a6 >= 0x19)
  {
    +[NSException raise:NSRangeException, @"Invalid effect index %lu for effect preset", a6 format];
LABEL_4:
    uint64_t v11 = *((int *)&self->_parameterList[124].effectValue.angleValue + a6 + 1);
    goto LABEL_6;
  }
  if (a6) {
    goto LABEL_4;
  }
  uint64_t v11 = 0;
LABEL_6:
  if (self->_parameterList[v11].effectType != a5 && (signed int)self->_effectIndex[a6] >= 1) {
    +[NSException raise:NSInternalInconsistencyException, @"Attempt to add an effect with incompatible type at index %lu", a6 format];
  }
  -[CUIShapeEffectPreset _insertEffectTuple:atEffectIndex:](self, "_insertEffectTuple:atEffectIndex:", a5 | (unint64_t)(v8 << 32), a3.var1, a6);
}

- (void)appendValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  unsigned int v9 = [(CUIShapeEffectPreset *)self effectCount];
  uint64_t v10 = v9;
  if (v9)
  {
    unsigned int v11 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + v9 + 1);
    if (v11) {
      uint64_t v10 = v9 - (self->_parameterList[v11 - 1].effectType == v5);
    }
  }
  [(CUIShapeEffectPreset *)self addValue:a3.var1 forParameter:v6 withEffectType:v5 atEffectIndex:v10];
}

- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  unint64_t v9 = [(CUIShapeEffectPreset *)self effectCount];
  [(CUIShapeEffectPreset *)self addValue:a3.var1 forParameter:v6 withEffectType:v5 atEffectIndex:v9];
}

- (void)addFloatValue:(double)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
}

- (void)addEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
}

- (void)addColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withNewEffectType:(unsigned int)a7
{
}

- (void)appendFloatValue:(double)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
}

- (void)appendAngleValue:(int64_t)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
}

- (void)appendEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
}

- (void)appendColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withEffectType:(unsigned int)a7
{
}

- (void)addShapeOpacityWithOpacity:(double)a3
{
}

- (void)addOutputOpacityWithOpacity:(double)a3
{
}

- (void)addColorFillWithRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blendMode:(unsigned int)a7 tintable:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1131375730];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1131375730 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendEnumValue:v9 forParameter:7 withEffectType:1131375730];
  [(CUIShapeEffectPreset *)self appendEnumValue:v8 forParameter:10 withEffectType:1131375730];
}

- (void)addGradientFillWithTopColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 bottomColorRed:(unsigned int)a6 green:(unsigned int)a7 blue:(unsigned int)a8 opacity:(double)a9 blendMode:(unsigned int)a10
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1198678372];
  [(CUIShapeEffectPreset *)self appendColorValueRed:v13 green:v12 blue:v11 forParameter:1 withEffectType:1198678372];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1198678372 withEffectType:a9];
  [(CUIShapeEffectPreset *)self appendEnumValue:a10 forParameter:7 withEffectType:1198678372];
}

- (void)addInnerGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 blendMode:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1766288503];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1766288503 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:4 withEffectType:1766288503];
  [(CUIShapeEffectPreset *)self appendEnumValue:v8 forParameter:7 withEffectType:1766288503];
}

- (void)addInnerShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 offset:(int)a8 angle:(int)a9 blendMode:(unsigned int)a10
{
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1768837992];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1768837992 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:4 withEffectType:1768837992];
  [(CUIShapeEffectPreset *)self appendIntValue:a8 forParameter:5 withEffectType:1768837992];
  [(CUIShapeEffectPreset *)self appendAngleValue:a9 forParameter:6 withEffectType:1768837992];
  [(CUIShapeEffectPreset *)self appendEnumValue:a10 forParameter:7 withEffectType:1768837992];
}

- (void)addOuterGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8
{
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1866951799];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1866951799 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:4 withEffectType:1866951799];
  [(CUIShapeEffectPreset *)self appendIntValue:a8 forParameter:9 withEffectType:1866951799];
}

- (void)addDropShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10
{
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1148350320];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1148350320 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:4 withEffectType:1148350320];
  [(CUIShapeEffectPreset *)self appendIntValue:a8 forParameter:9 withEffectType:1148350320];
  [(CUIShapeEffectPreset *)self appendIntValue:a9 forParameter:5 withEffectType:1148350320];
  [(CUIShapeEffectPreset *)self appendAngleValue:a10 forParameter:6 withEffectType:1148350320];
}

- (void)addExtraShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10
{
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1484026465];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1484026465 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:4 withEffectType:1484026465];
  [(CUIShapeEffectPreset *)self appendIntValue:a8 forParameter:9 withEffectType:1484026465];
  [(CUIShapeEffectPreset *)self appendIntValue:a9 forParameter:5 withEffectType:1484026465];
  [(CUIShapeEffectPreset *)self appendAngleValue:a10 forParameter:6 withEffectType:1484026465];
}

- (void)addBevelEmbossWithHighlightColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 shadowColorRed:(unsigned int)a7 green:(unsigned int)a8 blue:(unsigned int)a9 opacity:(double)a10 blur:(int)a11 soften:(int)a12 bevelStyle:(unsigned int)a13
{
  uint64_t v14 = *(void *)&a9;
  uint64_t v15 = *(void *)&a8;
  uint64_t v16 = *(void *)&a7;
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1164796531];
  [(CUIShapeEffectPreset *)self appendFloatValue:2 forParameter:1164796531 withEffectType:a6];
  [(CUIShapeEffectPreset *)self appendColorValueRed:v16 green:v15 blue:v14 forParameter:1 withEffectType:1164796531];
  [(CUIShapeEffectPreset *)self appendFloatValue:3 forParameter:1164796531 withEffectType:a10];
  [(CUIShapeEffectPreset *)self appendIntValue:a11 forParameter:4 withEffectType:1164796531];
  [(CUIShapeEffectPreset *)self appendIntValue:a12 forParameter:8 withEffectType:1164796531];
  [(CUIShapeEffectPreset *)self appendEnumValue:a13 forParameter:11 withEffectType:1164796531];
}

- (void)addHueSaturationWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 angle:(int)a6 width:(int)a7 tintable:(BOOL)a8
{
  BOOL v8 = a8;
  [(CUIShapeEffectPreset *)self addColorValueRed:*(void *)&a3 green:*(void *)&a4 blue:*(void *)&a5 forParameter:0 withNewEffectType:1215653203];
  [(CUIShapeEffectPreset *)self appendAngleValue:a6 forParameter:6 withEffectType:1215653203];
  [(CUIShapeEffectPreset *)self appendIntValue:a7 forParameter:5 withEffectType:1215653203];
  [(CUIShapeEffectPreset *)self appendEnumValue:v8 forParameter:10 withEffectType:1215653203];
}

- (void)addEffectsFromPreset:(id)a3
{
  unint64_t v4 = (char *)[a3 effectCount];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    v82 = v4;
    do
    {
      int v7 = [a3 effectTypeAtIndex:v6];
      if (v7 <= 1215653202)
      {
        if (v7 <= 1164796530)
        {
          if (v7 == 1131375730)
          {
            id v74 = [a3 valueForParameter:7 inEffectAtIndex:v6];
            id v75 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v76 = v75;
            uint64_t v77 = BYTE1(v75);
            uint64_t v78 = BYTE2(v75);
            float v79 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            -[CUIShapeEffectPreset addColorFillWithRed:green:blue:opacity:blendMode:tintable:](self, "addColorFillWithRed:green:blue:opacity:blendMode:tintable:", v76, v77, v78, v74, [a3 valueForParameter:10 inEffectAtIndex:v6] == 1, v79);
          }
          else if (v7 == 1148350320)
          {
            id v31 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v32 = v31;
            uint64_t v33 = BYTE1(v31);
            uint64_t v34 = BYTE2(v31);
            float v35 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            id v36 = [a3 valueForParameter:4 inEffectAtIndex:v6];
            id v37 = [a3 valueForParameter:9 inEffectAtIndex:v6];
            id v38 = [a3 valueForParameter:5 inEffectAtIndex:v6];
            LODWORD(v80) = (__int16)[a3 valueForParameter:6 inEffectAtIndex:v6];
            [(CUIShapeEffectPreset *)self addDropShadowWithColorRed:v32 green:v33 blue:v34 opacity:v36 blur:v37 spread:v38 offset:v35 angle:v80];
          }
        }
        else
        {
          switch(v7)
          {
            case 1164796531:
              unsigned int v48 = [a3 valueForParameter:4 inEffectAtIndex:v6];
              unsigned int v49 = [a3 valueForParameter:8 inEffectAtIndex:v6];
              id v50 = [a3 valueForParameter:0 inEffectAtIndex:v6];
              uint64_t v51 = v50;
              uint64_t v52 = BYTE1(v50);
              uint64_t v53 = BYTE2(v50);
              float v54 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
              id v55 = [a3 valueForParameter:1 inEffectAtIndex:v6];
              uint64_t v56 = v55;
              uint64_t v57 = BYTE1(v55);
              uint64_t v58 = BYTE2(v55);
              float v59 = COERCE_DOUBLE([a3 valueForParameter:3 inEffectAtIndex:v6]);
              LODWORD(v81) = [a3 valueForParameter:11 inEffectAtIndex:v6];
              uint64_t v60 = v57;
              uint64_t v5 = v82;
              -[CUIShapeEffectPreset addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:](self, "addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:", v51, v52, v53, v56, v60, v58, v54, v59, __PAIR64__(v49, v48), v81);
              break;
            case 1180787813:
              float v61 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
              [(CUIShapeEffectPreset *)self addOutputOpacityWithOpacity:v61];
              break;
            case 1198678372:
              id v17 = [a3 valueForParameter:0 inEffectAtIndex:v6];
              uint64_t v18 = v17;
              uint64_t v19 = BYTE1(v17);
              uint64_t v20 = BYTE2(v17);
              id v21 = [a3 valueForParameter:1 inEffectAtIndex:v6];
              uint64_t v22 = v21;
              uint64_t v23 = BYTE1(v21);
              uint64_t v24 = BYTE2(v21);
              float v25 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
              LODWORD(v80) = [a3 valueForParameter:7 inEffectAtIndex:v6];
              [(CUIShapeEffectPreset *)self addGradientFillWithTopColorRed:v18 green:v19 blue:v20 bottomColorRed:v22 green:v23 blue:v24 opacity:v25 blendMode:v80];
              break;
          }
        }
      }
      else if (v7 > 1766288502)
      {
        switch(v7)
        {
          case 1766288503:
            id v62 = [a3 valueForParameter:7 inEffectAtIndex:v6];
            id v63 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v64 = v63;
            uint64_t v65 = BYTE1(v63);
            uint64_t v66 = BYTE2(v63);
            float v67 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            -[CUIShapeEffectPreset addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:](self, "addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:", v64, v65, v66, [a3 valueForParameter:4 inEffectAtIndex:v6], v62, v67);
            break;
          case 1768837992:
            unsigned int v68 = [a3 valueForParameter:7 inEffectAtIndex:v6];
            id v69 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v70 = v69;
            uint64_t v71 = BYTE1(v69);
            uint64_t v72 = BYTE2(v69);
            float v73 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            LODWORD(v80) = v68;
            -[CUIShapeEffectPreset addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:](self, "addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:", v70, v71, v72, [a3 valueForParameter:4 inEffectAtIndex:v6], objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, v6), (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, v6), v73, v80);
            break;
          case 1866951799:
            id v26 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v27 = v26;
            uint64_t v28 = BYTE1(v26);
            uint64_t v29 = BYTE2(v26);
            float v30 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            -[CUIShapeEffectPreset addOuterGlowWithColorRed:green:blue:opacity:blur:spread:](self, "addOuterGlowWithColorRed:green:blue:opacity:blur:spread:", v27, v28, v29, [a3 valueForParameter:4 inEffectAtIndex:v6], objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, v6), v30);
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 1215653203:
            id v39 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v40 = v39;
            uint64_t v41 = BYTE1(v39);
            uint64_t v42 = BYTE2(v39);
            uint64_t v43 = (__int16)[a3 valueForParameter:6 inEffectAtIndex:v6];
            id v44 = [a3 valueForParameter:5 inEffectAtIndex:v6];
            BOOL v45 = [a3 valueForParameter:10 inEffectAtIndex:v6] == 1;
            uint64_t v46 = v40;
            uint64_t v5 = v82;
            [(CUIShapeEffectPreset *)self addHueSaturationWithColorRed:v46 green:v41 blue:v42 angle:v43 width:v44 tintable:v45];
            break;
          case 1397715043:
            float v47 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            [(CUIShapeEffectPreset *)self addShapeOpacityWithOpacity:v47];
            break;
          case 1484026465:
            id v8 = [a3 valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v9 = v8;
            uint64_t v10 = BYTE1(v8);
            uint64_t v11 = BYTE2(v8);
            float v12 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:v6]);
            id v13 = [a3 valueForParameter:4 inEffectAtIndex:v6];
            id v14 = [a3 valueForParameter:9 inEffectAtIndex:v6];
            id v15 = [a3 valueForParameter:5 inEffectAtIndex:v6];
            LODWORD(v80) = (__int16)[a3 valueForParameter:6 inEffectAtIndex:v6];
            uint64_t v16 = v9;
            uint64_t v5 = v82;
            [(CUIShapeEffectPreset *)self addExtraShadowWithColorRed:v16 green:v10 blue:v11 opacity:v13 blur:v14 spread:v15 offset:v12 angle:v80];
            break;
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

- (id)debugDescription
{
  v86.receiveuint64_t r = self;
  v86.super_class = (Class)CUIShapeEffectPreset;
  unsigned int v3 = +[NSMutableString stringWithString:[(CUIShapeEffectPreset *)&v86 debugDescription]];
  [(NSMutableString *)v3 appendFormat:@"\nEffects: {\n"];
  unint64_t v4 = [(CUIShapeEffectPreset *)self effectCount];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    unint64_t v84 = v4;
    int v85 = 1852797549;
    do
    {
      int v7 = [(CUIShapeEffectPreset *)self effectTypeAtIndex:v6];
      [(NSMutableString *)v3 appendString:@"\n\t"];
      if (v7 <= 1215653202)
      {
        if (v7 <= 1164796530)
        {
          if (v7 == 1131375730)
          {
            int v64 = [(CUIShapeEffectPreset *)self valueForParameter:7 inEffectAtIndex:v6];
            v65.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t r = v65.var2.r;
            uint64_t g = v65.var2.g;
            uint64_t b = v65.var2.b;
            float v69 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            unsigned int v70 = [(CUIShapeEffectPreset *)self valueForParameter:10 inEffectAtIndex:v6];
            double v71 = v69;
            int v85 = v64;
            uint64_t v72 = CUIEffectBlendModeToString(v64);
            float v73 = @"NO";
            if (v70 == 1) {
              float v73 = @"YES";
            }
            [(NSMutableString *)v3 appendFormat:@"Color Fill: r=%d, g=%d, b=%d, opacity=%.1f, blendMode=%@, tintable=%@", r, g, b, *(void *)&v71, v72, v73, v80, v81, v82];
          }
          else if (v7 == 1148350320)
          {
            v27.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v28 = v27.var2.r;
            uint64_t v29 = v27.var2.g;
            uint64_t v30 = v27.var2.b;
            float v31 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            unint64_t v5 = v84;
            -[NSMutableString appendFormat:](v3, "appendFormat:", @"Drop Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, offset=%d, angle=%d, blendMode=%@", v28, v29, v30, v31, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 9, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                "valueForParameter:inEffectAtIndex:",
                5,
                v6),
              (__int16)[(CUIShapeEffectPreset *)self valueForParameter:6 inEffectAtIndex:v6], CUIEffectBlendModeToString(v85));
          }
        }
        else
        {
          switch(v7)
          {
            case 1164796531:
              v41.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:4 inEffectAtIndex:v6];
              v42.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:8 inEffectAtIndex:v6];
              unsigned int v43 = [(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
              double v44 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
              unsigned int v45 = [(CUIShapeEffectPreset *)self valueForParameter:1 inEffectAtIndex:v6];
              double v46 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:3 inEffectAtIndex:v6]);
              unsigned int v47 = [(CUIShapeEffectPreset *)self valueForParameter:11 inEffectAtIndex:v6];
              unsigned int v48 = CUIEffectBlendModeToString(v85);
              unsigned int v49 = @"<unknown>";
              if (v47 <= 4) {
                unsigned int v49 = off_1E5A58BC8[v47];
              }
              float v50 = v44;
              float v51 = v46;
              [(NSMutableString *)v3 appendFormat:@"Bevel Emboss: startR=%d, startG=%d, startB=%d, opacity=%.1f, endR=%d, endG=%d, endB=%d, endOpacity=%.1f, blendMode=%@, blurSize=%d, soften=%d, bevelStyle=%@", v43, BYTE1(v43), BYTE2(v43), v50, v45, BYTE1(v45), BYTE2(v45), v51, v48, v41.var1, v42.var1, v49];
              unint64_t v5 = v84;
              break;
            case 1180787813:
              float v52 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
              [(NSMutableString *)v3 appendFormat:@"Output Opacity=%.1f", v52, v75, v76, v77, v78, v79, v80, v81, v82];
              break;
            case 1198678372:
              v13.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
              uint64_t v14 = v13.var2.r;
              uint64_t v15 = v13.var2.g;
              uint64_t v16 = v13.var2.b;
              v17.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:1 inEffectAtIndex:v6];
              uint64_t v18 = v17.var2.r;
              uint64_t v19 = v17.var2.g;
              uint64_t v20 = v17.var2.b;
              float v21 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
              int v85 = [(CUIShapeEffectPreset *)self valueForParameter:7 inEffectAtIndex:v6];
              [(NSMutableString *)v3 appendFormat:@"Gradient Fill: r=%d, g=%d, b=%d, r=%d, g=%d, b=%d, opacity=%.1f, blendMode=%@", v14, v15, v16, v18, v19, v20, v21, CUIEffectBlendModeToString(v85), v82];
              break;
          }
        }
      }
      else if (v7 > 1766288502)
      {
        switch(v7)
        {
          case 1766288503:
            int v53 = [(CUIShapeEffectPreset *)self valueForParameter:7 inEffectAtIndex:v6];
            v54.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v55 = v54.var2.r;
            uint64_t v56 = v54.var2.g;
            uint64_t v57 = v54.var2.b;
            float v58 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            int v85 = v53;
            [(NSMutableString *)v3 appendFormat:@"Inner Glow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, blendMode=%@", v55, v56, v57, v58, [(CUIShapeEffectPreset *)self valueForParameter:4 inEffectAtIndex:v6], CUIEffectBlendModeToString(v53), v80, v81, v82];
            break;
          case 1768837992:
            int v59 = [(CUIShapeEffectPreset *)self valueForParameter:7 inEffectAtIndex:v6];
            v60.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v83 = v60.var2.r;
            uint64_t v61 = v60.var2.g;
            uint64_t v62 = v60.var2.b;
            float v63 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            int v85 = v59;
            -[NSMutableString appendFormat:](v3, "appendFormat:", @"Inner Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, offset=%d, angle=%d, blendMode=%@", v83, v61, v62, v63, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 5, v6), (__int16)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                                       "valueForParameter:inEffectAtIndex:",
                                       6,
                                       v6),
              CUIEffectBlendModeToString(v59),
              v82);
            break;
          case 1866951799:
            v22.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v23 = v22.var2.r;
            uint64_t v24 = v22.var2.g;
            uint64_t v25 = v22.var2.b;
            float v26 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            -[NSMutableString appendFormat:](v3, "appendFormat:", @"Outer Glow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, blendMode=%@", v23, v24, v25, v26, [(CUIShapeEffectPreset *)self valueForParameter:4 inEffectAtIndex:v6], [(CUIShapeEffectPreset *)self valueForParameter:9 inEffectAtIndex:v6], CUIEffectBlendModeToString(v85), v81,
              v82);
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 1215653203:
            v32.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v33 = v32.var2.r;
            uint64_t v34 = v32.var2.g;
            uint64_t v35 = v32.var2.b;
            uint64_t v36 = (__int16)[(CUIShapeEffectPreset *)self valueForParameter:6 inEffectAtIndex:v6];
            v37.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:5 inEffectAtIndex:v6];
            unsigned int v38 = [(CUIShapeEffectPreset *)self valueForParameter:10 inEffectAtIndex:v6];
            id v39 = @"NO";
            if (v38 == 1) {
              id v39 = @"YES";
            }
            [(NSMutableString *)v3 appendFormat:@"Hue/Saturation: r=%d, g=%d, b=%d, angle=%d, width=%d, tintable=%@", v33, v34, v35, v36, v37.var1, v39, v80, v81, v82];
            break;
          case 1397715043:
            float v40 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            [(NSMutableString *)v3 appendFormat:@"Shape Opacity=%.1f", v40, v75, v76, v77, v78, v79, v80, v81, v82];
            break;
          case 1484026465:
            v8.var1 = (unint64_t)[(CUIShapeEffectPreset *)self valueForParameter:0 inEffectAtIndex:v6];
            uint64_t v9 = v8.var2.r;
            uint64_t v10 = v8.var2.g;
            uint64_t v11 = v8.var2.b;
            float v12 = COERCE_DOUBLE([(CUIShapeEffectPreset *)self valueForParameter:2 inEffectAtIndex:v6]);
            unint64_t v5 = v84;
            -[NSMutableString appendFormat:](v3, "appendFormat:", @"Extra Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, offset=%d, angle=%d, blendMode=%@", v9, v10, v11, v12, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 9, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                "valueForParameter:inEffectAtIndex:",
                5,
                v6),
              (__int16)[(CUIShapeEffectPreset *)self valueForParameter:6 inEffectAtIndex:v6], CUIEffectBlendModeToString(v85));
            break;
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
  [(NSMutableString *)v3 appendString:@"\n}"];
  return v3;
}

+ (unsigned)cuiEffectBlendModeFromCGBlendMode:(int)a3
{
  if ((a3 - 1) > 0x1A) {
    return 1852797549;
  }
  else {
    return dword_1A139EFC0[a3 - 1];
  }
}

+ (int)cgBlendModeFromCUIEffectBlendMode:(unsigned int)a3
{
  int result = 0;
  if ((int)a3 > 1749838195)
  {
    if ((int)a3 > 1852797548)
    {
      if ((int)a3 > 1935897197)
      {
        if ((int)a3 > 1986227572)
        {
          if (a3 != 1986227573 && a3 != 1986229103)
          {
LABEL_44:
            _CUILog(4, (uint64_t)"CUIEffectBlendMode can't be converted to CGBlendMode", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
            return 0;
          }
        }
        else
        {
          if (a3 != 1935897198)
          {
            if (a3 == 1936553316) {
              return 11;
            }
            goto LABEL_44;
          }
          return 2;
        }
      }
      else if ((int)a3 > 1934387571)
      {
        if (a3 != 1934387572)
        {
          if (a3 == 1935766560) {
            return 13;
          }
          goto LABEL_44;
        }
        return 8;
      }
      else if (a3 != 1852797549)
      {
        if (a3 == 1870030194) {
          return 3;
        }
        goto LABEL_44;
      }
    }
    else if ((int)a3 > 1818518630)
    {
      if ((int)a3 > 1819634975)
      {
        if (a3 != 1819634976)
        {
          if (a3 == 1836411936) {
            return 1;
          }
          goto LABEL_44;
        }
        return 15;
      }
      else
      {
        if (a3 != 1818518631)
        {
          if (a3 == 1818850405) {
            return 5;
          }
          goto LABEL_44;
        }
        return 27;
      }
    }
    else if ((int)a3 > 1768188277)
    {
      if (a3 != 1768188278)
      {
        if (a3 == 1818391150) {
          return 26;
        }
        goto LABEL_44;
      }
      return 7;
    }
    else
    {
      if (a3 != 1749838196)
      {
        if (a3 == 1752524064) {
          return 12;
        }
        goto LABEL_44;
      }
      return 9;
    }
  }
  else if ((int)a3 > 1668246641)
  {
    if ((int)a3 > 1684629093)
    {
      if (a3 != 1684629094)
      {
        if (a3 == 1684633120) {
          return 6;
        }
        goto LABEL_44;
      }
      return 10;
    }
    else
    {
      if (a3 != 1668246642)
      {
        if (a3 == 1684107883) {
          return 4;
        }
        goto LABEL_44;
      }
      return 14;
    }
  }
  else
  {
    if (a3 - 16 < 0xC) {
      return a3;
    }
    if (a3) {
      goto LABEL_44;
    }
  }
  return result;
}

+ (id)caFilterFromCUIEffectBlendMode:(unsigned int)a3
{
  uint64_t v3 = (__CFString **)&kCAFilterNormalBlendMode;
  if ((int)a3 <= 1718842721)
  {
    if ((int)a3 <= 1668246641)
    {
      switch(a3)
      {
        case 0u:
          uint64_t v3 = (__CFString **)&kCAFilterSourceOver;
          break;
        case 0x10u:
          uint64_t v3 = (__CFString **)&kCAFilterClear;
          break;
        case 0x11u:
          uint64_t v3 = (__CFString **)&kCAFilterCopy;
          break;
        case 0x12u:
          uint64_t v3 = (__CFString **)&kCAFilterSourceIn;
          break;
        case 0x13u:
          uint64_t v3 = (__CFString **)&kCAFilterSourceOut;
          break;
        case 0x14u:
          uint64_t v3 = (__CFString **)&kCAFilterSourceAtop;
          break;
        case 0x15u:
          uint64_t v3 = (__CFString **)&kCAFilterDestOver;
          break;
        case 0x16u:
          uint64_t v3 = (__CFString **)&kCAFilterDestIn;
          break;
        case 0x17u:
          uint64_t v3 = (__CFString **)&kCAFilterDestOut;
          break;
        case 0x18u:
          uint64_t v3 = (__CFString **)&kCAFilterDestAtop;
          break;
        case 0x19u:
          uint64_t v3 = (__CFString **)&kCAFilterXor;
          break;
        case 0x1Au:
          uint64_t v3 = (__CFString **)&kCAFilterPlusD;
          break;
        case 0x1Bu:
          uint64_t v3 = (__CFString **)&kCAFilterPlusL;
          break;
        default:
          goto LABEL_62;
      }
      goto LABEL_62;
    }
    if ((int)a3 > 1684629093)
    {
      int v7 = 1684629094;
      uint64_t v8 = (__CFString **)&kCAFilterDifferenceBlendMode;
      if (a3 == 1717856630) {
        uint64_t v3 = (__CFString **)&kCAFilterDivideBlendMode;
      }
      if (a3 == 1684633120) {
        uint64_t v3 = (__CFString **)&kCAFilterColorDodgeBlendMode;
      }
      goto LABEL_36;
    }
    if (a3 == 1668246642)
    {
      uint64_t v6 = @"colorBlendMode";
      return +[CAFilter filterWithType:v6];
    }
    BOOL v4 = a3 == 1684107883;
    uint64_t v5 = (__CFString **)&kCAFilterDarkenBlendMode;
    goto LABEL_43;
  }
  if ((int)a3 <= 1836411935)
  {
    if ((int)a3 > 1816947059)
    {
      if ((int)a3 > 1818518630)
      {
        if (a3 == 1818518631)
        {
          uint64_t v3 = (__CFString **)&kCAFilterLinearDodgeBlendMode;
          goto LABEL_62;
        }
        if (a3 == 1818850405)
        {
          uint64_t v3 = (__CFString **)&kCAFilterLightenBlendMode;
          goto LABEL_62;
        }
        if (a3 != 1819634976) {
          goto LABEL_62;
        }
        uint64_t v6 = @"luminosityBlendMode";
        return +[CAFilter filterWithType:v6];
      }
      int v7 = 1816947060;
      uint64_t v8 = (__CFString **)&kCAFilterLinearLightBlendMode;
      BOOL v9 = a3 == 1818391150;
      uint64_t v10 = (__CFString **)&kCAFilterLinearBurnBlendMode;
LABEL_34:
      if (v9) {
        uint64_t v3 = v10;
      }
LABEL_36:
      if (a3 == v7) {
        uint64_t v3 = v8;
      }
      goto LABEL_62;
    }
    if ((int)a3 <= 1752524063)
    {
      int v7 = 1718842722;
      uint64_t v8 = (__CFString **)&kCAFilterSubtractBlendMode;
      BOOL v9 = a3 == 1749838196;
      uint64_t v10 = (__CFString **)&kCAFilterHardLightBlendMode;
      goto LABEL_34;
    }
    if (a3 == 1752524064)
    {
      uint64_t v6 = @"hueBlendMode";
      return +[CAFilter filterWithType:v6];
    }
    BOOL v4 = a3 == 1768188278;
    uint64_t v5 = (__CFString **)&kCAFilterColorBurnBlendMode;
LABEL_43:
    if (v4) {
      uint64_t v3 = v5;
    }
    goto LABEL_62;
  }
  if ((int)a3 <= 1935766559)
  {
    if ((int)a3 > 1884055923)
    {
      if (a3 == 1884055924)
      {
        uint64_t v3 = (__CFString **)&kCAFilterPinLightBlendMode;
        goto LABEL_62;
      }
      if (a3 == 1885434739) {
        return 0;
      }
      BOOL v4 = a3 == 1934387572;
      uint64_t v5 = (__CFString **)&kCAFilterSoftLightBlendMode;
      goto LABEL_43;
    }
    int v7 = 1836411936;
    uint64_t v8 = (__CFString **)&kCAFilterMultiply;
    BOOL v9 = a3 == 1870030194;
    uint64_t v10 = (__CFString **)&kCAFilterOverlayBlendMode;
    goto LABEL_34;
  }
  if ((int)a3 <= 1936553315)
  {
    if (a3 == 1935766560)
    {
      uint64_t v6 = @"saturationBlendMode";
      return +[CAFilter filterWithType:v6];
    }
    BOOL v4 = a3 == 1935897198;
    uint64_t v5 = (__CFString **)&kCAFilterScreenBlendMode;
    goto LABEL_43;
  }
  switch(a3)
  {
    case 0x736D7564u:
      uint64_t v3 = (__CFString **)&kCAFilterExclusionBlendMode;
      break;
    case 0x76636D75u:
      uint64_t v6 = @"vibrantColorMatrixMultiply";
      return +[CAFilter filterWithType:v6];
    case 0x7663736Fu:
      uint64_t v6 = @"vibrantColorMatrixSourceOver";
      return +[CAFilter filterWithType:v6];
  }
LABEL_62:
  uint64_t v6 = *v3;
  if (*v3) {
    return +[CAFilter filterWithType:v6];
  }
  return 0;
}

+ (_CUIVibrantColorMatrixOptions)monochromeVibrantColorMatrixOptions
{
  retstr->var0[0] = 0.0;
  retstr->var0[1] = 0.0;
  retstr->var0[2] = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var0[3] = _Q0;
  *(_OWORD *)&retstr->var2 = _Q0;
  retstr->var4 = 1.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  return result;
}

+ (_CUIVibrantColorMatrixOptions)standardVibrantColorMatrixOptionsForColor:(SEL)a3
{
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  uint64_t DisplayP3 = _CUIColorSpaceGetDisplayP3();
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a4);
  if (ColorSpace == SRGB || ColorSpace == (CGColorSpaceRef)DisplayP3) {
    CopyByMatchingToCGColorSpaceRef ColorSpace = CGColorRetain(a4);
  }
  else {
    CopyByMatchingToCGColorSpaceRef ColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, a4, 0);
  }
  uint64_t v10 = CopyByMatchingToColorSpace;
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  *(_OWORD *)retstr->var0 = *(_OWORD *)Components;
  retstr->var0[2] = Components[2];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var0[3] = _Q0;
  *(_OWORD *)&retstr->var2 = _Q0;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var4 = 1.0;
  *(_OWORD *)&retstr->var7 = xmmword_1A139EEF0;
  *(_OWORD *)&retstr->var9 = xmmword_1A139EF00;
  CGColorRelease(v10);
  return result;
}

+ (_CUIVibrantColorMatrixOptions)vibrantColorMatrixOptionsWithColor:(SEL)a3 saturation:(CGColor *)a4 brightness:(double)a5
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  if (CGColorGetAlpha(a4) >= 1.0)
  {
    if (a2)
    {
      int result = (_CUIVibrantColorMatrixOptions *)[a2 standardVibrantColorMatrixOptionsForColor:a4];
      goto LABEL_7;
    }
LABEL_6:
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    goto LABEL_7;
  }
  if (!a2) {
    goto LABEL_6;
  }
  int result = (_CUIVibrantColorMatrixOptions *)[a2 monochromeVibrantColorMatrixOptions];
LABEL_7:
  *(_OWORD *)&retstr->var5 = v16;
  *(_OWORD *)&retstr->var7 = v17;
  *(_OWORD *)&retstr->var9 = v18;
  *(_OWORD *)retstr->var0 = v12;
  *(_OWORD *)&retstr->var0[2] = v13;
  *(_OWORD *)&retstr->var1 = v14;
  *(_OWORD *)&retstr->var3 = v15;
  retstr->var3 = a6;
  retstr->var4 = a5;
  return result;
}

+ (void)configureVibrantColorMatrixFilter:(id)a3 withOptions:(_CUIVibrantColorMatrixOptions *)a4
{
  if (a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    long long v5 = CAColorMatrixIdentity[3];
    long long v10 = CAColorMatrixIdentity[2];
    long long v11 = v5;
    long long v12 = CAColorMatrixIdentity[4];
    long long v6 = CAColorMatrixIdentity[1];
    long long v8 = CAColorMatrixIdentity[0];
    long long v9 = v6;
    CAColorMatrixConcat();
    CAColorMatrixConcat();
    CAColorMatrixConcat();
    CAColorMatrixConcat();
    long long v16 = v11;
    long long v17 = v12;
    long long v14 = v9;
    long long v15 = v10;
    long long v13 = v8;
    int v7 = +[NSValue valueWithCAColorMatrix:&v8];
    [a3 setValue:v7 forKey:kCAFilterInputColorMatrix];
    [a3 setEnabled:1];
  }
}

- (float)minimumShadowSpread
{
  return self->_minimumShadowSpread;
}

- (void)setMinimumShadowSpread:(float)a3
{
  self->_minimumShadowSpread = a3;
}

- (uint64_t)setScaleFactor:(uint64_t)result
{
  if (result) {
    *(double *)(result + 2112) = a2;
  }
  return result;
}

- (unint64_t)_parameterCount
{
  unint64_t result = [(CUIShapeEffectPreset *)self effectCount];
  if (result) {
    return *((unsigned int *)&self->_parameterList[124].effectValue.angleValue + result + 1);
  }
  return result;
}

- (id)CUIEffectDataRepresentation
{
  long long v28 = xmmword_1A139F030;
  unint64_t v3 = [(CUIShapeEffectPreset *)self effectCount];
  int v29 = v3;
  unint64_t v25 = v3 + 1;
  BOOL v4 = malloc_type_calloc(v3 + 1, 4uLL, 0x100004052888210uLL);
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (8 * -[CUIShapeEffectPreset _parameterCount](self, "_parameterCount") + 8) * v3);
  if (v3)
  {
    unint64_t v6 = 0;
    int v7 = 0;
    effectIndex = self->_effectIndex;
    do
    {
      if (v7) {
        signed int v9 = effectIndex[v7 - 1];
      }
      else {
        signed int v9 = 0;
      }
      signed int v10 = effectIndex[v6];
      v27[0] = self->_parameterList[v9].effectType;
      v27[1] = v10 - v9;
      int v11 = v4[v6];
      unint64_t v6 = (v7 + 1);
      v4[v6] = v11;
      [v5 appendBytes:v27 length:8];
      v4[v6] += 8;
      if (v10 > v9)
      {
        signed int v18 = v9;
        p_effectValue = &self->_parameterList[v9].effectValue;
        int v20 = v10 - v18;
        do
        {
          uint64_t v26 = 0;
          uint64_t v21 = *((unsigned int *)&p_effectValue[-1].angleValue + 1);
          LODWORD(v26) = v21;
          if (v21 < 0xC)
          {
            switch((int)v21)
            {
              case 0:
              case 1:
                WORD2(v26) = p_effectValue->angleValue;
                BYTE6(v26) = p_effectValue->colorValue.b;
                break;
              case 2:
              case 3:
                float floatValue = p_effectValue->floatValue;
                *((float *)&v26 + 1) = floatValue;
                break;
              case 4:
              case 5:
              case 7:
              case 8:
              case 9:
              case 10:
              case 11:
                HIDWORD(v26) = p_effectValue->intValue;
                break;
              case 6:
                WORD2(v26) = p_effectValue->angleValue;
                break;
              default:
                break;
            }
            [v5 appendBytes:&v26 length:8];
            v4[v6] += 8;
          }
          else
          {
            _CUILog(4, (uint64_t)"distill: Unrecognized effect parameter type %d for effect component %u", v12, v13, v14, v15, v16, v17, v21);
          }
          p_effectValue += 2;
          --v20;
        }
        while (v20);
      }
      int v7 = v6;
    }
    while (v3 > v6);
  }
  uint64_t v23 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v5 length] + 4 * v3 + 20);
  [(NSMutableData *)v23 appendBytes:&v28 length:20];
  [(NSMutableData *)v23 appendBytes:v4 length:4 * v25];
  [(NSMutableData *)v23 appendData:v5];
  free(v4);

  return v23;
}

- (CUIShapeEffectPreset)initWithConstantPreset:(id *)a3
{
  v14.receiveuint64_t r = self;
  v14.super_class = (Class)CUIShapeEffectPreset;
  unint64_t result = [(CUIShapeEffectPreset *)&v14 init];
  if (result)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    int v7 = 0;
    double v8 = 1.0;
    if (a3->var3 == 144) {
      double v8 = 2.0;
    }
    result->_scaleFactouint64_t r = v8;
    do
    {
      unsigned int var0 = a3->var5[v5].var0;
      unsigned int var1 = a3->var5[v5].var1;
      if (!*(void *)&a3->var5[v5].var0) {
        break;
      }
      if (var0 == -1 && var1 == 0)
      {
        result->_effectIndex[v7 + 1] = result->_effectIndex[v7];
        ++v7;
      }
      else
      {
        unint64_t v12 = a3->var5[v5].var2.var1;
        uint64_t v13 = &result->_parameterList[v6++];
        v13->effectType = var0;
        v13->effectParameteuint64_t r = var1;
        v13->effectValue.intValue = v12;
        ++result->_effectIndex[v7];
      }
      ++v5;
    }
    while (v5 != 125);
  }
  return result;
}

@end