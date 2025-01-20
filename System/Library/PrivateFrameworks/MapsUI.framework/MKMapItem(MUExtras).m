@interface MKMapItem(MUExtras)
- (MUTrailSelectionInfo)_mapsui_trailSelectionInfoForMap;
- (uint64_t)_mapsui_associatedHikingItemType;
@end

@implementation MKMapItem(MUExtras)

- (MUTrailSelectionInfo)_mapsui_trailSelectionInfoForMap
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [a1 _placeCategoryType];
  if (v2 == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = objc_msgSend(a1, "_geoMapItem", 0);
    v10 = [v9 _trailHead];
    v7 = [v10 trails];

    uint64_t v11 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v7);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 shouldHighlight])
          {
            if ([v15 trailId])
            {
              v16 = [v15 name];
              uint64_t v17 = [v16 length];

              if (v17)
              {
                v18 = [MUTrailSelectionInfo alloc];
                uint64_t v19 = [v15 trailId];
                v20 = [v15 name];
                v8 = [(MUTrailSelectionInfo *)v18 initWithTrailID:v19 trailName:v20];

                goto LABEL_18;
              }
            }
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    goto LABEL_16;
  }
  if (v2 != 1
    || ([a1 name],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        !v4))
  {
LABEL_16:
    v8 = 0;
    goto LABEL_19;
  }
  v5 = [MUTrailSelectionInfo alloc];
  uint64_t v6 = [a1 _muid];
  v7 = [a1 name];
  v8 = [(MUTrailSelectionInfo *)v5 initWithTrailID:v6 trailName:v7];
LABEL_18:

LABEL_19:
  return v8;
}

- (uint64_t)_mapsui_associatedHikingItemType
{
  int v1 = [a1 _placeCategoryType];
  if (v1 == 1) {
    return 2;
  }
  else {
    return v1 == 2;
  }
}

@end