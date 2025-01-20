@interface DMCAuthKitUtilities
+ (id)midWithError:(id *)a3;
@end

@implementation DMCAuthKitUtilities

+ (id)midWithError:(id *)a3
{
  if (midWithError__onceToken != -1) {
    dispatch_once(&midWithError__onceToken, &__block_literal_global_2);
  }
  id v9 = 0;
  v4 = [(id)midWithError__anisetteProvisioningController anisetteDataWithError:&v9];
  id v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    v7 = [v4 machineID];
  }

  return v7;
}

uint64_t __36__DMCAuthKitUtilities_midWithError___block_invoke()
{
  midWithError__anisetteProvisioningController = (uint64_t)objc_alloc_init((Class)DMCAKAnisetteProvisioningControllerClass());
  return MEMORY[0x1F41817F8]();
}

@end