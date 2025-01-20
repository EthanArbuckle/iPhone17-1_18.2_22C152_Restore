@interface NTKInfinityListingAttributes
+ (id)attributesWithDictionary:(id)a3;
- (BOOL)containsAttributes:(id)a3 ignoreKeys:(id)a4;
- (NSMutableDictionary)attributes;
- (id)colorForKey:(id)a3;
- (id)debugDescription;
- (id)description;
- (void)addAttribute:(id)a3 forKey:(id)a4;
- (void)setAttributes:(id)a3;
@end

@implementation NTKInfinityListingAttributes

+ (id)attributesWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NTKInfinityListingAttributes);
  id v5 = [v3 mutableCopy];

  [(NTKInfinityListingAttributes *)v4 setAttributes:v5];

  return v4;
}

- (id)colorForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_attributes objectForKey:a3];
}

- (void)addAttribute:(id)a3 forKey:(id)a4
{
}

- (BOOL)containsAttributes:(id)a3 ignoreKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v28 = @"setting";
  BOOL v8 = 1;
  v9 = +[NSArray arrayWithObjects:&v28 count:1];
  v10 = [v9 arrayByAddingObjectsFromArray:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = [v6 attributes];
  v12 = [v11 allKeys];

  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    id v22 = v7;
    uint64_t v15 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([v10 containsObject:v17] & 1) == 0)
        {
          v18 = [(NSMutableDictionary *)self->_attributes objectForKey:v17];
          v19 = [v6 attributes];
          v20 = [v19 objectForKey:v17];

          if (v18 != v20)
          {
            BOOL v8 = 0;
            goto LABEL_12;
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    BOOL v8 = 1;
LABEL_12:
    id v7 = v22;
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@", self->_attributes];
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:@"%@", self->_attributes];
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end