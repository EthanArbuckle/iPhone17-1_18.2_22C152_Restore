@interface UIImage(SocialAdditions)
+ (id)socialFrameworkImageNamed:()SocialAdditions;
@end

@implementation UIImage(SocialAdditions)

+ (id)socialFrameworkImageNamed:()SocialAdditions
{
  v3 = (void *)MEMORY[0x1E4F42A80];
  id v4 = a3;
  v5 = SLSocialFrameworkBundle();
  v6 = [v3 imageNamed:v4 inBundle:v5];

  return v6;
}

@end