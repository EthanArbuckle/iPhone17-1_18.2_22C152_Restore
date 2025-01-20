@interface IDSDevice(HMDAccounts)
- (HMDDeviceCapabilities)hmd_capabilities;
- (HMDHomeKitVersion)hmd_version;
- (id)hmd_handlesForService:()HMDAccounts;
- (id)hmd_preferredHandleForService:()HMDAccounts;
- (id)hmd_productInfo;
@end

@implementation IDSDevice(HMDAccounts)

- (id)hmd_preferredHandleForService:()HMDAccounts
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(a1, "hmd_handlesForService:", 0);
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v5 isGlobal])
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)hmd_handlesForService:()HMDAccounts
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  id v6 = objc_alloc(MEMORY[0x263F08C38]);
  long long v7 = [a1 uniqueIDOverride];
  long long v8 = (void *)[v6 initWithUUIDString:v7];

  if (v8)
  {
    long long v9 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v8];
    if (v9)
    {
      long long v10 = [[HMDDeviceHandle alloc] initWithInternal:v9];
      [v5 addObject:v10];
    }
    v11 = [a1 pushToken];
    uint64_t v12 = objc_msgSend(v4, "hmd_preferredHandle");
    if (v11 && (objc_msgSend(v11, "hmf_isZeroed") & 1) == 0 && v12)
    {
      v13 = [[_HMDGlobalDeviceHandle alloc] initWithPushToken:v11 accountHandle:v12];
      if (!v13)
      {
LABEL_12:

        v16 = (void *)[v5 copy];
        goto LABEL_16;
      }
      v14 = [[HMDDeviceHandle alloc] initWithInternal:v13];
    }
    else
    {
      v15 = (void *)IDSCopyIDForDevice();
      v13 = (_HMDGlobalDeviceHandle *)[v15 mutableCopy];

      [(_HMDGlobalDeviceHandle *)v13 replaceOccurrencesOfString:@"self-token", @"token", 1, 0, [(_HMDGlobalDeviceHandle *)v13 length] withString options range];
      v14 = +[HMDDeviceHandle deviceHandleForDestination:v13];
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    [v5 addObject:v14];
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = a1;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    int v22 = 138543362;
    v23 = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", (uint8_t *)&v22, 0xCu);
  }
  v16 = (void *)MEMORY[0x263EFFA68];
LABEL_16:

  return v16;
}

- (HMDDeviceCapabilities)hmd_capabilities
{
  id v2 = [HMDDeviceCapabilities alloc];
  uint64_t v3 = objc_msgSend(a1, "hmd_productInfo");
  id v4 = [(HMDDeviceCapabilities *)v2 initWithProductInfo:v3];

  return v4;
}

- (HMDHomeKitVersion)hmd_version
{
  id v2 = objc_msgSend(a1, "hmd_productInfo");
  [a1 operatingSystemVersion];
  switch([v2 productPlatform])
  {
    case 1:
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_3;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_66;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_72;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_80;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_84;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_88;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_92;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_96;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_100;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_104;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_112;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_119;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_121;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_123;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_125;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_151;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_155;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_167;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_169;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_171;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_5;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_64;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_70;
      }
      goto LABEL_76;
    case 2:
      if ([v2 productClass] == 4)
      {
        long long v10 = 0uLL;
        if (!HMFOperatingSystemVersionCompare())
        {
          uint64_t v3 = [HMDHomeKitVersion alloc];
          id v4 = @"2.1";
          goto LABEL_107;
        }
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_62:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"1.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_68:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"2.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_74:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"2.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_82:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"3.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_86:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"3.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_90:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"3.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_94:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"4.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_98:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"4.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_102:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"4.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_106:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"4.3";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_3:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"5.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_66:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"5.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_72:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"5.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_117:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"6.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_80:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"6.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_84:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"6.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_88:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"6.3";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_58:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"7.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_153:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"7.0.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_92:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"7.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_96:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"7.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_100:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"7.3";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_104:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"8.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_112:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"8.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_119:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"8.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_121:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"9.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_123:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"9.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_165:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"10.0";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_125:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"10.1";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_151:
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"10.2";
        goto LABEL_107;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_155;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_167;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_169;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_171;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_5;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_64;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_70;
      }
      goto LABEL_76;
    case 3:
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_62;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_68;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_74;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_82;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_86;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_90;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_94;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_98;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_102;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_106;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_3;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_66;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_72;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_117;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_84;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_88;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_58;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_92;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_96;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_100;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_104;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_112;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_119;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_121;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_123;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_165;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_125;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_151;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_155;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_167;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_169;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_171;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_5;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_64;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() != 1) {
        goto LABEL_76;
      }
      goto LABEL_70;
    case 4:
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_68;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_74;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_82;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_86;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_90;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_94;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_98;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_102;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_106;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_3;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_66;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_72;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_80;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_84;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_88;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_58;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_153;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_92;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_96;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_100;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_104;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_112;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_119;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_121;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_123;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_165;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_125;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_151;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
        uint64_t v3 = [HMDHomeKitVersion alloc];
        id v4 = @"10.3";
      }
      else
      {
        long long v10 = 0uLL;
        if (HMFOperatingSystemVersionCompare() == 1)
        {
LABEL_155:
          uint64_t v3 = [HMDHomeKitVersion alloc];
          id v4 = @"10.3.1";
        }
        else
        {
          long long v10 = 0uLL;
          if (HMFOperatingSystemVersionCompare() == 1)
          {
LABEL_167:
            uint64_t v3 = [HMDHomeKitVersion alloc];
            id v4 = @"10.4";
          }
          else
          {
            long long v10 = 0uLL;
            if (HMFOperatingSystemVersionCompare() == 1)
            {
LABEL_169:
              uint64_t v3 = [HMDHomeKitVersion alloc];
              id v4 = @"10.5";
            }
            else
            {
              long long v10 = 0uLL;
              if (HMFOperatingSystemVersionCompare() == 1)
              {
LABEL_171:
                uint64_t v3 = [HMDHomeKitVersion alloc];
                id v4 = @"10.6";
              }
              else
              {
                long long v10 = 0uLL;
                if (HMFOperatingSystemVersionCompare() == 1)
                {
LABEL_5:
                  uint64_t v3 = [HMDHomeKitVersion alloc];
                  id v4 = @"11.1";
                }
                else
                {
                  long long v10 = 0uLL;
                  if (HMFOperatingSystemVersionCompare() == 1)
                  {
LABEL_64:
                    uint64_t v3 = [HMDHomeKitVersion alloc];
                    id v4 = @"11.2";
                  }
                  else
                  {
                    long long v10 = 0uLL;
                    if (HMFOperatingSystemVersionCompare() == 1)
                    {
LABEL_70:
                      uint64_t v3 = [HMDHomeKitVersion alloc];
                      id v4 = @"11.4";
                    }
                    else
                    {
LABEL_76:
                      long long v10 = 0uLL;
                      if (HMFOperatingSystemVersionCompare() != 1)
                      {
LABEL_78:
                        v5 = [HMDHomeKitVersion alloc];
                        id v6 = +[HMDHomeKitVersion currentVersion];
                        long long v7 = [v6 versionString];
                        long long v8 = [(HMDHomeKitVersion *)v5 initWithVersionString:v7];

                        goto LABEL_108;
                      }
                      uint64_t v3 = [HMDHomeKitVersion alloc];
                      id v4 = @"12.0";
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_107:
      long long v8 = -[HMDHomeKitVersion initWithVersionString:](v3, "initWithVersionString:", v4, v10, 0);
LABEL_108:

      return v8;
    case 5:
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_5;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_64;
      }
      long long v10 = 0uLL;
      if (HMFOperatingSystemVersionCompare() == 1) {
        goto LABEL_70;
      }
      goto LABEL_76;
    default:
      goto LABEL_78;
  }
}

- (id)hmd_productInfo
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [a1 productName];
  uint64_t v3 = HMFProductPlatformFromString();

  id v4 = [a1 modelIdentifier];
  v5 = [v4 lowercaseString];

  uint64_t v6 = HMFProductClassFromString();
  if (v3)
  {
    if (v6) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  long long v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1;
  long long v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = HMFGetLogIdentifier();
    v11 = [v8 productName];
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Could not determine product platform from product name '%@' for device: %@", buf, 0x20u);
  }
  if (!v6)
  {
LABEL_7:
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v13 modelIdentifier];
      *(_DWORD *)buf = 138543874;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Could not determine product class from model identifier '%@' for device: %@", buf, 0x20u);
    }
  }
LABEL_10:
  id v17 = objc_alloc(MEMORY[0x263F42620]);
  id v18 = (void *)MEMORY[0x263F42630];
  [a1 operatingSystemVersion];
  v19 = [v18 versionFromOperatingSystemVersion:v23];
  v20 = [a1 modelIdentifier];
  v21 = (void *)[v17 initWithPlatform:v3 class:v6 softwareVersion:v19 modelIdentifier:v20];

  return v21;
}

@end