@interface UINavigationBar(GKUITheme)
- (uint64_t)_gkApplyTheme:()GKUITheme;
@end

@implementation UINavigationBar(GKUITheme)

- (uint64_t)_gkApplyTheme:()GKUITheme
{
  return [a1 _gkApplyTheme:a3 navbarStyle:0];
}

@end