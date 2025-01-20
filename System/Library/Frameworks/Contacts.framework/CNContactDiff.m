@interface CNContactDiff
+ (id)diffContact:(id)a3 to:(id)a4 error:(id *)a5;
+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)applyToABPerson:(void *)a3 isUnified:(BOOL)a4 logger:(id)a5 error:(id *)a6;
- (CNContactDiff)initWithUpdates:(id)a3;
- (NSArray)updates;
- (id)contactByApplyingUpdatesToContact:(id)a3;
- (id)description;
- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4;
- (void)applyToMutableContacts:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNContactDiff

- (BOOL)applyToABPerson:(void *)a3 isUnified:(BOOL)a4 logger:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v11 = objc_alloc_init(CNiOSABDependentPropertiesUpdateContext);
  [(CNiOSABDependentPropertiesUpdateContext *)v11 setIsUnifiedContact:v7];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(CNContactDiff *)self updates];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (![*(id *)(*((void *)&v19 + 1) + 8 * i) applyToABPerson:a3 withPropertiesContext:v11 logger:v10 error:a6])
        {

          BOOL v17 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = [(CNiOSABDependentPropertiesUpdateContext *)v11 flushPendingImageChangesToPerson:a3 logger:v10 error:a6];
LABEL_11:

  return v17;
}

+ (id)diffContact:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(CNContactDiffOptions);
  v11 = [a1 diffContact:v9 to:v8 options:v10 error:a5];

  return v11;
}

+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  id v13 = 0;
  BOOL v7 = +[CNCalculatesContactDiff diffContact:a3 to:a4 options:a5 error:&v13];
  id v8 = v13;
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    v11 = [[CNContactDiff alloc] initWithUpdates:v7];
  }
  else
  {
    v11 = 0;
    if (a6) {
      *a6 = v8;
    }
  }

  return v11;
}

- (CNContactDiff)initWithUpdates:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactDiff;
  v5 = [(CNContactDiff *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    id v8 = v5;
  }

  return v5;
}

- (id)contactByApplyingUpdatesToContact:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v5 = [MEMORY[0x1E4F5A458] multiDictionary];
  [(CNContactDiff *)self applyToMutableContact:v4 withIdentifierMap:v5];

  uint64_t v6 = [v4 freeze];

  return v6;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_updates;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "applyToMutableContact:withIdentifierMap:", v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)applyToMutableContacts:(id)a3 withIdentifierMap:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(CNContactDiff *)self applyToMutableContact:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withIdentifierMap:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"contactUpdates" object:self->_updates];
  v5 = [v3 build];

  return v5;
}

- (NSArray)updates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end