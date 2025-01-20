@interface NSIndexSet(CyclicRange)
+ (id)indexSetWithIndexesInCyclicRange:()CyclicRange itemCount:;
- (uint64_t)_allInclusiveCyclicRangeForItemCount:()CyclicRange;
- (uint64_t)_filteredCyclicRangeForItemCount:()CyclicRange;
- (uint64_t)cyclicRangeForItemCount:()CyclicRange includeAllIndexes:;
@end

@implementation NSIndexSet(CyclicRange)

+ (id)indexSetWithIndexesInCyclicRange:()CyclicRange itemCount:
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v8 = a3;
    v9 = [MEMORY[0x1E4F28E60] indexSet];
    v5 = v9;
    if (v8 + a4 > a5)
    {
      uint64_t v10 = a5 - v8;
      objc_msgSend(v9, "addIndexesInRange:", v8, v10);
      uint64_t v8 = 0;
      a4 -= v10;
    }
    objc_msgSend(v5, "addIndexesInRange:", v8, a4);
  }
  return v5;
}

- (uint64_t)cyclicRangeForItemCount:()CyclicRange includeAllIndexes:
{
  if (a4) {
    return objc_msgSend(a1, "_allInclusiveCyclicRangeForItemCount:");
  }
  else {
    return objc_msgSend(a1, "_filteredCyclicRangeForItemCount:");
  }
}

- (uint64_t)_filteredCyclicRangeForItemCount:()CyclicRange
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3010000000;
  v39 = &unk_1E2B9EDE1;
  long long v40 = xmmword_1E2B90A30;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3010000000;
  v34 = &unk_1E2B9EDE1;
  long long v35 = xmmword_1E2B90A30;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3010000000;
  v29 = &unk_1E2B9EDE1;
  long long v30 = xmmword_1E2B90A30;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke;
  v21[3] = &unk_1E6DE4510;
  v21[4] = &v22;
  [a1 enumerateRangesUsingBlock:v21];
  if ((unint64_t)v23[3] < 2)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v5 = [a1 count];
    unint64_t v6 = (unint64_t)((double)(v5 / (v23[3] - 1)) * 0.5);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_2;
  v20[3] = &unk_1E6DE4538;
  v20[4] = &v31;
  v20[5] = &v36;
  v20[6] = &v26;
  v20[7] = v6;
  [a1 enumerateRangesUsingBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_3;
  v19[3] = &__block_descriptor_40_e20_Q24__0__NSRange_QQ_8l;
  v19[4] = v6;
  v7 = (void *)MEMORY[0x1E4E65800](v19);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_4;
  v16[3] = &unk_1E6DE4580;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = a3;
  uint64_t v9 = MEMORY[0x1E4E65800](v16);
  uint64_t v10 = (void *)v9;
  uint64_t v11 = v37[5];
  v12 = v27;
  if (!v11 || v32[5] + v11 <= (unint64_t)v27[5]) {
    goto LABEL_9;
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v9, v37[4]) & 1) == 0)
  {
    v12 = v27;
LABEL_9:
    v13 = v12 + 4;
    goto LABEL_10;
  }
  v13 = v32 + 4;
LABEL_10:
  uint64_t v14 = *v13;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
  return v14;
}

- (uint64_t)_allInclusiveCyclicRangeForItemCount:()CyclicRange
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__NSIndexSet_CyclicRange___allInclusiveCyclicRangeForItemCount___block_invoke;
  v17[3] = &unk_1E6DE4510;
  v17[4] = &v18;
  [a1 enumerateRangesUsingBlock:v17];
  if ([(id)v19[5] count] == 1)
  {
    unint64_t v5 = [(id)v19[5] objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 rangeValue];
  }
  else
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    while (v8 < [(id)v19[5] count])
    {
      uint64_t v10 = [(id)v19[5] objectAtIndexedSubscript:v8];
      unint64_t v11 = [v10 rangeValue];

      if (v8) {
        [(id)v19[5] objectAtIndexedSubscript:v8 - 1];
      }
      else {
      v12 = objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", objc_msgSend((id)v19[5], "count") - 1);
      }
      unint64_t v13 = [v12 rangeValue];
      uint64_t v15 = v14;

      unint64_t v16 = a3 - v11 + v13 + v15;
      if (v13 > v11) {
        unint64_t v16 = v13 + v15 - v11;
      }
      if (v9 >= v16)
      {
        unint64_t v9 = v16;
        uint64_t v6 = v11;
      }
      ++v8;
    }
  }
  _Block_object_dispose(&v18, 8);

  return v6;
}

@end