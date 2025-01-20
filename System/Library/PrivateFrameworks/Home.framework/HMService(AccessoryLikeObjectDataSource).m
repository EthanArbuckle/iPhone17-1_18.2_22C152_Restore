@interface HMService(AccessoryLikeObjectDataSource)
- (id)hf_rootAccessoryLikeHomeKitObject;
@end

@implementation HMService(AccessoryLikeObjectDataSource)

- (id)hf_rootAccessoryLikeHomeKitObject
{
  v2 = objc_msgSend(a1, "hf_serviceGroup");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "hf_rootAccessoryLikeHomeKitObject");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v5 = [a1 accessory];
  if (objc_msgSend(v5, "hf_showAsAccessoryTile"))
  {
    v6 = [a1 accessory];
    int v7 = objc_msgSend(v6, "hf_isHomePod");

    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  v8 = [a1 accessory];
  if (objc_msgSend(v8, "hf_showAsAccessoryTile"))
  {
    v9 = [a1 accessory];
    v10 = objc_msgSend(v9, "hf_primaryService");
    v11 = [v10 serviceType];
    v12 = [a1 serviceType];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v4 = [a1 accessory];
      goto LABEL_12;
    }
  }
  else
  {
  }
LABEL_11:
  id v4 = a1;
LABEL_12:
  v14 = v4;

  return v14;
}

@end