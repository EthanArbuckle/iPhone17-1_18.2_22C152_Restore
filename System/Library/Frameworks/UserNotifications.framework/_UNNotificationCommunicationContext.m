@interface _UNNotificationCommunicationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isAvatarImagePossible;
- (BOOL)isAvatarImagePossibleForBundleIdentifier:(id)a3;
- (BOOL)isBusinessCorrespondence;
- (BOOL)isDirect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isReplyToCurrentUser;
- (BOOL)isSystemImage;
- (BOOL)mentionsCurrentUser;
- (BOOL)notifyRecipientAnyway;
- (NSArray)allContacts;
- (NSArray)recipients;
- (NSString)associatedObjectUri;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)preferredDescription;
- (NSString)preferredRecipientsSummary;
- (NSString)preferredSenderSummary;
- (NSURL)contentURL;
- (_UNNotificationCommunicationContext)initWithCoder:(id)a3;
- (_UNNotificationContact)sender;
- (id)_initWithIdentifier:(id)a3 associatedObjectUri:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17;
- (id)_summaryFromContacts:(id)a3 effectiveCount:(unint64_t)a4 includeMe:(BOOL)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)capabilities;
- (unint64_t)_effectiveAllContactsCount;
- (unint64_t)_effectiveRecipientCount;
- (unint64_t)hash;
- (unint64_t)recipientCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UNNotificationCommunicationContext

- (BOOL)isGroup
{
  return [(_UNNotificationCommunicationContext *)self _effectiveAllContactsCount] > 1;
}

- (BOOL)isDirect
{
  return ![(_UNNotificationCommunicationContext *)self isGroup];
}

- (NSArray)allContacts
{
  if (self->_sender)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = [(_UNNotificationCommunicationContext *)self sender];
    [v3 addObject:v4];

    v5 = [(_UNNotificationCommunicationContext *)self recipients];
    [v3 addObjectsFromArray:v5];
  }
  else
  {
    id v3 = [(_UNNotificationCommunicationContext *)self recipients];
  }

  return (NSArray *)v3;
}

- (NSString)preferredSenderSummary
{
  sender = self->_sender;
  if (sender)
  {
    v4 = [(_UNNotificationContact *)sender preferredName];
  }
  else
  {
    v5 = [(_UNNotificationCommunicationContext *)self recipients];
    v4 = [(_UNNotificationCommunicationContext *)self _summaryFromContacts:v5 effectiveCount:[(_UNNotificationCommunicationContext *)self _effectiveRecipientCount] includeMe:0];
  }

  return (NSString *)v4;
}

- (NSString)preferredRecipientsSummary
{
  if (!self->_sender || ![(_UNNotificationCommunicationContext *)self isGroup])
  {
    v4 = 0;
    goto LABEL_18;
  }
  if (self->_replyToCurrentUser)
  {
    id v3 = @"COMMUNICATION_CONTEXT_CONTACT_REPLIED_TO_YOU";
  }
  else
  {
    if (!self->_mentionsCurrentUser) {
      goto LABEL_11;
    }
    id v3 = @"COMMUNICATION_CONTEXT_CONTACT_MENTIONED_YOU";
  }
  uint64_t v5 = UNLocalizedStringForKey(v3);
  if (v5)
  {
    id v6 = (id)v5;
    v7 = [(_UNNotificationCommunicationContext *)self preferredDescription];
    if (v7)
    {
      v8 = UNLocalizedFormatStringForKey(@"%@%@", @"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_WITH_ACTION_AND_GROUP_NAME");
      v4 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v6, v7);

LABEL_16:
      goto LABEL_17;
    }
    id v10 = v6;
LABEL_15:
    v4 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = [(_UNNotificationCommunicationContext *)self displayName];
  id v6 = v9;
  if (!v9)
  {
    v7 = [(_UNNotificationCommunicationContext *)self recipients];
    id v10 = [(_UNNotificationCommunicationContext *)self _summaryFromContacts:v7 effectiveCount:[(_UNNotificationCommunicationContext *)self _effectiveRecipientCount] includeMe:1];
    goto LABEL_15;
  }
  id v6 = v9;
  v4 = v6;
LABEL_17:

LABEL_18:

  return (NSString *)v4;
}

- (NSString)preferredDescription
{
  id v3 = [(_UNNotificationCommunicationContext *)self displayName];
  if ([v3 length])
  {
    id v4 = [(_UNNotificationCommunicationContext *)self displayName];
  }
  else
  {
    uint64_t v5 = [(_UNNotificationCommunicationContext *)self allContacts];
    id v6 = [(_UNNotificationCommunicationContext *)self _summaryFromContacts:v5 effectiveCount:[(_UNNotificationCommunicationContext *)self _effectiveAllContactsCount] includeMe:0];
    v7 = v6;
    if (v6)
    {
      id v4 = v6;
    }
    else
    {
      v8 = [(_UNNotificationCommunicationContext *)self allContacts];
      v9 = [v8 firstObject];
      id v4 = [v9 preferredName];
    }
  }

  return (NSString *)v4;
}

- (BOOL)isAvatarImagePossibleForBundleIdentifier:(id)a3
{
  BOOL result = objc_msgSend(a3, "un_isFirstPartyIdentifier")
        && ([(_UNNotificationCommunicationContext *)self allContacts],
            id v4 = objc_claimAutoreleasedReturnValue(),
            uint64_t v5 = [v4 count],
            v4,
            v5)
        || *(_OWORD *)&self->_contentURL != 0;
  return result;
}

- (id)_initWithIdentifier:(id)a3 associatedObjectUri:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 sender:(id)a7 recipients:(id)a8 contentURL:(id)a9 imageName:(id)a10 systemImage:(BOOL)a11 mentionsCurrentUser:(BOOL)a12 notifyRecipientAnyway:(BOOL)a13 replyToCurrentUser:(BOOL)a14 recipientCount:(unint64_t)a15 capabilities:(int64_t)a16 businessCorrespondence:(BOOL)a17
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
  v49.super_class = (Class)_UNNotificationCommunicationContext;
  v31 = [(_UNNotificationCommunicationContext *)&v49 init];
  if (v31)
  {
    uint64_t v32 = [v23 copy];
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    uint64_t v34 = [v24 copy];
    associatedObjectUri = v31->_associatedObjectUri;
    v31->_associatedObjectUri = (NSString *)v34;

    uint64_t v36 = [v25 copy];
    bundleIdentifier = v31->_bundleIdentifier;
    v31->_bundleIdentifier = (NSString *)v36;

    uint64_t v38 = [v26 copy];
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v38;

    uint64_t v40 = [v27 copy];
    sender = v31->_sender;
    v31->_sender = (_UNNotificationContact *)v40;

    uint64_t v42 = [v28 copy];
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v42;

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
      id v5 = 0;
LABEL_20:
      LOBYTE(v37) = 0;
      goto LABEL_21;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_20;
  }
  id v6 = [(_UNNotificationCommunicationContext *)self identifier];
  v7 = [v5 identifier];
  int v8 = UNEqualStrings(v6, v7);

  if (!v8) {
    goto LABEL_20;
  }
  v9 = [(_UNNotificationCommunicationContext *)self associatedObjectUri];
  id v10 = [v5 associatedObjectUri];
  int v11 = UNEqualStrings(v9, v10);

  if (!v11) {
    goto LABEL_20;
  }
  v12 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  v13 = [v5 bundleIdentifier];
  int v14 = UNEqualStrings(v12, v13);

  if (!v14) {
    goto LABEL_20;
  }
  v15 = [(_UNNotificationCommunicationContext *)self displayName];
  v16 = [v5 displayName];
  int v17 = UNEqualStrings(v15, v16);

  if (!v17) {
    goto LABEL_20;
  }
  v18 = [(_UNNotificationCommunicationContext *)self sender];
  v19 = [v5 sender];
  int v20 = UNEqualObjects(v18, v19);

  if (!v20) {
    goto LABEL_20;
  }
  v21 = [(_UNNotificationCommunicationContext *)self recipients];
  v22 = [v5 recipients];
  int v23 = UNEqualObjects(v21, v22);

  if (!v23) {
    goto LABEL_20;
  }
  id v24 = [(_UNNotificationCommunicationContext *)self contentURL];
  id v25 = [v5 contentURL];
  int v26 = UNEqualObjects(v24, v25);

  if (!v26) {
    goto LABEL_20;
  }
  id v27 = [(_UNNotificationCommunicationContext *)self imageName];
  id v28 = [v5 imageName];
  int v29 = UNEqualObjects(v27, v28);

  if (!v29) {
    goto LABEL_20;
  }
  int v30 = [(_UNNotificationCommunicationContext *)self isSystemImage];
  if (v30 != [v5 isSystemImage]) {
    goto LABEL_20;
  }
  int v31 = [(_UNNotificationCommunicationContext *)self mentionsCurrentUser];
  if (v31 != [v5 mentionsCurrentUser]) {
    goto LABEL_20;
  }
  int v32 = [(_UNNotificationCommunicationContext *)self notifyRecipientAnyway];
  if (v32 != [v5 notifyRecipientAnyway]) {
    goto LABEL_20;
  }
  int v33 = [(_UNNotificationCommunicationContext *)self isReplyToCurrentUser];
  if (v33 != [v5 isReplyToCurrentUser]) {
    goto LABEL_20;
  }
  unint64_t v34 = [(_UNNotificationCommunicationContext *)self recipientCount];
  if (v34 != [v5 recipientCount]) {
    goto LABEL_20;
  }
  int64_t v35 = [(_UNNotificationCommunicationContext *)self capabilities];
  if (v35 != [v5 capabilities]) {
    goto LABEL_20;
  }
  BOOL v36 = [(_UNNotificationCommunicationContext *)self isBusinessCorrespondence];
  int v37 = v36 ^ [v5 isBusinessCorrespondence] ^ 1;
LABEL_21:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_associatedObjectUri hash] + v3;
  NSUInteger v5 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v6 = v4 + v5 + [(NSString *)self->_displayName hash];
  unint64_t v7 = [(_UNNotificationContact *)self->_sender hash];
  unint64_t v8 = v7 + [(NSArray *)self->_recipients hash];
  NSUInteger v9 = v6 + v8 + [(NSURL *)self->_contentURL hash];
  return v9
       + [(NSString *)self->_imageName hash]
       + self->_systemImage
       + self->_mentionsCurrentUser
       + self->_notifyRecipientAnyway
       + self->_replyToCurrentUser
       + self->_recipientCount
       + self->_capabilities
       + self->_businessCorrespondence;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UNNotificationCommunicationContext *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v22 = +[_UNMutableNotificationCommunicationContext allocWithZone:a3];
  v21 = [(_UNNotificationCommunicationContext *)self identifier];
  int v20 = [(_UNNotificationCommunicationContext *)self associatedObjectUri];
  v19 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  v18 = [(_UNNotificationCommunicationContext *)self displayName];
  int v17 = [(_UNNotificationCommunicationContext *)self sender];
  NSUInteger v4 = [(_UNNotificationCommunicationContext *)self recipients];
  NSUInteger v5 = [(_UNNotificationCommunicationContext *)self contentURL];
  NSUInteger v6 = [(_UNNotificationCommunicationContext *)self imageName];
  BOOL v7 = [(_UNNotificationCommunicationContext *)self isSystemImage];
  BOOL v8 = [(_UNNotificationCommunicationContext *)self mentionsCurrentUser];
  BOOL v9 = [(_UNNotificationCommunicationContext *)self notifyRecipientAnyway];
  BOOL v10 = [(_UNNotificationCommunicationContext *)self isReplyToCurrentUser];
  unint64_t v11 = [(_UNNotificationCommunicationContext *)self recipientCount];
  int64_t v12 = [(_UNNotificationCommunicationContext *)self capabilities];
  LOBYTE(v16) = [(_UNNotificationCommunicationContext *)self isBusinessCorrespondence];
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  id v13 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  NSUInteger v4 = [(_UNNotificationCommunicationContext *)self identifier];
  [v12 encodeObject:v4 forKey:@"identifier"];

  NSUInteger v5 = [(_UNNotificationCommunicationContext *)self associatedObjectUri];
  [v12 encodeObject:v5 forKey:@"associatedObjectUri"];

  NSUInteger v6 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  [v12 encodeObject:v6 forKey:@"bundleIdentifier"];

  BOOL v7 = [(_UNNotificationCommunicationContext *)self displayName];
  [v12 encodeObject:v7 forKey:@"displayName"];

  BOOL v8 = [(_UNNotificationCommunicationContext *)self recipients];
  [v12 encodeObject:v8 forKey:@"recipients"];

  BOOL v9 = [(_UNNotificationCommunicationContext *)self sender];
  [v12 encodeObject:v9 forKey:@"sender"];

  BOOL v10 = [(_UNNotificationCommunicationContext *)self contentURL];
  [v12 encodeObject:v10 forKey:@"contentURL"];

  unint64_t v11 = [(_UNNotificationCommunicationContext *)self imageName];
  [v12 encodeObject:v11 forKey:@"imageName"];

  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage"), @"systemImage");
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser"), @"mentionsCurrentUser");
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway"), @"notifyRecipientAnyway");
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser"), @"replyToCurrentUser");
  objc_msgSend(v12, "encodeInteger:forKey:", -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount"), @"recipientCount");
  objc_msgSend(v12, "encodeInteger:forKey:", -[_UNNotificationCommunicationContext capabilities](self, "capabilities"), @"capabilities");
  objc_msgSend(v12, "encodeBool:forKey:", -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence"), @"businessCorrespondence");
}

- (_UNNotificationCommunicationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  int v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"associatedObjectUri"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  int v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  NSUInteger v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  NSUInteger v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v19 = [v3 decodeObjectOfClasses:v6 forKey:@"recipients"];

  BOOL v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
  BOOL v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
  char v9 = [v3 decodeBoolForKey:@"systemImage"];
  char v10 = [v3 decodeBoolForKey:@"mentionsCurrentUser"];
  char v11 = [v3 decodeBoolForKey:@"notifyRecipientAnyway"];
  char v12 = [v3 decodeBoolForKey:@"replyToCurrentUser"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"recipientCount"];
  uint64_t v14 = [v3 decodeIntegerForKey:@"capabilities"];
  LOBYTE(v4) = [v3 decodeBoolForKey:@"businessCorrespondence"];

  LOBYTE(v18) = (_BYTE)v4;
  BYTE3(v17) = v12;
  BYTE2(v17) = v11;
  BYTE1(v17) = v10;
  LOBYTE(v17) = v9;
  uint64_t v15 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](self, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v24, v23, v22, v21, v20, v19, v7, v8, v17, v13, v14, v18);

  return v15;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_UNNotificationCommunicationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  NSUInteger v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77___UNNotificationCommunicationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E5F06128;
  id v7 = v6;
  id v11 = v7;
  char v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

- (id)succinctDescription
{
  v2 = [(_UNNotificationCommunicationContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  NSUInteger v4 = [(_UNNotificationCommunicationContext *)self identifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  id v6 = (id)[v3 appendObject:v5 withName:@"identifier"];

  id v7 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  id v8 = (id)[v3 appendObject:v7 withName:@"bundleIdentifier"];

  char v9 = [(_UNNotificationCommunicationContext *)self displayName];
  char v10 = objc_msgSend(v9, "un_logDigest");
  id v11 = (id)[v3 appendObject:v10 withName:@"displayName"];

  char v12 = [(_UNNotificationCommunicationContext *)self recipients];
  id v13 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v12, "count"), @"recipientsArrayCount");

  uint64_t v14 = [(_UNNotificationCommunicationContext *)self sender];
  id v15 = (id)[v3 appendBool:v14 != 0 withName:@"hasSender"];

  uint64_t v16 = [(_UNNotificationCommunicationContext *)self contentURL];
  id v17 = (id)[v3 appendObject:v16 withName:@"contentURL"];

  uint64_t v18 = [(_UNNotificationCommunicationContext *)self imageName];
  id v19 = (id)[v3 appendObject:v18 withName:@"imageName"];

  id v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage"), @"isSystemImage");
  id v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser"), @"mentionsCurrentUser");
  id v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway"), @"notifyRecipientAnyway");
  id v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser"), @"isReplyToCurrentUser");
  id v24 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount"), @"recipientCount");
  int64_t v25 = [(_UNNotificationCommunicationContext *)self capabilities];
  int v26 = &stru_1F062A810;
  if (!v25) {
    int v26 = @"Unspecified";
  }
  if (v25) {
    id v27 = @"Video";
  }
  else {
    id v27 = v26;
  }
  [v3 appendString:v27 withName:@"capabilities"];
  id v28 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence"), @"isBusinessCorrespondence");

  return v3;
}

- (unint64_t)_effectiveAllContactsCount
{
  unint64_t v3 = [(_UNNotificationCommunicationContext *)self _effectiveRecipientCount];
  NSUInteger v4 = [(_UNNotificationCommunicationContext *)self sender];
  if (v4) {
    unint64_t v5 = v3 + 1;
  }
  else {
    unint64_t v5 = v3;
  }

  return v5;
}

- (unint64_t)_effectiveRecipientCount
{
  unint64_t v3 = [(_UNNotificationCommunicationContext *)self recipientCount];
  NSUInteger v4 = [(_UNNotificationCommunicationContext *)self recipients];
  unint64_t v5 = [v4 count];

  if (v3 <= v5) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)_summaryFromContacts:(id)a3 effectiveCount:(unint64_t)a4 includeMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = a4 + v5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    id v11 = UNLocalizedStringForKey(@"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_TO_YOU");
    [v9 addObject:v11];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  if (v8 > 3) {
    unint64_t v12 = 2;
  }
  else {
    unint64_t v12 = 3;
  }
  long long v40 = 0uLL;
  long long v41 = 0uLL;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
LABEL_8:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v41 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
      if ([v9 count] >= v12) {
        break;
      }
      id v19 = [v18 preferredName];
      if (v19)
      {
        if ([v18 isPreferredNameReal]) {
          id v20 = v9;
        }
        else {
          id v20 = v10;
        }
        [v20 addObject:v19];
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v15) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  unint64_t v21 = v12 - [v9 count];
  unint64_t v22 = [v10 count];
  if (v22 >= v21) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23)
  {
    for (unint64_t i = 0; i < v27; ++i)
    {
      int64_t v25 = [v10 objectAtIndex:i];
      [v9 addObject:v25];

      unint64_t v26 = [v10 count];
      if (v26 >= v21) {
        unint64_t v27 = v21;
      }
      else {
        unint64_t v27 = v26;
      }
    }
  }
  uint64_t v28 = [v9 count];
  unint64_t v29 = v8 - v28;
  if (v8 != v28)
  {
    if (v29 >> 4 < 0x271)
    {
      int v31 = UNLocalizedFormatStringForKey(@"%lu", @"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_OTHERS_FORMAT");
      int v30 = objc_msgSend(NSString, "localizedStringWithFormat:", v31, v29, 0);
    }
    else
    {
      int v30 = UNLocalizedStringForKey(@"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_MANY_OTHERS");
    }
    [v9 addObject:v30];
  }
  if ([v9 count] == 1)
  {
    int v32 = [v9 objectAtIndex:0];
    goto LABEL_41;
  }
  if ([v9 count] == 2)
  {
    int v33 = UNLocalizedFormatStringForKey(@"%@%@", @"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_TWO_NAMES_FORMAT");
    unint64_t v34 = NSString;
    int64_t v35 = [v9 objectAtIndex:0];
    BOOL v36 = [v9 objectAtIndex:1];
    int v32 = objc_msgSend(v34, "localizedStringWithFormat:", v33, v35, v36, 0);
LABEL_39:

    goto LABEL_41;
  }
  if ([v9 count] == 3)
  {
    int v33 = UNLocalizedFormatStringForKey(@"%@%@%@", @"COMMUNICATION_CONTEXT_CONTACT_SUMMARY_THREE_NAMES_FORMAT");
    int v37 = NSString;
    int64_t v35 = [v9 objectAtIndex:0];
    BOOL v36 = [v9 objectAtIndex:1];
    uint64_t v38 = [v9 objectAtIndex:2];
    int v32 = objc_msgSend(v37, "localizedStringWithFormat:", v33, v35, v36, v38, 0, (void)v40);

    goto LABEL_39;
  }
  int v32 = 0;
LABEL_41:

  return v32;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)associatedObjectUri
{
  return self->_associatedObjectUri;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_UNNotificationContact)sender
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

- (BOOL)isSystemImage
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
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedObjectUri, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isAvatarImagePossible
{
  v2 = self;
  unint64_t v3 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  LOBYTE(v2) = [(_UNNotificationCommunicationContext *)v2 isAvatarImagePossibleForBundleIdentifier:v3];

  return (char)v2;
}

@end