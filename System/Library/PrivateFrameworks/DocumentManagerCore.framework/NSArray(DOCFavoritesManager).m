@interface NSArray(DOCFavoritesManager)
- (id)_doc_ranksForInsertingBelowRank:()DOCFavoritesManager spacing:count:;
- (id)doc_computeNewRankForIndex:()DOCFavoritesManager;
- (id)doc_ranksForInsertingBelowRank:()DOCFavoritesManager count:;
- (id)doc_ranksForInsertingBetweenHigherRank:()DOCFavoritesManager lowerRank:count:;
@end

@implementation NSArray(DOCFavoritesManager)

- (id)doc_computeNewRankForIndex:()DOCFavoritesManager
{
  unint64_t v4 = a3 & ~(a3 >> 63);
  unint64_t v5 = [a1 count];
  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 != [a1 count])
    {
      v19 = [a1 objectAtIndex:v6 - 1];
      v8 = [v19 favoriteRank];

      v20 = [a1 objectAtIndex:v6];
      v21 = [v20 favoriteRank];

      uint64_t v10 = DOCRandomRankBetween([v21 unsignedLongLongValue], objc_msgSend(v8, "unsignedLongLongValue"));

      goto LABEL_14;
    }
    v7 = [a1 lastObject];
    v8 = [v7 favoriteRank];

    if (v8)
    {
      v9 = objc_msgSend(a1, "doc_ranksForInsertingBelowRank:count:", v8, 1);
      uint64_t v10 = [v9 firstObject];

LABEL_14:
      v8 = (void *)v10;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  v11 = NSNumber;
  v12 = [MEMORY[0x263EFF910] date];
  [v12 timeIntervalSince1970];
  v8 = [v11 numberWithUnsignedLongLong:(unint64_t)(v13 * 1000.0)];

  if ((unint64_t)[a1 count] >= 2)
  {
    v14 = [a1 objectAtIndex:1];
    v15 = [v14 favoriteRank];
    unint64_t v16 = [v15 unsignedLongLongValue];

    if ([v8 unsignedLongLongValue] <= v16)
    {
      v17 = DOCRandomRankBetween(0, 0x3E8uLL);
      uint64_t v18 = [v17 unsignedLongLongValue];

      if (!__CFADD__(v18, v16))
      {
        uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v18 + v16];
        goto LABEL_14;
      }
LABEL_12:
      uint64_t v10 = 0;
      goto LABEL_14;
    }
  }
LABEL_15:
  return v8;
}

- (id)doc_ranksForInsertingBetweenHigherRank:()DOCFavoritesManager lowerRank:count:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  v11 = 0;
  if (v8 && v9 && a5)
  {
    unint64_t v12 = [v8 unsignedLongLongValue];
    unint64_t v13 = [v10 unsignedLongLongValue];
    unint64_t v14 = v12 - v13;
    if (v12 > v13 && v14 >= a5)
    {
      v11 = objc_msgSend(a1, "_doc_ranksForInsertingBelowRank:spacing:count:", v8, v14 / a5, a5);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)doc_ranksForInsertingBelowRank:()DOCFavoritesManager count:
{
  id v6 = a3;
  v7 = DOCRandomRankBetween(0, 0x3E8uLL);
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = objc_msgSend(a1, "_doc_ranksForInsertingBelowRank:spacing:count:", v6, v8, a4);

  return v9;
}

- (id)_doc_ranksForInsertingBelowRank:()DOCFavoritesManager spacing:count:
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a5 && a5 * a4 < (unint64_t)[v7 unsignedLongLongValue])
  {
    id v9 = [MEMORY[0x263EFF980] array];
    uint64_t v10 = [v8 unsignedLongLongValue] - a4;
    do
    {
      v11 = [NSNumber numberWithUnsignedLongLong:v10];
      [v9 addObject:v11];

      v10 -= a4;
      --a5;
    }
    while (a5);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end