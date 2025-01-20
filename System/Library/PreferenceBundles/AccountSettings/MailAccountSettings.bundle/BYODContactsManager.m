@interface BYODContactsManager
+ (BYODContactsManager)sharedInstance;
+ (id)log;
- (BYODContactsManager)init;
- (id)_avatarImageForContacts:(id)a3;
- (id)_avatarImageRenderer;
- (id)_defaultKeyDescriptors;
- (id)_fetchContactForUser:(id)a3;
- (id)avatarImageForMeContact;
- (id)avatarImageForUser:(id)a3;
- (id)fetchNameFromContacts:(id)a3;
- (id)fullNameWithFirstName:(id)a3 lastName:(id)a4;
- (id)monogramWithFirstName:(id)a3 andLastName:(id)a4;
- (void)fetchAvatarImageForUser:(id)a3 withCompletion:(id)a4;
@end

@implementation BYODContactsManager

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30518;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D73D8 != -1) {
    dispatch_once(&qword_D73D8, block);
  }
  v2 = (void *)qword_D73D0;

  return v2;
}

+ (BYODContactsManager)sharedInstance
{
  if (qword_D73E8 != -1) {
    dispatch_once(&qword_D73E8, &stru_B9230);
  }
  v2 = (void *)qword_D73E0;

  return (BYODContactsManager *)v2;
}

- (BYODContactsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BYODContactsManager;
  v2 = [(BYODContactsManager *)&v10 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    localContactStore = v2->_localContactStore;
    v2->_localContactStore = v3;

    uint64_t v5 = +[CNAvatarViewControllerSettings settingsWithContactStore:v2->_localContactStore threeDTouchEnabled:0];
    avatarSettings = v2->_avatarSettings;
    v2->_avatarSettings = (CNAvatarViewControllerSettings *)v5;

    [(CNAvatarViewControllerSettings *)v2->_avatarSettings setStyle:0];
    v7 = (CNAvatarViewController *)objc_alloc_init((Class)CNAvatarViewController);
    avatar = v2->_avatar;
    v2->_avatar = v7;
  }
  return v2;
}

- (id)_defaultKeyDescriptors
{
  v2 = [(CNAvatarViewController *)self->_avatar descriptorForRequiredKeys];
  uint64_t v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)avatarImageForMeContact
{
  localContactStore = self->_localContactStore;
  v4 = [(BYODContactsManager *)self _defaultKeyDescriptors];
  id v10 = 0;
  uint64_t v5 = [(CNContactStore *)localContactStore _ios_meContactWithKeysToFetch:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    v11 = v5;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    v8 = [(BYODContactsManager *)self _avatarImageForContacts:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)avatarImageForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BYODContactsManager *)self _fetchContactForUser:v4];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    v7 = [(BYODContactsManager *)self _avatarImageForContacts:v6];
  }
  else
  {
    v8 = [v4 firstName];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = [v4 firstName];
      v11 = [v4 lastName];
      v7 = [(BYODContactsManager *)self monogramWithFirstName:v10 andLastName:v11];
    }
    else
    {
      id v10 = [v4 invitationHandle];
      v7 = [(BYODContactsManager *)self monogramWithFirstName:v10 andLastName:&stru_B9F70];
    }
  }

  return v7;
}

- (void)fetchAvatarImageForUser:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 dsid];
  if ([v6 isFamilyMember])
  {
    id v9 = objc_alloc_init((Class)NSNumberFormatter);
    [v9 setNumberStyle:1];
    id v10 = [v9 numberFromString:v8];
    id v11 = [objc_alloc((Class)FAFetchFamilyPhotoRequest) initWithFamilyMemberDSID:v10 size:1 localFallback:1];
    [v11 setUseMonogramAsLastResort:1];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_30C64;
    v15[4] = sub_30C74;
    id v16 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_30C7C;
    v12[3] = &unk_B9258;
    v14 = v15;
    id v13 = v7;
    [v11 startRequestWithCompletionHandler:v12];

    _Block_object_dispose(v15, 8);
  }
  else
  {
    id v9 = [(BYODContactsManager *)self avatarImageForUser:v6];
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

- (id)monogramWithFirstName:(id)a3 andLastName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)CNMutableContact);
  [v8 setGivenName:v6];
  [v8 setFamilyName:v7];
  id v12 = v8;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  id v10 = [(BYODContactsManager *)self _avatarImageForContacts:v9];

  return v10;
}

- (id)fetchNameFromContacts:(id)a3
{
  id v4 = [(BYODContactsManager *)self _fetchContactForUser:a3];
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 firstObject];
    id v7 = [v6 givenName];
    id v8 = [v6 familyName];
    id v9 = [(BYODContactsManager *)self fullNameWithFirstName:v7 lastName:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)fullNameWithFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSPersonNameComponents);
  [v7 setGivenName:v5];
  [v7 setFamilyName:v6];
  id v8 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v7 style:2 options:0];
  if ([v8 length])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = +[NSString stringWithFormat:@"%@ %@", v5, v6];
  }
  id v10 = v9;

  return v10;
}

- (id)_avatarImageRenderer
{
  contactsAvatarImageRenderer = self->_contactsAvatarImageRenderer;
  if (!contactsAvatarImageRenderer)
  {
    id v4 = objc_alloc((Class)CNAvatarImageRenderer);
    id v5 = +[CNAvatarImageRendererSettings defaultSettings];
    id v6 = (CNAvatarImageRenderer *)[v4 initWithSettings:v5];
    id v7 = self->_contactsAvatarImageRenderer;
    self->_contactsAvatarImageRenderer = v6;

    contactsAvatarImageRenderer = self->_contactsAvatarImageRenderer;
  }

  return contactsAvatarImageRenderer;
}

- (id)_avatarImageForContacts:(id)a3
{
  id v4 = a3;
  id v5 = +[UIScreen mainScreen];
  [v5 scale];
  id v7 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, 38.0, 38.0, v6);

  if ((unint64_t)[v4 count] >= 2)
  {
    id v8 = [v4 firstObject];
    uint64_t v9 = +[NSArray arrayWithObject:v8];

    id v4 = (id)v9;
  }
  id v10 = [(BYODContactsManager *)self _avatarImageRenderer];
  id v11 = [v10 avatarImageForContacts:v4 scope:v7];

  return v11;
}

- (id)_fetchContactForUser:(id)a3
{
  id v4 = a3;
  id v5 = [v4 emailAddress];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = [v4 emailAddress];
    id v8 = +[CNContact predicateForContactsMatchingEmailAddress:v7];
  }
  else
  {
    uint64_t v9 = [v4 phoneNumber];
    id v10 = [v9 length];

    if (!v10)
    {
LABEL_10:
      v14 = 0;
      goto LABEL_13;
    }
    id v7 = [v4 phoneNumber];
    id v11 = +[CNPhoneNumber phoneNumberWithStringValue:v7];
    id v8 = +[CNContact predicateForContactsMatchingPhoneNumber:v11];
  }
  if (!v8) {
    goto LABEL_10;
  }
  id v12 = [(BYODContactsManager *)self _defaultKeyDescriptors];
  localContactStore = self->_localContactStore;
  id v18 = 0;
  v14 = [(CNContactStore *)localContactStore unifiedContactsMatchingPredicate:v8 keysToFetch:v12 error:&v18];
  id v15 = v18;
  if (v15 || ![v14 count])
  {
    id v16 = +[BYODContactsManager log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Unable to query a unified contact with error: %@", buf, 0xCu);
    }

    v14 = 0;
  }

LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_avatarSettings, 0);
  objc_storeStrong((id *)&self->_contactsAvatarImageRenderer, 0);

  objc_storeStrong((id *)&self->_localContactStore, 0);
}

@end