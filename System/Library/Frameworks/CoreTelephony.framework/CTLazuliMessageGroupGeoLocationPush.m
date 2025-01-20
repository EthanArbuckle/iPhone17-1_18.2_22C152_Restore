@interface CTLazuliMessageGroupGeoLocationPush
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageGroupGeoLocationPush:(id)a3;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliGroupChatInformation)chatInformation;
- (CTLazuliLocationCoordinates)coordinates;
- (CTLazuliMessageGroupGeoLocationPush)initWithCoder:(id)a3;
- (CTLazuliMessageGroupGeoLocationPush)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChatInformation:(id)a3;
- (void)setCoordinates:(id)a3;
- (void)setMetaData:(id)a3;
@end

@implementation CTLazuliMessageGroupGeoLocationPush

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageGroupGeoLocationPush *)self chatInformation];
  [v3 appendFormat:@", chatInformation = %@", v4];

  v5 = [(CTLazuliMessageGroupGeoLocationPush *)self coordinates];
  [v3 appendFormat:@", coordinates = %@", v5];

  v6 = [(CTLazuliMessageGroupGeoLocationPush *)self metaData];
  [v3 appendFormat:@", metaData = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupGeoLocationPush:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliMessageGroupGeoLocationPush *)self chatInformation];
  v7 = [v5 chatInformation];
  if ([v6 isEqualToCTLazuliGroupChatInformation:v7])
  {
    v8 = [(CTLazuliMessageGroupGeoLocationPush *)self coordinates];
    v9 = [v5 coordinates];
    if (![v8 isEqualToCTLazuliLocationCoordinates:v9])
    {
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = [(CTLazuliMessageGroupGeoLocationPush *)self metaData];
    if (v10 || ([v5 metaData], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [(CTLazuliMessageGroupGeoLocationPush *)self metaData];
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
  v4 = (CTLazuliMessageGroupGeoLocationPush *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageGroupGeoLocationPush *)self isEqualToCTLazuliMessageGroupGeoLocationPush:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliMessageGroupGeoLocationPush allocWithZone:a3];
  [(CTLazuliMessageGroupGeoLocationPush *)v4 setChatInformation:self->_chatInformation];
  [(CTLazuliMessageGroupGeoLocationPush *)v4 setCoordinates:self->_coordinates];
  [(CTLazuliMessageGroupGeoLocationPush *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_chatInformation forKey:@"kChatInformationKey"];
  [v4 encodeObject:self->_coordinates forKey:@"kCoordinatesKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliMessageGroupGeoLocationPush)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupGeoLocationPush;
  id v5 = [(CTLazuliMessageGroupGeoLocationPush *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatInformationKey"];
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoordinatesKey"];
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliLocationCoordinates *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;
  }
  return v5;
}

- (CTLazuliMessageGroupGeoLocationPush)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupGeoLocationPush;
  id v4 = [(CTLazuliMessageGroupGeoLocationPush *)&v13 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliGroupChatInformation alloc] initWithReflection:a3];
  chatInformation = v4->_chatInformation;
  v4->_chatInformation = v5;

  v7 = [[CTLazuliLocationCoordinates alloc] initWithReflection:(char *)a3 + 320];
  coordinates = v4->_coordinates;
  v4->_coordinates = v7;

  if (!*((unsigned char *)a3 + 360))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_6;
  }
  v9 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 360))
  {
    uint64_t v10 = [(CTLazuliCustomMetaData *)v9 initWithReflection:(char *)a3 + 336];
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v10;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageGroupGeoLocationPush *)std::__throw_bad_optional_access[abi:nn180100]();
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

- (CTLazuliLocationCoordinates)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
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
  objc_storeStrong((id *)&self->_coordinates, 0);

  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end