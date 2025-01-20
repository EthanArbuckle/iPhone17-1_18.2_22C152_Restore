@interface BBCommunicationContext
+ (BOOL)supportsSecureCoding;
+ (id)communicationContextWithIdentifier:(id)a3 associatedObjectUri:(id)a4 displayName:(id)a5 sender:(id)a6 recipients:(id)a7 contentURL:(id)a8 imageName:(id)a9 systemImage:(BOOL)a10 mentionsCurrentUser:(BOOL)a11 notifyRecipientAnyway:(BOOL)a12 replyToCurrentUser:(BOOL)a13 recipientCount:(unint64_t)a14;
+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9;
+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15;
+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 mentionsCurrentUser:(BOOL)a10 notifyRecipientAnyway:(BOOL)a11 replyToCurrentUser:(BOOL)a12 recipientCount:(unint64_t)a13;
- (BBCommunicationContext)initWithCoder:(id)a3;
- (BBContact)sender;
- (BOOL)isBusinessCorrespondence;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplyToCurrentUser;
- (BOOL)mentionsCurrentUser;
- (BOOL)notifyRecipientAnyway;
- (BOOL)systemImage;
- (NSArray)recipients;
- (NSString)associatedObjectUri;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)imageName;
- (NSURL)contentURL;
- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)capabilities;
- (unint64_t)hash;
- (unint64_t)recipientCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBCommunicationContext

+ (id)communicationContextWithIdentifier:(id)a3 associatedObjectUri:(id)a4 displayName:(id)a5 sender:(id)a6 recipients:(id)a7 contentURL:(id)a8 imageName:(id)a9 systemImage:(BOOL)a10 mentionsCurrentUser:(BOOL)a11 notifyRecipientAnyway:(BOOL)a12 replyToCurrentUser:(BOOL)a13 recipientCount:(unint64_t)a14
{
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  LOBYTE(v30) = 0;
  WORD1(v29) = __PAIR16__(a13, a12);
  LOWORD(v29) = __PAIR16__(a11, a10);
  v27 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v26, 0, v25, v24, v23, v22, v21, v20, v29, a14, 0, v30);

  return v27;
}

- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a7;
  id v28 = a8;
  id v29 = a9;
  id v30 = a10;
  v49.receiver = self;
  v49.super_class = (Class)BBCommunicationContext;
  v31 = [(BBCommunicationContext *)&v49 init];
  if (v31)
  {
    uint64_t v32 = [v23 copy];
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    uint64_t v34 = [v24 copy];
    bundleIdentifier = v31->_bundleIdentifier;
    v31->_bundleIdentifier = (NSString *)v34;

    uint64_t v36 = [v25 copy];
    associatedObjectUri = v31->_associatedObjectUri;
    v31->_associatedObjectUri = (NSString *)v36;

    uint64_t v38 = [v26 copy];
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v38;

    uint64_t v40 = [v28 copy];
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v40;

    uint64_t v42 = [v27 copy];
    sender = v31->_sender;
    v31->_sender = (BBContact *)v42;

    uint64_t v44 = [v29 copy];
    contentURL = v31->_contentURL;
    v31->_contentURL = (NSURL *)v44;

    uint64_t v46 = [v30 copy];
    imageName = v31->_imageName;
    v31->_imageName = (NSString *)v46;

    v31->_systemImage = a11;
    v31->_mentionsCurrentUser = a12;
    v31->_notifyRecipientAnyway = a13;
    v31->_replyToCurrentUser = a14;
    v31->_recipientCount = a15;
    v31->_capabilities = a16;
    v31->_businessCorrespondence = a17;
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
LABEL_20:
      BOOL v30 = 0;
      goto LABEL_21;
    }
  }
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    goto LABEL_20;
  }
  v7 = [v5 identifier];
  int v8 = BSEqualStrings();

  if (!v8) {
    goto LABEL_20;
  }
  v9 = [v6 bundleIdentifier];
  int v10 = BSEqualStrings();

  if (!v10) {
    goto LABEL_20;
  }
  v11 = [v6 associatedObjectUri];
  int v12 = BSEqualStrings();

  if (!v12) {
    goto LABEL_20;
  }
  v13 = [v6 displayName];
  int v14 = BSEqualStrings();

  if (!v14) {
    goto LABEL_20;
  }
  v15 = [v6 sender];
  int v16 = BSEqualObjects();

  if (!v16) {
    goto LABEL_20;
  }
  v17 = [v6 recipients];
  int v18 = BSEqualArrays();

  if (!v18) {
    goto LABEL_20;
  }
  v19 = [v6 contentURL];
  int v20 = BSEqualObjects();

  if (!v20) {
    goto LABEL_20;
  }
  id v21 = [v6 imageName];
  int v22 = BSEqualStrings();

  if (!v22) {
    goto LABEL_20;
  }
  int systemImage = self->_systemImage;
  if (systemImage != [v6 systemImage]) {
    goto LABEL_20;
  }
  int mentionsCurrentUser = self->_mentionsCurrentUser;
  if (mentionsCurrentUser != [v6 mentionsCurrentUser]) {
    goto LABEL_20;
  }
  int notifyRecipientAnyway = self->_notifyRecipientAnyway;
  if (notifyRecipientAnyway != [v6 notifyRecipientAnyway]) {
    goto LABEL_20;
  }
  int replyToCurrentUser = self->_replyToCurrentUser;
  if (replyToCurrentUser != [v6 isReplyToCurrentUser]) {
    goto LABEL_20;
  }
  unint64_t recipientCount = self->_recipientCount;
  if (recipientCount != [v6 recipientCount]) {
    goto LABEL_20;
  }
  int64_t capabilities = self->_capabilities;
  if (capabilities != [v6 capabilities]) {
    goto LABEL_20;
  }
  int businessCorrespondence = self->_businessCorrespondence;
  BOOL v30 = businessCorrespondence == [v6 isBusinessCorrespondence];
LABEL_21:

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_associatedObjectUri hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_displayName hash];
  uint64_t v7 = [(NSArray *)self->_recipients hash];
  unint64_t v8 = v7 ^ [(BBContact *)self->_sender hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSURL *)self->_contentURL hash];
  return v9 ^ [(NSString *)self->_imageName hash] ^ self->_systemImage ^ self->_mentionsCurrentUser ^ self->_notifyRecipientAnyway ^ self->_replyToCurrentUser ^ self->_recipientCount ^ self->_capabilities ^ self->_businessCorrespondence;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier: %@, bundleIdentifier: %@, associatedObjectUri: %@, displayName: %@, sender: %@, recipients: %@, contentURL: %@, imageName: %@, systemImage: %d, mentionsCurrentUser: %d, notifyRecipientAnyway: %d, replyToCurrentUser: %d, recipientCount: %lu>, capabilities: %lu, businessCorrespondence: %d",
               objc_opt_class(),
               self,
               self->_identifier,
               self->_bundleIdentifier,
               self->_associatedObjectUri,
               self->_displayName,
               self->_sender,
               self->_recipients,
               self->_contentURL,
               self->_imageName,
               self->_systemImage,
               self->_mentionsCurrentUser,
               self->_notifyRecipientAnyway,
               self->_replyToCurrentUser,
               self->_recipientCount,
               self->_capabilities,
               self->_businessCorrespondence);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v22 = +[BBMutableCommunicationContext allocWithZone:a3];
  id v21 = [(BBCommunicationContext *)self identifier];
  int v20 = [(BBCommunicationContext *)self bundleIdentifier];
  v19 = [(BBCommunicationContext *)self associatedObjectUri];
  int v18 = [(BBCommunicationContext *)self displayName];
  v17 = [(BBCommunicationContext *)self sender];
  NSUInteger v4 = [(BBCommunicationContext *)self recipients];
  NSUInteger v5 = [(BBCommunicationContext *)self contentURL];
  NSUInteger v6 = [(BBCommunicationContext *)self imageName];
  BOOL v7 = [(BBCommunicationContext *)self systemImage];
  BOOL v8 = [(BBCommunicationContext *)self mentionsCurrentUser];
  BOOL v9 = [(BBCommunicationContext *)self notifyRecipientAnyway];
  BOOL v10 = [(BBCommunicationContext *)self isReplyToCurrentUser];
  unint64_t v11 = [(BBCommunicationContext *)self recipientCount];
  int64_t v12 = [(BBCommunicationContext *)self capabilities];
  LOBYTE(v16) = [(BBCommunicationContext *)self isBusinessCorrespondence];
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  id v13 = -[BBCommunicationContext _initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_associatedObjectUri forKey:@"associatedObjectUri"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_sender forKey:@"sender"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_contentURL forKey:@"contentURL"];
  [v5 encodeObject:self->_imageName forKey:@"imageName"];
  [v5 encodeBool:self->_systemImage forKey:@"systemImage"];
  [v5 encodeBool:self->_mentionsCurrentUser forKey:@"mentionsCurrentUser"];
  [v5 encodeBool:self->_notifyRecipientAnyway forKey:@"notifyRecipientAnyway"];
  [v5 encodeBool:self->_replyToCurrentUser forKey:@"replyToCurrentUser"];
  [v5 encodeInteger:self->_recipientCount forKey:@"recipientCount"];
  [v5 encodeInteger:self->_capabilities forKey:@"capabilities"];
  [v5 encodeBool:self->_businessCorrespondence forKey:@"businessCorrespondence"];
}

- (BBCommunicationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  int v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"associatedObjectUri"];
  int v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  NSUInteger v4 = BBAllowedClasses();
  int v18 = [v3 decodeObjectOfClasses:v4 forKey:@"recipients"];

  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
  NSUInteger v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
  char v7 = [v3 decodeBoolForKey:@"systemImage"];
  char v8 = [v3 decodeBoolForKey:@"mentionsCurrentUser"];
  char v9 = [v3 decodeBoolForKey:@"notifyRecipientAnyway"];
  char v10 = [v3 decodeBoolForKey:@"replyToCurrentUser"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"recipientCount"];
  uint64_t v12 = [v3 decodeIntegerForKey:@"capabilities"];
  char v13 = [v3 decodeBoolForKey:@"businessCorrespondence"];

  LOBYTE(v17) = v13;
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  int v14 = -[BBCommunicationContext _initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](self, "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v23, v22, v21, v20, v19, v18, v5, v6, v16, v11, v12, v17);

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)associatedObjectUri
{
  return self->_associatedObjectUri;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BBContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)systemImage
{
  return self->_systemImage;
}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (BOOL)isReplyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (unint64_t)recipientCount
{
  return self->_recipientCount;
}

- (int64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)isBusinessCorrespondence
{
  return self->_businessCorrespondence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_associatedObjectUri, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v25) = 0;
  LODWORD(v24) = 0;
  int v22 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v16, v15, 0, v24, 0, 0, v25);

  return v22;
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 mentionsCurrentUser:(BOOL)a10 notifyRecipientAnyway:(BOOL)a11 replyToCurrentUser:(BOOL)a12 recipientCount:(unint64_t)a13
{
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  LOBYTE(v29) = 0;
  WORD1(v28) = __PAIR16__(a12, a11);
  BYTE1(v28) = a10;
  LOBYTE(v28) = 0;
  id v26 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v25, v24, v23, v22, v21, v20, v19, 0, v28, a13, 0, v29);

  return v26;
}

+ (id)communicationContextWithIdentifier:(id)a3 bundleIdentifier:(id)a4 associatedObjectUri:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15
{
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  id v28 = a3;
  LOBYTE(v32) = 0;
  WORD1(v31) = __PAIR16__(a14, a13);
  LOWORD(v31) = __PAIR16__(a12, a11);
  uint64_t v29 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v28, v27, v26, v25, v24, v23, v22, v21, v31, a15, 0, v32);

  return v29;
}

@end