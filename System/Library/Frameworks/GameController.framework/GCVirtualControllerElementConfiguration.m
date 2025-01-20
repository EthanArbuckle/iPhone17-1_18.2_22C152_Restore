@interface GCVirtualControllerElementConfiguration
- (BOOL)actsAsTouchpad;
- (BOOL)isHidden;
- (UIBezierPath)path;
- (void)setActsAsTouchpad:(BOOL)actsAsTouchpad;
- (void)setHidden:(BOOL)hidden;
- (void)setPath:(UIBezierPath *)path;
@end

@implementation GCVirtualControllerElementConfiguration

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(UIBezierPath *)path
{
}

- (BOOL)actsAsTouchpad
{
  return self->_actsAsTouchpad;
}

- (void)setActsAsTouchpad:(BOOL)actsAsTouchpad
{
  self->_actsAsTouchpad = actsAsTouchpad;
}

- (void).cxx_destruct
{
}

@end