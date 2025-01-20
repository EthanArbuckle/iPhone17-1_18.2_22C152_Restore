@interface NSCompoundPredicate(ABPredicateQueryCreation)
- (id)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:;
- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation;
- (uint64_t)ab_bindJoinClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:;
- (uint64_t)ab_bindSelectClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:;
- (uint64_t)ab_bindWhereClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:;
- (uint64_t)ab_hasCallback;
@end

@implementation NSCompoundPredicate(ABPredicateQueryCreation)

- (uint64_t)ab_hasCallback
{
  v1 = (void *)[a1 subpredicates];
  uint64_t v2 = [v1 count];
  if (v2 < 1) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = 1;
  do
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", v4 - 1), "hasCallback");
    if (v4 >= v3) {
      break;
    }
    ++v4;
  }
  while (!result);
  return result;
}

- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a1 subpredicates];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "ab_addCallbackContextToArray:", a3);
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindSelectClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  LODWORD(v5) = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a1 subpredicates];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v5 = v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "ab_bindSelectClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
      uint64_t v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindJoinClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  LODWORD(v5) = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a1 subpredicates];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v5 = v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "ab_bindJoinClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
      uint64_t v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindWhereClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  LODWORD(v5) = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a1 subpredicates];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v5 = v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "ab_bindWhereClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
      uint64_t v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (id)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:
{
  return +[ABPredicate newQueryFromCompoundPredicate:a1 withSortOrder:a3 ranked:a4 addressBook:a5 propertyIndices:a6];
}

@end