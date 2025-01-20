@interface UseGoogleMail
@end

@implementation UseGoogleMail

void ____UseGoogleMail_block_invoke()
{
  CFBooleanRef BOOLean = (const __CFBoolean *)MGCopyAnswer();
  if (BOOLean)
  {
    __UseGoogleMail__useGoogleMail = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
  }
}

@end