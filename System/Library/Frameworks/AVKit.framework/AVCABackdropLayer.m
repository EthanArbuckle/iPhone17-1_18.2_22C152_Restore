@interface AVCABackdropLayer
- (BOOL)shouldOverrideScale;
- (void)setScale:(double)a3;
- (void)setShouldOverrideScale:(BOOL)a3;
@end

@implementation AVCABackdropLayer

- (void)setShouldOverrideScale:(BOOL)a3
{
  *(&self->super._disablesOccludedBackdropBlurs + 1) = a3;
}

- (BOOL)shouldOverrideScale
{
  return *(&self->super._disablesOccludedBackdropBlurs + 1);
}

- (void)setScale:(double)a3
{
  if (*(&self->super._disablesOccludedBackdropBlurs + 1)) {
    a3 = 0.25;
  }
  v3.receiver = self;
  v3.super_class = (Class)AVCABackdropLayer;
  [(AVCABackdropLayer *)&v3 setScale:a3];
}

@end