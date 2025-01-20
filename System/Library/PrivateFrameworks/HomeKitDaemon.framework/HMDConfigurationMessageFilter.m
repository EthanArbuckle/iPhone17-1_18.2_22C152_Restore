@interface HMDConfigurationMessageFilter
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDConfigurationMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  v9 = +[HMDDeviceCapabilities deviceCapabilities];
  int v10 = [v9 supportsCloudDataSync];

  if (!v10) {
    goto LABEL_7;
  }
  v11 = [MEMORY[0x263F42620] productInfo];
  if ([v11 productPlatform] != 4
    || ([v7 proxyConnection], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int64_t v15 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v13 = (void *)v12;
  char v14 = [v7 isEntitledForSPIAccess];

  if ((v14 & 1) == 0)
  {
LABEL_7:
    v11 = objc_msgSend(v8, "hmf_objectPassingTest:", &__block_literal_global_105887);
    if ([v11 operationTypes])
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:48 description:@"Operation not supported" reason:@"Configuration changes not supported" suggestion:0];
      }
      int64_t v15 = -1;
    }
    else
    {
      int64_t v15 = 1;
    }
    goto LABEL_13;
  }
LABEL_6:
  int64_t v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __66__HMDConfigurationMessageFilter_filterMessage_withPolicies_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end