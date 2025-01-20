@interface NSCompoundPredicate(BRQueryItemAdditions_Private)
- (id)_br_watchedParentURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:;
- (id)_br_watchedURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:;
- (id)br_urlWithWatchedChildren;
- (id)br_watchedURL;
@end

@implementation NSCompoundPredicate(BRQueryItemAdditions_Private)

- (id)_br_watchedURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "br_watchedURL");
  uint64_t v7 = objc_msgSend(v5, "br_watchedFileObjectID");
  v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = v6;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v5, "br_urlWithWatchedChildren");
    v11 = (void *)v10;
    id v9 = 0;
    if (v6 && v10)
    {
      if ([v6 isEqual:v10]) {
        id v9 = v11;
      }
      else {
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (id)_br_watchedParentURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "br_urlWithWatchedChildren");
  uint64_t v7 = objc_msgSend(v5, "br_fileObjectIDWithWatchedChildren");
  v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = v6;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v5, "br_urlWithWatchedChildren");
    v11 = (void *)v10;
    id v9 = 0;
    if (v6 && v10)
    {
      if ([v6 isEqual:v10]) {
        id v9 = v11;
      }
      else {
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (id)br_watchedURL
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 compoundPredicateType] == 1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v2 = objc_msgSend(a1, "subpredicates", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "br_watchedURL");
          if (v7)
          {
            id v13 = (id)v7;
            goto LABEL_19;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    goto LABEL_16;
  }
  if ([a1 compoundPredicateType] != 2)
  {
LABEL_17:
    id v13 = 0;
    goto LABEL_20;
  }
  v2 = [a1 subpredicates];
  if ([v2 count] != 2) {
    goto LABEL_16;
  }
  v8 = [v2 objectAtIndexedSubscript:0];
  id v9 = [v2 objectAtIndexedSubscript:1];
  uint64_t v10 = objc_msgSend(a1, "_br_watchedURLWithORPredicate1:predicate2:", v8, v9);

  if (!v10)
  {
    v11 = [v2 objectAtIndexedSubscript:1];
    v12 = [v2 objectAtIndexedSubscript:0];
    uint64_t v10 = objc_msgSend(a1, "_br_watchedURLWithORPredicate1:predicate2:", v11, v12);

    if (!v10)
    {
LABEL_16:

      goto LABEL_17;
    }
  }
  id v13 = v10;

LABEL_19:
LABEL_20:

  return v13;
}

- (id)br_urlWithWatchedChildren
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 compoundPredicateType] == 1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v2 = objc_msgSend(a1, "subpredicates", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "br_urlWithWatchedChildren");
          if (v7)
          {
            id v13 = (id)v7;
            goto LABEL_19;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    goto LABEL_16;
  }
  if ([a1 compoundPredicateType] != 2)
  {
LABEL_17:
    id v13 = 0;
    goto LABEL_20;
  }
  v2 = [a1 subpredicates];
  if ([v2 count] != 2) {
    goto LABEL_16;
  }
  v8 = [v2 objectAtIndexedSubscript:0];
  id v9 = [v2 objectAtIndexedSubscript:1];
  uint64_t v10 = objc_msgSend(a1, "_br_watchedParentURLWithORPredicate1:predicate2:", v8, v9);

  if (!v10)
  {
    v11 = [v2 objectAtIndexedSubscript:1];
    v12 = [v2 objectAtIndexedSubscript:0];
    uint64_t v10 = objc_msgSend(a1, "_br_watchedParentURLWithORPredicate1:predicate2:", v11, v12);

    if (!v10)
    {
LABEL_16:

      goto LABEL_17;
    }
  }
  id v13 = v10;

LABEL_19:
LABEL_20:

  return v13;
}

@end