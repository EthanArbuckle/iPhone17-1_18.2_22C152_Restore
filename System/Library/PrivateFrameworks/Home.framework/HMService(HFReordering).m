@interface HMService(HFReordering)
- (HFServiceNameComponents)hf_serviceNameComponents;
- (id)hf_displayName;
- (id)hf_updateDateAdded:()HFReordering;
@end

@implementation HMService(HFReordering)

- (id)hf_displayName
{
  v1 = objc_msgSend(a1, "hf_serviceNameComponents");
  v2 = [v1 composedString];

  return v2;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  v2 = [a1 accessory];
  v3 = [v2 room];

  v4 = objc_msgSend(a1, "hf_parentService");

  if (v4)
  {

    v3 = 0;
  }
  v5 = +[HFNamingComponents namingComponentFromService:a1];
  v6 = [HFServiceNameComponents alloc];
  v7 = [v5 name];
  v8 = [v3 name];
  v9 = [(HFServiceNameComponents *)v6 initWithRawServiceName:v7 rawRoomName:v8];

  return v9;
}

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end