@interface NSArray(HDSCollectionAdditions)
- (id)hds_compactMap:()HDSCollectionAdditions;
- (id)hds_objectsPassingTest:()HDSCollectionAdditions;
@end

@implementation NSArray(HDSCollectionAdditions)

- (id)hds_compactMap:()HDSCollectionAdditions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "hds_addNonNilObject:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)hds_objectsPassingTest:()HDSCollectionAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__NSArray_HDSCollectionAdditions__hds_objectsPassingTest___block_invoke;
  v9[3] = &unk_265040168;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

@end