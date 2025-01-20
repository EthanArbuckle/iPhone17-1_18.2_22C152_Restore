@interface GEOMapURLParser
+ (BOOL)isValidMapURL:(id)a3;
+ (BOOL)isValidMapsCategoryURL:(id)a3;
+ (BOOL)isValidMapsURLForAppendingSharedSessionID:(id)a3;
- ($140BDABED96B4E653C9F0DB440664A5C)searchRegion;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromComponents:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromQueryValue:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)searchCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)span;
- (BOOL)exactPositionSpecified;
- (BOOL)parseIncludingCustomParameters:(BOOL)a3;
- (BOOL)showAllCuratedCollections;
- (BOOL)showCarDestinations;
- (BOOL)showMyLocationCard;
- (BOOL)showParkedCar;
- (BOOL)showReports;
- (BOOL)tester;
- (BOOL)trackingModeSpecified;
- (GEOEnrichmentInfo)enrichmentInfo;
- (GEOMapRegion)offlineDownloadRegion;
- (GEOMapURLParser)initWithURL:(id)a3;
- (GEOMuninViewState)muninViewState;
- (GEOURLCollectionStorage)collectionStorage;
- (GEOURLDirectionsOptions)directionsOptions;
- (GEOURLExtraStorage)extraStorage;
- (GEOURLLocationQueryItem)destinationLocationQueryItem;
- (GEOURLLocationQueryItem)locationQueryItem;
- (GEOURLLocationQueryItem)sourceLocationQueryItem;
- (GEOUserSessionEntity)userSessionEntity;
- (NSArray)directionsDestinationAddressStrings;
- (NSArray)directionsLocationQueryItems;
- (NSString)abAddressID;
- (NSString)abRecordID;
- (NSString)addressString;
- (NSString)cnAddressIdentifier;
- (NSString)cnContactIdentifier;
- (NSString)contentProvider;
- (NSString)contentProviderID;
- (NSString)directionsDestinationAddressString;
- (NSString)directionsSourceAddressString;
- (NSString)label;
- (NSString)lineName;
- (NSString)searchQuery;
- (double)altitude;
- (double)roll;
- (double)rotation;
- (double)tilt;
- (float)cameraDistance;
- (float)zoomLevel;
- (id)restoreCodableOfClass:(Class)a3 queryItem:(id)a4 key:(id)a5 compressedKey:(id)a6;
- (int)_mapTypeFromQueryItemValue:(id)a3;
- (int)_trackingModeFromQueryItemValue:(id)a3;
- (int)mapType;
- (int)searchProviderID;
- (int)trackingMode;
- (int)transportType;
- (int64_t)actionType;
- (int64_t)favoritesType;
- (unint64_t)curatedCollectionMUID;
- (unint64_t)lineMUID;
- (unint64_t)publisherMUID;
- (unint64_t)searchUID;
@end

@implementation GEOMapURLParser

+ (BOOL)isValidMapURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"maps"])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [v3 host];
    v8 = [v7 lowercaseString];

    if ([v5 isEqualToString:@"https"]
      && ([v8 isEqualToString:@"collections.apple.com"] & 1) != 0
      || [v5 isEqualToString:@"https"]
      && ([v8 isEqualToString:@"guides.apple.com"] & 1) != 0)
    {
      char v6 = 1;
    }
    else if (([v5 isEqualToString:@"http"] & 1) != 0 {
           || [v5 isEqualToString:@"https"])
    }
    {
      v9 = [v3 host];
      v10 = [v9 lowercaseString];
      char v6 = [v10 isEqualToString:@"maps.apple.com"];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

+ (BOOL)isValidMapsCategoryURL:(id)a3
{
  id v3 = [a3 scheme];
  v4 = [v3 lowercaseString];

  LOBYTE(v3) = [v4 isEqualToString:@"x-maps-category"];
  return (char)v3;
}

+ (BOOL)isValidMapsURLForAppendingSharedSessionID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[GEOMapURLParser isValidMapURL:v3]
    || +[GEOMapURLParser isValidMapsCategoryURL:v3];

  return v4;
}

- (GEOMapURLParser)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLParser;
  char v6 = [(GEOMapURLParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (BOOL)parseIncludingCustomParameters:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  uint64_t v347 = *MEMORY[0x1E4F143B8];
  int v5 = [(id)objc_opt_class() isValidMapURL:self->_url];
  BOOL v6 = v5;
  if (!v5) {
    return v6;
  }
  BOOL v318 = v5;
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  v324 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  v4->_exactPositionSpecified = 0;
  v4->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  v4->_searchCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  v4->_searchRegion.center = ($AB5116BA7E623E054F959CECB034F4E7)kGEOCoordinateRegionInvalid;
  __asm { FMOV            V10.2S, #-1.0 }
  *(void *)&v4->_zoomLevel = _D10;
  v4->_searchRegion.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_18A632CE0;
  *(void *)&v4->_mapType = 0x4FFFFFFFFLL;
  userSessionEntity = v4->_userSessionEntity;
  v4->_userSessionEntity = 0;

  v4->_tester = 0;
  *(_OWORD *)&v4->_altitude = 0u;
  *(_OWORD *)&v4->_tilt = 0u;
  contentProvider = v4->_contentProvider;
  v4->_contentProvider = 0;

  contentProviderID = v4->_contentProviderID;
  v4->_contentProviderID = 0;

  lineName = v4->_lineName;
  v4->_lineName = 0;

  v4->_lineMUID = 0;
  v4->_favoritesType = 0;
  v4->_trackingMode = 0;
  v17 = (void *)MEMORY[0x1E4F29088];
  v18 = [(NSURL *)v4->_url absoluteString];
  v19 = [v17 componentsWithString:v18];

  v20 = [v19 queryItems];
  v21 = [v19 path];
  v322 = v4;
  if (![v20 count]
    && [v21 length]
    && [v21 containsString:@"="])
  {
    v24 = [(NSURL *)v4->_url absoluteString];
    v25 = [v24 stringByReplacingOccurrencesOfString:@"maps:" withString:@"maps:?"];

    v26 = [v25 stringByReplacingOccurrencesOfString:@"maps:??" withString:@"maps:?"];

    v27 = [MEMORY[0x1E4F29088] componentsWithString:v26];

    uint64_t v28 = [v27 queryItems];

    v20 = (void *)v28;
    v19 = v27;
    BOOL v4 = v322;
  }
  id v22 = v21;
  if ([v22 isEqual:@"/directions"])
  {
    uint64_t v23 = 1;
  }
  else if ([v22 isEqual:@"/frame"])
  {
    uint64_t v23 = 2;
  }
  else if ([v22 isEqual:@"/search"])
  {
    uint64_t v23 = 3;
  }
  else if ([v22 isEqual:@"/place"])
  {
    uint64_t v23 = 4;
  }
  else if ([v22 isEqual:@"/look-around"])
  {
    uint64_t v23 = 5;
  }
  else if ([v22 isEqual:@"/guides"])
  {
    uint64_t v23 = 6;
  }
  else if ([v22 isEqual:@"/report-a-problem"])
  {
    uint64_t v23 = 7;
  }
  else
  {
    uint64_t v23 = 0;
  }
  v316 = v22;
  v317 = v19;

  v4->_int64_t actionType = v23;
  long long v340 = 0u;
  long long v341 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  id v29 = v20;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v340 objects:v346 count:16];
  v328 = v29;
  if (!v30)
  {
    v320 = 0;
    v321 = 0;
    v319 = 0;
    v323 = 0;
    id v327 = 0;
    v330 = 0;
    goto LABEL_325;
  }
  uint64_t v31 = v30;
  BOOL v315 = v3;
  v320 = 0;
  v321 = 0;
  v319 = 0;
  v323 = 0;
  id v327 = 0;
  uint64_t v32 = *(void *)v341;
  p_directionsSourceAddressString = (id *)&v4->_directionsSourceAddressString;
  p_offlineDownloadRegion = (id *)&v4->_offlineDownloadRegion;
  p_sourceLocationQueryItem = (id *)&v4->_sourceLocationQueryItem;
  location = (id *)&v4->_searchQuery;
  v330 = 0;
  double v33 = -180.0;
  float v34 = 2.0;
  uint64_t v331 = *(void *)v341;
  do
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v341 != v32) {
        objc_enumerationMutation(v29);
      }
      v36 = *(void **)(*((void *)&v340 + 1) + 8 * v35);
      v37 = [v36 name];
      v38 = [v37 lowercaseString];

      v39 = [v36 value];
      v40 = v39;
      if (v39 && [v39 length])
      {
        if ([v38 isEqualToString:@"label"])
        {
          v41 = objc_msgSend(v36, "_geo_unescapedValue");
          if ([v41 length])
          {
            uint64_t v42 = [v41 copy];
            label = v4->_label;
            v4->_label = (NSString *)v42;

            v44 = [(GEOMapURLParser *)v4 locationQueryItem];
            [v44 setName:v41];

            uint64_t v32 = v331;
          }
        }
        if ([v38 isEqualToString:@"trackingmode"])
        {
          v4->_trackingModeSpecified = 1;
          v4->_trackingMode = [(GEOMapURLParser *)v4 _trackingModeFromQueryItemValue:v40];
          goto LABEL_48;
        }
        if ([v38 isEqualToString:@"t"])
        {
          v4->_mapType = [(GEOMapURLParser *)v4 _mapTypeFromQueryItemValue:v40];
          goto LABEL_48;
        }
        if ([v38 isEqualToString:@"q"])
        {
          v45 = objc_msgSend(v36, "_geo_unescapedValue");
          v46 = (GEOMapItemIdentifier *)[v45 copy];

          objc_storeStrong(location, v46);
          [(GEOMapURLParser *)v4 _coordinateFromQueryValue:v46];
          if (v48 < v33 || (double v49 = v48, v48 > 180.0) || (v50 = v47, v47 < -90.0) || v47 > 90.0)
          {
            v51 = [(GEOMapURLParser *)v4 locationQueryItem];
            [(GEOMapItemIdentifier *)v51 setName:v46];
          }
          else
          {
            v51 = [(GEOMapURLParser *)v4 locationQueryItem];
            -[GEOMapItemIdentifier setCoordinate:](v51, "setCoordinate:", v50, v49);
          }
LABEL_46:

          goto LABEL_47;
        }
        if (([v38 isEqualToString:@"near"] & 1) != 0
          || [v38 isEqualToString:@"hnear"])
        {
          v52 = [v36 value];
          uint64_t v53 = [v52 componentsSeparatedByString:@","];

          v330 = (void *)v53;
          goto LABEL_48;
        }
        if ([v38 isEqualToString:@"ll"])
        {
          v54 = [v36 value];
          uint64_t v55 = [v54 componentsSeparatedByString:@","];

          [(GEOMapURLParser *)v4 _coordinateFromComponents:v55];
          if (v57 >= v33)
          {
            double v58 = v57;
            if (v57 <= 180.0)
            {
              double v59 = v56;
              if (v56 >= -90.0 && v56 <= 90.0)
              {
                v60 = [(GEOMapURLParser *)v4 locationQueryItem];
                objc_msgSend(v60, "setCoordinate:", v59, v58);

                if (v4->_searchUID >= 2)
                {
                  v61 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", v4->_searchUID, v4->_searchProviderID, v59, v58);
                  v62 = [(GEOMapURLParser *)v4 locationQueryItem];
                  [v62 setMapItemIdentifier:v61];

                  uint64_t v32 = v331;
                }
              }
            }
          }
          id v327 = (id)v55;
        }
        else
        {
          if ([v38 isEqualToString:@"z"])
          {
            v46 = [v36 value];
            if ([(GEOMapItemIdentifier *)v46 length])
            {
              [(GEOMapItemIdentifier *)v46 floatValue];
              float v64 = v63;
              float v65 = 31.0;
              if (v64 < 31.0) {
                [(GEOMapItemIdentifier *)v46 floatValue];
              }
              if (v65 < v34) {
                float v65 = v34;
              }
              v4->_zoomLevel = v65;
            }
            goto LABEL_47;
          }
          if ([v38 isEqualToString:@"cd"])
          {
            v46 = [v36 value];
            if ([(GEOMapItemIdentifier *)v46 length])
            {
              [(GEOMapItemIdentifier *)v46 floatValue];
              v4->_cameraDistance = v66;
            }
            goto LABEL_47;
          }
          if ([v38 isEqualToString:@"spn"])
          {
            v67 = [v36 value];
            uint64_t v68 = [v67 componentsSeparatedByString:@","];

            v323 = (void *)v68;
            goto LABEL_48;
          }
          if (v315)
          {
            if ([v38 isEqualToString:@"abpersonid"])
            {
              v46 = [v36 value];
              uint64_t v69 = [(GEOMapItemIdentifier *)v46 copy];
              abRecordID = v4->_abRecordID;
              v4->_abRecordID = (NSString *)v69;
LABEL_79:

              goto LABEL_47;
            }
            if ([v38 isEqualToString:@"abaddressid"])
            {
              v46 = [v36 value];
              uint64_t v71 = [(GEOMapItemIdentifier *)v46 copy];
              abRecordID = v4->_abAddressID;
              v4->_abAddressID = (NSString *)v71;
              goto LABEL_79;
            }
            if ([v38 isEqualToString:@"cncontactidentifier"])
            {
              v46 = [v36 value];
              uint64_t v72 = [(GEOMapItemIdentifier *)v46 copy];
              abRecordID = v4->_cnContactIdentifier;
              v4->_cnContactIdentifier = (NSString *)v72;
              goto LABEL_79;
            }
            if ([v38 isEqualToString:@"cnaddressidentifier"])
            {
              v46 = [v36 value];
              uint64_t v73 = [(GEOMapItemIdentifier *)v46 copy];
              abRecordID = v4->_cnAddressIdentifier;
              v4->_cnAddressIdentifier = (NSString *)v73;
              goto LABEL_79;
            }
          }
          if ([v38 isEqualToString:@"address"] && !v4->_actionType)
          {
            objc_msgSend(v36, "_geo_unescapedValue");
            v46 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
            if ([(GEOMapItemIdentifier *)v46 length])
            {
              uint64_t v90 = [(GEOMapItemIdentifier *)v46 copy];
              addressString = v4->_addressString;
              v4->_addressString = (NSString *)v90;

              v51 = [(GEOMapURLParser *)v4 locationQueryItem];
              [(GEOMapItemIdentifier *)v51 setAddress:v46];
              goto LABEL_46;
            }
            goto LABEL_47;
          }
          if ([v38 isEqualToString:@"saddr"])
          {
            v74 = objc_msgSend(v36, "_geo_unescapedValue");
            v75 = (void *)[v74 copy];

            objc_storeStrong(p_directionsSourceAddressString, v75);
            v76 = [[GEOURLLocationQueryItem alloc] initWithQueryItemValue:v75];
            v77 = [(GEOURLLocationQueryItem *)v76 resolvedLocation];

            if (v77) {
              objc_storeStrong(p_sourceLocationQueryItem, v76);
            }
            if (v4->_transportType == 4 && [*p_directionsSourceAddressString length]) {
              v4->_transportType = -1;
            }

            goto LABEL_89;
          }
          if ([v38 isEqualToString:@"daddr"])
          {
            v78 = objc_msgSend(v36, "_geo_unescapedValue");
            v79 = [v78 componentsSeparatedByString:@" to:"];

            if ([v79 count])
            {
              if (!v7) {
                id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              long long v338 = 0u;
              long long v339 = 0u;
              long long v336 = 0u;
              long long v337 = 0u;
              v311 = v79;
              obuint64_t j = v79;
              uint64_t v80 = [obj countByEnumeratingWithState:&v336 objects:v345 count:16];
              if (v80)
              {
                uint64_t v81 = v80;
                uint64_t v82 = *(void *)v337;
                do
                {
                  for (uint64_t i = 0; i != v81; ++i)
                  {
                    if (*(void *)v337 != v82) {
                      objc_enumerationMutation(obj);
                    }
                    v84 = *(void **)(*((void *)&v336 + 1) + 8 * i);
                    if ([v84 length])
                    {
                      id v85 = v7;
                      [v7 addObject:v84];
                      v86 = [[GEOURLLocationQueryItem alloc] initWithQueryItemValue:v84];
                      v87 = [(GEOURLLocationQueryItem *)v86 resolvedLocation];

                      if (v87) {
                        [v324 addObject:v86];
                      }

                      id v7 = v85;
                      id v29 = v328;
                    }
                  }
                  uint64_t v81 = [obj countByEnumeratingWithState:&v336 objects:v345 count:16];
                }
                while (v81);
              }

              BOOL v4 = v322;
              if (v322->_transportType == 4)
              {
                uint64_t v32 = v331;
                if ([v7 count]) {
                  v322->_transportType = -1;
                }
              }
              else
              {
                uint64_t v32 = v331;
              }
              v79 = v311;
            }
          }
          else if ([v38 isEqualToString:@"dirflg"])
          {
            v88 = [v36 value];
            int v89 = [v88 characterAtIndex:0];

            if (v89 > 113)
            {
              if (v89 == 114)
              {
                int v94 = 1;
              }
              else
              {
                if (v89 != 119) {
                  goto LABEL_48;
                }
                int v94 = 2;
              }
              goto LABEL_131;
            }
            if (v89 == 99)
            {
              int v94 = 3;
LABEL_131:
              v4->_transportType = v94;
              goto LABEL_48;
            }
            if (v89 == 100) {
              v4->_transportType = 0;
            }
          }
          else if ([v38 isEqualToString:@"sll"])
          {
            v92 = [v36 value];
            uint64_t v93 = [v92 componentsSeparatedByString:@","];

            v319 = (void *)v93;
          }
          else
          {
            if (![v38 isEqualToString:@"sspn"])
            {
              if ([v38 isEqualToString:@"placeid"])
              {
                objc_msgSend(v36, "_geo_unescapedValue");
                v46 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                if ([(GEOMapItemIdentifier *)v46 length])
                {
                  v51 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifierString:v46];
                  if ([(GEOMapItemIdentifier *)v51 isValid])
                  {
                    v4->_searchUID = [(GEOMapItemIdentifier *)v51 muid];
                    [(GEOMapURLParser *)v4 locationQueryItem];
                    v98 = id v97 = v7;
                    [v98 setMapItemIdentifier:v51];

                    id v7 = v97;
                    id v29 = v328;
                  }
                  else
                  {
                    v4->_searchUID = 1;
                  }
                  goto LABEL_46;
                }
LABEL_47:

                goto LABEL_48;
              }
              if ([v38 isEqualToString:@"lsp"])
              {
                id v99 = [v36 value];
                v4->_searchProviderID = [v99 intValue];
LABEL_136:

                [(GEOMapURLParser *)v4 _coordinateFromComponents:v327];
                v46 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", v4->_searchUID, v4->_searchProviderID, v100, v101);
                v51 = [(GEOMapURLParser *)v4 locationQueryItem];
                [(GEOMapItemIdentifier *)v51 setMapItemIdentifier:v46];
                goto LABEL_46;
              }
              if ([v38 isEqualToString:@"auid"])
              {
                id v99 = [v36 value];
                v4->_searchUID = strtoull((const char *)[v99 UTF8String], 0, 0);
                goto LABEL_136;
              }
              if ([v38 isEqualToString:@"cp"])
              {
                objc_msgSend(v36, "_geo_unescapedValue");
                v46 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                if (![(GEOMapItemIdentifier *)v46 length]) {
                  goto LABEL_47;
                }
                uint64_t v102 = [(GEOMapItemIdentifier *)v46 copy];
                abRecordID = v4->_contentProvider;
                v4->_contentProvider = (NSString *)v102;
                goto LABEL_79;
              }
              if ([v38 isEqualToString:@"cpid"])
              {
                objc_msgSend(v36, "_geo_unescapedValue");
                v46 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                if (![(GEOMapItemIdentifier *)v46 length]) {
                  goto LABEL_47;
                }
                uint64_t v103 = [(GEOMapItemIdentifier *)v46 copy];
                abRecordID = v4->_contentProviderID;
                v4->_contentProviderID = (NSString *)v103;
                goto LABEL_79;
              }
              id v310 = v7;
              double obja = v33;
              uint64_t v309 = _D10;
              if ([v38 isEqualToString:@"user_session_entity"])
              {
                v104 = v4->_userSessionEntity;
                if (!v104)
                {
                  v105 = objc_alloc_init(GEOUserSessionEntity);
                  v106 = v4->_userSessionEntity;
                  v4->_userSessionEntity = v105;

                  v104 = v4->_userSessionEntity;
                }
                v107 = [v36 value];
                [(GEOUserSessionEntity *)v104 updateWithSessionEntityString:v107];

                goto LABEL_148;
              }
              v108 = +[GEOResourceManifestManager modernManager];
              int v109 = [v108 isMuninEnabled];

              if (v109 && [&unk_1ED73EC38 containsObject:v38])
              {
                uint64_t v110 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"_mvs" compressedKey:@"_mvsc"];
                muninViewState = v322->_muninViewState;
                v322->_muninViewState = (GEOMuninViewState *)v110;
              }
              if ([v38 isEqualToString:@"cam"])
              {
                v112 = [v36 value];
                uint64_t v113 = [v112 componentsSeparatedByString:@","];

                v320 = (void *)v113;
LABEL_222:
                _D10 = v309;
                double v33 = obja;
                float v34 = 2.0;
                id v7 = v310;
                BOOL v4 = v322;
              }
              else
              {
                if ([v38 isEqualToString:@"lineid"])
                {
                  v114 = [v36 value];
                  v322->_lineMUID = [v114 longLongValue];
                }
                if ([v38 isEqualToString:@"name"] && !v322->_actionType)
                {
                  v115 = objc_msgSend(v36, "_geo_unescapedValue");
                  if ([v115 length])
                  {
                    uint64_t v116 = [v115 copy];
                    v117 = v322->_lineName;
                    v322->_lineName = (NSString *)v116;
                  }
                }
                if ([v38 isEqualToString:@"showfavorites"])
                {
                  objc_msgSend(v36, "_geo_unescapedValue");
                  id v118 = (id)objc_claimAutoreleasedReturnValue();
                  if ([v118 isEqual:@"pl"])
                  {
                    uint64_t v119 = 1;
                  }
                  else if ([v118 isEqual:@"tl"])
                  {
                    uint64_t v119 = 2;
                  }
                  else
                  {
                    uint64_t v119 = 0;
                  }

                  v322->_favoritesType = v119;
                }
                if ([v38 isEqualToString:@"tester"])
                {
                  v120 = [v36 value];
                  char v121 = [v120 isEqualToString:@"tester"];

                  if (v121)
                  {
                    v322->_tester = 1;

                    v283 = v328;
                    BOOL v6 = v318;
                    v221 = v324;
                    id v7 = v310;
                    v216 = v317;
                    v224 = v319;
                    v225 = v320;
                    goto LABEL_413;
                  }
                }
                if ([&unk_1ED73EC50 containsObject:v38])
                {
                  uint64_t v122 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"_ext" compressedKey:@"_extc"];
                  extraStorage = v322->_extraStorage;
                  v322->_extraStorage = (GEOURLExtraStorage *)v122;
                }
                if ([&unk_1ED73EC68 containsObject:v38])
                {
                  uint64_t v124 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"_col" compressedKey:@"_colc"];
                  collectionStorage = v322->_collectionStorage;
                  v322->_collectionStorage = (GEOURLCollectionStorage *)v124;
                }
                if ([v38 isEqualToString:@"ug"])
                {
                  uint64_t v126 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"ug" compressedKey:0];
                  v127 = v322->_collectionStorage;
                  v322->_collectionStorage = (GEOURLCollectionStorage *)v126;
                }
                if ([v38 isEqualToString:@"pg"])
                {
                  id v128 = [v36 value];
                  v322->_curatedCollectionMUID = strtoull((const char *)[v128 UTF8String], 0, 0);
                }
                if ([v38 isEqualToString:@"pp"])
                {
                  id v129 = [v36 value];
                  v322->_publisherMUID = strtoull((const char *)[v129 UTF8String], 0, 0);
                }
                if ([&unk_1ED73EC80 containsObject:v38])
                {
                  v130 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"_ei" compressedKey:@"_eic"];
                  if (v130)
                  {
                    v131 = [[GEOEnrichmentInfo alloc] initWithEnrichmentInfo:v130];
                    enrichmentInfo = v322->_enrichmentInfo;
                    v322->_enrichmentInfo = v131;
                  }
                }
                if ([v38 isEqualToString:@"_odr"])
                {
                  v133 = [v36 value];
                  v134 = [v133 componentsSeparatedByString:@","];

                  if ([v134 count] == 4)
                  {
                    v135 = [v134 objectAtIndex:0];
                    [v135 doubleValue];
                    double v137 = v136;
                    v138 = [v134 objectAtIndex:1];
                    [v138 doubleValue];
                    double v140 = v139;

                    v141 = [v134 objectAtIndex:2];
                    [v141 doubleValue];
                    double v143 = v142;
                    v144 = [v134 objectAtIndex:3];
                    [v144 doubleValue];
                    double v146 = v145;

                    if (v140 >= obja
                      && v140 <= 180.0
                      && v137 >= -90.0
                      && v137 <= 90.0
                      && v146 >= obja
                      && v146 <= 180.0
                      && v143 >= -90.0
                      && v143 <= 90.0)
                    {
                      v147 = objc_alloc_init(GEOMapRegion);
                      [(GEOMapRegion *)v147 setNorthLat:v137];
                      [(GEOMapRegion *)v147 setWestLng:v140];
                      [(GEOMapRegion *)v147 setSouthLat:v143];
                      [(GEOMapRegion *)v147 setEastLng:v146];
                      objc_storeStrong(p_offlineDownloadRegion, v147);
                    }
                  }
                }
                switch(v322->_actionType)
                {
                  case 1:
                    if ([v38 isEqualToString:@"destination"])
                    {
                      v151 = objc_msgSend(v36, "_geo_unescapedValue");
                      v152 = +[GEOURLLocationQueryItem locationQueryItemsWithValue:v151];
                      v148 = [v152 firstObject];

                      v153 = [(GEOMapItemIdentifier *)v148 resolvedLocation];

                      if (v153)
                      {
                        if (!v310) {
                          id v310 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        }
                        v154 = [(GEOMapItemIdentifier *)v148 resolvedLocation];
                        [v310 addObject:v154];

                        [v324 addObject:v148];
                      }
                      if (v322->_transportType == 4) {
                        goto LABEL_207;
                      }
                      goto LABEL_221;
                    }
                    if ([v38 isEqualToString:@"waypoints"])
                    {
                      v159 = objc_msgSend(v36, "_geo_unescapedValue");
                      v160 = +[GEOURLLocationQueryItem locationQueryItemsWithValue:v159];
                      v161 = (void *)[v160 mutableCopy];

                      if ([v161 count])
                      {
                        id v308 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        long long v332 = 0u;
                        long long v333 = 0u;
                        long long v334 = 0u;
                        long long v335 = 0u;
                        id v162 = v161;
                        uint64_t v163 = [v162 countByEnumeratingWithState:&v332 objects:v344 count:16];
                        if (v163)
                        {
                          uint64_t v164 = v163;
                          uint64_t v165 = *(void *)v333;
                          do
                          {
                            for (uint64_t j = 0; j != v164; ++j)
                            {
                              if (*(void *)v333 != v165) {
                                objc_enumerationMutation(v162);
                              }
                              v167 = [*(id *)(*((void *)&v332 + 1) + 8 * j) resolvedLocation];
                              if ([v167 length]) {
                                [v308 addObject:v167];
                              }
                            }
                            uint64_t v164 = [v162 countByEnumeratingWithState:&v332 objects:v344 count:16];
                          }
                          while (v164);
                        }

                        if ([v310 count]) {
                          [v308 addObjectsFromArray:v310];
                        }
                        if ([v324 count]) {
                          [v162 addObjectsFromArray:v324];
                        }
                        uint64_t v168 = [v308 mutableCopy];

                        uint64_t v169 = [v162 mutableCopy];
                        if (v322->_transportType == 4) {
                          v322->_transportType = -1;
                        }

                        v324 = (void *)v169;
                        id v310 = (id)v168;
                      }

                      goto LABEL_222;
                    }
                    if ([v38 isEqualToString:@"source"])
                    {
                      v179 = objc_msgSend(v36, "_geo_unescapedValue");
                      v180 = +[GEOURLLocationQueryItem locationQueryItemsWithValue:v179];
                      v148 = [v180 firstObject];

                      v181 = [(GEOMapItemIdentifier *)v148 resolvedLocation];

                      if (v181)
                      {
                        uint64_t v182 = [(GEOMapItemIdentifier *)v148 resolvedLocation];
                        id v183 = *p_directionsSourceAddressString;
                        id *p_directionsSourceAddressString = (id)v182;

                        objc_storeStrong(p_sourceLocationQueryItem, v148);
                      }
                      if (v322->_transportType == 4 && [*p_directionsSourceAddressString length])
                      {
LABEL_207:
                        v322->_transportType = -1;
                        goto LABEL_221;
                      }
                      goto LABEL_221;
                    }
                    if (![v38 isEqualToString:@"mode"])
                    {
                      if ([v38 isEqualToString:@"avoid"])
                      {
                        v198 = objc_msgSend(v36, "_geo_unescapedValue");
                        v148 = [v198 componentsSeparatedByString:@","];

                        if ([(GEOMapItemIdentifier *)v148 count])
                        {
                          directionsOptions = v322->_directionsOptions;
                          if (!directionsOptions)
                          {
                            v200 = objc_alloc_init(GEOURLDirectionsOptions);
                            v201 = v322->_directionsOptions;
                            v322->_directionsOptions = v200;

                            directionsOptions = v322->_directionsOptions;
                          }
                          [(GEOURLDirectionsOptions *)directionsOptions setAvoidOptions:v148];
                        }
LABEL_221:

                        goto LABEL_222;
                      }
                      if ([v38 isEqualToString:@"transit-preferences"])
                      {
                        v204 = objc_msgSend(v36, "_geo_unescapedValue");
                        v148 = [v204 componentsSeparatedByString:@","];

                        if ([(GEOMapItemIdentifier *)v148 count])
                        {
                          v205 = v322->_directionsOptions;
                          if (!v205)
                          {
                            v206 = objc_alloc_init(GEOURLDirectionsOptions);
                            v207 = v322->_directionsOptions;
                            v322->_directionsOptions = v206;

                            v205 = v322->_directionsOptions;
                          }
                          [(GEOURLDirectionsOptions *)v205 setTransitOptions:v148];
                        }
                        goto LABEL_221;
                      }
                      if ([v38 isEqualToString:@"start"])
                      {
                        v211 = v322->_directionsOptions;
                        if (!v211)
                        {
                          v212 = objc_alloc_init(GEOURLDirectionsOptions);
                          v213 = v322->_directionsOptions;
                          v322->_directionsOptions = v212;

                          v211 = v322->_directionsOptions;
                        }
                        v186 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v40, "intValue"));
                        [(GEOURLDirectionsOptions *)v211 setNavigationAutoLaunchDelay:v186];
LABEL_309:
                      }
                      goto LABEL_222;
                    }
                    if ([v40 isEqualToString:@"driving"])
                    {
                      BOOL v4 = v322;
                      v322->_transportType = 0;
                      break;
                    }
                    if ([v40 isEqualToString:@"walking"])
                    {
                      BOOL v4 = v322;
                      int v203 = 2;
                    }
                    else if ([v40 isEqualToString:@"transit"])
                    {
                      BOOL v4 = v322;
                      int v203 = 1;
                    }
                    else
                    {
                      if (![v40 isEqualToString:@"cycling"]) {
                        goto LABEL_222;
                      }
                      BOOL v4 = v322;
                      int v203 = 3;
                    }
                    v4->_transportType = v203;
                    break;
                  case 2:
                    if ([v38 isEqualToString:@"center"])
                    {
                      uint64_t v155 = [v40 componentsSeparatedByString:@","];

                      id v327 = (id)v155;
                      goto LABEL_222;
                    }
                    if ([v38 isEqualToString:@"span"])
                    {
                      uint64_t v170 = [v40 componentsSeparatedByString:@","];

                      v323 = (void *)v170;
                      goto LABEL_222;
                    }
                    if ([v38 isEqualToString:@"map"]) {
                      goto LABEL_263;
                    }
                    v322->_trackingModeSpecified = 1;
                    if ([v38 isEqualToString:@"mode"])
                    {
                      BOOL v4 = v322;
                      v322->_trackingMode = [(GEOMapURLParser *)v322 _trackingModeFromQueryItemValue:v40];
                      break;
                    }
                    if ([v38 isEqualToString:@"pitch"])
                    {
                      [v40 floatValue];
                      BOOL v4 = v322;
                      v322->_tilt = v202;
                      break;
                    }
                    if ([v38 isEqualToString:@"heading"])
                    {
                      [v40 floatValue];
                      BOOL v4 = v322;
                      v322->_rotation = v208;
                      break;
                    }
                    if (![v38 isEqualToString:@"distance"]
                      || ![v40 length])
                    {
                      goto LABEL_222;
                    }
                    [v40 floatValue];
                    BOOL v4 = v322;
                    v322->_cameraDistance = v214;
                    break;
                  case 3:
                    if ([v38 isEqualToString:@"center"])
                    {
                      uint64_t v156 = [v40 componentsSeparatedByString:@","];

                      v319 = (void *)v156;
                      goto LABEL_222;
                    }
                    if ([v38 isEqualToString:@"span"])
                    {
                      uint64_t v171 = [v40 componentsSeparatedByString:@","];

                      v321 = (void *)v171;
                      goto LABEL_222;
                    }
                    if (![v38 isEqualToString:@"query"]) {
                      goto LABEL_222;
                    }
                    objc_msgSend(v36, "_geo_unescapedValue");
                    v148 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                    uint64_t v184 = [(GEOMapItemIdentifier *)v148 copy];
                    id v185 = *location;
                    id *location = (id)v184;

                    goto LABEL_221;
                  case 4:
                    if ([v38 isEqualToString:@"place-id"])
                    {
                      v148 = [v40 lowercaseString];
                      if ([(GEOMapItemIdentifier *)v148 isEqualToString:@"parked-car"])
                      {
                        v322->_showParkedCar = 1;
                        goto LABEL_221;
                      }
                      if ([(GEOMapItemIdentifier *)v148 isEqualToString:@"my-location"])
                      {
                        v322->_showMyLocationCard = 1;
                        goto LABEL_221;
                      }
                      v150 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifierString:v40];
                      if ([(GEOMapItemIdentifier *)v150 isValid])
                      {
                        v322->_searchUID = [(GEOMapItemIdentifier *)v150 muid];
                        v193 = [(GEOMapURLParser *)v322 locationQueryItem];
                        [v193 setMapItemIdentifier:v150];
                      }
                      goto LABEL_220;
                    }
                    if ([v38 isEqualToString:@"address"])
                    {
                      objc_msgSend(v36, "_geo_unescapedValue");
                      v148 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                      if (![(GEOMapItemIdentifier *)v148 length]) {
                        goto LABEL_221;
                      }
                      uint64_t v172 = [(GEOMapItemIdentifier *)v148 copy];
                      v173 = v322->_addressString;
                      v322->_addressString = (NSString *)v172;

                      v149 = v322;
                      goto LABEL_200;
                    }
                    if ([v38 isEqualToString:@"coordinate"])
                    {
                      v186 = [v40 componentsSeparatedByString:@","];
                      [(GEOMapURLParser *)v322 _coordinateFromQueryValue:v40];
                      double v189 = v187;
                      if (v188 >= obja)
                      {
                        double v190 = v188;
                        if (v188 <= 180.0 && v187 >= -90.0 && v187 <= 90.0)
                        {
                          if (*location)
                          {
                            id v191 = v186;
                            id v192 = v327;
                            id v327 = v191;
                          }
                          else
                          {
                            uint64_t v209 = objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", *(void *)&v187, *(void *)&v188);
                            id v192 = *location;
                            id *location = (id)v209;
                          }

                          v210 = [(GEOMapURLParser *)v322 locationQueryItem];
                          objc_msgSend(v210, "setCoordinate:", v189, v190);
                        }
                      }
                      goto LABEL_309;
                    }
                    if ([v38 isEqualToString:@"name"])
                    {
                      if (*location)
                      {
                        uint64_t v194 = [*location componentsSeparatedByString:@","];

                        id v327 = (id)v194;
                      }
                      objc_msgSend(v36, "_geo_unescapedValue");
                      id v174 = (id)objc_claimAutoreleasedReturnValue();
                      uint64_t v195 = [v174 copy];
                      BOOL v4 = v322;
                      searchQuery = v322->_searchQuery;
                      v322->_searchQuery = (NSString *)v195;

                      v197 = [(GEOMapURLParser *)v322 locationQueryItem];
                      [v197 setName:v174];

                      goto LABEL_288;
                    }
                    if ([v38 isEqualToString:@"map"])
                    {
LABEL_263:
                      BOOL v4 = v322;
                      v322->_mapType = [(GEOMapURLParser *)v322 _mapTypeFromQueryItemValue:v40];
                      break;
                    }
                    goto LABEL_222;
                  case 5:
                  case 7:
                    if ([v38 isEqualToString:@"address"])
                    {
                      objc_msgSend(v36, "_geo_unescapedValue");
                      v148 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
                      if (![(GEOMapItemIdentifier *)v148 length]) {
                        goto LABEL_221;
                      }
                      v149 = v322;
LABEL_200:
                      v150 = [(GEOMapURLParser *)v149 locationQueryItem];
                      [(GEOMapItemIdentifier *)v150 setAddress:v148];
LABEL_220:

                      goto LABEL_221;
                    }
                    if ([v38 isEqualToString:@"place-id"])
                    {
                      v148 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifierString:v40];
                      if (![(GEOMapItemIdentifier *)v148 isValid]) {
                        goto LABEL_221;
                      }
                      v150 = [(GEOMapURLParser *)v322 locationQueryItem];
                      [(GEOMapItemIdentifier *)v150 setMapItemIdentifier:v148];
                      goto LABEL_220;
                    }
                    if (![v38 isEqualToString:@"coordinate"]) {
                      goto LABEL_222;
                    }
                    BOOL v4 = v322;
                    [(GEOMapURLParser *)v322 _coordinateFromQueryValue:v40];
                    double v176 = v175;
                    double v178 = v177;
                    id v174 = [(GEOMapURLParser *)v322 locationQueryItem];
                    objc_msgSend(v174, "setCoordinate:", v176, v178);
LABEL_288:

                    break;
                  case 6:
                    if ([v38 isEqualToString:@"user"])
                    {
                      BOOL v4 = v322;
                      uint64_t v157 = [(GEOMapURLParser *)v322 restoreCodableOfClass:objc_opt_class() queryItem:v36 key:@"user" compressedKey:0];
                      v158 = v322->_collectionStorage;
                      v322->_collectionStorage = (GEOURLCollectionStorage *)v157;

                      break;
                    }
                    if ([v38 isEqualToString:@"curated"])
                    {
                      id v174 = [v36 value];
                      BOOL v4 = v322;
                      v322->_curatedCollectionMUID = strtoull((const char *)[v174 UTF8String], 0, 0);
                      goto LABEL_288;
                    }
                    if ([v38 isEqualToString:@"publisher"])
                    {
                      id v174 = [v36 value];
                      BOOL v4 = v322;
                      v322->_publisherMUID = strtoull((const char *)[v174 UTF8String], 0, 0);
                      goto LABEL_288;
                    }
                    if (![v38 isEqualToString:@"_provider"]) {
                      goto LABEL_222;
                    }
                    id v174 = [v36 value];
                    BOOL v4 = v322;
                    v322->_searchProviderID = [v174 intValue];
                    goto LABEL_288;
                  default:
                    goto LABEL_222;
                }
LABEL_148:
                _D10 = v309;
                double v33 = obja;
                float v34 = 2.0;
                id v7 = v310;
              }
              id v29 = v328;
LABEL_89:
              uint64_t v32 = v331;
              goto LABEL_48;
            }
            v95 = [v36 value];
            uint64_t v96 = [v95 componentsSeparatedByString:@","];

            v321 = (void *)v96;
          }
        }
      }
LABEL_48:

      ++v35;
    }
    while (v35 != v31);
    uint64_t v215 = [v29 countByEnumeratingWithState:&v340 objects:v346 count:16];
    uint64_t v31 = v215;
  }
  while (v215);
LABEL_325:

  v216 = v317;
  v217 = [v317 host];
  v218 = [v217 lowercaseString];
  if ([v218 isEqualToString:@"guides.apple.com"])
  {
    v219 = [v317 path];
    char v220 = [v219 hasPrefix:@"/all"];

    BOOL v6 = v318;
    v221 = v324;
    if (v220)
    {
      uint64_t v222 = 360;
      v223 = v322;
      v224 = v319;
      v225 = v320;
      goto LABEL_336;
    }
  }
  else
  {

    BOOL v6 = v318;
    v221 = v324;
  }
  v223 = v322;
  int64_t actionType = v322->_actionType;
  v225 = v320;
  if (actionType == 6)
  {
    if ([v328 count])
    {
      int64_t actionType = v322->_actionType;
      goto LABEL_332;
    }
    uint64_t v222 = 360;
    v224 = v319;
LABEL_336:
    *((unsigned char *)&v223->super.isa + v222) = 1;
  }
  else
  {
LABEL_332:
    v224 = v319;
    if (actionType == 7 && ![v328 count])
    {
      uint64_t v222 = 339;
      goto LABEL_336;
    }
  }
  v227 = [v317 path];
  int v228 = [v227 isEqualToString:@"/car/destinations"];

  if (v228) {
    v223->_showCarDestinations = 1;
  }
  uint64_t v229 = [v327 count];
  v223->_exactPositionSpecified = v229 == 2;
  if (v229 != 2)
  {
    v230 = v223->_searchQuery;
    if (!v230) {
      goto LABEL_348;
    }
    v231 = [(NSString *)v230 componentsSeparatedByString:@"@"];
    if ([v231 count] == 2)
    {
      v232 = [v231 objectAtIndex:1];
      v233 = [v232 componentsSeparatedByString:@","];

      v223->_exactPositionSpecified = [v233 count] == 2;
      id v327 = v233;
      v224 = v319;
    }

    if (!v223->_exactPositionSpecified) {
      goto LABEL_348;
    }
  }
  v234 = [v327 objectAtIndex:0];
  [v234 doubleValue];
  double v236 = v235;
  v237 = [v327 objectAtIndex:1];
  [v237 doubleValue];
  v223->_centerCoordinate.double latitude = v236;
  v223->_centerCoordinate.double longitude = v238;

  if (v223->_zoomLevel == -1.0 && [v323 count] == 2)
  {
    v239 = [v323 objectAtIndex:0];
    [v239 doubleValue];
    double v241 = v240;
    v242 = [v323 objectAtIndex:1];
    [v242 doubleValue];
    v223->_span.latitudeDelta = v241;
    v223->_span.longitudeDelta = v243;
  }
  if (!v223->_exactPositionSpecified) {
LABEL_348:
  }
    *(void *)&v223->_zoomLevel = _D10;
  if ([v224 count] != 2)
  {
    v244 = [(NSString *)v223->_searchQuery componentsSeparatedByString:@"@"];
    if ([v244 count] == 2)
    {
      v245 = [v244 objectAtIndex:1];
      uint64_t v246 = [v245 componentsSeparatedByString:@","];
      v247 = v224;
      v224 = (void *)v246;

      v248 = [v244 objectAtIndex:0];
      uint64_t v249 = [v248 copy];
      v250 = v223->_searchQuery;
      v223->_searchQuery = (NSString *)v249;
    }
    if ([v224 count] != 2)
    {
      id v251 = v330;

      v224 = v251;
    }
  }
  if ([v224 count] == 2)
  {
    v252 = [v224 objectAtIndex:0];
    v253 = [v224 objectAtIndex:1];
    [v252 doubleValue];
    double v255 = v254;
    [v253 doubleValue];
    v223->_searchCoordinate.double latitude = v255;
    v223->_searchCoordinate.double longitude = v256;
    if ([v321 count] == 2)
    {
      [v321 objectAtIndex:0];
      v258 = v257 = v224;
      [v258 doubleValue];
      double v260 = v259;
      v261 = [v321 objectAtIndex:1];
      [v261 doubleValue];
      double v263 = v262;

      v225 = v320;
      v223 = v322;

      v224 = v257;
      v322->_searchRegion.center = v322->_searchCoordinate;
      v322->_searchRegion.span.latitudeDelta = v260;
      v322->_searchRegion.span.longitudeDelta = v263;
    }
  }
  if ([v225 count] == 3)
  {
    v264 = [v225 objectAtIndex:0];
    [v264 doubleValue];
    v223->_rotation = v265;

    v266 = [v225 objectAtIndex:1];
    [v266 doubleValue];
    v223->_tilt = v267;

    v268 = [v225 objectAtIndex:2];
    [v268 doubleValue];
    v223->_roll = v269;
    goto LABEL_363;
  }
  if ([v225 count] == 4)
  {
    v270 = [v225 objectAtIndex:0];
    [v270 doubleValue];
    v223->_altitude = v271;

    v272 = [v225 objectAtIndex:1];
    [v272 doubleValue];
    v223->_rotation = v273;

    v274 = [v225 objectAtIndex:2];
    [v274 doubleValue];
    v223->_tilt = v275;

    v276 = [v225 objectAtIndex:3];
    [v276 doubleValue];
    v223->_roll = v277;

    v268 = [v225 objectAtIndex:0];
    [v268 floatValue];
    v223->_cameraDistance = v278;
LABEL_363:
  }
  if ([v7 count])
  {
    uint64_t v279 = [v7 copy];
    directionsDestinationAddressStrings = v223->_directionsDestinationAddressStrings;
    v223->_directionsDestinationAddressStrings = (NSArray *)v279;
  }
  if ([v221 count])
  {
    uint64_t v281 = [v221 copy];
    directionsLocationQueryItems = v223->_directionsLocationQueryItems;
    v223->_directionsLocationQueryItems = (NSArray *)v281;
  }
  if (v223->_actionType)
  {
    v283 = v328;
    goto LABEL_413;
  }
  v284 = v224;
  if ([(NSArray *)v223->_directionsLocationQueryItems count])
  {
    BOOL v285 = 1;
  }
  else
  {
    v286 = [(GEOURLLocationQueryItem *)v223->_sourceLocationQueryItem resolvedLocation];
    BOOL v285 = v286 != 0;
  }
  [(GEOURLLocationQueryItem *)v223->_locationQueryItem coordinate];
  BOOL v289 = 0;
  if (v288 >= -180.0 && v288 <= 180.0 && v287 >= -90.0 && v287 <= 90.0)
  {
    v290 = [(GEOURLLocationQueryItem *)v223->_locationQueryItem name];
    BOOL v289 = v290 != 0;
  }
  if ([(NSString *)v223->_searchQuery length])
  {
    [(GEOURLLocationQueryItem *)v223->_locationQueryItem coordinate];
    BOOL v293 = v292 >= -180.0;
    if (v292 > 180.0) {
      BOOL v293 = 0;
    }
    if (v291 < -90.0) {
      BOOL v293 = 0;
    }
    BOOL v294 = v291 <= 90.0 && v293;
  }
  else
  {
    BOOL v294 = 0;
  }
  v295 = [(GEOURLLocationQueryItem *)v223->_locationQueryItem address];
  if (v295)
  {
    int v296 = 1;
  }
  else
  {
    v297 = [(GEOURLLocationQueryItem *)v223->_locationQueryItem mapItemIdentifier];
    if (v297) {
      int v298 = 1;
    }
    else {
      int v298 = v289;
    }
    int v296 = v298 | v294;
  }
  BOOL v299 = v223->_collectionStorage
      || v223->_curatedCollectionMUID
      || v223->_publisherMUID
      || v223->_showAllCuratedCollections;
  v300 = v223->_muninViewState;
  uint64_t v301 = [(NSString *)v223->_searchQuery length];
  double longitude = v223->_centerCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (double latitude = v322->_centerCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v283 = v328;
    if (v322->_trackingModeSpecified)
    {
      BOOL v304 = 1;
      if (!v285) {
        goto LABEL_405;
      }
    }
    else
    {
      BOOL v304 = v322->_mapType != -1;
      if (!v285) {
        goto LABEL_405;
      }
    }
LABEL_402:
    uint64_t v305 = 1;
LABEL_411:
    v322->_int64_t actionType = v305;
    v225 = v320;
    goto LABEL_412;
  }
  BOOL v304 = 1;
  v283 = v328;
  if (v285) {
    goto LABEL_402;
  }
LABEL_405:
  if (v300)
  {
    uint64_t v305 = 5;
    goto LABEL_411;
  }
  if (v299)
  {
    uint64_t v305 = 6;
    goto LABEL_411;
  }
  v225 = v320;
  if (v296)
  {
    uint64_t v307 = 4;
    goto LABEL_420;
  }
  if (v301)
  {
    uint64_t v307 = 3;
LABEL_420:
    v322->_int64_t actionType = v307;
LABEL_412:
    v224 = v284;
    goto LABEL_413;
  }
  v224 = v284;
  if (v304) {
    v322->_int64_t actionType = 2;
  }
LABEL_413:

  return v6;
}

- (int)_mapTypeFromQueryItemValue:(id)a3
{
  BOOL v3 = [a3 lowercaseString];
  if (([v3 isEqualToString:@"m"] & 1) != 0
    || ([v3 isEqualToString:@"explore"] & 1) != 0)
  {
    int v4 = 0;
  }
  else if (([v3 isEqualToString:@"d"] & 1) != 0 {
         || ([v3 isEqualToString:@"driving"] & 1) != 0)
  }
  {
    int v4 = 4;
  }
  else if (([v3 isEqualToString:@"k"] & 1) != 0 {
         || ([v3 isEqualToString:@"satellite"] & 1) != 0)
  }
  {
    int v4 = 1;
  }
  else if (([v3 isEqualToString:@"r"] & 1) != 0 {
         || ([v3 isEqualToString:@"transit"] & 1) != 0)
  }
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"h"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (int)_trackingModeFromQueryItemValue:(id)a3
{
  id v3 = a3;
  int v4 = [v3 lowercaseString];
  if (([v3 isEqualToString:@"1"] & 1) != 0
    || ([v4 isEqualToString:@"follow"] & 1) != 0)
  {
    int v5 = 1;
  }
  else
  {
    int v5 = 2;
    if (([v3 isEqualToString:@"2"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"follow-with-heading"]) {
        int v5 = 2;
      }
      else {
        int v5 = 0;
      }
    }
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromQueryValue:(id)a3
{
  int v4 = [a3 componentsSeparatedByString:@","];
  [(GEOMapURLParser *)self _coordinateFromComponents:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 2)
  {
    int v4 = [v3 objectAtIndexedSubscript:0];
    [v4 doubleValue];
    unint64_t v6 = v5;

    double v7 = [v3 objectAtIndexedSubscript:1];
    [v7 doubleValue];
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v6 = 0xC066800000000000;
    unint64_t v9 = 0xC066800000000000;
  }

  double v10 = *(double *)&v6;
  double v11 = *(double *)&v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (GEOURLLocationQueryItem)locationQueryItem
{
  locationQueryItem = self->_locationQueryItem;
  if (!locationQueryItem)
  {
    int v4 = objc_alloc_init(GEOURLLocationQueryItem);
    unint64_t v5 = self->_locationQueryItem;
    self->_locationQueryItem = v4;

    locationQueryItem = self->_locationQueryItem;
  }

  return locationQueryItem;
}

- (id)restoreCodableOfClass:(Class)a3 queryItem:(id)a4 key:(id)a5 compressedKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = [v11 name];
  v13 = [v12 lowercaseString];

  v14 = [v11 value];

  if (!a3) {
    goto LABEL_8;
  }
  v15 = 0;
  if (![(objc_class *)a3 isSubclassOfClass:objc_opt_class()] || !v14) {
    goto LABEL_9;
  }
  if (![v14 length])
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  if ([v13 isEqualToString:v9])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
    v15 = (void *)[[a3 alloc] initWithData:v16];

    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (!v10) {
      goto LABEL_9;
    }
  }
  if ([v13 isEqualToString:v10])
  {
    uLongf v21 = 0;
    id v22 = 0;
    id v18 = (id) [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
    GEOZlibUncompress((const Bytef *)[v18 bytes], objc_msgSend(v18, "length"), &v22, &v21);
    if (v21)
    {
      v19 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v22 length:v21 freeWhenDone:1];
      uint64_t v20 = [[a3 alloc] initWithData:v19];

      v15 = (void *)v20;
    }
  }
LABEL_9:

  return v15;
}

- (NSString)directionsDestinationAddressString
{
  v2 = [(GEOMapURLParser *)self directionsDestinationAddressStrings];
  id v3 = [v2 lastObject];

  return (NSString *)v3;
}

- (GEOURLLocationQueryItem)destinationLocationQueryItem
{
  v2 = [(GEOMapURLParser *)self directionsLocationQueryItems];
  id v3 = [v2 lastObject];

  return (GEOURLLocationQueryItem *)v3;
}

- (int)mapType
{
  return self->_mapType;
}

- (int)transportType
{
  return self->_transportType;
}

- (int)trackingMode
{
  return self->_trackingMode;
}

- (BOOL)trackingModeSpecified
{
  return self->_trackingModeSpecified;
}

- (BOOL)exactPositionSpecified
{
  return self->_exactPositionSpecified;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)span
{
  double latitudeDelta = self->_span.latitudeDelta;
  double longitudeDelta = self->_span.longitudeDelta;
  result.var1 = longitudeDelta;
  result.var0 = latitudeDelta;
  return result;
}

- (float)zoomLevel
{
  return self->_zoomLevel;
}

- (float)cameraDistance
{
  return self->_cameraDistance;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (NSString)directionsSourceAddressString
{
  return self->_directionsSourceAddressString;
}

- (NSArray)directionsDestinationAddressStrings
{
  return self->_directionsDestinationAddressStrings;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (NSString)label
{
  return self->_label;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)searchCoordinate
{
  double latitude = self->_searchCoordinate.latitude;
  double longitude = self->_searchCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($140BDABED96B4E653C9F0DB440664A5C)searchRegion
{
  double latitude = self->_searchRegion.center.latitude;
  double longitude = self->_searchRegion.center.longitude;
  double latitudeDelta = self->_searchRegion.span.latitudeDelta;
  double longitudeDelta = self->_searchRegion.span.longitudeDelta;
  result.var1.var1 = longitudeDelta;
  result.var1.var0 = latitudeDelta;
  result.var0.var1 = longitude;
  result.var0.var0 = latitude;
  return result;
}

- (int)searchProviderID
{
  return self->_searchProviderID;
}

- (unint64_t)searchUID
{
  return self->_searchUID;
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (NSString)contentProviderID
{
  return self->_contentProviderID;
}

- (NSString)abRecordID
{
  return self->_abRecordID;
}

- (NSString)abAddressID
{
  return self->_abAddressID;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnAddressIdentifier
{
  return self->_cnAddressIdentifier;
}

- (GEOUserSessionEntity)userSessionEntity
{
  return self->_userSessionEntity;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)rotation
{
  return self->_rotation;
}

- (double)tilt
{
  return self->_tilt;
}

- (double)roll
{
  return self->_roll;
}

- (unint64_t)lineMUID
{
  return self->_lineMUID;
}

- (NSString)lineName
{
  return self->_lineName;
}

- (int64_t)favoritesType
{
  return self->_favoritesType;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (GEOURLDirectionsOptions)directionsOptions
{
  return self->_directionsOptions;
}

- (BOOL)tester
{
  return self->_tester;
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (GEOURLExtraStorage)extraStorage
{
  return self->_extraStorage;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (BOOL)showCarDestinations
{
  return self->_showCarDestinations;
}

- (BOOL)showParkedCar
{
  return self->_showParkedCar;
}

- (BOOL)showMyLocationCard
{
  return self->_showMyLocationCard;
}

- (BOOL)showReports
{
  return self->_showReports;
}

- (unint64_t)curatedCollectionMUID
{
  return self->_curatedCollectionMUID;
}

- (unint64_t)publisherMUID
{
  return self->_publisherMUID;
}

- (BOOL)showAllCuratedCollections
{
  return self->_showAllCuratedCollections;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (NSArray)directionsLocationQueryItems
{
  return self->_directionsLocationQueryItems;
}

- (GEOURLLocationQueryItem)sourceLocationQueryItem
{
  return self->_sourceLocationQueryItem;
}

- (GEOMapRegion)offlineDownloadRegion
{
  return self->_offlineDownloadRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDownloadRegion, 0);
  objc_storeStrong((id *)&self->_directionsLocationQueryItems, 0);
  objc_storeStrong((id *)&self->_sourceLocationQueryItem, 0);
  objc_storeStrong((id *)&self->_locationQueryItem, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);
  objc_storeStrong((id *)&self->_collectionStorage, 0);
  objc_storeStrong((id *)&self->_directionsOptions, 0);
  objc_storeStrong((id *)&self->_lineName, 0);
  objc_storeStrong((id *)&self->_userSessionEntity, 0);
  objc_storeStrong((id *)&self->_cnAddressIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_abAddressID, 0);
  objc_storeStrong((id *)&self->_abRecordID, 0);
  objc_storeStrong((id *)&self->_contentProviderID, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddressStrings, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddressString, 0);
  objc_storeStrong((id *)&self->_addressString, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end