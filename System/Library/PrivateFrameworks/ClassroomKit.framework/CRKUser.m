@interface CRKUser
+ (BOOL)supportsSecureCoding;
+ (id)customUserFromMeCardUser:(id)a3;
+ (id)makeMeCardUserProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUser:(id)a3;
- (BOOL)isMeCardUser;
- (BOOL)isValid;
- (BOOL)shouldUseMeCardIfAvailable;
- (CRKUser)init;
- (CRKUser)initWithCoder:(id)a3;
- (CRKUser)initWithDictionary:(id)a3;
- (NSData)userImageData;
- (NSPersonNameComponents)nameComponents;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)imageIdentifier;
- (NSString)imageURL;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)userIdentifier;
- (NSString)userSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryValue;
- (int64_t)role;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setImageIdentifier:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setUseMeCardIfAvailable:(BOOL)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUserImageData:(id)a3;
- (void)setUserSource:(id)a3;
@end

@implementation CRKUser

- (CRKUser)init
{
  return [(CRKUser *)self initWithDictionary:MEMORY[0x263EFFA78]];
}

- (CRKUser)initWithDictionary:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)CRKUser;
  v5 = [(CRKUser *)&v69 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"UserIdentifier"];
    v7 = (void *)[v6 copy];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      userIdentifier = v5->_userIdentifier;
      v5->_userIdentifier = v9;
    }
    else
    {
      userIdentifier = [v4 objectForKeyedSubscript:@"Identifier"];
      uint64_t v11 = [userIdentifier copy];
      v12 = (void *)v11;
      if (v11) {
        v13 = (__CFString *)v11;
      }
      else {
        v13 = @"INVALID_IDENTIFIER";
      }
      objc_storeStrong((id *)&v5->_userIdentifier, v13);
    }
    v14 = [v4 objectForKeyedSubscript:@"Name"];
    v15 = (void *)[v14 copy];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      displayName = v5->_displayName;
      v5->_displayName = v17;
    }
    else
    {
      displayName = [v4 objectForKeyedSubscript:@"Name"];
      uint64_t v19 = [displayName copy];
      v20 = v5->_displayName;
      v5->_displayName = (NSString *)v19;
    }
    v21 = [v4 objectForKeyedSubscript:@"GivenName"];
    v22 = (void *)[v21 copy];
    v23 = v22;
    if (v22)
    {
      v24 = v22;
      givenName = v5->_givenName;
      v5->_givenName = v24;
    }
    else
    {
      givenName = [v4 objectForKeyedSubscript:@"GivenName"];
      uint64_t v26 = [givenName copy];
      v27 = v5->_givenName;
      v5->_givenName = (NSString *)v26;
    }
    v28 = [v4 objectForKeyedSubscript:@"FamilyName"];
    v29 = (void *)[v28 copy];
    v30 = v29;
    if (v29)
    {
      v31 = v29;
      familyName = v5->_familyName;
      v5->_familyName = v31;
    }
    else
    {
      familyName = [v4 objectForKeyedSubscript:@"FamilyName"];
      uint64_t v33 = [familyName copy];
      v34 = v5->_familyName;
      v5->_familyName = (NSString *)v33;
    }
    v35 = [v4 objectForKeyedSubscript:@"PhoneticGivenName"];
    v36 = (void *)[v35 copy];
    v37 = v36;
    if (v36)
    {
      v38 = v36;
      phoneticGivenName = v5->_phoneticGivenName;
      v5->_phoneticGivenName = v38;
    }
    else
    {
      phoneticGivenName = [v4 objectForKeyedSubscript:@"PhoneticGivenName"];
      uint64_t v40 = [phoneticGivenName copy];
      v41 = v5->_phoneticGivenName;
      v5->_phoneticGivenName = (NSString *)v40;
    }
    v42 = [v4 objectForKeyedSubscript:@"PhoneticFamilyName"];
    v43 = (void *)[v42 copy];
    v44 = v43;
    if (v43)
    {
      v45 = v43;
      phoneticFamilyName = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = v45;
    }
    else
    {
      phoneticFamilyName = [v4 objectForKeyedSubscript:@"PhoneticFamilyName"];
      uint64_t v47 = [phoneticFamilyName copy];
      v48 = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = (NSString *)v47;
    }
    v49 = [v4 objectForKeyedSubscript:@"ImageURL"];
    v50 = (void *)[v49 copy];
    v51 = v50;
    if (v50)
    {
      v52 = v50;
      imageURL = v5->_imageURL;
      v5->_imageURL = v52;
    }
    else
    {
      imageURL = [v4 objectForKeyedSubscript:@"ImageURL"];
      uint64_t v54 = [imageURL copy];
      v55 = v5->_imageURL;
      v5->_imageURL = (NSString *)v54;
    }
    v56 = [v4 objectForKeyedSubscript:@"ImageIdentifier"];
    uint64_t v57 = [v56 copy];
    imageIdentifier = v5->_imageIdentifier;
    v5->_imageIdentifier = (NSString *)v57;

    v59 = [v4 objectForKeyedSubscript:@"UserSource"];
    uint64_t v60 = [v59 copy];
    userSource = v5->_userSource;
    v5->_userSource = (NSString *)v60;

    v62 = [v4 objectForKeyedSubscript:@"ImageData"];
    uint64_t v63 = [v62 copy];
    userImageData = v5->_userImageData;
    v5->_userImageData = (NSData *)v63;

    v65 = [v4 objectForKeyedSubscript:@"Role"];
    if (v65)
    {
      v66 = [v4 objectForKeyedSubscript:@"Role"];
      v5->_role = [v66 unsignedIntegerValue];
    }
    else
    {
      v5->_role = 0;
    }

    v67 = [v4 objectForKeyedSubscript:@"UseMeCardIfAvailable"];
    v5->_useMeCardIfAvailable = [v67 BOOLValue];
  }
  return v5;
}

+ (id)makeMeCardUserProvider
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)customUserFromMeCardUser:(id)a3
{
  id v3 = a3;
  if ([v3 isMeCardUser])
  {
    id v4 = [CRKUser alloc];
    v5 = [v3 dictionaryValue];
    v6 = [(CRKUser *)v4 initWithDictionary:v5];

    v7 = [MEMORY[0x263F08C38] UUID];
    v8 = [v7 UUIDString];
    [(CRKUser *)v6 setUserIdentifier:v8];

    [(CRKUser *)v6 setUserSource:@"Custom"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSPersonNameComponents)nameComponents
{
  id v3 = objc_opt_new();
  id v4 = [(CRKUser *)self givenName];
  if (v4)
  {

LABEL_4:
    v6 = [(CRKUser *)self givenName];
    [v3 setGivenName:v6];

    v7 = [(CRKUser *)self familyName];
    [v3 setFamilyName:v7];
    goto LABEL_5;
  }
  v5 = [(CRKUser *)self familyName];

  if (v5) {
    goto LABEL_4;
  }
  v7 = [(CRKUser *)self displayName];
  [v3 setGivenName:v7];
LABEL_5:

  v8 = [(CRKUser *)self phoneticGivenName];
  if (v8)
  {
  }
  else
  {
    v9 = [(CRKUser *)self phoneticFamilyName];

    if (!v9) {
      goto LABEL_9;
    }
  }
  v10 = objc_opt_new();
  [v3 setPhoneticRepresentation:v10];

  uint64_t v11 = [(CRKUser *)self phoneticGivenName];
  v12 = [v3 phoneticRepresentation];
  [v12 setGivenName:v11];

  v13 = [(CRKUser *)self phoneticFamilyName];
  v14 = [v3 phoneticRepresentation];
  [v14 setFamilyName:v13];

LABEL_9:

  return (NSPersonNameComponents *)v3;
}

- (id)dictionaryValue
{
  id v3 = objc_opt_new();
  id v4 = [(CRKUser *)self userIdentifier];

  if (v4)
  {
    v5 = [(CRKUser *)self userIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"Identifier"];
  }
  v6 = [(CRKUser *)self displayName];

  if (v6)
  {
    v7 = [(CRKUser *)self displayName];
    [v3 setObject:v7 forKeyedSubscript:@"Name"];
  }
  v8 = [(CRKUser *)self givenName];

  if (v8)
  {
    v9 = [(CRKUser *)self givenName];
    [v3 setObject:v9 forKeyedSubscript:@"GivenName"];
  }
  v10 = [(CRKUser *)self familyName];

  if (v10)
  {
    uint64_t v11 = [(CRKUser *)self familyName];
    [v3 setObject:v11 forKeyedSubscript:@"FamilyName"];
  }
  v12 = [(CRKUser *)self phoneticGivenName];

  if (v12)
  {
    v13 = [(CRKUser *)self phoneticGivenName];
    [v3 setObject:v13 forKeyedSubscript:@"PhoneticGivenName"];
  }
  v14 = [(CRKUser *)self phoneticFamilyName];

  if (v14)
  {
    v15 = [(CRKUser *)self phoneticFamilyName];
    [v3 setObject:v15 forKeyedSubscript:@"PhoneticFamilyName"];
  }
  v16 = [(CRKUser *)self imageURL];

  if (v16)
  {
    v17 = [(CRKUser *)self imageURL];
    [v3 setObject:v17 forKeyedSubscript:@"ImageURL"];
  }
  v18 = [(CRKUser *)self userSource];

  if (v18)
  {
    uint64_t v19 = [(CRKUser *)self userSource];
    [v3 setObject:v19 forKeyedSubscript:@"UserSource"];
  }
  v20 = [(CRKUser *)self userImageData];

  if (v20)
  {
    v21 = [(CRKUser *)self userImageData];
    [v3 setObject:v21 forKeyedSubscript:@"ImageData"];
  }
  v22 = [(CRKUser *)self imageIdentifier];

  if (v22)
  {
    v23 = [(CRKUser *)self imageIdentifier];
    [v3 setObject:v23 forKeyedSubscript:@"ImageIdentifier"];
  }
  v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKUser role](self, "role"));
  [v3 setObject:v24 forKeyedSubscript:@"Role"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  [v3 setObject:v25 forKeyedSubscript:@"UseMeCardIfAvailable"];

  return v3;
}

- (BOOL)isMeCardUser
{
  v2 = [(CRKUser *)self userSource];
  char v3 = [v2 isEqualToString:@"MeCard"];

  return v3;
}

- (BOOL)isValid
{
  char v3 = [(CRKUser *)self givenName];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(CRKUser *)self familyName];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (id)description
{
  BOOL v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(CRKUser *)self userIdentifier];
  v7 = [(CRKUser *)self displayName];
  v8 = [(CRKUser *)self givenName];
  v9 = [(CRKUser *)self familyName];
  v10 = NSNumber;
  uint64_t v11 = [(CRKUser *)self imageURL];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    v2 = [(CRKUser *)self imageIdentifier];
    BOOL v12 = v2 != 0;
  }
  v13 = [v10 numberWithInt:v12];
  v14 = [v4 stringWithFormat:@"<%@: %p {identifier = %@, displayName = %@, given = %@, family = %@, hasImage = %@ }>", v5, self, v6, v7, v8, v9, v13];

  if (!v11) {

  }
  return v14;
}

- (unint64_t)hash
{
  v23 = [(CRKUser *)self userIdentifier];
  uint64_t v3 = [v23 hash];
  v22 = [(CRKUser *)self displayName];
  uint64_t v4 = [v22 hash] ^ v3;
  uint64_t v5 = [(CRKUser *)self givenName];
  uint64_t v6 = [v5 hash];
  v7 = [(CRKUser *)self familyName];
  uint64_t v8 = v4 ^ v6 ^ [v7 hash];
  v9 = [(CRKUser *)self phoneticGivenName];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(CRKUser *)self phoneticFamilyName];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(CRKUser *)self imageURL];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  v15 = [(CRKUser *)self imageIdentifier];
  uint64_t v16 = [v15 hash];
  v17 = [(CRKUser *)self userSource];
  uint64_t v18 = v16 ^ [v17 hash];
  int64_t v19 = v18 ^ [(CRKUser *)self role];
  unint64_t v20 = v14 ^ v19 ^ [(CRKUser *)self shouldUseMeCardIfAvailable];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRKUser *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CRKUser *)self isEqualToUser:v5];

  return v6;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    [MEMORY[0x263F08690] currentHandler];
    v32 = uint64_t v3 = self;
    [v32 handleFailureInMethod:a2, v3, @"CRKUser.m", 154, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    self = v3;
  }
  v9 = [(CRKUser *)self userIdentifier];
  if (v9 || ([v8 userIdentifier], (objc_super v69 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = [(CRKUser *)self userIdentifier];
    uint64_t v4 = [v8 userIdentifier];
    if (![(CRKUser *)v3 isEqual:v4])
    {
      LOBYTE(v11) = 0;
LABEL_87:

      goto LABEL_88;
    }
    int v10 = 1;
  }
  else
  {
    objc_super v69 = 0;
    int v10 = 0;
  }
  uint64_t v12 = [(CRKUser *)self displayName];
  if (v12 || ([v8 displayName], (v64 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = [(CRKUser *)self displayName];
    uint64_t v5 = [v8 displayName];
    v70 = v13;
    if (![v13 isEqual:v5])
    {
      LOBYTE(v11) = 0;
      goto LABEL_85;
    }
    int v67 = 1;
    int v68 = v10;
  }
  else
  {
    int v67 = 0;
    int v68 = v10;
    v64 = 0;
  }
  uint64_t v14 = [(CRKUser *)self givenName];
  if (v14 || ([v8 givenName], (v59 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = self;
    uint64_t v16 = [(CRKUser *)self givenName];
    v65 = [v8 givenName];
    v66 = v16;
    if (!objc_msgSend(v16, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_81;
    }
    int v63 = 1;
  }
  else
  {
    v15 = self;
    v59 = 0;
    int v63 = 0;
  }
  v62 = [(CRKUser *)v15 familyName];
  if (v62 || ([v8 familyName], (uint64_t v54 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = [(CRKUser *)v15 familyName];
    [v8 familyName];
    v61 = uint64_t v60 = v17;
    if (!objc_msgSend(v17, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_78;
    }
    int v58 = 1;
  }
  else
  {
    uint64_t v54 = 0;
    int v58 = 0;
  }
  uint64_t v57 = [(CRKUser *)v15 phoneticGivenName];
  if (v57 || ([v8 phoneticGivenName], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = [(CRKUser *)v15 phoneticGivenName];
    v55 = [v8 phoneticGivenName];
    v56 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      LOBYTE(v11) = 0;
LABEL_75:

      goto LABEL_76;
    }
    int v19 = 1;
  }
  else
  {
    v50 = 0;
    int v19 = 0;
  }
  int v53 = v19;
  unint64_t v20 = v15;
  v21 = [(CRKUser *)v15 phoneticFamilyName];
  if (v21 || ([v8 phoneticFamilyName], (v45 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v20;
    v23 = [(CRKUser *)v20 phoneticFamilyName];
    v51 = [v8 phoneticFamilyName];
    v52 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_38;
    }
    int v49 = 1;
  }
  else
  {
    v22 = v20;
    v45 = 0;
    int v49 = 0;
  }
  v48 = [(CRKUser *)v22 imageURL];
  if (v48 || ([v8 imageURL], (uint64_t v40 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v25 = [(CRKUser *)v22 imageURL];
    v46 = [v8 imageURL];
    uint64_t v47 = v25;
    if (!objc_msgSend(v25, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_45;
    }
    int v44 = 1;
  }
  else
  {
    uint64_t v40 = 0;
    int v44 = 0;
  }
  v43 = [(CRKUser *)v22 imageIdentifier];
  if (v43 || ([v8 imageIdentifier], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v26 = [(CRKUser *)v22 imageIdentifier];
    v41 = [v8 imageIdentifier];
    v42 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      int v24 = v53;
      goto LABEL_66;
    }
    int v38 = 1;
  }
  else
  {
    v35 = 0;
    int v38 = 0;
  }
  v39 = [(CRKUser *)v22 userSource];
  if (v39 || ([v8 userSource], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = [(CRKUser *)v22 userSource];
    v36 = [v8 userSource];
    v37 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      int v24 = v53;
      goto LABEL_63;
    }
    int v34 = 1;
  }
  else
  {
    uint64_t v33 = 0;
    int v34 = 0;
  }
  v28 = v22;
  uint64_t v29 = [(CRKUser *)v22 role];
  if (v29 != [v8 role])
  {
    LOBYTE(v11) = 0;
    int v24 = v53;
    if (!v34) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  BOOL v30 = [(CRKUser *)v28 shouldUseMeCardIfAvailable];
  int v11 = v30 ^ [v8 shouldUseMeCardIfAvailable] ^ 1;
  int v24 = v53;
  if (v34)
  {
LABEL_63:
  }
LABEL_64:
  if (v39)
  {

    if (!v38) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }

  if (v38)
  {
LABEL_66:
  }
LABEL_67:
  if (v43)
  {

    if (!v44) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }

  if (v44)
  {
LABEL_45:
    int v24 = v53;
LABEL_69:

    goto LABEL_70;
  }
  int v24 = v53;
LABEL_70:
  if (v48)
  {

    if (!v49) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }

  if (v49)
  {
LABEL_38:
    int v24 = v53;
LABEL_72:

LABEL_73:
    if (v21) {
      goto LABEL_74;
    }
    goto LABEL_104;
  }
  int v24 = v53;
  if (v21)
  {
LABEL_74:

    if (!v24) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_104:

  if (v24) {
    goto LABEL_75;
  }
LABEL_76:
  if (v57)
  {

    if (!v58) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }

  if (v58)
  {
LABEL_78:
  }
LABEL_79:
  if (v62)
  {

    if (!v63) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }

  if (v63)
  {
LABEL_81:
  }
LABEL_82:
  if (v14)
  {

    if (v67)
    {
LABEL_84:
      int v10 = v68;
LABEL_85:

      if (v12) {
        goto LABEL_86;
      }
      goto LABEL_93;
    }
  }
  else
  {

    if (v67) {
      goto LABEL_84;
    }
  }
  int v10 = v68;
  if (v12)
  {
LABEL_86:

    if (!v10) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_93:

  if (v10) {
    goto LABEL_87;
  }
LABEL_88:
  if (!v9) {

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(CRKUser *)self userIdentifier];
  [v4 setUserIdentifier:v5];

  BOOL v6 = [(CRKUser *)self displayName];
  [v4 setDisplayName:v6];

  v7 = [(CRKUser *)self givenName];
  [v4 setGivenName:v7];

  id v8 = [(CRKUser *)self familyName];
  [v4 setFamilyName:v8];

  v9 = [(CRKUser *)self phoneticGivenName];
  [v4 setPhoneticGivenName:v9];

  int v10 = [(CRKUser *)self phoneticFamilyName];
  [v4 setPhoneticFamilyName:v10];

  int v11 = [(CRKUser *)self userImageData];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setUserImageData:v12];

  v13 = [(CRKUser *)self imageIdentifier];
  [v4 setImageIdentifier:v13];

  uint64_t v14 = [(CRKUser *)self imageURL];
  [v4 setImageURL:v14];

  v15 = [(CRKUser *)self userSource];
  [v4 setUserSource:v15];

  objc_msgSend(v4, "setRole:", -[CRKUser role](self, "role"));
  objc_msgSend(v4, "setUseMeCardIfAvailable:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKUser)initWithCoder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"CRKUser.m", 197, @"Invalid parameter not satisfying: %@", @"aDecoder" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)CRKUser;
  BOOL v6 = [(CRKUser *)&v38 init];
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"userIdentifier"];
    userIdentifier = v6->_userIdentifier;
    v6->_userIdentifier = (NSString *)v8;

    int v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v5 decodeObjectOfClasses:v10 forKey:@"displayName"];
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v11;

    v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"givenName"];
    givenName = v6->_givenName;
    v6->_givenName = (NSString *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v5 decodeObjectOfClasses:v16 forKey:@"familyName"];
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v17;

    int v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v5 decodeObjectOfClasses:v19 forKey:@"phoneticGivenName"];
    phoneticGivenName = v6->_phoneticGivenName;
    v6->_phoneticGivenName = (NSString *)v20;

    v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v23 = [v5 decodeObjectOfClasses:v22 forKey:@"phoneticFamilyName"];
    phoneticFamilyName = v6->_phoneticFamilyName;
    v6->_phoneticFamilyName = (NSString *)v23;

    v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v26 = [v5 decodeObjectOfClasses:v25 forKey:@"imageURL"];
    imageURL = v6->_imageURL;
    v6->_imageURL = (NSString *)v26;

    v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v5 decodeObjectOfClasses:v28 forKey:@"imageIdentifier"];
    imageIdentifier = v6->_imageIdentifier;
    v6->_imageIdentifier = (NSString *)v29;

    v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v32 = [v5 decodeObjectOfClasses:v31 forKey:@"userSource"];
    userSource = v6->_userSource;
    v6->_userSource = (NSString *)v32;

    int v34 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
    v6->_role = [v34 unsignedIntegerValue];

    v35 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"useMeCardIfAvailable"];
    v6->_useMeCardIfAvailable = [v35 BOOLValue];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  if (!v17)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CRKUser.m", 217, @"Invalid parameter not satisfying: %@", @"aCoder" object file lineNumber description];
  }
  id v5 = [(CRKUser *)self userIdentifier];
  [v17 encodeObject:v5 forKey:@"userIdentifier"];

  BOOL v6 = [(CRKUser *)self displayName];
  [v17 encodeObject:v6 forKey:@"displayName"];

  v7 = [(CRKUser *)self givenName];
  [v17 encodeObject:v7 forKey:@"givenName"];

  uint64_t v8 = [(CRKUser *)self familyName];
  [v17 encodeObject:v8 forKey:@"familyName"];

  v9 = [(CRKUser *)self phoneticGivenName];
  [v17 encodeObject:v9 forKey:@"phoneticGivenName"];

  int v10 = [(CRKUser *)self phoneticFamilyName];
  [v17 encodeObject:v10 forKey:@"phoneticFamilyName"];

  uint64_t v11 = [(CRKUser *)self imageURL];
  [v17 encodeObject:v11 forKey:@"imageURL"];

  uint64_t v12 = [(CRKUser *)self imageIdentifier];
  [v17 encodeObject:v12 forKey:@"imageIdentifier"];

  v13 = [(CRKUser *)self userSource];
  [v17 encodeObject:v13 forKey:@"userSource"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKUser role](self, "role"));
  [v17 encodeObject:v14 forKey:@"role"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  [v17 encodeObject:v15 forKey:@"useMeCardIfAvailable"];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
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

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)userSource
{
  return self->_userSource;
}

- (void)setUserSource:(id)a3
{
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (BOOL)shouldUseMeCardIfAvailable
{
  return self->_useMeCardIfAvailable;
}

- (void)setUseMeCardIfAvailable:(BOOL)a3
{
  self->_useMeCardIfAvailable = a3;
}

- (NSData)userImageData
{
  return self->_userImageData;
}

- (void)setUserImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userImageData, 0);
  objc_storeStrong((id *)&self->_userSource, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end