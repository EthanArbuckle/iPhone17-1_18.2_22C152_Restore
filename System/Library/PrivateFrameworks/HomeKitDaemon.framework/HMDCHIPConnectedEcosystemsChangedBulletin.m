@interface HMDCHIPConnectedEcosystemsChangedBulletin
+ (id)localizedBodyForAccessoryName:(id)a3;
+ (id)localizedBodyForAppleEcosystemWithAccessoryName:(id)a3;
+ (id)localizedBodyForEcosystemName:(id)a3 accessoryName:(id)a4;
+ (id)localizedTitle;
- (BOOL)isTimeSensitive;
- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithAddedPairing:(id)a3 accessory:(id)a4;
- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8;
- (NSDate)dateOfOccurrence;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)threadIdentifier;
- (NSString)title;
- (id)attributeDescriptions;
@end

@implementation HMDCHIPConnectedEcosystemsChangedBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)isTimeSensitive
{
  return self->_timeSensitive;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)self title];
  v21 = (void *)[v3 initWithName:@"Title" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)self body];
  v5 = (void *)[v4 initWithName:@"Body" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)self threadIdentifier];
  v8 = (void *)[v6 initWithName:@"Thread ID" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)self dateOfOccurrence];
  v11 = (void *)[v9 initWithName:@"Date" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)self userInfo];
  v14 = (void *)[v12 initWithName:@"User Info" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCHIPConnectedEcosystemsChangedBulletin *)self isTimeSensitive];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"Time Sensitive" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithAddedPairing:(id)a3 accessory:(id)a4
{
  v60[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_13:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v9 = [(id)objc_opt_class() localizedTitle];
  v10 = [v6 home];
  v11 = [v10 ecosystem];
  id v12 = [v11 vendor];
  int v13 = [v12 isAppleVendor];

  v58 = (void *)v9;
  v59 = v6;
  if (v13)
  {
    v14 = objc_opt_class();
    id v15 = [v8 name];
    uint64_t v16 = [v14 localizedBodyForAppleEcosystemWithAccessoryName:v15];
LABEL_10:
    v54 = (void *)v16;
    v23 = self;
    goto LABEL_11;
  }
  v17 = [v6 home];
  v18 = [v17 ecosystem];
  v19 = [v18 vendor];
  uint64_t v20 = [v19 name];
  if (!v20)
  {

    goto LABEL_9;
  }
  v21 = (void *)v20;
  v22 = [v6 home];
  [v22 ecosystem];
  v23 = self;
  v25 = v24 = v8;
  v26 = [v25 vendor];
  char v56 = [v26 isSystemCommissionerVendor];

  v8 = v24;
  self = v23;

  if (v56)
  {
LABEL_9:
    v32 = objc_opt_class();
    id v15 = [v8 name];
    uint64_t v16 = [v32 localizedBodyForAccessoryName:v15];
    goto LABEL_10;
  }
  v27 = objc_opt_class();
  id v15 = [v6 home];
  v28 = [v15 ecosystem];
  v29 = [v28 vendor];
  v30 = [v29 name];
  v31 = [v8 name];
  v54 = [v27 localizedBodyForEcosystemName:v30 accessoryName:v31];

LABEL_11:
  v55 = v8;

  v33 = [v8 home];
  v34 = (void *)MEMORY[0x263F0E140];
  v35 = [v8 contextSPIUniqueIdentifier];
  v36 = [v35 UUIDString];
  v57 = [v34 tupleWithQueryType:1 uuidString:v36];

  v37 = (void *)MEMORY[0x263F0E140];
  v38 = [v33 contextSPIUniqueIdentifier];
  v39 = [v38 UUIDString];
  v40 = [v37 tupleWithQueryType:0 uuidString:v39];

  v41 = (void *)MEMORY[0x263EFFA08];
  v60[0] = v40;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
  v43 = [v41 setWithArray:v42];
  v44 = generateURLForHomeKitObject();

  v45 = [v8 accessoryBulletinContext];
  v46 = (void *)[v45 mutableCopy];

  v47 = [v44 absoluteString];
  [v46 setObject:v47 forKeyedSubscript:*MEMORY[0x263F0DCC0]];

  v48 = [v33 contextID];
  [v46 setObject:v48 forKeyedSubscript:@"home"];

  v49 = [v33 uuid];
  v50 = [v49 UUIDString];
  v51 = [MEMORY[0x263EFF910] date];
  v52 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)v23 initWithTitle:v58 body:v54 threadIdentifier:v50 dateOfOccurrence:v51 userInfo:v46 isTimeSensitive:1];

  return v52;
}

- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_13:
    v32 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPConnectedEcosystemsChangedBulletin *)+[HMDCHIPConnectedEcosystemsChangedBulletin localizedBodyForEcosystemName:v34 accessoryName:v35];
  }
  v36.receiver = self;
  v36.super_class = (Class)HMDCHIPConnectedEcosystemsChangedBulletin;
  uint64_t v20 = [(HMDCHIPConnectedEcosystemsChangedBulletin *)&v36 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    title = v20->_title;
    v20->_title = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    body = v20->_body;
    v20->_body = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    threadIdentifier = v20->_threadIdentifier;
    v20->_threadIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    dateOfOccurrence = v20->_dateOfOccurrence;
    v20->_dateOfOccurrence = (NSDate *)v27;

    uint64_t v29 = [v19 copy];
    userInfo = v20->_userInfo;
    v20->_userInfo = (NSDictionary *)v29;

    v20->_timeSensitive = a8;
  }

  return v20;
}

+ (id)localizedBodyForEcosystemName:(id)a3 accessoryName:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = NSString;
  v8 = HMDLocalizedStringForKey(@"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_THIRD_PARTY");
  id v17 = 0;
  uint64_t v9 = [v7 localizedStringWithValidatedFormat:v8, @"%@ %@", &v17, v6, v5 validFormatSpecifiers error];
  id v10 = v17;

  v11 = v9;
  if (!v9)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_THIRD_PARTY";
      __int16 v22 = 2112;
      uint64_t v23 = @"%@ %@";
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v11 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_THIRD_PARTY";
  }
  id v15 = v11;

  return v15;
}

+ (id)localizedBodyForAppleEcosystemWithAccessoryName:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = NSString;
  id v5 = HMDLocalizedStringForKey(@"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_APPLE");
  id v14 = 0;
  id v6 = [v4 localizedStringWithValidatedFormat:v5, @"%@", &v14, v3 validFormatSpecifiers error];
  id v7 = v14;

  v8 = v6;
  if (!v6)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_APPLE";
      __int16 v19 = 2112;
      __int16 v20 = @"%@";
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v8 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_APPLE";
  }
  id v12 = v8;

  return v12;
}

+ (id)localizedBodyForAccessoryName:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = NSString;
  id v5 = HMDLocalizedStringForKey(@"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_GENERIC");
  id v14 = 0;
  id v6 = [v4 localizedStringWithValidatedFormat:v5, @"%@", &v14, v3 validFormatSpecifiers error];
  id v7 = v14;

  v8 = v6;
  if (!v6)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_GENERIC";
      __int16 v19 = 2112;
      __int16 v20 = @"%@";
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v8 = @"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY_GENERIC";
  }
  id v12 = v8;

  return v12;
}

+ (id)localizedTitle
{
  return HMDLocalizedStringForKey(@"BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_TITLE");
}

@end