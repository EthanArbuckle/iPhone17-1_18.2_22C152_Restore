@interface CKAvatarShadowClippingLeftCollectionReusableView
+ (CGSize)shadowSize;
+ (id)decorationViewKind;
- (id)imageView;
@end

@implementation CKAvatarShadowClippingLeftCollectionReusableView

+ (id)decorationViewKind
{
  return @"CKAvatarShadowClippingLeftCollectionReusableView_decorationViewKind";
}

- (id)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Messages-Chrome-LeftMask"];
    [(UIImageView *)self->_imageView setImage:v6];

    [(UIImageView *)self->_imageView sizeToFit];
    imageView = self->_imageView;
  }

  return imageView;
}

+ (CGSize)shadowSize
{
  if (shadowSize_onceToken != -1) {
    dispatch_once(&shadowSize_onceToken, &__block_literal_global_83);
  }
  double v2 = *(double *)&shadowSize_shadowSize_0;
  double v3 = *(double *)&shadowSize_shadowSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __62__CKAvatarShadowClippingLeftCollectionReusableView_shadowSize__block_invoke()
{
  id v2 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Messages-Chrome-LeftMask"];
  [v2 size];
  shadowSize_shadowSize_0 = v0;
  shadowSize_shadowSize_1 = v1;
}

- (void).cxx_destruct
{
}

@end