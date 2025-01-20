@interface FUStyleProvider
+ (id)providerForStyle:(unint64_t)a3;
- (id)blueColor;
- (id)compositingFilter;
- (id)greenColor;
- (id)lightTextColor;
- (id)orangeColor;
- (id)primaryTextColor;
- (id)redColor;
- (id)separatorColor;
- (int64_t)blendMode;
@end

@implementation FUStyleProvider

- (id)separatorColor
{
  return (id)[MEMORY[0x263F1C550] separatorColor];
}

- (int64_t)blendMode
{
  return 0;
}

- (id)compositingFilter
{
  return 0;
}

+ (id)providerForStyle:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(*off_264BDD690[a3 - 1]);
  }
  return v4;
}

- (id)primaryTextColor
{
  return (id)[MEMORY[0x263F1C550] labelColor];
}

- (id)lightTextColor
{
  return (id)[MEMORY[0x263F1C550] secondaryLabelColor];
}

- (id)blueColor
{
  return (id)[MEMORY[0x263F1C550] systemBlueColor];
}

- (id)greenColor
{
  return (id)[MEMORY[0x263F1C550] systemGreenColor];
}

- (id)orangeColor
{
  return (id)[MEMORY[0x263F1C550] systemOrangeColor];
}

- (id)redColor
{
  return (id)[MEMORY[0x263F1C550] systemRedColor];
}

@end