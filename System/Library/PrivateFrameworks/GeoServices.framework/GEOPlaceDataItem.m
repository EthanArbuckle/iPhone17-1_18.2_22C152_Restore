@interface GEOPlaceDataItem
@end

@implementation GEOPlaceDataItem

void __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue styleAttributes](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __31___GEOPlaceDataItem__venueInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 112))
  {
    id v6 = +[GEOPDVenueInfo venueInfoForPlaceData:*(void *)(v1 + 24)];
    if (v6)
    {
      v3 = [[GEOMapItemVenueInfo alloc] initWithVenueInfo:v6];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 112);
      *(void *)(v4 + 112) = v3;
    }
  }
}

void __31___GEOPlaceDataItem__placeType__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 144))
  {
    id v3 = +[GEOPDEntity entityForPlaceData:*(void *)(v1 + 24)];
    *(_DWORD *)(*(void *)(a1 + 32) + 144) = _MapItemPlaceTypeForPDPlaceType([v3 type]);
  }
}

void __34___GEOPlaceDataItem_addressObject__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 128))
  {
    uint64_t v3 = +[GEOAddressObject addressObjectForPlaceData:*(void *)(v1 + 24)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;
  }
}

void __27___GEOPlaceDataItem__place__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 80))
  {
    uint64_t v3 = +[GEOPlace placeForPlaceData:*(void *)(v1 + 24)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v3;
  }
}

uint64_t __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _refreshPhotoAttributions];
}

void __42___GEOPlaceDataItem__allPhotoAttributions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[24];
  if (!v3)
  {
    [v2 _refreshPhotoAttributions];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 192);
  }
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

void __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue entity](a2);
  uint64_t v6 = [v5 styleAttributes];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __25___GEOPlaceDataItem_name__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 136))
  {
    uint64_t v3 = [*(id *)(v1 + 24) bestName];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = v3;
  }
}

void __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = *(id *)(a1 + 32);
  v8 = v3;
  id v4 = v3;
  geo_isolate_sync();
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v6, 3221225472, __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke_2, &unk_1E53D8998);
  [v5 postNotificationName:@"GEOMapItemDidResolveAttribution" object:*(void *)(a1 + 32)];
}

void __48___GEOPlaceDataItem__relatedPlacesByComponentId__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 184))
  {
    uint64_t v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = +[GEOPDTemplatePlace templatedPlacesForPlaceData:*(void *)(*(void *)(v1 + 32) + 24)];
    if ([v3 count])
    {
      v27 = v2;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v4 = [v3 allKeys];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v34 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v10 = [v3 objectForKeyedSubscript:v9];
            if (v10)
            {
              uint64_t v11 = v1;
              v12 = [[GEORelatedPlaceList alloc] initWithTemplatePlace:v10 attributedMap:*(void *)(*(void *)(v1 + 32) + 32)];
              if (v12) {
                [v27 setObject:v12 forKeyedSubscript:v9];
              }

              uint64_t v1 = v11;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v6);
      }

      id v2 = v27;
      uint64_t v13 = [v27 copy];
      uint64_t v14 = *(void *)(v1 + 32);
      v15 = *(void **)(v14 + 184);
      *(void *)(v14 + 184) = v13;
    }
    else
    {
      v15 = +[GEOPDRelatedPlace relatedPlacesForPlaceData:*(void *)(*(void *)(v1 + 32) + 24)];
      if ([v15 count])
      {
        uint64_t v28 = v1;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v16 = [v15 allKeys];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              v22 = [v15 objectForKeyedSubscript:v21];
              if (v22)
              {
                v23 = [[GEORelatedPlaceList alloc] initWithRelatedPlace:v22];
                if (v23) {
                  [v2 setObject:v23 forKeyedSubscript:v21];
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v18);
        }

        uint64_t v24 = [v2 copy];
        uint64_t v25 = *(void *)(v28 + 32);
        v26 = *(void **)(v25 + 184);
        *(void *)(v25 + 184) = v24;
      }
    }
  }
}

void __29___GEOPlaceDataItem_timezone__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 208);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    id v4 = +[GEOPDPlaceInfo placeInfoForPlaceData:*(void *)(*(void *)(a1 + 32) + 24)];
    -[GEOPDPlaceInfo timezone](v4);
    uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[GEOTimezone identifier](v5);
    uint64_t v7 = [v3 initWithName:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 208);
    *(void *)(v8 + 208) = v7;

    id v2 = *(void **)(*(void *)(a1 + 32) + 208);
  }
  v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v10, v2);
}

GEOMapItemAdditionalPlaceInfo *__71___GEOPlaceDataItem_initWithPlaceData_detourInfo_additionalPlaceDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[_GEOPlaceDataItem alloc] initWithPlaceData:v2];

  id v4 = [[GEOMapItemAdditionalPlaceInfo alloc] initWithMapItem:v3];

  return v4;
}

void __35___GEOPlaceDataItem__businessHours__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 216);
  if (!v3)
  {
    if (*(unsigned char *)(v2 + 224))
    {
      id v3 = 0;
    }
    else
    {
      *(unsigned char *)(v2 + 224) = 1;
      id v4 = +[GEOPDBusinessHours businessHoursForPlaceData:*(void *)(*(void *)(a1 + 32) + 24)];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v4);
            }
            uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v11 = [GEOBusinessHours alloc];
            v12 = [*(id *)(a1 + 32) timezone];
            uint64_t v13 = [(GEOBusinessHours *)v11 initWithGEOPDBusinessHours:v10 timeZone:v12];

            if ([(GEOBusinessHours *)v13 hoursType])
            {
              if (!v7) {
                uint64_t v7 = objc_opt_new();
              }
              [v7 addObject:v13];
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v6);
      }
      else
      {
        uint64_t v7 = 0;
      }
      uint64_t v14 = (void *)[v7 copy];
      v15 = [MEMORY[0x1E4F1C9C8] date];
      v16 = +[GEOBusinessHours prioritizeBusinessHours:v14 compareDate:v15];

      id v17 = (id)[v16 count];
      uint64_t v18 = *(void *)(a1 + 32);
      if (v17) {
        id v17 = v16;
      }
      uint64_t v19 = *(void **)(v18 + 216);
      *(void *)(v18 + 216) = v17;

      id v3 = *(void **)(*(void *)(a1 + 32) + 216);
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __42___GEOPlaceDataItem_offlineDownloadRegion__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue offlineArea](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __40___GEOPlaceDataItem_supportsOfflineMaps__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v3 = -[GEOPDComponentValue supportsOfflineMaps](a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __45___GEOPlaceDataItem_transitStationIdentifier__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitAssociatedInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

GEOTransitPaymentMethod *__51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[GEOTransitPaymentMethod alloc] initWithPaymentMethod:v2];

  return v3;
}

void __52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

GEOTransitPaymentMethodSuggestion *__52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[GEOTransitPaymentMethodSuggestion alloc] initWithSuggestionData:v2];

  return v3;
}

void __40___GEOPlaceDataItem_cachingRadiusMeters__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __36___GEOPlaceDataItem__storefrontInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 96))
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__54;
    uint64_t v13 = __Block_byref_object_dispose__54;
    id v14 = 0;
    uint64_t v3 = *(void **)(v1 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36___GEOPlaceDataItem__storefrontInfo__block_invoke_2;
    v8[3] = &unk_1E53E16F0;
    v8[4] = &v9;
    [v3 enumerateValidComponentValuesOfType:55 usingBlock:v8];
    if (v10[5])
    {
      uint64_t v4 = [GEOStorefrontInfo alloc];
      uint64_t v5 = [(GEOStorefrontInfo *)v4 initWithStorefront:v10[5]];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 96);
      *(void *)(v6 + 96) = v5;
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __36___GEOPlaceDataItem__storefrontInfo__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue storefront](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104))
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__54;
    uint64_t v13 = __Block_byref_object_dispose__54;
    id v14 = 0;
    uint64_t v3 = *(void **)(v1 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke_2;
    v8[3] = &unk_1E53E16F0;
    v8[4] = &v9;
    [v3 enumerateValidComponentValuesOfType:59 usingBlock:v8];
    if (v10[5])
    {
      uint64_t v4 = [GEOStorefrontPresentationInfo alloc];
      uint64_t v5 = [(GEOStorefrontPresentationInfo *)v4 initWithStorefrontPresentation:v10[5]];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 104);
      *(void *)(v6 + 104) = v5;
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue storefrontPresentation](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke_2;
    v9[3] = &unk_1E53E1940;
    id v5 = v3;
    id v10 = v5;
    [v4 enumerateValidComponentValuesOfType:103 usingBlock:v9];
    if (*(void *)(*(void *)(a1 + 32) + 8)) {
      objc_msgSend(v5, "removeObject:");
    }
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  }
}

void __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[GEOPDComponentValue forwardInfo](a2);
  uint64_t v4 = v3;
  if (v3)
  {
    -[GEOPDForwardInfo _readCurrentId](v3);
    if (*(void *)(v4 + 24))
    {
      id v5 = [GEOMapItemIdentifier alloc];
      uint64_t v6 = -[GEOPDForwardInfo currentId]((id *)v4);
      uint64_t v7 = [(GEOMapItemIdentifier *)v5 initWithMapsIdentifier:v6];

      if (v7) {
        [*(id *)(a1 + 32) addObject:v7];
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = -[GEOPDForwardInfo previousIds]((id *)v4);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          id v14 = [GEOMapItemIdentifier alloc];
          v15 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v14, "initWithMapsIdentifier:", v13, (void)v16);
          if (v15) {
            [*(id *)(a1 + 32) addObject:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

void __32___GEOPlaceDataItem__childItems__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 160)) {
    return;
  }
  uint64_t v3 = +[GEOPDResultSnippet resultSnippetForPlaceData:*(void *)(v1 + 24)];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    -[GEOPDResultSnippet _readChildItems]((uint64_t)v3);
    if ([v3[4] count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v5 = -[GEOPDResultSnippet childItems](v3);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = [[GEOMapItemChildItem alloc] initWithChildItem:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            if (v10) {
              [v4 addObject:v10];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v7);
      }
LABEL_22:

      goto LABEL_23;
    }
    -[GEOPDResultSnippet _readChildPlaces]((uint64_t)v3);
    if ([v3[5] count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v5 = -[GEOPDResultSnippet childPlaces](v3);
      uint64_t v11 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v5);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * j);
            long long v16 = [GEOMapItemChildItem alloc];
            long long v17 = -[GEOMapItemChildItem initWithChildPlace:](v16, "initWithChildPlace:", v15, (void)v20);
            [v4 addObject:v17];
          }
          uint64_t v12 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v12);
      }
      goto LABEL_22;
    }
  }
LABEL_23:
  uint64_t v18 = objc_msgSend(v4, "count", (void)v20);
  if (v18) {
    long long v19 = (void *)[v4 copy];
  }
  else {
    long long v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v19);
  if (v18) {
}
  }

void __41___GEOPlaceDataItem__openingHoursOptions__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[19])
  {
    id v6 = [v2 _businessHours];
    uint64_t v3 = [v6 objectAtIndex:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;
  }
}

void __38___GEOPlaceDataItem__encyclopedicInfo__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 88))
  {
    id v2 = [[_GEOEncyclopedicInfo alloc] initWithPlaceData:*(void *)(*(void *)(a1 + 32) + 24) attributionMap:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = v2;
  }
}

void __41___GEOPlaceDataItem__placecardLayoutData__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 176)) {
    return;
  }
  if ([*(id *)(v1 + 24) hasPlaceLayoutData])
  {
    uint64_t v3 = [GEOPlacecardLayoutData alloc];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 24) placeLayoutData];
    uint64_t v4 = [(GEOPlacecardLayoutData *)v3 initWithPlacecardLayoutData:"initWithPlacecardLayoutData:"];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(GEOPDPlacecardLayoutData **)(v5 + 176);
    *(void *)(v5 + 176) = v4;
LABEL_6:

    uint64_t v7 = v11;
    goto LABEL_7;
  }
  uint64_t v7 = +[GEOPDPlacecardLayoutConfiguration placecardLayoutConfigurationPlaceData:*(void *)(*(void *)(a1 + 32) + 24)];
  if (v7)
  {
    id v11 = v7;
    id v6 = objc_alloc_init(GEOPDPlacecardLayoutData);
    -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)v6, v11);
    uint64_t v8 = [[GEOPlacecardLayoutData alloc] initWithPlacecardLayoutData:v6];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 176);
    *(void *)(v9 + 176) = v8;

    goto LABEL_6;
  }
LABEL_7:
}

void __38___GEOPlaceDataItem__browseCategories__block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue browseCategories](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

void __38___GEOPlaceDataItem__browseCategories__block_invoke_2(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue browseCategories](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

void __42___GEOPlaceDataItem__miniBrowseCategories__block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue miniPlaceBrowseCategories](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

void __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue styleAttributes](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue entity](a2);
  uint64_t v6 = [v5 styleAttributes];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __42___GEOPlaceDataItem__captionedPhotoAlbums__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 168))
  {
    uint64_t v3 = [*(id *)(v1 + 24) componentOfType:84 options:3];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v17 = v3;
    uint64_t v5 = -[GEOPDComponent values](v3);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(id **)(*((void *)&v18 + 1) + 8 * v9);
          id v11 = [GEOCaptionedPhotoAlbum alloc];
          uint64_t v12 = -[GEOPDComponentValue categorizedPhotos](v10);
          uint64_t v13 = [(GEOCaptionedPhotoAlbum *)v11 initWithCaptionedPhotoCategory:v12 attributionMap:*(void *)(*(void *)(a1 + 32) + 32)];

          if (v13) {
            [v4 addObject:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    uint64_t v14 = [v4 copy];
    uint64_t v15 = *(void *)(a1 + 32);
    long long v16 = *(void **)(v15 + 168);
    *(void *)(v15 + 168) = v14;
  }
}

@end