@interface HFActionBuilder
@end

@implementation HFActionBuilder

id __61__HFActionBuilder_HREAdditions__recommendableObjectsInvolved__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EABF440]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __56__HFActionBuilder_HREAdditions__hre_sortActionBuilders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v8) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (v8) {
      uint64_t v18 = -1;
    }
    else {
      uint64_t v18 = v11 != 0;
    }
  }
  else
  {
    v22 = [v8 characteristic];
    v21 = [v22 service];
    v20 = [v21 uniqueIdentifier];
    v13 = [v20 UUIDString];
    v14 = [v11 characteristic];
    v15 = [v14 service];
    v16 = [v15 uniqueIdentifier];
    v17 = [v16 UUIDString];
    uint64_t v18 = [v13 compare:v17];
  }
  return v18;
}

@end