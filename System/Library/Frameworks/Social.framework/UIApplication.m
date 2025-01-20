@interface UIApplication
@end

@implementation UIApplication

void __97__UIApplication_SLUIApplicationAdditions__shouldShowNetworkActivityIndicatorInRemoteApplication___block_invoke(uint64_t a1)
{
  if (__activityRequestCounter == 1)
  {
    if (*(unsigned char *)(a1 + 32)) {
      goto LABEL_8;
    }
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = (void *)MEMORY[0x1E4F28EA0];
    v5 = SLHideNetworkActivityIndicatorNotification;
  }
  else
  {
    if (__activityRequestCounter || !*(unsigned char *)(a1 + 32)) {
      goto LABEL_8;
    }
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = (void *)MEMORY[0x1E4F28EA0];
    v5 = SLShowNetworkActivityIndicatorNotification;
  }
  v6 = [v4 notificationWithName:v5 object:0];
  [v3 postNotification:v6];

LABEL_8:
  if (*(unsigned char *)(a1 + 32)) {
    int v7 = __activityRequestCounter + 1;
  }
  else {
    int v7 = __activityRequestCounter - 1;
  }
  __activityRequestCounter = v7;
  _SLLog(v1, 6, @"activityRequestCounter=%i");
}

@end