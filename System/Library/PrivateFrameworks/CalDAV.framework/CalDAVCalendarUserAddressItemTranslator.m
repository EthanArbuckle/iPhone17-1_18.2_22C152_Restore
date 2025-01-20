@interface CalDAVCalendarUserAddressItemTranslator
+ (id)_preferredAttributeForItem:(id)a3;
+ (id)calDAVUserAddressForItem:(id)a3;
+ (id)calDAVUserAddressForItem:(id)a3 prependMailTo:(BOOL)a4;
+ (id)userAddressesForAddressSetItem:(id)a3;
@end

@implementation CalDAVCalendarUserAddressItemTranslator

+ (id)userAddressesForAddressSetItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v3, "hrefs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(id)objc_opt_class() calDAVUserAddressForItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)calDAVUserAddressForItem:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() calDAVUserAddressForItem:v3 prependMailTo:0];

  return v4;
}

+ (id)calDAVUserAddressForItem:(id)a3 prependMailTo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [a1 _preferredAttributeForItem:v6];
  uint64_t v8 = [v6 payloadAsString];

  if (v8)
  {
    if (v4 && ([v8 hasPrefix:@"mailto"] & 1) == 0)
    {
      uint64_t v9 = [@"mailto:" stringByAppendingString:v8];

      uint64_t v8 = (void *)v9;
    }
    int64_t v10 = +[CalDAVCalendarUserAddress defaultPreferredAttribute];
    if (v7) {
      int64_t v11 = (int)[v7 intValue];
    }
    else {
      int64_t v11 = v10;
    }
    long long v13 = [NSURL URLWithString:v8];
    if (v13) {
      long long v12 = [[CalDAVCalendarUserAddress alloc] initWithAddress:v13 preferred:v11];
    }
    else {
      long long v12 = 0;
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

+ (id)_preferredAttributeForItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [a3 attributes];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          int64_t v10 = objc_msgSend(v9, "name", (void)v14);
          char v11 = [v10 isEqualToString:@"preferred"];

          if (v11)
          {
            long long v12 = [v9 value];
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    long long v12 = 0;
LABEL_12:
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

@end