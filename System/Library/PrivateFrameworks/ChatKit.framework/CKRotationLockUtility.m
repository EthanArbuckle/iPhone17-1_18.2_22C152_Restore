@interface CKRotationLockUtility
- (CKRotationLockUtility)initWithWindow:(id)a3;
- (UIWindow)lockedWindow;
- (void)dealloc;
- (void)releaseRotationLock;
- (void)setLockedWindow:(id)a3;
@end

@implementation CKRotationLockUtility

- (CKRotationLockUtility)initWithWindow:(id)a3
{
  id v4 = a3;
  v5 = [(CKRotationLockUtility *)self init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_lockedWindow, v4);
    [v4 beginDisablingInterfaceAutorotation];
  }
  return v6;
}

- (void)releaseRotationLock
{
  p_lockedWindow = &self->_lockedWindow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockedWindow);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_lockedWindow);
    [v4 endDisablingInterfaceAutorotation];

    objc_storeWeak((id *)p_lockedWindow, 0);
  }
}

- (void)dealloc
{
  [(CKRotationLockUtility *)self releaseRotationLock];
  v3.receiver = self;
  v3.super_class = (Class)CKRotationLockUtility;
  [(CKRotationLockUtility *)&v3 dealloc];
}

- (UIWindow)lockedWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockedWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setLockedWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end