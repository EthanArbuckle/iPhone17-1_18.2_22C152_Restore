@interface NSBundle(StaticExtraction)
+ (id)ln_uniqueBundleWithPath:()StaticExtraction;
+ (id)ln_uniqueBundleWithURL:()StaticExtraction;
@end

@implementation NSBundle(StaticExtraction)

+ (id)ln_uniqueBundleWithPath:()StaticExtraction
{
  v3 = (objc_class *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initUniqueWithPath:v4];

  return v5;
}

+ (id)ln_uniqueBundleWithURL:()StaticExtraction
{
  v3 = (objc_class *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initUniqueWithURL:v4];

  return v5;
}

@end