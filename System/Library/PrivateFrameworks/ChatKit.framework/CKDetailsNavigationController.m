@interface CKDetailsNavigationController
- (BOOL)isDetached;
- (BOOL)isModalInPresentation;
- (CKDetailsControllerAdapter)detailsAdapter;
- (void)setDetailsAdapter:(id)a3;
- (void)setIsDetached:(BOOL)a3;
@end

@implementation CKDetailsNavigationController

- (BOOL)isModalInPresentation
{
  v2 = [(CKDetailsNavigationController *)self viewControllers];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (CKDetailsControllerAdapter)detailsAdapter
{
  return self->_detailsAdapter;
}

- (void)setDetailsAdapter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end