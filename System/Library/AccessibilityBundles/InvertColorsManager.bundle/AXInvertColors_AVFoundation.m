@interface AXInvertColors_AVFoundation
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AVFoundation

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVCaptureVideoPreviewLayer"];
  [v3 validateClass:@"AVCaptureVideoPreviewLayer" isKindOfClass:@"CALayer"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end