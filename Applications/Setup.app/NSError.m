@interface NSError
- (id)buddy_popFrom:(id)a3;
- (void)buddy_enumerateErrorTreeWithHandler:(id)a3;
@end

@implementation NSError

- (void)buddy_enumerateErrorTreeWithHandler:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)objc_opt_new();
  id v9 = +[NSMutableArray arrayWithObject:v12];
  char v8 = 0;
  id v7 = 0;
  while (1)
  {
    id v3 = [(NSError *)v12 buddy_popFrom:v9];
    id v4 = v7;
    id v7 = v3;

    if (!v3) {
      break;
    }
    if (([v10 containsObject:v7] & 1) == 0)
    {
      [v10 addObject:v7];
      (*((void (**)(id, id, char *))location[0] + 2))(location[0], v7, &v8);
      if (v8) {
        break;
      }
      id v5 = v9;
      id v6 = [v7 underlyingErrors];
      [v5 addObjectsFromArray:v6];
    }
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)buddy_popFrom:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [location[0] lastObject];
  [location[0] removeLastObject];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

@end