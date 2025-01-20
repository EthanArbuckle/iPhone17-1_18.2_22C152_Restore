@interface NSCompoundPredicate(HKFilterExtension)
- (_HKCompoundFilter)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:;
@end

@implementation NSCompoundPredicate(HKFilterExtension)

- (_HKCompoundFilter)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = objc_msgSend(a1, "subpredicates", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "hk_filterRepresentationForDataTypes:isSubpredicate:", v6, a4);
        objc_msgSend(v7, "hk_addNonNilObject:", v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = -[_HKCompoundFilter initWithType:subfilters:]([_HKCompoundFilter alloc], "initWithType:subfilters:", [a1 compoundPredicateType], v7);

  return v14;
}

@end