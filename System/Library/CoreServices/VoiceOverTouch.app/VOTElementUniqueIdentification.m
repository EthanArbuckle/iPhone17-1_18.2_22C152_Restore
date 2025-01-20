@interface VOTElementUniqueIdentification
+ (id)identificationFromElement:(id)a3;
+ (id)identificationFromKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)hashKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setHashKey:(id)a3;
@end

@implementation VOTElementUniqueIdentification

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  v5 = [(VOTElementUniqueIdentification *)self hashKey];
  [v4 setHashKey:v5];

  return v4;
}

+ (id)identificationFromKey:(id)a3
{
  id v3 = a3;
  id v4 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  [v4 setHashKey:v3];

  return v4;
}

+ (id)identificationFromElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 uiElement];
  unsigned __int8 v5 = [v3 isApplication];
  v6 = [v3 bundleIdentifier];
  if ((v5 & 1) == 0)
  {
    v7 = [v4 stringWithAXAttribute:2001];
    v8 = [v7 stringByReplacingOccurrencesOfString:@"|" withString:&stru_1001B7888];

    v9 = [v4 stringWithAXAttribute:2031];
    [v4 rectWithAXAttribute:2003];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = [v4 numberWithAXAttribute:2004];
    [v14 unsignedLongLongValue];

    uint64_t v15 = _AXTraitsRemoveTrait();
    v16 = [v4 stringWithAXAttribute:2041];
    v17 = +[NSNumber numberWithUnsignedLongLong:v15];
    v26.width = v11;
    v26.height = v13;
    v18 = NSStringFromSize(v26);
    v19 = +[NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@", v6, v8, v17, v16, v18, v9];

    v20 = [v3 application];
    LODWORD(v17) = [v20 isSystemApp];

    if (v17)
    {
      v21 = [v3 bundleIdentifier];
      if ([v21 length])
      {
        uint64_t v22 = [v19 stringByAppendingFormat:@"|%@", v21];

        v19 = (void *)v22;
      }
    }
    v6 = v19;
  }
  id v23 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  [v23 setHashKey:v6];

  return v23;
}

- (unint64_t)hash
{
  v2 = [(VOTElementUniqueIdentification *)self hashKey];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)VOTElementUniqueIdentification;
  id v3 = [(VOTElementUniqueIdentification *)&v7 description];
  id v4 = [(VOTElementUniqueIdentification *)self hashKey];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@: %@", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [v4 hashKey];
    v6 = [(VOTElementUniqueIdentification *)self hashKey];
    if ([v6 isEqualToString:v5])
    {
      unsigned __int8 v7 = 1;
    }
    else if ([v6 rangeOfString:@"com.apple.springboard"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v7 = 0;
    }
    else
    {
      v8 = [v6 componentsSeparatedByString:@"|"];
      v9 = [v5 componentsSeparatedByString:@"|"];
      if ((unint64_t)[v9 count] >= 2
        && (unint64_t)[v8 count] >= 2
        && ([v8 objectAtIndex:1],
            double v10 = objc_claimAutoreleasedReturnValue(),
            [v9 objectAtIndex:1],
            CGFloat v11 = objc_claimAutoreleasedReturnValue(),
            unsigned int v12 = [v10 isEqualToString:v11],
            v11,
            v10,
            v12))
      {
        if ([v9 count] == (id)7 && objc_msgSend(v8, "count") == (id)7)
        {
          CGFloat v13 = [v8 objectAtIndex:6];
          v14 = [v9 objectAtIndex:6];
          unsigned __int8 v7 = [v13 isEqualToString:v14];
        }
        else
        {
          id v16 = [v9 count];
          unsigned __int8 v7 = v16 != [v8 count];
        }
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)hashKey
{
  return self->hashKey;
}

- (void)setHashKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end