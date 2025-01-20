@interface MKLinkPreviewSnapshot
+ (CGSize)size;
- (UIImage)darkImage;
- (UIImage)lightImage;
- (void)setDarkImage:(id)a3;
- (void)setLightImage:(id)a3;
@end

@implementation MKLinkPreviewSnapshot

+ (CGSize)size
{
  if (qword_1EB3161E0 != -1) {
    dispatch_once(&qword_1EB3161E0, &__block_literal_global_97);
  }
  double v2 = *(double *)&_MergedGlobals_172;
  double v3 = *(double *)algn_1EB3161D8;
  result.height = v3;
  result.width = v2;
  return result;
}

void __29__MKLinkPreviewSnapshot_size__block_invoke()
{
  _MergedGlobals_172 = 0x4072C00000000000;
  *(void *)algn_1EB3161D8 = 0x4072C00000000000;
}

- (UIImage)lightImage
{
  return self->_lightImage;
}

- (void)setLightImage:(id)a3
{
}

- (UIImage)darkImage
{
  return self->_darkImage;
}

- (void)setDarkImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkImage, 0);

  objc_storeStrong((id *)&self->_lightImage, 0);
}

@end