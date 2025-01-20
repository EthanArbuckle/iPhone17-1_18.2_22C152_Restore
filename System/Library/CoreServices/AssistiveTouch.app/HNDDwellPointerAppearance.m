@interface HNDDwellPointerAppearance
- (BOOL)shouldShowFingerOutlines;
- (BOOL)shouldShowInnerCircle;
- (HNDDwellPointerAppearance)init;
- (void)setShouldShowFingerOutlines:(BOOL)a3;
- (void)setShouldShowInnerCircle:(BOOL)a3;
@end

@implementation HNDDwellPointerAppearance

- (HNDDwellPointerAppearance)init
{
  v4.receiver = self;
  v4.super_class = (Class)HNDDwellPointerAppearance;
  v2 = [(HNDDwellPointerAppearance *)&v4 init];
  [(HNDDwellPointerAppearance *)v2 setShouldShowFingerOutlines:1];
  [(HNDDwellPointerAppearance *)v2 setShouldShowInnerCircle:1];
  return v2;
}

- (BOOL)shouldShowFingerOutlines
{
  return self->_shouldShowFingerOutlines;
}

- (void)setShouldShowFingerOutlines:(BOOL)a3
{
  self->_shouldShowFingerOutlines = a3;
}

- (BOOL)shouldShowInnerCircle
{
  return self->_shouldShowInnerCircle;
}

- (void)setShouldShowInnerCircle:(BOOL)a3
{
  self->_shouldShowInnerCircle = a3;
}

@end