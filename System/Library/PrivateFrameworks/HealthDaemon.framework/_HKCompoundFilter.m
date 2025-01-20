@interface _HKCompoundFilter
- (id)_filterByApplyingTransformationToSubfilters:(void *)a1;
@end

@implementation _HKCompoundFilter

- (id)_filterByApplyingTransformationToSubfilters:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 subfilters];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79___HKCompoundFilter_HealthDaemon___filterByApplyingTransformationToSubfilters___block_invoke;
    v7[3] = &unk_1E62FF7B8;
    id v8 = v3;
    v5 = objc_msgSend(v4, "hk_map:", v7);

    a1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B878]), "initWithType:subfilters:", objc_msgSend(a1, "compoundPredicateType"), v5);
  }

  return a1;
}

@end