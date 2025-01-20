@interface EKUIAvailabilityNavigationController
- (BOOL)canManagePresentationStyle;
- (BOOL)presentModally;
- (BOOL)wantsManagement;
- (EKUIAvailabilityNavigationController)initWithRootViewController:(id)a3;
- (int64_t)modalPresentationStyle;
- (void)setModalPresentationStyle:(int64_t)a3;
@end

@implementation EKUIAvailabilityNavigationController

- (EKUIAvailabilityNavigationController)initWithRootViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityNavigationController;
  result = [(EKUIAvailabilityNavigationController *)&v4 initWithRootViewController:a3];
  if (result) {
    result->_modalPresentationStyle = -2;
  }
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)presentModally
{
  return 1;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (int64_t)modalPresentationStyle
{
  v3 = [(EKUIAvailabilityNavigationController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3))
  {
    objc_super v4 = [(EKUIAvailabilityNavigationController *)self view];
    BOOL IsCompact = EKUICurrentHeightSizeClassIsCompact(v4);

    if (IsCompact) {
      return 3;
    }
  }
  else
  {
  }
  if (self->_modalPresentationStyle == -2) {
    return 2;
  }
  else {
    return self->_modalPresentationStyle;
  }
}

@end