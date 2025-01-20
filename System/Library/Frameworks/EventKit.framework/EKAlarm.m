@interface EKAlarm
+ (BOOL)areLocationsAllowed;
+ (BOOL)areLocationsAllowedWithAuthorizationStatus:(int)a3;
+ (BOOL)areLocationsAvailable;
+ (BOOL)areLocationsCurrentlyEnabled;
+ (Class)frozenClass;
+ (EKAlarm)alarmWithAbsoluteDate:(NSDate *)date;
+ (EKAlarm)alarmWithRelativeOffset:(NSTimeInterval)offset;
+ (double)defaultGeofencedReminderRadius;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipMultiValueKeys;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (int)_currentAuthorizationStatus;
+ (int64_t)maxPublicProximity;
- (BOOL)_reset;
- (BOOL)isAbsolute;
- (BOOL)isDefaultAlarm;
- (BOOL)isSnoozed;
- (BOOL)isTopographicallyEqualToAlarm:(id)a3;
- (BOOL)validateWithOwner:(id)a3 error:(id *)a4;
- (EKAlarm)init;
- (EKAlarm)initWithAbsoluteDate:(id)a3;
- (EKAlarm)initWithRelativeOffset:(double)a3;
- (EKAlarm)originalAlarm;
- (EKAlarmProximity)proximity;
- (EKAlarmType)type;
- (EKCalendar)calendarOwner;
- (EKCalendarItem)calendarItemOwner;
- (EKObject)owner;
- (EKStructuredLocation)structuredLocation;
- (NSArray)snoozedAlarms;
- (NSDate)absoluteDate;
- (NSString)UUID;
- (NSString)emailAddress;
- (NSString)externalID;
- (NSString)soundName;
- (NSTimeInterval)relativeOffset;
- (NSURL)url;
- (id)acknowledgedDate;
- (id)bookmarkURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)ownerUUID;
- (id)relativeOffsetRaw;
- (id)semanticIdentifier;
- (id)snoozedAlarmsSet;
- (id)urlWrapper;
- (int64_t)compare:(id)a3;
- (void)_setEmailAddress:(id)a3;
- (void)_setType:(int64_t)a3;
- (void)_setUrlWrapper:(id)a3;
- (void)addSnoozedAlarm:(id)a3;
- (void)rebaseForDetachment;
- (void)removeSnoozedAlarm:(id)a3;
- (void)setAbsoluteDate:(NSDate *)absoluteDate;
- (void)setAcknowledgedDate:(id)a3;
- (void)setBookmarkURL:(id)a3;
- (void)setDefaultAlarm:(BOOL)a3;
- (void)setEmailAddress:(NSString *)emailAddress;
- (void)setExternalID:(id)a3;
- (void)setOriginalAlarm:(id)a3;
- (void)setProximity:(EKAlarmProximity)proximity;
- (void)setRelativeOffset:(NSTimeInterval)relativeOffset;
- (void)setRelativeOffsetRaw:(id)a3;
- (void)setSnoozedAlarms:(id)a3;
- (void)setSnoozedAlarmsSet:(id)a3;
- (void)setSoundName:(NSString *)soundName;
- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUrl:(NSURL *)url;
- (void)setUrlWrapper:(id)a3;
@end

@implementation EKAlarm

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_4 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_4, &__block_literal_global_65);
  }
  v2 = (void *)knownRelationshipSingleValueKeys_keys_4;

  return v2;
}

void __43__EKAlarm_knownRelationshipSingleValueKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F56AD0];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipSingleValueKeys_keys_4;
  knownRelationshipSingleValueKeys_keys_4 = v0;
}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_4 != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_4, &__block_literal_global_13_0);
  }
  v2 = (void *)knownRelationshipMultiValueKeys_keys_4;

  return v2;
}

void __42__EKAlarm_knownRelationshipMultiValueKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F56AC8];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipMultiValueKeys_keys_4;
  knownRelationshipMultiValueKeys_keys_4 = v0;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_8 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_8, &__block_literal_global_15);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_8;

  return v2;
}

void __41__EKAlarm_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_8;
  knownIdentityKeysForComparison_keys_8 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_7 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_7, &__block_literal_global_17);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_7;

  return v2;
}

void __44__EKAlarm_knownSingleValueKeysForComparison__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56A80];
  v6[0] = *MEMORY[0x1E4F56A78];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56AA8];
  v6[2] = *MEMORY[0x1E4F56AD8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56AC0];
  v6[4] = *MEMORY[0x1E4F56AB8];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56AE0];
  v6[6] = *MEMORY[0x1E4F56A98];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v5 = (void *)knownSingleValueKeysForComparison_keys_7;
  knownSingleValueKeysForComparison_keys_7 = v4;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_5 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_5, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_5;

  return v2;
}

void __36__EKAlarm_knownRelationshipWeakKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56A88];
  v3[0] = *MEMORY[0x1E4F56A90];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_5;
  knownRelationshipWeakKeys_keys_5 = v1;
}

+ (EKAlarm)alarmWithAbsoluteDate:(NSDate *)date
{
  uint64_t v4 = date;
  v5 = (void *)[objc_alloc((Class)a1) initWithAbsoluteDate:v4];

  return (EKAlarm *)v5;
}

+ (EKAlarm)alarmWithRelativeOffset:(NSTimeInterval)offset
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithRelativeOffset:offset];

  return (EKAlarm *)v3;
}

+ (int64_t)maxPublicProximity
{
  return 2;
}

- (EKAlarm)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKAlarm;
  uint64_t v2 = [(EKObject *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(EKAlarm *)v2 setType:0];
    uint64_t v4 = EKUUIDString();
    [(EKAlarm *)v3 setUUID:v4];

    v5 = [(EKAlarm *)v3 UUID];
    [(EKAlarm *)v3 setExternalID:v5];

    [(EKObject *)v3 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
  }
  return v3;
}

- (EKAlarm)initWithAbsoluteDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"EKAlarm.m", 138, @"Invalid parameter not satisfying: %@", @"date != nil" object file lineNumber description];
  }
  v6 = [(EKAlarm *)self init];
  objc_super v7 = v6;
  if (v6) {
    [(EKAlarm *)v6 setAbsoluteDate:v5];
  }

  return v7;
}

- (EKAlarm)initWithRelativeOffset:(double)a3
{
  uint64_t v4 = [(EKAlarm *)self init];
  id v5 = v4;
  if (v4) {
    [(EKAlarm *)v4 setRelativeOffset:a3];
  }
  return v5;
}

- (EKObject)owner
{
  uint64_t v3 = [(EKAlarm *)self calendarItemOwner];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(EKAlarm *)self calendarOwner];
  }
  v6 = v5;

  return (EKObject *)v6;
}

- (EKCalendarItem)calendarItemOwner
{
  return (EKCalendarItem *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56A88]];
}

- (EKCalendar)calendarOwner
{
  return (EKCalendar *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56A90]];
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (void)rebaseForDetachment
{
  id v3 = [(EKAlarm *)self UUID];
  [(EKObject *)self rebase];
  [(EKAlarm *)self setExternalID:v3];
  [(EKAlarm *)self setUUID:v3];
  [(EKObject *)self updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
}

- (EKAlarmType)type
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AD8]];
  EKAlarmType v3 = [v2 integerValue];

  return v3;
}

- (void)_setType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56AD8]];
}

- (void)setType:(int64_t)a3
{
  if (a3 == 3 || ([(EKAlarm *)self _setEmailAddress:0], a3 != 2)) {
    [(EKAlarm *)self _setUrlWrapper:0];
  }

  [(EKAlarm *)self _setType:a3];
}

- (id)relativeOffsetRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AC0]];
}

- (void)setRelativeOffsetRaw:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56A78];
  id v5 = a3;
  [(EKObject *)self setSingleChangedValue:0 forKey:v4];
  [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F56AC0]];
}

- (NSTimeInterval)relativeOffset
{
  if (![(EKAlarm *)self isDefaultAlarm]) {
    goto LABEL_7;
  }
  EKAlarmType v3 = [(EKAlarm *)self calendarItemOwner];
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v3 defaultAlarms],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 anyObject],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {

LABEL_7:
    EKAlarmType v3 = [(EKAlarm *)self relativeOffsetRaw];
    [v3 doubleValue];
    double v7 = v8;
    goto LABEL_8;
  }
  [v5 relativeOffset];
  double v7 = v6;

LABEL_8:
  return v7;
}

- (void)setRelativeOffset:(NSTimeInterval)relativeOffset
{
  id v4 = [NSNumber numberWithDouble:relativeOffset];
  [(EKAlarm *)self setRelativeOffsetRaw:v4];
}

- (NSDate)absoluteDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56A78]];
}

- (void)setAbsoluteDate:(NSDate *)absoluteDate
{
  v9 = absoluteDate;
  id v4 = [(EKAlarm *)self absoluteDate];

  id v5 = v9;
  if (v4 != v9)
  {
    [(EKObject *)self setSingleChangedValue:0 forKey:*MEMORY[0x1E4F56AC0]];
    if (v9)
    {
      double v6 = (void *)MEMORY[0x1E4F1C9C8];
      [(NSDate *)v9 timeIntervalSinceReferenceDate];
      double v8 = [v6 dateWithTimeIntervalSinceReferenceDate:floor(v7)];
    }
    else
    {
      double v8 = 0;
    }
    [(EKObject *)self setSingleChangedValue:v8 forKey:*MEMORY[0x1E4F56A78]];

    id v5 = v9;
  }
}

- (id)acknowledgedDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56A80]];
}

- (void)setAcknowledgedDate:(id)a3
{
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setExternalID:(id)a3
{
}

- (BOOL)isAbsolute
{
  uint64_t v2 = [(EKAlarm *)self absoluteDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setProximity:(EKAlarmProximity)proximity
{
  id v4 = [NSNumber numberWithInteger:proximity];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56AB8]];
}

- (EKAlarmProximity)proximity
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AB8]];
  EKAlarmProximity v3 = [v2 integerValue];

  return v3;
}

- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation
{
  uint64_t v4 = *MEMORY[0x1E4F56AD0];
  id v5 = structuredLocation;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKStructuredLocation frozenClass]];
}

- (EKStructuredLocation)structuredLocation
{
  return (EKStructuredLocation *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56AD0]];
}

- (id)ownerUUID
{
  uint64_t v2 = [(EKAlarm *)self calendarItemOwner];
  EKAlarmProximity v3 = [v2 calendarItemIdentifier];

  return v3;
}

- (BOOL)isDefaultAlarm
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AA8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDefaultAlarm:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56AA8]];
}

- (EKAlarm)originalAlarm
{
  return (EKAlarm *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56AB0]];
}

- (void)setOriginalAlarm:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56AB0];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKAlarm frozenClass]];
}

- (id)snoozedAlarmsSet
{
  return [(EKObject *)self cachedMeltedObjectsForMultiValueKey:*MEMORY[0x1E4F56AC8]];
}

- (void)setSnoozedAlarmsSet:(id)a3
{
}

- (NSArray)snoozedAlarms
{
  uint64_t v2 = [(EKAlarm *)self snoozedAlarmsSet];
  char v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)setSnoozedAlarms:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(EKAlarm *)self setSnoozedAlarmsSet:v4];
}

- (void)addSnoozedAlarm:(id)a3
{
}

- (void)removeSnoozedAlarm:(id)a3
{
}

- (BOOL)isSnoozed
{
  uint64_t v2 = [(EKAlarm *)self originalAlarm];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setEmailAddress:(id)a3
{
}

- (void)setEmailAddress:(NSString *)emailAddress
{
  double v6 = emailAddress;
  if (emailAddress) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [(EKAlarm *)self setType:v5];
  [(EKAlarm *)self _setEmailAddress:v6];
}

- (NSString)emailAddress
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56A98]];
}

- (id)urlWrapper
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AE0]];
}

- (void)_setUrlWrapper:(id)a3
{
}

- (void)setUrlWrapper:(id)a3
{
  BOOL v4 = a3 != 0;
  id v5 = a3;
  [(EKAlarm *)self setType:2 * v4];
  [(EKAlarm *)self _setUrlWrapper:v5];
}

- (void)setBookmarkURL:(id)a3
{
  if (a3)
  {
    BOOL v4 = (objc_class *)MEMORY[0x1E4F28FF8];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithURL:v5 readonly:1];
  }
  else
  {
    id v6 = 0;
  }
  [(EKAlarm *)self setUrlWrapper:v6];
}

- (id)bookmarkURL
{
  uint64_t v2 = [(EKAlarm *)self urlWrapper];
  BOOL v3 = [v2 url];

  return v3;
}

- (void)setUrl:(NSURL *)url
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F28FF8];
  id v5 = url;
  id v6 = (id)[[v4 alloc] initWithURL:v5 readonly:1];

  [(EKAlarm *)self setUrlWrapper:v6];
}

- (NSURL)url
{
  uint64_t v2 = [(EKAlarm *)self urlWrapper];
  BOOL v3 = [v2 url];

  return (NSURL *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v12.receiver = self;
    v12.super_class = (Class)EKAlarm;
    return [(EKObject *)&v12 copyWithZone:a3];
  }
  else
  {
    BOOL v6 = [(EKAlarm *)self isAbsolute];
    double v7 = [EKAlarm alloc];
    if (v6)
    {
      double v8 = [(EKAlarm *)self absoluteDate];
      id v5 = [(EKAlarm *)v7 initWithAbsoluteDate:v8];
    }
    else
    {
      [(EKAlarm *)self relativeOffset];
      id v5 = -[EKAlarm initWithRelativeOffset:](v7, "initWithRelativeOffset:");
    }
    v9 = [(EKAlarm *)self structuredLocation];
    v10 = (void *)[v9 copy];
    [(EKAlarm *)v5 setStructuredLocation:v10];

    [(EKAlarm *)v5 setProximity:[(EKAlarm *)self proximity]];
    [(EKAlarm *)v5 setType:[(EKAlarm *)self type]];
  }
  return v5;
}

- (id)description
{
  BOOL v3 = [(EKAlarm *)self isAbsolute];
  BOOL v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    BOOL v6 = [(EKAlarm *)self absoluteDate];
    double v7 = [v4 stringWithFormat:@"%@ <%p> {triggerDate = %@}", v5, self, v6];
  }
  else
  {
    [(EKAlarm *)self relativeOffset];
    double v7 = [v4 stringWithFormat:@"%@ <%p> {triggerInterval = %lf}", v5, self, v8];
  }

  return v7;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EKAlarm;
  if (![(EKObject *)&v19 validateWithOwner:v6 error:a4]) {
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [v6 constraints];
    char v8 = [v7 supportsAlarmProximity];

    if (v8) {
      goto LABEL_18;
    }
LABEL_11:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 _hasChangesForKey:*MEMORY[0x1E4F56BB0]])
      {
        v13 = [v6 committedConstraints];
        char v14 = [v13 supportsAlarmProximity];

        if (v14) {
          goto LABEL_18;
        }
      }
    }
    if ([(EKAlarm *)self proximity] == EKAlarmProximityNone)
    {
      v15 = [(EKAlarm *)self structuredLocation];

      if (!v15) {
        goto LABEL_18;
      }
    }
    if (a4)
    {
      uint64_t v16 = 21;
LABEL_21:
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v16];
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 calendar];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v9 = v6;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_19:
    if (a4)
    {
      uint64_t v16 = 1;
      goto LABEL_21;
    }
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
  v11 = [v9 constraints];
  char v12 = [v11 supportsAlarmProximity];

  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_18:
  BOOL v17 = 1;
LABEL_23:

  return v17;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ([(EKObject *)self isEqual:v4])
  {
    int64_t v5 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = [(EKAlarm *)self absoluteDate];
  if (v6)
  {
    double v7 = (void *)v6;
    char v8 = [v4 absoluteDate];

    if (v8)
    {
      id v9 = [(EKAlarm *)self absoluteDate];
      v10 = [v4 absoluteDate];
      int64_t v5 = [v9 compare:v10];
LABEL_10:

      goto LABEL_17;
    }
  }
  [(EKAlarm *)self relativeOffset];
  double v12 = v11;
  [v4 relativeOffset];
  if (vabdd_f64(v12, v13) >= 2.22044605e-16)
  {
    [(EKAlarm *)self relativeOffset];
    double v20 = v19;
    [v4 relativeOffset];
    if (v20 <= v21) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = -1;
    }
  }
  else
  {
    uint64_t v14 = [(EKAlarm *)self structuredLocation];
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = [v4 structuredLocation];

      if (v16)
      {
        id v9 = [(EKAlarm *)self structuredLocation];
        v10 = [v9 title];
        BOOL v17 = [v4 structuredLocation];
        v18 = [v17 title];
        int64_t v5 = [v10 compare:v18];

        goto LABEL_10;
      }
    }
    v22 = [(EKAlarm *)self structuredLocation];

    if (v22)
    {
      int64_t v5 = -1;
    }
    else
    {
      v23 = [v4 structuredLocation];

      int64_t v5 = v23 != 0;
    }
  }
LABEL_17:

  return v5;
}

- (BOOL)isTopographicallyEqualToAlarm:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(EKAlarm *)self absoluteDate];
    uint64_t v6 = [v4 absoluteDate];
    double v7 = (void *)v6;
    if (v5) {
      int v8 = [v5 isEqualToDate:v6];
    }
    else {
      int v8 = v6 == 0;
    }
    [(EKAlarm *)self relativeOffset];
    double v11 = v10;
    [v4 relativeOffset];
    double v13 = vabdd_f64(v11, v12);
    uint64_t v14 = [(EKAlarm *)self structuredLocation];
    uint64_t v15 = [v4 structuredLocation];
    if (v14 | v15) {
      char v16 = [(id)v14 isEqual:v15];
    }
    else {
      char v16 = 1;
    }
    if (v13 < 2.22044605e-16) {
      char v17 = v16;
    }
    else {
      char v17 = 0;
    }
    if (v8) {
      BOOL v9 = v17;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_reset
{
  v7.receiver = self;
  v7.super_class = (Class)EKAlarm;
  BOOL v3 = [(EKObject *)&v7 _reset];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __17__EKAlarm__reset__block_invoke;
    v6[3] = &unk_1E5B98120;
    v6[4] = self;
    LOBYTE(v3) = [(EKObject *)self _resetIfBackingObjectIsOfClass:v4 fetchResetFrozenObjectBlock:v6];
  }
  return v3;
}

id __17__EKAlarm__reset__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 eventStore];
  int64_t v5 = [v4 reminderStore];
  uint64_t v6 = [v5 resetBackingAlarmWithBackingAlarm:v3];

  return v6;
}

+ (BOOL)areLocationsAvailable
{
  return MGGetBoolAnswer();
}

+ (int)_currentAuthorizationStatus
{
  uint64_t v2 = (void *)MEMORY[0x1E4F57748];
  id v3 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/RemindersAlerts.bundle"];
  LODWORD(v2) = [v2 authorizationStatusForBundle:v3];

  return (int)v2;
}

+ (BOOL)areLocationsAllowed
{
  uint64_t v3 = [a1 _currentAuthorizationStatus];

  return [a1 areLocationsAllowedWithAuthorizationStatus:v3];
}

+ (BOOL)areLocationsAllowedWithAuthorizationStatus:(int)a3
{
  BOOL result = [a1 areLocationsAvailable];
  if (a3 == 2) {
    return 0;
  }
  return result;
}

+ (BOOL)areLocationsCurrentlyEnabled
{
  int v3 = [a1 areLocationsAvailable];
  if (v3) {
    LOBYTE(v3) = [a1 _currentAuthorizationStatus] != 2;
  }
  return v3;
}

+ (double)defaultGeofencedReminderRadius
{
  return 100.0;
}

- (id)semanticIdentifier
{
  return +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarm:self];
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(NSString *)soundName
{
}

- (void).cxx_destruct
{
}

@end