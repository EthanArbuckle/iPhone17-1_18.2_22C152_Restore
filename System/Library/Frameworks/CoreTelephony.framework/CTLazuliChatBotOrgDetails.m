@interface CTLazuliChatBotOrgDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotOrgDetails:(id)a3;
- (CTLazuliChatBotCategoryList)categoryList;
- (CTLazuliChatBotCommunicationAddress)communicationAddress;
- (CTLazuliChatBotMediaList)mediaList;
- (CTLazuliChatBotOrgDescription)orgDescription;
- (CTLazuliChatBotOrgDetails)initWithCoder:(id)a3;
- (CTLazuliChatBotOrgDetails)initWithReflection:(const void *)a3;
- (CTLazuliChatBotOrgName)orgName;
- (CTLazuliChatBotWebResources)webResources;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryList:(id)a3;
- (void)setCommunicationAddress:(id)a3;
- (void)setMediaList:(id)a3;
- (void)setOrgDescription:(id)a3;
- (void)setOrgName:(id)a3;
- (void)setWebResources:(id)a3;
@end

@implementation CTLazuliChatBotOrgDetails

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotOrgDetails *)self communicationAddress];
  [v3 appendFormat:@", communicationAddress = %@", v4];

  v5 = [(CTLazuliChatBotOrgDetails *)self mediaList];
  [v3 appendFormat:@", mediaList = %@", v5];

  v6 = [(CTLazuliChatBotOrgDetails *)self orgName];
  [v3 appendFormat:@", orgName = %@", v6];

  v7 = [(CTLazuliChatBotOrgDetails *)self orgDescription];
  [v3 appendFormat:@", orgDescription = %@", v7];

  v8 = [(CTLazuliChatBotOrgDetails *)self categoryList];
  [v3 appendFormat:@", categoryList = %@", v8];

  v9 = [(CTLazuliChatBotOrgDetails *)self webResources];
  [v3 appendFormat:@", webResources = %@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgDetails:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliChatBotOrgDetails *)self communicationAddress];
  if (v8 || ([v7 communicationAddress], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliChatBotOrgDetails *)self communicationAddress];
    v4 = [v7 communicationAddress];
    if (([v3 isEqualToCTLazuliChatBotCommunicationAddress:v4] & 1) == 0)
    {

      char v9 = 0;
      goto LABEL_56;
    }
    int v36 = 1;
  }
  else
  {
    v35 = 0;
    int v36 = 0;
  }
  v10 = [(CTLazuliChatBotOrgDetails *)self mediaList];
  if (v10 || ([v7 mediaList], (v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v37 = [(CTLazuliChatBotOrgDetails *)self mediaList];
    v5 = [v7 mediaList];
    if (([v37 isEqualToCTLazuliChatBotMediaList:v5] & 1) == 0)
    {

      if (v10) {
      else
      }

      char v9 = 0;
      if ((v36 & 1) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
    int v33 = 1;
  }
  else
  {
    v31 = 0;
    int v33 = 0;
  }
  v11 = [(CTLazuliChatBotOrgDetails *)self orgName];
  if (v11 || ([v7 orgName], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = [(CTLazuliChatBotOrgDetails *)self orgName];
    v32 = [v7 orgName];
    if (!objc_msgSend(v34, "isEqualToCTLazuliChatBotOrgName:"))
    {
      char v9 = 0;
LABEL_47:

      goto LABEL_48;
    }
    int v28 = 1;
  }
  else
  {
    v26 = 0;
    int v28 = 0;
  }
  v29 = [(CTLazuliChatBotOrgDetails *)self orgDescription];
  if (v29 || ([v7 orgDescription], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = [(CTLazuliChatBotOrgDetails *)self orgDescription];
    v27 = [v7 orgDescription];
    if (!objc_msgSend(v30, "isEqualToCTLazuliChatBotOrgDescription:"))
    {
      char v9 = 0;
LABEL_43:

      goto LABEL_44;
    }
    int v23 = 1;
  }
  else
  {
    v21 = 0;
    int v23 = 0;
  }
  v24 = [(CTLazuliChatBotOrgDetails *)self categoryList];
  if (v24 || ([v7 categoryList], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v25 = [(CTLazuliChatBotOrgDetails *)self categoryList];
    v22 = [v7 categoryList];
    if (!objc_msgSend(v25, "isEqualToCTLazuliChatBotCategoryList:"))
    {
      char v9 = 0;
      goto LABEL_39;
    }
    int v20 = 1;
  }
  else
  {
    v18 = 0;
    int v20 = 0;
  }
  v19 = [(CTLazuliChatBotOrgDetails *)self webResources];
  if (v19 || ([v7 webResources], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(CTLazuliChatBotOrgDetails *)self webResources];
    v13 = [v7 webResources];
    char v9 = [v12 isEqualToCTLazuliChatBotWebResources:v13];

    if (v19)
    {

      if (!v20) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v15 = v17;
  }
  else
  {
    v15 = 0;
    char v9 = 1;
  }

  if (v20)
  {
LABEL_39:
  }
LABEL_40:
  if (!v24) {

  }
  if (v23) {
    goto LABEL_43;
  }
LABEL_44:
  if (!v29) {

  }
  if (v28) {
    goto LABEL_47;
  }
LABEL_48:
  if (!v11) {

  }
  if (v33)
  {
  }
  if (!v10) {

  }
  if (v36)
  {
LABEL_55:
  }
LABEL_56:
  if (!v8) {

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotOrgDetails *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotOrgDetails *)self isEqualToCTLazuliChatBotOrgDetails:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotOrgDetails allocWithZone:a3];
  [(CTLazuliChatBotOrgDetails *)v4 setCommunicationAddress:self->_communicationAddress];
  [(CTLazuliChatBotOrgDetails *)v4 setMediaList:self->_mediaList];
  [(CTLazuliChatBotOrgDetails *)v4 setOrgName:self->_orgName];
  [(CTLazuliChatBotOrgDetails *)v4 setOrgDescription:self->_orgDescription];
  [(CTLazuliChatBotOrgDetails *)v4 setCategoryList:self->_categoryList];
  [(CTLazuliChatBotOrgDetails *)v4 setWebResources:self->_webResources];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_communicationAddress forKey:@"kCommunicationAddressKey"];
  [v4 encodeObject:self->_mediaList forKey:@"kMediaListKey"];
  [v4 encodeObject:self->_orgName forKey:@"kOrgNameKey"];
  [v4 encodeObject:self->_orgDescription forKey:@"kOrgDescriptionKey"];
  [v4 encodeObject:self->_categoryList forKey:@"kCategoryListKey"];
  [v4 encodeObject:self->_webResources forKey:@"kWebResourcesKey"];
}

- (CTLazuliChatBotOrgDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTLazuliChatBotOrgDetails;
  v5 = [(CTLazuliChatBotOrgDetails *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCommunicationAddressKey"];
    communicationAddress = v5->_communicationAddress;
    v5->_communicationAddress = (CTLazuliChatBotCommunicationAddress *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaListKey"];
    mediaList = v5->_mediaList;
    v5->_mediaList = (CTLazuliChatBotMediaList *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOrgNameKey"];
    orgName = v5->_orgName;
    v5->_orgName = (CTLazuliChatBotOrgName *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOrgDescriptionKey"];
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (CTLazuliChatBotOrgDescription *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCategoryListKey"];
    categoryList = v5->_categoryList;
    v5->_categoryList = (CTLazuliChatBotCategoryList *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kWebResourcesKey"];
    webResources = v5->_webResources;
    v5->_webResources = (CTLazuliChatBotWebResources *)v16;
  }
  return v5;
}

- (CTLazuliChatBotOrgDetails)initWithReflection:(const void *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CTLazuliChatBotOrgDetails;
  id v4 = [(CTLazuliChatBotOrgDetails *)&v25 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (*((unsigned char *)a3 + 96))
  {
    uint64_t v6 = [CTLazuliChatBotCommunicationAddress alloc];
    if (!*((unsigned char *)a3 + 96)) {
      goto LABEL_28;
    }
    uint64_t v7 = [(CTLazuliChatBotCommunicationAddress *)v6 initWithReflection:a3];
    communicationAddress = v5->_communicationAddress;
    v5->_communicationAddress = (CTLazuliChatBotCommunicationAddress *)v7;
  }
  else
  {
    communicationAddress = v4->_communicationAddress;
    v4->_communicationAddress = 0;
  }

  if (*((unsigned char *)a3 + 128))
  {
    char v9 = [CTLazuliChatBotMediaList alloc];
    if (!*((unsigned char *)a3 + 128)) {
      goto LABEL_28;
    }
    uint64_t v10 = [(CTLazuliChatBotMediaList *)v9 initWithReflection:(char *)a3 + 104];
    mediaList = v5->_mediaList;
    v5->_mediaList = (CTLazuliChatBotMediaList *)v10;
  }
  else
  {
    mediaList = v5->_mediaList;
    v5->_mediaList = 0;
  }

  if (*((unsigned char *)a3 + 160))
  {
    uint64_t v12 = [CTLazuliChatBotOrgName alloc];
    if (!*((unsigned char *)a3 + 160)) {
      goto LABEL_28;
    }
    uint64_t v13 = [(CTLazuliChatBotOrgName *)v12 initWithReflection:(char *)a3 + 136];
    orgName = v5->_orgName;
    v5->_orgName = (CTLazuliChatBotOrgName *)v13;
  }
  else
  {
    orgName = v5->_orgName;
    v5->_orgName = 0;
  }

  if (*((unsigned char *)a3 + 200))
  {
    v15 = [CTLazuliChatBotOrgDescription alloc];
    if (!*((unsigned char *)a3 + 200)) {
      goto LABEL_28;
    }
    uint64_t v16 = [(CTLazuliChatBotOrgDescription *)v15 initWithReflection:(char *)a3 + 168];
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (CTLazuliChatBotOrgDescription *)v16;
  }
  else
  {
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = 0;
  }

  if (*((unsigned char *)a3 + 232))
  {
    v18 = [CTLazuliChatBotCategoryList alloc];
    if (!*((unsigned char *)a3 + 232)) {
      goto LABEL_28;
    }
    uint64_t v19 = [(CTLazuliChatBotCategoryList *)v18 initWithReflection:(char *)a3 + 208];
    categoryList = v5->_categoryList;
    v5->_categoryList = (CTLazuliChatBotCategoryList *)v19;
  }
  else
  {
    categoryList = v5->_categoryList;
    v5->_categoryList = 0;
  }

  if (!*((unsigned char *)a3 + 264))
  {
    webResources = v5->_webResources;
    v5->_webResources = 0;
    goto LABEL_26;
  }
  v21 = [CTLazuliChatBotWebResources alloc];
  if (*((unsigned char *)a3 + 264))
  {
    uint64_t v22 = [(CTLazuliChatBotWebResources *)v21 initWithReflection:(char *)a3 + 240];
    webResources = v5->_webResources;
    v5->_webResources = (CTLazuliChatBotWebResources *)v22;
LABEL_26:

    return v5;
  }
LABEL_28:
  result = (CTLazuliChatBotOrgDetails *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCommunicationAddress)communicationAddress
{
  return self->_communicationAddress;
}

- (void)setCommunicationAddress:(id)a3
{
}

- (CTLazuliChatBotMediaList)mediaList
{
  return self->_mediaList;
}

- (void)setMediaList:(id)a3
{
}

- (CTLazuliChatBotOrgName)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
}

- (CTLazuliChatBotOrgDescription)orgDescription
{
  return self->_orgDescription;
}

- (void)setOrgDescription:(id)a3
{
}

- (CTLazuliChatBotCategoryList)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
}

- (CTLazuliChatBotWebResources)webResources
{
  return self->_webResources;
}

- (void)setWebResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webResources, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_orgDescription, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_mediaList, 0);

  objc_storeStrong((id *)&self->_communicationAddress, 0);
}

@end