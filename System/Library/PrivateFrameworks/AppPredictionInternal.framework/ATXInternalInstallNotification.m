@interface ATXInternalInstallNotification
@end

@implementation ATXInternalInstallNotification

void __76___ATXInternalInstallNotification_registerForNotificationsWithInstallBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[_ATXInternalInstallNotification _installedAppsWithDatesFromNotificationData:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __79___ATXInternalInstallNotification__installedAppsWithDatesFromNotificationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4AF00] isAppClipForBundleId:a2] ^ 1;
}

@end