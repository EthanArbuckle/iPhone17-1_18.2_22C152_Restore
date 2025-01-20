@interface AVAssetVariantVideoLayoutAttributes
- (AVAssetVariantVideoLayoutAttributes)initWithFigVideoImmersiveAttributes:(id)a3;
- (CMStereoViewComponents)stereoViewComponents;
- (id)description;
- (unint64_t)packingType;
- (unint64_t)projectionType;
- (void)dealloc;
@end

@implementation AVAssetVariantVideoLayoutAttributes

- (AVAssetVariantVideoLayoutAttributes)initWithFigVideoImmersiveAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoLayoutAttributes;
  v4 = [(AVAssetVariantVideoLayoutAttributes *)&v6 init];
  if (v4) {
    v4->_figVideoLayoutAttributes = (FigAlternateObjCVideoLayoutAttributes *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoLayoutAttributes;
  [(AVAssetVariantVideoLayoutAttributes *)&v3 dealloc];
}

- (CMStereoViewComponents)stereoViewComponents
{
  return [(FigAlternateObjCVideoLayoutAttributes *)self->_figVideoLayoutAttributes stereoViewComponents];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  CMStereoViewComponents v6 = [(AVAssetVariantVideoLayoutAttributes *)self stereoViewComponents];
  v7 = @"Mono";
  if (v6 == 3) {
    v7 = @"Stereo";
  }
  v8 = (void *)[v3 stringWithFormat:@"<%@: %p, stereoView:%@", v5, self, v7];
  [v8 appendFormat:@">"];
  return v8;
}

- (unint64_t)packingType
{
  return [(FigAlternateObjCVideoLayoutAttributes *)self->_figVideoLayoutAttributes packingType];
}

- (unint64_t)projectionType
{
  return [(FigAlternateObjCVideoLayoutAttributes *)self->_figVideoLayoutAttributes projectionType];
}

@end