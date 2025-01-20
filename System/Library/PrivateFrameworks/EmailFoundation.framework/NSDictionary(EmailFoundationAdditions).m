@interface NSDictionary(EmailFoundationAdditions)
- (id)ef_filter:()EmailFoundationAdditions;
- (id)ef_mapValues:()EmailFoundationAdditions;
- (id)ef_objectOfClass:()EmailFoundationAdditions forKey:;
- (uint64_t)ef_all:()EmailFoundationAdditions;
- (uint64_t)ef_any:()EmailFoundationAdditions;
@end

@implementation NSDictionary(EmailFoundationAdditions)

- (id)ef_objectOfClass:()EmailFoundationAdditions forKey:
{
  v4 = [a1 objectForKey:a4];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)ef_all:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NSDictionary_EmailFoundationAdditions__ef_all___block_invoke;
  v8[3] = &unk_1E6122590;
  id v9 = v4;
  v10 = &v11;
  id v5 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)ef_any:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NSDictionary_EmailFoundationAdditions__ef_any___block_invoke;
  v8[3] = &unk_1E6122590;
  id v9 = v4;
  v10 = &v11;
  id v5 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ef_filter:()EmailFoundationAdditions
{
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__NSDictionary_EmailFoundationAdditions__ef_filter___block_invoke;
  v14[3] = &unk_1E61225B8;
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = [a1 keysOfEntriesPassingTest:v14];
  v7 = [v6 allObjects];

  uint64_t v8 = [v7 count];
  if (v8 == [a1 count])
  {
    id v9 = a1;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    v12 = [a1 objectsForKeys:v7 notFoundMarker:v11];
    id v9 = (id)[v10 initWithObjects:v12 forKeys:v7];
  }
  return v9;
}

- (id)ef_mapValues:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__NSDictionary_EmailFoundationAdditions__ef_mapValues___block_invoke;
  v11[3] = &unk_1E61225E0;
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  id v12 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

@end