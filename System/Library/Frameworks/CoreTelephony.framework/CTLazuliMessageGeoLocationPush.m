@interface CTLazuliMessageGeoLocationPush
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageGeoLocationPush:(id)a3;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliLocationCoordinates)coordinates;
- (CTLazuliMessageGeoLocationPush)initWithCoder:(id)a3;
- (CTLazuliMessageGeoLocationPush)initWithReflection:(const void *)a3;
- (NSString)additionalDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalDescription:(id)a3;
- (void)setChipList:(id)a3;
- (void)setCoordinates:(id)a3;
- (void)setMetaData:(id)a3;
@end

@implementation CTLazuliMessageGeoLocationPush

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageGeoLocationPush *)self coordinates];
  [v3 appendFormat:@", coordinates = %@", v4];

  v5 = [(CTLazuliMessageGeoLocationPush *)self additionalDescription];
  [v3 appendFormat:@", additionalDescription = %@", v5];

  v6 = [(CTLazuliMessageGeoLocationPush *)self chipList];
  [v3 appendFormat:@", chipList = %@", v6];

  v7 = [(CTLazuliMessageGeoLocationPush *)self metaData];
  [v3 appendFormat:@", metaData = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGeoLocationPush:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageGeoLocationPush *)self coordinates];
  v7 = [v5 coordinates];
  if (![v6 isEqualToCTLazuliLocationCoordinates:v7])
  {
    char v9 = 0;
    goto LABEL_27;
  }
  v8 = [(CTLazuliMessageGeoLocationPush *)self additionalDescription];
  if (!v8)
  {
    v20 = [v5 additionalDescription];
    if (!v20)
    {
      v20 = 0;
      int v21 = 0;
      goto LABEL_9;
    }
  }
  v24 = [(CTLazuliMessageGeoLocationPush *)self additionalDescription];
  v23 = [v5 additionalDescription];
  if (objc_msgSend(v24, "isEqualToString:"))
  {
    int v21 = 1;
LABEL_9:
    v10 = [(CTLazuliMessageGeoLocationPush *)self chipList];
    if (v10 || ([v5 chipList], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = [(CTLazuliMessageGeoLocationPush *)self chipList];
      v3 = [v5 chipList];
      if (![v22 isEqualToCTLazuliChatBotSuggestedChipList:v3])
      {
        char v9 = 0;
        goto LABEL_19;
      }
      int v19 = 1;
    }
    else
    {
      v18 = 0;
      int v19 = 0;
    }
    v11 = [(CTLazuliMessageGeoLocationPush *)self metaData];
    if (v11 || ([v5 metaData], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(CTLazuliMessageGeoLocationPush *)self metaData];
      v13 = [v5 metaData];
      char v9 = [v12 isEqualToCTLazuliCustomMetaData:v13];

      if (v11)
      {

        if (!v19)
        {
LABEL_20:
          if (!v10) {

          }
          if (v21)
          {
          }
          goto LABEL_24;
        }
LABEL_19:

        goto LABEL_20;
      }
      v15 = v17;
    }
    else
    {
      v15 = 0;
      char v9 = 1;
    }

    if ((v19 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  char v9 = 0;
LABEL_24:
  if (!v8) {

  }
LABEL_27:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliMessageGeoLocationPush *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageGeoLocationPush *)self isEqualToCTLazuliMessageGeoLocationPush:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageGeoLocationPush allocWithZone:a3];
  [(CTLazuliMessageGeoLocationPush *)v4 setCoordinates:self->_coordinates];
  [(CTLazuliMessageGeoLocationPush *)v4 setAdditionalDescription:self->_additionalDescription];
  [(CTLazuliMessageGeoLocationPush *)v4 setChipList:self->_chipList];
  [(CTLazuliMessageGeoLocationPush *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_coordinates forKey:@"kCoordinatesKey"];
  [v4 encodeObject:self->_additionalDescription forKey:@"kAdditionalDescriptionKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliMessageGeoLocationPush)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageGeoLocationPush;
  id v5 = [(CTLazuliMessageGeoLocationPush *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoordinatesKey"];
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliLocationCoordinates *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAdditionalDescriptionKey"];
    additionalDescription = v5->_additionalDescription;
    v5->_additionalDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v12;
  }
  return v5;
}

- (CTLazuliMessageGeoLocationPush)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliMessageGeoLocationPush;
  id v4 = [(CTLazuliMessageGeoLocationPush *)&v17 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliLocationCoordinates alloc] initWithReflection:a3];
  coordinates = v4->_coordinates;
  v4->_coordinates = v5;

  if (*((unsigned char *)a3 + 40))
  {
    if (*((char *)a3 + 39) >= 0) {
      v7 = (char *)a3 + 16;
    }
    else {
      v7 = (char *)*((void *)a3 + 2);
    }
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    additionalDescription = v4->_additionalDescription;
    v4->_additionalDescription = (NSString *)v8;
  }
  else
  {
    additionalDescription = v4->_additionalDescription;
    v4->_additionalDescription = 0;
  }

  if (*((unsigned char *)a3 + 72))
  {
    uint64_t v10 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((unsigned char *)a3 + 72)) {
      goto LABEL_18;
    }
    uint64_t v11 = [(CTLazuliChatBotSuggestedChipList *)v10 initWithReflection:(char *)a3 + 48];
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v11;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((unsigned char *)a3 + 104))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_16;
  }
  v13 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 104))
  {
    uint64_t v14 = [(CTLazuliCustomMetaData *)v13 initWithReflection:(char *)a3 + 80];
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v14;
LABEL_16:

    return v4;
  }
LABEL_18:
  result = (CTLazuliMessageGeoLocationPush *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliLocationCoordinates)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
}

- (NSString)additionalDescription
{
  return self->_additionalDescription;
}

- (void)setAdditionalDescription:(id)a3
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
  objc_storeStrong((id *)&self->_additionalDescription, 0);

  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end