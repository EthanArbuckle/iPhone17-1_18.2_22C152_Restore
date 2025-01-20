@interface BKUIBundleEnrollViewController
- (id)bundleAlertView;
- (void)afterStatusMessage:(unsigned int)a3;
- (void)bundleAlertView;
- (void)statusMessage:(unsigned int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKUIBundleEnrollViewController

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIBundleEnrollViewController;
  [(BKUIBundleEnrollViewController *)&v7 viewDidAppear:a3];
  self->_shortScanCount = 0;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_maxShortScanCount = [v4 integerForKey:@"maxShortScanCount"];

  if (!self->_maxShortScanCount) {
    self->_maxShortScanCount = 5;
  }
  v5 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "BundleEnrollViewController");
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  self->bkui_bundle_enroll_view_controller_log = v5;

  +[BKUIBundleSettings synchronize];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKUIBundleEnrollViewController;
  -[BKUIBundleEnrollViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  v5 = [(BKUIBundleEnrollViewController *)self bundleAlertView];
  [v5 hideAnimated:v3];
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIBundleEnrollViewController statusMessage:](bkui_bundle_enroll_view_controller_log, v3);
  }
  if (v3 == 78) {
    ++self->_shortScanCount;
  }
}

- (void)afterStatusMessage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIBundleEnrollViewController afterStatusMessage:](bkui_bundle_enroll_view_controller_log, v3);
  }
  if (v3 == 64 && self->_shortScanCount == self->_maxShortScanCount)
  {
    self->_shortScanCount = 0;
    objc_super v6 = [(BKUIBundleEnrollViewController *)self bundleAlertView];
    int v7 = [v6 isAlertHidden];

    if (v7)
    {
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"KEEP_FINGER_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI"];

      if (MGGetSInt32Answer() == 2)
      {
        v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v11 = [v10 localizedStringForKey:@"KEEP_FINGER_TITLE_FOLLOW_UP" value:&stru_1F4081468 table:@"Mesa-j307"];

        v9 = (void *)v11;
      }
      v12 = [(BKUIBundleEnrollViewController *)self bundleAlertView];
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
      [v12 show:v9 message:&stru_1F4081468 cancelButtonTitle:v14 viewController:self];
    }
  }
}

- (id)bundleAlertView
{
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_ERROR)) {
    -[BKUIBundleEnrollViewController bundleAlertView](bkui_bundle_enroll_view_controller_log);
  }
  return 0;
}

- (void).cxx_destruct
{
}

- (void)statusMessage:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = +[BKUIUtils nameForMessage:a2];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1E4B6C000, v5, v6, "statusMessage: status = %3d (%@)", v7, v8, v9, v10, v11);
}

- (void)afterStatusMessage:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = +[BKUIUtils nameForMessage:a2];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1E4B6C000, v5, v6, "afterStatusMessage: status = %3d (%@)", v7, v8, v9, v10, v11);
}

- (void)bundleAlertView
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = [(id)objc_opt_class() description];
  int v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1E4B6C000, v1, OS_LOG_TYPE_ERROR, "BiometricKitUI: %@ does not override BKUIBundleEnrollViewController.bundleAlertView!", (uint8_t *)&v3, 0xCu);
}

@end