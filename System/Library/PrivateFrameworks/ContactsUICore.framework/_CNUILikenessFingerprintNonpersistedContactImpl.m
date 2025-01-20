@interface _CNUILikenessFingerprintNonpersistedContactImpl
- (BOOL)hasContactIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSString)description;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSValue)imageDataPointer;
- (NSValue)thumbnailImageDataPointer;
- (_CNUILikenessFingerprintNonpersistedContactImpl)init;
- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithContact:(id)a3;
- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 imageData:(id)a8 thumbnailImageData:(id)a9;
- (unint64_t)hash;
@end

@implementation _CNUILikenessFingerprintNonpersistedContactImpl

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F335E8] objectHash:self->_givenName];
  uint64_t v4 = [MEMORY[0x263F335E8] objectHash:self->_middleName] - v3 + 32 * v3;
  uint64_t v5 = [MEMORY[0x263F335E8] objectHash:self->_familyName] - v4 + 32 * v4;
  uint64_t v6 = [MEMORY[0x263F335E8] arrayHash:self->_emailAddresses] - v5 + 32 * v5;
  uint64_t v7 = [MEMORY[0x263F335E8] arrayHash:self->_phoneNumbers] - v6 + 32 * v6;
  uint64_t v8 = [MEMORY[0x263F335E8] objectHash:self->_imageDataPointer] - v7 + 32 * v7;
  return [MEMORY[0x263F335E8] objectHash:self->_thumbnailImageDataPointer]
       - v8
       + 32 * v8
       + 0x6CE5F3FACFLL;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_CNUILikenessFingerprintNonpersistedContactImpl *)a3;
  if (self == v4) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  givenName = self->_givenName;
  if ((unint64_t)givenName | (unint64_t)v4->_givenName)
  {
    if (!-[NSString isEqual:](givenName, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (((middleName = self->_middleName, !((unint64_t)middleName | (unint64_t)v4->_middleName))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | (unint64_t)v4->_familyName))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((emailAddresses = self->_emailAddresses,
         !((unint64_t)emailAddresses | (unint64_t)v4->_emailAddresses))
     || -[NSArray isEqual:](emailAddresses, "isEqual:"))
    && ((phoneNumbers = self->_phoneNumbers, !((unint64_t)phoneNumbers | (unint64_t)v4->_phoneNumbers))
     || -[NSArray isEqual:](phoneNumbers, "isEqual:"))
    && ((imageDataPointer = self->_imageDataPointer,
         !((unint64_t)imageDataPointer | (unint64_t)v4->_imageDataPointer))
     || -[NSValue isEqual:](imageDataPointer, "isEqual:"))
    && ((thumbnailImageDataPointer = self->_thumbnailImageDataPointer,
         !((unint64_t)thumbnailImageDataPointer | (unint64_t)v4->_thumbnailImageDataPointer))
     || -[NSValue isEqual:](thumbnailImageDataPointer, "isEqual:")))
  {
LABEL_17:
    BOOL v12 = 1;
  }
  else
  {
LABEL_18:
    BOOL v12 = 0;
  }

  return v12;
}

- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 imageData:(id)a8 thumbnailImageData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)_CNUILikenessFingerprintNonpersistedContactImpl;
  v22 = [(_CNUILikenessFingerprintNonpersistedContactImpl *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    givenName = v22->_givenName;
    v22->_givenName = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    middleName = v22->_middleName;
    v22->_middleName = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    familyName = v22->_familyName;
    v22->_familyName = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    emailAddresses = v22->_emailAddresses;
    v22->_emailAddresses = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    phoneNumbers = v22->_phoneNumbers;
    v22->_phoneNumbers = (NSArray *)v31;

    if ([v20 length])
    {
      uint64_t v33 = [MEMORY[0x263F08D40] valueWithPointer:v20];
      imageDataPointer = v22->_imageDataPointer;
      v22->_imageDataPointer = (NSValue *)v33;
    }
    else
    {
      if (![v21 length])
      {
LABEL_7:
        v36 = v22;
        goto LABEL_8;
      }
      uint64_t v35 = [MEMORY[0x263F08D40] valueWithPointer:v21];
      imageDataPointer = v22->_thumbnailImageDataPointer;
      v22->_thumbnailImageDataPointer = (NSValue *)v35;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v22;
}

- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 givenName];
  uint64_t v5 = [v3 middleName];
  uint64_t v6 = [v3 familyName];
  uint64_t v7 = [v3 emailAddresses];
  uint64_t v8 = objc_msgSend(v7, "_cn_compactMap:", &__block_literal_global_130);
  v9 = [v3 phoneNumbers];
  v10 = objc_msgSend(v9, "_cn_compactMap:", &__block_literal_global_132);
  v11 = [v3 imageData];
  BOOL v12 = [v3 thumbnailImageData];

  v13 = [(_CNUILikenessFingerprintNonpersistedContactImpl *)self initWithGivenName:v4 middleName:v5 familyName:v6 emailAddresses:v8 phoneNumbers:v10 imageData:v11 thumbnailImageData:v12];
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageDataPointer, 0);
  objc_storeStrong((id *)&self->_imageDataPointer, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

- (_CNUILikenessFingerprintNonpersistedContactImpl)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  if ([(NSString *)self->_givenName length]) {
    id v4 = (id)[v3 appendName:@"givenName" object:self->_givenName];
  }
  if ([(NSString *)self->_middleName length]) {
    id v5 = (id)[v3 appendName:@"middleName" object:self->_middleName];
  }
  if ([(NSString *)self->_familyName length]) {
    id v6 = (id)[v3 appendName:@"familyName" object:self->_familyName];
  }
  if ([(NSArray *)self->_emailAddresses count])
  {
    uint64_t v7 = [(NSArray *)self->_emailAddresses componentsJoinedByString:@","];
    id v8 = (id)[v3 appendName:@"emailAddresses" object:v7];
  }
  if ([(NSArray *)self->_phoneNumbers count])
  {
    v9 = [(NSArray *)self->_phoneNumbers componentsJoinedByString:@","];
    id v10 = (id)[v3 appendName:@"phoneNumbers" object:v9];
  }
  if (self->_imageDataPointer) {
    id v11 = (id)objc_msgSend(v3, "appendName:object:", @"imageData");
  }
  if (self->_thumbnailImageDataPointer) {
    id v12 = (id)objc_msgSend(v3, "appendName:object:", @"thumbnailImageData");
  }
  v13 = [v3 build];

  return (NSString *)v13;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return 0;
}

- (NSString)givenName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)phoneNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSValue)imageDataPointer
{
  return (NSValue *)objc_getProperty(self, a2, 48, 1);
}

- (NSValue)thumbnailImageDataPointer
{
  return (NSValue *)objc_getProperty(self, a2, 56, 1);
}

@end