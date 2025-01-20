@interface CRKMobileGestalt
+ (CRKMobileGestalt)sharedGestalt;
- (CGSize)mainScreenSizeInPixels;
- (NSString)buildVersion;
- (NSString)productVersion;
- (NSString)serialNumber;
- (double)mainScreenScale;
- (id)answerForQuestion:(__CFString *)a3;
- (id)answerForQuestion:(__CFString *)a3 ofClass:(Class)a4;
- (unint64_t)availableBytes;
@end

@implementation CRKMobileGestalt

+ (CRKMobileGestalt)sharedGestalt
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CRKMobileGestalt_sharedGestalt__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGestalt_onceToken != -1) {
    dispatch_once(&sharedGestalt_onceToken, block);
  }
  v2 = (void *)sharedGestalt_result;

  return (CRKMobileGestalt *)v2;
}

uint64_t __33__CRKMobileGestalt_sharedGestalt__block_invoke()
{
  sharedGestalt_result = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NSString)serialNumber
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CRKMobileGestalt *)self answerForQuestion:@"SerialNumber" ofClass:v3];
}

- (double)mainScreenScale
{
  v2 = [(CRKMobileGestalt *)self answerForQuestion:@"main-screen-scale" ofClass:objc_opt_class()];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (CGSize)mainScreenSizeInPixels
{
  double v3 = [(CRKMobileGestalt *)self answerForQuestion:@"main-screen-width" ofClass:objc_opt_class()];
  double v4 = [(CRKMobileGestalt *)self answerForQuestion:@"main-screen-height" ofClass:objc_opt_class()];
  [v3 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (unint64_t)availableBytes
{
  v2 = [(CRKMobileGestalt *)self answerForQuestion:@"DiskUsage" ofClass:objc_opt_class()];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F8BD10]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (NSString)buildVersion
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CRKMobileGestalt *)self answerForQuestion:@"BuildVersion" ofClass:v3];
}

- (NSString)productVersion
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CRKMobileGestalt *)self answerForQuestion:@"ProductVersion" ofClass:v3];
}

- (id)answerForQuestion:(__CFString *)a3 ofClass:(Class)a4
{
  unint64_t v4 = [(CRKMobileGestalt *)self answerForQuestion:a3];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)answerForQuestion:(__CFString *)a3
{
  uint64_t v3 = (void *)MGCopyAnswer();

  return v3;
}

@end