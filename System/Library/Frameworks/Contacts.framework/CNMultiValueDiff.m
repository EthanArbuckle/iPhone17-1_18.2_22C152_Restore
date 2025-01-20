@interface CNMultiValueDiff
+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4;
+ (id)emptyDiff;
- (BOOL)applyToABPerson:(void *)a3 propertyDescription:(id)a4 isUnified:(BOOL)a5 logger:(id)a6 error:(id *)a7;
- (BOOL)isEmpty;
- (CNMultiValueDiff)initWithUpdates:(id)a3;
- (NSArray)updates;
- (id)description;
- (id)multiValueByApplyToMultiValue:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNMultiValueDiff

+ (id)emptyDiff
{
  if (emptyDiff_cn_once_token_0 != -1) {
    dispatch_once(&emptyDiff_cn_once_token_0, &__block_literal_global_3);
  }
  v2 = (void *)emptyDiff_cn_once_object_0;

  return v2;
}

void __29__CNMultiValueDiff_emptyDiff__block_invoke()
{
  v0 = [CNMultiValueDiff alloc];
  id v3 = [MEMORY[0x1E4F1C978] array];
  uint64_t v1 = [(CNMultiValueDiff *)v0 initWithUpdates:v3];
  v2 = (void *)emptyDiff_cn_once_object_0;
  emptyDiff_cn_once_object_0 = v1;
}

+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4
{
  v4 = +[CNCalculatesMultiValueDiff diffMultiValue:a3 toMultiValue:a4];
  if ([v4 count])
  {
    v5 = [[CNMultiValueDiff alloc] initWithUpdates:v4];
  }
  else
  {
    v5 = +[CNMultiValueDiff emptyDiff];
  }
  v6 = v5;

  return v6;
}

- (CNMultiValueDiff)initWithUpdates:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueDiff;
  v5 = [(CNMultiValueDiff *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)multiValueByApplyToMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_updates;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "applyToMutableMultiValue:withIdentifierMap:", v7, v6, (void)v15);
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = (void *)[v7 copy];

  return v13;
}

- (BOOL)isEmpty
{
  return [(NSArray *)self->_updates count] == 0;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F5A3A8] descriptionForObject:self->_updates withNamesAndObjects:0];
}

- (NSArray)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
}

- (BOOL)applyToABPerson:(void *)a3 propertyDescription:(id)a4 isUnified:(BOOL)a5 logger:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [v12 ABMutableMultiValueForABPerson:a3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v15 = [(CNMultiValueDiff *)self updates];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        if (![*(id *)(*((void *)&v28 + 1) + 8 * i) applyToABPerson:a3 abmultivalue:v14 propertyDescription:v12 isUnified:v9 logger:v13 error:a7])
        {

          BOOL v21 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  CFTypeRef cf = 0;
  char v20 = [v12 setABValue:v14 onABPerson:a3 error:&cf];
  BOOL v21 = v20;
  if (a7)
  {
    if ((v20 & 1) == 0)
    {
      v33 = @"CNKeyPaths";
      v22 = [v12 key];
      v32 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v34 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v25 = +[CNErrorFactory errorForiOSABError:cf];
      *a7 = +[CNErrorFactory errorByAddingUserInfoEntries:v24 toError:v25];

      if (cf) {
        CFRelease(cf);
      }
    }
  }
LABEL_14:

  return v21;
}

@end