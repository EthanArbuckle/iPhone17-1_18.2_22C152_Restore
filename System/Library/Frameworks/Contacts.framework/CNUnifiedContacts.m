@interface CNUnifiedContacts
+ (BOOL)canUnifyLabel:(id)a3 withLabel:(id)a4 forProperty:(id)a5;
+ (BOOL)doesMultiValue:(id)a3 needLabeledValue:(id)a4 fromMultiValue:(id)a5 forProperty:(id)a6;
+ (BOOL)shouldIncludeLabeledValue:(id)a3 fromSource:(id)a4 inDestination:(id)a5 forProperty:(id)a6;
+ (BOOL)shouldLabeledValue:(id)a3 replaceInferiorValueInMultiValue:(id)a4 forProperty:(id)a5;
+ (id)_unifyContactsSortedByPreference:(void *)a3 options:;
+ (id)findFirstIdentifier:(void *)a3 inMultiValue:;
+ (id)firstNonNilValueForProperty:(id)a3 inContacts:(id)a4;
+ (id)identifierMapForUnifiedContact:(void *)a3 backingContacts:;
+ (id)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 forProperty:;
+ (id)imageValuePropertiesByKey;
+ (id)imageValuePropertyKeys;
+ (id)indexesOfLabeledValuesUnifiableWithLabelValuePair:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5;
+ (id)indexesOfValuesInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5;
+ (id)makeNonNameSingleValuePropertiesByKey;
+ (id)nonNameSingleValuePropertiesByKey;
+ (id)sortedContacts:(id)a3 withPreferredContact:(id)a4;
+ (id)unifiedIdentifiersForLabeledValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5;
+ (id)unifiedIdentifiersForValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5;
+ (id)unifyAvailableKeysOfContacts:(id)a3;
+ (id)unifyMultivalues:(void *)a3 forProperty:;
+ (id)unifyMultivalues:(void *)a3 forProperty:(void *)a4 options:;
+ (id)wallpaperValuePropertiesByKey;
+ (id)wallpaperValuePropertyKeys;
+ (uint64_t)countOfLabel:(void *)a3 value:(void *)a4 inMultiValue:(void *)a5 forProperty:;
+ (uint64_t)indexOfPreferredContactForUnifying:(int)a3 includingMainStoreContacts:;
+ (uint64_t)indexOfUnifiedIdentifier:(void *)a3 onNonUnifiedMultiValue:(void *)a4 withIdentifierMap:;
+ (unint64_t)countOfLabelIncludingEquivalents:(id)a3 value:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6;
+ (unint64_t)countOfLabelsUnifiableWithLabel:(id)a3 valuesUnifiableWithValue:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6;
+ (unint64_t)indexOfPreferredContactForImage:(id)a3;
+ (unint64_t)indexOfPreferredContactForWallpaper:(id)a3 prefersSharedImage:(BOOL)a4;
+ (unint64_t)indexOfValueMostInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5;
+ (void)addLinkedIdentifier:(void *)a3 toLabeledValue:;
+ (void)addLinkedLabeledValue:(id)a3 toLabeledValue:(id)a4 forProperty:(id)a5;
+ (void)correlateIdentifiersOfUnifiedMap:(void *)a3 toIdentifiersOfMultiValueMap:(void *)a4 intoMap:(void *)a5 forProperty:;
+ (void)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 intoMap:(void *)a5 forProperty:;
+ (void)replaceInferiorValueInMultiValue:(id)a3 withEntryAtIndex:(unint64_t)a4 fromMultiValue:(id)a5 forProperty:(id)a6;
+ (void)unifyImageOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5;
+ (void)unifyMultiValue:(id)a3 intoMultiValue:(id)a4 forProperty:(id)a5;
+ (void)unifyMultiValuesOfContacts:(void *)a3 intoContact:(void *)a4 availableKeyDescriptor:(void *)a5 options:;
+ (void)unifyNamesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6;
+ (void)unifyNonNameSingleValuesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6;
+ (void)unifySingleValuesProperties:(id)a3 ofContacts:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6;
+ (void)unifyWallpaperOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5;
@end

@implementation CNUnifiedContacts

uint64_t __96__CNUnifiedContacts_indexesOfLabeledValuesUnifiableWithLabelValuePair_inMultiValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return canUnifyLabeledValuePairs(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

uint64_t __65__CNUnifiedContacts_countOfLabel_value_inMultiValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *((void *)a2 + 1);
  v4 = *(void **)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  v6 = *(void **)(a1 + 32);
  if (v4 == v6
    || ([v6 isEqualToString:&stru_1EE052B80] & 1) != 0
    || ([v4 isEqualToString:&stru_1EE052B80] & 1) != 0)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [v4 isEqual:*(void *)(a1 + 32)] ^ 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    int v8 = [*(id *)(a1 + 40) isLikePhoneNumberForSamePerson:v5];
  }
  else {
    int v8 = [MEMORY[0x1E4F5A3E0] isObject:*(void *)(a1 + 40) equalToOther:v5];
  }
  if (((v7 | v8 ^ 1) & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }

  return MEMORY[0x1F41817F8]();
}

+ (uint64_t)indexOfPreferredContactForUnifying:(int)a3 includingMainStoreContacts:
{
  id v4 = a2;
  self;
  if (!a3
    || (uint64_t v5 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_37),
        v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v6 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_32);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
  }

  return v5;
}

+ (id)_unifyContactsSortedByPreference:(void *)a3 options:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v8 = [v4 count];
    int v7 = [v4 firstObject];
    if (v8 != 1)
    {
      v9 = [v6 unifyAvailableKeysOfContacts:v4];
      if ([v5 shouldIncludeMainStoreContacts]
        && ([v7 linkIdentifier], (v10 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v7 identifier], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v10 availableKeyDescriptor:v9];
        [v6 unifyNamesOfContacts:v4 withPreferredContact:v7 intoContact:v11 availableKeyDescriptor:v9];
        [v6 unifyNonNameSingleValuesOfContacts:v4 withPreferredContact:v7 intoContact:v11 availableKeyDescriptor:v9];
        [v6 unifyImageOfContacts:v4 intoContact:v11 availableKeyDescriptor:v9];
        [v6 unifyWallpaperOfContacts:v4 intoContact:v11 availableKeyDescriptor:v9];
        +[CNUnifiedContacts unifyMultiValuesOfContacts:intoContact:availableKeyDescriptor:options:]((uint64_t)v6, v4, v11, v9, v5);
        [(CNMutableContact *)v11 setLinkedContacts:v4];
      }
      else
      {
        v11 = 0;
      }

      int v7 = v11;
    }
  }

  return v7;
}

+ (void)unifyNonNameSingleValuesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [a1 nonNameSingleValuePropertiesByKey];
  [a1 unifySingleValuesProperties:v12 ofContacts:v11 intoContact:v10 availableKeyDescriptor:v9];
}

+ (void)unifySingleValuesProperties:(id)a3 ofContacts:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__CNUnifiedContacts_unifySingleValuesProperties_ofContacts_intoContact_availableKeyDescriptor___block_invoke;
  v16[3] = &unk_1E56B4DE0;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v20 = a1;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [a6 enumeratePropertiesUsingBlock:v16];
}

+ (void)unifyNamesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v13 = a4;
  id v7 = a5;
  if ([v13 isKeyAvailable:@"namePrefix"])
  {
    uint64_t v8 = [v13 namePrefix];
    [v7 setNamePrefix:v8];
  }
  if ([v13 isKeyAvailable:@"givenName"])
  {
    id v9 = [v13 givenName];
    [v7 setGivenName:v9];
  }
  if ([v13 isKeyAvailable:@"middleName"])
  {
    id v10 = [v13 middleName];
    [v7 setMiddleName:v10];
  }
  if ([v13 isKeyAvailable:@"familyName"])
  {
    id v11 = [v13 familyName];
    [v7 setFamilyName:v11];
  }
  if ([v13 isKeyAvailable:@"nameSuffix"])
  {
    id v12 = [v13 nameSuffix];
    [v7 setNameSuffix:v12];
  }
}

+ (void)unifyImageOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [a1 imageValuePropertyKeys];
  int v11 = [v9 intersectsKeyVector:v10];

  if (v11)
  {
    id v12 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(a1, "indexOfPreferredContactForImage:", v15));
    id v13 = [a1 sortedContacts:v15 withPreferredContact:v12];
    id v14 = [a1 imageValuePropertiesByKey];
    [a1 unifySingleValuesProperties:v14 ofContacts:v13 intoContact:v8 availableKeyDescriptor:v9];
  }
}

+ (id)unifyAvailableKeysOfContacts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v17;
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      int v11 = [v10 storeIdentifier];

      if (!v11)
      {
        id v12 = [v10 keyVector];
        if (v12)
        {
          if (v6)
          {
LABEL_9:
            if (([v12 isEqual:v6] & 1) == 0) {
              [MEMORY[0x1E4F1CA00] raise:v8 format:@"Cannot unify contacts with different available keys."];
            }
            goto LABEL_13;
          }
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1CA98] null];
          if (v6) {
            goto LABEL_9;
          }
        }
        id v6 = v12;
LABEL_13:

        continue;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v5);
LABEL_18:
  id v13 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();

  if (v13)
  {
    id v14 = [v13 keyVectorByAddingKey:@"linkIdentifier"];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)nonNameSingleValuePropertiesByKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CNUnifiedContacts_nonNameSingleValuePropertiesByKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nonNameSingleValuePropertiesByKey_cn_once_token_4 != -1) {
    dispatch_once(&nonNameSingleValuePropertiesByKey_cn_once_token_4, block);
  }
  v2 = (void *)nonNameSingleValuePropertiesByKey_cn_once_object_4;

  return v2;
}

+ (id)imageValuePropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CNUnifiedContacts_imageValuePropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (imageValuePropertyKeys_cn_once_token_2 != -1) {
    dispatch_once(&imageValuePropertyKeys_cn_once_token_2, block);
  }
  v2 = (void *)imageValuePropertyKeys_cn_once_object_2;

  return v2;
}

+ (void)unifyWallpaperOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 containsKey:@"sharedPhotoDisplayPreference"])
  {
    id v10 = [a1 wallpaperValuePropertyKeys];
    int v11 = [v9 intersectsKeyVector:v10];

    if (v11)
    {
      BOOL v12 = [v8 sharedPhotoDisplayPreference] == 1
         || [v8 sharedPhotoDisplayPreference] == 3
         || [v8 sharedPhotoDisplayPreference] == 0;
      id v13 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(a1, "indexOfPreferredContactForWallpaper:prefersSharedImage:", v16, v12));
      id v14 = [a1 sortedContacts:v16 withPreferredContact:v13];
      id v15 = [a1 wallpaperValuePropertiesByKey];
      [a1 unifySingleValuesProperties:v15 ofContacts:v14 intoContact:v8 availableKeyDescriptor:v9];
    }
  }
}

+ (id)wallpaperValuePropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CNUnifiedContacts_wallpaperValuePropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wallpaperValuePropertyKeys_cn_once_token_3 != -1) {
    dispatch_once(&wallpaperValuePropertyKeys_cn_once_token_3, block);
  }
  v2 = (void *)wallpaperValuePropertyKeys_cn_once_object_3;

  return v2;
}

+ (id)sortedContacts:(id)a3 withPreferredContact:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  [v6 removeObject:v5];
  [v6 insertObject:v5 atIndex:0];

  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

+ (unint64_t)indexOfPreferredContactForImage:(id)a3
{
  unint64_t result = [a3 indexOfObjectPassingTest:&__block_literal_global_39_0];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return result;
}

uint64_t __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualIgnoringIdentifiers:*(void *)(a1 + 32)];
}

uint64_t __72__CNUnifiedContacts_indexesOfValuesInferiorTo_inMultiValue_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v4 = [v3 value];

  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) value];
  uint64_t v7 = [v5 isValue:v6 preferredToUnifiedValue:v4];

  return v7;
}

uint64_t __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 labelValuePair];
  uint64_t v4 = [*(id *)(a1 + 32) labelValuePair];
  uint64_t v5 = canUnifyLabeledValuePairs(v3, v4, *(void **)(a1 + 40));

  return v5;
}

void __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 labelValuePair];
  if ([*(id *)(a1 + 56) shouldIncludeLabeledValue:v6 fromSource:*(void *)(a1 + 32) inDestination:*(void *)(a1 + 40) forProperty:*(void *)(a1 + 48)])
  {
    int v7 = [*(id *)(a1 + 56) shouldLabeledValue:v6 replaceInferiorValueInMultiValue:*(void *)(a1 + 40) forProperty:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v10 = *(void **)(a1 + 56);
    if (v7)
    {
      [v10 replaceInferiorValueInMultiValue:v8 withEntryAtIndex:a3 fromMultiValue:v9 forProperty:v11];
      goto LABEL_10;
    }
    if ([v10 doesMultiValue:v8 needLabeledValue:v6 fromMultiValue:v9 forProperty:v11])
    {
      [*(id *)(a1 + 40) addObject:v5];
      goto LABEL_10;
    }
  }
  BOOL v12 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_2;
  v20[3] = &unk_1E56B4E28;
  id v13 = v5;
  id v21 = v13;
  uint64_t v14 = [v12 indexOfObjectPassingTest:v20];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  id v15 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_3;
  v17[3] = &unk_1E56B4E50;
  id v18 = v13;
  id v19 = *(id *)(a1 + 48);
  uint64_t v14 = [v15 indexOfObjectPassingTest:v17];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    id v16 = [*(id *)(a1 + 40) objectAtIndex:v14];
    [*(id *)(a1 + 56) addLinkedLabeledValue:v13 toLabeledValue:v16 forProperty:*(void *)(a1 + 48)];
  }
LABEL_10:
}

+ (BOOL)shouldLabeledValue:(id)a3 replaceInferiorValueInMultiValue:(id)a4 forProperty:(id)a5
{
  id v5 = [a1 indexesOfValuesInferiorTo:a3 inMultiValue:a4 forProperty:a5];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

+ (id)indexesOfValuesInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 indexesOfLabeledValuesUnifiableWithLabelValuePair:v8 inMultiValue:v9 forProperty:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__CNUnifiedContacts_indexesOfValuesInferiorTo_inMultiValue_forProperty___block_invoke;
  v17[3] = &unk_1E56B4EA0;
  id v18 = v9;
  id v19 = v10;
  id v20 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  id v15 = [v11 indexesPassingTest:v17];

  return v15;
}

+ (BOOL)doesMultiValue:(id)a3 needLabeledValue:(id)a4 fromMultiValue:(id)a5 forProperty:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 value];
  id v15 = [v12 label];

  unint64_t v16 = [a1 countOfLabelsUnifiableWithLabel:v15 valuesUnifiableWithValue:v14 inMultiValue:v11 forProperty:v10];
  unint64_t v17 = [a1 countOfLabelsUnifiableWithLabel:v15 valuesUnifiableWithValue:v14 inMultiValue:v13 forProperty:v10];

  return v17 < v16;
}

+ (unint64_t)countOfLabelsUnifiableWithLabel:(id)a3 valuesUnifiableWithValue:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[CNLabelValuePair labeledValueWithLabel:a3 value:a4];
  id v13 = [a1 indexesOfLabeledValuesUnifiableWithLabelValuePair:v12 inMultiValue:v11 forProperty:v10];

  unint64_t v14 = [v13 count];
  return v14;
}

+ (id)indexesOfLabeledValuesUnifiableWithLabelValuePair:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __96__CNUnifiedContacts_indexesOfLabeledValuesUnifiableWithLabelValuePair_inMultiValue_forProperty___block_invoke;
  id v19 = &unk_1E56B4D58;
  id v20 = v7;
  id v21 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = a4;
  id v12 = objc_msgSend(v11, "_cn_filter:", &v16);
  id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v12, v16, v17, v18, v19);
  unint64_t v14 = objc_msgSend(v11, "_cn_indicesForObjects:", v13);

  return v14;
}

+ (BOOL)shouldIncludeLabeledValue:(id)a3 fromSource:(id)a4 inDestination:(id)a5 forProperty:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unint64_t v14 = [v13 value];
  id v15 = [v13 label];

  unint64_t v16 = +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, v15, v14, v12, v10);
  unint64_t v17 = [a1 countOfLabelIncludingEquivalents:v15 value:v14 inMultiValue:v11 forProperty:v10];

  return v17 < v16;
}

+ (unint64_t)countOfLabelIncludingEquivalents:(id)a3 value:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, v10, v11, v12, v13);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = objc_msgSend(v13, "unifiableLabelsForLabel:", v10, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        v14 += +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, *(void **)(*((void *)&v21 + 1) + 8 * v19++), v11, v12, v13);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }

  return v14;
}

+ (uint64_t)countOfLabel:(void *)a3 value:(void *)a4 inMultiValue:(void *)a5 forProperty:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__CNUnifiedContacts_countOfLabel_value_inMultiValue_forProperty___block_invoke;
  v16[3] = &unk_1E56B4EF0;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  uint64_t v19 = &v20;
  [v10 enumerateObjectsUsingBlock:v16];
  uint64_t v14 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (void)addLinkedLabeledValue:(id)a3 toLabeledValue:(id)a4 forProperty:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 != v8)
  {
    id v10 = [v8 linkedIdentifiers];
    id v11 = (void *)[v10 mutableCopy];

    if (!v11)
    {
      id v11 = [MEMORY[0x1E4F1CA80] set];
    }
    id v12 = [v7 identifier];

    if (v12)
    {
      id v13 = [v7 identifier];
      [v11 addObject:v13];
    }
    else
    {
      id v13 = os_log_create("com.apple.contacts", "91450879");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[CNUnifiedContacts addLinkedLabeledValue:toLabeledValue:forProperty:]((uint64_t)v7, (uint64_t)v9, v13);
      }
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = objc_msgSend(v7, "linkedIdentifiers", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [v11 addObject:*(void *)(*((void *)&v19 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }

    [v7 setLinkedIdentifiers:0];
    [v8 setLinkedIdentifiers:v11];
  }
}

uint64_t __58__CNUnifiedContacts_makeNonNameSingleValuePropertiesByKey__block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __95__CNUnifiedContacts_unifySingleValuesProperties_ofContacts_intoContact_availableKeyDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 key];
  id v9 = [v3 objectForKeyedSubscript:v4];

  if (v9)
  {
    id v5 = [*(id *)(a1 + 56) firstNonNilValueForProperty:v9 inContacts:*(void *)(a1 + 40)];
    if (v5)
    {
      BOOL v6 = *(void **)(a1 + 48);
      id v7 = [v9 key];
      [v6 setValue:v5 forKey:v7];
    }
  }

  return MEMORY[0x1F41817F8]();
}

+ (id)firstNonNilValueForProperty:(id)a3 inContacts:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v5, "key", (void)v17);
        int v13 = [v11 isKeyAvailable:v12];

        if (v13)
        {
          uint64_t v14 = [v5 CNValueForContact:v11];
          if (v14)
          {
            uint64_t v15 = (void *)v14;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

+ (void)unifyMultiValuesOfContacts:(void *)a3 intoContact:(void *)a4 availableKeyDescriptor:(void *)a5 options:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v32 = a3;
  id v8 = a4;
  id v31 = a5;
  uint64_t v30 = self;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = +[CN writableMultiValueContactProperties];
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    uint64_t v12 = *MEMORY[0x1E4F5A2A8];
    uint64_t v33 = *(void *)v44;
    id v34 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v36 = v10;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
        uint64_t v15 = [v14 key];
        int v16 = [v8 containsKey:v15];

        if (v16)
        {
          uint64_t v38 = v13;
          long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v18 = v35;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v40 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                uint64_t v24 = [v14 key];
                int v25 = [v23 isKeyAvailable:v24];

                if (v25)
                {
                  uint64_t v26 = [v14 CNValueForContact:v23];
                  v27 = (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v26);
                  [v17 addObject:v27];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v20);
          }

          if ([v17 count])
          {
            v28 = +[CNUnifiedContacts unifyMultivalues:forProperty:options:](v30, v17, v14, v31);
            v29 = [v14 key];
            [v32 setValue:v28 forKey:v29];
          }
          uint64_t v11 = v33;
          id v8 = v34;
          uint64_t v10 = v36;
          uint64_t v13 = v38;
        }
        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);
  }
}

+ (id)unifyMultivalues:(void *)a3 forProperty:(void *)a4 options:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = objc_msgSend(v6, "_cn_filter:", *MEMORY[0x1E4F5A260]);
  if ([v10 count])
  {
    if ([v10 count] == 1)
    {
      uint64_t v11 = [v10 firstObject];
LABEL_4:
      uint64_t v12 = (void *)v11;
      goto LABEL_17;
    }
    uint64_t v13 = [v8 labeledValueUnificationThreshold];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CNUnifiedContacts_unifyMultivalues_forProperty_options___block_invoke;
      aBlock[3] = &__block_descriptor_40_e17_B16__0__NSArray_8l;
      aBlock[4] = v13;
      uint64_t v14 = _Block_copy(aBlock);
      int v15 = objc_msgSend(v10, "_cn_any:", v14);

      if (v15)
      {
        uint64_t v11 = objc_msgSend(v10, "_cn_flatten");
        goto LABEL_4;
      }
    }
    int v16 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v9, "unifyMultiValue:intoMultiValue:forProperty:", *(void *)(*((void *)&v23 + 1) + 8 * i), v16, v7, (void)v23);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v19);
    }

    uint64_t v12 = (void *)[v16 copy];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_17:

  return v12;
}

+ (void)unifyMultiValue:(id)a3 intoMultiValue:(id)a4 forProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke;
  v14[3] = &unk_1E56B4E78;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = a1;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [v13 enumerateObjectsUsingBlock:v14];
}

uint64_t __53__CNUnifiedContacts_indexOfPreferredContactForImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isKeyAvailable:@"preferredForImage"]) {
    uint64_t v3 = [v2 isPreferredForImage];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __46__CNUnifiedContacts_imageValuePropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __50__CNUnifiedContacts_wallpaperValuePropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

void __54__CNUnifiedContacts_nonNameSingleValuePropertiesByKey__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeNonNameSingleValuePropertiesByKey];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)nonNameSingleValuePropertiesByKey_cn_once_object_4;
  nonNameSingleValuePropertiesByKey_cn_once_object_4 = v1;
}

+ (id)makeNonNameSingleValuePropertiesByKey
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v2 = +[CN writableSingleValueContactProperties];
  id v3 = (void *)[v2 mutableCopy];
  uint64_t v4 = +[CN namePrefixDescription];
  v19[0] = v4;
  id v5 = +[CN givenNameDescription];
  v19[1] = v5;
  id v6 = +[CN middleNameDescription];
  v19[2] = v6;
  id v7 = +[CN familyNameDescription];
  v19[3] = v7;
  id v8 = +[CN nameSuffixDescription];
  v19[4] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  [v3 removeObjectsInArray:v9];

  id v10 = +[CN preferredForNameDescription];
  v18[0] = v10;
  id v11 = +[CN preferredForImageDescription];
  v18[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 removeObjectsInArray:v12];

  id v13 = [a1 imageValuePropertiesByKey];
  uint64_t v14 = [v13 allValues];
  [v3 removeObjectsInArray:v14];

  id v15 = objc_msgSend(v3, "_cn_indexBy:", &__block_literal_global_54);

  return v15;
}

void __46__CNUnifiedContacts_imageValuePropertiesByKey__block_invoke()
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v0 = +[CN imageDataDescription];
  v12[0] = v0;
  uint64_t v1 = +[CN cropRectDescription];
  v12[1] = v1;
  id v2 = +[CN thumbnailImageDataDescription];
  v12[2] = v2;
  id v3 = +[CN preferredLikenessSourceDescription];
  v12[3] = v3;
  uint64_t v4 = +[CN preferredApplePersonaIdentifierDescription];
  v12[4] = v4;
  id v5 = +[CN isUsingSharedPhotoDescription];
  v12[5] = v5;
  id v6 = +[CN fullscreenImageDataDescription];
  v12[6] = v6;
  id v7 = +[CN syncImageDataDescription];
  v12[7] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];
  id v9 = objc_msgSend(v8, "_cn_indexBy:", &__block_literal_global_46);
  uint64_t v10 = [v9 copy];
  id v11 = (void *)imageValuePropertiesByKey_cn_once_object_0;
  imageValuePropertiesByKey_cn_once_object_0 = v10;
}

void __50__CNUnifiedContacts_wallpaperValuePropertiesByKey__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v0 = +[CN wallpaperDescription];
  uint64_t v1 = +[CN wallpaperMetadataDescription];
  v7[1] = v1;
  id v2 = +[CN watchWallpaperImageDataDescription];
  v7[2] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v4 = objc_msgSend(v3, "_cn_indexBy:", &__block_literal_global_50);
  uint64_t v5 = [v4 copy];
  id v6 = (void *)wallpaperValuePropertiesByKey_cn_once_object_1;
  wallpaperValuePropertiesByKey_cn_once_object_1 = v5;
}

void __43__CNUnifiedContacts_imageValuePropertyKeys__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) imageValuePropertiesByKey];
  uint64_t v1 = [v4 allKeys];
  uint64_t v2 = +[CNContactKeyVector keyVectorWithKeys:v1];
  id v3 = (void *)imageValuePropertyKeys_cn_once_object_2;
  imageValuePropertyKeys_cn_once_object_2 = v2;
}

+ (id)imageValuePropertiesByKey
{
  if (imageValuePropertiesByKey_cn_once_token_0 != -1) {
    dispatch_once(&imageValuePropertiesByKey_cn_once_token_0, &__block_literal_global_42);
  }
  uint64_t v2 = (void *)imageValuePropertiesByKey_cn_once_object_0;

  return v2;
}

void __47__CNUnifiedContacts_wallpaperValuePropertyKeys__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) wallpaperValuePropertiesByKey];
  uint64_t v1 = [v4 allKeys];
  uint64_t v2 = +[CNContactKeyVector keyVectorWithKeys:v1];
  id v3 = (void *)wallpaperValuePropertyKeys_cn_once_object_3;
  wallpaperValuePropertyKeys_cn_once_object_3 = v2;
}

+ (id)wallpaperValuePropertiesByKey
{
  if (wallpaperValuePropertiesByKey_cn_once_token_1 != -1) {
    dispatch_once(&wallpaperValuePropertiesByKey_cn_once_token_1, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)wallpaperValuePropertiesByKey_cn_once_object_1;

  return v2;
}

+ (id)unifyMultivalues:(void *)a3 forProperty:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  id v7 = +[CNContactUnificationOptions sharedInstance];
  id v8 = +[CNUnifiedContacts unifyMultivalues:forProperty:options:](v6, v5, v4, v7);

  return v8;
}

+ (id)identifierMapForUnifiedContact:(void *)a3 backingContacts:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v20 = a3;
  uint64_t v5 = self;
  id v19 = [MEMORY[0x1E4F5A460] multiDictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = +[CN writableMultiValueContactProperties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 key];
        int v13 = [v4 isKeyAvailable:v12];

        if (v13)
        {
          uint64_t v14 = [v11 valueForKeyTransform];
          id v15 = ((void (**)(void, id))v14)[2](v14, v4);

          id v16 = [v11 valueForKeyTransform];
          id v17 = objc_msgSend(v20, "_cn_map:", v16);

          +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:intoMap:forProperty:](v5, v15, v17, v19, v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v19;
}

+ (id)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 forProperty:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = self;
  uint64_t v10 = [MEMORY[0x1E4F5A460] multiDictionary];
  +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:intoMap:forProperty:](v9, v8, v7, v10, v6);

  return v10;
}

+ (uint64_t)indexOfUnifiedIdentifier:(void *)a3 onNonUnifiedMultiValue:(void *)a4 withIdentifierMap:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = [v8 objectsForKey:v6];

  +[CNUnifiedContacts findFirstIdentifier:inMultiValue:](v9, v10, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11) {
    id v11 = v6;
  }
  id v12 = +[CNLabeledValue testMatchingIdentifier:v11];
  uint64_t v13 = [v7 indexOfObjectPassingTest:v12];

  return v13;
}

+ (void)addLinkedIdentifier:(void *)a3 toLabeledValue:
{
  id v7 = a2;
  id v4 = a3;
  self;
  if (v7)
  {
    uint64_t v5 = [v4 linkedIdentifiers];
    id v6 = (void *)[v5 mutableCopy];

    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
    }
    [v6 addObject:v7];
    [v4 setLinkedIdentifiers:v6];
  }
}

+ (unint64_t)indexOfPreferredContactForWallpaper:(id)a3 prefersSharedImage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (!v4
    || (uint64_t v7 = [v5 indexOfObjectPassingTest:&__block_literal_global_35_1], v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_37];
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }

  return v8;
}

uint64_t __76__CNUnifiedContacts_indexOfPreferredContactForWallpaper_prefersSharedImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isKeyAvailable:@"isUsingSharedPhoto"]) {
    uint64_t v3 = [v2 isUsingSharedPhoto];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __76__CNUnifiedContacts_indexOfPreferredContactForWallpaper_prefersSharedImage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isKeyAvailable:@"preferredForImage"]) {
    uint64_t v3 = [v2 isPreferredForImage];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __58__CNUnifiedContacts_unifyMultivalues_forProperty_options___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 count] > *(void *)(a1 + 32);
}

+ (unint64_t)indexOfValueMostInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 indexesOfValuesInferiorTo:v8 inMultiValue:v9 forProperty:v10];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__CNUnifiedContacts_indexOfValueMostInferiorTo_inMultiValue_forProperty___block_invoke;
  v17[3] = &unk_1E56B4EC8;
  long long v21 = &v22;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  [v11 enumerateIndexesUsingBlock:v17];
  unint64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __73__CNUnifiedContacts_indexOfValueMostInferiorTo_inMultiValue_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [*(id *)(a1 + 32) value];
  }
  else
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
    id v7 = [v4 value];
  }
  id v5 = [*(id *)(a1 + 40) objectAtIndex:a2];
  id v6 = [v5 value];

  if ([*(id *)(a1 + 48) isValue:v7 preferredToUnifiedValue:v6]) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  }
}

+ (void)replaceInferiorValueInMultiValue:(id)a3 withEntryAtIndex:(unint64_t)a4 fromMultiValue:(id)a5 forProperty:(id)a6
{
  id v15 = a3;
  id v10 = a6;
  id v11 = [a5 objectAtIndex:a4];
  id v12 = [v11 labelValuePair];
  uint64_t v13 = [a1 indexOfValueMostInferiorTo:v12 inMultiValue:v15 forProperty:v10];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v15 objectAtIndex:v13];
    [a1 addLinkedLabeledValue:v14 toLabeledValue:v11 forProperty:v10];

    [v15 replaceObjectAtIndex:v13 withObject:v11];
  }
}

+ (void)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 intoMap:(void *)a5 forProperty:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__CNUnifiedContacts_identifierMapForUnifiedMultiValue_backingMultiValues_intoMap_forProperty___block_invoke;
  aBlock[3] = &unk_1E56B4F18;
  id v13 = v11;
  id v27 = v13;
  id v14 = (void (**)(void *, id))_Block_copy(aBlock);
  long long v21 = v8;
  id v15 = v14[2](v14, v8);
  id v16 = objc_msgSend(v9, "_cn_map:", v14);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        +[CNUnifiedContacts correlateIdentifiersOfUnifiedMap:toIdentifiersOfMultiValueMap:intoMap:forProperty:](v12, v15, *(void **)(*((void *)&v22 + 1) + 8 * v20++), v10, v13);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v18);
  }
}

id __94__CNUnifiedContacts_identifierMapForUnifiedMultiValue_backingMultiValues_intoMap_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CN groupIdentifiersByLabeledValue:a2 forProperty:*(void *)(a1 + 32)];
}

+ (void)correlateIdentifiersOfUnifiedMap:(void *)a3 toIdentifiersOfMultiValueMap:(void *)a4 intoMap:(void *)a5 forProperty:
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__CNUnifiedContacts_correlateIdentifiersOfUnifiedMap_toIdentifiersOfMultiValueMap_intoMap_forProperty___block_invoke;
  v16[3] = &unk_1E56B4F40;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  uint64_t v20 = v12;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [v11 eachObject:v16];
}

void __103__CNUnifiedContacts_correlateIdentifiersOfUnifiedMap_toIdentifiersOfMultiValueMap_intoMap_forProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  id v9 = a3;
  id v7 = [*(id *)(a1 + 56) unifiedIdentifiersForLabeledValue:a2 inUnifiedMap:*(void *)(a1 + 32) forProperty:*(void *)(a1 + 40)];
  if ([v7 count] > a4)
  {
    id v8 = [v7 objectAtIndex:a4];
    [*(id *)(a1 + 48) addObject:v9 forKey:v8];
  }
}

+ (id)unifiedIdentifiersForLabeledValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 label];
  int v12 = [v11 isEqual:&stru_1EE052B80];

  if (v12)
  {
    id v13 = [v8 value];
    id v14 = [a1 unifiedIdentifiersForValue:v13 inUnifiedMap:v10 forProperty:v9];
  }
  else
  {
    id v15 = [v10 allKeys];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    long long v21 = __80__CNUnifiedContacts_unifiedIdentifiersForLabeledValue_inUnifiedMap_forProperty___block_invoke;
    long long v22 = &unk_1E56B4D58;
    id v23 = v8;
    id v24 = v9;
    id v16 = objc_msgSend(v15, "_cn_filter:", &v19);

    id v17 = objc_msgSend(v10, "objectsForKeys:", v16, v19, v20, v21, v22);

    id v14 = objc_msgSend(v17, "_cn_flatten");
  }

  return v14;
}

uint64_t __80__CNUnifiedContacts_unifiedIdentifiersForLabeledValue_inUnifiedMap_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return canUnifyLabeledValuePairs(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

+ (BOOL)canUnifyLabel:(id)a3 withLabel:(id)a4 forProperty:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1E4F5A3E0] isObject:v7 equalToOther:v8])
  {
LABEL_6:
    char v10 = 1;
    goto LABEL_7;
  }
  char v10 = 0;
  if (v7 && v8)
  {
    if (([v7 isEqualToString:&stru_1EE052B80] & 1) == 0
      && ([v8 isEqualToString:&stru_1EE052B80] & 1) == 0)
    {
      int v12 = [v9 unifiableLabelsForLabel:v7];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__CNUnifiedContacts_canUnifyLabel_withLabel_forProperty___block_invoke;
      v13[3] = &unk_1E56B4F68;
      id v14 = v8;
      char v10 = objc_msgSend(v12, "_cn_any:", v13);

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

uint64_t __57__CNUnifiedContacts_canUnifyLabel_withLabel_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

+ (id)unifiedIdentifiersForValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v10 = v8;
  id v11 = [v8 allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v17 = [v16 value];
        int v18 = [v9 canUnifyValue:v17 withValue:v7];

        if (v18)
        {
          uint64_t v19 = [v10 objectsForKey:v16];
          [v21 addObjectsFromArray:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v21;
}

+ (id)findFirstIdentifier:(void *)a3 inMultiValue:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CNUnifiedContacts_findFirstIdentifier_inMultiValue___block_invoke;
  v9[3] = &unk_1E56B4F68;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

BOOL __54__CNUnifiedContacts_findFirstIdentifier_inMultiValue___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[CNLabeledValue testMatchingIdentifier:a2];
  uint64_t v4 = [v2 indexOfObjectPassingTest:v3];

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)addLinkedLabeledValue:(uint64_t)a1 toLabeledValue:(uint64_t)a2 forProperty:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "Unexpected nil for CNLabeledValue.identifier when unifying contacts, %@, %@", (uint8_t *)&v3, 0x16u);
}

@end