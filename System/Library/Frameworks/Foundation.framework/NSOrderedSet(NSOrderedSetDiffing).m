@interface NSOrderedSet(NSOrderedSetDiffing)
- (NSOrderedCollectionDifference)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:;
- (id)orderedSetByApplyingDifference:()NSOrderedSetDiffing;
- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing;
- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:usingEquivalenceTest:;
@end

@implementation NSOrderedSet(NSOrderedSetDiffing)

- (NSOrderedCollectionDifference)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot diff nil parameter" userInfo:0]);
  }
  v5 = a3;
  v6 = a1;
  v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = [a1 count];
  uint64_t v9 = [v5 count];
  unint64_t v10 = v8 - v9;
  if (v8 - v9 < 0) {
    unint64_t v10 = v9 - v8;
  }
  if (v10 >= 0x10)
  {
    uint64_t v12 = [v6 count];
    uint64_t v13 = [v5 count];
    if (v12 - v13 >= 0) {
      uint64_t v11 = v12 - v13;
    }
    else {
      uint64_t v11 = v13 - v12;
    }
  }
  else
  {
    uint64_t v11 = 16;
  }
  v14 = (void *)[v7 arrayWithCapacity:v11];
  if (![v5 count])
  {
    unint64_t v19 = 0;
    unint64_t v18 = 0;
    goto LABEL_74;
  }
  uint64_t v60 = 0;
  char v61 = a4;
  uint64_t v15 = 0;
  unint64_t v53 = 0;
  unint64_t v54 = 0;
  v16 = 0;
  v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  v62 = v14;
  v63 = v5;
  v64 = v6;
  while (2)
  {
    uint64_t v22 = -v20;
    uint64_t v23 = -v21;
    unint64_t v24 = v18;
    unint64_t v25 = v19;
    v26 = v17;
    uint64_t v55 = v23;
    uint64_t v56 = v22;
    while (2)
    {
      uint64_t v58 = v15;
      uint64_t v27 = 0;
      unint64_t v28 = v22 + v24;
      unint64_t v29 = v23 + v25;
      while (1)
      {
        v17 = v26;
        unint64_t v18 = v24 + v27;
        unint64_t v19 = v25 + v27;
        if (v24 + v27 >= objc_msgSend(v64, "count", v53)) {
          goto LABEL_73;
        }
        uint64_t v30 = v29 + v27;
        if (v29 + v27) {
          v17 = (void *)[v63 objectAtIndexedSubscript:v25 + v27];
        }
        uint64_t v31 = v28 + v27;
        if (v28 + v27) {
          v16 = (void *)[v64 objectAtIndexedSubscript:v24 + v27];
        }
        v26 = v17;
        if (v17 != v16) {
          break;
        }
        ++v27;
        unint64_t v19 = v25 + v27;
        v16 = v17;
        if (v25 + v27 >= [v63 count])
        {
          unint64_t v18 = v24 + v27;
LABEL_73:
          v14 = v62;
          v5 = v63;
          v6 = v64;
          a4 = v61;
          goto LABEL_74;
        }
      }
      uint64_t v15 = v58;
      if (v30) {
        uint64_t v15 = [v17 hash];
      }
      uint64_t v32 = v60;
      if (v31) {
        uint64_t v32 = [v16 hash];
      }
      if (v15 == v32)
      {
        if ([v17 isEqual:v16])
        {
          v25 += v27 + 1;
          v24 += v27 + 1;
          unint64_t v33 = [v63 count];
          uint64_t v60 = v15;
          uint64_t v23 = v55;
          uint64_t v22 = v56;
          if (v25 < v33) {
            continue;
          }
          unint64_t v19 = v25;
          unint64_t v18 = v24;
          goto LABEL_73;
        }
        uint64_t v32 = v15;
      }
      break;
    }
    uint64_t v60 = v32;
    if (v30) {
      unint64_t v53 = [v64 indexOfObject:v17];
    }
    unint64_t v34 = v54;
    if (v31) {
      unint64_t v34 = [v63 indexOfObject:v16];
    }
    unint64_t v54 = v34;
    unint64_t v57 = v25 + v27;
    unint64_t v59 = v24 + v27;
    if (v53 == 0x7FFFFFFFFFFFFFFFLL || v53 < v24 + v27)
    {
      if ((v61 & 2) != 0) {
        v38 = 0;
      }
      else {
        v38 = v17;
      }
      if ((v61 & 4) != 0) {
        uint64_t v39 = v53;
      }
      else {
        uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend(v62, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v38, 1, v25 + v27, v39, v53));
      unint64_t v34 = v54;
      unint64_t v19 = v25 + v27 + 1;
      if (v54 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v35 = v24;
        v5 = v63;
      }
      else
      {
        unint64_t v18 = v24 + v27;
        unint64_t v35 = v24;
        v5 = v63;
        if (v54 > v25 + v27) {
          goto LABEL_70;
        }
      }
    }
    else
    {
      unint64_t v35 = v24;
      unint64_t v19 = v25 + v27;
      v5 = v63;
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v19 = v25 + v27;
        if (v34 >= v57)
        {
          if (v53 - v35 - v27 >= v34 - v25 - v27)
          {
            if ((v61 & 2) != 0) {
              v40 = 0;
            }
            else {
              v40 = v17;
            }
            if ((v61 & 4) != 0) {
              uint64_t v41 = v53;
            }
            else {
              uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
            }
            objc_msgSend(v62, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v40, 1, v57, v41, v53));
            unint64_t v19 = v25 + v27 + 1;
            unint64_t v18 = v59;
          }
          else
          {
            if (v61) {
              v36 = 0;
            }
            else {
              v36 = v16;
            }
            if ((v61 & 4) != 0) {
              uint64_t v37 = v34;
            }
            else {
              uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
            }
            objc_msgSend(v62, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v36, 0, v59, v37, v53));
            unint64_t v18 = v35 + v27 + 1;
            unint64_t v19 = v25 + v27;
          }
          goto LABEL_70;
        }
      }
    }
    if (v61) {
      v42 = 0;
    }
    else {
      v42 = v16;
    }
    if ((v61 & 4) != 0) {
      uint64_t v43 = v34;
    }
    else {
      uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v62, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v42, 0, v59, v43, v53));
    unint64_t v18 = v35 + v27 + 1;
LABEL_70:
    unint64_t v44 = [v5 count];
    a4 = v61;
    v14 = v62;
    v6 = v64;
    uint64_t v21 = v57;
    uint64_t v20 = v59;
    if (v19 < v44) {
      continue;
    }
    break;
  }
LABEL_74:
  while (v19 < [v5 count])
  {
    uint64_t v45 = [v5 objectAtIndexedSubscript:v19];
    if ((a4 & 4) != 0) {
      uint64_t v46 = [v6 indexOfObject:v45];
    }
    else {
      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((a4 & 2) != 0) {
      uint64_t v47 = 0;
    }
    else {
      uint64_t v47 = v45;
    }
    objc_msgSend(v14, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v47, 1, v19++, v46));
  }
  for (; v18 < [v6 count]; ++v18)
  {
    uint64_t v48 = [v6 objectAtIndexedSubscript:v18];
    if ((a4 & 4) != 0) {
      uint64_t v49 = [v5 indexOfObject:v48];
    }
    else {
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (a4) {
      uint64_t v50 = 0;
    }
    else {
      uint64_t v50 = v48;
    }
    objc_msgSend(v14, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v50, 0, v18, v49));
  }
  v51 = [[NSOrderedCollectionDifference alloc] initWithChanges:v14];

  return v51;
}

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing
{
  return [a1 differenceFromOrderedSet:a3 withOptions:0];
}

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:usingEquivalenceTest:
{
  if (a5)
  {
    uint64_t v8 = (void *)[a1 array];
    uint64_t v9 = [a3 array];
    return [v8 differenceFromArray:v9 withOptions:a4 usingEquivalenceTest:a5];
  }
  else
  {
    return objc_msgSend(a1, "differenceFromOrderedSet:withOptions:");
  }
}

- (id)orderedSetByApplyingDifference:()NSOrderedSetDiffing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (id)[a1 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 changeType];
        unint64_t v11 = [v9 index];
        unint64_t v12 = [v4 count];
        if (v10 == 1)
        {
          if (v11 >= v12) {
            return 0;
          }
          objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v9, "index"));
        }
        else
        {
          if (v11 > v12) {
            return 0;
          }
          id result = (id)[v9 object];
          if (!result) {
            return result;
          }
          objc_msgSend(v4, "insertObject:atIndex:", objc_msgSend(v9, "object"), objc_msgSend(v9, "index"));
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (id)[v4 copy];
}

@end