@interface _NearbyDevicesNavigationController
- (BOOL)_canShowWhileLocked;
- (_NearbyDevicesNavigationControllerDelegate)dismissObserver;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDismissObserver:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation _NearbyDevicesNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NearbyDevicesNavigationController;
  [(_NearbyDevicesNavigationController *)&v5 viewDidDisappear:a3];
  v4 = [(_NearbyDevicesNavigationController *)self dismissObserver];
  [v4 _nearbyDevicesNavigationControllerDidDismiss];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(_NearbyDevicesNavigationController *)self dismissObserver];
  [v3 _nearbyDevicesNavigationControllerDidDismiss];
}

- (_NearbyDevicesNavigationControllerDelegate)dismissObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissObserver);

  return (_NearbyDevicesNavigationControllerDelegate *)WeakRetained;
}

- (void)setDismissObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end