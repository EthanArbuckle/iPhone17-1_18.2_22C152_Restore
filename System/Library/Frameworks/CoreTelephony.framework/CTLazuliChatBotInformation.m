@interface CTLazuliChatBotInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotInformation:(id)a3;
- (CTLazuliChatBotAddressEntryList)addresses;
- (CTLazuliChatBotInformation)initWithCoder:(id)a3;
- (CTLazuliChatBotInformation)initWithReflection:(const void *)a3;
- (CTLazuliChatBotPCC)pcc;
- (NSString)backgroundImage;
- (NSString)color;
- (NSString)email;
- (NSString)provider;
- (NSString)version;
- (NSURL)tcPageUrl;
- (NSURL)website;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setColor:(id)a3;
- (void)setEmail:(id)a3;
- (void)setPcc:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTcPageUrl:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWebsite:(id)a3;
@end

@implementation CTLazuliChatBotInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotInformation *)self pcc];
  [v3 appendFormat:@", pcc = %@", v4];

  v5 = [(CTLazuliChatBotInformation *)self version];
  [v3 appendFormat:@", version = %@", v5];

  v6 = [(CTLazuliChatBotInformation *)self provider];
  [v3 appendFormat:@", provider = %@", v6];

  v7 = [(CTLazuliChatBotInformation *)self email];
  [v3 appendFormat:@", email = %@", v7];

  v8 = [(CTLazuliChatBotInformation *)self color];
  [v3 appendFormat:@", color = %@", v8];

  v9 = [(CTLazuliChatBotInformation *)self backgroundImage];
  [v3 appendFormat:@", backgroundImage = %@", v9];

  v10 = [(CTLazuliChatBotInformation *)self website];
  [v3 appendFormat:@", website = %@", v10];

  v11 = [(CTLazuliChatBotInformation *)self tcPageUrl];
  [v3 appendFormat:@", tcPageUrl = %@", v11];

  v12 = [(CTLazuliChatBotInformation *)self addresses];
  [v3 appendFormat:@", addresses = %@", v12];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotInformation:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliChatBotInformation *)self pcc];
  uint64_t v9 = [v7 pcc];
  uint64_t v10 = [v8 isEqualToCTLazuliChatBotPCC:v9];
  id v82 = v7;
  v83 = v8;
  int v80 = v10;
  if (!v10)
  {
    v12 = (void *)v9;
    int v81 = 0;
    int v13 = 0;
    memset(v79, 0, sizeof(v79));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    goto LABEL_7;
  }
  v3 = [(CTLazuliChatBotInformation *)self version];
  v76 = v3;
  HIDWORD(v79[3]) = v3 == 0;
  if (v3 || ([v7 version], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = [(CTLazuliChatBotInformation *)self version];
    v68 = [v7 version];
    int v11 = 1;
    if (![v5 isEqualToString:v68])
    {
      int v81 = 1;
      v70 = v5;
      v75 = (void *)v4;
      v12 = (void *)v9;
      LODWORD(v10) = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v79, 0, 28);
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    int v11 = 0;
  }
  v75 = (void *)v4;
  v70 = v5;
  uint64_t v31 = [(CTLazuliChatBotInformation *)self provider];
  HIDWORD(v79[2]) = v31 == 0;
  int v81 = v11;
  v74 = (void *)v31;
  if (v31 || ([v7 provider], (uint64_t v72 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v69 = [(CTLazuliChatBotInformation *)self provider];
    v67 = [v7 provider];
    uint64_t v10 = 1;
    if (![v69 isEqualToString:v67])
    {
      v12 = (void *)v9;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v79, 0, 20);
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      LODWORD(v79[3]) = 1;
      goto LABEL_7;
    }
    LODWORD(v79[3]) = 1;
  }
  else
  {
    uint64_t v72 = 0;
    LODWORD(v79[3]) = 0;
  }
  uint64_t v32 = [(CTLazuliChatBotInformation *)self email];
  HIDWORD(v79[1]) = v32 == 0;
  v73 = (void *)v32;
  if (v32 || ([v7 email], (uint64_t v71 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = [(CTLazuliChatBotInformation *)self email];
    v65 = [v7 email];
    v66 = v33;
    int v34 = [v33 isEqualToString:v65];
    uint64_t v10 = 1;
    if (!v34)
    {
      v12 = (void *)v9;
      int v14 = 0;
      *(void *)((char *)v79 + 4) = 0;
      int v15 = 0;
      LODWORD(v79[0]) = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      int v13 = 1;
      LODWORD(v79[2]) = 1;
      goto LABEL_7;
    }
    int v35 = 1;
  }
  else
  {
    uint64_t v71 = 0;
    int v35 = 0;
  }
  v3 = [(CTLazuliChatBotInformation *)self color];
  HIDWORD(v79[0]) = v3 == 0;
  v63 = v3;
  LODWORD(v79[2]) = v35;
  if (v3 || ([v7 color], (uint64_t v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = [(CTLazuliChatBotInformation *)self color];
    v59 = [v7 color];
    v60 = v36;
    int v37 = [v36 isEqualToString:v59];
    uint64_t v10 = 1;
    if (!v37)
    {
      v62 = (void *)v32;
      v12 = (void *)v9;
      int v15 = 0;
      LODWORD(v79[0]) = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      int v13 = 1;
      int v14 = 1;
      LODWORD(v79[1]) = 1;
      goto LABEL_7;
    }
    LODWORD(v79[1]) = 1;
  }
  else
  {
    LODWORD(v79[1]) = 0;
  }
  v62 = (void *)v32;
  uint64_t v38 = [(CTLazuliChatBotInformation *)self backgroundImage];
  LODWORD(v79[0]) = v38 == 0;
  v58 = (void *)v38;
  if (v38 || ([v7 backgroundImage], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v64 = (void *)v10;
    v61 = [(CTLazuliChatBotInformation *)self backgroundImage];
    v57 = [v7 backgroundImage];
    uint64_t v10 = 1;
    if (![v61 isEqualToString:v57])
    {
      v12 = (void *)v9;
      int v17 = 0;
      BOOL v18 = 0;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      goto LABEL_7;
    }
    int v16 = 1;
    v39 = v64;
  }
  else
  {
    v39 = 0;
    int v16 = 0;
  }
  v64 = v39;
  uint64_t v40 = [(CTLazuliChatBotInformation *)self website];
  BOOL v18 = v40 == 0;
  v56 = (void *)v40;
  if (v40 || ([v7 website], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v55 = (void *)v10;
    v3 = [(CTLazuliChatBotInformation *)self website];
    [v7 website];
    v54 = v53 = v3;
    LODWORD(v10) = 1;
    if (!objc_msgSend(v3, "isEqual:"))
    {
      v12 = (void *)v9;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v17 = 1;
LABEL_7:
      char v77 = 0;
      int v19 = v10;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_79;
    }
  }
  else
  {
    v55 = 0;
  }
  v41 = [(CTLazuliChatBotInformation *)self tcPageUrl];
  if (!v41)
  {
    v49 = [v7 tcPageUrl];
    if (!v49)
    {
      v51 = 0;
      v49 = 0;
      int v78 = 0;
      goto LABEL_64;
    }
  }
  v42 = [(CTLazuliChatBotInformation *)self tcPageUrl];
  v52 = [v7 tcPageUrl];
  if (objc_msgSend(v42, "isEqual:"))
  {
    v48 = v42;
    v51 = v41;
    int v78 = 1;
LABEL_64:
    v50 = [(CTLazuliChatBotInformation *)self addresses];
    if (v50 || ([v7 addresses], (uint64_t v47 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v44 = [(CTLazuliChatBotInformation *)self addresses];
      v45 = [v7 addresses];
      char v43 = [v44 isEqualToCTLazuliChatBotAddressEntryList:v45];

      if (v50)
      {

        if (v78)
        {
LABEL_68:
          v41 = v51;
          v42 = v48;
          goto LABEL_69;
        }
LABEL_75:
        v41 = v51;
        v3 = v53;
        char v77 = v43;
        if (v51) {
          goto LABEL_76;
        }
        goto LABEL_77;
      }
      v46 = (void *)v47;
    }
    else
    {
      v46 = 0;
      char v43 = 1;
    }

    if (v78) {
      goto LABEL_68;
    }
    goto LABEL_75;
  }
  char v43 = 0;
LABEL_69:

  char v77 = v43;
  if (v41)
  {
    v3 = v53;
LABEL_76:
    v12 = (void *)v9;
    goto LABEL_78;
  }
  v3 = v53;
LABEL_77:
  v12 = (void *)v9;

LABEL_78:
  int v17 = 1;
  int v15 = 1;
  int v14 = 1;
  int v13 = 1;
  int v19 = 1;
  if (v10)
  {
LABEL_8:

    if (!v18) {
      goto LABEL_9;
    }
    goto LABEL_80;
  }
LABEL_79:
  if (!v18)
  {
LABEL_9:
    if (v17) {
      goto LABEL_10;
    }
    goto LABEL_81;
  }
LABEL_80:

  if (v17)
  {
LABEL_10:

    v20 = v74;
    v21 = (void *)v71;
    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_82;
  }
LABEL_81:
  v20 = v74;
  v21 = (void *)v71;
  if (!v16)
  {
LABEL_11:
    if (LODWORD(v79[0])) {
      goto LABEL_12;
    }
    goto LABEL_83;
  }
LABEL_82:

  if (v79[0])
  {
LABEL_12:

    v22 = (void *)v72;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_84;
  }
LABEL_83:
  v22 = (void *)v72;
  if (!v15)
  {
LABEL_13:
    if (LODWORD(v79[1])) {
      goto LABEL_14;
    }
    goto LABEL_85;
  }
LABEL_84:

  if (v79[1])
  {
LABEL_14:

    if ((v79[0] & 0x100000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_86;
  }
LABEL_85:
  if (!HIDWORD(v79[0]))
  {
LABEL_15:
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_87;
  }
LABEL_86:

  if (v14)
  {
LABEL_16:

    if ((v79[2] & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_88;
  }
LABEL_87:
  if (!LODWORD(v79[2]))
  {
LABEL_17:
    v23 = v73;
    if (HIDWORD(v79[1])) {
      goto LABEL_18;
    }
    goto LABEL_89;
  }
LABEL_88:

  v23 = v73;
  if ((v79[1] & 0x100000000) != 0)
  {
LABEL_18:

    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_90;
  }
LABEL_89:
  if (!v13)
  {
LABEL_19:
    if (LODWORD(v79[3])) {
      goto LABEL_20;
    }
    goto LABEL_91;
  }
LABEL_90:

  if (v79[3])
  {
LABEL_20:

    v24 = v83;
    if ((v79[2] & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_92;
  }
LABEL_91:
  v24 = v83;
  if (!HIDWORD(v79[2]))
  {
LABEL_21:
    if (v19) {
      goto LABEL_22;
    }
    goto LABEL_93;
  }
LABEL_92:

  if (v19)
  {
LABEL_22:

    if ((v81 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_94;
  }
LABEL_93:
  if (!v81)
  {
LABEL_23:
    v25 = v82;
    v26 = v75;
    v27 = v76;
    int v28 = v80;
    BOOL v29 = v77;
    if (!HIDWORD(v79[3])) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_94:

  v25 = v82;
  v26 = v75;
  v27 = v76;
  int v28 = v80;
  BOOL v29 = v77;
  if ((v79[3] & 0x100000000) != 0) {
LABEL_24:
  }

LABEL_25:
  if (v28) {

  }
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CTLazuliChatBotInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotInformation *)self isEqualToCTLazuliChatBotInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CTLazuliChatBotInformation allocWithZone:a3];
  [(CTLazuliChatBotInformation *)v4 setPcc:self->_pcc];
  [(CTLazuliChatBotInformation *)v4 setVersion:self->_version];
  [(CTLazuliChatBotInformation *)v4 setProvider:self->_provider];
  [(CTLazuliChatBotInformation *)v4 setEmail:self->_email];
  [(CTLazuliChatBotInformation *)v4 setColor:self->_color];
  [(CTLazuliChatBotInformation *)v4 setBackgroundImage:self->_backgroundImage];
  [(CTLazuliChatBotInformation *)v4 setWebsite:self->_website];
  [(CTLazuliChatBotInformation *)v4 setTcPageUrl:self->_tcPageUrl];
  [(CTLazuliChatBotInformation *)v4 setAddresses:self->_addresses];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_pcc forKey:@"kPccKey"];
  [v4 encodeObject:self->_version forKey:@"kVersionKey"];
  [v4 encodeObject:self->_provider forKey:@"kProviderKey"];
  [v4 encodeObject:self->_email forKey:@"kEmailKey"];
  [v4 encodeObject:self->_color forKey:@"kColorKey"];
  [v4 encodeObject:self->_backgroundImage forKey:@"kBackgroundImageKey"];
  [v4 encodeObject:self->_website forKey:@"kWebsiteKey"];
  [v4 encodeObject:self->_tcPageUrl forKey:@"kTcPageUrlKey"];
  [v4 encodeObject:self->_addresses forKey:@"kAddressesKey"];
}

- (CTLazuliChatBotInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTLazuliChatBotInformation;
  v5 = [(CTLazuliChatBotInformation *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPccKey"];
    pcc = v5->_pcc;
    v5->_pcc = (CTLazuliChatBotPCC *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVersionKey"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kProviderKey"];
    provider = v5->_provider;
    v5->_provider = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kEmailKey"];
    email = v5->_email;
    v5->_email = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kColorKey"];
    color = v5->_color;
    v5->_color = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBackgroundImageKey"];
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kWebsiteKey"];
    website = v5->_website;
    v5->_website = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTcPageUrlKey"];
    tcPageUrl = v5->_tcPageUrl;
    v5->_tcPageUrl = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAddressesKey"];
    addresses = v5->_addresses;
    v5->_addresses = (CTLazuliChatBotAddressEntryList *)v22;
  }
  return v5;
}

- (CTLazuliChatBotInformation)initWithReflection:(const void *)a3
{
  v44.receiver = self;
  v44.super_class = (Class)CTLazuliChatBotInformation;
  id v4 = [(CTLazuliChatBotInformation *)&v44 init];
  if (!v4) {
    return v4;
  }
  v5 = [[CTLazuliChatBotPCC alloc] initWithReflection:a3];
  pcc = v4->_pcc;
  v4->_pcc = v5;

  if (*((unsigned char *)a3 + 336))
  {
    if (*((char *)a3 + 335) >= 0) {
      id v7 = (char *)a3 + 312;
    }
    else {
      id v7 = (char *)*((void *)a3 + 39);
    }
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    version = v4->_version;
    v4->_version = (NSString *)v8;
  }
  else
  {
    version = v4->_version;
    v4->_version = 0;
  }

  if (*((unsigned char *)a3 + 368))
  {
    if (*((char *)a3 + 367) >= 0) {
      uint64_t v10 = (char *)a3 + 344;
    }
    else {
      uint64_t v10 = (char *)*((void *)a3 + 43);
    }
    uint64_t v11 = [NSString stringWithUTF8String:v10];
    provider = v4->_provider;
    v4->_provider = (NSString *)v11;
  }
  else
  {
    provider = v4->_provider;
    v4->_provider = 0;
  }

  if (*((unsigned char *)a3 + 400))
  {
    if (*((char *)a3 + 399) >= 0) {
      int v13 = (char *)a3 + 376;
    }
    else {
      int v13 = (char *)*((void *)a3 + 47);
    }
    uint64_t v14 = [NSString stringWithUTF8String:v13];
    email = v4->_email;
    v4->_email = (NSString *)v14;
  }
  else
  {
    email = v4->_email;
    v4->_email = 0;
  }

  if (*((unsigned char *)a3 + 432))
  {
    if (*((char *)a3 + 431) >= 0) {
      uint64_t v16 = (char *)a3 + 408;
    }
    else {
      uint64_t v16 = (char *)*((void *)a3 + 51);
    }
    uint64_t v17 = [NSString stringWithUTF8String:v16];
    color = v4->_color;
    v4->_color = (NSString *)v17;
  }
  else
  {
    color = v4->_color;
    v4->_color = 0;
  }

  if (*((unsigned char *)a3 + 464))
  {
    if (*((char *)a3 + 463) >= 0) {
      int v19 = (char *)a3 + 440;
    }
    else {
      int v19 = (char *)*((void *)a3 + 55);
    }
    uint64_t v20 = [NSString stringWithUTF8String:v19];
    backgroundImage = v4->_backgroundImage;
    v4->_backgroundImage = (NSString *)v20;
  }
  else
  {
    backgroundImage = v4->_backgroundImage;
    v4->_backgroundImage = 0;
  }

  if (*((unsigned char *)a3 + 496))
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
    v23 = NSString;
    int v24 = *((char *)a3 + 495);
    objc_super v25 = (char *)*((void *)a3 + 59);
    uint64_t v26 = [NSString defaultCStringEncoding];
    if (v24 >= 0) {
      v27 = (char *)a3 + 472;
    }
    else {
      v27 = v25;
    }
    int v28 = [v23 stringWithCString:v27 encoding:v26];
    uint64_t v29 = [v22 URLWithString:v28];
    website = v4->_website;
    v4->_website = (NSURL *)v29;
  }
  else
  {
    int v28 = v4->_website;
    v4->_website = 0;
  }

  if (*((unsigned char *)a3 + 528))
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v32 = NSString;
    int v33 = *((char *)a3 + 527);
    int v34 = (char *)*((void *)a3 + 63);
    uint64_t v35 = [NSString defaultCStringEncoding];
    if (v33 >= 0) {
      v36 = (char *)a3 + 504;
    }
    else {
      v36 = v34;
    }
    int v37 = [v32 stringWithCString:v36 encoding:v35];
    uint64_t v38 = [v31 URLWithString:v37];
    tcPageUrl = v4->_tcPageUrl;
    v4->_tcPageUrl = (NSURL *)v38;
  }
  else
  {
    int v37 = v4->_tcPageUrl;
    v4->_tcPageUrl = 0;
  }

  if (!*((unsigned char *)a3 + 560))
  {
    addresses = v4->_addresses;
    v4->_addresses = 0;
    goto LABEL_48;
  }
  uint64_t v40 = [CTLazuliChatBotAddressEntryList alloc];
  if (*((unsigned char *)a3 + 560))
  {
    uint64_t v41 = [(CTLazuliChatBotAddressEntryList *)v40 initWithReflection:(char *)a3 + 536];
    addresses = v4->_addresses;
    v4->_addresses = (CTLazuliChatBotAddressEntryList *)v41;
LABEL_48:

    return v4;
  }
  result = (CTLazuliChatBotInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotPCC)pcc
{
  return self->_pcc;
}

- (void)setPcc:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (NSURL)website
{
  return self->_website;
}

- (void)setWebsite:(id)a3
{
}

- (NSURL)tcPageUrl
{
  return self->_tcPageUrl;
}

- (void)setTcPageUrl:(id)a3
{
}

- (CTLazuliChatBotAddressEntryList)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_tcPageUrl, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_pcc, 0);
}

@end