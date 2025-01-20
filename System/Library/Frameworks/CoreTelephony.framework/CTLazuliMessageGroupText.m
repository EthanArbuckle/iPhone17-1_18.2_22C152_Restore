@interface CTLazuliMessageGroupText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageGroupText:(id)a3;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliGroupChatInformation)chatInformation;
- (CTLazuliMessageGroupText)initWithCoder:(id)a3;
- (CTLazuliMessageGroupText)initWithReflection:(const void *)a3;
- (NSString)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChatInformation:(id)a3;
- (void)setContent:(id)a3;
- (void)setMetaData:(id)a3;
@end

@implementation CTLazuliMessageGroupText

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageGroupText *)self chatInformation];
  [v3 appendFormat:@", chatInformation = %@", v4];

  v5 = [(CTLazuliMessageGroupText *)self content];
  [v3 appendFormat:@", content = %@", v5];

  v6 = [(CTLazuliMessageGroupText *)self metaData];
  [v3 appendFormat:@", metaData = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupText:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageGroupText *)self chatInformation];
  v7 = [v5 chatInformation];
  if ([v6 isEqualToCTLazuliGroupChatInformation:v7])
  {
    v8 = [(CTLazuliMessageGroupText *)self content];
    v9 = [v5 content];
    if (![v8 isEqualToString:v9])
    {
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = [(CTLazuliMessageGroupText *)self metaData];
    if (v10 || ([v5 metaData], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [(CTLazuliMessageGroupText *)self metaData];
      v12 = [v5 metaData];
      char v13 = [v11 isEqualToCTLazuliCustomMetaData:v12];

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v13 = 1;
    }

    goto LABEL_11;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageGroupText *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageGroupText *)self isEqualToCTLazuliMessageGroupText:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageGroupText allocWithZone:a3];
  [(CTLazuliMessageGroupText *)v4 setChatInformation:self->_chatInformation];
  [(CTLazuliMessageGroupText *)v4 setContent:self->_content];
  [(CTLazuliMessageGroupText *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_chatInformation forKey:@"kChatInformationKey"];
  [v4 encodeObject:self->_content forKey:@"kContentKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliMessageGroupText)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupText;
  id v5 = [(CTLazuliMessageGroupText *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatInformationKey"];
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentKey"];
    content = v5->_content;
    v5->_content = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;
  }
  return v5;
}

- (CTLazuliMessageGroupText)initWithReflection:(const void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageGroupText;
  id v4 = [(CTLazuliMessageGroupText *)&v14 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliGroupChatInformation alloc] initWithReflection:a3];
  chatInformation = v4->_chatInformation;
  v4->_chatInformation = v5;

  if (*((char *)a3 + 343) >= 0) {
    v7 = (char *)a3 + 320;
  }
  else {
    v7 = (char *)*((void *)a3 + 40);
  }
  uint64_t v8 = [NSString stringWithUTF8String:v7];
  content = v4->_content;
  v4->_content = (NSString *)v8;

  if (!*((unsigned char *)a3 + 368))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_9;
  }
  uint64_t v10 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 368))
  {
    uint64_t v11 = [(CTLazuliCustomMetaData *)v10 initWithReflection:(char *)a3 + 344];
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v11;
LABEL_9:

    return v4;
  }
  result = (CTLazuliMessageGroupText *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chatInformation
{
  return self->_chatInformation;
}

- (void)setChatInformation:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (CTLazuliCustomMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end