@interface GEOAggregateProgress
@end

@implementation GEOAggregateProgress

void __32___GEOAggregateProgress__update__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v54 = a2;
  if (!a3
    || ([v54 kind],
        v8 = objc_claimAutoreleasedReturnValue(),
        v9 = *(void **)(*(void *)(a1[4] + 8) + 40),
        v8,
        v10 = v54,
        v8 == v9))
  {
    uint64_t v11 = [v54 kind];
    uint64_t v12 = *(void *)(a1[4] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    v10 = v54;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  v14 = [v10 kind];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F28898]];

  v16 = v54;
  if (v15)
  {
    if (a3
      && ([v54 fileOperationKind],
          v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isEqualToString:*(void *)(*(void *)(a1[6] + 8) + 40)],
          v17,
          v19 = v54,
          (v18 & 1) == 0))
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }
    else
    {
      uint64_t v20 = [v54 fileOperationKind];
      uint64_t v21 = *(void *)(a1[6] + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      v19 = v54;
    }
    v23 = [v19 fileTotalCount];
    if (v23 && ((uint64_t v24 = *(void *)(*(void *)(a1[8] + 8) + 40), v23, !a3) || v24))
    {
      v27 = NSNumber;
      v4 = (char *)[*(id *)(*(void *)(a1[8] + 8) + 40) longLongValue];
      v26 = [v54 fileTotalCount];
      uint64_t v28 = objc_msgSend(v27, "numberWithLongLong:", &v4[objc_msgSend(v26, "longLongValue")]);
      uint64_t v29 = *(void *)(a1[8] + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    else
    {
      uint64_t v25 = *(void *)(a1[8] + 8);
      v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = 0;
    }

    v31 = [v54 fileCompletedCount];
    if (v31 && ((uint64_t v32 = *(void *)(*(void *)(a1[9] + 8) + 40), v31, !a3) || v32))
    {
      v35 = NSNumber;
      uint64_t v36 = [*(id *)(*(void *)(a1[9] + 8) + 40) longLongValue];
      v34 = [v54 fileCompletedCount];
      uint64_t v37 = objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v34, "longLongValue") + v36);
      uint64_t v38 = *(void *)(a1[9] + 8);
      v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;
    }
    else
    {
      uint64_t v33 = *(void *)(a1[9] + 8);
      v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = 0;
    }

    v40 = NSNumber;
    uint64_t v41 = [*(id *)(*(void *)(a1[10] + 8) + 40) longLongValue];
    v42 = [v54 byteTotalCount];
    if (v42)
    {
      v4 = [v54 byteTotalCount];
      uint64_t v43 = [v4 longLongValue];
    }
    else
    {
      uint64_t v43 = [v54 totalUnitCount];
    }
    uint64_t v44 = [v40 numberWithLongLong:v43 + v41];
    uint64_t v45 = *(void *)(a1[10] + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

    if (v42) {
    v47 = NSNumber;
    }
    uint64_t v48 = [*(id *)(*(void *)(a1[11] + 8) + 40) longLongValue];
    v49 = [v54 byteCompletedCount];
    if (v49)
    {
      v4 = [v54 byteCompletedCount];
      uint64_t v50 = [v4 longLongValue];
    }
    else
    {
      uint64_t v50 = [v54 completedUnitCount];
    }
    uint64_t v51 = [v47 numberWithLongLong:v50 + v48];
    uint64_t v52 = *(void *)(a1[11] + 8);
    v53 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = v51;

    if (v49) {
    v16 = v54;
    }
  }
  *a4 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24) ^ 1;
}

@end