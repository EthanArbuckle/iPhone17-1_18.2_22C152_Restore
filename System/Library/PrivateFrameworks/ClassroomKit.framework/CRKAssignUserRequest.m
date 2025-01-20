@interface CRKAssignUserRequest
+ (BOOL)supportsSecureCoding;
- (CRKAssignUserRequest)initWithCoder:(id)a3;
- (NSArray)enrolledCourseIdentifiers;
- (NSNumber)groupID;
- (NSString)appleID;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)fullScreenImageURL;
- (NSString)givenName;
- (NSString)imageURL;
- (NSString)passcodeType;
- (NSString)password;
- (NSString)userIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnrolledCourseIdentifiers:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setFullScreenImageURL:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setPasscodeType:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation CRKAssignUserRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKAssignUserRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRKAssignUserRequest;
  v5 = [(CATTaskRequest *)&v42 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSNumber *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v19;

    v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSString *)v22;

    v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"fullScreenImageURL"];
    fullScreenImageURL = v5->_fullScreenImageURL;
    v5->_fullScreenImageURL = (NSString *)v25;

    v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v28;

    v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"passcodeType"];
    passcodeType = v5->_passcodeType;
    v5->_passcodeType = (NSString *)v31;

    v33 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v34;

    v36 = (void *)MEMORY[0x263EFFA08];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"enrolledCourseIdentifiers"];
    enrolledCourseIdentifiers = v5->_enrolledCourseIdentifiers;
    v5->_enrolledCourseIdentifiers = (NSArray *)v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CRKAssignUserRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v16 encodeWithCoder:v4];
  v5 = [(CRKAssignUserRequest *)self userIdentifier];
  [v4 encodeObject:v5 forKey:@"userIdentifier"];

  v6 = [(CRKAssignUserRequest *)self groupID];
  [v4 encodeObject:v6 forKey:@"groupID"];

  uint64_t v7 = [(CRKAssignUserRequest *)self displayName];
  [v4 encodeObject:v7 forKey:@"displayName"];

  v8 = [(CRKAssignUserRequest *)self givenName];
  [v4 encodeObject:v8 forKey:@"givenName"];

  v9 = [(CRKAssignUserRequest *)self familyName];
  [v4 encodeObject:v9 forKey:@"familyName"];

  uint64_t v10 = [(CRKAssignUserRequest *)self imageURL];
  [v4 encodeObject:v10 forKey:@"imageURL"];

  v11 = [(CRKAssignUserRequest *)self fullScreenImageURL];
  [v4 encodeObject:v11 forKey:@"fullScreenImageURL"];

  v12 = [(CRKAssignUserRequest *)self appleID];
  [v4 encodeObject:v12 forKey:@"appleID"];

  uint64_t v13 = [(CRKAssignUserRequest *)self passcodeType];
  [v4 encodeObject:v13 forKey:@"passcodeType"];

  v14 = [(CRKAssignUserRequest *)self password];
  [v4 encodeObject:v14 forKey:@"password"];

  v15 = [(CRKAssignUserRequest *)self enrolledCourseIdentifiers];
  [v4 encodeObject:v15 forKey:@"enrolledCourseIdentifiers"];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)fullScreenImageURL
{
  return self->_fullScreenImageURL;
}

- (void)setFullScreenImageURL:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSArray)enrolledCourseIdentifiers
{
  return self->_enrolledCourseIdentifiers;
}

- (void)setEnrolledCourseIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledCourseIdentifiers, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_fullScreenImageURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end