@interface UIApplication(SLUIApplicationAdditions)
+ (void)shouldShowNetworkActivityIndicatorInRemoteApplication:()SLUIApplicationAdditions;
@end

@implementation UIApplication(SLUIApplicationAdditions)

+ (void)shouldShowNetworkActivityIndicatorInRemoteApplication:()SLUIApplicationAdditions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__UIApplication_SLUIApplicationAdditions__shouldShowNetworkActivityIndicatorInRemoteApplication___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

@end