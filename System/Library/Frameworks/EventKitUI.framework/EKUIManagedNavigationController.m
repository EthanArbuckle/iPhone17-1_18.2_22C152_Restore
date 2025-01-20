@interface EKUIManagedNavigationController
- (BOOL)canBeDirectlyManaged;
- (BOOL)canManagePresentationStyle;
- (BOOL)forceCanBeDirectlyManagedToNo;
- (BOOL)prefersPushForSizeClass:(int64_t)a3;
- (BOOL)wantsManagement;
- (void)setForceCanBeDirectlyManagedToNo:(BOOL)a3;
@end

@implementation EKUIManagedNavigationController

- (BOOL)wantsManagement
{
  EKWeakLinkClass();
  v3 = [(EKUIManagedNavigationController *)self topViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  v6 = [(EKUIManagedNavigationController *)self topViewController];
  int v7 = [v6 conformsToProtocol:&unk_1F0D11CE8];

  if (!v7) {
    return 0;
  }
  v8 = [(EKUIManagedNavigationController *)self topViewController];
  char v9 = [v8 wantsManagement];

  return v9;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)canBeDirectlyManaged
{
  if ([(EKUIManagedNavigationController *)self forceCanBeDirectlyManagedToNo]) {
    return 0;
  }
  v4 = [(EKUIManagedNavigationController *)self topViewController];
  if ([v4 conformsToProtocol:&unk_1F0D11CE8])
  {
    v5 = [(EKUIManagedNavigationController *)self topViewController];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return 1;
    }
    v4 = [(EKUIManagedNavigationController *)self topViewController];
    char v3 = [v4 canBeDirectlyManaged];
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)prefersPushForSizeClass:(int64_t)a3
{
  return 0;
}

- (BOOL)forceCanBeDirectlyManagedToNo
{
  return self->_forceCanBeDirectlyManagedToNo;
}

- (void)setForceCanBeDirectlyManagedToNo:(BOOL)a3
{
  self->_forceCanBeDirectlyManagedToNo = a3;
}

@end