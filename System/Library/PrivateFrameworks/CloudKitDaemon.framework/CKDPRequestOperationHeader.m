@interface CKDPRequestOperationHeader
+ (Class)activeThrottlingLabelType;
+ (Class)serviceIdentityKeyIDsType;
+ (Class)supplementalZoneInfosType;
- (BOOL)deviceSoftwareIsAppleInternal;
- (BOOL)entitlementsValidated;
- (BOOL)hasApplicationBundle;
- (BOOL)hasApplicationConfigVersion;
- (BOOL)hasApplicationContainer;
- (BOOL)hasApplicationContainerEnvironment;
- (BOOL)hasApplicationVersion;
- (BOOL)hasAssetAuthorizeGetRequestOptions;
- (BOOL)hasClientChangeToken;
- (BOOL)hasDeviceAssignedName;
- (BOOL)hasDeviceHardwareID;
- (BOOL)hasDeviceHardwareVersion;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasDeviceLibraryName;
- (BOOL)hasDeviceLibraryVersion;
- (BOOL)hasDeviceProtocolVersion;
- (BOOL)hasDeviceSerialNumber;
- (BOOL)hasDeviceSoftwareIsAppleInternal;
- (BOOL)hasDeviceSoftwareVersion;
- (BOOL)hasDeviceUDID;
- (BOOL)hasEntitlementsValidated;
- (BOOL)hasGlobalConfigVersion;
- (BOOL)hasIsolationLevel;
- (BOOL)hasLocale;
- (BOOL)hasMmcsProtocolVersion;
- (BOOL)hasOperationGroupName;
- (BOOL)hasOperationGroupQuantity;
- (BOOL)hasRequestOriginator;
- (BOOL)hasTargetDatabase;
- (BOOL)hasUserIDContainerID;
- (BOOL)hasUserToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)deviceIdentifier;
- (CKDPLocale)locale;
- (CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions;
- (NSData)clientChangeToken;
- (NSMutableArray)activeThrottlingLabels;
- (NSMutableArray)serviceIdentityKeyIDs;
- (NSMutableArray)supplementalZoneInfos;
- (NSString)applicationBundle;
- (NSString)applicationContainer;
- (NSString)applicationVersion;
- (NSString)deviceAssignedName;
- (NSString)deviceHardwareID;
- (NSString)deviceHardwareVersion;
- (NSString)deviceLibraryName;
- (NSString)deviceLibraryVersion;
- (NSString)deviceSerialNumber;
- (NSString)deviceSoftwareVersion;
- (NSString)deviceUDID;
- (NSString)mmcsProtocolVersion;
- (NSString)operationGroupName;
- (NSString)userIDContainerID;
- (NSString)userToken;
- (id)_applicationContainerEnvironmentCKLogValue;
- (id)_isolationLevelCKLogValue;
- (id)_targetDatabaseCKLogValue;
- (id)activeThrottlingLabelAtIndex:(unint64_t)a3;
- (id)applicationContainerEnvironmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)isolationLevelAsString:(int)a3;
- (id)requestOriginatorAsString:(int)a3;
- (id)serviceIdentityKeyIDsAtIndex:(unint64_t)a3;
- (id)supplementalZoneInfosAtIndex:(unint64_t)a3;
- (id)targetDatabaseAsString:(int)a3;
- (int)StringAsApplicationContainerEnvironment:(id)a3;
- (int)StringAsIsolationLevel:(id)a3;
- (int)StringAsRequestOriginator:(id)a3;
- (int)StringAsTargetDatabase:(id)a3;
- (int)applicationContainerEnvironment;
- (int)isolationLevel;
- (int)requestOriginator;
- (int)targetDatabase;
- (unint64_t)activeThrottlingLabelsCount;
- (unint64_t)applicationConfigVersion;
- (unint64_t)deviceProtocolVersion;
- (unint64_t)globalConfigVersion;
- (unint64_t)hash;
- (unint64_t)operationGroupQuantity;
- (unint64_t)serviceIdentityKeyIDsCount;
- (unint64_t)supplementalZoneInfosCount;
- (void)addActiveThrottlingLabel:(id)a3;
- (void)addServiceIdentityKeyIDs:(id)a3;
- (void)addSupplementalZoneInfos:(id)a3;
- (void)clearActiveThrottlingLabels;
- (void)clearServiceIdentityKeyIDs;
- (void)clearSupplementalZoneInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveThrottlingLabels:(id)a3;
- (void)setApplicationBundle:(id)a3;
- (void)setApplicationConfigVersion:(unint64_t)a3;
- (void)setApplicationContainer:(id)a3;
- (void)setApplicationContainerEnvironment:(int)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAssetAuthorizeGetRequestOptions:(id)a3;
- (void)setClientChangeToken:(id)a3;
- (void)setDeviceAssignedName:(id)a3;
- (void)setDeviceHardwareID:(id)a3;
- (void)setDeviceHardwareVersion:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceLibraryName:(id)a3;
- (void)setDeviceLibraryVersion:(id)a3;
- (void)setDeviceProtocolVersion:(unint64_t)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setDeviceSoftwareIsAppleInternal:(BOOL)a3;
- (void)setDeviceSoftwareVersion:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setEntitlementsValidated:(BOOL)a3;
- (void)setGlobalConfigVersion:(unint64_t)a3;
- (void)setHasApplicationConfigVersion:(BOOL)a3;
- (void)setHasApplicationContainerEnvironment:(BOOL)a3;
- (void)setHasDeviceProtocolVersion:(BOOL)a3;
- (void)setHasDeviceSoftwareIsAppleInternal:(BOOL)a3;
- (void)setHasEntitlementsValidated:(BOOL)a3;
- (void)setHasGlobalConfigVersion:(BOOL)a3;
- (void)setHasIsolationLevel:(BOOL)a3;
- (void)setHasOperationGroupQuantity:(BOOL)a3;
- (void)setHasRequestOriginator:(BOOL)a3;
- (void)setHasTargetDatabase:(BOOL)a3;
- (void)setIsolationLevel:(int)a3;
- (void)setLocale:(id)a3;
- (void)setMmcsProtocolVersion:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationGroupQuantity:(unint64_t)a3;
- (void)setRequestOriginator:(int)a3;
- (void)setServiceIdentityKeyIDs:(id)a3;
- (void)setSupplementalZoneInfos:(id)a3;
- (void)setTargetDatabase:(int)a3;
- (void)setUserIDContainerID:(id)a3;
- (void)setUserToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRequestOperationHeader

- (BOOL)hasUserToken
{
  return self->_userToken != 0;
}

- (BOOL)hasApplicationContainer
{
  return self->_applicationContainer != 0;
}

- (BOOL)hasApplicationBundle
{
  return self->_applicationBundle != 0;
}

- (BOOL)hasApplicationVersion
{
  return self->_applicationVersion != 0;
}

- (void)setApplicationConfigVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_applicationConfigVersion = a3;
}

- (void)setHasApplicationConfigVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApplicationConfigVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGlobalConfigVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_globalConfigVersion = a3;
}

- (void)setHasGlobalConfigVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlobalConfigVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasDeviceSoftwareVersion
{
  return self->_deviceSoftwareVersion != 0;
}

- (BOOL)hasDeviceHardwareVersion
{
  return self->_deviceHardwareVersion != 0;
}

- (BOOL)hasDeviceLibraryName
{
  return self->_deviceLibraryName != 0;
}

- (BOOL)hasDeviceLibraryVersion
{
  return self->_deviceLibraryVersion != 0;
}

- (void)setDeviceProtocolVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deviceProtocolVersion = a3;
}

- (void)setHasDeviceProtocolVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeviceProtocolVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasMmcsProtocolVersion
{
  return self->_mmcsProtocolVersion != 0;
}

- (int)applicationContainerEnvironment
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_applicationContainerEnvironment;
  }
  else {
    return 2;
  }
}

- (void)setApplicationContainerEnvironment:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_applicationContainerEnvironment = a3;
}

- (void)setHasApplicationContainerEnvironment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasApplicationContainerEnvironment
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)applicationContainerEnvironmentAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"production";
  }
  else if (a3 == 2)
  {
    v4 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsApplicationContainerEnvironment:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"production") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"sandbox")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
}

- (BOOL)hasDeviceAssignedName
{
  return self->_deviceAssignedName != 0;
}

- (BOOL)hasDeviceHardwareID
{
  return self->_deviceHardwareID != 0;
}

- (int)targetDatabase
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_targetDatabase;
  }
  else {
    return 1;
  }
}

- (void)setTargetDatabase:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_targetDatabase = a3;
}

- (void)setHasTargetDatabase:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTargetDatabase
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)targetDatabaseAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F4288[a3 - 1];
  }
  return v3;
}

- (int)StringAsTargetDatabase:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"privateDB"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"publicDB"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"sharedDB"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"orgDB"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasUserIDContainerID
{
  return self->_userIDContainerID != 0;
}

- (int)isolationLevel
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_isolationLevel;
  }
  else {
    return 1;
  }
}

- (void)setIsolationLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isolationLevel = a3;
}

- (void)setHasIsolationLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsolationLevel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)isolationLevelAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"zone";
  }
  else if (a3 == 2)
  {
    v4 = @"operation";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsIsolationLevel:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"zone") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"operation")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setOperationGroupQuantity:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_operationGroupQuantity = a3;
}

- (void)setHasOperationGroupQuantity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasOperationGroupQuantity
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearServiceIdentityKeyIDs
{
  objc_msgSend_removeAllObjects(self->_serviceIdentityKeyIDs, a2, v2);
}

- (void)addServiceIdentityKeyIDs:(id)a3
{
  v4 = (const char *)a3;
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  v8 = (char *)v4;
  if (!serviceIdentityKeyIDs)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_serviceIdentityKeyIDs;
    self->_serviceIdentityKeyIDs = v6;

    v4 = v8;
    serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  }
  objc_msgSend_addObject_(serviceIdentityKeyIDs, v4, (uint64_t)v4);
}

- (unint64_t)serviceIdentityKeyIDsCount
{
  return objc_msgSend_count(self->_serviceIdentityKeyIDs, a2, v2);
}

- (id)serviceIdentityKeyIDsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_serviceIdentityKeyIDs, a2, a3);
}

+ (Class)serviceIdentityKeyIDsType
{
  return (Class)objc_opt_class();
}

- (void)setDeviceSoftwareIsAppleInternal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_deviceSoftwareIsAppleInternal = a3;
}

- (void)setHasDeviceSoftwareIsAppleInternal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDeviceSoftwareIsAppleInternal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAssetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions != 0;
}

- (void)clearActiveThrottlingLabels
{
  objc_msgSend_removeAllObjects(self->_activeThrottlingLabels, a2, v2);
}

- (void)addActiveThrottlingLabel:(id)a3
{
  v4 = (const char *)a3;
  activeThrottlingLabels = self->_activeThrottlingLabels;
  v8 = (char *)v4;
  if (!activeThrottlingLabels)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_activeThrottlingLabels;
    self->_activeThrottlingLabels = v6;

    v4 = v8;
    activeThrottlingLabels = self->_activeThrottlingLabels;
  }
  objc_msgSend_addObject_(activeThrottlingLabels, v4, (uint64_t)v4);
}

- (unint64_t)activeThrottlingLabelsCount
{
  return objc_msgSend_count(self->_activeThrottlingLabels, a2, v2);
}

- (id)activeThrottlingLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_activeThrottlingLabels, a2, a3);
}

+ (Class)activeThrottlingLabelType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceUDID
{
  return self->_deviceUDID != 0;
}

- (BOOL)hasDeviceSerialNumber
{
  return self->_deviceSerialNumber != 0;
}

- (void)setEntitlementsValidated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_entitlementsValidated = a3;
}

- (void)setHasEntitlementsValidated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEntitlementsValidated
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)requestOriginator
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_requestOriginator;
  }
  else {
    return 1;
  }
}

- (void)setRequestOriginator:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_requestOriginator = a3;
}

- (void)setHasRequestOriginator:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRequestOriginator
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)requestOriginatorAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F42A8[a3 - 1];
  }
  return v3;
}

- (int)StringAsRequestOriginator:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unknown"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"cloudd"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"iCloudApp"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"syncEngine"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"adopter"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"ckctl"))
  {
    int v6 = 6;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)clearSupplementalZoneInfos
{
  objc_msgSend_removeAllObjects(self->_supplementalZoneInfos, a2, v2);
}

- (void)addSupplementalZoneInfos:(id)a3
{
  v4 = (const char *)a3;
  supplementalZoneInfos = self->_supplementalZoneInfos;
  v8 = (char *)v4;
  if (!supplementalZoneInfos)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_supplementalZoneInfos;
    self->_supplementalZoneInfos = v6;

    v4 = v8;
    supplementalZoneInfos = self->_supplementalZoneInfos;
  }
  objc_msgSend_addObject_(supplementalZoneInfos, v4, (uint64_t)v4);
}

- (unint64_t)supplementalZoneInfosCount
{
  return objc_msgSend_count(self->_supplementalZoneInfos, a2, v2);
}

- (id)supplementalZoneInfosAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_supplementalZoneInfos, a2, a3);
}

+ (Class)supplementalZoneInfosType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestOperationHeader;
  v4 = [(CKDPRequestOperationHeader *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  userToken = self->_userToken;
  if (userToken) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)userToken, @"userToken");
  }
  applicationContainer = self->_applicationContainer;
  if (applicationContainer) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationContainer, @"applicationContainer");
  }
  applicationBundle = self->_applicationBundle;
  if (applicationBundle) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundle, @"applicationBundle");
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationVersion, @"applicationVersion");
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v12 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, self->_applicationConfigVersion);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"applicationConfigVersion");

    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v14 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, self->_globalConfigVersion);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"globalConfigVersion");
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    v17 = objc_msgSend_dictionaryRepresentation(deviceIdentifier, v5, (uint64_t)applicationVersion);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"deviceIdentifier");
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceSoftwareVersion, @"deviceSoftwareVersion");
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceHardwareVersion, @"deviceHardwareVersion");
  }
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceLibraryName, @"deviceLibraryName");
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceLibraryVersion, @"deviceLibraryVersion");
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v23 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, self->_deviceProtocolVersion);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"deviceProtocolVersion");
  }
  locale = self->_locale;
  if (locale)
  {
    v26 = objc_msgSend_dictionaryRepresentation(locale, v5, (uint64_t)deviceLibraryVersion);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"locale");
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)mmcsProtocolVersion, @"mmcsProtocolVersion");
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    int applicationContainerEnvironment = self->_applicationContainerEnvironment;
    if (applicationContainerEnvironment == 1)
    {
      v30 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"applicationContainerEnvironment");
    }
    else if (applicationContainerEnvironment == 2)
    {
      v30 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"applicationContainerEnvironment");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_applicationContainerEnvironment);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, @"applicationContainerEnvironment");
    }
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientChangeToken, @"clientChangeToken");
  }
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceAssignedName, @"deviceAssignedName");
  }
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceHardwareID, @"deviceHardwareID");
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    unsigned int v35 = self->_targetDatabase - 1;
    if (v35 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_targetDatabase);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E64F4288[v35];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v36, @"targetDatabase");
  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)userIDContainerID, @"userIDContainerID");
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    int isolationLevel = self->_isolationLevel;
    if (isolationLevel == 1)
    {
      v39 = @"zone";
      objc_msgSend_setObject_forKey_(v6, v5, @"zone", @"isolationLevel");
    }
    else if (isolationLevel == 2)
    {
      v39 = @"operation";
      objc_msgSend_setObject_forKey_(v6, v5, @"operation", @"isolationLevel");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_isolationLevel);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, @"isolationLevel");
    }
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, @"operationGroupName");
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v42 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, self->_operationGroupQuantity);
    objc_msgSend_setObject_forKey_(v6, v43, (uint64_t)v42, @"operationGroupQuantity");
  }
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  if (serviceIdentityKeyIDs) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)serviceIdentityKeyIDs, @"serviceIdentityKeyIDs");
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v45 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_deviceSoftwareIsAppleInternal);
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, @"deviceSoftwareIsAppleInternal");
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    v48 = objc_msgSend_dictionaryRepresentation(assetAuthorizeGetRequestOptions, v5, (uint64_t)serviceIdentityKeyIDs);
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, @"assetAuthorizeGetRequestOptions");
  }
  activeThrottlingLabels = self->_activeThrottlingLabels;
  if (activeThrottlingLabels) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)activeThrottlingLabels, @"activeThrottlingLabel");
  }
  deviceUDID = self->_deviceUDID;
  if (deviceUDID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceUDID, @"deviceUDID");
  }
  deviceSerialNumber = self->_deviceSerialNumber;
  if (deviceSerialNumber) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceSerialNumber, @"deviceSerialNumber");
  }
  __int16 v53 = (__int16)self->_has;
  if ((v53 & 0x200) != 0)
  {
    v54 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_entitlementsValidated);
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v54, @"entitlementsValidated");

    __int16 v53 = (__int16)self->_has;
  }
  if ((v53 & 0x40) != 0)
  {
    unsigned int v56 = self->_requestOriginator - 1;
    if (v56 >= 6)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_requestOriginator);
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E64F42A8[v56];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v57, @"requestOriginator");
  }
  if (objc_msgSend_count(self->_supplementalZoneInfos, v5, (uint64_t)deviceSerialNumber))
  {
    id v58 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v61 = objc_msgSend_count(self->_supplementalZoneInfos, v59, v60);
    v63 = objc_msgSend_initWithCapacity_(v58, v62, v61);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v64 = self->_supplementalZoneInfos;
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v77, v81, 16);
    if (v66)
    {
      uint64_t v69 = v66;
      uint64_t v70 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v78 != v70) {
            objc_enumerationMutation(v64);
          }
          v72 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v77 + 1) + 8 * i), v67, v68);
          objc_msgSend_addObject_(v63, v73, (uint64_t)v72);
        }
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v77, v81, 16);
      }
      while (v69);
    }

    objc_msgSend_setObject_forKey_(v6, v74, (uint64_t)v63, @"supplementalZoneInfos");
  }
  id v75 = v6;

  return v75;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestOperationHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationContainer) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationBundle) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationVersion) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_deviceIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceSoftwareVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceHardwareVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceLibraryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceLibraryVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_locale) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mmcsProtocolVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_clientChangeToken) {
    PBDataWriterWriteDataField();
  }
  if (self->_deviceAssignedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceHardwareID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_userIDContainerID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_operationGroupName) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v6 = self->_serviceIdentityKeyIDs;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v36, v42, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v36, v42, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_assetAuthorizeGetRequestOptions) {
    PBDataWriterWriteSubmessage();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v13 = self->_activeThrottlingLabels;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v32, v41, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v19, (uint64_t)&v32, v41, 16);
    }
    while (v16);
  }

  if (self->_deviceUDID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceSerialNumber) {
    PBDataWriterWriteStringField();
  }
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = self->_supplementalZoneInfos;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v28, v40, 16);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v27, (uint64_t)&v28, v40, 16);
    }
    while (v24);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  userToken = self->_userToken;
  id v56 = v4;
  if (userToken)
  {
    objc_msgSend_setUserToken_(v4, v5, (uint64_t)userToken);
    id v4 = v56;
  }
  applicationContainer = self->_applicationContainer;
  if (applicationContainer)
  {
    objc_msgSend_setApplicationContainer_(v56, v5, (uint64_t)applicationContainer);
    id v4 = v56;
  }
  applicationBundle = self->_applicationBundle;
  if (applicationBundle)
  {
    objc_msgSend_setApplicationBundle_(v56, v5, (uint64_t)applicationBundle);
    id v4 = v56;
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
  {
    objc_msgSend_setApplicationVersion_(v56, v5, (uint64_t)applicationVersion);
    id v4 = v56;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_applicationConfigVersion;
    *((_WORD *)v4 + 126) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_globalConfigVersion;
    *((_WORD *)v4 + 126) |= 4u;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_setDeviceIdentifier_(v56, v5, (uint64_t)deviceIdentifier);
    id v4 = v56;
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion)
  {
    objc_msgSend_setDeviceSoftwareVersion_(v56, v5, (uint64_t)deviceSoftwareVersion);
    id v4 = v56;
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion)
  {
    objc_msgSend_setDeviceHardwareVersion_(v56, v5, (uint64_t)deviceHardwareVersion);
    id v4 = v56;
  }
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName)
  {
    objc_msgSend_setDeviceLibraryName_(v56, v5, (uint64_t)deviceLibraryName);
    id v4 = v56;
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion)
  {
    objc_msgSend_setDeviceLibraryVersion_(v56, v5, (uint64_t)deviceLibraryVersion);
    id v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_deviceProtocolVersion;
    *((_WORD *)v4 + 126) |= 2u;
  }
  locale = self->_locale;
  if (locale)
  {
    objc_msgSend_setLocale_(v56, v5, (uint64_t)locale);
    id v4 = v56;
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion)
  {
    objc_msgSend_setMmcsProtocolVersion_(v56, v5, (uint64_t)mmcsProtocolVersion);
    id v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_applicationContainerEnvironment;
    *((_WORD *)v4 + 126) |= 0x10u;
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
  {
    objc_msgSend_setClientChangeToken_(v56, v5, (uint64_t)clientChangeToken);
    id v4 = v56;
  }
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName)
  {
    objc_msgSend_setDeviceAssignedName_(v56, v5, (uint64_t)deviceAssignedName);
    id v4 = v56;
  }
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID)
  {
    objc_msgSend_setDeviceHardwareID_(v56, v5, (uint64_t)deviceHardwareID);
    id v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v4 + 56) = self->_targetDatabase;
    *((_WORD *)v4 + 126) |= 0x80u;
  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID)
  {
    objc_msgSend_setUserIDContainerID_(v56, v5, (uint64_t)userIDContainerID);
    id v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_isolationLevel;
    *((_WORD *)v4 + 126) |= 0x20u;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v56, v5, (uint64_t)operationGroupName);
    id v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_operationGroupQuantity;
    *((_WORD *)v4 + 126) |= 8u;
  }
  if (objc_msgSend_serviceIdentityKeyIDsCount(self, v5, (uint64_t)operationGroupName))
  {
    objc_msgSend_clearServiceIdentityKeyIDs(v56, v23, v24);
    uint64_t v27 = objc_msgSend_serviceIdentityKeyIDsCount(self, v25, v26);
    if (v27)
    {
      uint64_t v28 = v27;
      for (uint64_t i = 0; i != v28; ++i)
      {
        long long v30 = objc_msgSend_serviceIdentityKeyIDsAtIndex_(self, v23, i);
        objc_msgSend_addServiceIdentityKeyIDs_(v56, v31, (uint64_t)v30);
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((unsigned char *)v56 + 248) = self->_deviceSoftwareIsAppleInternal;
    *((_WORD *)v56 + 126) |= 0x100u;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions) {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(v56, v23, (uint64_t)assetAuthorizeGetRequestOptions);
  }
  if (objc_msgSend_activeThrottlingLabelsCount(self, v23, (uint64_t)assetAuthorizeGetRequestOptions))
  {
    objc_msgSend_clearActiveThrottlingLabels(v56, v33, v34);
    uint64_t active = objc_msgSend_activeThrottlingLabelsCount(self, v35, v36);
    if (active)
    {
      uint64_t v38 = active;
      for (uint64_t j = 0; j != v38; ++j)
      {
        v40 = objc_msgSend_activeThrottlingLabelAtIndex_(self, v33, j);
        objc_msgSend_addActiveThrottlingLabel_(v56, v41, (uint64_t)v40);
      }
    }
  }
  deviceUDID = self->_deviceUDID;
  if (deviceUDID) {
    objc_msgSend_setDeviceUDID_(v56, v33, (uint64_t)deviceUDID);
  }
  deviceSerialNumber = self->_deviceSerialNumber;
  v44 = v56;
  if (deviceSerialNumber)
  {
    objc_msgSend_setDeviceSerialNumber_(v56, v33, (uint64_t)deviceSerialNumber);
    v44 = v56;
  }
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x200) != 0)
  {
    v44[249] = self->_entitlementsValidated;
    *((_WORD *)v44 + 126) |= 0x200u;
    __int16 v45 = (__int16)self->_has;
  }
  if ((v45 & 0x40) != 0)
  {
    *((_DWORD *)v44 + 50) = self->_requestOriginator;
    *((_WORD *)v44 + 126) |= 0x40u;
  }
  if (objc_msgSend_supplementalZoneInfosCount(self, v33, (uint64_t)deviceSerialNumber))
  {
    objc_msgSend_clearSupplementalZoneInfos(v56, v46, v47);
    uint64_t v50 = objc_msgSend_supplementalZoneInfosCount(self, v48, v49);
    if (v50)
    {
      uint64_t v52 = v50;
      for (uint64_t k = 0; k != v52; ++k)
      {
        v54 = objc_msgSend_supplementalZoneInfosAtIndex_(self, v51, k);
        objc_msgSend_addSupplementalZoneInfos_(v56, v55, (uint64_t)v54);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_userToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 240);
  *(void *)(v10 + 240) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_applicationContainer, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_applicationBundle, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_applicationVersion, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v21;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_applicationConfigVersion;
    *(_WORD *)(v10 + 252) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v10 + 24) = self->_globalConfigVersion;
    *(_WORD *)(v10 + 252) |= 4u;
  }
  uint64_t v25 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v23, (uint64_t)a3);
  uint64_t v26 = *(void **)(v10 + 120);
  *(void *)(v10 + 120) = v25;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_deviceSoftwareVersion, v27, (uint64_t)a3);
  long long v29 = *(void **)(v10 + 152);
  *(void *)(v10 + 152) = v28;

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_deviceHardwareVersion, v30, (uint64_t)a3);
  long long v32 = *(void **)(v10 + 112);
  *(void *)(v10 + 112) = v31;

  uint64_t v34 = objc_msgSend_copyWithZone_(self->_deviceLibraryName, v33, (uint64_t)a3);
  long long v35 = *(void **)(v10 + 128);
  *(void *)(v10 + 128) = v34;

  uint64_t v37 = objc_msgSend_copyWithZone_(self->_deviceLibraryVersion, v36, (uint64_t)a3);
  uint64_t v38 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v37;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_deviceProtocolVersion;
    *(_WORD *)(v10 + 252) |= 2u;
  }
  uint64_t v40 = objc_msgSend_copyWithZone_(self->_locale, v39, (uint64_t)a3);
  v41 = *(void **)(v10 + 176);
  *(void *)(v10 + 176) = v40;

  uint64_t v43 = objc_msgSend_copyWithZone_(self->_mmcsProtocolVersion, v42, (uint64_t)a3);
  v44 = *(void **)(v10 + 184);
  *(void *)(v10 + 184) = v43;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v10 + 64) = self->_applicationContainerEnvironment;
    *(_WORD *)(v10 + 252) |= 0x10u;
  }
  uint64_t v46 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v45, (uint64_t)a3);
  uint64_t v47 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v46;

  uint64_t v49 = objc_msgSend_copyWithZone_(self->_deviceAssignedName, v48, (uint64_t)a3);
  uint64_t v50 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v49;

  uint64_t v52 = objc_msgSend_copyWithZone_(self->_deviceHardwareID, v51, (uint64_t)a3);
  __int16 v53 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v52;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v10 + 224) = self->_targetDatabase;
    *(_WORD *)(v10 + 252) |= 0x80u;
  }
  uint64_t v55 = objc_msgSend_copyWithZone_(self->_userIDContainerID, v54, (uint64_t)a3);
  id v56 = *(void **)(v10 + 232);
  *(void *)(v10 + 232) = v55;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v10 + 168) = self->_isolationLevel;
    *(_WORD *)(v10 + 252) |= 0x20u;
  }
  uint64_t v58 = objc_msgSend_copyWithZone_(self->_operationGroupName, v57, (uint64_t)a3);
  v59 = *(void **)(v10 + 192);
  *(void *)(v10 + 192) = v58;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(void *)(v10 + 32) = self->_operationGroupQuantity;
    *(_WORD *)(v10 + 252) |= 8u;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v60 = self->_serviceIdentityKeyIDs;
  uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v106, v112, 16);
  if (v62)
  {
    uint64_t v64 = v62;
    uint64_t v65 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v107 != v65) {
          objc_enumerationMutation(v60);
        }
        v67 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v106 + 1) + 8 * i), v63, (uint64_t)a3);
        objc_msgSend_addServiceIdentityKeyIDs_((void *)v10, v68, (uint64_t)v67);
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v106, v112, 16);
    }
    while (v64);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(unsigned char *)(v10 + 248) = self->_deviceSoftwareIsAppleInternal;
    *(_WORD *)(v10 + 252) |= 0x100u;
  }
  uint64_t v70 = objc_msgSend_copyWithZone_(self->_assetAuthorizeGetRequestOptions, v69, (uint64_t)a3);
  v71 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v70;

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v72 = self->_activeThrottlingLabels;
  uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v102, v111, 16);
  if (v74)
  {
    uint64_t v76 = v74;
    uint64_t v77 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v76; ++j)
      {
        if (*(void *)v103 != v77) {
          objc_enumerationMutation(v72);
        }
        long long v79 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v102 + 1) + 8 * j), v75, (uint64_t)a3);
        objc_msgSend_addActiveThrottlingLabel_((void *)v10, v80, (uint64_t)v79);
      }
      uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v102, v111, 16);
    }
    while (v76);
  }

  uint64_t v82 = objc_msgSend_copyWithZone_(self->_deviceUDID, v81, (uint64_t)a3);
  v83 = *(void **)(v10 + 160);
  *(void *)(v10 + 160) = v82;

  uint64_t v85 = objc_msgSend_copyWithZone_(self->_deviceSerialNumber, v84, (uint64_t)a3);
  v86 = *(void **)(v10 + 144);
  *(void *)(v10 + 144) = v85;

  __int16 v87 = (__int16)self->_has;
  if ((v87 & 0x200) != 0)
  {
    *(unsigned char *)(v10 + 249) = self->_entitlementsValidated;
    *(_WORD *)(v10 + 252) |= 0x200u;
    __int16 v87 = (__int16)self->_has;
  }
  if ((v87 & 0x40) != 0)
  {
    *(_DWORD *)(v10 + 200) = self->_requestOriginator;
    *(_WORD *)(v10 + 252) |= 0x40u;
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v88 = self->_supplementalZoneInfos;
  uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v98, v110, 16);
  if (v90)
  {
    uint64_t v92 = v90;
    uint64_t v93 = *(void *)v99;
    do
    {
      for (uint64_t k = 0; k != v92; ++k)
      {
        if (*(void *)v99 != v93) {
          objc_enumerationMutation(v88);
        }
        v95 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v98 + 1) + 8 * k), v91, (uint64_t)a3, (void)v98);
        objc_msgSend_addSupplementalZoneInfos_((void *)v10, v96, (uint64_t)v95);
      }
      uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v98, v110, 16);
    }
    while (v92);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_105;
  }
  userToken = self->_userToken;
  uint64_t v9 = v4[30];
  if ((unint64_t)userToken | v9)
  {
    if (!objc_msgSend_isEqual_(userToken, v7, v9)) {
      goto LABEL_105;
    }
  }
  applicationContainer = self->_applicationContainer;
  uint64_t v11 = v4[7];
  if ((unint64_t)applicationContainer | v11)
  {
    if (!objc_msgSend_isEqual_(applicationContainer, v7, v11)) {
      goto LABEL_105;
    }
  }
  applicationBundle = self->_applicationBundle;
  uint64_t v13 = v4[6];
  if ((unint64_t)applicationBundle | v13)
  {
    if (!objc_msgSend_isEqual_(applicationBundle, v7, v13)) {
      goto LABEL_105;
    }
  }
  applicationVersion = self->_applicationVersion;
  uint64_t v15 = v4[9];
  if ((unint64_t)applicationVersion | v15)
  {
    if (!objc_msgSend_isEqual_(applicationVersion, v7, v15)) {
      goto LABEL_105;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v17 = *((_WORD *)v4 + 126);
  if (has)
  {
    if ((v17 & 1) == 0 || self->_applicationConfigVersion != v4[1]) {
      goto LABEL_105;
    }
  }
  else if (v17)
  {
    goto LABEL_105;
  }
  if ((has & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_globalConfigVersion != v4[3]) {
      goto LABEL_105;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_105;
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v19 = v4[15];
  if ((unint64_t)deviceIdentifier | v19 && !objc_msgSend_isEqual_(deviceIdentifier, v7, v19)) {
    goto LABEL_105;
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  uint64_t v21 = v4[19];
  if ((unint64_t)deviceSoftwareVersion | v21)
  {
    if (!objc_msgSend_isEqual_(deviceSoftwareVersion, v7, v21)) {
      goto LABEL_105;
    }
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  uint64_t v23 = v4[14];
  if ((unint64_t)deviceHardwareVersion | v23)
  {
    if (!objc_msgSend_isEqual_(deviceHardwareVersion, v7, v23)) {
      goto LABEL_105;
    }
  }
  deviceLibraryName = self->_deviceLibraryName;
  uint64_t v25 = v4[16];
  if ((unint64_t)deviceLibraryName | v25)
  {
    if (!objc_msgSend_isEqual_(deviceLibraryName, v7, v25)) {
      goto LABEL_105;
    }
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  uint64_t v27 = v4[17];
  if ((unint64_t)deviceLibraryVersion | v27)
  {
    if (!objc_msgSend_isEqual_(deviceLibraryVersion, v7, v27)) {
      goto LABEL_105;
    }
  }
  __int16 v28 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v28 & 2) == 0 || self->_deviceProtocolVersion != v4[2]) {
      goto LABEL_105;
    }
  }
  else if ((v28 & 2) != 0)
  {
    goto LABEL_105;
  }
  locale = self->_locale;
  uint64_t v30 = v4[22];
  if ((unint64_t)locale | v30 && !objc_msgSend_isEqual_(locale, v7, v30)) {
    goto LABEL_105;
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  uint64_t v32 = v4[23];
  if ((unint64_t)mmcsProtocolVersion | v32)
  {
    if (!objc_msgSend_isEqual_(mmcsProtocolVersion, v7, v32)) {
      goto LABEL_105;
    }
  }
  __int16 v33 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v33 & 0x10) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 16)) {
      goto LABEL_105;
    }
  }
  else if ((v33 & 0x10) != 0)
  {
    goto LABEL_105;
  }
  clientChangeToken = self->_clientChangeToken;
  uint64_t v35 = v4[11];
  if ((unint64_t)clientChangeToken | v35 && !objc_msgSend_isEqual_(clientChangeToken, v7, v35)) {
    goto LABEL_105;
  }
  deviceAssignedName = self->_deviceAssignedName;
  uint64_t v37 = v4[12];
  if ((unint64_t)deviceAssignedName | v37)
  {
    if (!objc_msgSend_isEqual_(deviceAssignedName, v7, v37)) {
      goto LABEL_105;
    }
  }
  deviceHardwareID = self->_deviceHardwareID;
  uint64_t v39 = v4[13];
  if ((unint64_t)deviceHardwareID | v39)
  {
    if (!objc_msgSend_isEqual_(deviceHardwareID, v7, v39)) {
      goto LABEL_105;
    }
  }
  __int16 v40 = (__int16)self->_has;
  __int16 v41 = *((_WORD *)v4 + 126);
  if ((v40 & 0x80) != 0)
  {
    if ((v41 & 0x80) == 0 || self->_targetDatabase != *((_DWORD *)v4 + 56)) {
      goto LABEL_105;
    }
  }
  else if ((v41 & 0x80) != 0)
  {
    goto LABEL_105;
  }
  userIDContainerID = self->_userIDContainerID;
  uint64_t v43 = v4[29];
  if ((unint64_t)userIDContainerID | v43)
  {
    if (!objc_msgSend_isEqual_(userIDContainerID, v7, v43)) {
      goto LABEL_105;
    }
    __int16 v40 = (__int16)self->_has;
    __int16 v41 = *((_WORD *)v4 + 126);
  }
  if ((v40 & 0x20) != 0)
  {
    if ((v41 & 0x20) == 0 || self->_isolationLevel != *((_DWORD *)v4 + 42)) {
      goto LABEL_105;
    }
  }
  else if ((v41 & 0x20) != 0)
  {
    goto LABEL_105;
  }
  operationGroupName = self->_operationGroupName;
  uint64_t v45 = v4[24];
  if ((unint64_t)operationGroupName | v45)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v45)) {
      goto LABEL_105;
    }
    __int16 v40 = (__int16)self->_has;
    __int16 v41 = *((_WORD *)v4 + 126);
  }
  if ((v40 & 8) != 0)
  {
    if ((v41 & 8) == 0 || self->_operationGroupQuantity != v4[4]) {
      goto LABEL_105;
    }
  }
  else if ((v41 & 8) != 0)
  {
    goto LABEL_105;
  }
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  uint64_t v47 = v4[26];
  if ((unint64_t)serviceIdentityKeyIDs | v47)
  {
    if (!objc_msgSend_isEqual_(serviceIdentityKeyIDs, v7, v47)) {
      goto LABEL_105;
    }
    __int16 v40 = (__int16)self->_has;
    __int16 v41 = *((_WORD *)v4 + 126);
  }
  if ((v40 & 0x100) != 0)
  {
    if ((v41 & 0x100) == 0) {
      goto LABEL_105;
    }
    if (self->_deviceSoftwareIsAppleInternal)
    {
      if (!*((unsigned char *)v4 + 248)) {
        goto LABEL_105;
      }
    }
    else if (*((unsigned char *)v4 + 248))
    {
      goto LABEL_105;
    }
  }
  else if ((v41 & 0x100) != 0)
  {
    goto LABEL_105;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  uint64_t v49 = v4[10];
  if ((unint64_t)assetAuthorizeGetRequestOptions | v49
    && !objc_msgSend_isEqual_(assetAuthorizeGetRequestOptions, v7, v49))
  {
    goto LABEL_105;
  }
  activeThrottlingLabels = self->_activeThrottlingLabels;
  uint64_t v51 = v4[5];
  if ((unint64_t)activeThrottlingLabels | v51)
  {
    if (!objc_msgSend_isEqual_(activeThrottlingLabels, v7, v51)) {
      goto LABEL_105;
    }
  }
  deviceUDID = self->_deviceUDID;
  uint64_t v53 = v4[20];
  if ((unint64_t)deviceUDID | v53)
  {
    if (!objc_msgSend_isEqual_(deviceUDID, v7, v53)) {
      goto LABEL_105;
    }
  }
  deviceSerialNumber = self->_deviceSerialNumber;
  uint64_t v55 = v4[18];
  if ((unint64_t)deviceSerialNumber | v55)
  {
    if (!objc_msgSend_isEqual_(deviceSerialNumber, v7, v55)) {
      goto LABEL_105;
    }
  }
  __int16 v56 = (__int16)self->_has;
  __int16 v57 = *((_WORD *)v4 + 126);
  if ((v56 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x200) != 0)
    {
      if (self->_entitlementsValidated)
      {
        if (!*((unsigned char *)v4 + 249)) {
          goto LABEL_105;
        }
        goto LABEL_98;
      }
      if (!*((unsigned char *)v4 + 249)) {
        goto LABEL_98;
      }
    }
LABEL_105:
    char isEqual = 0;
    goto LABEL_106;
  }
  if ((*((_WORD *)v4 + 126) & 0x200) != 0) {
    goto LABEL_105;
  }
LABEL_98:
  if ((v56 & 0x40) != 0)
  {
    if ((v57 & 0x40) == 0 || self->_requestOriginator != *((_DWORD *)v4 + 50)) {
      goto LABEL_105;
    }
  }
  else if ((v57 & 0x40) != 0)
  {
    goto LABEL_105;
  }
  supplementalZoneInfos = self->_supplementalZoneInfos;
  uint64_t v59 = v4[27];
  if ((unint64_t)supplementalZoneInfos | v59) {
    char isEqual = objc_msgSend_isEqual_(supplementalZoneInfos, v7, v59);
  }
  else {
    char isEqual = 1;
  }
LABEL_106:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v80 = objc_msgSend_hash(self->_userToken, a2, v2);
  uint64_t v79 = objc_msgSend_hash(self->_applicationContainer, v4, v5);
  uint64_t v78 = objc_msgSend_hash(self->_applicationBundle, v6, v7);
  uint64_t v77 = objc_msgSend_hash(self->_applicationVersion, v8, v9);
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v76 = 2654435761u * self->_applicationConfigVersion;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v76 = 0;
    if ((has & 4) != 0)
    {
LABEL_3:
      unint64_t v75 = 2654435761u * self->_globalConfigVersion;
      goto LABEL_6;
    }
  }
  unint64_t v75 = 0;
LABEL_6:
  uint64_t v74 = objc_msgSend_hash(self->_deviceIdentifier, v10, v11);
  uint64_t v73 = objc_msgSend_hash(self->_deviceSoftwareVersion, v13, v14);
  uint64_t v72 = objc_msgSend_hash(self->_deviceHardwareVersion, v15, v16);
  uint64_t v71 = objc_msgSend_hash(self->_deviceLibraryName, v17, v18);
  uint64_t v70 = objc_msgSend_hash(self->_deviceLibraryVersion, v19, v20);
  if ((*(_WORD *)&self->_has & 2) != 0) {
    unint64_t v69 = 2654435761u * self->_deviceProtocolVersion;
  }
  else {
    unint64_t v69 = 0;
  }
  uint64_t v68 = objc_msgSend_hash(self->_locale, v21, v22);
  uint64_t v67 = objc_msgSend_hash(self->_mmcsProtocolVersion, v23, v24);
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v66 = 2654435761 * self->_applicationContainerEnvironment;
  }
  else {
    uint64_t v66 = 0;
  }
  uint64_t v65 = objc_msgSend_hash(self->_clientChangeToken, v25, v26);
  uint64_t v64 = objc_msgSend_hash(self->_deviceAssignedName, v27, v28);
  uint64_t v63 = objc_msgSend_hash(self->_deviceHardwareID, v29, v30);
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v62 = 2654435761 * self->_targetDatabase;
  }
  else {
    uint64_t v62 = 0;
  }
  uint64_t v61 = objc_msgSend_hash(self->_userIDContainerID, v31, v32);
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v35 = objc_msgSend_hash(self->_operationGroupName, v33, v34, 2654435761 * self->_isolationLevel);
  }
  else {
    uint64_t v35 = objc_msgSend_hash(self->_operationGroupName, v33, v34, 0);
  }
  uint64_t v38 = v35;
  if ((*(_WORD *)&self->_has & 8) != 0) {
    unint64_t v39 = 2654435761u * self->_operationGroupQuantity;
  }
  else {
    unint64_t v39 = 0;
  }
  uint64_t v42 = objc_msgSend_hash(self->_serviceIdentityKeyIDs, v36, v37);
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v43 = 2654435761 * self->_deviceSoftwareIsAppleInternal;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v44 = objc_msgSend_hash(self->_assetAuthorizeGetRequestOptions, v40, v41);
  uint64_t v47 = objc_msgSend_hash(self->_activeThrottlingLabels, v45, v46);
  uint64_t v50 = objc_msgSend_hash(self->_deviceUDID, v48, v49);
  uint64_t v53 = objc_msgSend_hash(self->_deviceSerialNumber, v51, v52);
  __int16 v56 = (__int16)self->_has;
  if ((v56 & 0x200) != 0)
  {
    uint64_t v57 = 2654435761 * self->_entitlementsValidated;
    if ((v56 & 0x40) != 0) {
      goto LABEL_26;
    }
LABEL_28:
    uint64_t v58 = 0;
    return v79 ^ v80 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v38 ^ v39 ^ v42 ^ v43 ^ v44 ^ v47 ^ v50 ^ v53 ^ v57 ^ v58 ^ objc_msgSend_hash(self->_supplementalZoneInfos, v54, v55);
  }
  uint64_t v57 = 0;
  if ((v56 & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v58 = 2654435761 * self->_requestOriginator;
  return v79 ^ v80 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v38 ^ v39 ^ v42 ^ v43 ^ v44 ^ v47 ^ v50 ^ v53 ^ v57 ^ v58 ^ objc_msgSend_hash(self->_supplementalZoneInfos, v54, v55);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 30);
  if (v6) {
    objc_msgSend_setUserToken_(self, v4, v6);
  }
  uint64_t v7 = *((void *)v5 + 7);
  if (v7) {
    objc_msgSend_setApplicationContainer_(self, v4, v7);
  }
  uint64_t v8 = *((void *)v5 + 6);
  if (v8) {
    objc_msgSend_setApplicationBundle_(self, v4, v8);
  }
  uint64_t v9 = *((void *)v5 + 9);
  if (v9) {
    objc_msgSend_setApplicationVersion_(self, v4, v9);
  }
  __int16 v10 = *((_WORD *)v5 + 126);
  if (v10)
  {
    self->_applicationConfigVersion = *((void *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v10 = *((_WORD *)v5 + 126);
  }
  if ((v10 & 4) != 0)
  {
    self->_globalConfigVersion = *((void *)v5 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v12 = *((void *)v5 + 15);
  if (deviceIdentifier)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(deviceIdentifier, v4, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setDeviceIdentifier_(self, v4, v12);
  }
  uint64_t v13 = *((void *)v5 + 19);
  if (v13) {
    objc_msgSend_setDeviceSoftwareVersion_(self, v4, v13);
  }
  uint64_t v14 = *((void *)v5 + 14);
  if (v14) {
    objc_msgSend_setDeviceHardwareVersion_(self, v4, v14);
  }
  uint64_t v15 = *((void *)v5 + 16);
  if (v15) {
    objc_msgSend_setDeviceLibraryName_(self, v4, v15);
  }
  uint64_t v16 = *((void *)v5 + 17);
  if (v16) {
    objc_msgSend_setDeviceLibraryVersion_(self, v4, v16);
  }
  if ((*((_WORD *)v5 + 126) & 2) != 0)
  {
    self->_deviceProtocolVersion = *((void *)v5 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  locale = self->_locale;
  uint64_t v18 = *((void *)v5 + 22);
  if (locale)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(locale, v4, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setLocale_(self, v4, v18);
  }
  uint64_t v19 = *((void *)v5 + 23);
  if (v19) {
    objc_msgSend_setMmcsProtocolVersion_(self, v4, v19);
  }
  if ((*((_WORD *)v5 + 126) & 0x10) != 0)
  {
    self->_int applicationContainerEnvironment = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 0x10u;
  }
  uint64_t v20 = *((void *)v5 + 11);
  if (v20) {
    objc_msgSend_setClientChangeToken_(self, v4, v20);
  }
  uint64_t v21 = *((void *)v5 + 12);
  if (v21) {
    objc_msgSend_setDeviceAssignedName_(self, v4, v21);
  }
  uint64_t v22 = *((void *)v5 + 13);
  if (v22) {
    objc_msgSend_setDeviceHardwareID_(self, v4, v22);
  }
  if ((*((_WORD *)v5 + 126) & 0x80) != 0)
  {
    self->_targetDatabase = *((_DWORD *)v5 + 56);
    *(_WORD *)&self->_has |= 0x80u;
  }
  uint64_t v23 = *((void *)v5 + 29);
  if (v23) {
    objc_msgSend_setUserIDContainerID_(self, v4, v23);
  }
  if ((*((_WORD *)v5 + 126) & 0x20) != 0)
  {
    self->_int isolationLevel = *((_DWORD *)v5 + 42);
    *(_WORD *)&self->_has |= 0x20u;
  }
  uint64_t v24 = *((void *)v5 + 24);
  if (v24) {
    objc_msgSend_setOperationGroupName_(self, v4, v24);
  }
  if ((*((_WORD *)v5 + 126) & 8) != 0)
  {
    self->_operationGroupQuantity = *((void *)v5 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v25 = *((id *)v5 + 26);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v61, v67, 16);
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v62 != v30) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend_addServiceIdentityKeyIDs_(self, v28, *(void *)(*((void *)&v61 + 1) + 8 * i));
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v61, v67, 16);
    }
    while (v29);
  }

  if ((*((_WORD *)v5 + 126) & 0x100) != 0)
  {
    self->_deviceSoftwareIsAppleInternal = *((unsigned char *)v5 + 248);
    *(_WORD *)&self->_has |= 0x100u;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  uint64_t v34 = *((void *)v5 + 10);
  if (assetAuthorizeGetRequestOptions)
  {
    if (v34) {
      objc_msgSend_mergeFrom_(assetAuthorizeGetRequestOptions, v32, v34);
    }
  }
  else if (v34)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(self, v32, v34);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v35 = *((id *)v5 + 5);
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v57, v66, 16);
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v35);
        }
        objc_msgSend_addActiveThrottlingLabel_(self, v38, *(void *)(*((void *)&v57 + 1) + 8 * j));
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v57, v66, 16);
    }
    while (v39);
  }

  uint64_t v43 = *((void *)v5 + 20);
  if (v43) {
    objc_msgSend_setDeviceUDID_(self, v42, v43);
  }
  uint64_t v44 = *((void *)v5 + 18);
  if (v44) {
    objc_msgSend_setDeviceSerialNumber_(self, v42, v44);
  }
  __int16 v45 = *((_WORD *)v5 + 126);
  if ((v45 & 0x200) != 0)
  {
    self->_entitlementsValidated = *((unsigned char *)v5 + 249);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v45 = *((_WORD *)v5 + 126);
  }
  if ((v45 & 0x40) != 0)
  {
    self->_requestOriginator = *((_DWORD *)v5 + 50);
    *(_WORD *)&self->_has |= 0x40u;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v46 = *((id *)v5 + 27);
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v53, v65, 16);
  if (v48)
  {
    uint64_t v50 = v48;
    uint64_t v51 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v54 != v51) {
          objc_enumerationMutation(v46);
        }
        objc_msgSend_addSupplementalZoneInfos_(self, v49, *(void *)(*((void *)&v53 + 1) + 8 * k), (void)v53);
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v53, v65, 16);
    }
    while (v50);
  }
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
}

- (NSString)applicationContainer
{
  return self->_applicationContainer;
}

- (void)setApplicationContainer:(id)a3
{
}

- (NSString)applicationBundle
{
  return self->_applicationBundle;
}

- (void)setApplicationBundle:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
}

- (unint64_t)applicationConfigVersion
{
  return self->_applicationConfigVersion;
}

- (unint64_t)globalConfigVersion
{
  return self->_globalConfigVersion;
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceSoftwareVersion
{
  return self->_deviceSoftwareVersion;
}

- (void)setDeviceSoftwareVersion:(id)a3
{
}

- (NSString)deviceHardwareVersion
{
  return self->_deviceHardwareVersion;
}

- (void)setDeviceHardwareVersion:(id)a3
{
}

- (NSString)deviceLibraryName
{
  return self->_deviceLibraryName;
}

- (void)setDeviceLibraryName:(id)a3
{
}

- (NSString)deviceLibraryVersion
{
  return self->_deviceLibraryVersion;
}

- (void)setDeviceLibraryVersion:(id)a3
{
}

- (unint64_t)deviceProtocolVersion
{
  return self->_deviceProtocolVersion;
}

- (CKDPLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)mmcsProtocolVersion
{
  return self->_mmcsProtocolVersion;
}

- (void)setMmcsProtocolVersion:(id)a3
{
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (void)setClientChangeToken:(id)a3
{
}

- (NSString)deviceAssignedName
{
  return self->_deviceAssignedName;
}

- (void)setDeviceAssignedName:(id)a3
{
}

- (NSString)deviceHardwareID
{
  return self->_deviceHardwareID;
}

- (void)setDeviceHardwareID:(id)a3
{
}

- (NSString)userIDContainerID
{
  return self->_userIDContainerID;
}

- (void)setUserIDContainerID:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
}

- (unint64_t)operationGroupQuantity
{
  return self->_operationGroupQuantity;
}

- (NSMutableArray)serviceIdentityKeyIDs
{
  return self->_serviceIdentityKeyIDs;
}

- (void)setServiceIdentityKeyIDs:(id)a3
{
}

- (BOOL)deviceSoftwareIsAppleInternal
{
  return self->_deviceSoftwareIsAppleInternal;
}

- (CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions;
}

- (void)setAssetAuthorizeGetRequestOptions:(id)a3
{
}

- (NSMutableArray)activeThrottlingLabels
{
  return self->_activeThrottlingLabels;
}

- (void)setActiveThrottlingLabels:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (BOOL)entitlementsValidated
{
  return self->_entitlementsValidated;
}

- (NSMutableArray)supplementalZoneInfos
{
  return self->_supplementalZoneInfos;
}

- (void)setSupplementalZoneInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_userIDContainerID, 0);
  objc_storeStrong((id *)&self->_supplementalZoneInfos, 0);
  objc_storeStrong((id *)&self->_serviceIdentityKeyIDs, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_mmcsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceLibraryVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_deviceAssignedName, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
  objc_storeStrong((id *)&self->_activeThrottlingLabels, 0);
}

- (id)_applicationContainerEnvironmentCKLogValue
{
  uint64_t v3 = objc_msgSend_applicationContainerEnvironment(self, a2, v2);
  if (v3 == 1)
  {
    id v5 = @"production";
  }
  else if (v3 == 2)
  {
    id v5 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_isolationLevelCKLogValue
{
  uint64_t v3 = objc_msgSend_isolationLevel(self, a2, v2);
  if (v3 == 1)
  {
    id v5 = @"zone";
  }
  else if (v3 == 2)
  {
    id v5 = @"operation";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_targetDatabaseCKLogValue
{
  uint64_t v3 = objc_msgSend_targetDatabase(self, a2, v2);
  if ((v3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E64F4EA0[(int)v3 - 1];
  }
  return v5;
}

@end