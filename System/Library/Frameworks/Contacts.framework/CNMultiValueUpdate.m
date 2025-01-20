@interface CNMultiValueUpdate
+ (id)addValue:(id)a3;
+ (id)removeValue:(id)a3;
+ (id)reorderValues:(id)a3;
+ (id)replaceValue:(id)a3 withValue:(id)a4;
- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8;
- (BOOL)ignoreIdentifiers;
- (int64_t)multiValueIndexForValue:(id)a3 inMultiValue:(void *)a4 identifier:(id *)a5;
- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4;
- (void)setIgnoreIdentifiers:(BOOL)a3;
@end

@implementation CNMultiValueUpdate

+ (id)addValue:(id)a3
{
  id v3 = a3;
  v4 = [(CNMultiValueSingleUpdate *)[CNMultiValueAddUpdate alloc] initWithValue:v3];

  return v4;
}

+ (id)removeValue:(id)a3
{
  id v3 = a3;
  v4 = [(CNMultiValueSingleUpdate *)[CNMultiValueRemoveUpdate alloc] initWithValue:v3];

  return v4;
}

+ (id)replaceValue:(id)a3 withValue:(id)a4
{
  id v4 = a4;
  v5 = [(CNMultiValueSingleUpdate *)[CNMultiValueReplaceUpdate alloc] initWithValue:v4];

  return v5;
}

+ (id)reorderValues:(id)a3
{
  id v3 = a3;
  id v4 = [[CNMultiValueReorderUpdate alloc] initWithValues:v3];

  return v4;
}

- (BOOL)ignoreIdentifiers
{
  return self->_ignoreIdentifiers;
}

- (void)setIgnoreIdentifiers:(BOOL)a3
{
  self->_ignoreIdentifiers = a3;
}

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  id v10 = a5;
  id v11 = a7;
  v12 = self;
  CNAbstractMethodException();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (int64_t)multiValueIndexForValue:(id)a3 inMultiValue:(void *)a4 identifier:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 identifier];
  uint64_t IndexForGUID = ABMultiValueGetIndexForGUID(a4, v8);
  if (IndexForGUID == -1)
  {

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = objc_msgSend(v7, "linkedIdentifiers", 0);
    id v8 = (id)[v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v12);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v16 = ABMultiValueGetIndexForGUID(a4, v15);
          if (v16 != -1)
          {
            int64_t v10 = v16;
            id v8 = v15;
            goto LABEL_15;
          }
        }
        id v8 = (id)[v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    int64_t v10 = -1;
LABEL_15:

    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    int64_t v10 = IndexForGUID;
    if (a5) {
LABEL_3:
    }
      *a5 = v8;
  }

  return v10;
}

@end