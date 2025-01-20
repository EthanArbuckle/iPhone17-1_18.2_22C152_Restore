@interface NSArray(MediaSetup)
- (id)ms_objectsWithOptions:()MediaSetup passingTest:;
- (uint64_t)ms_anyPassingTest:()MediaSetup;
- (uint64_t)ms_objectsPassingTest:()MediaSetup;
@end

@implementation NSArray(MediaSetup)

- (uint64_t)ms_objectsPassingTest:()MediaSetup
{
  return objc_msgSend(a1, "ms_objectsWithOptions:passingTest:", 0, a3);
}

- (id)ms_objectsWithOptions:()MediaSetup passingTest:
{
  id v6 = a4;
  if (v6)
  {
    v7 = [a1 indexesOfObjectsWithOptions:a3 passingTest:v6];
    if ([v7 count])
    {
      v8 = [a1 objectsAtIndexes:v7];
    }
    else
    {
      v8 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (uint64_t)ms_anyPassingTest:()MediaSetup
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end