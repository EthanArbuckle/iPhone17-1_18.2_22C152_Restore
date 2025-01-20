@interface _HKCompoundFilter(_HKBuilders)
- (id)builder_filterWithDataTypes:()_HKBuilders;
@end

@implementation _HKCompoundFilter(_HKBuilders)

- (id)builder_filterWithDataTypes:()_HKBuilders
{
  id v4 = a3;
  v5 = [a1 subfilters];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62___HKCompoundFilter__HKBuilders__builder_filterWithDataTypes___block_invoke;
  v10[3] = &unk_1E630A9A8;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "hk_map:", v10);

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B878]), "initWithType:subfilters:", objc_msgSend(a1, "compoundPredicateType"), v7);

  return v8;
}

@end