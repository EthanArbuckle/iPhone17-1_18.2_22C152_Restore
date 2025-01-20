@interface FAFamilyMember
+ (BOOL)supportsSecureCoding;
+ (id)defaultInvitationDelay;
- (BOOL)_nilEqualProperty:(id)a3 with:(id)a4;
- (BOOL)canRemoveSelf;
- (BOOL)hasAskToBuyEnabled;
- (BOOL)hasHSA2;
- (BOOL)hasLinkediTunesAccount;
- (BOOL)hasParentalControlsEnabled;
- (BOOL)hasSiwaEnabled;
- (BOOL)isChildAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFamilyMember:(id)a3;
- (BOOL)isGuardian;
- (BOOL)isMe;
- (BOOL)isOrganizer;
- (BOOL)isParent;
- (BOOL)memberIsPending;
- (BOOL)purchaseSharingEnabled;
- (CNContact)contact;
- (FAFamilyMember)initWithCoder:(id)a3;
- (FAFamilyMember)initWithDictionaryRepresentation:(id)a3;
- (NSArray)appleIDAliases;
- (NSArray)remoteChildren;
- (NSArray)remoteGuardians;
- (NSDate)birthDate;
- (NSDate)invitationDate;
- (NSDate)joinedDate;
- (NSDictionary)dictionary;
- (NSDictionary)idsCache;
- (NSNumber)badgeAfter;
- (NSNumber)dsid;
- (NSNumber)iTunesAccountDSID;
- (NSNumber)memberSortOrder;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)hashedDSID;
- (NSString)iTunesAccountUsername;
- (NSString)iTunesNotLinkedMessage;
- (NSString)inviteEmail;
- (NSString)inviteType;
- (NSString)lastName;
- (NSString)memberPhoneNumbers;
- (NSString)memberTypeDisplayString;
- (NSString)memberTypeString;
- (NSString)shortName;
- (NSString)statusString;
- (id)_dateWithEpochString:(id)a3;
- (id)contactIncludingImage:(BOOL)a3;
- (id)contactWithKeys:(id)a3 contactStore:(id)a4;
- (id)contactsIncludingImage:(BOOL)a3;
- (id)contactsWithKeys:(id)a3 contactStore:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)memberType;
- (unint64_t)age;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)fetchFamilyPhotoWithRequestedSize:(unint64_t)a3 fallbackToLocalAddressBook:(BOOL)a4 completionHandler:(id)a5;
- (void)finishWith:(id)a3;
- (void)setIdsCache:(id)a3;
@end

@implementation FAFamilyMember

- (FAFamilyMember)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyMember;
  v5 = [(FAFamilyMember *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (id)description
{
  v15 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v14 = objc_opt_class();
  v16 = [(FAFamilyMember *)self appleID];
  v3 = [(FAFamilyMember *)self dsid];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [(FAFamilyMember *)self hashedDSID];
  }
  v5 = [(FAFamilyMember *)self altDSID];
  uint64_t v6 = [(FAFamilyMember *)self firstName];
  v7 = [(FAFamilyMember *)self lastName];
  v8 = [(FAFamilyMember *)self memberTypeString];
  objc_super v9 = [(FAFamilyMember *)self remoteChildren];
  v10 = [(FAFamilyMember *)self remoteGuardians];
  v11 = [(FAFamilyMember *)self inviteEmail];
  v12 = [v15 stringWithFormat:@"<%@: %p - appleID=%@ dsid=%@ altDSID=%@ firstName=%@ lastName=%@ type=%@ remote guardians %@ remote children %@ inviteEmail=%@ purchaseSharingEnabled=%d>", v14, self, v16, v4, v5, v6, v7, v8, v9, v10, v11, -[FAFamilyMember purchaseSharingEnabled](self, "purchaseSharingEnabled")];

  if (!v3) {
  return v12;
  }
}

- (BOOL)isMe
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"is-me"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)appleID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-apple-id"];
}

- (NSNumber)dsid
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-dsid"];
}

- (NSString)hashedDSID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-dsid-hash"];
}

- (NSString)altDSID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-altDSID"];
}

- (NSString)firstName
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-first-name"];
}

- (BOOL)canRemoveSelf
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"can-remove-self"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSArray)appleIDAliases
{
  return (NSArray *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-appleID-aliases"];
}

- (NSString)shortName
{
  char v3 = [(FAFamilyMember *)self contact];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  if (v3)
  {
    v5 = [v3 givenName];
    [v4 setGivenName:v5];

    uint64_t v6 = [v3 familyName];
    [v4 setFamilyName:v6];

    v7 = [MEMORY[0x1E4F28F38] _localizedShortNameForComponents:v4 withStyle:3 options:0];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(FAFamilyMember *)self firstName];
  if ([v8 length])
  {
    objc_super v9 = [(FAFamilyMember *)self lastName];
    if ([v9 length])
    {
      uint64_t v10 = [v7 length];

      if (v10) {
        goto LABEL_10;
      }
      v11 = [(FAFamilyMember *)self firstName];
      [v4 setGivenName:v11];

      v12 = [(FAFamilyMember *)self lastName];
      [v4 setFamilyName:v12];

      [MEMORY[0x1E4F28F38] _localizedShortNameForComponents:v4 withStyle:3 options:0];
      v7 = v8 = v7;
    }
    else
    {
    }
  }

LABEL_10:
  if ([v7 length]) {
    v13 = v7;
  }
  else {
    v13 = 0;
  }
  uint64_t v14 = v13;

  return v14;
}

- (NSString)lastName
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-last-name"];
}

- (NSString)fullName
{
  char v3 = [(FAFamilyMember *)self contact];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
    if ([v4 length]) {
      goto LABEL_10;
    }
  }
  id v5 = [(FAFamilyMember *)self firstName];
  if (![v5 length])
  {
    id v4 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [(FAFamilyMember *)self lastName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    v8 = [(FAFamilyMember *)self firstName];
    [v5 setGivenName:v8];

    objc_super v9 = [(FAFamilyMember *)self lastName];
    [v5 setFamilyName:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v4 = [v10 stringFromPersonNameComponents:v5];

LABEL_8:
    goto LABEL_10;
  }
  id v4 = 0;
LABEL_10:

  return (NSString *)v4;
}

- (unint64_t)age
{
  char v3 = [(FAFamilyMember *)self appleID];
  id v4 = (void *)CFPreferencesCopyAppValue(v3, @"com.apple.familycircle.ages");

  if (v4)
  {
    unint64_t v5 = [v4 integerValue];
  }
  else
  {
    uint64_t v6 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-age"];
    unint64_t v5 = [v6 integerValue];
  }
  return v5;
}

- (NSString)memberTypeDisplayString
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-display-label"];
}

- (NSString)memberTypeString
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-type"];
}

- (NSDate)birthDate
{
  char v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-date-of-birth"];

  if (v3)
  {
    id v4 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-date-of-birth"];
    unint64_t v5 = [(FAFamilyMember *)self _dateWithEpochString:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return (NSDate *)v5;
}

- (BOOL)memberIsPending
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-status"];
  char v3 = [v2 isEqualToString:@"Pending"];

  return v3;
}

- (int64_t)memberType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = [(FAFamilyMember *)self memberTypeString];
  if ([v3 isEqualToString:@"ADULT"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"TEEN"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHILD"])
  {
    int64_t v4 = 2;
  }
  else
  {
    if (![(FAFamilyMember *)self memberIsPending])
    {
      unint64_t v5 = _FALogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-status"];
        int v8 = 138412290;
        objc_super v9 = v6;
        _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "No valid member type present! %@", (uint8_t *)&v8, 0xCu);
      }
    }
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)defaultInvitationDelay
{
  return (id)[NSNumber numberWithInt:604800000];
}

- (NSNumber)memberSortOrder
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-sort-order"];
}

- (NSString)memberPhoneNumbers
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-phone-numbers"];
}

- (NSDate)joinedDate
{
  char v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-join-date-epoch"];
  int64_t v4 = [(FAFamilyMember *)self _dateWithEpochString:v3];

  return (NSDate *)v4;
}

- (NSDate)invitationDate
{
  char v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-invite-date-epoch"];
  int64_t v4 = [(FAFamilyMember *)self _dateWithEpochString:v3];

  return (NSDate *)v4;
}

- (NSNumber)badgeAfter
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"badge-after-invite-delay"];
}

- (id)_dateWithEpochString:(id)a3
{
  [a3 doubleValue];
  if (a3)
  {
    unint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4 * 0.001];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (NSString)statusString
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-status"];
}

- (NSString)inviteEmail
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-invite-email"];
}

- (NSString)inviteType
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"invite-type"];
}

- (BOOL)isChildAccount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-is-child-account"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasParentalControlsEnabled
{
  if (hasParentalControlsEnabled_onceToken != -1) {
    dispatch_once(&hasParentalControlsEnabled_onceToken, &__block_literal_global_4);
  }
  uint64_t v3 = hasParentalControlsEnabled_forceParentalControlsAppleIDs;
  double v4 = [(FAFamilyMember *)self appleID];
  LOBYTE(v3) = [(id)v3 containsObject:v4];

  if (v3) {
    return 1;
  }
  uint64_t v6 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"is-parental-controls-enabled"];
  char v7 = [v6 BOOLValue];

  return v7;
}

void __44__FAFamilyMember_hasParentalControlsEnabled__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ParentalControlsAppleIDs", @"com.apple.familycircle");
  v1 = (void *)hasParentalControlsEnabled_forceParentalControlsAppleIDs;
  hasParentalControlsEnabled_forceParentalControlsAppleIDs = (uint64_t)v0;

  if (hasParentalControlsEnabled_forceParentalControlsAppleIDs)
  {
    v2 = _FALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = hasParentalControlsEnabled_forceParentalControlsAppleIDs;
      _os_log_impl(&dword_1D252C000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: Parent controls is being forced for these Apple Accounts by preference: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (BOOL)isParent
{
  if (isParent_onceToken != -1) {
    dispatch_once(&isParent_onceToken, &__block_literal_global_116);
  }
  uint64_t v3 = isParent_forceParentAppleIDs;
  uint64_t v4 = [(FAFamilyMember *)self appleID];
  LOBYTE(v3) = [(id)v3 containsObject:v4];

  if (v3) {
    return 1;
  }
  uint64_t v6 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-is-parent-account"];
  char v7 = [v6 BOOLValue];

  return v7;
}

void __26__FAFamilyMember_isParent__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ParentAppleIDs", @"com.apple.familycircle");
  v1 = (void *)isParent_forceParentAppleIDs;
  isParent_forceParentAppleIDs = (uint64_t)v0;

  if (isParent_forceParentAppleIDs)
  {
    v2 = _FALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = isParent_forceParentAppleIDs;
      _os_log_impl(&dword_1D252C000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: These Apple Accounts are forced to be parent accounts by preference: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (BOOL)isGuardian
{
  if ([(FAFamilyMember *)self isParent]) {
    return 1;
  }
  return [(FAFamilyMember *)self isOrganizer];
}

- (BOOL)isOrganizer
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-is-organizer"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasHSA2
{
  char v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v4 = [(FAFamilyMember *)self altDSID];
  uint64_t v5 = [v3 authKitAccountWithAltDSID:v4];

  LOBYTE(v4) = [v3 securityLevelForAccount:v5] == 4;
  return (char)v4;
}

- (BOOL)hasAskToBuyEnabled
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"is-ask-to-buy-enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasSiwaEnabled
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"isSiwaEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)iTunesAccountDSID
{
  return (NSNumber *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"linked-itunes-account-dsid"];
}

- (NSString)iTunesAccountUsername
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"linked-itunes-account-appleid"];
}

- (BOOL)hasLinkediTunesAccount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"is-itunes-linked"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)iTunesNotLinkedMessage
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"itunes-not-linked-message"];
}

- (BOOL)purchaseSharingEnabled
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"family-purchase-sharing-enabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)fetchFamilyPhotoWithRequestedSize:(unint64_t)a3 fallbackToLocalAddressBook:(BOOL)a4 completionHandler:(id)a5
{
  id v5 = a5;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__FAFamilyMember_fetchFamilyPhotoWithRequestedSize_fallbackToLocalAddressBook_completionHandler___block_invoke;
  block[3] = &unk_1E6924E28;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __97__FAFamilyMember_fetchFamilyPhotoWithRequestedSize_fallbackToLocalAddressBook_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FAFamilyMember)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FAFamilyMember *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;

    uint64_t v14 = v5;
  }

  return v5;
}

- (CNContact)contact
{
  return (CNContact *)[(FAFamilyMember *)self contactIncludingImage:1];
}

- (id)contactWithKeys:(id)a3 contactStore:(id)a4
{
  id v4 = [(FAFamilyMember *)self contactsWithKeys:a3 contactStore:a4];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)contactsIncludingImage:(BOOL)a3
{
  BOOL v3 = a3;
  v22[17] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1ADF0];
  v22[0] = *MEMORY[0x1E4F1AEB0];
  v22[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADE0];
  v22[2] = *MEMORY[0x1E4F1AEA0];
  v22[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEB8];
  v22[4] = *MEMORY[0x1E4F1AF30];
  v22[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AED8];
  v22[6] = *MEMORY[0x1E4F1AEC0];
  v22[7] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AE78];
  v22[8] = *MEMORY[0x1E4F1ADB8];
  v22[9] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AF00];
  v22[10] = *MEMORY[0x1E4F1AEF8];
  v22[11] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AF08];
  v22[12] = *MEMORY[0x1E4F1AEF0];
  v22[13] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AEE0];
  v22[14] = *MEMORY[0x1E4F1AFA8];
  v22[15] = v12;
  v22[16] = *MEMORY[0x1E4F1ADC8];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:17];
  uint64_t v14 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v15 = [v13 arrayByAddingObject:v14];

  if (v3)
  {
    uint64_t v21 = *MEMORY[0x1E4F1AF98];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v16];

    v15 = (void *)v17;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v19 = [(FAFamilyMember *)self contactsWithKeys:v15 contactStore:v18];

  return v19;
}

- (id)contactsWithKeys:(id)a3 contactStore:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ([(FAFamilyMember *)self isMe])
  {
    uint64_t v9 = [MEMORY[0x1E4F179C8] defaultStore];
    uint64_t v10 = [(FAFamilyMember *)self altDSID];
    uint64_t v11 = objc_msgSend(v9, "aa_appleAccountWithAltDSID:", v10);

    if (v11)
    {
      uint64_t v12 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:0];
      if (v12) {
        [v8 addObject:v12];
      }
      v13 = [v8 array];

      goto LABEL_34;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [(FAFamilyMember *)self appleID];

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v17 = [(FAFamilyMember *)self appleID];
    id v18 = [v16 predicateForContactsMatchingEmailAddress:v17];
    [v14 addObject:v18];
  }
  v19 = [(FAFamilyMember *)self inviteEmail];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v21 = [(FAFamilyMember *)self inviteEmail];
    v22 = [v20 predicateForContactsMatchingEmailAddress:v21];
    [v14 addObject:v22];
  }
  v23 = (void *)MEMORY[0x1E4F1BA70];
  v24 = [(FAFamilyMember *)self inviteEmail];
  v25 = [v23 phoneNumberWithStringValue:v24];

  if (v25)
  {
    v26 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v25];
    [v14 addObject:v26];
  }
  v27 = [(FAFamilyMember *)self memberPhoneNumbers];

  if (v27)
  {
    v28 = v14;
    v46 = v25;
    v29 = [(FAFamilyMember *)self memberPhoneNumbers];
    v30 = [v29 componentsSeparatedByString:@","];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v36 length])
          {
            v37 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v36];
            if (v37)
            {
              v38 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v37];
              [v28 addObject:v38];
            }
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v33);
    }

    v25 = v46;
    uint64_t v14 = v28;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v39 = v14;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [v7 unifiedContactsMatchingPredicate:*(void *)(*((void *)&v47 + 1) + 8 * j) keysToFetch:v6 error:0];
        [v8 addObjectsFromArray:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v41);
  }

  v13 = [v8 array];

LABEL_34:
  return v13;
}

- (id)contactIncludingImage:(BOOL)a3
{
  BOOL v3 = [(FAFamilyMember *)self contactsIncludingImage:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(FAFamilyMember *)self altDSID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FAFamilyMember *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(FAFamilyMember *)self isEqualToFamilyMember:v4];
  }

  return v5;
}

- (BOOL)isEqualToFamilyMember:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FAFamilyMember *)self age];
  if (v5 == [v4 age])
  {
    id v6 = [(FAFamilyMember *)self altDSID];
    id v7 = [v4 altDSID];
    if ([(FAFamilyMember *)self _nilEqualProperty:v6 with:v7])
    {
      id v8 = [(FAFamilyMember *)self appleID];
      uint64_t v9 = [v4 appleID];
      if ([(FAFamilyMember *)self _nilEqualProperty:v8 with:v9])
      {
        uint64_t v10 = [(FAFamilyMember *)self dsid];
        uint64_t v11 = [v4 dsid];
        if ([(FAFamilyMember *)self _nilEqualProperty:v10 with:v11])
        {
          uint64_t v12 = [(FAFamilyMember *)self firstName];
          v13 = [v4 firstName];
          if ([(FAFamilyMember *)self _nilEqualProperty:v12 with:v13])
          {
            long long v50 = v12;
            int v14 = [(FAFamilyMember *)self hasAskToBuyEnabled];
            if (v14 == [v4 hasAskToBuyEnabled])
            {
              uint64_t v16 = [(FAFamilyMember *)self hashedDSID];
              long long v48 = [v4 hashedDSID];
              long long v49 = (void *)v16;
              if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v16)
                && (int v17 = [(FAFamilyMember *)self hasLinkediTunesAccount],
                    v17 == [v4 hasLinkediTunesAccount])
                && (int v18 = [(FAFamilyMember *)self hasParentalControlsEnabled],
                    v18 == [v4 hasParentalControlsEnabled]))
              {
                uint64_t v20 = [(FAFamilyMember *)self inviteEmail];
                v46 = [v4 inviteEmail];
                long long v47 = (void *)v20;
                if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v20)
                  && (int v21 = -[FAFamilyMember isMe](self, "isMe"), v21 == [v4 isMe])
                  && (int v22 = [(FAFamilyMember *)self isOrganizer],
                      v22 == [v4 isOrganizer])
                  && (int v23 = [(FAFamilyMember *)self isParent],
                      v23 == [v4 isParent]))
                {
                  uint64_t v24 = [(FAFamilyMember *)self iTunesAccountDSID];
                  v44 = [v4 iTunesAccountDSID];
                  v45 = (void *)v24;
                  if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v24))
                  {
                    uint64_t v25 = [(FAFamilyMember *)self iTunesAccountUsername];
                    uint64_t v42 = [v4 iTunesAccountUsername];
                    v43 = (void *)v25;
                    if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v25))
                    {
                      uint64_t v26 = [(FAFamilyMember *)self lastName];
                      uint64_t v40 = [v4 lastName];
                      uint64_t v41 = (void *)v26;
                      if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v26)
                        && (int64_t v27 = -[FAFamilyMember memberType](self, "memberType"), v27 == [v4 memberType]))
                      {
                        uint64_t v28 = [(FAFamilyMember *)self memberTypeDisplayString];
                        v38 = [v4 memberTypeDisplayString];
                        id v39 = (void *)v28;
                        if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v28)
                          && (int64_t v29 = [(FAFamilyMember *)self memberType],
                              v29 == [v4 memberType]))
                        {
                          uint64_t v30 = [(FAFamilyMember *)self memberTypeDisplayString];
                          v36 = [v4 memberTypeDisplayString];
                          v37 = (void *)v30;
                          if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v30))
                          {
                            uint64_t v31 = [(FAFamilyMember *)self memberTypeString];
                            uint64_t v34 = [v4 memberTypeString];
                            v35 = (void *)v31;
                            if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v31))
                            {
                              uint64_t v33 = [(FAFamilyMember *)self statusString];
                              uint64_t v32 = [v4 statusString];
                              BOOL v15 = -[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v33);
                            }
                            else
                            {
                              BOOL v15 = 0;
                            }
                          }
                          else
                          {
                            BOOL v15 = 0;
                          }
                        }
                        else
                        {
                          BOOL v15 = 0;
                        }
                      }
                      else
                      {
                        BOOL v15 = 0;
                      }
                    }
                    else
                    {
                      BOOL v15 = 0;
                    }
                  }
                  else
                  {
                    BOOL v15 = 0;
                  }
                }
                else
                {
                  BOOL v15 = 0;
                }
                uint64_t v12 = v50;
              }
              else
              {
                BOOL v15 = 0;
                uint64_t v12 = v50;
              }
            }
            else
            {
              BOOL v15 = 0;
              uint64_t v12 = v50;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [FAFamilyMember alloc];
  unint64_t v5 = [(FAFamilyMember *)self dictionary];
  id v6 = [(FAFamilyMember *)v4 initWithDictionaryRepresentation:v5];

  return v6;
}

- (BOOL)_nilEqualProperty:(id)a3 with:(id)a4
{
  if (a3 == a4) {
    return 1;
  }
  else {
    return [a3 isEqual:a4];
  }
}

- (void)finishWith:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_21;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-child-dsids"];
  v19 = self;
  id v8 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"member-guardian-dsids"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v4 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      if ([v7 containsObject:v14])
      {
        BOOL v15 = [v4 objectForKeyedSubscript:v14];
        uint64_t v16 = v5;
      }
      else
      {
        if (![v8 containsObject:v14]) {
          continue;
        }
        BOOL v15 = [v4 objectForKeyedSubscript:v14];
        uint64_t v16 = v6;
      }
      [v16 addObject:v15];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
LABEL_14:

  if ([v5 count]) {
    int v17 = v5;
  }
  else {
    int v17 = 0;
  }
  objc_storeStrong((id *)&v19->_remoteChildren, v17);
  if ([v6 count]) {
    int v18 = v6;
  }
  else {
    int v18 = 0;
  }
  objc_storeStrong((id *)&v19->_remoteGuardians, v18);

LABEL_21:
}

- (NSArray)remoteGuardians
{
  return self->_remoteGuardians;
}

- (NSArray)remoteChildren
{
  return self->_remoteChildren;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSDictionary)idsCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsCache, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_remoteChildren, 0);
  objc_storeStrong((id *)&self->_remoteGuardians, 0);
}

@end