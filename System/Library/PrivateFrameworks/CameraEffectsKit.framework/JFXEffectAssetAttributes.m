@interface JFXEffectAssetAttributes
- (BOOL)isMatchingFilterAttributes:(id)a3;
- (JFXEffectAssetAttributes)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)aspectRatio;
- (int64_t)colorDynamicRange;
- (int64_t)contentType;
- (int64_t)quality;
- (int64_t)usageMode;
- (void)setAspectRatio:(int64_t)a3;
- (void)setColorDynamicRange:(int64_t)a3;
- (void)setContentType:(int64_t)a3;
- (void)setQuality:(int64_t)a3;
- (void)setUsageMode:(int64_t)a3;
@end

@implementation JFXEffectAssetAttributes

- (JFXEffectAssetAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetAttributes;
  result = [(JFXEffectAssetAttributes *)&v3 init];
  if (result)
  {
    result->_quality = 0;
    *(_OWORD *)&result->_usageMode = 0u;
    *(_OWORD *)&result->_contentType = 0u;
  }
  return result;
}

- (id)description
{
  objc_super v3 = objc_opt_new();
  if ([(JFXEffectAssetAttributes *)self contentType])
  {
    v4 = JFX_descriptionForEffectAssetContentType([(JFXEffectAssetAttributes *)self contentType]);
    [v3 appendString:v4];
  }
  if ([(JFXEffectAssetAttributes *)self aspectRatio])
  {
    if ([v3 length]) {
      [v3 appendString:@","];
    }
    v5 = JFX_descriptionForEffectAssetAspectRatio([(JFXEffectAssetAttributes *)self aspectRatio]);
    [v3 appendString:v5];
  }
  if ([(JFXEffectAssetAttributes *)self usageMode])
  {
    if ([v3 length]) {
      [v3 appendString:@","];
    }
    v6 = JFX_descriptionForEffectAssetUsageMode([(JFXEffectAssetAttributes *)self usageMode]);
    [v3 appendString:v6];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_aspectRatio;
  *((void *)result + 4) = self->_colorDynamicRange;
  *((void *)result + 1) = self->_contentType;
  *((void *)result + 5) = self->_quality;
  *((void *)result + 3) = self->_usageMode;
  return result;
}

- (BOOL)isMatchingFilterAttributes:(id)a3
{
  id v4 = a3;
  if ([v4 contentType])
  {
    uint64_t v5 = [v4 contentType];
    if (v5 != [(JFXEffectAssetAttributes *)self contentType]) {
      goto LABEL_15;
    }
  }
  if ([v4 usageMode])
  {
    if ([v4 usageMode] == 2)
    {
      if ([(JFXEffectAssetAttributes *)self usageMode] == 1) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v6 = [v4 usageMode];
      if (v6 != [(JFXEffectAssetAttributes *)self usageMode])
      {
LABEL_15:
        BOOL v10 = 0;
        goto LABEL_16;
      }
    }
  }
  if ([v4 aspectRatio])
  {
    uint64_t v7 = [v4 aspectRatio];
    if (v7 != [(JFXEffectAssetAttributes *)self aspectRatio]) {
      goto LABEL_15;
    }
  }
  if ([v4 colorDynamicRange])
  {
    uint64_t v8 = [v4 colorDynamicRange];
    if (v8 != [(JFXEffectAssetAttributes *)self colorDynamicRange]) {
      goto LABEL_15;
    }
  }
  if ([v4 quality])
  {
    uint64_t v9 = [v4 quality];
    if (v9 != [(JFXEffectAssetAttributes *)self quality]) {
      goto LABEL_15;
    }
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(int64_t)a3
{
  self->_aspectRatio = a3;
}

- (int64_t)usageMode
{
  return self->_usageMode;
}

- (void)setUsageMode:(int64_t)a3
{
  self->_usageMode = a3;
}

- (int64_t)colorDynamicRange
{
  return self->_colorDynamicRange;
}

- (void)setColorDynamicRange:(int64_t)a3
{
  self->_colorDynamicRange = a3;
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

@end