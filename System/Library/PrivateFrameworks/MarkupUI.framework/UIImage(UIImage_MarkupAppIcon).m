@interface UIImage(UIImage_MarkupAppIcon)
+ (id)mu_markupAppIcon;
@end

@implementation UIImage(UIImage_MarkupAppIcon)

+ (id)mu_markupAppIcon
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MarkupUI"];
  v2 = [v0 imageNamed:@"MarkupActionItemIcon" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

@end