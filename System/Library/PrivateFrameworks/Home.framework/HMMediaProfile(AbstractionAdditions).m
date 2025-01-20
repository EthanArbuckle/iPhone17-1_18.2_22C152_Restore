@interface HMMediaProfile(AbstractionAdditions)
- (id)hf_accessoryLikeObject;
- (id)hf_containedCharacteristics;
- (id)hf_containedServices;
- (uint64_t)hf_itemClass;
@end

@implementation HMMediaProfile(AbstractionAdditions)

- (id)hf_accessoryLikeObject
{
  v2 = [a1 accessory];
  if (objc_msgSend(v2, "hf_showAsAccessoryTile"))
  {
    v3 = [a1 accessory];
    v4 = objc_msgSend(v3, "hf_siriEndpointProfile");

    if (v4)
    {
      v5 = [a1 accessory];
      v6 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:v5];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_26C155CB0;
  v6 = objc_msgSendSuper2(&v8, sel_hf_accessoryLikeObject);
LABEL_6:
  return v6;
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_containedServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (id)hf_containedCharacteristics
{
  v1 = objc_msgSend(a1, "hf_containedServices");
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_206);

  return v2;
}

@end