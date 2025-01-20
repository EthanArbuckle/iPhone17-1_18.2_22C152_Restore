@interface HMUser
@end

@implementation HMUser

uint64_t __54__HMUser_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "hf_allUsersIncludingCurrentUser");
  uint64_t v4 = objc_msgSend(v3, "na_safeContainsObject:", *(void *)(a1 + 32));

  return v4;
}

id __54__HMUser_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 name];
  v5 = [v3 uniqueIdentifier];

  v6 = [v2 stringWithFormat:@"<HMAccessory: Name: %@, Identifier: %@>", v4, v5];

  return v6;
}

@end