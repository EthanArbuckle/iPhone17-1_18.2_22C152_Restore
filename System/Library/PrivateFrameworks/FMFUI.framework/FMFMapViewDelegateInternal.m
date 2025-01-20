@interface FMFMapViewDelegateInternal
- ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectMakeWithRadialDistanceForCoordinate:(CLLocationCoordinate2D)a3 andRadius:(double)a4;
- (BOOL)canSelectAnnotation:(id)a3;
- (BOOL)isMapCenteringDisabled;
- (BOOL)regionIsValid:(id *)a3;
- (BOOL)respondingToUserTouch;
- (CLLocationCoordinate2D)lastUserLocationCoordinate;
- (FMFAnnotationView)selectedAnnotationView;
- (FMFMapViewDelegateInternal)initWithDelegate:(id)a3 mapView:(id)a4;
- (FMFMapViewDelegateInternalDelegate)delegate;
- (FMFWildcardGestureRecognizer)gr;
- (MKMapView)mapView;
- (UIEdgeInsets)edgeInsetsWithMinApplied:(UIEdgeInsets)a3;
- (id)accuracyCircleForLocation:(id)a3;
- (id)fmfOverlayColor;
- (id)fmfOverlayColorSatellite;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4 mapView:(id)a5;
- (void)endTouches;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)selectAnnotation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGr:(id)a3;
- (void)setIsMapCenteringDisabled:(BOOL)a3;
- (void)setLastUserLocationCoordinate:(CLLocationCoordinate2D)a3;
- (void)setMapView:(id)a3;
- (void)setRespondingToUserTouch:(BOOL)a3;
- (void)setSelectedAnnotationView:(id)a3;
- (void)slideAnnotation:(id)a3 intoViewIfNeededForMapView:(id)a4;
- (void)zoomToFitAnnotationsForMapView:(id)a3 includeMe:(BOOL)a4 duration:(double)a5;
- (void)zoomToFitLocation:(id)a3 forMapView:(id)a4;
@end

@implementation FMFMapViewDelegateInternal

- (FMFMapViewDelegateInternal)initWithDelegate:(id)a3 mapView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (FMFMapViewDelegateInternal *)objc_alloc_init((Class)objc_opt_class());

  [(FMFMapViewDelegateInternal *)v8 setDelegate:v6];
  [(FMFMapViewDelegateInternal *)v8 setMapView:v7];
  objc_initWeak(&location, v8);
  v9 = objc_alloc_init(FMFWildcardGestureRecognizer);
  [(FMFMapViewDelegateInternal *)v8 setGr:v9];

  [(FMFWildcardGestureRecognizer *)v8->_gr setDelegate:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke;
  v13[3] = &unk_264343CC0;
  objc_copyWeak(&v14, &location);
  [(FMFWildcardGestureRecognizer *)v8->_gr setTouchesBeganCallback:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke_2;
  v11[3] = &unk_264343CC0;
  objc_copyWeak(&v12, &location);
  [(FMFWildcardGestureRecognizer *)v8->_gr setTouchesEndedCallback:v11];
  [v7 addGestureRecognizer:v8->_gr];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRespondingToUserTouch:1];
}

void __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelector:sel_endTouches withObject:0 afterDelay:0.5];
}

- (void)endTouches
{
}

- (BOOL)canSelectAnnotation:(id)a3
{
  id v4 = a3;
  v5 = [(FMFMapViewDelegateInternal *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 canSelectAnnotation:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)selectAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFMapViewDelegateInternal *)self mapView];
  [v5 selectAnnotation:v4 animated:1];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 dequeueReusableAnnotationViewWithIdentifier:@"fmfAnnotation"];
    v9 = [(FMFMapViewDelegateInternal *)self delegate];
    v10 = [v9 _internalAnnotationTintColor];
    if (v10)
    {
      [v7 setTintColor:v10];
    }
    else
    {
      v11 = [MEMORY[0x263F1C550] fmfOrangeColor];
      [v7 setTintColor:v11];
    }
    id v12 = [v7 handle];
    v13 = [v9 annotationImageForAnnotation:v7 andHandle:v12];
    [v7 setSmallAnnotationIcon:v13];
    [v7 setLargeAnnotationIcon:v13];

    if (!v8)
    {
      id v14 = [FMFAnnotationView alloc];
      v15 = [v7 tintColor];
      v8 = [(FMFAnnotationView *)v14 initWithAnnotation:v7 reuseIdentifier:@"fmfAnnotation" tintColor:v15];
    }
    v16 = [v7 handle];
    v17 = [v16 cachedPrettyName];

    v18 = NSString;
    v19 = [v7 locationShortAddressWithAgeIncludeLocating];
    v20 = [v18 stringWithFormat:@"%@, %@", v17, v19];
    [(FMFAnnotationView *)v8 setAccessibilityLabel:v20];

    [(FMAnnotationView *)v8 setShouldPreventLargeAnnotationState:[(FMFMapViewDelegateInternal *)self canSelectAnnotation:v7] ^ 1];
    if (!v17)
    {
      v21 = [v7 handle];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __56__FMFMapViewDelegateInternal_mapView_viewForAnnotation___block_invoke;
      v23[3] = &unk_264343C98;
      id v24 = v6;
      id v25 = v7;
      [v21 prettyNameWithCompletion:v23];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__FMFMapViewDelegateInternal_mapView_viewForAnnotation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) annotations];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 32) removeAnnotation:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 addAnnotation:v5];
  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v6 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [v6 annotation];
    v10 = [(FMFMapViewDelegateInternal *)self delegate];
    [v10 didSelectLocation:v9];
    if (![(FMFMapViewDelegateInternal *)self isMapCenteringDisabled])
    {
      v11 = [v6 annotation];
      [(FMFMapViewDelegateInternal *)self slideAnnotation:v11 intoViewIfNeededForMapView:v12];
    }
  }
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [v6 annotation];
    v10 = [(FMFMapViewDelegateInternal *)self selectedAnnotationView];
    v11 = [v10 annotation];
    id v12 = [v6 annotation];
    int v13 = [v11 isEqual:v12];

    if (v13) {
      [(FMFMapViewDelegateInternal *)self setSelectedAnnotationView:0];
    }
    id v14 = [(FMFMapViewDelegateInternal *)self delegate];
    if (([v14 alwaysShowAccuracy] & 1) == 0)
    {
      v15 = [v16 overlays];
      [v16 removeOverlays:v15];
    }
    [v14 didDeselectLocation:v9];
  }
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(FMFMapViewDelegateInternal *)self respondingToUserTouch])
  {
    [v11 centerCoordinate];
    beforeCoordinate = v6;
    unk_267BE18D0 = v7;
    [v11 region];
    beforeSpan = v8;
    unk_267BE18E0 = v9;
  }
  v10 = [(FMFMapViewDelegateInternal *)self delegate];
  [v10 regionWillChangeAnimated:v4];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  if ([(FMFMapViewDelegateInternal *)self respondingToUserTouch])
  {
    [v21 centerCoordinate];
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(v21, "convertCoordinate:toPointToView:", 0, *(double *)&beforeCoordinate, unk_267BE18D0);
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v21, "convertCoordinate:toPointToView:", 0, v7, v9);
    double v15 = v14;
    double v17 = v16;
    [v21 region];
    if (vabdd_f64(v18, *(double *)&beforeSpan) > 0.0001
      || sqrt((v17 - v13) * (v17 - v13) + (v15 - v11) * (v15 - v11)) > 20.0)
    {
      v19 = [(FMFMapViewDelegateInternal *)self delegate];
      [v19 setShouldZoomToFitNewLocations:0];
    }
    [(FMFMapViewDelegateInternal *)self setRespondingToUserTouch:0];
  }
  v20 = [(FMFMapViewDelegateInternal *)self delegate];
  [v20 regionDidChangeAnimated:v4];
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v8 = a4;
  [v8 coordinate];
  if (vabdd_f64(v5, self->_lastUserLocationCoordinate.latitude) >= 0.0001
    || ([v8 coordinate], vabdd_f64(v6, self->_lastUserLocationCoordinate.longitude) >= 0.0001))
  {
    [v8 coordinate];
    -[FMFMapViewDelegateInternal setLastUserLocationCoordinate:](self, "setLastUserLocationCoordinate:");
    double v7 = [(FMFMapViewDelegateInternal *)self delegate];
    if ([v7 shouldZoomToFitMeAndLocations]) {
      [v7 reZoomToFit];
    }
    [v7 didUpdateUserLocation:v8];
  }
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v4 = [(FMFMapViewDelegateInternal *)self delegate];
  [v4 mapViewDidFinishRenderingMap];
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  double v6 = (objc_class *)MEMORY[0x263F108A0];
  id v7 = a4;
  id v8 = a3;
  double v9 = (void *)[[v6 alloc] initWithCircle:v7];

  uint64_t v10 = [v8 mapType];
  if (v10) {
    [(FMFMapViewDelegateInternal *)self fmfOverlayColorSatellite];
  }
  else {
  double v11 = [(FMFMapViewDelegateInternal *)self fmfOverlayColor];
  }
  [v9 setFillColor:v11];

  return v9;
}

- (id)fmfOverlayColor
{
  v2 = [(FMFMapViewDelegateInternal *)self delegate];
  int v3 = [v2 _internalAnnotationTintColor];
  id v4 = [v3 colorWithAlphaComponent:0.100000001];

  double v5 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.156862751 blue:0.0 alpha:0.0799999982];
  double v6 = v5;
  if (v4) {
    double v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (id)fmfOverlayColorSatellite
{
  v2 = [(FMFMapViewDelegateInternal *)self delegate];
  int v3 = [v2 _internalAnnotationTintColor];
  id v4 = [v3 colorWithAlphaComponent:0.200000003];

  double v5 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.156862751 blue:0.0 alpha:0.200000003];
  double v6 = v5;
  if (v4) {
    double v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (id)accuracyCircleForLocation:(id)a3
{
  int v3 = (void *)MEMORY[0x263F10898];
  id v4 = a3;
  double v5 = [v4 location];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v4 location];

  [v10 horizontalAccuracy];
  double v12 = objc_msgSend(v3, "circleWithCenterCoordinate:radius:", v7, v9, v11);

  return v12;
}

- (void)slideAnnotation:(id)a3 intoViewIfNeededForMapView:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [v19 coordinate];
  objc_msgSend(v6, "convertCoordinate:toPointToView:", v6);
  double v8 = v7;
  double v10 = 170.0 - v9;
  if (v7 < 52.0)
  {
    double v11 = 52.0;
LABEL_9:
    double v15 = v11 - v8;
    goto LABEL_10;
  }
  [v6 frame];
  double v13 = v12 + -52.0;
  if (v10 <= 0.0 && v8 <= v13) {
    goto LABEL_11;
  }
  double v15 = 0.0;
  if (v8 > v13)
  {
    [v6 frame];
    double v11 = v16 + -52.0;
    goto LABEL_9;
  }
LABEL_10:
  [v19 coordinate];
  -[FMFMapViewDelegateInternal _moveCenterByOffset:from:mapView:](self, "_moveCenterByOffset:from:mapView:", v6, v15, fmax(v10, 0.0), v17, v18);
LABEL_11:
}

- (void)_moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4 mapView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a5;
  [v11 centerCoordinate];
  objc_msgSend(v11, "convertCoordinate:toPointToView:", v11);
  objc_msgSend(v11, "convertPoint:toCoordinateFromView:", v11, v7 - x, v8 - y);
  double latitude = v13.latitude;
  double longitude = v13.longitude;
  if (CLLocationCoordinate2DIsValid(v13)) {
    objc_msgSend(v11, "setCenterCoordinate:animated:", 1, latitude, longitude);
  }
}

- (void)zoomToFitLocation:(id)a3 forMapView:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 coordinate];
  double v8 = v7;
  double v10 = v9;
  if (-[FMFMapViewDelegateInternal regionIsValid:](self, "regionIsValid:"))
  {
    +[FMFMapUtilities mapRectForCoordinateRegion:](FMFMapUtilities, "mapRectForCoordinateRegion:", v8, v10, 0.003, 0.003);
    double v45 = v12;
    double v46 = v11;
    double v43 = v14;
    double v44 = v13;
    double v15 = [(FMFMapViewDelegateInternal *)self delegate];
    [v15 edgeInsets];
    -[FMFMapViewDelegateInternal edgeInsetsWithMinApplied:](self, "edgeInsetsWithMinApplied:");
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    id v24 = [(FMFMapViewDelegateInternal *)self mapView];
    [v24 bounds];
    double v26 = v25;
    double v28 = v27;

    v29 = [(FMFMapViewDelegateInternal *)self mapView];
    objc_msgSend(v29, "mapRectThatFits:edgePadding:", v46, v45, v44, v43, v17, v19, v21, v23);
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    v38 = objc_msgSend(MEMORY[0x263F10940], "_cameraLookingAtMapRect:forViewSize:", v31, v33, v35, v37, v26, v28);
    v39 = LogCategory_Daemon();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [v38 debugDescription];
      *(_DWORD *)buf = 138412290;
      v50 = v40;
      _os_log_impl(&dword_2188D1000, v39, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: camera updated %@", buf, 0xCu);
    }
    if (+[FMFMapUtilities doNotAnimateToNewLocation:forMapView:](FMFMapUtilities, "doNotAnimateToNewLocation:forMapView:", v6, v8, v10))
    {
      v41 = [(FMFMapViewDelegateInternal *)self mapView];
      [v41 setCamera:v38 animated:0];
    }
    else
    {
      v42 = (void *)MEMORY[0x263F1CB60];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __59__FMFMapViewDelegateInternal_zoomToFitLocation_forMapView___block_invoke;
      v47[3] = &unk_2643439B8;
      v47[4] = self;
      id v48 = v38;
      [v42 animateWithDuration:v47 animations:0.200000003];
    }
  }
  else
  {
    double v15 = LogCategory_Daemon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v15, OS_LOG_TYPE_DEFAULT, "Not zooming due to invalid region (0,0).", buf, 2u);
    }
  }
}

void __59__FMFMapViewDelegateInternal_zoomToFitLocation_forMapView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapView];
  [v2 setCamera:*(void *)(a1 + 40) animated:1];
}

- (void)zoomToFitAnnotationsForMapView:(id)a3 includeMe:(BOOL)a4 duration:(double)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 userTrackingMode] != 2)
  {
    double v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_DEFAULT, "zoomToFitAnnotationsForMapView", buf, 2u);
    }

    double v10 = [(FMFMapViewDelegateInternal *)self delegate];
    if (![v10 viewWillAppearCalled]) {
      goto LABEL_46;
    }
    double v11 = [v8 annotations];
    if (a4)
    {
      double v12 = [(FMFMapViewDelegateInternal *)self mapView];
      double v13 = [v12 selectedAnnotations];
      uint64_t v14 = [v13 count];

      if (!v14) {
        goto LABEL_29;
      }
      double v15 = [(FMFMapViewDelegateInternal *)self mapView];
      double v16 = [v15 selectedAnnotations];
      double v17 = (void *)[v16 mutableCopy];

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      double v18 = [(FMFMapViewDelegateInternal *)self mapView];
      id v19 = [v18 annotations];

      uint64_t v20 = [v19 countByEnumeratingWithState:&v95 objects:v105 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        v89 = v11;
        v91 = v10;
        uint64_t v22 = *(void *)v96;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v96 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v95 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v17 addObject:v24];
              goto LABEL_27;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v95 objects:v105 count:16];
          if (v21) {
            continue;
          }
          goto LABEL_27;
        }
      }
    }
    else
    {
      double v17 = [MEMORY[0x263EFF980] array];
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v19 = v11;
      uint64_t v25 = [v19 countByEnumeratingWithState:&v99 objects:v106 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        v89 = v11;
        v91 = v10;
        uint64_t v27 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v100 != v27) {
              objc_enumerationMutation(v19);
            }
            uint64_t v29 = *(void *)(*((void *)&v99 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v17 addObject:v29];
            }
          }
          uint64_t v26 = [v19 countByEnumeratingWithState:&v99 objects:v106 count:16];
        }
        while (v26);
LABEL_27:
        double v11 = v89;
        double v10 = v91;
      }
    }

    double v11 = v17;
LABEL_29:
    +[FMFMapUtilities regionForAnnotations:v11];
    double latitude = v30;
    double longitude = v32;
    double latitudeDelta = v34;
    double longitudeDelta = v36;
    v38 = [v11 firstObject];
    if ([v10 alwaysShowAccuracy] && !a4)
    {
      [v38 coordinate];
      double v40 = v39;
      double v42 = v41;
      double v43 = [v38 location];
      [v43 horizontalAccuracy];
      -[FMFMapViewDelegateInternal mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v40, v42, v44);
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      v108.origin.double x = v46;
      v108.origin.double y = v48;
      v108.size.width = v50;
      v108.size.height = v52;
      MKCoordinateRegion v109 = MKCoordinateRegionForMapRect(v108);
      double latitude = v109.center.latitude;
      double longitude = v109.center.longitude;
      double latitudeDelta = v109.span.latitudeDelta;
      double longitudeDelta = v109.span.longitudeDelta;
    }
    if (latitudeDelta < 0.003) {
      double latitudeDelta = 0.003;
    }
    if (longitudeDelta < 0.003) {
      double longitudeDelta = 0.003;
    }
    if (-[FMFMapViewDelegateInternal regionIsValid:](self, "regionIsValid:", latitude, longitude, latitudeDelta, longitudeDelta))
    {
      double v92 = a5;
      double v86 = longitude;
      double v87 = latitude;
      +[FMFMapUtilities mapRectForCoordinateRegion:](FMFMapUtilities, "mapRectForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
      double v88 = v54;
      double v90 = v53;
      double v56 = v55;
      double v58 = v57;
      [v10 edgeInsets];
      -[FMFMapViewDelegateInternal edgeInsetsWithMinApplied:](self, "edgeInsetsWithMinApplied:");
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;
      v67 = [(FMFMapViewDelegateInternal *)self mapView];
      [v67 bounds];
      double v69 = v68;
      double v71 = v70;

      v72 = [(FMFMapViewDelegateInternal *)self mapView];
      objc_msgSend(v72, "mapRectThatFits:edgePadding:", v90, v88, v56, v58, v60, v62, v64, v66);
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;

      v81 = objc_msgSend(MEMORY[0x263F10940], "_cameraLookingAtMapRect:forViewSize:", v74, v76, v78, v80, v69, v71);
      v82 = LogCategory_Daemon();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = [v81 debugDescription];
        *(_DWORD *)buf = 138412290;
        v104 = v83;
        _os_log_impl(&dword_2188D1000, v82, OS_LOG_TYPE_DEFAULT, "FMFMapViewDelegateInternal: zoomToFitAnnotationsForMapView new camera %@", buf, 0xCu);
      }
      if (v92 <= 0.0
        || +[FMFMapUtilities doNotAnimateToNewLocation:forMapView:](FMFMapUtilities, "doNotAnimateToNewLocation:forMapView:", v8, v87, v86))
      {
        v84 = [(FMFMapViewDelegateInternal *)self mapView];
        [v84 setCamera:v81 animated:0];
      }
      else
      {
        v85 = (void *)MEMORY[0x263F1CB60];
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __80__FMFMapViewDelegateInternal_zoomToFitAnnotationsForMapView_includeMe_duration___block_invoke;
        v93[3] = &unk_2643439B8;
        v93[4] = self;
        v81 = v81;
        v94 = v81;
        [v85 animateWithDuration:196614 delay:v93 options:&__block_literal_global_2 animations:v92 completion:0.0];
      }
    }
    else
    {
      v81 = LogCategory_Daemon();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188D1000, v81, OS_LOG_TYPE_DEFAULT, "Not zooming due to invalid region (0,0).", buf, 2u);
      }
    }

LABEL_46:
  }
}

void __80__FMFMapViewDelegateInternal_zoomToFitAnnotationsForMapView_includeMe_duration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapView];
  [v2 setCamera:*(void *)(a1 + 40) animated:1];
}

- ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectMakeWithRadialDistanceForCoordinate:(CLLocationCoordinate2D)a3 andRadius:(double)a4
{
  double latitude = a3.latitude;
  MKMapPoint v6 = MKMapPointForCoordinate(a3);
  double v7 = MEMORY[0x21D475AC0](latitude) * a4;
  double v8 = v6.x - v7;
  double v9 = v6.y - v7;
  double v10 = v7 + v7;
  double v11 = v10;
  result.var1.var1 = v11;
  result.var1.var0 = v10;
  result.var0.var1 = v9;
  result.var0.var0 = v8;
  return result;
}

- (UIEdgeInsets)edgeInsetsWithMinApplied:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218752;
    double v14 = top;
    __int16 v15 = 2048;
    double v16 = left;
    __int16 v17 = 2048;
    double v18 = right;
    __int16 v19 = 2048;
    double v20 = bottom;
    _os_log_impl(&dword_2188D1000, v7, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: before top: %f, left: %f, right: %f, bottom: %f", (uint8_t *)&v13, 0x2Au);
  }

  if (top < 48.0) {
    double top = 48.0;
  }
  if (left < 38.0) {
    double left = 38.0;
  }
  if (right < 38.0) {
    double right = 38.0;
  }
  if (bottom < 48.0) {
    double bottom = 48.0;
  }
  double v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218752;
    double v14 = top;
    __int16 v15 = 2048;
    double v16 = left;
    __int16 v17 = 2048;
    double v18 = right;
    __int16 v19 = 2048;
    double v20 = bottom;
    _os_log_impl(&dword_2188D1000, v8, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: after top: %f, left: %f, right: %f, bottom: %f", (uint8_t *)&v13, 0x2Au);
  }

  double v9 = top;
  double v10 = left;
  double v11 = bottom;
  double v12 = right;
  result.double right = v12;
  result.double bottom = v11;
  result.double left = v10;
  result.double top = v9;
  return result;
}

- (BOOL)regionIsValid:(id *)a3
{
  return v4 != 0.0 && v3 != 0.0;
}

- (BOOL)isMapCenteringDisabled
{
  return self->_isMapCenteringDisabled;
}

- (void)setIsMapCenteringDisabled:(BOOL)a3
{
  self->_isMapCenteringDisabled = a3;
}

- (FMFMapViewDelegateInternalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMFMapViewDelegateInternalDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)respondingToUserTouch
{
  return self->_respondingToUserTouch;
}

- (void)setRespondingToUserTouch:(BOOL)a3
{
  self->_respondingToUserTouch = a3;
}

- (FMFWildcardGestureRecognizer)gr
{
  return self->_gr;
}

- (void)setGr:(id)a3
{
}

- (FMFAnnotationView)selectedAnnotationView
{
  return self->_selectedAnnotationView;
}

- (void)setSelectedAnnotationView:(id)a3
{
  self->_selectedAnnotationView = (FMFAnnotationView *)a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  self->_mapView = (MKMapView *)a3;
}

- (CLLocationCoordinate2D)lastUserLocationCoordinate
{
  double latitude = self->_lastUserLocationCoordinate.latitude;
  double longitude = self->_lastUserLocationCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLastUserLocationCoordinate:(CLLocationCoordinate2D)a3
{
  self->_lastUserLocationCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gr, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end