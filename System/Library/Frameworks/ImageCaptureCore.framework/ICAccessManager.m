@interface ICAccessManager
+ (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4;
+ (id)bundleIdentifiersAccessingExternalMediaDevices;
+ (id)bundleIdentifiersAccessingExternalMediaDevicesWithStatus;
+ (id)connection:(id)a3 stateForAccessType:(id)a4;
+ (id)internalAccessType:(unint64_t)a3;
+ (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(unint64_t)a4;
+ (void)addBundleIdentifier:(id)a3;
+ (void)revokeBundleIdentifier:(id)a3;
+ (void)updateBundleIdentifier:(id)a3 accessType:(unint64_t)a4 withState:(unint64_t)a5;
+ (void)updateBundleIdentifierAccessingExternalMediaDevices:(id)a3 withStatus:(BOOL)a4;
@end

@implementation ICAccessManager

+ (id)internalAccessType:(unint64_t)a3
{
  if (!a3)
  {
    v4 = ICAccessTypeRead;
LABEL_5:
    v5 = *v4;
    return v5;
  }
  if (a3 == 1)
  {
    v4 = &ICAccessTypeWrite;
    goto LABEL_5;
  }
  v5 = 0;
  return v5;
}

+ (id)bundleIdentifiersAccessingExternalMediaDevices
{
  v2 = +[ICDeviceAccessManager sharedAccessManager];
  uint64_t v3 = [v2 bundleIdentifiersAccessingExternalCameras];

  return v3;
}

+ (void)updateBundleIdentifierAccessingExternalMediaDevices:(id)a3 withStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[ICDeviceAccessManager sharedAccessManager];
  [v6 updateApplicationWithBundleIdentifier:v5 withStatus:v4];
}

+ (id)bundleIdentifiersAccessingExternalMediaDevicesWithStatus
{
  v2 = +[ICDeviceAccessManager sharedAccessManager];
  uint64_t v3 = [v2 bundleIdentifiersAccessingExternalCamerasWithStatus];

  return v3;
}

+ (void)addBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ICDeviceAccessManager sharedAccessManager];
  [v4 addBundleIdentifier:v3];
}

+ (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[ICAccessManager internalAccessType:a4];
  if (v6)
  {
    v7 = +[ICDeviceAccessManager sharedAccessManager];
    unint64_t v8 = [v7 bundleIdentifier:v5 stateForAccessType:v6];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (id)connection:(id)a3 stateForAccessType:(id)a4
{
  id v5 = a3;
  id v6 = +[ICAccessManager internalAccessType:](ICAccessManager, "internalAccessType:", [a4 unsignedIntegerValue]);
  if (v6)
  {
    v7 = +[ICDeviceAccessManager sharedAccessManager];
    uint64_t v8 = [v7 connection:v5 stateForAccessType:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [NSNumber numberWithUnsignedInteger:v8];

  return v9;
}

+ (void)updateBundleIdentifier:(id)a3 accessType:(unint64_t)a4 withState:(unint64_t)a5
{
  id v9 = a3;
  v7 = +[ICAccessManager internalAccessType:a4];
  if (v7)
  {
    uint64_t v8 = +[ICDeviceAccessManager sharedAccessManager];
    [v8 updateBundleIdentifier:v9 accessType:v7 withState:a5];
  }
}

+ (void)revokeBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ICDeviceAccessManager sharedAccessManager];
  [v4 revokeBundleIdentifier:v3];
}

+ (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[ICDeviceAccessManager sharedAccessManager];
  char v8 = [v7 captureUserIntentForBundleIdentifier:v6 withNotification:v5];

  return v8;
}

@end