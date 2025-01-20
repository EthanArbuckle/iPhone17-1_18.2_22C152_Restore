@interface CTLazuliMessageFileTransferPush
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageFileTransferPush:(id)a3;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliFileTransferDescriptor)descriptor;
- (CTLazuliMessageFileTransferPush)initWithCoder:(id)a3;
- (CTLazuliMessageFileTransferPush)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChipList:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setMetaData:(id)a3;
@end

@implementation CTLazuliMessageFileTransferPush

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageFileTransferPush *)self descriptor];
  [v3 appendFormat:@", descriptor = %@", v4];

  v5 = [(CTLazuliMessageFileTransferPush *)self chipList];
  [v3 appendFormat:@", chipList = %@", v5];

  v6 = [(CTLazuliMessageFileTransferPush *)self metaData];
  [v3 appendFormat:@", metaData = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageFileTransferPush:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliMessageFileTransferPush *)self descriptor];
  v8 = [v6 descriptor];
  if (![v7 isEqualToCTLazuliFileTransferDescriptor:v8])
  {
    char v10 = 0;
    goto LABEL_17;
  }
  v9 = [(CTLazuliMessageFileTransferPush *)self chipList];
  if (v9 || ([v6 chipList], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliMessageFileTransferPush *)self chipList];
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
  v11 = [(CTLazuliMessageFileTransferPush *)self metaData];
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
  v12 = [(CTLazuliMessageFileTransferPush *)self metaData];
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
  v4 = (CTLazuliMessageFileTransferPush *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageFileTransferPush *)self isEqualToCTLazuliMessageFileTransferPush:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageFileTransferPush allocWithZone:a3];
  [(CTLazuliMessageFileTransferPush *)v4 setDescriptor:self->_descriptor];
  [(CTLazuliMessageFileTransferPush *)v4 setChipList:self->_chipList];
  [(CTLazuliMessageFileTransferPush *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_descriptor forKey:@"kDescriptorKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliMessageFileTransferPush)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageFileTransferPush;
  v5 = [(CTLazuliMessageFileTransferPush *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDescriptorKey"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (CTLazuliFileTransferDescriptor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;
  }
  return v5;
}

- (CTLazuliMessageFileTransferPush)initWithReflection:(const void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageFileTransferPush;
  id v4 = [(CTLazuliMessageFileTransferPush *)&v14 init];
  if (!v4) {
    return v4;
  }
  v5 = [[CTLazuliFileTransferDescriptor alloc] initWithReflection:a3];
  descriptor = v4->_descriptor;
  v4->_descriptor = v5;

  if (*((unsigned char *)a3 + 272))
  {
    v7 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((unsigned char *)a3 + 272)) {
      goto LABEL_12;
    }
    uint64_t v8 = [(CTLazuliChatBotSuggestedChipList *)v7 initWithReflection:(char *)a3 + 248];
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((unsigned char *)a3 + 304))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 304))
  {
    uint64_t v11 = [(CTLazuliCustomMetaData *)v10 initWithReflection:(char *)a3 + 280];
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v11;
LABEL_10:

    return v4;
  }
LABEL_12:
  result = (CTLazuliMessageFileTransferPush *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliFileTransferDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
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

  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end