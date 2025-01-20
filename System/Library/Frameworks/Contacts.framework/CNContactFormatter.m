@interface CNContactFormatter
+ (BOOL)supportsSecureCoding;
+ (CNContactDisplayNameOrder)nameOrderForContact:(CNContact *)contact;
+ (NSAttributedString)attributedStringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style defaultAttributes:(NSDictionary *)attributes;
+ (NSString)delimiterForContact:(CNContact *)contact;
+ (NSString)stringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style;
+ (id)abbreviatedStringFromContact:(id)a3 trimmingWhitespace:(BOOL)a4;
+ (id)descriptorForRequiredKeysForDelimiter;
+ (id)descriptorForRequiredKeysForNameOrder;
+ (id)descriptorForRequiredKeysForStyle:(CNContactFormatterStyle)style;
+ (id)posterNameComponentsForContact:(id)a3;
+ (id)posterNameComponentsForContact:(id)a3 nameOrder:(int64_t)a4 localeEmphasisStyle:(int64_t)a5 preferNicknames:(BOOL)a6;
+ (int64_t)nameEmphasisStyleForContact:(id)a3;
+ (int64_t)nameEmphasisStyleForContact:(id)a3 localeBasedEmphasisStyle:(int64_t)a4 preferNickname:(BOOL)a5;
+ (int64_t)singleNameStyleForContact:(id)a3;
- (BOOL)emphasizesPrimaryNameComponent;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)ignoresNickname;
- (BOOL)ignoresOrganization;
- (CNContactFormatter)init;
- (CNContactFormatter)initWithCoder:(id)a3;
- (CNContactFormatterStyle)style;
- (NSAttributedString)attributedStringFromContact:(CNContact *)contact defaultAttributes:(NSDictionary *)attributes;
- (NSString)stringFromContact:(CNContact *)contact;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptorForRequiredKeys;
- (id)fullNameForContact:(void *)a3 attributes:(uint64_t)a4 style:;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromContact:(id)a3 attributes:(id)a4;
- (id)stringFromPotentiallySuggestedContact:(id)a3 relatedToProperty:(id)a4;
- (int64_t)sortOrder;
- (unint64_t)fallbackStyle;
- (void)appendValue:(void *)a3 derivedFromPropertyName:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:;
- (void)appendValueForProperties:(void *)a3 fromContact:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:(char)a7 fallback:;
- (void)avatarNameForContact:(void *)a1 attributes:(void *)a2;
- (void)encodeWithCoder:(id)a3;
- (void)nameFormatter;
- (void)setEmphasizesPrimaryNameComponent:(BOOL)a3;
- (void)setFallbackStyle:(unint64_t)a3;
- (void)setIgnoresNickname:(BOOL)a3;
- (void)setIgnoresOrganization:(BOOL)a3;
- (void)setSortOrder:(int64_t)a3;
- (void)setStyle:(CNContactFormatterStyle)style;
- (void)shortNameForContact:(void *)a1 attributes:(void *)a2;
@end

@implementation CNContactFormatter

void __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  v6 = [v8 objectForKey:@"contactProperty"];
  if ([v6 isEqual:*(void *)(a1 + 32)])
  {
    v7 = [NSNumber numberWithBool:1];
    [v8 setObject:v7 forKey:@"contactNameEmphasis"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)abbreviatedStringFromContact:(id)a3 trimmingWhitespace:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)[a3 mutableCopy];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 givenName];
    id v8 = objc_msgSend(v7, "_cn_trimmedString");
    [v6 setGivenName:v8];

    v9 = [v6 familyName];
    v10 = objc_msgSend(v9, "_cn_trimmedString");
    [v6 setFamilyName:v10];
  }
  v11 = [(id)objc_opt_class() stringFromContact:v6 style:1002];

  return v11;
}

- (void).cxx_destruct
{
}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke(uint64_t a1)
{
  v9[8] = *MEMORY[0x1E4F143B8];
  v9[0] = @"givenName";
  v9[1] = @"middleName";
  v9[2] = @"familyName";
  v9[3] = @"phoneticGivenName";
  v9[4] = @"phoneticMiddleName";
  v9[5] = @"phoneticFamilyName";
  v9[6] = @"phoneticOrganizationName";
  v9[7] = @"contactType";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];
  v3 = NSString;
  BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5 = [v3 stringWithFormat:@"Formatter style: %@", v4];
  v6 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v2 description:v5];
  uint64_t v7 = [v6 copy];
  id v8 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_1;
  descriptorForRequiredKeysForStyle__cn_once_object_1 = v7;
}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_3(uint64_t a1)
{
  v9[8] = *MEMORY[0x1E4F143B8];
  v9[0] = @"namePrefix";
  v9[1] = @"givenName";
  v9[2] = @"middleName";
  v9[3] = @"familyName";
  v9[4] = @"nameSuffix";
  v9[5] = @"contactType";
  v9[6] = @"organizationName";
  v9[7] = @"nickname";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];
  v3 = NSString;
  BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5 = [v3 stringWithFormat:@"Formatter style: %@", v4];
  v6 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v2 description:v5];
  uint64_t v7 = [v6 copy];
  id v8 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_3;
  descriptorForRequiredKeysForStyle__cn_once_object_3 = v7;
}

- (id)descriptorForRequiredKeys
{
  if (([(CNContactFormatter *)self style] == CNContactFormatterStyleFullName
     || (CNContactFormatterStyle v3 = [(CNContactFormatter *)self style], self, (v3 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8))
    && [(CNContactFormatter *)self fallbackStyle] == -1)
  {
    BOOL v4 = objc_alloc_init(CNContactFormatterSmartFetcher);
    [(CNContactFormatterSmartFetcher *)v4 setIgnoresNickname:[(CNContactFormatter *)self ignoresNickname]];
    [(CNContactFormatterSmartFetcher *)v4 setIgnoresOrganization:[(CNContactFormatter *)self ignoresOrganization]];
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForStyle:", -[CNContactFormatter style](self, "style"));
    BOOL v4 = (CNContactFormatterSmartFetcher *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)descriptorForRequiredKeysForStyle:(CNContactFormatterStyle)style
{
  if (style == 1003)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_2;
    v7[3] = &__block_descriptor_48_e5_v8__0l;
    v7[4] = a1;
    v7[5] = 1003;
    if (descriptorForRequiredKeysForStyle__cn_once_token_2 != -1) {
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_2, v7);
    }
    CNContactFormatterStyle v3 = &descriptorForRequiredKeysForStyle__cn_once_object_2;
  }
  else if (style == CNContactFormatterStylePhoneticFullName)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = 1;
    if (descriptorForRequiredKeysForStyle__cn_once_token_1 != -1) {
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_1, block);
    }
    CNContactFormatterStyle v3 = &descriptorForRequiredKeysForStyle__cn_once_object_1;
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_3;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = style;
    if (descriptorForRequiredKeysForStyle__cn_once_token_3 != -1) {
      dispatch_once(&descriptorForRequiredKeysForStyle__cn_once_token_3, v6);
    }
    CNContactFormatterStyle v3 = &descriptorForRequiredKeysForStyle__cn_once_object_3;
  }
  BOOL v4 = (void *)*v3;

  return v4;
}

- (void)shortNameForContact:(void *)a1 attributes:(void *)a2
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    if ([v3 contactType] == 1
      && (+[CNContactsUserDefaults sharedDefaults],
          v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 shortNameFormatPrefersNicknames],
          v5,
          !v6))
    {
      a1 = 0;
    }
    else
    {
      uint64_t v7 = -[CNContactFormatter nameFormatter](a1);
      a1 = -[NSPersonNameComponentsFormatter stringFromContact:](v7, (uint64_t)v4);
    }
  }

  return a1;
}

- (void)nameFormatter
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = +[NSPersonNameComponentsFormatter formatterWithCNContactStyle:](MEMORY[0x1E4F28F38], [a1 style]);
      v5 = (void *)v2[2];
      v2[2] = v4;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (NSString)stringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style
{
  int v6 = contact;
  id v7 = objc_alloc_init((Class)a1);
  [v7 setStyle:style];
  id v8 = [v7 stringFromContact:v6];

  return (NSString *)v8;
}

- (void)setStyle:(CNContactFormatterStyle)style
{
  self->_style = style;
}

- (id)stringFromContact:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CNContactFormatterStyle v8 = [(CNContactFormatter *)self style];
  CNContactFormatterStyle v9 = v8;
  switch(v8)
  {
    case 1000:
      uint64_t v10 = -[CNContactFormatter shortNameForContact:attributes:](self, v6);
      goto LABEL_10;
    case 1001:
    case 1002:
      uint64_t v10 = -[CNContactFormatter avatarNameForContact:attributes:](self, v6);
      goto LABEL_10;
    case 1003:
      v11 = self;
      v12 = v6;
      v13 = v7;
      uint64_t v14 = 1003;
      goto LABEL_9;
    default:
      if (v8 == CNContactFormatterStylePhoneticFullName)
      {
        v11 = self;
        v12 = v6;
        v13 = v7;
        uint64_t v14 = 1;
      }
      else
      {
        if (v8)
        {
          v15 = 0;
          goto LABEL_11;
        }
        v11 = self;
        v12 = v6;
        v13 = v7;
        uint64_t v14 = 0;
      }
LABEL_9:
      uint64_t v10 = -[CNContactFormatter fullNameForContact:attributes:style:](v11, v12, v13, v14);
LABEL_10:
      v15 = (void *)v10;
LABEL_11:
      uint64_t v16 = *MEMORY[0x1E4F5A298];
      int v17 = (*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v15);
      if (v9)
      {
        if (v17)
        {
          if ([(CNContactFormatter *)self fallbackStyle])
          {
            self;
            if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8)
            {
              uint64_t v18 = -[CNContactFormatter fullNameForContact:attributes:style:](self, v6, v7, 0);

              v15 = (void *)v18;
            }
          }
        }
      }
      if ((*(unsigned int (**)(uint64_t, void *))(v16 + 16))(v16, v15))
      {

        v15 = 0;
      }

      return v15;
  }
}

- (CNContactFormatterStyle)style
{
  return self->_style;
}

- (CNContactFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactFormatter;
  result = [(CNContactFormatter *)&v3 init];
  if (result) {
    result->_fallbackStyle = 1;
  }
  return result;
}

- (NSString)stringFromContact:(CNContact *)contact
{
  return (NSString *)[(CNContactFormatter *)self stringFromContact:contact attributes:0];
}

- (id)fullNameForContact:(void *)a3 attributes:(uint64_t)a4 style:
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (a4 == 1)
    {
      v53 = +[CN localizedPhoneticNameDelimiterForContact:v7];
      CNContactFormatterStyle v9 = +[CN orderForContactPhoneticName:v7];
      uint64_t v10 = +[CN phoneticOrganizationNameDescription];
      v56 = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];

      v51 = v9;
      uint64_t v12 = [v9 phoneticNameProperties];
    }
    else
    {
      v53 = +[CN localizedNameDelimiterForContact:v7];
      if (a4 == 1003)
      {
        v13 = +[CNContactNameOrderImpl orderForSortOrder:](CNContactNameOrderImpl, "orderForSortOrder:", [a1 sortOrder]);
        uint64_t v14 = +[CN phoneticOrganizationNameDescription];
        v57[0] = v14;
        v15 = +[CN organizationNameDescription];
        v57[1] = v15;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];

        v51 = v13;
        uint64_t v12 = [v13 sortingNameProperties];
      }
      else
      {
        uint64_t v16 = +[CN orderForContactName:v7];
        int v17 = +[CN organizationNameDescription];
        v55 = v17;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];

        v51 = v16;
        uint64_t v12 = [v16 nameProperties];
      }
    }
    uint64_t v18 = (void *)v12;
    v19 = [MEMORY[0x1E4F28E78] string];
    char v20 = a4 == 1003 || [a1 fallbackStyle] == -1;
    if (([a1 ignoresOrganization] & 1) == 0 && objc_msgSend(v7, "contactType") == 1) {
      -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v11, v7, v19, v53, v8, v20);
    }
    v49 = v18;
    v52 = v11;
    if ([v19 length])
    {
      v21 = objc_msgSend(v11, "firstObject", v18);
      v22 = [v21 key];
    }
    else
    {
      -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v18, v7, v19, v53, v8, v20);
      v22 = 0;
    }
    uint64_t v23 = objc_msgSend(v19, "length", v49);
    if (a4 != 1 && !v23 && ([a1 ignoresNickname] & 1) == 0)
    {
      v24 = +[CN nicknameDescription];
      v54 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v25, v7, v19, v53, v8, v20);

      uint64_t v26 = [v24 key];

      v22 = (void *)v26;
    }
    if (![v19 length]
      && ([a1 ignoresOrganization] & 1) == 0
      && [v7 contactType] != 1)
    {
      -[CNContactFormatter appendValueForProperties:fromContact:toString:delimiter:attributes:fallback:]((uint64_t)a1, v52, v7, v19, v53, v8, v20);
      v27 = @"organizationName";

      v22 = v27;
    }
    if (![v19 length])
    {
      uint64_t v32 = [a1 fallbackStyle];
      if (a4 != 1 && v32 == -1)
      {
        if ([v7 isKeyAvailable:@"emailAddresses"])
        {
          v33 = [v7 emailAddresses];
          v34 = [v33 firstObject];

          v35 = [v34 value];
          -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:]((uint64_t)a1, v35, @"emailAddresses", v19, v53, v8);

          v36 = @"emailAddresses";
          v22 = v36;
        }
        if (![v19 length] && objc_msgSend(v7, "isKeyAvailable:", @"phoneNumbers"))
        {
          v37 = [v7 phoneNumbers];
          v38 = [v37 firstObject];

          v39 = [v38 value];
          v40 = [v39 formattedStringValue];
          -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:]((uint64_t)a1, v40, @"phoneNumbers", v19, v53, v8);

          v41 = @"phoneNumbers";
          v22 = v41;
        }
      }
    }
    int v28 = [a1 emphasizesPrimaryNameComponent];
    if (!v8 || !v28) {
      goto LABEL_49;
    }
    v29 = +[CNContactsUserDefaults sharedDefaults];
    uint64_t v30 = [v29 sortOrder];

    if (v22)
    {
LABEL_28:
      if (__58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke((uint64_t)v31, v22, v8))
      {
LABEL_49:
        if ([v19 length]) {
          v47 = (void *)[v19 copy];
        }
        else {
          v47 = 0;
        }

        goto LABEL_53;
      }
LABEL_44:
      char v43 = [@"givenName" isEqual:v22];
      v44 = @"familyName";
      if ((v43 & 1) != 0 || (int v45 = [@"familyName" isEqual:v22], v44 = @"givenName", v45))
      {
        v44 = v44;
        v46 = v44;
      }
      else
      {
        v46 = 0;
      }
      __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke((uint64_t)v44, v46, v8);

      goto LABEL_49;
    }
    if ([v53 length])
    {
      if (v30 == 2)
      {
        v42 = (id *)&CNContactGivenNameKey;
LABEL_43:
        id v31 = *v42;
        v22 = v31;
        if (!v31) {
          goto LABEL_44;
        }
        goto LABEL_28;
      }
      if (v30 == 3)
      {
        v42 = (id *)&CNContactFamilyNameKey;
        goto LABEL_43;
      }
    }
    v22 = 0;
    goto LABEL_44;
  }
  v47 = 0;
LABEL_53:

  return v47;
}

- (unint64_t)fallbackStyle
{
  return self->_fallbackStyle;
}

- (BOOL)ignoresOrganization
{
  return self->_ignoresOrganization;
}

- (BOOL)emphasizesPrimaryNameComponent
{
  return self->_emphasizesPrimaryNameComponent;
}

- (void)appendValueForProperties:(void *)a3 fromContact:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:(char)a7 fallback:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __98__CNContactFormatter_appendValueForProperties_fromContact_toString_delimiter_attributes_fallback___block_invoke;
          aBlock[3] = &unk_1E56B65C0;
          id v20 = v24;
          char v31 = a7;
          id v26 = v20;
          uint64_t v27 = a1;
          id v28 = v12;
          id v29 = v13;
          id v30 = v14;
          v21 = _Block_copy(aBlock);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v19 enumerateObjectsUsingBlock:v21];
          }
          else {
            (*((void (**)(void *, void *, void, void))v21 + 2))(v21, v19, 0, 0);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }
  }
}

void __98__CNContactFormatter_appendValueForProperties_fromContact_toString_delimiter_attributes_fallback___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 CNValueForContact:*(void *)(a1 + 32)];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v9 key];
    -[CNContactFormatter appendValue:derivedFromPropertyName:toString:delimiter:attributes:](v7, v6, v8, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));

    if (!a4) {
      goto LABEL_8;
    }
LABEL_7:
    *a4 = 1;
    goto LABEL_8;
  }
  if (a4 && !*(unsigned char *)(a1 + 72)) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)appendValue:(void *)a3 derivedFromPropertyName:(void *)a4 toString:(void *)a5 delimiter:(void *)a6 attributes:
{
  id v17 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1 && [v17 length])
  {
    if ([v12 length]) {
      [v12 appendString:v13];
    }
    if (v14)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", objc_msgSend(v12, "length"), objc_msgSend(v17, "length"));
      uint64_t v16 = [v14 objectForKey:v15];
      if (!v16)
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
        [v14 setObject:v16 forKey:v15];
      }
      [v16 setObject:v11 forKey:@"contactProperty"];
    }
    [v12 appendString:v17];
  }
}

uint64_t __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CNContactFormatter_fullNameForContact_attributes_style___block_invoke_2;
  v9[3] = &unk_1E56B6598;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(CNContactFormatter *)self attributedStringFromContact:v6 defaultAttributes:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSAttributedString)attributedStringFromContact:(CNContact *)contact defaultAttributes:(NSDictionary *)attributes
{
  id v6 = attributes;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = contact;
  id v9 = [v7 dictionary];
  id v10 = [(CNContactFormatter *)self stringFromContact:v8 attributes:v9];

  if (v10)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10 attributes:v6];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __68__CNContactFormatter_attributedStringFromContact_defaultAttributes___block_invoke;
    uint64_t v18 = &unk_1E56B6570;
    id v19 = v11;
    id v20 = v6;
    id v12 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:&v15];
    id v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18);
  }
  else
  {
    id v13 = 0;
  }

  return (NSAttributedString *)v13;
}

- (void)avatarNameForContact:(void *)a1 attributes:(void *)a2
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = -[CNContactFormatter nameFormatter](v2);
    v2 = -[NSPersonNameComponentsFormatter stringFromContact:](v4, (uint64_t)v3);
  }

  return v2;
}

- (BOOL)ignoresNickname
{
  return self->_ignoresNickname;
}

void __68__CNContactFormatter_attributedStringFromContact_defaultAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 rangeValue];
  uint64_t v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", v5, v6, v7);
  id v9 = [v5 objectForKey:@"contactNameEmphasis"];

  LODWORD(v5) = [v9 BOOLValue];
  if (!v5) {
    return;
  }
  if (LoadCoreText_loadPredicate != -1) {
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_154);
  }
  uint64_t v10 = [*(id *)(a1 + 40) objectForKey:@"contactNameEmphasisFont"];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) attribute:getkCTFontAttributeName() atIndex:v6 effectiveRange:0];
    if (v13) {
      uint64_t CopyWithSymbolicTraits = softLinkCTFontCreateCopyWithSymbolicTraits(v13, 0, 2, 2, 0.0);
    }
    else {
      uint64_t CopyWithSymbolicTraits = softLinkCTFontCreateUIFontForLanguage(3, 0, 0.0);
    }
    id v12 = (const void *)CopyWithSymbolicTraits;
    uint64_t v11 = CopyWithSymbolicTraits;
    if (!CopyWithSymbolicTraits) {
      return;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", getkCTFontAttributeName(), v11, v6, v8);
  if (v12)
  {
    CFRelease(v12);
  }
}

- (void)setFallbackStyle:(unint64_t)a3
{
  self->_fallbackStyle = a3;
}

- (void)setEmphasizesPrimaryNameComponent:(BOOL)a3
{
  self->_emphasizesPrimaryNameComponent = a3;
}

+ (id)posterNameComponentsForContact:(id)a3
{
  id v4 = a3;
  id v5 = +[CNContactsUserDefaults sharedDefaults];
  uint64_t v6 = objc_msgSend(a1, "posterNameComponentsForContact:nameOrder:localeEmphasisStyle:preferNicknames:", v4, 0, 4, objc_msgSend(v5, "shortNameFormatPrefersNicknames"));

  return v6;
}

+ (id)posterNameComponentsForContact:(id)a3 nameOrder:(int64_t)a4 localeEmphasisStyle:(int64_t)a5 preferNicknames:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [MEMORY[0x1E4F28F30] componentsForContact:v9];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v12 setStyle:2];
  unint64_t v13 = +[CNContactFormatter nameEmphasisStyleForContact:v9 localeBasedEmphasisStyle:a5 preferNickname:v6];
  int64_t v14 = +[CNContactFormatter singleNameStyleForContact:v9];
  if (v13 == 2) {
    goto LABEL_5;
  }
  if (v13 == 3)
  {
    uint64_t v15 = [v9 nickname];
    [v10 setFirstNameComponent:v15];

    [v10 setEmphasizedNameComponentIndex:0];
    BOOL v16 = 0;
LABEL_4:
    [v10 setSingleNameComponentIndex:v16];
    goto LABEL_5;
  }
  int64_t v26 = v14;
  if (!a4) {
    a4 = [v12 _nameOrderWithOverridesForComponents:v11];
  }
  if (a4 == 2)
  {
    char v31 = [v11 familyName];
    uint64_t v32 = [v31 length];

    if (!v32) {
      goto LABEL_5;
    }
    long long v33 = [v11 familyName];
    if ([v33 length])
    {
      long long v34 = [v11 familyName];
      [v10 setFirstNameComponent:v34];
    }
    else
    {
      [v10 setFirstNameComponent:&stru_1EE052B80];
    }

    uint64_t v37 = [v11 givenName];
    if ([v37 length])
    {
      v38 = [v11 givenName];
      [v10 setSecondNameComponent:v38];
    }
    else
    {
      [v10 setSecondNameComponent:0];
    }

    if (v13)
    {
      if (v13 != 1)
      {
LABEL_40:
        BOOL v16 = v26 == 0;
        goto LABEL_4;
      }
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 1;
    }
    [v10 setEmphasizedNameComponentIndex:v39];
    goto LABEL_40;
  }
  if (a4 == 1)
  {
    uint64_t v27 = [v11 givenName];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      id v29 = [v11 givenName];
      if ([v29 length])
      {
        id v30 = [v11 givenName];
        [v10 setFirstNameComponent:v30];
      }
      else
      {
        [v10 setFirstNameComponent:&stru_1EE052B80];
      }

      long long v35 = [v11 familyName];
      if ([v35 length])
      {
        v36 = [v11 familyName];
        [v10 setSecondNameComponent:v36];
      }
      else
      {
        [v10 setSecondNameComponent:0];
      }

      if (v13 <= 1) {
        [v10 setEmphasizedNameComponentIndex:v13];
      }
      BOOL v16 = v26 != 0;
      goto LABEL_4;
    }
  }
LABEL_5:
  id v17 = [v10 firstNameComponent];
  uint64_t v18 = [v17 length];

  if (!v18)
  {
    id v19 = [v12 stringFromPersonNameComponents:v11];
    [v10 setFirstNameComponent:v19];
  }
  id v20 = [v10 firstNameComponent];
  uint64_t v21 = [v20 length];

  if (!v21)
  {
    v22 = [v9 organizationName];
    [v10 setFirstNameComponent:v22];
  }
  uint64_t v23 = [v10 secondNameComponent];
  uint64_t v24 = [v23 length];

  if (!v24) {
    [v10 setSingleNameComponentIndex:0];
  }

  return v10;
}

+ (NSAttributedString)attributedStringFromContact:(CNContact *)contact style:(CNContactFormatterStyle)style defaultAttributes:(NSDictionary *)attributes
{
  uint64_t v8 = attributes;
  id v9 = contact;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setStyle:style];
  uint64_t v11 = [v10 attributedStringFromContact:v9 defaultAttributes:v8];

  return (NSAttributedString *)v11;
}

void __56__CNContactFormatter_descriptorForRequiredKeysForStyle___block_invoke_2(uint64_t a1)
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  v10[1] = @"phoneticGivenName";
  v10[2] = @"phoneticMiddleName";
  v10[3] = @"phoneticFamilyName";
  v10[4] = @"phoneticOrganizationName";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  id v4 = NSString;
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  BOOL v6 = [v4 stringWithFormat:@"Formatter style: %@", v5];
  uint64_t v7 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v3 description:v6];
  uint64_t v8 = [v7 copy];
  id v9 = (void *)descriptorForRequiredKeysForStyle__cn_once_object_2;
  descriptorForRequiredKeysForStyle__cn_once_object_2 = v8;
}

+ (id)descriptorForRequiredKeysForNameOrder
{
  if (descriptorForRequiredKeysForNameOrder_cn_once_token_4 != -1) {
    dispatch_once(&descriptorForRequiredKeysForNameOrder_cn_once_token_4, &__block_literal_global_62);
  }
  v2 = (void *)descriptorForRequiredKeysForNameOrder_cn_once_object_4;

  return v2;
}

void __59__CNContactFormatter_descriptorForRequiredKeysForNameOrder__block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v0 = +[NSPersonNameComponents keyVectorForUsedKeys]();
  uint64_t v1 = (void *)[v0 mutableCopy];

  v2 = +[CN keyVectorForAllUsedKeysForInternationalSupport];
  [v1 unionKeyVector:v2];

  v7[0] = v1;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v3 description:@"Name order"];

  uint64_t v5 = [v4 copy];
  BOOL v6 = (void *)descriptorForRequiredKeysForNameOrder_cn_once_object_4;
  descriptorForRequiredKeysForNameOrder_cn_once_object_4 = v5;
}

+ (CNContactDisplayNameOrder)nameOrderForContact:(CNContact *)contact
{
  id v3 = contact;
  id v4 = (void *)MEMORY[0x1E4F28F38];
  uint64_t v5 = [MEMORY[0x1E4F28F30] componentsForContact:v3];
  uint64_t v6 = [v4 _nameOrderWithOverridesForComponents:v5 options:0];

  CNContactDisplayNameOrder v7 = +[NSPersonNameComponentsFormatter contactsNameOrderFromFoundationNameOrder:](MEMORY[0x1E4F28F38], v6);
  if (+[CN isEmptyNameContact:phonetic:includingPrefixAndSuffix:](CN, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v3, 0, 1)&& +[CN isEmptyNameContact:v3 phonetic:1 includingPrefixAndSuffix:1])
  {
    uint64_t v8 = +[CNContactsUserDefaults sharedDefaults];
    CNContactDisplayNameOrder v7 = [v8 newContactDisplayNameOrder];
  }
  return v7;
}

+ (int64_t)nameEmphasisStyleForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNContactsUserDefaults sharedDefaults];
  int64_t v6 = objc_msgSend(a1, "nameEmphasisStyleForContact:localeBasedEmphasisStyle:preferNickname:", v4, 4, objc_msgSend(v5, "shortNameFormatPrefersNicknames"));

  return v6;
}

+ (int64_t)nameEmphasisStyleForContact:(id)a3 localeBasedEmphasisStyle:(int64_t)a4 preferNickname:(BOOL)a5
{
  id v8 = a3;
  id v9 = [v8 nickname];
  uint64_t v10 = [v9 length];

  if (v10 && a5)
  {
    a4 = 3;
  }
  else if (+[CN hasContactChineseJapaneseKoreanName:v8])
  {
    a4 = 2;
  }
  else if (a4 == 4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__CNContactFormatter_nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname__onceToken != -1) {
      dispatch_once(&nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname__onceToken, block);
    }
    a4 = nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___localeEmphasisStyle;
  }

  return a4;
}

void __90__CNContactFormatter_nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v1 pathForResource:@"CNContactNameFormatStyle" ofType:@"plist"];
  id v5 = [v0 dictionaryWithContentsOfFile:v2];

  id v3 = [v5 objectForKeyedSubscript:@"_LOCALIZABLE_"];
  id v4 = [v3 objectForKey:@"CNContactNameFormatStyle"];
  nameEmphasisStyleForContact_localeBasedEmphasisStyle_preferNickname___localeEmphasisStyle = [v4 integerValue];
}

+ (int64_t)singleNameStyleForContact:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CNContactFormatter_singleNameStyleForContact___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleNameStyleForContact__onceToken != -1) {
    dispatch_once(&singleNameStyleForContact__onceToken, block);
  }
  return singleNameStyleForContact___localeSingleNameStyle;
}

void __48__CNContactFormatter_singleNameStyleForContact___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v1 pathForResource:@"CNContactNameFormatStyle" ofType:@"plist"];
  id v6 = [v0 dictionaryWithContentsOfFile:v2];

  id v3 = [v6 objectForKeyedSubscript:@"_LOCALIZABLE_"];
  id v4 = [v3 objectForKey:@"CNContactSingleNameStyle"];

  if (v4) {
    uint64_t v5 = [v4 integerValue];
  }
  else {
    uint64_t v5 = 0;
  }
  singleNameStyleForContact___localeSingleNameStyle = v5;
}

+ (id)descriptorForRequiredKeysForDelimiter
{
  return (id)[MEMORY[0x1E4F28F30] descriptorForUsedKeys];
}

+ (NSString)delimiterForContact:(CNContact *)contact
{
  id v3 = (void *)MEMORY[0x1E4F28F38];
  id v4 = [MEMORY[0x1E4F28F30] componentsForContact:contact];
  uint64_t v5 = [v3 _localizedDelimiterForComponents:v4 options:0];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactFormatter)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CNContactFormatter;
  uint64_t v5 = [(CNContactFormatter *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v5->_ignoresNickname = [v4 decodeBoolForKey:@"ignoresNickname"];
    v5->_ignoresOrganization = [v4 decodeBoolForKey:@"ignoresOrganization"];
    v5->_fallbackStyle = [v4 decodeIntegerForKey:@"fallbackStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactFormatter;
  id v4 = a3;
  [(CNContactFormatter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"style", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_ignoresOrganization forKey:@"ignoresOrganization"];
  [v4 encodeBool:self->_ignoresNickname forKey:@"ignoresNickname"];
  [v4 encodeInteger:self->_fallbackStyle forKey:@"fallbackStyle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactFormatter;
  id v4 = [(CNContactFormatter *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setIgnoresNickname:", -[CNContactFormatter ignoresNickname](self, "ignoresNickname"));
  objc_msgSend(v4, "setIgnoresOrganization:", -[CNContactFormatter ignoresOrganization](self, "ignoresOrganization"));
  objc_msgSend(v4, "setFallbackStyle:", -[CNContactFormatter fallbackStyle](self, "fallbackStyle"));
  objc_msgSend(v4, "setStyle:", -[CNContactFormatter style](self, "style"));
  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(CNContactFormatter *)self stringFromContact:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (void)setIgnoresOrganization:(BOOL)a3
{
  self->_ignoresOrganization = a3;
}

- (void)setIgnoresNickname:(BOOL)a3
{
  self->_ignoresNickname = a3;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int64_t)a3
{
  self->_sortOrder = a3;
}

- (id)stringFromPotentiallySuggestedContact:(id)a3 relatedToProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactFormatter *)self stringFromContact:v7];
  char v9 = [v7 isSuggested];

  if ((v9 & 1) != 0
    || ([v6 labeledValue],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isSuggested],
        v10,
        v11))
  {
    id v12 = [MEMORY[0x1E4F5A430] localizedStringForString:@"MAYBE_FORMAT-%@" class:objc_opt_class() returningNilIfNotFound:0];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v12, v8);

    id v8 = (void *)v13;
  }

  return v8;
}

@end