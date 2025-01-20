@interface NSShadow(Helper)
- (void)applyToGraphicsContext_emk:()Helper;
@end

@implementation NSShadow(Helper)

- (void)applyToGraphicsContext_emk:()Helper
{
  v5 = [a1 shadowColor];
  [a1 shadowOffset];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1 shadowBlurRadius];
  CGFloat v11 = v10;
  id v13 = v5;
  v12 = (CGColor *)[v13 CGColor];
  v15.width = v7;
  v15.height = v9;
  CGContextSetShadowWithColor(a3, v15, v11, v12);
}

@end