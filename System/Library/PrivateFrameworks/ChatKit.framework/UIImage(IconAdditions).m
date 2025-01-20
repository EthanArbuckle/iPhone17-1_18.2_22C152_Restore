@interface UIImage(IconAdditions)
+ (id)badgeIconForImageNamed:()IconAdditions inBundle:;
+ (id)placeholderExtensionIcon;
- (id)iconForInterfaceStyle:()IconAdditions;
- (uint64_t)beginContentAccess;
- (uint64_t)isContentDiscarded;
@end

@implementation UIImage(IconAdditions)

- (uint64_t)isContentDiscarded
{
  return 0;
}

- (id)iconForInterfaceStyle:()IconAdditions
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  double v8 = v4;
  [MEMORY[0x1E4F42A80] _iconVariantForUIApplicationIconFormat:14 scale:&v8];
  [a1 CGImage];
  v5 = (CGImage *)LICreateIconForImage();
  v6 = [MEMORY[0x1E4F42A80] imageWithCGImage:v5 scale:0 orientation:v8];
  CGImageRelease(v5);

  return v6;
}

+ (id)badgeIconForImageNamed:()IconAdditions inBundle:
{
  if (a3)
  {
    double v3 = objc_msgSend(MEMORY[0x1E4F42A80], "imageNamed:inBundle:");
    double v4 = [v3 _applicationIconImageForFormat:15 precomposed:1];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (id)placeholderExtensionIcon
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Generate placeholder image", buf, 2u);
    }
  }
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 scale];
  uint64_t v3 = v2;

  uint64_t v8 = v3;
  [MEMORY[0x1E4F42A80] _iconVariantForUIApplicationIconFormat:14 scale:&v8];
  uint64_t v4 = LICreateDefaultIcon();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = [MEMORY[0x1E4F42A80] imageWithCGImage:v4];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)beginContentAccess
{
  return 1;
}

@end