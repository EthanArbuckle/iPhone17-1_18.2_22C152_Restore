@interface HMAccessoryProfile(HFIncludedContextProtocol)
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol;
@end

@implementation HMAccessoryProfile(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  v4 = a1;
  if (a2 < 2)
  {
    if ((objc_msgSend(a1, "hf_isOnForContextType:", a2) & 1) == 0)
    {
      a3 = objc_msgSend(v4, "hf_hasSetForContextType:", a2) ^ 1;
      return a3 & 1;
    }
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    uint64_t v5 = 2;
    goto LABEL_9;
  }
  if (a2 != 3) {
    return a3 & 1;
  }
  if (!objc_msgSend(a1, "hf_hasSetForContextType:", 3))
  {
LABEL_7:
    a3 = 1;
    return a3 & 1;
  }
  a1 = v4;
  uint64_t v5 = 3;
LABEL_9:
  return objc_msgSend(a1, "hf_isOnForContextType:", v5);
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 accessory];
  uint64_t v5 = objc_msgSend(v4, "hf_hasSetForContextType:", a3);

  return v5;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 accessory];
  uint64_t v5 = objc_msgSend(v4, "hf_isOnForContextType:", a3);

  return v5;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      uint64_t v5 = [a1 accessory];
      char v3 = objc_msgSend(v5, "hf_shouldHideForContextType:", 1);
      goto LABEL_4;
    case 2:
      v7 = [a1 accessory];
      v8 = [v7 home];
      char v9 = objc_msgSend(v8, "hf_currentUserIsRestrictedGuest");

      if ((v9 & 1) != 0
        || ([a1 accessory],
            v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = objc_msgSend(v10, "hf_isCamera"),
            v10,
            (v11 & 1) != 0))
      {
        char v3 = 1;
      }
      else
      {
LABEL_2:
        uint64_t v5 = [a1 accessory];
        v6 = [v5 home];
        char v3 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest");

LABEL_4:
      }
      return v3 & 1;
    default:
      return v3 & 1;
  }
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  v7 = [a1 accessory];

  if (!v7) {
    NSLog(&cfstr_AccessoryIsNil.isa, a1);
  }
  v8 = [a1 accessory];
  char v9 = objc_msgSend(v8, "hf_updateValue:forContextType:", a3, a4);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x263F58190];
    v13 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v11 = [v12 futureWithError:v13];
  }
  return v11;
}

@end