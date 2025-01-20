@interface JFXEffectContinousPreviewImageOptions
- (JTImage)backgroundImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initImageOptionsWithFrameRate:(unint64_t)a3;
- (unint64_t)preferredUpdatesPerSecond;
- (void)setBackgroundImage:(id)a3;
@end

@implementation JFXEffectContinousPreviewImageOptions

- (id)initImageOptionsWithFrameRate:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousPreviewImageOptions;
  id result = [(JFXEffectContinousPreviewOptions *)&v5 initContinousPreviewOptions];
  if (result) {
    *((void *)result + 11) = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousPreviewImageOptions;
  id result = [(JFXEffectContinousPreviewOptions *)&v5 copyWithZone:a3];
  *((void *)result + 11) = self->_preferredUpdatesPerSecond;
  return result;
}

- (unint64_t)preferredUpdatesPerSecond
{
  return self->_preferredUpdatesPerSecond;
}

- (JTImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end