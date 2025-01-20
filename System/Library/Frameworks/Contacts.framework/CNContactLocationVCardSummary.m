@interface CNContactLocationVCardSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContactLocationVCardSummary)initWithCoder:(id)a3;
- (CNContactLocationVCardSummary)initWithData:(id)a3 error:(id *)a4;
- (CNContactLocationVCardSummary)initWithTitle:(id)a3 URLString:(id)a4;
- (NSString)title;
- (NSString)urlString;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactLocationVCardSummary

- (CNContactLocationVCardSummary)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNContactLocationVCardSummary;
  v7 = [(CNContactLocationVCardSummary *)&v23 init];
  if (v7)
  {
    v8 = v7;
    if ([MEMORY[0x1E4FB8BF8] countOfCardsInData:v6] == 1)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB8C08]);
      [v9 setContactLimit:1];
      [v9 setMaximumValueLength:200];
      [v9 setPropertiesToFetch:&unk_1EE089818];
      id v22 = 0;
      v10 = +[CNContactVCardSerialization contactsWithData:v6 options:v9 error:&v22];
      id v11 = v22;
      v12 = [v10 firstObject];

      v13 = [v12 givenName];
      v14 = [v12 urlAddresses];
      v15 = [v14 firstObject];
      v16 = [v15 value];

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
      {
        v17 = +[CNErrorFactory errorWithCode:700 userInfo:0];
        v18 = v17;
        if (a4) {
          *a4 = v17;
        }

        v19 = 0;
      }
      else
      {
        v8 = [(CNContactLocationVCardSummary *)v8 initWithTitle:v13 URLString:v16];
        v19 = v8;
      }
    }
    else
    {
      v20 = +[CNErrorFactory errorWithCode:700 userInfo:0];
      id v9 = v20;
      v19 = 0;
      if (a4) {
        *a4 = v20;
      }
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CNContactLocationVCardSummary)initWithTitle:(id)a3 URLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactLocationVCardSummary;
  v8 = [(CNContactLocationVCardSummary *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    urlString = v8->_urlString;
    v8->_urlString = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNContactLocationVCardSummary *)self title];
  id v5 = (id)[v3 appendName:@"descriptiveLabel" object:v4];

  id v6 = [(CNContactLocationVCardSummary *)self urlString];
  id v7 = (id)[v3 appendName:@"urlString" object:v6];

  v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__CNContactLocationVCardSummary_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __41__CNContactLocationVCardSummary_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __41__CNContactLocationVCardSummary_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) title];
  id v4 = [*(id *)(a1 + 40) title];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __41__CNContactLocationVCardSummary_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) urlString];
  id v4 = [*(id *)(a1 + 40) urlString];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CNContactLocationVCardSummary_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNContactLocationVCardSummary_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __37__CNContactLocationVCardSummary_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __37__CNContactLocationVCardSummary_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) urlString];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactLocationVCardSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactLocationVCardSummary;
  uint64_t v5 = [(CNContactLocationVCardSummary *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlString"];
    uint64_t v10 = [v9 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_urlString forKey:@"_urlString"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end