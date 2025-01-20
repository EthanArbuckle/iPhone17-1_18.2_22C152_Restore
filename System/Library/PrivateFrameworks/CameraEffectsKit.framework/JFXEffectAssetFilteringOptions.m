@interface JFXEffectAssetFilteringOptions
- (JFXEffectAssetFilteringOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)aspectRatio;
- (int64_t)colorDynamicRange;
- (int64_t)contentType;
- (int64_t)filteringMode;
- (int64_t)quality;
- (int64_t)usageMode;
- (void)setAspectRatio:(int64_t)a3;
- (void)setColorDynamicRange:(int64_t)a3;
- (void)setContentType:(int64_t)a3;
- (void)setFilteringMode:(int64_t)a3;
- (void)setQuality:(int64_t)a3;
- (void)setUsageMode:(int64_t)a3;
@end

@implementation JFXEffectAssetFilteringOptions

- (JFXEffectAssetFilteringOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetFilteringOptions;
  result = [(JFXEffectAssetFilteringOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_quality = 0u;
    *(_OWORD *)&result->_usageMode = 0u;
    *(_OWORD *)&result->_contentType = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 6) = self->_filteringMode;
  *((void *)result + 2) = self->_aspectRatio;
  *((void *)result + 4) = self->_colorDynamicRange;
  *((void *)result + 1) = self->_contentType;
  *((void *)result + 5) = self->_quality;
  *((void *)result + 3) = self->_usageMode;
  return result;
}

- (id)description
{
  int64_t v3 = [(JFXEffectAssetFilteringOptions *)self filteringMode];
  v4 = @"close";
  if (v3 == 1) {
    v4 = @"exact";
  }
  v5 = (objc_class *)MEMORY[0x263F089D8];
  v6 = v4;
  v7 = (void *)[[v5 alloc] initWithFormat:@"filteringMode %@ ", v6];

  if ([(JFXEffectAssetFilteringOptions *)self contentType])
  {
    v8 = JFX_descriptionForEffectAssetContentType([(JFXEffectAssetFilteringOptions *)self contentType]);
    [v7 appendString:v8];
  }
  if ([(JFXEffectAssetFilteringOptions *)self aspectRatio])
  {
    [v7 appendString:@","];
    v9 = JFX_descriptionForEffectAssetAspectRatio([(JFXEffectAssetFilteringOptions *)self aspectRatio]);
    [v7 appendString:v9];
  }
  if ([(JFXEffectAssetFilteringOptions *)self usageMode])
  {
    [v7 appendString:@","];
    v10 = JFX_descriptionForEffectAssetUsageMode([(JFXEffectAssetFilteringOptions *)self usageMode]);
    [v7 appendString:v10];
  }
  return v7;
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

- (int64_t)filteringMode
{
  return self->_filteringMode;
}

- (void)setFilteringMode:(int64_t)a3
{
  self->_filteringMode = a3;
}

@end