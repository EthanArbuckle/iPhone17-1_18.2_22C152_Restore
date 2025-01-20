@interface SALocalSearchMapItemSnippet
- (BOOL)usesFixedLocation;
- (NSURL)urlForMapItems;
- (SALocalSearchMapItem)selectedMapItem;
- (id)urlForMapItemsWithLaunchOptions:(id)a3;
- (unint64_t)selectedItemIndex;
- (void)setSelectedItemIndex:(unint64_t)a3;
@end

@implementation SALocalSearchMapItemSnippet

- (BOOL)usesFixedLocation
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SALocalSearchMapItemSnippet *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) distance];

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (unint64_t)selectedItemIndex
{
  v2 = objc_getAssociatedObject(self, "selectedItemIndex");
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)setSelectedItemIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  id v5 = v4;
  objc_setAssociatedObject(self, "selectedItemIndex", v4, (char *)&dword_0 + 3);
}

- (SALocalSearchMapItem)selectedMapItem
{
  unint64_t v3 = [(SALocalSearchMapItemSnippet *)self selectedItemIndex];
  unint64_t v4 = [(SALocalSearchMapItemSnippet *)self items];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(SALocalSearchMapItemSnippet *)self items];
    v7 = [v6 objectAtIndexedSubscript:v3];
  }

  return (SALocalSearchMapItem *)v7;
}

- (NSURL)urlForMapItems
{
  return (NSURL *)[(SALocalSearchMapItemSnippet *)self urlForMapItemsWithLaunchOptions:0];
}

- (id)urlForMapItemsWithLaunchOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SALocalSearchMapItemSnippet *)self items];
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  if (v4)
  {
    uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:v4];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  long long v8 = (void *)v7;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v9 = [(SALocalSearchMapItemSnippet *)self items];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[MKMapItem mapItemWithLocalSearchMapItem:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v14) {
          [v6 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  unint64_t v15 = [(SALocalSearchMapItemSnippet *)self selectedItemIndex];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = +[NSNumber numberWithUnsignedInteger:v15];
    [v8 setObject:v16 forKeyedSubscript:MKLaunchOptionsSelectedIndexKey];
  }
  if (([(SALocalSearchMapItemSnippet *)self searchAlongRoute] & 1) != 0
    || (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
  {
    uint64_t IsEnabled_Maps182 = 1;
  }
  else
  {
    uint64_t IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
  }
  v18 = +[NSNumber numberWithBool:IsEnabled_Maps182];
  [v8 setObject:v18 forKeyedSubscript:_MKLaunchOptionsSearchAlongRouteKey];

  v19 = +[MKMapItem urlForMapItems:v6 options:v8];

  return v19;
}

@end