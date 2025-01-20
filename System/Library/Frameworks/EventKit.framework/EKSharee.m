@interface EKSharee
+ (Class)frozenClass;
+ (id)_urlForEmailAddress:(id)a3 andPhoneNumber:(id)a4;
+ (id)knownIdentityKeysForComparison;
+ (id)knownSingleValueKeysForComparison;
+ (id)shareeWithName:(id)a3 emailAddress:(id)a4;
+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5;
+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 externalID:(id)a6;
+ (id)shareeWithName:(id)a3 phoneNumber:(id)a4;
+ (id)shareeWithName:(id)a3 url:(id)a4;
+ (id)shareeWithUUID:(id)a3 name:(id)a4 emailAddress:(id)a5 phoneNumber:(id)a6;
+ (id)statusStringFromEnum:(unint64_t)a3;
+ (int)_calShareeAccessLevelFromEKShareeAccessLevel:(unint64_t)a3;
+ (int)_calShareeStatusFromEKShareeStatus:(unint64_t)a3;
+ (unint64_t)_ekShareeAccessLevelFromCalShareeAccessLevel:(int)a3;
+ (unint64_t)_ekShareeStatusFromCalShareeStatus:(int)a3;
+ (unint64_t)statusEnumFromString:(id)a3;
- (BOOL)isCurrentUserForScheduling;
- (BOOL)isCurrentUserForSharing;
- (BOOL)isEqualToSharee:(id)a3;
- (BOOL)shareeMuteRemoval;
- (EKCalendar)owner;
- (EKSharee)init;
- (EKSharee)initWithName:(id)a3 url:(id)a4;
- (EKSharee)initWithName:(id)a3 url:(id)a4 externalID:(id)a5;
- (NSArray)familyEmailAddressAliases;
- (NSPredicate)contactPredicate;
- (NSString)UUID;
- (NSString)address;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)externalID;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)phoneNumber;
- (id)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayName;
- (id)existingContact;
- (int)shareeAccessLevelRaw;
- (int)shareeStatusRaw;
- (unint64_t)shareeAccessLevel;
- (unint64_t)shareeStatus;
- (void)setAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setFamilyEmailAddressAliases:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setShareeAccessLevel:(unint64_t)a3;
- (void)setShareeAccessLevelRaw:(int)a3;
- (void)setShareeMuteRemoval:(BOOL)a3;
- (void)setShareeStatus:(unint64_t)a3;
- (void)setShareeStatusRaw:(int)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKSharee

- (NSPredicate)contactPredicate
{
  v3 = [(EKSharee *)self owner];
  v4 = [v3 source];
  int v5 = [v4 isFacebookSource];

  if (v5)
  {
    v6 = [(EKSharee *)self address];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = [NSString stringWithFormat:@"-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"];
  v9 = (void *)MEMORY[0x1E4F1B8F8];
  v10 = [(EKSharee *)self name];
  v11 = [(EKSharee *)self emailAddress];
  v12 = [v9 predicateForContactMatchingEKParticipantWithName:v10 emailAddress:v11 URL:v7 predicateDescription:v8];

  return (NSPredicate *)v12;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_9 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_9, &__block_literal_global_67);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_9;

  return v2;
}

void __42__EKSharee_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_9;
  knownIdentityKeysForComparison_keys_9 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_8 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_8, &__block_literal_global_10_3);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_8;

  return v2;
}

void __45__EKSharee_knownSingleValueKeysForComparison__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F572B8];
  v5[0] = *MEMORY[0x1E4F572B0];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F572C8];
  v5[2] = *MEMORY[0x1E4F572C0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F572D8];
  v5[4] = *MEMORY[0x1E4F572A8];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v4 = (void *)knownSingleValueKeysForComparison_keys_8;
  knownSingleValueKeysForComparison_keys_8 = v3;
}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  v8 = [a4 stringAddingMailto];
  v9 = [v6 URLWithString:v8];

  v10 = [a1 shareeWithName:v7 url:v9];

  return v10;
}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5
{
  id v8 = a3;
  v9 = [a1 _urlForEmailAddress:a4 andPhoneNumber:a5];
  v10 = (void *)[objc_alloc((Class)a1) initWithName:v8 url:v9];

  return v10;
}

+ (id)shareeWithName:(id)a3 phoneNumber:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  id v8 = [a4 stringAddingTel];
  v9 = [v6 URLWithString:v8];

  v10 = [a1 shareeWithName:v7 url:v9];

  return v10;
}

+ (id)shareeWithName:(id)a3 url:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 url:v6];

  return v8;
}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 externalID:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [a1 _urlForEmailAddress:a4 andPhoneNumber:a5];
  v13 = (void *)[objc_alloc((Class)a1) initWithName:v11 url:v12 externalID:v10];

  return v13;
}

+ (id)_urlForEmailAddress:(id)a3 andPhoneNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v5 stringAddingMailto];
LABEL_5:
    id v10 = (void *)v9;
    id v11 = [v8 URLWithString:v9];

    goto LABEL_6;
  }
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v6 stringAddingTel];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

+ (id)shareeWithUUID:(id)a3 name:(id)a4 emailAddress:(id)a5 phoneNumber:(id)a6
{
  id v10 = a3;
  id v11 = [a1 shareeWithName:a4 emailAddress:a5 phoneNumber:a6];
  [v11 setUUID:v10];

  return v11;
}

- (EKSharee)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKSharee;
  uint64_t v2 = [(EKObject *)&v5 init];
  if (v2)
  {
    uint64_t v3 = EKUUIDString();
    [(EKSharee *)v2 setUUID:v3];
  }
  return v2;
}

- (EKSharee)initWithName:(id)a3 url:(id)a4
{
  return [(EKSharee *)self initWithName:a3 url:a4 externalID:0];
}

- (EKSharee)initWithName:(id)a3 url:(id)a4 externalID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EKSharee *)self init];
  v12 = v11;
  if (v11)
  {
    [(EKSharee *)v11 setName:v8];
    v13 = [v9 absoluteString];
    [(EKSharee *)v12 setAddress:v13];

    [(EKSharee *)v12 setExternalID:v10];
    [(EKSharee *)v12 setShareeStatus:5];
    [(EKSharee *)v12 setShareeAccessLevel:2];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v10.receiver = self;
    v10.super_class = (Class)EKSharee;
    return [(EKObject *)&v10 copyWithZone:a3];
  }
  else
  {
    objc_super v5 = objc_alloc_init(EKSharee);
    if (v5)
    {
      id v6 = [(EKSharee *)self name];
      [(EKSharee *)v5 setName:v6];

      id v7 = [(EKSharee *)self address];
      [(EKSharee *)v5 setAddress:v7];

      id v8 = [(EKSharee *)self externalID];
      [(EKSharee *)v5 setExternalID:v8];

      [(EKSharee *)v5 setShareeStatusRaw:[(EKSharee *)self shareeStatusRaw]];
      [(EKSharee *)v5 setShareeAccessLevelRaw:[(EKSharee *)self shareeAccessLevelRaw]];
    }
  }
  return v5;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(EKSharee *)self UUID];
  id v6 = [(EKSharee *)self name];
  id v7 = [(EKSharee *)self emailAddress];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; name = %@; email = %@; status = %lu; accessLevel = %lu;}",
    v4,
    self,
    v5,
    v6,
    v7,
    [(EKSharee *)self shareeStatus],
  id v8 = [(EKSharee *)self shareeAccessLevel]);

  return (NSString *)v8;
}

- (EKCalendar)owner
{
  return (EKCalendar *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:@"owner"];
}

+ (unint64_t)_ekShareeStatusFromCalShareeStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 6) {
    return a3;
  }
  objc_super v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKSharee _ekShareeStatusFromCalShareeStatus:](v3, v5, v6, v7, v8, v9, v10, v11);
  }
  return 0;
}

+ (int)_calShareeStatusFromEKShareeStatus:(unint64_t)a3
{
  if (a3 < 7) {
    return dword_1A4F900C0[a3];
  }
  objc_super v5 = EKLogHandle;
  int result = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    +[EKSharee _calShareeStatusFromEKShareeStatus:](a3, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  return result;
}

+ (unint64_t)_ekShareeAccessLevelFromCalShareeAccessLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 4) {
    return a3;
  }
  objc_super v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKSharee _ekShareeAccessLevelFromCalShareeAccessLevel:](v3, v5, v6, v7, v8, v9, v10, v11);
  }
  return 0;
}

+ (int)_calShareeAccessLevelFromEKShareeAccessLevel:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 4)
  {
    uint64_t v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKSharee _calShareeAccessLevelFromEKShareeAccessLevel:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
    LODWORD(v3) = 0;
  }
  return v3;
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)displayName
{
  unint64_t v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572B8]];
  if (!v3)
  {
    uint64_t v4 = [(EKSharee *)self firstName];
    uint64_t v5 = [(EKSharee *)self lastName];
    unint64_t v3 = DisplayNameStringForIdentityWithProperties();
  }

  return v3;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)address
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572B0]];
}

- (void)setAddress:(id)a3
{
}

- (id)URL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  unint64_t v3 = [(EKSharee *)self address];
  uint64_t v4 = [v2 URLWithString:v3];

  return v4;
}

- (NSString)emailAddress
{
  unint64_t v3 = [(EKSharee *)self address];
  int v4 = [v3 hasMailto];

  if (v4)
  {
    uint64_t v5 = [(EKSharee *)self address];
    uint64_t v6 = [v5 stringRemovingMailto];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setEmailAddress:(id)a3
{
  id v4 = [a3 stringAddingMailto];
  [(EKSharee *)self setAddress:v4];
}

- (NSString)phoneNumber
{
  unint64_t v3 = [(EKSharee *)self address];
  int v4 = [v3 hasTel];

  if (v4)
  {
    uint64_t v5 = [(EKSharee *)self address];
    uint64_t v6 = [v5 stringRemovingTel];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setPhoneNumber:(id)a3
{
  id v4 = [a3 stringAddingTel];
  [(EKSharee *)self setAddress:v4];
}

- (NSString)firstName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572C0]];
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572C8]];
}

- (void)setLastName:(id)a3
{
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (int)shareeStatusRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572D8]];
  int v3 = [v2 integerValue];

  return v3;
}

- (void)setShareeStatusRaw:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F572D8]];
}

- (unint64_t)shareeStatus
{
  uint64_t v2 = [(EKSharee *)self shareeStatusRaw];
  int v3 = objc_opt_class();

  return [v3 _ekShareeStatusFromCalShareeStatus:v2];
}

- (void)setShareeStatus:(unint64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _calShareeStatusFromEKShareeStatus:a3];

  [(EKSharee *)self setShareeStatusRaw:v4];
}

- (int)shareeAccessLevelRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572A8]];
  int v3 = [v2 integerValue];

  return v3;
}

- (void)setShareeAccessLevelRaw:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F572A8]];
}

- (unint64_t)shareeAccessLevel
{
  uint64_t v2 = [(EKSharee *)self shareeAccessLevelRaw];
  int v3 = objc_opt_class();

  return [v3 _ekShareeAccessLevelFromCalShareeAccessLevel:v2];
}

- (void)setShareeAccessLevel:(unint64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _calShareeAccessLevelFromEKShareeAccessLevel:a3];

  [(EKSharee *)self setShareeAccessLevelRaw:v4];
}

- (BOOL)shareeMuteRemoval
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F572D0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShareeMuteRemoval:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F572D0]];
}

- (id)existingContact
{
  char v3 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v4 = [(EKSharee *)self contactPredicate];
  uint64_t v5 = [MEMORY[0x1E4F1B8F8] CalKeys];
  uint64_t v6 = [v3 unifiedContactsMatchingPredicate:v4 keysToFetch:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (BOOL)isCurrentUserForSharing
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v3 = [(EKSharee *)self owner];
  id v4 = [v3 sharedOwnerAddresses];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(EKSharee *)self address];
        LOBYTE(v9) = [v9 isEqualToString:v10];

        if (v9)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isCurrentUserForScheduling
{
  return 0;
}

- (BOOL)isEqualToSharee:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKSharee *)self emailAddress];
  uint64_t v6 = [v4 emailAddress];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = [(EKSharee *)self familyEmailAddressAliases];

    if (v10)
    {
      BOOL v11 = [(EKSharee *)self familyEmailAddressAliases];
      [v9 addObjectsFromArray:v11];
    }
    v12 = [(EKSharee *)self emailAddress];

    if (v12)
    {
      long long v13 = [(EKSharee *)self emailAddress];
      [v9 addObject:v13];
    }
    long long v14 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = [v4 familyEmailAddressAliases];

    if (v15)
    {
      long long v16 = [v4 familyEmailAddressAliases];
      [v9 addObjectsFromArray:v16];
    }
    v17 = [v4 emailAddress];

    if (v17)
    {
      uint64_t v18 = [v4 emailAddress];
      [v9 addObject:v18];
    }
    char v8 = [v9 intersectsSet:v14];
  }
  return v8;
}

+ (unint64_t)statusEnumFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"invite-accepted"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"invite-declined"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"invite-deleted"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"invite-invalid"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"invite-noresponse"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)statusStringFromEnum:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return off_1E5B99480[a3 - 1];
  }
}

- (NSArray)familyEmailAddressAliases
{
  return self->_familyEmailAddressAliases;
}

- (void)setFamilyEmailAddressAliases:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)_ekShareeStatusFromCalShareeStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_calShareeStatusFromEKShareeStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_ekShareeAccessLevelFromCalShareeAccessLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_calShareeAccessLevelFromEKShareeAccessLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end