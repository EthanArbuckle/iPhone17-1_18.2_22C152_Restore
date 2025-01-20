@interface WebResource(WKFoundationSupport)
+ (uint64_t)bundleForClass;
@end

@implementation WebResource(WKFoundationSupport)

+ (uint64_t)bundleForClass
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  Class v1 = NSClassFromString(&cfstr_Wkwebview.isa);

  return [v0 bundleForClass:v1];
}

@end