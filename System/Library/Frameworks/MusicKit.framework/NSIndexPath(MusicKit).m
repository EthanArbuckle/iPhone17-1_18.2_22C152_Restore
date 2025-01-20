@interface NSIndexPath(MusicKit)
+ (id)musicKit_indexPathForItem:()MusicKit inSection:;
@end

@implementation NSIndexPath(MusicKit)

+ (id)musicKit_indexPathForItem:()MusicKit inSection:
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];

  return v4;
}

@end