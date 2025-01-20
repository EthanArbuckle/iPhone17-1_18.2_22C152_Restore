@interface PassKitApiInit
@end

@implementation PassKitApiInit

void ___PassKitApiInit_block_invoke()
{
  if (!kPKDarwinNotificationEventInAppPresented)
  {
    v0 = (void **)MEMORY[0x192FBA870]("PKDarwinNotificationEventInAppPresented", @"PassKitCore");
    if (v0) {
      v1 = *v0;
    }
    else {
      v1 = 0;
    }
    objc_storeStrong((id *)&kPKDarwinNotificationEventInAppPresented, v1);
  }
  if (!kPKDarwinNotificationEventInAppDismissed)
  {
    v2 = (void **)MEMORY[0x192FBA870]("PKDarwinNotificationEventInAppDismissed", @"PassKitCore");
    if (v2) {
      v3 = *v2;
    }
    else {
      v3 = 0;
    }
    objc_storeStrong((id *)&kPKDarwinNotificationEventInAppDismissed, v3);
  }
}

@end