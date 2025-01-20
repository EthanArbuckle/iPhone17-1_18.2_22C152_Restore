@interface MKURLHandler
@end

@implementation MKURLHandler

void __39___MKURLHandler__treatPinPositionFrom___block_invoke(uint64_t a1, void *a2)
{
  v10 = [a2 firstObject];
  if (!v10)
  {
    v3 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v10 = [[MKMapItem alloc] initWithPlacemark:v3];
    v4 = [*(id *)(a1 + 32) searchQuery];
    [(MKMapItem *)v10 setName:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = [*(id *)(a1 + 32) searchQuery];
  if (*(unsigned char *)(a1 + 64))
  {
    double v8 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 56);
  }
  else
  {
    [(MKMapItem *)v10 _coordinate];
  }
  objc_msgSend(WeakRetained, "URLHandler:showMapItem:label:at:", v6, v10, v7, v8, v9);
}

void __39___MKURLHandler__treatPinPositionFrom___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 firstObject];
  if (v3)
  {
    v4 = v3;
    v5 = [v3 placemark];
    uint64_t v6 = [v5 mkPostalAddressDictionary];

    v7 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v18 = [[MKMapItem alloc] initWithPlacemark:v7];

    double v8 = [*(id *)(a1 + 32) searchQuery];
    [(MKMapItem *)v18 setName:v8];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = [*(id *)(a1 + 32) searchQuery];
    if (*(unsigned char *)(a1 + 64))
    {
      double v12 = *(double *)(a1 + 48);
      double v13 = *(double *)(a1 + 56);
    }
    else
    {
      [(MKMapItem *)v18 _coordinate];
    }
    objc_msgSend(WeakRetained, "URLHandler:showMapItem:label:at:", v10, v18, v11, v12, v13);
  }
  else
  {
    uint64_t v6 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v18 = [[MKMapItem alloc] initWithPlacemark:v6];
    v14 = [*(id *)(a1 + 32) searchQuery];
    [(MKMapItem *)v18 setName:v14];

    v7 = (MKPlacemark *)objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    uint64_t v15 = *(void *)(a1 + 40);
    id WeakRetained = [*(id *)(a1 + 32) searchQuery];
    if (*(unsigned char *)(a1 + 64))
    {
      double v16 = *(double *)(a1 + 48);
      double v17 = *(double *)(a1 + 56);
    }
    else
    {
      [(MKMapItem *)v18 _coordinate];
    }
    -[MKPlacemark URLHandler:showMapItem:label:at:](v7, "URLHandler:showMapItem:label:at:", v15, v18, WeakRetained, v16, v17);
  }
}

void __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke_2;
  block[3] = &unk_1E54B96C8;
  id v17 = v9;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  double v12 = *(void **)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = v7;
  id v21 = v8;
  id v22 = v12;
  id v23 = *(id *)(a1 + 56);
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      int v8 = 138478083;
      uint64_t v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_DEBUG, "_mapItemsFromHandleURL: '%{private}@' error %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 48) _handleMapItems:*(void *)(a1 + 56) withOptions:*(void *)(a1 + 64) url:*(void *)(a1 + 40) sourceApplication:*(void *)(a1 + 72) context:*(void *)(a1 + 80)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    [v7 URLHandler:*(void *)(a1 + 48) didFinishAsynchronousHandlingWithError:*(void *)(a1 + 32)];
  }
}

uint64_t __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_60(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ([v12 _hasResolvablePartialInformation]) {
    goto LABEL_2;
  }
  int v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _geoAddress];
  uint64_t v9 = [v8 structuredAddress];
  if (v9)
  {
  }
  else
  {
    __int16 v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _geoAddress];
    uint64_t v11 = [v10 formattedAddressLinesCount];

    if (v11)
    {
LABEL_2:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5 || ![v10 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [WeakRetained URLHandler:*(void *)(a1 + 40) launchIntoDirectionsWithMapItems:*(void *)(a1 + 32) options:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
  else
  {
    id WeakRetained = (id)[*(id *)(a1 + 32) mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v8 = [v10 firstObject];
    [WeakRetained replaceObjectAtIndex:v7 withObject:v8];

    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [v9 URLHandler:*(void *)(a1 + 40) launchIntoDirectionsWithMapItems:WeakRetained options:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5 || ![v10 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [WeakRetained URLHandler:*(void *)(a1 + 40) launchIntoDirectionsWithMapItems:*(void *)(a1 + 32) options:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
  else
  {
    id WeakRetained = (id)[*(id *)(a1 + 32) mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v8 = [v10 firstObject];
    [WeakRetained replaceObjectAtIndex:v7 withObject:v8];

    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [v9 URLHandler:*(void *)(a1 + 40) launchIntoDirectionsWithMapItems:WeakRetained options:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_4(uint64_t a1)
{
  id v2 = +[MKMapService sharedService];
  uint64_t v3 = [*(id *)(a1 + 32) _geoAddress];
  uint64_t v4 = [v3 singleLineAddress];
  id v5 = [v2 ticketForForwardGeocodeString:v4 traits:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_5;
  v7[3] = &unk_1E54B9018;
  char v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v5 submitWithHandler:v7 networkActivity:0];
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_5(void *a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    [WeakRetained URLHandler:a1[4] launchIntoSearchWithMapItems:a1[7] options:a1[5] context:a1[6]];
  }
  else
  {
    id WeakRetained = [v5 firstObject];
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 8));
    uint64_t v9 = a1[4];
    v11[0] = WeakRetained;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 URLHandler:v9 launchIntoShowMapItems:v10 options:a1[5] context:a1[6]];
  }
}

uint64_t __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_7(void *a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    [WeakRetained URLHandler:a1[4] launchIntoSearchWithMapItems:a1[7] options:a1[5] context:a1[6]];
  }
  else
  {
    id WeakRetained = [v5 firstObject];
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 8));
    uint64_t v9 = a1[4];
    v11[0] = WeakRetained;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 URLHandler:v9 launchIntoShowMapItems:v10 options:a1[5] context:a1[6]];
  }
}

@end