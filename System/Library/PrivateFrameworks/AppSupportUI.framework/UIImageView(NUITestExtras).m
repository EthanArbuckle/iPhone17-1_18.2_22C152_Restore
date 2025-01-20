@interface UIImageView(NUITestExtras)
+ (id)imageViewWithImage:()NUITestExtras;
@end

@implementation UIImageView(NUITestExtras)

+ (id)imageViewWithImage:()NUITestExtras
{
  v3 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImage:v4];

  return v5;
}

@end