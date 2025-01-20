@interface LPAppleMapsMetadataProviderSpecialization
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (BOOL)isSearch;
- (LPAppleMapsMetadataProviderSpecialization)initWithContext:(id)a3 URLParser:(id)a4;
- (id)geocoder;
- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)complete;
- (void)completeWithCollection;
- (void)completeWithCuratedCollection;
- (void)completeWithDirections;
- (void)completeWithMapItem:(id)a3;
- (void)completeWithPlacemark:(id)a3;
- (void)completeWithPublisher;
- (void)completeWithSearchQuery:(id)a3;
- (void)continueWithLookAroundSnapshotWithOptions:(id)a3;
- (void)continueWithSnapshotOfMapItems:(id)a3;
- (void)continueWithSnapshotOfMapRegion:(id *)a3;
- (void)fail;
- (void)populateImageWithMapSnapshot:(id)a3;
- (void)resolveMapRegionWithCompletionHandler:(id)a3;
- (void)start;
@end

@implementation LPAppleMapsMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 1;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 postRedirectURL];
  if (+[LPPresentationSpecializations isAppleMapsURL:v4])
  {
  }
  else
  {
    v5 = [v3 postRedirectURL];
    BOOL v6 = +[LPPresentationSpecializations isAppleMapsCollectionURL:v5];

    if (!v6)
    {
      v12 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)get_MKURLParserClass(void)::softClass;
  uint64_t v18 = get_MKURLParserClass(void)::softClass;
  if (!get_MKURLParserClass(void)::softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___ZL20get_MKURLParserClassv_block_invoke;
    v14[3] = &unk_1E5B04EB8;
    v14[4] = &v15;
    ___ZL20get_MKURLParserClassv_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v8 = v7;
  _Block_object_dispose(&v15, 8);
  id v9 = [v8 alloc];
  v10 = [v3 postRedirectURL];
  v11 = (void *)[v9 initWithURL:v10];

  if ([v11 parseIncludingCustomParameters:1]) {
    v12 = [[LPAppleMapsMetadataProviderSpecialization alloc] initWithContext:v3 URLParser:v11];
  }
  else {
    v12 = 0;
  }

LABEL_11:

  return v12;
}

- (void)resolveMapRegionWithCompletionHandler:(id)a3
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v86 = 0;
  v87 = (double *)&v86;
  uint64_t v88 = 0x5012000000;
  v89 = __Block_byref_object_copy__9;
  v90 = __Block_byref_object_dispose__9;
  v91 = &unk_1A37209C1;
  long long v92 = 0u;
  long long v93 = 0u;
  v5 = self->_parser;
  [(_MKURLParser *)v5 centerCoordinate];
  CLLocationDegrees v7 = v6;
  CLLocationDegrees v9 = v8;
  [(_MKURLParser *)v5 span];
  CLLocationDegrees v11 = v10;
  CLLocationDegrees v13 = v12;
  [(_MKURLParser *)v5 zoomLevel];
  double v15 = v14;
  v104.latitude = v7;
  v104.longitude = v9;
  v106.latitudeDelta = v11;
  v106.longitudeDelta = v13;
  regionAroundCoordinate(v104, v106, 200.0, v15);
  double v20 = v17;
  if (v17 < -180.0
    || (double v21 = v16, v17 > 180.0)
    || v16 < -90.0
    || v16 > 90.0
    || (double v22 = v18, v18 < 0.0)
    || v18 > 180.0
    || (double v23 = v19, v19 < 0.0)
    || v19 > 360.0)
  {
    [(_MKURLParser *)v5 searchRegion];
    if (v25 < -180.0
      || v25 > 180.0
      || v24 < -90.0
      || v24 > 90.0
      || v26 < 0.0
      || v26 > 180.0
      || v27 < 0.0
      || v27 > 360.0)
    {
      getMKCoordinateRegionInvalid();
    }
    else
    {
      [(_MKURLParser *)v5 searchRegion];
    }
    double v21 = v28;
    double v20 = v29;
    double v22 = v30;
    double v23 = v31;
  }

  *(double *)&long long v92 = v21;
  *((double *)&v92 + 1) = v20;
  *(double *)&long long v93 = v22;
  *((double *)&v93 + 1) = v23;
  if ([(_MKURLParser *)self->_parser searchUID])
  {
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x2050000000;
    v32 = (void *)getMKMapServiceClass(void)::softClass;
    uint64_t v102 = getMKMapServiceClass(void)::softClass;
    if (!getMKMapServiceClass(void)::softClass)
    {
      uint64_t v94 = MEMORY[0x1E4F143A8];
      uint64_t v95 = 3221225472;
      v96 = ___ZL20getMKMapServiceClassv_block_invoke;
      v97 = &unk_1E5B04EB8;
      v98 = &v99;
      ___ZL20getMKMapServiceClassv_block_invoke((uint64_t)&v94);
      v32 = (void *)v100[3];
    }
    id v33 = v32;
    _Block_object_dispose(&v99, 8);
    v34 = [v33 sharedService];
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_MKURLParser searchUID](self->_parser, "searchUID"));
    v103[0] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
    v37 = [v34 ticketForMUIDs:v36 traits:0];

    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke;
    v83[3] = &unk_1E5B06D08;
    id v84 = v4;
    v85 = &v86;
    [v37 submitWithHandler:v83 networkActivity:0];

    goto LABEL_53;
  }
  if (![(LPAppleMapsMetadataProviderSpecialization *)self isSearch])
  {
    v38 = [(_MKURLParser *)self->_parser addressString];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      if ([(_MKURLParser *)self->_parser exactPositionSpecified]
        && ([(_MKURLParser *)self->_parser centerCoordinate], v66 >= -180.0)
        && v66 <= 180.0
        && v65 >= -90.0
        && v65 <= 90.0)
      {
        v67 = [(LPAppleMapsMetadataProviderSpecialization *)self geocoder];
        id v68 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [(_MKURLParser *)self->_parser centerCoordinate];
        double v70 = v69;
        double v72 = v71;
        v73 = [MEMORY[0x1E4F1C9C8] date];
        v74 = objc_msgSend(v68, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v73, v70, v72, 0.0, *MEMORY[0x1E4F1E6D8], *MEMORY[0x1E4F1E6D8]);
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_3;
        v77[3] = &unk_1E5B06D58;
        v77[4] = self;
        id v78 = v4;
        v79 = &v86;
        [v67 reverseGeocodeLocation:v74 completionHandler:v77];
      }
      else
      {
        (*((void (**)(id, void, double, double, double, double))v4 + 2))(v4, 0, v87[6], v87[7], v87[8], v87[9]);
      }
      goto LABEL_53;
    }
  }
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2050000000;
  v40 = (void *)getMKLocalSearchRequestClass(void)::softClass;
  uint64_t v102 = getMKLocalSearchRequestClass(void)::softClass;
  if (!getMKLocalSearchRequestClass(void)::softClass)
  {
    uint64_t v94 = MEMORY[0x1E4F143A8];
    uint64_t v95 = 3221225472;
    v96 = ___ZL28getMKLocalSearchRequestClassv_block_invoke;
    v97 = &unk_1E5B04EB8;
    v98 = &v99;
    ___ZL28getMKLocalSearchRequestClassv_block_invoke((uint64_t)&v94);
    v40 = (void *)v100[3];
  }
  v41 = v40;
  _Block_object_dispose(&v99, 8);
  v42 = (void *)[[v41 alloc] init];
  v43 = [(_MKURLParser *)self->_parser addressString];
  v44 = v43;
  if (!v43)
  {
    v44 = [(_MKURLParser *)self->_parser searchQuery];
  }
  [v42 setNaturalLanguageQuery:v44];
  if (!v43) {

  }
  [(_MKURLParser *)self->_parser searchRegion];
  if (v46 < -180.0 || v46 > 180.0 || v45 < -90.0 || v45 > 90.0 || v47 < 0.0 || v47 > 180.0 || v48 < 0.0 || v48 > 360.0)
  {
    [(_MKURLParser *)self->_parser searchCoordinate];
    if (v50 < -180.0 || v50 > 180.0 || v49 < -90.0 || v49 > 90.0) {
      goto LABEL_50;
    }
    [(_MKURLParser *)self->_parser searchCoordinate];
    CLLocationDegrees v52 = v51;
    CLLocationDegrees v54 = v53;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x2020000000;
    uint64_t v55 = getMKCoordinateSpanInvalidSymbolLoc(void)::ptr;
    uint64_t v102 = getMKCoordinateSpanInvalidSymbolLoc(void)::ptr;
    if (!getMKCoordinateSpanInvalidSymbolLoc(void)::ptr)
    {
      uint64_t v94 = MEMORY[0x1E4F143A8];
      uint64_t v95 = 3221225472;
      v96 = ___ZL35getMKCoordinateSpanInvalidSymbolLocv_block_invoke;
      v97 = &unk_1E5B04EB8;
      v98 = &v99;
      v56 = MapKitLibrary();
      v57 = dlsym(v56, "MKCoordinateSpanInvalid");
      *(void *)(v98[1] + 24) = v57;
      getMKCoordinateSpanInvalidSymbolLoc(void)::ptr = *(void *)(v98[1] + 24);
      uint64_t v55 = v100[3];
    }
    _Block_object_dispose(&v99, 8);
    if (!v55)
    {
      v75 = [MEMORY[0x1E4F28B00] currentHandler];
      v76 = [NSString stringWithUTF8String:"MKCoordinateSpan getMKCoordinateSpanInvalid()"];
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, @"LPAppleMapsMetadataProviderSpecialization.mm", 77, @"%s", dlerror());

      __break(1u);
    }
    CLLocationDegrees v58 = *(double *)v55;
    CLLocationDegrees v59 = *(double *)(v55 + 8);
    [(_MKURLParser *)self->_parser zoomLevel];
    double v61 = v60;
    v105.latitude = v52;
    v105.longitude = v54;
    v107.latitudeDelta = v58;
    v107.longitudeDelta = v59;
    regionAroundCoordinate(v105, v107, 2000.0, v61);
  }
  else
  {
    [(_MKURLParser *)self->_parser searchRegion];
  }
  objc_msgSend(v42, "setRegion:");
LABEL_50:
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2050000000;
  v62 = (void *)getMKLocalSearchClass(void)::softClass;
  uint64_t v102 = getMKLocalSearchClass(void)::softClass;
  if (!getMKLocalSearchClass(void)::softClass)
  {
    uint64_t v94 = MEMORY[0x1E4F143A8];
    uint64_t v95 = 3221225472;
    v96 = ___ZL21getMKLocalSearchClassv_block_invoke;
    v97 = &unk_1E5B04EB8;
    v98 = &v99;
    ___ZL21getMKLocalSearchClassv_block_invoke((uint64_t)&v94);
    v62 = (void *)v100[3];
  }
  v63 = v62;
  _Block_object_dispose(&v99, 8);
  v64 = (void *)[[v63 alloc] initWithRequest:v42];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_2;
  v80[3] = &unk_1E5B06D30;
  v82 = &v86;
  id v81 = v4;
  [v64 startWithCompletionHandler:v80];

LABEL_53:
  _Block_object_dispose(&v86, 8);
}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v5 && [v11 count])
  {
    double v6 = regionFromMapItems(v11);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    *(double *)(v7 + 48) = v6;
    *(void *)(v7 + 56) = v8;
    *(void *)(v7 + 64) = v9;
    *(void *)(v7 + 72) = v10;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 72));
}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 mapItems];
  if ([v3 count])
  {
    double v4 = regionFromMapItems(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    *(double *)(v5 + 48) = v4;
    *(void *)(v5 + 56) = v6;
    *(void *)(v5 + 64) = v7;
    *(void *)(v5 + 72) = v8;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 72));
}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!*(unsigned char *)(a1[4] + 24))
  {
    if (v6 || ![v5 count])
    {
      uint64_t v8 = a1[5];
      id v9 = *(double **)(a1[6] + 8);
      double v10 = v9[6];
      double v11 = v9[7];
      double v12 = v9[8];
      double v13 = v9[9];
      id v14 = objc_alloc((Class)getMKMapItemClass());
      id v15 = objc_alloc((Class)getMKPlacemarkClass());
      [*(id *)(a1[4] + 40) centerCoordinate];
      double v16 = objc_msgSend(v15, "initWithCoordinate:");
      double v17 = (void *)[v14 initWithPlacemark:v16];
      v29[0] = v17;
      double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      (*(void (**)(uint64_t, void *, double, double, double, double))(v8 + 16))(v8, v18, v10, v11, v12, v13);
    }
    else
    {
      uint64_t v19 = a1[5];
      double v20 = *(double **)(a1[6] + 8);
      double v21 = v20[6];
      double v22 = v20[7];
      double v23 = v20[8];
      double v24 = v20[9];
      id v25 = objc_alloc((Class)getMKMapItemClass());
      id v26 = objc_alloc((Class)getMKPlacemarkClass());
      double v16 = [v5 firstObject];
      double v17 = (void *)[v26 initWithPlacemark:v16];
      double v18 = (void *)[v25 initWithPlacemark:v17];
      double v28 = v18;
      double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      (*(void (**)(uint64_t, void *, double, double, double, double))(v19 + 16))(v19, v27, v21, v22, v23, v24);
    }
  }
}

- (id)geocoder
{
  geocoder = self->_geocoder;
  if (!geocoder)
  {
    double v4 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    id v5 = self->_geocoder;
    self->_geocoder = v4;

    geocoder = self->_geocoder;
  }

  return geocoder;
}

- (BOOL)isSearch
{
  id v3 = [(_MKURLParser *)self->_parser searchQuery];
  if (v3 && ([(_MKURLParser *)self->_parser exactPositionSpecified] & 1) == 0)
  {
    id v5 = [(_MKURLParser *)self->_parser addressString];
    BOOL v4 = v5 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)populateImageWithMapSnapshot:(id)a3
{
  id v12 = a3;
  BOOL v4 = [LPImage alloc];
  id v5 = [v12 image];
  id v6 = objc_msgSend(v5, "_lp_imageForcingUserInterfaceStyle:", 0);
  uint64_t v7 = [(LPImage *)v4 initWithPlatformImage:v6];
  [(LPMapMetadata *)self->_mapMetadata setImage:v7];

  uint64_t v8 = [LPImage alloc];
  id v9 = [v12 image];
  double v10 = objc_msgSend(v9, "_lp_imageForcingUserInterfaceStyle:", 1);
  double v11 = [(LPImage *)v8 initWithPlatformImage:v10];
  [(LPMapMetadata *)self->_mapMetadata setDarkImage:v11];
}

- (LPAppleMapsMetadataProviderSpecialization)initWithContext:(id)a3 URLParser:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPAppleMapsMetadataProviderSpecialization;
  uint64_t v8 = [(LPMetadataProviderSpecialization *)&v12 initWithContext:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parser, a4);
    double v10 = v9;
  }

  return v9;
}

- (void)start
{
  id v3 = objc_alloc_init(LPMapMetadata);
  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = v3;

  if ([(_MKURLParser *)self->_parser mapType] == 107)
  {
    createSnapshotOptions();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [(_MKURLParser *)self->_parser mapCamera];
    [v9 setCamera:v5];

    objc_msgSend(v9, "setMapType:", -[_MKURLParser mapType](self->_parser, "mapType"));
    [v9 _setShowsPointLabels:0];
    [(LPAppleMapsMetadataProviderSpecialization *)self continueWithLookAroundSnapshotWithOptions:v9];
  }
  else
  {
    id v6 = [(_MKURLParser *)self->_parser collectionStorage];

    if (v6)
    {
      [(LPAppleMapsMetadataProviderSpecialization *)self completeWithCollection];
    }
    else if ([(_MKURLParser *)self->_parser curatedCollectionMUID])
    {
      [(LPAppleMapsMetadataProviderSpecialization *)self completeWithCuratedCollection];
    }
    else if ([(_MKURLParser *)self->_parser publisherMUID])
    {
      [(LPAppleMapsMetadataProviderSpecialization *)self completeWithPublisher];
    }
    else
    {
      id v7 = [(_MKURLParser *)self->_parser directionsSourceAddressString];
      if (v7)
      {
      }
      else
      {
        uint64_t v8 = [(_MKURLParser *)self->_parser directionsDestinationAddressString];

        if (!v8)
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __50__LPAppleMapsMetadataProviderSpecialization_start__block_invoke;
          v10[3] = &unk_1E5B06D80;
          v10[4] = self;
          [(LPAppleMapsMetadataProviderSpecialization *)self resolveMapRegionWithCompletionHandler:v10];
          return;
        }
      }
      [(LPAppleMapsMetadataProviderSpecialization *)self completeWithDirections];
    }
  }
}

void __50__LPAppleMapsMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v14 = a2;
  double v11 = *(unsigned char **)(a1 + 32);
  if (!v11[24])
  {
    if (a4 < -180.0 || a4 > 180.0 || a3 < -90.0 || a3 > 90.0 || a5 < 0.0 || a5 > 180.0 || a6 < 0.0 || a6 > 360.0)
    {
      [v11 fail];
    }
    else
    {
      uint64_t v12 = [v14 count];
      double v13 = *(void **)(a1 + 32);
      if (v12) {
        [v13 continueWithSnapshotOfMapItems:v14];
      }
      else {
        objc_msgSend(v13, "continueWithSnapshotOfMapRegion:", a3, a4, a5, a6);
      }
    }
  }
}

- (void)continueWithLookAroundSnapshotWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  allocMKMapSnapshotterInstance_LP();
  id v6 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithOptions:v4];
  dispatch_group_enter(v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke;
  v11[3] = &unk_1E5B06DA8;
  v11[4] = self;
  id v7 = v5;
  uint64_t v12 = v7;
  [v6 startWithCompletionHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_2;
  v9[3] = &unk_1E5B04E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v9);
}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(unsigned char **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      [v6 fail];
    }
    else
    {
      id v7 = [LPImage alloc];
      id v8 = [v10 image];
      id v9 = [(LPImage *)v7 initWithPlatformImage:v8];
      [*(id *)(*(void *)(a1 + 32) + 48) setImage:v9];

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_2(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[24])
  {
    if ([v2 isSearch])
    {
      id v3 = *(id **)(a1 + 32);
      id v23 = [v3[5] searchQuery];
      objc_msgSend(v3, "completeWithSearchQuery:");
    }
    else
    {
      double v4 = *MEMORY[0x1E4F1E750];
      double v5 = *(double *)(MEMORY[0x1E4F1E750] + 8);
      id v6 = [*(id *)(a1 + 40) camera];

      id v7 = *(void **)(a1 + 40);
      if (v6)
      {
        id v8 = [v7 camera];
        [v8 centerCoordinate];
        double v4 = v9;
        double v5 = v10;
      }
      else
      {
        [v7 region];
        if (v18 >= -180.0
          && v18 <= 180.0
          && v17 >= -90.0
          && v17 <= 90.0
          && v19 >= 0.0
          && v19 <= 180.0
          && v20 >= 0.0
          && v20 <= 360.0)
        {
          [*(id *)(a1 + 40) region];
          double v4 = v21;
          double v5 = v22;
        }
      }
      v26.latitude = v4;
      v26.longitude = v5;
      BOOL v11 = CLLocationCoordinate2DIsValid(v26);
      uint64_t v12 = *(void **)(a1 + 32);
      if (v11)
      {
        double v13 = [v12 geocoder];
        id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        id v15 = [MEMORY[0x1E4F1C9C8] date];
        double v16 = objc_msgSend(v14, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v4, v5, 0.0, *MEMORY[0x1E4F1E6D8], *MEMORY[0x1E4F1E6D8]);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_3;
        v24[3] = &unk_1E5B06DD0;
        v24[4] = *(void *)(a1 + 32);
        [v13 reverseGeocodeLocation:v16 completionHandler:v24];
      }
      else
      {
        [v12 fail];
      }
    }
  }
}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  id v7 = *(unsigned char **)(a1 + 32);
  if (!v7[24])
  {
    if (v5 || (v8 = [v10 count], id v7 = *(unsigned char **)(a1 + 32), !v8))
    {
      [v7 fail];
    }
    else
    {
      double v9 = [v10 firstObject];
      [v7 completeWithPlacemark:v9];
    }
  }
}

- (void)continueWithSnapshotOfMapRegion:(id *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  uint64_t v12 = dispatch_group_create();
  double v13 = createSnapshotOptions();
  objc_msgSend(v13, "setRegion:", v10, v9, v8, v7);
  objc_msgSend(v13, "setMapType:", -[_MKURLParser mapType](self->_parser, "mapType"));
  [v13 _setAllowsSimultaneousLightDarkSnapshots:1];
  id v14 = [v13 traitCollection];
  [v13 setTraitCollection:v14];

  allocMKMapSnapshotterInstance_LP();
  id v15 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithOptions:v13];
  dispatch_group_enter(v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke;
  v18[3] = &unk_1E5B06DA8;
  v18[4] = self;
  double v16 = v12;
  double v19 = v16;
  [v15 startWithCompletionHandler:v18];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke_2;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);
}

void __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = *(unsigned char **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      [v6 fail];
    }
    else
    {
      [v6 populateImageWithMapSnapshot:v7];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke_2(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[24])
  {
    int v3 = [v2 isSearch];
    double v4 = *(id **)(a1 + 32);
    if (v3)
    {
      id v5 = [v4[5] searchQuery];
      objc_msgSend(v4, "completeWithSearchQuery:");
    }
    else
    {
      [v4 fail];
    }
  }
}

- (void)continueWithSnapshotOfMapItems:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  allocMKAnnotatedMapSnapshotterInstance_LP();
  double v6 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithMapItems:mapSize:useSnapshotService:", v4, 1, 300.0, 300.0);
  id v7 = [v6 traitCollection];
  [v6 setTraitCollection:v7];

  dispatch_group_enter(v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke;
  v12[3] = &unk_1E5B06DA8;
  v12[4] = self;
  double v8 = v5;
  double v13 = v8;
  [v6 startWithCompletionHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke_2;
  v10[3] = &unk_1E5B04E18;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v10);
}

void __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = *(unsigned char **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      [v6 fail];
    }
    else
    {
      [v6 populateImageWithMapSnapshot:v7];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke_2(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[24]) {
    return;
  }
  if ([v2 isSearch])
  {
    int v3 = *(id **)(a1 + 32);
    id v7 = [v3[5] searchQuery];
    objc_msgSend(v3, "completeWithSearchQuery:");
LABEL_6:

    return;
  }
  uint64_t v4 = [*(id *)(a1 + 40) count];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v7 = [*(id *)(a1 + 40) firstObject];
    objc_msgSend(v5, "completeWithMapItem:");
    goto LABEL_6;
  }
  double v6 = *(void **)(a1 + 32);

  [v6 fail];
}

- (void)cancel
{
  self->_cancelled = 1;
  [(CLGeocoder *)self->_geocoder cancelGeocode];
}

- (void)fail
{
  [(LPAppleMapsMetadataProviderSpecialization *)self cancel];
  id v3 = [(LPMetadataProviderSpecialization *)self delegate];
  [v3 metadataProviderSpecializationDidFail:self];
}

- (void)completeWithSearchQuery:(id)a3
{
  id v4 = a3;
  -[LPMapMetadata setSearchQuery:](self->_mapMetadata, "setSearchQuery:");
  [(LPAppleMapsMetadataProviderSpecialization *)self complete];
}

- (void)completeWithMapItem:(id)a3
{
  id v9 = a3;
  id v4 = [v9 name];
  [(LPMapMetadata *)self->_mapMetadata setName:v4];

  id v5 = [v9 _firstLocalizedCategoryName];
  [(LPMapMetadata *)self->_mapMetadata setCategory:v5];

  double v6 = [v9 _identifier];
  [(LPMapMetadata *)self->_mapMetadata setIsPointOfInterest:v6 != 0];

  id v7 = [v9 placemark];

  if (v7)
  {
    double v8 = [v9 placemark];
    [(LPAppleMapsMetadataProviderSpecialization *)self completeWithPlacemark:v8];
  }
  else
  {
    [(LPAppleMapsMetadataProviderSpecialization *)self complete];
  }
}

- (void)completeWithPlacemark:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1BA88];
  id v10 = v4;
  double v6 = [v4 postalAddress];
  id v7 = [v5 stringFromPostalAddress:v6 style:0];
  [(LPMapMetadata *)self->_mapMetadata setAddress:v7];

  double v8 = [v10 postalAddress];
  [(LPMapMetadata *)self->_mapMetadata setAddressComponents:v8];

  id v9 = [v10 location];
  [v9 coordinate];
  -[LPMapMetadata setLocation:](self->_mapMetadata, "setLocation:");

  [(LPAppleMapsMetadataProviderSpecialization *)self complete];
}

- (void)completeWithDirections
{
  id v3 = [(_MKURLParser *)self->_parser directionsSourceAddressString];
  [(LPMapMetadata *)self->_mapMetadata setDirectionsSourceAddress:v3];

  id v4 = [(_MKURLParser *)self->_parser directionsDestinationAddressString];
  [(LPMapMetadata *)self->_mapMetadata setDirectionsDestinationAddress:v4];

  id v5 = NSNumber;
  uint64_t v6 = [(_MKURLParser *)self->_parser transportType];
  uint64_t v7 = 2;
  switch(v6)
  {
    case 2:
      break;
    case 4:
      uint64_t v7 = 1;
      break;
    case 8:
      uint64_t v7 = 3;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  double v8 = [v5 numberWithInt:v7];
  [(LPMapMetadata *)self->_mapMetadata setTransportType:v8];

  [(LPAppleMapsMetadataProviderSpecialization *)self complete];
}

- (void)completeWithCollection
{
  id v3 = objc_alloc_init(LPMapCollectionMetadata);
  collectionMetadata = self->_collectionMetadata;
  self->_collectionMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  uint64_t v6 = (void *)getMKCollectionStorageRefinerClass(void)::softClass;
  uint64_t v16 = getMKCollectionStorageRefinerClass(void)::softClass;
  if (!getMKCollectionStorageRefinerClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___ZL34getMKCollectionStorageRefinerClassv_block_invoke;
    v12[3] = &unk_1E5B04EB8;
    v12[4] = &v13;
    ___ZL34getMKCollectionStorageRefinerClassv_block_invoke((uint64_t)v12);
    uint64_t v6 = (void *)v14[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v13, 8);
  id v8 = [v7 alloc];
  id v9 = [(_MKURLParser *)self->_parser collectionStorage];
  id v10 = (void *)[v8 initWithCollectionStorage:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke;
  v11[3] = &unk_1E5B06DF8;
  v11[4] = self;
  [v10 fetchMapItems:v11];
}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    if ([v3 count])
    {
      allocMKAnnotatedMapSnapshotterInstance_LP();
      id v5 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithMapItems:mapSize:useSnapshotService:", v4, 1, 300.0, 300.0);
      uint64_t v6 = [v5 traitCollection];
      [v5 setTraitCollection:v6];

      uint64_t v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_2;
      v11[3] = &unk_1E5B06DA8;
      v11[4] = *(void *)(a1 + 32);
      uint64_t v12 = v7;
      id v8 = v7;
      [v5 startWithCompletionHandler:v11];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_3;
      v9[3] = &unk_1E5B04E18;
      v9[4] = *(void *)(a1 + 32);
      id v10 = v4;
      dispatch_group_notify(v8, MEMORY[0x1E4F14428], v9);
    }
    else
    {
      [*(id *)(a1 + 32) fail];
    }
  }
}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      [v6 fail];
    }
    else
    {
      uint64_t v7 = [LPImage alloc];
      id v8 = [v15 image];
      id v9 = objc_msgSend(v8, "_lp_imageForcingUserInterfaceStyle:", 0);
      id v10 = [(LPImage *)v7 initWithPlatformImage:v9];
      [*(id *)(*(void *)(a1 + 32) + 56) setImage:v10];

      id v11 = [LPImage alloc];
      uint64_t v12 = [v15 image];
      uint64_t v13 = objc_msgSend(v12, "_lp_imageForcingUserInterfaceStyle:", 1);
      id v14 = [(LPImage *)v11 initWithPlatformImage:v13];
      [*(id *)(*(void *)(a1 + 32) + 56) setDarkImage:v14];

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    id v3 = [*(id *)(v1 + 40) collectionStorage];
    id v4 = [v3 name];
    [*(id *)(*(void *)(a1 + 32) + 56) setName:v4];

    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) collectionStorage];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setNumberOfItems:", objc_msgSend(v5, "placesCount"));

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "_cnPostalAddress", (void)v12);
          if (v11) {
            [v6 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    if ([v6 count]) {
      [*(id *)(*(void *)(a1 + 32) + 56) setAddresses:v6];
    }
    objc_msgSend(*(id *)(a1 + 32), "complete", (void)v12);
  }
}

- (void)completeWithCuratedCollection
{
  id v3 = objc_alloc_init(LPMapCollectionMetadata);
  collectionMetadata = self->_collectionMetadata;
  self->_collectionMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v6 = (void *)getMKPlaceCuratedCollectionRefinerClass(void)::softClass;
  uint64_t v16 = getMKPlaceCuratedCollectionRefinerClass(void)::softClass;
  if (!getMKPlaceCuratedCollectionRefinerClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___ZL39getMKPlaceCuratedCollectionRefinerClassv_block_invoke;
    v12[3] = &unk_1E5B04EB8;
    v12[4] = &v13;
    ___ZL39getMKPlaceCuratedCollectionRefinerClassv_block_invoke((uint64_t)v12);
    id v6 = (void *)v14[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);
  uint64_t v8 = (MKPlaceCuratedCollectionRefiner *)objc_msgSend([v7 alloc], "initWithCollectionIdentifier:providerIdentifier:", -[_MKURLParser curatedCollectionMUID](self->_parser, "curatedCollectionMUID"), -[_MKURLParser searchProviderID](self->_parser, "searchProviderID"));
  curatedCollectionRefiner = self->_curatedCollectionRefiner;
  self->_curatedCollectionRefiner = v8;

  uint64_t v10 = self->_curatedCollectionRefiner;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke;
  v11[3] = &unk_1E5B06E48;
  v11[4] = self;
  [(MKPlaceCuratedCollectionRefiner *)v10 fetchWithCallbackQueue:MEMORY[0x1E4F14428] completion:v11];
}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(unsigned char **)(a1 + 32);
  if (!v10[24])
  {
    if (v9)
    {
      [v10 fail];
    }
    else if ([v8 count])
    {
      id v11 = dispatch_group_create();
      long long v12 = [v7 photos];
      uint64_t v13 = [v12 firstObject];
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2050000000;
      long long v14 = (void *)getGEOMapItemPhotoOptionsClass(void)::softClass;
      uint64_t v37 = getGEOMapItemPhotoOptionsClass(void)::softClass;
      if (!getGEOMapItemPhotoOptionsClass(void)::softClass)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = ___ZL30getGEOMapItemPhotoOptionsClassv_block_invoke;
        v33[3] = &unk_1E5B04EB8;
        v33[4] = &v34;
        ___ZL30getGEOMapItemPhotoOptionsClassv_block_invoke((uint64_t)v33);
        long long v14 = (void *)v35[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v34, 8);
      uint64_t v16 = [v15 defaultPhotoOptionsWithAllowSmaller:1];
      uint64_t v17 = objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v16, 300.0, 300.0, 3.0);

      if (v17)
      {
        dispatch_group_enter(v11);
        double v18 = objc_alloc_init(LPFetcherConfiguration);
        double v19 = [*(id *)(a1 + 32) context];
        double v20 = [v19 webView];
        [(LPFetcherConfiguration *)v18 setWebViewForProcessSharing:v20];

        double v21 = objc_alloc_init(LPImageFetcher);
        double v22 = [v17 url];
        [(LPImageFetcher *)v21 setURL:v22];

        [(LPFetcher *)v21 setResponseClass:objc_opt_class()];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        void v29[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_2;
        v29[3] = &unk_1E5B06E20;
        id v23 = v21;
        double v30 = v23;
        double v24 = v11;
        uint64_t v25 = *(void *)(a1 + 32);
        double v31 = v24;
        uint64_t v32 = v25;
        [(LPImageFetcher *)v23 fetchWithConfiguration:v18 completionHandler:v29];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_3;
      v26[3] = &unk_1E5B05AF8;
      v26[4] = *(void *)(a1 + 32);
      id v27 = v7;
      id v28 = v8;
      dispatch_group_notify(v11, MEMORY[0x1E4F14428], v26);
    }
    else
    {
      [*(id *)(a1 + 32) fail];
    }
  }
}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v5 image];
    [*(id *)(*(void *)(a1 + 48) + 56) setImage:v4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_3(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*((unsigned char *)a1[4] + 24))
  {
    v2 = [a1[5] collectionTitle];
    [*((id *)a1[4] + 7) setName:v2];

    objc_msgSend(*((id *)a1[4] + 7), "setNumberOfItems:", objc_msgSend(a1[5], "numberOfItems"));
    id v3 = [a1[5] publisherAttribution];
    id v4 = [v3 displayName];
    [*((id *)a1[4] + 7) setPublisherName:v4];

    id MKIconManagerClass = getMKIconManagerClass();
    id v6 = [a1[5] publisherAttribution];
    id v7 = objc_msgSend(MKIconManagerClass, "imageForIconID:contentScale:sizeGroup:nightMode:", objc_msgSend(v6, "iconIdentifier"), 1, 0, 3.0);

    id v8 = [[LPImage alloc] initWithPlatformImage:v7];
    [*((id *)a1[4] + 7) setPublisherIcon:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = a1[6];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_cnPostalAddress", (void)v15);
          if (v14) {
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if ([v9 count]) {
      [*((id *)a1[4] + 7) setAddresses:v9];
    }
    objc_msgSend(a1[4], "complete", (void)v15);
  }
}

- (void)completeWithPublisher
{
  id v3 = objc_alloc_init(LPMapCollectionPublisherMetadata);
  publisherMetadata = self->_publisherMetadata;
  self->_publisherMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v6 = (void *)getMKPlacePublisherRefinerClass(void)::softClass;
  uint64_t v16 = getMKPlacePublisherRefinerClass(void)::softClass;
  if (!getMKPlacePublisherRefinerClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___ZL31getMKPlacePublisherRefinerClassv_block_invoke;
    v12[3] = &unk_1E5B04EB8;
    v12[4] = &v13;
    ___ZL31getMKPlacePublisherRefinerClassv_block_invoke((uint64_t)v12);
    id v6 = (void *)v14[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);
  id v8 = (MKPlacePublisherRefiner *)objc_msgSend([v7 alloc], "initWithPublisherIdentifier:providerIdentifier:", -[_MKURLParser publisherMUID](self->_parser, "publisherMUID"), -[_MKURLParser searchProviderID](self->_parser, "searchProviderID"));
  publisherRefiner = self->_publisherRefiner;
  self->_publisherRefiner = v8;

  id v10 = self->_publisherRefiner;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__LPAppleMapsMetadataProviderSpecialization_completeWithPublisher__block_invoke;
  v11[3] = &unk_1E5B06E70;
  v11[4] = self;
  [(MKPlacePublisherRefiner *)v10 fetchWithCallbackQueue:MEMORY[0x1E4F14428] completion:v11];
}

void __66__LPAppleMapsMetadataProviderSpecialization_completeWithPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(unsigned char **)(a1 + 32);
  if (!v6[24])
  {
    if (v5 || !v13)
    {
      [v6 fail];
    }
    else
    {
      id v7 = [v13 publisherAttribution];
      id v8 = [v7 displayName];
      [*(id *)(*(void *)(a1 + 32) + 64) setName:v8];

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setNumberOfPublishedCollections:", objc_msgSend(v13, "totalCollectionCount"));
      id MKIconManagerClass = getMKIconManagerClass();
      id v10 = [v13 publisherAttribution];
      uint64_t v11 = objc_msgSend(MKIconManagerClass, "imageForIconID:contentScale:sizeGroup:nightMode:", objc_msgSend(v10, "iconIdentifier"), 1, 0, 3.0);

      uint64_t v12 = [[LPImage alloc] initWithPlatformImage:v11];
      [*(id *)(*(void *)(a1 + 32) + 64) setIcon:v12];

      [*(id *)(a1 + 32) complete];
    }
  }
}

- (void)complete
{
  mapMetadata = self->_mapMetadata;
  if (!mapMetadata)
  {
    mapMetadata = self->_collectionMetadata;
    if (!mapMetadata) {
      mapMetadata = self->_publisherMetadata;
    }
  }
  id v5 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:mapMetadata];
  id v4 = [(LPMetadataProviderSpecialization *)self delegate];
  [v4 metadataProviderSpecialization:self didCompleteWithMetadata:v5];
}

- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(void))a3;
  id v4 = [(LPMapMetadata *)self->_mapMetadata image];
  [v4 _computeDominantColorForProperties];

  id v5 = [(LPMapMetadata *)self->_mapMetadata darkImage];
  [v5 _computeDominantColorForProperties];

  v6[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherRefiner, 0);
  objc_storeStrong((id *)&self->_curatedCollectionRefiner, 0);
  objc_storeStrong((id *)&self->_publisherMetadata, 0);
  objc_storeStrong((id *)&self->_collectionMetadata, 0);
  objc_storeStrong((id *)&self->_mapMetadata, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end