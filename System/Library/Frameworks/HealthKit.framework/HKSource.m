@interface HKSource
+ (BOOL)_isPlaceholderBundleIdentifier:(id)a3;
+ (BOOL)_representsCurrentDeviceWithBundleIdentifier:(id)a3;
+ (BOOL)isAppleDeviceBundleIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HKSource)defaultSource;
+ (id)_blePeripheralSource;
+ (id)_connectedGymSource;
+ (id)_currentSourceProductType:(BOOL)a3;
+ (id)_generateIdentifierForAppleDevice;
+ (id)_generateIdentifierForAppleDeviceWithUUID:(id)a3;
+ (id)_localDeviceSource;
+ (id)_privateSourceForClinicalAccountIdentifier:(id)a3 name:(id)a4;
+ (id)_publicSourceForClinicalExternalIdentifier:(id)a3 name:(id)a4;
+ (id)_researchStudiesDirectoryURL;
+ (id)_sourceBundleIdentifierWithEntitlements:(id)a3 processBundleIdentifier:(id)a4 isExtension:(BOOL)a5;
+ (id)_sourceNameWithRepresentsCurrentDevice:(BOOL)a3 defaultSource:(BOOL)a4;
+ (id)_sourceWithBundleIdentifier:(id)a3 defaultBundleIdentifier:(id)a4 appEntitlements:(id)a5 name:(id)a6;
+ (id)_sourceWithBundleIdentifier:(id)a3 name:(id)a4 productType:(id)a5 options:(unint64_t)a6;
+ (id)_uncachedDefaultSource;
+ (id)_uncachedDefaultSourceWithEntitlements:(id)a3;
+ (unint64_t)_sourceOptionsForAppEntitlements:(id)a3;
+ (void)_uncachedDefaultSource;
- (BOOL)_hasFirstPartyBundleID;
- (BOOL)_isAllowedBackgroundDelivery;
- (BOOL)_isAppleDevice;
- (BOOL)_isAppleWatch;
- (BOOL)_isApplication;
- (BOOL)_isBTLEServer;
- (BOOL)_isClinicalSource;
- (BOOL)_isConnectedGymSource;
- (BOOL)_isHidden;
- (BOOL)_isLocalDevice;
- (BOOL)_isPreferredSource;
- (BOOL)_isResearchStudy;
- (BOOL)_isSiri;
- (BOOL)_requiresAuthorization;
- (BOOL)isEqual:(id)a3;
- (HKSource)init;
- (HKSource)initWithCoder:(id)a3;
- (NSDate)modificationDate;
- (NSNumber)_sourceID;
- (NSString)_owningAppBundleIdentifier;
- (NSString)_productType;
- (NSString)bundleIdentifier;
- (NSString)name;
- (id)_deducedClinicalAccountIdentifier;
- (id)_fetchBundleWithError:(id *)a3;
- (id)_init;
- (id)asJSONObject;
- (id)description;
- (unint64_t)_options;
- (unint64_t)hash;
- (void)_setBundleIdentifier:(id)a3;
- (void)_setLocalDevice:(BOOL)a3;
- (void)_setModificationDate:(id)a3;
- (void)_setName:(id)a3;
- (void)_setOptions:(unint64_t)a3;
- (void)_setOwningAppBundleIdentifier:(id)a3;
- (void)_setProductType:(id)a3;
- (void)_setSourceID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSource

- (HKSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKSource;
  v5 = [(HKSource *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_localDevice = [v4 decodeBoolForKey:@"localDevice"];
    v5->_options = [v4 decodeInt64ForKey:@"sourceOptions"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owningApp"];
    owningAppBundleIdentifier = v5->_owningAppBundleIdentifier;
    v5->_owningAppBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v14;
  }
  return v5;
}

+ (id)_sourceBundleIdentifierWithEntitlements:(id)a3 processBundleIdentifier:(id)a4 isExtension:(BOOL)a5
{
  id v5 = a3;
  if ([v5 hasEntitlement:@"com.apple.private.healthkit.health-app-source"])
  {
    uint64_t v6 = (id *)&kHKHealthAppBundleIdentifier;
LABEL_5:
    id v7 = *v6;
LABEL_6:
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  if ([v5 hasEntitlement:@"com.apple.private.healthkit.local-device-source"])
  {
    uint64_t v6 = (id *)&kHKLocalDeviceBundleIdentifier;
    goto LABEL_5;
  }
  uint64_t v8 = [v5 stringForEntitlement:@"com.apple.private.healthkit.source.default"];
  if (!v8)
  {
    uint64_t v8 = [v5 stringForEntitlement:@"com.apple.private.healthkit.source_override"];
    if (!v8)
    {
      id v7 = [v5 applicationIdentifier];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSource *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v7 = 1;
    }
    else
    {
      id v5 = [(HKSource *)v4 bundleIdentifier];
      uint64_t v6 = [(HKSource *)self bundleIdentifier];
      char v7 = [v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeBool:self->_localDevice forKey:@"localDevice"];
  [v5 encodeInt64:self->_options forKey:@"sourceOptions"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_owningAppBundleIdentifier forKey:@"owningApp"];
  [v5 encodeObject:self->_modificationDate forKey:@"modificationDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)_sourceID
{
  return self->_sourceID;
}

+ (id)_localDeviceSource
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HKSource__localDeviceSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_localDeviceSource_onceToken != -1) {
    dispatch_once(&_localDeviceSource_onceToken, block);
  }
  v2 = (void *)_localDeviceSource__localDeviceSource;

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_isLocalDevice
{
  return self->_localDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_owningAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKSource;
  return [(HKSource *)&v3 init];
}

- (void)_setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)_setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (void)_setProductType:(id)a3
{
}

- (void)_setSourceID:(id)a3
{
}

- (BOOL)_isApplication
{
  return self->_options & 1;
}

uint64_t __30__HKSource__localDeviceSource__block_invoke(uint64_t a1)
{
  id v2 = [[HKSource alloc] _init];
  objc_super v3 = (void *)_localDeviceSource__localDeviceSource;
  _localDeviceSource__localDeviceSource = (uint64_t)v2;

  [(id)_localDeviceSource__localDeviceSource _setBundleIdentifier:@"com.apple.private.health.localdevice"];
  id v4 = (void *)_localDeviceSource__localDeviceSource;
  id v5 = [*(id *)(a1 + 32) _currentSourceProductType:1];
  [v4 _setProductType:v5];

  uint64_t v6 = (void *)_localDeviceSource__localDeviceSource;
  char v7 = [*(id *)(a1 + 32) _sourceNameWithRepresentsCurrentDevice:1 defaultSource:0];
  [v6 _setName:v7];

  [(id)_localDeviceSource__localDeviceSource _setLocalDevice:1];
  uint64_t v8 = (void *)_localDeviceSource__localDeviceSource;

  return [v8 _setOptions:2];
}

+ (id)_currentSourceProductType:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[_HKBehavior currentDeviceProductType];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_sourceNameWithRepresentsCurrentDevice:(BOOL)a3 defaultSource:(BOOL)a4
{
  if (a3)
  {
    id v4 = +[_HKBehavior currentDeviceDisplayName];
  }
  else if (a4)
  {
    id v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

    if (v6)
    {
      id v4 = v6;
    }
    else
    {
      char v7 = [MEMORY[0x1E4F28F80] processInfo];
      id v4 = [v7 processName];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_isAppleWatch
{
  id v2 = [(HKSource *)self _productType];
  if (+[_HKBehavior isAppleInternalInstall]
    && (([v2 isEqualToString:@"iPod6,3"] & 1) != 0
     || ([v2 isEqualToString:@"iPod6,4"] & 1) != 0))
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 hasPrefix:@"Watch"];
  }

  return v3;
}

- (NSString)_productType
{
  return self->_productType;
}

- (BOOL)_isPreferredSource
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)_isConnectedGymSource
{
  return (~[(HKSource *)self _options] & 0x12) == 0;
}

- (unint64_t)_options
{
  return self->_options;
}

+ (HKSource)defaultSource
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__HKSource_defaultSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSource_onceToken != -1) {
    dispatch_once(&defaultSource_onceToken, block);
  }
  id v2 = (void *)defaultSource_defaultSource;

  return (HKSource *)v2;
}

uint64_t __25__HKSource_defaultSource__block_invoke(uint64_t a1)
{
  defaultSource_defaultSource = [*(id *)(a1 + 32) _uncachedDefaultSource];

  return MEMORY[0x1F41817F8]();
}

+ (id)_uncachedDefaultSource
{
  id v8 = 0;
  char v3 = +[_HKEntitlements entitlementsForCurrentTaskWithError:&v8];
  id v4 = v8;
  if (!v3)
  {
    _HKInitializeLogging();
    id v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKSource _uncachedDefaultSource];
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Unable to create default source, failed to retrieve entitlements: %@", v4 format];
  }
  uint64_t v6 = [a1 _uncachedDefaultSourceWithEntitlements:v3];

  return v6;
}

+ (id)_uncachedDefaultSourceWithEntitlements:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];
  char v7 = [a1 _sourceBundleIdentifierWithEntitlements:v4 processBundleIdentifier:v6 isExtension:_HKCurrentTaskIsAppExtension()];

  if (!v7)
  {
    _HKInitializeLogging();
    id v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKSource _uncachedDefaultSourceWithEntitlements:](v8);
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"unable to create default source from entitlements"];
  }
  uint64_t v9 = [a1 _representsCurrentDeviceWithBundleIdentifier:v7];
  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = [a1 _sourceOptionsForAppEntitlements:v4];
  }
  v11 = [a1 _currentSourceProductType:v9];
  uint64_t v12 = [a1 _sourceNameWithRepresentsCurrentDevice:v9 defaultSource:1];
  id v13 = [[HKSource alloc] _init];
  [v13 _setBundleIdentifier:v7];
  [v13 _setProductType:v11];
  [v13 _setName:v12];
  [v13 _setLocalDevice:v9];
  [v13 _setOptions:v10];

  return v13;
}

+ (id)_connectedGymSource
{
  if (_connectedGymSource_onceToken != -1) {
    dispatch_once(&_connectedGymSource_onceToken, &__block_literal_global_36);
  }
  id v2 = (void *)_connectedGymSource__connectedGymSource;

  return v2;
}

uint64_t __31__HKSource__connectedGymSource__block_invoke()
{
  id v0 = [[HKSource alloc] _init];
  v1 = (void *)_connectedGymSource__connectedGymSource;
  _connectedGymSource__connectedGymSource = (uint64_t)v0;

  [(id)_connectedGymSource__connectedGymSource _setBundleIdentifier:@"com.apple.health.GymKit"];
  id v2 = (void *)_connectedGymSource__connectedGymSource;
  char v3 = HKConnectedGymSourceName();
  [v2 _setName:v3];

  id v4 = (void *)_connectedGymSource__connectedGymSource;

  return [v4 _setOptions:18];
}

+ (id)_blePeripheralSource
{
  if (_blePeripheralSource_onceToken != -1) {
    dispatch_once(&_blePeripheralSource_onceToken, &__block_literal_global_21);
  }
  id v2 = (void *)_blePeripheralSource__blePeripheralSource;

  return v2;
}

uint64_t __32__HKSource__blePeripheralSource__block_invoke()
{
  id v0 = [[HKSource alloc] _init];
  v1 = (void *)_blePeripheralSource__blePeripheralSource;
  _blePeripheralSource__blePeripheralSource = (uint64_t)v0;

  [(id)_blePeripheralSource__blePeripheralSource _setBundleIdentifier:@"com.apple.BTLEServer"];
  id v2 = (void *)_blePeripheralSource__blePeripheralSource;
  char v3 = HKBLEPeripheralSourceName();
  [v2 _setName:v3];

  id v4 = (void *)_blePeripheralSource__blePeripheralSource;

  return [v4 _setOptions:18];
}

+ (BOOL)_representsCurrentDeviceWithBundleIdentifier:(id)a3
{
  return [a3 isEqualToString:@"com.apple.private.health.localdevice"];
}

+ (id)_generateIdentifierForAppleDevice
{
  char v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 _generateIdentifierForAppleDeviceWithUUID:v3];

  return v4;
}

+ (id)_generateIdentifierForAppleDeviceWithUUID:(id)a3
{
  char v3 = NSString;
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringWithFormat:@"%@%@", @"com.apple.health.", v4];

  return v5;
}

+ (BOOL)_isPlaceholderBundleIdentifier:(id)a3
{
  return [a3 isEqualToString:@"com.apple.private.health.localdevice"];
}

+ (id)_researchStudiesDirectoryURL
{
  id v2 = HKSharedResourcesDirectory();
  char v3 = [v2 stringByAppendingPathComponent:@"Library/Research/Studies/"];

  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];

  return v4;
}

+ (id)_sourceWithBundleIdentifier:(id)a3 name:(id)a4 productType:(id)a5 options:(unint64_t)a6
{
  if (a3)
  {
    char v6 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = (void *)[objc_alloc((Class)a1) _init];
    uint64_t v14 = [v12 copy];

    v15 = (void *)v13[2];
    v13[2] = v14;

    uint64_t v16 = [v11 copy];
    objc_super v17 = (void *)v13[1];
    v13[1] = v16;

    uint64_t v18 = [v10 copy];
    v19 = (void *)v13[7];
    v13[7] = v18;

    v13[8] = v6 & 0x7F;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_privateSourceForClinicalAccountIdentifier:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HKSource.m", 277, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v9 = NSString;
  id v10 = [v7 UUIDString];
  id v11 = [v9 stringWithFormat:@"%@.%@", @"com.apple.private.health.clinical", v10];

  uint64_t v12 = [objc_alloc((Class)a1) _init];
  id v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v11;
  id v14 = v11;

  if (v8) {
    v15 = v8;
  }
  else {
    v15 = @"com.apple.private.health.clinical";
  }
  objc_storeStrong((id *)(v12 + 8), v15);
  uint64_t v16 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = 0;

  *(void *)(v12 + 64) = 8;

  return (id)v12;
}

+ (id)_publicSourceForClinicalExternalIdentifier:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"HKSource.m", 290, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v9 = objc_msgSend(v7, "hk_MD5HashAsUUID");
  id v10 = NSString;
  id v11 = [v9 UUIDString];
  uint64_t v12 = [v10 stringWithFormat:@"%@.%@", @"com.apple.public.health.clinical", v11];

  uint64_t v13 = [objc_alloc((Class)a1) _init];
  id v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;
  id v15 = v12;

  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = @"com.apple.public.health.clinical";
  }
  objc_storeStrong((id *)(v13 + 8), v16);
  objc_super v17 = *(void **)(v13 + 56);
  *(void *)(v13 + 56) = 0;

  *(void *)(v13 + 64) = 8;

  return (id)v13;
}

+ (id)_sourceWithBundleIdentifier:(id)a3 defaultBundleIdentifier:(id)a4 appEntitlements:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isEqualToString:@"com.apple.Health"])
  {
    id v14 = HKHealthKitFrameworkBundle();
    id v15 = [v14 localizedStringForKey:@"HEALTH_APP" value:&stru_1EEC60288 table:@"Localizable"];
    uint64_t v16 = +[HKSource _sourceWithBundleIdentifier:@"com.apple.Health" name:v15 productType:0 options:3];
  }
  else if ([a1 _representsCurrentDeviceWithBundleIdentifier:v10])
  {
    objc_super v17 = +[_HKBehavior sharedBehavior];
    uint64_t v18 = [v17 currentDeviceDisplayName];
    v19 = [v17 currentDeviceProductType];
    uint64_t v16 = +[HKSource _sourceWithBundleIdentifier:@"com.apple.private.health.localdevice" name:v18 productType:v19 options:2];
  }
  else if ([v10 isEqualToString:@"com.apple.BTLEServer"])
  {
    uint64_t v16 = +[HKSource _blePeripheralSource];
  }
  else
  {
    uint64_t v16 = +[HKSource _sourceWithBundleIdentifier:name:productType:options:](HKSource, "_sourceWithBundleIdentifier:name:productType:options:", v10, v13, 0, [a1 _sourceOptionsForAppEntitlements:v12]);
    if ([v12 hasEntitlement:@"com.apple.private.healthkit.source.research-study"])
    {
      uint64_t v20 = [v11 copy];
      v21 = (void *)v16[5];
      v16[5] = v20;
    }
  }

  return v16;
}

+ (unint64_t)_sourceOptionsForAppEntitlements:(id)a3
{
  id v3 = a3;
  int v4 = [v3 hasEntitlement:@"com.apple.private.healthkit.preferred_source"];
  int v5 = [v3 hasEntitlement:@"com.apple.private.healthkit.authorization_bypass"];
  int v6 = [v3 hasBackgroundDeliveryAPIAccess];
  if ([v3 hasEntitlement:@"com.apple.private.healthkit.source.research-study"]) {
    uint64_t v7 = 32;
  }
  else {
    uint64_t v7 = [v3 arrayEntitlement:@"com.apple.private.healthkit.source.identities" containsString:@"com.apple.health.[any-device-uuid]"] ^ 1;
  }
  uint64_t v8 = 2;
  if (!v4) {
    uint64_t v8 = 0;
  }
  if (!v5) {
    v8 |= 4uLL;
  }
  if (v6) {
    v8 |= 0x40uLL;
  }
  unint64_t v9 = v8 | v7;

  return v9;
}

- (BOOL)_requiresAuthorization
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)_isHidden
{
  if (![(HKSource *)self _isApplication]) {
    return 0;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier) {
    return 0;
  }
  int v4 = [(NSString *)bundleIdentifier hk_MD5Hash];
  int v5 = v4;
  if (v4) {
    char v6 = [v4 isEqualToString:@"9a954967ccb5d9e033a8732bf9396b91"];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isClinicalSource
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_isResearchStudy
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)_isAllowedBackgroundDelivery
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)_isSiri
{
  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  if (bundleIdentifier == @"com.apple.siri") {
    return 1;
  }
  if (@"com.apple.siri") {
    return -[__CFString isEqualToString:](bundleIdentifier, "isEqualToString:");
  }
  return 0;
}

- (BOOL)_isBTLEServer
{
  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  if (bundleIdentifier == @"com.apple.BTLEServer") {
    return 1;
  }
  if (@"com.apple.BTLEServer") {
    return -[__CFString isEqualToString:](bundleIdentifier, "isEqualToString:");
  }
  return 0;
}

- (id)_deducedClinicalAccountIdentifier
{
  id v3 = [NSString stringWithFormat:@"%@.", @"com.apple.private.health.clinical"];
  if ([(NSString *)self->_bundleIdentifier hasPrefix:v3])
  {
    int v4 = -[NSString substringFromIndex:](self->_bundleIdentifier, "substringFromIndex:", [v3 length]);
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_fetchBundleWithError:(id *)a3
{
  int v5 = [(HKSource *)self bundleIdentifier];
  uint64_t v6 = [(HKSource *)self _owningAppBundleIdentifier];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v5;
  }
  id v9 = v8;

  id v10 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v9];
  id v11 = [v10 bundleURL];

  if (v11
    || ([MEMORY[0x1E4F223B8] applicationProxyForCompanionIdentifier:v9],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 bundleURL],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v11];
    if (v13)
    {
      if ([v5 isEqualToString:v9])
      {
        id v14 = v13;
      }
      else
      {
        id v15 = [(id)objc_opt_class() _researchStudiesDirectoryURL];
        objc_msgSend(MEMORY[0x1E4F28B50], "hk_findContainedBundleWithIdentifier:directoryURL:", v5, v15);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v13, "hk_findContainedBundleWithIdentifier:", v5);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
            objc_super v17 = [v15 path];
            objc_msgSend(v16, "hk_assignError:code:format:", a3, 100, @"Failed to find bundle with identifier %@ in directory \"%@\" or in application bundle \"%@\"", v5, v17, v13);

            id v14 = 0;
          }
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Unable to instantiate app bundle at URL %@ for source %@", v11, self);
      id v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Application proxy missing bundle URL for source %@ with identifier %@", self, v9);
    id v14 = 0;
  }

  return v14;
}

- (HKSource)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  int v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p \"%@\", bundle identifier: %@, localDeviceSource: %d, modification date: %@>", objc_opt_class(), self, self->_name, self->_bundleIdentifier, self->_localDevice, self->_modificationDate];
}

- (BOOL)_isAppleDevice
{
  if ([(NSString *)self->_bundleIdentifier hasPrefix:@"com.apple.health."]) {
    return 1;
  }
  bundleIdentifier = self->_bundleIdentifier;

  return [(NSString *)bundleIdentifier isEqualToString:@"com.apple.private.health.localdevice"];
}

+ (BOOL)isAppleDeviceBundleIdentifier:(id)a3
{
  return [a3 hasPrefix:@"com.apple.health."];
}

- (BOOL)_hasFirstPartyBundleID
{
  bundleIdentifier = self->_bundleIdentifier;
  return bundleIdentifier
      && [(NSString *)bundleIdentifier rangeOfString:@"com.apple" options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)_setModificationDate:(id)a3
{
  self->_modificationDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)_owningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier;
}

- (void)_setOwningAppBundleIdentifier:(id)a3
{
}

- (id)asJSONObject
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v4 = [(HKSource *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  int v5 = [(HKSource *)self bundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];

  return v3;
}

+ (void)_uncachedDefaultSource
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "unable to create default source, cannot retrieve entitlements for the current task: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_uncachedDefaultSourceWithEntitlements:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "unable to create default source from entitlements", v1, 2u);
}

@end