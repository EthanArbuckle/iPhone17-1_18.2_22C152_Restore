@interface AXAuditPluginPEP
- (AXAuditPluginPEP)init;
- (CGRect)deviceDisplayBounds;
- (CGRect)deviceNativeDisplayBounds;
- (double)deviceDisplayScale;
- (double)deviceNativeDisplayScale;
- (double)deviceRotatianInRadians;
- (id)getScreenshotData;
- (id)screenshotInfoForTransportWithFrame:(CGRect)a3;
- (void)_registerAuditElementTransportInfo;
- (void)_registerPointTransportInfo;
- (void)_registerRangeTransportInfo;
- (void)_registerRectTransportInfo;
- (void)_registerSizeTransportInfo;
@end

@implementation AXAuditPluginPEP

- (AXAuditPluginPEP)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAuditPluginPEP;
  v2 = [(AXAuditPluginPEP *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AXAuditPluginPEP *)v2 _registerRectTransportInfo];
    [(AXAuditPluginPEP *)v3 _registerPointTransportInfo];
    [(AXAuditPluginPEP *)v3 _registerSizeTransportInfo];
    [(AXAuditPluginPEP *)v3 _registerRangeTransportInfo];
    [(AXAuditPluginPEP *)v3 _registerAuditElementTransportInfo];
  }
  return v3;
}

- (void)_registerAuditElementTransportInfo
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = objc_alloc_init((Class)AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class()];
  [v2 setCanEncodeObjectBlock:&stru_10880];
  [v2 setCreateMasqueradeObjectBlock:&stru_108C0];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:0];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:1];
}

- (void)_registerRangeTransportInfo
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = objc_alloc_init((Class)AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class()];
  [v2 setCanEncodeObjectBlock:&stru_108E0];
  [v2 setCreateMasqueradeObjectBlock:&stru_10920];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_10960];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerSizeTransportInfo
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = objc_alloc_init((Class)AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class()];
  [v2 setCanEncodeObjectBlock:&stru_10980];
  [v2 setCreateMasqueradeObjectBlock:&stru_109C0];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_10A00];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerPointTransportInfo
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = objc_alloc_init((Class)AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class()];
  [v2 setCanEncodeObjectBlock:&stru_10A20];
  [v2 setCreateMasqueradeObjectBlock:&stru_10A60];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_10AA0];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerRectTransportInfo
{
  id v3 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = objc_alloc_init((Class)AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class()];
  [v2 setCanEncodeObjectBlock:&stru_10AC0];
  [v2 setCreateMasqueradeObjectBlock:&stru_10B00];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_10B40];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (id)screenshotInfoForTransportWithFrame:(CGRect)a3
{
  v4 = [(AXAuditPluginPEP *)self getScreenshotData];
  [(AXAuditPluginPEP *)self deviceRotatianInRadians];
  double v6 = v5;
  [(AXAuditPluginPEP *)self deviceNativeDisplayScale];
  double v8 = v7;
  [(AXAuditPluginPEP *)self deviceDisplayBounds];
  v9 = +[NSValue valueWithRect:](NSValue, "valueWithRect:");
  uint64_t v10 = kXDMScreenshotImageData;
  uint64_t v11 = kXDMScreenshotShouldFlipOutline;
  v12 = +[NSNumber numberWithDouble:v6];
  uint64_t v13 = kXDMScreenshotRotation;
  v14 = +[NSNumber numberWithDouble:v8];
  v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, v10, &__kCFBooleanTrue, v11, v12, v13, v14, kXDMScreenshotResolutionMultiplier, v9, kXDMScreenshotDisplayBounds, 0);

  return v15;
}

- (id)getScreenshotData
{
  id v2 = (id) _UICreateScreenUIImageWithRotation();
  id v3 = [v2 CGImage];

  if (v3)
  {
    CFRetain(v3);
    Mutable = CFDataCreateMutable(0, 0);
    CGImageDestinationRef v5 = CGImageDestinationCreateWithData(Mutable, @"public.png", 1uLL, 0);
    if (v5)
    {
      double v6 = v5;
      CFDictionaryRef v7 = (const __CFDictionary *)qword_14E30;
      if (!qword_14E30)
      {
        qword_14E30 = (uint64_t)CFDictionaryCreateMutable(0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        int valuePtr = 1061997773;
        CFNumberRef v8 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_14E30, kCGImageDestinationLossyCompressionQuality, v8);
        CFRelease(v8);
        CFDictionaryRef v7 = (const __CFDictionary *)qword_14E30;
      }
      CGImageDestinationSetProperties(v6, v7);
      CGImageDestinationAddImage(v6, (CGImageRef)v3, 0);
      CGImageDestinationFinalize(v6);
      CFRelease(v6);
    }
    CFRelease(v3);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (double)deviceDisplayScale
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (double)deviceNativeDisplayScale
{
  id v2 = +[UIScreen mainScreen];
  [v2 nativeScale];
  double v4 = v3;

  return v4;
}

- (CGRect)deviceDisplayBounds
{
  id v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)deviceNativeDisplayBounds
{
  id v2 = +[UIScreen mainScreen];
  [v2 nativeBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)deviceRotatianInRadians
{
  id v2 = objc_alloc_init((Class)FBSOrientationObserver);
  double v3 = (int *)[v2 activeInterfaceOrientation];
  [v2 invalidate];
  double v4 = 0.0;
  if (v3 != (int *)((char *)&dword_0 + 1))
  {
    if (v3 == (int *)((char *)&dword_0 + 3))
    {
      double v4 = 1.57079633;
    }
    else if (v3 == &dword_4)
    {
      double v4 = -1.57079633;
    }
    else if (v3 == (int *)((char *)&dword_0 + 2))
    {
      double v4 = 3.14159265;
    }
    else
    {
      double v4 = 0.0;
    }
  }
  CFStringRef v5 = (const __CFString *)MGCopyAnswer();
  if (v5)
  {
    CFStringRef v6 = v5;
    if (CFStringCompare(v5, @"AppleTV", 1uLL))
    {
      double v7 = +[UIDevice currentDevice];
      double v8 = (char *)[v7 userInterfaceIdiom];

      if (v8 == (unsigned char *)&dword_0 + 1) {
        double v4 = 0.0;
      }
      if (v3 != (int *)((char *)&dword_0 + 1) && v8 == (unsigned char *)&dword_0 + 1)
      {
        if (v3 == (int *)((char *)&dword_0 + 3))
        {
          double v4 = 1.57079633;
        }
        else if (v3 == &dword_4)
        {
          double v4 = -1.57079633;
        }
        else if (v3 == (int *)((char *)&dword_0 + 2))
        {
          double v4 = 3.14159265;
        }
        else
        {
          double v4 = 0.0;
        }
      }
    }
    CFRelease(v6);
  }

  return v4;
}

@end