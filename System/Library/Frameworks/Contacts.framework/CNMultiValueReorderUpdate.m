@interface CNMultiValueReorderUpdate
- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8;
- (CNMultiValueReorderUpdate)initWithValues:(id)a3;
- (NSOrderedSet)values;
- (id)description;
- (int64_t)compareIndexOfIdentifier:(id)a3 toIndexOfIdentifier:(id)a4;
- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNMultiValueReorderUpdate

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  values = self->_values;
  v15 = [v12 key];
  [v13 applyContactUpdateOfKind:"multi value reorder" value:values property:v15];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v41 = self;
  v16 = [(CNMultiValueReorderUpdate *)self values];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (!v17)
  {
    v32 = v16;
    BOOL v33 = 1;
LABEL_31:

    goto LABEL_33;
  }
  uint64_t v18 = v17;
  v38 = a8;
  id v39 = v13;
  v40 = v12;
  unint64_t v43 = 0;
  uint64_t v19 = *(void *)v46;
  BOOL v20 = a6;
  v21 = self;
LABEL_3:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v46 != v19) {
      objc_enumerationMutation(v16);
    }
    uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * v22);
    id v44 = 0;
    unint64_t v24 = [(CNMultiValueUpdate *)v21 multiValueIndexForValue:v23 inMultiValue:a4 identifier:&v44];
    id v25 = v44;
    if (v24 == -1 && v20) {
      goto LABEL_24;
    }
    uint64_t v26 = v19;
    int inserted = v24 != -1;
    if (v24 == -1 || v24 <= v43) {
      goto LABEL_22;
    }
    v29 = v16;
    CFTypeRef v30 = ABMultiValueCopyValueAtIndex(a4, v24);
    CFStringRef v31 = ABMultiValueCopyLabelAtIndex(a4, v24);
    if (ABMultiValueRemoveValueAndLabelAtIndex(a4, v24))
    {
      int inserted = ABMultiValueInsertValueAndLabelAndUUIDAtIndex();
      if (!v30) {
        goto LABEL_18;
      }
LABEL_17:
      CFRelease(v30);
      goto LABEL_18;
    }
    int inserted = 0;
    if (v30) {
      goto LABEL_17;
    }
LABEL_18:
    if (v31)
    {
      CFRelease(v31);
      v16 = v29;
      BOOL v20 = a6;
      v21 = v41;
      if ((inserted & 1) == 0) {
        break;
      }
      goto LABEL_23;
    }
    v16 = v29;
    BOOL v20 = a6;
    v21 = v41;
LABEL_22:
    if (!inserted) {
      break;
    }
LABEL_23:
    ++v43;
    uint64_t v19 = v26;
LABEL_24:

    if (v18 == ++v22)
    {
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v18) {
        goto LABEL_3;
      }
      v32 = v16;
      BOOL v33 = 1;
      id v12 = v40;
      goto LABEL_29;
    }
  }

  if (v38)
  {
    v50 = @"CNKeyPaths";
    id v12 = v40;
    v32 = [v40 key];
    v49 = v32;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v51 = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    v36 = +[CNErrorFactory genericiOSABError];
    id *v38 = +[CNErrorFactory errorByAddingUserInfoEntries:v35 toError:v36];

    BOOL v33 = 0;
LABEL_29:
    id v13 = v39;
    goto LABEL_31;
  }
  BOOL v33 = 0;
  id v13 = v39;
  id v12 = v40;
LABEL_33:

  return v33;
}

- (CNMultiValueReorderUpdate)initWithValues:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueReorderUpdate;
  v5 = [(CNMultiValueReorderUpdate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v4];
    values = v5->_values;
    v5->_values = (NSOrderedSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CNMultiValueReorderUpdate_applyToMutableMultiValue_withIdentifierMap___block_invoke;
  v4[3] = &unk_1E56B8F80;
  v4[4] = self;
  objc_msgSend(a3, "sortUsingComparator:", v4, a4);
}

uint64_t __72__CNMultiValueReorderUpdate_applyToMutableMultiValue_withIdentifierMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [a2 identifier];
  v7 = [v5 identifier];

  uint64_t v8 = [v4 compareIndexOfIdentifier:v6 toIndexOfIdentifier:v7];
  return v8;
}

- (int64_t)compareIndexOfIdentifier:(id)a3 toIndexOfIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  values = self->_values;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke;
  v18[3] = &unk_1E56B4E28;
  id v19 = v6;
  id v9 = v6;
  unint64_t v10 = [(NSOrderedSet *)values indexOfObjectPassingTest:v18];
  v11 = self->_values;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke_2;
  v16[3] = &unk_1E56B4E28;
  id v17 = v7;
  id v12 = v7;
  unint64_t v13 = [(NSOrderedSet *)v11 indexOfObjectPassingTest:v16];
  if (v10 < v13) {
    int64_t v14 = -1;
  }
  else {
    int64_t v14 = v10 > v13;
  }

  return v14;
}

uint64_t __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"values", self->_values, 0);
  id v5 = [v3 build];

  return v5;
}

- (NSOrderedSet)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end