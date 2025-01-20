@interface NSBundle(UserNotificationsInternal)
+ (id)un_safeBundleWithURL:()UserNotificationsInternal;
@end

@implementation NSBundle(UserNotificationsInternal)

+ (id)un_safeBundleWithURL:()UserNotificationsInternal
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end