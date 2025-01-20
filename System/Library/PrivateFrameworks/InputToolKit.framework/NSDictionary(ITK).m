@interface NSDictionary(ITK)
- (id)itk_dictionaryByAddingEntriesFromNonNilDictionary:()ITK;
- (id)itk_md5;
- (id)itk_objectForNonNilKey:()ITK;
- (id)itk_prettyDescriptionWithTabLevel:()ITK;
@end

@implementation NSDictionary(ITK)

- (id)itk_dictionaryByAddingEntriesFromNonNilDictionary:()ITK
{
  id v4 = a1;
  if (a3)
  {
    id v5 = a3;
    v6 = (void *)[v4 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    uint64_t v7 = [v5 copy];

    id v4 = (id)v7;
  }

  return v4;
}

- (id)itk_prettyDescriptionWithTabLevel:()ITK
{
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v5 appendString:@"{\n"];
  if (a3)
  {
    v6 = &stru_2702F71A0;
    uint64_t v7 = a3;
    do
    {
      v8 = [(__CFString *)v6 stringByAppendingString:@"\t"];

      v6 = v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = &stru_2702F71A0;
  }
  v9 = [(__CFString *)v8 stringByAppendingString:@"\t"];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __55__NSDictionary_ITK__itk_prettyDescriptionWithTabLevel___block_invoke;
  v18 = &unk_26538CFD0;
  id v10 = v5;
  id v19 = v10;
  v20 = v9;
  uint64_t v21 = a3;
  id v11 = v9;
  [a1 enumerateKeysAndObjectsUsingBlock:&v15];
  [v10 appendFormat:@"%@}", v8, v15, v16, v17, v18];
  v12 = v20;
  id v13 = v10;

  return v13;
}

- (id)itk_objectForNonNilKey:()ITK
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)itk_md5
{
  v1 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:0 error:0];
  v2 = objc_msgSend(v1, "itk_md5");

  return v2;
}

@end