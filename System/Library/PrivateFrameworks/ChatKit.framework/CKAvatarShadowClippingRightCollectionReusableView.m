@interface CKAvatarShadowClippingRightCollectionReusableView
+ (CGSize)shadowSize;
+ (id)decorationViewKind;
- (id)imageView;
@end

@implementation CKAvatarShadowClippingRightCollectionReusableView

+ (id)decorationViewKind
{
  return @"CKAvatarShadowClippingRightCollectionReusableView_decorationViewKind";
}

+ (CGSize)shadowSize
{
  if (shadowSize_onceToken_0[0] != -1) {
    dispatch_once(shadowSize_onceToken_0, &__block_literal_global_281);
  }
  double v2 = *(double *)&shadowSize_shadowSize_0_0;
  double v3 = *(double *)&shadowSize_shadowSize_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __63__CKAvatarShadowClippingRightCollectionReusableView_shadowSize__block_invoke()
{
  id v2 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Messages-Chrome-RightMask"];
  [v2 size];
  shadowSize_shadowSize_0_0 = v0;
  shadowSize_shadowSize_1_0 = v1;
}

- (id)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Messages-Chrome-RightMask"];
    [(UIImageView *)self->_imageView setImage:v6];

    [(UIImageView *)self->_imageView sizeToFit];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void).cxx_destruct
{
}

@end