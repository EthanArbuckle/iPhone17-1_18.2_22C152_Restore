@interface CNContactRelationsDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNContactRelationsDescription)init;
- (CNContactRelationsDescription)initWithLocalizationProvider:(Class)a3;
- (CNContactRelationsDescriptionLabels)cachedLabels;
- (Class)labeledValueClass;
- (Class)provider;
- (OS_dispatch_queue)generationQueue;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueForContact:(id)a3;
- (id)_builtInExtendedLabels;
- (id)_builtInStandardLabels;
- (id)cachedLabelsForPreferredLanguages:(id)a3;
- (id)fromPlistTransform;
- (id)labelsForPreferredLanguages:(id)a3;
- (id)localizedStringForLabel:(id)a3;
- (id)plistTransform;
- (id)standardLabels;
- (id)standardLabelsWithOptions:(unint64_t)a3;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)_addLocalizedLabels:(id)a3 fromLanguagePlist:(id)a4 languageIdentifier:(id)a5 toDictionary:(id)a6 conflictInfo:(id)a7;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
- (void)setCachedLabels:(id)a3;
@end

@implementation CNContactRelationsDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 contactRelations];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49D10];
  }
  return a3 != 0;
}

- (CNContactRelationsDescription)init
{
  return [(CNContactRelationsDescription *)self initWithLocalizationProvider:0];
}

- (CNContactRelationsDescription)initWithLocalizationProvider:(Class)a3
{
  v4 = [(CNPropertyDescription *)self initWithKey:@"contactRelations" readSelector:sel_contactRelations writeSelector:sel_setContactRelations_];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.contacts.CNContactRelationsDescription", 0);
    generationQueue = v4->_generationQueue;
    v4->_generationQueue = (OS_dispatch_queue *)v5;

    if (a3)
    {
      v7 = a3;
    }
    else
    {
      objc_opt_class();
      v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    Class provider = v4->_provider;
    v4->_Class provider = v7;

    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 contactRelations];
  if (!v8)
  {
    v4 = [v7 contactRelations];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 contactRelations];
  v10 = [v7 contactRelations];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v12 count:3];
  for (uint64_t i = 16; i != -8; i -= 8)

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_contactRelations", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[53];
  v6[53] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5 = a4;
  id v6 = [a3 name];
  id v7 = [v5 name];

  if (v6) {
    v8 = v6;
  }
  else {
    v8 = &stru_1EE052B80;
  }
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = &stru_1EE052B80;
  }
  BOOL v10 = [(__CFString *)v8 localizedCaseInsensitiveCompare:v9] == 0;

  return v10;
}

- (id)_builtInStandardLabels
{
  if (_builtInStandardLabels_cn_once_token_7 != -1) {
    dispatch_once(&_builtInStandardLabels_cn_once_token_7, &__block_literal_global_746);
  }
  v2 = (void *)_builtInStandardLabels_cn_once_object_7;

  return v2;
}

uint64_t __55__CNContactRelationsDescription__builtInStandardLabels__block_invoke()
{
  _builtInStandardLabels_cn_once_object_7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<Mother>!$_", @"_$!<Father>!$_", @"_$!<Parent>!$_", @"_$!<Brother>!$_", @"_$!<Sister>!$_", @"_$!<Son>!$_", @"_$!<Daughter>!$_", @"_$!<Child>!$_", @"_$!<Friend>!$_", @"_$!<Spouse>!$_", @"_$!<Partner>!$_", @"_$!<Assistant>!$_", @"_$!<Manager>!$_", 0);

  return MEMORY[0x1F41817F8]();
}

- (void)_addLocalizedLabels:(id)a3 fromLanguagePlist:(id)a4 languageIdentifier:(id)a5 toDictionary:(id)a6 conflictInfo:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__CNContactRelationsDescription__addLocalizedLabels_fromLanguagePlist_languageIdentifier_toDictionary_conflictInfo___block_invoke;
  v19[3] = &unk_1E56B4AF0;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v14;
  id v15 = v14;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  objc_msgSend(a3, "_cn_each:", v19);
}

void __116__CNContactRelationsDescription__addLocalizedLabels_fromLanguagePlist_languageIdentifier_toDictionary_conflictInfo___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F5A490];
    id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v7 = [v6 localizedStringForLanguageCode:*(void *)(a1 + 40)];
    v8 = [v5 pairWithFirst:v7 second:v3];

    v9 = [*(id *)(a1 + 48) objectForKey:v3];
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
    {
      BOOL v10 = [*(id *)(a1 + 56) objectForKey:v9];
      if ([v10 count])
      {
        if ([v10 count] == 1)
        {
          id v11 = [v10 firstObject];
          id v12 = NSString;
          id v13 = [v11 first];
          id v14 = [v12 stringWithFormat:@"%@ (%@)", v9, v13];

          id v15 = *(void **)(a1 + 32);
          id v16 = [v11 second];
          [v15 setObject:v14 forKey:v16];
        }
        id v17 = *(void **)(a1 + 56);
        id v18 = [v10 arrayByAddingObject:v8];
        [v17 setObject:v18 forKey:v9];

        v19 = NSString;
        id v20 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v21 = [v20 localizedStringForLanguageCode:*(void *)(a1 + 40)];
        uint64_t v22 = [v19 stringWithFormat:@"%@ (%@)", v9, v21];

        v9 = (void *)v22;
      }
      else
      {
        id v23 = *(void **)(a1 + 56);
        v25[0] = v8;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        [v23 setObject:v24 forKey:v9];
      }
      [*(id *)(a1 + 32) setObject:v9 forKey:v3];
    }
  }
}

- (id)labelsForPreferredLanguages:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA70];
  id v6 = [(CNContactRelationsDescription *)self _builtInStandardLabels];
  uint64_t v44 = [v5 orderedSetWithArray:v6];

  v50 = [MEMORY[0x1E4F1CA70] orderedSet];
  v49 = [MEMORY[0x1E4F1CA70] orderedSet];
  v54 = [MEMORY[0x1E4F1CA60] dictionary];
  v53 = [MEMORY[0x1E4F1CA60] dictionary];
  v55 = self;
  v46 = v4;
  [(objc_class *)[(CNContactRelationsDescription *)self provider] supplementalLabelURLPairsForLanguages:v4];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v65 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  id v7 = 0;
  if (v65)
  {
    v52 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v67;
    uint64_t v47 = *MEMORY[0x1E4F5A2A0];
    uint64_t v48 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1E4F1C9B8];
        id v13 = objc_msgSend(v11, "first", v44);
        id v14 = [v12 dataWithContentsOfURL:v13];

        id v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:0];
        id v16 = v15;
        if (!v8)
        {
          id v17 = v15;
          uint64_t v62 = [v11 second];

          [(CNContactRelationsDescription *)v55 _builtInStandardLabels];
          id v18 = v7;
          id v20 = v19 = v14;
          id v21 = [v11 second];
          id v8 = v17;
          [(CNContactRelationsDescription *)v55 _addLocalizedLabels:v20 fromLanguagePlist:v17 languageIdentifier:v21 toDictionary:v54 conflictInfo:v53];

          id v14 = v19;
          id v7 = v18;
          v52 = (void *)v62;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v60 = v14;
          id v63 = v8;
          v59 = [v16 objectForKey:@"SupplementalRelationships"];
          uint64_t v22 = [v59 componentsSeparatedByString:@" "];
          uint64_t v23 = objc_msgSend(v22, "_cn_filter:", v47);

          v57 = [v16 objectForKey:@"ExtendedRelevantRelationships"];
          [v57 componentsSeparatedByString:@" "];
          v25 = v24 = v7;
          v26 = objc_msgSend(v25, "_cn_filter:", v47);

          v56 = [v16 objectForKey:@"ExemptedStandardRelationships"];
          v27 = [v56 componentsSeparatedByString:@" "];
          v28 = objc_msgSend(v27, "_cn_filter:", v47);

          [v50 addObjectsFromArray:v23];
          [v49 addObjectsFromArray:v26];
          v29 = [v11 second];
          v58 = (void *)v23;
          [(CNContactRelationsDescription *)v55 _addLocalizedLabels:v23 fromLanguagePlist:v16 languageIdentifier:v29 toDictionary:v54 conflictInfo:v53];

          v30 = [v11 second];
          id v7 = v24;
          [(CNContactRelationsDescription *)v55 _addLocalizedLabels:v26 fromLanguagePlist:v16 languageIdentifier:v30 toDictionary:v54 conflictInfo:v53];

          uint64_t v31 = [v28 count];
          if (v24)
          {
            if (v31)
            {
              v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v28];
              [v24 intersectSet:v32];
            }
            else
            {
              [v24 removeAllObjects];
            }
          }
          else
          {
            if (v31) {
              [MEMORY[0x1E4F1CA80] setWithArray:v28];
            }
            else {
            id v7 = [MEMORY[0x1E4F1CA80] set];
            }
          }
          id v14 = v60;
          id v8 = v63;

          uint64_t v9 = v48;
        }
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v65);
  }
  else
  {
    v52 = 0;
    id v8 = 0;
  }
  v33 = [(CNContactRelationsDescription *)v55 _builtInExtendedLabels];
  [(CNContactRelationsDescription *)v55 _addLocalizedLabels:v33 fromLanguagePlist:v8 languageIdentifier:v52 toDictionary:v54 conflictInfo:v53];

  if (v7) {
    [v45 minusSet:v7];
  }
  v64 = v8;
  [v45 minusOrderedSet:v50];
  [v45 unionOrderedSet:v50];
  v34 = (void *)[v49 mutableCopy];
  v35 = [(CNContactRelationsDescription *)v55 _builtInExtendedLabels];
  [v34 addObjectsFromArray:v35];

  if (([v7 containsObject:@"_$!<Other>!$_"] & 1) == 0) {
    [v45 addObject:@"_$!<Other>!$_"];
  }
  [v34 addObject:@"_$!<Other>!$_"];
  v36 = [(CNContactRelationsDescription *)v55 _builtInStandardLabels];
  [v50 removeObjectsInArray:v36];

  [v50 removeObject:@"_$!<Other>!$_"];
  v37 = [CNContactRelationsDescriptionLabels alloc];
  v38 = (void *)[v46 copy];
  v39 = [v45 array];
  v40 = [v50 array];
  v41 = [v34 array];
  v42 = [v49 array];
  v61 = [(CNContactRelationsDescriptionLabels *)v37 initWithPreferredLanguages:v38 standardLabels:v39 standardLocaleSpecificLabels:v40 extendedLabels:v41 extendedLocaleSpecificLabels:v42 localizedStringsByLabelKey:v54];

  return v61;
}

- (id)cachedLabelsForPreferredLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(objc_class *)[(CNContactRelationsDescription *)self provider] preferredLanguages];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__6;
  id v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  id v6 = [(CNContactRelationsDescription *)self generationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CNContactRelationsDescription_cachedLabelsForPreferredLanguages___block_invoke;
  block[3] = &unk_1E56B4B18;
  id v11 = v5;
  id v12 = self;
  id v13 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

uint64_t __67__CNContactRelationsDescription_cachedLabelsForPreferredLanguages___block_invoke(uint64_t a1)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = v4;
  if (!v4)
  {
    v1 = [*(id *)(a1 + 40) cachedLabels];
    uint64_t v6 = [v1 preferredLanguages];
    if (!v6)
    {

      goto LABEL_12;
    }
    v2 = (void *)v6;
    id v5 = *(void **)(a1 + 32);
  }
  id v7 = [*(id *)(a1 + 40) cachedLabels];
  id v8 = [v7 preferredLanguages];
  int v9 = [v5 isEqual:v8];

  if (!v4)
  {

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) cachedLabels];
    return MEMORY[0x1F41817F8]();
  }
  if (v9) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v10 = [*(id *)(a1 + 40) labelsForPreferredLanguages:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v13 setCachedLabels:v14];
}

- (id)localizedStringForLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(objc_class *)[(CNContactRelationsDescription *)self provider] preferredLanguages];
  uint64_t v6 = [(CNContactRelationsDescription *)self cachedLabelsForPreferredLanguages:v5];

  id v7 = [v6 localizedStringsByLabelKey];
  id v8 = [v7 objectForKey:v4];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {

    id v8 = 0;
  }

  return v8;
}

- (id)standardLabels
{
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v4 = [(CNContactRelationsDescription *)self cachedLabelsForPreferredLanguages:v3];
  id v5 = [v4 standardLabels];

  return v5;
}

- (id)standardLabelsWithOptions:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      uint64_t v6 = [(CNContactRelationsDescription *)self cachedLabelsForPreferredLanguages:v5];
      uint64_t v7 = [v6 standardLocaleSpecificLabels];
LABEL_9:
      id v4 = (void *)v7;

      goto LABEL_10;
    case 1uLL:
      id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      uint64_t v6 = [(CNContactRelationsDescription *)self cachedLabelsForPreferredLanguages:v5];
      uint64_t v7 = [v6 extendedLabels];
      goto LABEL_9;
    case 0uLL:
      id v4 = [(CNContactRelationsDescription *)self standardLabels];
      goto LABEL_10;
  }
  if (a3 <= 3)
  {
    id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v6 = [(CNContactRelationsDescription *)self cachedLabelsForPreferredLanguages:v5];
    uint64_t v7 = [v6 extendedLocaleSpecificLabels];
    goto LABEL_9;
  }
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:

  return v4;
}

- (id)_builtInExtendedLabels
{
  if (_builtInExtendedLabels_cn_once_token_8 != -1) {
    dispatch_once(&_builtInExtendedLabels_cn_once_token_8, &__block_literal_global_765);
  }
  id v2 = (id)_builtInExtendedLabels_cn_once_object_8;

  return v2;
}

uint64_t __55__CNContactRelationsDescription__builtInExtendedLabels__block_invoke()
{
  _builtInExtendedLabels_cn_once_object_8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<Assistant>!$_", @"_$!<Manager>!$_", @"_$!<Colleague>!$_", @"_$!<Teacher>!$_", @"_$!<Sibling>!$_", @"_$!<YoungerSibling>!$_", @"_$!<ElderSibling>!$_", @"_$!<Sister>!$_", @"_$!<YoungerSister>!$_", @"_$!<YoungestSister>!$_", @"_$!<ElderSister>!$_", @"_$!<EldestSister>!$_", @"_$!<Brother>!$_", @"_$!<YoungerBrother>!$_", @"_$!<YoungestBrother>!$_", @"_$!<ElderBrother>!$_", @"_$!<EldestBrother>!$_",
                                              @"_$!<Friend>!$_",
                                              @"_$!<MaleFriend>!$_",
                                              @"_$!<FemaleFriend>!$_",
                                              @"_$!<Spouse>!$_",
                                              @"_$!<Wife>!$_",
                                              @"_$!<Husband>!$_",
                                              @"_$!<Partner>!$_",
                                              @"_$!<MalePartner>!$_",
                                              @"_$!<FemalePartner>!$_",
                                              @"_$!<GirlfriendOrBoyfriend>!$_",
                                              @"_$!<Girlfriend>!$_",
                                              @"_$!<Boyfriend>!$_",
                                              @"_$!<Parent>!$_",
                                              @"_$!<Mother>!$_",
                                              @"_$!<Father>!$_",
                                              @"_$!<Child>!$_",
                                              @"_$!<Daughter>!$_",
                                              @"_$!<Son>!$_",
                                              @"_$!<Grandparent>!$_",
                                              @"_$!<Grandmother>!$_",
                                              @"_$!<GrandmotherMothersMother>!$_",
                                              @"_$!<GrandmotherFathersMother>!$_",
                                              @"_$!<Grandfather>!$_",
                                              @"_$!<GrandfatherMothersFather>!$_",
                                              @"_$!<GrandfatherFathersFather>!$_",
                                              @"_$!<GreatGrandparent>!$_",
                                              @"_$!<GreatGrandfather>!$_",
                                              @"_$!<GreatGrandmother>!$_",
                                              @"_$!<Grandchild>!$_",
                                              @"_$!<Granddaughter>!$_",
                                              @"_$!<GranddaughterDaughtersDaughter>!$_",
                                              @"_$!<GranddaughterSonsDaughter>!$_",
                                              @"_$!<Grandson>!$_",
                                              @"_$!<GrandsonDaughtersSon>!$_",
                                              @"_$!<GrandsonSonsSon>!$_",
                                              @"_$!<GreatGrandchild>!$_",
                                              @"_$!<GreatGrandson>!$_",
                                              @"_$!<GreatGranddaughter>!$_",
                                              @"_$!<ParentInLaw>!$_",
                                              @"_$!<MotherInLaw>!$_",
                                              @"_$!<MotherInLawWifesMother>!$_",
                                              @"_$!<MotherInLawHusbandsMother>!$_",
                                              @"_$!<FatherInLaw>!$_",
                                              @"_$!<FatherInLawWifesFather>!$_");

  return MEMORY[0x1F41817F8]();
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)plistTransform
{
  return +[CN relatedContactToStringTransform];
}

- (id)fromPlistTransform
{
  return +[CN relatedContactFromStringTransform];
}

- (OS_dispatch_queue)generationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (CNContactRelationsDescriptionLabels)cachedLabels
{
  return self->_cachedLabels;
}

- (void)setCachedLabels:(id)a3
{
}

- (Class)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_cachedLabels, 0);

  objc_storeStrong((id *)&self->_generationQueue, 0);
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  id v4 = +[CNiOSABConversions stringFromABBytes:a3 length:a4];
  if (v4)
  {
    id v5 = +[CNContactRelation contactRelationWithName:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (a3)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CFStringGetTypeID())
    {
      uint64_t v6 = +[CNContactRelation contactRelationWithName:a3];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 name];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end