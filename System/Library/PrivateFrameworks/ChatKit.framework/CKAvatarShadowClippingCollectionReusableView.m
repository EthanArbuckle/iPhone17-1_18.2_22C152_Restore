@interface CKAvatarShadowClippingCollectionReusableView
+ (CGSize)shadowSize;
+ (id)decorationViewKind;
- (CKAvatarShadowClippingCollectionReusableView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
@end

@implementation CKAvatarShadowClippingCollectionReusableView

- (CKAvatarShadowClippingCollectionReusableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKAvatarShadowClippingCollectionReusableView;
  v3 = -[CKAvatarShadowClippingCollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKAvatarShadowClippingCollectionReusableView *)v3 imageView];
    [(CKAvatarShadowClippingCollectionReusableView *)v4 addSubview:v5];
  }
  return v4;
}

+ (id)decorationViewKind
{
  return 0;
}

+ (CGSize)shadowSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end