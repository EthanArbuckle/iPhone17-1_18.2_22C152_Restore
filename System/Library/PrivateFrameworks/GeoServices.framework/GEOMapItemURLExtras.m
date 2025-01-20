@interface GEOMapItemURLExtras
+ (id)_mapItemsFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)_mapItemsFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)_mapItemsFromPresentAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)_mapItemsFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)mapItemsFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)mapItemsFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)urlToPresentAction:(id)a3 present:(id)a4;
+ (id)urlToPresentDirectionsForItems:(id)a3 options:(id)a4;
+ (id)urlToPresentDirectionsFromCurrentLocationToMapItem:(id)a3 withOptions:(id)a4;
@end

@implementation GEOMapItemURLExtras

+ (id)urlToPresentAction:(id)a3 present:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v6 data];

  v10 = [v9 base64EncodedStringWithOptions:0];
  [v8 setObject:v10 forKey:@"present"];

  v11 = objc_alloc_init(GEORisonParser);
  v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = NSString;
  v14 = [(GEORisonParser *)v11 stringFromRisonObject:v8];
  v15 = [v13 stringWithFormat:@"%@:%@?%@", @"map", v7, v14];

  v16 = [v12 URLWithString:v15];

  return v16;
}

+ (id)urlToPresentDirectionsForItems:(id)a3 options:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [[GEOURLPresent alloc] initWithDirectionsOptions:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOURLPresent addItem:]((uint64_t)v7, *(void **)(*((void *)&v15 + 1) + 8 * i));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = +[GEOMapItemURLExtras urlToPresentAction:@"directions", v7, (void)v15 present];

  return v13;
}

+ (id)urlToPresentDirectionsFromCurrentLocationToMapItem:(id)a3 withOptions:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(GEOURLItem);
  id v8 = v7;
  if (v7)
  {
    *(unsigned char *)&v7->_flags |= 8u;
    *(unsigned char *)&v7->_flags |= 1u;
    v7->_currentLocation = 1;
  }
  uint64_t v9 = objc_alloc_init(GEOURLItem);
  [(GEOURLItem *)v9 setMapItem:v6];

  v13[0] = v8;
  v13[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v11 = +[GEOMapItemURLExtras urlToPresentDirectionsForItems:v10 options:v5];

  return v11;
}

+ (id)_mapItemsFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v12 = 0;
  id v8 = [a1 _mapItemsFromPresentAction:a3 currentLocationIndices:&v12 options:a6];
  id v9 = v12;
  uint64_t v10 = v9;
  if (a5) {
    *a5 = [v9 lastIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)_mapItemsFromPresentAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v7 = a3;
  if (a4)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    *a4 = v8;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:1];
  uint64_t v10 = [[GEOURLPresent alloc] initWithData:v9];
  p_isa = (id *)&v10->super.super.isa;
  if (a5)
  {
    -[GEOURLPresent options]((id *)&v10->super.super.isa);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = -[GEOURLPresent items](p_isa);
  uint64_t v13 = [v12 count];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
  if (v13)
  {
    uint64_t v15 = 0;
    while (1)
    {
      long long v16 = -[GEOURLPresent items](p_isa);
      uint64_t v17 = [v16 objectAtIndex:v15];

      if (!v17) {
        break;
      }
      if (*(unsigned char *)(v17 + 44)) {
        goto LABEL_12;
      }
      -[GEOURLItem _readMapItemStorage](v17);
      if (!*(void *)(v17 + 16)) {
        break;
      }
      long long v18 = [(id)v17 mapItem];
      [v14 addObject:v18];

      if (*(unsigned char *)(v17 + 44)) {
LABEL_12:
      }
        [v8 addIndex:v15];

      if (v13 == ++v15) {
        goto LABEL_14;
      }
    }

    id v19 = 0;
  }
  else
  {
LABEL_14:
    id v19 = v14;
  }

  return v19;
}

+ (id)_mapItemsFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v12 = 0;
  id v8 = [a1 _mapItemsFromDirectionsAction:a3 currentLocationIndices:&v12 options:a6];
  id v9 = v12;
  uint64_t v10 = v9;
  if (a5) {
    *a5 = [v9 lastIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)_mapItemsFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  id v7 = [a3 objectForKey:@"present"];
  if (v7)
  {
    id v8 = +[GEOMapItemURLExtras _mapItemsFromPresentAction:v7 currentLocationIndices:a4 options:a5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)mapItemsFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v12 = 0;
  id v8 = [a1 mapItemsFromURL:a3 currentLocationIndices:&v12 options:a6];
  id v9 = v12;
  uint64_t v10 = v9;
  if (a5) {
    *a5 = [v9 lastIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)mapItemsFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 scheme];
  int v9 = [v8 isEqualToString:@"map"];

  if (v9)
  {
    uint64_t v10 = [v7 resourceSpecifier];
    if ([v10 hasPrefix:@"//"])
    {
      uint64_t v11 = [v10 substringFromIndex:2];

      uint64_t v10 = (void *)v11;
    }
    uint64_t v12 = [v10 rangeOfString:@"?"];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v14 = v12;
      uint64_t v15 = [v10 substringToIndex:v12];
      if ([v15 isEqualToString:@"directions"])
      {
        long long v16 = [v10 substringFromIndex:v14 + 1];
        uint64_t v17 = objc_alloc_init(GEORisonParser);
        long long v18 = [(GEORisonParser *)v17 objectFromRisonString:v16];
        if ([v15 isEqualToString:@"directions"])
        {
          uint64_t v13 = +[GEOMapItemURLExtras _mapItemsFromDirectionsAction:v18 currentLocationIndices:a4 options:a5];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end