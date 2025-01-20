@interface ABSPerson
+ (BOOL)shortNameFormatEnabled;
+ (BOOL)shortNameFormatPrefersNicknames;
+ (id)copyCompositeNameDelimiterForPerson:(id)a3;
+ (id)createPeopleInSource:(id)a3 withVCardRepresentation:(id)a4;
+ (id)defaultKeysToFetch;
+ (id)localizedNameForProperty:(int)a3;
+ (id)nameForProperty:(int)a3;
+ (id)propertyKeyForPropertyID:(int)a3;
+ (id)vCardRepresentationForPeople:(id)a3;
+ (unsigned)compositeNameFormat;
+ (unsigned)compositeNameFormatForPerson:(id)a3;
+ (unsigned)sortOrdering;
+ (unsigned)typeForProperty:(int)a3;
+ (void)initialize;
+ (void)setCompositeNameFormat:(unsigned int)a3;
- (ABSAddressBook)addressBook;
- (ABSPerson)init;
- (ABSPerson)initWithMutableContact:(id)a3;
- (ABSPerson)initWithMutableContact:(id)a3 source:(id)a4;
- (ABSPerson)initWithSource:(id)a3;
- (ABSSource)source;
- (BOOL)completeCNImplIfNeededWithKeysToFetch:(id)a3;
- (BOOL)getIdentifier:(int *)a3 label:(id *)a4 forMultiValueMatchingValue:(id)a5 property:(int)a6;
- (BOOL)hasImageData;
- (BOOL)removeImageDataWithError:(id *)a3;
- (BOOL)removeProperty:(int)a3 withError:(id *)a4;
- (BOOL)setImageData:(id)a3 withError:(id *)a4;
- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5;
- (CNMutableContact)cnImpl;
- (NSMutableSet)nonNilSetProperties;
- (NSString)CNIdentifierString;
- (NSString)compositeName;
- (NSString)description;
- (NSString)revertedRecordIdentifier;
- (id)compositeNameIgnoringOrganization:(BOOL)a3;
- (id)copyCompositeNameDelimiter;
- (id)copyImageData;
- (id)copyImageDataWithFormat:(int)a3;
- (id)linkedPeople;
- (id)shortName;
- (id)soundIdentifierForMultivalueIdentifier:(int)a3;
- (id)stringFromFormatter:(id)a3;
- (int)id;
- (int64_t)comparePersonByName:(id)a3 sortOrdering:(unsigned int)a4;
- (unsigned)compositeNameFormat;
- (unsigned)type;
- (void)copyValueForProperty:(int)a3;
- (void)replaceRecordStorageWithCNObject:(id)a3;
- (void)setAddressBook:(id)a3;
- (void)setCnImpl:(id)a3;
- (void)setNonNilSetProperties:(id)a3;
- (void)setRevertedRecordIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)setValue:(id)a3 forSoundIdentifier:(int)a4;
@end

@implementation ABSPerson

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSPerson;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize];
}

+ (id)defaultKeysToFetch
{
  if (defaultKeysToFetch_cn_once_token_1 != -1) {
    dispatch_once(&defaultKeysToFetch_cn_once_token_1, &__block_literal_global);
  }
  objc_super v2 = (void *)defaultKeysToFetch_cn_once_object_1;

  return v2;
}

void __31__ABSPerson_defaultKeysToFetch__block_invoke()
{
  v7[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFDFB8];
  v7[0] = *MEMORY[0x263EFDFC8];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFE068];
  v7[2] = *MEMORY[0x263EFE038];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x263EFE050];
  v7[4] = *MEMORY[0x263EFE148];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x263EFE048];
  v7[6] = *MEMORY[0x263EFE040];
  v7[7] = v3;
  v7[8] = *MEMORY[0x263EFDFD8];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:9];
  uint64_t v5 = [v4 copy];
  v6 = (void *)defaultKeysToFetch_cn_once_object_1;
  defaultKeysToFetch_cn_once_object_1 = v5;
}

+ (unsigned)typeForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];
  unsigned int v7 = [v6 absPropertyType];

  return v7;
}

+ (id)localizedNameForProperty:(int)a3
{
  uint64_t v3 = [a1 nameForProperty:*(void *)&a3];
  v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:v3 value:&stru_26C58E308 table:0];

  return v5;
}

+ (id)nameForProperty:(int)a3
{
  switch(a3)
  {
    case 20:
      return @"Prefix";
    case 0:
      return @"First";
    case 6:
      return @"Middle";
    case 1:
      return @"Last";
    case 21:
      return @"Suffix";
    case 19:
      return @"Nickname";
    case 7:
      return @"FirstPhonetic";
    case 8:
      return @"MiddlePhonetic";
    case 9:
      return @"LastPhonetic";
    case 10:
      return @"Organization";
    case 11:
      return @"Department";
    case 18:
      return @"JobTitle";
    case 17:
      return @"Birthday";
    case 14:
      return @"Note";
    case 3:
      return @"Phone";
    case 4:
      return @"Email";
    case 22:
      return @"URLs";
    case 12:
      return @"Date";
    case 13:
      return @"IM";
    case 46:
      return @"SocialProfile";
    case 5:
      return @"Address";
    case 23:
      return @"RelatedNames";
  }
  return @"UNKNOWN_PROPERTY";
}

+ (unsigned)compositeNameFormat
{
  return [a1 compositeNameFormatForPerson:0];
}

+ (unsigned)compositeNameFormatForPerson:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForNameOrder];
  v15[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v6 = [v3 completeCNImplIfNeededWithKeysToFetch:v5];

  if (v6)
  {
    unsigned int v7 = (void *)MEMORY[0x263EFEA20];
    v8 = [v3 cnImpl];
    uint64_t v9 = [v7 nameOrderForContact:v8];

    v10 = +[ABSConstantsMapping CNToABCompositeNameFormatConstantsMapping];
    v11 = [NSNumber numberWithInteger:v9];
    v12 = [v10 mappedConstant:v11];
    unsigned int v13 = [v12 intValue];
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

+ (void)setCompositeNameFormat:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[ABSConstantsMapping ABtoCNContactDisplayNameOrderConstantsMapping];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  int v6 = [v4 mappedConstant:v5];
  uint64_t v7 = (int)[v6 intValue];

  id v8 = [MEMORY[0x263EFEA78] sharedDefaults];
  [v8 setDisplayNameOrder:v7];
}

+ (id)copyCompositeNameDelimiterForPerson:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    v11[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    int v6 = [v3 completeCNImplIfNeededWithKeysToFetch:v5];

    uint64_t v7 = 0;
    if (v6)
    {
      id v8 = (void *)MEMORY[0x263EFEA20];
      uint64_t v9 = [v3 cnImpl];
      uint64_t v7 = [v8 delimiterForContact:v9];
    }
  }
  else
  {
    uint64_t v7 = @" ";
  }

  return v7;
}

+ (unsigned)sortOrdering
{
  uint64_t v2 = [MEMORY[0x263EFEA78] sharedDefaults];
  uint64_t v3 = [v2 sortOrder];

  v4 = +[ABSConstantsMapping CNToABPersonSortOrderingConstantsMapping];
  uint64_t v5 = [NSNumber numberWithInteger:v3];
  int v6 = [v4 mappedConstant:v5];
  unsigned int v7 = [v6 intValue];

  return v7;
}

+ (BOOL)shortNameFormatEnabled
{
  uint64_t v2 = [MEMORY[0x263EFEA78] sharedDefaults];
  char v3 = [v2 isShortNameFormatEnabled];

  return v3;
}

+ (BOOL)shortNameFormatPrefersNicknames
{
  uint64_t v2 = [MEMORY[0x263EFEA78] sharedDefaults];
  char v3 = [v2 shortNameFormatPrefersNicknames];

  return v3;
}

+ (id)vCardRepresentationForPeople:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFEA70] descriptorForRequiredKeys];
  v26[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];

  int v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 completeCNImplIfNeededWithKeysToFetch:v5])
        {
          unsigned int v13 = [v12 cnImpl];
        }
        else
        {
          v14 = (void *)MEMORY[0x263EFE9F8];
          v15 = [v12 cnImpl];
          unsigned int v13 = [v14 makeContactAndMergeValuesFromAvailableKeysInContact:v15];
        }
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v20 = 0;
  v16 = [MEMORY[0x263EFEA70] dataWithContacts:v6 error:&v20];
  id v17 = v20;
  v18 = v17;
  if (!v16) {
    NSLog(&cfstr_ErrorCreatingV.isa, v17);
  }

  return v16;
}

+ (id)createPeopleInSource:(id)a3 withVCardRepresentation:(id)a4
{
  id v6 = a3;
  id v15 = 0;
  id v7 = [MEMORY[0x263EFEA70] contactsWithData:a4 error:&v15];
  id v8 = v15;
  uint64_t v9 = v8;
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__ABSPerson_createPeopleInSource_withVCardRepresentation___block_invoke;
    v12[3] = &unk_264223A28;
    id v14 = a1;
    id v13 = v6;
    uint64_t v10 = objc_msgSend(v7, "_cn_map:", v12);
  }
  else
  {
    NSLog(&cfstr_ErrorDeseriali.isa, v8);
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

id __58__ABSPerson_createPeopleInSource_withVCardRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  v4 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithMutableContact:v3 source:*(void *)(a1 + 32)];

  return v4;
}

- (ABSPerson)init
{
  return [(ABSPerson *)self initWithMutableContact:0 source:0];
}

- (ABSPerson)initWithMutableContact:(id)a3
{
  return [(ABSPerson *)self initWithMutableContact:a3 source:0];
}

- (ABSPerson)initWithSource:(id)a3
{
  return [(ABSPerson *)self initWithMutableContact:0 source:a3];
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(ABSPerson *)self compositeName];
  id v5 = (id)[v3 appendName:@"name" object:v4];

  id v6 = (id)objc_msgSend(v3, "appendName:intValue:", @"iOSLegacyIdentifier", -[ABSPerson id](self, "id"));
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (ABSPerson)initWithMutableContact:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ABSPerson;
  id v8 = [(ABSPerson *)&v12 init];
  if (v8)
  {
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFEAF0]);
      uint64_t v9 = [MEMORY[0x263EFF9C0] set];
      nonNilSetProperties = v8->_nonNilSetProperties;
      v8->_nonNilSetProperties = (NSMutableSet *)v9;
    }
    objc_storeStrong((id *)&v8->_cnImpl, v6);
    objc_storeWeak((id *)&v8->_source, v7);
  }

  return v8;
}

- (CNMutableContact)cnImpl
{
  v10[1] = *MEMORY[0x263EF8340];
  if (!self->_cnImpl)
  {
    id v3 = [(ABSPerson *)self revertedRecordIdentifier];

    if (v3)
    {
      v4 = [(ABSPerson *)self addressBook];
      id v5 = [(ABSPerson *)self revertedRecordIdentifier];
      v10[0] = v5;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      id v7 = (id)[v4 peopleWithCNIdentifiers:v6];
    }
  }
  cnImpl = self->_cnImpl;

  return cnImpl;
}

- (BOOL)completeCNImplIfNeededWithKeysToFetch:(id)a3
{
  id v4 = a3;
  id v5 = [(ABSPerson *)self cnImpl];
  char v6 = [v5 areKeysAvailable:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = [(ABSPerson *)self addressBook];

    if (!v7)
    {
      NSLog(&cfstr_RecordDoesnTBe.isa);
      BOOL v9 = 0;
      goto LABEL_6;
    }
    id v8 = [(ABSPerson *)self addressBook];
    [v8 completePerson:self withKeysToFetch:v4];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (int)id
{
  uint64_t v2 = [(ABSPerson *)self cnImpl];
  int v3 = [v2 iOSLegacyIdentifier];

  if (v3) {
    return v3;
  }
  else {
    return -1;
  }
}

- (ABSSource)source
{
  p_source = &self->_source;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_source);
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([(ABSPerson *)self id] == -1
    || ([(ABSPerson *)self addressBook],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v6 sourceForRecord:self],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        objc_storeWeak((id *)p_source, v5),
        !v5))
  {
LABEL_6:
    id v7 = [(ABSPerson *)self addressBook];
    id v5 = [v7 defaultSource];

    objc_storeWeak((id *)p_source, v5);
  }
LABEL_7:

  return (ABSSource *)v5;
}

- (NSString)CNIdentifierString
{
  uint64_t v2 = [(ABSPerson *)self cnImpl];
  int v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unsigned)type
{
  return 0;
}

- (NSString)compositeName
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v10[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  BOOL v5 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v4];

  char v6 = 0;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263EFEA20];
    id v8 = [(ABSPerson *)self cnImpl];
    char v6 = [v7 stringFromContact:v8 style:0];
  }

  return (NSString *)v6;
}

- (id)compositeNameIgnoringOrganization:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFEA20]);
  [v5 setStyle:0];
  [v5 setIgnoresOrganization:v3];
  char v6 = [(ABSPerson *)self stringFromFormatter:v5];

  return v6;
}

- (id)shortName
{
  id v3 = objc_alloc_init(MEMORY[0x263EFEA20]);
  [v3 setStyle:1000];
  id v4 = [(ABSPerson *)self stringFromFormatter:v3];

  return v4;
}

- (id)stringFromFormatter:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 descriptorForRequiredKeys];
  v11[0] = v5;
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  BOOL v7 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v6];

  if (v7)
  {
    id v8 = [(ABSPerson *)self cnImpl];
    BOOL v9 = [v4 stringFromContact:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)copyValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  char v6 = [NSNumber numberWithInt:v3];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7) {
    goto LABEL_13;
  }
  id v8 = [v7 key];
  v24[0] = v8;
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  BOOL v10 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v9];

  if (!v10) {
    goto LABEL_13;
  }
  v11 = [(ABSPerson *)self cnImpl];
  objc_super v12 = [v7 key];
  int v13 = [v11 isKeyAvailable:v12];

  if (v13)
  {
    id v14 = [(ABSPerson *)self cnImpl];
    id v15 = [v7 CNValueForContact:v14];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v15 count])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v15 length]) {
        goto LABEL_10;
      }
    }
    uint64_t v16 = [(ABSPerson *)self nonNilSetProperties];
    if (!v16) {
      goto LABEL_10;
    }
    id v17 = (void *)v16;
    v18 = [(ABSPerson *)self nonNilSetProperties];
    v19 = [NSNumber numberWithInt:v3];
    int v20 = [v18 containsObject:v19];

    if (!v20)
    {
      CFTypeRef v22 = 0;
    }
    else
    {
LABEL_10:
      long long v21 = (void *)[v15 copy];
      CFTypeRef v22 = (CFTypeRef)[v7 ABSValueFromCNValue:v21];

      if (v22) {
        CFTypeRef v22 = CFRetain(v22);
      }
    }
  }
  else
  {
LABEL_13:
    CFTypeRef v22 = 0;
  }

  return (void *)v22;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  uint64_t v6 = *(void *)&a4;
  v29[1] = *MEMORY[0x263EF8340];
  BOOL v9 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  BOOL v10 = [NSNumber numberWithInt:v6];
  v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    objc_super v12 = [(ABSPerson *)self nonNilSetProperties];

    if (a3 && v12)
    {
      int v13 = [(ABSPerson *)self nonNilSetProperties];
      id v14 = [NSNumber numberWithInt:v6];
      [v13 addObject:v14];
    }
    id v28 = 0;
    int v15 = [v11 convertABSValue:a3 toCNValue:&v28 error:a5];
    id v16 = v28;
    if (v15)
    {
      id v17 = [v11 key];
      v29[0] = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
      BOOL v19 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v18];

      if (v19)
      {
        int v20 = [(ABSPerson *)self cnImpl];
        long long v21 = [v11 key];
        int v22 = [v20 isKeyAvailable:v21];

        if (v22)
        {
          long long v23 = (void *)[v16 copy];
          long long v24 = [(ABSPerson *)self cnImpl];
          [v11 setCNValue:v23 onContact:v24];

          v25 = [(ABSPerson *)self addressBook];
          [v25 recordUpdated:self];

          BOOL v26 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"ABSAddressBookErrorDomain" code:1 userInfo:0];
        BOOL v26 = 0;
        *a5 = (__CFError *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    BOOL v26 = 0;
    goto LABEL_13;
  }
  BOOL v26 = 1;
LABEL_14:

  return v26;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v21[1] = *MEMORY[0x263EF8340];
  BOOL v7 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  id v8 = [NSNumber numberWithInt:v5];
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    goto LABEL_7;
  }
  BOOL v10 = [v9 key];
  v21[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  BOOL v12 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v11];

  if (!v12)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ABSAddressBookErrorDomain" code:1 userInfo:0];
      BOOL v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    BOOL v19 = 0;
    goto LABEL_8;
  }
  int v13 = [(ABSPerson *)self cnImpl];
  id v14 = [v9 key];
  int v15 = [v13 isKeyAvailable:v14];

  if (!v15) {
    goto LABEL_7;
  }
  id v16 = [v9 nilValue];
  id v17 = [(ABSPerson *)self cnImpl];
  [v9 setCNValue:v16 onContact:v17];

  v18 = [(ABSPerson *)self addressBook];
  [v18 recordUpdated:self];

  BOOL v19 = 1;
LABEL_8:

  return v19;
}

- (id)linkedPeople
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ABSPerson *)self addressBook];
  id v4 = [v3 peopleLinkedToPerson:self];

  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v7[0] = self;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

    id v4 = (void *)v5;
  }

  return v4;
}

- (unsigned)compositeNameFormat
{
  uint64_t v3 = objc_opt_class();

  return [v3 compositeNameFormatForPerson:self];
}

- (id)copyCompositeNameDelimiter
{
  uint64_t v3 = objc_opt_class();

  return (id)[v3 copyCompositeNameDelimiterForPerson:self];
}

- (BOOL)setImageData:(id)a3 withError:(id *)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = v6;
  long long v8 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v20 = *MEMORY[0x263F001A8];
  long long v21 = v8;
  if (v6)
  {
    BOOL v9 = ABSCreateThumbnailDataAndCropRectFromImageData(v6, (double *)&v20);
    if (!v9)
    {
      LOBYTE(v10) = 0;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v11 = *MEMORY[0x263EFE140];
  v22[0] = *MEMORY[0x263EFDFF8];
  v22[1] = v11;
  v22[2] = *MEMORY[0x263EFDF60];
  BOOL v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v22, 3, v20, v21);
  BOOL v10 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v12];

  if (v10)
  {
    int v13 = [(ABSPerson *)self cnImpl];
    [v13 setImageData:v7];

    id v14 = [(ABSPerson *)self cnImpl];
    [v14 setThumbnailImageData:v9];

    long long v15 = v20;
    long long v16 = v21;
    id v17 = [(ABSPerson *)self cnImpl];
    objc_msgSend(v17, "setCropRect:", v15, v16);

    v18 = [(ABSPerson *)self addressBook];
    [v18 recordUpdated:self];
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ABSAddressBookErrorDomain" code:1 userInfo:0];
  }
  if (v9) {
    CFRelease(v9);
  }
LABEL_11:

  return v10;
}

- (id)copyImageData
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263EFDFF8];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  BOOL v4 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v3];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ABSPerson *)self cnImpl];
  CFDataRef v6 = [v5 imageData];
  CFDataRef v7 = (void *)[v6 copy];

  return v7;
}

- (id)copyImageDataWithFormat:(int)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v9[0] = *MEMORY[0x263EFE140];
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    BOOL v6 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v5];

    if (v6)
    {
      CFDataRef v7 = [(ABSPerson *)self cnImpl];
      long long v8 = [v7 thumbnailImageData];

      return v8;
    }
    return 0;
  }
  if (a3 != 2) {
    return 0;
  }

  return [(ABSPerson *)self copyImageData];
}

- (BOOL)hasImageData
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263EFDFF0];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  BOOL v4 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v3];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ABSPerson *)self cnImpl];
  char v6 = [v5 imageDataAvailable];

  return v6;
}

- (BOOL)removeImageDataWithError:(id *)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263EFDFF8];
  v24[0] = *MEMORY[0x263EFDFF8];
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  BOOL v7 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v6];

  if (!v7)
  {
    if (a3)
    {
      id v23 = [MEMORY[0x263F087E8] errorWithDomain:@"ABSAddressBookErrorDomain" code:1 userInfo:0];
      BOOL result = 0;
      *a3 = v23;
      return result;
    }
    return 0;
  }
  long long v8 = [(ABSPerson *)self cnImpl];
  int v9 = [v8 isKeyAvailable:v5];

  if (!v9) {
    return 0;
  }
  BOOL v10 = [(ABSPerson *)self cnImpl];
  [v10 setImageData:0];

  uint64_t v11 = [(ABSPerson *)self cnImpl];
  int v12 = [v11 isKeyAvailable:*MEMORY[0x263EFE140]];

  if (v12)
  {
    int v13 = [(ABSPerson *)self cnImpl];
    [v13 setThumbnailImageData:0];
  }
  id v14 = [(ABSPerson *)self cnImpl];
  int v15 = [v14 isKeyAvailable:*MEMORY[0x263EFDF60]];

  if (v15)
  {
    double v16 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    long long v20 = [(ABSPerson *)self cnImpl];
    objc_msgSend(v20, "setCropRect:", v16, v17, v18, v19);
  }
  long long v21 = [(ABSPerson *)self addressBook];
  [v21 recordUpdated:self];

  return 1;
}

- (int64_t)comparePersonByName:(id)a3 sortOrdering:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = +[ABSConstantsMapping ABToCNContactSortOrderConstantsMapping];
  long long v8 = [NSNumber numberWithUnsignedInt:v4];
  int v9 = [v7 mappedConstant:v8];
  uint64_t v10 = (int)[v9 intValue];

  uint64_t v11 = [MEMORY[0x263EFE9F8] comparatorForNameSortOrder:v10];
  int v12 = [MEMORY[0x263EFE9F8] descriptorForAllComparatorKeys];
  v22[0] = v12;
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  LODWORD(v10) = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v13];

  if (!v10) {
    goto LABEL_4;
  }
  id v14 = [MEMORY[0x263EFE9F8] descriptorForAllComparatorKeys];
  long long v21 = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  int v16 = [v6 completeCNImplIfNeededWithKeysToFetch:v15];

  if (v16)
  {
    double v17 = [(ABSPerson *)self cnImpl];
    double v18 = [v6 cnImpl];
    int64_t v19 = ((uint64_t (**)(void, void *, void *))v11)[2](v11, v17, v18);
  }
  else
  {
LABEL_4:
    int64_t v19 = 0;
  }

  return v19;
}

+ (id)propertyKeyForPropertyID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = [v6 key];

  return v7;
}

- (void)setAddressBook:(id)a3
{
  objc_storeWeak((id *)&self->_addressBook, a3);

  [(ABSPerson *)self setNonNilSetProperties:0];
}

- (void)replaceRecordStorageWithCNObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(&cfstr_StorageOfAbspe.isa);
      uint64_t v6 = [v5 mutableCopy];

      uint64_t v5 = (void *)v6;
    }
    id v7 = v5;
  }
  else
  {
    long long v8 = [(ABSPerson *)self cnImpl];
    int v9 = [v8 identifier];
    [(ABSPerson *)self setRevertedRecordIdentifier:v9];

    id v7 = 0;
  }
  id v10 = v7;
  [(ABSPerson *)self setCnImpl:v7];
}

- (BOOL)getIdentifier:(int *)a3 label:(id *)a4 forMultiValueMatchingValue:(id)a5 property:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    objc_opt_class();
    uint64_t v11 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
    int v12 = [NSNumber numberWithInt:v6];
    int v13 = [v11 objectForKeyedSubscript:v12];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    BOOL v16 = v15 != 0;
    if (v15)
    {
      double v17 = [(ABSPerson *)self copyValueForProperty:v6];
      double v18 = [v17 allValues];
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      long long v24 = __69__ABSPerson_getIdentifier_label_forMultiValueMatchingValue_property___block_invoke;
      v25 = &unk_264223A50;
      id v26 = v15;
      id v27 = v10;
      uint64_t v19 = objc_msgSend(v18, "_cn_indexOfFirstObjectPassingTest:", &v22);

      if (a3) {
        *a3 = objc_msgSend(v17, "identifierAtIndex:", v19, v22, v23, v24, v25, v26);
      }
      if (a4)
      {
        id v20 = [v17 labelAtIndex:v19];
        *a4 = v20;
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

uint64_t __69__ABSPerson_getIdentifier_label_forMultiValueMatchingValue_property___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isABSLabeledValueValue:*(void *)(a1 + 40) equalToValue:a2];
}

- (id)soundIdentifierForMultivalueIdentifier:(int)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v14[0] = *MEMORY[0x263EFE138];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  BOOL v6 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v5];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_14;
  }
  id v7 = [(ABSPerson *)self cnImpl];
  long long v8 = [v7 textAlert];

  switch(a3)
  {
    case -102:
      int v9 = [v8 vibration];
      break;
    case -5:
      int v11 = [v8 ignoreMute];
      int v12 = @"YES";
      if (!v11) {
        int v12 = 0;
      }
      int v9 = v12;
      break;
    case -2:
      int v9 = [v8 sound];
      break;
    default:
      id v10 = 0;
      goto LABEL_13;
  }
  id v10 = v9;
LABEL_13:

LABEL_14:

  return v10;
}

- (void)setValue:(id)a3 forSoundIdentifier:(int)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17[0] = *MEMORY[0x263EFE138];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  BOOL v8 = [(ABSPerson *)self completeCNImplIfNeededWithKeysToFetch:v7];

  if (v8)
  {
    int v9 = [(ABSPerson *)self cnImpl];
    id v10 = [v9 textAlert];

    id v11 = objc_alloc(MEMORY[0x263EFEAE8]);
    int v12 = [v10 sound];
    int v13 = [v10 vibration];
    id v14 = objc_msgSend(v11, "initWithSound:vibration:ignoreMute:", v12, v13, objc_msgSend(v10, "ignoreMute"));

    switch(a4)
    {
      case -102:
        [v14 setVibration:v6];
        break;
      case -5:
        [v14 setIgnoreMute:objc_msgSend(@"YES", "isEqualToString:", v6)];
        break;
      case -2:
        [v14 setSound:v6];
        break;
    }
    id v15 = [(ABSPerson *)self cnImpl];
    [v15 setTextAlert:v14];

    BOOL v16 = [(ABSPerson *)self addressBook];
    [v16 recordUpdated:self];
  }
}

- (ABSAddressBook)addressBook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressBook);

  return (ABSAddressBook *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (void)setCnImpl:(id)a3
{
}

- (NSString)revertedRecordIdentifier
{
  return self->_revertedRecordIdentifier;
}

- (void)setRevertedRecordIdentifier:(id)a3
{
}

- (NSMutableSet)nonNilSetProperties
{
  return self->_nonNilSetProperties;
}

- (void)setNonNilSetProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNilSetProperties, 0);
  objc_storeStrong((id *)&self->_revertedRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_cnImpl, 0);
  objc_destroyWeak((id *)&self->_source);

  objc_destroyWeak((id *)&self->_addressBook);
}

@end