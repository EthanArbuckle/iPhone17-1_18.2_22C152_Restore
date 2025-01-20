@interface CLKUIAnalogHandConfiguration
+ (id)defaultHourConfigurationForDevice:(id)a3;
+ (id)defaultMinuteConfigurationForDevice:(id)a3;
+ (id)defaultSecondConfigurationForDevice:(id)a3;
+ (id)defaultSubdialConfigurationForDevice:(id)a3;
- (BOOL)excludePeg;
- (BOOL)excludeSecondTail;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)removeInlay;
- (BOOL)roundedSecondHand;
- (CGPoint)anchorPoint;
- (CGRect)bounds;
- (CGSize)directionalShadowOffset;
- (UIEdgeInsets)inlayInsets;
- (double)armLength;
- (double)armWidth;
- (double)dropShadowOpacity;
- (double)dropShadowRadius;
- (double)handLength;
- (double)handWidth;
- (double)inlayInsetRadius;
- (double)pegRadius;
- (double)pegStrokeWidth;
- (double)radialShadowOpacity;
- (double)radialShadowRadius;
- (double)smoothingRadius;
- (double)tailLength;
- (id)configurationByApplyingInset:(double)a3;
- (id)configurationByApplyingScale:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)dropShadowCacheIdentifier;
- (id)handCacheIdentifier;
- (id)radialShadowCacheIdentifier;
- (unint64_t)hash;
- (unint64_t)type;
- (void)copyToConfiguration:(id)a3;
- (void)setArmLength:(double)a3;
- (void)setArmWidth:(double)a3;
- (void)setDirectionalShadowOffset:(CGSize)a3;
- (void)setDropShadowOpacity:(double)a3;
- (void)setDropShadowRadius:(double)a3;
- (void)setExcludePeg:(BOOL)a3;
- (void)setExcludeSecondTail:(BOOL)a3;
- (void)setHandLength:(double)a3;
- (void)setHandWidth:(double)a3;
- (void)setInlayInsetRadius:(double)a3;
- (void)setPegRadius:(double)a3;
- (void)setPegStrokeWidth:(double)a3;
- (void)setRadialShadowOpacity:(double)a3;
- (void)setRadialShadowRadius:(double)a3;
- (void)setRemoveInlay:(BOOL)a3;
- (void)setRoundedSecondHand:(BOOL)a3;
- (void)setSmoothingRadius:(double)a3;
- (void)setTailLength:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CLKUIAnalogHandConfiguration

+ (id)defaultHourConfigurationForDevice:(id)a3
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  _LayoutConstants(a3, &v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  [(CLKUIAnalogHandConfiguration *)v3 setType:0];
  [(CLKUIAnalogHandConfiguration *)v3 setInlayInsetRadius:*(double *)&v5];
  [(CLKUIAnalogHandConfiguration *)v3 setHandWidth:*((double *)&v5 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setHandLength:*(double *)&v6];
  [(CLKUIAnalogHandConfiguration *)v3 setPegRadius:*((double *)&v6 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setPegStrokeWidth:*(double *)&v7];
  [(CLKUIAnalogHandConfiguration *)v3 setArmWidth:*((double *)&v7 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setArmLength:*(double *)&v8];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowOpacity:*(double *)&v9];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowRadius:*((double *)&v8 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowOpacity:*(double *)&v10];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowRadius:*((double *)&v9 + 1)];
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *((double *)&v10 + 1), *(double *)&v11);
  [(CLKUIAnalogHandConfiguration *)v3 setExcludePeg:0];
  [(CLKUIAnalogHandConfiguration *)v3 setSmoothingRadius:1.25];
  return v3;
}

+ (id)defaultMinuteConfigurationForDevice:(id)a3
{
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  [(CLKUIAnalogHandConfiguration *)v3 setType:0];
  [(CLKUIAnalogHandConfiguration *)v3 setInlayInsetRadius:*(double *)v5];
  [(CLKUIAnalogHandConfiguration *)v3 setHandWidth:*((double *)&v6 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setHandLength:*(double *)&v7];
  [(CLKUIAnalogHandConfiguration *)v3 setPegRadius:*((double *)&v7 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setPegStrokeWidth:*(double *)&v8];
  [(CLKUIAnalogHandConfiguration *)v3 setArmWidth:*((double *)&v8 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setArmLength:*(double *)&v9];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowOpacity:*(double *)&v10];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowRadius:*((double *)&v9 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowOpacity:*(double *)&v11];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowRadius:*((double *)&v10 + 1)];
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *((double *)&v11 + 1), *(double *)&v12);
  [(CLKUIAnalogHandConfiguration *)v3 setExcludePeg:0];
  [(CLKUIAnalogHandConfiguration *)v3 setSmoothingRadius:1.25];
  return v3;
}

+ (id)defaultSecondConfigurationForDevice:(id)a3
{
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  [(CLKUIAnalogHandConfiguration *)v3 setType:1];
  [(CLKUIAnalogHandConfiguration *)v3 setHandWidth:*((double *)&v6 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setHandLength:*(double *)&v7];
  [(CLKUIAnalogHandConfiguration *)v3 setPegRadius:*((double *)&v7 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setPegStrokeWidth:*(double *)&v8];
  [(CLKUIAnalogHandConfiguration *)v3 setTailLength:*((double *)&v8 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowOpacity:*((double *)&v9 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowRadius:*(double *)&v9];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowOpacity:*((double *)&v10 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowRadius:*(double *)&v10];
  [(CLKUIAnalogHandConfiguration *)v3 setDirectionalShadowOffset:v11];
  [(CLKUIAnalogHandConfiguration *)v3 setRoundedSecondHand:1];
  [(CLKUIAnalogHandConfiguration *)v3 setExcludeSecondTail:0];
  [(CLKUIAnalogHandConfiguration *)v3 setSmoothingRadius:1.25];
  return v3;
}

+ (id)defaultSubdialConfigurationForDevice:(id)a3
{
  double v11 = 0.0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  [(CLKUIAnalogHandConfiguration *)v3 setType:1];
  [(CLKUIAnalogHandConfiguration *)v3 setHandWidth:*(double *)&v10];
  [(CLKUIAnalogHandConfiguration *)v3 setHandLength:*((double *)&v10 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setPegRadius:0.0];
  [(CLKUIAnalogHandConfiguration *)v3 setPegStrokeWidth:v11];
  [(CLKUIAnalogHandConfiguration *)v3 setTailLength:*((double *)&v6 + 1)];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowOpacity:0.0];
  [(CLKUIAnalogHandConfiguration *)v3 setDropShadowRadius:0.0];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowOpacity:0.0];
  [(CLKUIAnalogHandConfiguration *)v3 setRadialShadowRadius:0.0];
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(CLKUIAnalogHandConfiguration *)v3 setRoundedSecondHand:1];
  [(CLKUIAnalogHandConfiguration *)v3 setExcludeSecondTail:1];
  [(CLKUIAnalogHandConfiguration *)v3 setSmoothingRadius:1.25];
  return v3;
}

- (CGPoint)anchorPoint
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    double handLength = self->_handLength;
    goto LABEL_5;
  }
  if (!type)
  {
    double handLength = self->_handLength + self->_armLength + self->_pegRadius + self->_pegStrokeWidth;
LABEL_5:
    [(CLKUIAnalogHandConfiguration *)self bounds];
    double v5 = handLength / v4;
  }
  double v6 = 0.5;
  result.y = v5;
  result.x = v6;
  return result;
}

- (CGRect)bounds
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    if (self->_excludeSecondTail)
    {
      double v6 = self->_pegRadius + self->_pegStrokeWidth;
      double tailLength = v6;
    }
    else
    {
      double tailLength = self->_tailLength;
      double v6 = self->_pegRadius + self->_pegStrokeWidth;
    }
    double v5 = self->_handLength + tailLength;
    double v8 = v6 + v6;
    if (self->_handWidth >= v8) {
      double handWidth = self->_handWidth;
    }
    else {
      double handWidth = v8;
    }
  }
  else if (!type)
  {
    double v4 = self->_pegRadius + self->_pegStrokeWidth;
    double handWidth = self->_handWidth;
    if (handWidth < v4 + v4) {
      double handWidth = v4 + v4;
    }
    double v5 = self->_handLength + self->_armLength + v4 * 2.0;
  }
  double v9 = 0.0;
  double v10 = 0.0;
  result.size.height = v5;
  result.size.width = handWidth;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (UIEdgeInsets)inlayInsets
{
  [(CLKUIAnalogHandConfiguration *)self inlayInsetRadius];
  unint64_t type = self->_type;
  if (type == 1)
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v7 = v3;
    if (!type)
    {
      double v4 = v3 + self->_armLength + (self->_pegRadius + self->_pegStrokeWidth) * 2.0;
      double v5 = v3;
    }
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
}

- (id)configurationByApplyingInset:(double)a3
{
  double v5 = (void *)[(CLKUIAnalogHandConfiguration *)self copy];
  double v6 = v5;
  unint64_t type = self->_type;
  if (type == 1)
  {
    [v5 handWidth];
    [v6 setHandWidth:v16 + a3 * -2.0];
    [v6 handLength];
    [v6 setHandLength:v17 - a3];
    [v6 tailLength];
    [v6 setTailLength:v18 - a3];
    [v6 pegRadius];
    if (v19 <= 0.0)
    {
      [v6 pegStrokeWidth];
      double v22 = v30 - a3;
    }
    else
    {
      [v6 pegRadius];
      [v6 setPegRadius:v20 + a3];
      [v6 pegStrokeWidth];
      double v22 = v21 + a3 * -2.0;
    }
    [v6 setPegStrokeWidth:v22];
    [v6 smoothingRadius];
    if (v31 > 0.0)
    {
      [v6 smoothingRadius];
      [v6 setSmoothingRadius:v32 + a3];
    }
    [v6 handWidth];
    objc_msgSend(v6, "setHandWidth:", fmax(v33, 0.0));
    [v6 handLength];
    objc_msgSend(v6, "setHandLength:", fmax(v34, 0.0));
    [v6 tailLength];
    objc_msgSend(v6, "setTailLength:", fmax(v35, 0.0));
  }
  else
  {
    if (type) {
      goto LABEL_16;
    }
    [v5 handLength];
    [v6 setHandLength:v8 + a3 * -2.0];
    [v6 handWidth];
    [v6 setHandWidth:v9 + a3 * -2.0];
    [v6 armWidth];
    [v6 setArmWidth:v10 + a3 * -2.0];
    [v6 armLength];
    [v6 setArmLength:v11 + a3 * 2.0];
    [v6 pegRadius];
    if (v12 <= 0.0)
    {
      [v6 pegStrokeWidth];
      double v15 = v23 - a3;
    }
    else
    {
      [v6 pegRadius];
      [v6 setPegRadius:v13 + a3];
      [v6 pegStrokeWidth];
      double v15 = v14 + a3 * -2.0;
    }
    [v6 setPegStrokeWidth:v15];
    [v6 smoothingRadius];
    if (v24 > 0.0)
    {
      [v6 smoothingRadius];
      [v6 setSmoothingRadius:v25 + a3];
    }
    [v6 handLength];
    objc_msgSend(v6, "setHandLength:", fmax(v26, 0.0));
    [v6 handWidth];
    objc_msgSend(v6, "setHandWidth:", fmax(v27, 0.0));
    [v6 armWidth];
    objc_msgSend(v6, "setArmWidth:", fmax(v28, 0.0));
    [v6 armLength];
    objc_msgSend(v6, "setArmLength:", fmax(v29, 0.0));
  }
  [v6 pegRadius];
  objc_msgSend(v6, "setPegRadius:", fmax(v36, 0.0));
  [v6 pegStrokeWidth];
  objc_msgSend(v6, "setPegStrokeWidth:", fmax(v37, 0.0));
LABEL_16:
  return v6;
}

- (id)configurationByApplyingScale:(double)a3
{
  double v4 = (void *)[(CLKUIAnalogHandConfiguration *)self copy];
  [v4 handLength];
  [v4 setHandLength:v5 * a3];
  [v4 handWidth];
  [v4 setHandWidth:v6 * a3];
  [v4 armLength];
  [v4 setArmLength:v7 * a3];
  [v4 armWidth];
  [v4 setArmWidth:v8 * a3];
  [v4 pegStrokeWidth];
  [v4 setPegStrokeWidth:v9 * a3];
  [v4 pegRadius];
  [v4 setPegRadius:v10 * a3];
  [v4 tailLength];
  [v4 setTailLength:v11 * a3];
  [v4 smoothingRadius];
  [v4 setSmoothingRadius:v12 * a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(CLKUIAnalogHandConfiguration *)self copyToConfiguration:v4];
  return v4;
}

- (void)copyToConfiguration:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 setType:type];
  [v5 setInlayInsetRadius:self->_inlayInsetRadius];
  [v5 setHandWidth:self->_handWidth];
  [v5 setHandLength:self->_handLength];
  [v5 setPegRadius:self->_pegRadius];
  [v5 setPegStrokeWidth:self->_pegStrokeWidth];
  [v5 setArmLength:self->_armLength];
  [v5 setArmWidth:self->_armWidth];
  [v5 setTailLength:self->_tailLength];
  [v5 setDropShadowOpacity:self->_dropShadowOpacity];
  [v5 setDropShadowRadius:self->_dropShadowRadius];
  [v5 setRadialShadowOpacity:self->_radialShadowOpacity];
  [v5 setRadialShadowRadius:self->_radialShadowRadius];
  objc_msgSend(v5, "setDirectionalShadowOffset:", self->_directionalShadowOffset.width, self->_directionalShadowOffset.height);
  [v5 setRoundedSecondHand:self->_roundedSecondHand];
  [v5 setExcludePeg:self->_excludePeg];
  [v5 setExcludeSecondTail:self->_excludeSecondTail];
  [v5 setSmoothingRadius:self->_smoothingRadius];
  [v5 setRemoveInlay:self->_removeInlay];
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_14;
  }
  double inlayInsetRadius = self->_inlayInsetRadius;
  [v4 inlayInsetRadius];
  if (inlayInsetRadius != v7) {
    goto LABEL_14;
  }
  double handWidth = self->_handWidth;
  [v4 handWidth];
  if (handWidth != v9) {
    goto LABEL_14;
  }
  double handLength = self->_handLength;
  [v4 handLength];
  if (handLength != v11) {
    goto LABEL_14;
  }
  double pegRadius = self->_pegRadius;
  [v4 pegRadius];
  if (pegRadius != v13) {
    goto LABEL_14;
  }
  double pegStrokeWidth = self->_pegStrokeWidth;
  [v4 pegStrokeWidth];
  if (pegStrokeWidth != v15) {
    goto LABEL_14;
  }
  double armLength = self->_armLength;
  [v4 armLength];
  if (armLength != v17) {
    goto LABEL_14;
  }
  double armWidth = self->_armWidth;
  [v4 armWidth];
  if (armWidth == v19
    && (double tailLength = self->_tailLength, [v4 tailLength], tailLength == v21)
    && (int roundedSecondHand = self->_roundedSecondHand,
        roundedSecondHand == [v4 roundedSecondHand])
    && (int excludePeg = self->_excludePeg, excludePeg == [v4 excludePeg])
    && (int excludeSecondTail = self->_excludeSecondTail,
        excludeSecondTail == [v4 excludeSecondTail]))
  {
    double smoothingRadius = self->_smoothingRadius;
    [v4 smoothingRadius];
    BOOL v27 = smoothingRadius == v26;
  }
  else
  {
LABEL_14:
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CLKUIAnalogHandConfiguration *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CLKUIAnalogHandConfiguration *)self isEqualToConfiguration:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CLKUIAnalogHandConfiguration *)self type];
  [(CLKUIAnalogHandConfiguration *)self inlayInsetRadius];
  uint64_t v5 = v3 ^ v4;
  [(CLKUIAnalogHandConfiguration *)self handWidth];
  uint64_t v7 = v6;
  [(CLKUIAnalogHandConfiguration *)self handLength];
  uint64_t v9 = v5 ^ v7 ^ v8;
  [(CLKUIAnalogHandConfiguration *)self pegRadius];
  uint64_t v11 = v10;
  [(CLKUIAnalogHandConfiguration *)self pegStrokeWidth];
  uint64_t v13 = v11 ^ v12;
  [(CLKUIAnalogHandConfiguration *)self armLength];
  uint64_t v15 = v9 ^ v13 ^ v14;
  [(CLKUIAnalogHandConfiguration *)self armWidth];
  uint64_t v17 = v16;
  [(CLKUIAnalogHandConfiguration *)self tailLength];
  uint64_t v19 = v17 ^ v18;
  [(CLKUIAnalogHandConfiguration *)self dropShadowRadius];
  uint64_t v21 = v19 ^ v20;
  [(CLKUIAnalogHandConfiguration *)self dropShadowOpacity];
  uint64_t v23 = v15 ^ v21 ^ v22;
  [(CLKUIAnalogHandConfiguration *)self radialShadowRadius];
  uint64_t v25 = v24;
  [(CLKUIAnalogHandConfiguration *)self radialShadowOpacity];
  uint64_t v27 = v25 ^ v26;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v29 = v27 ^ v28;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v31 = v30;
  uint64_t v32 = [(CLKUIAnalogHandConfiguration *)self roundedSecondHand];
  uint64_t v33 = [(CLKUIAnalogHandConfiguration *)self excludePeg];
  uint64_t v34 = [(CLKUIAnalogHandConfiguration *)self excludeSecondTail];
  [(CLKUIAnalogHandConfiguration *)self smoothingRadius];
  uint64_t v36 = v35;
  BOOL v37 = [(CLKUIAnalogHandConfiguration *)self removeInlay];
  uint64_t v38 = 0x10000000;
  if (!v37) {
    uint64_t v38 = 0;
  }
  return v23 ^ v29 ^ v32 ^ v31 ^ v33 ^ v34 ^ v36 ^ v38;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  unint64_t v4 = [(CLKUIAnalogHandConfiguration *)self type];
  [(CLKUIAnalogHandConfiguration *)self inlayInsetRadius];
  uint64_t v32 = v5;
  [(CLKUIAnalogHandConfiguration *)self handWidth];
  uint64_t v31 = v6;
  [(CLKUIAnalogHandConfiguration *)self handLength];
  uint64_t v30 = v7;
  [(CLKUIAnalogHandConfiguration *)self pegRadius];
  uint64_t v9 = v8;
  [(CLKUIAnalogHandConfiguration *)self pegStrokeWidth];
  uint64_t v11 = v10;
  [(CLKUIAnalogHandConfiguration *)self armLength];
  uint64_t v13 = v12;
  [(CLKUIAnalogHandConfiguration *)self armWidth];
  uint64_t v15 = v14;
  [(CLKUIAnalogHandConfiguration *)self tailLength];
  uint64_t v17 = v16;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v19 = v18;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v21 = v20;
  BOOL v22 = [(CLKUIAnalogHandConfiguration *)self roundedSecondHand];
  BOOL v23 = [(CLKUIAnalogHandConfiguration *)self excludePeg];
  BOOL v24 = [(CLKUIAnalogHandConfiguration *)self excludeSecondTail];
  [(CLKUIAnalogHandConfiguration *)self smoothingRadius];
  uint64_t v26 = v25;
  BOOL v27 = [(CLKUIAnalogHandConfiguration *)self removeInlay];
  double v28 = @"NO";
  if (v27) {
    double v28 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"type:%lu-inlayInsetRadius:%f-handWidth:%f-handLength:%f-pegRadius:%f-pegStrokeWidth:%f-armLength:%f-armWidth:%f-tailLength:%f-directionalShadowOffset:%f/%f-roundedSecondHand:%i-excludePeg:%i-excludeSecondTail:%i-smoothingRadius:%f-removeInlay:%@", v4, v32, v31, v30, v9, v11, v13, v15, v17, v19, v21, v22, v23, v24, v26, v28];
}

- (id)handCacheIdentifier
{
  uint64_t v3 = NSString;
  unint64_t v4 = [(CLKUIAnalogHandConfiguration *)self type];
  [(CLKUIAnalogHandConfiguration *)self inlayInsetRadius];
  uint64_t v29 = v5;
  [(CLKUIAnalogHandConfiguration *)self handWidth];
  uint64_t v28 = v6;
  [(CLKUIAnalogHandConfiguration *)self handLength];
  uint64_t v27 = v7;
  [(CLKUIAnalogHandConfiguration *)self pegRadius];
  uint64_t v9 = v8;
  [(CLKUIAnalogHandConfiguration *)self pegStrokeWidth];
  uint64_t v11 = v10;
  [(CLKUIAnalogHandConfiguration *)self armLength];
  uint64_t v13 = v12;
  [(CLKUIAnalogHandConfiguration *)self armWidth];
  uint64_t v15 = v14;
  [(CLKUIAnalogHandConfiguration *)self tailLength];
  uint64_t v17 = v16;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v19 = v18;
  [(CLKUIAnalogHandConfiguration *)self directionalShadowOffset];
  uint64_t v21 = v20;
  BOOL v22 = [(CLKUIAnalogHandConfiguration *)self roundedSecondHand];
  BOOL v23 = [(CLKUIAnalogHandConfiguration *)self excludePeg];
  BOOL v24 = [(CLKUIAnalogHandConfiguration *)self excludeSecondTail];
  [(CLKUIAnalogHandConfiguration *)self smoothingRadius];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%lu-%f-%f-%f-%f-%f-%f-%f-%f-%f-%f-%i-%i-%i-%f-%d", v4, v29, v28, v27, v9, v11, v13, v15, v17, v19, v21, v22, v23, v24, v25, -[CLKUIAnalogHandConfiguration removeInlay](self, "removeInlay") ^ 1);
}

- (id)radialShadowCacheIdentifier
{
  uint64_t v3 = NSString;
  unint64_t v4 = [(CLKUIAnalogHandConfiguration *)self handCacheIdentifier];
  [(CLKUIAnalogHandConfiguration *)self radialShadowRadius];
  uint64_t v6 = v5;
  [(CLKUIAnalogHandConfiguration *)self radialShadowOpacity];
  uint64_t v8 = [v3 stringWithFormat:@"%@-%f-%f", v4, v6, v7];

  return v8;
}

- (id)dropShadowCacheIdentifier
{
  uint64_t v3 = NSString;
  unint64_t v4 = [(CLKUIAnalogHandConfiguration *)self handCacheIdentifier];
  [(CLKUIAnalogHandConfiguration *)self dropShadowRadius];
  uint64_t v6 = v5;
  [(CLKUIAnalogHandConfiguration *)self dropShadowOpacity];
  uint64_t v8 = [v3 stringWithFormat:@"%@-%f-%f", v4, v6, v7];

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (double)handLength
{
  return self->_handLength;
}

- (void)setHandLength:(double)a3
{
  self->_double handLength = a3;
}

- (double)handWidth
{
  return self->_handWidth;
}

- (void)setHandWidth:(double)a3
{
  self->_double handWidth = a3;
}

- (double)pegRadius
{
  return self->_pegRadius;
}

- (void)setPegRadius:(double)a3
{
  self->_double pegRadius = a3;
}

- (double)pegStrokeWidth
{
  return self->_pegStrokeWidth;
}

- (void)setPegStrokeWidth:(double)a3
{
  self->_double pegStrokeWidth = a3;
}

- (double)smoothingRadius
{
  return self->_smoothingRadius;
}

- (void)setSmoothingRadius:(double)a3
{
  self->_double smoothingRadius = a3;
}

- (double)inlayInsetRadius
{
  return self->_inlayInsetRadius;
}

- (void)setInlayInsetRadius:(double)a3
{
  self->_double inlayInsetRadius = a3;
}

- (double)armLength
{
  return self->_armLength;
}

- (void)setArmLength:(double)a3
{
  self->_double armLength = a3;
}

- (double)armWidth
{
  return self->_armWidth;
}

- (void)setArmWidth:(double)a3
{
  self->_double armWidth = a3;
}

- (BOOL)excludePeg
{
  return self->_excludePeg;
}

- (void)setExcludePeg:(BOOL)a3
{
  self->_int excludePeg = a3;
}

- (BOOL)removeInlay
{
  return self->_removeInlay;
}

- (void)setRemoveInlay:(BOOL)a3
{
  self->_removeInlay = a3;
}

- (double)tailLength
{
  return self->_tailLength;
}

- (void)setTailLength:(double)a3
{
  self->_double tailLength = a3;
}

- (double)dropShadowRadius
{
  return self->_dropShadowRadius;
}

- (void)setDropShadowRadius:(double)a3
{
  self->_dropShadowRadius = a3;
}

- (double)dropShadowOpacity
{
  return self->_dropShadowOpacity;
}

- (void)setDropShadowOpacity:(double)a3
{
  self->_dropShadowOpacity = a3;
}

- (double)radialShadowRadius
{
  return self->_radialShadowRadius;
}

- (void)setRadialShadowRadius:(double)a3
{
  self->_radialShadowRadius = a3;
}

- (double)radialShadowOpacity
{
  return self->_radialShadowOpacity;
}

- (void)setRadialShadowOpacity:(double)a3
{
  self->_radialShadowOpacity = a3;
}

- (CGSize)directionalShadowOffset
{
  double width = self->_directionalShadowOffset.width;
  double height = self->_directionalShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDirectionalShadowOffset:(CGSize)a3
{
  self->_directionalShadowOffset = a3;
}

- (BOOL)roundedSecondHand
{
  return self->_roundedSecondHand;
}

- (void)setRoundedSecondHand:(BOOL)a3
{
  self->_int roundedSecondHand = a3;
}

- (BOOL)excludeSecondTail
{
  return self->_excludeSecondTail;
}

- (void)setExcludeSecondTail:(BOOL)a3
{
  self->_int excludeSecondTail = a3;
}

@end