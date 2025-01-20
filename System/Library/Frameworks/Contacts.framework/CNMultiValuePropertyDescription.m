@interface CNMultiValuePropertyDescription
- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8;
- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7;
- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7;
- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4;
- (BOOL)isMultiValue;
- (BOOL)isSingleValue;
- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (Class)labeledValueClass;
- (Class)valueClass;
- (NSArray)managedLabels;
- (NSArray)standardLabels;
- (__CFString)ABMultiValueLabelFromCNLabeledValueLabel:(id)a3;
- (id)CNLabeledValueLabelFromABMultiValueLabel:(__CFString *)a3;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3 destinationClass:(Class)a4 settersByABKeys:(id)a5;
- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNMutableValueForABMultivalue;
- (id)CNValueFromABValue:(void *)a3;
- (id)fromPlistTransform;
- (id)localizedStringForLabel:(id)a3;
- (id)plistTransform;
- (id)standardLabelsWithOptions:(unint64_t)a3;
- (id)stringForIndexingForContact:(id)a3;
- (id)valueWithResetIdentifiers:(id)a3;
- (unsigned)abPropertyType;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3 gettersByABKeys:(id)a4;
- (void)ABMutableMultiValueForABPerson:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)assertValueType:(id)a3;
@end

@implementation CNMultiValuePropertyDescription

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  v17 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValueBytes:a3 length:a4];
  [(CNMultiValuePropertyDescription *)self applyCNValue:v17 toArray:v14 identifier:v16 legacyIdentifier:v9 label:v15];

  return 1;
}

- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[CNLabeledValue alloc] primitiveInitWithIdentifier:v12 label:v11 value:v14];

  [v15 setIOSLegacyIdentifier:v7];
  [v13 addObject:v15];

  return 1;
}

- (id)CNMutableValueForABMultivalue
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    v5 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)assertValueType:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNMultiValuePropertyDescription;
  [(CNPropertyDescription *)&v24 assertValueType:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v19 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
          v10 = CNPropertyInvalidTypeExceptionName;
          uint64_t v11 = objc_opt_class();
          id v12 = [(CNPropertyDescription *)self key];
          [v9 raise:v10, @"Labeled value %@ has incorrect type %@ for key %@. It should be %@.", v8, v11, v12, objc_opt_class() format];
        }
        id v13 = [v8 label];
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v14 = (void *)MEMORY[0x1E4F1CA00];
            id v15 = CNPropertyInvalidTypeExceptionName;
            uint64_t v16 = objc_opt_class();
            [v14 raise:v15, @"Labeled value %@ label %@ has incorrect type %@. It should be %@.", v8, v13, v16, objc_opt_class() format];
          }
        }
        v17 = [v8 value];
        [(CNMultiValuePropertyDescription *)self labeledValueClass];
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:CNPropertyInvalidTypeExceptionName, @"Labeled value %@ value %@ has incorrect type %@. It should be %@.", v8, v17, objc_opt_class(), -[CNMultiValuePropertyDescription labeledValueClass](self, "labeledValueClass") format];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isMultiValue
{
  return 1;
}

void __116__CNMultiValuePropertyDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue_destinationClass_settersByABKeys___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v6 = a3;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a2);
  if (Value) {
    v6[2](v6, *(void *)(a1 + 32), Value);
  }
}

- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  uint64_t v13 = *MEMORY[0x1E4F49AA8];
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  v17 = [v12 objectForKey:v13];
  v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 componentsSeparatedByString:@","];
    long long v20 = (void *)[v12 mutableCopy];
    [v20 setObject:v19 forKey:v13];

    id v12 = v20;
  }
  long long v21 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValue:v12];

  BOOL v22 = [(CNMultiValuePropertyDescription *)self applyCNValue:v21 toArray:v14 identifier:v16 legacyIdentifier:v9 label:v15];
  return v22;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3 destinationClass:(Class)a4 settersByABKeys:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init(a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __116__CNMultiValuePropertyDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue_destinationClass_settersByABKeys___block_invoke;
  v11[3] = &unk_1E56B7550;
  uint64_t v13 = a3;
  id v9 = v8;
  id v12 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  return v9;
}

- (unsigned)abPropertyType
{
  return 1;
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[CNiOSABConstantsMapping CNToABLabelConstantsMapping];
  v22 = long long v21 = self;
  ABMutableMultiValueRef Mutable = ABMultiValueCreateMutable([(CNMultiValuePropertyDescription *)self abPropertyType]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        id v12 = [v11 value];
        [(CNMultiValuePropertyDescription *)v21 ABMultiValueValueFromCNLabeledValueValue:v12];
        uint64_t v13 = [v11 label];
        id v14 = [v22 mappedConstant:v13];

        id v15 = [v11 identifier];
        ABMultiValueInsertValueAndLabelAndUUIDAtIndex();

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      int v8 = v10 + v9;
    }
    while (v7);
  }
  CFStringRef IdentifierAtIndex = (const __CFString *)ABMultiValueGetIdentifierAtIndex(Mutable, 0);
  ABMultiValueSetPrimaryIdentifier(Mutable, IdentifierAtIndex);
  if (Mutable) {
    CFTypeRef v17 = CFAutorelease(Mutable);
  }
  else {
    CFTypeRef v17 = 0;
  }

  return (void *)v17;
}

- (id)CNValueFromABValue:(void *)a3
{
  id v16 = [MEMORY[0x1E4F1CA48] array];
  CFIndex Count = ABMultiValueGetCount(a3);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFTypeRef v6 = ABMultiValueCopyValueAtIndex(a3, i);
      CFStringRef v7 = ABMultiValueCopyLabelAtIndex(a3, i);
      uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(a3, i);
      uint64_t v9 = (const void *)ABMultiValueCopyUUIDAtIndex();
      int v10 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValue:v6];
      uint64_t v11 = [(CNMultiValuePropertyDescription *)self CNLabeledValueLabelFromABMultiValueLabel:v7];
      if (v10)
      {
        id v12 = [[CNLabeledValue alloc] primitiveInitWithIdentifier:v9 label:v11 value:v10];
        [v12 setIOSLegacyIdentifier:IdentifierAtIndex];
        [v16 addObject:v12];
      }
      if (v6) {
        CFRelease(v6);
      }
      if (v7) {
        CFRelease(v7);
      }
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  uint64_t v13 = v16;
  id v14 = objc_msgSend(v16, "copy", v16);

  return v14;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  return a3;
}

- (id)CNLabeledValueLabelFromABMultiValueLabel:(__CFString *)a3
{
  id v4 = +[CNiOSABConstantsMapping ABToCNLabelConstantsMapping];
  uint64_t v5 = [v4 mappedConstant:a3];

  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  return a3;
}

- (__CFString)ABMultiValueLabelFromCNLabeledValueLabel:(id)a3
{
  id v3 = a3;
  id v4 = +[CNiOSABConstantsMapping CNToABLabelConstantsMapping];
  uint64_t v5 = (__CFString *)[v4 mappedConstant:v3];

  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3 gettersByABKeys:(id)a4
{
  id v5 = a3;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v7 = a4;
  ABMutableMultiValueRef Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__CNMultiValuePropertyDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue_gettersByABKeys___block_invoke;
  v11[3] = &unk_1E56B7550;
  id v9 = v5;
  id v12 = v9;
  uint64_t v13 = Mutable;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  if (Mutable) {
    ABMutableMultiValueRef Mutable = CFAutorelease(Mutable);
  }

  return (void *)Mutable;
}

void __99__CNMultiValuePropertyDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue_gettersByABKeys___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id key = a2;
  CFStringRef v5 = (const __CFString *)(*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
  if (v5)
  {
    CFStringRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID() || CFStringGetLength(v6) >= 1) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, v6);
    }
  }
}

- (void)ABMutableMultiValueForABPerson:(void *)a3
{
  id v4 = [(CNPropertyDescription *)self ABValueForABPerson:a3];
  if (v4)
  {
    result = (void *)ABMultiValueCreateMutableCopy(v4);
    if (!result) {
      return result;
    }
  }
  else
  {
    result = (void *)ABMultiValueCreateMutable([(CNMultiValuePropertyDescription *)self abPropertyType]);
    if (!result) {
      return result;
    }
  }

  return (void *)CFAutorelease(result);
}

- (BOOL)isSingleValue
{
  return 0;
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  id v6 = a4;
  CFTypeID v7 = [(CNPropertyDescription *)self CNValueForContact:a3];
  int v8 = [(CNPropertyDescription *)self CNValueForContact:v6];

  LOBYTE(v6) = +[CNLabeledValue isArrayOfEntries:v7 equalToArrayOfEntriesIgnoringIdentifiers:v8];
  return (char)v6;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFTypeID v7 = v6;
  if (v6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) value];
          id v22 = 0;
          BOOL v14 = [(CNMultiValuePropertyDescription *)self isValidMultiValueValue:v13 error:&v22];
          id v15 = v22;
          id v16 = v15;
          if (!v14)
          {
            if (a4)
            {
              v18 = [(CNPropertyDescription *)self key];
              v27[0] = v18;
              v27[1] = @"value";
              uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
              uint64_t v20 = [v19 componentsJoinedByString:@"."];
              *a4 = +[CNErrorFactory errorByPrependingKeyPath:v20 toKeyPathsInError:v16];
            }
            BOOL v17 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 1;
LABEL_14:
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 conformsToProtocol:&unk_1EE094630]) {
    char v6 = [v5 isValid:a4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)stringForIndexingForContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(objc_class *)[(CNMultiValuePropertyDescription *)self labeledValueClass] isSubclassOfClass:objc_opt_class()])
  {
    id v5 = [(CNPropertyDescription *)self CNValueForContact:v4];
    if ([v5 count])
    {
      char v6 = [MEMORY[0x1E4F28E78] string];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "value", (void)v14);
            [v6 appendString:v12];

            [v6 appendString:@" "];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)valueWithResetIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "label", (void)v15);
        id v12 = [v10 value];
        uint64_t v13 = +[CNLabeledValue labeledValueWithLabel:v11 value:v12];

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)plistTransform
{
  return +[CN nullTransform];
}

- (id)fromPlistTransform
{
  return +[CN nullTransform];
}

- (id)standardLabelsWithOptions:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = [(CNMultiValuePropertyDescription *)self standardLabels];
  }
  return v4;
}

- (NSArray)standardLabels
{
  if (standardLabels_cn_once_token_0 != -1) {
    dispatch_once(&standardLabels_cn_once_token_0, &__block_literal_global_92);
  }
  v2 = (void *)standardLabels_cn_once_object_0;

  return (NSArray *)v2;
}

uint64_t __49__CNMultiValuePropertyDescription_standardLabels__block_invoke()
{
  standardLabels_cn_once_object_0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<Home>!$_", @"_$!<Work>!$_", @"_$!<School>!$_", @"_$!<Other>!$_", 0);

  return MEMORY[0x1F41817F8]();
}

- (NSArray)managedLabels
{
  return 0;
}

- (id)localizedStringForLabel:(id)a3
{
  return +[CNLabeledValue localizedStringForLabel:a3];
}

@end