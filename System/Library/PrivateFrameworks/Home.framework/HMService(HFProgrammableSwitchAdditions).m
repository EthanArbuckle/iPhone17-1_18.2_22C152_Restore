@interface HMService(HFProgrammableSwitchAdditions)
+ (id)hf_programmableSwitchServiceTypes;
- (id)_hf_firstLinkedServiceOfType:()HFProgrammableSwitchAdditions;
- (id)hf_labelNamespaceCharacteristic;
- (uint64_t)hf_fallbackProgrammableSwitchIndex;
- (uint64_t)hf_isProgrammableSwitch;
- (uint64_t)hf_labelIndexCharacteristic;
@end

@implementation HMService(HFProgrammableSwitchAdditions)

- (uint64_t)hf_isProgrammableSwitch
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_programmableSwitchServiceTypes");
  v3 = [a1 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)hf_programmableSwitchServiceTypes
{
  if (qword_26AB2F2D0 != -1) {
    dispatch_once(&qword_26AB2F2D0, &__block_literal_global_294);
  }
  v0 = (void *)qword_26AB2F2D8;
  return v0;
}

- (uint64_t)hf_fallbackProgrammableSwitchIndex
{
  v2 = objc_msgSend(MEMORY[0x263F0E708], "hf_programmableSwitchServiceTypes");
  v3 = [a1 serviceType];
  char v4 = [v2 containsObject:v3];

  if (v4)
  {
    v5 = [a1 accessory];
    v6 = [v5 services];
    v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_304_0);
    v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_306];

    uint64_t v9 = [v8 indexOfObject:a1];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v10 = v9 + 1;
    }
  }
  else
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[HMService(HFProgrammableSwitchAdditions) hf_fallbackProgrammableSwitchIndex]"];
    [v8 handleFailureInFunction:v11 file:@"HMService+HFAdditions.m" lineNumber:578 description:@"HMProgrammableSwitchIndexForService(HMService *service) called w/ non-programmable switch.  Everybody panic."];

    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (uint64_t)hf_labelIndexCharacteristic
{
  return objc_msgSend(a1, "hf_characteristicOfType:", *MEMORY[0x263F0C220]);
}

- (id)hf_labelNamespaceCharacteristic
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_programmableSwitchServiceTypes");
  v3 = [a1 serviceType];
  int v4 = [v2 containsObject:v3];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = *MEMORY[0x263F0D750];
  v6 = objc_msgSend(a1, "_hf_firstLinkedServiceOfType:", *MEMORY[0x263F0D750]);
  if (v6
    || ([a1 accessory],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "hf_serviceOfType:", v5),
        v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = objc_msgSend(v6, "hf_characteristicOfType:", *MEMORY[0x263F0C228]);
  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  return v8;
}

- (id)_hf_firstLinkedServiceOfType:()HFProgrammableSwitchAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 linkedServices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__HMService_HFProgrammableSwitchAdditions___hf_firstLinkedServiceOfType___block_invoke;
  v9[3] = &unk_26408E0E8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

@end