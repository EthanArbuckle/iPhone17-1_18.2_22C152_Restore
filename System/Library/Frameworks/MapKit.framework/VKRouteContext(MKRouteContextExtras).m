@interface VKRouteContext(MKRouteContextExtras)
- (id)_routeInfoForRoute:()MKRouteContextExtras;
@end

@implementation VKRouteContext(MKRouteContextExtras)

- (id)_routeInfoForRoute:()MKRouteContextExtras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 routeInfo];
  id v6 = [v5 route];

  if (v6 == v4)
  {
    id v8 = [a1 routeInfo];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = objc_msgSend(a1, "alternateRoutes", 0);
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [v11 route];
          BOOL v13 = v12 == v4;

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }

  return v8;
}

@end