@interface CKHeartEffectSCNView
- (BOOL)enableBackgroundRendering;
- (void)_enterBackground:(id)a3;
- (void)setEnableBackgroundRendering:(BOOL)a3;
@end

@implementation CKHeartEffectSCNView

- (void)_enterBackground:(id)a3
{
  if (!self->_enableBackgroundRendering)
  {
    v3.receiver = self;
    v3.super_class = (Class)CKHeartEffectSCNView;
    [(CKHeartEffectSCNView *)&v3 _enterBackground:a3];
  }
}

- (BOOL)enableBackgroundRendering
{
  return self->_enableBackgroundRendering;
}

- (void)setEnableBackgroundRendering:(BOOL)a3
{
  self->_enableBackgroundRendering = a3;
}

@end