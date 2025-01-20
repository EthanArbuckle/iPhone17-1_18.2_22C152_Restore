@interface AAUIPSSpecifier
+ (BOOL)_startSpinnerWithSpecifier:(id)a3;
+ (BOOL)_stopSpinnerWithSpecifier:(id)a3;
@end

@implementation AAUIPSSpecifier

+ (BOOL)_startSpinnerWithSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    v5 = [MEMORY[0x263F825C8] systemGrayColor];
    [v4 setColor:v5];

    [v4 startAnimating];
    [v3 setAccessoryView:v4];
  }
  return v3 != 0;
}

+ (BOOL)_stopSpinnerWithSpecifier:(id)a3
{
  id v3 = a3;
  v4 = [v3 propertyForKey:*MEMORY[0x263F602B0]];
  if (v4)
  {
    v5 = [v3 propertyForKey:*MEMORY[0x263F60028]];
    [v4 setAccessoryView:v5];
  }
  return v4 != 0;
}

@end