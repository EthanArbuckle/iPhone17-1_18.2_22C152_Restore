@interface CPSPointsOfInterestMapViewController
- ($0F579584AE83E668E5E9B43E027CB680)mapVisibleRegion;
- (BOOL)centerMapPending;
- (BOOL)hasPerformedInitialLayout;
- (BOOL)isLocationAuthorized;
- (BOOL)useRightHandDriveFocusGuide;
- (CGSize)buttonSize;
- (CLLocation)userLocation;
- (CLLocationManager)locationManager;
- (CPSActionButton)donePanningButton;
- (CPSPanViewController)panViewController;
- (CPSPointsOfInterestMapControlsViewController)mapControlsViewController;
- (CPSPointsOfInterestMapViewController)initWithEntity:(id)a3 resourceProvider:(id)a4;
- (CPSPointsOfInterestPickerViewController)pickerViewController;
- (MKMapView)mapView;
- (NSArray)panModeConstraints;
- (NSArray)pickerModeConstraints;
- (NSMutableDictionary)annotations;
- (NSMutableDictionary)clusterAnnotations;
- (NSTimer)panTimer;
- (UILayoutGuide)mapVisibleRegionGuide;
- (double)buttonRadius;
- (id)_linearFocusItems;
- (id)_linearFocusMovementSequences;
- (id)buttonBackgroundColor;
- (id)font;
- (id)mapView:(id)a3 clusterAnnotationForMemberAnnotations:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)panCompletionHandler;
- (id)pointsOfInterest;
- (id)preferredFocusEnvironments;
- (id)template;
- (void)_notifyRegionDidChange;
- (void)_updateFocusedItem;
- (void)beginPanningWithCompletion:(id)a3;
- (void)centerMap;
- (void)didMoveToParentViewController:(id)a3;
- (void)didSelectButton:(id)a3;
- (void)didUpdateEntity:(id)a3;
- (void)dismissPanView:(id)a3;
- (void)highlightModel:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)panBeganWithDirection:(int64_t)a3;
- (void)panEndedWithDirection:(int64_t)a3;
- (void)panWithDirection:(int64_t)a3;
- (void)picker:(id)a3 didDeselectModel:(id)a4;
- (void)picker:(id)a3 didHighlightModel:(id)a4;
- (void)picker:(id)a3 didSelectModel:(id)a4;
- (void)picker:(id)a3 didUnhighlightModel:(id)a4;
- (void)reloadAnnotations:(BOOL)a3;
- (void)setCenterMapPending:(BOOL)a3;
- (void)setClusterAnnotations:(id)a3;
- (void)setDonePanningButton:(id)a3;
- (void)setHasPerformedInitialLayout:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapControlsViewController:(id)a3;
- (void)setMapView:(id)a3;
- (void)setMapVisibleRegionGuide:(id)a3;
- (void)setPanCompletionHandler:(id)a3;
- (void)setPanModeConstraints:(id)a3;
- (void)setPanTimer:(id)a3;
- (void)setPanViewController:(id)a3;
- (void)setPickerModeConstraints:(id)a3;
- (void)setPickerViewController:(id)a3;
- (void)setUpLocationManager;
- (void)setUpMapView;
- (void)setUpPanView;
- (void)setupViews;
- (void)unhighlightModel:(id)a3;
- (void)updateMapViewEdgeInsetsFittingAnnotations:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)zoomIn;
- (void)zoomOut;
- (void)zoomToLocation:(id)a3;
@end

@implementation CPSPointsOfInterestMapViewController

- (CPSPointsOfInterestMapViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = location[0];
  v4 = v21;
  v21 = 0;
  v17.receiver = v4;
  v17.super_class = (Class)CPSPointsOfInterestMapViewController;
  v16 = [(CPSBaseEntityContentViewController *)&v17 initWithEntity:v18 resourceProvider:v19];
  v21 = v16;
  objc_storeStrong((id *)&v21, v16);
  if (v16)
  {
    v5 = [CPSPointsOfInterestPickerViewController alloc];
    uint64_t v6 = [(CPSPointsOfInterestPickerViewController *)v5 initWithEntity:location[0] resourceProvider:v19];
    pickerViewController = v21->_pickerViewController;
    v21->_pickerViewController = (CPSPointsOfInterestPickerViewController *)v6;

    id v14 = +[CPSEntityStyles mapButtonDropShadow];
    id v13 = (id)[(CPSPointsOfInterestPickerViewController *)v21->_pickerViewController view];
    id v12 = (id)[v13 layer];
    objc_msgSend(v14, "applyShadowToLayer:");

    [(CPSPointsOfInterestPickerViewController *)v21->_pickerViewController setDelegate:v21];
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clusterAnnotations = v21->_clusterAnnotations;
    v21->_clusterAnnotations = v8;
  }
  v11 = v21;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v11;
}

- (id)pointsOfInterest
{
  return [(CPSBaseEntityContentViewController *)self entity];
}

- (id)template
{
  v3 = objc_opt_class();
  v5 = [(CPSBaseEntityContentViewController *)self resourceProvider];
  v4 = [(CPSEntityResourceProvider *)v5 entityTemplate];
  id v6 = CPSSafeCast_9(v3, v4);

  return v6;
}

- (CLLocation)userLocation
{
  v3 = [(CPSPointsOfInterestMapViewController *)self locationManager];
  v4 = [(CLLocationManager *)v3 location];

  return v4;
}

- (void)didUpdateEntity:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28.receiver = v30;
  v28.super_class = (Class)CPSPointsOfInterestMapViewController;
  [(CPSBaseEntityContentViewController *)&v28 didUpdateEntity:location[0]];
  pickerViewController = v30->_pickerViewController;
  id v19 = [(CPSBaseEntityContentViewController *)v30 entity];
  -[CPSBaseEntityContentViewController updateWithEntity:](pickerViewController, "updateWithEntity:");

  id v20 = [(CPSPointsOfInterestMapViewController *)v30 pointsOfInterest];
  id v27 = (id)[v20 pointsOfInterest];

  id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v27, "count"));
  memset(__b, 0, sizeof(__b));
  id obj = v27;
  uint64_t v22 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
  if (v22)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v22;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v16);
      annotations = v30->_annotations;
      id v10 = (id)[v25 identifier];
      id v23 = (id)-[NSMutableDictionary objectForKeyedSubscript:](annotations, "objectForKeyedSubscript:");

      id v11 = v27;
      id v12 = (id)[v23 pointOfInterest];
      BOOL v13 = (objc_msgSend(v11, "containsObject:") & 1) != 0;

      if (!v13)
      {
        v3 = [CPSPointOfInterestAnnotation alloc];
        v4 = [(CPSPointOfInterestAnnotation *)v3 initWithPointOfInterest:v25];
        id v5 = v23;
        id v23 = v4;
      }
      id v6 = v23;
      id v7 = v26;
      id v8 = (id)[v25 identifier];
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6);

      objc_storeStrong(&v23, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)&v30->_annotations, v26);
  [(CPSPointsOfInterestMapViewController *)v30 reloadAnnotations:![(CPSPointsOfInterestMapViewController *)v30 hasPerformedInitialLayout]];
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestMapViewController;
  [(CPSPointsOfInterestMapViewController *)&v2 viewDidLoad];
  [(CPSPointsOfInterestMapViewController *)v4 setupViews];
}

- (void)viewDidLayoutSubviews
{
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestMapViewController;
  [(CPSPointsOfInterestMapViewController *)&v4 viewDidLayoutSubviews];
  objc_super v2 = [(CPSPointsOfInterestMapViewController *)v6 annotations];
  LOBYTE(v3) = 0;
  if ([(NSMutableDictionary *)v2 count]) {
    int v3 = ![(CPSPointsOfInterestMapViewController *)v6 hasPerformedInitialLayout];
  }

  if (v3) {
    [(CPSPointsOfInterestMapViewController *)v6 reloadAnnotations:1];
  }
  else {
    [(CPSPointsOfInterestMapViewController *)v6 updateMapViewEdgeInsetsFittingAnnotations:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSPointsOfInterestMapViewController;
  [(CPSPointsOfInterestMapViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(CPSPointsOfInterestMapViewController *)v8 locationManager];

  if (v4)
  {
    int v3 = [(CPSPointsOfInterestMapViewController *)v8 locationManager];
    [(CLLocationManager *)v3 startUpdatingLocation];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)CPSPointsOfInterestMapViewController;
  [(CPSPointsOfInterestMapViewController *)&v4 didMoveToParentViewController:location[0]];
  if (!location[0])
  {
    int v3 = [(CPSPointsOfInterestMapViewController *)v6 locationManager];
    [(CLLocationManager *)v3 stopUpdatingLocation];
  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  v161[6] = *MEMORY[0x263EF8340];
  v152 = self;
  v151[1] = (id)a2;
  id v101 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v100 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  [v100 setBackgroundColor:v101];

  v151[0] = (id)objc_opt_new();
  [(CPSPointsOfInterestMapViewController *)v152 setUpLocationManager];
  [(CPSPointsOfInterestMapViewController *)v152 setUpMapView];
  v102 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  [(MKMapView *)v102 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v104 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  v103 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  objc_msgSend(v104, "addSubview:");

  id v105 = objc_alloc_init(MEMORY[0x263F1C778]);
  -[CPSPointsOfInterestMapViewController setMapVisibleRegionGuide:](v152, "setMapVisibleRegionGuide:");

  id v107 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  v106 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
  objc_msgSend(v107, "addLayoutGuide:");

  v140 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  id v139 = (id)[(MKMapView *)v140 topAnchor];
  id v138 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v137 = (id)[v138 topAnchor];
  id v136 = (id)objc_msgSend(v139, "constraintEqualToAnchor:");
  v161[0] = v136;
  v135 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  id v134 = (id)[(MKMapView *)v135 bottomAnchor];
  id v133 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v132 = (id)[v133 bottomAnchor];
  id v131 = (id)objc_msgSend(v134, "constraintEqualToAnchor:");
  v161[1] = v131;
  v130 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  id v129 = (id)[(MKMapView *)v130 leftAnchor];
  id v128 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v127 = (id)[v128 leftAnchor];
  id v126 = (id)objc_msgSend(v129, "constraintEqualToAnchor:");
  v161[2] = v126;
  v125 = [(CPSPointsOfInterestMapViewController *)v152 mapView];
  id v124 = (id)[(MKMapView *)v125 rightAnchor];
  id v123 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v122 = (id)[v123 rightAnchor];
  id v121 = (id)objc_msgSend(v124, "constraintEqualToAnchor:");
  v161[3] = v121;
  v120 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
  v119 = [(UILayoutGuide *)v120 topAnchor];
  id v118 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v117 = (id)[v118 safeAreaLayoutGuide];
  id v116 = (id)[v117 topAnchor];
  id v115 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v119, "constraintEqualToAnchor:");
  v161[4] = v115;
  v114 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
  v113 = [(UILayoutGuide *)v114 bottomAnchor];
  id v112 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v111 = (id)[v112 safeAreaLayoutGuide];
  id v110 = (id)[v111 bottomAnchor];
  id v109 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v113, "constraintEqualToAnchor:");
  v161[5] = v109;
  id v108 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v161 count:6];
  objc_msgSend(v151[0], "addObjectsFromArray:");

  v141 = [[CPSPointsOfInterestMapControlsViewController alloc] initWithMapDelegate:v152];
  -[CPSPointsOfInterestMapViewController setMapControlsViewController:](v152, "setMapControlsViewController:");

  v143 = [(CPSPointsOfInterestMapViewController *)v152 mapControlsViewController];
  v160[0] = v143;
  v142 = [(CPSPointsOfInterestMapViewController *)v152 pickerViewController];
  v160[1] = v142;
  id v150 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:2];

  memset(__b, 0, sizeof(__b));
  id obj = v150;
  uint64_t v145 = [obj countByEnumeratingWithState:__b objects:v159 count:16];
  if (v145)
  {
    uint64_t v97 = *(void *)__b[2];
    uint64_t v98 = 0;
    unint64_t v99 = v145;
    while (1)
    {
      uint64_t v96 = v98;
      if (*(void *)__b[2] != v97) {
        objc_enumerationMutation(obj);
      }
      id v149 = *(id *)(__b[1] + 8 * v98);
      [v149 willMoveToParentViewController:v152];
      [(CPSPointsOfInterestMapViewController *)v152 addChildViewController:v149];
      id v93 = (id)[v149 view];
      [v93 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v95 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
      id v94 = (id)[v149 view];
      objc_msgSend(v95, "addSubview:");

      [v149 didMoveToParentViewController:v152];
      ++v98;
      if (v96 + 1 >= v99)
      {
        uint64_t v98 = 0;
        unint64_t v99 = [obj countByEnumeratingWithState:__b objects:v159 count:16];
        if (!v99) {
          break;
        }
      }
    }
  }

  v89 = [(CPSPointsOfInterestMapViewController *)v152 pickerViewController];
  id v147 = (id)[(CPSPointsOfInterestPickerViewController *)v89 view];

  v90 = [(CPSPointsOfInterestMapViewController *)v152 mapControlsViewController];
  id location = (id)[(CPSPointsOfInterestMapControlsViewController *)v90 view];

  id v91 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  [v91 frame];
  double v92 = CGRectGetWidth(v162) * 0.45;

  if (v92 >= 213.0) {
    double v88 = 213.0;
  }
  else {
    double v88 = v92;
  }
  id v46 = v151[0];
  id v71 = (id)[v147 topAnchor];
  id v70 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v69 = (id)[v70 safeAreaLayoutGuide];
  id v68 = (id)[v69 topAnchor];
  id v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:constant:");
  v158[0] = v67;
  id v66 = (id)[v147 bottomAnchor];
  id v65 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v64 = (id)[v65 safeAreaLayoutGuide];
  id v63 = (id)[v64 bottomAnchor];
  id v62 = (id)objc_msgSend(v66, "constraintEqualToAnchor:constant:");
  v158[1] = v62;
  id v61 = (id)[v147 widthAnchor];
  id v60 = (id)[v61 constraintEqualToConstant:v88];
  v158[2] = v60;
  id v59 = (id)[location topAnchor];
  id v58 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v57 = (id)[v58 safeAreaLayoutGuide];
  id v56 = (id)[v57 topAnchor];
  id v55 = (id)objc_msgSend(v59, "constraintEqualToAnchor:constant:", 8.0);
  v158[3] = v55;
  id v54 = (id)[location bottomAnchor];
  id v53 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v52 = (id)[v53 safeAreaLayoutGuide];
  id v51 = (id)[v52 bottomAnchor];
  id v50 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", -8.0);
  v158[4] = v50;
  id v49 = (id)[location widthAnchor];
  id v48 = (id)[v49 constraintEqualToConstant:28.0];
  v158[5] = v48;
  id v47 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:6];
  objc_msgSend(v46, "addObjectsFromArray:");

  v84 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
  v83 = [(UILayoutGuide *)v84 leftAnchor];
  id v82 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v81 = (id)[v82 safeAreaLayoutGuide];
  id v80 = (id)[v81 leftAnchor];
  id v79 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v83, "constraintEqualToAnchor:");
  v157[0] = v79;
  v78 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
  v77 = [(UILayoutGuide *)v78 rightAnchor];
  id v76 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
  id v75 = (id)[v76 safeAreaLayoutGuide];
  id v74 = (id)[v75 rightAnchor];
  id v73 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v77, "constraintEqualToAnchor:");
  v157[1] = v73;
  id v72 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:2];
  -[CPSPointsOfInterestMapViewController setPanModeConstraints:](v152, "setPanModeConstraints:");

  v86 = [(CPSBaseEntityContentViewController *)v152 resourceProvider];
  v85 = [(CPSEntityResourceProvider *)v86 templateEnvironment];
  BOOL v87 = [(CPSTemplateEnvironment *)v85 rightHandDrive];

  if (v87)
  {
    id v25 = v151[0];
    id v36 = (id)[location leftAnchor];
    id v35 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
    id v34 = (id)[v35 safeAreaLayoutGuide];
    id v33 = (id)[v34 leftAnchor];
    id v32 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 8.0);
    v156[0] = v32;
    id v31 = (id)[v147 rightAnchor];
    id v30 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
    id v29 = (id)[v30 safeAreaLayoutGuide];
    id v28 = (id)[v29 rightAnchor];
    id v27 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", -8.0);
    v156[1] = v27;
    id v26 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v156);
    objc_msgSend(v25, "addObjectsFromArray:");

    v45 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
    v44 = [(UILayoutGuide *)v45 leftAnchor];
    id v43 = (id)[location rightAnchor];
    id v42 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v44, "constraintEqualToAnchor:");
    v155[0] = v42;
    v41 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
    v40 = [(UILayoutGuide *)v41 rightAnchor];
    id v39 = (id)[v147 leftAnchor];
    id v38 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v40, "constraintEqualToAnchor:");
    v155[1] = v38;
    id v37 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:2];
    -[CPSPointsOfInterestMapViewController setPickerModeConstraints:](v152, "setPickerModeConstraints:");
  }
  else
  {
    id v4 = v151[0];
    id v15 = (id)[v147 leftAnchor];
    id v14 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
    id v13 = (id)[v14 safeAreaLayoutGuide];
    id v12 = (id)[v13 leftAnchor];
    id v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 8.0);
    v154[0] = v11;
    id v10 = (id)[location rightAnchor];
    id v9 = (id)[(CPSPointsOfInterestMapViewController *)v152 view];
    id v8 = (id)[v9 safeAreaLayoutGuide];
    id v7 = (id)[v8 rightAnchor];
    id v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", -8.0);
    v154[1] = v6;
    id v5 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v154);
    objc_msgSend(v4, "addObjectsFromArray:");

    v24 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
    id v23 = [(UILayoutGuide *)v24 leftAnchor];
    id v22 = (id)[v147 rightAnchor];
    id v21 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v23, "constraintEqualToAnchor:");
    v153[0] = v21;
    id v20 = [(CPSPointsOfInterestMapViewController *)v152 mapVisibleRegionGuide];
    id v19 = [(UILayoutGuide *)v20 rightAnchor];
    id v18 = (id)[location leftAnchor];
    id v17 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v19, "constraintEqualToAnchor:");
    v153[1] = v17;
    id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:2];
    -[CPSPointsOfInterestMapViewController setPickerModeConstraints:](v152, "setPickerModeConstraints:");
  }
  id v2 = v151[0];
  int v3 = [(CPSPointsOfInterestMapViewController *)v152 pickerModeConstraints];
  objc_msgSend(v2, "addObjectsFromArray:");

  [MEMORY[0x263F08938] activateConstraints:v151[0]];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v147, 0);
  objc_storeStrong(&v150, 0);
  objc_storeStrong(v151, 0);
}

- (void)setUpMapView
{
  v30[4] = *MEMORY[0x263EF8340];
  id v28 = self;
  v27[1] = (id)a2;
  id v11 = [(CPSBaseEntityContentViewController *)self resourceProvider];
  id v10 = [(CPSEntityResourceProvider *)v11 templateEnvironment];
  v27[0] = [(CPSTemplateEnvironment *)v10 bundleIdentifier];

  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  id v26 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  id v12 = objc_alloc(MEMORY[0x263F00A60]);
  id v13 = MEMORY[0x263EF83A0];
  id location = (id)objc_msgSend(v12, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v27[0], v28);

  id v2 = objc_alloc(MEMORY[0x263F109A8]);
  id v14 = (id)objc_msgSend(v2, "initWithFrame:locationManager:", location, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[CPSPointsOfInterestMapViewController setMapView:](v28, "setMapView:");

  BOOL v15 = [(CPSPointsOfInterestMapViewController *)v28 isLocationAuthorized];
  id v16 = [(CPSPointsOfInterestMapViewController *)v28 mapView];
  [(MKMapView *)v16 setShowsUserLocation:v15];

  id v17 = [(CPSPointsOfInterestMapViewController *)v28 mapView];
  [(MKMapView *)v17 setShowsAttribution:0];

  id v18 = [(CPSPointsOfInterestMapViewController *)v28 mapView];
  -[MKMapView setMapType:](v18, "setMapType:");

  id v19 = [(CPSPointsOfInterestMapViewController *)v28 mapView];
  [(MKMapView *)v19 setDelegate:v28];

  id v20 = [(CPSPointsOfInterestMapViewController *)v28 mapView];
  [(MKMapView *)v20 setIsAccessibilityElement:0];

  memset(__b, 0, sizeof(__b));
  id obj = v26;
  uint64_t v22 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v22)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v22;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      Class v24 = 0;
      Class v24 = *(Class *)(__b[1] + 8 * v8);
      mapView = v28->_mapView;
      Class v3 = v24;
      id v5 = NSStringFromClass(v24);
      -[MKMapView registerClass:forAnnotationViewWithReuseIdentifier:](mapView, "registerClass:forAnnotationViewWithReuseIdentifier:", v3);

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

- (void)updateMapViewEdgeInsetsFittingAnnotations:(BOOL)a3
{
  id v91 = self;
  SEL v90 = a2;
  BOOL v89 = a3;
  v44 = [(CPSPointsOfInterestMapViewController *)self mapVisibleRegionGuide];
  [(UILayoutGuide *)v44 layoutFrame];
  uint64_t v81 = v3;
  uint64_t v82 = v4;
  uint64_t v83 = v5;
  uint64_t v84 = v6;
  id v43 = (id)[(CPSPointsOfInterestMapViewController *)v91 view];
  [v43 bounds];
  uint64_t v77 = v7;
  uint64_t v78 = v8;
  uint64_t v79 = v9;
  uint64_t v80 = v10;
  UIEdgeInsetsFromRectWithRect();
  double v85 = v11;
  double v86 = v12;
  double v87 = v13;
  double v88 = v14;

  v45 = [(CPSPointsOfInterestMapViewController *)v91 mapView];
  [(MKMapView *)v45 _edgeInsets];
  double v73 = v15;
  double v74 = v16;
  double v75 = v17;
  double v76 = v18;
  BOOL v46 = UIEdgeInsetsEqualToEdgeInsets(v85, v86, v87, v88, v15, v16, v17, v18);

  if (!v46)
  {
    id v38 = [(CPSPointsOfInterestMapViewController *)v91 mapView];
    [(MKMapView *)v38 centerCoordinate];
    *(void *)&long long v72 = v19;
    *((void *)&v72 + 1) = v20;

    id v39 = [(CPSPointsOfInterestMapViewController *)v91 mapView];
    -[MKMapView _setEdgeInsets:](v39, "_setEdgeInsets:", v85, v86, v87, v88);

    v41 = [(CPSPointsOfInterestMapViewController *)v91 mapView];
    v40 = [(MKMapView *)v41 camera];
    id v71 = (id)[(MKMapCamera *)v40 copy];

    long long v70 = v72;
    long long v69 = v72;
    [v71 setCenterCoordinate:v72];
    id v42 = [(CPSPointsOfInterestMapViewController *)v91 annotations];
    id v68 = (id)[(NSMutableDictionary *)v42 allValues];

    if (v89 && [v68 count])
    {
      [(CPSPointsOfInterestMapViewController *)v91 mapVisibleRegion];
      *(double *)&long long v65 = v21;
      *((double *)&v65 + 1) = v22;
      double v66 = v23;
      double v67 = v24;
      if (CPSCoordinateRegionContainsAnnotations(v68, v21, v22, v23, v24) & 1)
      {
        long long v54 = v65;
        long long v53 = v65;
        [v71 setCenterCoordinate:v65];
      }
      else
      {
        *(void *)&long long v61 = CPSCoordinateRegionForAnnotations(v68);
        *((void *)&v61 + 1) = v26;
        double v62 = v27;
        double v63 = v25;
        if (v25 <= v67)
        {
          long long v56 = v61;
          long long v55 = v61;
          [v71 setCenterCoordinate:v61];
        }
        else
        {
          id v36 = (void *)MEMORY[0x263F10940];
          id v37 = [(CPSPointsOfInterestMapViewController *)v91 mapVisibleRegionGuide];
          [(UILayoutGuide *)v37 layoutFrame];
          uint64_t v57 = v28;
          uint64_t v58 = v29;
          *(double *)&long long v59 = v30;
          *((double *)&v59 + 1) = v31;
          long long v60 = v59;
          id v32 = (id)objc_msgSend(v36, "_CPS_cameraForRegion:withSize:", *(double *)&v61, *((double *)&v61 + 1), v62, v63, v30, v31);
          id v33 = v71;
          id v71 = v32;
        }
      }
    }
    id v35 = [(CPSPointsOfInterestMapViewController *)v91 mapView];
    id v34 = v71;
    uint64_t v47 = MEMORY[0x263EF8330];
    int v48 = -1073741824;
    int v49 = 0;
    id v50 = __82__CPSPointsOfInterestMapViewController_updateMapViewEdgeInsetsFittingAnnotations___block_invoke;
    id v51 = &unk_2648A3BE0;
    id v52 = v91;
    [(MKMapView *)v35 _CPS_setCamera:v34 animated:1 completionBlock:&v47];

    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v71, 0);
  }
}

uint64_t __82__CPSPointsOfInterestMapViewController_updateMapViewEdgeInsetsFittingAnnotations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- ($0F579584AE83E668E5E9B43E027CB680)mapVisibleRegion
{
  uint64_t v10 = [(CPSPointsOfInterestMapViewController *)self mapView];
  uint64_t v9 = [(CPSPointsOfInterestMapViewController *)self mapVisibleRegionGuide];
  [(UILayoutGuide *)v9 layoutFrame];
  double v11 = v3;
  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  uint64_t v8 = [(CPSPointsOfInterestMapViewController *)self mapView];
  -[MKMapView convertRect:toRegionFromView:](v10, "convertRect:toRegionFromView:", v11, v12, v13, v14);

  return result;
}

- (void)highlightModel:(id)a3
{
  double v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    double v5 = [(CPSPointsOfInterestMapViewController *)v17 clusterAnnotations];
    id v6 = (id)[location[0] identifier];
    id v7 = (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:");
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    if (v7)
    {
      id v3 = v7;
    }
    else
    {
      double v14 = [(CPSPointsOfInterestMapViewController *)v17 annotations];
      char v13 = 1;
      id v12 = (id)[location[0] identifier];
      char v11 = 1;
      id v10 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:");
      char v9 = 1;
      id v3 = v10;
    }
    id v15 = v3;
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    double v4 = [(CPSPointsOfInterestMapViewController *)v17 mapView];
    uint64_t v8 = [(MKMapView *)v4 viewForAnnotation:v15];

    [(MKAnnotationView *)v8 setSelected:1 animated:1];
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)unhighlightModel:(id)a3
{
  double v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    double v5 = [(CPSPointsOfInterestMapViewController *)v17 clusterAnnotations];
    id v6 = (id)[location[0] identifier];
    id v7 = (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:");
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    if (v7)
    {
      id v3 = v7;
    }
    else
    {
      double v14 = [(CPSPointsOfInterestMapViewController *)v17 annotations];
      char v13 = 1;
      id v12 = (id)[location[0] identifier];
      char v11 = 1;
      id v10 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:");
      char v9 = 1;
      id v3 = v10;
    }
    id v15 = v3;
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    double v4 = [(CPSPointsOfInterestMapViewController *)v17 mapView];
    uint64_t v8 = [(MKMapView *)v4 viewForAnnotation:v15];

    [(MKAnnotationView *)v8 setSelected:0 animated:1];
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)reloadAnnotations:(BOOL)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  BOOL v46 = self;
  SEL v45 = a2;
  BOOL v44 = a3;
  if ([(CPSPointsOfInterestMapViewController *)self isViewLoaded])
  {
    uint64_t v28 = [(CPSPointsOfInterestMapViewController *)v46 annotations];
    id v27 = (id)[(NSMutableDictionary *)v28 allValues];
    id v43 = (id)[v27 mutableCopy];

    double v30 = [(CPSPointsOfInterestMapViewController *)v46 mapView];
    uint64_t v29 = [(MKMapView *)v30 annotations];
    id v42 = (id)[(NSArray *)v29 mutableCopy];

    id v41 = (id)[v43 mutableCopy];
    id v40 = (id)objc_opt_new();
    memset(__b, 0, sizeof(__b));
    id obj = v43;
    uint64_t v32 = [obj countByEnumeratingWithState:__b objects:v49 count:16];
    if (v32)
    {
      uint64_t v24 = *(void *)__b[2];
      uint64_t v25 = 0;
      unint64_t v26 = v32;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)__b[2] != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void *)(__b[1] + 8 * v25);
        if ([v42 containsObject:v39]) {
          [v41 removeObject:v39];
        }
        ++v25;
        if (v23 + 1 >= v26)
        {
          uint64_t v25 = 0;
          unint64_t v26 = [obj countByEnumeratingWithState:__b objects:v49 count:16];
          if (!v26) {
            break;
          }
        }
      }
    }

    memset(v36, 0, sizeof(v36));
    id v21 = v42;
    uint64_t v22 = [v21 countByEnumeratingWithState:v36 objects:v48 count:16];
    if (v22)
    {
      uint64_t v18 = *(void *)v36[2];
      uint64_t v19 = 0;
      unint64_t v20 = v22;
      while (1)
      {
        uint64_t v17 = v19;
        if (*(void *)v36[2] != v18) {
          objc_enumerationMutation(v21);
        }
        id v37 = *(id *)(v36[1] + 8 * v19);
        if (([v43 containsObject:v37] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v40 addObject:v37];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id location = v37;
              memset(v33, 0, sizeof(v33));
              id v15 = (id)[location memberAnnotations];
              uint64_t v16 = [v15 countByEnumeratingWithState:v33 objects:v47 count:16];
              if (v16)
              {
                uint64_t v12 = *(void *)v33[2];
                uint64_t v13 = 0;
                unint64_t v14 = v16;
                while (1)
                {
                  uint64_t v11 = v13;
                  if (*(void *)v33[2] != v12) {
                    objc_enumerationMutation(v15);
                  }
                  id v34 = *(id *)(v33[1] + 8 * v13);
                  id v10 = [(CPSPointsOfInterestMapViewController *)v46 clusterAnnotations];
                  id v9 = (id)[v34 pointOfInterest];
                  id v8 = (id)[v9 identifier];
                  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:");

                  ++v13;
                  if (v11 + 1 >= v14)
                  {
                    uint64_t v13 = 0;
                    unint64_t v14 = [v15 countByEnumeratingWithState:v33 objects:v47 count:16];
                    if (!v14) {
                      break;
                    }
                  }
                }
              }

              objc_storeStrong(&location, 0);
            }
          }
        }
        ++v19;
        if (v17 + 1 >= v20)
        {
          uint64_t v19 = 0;
          unint64_t v20 = [v21 countByEnumeratingWithState:v36 objects:v48 count:16];
          if (!v20) {
            break;
          }
        }
      }
    }

    id v6 = [(CPSPointsOfInterestMapViewController *)v46 mapView];
    [(MKMapView *)v6 removeAnnotations:v40];

    id v7 = [(CPSPointsOfInterestMapViewController *)v46 mapView];
    [(MKMapView *)v7 addAnnotations:v41];

    if (v44)
    {
      double v5 = [(CPSPointsOfInterestMapViewController *)v46 mapView];
      double v4 = [(CPSPointsOfInterestMapViewController *)v46 annotations];
      id v3 = (id)[(NSMutableDictionary *)v4 allValues];
      -[MKMapView showAnnotations:animated:](v5, "showAnnotations:animated:");

      [(CPSPointsOfInterestMapViewController *)v46 updateMapViewEdgeInsetsFittingAnnotations:1];
      [(CPSPointsOfInterestMapViewController *)v46 setHasPerformedInitialLayout:1];
    }
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
  }
}

- (void)zoomToLocation:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v4 = [(CPSPointsOfInterestMapViewController *)v9 annotations];
  id v3 = (id)[location[0] identifier];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:");

  id v6 = [(CPSPointsOfInterestMapViewController *)v9 mapView];
  v10[0] = v7;
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  -[MKMapView showAnnotations:animated:](v6, "showAnnotations:animated:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  id v61 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = v62;
    id v39 = [(CPSPointsOfInterestMapViewController *)v64 template];
    uint64_t v35 = [v39 selectedIndex];
    id v38 = [(CPSPointsOfInterestMapViewController *)v64 pointsOfInterest];
    id v37 = (id)[v38 pointsOfInterest];
    id v36 = (id)[v60 pointOfInterest];
    BOOL v40 = v35 == objc_msgSend(v37, "indexOfObject:");

    BOOL v59 = v40;
    id v42 = (id)[v60 pointOfInterest];
    id v41 = (id)[v42 pinImageSet];
    id v58 = (id)[v41 image];

    if (v58)
    {
      id v32 = location[0];
      double v4 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v4);
      id v34 = (id)objc_msgSend(v32, "dequeueReusableAnnotationViewWithIdentifier:");
      char v55 = 0;
      char v53 = 0;
      if (v34)
      {
        id v5 = (CPSPointOfInterestAnnotationView *)v34;
      }
      else
      {
        double v31 = [CPSPointOfInterestAnnotationView alloc];
        id v30 = v62;
        id v6 = (objc_class *)objc_opt_class();
        long long v56 = NSStringFromClass(v6);
        char v55 = 1;
        long long v54 = -[CPSPointOfInterestAnnotationView initWithAnnotation:reuseIdentifier:](v31, "initWithAnnotation:reuseIdentifier:", v30);
        char v53 = 1;
        id v5 = v54;
      }
      uint64_t v57 = v5;
      if (v53) {

      }
      if (v55) {
      id v27 = (id)[v60 pointOfInterest];
      }
      id v26 = (id)[v27 pinImageSet];
      -[CPSPointOfInterestAnnotationView setImageSet:](v57, "setImageSet:");

      id v29 = (id)[v60 pointOfInterest];
      id v28 = (id)[v29 selectedPinImageSet];
      -[CPSPointOfInterestAnnotationView setSelectedImageSet:](v57, "setSelectedImageSet:");

      if (v59) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = kCPSPointsOfInterestClusteringIdentifier;
      }
      [(MKAnnotationView *)v57 setClusteringIdentifier:v25];
      if (v59)
      {
        LODWORD(v7) = 1148846080;
        [v61 setDisplayPriority:v7];
      }
      objc_storeStrong(&v61, v57);
      objc_storeStrong((id *)&v57, 0);
    }
    else
    {
      id v22 = location[0];
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v8);
      id v24 = (id)objc_msgSend(v22, "dequeueReusableAnnotationViewWithIdentifier:");
      char v51 = 0;
      char v49 = 0;
      if (v24)
      {
        objc_storeStrong(&v61, v24);
      }
      else
      {
        id v21 = objc_alloc(MEMORY[0x263F109D0]);
        id v20 = v62;
        id v9 = (objc_class *)objc_opt_class();
        id v52 = NSStringFromClass(v9);
        char v51 = 1;
        id v50 = (id)objc_msgSend(v21, "initWithAnnotation:reuseIdentifier:", v20);
        char v49 = 1;
        objc_storeStrong(&v61, v50);
      }
      if (v49) {

      }
      if (v51) {
    }
      }
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v60, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = location[0];
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v10);
      id v19 = (id)objc_msgSend(v17, "dequeueReusableAnnotationViewWithIdentifier:");
      char v46 = 0;
      char v44 = 0;
      if (v19)
      {
        uint64_t v11 = (CPSPointOfInterestClusterView *)v19;
      }
      else
      {
        uint64_t v16 = [CPSPointOfInterestClusterView alloc];
        id v15 = v62;
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v47 = NSStringFromClass(v12);
        char v46 = 1;
        SEL v45 = -[CPSPointOfInterestClusterView initWithAnnotation:reuseIdentifier:](v16, "initWithAnnotation:reuseIdentifier:", v15);
        char v44 = 1;
        uint64_t v11 = v45;
      }
      int v48 = v11;
      if (v44) {

      }
      if (v46) {
      objc_storeStrong(&v61, v48);
      }
      objc_storeStrong((id *)&v48, 0);
    }
  }
  id v14 = v61;
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);

  return v14;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  memset(__b, 0, sizeof(__b));
  id v9 = v13;
  uint64_t v10 = [v9 countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(v9);
      }
      id v12 = *(id *)(__b[1] + 8 * v6);
      [v12 setEnabled:0];
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v9 countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)mapView:(id)a3 clusterAnnotationForMemberAnnotations:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v4 = objc_alloc(MEMORY[0x263F108A8]);
  id v20 = (id)[v4 initWithMemberAnnotations:v21];
  memset(__b, 0, sizeof(__b));
  id v16 = v21;
  uint64_t v17 = [v16 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v17)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v17;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(v16);
      }
      id v19 = *(id *)(__b[1] + 8 * v13);
      uint64_t v10 = [(CPSPointsOfInterestMapViewController *)v23 clusterAnnotations];
      id v7 = v20;
      id v9 = (id)[v19 pointOfInterest];
      id v8 = (id)[v9 identifier];
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7);

      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v16 countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v6 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = (id)[v10 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = (id)[v10 annotation];
    uint64_t v5 = [(CPSPointsOfInterestMapViewController *)v12 pickerViewController];
    id v4 = (id)[v9 pointOfInterest];
    -[CPSPointsOfInterestPickerViewController setSelectedItem:](v5, "setSelectedItem:");

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isRegionChanging]) {
    [(CPSPointsOfInterestMapViewController *)v5 _notifyRegionDidChange];
  }
  objc_storeStrong(location, 0);
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(CPSPointsOfInterestMapViewController *)v6 hasPerformedInitialLayout]
    && a4
    && ([location[0] _isAnimating] & 1) == 0)
  {
    [(CPSPointsOfInterestMapViewController *)v6 setHasPerformedInitialLayout:1];
    [(CPSPointsOfInterestMapViewController *)v6 _notifyRegionDidChange];
  }
  objc_storeStrong(location, 0);
}

- (void)_notifyRegionDidChange
{
  id v8 = [(CPSPointsOfInterestMapViewController *)self panTimer];
  BOOL v9 = 0;
  if (!v8) {
    BOOL v9 = [(CPSPointsOfInterestMapViewController *)self hasPerformedInitialLayout];
  }

  if (v9)
  {
    id v7 = [(CPSBaseEntityContentViewController *)self resourceProvider];
    id v6 = [(CPSEntityResourceProvider *)v7 actionDelegate];
    [(CPSPointsOfInterestMapViewController *)self mapVisibleRegion];
    -[CPSEntityActionDelegate entityContentViewController:regionDidChange:](v6, "entityContentViewController:regionDidChange:", self, v2, v3, v4, v5);
  }
}

- (void)zoomIn
{
  BOOL v9 = self;
  v8[1] = (id)a2;
  double v2 = [(CPSPointsOfInterestMapViewController *)self mapView];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __46__CPSPointsOfInterestMapViewController_zoomIn__block_invoke;
  id v7 = &unk_2648A3BE0;
  v8[0] = v9;
  -[MKMapView _zoomInWithCompletionHandler:](v2, "_zoomInWithCompletionHandler:");

  objc_storeStrong(v8, 0);
}

uint64_t __46__CPSPointsOfInterestMapViewController_zoomIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)zoomOut
{
  BOOL v9 = self;
  v8[1] = (id)a2;
  double v2 = [(CPSPointsOfInterestMapViewController *)self mapView];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __47__CPSPointsOfInterestMapViewController_zoomOut__block_invoke;
  id v7 = &unk_2648A3BE0;
  v8[0] = v9;
  -[MKMapView _zoomOutWithCompletionHandler:](v2, "_zoomOutWithCompletionHandler:");

  objc_storeStrong(v8, 0);
}

uint64_t __47__CPSPointsOfInterestMapViewController_zoomOut__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)beginPanningWithCompletion:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [(CPSPointsOfInterestMapViewController *)v21 panViewController];
  BOOL v7 = v3 != 0;

  if (!v7) {
    [(CPSPointsOfInterestMapViewController *)v21 setUpPanView];
  }
  [(CPSPointsOfInterestMapViewController *)v21 setPanCompletionHandler:location[0]];
  int v4 = (void *)MEMORY[0x263F1CB60];
  id v6 = [(CPSPointsOfInterestMapViewController *)v21 pickerViewController];
  id v5 = (id)[(CPSPointsOfInterestPickerViewController *)v6 view];
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  uint64_t v17 = __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke;
  uint64_t v18 = &unk_2648A3BE0;
  id v19 = v21;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke_2;
  uint64_t v12 = &unk_2648A3B90;
  uint64_t v13 = v21;
  [v4 transitionWithView:v5 duration:0x10000 options:&v14 animations:&v8 completion:0.25];

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(location, 0);
}

void __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) panViewController];
  id v1 = (id)[v2 view];
  objc_msgSend(v1, "setAlpha:");

  id v4 = (id)[*(id *)(a1 + 32) pickerViewController];
  id v3 = (id)[v4 view];
  [v3 setAlpha:0.0];

  id v6 = (id)[*(id *)(a1 + 32) donePanningButton];
  [v6 setAlpha:1.0];
}

uint64_t __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke_2(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) panViewController];
  id v2 = (id)[v3 view];
  [v2 setHidden:0];

  id v5 = (id)[*(id *)(a1 + 32) pickerViewController];
  id v4 = (id)[v5 view];
  [v4 setHidden:1];

  id v6 = (void *)MEMORY[0x263F08938];
  id v7 = (id)[*(id *)(a1 + 32) pickerModeConstraints];
  objc_msgSend(v6, "deactivateConstraints:");

  uint64_t v8 = (void *)MEMORY[0x263F08938];
  id v9 = (id)[*(id *)(a1 + 32) panModeConstraints];
  objc_msgSend(v8, "activateConstraints:");

  [*(id *)(a1 + 32) updateMapViewEdgeInsetsFittingAnnotations:0];
  return [*(id *)(a1 + 32) _updateFocusedItem];
}

- (void)centerMap
{
  id v24 = self;
  SEL v23 = a2;
  id v2 = [(CPSPointsOfInterestMapViewController *)self userLocation];
  BOOL v12 = v2 != 0;

  if (v12)
  {
    [(CPSPointsOfInterestMapViewController *)v24 setCenterMapPending:0];
    id v7 = [(CPSPointsOfInterestMapViewController *)v24 userLocation];
    [(CLLocation *)v7 coordinate];
    *(void *)&long long v22 = v3;
    *((void *)&v22 + 1) = v4;

    id v9 = [(CPSPointsOfInterestMapViewController *)v24 mapView];
    uint64_t v8 = [(MKMapView *)v9 camera];
    id v21 = (id)[(MKMapCamera *)v8 copy];

    long long v20 = v22;
    long long v19 = v22;
    [v21 setCenterCoordinate:v22];
    int v10 = [(CPSPointsOfInterestMapViewController *)v24 annotations];
    BOOL v11 = [(NSMutableDictionary *)v10 count] != 0;

    if (!v11) {
      [v21 setCenterCoordinateDistance:12500.0];
    }
    id v6 = [(CPSPointsOfInterestMapViewController *)v24 mapView];
    id v5 = v21;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __49__CPSPointsOfInterestMapViewController_centerMap__block_invoke;
    uint64_t v17 = &unk_2648A3BE0;
    uint64_t v18 = v24;
    [(MKMapView *)v6 _CPS_setCamera:v5 animated:1 completionBlock:&v13];

    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    [(CPSPointsOfInterestMapViewController *)v24 setCenterMapPending:1];
  }
}

uint64_t __49__CPSPointsOfInterestMapViewController_centerMap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __75__CPSPointsOfInterestMapViewController_locationManager_didUpdateLocations___block_invoke;
  int v10 = &unk_2648A3BE0;
  BOOL v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSPointsOfInterestMapViewController_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) centerMapPending])
  {
    id v1 = (id)[*(id *)(a1 + 32) annotations];
    BOOL v2 = [v1 count] != 0;

    if (!v2) {
      [*(id *)(a1 + 32) centerMap];
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if ([v12 code] == 1)
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __73__CPSPointsOfInterestMapViewController_locationManager_didFailWithError___block_invoke;
    int v10 = &unk_2648A3BE0;
    BOOL v11 = v14;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __73__CPSPointsOfInterestMapViewController_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) locationManager];
  [v1 stopUpdatingLocation];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __78__CPSPointsOfInterestMapViewController_locationManagerDidChangeAuthorization___block_invoke;
  int v8 = &unk_2648A3BE0;
  id v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __78__CPSPointsOfInterestMapViewController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  char v3 = [*(id *)(a1 + 32) isLocationAuthorized];
  id v4 = (id)[*(id *)(a1 + 32) mapView];
  [v4 setShowsUserLocation:v3 & 1];

  uint64_t result = [*(id *)(a1 + 32) isLocationAuthorized];
  if (result)
  {
    id v2 = (id)[*(id *)(a1 + 32) locationManager];
    [v2 startUpdatingLocation];

    return [*(id *)(a1 + 32) setCenterMapPending:1];
  }
  return result;
}

- (void)setUpLocationManager
{
  uint64_t v18 = self;
  v17[1] = (id)a2;
  id v2 = [(CPSPointsOfInterestMapViewController *)self locationManager];
  BOOL v16 = v2 != 0;

  if (!v16)
  {
    id v4 = [(CPSBaseEntityContentViewController *)v18 resourceProvider];
    char v3 = [(CPSEntityResourceProvider *)v4 templateEnvironment];
    v17[0] = [(CPSTemplateEnvironment *)v3 bundleIdentifier];

    id v7 = objc_alloc(MEMORY[0x263F00A60]);
    id v5 = v17[0];
    int v6 = v18;
    id v9 = MEMORY[0x263EF83A0];
    id v8 = (id)objc_msgSend(v7, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v5, v6);
    -[CPSPointsOfInterestMapViewController setLocationManager:](v18, "setLocationManager:");

    int v10 = v18;
    BOOL v11 = [(CPSPointsOfInterestMapViewController *)v18 locationManager];
    [(CLLocationManager *)v11 setDelegate:v10];

    double v12 = *MEMORY[0x263F00AF0];
    uint64_t v13 = [(CPSPointsOfInterestMapViewController *)v18 locationManager];
    [(CLLocationManager *)v13 setDistanceFilter:v12];

    double v14 = *MEMORY[0x263F00B10];
    int v15 = [(CPSPointsOfInterestMapViewController *)v18 locationManager];
    [(CLLocationManager *)v15 setDesiredAccuracy:v14];

    objc_storeStrong(v17, 0);
  }
}

- (BOOL)isLocationAuthorized
{
  id v4 = [(CPSPointsOfInterestMapViewController *)self locationManager];
  CLAuthorizationStatus v5 = [(CLLocationManager *)v4 authorizationStatus];

  BOOL v2 = v5 != kCLAuthorizationStatusAuthorizedWhenInUse && v5 != kCLAuthorizationStatusAuthorizedAlways;
  return !v2;
}

- (void)setUpPanView
{
  v96[4] = *MEMORY[0x263EF8340];
  double v92 = self;
  v91[1] = (id)a2;
  v91[0] = (id)objc_opt_new();
  id v29 = [CPSPanViewController alloc];
  double v31 = [(CPSBaseEntityContentViewController *)v92 resourceProvider];
  id v30 = [(CPSEntityResourceProvider *)v31 templateEnvironment];
  id location = -[CPSPanViewController initWithEnvironment:](v29, "initWithEnvironment:");

  [location setPanDelegate:v92];
  [(CPSPointsOfInterestMapViewController *)v92 setPanViewController:location];
  id v32 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  [(CPSPanViewController *)v32 willMoveToParentViewController:v92];

  id v33 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  -[CPSPointsOfInterestMapViewController addChildViewController:](v92, "addChildViewController:");

  id v36 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  uint64_t v35 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  id v34 = (id)[(CPSPanViewController *)v35 view];
  objc_msgSend(v36, "addSubview:");

  id v37 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  [(CPSPanViewController *)v37 didMoveToParentViewController:v92];

  double v66 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  id v65 = (id)[(CPSPanViewController *)v66 view];
  id v64 = (id)[v65 topAnchor];
  id v63 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  id v62 = (id)[v63 safeAreaLayoutGuide];
  id v61 = (id)[v62 topAnchor];
  id v60 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
  v96[0] = v60;
  BOOL v59 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  id v58 = (id)[(CPSPanViewController *)v59 view];
  id v57 = (id)[v58 bottomAnchor];
  id v56 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  id v55 = (id)[v56 safeAreaLayoutGuide];
  id v54 = (id)[v55 bottomAnchor];
  id v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
  v96[1] = v53;
  id v52 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  id v51 = (id)[(CPSPanViewController *)v52 view];
  id v50 = (id)[v51 leftAnchor];
  id v49 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  id v48 = (id)[v49 safeAreaLayoutGuide];
  id v47 = (id)[v48 leftAnchor];
  id v46 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v96[2] = v46;
  SEL v45 = [(CPSPointsOfInterestMapViewController *)v92 panViewController];
  id v44 = (id)[(CPSPanViewController *)v45 view];
  id v43 = (id)[v44 rightAnchor];
  id v42 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  id v41 = (id)[v42 safeAreaLayoutGuide];
  id v40 = (id)[v41 rightAnchor];
  id v39 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
  v96[3] = v39;
  id v38 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v96);
  objc_msgSend(v91[0], "addObjectsFromArray:");

  double v67 = objc_alloc_init(CPSActionButton);
  -[CPSPointsOfInterestMapViewController setDonePanningButton:](v92, "setDonePanningButton:");

  id v68 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSButton *)v68 setDelegate:v92];

  long long v69 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSActionButton *)v69 setLayoutDelegate:v92];

  long long v70 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSActionButton *)v70 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v72 = CPSLocalizedStringForKey(@"DONE");
  id v71 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSActionButton *)v71 setButtonText:v72];

  double v76 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  double v75 = [(CPSActionButton *)v76 buttonText];
  id v95 = v75;
  id v74 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  double v73 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSActionButton *)v73 setAccessibilityUserInputLabels:v74];

  uint64_t v78 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  id v77 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
  -[CPSActionButton setTitleColor:forState:](v78, "setTitleColor:forState:");

  uint64_t v80 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  id v79 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
  -[CPSActionButton setTitleColor:forState:](v80, "setTitleColor:forState:");

  id v83 = +[CPSEntityStyles mapButtonDropShadow];
  uint64_t v82 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  id v81 = (id)[(CPSActionButton *)v82 layer];
  objc_msgSend(v83, "applyShadowToLayer:");

  id v85 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
  uint64_t v84 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  objc_msgSend(v85, "addSubview:");

  double v86 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
  [(CPSActionButton *)v86 setNeedsLayout];

  double v88 = [(CPSBaseEntityContentViewController *)v92 resourceProvider];
  double v87 = [(CPSEntityResourceProvider *)v88 templateEnvironment];
  BOOL v89 = [(CPSTemplateEnvironment *)v87 rightHandDrive];

  if (v89)
  {
    int v15 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
    id v14 = (id)[(CPSActionButton *)v15 trailingAnchor];
    id v13 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
    id v12 = (id)[v13 safeAreaLayoutGuide];
    id v11 = (id)[v12 trailingAnchor];
    id v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:", -8.0);
    v93[0] = v10;
    id v9 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
    id v8 = (id)[(CPSActionButton *)v9 topAnchor];
    id v7 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
    id v6 = (id)[v7 safeAreaLayoutGuide];
    id v5 = (id)[v6 topAnchor];
    id v4 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 8.0);
    v93[1] = v4;
    id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
    objc_msgSend(v91[0], "addObjectsFromArray:");
  }
  else
  {
    id v28 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
    id v27 = (id)[(CPSActionButton *)v28 leadingAnchor];
    id v26 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
    id v25 = (id)[v26 safeAreaLayoutGuide];
    id v24 = (id)[v25 leadingAnchor];
    id v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:");
    v94[0] = v23;
    long long v22 = [(CPSPointsOfInterestMapViewController *)v92 donePanningButton];
    id v21 = (id)[(CPSActionButton *)v22 topAnchor];
    id v20 = (id)[(CPSPointsOfInterestMapViewController *)v92 view];
    id v19 = (id)[v20 safeAreaLayoutGuide];
    id v18 = (id)[v19 topAnchor];
    id v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", 8.0);
    v94[1] = v17;
    id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
    objc_msgSend(v91[0], "addObjectsFromArray:");
  }
  objc_msgSend(MEMORY[0x263F08938], "activateConstraints:", v91[0], v91);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v2, 0);
}

- (void)didSelectButton:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (CPSActionButton *)location[0];
  id v3 = [(CPSPointsOfInterestMapViewController *)v7 donePanningButton];
  BOOL v5 = v4 != v3;

  if (!v5) {
    [(CPSPointsOfInterestMapViewController *)v7 dismissPanView:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (CGSize)buttonSize
{
  CGSizeMake_5();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)font
{
  return +[CPSEntityStyles mapButtonFont];
}

- (id)buttonBackgroundColor
{
  id v4 = [(CPSPointsOfInterestMapViewController *)self donePanningButton];
  char v7 = 0;
  char v5 = 0;
  if ([(CPSActionButton *)v4 isFocused])
  {
    id v8 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    char v7 = 1;
    id v2 = v8;
  }
  else
  {
    id v6 = +[CPSEntityStyles mapButtonBackgroundColor];
    char v5 = 1;
    id v2 = v6;
  }
  id v9 = v2;
  if (v5) {

  }
  if (v7) {

  }
  return v9;
}

- (double)buttonRadius
{
  return 14.0;
}

- (void)panBeganWithDirection:(int64_t)a3
{
  id v13 = self;
  SEL v12 = a2;
  id v11 = (void *)a3;
  double v3 = (void *)MEMORY[0x263EFFA20];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __62__CPSPointsOfInterestMapViewController_panBeganWithDirection___block_invoke;
  id v9 = &unk_2648A4960;
  v10[0] = self;
  v10[1] = v11;
  id v4 = (id)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, 0.016);
  -[CPSPointsOfInterestMapViewController setPanTimer:](v13, "setPanTimer:");

  objc_storeStrong(v10, 0);
}

void __62__CPSPointsOfInterestMapViewController_panBeganWithDirection___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17[1] = (id)a1;
  id v12 = (id)[*(id *)(a1 + 32) mapView];
  id v11 = (id)[v12 camera];
  v17[0] = (id)[v11 copy];

  [v17[0] centerCoordinate];
  double v15 = v2;
  double v16 = v3;
  [v17[0] altitude];
  double v14 = 0.00008 * (v4 / 1000.0);
  unint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = v5 > 1;
  unint64_t v7 = v5 - 1;
  if (v6)
  {
    unint64_t v9 = v7;
    char v8 = 1;
  }
  else
  {
    unint64_t v9 = v7;
    char v8 = 0;
  }
  if ((v8 & 1) == 0)
  {
    switch(v9)
    {
      case 0uLL:
        double v16 = v16 - v14;
        break;
      case 1uLL:
        double v16 = v16 + v14;
        break;
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
        break;
      case 3uLL:
        double v15 = v15 + v14;
        break;
      case 7uLL:
        double v15 = v15 - v14;
        break;
      default:
        JUMPOUT(0);
    }
  }
  objc_msgSend(v17[0], "setCenterCoordinate:", v15, v16);
  id v10 = (id)[*(id *)(a1 + 32) mapView];
  [v10 setCamera:v17[0] animated:0];

  objc_storeStrong(v17, 0);
  objc_storeStrong(location, 0);
}

- (void)panEndedWithDirection:(int64_t)a3
{
  double v3 = [(CPSPointsOfInterestMapViewController *)self panTimer];
  [(NSTimer *)v3 invalidate];

  [(CPSPointsOfInterestMapViewController *)self setPanTimer:0];
  [(CPSPointsOfInterestMapViewController *)self _notifyRegionDidChange];
}

- (void)panWithDirection:(int64_t)a3
{
  id v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  id v11 = [(CPSPointsOfInterestMapViewController *)self mapView];
  id v10 = [(MKMapView *)v11 camera];
  id v22 = (id)[(MKMapCamera *)v10 copy];

  [v22 centerCoordinate];
  *(void *)&long long v21 = v3;
  *((void *)&v21 + 1) = v4;
  [v22 altitude];
  double v20 = 0.003 * (v5 / 1000.0);
  if (v23 <= 1)
  {
    unint64_t v7 = v23 - 1;
    char v6 = 0;
  }
  else
  {
    unint64_t v7 = v23 - 1;
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    switch(v7)
    {
      case 0uLL:
        *((double *)&v21 + 1) = *((double *)&v21 + 1) - v20;
        break;
      case 1uLL:
        *((double *)&v21 + 1) = *((double *)&v21 + 1) + v20;
        break;
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
        break;
      case 3uLL:
        *(double *)&long long v21 = *(double *)&v21 + v20;
        break;
      case 7uLL:
        *(double *)&long long v21 = *(double *)&v21 - v20;
        break;
      default:
        JUMPOUT(0);
    }
  }
  long long v19 = v21;
  long long v18 = v21;
  [v22 setCenterCoordinate:v21];
  unint64_t v9 = [(CPSPointsOfInterestMapViewController *)v25 mapView];
  id v8 = v22;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  double v15 = __57__CPSPointsOfInterestMapViewController_panWithDirection___block_invoke;
  double v16 = &unk_2648A3BE0;
  id v17 = v25;
  [(MKMapView *)v9 _CPS_setCamera:v8 animated:1 completionBlock:&v12];

  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v22, 0);
}

uint64_t __57__CPSPointsOfInterestMapViewController_panWithDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)dismissPanView:(id)a3
{
  long long v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = (void *)MEMORY[0x263F1CB60];
  char v6 = [(CPSPointsOfInterestMapViewController *)v21 pickerViewController];
  id v5 = (id)[(CPSPointsOfInterestPickerViewController *)v6 view];
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke;
  long long v18 = &unk_2648A3BE0;
  long long v19 = v21;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke_2;
  uint64_t v12 = &unk_2648A3B90;
  int v13 = v21;
  [v4 transitionWithView:v5 duration:0x10000 options:&v14 animations:&v8 completion:0.25];

  id v7 = [(CPSPointsOfInterestMapViewController *)v21 panCompletionHandler];
  if (v7)
  {
    uint64_t v3 = (void (**)(void))[(CPSPointsOfInterestMapViewController *)v21 panCompletionHandler];
    v3[2]();

    [(CPSPointsOfInterestMapViewController *)v21 setPanCompletionHandler:0];
  }
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(location, 0);
}

void __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) panViewController];
  id v1 = (id)[v2 view];
  objc_msgSend(v1, "setAlpha:");

  id v4 = (id)[*(id *)(a1 + 32) pickerViewController];
  id v3 = (id)[v4 view];
  [v3 setAlpha:1.0];

  id v6 = (id)[*(id *)(a1 + 32) donePanningButton];
  [v6 setAlpha:0.0];
}

uint64_t __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke_2(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) panViewController];
  id v2 = (id)[v3 view];
  [v2 setHidden:1];

  id v5 = (id)[*(id *)(a1 + 32) pickerViewController];
  id v4 = (id)[v5 view];
  [v4 setHidden:0];

  id v6 = (void *)MEMORY[0x263F08938];
  id v7 = (id)[*(id *)(a1 + 32) panModeConstraints];
  objc_msgSend(v6, "deactivateConstraints:");

  uint64_t v8 = (void *)MEMORY[0x263F08938];
  id v9 = (id)[*(id *)(a1 + 32) pickerModeConstraints];
  objc_msgSend(v8, "activateConstraints:");

  [*(id *)(a1 + 32) updateMapViewEdgeInsetsFittingAnnotations:1];
  return [*(id *)(a1 + 32) _updateFocusedItem];
}

- (void)picker:(id)a3 didSelectModel:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  [(CPSPointsOfInterestMapViewController *)v11 highlightModel:v9];
  uint64_t v8 = [(CPSBaseEntityContentViewController *)v11 resourceProvider];
  id v7 = [(CPSEntityResourceProvider *)v8 actionDelegate];
  id v5 = v11;
  id v6 = (id)[v9 identifier];
  -[CPSEntityActionDelegate entityContentViewController:didSelectPointOfInterestWithIdentifier:](v7, "entityContentViewController:didSelectPointOfInterestWithIdentifier:", v5);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didDeselectModel:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSPointsOfInterestMapViewController *)v7 unhighlightModel:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didHighlightModel:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSPointsOfInterestMapViewController *)v7 highlightModel:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didUnhighlightModel:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSPointsOfInterestMapViewController *)v7 unhighlightModel:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)_linearFocusMovementSequences
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = self;
  v6[1] = (id)a2;
  id v3 = objc_alloc(MEMORY[0x263F1CCA0]);
  id v4 = [(CPSPointsOfInterestMapViewController *)v7 _linearFocusItems];
  v6[0] = (id)objc_msgSend(v3, "initWithItems:loops:restrictEnteringSequence:");

  v8[0] = v6[0];
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  objc_storeStrong(v6, 0);

  return v5;
}

- (id)_linearFocusItems
{
  double v75 = self;
  v74[1] = (id)a2;
  v74[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v73 = 0;
  id v62 = [(CPSPointsOfInterestMapViewController *)v75 panViewController];
  id v63 = (id)[(CPSPanViewController *)v62 view];
  char v71 = 0;
  char v69 = 0;
  BOOL v64 = 0;
  if (v63)
  {
    id v72 = [(CPSPointsOfInterestMapViewController *)v75 panViewController];
    char v71 = 1;
    id v70 = (id)[(CPSPanViewController *)v72 view];
    char v69 = 1;
    BOOL v64 = ([v70 isHidden] & 1) == 0;
  }
  if (v69) {

  }
  if (v71) {
  BOOL v73 = v64;
  }
  if (v64)
  {
    id v58 = [(CPSPointsOfInterestMapViewController *)v75 panViewController];
    id location = [(CPSPanViewController *)v58 panView];

    id v60 = [(CPSBaseEntityContentViewController *)v75 resourceProvider];
    BOOL v59 = [(CPSEntityResourceProvider *)v60 templateEnvironment];
    BOOL v61 = [(CPSTemplateEnvironment *)v59 rightHandDrive];

    BOOL v67 = v61;
    if (v61)
    {
      id v34 = (id)[location panRightButton];

      if (v34)
      {
        id v33 = (id)[location panRightButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v32 = (id)[location panDownButton];

      if (v32)
      {
        id v31 = (id)[location panDownButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v29 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v30 = [(CPSPointsOfInterestMapControlsViewController *)v29 zoomOutButton];

      if (v30)
      {
        id v28 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        id v27 = [(CPSPointsOfInterestMapControlsViewController *)v28 zoomOutButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v25 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v26 = [(CPSPointsOfInterestMapControlsViewController *)v25 zoomInButton];

      if (v26)
      {
        SEL v24 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        unint64_t v23 = [(CPSPointsOfInterestMapControlsViewController *)v24 zoomInButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v22 = (id)[location panLeftButton];

      if (v22)
      {
        id v21 = (id)[location panLeftButton];
        objc_msgSend(v74[0], "addObject:");
      }
      long long v19 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      double v20 = [(CPSPointsOfInterestMapControlsViewController *)v19 centerButton];

      if (v20)
      {
        long long v18 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        id v17 = [(CPSPointsOfInterestMapControlsViewController *)v18 centerButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v16 = (id)[location panUpButton];

      if (v16)
      {
        id v15 = (id)[location panUpButton];
        objc_msgSend(v74[0], "addObject:");
      }
      int v13 = [(CPSPointsOfInterestMapViewController *)v75 donePanningButton];
      [(CPSActionButton *)v13 alpha];
      BOOL v14 = v3 != 1.0;

      if (!v14)
      {
        uint64_t v12 = [(CPSPointsOfInterestMapViewController *)v75 donePanningButton];
        objc_msgSend(v74[0], "addObject:");
      }
    }
    else
    {
      id v56 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v57 = [(CPSPointsOfInterestMapControlsViewController *)v56 centerButton];

      if (v57)
      {
        id v55 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        id v54 = [(CPSPointsOfInterestMapControlsViewController *)v55 centerButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v53 = (id)[location panRightButton];

      if (v53)
      {
        id v52 = (id)[location panRightButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v50 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v51 = [(CPSPointsOfInterestMapControlsViewController *)v50 zoomInButton];

      if (v51)
      {
        id v49 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        id v48 = [(CPSPointsOfInterestMapControlsViewController *)v49 zoomInButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v46 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v47 = [(CPSPointsOfInterestMapControlsViewController *)v46 zoomOutButton];

      if (v47)
      {
        SEL v45 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
        id v44 = [(CPSPointsOfInterestMapControlsViewController *)v45 zoomOutButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v43 = (id)[location panDownButton];

      if (v43)
      {
        id v42 = (id)[location panDownButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v41 = (id)[location panLeftButton];

      if (v41)
      {
        id v40 = (id)[location panLeftButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v38 = [(CPSPointsOfInterestMapViewController *)v75 donePanningButton];
      [(CPSActionButton *)v38 alpha];
      BOOL v39 = v2 != 1.0;

      if (!v39)
      {
        id v37 = [(CPSPointsOfInterestMapViewController *)v75 donePanningButton];
        objc_msgSend(v74[0], "addObject:");
      }
      id v36 = (id)[location panUpButton];

      if (v36)
      {
        id v35 = (id)[location panUpButton];
        objc_msgSend(v74[0], "addObject:");
      }
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    uint64_t v8 = [(CPSPointsOfInterestMapViewController *)v75 pickerViewController];
    id v66 = [(CPSPointsOfInterestPickerViewController *)v8 _linearFocusItems];

    id v9 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
    id v65 = [(CPSPointsOfInterestMapControlsViewController *)v9 _linearFocusItems];

    int v10 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
    id v11 = [(CPSPointsOfInterestMapControlsViewController *)v10 centerButton];

    if (v11)
    {
      id v7 = [(CPSPointsOfInterestMapViewController *)v75 mapControlsViewController];
      id v6 = [(CPSPointsOfInterestMapControlsViewController *)v7 centerButton];
      objc_msgSend(v74[0], "addObject:");
    }
    if (v66) {
      [v74[0] addObjectsFromArray:v66];
    }
    if (v65) {
      [v74[0] addObjectsFromArray:v65];
    }
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
  }
  id v5 = v74[0];
  objc_storeStrong(v74, 0);

  return v5;
}

- (BOOL)useRightHandDriveFocusGuide
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  v23[1] = *MEMORY[0x263EF8340];
  double v20 = self;
  SEL v19 = a2;
  BOOL v18 = 0;
  uint64_t v8 = [(CPSPointsOfInterestMapViewController *)self panViewController];
  id v9 = (id)[(CPSPanViewController *)v8 view];
  char v16 = 0;
  char v14 = 0;
  BOOL v10 = 0;
  if (v9)
  {
    id v17 = [(CPSPointsOfInterestMapViewController *)v20 panViewController];
    char v16 = 1;
    id v15 = (id)[(CPSPanViewController *)v17 view];
    char v14 = 1;
    BOOL v10 = ([v15 isHidden] & 1) == 0;
  }
  if (v14) {

  }
  if (v16) {
  BOOL v18 = v10;
  }
  if (v10)
  {
    id v6 = [(CPSPointsOfInterestMapViewController *)v20 panViewController];
    int v13 = [(CPSPanViewController *)v6 panView];

    id v7 = [(CPSPanView *)v13 panUpButton];
    v23[0] = v7;
    id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];

    objc_storeStrong((id *)&v13, 0);
  }
  else
  {
    id v5 = [(CPSPointsOfInterestMapViewController *)v20 pickerViewController];
    id v12 = [(CPSPointsOfInterestPickerViewController *)v5 _linearFocusItems];

    if ([v12 count])
    {
      id v4 = (id)[v12 firstObject];
      id v22 = v4;
      id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];

      int v11 = 1;
    }
    else
    {
      int v11 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (!v11) {
      id v21 = MEMORY[0x263EFFA68];
    }
  }
  double v2 = v21;

  return v2;
}

- (void)_updateFocusedItem
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = (id)[objc_alloc(MEMORY[0x263F1CCB0]) initWithEnvironment:self];
  [v3[0] setAllowsDeferral:0];
  id v2 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v4];
  [v2 _requestFocusUpdate:v3[0]];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (CPSPointsOfInterestPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
}

- (CPSPointsOfInterestMapControlsViewController)mapControlsViewController
{
  return self->_mapControlsViewController;
}

- (void)setMapControlsViewController:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UILayoutGuide)mapVisibleRegionGuide
{
  return self->_mapVisibleRegionGuide;
}

- (void)setMapVisibleRegionGuide:(id)a3
{
}

- (BOOL)centerMapPending
{
  return self->_centerMapPending;
}

- (void)setCenterMapPending:(BOOL)a3
{
  self->_centerMapPending = a3;
}

- (NSArray)pickerModeConstraints
{
  return self->_pickerModeConstraints;
}

- (void)setPickerModeConstraints:(id)a3
{
}

- (NSArray)panModeConstraints
{
  return self->_panModeConstraints;
}

- (void)setPanModeConstraints:(id)a3
{
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSMutableDictionary)clusterAnnotations
{
  return self->_clusterAnnotations;
}

- (void)setClusterAnnotations:(id)a3
{
}

- (CPSPanViewController)panViewController
{
  return self->_panViewController;
}

- (void)setPanViewController:(id)a3
{
}

- (id)panCompletionHandler
{
  return self->_panCompletionHandler;
}

- (void)setPanCompletionHandler:(id)a3
{
}

- (CPSActionButton)donePanningButton
{
  return self->_donePanningButton;
}

- (void)setDonePanningButton:(id)a3
{
}

- (NSTimer)panTimer
{
  return self->_panTimer;
}

- (void)setPanTimer:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (void).cxx_destruct
{
}

@end