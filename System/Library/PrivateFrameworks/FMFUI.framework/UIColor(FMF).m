@interface UIColor(FMF)
+ (uint64_t)fmfOrangeColor;
@end

@implementation UIColor(FMF)

+ (uint64_t)fmfOrangeColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.937254906 green:0.56078434 blue:0.0784313753 alpha:1.0];
}

@end