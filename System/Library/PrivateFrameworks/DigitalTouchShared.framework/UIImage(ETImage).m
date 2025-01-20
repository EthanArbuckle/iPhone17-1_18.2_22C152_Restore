@interface UIImage(ETImage)
+ (id)etImageNamed:()ETImage;
+ (uint64_t)etImageNamed:()ETImage inBundle:;
@end

@implementation UIImage(ETImage)

+ (id)etImageNamed:()ETImage
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [a1 etImageNamed:v5 inBundle:v6];

  return v7;
}

+ (uint64_t)etImageNamed:()ETImage inBundle:
{
  return objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:");
}

@end