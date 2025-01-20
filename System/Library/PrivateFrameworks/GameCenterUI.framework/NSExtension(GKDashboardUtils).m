@interface NSExtension(GKDashboardUtils)
+ (uint64_t)_gkExtensionWithIdentifier:()GKDashboardUtils error:;
@end

@implementation NSExtension(GKDashboardUtils)

+ (uint64_t)_gkExtensionWithIdentifier:()GKDashboardUtils error:
{
  return objc_msgSend(MEMORY[0x1E4F28C70], "extensionWithIdentifier:error:");
}

@end