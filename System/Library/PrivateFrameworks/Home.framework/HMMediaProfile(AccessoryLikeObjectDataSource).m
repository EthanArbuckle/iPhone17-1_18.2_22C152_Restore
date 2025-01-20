@interface HMMediaProfile(AccessoryLikeObjectDataSource)
- (id)hf_rootAccessoryLikeHomeKitObject;
@end

@implementation HMMediaProfile(AccessoryLikeObjectDataSource)

- (id)hf_rootAccessoryLikeHomeKitObject
{
  v2 = [a1 accessory];
  v3 = [v2 home];
  v4 = [a1 accessory];
  v5 = objc_msgSend(v3, "hf_mediaSystemForAccessory:", v4);

  if (v5)
  {
    objc_msgSend(v5, "hf_rootAccessoryLikeHomeKitObject");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  v7 = v6;

  return v7;
}

@end