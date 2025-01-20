@interface MapsExternalState
+ (NSArray)allKeys;
- (BOOL)_isValue:(id)a3 equalTo:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)isEqualToState:(id)a3 changedKeys:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)hashForKey:(id)a3;
@end

@implementation MapsExternalState

+ (NSArray)allKeys
{
  return 0;
}

- (BOOL)_isValue:(id)a3 equalTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = +[NSCountedSet setWithArray:v5];
          v10 = +[NSCountedSet setWithArray:v7];
          unsigned __int8 v8 = [v9 isEqualToSet:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unsigned __int8 v11 = [(id)v5 isEqualToDictionary:v7];
          }
          else {
            unsigned __int8 v11 = [(id)v5 isEqual:v7];
          }
          unsigned __int8 v8 = v11;
        }
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)isEqualToState:(id)a3
{
  return [(MapsExternalState *)self isEqualToState:a3 changedKeys:0];
}

- (BOOL)isEqualToState:(id)a3 changedKeys:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v19 = a4;
    if (a4) {
      id v9 = objc_alloc_init((Class)NSMutableSet);
    }
    else {
      id v9 = 0;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = [(id)objc_opt_class() allKeys];
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v16 = [(MapsExternalState *)self valueForKey:v15];
          v17 = [v6 valueForKey:v15];
          if (![(MapsExternalState *)self _isValue:v16 equalTo:v17])
          {
            if (!v9)
            {

              BOOL v8 = 0;
              goto LABEL_22;
            }
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if (v19) {
      id *v19 = [v9 copy];
    }
    if (v9) {
      BOOL v8 = [v9 count] == 0;
    }
    else {
      BOOL v8 = 1;
    }
LABEL_22:
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(MapsExternalState *)self isEqualToState:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(id)objc_opt_class() allKeys];
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(MapsExternalState *)self valueForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = objc_opt_new();
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10002091C;
          v15[3] = &unk_100089AC8;
          id v16 = v11;
          id v12 = v11;
          [v10 enumerateKeysAndObjectsUsingBlock:v15];
          [v4 setValue:v12 forKey:v9];
        }
        else
        {
          [v4 setValue:v10 forKey:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)descriptionForKey:(id)a3
{
  v3 = [(MapsExternalState *)self valueForKey:a3];
  id v4 = [v3 description];
  id v5 = +[NSString stringWithFormat:@"%@", v4];

  return v5;
}

- (id)description
{
  v18.receiver = self;
  v18.super_class = (Class)MapsExternalState;
  v3 = [(MapsExternalState *)&v18 description];
  id v4 = objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1);
  id v5 = [v4 mutableCopy];

  objc_msgSend(v5, "appendFormat:", @" hash=%lu", -[MapsExternalState hash](self, "hash"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(id)objc_opt_class() allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [(MapsExternalState *)self descriptionForKey:v11];
        [v5 appendFormat:@"\n    %@ = %@", v11, v12, (void)v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  [v5 appendString:@">"];

  return v5;
}

- (unint64_t)hashForKey:(id)a3
{
  v3 = [(MapsExternalState *)self valueForKey:a3];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (unint64_t)hash
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(), "allKeys", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 ^= [(MapsExternalState *)self hashForKey:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

@end