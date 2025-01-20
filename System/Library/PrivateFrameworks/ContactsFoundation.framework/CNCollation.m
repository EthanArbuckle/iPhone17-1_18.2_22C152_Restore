@interface CNCollation
+ (id)defaultSortCollatorIdentifier;
+ (id)indexSectionsFromPropertyList:(id)a3;
+ (id)languageHeaderSectionsFromPropertyList:(id)a3 collator:(UCollator *)a4;
+ (id)sectionURL;
- (BOOL)indexExtraTokenizations;
- (CNCollation)init;
- (CNCollation)initWithCollator:(UCollator *)a3;
- (CNCollation)initWithCollator:(UCollator *)a3 URL:(id)a4;
- (NSArray)headerLanguages;
- (NSArray)indexSections;
- (NSString)nameTransform;
- (NSString)searchCollatorIdentifier;
- (NSString)searchTransform;
- (NSString)sortCollatorIdentifier;
@end

@implementation CNCollation

+ (id)defaultSortCollatorIdentifier
{
  v2 = [a1 sectionURL];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
      objc_opt_class();
      v5 = 0;
      if (objc_opt_isKindOfClass())
      {
        v5 = [v4 objectForKeyedSubscript:@"ABCollationKey"];
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CNCollation)initWithCollator:(UCollator *)a3
{
  v5 = [(id)objc_opt_class() sectionURL];
  v6 = [(CNCollation *)self initWithCollator:a3 URL:v5];

  return v6;
}

+ (id)sectionURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 preferredLocalizations];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__CNCollation_sectionURL__block_invoke;
  v7[3] = &unk_1E56A0320;
  v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (CNCollation)initWithCollator:(UCollator *)a3 URL:(id)a4
{
  if (a4)
  {
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a4];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v23.receiver = self,
            v23.super_class = (Class)CNCollation,
            (self = [(CNCollation *)&v23 init]) != 0))
      {
        id v8 = [v7 objectForKeyedSubscript:@"SearchTransform"];
        searchTransform = self->_searchTransform;
        self->_searchTransform = v8;

        uint64_t v10 = [v7 objectForKeyedSubscript:@"NameTransform"];
        nameTransform = self->_nameTransform;
        self->_nameTransform = v10;

        uint64_t v12 = [v7 objectForKeyedSubscript:@"ABUseExtraTokenizations"];
        self->_indexExtraTokenizations = [v12 BOOLValue];

        v13 = [v7 objectForKeyedSubscript:@"ABCollationKey"];
        sortCollatorIdentifier = self->_sortCollatorIdentifier;
        self->_sortCollatorIdentifier = v13;

        id v15 = [v7 objectForKeyedSubscript:@"ABSearchCollationKey"];
        searchCollatorIdentifier = self->_searchCollatorIdentifier;
        self->_searchCollatorIdentifier = v15;

        v17 = [(id)objc_opt_class() indexSectionsFromPropertyList:v7];
        indexSections = self->_indexSections;
        self->_indexSections = v17;

        v19 = [(id)objc_opt_class() languageHeaderSectionsFromPropertyList:v7 collator:a3];
        headerLanguages = self->_headerLanguages;
        self->_headerLanguages = v19;

        self = self;
        v21 = self;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)languageHeaderSectionsFromPropertyList:(id)a3 collator:(UCollator *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"SectionHeaders"];
  v7 = [v5 objectForKeyedSubscript:@"LocalizedSectionHeaders"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke;
  v11[3] = &unk_1E56A0398;
  id v12 = v7;
  v13 = a4;
  id v8 = v7;
  v9 = objc_msgSend(v6, "_cn_map:", v11);

  return v9;
}

+ (id)indexSectionsFromPropertyList:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"SectionIndices"];
  id v5 = [v3 objectForKeyedSubscript:@"LocalizedSectionIndices"];

  v6 = (void *)MEMORY[0x1E4F1C9E8];
  v7 = [v5 allKeys];
  id v8 = [v5 allValues];
  v9 = [v6 dictionaryWithObjects:v7 forKeys:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__CNCollation_indexSectionsFromPropertyList___block_invoke;
  v14[3] = &unk_1E56A0348;
  id v15 = v9;
  id v10 = v9;
  v11 = objc_msgSend(v4, "_cn_map:", v14);
  id v12 = (void *)[v11 copy];

  return v12;
}

CNCollationSection *__45__CNCollation_indexSectionsFromPropertyList___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;

  id v8 = [[CNCollationSection alloc] initWithKey:v7 localizedName:v3];

  return v8;
}

CNCollationHeaderSection *__63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = CNSortKeyStringForString(v4, v3);
  v6 = [CNCollationHeaderSection alloc];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v8 = [(CNCollationHeaderSection *)v6 initWithKey:v4 localizedName:v7 ICUSortKey:v5];

  return v8;
}

CNCollationLanguage *__63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"LastCharacter"];
  id v5 = [v3 objectForKeyedSubscript:@"FirstCharacterAfterLanguage"];
  v6 = [v3 objectForKeyedSubscript:@"Headers"];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CNCollation_languageHeaderSectionsFromPropertyList_collator___block_invoke_2;
  v12[3] = &unk_1E56A0370;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v11;
  long long v13 = v11;
  id v8 = objc_msgSend(v6, "_cn_map:", v12);
  v9 = [[CNCollationLanguage alloc] initWithSections:v8 lastCharacter:v4 firstCharacterAfterLanguage:v5];

  return v9;
}

- (NSArray)headerLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)indexSections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

void __25__CNCollation_sectionURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) URLForResource:@"ABContactSections" withExtension:@"plist" subdirectory:0 localization:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (CNCollation)init
{
  return [(CNCollation *)self initWithCollator:0];
}

- (NSString)searchTransform
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)nameTransform
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)searchCollatorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)sortCollatorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)indexExtraTokenizations
{
  return self->_indexExtraTokenizations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortCollatorIdentifier, 0);
  objc_storeStrong((id *)&self->_searchCollatorIdentifier, 0);
  objc_storeStrong((id *)&self->_nameTransform, 0);
  objc_storeStrong((id *)&self->_searchTransform, 0);
  objc_storeStrong((id *)&self->_indexSections, 0);

  objc_storeStrong((id *)&self->_headerLanguages, 0);
}

@end