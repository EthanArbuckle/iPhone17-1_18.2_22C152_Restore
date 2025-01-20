@interface CNPhoneNumberContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_hasHighSpecificity;
- (BOOL)isEqual:(id)a3;
- (BOOL)returnsMultipleResults;
- (CNPhoneNumberContactPredicate)initWithCoder:(id)a3;
- (NSString)description;
- (id)initWithPhoneNumber:(char)a3 returnMultipleResults:;
- (id)initWithPhoneNumber:(void *)a3 prefixHint:(char)a4 returnMultipleResults:;
- (id)initWithPhoneNumber:(void *)a3 prefixHint:(void *)a4 groupIdentifiers:(char)a5 returnMultipleResults:;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (id)shortDebugDescription;
- (uint64_t)countryCode;
- (uint64_t)digits;
- (uint64_t)groupIdentifiers;
- (uint64_t)phoneNumber;
- (uint64_t)prefixHint;
- (unint64_t)hash;
- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)initWithDigits:(void *)a3 countryCode:(char)a4 returnMultipleResults:;
@end

@implementation CNPhoneNumberContactPredicate

- (id)initWithPhoneNumber:(char)a3 returnMultipleResults:
{
  if (result) {
    return -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](result, a2, 0, 0, a3);
  }
  return result;
}

- (id)initWithPhoneNumber:(void *)a3 prefixHint:(void *)a4 groupIdentifiers:(char)a5 returnMultipleResults:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)CNPhoneNumberContactPredicate;
    a1 = objc_msgSendSuper2(&v19, sel_initWithPredicate_, 0);
    if (a1)
    {
      uint64_t v12 = [v9 copy];
      v13 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v12;

      uint64_t v14 = [v10 copy];
      v15 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v14;

      *((unsigned char *)a1 + 40) = a5;
      uint64_t v16 = [v11 copy];
      v17 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v16;
    }
  }

  return a1;
}

- (BOOL)returnsMultipleResults
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)prefixHint
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)groupIdentifiers
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)digits
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (BOOL)cn_hasHighSpecificity
{
  if (self) {
    self = (CNPhoneNumberContactPredicate *)self->_phoneNumber;
  }
  v2 = [(CNPhoneNumberContactPredicate *)self digits];
  BOOL v3 = (unint64_t)[v2 length] > 5;

  return v3;
}

- (uint64_t)phoneNumber
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)countryCode
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_prefixHint, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (id)initWithPhoneNumber:(void *)a3 prefixHint:(char)a4 returnMultipleResults:
{
  if (result) {
    return -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](result, a2, a3, 0, a4);
  }
  return result;
}

- (void)initWithDigits:(void *)a3 countryCode:(char)a4 returnMultipleResults:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = +[CNPhoneNumber phoneNumberWithDigits:v7 countryCode:v8];
    id v10 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](a1, v9, 0, 0, a4);

    if (v10)
    {
      id v11 = objc_msgSend(v7, "_cn_stringBySanitizingPhoneNumber");
      uint64_t v12 = [v11 copy];
      v13 = (void *)v10[8];
      v10[8] = v12;

      uint64_t v14 = [v8 copy];
      v15 = (void *)v10[9];
      v10[9] = v14;

      id v10 = v10;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPhoneNumberContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_phoneNumber"];
  char v6 = [v4 decodeBoolForKey:@"_returnsMultipleResults"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_prefixHint"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_groupIdentifiers"];

  uint64_t v12 = (CNPhoneNumberContactPredicate *)-[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](self, v5, v7, v11, v6);
  if (v12)
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_digits"];
    uint64_t v14 = [v13 copy];
    digits = v12->_digits;
    v12->_digits = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_countryCode"];
    uint64_t v17 = [v16 copy];
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v17;

    objc_super v19 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhoneNumberContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, @"_phoneNumber", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_prefixHint forKey:@"_prefixHint"];
  [v4 encodeBool:self->_returnsMultipleResults forKey:@"_returnsMultipleResults"];
  [v4 encodeObject:self->_digits forKey:@"_digits"];
  [v4 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [v4 encodeObject:self->_groupIdentifiers forKey:@"_groupIdentifiers"];
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingPhoneNumber:]"];
  if (self)
  {
    id v5 = (id)[v3 appendName:@"phoneNumber" object:self->_phoneNumber];
    id v6 = (id)[v3 appendName:@"returnsMultipleResults" BOOLValue:self->_returnsMultipleResults];
    prefixHint = self->_prefixHint;
  }
  else
  {
    id v16 = (id)[v3 appendName:@"phoneNumber" object:0];
    id v17 = (id)[v3 appendName:@"returnsMultipleResults" BOOLValue:0];
    prefixHint = 0;
  }
  id v8 = (id)[v3 appendName:@"prefixHint" object:prefixHint];
  if (self)
  {
    id v9 = (id)[v3 appendName:@"countryCode" object:self->_countryCode];
    digits = self->_digits;
  }
  else
  {
    id v18 = (id)[v3 appendName:@"countryCode" object:0];
    digits = 0;
  }
  id v11 = (id)[v3 appendName:@"digits" object:digits];
  if (self) {
    groupIdentifiers = self->_groupIdentifiers;
  }
  else {
    groupIdentifiers = 0;
  }
  id v13 = (id)[v3 appendName:@"groupIdentifiers" object:groupIdentifiers];
  uint64_t v14 = [v3 build];

  return (NSString *)v14;
}

- (id)shortDebugDescription
{
  return @"PhoneNumberPredicate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke;
  v31[3] = &unk_1E56B3E18;
  v31[4] = self;
  id v32 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v32;
  id v30 = v6;
  id v7 = _Block_copy(aBlock);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_3;
  v27[3] = &unk_1E56B3E18;
  v27[4] = self;
  id v8 = v6;
  id v28 = v8;
  id v9 = _Block_copy(v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_4;
  v25[3] = &unk_1E56B3E18;
  v25[4] = self;
  id v10 = v8;
  id v26 = v10;
  id v11 = _Block_copy(v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_5;
  v23[3] = &unk_1E56B3E18;
  v23[4] = self;
  id v12 = v10;
  id v24 = v12;
  id v13 = _Block_copy(v23);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  objc_super v19 = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_6;
  v20 = &unk_1E56B3E18;
  v21 = self;
  id v22 = v12;
  id v14 = v12;
  v15 = _Block_copy(&v17);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v14, self, v31, v7, v9, v11, v13, v15, 0, v17, v18, v19, v20, v21);

  return (char)self;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A3E0];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[6];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 48);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v2;
  uint64_t v6 = [v1 isObject:v5 equalToOther:v4];

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    BOOL v2 = *(unsigned __int8 *)(v1 + 40) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = *(unsigned __int8 *)(v3 + 40) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  return [MEMORY[0x1E4F5A3E0] isBool:v2 equalToOther:v4];
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A3E0];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[7];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 56);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v2;
  uint64_t v6 = [v1 isObject:v5 equalToOther:v4];

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A3E0];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[9];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 72);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v2;
  uint64_t v6 = [v1 isObject:v5 equalToOther:v4];

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A3E0];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[8];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v2;
  uint64_t v6 = [v1 isObject:v5 equalToOther:v4];

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A3E0];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[10];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 80);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v2;
  uint64_t v6 = [v1 isObject:v5 equalToOther:v4];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke;
  v16[3] = &unk_1E56B3E40;
  v16[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v4 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_3;
  v14[3] = &unk_1E56B3E40;
  v14[4] = self;
  id v5 = _Block_copy(v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_4;
  v13[3] = &unk_1E56B3E40;
  v13[4] = self;
  uint64_t v6 = _Block_copy(v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_5;
  v12[3] = &unk_1E56B3E40;
  v12[4] = self;
  id v7 = _Block_copy(v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_6;
  v11[3] = &unk_1E56B3E40;
  v11[4] = self;
  id v8 = _Block_copy(v11);
  unint64_t v9 = objc_msgSend(v3, "hashWithBlocks:", v16, v4, v5, v6, v7, v8, 0);

  return v9;
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] objectHash:v2];
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    BOOL v2 = *(unsigned __int8 *)(v1 + 40) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] BOOLHash:v2];
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 56);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] objectHash:v2];
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 72);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] objectHash:v2];
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 64);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] objectHash:v2];
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 80);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] arrayHash:v2];
}

- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F5A3D8];
    id v7 = a3;
    id v8 = [v6 currentEnvironment];
    unint64_t v9 = [v8 defaultCountryCode];
    int v10 = 134218242;
    unint64_t v11 = a4;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "%04llx Default country code: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8 = a5;
  unint64_t v9 = -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)self);
  int v10 = [v9 stringValue];
  unint64_t v11 = [v8 contactMatchesByPhoneNumber:v10 error:a6];

  return v11;
}

@end