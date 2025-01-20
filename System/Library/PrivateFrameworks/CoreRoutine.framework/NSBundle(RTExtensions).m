@interface NSBundle(RTExtensions)
+ (id)_coreroutine_LocalizedStringForKey:()RTExtensions;
+ (uint64_t)_coreroutineBundle;
@end

@implementation NSBundle(RTExtensions)

+ (uint64_t)_coreroutineBundle
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

+ (id)_coreroutine_LocalizedStringForKey:()RTExtensions
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 _coreroutineBundle];
  v6 = [v5 localizedStringForKey:v4 value:v4 table:0];

  return v6;
}

@end