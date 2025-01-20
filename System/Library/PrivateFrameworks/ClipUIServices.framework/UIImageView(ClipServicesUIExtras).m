@interface UIImageView(ClipServicesUIExtras)
+ (id)cps_imageViewWithImage:()ClipServicesUIExtras tintColor:backgroundColor:;
@end

@implementation UIImageView(ClipServicesUIExtras)

+ (id)cps_imageViewWithImage:()ClipServicesUIExtras tintColor:backgroundColor:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[a1 alloc] initWithImage:v10];

  [v11 setBackgroundColor:v8];
  [v11 setClipsToBounds:1];
  [v11 setContentMode:2];
  [v11 setTintColor:v9];

  return v11;
}

@end