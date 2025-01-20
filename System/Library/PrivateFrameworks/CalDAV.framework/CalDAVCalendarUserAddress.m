@interface CalDAVCalendarUserAddress
+ (BOOL)compareAddressURL:(id)a3 localString:(id)a4;
+ (BOOL)compareAddressURL:(id)a3 localURL:(id)a4;
+ (id)_minPreferredAddress:(id)a3;
+ (id)_preferredAddressNoPreferred:(id)a3;
+ (id)packCalDAVUserAdress:(id)a3;
+ (id)preferredAddress:(id)a3;
+ (id)unpackCalDAVUserAdress:(id)a3;
+ (int64_t)defaultPreferredAttribute;
- (BOOL)isSameAsUserAddressURL:(id)a3;
- (CalDAVCalendarUserAddress)initWithAddress:(id)a3 preferred:(int64_t)a4;
- (NSURL)address;
- (int64_t)compare:(id)a3;
- (int64_t)preferred;
- (void)setAddress:(id)a3;
- (void)setPreferred:(int64_t)a3;
@end

@implementation CalDAVCalendarUserAddress

- (CalDAVCalendarUserAddress)initWithAddress:(id)a3 preferred:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalDAVCalendarUserAddress;
  v7 = [(CalDAVCalendarUserAddress *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CalDAVCalendarUserAddress *)v7 setAddress:v6];
    [(CalDAVCalendarUserAddress *)v8 setPreferred:a4];
  }

  return v8;
}

+ (int64_t)defaultPreferredAttribute
{
  return -1;
}

+ (id)packCalDAVUserAdress:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"packedCalendarUserAddressAddress";
  id v3 = a3;
  v4 = [v3 address];
  v5 = [v4 absoluteString];
  v11[1] = @"packedCalendarUserAddressPreferred";
  v12[0] = v5;
  id v6 = NSNumber;
  uint64_t v7 = [v3 preferred];

  v8 = [v6 numberWithInteger:v7];
  v12[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

+ (id)unpackCalDAVUserAdress:(id)a3
{
  id v3 = a3;
  v4 = [CalDAVCalendarUserAddress alloc];
  v5 = NSURL;
  id v6 = [v3 objectForKeyedSubscript:@"packedCalendarUserAddressAddress"];
  uint64_t v7 = [v5 URLWithString:v6];
  v8 = [v3 objectForKeyedSubscript:@"packedCalendarUserAddressPreferred"];

  v9 = -[CalDAVCalendarUserAddress initWithAddress:preferred:](v4, "initWithAddress:preferred:", v7, [v8 integerValue]);
  return v9;
}

+ (id)preferredAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [a1 _minPreferredAddress:v5];
    if (!v6)
    {
      id v6 = [a1 _preferredAddressNoPreferred:v5];
    }
    uint64_t v7 = [v6 address];
    v8 = [v7 absoluteString];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarUserAddress *)self address];
  id v6 = [v5 absoluteString];
  uint64_t v7 = [v4 address];

  v8 = [v7 absoluteString];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

+ (id)_minPreferredAddress:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        int64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 preferred];
        if (v10 != [(id)objc_opt_class() defaultPreferredAttribute])
        {
          if (v6)
          {
            uint64_t v11 = [v6 preferred];
            if (v11 > [v9 preferred])
            {
              id v12 = v9;

              id v6 = v12;
            }
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_preferredAddressNoPreferred:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  if ([v5 count] == 1)
  {
    id v6 = v5;
    goto LABEL_3;
  }
  v28 = v5;
  id v29 = v3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    v30 = 0;
    v31 = 0;
    id v12 = 0;
LABEL_24:

LABEL_25:
    if (v11)
    {
      id v7 = v11;

      goto LABEL_27;
    }
    if (v12)
    {
      id v7 = v12;

      v26 = v31;
    }
    else
    {
      if (!v31)
      {
        uint64_t v5 = v28;
        id v3 = v29;
        id v7 = v30;
        if (v30) {
          goto LABEL_34;
        }
        if (![v8 count])
        {
          id v7 = 0;
          goto LABEL_34;
        }
        id v6 = v8;
LABEL_3:
        id v7 = [v6 objectAtIndex:0];
        goto LABEL_34;
      }
      id v7 = v31;
      v26 = v30;
    }

    goto LABEL_33;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  v30 = 0;
  v31 = 0;
  id v12 = 0;
  uint64_t v13 = *(void *)v34;
  id obj = v8;
LABEL_6:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v34 != v13) {
      objc_enumerationMutation(obj);
    }
    long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
    long long v16 = [v15 address];
    long long v17 = [v16 absoluteString];
    v18 = [v17 lowercaseString];

    if ([v18 hasPrefix:@"https"])
    {
      uint64_t v19 = v12;
      v20 = v11;
      id v12 = v15;
LABEL_17:
      id v24 = v15;

      uint64_t v11 = v20;
      goto LABEL_18;
    }
    v21 = [v15 address];
    v22 = [v21 absoluteString];
    char v23 = [v22 hasPrefix:@"/"];

    if (v23)
    {
      uint64_t v19 = v31;
      v20 = v11;
      v31 = v15;
      goto LABEL_17;
    }
    if ([v18 hasPrefix:@"http"])
    {
      uint64_t v19 = v30;
      v20 = v11;
      v30 = v15;
      goto LABEL_17;
    }
    if ([v18 hasPrefix:@"mailto"]) {
      break;
    }
    uint64_t v19 = v11;
    v20 = v15;
    if ([v18 hasPrefix:@"tel"]) {
      goto LABEL_17;
    }
LABEL_18:

    if (v10 == ++v14)
    {
      id v8 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  id v25 = v15;

  id v8 = obj;
  if (!v25) {
    goto LABEL_25;
  }
  id v7 = v25;

LABEL_27:
LABEL_33:
  uint64_t v5 = v28;
  id v3 = v29;
LABEL_34:

  return v7;
}

- (BOOL)isSameAsUserAddressURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CalDAVCalendarUserAddress *)self address];
  LOBYTE(v5) = [v5 compareAddressURL:v4 localURL:v6];

  return (char)v5;
}

+ (BOOL)compareAddressURL:(id)a3 localString:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  id v6 = NSURL;
  id v7 = a3;
  id v8 = [v6 URLWithString:a4];
  LOBYTE(a1) = [a1 compareAddressURL:v7 localURL:v8];

  return (char)a1;
}

+ (BOOL)compareAddressURL:(id)a3 localURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 absoluteString];
  id v8 = [v7 removeSlashIfNeeded];
  uint64_t v9 = [v6 absoluteString];
  uint64_t v10 = [v9 removeSlashIfNeeded];
  uint64_t v11 = [v8 caseInsensitiveCompare:v10];

  if (v11)
  {
    id v12 = [v5 relativePath];
    uint64_t v13 = [v12 removeSlashIfNeeded];

    uint64_t v14 = [v6 relativePath];
    long long v15 = [v14 removeSlashIfNeeded];

    if (!v13 || v13 == v15 || [v13 caseInsensitiveCompare:v15])
    {
      long long v16 = [v6 path];
      long long v17 = [v5 path];
      int v18 = [v16 isEqualToString:v17];

      if (v18)
      {
        uint64_t v19 = [v6 port];
        uint64_t v20 = [v5 port];
        v21 = (void *)v20;
        if (v19)
        {
          if (v20 && ([v19 isEqualToNumber:v20] & 1) != 0)
          {
LABEL_9:
            v22 = [v6 host];
            char v23 = [v5 host];
            if (([v22 isEqualToString:v23] & 1) == 0)
            {
              unint64_t v24 = [v22 length];
              unint64_t v25 = [v23 length];
              if (v24 >= v25) {
                v26 = v23;
              }
              else {
                v26 = v22;
              }
              if (v24 >= v25) {
                v27 = v22;
              }
              else {
                v27 = v23;
              }
              id v28 = v26;
              id v29 = v27;
              if ([v28 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
              {
                int v32 = [v29 hasPrefix:v28];

                if (v32) {
                  goto LABEL_18;
                }
              }
              else
              {
              }
              BOOL v30 = 0;
              goto LABEL_26;
            }
LABEL_18:
            BOOL v30 = 1;
LABEL_26:

            goto LABEL_27;
          }
        }
        else if (!v20)
        {
          goto LABEL_9;
        }
        BOOL v30 = 0;
LABEL_27:

        goto LABEL_28;
      }
      BOOL v30 = 0;
    }
    else
    {
      BOOL v30 = 1;
    }
LABEL_28:

    goto LABEL_29;
  }
  BOOL v30 = 1;
LABEL_29:

  return v30;
}

- (NSURL)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (int64_t)preferred
{
  return self->_preferred;
}

- (void)setPreferred:(int64_t)a3
{
  self->_preferred = a3;
}

- (void).cxx_destruct
{
}

@end