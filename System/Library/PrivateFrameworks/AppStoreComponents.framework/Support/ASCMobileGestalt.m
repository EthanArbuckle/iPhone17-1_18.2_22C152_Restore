@interface ASCMobileGestalt
+ (BOOL)hasCapabilities:(id)a3;
+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
+ (BOOL)hasHEVCDecoding;
+ (BOOL)hasSystemTelephonyOfAnyKind;
+ (BOOL)hasVenice;
+ (BOOL)isAppleSiliconMac;
+ (BOOL)isPad;
+ (BOOL)isStandaloneWatch;
+ (BOOL)wapiCapability;
+ (CGSize)mainScreenPointSize;
+ (CGSize)mainScreenSize;
+ (NSString)activePairedSystemVersion;
+ (NSString)deviceClass;
+ (NSString)productType;
+ (double)mainScreenCornerRadius;
+ (double)mainScreenScale;
@end

@implementation ASCMobileGestalt

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return _MGGetBoolAnswer(@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return _MGGetBoolAnswer(@"venice", a2);
}

+ (BOOL)wapiCapability
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

+ (NSString)deviceClass
{
  v2 = (void *)MGGetStringAnswer();

  return (NSString *)v2;
}

+ (NSString)productType
{
  v2 = (void *)MGGetStringAnswer();

  return (NSString *)v2;
}

+ (BOOL)hasHEVCDecoding
{
  return _MGGetBoolAnswer(@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (CGSize)mainScreenSize
{
  v2 = (void *)MGCopyAnswer();
  v3 = v2;
  if (v2
    && (id v4 = v2,
        v5 = (char *)[v4 bytes],
        unint64_t v6 = (unint64_t)[v4 length],
        v6 >= 0x10))
  {
    v9 = (double *)&v5[v6 & 0xFFFFFFFFFFFFFFF0];
    double v7 = *(v9 - 2);
    double v8 = *(v9 - 1);
  }
  else
  {
    double v7 = (double)(int)MGGetSInt32Answer();
    double v8 = (double)(int)MGGetSInt32Answer();
  }

  double v10 = v7;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (double)mainScreenScale
{
  MGGetFloat32Answer();
  return v2;
}

+ (double)mainScreenCornerRadius
{
  MGGetFloat32Answer();
  return v2;
}

+ (CGSize)mainScreenPointSize
{
  +[ASCMobileGestalt mainScreenScale];
  CGFloat v3 = 1.0 / v2;
  +[ASCMobileGestalt mainScreenSize];
  double v5 = v4;
  double v7 = v6;
  CGAffineTransformMakeScale(&v10, v3, v3);
  double v8 = v7 * v10.c + v10.a * v5;
  double v9 = v7 * v10.d + v10.b * v5;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (BOOL)isPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)isStandaloneWatch
{
  return 0;
}

+ (NSString)activePairedSystemVersion
{
  if (qword_1001A6050 != -1) {
    dispatch_once(&qword_1001A6050, &stru_100184210);
  }
  double v2 = (void *)qword_1001A6058;

  return (NSString *)v2;
}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

+ (BOOL)hasCapabilities:(id)a3
{
  return +[ASCMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:a3 isVisionOSCompatibleIOSApp:0];
}

+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  BOOL v4 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isEqualToString:", &stru_10018BDF0, (void)v14) & 1) == 0)
        {
          CFBooleanRef v10 = (const __CFBoolean *)(v4 ? _MGCopyAnswerWithMode() : MGCopyAnswer());
          CFBooleanRef v11 = v10;
          if (v10) {
            CFRelease(v10);
          }
          if (v11 != kCFBooleanTrue)
          {
            BOOL v12 = 0;
            goto LABEL_17;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

@end