@interface UIButton(MUXCrossPlatformOperations)
+ (id)_mapsui_sectionButton;
+ (id)_mapsui_sectionHeaderButton;
- (id)_mapsui_title;
- (uint64_t)_mapsui_setImage:()MUXCrossPlatformOperations;
- (uint64_t)_mapsui_setTarget:()MUXCrossPlatformOperations action:;
- (uint64_t)set_mapsui_title:()MUXCrossPlatformOperations;
@end

@implementation UIButton(MUXCrossPlatformOperations)

+ (id)_mapsui_sectionButton
{
  v0 = [MEMORY[0x1E4FB14D0] buttonWithType:MapKitIdiomIsMacCatalyst() ^ 1];
  return v0;
}

+ (id)_mapsui_sectionHeaderButton
{
  v0 = [MEMORY[0x1E4FB14D0] buttonWithType:MapKitIdiomIsMacCatalyst() ^ 1];
  return v0;
}

- (id)_mapsui_title
{
  v1 = [a1 titleLabel];
  v2 = [v1 text];

  return v2;
}

- (uint64_t)set_mapsui_title:()MUXCrossPlatformOperations
{
  return [a1 setTitle:a3 forState:0];
}

- (uint64_t)_mapsui_setImage:()MUXCrossPlatformOperations
{
  return [a1 setImage:a3 forState:0];
}

- (uint64_t)_mapsui_setTarget:()MUXCrossPlatformOperations action:
{
  return [a1 addTarget:a3 action:a4 forControlEvents:0x2000];
}

@end