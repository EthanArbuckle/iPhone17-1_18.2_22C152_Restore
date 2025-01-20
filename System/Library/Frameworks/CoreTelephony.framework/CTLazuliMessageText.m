@interface CTLazuliMessageText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageText:(id)a3;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliMessageText)initWithCoder:(id)a3;
- (CTLazuliMessageText)initWithReflection:(const void *)a3;
- (NSString)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChipList:(id)a3;
- (void)setContent:(id)a3;
- (void)setMetaData:(id)a3;
@end

@implementation CTLazuliMessageText

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageText *)self content];
  [v3 appendFormat:@", content = %@", v4];

  v5 = [(CTLazuliMessageText *)self chipList];
  [v3 appendFormat:@", chipList = %@", v5];

  v6 = [(CTLazuliMessageText *)self metaData];
  [v3 appendFormat:@", metaData = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageText:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliMessageText *)self content];
  v8 = [v6 content];
  if (![v7 isEqualToString:v8])
  {
    char v10 = 0;
    goto LABEL_17;
  }
  v9 = [(CTLazuliMessageText *)self chipList];
  if (v9 || ([v6 chipList], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliMessageText *)self chipList];
    v4 = [v6 chipList];
    if (([v3 isEqualToCTLazuliChatBotSuggestedChipList:v4] & 1) == 0)
    {

      char v10 = 0;
      goto LABEL_14;
    }
    int v18 = 1;
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  v11 = [(CTLazuliMessageText *)self metaData];
  if (!v11)
  {
    uint64_t v16 = [v6 metaData];
    if (!v16)
    {
      v15 = 0;
      char v10 = 1;
LABEL_20:

      if ((v18 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v12 = [(CTLazuliMessageText *)self metaData];
  v13 = [v6 metaData];
  char v10 = [v12 isEqualToCTLazuliCustomMetaData:v13];

  if (!v11)
  {
    v15 = (void *)v16;
    goto LABEL_20;
  }

  if (v18)
  {
LABEL_13:
  }
LABEL_14:
  if (!v9) {

  }
LABEL_17:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageText *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageText *)self isEqualToCTLazuliMessageText:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageText allocWithZone:a3];
  [(CTLazuliMessageText *)v4 setContent:self->_content];
  [(CTLazuliMessageText *)v4 setChipList:self->_chipList];
  [(CTLazuliMessageText *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_content forKey:@"kContentKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliMessageText)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageText;
  v5 = [(CTLazuliMessageText *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentKey"];
    content = v5->_content;
    v5->_content = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;
  }
  return v5;
}

- (CTLazuliMessageText)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageText;
  id v4 = [(CTLazuliMessageText *)&v15 init];
  if (!v4) {
    return v4;
  }
  if (*((char *)a3 + 23) >= 0) {
    v5 = a3;
  }
  else {
    v5 = *(const void **)a3;
  }
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  content = v4->_content;
  v4->_content = (NSString *)v6;

  if (*((unsigned char *)a3 + 48))
  {
    uint64_t v8 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_15;
    }
    uint64_t v9 = [(CTLazuliChatBotSuggestedChipList *)v8 initWithReflection:(char *)a3 + 24];
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v9;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((unsigned char *)a3 + 80))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_13;
  }
  v11 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 80))
  {
    uint64_t v12 = [(CTLazuliCustomMetaData *)v11 initWithReflection:(char *)a3 + 56];
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v12;
LABEL_13:

    return v4;
  }
LABEL_15:
  result = (CTLazuliMessageText *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
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
  objc_storeStrong((id *)&self->_chipList, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end