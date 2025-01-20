@interface UIButton(MKCrossPlatformOperations)
- (id)_mapkit_title;
- (uint64_t)_mapkit_setAttributedTitle:()MKCrossPlatformOperations;
- (uint64_t)_mapkit_setImage:()MKCrossPlatformOperations;
@end

@implementation UIButton(MKCrossPlatformOperations)

- (id)_mapkit_title
{
  v1 = [a1 titleLabel];
  v2 = [v1 text];

  return v2;
}

- (uint64_t)_mapkit_setAttributedTitle:()MKCrossPlatformOperations
{
  return [a1 setAttributedTitle:a3 forState:0];
}

- (uint64_t)_mapkit_setImage:()MKCrossPlatformOperations
{
  return [a1 setImage:a3 forState:0];
}

@end