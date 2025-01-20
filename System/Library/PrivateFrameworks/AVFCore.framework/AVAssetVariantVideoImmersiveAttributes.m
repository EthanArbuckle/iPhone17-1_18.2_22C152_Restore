@interface AVAssetVariantVideoImmersiveAttributes
- (AVAssetVariantVideoImmersiveAttributes)initWithFigVideoImmersiveAttributes:(id)a3;
- (id)description;
- (int64_t)channelLayout;
- (int64_t)packing;
- (int64_t)projection;
- (void)dealloc;
@end

@implementation AVAssetVariantVideoImmersiveAttributes

- (AVAssetVariantVideoImmersiveAttributes)initWithFigVideoImmersiveAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoImmersiveAttributes;
  v4 = [(AVAssetVariantVideoImmersiveAttributes *)&v6 init];
  if (v4) {
    v4->_figVideoImmersiveAttributes = (FigAlternateObjCVideoImmersiveAttributes *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoImmersiveAttributes;
  [(AVAssetVariantVideoImmersiveAttributes *)&v3 dealloc];
}

- (int64_t)channelLayout
{
  return [(FigAlternateObjCVideoImmersiveAttributes *)self->_figVideoImmersiveAttributes channelLayout];
}

- (int64_t)projection
{
  return [(FigAlternateObjCVideoImmersiveAttributes *)self->_figVideoImmersiveAttributes projection];
}

- (int64_t)packing
{
  return [(FigAlternateObjCVideoImmersiveAttributes *)self->_figVideoImmersiveAttributes packing];
}

- (id)description
{
  if ([(AVAssetVariantVideoImmersiveAttributes *)self packing] == 1)
  {
    objc_super v3 = @"Side";
  }
  else if ([(AVAssetVariantVideoImmersiveAttributes *)self packing] == 2)
  {
    objc_super v3 = @"Over";
  }
  else
  {
    objc_super v3 = @"None";
  }
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  if ([(AVAssetVariantVideoImmersiveAttributes *)self channelLayout]) {
    v7 = @"Stereo";
  }
  else {
    v7 = @"Mono";
  }
  int64_t v8 = [(AVAssetVariantVideoImmersiveAttributes *)self projection];
  v9 = @"Fish";
  if (!v8) {
    v9 = @"Rect";
  }
  return (id)[v4 stringWithFormat:@"<%@: %p, packing:%@ channel:%@ projection:%@>", v6, self, v3, v7, v9];
}

@end