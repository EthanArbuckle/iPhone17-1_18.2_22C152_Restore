@interface CNUILikenessFingerprint
+ (id)fingerprintForContact:(id)a3;
+ (id)fingerprintForContactIdentifier:(id)a3;
+ (id)fingerprintForContacts:(id)a3 scope:(id)a4;
+ (id)fingerprintForData:(id)a3;
+ (id)fingerprintForScope:(id)a3;
+ (id)implForContact:(id)a3;
+ (id)publicFingerprintForContact:(id)a3;
+ (id)publicFingerprintForContacts:(id)a3 scope:(id)a4;
- (BOOL)hasContactIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNUILikenessFingerprint)initWithContact:(id)a3;
- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5;
- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5 isResolutionIndependent:(BOOL)a6;
- (CNUILikenessFingerprint)initWithImpl:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CNUILikenessFingerprint

uint64_t __62__CNUILikenessFingerprint_publicFingerprintForContacts_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) publicFingerprintForContact:a2];
}

- (unint64_t)hash
{
  return [(_CNUILikenessFingerprintImpl *)self->_impl hash];
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  v7 = v6;

  if (v7) {
    char v8 = [(_CNUILikenessFingerprintImpl *)self->_impl isEqual:v7[1]];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

id __49__CNUILikenessFingerprint_fingerprintForContact___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 stringValue];

  return v3;
}

id __81__CNUILikenessFingerprint_initWithContacts_badges_scope_isResolutionIndependent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() implForContact:v2];

  return v3;
}

- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5 isResolutionIndependent:(BOOL)a6
{
  BOOL v6 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__CNUILikenessFingerprint_initWithContacts_badges_scope_isResolutionIndependent___block_invoke;
  v18[3] = &unk_264017568;
  v10 = self;
  v19 = v10;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_msgSend(a3, "_cn_map:", v18);
  v14 = (void *)[v11 copy];

  [v14 setExcludePointSizeInEqualityCheck:v6];
  v15 = [[_CNUILikenessFingerprintGroupImpl alloc] initWithImpls:v13 scope:v14 badges:v12];

  v16 = [(CNUILikenessFingerprint *)v10 initWithImpl:v15];
  return v16;
}

- (CNUILikenessFingerprint)initWithImpl:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUILikenessFingerprint;
  BOOL v6 = [(CNUILikenessFingerprint *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    char v8 = v7;
  }

  return v7;
}

+ (id)implForContact:(id)a3
{
  id v3 = a3;
  if ([v3 hasBeenPersisted])
  {
    id v4 = [_CNUILikenessFingerprintPersistedContactImpl alloc];
    uint64_t v5 = [v3 identifier];

    BOOL v6 = [(_CNUILikenessFingerprintPersistedContactImpl *)v4 initWithContactIdentifier:v5];
    id v3 = (id)v5;
  }
  else
  {
    BOOL v6 = [[_CNUILikenessFingerprintNonpersistedContactImpl alloc] initWithContact:v3];
  }

  return v6;
}

+ (id)fingerprintForContact:(id)a3
{
  id v4 = a3;
  if ([v4 hasBeenPersisted])
  {
    uint64_t v5 = [v4 identifier];
    BOOL v6 = [a1 fingerprintForContactIdentifier:v5];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F089D8] string];
    v7 = [v4 givenName];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      v9 = [v4 givenName];
      [v6 appendString:v9];

      [v6 appendString:@";"];
    }
    objc_super v10 = [v4 middleName];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = [v4 middleName];
      [v6 appendString:v12];

      [v6 appendString:@";"];
    }
    v13 = [v4 familyName];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = [v4 familyName];
      [v6 appendString:v15];

      [v6 appendString:@";"];
    }
    v16 = [v4 emailAddresses];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v18 = [v4 emailAddresses];
      v19 = objc_msgSend(v18, "_cn_map:", &__block_literal_global_4);
      v20 = [v19 componentsJoinedByString:@";"];
      [v6 appendString:v20];

      [v6 appendString:@";"];
    }
    v21 = [v4 phoneNumbers];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      v23 = [v4 phoneNumbers];
      v24 = objc_msgSend(v23, "_cn_map:", &__block_literal_global_3);
      v25 = [v24 componentsJoinedByString:@";"];
      [v6 appendString:v25];

      [v6 appendString:@";"];
    }
    v26 = [v4 imageData];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      [v6 appendString:@"image:"];
      uint64_t v28 = [v4 imageData];
    }
    else
    {
      v29 = [v4 thumbnailImageData];
      uint64_t v30 = [v29 length];

      if (!v30) {
        goto LABEL_19;
      }
      [v6 appendString:@"thumbnail:"];
      uint64_t v28 = [v4 thumbnailImageData];
    }
    uint64_t v5 = (void *)v28;
    v31 = [a1 fingerprintForData:v28];
    [v6 appendString:v31];
  }
LABEL_19:

  return v6;
}

+ (id)fingerprintForContactIdentifier:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)publicFingerprintForContact:(id)a3
{
  id v4 = a3;
  if ([v4 hasBeenPersisted])
  {
    uint64_t v5 = [v4 identifier];
    BOOL v6 = [a1 fingerprintForContactIdentifier:v5];
    goto LABEL_9;
  }
  BOOL v6 = [MEMORY[0x263F089D8] string];
  v7 = [v4 imageData];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    [v6 appendString:@"image:"];
    uint64_t v9 = [v4 imageData];
  }
  else
  {
    objc_super v10 = [v4 thumbnailImageData];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      [v6 appendString:@"object:"];
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
      [v6 appendString:v15];

      [v6 appendString:@"identifier:"];
      v16 = NSString;
      uint64_t v5 = [v4 identifier];
      uint64_t v12 = [v16 stringWithFormat:@"%@", v5];
      goto LABEL_8;
    }
    [v6 appendString:@"thumbnail:"];
    uint64_t v9 = [v4 thumbnailImageData];
  }
  uint64_t v5 = (void *)v9;
  uint64_t v12 = [a1 fingerprintForData:v9];
LABEL_8:
  v13 = (void *)v12;
  [v6 appendString:v12];

LABEL_9:
  return v6;
}

+ (id)publicFingerprintForContacts:(id)a3 scope:(id)a4
{
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CNUILikenessFingerprint_publicFingerprintForContacts_scope___block_invoke;
  v18[3] = &__block_descriptor_40_e29___NSString_16__0__CNContact_8l;
  void v18[4] = a1;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "_cn_map:", v18);
  uint64_t v9 = NSNumber;
  uint64_t v10 = [v7 count];

  uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v11 stringValue];
  v13 = [v8 arrayByAddingObject:v12];

  uint64_t v14 = [a1 fingerprintForScope:v6];

  v15 = [v13 arrayByAddingObject:v14];

  v16 = [v15 componentsJoinedByString:&stru_26BFC7668];

  return v16;
}

+ (id)fingerprintForScope:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 style];
  uint64_t v6 = [v4 backgroundStyle];
  [v4 scale];
  uint64_t v8 = v7;
  int v9 = [v4 rightToLeft];
  uint64_t v10 = [v4 maskedAvatarIndices];

  if (v10)
  {
    uint64_t v11 = objc_msgSend(v10, "_cn_map:", &__block_literal_global_230);
    uint64_t v12 = [v11 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v12 = &stru_26BFC7668;
  }
  v13 = @"RTL";
  if (!v9) {
    v13 = &stru_26BFC7668;
  }
  uint64_t v14 = [v3 stringWithFormat:@"%ld_%ld_@%.1f%@_[%@]", v5, v6, v8, v13, v12];

  return v14;
}

uint64_t __49__CNUILikenessFingerprint_fingerprintForContact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

+ (id)fingerprintForData:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
}

+ (id)fingerprintForContacts:(id)a3 scope:(id)a4
{
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__CNUILikenessFingerprint_fingerprintForContacts_scope___block_invoke;
  v18[3] = &__block_descriptor_40_e29___NSString_16__0__CNContact_8l;
  void v18[4] = a1;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "_cn_map:", v18);
  int v9 = NSNumber;
  uint64_t v10 = [v7 count];

  uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v11 stringValue];
  v13 = [v8 arrayByAddingObject:v12];

  uint64_t v14 = [a1 fingerprintForScope:v6];

  v15 = [v13 arrayByAddingObject:v14];

  v16 = [v15 componentsJoinedByString:&stru_26BFC7668];

  return v16;
}

uint64_t __56__CNUILikenessFingerprint_fingerprintForContacts_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fingerprintForContact:a2];
}

- (CNUILikenessFingerprint)initWithContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() implForContact:v4];

  id v6 = [(CNUILikenessFingerprint *)self initWithImpl:v5];
  return v6;
}

- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5
{
  return [(CNUILikenessFingerprint *)self initWithContacts:a3 badges:a4 scope:a5 isResolutionIndependent:1];
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return [(_CNUILikenessFingerprintImpl *)self->_impl hasContactIdentifier:a3];
}

- (id)description
{
  return (id)[(_CNUILikenessFingerprintImpl *)self->_impl description];
}

@end