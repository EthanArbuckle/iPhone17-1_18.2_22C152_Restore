@interface CFPrefsCopyUsernameForMobileUser
@end

@implementation CFPrefsCopyUsernameForMobileUser

CFStringRef ___CFPrefsCopyUsernameForMobileUser_block_invoke()
{
  v0 = getpwnam("mobile");
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, v0->pw_name, 0x8000100u);
  _CFPrefsCopyUsernameForMobileUser_mobileUserName = (uint64_t)result;
  return result;
}

@end