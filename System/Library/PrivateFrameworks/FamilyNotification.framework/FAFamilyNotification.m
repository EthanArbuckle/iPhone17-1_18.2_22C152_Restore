@interface FAFamilyNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)hasActionButton;
- (BOOL)shouldPersistWhenActivated;
- (BOOL)shouldPersistWhenDismissed;
- (FAFamilyNotification)init;
- (FAFamilyNotification)initWithCacheDictionaryRepresentation:(id)a3;
- (FAFamilyNotification)initWithCoder:(id)a3;
- (NSData)launchActionArguments;
- (NSDate)expiryDate;
- (NSDate)relevanceDate;
- (NSDictionary)userInfo;
- (NSNumber)familyMemberDSID;
- (NSString)actionButtonLabel;
- (NSString)clientIdentifier;
- (NSString)delegateMachServiceName;
- (NSString)identifier;
- (NSString)informativeText;
- (NSString)otherButtonLabel;
- (NSString)title;
- (NSString)unlockActionLabel;
- (NSString)uuid;
- (NSURL)activateActionURL;
- (NSURL)dismissActionlURL;
- (NSURL)launchActionURL;
- (id)cacheDictionaryRepresentation;
- (id)description;
- (unint64_t)displayStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setActionButtonLabel:(id)a3;
- (void)setActivateActionURL:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegateMachServiceName:(id)a3;
- (void)setDismissActionlURL:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setExpiryDate:(id)a3;
- (void)setFamilyMemberDSID:(id)a3;
- (void)setHasActionButton:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setLaunchActionArguments:(id)a3;
- (void)setLaunchActionURL:(id)a3;
- (void)setOtherButtonLabel:(id)a3;
- (void)setRelevanceDate:(id)a3;
- (void)setShouldPersistWhenActivated:(BOOL)a3;
- (void)setShouldPersistWhenDismissed:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUnlockActionLabel:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation FAFamilyNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FAFamilyNotification)init
{
  v8.receiver = self;
  v8.super_class = (Class)FAFamilyNotification;
  v2 = [(FAFamilyNotification *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasActionButton = 1;
    uint64_t v4 = [MEMORY[0x263EFF910] date];
    relevanceDate = v3->_relevanceDate;
    v3->_relevanceDate = (NSDate *)v4;

    v3->_displayStyle = 0;
    v6 = v3;
  }

  return v3;
}

- (FAFamilyNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FAFamilyNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relevanceDate"];
    relevanceDate = v5->_relevanceDate;
    v5->_relevanceDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyMemberDSID"];
    familyMemberDSID = v5->_familyMemberDSID;
    v5->_familyMemberDSID = (NSNumber *)v16;

    v5->_displayStyle = [v4 decodeIntegerForKey:@"_displayStyle"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activateActionURL"];
    activateActionURL = v5->_activateActionURL;
    v5->_activateActionURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dismissActionlURL"];
    dismissActionlURL = v5->_dismissActionlURL;
    v5->_dismissActionlURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_launchActionURL"];
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_launchActionArguments"];
    launchActionArguments = v5->_launchActionArguments;
    v5->_launchActionArguments = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_actionButtonLabel"];
    actionButtonLabel = v5->_actionButtonLabel;
    v5->_actionButtonLabel = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_otherButtonLabel"];
    otherButtonLabel = v5->_otherButtonLabel;
    v5->_otherButtonLabel = (NSString *)v28;

    v5->_shouldPersistWhenDismissed = [v4 decodeBoolForKey:@"_shouldPersistWhenDismissed"];
    v5->_shouldPersistWhenActivated = [v4 decodeBoolForKey:@"_shouldPersistWhenActivated"];
    v5->_hasActionButton = [v4 decodeBoolForKey:@"_hasActionButton"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_unlockActionLabel"];
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v32, "setWithObjects:", v33, v34, v35, v36, v37, v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v40;

    v42 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_relevanceDate forKey:@"_relevanceDate"];
  [v5 encodeObject:self->_expiryDate forKey:@"_expiryDate"];
  [v5 encodeObject:self->_informativeText forKey:@"_informativeText"];
  [v5 encodeObject:self->_familyMemberDSID forKey:@"_familyMemberDSID"];
  [v5 encodeInteger:self->_displayStyle forKey:@"_displayStyle"];
  [v5 encodeObject:self->_activateActionURL forKey:@"_activateActionURL"];
  [v5 encodeObject:self->_dismissActionlURL forKey:@"_dismissActionlURL"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v5 encodeObject:self->_launchActionURL forKey:@"_launchActionURL"];
  [v5 encodeObject:self->_launchActionArguments forKey:@"_launchActionArguments"];
  [v5 encodeObject:self->_actionButtonLabel forKey:@"_actionButtonLabel"];
  [v5 encodeObject:self->_otherButtonLabel forKey:@"_otherButtonLabel"];
  [v5 encodeBool:self->_shouldPersistWhenDismissed forKey:@"_shouldPersistWhenDismissed"];
  [v5 encodeBool:self->_shouldPersistWhenActivated forKey:@"_shouldPersistWhenActivated"];
  [v5 encodeBool:self->_hasActionButton forKey:@"_hasActionButton"];
  [v5 encodeObject:self->_unlockActionLabel forKey:@"_unlockActionLabel"];
}

- (id)cacheDictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKeyedSubscript:@"_uuid"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKeyedSubscript:@"_identifier"];
  }
  relevanceDate = self->_relevanceDate;
  if (relevanceDate) {
    [v4 setObject:relevanceDate forKeyedSubscript:@"_relevanceDate"];
  }
  expiryDate = self->_expiryDate;
  if (expiryDate) {
    [v4 setObject:expiryDate forKeyedSubscript:@"_expiryDate"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKeyedSubscript:@"_title"];
  }
  informativeText = self->_informativeText;
  if (informativeText) {
    [v4 setObject:informativeText forKeyedSubscript:@"_informativeText"];
  }
  familyMemberDSID = self->_familyMemberDSID;
  if (familyMemberDSID) {
    [v4 setObject:familyMemberDSID forKeyedSubscript:@"_familyMemberDSID"];
  }
  uint64_t v12 = [NSNumber numberWithInteger:self->_displayStyle];
  [v4 setObject:v12 forKeyedSubscript:@"_displayStyle"];

  activateActionURL = self->_activateActionURL;
  if (activateActionURL)
  {
    uint64_t v14 = [(NSURL *)activateActionURL absoluteString];
    [v4 setObject:v14 forKeyedSubscript:@"_activateActionURL"];
  }
  dismissActionlURL = self->_dismissActionlURL;
  if (dismissActionlURL)
  {
    uint64_t v16 = [(NSURL *)dismissActionlURL absoluteString];
    [v4 setObject:v16 forKeyedSubscript:@"_dismissActionlURL"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v4 setObject:userInfo forKeyedSubscript:@"_userInfo"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v4 setObject:clientIdentifier forKeyedSubscript:@"_clientIdentifier"];
  }
  delegateMachServiceName = self->_delegateMachServiceName;
  if (delegateMachServiceName) {
    [v4 setObject:delegateMachServiceName forKeyedSubscript:@"_delegateMachServiceName"];
  }
  launchActionURL = self->_launchActionURL;
  if (launchActionURL)
  {
    v21 = [(NSURL *)launchActionURL absoluteString];
    [v4 setObject:v21 forKeyedSubscript:@"_launchActionURL"];
  }
  launchActionArguments = self->_launchActionArguments;
  if (launchActionArguments) {
    [v4 setObject:launchActionArguments forKeyedSubscript:@"_launchActionArguments"];
  }
  actionButtonLabel = self->_actionButtonLabel;
  if (actionButtonLabel) {
    [v4 setObject:actionButtonLabel forKeyedSubscript:@"_actionButtonLabel"];
  }
  otherButtonLabel = self->_otherButtonLabel;
  if (otherButtonLabel) {
    [v4 setObject:otherButtonLabel forKeyedSubscript:@"_otherButtonLabel"];
  }
  v25 = [NSNumber numberWithBool:self->_shouldPersistWhenDismissed];
  [v4 setObject:v25 forKeyedSubscript:@"_shouldPersistWhenDismissed"];

  uint64_t v26 = [NSNumber numberWithBool:self->_shouldPersistWhenActivated];
  [v4 setObject:v26 forKeyedSubscript:@"_shouldPersistWhenActivated"];

  v27 = [NSNumber numberWithBool:self->_hasActionButton];
  [v4 setObject:v27 forKeyedSubscript:@"_hasActionButton"];

  unlockActionLabel = self->_unlockActionLabel;
  if (unlockActionLabel) {
    [v4 setObject:unlockActionLabel forKeyedSubscript:@"_unlockActionLabel"];
  }
  v29 = (void *)[v4 copy];

  return v29;
}

- (FAFamilyNotification)initWithCacheDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)FAFamilyNotification;
  id v5 = [(FAFamilyNotification *)&v52 self];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"_relevanceDate"];
    relevanceDate = v5->_relevanceDate;
    v5->_relevanceDate = (NSDate *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"_expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"_familyMemberDSID"];
    familyMemberDSID = v5->_familyMemberDSID;
    v5->_familyMemberDSID = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"_displayStyle"];
    v5->_displayStyle = [v20 integerValue];

    v21 = NSURL;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"_activateActionURL"];
    uint64_t v23 = [v21 URLWithString:v22];
    activateActionURL = v5->_activateActionURL;
    v5->_activateActionURL = (NSURL *)v23;

    v25 = NSURL;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"_dismissActionlURL"];
    uint64_t v27 = [v25 URLWithString:v26];
    dismissActionlURL = v5->_dismissActionlURL;
    v5->_dismissActionlURL = (NSURL *)v27;

    uint64_t v29 = [v4 objectForKeyedSubscript:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v29;

    uint64_t v31 = [v4 objectForKeyedSubscript:@"_clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v31;

    uint64_t v33 = [v4 objectForKeyedSubscript:@"_delegateMachServiceName"];
    delegateMachServiceName = v5->_delegateMachServiceName;
    v5->_delegateMachServiceName = (NSString *)v33;

    uint64_t v35 = NSURL;
    uint64_t v36 = [v4 objectForKeyedSubscript:@"_launchActionURL"];
    uint64_t v37 = [v35 URLWithString:v36];
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v37;

    uint64_t v39 = [v4 objectForKeyedSubscript:@"_launchActionArguments"];
    launchActionArguments = v5->_launchActionArguments;
    v5->_launchActionArguments = (NSData *)v39;

    uint64_t v41 = [v4 objectForKeyedSubscript:@"_actionButtonLabel"];
    actionButtonLabel = v5->_actionButtonLabel;
    v5->_actionButtonLabel = (NSString *)v41;

    uint64_t v43 = [v4 objectForKeyedSubscript:@"_otherButtonLabel"];
    otherButtonLabel = v5->_otherButtonLabel;
    v5->_otherButtonLabel = (NSString *)v43;

    v45 = [v4 objectForKeyedSubscript:@"_shouldPersistWhenDismissed"];
    v5->_shouldPersistWhenDismissed = [v45 BOOLValue];

    v46 = [v4 objectForKeyedSubscript:@"_shouldPersistWhenActivated"];
    v5->_shouldPersistWhenActivated = [v46 BOOLValue];

    v47 = [v4 objectForKeyedSubscript:@"_hasActionButton"];
    v5->_hasActionButton = [v47 BOOLValue];

    uint64_t v48 = [v4 objectForKeyedSubscript:@"_unlockActionLabel"];
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v48;

    v50 = v5;
  }

  return v5;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)FAFamilyNotification;
  v3 = [(FAFamilyNotification *)&v13 description];
  uint64_t v4 = [v3 length] - 1;
  id v5 = NSString;
  uint64_t v6 = [(FAFamilyNotification *)self title];
  v7 = [(FAFamilyNotification *)self informativeText];
  uint64_t v8 = [(FAFamilyNotification *)self identifier];
  v9 = [(FAFamilyNotification *)self clientIdentifier];
  uint64_t v10 = [v5 stringWithFormat:@" - title=%@ text=%@ identifier=%@ client=%@ displayStyle=%lu >", v6, v7, v8, v9, -[FAFamilyNotification displayStyle](self, "displayStyle")];
  v11 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, 1, v10);

  return v11;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)informativeText
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInformativeText:(id)a3
{
}

- (NSDate)relevanceDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelevanceDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExpiryDate:(id)a3
{
}

- (NSNumber)familyMemberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFamilyMemberDSID:(id)a3
{
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (BOOL)shouldPersistWhenActivated
{
  return self->_shouldPersistWhenActivated;
}

- (void)setShouldPersistWhenActivated:(BOOL)a3
{
  self->_shouldPersistWhenActivated = a3;
}

- (BOOL)shouldPersistWhenDismissed
{
  return self->_shouldPersistWhenDismissed;
}

- (void)setShouldPersistWhenDismissed:(BOOL)a3
{
  self->_shouldPersistWhenDismissed = a3;
}

- (NSString)actionButtonLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActionButtonLabel:(id)a3
{
}

- (NSString)otherButtonLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOtherButtonLabel:(id)a3
{
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (void)setHasActionButton:(BOOL)a3
{
  self->_hasActionButton = a3;
}

- (NSString)unlockActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnlockActionLabel:(id)a3
{
}

- (NSURL)activateActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActivateActionURL:(id)a3
{
}

- (NSURL)dismissActionlURL
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDismissActionlURL:(id)a3
{
}

- (NSURL)launchActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLaunchActionURL:(id)a3
{
}

- (NSData)launchActionArguments
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLaunchActionArguments:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)delegateMachServiceName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDelegateMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMachServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_launchActionArguments, 0);
  objc_storeStrong((id *)&self->_launchActionURL, 0);
  objc_storeStrong((id *)&self->_dismissActionlURL, 0);
  objc_storeStrong((id *)&self->_activateActionURL, 0);
  objc_storeStrong((id *)&self->_unlockActionLabel, 0);
  objc_storeStrong((id *)&self->_otherButtonLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonLabel, 0);
  objc_storeStrong((id *)&self->_familyMemberDSID, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_relevanceDate, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end