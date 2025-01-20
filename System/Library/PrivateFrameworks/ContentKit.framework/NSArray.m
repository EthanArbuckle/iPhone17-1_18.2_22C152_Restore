@interface NSArray
@end

@implementation NSArray

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3)
  {
    v4 = (void *)[*(id *)(a1 + 32) propertyClass];
    if ([v4 isSubclassOfClass:objc_opt_class()])
    {
      v3 = [MEMORY[0x263EFF910] date];
    }
    else if ([v4 isSubclassOfClass:objc_opt_class()])
    {
      v3 = &stru_26C71CE08;
    }
    else if ([v4 isSubclassOfClass:objc_opt_class()])
    {
      v3 = (__CFString *)&unk_26C7421D8;
    }
    else if ([v4 isSubclassOfClass:objc_opt_class()])
    {
      v3 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:@"0"];
    }
    else if ([v4 isSubclassOfClass:objc_opt_class()])
    {
      v3 = +[WFEmailAddress addressWithEmailAddress:&stru_26C71CE08];
    }
    else
    {
      v3 = (__CFString *)objc_opt_new();
    }
  }
  v8 = v3;
  [*(id *)(a1 + 40) lock];
  v5 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 56)];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "equivalentHash"));
  v7 = [v6 stringValue];
  [v5 setObject:v8 forKey:v7];

  [*(id *)(a1 + 40) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_83(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectEnumerator];
  v3 = [v2 allObjects];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_6;
  v7[3] = &unk_26428ACE8;
  v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_msgSend(v4, "if_mapAsynchronously:completionHandler:", &__block_literal_global_86_22385, v7);
}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) sortedArrayUsingDescriptors:a2];
  v3 = [v4 valueForKey:@"object"];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  v7 = [v5 property];
  id v8 = [v7 possibleValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_3;
  v11[3] = &unk_26428A598;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 getValuesWithCompletionBlock:v11];
}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x263F08B30];
    id v5 = NSNumber;
    id v6 = [*(id *)(a1 + 32) property];
    v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "equivalentHash"));
    id v8 = [v7 stringValue];
    uint64_t v9 = [*(id *)(a1 + 32) ascending];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_4;
    v28[3] = &unk_26428A570;
    id v29 = v3;
    id v10 = [v4 sortDescriptorWithKey:v8 ascending:v9 comparator:v28];
  }
  else
  {
    v11 = [*(id *)(a1 + 32) comparator];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x263F08B30];
      id v13 = NSNumber;
      v14 = [*(id *)(a1 + 32) property];
      v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "equivalentHash"));
      v16 = [v15 stringValue];
      uint64_t v17 = [*(id *)(a1 + 32) ascending];
      v18 = [*(id *)(a1 + 32) comparator];
      id v10 = [v12 sortDescriptorWithKey:v16 ascending:v17 comparator:v18];
    }
    else
    {
      v19 = [*(id *)(a1 + 32) property];
      uint64_t v20 = [v19 propertyClass];
      uint64_t v21 = objc_opt_class();

      v22 = (void *)MEMORY[0x263F08B30];
      v23 = NSNumber;
      v24 = [*(id *)(a1 + 32) property];
      v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "equivalentHash"));
      v26 = [v25 stringValue];
      uint64_t v27 = [*(id *)(a1 + 32) ascending];
      if (v20 == v21) {
        [v22 sortDescriptorWithKey:v26 ascending:v27 selector:sel_localizedStandardCompare_];
      }
      else {
      id v10 = [v22 sortDescriptorWithKey:v26 ascending:v27];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_5;
  aBlock[3] = &unk_26428A548;
  id v13 = *(id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  v7 = (void (**)(void *, id))_Block_copy(aBlock);
  id v8 = v7[2](v7, v6);

  uint64_t v9 = v7[2](v7, v5);

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

uint64_t __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexOfObject:a2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = NSNumber;
  return [v4 numberWithUnsignedInteger:v3];
}

@end