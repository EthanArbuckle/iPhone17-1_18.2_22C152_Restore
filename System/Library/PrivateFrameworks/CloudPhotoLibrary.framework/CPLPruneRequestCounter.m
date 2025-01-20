@interface CPLPruneRequestCounter
@end

@implementation CPLPruneRequestCounter

void __43___CPLPruneRequestCounter_statusDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 countForObject:v5];

  if (v6)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:v6];
    v7 = *(void **)(a1 + 40);
    v8 = +[CPLResource descriptionForResourceType:a2];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

void __33___CPLPruneRequestCounter_status__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 countForObject:v5];

  v7 = *(void **)(*(void *)(a1 + 32) + 16);
  v8 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v9 = [v7 countForObject:v8];

  if (!(v6 | v9)) {
    return;
  }
  id v10 = [NSString alloc];
  uint64_t v11 = +[CPLResource shortDescriptionForResourceType:a2];
  v12 = (void *)v11;
  if (v9) {
    uint64_t v13 = [v10 initWithFormat:@"%lu x %@ (+ %lu rejected)", v6, v11, v9];
  }
  else {
    uint64_t v13 = [v10 initWithFormat:@"%lu x %@", v6, v11, v22];
  }
  id v23 = (id)v13;

  v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v14)
  {
    uint64_t v19 = [v23 mutableCopy];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v15 = a1 + 56;
    uint64_t v18 = 1;
    goto LABEL_10;
  }
  [v14 appendFormat:@", %@", v23];
  uint64_t v15 = a1 + 56;
  if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 3)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    uint64_t v18 = 0;
LABEL_10:
    *(void *)(*(void *)(*(void *)v15 + 8) + 24) = v18;
  }
}

@end