@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __94__NSIndexSet_EDServerMessagePersistence__ed_nextRangesWithRangeCountLimit_reverseEnumeration___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 48) <= *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "addIndexesInRange:", a2, a3);
    ++*(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __77__NSIndexSet_EDServerMessagePersistence__ed_uidQueryExpressionWithTableName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 rangeValue];
  unint64_t v6 = v5;
  [v4 rangeValue];
  uint64_t v8 = 1;
  if (v6 >= v7) {
    uint64_t v8 = -1;
  }
  if (v6 == v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

void __66__NSIndexSet_EDServerMessagePersistence___uidRangesAndSingleUIDs___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    if (a3 > 3)
    {
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:");
    }
    else
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      objc_msgSend(v4, "_addUIDsFromRange:toArray:", a2, a3, v5);
    }
  }
}

id __99__NSIndexSet_EDServerMessagePersistence___uidQueryExpressionForRanges_andSingleUIDs_withTableName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rangeValue];
  id v6 = [NSString stringWithFormat:@"(%@ BETWEEN %lu AND %lu)", *(void *)(a1 + 32), v4, v5 + v4 - 1];

  return v6;
}

void __59__NSIndexSet_EDServerMessagePersistence__ed_logDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3 == 1) {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a2);
  }
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu:%llu", a2, a3 + a2 - 1);
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");
}

@end