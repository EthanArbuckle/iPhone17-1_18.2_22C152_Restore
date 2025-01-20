@interface NSCoder(PhotosUI)
- (double)ph_decodeRectForKey:()PhotosUI;
@end

@implementation NSCoder(PhotosUI)

- (double)ph_decodeRectForKey:()PhotosUI
{
  id v4 = a3;
  [a1 decodeRectForKey:v4];
  double x = v8.origin.x;
  if (CGRectEqualToRect(v8, *MEMORY[0x263F001A8]))
  {
    v6 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
    if ([v6 isEqualToString:@"{{inf, inf}, {0, 0}}"]) {
      double x = *MEMORY[0x263F001A0];
    }
  }
  return x;
}

@end