@interface CNABPredicateObservable
@end

@implementation CNABPredicateObservable

id *__98___CNABPredicateObservable_observableWithPredicates_sortOrdering_options_addressBook_environment___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  v5 = -[_CNABPredicateObservable initWithPredicate:sortOrdering:options:addressBook:environment:]((id *)[v3 alloc], v4, *(_DWORD *)(a1 + 64), *(void **)(a1 + 48), *(const void **)(a1 + 56), *(void **)(a1 + 32));

  return v5;
}

uint64_t __38___CNABPredicateObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 isCanceled];
  id v4 = v14;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = v5 ? *(void *)(v5 + 32) : 0;
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(unsigned int *)(v7 + 24);
      uint64_t v9 = *(unsigned char *)(v7 + 40) & 1;
      uint64_t v10 = *(void *)(v7 + 16);
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "searchPeopleWithPredicate:sortOrder:ranked:inAddressBook:withDelegate:", v6, v8, v9, v10);
    uint64_t v3 = [v14 isCanceled];
    id v4 = v14;
    if ((v3 & 1) == 0)
    {
      v11 = *(void **)(a1 + 40);
      if (v11) {
        uint64_t v12 = v11[4];
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v3 = [v11 predicateShouldContinue:v12 afterFindingRecord:0 moreComing:0];
      id v4 = v14;
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F5A360] atomicCache];
  uint64_t v1 = schedulerForIdentifier_provider__cn_once_object_0;
  schedulerForIdentifier_provider__cn_once_object_0 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke_2(uint64_t a1)
{
  return +[_CNABPredicateObservable makeSerialFetchSchedulerUsingSchedulerProvider:](*(void *)(a1 + 40), *(void **)(a1 + 32));
}

@end