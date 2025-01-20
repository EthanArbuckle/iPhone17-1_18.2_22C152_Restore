@interface ContinuityCaptureVideoPreviewView
+ (Class)layerClass;
@end

@implementation ContinuityCaptureVideoPreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end