@interface HMResidentDevice(HFAdditions)
- (BOOL)hf_isResidentAppleTV;
- (BOOL)hf_isResidentiPad;
- (id)hf_displayName;
- (id)hf_linkedAccessory;
- (uint64_t)hf_isEnabled;
- (uint64_t)hf_isReachable;
@end

@implementation HMResidentDevice(HFAdditions)

- (id)hf_linkedAccessory
{
  v2 = [a1 home];
  v3 = [v2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HMResidentDevice_HFAdditions__hf_linkedAccessory__block_invoke;
  v6[3] = &unk_26408D968;
  v6[4] = a1;
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);

  return v4;
}

- (id)hf_displayName
{
  v2 = objc_msgSend(a1, "hf_linkedAccessory");
  v3 = objc_msgSend(v2, "hf_displayName");

  if (![v3 length])
  {
    uint64_t v4 = [a1 name];

    v3 = (void *)v4;
  }
  if (![v3 length])
  {
    uint64_t v5 = _HFLocalizedStringWithDefaultValue(@"HFResidentDeviceUnknownName", @"HFResidentDeviceUnknownName", 1);

    v3 = (void *)v5;
  }
  return v3;
}

- (uint64_t)hf_isEnabled
{
  uint64_t result = [a1 isEnabled];
  if (result) {
    return [a1 capabilities] & 1;
  }
  return result;
}

- (uint64_t)hf_isReachable
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([a1 status]) {
    return 1;
  }
  v2 = objc_msgSend(a1, "hf_linkedAccessory");
  int v3 = objc_msgSend(v2, "hf_isInstallingSoftwareUpdate");

  if (v3)
  {
    uint64_t v4 = HFLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = a1;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Resident is installing a software update; not treating it as unreachable: %@",
        (uint8_t *)&v6,
        0xCu);
    }

    return 1;
  }
  return 0;
}

- (BOOL)hf_isResidentiPad
{
  v1 = [a1 device];
  v2 = [v1 productInfo];
  BOOL v3 = [v2 productClass] == 3;

  return v3;
}

- (BOOL)hf_isResidentAppleTV
{
  v1 = [a1 device];
  v2 = [v1 productInfo];
  BOOL v3 = [v2 productClass] == 4;

  return v3;
}

@end