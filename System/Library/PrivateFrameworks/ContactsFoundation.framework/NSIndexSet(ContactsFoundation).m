@interface NSIndexSet(ContactsFoundation)
- (id)_cn_filter:()ContactsFoundation;
- (id)_cn_flatMap:()ContactsFoundation;
- (id)_cn_map:()ContactsFoundation;
- (id)_cn_mapRanges:()ContactsFoundation;
- (id)_cn_shortDescription;
- (uint64_t)_cn_all:()ContactsFoundation;
- (uint64_t)_cn_any:()ContactsFoundation;
- (void)_cn_each:()ContactsFoundation;
@end

@implementation NSIndexSet(ContactsFoundation)

- (id)_cn_map:()ContactsFoundation
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NSIndexSet_ContactsFoundation___cn_map___block_invoke;
  v11[3] = &unk_1E56A1DD0;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateIndexesUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (uint64_t)_cn_all:()ContactsFoundation
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_ContactsFoundation___cn_all___block_invoke;
  v8[3] = &unk_1E56A1D80;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateIndexesUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)_cn_any:()ContactsFoundation
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_ContactsFoundation___cn_any___block_invoke;
  v8[3] = &unk_1E56A1D80;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateIndexesUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_cn_each:()ContactsFoundation
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__NSIndexSet_ContactsFoundation___cn_each___block_invoke;
    v6[3] = &unk_1E56A1DA8;
    id v7 = v4;
    [a1 enumerateIndexesUsingBlock:v6];
  }
}

- (id)_cn_filter:()ContactsFoundation
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__NSIndexSet_ContactsFoundation___cn_filter___block_invoke;
    v10[3] = &unk_1E56A1DD0;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateIndexesUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (id)_cn_flatMap:()ContactsFoundation
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__NSIndexSet_ContactsFoundation___cn_flatMap___block_invoke;
  v11[3] = &unk_1E56A1DD0;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateIndexesUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_cn_mapRanges:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__NSIndexSet_ContactsFoundation___cn_mapRanges___block_invoke;
  v11[3] = &unk_1E56A1DF8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateRangesUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_cn_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  v3 = objc_msgSend(a1, "_cn_mapRanges:", CNRangeShortDescription);
  id v4 = [v3 componentsJoinedByString:@","];
  [v2 appendString:v4];

  [v2 appendString:@"}"];
  id v5 = (void *)[v2 copy];

  return v5;
}

@end