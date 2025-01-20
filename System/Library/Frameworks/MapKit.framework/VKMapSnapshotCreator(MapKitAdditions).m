@interface VKMapSnapshotCreator(MapKitAdditions)
- (uint64_t)_mapkit_configureFromDefaults;
- (uint64_t)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions;
- (void)_mapkit_configureWithOptions:()MapKitAdditions configuration:scale:;
- (void)initWithSnapshotOptions:()MapKitAdditions homeQueue:auditToken:;
@end

@implementation VKMapSnapshotCreator(MapKitAdditions)

- (void)initWithSnapshotOptions:()MapKitAdditions homeQueue:auditToken:
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v93 = a4;
  id v8 = a5;
  uint64_t v97 = 0;
  memset(v96, 0, sizeof(v96));
  if (v7) {
    [v7 _resolvedCartographicConfigurationWithAuditToken:v8];
  }
  v92 = v8;
  v9 = [v7 traitCollection];
  uint64_t v10 = [v9 userInterfaceStyle];

  uint64_t v11 = *(void *)&v96[0] | v10;
  v12 = MKGetSnapshotLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = "NO";
    if (!v11) {
      v13 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v107 = v13;
    _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, "Generate both light and dark: %s ", buf, 0xCu);
  }

  v14 = (unsigned __int8 *)MEMORY[0x1E4FB3AE8];
  if (v11)
  {
    v15 = [v7 traitCollection];
    BOOL v16 = [v15 userInterfaceStyle] == 2;

    BOOL v17 = *(void *)&v96[0] == 0;
    v94 = malloc_type_malloc(6uLL, 0x1000040274DC3F3uLL);
    id v18 = v7;
    v19 = v18;
    BOOL v20 = !v16 || !v17;
    if (v16 && v17) {
      v21 = (unsigned __int8 *)MEMORY[0x1E4FB3AF0];
    }
    else {
      v21 = v14;
    }
    if (v20) {
      v22 = v14 + 1;
    }
    else {
      v22 = (unsigned __int8 *)(MEMORY[0x1E4FB3AF0] + 1);
    }
    if (v20) {
      v23 = v14 + 2;
    }
    else {
      v23 = (unsigned char *)(MEMORY[0x1E4FB3AF0] + 2);
    }
    if (v20) {
      uint64_t v24 = (uint64_t)(v14 + 3);
    }
    else {
      uint64_t v24 = MEMORY[0x1E4FB3AF0] + 3;
    }
    uint64_t v25 = MEMORY[0x1E4FB3AF0] + 5;
    long long v102 = 0u;
    long long v103 = 0u;
    if (v20) {
      uint64_t v25 = (uint64_t)(v14 + 5);
    }
    v89 = (unsigned __int8 *)v25;
    v90 = (unsigned __int8 *)v24;
    long long v104 = 0uLL;
    long long v105 = 0uLL;
    v26 = [v18 _customFeatureAnnotations];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v102 objects:buf count:16];
    if (v27)
    {
      v88 = v23;
      uint64_t v28 = *(void *)v103;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v103 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v30 representation] == 2)
          {
            LOBYTE(v27) = 1;
            goto LABEL_44;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v102 objects:buf count:16];
        if (v27) {
          continue;
        }
        break;
      }
LABEL_44:
      v23 = v88;
    }

    if (v7)
    {
      [v19 _cartographicConfiguration];
      uint64_t v37 = *((void *)&v98 + 1);
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v101 = 0;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v98 = 0u;
    }
    unsigned __int8 v38 = *v21;
    unsigned __int8 v39 = *v22;
    unsigned __int8 v40 = *v23;
    int v41 = *v90;
    uint64_t v42 = *v89;
    if (v27) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = [v19 _searchResultsType];
    }
    v44 = [v19 _composedRouteForRouteLine];

    int v45 = v40 << 16;
    if (v44) {
      int v45 = 0x10000;
    }
    int v46 = v45 | (v41 << 24);
    int v47 = v39 << 8;
    if (v37 == 4) {
      int v47 = 512;
    }
    unint64_t v48 = ((v42 << 40) | (unint64_t)(v43 << 32)) >> 32;
    v49 = v94;
    *((_WORD *)v94 + 2) = v48;
    _DWORD *v94 = (v46 | v47) & 0xFFFFFF00 | v38;
    uint64_t v50 = 1;
  }
  else
  {
    v95 = (char *)malloc_type_malloc(0xCuLL, 0x1000040274DC3F3uLL);
    id v31 = v7;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v32 = [v31 _customFeatureAnnotations];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v102 objects:buf count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v103;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v103 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v102 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 representation] == 2)
          {
            LOBYTE(v33) = 1;
            goto LABEL_57;
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v102 objects:buf count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
LABEL_57:

    if (v7)
    {
      [v31 _cartographicConfiguration];
      uint64_t v51 = *((void *)&v98 + 1);
    }
    else
    {
      uint64_t v51 = 0;
      uint64_t v101 = 0;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v98 = 0u;
    }
    int v52 = *v14;
    int v53 = v14[1];
    int v54 = v14[2];
    int v55 = v14[3];
    uint64_t v56 = v14[5];
    if (v33) {
      uint64_t v57 = 1;
    }
    else {
      uint64_t v57 = [v31 _searchResultsType];
    }
    v58 = [v31 _composedRouteForRouteLine];

    int v59 = v54 << 16;
    if (v58) {
      int v59 = 0x10000;
    }
    int v60 = v59 | (v55 << 24);
    int v61 = v53 << 8;
    if (v51 == 4) {
      int v61 = 512;
    }
    *((_WORD *)v95 + 2) = ((v56 << 40) | (unint64_t)(v57 << 32)) >> 32;
    *(_DWORD *)v95 = v60 | v52 | v61;
    id v62 = v31;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v63 = [v62 _customFeatureAnnotations];
    uint64_t v64 = [v63 countByEnumeratingWithState:&v102 objects:buf count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v103;
      while (2)
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v103 != v65) {
            objc_enumerationMutation(v63);
          }
          v67 = *(void **)(*((void *)&v102 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v67 representation] == 2)
          {
            LOBYTE(v64) = 1;
            goto LABEL_78;
          }
        }
        uint64_t v64 = [v63 countByEnumeratingWithState:&v102 objects:buf count:16];
        if (v64) {
          continue;
        }
        break;
      }
    }
LABEL_78:
    v68 = (unsigned __int8 *)MEMORY[0x1E4FB3AF0];

    if (v7)
    {
      [v62 _cartographicConfiguration];
      uint64_t v69 = *((void *)&v98 + 1);
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v101 = 0;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v98 = 0u;
    }
    int v70 = *v68;
    int v71 = v68[1];
    int v72 = v68[2];
    int v73 = v68[3];
    uint64_t v74 = v68[5];
    if (v64) {
      uint64_t v75 = 1;
    }
    else {
      uint64_t v75 = [v62 _searchResultsType];
    }
    v76 = [v62 _composedRouteForRouteLine];

    int v77 = v72 << 16;
    if (v76) {
      int v77 = 0x10000;
    }
    int v78 = v77 | (v73 << 24);
    int v79 = v71 << 8;
    if (v69 == 4) {
      int v79 = 512;
    }
    v49 = v95;
    *((_WORD *)v95 + 5) = ((v74 << 40) | (unint64_t)(v75 << 32)) >> 32;
    *(_DWORD *)(v95 + 6) = v78 | v70 | v79;
    uint64_t v50 = 2;
  }
  v80 = [v7 traitCollection];
  [v80 displayScale];
  double v82 = v81;

  [v7 size];
  v85 = objc_msgSend(a1, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:", v93, objc_msgSend(v7, "signpostId"), _VKMapTypeForMKCartographicConfiguration((uint64_t *)v96), v49, v50, v92, v83, v84, v82);
  free(v49);
  if (v85)
  {
    objc_msgSend(v85, "_mapkit_configureWithOptions:configuration:scale:", v7, v96, v82);
    id v86 = v85;
  }

  return v85;
}

- (uint64_t)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions
{
  uint64_t v4 = labelScaleFactorForContentSizeCategory(a3);

  return [a1 setLabelScaleFactor:v4];
}

- (uint64_t)_mapkit_configureFromDefaults
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return [a1 setLocalizeLabels:BOOL];
}

- (void)_mapkit_configureWithOptions:()MapKitAdditions configuration:scale:
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_msgSend(a1, "_mapkit_configureFromDefaults");
  [a1 setMapType:_VKMapTypeForMKCartographicConfiguration(a5)];
  v9 = [v8 pointOfInterestFilter];
  uint64_t v10 = [v9 _geoPOICategoryFilter];
  [a1 setPointsOfInterestFilter:v10];

  objc_msgSend(a1, "setShowsRoadLabels:", objc_msgSend(v8, "_showsRoadLabels"));
  objc_msgSend(a1, "setShowsRoadShields:", objc_msgSend(v8, "_showsRoadShields"));
  objc_msgSend(a1, "setShowsPointLabels:", objc_msgSend(v8, "_showsPointLabels"));
  objc_msgSend(a1, "setShowsBuildings:", objc_msgSend(v8, "showsBuildings"));
  objc_msgSend(a1, "setShowsVenues:", objc_msgSend(v8, "_showsVenues"));
  uint64_t v11 = [v8 preferredConfiguration];
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if (v10)
  {
    v12 = [v8 preferredConfiguration];
    uint64_t v13 = [v12 showsTraffic];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = [v8 preferredConfiguration];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    BOOL v16 = [v8 preferredConfiguration];
    uint64_t v17 = [v16 showsHiking];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = [v8 preferredConfiguration];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    BOOL v20 = [v8 preferredConfiguration];
    uint64_t v21 = [v20 showsTopographicFeatures];
  }
  else
  {
    uint64_t v21 = 0;
  }
  [a1 setShowsTraffic:v13];
  [a1 setShowsGlobe:a5[2] == 1];
  [a1 setTerrainMode:_VKTerrainModeForMKCartographicConfiguration((uint64_t)a5)];
  BOOL v22 = ![a1 mapType]
     && ([a1 terrainMode] == 1 || objc_msgSend(a1, "terrainMode") == 3);
  [a1 setShowsTintBands:v22];
  if (![a1 mapType])
  {
    [a1 setShowsHillshade:0];
    [a1 setShowsHiking:v17 withTopographicFeatures:v21];
  }
  [v8 _edgeInsets];
  *(float *)&double v23 = v23;
  *(float *)&double v24 = v24;
  *(float *)&double v25 = v25;
  *(float *)&double v26 = v26;
  objc_msgSend(a1, "setEdgeInsets:", v23, v24, v25, v26);
  uint64_t v27 = [v8 traitCollection];
  uint64_t v28 = [v27 preferredContentSizeCategory];
  v29 = (void *)v28;
  v30 = (void *)*MEMORY[0x1E4F437D0];
  if (v28) {
    v30 = (void *)v28;
  }
  id v31 = v30;

  objc_msgSend(a1, "_mapkit_configureLabelSizesForContentSizeCategory:", v31);
  [a1 setEmphasis:_VKEmphasisForMKCartographicConfiguration(a5)];
  [a1 setMapKitUsage:_VKMapKitUsageForMKCartographicConfiguration((uint64_t)a5)];
  [a1 setMapKitClientMode:_VKMapKitClientModeForMKCartographicConfiguration((uint64_t)a5)];
  v32 = [v8 _routeContext];
  [a1 setRouteContext:v32];

  uint64_t v33 = [v8 _routeOverlay];
  [a1 setRouteOverlay:v33];

  uint64_t v34 = [v8 _composedRouteForRouteLine];

  if (v34)
  {
    v35 = [v8 _composedRouteForRouteLine];
    v36 = [v35 traffic];
    id v37 = objc_alloc_init(MEMORY[0x1E4FB3A60]);
    unsigned __int8 v38 = (void *)[objc_alloc(MEMORY[0x1E4FB3A68]) initWithComposedRoute:v35 traffic:v36];
    [v37 addPolyline:v38];
    [v38 setShowTraffic:1];
    [v38 setSelected:1];
    [a1 setRouteOverlay:v37];
    unsigned __int8 v39 = objc_alloc_init(MKRouteContextBuilder);
    v77[0] = v35;
    unsigned __int8 v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
    int v41 = [(MKRouteContextBuilder *)v39 buildRouteContextForRoutes:v40 selectedRouteIndex:0];
    [a1 setRouteContext:v41];
  }
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __90__VKMapSnapshotCreator_MapKitAdditions___mapkit_configureWithOptions_configuration_scale___block_invoke;
  v71[3] = &unk_1E54BC3E0;
  id v42 = v8;
  double v74 = a2;
  id v72 = v42;
  int v73 = a1;
  uint64_t v43 = (void (**)(void, void))MEMORY[0x18C139AE0](v71);
  v43[2](v43, 0);
  v43[2](v43, 1);
  v44 = [v42 _selectedTrailID];

  if (v44)
  {
    int v45 = [v42 _selectedTrailID];
    uint64_t v46 = [v45 unsignedLongLongValue];
    int v47 = [v42 _selectedTrailName];
    unint64_t v48 = [v42 _selectedTrailLocale];
    [a1 setSelectedTrailWithId:v46 name:v47 locale:v48];
  }
  v49 = [v42 camera];
  if ([v42 _viewportMode] == 2)
  {
    [v49 centerCoordinate];
    double v51 = v50;
    double v53 = v52;
    [v49 altitude];
    double v55 = v54;
    [v49 heading];
    double v57 = v56;
    [v49 pitch];
    objc_msgSend(a1, "setCenterCoordinate:altitude:yaw:pitch:", v51, v53, v55, v57, v58);
  }
  else
  {
    [v42 mapRect];
    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v59, v60, v61, v62);
    [v49 pitch];
    double v65 = v64;
    [v49 heading];
    [a1 setMapRegion:v63 pitch:v65 yaw:v66];
  }
  v67 = MKGetSnapshotLog();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    v68 = [a1 routeOverlay];
    uint64_t v69 = "YES";
    if (!v68) {
      uint64_t v69 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v76 = v69;
    _os_log_impl(&dword_18BAEC000, v67, OS_LOG_TYPE_INFO, "Has Route Overlay: %s ", buf, 0xCu);
  }
  int v70 = MKGetSnapshotLog();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v76 = (const char *)v49;
    _os_log_impl(&dword_18BAEC000, v70, OS_LOG_TYPE_INFO, "Camera Configuration: %@", buf, 0xCu);
  }
}

@end