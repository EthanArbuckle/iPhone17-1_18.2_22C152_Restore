@interface AVPlayerViewControllerConfiguration
+ (id)defaultConfiguration;
- (AVPlayerViewControllerConfiguration)init;
- (BOOL)prefersFullScreenStyleForEmbeddedMode;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)excludedControls;
- (void)setExcludedControls:(unint64_t)a3;
- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3;
@end

@implementation AVPlayerViewControllerConfiguration

- (BOOL)prefersFullScreenStyleForEmbeddedMode
{
  return self->_prefersFullScreenStyleForEmbeddedMode;
}

- (unint64_t)excludedControls
{
  return self->_excludedControls;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(AVPlayerViewControllerConfiguration);

  return v2;
}

- (AVPlayerViewControllerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerViewControllerConfiguration;
  result = [(AVPlayerViewControllerConfiguration *)&v3 init];
  if (result) {
    result->_excludedControls = 0;
  }
  return result;
}

- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3
{
  self->_prefersFullScreenStyleForEmbeddedMode = a3;
}

- (void)setExcludedControls:(unint64_t)a3
{
  if (self->_excludedControls != a3) {
    self->_excludedControls = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AVPlayerViewControllerConfiguration allocWithZone:a3] init];
  [(AVPlayerViewControllerConfiguration *)v4 setExcludedControls:[(AVPlayerViewControllerConfiguration *)self excludedControls]];
  [(AVPlayerViewControllerConfiguration *)v4 setPrefersFullScreenStyleForEmbeddedMode:[(AVPlayerViewControllerConfiguration *)self prefersFullScreenStyleForEmbeddedMode]];
  return v4;
}

@end