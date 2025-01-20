@interface EKResourceChange
+ (Class)frozenClass;
+ (id)calendarItemPropertyName;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipWeakKeys;
- (BOOL)_propertyWithFlagDidChange:(unsigned int)a3;
- (BOOL)alerted;
- (BOOL)dateChanged;
- (BOOL)locationChanged;
- (BOOL)timeChanged;
- (BOOL)titleChanged;
- (EKCalendar)calendar;
- (EKCalendarItem)calendarItem;
- (NSDate)timestamp;
- (NSNumber)createCount;
- (NSNumber)deleteCount;
- (NSNumber)updateCount;
- (NSString)changedByDisplayName;
- (NSString)changedByFirstName;
- (NSString)changedByLastName;
- (NSString)deletedTitle;
- (NSURL)changedByAddress;
- (id)emailAddress;
- (id)notification;
- (id)phoneNumber;
- (unsigned)changeType;
- (unsigned)changedProperties;
- (unsigned)publicStatus;
- (void)clearAlertedStatus;
@end

@implementation EKResourceChange

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_6 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_6, &__block_literal_global_78);
  }
  v2 = (void *)knownRelationshipSingleValueKeys_keys_6;

  return v2;
}

void __52__EKResourceChange_knownRelationshipSingleValueKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57240];
  v3[0] = *MEMORY[0x1E4F57238];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F57288];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)knownRelationshipSingleValueKeys_keys_6;
  knownRelationshipSingleValueKeys_keys_6 = v1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_8 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_8, &__block_literal_global_4_3);
  }
  v2 = (void *)knownRelationshipWeakKeys_keys_8;

  return v2;
}

void __45__EKResourceChange_knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57288];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipWeakKeys_keys_8;
  knownRelationshipWeakKeys_keys_8 = v0;
}

- (NSString)changedByDisplayName
{
  v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57258]];
  if (!v3)
  {
    v4 = [(EKResourceChange *)self changedByFirstName];
    v5 = [(EKResourceChange *)self changedByLastName];
    v3 = DisplayNameStringForIdentityWithProperties();
  }

  return (NSString *)v3;
}

- (NSURL)changedByAddress
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57250]];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)changedByFirstName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57260]];
}

- (NSString)changedByLastName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57268]];
}

- (id)emailAddress
{
  v2 = [(EKResourceChange *)self changedByAddress];
  v3 = objc_msgSend(v2, "cal_emailAddressString");

  return v3;
}

- (id)phoneNumber
{
  v2 = [(EKResourceChange *)self changedByAddress];
  v3 = objc_msgSend(v2, "cal_phoneNumberString");

  return v3;
}

- (EKCalendar)calendar
{
  return (EKCalendar *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57238]];
}

- (EKCalendarItem)calendarItem
{
  return (EKCalendarItem *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57240]];
}

- (id)notification
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57288]];
}

- (unsigned)changeType
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57248]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (NSDate)timestamp
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57298]];
}

- (unsigned)changedProperties
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57270]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (BOOL)_propertyWithFlagDidChange:(unsigned int)a3
{
  return ([(EKResourceChange *)self changedProperties] & a3) != 0;
}

- (BOOL)dateChanged
{
  return [(EKResourceChange *)self _propertyWithFlagDidChange:1];
}

- (BOOL)timeChanged
{
  return [(EKResourceChange *)self _propertyWithFlagDidChange:2];
}

- (BOOL)titleChanged
{
  return [(EKResourceChange *)self _propertyWithFlagDidChange:4];
}

- (BOOL)locationChanged
{
  return [(EKResourceChange *)self _propertyWithFlagDidChange:8];
}

- (NSNumber)createCount
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57278]];
}

- (NSNumber)updateCount
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572A0]];
}

- (NSNumber)deleteCount
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57278]];
}

- (NSString)deletedTitle
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57280]];
}

- (BOOL)alerted
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57230]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unsigned)publicStatus
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57290]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)clearAlertedStatus
{
  id v2 = [(EKObject *)self persistentObject];
  [v2 unloadPropertyForKey:*MEMORY[0x1E4F57230]];
}

+ (id)calendarItemPropertyName
{
  return (id)*MEMORY[0x1E4F57240];
}

@end