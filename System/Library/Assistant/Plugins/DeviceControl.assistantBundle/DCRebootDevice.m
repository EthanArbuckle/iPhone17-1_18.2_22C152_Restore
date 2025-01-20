@interface DCRebootDevice
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation DCRebootDevice

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  v6 = os_log_create("com.apple.ace.devicecontrol", "DeviceControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_33C4(v6);
  }
  id v7 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"Siri reboot"];
  objc_msgSend(v7, "setRebootType:", -[DCRebootDevice isShutdownOnly](self, "isShutdownOnly") ^ 1);
  [v7 setSource:1];
  v8 = +[FBSSystemService sharedService];
  [v8 shutdownWithOptions:v7];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_3380(v6);
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    id v9 = objc_alloc_init((Class)SACommandSucceeded);
    v10 = [v9 dictionary];
    v5[2](v5, v10);
  }
LABEL_6:
}

@end