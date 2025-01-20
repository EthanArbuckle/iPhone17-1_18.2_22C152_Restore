@interface NSURL
@end

@implementation NSURL

uint64_t __60__NSURL_SLFacebookURLAdditions___isBetaSwitchEnabledForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = CFPreferencesCopyValue(*(CFStringRef *)(a1 + 40), @"com.apple.social.facebook", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

  return MEMORY[0x1F41817F8]();
}

@end