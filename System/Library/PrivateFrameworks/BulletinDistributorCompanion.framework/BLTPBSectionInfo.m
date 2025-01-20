@interface BLTPBSectionInfo
+ (Class)subsectionsType;
- (BLTPBSectionIcon)icon;
- (BLTPBSectionInfoSettings)sectionInfoSettings;
- (BOOL)allowsNotifications;
- (BOOL)criticalAlertSetting;
- (BOOL)displaysCriticalBulletinsLegacy;
- (BOOL)excludeFromBulletinBoard;
- (BOOL)hasAlertType;
- (BOOL)hasAllowsNotifications;
- (BOOL)hasAuthorizationExpirationDate;
- (BOOL)hasAuthorizationStatus;
- (BOOL)hasCriticalAlertSetting;
- (BOOL)hasDisplayName;
- (BOOL)hasDisplaysCriticalBulletinsLegacy;
- (BOOL)hasExcludeFromBulletinBoard;
- (BOOL)hasFactorySectionID;
- (BOOL)hasGroupingSetting;
- (BOOL)hasIcon;
- (BOOL)hasIconsStripped;
- (BOOL)hasLastUserGrantedAuthorizationDate;
- (BOOL)hasLockScreenSetting;
- (BOOL)hasNotificationCenterLimit;
- (BOOL)hasNotificationCenterSetting;
- (BOOL)hasPhoneAllowsNotifications;
- (BOOL)hasPhoneAuthorizationStatus;
- (BOOL)hasPushSettings;
- (BOOL)hasSectionCategory;
- (BOOL)hasSectionID;
- (BOOL)hasSectionInfoSettings;
- (BOOL)hasSectionType;
- (BOOL)hasShowsInLockScreen;
- (BOOL)hasShowsInNotificationCenter;
- (BOOL)hasShowsMessagePreview;
- (BOOL)hasShowsOnExternalDevices;
- (BOOL)hasSpokenNotificationSetting;
- (BOOL)hasSubsectionID;
- (BOOL)hasSubsectionPriority;
- (BOOL)hasSuppressFromSettings;
- (BOOL)hasSuppressedSettings;
- (BOOL)hasUniversalSectionID;
- (BOOL)hasVersion;
- (BOOL)hasWatchSectionID;
- (BOOL)iconsStripped;
- (BOOL)isEqual:(id)a3;
- (BOOL)phoneAllowsNotifications;
- (BOOL)readFrom:(id)a3;
- (BOOL)showsInLockScreen;
- (BOOL)showsInNotificationCenter;
- (BOOL)showsMessagePreview;
- (BOOL)showsOnExternalDevices;
- (BOOL)suppressFromSettings;
- (NSMutableArray)subsections;
- (NSString)displayName;
- (NSString)factorySectionID;
- (NSString)sectionID;
- (NSString)subsectionID;
- (NSString)universalSectionID;
- (NSString)watchSectionID;
- (double)authorizationExpirationDate;
- (double)lastUserGrantedAuthorizationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupingSettingAsString:(int)a3;
- (id)lockScreenSettingAsString:(int)a3;
- (id)notificationCenterSettingAsString:(int)a3;
- (id)requestWithKeypaths:(id)a3;
- (id)spokenNotificationSettingAsString:(int)a3;
- (id)subsectionsAtIndex:(unint64_t)a3;
- (int)StringAsGroupingSetting:(id)a3;
- (int)StringAsLockScreenSetting:(id)a3;
- (int)StringAsNotificationCenterSetting:(id)a3;
- (int)StringAsSpokenNotificationSetting:(id)a3;
- (int)authorizationStatus;
- (int)groupingSetting;
- (int)lockScreenSetting;
- (int)notificationCenterSetting;
- (int)phoneAuthorizationStatus;
- (int)sectionCategory;
- (int)sectionType;
- (int)spokenNotificationSetting;
- (int)subsectionPriority;
- (unint64_t)hash;
- (unint64_t)subsectionsCount;
- (unsigned)alertType;
- (unsigned)notificationCenterLimit;
- (unsigned)pushSettings;
- (unsigned)suppressedSettings;
- (unsigned)version;
- (void)addSubsections:(id)a3;
- (void)clearSubsections;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlertType:(unsigned int)a3;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setAuthorizationExpirationDate:(double)a3;
- (void)setAuthorizationStatus:(int)a3;
- (void)setCriticalAlertSetting:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplaysCriticalBulletinsLegacy:(BOOL)a3;
- (void)setExcludeFromBulletinBoard:(BOOL)a3;
- (void)setFactorySectionID:(id)a3;
- (void)setGroupingSetting:(int)a3;
- (void)setHasAlertType:(BOOL)a3;
- (void)setHasAllowsNotifications:(BOOL)a3;
- (void)setHasAuthorizationExpirationDate:(BOOL)a3;
- (void)setHasAuthorizationStatus:(BOOL)a3;
- (void)setHasCriticalAlertSetting:(BOOL)a3;
- (void)setHasDisplaysCriticalBulletinsLegacy:(BOOL)a3;
- (void)setHasExcludeFromBulletinBoard:(BOOL)a3;
- (void)setHasGroupingSetting:(BOOL)a3;
- (void)setHasIconsStripped:(BOOL)a3;
- (void)setHasLastUserGrantedAuthorizationDate:(BOOL)a3;
- (void)setHasLockScreenSetting:(BOOL)a3;
- (void)setHasNotificationCenterLimit:(BOOL)a3;
- (void)setHasNotificationCenterSetting:(BOOL)a3;
- (void)setHasPhoneAllowsNotifications:(BOOL)a3;
- (void)setHasPhoneAuthorizationStatus:(BOOL)a3;
- (void)setHasPushSettings:(BOOL)a3;
- (void)setHasSectionCategory:(BOOL)a3;
- (void)setHasSectionType:(BOOL)a3;
- (void)setHasShowsInLockScreen:(BOOL)a3;
- (void)setHasShowsInNotificationCenter:(BOOL)a3;
- (void)setHasShowsMessagePreview:(BOOL)a3;
- (void)setHasShowsOnExternalDevices:(BOOL)a3;
- (void)setHasSpokenNotificationSetting:(BOOL)a3;
- (void)setHasSubsectionPriority:(BOOL)a3;
- (void)setHasSuppressFromSettings:(BOOL)a3;
- (void)setHasSuppressedSettings:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconsStripped:(BOOL)a3;
- (void)setLastUserGrantedAuthorizationDate:(double)a3;
- (void)setLockScreenSetting:(int)a3;
- (void)setNotificationCenterLimit:(unsigned int)a3;
- (void)setNotificationCenterSetting:(int)a3;
- (void)setPhoneAllowsNotifications:(BOOL)a3;
- (void)setPhoneAuthorizationStatus:(int)a3;
- (void)setPushSettings:(unsigned int)a3;
- (void)setSectionCategory:(int)a3;
- (void)setSectionID:(id)a3;
- (void)setSectionInfoSettings:(id)a3;
- (void)setSectionType:(int)a3;
- (void)setShowsInLockScreen:(BOOL)a3;
- (void)setShowsInNotificationCenter:(BOOL)a3;
- (void)setShowsMessagePreview:(BOOL)a3;
- (void)setShowsOnExternalDevices:(BOOL)a3;
- (void)setSpokenNotificationSetting:(int)a3;
- (void)setSubsectionID:(id)a3;
- (void)setSubsectionPriority:(int)a3;
- (void)setSubsections:(id)a3;
- (void)setSuppressFromSettings:(BOOL)a3;
- (void)setSuppressedSettings:(unsigned int)a3;
- (void)setUniversalSectionID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSectionInfo

- (id)requestWithKeypaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  [(BLTPBSetSectionInfoRequest *)v5 setSectionInfo:self];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BLTPBSetSectionInfoRequest addKeypaths:](v5, "addKeypaths:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v11 = [(BLTPBSectionInfo *)self icon];

  if (v11)
  {
    v12 = (void *)[(BLTPBSectionInfo *)self copy];
    [v12 setIcon:0];
    [v12 setIconsStripped:1];
    [(BLTPBSetSectionInfoRequest *)v5 setSectionInfo:v12];
  }
  return v5;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (BOOL)hasSubsectionID
{
  return self->_subsectionID != 0;
}

- (void)setSectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSectionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSectionCategory:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sectionCategory = a3;
}

- (void)setHasSectionCategory:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSectionCategory
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSuppressFromSettings:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_suppressFromSettings = a3;
}

- (void)setHasSuppressFromSettings:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSuppressFromSettings
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_showsInNotificationCenter = a3;
}

- (void)setHasShowsInNotificationCenter:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasShowsInNotificationCenter
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_showsInLockScreen = a3;
}

- (void)setHasShowsInLockScreen:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasShowsInLockScreen
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_showsOnExternalDevices = a3;
}

- (void)setHasShowsOnExternalDevices:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasShowsOnExternalDevices
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNotificationCenterLimit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_notificationCenterLimit = a3;
}

- (void)setHasNotificationCenterLimit:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotificationCenterLimit
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPushSettings:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_pushSettings = a3;
}

- (void)setHasPushSettings:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPushSettings
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlertType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_alertType = a3;
}

- (void)setHasAlertType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAlertType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_showsMessagePreview = a3;
}

- (void)setHasShowsMessagePreview:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasShowsMessagePreview
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_allowsNotifications = a3;
}

- (void)setHasAllowsNotifications:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAllowsNotifications
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSuppressedSettings:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_suppressedSettings = a3;
}

- (void)setHasSuppressedSettings:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSuppressedSettings
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setDisplaysCriticalBulletinsLegacy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_displaysCriticalBulletinsLegacy = a3;
}

- (void)setHasDisplaysCriticalBulletinsLegacy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasDisplaysCriticalBulletinsLegacy
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)clearSubsections
{
}

- (void)addSubsections:(id)a3
{
  id v4 = a3;
  subsections = self->_subsections;
  id v8 = v4;
  if (!subsections)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_subsections;
    self->_subsections = v6;

    id v4 = v8;
    subsections = self->_subsections;
  }
  [(NSMutableArray *)subsections addObject:v4];
}

- (unint64_t)subsectionsCount
{
  return [(NSMutableArray *)self->_subsections count];
}

- (id)subsectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subsections objectAtIndex:a3];
}

+ (Class)subsectionsType
{
  return (Class)objc_opt_class();
}

- (void)setSubsectionPriority:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_subsectionPriority = a3;
}

- (void)setHasSubsectionPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSubsectionPriority
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVersion
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasFactorySectionID
{
  return self->_factorySectionID != 0;
}

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setIconsStripped:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_iconsStripped = a3;
}

- (void)setHasIconsStripped:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIconsStripped
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPhoneAllowsNotifications:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_phoneAllowsNotifications = a3;
}

- (void)setHasPhoneAllowsNotifications:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasPhoneAllowsNotifications
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCriticalAlertSetting:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_criticalAlertSetting = a3;
}

- (void)setHasCriticalAlertSetting:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasCriticalAlertSetting
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)groupingSetting
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_groupingSetting;
  }
  else {
    return 0;
  }
}

- (void)setGroupingSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_groupingSetting = a3;
}

- (void)setHasGroupingSetting:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGroupingSetting
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)groupingSettingAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264684C98[a3];
  }
  return v3;
}

- (int)StringAsGroupingSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Section"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setExcludeFromBulletinBoard:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_excludeFromBulletinBoard = a3;
}

- (void)setHasExcludeFromBulletinBoard:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasExcludeFromBulletinBoard
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAuthorizationStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAuthorizationStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPhoneAuthorizationStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_phoneAuthorizationStatus = a3;
}

- (void)setHasPhoneAuthorizationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPhoneAuthorizationStatus
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (int)lockScreenSetting
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_lockScreenSetting;
  }
  else {
    return 0;
  }
}

- (void)setLockScreenSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lockScreenSetting = a3;
}

- (void)setHasLockScreenSetting:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLockScreenSetting
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)lockScreenSettingAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264684CB0[a3];
  }
  return v3;
}

- (int)StringAsLockScreenSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSupported"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Enabled"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)notificationCenterSetting
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_notificationCenterSetting;
  }
  else {
    return 0;
  }
}

- (void)setNotificationCenterSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_notificationCenterSetting = a3;
}

- (void)setHasNotificationCenterSetting:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNotificationCenterSetting
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)notificationCenterSettingAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264684CB0[a3];
  }
  return v3;
}

- (int)StringAsNotificationCenterSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSupported"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Enabled"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)spokenNotificationSetting
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_spokenNotificationSetting;
  }
  else {
    return 0;
  }
}

- (void)setSpokenNotificationSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_spokenNotificationSetting = a3;
}

- (void)setHasSpokenNotificationSetting:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSpokenNotificationSetting
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)spokenNotificationSettingAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264684CB0[a3];
  }
  return v3;
}

- (int)StringAsSpokenNotificationSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSupported"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Enabled"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasWatchSectionID
{
  return self->_watchSectionID != 0;
}

- (void)setAuthorizationExpirationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_authorizationExpirationDate = a3;
}

- (void)setHasAuthorizationExpirationDate:(BOOL)a3
{
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAuthorizationExpirationDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLastUserGrantedAuthorizationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_lastUserGrantedAuthorizationDate = a3;
}

- (void)setHasLastUserGrantedAuthorizationDate:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLastUserGrantedAuthorizationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSectionInfoSettings
{
  return self->_sectionInfoSettings != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionInfo;
  int v4 = [(BLTPBSectionInfo *)&v8 description];
  v5 = [(BLTPBSectionInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  subsectionID = self->_subsectionID;
  if (subsectionID) {
    [v4 setObject:subsectionID forKey:@"subsectionID"];
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v26 = [NSNumber numberWithInt:self->_sectionType];
    [v4 setObject:v26 forKey:@"sectionType"];

    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  v27 = [NSNumber numberWithInt:self->_sectionCategory];
  [v4 setObject:v27 forKey:@"sectionCategory"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_55;
  }
LABEL_54:
  v28 = [NSNumber numberWithBool:self->_suppressFromSettings];
  [v4 setObject:v28 forKey:@"suppressFromSettings"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_56;
  }
LABEL_55:
  v29 = [NSNumber numberWithBool:self->_showsInNotificationCenter];
  [v4 setObject:v29 forKey:@"showsInNotificationCenter"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  v30 = [NSNumber numberWithBool:self->_showsInLockScreen];
  [v4 setObject:v30 forKey:@"showsInLockScreen"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_58;
  }
LABEL_57:
  v31 = [NSNumber numberWithBool:self->_showsOnExternalDevices];
  [v4 setObject:v31 forKey:@"showsOnExternalDevices"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_59;
  }
LABEL_58:
  v32 = [NSNumber numberWithUnsignedInt:self->_notificationCenterLimit];
  [v4 setObject:v32 forKey:@"notificationCenterLimit"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_60;
  }
LABEL_59:
  v33 = [NSNumber numberWithUnsignedInt:self->_pushSettings];
  [v4 setObject:v33 forKey:@"pushSettings"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_61;
  }
LABEL_60:
  v34 = [NSNumber numberWithUnsignedInt:self->_alertType];
  [v4 setObject:v34 forKey:@"alertType"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_62;
  }
LABEL_61:
  v35 = [NSNumber numberWithBool:self->_showsMessagePreview];
  [v4 setObject:v35 forKey:@"showsMessagePreview"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_62:
  v36 = [NSNumber numberWithBool:self->_allowsNotifications];
  [v4 setObject:v36 forKey:@"allowsNotifications"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_suppressedSettings];
    [v4 setObject:v8 forKey:@"suppressedSettings"];
  }
LABEL_18:
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_displaysCriticalBulletinsLegacy];
    [v4 setObject:v10 forKey:@"displaysCriticalBulletinsLegacy"];
  }
  if ([(NSMutableArray *)self->_subsections count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_subsections, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v12 = self->_subsections;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v60 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [*(id *)(*((void *)&v59 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"subsections"];
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    uint64_t v19 = [NSNumber numberWithInt:self->_subsectionPriority];
    [v4 setObject:v19 forKey:@"subsectionPriority"];

    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v18 = self->_has;
  }
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    v20 = [NSNumber numberWithUnsignedInt:self->_version];
    [v4 setObject:v20 forKey:@"version"];
  }
  factorySectionID = self->_factorySectionID;
  if (factorySectionID) {
    [v4 setObject:factorySectionID forKey:@"factorySectionID"];
  }
  universalSectionID = self->_universalSectionID;
  if (universalSectionID) {
    [v4 setObject:universalSectionID forKey:@"universalSectionID"];
  }
  icon = self->_icon;
  if (icon)
  {
    v24 = [(BLTPBSectionIcon *)icon dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"icon"];
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x100000) != 0)
  {
    v37 = [NSNumber numberWithBool:self->_iconsStripped];
    [v4 setObject:v37 forKey:@"iconsStripped"];

    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
    if ((*(_DWORD *)&v25 & 0x200000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v25 & 0x20000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
    goto LABEL_43;
  }
  v38 = [NSNumber numberWithBool:self->_phoneAllowsNotifications];
  [v4 setObject:v38 forKey:@"phoneAllowsNotifications"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v25 & 0x10) == 0) {
      goto LABEL_45;
    }
    goto LABEL_67;
  }
LABEL_66:
  v39 = [NSNumber numberWithBool:self->_criticalAlertSetting];
  [v4 setObject:v39 forKey:@"criticalAlertSetting"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x10) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v25 & 0x80000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_71;
  }
LABEL_67:
  uint64_t groupingSetting = self->_groupingSetting;
  if (groupingSetting >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupingSetting);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_264684C98[groupingSetting];
  }
  [v4 setObject:v41 forKey:@"groupingSetting"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x80000) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v25 & 8) == 0) {
      goto LABEL_47;
    }
    goto LABEL_72;
  }
LABEL_71:
  v42 = [NSNumber numberWithBool:self->_excludeFromBulletinBoard];
  [v4 setObject:v42 forKey:@"excludeFromBulletinBoard"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(unsigned char *)&v25 & 8) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v25 & 0x100) == 0) {
      goto LABEL_48;
    }
    goto LABEL_73;
  }
LABEL_72:
  v43 = [NSNumber numberWithInt:self->_authorizationStatus];
  [v4 setObject:v43 forKey:@"authorizationStatus"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v25 & 0x20) == 0) {
      goto LABEL_49;
    }
    goto LABEL_74;
  }
LABEL_73:
  v44 = [NSNumber numberWithInt:self->_phoneAuthorizationStatus];
  [v4 setObject:v44 forKey:@"phoneAuthorizationStatus"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x20) == 0)
  {
LABEL_49:
    if ((*(unsigned char *)&v25 & 0x80) == 0) {
      goto LABEL_50;
    }
    goto LABEL_78;
  }
LABEL_74:
  uint64_t lockScreenSetting = self->_lockScreenSetting;
  if (lockScreenSetting >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_lockScreenSetting);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_264684CB0[lockScreenSetting];
  }
  [v4 setObject:v46 forKey:@"lockScreenSetting"];

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v25 & 0x1000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_82;
  }
LABEL_78:
  uint64_t notificationCenterSetting = self->_notificationCenterSetting;
  if (notificationCenterSetting >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_notificationCenterSetting);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_264684CB0[notificationCenterSetting];
  }
  [v4 setObject:v48 forKey:@"notificationCenterSetting"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_82:
    uint64_t spokenNotificationSetting = self->_spokenNotificationSetting;
    if (spokenNotificationSetting >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_spokenNotificationSetting);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = off_264684CB0[spokenNotificationSetting];
    }
    [v4 setObject:v50 forKey:@"spokenNotificationSetting"];
  }
LABEL_86:
  watchSectionID = self->_watchSectionID;
  if (watchSectionID) {
    [v4 setObject:watchSectionID forKey:@"watchSectionID"];
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v52 = self->_has;
  if (*(unsigned char *)&v52)
  {
    v53 = [NSNumber numberWithDouble:self->_authorizationExpirationDate];
    [v4 setObject:v53 forKey:@"authorizationExpirationDate"];

    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v52 = self->_has;
  }
  if ((*(unsigned char *)&v52 & 2) != 0)
  {
    v54 = [NSNumber numberWithDouble:self->_lastUserGrantedAuthorizationDate];
    [v4 setObject:v54 forKey:@"lastUserGrantedAuthorizationDate"];
  }
  sectionInfoSettings = self->_sectionInfoSettings;
  if (sectionInfoSettings)
  {
    v56 = [(BLTPBSectionInfoSettings *)sectionInfoSettings dictionaryRepresentation];
    [v4 setObject:v56 forKey:@"sectionInfoSettings"];
  }
  id v57 = v4;

  return v57;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_subsectionID) {
    PBDataWriterWriteStringField();
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_subsections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = self->_has;
  }
  if ((*(_WORD *)&v11 & 0x8000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_factorySectionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_universalSectionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_icon) {
    PBDataWriterWriteSubmessage();
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v12 & 0x20000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v12 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 8) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v12 & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x20) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v12 & 0x80) == 0) {
      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v12 & 0x1000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_49:
  }
    PBDataWriterWriteInt32Field();
LABEL_50:
  if (self->_watchSectionID) {
    PBDataWriterWriteStringField();
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13 = self->_has;
  if (*(unsigned char *)&v13)
  {
    PBDataWriterWriteDoubleField();
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13 = self->_has;
  }
  if ((*(unsigned char *)&v13 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sectionInfoSettings) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  long long v14 = v4;
  if (self->_sectionID)
  {
    objc_msgSend(v4, "setSectionID:");
    id v4 = v14;
  }
  if (self->_subsectionID)
  {
    objc_msgSend(v14, "setSubsectionID:");
    id v4 = v14;
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v4[26] = self->_sectionType;
    v4[45] |= 0x800u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  v4[21] = self->_sectionCategory;
  v4[45] |= 0x400u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)v4 + 178) = self->_suppressFromSettings;
  v4[45] |= 0x4000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((unsigned char *)v4 + 175) = self->_showsInNotificationCenter;
  v4[45] |= 0x800000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((unsigned char *)v4 + 174) = self->_showsInLockScreen;
  v4[45] |= 0x400000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((unsigned char *)v4 + 177) = self->_showsOnExternalDevices;
  v4[45] |= 0x2000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  v4[17] = self->_notificationCenterLimit;
  v4[45] |= 0x40u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_66;
  }
LABEL_65:
  v4[20] = self->_pushSettings;
  v4[45] |= 0x200u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
LABEL_66:
  v4[6] = self->_alertType;
  v4[45] |= 4u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((unsigned char *)v4 + 176) = self->_showsMessagePreview;
  v4[45] |= 0x1000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_68:
  *((unsigned char *)v4 + 168) = self->_allowsNotifications;
  v4[45] |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    v4[34] = self->_suppressedSettings;
    v4[45] |= 0x4000u;
  }
LABEL_18:
  if (self->_displayName)
  {
    objc_msgSend(v14, "setDisplayName:");
    id v4 = v14;
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((unsigned char *)v4 + 170) = self->_displaysCriticalBulletinsLegacy;
    v4[45] |= 0x40000u;
  }
  if ([(BLTPBSectionInfo *)self subsectionsCount])
  {
    [v14 clearSubsections];
    unint64_t v6 = [(BLTPBSectionInfo *)self subsectionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BLTPBSectionInfo *)self subsectionsAtIndex:i];
        [v14 addSubsections:v9];
      }
    }
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v10 = self->_has;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    v14[30] = self->_subsectionPriority;
    v14[45] |= 0x2000u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    v14[38] = self->_version;
    v14[45] |= 0x8000u;
  }
  if (self->_factorySectionID)
  {
    objc_msgSend(v14, "setFactorySectionID:");
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  }
  if (self->_universalSectionID)
  {
    objc_msgSend(v14, "setUniversalSectionID:");
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  }
  if (self->_icon)
  {
    objc_msgSend(v14, "setIcon:");
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    *((unsigned char *)v11 + 172) = self->_iconsStripped;
    v11[45] |= 0x100000u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v12 & 0x20000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
    goto LABEL_38;
  }
  *((unsigned char *)v11 + 173) = self->_phoneAllowsNotifications;
  v11[45] |= 0x200000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((unsigned char *)v11 + 169) = self->_criticalAlertSetting;
  v11[45] |= 0x20000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_74;
  }
LABEL_73:
  v11[12] = self->_groupingSetting;
  v11[45] |= 0x10u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v12 & 8) == 0) {
      goto LABEL_42;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((unsigned char *)v11 + 171) = self->_excludeFromBulletinBoard;
  v11[45] |= 0x80000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 8) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v12 & 0x100) == 0) {
      goto LABEL_43;
    }
    goto LABEL_76;
  }
LABEL_75:
  v11[7] = self->_authorizationStatus;
  v11[45] |= 8u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v12 & 0x20) == 0) {
      goto LABEL_44;
    }
    goto LABEL_77;
  }
LABEL_76:
  v11[19] = self->_phoneAuthorizationStatus;
  v11[45] |= 0x100u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x20) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v12 & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_78;
  }
LABEL_77:
  v11[16] = self->_lockScreenSetting;
  v11[45] |= 0x20u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x1000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_78:
  v11[18] = self->_notificationCenterSetting;
  v11[45] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_46:
    v11[27] = self->_spokenNotificationSetting;
    v11[45] |= 0x1000u;
  }
LABEL_47:
  if (self->_watchSectionID)
  {
    objc_msgSend(v14, "setWatchSectionID:");
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13 = self->_has;
  if (*(unsigned char *)&v13)
  {
    *((void *)v11 + 1) = *(void *)&self->_authorizationExpirationDate;
    v11[45] |= 1u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13 = self->_has;
  }
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    *((void *)v11 + 2) = *(void *)&self->_lastUserGrantedAuthorizationDate;
    v11[45] |= 2u;
  }
  if (self->_sectionInfoSettings)
  {
    objc_msgSend(v14, "setSectionInfoSettings:");
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sectionID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  uint64_t v8 = [(NSString *)self->_subsectionID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v8;

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_sectionType;
    *(_DWORD *)(v5 + 180) |= 0x800u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 84) = self->_sectionCategory;
  *(_DWORD *)(v5 + 180) |= 0x400u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 178) = self->_suppressFromSettings;
  *(_DWORD *)(v5 + 180) |= 0x4000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(unsigned char *)(v5 + 175) = self->_showsInNotificationCenter;
  *(_DWORD *)(v5 + 180) |= 0x800000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v5 + 174) = self->_showsInLockScreen;
  *(_DWORD *)(v5 + 180) |= 0x400000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(unsigned char *)(v5 + 177) = self->_showsOnExternalDevices;
  *(_DWORD *)(v5 + 180) |= 0x2000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 68) = self->_notificationCenterLimit;
  *(_DWORD *)(v5 + 180) |= 0x40u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 80) = self->_pushSettings;
  *(_DWORD *)(v5 + 180) |= 0x200u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 24) = self->_alertType;
  *(_DWORD *)(v5 + 180) |= 4u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(unsigned char *)(v5 + 176) = self->_showsMessagePreview;
  *(_DWORD *)(v5 + 180) |= 0x1000000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_53:
  *(unsigned char *)(v5 + 168) = self->_allowsNotifications;
  *(_DWORD *)(v5 + 180) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 136) = self->_suppressedSettings;
    *(_DWORD *)(v5 + 180) |= 0x4000u;
  }
LABEL_14:
  uint64_t v11 = [(NSString *)self->_displayName copyWithZone:a3];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *(unsigned char *)(v5 + 170) = self->_displaysCriticalBulletinsLegacy;
    *(_DWORD *)(v5 + 180) |= 0x40000u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13 = self->_subsections;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        $DDB6F6B01A4DE5A47F3A13CA47B8E55C v18 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v17), "copyWithZone:", a3, (void)v33);
        [(id)v5 addSubsections:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v15);
  }

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_subsectionPriority;
    *(_DWORD *)(v5 + 180) |= 0x2000u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v19 = self->_has;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_version;
    *(_DWORD *)(v5 + 180) |= 0x8000u;
  }
  uint64_t v20 = -[NSString copyWithZone:](self->_factorySectionID, "copyWithZone:", a3, (void)v33);
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  uint64_t v22 = [(NSString *)self->_universalSectionID copyWithZone:a3];
  v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  id v24 = [(BLTPBSectionIcon *)self->_icon copyWithZone:a3];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    *(unsigned char *)(v5 + 172) = self->_iconsStripped;
    *(_DWORD *)(v5 + 180) |= 0x100000u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x200000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v26 & 0x20000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x200000) == 0)
  {
    goto LABEL_29;
  }
  *(unsigned char *)(v5 + 173) = self->_phoneAllowsNotifications;
  *(_DWORD *)(v5 + 180) |= 0x200000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x20000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v26 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(unsigned char *)(v5 + 169) = self->_criticalAlertSetting;
  *(_DWORD *)(v5 + 180) |= 0x20000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v26 & 0x80000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 48) = self->_groupingSetting;
  *(_DWORD *)(v5 + 180) |= 0x10u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v26 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(unsigned char *)(v5 + 171) = self->_excludeFromBulletinBoard;
  *(_DWORD *)(v5 + 180) |= 0x80000u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(unsigned char *)&v26 & 8) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v26 & 0x100) == 0) {
      goto LABEL_34;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 28) = self->_authorizationStatus;
  *(_DWORD *)(v5 + 180) |= 8u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x100) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v26 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 76) = self->_phoneAuthorizationStatus;
  *(_DWORD *)(v5 + 180) |= 0x100u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v26 & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 64) = self->_lockScreenSetting;
  *(_DWORD *)(v5 + 180) |= 0x20u;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x80) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v26 & 0x1000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_63:
  *(_DWORD *)(v5 + 72) = self->_notificationCenterSetting;
  *(_DWORD *)(v5 + 180) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_37:
    *(_DWORD *)(v5 + 108) = self->_spokenNotificationSetting;
    *(_DWORD *)(v5 + 180) |= 0x1000u;
  }
LABEL_38:
  uint64_t v27 = [(NSString *)self->_watchSectionID copyWithZone:a3];
  v28 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v27;

  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v29 = self->_has;
  if (*(unsigned char *)&v29)
  {
    *(double *)(v5 + 8) = self->_authorizationExpirationDate;
    *(_DWORD *)(v5 + 180) |= 1u;
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C v29 = self->_has;
  }
  if ((*(unsigned char *)&v29 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUserGrantedAuthorizationDate;
    *(_DWORD *)(v5 + 180) |= 2u;
  }
  id v30 = [(BLTPBSectionInfoSettings *)self->_sectionInfoSettings copyWithZone:a3];
  v31 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_191;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_191;
    }
  }
  subsectionID = self->_subsectionID;
  if ((unint64_t)subsectionID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](subsectionID, "isEqual:")) {
      goto LABEL_191;
    }
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  int v8 = *((_DWORD *)v4 + 45);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_sectionType != *((_DWORD *)v4 + 26)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_sectionCategory != *((_DWORD *)v4 + 21)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0) {
      goto LABEL_191;
    }
    if (self->_suppressFromSettings)
    {
      if (!*((unsigned char *)v4 + 178)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 178))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0) {
      goto LABEL_191;
    }
    if (self->_showsInNotificationCenter)
    {
      if (!*((unsigned char *)v4 + 175)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 175))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0) {
      goto LABEL_191;
    }
    if (self->_showsInLockScreen)
    {
      if (!*((unsigned char *)v4 + 174)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 174))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0) {
      goto LABEL_191;
    }
    if (self->_showsOnExternalDevices)
    {
      if (!*((unsigned char *)v4 + 177)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 177))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_notificationCenterLimit != *((_DWORD *)v4 + 17)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_pushSettings != *((_DWORD *)v4 + 20)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_alertType != *((_DWORD *)v4 + 6)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0) {
      goto LABEL_191;
    }
    if (self->_showsMessagePreview)
    {
      if (!*((unsigned char *)v4 + 176)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 176))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0) {
      goto LABEL_191;
    }
    if (self->_allowsNotifications)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_suppressedSettings != *((_DWORD *)v4 + 34)) {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_191;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_191;
    }
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0) {
      goto LABEL_191;
    }
    if (self->_displaysCriticalBulletinsLegacy)
    {
      if (!*((unsigned char *)v4 + 170)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 170))
    {
      goto LABEL_191;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_191;
  }
  subsections = self->_subsections;
  if ((unint64_t)subsections | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](subsections, "isEqual:")) {
      goto LABEL_191;
    }
    $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  }
  int v12 = *((_DWORD *)v4 + 45);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_subsectionPriority != *((_DWORD *)v4 + 30)) {
      goto LABEL_191;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_version != *((_DWORD *)v4 + 38)) {
      goto LABEL_191;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_191;
  }
  factorySectionID = self->_factorySectionID;
  if ((unint64_t)factorySectionID | *((void *)v4 + 5)
    && !-[NSString isEqual:](factorySectionID, "isEqual:"))
  {
    goto LABEL_191;
  }
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:")) {
      goto LABEL_191;
    }
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 7))
  {
    if (!-[BLTPBSectionIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_191;
    }
  }
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v16 = self->_has;
  int v17 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0) {
      goto LABEL_191;
    }
    if (self->_iconsStripped)
    {
      if (!*((unsigned char *)v4 + 172)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 172))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0) {
      goto LABEL_191;
    }
    if (self->_phoneAllowsNotifications)
    {
      if (!*((unsigned char *)v4 + 173)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 173))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0) {
      goto LABEL_191;
    }
    if (self->_criticalAlertSetting)
    {
      if (!*((unsigned char *)v4 + 169)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 169))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_groupingSetting != *((_DWORD *)v4 + 12)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0) {
      goto LABEL_191;
    }
    if (self->_excludeFromBulletinBoard)
    {
      if (!*((unsigned char *)v4 + 171)) {
        goto LABEL_191;
      }
    }
    else if (*((unsigned char *)v4 + 171))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_authorizationStatus != *((_DWORD *)v4 + 7)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_phoneAuthorizationStatus != *((_DWORD *)v4 + 19)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_lockScreenSetting != *((_DWORD *)v4 + 16)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_notificationCenterSetting != *((_DWORD *)v4 + 18)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_spokenNotificationSetting != *((_DWORD *)v4 + 27)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_191;
  }
  watchSectionID = self->_watchSectionID;
  if ((unint64_t)watchSectionID | *((void *)v4 + 20))
  {
    if (-[NSString isEqual:](watchSectionID, "isEqual:"))
    {
      $DDB6F6B01A4DE5A47F3A13CA47B8E55C v16 = self->_has;
      goto LABEL_179;
    }
LABEL_191:
    char v21 = 0;
    goto LABEL_192;
  }
LABEL_179:
  int v19 = *((_DWORD *)v4 + 45);
  if (*(unsigned char *)&v16)
  {
    if ((v19 & 1) == 0 || self->_authorizationExpirationDate != *((double *)v4 + 1)) {
      goto LABEL_191;
    }
  }
  else if (v19)
  {
    goto LABEL_191;
  }
  if ((*(unsigned char *)&v16 & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_lastUserGrantedAuthorizationDate != *((double *)v4 + 2)) {
      goto LABEL_191;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_191;
  }
  sectionInfoSettings = self->_sectionInfoSettings;
  if ((unint64_t)sectionInfoSettings | *((void *)v4 + 12)) {
    char v21 = -[BLTPBSectionInfoSettings isEqual:](sectionInfoSettings, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_192:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v51 = [(NSString *)self->_sectionID hash];
  NSUInteger v50 = [(NSString *)self->_subsectionID hash];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    uint64_t v49 = 2654435761 * self->_sectionType;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v48 = 2654435761 * self->_sectionCategory;
      if ((*(_DWORD *)&has & 0x4000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    uint64_t v47 = 2654435761 * self->_suppressFromSettings;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_5:
    uint64_t v46 = 2654435761 * self->_showsInNotificationCenter;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_6:
    uint64_t v45 = 2654435761 * self->_showsInLockScreen;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    uint64_t v44 = 2654435761 * self->_showsOnExternalDevices;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v43 = 2654435761 * self->_notificationCenterLimit;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v43 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v42 = 2654435761 * self->_pushSettings;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v42 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_10:
    uint64_t v41 = 2654435761 * self->_alertType;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v41 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    uint64_t v40 = 2654435761 * self->_showsMessagePreview;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v39 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v39 = 2654435761 * self->_allowsNotifications;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    uint64_t v38 = 2654435761 * self->_suppressedSettings;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v38 = 0;
LABEL_26:
  NSUInteger v37 = [(NSString *)self->_displayName hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v36 = 2654435761 * self->_displaysCriticalBulletinsLegacy;
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v35 = [(NSMutableArray *)self->_subsections hash];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_subsectionPriority;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
    {
LABEL_31:
      uint64_t v33 = 2654435761 * self->_version;
      goto LABEL_34;
    }
  }
  uint64_t v33 = 0;
LABEL_34:
  NSUInteger v32 = [(NSString *)self->_factorySectionID hash];
  NSUInteger v31 = [(NSString *)self->_universalSectionID hash];
  unint64_t v30 = [(BLTPBSectionIcon *)self->_icon hash];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v29 = 2654435761 * self->_iconsStripped;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
    {
LABEL_36:
      uint64_t v28 = 2654435761 * self->_phoneAllowsNotifications;
      if ((*(_DWORD *)&v5 & 0x20000) != 0) {
        goto LABEL_37;
      }
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v5 & 0x200000) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_37:
    uint64_t v27 = 2654435761 * self->_criticalAlertSetting;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_38;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&v5 & 0x10) != 0)
  {
LABEL_38:
    uint64_t v26 = 2654435761 * self->_groupingSetting;
    if ((*(_DWORD *)&v5 & 0x80000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_39:
    uint64_t v24 = 2654435761 * self->_excludeFromBulletinBoard;
    if ((*(unsigned char *)&v5 & 8) != 0) {
      goto LABEL_40;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
LABEL_40:
    uint64_t v6 = 2654435761 * self->_authorizationStatus;
    if ((*(_WORD *)&v5 & 0x100) != 0) {
      goto LABEL_41;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v6 = 0;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
LABEL_41:
    uint64_t v7 = 2654435761 * self->_phoneAuthorizationStatus;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_42;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
LABEL_42:
    uint64_t v8 = 2654435761 * self->_lockScreenSetting;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_43;
    }
LABEL_53:
    uint64_t v9 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_54;
  }
LABEL_52:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v5 & 0x80) == 0) {
    goto LABEL_53;
  }
LABEL_43:
  uint64_t v9 = 2654435761 * self->_notificationCenterSetting;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_44:
    uint64_t v10 = 2654435761 * self->_spokenNotificationSetting;
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v10 = 0;
LABEL_55:
  NSUInteger v11 = [(NSString *)self->_watchSectionID hash];
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12 = self->_has;
  if (*(unsigned char *)&v12)
  {
    double authorizationExpirationDate = self->_authorizationExpirationDate;
    double v15 = -authorizationExpirationDate;
    if (authorizationExpirationDate >= 0.0) {
      double v15 = self->_authorizationExpirationDate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    double lastUserGrantedAuthorizationDate = self->_lastUserGrantedAuthorizationDate;
    double v20 = -lastUserGrantedAuthorizationDate;
    if (lastUserGrantedAuthorizationDate >= 0.0) {
      double v20 = self->_lastUserGrantedAuthorizationDate;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18 ^ [(BLTPBSectionInfoSettings *)self->_sectionInfoSettings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 11)) {
    -[BLTPBSectionInfo setSectionID:](self, "setSectionID:");
  }
  if (*((void *)v4 + 14)) {
    -[BLTPBSectionInfo setSubsectionID:](self, "setSubsectionID:");
  }
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x800) != 0)
  {
    self->_sectionType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x800u;
    int v5 = *((_DWORD *)v4 + 45);
    if ((v5 & 0x400) == 0)
    {
LABEL_7:
      if ((v5 & 0x4000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_42;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_7;
  }
  self->_sectionCategory = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_suppressFromSettings = *((unsigned char *)v4 + 178);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_showsInNotificationCenter = *((unsigned char *)v4 + 175);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x400000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_showsInLockScreen = *((unsigned char *)v4 + 174);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_showsOnExternalDevices = *((unsigned char *)v4 + 177);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_notificationCenterLimit = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_pushSettings = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_alertType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_showsMessagePreview = *((unsigned char *)v4 + 176);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_50:
  self->_allowsNotifications = *((unsigned char *)v4 + 168);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 45) & 0x4000) != 0)
  {
LABEL_17:
    self->_suppressedSettings = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_18:
  if (*((void *)v4 + 4)) {
    -[BLTPBSectionInfo setDisplayName:](self, "setDisplayName:");
  }
  if ((*((unsigned char *)v4 + 182) & 4) != 0)
  {
    self->_displaysCriticalBulletinsLegacy = *((unsigned char *)v4 + 170);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = *((id *)v4 + 16);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BLTPBSectionInfo addSubsections:](self, "addSubsections:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v4 + 45);
  if ((v11 & 0x2000) != 0)
  {
    self->_subsectionPriority = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v11 = *((_DWORD *)v4 + 45);
  }
  if ((v11 & 0x8000) != 0)
  {
    self->_version = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 5)) {
    -[BLTPBSectionInfo setFactorySectionID:](self, "setFactorySectionID:");
  }
  if (*((void *)v4 + 18)) {
    -[BLTPBSectionInfo setUniversalSectionID:](self, "setUniversalSectionID:");
  }
  icon = self->_icon;
  uint64_t v13 = *((void *)v4 + 7);
  if (icon)
  {
    if (v13) {
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[BLTPBSectionInfo setIcon:](self, "setIcon:");
  }
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x100000) != 0)
  {
    self->_iconsStripped = *((unsigned char *)v4 + 172);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v14 = *((_DWORD *)v4 + 45);
    if ((v14 & 0x200000) == 0)
    {
LABEL_56:
      if ((v14 & 0x20000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_76;
    }
  }
  else if ((v14 & 0x200000) == 0)
  {
    goto LABEL_56;
  }
  self->_phoneAllowsNotifications = *((unsigned char *)v4 + 173);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x20000) == 0)
  {
LABEL_57:
    if ((v14 & 0x10) == 0) {
      goto LABEL_58;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_criticalAlertSetting = *((unsigned char *)v4 + 169);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x10) == 0)
  {
LABEL_58:
    if ((v14 & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_uint64_t groupingSetting = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x10u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x80000) == 0)
  {
LABEL_59:
    if ((v14 & 8) == 0) {
      goto LABEL_60;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_excludeFromBulletinBoard = *((unsigned char *)v4 + 171);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 8) == 0)
  {
LABEL_60:
    if ((v14 & 0x100) == 0) {
      goto LABEL_61;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_authorizationStatus = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 8u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x100) == 0)
  {
LABEL_61:
    if ((v14 & 0x20) == 0) {
      goto LABEL_62;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_phoneAuthorizationStatus = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x100u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x20) == 0)
  {
LABEL_62:
    if ((v14 & 0x80) == 0) {
      goto LABEL_63;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_uint64_t lockScreenSetting = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x20u;
  int v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x80) == 0)
  {
LABEL_63:
    if ((v14 & 0x1000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_82:
  self->_uint64_t notificationCenterSetting = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v4 + 45) & 0x1000) != 0)
  {
LABEL_64:
    self->_uint64_t spokenNotificationSetting = *((_DWORD *)v4 + 27);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_65:
  if (*((void *)v4 + 20)) {
    -[BLTPBSectionInfo setWatchSectionID:](self, "setWatchSectionID:");
  }
  int v15 = *((_DWORD *)v4 + 45);
  if (v15)
  {
    self->_double authorizationExpirationDate = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v15 = *((_DWORD *)v4 + 45);
  }
  if ((v15 & 2) != 0)
  {
    self->_double lastUserGrantedAuthorizationDate = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
  sectionInfoSettings = self->_sectionInfoSettings;
  uint64_t v17 = *((void *)v4 + 12);
  if (sectionInfoSettings)
  {
    if (v17) {
      -[BLTPBSectionInfoSettings mergeFrom:](sectionInfoSettings, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[BLTPBSectionInfo setSectionInfoSettings:](self, "setSectionInfoSettings:");
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)subsectionID
{
  return self->_subsectionID;
}

- (void)setSubsectionID:(id)a3
{
}

- (int)sectionType
{
  return self->_sectionType;
}

- (int)sectionCategory
{
  return self->_sectionCategory;
}

- (BOOL)suppressFromSettings
{
  return self->_suppressFromSettings;
}

- (BOOL)showsInNotificationCenter
{
  return self->_showsInNotificationCenter;
}

- (BOOL)showsInLockScreen
{
  return self->_showsInLockScreen;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (unsigned)notificationCenterLimit
{
  return self->_notificationCenterLimit;
}

- (unsigned)pushSettings
{
  return self->_pushSettings;
}

- (unsigned)alertType
{
  return self->_alertType;
}

- (BOOL)showsMessagePreview
{
  return self->_showsMessagePreview;
}

- (BOOL)allowsNotifications
{
  return self->_allowsNotifications;
}

- (unsigned)suppressedSettings
{
  return self->_suppressedSettings;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)displaysCriticalBulletinsLegacy
{
  return self->_displaysCriticalBulletinsLegacy;
}

- (NSMutableArray)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
}

- (int)subsectionPriority
{
  return self->_subsectionPriority;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)factorySectionID
{
  return self->_factorySectionID;
}

- (void)setFactorySectionID:(id)a3
{
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)iconsStripped
{
  return self->_iconsStripped;
}

- (BOOL)phoneAllowsNotifications
{
  return self->_phoneAllowsNotifications;
}

- (BOOL)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (BOOL)excludeFromBulletinBoard
{
  return self->_excludeFromBulletinBoard;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (int)phoneAuthorizationStatus
{
  return self->_phoneAuthorizationStatus;
}

- (NSString)watchSectionID
{
  return self->_watchSectionID;
}

- (void)setWatchSectionID:(id)a3
{
}

- (double)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (double)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (BLTPBSectionInfoSettings)sectionInfoSettings
{
  return self->_sectionInfoSettings;
}

- (void)setSectionInfoSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchSectionID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_subsectionID, 0);
  objc_storeStrong((id *)&self->_sectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_factorySectionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end