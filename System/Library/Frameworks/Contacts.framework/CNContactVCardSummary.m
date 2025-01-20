@interface CNContactVCardSummary
+ (BOOL)isAvatarContacts:(id)a3 equalTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (CNContactFormatter)defaultNameFormatter;
+ (id)localizedStringWithName:(id)a3 andOtherName:(id)a4;
+ (id)localizedStringWithName:(id)a3 andThisManyOthers:(unint64_t)a4;
+ (id)makeFormatter;
+ (id)nameForContact:(id)a3;
+ (id)namesForContact:(id)a3;
+ (id)readingOptionsWithContactLimit:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CNContactVCardSummary)initWithCoder:(id)a3;
- (CNContactVCardSummary)initWithData:(id)a3 error:(id *)a4;
- (CNContactVCardSummary)initWithTitle:(id)a3 subtitle:(id)a4 contactCount:(unint64_t)a5 avatarContacts:(id)a6;
- (NSArray)avatarContacts;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (unint64_t)contactCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactVCardSummary

- (CNContactVCardSummary)initWithData:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A268] + 16))()) {
    goto LABEL_2;
  }
  uint64_t v8 = [MEMORY[0x1E4FB8BF8] countOfCardsInData:v6];
  if (v8 == 2)
  {
    v11 = [(id)objc_opt_class() readingOptionsWithContactLimit:2];
    id v34 = 0;
    v12 = +[CNContactVCardSerialization contactsWithData:v6 options:v11 error:&v34];
    id v13 = v34;
    if (!v12) {
      goto LABEL_17;
    }
    if ((unint64_t)[v12 count] <= 1) {
      goto LABEL_19;
    }
    v18 = objc_opt_class();
    v19 = [v12 objectAtIndexedSubscript:0];
    v16 = [v18 nameForContact:v19];

    v20 = objc_opt_class();
    v21 = [v12 objectAtIndexedSubscript:1];
    v17 = [v20 nameForContact:v21];

    v22 = [(id)objc_opt_class() localizedStringWithName:v16 andOtherName:v17];
    v23 = &stru_1EE052B80;
    v24 = self;
    v25 = v22;
    uint64_t v26 = 2;
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v8 - 1;
  if (v8 == 1)
  {
    v11 = [(id)objc_opt_class() readingOptionsWithContactLimit:1];
    id v35 = 0;
    v12 = +[CNContactVCardSerialization contactsWithData:v6 options:v11 error:&v35];
    id v13 = v35;
    if (!v12) {
      goto LABEL_17;
    }
    if (![v12 count]) {
      goto LABEL_19;
    }
    v27 = objc_opt_class();
    v28 = [v12 objectAtIndexedSubscript:0];
    v16 = [v27 namesForContact:v28];

    v17 = [v16 first];
    v22 = [v16 second];
    v24 = self;
    v25 = v17;
    v23 = v22;
    uint64_t v26 = 1;
LABEL_15:
    self = [(CNContactVCardSummary *)v24 initWithTitle:v25 subtitle:v23 contactCount:v26 avatarContacts:v12];

    goto LABEL_16;
  }
  if (v8)
  {
    v11 = [(id)objc_opt_class() readingOptionsWithContactLimit:2];
    id v33 = 0;
    v12 = +[CNContactVCardSerialization contactsWithData:v6 options:v11 error:&v33];
    id v13 = v33;
    if (v12)
    {
      if ([v12 count])
      {
        v14 = objc_opt_class();
        v15 = [v12 objectAtIndexedSubscript:0];
        v16 = [v14 nameForContact:v15];

        v17 = [(id)objc_opt_class() localizedStringWithName:v16 andThisManyOthers:v10];
        self = [(CNContactVCardSummary *)self initWithTitle:v17 subtitle:&stru_1EE052B80 contactCount:v9 avatarContacts:v12];
LABEL_16:

        v7 = self;
LABEL_24:

        goto LABEL_25;
      }
LABEL_19:
      v16 = +[CNErrorFactory errorWithCode:701 userInfo:0];
      if (!a4)
      {
LABEL_20:
        v7 = 0;
        goto LABEL_24;
      }
LABEL_23:
      v7 = 0;
      *a4 = v16;
      goto LABEL_24;
    }
LABEL_17:
    id v29 = v13;
    v30 = v29;
    if (v29)
    {
      uint64_t v36 = *MEMORY[0x1E4F28A50];
      v37[0] = v29;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    }
    else
    {
      v31 = 0;
    }
    v16 = +[CNErrorFactory errorWithCode:701 userInfo:v31];

    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
LABEL_2:
  self = [(CNContactVCardSummary *)self initWithTitle:&stru_1EE052B80 subtitle:&stru_1EE052B80 contactCount:0 avatarContacts:MEMORY[0x1E4F1CBF0]];
  v7 = self;
LABEL_25:

  return v7;
}

+ (id)readingOptionsWithContactLimit:(unint64_t)a3
{
  v10[7] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB8C08]);
  [v4 setContactLimit:a3];
  uint64_t v5 = *MEMORY[0x1E4FB8B98];
  v10[0] = *MEMORY[0x1E4FB8B90];
  v10[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4FB8BB8];
  v10[2] = *MEMORY[0x1E4FB8BA0];
  v10[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB8BB0];
  v10[4] = *MEMORY[0x1E4FB8B88];
  v10[5] = v7;
  v10[6] = *MEMORY[0x1E4FB8BA8];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:7];
  [v4 setPropertiesToFetch:v8];

  [v4 setMaximumValueLength:100];

  return v4;
}

+ (id)namesForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 nameForContact:v4];
  uint64_t v6 = [[_CNContactVCardNameSummzarizationScope alloc] initWithContact:v4 fullName:v5];

  uint64_t v8 = sOrganizationWithPerson_block_invoke(v7, v6);
  if (!v8)
  {
    uint64_t v8 = sPersonWithOrganization_block_invoke_2(0, v6);
  }

  return v8;
}

+ (id)nameForContact:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CNContactVCardSummary_nameForContact___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = nameForContact__cn_once_token_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&nameForContact__cn_once_token_0, block);
  }
  uint64_t v5 = [(id)nameForContact__cn_once_object_0 stringFromContact:v4];

  return v5;
}

uint64_t __40__CNContactVCardSummary_nameForContact___block_invoke(uint64_t a1)
{
  nameForContact__cn_once_object_0 = [*(id *)(a1 + 32) makeFormatter];

  return MEMORY[0x1F41817F8]();
}

+ (CNContactFormatter)defaultNameFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CNContactVCardSummary_defaultNameFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultNameFormatter_cn_once_token_1 != -1) {
    dispatch_once(&defaultNameFormatter_cn_once_token_1, block);
  }
  v2 = (void *)defaultNameFormatter_cn_once_object_1;

  return (CNContactFormatter *)v2;
}

uint64_t __45__CNContactVCardSummary_defaultNameFormatter__block_invoke(uint64_t a1)
{
  defaultNameFormatter_cn_once_object_1 = [*(id *)(a1 + 32) makeFormatter];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeFormatter
{
  v2 = objc_alloc_init(CNContactFormatter);
  [(CNContactFormatter *)v2 setFallbackStyle:-1];

  return v2;
}

+ (id)localizedStringWithName:(id)a3 andOtherName:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"NAME_AND_OTHER_NAME" value:&stru_1EE052B80 table:@"ContactsVCards"];

  uint64_t v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v7, v6);

  return v10;
}

+ (id)localizedStringWithName:(id)a3 andThisManyOthers:(unint64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  id v7 = [v5 bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"NAME_AND_N_OTHERS" value:&stru_1EE052B80 table:@"ContactsVCards"];

  uint64_t v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v6, a4);

  return v9;
}

- (CNContactVCardSummary)initWithTitle:(id)a3 subtitle:(id)a4 contactCount:(unint64_t)a5 avatarContacts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNContactVCardSummary;
  id v13 = [(CNContactVCardSummary *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v16;

    v13->_contactCount = a5;
    uint64_t v18 = [v12 copy];
    avatarContacts = v13->_avatarContacts;
    v13->_avatarContacts = (NSArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNContactVCardSummary *)self title];
  id v5 = (id)[v3 appendName:@"descriptive label" object:v4];

  id v6 = [(CNContactVCardSummary *)self subtitle];
  id v7 = (id)[v3 appendName:@"secondary descriptive label" object:v6];

  id v8 = (id)objc_msgSend(v3, "appendName:intValue:", @"contact count", -[CNContactVCardSummary contactCount](self, "contactCount"));
  uint64_t v9 = [(CNContactVCardSummary *)self avatarContacts];
  id v10 = (id)[v3 appendName:@"avatar contacts" object:v9];

  id v11 = [v3 build];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __33__CNContactVCardSummary_isEqual___block_invoke;
  v23[3] = &unk_1E56B3E18;
  v23[4] = self;
  id v24 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNContactVCardSummary_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v24;
  id v22 = v6;
  id v7 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __33__CNContactVCardSummary_isEqual___block_invoke_3;
  v19[3] = &unk_1E56B3E18;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  uint64_t v9 = _Block_copy(v19);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __33__CNContactVCardSummary_isEqual___block_invoke_4;
  uint64_t v16 = &unk_1E56B3E18;
  v17 = self;
  id v18 = v8;
  id v10 = v8;
  id v11 = _Block_copy(&v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v10, v23, v7, v9, v11, 0, v13, v14, v15, v16, v17);

  return (char)self;
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) title];
  id v4 = [*(id *)(a1 + 40) title];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) subtitle];
  id v4 = [*(id *)(a1 + 40) subtitle];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) contactCount];
  uint64_t v4 = [*(id *)(a1 + 40) contactCount];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) avatarContacts];
  uint64_t v4 = [*(id *)(a1 + 40) avatarContacts];
  uint64_t v5 = [v2 isAvatarContacts:v3 equalTo:v4];

  return v5;
}

+ (BOOL)isAvatarContacts:(id)a3 equalTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    id v8 = objc_msgSend(v5, "_cn_zip:", v6);
    char v9 = objc_msgSend(v8, "_cn_all:", &__block_literal_global_44);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

uint64_t __50__CNContactVCardSummary_isAvatarContacts_equalTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 first];
  uint64_t v4 = [v2 second];

  uint64_t v5 = [v3 isEqualIgnoringIdentifiers:v4];
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__CNContactVCardSummary_hash__block_invoke;
  v12[3] = &unk_1E56B3E40;
  v12[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__CNContactVCardSummary_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  uint64_t v4 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__CNContactVCardSummary_hash__block_invoke_3;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  uint64_t v5 = _Block_copy(v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__CNContactVCardSummary_hash__block_invoke_4;
  v9[3] = &unk_1E56B3E40;
  v9[4] = self;
  id v6 = _Block_copy(v9);
  unint64_t v7 = objc_msgSend(v3, "hashWithBlocks:", v12, v4, v5, v6, 0);

  return v7;
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  id v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  id v2 = [*(id *)(a1 + 32) subtitle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) contactCount];

  return [v1 unsignedIntegerHash:v2];
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) avatarContacts];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactVCardSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactVCardSummary;
  uint64_t v5 = [(CNContactVCardSummary *)&v17 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v5->_contactCount = [v4 decodeIntegerForKey:@"_contactCount"];
    char v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_avatarContacts"];
    uint64_t v13 = [v12 copy];
    avatarContacts = v5->_avatarContacts;
    v5->_avatarContacts = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeInteger:self->_contactCount forKey:@"_contactCount"];
  [v5 encodeObject:self->_avatarContacts forKey:@"_avatarContacts"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)contactCount
{
  return self->_contactCount;
}

- (NSArray)avatarContacts
{
  return self->_avatarContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContacts, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end