@interface CRKSetUserPropertiesRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetUserPropertiesRequest)initWithCoder:(id)a3;
- (CRKSetUserPropertiesRequest)initWithUser:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSData)imageData;
- (NSNumber)useMeCardIfAvailable;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)userIdentifier;
- (NSString)userSource;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setImageData:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setUseMeCardIfAvailable:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUserSource:(id)a3;
@end

@implementation CRKSetUserPropertiesRequest

- (CRKSetUserPropertiesRequest)initWithUser:(id)a3
{
  id v4 = a3;
  v5 = [(CATTaskRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 userIdentifier];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    v8 = [v4 displayName];
    v9 = v8;
    if (!v8)
    {
      v9 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_displayName, v9);
    if (!v8) {

    }
    v10 = [v4 givenName];
    v11 = v10;
    if (!v10)
    {
      v11 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_givenName, v11);
    if (!v10) {

    }
    v12 = [v4 familyName];
    v13 = v12;
    if (!v12)
    {
      v13 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_familyName, v13);
    if (!v12) {

    }
    v14 = [v4 phoneticGivenName];
    v15 = v14;
    if (!v14)
    {
      v15 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_phoneticGivenName, v15);
    if (!v14) {

    }
    v16 = [v4 phoneticFamilyName];
    v17 = v16;
    if (!v16)
    {
      v17 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_phoneticFamilyName, v17);
    if (!v16) {

    }
    v18 = [v4 userSource];
    v19 = v18;
    if (!v18)
    {
      v19 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_userSource, v19);
    if (!v18) {

    }
    v20 = [v4 userImageData];
    v21 = v20;
    if (!v20)
    {
      v21 = [MEMORY[0x263EFF9D0] null];
    }
    objc_storeStrong((id *)&v5->_imageData, v21);
    if (!v20) {

    }
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "shouldUseMeCardIfAvailable"));
    useMeCardIfAvailable = v5->_useMeCardIfAvailable;
    v5->_useMeCardIfAvailable = (NSNumber *)v22;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetUserPropertiesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CRKSetUserPropertiesRequest;
  v5 = [(CATTaskRequest *)&v51 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v20;

    uint64_t v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v25;

    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"phoneticGivenName"];
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"phoneticFamilyName"];
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"userSource"];
    userSource = v5->_userSource;
    v5->_userSource = (NSString *)v40;

    v42 = (void *)MEMORY[0x263EFFA08];
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v45;

    v47 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"useMeCardIfAvailable"];
    useMeCardIfAvailable = v5->_useMeCardIfAvailable;
    v5->_useMeCardIfAvailable = (NSNumber *)v48;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CRKSetUserPropertiesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v15 encodeWithCoder:v4];
  v5 = [(CRKSetUserPropertiesRequest *)self userIdentifier];
  [v4 encodeObject:v5 forKey:@"userIdentifier"];

  uint64_t v6 = [(CRKSetUserPropertiesRequest *)self courseIdentifier];
  [v4 encodeObject:v6 forKey:@"courseIdentifier"];

  uint64_t v7 = [(CRKSetUserPropertiesRequest *)self displayName];
  [v4 encodeObject:v7 forKey:@"displayName"];

  v8 = [(CRKSetUserPropertiesRequest *)self givenName];
  [v4 encodeObject:v8 forKey:@"givenName"];

  v9 = [(CRKSetUserPropertiesRequest *)self familyName];
  [v4 encodeObject:v9 forKey:@"familyName"];

  uint64_t v10 = [(CRKSetUserPropertiesRequest *)self phoneticGivenName];
  [v4 encodeObject:v10 forKey:@"phoneticGivenName"];

  v11 = [(CRKSetUserPropertiesRequest *)self phoneticFamilyName];
  [v4 encodeObject:v11 forKey:@"phoneticFamilyName"];

  v12 = [(CRKSetUserPropertiesRequest *)self userSource];
  [v4 encodeObject:v12 forKey:@"userSource"];

  uint64_t v13 = [(CRKSetUserPropertiesRequest *)self imageData];
  [v4 encodeObject:v13 forKey:@"imageData"];

  v14 = [(CRKSetUserPropertiesRequest *)self useMeCardIfAvailable];
  [v4 encodeObject:v14 forKey:@"useMeCardIfAvailable"];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
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

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (NSString)userSource
{
  return self->_userSource;
}

- (void)setUserSource:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSNumber)useMeCardIfAvailable
{
  return self->_useMeCardIfAvailable;
}

- (void)setUseMeCardIfAvailable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useMeCardIfAvailable, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_userSource, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end