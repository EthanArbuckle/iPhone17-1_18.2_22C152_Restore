@interface CNAutocompleteResultValue
+ (id)normalizedAddressForValue:(id)a3;
+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4;
+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4 label:(id)a5;
+ (id)stringForHashingValue:(id)a3;
- (BOOL)addressExactlyMatchesSearchTerm:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (NSString)identifier;
- (NSString)instantMessageAddressService;
- (NSString)label;
- (NSString)stringForHashingMemo;
- (id)addressTypeDescription;
- (id)description;
- (id)stringForHashing;
- (id)stringForSorting;
- (int64_t)addressType;
- (unint64_t)hash;
- (void)setAddress:(id)a3;
- (void)setAddressType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstantMessageAddressService:(id)a3;
- (void)setLabel:(id)a3;
- (void)setStringForHashingMemo:(id)a3;
@end

@implementation CNAutocompleteResultValue

+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4
{
  return (id)[a1 resultValueWithAddress:a3 addressType:a4 label:&stru_1F1A2F2D8];
}

+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4 label:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setAddress:v9];

  [v10 setAddressType:a4];
  [v10 setLabel:v8];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_addressType == *((void *)a3 + 2))
    {
      address = self->_address;
      if (!((unint64_t)address | *((void *)a3 + 1)) || (int v6 = -[NSString isEqual:](address, "isEqual:")) != 0)
      {
        identifier = self->_identifier;
        if (!((unint64_t)identifier | *((void *)a3 + 4))
          || (int v6 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
        {
          label = self->_label;
          if (!((unint64_t)label | *((void *)a3 + 5)) || (int v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
          {
            instantMessageAddressService = self->_instantMessageAddressService;
            if (!((unint64_t)instantMessageAddressService | *((void *)a3 + 3))
              || (int v6 = -[NSString isEqual:](instantMessageAddressService, "isEqual:")) != 0)
            {
              LOBYTE(v6) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__CNAutocompleteResultValue_hash__block_invoke;
  v14[3] = &unk_1E63DE8E8;
  v14[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNAutocompleteResultValue_hash__block_invoke_2;
  aBlock[3] = &unk_1E63DE8E8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__CNAutocompleteResultValue_hash__block_invoke_3;
  v12[3] = &unk_1E63DE8E8;
  v12[4] = self;
  v5 = _Block_copy(v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__CNAutocompleteResultValue_hash__block_invoke_4;
  v11[3] = &unk_1E63DE8E8;
  v11[4] = self;
  int v6 = _Block_copy(v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CNAutocompleteResultValue_hash__block_invoke_5;
  v10[3] = &unk_1E63DE8E8;
  v10[4] = self;
  v7 = _Block_copy(v10);
  unint64_t v8 = objc_msgSend(v3, "hashWithBlocks:", v14, v4, v5, v6, v7, 0);

  return v8;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) address];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) instantMessageAddressService];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) addressType];
  return [v1 integerHash:v2];
}

- (id)stringForHashing
{
  uint64_t v3 = [(CNAutocompleteResultValue *)self stringForHashingMemo];

  if (!v3)
  {
    v4 = [(id)objc_opt_class() stringForHashingValue:self];
    v5 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
    [(CNAutocompleteResultValue *)self setStringForHashingMemo:v5];
  }
  uint64_t v6 = *MEMORY[0x1E4F5A2B0];
  v7 = [(CNAutocompleteResultValue *)self stringForHashingMemo];
  unint64_t v8 = (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  return v8;
}

+ (id)stringForHashingValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  uint64_t v6 = [v4 address];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    v7 = 0;
  }
  else
  {
    unint64_t v8 = [a1 normalizedAddressForValue:v4];
    v7 = [NSString stringWithFormat:@"%@+%lu", v8, objc_msgSend(v4, "addressType")];
  }
  return v7;
}

+ (id)normalizedAddressForValue:(id)a3
{
  id v3 = a3;
  if ([v3 addressType] == 2) {
    id v4 = (uint64_t *)&CNAutocompleteResultAddressStringForHashingPhoneNumberTransform;
  }
  else {
    id v4 = (uint64_t *)&CNAutocompleteResultAddressStringForHashingEmailTransform;
  }
  uint64_t v5 = *v4;
  uint64_t v6 = [v3 address];

  v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  return v7;
}

- (id)stringForSorting
{
  if ([(CNAutocompleteResultValue *)self addressType] == 3)
  {
    id v3 = NSString;
    id v4 = [(CNAutocompleteResultValue *)self address];
    uint64_t v5 = [(CNAutocompleteResultValue *)self instantMessageAddressService];
    uint64_t v6 = [v3 stringWithFormat:@"%@ <%@>", v4, v5];
  }
  else
  {
    uint64_t v6 = [(CNAutocompleteResultValue *)self address];
  }
  return v6;
}

- (BOOL)addressExactlyMatchesSearchTerm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteResultValue *)self address];

  if (v5)
  {
    uint64_t v6 = [(CNAutocompleteResultValue *)self address];
    char v7 = objc_msgSend(v6, "_cn_caseInsensitiveIsEqual:", v4);

    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = v4;
      if ((objc_msgSend(v9, "_cn_containsSubstring:", @"@") & 1) == 0)
      {
        uint64_t v10 = [v9 stringByAppendingString:@"@"];

        id v9 = (id)v10;
      }
      v11 = [(CNAutocompleteResultValue *)self address];
      uint64_t v12 = [v11 rangeOfString:v9 options:137];

      BOOL v8 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNAutocompleteResultValue *)self address];
  id v5 = (id)[v3 appendName:@"address" object:v4];

  uint64_t v6 = [(CNAutocompleteResultValue *)self identifier];
  id v7 = (id)[v3 appendName:@"id" object:v6];

  BOOL v8 = [(CNAutocompleteResultValue *)self label];
  id v9 = (id)[v3 appendName:@"label" object:v8];

  uint64_t v10 = [(CNAutocompleteResultValue *)self addressTypeDescription];
  id v11 = (id)[v3 appendName:@"addressType" object:v10];

  uint64_t v12 = [(CNAutocompleteResultValue *)self instantMessageAddressService];
  id v13 = (id)[v3 appendName:@"instantMessageAddressService" object:v12];

  v14 = [v3 build];

  return v14;
}

- (id)addressTypeDescription
{
  int64_t v2 = [(CNAutocompleteResultValue *)self addressType];
  if ((unint64_t)(v2 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E63DE908[v2 - 1];
  }
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddress:(id)a3
{
}

- (int64_t)addressType
{
  return self->_addressType;
}

- (void)setAddressType:(int64_t)a3
{
  self->_addressType = a3;
}

- (NSString)instantMessageAddressService
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstantMessageAddressService:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel:(id)a3
{
}

- (NSString)stringForHashingMemo
{
  return self->_stringForHashingMemo;
}

- (void)setStringForHashingMemo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringForHashingMemo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_instantMessageAddressService, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end