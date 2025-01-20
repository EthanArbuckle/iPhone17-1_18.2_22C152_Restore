@interface HFSuspendedStateOverrideValueProvider
+ (NSDictionary)overrideDefaultValueForCharacteristicType;
- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4;
- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4;
@end

@implementation HFSuspendedStateOverrideValueProvider

- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4
{
  id v4 = a4;
  v5 = [v4 service];
  v6 = [v5 accessory];
  if (objc_msgSend(v6, "hf_isSuspended"))
  {
    v7 = [(id)objc_opt_class() overrideDefaultValueForCharacteristicType];
    v8 = [v4 characteristicType];
    v9 = [v7 objectForKeyedSubscript:v8];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = [v4 service];
  v6 = [v5 accessory];
  int v7 = objc_msgSend(v6, "hf_isSuspended");

  if (v7)
  {
    v8 = [(id)objc_opt_class() overrideDefaultValueForCharacteristicType];
    v9 = [v4 characteristicType];
    BOOL v10 = [v8 objectForKeyedSubscript:v9];

    v11 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v4 characteristicType];
      v13 = [v4 service];
      v14 = [v13 accessory];
      int v16 = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Overriding characteristic %@ value with %@ for suspended accessory %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    BOOL v10 = [v4 value];
  }

  return v10;
}

+ (NSDictionary)overrideDefaultValueForCharacteristicType
{
  if (_MergedGlobals_289 != -1) {
    dispatch_once(&_MergedGlobals_289, &__block_literal_global_3_22);
  }
  v2 = (void *)qword_26AB2F948;
  return (NSDictionary *)v2;
}

void __82__HFSuspendedStateOverrideValueProvider_overrideDefaultValueForCharacteristicType__block_invoke_2()
{
  v4[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BF08];
  v3[0] = *MEMORY[0x263F0BEF8];
  v3[1] = v0;
  v4[0] = &unk_26C0F72C0;
  v4[1] = &unk_26C0F72C0;
  v3[2] = *MEMORY[0x263F0C328];
  v4[2] = &unk_26C0F72C0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)qword_26AB2F948;
  qword_26AB2F948 = v1;
}

@end