@interface NSArray(_FPSpotlightQueryHelpers)
- (id)_fp_filter:()_FPSpotlightQueryHelpers;
- (id)_fp_map:()_FPSpotlightQueryHelpers;
- (uint64_t)_fp_componentsJoinedByAnd;
- (uint64_t)_fp_componentsJoinedByOr;
- (uint64_t)_fp_componentsWrappedInQuotes;
@end

@implementation NSArray(_FPSpotlightQueryHelpers)

- (id)_fp_map:()_FPSpotlightQueryHelpers
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"FPSpotlightQueryHelpers.m" lineNumber:40 description:@"Block cannot be nil."];
  }
  uint64_t v6 = [a1 count];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __45__NSArray__FPSpotlightQueryHelpers___fp_map___block_invoke;
    v15 = &unk_1E5AF5310;
    id v16 = v7;
    id v17 = v5;
    id v8 = v7;
    [a1 enumerateObjectsUsingBlock:&v12];
    v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  }
  else
  {
    v9 = objc_opt_new();
  }

  return v9;
}

- (uint64_t)_fp_componentsJoinedByOr
{
  return [a1 componentsJoinedByString:@" || "];
}

- (uint64_t)_fp_componentsJoinedByAnd
{
  return [a1 componentsJoinedByString:@" && "];
}

- (id)_fp_filter:()_FPSpotlightQueryHelpers
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"FPSpotlightQueryHelpers.m" lineNumber:52 description:@"Block cannot be nil."];
  }
  if ([a1 count])
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __48__NSArray__FPSpotlightQueryHelpers___fp_filter___block_invoke;
    v14 = &unk_1E5AF2FD8;
    id v15 = v6;
    id v16 = v5;
    id v7 = v6;
    [a1 enumerateObjectsUsingBlock:&v11];
    id v8 = objc_msgSend(v7, "copy", v11, v12, v13, v14);
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (uint64_t)_fp_componentsWrappedInQuotes
{
  return objc_msgSend(a1, "_fp_map:", &__block_literal_global_46);
}

@end