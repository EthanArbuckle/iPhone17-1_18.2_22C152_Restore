@interface NSIndexSet(ITK)
+ (id)itk_indexSetWithNSNumberIndex:()ITK;
- (__CFString)itk_indexString;
- (id)itk_rangeArray;
@end

@implementation NSIndexSet(ITK)

+ (id)itk_indexSetWithNSNumberIndex:()ITK
{
  id v3 = a3;
  if (v3) {
    id v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndex:", objc_msgSend(v3, "unsignedIntValue"));
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263F088D0]);
  }
  v5 = v4;

  return v5;
}

- (id)itk_rangeArray
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__NSIndexSet_ITK__itk_rangeArray__block_invoke;
  v6[3] = &unk_26538CF80;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateRangesUsingBlock:v6];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (__CFString)itk_indexString
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = [a1 firstIndex];
      objc_msgSend(NSString, "stringWithFormat:", @"[%ld]", v3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
      [v5 appendString:@"["];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __34__NSIndexSet_ITK__itk_indexString__block_invoke;
      v9[3] = &unk_26538CFA8;
      id v10 = v5;
      id v6 = v5;
      [a1 enumerateIndexesUsingBlock:v9];
      id v7 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@","];
      id v4 = [v6 stringByTrimmingCharactersInSet:v7];
    }
  }
  else
  {
    id v4 = @"[]";
  }

  return v4;
}

@end