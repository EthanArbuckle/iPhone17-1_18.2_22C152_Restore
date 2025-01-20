@interface ASCPasswordLoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCPasswordLoginChoice)initWithCoder:(id)a3;
- (ASCPasswordLoginChoice)initWithUsername:(id)a3 site:(id)a4 externalCredentialIdentity:(id)a5 customTitle:(id)a6 groupName:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isSharedCredential;
- (NSString)customTitle;
- (NSString)groupName;
- (NSString)providerBundleIdentifier;
- (NSString)site;
- (NSString)username;
- (SFCredentialIdentity)externalCredentialIdentity;
- (int64_t)compare:(id)a3;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPasswordLoginChoice

- (ASCPasswordLoginChoice)initWithUsername:(id)a3 site:(id)a4 externalCredentialIdentity:(id)a5 customTitle:(id)a6 groupName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ASCPasswordLoginChoice;
  v17 = [(ASCPasswordLoginChoice *)&v32 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    username = v17->_username;
    v17->_username = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    site = v17->_site;
    v17->_site = (NSString *)v20;

    v22 = [v14 owningExtensionState];
    v23 = [v22 providerBundleID];

    uint64_t v24 = [v23 copy];
    providerBundleIdentifier = v17->_providerBundleIdentifier;
    v17->_providerBundleIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v17->_externalCredentialIdentity, a5);
    if ([v15 length])
    {
      uint64_t v26 = [v15 copy];
      customTitle = v17->_customTitle;
      v17->_customTitle = (NSString *)v26;
    }
    else
    {
      customTitle = v17->_customTitle;
      v17->_customTitle = 0;
    }

    if ([v16 length])
    {
      uint64_t v28 = [v16 copy];
      groupName = v17->_groupName;
      v17->_groupName = (NSString *)v28;
    }
    else
    {
      groupName = v17->_groupName;
      v17->_groupName = 0;
    }

    v30 = v17;
  }

  return v17;
}

- (BOOL)isExternal
{
  return self->_externalCredentialIdentity != 0;
}

- (unint64_t)loginChoiceKind
{
  return 1;
}

- (BOOL)isSharedCredential
{
  v2 = [(ASCPasswordLoginChoice *)self groupName];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = [(NSString *)self->_username isEqualToString:v5[1]]
      && self->_externalCredentialIdentity == (SFCredentialIdentity *)v5[5]
      && [(NSString *)self->_site isEqualToString:v5[2]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v5 = a3;
  [v5 encodeObject:username forKey:@"passwordLoginChoiceUsername"];
  [v5 encodeObject:self->_site forKey:@"passwordLoginChoiceSite"];
  [v5 encodeObject:self->_customTitle forKey:@"passwordLoginChoiceCustomTitle"];
  [v5 encodeObject:self->_groupName forKey:@"passwordLoginChoiceGroupNameKey"];
  [v5 encodeObject:self->_externalCredentialIdentity forKey:@"externalPasswordIdentity"];
  [v5 encodeObject:self->_providerBundleIdentifier forKey:@"providerBundleIdentifier"];
}

- (ASCPasswordLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASCPasswordLoginChoice;
  id v5 = [(ASCPasswordLoginChoice *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordLoginChoiceUsername"];
    username = v5->_username;
    v5->_username = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordLoginChoiceSite"];
    site = v5->_site;
    v5->_site = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordLoginChoiceCustomTitle"];
    customTitle = v5->_customTitle;
    v5->_customTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordLoginChoiceGroupNameKey"];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalPasswordIdentity"];
    externalCredentialIdentity = v5->_externalCredentialIdentity;
    v5->_externalCredentialIdentity = (SFCredentialIdentity *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v16;

    uint64_t v18 = v5;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (-[ASCPasswordLoginChoice isExternal](self, "isExternal") && ![v4 isExternal]) {
    goto LABEL_9;
  }
  if (!-[ASCPasswordLoginChoice isExternal](self, "isExternal") && ([v4 isExternal] & 1) != 0) {
    goto LABEL_5;
  }
  if (!-[ASCPasswordLoginChoice isExternal](self, "isExternal") || ![v4 isExternal]) {
    goto LABEL_11;
  }
  uint64_t v6 = [(SFCredentialIdentity *)self->_externalCredentialIdentity rank];
  v7 = [v4 externalCredentialIdentity];
  uint64_t v8 = [v7 rank];

  if (v6 > v8)
  {
LABEL_9:
    int64_t v5 = -1;
    goto LABEL_12;
  }
  uint64_t v9 = [(SFCredentialIdentity *)self->_externalCredentialIdentity rank];
  uint64_t v10 = [v4 externalCredentialIdentity];
  uint64_t v11 = [v10 rank];

  if (v9 >= v11)
  {
LABEL_11:
    int64_t v5 = 0;
    goto LABEL_12;
  }
LABEL_5:
  int64_t v5 = 1;
LABEL_12:

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)site
{
  return self->_site;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (SFCredentialIdentity)externalCredentialIdentity
{
  return self->_externalCredentialIdentity;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalCredentialIdentity, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_site, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end