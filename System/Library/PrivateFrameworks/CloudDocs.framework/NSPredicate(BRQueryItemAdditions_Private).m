@interface NSPredicate(BRQueryItemAdditions_Private)
- (id)extractSearchTermFromPredicate;
- (uint64_t)_isContentTypeFolderComparisonPredicate;
- (uint64_t)br_fileObjectIDWithWatchedChildren;
- (uint64_t)br_urlWithWatchedChildren;
- (uint64_t)br_watchedFileObjectID;
- (uint64_t)br_watchedURL;
- (uint64_t)isFolderOnlyPredicate;
@end

@implementation NSPredicate(BRQueryItemAdditions_Private)

- (uint64_t)br_watchedURL
{
  return 0;
}

- (uint64_t)br_urlWithWatchedChildren
{
  return 0;
}

- (uint64_t)br_fileObjectIDWithWatchedChildren
{
  return 0;
}

- (uint64_t)br_watchedFileObjectID
{
  return 0;
}

- (uint64_t)_isContentTypeFolderComparisonPredicate
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 predicateOperatorType] == 1100 || objc_msgSend(v2, "predicateOperatorType") == 1101)
    {
      v3 = [v2 leftExpression];
      if (objc_msgSend(v3, "br_isKeyPathExpression:", *MEMORY[0x1E4F285C0]))
      {
        v4 = [v2 rightExpression];
        uint64_t v5 = objc_msgSend(v4, "br_isConstantValueExpression:", *MEMORY[0x1E4F225C8]);
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)isFolderOnlyPredicate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 _isContentTypeFolderComparisonPredicate])
  {
    uint64_t v2 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v1;
      if ([v3 compoundPredicateType] == 1)
      {
        long long v10 = 0u;
        long long v11 = 0u;
        long long v8 = 0u;
        long long v9 = 0u;
        v4 = objc_msgSend(v3, "subpredicates", 0);
        uint64_t v2 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v2)
        {
          uint64_t v5 = *(void *)v9;
          while (2)
          {
            for (uint64_t i = 0; i != v2; ++i)
            {
              if (*(void *)v9 != v5) {
                objc_enumerationMutation(v4);
              }
              if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFolderOnlyPredicate])
              {
                uint64_t v2 = 1;
                goto LABEL_17;
              }
            }
            uint64_t v2 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
            if (v2) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

- (id)extractSearchTermFromPredicate
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 compoundPredicateType] == 2)
    {
      id v3 = [v2 subpredicates];
      if ([v3 count] == 2)
      {
        v4 = [v3 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v6 = 0;
        if (isKindOfClass)
        {
          v7 = [v3 objectAtIndexedSubscript:0];
          id v6 = 0;
          if ([v7 predicateOperatorType] == 8)
          {
            long long v8 = [v7 leftExpression];
            uint64_t v9 = *MEMORY[0x1E4F285E8];
            if (objc_msgSend(v8, "br_isKeyPathExpression:", *MEMORY[0x1E4F285E8]))
            {
              long long v10 = [v7 rightExpression];
              if ([v10 expressionType])
              {
                id v6 = 0;
              }
              else
              {
                long long v11 = [v10 constantValue];
                v12 = [v3 objectAtIndexedSubscript:1];
                objc_opt_class();
                char v13 = objc_opt_isKindOfClass();

                if (v13)
                {
                  v14 = [v3 objectAtIndexedSubscript:1];
                  if ([v14 predicateOperatorType] == 7)
                  {
                    v15 = [v14 leftExpression];

                    if (objc_msgSend(v15, "br_isKeyPathExpression:", v9))
                    {
                      v16 = [v14 rightExpression];

                      v17 = NSString;
                      v18 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v11];
                      v19 = [v17 stringWithFormat:@"* %@*", v18];

                      if (objc_msgSend(v16, "br_isConstantValueExpression:", v19)) {
                        id v6 = v11;
                      }
                      else {
                        id v6 = 0;
                      }

                      long long v10 = v16;
                    }
                    else
                    {
                      id v6 = 0;
                    }
                  }
                  else
                  {
                    id v6 = 0;
                    v15 = v8;
                  }

                  long long v8 = v15;
                }
                else
                {
                  id v6 = 0;
                }
              }
            }
            else
            {
              id v6 = 0;
            }
          }
        }
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end