@interface _MPUStackItemReuseCache
+ (id)dequeueReusableStackItemWithIdentifier:(id)a3;
+ (void)enqueueReusableStackItem:(id)a3 forReuseIdentifier:(id)a4;
+ (void)registerStackViewForReuseIdentifier:(id)a3;
+ (void)unregisterStackViewForReuseIdentifier:(id)a3;
@end

@implementation _MPUStackItemReuseCache

+ (id)dequeueReusableStackItemWithIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [(id)__reuseIdentifierToReusableStackItems objectForKey:v3];
    if ([v4 count])
    {
      v5 = [v4 objectAtIndex:0];
      [v4 removeObjectAtIndex:0];
      if (![v4 count])
      {
        [(id)__reuseIdentifierToReusableStackItems removeObjectForKey:v3];
        if (![(id)__reuseIdentifierToReusableStackItems count])
        {
          v6 = (void *)__reuseIdentifierToReusableStackItems;
          __reuseIdentifierToReusableStackItems = 0;
        }
      }
      [v5 setHidden:0];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)enqueueReusableStackItem:(id)a3 forReuseIdentifier:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (v12)
  {
    if (v5)
    {
      v6 = [(id)__reuseIdentifierToRegisteredCount objectForKey:v5];
      uint64_t v7 = [v6 integerValue];

      if (v7)
      {
        [v12 prepareForReuse];
        [v12 setHidden:1];
        v8 = (void *)__reuseIdentifierToReusableStackItems;
        if (!__reuseIdentifierToReusableStackItems)
        {
          uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
          v10 = (void *)__reuseIdentifierToReusableStackItems;
          __reuseIdentifierToReusableStackItems = v9;

          v8 = (void *)__reuseIdentifierToReusableStackItems;
        }
        v11 = [v8 objectForKey:v5];
        if (!v11)
        {
          v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
          [(id)__reuseIdentifierToReusableStackItems setObject:v11 forKey:v5];
        }
        if ((unint64_t)[v11 count] <= 2) {
          [v11 addObject:v12];
        }
      }
    }
  }
}

+ (void)registerStackViewForReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)__reuseIdentifierToRegisteredCount;
    id v12 = v4;
    if (!__reuseIdentifierToRegisteredCount)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
      uint64_t v7 = (void *)__reuseIdentifierToRegisteredCount;
      __reuseIdentifierToRegisteredCount = v6;

      id v5 = (void *)__reuseIdentifierToRegisteredCount;
    }
    v8 = [v5 objectForKey:v12];
    uint64_t v9 = [v8 integerValue];

    v10 = (void *)__reuseIdentifierToRegisteredCount;
    v11 = [NSNumber numberWithInteger:v9 + 1];
    [v10 setObject:v11 forKey:v12];

    id v4 = v12;
  }

  MEMORY[0x270F9A758](v3, v4);
}

+ (void)unregisterStackViewForReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    id v5 = [(id)__reuseIdentifierToRegisteredCount objectForKey:v3];
    uint64_t v6 = [v5 integerValue];

    id v4 = v8;
    if (v6 == 1)
    {
      [(id)__reuseIdentifierToRegisteredCount removeObjectForKey:v8];
      if (![(id)__reuseIdentifierToRegisteredCount count])
      {
        uint64_t v7 = (void *)__reuseIdentifierToRegisteredCount;
        __reuseIdentifierToRegisteredCount = 0;
      }
      id v3 = (id)[(id)__reuseIdentifierToReusableStackItems removeObjectForKey:v8];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](v3, v4);
}

@end