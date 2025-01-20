@interface BuddyProximityAutomatedDeviceEnrollmentController
- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)daemonClient;
- (BuddyNonInteractiveDeviceActivator)wifiActivator;
- (BuddyProximityAutomatedDeviceEnrollmentController)init;
- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)delegate;
- (DMTEnrollmentCompletionViewModel)completionViewModel;
- (DMTEnrollmentStatusViewModel)currentEnrollmentStatusViewModel;
- (NSString)deviceClass;
- (void)activateUsingWiFiWithCompletion:(id)a3;
- (void)beginAdvertising;
- (void)configuratorPairingSuccessfulWithViewModel:(id)a3;
- (void)dismissProximityPinCodeWithError:(id)a3;
- (void)displayProximityPinCode:(id)a3;
- (void)displayShutdownUI;
- (void)endAdvertising;
- (void)enrollmentCompleteWithViewModel:(id)a3;
- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3;
- (void)fetchActivationStateWithCompletion:(id)a3;
- (void)pairingEndedByUser;
- (void)setCompletionViewModel:(id)a3;
- (void)setCurrentEnrollmentStatusViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shutdownButtonTapped;
@end

@implementation BuddyProximityAutomatedDeviceEnrollmentController

- (BuddyProximityAutomatedDeviceEnrollmentController)init
{
  SEL v9 = a2;
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentController;
  id location = [(BuddyProximityAutomatedDeviceEnrollmentController *)&v8 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v2;

    [*((id *)location + 4) setDelegate:location];
    id v4 = +[BuddyNonInteractiveDeviceActivator activatorUsingWiFi];
    v5 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v4;
  }
  v6 = (BuddyProximityAutomatedDeviceEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)beginAdvertising
{
  uint64_t v2 = [(BuddyProximityAutomatedDeviceEnrollmentController *)self daemonClient];
  [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)v2 beginAdvertisingProximityAutomatedDeviceEnrollment];
}

- (void)endAdvertising
{
  uint64_t v2 = [(BuddyProximityAutomatedDeviceEnrollmentController *)self daemonClient];
  [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)v2 endAdvertisingProximityAutomatedDeviceEnrollment];
}

- (void)shutdownButtonTapped
{
  uint64_t v2 = [(BuddyProximityAutomatedDeviceEnrollmentController *)self daemonClient];
  [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)v2 shutdown];
}

- (void)dismissProximityPinCodeWithError:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001987CC;
  objc_super v8 = &unk_1002B12F0;
  SEL v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)displayProximityPinCode:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100198A78;
  objc_super v8 = &unk_1002B12F0;
  SEL v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)configuratorPairingSuccessfulWithViewModel:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100198D24;
  objc_super v8 = &unk_1002B12F0;
  SEL v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100198FDC;
  objc_super v8 = &unk_1002B12F0;
  SEL v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchActivationStateWithCompletion:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, unint64_t))location[0];
  id v4 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v6 wifiActivator];
  v3[2](v3, [(BuddyNonInteractiveDeviceActivator *)v4 isActivated]);

  objc_storeStrong(location, 0);
}

- (void)activateUsingWiFiWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v11 wifiActivator];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001992F4;
  objc_super v8 = &unk_1002B2A38;
  id v9 = location[0];
  [(BuddyNonInteractiveDeviceActivator *)v3 activateWithCompletion:&v4];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)enrollmentCompleteWithViewModel:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyProximityAutomatedDeviceEnrollmentController *)v11 setCompletionViewModel:location[0]];
  v3 = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100199454;
  objc_super v8 = &unk_1002B0D20;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)displayShutdownUI
{
  id v9 = self;
  v8[1] = (id)a2;
  uint64_t v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_1001996B8;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (NSString)deviceClass
{
  uint64_t v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (void)pairingEndedByUser
{
  int v6 = self;
  SEL aSelector = a2;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id location = NSStringFromSelector(aSelector);
    sub_10004BB7C((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "%{public}@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyProximityAutomatedDeviceEnrollmentController *)v6 endAdvertising];
}

- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMTEnrollmentStatusViewModel)currentEnrollmentStatusViewModel
{
  return self->_currentEnrollmentStatusViewModel;
}

- (void)setCurrentEnrollmentStatusViewModel:(id)a3
{
}

- (DMTEnrollmentCompletionViewModel)completionViewModel
{
  return self->_completionViewModel;
}

- (void)setCompletionViewModel:(id)a3
{
}

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)daemonClient
{
  return self->_daemonClient;
}

- (BuddyNonInteractiveDeviceActivator)wifiActivator
{
  return self->_wifiActivator;
}

- (void).cxx_destruct
{
}

@end