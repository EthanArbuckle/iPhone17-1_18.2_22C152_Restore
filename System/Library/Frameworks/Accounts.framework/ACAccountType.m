@interface ACAccountType
+ (BOOL)supportsSecureCoding;
+ (NSSet)allIdentifiers;
- (ACAccountStore)accountStore;
- (ACAccountType)initWithCoder:(id)a3;
- (ACAccountType)initWithIdentifier:(id)a3 description:(id)a4;
- (ACAccountType)initWithManagedAccountType:(id)a3;
- (ACAccountType)initWithManagedAccountType:(id)a3 accountStore:(id)a4;
- (BOOL)accessGranted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObsolete;
- (BOOL)supportsMultipleAccounts;
- (NSSet)accessKeys;
- (NSSet)supportedDataclasses;
- (NSSet)syncableDataclasses;
- (NSString)accountTypeDescription;
- (NSString)credentialType;
- (NSString)description;
- (NSString)fullDescription;
- (NSString)identifier;
- (NSString)owningBundleID;
- (NSURL)objectID;
- (id)_encodeProtobuf;
- (id)_encodeProtobufData;
- (id)_initWithProtobuf:(id)a3;
- (id)_initWithProtobufData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialProtectionPolicy;
- (int)supportsAuthentication;
- (int)visibility;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAccountTypeDescription:(id)a3;
- (void)setCredentialProtectionPolicy:(id)a3;
- (void)setCredentialType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setObsolete:(BOOL)a3;
- (void)setOwningBundleID:(id)a3;
- (void)setSupportedDataclasses:(id)a3;
- (void)setSupportsAuthentication:(int)a3;
- (void)setSupportsMultipleAccounts:(BOOL)a3;
- (void)setSyncableDataclasses:(id)a3;
- (void)setVisibility:(int)a3;
@end

@implementation ACAccountType

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountTypeDescription copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSURL *)self->_objectID copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  *(_DWORD *)(v5 + 40) = self->_visibility;
  uint64_t v12 = [(NSString *)self->_credentialType copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_credentialProtectionPolicy copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  *(_DWORD *)(v5 + 64) = self->_supportsAuthentication;
  *(unsigned char *)(v5 + 68) = self->_supportsMultipleAccounts;
  uint64_t v16 = [(NSSet *)self->_supportedDataclasses copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSSet *)self->_syncableDataclasses copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSSet *)self->_accessKeys copyWithZone:a3];
  v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  uint64_t v23 = [(NSString *)self->_owningBundleID copyWithZone:a3];
  v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  *(unsigned char *)(v5 + 69) = self->_obsolete;
  return (id)v5;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccountType)initWithManagedAccountType:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ACAccountType;
  uint64_t v5 = [(ACAccountType *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountTypeDescription];
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v6;

    uint64_t v8 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectID];
    uint64_t v11 = [v10 URIRepresentation];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v11;

    v13 = [v4 visibility];
    v5->_visibility = [v13 intValue];

    uint64_t v14 = [v4 credentialType];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v14;

    uint64_t v16 = [v4 credentialProtectionPolicy];
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v16;

    uint64_t v18 = [v4 supportsAuthentication];
    v5->_supportsAuthentication = [v18 BOOLValue];

    v19 = [v4 supportsMultipleAccounts];
    v5->_supportsMultipleAccounts = [v19 BOOLValue];

    uint64_t v20 = [v4 owningBundleID];
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v20;

    v22 = [v4 obsolete];
    v5->_obsolete = [v22 BOOLValue];

    uint64_t v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(ACAccountType *)self identifier];
  [v13 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(ACAccountType *)self accountTypeDescription];
  [v13 encodeObject:v5 forKey:@"accountTypeDescription"];

  uint64_t v6 = [(ACAccountType *)self objectID];
  [v13 encodeObject:v6 forKey:@"objectID"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[ACAccountType visibility](self, "visibility"));
  [v13 encodeObject:v7 forKey:@"visibility"];

  [v13 encodeObject:self->_credentialType forKey:@"credentialType"];
  uint64_t v8 = [(ACAccountType *)self credentialProtectionPolicy];
  [v13 encodeObject:v8 forKey:@"credentialProtectionPolicy"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ACAccountType supportsAuthentication](self, "supportsAuthentication") != 0);
  [v13 encodeObject:v9 forKey:@"supportsAuthentication"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ACAccountType supportsMultipleAccounts](self, "supportsMultipleAccounts"));
  [v13 encodeObject:v10 forKey:@"supportsMultipleAccounts"];

  uint64_t v11 = [(ACAccountType *)self owningBundleID];
  [v13 encodeObject:v11 forKey:@"owningBundleID"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ACAccountType isObsolete](self, "isObsolete"));
  [v13 encodeObject:v12 forKey:@"obsolete"];

  [v13 encodeObject:self->_syncableDataclasses forKey:@"syncableDataclasses"];
  [v13 encodeObject:self->_supportedDataclasses forKey:@"supportedDataclasses"];
}

- (NSURL)objectID
{
  return self->_objectID;
}

- (int)visibility
{
  return self->_visibility;
}

- (BOOL)supportsMultipleAccounts
{
  return self->_supportsMultipleAccounts;
}

- (int)supportsAuthentication
{
  v2 = self;
  objc_sync_enter(v2);
  int supportsAuthentication = v2->_supportsAuthentication;
  if (!supportsAuthentication) {
    v2->_int supportsAuthentication = 0;
  }
  objc_sync_exit(v2);

  return supportsAuthentication;
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (BOOL)isObsolete
{
  return self->_obsolete;
}

- (id)credentialProtectionPolicy
{
  v2 = self;
  objc_sync_enter(v2);
  credentialProtectionPolicy = v2->_credentialProtectionPolicy;
  if (!credentialProtectionPolicy)
  {
    uint64_t v4 = [(id)*MEMORY[0x1E4F3B570] copy];
    uint64_t v5 = v2->_credentialProtectionPolicy;
    v2->_credentialProtectionPolicy = (NSString *)v4;

    credentialProtectionPolicy = v2->_credentialProtectionPolicy;
  }
  uint64_t v6 = credentialProtectionPolicy;
  objc_sync_exit(v2);

  return v6;
}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (ACAccountType)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ACAccountType;
  uint64_t v5 = [(ACAccountType *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountTypeDescription"];
    uint64_t v7 = [v6 copy];
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v10 = [v9 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    uint64_t v13 = [v12 copy];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visibility"];
    v5->_visibility = [v15 intValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialType"];
    uint64_t v17 = [v16 copy];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialProtectionPolicy"];
    uint64_t v20 = [v19 copy];
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsAuthentication"];
    v5->_int supportsAuthentication = [v22 BOOLValue];

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsMultipleAccounts"];
    v5->_supportsMultipleAccounts = [v23 BOOLValue];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owningBundleID"];
    uint64_t v25 = [v24 copy];
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obsolete"];
    v5->_obsolete = [v27 BOOLValue];

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"syncableDataclasses"];
    syncableDataclasses = v5->_syncableDataclasses;
    v5->_syncableDataclasses = (NSSet *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"supportedDataclasses"];
    supportedDataclasses = v5->_supportedDataclasses;
    v5->_supportedDataclasses = (NSSet *)v36;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_accessKeys, 0);
  objc_storeStrong((id *)&self->_syncableDataclasses, 0);
  objc_storeStrong((id *)&self->_supportedDataclasses, 0);
  objc_destroyWeak((id *)&self->_accountStore);
  objc_storeStrong((id *)&self->_credentialProtectionPolicy, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_accountTypeDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccountType)initWithManagedAccountType:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ACAccountType *)self initWithManagedAccountType:a3];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_accountStore, v6);
  }

  return v8;
}

- (NSSet)accessKeys
{
  v2 = self;
  objc_sync_enter(v2);
  accessKeys = v2->_accessKeys;
  if (!accessKeys)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    uint64_t v5 = [WeakRetained accessKeysForAccountType:v2];
    id v6 = v2->_accessKeys;
    v2->_accessKeys = (NSSet *)v5;

    accessKeys = v2->_accessKeys;
  }
  uint64_t v7 = accessKeys;
  objc_sync_exit(v2);

  return v7;
}

+ (NSSet)allIdentifiers
{
  if (allIdentifiers_onceToken != -1) {
    dispatch_once(&allIdentifiers_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)allIdentifiers_allIdentifiers;

  return (NSSet *)v2;
}

void __31__ACAccountType_allIdentifiers__block_invoke()
{
  v4[54] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.twitter";
  v4[1] = @"com.apple.sinaweibo";
  v4[2] = @"com.apple.facebook";
  v4[3] = @"com.apple.account.SubscribedCalendar";
  v4[4] = @"com.apple.account.CalDAV";
  v4[5] = @"com.apple.account.CardDAV";
  v4[6] = @"com.apple.account.BookmarkDAV";
  v4[7] = @"com.apple.account.IMAP";
  v4[8] = @"com.apple.account.POP";
  v4[9] = @"com.apple.account.SMTP";
  v4[10] = @"com.apple.account.Exchange";
  v4[11] = @"com.apple.account.Hotmail";
  v4[12] = @"com.apple.account.LDAP";
  v4[13] = @"com.apple.account.Google";
  v4[14] = @"com.apple.account.Yahoo";
  v4[15] = @"com.apple.account.OnMyDevice";
  v4[16] = @"com.apple.account.IMAPNotes";
  v4[17] = @"com.apple.account.IMAPMail";
  v4[18] = @"com.apple.account.AppleAccount";
  v4[19] = @"com.apple.account.AppleID";
  v4[20] = @"com.apple.account.FaceTime";
  v4[21] = @"com.apple.account.Madrid";
  v4[22] = @"com.apple.account.GameCenter";
  v4[23] = @"com.apple.account.iTunesStore";
  v4[24] = @"com.apple.account.iTunesStore.sandbox";
  v4[25] = @"com.apple.flickr";
  v4[26] = @"com.apple.vimeo";
  v4[27] = @"com.apple.tudou";
  v4[28] = @"com.apple.youku";
  v4[29] = @"com.apple.account.yelp";
  v4[30] = @"com.apple.account.tencentweibo";
  v4[31] = @"com.apple.account.IdentityServices";
  v4[32] = @"com.apple.account.kerberos.sso.";
  v4[33] = @"com.apple.account.DeviceLocator";
  v4[34] = @"com.apple.account.HolidayCalendar";
  v4[35] = @"com.apple.account.FindMyFriends";
  v4[36] = @"com.apple.account.AppleIDAuthentication";
  v4[37] = @"com.apple.account.CloudKit";
  v4[38] = @"com.apple.account.126";
  v4[39] = @"com.apple.account.163";
  v4[40] = @"com.apple.account.aol";
  v4[41] = @"com.apple.account.qq";
  v4[42] = @"com.apple.account.osxserver";
  v4[43] = @"com.apple.account.jabber";
  v4[44] = @"com.apple.account.yahooim";
  v4[45] = @"com.apple.account.aim";
  v4[46] = @"com.apple.account.idms";
  v4[47] = @"com.apple.account.mso";
  v4[48] = @"com.apple.account.SingleSignOn";
  v4[49] = @"com.apple.account.facebookLegacy";
  v4[50] = @"com.apple.account.CalDAVLegacy";
  v4[51] = @"com.apple.account.CardDAVLegacy";
  v4[52] = @"com.apple.account.RemoteManagement";
  v4[53] = @"com.apple.account.PublishedCalendar";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:54];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)allIdentifiers_allIdentifiers;
  allIdentifiers_allIdentifiers = v2;
}

- (ACAccountType)initWithIdentifier:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACAccountType;
  uint64_t v8 = [(ACAccountType *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    accountTypeDescription = v8->_accountTypeDescription;
    v8->_accountTypeDescription = (NSString *)v11;
  }
  return v8;
}

- (id)_initWithProtobuf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACAccountType *)self init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 accountTypeDescription];
    uint64_t v8 = [v7 copy];
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v8;

    uint64_t v10 = [v6 identifier];
    uint64_t v11 = [v10 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    uint64_t v13 = [v6 objectID];
    objc_super v14 = [v13 url];
    uint64_t v15 = [v14 copy];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v15;

    v5->_visibility = [v6 visibility];
    uint64_t v17 = [v6 credentialType];
    uint64_t v18 = [v17 copy];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v18;

    uint64_t v20 = [v6 credentialProtectionPolicy];
    uint64_t v21 = [v20 copy];
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v21;

    v5->_int supportsAuthentication = [v6 supportsAuthentication];
    v5->_supportsMultipleAccounts = [v6 supportsMultipleAccounts];
    uint64_t v23 = [v6 owningBundleID];
    uint64_t v24 = [v23 copy];
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v24;

    LOBYTE(v23) = [v6 obsolete];
    v5->_obsolete = (char)v23;
    v26 = v5;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACAccountType.m", 333, @"Invalid parameter not satisfying: %@", @"data.length != 0" object file lineNumber description];
  }
  if ([v5 length])
  {
    id v6 = [[ACProtobufAccountType alloc] initWithData:v5];
    if (v6)
    {
      self = (ACAccountType *)[(ACAccountType *)self _initWithProtobuf:v6];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  v3 = objc_opt_new();
  [v3 setAccountTypeDescription:self->_accountTypeDescription];
  [v3 setIdentifier:self->_identifier];
  id v4 = [[ACProtobufURL alloc] initWithURL:self->_objectID];
  [v3 setObjectID:v4];

  [v3 setVisibility:self->_visibility];
  [v3 setCredentialType:self->_credentialType];
  [v3 setCredentialProtectionPolicy:self->_credentialProtectionPolicy];
  [v3 setSupportsAuthentication:self->_supportsAuthentication];
  [v3 setSupportsMultipleAccounts:self->_supportsMultipleAccounts];
  [v3 setOwningBundleID:self->_owningBundleID];
  [v3 setObsolete:self->_obsolete];

  return v3;
}

- (id)_encodeProtobufData
{
  uint64_t v2 = [(ACAccountType *)self _encodeProtobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(ACAccountType *)self accountTypeDescription];
  id v5 = [(ACAccountType *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return (NSString *)v6;
}

- (NSString)fullDescription
{
  v3 = NSString;
  id v4 = [(ACAccountType *)self identifier];
  id v5 = [(ACAccountType *)self accountTypeDescription];
  id v6 = [(ACAccountType *)self objectID];
  if ([(ACAccountType *)self supportsAuthentication]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(ACAccountType *)self supportsMultipleAccounts]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(ACAccountType *)self isObsolete]) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  uint64_t v10 = [(ACAccountType *)self owningBundleID];
  uint64_t v11 = [(ACAccountType *)self supportedDataclasses];
  uint64_t v12 = [(ACAccountType *)self syncableDataclasses];
  uint64_t v13 = [v3 stringWithFormat:@"identifier: %@\ndescription: %@\nobjectID: %@\nsupportsAuthentication %@\nsupportsMultipleAccounts %@\nobsolete %@\nowningBundleID %@\nsupportedDataclasses %@\nsyncableDataclasses %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSSet)supportedDataclasses
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  supportedDataclasses = v2->_supportedDataclasses;
  if (!supportedDataclasses)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    uint64_t v5 = [WeakRetained supportedDataclassesForAccountType:v2];
    id v6 = v2->_supportedDataclasses;
    v2->_supportedDataclasses = (NSSet *)v5;

    supportedDataclasses = v2->_supportedDataclasses;
  }
  id v7 = supportedDataclasses;
  objc_sync_exit(v2);

  return v7;
}

- (void)setSupportedDataclasses:(id)a3
{
  id v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedDataclasses = obj->_supportedDataclasses;
  obj->_supportedDataclasses = v4;

  objc_sync_exit(obj);
}

- (NSSet)syncableDataclasses
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  syncableDataclasses = v2->_syncableDataclasses;
  if (!syncableDataclasses)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    uint64_t v5 = [WeakRetained syncableDataclassesForAccountType:v2];
    id v6 = v2->_syncableDataclasses;
    v2->_syncableDataclasses = (NSSet *)v5;

    syncableDataclasses = v2->_syncableDataclasses;
  }
  id v7 = syncableDataclasses;
  objc_sync_exit(v2);

  return v7;
}

- (void)setSyncableDataclasses:(id)a3
{
  id v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  syncableDataclasses = obj->_syncableDataclasses;
  obj->_syncableDataclasses = v4;

  objc_sync_exit(obj);
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAccountTypeDescription:(id)a3
{
  self->_accountTypeDescription = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setObjectID:(id)a3
{
}

- (void)setCredentialType:(id)a3
{
  self->_credentialType = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setVisibility:(int)a3
{
  self->_visibility = a3;
}

- (void)setCredentialProtectionPolicy:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  credentialProtectionPolicy = v4->_credentialProtectionPolicy;
  v4->_credentialProtectionPolicy = (NSString *)v5;

  objc_sync_exit(v4);
}

- (BOOL)accessGranted
{
  uint64_t v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  LOBYTE(v2) = [WeakRetained permissionForAccountType:v2];

  return (char)v2;
}

- (void)setSupportsAuthentication:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int supportsAuthentication = a3;
  objc_sync_exit(obj);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACAccountType *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      identifier = self->_identifier;
      id v7 = [(ACAccountType *)v4 identifier];
      char v8 = [(NSString *)identifier isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  identifier = self->_identifier;
  if (identifier)
  {
    return [(NSString *)identifier hash];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ACAccountType;
    return [(ACAccountType *)&v5 hash];
  }
}

- (ACAccountStore)accountStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);

  return (ACAccountStore *)WeakRetained;
}

- (void)setSupportsMultipleAccounts:(BOOL)a3
{
  self->_supportsMultipleAccounts = a3;
}

- (void)setObsolete:(BOOL)a3
{
  self->_obsolete = a3;
}

- (void)setOwningBundleID:(id)a3
{
}

@end