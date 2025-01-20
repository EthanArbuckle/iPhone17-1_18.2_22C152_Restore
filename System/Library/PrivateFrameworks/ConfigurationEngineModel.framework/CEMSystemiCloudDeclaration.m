@interface CEMSystemiCloudDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowCloudBackup:(id)a4 withAllowCloudDocumentSync:(id)a5 withAllowFindMyFriendsModification:(id)a6 withAllowPhotoStream:(id)a7 withAllowSharedStream:(id)a8 withAllowCloudPhotoLibrary:(id)a9 withAllowCloudBookmarks:(id)a10 withAllowCloudMail:(id)a11 withAllowCloudCalendar:(id)a12 withAllowCloudReminders:(id)a13 withAllowCloudAddressBook:(id)a14 withAllowCloudNotes:(id)a15 withAllowCloudDesktopAndDocuments:(id)a16 withAllowCloudKeychainSync:(id)a17;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowCloudAddressBook;
- (NSNumber)payloadAllowCloudBackup;
- (NSNumber)payloadAllowCloudBookmarks;
- (NSNumber)payloadAllowCloudCalendar;
- (NSNumber)payloadAllowCloudDesktopAndDocuments;
- (NSNumber)payloadAllowCloudDocumentSync;
- (NSNumber)payloadAllowCloudKeychainSync;
- (NSNumber)payloadAllowCloudMail;
- (NSNumber)payloadAllowCloudNotes;
- (NSNumber)payloadAllowCloudPhotoLibrary;
- (NSNumber)payloadAllowCloudReminders;
- (NSNumber)payloadAllowFindMyFriendsModification;
- (NSNumber)payloadAllowPhotoStream;
- (NSNumber)payloadAllowSharedStream;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowCloudAddressBook:(id)a3;
- (void)setPayloadAllowCloudBackup:(id)a3;
- (void)setPayloadAllowCloudBookmarks:(id)a3;
- (void)setPayloadAllowCloudCalendar:(id)a3;
- (void)setPayloadAllowCloudDesktopAndDocuments:(id)a3;
- (void)setPayloadAllowCloudDocumentSync:(id)a3;
- (void)setPayloadAllowCloudKeychainSync:(id)a3;
- (void)setPayloadAllowCloudMail:(id)a3;
- (void)setPayloadAllowCloudNotes:(id)a3;
- (void)setPayloadAllowCloudPhotoLibrary:(id)a3;
- (void)setPayloadAllowCloudReminders:(id)a3;
- (void)setPayloadAllowFindMyFriendsModification:(id)a3;
- (void)setPayloadAllowPhotoStream:(id)a3;
- (void)setPayloadAllowSharedStream:(id)a3;
@end

@implementation CEMSystemiCloudDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.icloud";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowCloudBackup";
  v6[1] = @"allowCloudDocumentSync";
  v6[2] = @"allowFindMyFriendsModification";
  v6[3] = @"allowPhotoStream";
  v6[4] = @"allowSharedStream";
  v6[5] = @"allowCloudPhotoLibrary";
  v6[6] = @"allowCloudBookmarks";
  v6[7] = @"allowCloudMail";
  v6[8] = @"allowCloudCalendar";
  v6[9] = @"allowCloudReminders";
  v6[10] = @"allowCloudAddressBook";
  v6[11] = @"allowCloudNotes";
  v6[12] = @"allowCloudDesktopAndDocuments";
  v6[13] = @"allowCloudKeychainSync";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowCloudBackup";
  v6[1] = @"allowCloudDocumentSync";
  v6[2] = @"allowFindMyFriendsModification";
  v6[3] = @"allowPhotoStream";
  v6[4] = @"allowSharedStream";
  v6[5] = @"allowCloudPhotoLibrary";
  v6[6] = @"allowCloudBookmarks";
  v6[7] = @"allowCloudMail";
  v6[8] = @"allowCloudCalendar";
  v6[9] = @"allowCloudReminders";
  v6[10] = @"allowCloudAddressBook";
  v6[11] = @"allowCloudNotes";
  v6[12] = @"allowCloudDesktopAndDocuments";
  v6[13] = @"allowCloudKeychainSync";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowCloudBackup:(id)a4 withAllowCloudDocumentSync:(id)a5 withAllowFindMyFriendsModification:(id)a6 withAllowPhotoStream:(id)a7 withAllowSharedStream:(id)a8 withAllowCloudPhotoLibrary:(id)a9 withAllowCloudBookmarks:(id)a10 withAllowCloudMail:(id)a11 withAllowCloudCalendar:(id)a12 withAllowCloudReminders:(id)a13 withAllowCloudAddressBook:(id)a14 withAllowCloudNotes:(id)a15 withAllowCloudDesktopAndDocuments:(id)a16 withAllowCloudKeychainSync:(id)a17
{
  id v17 = a3;
  id v55 = a17;
  id v54 = a16;
  id v53 = a15;
  id v52 = a14;
  id v18 = a13;
  id v51 = a12;
  id v50 = a11;
  id v49 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.system.icloud"];
  if (v17)
  {
    [v25 setDeclarationIdentifier:v17];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    id v17 = 0;
  }
  v28 = (void *)MEMORY[0x263EFFA88];
  if (v24) {
    id v29 = v24;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA88];
  }
  objc_msgSend(v25, "setPayloadAllowCloudBackup:", v29, a8);

  if (v23) {
    id v30 = v23;
  }
  else {
    id v30 = v28;
  }
  [v25 setPayloadAllowCloudDocumentSync:v30];

  if (v22) {
    id v31 = v22;
  }
  else {
    id v31 = v28;
  }
  [v25 setPayloadAllowFindMyFriendsModification:v31];

  if (v21) {
    id v32 = v21;
  }
  else {
    id v32 = v28;
  }
  [v25 setPayloadAllowPhotoStream:v32];

  if (v20) {
    id v33 = v20;
  }
  else {
    id v33 = v28;
  }
  [v25 setPayloadAllowSharedStream:v33];

  if (v19) {
    id v34 = v19;
  }
  else {
    id v34 = v28;
  }
  [v25 setPayloadAllowCloudPhotoLibrary:v34];

  if (v49) {
    id v35 = v49;
  }
  else {
    id v35 = v28;
  }
  [v25 setPayloadAllowCloudBookmarks:v35];

  if (v50) {
    id v36 = v50;
  }
  else {
    id v36 = v28;
  }
  [v25 setPayloadAllowCloudMail:v36];

  if (v51) {
    id v37 = v51;
  }
  else {
    id v37 = v28;
  }
  [v25 setPayloadAllowCloudCalendar:v37];

  if (v18) {
    id v38 = v18;
  }
  else {
    id v38 = v28;
  }
  [v25 setPayloadAllowCloudReminders:v38];

  if (v52) {
    id v39 = v52;
  }
  else {
    id v39 = v28;
  }
  [v25 setPayloadAllowCloudAddressBook:v39];

  if (v53) {
    id v40 = v53;
  }
  else {
    id v40 = v28;
  }
  [v25 setPayloadAllowCloudNotes:v40];

  if (v54) {
    id v41 = v54;
  }
  else {
    id v41 = v28;
  }
  [v25 setPayloadAllowCloudDesktopAndDocuments:v41];

  if (v55) {
    id v42 = v55;
  }
  else {
    id v42 = v28;
  }
  [v25 setPayloadAllowCloudKeychainSync:v42];

  [v25 updateServerHash];

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.icloud"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemiCloudDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v56 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudBackup" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v56];
  id v14 = v56;
  payloadAllowCloudBackup = self->_payloadAllowCloudBackup;
  self->_payloadAllowCloudBackup = v13;

  if (!v14)
  {
    id v55 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudDocumentSync" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v55];
    id v14 = v55;
    payloadAllowCloudDocumentSync = self->_payloadAllowCloudDocumentSync;
    self->_payloadAllowCloudDocumentSync = v16;

    if (!v14)
    {
      id v54 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowFindMyFriendsModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v54];
      id v14 = v54;
      payloadAllowFindMyFriendsModification = self->_payloadAllowFindMyFriendsModification;
      self->_payloadAllowFindMyFriendsModification = v18;

      if (!v14)
      {
        id v53 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowPhotoStream" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v53];
        id v14 = v53;
        payloadAllowPhotoStream = self->_payloadAllowPhotoStream;
        self->_payloadAllowPhotoStream = v20;

        if (!v14)
        {
          id v52 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSharedStream" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v52];
          id v14 = v52;
          payloadAllowSharedStream = self->_payloadAllowSharedStream;
          self->_payloadAllowSharedStream = v22;

          if (!v14)
          {
            id v51 = 0;
            id v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudPhotoLibrary" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v51];
            id v14 = v51;
            payloadAllowCloudPhotoLibrary = self->_payloadAllowCloudPhotoLibrary;
            self->_payloadAllowCloudPhotoLibrary = v24;

            if (!v14)
            {
              id v50 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudBookmarks" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v50];
              id v14 = v50;
              payloadAllowCloudBookmarks = self->_payloadAllowCloudBookmarks;
              self->_payloadAllowCloudBookmarks = v26;

              if (!v14)
              {
                id v49 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudMail" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v49];
                id v14 = v49;
                payloadAllowCloudMail = self->_payloadAllowCloudMail;
                self->_payloadAllowCloudMail = v28;

                if (!v14)
                {
                  id v48 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudCalendar" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v48];
                  id v14 = v48;
                  payloadAllowCloudCalendar = self->_payloadAllowCloudCalendar;
                  self->_payloadAllowCloudCalendar = v30;

                  if (!v14)
                  {
                    id v47 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudReminders" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v47];
                    id v14 = v47;
                    payloadAllowCloudReminders = self->_payloadAllowCloudReminders;
                    self->_payloadAllowCloudReminders = v32;

                    if (!v14)
                    {
                      id v46 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudAddressBook" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v46];
                      id v14 = v46;
                      payloadAllowCloudAddressBook = self->_payloadAllowCloudAddressBook;
                      self->_payloadAllowCloudAddressBook = v34;

                      if (!v14)
                      {
                        id v45 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudNotes" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v45];
                        id v14 = v45;
                        payloadAllowCloudNotes = self->_payloadAllowCloudNotes;
                        self->_payloadAllowCloudNotes = v36;

                        if (!v14)
                        {
                          id v44 = 0;
                          id v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudDesktopAndDocuments" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v44];
                          id v14 = v44;
                          payloadAllowCloudDesktopAndDocuments = self->_payloadAllowCloudDesktopAndDocuments;
                          self->_payloadAllowCloudDesktopAndDocuments = v38;

                          if (!v14)
                          {
                            id v43 = 0;
                            id v40 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCloudKeychainSync" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v43];
                            id v14 = v43;
                            payloadAllowCloudKeychainSync = self->_payloadAllowCloudKeychainSync;
                            self->_payloadAllowCloudKeychainSync = v40;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudBackup" withValue:self->_payloadAllowCloudBackup isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudDocumentSync" withValue:self->_payloadAllowCloudDocumentSync isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowFindMyFriendsModification" withValue:self->_payloadAllowFindMyFriendsModification isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowPhotoStream" withValue:self->_payloadAllowPhotoStream isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSharedStream" withValue:self->_payloadAllowSharedStream isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudPhotoLibrary" withValue:self->_payloadAllowCloudPhotoLibrary isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudBookmarks" withValue:self->_payloadAllowCloudBookmarks isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudMail" withValue:self->_payloadAllowCloudMail isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudCalendar" withValue:self->_payloadAllowCloudCalendar isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudReminders" withValue:self->_payloadAllowCloudReminders isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudAddressBook" withValue:self->_payloadAllowCloudAddressBook isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudNotes" withValue:self->_payloadAllowCloudNotes isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudDesktopAndDocuments" withValue:self->_payloadAllowCloudDesktopAndDocuments isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCloudKeychainSync" withValue:self->_payloadAllowCloudKeychainSync isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CEMSystemiCloudDeclaration;
  v4 = [(CEMDeclarationBase *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowCloudBackup copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowCloudDocumentSync copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowFindMyFriendsModification copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowPhotoStream copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowSharedStream copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowCloudPhotoLibrary copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowCloudBookmarks copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowCloudMail copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowCloudCalendar copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadAllowCloudReminders copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadAllowCloudAddressBook copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadAllowCloudNotes copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadAllowCloudDesktopAndDocuments copy];
  id v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadAllowCloudKeychainSync copy];
  id v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (NSNumber)payloadAllowCloudBackup
{
  return self->_payloadAllowCloudBackup;
}

- (void)setPayloadAllowCloudBackup:(id)a3
{
}

- (NSNumber)payloadAllowCloudDocumentSync
{
  return self->_payloadAllowCloudDocumentSync;
}

- (void)setPayloadAllowCloudDocumentSync:(id)a3
{
}

- (NSNumber)payloadAllowFindMyFriendsModification
{
  return self->_payloadAllowFindMyFriendsModification;
}

- (void)setPayloadAllowFindMyFriendsModification:(id)a3
{
}

- (NSNumber)payloadAllowPhotoStream
{
  return self->_payloadAllowPhotoStream;
}

- (void)setPayloadAllowPhotoStream:(id)a3
{
}

- (NSNumber)payloadAllowSharedStream
{
  return self->_payloadAllowSharedStream;
}

- (void)setPayloadAllowSharedStream:(id)a3
{
}

- (NSNumber)payloadAllowCloudPhotoLibrary
{
  return self->_payloadAllowCloudPhotoLibrary;
}

- (void)setPayloadAllowCloudPhotoLibrary:(id)a3
{
}

- (NSNumber)payloadAllowCloudBookmarks
{
  return self->_payloadAllowCloudBookmarks;
}

- (void)setPayloadAllowCloudBookmarks:(id)a3
{
}

- (NSNumber)payloadAllowCloudMail
{
  return self->_payloadAllowCloudMail;
}

- (void)setPayloadAllowCloudMail:(id)a3
{
}

- (NSNumber)payloadAllowCloudCalendar
{
  return self->_payloadAllowCloudCalendar;
}

- (void)setPayloadAllowCloudCalendar:(id)a3
{
}

- (NSNumber)payloadAllowCloudReminders
{
  return self->_payloadAllowCloudReminders;
}

- (void)setPayloadAllowCloudReminders:(id)a3
{
}

- (NSNumber)payloadAllowCloudAddressBook
{
  return self->_payloadAllowCloudAddressBook;
}

- (void)setPayloadAllowCloudAddressBook:(id)a3
{
}

- (NSNumber)payloadAllowCloudNotes
{
  return self->_payloadAllowCloudNotes;
}

- (void)setPayloadAllowCloudNotes:(id)a3
{
}

- (NSNumber)payloadAllowCloudDesktopAndDocuments
{
  return self->_payloadAllowCloudDesktopAndDocuments;
}

- (void)setPayloadAllowCloudDesktopAndDocuments:(id)a3
{
}

- (NSNumber)payloadAllowCloudKeychainSync
{
  return self->_payloadAllowCloudKeychainSync;
}

- (void)setPayloadAllowCloudKeychainSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowCloudKeychainSync, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudDesktopAndDocuments, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudNotes, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudAddressBook, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudReminders, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudCalendar, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudMail, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudBookmarks, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_payloadAllowSharedStream, 0);
  objc_storeStrong((id *)&self->_payloadAllowPhotoStream, 0);
  objc_storeStrong((id *)&self->_payloadAllowFindMyFriendsModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudDocumentSync, 0);

  objc_storeStrong((id *)&self->_payloadAllowCloudBackup, 0);
}

@end