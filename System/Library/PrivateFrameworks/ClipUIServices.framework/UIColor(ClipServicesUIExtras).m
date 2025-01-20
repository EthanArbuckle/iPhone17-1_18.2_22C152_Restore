@interface UIColor(ClipServicesUIExtras)
+ (id)cps_colorNamed:()ClipServicesUIExtras;
@end

@implementation UIColor(ClipServicesUIExtras)

+ (id)cps_colorNamed:()ClipServicesUIExtras
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = objc_msgSend(v4, "cps_clipUIServicesBundle");
  v7 = [a1 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

@end