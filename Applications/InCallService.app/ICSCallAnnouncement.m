@interface ICSCallAnnouncement
+ (id)announcementWithCall:(id)a3;
- (CNContactStore)contactStore;
- (ICSCallAnnouncement)init;
- (ICSCallAnnouncement)initWithCall:(id)a3;
- (NSArray)contactKeyDescriptors;
- (NSArray)contacts;
- (NSString)callDestinationID;
- (NSString)callDisplayName;
- (NSString)callISOCountryCode;
- (NSString)callServiceName;
- (NSString)callerName;
- (NSString)contactIdentifier;
- (id)callServiceNameForCall:(id)a3;
- (id)callerNameForCall:(id)a3;
- (id)contactForIdentifier:(id)a3;
- (id)contactsForDestinationID:(id)a3 isoCountryCode:(id)a4;
- (id)text;
- (int64_t)callerNameType;
- (int64_t)callerNameTypeForCall:(id)a3;
- (void)dealloc;
- (void)handleContactStoreDidChangeNotification:(id)a3;
- (void)setCallDestinationID:(id)a3;
- (void)setCallDisplayName:(id)a3;
- (void)setCallISOCountryCode:(id)a3;
- (void)setCallServiceName:(id)a3;
- (void)setCallerName:(id)a3;
- (void)setCallerNameType:(int64_t)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContacts:(id)a3;
@end

@implementation ICSCallAnnouncement

+ (id)announcementWithCall:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithCall:v3];

  return v4;
}

- (ICSCallAnnouncement)init
{
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is not available for use. To create an object instance use the designated initializer.", "-[ICSCallAnnouncement init]");
  NSLog(@"** TUAssertion failure: %@", v3);

  _TUAssertShouldCrashApplication();
  return 0;
}

- (ICSCallAnnouncement)initWithCall:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSCallAnnouncement;
  v5 = [(ICSAnnouncement *)&v20 init];
  if (v5)
  {
    v6 = [v4 handle];
    uint64_t v7 = [v6 value];
    callDestinationID = v5->_callDestinationID;
    v5->_callDestinationID = (NSString *)v7;

    uint64_t v9 = [v4 displayName];
    callDisplayName = v5->_callDisplayName;
    v5->_callDisplayName = (NSString *)v9;

    uint64_t v11 = [v4 isoCountryCode];
    callISOCountryCode = v5->_callISOCountryCode;
    v5->_callISOCountryCode = (NSString *)v11;

    uint64_t v13 = [(ICSCallAnnouncement *)v5 callServiceNameForCall:v4];
    callServiceName = v5->_callServiceName;
    v5->_callServiceName = (NSString *)v13;

    v15 = [(ICSCallAnnouncement *)v5 callerNameForCall:v4];
    v16 = (NSString *)[v15 copy];
    callerName = v5->_callerName;
    v5->_callerName = v16;

    v5->_callerNameType = [(ICSCallAnnouncement *)v5 callerNameTypeForCall:v4];
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"handleContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSCallAnnouncement;
  [(ICSCallAnnouncement *)&v4 dealloc];
}

- (NSArray)contacts
{
  contacts = self->_contacts;
  if (!contacts)
  {
    objc_super v4 = [(ICSCallAnnouncement *)self contactIdentifier];
    id v5 = [v4 length];

    if (v5)
    {
      v6 = [(ICSCallAnnouncement *)self contactIdentifier];
      uint64_t v7 = [(ICSCallAnnouncement *)self contactForIdentifier:v6];

      if (v7)
      {
        v15 = v7;
        v8 = +[NSArray arrayWithObjects:&v15 count:1];
        uint64_t v9 = self->_contacts;
        self->_contacts = v8;
      }
    }
    contacts = self->_contacts;
    if (!contacts)
    {
      v10 = [(ICSCallAnnouncement *)self callDestinationID];
      uint64_t v11 = [(ICSCallAnnouncement *)self callISOCountryCode];
      v12 = [(ICSCallAnnouncement *)self contactsForDestinationID:v10 isoCountryCode:v11];
      uint64_t v13 = self->_contacts;
      self->_contacts = v12;

      contacts = self->_contacts;
    }
  }

  return contacts;
}

- (id)callerNameForCall:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 callerNameFromNetwork];
  id v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 callerNameFromNetwork];
LABEL_9:
    uint64_t v13 = (void *)v6;
    goto LABEL_10;
  }
  uint64_t v7 = [v3 suggestedDisplayName];
  id v8 = [v7 length];

  if (v8)
  {
    uint64_t v6 = [v3 suggestedDisplayName];
    goto LABEL_9;
  }
  uint64_t v9 = [v3 companyName];
  id v10 = [v9 length];

  if (v10)
  {
    uint64_t v6 = [v3 companyName];
    goto LABEL_9;
  }
  uint64_t v11 = [v3 localizedLabel];
  id v12 = [v11 length];

  if (v12)
  {
    uint64_t v6 = [v3 localizedLabel];
    goto LABEL_9;
  }
  v15 = [v3 remoteParticipantHandles];
  v16 = [v15 anyObject];
  uint64_t v13 = [v16 value];

LABEL_10:

  return v13;
}

- (int64_t)callerNameTypeForCall:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 callerNameFromNetwork];
  id v5 = [v4 length];

  if (v5) {
    goto LABEL_2;
  }
  uint64_t v7 = [v3 suggestedDisplayName];
  id v8 = [v7 length];

  if (v8)
  {
    int64_t v6 = 1;
    goto LABEL_5;
  }
  id v10 = [v3 companyName];
  id v11 = [v10 length];

  if (v11)
  {
LABEL_2:
    int64_t v6 = 0;
  }
  else
  {
    id v12 = [v3 localizedLabel];
    id v13 = [v12 length];

    if (v13) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 3;
    }
  }
LABEL_5:

  return v6;
}

- (id)callServiceNameForCall:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 provider];
  if ([v4 isFaceTimeProvider])
  {
    unsigned int v5 = [v3 isVideo];
    int64_t v6 = +[NSBundle mainBundle];
    uint64_t v7 = v6;
    if (v5) {
      CFStringRef v8 = @"ANNOUNCEMENT_FACETIME_VIDEO";
    }
    else {
      CFStringRef v8 = @"ANNOUNCEMENT_FACETIME_AUDIO";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1002D6110 table:@"InCallService"];
  }
  else
  {
    if ([v4 isTelephonyProvider])
    {
      uint64_t v9 = 0;
      goto LABEL_13;
    }
    CFStringRef v10 = @"ANNOUNCEMENT_CALL_PROVIDER_NAME_%@_CALL_TYPE_VIDEO";
    if (([v3 isVideo] & 1) == 0 && !objc_msgSend(v3, "isThirdPartyVideo")) {
      CFStringRef v10 = @"ANNOUNCEMENT_CALL_PROVIDER_NAME_%@_CALL_TYPE_AUDIO";
    }
    uint64_t v7 = +[NSBundle mainBundle];
    id v11 = [v7 localizedStringForKey:v10 value:&stru_1002D6110 table:@"InCallService"];
    id v12 = [v4 localizedName];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
  }
LABEL_13:

  return v9;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_super v4 = +[CNContactStore contactStore];
    unsigned int v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (id)text
{
  id v3 = [(ICSCallAnnouncement *)self contactIdentifier];

  if (v3)
  {
    id v3 = [(ICSCallAnnouncement *)self callDisplayName];
  }
  if (![v3 length])
  {
    uint64_t v4 = [(ICSCallAnnouncement *)self callerName];

    id v3 = (void *)v4;
  }
  unsigned int v5 = +[NSBundle mainBundle];
  int64_t v6 = [v5 localizedStringForKey:@"%@ call from %@." value:&stru_1002D6110 table:@"InCallService"];
  uint64_t v7 = [(ICSCallAnnouncement *)self callServiceName];
  CFStringRef v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v3);

  return v8;
}

- (NSArray)contactKeyDescriptors
{
  v4[0] = CNContactGivenNameKey;
  v4[1] = CNContactMiddleNameKey;
  v4[2] = CNContactFamilyNameKey;
  v4[3] = CNContactNicknameKey;
  v4[4] = CNContactPhoneticGivenNameKey;
  v4[5] = CNContactPhoneticMiddleNameKey;
  v4[6] = CNContactPhoneticFamilyNameKey;
  v4[7] = CNContactOrganizationNameKey;
  v4[8] = CNContactPhonemeDataKey;
  v4[9] = CNContactPronunciationGivenNameKey;
  v4[10] = CNContactPronunciationFamilyNameKey;
  v2 = +[NSArray arrayWithObjects:v4 count:11];

  return (NSArray *)v2;
}

- (id)contactForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieving contact matching the specified contact identifier (%@).", buf, 0xCu);
  }

  int64_t v6 = [(ICSCallAnnouncement *)self contactStore];
  if (v6)
  {
    uint64_t v7 = [(ICSCallAnnouncement *)self contactKeyDescriptors];
    id v18 = 0;
    CFStringRef v8 = [v6 unifiedContactWithIdentifier:v4 keysToFetch:v7 error:&v18];
    id v9 = v18;

    if (v9 && [v9 code] != (id)200)
    {
      CFStringRef v10 = sub_1000D5130();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001EC104((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    CFStringRef v8 = 0;
  }

  return v8;
}

- (id)contactsForDestinationID:(id)a3 isoCountryCode:(id)a4
{
  int64_t v6 = a3;
  id v7 = a4;
  CFStringRef v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retrieving contact matching the specified identifier (%@) and ISO country code (%@).", buf, 0x16u);
  }

  id v9 = [(ICSCallAnnouncement *)self contactStore];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_26;
  }
  if (![v6 destinationIdIsEmailAddress])
  {
    if (![v6 destinationIdIsPhoneNumber]) {
      goto LABEL_22;
    }
    if (![v7 length]
      || ([v7 lowercaseString],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          +[CNPhoneNumber phoneNumberWithDigits:v6 countryCode:v12], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v12, !v13))
    {
      uint64_t v13 = +[CNPhoneNumber phoneNumberWithStringValue:v6];
    }
    CFStringRef v10 = +[CNContact predicateForContactsMatchingPhoneNumber:v13];

    if (!v10) {
      goto LABEL_22;
    }
LABEL_13:
    uint64_t v14 = [(ICSCallAnnouncement *)self contactKeyDescriptors];
    id v31 = 0;
    uint64_t v11 = [v9 unifiedContactsMatchingPredicate:v10 keysToFetch:v14 error:&v31];
    id v15 = v31;

    if (![v11 count])
    {
      uint64_t v16 = sub_1000D5130();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Did not find any contacts matching the predicate (%@).", buf, 0xCu);
      }
    }
    if (v15)
    {
      v17 = sub_1000D5130();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001EC104((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    goto LABEL_25;
  }
  CFStringRef v10 = +[CNContact predicateForContactsMatchingEmailAddress:v6];
  if (v10) {
    goto LABEL_13;
  }
LABEL_22:
  CFStringRef v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001EC170((uint64_t)v6, v10, v24, v25, v26, v27, v28, v29);
  }
  uint64_t v11 = 0;
LABEL_25:

LABEL_26:

  return v11;
}

- (void)handleContactStoreDidChangeNotification:(id)a3
{
}

- (NSString)callerName
{
  return self->_callerName;
}

- (void)setCallerName:(id)a3
{
}

- (int64_t)callerNameType
{
  return self->_callerNameType;
}

- (void)setCallerNameType:(int64_t)a3
{
  self->_callerNameType = a3;
}

- (NSString)callServiceName
{
  return self->_callServiceName;
}

- (void)setCallServiceName:(id)a3
{
}

- (NSString)callDestinationID
{
  return self->_callDestinationID;
}

- (void)setCallDestinationID:(id)a3
{
}

- (void)setContacts:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (NSString)callDisplayName
{
  return self->_callDisplayName;
}

- (void)setCallDisplayName:(id)a3
{
}

- (NSString)callISOCountryCode
{
  return self->_callISOCountryCode;
}

- (void)setCallISOCountryCode:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callISOCountryCode, 0);
  objc_storeStrong((id *)&self->_callDisplayName, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_callDestinationID, 0);
  objc_storeStrong((id *)&self->_callServiceName, 0);

  objc_storeStrong((id *)&self->_callerName, 0);
}

@end