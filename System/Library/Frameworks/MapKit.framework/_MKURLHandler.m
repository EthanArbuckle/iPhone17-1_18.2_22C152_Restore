@interface _MKURLHandler
+ (BOOL)canHandleURL:(id)a3;
+ (unsigned)_MKGetURLSchemeTypeFor:(id)a3;
- (BOOL)_handleMapItemHandlesURL:(id)a3 sourceApplication:(id)a4 context:(id)a5;
- (BOOL)_handleMapItemURL:(id)a3 sourceApplication:(id)a4 context:(id)a5;
- (BOOL)_handleMapItems:(id)a3 withOptions:(id)a4 url:(id)a5 sourceApplication:(id)a6 context:(id)a7;
- (BOOL)_handleMapsURL:(id)a3 sourceApplication:(id)a4 context:(id)a5;
- (BOOL)_handleSharedMapURL:(id)a3 sourceApplication:(id)a4 context:(id)a5;
- (BOOL)_treatAllCuratedCollectionsFrom:(id)a3;
- (BOOL)_treatCarDestinationsFrom:(id)a3;
- (BOOL)_treatCollectionFrom:(id)a3;
- (BOOL)_treatContentProvider:(id)a3;
- (BOOL)_treatCuratedCollectionFrom:(id)a3;
- (BOOL)_treatFavoritesFrom:(id)a3;
- (BOOL)_treatMuninViewStateFrom:(id)a3;
- (BOOL)_treatNavigationDirectionsFrom:(id)a3;
- (BOOL)_treatOfflineDownloadFrom:(id)a3;
- (BOOL)_treatPinPositionFrom:(id)a3;
- (BOOL)_treatPublisherFrom:(id)a3;
- (BOOL)_treatRegionFrom:(id)a3;
- (BOOL)_treatReportAProblemFrom:(id)a3;
- (BOOL)_treatSearchFrom:(id)a3;
- (BOOL)_treatSearchRegionFrom:(id)a3;
- (BOOL)_treatShowMyLocationCardFrom:(id)a3;
- (BOOL)_treatShowParkedCarFrom:(id)a3;
- (BOOL)_treatTesterFrom:(id)a3;
- (BOOL)_treatTransitLineFrom:(id)a3;
- (BOOL)handleURL:(id)a3 sourceApplication:(id)a4 context:(id)a5;
- (_MKURLHandlerDelegate)delegate;
- (void)_treatGenericOptionsFrom:(id)a3;
- (void)_treatMapTypeFrom:(id)a3;
- (void)_treatTrackingModeFrom:(id)a3;
- (void)adjustOptionsForRAP:(id)a3 options:(id *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _MKURLHandler

+ (BOOL)canHandleURL:(id)a3
{
  return +[_MKURLHandler _MKGetURLSchemeTypeFor:a3] != 0;
}

+ (unsigned)_MKGetURLSchemeTypeFor:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 scheme];
    v7 = [v6 lowercaseString];

    if ([v7 isEqualToString:@"maps"])
    {
LABEL_3:
      unsigned __int8 v8 = 1;
LABEL_20:

      goto LABEL_21;
    }
    if ([v7 isEqualToString:@"map"])
    {
      unsigned __int8 v8 = 2;
      goto LABEL_20;
    }
    if ([v7 isEqualToString:@"mapitem"])
    {
      unsigned __int8 v8 = 3;
      goto LABEL_20;
    }
    if ([v7 isEqualToString:@"x-maps-mapitemhandles"])
    {
      unsigned __int8 v8 = 4;
      goto LABEL_20;
    }
    if (([v7 isEqualToString:@"http"] & 1) != 0
      || [v7 isEqualToString:@"https"])
    {
      v11 = [v5 host];
      v12 = [v11 lowercaseString];
      char v13 = [v12 isEqualToString:@"maps.apple.com"];

      if (v13) {
        goto LABEL_3;
      }
      v14 = [v5 host];
      v15 = [v14 lowercaseString];
      char v16 = [v15 isEqualToString:@"collections.apple.com"];

      if ((v16 & 1) != 0
        || ([v5 host],
            v17 = objc_claimAutoreleasedReturnValue(),
            [v17 lowercaseString],
            v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 isEqualToString:@"guides.apple.com"],
            v18,
            v17,
            (v19 & 1) != 0))
      {
        unsigned __int8 v8 = 5;
        goto LABEL_20;
      }
    }
    unsigned __int8 v8 = 0;
    goto LABEL_20;
  }
  v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    int v21 = 138543618;
    v22 = v10;
    __int16 v23 = 2082;
    v24 = "nil == url";
    _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v21, 0x16u);
  }
  unsigned __int8 v8 = 0;
LABEL_21:

  return v8;
}

- (BOOL)handleURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = GEOFindOrCreateLog();
  char v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138477827;
      id v21 = v9;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_DEBUG, "Handling URL: '%{private}@'", (uint8_t *)&v20, 0xCu);
    }

    switch(+[_MKURLHandler _MKGetURLSchemeTypeFor:v9])
    {
      case 0u:
        v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = [v9 scheme];
          int v20 = 138543362;
          id v21 = v18;
          _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_ERROR, "Scheme '%{public}@' is not supported.", (uint8_t *)&v20, 0xCu);
        }
        goto LABEL_9;
      case 1u:
      case 5u:
        BOOL v14 = [(_MKURLHandler *)self _handleMapsURL:v9 sourceApplication:v10 context:v11];
        break;
      case 2u:
        BOOL v14 = [(_MKURLHandler *)self _handleSharedMapURL:v9 sourceApplication:v10 context:v11];
        break;
      case 3u:
        BOOL v14 = [(_MKURLHandler *)self _handleMapItemURL:v9 sourceApplication:v10 context:v11];
        break;
      case 4u:
        BOOL v14 = [(_MKURLHandler *)self _handleMapItemHandlesURL:v9 sourceApplication:v10 context:v11];
        break;
      default:
        goto LABEL_9;
    }
    BOOL v16 = v14;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      int v20 = 138543618;
      id v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = "nil == url";
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v20, 0x16u);
    }
LABEL_9:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_treatMapTypeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      unint64_t v7 = [v5 mapType];
      if (v7 < 5 || v7 == 108 || v7 == 104)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "URLHandler:setMapType:", self, objc_msgSend(v5, "mapType"));
      }
    }
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2082;
      BOOL v14 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (BOOL)_treatPinPositionFrom:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    char v11 = 0;
    goto LABEL_58;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (![(_MKURLHandler *)self _treatRegionFrom:v5]) {
      [(_MKURLHandler *)self _treatSearchRegionFrom:v5];
    }
    unint64_t v7 = [v5 contentProvider];
    uint64_t v8 = [v5 contentProviderID];
    id v9 = (void *)v8;
    if (v7 && v8)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = [v10 URLHandler:self showExternalBusinessID:v9 ofContentProvider:v7];
LABEL_56:

      goto LABEL_57;
    }
    uint64_t v13 = [v5 searchUID];
    uint64_t v14 = [v5 searchProviderID];
    if (v13)
    {
      uint64_t v15 = v14;
      BOOL v16 = [v5 directionsDestinationAddressString];
      uint64_t v17 = [v16 length];

      if (!v17)
      {
        id v47 = objc_loadWeakRetained((id *)&self->_delegate);
        [v5 centerCoordinate];
        double v49 = v48;
        double v51 = v50;
        v52 = [v5 searchQuery];
        char v11 = objc_msgSend(v47, "URLHandler:showMUID:resultProviderID:coordinate:query:", self, v13, v15, v52, v49, v51);

LABEL_57:
LABEL_58:

        goto LABEL_59;
      }
    }
    id v10 = [v5 cnContactIdentifier];
    v18 = [v5 cnAddressIdentifier];
    if ([v10 length])
    {
      if ([v18 length])
      {
        id v19 = objc_loadWeakRetained((id *)&self->_delegate);
        char v20 = [v19 URLHandler:self showAddressByCNContactIdentifier:v10 addressIdentifier:v18];

        if (v20)
        {
          char v11 = 1;
LABEL_55:

          goto LABEL_56;
        }
      }
    }
    uint64_t v21 = [v5 abRecordID];
    uint64_t v22 = [v5 abAddressID];
    __int16 v23 = (void *)v22;
    v75 = (void *)v21;
    if (v21)
    {
      if (v22)
      {
        uint64_t v24 = (void *)v22;
        id v25 = objc_loadWeakRetained((id *)&self->_delegate);
        char v26 = [v25 URLHandler:self showAddressByRecordID:v75 addressID:v24];

        __int16 v23 = v24;
        if (v26)
        {
          char v11 = 1;
LABEL_54:

          goto LABEL_55;
        }
      }
    }
    v73 = v23;
    v74 = v18;
    [v5 centerCoordinate];
    double v28 = v27;
    double v30 = v29;
    *(double *)buf = v27;
    *(double *)&buf[8] = v29;
    BOOL v31 = v29 >= -180.0;
    if (v29 > 180.0) {
      BOOL v31 = 0;
    }
    if (v27 < -90.0) {
      BOOL v31 = 0;
    }
    BOOL v32 = v27 <= 90.0 && v31;
    v33 = [v5 addressString];
    uint64_t v34 = [v33 length];

    v35 = [v5 searchQuery];
    uint64_t v36 = [v35 length];

    BOOL v72 = v32;
    char v37 = !v32;
    if (v32 && v34 && v36)
    {
      id v38 = objc_loadWeakRetained((id *)&self->_delegate);
      char v39 = objc_opt_respondsToSelector();

      if (v39)
      {
        id v40 = objc_loadWeakRetained((id *)&self->_delegate);
        char v41 = [v40 URLHandlerShouldPerformRefinementRequest:self];

        if ((v41 & 1) == 0)
        {
          id v42 = objc_loadWeakRetained((id *)&self->_delegate);
          char v43 = objc_opt_respondsToSelector();

          if (v43)
          {
            id v44 = objc_loadWeakRetained((id *)&self->_delegate);
            v45 = [v5 addressString];
            v46 = [v5 searchQuery];
            char v11 = objc_msgSend(v44, "URLHandler:showAddress:label:at:", self, v45, v46, v28, v30);

LABEL_50:
            goto LABEL_53;
          }
        }
      }
      v59 = +[MKMapService sharedService];
      v60 = [v5 addressString];
      v61 = [v5 searchQuery];
      v62 = [v59 ticketForPlaceRefinementRequestWithCoordinate:buf addressLine:v60 placeName:v61 traits:0];

      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __39___MKURLHandler__treatPinPositionFrom___block_invoke;
      v81[3] = &unk_1E54B96A0;
      long long v84 = *(_OWORD *)buf;
      id v82 = v5;
      v83 = self;
      BOOL v85 = v32;
      [v62 submitWithHandler:v81 networkActivity:0];
    }
    else
    {
      if (!v36) {
        char v37 = 1;
      }
      if (v37)
      {
        if (!v34) {
          goto LABEL_62;
        }
        id v53 = objc_loadWeakRetained((id *)&self->_delegate);
        v54 = [v5 addressString];
        v55 = [v5 searchQuery];
        char v56 = [v53 URLHandler:self showAddress:v54 label:v55];

        if ((v56 & 1) == 0)
        {
LABEL_62:
          if (!v72
            || (id v57 = objc_loadWeakRetained((id *)&self->_delegate),
                char v58 = objc_msgSend(v57, "URLHandler:showMapWithoutPinAt:", self, v28, v30),
                v57,
                (v58 & 1) == 0))
          {
            char v11 = 0;
LABEL_53:
            __int16 v23 = v73;
            v18 = v74;
            goto LABEL_54;
          }
        }
      }
      else
      {
        id v63 = objc_loadWeakRetained((id *)&self->_delegate);
        char v64 = objc_opt_respondsToSelector();

        if (v64)
        {
          id v65 = objc_loadWeakRetained((id *)&self->_delegate);
          char v66 = [v65 URLHandlerShouldPerformReverseGeocoding:self];

          if ((v66 & 1) == 0)
          {
            id v67 = objc_loadWeakRetained((id *)&self->_delegate);
            char v68 = objc_opt_respondsToSelector();

            if (v68)
            {
              id v44 = objc_loadWeakRetained((id *)&self->_delegate);
              v45 = [v5 searchQuery];
              char v11 = objc_msgSend(v44, "URLHandler:showLabel:at:", self, v45, v28, v30);
              goto LABEL_50;
            }
          }
        }
        v69 = +[MKMapService sharedService];
        v70 = objc_msgSend(v69, "ticketForReverseGeocodeCoordinate:traits:", 0, v28, v30);

        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __39___MKURLHandler__treatPinPositionFrom___block_invoke_2;
        v76[3] = &unk_1E54B96A0;
        long long v79 = *(_OWORD *)buf;
        id v77 = v5;
        v78 = self;
        BOOL v80 = v32;
        [v70 submitWithHandler:v76 networkActivity:0];
      }
    }
    char v11 = 1;
    goto LABEL_53;
  }
  char v11 = 0;
LABEL_59:

  return v11;
}

- (void)_treatTrackingModeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained && [v5 trackingModeSpecified])
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "URLHandler:setUserTrackingMode:", self, objc_msgSend(v5, "trackingMode"));
    }
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = NSStringFromSelector(a2);
      int v10 = 138543618;
      char v11 = v9;
      __int16 v12 = 2082;
      uint64_t v13 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)_treatNavigationDirectionsFrom:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v61 = v28;
      __int16 v62 = 2082;
      id v63 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    char v29 = 0;
    goto LABEL_38;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v7 = [v5 directionsSourceAddressString];
    uint64_t v8 = [v5 directionsDestinationAddressStrings];
    id v9 = v8;
    if (v7 || [v8 count])
    {
      uint64_t v10 = [v5 transportType];
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0xFFFFFFFLL;
      }
      __int16 v12 = [v5 label];
      uint64_t v13 = [v5 searchUID];
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        double v51 = v5;
        uint64_t v52 = v13;
        location = (id *)&self->_delegate;
        uint64_t v48 = v11;
        double v49 = self;
        double v50 = v7;
        BOOL v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v9;
        uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        id v53 = v16;
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v56 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F646B8]) initWithMapsIdentifierString:v21];
              if ([v23 isValid])
              {
                uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
                [v22 setObject:v24 forKeyedSubscript:@"muid"];

                id v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "resultProviderID"));
                [v22 setObject:v25 forKeyedSubscript:@"providerID"];

                BOOL v16 = v53;
              }
              [v22 setObject:v21 forKeyedSubscript:@"address"];
              [v16 addObject:v22];
            }
            uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
          }
          while (v18);
        }

        id v7 = v50;
        id v5 = v51;
        if (v52)
        {
          uint64_t v26 = [v53 count];
          if (v26)
          {
            uint64_t v27 = [v53 lastObject];
          }
          else
          {
            uint64_t v27 = objc_opt_new();
          }
          char v37 = (void *)v27;
          id v38 = [NSNumber numberWithUnsignedLongLong:v52];
          [v37 setObject:v38 forKeyedSubscript:@"muid"];

          char v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v51, "searchProviderID"));
          [v37 setObject:v39 forKeyedSubscript:@"providerID"];

          if ([v12 length]) {
            [v37 setObject:v12 forKeyedSubscript:@"label"];
          }
          if (!v26) {
            [v53 addObject:v37];
          }
        }
        id v40 = objc_loadWeakRetained(location);
        char v41 = (void *)[v53 copy];
        id v42 = [v51 directionsOptions];
        char v29 = [v40 URLHandler:v49 showDirectionsFrom:v50 toDestinations:v41 using:v48 directionsOptions:v42];
      }
      else if (v13 || [v12 length])
      {
        uint64_t v30 = v13;
        uint64_t v31 = [v5 searchProviderID];
        id v32 = objc_loadWeakRetained((id *)&self->_delegate);
        v33 = [v9 lastObject];
        uint64_t v34 = [v5 directionsOptions];
        uint64_t v35 = v11;
        uint64_t v36 = (void *)v34;
        char v29 = [v32 URLHandler:self showDirectionsFrom:v7 to:v33 using:v35 muid:v30 providerId:v31 showLabel:v12 directionsOptions:v34];
      }
      else
      {
        id v44 = objc_loadWeakRetained((id *)&self->_delegate);
        v45 = [v9 lastObject];
        v46 = [v5 directionsOptions];
        char v29 = [v44 URLHandler:self showDirectionsFrom:v7 to:v45 using:v11 directionsOptions:v46];
      }
    }
    else
    {
      char v29 = 0;
    }

LABEL_38:
    goto LABEL_39;
  }
  char v29 = 0;
LABEL_39:

  return v29;
}

- (BOOL)_treatRegionFrom:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = NSStringFromSelector(a2);
      int v78 = 138543618;
      long long v79 = v22;
      __int16 v80 = 2082;
      v81 = "nil == parsed";
LABEL_18:
      _os_log_impl(&dword_18BAEC000, v21, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v78, 0x16u);
    }
LABEL_19:

    goto LABEL_20;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    uint64_t v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = NSStringFromSelector(a2);
      int v78 = 138543618;
      long long v79 = v22;
      __int16 v80 = 2082;
      v81 = "nil == _delegate";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v7)
  {
    [v5 centerCoordinate];
    if (v9 >= -180.0 && v9 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      [v5 cameraCenterBasedAltitude];
      if (v10 > 0.0)
      {
        [v5 rotation];
        if (v11 <= 0.01)
        {
          [v5 rotation];
          if (v12 >= -0.01)
          {
            [v5 tilt];
            if (v13 <= 0.01)
            {
              [v5 tilt];
              if (v14 >= -0.01)
              {
                id v15 = objc_loadWeakRetained((id *)&self->_delegate);
                [v5 centerCoordinate];
                double v53 = v52;
                double v55 = v54;
                [v5 cameraCenterBasedAltitude];
                char v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenter:altitude:", self, v53, v55, v56);
                goto LABEL_36;
              }
            }
          }
        }
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v5 centerCoordinate];
        double v17 = v16;
        double v19 = v18;
        [v5 cameraCenterBasedAltitude];
        goto LABEL_30;
      }
      [v5 zoomLevel];
      if (v26 >= 0.0)
      {
        [v5 rotation];
        if (v39 > 0.01
          || ([v5 rotation], v40 < -0.01)
          || ([v5 tilt], v41 > 0.01)
          || ([v5 tilt], v42 < -0.01))
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v5 centerCoordinate];
          double v44 = v43;
          double v46 = v45;
          [v5 zoomLevel];
          double v48 = v47;
          [v5 tilt];
          double v50 = v49;
          [v5 rotation];
          char v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenterAndCamera:zoomLevel:pitch:yaw:", self, v44, v46, v48, v50, v51);
          goto LABEL_36;
        }
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v5 centerCoordinate];
        double v58 = v57;
        double v60 = v59;
        [v5 zoomLevel];
        double v62 = v61;
        id v63 = v15;
        uint64_t v64 = self;
        double v65 = v58;
        double v66 = v60;
      }
      else
      {
        [v5 altitude];
        if (v27 > 0.01
          || ([v5 rotation], v28 > 0.01)
          || ([v5 rotation], v29 < -0.01)
          || ([v5 tilt], v30 > 0.01)
          || ([v5 tilt], v31 < -0.01))
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v5 centerCoordinate];
          double v17 = v32;
          double v19 = v33;
          [v5 altitude];
LABEL_30:
          double v34 = v20;
          [v5 tilt];
          double v36 = v35;
          [v5 rotation];
          char v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenterAndCamera:altitude:pitch:yaw:", self, v17, v19, v34, v36, v37);
LABEL_36:
          BOOL v23 = v38;

          goto LABEL_21;
        }
        [v5 span];
        if (v67 >= 0.0 && v67 <= 180.0 && v68 >= 0.0 && v68 <= 360.0)
        {
          [v5 span];
          if (v69 > 0.0)
          {
            [v5 centerCoordinate];
            double v71 = v70;
            double v73 = v72;
            [v5 span];
            double v75 = v74;
            double v77 = v76;
            id v15 = objc_loadWeakRetained((id *)&self->_delegate);
            char v38 = objc_msgSend(v15, "URLHandler:setRegion:", self, v71, v73, v75, v77);
            goto LABEL_36;
          }
        }
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v5 centerCoordinate];
        double v62 = *(double *)&_MKURLHandlerDefaultZoomLevel;
        id v63 = v15;
        uint64_t v64 = self;
      }
      char v38 = objc_msgSend(v63, "URLHandler:setRegionWithCenter:zoomLevel:", v64, v65, v66, v62);
      goto LABEL_36;
    }
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "URLHandler:setRegion:", self, -180.0, -180.0, NAN, NAN);
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (BOOL)_treatSearchRegionFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v19 = NSStringFromSelector(a2);
      int v22 = 138543618;
      BOOL v23 = v19;
      __int16 v24 = 2082;
      id v25 = "nil == parsed";
LABEL_23:
      _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v22, 0x16u);
    }
LABEL_24:

    goto LABEL_25;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    double v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v19 = NSStringFromSelector(a2);
      int v22 = 138543618;
      BOOL v23 = v19;
      __int16 v24 = 2082;
      id v25 = "nil == _delegate";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  [v5 searchRegion];
  if (v8 < -180.0
    || v8 > 180.0
    || v7 < -90.0
    || v7 > 90.0
    || v9 < 0.0
    || v9 > 180.0
    || v10 < 0.0
    || v10 > 360.0
    || (id v11 = objc_loadWeakRetained((id *)&self->_delegate),
        [v5 searchRegion],
        char v12 = objc_msgSend(v11, "URLHandler:setRegion:", self),
        v11,
        (v12 & 1) == 0))
  {
    [v5 searchCoordinate];
    if (v14 < -180.0
      || v14 > 180.0
      || v13 < -90.0
      || v13 > 90.0
      || (id v15 = objc_loadWeakRetained((id *)&self->_delegate),
          [v5 searchCoordinate],
          char v16 = objc_msgSend(v15, "URLHandler:setRegionWithCenter:", self),
          v15,
          (v16 & 1) == 0))
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "URLHandler:setRegion:", self, -180.0, -180.0, NAN, NAN);

LABEL_25:
      BOOL v17 = 0;
      goto LABEL_26;
    }
  }
  BOOL v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)_treatSearchFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      int v17 = 138543618;
      double v18 = v15;
      __int16 v19 = 2082;
      id v20 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
LABEL_8:
    char v13 = 0;
    goto LABEL_11;
  }
  double v7 = [v5 searchQuery];
  [v5 searchCoordinate];
  if (v7)
  {
    double v10 = v8;
    double v11 = v9;
    [(_MKURLHandler *)self _treatSearchRegionFrom:v5];
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_msgSend(v12, "URLHandler:search:at:", self, v7, v10, v11);
  }
  else
  {
    char v13 = 0;
  }

LABEL_11:
  return v13;
}

- (BOOL)_treatContentProvider:(id)a3
{
  id v4 = [a3 contentProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(self) = [WeakRetained URLHandler:self setContentProvider:v4];

  return (char)self;
}

- (void)_treatGenericOptionsFrom:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    [(_MKURLHandler *)self _treatMapTypeFrom:v5];
    [(_MKURLHandler *)self _treatTrackingModeFrom:v5];
    [(_MKURLHandler *)self _treatContentProvider:v5];
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = NSStringFromSelector(a2);
      int v8 = 138543618;
      double v9 = v7;
      __int16 v10 = 2082;
      double v11 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)_treatFavoritesFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    double v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2082;
      id v15 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  if ((unint64_t)([v5 favoritesType] - 1) > 1)
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  double v7 = [(_MKURLHandler *)self delegate];
  char v8 = objc_msgSend(v7, "URLHandler:showFavoritesType:", self, objc_msgSend(v6, "favoritesType"));

LABEL_8:
  return v8;
}

- (BOOL)_treatTransitLineFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    [(_MKURLHandler *)self _treatRegionFrom:v5];
    uint64_t v6 = [v5 lineMUID];
    double v7 = [v5 lineName];
    char v8 = v7;
    if (v6 && [v7 length])
    {
      double v9 = [(_MKURLHandler *)self delegate];
      char v10 = [v9 URLHandler:self showLineWithID:v6 name:v8];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = NSStringFromSelector(a2);
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2082;
      int v17 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_treatTesterFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = NSStringFromSelector(a2);
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2082;
      int v17 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (![v5 tester]
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v8 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v8 & 1) == 0))
  {
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  [v9 URLHandler:self launchIntoTesterWithParam:0];

  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)_treatMuninViewStateFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = NSStringFromSelector(a2);
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2082;
      id v20 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_10;
  }
  double v7 = [v5 muninViewState];

  if (!v7)
  {
    if ([v6 actionType] == 5)
    {
      char v13 = [v6 locationQueryItem];

      if (v13)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v15 = [v6 locationQueryItem];
        char v10 = [WeakRetained URLHandler:self enterLookAroundWithLocationQueryItem:v15];

        goto LABEL_11;
      }
    }
LABEL_10:
    char v10 = 0;
    goto LABEL_11;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v6 muninViewState];
  [v8 URLHandler:self enterLookAroundWithViewState:v9];

  char v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)_treatOfflineDownloadFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    int v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = NSStringFromSelector(a2);
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2082;
      uint64_t v18 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_7;
  }
  double v7 = [v5 offlineDownloadRegion];

  if (!v7)
  {
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v6 offlineDownloadRegion];
  char v10 = [v6 label];
  char v11 = [WeakRetained URLHandler:self initiateOfflineDownloadForRegion:v9 displayName:v10];

LABEL_8:
  return v11;
}

- (BOOL)_treatCollectionFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    char v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = NSStringFromSelector(a2);
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2082;
      __int16 v17 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_7;
  }
  double v7 = [v5 collectionStorage];

  if (!v7)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v6 collectionStorage];
  [WeakRetained URLHandler:self showCollection:v9];

  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)_treatCarDestinationsFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2082;
      int v15 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  if (![v5 showCarDestinations])
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  double v7 = [(_MKURLHandler *)self delegate];
  char v8 = [v7 URLHandlerShowCarDestinations:self];

LABEL_8:
  return v8;
}

- (BOOL)_treatShowParkedCarFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2082;
      int v15 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  if (![v5 showParkedCar])
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  double v7 = [(_MKURLHandler *)self delegate];
  char v8 = [v7 URLHandlerShowParkedCar:self];

LABEL_8:
  return v8;
}

- (BOOL)_treatShowMyLocationCardFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2082;
      int v15 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  if (![v5 showMyLocationCard])
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  double v7 = [(_MKURLHandler *)self delegate];
  char v8 = [v7 URLHandlerShowMyLocationCard:self];

LABEL_8:
  return v8;
}

- (BOOL)_treatCuratedCollectionFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    int v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = NSStringFromSelector(a2);
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2082;
      uint64_t v18 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v5 curatedCollectionMUID];
  uint64_t v8 = [v6 searchProviderID];
  if (!v7)
  {
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  BOOL v10 = [(_MKURLHandler *)self delegate];
  char v11 = [v10 URLHandler:self showCuratedCollectionWithID:v7 resultProviderID:v9];

LABEL_8:
  return v11;
}

- (BOOL)_treatPublisherFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    int v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = NSStringFromSelector(a2);
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2082;
      uint64_t v18 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v5 publisherMUID];
  uint64_t v8 = [v6 searchProviderID];
  if (!v7)
  {
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  BOOL v10 = [(_MKURLHandler *)self delegate];
  char v11 = [v10 URLHandler:self showPublisherWithID:v7 resultProviderID:v9];

LABEL_8:
  return v11;
}

- (BOOL)_treatAllCuratedCollectionsFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = NSStringFromSelector(a2);
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2082;
      int v15 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  if (![v5 showAllCuratedCollections])
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = [(_MKURLHandler *)self delegate];
  char v8 = [v7 URLHandlerShowAllCuratedCollections:self];

LABEL_8:
  return v8;
}

- (BOOL)_treatReportAProblemFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 actionType] == 7)
    {
      uint64_t v7 = [v6 locationQueryItem];

      if (v7)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v9 = [v6 locationQueryItem];
        char v10 = [WeakRetained URLHandler:self showReportAProblemWithLocationQuery:v9];

LABEL_11:
        goto LABEL_12;
      }
      if ([v6 showReports])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v10 = [WeakRetained URLHandlerShowReports:self];
        goto LABEL_11;
      }
    }
  }
  else
  {
    char v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = NSStringFromSelector(a2);
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2082;
      __int16 v17 = "nil == parsed";
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);
    }
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_handleMapsURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = [v8 scheme];
  [WeakRetained URLHandler:self setSchemeForCapture:v11 sourceApplication:v9 isLaunchedFromTTL:0 ttlEventTime:0];

  if (+[_MKURLParser isValidMapURL:v8])
  {
    int v12 = [[_MKURLParser alloc] initWithURL:v8];
    [(_MKURLParser *)v12 parseIncludingCustomParameters:1];
    char v13 = [(_MKURLParser *)v12 userSessionEntity];

    if (v13)
    {
      int v14 = [(_MKURLParser *)v12 userSessionEntity];
      int v15 = [MEMORY[0x1E4F64B90] sharedInstance];
      [v15 setMapsUserSessionEntity:v14];
    }
    [(_MKURLHandler *)self _treatGenericOptionsFrom:v12];
    BOOL v16 = [(_MKURLHandler *)self _treatMuninViewStateFrom:v12]
       || [(_MKURLHandler *)self _treatOfflineDownloadFrom:v12]
       || [(_MKURLHandler *)self _treatReportAProblemFrom:v12]
       || [(_MKURLHandler *)self _treatCollectionFrom:v12]
       || [(_MKURLHandler *)self _treatFavoritesFrom:v12]
       || [(_MKURLHandler *)self _treatTransitLineFrom:v12]
       || [(_MKURLHandler *)self _treatPinPositionFrom:v12]
       || [(_MKURLHandler *)self _treatNavigationDirectionsFrom:v12]
       || [(_MKURLHandler *)self _treatSearchFrom:v12]
       || [(_MKURLHandler *)self _treatTesterFrom:v12]
       || [(_MKURLHandler *)self _treatCarDestinationsFrom:v12]
       || [(_MKURLHandler *)self _treatShowParkedCarFrom:v12]
       || [(_MKURLHandler *)self _treatShowMyLocationCardFrom:v12]
       || [(_MKURLHandler *)self _treatCuratedCollectionFrom:v12]
       || [(_MKURLHandler *)self _treatPublisherFrom:v12]
       || [(_MKURLHandler *)self _treatAllCuratedCollectionsFrom:v12];
  }
  else
  {
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_ERROR, "%{public}@ thinks this is not a valid URL: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_handleSharedMapURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = objc_alloc_init(MKURLSerializer);
  id v15 = 0;
  int v12 = [(MKURLSerializer *)v11 mapItemsFromUrl:v10 options:&v15];
  id v13 = v15;
  LOBYTE(self) = [(_MKURLHandler *)self _handleMapItems:v12 withOptions:v13 url:v10 sourceApplication:v9 context:v8];

  return (char)self;
}

- (BOOL)_handleMapItemURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v14 = 0;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = +[MKMapItem mapItemsFromURL:v10 options:&v14];
  id v12 = v14;
  LOBYTE(self) = [(_MKURLHandler *)self _handleMapItems:v11 withOptions:v12 url:v10 sourceApplication:v9 context:v8];

  return (char)self;
}

- (void)adjustOptionsForRAP:(id)a3 options:(id *)a4
{
  id v9 = a3;
  id v5 = *a4;
  if (!*a4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    *a4 = v5;
  }
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = [v9 absoluteString];
  [v6 setObject:v7 forKey:@"MKLaunchOptionsURLKey"];

  id v8 = v6;
  *a4 = v8;
}

- (BOOL)_handleMapItemHandlesURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 URLHandlerWillStartAsynchronousHandling:self];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke;
  v18[3] = &unk_1E54B96F0;
  id v19 = v8;
  int v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  +[MKMapItem _mapItemsFromHandleURL:v16 completionHandler:v18];

  return 1;
}

- (BOOL)_handleMapItems:(id)a3 withOptions:(id)a4 url:(id)a5 sourceApplication:(id)a6 context:(id)a7
{
  v144[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v108 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v141 = v13;
    [(_MKURLHandler *)self adjustOptionsForRAP:v14 options:&v141];
    id v17 = v141;

    if (![v15 length])
    {
      uint64_t v18 = [v17 objectForKey:@"MKLaunchOptionsReferralIdentifierKey"];

      id v15 = (id)v18;
    }
    id v19 = [v17 objectForKey:@"MKLaunchOptionsFromTimeToLeaveNotificationKey"];
    uint64_t v20 = [v19 BOOLValue];

    if (v20)
    {
      id v21 = [v17 objectForKey:@"_MKLaunchOptionsRoutingArrivalDateKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v105 = v21;
      }
      else {
        id v105 = 0;
      }
    }
    else
    {
      id v105 = 0;
    }
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v24 = [v14 scheme];
    [v23 URLHandler:self setSchemeForCapture:v24 sourceApplication:v15 isLaunchedFromTTL:v20 ttlEventTime:v105];

    v107 = [v17 objectForKey:@"MKLaunchOptionsMapType"];
    if (v107)
    {
      uint64_t v25 = [v107 unsignedIntegerValue];
      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      [v26 URLHandler:self setMapType:v25];
    }
    v106 = [v17 objectForKey:@"MKLaunchOptionsShowsTraffic"];
    if (v106)
    {
      uint64_t v27 = [v106 BOOLValue];
      id v28 = objc_loadWeakRetained((id *)&self->_delegate);
      [v28 URLHandler:self setShowTraffic:v27];
    }
    if ([v12 indexOfObjectPassingTest:&__block_literal_global_20] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v12 count])
      {
        double v29 = [v17 objectForKey:@"MKLaunchOptionsDirectionsMode"];
        if (v29)
        {

LABEL_24:
          uint64_t v135 = 0;
          v136 = &v135;
          uint64_t v137 = 0x3032000000;
          v138 = __Block_byref_object_copy__7;
          v139 = __Block_byref_object_dispose__7;
          id v140 = 0;
          v134[0] = 0;
          v134[1] = v134;
          v134[2] = 0x2020000000;
          v134[3] = 0;
          v133[0] = MEMORY[0x1E4F143A8];
          v133[1] = 3221225472;
          v133[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_60;
          v133[3] = &unk_1E54B9738;
          v133[4] = &v135;
          v133[5] = v134;
          [v12 enumerateObjectsUsingBlock:v133];
          id v37 = objc_loadWeakRetained((id *)&self->_delegate);
          char v38 = objc_opt_respondsToSelector();

          if (v38)
          {
            id v39 = objc_loadWeakRetained((id *)&self->_delegate);
            char v40 = [v39 URLHandlerShouldPerformRefinementRequest:self];

            if ((v40 & 1) == 0)
            {
              double v44 = objc_loadWeakRetained((id *)&self->_delegate);
              char v22 = [v44 URLHandler:self launchIntoDirectionsWithMapItems:v12 options:v17 context:v108];
LABEL_68:

              _Block_object_dispose(v134, 8);
              _Block_object_dispose(&v135, 8);

              goto LABEL_69;
            }
          }
          double v41 = (void *)v136[5];
          if (v41)
          {
            if ([v41 _hasResolvablePartialInformation])
            {
              double v42 = +[MKMapService sharedService];
              double v43 = [(id)v136[5] _addressFormattedAsSinglelineAddress];
              double v44 = [v42 ticketForForwardGeocodeString:v43 traits:0];

              v127[0] = MEMORY[0x1E4F143A8];
              v127[1] = 3221225472;
              v127[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_2;
              v127[3] = &unk_1E54B9760;
              v132 = v134;
              id v128 = v12;
              v129 = self;
              id v130 = v17;
              id v131 = v108;
              [v44 submitWithHandler:v127 networkActivity:0];

              char v22 = 1;
              double v45 = v128;
LABEL_67:

              goto LABEL_68;
            }
            float v47 = [(id)v136[5] _geoAddress];
            double v48 = [v47 structuredAddress];
            if (v48)
            {
            }
            else
            {
              id v63 = [(id)v136[5] _geoAddress];
              BOOL v64 = [v63 formattedAddressLinesCount] == 0;

              if (!v64)
              {
                double v65 = +[MKMapService sharedService];
                double v44 = [v65 ticketForMapItemToRefine:v136[5] traits:0];

                v121[0] = MEMORY[0x1E4F143A8];
                v121[1] = 3221225472;
                v121[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_3;
                v121[3] = &unk_1E54B9760;
                v126 = v134;
                id v122 = v12;
                v123 = self;
                id v124 = v17;
                id v125 = v108;
                [v44 submitWithHandler:v121 networkActivity:0];

                char v22 = 1;
                double v45 = v122;
                goto LABEL_67;
              }
            }
          }
          if ((unint64_t)[v12 count] <= 1) {
            +[MKMapItem mapItemForCurrentLocation];
          }
          else {
          double v44 = [v12 firstObject];
          }
          double v45 = [v12 lastObject];
          if ([v44 isCurrentLocation])
          {
            int v49 = 0;
          }
          else
          {
            [v44 _coordinate];
            BOOL v52 = v51 < -180.0;
            if (v51 > 180.0) {
              BOOL v52 = 1;
            }
            if (v50 < -90.0) {
              BOOL v52 = 1;
            }
            int v49 = v50 > 90.0 || v52;
          }
          if ([v45 isCurrentLocation])
          {
            BOOL v53 = 0;
          }
          else
          {
            [v45 _coordinate];
            BOOL v53 = v55 < -180.0;
            if (v55 > 180.0) {
              BOOL v53 = 1;
            }
            if (v54 < -90.0) {
              BOOL v53 = 1;
            }
            if (v54 > 90.0) {
              BOOL v53 = 1;
            }
          }
          if ((v49 | v53) != 1)
          {
            double v56 = objc_loadWeakRetained((id *)&self->_delegate);
            char v22 = [v56 URLHandler:self launchIntoDirectionsWithMapItems:v12 options:v17 context:v108];
LABEL_66:

            goto LABEL_67;
          }
          if ([v44 isCurrentLocation])
          {
            double v56 = 0;
          }
          else
          {
            double v56 = [v44 _addressFormattedAsSinglelineAddress];
            if (![v56 length])
            {
              char v22 = 0;
              goto LABEL_66;
            }
          }
          if ([v45 isCurrentLocation])
          {
            double v60 = 0;
          }
          else
          {
            double v60 = [v45 _addressFormattedAsSinglelineAddress];
            if (![v60 length])
            {
              char v22 = 0;
              goto LABEL_65;
            }
          }
          id v61 = objc_loadWeakRetained((id *)&self->_delegate);
          char v22 = [v61 URLHandler:self showDirectionsFrom:v56 to:v60 using:0xFFFFFFFLL directionsOptions:0];

LABEL_65:
          goto LABEL_66;
        }
        double v35 = [v17 objectForKey:@"MKLaunchOptionsLaunchIntoRoute"];
        BOOL v36 = v35 == 0;

        if (!v36) {
          goto LABEL_24;
        }
        double v57 = [v17 objectForKey:@"MKLaunchOptionsLaunchIntoRAP"];

        if (v57)
        {
          id v58 = objc_loadWeakRetained((id *)&self->_delegate);
          double v59 = [v12 firstObject];
          char v22 = [v58 URLHandler:self launchIntoRAPForMapItem:v59 options:v17 context:v108];

          goto LABEL_69;
        }
        double v66 = [v17 objectForKey:@"MKLaunchOptionsLaunchIntoPhotoThumbnailGalleryKey"];

        if (v66)
        {
          double v67 = [v17 objectForKeyedSubscript:@"MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex"];
          BOOL v68 = v67 == 0;

          if (v68)
          {
            uint64_t v70 = 0;
          }
          else
          {
            double v69 = [v17 objectForKeyedSubscript:@"MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex"];
            uint64_t v70 = [v69 unsignedIntegerValue];
          }
          id v74 = objc_loadWeakRetained((id *)&self->_delegate);
          double v75 = [v12 firstObject];
          char v22 = [v74 URLHandler:self launchIntoPhotoThumbnailGalleryForMapItem:v75 albumIndex:v70 options:v17 context:v108];

          goto LABEL_69;
        }
        double v71 = [v17 objectForKey:@"MKLaunchOptionsLaunchIntoTableBookingKey"];

        if (v71)
        {
          id v72 = objc_loadWeakRetained((id *)&self->_delegate);
          double v73 = [v12 firstObject];
          char v22 = [v72 URLHandler:self launchIntoTableBookingForMapItem:v73 options:v17 context:v108];

          goto LABEL_69;
        }
        if ([v12 count] != 1)
        {
          id v84 = objc_loadWeakRetained((id *)&self->_delegate);
          char v22 = [v84 URLHandler:self launchIntoSearchWithMapItems:v12 options:v17 context:v108];

          goto LABEL_69;
        }
        v104 = [v12 firstObject];
        [v104 _coordinate];
        if (v77 < -180.0 || v77 > 180.0 || v76 < -90.0 || v76 > 90.0)
        {
          BOOL v85 = [v104 _addressFormattedAsSinglelineAddress];
          if ([v85 length])
          {
            id v86 = objc_loadWeakRetained((id *)&self->_delegate);
            uint64_t v87 = [v104 name];
            if ([v87 length])
            {
              v88 = [v104 name];
              char v22 = [v86 URLHandler:self showAddress:v85 label:v88];
            }
            else
            {
              char v22 = [v86 URLHandler:self showAddress:v85 label:v85];
            }
          }
          else
          {
            char v22 = 0;
          }
          goto LABEL_110;
        }
        if ([v104 _hasResolvablePartialInformation])
        {
          id v78 = objc_loadWeakRetained((id *)&self->_delegate);
          char v79 = objc_opt_respondsToSelector();

          if ((v79 & 1) != 0
            && (id v80 = objc_loadWeakRetained((id *)&self->_delegate),
                char v81 = [v80 URLHandlerShouldPerformForwardGeocoding:self],
                v80,
                (v81 & 1) == 0))
          {
            BOOL v85 = objc_loadWeakRetained((id *)&self->_delegate);
            v144[0] = v104;
            v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:1];
            char v22 = [v85 URLHandler:self launchIntoSearchWithMapItems:v99 options:v17 context:v108];
          }
          else
          {
            v115[0] = MEMORY[0x1E4F143A8];
            v115[1] = 3221225472;
            v115[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_4;
            v115[3] = &unk_1E54B9788;
            id v116 = v104;
            v117 = self;
            id v118 = v17;
            id v119 = v108;
            id v120 = v12;
            uint64_t v82 = (void (**)(void))MEMORY[0x18C139AE0](v115);
            v83 = +[MKLocationManager sharedLocationManager];
            if ([v83 isLocationServicesApproved]
              && ([v83 hasLocation] & 1) == 0)
            {
              v100 = +[MKLocationManager sharedLocationManager];
              double v101 = *MEMORY[0x1E4F1E748];
              v113[0] = MEMORY[0x1E4F143A8];
              v113[1] = 3221225472;
              v113[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_6;
              v113[3] = &unk_1E54B97B0;
              v114 = v82;
              v102 = [v100 singleLocationUpdateWithDesiredAccuracy:v113 handler:v101 timeout:5.0];

              [v102 start];
            }
            else
            {
              v82[2](v82);
            }

            char v22 = 1;
            BOOL v85 = v116;
          }
          goto LABEL_110;
        }
        v89 = [v104 _geoAddress];
        v90 = [v89 structuredAddress];
        if (v90)
        {
        }
        else
        {
          v92 = [v104 _geoAddress];
          BOOL v93 = [v92 formattedAddressLinesCount] == 0;

          if (!v93)
          {
            id v94 = objc_loadWeakRetained((id *)&self->_delegate);
            char v95 = objc_opt_respondsToSelector();

            if ((v95 & 1) != 0
              && (id v96 = objc_loadWeakRetained((id *)&self->_delegate),
                  char v97 = [v96 URLHandlerShouldPerformRefinementRequest:self],
                  v96,
                  (v97 & 1) == 0))
            {
              BOOL v85 = objc_loadWeakRetained((id *)&self->_delegate);
              v143 = v104;
              v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
              char v22 = [v85 URLHandler:self launchIntoSearchWithMapItems:v103 options:v17 context:v108];
            }
            else
            {
              v98 = +[MKMapService sharedService];
              BOOL v85 = [v98 ticketForMapItemToRefine:v104 traits:0];

              v109[0] = MEMORY[0x1E4F143A8];
              v109[1] = 3221225472;
              v109[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_7;
              v109[3] = &unk_1E54B9018;
              v109[4] = self;
              id v110 = v17;
              id v111 = v108;
              id v112 = v12;
              [v85 submitWithHandler:v109 networkActivity:0];

              char v22 = 1;
            }
            goto LABEL_110;
          }
        }
        BOOL v85 = objc_loadWeakRetained((id *)&self->_delegate);
        v142 = v104;
        v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v142 count:1];
        char v22 = [v85 URLHandler:self launchIntoShowMapItems:v91 options:v17 context:v108];

LABEL_110:
        goto LABEL_69;
      }
      double v31 = [v17 objectForKeyedSubscript:@"_MKLaunchOptionsPreserveSearchResultsKey"];
      if ([v31 BOOLValue])
      {
        double v32 = [v17 objectForKeyedSubscript:@"MKLaunchOptionsSelectedIndex"];
        BOOL v33 = v32 == 0;

        if (!v33)
        {
          id v34 = objc_loadWeakRetained((id *)&self->_delegate);
          char v22 = [v34 URLHandler:self launchIntoSearchWithMapItems:0 options:v17 context:v108];

          goto LABEL_69;
        }
      }
      else
      {
      }
      id v46 = objc_loadWeakRetained((id *)&self->_delegate);
      char v22 = [v46 URLHandler:self launchWithOptions:v17];

      goto LABEL_69;
    }
    id v30 = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = [v30 URLHandler:self launchIntoDirectionsWithMapItems:v12 options:v17 context:v108];

LABEL_69:
    id v13 = v17;
    goto LABEL_70;
  }
  char v22 = 0;
LABEL_70:

  return v22;
}

- (_MKURLHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKURLHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end