@interface CRKASMConcreteNameComponents
+ (id)annotatedStringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5;
+ (id)makeFamilyNameGivenNameWithComponents:(id)a3;
+ (id)makeFullNameWithComponents:(id)a3;
+ (id)makeMonogramWithComponents:(id)a3;
+ (id)makeNameComponentsForPerson:(id)a3;
+ (id)makePhoneticFullNameWithComponents:(id)a3;
+ (id)sharedFormatter;
+ (id)stringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CRKASMConcreteNameComponents)initWithPerson:(id)a3;
- (NSAttributedString)attributedFullName;
- (NSString)description;
- (NSString)familyName;
- (NSString)fullName;
- (NSString)givenName;
- (NSString)monogram;
- (NSString)phoneticFamilyName;
- (NSString)phoneticFullName;
- (NSString)phoneticGivenName;
- (unint64_t)hash;
@end

@implementation CRKASMConcreteNameComponents

- (CRKASMConcreteNameComponents)initWithPerson:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRKASMConcreteNameComponents;
  v5 = [(CRKASMConcreteNameComponents *)&v30 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() makeNameComponentsForPerson:v4];
    v7 = [v6 givenName];
    uint64_t v8 = [v7 copy];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v8;

    v10 = [v6 phoneticRepresentation];
    v11 = [v10 givenName];
    uint64_t v12 = [v11 copy];
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v12;

    v14 = [v6 familyName];
    uint64_t v15 = [v14 copy];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v15;

    v17 = [v6 phoneticRepresentation];
    v18 = [v17 familyName];
    uint64_t v19 = [v18 copy];
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v19;

    uint64_t v21 = [(id)objc_opt_class() makeFullNameWithComponents:v6];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v21;

    uint64_t v23 = [(id)objc_opt_class() makePhoneticFullNameWithComponents:v6];
    phoneticFullName = v5->_phoneticFullName;
    v5->_phoneticFullName = (NSString *)v23;

    uint64_t v25 = [(id)objc_opt_class() makeMonogramWithComponents:v6];
    monogram = v5->_monogram;
    v5->_monogram = (NSString *)v25;

    uint64_t v27 = [(id)objc_opt_class() makeFamilyNameGivenNameWithComponents:v6];
    attributedFullName = v5->_attributedFullName;
    v5->_attributedFullName = (NSAttributedString *)v27;
  }
  return v5;
}

+ (id)makeNameComponentsForPerson:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 givenName];
  [v4 setGivenName:v5];

  v6 = [v3 familyName];
  [v4 setFamilyName:v6];

  v7 = objc_opt_new();
  [v4 setPhoneticRepresentation:v7];

  uint64_t v8 = [v3 phoneticGivenName];
  v9 = [v4 phoneticRepresentation];
  [v9 setGivenName:v8];

  v10 = [v3 phoneticFamilyName];

  v11 = [v4 phoneticRepresentation];
  [v11 setFamilyName:v10];

  return v4;
}

+ (id)makeFullNameWithComponents:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() stringFromNameComponents:v3 configurationBlock:&__block_literal_global_23 cleanupBlock:&__block_literal_global_2];

  return v4;
}

uint64_t __59__CRKASMConcreteNameComponents_makeFullNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:3];
}

uint64_t __59__CRKASMConcreteNameComponents_makeFullNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStyle:0];
}

+ (id)makePhoneticFullNameWithComponents:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() stringFromNameComponents:v3 configurationBlock:&__block_literal_global_4 cleanupBlock:&__block_literal_global_6];

  return v4;
}

void __67__CRKASMConcreteNameComponents_makePhoneticFullNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStyle:3];
  [v2 setPhonetic:1];
}

void __67__CRKASMConcreteNameComponents_makePhoneticFullNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStyle:0];
  [v2 setPhonetic:0];
}

+ (id)makeMonogramWithComponents:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() stringFromNameComponents:v3 configurationBlock:&__block_literal_global_8 cleanupBlock:&__block_literal_global_10_0];

  return v4;
}

void __59__CRKASMConcreteNameComponents_makeMonogramWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "set_ignoresFallbacks:", 1);
  [v2 setStyle:4];
}

void __59__CRKASMConcreteNameComponents_makeMonogramWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "set_ignoresFallbacks:", 0);
  [v2 setStyle:0];
}

+ (id)makeFamilyNameGivenNameWithComponents:(id)a3
{
  return (id)[a1 annotatedStringFromNameComponents:a3 configurationBlock:&__block_literal_global_12 cleanupBlock:&__block_literal_global_14];
}

uint64_t __70__CRKASMConcreteNameComponents_makeFamilyNameGivenNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:3];
}

uint64_t __70__CRKASMConcreteNameComponents_makeFamilyNameGivenNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStyle:0];
}

+ (id)stringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5
{
  v7 = (void (**)(id, void *))a5;
  uint64_t v8 = (void (**)(id, void *))a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() sharedFormatter];
  v8[2](v8, v10);

  v11 = [v10 stringFromPersonNameComponents:v9];

  v7[2](v7, v10);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &stru_26D7E7B00;
  }
  v13 = v12;

  return v13;
}

+ (id)annotatedStringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5
{
  v7 = (void (**)(id, void *))a5;
  uint64_t v8 = (void (**)(id, void *))a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() sharedFormatter];
  v8[2](v8, v10);

  v11 = [v10 annotatedStringFromPersonNameComponents:v9];

  v7[2](v7, v10);

  return v11;
}

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_18);
  }
  id v2 = (void *)sharedFormatter_formatter;

  return v2;
}

uint64_t __47__CRKASMConcreteNameComponents_sharedFormatter__block_invoke()
{
  sharedFormatter_formatter = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  id v3 = [(CRKASMConcreteNameComponents *)self givenName];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKASMConcreteNameComponents *)self phoneticGivenName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CRKASMConcreteNameComponents *)self familyName];
  uint64_t v8 = [v7 hash];
  id v9 = [(CRKASMConcreteNameComponents *)self phoneticFamilyName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(CRKASMConcreteNameComponents *)self fullName];
  uint64_t v12 = [v11 hash];
  v13 = [(CRKASMConcreteNameComponents *)self phoneticFullName];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(CRKASMConcreteNameComponents *)self monogram];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  v17 = [(CRKASMConcreteNameComponents *)self attributedFullName];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"givenName, phoneticGivenName, familyName, phoneticFamilyName, fullName, phoneticFullName, monogram, attributedFullName", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_4;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  id v9 = (CRKASMConcreteNameComponents *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMConcreteNameComponents *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKASMConcreteNameComponents *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMConcreteNameComponents *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSString)description
{
  uint64_t v14 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRKASMConcreteNameComponents *)self givenName];
  v5 = [(CRKASMConcreteNameComponents *)self phoneticGivenName];
  uint64_t v6 = [(CRKASMConcreteNameComponents *)self familyName];
  id v7 = [(CRKASMConcreteNameComponents *)self phoneticFamilyName];
  uint64_t v8 = [(CRKASMConcreteNameComponents *)self fullName];
  id v9 = [(CRKASMConcreteNameComponents *)self phoneticFullName];
  id v10 = [(CRKASMConcreteNameComponents *)self monogram];
  id v11 = [(CRKASMConcreteNameComponents *)self attributedFullName];
  uint64_t v12 = [v14 stringWithFormat:@"<%@: %p { givenName = %@, phoneticGivenName = %@, familyName = %@, phoneticFamilyName = %@, fullName = %@, phoneticFullName = %@, monogram = %@, attributedFullName = %@ }>", v3, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)phoneticFullName
{
  return self->_phoneticFullName;
}

- (NSString)monogram
{
  return self->_monogram;
}

- (NSAttributedString)attributedFullName
{
  return self->_attributedFullName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedFullName, 0);
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_phoneticFullName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

@end