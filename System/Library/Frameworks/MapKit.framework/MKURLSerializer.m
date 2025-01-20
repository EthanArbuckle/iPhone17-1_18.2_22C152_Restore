@interface MKURLSerializer
+ (id)stringForDirectionsType:(unint64_t)a3;
+ (id)stringForMapType:(unint64_t)a3;
- (id)mapItemsFromUrl:(id)a3 options:(id *)a4;
- (id)urlForDirectionsFromMapItem:(id)a3 toMapItem:(id)a4 transportType:(unint64_t)a5 options:(id)a6;
- (id)urlForDirectionsWithMapItems:(id)a3 transportType:(unint64_t)a4 options:(id)a5;
- (id)urlForOpeningMapItems:(id)a3 options:(id)a4;
@end

@implementation MKURLSerializer

- (id)urlForOpeningMapItems:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (v7)
  {
    uint64_t v10 = 0;
    char v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v13 = [v5 objectAtIndexedSubscript:v10];
      if (([v9 containsObject:v13] & 1) == 0)
      {
        [v9 addObject:v13];
        if (v11 & 1 | (([v13 isCurrentLocation] & 1) == 0))
        {
          v14 = [v13 place];

          if (v14)
          {
            v15 = [v13 place];
            [v8 addObject:v15];
          }
        }
        else
        {
          char v11 = 1;
          uint64_t v12 = v10;
        }
      }

      ++v10;
    }
    while (v7 != v10);
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = 0;
    char v11 = 0;
    if (v6)
    {
LABEL_10:
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F64B68]) initWithLaunchOptions:v6];
      goto LABEL_13;
    }
  }
  v16 = 0;
LABEL_13:
  if (v11) {
    [MEMORY[0x1E4F64828] _urlToShowCurrentLocationAndPlaces:v8 currentLocationIndex:v12 options:v16];
  }
  else {
  v17 = [MEMORY[0x1E4F64828] _urlToShowPlaces:v8 options:v16];
  }

  return v17;
}

- (id)urlForDirectionsFromMapItem:(id)a3 toMapItem:(id)a4 transportType:(unint64_t)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a6;
  v14 = (void *)[[v12 alloc] initWithCapacity:2];
  v15 = v14;
  if (v10) {
    [v14 addObject:v10];
  }
  if (v11) {
    [v15 addObject:v11];
  }
  v16 = (void *)[v15 copy];
  v17 = [(MKURLSerializer *)self urlForDirectionsWithMapItems:v16 transportType:a5 options:v13];

  return v17;
}

- (id)urlForDirectionsWithMapItems:(id)a3 transportType:(unint64_t)a4 options:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ((unint64_t)[v7 count] < 2)
  {
    v9 = 0;
    goto LABEL_30;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__MKURLSerializer_urlForDirectionsWithMapItems_transportType_options___block_invoke;
  v27[3] = &unk_1E54BEA18;
  id v10 = v7;
  id v28 = v10;
  v29 = &v30;
  [v10 enumerateObjectsUsingBlock:v27];
  if (!*((unsigned char *)v31 + 24))
  {
    if (v8) {
      id v11 = (id)[objc_alloc(MEMORY[0x1E4F64B68]) initWithLaunchOptions:v8];
    }
    else {
      id v11 = 0;
    }
    if (a4 - 1 > 7)
    {
      uint64_t v12 = 4;
      if (!v11) {
LABEL_12:
      }
        id v11 = objc_alloc_init(MEMORY[0x1E4F64B68]);
    }
    else
    {
      uint64_t v12 = dword_18BD1BE90[a4 - 1];
      if (!v11) {
        goto LABEL_12;
      }
    }
    if (([v11 hasTransportType] & 1) == 0) {
      [v11 setTransportType:v12];
    }
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v22 = v11;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v18 isCurrentLocation])
          {
            v19 = [MEMORY[0x1E4F64828] _urlRepresentationForCurrentLocation];
            [v13 addObject:v19];
          }
          else
          {
            v20 = [v18 place];

            if (!v20)
            {

              v9 = 0;
              goto LABEL_28;
            }
            v19 = [v18 place];
            [v13 addObject:v19];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v9 = [MEMORY[0x1E4F64828] _urlForDirectionsWithWaypoints:v13 options:v22];
LABEL_28:

    goto LABEL_29;
  }
  v9 = 0;
LABEL_29:

  _Block_object_dispose(&v30, 8);
LABEL_30:

  return v9;
}

void __70__MKURLSerializer_urlForDirectionsWithMapItems_transportType_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = a3 - 1;
    id v8 = a2;
    id v9 = [v6 objectAtIndexedSubscript:v7];
    LODWORD(v6) = objc_msgSend(v8, "_isEquivalentURLRepresentationTo:");

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)mapItemsFromUrl:(id)a3 options:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v43 = 0;
  id v44 = 0;
  id v6 = [MEMORY[0x1E4F646F0] mapItemsFromURL:v5 currentLocationIndices:&v44 options:&v43];
  id v7 = v44;
  id v8 = v43;
  if (v6)
  {
    id v27 = v5;
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [[MKMapItem alloc] initWithGeoMapItem:*(void *)(*((void *)&v39 + 1) + 8 * i) isPlaceHolderPlace:0];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v12);
    }

    if ([v7 count])
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke;
      v37[3] = &unk_1E54BEA40;
      id v38 = v9;
      [v7 enumerateIndexesUsingBlock:v37];
    }
    id v5 = v27;
    if (a4)
    {
      *a4 = [v8 launchOptions];
    }
    id v16 = v7;
    id v17 = v8;
  }
  else
  {
    id v35 = v8;
    id v36 = v7;
    v18 = [MEMORY[0x1E4F64828] _placesFromURL:v5 currentLocationIndices:&v36 options:&v35];
    id v16 = v36;

    id v17 = v35;
    if (v18)
    {
      long long v26 = a4;
      id v28 = v5;
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count") + 1);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = [[MKMapItem alloc] initWithPlace:*(void *)(*((void *)&v31 + 1) + 8 * j)];
            [v9 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v45 count:16];
        }
        while (v21);
      }

      if ([v16 count])
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke_2;
        v29[3] = &unk_1E54BEA40;
        id v30 = v9;
        [v16 enumerateIndexesUsingBlock:v29];
      }
      if (v26)
      {
        *long long v26 = [v17 launchOptions];
      }
      id v5 = v28;
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

void __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if ([*(id *)(a1 + 32) count] >= a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[MKMapItem mapItemForCurrentLocation];
    [v6 insertObject:v7 atIndex:a2];
  }
  else
  {
    *a3 = 1;
  }
}

void __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if ([*(id *)(a1 + 32) count] >= a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[MKMapItem mapItemForCurrentLocation];
    [v6 insertObject:v7 atIndex:a2];
  }
  else
  {
    *a3 = 1;
  }
}

+ (id)stringForMapType:(unint64_t)a3
{
  id result = @"k";
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      return result;
    case 2uLL:
    case 4uLL:
      id result = @"h";
      break;
    default:
      v4 = @"r";
      if (a3 != 104) {
        v4 = @"m";
      }
      if (a3 == 101) {
        id result = @"t";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

+ (id)stringForDirectionsType:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"p";
  }
  else {
    return off_1E54BEA80[a3 - 1];
  }
}

@end