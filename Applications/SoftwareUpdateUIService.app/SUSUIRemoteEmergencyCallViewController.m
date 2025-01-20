@interface SUSUIRemoteEmergencyCallViewController
- (SUSUIRemoteEmergencyCallViewControllerDelegate)delegate;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SUSUIRemoteEmergencyCallViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100006F34((uint64_t)v8, (uint64_t)v7, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "View Service terminated with error: %@ -> %@", v8, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
  if (WeakRetained) {
    [WeakRetained emergencyCallViewController:v7 didExitWithError:location[0]];
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(location, 0);
}

- (void)dismiss
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogEmergencyCallUI();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    sub_100005A54(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismissing SUSUIRemoteEmergencyCallViewController", v5, 2u);
  }
  objc_storeStrong(location, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
  if (WeakRetained) {
    [WeakRetained dismissEmergencyCallViewController:v8];
  }
  objc_storeStrong(&WeakRetained, 0);
}

- (SUSUIRemoteEmergencyCallViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUSUIRemoteEmergencyCallViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end