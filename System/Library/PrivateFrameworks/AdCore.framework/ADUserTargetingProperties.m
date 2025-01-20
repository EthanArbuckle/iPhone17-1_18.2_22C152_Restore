@interface ADUserTargetingProperties
+ (Class)targetingType;
+ (Class)userKeyboardType;
- (BOOL)hasAdministrativeArea;
- (BOOL)hasAdvertisingIdentifierMonthResetCount;
- (BOOL)hasAlgoId;
- (BOOL)hasAppID;
- (BOOL)hasAppVersion;
- (BOOL)hasAppsRank;
- (BOOL)hasCarrierMCC;
- (BOOL)hasCarrierMNC;
- (BOOL)hasClientClockTime;
- (BOOL)hasConnectionType;
- (BOOL)hasCurrentCarrierMCC;
- (BOOL)hasCurrentCarrierMNC;
- (BOOL)hasDPIDString;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceRequestID;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasIAdIDString;
- (BOOL)hasITunesStore;
- (BOOL)hasIsOnInternationalDataRoaming;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasLatitude;
- (BOOL)hasLimitAdTracking;
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasLocality;
- (BOOL)hasLongitude;
- (BOOL)hasOsVersionAndBuild;
- (BOOL)hasOverrideType;
- (BOOL)hasPostalCode;
- (BOOL)hasRunState;
- (BOOL)hasStoreFrontLanguageLocaleIdentifier;
- (BOOL)hasSubAdministrativeArea;
- (BOOL)hasTimezone;
- (BOOL)hasToroIDString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnInternationalDataRoaming;
- (BOOL)limitAdTracking;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)targetings;
- (NSMutableArray)userKeyboards;
- (NSString)administrativeArea;
- (NSString)algoId;
- (NSString)appID;
- (NSString)appVersion;
- (NSString)carrierMCC;
- (NSString)carrierMNC;
- (NSString)currentCarrierMCC;
- (NSString)currentCarrierMNC;
- (NSString)dPIDString;
- (NSString)deviceModel;
- (NSString)deviceRequestID;
- (NSString)iAdIDString;
- (NSString)iTunesStore;
- (NSString)isoCountryCode;
- (NSString)localeIdentifier;
- (NSString)locality;
- (NSString)osVersionAndBuild;
- (NSString)postalCode;
- (NSString)storeFrontLanguageLocaleIdentifier;
- (NSString)subAdministrativeArea;
- (NSString)toroIDString;
- (double)clientClockTime;
- (float)horizontalAccuracy;
- (float)latitude;
- (float)longitude;
- (float)timezone;
- (id)accountStatesAsString:(int)a3;
- (id)accountTypesAsString:(int)a3;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceModesAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)overrideTypeAsString:(int)a3;
- (id)runStateAsString:(int)a3;
- (id)targetingAtIndex:(unint64_t)a3;
- (id)userKeyboardAtIndex:(unint64_t)a3;
- (int)StringAsAccountStates:(id)a3;
- (int)StringAsAccountTypes:(id)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsDeviceModes:(id)a3;
- (int)StringAsOverrideType:(id)a3;
- (int)StringAsRunState:(id)a3;
- (int)accountStateAtIndex:(unint64_t)a3;
- (int)accountStates;
- (int)accountTypeAtIndex:(unint64_t)a3;
- (int)accountTypes;
- (int)advertisingIdentifierMonthResetCount;
- (int)appsRank;
- (int)connectionType;
- (int)deviceModeAtIndex:(unint64_t)a3;
- (int)deviceModes;
- (int)overrideType;
- (int)runState;
- (unint64_t)accountStatesCount;
- (unint64_t)accountTypesCount;
- (unint64_t)deviceModesCount;
- (unint64_t)hash;
- (unint64_t)targetingsCount;
- (unint64_t)userKeyboardsCount;
- (void)addAccountState:(int)a3;
- (void)addAccountType:(int)a3;
- (void)addDeviceMode:(int)a3;
- (void)addTargeting:(id)a3;
- (void)addUserKeyboard:(id)a3;
- (void)clearAccountStates;
- (void)clearAccountTypes;
- (void)clearDeviceModes;
- (void)clearTargetings;
- (void)clearUserKeyboards;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccountStates:(int *)a3 count:(unint64_t)a4;
- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdvertisingIdentifierMonthResetCount:(int)a3;
- (void)setAlgoId:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setAppsRank:(int)a3;
- (void)setCarrierMCC:(id)a3;
- (void)setCarrierMNC:(id)a3;
- (void)setClientClockTime:(double)a3;
- (void)setConnectionType:(int)a3;
- (void)setCurrentCarrierMCC:(id)a3;
- (void)setCurrentCarrierMNC:(id)a3;
- (void)setDPIDString:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4;
- (void)setDeviceRequestID:(id)a3;
- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3;
- (void)setHasAppsRank:(BOOL)a3;
- (void)setHasClientClockTime:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLimitAdTracking:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasOverrideType:(BOOL)a3;
- (void)setHasRunState:(BOOL)a3;
- (void)setHasTimezone:(BOOL)a3;
- (void)setHorizontalAccuracy:(float)a3;
- (void)setIAdIDString:(id)a3;
- (void)setITunesStore:(id)a3;
- (void)setIsOnInternationalDataRoaming:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLatitude:(float)a3;
- (void)setLimitAdTracking:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocality:(id)a3;
- (void)setLongitude:(float)a3;
- (void)setOsVersionAndBuild:(id)a3;
- (void)setOverrideType:(int)a3;
- (void)setPostalCode:(id)a3;
- (void)setRunState:(int)a3;
- (void)setStoreFrontLanguageLocaleIdentifier:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setTargetings:(id)a3;
- (void)setTimezone:(float)a3;
- (void)setToroIDString:(id)a3;
- (void)setUserKeyboards:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADUserTargetingProperties

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ADUserTargetingProperties;
  [(ADUserTargetingProperties *)&v3 dealloc];
}

- (void)setClientClockTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clientClockTime = a3;
}

- (void)setHasClientClockTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClientClockTime
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setTimezone:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTimezone
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)runState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_runState;
  }
  else {
    return 0;
  }
}

- (void)setRunState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRunState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68A0C40[a3];
  }
  return v3;
}

- (int)StringAsRunState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Simulator"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DevelopmentDevice"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConsumerDevice"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (void)clearUserKeyboards
{
}

- (void)addUserKeyboard:(id)a3
{
  id v4 = a3;
  userKeyboards = self->_userKeyboards;
  id v8 = v4;
  if (!userKeyboards)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userKeyboards;
    self->_userKeyboards = v6;

    id v4 = v8;
    userKeyboards = self->_userKeyboards;
  }
  [(NSMutableArray *)userKeyboards addObject:v4];
}

- (unint64_t)userKeyboardsCount
{
  return [(NSMutableArray *)self->_userKeyboards count];
}

- (id)userKeyboardAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userKeyboards objectAtIndex:a3];
}

+ (Class)userKeyboardType
{
  return (Class)objc_opt_class();
}

- (void)setAppsRank:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appsRank = a3;
}

- (void)setHasAppsRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppsRank
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (unint64_t)deviceModesCount
{
  return self->_deviceModes.count;
}

- (int)deviceModes
{
  return self->_deviceModes.list;
}

- (void)clearDeviceModes
{
}

- (void)addDeviceMode:(int)a3
{
}

- (int)deviceModeAtIndex:(unint64_t)a3
{
  p_deviceModes = &self->_deviceModes;
  unint64_t count = self->_deviceModes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_deviceModes->list[a3];
}

- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4
{
}

- (id)deviceModesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68A0C58[a3];
  }
  return v3;
}

- (int)StringAsDeviceModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EducationMode"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GuestMode"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)accountTypesCount
{
  return self->_accountTypes.count;
}

- (int)accountTypes
{
  return self->_accountTypes.list;
}

- (void)clearAccountTypes
{
}

- (void)addAccountType:(int)a3
{
}

- (int)accountTypeAtIndex:(unint64_t)a3
{
  p_accountTypes = &self->_accountTypes;
  unint64_t count = self->_accountTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_accountTypes->list[a3];
}

- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)accountTypesAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68A0C70[a3];
  }
  return v3;
}

- (int)StringAsAccountTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAccount"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Consumer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ManagedAccount"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"U13"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"T13"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"U18"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Unknown_Age"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SensitiveContentEligible"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLatitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLongitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHorizontalAccuracy:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (void)clearTargetings
{
}

- (void)addTargeting:(id)a3
{
  id v4 = a3;
  targetings = self->_targetings;
  id v8 = v4;
  if (!targetings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_targetings;
    self->_targetings = v6;

    id v4 = v8;
    targetings = self->_targetings;
  }
  [(NSMutableArray *)targetings addObject:v4];
}

- (unint64_t)targetingsCount
{
  return [(NSMutableArray *)self->_targetings count];
}

- (id)targetingAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_targetings objectAtIndex:a3];
}

+ (Class)targetingType
{
  return (Class)objc_opt_class();
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLimitAdTracking
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasToroIDString
{
  return self->_toroIDString != 0;
}

- (BOOL)hasIAdIDString
{
  return self->_iAdIDString != 0;
}

- (BOOL)hasAlgoId
{
  return self->_algoId != 0;
}

- (BOOL)hasDPIDString
{
  return self->_dPIDString != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeviceRequestID
{
  return self->_deviceRequestID != 0;
}

- (BOOL)hasCarrierMNC
{
  return self->_carrierMNC != 0;
}

- (BOOL)hasCarrierMCC
{
  return self->_carrierMCC != 0;
}

- (BOOL)hasCurrentCarrierMNC
{
  return self->_currentCarrierMNC != 0;
}

- (BOOL)hasCurrentCarrierMCC
{
  return self->_currentCarrierMCC != 0;
}

- (void)setIsOnInternationalDataRoaming:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isOnInternationalDataRoaming = a3;
}

- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsOnInternationalDataRoaming
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)connectionType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68A0CB0[a3];
  }
  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownConnection"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WiFi"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cellular_2_G"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cellular_2_5G"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Cellular_3_G"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Cellular_3_5G"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Cellular_3_75G"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Cellular_H_Plus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Cellular_4G"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cellular_5G"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStoreFrontLanguageLocaleIdentifier
{
  return self->_storeFrontLanguageLocaleIdentifier != 0;
}

- (unint64_t)accountStatesCount
{
  return self->_accountStates.count;
}

- (int)accountStates
{
  return self->_accountStates.list;
}

- (void)clearAccountStates
{
}

- (void)addAccountState:(int)a3
{
}

- (int)accountStateAtIndex:(unint64_t)a3
{
  p_accountStates = &self->_accountStates;
  unint64_t count = self->_accountStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_accountStates->list[a3];
}

- (void)setAccountStates:(int *)a3 count:(unint64_t)a4
{
}

- (id)accountStatesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68A0D08[a3];
  }
  return v3;
}

- (int)StringAsAccountStates:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"No_iCloud"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Same_iCloud"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Diff_iCloud"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)overrideType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_overrideType;
  }
  else {
    return 11000;
  }
}

- (void)setOverrideType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_overrideType = a3;
}

- (void)setHasOverrideType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOverrideType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)overrideTypeAsString:(int)a3
{
  if (a3 == 11000)
  {
    int v4 = @"NoOverride";
  }
  else if (a3 == 11001)
  {
    int v4 = @"ODMLData";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsOverrideType:(id)a3
{
  id v3 = a3;
  int v4 = 11000;
  if (([v3 isEqualToString:@"NoOverride"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"ODMLData"]) {
      int v4 = 11001;
    }
    else {
      int v4 = 11000;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADUserTargetingProperties;
  int v4 = [(ADUserTargetingProperties *)&v8 description];
  v5 = [(ADUserTargetingProperties *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)&self->_has)
  {
    v5 = [NSNumber numberWithDouble:self->_clientClockTime];
    [v3 setObject:v5 forKey:@"clientClockTime"];
  }
  appID = self->_appID;
  if (appID) {
    [v3 setObject:appID forKey:@"appID"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"deviceModel"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(float *)&double v4 = self->_timezone;
    v9 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"timezone"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t runState = self->_runState;
    if (runState >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_runState);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E68A0C40[runState];
    }
    [v3 setObject:v11 forKey:@"runState"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v3 setObject:appVersion forKey:@"appVersion"];
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild) {
    [v3 setObject:osVersionAndBuild forKey:@"osVersionAndBuild"];
  }
  iTunesStore = self->_iTunesStore;
  if (iTunesStore) {
    [v3 setObject:iTunesStore forKey:@"iTunesStore"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v3 setObject:localeIdentifier forKey:@"localeIdentifier"];
  }
  userKeyboards = self->_userKeyboards;
  if (userKeyboards) {
    [v3 setObject:userKeyboards forKey:@"userKeyboard"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v17 = [NSNumber numberWithInt:self->_appsRank];
    [v3 setObject:v17 forKey:@"appsRank"];
  }
  p_deviceModes = &self->_deviceModes;
  if (self->_deviceModes.count)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_deviceModes.count)
    {
      unint64_t v20 = 0;
      do
      {
        uint64_t v21 = p_deviceModes->list[v20];
        if (v21 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_deviceModes->list[v20]);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = off_1E68A0C58[v21];
        }
        [v19 addObject:v22];

        ++v20;
      }
      while (v20 < self->_deviceModes.count);
    }
    [v3 setObject:v19 forKey:@"deviceMode"];
  }
  p_accountTypes = &self->_accountTypes;
  if (self->_accountTypes.count)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_accountTypes.count)
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = p_accountTypes->list[v25];
        if (v26 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_accountTypes->list[v25]);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E68A0C70[v26];
        }
        [v24 addObject:v27];

        ++v25;
      }
      while (v25 < self->_accountTypes.count);
    }
    [v3 setObject:v24 forKey:@"accountType"];
  }
  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x20) != 0)
  {
    *(float *)&double v4 = self->_latitude;
    v57 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v57 forKey:@"latitude"];

    __int16 v28 = (__int16)self->_has;
    if ((v28 & 0x40) == 0)
    {
LABEL_44:
      if ((v28 & 0x10) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((v28 & 0x40) == 0)
  {
    goto LABEL_44;
  }
  *(float *)&double v4 = self->_longitude;
  v58 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v58 forKey:@"longitude"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    *(float *)&double v4 = self->_horizontalAccuracy;
    v29 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v29 forKey:@"horizontalAccuracy"];
  }
LABEL_46:
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v3 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  if ([(NSMutableArray *)self->_targetings count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_targetings, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v32 = self->_targetings;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v70 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v69 + 1) + 8 * i) dictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"targeting"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_limitAdTracking];
    [v3 setObject:v38 forKey:@"limitAdTracking"];
  }
  toroIDString = self->_toroIDString;
  if (toroIDString) {
    [v3 setObject:toroIDString forKey:@"toroIDString"];
  }
  iAdIDString = self->_iAdIDString;
  if (iAdIDString) {
    [v3 setObject:iAdIDString forKey:@"iAdIDString"];
  }
  algoId = self->_algoId;
  if (algoId) {
    [v3 setObject:algoId forKey:@"algoId"];
  }
  dPIDString = self->_dPIDString;
  if (dPIDString) {
    [v3 setObject:dPIDString forKey:@"DPIDString"];
  }
  postalCode = self->_postalCode;
  if (postalCode) {
    [v3 setObject:postalCode forKey:@"postalCode"];
  }
  administrativeArea = self->_administrativeArea;
  if (administrativeArea) {
    [v3 setObject:administrativeArea forKey:@"administrativeArea"];
  }
  locality = self->_locality;
  if (locality) {
    [v3 setObject:locality forKey:@"locality"];
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea) {
    [v3 setObject:subAdministrativeArea forKey:@"subAdministrativeArea"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v47 = [NSNumber numberWithInt:self->_advertisingIdentifierMonthResetCount];
    [v3 setObject:v47 forKey:@"advertisingIdentifierMonthResetCount"];
  }
  deviceRequestID = self->_deviceRequestID;
  if (deviceRequestID) {
    [v3 setObject:deviceRequestID forKey:@"deviceRequestID"];
  }
  carrierMNC = self->_carrierMNC;
  if (carrierMNC) {
    [v3 setObject:carrierMNC forKey:@"carrierMNC"];
  }
  carrierMCC = self->_carrierMCC;
  if (carrierMCC) {
    [v3 setObject:carrierMCC forKey:@"carrierMCC"];
  }
  currentCarrierMNC = self->_currentCarrierMNC;
  if (currentCarrierMNC) {
    [v3 setObject:currentCarrierMNC forKey:@"currentCarrierMNC"];
  }
  currentCarrierMCC = self->_currentCarrierMCC;
  if (currentCarrierMCC) {
    [v3 setObject:currentCarrierMCC forKey:@"currentCarrierMCC"];
  }
  __int16 v53 = (__int16)self->_has;
  if ((v53 & 0x400) != 0)
  {
    v54 = [NSNumber numberWithBool:self->_isOnInternationalDataRoaming];
    [v3 setObject:v54 forKey:@"isOnInternationalDataRoaming"];

    __int16 v53 = (__int16)self->_has;
  }
  if ((v53 & 8) != 0)
  {
    uint64_t connectionType = self->_connectionType;
    if (connectionType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_connectionType);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E68A0CB0[connectionType];
    }
    [v3 setObject:v56 forKey:@"connectionType"];
  }
  storeFrontLanguageLocaleIdentifier = self->_storeFrontLanguageLocaleIdentifier;
  if (storeFrontLanguageLocaleIdentifier) {
    [v3 setObject:storeFrontLanguageLocaleIdentifier forKey:@"storeFrontLanguageLocaleIdentifier"];
  }
  p_accountStates = &self->_accountStates;
  if (self->_accountStates.count)
  {
    v61 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_accountStates.count)
    {
      unint64_t v62 = 0;
      do
      {
        uint64_t v63 = p_accountStates->list[v62];
        if (v63 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_accountStates->list[v62]);
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v64 = off_1E68A0D08[v63];
        }
        [v61 addObject:v64];

        ++v62;
      }
      while (v62 < self->_accountStates.count);
    }
    [v3 setObject:v61 forKey:@"accountState"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    int overrideType = self->_overrideType;
    if (overrideType == 11000)
    {
      v66 = @"NoOverride";
    }
    else if (overrideType == 11001)
    {
      v66 = @"ODMLData";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_overrideType);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v66 forKey:@"overrideType"];
  }
  id v67 = v3;

  return v67;
}

- (BOOL)readFrom:(id)a3
{
  return ADUserTargetingPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_appID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_osVersionAndBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesStore) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = self->_userKeyboards;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceModes.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_deviceModes.count);
  }
  if (self->_accountTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_accountTypes.count);
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x40) == 0)
    {
LABEL_36:
      if ((v13 & 0x10) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v13 & 0x40) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_37:
  }
    PBDataWriterWriteFloatField();
LABEL_38:
  if (self->_isoCountryCode) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_targetings;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_toroIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_iAdIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_algoId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dPIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_postalCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_administrativeArea) {
    PBDataWriterWriteStringField();
  }
  if (self->_locality) {
    PBDataWriterWriteStringField();
  }
  if (self->_subAdministrativeArea) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceRequestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrierMNC) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrierMCC) {
    PBDataWriterWriteStringField();
  }
  if (self->_currentCarrierMNC) {
    PBDataWriterWriteStringField();
  }
  if (self->_currentCarrierMCC) {
    PBDataWriterWriteStringField();
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_storeFrontLanguageLocaleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accountStates.count)
  {
    unint64_t v20 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v20;
    }
    while (v20 < self->_accountStates.count);
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_has)
  {
    v4[10] = *(void *)&self->_clientClockTime;
    *((_WORD *)v4 + 174) |= 1u;
  }
  long long v26 = v4;
  if (self->_appID)
  {
    objc_msgSend(v4, "setAppID:");
    id v4 = v26;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v26, "setDeviceModel:");
    id v4 = v26;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 80) = LODWORD(self->_timezone);
    *((_WORD *)v4 + 174) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 72) = self->_runState;
    *((_WORD *)v4 + 174) |= 0x100u;
  }
  if (self->_appVersion) {
    objc_msgSend(v26, "setAppVersion:");
  }
  if (self->_osVersionAndBuild) {
    objc_msgSend(v26, "setOsVersionAndBuild:");
  }
  if (self->_iTunesStore) {
    objc_msgSend(v26, "setITunesStore:");
  }
  if (self->_localeIdentifier) {
    objc_msgSend(v26, "setLocaleIdentifier:");
  }
  if ([(ADUserTargetingProperties *)self userKeyboardsCount])
  {
    [v26 clearUserKeyboards];
    unint64_t v6 = [(ADUserTargetingProperties *)self userKeyboardsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ADUserTargetingProperties *)self userKeyboardAtIndex:i];
        [v26 addUserKeyboard:v9];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v26 + 32) = self->_appsRank;
    *((_WORD *)v26 + 174) |= 4u;
  }
  if ([(ADUserTargetingProperties *)self deviceModesCount])
  {
    [v26 clearDeviceModes];
    unint64_t v10 = [(ADUserTargetingProperties *)self deviceModesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v26, "addDeviceMode:", -[ADUserTargetingProperties deviceModeAtIndex:](self, "deviceModeAtIndex:", j));
    }
  }
  if ([(ADUserTargetingProperties *)self accountTypesCount])
  {
    [v26 clearAccountTypes];
    unint64_t v13 = [(ADUserTargetingProperties *)self accountTypesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(v26, "addAccountType:", -[ADUserTargetingProperties accountTypeAtIndex:](self, "accountTypeAtIndex:", k));
    }
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) != 0)
  {
    *((_DWORD *)v26 + 58) = LODWORD(self->_latitude);
    *((_WORD *)v26 + 174) |= 0x20u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x40) == 0)
    {
LABEL_35:
      if ((v16 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v16 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v26 + 64) = LODWORD(self->_longitude);
  *((_WORD *)v26 + 174) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_36:
    *((_DWORD *)v26 + 50) = LODWORD(self->_horizontalAccuracy);
    *((_WORD *)v26 + 174) |= 0x10u;
  }
LABEL_37:
  if (self->_isoCountryCode) {
    objc_msgSend(v26, "setIsoCountryCode:");
  }
  if ([(ADUserTargetingProperties *)self targetingsCount])
  {
    [v26 clearTargetings];
    unint64_t v17 = [(ADUserTargetingProperties *)self targetingsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        unint64_t v20 = [(ADUserTargetingProperties *)self targetingAtIndex:m];
        [v26 addTargeting:v20];
      }
    }
  }
  long long v21 = v26;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((unsigned char *)v26 + 345) = self->_limitAdTracking;
    *((_WORD *)v26 + 174) |= 0x800u;
  }
  if (self->_toroIDString)
  {
    objc_msgSend(v26, "setToroIDString:");
    long long v21 = v26;
  }
  if (self->_iAdIDString)
  {
    objc_msgSend(v26, "setIAdIDString:");
    long long v21 = v26;
  }
  if (self->_algoId)
  {
    objc_msgSend(v26, "setAlgoId:");
    long long v21 = v26;
  }
  if (self->_dPIDString)
  {
    objc_msgSend(v26, "setDPIDString:");
    long long v21 = v26;
  }
  if (self->_postalCode)
  {
    objc_msgSend(v26, "setPostalCode:");
    long long v21 = v26;
  }
  if (self->_administrativeArea)
  {
    objc_msgSend(v26, "setAdministrativeArea:");
    long long v21 = v26;
  }
  if (self->_locality)
  {
    objc_msgSend(v26, "setLocality:");
    long long v21 = v26;
  }
  if (self->_subAdministrativeArea)
  {
    objc_msgSend(v26, "setSubAdministrativeArea:");
    long long v21 = v26;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v21[24] = self->_advertisingIdentifierMonthResetCount;
    *((_WORD *)v21 + 174) |= 2u;
  }
  if (self->_deviceRequestID)
  {
    objc_msgSend(v26, "setDeviceRequestID:");
    long long v21 = v26;
  }
  if (self->_carrierMNC)
  {
    objc_msgSend(v26, "setCarrierMNC:");
    long long v21 = v26;
  }
  if (self->_carrierMCC)
  {
    objc_msgSend(v26, "setCarrierMCC:");
    long long v21 = v26;
  }
  if (self->_currentCarrierMNC)
  {
    objc_msgSend(v26, "setCurrentCarrierMNC:");
    long long v21 = v26;
  }
  if (self->_currentCarrierMCC)
  {
    objc_msgSend(v26, "setCurrentCarrierMCC:");
    long long v21 = v26;
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x400) != 0)
  {
    *((unsigned char *)v21 + 344) = self->_isOnInternationalDataRoaming;
    *((_WORD *)v21 + 174) |= 0x400u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 8) != 0)
  {
    v21[38] = self->_connectionType;
    *((_WORD *)v21 + 174) |= 8u;
  }
  if (self->_storeFrontLanguageLocaleIdentifier) {
    objc_msgSend(v26, "setStoreFrontLanguageLocaleIdentifier:");
  }
  if ([(ADUserTargetingProperties *)self accountStatesCount])
  {
    [v26 clearAccountStates];
    unint64_t v23 = [(ADUserTargetingProperties *)self accountStatesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
        objc_msgSend(v26, "addAccountState:", -[ADUserTargetingProperties accountStateAtIndex:](self, "accountStateAtIndex:", n));
    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v26 + 68) = self->_overrideType;
    *((_WORD *)v26 + 174) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(double *)(v5 + 80) = self->_clientClockTime;
    *(_WORD *)(v5 + 348) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_appID copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v7;

  uint64_t v9 = [(NSString *)self->_deviceModel copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v9;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(float *)(v6 + 320) = self->_timezone;
    *(_WORD *)(v6 + 348) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 288) = self->_runState;
    *(_WORD *)(v6 + 348) |= 0x100u;
  }
  uint64_t v12 = [(NSString *)self->_appVersion copyWithZone:a3];
  unint64_t v13 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v12;

  uint64_t v14 = [(NSString *)self->_osVersionAndBuild copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v14;

  uint64_t v16 = [(NSString *)self->_iTunesStore copyWithZone:a3];
  unint64_t v17 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v16;

  uint64_t v18 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  __int16 v19 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v18;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v20 = self->_userKeyboards;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v70 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addUserKeyboard:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_appsRank;
    *(_WORD *)(v6 + 348) |= 4u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x20) != 0)
  {
    *(float *)(v6 + 232) = self->_latitude;
    *(_WORD *)(v6 + 348) |= 0x20u;
    __int16 v26 = (__int16)self->_has;
    if ((v26 & 0x40) == 0)
    {
LABEL_18:
      if ((v26 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v26 & 0x40) == 0)
  {
    goto LABEL_18;
  }
  *(float *)(v6 + 256) = self->_longitude;
  *(_WORD *)(v6 + 348) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    *(float *)(v6 + 200) = self->_horizontalAccuracy;
    *(_WORD *)(v6 + 348) |= 0x10u;
  }
LABEL_20:
  uint64_t v27 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  long long v28 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v27;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v29 = self->_targetings;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v66 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * j), "copyWithZone:", a3, (void)v65);
        [(id)v6 addTargeting:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v31);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 345) = self->_limitAdTracking;
    *(_WORD *)(v6 + 348) |= 0x800u;
  }
  uint64_t v35 = -[NSString copyWithZone:](self->_toroIDString, "copyWithZone:", a3, (void)v65);
  v36 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v35;

  uint64_t v37 = [(NSString *)self->_iAdIDString copyWithZone:a3];
  v38 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v37;

  uint64_t v39 = [(NSString *)self->_algoId copyWithZone:a3];
  v40 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v39;

  uint64_t v41 = [(NSString *)self->_dPIDString copyWithZone:a3];
  v42 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v41;

  uint64_t v43 = [(NSString *)self->_postalCode copyWithZone:a3];
  v44 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v43;

  uint64_t v45 = [(NSString *)self->_administrativeArea copyWithZone:a3];
  v46 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v45;

  uint64_t v47 = [(NSString *)self->_locality copyWithZone:a3];
  v48 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v47;

  uint64_t v49 = [(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v50 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v49;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_advertisingIdentifierMonthResetCount;
    *(_WORD *)(v6 + 348) |= 2u;
  }
  uint64_t v51 = [(NSString *)self->_deviceRequestID copyWithZone:a3];
  v52 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v51;

  uint64_t v53 = [(NSString *)self->_carrierMNC copyWithZone:a3];
  v54 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v53;

  uint64_t v55 = [(NSString *)self->_carrierMCC copyWithZone:a3];
  v56 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v55;

  uint64_t v57 = [(NSString *)self->_currentCarrierMNC copyWithZone:a3];
  v58 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v57;

  uint64_t v59 = [(NSString *)self->_currentCarrierMCC copyWithZone:a3];
  v60 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v59;

  __int16 v61 = (__int16)self->_has;
  if ((v61 & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 344) = self->_isOnInternationalDataRoaming;
    *(_WORD *)(v6 + 348) |= 0x400u;
    __int16 v61 = (__int16)self->_has;
  }
  if ((v61 & 8) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_connectionType;
    *(_WORD *)(v6 + 348) |= 8u;
  }
  uint64_t v62 = [(NSString *)self->_storeFrontLanguageLocaleIdentifier copyWithZone:a3];
  uint64_t v63 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v62;

  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 272) = self->_overrideType;
    *(_WORD *)(v6 + 348) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_117;
  }
  __int16 v5 = *((_WORD *)v4 + 174);
  if (*(_WORD *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_clientClockTime != *((double *)v4 + 10)) {
      goto LABEL_117;
    }
  }
  else if (v5)
  {
    goto LABEL_117;
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((void *)v4 + 14) && !-[NSString isEqual:](appID, "isEqual:")) {
    goto LABEL_117;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_117;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x200) == 0 || self->_timezone != *((float *)v4 + 80)) {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 174) & 0x200) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x100) == 0 || self->_runState != *((_DWORD *)v4 + 72)) {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 174) & 0x100) != 0)
  {
    goto LABEL_117;
  }
  appVersiouint64_t n = self->_appVersion;
  if ((unint64_t)appVersion | *((void *)v4 + 15)
    && !-[NSString isEqual:](appVersion, "isEqual:"))
  {
    goto LABEL_117;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](osVersionAndBuild, "isEqual:")) {
      goto LABEL_117;
    }
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](iTunesStore, "isEqual:")) {
      goto LABEL_117;
    }
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_117;
    }
  }
  userKeyboards = self->_userKeyboards;
  if ((unint64_t)userKeyboards | *((void *)v4 + 42))
  {
    if (!-[NSMutableArray isEqual:](userKeyboards, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v13 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_appsRank != *((_DWORD *)v4 + 32)) {
      goto LABEL_117;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_117;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_117;
  }
  __int16 has = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 174);
  if ((has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_latitude != *((float *)v4 + 58)) {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_longitude != *((float *)v4 + 64)) {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_horizontalAccuracy != *((float *)v4 + 50)) {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 28)
    && !-[NSString isEqual:](isoCountryCode, "isEqual:"))
  {
    goto LABEL_117;
  }
  targetings = self->_targetings;
  if ((unint64_t)targetings | *((void *)v4 + 39))
  {
    if (!-[NSMutableArray isEqual:](targetings, "isEqual:")) {
      goto LABEL_117;
    }
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x800) == 0) {
      goto LABEL_117;
    }
    if (self->_limitAdTracking)
    {
      if (!*((unsigned char *)v4 + 345)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 345))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 174) & 0x800) != 0)
  {
    goto LABEL_117;
  }
  toroIDString = self->_toroIDString;
  if ((unint64_t)toroIDString | *((void *)v4 + 41)
    && !-[NSString isEqual:](toroIDString, "isEqual:"))
  {
    goto LABEL_117;
  }
  iAdIDString = self->_iAdIDString;
  if ((unint64_t)iAdIDString | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](iAdIDString, "isEqual:")) {
      goto LABEL_117;
    }
  }
  algoId = self->_algoId;
  if ((unint64_t)algoId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](algoId, "isEqual:")) {
      goto LABEL_117;
    }
  }
  dPIDString = self->_dPIDString;
  if ((unint64_t)dPIDString | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](dPIDString, "isEqual:")) {
      goto LABEL_117;
    }
  }
  postalCode = self->_postalCode;
  if ((unint64_t)postalCode | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](postalCode, "isEqual:")) {
      goto LABEL_117;
    }
  }
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](administrativeArea, "isEqual:")) {
      goto LABEL_117;
    }
  }
  locality = self->_locality;
  if ((unint64_t)locality | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](locality, "isEqual:")) {
      goto LABEL_117;
    }
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](subAdministrativeArea, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v26 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_117;
    }
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_117;
  }
  deviceRequestID = self->_deviceRequestID;
  if ((unint64_t)deviceRequestID | *((void *)v4 + 24)
    && !-[NSString isEqual:](deviceRequestID, "isEqual:"))
  {
    goto LABEL_117;
  }
  carrierMNC = self->_carrierMNC;
  if ((unint64_t)carrierMNC | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](carrierMNC, "isEqual:")) {
      goto LABEL_117;
    }
  }
  carrierMCC = self->_carrierMCC;
  if ((unint64_t)carrierMCC | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](carrierMCC, "isEqual:")) {
      goto LABEL_117;
    }
  }
  currentCarrierMNC = self->_currentCarrierMNC;
  if ((unint64_t)currentCarrierMNC | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](currentCarrierMNC, "isEqual:")) {
      goto LABEL_117;
    }
  }
  currentCarrierMCC = self->_currentCarrierMCC;
  if ((unint64_t)currentCarrierMCC | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](currentCarrierMCC, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v32 = (__int16)self->_has;
  __int16 v33 = *((_WORD *)v4 + 174);
  if ((v32 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x400) != 0)
    {
      if (self->_isOnInternationalDataRoaming)
      {
        if (!*((unsigned char *)v4 + 344)) {
          goto LABEL_117;
        }
        goto LABEL_104;
      }
      if (!*((unsigned char *)v4 + 344)) {
        goto LABEL_104;
      }
    }
LABEL_117:
    BOOL v36 = 0;
    goto LABEL_118;
  }
  if ((*((_WORD *)v4 + 174) & 0x400) != 0) {
    goto LABEL_117;
  }
LABEL_104:
  if ((v32 & 8) != 0)
  {
    if ((v33 & 8) == 0 || self->_connectionType != *((_DWORD *)v4 + 38)) {
      goto LABEL_117;
    }
  }
  else if ((v33 & 8) != 0)
  {
    goto LABEL_117;
  }
  storeFrontLanguageLocaleIdentifier = self->_storeFrontLanguageLocaleIdentifier;
  if ((unint64_t)storeFrontLanguageLocaleIdentifier | *((void *)v4 + 37)
    && !-[NSString isEqual:](storeFrontLanguageLocaleIdentifier, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_117;
  }
  __int16 v35 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0 || self->_overrideType != *((_DWORD *)v4 + 68)) {
      goto LABEL_117;
    }
    BOOL v36 = 1;
  }
  else
  {
    BOOL v36 = (v35 & 0x80) == 0;
  }
LABEL_118:

  return v36;
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has)
  {
    double clientClockTime = self->_clientClockTime;
    double v4 = -clientClockTime;
    if (clientClockTime >= 0.0) {
      double v4 = self->_clientClockTime;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v74 = v10;
  }
  else
  {
    unint64_t v74 = 0;
  }
  NSUInteger v73 = [(NSString *)self->_appID hash];
  NSUInteger v72 = [(NSString *)self->_deviceModel hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    float timezone = self->_timezone;
    float v13 = -timezone;
    if (timezone >= 0.0) {
      float v13 = self->_timezone;
    }
    float v14 = floorf(v13 + 0.5);
    float v15 = (float)(v13 - v14) * 1.8447e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v16 += (unint64_t)v15;
      }
    }
    else
    {
      v16 -= (unint64_t)fabsf(v15);
    }
    unint64_t v71 = v16;
    if ((has & 0x100) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v71 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_12:
      uint64_t v70 = 2654435761 * self->_runState;
      goto LABEL_21;
    }
  }
  uint64_t v70 = 0;
LABEL_21:
  NSUInteger v69 = [(NSString *)self->_appVersion hash];
  NSUInteger v68 = [(NSString *)self->_osVersionAndBuild hash];
  NSUInteger v67 = [(NSString *)self->_iTunesStore hash];
  NSUInteger v66 = [(NSString *)self->_localeIdentifier hash];
  uint64_t v65 = [(NSMutableArray *)self->_userKeyboards hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v64 = 2654435761 * self->_appsRank;
  }
  else {
    uint64_t v64 = 0;
  }
  uint64_t v63 = PBRepeatedInt32Hash();
  uint64_t v62 = PBRepeatedInt32Hash();
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    float latitude = self->_latitude;
    float v20 = -latitude;
    if (latitude >= 0.0) {
      float v20 = self->_latitude;
    }
    float v21 = floorf(v20 + 0.5);
    float v22 = (float)(v20 - v21) * 1.8447e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmodf(v21, 1.8447e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabsf(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((v17 & 0x40) != 0)
  {
    float longitude = self->_longitude;
    float v25 = -longitude;
    if (longitude >= 0.0) {
      float v25 = self->_longitude;
    }
    float v26 = floorf(v25 + 0.5);
    float v27 = (float)(v25 - v26) * 1.8447e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmodf(v26, 1.8447e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabsf(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  unint64_t v61 = v23;
  if ((v17 & 0x10) != 0)
  {
    float horizontalAccuracy = self->_horizontalAccuracy;
    float v29 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      float v29 = self->_horizontalAccuracy;
    }
    float v30 = floorf(v29 + 0.5);
    float v31 = (float)(v29 - v30) * 1.8447e19;
    float v32 = fmodf(v30, 1.8447e19);
    unint64_t v33 = 2654435761u * (unint64_t)v32;
    unint64_t v34 = v33 + (unint64_t)v31;
    if (v31 <= 0.0) {
      unint64_t v34 = 2654435761u * (unint64_t)v32;
    }
    unint64_t v35 = v33 - (unint64_t)fabsf(v31);
    if (v31 >= 0.0) {
      unint64_t v35 = v34;
    }
    unint64_t v60 = v35;
  }
  else
  {
    unint64_t v60 = 0;
  }
  NSUInteger v59 = [(NSString *)self->_isoCountryCode hash];
  uint64_t v58 = [(NSMutableArray *)self->_targetings hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v57 = 2654435761 * self->_limitAdTracking;
  }
  else {
    uint64_t v57 = 0;
  }
  NSUInteger v56 = [(NSString *)self->_toroIDString hash];
  NSUInteger v55 = [(NSString *)self->_iAdIDString hash];
  NSUInteger v54 = [(NSString *)self->_algoId hash];
  NSUInteger v53 = [(NSString *)self->_dPIDString hash];
  NSUInteger v52 = [(NSString *)self->_postalCode hash];
  NSUInteger v51 = [(NSString *)self->_administrativeArea hash];
  NSUInteger v50 = [(NSString *)self->_locality hash];
  NSUInteger v49 = [(NSString *)self->_subAdministrativeArea hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v48 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
  }
  else {
    uint64_t v48 = 0;
  }
  NSUInteger v47 = [(NSString *)self->_deviceRequestID hash];
  NSUInteger v46 = [(NSString *)self->_carrierMNC hash];
  NSUInteger v36 = [(NSString *)self->_carrierMCC hash];
  NSUInteger v37 = [(NSString *)self->_currentCarrierMNC hash];
  NSUInteger v38 = [(NSString *)self->_currentCarrierMCC hash];
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x400) != 0)
  {
    uint64_t v40 = 2654435761 * self->_isOnInternationalDataRoaming;
    if ((v39 & 8) != 0) {
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((v39 & 8) != 0)
    {
LABEL_57:
      uint64_t v41 = 2654435761 * self->_connectionType;
      goto LABEL_60;
    }
  }
  uint64_t v41 = 0;
LABEL_60:
  NSUInteger v42 = [(NSString *)self->_storeFrontLanguageLocaleIdentifier hash];
  uint64_t v43 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v44 = 2654435761 * self->_overrideType;
  }
  else {
    uint64_t v44 = 0;
  }
  return v73 ^ v74 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v18 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double v4 = (double *)a3;
  long double v5 = v4;
  if (*((_WORD *)v4 + 174))
  {
    self->_double clientClockTime = v4[10];
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 14)) {
    -[ADUserTargetingProperties setAppID:](self, "setAppID:");
  }
  if (*((void *)v5 + 23)) {
    -[ADUserTargetingProperties setDeviceModel:](self, "setDeviceModel:");
  }
  __int16 v6 = *((_WORD *)v5 + 174);
  if ((v6 & 0x200) != 0)
  {
    self->_float timezone = *((float *)v5 + 80);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v6 = *((_WORD *)v5 + 174);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_uint64_t runState = *((_DWORD *)v5 + 72);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 15)) {
    -[ADUserTargetingProperties setAppVersion:](self, "setAppVersion:");
  }
  if (*((void *)v5 + 33)) {
    -[ADUserTargetingProperties setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
  }
  if (*((void *)v5 + 27)) {
    -[ADUserTargetingProperties setITunesStore:](self, "setITunesStore:");
  }
  if (*((void *)v5 + 30)) {
    -[ADUserTargetingProperties setLocaleIdentifier:](self, "setLocaleIdentifier:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = *((id *)v5 + 42);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ADUserTargetingProperties *)self addUserKeyboard:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  if ((*((_WORD *)v5 + 174) & 4) != 0)
  {
    self->_appsRanuint64_t k = *((_DWORD *)v5 + 32);
    *(_WORD *)&self->_has |= 4u;
  }
  uint64_t v12 = [v5 deviceModesCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[ADUserTargetingProperties addDeviceMode:](self, "addDeviceMode:", [v5 deviceModeAtIndex:j]);
  }
  uint64_t v15 = [v5 accountTypesCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t k = 0; k != v16; ++k)
      -[ADUserTargetingProperties addAccountType:](self, "addAccountType:", [v5 accountTypeAtIndex:k]);
  }
  __int16 v18 = *((_WORD *)v5 + 174);
  if ((v18 & 0x20) != 0)
  {
    self->_float latitude = *((float *)v5 + 58);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v18 = *((_WORD *)v5 + 174);
    if ((v18 & 0x40) == 0)
    {
LABEL_36:
      if ((v18 & 0x10) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v18 & 0x40) == 0)
  {
    goto LABEL_36;
  }
  self->_float longitude = *((float *)v5 + 64);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v5 + 174) & 0x10) != 0)
  {
LABEL_37:
    self->_float horizontalAccuracy = *((float *)v5 + 50);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_38:
  if (*((void *)v5 + 28)) {
    -[ADUserTargetingProperties setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = *((id *)v5 + 39);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        -[ADUserTargetingProperties addTargeting:](self, "addTargeting:", *(void *)(*((void *)&v28 + 1) + 8 * m), (void)v28);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  if ((*((_WORD *)v5 + 174) & 0x800) != 0)
  {
    self->_limitAdTracking = *((unsigned char *)v5 + 345);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((void *)v5 + 41)) {
    -[ADUserTargetingProperties setToroIDString:](self, "setToroIDString:");
  }
  if (*((void *)v5 + 26)) {
    -[ADUserTargetingProperties setIAdIDString:](self, "setIAdIDString:");
  }
  if (*((void *)v5 + 13)) {
    -[ADUserTargetingProperties setAlgoId:](self, "setAlgoId:");
  }
  if (*((void *)v5 + 22)) {
    -[ADUserTargetingProperties setDPIDString:](self, "setDPIDString:");
  }
  if (*((void *)v5 + 35)) {
    -[ADUserTargetingProperties setPostalCode:](self, "setPostalCode:");
  }
  if (*((void *)v5 + 11)) {
    -[ADUserTargetingProperties setAdministrativeArea:](self, "setAdministrativeArea:");
  }
  if (*((void *)v5 + 31)) {
    -[ADUserTargetingProperties setLocality:](self, "setLocality:");
  }
  if (*((void *)v5 + 38)) {
    -[ADUserTargetingProperties setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  }
  if ((*((_WORD *)v5 + 174) & 2) != 0)
  {
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v5 + 24);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 24)) {
    -[ADUserTargetingProperties setDeviceRequestID:](self, "setDeviceRequestID:");
  }
  if (*((void *)v5 + 18)) {
    -[ADUserTargetingProperties setCarrierMNC:](self, "setCarrierMNC:");
  }
  if (*((void *)v5 + 17)) {
    -[ADUserTargetingProperties setCarrierMCC:](self, "setCarrierMCC:");
  }
  if (*((void *)v5 + 21)) {
    -[ADUserTargetingProperties setCurrentCarrierMNC:](self, "setCurrentCarrierMNC:");
  }
  if (*((void *)v5 + 20)) {
    -[ADUserTargetingProperties setCurrentCarrierMCC:](self, "setCurrentCarrierMCC:");
  }
  __int16 v24 = *((_WORD *)v5 + 174);
  if ((v24 & 0x400) != 0)
  {
    self->_isOnInternationalDataRoaming = *((unsigned char *)v5 + 344);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v24 = *((_WORD *)v5 + 174);
  }
  if ((v24 & 8) != 0)
  {
    self->_uint64_t connectionType = *((_DWORD *)v5 + 38);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 37)) {
    -[ADUserTargetingProperties setStoreFrontLanguageLocaleIdentifier:](self, "setStoreFrontLanguageLocaleIdentifier:");
  }
  uint64_t v25 = objc_msgSend(v5, "accountStatesCount", (void)v28);
  if (v25)
  {
    uint64_t v26 = v25;
    for (uint64_t n = 0; n != v26; ++n)
      -[ADUserTargetingProperties addAccountState:](self, "addAccountState:", [v5 accountStateAtIndex:n]);
  }
  if ((*((_WORD *)v5 + 174) & 0x80) != 0)
  {
    self->_int overrideType = *((_DWORD *)v5 + 68);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (double)clientClockTime
{
  return self->_clientClockTime;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (float)timezone
{
  return self->_timezone;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (void)setITunesStore:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSMutableArray)userKeyboards
{
  return self->_userKeyboards;
}

- (void)setUserKeyboards:(id)a3
{
}

- (int)appsRank
{
  return self->_appsRank;
}

- (float)latitude
{
  return self->_latitude;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSMutableArray)targetings
{
  return self->_targetings;
}

- (void)setTargetings:(id)a3
{
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (NSString)toroIDString
{
  return self->_toroIDString;
}

- (void)setToroIDString:(id)a3
{
}

- (NSString)iAdIDString
{
  return self->_iAdIDString;
}

- (void)setIAdIDString:(id)a3
{
}

- (NSString)algoId
{
  return self->_algoId;
}

- (void)setAlgoId:(id)a3
{
}

- (NSString)dPIDString
{
  return self->_dPIDString;
}

- (void)setDPIDString:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (NSString)deviceRequestID
{
  return self->_deviceRequestID;
}

- (void)setDeviceRequestID:(id)a3
{
}

- (NSString)carrierMNC
{
  return self->_carrierMNC;
}

- (void)setCarrierMNC:(id)a3
{
}

- (NSString)carrierMCC
{
  return self->_carrierMCC;
}

- (void)setCarrierMCC:(id)a3
{
}

- (NSString)currentCarrierMNC
{
  return self->_currentCarrierMNC;
}

- (void)setCurrentCarrierMNC:(id)a3
{
}

- (NSString)currentCarrierMCC
{
  return self->_currentCarrierMCC;
}

- (void)setCurrentCarrierMCC:(id)a3
{
}

- (BOOL)isOnInternationalDataRoaming
{
  return self->_isOnInternationalDataRoaming;
}

- (NSString)storeFrontLanguageLocaleIdentifier
{
  return self->_storeFrontLanguageLocaleIdentifier;
}

- (void)setStoreFrontLanguageLocaleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_toroIDString, 0);
  objc_storeStrong((id *)&self->_targetings, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_storeFrontLanguageLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdIDString, 0);
  objc_storeStrong((id *)&self->_deviceRequestID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dPIDString, 0);
  objc_storeStrong((id *)&self->_currentCarrierMNC, 0);
  objc_storeStrong((id *)&self->_currentCarrierMCC, 0);
  objc_storeStrong((id *)&self->_carrierMNC, 0);
  objc_storeStrong((id *)&self->_carrierMCC, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_algoId, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
}

@end