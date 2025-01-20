@interface MKMapSnapshotOptions
+ (BOOL)supportsSecureCoding;
- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration;
- ($F9C4767691F2EDF2F3162F5FE7B1523A)_resolvedCartographicConfigurationWithAuditToken:(SEL)a3;
- (BOOL)_allowsSimultaneousLightDarkSnapshots;
- (BOOL)_overlaysRequireModernMap;
- (BOOL)_overlaysSupportElevation;
- (BOOL)_rendersInBackground;
- (BOOL)_showsAppleLogo;
- (BOOL)_showsNightMode;
- (BOOL)_showsPointLabels;
- (BOOL)_showsPointsOfInterest;
- (BOOL)_showsRoadLabels;
- (BOOL)_showsRoadShields;
- (BOOL)_showsVenues;
- (BOOL)_snapshotServiceSerialPerProcess;
- (BOOL)_useSnapshotService;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsBuildings;
- (BOOL)usingRect;
- (CGFloat)scale;
- (CGSize)size;
- (GEOApplicationAuditToken)_auditToken;
- (GEOComposedRoute)_composedRouteForRouteLine;
- (MKCoordinateRegion)region;
- (MKMapCamera)camera;
- (MKMapConfiguration)preferredConfiguration;
- (MKMapRect)mapRect;
- (MKMapSnapshotOptions)init;
- (MKMapSnapshotOptions)initWithCoder:(id)a3;
- (MKMapType)mapType;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (NSArray)_customFeatureAnnotations;
- (NSArray)annotationViews;
- (NSNumber)_selectedTrailID;
- (NSString)_selectedTrailLocale;
- (NSString)_selectedTrailName;
- (UIEdgeInsets)_edgeInsets;
- (UITraitCollection)traitCollection;
- (VKRouteContext)_routeContext;
- (VKRouteOverlay)_routeOverlay;
- (id)_allOverlayRenderers;
- (id)_allOverlays;
- (id)_encodableOverlayRenderers;
- (id)_overlayRenderersForOverlayLevel:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_viewportMode;
- (unint64_t)signpostId;
- (unsigned)_searchResultsType;
- (void)_addCameraKVO;
- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_prepareToSubmit;
- (void)_removeCameraKVO;
- (void)_setAllowsSimultaneousLightDarkSnapshots:(BOOL)a3;
- (void)_setAuditToken:(id)a3;
- (void)_setCamera:(id)a3;
- (void)_setCartographicConfiguration:(id *)a3;
- (void)_setComposedRouteForRouteLine:(id)a3;
- (void)_setCustomFeatureAnnotations:(id)a3;
- (void)_setEdgeInsets:(UIEdgeInsets)a3;
- (void)_setOverlayRenderers:(id)a3 forOverlayLevel:(int64_t)a4;
- (void)_setRendersInBackground:(BOOL)a3;
- (void)_setRouteContext:(id)a3;
- (void)_setRouteOverlay:(id)a3;
- (void)_setSearchResultsType:(unsigned __int8)a3;
- (void)_setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5;
- (void)_setShowsAppleLogo:(BOOL)a3;
- (void)_setShowsNightMode:(BOOL)a3;
- (void)_setShowsPointLabels:(BOOL)a3;
- (void)_setShowsRoadLabels:(BOOL)a3;
- (void)_setShowsRoadShields:(BOOL)a3;
- (void)_setShowsVenues:(BOOL)a3;
- (void)_setSnapshotServiceSerialPerProcess:(BOOL)a3;
- (void)_setUseSnapshotService:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotationViews:(id)a3;
- (void)setCamera:(MKMapCamera *)camera;
- (void)setMapRect:(MKMapRect)mapRect;
- (void)setMapType:(MKMapType)mapType;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration;
- (void)setRegion:(MKCoordinateRegion)region;
- (void)setScale:(CGFloat)scale;
- (void)setShowsBuildings:(BOOL)showsBuildings;
- (void)setShowsPointsOfInterest:(BOOL)showsPointsOfInterest;
- (void)setSignpostId:(unint64_t)a3;
- (void)setSize:(CGSize)size;
- (void)setTraitCollection:(UITraitCollection *)traitCollection;
@end

@implementation MKMapSnapshotOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapSnapshotOptions)init
{
  v29.receiver = self;
  v29.super_class = (Class)MKMapSnapshotOptions;
  v2 = [(MKMapSnapshotOptions *)&v29 init];
  v3 = v2;
  if (v2)
  {
    v2->_size = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
    v4 = (void *)MEMORY[0x1E4F42F80];
    v5 = +[MKSystemController sharedInstance];
    [v5 screenScale];
    uint64_t v6 = objc_msgSend(v4, "traitCollectionWithDisplayScale:");
    traitCollection = v3->_traitCollection;
    v3->_traitCollection = (UITraitCollection *)v6;

    *(_WORD *)&v3->_useSnapshotService = 257;
    v8 = objc_alloc_init(MKStandardMapConfiguration);
    preferredConfiguration = v3->_preferredConfiguration;
    v3->_preferredConfiguration = &v8->super;

    double v10 = MKDefaultCoordinateRegion();
    v3->_region.center.latitude = v10;
    v3->_region.center.longitude = v11;
    v3->_region.span.latitudeDelta = v12;
    v3->_region.span.longitudeDelta = v13;
    if (v11 < -180.0
      || v11 > 180.0
      || v10 < -90.0
      || v10 > 90.0
      || v12 < 0.0
      || v12 > 180.0
      || v13 < 0.0
      || v13 > 360.0)
    {
      CLLocationCoordinate2DMake(37.3328, -122.029);
      GEOCoordinateRegionMakeWithDistance();
      v3->_region.center.latitude = v14;
      v3->_region.center.longitude = v15;
      v3->_region.span.latitudeDelta = v16;
      v3->_region.span.longitudeDelta = v17;
    }
    GEOMapRectForCoordinateRegion();
    v3->_mapRect.origin.x = v18;
    v3->_mapRect.origin.y = v19;
    v3->_mapRect.size.double width = v20;
    v3->_mapRect.size.height = v21;
    *(double *)v28 = v18;
    *(double *)&v28[1] = v19;
    *(double *)&v28[2] = v20;
    *(double *)&v28[3] = v21;
    double width = v3->_size.width;
    *(float *)&double width = width;
    *(float *)&double v19 = v3->_size.height;
    *(float *)&double width = *(float *)&width / *(float *)&v19;
    v23 = +[MKMapCamera _cameraLookingAtGEOMapRect:v28 aspectRatio:width];
    [(MKMapSnapshotOptions *)v3 _setCamera:v23];

    *(_DWORD *)&v3->_showsPointLabels = 16843009;
    v24 = MKGetSnapshotLog();
    v3->_signpostId = os_signpost_id_generate(v24);

    long long v25 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&v3->_edgeInsets.top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&v3->_edgeInsets.bottom = v25;
    v3->_showsAppleLogo = 1;
    v26 = v3;
  }

  return v3;
}

- (MKMapSnapshotOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)MKMapSnapshotOptions;
  v5 = [(MKMapSnapshotOptions *)&v84 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traitCollection"];
    v7 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v6;

    if (!*((void *)v5 + 16))
    {
      v8 = (void *)MEMORY[0x1E4F42F80];
      [v4 decodeDoubleForKey:@"scale"];
      uint64_t v9 = objc_msgSend(v8, "traitCollectionWithDisplayScale:");
      double v10 = (void *)*((void *)v5 + 16);
      *((void *)v5 + 16) = v9;
    }
    v5[104] = [v4 decodeBoolForKey:@"snapshotServiceSerialPerProcess"];
    v5[96] = [v4 decodeBoolForKey:@"showsPointLabels"];
    if ([v4 containsValueForKey:@"showsRoadLabels"]) {
      char v11 = [v4 decodeBoolForKey:@"showsRoadLabels"];
    }
    else {
      char v11 = 1;
    }
    v5[97] = v11;
    if ([v4 containsValueForKey:@"showsRoadShields"]) {
      char v13 = [v4 decodeBoolForKey:@"showsRoadShields"];
    }
    else {
      char v13 = 1;
    }
    v5[98] = v13;
    objc_msgSend(v5, "setShowsBuildings:", objc_msgSend(v4, "decodeBoolForKey:", @"showsBuildings"));
    v5[100] = [v4 decodeBoolForKey:@"showsVenues"];
    v5[208] = [v4 decodeBoolForKey:@"allowsSimultaneousLightDarkSnapshots"];
    v5[101] = [v4 decodeBoolForKey:@"showsAppleLogo"];
    CLLocationDegrees v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    CLLocationDegrees v15 = v14;
    if (v14)
    {
      sizep[0] = 0;
      NSGetSizeAndAlignment((const char *)[v14 objCType], sizep, 0);
      if (sizep[0] != 16)
      {
        v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:0];
        [v4 failWithError:v24];

        double v12 = 0;
LABEL_49:

        goto LABEL_50;
      }
    }
    [v15 CGSizeValue];
    *((void *)v5 + 14) = v16;
    *((void *)v5 + 15) = v17;
    double v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeInsets"];
    double v19 = v18;
    if (v18)
    {
      NSUInteger v83 = 0;
      id v20 = v18;
      NSGetSizeAndAlignment((const char *)[v20 objCType], &v83, 0);
      if (v83 != 32)
      {
        v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:0];
        [v4 failWithError:v41];

        double v12 = 0;
LABEL_48:

        goto LABEL_49;
      }
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      *(_OWORD *)sizep = *MEMORY[0x1E4F437F8];
      long long v78 = v21;
      [v20 getValue:sizep size:32];
      long long v22 = *(_OWORD *)sizep;
      long long v23 = v78;
    }
    else
    {
      long long v22 = *MEMORY[0x1E4F437F8];
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    }
    *(_OWORD *)(v5 + 136) = v22;
    *(_OWORD *)(v5 + 152) = v23;
    long long v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"camera"];
    [v5 setCamera:v25];

    [v4 decodeDoubleForKey:@"mapRectOriginX"];
    *((void *)v5 + 2) = v26;
    [v4 decodeDoubleForKey:@"mapRectOriginY"];
    *((void *)v5 + 3) = v27;
    [v4 decodeDoubleForKey:@"mapRectSizeWidth"];
    *((void *)v5 + 4) = v28;
    [v4 decodeDoubleForKey:@"mapRectSizeHeight"];
    *((void *)v5 + 5) = v29;
    [v4 decodeDoubleForKey:@"regionCenterLat"];
    *((void *)v5 + 6) = v30;
    [v4 decodeDoubleForKey:@"regionCenterLong"];
    *((void *)v5 + 7) = v31;
    [v4 decodeDoubleForKey:@"regionSpanLatDelta"];
    *((void *)v5 + 8) = v32;
    [v4 decodeDoubleForKey:@"regionSpanLongDelta"];
    *((void *)v5 + 9) = v33;
    *(_DWORD *)((char *)&v83 + 3) = 0;
    LODWORD(v83) = 0;
    v76 = v19;
    if ([v4 containsValueForKey:@"mapStyle"])
    {
      uint64_t v34 = [v4 decodeIntegerForKey:@"mapStyle"];
      uint64_t v35 = [v4 decodeIntegerForKey:@"mapEmphasis"];
      uint64_t v36 = [v4 decodeIntegerForKey:@"mapProjection"];
      uint64_t v37 = [v4 decodeIntegerForKey:@"terrainMode"];
      if ([v4 containsValueForKey:@"mapkitUsage"]) {
        uint64_t v38 = [v4 decodeIntegerForKey:@"mapkitUsage"];
      }
      else {
        uint64_t v38 = 1;
      }
      if ([v4 containsValueForKey:@"mapkitClientMode"]) {
        uint64_t v39 = [v4 decodeIntegerForKey:@"mapkitClientMode"];
      }
      else {
        uint64_t v39 = 0;
      }
      char v40 = [v4 decodeBoolForKey:@"gridOnly"];
    }
    else if ([v4 containsValueForKey:@"mapType"])
    {
      _MKCartographicConfigurationForMapType([v4 decodeIntegerForKey:@"mapType"], (uint64_t)sizep);
      uint64_t v34 = sizep[0];
      uint64_t v35 = sizep[1];
      uint64_t v37 = *((void *)&v78 + 1);
      uint64_t v36 = v78;
      uint64_t v38 = v79;
      uint64_t v39 = v80;
      char v40 = v81;
      LODWORD(v83) = *(_DWORD *)v82;
      *(_DWORD *)((char *)&v83 + 3) = *(_DWORD *)&v82[3];
    }
    else
    {
      char v40 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v36 = 0;
      uint64_t v34 = 0;
      uint64_t v38 = 1;
      uint64_t v35 = 1;
    }
    if ([v4 containsValueForKey:@"preferredConfiguration"])
    {
      uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredConfiguration"];
      v43 = (void *)*((void *)v5 + 10);
      *((void *)v5 + 10) = v42;
    }
    else
    {
      sizep[0] = v34;
      sizep[1] = v35;
      *(void *)&long long v78 = v36;
      *((void *)&v78 + 1) = v37;
      uint64_t v79 = v38;
      uint64_t v80 = v39;
      char v81 = v40;
      *(_DWORD *)v82 = v83;
      *(_DWORD *)&v82[3] = *(_DWORD *)((char *)&v83 + 3);
      uint64_t v44 = +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:sizep];
      v45 = (void *)*((void *)v5 + 10);
      *((void *)v5 + 10) = v44;

      if ([v4 containsValueForKey:@"pointOfInterestFilter"])
      {
        uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointOfInterestFilter"];
      }
      else
      {
        if (![v4 containsValueForKey:@"showsPointsOfInterest"]
          || ([v4 decodeBoolForKey:@"showsPointsOfInterest"] & 1) != 0)
        {
          goto LABEL_39;
        }
        uint64_t v46 = +[MKPointOfInterestFilter filterExcludingAllCategories];
      }
      v43 = (void *)v46;
      objc_msgSend(*((id *)v5 + 10), "set_pointOfInterestFilter:", v46);
    }

LABEL_39:
    *((void *)v5 + 11) = [v4 decodeIntegerForKey:@"mode"];
    v5[257] = [v4 decodeIntegerForKey:@"searchResultsType"];
    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v47, "setWithObjects:", v48, v49, v50, v51, v52, objc_opt_class(), 0);
    v54 = [v4 decodeObjectOfClasses:v53 forKey:@"customFeatureAnnotations"];
    [v5 _setCustomFeatureAnnotations:v54];

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostId"];
    v56 = v55;
    if (v55) {
      *((void *)v5 + 21) = [v55 unsignedLongLongValue];
    }
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
    v58 = (void *)*((void *)v5 + 25);
    *((void *)v5 + 25) = v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedRouteForRouteLine"];
    v60 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v59;

    v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    v65 = objc_msgSend(v61, "setWithObjects:", v62, v63, v64, objc_opt_class(), 0);

    uint64_t v66 = [v4 decodeObjectOfClasses:v65 forKey:@"overlayRenderers"];
    v67 = (void *)*((void *)v5 + 27);
    *((void *)v5 + 27) = v66;

    if ([v4 containsValueForKey:@"selectedTrailID"])
    {
      uint64_t v68 = [v4 decodeInt64ForKey:@"selectedTrailID"];
      uint64_t v69 = [NSNumber numberWithUnsignedLongLong:v68];
      v70 = (void *)*((void *)v5 + 28);
      *((void *)v5 + 28) = v69;
    }
    double v19 = v76;
    if ([v4 containsValueForKey:@"selectedTrailName"])
    {
      uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedTrailName"];
      v72 = (void *)*((void *)v5 + 29);
      *((void *)v5 + 29) = v71;
    }
    if ([v4 containsValueForKey:@"selectedTrailLocale"])
    {
      uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedTrailLocale"];
      v74 = (void *)*((void *)v5 + 30);
      *((void *)v5 + 30) = v73;
    }
    double v12 = v5;

    goto LABEL_48;
  }
  double v12 = 0;
LABEL_50:

  return v12;
}

- (void)dealloc
{
  [(MKMapSnapshotOptions *)self _removeCameraKVO];
  v3.receiver = self;
  v3.super_class = (Class)MKMapSnapshotOptions;
  [(MKMapSnapshotOptions *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_camera forKey:@"camera"];
  [v4 encodeObject:self->_traitCollection forKey:@"traitCollection"];
  [v4 encodeBool:self->_snapshotServiceSerialPerProcess forKey:@"snapshotServiceSerialPerProcess"];
  v5 = [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
  [v4 encodeObject:v5 forKey:@"pointOfInterestFilter"];

  [v4 encodeBool:self->_showsPointLabels forKey:@"showsPointLabels"];
  [v4 encodeBool:self->_showsRoadLabels forKey:@"showsRoadLabels"];
  [v4 encodeBool:self->_showsRoadShields forKey:@"showsRoadShields"];
  [v4 encodeBool:self->_showsBuildings forKey:@"showsBuildings"];
  [v4 encodeBool:self->_showsVenues forKey:@"showsVenues"];
  [v4 encodeBool:self->_allowsSimultaneousLightDarkSnapshots forKey:@"allowsSimultaneousLightDarkSnapshots"];
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  [(MKMapSnapshotOptions *)self _cartographicConfiguration];
  [v4 encodeInteger:(void)v14 forKey:@"mapStyle"];
  [v4 encodeInteger:*((void *)&v14 + 1) forKey:@"mapEmphasis"];
  [v4 encodeInteger:(void)v15 forKey:@"mapProjection"];
  [v4 encodeBool:v17 forKey:@"gridOnly"];
  [v4 encodeInteger:*((void *)&v15 + 1) forKey:@"terrainMode"];
  [v4 encodeInteger:(void)v16 forKey:@"mapkitUsage"];
  [v4 encodeInteger:*((void *)&v16 + 1) forKey:@"mapkitClientMode"];
  [v4 encodeInteger:_MKMapTypeForCartographicConfiguration((uint64_t *)&v14) forKey:@"mapType"];
  [v4 encodeObject:self->_preferredConfiguration forKey:@"preferredConfiguration"];
  [v4 encodeBool:self->_showsAppleLogo forKey:@"showsAppleLogo"];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", self->_size.width, self->_size.height);
  [v4 encodeObject:v6 forKey:@"size"];

  v7 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_edgeInsets objCType:"{UIEdgeInsets=dddd}"];
  [v4 encodeObject:v7 forKey:@"edgeInsets"];

  [v4 encodeDouble:@"mapRectOriginX" forKey:self->_mapRect.origin.x];
  [v4 encodeDouble:@"mapRectOriginY" forKey:self->_mapRect.origin.y];
  [v4 encodeDouble:@"mapRectSizeWidth" forKey:self->_mapRect.size.width];
  [v4 encodeDouble:@"mapRectSizeHeight" forKey:self->_mapRect.size.height];
  [v4 encodeDouble:@"regionCenterLat" forKey:self->_region.center.latitude];
  [v4 encodeDouble:@"regionCenterLong" forKey:self->_region.center.longitude];
  [v4 encodeDouble:@"regionSpanLatDelta" forKey:self->_region.span.latitudeDelta];
  [v4 encodeDouble:@"regionSpanLongDelta" forKey:self->_region.span.longitudeDelta];
  [v4 encodeInt:LODWORD(self->_mode) forKey:@"mode"];
  [v4 encodeInteger:self->_searchResultsType forKey:@"searchResultsType"];
  [v4 encodeObject:self->_customFeatureAnnotations forKey:@"customFeatureAnnotations"];
  v8 = [NSNumber numberWithUnsignedLongLong:self->_signpostId];
  [v4 encodeObject:v8 forKey:@"signpostId"];

  [v4 encodeObject:self->_auditToken forKey:@"auditToken"];
  composedRouteForRouteLine = self->_composedRouteForRouteLine;
  if (composedRouteForRouteLine) {
    [v4 encodeObject:composedRouteForRouteLine forKey:@"composedRouteForRouteLine"];
  }
  double v10 = [(MKMapSnapshotOptions *)self _encodableOverlayRenderers];
  if (v10) {
    [v4 encodeObject:v10 forKey:@"overlayRenderers"];
  }
  selectedTrailID = self->_selectedTrailID;
  if (selectedTrailID) {
    objc_msgSend(v4, "encodeInt64:forKey:", -[NSNumber unsignedLongLongValue](selectedTrailID, "unsignedLongLongValue"), @"selectedTrailID");
  }
  selectedTrailName = self->_selectedTrailName;
  if (selectedTrailName) {
    [v4 encodeObject:selectedTrailName forKey:@"selectedTrailName"];
  }
  selectedTrailLocale = self->_selectedTrailLocale;
  if (selectedTrailLocale) {
    [v4 encodeObject:selectedTrailLocale forKey:@"selectedTrailLocale"];
  }
}

- (id)_encodableOverlayRenderers
{
  if (self->_overlayRenderers)
  {
    objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_overlayRenderers, "count"));
    overlayRenderers = self->_overlayRenderers;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__MKMapSnapshotOptions__encodableOverlayRenderers__block_invoke;
    v7[3] = &unk_1E54BF0D0;
    id v5 = v3;
    id v8 = v5;
    [(NSMutableDictionary *)overlayRenderers enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __50__MKMapSnapshotOptions__encodableOverlayRenderers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = a1;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1ED997210, v15))
        {
          [v5 addObject:v11];
        }
        else
        {
          double v12 = MKGetSnapshotLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            char v13 = (objc_class *)objc_opt_class();
            long long v14 = NSStringFromClass(v13);
            *(_DWORD *)buf = 138412290;
            long long v22 = v14;
            _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "Unable to encode overlay renderer of class %@ as it is not conforming to NSSecureCoding. This encoding will be lossy.", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  [*(id *)(v15 + 32) setObject:v5 forKeyedSubscript:v16];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $2AEA816EAF9616B0E64737FB4BB06332 span = self->_region.span;
  *(CLLocationCoordinate2D *)(v4 + 48) = self->_region.center;
  *($2AEA816EAF9616B0E64737FB4BB06332 *)(v4 + 64) = span;
  $D4775485B13497D55C4F339E01923D43 size = self->_mapRect.size;
  *($69B62588CC25CB7767350DB9F5F34ADF *)(v4 + 16) = self->_mapRect.origin;
  *($D4775485B13497D55C4F339E01923D43 *)(v4 + 32) = size;
  *(CGSize *)(v4 + 112) = self->_size;
  long long v7 = *(_OWORD *)&self->_edgeInsets.bottom;
  *(_OWORD *)(v4 + 136) = *(_OWORD *)&self->_edgeInsets.top;
  *(_OWORD *)(v4 + 152) = v7;
  *(unsigned char *)(v4 + 96) = self->_showsPointLabels;
  *(unsigned char *)(v4 + 97) = self->_showsRoadLabels;
  *(unsigned char *)(v4 + 98) = self->_showsRoadShields;
  *(unsigned char *)(v4 + 99) = self->_showsBuildings;
  *(unsigned char *)(v4 + 100) = self->_showsVenues;
  *(unsigned char *)(v4 + 101) = self->_showsAppleLogo;
  uint64_t v8 = (void *)[(MKMapCamera *)self->_camera copy];
  [(id)v4 _setCamera:v8];

  *(void *)(v4 + 88) = self->_mode;
  *(unsigned char *)(v4 + 102) = self->_rendersInBackground;
  *(unsigned char *)(v4 + 103) = self->_useSnapshotService;
  *(unsigned char *)(v4 + 104) = self->_snapshotServiceSerialPerProcess;
  uint64_t v9 = [(UITraitCollection *)self->_traitCollection copy];
  double v10 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v9;

  uint64_t v11 = [(NSArray *)self->_customFeatureAnnotations copy];
  double v12 = *(void **)(v4 + 272);
  *(void *)(v4 + 272) = v11;

  uint64_t v13 = [(NSArray *)self->_annotationViews copy];
  long long v14 = *(void **)(v4 + 264);
  *(void *)(v4 + 264) = v13;

  *(unsigned char *)(v4 + 257) = self->_searchResultsType;
  *(void *)(v4 + 168) = self->_signpostId;
  objc_storeStrong((id *)(v4 + 176), self->_routeContext);
  objc_storeStrong((id *)(v4 + 184), self->_routeOverlay);
  objc_storeStrong((id *)(v4 + 192), self->_composedRouteForRouteLine);
  objc_storeStrong((id *)(v4 + 200), self->_auditToken);
  *(unsigned char *)(v4 + 208) = self->_allowsSimultaneousLightDarkSnapshots;
  uint64_t v15 = [(MKMapConfiguration *)self->_preferredConfiguration copy];
  id v16 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v15;

  uint64_t v17 = [(NSMutableDictionary *)self->_overlayRenderers mutableCopy];
  long long v18 = *(void **)(v4 + 216);
  *(void *)(v4 + 216) = v17;

  objc_storeStrong((id *)(v4 + 224), self->_selectedTrailID);
  objc_storeStrong((id *)(v4 + 232), self->_selectedTrailName);
  objc_storeStrong((id *)(v4 + 240), self->_selectedTrailLocale);
  return (id)v4;
}

- (void)setSize:(CGSize)size
{
  if (size.width * size.height == 0.0)
  {
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set a zero area size." userInfo:0];
    [v13 raise];
  }
  else
  {
    self->_$D4775485B13497D55C4F339E01923D43 size = size;
    int64_t mode = self->_mode;
    switch(mode)
    {
      case 2:
        camera = self->_camera;
        [(MKMapSnapshotOptions *)self setCamera:camera];
        break;
      case 1:
        double x = self->_mapRect.origin.x;
        double y = self->_mapRect.origin.y;
        double width = self->_mapRect.size.width;
        double height = self->_mapRect.size.height;
        -[MKMapSnapshotOptions setMapRect:](self, "setMapRect:", x, y, width, height);
        break;
      case 0:
        double latitude = self->_region.center.latitude;
        double longitude = self->_region.center.longitude;
        double latitudeDelta = self->_region.span.latitudeDelta;
        double longitudeDelta = self->_region.span.longitudeDelta;
        -[MKMapSnapshotOptions setRegion:](self, "setRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
        break;
    }
  }
}

- (void)setScale:(CGFloat)scale
{
  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    [(UITraitCollection *)traitCollection displayScale];
    if (v6 != scale)
    {
      long long v7 = self->_traitCollection;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __33__MKMapSnapshotOptions_setScale___block_invoke;
      v12[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
      *(CGFloat *)&v12[4] = scale;
      uint64_t v8 = [(UITraitCollection *)v7 traitCollectionByModifyingTraits:v12];
      uint64_t v9 = self->_traitCollection;
      self->_traitCollection = v8;
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F42F80] traitCollectionWithDisplayScale:scale];
    uint64_t v11 = self->_traitCollection;
    self->_traitCollection = v10;
  }
}

uint64_t __33__MKMapSnapshotOptions_setScale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayScale:*(double *)(a1 + 32)];
}

- (CGFloat)scale
{
  [(UITraitCollection *)self->_traitCollection displayScale];
  return result;
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  long long v7 = traitCollection;
  [(UITraitCollection *)v7 displayScale];
  if (v4 == 0.0)
  {
    id v5 = [(UITraitCollection *)v7 traitCollectionByModifyingTraits:&__block_literal_global_100];
  }
  else
  {
    id v5 = v7;
  }
  double v6 = self->_traitCollection;
  self->_traitCollection = v5;
}

void __43__MKMapSnapshotOptions_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[MKSystemController sharedInstance];
  [v3 screenScale];
  objc_msgSend(v2, "setDisplayScale:");
}

- (void)setCamera:(MKMapCamera *)camera
{
  long long v7 = camera;
  if ([(MKMapCamera *)v7 _validate])
  {
    double v4 = (void *)[(MKMapCamera *)v7 copy];
    [(MKMapSnapshotOptions *)self _setCamera:v4];

    CGFloat width = self->_size.width;
    *(float *)&CGFloat width = width;
    float height = self->_size.height;
    *(float *)&CGFloat width = *(float *)&width / height;
    [(MKMapCamera *)self->_camera _enclosingGEOMapRectForAspectRatio:width];
    self->_mapRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)v9;
    self->_region = ($787999B08D62D8BBAAF19AF74A688926)MKCoordinateRegionForMapRect(v9);
    self->_int64_t mode = 2;
  }
}

- (void)_setCamera:(id)a3
{
  double v4 = (MKMapCamera *)a3;
  if (!self->_kvoProxy)
  {
    id v5 = [[_MKKVOProxy alloc] initWithDelegate:self];
    kvoProxdouble y = self->_kvoProxy;
    self->_kvoProxdouble y = v5;
  }
  [(MKMapSnapshotOptions *)self _removeCameraKVO];
  camera = self->_camera;
  self->_camera = v4;

  [(MKMapSnapshotOptions *)self _addCameraKVO];
}

- (void)_removeCameraKVO
{
  [(_MKKVOProxy *)self->_kvoProxy removeObserverForObject:self->_camera forKeyPath:@"altitude" context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy removeObserverForObject:self->_camera forKeyPath:@"pitch" context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy removeObserverForObject:self->_camera forKeyPath:@"heading" context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy removeObserverForObject:self->_camera forKeyPath:@"centerCoordinate" context:MKCameraKVOContext];
  kvoProxdouble y = self->_kvoProxy;
  camera = self->_camera;
  uint64_t v5 = MKCameraKVOContext;

  [(_MKKVOProxy *)kvoProxy removeObserverForObject:camera forKeyPath:@"centerCoordinateDistance" context:v5];
}

- (void)_addCameraKVO
{
  [(_MKKVOProxy *)self->_kvoProxy addObserverForObject:self->_camera forKeyPath:@"altitude" options:0 context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy addObserverForObject:self->_camera forKeyPath:@"pitch" options:0 context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy addObserverForObject:self->_camera forKeyPath:@"heading" options:0 context:MKCameraKVOContext];
  [(_MKKVOProxy *)self->_kvoProxy addObserverForObject:self->_camera forKeyPath:@"centerCoordinate" options:0 context:MKCameraKVOContext];
  kvoProxdouble y = self->_kvoProxy;
  camera = self->_camera;
  uint64_t v5 = MKCameraKVOContext;

  [(_MKKVOProxy *)kvoProxy addObserverForObject:camera forKeyPath:@"centerCoordinateDistance" options:0 context:v5];
}

- (void)setRegion:(MKCoordinateRegion)region
{
  CLLocationDegrees longitudeDelta = region.span.longitudeDelta;
  CLLocationDegrees latitudeDelta = region.span.latitudeDelta;
  if (region.center.longitude < -180.0
    || region.center.longitude > 180.0
    || region.center.latitude < -90.0
    || region.center.latitude > 90.0
    || region.span.latitudeDelta < 0.0
    || region.span.latitudeDelta > 180.0
    || region.span.longitudeDelta < 0.0
    || region.span.longitudeDelta > 360.0)
  {
    id v16 = NSString;
    uint64_t v17 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&region.center.latitude, *(void *)&region.center.longitude];
    long long v18 = [v16 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v17, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

    id v20 = [v16 stringWithFormat:@"Invalid Region %@", v18];

    long long v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    [v19 raise];
  }
  else
  {
    self->_region = ($787999B08D62D8BBAAF19AF74A688926)region;
    GEOMapRectForCoordinateRegion();
    self->_mapRect.origin.double x = v6;
    self->_mapRect.origin.double y = v7;
    self->_mapRect.size.CGFloat width = v8;
    self->_mapRect.size.float height = v9;
    GEOMapRectForCoordinateRegion();
    v21[0] = v10;
    v21[1] = v11;
    v21[2] = v12;
    v21[3] = v13;
    CGFloat width = self->_size.width;
    *(float *)&CGFloat width = width;
    *(float *)&uint64_t v11 = self->_size.height;
    *(float *)&CGFloat width = *(float *)&width / *(float *)&v11;
    uint64_t v15 = +[MKMapCamera _cameraLookingAtGEOMapRect:v21 aspectRatio:width];
    [(MKMapSnapshotOptions *)self _setCamera:v15];

    self->_int64_t mode = 0;
  }
}

- (void)setMapRect:(MKMapRect)mapRect
{
  self->_mapRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)mapRect;
  self->_region = ($787999B08D62D8BBAAF19AF74A688926)MKCoordinateRegionForMapRect(mapRect);
  $D4775485B13497D55C4F339E01923D43 size = self->_mapRect.size;
  v7[0] = self->_mapRect.origin;
  v7[1] = size;
  CGFloat width = self->_size.width;
  *(float *)&CGFloat width = width;
  *(float *)&size.CGFloat width = self->_size.height;
  *(float *)&CGFloat width = *(float *)&width / *(float *)&size.width;
  double v6 = +[MKMapCamera _cameraLookingAtGEOMapRect:v7 aspectRatio:width];
  [(MKMapSnapshotOptions *)self _setCamera:v6];

  self->_int64_t mode = 1;
}

- (void)_setUseSnapshotService:(BOOL)a3
{
  if (self->_useSnapshotService != a3) {
    self->_useSnapshotService = a3;
  }
}

- (BOOL)_overlaysSupportElevation
{
  BOOL v3 = _MKLinkedOnOrAfterReleaseSet(3595);
  if (v3)
  {
    double v4 = [(MKMapSnapshotOptions *)self _allOverlays];
    BOOL v5 = +[MKStandardMapConfiguration _overlaysSupportElevation:v4];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_overlaysRequireModernMap
{
  id v2 = [(MKMapSnapshotOptions *)self _allOverlays];
  BOOL v3 = +[MKStandardMapConfiguration _overlaysRequireModernMap:v2];

  return v3;
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration
{
  return [(MKMapSnapshotOptions *)self _resolvedCartographicConfigurationWithAuditToken:0];
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_resolvedCartographicConfigurationWithAuditToken:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(void *)&retstr->var6 = 0;
  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:self->_preferredConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (MapKitFeature_IsEnabled_SPRForMapSnapshots())
    {
      int v7 = [(MKMapConfiguration *)self->_preferredConfiguration _allowsTerrainModePromotion];
      BOOL v8 = [(MKMapSnapshotOptions *)self _overlaysRequireModernMap];
      if (v7)
      {
        MKMapElevationStyle v9 = [(MKMapConfiguration *)self->_preferredConfiguration elevationStyle];
        int v7 = _MKLinkedOnOrAfterReleaseSet(3595);
        if (v9 == MKMapElevationStyleRealistic)
        {
          BOOL v10 = [(MKMapSnapshotOptions *)self _overlaysSupportElevation];
          int v11 = 1;
          if (!v6)
          {
LABEL_6:
            id v12 = [MEMORY[0x1E4F643F0] currentProcessAuditToken];
            goto LABEL_10;
          }
LABEL_9:
          id v12 = v6;
LABEL_10:
          uint64_t v13 = v12;
          long long v14 = (void *)MEMORY[0x1E4F647B8];
          uint64_t v15 = [v12 offlineCohortId];
          unsigned __int8 v16 = [v14 activeStateForCohortId:v15];

          if (v16 >= 2u)
          {
            if (v16 == 2)
            {
              retstr->var2 = 0;
              retstr->int64_t var3 = 0;
LABEL_24:

              goto LABEL_25;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              v23[0] = 67109120;
              v23[1] = v16;
              _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v23, 8u);
            }
          }
          int64_t var3 = retstr->var3;
          unsigned int BOOL = GEOConfigGetBOOL();
          uint64_t v20 = 3;
          if (!v7) {
            uint64_t v20 = var3;
          }
          if ((v11 & v10) != 0) {
            uint64_t v20 = 1;
          }
          if (v8 | BOOL) {
            int64_t v21 = BOOL;
          }
          else {
            int64_t v21 = v20;
          }
          retstr->int64_t var3 = v21;
          goto LABEL_24;
        }
      }
    }
    else
    {
      BOOL v8 = [(MKMapSnapshotOptions *)self _overlaysRequireModernMap];
      int v7 = 0;
    }
    int v11 = 0;
    BOOL v10 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
LABEL_25:

  return result;
}

- (void)_setCartographicConfiguration:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var4;
  uint64_t v7 = *(void *)&a3->var6;
  BOOL v5 = +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:v6];
  [v5 _setInternalStateFromMapConfiguration:self->_preferredConfiguration];
  [(MKMapSnapshotOptions *)self setPreferredConfiguration:v5];
}

- (MKMapType)mapType
{
  [(MKMapSnapshotOptions *)self _cartographicConfiguration];
  return _MKMapTypeForCartographicConfiguration((uint64_t *)&v3);
}

- (void)setMapType:(MKMapType)mapType
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _MKCartographicConfigurationForMapType(mapType, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  uint64_t v6 = v10;
  long long v4 = +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:v5];
  [v4 _setInternalStateFromMapConfiguration:self->_preferredConfiguration];
  [(MKMapSnapshotOptions *)self setPreferredConfiguration:v4];
}

- (BOOL)_showsPointsOfInterest
{
  id v2 = [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
  long long v3 = v2;
  if (v2) {
    int v4 = [v2 _excludesAllCategories] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)setShowsPointsOfInterest:(BOOL)showsPointsOfInterest
{
  if (showsPointsOfInterest)
  {
    preferredConfiguration = self->_preferredConfiguration;
    [(MKMapConfiguration *)preferredConfiguration set_pointOfInterestFilter:0];
  }
  else
  {
    id v5 = +[MKPointOfInterestFilter filterExcludingAllCategories];
    [(MKMapConfiguration *)self->_preferredConfiguration set_pointOfInterestFilter:v5];
  }
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
}

- (BOOL)_showsNightMode
{
  return [(UITraitCollection *)self->_traitCollection userInterfaceStyle] == UIUserInterfaceStyleDark;
}

- (void)_setShowsNightMode:(BOOL)a3
{
  traitCollection = self->_traitCollection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __43__MKMapSnapshotOptions__setShowsNightMode___block_invoke;
  v7[3] = &__block_descriptor_33_e27_v16__0___UIMutableTraits__8l;
  BOOL v8 = a3;
  id v5 = [(UITraitCollection *)traitCollection traitCollectionByModifyingTraits:v7];
  uint64_t v6 = self->_traitCollection;
  self->_traitCollection = v5;
}

uint64_t __43__MKMapSnapshotOptions__setShowsNightMode___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setUserInterfaceStyle:v2];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (MKMapSnapshotOptions *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MKMapSnapshotOptions *)self camera];
      long long v7 = [(MKMapSnapshotOptions *)v5 camera];
      if (![v6 isEqual:v7])
      {
        LOBYTE(v11) = 0;
LABEL_30:

        goto LABEL_31;
      }
      BOOL v8 = [(MKMapSnapshotOptions *)self preferredConfiguration];
      long long v9 = [(MKMapSnapshotOptions *)v5 preferredConfiguration];
      if (![v8 isEqual:v9]
        || (BOOL v10 = [(MKMapSnapshotOptions *)self showsBuildings],
            v10 != [(MKMapSnapshotOptions *)v5 showsBuildings]))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      id v12 = [(MKMapSnapshotOptions *)self pointOfInterestFilter];
      uint64_t v13 = [(MKMapSnapshotOptions *)v5 pointOfInterestFilter];
      unint64_t v14 = v12;
      unint64_t v15 = v13;
      if (v14 | v15)
      {
        LODWORD(v11) = [(id)v14 isEqual:v15];

        if (!v11) {
          goto LABEL_28;
        }
      }
      [(MKMapSnapshotOptions *)self size];
      double v17 = v16;
      double v19 = v18;
      [(MKMapSnapshotOptions *)v5 size];
      LOBYTE(v11) = 0;
      if (v17 != v21 || v19 != v20)
      {
LABEL_28:

        goto LABEL_29;
      }
      v54 = [(MKMapSnapshotOptions *)self traitCollection];
      [v54 displayScale];
      double v23 = v22;
      v53 = [(MKMapSnapshotOptions *)v5 traitCollection];
      [v53 displayScale];
      if (v23 != v24)
      {
        LOBYTE(v11) = 0;
        goto LABEL_27;
      }
      uint64_t v52 = [(MKMapSnapshotOptions *)self traitCollection];
      uint64_t v25 = [v52 userInterfaceStyle];
      uint64_t v51 = [(MKMapSnapshotOptions *)v5 traitCollection];
      if (v25 != [v51 userInterfaceStyle]) {
        goto LABEL_24;
      }
      [(MKMapSnapshotOptions *)v5 _edgeInsets];
      LOBYTE(v11) = 0;
      if (self->_edgeInsets.left != v29
        || self->_edgeInsets.top != v26
        || self->_edgeInsets.right != v28
        || self->_edgeInsets.bottom != v27)
      {
        goto LABEL_25;
      }
      BOOL allowsSimultaneousLightDarkSnapshots = self->_allowsSimultaneousLightDarkSnapshots;
      if (allowsSimultaneousLightDarkSnapshots != [(MKMapSnapshotOptions *)v5 _allowsSimultaneousLightDarkSnapshots])
      {
LABEL_24:
        LOBYTE(v11) = 0;
LABEL_25:

LABEL_27:
        goto LABEL_28;
      }
      uint64_t v31 = [(MKMapSnapshotOptions *)self _selectedTrailID];
      [(MKMapSnapshotOptions *)v5 _selectedTrailID];
      v50 = uint64_t v49 = (void *)v31;
      if ((void *)v31 != v50)
      {
        uint64_t v32 = [(MKMapSnapshotOptions *)self _selectedTrailID];
        uint64_t v46 = [(MKMapSnapshotOptions *)v5 _selectedTrailID];
        v47 = v32;
        if (![v32 isEqual:v46])
        {
          LOBYTE(v11) = 0;
          uint64_t v33 = v49;
          goto LABEL_41;
        }
      }
      uint64_t v35 = [(MKMapSnapshotOptions *)self _selectedTrailName];
      [(MKMapSnapshotOptions *)v5 _selectedTrailName];
      v45 = uint64_t v48 = (void *)v35;
      if (v35 == v45
        || ([(MKMapSnapshotOptions *)self _selectedTrailName],
            uint64_t v36 = objc_claimAutoreleasedReturnValue(),
            [(MKMapSnapshotOptions *)v5 _selectedTrailName],
            v43 = objc_claimAutoreleasedReturnValue(),
            uint64_t v44 = v36,
            [v36 isEqualToString:v43]))
      {
        int v11 = [(MKMapSnapshotOptions *)self _selectedTrailLocale];
        uint64_t v38 = [(MKMapSnapshotOptions *)v5 _selectedTrailLocale];
        if (v11 == (void *)v38)
        {

          LOBYTE(v11) = 1;
        }
        else
        {
          uint64_t v42 = (void *)v38;
          char v40 = [(MKMapSnapshotOptions *)self _selectedTrailLocale];
          uint64_t v39 = [(MKMapSnapshotOptions *)v5 _selectedTrailLocale];
          v41 = v11;
          LOBYTE(v11) = objc_msgSend(v40, "isEqualToString:");
        }
        uint64_t v37 = (void *)v45;
        if (v48 == (void *)v45)
        {
LABEL_40:

          uint64_t v33 = v49;
          if (v49 == v50)
          {
LABEL_42:

            goto LABEL_25;
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        uint64_t v37 = (void *)v45;
        LOBYTE(v11) = 0;
      }

      goto LABEL_40;
    }
    LOBYTE(v11) = 0;
  }
LABEL_31:

  return (char)v11;
}

- (void)setShowsBuildings:(BOOL)showsBuildings
{
  if (_MKLinkedOnOrAfterReleaseSet(3595))
  {
    char v5 = 0;
    if (showsBuildings) {
      goto LABEL_9;
    }
  }
  else
  {
    char v5 = GEOConfigGetBOOL() ^ 1;
    if (showsBuildings) {
      goto LABEL_9;
    }
  }
  if ((v5 & 1) == 0)
  {
    [(MKMapSnapshotOptions *)self _cartographicConfiguration];
    if (v6 == 2)
    {
      showsBuildings = 0;
    }
    else
    {
      NSLog(&cfstr_WarningSetting.isa);
      showsBuildings = 1;
    }
  }
LABEL_9:
  self->_showsBuildings = showsBuildings;
}

- (void)_setOverlayRenderers:(id)a3 forOverlayLevel:(int64_t)a4
{
  id v10 = a3;
  overlayRenderers = self->_overlayRenderers;
  if (!overlayRenderers)
  {
    long long v7 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v8 = self->_overlayRenderers;
    self->_overlayRenderers = v7;

    overlayRenderers = self->_overlayRenderers;
  }
  long long v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)overlayRenderers setObject:v10 forKeyedSubscript:v9];
}

- (id)_overlayRenderersForOverlayLevel:(int64_t)a3
{
  overlayRenderers = self->_overlayRenderers;
  int v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)overlayRenderers objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (!v5) {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

- (id)_allOverlayRenderers
{
  long long v3 = [(MKMapSnapshotOptions *)self _overlayRenderersForOverlayLevel:0];
  int v4 = [(MKMapSnapshotOptions *)self _overlayRenderersForOverlayLevel:1];
  char v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)_allOverlays
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = [(MKMapSnapshotOptions *)self _allOverlayRenderers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) overlay];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5
{
  BOOL v8 = (NSNumber *)a3;
  long long v9 = (NSString *)a4;
  id v10 = (NSString *)a5;
  selectedTrailID = self->_selectedTrailID;
  self->_selectedTrailID = v8;
  unint64_t v15 = v8;

  selectedTrailName = self->_selectedTrailName;
  self->_selectedTrailName = v9;
  long long v13 = v9;

  selectedTrailLocale = self->_selectedTrailLocale;
  self->_selectedTrailLocale = v10;
}

- (void)_prepareToSubmit
{
  if ((unint64_t)([(UITraitCollection *)self->_traitCollection userInterfaceStyle] - 1) >= 2
    && !self->_allowsSimultaneousLightDarkSnapshots)
  {
    long long v3 = [MEMORY[0x1E4F42D90] mainScreen];
    int v4 = [v3 traitCollection];
    if ([v4 userInterfaceStyle] == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }

    traitCollection = self->_traitCollection;
    if (traitCollection)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40__MKMapSnapshotOptions__prepareToSubmit__block_invoke;
      v11[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
      v11[4] = v5;
      uint64_t v7 = [(UITraitCollection *)traitCollection traitCollectionByModifyingTraits:v11];
      BOOL v8 = self->_traitCollection;
      self->_traitCollection = v7;
    }
    else
    {
      long long v9 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:v5];
      id v10 = self->_traitCollection;
      self->_traitCollection = v9;
    }
  }
}

uint64_t __40__MKMapSnapshotOptions__prepareToSubmit__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)MKCameraKVOContext == a6)
  {
    CGFloat width = self->_size.width;
    *(float *)&CGFloat width = width;
    float height = self->_size.height;
    *(float *)&CGFloat width = *(float *)&width / height;
    -[MKMapCamera _enclosingGEOMapRectForAspectRatio:](self->_camera, "_enclosingGEOMapRectForAspectRatio:", a3, a4, a5, width);
    self->_mapRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)v9;
    self->_region = ($787999B08D62D8BBAAF19AF74A688926)MKCoordinateRegionForMapRect(v9);
    self->_int64_t mode = 2;
  }
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (MKMapRect)mapRect
{
  double x = self->_mapRect.origin.x;
  double y = self->_mapRect.origin.y;
  double width = self->_mapRect.size.width;
  double height = self->_mapRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (MKCoordinateRegion)region
{
  double latitude = self->_region.center.latitude;
  double longitude = self->_region.center.longitude;
  double latitudeDelta = self->_region.span.latitudeDelta;
  double longitudeDelta = self->_region.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)usingRect
{
  return self->_usingRect;
}

- (BOOL)_showsPointLabels
{
  return self->_showsPointLabels;
}

- (void)_setShowsPointLabels:(BOOL)a3
{
  self->_showsPointLabels = a3;
}

- (BOOL)_showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (void)_setShowsRoadLabels:(BOOL)a3
{
  self->_showsRoadLabels = a3;
}

- (BOOL)_showsRoadShields
{
  return self->_showsRoadShields;
}

- (void)_setShowsRoadShields:(BOOL)a3
{
  self->_showsRoadShields = a3;
}

- (BOOL)showsBuildings
{
  return self->_showsBuildings;
}

- (BOOL)_showsVenues
{
  return self->_showsVenues;
}

- (void)_setShowsVenues:(BOOL)a3
{
  self->_showsVenues = a3;
}

- (BOOL)_allowsSimultaneousLightDarkSnapshots
{
  return self->_allowsSimultaneousLightDarkSnapshots;
}

- (void)_setAllowsSimultaneousLightDarkSnapshots:(BOOL)a3
{
  self->_BOOL allowsSimultaneousLightDarkSnapshots = a3;
}

- (BOOL)_showsAppleLogo
{
  return self->_showsAppleLogo;
}

- (void)_setShowsAppleLogo:(BOOL)a3
{
  self->_showsAppleLogo = a3;
}

- (BOOL)_useSnapshotService
{
  return self->_useSnapshotService;
}

- (BOOL)_snapshotServiceSerialPerProcess
{
  return self->_snapshotServiceSerialPerProcess;
}

- (void)_setSnapshotServiceSerialPerProcess:(BOOL)a3
{
  self->_snapshotServiceSerialPerProcess = a3;
}

- (BOOL)_rendersInBackground
{
  return self->_rendersInBackground;
}

- (void)_setRendersInBackground:(BOOL)a3
{
  self->_rendersInBackground = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSArray)annotationViews
{
  return self->_annotationViews;
}

- (void)setAnnotationViews:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (UIEdgeInsets)_edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (VKRouteContext)_routeContext
{
  return self->_routeContext;
}

- (void)_setRouteContext:(id)a3
{
}

- (VKRouteOverlay)_routeOverlay
{
  return self->_routeOverlay;
}

- (void)_setRouteOverlay:(id)a3
{
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

- (void)_setAuditToken:(id)a3
{
}

- (GEOComposedRoute)_composedRouteForRouteLine
{
  return self->_composedRouteForRouteLine;
}

- (void)_setComposedRouteForRouteLine:(id)a3
{
}

- (int64_t)_viewportMode
{
  return self->_mode;
}

- (NSNumber)_selectedTrailID
{
  return self->_selectedTrailID;
}

- (NSString)_selectedTrailName
{
  return self->_selectedTrailName;
}

- (NSString)_selectedTrailLocale
{
  return self->_selectedTrailLocale;
}

- (unsigned)_searchResultsType
{
  return self->_searchResultsType;
}

- (void)_setSearchResultsType:(unsigned __int8)a3
{
  self->_searchResultsType = a3;
}

- (NSArray)_customFeatureAnnotations
{
  return self->_customFeatureAnnotations;
}

- (void)_setCustomFeatureAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeatureAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationViews, 0);
  objc_storeStrong((id *)&self->_kvoProxy, 0);
  objc_storeStrong((id *)&self->_selectedTrailLocale, 0);
  objc_storeStrong((id *)&self->_selectedTrailName, 0);
  objc_storeStrong((id *)&self->_selectedTrailID, 0);
  objc_storeStrong((id *)&self->_overlayRenderers, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_composedRouteForRouteLine, 0);
  objc_storeStrong((id *)&self->_routeOverlay, 0);
  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);

  objc_storeStrong((id *)&self->_camera, 0);
}

@end