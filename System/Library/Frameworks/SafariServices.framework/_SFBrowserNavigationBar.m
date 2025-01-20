@interface _SFBrowserNavigationBar
+ (int64_t)_metricsCategory;
- (double)placeholderHorizontalInset;
- (id)newTextField;
@end

@implementation _SFBrowserNavigationBar

- (double)placeholderHorizontalInset
{
  return 0.0;
}

- (id)newTextField
{
  return 0;
}

+ (int64_t)_metricsCategory
{
  return 1;
}

@end