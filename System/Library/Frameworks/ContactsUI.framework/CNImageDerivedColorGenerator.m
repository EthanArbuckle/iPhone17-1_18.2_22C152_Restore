@interface CNImageDerivedColorGenerator
+ (id)colorsForImageRef:(CGImage *)a3;
+ (id)defaultGrayColors;
+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation CNImageDerivedColorGenerator

+ (id)defaultGrayColors
{
  return (id)[MEMORY[0x1E4F5A670] defaultGrayColors];
}

+ (id)colorsForImageRef:(CGImage *)a3
{
  return (id)[MEMORY[0x1E4F5A670] colorsForImageRef:a3];
}

+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4
{
}

@end