@interface NSDictionary(IntentsFoundation)
+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:count:uniquingKeysWith:;
+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:uniquingKeysWith:;
- (__CFString)if_JSONStringRepresentation;
- (id)if_compactMap:()IntentsFoundation;
- (id)if_dictionaryByAddingEntriesFromDictionary:()IntentsFoundation;
- (id)if_dictionaryWithNonEmptyValues;
@end

@implementation NSDictionary(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  size_t v5 = [a1 count];
  if (!v5) {
    return a1;
  }
  size_t v6 = v5;
  v7 = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  v8 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  [a1 getObjects:v8 andKeys:v7 count:v6];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  do
  {
    if (v9 != v10)
    {
      v7[v10] = v7[v9];
      v8[v10] = v8[v9];
    }
    (*(void (**)(uint64_t, void, void, void *, void *))(a3 + 16))(a3, v7[v9], v8[v9], &v7[v10], &v8[v10]);
    if (v7[v10] && v8[v10]) {
      ++v10;
    }
    ++v9;
  }
  while (v6 != v9);
  v11 = objc_opt_class();
  int v12 = [v11 isSubclassOfClass:objc_opt_class()];
  v13 = (Class *)0x1E4F1C9E8;
  if (v12) {
    v13 = (Class *)0x1E4F1CA60;
  }
  v14 = (void *)[objc_alloc(*v13) initWithObjects:v8 forKeys:v7 count:v10];
  free(v7);
  free(v8);
  return v14;
}

- (id)if_dictionaryByAddingEntriesFromDictionary:()IntentsFoundation
{
  id v4 = a3;
  size_t v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  size_t v6 = (void *)[v5 copy];
  return v6;
}

- (id)if_dictionaryWithNonEmptyValues
{
  v2 = [a1 keysOfEntriesPassingTest:&__block_literal_global_41];
  v3 = [v2 allObjects];
  id v4 = [a1 dictionaryWithValuesForKeys:v3];

  return v4;
}

- (__CFString)if_JSONStringRepresentation
{
  v1 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:2 error:0];
  if (v1) {
    v2 = (__CFString *)[[NSString alloc] initWithData:v1 encoding:4];
  }
  else {
    v2 = @"{}";
  }

  return v2;
}

+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:count:uniquingKeysWith:
{
  uint64_t v9 = a6;
  for (id i = objc_alloc_init(MEMORY[0x1E4F1CA60]); a5; --a5)
  {
    id v11 = *a4;
    id v12 = *a3;
    v13 = [i objectForKeyedSubscript:v11];
    if (v13)
    {
      v14 = v9[2](v9, v13, v12);
      [i setObject:v14 forKey:v11];
    }
    else
    {
      [i setObject:v12 forKey:v11];
    }

    ++a3;
    ++a4;
  }
  v15 = [a1 dictionaryWithDictionary:i];

  return v15;
}

+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:uniquingKeysWith:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 count];
  id v12 = malloc_type_calloc([v10 count], 8uLL, 0x80040B8603338uLL);
  v13 = malloc_type_calloc([v10 count], 8uLL, 0x80040B8603338uLL);
  objc_msgSend(v10, "getObjects:range:", v12, 0, v11);
  objc_msgSend(v9, "getObjects:range:", v13, 0, v11);

  uint64_t v14 = [v10 count];
  v15 = objc_msgSend(a1, "if_dictionaryWithObjects:forKeys:count:uniquingKeysWith:", v12, v13, v14, v8);

  free(v12);
  free(v13);
  return v15;
}

@end