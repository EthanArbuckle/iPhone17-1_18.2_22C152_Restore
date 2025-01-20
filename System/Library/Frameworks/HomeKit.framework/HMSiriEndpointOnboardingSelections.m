@interface HMSiriEndpointOnboardingSelections
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)allowHeySiri;
- (BOOL)hasAirPlayEnabled;
- (BOOL)hasAllowHeySiri;
- (BOOL)hasAnnounceEnabled;
- (BOOL)hasDoorbellChimeEnabled;
- (BOOL)hasExplicitContentAllowed;
- (BOOL)hasLanguageValue;
- (BOOL)hasLightWhenUsingSiriEnabled;
- (BOOL)hasShareSiriAnalyticsEnabled;
- (BOOL)hasSiriEnabled;
- (BOOL)isAirPlayEnabled;
- (BOOL)isAnnounceEnabled;
- (BOOL)isDoorbellChimeEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContentAllowed;
- (BOOL)isLightWhenUsingSiriEnabled;
- (BOOL)isShareSiriAnalyticsEnabled;
- (BOOL)isSiriEnabled;
- (HMSettingLanguageValue)languageValue;
- (HMSiriEndpointOnboardingSelections)init;
- (HMSiriEndpointOnboardingSelections)initWithPayload:(id)a3;
- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5;
- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 languageValue:(id)a6;
- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8;
- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)_initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9;
- (id)payloadCopy;
- (unint64_t)hash;
- (void)setAirPlayEnabled:(BOOL)a3;
- (void)setAllowHeySiri:(BOOL)a3;
- (void)setAnnounceEnabled:(BOOL)a3;
- (void)setDoorbellChimeEnabled:(BOOL)a3;
- (void)setExplicitContentAllowed:(BOOL)a3;
- (void)setHasAirPlayEnabled:(BOOL)a3;
- (void)setHasAllowHeySiri:(BOOL)a3;
- (void)setHasAnnounceEnabled:(BOOL)a3;
- (void)setHasDoorbellChimeEnabled:(BOOL)a3;
- (void)setHasExplicitContentAllowed:(BOOL)a3;
- (void)setHasLanguageValue:(BOOL)a3;
- (void)setHasLightWhenUsingSiriEnabled:(BOOL)a3;
- (void)setHasShareSiriAnalyticsEnabled:(BOOL)a3;
- (void)setHasSiriEnabled:(BOOL)a3;
- (void)setLanguageValue:(id)a3;
- (void)setLightWhenUsingSiriEnabled:(BOOL)a3;
- (void)setShareSiriAnalyticsEnabled:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
@end

@implementation HMSiriEndpointOnboardingSelections

- (void).cxx_destruct
{
}

- (void)setHasLightWhenUsingSiriEnabled:(BOOL)a3
{
  self->_hasLightWhenUsingSiriEnabled = a3;
}

- (BOOL)hasLightWhenUsingSiriEnabled
{
  return self->_hasLightWhenUsingSiriEnabled;
}

- (void)setHasDoorbellChimeEnabled:(BOOL)a3
{
  self->_hasDoorbellChimeEnabled = a3;
}

- (BOOL)hasDoorbellChimeEnabled
{
  return self->_hasDoorbellChimeEnabled;
}

- (void)setHasAnnounceEnabled:(BOOL)a3
{
  self->_hasAnnounceEnabled = a3;
}

- (BOOL)hasAnnounceEnabled
{
  return self->_hasAnnounceEnabled;
}

- (void)setHasLanguageValue:(BOOL)a3
{
  self->_hasLanguageValue = a3;
}

- (BOOL)hasLanguageValue
{
  return self->_hasLanguageValue;
}

- (void)setHasExplicitContentAllowed:(BOOL)a3
{
  self->_hasExplicitContentAllowed = a3;
}

- (BOOL)hasExplicitContentAllowed
{
  return self->_hasExplicitContentAllowed;
}

- (void)setHasShareSiriAnalyticsEnabled:(BOOL)a3
{
  self->_hasShareSiriAnalyticsEnabled = a3;
}

- (BOOL)hasShareSiriAnalyticsEnabled
{
  return self->_hasShareSiriAnalyticsEnabled;
}

- (void)setHasAirPlayEnabled:(BOOL)a3
{
  self->_hasAirPlayEnabled = a3;
}

- (BOOL)hasAirPlayEnabled
{
  return self->_hasAirPlayEnabled;
}

- (void)setHasAllowHeySiri:(BOOL)a3
{
  self->_hasAllowHeySiri = a3;
}

- (BOOL)hasAllowHeySiri
{
  return self->_hasAllowHeySiri;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  self->_hasSiriEnabled = a3;
}

- (BOOL)hasSiriEnabled
{
  return self->_hasSiriEnabled;
}

- (unint64_t)hash
{
  v3 = [(HMSiriEndpointOnboardingSelections *)self languageValue];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = v4 ^ [(HMSiriEndpointOnboardingSelections *)self isSiriEnabled];
  if ([(HMSiriEndpointOnboardingSelections *)self allowHeySiri]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(HMSiriEndpointOnboardingSelections *)self isAirPlayEnabled];
  uint64_t v8 = 4;
  if (!v7) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v5 ^ v6 ^ v8;
  if ([(HMSiriEndpointOnboardingSelections *)self isExplicitContentAllowed]) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 0;
  }
  BOOL v11 = [(HMSiriEndpointOnboardingSelections *)self isShareSiriAnalyticsEnabled];
  uint64_t v12 = 16;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v10 ^ v12;
  BOOL v14 = [(HMSiriEndpointOnboardingSelections *)self isLightWhenUsingSiriEnabled];
  uint64_t v15 = 32;
  if (!v14) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v9 ^ v13 ^ v15;
  if ([(HMSiriEndpointOnboardingSelections *)self isAnnounceEnabled]) {
    uint64_t v17 = 64;
  }
  else {
    uint64_t v17 = 0;
  }
  BOOL v18 = [(HMSiriEndpointOnboardingSelections *)self isDoorbellChimeEnabled];
  uint64_t v19 = 128;
  if (!v18) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v17 ^ v19;
  BOOL v21 = [(HMSiriEndpointOnboardingSelections *)self hasDoorbellChimeEnabled];
  uint64_t v22 = 256;
  if (!v21) {
    uint64_t v22 = 0;
  }
  uint64_t v23 = v20 ^ v22;
  BOOL v24 = [(HMSiriEndpointOnboardingSelections *)self hasLightWhenUsingSiriEnabled];
  uint64_t v25 = 512;
  if (!v24) {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v16 ^ v23 ^ v25;
  if ([(HMSiriEndpointOnboardingSelections *)self hasAnnounceEnabled]) {
    uint64_t v27 = 1024;
  }
  else {
    uint64_t v27 = 0;
  }
  BOOL v28 = [(HMSiriEndpointOnboardingSelections *)self hasAllowHeySiri];
  uint64_t v29 = 2048;
  if (!v28) {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v27 ^ v29;
  BOOL v31 = [(HMSiriEndpointOnboardingSelections *)self hasShareSiriAnalyticsEnabled];
  uint64_t v32 = 4096;
  if (!v31) {
    uint64_t v32 = 0;
  }
  uint64_t v33 = v30 ^ v32;
  BOOL v34 = [(HMSiriEndpointOnboardingSelections *)self hasAirPlayEnabled];
  uint64_t v35 = 0x2000;
  if (!v34) {
    uint64_t v35 = 0;
  }
  uint64_t v36 = v33 ^ v35;
  BOOL v37 = [(HMSiriEndpointOnboardingSelections *)self hasExplicitContentAllowed];
  uint64_t v38 = 0x4000;
  if (!v37) {
    uint64_t v38 = 0;
  }
  uint64_t v39 = v26 ^ v36 ^ v38;
  BOOL v40 = [(HMSiriEndpointOnboardingSelections *)self hasLanguageValue];
  uint64_t v41 = 0x8000;
  if (!v40) {
    uint64_t v41 = 0;
  }
  return v39 ^ v41;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMSiriEndpointOnboardingSelections *)a3;
  if (v4 == self)
  {
    LOBYTE(v22) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_19;
    }
    BOOL v7 = [(HMSiriEndpointOnboardingSelections *)self isSiriEnabled];
    if (v7 != [(HMSiriEndpointOnboardingSelections *)v6 isSiriEnabled]) {
      goto LABEL_19;
    }
    BOOL v8 = [(HMSiriEndpointOnboardingSelections *)self allowHeySiri];
    if (v8 != [(HMSiriEndpointOnboardingSelections *)v6 allowHeySiri]) {
      goto LABEL_19;
    }
    BOOL v9 = [(HMSiriEndpointOnboardingSelections *)self isAirPlayEnabled];
    if (v9 != [(HMSiriEndpointOnboardingSelections *)v6 isAirPlayEnabled]) {
      goto LABEL_19;
    }
    BOOL v10 = [(HMSiriEndpointOnboardingSelections *)self isExplicitContentAllowed];
    if (v10 != [(HMSiriEndpointOnboardingSelections *)v6 isExplicitContentAllowed]) {
      goto LABEL_19;
    }
    BOOL v11 = [(HMSiriEndpointOnboardingSelections *)self isShareSiriAnalyticsEnabled];
    if (v11 != [(HMSiriEndpointOnboardingSelections *)v6 isShareSiriAnalyticsEnabled]) {
      goto LABEL_19;
    }
    uint64_t v12 = [(HMSiriEndpointOnboardingSelections *)self languageValue];
    uint64_t v13 = [(HMSiriEndpointOnboardingSelections *)v6 languageValue];
    int v14 = HMFEqualObjects();

    if (!v14) {
      goto LABEL_19;
    }
    BOOL v15 = [(HMSiriEndpointOnboardingSelections *)self isAnnounceEnabled];
    if (v15 == [(HMSiriEndpointOnboardingSelections *)v6 isAnnounceEnabled]
      && (BOOL v16 = [(HMSiriEndpointOnboardingSelections *)self isDoorbellChimeEnabled],
          v16 == [(HMSiriEndpointOnboardingSelections *)v6 isDoorbellChimeEnabled])
      && (BOOL v17 = [(HMSiriEndpointOnboardingSelections *)self isLightWhenUsingSiriEnabled],
          v17 == [(HMSiriEndpointOnboardingSelections *)v6 isLightWhenUsingSiriEnabled])
      && (BOOL v18 = [(HMSiriEndpointOnboardingSelections *)self hasLanguageValue],
          v18 == [(HMSiriEndpointOnboardingSelections *)v6 hasLanguageValue])
      && (BOOL v19 = [(HMSiriEndpointOnboardingSelections *)self hasSiriEnabled],
          v19 == [(HMSiriEndpointOnboardingSelections *)v6 hasSiriEnabled])
      && (BOOL v20 = [(HMSiriEndpointOnboardingSelections *)self hasAllowHeySiri],
          v20 == [(HMSiriEndpointOnboardingSelections *)v6 hasAllowHeySiri])
      && (BOOL v21 = [(HMSiriEndpointOnboardingSelections *)self hasExplicitContentAllowed],
          v21 == [(HMSiriEndpointOnboardingSelections *)v6 hasExplicitContentAllowed]))
    {
      BOOL v24 = [(HMSiriEndpointOnboardingSelections *)self hasShareSiriAnalyticsEnabled];
      BOOL v22 = v24 ^ [(HMSiriEndpointOnboardingSelections *)v6 hasShareSiriAnalyticsEnabled] ^ 1;
    }
    else
    {
LABEL_19:
      LOBYTE(v22) = 0;
    }
  }
  return v22;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (void)setAnnounceEnabled:(BOOL)a3
{
  self->_announceEnabled = a3;
  self->_hasAnnounceEnabled = 1;
}

- (BOOL)isAnnounceEnabled
{
  return self->_announceEnabled;
}

- (BOOL)isLightWhenUsingSiriEnabled
{
  return self->_lightWhenUsingSiriEnabled;
}

- (void)setLightWhenUsingSiriEnabled:(BOOL)a3
{
  self->_lightWhenUsingSiriEnabled = a3;
  self->_hasLightWhenUsingSiriEnabled = 1;
}

- (BOOL)isDoorbellChimeEnabled
{
  return self->_doorbellChimeEnabled;
}

- (void)setDoorbellChimeEnabled:(BOOL)a3
{
  self->_doorbellChimeEnabled = a3;
  self->_hasDoorbellChimeEnabled = 1;
}

- (HMSettingLanguageValue)languageValue
{
  return self->_languageValue;
}

- (void)setLanguageValue:(id)a3
{
  self->_hasLanguageValue = 1;
}

- (void)setShareSiriAnalyticsEnabled:(BOOL)a3
{
  self->_shareSiriAnalyticsEnabled = a3;
  self->_hasShareSiriAnalyticsEnabled = 1;
}

- (BOOL)isShareSiriAnalyticsEnabled
{
  return self->_shareSiriAnalyticsEnabled;
}

- (void)setExplicitContentAllowed:(BOOL)a3
{
  self->_explicitContentAllowed = a3;
  self->_hasExplicitContentAllowed = 1;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_explicitContentAllowed;
}

- (BOOL)isAirPlayEnabled
{
  return self->_airPlayEnabled;
}

- (void)setAirPlayEnabled:(BOOL)a3
{
  self->_airPlayEnabled = a3;
  self->_hasAirPlayEnabled = 1;
}

- (BOOL)allowHeySiri
{
  return self->_allowHeySiri;
}

- (void)setAllowHeySiri:(BOOL)a3
{
  self->_allowHeySiri = a3;
  self->_hasAllowHeySiri = 1;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
  self->_hasSiriEnabled = 1;
}

- (BOOL)isSiriEnabled
{
  return self->_siriEnabled;
}

- (NSArray)attributeDescriptions
{
  v32[9] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isSiriEnabled];
  BOOL v31 = HMFBooleanToString();
  uint64_t v30 = (void *)[v3 initWithName:@"siriEnabled" value:v31];
  v32[0] = v30;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self allowHeySiri];
  uint64_t v29 = HMFBooleanToString();
  BOOL v28 = (void *)[v4 initWithName:@"allowHeySiri" value:v29];
  v32[1] = v28;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isAirPlayEnabled];
  uint64_t v27 = HMFBooleanToString();
  uint64_t v26 = (void *)[v5 initWithName:@"airPlayEnabled" value:v27];
  v32[2] = v26;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isExplicitContentAllowed];
  uint64_t v25 = HMFBooleanToString();
  BOOL v24 = (void *)[v6 initWithName:@"explicitContentAllowed" value:v25];
  v32[3] = v24;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isShareSiriAnalyticsEnabled];
  uint64_t v23 = HMFBooleanToString();
  BOOL v8 = (void *)[v7 initWithName:@"shareSiriAnalyticsEnabled" value:v23];
  v32[4] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isLightWhenUsingSiriEnabled];
  BOOL v10 = HMFBooleanToString();
  BOOL v11 = (void *)[v9 initWithName:@"lightWhenUsingSiriEnabled" value:v10];
  v32[5] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isDoorbellChimeEnabled];
  uint64_t v13 = HMFBooleanToString();
  int v14 = (void *)[v12 initWithName:@"doorbellChimeEnabled" value:v13];
  v32[6] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointOnboardingSelections *)self isAnnounceEnabled];
  BOOL v16 = HMFBooleanToString();
  BOOL v17 = (void *)[v15 initWithName:@"announceEnabled" value:v16];
  v32[7] = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v19 = [(HMSiriEndpointOnboardingSelections *)self languageValue];
  BOOL v20 = (void *)[v18 initWithName:@"languageValue" value:v19];
  v32[8] = v20;
  BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:9];

  return (NSArray *)v21;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMSiriEndpointOnboardingSelections)initWithPayload:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v85 = 0;
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsSiriEnabledPayloadKey", &v85);
  id v6 = (HMSettingLanguageValue *)v85;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v7;
      id v12 = "%{public}@Failed to decode isSiriEnabled due to error: %@";
LABEL_16:
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  id v84 = 0;
  uint64_t v13 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsAllowHeySiriPayloadKey", &v84);
  int v14 = (HMSettingLanguageValue *)v84;
  if (v14)
  {
    id v7 = v14;
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v7;
      id v12 = "%{public}@Failed to decode allowHeySiri due to error: %@";
      goto LABEL_16;
    }
LABEL_17:

    BOOL v21 = 0;
    goto LABEL_18;
  }
  id v83 = 0;
  uint64_t v15 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsAirPlayEnabledPayloadKey", &v83);
  BOOL v16 = (HMSettingLanguageValue *)v83;
  if (v16)
  {
    id v7 = v16;
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v7;
      id v12 = "%{public}@Failed to decode isAirPlayEnabled due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v82 = 0;
  unsigned int v17 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsExplicitContentAllowedPayloadKey", &v82);
  id v18 = (HMSettingLanguageValue *)v82;
  if (v18)
  {
    id v7 = v18;
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v7;
      id v12 = "%{public}@Failed to decode isExplicitContentAllowed due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v81 = 0;
  unsigned int v19 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsShareSiriAnalyticsPayloadKey", &v81);
  BOOL v20 = (HMSettingLanguageValue *)v81;
  if (v20)
  {
    id v7 = v20;
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v7;
      id v12 = "%{public}@Failed to decode isShareSiriAnalyticsEnabled due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  unsigned int v66 = v17;
  char v23 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMSiriEndpointOnboardingSelectionsShouldHonorSiriAnalyticsSelectionPayloadKey");
  if (v19 && (v23 & 1) == 0)
  {
    BOOL v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v87 = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Blocking enabling siri analytics due to old payload with missing flag", buf, 0xCu);
    }
    unsigned int v19 = 0;
  }
  id v80 = 0;
  unsigned int v65 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasSiriEnabledPayloadKey", &v80);
  id v28 = v80;
  id v79 = v28;
  unsigned int v64 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasAllowHeySiriPayloadKey", &v79);
  id v29 = v79;

  id v78 = v29;
  unsigned int v63 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasAirPlayEnabledPayloadKey", &v78);
  id v30 = v78;

  id v77 = v30;
  unsigned int v62 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasExplicitContentAllowedPayloadKey", &v77);
  id v31 = v77;

  id v76 = v31;
  unsigned int v32 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasShareSiriAnalyticsPayloadKey", &v76);
  id v33 = v76;

  objc_msgSend(v4, "hmf_dictionaryForKey:", @"HMSiriEndpointOnboardingSelectionsLanguageValueKey");
  BOOL v34 = (HMSettingLanguageValue *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = v34;
  if (v34
    && (BOOL v34 = [[HMSettingLanguageValue alloc] initWithPayload:v34]) == 0)
  {
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2 reason:@"Unable to decode languageValue"];

    v49 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v51;
      __int16 v88 = 2112;
      v89 = v35;
      _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode onboarding selections due to invalid language value payload: %@", buf, 0x16u);
    }
    BOOL v21 = 0;
  }
  else
  {
    v58 = v34;
    unsigned int v59 = v32;
    unsigned int v60 = v19;
    v61 = v35;
    unsigned int v57 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMSiriEndpointOnboardingSelectionsHasLanguageValueKey");
    id v75 = v33;
    unsigned int v69 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasDoorbellChimeEnabledPayloadKey", &v75);
    id v36 = v75;

    id v74 = v36;
    unsigned int v68 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasAnnounceEnabledPayloadKey", &v74);
    id v37 = v74;

    id v73 = v37;
    unsigned int v67 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsHasLightWhenUsingSiriEnabledPayloadKey", &v73);
    id v38 = v73;

    id v72 = v38;
    unsigned int v56 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsDoorbellChimeEnabledPayloadKey", &v72);
    id v39 = v72;

    id v71 = v39;
    unsigned int v55 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsAnnounceEnabledPayloadKey", &v71);
    id v40 = v71;

    id v70 = v40;
    unsigned int v54 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMSiriEndpointOnboardingSelectionsLightWhenUsingSiriEnabledPayloadKey", &v70);
    id v7 = (HMSettingLanguageValue *)v70;

    uint64_t v41 = (void *)MEMORY[0x19F3A64A0]();
    v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v53 = HMFGetLogIdentifier();
      HMFBooleanToString();
      v44 = (HMSettingLanguageValue *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v45 = v52 = v41;
      uint64_t v46 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      v87 = v53;
      __int16 v88 = 2112;
      v89 = v44;
      __int16 v90 = 2112;
      v91 = v45;
      __int16 v92 = 2112;
      uint64_t v93 = v46;
      v47 = (void *)v46;
      _os_log_impl(&dword_19D1A8000, v43, OS_LOG_TYPE_INFO, "%{public}@Decoded Payload hasAnnounce = %@, hasLightWhenUsingSiri = %@, hasDoorbellChimeEnabled = %@ ", buf, 0x2Au);

      uint64_t v41 = v52;
    }

    v48 = [(HMSiriEndpointOnboardingSelections *)v42 init];
    [(HMSiriEndpointOnboardingSelections *)v48 setAllowHeySiri:v13];
    [(HMSiriEndpointOnboardingSelections *)v48 setSiriEnabled:v5];
    [(HMSiriEndpointOnboardingSelections *)v48 setAirPlayEnabled:v15];
    [(HMSiriEndpointOnboardingSelections *)v48 setExplicitContentAllowed:v66];
    [(HMSiriEndpointOnboardingSelections *)v48 setShareSiriAnalyticsEnabled:v60];
    [(HMSiriEndpointOnboardingSelections *)v48 setLanguageValue:v58];
    [(HMSiriEndpointOnboardingSelections *)v48 setDoorbellChimeEnabled:v56];
    [(HMSiriEndpointOnboardingSelections *)v48 setAnnounceEnabled:v55];
    [(HMSiriEndpointOnboardingSelections *)v48 setLightWhenUsingSiriEnabled:v54];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasAllowHeySiri:v64];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasSiriEnabled:v65];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasAirPlayEnabled:v63];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasExplicitContentAllowed:v62];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasShareSiriAnalyticsEnabled:v59];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasLanguageValue:v57];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasAnnounceEnabled:v68];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasDoorbellChimeEnabled:v69];
    [(HMSiriEndpointOnboardingSelections *)v48 setHasLightWhenUsingSiriEnabled:v67];
    id v9 = v48;

    BOOL v21 = v9;
    uint64_t v35 = v61;
  }

LABEL_18:
  return v21;
}

- (id)payloadCopy
{
  v28[17] = *MEMORY[0x1E4F143B8];
  char v23 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:19];
  v27[0] = @"HMSiriEndpointOnboardingSelectionsSiriEnabledPayloadKey";
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isSiriEnabled](self, "isSiriEnabled"));
  v28[0] = v26;
  v27[1] = @"HMSiriEndpointOnboardingSelectionsAllowHeySiriPayloadKey";
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections allowHeySiri](self, "allowHeySiri"));
  v28[1] = v25;
  v27[2] = @"HMSiriEndpointOnboardingSelectionsAirPlayEnabledPayloadKey";
  BOOL v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](self, "isAirPlayEnabled"));
  v28[2] = v24;
  v27[3] = @"HMSiriEndpointOnboardingSelectionsExplicitContentAllowedPayloadKey";
  BOOL v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](self, "isExplicitContentAllowed"));
  v28[3] = v22;
  v27[4] = @"HMSiriEndpointOnboardingSelectionsShareSiriAnalyticsPayloadKey";
  BOOL v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](self, "isShareSiriAnalyticsEnabled"));
  v28[4] = v21;
  v27[5] = @"HMSiriEndpointOnboardingSelectionsDoorbellChimeEnabledPayloadKey";
  BOOL v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](self, "isDoorbellChimeEnabled"));
  v28[5] = v20;
  v27[6] = @"HMSiriEndpointOnboardingSelectionsAnnounceEnabledPayloadKey";
  unsigned int v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isAnnounceEnabled](self, "isAnnounceEnabled"));
  v28[6] = v19;
  v27[7] = @"HMSiriEndpointOnboardingSelectionsLightWhenUsingSiriEnabledPayloadKey";
  id v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](self, "isLightWhenUsingSiriEnabled"));
  v28[7] = v18;
  v27[8] = @"HMSiriEndpointOnboardingSelectionsHasSiriEnabledPayloadKey";
  unsigned int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasSiriEnabled](self, "hasSiriEnabled"));
  v28[8] = v17;
  v27[9] = @"HMSiriEndpointOnboardingSelectionsHasAllowHeySiriPayloadKey";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAllowHeySiri](self, "hasAllowHeySiri"));
  v28[9] = v3;
  v27[10] = @"HMSiriEndpointOnboardingSelectionsHasAirPlayEnabledPayloadKey";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAirPlayEnabled](self, "hasAirPlayEnabled"));
  v28[10] = v4;
  v27[11] = @"HMSiriEndpointOnboardingSelectionsHasExplicitContentAllowedPayloadKey";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasExplicitContentAllowed](self, "hasExplicitContentAllowed"));
  v28[11] = v5;
  v27[12] = @"HMSiriEndpointOnboardingSelectionsHasShareSiriAnalyticsPayloadKey";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasShareSiriAnalyticsEnabled](self, "hasShareSiriAnalyticsEnabled"));
  v28[12] = v6;
  v27[13] = @"HMSiriEndpointOnboardingSelectionsHasDoorbellChimeEnabledPayloadKey";
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasDoorbellChimeEnabled](self, "hasDoorbellChimeEnabled"));
  v28[13] = v7;
  v27[14] = @"HMSiriEndpointOnboardingSelectionsHasAnnounceEnabledPayloadKey";
  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAnnounceEnabled](self, "hasAnnounceEnabled"));
  v28[14] = v8;
  v27[15] = @"HMSiriEndpointOnboardingSelectionsHasLightWhenUsingSiriEnabledPayloadKey";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasLightWhenUsingSiriEnabled](self, "hasLightWhenUsingSiriEnabled"));
  v27[16] = @"HMSiriEndpointOnboardingSelectionsShouldHonorSiriAnalyticsSelectionPayloadKey";
  v28[15] = v9;
  v28[16] = MEMORY[0x1E4F1CC38];
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:17];
  [v23 addEntriesFromDictionary:v10];

  BOOL v11 = [(HMSiriEndpointOnboardingSelections *)self languageValue];

  if (v11)
  {
    id v12 = [(HMSiriEndpointOnboardingSelections *)self languageValue];
    uint64_t v13 = [v12 payloadCopy];
    [v23 setObject:v13 forKeyedSubscript:@"HMSiriEndpointOnboardingSelectionsLanguageValueKey"];
  }
  int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasLanguageValue](self, "hasLanguageValue"));
  [v23 setObject:v14 forKeyedSubscript:@"HMSiriEndpointOnboardingSelectionsHasLanguageValueKey"];

  uint64_t v15 = (void *)[v23 copy];

  return v15;
}

- (HMSiriEndpointOnboardingSelections)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMSiriEndpointOnboardingSelections;
  v2 = [(HMSiriEndpointOnboardingSelections *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    languageValue = v2->_languageValue;
    v2->_languageValue = 0;

    v3->_siriEnabled = 0;
    *(_DWORD *)&v3->_allowHeySiri = 0;
  }
  return v3;
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8
{
  BOOL v8 = [(HMSiriEndpointOnboardingSelections *)self _initWithSiriEnabled:a3 allowHeySiri:a4 airPlayEnabled:a5 playbackInfluencesForYouEnabled:a6 shareSiriAnalyticsEnabled:a7 explicitContentAllowed:a8 languageValue:0];
  [(HMSiriEndpointOnboardingSelections *)v8 setHasLanguageValue:0];
  return v8;
}

- (id)_initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a9;
  BOOL v16 = [(HMSiriEndpointOnboardingSelections *)self init];
  [(HMSiriEndpointOnboardingSelections *)v16 setSiriEnabled:v13];
  [(HMSiriEndpointOnboardingSelections *)v16 setAllowHeySiri:v12];
  [(HMSiriEndpointOnboardingSelections *)v16 setAirPlayEnabled:v11];
  [(HMSiriEndpointOnboardingSelections *)v16 setShareSiriAnalyticsEnabled:v10];
  [(HMSiriEndpointOnboardingSelections *)v16 setExplicitContentAllowed:v9];
  [(HMSiriEndpointOnboardingSelections *)v16 setLanguageValue:v15];

  [(HMSiriEndpointOnboardingSelections *)v16 setDoorbellChimeEnabled:1];
  [(HMSiriEndpointOnboardingSelections *)v16 setAnnounceEnabled:1];
  [(HMSiriEndpointOnboardingSelections *)v16 setLightWhenUsingSiriEnabled:1];
  return v16;
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v16 = a9;
  if (v16)
  {
    unsigned int v17 = v16;
    id v18 = [(HMSiriEndpointOnboardingSelections *)self _initWithSiriEnabled:v14 allowHeySiri:v13 airPlayEnabled:v12 playbackInfluencesForYouEnabled:v11 shareSiriAnalyticsEnabled:v10 explicitContentAllowed:v9 languageValue:v16];

    return v18;
  }
  else
  {
    BOOL v20 = (void *)_HMFPreconditionFailure();
    return (HMSiriEndpointOnboardingSelections *)+[HMSiriEndpointOnboardingSelections logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_29766);
  }
  v2 = (void *)logCategory__hmf_once_v9;

  return v2;
}

uint64_t __49__HMSiriEndpointOnboardingSelections_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9;
  logCategory__hmf_once_BOOL v9 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v9 = (void *)MEMORY[0x19F3A64A0](self, a2);
  BOOL v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = HMFGetLogIdentifier();
    BOOL v13 = [NSNumber numberWithBool:v7];
    BOOL v14 = [NSNumber numberWithBool:v6];
    id v15 = [NSNumber numberWithBool:v5];
    int v17 = 138544898;
    id v18 = v12;
    __int16 v19 = 2112;
    BOOL v20 = v13;
    __int16 v21 = 2112;
    BOOL v22 = v14;
    __int16 v23 = 2112;
    BOOL v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = MEMORY[0x1E4F1CC38];
    __int16 v27 = 2112;
    uint64_t v28 = MEMORY[0x1E4F1CC28];
    __int16 v29 = 2112;
    uint64_t v30 = MEMORY[0x1E4F1CC28];
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with isSiriEnabled: %@ allowHeySiri: %@ isAirPlayEnabled: %@ playbackInfluencesForYouEnabled: %@ shareSiriAnalyticsEnabled: %@ explicitContentAllowed: %@", (uint8_t *)&v17, 0x48u);
  }
  return [(HMSiriEndpointOnboardingSelections *)v10 initWithSiriEnabled:v7 allowHeySiri:v6 airPlayEnabled:v5 playbackInfluencesForYouEnabled:1 shareSiriAnalyticsEnabled:0 explicitContentAllowed:0];
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 languageValue:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (!v10) {
    _HMFPreconditionFailure();
  }
  BOOL v11 = v10;
  BOOL v12 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v13 = self;
  BOOL v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = HMFGetLogIdentifier();
    __int16 v21 = v12;
    id v16 = [NSNumber numberWithBool:v8];
    int v17 = [NSNumber numberWithBool:v7];
    id v18 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138545154;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    __int16 v26 = 2112;
    __int16 v27 = v17;
    __int16 v28 = 2112;
    __int16 v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = MEMORY[0x1E4F1CC38];
    __int16 v32 = 2112;
    uint64_t v33 = MEMORY[0x1E4F1CC28];
    __int16 v34 = 2112;
    uint64_t v35 = MEMORY[0x1E4F1CC28];
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with isSiriEnabled: %@ allowHeySiri: %@ isAirPlayEnabled: %@ playbackInfluencesForYouEnabled: %@ shareSiriAnalyticsEnabled: %@ explicitContentAllowed: %@ languageValue: %@", buf, 0x52u);

    BOOL v12 = v21;
  }

  __int16 v19 = [(HMSiriEndpointOnboardingSelections *)v13 initWithSiriEnabled:v8 allowHeySiri:v7 airPlayEnabled:v6 playbackInfluencesForYouEnabled:1 shareSiriAnalyticsEnabled:0 explicitContentAllowed:0 languageValue:v11];

  return v19;
}

@end