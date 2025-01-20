@interface HMDMatterCommandActionUtilities
+ (id)commandsInMemoryRepresentation:(id)a3;
+ (id)commandsInStoreRepresentation:(id)a3;
@end

@implementation HMDMatterCommandActionUtilities

+ (id)commandsInMemoryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = HMCommandExpectedValuesKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 mutableCopy];
        v12 = [v11 objectForKey:v8];
        id v13 = [v12 mutableCopy];

        if (v13)
        {
          id v14 = [v13 mutableCopy];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100005198;
          v21[3] = &unk_10002C7A0;
          id v22 = v14;
          id v15 = v14;
          objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
          id v16 = [v15 copy];
          [v11 setObject:v16 forKey:v8];

          id v17 = [v11 copy];
          [v4 addObject:v17];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  id v18 = [v4 copy];

  return v18;
}

+ (id)commandsInStoreRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = HMCommandExpectedValuesKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 mutableCopy];
        v12 = [v11 objectForKey:v8];
        id v13 = [v12 mutableCopy];

        if (v13)
        {
          id v14 = [v13 mutableCopy];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100005690;
          v21[3] = &unk_10002C7A0;
          id v22 = v14;
          id v15 = v14;
          [v15 enumerateObjectsUsingBlock:v21];
          id v16 = [v15 copy];
          [v11 setObject:v16 forKey:v8];

          id v17 = [v11 copy];
          [v4 addObject:v17];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  id v18 = [v4 copy];

  return v18;
}

@end