@interface EKCalendar
+ (BOOL)isWeakRelationship;
+ (Class)frozenClass;
+ (EKCalendar)calendarForEntityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore;
+ (EKCalendar)calendarWithEventStore:(EKEventStore *)eventStore;
+ (id)EKObjectChangeSummarizer_multiValueDiffKeys;
+ (id)EKObjectChangeSummarizer_singleValueDiffKeys;
+ (id)_eventKitBundle;
+ (id)calendarForEntityTypes:(unint64_t)a3 eventStore:(id)a4;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipMultiValueKeys;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)orderSortDescriptors;
+ (id)rowIDsForCalendars:(id)a3;
+ (id)typeDescription:(int64_t)a3;
- (BOOL)_anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:(id)a3;
- (BOOL)_anotherCalendarForRemindersExistsWithAllKnownCalendars:(id)a3;
- (BOOL)_anyCalendarExistsInSameSourceOfType:(unint64_t)a3 withAllKnownCalendars:(id)a4 passingTest:(id)a5;
- (BOOL)_flagValueWithMask:(unsigned int)a3;
- (BOOL)_reset;
- (BOOL)_validateDeletable:(id *)a3;
- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3;
- (BOOL)_validateDeletableHelperWithAllKnownCalendars:(id)a3 error:(id *)a4;
- (BOOL)_validateDeletableWithAllKnownCalendars:(id)a3 error:(id *)a4;
- (BOOL)allowEvents;
- (BOOL)allowReminders;
- (BOOL)allowsContentModifications;
- (BOOL)allowsDeletionOrPropertyModifications;
- (BOOL)allowsIgnoringSharedEventChangeNotifications;
- (BOOL)allowsScheduling;
- (BOOL)automaticEventLocationGeocodingAllowed;
- (BOOL)canBePublished;
- (BOOL)canBeShared;
- (BOOL)canMergeWithCalendar:(id)a3;
- (BOOL)completable;
- (BOOL)couldBeJunk;
- (BOOL)eligibleForDefaultSchedulingCalendar;
- (BOOL)getColorRed:(double *)a3 green:(double *)a4 blue:(double *)a5;
- (BOOL)hasEvents;
- (BOOL)hasEventsWithRoomAsAttendee;
- (BOOL)hasSharees;
- (BOOL)isAffectingAvailability;
- (BOOL)isAlarmAcknowledgedPropertyDirty;
- (BOOL)isChinaHolidayCalendar;
- (BOOL)isColorDisplayOnly;
- (BOOL)isDefaultSchedulingCalendar;
- (BOOL)isDeletable;
- (BOOL)isDeletableWithAllKnownCalendars:(id)a3;
- (BOOL)isFacebookBirthdayCalendar;
- (BOOL)isFamilyCalendar;
- (BOOL)isHidden;
- (BOOL)isHolidayCalendar;
- (BOOL)isIgnoringEventAlerts;
- (BOOL)isIgnoringSharedCalendarNotifications;
- (BOOL)isImmutable;
- (BOOL)isImmutableRaw;
- (BOOL)isInbox;
- (BOOL)isManaged;
- (BOOL)isMarkedImmutableSharees;
- (BOOL)isMarkedUndeletable;
- (BOOL)isMutableNaturalLanguageSuggestionsCalendar;
- (BOOL)isMutableSuggestionsCalendar;
- (BOOL)isNaturalLanguageSuggestedEventCalendar;
- (BOOL)isNotificationsCollection;
- (BOOL)isPublished;
- (BOOL)isSharingInvitation;
- (BOOL)isSubscribed;
- (BOOL)isSubscribedCalendarJunk;
- (BOOL)isSubscribedHolidayCalendar;
- (BOOL)isSuggestedEventCalendar;
- (BOOL)isSyncedHolidayCalendar;
- (BOOL)isSyncing;
- (BOOL)prohibitsScheduling;
- (BOOL)readOnly;
- (BOOL)refresh;
- (BOOL)remove:(id *)a3;
- (BOOL)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:(id *)a3;
- (BOOL)save:(id *)a3;
- (BOOL)stripAlarms;
- (BOOL)stripAttachments;
- (BOOL)supportsJunkReporting;
- (BOOL)supportsMultipleAlarms;
- (BOOL)validate:(id *)a3;
- (CGColorRef)CGColor;
- (EKCalendar)init;
- (EKCalendarEventAvailabilityMask)supportedEventAvailabilities;
- (EKCalendarType)type;
- (EKEntityMask)allowedEntityTypes;
- (EKSource)source;
- (NSString)title;
- (id)UUID;
- (id)alarms;
- (id)allAlarms;
- (id)cachedExternalInfo;
- (id)cachedExternalInfoData;
- (id)calendarError;
- (id)colorString;
- (id)colorStringRaw;
- (id)constraints;
- (id)description;
- (id)digest;
- (id)exportData;
- (id)exportDataWithOptions:(unint64_t)a3;
- (id)externalID;
- (id)externalIDTag;
- (id)externalInfoForKey:(id)a3;
- (id)externalModificationTag;
- (id)externalRepresentation;
- (id)externalURI;
- (id)findOriginalAlarmStartingWith:(id)a3;
- (id)image;
- (id)lastSyncEndDate;
- (id)lastSyncErrorUserInfo;
- (id)lastSyncStartDate;
- (id)lastSyncTitle;
- (id)locale;
- (id)notes;
- (id)ownerIdentityAddress;
- (id)ownerIdentityAddressString;
- (id)ownerIdentityDisplayName;
- (id)ownerIdentityEmail;
- (id)ownerIdentityFirstName;
- (id)ownerIdentityLastName;
- (id)ownerIdentityOrganizer;
- (id)ownerIdentityPhoneNumber;
- (id)pubcalAccountID;
- (id)publishURL;
- (id)publishURLString;
- (id)pushKey;
- (id)refreshDate;
- (id)reorderCalendars:(id)a3 betweenEarlier:(id)a4 later:(id)a5;
- (id)selectionSyncIdentifier;
- selfIdentityAddress;
- selfIdentityAddressString;
- selfIdentityDisplayName;
- selfIdentityEmail;
- selfIdentityFirstName;
- selfIdentityLastName;
- selfIdentityPhoneNumber;
- (id)sharedOwnerAddress;
- (id)sharedOwnerAddresses;
- (id)sharedOwnerAddressesWithoutScheme;
- (id)sharedOwnerEmail;
- (id)sharedOwnerName;
- (id)sharedOwnerPhoneNumber;
- (id)sharedOwnerURL;
- (id)sharedOwnerURLString;
- (id)sharees;
- (id)shareesAndOwner;
- (id)subcalAccountID;
- (id)subcalURL;
- (id)subscriptionID;
- (id)symbolicColorName;
- (id)syncError;
- (id)syncHash;
- (id)syncToken;
- (id)unlocalizedTitle;
- (int)allowedEntities;
- (int)displayOrder;
- (int)entityType;
- (int)migrationVersion;
- (int)ownerIdentityId;
- (int)refreshInterval;
- (int64_t)deletionWarningsMask;
- (int64_t)maxAttendees;
- (unint64_t)cachedJunkStatus;
- (unint64_t)invitationStatus;
- (unint64_t)lastSyncError;
- (unint64_t)sharingInvitationResponse;
- (unint64_t)sharingStatus;
- (unsigned)flags;
- (void)_clearCGColorCache;
- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4;
- (void)_updateToMaxDisplayOrder;
- (void)addAlarms:(id)a3;
- (void)addSharee:(id)a3;
- (void)assignColorForNewCalendarIfNeeded;
- (void)calendarError;
- (void)clearInvitationStatus;
- (void)moveSubscribedCalendarToSource:(id)a3;
- (void)removeAcknowledgedSnoozedAlarms;
- (void)removeAlarms:(id)a3;
- (void)removeAllSnoozedAlarms;
- (void)removeSharee:(id)a3;
- (void)reorderBetweenEarlier:(id)a3 later:(id)a4;
- (void)reset;
- (void)rollback;
- (void)setAlarms:(id)a3;
- (void)setAllAlarms:(id)a3;
- (void)setAllowReminders:(BOOL)a3;
- (void)setAllowedEntities:(int)a3;
- (void)setAllowedEntityTypes:(unint64_t)a3;
- (void)setAllowsEvents:(BOOL)a3;
- (void)setAllowsScheduling:(BOOL)a3;
- (void)setCGColor:(CGColorRef)CGColor;
- (void)setCachedExternalInfo:(id)a3;
- (void)setCachedExternalInfoData:(id)a3;
- (void)setCachedJunkStatus:(unint64_t)a3;
- (void)setCanBePublished:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setChinaHolidayCalendar:(BOOL)a3;
- (void)setColorDisplayOnly:(BOOL)a3;
- (void)setColorString:(id)a3;
- (void)setColorStringRaw:(id)a3;
- (void)setCompletable:(BOOL)a3;
- (void)setDigest:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalIDTag:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setFacebookBirthdayCalendar:(BOOL)a3;
- (void)setFamilyCalendar:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImmutable:(BOOL)a3;
- (void)setInbox:(BOOL)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setIsAffectingAvailability:(BOOL)a3;
- (void)setIsDefaultSchedulingCalendar:(BOOL)a3;
- (void)setIsIgnoringEventAlerts:(BOOL)a3;
- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3;
- (void)setIsJunk:(BOOL)a3;
- (void)setIsPublished:(BOOL)a3;
- (void)setIsSubscribedCalendarJunk:(BOOL)a3;
- (void)setLastSyncEndDate:(id)a3;
- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4;
- (void)setLastSyncStartDate:(id)a3;
- (void)setLastSyncTitle:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMarkedImmutableSharees:(BOOL)a3;
- (void)setMarkedUndeletable:(BOOL)a3;
- (void)setMaxAttendees:(int64_t)a3;
- (void)setMigrationVersion:(int)a3;
- (void)setNotes:(id)a3;
- (void)setNotificationsCollection:(BOOL)a3;
- (void)setOwnerIdentityAddress:(id)a3;
- (void)setOwnerIdentityAddressString:(id)a3;
- (void)setOwnerIdentityDisplayName:(id)a3;
- (void)setOwnerIdentityEmail:(id)a3;
- (void)setOwnerIdentityFirstName:(id)a3;
- (void)setOwnerIdentityId:(int)a3;
- (void)setOwnerIdentityLastName:(id)a3;
- (void)setOwnerIdentityPhoneNumber:(id)a3;
- (void)setProhibitsScheduling:(BOOL)a3;
- (void)setPubcalAccountID:(id)a3;
- (void)setPublishURL:(id)a3;
- (void)setPublishURLString:(id)a3;
- (void)setPushKey:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRefreshDate:(id)a3;
- (void)setRefreshInterval:(int)a3;
- (void)setSelfIdentityAddress:(id)a3;
- (void)setSelfIdentityAddressString:(id)a3;
- (void)setSelfIdentityDisplayName:(id)a3;
- (void)setSelfIdentityEmail:(id)a3;
- (void)setSelfIdentityFirstName:(id)a3;
- (void)setSelfIdentityLastName:(id)a3;
- (void)setSelfIdentityPhoneNumber:(id)a3;
- (void)setSharedOwnerAddress:(id)a3;
- (void)setSharedOwnerName:(id)a3;
- (void)setSharedOwnerURL:(id)a3;
- (void)setSharedOwnerURLString:(id)a3;
- (void)setSharees:(id)a3;
- (void)setSharingInvitation:(BOOL)a3;
- (void)setSharingInvitationResponse:(unint64_t)a3;
- (void)setSharingStatus:(unint64_t)a3;
- (void)setSource:(EKSource *)source;
- (void)setStripAlarms:(BOOL)a3;
- (void)setStripAttachments:(BOOL)a3;
- (void)setSubcalAccountID:(id)a3;
- (void)setSubcalURL:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setSubscribedHolidayCalendar:(BOOL)a3;
- (void)setSubscriptionID:(id)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)setSyncError:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setSyncedHolidayCalendar:(BOOL)a3;
- (void)setUUID:(id)a3;
- (void)setUnlocalizedTitle:(id)a3;
- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4;
@end

@implementation EKCalendar

- (EKCalendarType)type
{
  if ([(EKCalendar *)self isSubscribed]) {
    return 3;
  }
  v4 = [(EKCalendar *)self source];
  uint64_t v5 = [v4 sourceType];

  EKCalendarType result = EKCalendarTypeLocal;
  switch(v5)
  {
    case 1:
      EKCalendarType result = EKCalendarTypeExchange;
      break;
    case 2:
      EKCalendarType result = EKCalendarTypeCalDAV;
      break;
    case 4:
      return 3;
    case 5:
      if ([(EKCalendar *)self isSuggestedEventCalendar])
      {
        EKCalendarType result = EKCalendarTypeBirthday|EKCalendarTypeCalDAV;
      }
      else if ([(EKCalendar *)self isNaturalLanguageSuggestedEventCalendar])
      {
        EKCalendarType result = EKCalendarTypeBirthday|EKCalendarTypeCalDAV;
      }
      else
      {
        EKCalendarType result = EKCalendarTypeBirthday;
      }
      break;
    case 6:
      EKCalendarType result = EKCalendarTypeBirthday|EKCalendarTypeExchange;
      break;
    default:
      return result;
  }
  return result;
}

- (EKSource)source
{
  return (EKSource *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56EA8]];
}

- (BOOL)_flagValueWithMask:(unsigned int)a3
{
  return ([(EKCalendar *)self flags] & a3) != 0;
}

- (unsigned)flags
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D98]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (BOOL)isSubscribed
{
  return [(EKCalendar *)self _flagValueWithMask:8];
}

- (BOOL)isSuggestedEventCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:0x40000];
}

- (BOOL)isNaturalLanguageSuggestedEventCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:0x80000];
}

- (id)symbolicColorName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EC8]];
}

- (BOOL)isChinaHolidayCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:0x2000000];
}

- (EKEntityMask)allowedEntityTypes
{
  int v2 = [(EKCalendar *)self allowedEntities];
  EKEntityMask v3 = 2;
  if (v2 != 8) {
    EKEntityMask v3 = 3;
  }
  if (v2 == 4) {
    return 1;
  }
  else {
    return v3;
  }
}

- (int)allowedEntities
{
  int v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D50]];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)allowsContentModifications
{
  int v3 = [(EKObject *)self eventStore];
  char v4 = [v3 skipModificationValidation];

  if (v4 & 1) != 0 || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement]) {
    return 1;
  }
  uint64_t v5 = [(EKObject *)self eventStore];
  if ([v5 allowsBirthdayModifications])
  {
    EKCalendarType v6 = [(EKCalendar *)self type];

    if (v6 == EKCalendarTypeBirthday) {
      return 1;
    }
  }
  else
  {
  }
  BOOL v9 = [(EKCalendar *)self readOnly];
  v10 = [(EKCalendar *)self source];
  v11 = v10;
  if (v9)
  {
    char v7 = 0;
  }
  else if (v10)
  {
    char v7 = [v10 isWritable];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)readOnly
{
  return [(EKCalendar *)self _flagValueWithMask:1];
}

- (id)syncHash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [(EKCalendar *)self externalID];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    memset(&c, 0, sizeof(c));
    CC_MD5_Init(&c);
    id v6 = [(EKCalendar *)self title];
    char v7 = (const char *)[v6 UTF8String];

    if (v7)
    {
      CC_LONG v8 = strlen(v7);
      CC_MD5_Update(&c, v7, v8);
    }
    char data = [(EKCalendar *)self type];
    CC_MD5_Update(&c, &data, 1u);
    id v9 = [(EKCalendar *)self colorString];
    v10 = (const char *)[v9 UTF8String];

    if (v10)
    {
      CC_LONG v11 = strlen(v10);
      CC_MD5_Update(&c, v10, v11);
    }
    CC_MD5_Final(md, &c);
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:md length:16 freeWhenDone:0];
    id v5 = [v12 base64EncodedStringWithOptions:2];
  }

  return v5;
}

- (id)selectionSyncIdentifier
{
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:100];
  char v4 = [(EKCalendar *)self source];
  id v5 = [v4 sourceIdentifier];
  if (![v4 sourceType])
  {
    id v6 = @"LOCAL";
    goto LABEL_5;
  }
  if ([v4 sourceType] == 5)
  {
    id v6 = @"BIRTHDAYS";
LABEL_5:

    id v5 = v6;
LABEL_9:
    [v3 appendString:v5];

    goto LABEL_10;
  }
  if ([v4 sourceType] == 6)
  {
    uint64_t v7 = [v4 externalID];

    id v5 = (void *)v7;
  }
  if (v5) {
    goto LABEL_9;
  }
LABEL_10:
  [v3 appendString:@";"];
  CC_LONG v8 = [(EKCalendar *)self externalID];
  if (v8)
  {
    [v3 appendString:v8];
  }
  else
  {
    uint64_t v9 = [(EKCalendar *)self title];
    v10 = (void *)v9;
    if (v9) {
      CC_LONG v11 = (__CFString *)v9;
    }
    else {
      CC_LONG v11 = @"-";
    }
    [v3 appendString:v11];

    objc_msgSend(v3, "appendFormat:", @";%d;", -[EKCalendar type](self, "type"));
    uint64_t v12 = [(EKCalendar *)self colorString];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"-";
    }
    [v3 appendString:v14];
  }
  v15 = (void *)[v3 copy];

  return v15;
}

- (NSString)title
{
  int v3 = (void *)MEMORY[0x1E4F57738];
  char v4 = [(EKCalendar *)self unlocalizedTitle];
  BOOL v5 = [(EKCalendar *)self isSuggestedEventCalendar];
  BOOL v6 = [(EKCalendar *)self type] == EKCalendarTypeBirthday;
  BOOL v7 = [(EKCalendar *)self allowReminders];
  CC_LONG v8 = [(EKCalendar *)self source];
  objc_msgSend(v3, "localizedTitleForTitle:isSuggestedEventCalendar:isBirthdayCalendar:allowsReminders:isIntegrationCalendar:", v4, v5, v6, v7, objc_msgSend(v8, "sourceType") == 6);
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = &stru_1EF932508;
  }
  CC_LONG v11 = v10;

  return v11;
}

- (id)unlocalizedTitle
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EE0]];
}

- (BOOL)allowReminders
{
  return ([(EKCalendar *)self allowedEntityTypes] >> 1) & 1;
}

- (id)externalID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (BOOL)isHidden
{
  return [(EKCalendar *)self _flagValueWithMask:2];
}

- (BOOL)isSubscribedHolidayCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:4096];
}

- (BOOL)isHolidayCalendar
{
  if ([(EKCalendar *)self isSyncedHolidayCalendar]) {
    return 1;
  }

  return [(EKCalendar *)self isSubscribedHolidayCalendar];
}

- (BOOL)isSyncedHolidayCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:0x1000000];
}

- (id)UUID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

CGColorWrapper *__21__EKCalendar_CGColor__block_invoke(uint64_t a1)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  CGFloat v6 = 0.0;
  CGFloat v7 = 0.0;
  CGFloat v5 = 0.0;
  v1 = 0;
  if ([*(id *)(a1 + 32) getColorRed:&v7 green:&v5 blue:&v6])
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    components[0] = v7;
    components[1] = v5;
    components[2] = v6;
    components[3] = 1.0;
    int v3 = CGColorCreate(DeviceRGB, components);
    CFRelease(DeviceRGB);
    v1 = [[CGColorWrapper alloc] initWithCGColor:v3];
    CGColorRelease(v3);
  }

  return v1;
}

- (BOOL)getColorRed:(double *)a3 green:(double *)a4 blue:(double *)a5
{
  CC_LONG v8 = [(EKCalendar *)self colorString];
  uint64_t v9 = v8;
  if (v8)
  {
    int v13 = 0;
    int v11 = 0;
    int v12 = 0;
    sscanf((const char *)[v8 UTF8String], "#%02X%02X%02X", &v13, &v12, &v11);
    if (a3) {
      *a3 = (float)((float)v13 / 255.0);
    }
    if (a4) {
      *a4 = (float)((float)v12 / 255.0);
    }
    if (a5) {
      *a5 = (float)((float)v11 / 255.0);
    }
  }

  return v9 != 0;
}

- (id)colorString
{
  int v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EC8]];
  if (!v3
    || ([(id)EKSymbolicColorToRGBMapping() objectForKey:v3],
        (char v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v4 = [(EKCalendar *)self colorStringRaw];
  }

  return v4;
}

- (CGColorRef)CGColor
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__EKCalendar_CGColor__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  int v2 = [(EKObject *)self cachedValueForKey:@"CGColor" populateBlock:v5];
  int v3 = (CGColor *)[v2 color];

  return v3;
}

- (unint64_t)lastSyncError
{
  int v2 = [(EKCalendar *)self syncError];
  int v3 = v2;
  if (v2)
  {
    if ([v2 errorType]) {
      unint64_t v4 = 1;
    }
    else {
      unint64_t v4 = [v3 errorCode];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)syncError
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56ED0]];
}

- (id)externalModificationTag
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D88]];
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken != -1) {
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken, &__block_literal_global_53);
  }
  int v2 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys;

  return v2;
}

void __84__EKCalendar_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56D68];
  v3[0] = *MEMORY[0x1E4F56EE0];
  v3[1] = v0;
  v4[0] = @"EKChangedCalendarTitle";
  v4[1] = @"EKChangedCalendarColor";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  int v2 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys = v1;
}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken != -1) {
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken, &__block_literal_global_140);
  }
  int v2 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys;

  return v2;
}

void __83__EKCalendar_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F56D48];
  v6[0] = @"add";
  v6[1] = @"remove";
  v7[0] = @"EKChangedAlarmsAdded";
  v7[1] = @"EKChangedAlarmsRemoved";
  v6[2] = @"modify";
  v7[2] = @"EKChangedAlarmsModified";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v8[1] = *MEMORY[0x1E4F56E90];
  v9[0] = v0;
  v4[0] = @"add";
  v4[1] = @"remove";
  v5[0] = @"EKChangedShareesAdded";
  v5[1] = @"EKChangedShareesRemoved";
  v4[2] = @"modify";
  v5[2] = @"EKChangedShareesModified";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  int v3 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys = v2;
}

+ (id)rowIDsForCalendars:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = NSNumber;
          int v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectID", (void)v14);
          int v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "rowID"));
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_4 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_4, &__block_literal_global_64);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_4;

  return v2;
}

void __39__EKCalendar_knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F56EA8];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipWeakKeys_keys_4;
  knownRelationshipWeakKeys_keys_4 = v0;
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_3 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_3, &__block_literal_global_42);
  }
  uint64_t v2 = (void *)knownRelationshipSingleValueKeys_keys_3;

  return v2;
}

void __46__EKCalendar_knownRelationshipSingleValueKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56ED0];
  v3[0] = *MEMORY[0x1E4F56EA8];
  v3[1] = v0;
  void v3[2] = *MEMORY[0x1E4F56DA0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)knownRelationshipSingleValueKeys_keys_3;
  knownRelationshipSingleValueKeys_keys_3 = v1;
}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_3 != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_3, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)knownRelationshipMultiValueKeys_keys_3;

  return v2;
}

void __45__EKCalendar_knownRelationshipMultiValueKeys__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56E90];
  v3[0] = *MEMORY[0x1E4F56D48];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)knownRelationshipMultiValueKeys_keys_3;
  knownRelationshipMultiValueKeys_keys_3 = v1;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_7 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_7, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)knownIdentityKeysForComparison_keys_7;

  return v2;
}

void __44__EKCalendar_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownIdentityKeysForComparison_keys_7;
  knownIdentityKeysForComparison_keys_7 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_6 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_6, &__block_literal_global_48_0);
  }
  uint64_t v2 = (void *)knownSingleValueKeysForComparison_keys_6;

  return v2;
}

void __47__EKCalendar_knownSingleValueKeysForComparison__block_invoke()
{
  v17[30] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56D68];
  v17[0] = *MEMORY[0x1E4F56D50];
  v17[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56D78];
  v17[2] = *MEMORY[0x1E4F56D70];
  v17[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56D98];
  v17[4] = *MEMORY[0x1E4F56D90];
  v17[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56DB0];
  v17[6] = *MEMORY[0x1E4F56DA8];
  v17[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56DF0];
  v17[8] = *MEMORY[0x1E4F56DE0];
  v17[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56E00];
  v17[10] = *MEMORY[0x1E4F56DF8];
  v17[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56E10];
  v17[12] = *MEMORY[0x1E4F56E08];
  v17[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F56E20];
  v17[14] = *MEMORY[0x1E4F56E18];
  v17[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F56E50];
  v17[16] = *MEMORY[0x1E4F56E30];
  v17[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F56E60];
  v17[18] = *MEMORY[0x1E4F56E58];
  v17[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F56E70];
  v17[20] = *MEMORY[0x1E4F56E68];
  v17[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F56E88];
  v17[22] = *MEMORY[0x1E4F56E78];
  v17[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F56E98];
  v17[24] = *MEMORY[0x1E4F56E80];
  v17[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F56EB0];
  v17[26] = *MEMORY[0x1E4F56EA0];
  v17[27] = v13;
  uint64_t v14 = *MEMORY[0x1E4F56EE0];
  v17[28] = *MEMORY[0x1E4F56EC8];
  v17[29] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:30];
  long long v16 = (void *)knownSingleValueKeysForComparison_keys_6;
  knownSingleValueKeysForComparison_keys_6 = v15;
}

+ (EKCalendar)calendarWithEventStore:(EKEventStore *)eventStore
{
  return (EKCalendar *)[a1 calendarForEntityType:0 eventStore:eventStore];
}

+ (EKCalendar)calendarForEntityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore
{
  uint64_t v6 = eventStore;
  if (entityType >= 2) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid entity type passed: %d", entityType);
  }
  char IsReminderBridgeEnabled = CalIsReminderBridgeEnabled();
  if (entityType && (IsReminderBridgeEnabled & 1) != 0)
  {
    uint64_t v8 = [(EKEventStore *)v6 reminderStore];
    uint64_t v9 = [v8 createNewReminderCalendar];
  }
  else
  {
    uint64_t v9 = [a1 calendarForEntityTypes:1 << entityType eventStore:v6];
  }

  return (EKCalendar *)v9;
}

+ (id)calendarForEntityTypes:(unint64_t)a3 eventStore:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKCalendar calendarForEntityTypes:eventStore:](v7);
    }
  }
  uint64_t v8 = objc_alloc_init(EKPersistentCalendar);
  [v6 _registerObject:v8];
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithPersistentObject:v8];
  [v9 _updateToMaxDisplayOrder];
  uint64_t v10 = EKUUIDString();
  [v9 setCalendarIdentifier:v10];

  [v9 setAllowedEntityTypes:a3];

  return v9;
}

- (void)_updateToMaxDisplayOrder
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(EKObject *)self eventStore];
  uint64_t v4 = [v3 _allCalendars];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 displayOrder] != 0x7FFFFFFF)
        {
          int v11 = [v10 displayOrder];
          if (v11 > v7) {
            int v7 = v11;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  [(EKCalendar *)self setDisplayOrder:(v7 + 1)];
}

- (void)reorderBetweenEarlier:(id)a3 later:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v10[0] = self;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v9 = [(EKCalendar *)self reorderCalendars:v8 betweenEarlier:v6 later:v7];
}

- (id)reorderCalendars:(id)a3 betweenEarlier:(id)a4 later:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (!(v9 | v10)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"earlier == nil && later == nil"];
  }
  int v11 = [(id)v9 source];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    long long v14 = [(id)v10 source];
    long long v15 = v14;
    if (v14)
    {
      id v13 = v14;
    }
    else
    {
      long long v16 = [(EKObject *)self eventStore];
      id v13 = [v16 localSource];
    }
  }

  uint64_t v17 = (void *)MEMORY[0x1E4F1CA48];
  v18 = [v13 allCalendars];
  uint64_t v19 = [(id)objc_opt_class() orderSortDescriptors];
  v20 = [v18 sortedArrayUsingDescriptors:v19];
  v21 = [v17 arrayWithArray:v20];

  v22 = [v21 objectAtIndexedSubscript:0];
  int v23 = [v22 displayOrder];

  [v21 removeObjectsInArray:v8];
  if (v9) {
    unint64_t v24 = v9;
  }
  else {
    unint64_t v24 = v10;
  }
  uint64_t v25 = [v21 indexOfObject:v24];
  if (v9) {
    uint64_t v26 = v25 + 1;
  }
  else {
    uint64_t v26 = v25;
  }
  v27 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v26, objc_msgSend(v8, "count"));
  [v21 insertObjects:v8 atIndexes:v27];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__EKCalendar_reorderCalendars_betweenEarlier_later___block_invoke;
  v32[3] = &unk_1E5B991E8;
  int v35 = v23;
  id v29 = v28;
  id v33 = v29;
  v34 = self;
  [v21 enumerateObjectsUsingBlock:v32];
  id v30 = v29;

  return v30;
}

void __52__EKCalendar_reorderCalendars_betweenEarlier_later___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = (*(_DWORD *)(a1 + 48) + a3);
  id v8 = v5;
  if (v6 != [v5 displayOrder])
  {
    [*(id *)(a1 + 32) addObject:v8];
    [v8 setDisplayOrder:v6];
    id v7 = [*(id *)(a1 + 40) eventStore];
    [v7 saveCalendar:v8 commit:0 error:0];
  }
}

+ (id)orderSortDescriptors
{
  if (orderSortDescriptors_onceToken != -1) {
    dispatch_once(&orderSortDescriptors_onceToken, &__block_literal_global_59_0);
  }
  uint64_t v2 = (void *)orderSortDescriptors_descriptors;

  return v2;
}

void __34__EKCalendar_orderSortDescriptors__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"source.isDelegate" ascending:1];
  uint64_t v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"source._adjustedDisplayOrder" ascending:1];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"source.sourceType" ascending:1];
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"displayOrder" ascending:1];
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  void v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v5 = (void *)orderSortDescriptors_descriptors;
  orderSortDescriptors_descriptors = v4;
}

- (EKCalendar)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't directly init a calendar. Use calendarWithEventStore" userInfo:0];
  objc_exception_throw(v2);
}

- (int)entityType
{
  return 1;
}

- (void)rollback
{
  v3.receiver = self;
  v3.super_class = (Class)EKCalendar;
  [(EKObject *)&v3 rollback];
  [(EKCalendar *)self _clearCGColorCache];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)EKCalendar;
  [(EKObject *)&v3 reset];
  [(EKCalendar *)self _clearCGColorCache];
}

- (BOOL)_reset
{
  v7.receiver = self;
  v7.super_class = (Class)EKCalendar;
  BOOL v3 = [(EKObject *)&v7 _reset];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __20__EKCalendar__reset__block_invoke;
    void v6[3] = &unk_1E5B98120;
    v6[4] = self;
    LOBYTE(v3) = [(EKObject *)self _resetIfBackingObjectIsOfClass:v4 fetchResetFrozenObjectBlock:v6];
  }
  return v3;
}

id __20__EKCalendar__reset__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventStore];
  BOOL v3 = [v2 reminderStore];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v5 = [v3 backingCalendarWithIdentifier:v4];

  return v5;
}

- (void)setUnlocalizedTitle:(id)a3
{
}

- (id)lastSyncTitle
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DC8]];
}

- (void)setLastSyncTitle:(id)a3
{
}

+ (id)_eventKitBundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EKCalendar__eventKitBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_eventKitBundle_onceToken != -1) {
    dispatch_once(&_eventKitBundle_onceToken, block);
  }
  id v2 = (void *)_eventKitBundle_bundle;

  return v2;
}

uint64_t __29__EKCalendar__eventKitBundle__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v2 = _eventKitBundle_bundle;
  _eventKitBundle_bundle = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)assignColorForNewCalendarIfNeeded
{
  BOOL v3 = [(EKCalendar *)self colorStringRaw];

  if (!v3)
  {
    uint64_t v4 = [(EKObject *)self eventStore];
    id v6 = [v4 colorStringForNewCalendar];

    id v5 = v6;
    if (v6)
    {
      [(EKCalendar *)self setColorStringRaw:v6];
      [(EKCalendar *)self setColorDisplayOnly:1];
      id v5 = v6;
    }
  }
}

- (void)setSymbolicColorName:(id)a3
{
  id v5 = a3;
  [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F56EC8]];
  uint64_t v4 = [(id)EKSymbolicColorToRGBMapping() objectForKey:v5];
  if (v4) {
    [(EKCalendar *)self setColorStringRaw:v4];
  }
  if (v5 && ([v5 isEqualToString:*MEMORY[0x1E4FB82F8]] & 1) == 0) {
    [(EKCalendar *)self _clearCGColorCache];
  }
}

- (BOOL)isColorDisplayOnly
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D60]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setColorDisplayOnly:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D60]];
}

- (id)colorStringRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D68]];
}

- (void)setColorStringRaw:(id)a3
{
}

- (void)setColorString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [(EKCalendar *)self _clearCGColorCache];
    id v4 = 0;
  }
  [(EKCalendar *)self setColorStringRaw:v4];
  [(EKCalendar *)self setColorDisplayOnly:0];
  [(EKObject *)self setSingleChangedValue:*MEMORY[0x1E4FB82F8] forKey:*MEMORY[0x1E4F56EC8]];
}

- (void)_clearCGColorCache
{
}

- (void)setCGColor:(CGColorRef)CGColor
{
  id v5 = [(EKCalendar *)self CGColor];
  if (v5 != CGColor && ((CGColor != 0) != (v5 != 0) || !CGColorEqualToColor(CGColor, v5)))
  {
    if (CGColorGetNumberOfComponents(CGColor) < 3)
    {
      if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E50901FFFFFFFFLL])
      {
        [(EKCalendar *)self setColorString:0];
      }
    }
    else
    {
      Components = CGColorGetComponents(CGColor);
      objc_super v7 = &qword_1A4F8FFE0[4];
      LODWORD(v7) = llround(*Components * 255.0);
      LODWORD(v8) = llround(Components[1] * 255.0);
      LODWORD(v9) = llround(Components[2] * 255.0);
      objc_msgSend(NSString, "stringWithFormat:", @"#%02x%02x%02x", v7, v8, v9);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [(EKCalendar *)self setColorStringRaw:v11];
      [(EKCalendar *)self setColorDisplayOnly:0];
      [(EKObject *)self setSingleChangedValue:*MEMORY[0x1E4FB82F8] forKey:*MEMORY[0x1E4F56EC8]];
      unint64_t v10 = [[CGColorWrapper alloc] initWithCGColor:CGColor];
      [(EKObject *)self setCachedValue:v10 forKey:@"CGColor"];
    }
  }
}

- (id)locale
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DD0]];
}

- (void)setLocale:(id)a3
{
}

- (void)setUUID:(id)a3
{
}

- (void)setFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D98]];
}

- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(EKCalendar *)self flags];
  if (v5) {
    uint64_t v8 = v7 | a4;
  }
  else {
    uint64_t v8 = v7 & ~a4;
  }

  [(EKCalendar *)self setFlags:v8];
}

- (void)setReadOnly:(BOOL)a3
{
}

- (int)displayOrder
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D78]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setDisplayOrder:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D78]];
}

+ (id)typeDescription:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Encountered illegal value for EKCalendarType" userInfo:0];
    objc_exception_throw(v4);
  }
  return off_1E5B992E0[a3];
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(EKCalendar *)self title];
  id v6 = objc_msgSend((id)objc_opt_class(), "typeDescription:", -[EKCalendar type](self, "type"));
  if ([(EKCalendar *)self allowsContentModifications]) {
    unsigned int v7 = @"YES";
  }
  else {
    unsigned int v7 = @"NO";
  }
  uint64_t v8 = [(EKCalendar *)self colorString];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {title = %@; type = %@; allowsModify = %@; color = %@;}",
    v4,
    self,
    v5,
    v6,
    v7,
  uint64_t v9 = v8);

  return v9;
}

- (BOOL)refresh
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendar;
  BOOL v3 = [(EKObject *)&v5 refresh];
  if (v3) {
    [(EKCalendar *)self _clearCGColorCache];
  }
  return v3;
}

- (BOOL)isDefaultSchedulingCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:1024];
}

- (void)setIsDefaultSchedulingCalendar:(BOOL)a3
{
}

- (BOOL)isInbox
{
  return [(EKCalendar *)self _flagValueWithMask:32];
}

- (void)setInbox:(BOOL)a3
{
}

- (BOOL)isNotificationsCollection
{
  return [(EKCalendar *)self _flagValueWithMask:64];
}

- (void)setNotificationsCollection:(BOOL)a3
{
}

- (void)setSubscribed:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3
{
}

- (BOOL)allowsDeletionOrPropertyModifications
{
  if ([(EKCalendar *)self isDeletable]) {
    return 1;
  }
  else {
    return ![(EKCalendar *)self isImmutable];
  }
}

- (BOOL)isImmutable
{
  if ([(EKCalendar *)self type] == EKCalendarTypeBirthday)
  {
    BOOL v3 = [(EKObject *)self eventStore];
    char v4 = [v3 allowsBirthdayModifications];

    if (v4) {
      return 0;
    }
  }
  if ([(EKCalendar *)self type] == (EKCalendarTypeBirthday|EKCalendarTypeExchange))
  {
    objc_super v5 = [(EKObject *)self eventStore];
    char v6 = [v5 allowsIntegrationModifications];

    if (v6) {
      return 0;
    }
  }
  unsigned int v7 = [(EKObject *)self eventStore];
  if ([v7 eventAccessLevel] == 1)
  {
    BOOL v8 = [(EKCalendar *)self allowEvents];

    if (v8) {
      return 1;
    }
  }
  else
  {
  }
  if ([(EKObject *)self isNew]) {
    return 0;
  }

  return [(EKCalendar *)self _flagValueWithMask:4];
}

- (BOOL)isImmutableRaw
{
  return [(EKCalendar *)self _flagValueWithMask:4];
}

- (void)setImmutable:(BOOL)a3
{
}

- (id)image
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56DA0]];
}

- (void)setImage:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56DA0];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (BOOL)isSubscribedCalendarJunk
{
  return [(EKCalendar *)self _flagValueWithMask:0x800000];
}

- (void)setIsSubscribedCalendarJunk:(BOOL)a3
{
}

- (BOOL)isDeletable
{
  return [(EKCalendar *)self isDeletableWithAllKnownCalendars:0];
}

- (BOOL)isDeletableWithAllKnownCalendars:(id)a3
{
  return [(EKCalendar *)self _validateDeletableWithAllKnownCalendars:a3 error:0];
}

- (BOOL)_validateDeletable:(id *)a3
{
  return [(EKCalendar *)self _validateDeletableWithAllKnownCalendars:0 error:a3];
}

- (BOOL)_validateDeletableWithAllKnownCalendars:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(EKCalendar *)self _validateDeletableDueToAccessConsent:a4]) {
    BOOL v7 = [(EKCalendar *)self _validateDeletableHelperWithAllKnownCalendars:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3
{
  if ([(EKCalendar *)self allowEvents])
  {
    id v5 = [(EKObject *)self eventStore];
    int v6 = [v5 eventAccessLevel];

    if (v6 == 2) {
      return 1;
    }
  }
  if (![(EKCalendar *)self allowReminders]
    || (BOOL v7 = 1,
        +[EKEventStore realAuthorizationStatusForEntityType:1] != 3))
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:29];
      BOOL v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)_validateDeletableHelperWithAllKnownCalendars:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(EKCalendar *)self isMarkedUndeletable])
  {
    BOOL v9 = 1;
    switch([(EKCalendar *)self type])
    {
      case EKCalendarTypeLocal:
      case EKCalendarTypeSubscription:
        goto LABEL_31;
      case EKCalendarTypeCalDAV:
        uint64_t v10 = [(EKCalendar *)self source];
        if (v10
          && (id v11 = (void *)v10,
              [(EKCalendar *)self source],
              long long v12 = objc_claimAutoreleasedReturnValue(),
              char v13 = [v12 isWritable],
              v12,
              v11,
              (v13 & 1) == 0))
        {
          if (!a4) {
            goto LABEL_30;
          }
          BOOL v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 56;
        }
        else
        {
          uint64_t v14 = [(EKCalendar *)self source];
          if (!v14) {
            goto LABEL_21;
          }
          long long v15 = (void *)v14;
          long long v16 = [(EKCalendar *)self source];
          char v17 = [v16 allowsCalendarAddDeleteModify];

          if (v17) {
            goto LABEL_21;
          }
          if (!a4) {
            goto LABEL_30;
          }
          BOOL v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 52;
        }
        goto LABEL_4;
      case EKCalendarTypeExchange:
        v18 = [(EKCalendar *)self source];
        int v19 = [v18 isDelegate];

        if (v19)
        {
          if (!a4) {
            goto LABEL_30;
          }
          BOOL v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 55;
          goto LABEL_4;
        }
        if ([(EKCalendar *)self isDefaultSchedulingCalendar])
        {
          if (!a4) {
            goto LABEL_30;
          }
          BOOL v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 53;
          goto LABEL_4;
        }
LABEL_21:
        if ([(EKCalendar *)self isSubscribed])
        {
          BOOL v9 = 1;
          goto LABEL_31;
        }
        if ([(EKCalendar *)self allowEvents])
        {
          if (![(EKCalendar *)self _anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:v6])
          {
            if (a4)
            {
              [MEMORY[0x1E4F28C58] errorWithEKErrorCode:51];
              BOOL v9 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v9 = 0;
            }
            int v22 = 1;
LABEL_36:
            if ([(EKCalendar *)self allowReminders])
            {
              if ([(EKCalendar *)self _anotherCalendarForRemindersExistsWithAllKnownCalendars:v6])
              {
                int v24 = 0;
LABEL_43:
                if ([(EKCalendar *)self allowEvents])
                {
                  BOOL v25 = [(EKCalendar *)self allowReminders];
                  if ((v22 | v24) == 1 && v25 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
                    -[EKCalendar _validateDeletableHelperWithAllKnownCalendars:error:]();
                  }
                }
                goto LABEL_31;
              }
              if (a4)
              {
                [MEMORY[0x1E4F28C58] errorWithEKErrorCode:57];
                BOOL v9 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                BOOL v9 = 0;
              }
            }
            int v24 = 1;
            goto LABEL_43;
          }
          int v22 = 0;
        }
        else
        {
          int v22 = 1;
        }
        BOOL v9 = 1;
        goto LABEL_36;
      case EKCalendarTypeBirthday:
        v20 = [(EKObject *)self eventStore];
        char v21 = [v20 allowsBirthdayModifications];
        goto LABEL_17;
      case EKCalendarTypeBirthday|EKCalendarTypeExchange:
        v20 = [(EKObject *)self eventStore];
        char v21 = [v20 allowsIntegrationModifications];
LABEL_17:
        BOOL v9 = v21;

        goto LABEL_31;
      default:
        goto LABEL_21;
    }
  }
  if (!a4)
  {
LABEL_30:
    BOOL v9 = 0;
    goto LABEL_31;
  }
  BOOL v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = 54;
LABEL_4:
  [v7 errorWithEKErrorCode:v8];
  BOOL v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v9;
}

- (int64_t)deletionWarningsMask
{
  if (([(EKCalendar *)self allowedEntityTypes] & 2) != 0) {
    int64_t v3 = 8 * ([(EKCalendar *)self allowedEntityTypes] & 1);
  }
  else {
    int64_t v3 = 0;
  }
  if ([(EKCalendar *)self sharingStatus] == 2) {
    v3 |= 0x10uLL;
  }
  uint64_t v4 = [(EKCalendar *)self source];
  if ([v4 sourceType])
  {
    id v5 = [(EKCalendar *)self source];
    uint64_t v6 = [v5 sourceType];

    if (v6 != 2) {
      return v3;
    }
  }
  else
  {
  }
  BOOL v7 = [(EKObject *)self eventStore];
  int v8 = [v7 futureScheduledEventsExistOnCalendar:self];

  if (v8) {
    uint64_t v9 = v3 | 4;
  }
  else {
    uint64_t v9 = v3;
  }
  uint64_t v10 = [(EKObject *)self eventStore];
  int v11 = [v10 eventsExistOnCalendar:self];

  if (v11) {
    int64_t v3 = v9 | 2;
  }
  else {
    int64_t v3 = v9;
  }
  if ([(EKCalendar *)self sharingStatus] != 2)
  {
    long long v12 = [(EKObject *)self eventStore];
    int v13 = [v12 eventsMarkedScheduleAgentClientExistOnCalendar:self];

    if (v13) {
      return v3 | 0x20;
    }
  }
  return v3;
}

- (BOOL)canMergeWithCalendar:(id)a3
{
  uint64_t v4 = (EKCalendar *)a3;
  if (self == v4
    || ([(EKObject *)self uniqueIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(EKObject *)v4 uniqueIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    int v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      [(EKCalendar *)v8 canMergeWithCalendar:v4];
    }
  }
  else
  {
    int v11 = [(EKCalendar *)self source];
    long long v12 = [v11 uniqueIdentifier];
    int v13 = [(EKCalendar *)v4 source];
    uint64_t v14 = [v13 uniqueIdentifier];
    char v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      if ([(EKCalendar *)self allowsContentModifications])
      {
        if ([(EKCalendar *)v4 allowsContentModifications])
        {
          if ([(EKCalendar *)self sharingStatus] == 2)
          {
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
              -[EKCalendar canMergeWithCalendar:]();
            }
          }
          else if ([(EKCalendar *)self allowReminders])
          {
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
              -[EKCalendar canMergeWithCalendar:]();
            }
          }
          else if ([(EKCalendar *)self allowsScheduling] {
                 || ![(EKCalendar *)v4 sharingStatus]
          }
                 || [(EKCalendar *)self sharingStatus])
          {
            if ([(EKCalendar *)self isDeletable])
            {
              BOOL v9 = 1;
              goto LABEL_6;
            }
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
              -[EKCalendar canMergeWithCalendar:].cold.4();
            }
          }
          else
          {
            char v17 = (void *)EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
              [(EKCalendar *)v17 canMergeWithCalendar:v4];
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        {
          -[EKCalendar canMergeWithCalendar:].cold.6();
        }
      }
      else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      {
        -[EKCalendar canMergeWithCalendar:].cold.7();
      }
    }
    else
    {
      long long v16 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        [(EKCalendar *)v16 canMergeWithCalendar:v4];
      }
    }
  }
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)eligibleForDefaultSchedulingCalendar
{
  [(EKCalendar *)self type];

  return [(EKCalendar *)self allowsScheduling];
}

- (BOOL)_anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:(id)a3
{
  id v4 = a3;
  if ([(EKCalendar *)self isDefaultSchedulingCalendar]) {
    id v5 = &__block_literal_global_115;
  }
  else {
    id v5 = &__block_literal_global_117;
  }
  BOOL v6 = [(EKCalendar *)self _anyCalendarExistsInSameSourceOfType:0 withAllKnownCalendars:v4 passingTest:v5];

  return v6;
}

uint64_t __78__EKCalendar__anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eligibleForDefaultSchedulingCalendar];
}

uint64_t __78__EKCalendar__anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars___block_invoke_2()
{
  return 1;
}

- (BOOL)_anotherCalendarForRemindersExistsWithAllKnownCalendars:(id)a3
{
  return [(EKCalendar *)self _anyCalendarExistsInSameSourceOfType:1 withAllKnownCalendars:a3 passingTest:&__block_literal_global_119_0];
}

uint64_t __70__EKCalendar__anotherCalendarForRemindersExistsWithAllKnownCalendars___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowReminders];
}

- (BOOL)_anyCalendarExistsInSameSourceOfType:(unint64_t)a3 withAllKnownCalendars:(id)a4 passingTest:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v22 = (uint64_t (**)(id, void *))a5;
  BOOL v9 = [(EKCalendar *)self source];
  if (!v8)
  {
    uint64_t v10 = [(EKObject *)self eventStore];
    id v8 = [v10 _allCalendars];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    char v21 = (char *)(v22 + 2);
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
      char v17 = objc_msgSend(v16, "source", v21);
      int v18 = [v17 isEqual:v9];

      if (v18)
      {
        if (a3)
        {
          if (a3 == 1 && ([v16 allowReminders] & 1) != 0)
          {
LABEL_14:
            if ([v16 isEqual:self] & 1) == 0 && (v22[2](v22, v16))
            {
              BOOL v19 = 1;
              goto LABEL_20;
            }
          }
        }
        else if ([v16 allowEvents])
        {
          goto LABEL_14;
        }
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (BOOL)allowsScheduling
{
  return ![(EKCalendar *)self prohibitsScheduling];
}

- (void)setAllowsScheduling:(BOOL)a3
{
}

- (BOOL)prohibitsScheduling
{
  return [(EKCalendar *)self _flagValueWithMask:16];
}

- (void)setProhibitsScheduling:(BOOL)a3
{
}

- (BOOL)isSharingInvitation
{
  return [(EKCalendar *)self _flagValueWithMask:128];
}

- (void)setSharingInvitation:(BOOL)a3
{
}

- (unint64_t)sharingStatus
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EA0]];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setSharingStatus:(unint64_t)a3
{
  id v4 = [NSNumber numberWithInt:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56EA0]];
}

- (unint64_t)invitationStatus
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DA8]];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  id v4 = [NSNumber numberWithInt:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56DA8]];
}

- (void)clearInvitationStatus
{
  id v2 = [(EKObject *)self persistentObject];
  [v2 unloadPropertyForKey:*MEMORY[0x1E4F56DA8]];
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56E98]];
}

- (unint64_t)sharingInvitationResponse
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E98]];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setSharedOwnerName:(id)a3
{
}

- (id)sharedOwnerName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E80]];
}

- (void)setSharedOwnerURLString:(id)a3
{
}

- (id)sharedOwnerURLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E88]];
}

- (void)setSharedOwnerURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendar *)self setSharedOwnerURLString:v4];
}

- (id)sharedOwnerURL
{
  id v2 = [(EKCalendar *)self sharedOwnerURLString];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)setSharedOwnerAddress:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  [(EKCalendar *)self setSharedOwnerURL:v4];
}

- (id)sharedOwnerAddress
{
  id v2 = [(EKCalendar *)self sharedOwnerURL];
  unint64_t v3 = [v2 absoluteString];

  return v3;
}

- (id)sharedOwnerEmail
{
  id v2 = [(EKCalendar *)self sharedOwnerURL];
  unint64_t v3 = objc_msgSend(v2, "cal_emailAddressString");

  return v3;
}

- (id)sharedOwnerPhoneNumber
{
  id v2 = [(EKCalendar *)self sharedOwnerURL];
  unint64_t v3 = objc_msgSend(v2, "cal_phoneNumberString");

  return v3;
}

- (id)cachedExternalInfoData
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D58]];
}

- (void)setCachedExternalInfoData:(id)a3
{
}

- (id)cachedExternalInfo
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__EKCalendar_cachedExternalInfo__block_invoke;
  void v4[3] = &unk_1E5B96908;
  v4[4] = self;
  id v2 = [(EKObject *)self cachedValueForKey:@"cachedExternalInfoDictionary" populateBlock:v4];

  return v2;
}

id __32__EKCalendar_cachedExternalInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) cachedExternalInfoData];
  if (!v1)
  {
    id v4 = 0;
    goto LABEL_12;
  }
  id v7 = 0;
  id v2 = [MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:&v7];
  id v3 = v7;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_2(v5);
    }
LABEL_10:
    id v4 = 0;
    goto LABEL_11;
  }
  id v4 = v2;
LABEL_11:

LABEL_12:

  return v4;
}

- (void)setCachedExternalInfo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v8 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v8];
  id v6 = v8;
  id v7 = v6;
  if (v5)
  {

    id v7 = (void *)v5;
LABEL_5:
    [(EKObject *)self setCachedValue:v4 forKey:@"cachedExternalInfoDictionary"];
    [(EKCalendar *)self setCachedExternalInfoData:v7];
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKCalendar setCachedExternalInfo:]();
  }
LABEL_8:
}

- (id)externalInfoForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKCalendar *)self cachedExternalInfo];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sharedOwnerAddresses
{
  return [(EKCalendar *)self externalInfoForKey:*MEMORY[0x1E4F56B80]];
}

- (id)sharedOwnerAddressesWithoutScheme
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(EKCalendar *)self sharedOwnerAddresses];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(id *)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasMailto", (void)v13))
          {
            uint64_t v10 = [v9 stringRemovingMailto];

            id v9 = (id)v10;
          }
          if ([v9 hasTel])
          {
            uint64_t v11 = [v9 stringRemovingTel];

            id v9 = (id)v11;
          }
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)publishURLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E30]];
}

- (void)setPublishURLString:(id)a3
{
}

- (id)publishURL
{
  id v2 = [(EKCalendar *)self publishURLString];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setPublishURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendar *)self setPublishURLString:v4];
}

- (void)setIsPublished:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56DB0]];
}

- (BOOL)isPublished
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DB0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)canBePublished
{
  return [(EKCalendar *)self _flagValueWithMask:256];
}

- (void)setCanBePublished:(BOOL)a3
{
}

- (BOOL)canBeShared
{
  BOOL v3 = [(EKCalendar *)self _flagValueWithMask:2048];
  if (v3)
  {
    id v4 = [(EKCalendar *)self source];
    char v5 = [v4 supportsSharedCalendars];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setCanBeShared:(BOOL)a3
{
}

- (BOOL)isFacebookBirthdayCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:512];
}

- (void)setFacebookBirthdayCalendar:(BOOL)a3
{
}

- (void)setSyncedHolidayCalendar:(BOOL)a3
{
}

- (void)setSubscribedHolidayCalendar:(BOOL)a3
{
}

- (void)setChinaHolidayCalendar:(BOOL)a3
{
}

- (BOOL)isFamilyCalendar
{
  return [(EKCalendar *)self _flagValueWithMask:0x2000];
}

- (void)setFamilyCalendar:(BOOL)a3
{
}

- (BOOL)isMarkedUndeletable
{
  return [(EKCalendar *)self _flagValueWithMask:0x4000];
}

- (void)setMarkedUndeletable:(BOOL)a3
{
}

- (BOOL)isMarkedImmutableSharees
{
  return [(EKCalendar *)self _flagValueWithMask:0x8000];
}

- (void)setMarkedImmutableSharees:(BOOL)a3
{
}

- (int64_t)maxAttendees
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DD8]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setMaxAttendees:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56DD8]];
}

- (BOOL)isMutableSuggestionsCalendar
{
  BOOL v3 = [(EKCalendar *)self isSuggestedEventCalendar];
  if (v3)
  {
    id v4 = [(EKObject *)self eventStore];
    char v5 = [v4 canModifySuggestedEventCalendar];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMutableNaturalLanguageSuggestionsCalendar
{
  BOOL v3 = [(EKCalendar *)self isNaturalLanguageSuggestedEventCalendar];
  if (v3)
  {
    id v4 = [(EKObject *)self eventStore];
    char v5 = [v4 canModifySuggestedEventCalendar];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isIgnoringEventAlerts
{
  return [(EKCalendar *)self _flagValueWithMask:0x10000];
}

- (void)setIsIgnoringEventAlerts:(BOOL)a3
{
}

- (BOOL)allowsIgnoringSharedEventChangeNotifications
{
  id v2 = [(EKCalendar *)self sharees];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isIgnoringSharedCalendarNotifications
{
  return [(EKCalendar *)self _flagValueWithMask:0x20000];
}

- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3
{
}

- (BOOL)isAffectingAvailability
{
  return [(EKCalendar *)self _flagValueWithMask:0x100000];
}

- (void)setIsAffectingAvailability:(BOOL)a3
{
}

- (void)setExternalID:(id)a3
{
}

- (id)externalIDTag
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D80]];
}

- (void)setExternalIDTag:(id)a3
{
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)syncToken
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56ED8]];
}

- (void)setSyncToken:(id)a3
{
}

- (id)externalRepresentation
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D90]];
}

- (void)setExternalRepresentation:(id)a3
{
}

- (int)migrationVersion
{
  id v2 = [(EKCalendar *)self externalRepresentation];
  BOOL v3 = [MEMORY[0x1E4F577E8] dictionaryWithExternalRepresentationData:v2];
  int v4 = [MEMORY[0x1E4F577E8] migrationVersionFromDictionary:v3];

  return v4;
}

- (void)setMigrationVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v8 = [(EKCalendar *)self externalRepresentation];
  char v5 = [MEMORY[0x1E4F577E8] dictionaryWithExternalRepresentationData:v8];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  [MEMORY[0x1E4F577E8] setMigrationVersion:v3 inDictionary:v6];
  uint64_t v7 = [MEMORY[0x1E4F577E8] externalRepresentationDataWithDictionary:v6];
  [(EKCalendar *)self setExternalRepresentation:v7];
}

- (id)externalURI
{
  id v2 = [(EKCalendar *)self calendarIdentifier];
  if (v2)
  {
    if (externalURI_onceToken_0 != -1) {
      dispatch_once(&externalURI_onceToken_0, &__block_literal_global_146);
    }
    uint64_t v3 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:externalURI_allowedCharacters_0];
    int v4 = [NSString stringWithFormat:@"x-apple-calendar://%@", v3];
    char v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __25__EKCalendar_externalURI__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/?&:$+,;=@"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)externalURI_allowedCharacters_0;
  externalURI_allowedCharacters_0 = v1;
}

- (id)constraints
{
  id v3 = [(EKObject *)self eventStore];
  int v4 = [v3 cachedConstraintsForCalendar:self];

  return v4;
}

- (void)setSource:(EKSource *)source
{
  uint64_t v4 = *MEMORY[0x1E4F56EA8];
  char v5 = source;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKSource frozenClass]];
  [(EKCalendar *)self setCanBeShared:[(EKSource *)v5 supportsSharedCalendars]];
  uint64_t v6 = [(EKSource *)v5 supportsSharedCalendars];

  [(EKCalendar *)self setCanBePublished:v6];
  if (([(EKCalendar *)self allowedEntityTypes] & 2) != 0
    && CalIsReminderBridgeEnabled())
  {
    id v12 = [(EKCalendar *)self source];
    uint64_t v7 = [v12 backingObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(EKObject *)self eventStore];
      uint64_t v10 = [v9 reminderSourceForEventSource:v8];

      if (v10)
      {
        uint64_t v11 = [v10 frozenObject];
        [v8 setReminderSource:v11];
      }
    }
  }
}

- (void)setAllowedEntities:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D50]];
}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  if (a3 == 2) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = 4 * (a3 == 1);
  }
  [(EKCalendar *)self setAllowedEntities:v3];
}

- (BOOL)hasEvents
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [(EKObject *)self eventStore];
  id v4 = [v3 connection];
  char v5 = [v4 CADOperationProxySync];
  uint64_t v6 = [(EKObject *)self CADObjectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __23__EKCalendar_hasEvents__block_invoke;
  v8[3] = &unk_1E5B99230;
  v8[4] = &v9;
  [v5 CADCalendar:v6 hasEvents:v8];

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __23__EKCalendar_hasEvents__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorCheckingW_1.isa, v3);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)hasEventsWithRoomAsAttendee
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(EKObject *)self eventStore];
  id v4 = [v3 connection];
  char v5 = [v4 CADOperationProxySync];
  uint64_t v6 = [(EKObject *)self CADObjectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __41__EKCalendar_hasEventsWithRoomAsAttendee__block_invoke;
  v8[3] = &unk_1E5B99230;
  v8[4] = &v9;
  [v5 CADCalendar:v6 hasEventsWithRoomAsAttendee:v8];

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __41__EKCalendar_hasEventsWithRoomAsAttendee__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorCheckingW_1.isa, v3);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)allowEvents
{
  return [(EKCalendar *)self allowedEntityTypes] & 1;
}

- (void)setAllowsEvents:(BOOL)a3
{
}

- (void)setAllowReminders:(BOOL)a3
{
}

- (EKCalendarEventAvailabilityMask)supportedEventAvailabilities
{
  if ([(EKCalendar *)self isSubscribed]) {
    return 0;
  }
  id v3 = [(EKCalendar *)self constraints];
  int v4 = [v3 canSetAvailability];

  if (!v4) {
    return 0;
  }
  char v5 = [(EKCalendar *)self constraints];
  int v6 = [v5 eventAvailabilityLimited];

  if (v6) {
    return 3;
  }
  else {
    return 15;
  }
}

- (id)refreshDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E40]];
}

- (void)setRefreshDate:(id)a3
{
}

- (int)refreshInterval
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E48]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setRefreshInterval:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56E48]];
}

- (id)subscriptionID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EC0]];
}

- (void)setSubscriptionID:(id)a3
{
}

- (id)subcalURL
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EB8]];
}

- (void)setSubcalURL:(id)a3
{
}

- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (a3 || v6)
  {
    uint64_t v7 = [[EKSyncError alloc] initWithAccountError:a3 userInfo:v6];
    [(EKCalendar *)self setSyncError:v7];
  }
  else
  {
    [(EKCalendar *)self setSyncError:0];
  }
}

- (id)lastSyncErrorUserInfo
{
  id v2 = [(EKCalendar *)self syncError];
  int v3 = [v2 userInfo];

  return v3;
}

- (void)setSyncError:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56ED0];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKSyncError frozenClass]];
}

- (id)calendarError
{
  int v3 = [(EKCalendar *)self syncError];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 errorType];
    uint64_t v6 = [v4 errorCode];
    uint64_t v7 = v6;
    if (v5 == 2)
    {
      if (v6)
      {
        id v8 = kEKCalendarErrorDomain;
        goto LABEL_8;
      }
    }
    else if (v5)
    {
      long long v13 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        [(EKCalendar *)v5 calendarError];
      }
    }
    else if (v6)
    {
      id v8 = kEKAccountErrorDomain;
LABEL_8:
      uint64_t v9 = *v8;
      uint64_t v10 = [v4 userInfo];
      uint64_t v11 = +[EKSyncError augmentSyncErrorUserInfo:v10 for:self];

      char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:v7 userInfo:v11];

      goto LABEL_12;
    }
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (void)setLastSyncStartDate:(id)a3
{
}

- (id)lastSyncStartDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DC0]];
}

- (void)setLastSyncEndDate:(id)a3
{
}

- (id)lastSyncEndDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DB8]];
}

- (BOOL)isSyncing
{
  int v3 = [(EKCalendar *)self lastSyncStartDate];
  uint64_t v4 = [(EKCalendar *)self lastSyncEndDate];
  uint64_t v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      char v6 = 1;
      goto LABEL_7;
    }
    if (([v3 isEqualToDate:v4] & 1) == 0)
    {
      uint64_t v7 = [v3 laterDate:v5];
      char v6 = [v7 isEqualToDate:v3];

      goto LABEL_7;
    }
  }
  char v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)stripAlarms
{
  return [(EKCalendar *)self _flagValueWithMask:0x200000];
}

- (void)setStripAlarms:(BOOL)a3
{
}

- (BOOL)stripAttachments
{
  return [(EKCalendar *)self _flagValueWithMask:0x400000];
}

- (void)setStripAttachments:(BOOL)a3
{
}

- (void)moveSubscribedCalendarToSource:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19;
  char v21 = __Block_byref_object_dispose__19;
  id v22 = 0;
  uint64_t v5 = [(EKObject *)self eventStore];
  char v6 = [v5 connection];
  uint64_t v7 = [v6 CADOperationProxySync];
  id v8 = [(EKObject *)self CADObjectID];
  uint64_t v9 = [v4 CADObjectID];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke;
  long long v14 = &unk_1E5B99258;
  long long v16 = &v17;
  id v10 = v5;
  id v15 = v10;
  [v7 CADDatabaseMigrateSubscribedCalendar:v8 toSource:v9 reply:&v11];

  if (v18[5])
  {
    -[EKObject setBackingObject:](self, "setBackingObject:", v11, v12, v13, v14);
    [(EKObject *)self _resetAfterUpdatingChangeSetOrBackingObject];
  }

  _Block_object_dispose(&v17, 8);
}

void __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    char v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke_cold_1(v6, a2);
    }
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v9 = [v7 registerFetchedObjectWithID:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (BOOL)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(EKCalendar *)self setExternalModificationTag:0];
  [(EKCalendar *)self setDigest:0];
  [(EKCalendar *)self setRefreshDate:0];
  id v5 = [(EKObject *)self eventStore];
  char v6 = [v5 predicateForCalendarItemsOfType:1 inCalendar:self];
  [v5 eventsMatchingPredicate:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v22 = v6;
    uint64_t v10 = a3;
    id v11 = 0;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      uint64_t v13 = 0;
      long long v14 = v11;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        objc_msgSend(v15, "removeServerRefreshRelatedProperties", v22);
        id v25 = v14;
        char v16 = [v5 saveEvent:v15 span:3 commit:0 error:&v25];
        id v11 = v25;

        if ((v16 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:]();
          }
          goto LABEL_12;
        }
        ++v13;
        long long v14 = v11;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
LABEL_12:

    a3 = v10;
    char v6 = v22;
    if (v11)
    {
LABEL_20:
      [v5 rollback];
      if (!a3)
      {
LABEL_24:
        BOOL v20 = 0;
        goto LABEL_25;
      }
LABEL_21:
      id v11 = v11;
      BOOL v20 = 0;
      *a3 = v11;
      goto LABEL_25;
    }
  }
  else
  {
  }
  id v24 = 0;
  char v17 = [v5 saveCalendar:self commit:0 error:&v24];
  id v18 = v24;
  id v11 = v18;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:]();
    }
    goto LABEL_20;
  }

  id v23 = 0;
  char v19 = [v5 commitWithRollback:&v23];
  id v11 = v23;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:]();
      if (!a3) {
        goto LABEL_24;
      }
    }
    else if (!a3)
    {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  BOOL v20 = 1;
LABEL_25:

  return v20;
}

- (BOOL)completable
{
  return [(EKCalendar *)self _flagValueWithMask:0x400000];
}

- (void)setCompletable:(BOOL)a3
{
}

- (id)sharees
{
  id v2 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56E90]];
  if ([v2 count]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setSharees:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56E90];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedMultiRelationObjects:v5 forKey:v4];
  char v6 = NSNumber;
  uint64_t v7 = [v5 count];

  [v6 numberWithInt:v7 != 0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(EKObject *)self setCachedValue:v8 forKey:v4];
}

- (void)addSharee:(id)a3
{
  [(EKObject *)self addCachedMeltedObject:a3 forMultiValueKey:*MEMORY[0x1E4F56E90]];
  uint64_t v4 = MEMORY[0x1E4F1CC38];

  [(EKObject *)self setCachedValue:v4 forKey:@"hasSharees"];
}

- (void)removeSharee:(id)a3
{
  [(EKObject *)self removeCachedMeltedObject:a3 forMultiValueKey:*MEMORY[0x1E4F56E90]];

  [(EKObject *)self clearCachedValueForKey:@"hasSharees"];
}

- (BOOL)hasSharees
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__EKCalendar_hasSharees__block_invoke;
  void v5[3] = &unk_1E5B96908;
  v5[4] = self;
  id v2 = [(EKObject *)self cachedValueForKey:@"hasSharees" populateBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __24__EKCalendar_hasSharees__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) sharees];
  BOOL v2 = [v1 count] != 0;

  char v3 = NSNumber;

  return [v3 numberWithBool:v2];
}

- (id)shareesAndOwner
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKCalendar *)self sharees];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count") + 1);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[EKCalendarShareeOrOwner shareeWithEKSharee:forCalendar:](EKCalendarShareeOrOwner, "shareeWithEKSharee:forCalendar:", *(void *)(*((void *)&v14 + 1) + 8 * i), self, (void)v14);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v11 = +[EKCalendarShareeOrOwner ownerForEKCalendar:self];
  if (v11) {
    [v4 addObject:v11];
  }
  uint64_t v12 = objc_msgSend(v4, "copy", (void)v14);

  return v12;
}

- (id)alarms
{
  BOOL v2 = [(EKCalendar *)self allAlarms];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_174];
    uint64_t v4 = [v2 filteredSetUsingPredicate:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __20__EKCalendar_alarms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSnoozed] ^ 1;
}

- (void)setAlarms:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v11 isSnoozed] & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v18 = objc_msgSend(v17, "snoozedAlarms", 0);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v24;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v24 != v21) {
                objc_enumerationMutation(v18);
              }
              [v5 addObject:*(void *)(*((void *)&v23 + 1) + 8 * k)];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v20);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  [(EKCalendar *)self setAllAlarms:v5];
}

- (id)allAlarms
{
  BOOL v2 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:*MEMORY[0x1E4F56D48]];
  if ([v2 count]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setAllAlarms:(id)a3
{
}

- (void)addAlarms:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithSet:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__EKCalendar_addAlarms___block_invoke;
  void v5[3] = &unk_1E5B992A0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __24__EKCalendar_addAlarms___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addCachedMeltedObject:a2 forMultiValueKey:*MEMORY[0x1E4F56D48]];
}

- (void)removeAlarms:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithSet:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__EKCalendar_removeAlarms___block_invoke;
  void v5[3] = &unk_1E5B992A0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __27__EKCalendar_removeAlarms___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeCachedMeltedObject:a2 forMultiValueKey:*MEMORY[0x1E4F56D48]];
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v12 = [v6 date];
  [v7 setAcknowledgedDate:v12];
  uint64_t v8 = [v7 duplicate];
  uint64_t v9 = [v12 dateByAddingTimeInterval:a4];
  [v8 setAbsoluteDate:v9];

  uint64_t v10 = [(EKCalendar *)self findOriginalAlarmStartingWith:v7];

  [v8 setOriginalAlarm:v10];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [(EKCalendar *)self addAlarms:v11];
}

- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5
{
  id v15 = a3;
  id v9 = a4;
  if (!a5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EKCalendar.m" lineNumber:2118 description:@"Can't snooze an alarm with location but no proximity."];
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v15 setAcknowledgedDate:v10];

  id v11 = [v15 duplicate];
  [v11 setStructuredLocation:v9];
  [v11 setProximity:a5];
  id v12 = [(EKCalendar *)self findOriginalAlarmStartingWith:v15];
  [v11 setOriginalAlarm:v12];
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  [(EKCalendar *)self addAlarms:v13];
}

- (BOOL)isAlarmAcknowledgedPropertyDirty
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D48]]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(EKCalendar *)self allAlarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x1E4F56A80];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _hasChangesForKey:v7])
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (void)removeAcknowledgedSnoozedAlarms
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(EKCalendar *)self allAlarms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isSnoozed])
        {
          uint64_t v10 = [v9 acknowledgedDate];

          if (v10) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  [(EKCalendar *)self removeAlarms:v11];
}

- (void)removeAllSnoozedAlarms
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(EKCalendar *)self allAlarms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isSnoozed]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  [(EKCalendar *)self removeAlarms:v10];
}

- (id)findOriginalAlarmStartingWith:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 originalAlarm];
  if (v4)
  {
    id v5 = [v3 originalAlarm];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v6 = v5;

  uint64_t v7 = [v6 originalAlarm];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    while (1)
    {
      BOOL v9 = [v6 externalID];
      uint64_t v10 = [v3 externalID];
      char v11 = [v9 isEqualToString:v10];

      if (v11) {
        break;
      }
      long long v12 = [v6 originalAlarm];

      uint64_t v8 = [v12 originalAlarm];
      uint64_t v6 = v12;
      if (!v8) {
        goto LABEL_10;
      }
    }
  }
  long long v12 = v6;
LABEL_10:

  return v12;
}

- selfIdentityDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  id v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E58]];
  if (!v3)
  {
    uint64_t v4 = [(EKCalendar *)self selfIdentityFirstName];
    id v5 = [(EKCalendar *)self selfIdentityLastName];
    id v3 = DisplayNameStringForIdentityWithProperties();
  }

  return v3;
}

- (void)setSelfIdentityDisplayName:(id)a3
{
}

- selfIdentityEmail
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E60]];
}

- (void)setSelfIdentityEmail:(id)a3
{
}

- selfIdentityPhoneNumber
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E78]];
}

- (void)setSelfIdentityPhoneNumber:(id)a3
{
}

- selfIdentityAddressString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E50]];
}

- (void)setSelfIdentityAddressString:(id)a3
{
}

- selfIdentityAddress
{
  void *v2;
  void *v3;
  uint64_t vars8;

  BOOL v2 = [(EKCalendar *)self selfIdentityAddressString];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setSelfIdentityAddress:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendar *)self setSelfIdentityAddressString:v4];
}

- selfIdentityFirstName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E68]];
}

- (void)setSelfIdentityFirstName:(id)a3
{
}

- selfIdentityLastName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E70]];
}

- (void)setSelfIdentityLastName:(id)a3
{
}

- (id)ownerIdentityDisplayName
{
  id v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DF8]];
  if (!v3)
  {
    id v4 = [(EKCalendar *)self ownerIdentityFirstName];
    id v5 = [(EKCalendar *)self ownerIdentityLastName];
    id v3 = DisplayNameStringForIdentityWithProperties();
  }

  return v3;
}

- (void)setOwnerIdentityDisplayName:(id)a3
{
  id v4 = a3;
  [(EKCalendar *)self setOwnerIdentityId:0xFFFFFFFFLL];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56DF8]];
}

- (int)ownerIdentityId
{
  BOOL v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E10]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setOwnerIdentityId:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56E10]];
}

- (id)ownerIdentityEmail
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E00]];
}

- (void)setOwnerIdentityEmail:(id)a3
{
}

- (id)ownerIdentityPhoneNumber
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E20]];
}

- (void)setOwnerIdentityPhoneNumber:(id)a3
{
}

- (id)ownerIdentityAddressString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DF0]];
}

- (void)setOwnerIdentityAddressString:(id)a3
{
}

- (id)ownerIdentityAddress
{
  BOOL v2 = [(EKCalendar *)self ownerIdentityAddressString];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (void)setOwnerIdentityAddress:(id)a3
{
  id v4 = a3;
  [(EKCalendar *)self setOwnerIdentityId:0xFFFFFFFFLL];
  id v5 = [v4 absoluteString];

  [(EKCalendar *)self setOwnerIdentityAddressString:v5];
}

- (id)ownerIdentityFirstName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E08]];
}

- (void)setOwnerIdentityFirstName:(id)a3
{
}

- (id)ownerIdentityLastName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E18]];
}

- (void)setOwnerIdentityLastName:(id)a3
{
}

- (id)ownerIdentityOrganizer
{
  int v3 = [(EKCalendar *)self ownerIdentityEmail];
  if (v3)
  {

LABEL_4:
    id v5 = [MEMORY[0x1E4F576B0] defaultProvider];
    uint64_t v6 = [(EKCalendar *)self ownerIdentityEmail];
    if ([v5 matchesOneOfMyEmails:v6])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F576B0] defaultProvider];
      BOOL v9 = [(EKCalendar *)self ownerIdentityAddress];
      uint64_t v7 = [v8 urlMatchesOneOfMyEmails:v9];
    }
    goto LABEL_8;
  }
  id v4 = [(EKCalendar *)self ownerIdentityAddress];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v7 = 1;
LABEL_8:
  uint64_t v10 = [EKOrganizer alloc];
  char v11 = [(EKCalendar *)self ownerIdentityDisplayName];
  long long v12 = [(EKCalendar *)self ownerIdentityEmail];
  long long v13 = [(EKCalendar *)self ownerIdentityPhoneNumber];
  long long v14 = [(EKCalendar *)self ownerIdentityAddress];
  long long v15 = [(EKOrganizer *)v10 initWithName:v11 emailAddress:v12 phoneNumber:v13 address:v14 isCurrentUser:v7];

  return v15;
}

- (id)pubcalAccountID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E28]];
}

- (void)setPubcalAccountID:(id)a3
{
}

- (id)subcalAccountID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56EB0]];
}

- (void)setSubcalAccountID:(id)a3
{
}

- (BOOL)supportsMultipleAlarms
{
  BOOL v2 = [(EKCalendar *)self constraints];
  unsigned int v3 = [v2 maxAlarmsAllowed];

  return v3 > 1;
}

- (id)notes
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56DE0]];
}

- (void)setNotes:(id)a3
{
}

- (id)pushKey
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56E38]];
}

- (void)setPushKey:(id)a3
{
}

- (id)digest
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D70]];
}

- (void)setDigest:(id)a3
{
}

- (BOOL)automaticEventLocationGeocodingAllowed
{
  if (![(EKCalendar *)self isSuggestedEventCalendar]) {
    return 1;
  }

  return +[EKFeatureSet automaticGeocodingEnabled];
}

- (BOOL)validate:(id *)a3
{
  id v5 = self;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)EKCalendar;
  if (!-[EKObject validate:](&v60, sel_validate_)) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t v6 = [(EKCalendar *)v5 source];

  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = 14;
LABEL_63:
    [v19 errorWithEKErrorCode:v20];
    BOOL v45 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v45;
  }
  if (([(EKCalendar *)v5 allowedEntityTypes] & 2) != 0)
  {
    uint64_t v7 = [(EKCalendar *)v5 source];
    char v8 = [v7 allowsTasks];

    if ((v8 & 1) == 0)
    {
      if (!a3) {
        return 0;
      }
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = 24;
      goto LABEL_63;
    }
  }
  if ([(EKCalendar *)v5 allowedEntityTypes])
  {
    BOOL v9 = [(EKCalendar *)v5 source];
    char v10 = [v9 allowsEvents];

    if ((v10 & 1) == 0)
    {
      if (!a3) {
        return 0;
      }
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = 25;
      goto LABEL_63;
    }
  }
  BOOL v11 = [(EKCalendar *)v5 isImmutable];
  long long v12 = (uint64_t *)MEMORY[0x1E4F56D98];
  if (v11)
  {
    uint64_t v13 = *MEMORY[0x1E4F56D98];
    long long v14 = [(EKObject *)v5 _previousValueForKey:*MEMORY[0x1E4F56D98]];
    char v15 = [v14 unsignedIntValue];

    if ((v15 & 4) != 0)
    {
      if (validate__onceToken != -1) {
        dispatch_once(&validate__onceToken, &__block_literal_global_191);
      }
      uint64_t v21 = [(EKObject *)v5 changeSet];
      unsigned int v3 = [v21 changedKeys];

      uint64_t v22 = [v3 count];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v23 = v3;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v24)
      {
        unsigned int v3 = (void *)v24;
        uint64_t v25 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(v23);
            }
            long long v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if ([(id)validate____DirtyPropertiesToIgnore containsObject:v27])
            {
              --v22;
            }
            else if ([v27 isEqualToString:v13])
            {
              unsigned int v55 = [(EKCalendar *)v5 flags];
              [(EKObject *)v5 _previousValueForKey:v13];
              uint64_t v28 = v13;
              id v29 = v23;
              v31 = long long v30 = v5;
              long long v32 = v3;
              uint64_t v33 = v22;
              uint64_t v34 = v25;
              int v35 = [v31 unsignedIntValue];

              id v5 = v30;
              id v23 = v29;
              uint64_t v13 = v28;
              int v36 = v35 ^ v55;
              uint64_t v25 = v34;
              uint64_t v37 = v33;
              unsigned int v3 = v32;
              uint64_t v22 = v37 - ((v36 & 0xFFFEFFFF) == 0);
            }
          }
          unsigned int v3 = (void *)[v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v3);
      }

      a3 = v54;
      if (v54 && v22 >= 1)
      {
        id *v54 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:16];

        return 0;
      }

      long long v12 = (uint64_t *)MEMORY[0x1E4F56D98];
      if (v22 > 0) {
        return 0;
      }
    }
  }
  BOOL v16 = [(EKObject *)v5 isNew];
  uint64_t v17 = *MEMORY[0x1E4F56EA8];
  if (!v16 && [(EKObject *)v5 _hasChangesForKey:*MEMORY[0x1E4F56EA8]])
  {
    id v18 = [(EKObject *)v5 eventStore];
    if ([v18 skipModificationValidation])
    {
    }
    else
    {
      char v38 = [MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement];

      if ((v38 & 1) == 0)
      {
        if (![MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp]) {
          goto LABEL_61;
        }
        v46 = [(EKObject *)v5 committedValueForKey:v17];
        v47 = [(EKCalendar *)v5 source];
        if ([v46 sourceType]) {
          BOOL v48 = 0;
        }
        else {
          BOOL v48 = [v47 sourceType] == 0;
        }

        if (a3 && !v48) {
          goto LABEL_62;
        }
        if (!v48) {
          return 0;
        }
      }
    }
  }
  if (![(EKObject *)v5 _hasChangesForKey:v17]) {
    goto LABEL_50;
  }
  v39 = [(EKObject *)v5 eventStore];
  if ([v39 eventAccessLevel] == 1)
  {
    BOOL v40 = [(EKCalendar *)v5 allowEvents];

    if (v40)
    {
LABEL_61:
      if (a3)
      {
LABEL_62:
        uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = 15;
        goto LABEL_63;
      }
      return 0;
    }
  }
  else
  {
  }
  v41 = [(EKObject *)v5 eventStore];
  if ([v41 skipModificationValidation]) {
    goto LABEL_49;
  }
  v42 = [(EKCalendar *)v5 source];
  if (([v42 supportsCalendarCreation] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) != 0)
  {
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
  uint64_t v49 = [(EKCalendar *)v5 type];
  if (v49 != 4)
  {
    if ([(EKCalendar *)v5 type] == (EKCalendarTypeBirthday|EKCalendarTypeExchange)) {
      goto LABEL_75;
    }
LABEL_80:

    goto LABEL_81;
  }
  unsigned int v3 = [(EKObject *)v5 eventStore];
  if ([v3 allowsBirthdayModifications])
  {

    goto LABEL_48;
  }
  if ([(EKCalendar *)v5 type] != (EKCalendarTypeBirthday|EKCalendarTypeExchange))
  {

    goto LABEL_80;
  }
LABEL_75:
  v50 = v5;
  v51 = [(EKObject *)v5 eventStore];
  char v52 = [v51 allowsIntegrationModifications];

  if (v49 == 4) {
  id v5 = v50;
  }
  if ((v52 & 1) == 0)
  {
LABEL_81:
    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = 17;
      goto LABEL_63;
    }
    return 0;
  }
LABEL_50:
  uint64_t v43 = *v12;
  if (![(EKObject *)v5 _hasChangesForKey:*v12]
    || ![(EKCalendar *)v5 isDefaultSchedulingCalendar])
  {
    return 1;
  }
  v44 = [(EKObject *)v5 _previousValueForKey:v43];
  if (([v44 unsignedIntValue] & 0x400) != 0)
  {

    return 1;
  }
  BOOL v45 = [(EKCalendar *)v5 eligibleForDefaultSchedulingCalendar];

  if (a3 && !v45)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = 70;
    goto LABEL_63;
  }
  return v45;
}

uint64_t __23__EKCalendar_validate___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F56D78], *MEMORY[0x1E4F56D68], *MEMORY[0x1E4F56D60], *MEMORY[0x1E4F56EC8], 0);
  uint64_t v1 = validate____DirtyPropertiesToIgnore;
  validate____DirtyPropertiesToIgnore = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)save:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(EKObject *)self insertPersistentObjectIfNeeded];
  if ([(EKCalendar *)self isAlarmAcknowledgedPropertyDirty]) {
    [(EKCalendar *)self removeAcknowledgedSnoozedAlarms];
  }
  [(EKCalendar *)self assignColorForNewCalendarIfNeeded];
  if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56DA0]])
  {
    id v4 = [(EKCalendar *)self image];
    [v4 saveInCalendar:self];

    id v5 = [(EKObject *)self changeSet];
    uint64_t v6 = [(EKCalendar *)self image];
    uint64_t v7 = [v6 backingObject];
    [v5 forceChangeValue:v7 forKey:*MEMORY[0x1E4F56FC8]];
  }
  [(EKObject *)self updatePersistentObject];
  return 1;
}

- (BOOL)remove:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  id v5 = [(EKObject *)self eventStore];
  if ([v5 skipModificationValidation])
  {

LABEL_6:
    [(EKObject *)self deletePersistentObject];
    return 1;
  }
  char v6 = [MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement];

  if (v6) {
    goto LABEL_6;
  }
  if (![(EKCalendar *)self isImmutable])
  {
    if ([(EKCalendar *)self _validateDeletable:a3]) {
      goto LABEL_6;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  char v8 = [(EKCalendar *)self constraints];
  char v9 = [v8 allowsCalendarAddDeleteModify];

  if (v9) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 17;
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v10];
  BOOL result = 0;
  *a3 = v11;
  return result;
}

- (BOOL)isManaged
{
  unsigned int v3 = [(EKObject *)self eventStore];
  id v4 = [(EKCalendar *)self source];
  char v5 = [v3 isSourceManaged:v4];

  return v5;
}

- (id)exportData
{
  return [(EKCalendar *)self exportDataWithOptions:0];
}

- (id)exportDataWithOptions:(unint64_t)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__19;
  BOOL v16 = __Block_byref_object_dispose__19;
  id v17 = 0;
  char v5 = [(EKObject *)self eventStore];
  char v6 = [v5 connection];
  uint64_t v7 = [v6 CADOperationProxySync];
  char v8 = [(EKObject *)self CADObjectID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__EKCalendar_exportDataWithOptions___block_invoke;
  v11[3] = &unk_1E5B976B8;
  v11[4] = &v12;
  [v7 CADDatabaseExportICSDataForCalendar:v8 options:a3 reply:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __36__EKCalendar_exportDataWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKCalendar_exportDataWithOptions___block_invoke_cold_1(v7, a2);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (BOOL)supportsJunkReporting
{
  BOOL v2 = [(EKCalendar *)self constraints];
  char v3 = [v2 supportsJunkReporting];

  return v3;
}

- (void)setIsJunk:(BOOL)a3
{
  if (a3)
  {
    [(EKCalendar *)self setCachedJunkStatus:1];
    id v4 = [MEMORY[0x1E4F5E950] sharedConnection];
    char v5 = [(EKCalendar *)self calendarIdentifier];
    id v6 = [(EKCalendar *)self source];
    uint64_t v7 = [v6 externalID];
    [v4 reportSharedCalendarInviteAsJunkForCalendarWithID:v5 accountID:v7 queue:MEMORY[0x1E4F14428] completionBlock:&__block_literal_global_196];

    [(EKCalendar *)self setCachedJunkStatus:1];
  }
  else
  {
    [(EKCalendar *)self setCachedJunkStatus:2];
    id v10 = [(EKCalendar *)self sharedOwnerName];
    char v8 = [(EKCalendar *)self sharedOwnerEmail];
    id v9 = [(EKCalendar *)self sharedOwnerPhoneNumber];
    +[EKRecents recordRecentForContactWithName:v10 emailAddress:v8 phoneNumber:v9];
  }
}

void __24__EKCalendar_setIsJunk___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __24__EKCalendar_setIsJunk___block_invoke_cold_1();
  }
}

- (BOOL)couldBeJunk
{
  if (![(EKCalendar *)self cachedJunkStatus]) {
    [(EKCalendar *)self setCachedJunkStatus:+[EKJunkInvitationProtocol_Shared junkStatusForInvitation:self]];
  }
  return [(EKCalendar *)self cachedJunkStatus] == 3
      || [(EKCalendar *)self cachedJunkStatus] == 1;
}

- (unint64_t)cachedJunkStatus
{
  return self->_cachedJunkStatus;
}

- (void)setCachedJunkStatus:(unint64_t)a3
{
  self->_cachedJunkStatus = a3;
}

+ (void)calendarForEntityTypes:(os_log_t)log eventStore:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store in initialization of EKCalendar instance", v1, 2u);
}

- (void)_validateDeletableHelperWithAllKnownCalendars:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Validating deletion on an EKCalendar that allows both events and reminders. This may not work as expected: %@", v2, v3, v4, v5, v6);
}

- (void)canMergeWithCalendar:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 title];
  id v7 = [a3 title];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_10_1(&dword_1A4E47000, v8, v9, "Can't merge %@ with %@ because they are the same calendar.", v10, v11, v12, v13, v14);
}

- (void)canMergeWithCalendar:.cold.2()
{
  OUTLINED_FUNCTION_7_1();
  id v4 = v3;
  [(id)OUTLINED_FUNCTION_4_4() title];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_6_1() title];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_5_3() title];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1A4E47000, v6, v7, "Can't merge %@ with %@ because %@ is a shared calendar", v8, v9, v10, v11, v12);
}

- (void)canMergeWithCalendar:.cold.3()
{
  OUTLINED_FUNCTION_7_1();
  id v4 = v3;
  [(id)OUTLINED_FUNCTION_4_4() title];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_6_1() title];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_5_3() title];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1A4E47000, v6, v7, "Can't merge %@ with %@ because %@ is a reminder list", v8, v9, v10, v11, v12);
}

- (void)canMergeWithCalendar:.cold.4()
{
  OUTLINED_FUNCTION_7_1();
  id v4 = v3;
  [(id)OUTLINED_FUNCTION_4_4() title];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_6_1() title];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_5_3() title];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1A4E47000, v6, v7, "Can't merge %@ with %@ because %@ isn't deletable", v8, v9, v10, v11, v12);
}

- (void)canMergeWithCalendar:(void *)a3 .cold.5(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1;
  [a2 title];
  objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(id)OUTLINED_FUNCTION_5_3() title];
  uint64_t v8 = [a3 title];
  uint64_t v9 = [a2 title];
  int v10 = 138413058;
  uint64_t v11 = v3;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  char v15 = v8;
  __int16 v16 = 2112;
  id v17 = v9;
  _os_log_debug_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_DEBUG, "Can't merge %@ with %@ because this account doesn't support sharing scheduling and %@ is a shared calendar and %@ isn't.", (uint8_t *)&v10, 0x2Au);
}

- (void)canMergeWithCalendar:.cold.6()
{
  OUTLINED_FUNCTION_7_1();
  id v4 = v3;
  id v5 = [(id)OUTLINED_FUNCTION_4_4() title];
  [v1 title];
  objc_claimAutoreleasedReturnValue();
  __int16 v12 = [(id)OUTLINED_FUNCTION_6_1() title];
  OUTLINED_FUNCTION_1_7(&dword_1A4E47000, v6, v7, "Can't merge %@ with %@ because %@ doesn't allow content modifications", v8, v9, v10, v11, 2u);
}

- (void)canMergeWithCalendar:.cold.7()
{
  OUTLINED_FUNCTION_7_1();
  id v4 = v3;
  [(id)OUTLINED_FUNCTION_4_4() title];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_6_1() title];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_5_3() title];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1A4E47000, v6, v7, "Can't merge %@ with %@ because %@ doesn't allow content modifications", v8, v9, v10, v11, v12);
}

- (void)canMergeWithCalendar:(void *)a3 .cold.8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 title];
  uint64_t v7 = [a3 title];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_10_1(&dword_1A4E47000, v8, v9, "Can't merge %@ with %@ because they are in different sources.", v10, v11, v12, v13, v14);
}

void __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error deserializing external info: %@", v2, v3, v4, v5, v6);
}

void __32__EKCalendar_cachedExternalInfo__block_invoke_cold_2(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  id v3 = v2;
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "Unexpected type for external info: %{public}@", v4, 0xCu);
}

- (void)setCachedExternalInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error serializing external info: %@", v2, v3, v4, v5, v6);
}

- (void)calendarError
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Unexpected error type (%d) in calendar error on calendar %@", (uint8_t *)v3, 0x12u);
}

void __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  uint64_t v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Error moving subscribed calendar: %@", v8, v9, v10, v11, v12);
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error committing calendar & events during removeServerRefreshRelatedProperties. Error: %@", v2, v3, v4, v5, v6);
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error saving calendar during removeServerRefreshRelatedProperties. Error: %@", v2, v3, v4, v5, v6);
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error saving event during removeServerRefreshRelatedProperties. Error: %@", v2, v3, v4, v5, v6);
}

void __36__EKCalendar_exportDataWithOptions___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  uint64_t v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Unable to export calendar data: %@", v8, v9, v10, v11, v12);
}

void __24__EKCalendar_setIsJunk___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error trying to report calendar invite as junk. Error: %@", v2, v3, v4, v5, v6);
}

@end