@interface EKParticipant
+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7;
+ (BOOL)doesParticipantURLString:(id)a3 email:(id)a4 andPhoneNumber:(id)a5 matchParticipantURLString:(id)a6 email:(id)a7 andPhoneNumber:(id)a8;
+ (BOOL)needsResponseForParticipantStatus:(int64_t)a3;
+ (EKParticipant)participantWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6;
+ (EKParticipant)participantWithName:(id)a3 url:(id)a4;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)specialComparisonBlocks;
- (ABRecordRef)ABRecordWithAddressBook:(ABAddressBookRef)addressBook;
- (BOOL)isCurrentUser;
- (BOOL)isCurrentUserForScheduling;
- (BOOL)isCurrentUserForSharing;
- (BOOL)isEqualToParticipant:(id)a3;
- (BOOL)isLocationRoom;
- (BOOL)needsResponse;
- (BOOL)scheduleForceSend;
- (EKCalendarItem)owner;
- (EKParticipant)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6;
- (EKParticipantRole)participantRole;
- (EKParticipantStatus)participantStatus;
- (EKParticipantType)participantType;
- (NSDate)commentLastModifiedDate;
- (NSPredicate)contactPredicate;
- (NSString)UUID;
- (NSString)comment;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)inviterNameString;
- (NSString)lastName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)URL;
- (id)URLString;
- (id)displayNameRaw;
- (id)displayString;
- (id)existingContact;
- (id)generateSemanticIdentifier;
- (id)nameComponents;
- (id)nameUsingAddressAsBackup;
- (id)newContact;
- (int)scheduleStatus;
- (void)setComment:(id)a3;
- (void)setDisplayNameRaw:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setInviterNameString:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setScheduleForceSend:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setURLString:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKParticipant

- (NSString)name
{
  v3 = [(EKParticipant *)self displayNameRaw];
  if (!v3)
  {
    v4 = [(EKParticipant *)self firstName];
    v5 = [(EKParticipant *)self lastName];
    v3 = DisplayNameStringForIdentityWithProperties();
  }

  return (NSString *)v3;
}

- (id)displayNameRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57198]];
}

- (NSString)inviterNameString
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571B0]];
}

- (NSString)phoneNumber
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571C0]];
}

- (NSString)lastName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571B8]];
}

- (NSString)firstName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571A8]];
}

- (NSString)emailAddress
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571A0]];
}

- (NSString)comment
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57188]];
}

- (NSURL)URL
{
  v3 = [(EKParticipant *)self URLString];
  if (!v3
    || ([MEMORY[0x1E4F1CB10] URLWithString:v3],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [(EKParticipant *)self emailAddress];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F1CB10];
      v7 = [(EKParticipant *)self emailAddress];
      uint64_t v8 = [v7 stringAddingMailto];
    }
    else
    {
      v9 = [(EKParticipant *)self phoneNumber];

      if (!v9)
      {
LABEL_8:
        v4 = [MEMORY[0x1E4F1CB10] URLForNoMail];
        goto LABEL_9;
      }
      v6 = (void *)MEMORY[0x1E4F1CB10];
      v7 = [(EKParticipant *)self phoneNumber];
      uint64_t v8 = [v7 stringAddingTel];
    }
    v10 = (void *)v8;
    v4 = [v6 URLWithString:v8];

    if (v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:

  return (NSURL *)v4;
}

- (id)URLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57180]];
}

+ (EKParticipant)participantWithName:(id)a3 url:(id)a4
{
  return (EKParticipant *)[a1 participantWithName:a3 emailAddress:0 phoneNumber:0 url:a4];
}

+ (EKParticipant)participantWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithName:v13 emailAddress:v12 phoneNumber:v11 url:v10];

  return (EKParticipant *)v14;
}

- (EKParticipant)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(EKObject *)self init];
  if (!v14) {
    goto LABEL_19;
  }
  v15 = EKUUIDString();
  [(EKParticipant *)v14 setUUID:v15];

  v16 = (void *)[v10 copy];
  [(EKParticipant *)v14 setDisplayNameRaw:v16];

  if (v13)
  {
    v17 = (void *)[v13 copy];
    [(EKParticipant *)v14 setURL:v17];
LABEL_9:

    goto LABEL_10;
  }
  if ([v11 length])
  {
    v18 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v19 = [v11 stringAddingMailto];
LABEL_8:
    v17 = (void *)v19;
    v20 = [v18 URLWithString:v19];
    [(EKParticipant *)v14 setURL:v20];

    goto LABEL_9;
  }
  if ([v12 length])
  {
    v18 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v19 = [v12 stringAddingTel];
    goto LABEL_8;
  }
LABEL_10:
  if (v11)
  {
    [(EKParticipant *)v14 setEmailAddress:v11];
  }
  else if (objc_msgSend(v13, "cal_hasSchemeMailto"))
  {
    v21 = objc_msgSend(v13, "cal_resourceSpecifierNoLeadingSlashes");
    [(EKParticipant *)v14 setEmailAddress:v21];
  }
  if (v12)
  {
    [(EKParticipant *)v14 setPhoneNumber:v12];
  }
  else if (objc_msgSend(v13, "cal_hasSchemeTel"))
  {
    v22 = objc_msgSend(v13, "cal_resourceSpecifierNoLeadingSlashes");
    [(EKParticipant *)v14 setPhoneNumber:v22];
  }
  [(EKObject *)v14 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
LABEL_19:

  return v14;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_4 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_4, &__block_literal_global_30);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_4;

  return v2;
}

void __47__EKParticipant_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_4;
  knownIdentityKeysForComparison_keys_4 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_2 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_2, &__block_literal_global_10_0);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_2;

  return v2;
}

void __50__EKParticipant_knownSingleValueKeysForComparison__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57188];
  v6[0] = *MEMORY[0x1E4F57180];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57198];
  v6[2] = *MEMORY[0x1E4F57190];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F571A8];
  v6[4] = *MEMORY[0x1E4F571A0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F571C0];
  v6[6] = *MEMORY[0x1E4F571B8];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v5 = (void *)knownSingleValueKeysForComparison_keys_2;
  knownSingleValueKeysForComparison_keys_2 = v4;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_1 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_1, &__block_literal_global_12);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_1;

  return v2;
}

void __42__EKParticipant_knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57160];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipWeakKeys_keys_1;
  knownRelationshipWeakKeys_keys_1 = v0;
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)nameUsingAddressAsBackup
{
  uint64_t v3 = [(EKParticipant *)self name];
  if (![v3 length])
  {
    uint64_t v4 = [(EKParticipant *)self emailAddress];

    uint64_t v3 = (void *)v4;
  }
  if (![v3 length])
  {
    uint64_t v5 = [(EKParticipant *)self phoneNumber];

    uint64_t v3 = (void *)v5;
  }
  if (![v3 length])
  {
    v6 = [(EKParticipant *)self URL];
    uint64_t v7 = [v6 absoluteString];

    uint64_t v3 = (void *)v7;
  }

  return v3;
}

- (void)setDisplayNameRaw:(id)a3
{
}

- (void)setEmailAddress:(id)a3
{
}

- (void)setPhoneNumber:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (EKParticipantType)participantType
{
  return 0;
}

- (EKParticipantStatus)participantStatus
{
  return 0;
}

- (BOOL)needsResponse
{
  uint64_t v3 = objc_opt_class();
  EKParticipantStatus v4 = [(EKParticipant *)self participantStatus];

  return [v3 needsResponseForParticipantStatus:v4];
}

+ (BOOL)needsResponseForParticipantStatus:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (EKParticipantRole)participantRole
{
  return 0;
}

- (void)setComment:(id)a3
{
}

- (NSDate)commentLastModifiedDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57190]];
}

- (BOOL)isCurrentUser
{
  return 0;
}

- (void)setURLString:(id)a3
{
}

- (void)setURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKParticipant *)self setURLString:v4];
}

- (BOOL)scheduleForceSend
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571D8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setScheduleForceSend:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F571D8]];
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(EKParticipant *)self URLString];
  uint64_t v7 = [(EKParticipant *)self emailAddress];
  uint64_t v8 = [(EKParticipant *)self phoneNumber];
  v9 = [v4 URLString];
  id v10 = [v4 emailAddress];
  id v11 = [v4 phoneNumber];

  LOBYTE(v4) = [v5 doesParticipantURLString:v6 email:v7 andPhoneNumber:v8 matchParticipantURLString:v9 email:v10 andPhoneNumber:v11];
  return (char)v4;
}

+ (BOOL)doesParticipantURLString:(id)a3 email:(id)a4 andPhoneNumber:(id)a5 matchParticipantURLString:(id)a6 email:(id)a7 andPhoneNumber:(id)a8
{
  return doURLsEmailsPhoneNumbersMatch();
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 isEqualToString:*MEMORY[0x1E4F57180]])
  {
    if (v12 | v13 && ([(id)v12 isEqual:v13] & 1) == 0)
    {
      if ((v12 == 0) != (v13 == 0))
      {
        unsigned __int8 v17 = 0;
      }
      else
      {
        id v19 = v16;
        id v20 = v15;
        v26 = objc_opt_class();
        uint64_t v21 = [v20 emailAddress];
        v22 = [v20 phoneNumber];

        v23 = [v19 emailAddress];
        v24 = [v19 phoneNumber];

        v25 = (void *)v21;
        unsigned __int8 v17 = [v26 doesParticipantURLString:v12 email:v21 andPhoneNumber:v22 matchParticipantURLString:v13 email:v23 andPhoneNumber:v24];
      }
    }
    else
    {
      unsigned __int8 v17 = 1;
    }
  }
  else
  {
    v27.receiver = a1;
    v27.super_class = (Class)&OBJC_METACLASS___EKParticipant;
    unsigned __int8 v17 = objc_msgSendSuper2(&v27, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
  }

  return v17;
}

- (id)nameComponents
{
  uint64_t v2 = (void *)MEMORY[0x1E4F57778];
  char v3 = [(EKParticipant *)self name];
  id v4 = [v2 personNameComponentsFromString:v3];

  return v4;
}

- (id)displayString
{
  char v3 = [(EKParticipant *)self emailAddress];
  if (([v3 resemblesEmailAddress] & 1) == 0)
  {

    char v3 = 0;
  }
  id v4 = [(EKParticipant *)self name];
  uint64_t v5 = [(EKParticipant *)self URL];
  if ([v4 length])
  {
    v6 = [MEMORY[0x1E4F28E78] stringWithString:v4];
    if (![v3 length]) {
      goto LABEL_9;
    }
    uint64_t v7 = [NSString stringWithFormat:@" <%@>", v3];
    [v6 appendString:v7];
    goto LABEL_6;
  }
  if ([v3 length])
  {
    v6 = [MEMORY[0x1E4F28E78] stringWithString:v3];
  }
  else
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v7 = [v5 absoluteString];
      v6 = [v9 stringWithString:v7];
LABEL_6:

      goto LABEL_9;
    }
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (ABRecordRef)ABRecordWithAddressBook:(ABAddressBookRef)addressBook
{
  if (!addressBook) {
    return 0;
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  CalendarFoundationPerformBlockOnSharedContactStore();
  char v3 = (const void *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __41__EKParticipant_ABRecordWithAddressBook___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v5 = [*(id *)(a1 + 32) name];
  v6 = [*(id *)(a1 + 32) emailAddress];
  uint64_t v7 = [*(id *)(a1 + 32) URL];
  uint64_t v8 = [NSString stringWithFormat:@"-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"];
  v9 = [v4 predicateForContactMatchingEKParticipantWithName:v5 emailAddress:v6 URL:v7 predicateDescription:v8];

  id v10 = [v3 unifiedContactsMatchingPredicate:v9 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];
  if ([v10 count])
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v11 = [v10 objectAtIndexedSubscript:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 publicABPersonFromContact:v11 publicAddressBook:&v12];
  }
}

- (BOOL)isLocationRoom
{
  if ([(EKParticipant *)self participantRole] == EKParticipantRoleChair
    || [(EKParticipant *)self participantType] != EKParticipantTypeRoom)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setInviterNameString:(id)a3
{
}

- (id)newContact
{
  id v3 = (void *)MEMORY[0x1E4F1B8F8];
  id v4 = [(EKParticipant *)self name];
  uint64_t v5 = [(EKParticipant *)self emailAddress];
  v6 = [v3 contactWithDisplayName:v4 emailOrPhoneNumber:v5];

  return v6;
}

- (id)existingContact
{
  id v3 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v4 = [(EKParticipant *)self contactPredicate];
  uint64_t v5 = [MEMORY[0x1E4F1B8F8] CalKeys];
  v6 = [v3 unifiedContactsMatchingPredicate:v4 keysToFetch:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (int)scheduleStatus
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571E0]];
  int v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isCurrentUserForSharing
{
  return 0;
}

- (BOOL)isCurrentUserForScheduling
{
  int v3 = [(EKParticipant *)self owner];
  id v4 = [v3 selfAttendee];
  uint64_t v5 = [v4 URL];
  v6 = [v5 absoluteString];
  uint64_t v7 = [(EKParticipant *)self URL];
  uint64_t v8 = [v7 absoluteString];
  char v9 = [v6 isEqualToString:v8];

  return v9;
}

- (id)generateSemanticIdentifier
{
  int v3 = [(EKParticipant *)self emailAddress];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(EKParticipant *)self phoneNumber];
    uint64_t v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      uint64_t v8 = [(EKParticipant *)self URL];
      char v9 = v8;
      if (v8)
      {
        id v5 = [v8 absoluteString];
      }
      else
      {
        id v10 = [(EKParticipant *)self name];
        id v11 = v10;
        if (v10)
        {
          id v5 = v10;
        }
        else
        {
          uint64_t v12 = [(EKParticipant *)self firstName];
          uint64_t v13 = [(EKParticipant *)self lastName];
          if (v12 | v13)
          {
            id v14 = [MEMORY[0x1E4F28E78] string];
            id v15 = v14;
            if (v12) {
              [v14 appendFormat:@"FIRST=%@;", v12];
            }
            if (v13) {
              [v15 appendFormat:@"LAST=%@;", v13];
            }
            id v5 = (id)[v15 copy];
          }
          else
          {
            id v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKParticipant *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p>(name = %@)", v4, self, v5];

  return (NSString *)v6;
}

+ (id)specialComparisonBlocks
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:&__block_literal_global_38 forKey:*MEMORY[0x1E4F56B78]];
}

uint64_t __40__EKParticipant_specialComparisonBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 participantStatus];
  if (v6 == [v5 participantStatus])
  {
    uint64_t v7 = 1;
  }
  else if ([v4 needsResponse])
  {
    uint64_t v7 = [v5 needsResponse];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (EKCalendarItem)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
}

- (NSPredicate)contactPredicate
{
  int v3 = [(EKParticipant *)self emailAddress];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1B8F8];
    id v5 = [(EKParticipant *)self emailAddress];
    uint64_t v6 = [NSString stringWithFormat:@"-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"];
    uint64_t v7 = [v4 predicateForContactMatchingEKParticipantWithName:0 emailAddress:v5 URL:0 predicateDescription:v6];
LABEL_5:
    id v11 = (void *)v7;
    goto LABEL_6;
  }
  uint64_t v8 = [(EKParticipant *)self phoneNumber];

  char v9 = (void *)MEMORY[0x1E4F1B8F8];
  if (v8)
  {
    id v10 = (void *)MEMORY[0x1E4F1BA70];
    id v5 = [(EKParticipant *)self phoneNumber];
    uint64_t v6 = [v10 phoneNumberWithStringValue:v5];
    uint64_t v7 = [v9 predicateForContactsMatchingPhoneNumber:v6];
    goto LABEL_5;
  }
  id v5 = [(EKParticipant *)self name];
  uint64_t v6 = [(EKParticipant *)self emailAddress];
  uint64_t v13 = [NSString stringWithFormat:@"-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"];
  id v11 = [v9 predicateForContactMatchingEKParticipantWithName:v5 emailAddress:v6 URL:0 predicateDescription:v13];

LABEL_6:

  return (NSPredicate *)v11;
}

@end