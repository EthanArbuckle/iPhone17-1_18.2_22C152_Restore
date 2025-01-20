@interface NSArray(HMFoundation)
+ (NSString)shortDescription;
- (BOOL)hmf_isEmpty;
- (id)hmf_objectWithOptions:()HMFoundation passingTest:;
- (id)hmf_objectsWithOptions:()HMFoundation passingTest:;
- (id)privateDescription;
- (id)shortDescription;
- (uint64_t)hmf_objectPassingTest:()HMFoundation;
- (uint64_t)hmf_objectsAreKindOfClass:()HMFoundation;
- (uint64_t)hmf_objectsPassingTest:()HMFoundation;
- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation;
@end

@implementation NSArray(HMFoundation)

- (id)privateDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = 0;
        }
        id v10 = v9;

        if (v10) {
          [v8 privateDescription];
        }
        else {
        v11 = objc_msgSend(v8, "description", (void)v14);
        }

        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v12 = [v2 description];

  return v12;
}

- (BOOL)hmf_isEmpty
{
  return [a1 count] == 0;
}

- (uint64_t)hmf_objectPassingTest:()HMFoundation
{
  return objc_msgSend(a1, "hmf_objectWithOptions:passingTest:", 0, a3);
}

- (id)shortDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = 0;
        }
        id v10 = v9;

        if (v10) {
          [v8 shortDescription];
        }
        else {
        v11 = objc_msgSend(v8, "description", (void)v14);
        }

        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v12 = [v2 description];

  return v12;
}

- (id)hmf_objectWithOptions:()HMFoundation passingTest:
{
  id v6 = a4;
  if (v6 && (uint64_t v7 = [a1 indexOfObjectWithOptions:a3 passingTest:v6], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v8 = [a1 objectAtIndex:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__NSArray_HMFoundation__hmf_enumerateWithAutoreleasePoolUsingBlock___block_invoke;
  v6[3] = &unk_1E5958980;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)hmf_objectsAreKindOfClass:()HMFoundation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

- (uint64_t)hmf_objectsPassingTest:()HMFoundation
{
  return objc_msgSend(a1, "hmf_objectsWithOptions:passingTest:", 0, a3);
}

- (id)hmf_objectsWithOptions:()HMFoundation passingTest:
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [a1 indexesOfObjectsWithOptions:a3 passingTest:v6];
    if ([v7 count])
    {
      long long v8 = [a1 objectsAtIndexes:v7];
    }
    else
    {
      long long v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    long long v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

@end