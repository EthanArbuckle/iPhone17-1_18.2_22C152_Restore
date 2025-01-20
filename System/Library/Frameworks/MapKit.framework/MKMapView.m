@interface MKMapView
+ ($DC1C8D958DDC8D67D0023B74A9319680)_regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 viewInsets:(CGSize)a5 edgePadding:(UIEdgeInsets)a6 region:(UIEdgeInsets)a7 minZoomLevel:(id *)a8 maxZoomLevel:(double)a9 snapToZoomLevel:(double)a10;
+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 edgeInsets:(CGSize)a5 region:(UIEdgeInsets)a6;
+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 region:(CGSize)a5;
+ (int64_t)_defaultOverlayLevel;
+ (long)_mapRectThatFitsViewBounds:(double)a3 mapRect:(double)a4 viewInsets:(double)a5 edgePadding:(double)a6 minZoomLevel:(double)a7 maxZoomLevel:(double)a8 snapToZoomLevel:(uint64_t)a9;
+ (unint64_t)minZoomLevelForMapType:(unint64_t)a3 viewSize:(CGSize)a4;
+ (void)setRendersInBackgroundByDefault:(BOOL)a3;
- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle;
- ($DC1C8D958DDC8D67D0023B74A9319680)_convertRect:(SEL)a3 toRegionFromView:(CGRect)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerMapPoint;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_convertPoint:(CGPoint)a3 toMapPointFromView:(id)a4;
- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration;
- ($FD2884BA735A6398BD92EEF91FE53E55)_convertRect:(CGRect)a3 toMapRectFromView:(id)a4;
- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4;
- ($FD2884BA735A6398BD92EEF91FE53E55)overlayContainerVisibleMapRect:(id)a3;
- ($FD8927DAD66E183363B3D9E862D46D99)_zoomRegionForMapRect:(SEL)a3 edgePadding:(id)a4 maxZoomLevel:(UIEdgeInsets)a5 minZoomLevel:(int64_t)a6;
- ($FF918C85BF8E73478720C66798E418D4)_userTrackingBehavior;
- (BOOL)_allowsPopoverWhenNotInWindow;
- (BOOL)_alwaysShowHeadingIndicator;
- (BOOL)_annotationViewsAreAddedImmediately;
- (BOOL)_automaticallySnapsToNorth;
- (BOOL)_canEnter3DMode;
- (BOOL)_canEnter3DModeFlyover;
- (BOOL)_canEnterNightMode;
- (BOOL)_canSelectAllLabels;
- (BOOL)_canSelectPOIs;
- (BOOL)_canShowAppleLogo;
- (BOOL)_canShowControls;
- (BOOL)_canShowFlyover;
- (BOOL)_canZoomIn;
- (BOOL)_canZoomOut;
- (BOOL)_clearUserLocationOnLocationReset;
- (BOOL)_hasSelectedTransitLines;
- (BOOL)_iconsShouldAlignToPixels;
- (BOOL)_isAnimating;
- (BOOL)_isAttributionBadgeClickable;
- (BOOL)_isChangingRegionForGesture;
- (BOOL)_isCompassSuppressedForFloorPicker;
- (BOOL)_isDimmingOutsideVenueWithFocus;
- (BOOL)_isHandlingNonselectingTap;
- (BOOL)_isHandlingUserEvent;
- (BOOL)_isHybridMap;
- (BOOL)_isInactive;
- (BOOL)_isLocationPropagationEnabled;
- (BOOL)_isLocationPulseEnabled;
- (BOOL)_isPitched;
- (BOOL)_isPoint:(CGPoint)a3 nearUserLocationView:(double)a4;
- (BOOL)_isShowingAttributionBadge;
- (BOOL)_isShowingCuratedElevatedGround;
- (BOOL)_isShowingFlyover;
- (BOOL)_isUserLocationInView:(BOOL)a3;
- (BOOL)_isUserLocationViewCentered:(double)a3;
- (BOOL)_isUsingDevResourceStyleSheet;
- (BOOL)_isVectorKitConsoleEnabled;
- (BOOL)_isZooming;
- (BOOL)_loadLookAroundAvailability;
- (BOOL)_localizeLabels;
- (BOOL)_mapViewHasUpdatedCamera;
- (BOOL)_mustWaitUntilSized;
- (BOOL)_panWithMomentum;
- (BOOL)_pressEnded:(id)a3;
- (BOOL)_roomForCompass;
- (BOOL)_rotationPossible;
- (BOOL)_shouldAnimatePositionWithRouteMatch;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldCallAnnotationViewCallback:(id)a3;
- (BOOL)_shouldDeselectMapFeatureForNewPreferredConfiguration:(id)a3;
- (BOOL)_shouldDisplayScaleForCurrentRegion;
- (BOOL)_shouldLoadFallbackTiles;
- (BOOL)_shouldSplitRouteLine;
- (BOOL)_shouldSupportAlwaysShowHeadingIndicator;
- (BOOL)_shouldUpdateSelectedRouteFromRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (BOOL)_showHeadingIndicator;
- (BOOL)_showHeadingIndicatorForStepping;
- (BOOL)_showsAppleLogo;
- (BOOL)_showsContourLabels;
- (BOOL)_showsCurrentEnvironmentName;
- (BOOL)_showsLabels;
- (BOOL)_showsNightMode;
- (BOOL)_showsPhysicalFeatureLabels;
- (BOOL)_showsPointLabels;
- (BOOL)_showsPointsOfInterest;
- (BOOL)_showsPressedLabelMarkerEffect;
- (BOOL)_showsRoadLabels;
- (BOOL)_showsRoadShields;
- (BOOL)_showsScaleDuringZoom;
- (BOOL)_showsTrafficIncidents;
- (BOOL)_showsVenues;
- (BOOL)_supportsVKMapType:(int)a3;
- (BOOL)_updateRotationSupported;
- (BOOL)_useBalloonCalloutsForLabels;
- (BOOL)_useVehicleHeading;
- (BOOL)_userLocationWithinVisibleMapBounds;
- (BOOL)accessoryViewContainsPoint:(CGPoint)a3;
- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5;
- (BOOL)annotationContainerIsRotated:(id)a3;
- (BOOL)annotationContainerShouldAlignToPixels:(id)a3;
- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4;
- (BOOL)annotationManager:(id)a3 shouldAnimateDeselectionOfAnnotation:(id)a4 forSelectionOfAnnotation:(id)a5;
- (BOOL)calloutViewContainsPoint:(CGPoint)a3;
- (BOOL)canBecomeFocused;
- (BOOL)canPossiblyShowCompassForInternalControl:(BOOL)a3;
- (BOOL)canRotateForHeading;
- (BOOL)canShowAttributionBadge;
- (BOOL)canShowCompass;
- (BOOL)canShowPitch;
- (BOOL)canShowZoom;
- (BOOL)compassVisible;
- (BOOL)displayedFloorIsDefaultForBuildingsInVenue:(id)a3;
- (BOOL)effectsEnabled;
- (BOOL)gestureController:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasRenderedSomething;
- (BOOL)hasUserLocation;
- (BOOL)ignoreLocationUpdates;
- (BOOL)isCurrentlyRotated;
- (BOOL)isLocationConsoleEnabled;
- (BOOL)isPitchEnabled;
- (BOOL)isRegionChanging;
- (BOOL)isRotateEnabled;
- (BOOL)isScrollEnabled;
- (BOOL)isShowingNoDataPlaceholders;
- (BOOL)isSuspended;
- (BOOL)isUserLocationVisible;
- (BOOL)isWithinHikingBoundary;
- (BOOL)isWithinHikingBufferRegion;
- (BOOL)isZoomEnabled;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)postsMapViewInitialRenderingNotification;
- (BOOL)rendersInBackground;
- (BOOL)shouldHideOffscreenSelectedAnnotation;
- (BOOL)showsAttribution;
- (BOOL)showsBuildings;
- (BOOL)showsCompass;
- (BOOL)showsLiveEVData;
- (BOOL)showsPitchControl;
- (BOOL)showsScale;
- (BOOL)showsTraffic;
- (BOOL)showsUserLocation;
- (BOOL)showsUserTrackingButton;
- (BOOL)showsZoomControls;
- (CGPoint)_centerPoint;
- (CGPoint)_convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4;
- (CGPoint)_convertMapPoint:(id)a3 toPointToView:(id)a4;
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)coordinate toPointToView:(UIView *)view;
- (CGPoint)gestureController:(id)a3 focusPointForPoint:(CGPoint)a4 gestureKind:(int64_t)a5;
- (CGRect)_convertMapRect:(id)a3 toRectToView:(id)a4;
- (CGRect)_convertRegion:(id *)a3 toRectToView:(id)a4;
- (CGRect)_currentEnvironmentLabelFrame;
- (CGRect)_currentEnvironmentNameFrame;
- (CGRect)annotationVisibleRect;
- (CGRect)attributionBadgeBounds;
- (CGRect)attributionFrame;
- (CGRect)convertRegion:(MKCoordinateRegion)region toRectToView:(UIView *)view;
- (CGRect)gestureControllerSignificantViewFrame:(id)a3;
- (CGRect)visibleCenteringRectInView:(id)a3;
- (CGRect)visibleRectInView:(id)a3;
- (CLLocation)predictedUserLocation;
- (CLLocationCoordinate2D)_convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4;
- (CLLocationCoordinate2D)centerCoordinate;
- (CLLocationCoordinate2D)convertPoint:(CGPoint)point toCoordinateFromView:(UIView *)view;
- (GEOMapRegion)mapRegion;
- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier;
- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier forAnnotation:(id)annotation;
- (MKAnnotationView)userLocationView;
- (MKAnnotationView)viewForAnnotation:(id)annotation;
- (MKCoordinateRegion)convertRect:(CGRect)rect toRegionFromView:(UIView *)view;
- (MKCoordinateRegion)region;
- (MKCoordinateRegion)regionThatFits:(MKCoordinateRegion)region;
- (MKDebugLocationConsole)_debugConsole;
- (MKFeatureVisibility)pitchButtonVisibility;
- (MKLabelSelectionFilter)_labelSelectionFilter;
- (MKLocationManager)_locationManager;
- (MKMapCameraBoundary)cameraBoundary;
- (MKMapCameraZoomRange)cameraZoomRange;
- (MKMapConfiguration)configuration;
- (MKMapConfiguration)preferredConfiguration;
- (MKMapFeatureOptions)selectableMapFeatures;
- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect;
- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets;
- (MKMapRect)visibleMapRect;
- (MKMapType)mapType;
- (MKMapView)initWithCoder:(id)a3;
- (MKMapView)initWithFrame:(CGRect)a3;
- (MKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4;
- (MKMapViewDelegate)_safeDelegate;
- (MKOverlayRenderer)rendererForOverlay:(id)overlay;
- (MKOverlayView)viewForOverlay:(id)overlay;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (MKUserLocation)userLocation;
- (MKUserTrackingMode)userTrackingMode;
- (NSArray)_annotationViews;
- (NSArray)_transitLineMarkersInCurrentViewport;
- (NSArray)_visibleTileSets;
- (NSArray)annotations;
- (NSArray)overlays;
- (NSArray)overlaysInLevel:(MKOverlayLevel)level;
- (NSArray)selectedAnnotations;
- (NSDictionary)_detailedDescriptionDictionaryRepresentation;
- (NSSet)annotationsInMapRect:(MKMapRect)mapRect;
- (NSString)_detailedDescription;
- (NSTimer)_startEffectsTimer;
- (OS_dispatch_group)_calloutShowAnimationGroup;
- (UIEdgeInsets)_attributionInsets;
- (UIEdgeInsets)_compassInsets;
- (UIEdgeInsets)_edgeInsets;
- (UIEdgeInsets)_labelEdgeInsets;
- (UIEdgeInsets)_labelEdgeWidths;
- (UIGestureRecognizer)_oneHandedZoomGestureRecognizer;
- (UILayoutGuide)_edgeInsetsLayoutGuide;
- (UILongPressGestureRecognizer)_longPressGestureRecognizer;
- (UIPanGestureRecognizer)_panningGestureRecognizer;
- (UIPinchGestureRecognizer)_pinchGestureRecognizer;
- (UIRotationGestureRecognizer)_rotationGestureRecognizer;
- (UITapGestureRecognizer)_doubleTapGestureRecognizer;
- (UITapGestureRecognizer)_nonselectingTapGestureRecognizer;
- (UITapGestureRecognizer)_selectingTapGestureRecognizer;
- (UITapGestureRecognizer)_twoFingerTapGestureRecognizer;
- (VKLabelMarker)_selectedLabelMarker;
- (VKMapView)_mapLayer;
- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus;
- (VKVenueFeatureMarker)venueWithFocus;
- (double)_animationDurationWhenSettingCameraBoundary:(id)a3;
- (double)_boundedZoomLevel:(double)a3;
- (double)_cameraAltitudeClampedToZoomRange:(id)a3;
- (double)_compassDiameter;
- (double)_defaultAnimationDurationForMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4;
- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromView:(id)a5 withPrecision:(int64_t)a6;
- (double)_durationForCamera:(id)a3;
- (double)_geoCoordinateRegionForOffline;
- (double)_goToCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5;
- (double)_mapKitZoomLevelForVectorKitTileZoomLevel:(double)a3;
- (double)_maximumZoomLevel;
- (double)_minimumZoomLevel;
- (double)_panDurationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (double)_vectorKitTileZoomLevelForMapKitZoomLevel:(double)a3;
- (double)_zoomLevel;
- (double)_zoomLevelForMapRect:(id)a3 includeAccessoryPadding:(BOOL)a4;
- (double)_zoomLevelForRegion:(id *)a3 includeAccessoryPadding:(BOOL)a4;
- (double)_zoomScale;
- (double)_zoomScaleForMapRegion:(id)a3;
- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5;
- (double)gestureController:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5;
- (double)presentationYaw;
- (double)zoomToFocusVenue:(id)a3;
- (double)zoomToFocusVenueBuilding:(id)a3;
- (id)_annotationAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4;
- (id)_camera;
- (id)_commonInitFromIB:(BOOL)a3 gestureRecognizerHostView:(id)a4 locationManager:(id)a5 showsAttribution:(BOOL)a6 showsAppleLogo:(BOOL)a7 allowsAntialiasing:(BOOL)a8 carDisplayType:(int64_t)a9;
- (id)_commonVisibilityAnimation:(BOOL)a3;
- (id)_controlStackView;
- (id)_debugConsoleAdditionalInfoProvider;
- (id)_flattenedAnnotationsForAnnotationViews:(id)a3 maxDisplayPriority:(float *)a4;
- (id)_initWithFrame:(CGRect)a3 allowsAntialiasing:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 gestureRecognizerHostView:(id)a4 showsAttribution:(BOOL)a5 showsAppleLogo:(BOOL)a6 allowsAntialiasing:(BOOL)a7 carDisplayType:(int64_t)a8;
- (id)_labelMarkerAtPoint:(CGPoint)a3;
- (id)_labelMarkerForCustomFeatureAnnotation:(id)a3;
- (id)_labelMarkersInCurrentViewport;
- (id)_labelMarkersInCurrentViewportForType:(int)a3;
- (id)_labelsDidLayoutCallback;
- (id)_mapRegionWithCenterCoordinate:(CLLocationCoordinate2D)a3 zoomScale:(double)a4;
- (id)_pitchButton;
- (id)_routeInfoForRoute:(id)a3;
- (id)_selectedTransitLineIDs;
- (id)_transitLineMarkerForIdentifier:(id)a3;
- (id)_transitLineMarkersForSelectionAtPoint:(CGPoint)a3;
- (id)_userTrackingButton;
- (id)_vkTimingFunctionForUIViewAnimationCurve:(int64_t)a3;
- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4;
- (id)annotationCoordinateTest;
- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4;
- (id)annotationRectTest;
- (id)beginStoppingEffects;
- (id)compassView;
- (id)createDrawableForOverlay:(id)a3;
- (id)delegate;
- (id)focusEffect;
- (id)initFromIBWithFrame:(CGRect)a3;
- (id)mapAttributionWithStringAttributes:(id)a3;
- (id)mapAttributionWithStringAttributes:(id)a3 allowMultiLine:(BOOL)a4;
- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4;
- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4 linkAttribution:(BOOL)a5;
- (id)mapLayerPresentationForAnnotation:(id)a3;
- (id)overlayContainer;
- (id)scaleView;
- (id)urlForMapAttribution;
- (id)venueWithID:(unint64_t)a3;
- (id)vk_mapLayer;
- (int)_applicationState;
- (int)_viewIndexForSubview:(id)a3;
- (int)attributionCorner;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)_attributionLinkDisplayStyle;
- (int64_t)_controlsUserInterfaceStyleOverride;
- (int64_t)_displayedSearchResultsType;
- (int64_t)_interactionMode;
- (int64_t)_interfaceOrientation;
- (int64_t)_lookAroundAvailability;
- (int64_t)_offlineRegionVisibility;
- (int64_t)_roundedZoomLevel;
- (int64_t)_scaleVisibility;
- (int64_t)compassViewSize;
- (int64_t)compassViewStyle;
- (int64_t)focusItemDeferralMode;
- (int64_t)labelTextSize;
- (signed)defaultFloorForBuildingsInVenue:(id)a3;
- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3;
- (unint64_t)_compassInsetEdges;
- (unint64_t)_controlBackgroundStyle;
- (unint64_t)_controlSize;
- (unint64_t)_currentFlyoverAnimationID;
- (unint64_t)_pitchButtonBackgroundStyle;
- (unint64_t)_pitchButtonControlSize;
- (unint64_t)_scaleControlSize;
- (unint64_t)_selectedFeatureID;
- (unint64_t)_userTrackingButtonBackgroundStyle;
- (unint64_t)_userTrackingControlSize;
- (void)_addAnnotation:(id)a3 allowAnimation:(BOOL)a4;
- (void)_addAnnotations:(id)a3 allowAnimation:(BOOL)a4;
- (void)_addAnnotationsCustomFeatureStoreIfNeeded;
- (void)_addCustomFeatureDataSource:(id)a3;
- (void)_addDebugGesture;
- (void)_addDependentAuxiliaryBlock:(id)a3;
- (void)_addDependentSetRegionBlock:(id)a3;
- (void)_addDependentSetRegionBlock:(id)a3 completion:(id)a4;
- (void)_addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5;
- (void)_addPersistentVectorOverlay:(id)a3;
- (void)_addSetRegionBlock:(id)a3;
- (void)_addSetRegionBlock:(id)a3 completion:(id)a4;
- (void)_addVectorOverlay:(id)a3;
- (void)_addViewsForAnnotations:(id)a3;
- (void)_annotationViewDragStateChanged:(id)a3;
- (void)_clearFixedUserLocation;
- (void)_clearGestureRecognizers;
- (void)_clearGesturesAndAnimations;
- (void)_clearLayoutGuides;
- (void)_clearRouteContext;
- (void)_configureGestureRecognizers:(id)a3;
- (void)_countUsageForAnnotationViewsIfNeeded:(id)a3;
- (void)_countUsageForRendererIfNeeded:(id)a3;
- (void)_countUsageOfTypeIfNeeded:(unint64_t)a3 forAnnotationView:(id)a4 countedEventTypes:(id)a5;
- (void)_createAnnotationViewSetIfNeeded;
- (void)_createOverlayRendererDictionaryIfNeeded;
- (void)_deselectCurrentFeatureAnnotationIfNeededAnimated:(BOOL)a3;
- (void)_deselectLabelMarkerAnimated:(BOOL)a3;
- (void)_deselectTransitLineMarker;
- (void)_didChangeRegionMidstream:(BOOL)a3;
- (void)_didEndZoom;
- (void)_displayWorld;
- (void)_dropDraggingAnnotationView:(BOOL)a3;
- (void)_enter3DMode;
- (void)_enterARMode;
- (void)_enterARModeWithLocation:(id)a3;
- (void)_exit3DMode;
- (void)_exitARMode;
- (void)_fixUserLocationFromPresentationValue;
- (void)_forceFrame;
- (void)_forceManifestUpdateIfNecessary;
- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5;
- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)_goToMapRegion:(id)a3 duration:(double)a4 timingFunction:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)_handleCompassTap:(id)a3;
- (void)_handleLongPressGesture:(id)a3;
- (void)_handleSelectGestureToDeselect:(id)a3;
- (void)_handleSelectGestureToSelect:(id)a3;
- (void)_handleSelectionAtPoint:(CGPoint)a3;
- (void)_insertSubview:(id)a3;
- (void)_insertSubviewBelowAnnotationContainerView:(id)a3;
- (void)_invalidateAllOverlayRendererColors;
- (void)_issueDatasetCheckinCall;
- (void)_layoutAttribution;
- (void)_locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5;
- (void)_offlineStateDidChange:(id)a3;
- (void)_pauseFlyoverAnimation;
- (void)_pauseUserLocationUpdates;
- (void)_performActionAsIfGoingToDefaultLocation:(id)a3;
- (void)_performFlyoverAnimation:(id)a3;
- (void)_performFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4;
- (void)_performWhenSizedBlocks;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_postDidChangeZoomNotificationIfNeeded;
- (void)_postDidUpdateYawNotification;
- (void)_prepareFlyoverAnimation:(id)a3 completion:(id)a4;
- (void)_registerConfigurationObservers;
- (void)_registerSceneLifecycleNotifications;
- (void)_registerTraitCollectionObservation;
- (void)_removeCustomFeatureDataSource:(id)a3;
- (void)_removePersistentVectorOverlay:(id)a3;
- (void)_removeVectorOverlay:(id)a3;
- (void)_replaceAnnotation:(id)a3 withAnnotation:(id)a4;
- (void)_resumeFlyoverAnimation;
- (void)_resumePropagatingEdgeInsets;
- (void)_resumeUserInteraction;
- (void)_resumeUserLocationUpdates:(BOOL)a3;
- (void)_sceneDidFinishSuspensionSnapshot:(id)a3;
- (void)_selectLabelMarker:(id)a3 animated:(BOOL)a4;
- (void)_selectTransitLineMarker:(id)a3;
- (void)_selectTransitLineMarkerWithIdentifier:(id)a3;
- (void)_selectUserLocationTypeWithDeltaZoomLevel:(double)a3;
- (void)_setAlternateRouteContextAnnotationETAComparison:(unsigned __int8)a3 forRoute:(id)a4;
- (void)_setAlwaysShowHeadingIndicatorIfSupported:(BOOL)a3;
- (void)_setApplicationState:(int)a3;
- (void)_setAttributionBadgeClickable:(BOOL)a3;
- (void)_setAttributionInsets:(UIEdgeInsets)a3;
- (void)_setAttributionLinkDisplayStyle:(int64_t)a3;
- (void)_setAutomaticallySnapsToNorth:(BOOL)a3;
- (void)_setCamera:(id)a3;
- (void)_setCamera:(id)a3 animated:(BOOL)a4;
- (void)_setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)_setCamera:(id)a3 completionHandler:(id)a4;
- (void)_setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9;
- (void)_setCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6;
- (void)_setCamera:(id)a3 duration:(double)a4 timingCurve:(int64_t)a5 completionHandler:(id)a6;
- (void)_setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7;
- (void)_setCameraBoundary:(id)a3 animated:(BOOL)a4;
- (void)_setCameraZoomRange:(id)a3 animated:(BOOL)a4;
- (void)_setCanSelectAllLabels:(BOOL)a3;
- (void)_setCanSelectPOIs:(BOOL)a3;
- (void)_setCartographicConfiguration:(id *)a3;
- (void)_setCartographicConfiguration:(id *)a3 animated:(BOOL)a4;
- (void)_setCartographicConfiguration:(id *)a3 onInit:(BOOL)a4 animated:(BOOL)a5;
- (void)_setClearUserLocationOnLocationReset:(BOOL)a3;
- (void)_setCompassInsetEdges:(unint64_t)a3;
- (void)_setCompassInsets:(UIEdgeInsets)a3;
- (void)_setCompassInsets:(UIEdgeInsets)a3 animated:(BOOL)a4;
- (void)_setCompassSuppressedForFloorPicker:(BOOL)a3;
- (void)_setCompassViewSize:(int64_t)a3 style:(int64_t)a4;
- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5;
- (void)_setControlBackgroundStyle:(unint64_t)a3;
- (void)_setControlSize:(unint64_t)a3;
- (void)_setCurrentFlyoverAnimationID:(unint64_t)a3;
- (void)_setDebugConsoleAdditionalInfoProvider:(id)a3;
- (void)_setDisplayedSearchResultsType:(int64_t)a3;
- (void)_setEdgeInsets:(UIEdgeInsets)a3;
- (void)_setEdgeInsets:(UIEdgeInsets)a3 explicit:(BOOL)a4;
- (void)_setInactive:(BOOL)a3;
- (void)_setInteractionMode:(int64_t)a3;
- (void)_setLabelEdgeInsets:(UIEdgeInsets)a3;
- (void)_setLabelEdgeWidths:(UIEdgeInsets)a3;
- (void)_setLabelSelectionFilter:(id)a3;
- (void)_setLabelSelectionFilter:(id)a3 animated:(BOOL)a4;
- (void)_setLabelsDidLayoutCallback:(id)a3;
- (void)_setLoadLookAroundAvailability:(BOOL)a3;
- (void)_setLocalizeLabels:(BOOL)a3;
- (void)_setLocationPropagationEnabled:(BOOL)a3;
- (void)_setLocationPulseEnabled:(BOOL)a3;
- (void)_setMapDisplayStyle:(id)a3;
- (void)_setMapType:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setOfflineRegionVisibility:(int64_t)a3;
- (void)_setPanWithMomentum:(BOOL)a3;
- (void)_setPitchButtonBackgroundStyle:(unint64_t)a3;
- (void)_setPitchButtonControlSize:(unint64_t)a3;
- (void)_setPitchButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4;
- (void)_setPreferredConfiguration:(id)a3 onInit:(BOOL)a4;
- (void)_setRouteContext:(id)a3;
- (void)_setRouteContextAnnotationFocus:(BOOL)a3 forRoute:(id)a4;
- (void)_setRouteContextAnnotationText:(id)a3 etaType:(int64_t)a4 tollCurrency:(unsigned __int8)a5 advisoryStyleAttributes:(id)a6 forRoute:(id)a7;
- (void)_setRouteContextAnnotationTexts:(id)a3 forLegsInRoute:(id)a4;
- (void)_setRouteContextForRoute:(id)a3;
- (void)_setRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)_setRouteContextInspectedSegmentIndex:(unint64_t)a3 inspectedStepIndex:(unint64_t)a4;
- (void)_setSafeDelegate:(id)a3;
- (void)_setScaleControlSize:(unint64_t)a3;
- (void)_setScaleVisibility:(int64_t)a3;
- (void)_setSelectedFeatureID:(unint64_t)a3;
- (void)_setShouldAnimatePositionWithRouteMatch:(BOOL)a3;
- (void)_setShouldLoadFallbackTiles:(BOOL)a3;
- (void)_setShouldSplitRouteLine:(BOOL)a3;
- (void)_setShowHeadingIndicator:(BOOL)a3;
- (void)_setShowHeadingIndicatorForStepping:(BOOL)a3;
- (void)_setShowsAppleLogo:(BOOL)a3;
- (void)_setShowsAppleLogo:(BOOL)a3 force:(BOOL)a4;
- (void)_setShowsCountourLabels:(BOOL)a3;
- (void)_setShowsCurrentEnvironmentName:(BOOL)a3;
- (void)_setShowsLabels:(BOOL)a3;
- (void)_setShowsNightMode:(BOOL)a3;
- (void)_setShowsPhysicalFeatureLabels:(BOOL)a3;
- (void)_setShowsPointLabels:(BOOL)a3;
- (void)_setShowsPressedLabelMarkerEffect:(BOOL)a3;
- (void)_setShowsRoadLabels:(BOOL)a3;
- (void)_setShowsRoadShields:(BOOL)a3;
- (void)_setShowsScaleDuringZoom:(BOOL)a3;
- (void)_setShowsTrafficIncidents:(BOOL)a3;
- (void)_setShowsVenues:(BOOL)a3;
- (void)_setTracePlaybackSpeedMultiplier:(double)a3;
- (void)_setTrackingButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4;
- (void)_setUseBalloonCalloutsForLabels:(BOOL)a3;
- (void)_setUseVehicleHeading:(BOOL)a3;
- (void)_setUserTrackingBehavior:(id *)a3;
- (void)_setUserTrackingButtonBackgroundStyle:(unint64_t)a3;
- (void)_setUserTrackingControlSize:(unint64_t)a3;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5;
- (void)_setVectorKitConsoleEnabled:(BOOL)a3;
- (void)_setVisibleMapRect:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)_setVisibleMapRect:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 animated:(BOOL)a6;
- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7;
- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 animated:(BOOL)a6;
- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7;
- (void)_showOrHideScaleIfNecessary:(BOOL)a3;
- (void)_sizeDidChangeWithCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)_sizeWillChange;
- (void)_snapToNorthIfNecessary;
- (void)_snapToTrueNorthAndCallBack:(BOOL)a3;
- (void)_startEffects;
- (void)_startFlyoverTourAnimation:(unint64_t)a3 duration:(double)a4 completion:(id)a5;
- (void)_startPanningAtPoint:(CGPoint)a3;
- (void)_startTrackingHeading;
- (void)_stopEffects;
- (void)_stopFlyoverAnimation;
- (void)_stopPanningAtPoint:(CGPoint)a3;
- (void)_stopPostingCompassUpdateNotifications;
- (void)_stopPostingScaleUpdateNotifications;
- (void)_stopTrackingHeading;
- (void)_suspendPropagatingEdgeInsets;
- (void)_suspendUserInteraction;
- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)_unregisterConfigurationObservers;
- (void)_unregisterSceneLifecycleNotifications;
- (void)_updateAppearanceIfNeeded;
- (void)_updateAppleLogoVisibility;
- (void)_updateAttribution;
- (void)_updateCameraState;
- (void)_updateCartographicConfiguration;
- (void)_updateCartographicConfigurationOnInit:(BOOL)a3;
- (void)_updateCompassPositionClassic;
- (void)_updateCompassVisibility;
- (void)_updateContentBounds;
- (void)_updateControlsPosition:(BOOL)a3;
- (void)_updateCourseForMapViewHeading:(id)a3;
- (void)_updateEffects;
- (void)_updateEnvironmentLabelText;
- (void)_updateFallbackTileLoading;
- (void)_updateFramingUsingSetRegionBlock:(id)a3;
- (void)_updateFromCamera:(id)a3;
- (void)_updateFromCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6;
- (void)_updateHeading:(id)a3 animated:(BOOL)a4;
- (void)_updateHeadingIndicatorAnimated:(BOOL)a3;
- (void)_updateHeadingOrientation;
- (void)_updateIconsShouldAlignToPixels;
- (void)_updateInsets;
- (void)_updateInsetsWithForce:(BOOL)a3;
- (void)_updateLocationConsole;
- (void)_updatePanWithTranslation:(CGPoint)a3;
- (void)_updatePitchButtonVisibility;
- (void)_updatePointOfInterestFilter;
- (void)_updateRotationAttributes;
- (void)_updateScale;
- (void)_updateScalePosition;
- (void)_updateScrollContainerView:(BOOL)a3 forReason:(int64_t)a4;
- (void)_updateScrollingAndGestures;
- (void)_updateShouldDisplayEffects;
- (void)_updateShowHeadingIndicator;
- (void)_updateShowsHiking;
- (void)_updateShowsTraffic;
- (void)_updateStackViewPosition;
- (void)_updateTrackingVisibility;
- (void)_updateUserLocation:(id)a3 routeMatch:(id)a4;
- (void)_updateUserLocationViewWithLocation:(id)a3 hadUserLocation:(BOOL)a4;
- (void)_updateVectorKitConsoleFrameWithEdgeInsets;
- (void)_updateWaypointCaptions;
- (void)_willChangeRegionAnimated:(BOOL)a3;
- (void)_willChangeStatusBarFrame:(id)a3;
- (void)_willStartZoom:(BOOL)a3;
- (void)_withEffectiveTraitCollection:(id)a3;
- (void)_zoomIn;
- (void)_zoomInWithCompletionHandler:(id)a3;
- (void)_zoomOut;
- (void)_zoomOutWithCompletionHandler:(id)a3;
- (void)_zoomWithAmount:(double)a3;
- (void)_zoomWithAmount:(double)a3 completionHandler:(id)a4;
- (void)addAnnotation:(id)annotation;
- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4;
- (void)addAnnotations:(NSArray *)annotations;
- (void)addOverlay:(id)overlay;
- (void)addOverlay:(id)overlay level:(MKOverlayLevel)level;
- (void)addOverlays:(NSArray *)overlays;
- (void)addOverlays:(NSArray *)overlays level:(MKOverlayLevel)level;
- (void)annotationContainer:(id)a3 annotationView:(id)a4 calloutAccessoryControlTapped:(id)a5;
- (void)annotationContainer:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4;
- (void)annotationContainer:(id)a3 requestRemovingClusterAnnotationView:(id)a4 updateVisible:(BOOL)a5;
- (void)annotationContainer:(id)a3 scrollToRevealCalloutWithOffset:(CGPoint)a4 annotationCoordinate:(CLLocationCoordinate2D)a5 completionHandler:(id)a6;
- (void)annotationContainerDidDropPins:(id)a3;
- (void)annotationContainerDidFinishMapsTransitionExpanding:(id)a3;
- (void)annotationContainerWillDropPins:(id)a3;
- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4;
- (void)annotationManager:(id)a3 didDeselectAnnotationRepresentation:(id)a4;
- (void)annotationManager:(id)a3 didSelectAnnotationRepresentation:(id)a4;
- (void)annotationManager:(id)a3 willDeselectAnnotationRepresentation:(id)a4;
- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)calloutDidAppearForAnnotationView:(id)a3 inContainer:(id)a4;
- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4;
- (void)dealloc;
- (void)deselectAnnotation:(id)annotation animated:(BOOL)animated;
- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4;
- (void)deselectTrails;
- (void)deselectVenuePoiFeatureId;
- (void)deviceOrientationDidChange:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)exchangeOverlay:(id)overlay1 withOverlay:(id)overlay2;
- (void)exchangeOverlayAtIndex:(NSUInteger)index1 withOverlayAtIndex:(NSUInteger)index2;
- (void)gestureControllerDidStopPanning:(id)a3 willDecelerate:(BOOL)a4;
- (void)gestureControllerDidStopPanningDecelerating:(id)a3;
- (void)gestureControllerDidStopRotating:(id)a3 willDecelerate:(BOOL)a4;
- (void)gestureControllerDidStopRotatingDecelerating:(id)a3;
- (void)gestureControllerDidStopTilting:(id)a3 willDecelerate:(BOOL)a4 tiltDirection:(int64_t)a5;
- (void)gestureControllerDidStopTiltingDecelerating:(id)a3;
- (void)gestureControllerDidStopTwoFingerLongPress:(id)a3;
- (void)gestureControllerDidStopUserInteraction:(id)a3;
- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 type:(int64_t)a5 willDecelerate:(BOOL)a6;
- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 willDecelerate:(BOOL)a5;
- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4;
- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4 type:(int64_t)a5;
- (void)gestureControllerWillStartPanning:(id)a3;
- (void)gestureControllerWillStartRotating:(id)a3;
- (void)gestureControllerWillStartTilting:(id)a3;
- (void)gestureControllerWillStartTwoFingerLongPress:(id)a3;
- (void)gestureControllerWillStartUserInteraction:(id)a3;
- (void)gestureControllerWillStartZooming:(id)a3 animated:(BOOL)a4;
- (void)goToDefaultLocation;
- (void)insertOverlay:(id)overlay aboveOverlay:(id)sibling;
- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index;
- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index level:(MKOverlayLevel)level;
- (void)insertOverlay:(id)overlay belowOverlay:(id)sibling;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedHeading:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)mapLayer:(id)a3 arSessionWasInterrupted:(unint64_t)a4;
- (void)mapLayer:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5;
- (void)mapLayer:(id)a3 canShowFlyoverDidChange:(BOOL)a4;
- (void)mapLayer:(id)a3 didEncounterARError:(id)a4;
- (void)mapLayer:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4;
- (void)mapLayer:(id)a3 didUpdateVerticalYawTo:(double)a4;
- (void)mapLayer:(id)a3 flyoverModeDidChange:(int)a4;
- (void)mapLayer:(id)a3 flyoverModeWillChange:(int)a4;
- (void)mapLayer:(id)a3 flyoverTourLabelDidChange:(id)a4;
- (void)mapLayer:(id)a3 labelMarkerDidChangeState:(id)a4;
- (void)mapLayer:(id)a3 location:(id)a4 isInHikingContextualRegion:(BOOL)a5;
- (void)mapLayer:(id)a3 locationInHikingToolTipRegion:(unint64_t)a4;
- (void)mapLayer:(id)a3 puckLocationTracingEvent:(id)a4;
- (void)mapLayer:(id)a3 selectedLabelMarkerDidChangeState:(id)a4;
- (void)mapLayer:(id)a3 selectedLabelMarkerDidCompleteLayout:(id)a4;
- (void)mapLayer:(id)a3 selectedLabelMarkerWillDisappear:(id)a4;
- (void)mapLayer:(id)a3 showingFlyoverDidChange:(BOOL)a4;
- (void)mapLayer:(id)a3 venueWithFocusDidChange:(id)a4 building:(id)a5;
- (void)mapLayer:(id)a3 willTransitionTo:(int64_t)a4;
- (void)mapLayerARSessionInterruptionEnded:(id)a3;
- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3;
- (void)mapLayerCanZoomInDidChange:(BOOL)a3;
- (void)mapLayerCanZoomOutDidChange:(BOOL)a3;
- (void)mapLayerDidBecomePitched:(BOOL)a3;
- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3;
- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4;
- (void)mapLayerDidChangeVisibleRegion;
- (void)mapLayerDidDraw:(id)a3;
- (void)mapLayerDidEnterAR:(id)a3;
- (void)mapLayerDidExitAR:(id)a3;
- (void)mapLayerDidFailLoadingTiles:(id)a3 withError:(id)a4;
- (void)mapLayerDidFinishInitialTrackingAnimation;
- (void)mapLayerDidFinishLoadingTiles:(id)a3;
- (void)mapLayerDidStartLoadingTiles:(id)a3;
- (void)mapLayerLabelsDidLayout:(id)a3;
- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3;
- (void)mapLayerNavigationCameraDidLeaveDefaultZoom;
- (void)mapLayerNavigationCameraDidReturnToDefaultZoom;
- (void)mapLayerNavigationCameraHasStartedPanning;
- (void)mapLayerNavigationCameraHasStoppedPanning;
- (void)mapLayerWillEnterAR:(id)a3;
- (void)mapLayerWillPerformZoomBounceAnimation;
- (void)mapLayerWillStartFlyoverTour:(id)a3;
- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)navigationCameraReturnToPuck;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayContainerAddedDrawables:(id)a3;
- (void)pauseUserHeadingUpdates;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)registerClass:(Class)viewClass forAnnotationViewWithReuseIdentifier:(NSString *)identifier;
- (void)removeAnnotation:(id)annotation;
- (void)removeAnnotationRepresentation:(id)a3;
- (void)removeAnnotations:(NSArray *)annotations;
- (void)removeOverlay:(id)overlay;
- (void)removeOverlays:(NSArray *)overlays;
- (void)removeUserLocation;
- (void)requestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a3;
- (void)resetDisplayedFloorOrdinalForAllVenues;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)resumeUserHeadingUpdates;
- (void)resumeUserLocationUpdates;
- (void)safeAreaInsetsDidChange;
- (void)selectAnnotation:(id)annotation animated:(BOOL)animated;
- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4;
- (void)setAttributionCorner:(int)a3;
- (void)setBackdropViewQualityChangingDisabled:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCamera:(MKMapCamera *)camera;
- (void)setCamera:(MKMapCamera *)camera animated:(BOOL)animated;
- (void)setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8;
- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9;
- (void)setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7;
- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary;
- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary animated:(BOOL)animated;
- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange;
- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange animated:(BOOL)animated;
- (void)setCanShowAttributionBadge:(BOOL)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;
- (void)setCompassEnabled:(BOOL)a3;
- (void)setCompassViewSize:(int64_t)a3;
- (void)setCustomOverrideInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setDimmingOutsideVenueWithFocus:(BOOL)a3;
- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4;
- (void)setFlyoverMode:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIgnoreLocationUpdates:(BOOL)a3;
- (void)setLabelTextSize:(int64_t)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLocationConsoleEnabled:(BOOL)a3;
- (void)setMapType:(MKMapType)mapType;
- (void)setPitchButtonVisibility:(MKFeatureVisibility)pitchButtonVisibility;
- (void)setPitchEnabled:(BOOL)pitchEnabled;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setPredictedUserLocation:(id)a3;
- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration;
- (void)setRegion:(MKCoordinateRegion)region;
- (void)setRegion:(MKCoordinateRegion)region animated:(BOOL)animated;
- (void)setRendersInBackground:(BOOL)a3;
- (void)setRotateEnabled:(BOOL)rotateEnabled;
- (void)setScrollEnabled:(BOOL)scrollEnabled;
- (void)setSelectableMapFeatures:(MKMapFeatureOptions)selectableMapFeatures;
- (void)setSelectedAnnotations:(NSArray *)selectedAnnotations;
- (void)setSelectedTrailId:(unint64_t)a3;
- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5;
- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3;
- (void)setShowsAttribution:(BOOL)a3;
- (void)setShowsBuildings:(BOOL)showsBuildings;
- (void)setShowsCompass:(BOOL)showsCompass;
- (void)setShowsLiveEVData:(BOOL)a3;
- (void)setShowsPitchControl:(BOOL)showsPitchControl;
- (void)setShowsPointsOfInterest:(BOOL)showsPointsOfInterest;
- (void)setShowsScale:(BOOL)showsScale;
- (void)setShowsTraffic:(BOOL)showsTraffic;
- (void)setShowsUserLocation:(BOOL)showsUserLocation;
- (void)setShowsUserTrackingButton:(BOOL)showsUserTrackingButton;
- (void)setShowsZoomControls:(BOOL)showsZoomControls;
- (void)setSupportedEVConnectorTypes:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated;
- (void)setUserTrackingMode:(MKUserTrackingMode)userTrackingMode;
- (void)setVehicleState:(id)a3;
- (void)setVisibleMapRect:(MKMapRect)mapRect animated:(BOOL)animate;
- (void)setVisibleMapRect:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets animated:(BOOL)animate;
- (void)setVisibleMapRect:(MKMapRect)visibleMapRect;
- (void)setZoomEnabled:(BOOL)zoomEnabled;
- (void)set_annotationViewsAreAddedImmediately:(BOOL)a3;
- (void)set_startEffectsTimer:(id)a3;
- (void)showAnnotations:(NSArray *)annotations animated:(BOOL)animated;
- (void)snapToNorth:(id)a3;
- (void)startLinearZoomIn:(BOOL)a3;
- (void)startUpdatingUserLocation;
- (void)stopUpdatingUserLocation;
- (void)stopZoomingWithInertia;
- (void)toggleLocationConsole:(id)a3;
- (void)updateLayoutGuides;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)willMoveToWindow:(id)a3;
- (void)zoomControlMinusPressed:(id)a3;
- (void)zoomControlPlusPressed:(id)a3;
- (void)zoomIn:(id)a3;
- (void)zoomOut:(id)a3;
@end

@implementation MKMapView

- (VKVenueFeatureMarker)venueWithFocus
{
  return (VKVenueFeatureMarker *)[(VKMapView *)self->_mapView venueWithFocus];
}

- (void)_setCompassInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)_compassInsets
{
  double top = self->_compassInsets.top;
  double left = self->_compassInsets.left;
  double bottom = self->_compassInsets.bottom;
  double right = self->_compassInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)_camera
{
  return self->_camera;
}

- (OS_dispatch_group)_calloutShowAnimationGroup
{
  return self->_calloutShowAnimationGroup;
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfiguration
{
  long long v3 = *(_OWORD *)&self[19].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[18].var6;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[19].var3;
  *(void *)&retstr->var6 = self[19].var5;
  return self;
}

- (void)_setCompassInsets:(UIEdgeInsets)a3 animated:(BOOL)a4
{
  self->_compassInsets = a3;
  [(MKMapView *)self _updateControlsPosition:a4];
  if (self->_scaleVisibility != 1)
  {
    [(MKMapView *)self _updateScalePosition];
  }
}

- (void)_didChangeRegionMidstream:(BOOL)a3
{
  if (self->_cartographicConfiguration.projection == 1) {
    LODWORD(v5) = 1;
  }
  else {
    uint64_t v5 = (*(void *)&self->_flags >> 35) & 1;
  }
  if (_MKLinkedOnOrAfterReleaseSet(2824)) {
    [(MKMapCamera *)self->_camera _mapViewStateChanged];
  }
  if (a3)
  {
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    *(void *)&self->_flags &= 0xFEFFFFFFFFFFFFFELL;
    [(MKMapView *)self _updateCameraState];
    [(MKMapView *)self _updateIconsShouldAlignToPixels];
    [(MKMapView *)self _updateRotationAttributes];
    [(MKMapView *)self _updateEffects];
    [(MKOverlayContainerView *)self->_overlayContainer addAndRemoveOverlayViews];
  }
  [(MKAnnotationManager *)self->_annotationManager updateVisibleAnnotations];
LABEL_11:
  [(MKMapView *)self _showOrHideScaleIfNecessary:1];
  [(MKMapView *)self _updateScale];
  [(MKMapView *)self _updateCompassVisibility];
  [(MKMapView *)self _updateTrackingVisibility];
  [(MKMapView *)self _updatePitchButtonVisibility];
  BOOL v8 = self->_userTrackingMode
    && ([(MKUserLocation *)self->_userLocation location],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    && ([(VKMapView *)self->_mapView isAnimatingToTrackAnnotation] & 1) == 0
    && (*(void *)&self->_flags & 0x8000001800000) == 0
    && ![(MKBasicMapView *)self->_basicMapView isChangingViewSize]
    && (uint64_t flags = (uint64_t)self->_flags, (flags & 0x1000000000000) == 0)
    && (flags & 0x2000000000000) == 0;
  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    v9 = self->_unsafeDelegate;
  }
  else
  {
    v9 = [(MKMapView *)self _safeDelegate];
  }
  v10 = v9;
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (!v8) {
      goto LABEL_40;
    }
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      v12 = self->_unsafeDelegate;
    }
    else
    {
      v12 = [(MKMapView *)self _safeDelegate];
    }
    v13 = v12;
    char v14 = [(MKMapViewDelegate *)v12 _mapViewCanChangeUserTrackingModeWhenRegionDidChange:self];

    if ((v14 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (!v8)
  {
    goto LABEL_40;
  }
  if (![(MKMapView *)self _isUserLocationViewCentered:30.0])
  {
    v15 = self;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_39;
  }
  if (self->_userTrackingMode == 2
    && ![(MKMapView *)self _isUserLocationViewCentered:5.0])
  {
    v15 = self;
    uint64_t v16 = 1;
    uint64_t v17 = 1;
LABEL_39:
    [(MKMapView *)v15 _setUserTrackingMode:v16 animated:v17 fromTrackingButton:0];
  }
LABEL_40:
  [(MKMapView *)self _postDidChangeZoomNotificationIfNeeded];
  if (!a3)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      v18 = self->_unsafeDelegate;
    }
    else
    {
      v18 = [(MKMapView *)self _safeDelegate];
    }
    v19 = v18;
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        v21 = self->_unsafeDelegate;
      }
      else
      {
        v21 = [(MKMapView *)self _safeDelegate];
      }
      v22 = v21;
      [(MKMapViewDelegate *)v21 mapView:self regionDidChangeAnimated:(*(void *)&self->_flags >> 11) & 1];
    }
  }
}

- (MKMapViewDelegate)_safeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);

  return (MKMapViewDelegate *)WeakRetained;
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3 explicit:(BOOL)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v9 = 0x1000000;
  if (a4) {
    uint64_t v9 = 0x10001000000;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v9;
  int v10 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  int v15 = v10;
  if (!self->_suspendPropagatingEdgeInsetsCount)
  {
    if (v10)
    {
      [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
      double v36 = v16;
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
      v18 = [(MKMapView *)self layer];
      v19 = NSNumber;
      char v20 = [(MKMapView *)self layer];
      v21 = [v20 valueForKey:@"__mapkit_edgeInsetsSentinel"];
      v22 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v21, "integerValue") ^ 1);
      [v18 setValue:v22 forKey:@"__mapkit_edgeInsetsSentinel"];

      objc_initWeak(&location, self);
      mapView = self->_mapView;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __37__MKMapView__setEdgeInsets_explicit___block_invoke;
      v37[3] = &unk_1E54B8790;
      objc_copyWeak(&v38, &location);
      *(float *)&double v24 = top;
      *(float *)&double v25 = left;
      *(float *)&double v26 = bottom;
      *(float *)&double v27 = right;
      -[VKMapView setEdgeInsets:duration:timingFunction:completionHandler:](mapView, "setEdgeInsets:duration:timingFunction:completionHandler:", v17, v37, v24, v25, v26, v27, v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    else
    {
      *(float *)&double v11 = top;
      *(float *)&double v12 = left;
      *(float *)&double v13 = bottom;
      *(float *)&double v14 = right;
      -[VKMapView setEdgeInsets:](self->_mapView, "setEdgeInsets:", v11, v12, v13, v14);
    }
  }
  BOOL v28 = self->_edgeInsets.left == left;
  if (self->_edgeInsets.top != top) {
    BOOL v28 = 0;
  }
  if (self->_edgeInsets.right != right) {
    BOOL v28 = 0;
  }
  BOOL v29 = self->_edgeInsets.bottom == bottom && v28;
  self->_edgeInsets.double top = top;
  self->_edgeInsets.double left = left;
  self->_edgeInsets.double bottom = bottom;
  self->_edgeInsets.double right = right;
  [(NSLayoutConstraint *)self->_edgeInsetsTopConstraint setConstant:top];
  [(NSLayoutConstraint *)self->_edgeInsetsLeftConstraint setConstant:left];
  [(NSLayoutConstraint *)self->_edgeInsetsRightConstraint setConstant:-right];
  [(NSLayoutConstraint *)self->_edgeInsetsBottomConstraint setConstant:-bottom];
  debugLocationConsole = self->_debugLocationConsole;
  [(MKMapView *)self _edgeInsets];
  -[MKDebugLocationConsole updateFrameWithEdgeInsets:](debugLocationConsole, "updateFrameWithEdgeInsets:");
  [(MKMapView *)self _updateVectorKitConsoleFrameWithEdgeInsets];
  [(MKMapView *)self _updateCompassVisibility];
  [(MKMapView *)self _updateTrackingVisibility];
  [(MKMapView *)self _updatePitchButtonVisibility];
  [(MKMapView *)self _updateAppleLogoVisibility];
  [(MKMapView *)self _showOrHideScaleIfNecessary:1];
  [(MKMapView *)self _updateScalePosition];
  [(MKMapView *)self _currentEnvironmentNameFrame];
  -[_MKEnvironmentLabel setFrame:](self->_debugCurrentEnvironmentLabel, "setFrame:");
  [(MKMapView *)self _updateControlsPosition:0];
  [(MKMapView *)self _layoutAttribution];
  [(MKAnnotationContainerView *)self->_annotationContainer visibleCenteringRectChanged];
  if (!v15 || self->_suspendPropagatingEdgeInsetsCount) {
    *(void *)&self->_flags &= ~0x1000000uLL;
  }
  if (!v29)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      v31 = self->_unsafeDelegate;
    }
    else
    {
      v31 = [(MKMapView *)self _safeDelegate];
    }
    v32 = v31;
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        v34 = self->_unsafeDelegate;
      }
      else
      {
        v34 = [(MKMapView *)self _safeDelegate];
      }
      v35 = v34;
      [(MKMapViewDelegate *)v34 mapViewDidChangeEdgeInsets:self];
    }
  }
}

- (void)_updateControlsPosition:(BOOL)a3
{
  if (_MKLinkedOnOrAfterReleaseSet(3595))
  {
    [(MKMapView *)self _updateStackViewPosition];
  }
  else
  {
    [(MKMapView *)self _updateCompassPositionClassic];
  }
}

- (void)_updateScalePosition
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  scaleView = self->_scaleView;
  if (scaleView)
  {
    [(MKScaleView *)scaleView intrinsicContentSize];
    double v5 = v4;
    double v50 = v6;
    [(MKScaleView *)self->_scaleView alignmentRectInsets];
    double v8 = v7;
    double v10 = v9;
    double v51 = v11;
    double v13 = v12;
    unint64_t v14 = [(MKMapView *)self _compassInsetEdges];
    [(MKMapView *)self _edgeInsets];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(MKMapView *)self bounds];
    if (*MEMORY[0x1E4F1DB30] != v24 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v23)
    {
      double v26 = v13 + v5 + v10;
      double v27 = v50 + v8;
      [(MKMapView *)self bounds];
      double v29 = v18 + v28;
      double v31 = v16 + v30;
      double v33 = v32 - (v18 + v22);
      double v35 = v34 - (v16 + v20);
      uint64_t v36 = [(MKMapView *)self effectiveUserInterfaceLayoutDirection];
      if ((v14 & 8) != 0)
      {
        [(MKScaleView *)self->_scaleView setLegendAlignment:v36 == 1];
        v56.origin.double x = v29;
        v56.origin.double y = v31;
        v56.size.double width = v33;
        v56.size.double height = v35;
        double v37 = CGRectGetMinX(v56) + 12.0;
      }
      else
      {
        [(MKScaleView *)self->_scaleView setLegendAlignment:v36 != 1];
        v55.origin.double x = v29;
        v55.origin.double y = v31;
        v55.size.double width = v33;
        v55.size.double height = v35;
        double v37 = CGRectGetMaxX(v55) - (v26 + 12.0);
      }
      double v38 = v51 + v27;
      v57.origin.double x = v29;
      v57.origin.double y = v31;
      v57.size.double width = v33;
      v57.size.double height = v35;
      double v39 = CGRectGetMinY(v57) + 10.0;
      if ((*(void *)&self->_flags & 0x10000000000) == 0)
      {
        if ((v14 & 8) != 0) {
          uint64_t v40 = 2;
        }
        else {
          uint64_t v40 = 8;
        }
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v40, v37, v39, v26, v38);
        double x = v58.origin.x;
        double y = v58.origin.y;
        double width = v58.size.width;
        double height = v58.size.height;
        if (CGRectIsNull(v58))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 1, v37, v39, v26, v38);
          double x = v45;
          double y = v46;
          double width = v47;
          double height = v48;
        }
        v59.origin.double x = x;
        v59.origin.double y = y;
        v59.size.double width = width;
        v59.size.double height = height;
        if (!CGRectIsNull(v59)) {
          goto LABEL_20;
        }
        v49 = MKGetMKMapViewLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v53 = v14;
          _os_log_impl(&dword_18BAEC000, v49, OS_LOG_TYPE_DEBUG, "Could not inset scale from edge %lu", buf, 0xCu);
        }
      }
      double x = v37;
      double y = v39;
      double width = v26;
      double height = v38;
LABEL_20:
      -[MKScaleView setFrame:](self->_scaleView, "setFrame:", x, y, width, height);
    }
  }
}

- (void)_showOrHideScaleIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKMapView *)self _canShowControls];
  BOOL v6 = v5;
  scaleVisibilitdouble y = self->_scaleVisibility;
  if (scaleVisibility)
  {
    if (scaleVisibility == 2)
    {
      LODWORD(v8) = 0;
      unsigned int v9 = 1;
    }
    else
    {
      unsigned int v9 = 0;
      LODWORD(v8) = 0;
    }
  }
  else
  {
    unint64_t flags = (unint64_t)self->_flags;
    unsigned int v9 = (flags >> 22) & 1;
    uint64_t v8 = (flags >> 57) & 1;
  }
  if (v8 | v9) {
    BOOL v11 = v5;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = v11 && [(MKMapView *)self _shouldDisplayScaleForCurrentRegion];
  if (self->_scaleUpdateNotificationObserversCount)
  {
    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"MKMapViewShouldUpdateScaleNotification" object:self];
  }
  if (self->_scaleVisible != v12)
  {
    self->_scaleVisible = v12;
    unint64_t v14 = [(MKMapView *)self scaleView];
    double v15 = v14;
    if (v12)
    {
      double v16 = [v14 superview];

      if (!v16)
      {
        [(MKMapView *)self addSubview:v15];
        [(MKMapView *)self _updateScalePosition];
        [(MKMapView *)self _updateScale];
      }
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__MKMapView__showOrHideScaleIfNecessary___block_invoke;
    v29[3] = &unk_1E54B8930;
    v29[4] = self;
    id v17 = v15;
    id v30 = v17;
    double v18 = (void (**)(void, void))MEMORY[0x18C139AE0](v29);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    double v25 = __41__MKMapView__showOrHideScaleIfNecessary___block_invoke_2;
    double v26 = &unk_1E54B8718;
    BOOL v28 = v12;
    id v19 = v17;
    id v27 = v19;
    uint64_t v20 = MEMORY[0x18C139AE0](&v23);
    double v21 = (void *)v20;
    if (v3)
    {
      double v22 = 0.349999994;
      if (v6) {
        double v22 = 0.699999988;
      }
      objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:delay:options:animations:completion:", 0x10000, v20, v18, v22, 0.0, v23, v24, v25, v26);
    }
    else
    {
      (*(void (**)(uint64_t))(v20 + 16))(v20);
      v18[2](v18, 1);
    }
  }
}

- (void)_updateTrackingVisibility
{
  if ([(MKMapView *)self _roomForCompass]
    && [(MKMapView *)self showsUserTrackingButton])
  {
    BOOL v3 = [(MKMapView *)self _roomForCompass];
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v3 = 1;
  }

  [(MKMapView *)self _setTrackingButtonVisible:v4 animationAllowed:v3];
}

- (BOOL)showsUserTrackingButton
{
  return self->_showsUserTrackingButton;
}

- (void)_updatePitchButtonVisibility
{
  pitchButtonVisibilitdouble y = self->_pitchButtonVisibility;
  BOOL v4 = [(MKMapView *)self _roomForCompass];
  BOOL v5 = pitchButtonVisibility != 1 && v4;
  BOOL v6 = !v5 || [(MKMapView *)self _roomForCompass];

  [(MKMapView *)self _setPitchButtonVisible:v5 animationAllowed:v6];
}

- (void)_setTrackingButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4
{
  if (self->_userTrackingVisible != a3)
  {
    self->_userTrackingVisible = a3;
    trackingButton = self->_trackingButton;
    if (a3)
    {
      BOOL v6 = a4;
      double v7 = [(MKUserTrackingButton *)trackingButton superview];

      if (!v7)
      {
        uint64_t v8 = [(MKMapView *)self _controlStackView];
        unsigned int v9 = [(MKMapView *)self _userTrackingButton];
        [v8 insertArrangedSubview:v9 atIndex:0];

        [(MKMapView *)self _updateControlsPosition:v6];
      }
    }
    else
    {
      [(MKUserTrackingButton *)trackingButton removeFromSuperview];
    }
  }
}

- (void)_setPitchButtonVisible:(BOOL)a3 animationAllowed:(BOOL)a4
{
  if (self->_pitchButtonVisible != a3)
  {
    self->_pitchButtonVisible = a3;
    pitchButton = self->_pitchButton;
    if (a3)
    {
      BOOL v6 = a4;
      double v7 = [(MKPitchButton *)pitchButton superview];

      if (!v7)
      {
        BOOL userTrackingVisible = self->_userTrackingVisible;
        unsigned int v9 = [(MKMapView *)self _controlStackView];
        double v10 = [(MKMapView *)self _pitchButton];
        [v9 insertArrangedSubview:v10 atIndex:userTrackingVisible];

        [(MKMapView *)self _updateControlsPosition:v6];
      }
    }
    else
    {
      [(MKPitchButton *)pitchButton removeFromSuperview];
    }
  }
}

- (void)_layoutAttribution
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  [(MKMapView *)self bounds];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] != v5 || v4 != v3)
  {
    int64_t v7 = [(UIView *)self _mapkit_userInterfaceDirection];
    [(MKMapView *)self _edgeInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double left = self->_attributionInsets.left;
    double bottom = self->_attributionInsets.bottom;
    double right = self->_attributionInsets.right;
    if (_MKLinkedOnOrAfterReleaseSet(2310)
      && ([(UIImageView *)self->_attributionBadgeView superview],
          id v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      if (GEOConfigGetBOOL() && _MKLinkedOnOrAfterReleaseSet(3595))
      {
        BOOL v100 = v7 == 0;
        int v101 = 8;
        int v102 = 4;
      }
      else
      {
        BOOL v100 = v7 == 0;
        int v101 = 4;
        int v102 = 8;
      }
      if (v100) {
        unsigned int v18 = v102;
      }
      else {
        unsigned int v18 = v101;
      }
      double v19 = 10.0;
    }
    else
    {
      if (v7) {
        unsigned int v18 = 8;
      }
      else {
        unsigned int v18 = 4;
      }
      double v19 = 11.0;
    }
    if (!GEOConfigGetBOOL() || (unsigned int v20 = v18, !_MKLinkedOnOrAfterReleaseSet(3595)))
    {
      if (v18 == 8) {
        unsigned int v20 = 4;
      }
      else {
        unsigned int v20 = 8;
      }
    }
    double v21 = v11 + bottom;
    double v105 = v9 + left;
    double v106 = v13 + right;
    char v22 = [(MKMapView *)self _compassInsetEdges];
    if (v22) {
      int v23 = 1;
    }
    else {
      int v23 = 4;
    }
    if (v22) {
      int v24 = 2;
    }
    else {
      int v24 = 8;
    }
    if ((v22 & 2) == 0) {
      int v23 = v24;
    }
    if (v18 == 8) {
      unsigned int v25 = 4;
    }
    else {
      unsigned int v25 = 8;
    }
    if (v23 == v18) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = v18;
    }
    id v27 = [(MKAppleLogoView *)self->_appleLogoImageView superview];

    double v107 = v11 + bottom;
    if (!v27)
    {
LABEL_46:
      double v50 = [(MKAttributionLabel *)self->_attributionLabel superview];

      if (!v50) {
        goto LABEL_69;
      }
      [(MKMapView *)self bounds];
      CGFloat v52 = v51;
      CGFloat v54 = v53;
      double v56 = v55;
      [(MKAttributionLabel *)self->_attributionLabel frame];
      double v58 = v56 - v57 + -10.0 - v21;
      if (v26 == 4)
      {
        double v59 = v105 + v19;
        appleLogoImageView = self->_appleLogoImageView;
        if (appleLogoImageView && v20 == 4)
        {
          [(MKAppleLogoView *)appleLogoImageView frame];
          double v59 = v59 + v19 + CGRectGetWidth(v114);
        }
      }
      else
      {
        v115.origin.double x = v52;
        v115.origin.double y = v56 - v57 + -10.0 - v21;
        v115.size.double width = v54;
        v115.size.double height = v56;
        double MaxX = CGRectGetMaxX(v115);
        [(MKAttributionLabel *)self->_attributionLabel frame];
        double v59 = MaxX - (v106 + v19 + v62);
        v63 = self->_appleLogoImageView;
        if (v63 && v20 == 8)
        {
          [(MKAppleLogoView *)v63 frame];
          double v59 = v59 - CGRectGetWidth(v116);
        }
      }
      [(MKAttributionLabel *)self->_attributionLabel frame];
      double v66 = v64;
      double v67 = v65;
      if ((*(void *)&self->_flags & 0x10000000000) == 0)
      {
        if (v26 == 4) {
          uint64_t v68 = 2;
        }
        else {
          uint64_t v68 = 8;
        }
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v68, v59, v58, v64, v65);
        double x = v117.origin.x;
        double y = v117.origin.y;
        double width = v117.size.width;
        double height = v117.size.height;
        if (CGRectIsNull(v117))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v59, v58, v66, v67);
          double x = v73;
          double y = v74;
          double width = v75;
          double height = v76;
        }
        v118.origin.double x = x;
        v118.origin.double y = y;
        v118.size.double width = width;
        v118.size.double height = height;
        if (!CGRectIsNull(v118)) {
          goto LABEL_65;
        }
        v77 = MKGetMKMapViewLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v109 = v26;
          _os_log_impl(&dword_18BAEC000, v77, OS_LOG_TYPE_DEBUG, "Could not inset legal attribution from corner %lu", buf, 0xCu);
        }
      }
      double x = v59;
      double y = v58;
      double width = v66;
      double height = v67;
LABEL_65:
      -[MKAttributionLabel setFrame:](self->_attributionLabel, "setFrame:", x, y, width, height);
      if (v26 == 8) {
        uint64_t v78 = 9;
      }
      else {
        uint64_t v78 = 12;
      }
      [(MKAttributionLabel *)self->_attributionLabel setAutoresizingMask:v78];
      double v21 = v107;
LABEL_69:
      v79 = [(UIImageView *)self->_attributionBadgeView superview];

      if (!v79) {
        return;
      }
      [(UIImageView *)self->_attributionBadgeView sizeToFit];
      [(UIImageView *)self->_attributionBadgeView frame];
      double v81 = v80;
      double v83 = v82;
      if (self->_attributionCorner == 4)
      {
        double v84 = v105 + 4.0;
      }
      else
      {
        [(MKMapView *)self bounds];
        double v84 = v85 - v81 + -4.0 - v106;
      }
      v86 = [(MKAttributionLabel *)self->_attributionLabel superview];
      if (v86 && (int attributionCorner = self->_attributionCorner, v86, v26 == attributionCorner))
      {
        [(MKAttributionLabel *)self->_attributionLabel frame];
        double v88 = CGRectGetMinY(v119) - v83 + -4.0;
      }
      else
      {
        [(MKMapView *)self bounds];
        double v88 = v89 - v83 + -4.0 - v21;
      }
      if ((*(void *)&self->_flags & 0x10000000000) == 0)
      {
        if (v26 == 4) {
          uint64_t v90 = 8;
        }
        else {
          uint64_t v90 = 2;
        }
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v90, v84, v88, v81, v83);
        double v91 = v120.origin.x;
        double v92 = v120.origin.y;
        double v93 = v120.size.width;
        double v94 = v120.size.height;
        if (CGRectIsNull(v120))
        {
          -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v84, v88, v81, v83);
          double v91 = v95;
          double v92 = v96;
          double v93 = v97;
          double v94 = v98;
        }
        v121.origin.double x = v91;
        v121.origin.double y = v92;
        v121.size.double width = v93;
        v121.size.double height = v94;
        if (!CGRectIsNull(v121)) {
          goto LABEL_88;
        }
        v99 = MKGetMKMapViewLog();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v109 = v26;
          _os_log_impl(&dword_18BAEC000, v99, OS_LOG_TYPE_DEBUG, "Could not inset legal attribution from corner %lu", buf, 0xCu);
        }
      }
      double v91 = v84;
      double v92 = v88;
      double v93 = v81;
      double v94 = v83;
LABEL_88:
      -[UIImageView setFrame:](self->_attributionBadgeView, "setFrame:", v91, v92, v93, v94);
      return;
    }
    [(MKMapView *)self bounds];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    double v33 = v32;
    [(MKAppleLogoView *)self->_appleLogoImageView frame];
    double v36 = v35;
    double v37 = v34;
    double v38 = v33 - v34 + -7.0 - v21;
    if (v20 == 4)
    {
      double v39 = v105 + 10.0;
    }
    else
    {
      v111.origin.double x = v29;
      v111.origin.double y = v33 - v34 + -7.0 - v21;
      v111.size.double width = v31;
      v111.size.double height = v33;
      double v39 = CGRectGetMaxX(v111) - (v106 + v36 + 10.0);
    }
    double v103 = v19;
    if ((*(void *)&self->_flags & 0x10000000000) == 0)
    {
      if (v20 == 4) {
        uint64_t v40 = 2;
      }
      else {
        uint64_t v40 = 8;
      }
      -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v40, v39, v38, v36, v37, *(void *)&v19);
      double v41 = v112.origin.x;
      double v42 = v112.origin.y;
      double v43 = v112.size.width;
      double v44 = v112.size.height;
      if (CGRectIsNull(v112))
      {
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", 4, v39, v38, v36, v37);
        double v41 = v45;
        double v42 = v46;
        double v43 = v47;
        double v44 = v48;
      }
      v113.origin.double x = v41;
      v113.origin.double y = v42;
      v113.size.double width = v43;
      v113.size.double height = v44;
      if (!CGRectIsNull(v113)) {
        goto LABEL_45;
      }
      v49 = MKGetMKMapViewLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v109 = v20;
        _os_log_impl(&dword_18BAEC000, v49, OS_LOG_TYPE_DEBUG, "Could not inset logo attribution from corner %lu", buf, 0xCu);
      }
    }
    double v41 = v39;
    double v42 = v38;
    double v43 = v36;
    double v44 = v37;
LABEL_45:
    -[MKAppleLogoView setFrame:](self->_appleLogoImageView, "setFrame:", v41, v42, v43, v44, *(void *)&v103);
    double v21 = v107;
    double v19 = v104;
    goto LABEL_46;
  }
}

- (unint64_t)_compassInsetEdges
{
  if (self->_explicitCompassInsetEdges) {
    return self->_compassInsetEdges;
  }
  if ([(UIView *)self _mapkit_userInterfaceDirection]) {
    return 3;
  }
  return 9;
}

- (void)_updateCompassVisibility
{
  [(VKMapView *)self->_mapView presentationYaw];
  double v4 = v3;
  BOOL v5 = [(MKMapView *)self _canShowControls];
  BOOL v6 = [(MKMapView *)self canShowCompass];
  BOOL v7 = !v6 || [(MKMapView *)self _roomForCompass];
  self->_lastPossiblyVisible = [(MKMapView *)self canPossiblyShowCompassForInternalControl:0];
  [(MKMapView *)self _setCompassVisible:v6 animationAllowed:v7 force:!v5];
  if (vabdd_f64(v4, self->_lastYaw) >= 2.22044605e-16)
  {
    [(MKCompassView *)self->_compassView setMapHeading:v4];
    self->_lastYaw = v4;
    [(MKMapView *)self _postDidUpdateYawNotification];
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v8 = self->_unsafeDelegate;
    }
    else
    {
      double v8 = [(MKMapView *)self _safeDelegate];
    }
    double v9 = v8;
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v11 = self->_unsafeDelegate;
      }
      else
      {
        double v11 = [(MKMapView *)self _safeDelegate];
      }
      double v12 = v11;
      [(MKMapViewDelegate *)v11 mapView:self didUpdateYaw:self->_lastYaw];
    }
  }
}

- (BOOL)canShowCompass
{
  BOOL v3 = [(MKMapView *)self _roomForCompass];
  if (v3)
  {
    BOOL v3 = [(MKMapView *)self canPossiblyShowCompassForInternalControl:1];
    if (v3)
    {
      BOOL v3 = [(MKMapView *)self isCompassEnabled];
      if (v3) {
        LOBYTE(v3) = ![(MKMapView *)self _isCompassSuppressedForFloorPicker];
      }
    }
  }
  return v3;
}

- (BOOL)canPossiblyShowCompassForInternalControl:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKMapView *)self _roomForCompass];
  if (v5)
  {
    BOOL v6 = !v3 || [(MKMapView *)self _canShowControls];
    if (qword_1E9153FF0 != -1) {
      dispatch_once(&qword_1E9153FF0, &__block_literal_global_328);
    }
    if (!byte_1E9153FD9
      || [(MKMapView *)self userTrackingMode] != MKUserTrackingModeFollowWithHeading)
    {
      [(VKMapView *)self->_mapView presentationYaw];
      if (!v6)
      {
        LOBYTE(v5) = 0;
        return v5;
      }
      double v8 = v7;
      if ([(MKMapView *)self userTrackingMode] != MKUserTrackingModeFollowWithHeading)
      {
        LOBYTE(v5) = fabs(v8) > 2.0;
        return v5;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (MKUserTrackingMode)userTrackingMode
{
  return self->_userTrackingMode;
}

- (void)_updateStackViewPosition
{
  if (self->_controlStackView)
  {
    -[MKMapView bringSubviewToFront:](self, "bringSubviewToFront:");
    [(NSLayoutConstraint *)self->_controlStackWidthConstraint setConstant:MKCompassViewDiameterForSize(self->_compassViewSize)];
    uint64_t v3 = [(MKMapView *)self effectiveUserInterfaceLayoutDirection];
    [(MKMapView *)self _edgeInsets];
    p_compassInsets = &self->_compassInsets;
    uint64_t v7 = 8;
    if (!v3)
    {
      uint64_t v7 = 24;
      double v4 = v5;
    }
    [(NSLayoutConstraint *)self->_controlStackHorizontalPositionConstraint setConstant:-*(double *)((char *)&p_compassInsets->top + v7) - v4];
    [(MKMapView *)self _edgeInsets];
    double v9 = v8 + p_compassInsets->top;
    controlStackVerticalPositionConstraint = self->_controlStackVerticalPositionConstraint;
    [(NSLayoutConstraint *)controlStackVerticalPositionConstraint setConstant:v9];
  }
}

- (BOOL)_canShowControls
{
  [(MKMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(MKMapView *)self _edgeInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (qword_1E9154018 != -1) {
    dispatch_once(&qword_1E9154018, &__block_literal_global_333);
  }
  return v6 - (v8 + v12) >= *(double *)&qword_1E9154010 && v4 - (v10 + v14) >= *(double *)&qword_1E9154008;
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

- (BOOL)_roomForCompass
{
  [(MKMapView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(MKMapView *)self _compassDiameter];
  double v12 = v11;
  v15.origin.double x = v4;
  v15.origin.double y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  double v13 = v12 + v12;
  if (CGRectGetWidth(v15) < v13) {
    return 0;
  }
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  return CGRectGetHeight(v16) >= v13;
}

- (double)_compassDiameter
{
  return MKCompassViewDiameterForSize(self->_compassViewSize);
}

- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5
{
  if (self->_compassVisible != a3)
  {
    BOOL v5 = a4;
    BOOL v6 = a3;
    if (!self->_compassVisible || (*(void *)&self->_flags & 0x20000000) == 0 || a5)
    {
      BOOL v8 = !_MKLinkedOnOrAfterReleaseSet(2824);
      uint64_t v9 = v8 & v5;
      if (!v8 && v5) {
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
      }
      self->_compassVisible = v6;
      if (v6)
      {
        CGFloat v10 = [(MKCompassView *)self->_compassView superview];

        if (!v10)
        {
          BOOL v11 = _MKLinkedOnOrAfterReleaseSet(3595);
          double v12 = [(MKMapView *)self compassView];
          double v13 = v12;
          if (v11)
          {
            [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

            double v13 = [(MKMapView *)self _controlStackView];
            double v14 = [(MKMapView *)self compassView];
            [v13 addArrangedSubview:v14];
          }
          else
          {
            [(MKMapView *)self addSubview:v12];
          }
        }
        [(MKMapView *)self _updateControlsPosition:v9];
        if (v9) {
          goto LABEL_19;
        }
        id v17 = [(MKCompassView *)self->_compassView layer];
        [v17 removeAnimationForKey:@"controlVisibility"];
      }
      else
      {
        [(MKMapView *)self _updateControlsPosition:v9];
        if (v9)
        {
LABEL_19:
          CGRect v15 = [(MKMapView *)self _commonVisibilityAnimation:v6];
          CGRect v16 = [(MKCompassView *)self->_compassView layer];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __55__MKMapView__setCompassVisible_animationAllowed_force___block_invoke;
          v18[3] = &unk_1E54B8740;
          BOOL v19 = v6;
          v18[4] = self;
          objc_msgSend(v16, "_mapkit_addAnimation:forKey:completion:", v15, @"controlVisibility", v18);

          return;
        }
        [(MKCompassView *)self->_compassView removeFromSuperview];
        [(MKMapView *)self _updateControlsPosition:0];
      }
    }
  }
}

- (void)_updateAppleLogoVisibility
{
  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    if ((*(void *)&self->_flags & 0x4000000) == 0 || self->_attributionBadgeView)
    {
      p_appleLogoImageView = (id *)&self->_appleLogoImageView;
      appleLogoImageView = self->_appleLogoImageView;
      if (!appleLogoImageView) {
        return;
      }
      goto LABEL_5;
    }
    BOOL v9 = [(MKMapView *)self _canShowAppleLogo];
    p_appleLogoImageView = (id *)&self->_appleLogoImageView;
    appleLogoImageView = self->_appleLogoImageView;
    if (((v9 ^ (appleLogoImageView == 0)) & 1) == 0)
    {
      if (!v9)
      {
LABEL_5:
        BOOL v5 = appleLogoImageView;
        id v6 = *p_appleLogoImageView;
        id *p_appleLogoImageView = 0;

        double v7 = (void *)MEMORY[0x1E4F42FF0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __39__MKMapView__updateAppleLogoVisibility__block_invoke;
        v20[3] = &unk_1E54B8188;
        double v21 = v5;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __39__MKMapView__updateAppleLogoVisibility__block_invoke_2;
        v17[3] = &unk_1E54B8930;
        unsigned int v18 = v21;
        BOOL v19 = self;
        BOOL v8 = v21;
        objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", v20, v17, 0.200000003);

        return;
      }
      if (GEOConfigGetBOOL())
      {
        id v10 = [[MKAppleLogoLabel alloc] initForMapType:[(MKMapView *)self mapType] forDarkMode:[(MKMapView *)self _showsNightMode]];
        id v11 = *p_appleLogoImageView;
        id *p_appleLogoImageView = v10;

        [*p_appleLogoImageView intrinsicContentSize];
        self->_appleLogoImageWidth = v12;
      }
      else
      {
        id v13 = [[MKAppleLogoImageView alloc] initForMapType:[(MKMapView *)self mapType] forDarkMode:[(MKMapView *)self _showsNightMode]];
        id v14 = *p_appleLogoImageView;
        id *p_appleLogoImageView = v13;

        CGRect v15 = [*p_appleLogoImageView image];
        [v15 size];
        self->_appleLogoImageWidth = v16;
      }
      [(MKMapView *)self addSubview:*p_appleLogoImageView];
      [(MKMapView *)self _layoutAttribution];
    }
  }
}

- (void)_updateVectorKitConsoleFrameWithEdgeInsets
{
  if (self->_vectorKitDebugView)
  {
    [(VKMapView *)self->_mapView edgeInsets];
    double v4 = v3;
    [(VKMapView *)self->_mapView edgeInsets];
    double v6 = v5;
    [(MKMapView *)self bounds];
    double v8 = v7;
    [(VKMapView *)self->_mapView edgeInsets];
    double v10 = v8 - v9;
    [(VKMapView *)self->_mapView edgeInsets];
    double v12 = v10 - v11;
    [(UITextView *)self->_vectorKitDebugView contentSize];
    vectorKitDebugView = self->_vectorKitDebugView;
    -[UITextView setFrame:](vectorKitDebugView, "setFrame:", v4, v6, v12, v13);
  }
}

- (CGRect)_currentEnvironmentNameFrame
{
  [(MKMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MKMapView *)self _edgeInsets];
  double v12 = v11;
  double v14 = v6 + v13;
  double v16 = v11 + v15;
  double v18 = v10 - (v13 + v17);
  vectorKitDebugView = self->_vectorKitDebugView;
  if (vectorKitDebugView)
  {
    [(UITextView *)vectorKitDebugView bounds];
    double v14 = v14 + v20;
    [(UITextView *)self->_vectorKitDebugView bounds];
    double v18 = v18 - v21;
  }
  double v22 = v4 + v12;
  double v23 = v8 - v16;
  [(_MKEnvironmentLabel *)self->_debugCurrentEnvironmentLabel bounds];
  double v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  double v32 = +[MKSystemController sharedInstance];
  int v33 = [v32 userInterfaceIdiom];

  double v34 = v22;
  double v35 = v14;
  double v36 = v23;
  double v37 = v18;
  if (v33 == 2)
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v34);
    CGFloat v39 = v25;
    CGFloat v40 = MaxX + -4.0;
    v46.origin.double x = v39;
    v46.origin.double y = v27;
    v46.size.double width = v29;
    v46.size.double height = v31;
    double v41 = v40 - CGRectGetWidth(v46);
  }
  else
  {
    double v41 = CGRectGetMinX(*(CGRect *)&v34) + 4.0;
  }
  v47.origin.double x = v22;
  v47.origin.double y = v14;
  v47.size.double width = v23;
  v47.size.double height = v18;
  double v42 = CGRectGetMinY(v47) + 4.0;
  double v43 = v41;
  double v44 = v29;
  double v45 = v31;
  result.size.double height = v45;
  result.size.double width = v44;
  result.origin.double y = v42;
  result.origin.double x = v43;
  return result;
}

- (void)_updateScale
{
  scaleVisibilitdouble y = self->_scaleVisibility;
  if ((scaleVisibility == 2 || !scaleVisibility && (*(void *)&self->_flags & 0x400000) != 0) && self->_scaleVisible)
  {
    [(MKMapView *)self bounds];
    -[MKMapView _distanceFromPoint:toPoint:fromView:withPrecision:](self, "_distanceFromPoint:toPoint:fromView:withPrecision:", self, 1, 1.0, 1.0, CGRectGetMaxX(v7) + -1.0, 1.0);
    if (v4 > 0.0)
    {
      scaleView = self->_scaleView;
      -[MKScaleView setDistanceInMeters:](scaleView, "setDistanceInMeters:");
    }
  }
}

- (void)_postDidChangeZoomNotificationIfNeeded
{
  if (self->_zoomUpdateNotificationObserversCount)
  {
    GEOConfigGetDouble();
    double v4 = v3;
    [(MKMapView *)self _zoomLevel];
    double lastNotifiedZoomSize = self->_lastNotifiedZoomSize;
    BOOL v7 = lastNotifiedZoomSize >= v4 || v5 <= v4;
    if (!v7 || (lastNotifiedZoomSize > v4 ? (BOOL v8 = v5 < v4) : (BOOL v8 = 0), v8))
    {
      self->_double lastNotifiedZoomSize = v5;
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MKMapViewDidChangeZoomNotification" object:self];
    }
  }
}

- (void)_updateEffects
{
  unint64_t suspendedEffectsCount = self->_suspendedEffectsCount;
  if (suspendedEffectsCount == 1)
  {
    startEffectsTimer = self->_startEffectsTimer;
    if (startEffectsTimer) {
      CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)startEffectsTimer, 3153600000.0);
    }
    [(MKMapView *)self _updateShouldDisplayEffects];
  }
  else if (!suspendedEffectsCount)
  {
    if (!self->_startEffectsTimer)
    {
      double v4 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self->_internal target:sel_startEffects selector:0 userInfo:1 repeats:3153600000.0];
      double v5 = self->_startEffectsTimer;
      self->_startEffectsTimer = v4;

      double v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v6 addTimer:self->_startEffectsTimer forMode:*MEMORY[0x1E4F1C3A0]];
    }
    double v7 = CFAbsoluteTimeGetCurrent() + 0.1;
    BOOL v8 = self->_startEffectsTimer;
    CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)v8, v7);
  }
}

- (void)_updateCameraState
{
}

- (void)_willChangeRegionAnimated:(BOOL)a3
{
  uint64_t v4 = 2049;
  if (!a3) {
    uint64_t v4 = 1;
  }
  *(void *)&self->_unint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  [(MKMapView *)self _dropDraggingAnnotationView:1];
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
  double v5 = [(MKMapView *)self layer];
  double v6 = NSNumber;
  double v7 = [(MKMapView *)self layer];
  BOOL v8 = [v7 valueForKey:@"__mapkit_regionSentinel"];
  id v9 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "integerValue") ^ 1);
  [v5 setValue:v9 forKey:@"__mapkit_regionSentinel"];

  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    double v10 = self->_unsafeDelegate;
  }
  else
  {
    double v10 = [(MKMapView *)self _safeDelegate];
  }
  double v11 = v10;
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v13 = self->_unsafeDelegate;
    }
    else
    {
      double v13 = [(MKMapView *)self _safeDelegate];
    }
    double v14 = v13;
    [(MKMapViewDelegate *)v13 mapView:self regionWillChangeAnimated:(*(void *)&self->_flags >> 11) & 1];
  }
}

- (void)_updateIconsShouldAlignToPixels
{
  int v3 = [(VKMapView *)self->_mapView iconsShouldAlignToPixels];
  BOOL v4 = [(MKMapView *)self _iconsShouldAlignToPixels];
  [(VKMapView *)self->_mapView setIconsShouldAlignToPixels:v4];
  if (v3 != v4)
  {
    mapView = self->_mapView;
    [(VKMapView *)mapView setNeedsDisplay];
  }
}

- (BOOL)_iconsShouldAlignToPixels
{
  BOOL result = (![(MKMapView *)self _isHandlingUserEvent]
         || ([(VKMapView *)self->_mapView isPitched] & 1) == 0
         && ((*(void *)&self->_flags & 0x20400000) == 0
           ? (BOOL v3 = (*(void *)&self->_flags & 0x4008) == 16392)
           : (BOOL v3 = 1),
             !v3))
        && self->_userTrackingMode != 2
        && (uint64_t flags = (uint64_t)self->_flags, (flags & 0x4801) != 0x801)
        && (flags & 0x80000000000000) == 0;
  return result;
}

- (BOOL)_isHandlingUserEvent
{
  return [(VKMapView *)self->_mapView isGesturing];
}

- (void)_updateRotationAttributes
{
  if ([(MKMapView *)self _updateRotationSupported])
  {
    [(MKMapView *)self _updateContentBounds];
  }
}

- (void)_dropDraggingAnnotationView:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000000) != 0)
  {
    uint64_t v5 = 4;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFEFFFFFFFFFFFFBLL | v5;
    [(MKAnnotationContainerView *)self->_annotationContainer _dropDraggingAnnotationViewAnimated:!a3];
    annotationManager = self->_annotationManager;
    [(MKAnnotationManager *)annotationManager setDraggedAnnotation:0];
  }
}

- (id)_pitchButton
{
  pitchButton = self->_pitchButton;
  if (!pitchButton)
  {
    BOOL v4 = +[MKPitchButton pitchButtonWithMapView:self];
    uint64_t v5 = self->_pitchButton;
    self->_pitchButton = v4;

    [(MKPitchButton *)self->_pitchButton _setBackgroundStyle:self->_pitchButtonBackgroundStyle];
    [(MKPitchButton *)self->_pitchButton setVisibility:[(MKMapView *)self pitchButtonVisibility]];
    [(MKPitchButton *)self->_pitchButton setTranslatesAutoresizingMaskIntoConstraints:0];
    pitchButton = self->_pitchButton;
  }

  return pitchButton;
}

- (void)_countUsageForAnnotationViewsIfNeeded:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MKMapView *)self _createAnnotationViewSetIfNeeded];
  if ([(NSMutableSet *)self->_annotationViewEventSet count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v23 = *(void *)v33;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * v7);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        double v10 = self->_annotationViewEventSet;
        uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              -[MKMapView _countUsageOfTypeIfNeeded:forAnnotationView:countedEventTypes:](self, "_countUsageOfTypeIfNeeded:forAnnotationView:countedEventTypes:", [*(id *)(*((void *)&v28 + 1) + 8 * v14++) integerValue], v8, v9);
            }
            while (v12 != v14);
            uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v12);
        }

        if (v9)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v15 = v9;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v25;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v15);
                }
                [(NSMutableSet *)self->_annotationViewEventSet removeObject:*(void *)(*((void *)&v24 + 1) + 8 * v19++)];
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }
            while (v17);
          }
        }
        uint64_t v20 = [(NSMutableSet *)self->_annotationViewEventSet count];

        if (!v20) {
          break;
        }
        if (++v7 == v6)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v4 = v21;
  }
}

- (void)_countUsageOfTypeIfNeeded:(unint64_t)a3 forAnnotationView:(id)a4 countedEventTypes:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  switch(a3)
  {
    case '*':
      [v16 displayPriority];
      float v10 = v9;
      [(id)objc_opt_class() _defaultDisplayPriority];
      if (v10 != v11) {
        goto LABEL_15;
      }
      break;
    case '+':
      if ([v16 isDraggable]) {
        goto LABEL_15;
      }
      break;
    case ',':
      if ([v16 collisionMode]) {
        goto LABEL_15;
      }
      break;
    case '-':
      uint64_t v12 = [v16 clusteringIdentifier];
      goto LABEL_12;
    case '.':
      if ([v16 canShowCallout]) {
        break;
      }
      goto LABEL_15;
    case '/':
      uint64_t v12 = [v16 detailCalloutAccessoryView];
LABEL_12:
      uint64_t v13 = (void *)v12;
      if (v12) {
        goto LABEL_13;
      }
      break;
    case '0':
    case '1':
    case '3':
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_15;
      }
      break;
    case '2':
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v14 = [v16 annotation];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      goto LABEL_15;
    case '4':
      uint64_t v13 = [v16 annotation];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
LABEL_13:

LABEL_15:
      [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:a3];
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
      [v8 addObject:v13];
LABEL_16:

      break;
    default:
      break;
  }
}

- (void)_createAnnotationViewSetIfNeeded
{
  if (!self->_annotationViewEventSet)
  {
    BOOL v3 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1ED97E370, &unk_1ED97E388, &unk_1ED97E3A0, &unk_1ED97E3B8, &unk_1ED97E3D0, &unk_1ED97E3E8, &unk_1ED97E400, &unk_1ED97E418, &unk_1ED97E430, &unk_1ED97E448, &unk_1ED97E460, 0);
    annotationViewEventSet = self->_annotationViewEventSet;
    self->_annotationViewEventSet = v3;
  }
}

- (MKFeatureVisibility)pitchButtonVisibility
{
  return self->_pitchButtonVisibility;
}

- (void)_updateContentBounds
{
  [(MKMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setBounds:](self->_contentView, "setBounds:");
  v14.origin.double x = v4;
  v14.origin.double y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  double MidX = CGRectGetMidX(v14);
  v15.origin.double x = v4;
  v15.origin.double y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  CGRectGetMidY(v15);
  [(UIView *)self->_contentView setCenter:MKIntegralCenterForView(self->_contentView, MidX)];
  -[MKBasicMapView setFrame:](self->_basicMapView, "setFrame:", v4, v6, v8, v10);
  [(MKBasicMapView *)self->_basicMapView layoutIfNeeded];
  annotationContainer = self->_annotationContainer;

  -[MKAnnotationContainerView setFrame:](annotationContainer, "setFrame:", v4, v6, v8, v10);
}

- (void)_setPitchButtonBackgroundStyle:(unint64_t)a3
{
  if (self->_pitchButtonBackgroundStyle != a3)
  {
    self->_pitchButtonBackgroundStyle = a3;
    id v4 = [(MKMapView *)self _pitchButton];
    [v4 _setBackgroundStyle:a3];
  }
}

- (void)mapLayerDidDraw:(id)a3
{
  id v14 = a3;
  uint64_t flags = (uint64_t)self->_flags;
  *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFBFFFFFFFFLL;
  if ((flags & 0x800000) == 0)
  {
    if ([(MKMapView *)self _mapViewHasUpdatedCamera]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    [(MKMapView *)self _updateScrollContainerView:0 forReason:v5];
  }
  if (self->_selectAnnotationViewAfterRedrawBlock)
  {
    double v6 = (void (**)(void))MEMORY[0x18C139AE0]();
    id selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
    self->_id selectAnnotationViewAfterRedrawBlock = 0;

    v6[2](v6);
  }
  if ((*(void *)&self->_flags & 0x8000000000) != 0)
  {
    double v8 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1) {
      double v10 = @"\n| external zoom: %.1f";
    }
    else {
      double v10 = @"\n| e: %.1f";
    }
    float v11 = [v14 consoleString:v9 == 1];
    [(MKMapView *)self _zoomLevel];
    uint64_t v13 = objc_msgSend(v11, "stringByAppendingFormat:", v10, v12);

    [(UITextView *)self->_vectorKitDebugView setText:v13];
    [(MKMapView *)self _updateVectorKitConsoleFrameWithEdgeInsets];
  }
}

- (BOOL)_mapViewHasUpdatedCamera
{
  [(VKMapView *)self->_mapView centerCoordinate];
  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v3, v4);
  [(VKMapView *)self->_mapView yaw];
  double v6 = v5;
  [(VKMapView *)self->_mapView pitch];
  double v8 = v7;
  [(VKMapView *)self->_mapView altitude];
  double v10 = v9;
  CLLocationCoordinate2DGetDistanceFrom();
  if (fabs(v11) <= 0.00000011920929
    && vabdd_f64(self->_oldHeading, v6) <= 0.00000011920929
    && vabdd_f64(self->_oldPitch, v8) <= 0.00000011920929
    && vabdd_f64(self->_oldAltitude, v10) <= 0.00000011920929)
  {
    return 0;
  }
  self->_oldCenterCoordinate = v13;
  self->_oldHeading = v6;
  self->_oldPitch = v8;
  self->_oldAltitude = v10;
  return 1;
}

- (VKMapView)_mapLayer
{
  return self->_mapView;
}

- (void)_updateScrollContainerView:(BOOL)a3 forReason:(int64_t)a4
{
  [(MKMapView *)self _zoomScale];
  double v8 = v7;
  [(MKMapView *)self _centerMapPoint];
  double v10 = v8 * v9;
  double v12 = v8 * v11;
  [(MKMapView *)self bounds];
  double v14 = v10 - v13 * 0.5;
  [(MKMapView *)self bounds];
  double v16 = v12 - v15 * 0.5;
  [(VKMapView *)self->_mapView edgeInsets];
  LODWORD(v10) = v17;
  [(VKMapView *)self->_mapView edgeInsets];
  double v19 = (float)((float)(*(float *)&v10 - v18) * 0.5) - v16;
  [(VKMapView *)self->_mapView edgeInsets];
  LODWORD(v16) = v20;
  [(VKMapView *)self->_mapView edgeInsets];
  double v22 = (float)((float)(*(float *)&v16 - v21) * 0.5) - v14;
  if ([(VKMapView *)self->_mapView iconsShouldAlignToPixels])
  {
    uint64_t v23 = [(MKMapView *)self window];
    if (!v23) {
      goto LABEL_5;
    }
    long long v24 = (void *)v23;
    long long v25 = [(MKMapView *)self window];
    long long v26 = [v25 screen];
    [v26 scale];
    double v28 = v27;

    if (v28 == 1.0)
    {
LABEL_5:
      double v22 = round(v22);
      double v19 = round(v19);
    }
    else
    {
      double v29 = floor(v22);
      double v22 = v29 + round((v22 - v29) * v28) / v28;
      double v30 = floor(v19);
      double v19 = v30 + round((v19 - v30) * v28) / v28;
    }
  }
  if (!a3)
  {
    long long v31 = +[MKThreadContext currentContext];
    objc_msgSend(v31, "_CA_setDisableActions:", 1);
  }
  long long v32 = [(UIView *)self->_scrollContainerView layer];
  objc_msgSend(v32, "setDoubleBounds:", 0.0, 0.0, v8 * 268435456.0, v8 * 268435456.0);
  objc_msgSend(v32, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v32, "setDoublePosition:", v22, v19);
  [(MKMapView *)self _centerMapPoint];
  double v34 = v33;
  double v36 = v35;
  CGFloat v37 = v8 * v33;
  CGFloat v38 = v8 * v35;
  [(VKMapView *)self->_mapView presentationYaw];
  double v40 = v39 * -0.0174532925;
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v56.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v56.m33 = v41;
  long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v56.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v56.m43 = v42;
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v56.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v56.m13 = v43;
  long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v56.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v56.m23 = v44;
  CATransform3DTranslate_((CATransform3D *)&off_18BD1A000, &v56, v37, v38, 0.0);
  CATransform3DRotate_(v45, &v56, v40, 0.0, 0.0, 1.0);
  CATransform3DTranslate_(v46, &v56, -(v8 * v34), -(v8 * v36), 0.0);
  CATransform3D v55 = v56;
  [v32 setTransform:&v55];
  if (!a3)
  {
    CGRect v47 = +[MKThreadContext currentContext];
    objc_msgSend(v47, "_CA_setDisableActions:", 0);
  }
  double v48 = +[MKThreadContext currentContext];
  objc_msgSend(v48, "_CA_setDisableActions:", 1);

  [(MKAnnotationContainerView *)self->_annotationContainer setAnnotationViewsRotationRadians:0 animation:-v40];
  annotationContainer = self->_annotationContainer;
  [(VKMapView *)self->_mapView pitch];
  [(MKAnnotationContainerView *)annotationContainer setMapPitchRadians:v50 * 0.0174532925];
  [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationViewsForReason:a4];
  double v51 = [(MKOverlayContainerView *)self->_overlayContainer layer];
  objc_msgSend(v51, "setAnchorPoint:", 0.0, 0.0);
  CATransform3DMakeScale(&v54, v8, v8, 1.0);
  CATransform3D v53 = v54;
  [v51 setTransform:&v53];
  objc_msgSend(v51, "setDoublePosition:", 0.0, 0.0);
  [(MKOverlayContainerView *)self->_overlayContainer setMapZoomScale:v8];
  CGFloat v52 = +[MKThreadContext currentContext];
  objc_msgSend(v52, "_CA_setDisableActions:", 0);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerMapPoint
{
  [(MKMapView *)self centerCoordinate];

  double v4 = MKTilePointForCoordinate(v2, v3, 21.0);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  [(VKMapView *)self->_mapView centerCoordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (double)_zoomScale
{
  [(MKMapView *)self _zoomLevel];
  return 1.0 / exp2(21.0 - v2);
}

- (double)_zoomLevel
{
  [(VKMapView *)self->_mapView currentZoomLevelForTileSize:128];
  return result;
}

- (BOOL)annotationContainerShouldAlignToPixels:(id)a3
{
  if ([(VKMapView *)self->_mapView iconsShouldAlignToPixels]) {
    return 1;
  }
  double v4 = (void *)MEMORY[0x1E4F42FF0];

  return objc_msgSend(v4, "_mapkit_shouldAdoptImplicitAnimationParameters");
}

- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5
{
  double v5 = fabs(a5.x);
  double v6 = fabs(a5.y);
  if (v5 == INFINITY || v6 == INFINITY) {
    return 0;
  }
  if (self->_cachedVenueIDWithFocus)
  {
    id v10 = (id)objc_msgSend(a4, "annotation", a3, INFINITY, a5.y, v5, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v10 venueID] == self->_cachedVenueIDWithFocus
      && (unsigned __int16)self->_cachedDisplayedFloorOrdinalForVenueWithFocus != (unsigned __int16)[v10 venueFloorOrdinal])
    {
      return 0;
    }
  }
  return 1;
}

uint64_t __31__MKMapView_annotationRectTest__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained[83] annotationRectTest];
    double v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, double, double, double, double))(v11 + 16))(v11, a2 * 0.0000000037252903, 1.0 - (a3 + a5) * 0.0000000037252903, (a2 + a4) * 0.0000000037252903, 1.0 - a3 * 0.0000000037252903);
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)annotationRectTest
{
  id annotationRectTest = self->_annotationRectTest;
  if (!annotationRectTest)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__MKMapView_annotationRectTest__block_invoke;
    v8[3] = &unk_1E54B8C18;
    objc_copyWeak(&v9, &location);
    double v4 = (void *)[v8 copy];
    id v5 = self->_annotationRectTest;
    self->_id annotationRectTest = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id annotationRectTest = self->_annotationRectTest;
  }
  double v6 = (void *)MEMORY[0x18C139AE0](annotationRectTest, a2);

  return v6;
}

- (id)annotationCoordinateTest
{
  id annotationCoordinateTest = self->_annotationCoordinateTest;
  if (!annotationCoordinateTest)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__MKMapView_annotationCoordinateTest__block_invoke;
    v8[3] = &unk_1E54B8C40;
    objc_copyWeak(&v9, &location);
    double v4 = (void *)[v8 copy];
    id v5 = self->_annotationCoordinateTest;
    self->_id annotationCoordinateTest = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id annotationCoordinateTest = self->_annotationCoordinateTest;
  }
  double v6 = (void *)MEMORY[0x18C139AE0](annotationCoordinateTest, a2);

  return v6;
}

uint64_t __37__MKMapView_annotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained[83] annotationCoordinateTest];
    double v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, double, double))(v7 + 16))(v7, a2, a3);
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3
{
}

- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      uint64_t v7 = self->_unsafeDelegate;
    }
    else
    {
      uint64_t v7 = [(MKMapView *)self _safeDelegate];
    }
    double v8 = v7;
  }
  else
  {
    double v8 = 0;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        id v10 = self->_unsafeDelegate;
      }
      else
      {
        id v10 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    [(MKMapViewDelegate *)v11 mapView:self didAddAnnotationViews:v6];
  }
  [(MKAnnotationContainerView *)self->_annotationContainer dropPinsIfNeeded];
  double v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        float v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          usageCounter = self->_usageCounter;
          id v20 = v18;
          [v20 _setUsageCounter:usageCounter];
          [v12 addObject:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  if ([v12 count]) {
    [(MKMapView *)self _countUsageForAnnotationViewsIfNeeded:v12];
  }
}

- (MKMapRect)visibleMapRect
{
  double v2 = [(VKMapView *)self->_mapView mapRegion];
  GEOMapRectForMapRegion();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (int64_t)_lookAroundAvailability
{
  return self->_cachedLookAroundAvailability;
}

- (void)_setEdgeInsets:(UIEdgeInsets)a3
{
}

- (BOOL)_isShowingCuratedElevatedGround
{
  return [(VKMapView *)self->_mapView isShowingCuratedElevatedGround];
}

- (UIEdgeInsets)_labelEdgeWidths
{
  [(VKMapView *)self->_mapView labelEdgeWidths];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  result.double right = v9;
  result.double bottom = v7;
  result.double left = v5;
  result.double top = v3;
  return result;
}

- (UIEdgeInsets)_labelEdgeInsets
{
  [(VKMapView *)self->_mapView labelEdgeInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  result.double right = v9;
  result.double bottom = v7;
  result.double left = v5;
  result.double top = v3;
  return result;
}

- (BOOL)isUserLocationVisible
{
  return [(MKMapView *)self _isUserLocationInView:0];
}

- (UIEdgeInsets)_attributionInsets
{
  double top = self->_attributionInsets.top;
  double left = self->_attributionInsets.left;
  double bottom = self->_attributionInsets.bottom;
  double right = self->_attributionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCompassEnabled:(BOOL)a3
{
  if (self->_showsCompass != a3) {
    -[MKMapView setShowsCompass:](self, "setShowsCompass:");
  }
}

- (VKLabelMarker)_selectedLabelMarker
{
  return (VKLabelMarker *)[(VKMapView *)self->_mapView selectedLabelMarker];
}

- (UITapGestureRecognizer)_twoFingerTapGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController twoFingerTapGestureRecognizer];
}

- (UIPinchGestureRecognizer)_pinchGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController pinchGestureRecognizer];
}

- (UIGestureRecognizer)_oneHandedZoomGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController oneHandedZoomGestureRecognizer];
}

- (UITapGestureRecognizer)_doubleTapGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController doubleTapGestureRecognizer];
}

- (void)_setDisplayedSearchResultsType:(int64_t)a3
{
}

- (void)setShowsLiveEVData:(BOOL)a3
{
}

- (GEOMapRegion)mapRegion
{
  return (GEOMapRegion *)[(VKMapView *)self->_mapView mapRegion];
}

- (UIRotationGestureRecognizer)_rotationGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController rotationGestureRecognizer];
}

- (UIPanGestureRecognizer)_panningGestureRecognizer
{
  return [(MKMapGestureController *)self->_gestureController panGestureRecognizer];
}

- (UILongPressGestureRecognizer)_longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

void __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F64500] sharedConfiguration];
  [v0 updateProvidersForCurrentCountry];

  v1 = +[MKTrafficSupport sharedTrafficSupport];
  [v1 setupTrafficIncidents];

  MKRegisterGEOMultitaskingNotifications();
  float v4 = @"ZoomingDefault";
  v5[0] = &unk_1ED97DF50;
  float v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 registerDefaults:v2];
}

- (int64_t)_controlsUserInterfaceStyleOverride
{
  MKMapType v3 = [(MKMapView *)self mapType];
  int64_t v4 = 2;
  if (v3 - 1 >= 4 && v3 != 107)
  {
    double v5 = [(MKMapView *)self traitCollection];
    if ([v5 userInterfaceStyle] == 2) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 1;
    }
  }
  return v4;
}

- (MKMapType)mapType
{
  return _MKMapTypeForCartographicConfiguration(&self->_cartographicConfiguration.style);
}

- (BOOL)_isPitched
{
  return [(VKMapView *)self->_mapView isPitched];
}

- (BOOL)isPitchEnabled
{
  if ((*(void *)&self->_flags & 0x100000000) == 0) {
    return 0;
  }
  mapView = self->_mapView;
  if (mapView) {
    return [(VKMapView *)mapView isPitchable];
  }
  else {
    return 1;
  }
}

- (BOOL)_canEnter3DMode
{
  int v3 = [(VKMapView *)self->_mapView canEnter3DMode];
  if (v3)
  {
    LOBYTE(v3) = [(MKMapView *)self isPitchEnabled];
  }
  return v3;
}

- (void)_setAttributionInsets:(UIEdgeInsets)a3
{
  self->_attributionInsets = a3;
  [(MKMapView *)self _layoutAttribution];
}

- (void)_updateUserLocation:(id)a3 routeMatch:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  float v8 = [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
  [v8 _setRouteMatch:v7];
  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    double v10 = [v9 _userLocationProxy];
  }
  else
  {
    double v10 = 0;
  }

  if (v7 != 0 && (*(void *)&self->_flags & 0x100000000000) != 0) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  [(VKMapView *)self->_mapView setRouteLineSplitAnnotation:v11];
  objc_opt_class();
  double v12 = 0;
  if (objc_opt_isKindOfClass())
  {
    double v12 = [v6 uuid];
  }
  double v13 = [(VKMapView *)self->_mapView userLocationAnimator];
  [v13 updateLocation:v6 routeMatch:v7 & ((uint64_t)(*(void *)&self->_flags << 18) >> 63) locationUpdateUUID:v12];

  if (v12)
  {
    double v14 = MKGetPuckTrackingLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      int v17 = v12;
      __int16 v18 = 2080;
      double v19 = "-[MKMapView(UserPositioningInternal) _updateUserLocation:routeMatch:]";
      _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_INFO, "[MK] %@ Processed - in %s", (uint8_t *)&v16, 0x16u);
    }
  }
  [v6 coordinate];
  -[VKRouteContext setPuckLocation:](self->_routeContext, "setPuckLocation:");
  if (v7)
  {
    uint64_t v15 = [(id)v7 route];
    -[VKRouteContext setRouteOffset:](self->_routeContext, "setRouteOffset:", [(id)v7 routeCoordinate]);
    -[VKRouteContext setCurrentSegmentIndex:](self->_routeContext, "setCurrentSegmentIndex:", objc_msgSend(v15, "segmentIndexForStepIndex:", objc_msgSend((id)v7, "stepIndex")));
    -[VKRouteContext setCurrentStepIndex:](self->_routeContext, "setCurrentStepIndex:", [(id)v7 stepIndex]);
    -[VKRouteContext setPuckSnappedStopID:](self->_routeContext, "setPuckSnappedStopID:", [(id)v7 transitID]);
  }
  else
  {
    [(VKRouteContext *)self->_routeContext setRouteOffset:*MEMORY[0x1E4F64198]];
    [(VKRouteContext *)self->_routeContext setCurrentSegmentIndex:0x7FFFFFFFFFFFFFFFLL];
    [(VKRouteContext *)self->_routeContext setCurrentStepIndex:0x7FFFFFFFFFFFFFFFLL];
    [(VKRouteContext *)self->_routeContext setPuckSnappedStopID:0];
  }
}

- (void)_updateUserLocationViewWithLocation:(id)a3 hadUserLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v32 = a3;
  id v6 = self->_userLocation;
  if (v6)
  {
    unint64_t v7 = v6;
    if (v4)
    {
      if ([(MKUserLocation *)v6 isEqualToLocation:v32])
      {
        if ([(MKAnnotationManager *)self->_annotationManager containsAnnotation:v7])
        {
          float v8 = [(VKMapView *)self->_mapView userLocationAnimator];
          int v9 = [v8 hasElevation];

          if (v9)
          {
            [(MKUserLocation *)v7 setLocation:v32];
            [v32 course];
            -[MKUserLocation setCourse:](v7, "setCourse:");
            *(void *)&self->_flags &= ~0x1000000000000uLL;
            goto LABEL_42;
          }
        }
      }
    }
  }
  else
  {
    double v10 = objc_alloc_init(MKUserLocation);
    userLocation = self->_userLocation;
    self->_userLocation = v10;

    unint64_t v7 = self->_userLocation;
  }
  if (!self->_userTrackingMode) {
    [(MKUserLocation *)v7 setLocation:v32];
  }
  double v12 = [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
  if (v12
    && ([(MKAnnotationManager *)self->_annotationManager annotationRepresentations],
        double v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 containsObject:v12],
        v13,
        v14))
  {
    uint64_t v15 = [v12 _userLocationProxy];
    int v16 = [(VKMapView *)self->_mapView userLocationAnimator];
    [v16 setTarget:v15];

    if (self->_userTrackingMode)
    {
      int v17 = [(VKMapView *)self->_mapView userLocationAnimator];
      [v17 setBehavior:2];
    }
    __int16 v18 = [(VKMapView *)self->_mapView userLocationAnimator];
    [v18 start];

    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  [(MKLocationManager *)self->_locationManager expectedGpsUpdateInterval];
  -[MKUserLocation setExpectedCoordinateUpdateInterval:](self->_userLocation, "setExpectedCoordinateUpdateInterval:");
  if (self->_userTrackingMode) {
    [(MKUserLocation *)self->_userLocation setLocation:v32];
  }
  id v20 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v22 = 0;
      goto LABEL_24;
    }
    id v21 = [v20 _mkUserLocationView];
  }
  long long v22 = v21;
LABEL_24:

  [(MKUserLocation *)self->_userLocation expectedCoordinateUpdateInterval];
  [v22 updateStateFromLocation:v32 duration:v23 + 0.1];

  long long v24 = objc_msgSend(v32, "_navigation_routeMatch");
  [(MKMapView *)self _updateUserLocation:v32 routeMatch:v24];

  if (v19)
  {
    long long v25 = [(VKMapView *)self->_mapView userLocationAnimator];
    [(MKLocationManager *)self->_locationManager currentVehicleHeading];
    objc_msgSend(v25, "updateVehicleHeading:");
  }
  [(MKAnnotationManager *)self->_annotationManager addAnnotation:v7];
  if (qword_1EB315C80 != -1) {
    dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
  }
  if (_MergedGlobals_130)
  {
    long long v26 = self->_unsafeDelegate;
  }
  else
  {
    long long v26 = [(MKMapView *)self _safeDelegate];
  }
  uint64_t v27 = v26;
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    if (qword_1EB315C80 != -1) {
      dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
    }
    if (_MergedGlobals_130)
    {
      double v29 = self->_unsafeDelegate;
    }
    else
    {
      double v29 = [(MKMapView *)self _safeDelegate];
    }
    double v30 = v29;
    [(MKMapViewDelegate *)v29 mapView:self didUpdateUserLocation:v7];
  }
  long long v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 postNotificationName:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:self];

  if (!v4 && self->_userTrackingMode)
  {
    [(VKMapView *)self->_mapView setStaysCenteredDuringPinch:1];
    [(MKAnnotationManager *)self->_annotationManager updateVisibleAnnotations];
    [(VKMapView *)self->_mapView startTrackingAnnotation:self->_userLocation trackHeading:self->_userTrackingMode == 2 animated:self->_userTrackingModeShouldAnimate duration:0 timingFunction:-1.0];
  }

LABEL_42:
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)&self->_flags |= 0x1000000000000uLL;
  BOOL v5 = [(MKMapView *)self hasUserLocation];
  id v6 = [v4 lastLocation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = [v6 uuid];
    if (v7)
    {
      float v8 = MKGetPuckTrackingLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412546;
        double v29 = v7;
        __int16 v30 = 2080;
        long long v31 = "-[MKMapView(UserPositioningInternal) locationManagerUpdatedLocation:]";
        _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "[MK] %@ Received - in %s", (uint8_t *)&v28, 0x16u);
      }
    }
  }
  uint64_t flags = (uint64_t)self->_flags;
  double v10 = v6;
  if ((flags & 0x20000000000) != 0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v12 = [v6 timestamp];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;

    double v15 = *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration;
    if (*(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration < 0.0)
    {
      int v16 = +[MKLocationManager sharedLocationManager];
      [v16 expectedGpsUpdateInterval];
      *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration = v17 + 0.1;

      double v15 = *(double *)&_userTrackingScrollDuration_kUserTrackingScrollDuration;
    }
    double v18 = Current + v15 - v14;
    double v19 = CFAbsoluteTimeGetCurrent();
    id v20 = [v6 timestamp];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    double v10 = v6;
    if (v18 > 0.0)
    {
      [v4 expectedGpsUpdateInterval];
      double v10 = v6;
      if (v19 - v22 < v23)
      {
        double v10 = [v6 propagateLocationToTime:v18];
      }
    }
    [(MKMapView *)self setPredictedUserLocation:v10];
    uint64_t flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x80) != 0)
  {
    [(MKMapView *)self _updateLocationConsole];
    *(void *)&self->_flags &= ~0x1000000000000uLL;
  }
  else
  {
    [(MKMapView *)self _updateUserLocationViewWithLocation:v10 hadUserLocation:v5];
    *(void *)&self->_flags &= ~0x1000000000000uLL;
    if (self->_userTrackingMode)
    {
      uint64_t v24 = [(MKMapView *)self cameraBoundary];
      if (v24)
      {
        long long v25 = (void *)v24;
        long long v26 = [(MKMapView *)self cameraBoundary];
        [v10 coordinate];
        char v27 = objc_msgSend(v26, "_containsCoordinate:");

        if ((v27 & 1) == 0) {
          [(MKMapView *)self setUserTrackingMode:0];
        }
      }
    }
    if ([(MKMapView *)self _useVehicleHeading]) {
      [(MKMapView *)self _updateCourseForMapViewHeading:v6];
    }
  }
}

- (BOOL)_useVehicleHeading
{
  return (*(void *)&self->_flags >> 18) & 1;
}

- (void)setPredictedUserLocation:(id)a3
{
  id v9 = a3;
  userLocation = self->_userLocation;
  if (!userLocation)
  {
    BOOL v5 = self;
    id v6 = objc_alloc_init(MKUserLocation);
    unint64_t v7 = v5->_userLocation;
    v5->_userLocation = v6;

    userLocation = v5->_userLocation;
  }
  float v8 = userLocation;
  [(MKUserLocation *)v8 setPredictedLocation:v9];
}

- (BOOL)hasUserLocation
{
  float v2 = [(MKUserLocation *)self->_userLocation location];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)_applicationState
{
  return [(VKMapView *)self->_mapView applicationState];
}

- (void)_configureGestureRecognizers:(id)a3
{
  id v4 = (UIView *)a3;
  BOOL v5 = [MKMapGestureController alloc];
  if (v4) {
    contentView = v4;
  }
  else {
    contentView = self->_contentView;
  }
  unint64_t v7 = -[MKMapGestureController initWithMapView:gestureTargetView:doubleTapTargetView:](v5, "initWithMapView:gestureTargetView:doubleTapTargetView:", self->_basicMapView, contentView);

  gestureController = self->_gestureController;
  self->_gestureController = v7;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MKMapGestureController *)self->_gestureController setCompassView:self->_compassView];
  }
  [(MKMapGestureController *)self->_gestureController setScaleView:self->_scaleView];
  [(MKMapGestureController *)self->_gestureController setDelegate:self];
  id v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSelectGestureToSelect_];
  selectingTapGestureRecognizer = self->_selectingTapGestureRecognizer;
  self->_selectingTapGestureRecognizer = v9;

  [(UITapGestureRecognizer *)self->_selectingTapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_selectingTapGestureRecognizer setDelaysTouchesEnded:0];
  double v11 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSelectGestureToDeselect_];
  nonselectingTapGestureRecognizer = self->_nonselectingTapGestureRecognizer;
  self->_nonselectingTapGestureRecognizer = v11;

  [(UITapGestureRecognizer *)self->_nonselectingTapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_nonselectingTapGestureRecognizer setDelaysTouchesEnded:0];
  [(UITapGestureRecognizer *)self->_nonselectingTapGestureRecognizer requireGestureRecognizerToFail:self->_selectingTapGestureRecognizer];
  double v13 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleLongPressGesture_];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v13;

  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setMinimumPressDuration:0.2];
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setCancelsTouchesInView:0];
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:self];
  double v15 = self->_selectingTapGestureRecognizer;
  int v16 = [(MKMapGestureController *)self->_gestureController twoFingerTapGestureRecognizer];
  [(UITapGestureRecognizer *)v15 requireGestureRecognizerToFail:v16];

  double v17 = self->_selectingTapGestureRecognizer;
  double v18 = [(MKMapGestureController *)self->_gestureController panGestureRecognizer];
  [(UITapGestureRecognizer *)v17 requireGestureRecognizerToFail:v18];

  double v19 = self->_selectingTapGestureRecognizer;
  id v20 = [(MKMapGestureController *)self->_gestureController doubleTapGestureRecognizer];
  [(UITapGestureRecognizer *)v19 requireGestureRecognizerToFail:v20];

  double v21 = [(MKMapGestureController *)self->_gestureController oneHandedZoomGestureRecognizer];

  if (v21)
  {
    double v22 = self->_selectingTapGestureRecognizer;
    double v23 = [(MKMapGestureController *)self->_gestureController oneHandedZoomGestureRecognizer];
    [(UITapGestureRecognizer *)v22 requireGestureRecognizerToFail:v23];

    uint64_t v24 = self->_nonselectingTapGestureRecognizer;
    long long v25 = [(MKMapGestureController *)self->_gestureController oneHandedZoomGestureRecognizer];
    [(UITapGestureRecognizer *)v24 requireGestureRecognizerToFail:v25];
  }
  long long v26 = self->_nonselectingTapGestureRecognizer;
  char v27 = [(MKMapGestureController *)self->_gestureController twoFingerTapGestureRecognizer];
  [(UITapGestureRecognizer *)v26 requireGestureRecognizerToFail:v27];

  int v28 = self->_nonselectingTapGestureRecognizer;
  double v29 = [(MKMapGestureController *)self->_gestureController panGestureRecognizer];
  [(UITapGestureRecognizer *)v28 requireGestureRecognizerToFail:v29];

  __int16 v30 = self->_nonselectingTapGestureRecognizer;
  long long v31 = [(MKMapGestureController *)self->_gestureController doubleTapGestureRecognizer];
  [(UITapGestureRecognizer *)v30 requireGestureRecognizerToFail:v31];

  [(UIView *)self->_contentView addGestureRecognizer:self->_longPressGestureRecognizer];
  [(UIView *)self->_contentView addGestureRecognizer:self->_selectingTapGestureRecognizer];
  [(UIView *)self->_contentView addGestureRecognizer:self->_nonselectingTapGestureRecognizer];
  [(MKMapView *)self _addDebugGesture];

  [(MKMapView *)self _updateScrollingAndGestures];
}

- (void)_addDebugGesture
{
  if (GEOConfigGetBOOL())
  {
    BOOL v3 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_toggleLocationConsole_];
    [(UIGestureRecognizer *)v3 setNumberOfTapsRequired:2];
    [(UIGestureRecognizer *)v3 setNumberOfTouchesRequired:3];
    [(UIGestureRecognizer *)v3 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v3 setDelaysTouchesBegan:0];
    locationConsoleGesture = self->_locationConsoleGesture;
    self->_locationConsoleGesture = v3;
    BOOL v5 = v3;

    [(UIView *)self->_contentView addGestureRecognizer:self->_locationConsoleGesture];
  }
}

- (void)setShowsCompass:(BOOL)showsCompass
{
  self->_showsCompass = showsCompass;
  [(MKMapView *)self _updateCompassVisibility];
}

- (void)_setLabelEdgeWidths:(UIEdgeInsets)a3
{
  *(float *)&a3.double top = a3.top;
  *(float *)&a3.double left = a3.left;
  *(float *)&a3.double bottom = a3.bottom;
  *(float *)&a3.double right = a3.right;
  -[VKMapView setLabelEdgeWidths:](self->_mapView, "setLabelEdgeWidths:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_setLabelEdgeInsets:(UIEdgeInsets)a3
{
  *(float *)&a3.double top = a3.top;
  *(float *)&a3.double left = a3.left;
  *(float *)&a3.double bottom = a3.bottom;
  *(float *)&a3.double right = a3.right;
  -[VKMapView setLabelEdgeInsets:](self->_mapView, "setLabelEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKMapView *)self bounds];
  if (v9 == width && v8 == height)
  {
    v15.receiver = self;
    v15.super_class = (Class)MKMapView;
    -[MKMapView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  }
  else
  {
    [(MKMapView *)self _sizeWillChange];
    [(MKMapView *)self centerCoordinate];
    double v12 = v11;
    double v14 = v13;
    v16.receiver = self;
    v16.super_class = (Class)MKMapView;
    -[MKMapView setBounds:](&v16, sel_setBounds_, x, y, width, height);
    -[MKMapView _sizeDidChangeWithCenterCoordinate:](self, "_sizeDidChangeWithCenterCoordinate:", v12, v14);
  }
}

- (void)_registerTraitCollectionObservation
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
  id v6 = [v3 arrayWithArray:v4];

  [v6 addObject:objc_opt_class()];
  [v6 addObject:objc_opt_class()];
  [v6 addObject:objc_opt_class()];
  [v6 addObject:objc_opt_class()];
  id v5 = (id)[(MKMapView *)self registerForTraitChanges:v6 withAction:sel__traitEnvironment_didChangeTraitCollection_];
}

- (id)_commonInitFromIB:(BOOL)a3 gestureRecognizerHostView:(id)a4 locationManager:(id)a5 showsAttribution:(BOOL)a6 showsAppleLogo:(BOOL)a7 allowsAntialiasing:(BOOL)a8 carDisplayType:(int64_t)a9
{
  BOOL v115 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v12 = a3;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v116 = a4;
  id v14 = a5;
  objc_super v15 = MKGetMKMapViewLog();
  self->_mapViewDidFinishRenderingSignpostID = os_signpost_id_generate(v15);

  objc_super v16 = MKGetMKMapViewLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CommonInitialization", (const char *)&unk_18BD3917F, buf, 2u);
  }

  BOOL v17 = _MKLinkedOnOrAfterReleaseSet(1540);
  p_uint64_t flags = &self->_flags;
  uint64_t v19 = 0x400000000000000;
  if (v17) {
    uint64_t v19 = 0;
  }
  *(void *)p_uint64_t flags = *(void *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v19;
  BOOL v20 = _MKLinkedOnOrAfterReleaseSet(769);
  uint64_t v21 = 0x800000000000000;
  if (!v20) {
    uint64_t v21 = 0;
  }
  *(void *)p_uint64_t flags = *(void *)p_flags & 0xF7FFFFFFFFFFFFFFLL | v21;
  double v22 = objc_alloc_init(MKStandardMapConfiguration);
  preferredConfiguration = self->_preferredConfiguration;
  self->_preferredConfiguration = &v22->super;

  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:self->_preferredConfiguration];
  long long v24 = v124;
  *(_OWORD *)&self->_cartographicConfiguration.style = *(_OWORD *)buf;
  *(_OWORD *)&self->_cartographicConfiguration.projection = v24;
  *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage = v125;
  *(void *)&self->_cartographicConfiguration.gridOnldouble y = v126;
  long long v25 = v14;
  if (!v14)
  {
    long long v25 = +[MKLocationManager sharedLocationManager];
  }
  objc_storeStrong((id *)&self->_locationManager, v25);
  if (!v14) {

  }
  if (qword_1E9153FE0 != -1) {
    dispatch_once(&qword_1E9153FE0, &__block_literal_global_5);
  }
  [(MKLocationManager *)self->_locationManager setEnabled:!v12];
  long long v26 = (OS_dispatch_group *)dispatch_group_create();
  calloutShowAnimationGroup = self->_calloutShowAnimationGroup;
  self->_calloutShowAnimationGroup = v26;

  int v28 = objc_alloc_init(MKMapViewInternal);
  internal = self->_internal;
  self->_internal = v28;

  objc_storeWeak((id *)&self->_internal->view, self);
  __int16 v30 = (double *)MEMORY[0x1E4F437F8];
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  *(_OWORD *)&self->_attributionInsets.double top = *MEMORY[0x1E4F437F8];
  *(_OWORD *)&self->_attributionInsets.double bottom = v31;
  self->_compassViewSize = _MKLinkedOnOrAfterReleaseSet(3081);
  MKMapType v32 = [(MKMapView *)self mapType];
  if (v32 - 1 < 4 || v32 == 107)
  {
    self->_compassViewStyle = 0;
  }
  else
  {
    double v92 = [(MKMapView *)self traitCollection];
    self->_compassViewStyle = [v92 userInterfaceStyle] != 2;
  }
  __asm { FMOV            V0.2D, #5.0 }
  *(_OWORD *)&self->_compassInsets.double top = _Q0;
  *(_OWORD *)&self->_compassInsets.double bottom = _Q0;
  [(MKMapView *)self bounds];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  CGRect v46 = &self->_flags;
  *(void *)&self->_flags |= 0x102000uLL;
  CGRect v47 = +[MKSystemController sharedInstance];
  int v48 = [v47 supportsPitchAPI];
  uint64_t v49 = 0x100000000;
  if (!v48) {
    uint64_t v49 = 0;
  }
  *(void *)CGRect v46 = *(void *)v46 & 0xFFFFFFFEFFFFFFFFLL | v49;

  *(void *)v46 |= 0x80000000uLL;
  self->_showsCompass = 1;
  self->_scaleVisibilitdouble y = 1;
  self->_pitchButtonVisibilitdouble y = 1;
  self->_pitchButtonControlSize = 1;
  self->_BOOL userTrackingVisible = 0;
  self->_userTrackingControlSize = 1;
  [(MKMapView *)self _registerTraitCollectionObservation];
  double v50 = [(MKMapView *)self traitCollection];
  lastTraitCollection = self->_lastTraitCollection;
  self->_lastTraitCollection = v50;

  CGFloat v52 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CATransform3D v53 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MapKit.MKMapView.effectiveTraitCollectionIsolation", v52);
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  self->_lastEffectiveTraitCollectionIsolationQueue = v53;

  uint64_t v55 = 0x2000000;
  if (!v10) {
    uint64_t v55 = 0;
  }
  uint64_t v56 = 0x4000000;
  if (!v9) {
    uint64_t v56 = 0;
  }
  *(void *)CGRect v46 = v56 | v55 | *(void *)v46 & 0xFFFFFFFFF9FFFFFFLL;
  double v57 = [MEMORY[0x1E4F28B50] mainBundle];
  double v58 = [v57 bundleIdentifier];
  int v59 = [v58 isEqualToString:@"com.apple.Maps"];
  uint64_t v60 = 0x10000000;
  if (!v59) {
    uint64_t v60 = 0;
  }
  *(void *)CGRect v46 = *(void *)v46 & 0xFFFFFFFFEFFFFFFFLL | v60;

  *(void *)v46 |= 0x20008000000uLL;
  BOOL v61 = _MKLinkedOnOrAfterReleaseSet(2310);
  uint64_t v62 = 0x6C0000000000;
  if (v61) {
    uint64_t v62 = 0x680000000000;
  }
  *(void *)CGRect v46 = *(void *)v46 & 0xFFFFF3FFFFFFFFFFLL | v62;
  int IsExtension = _UIApplicationIsExtension();
  uint64_t v64 = 0x40000000000000;
  if (IsExtension) {
    uint64_t v64 = 0;
  }
  *(void *)CGRect v46 = *(void *)v46 & 0xFFBFFFFFFFFFFFFFLL | v64;
  double v65 = -[_MKMapContentView initWithFrame:]([_MKMapContentView alloc], "initWithFrame:", v39, v41, v43, v45);
  contentView = self->_contentView;
  self->_contentView = &v65->super;

  [(UIView *)self->_contentView setAutoresizesSubviews:0];
  [(UIView *)self->_contentView setClipsToBounds:1];
  double v67 = *v30;
  double v68 = v30[1];
  double v69 = v30[2];
  double v70 = v30[3];
  -[UIView setLayoutMargins:](self->_contentView, "setLayoutMargins:", *v30, v68, v69, v70);
  v71 = objc_alloc_init(MKMapCameraZoomRange);
  cameraZoomRange = self->_cameraZoomRange;
  self->_cameraZoomRange = v71;

  double v73 = -[MKMapCameraBoundary initWithMapRect:]([MKMapCameraBoundary alloc], "initWithMapRect:", 0.0, 0.0, 268435456.0, 268435456.0);
  cameraBoundardouble y = self->_cameraBoundary;
  self->_cameraBoundardouble y = v73;

  if (!v12)
  {
    double v75 = +[MKSystemController sharedInstance];
    uint64_t v76 = [v75 requiresRTT];

    v77 = -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:]([MKBasicMapView alloc], "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:", 0, v76, v115, a9, v39, v41, v43, v45);
    basicMapView = self->_basicMapView;
    self->_basicMapView = v77;

    v79 = [(MKBasicMapView *)self->_basicMapView mapView];
    mapView = self->_mapView;
    self->_mapView = v79;

    double v81 = +[MKSystemController sharedInstance];
    -[VKMapView setIsPitchable:](self->_mapView, "setIsPitchable:", [v81 supportsPitchAPI]);

    [(MKBasicMapView *)self->_basicMapView setRendersInBackground:_MergedGlobals_53];
    [(VKMapView *)self->_mapView _mapkit_configureFromDefaults];
    double v82 = self->_mapView;
    double v83 = [(MKMapView *)self traitCollection];
    double v84 = [v83 preferredContentSizeCategory];
    [(VKMapView *)v82 _mapkit_configureLabelSizesForContentSizeCategory:v84];

    double v85 = [[MKLabelSelectionFilter alloc] initWithMapFeatureOptions:0];
    labelSelectionFilter = self->_labelSelectionFilter;
    self->_labelSelectionFilter = v85;

    [(VKMapView *)self->_mapView setLabelSelectionFilter:self->_labelSelectionFilter];
    [(VKMapView *)self->_mapView setShowsVenues:(*(void *)&self->_flags >> 28) & 1];
    v87 = [MEMORY[0x1E4F647B8] sharedNoCreate];
    double v88 = v87;
    if (v87)
    {
      unsigned __int8 v89 = [v87 state];
      int v90 = v89;
      if (v89 >= 3u)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v90;
          _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        }
        BOOL v91 = 0;
      }
      else
      {
        BOOL v91 = (v89 & 7) == 2;
      }
      [(VKMapView *)self->_mapView setOfflineMode:v91];
    }
    double v93 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v93 addObserver:self selector:sel__offlineStateDidChange_ name:*MEMORY[0x1E4F63F28] object:0];

    [(VKMapView *)self->_mapView setMapDelegate:self];
    [(VKMapView *)self->_mapView setCameraDelegate:self];
    [(VKMapView *)self->_mapView setMapType:0 animated:0];
  }
  *(void *)&self->_flags |= 0x200000000uLL;
  [(VKMapView *)self->_mapView setShowsPointsOfInterest:1];
  [(VKMapView *)self->_mapView setShowsBuildings:(*(void *)&self->_flags >> 33) & 1];
  double v94 = -[MKScrollContainerView initWithFrame:]([MKScrollContainerView alloc], "initWithFrame:", 0.0, 0.0, 268435456.0, 268435456.0);
  scrollContainerView = self->_scrollContainerView;
  self->_scrollContainerView = &v94->super;

  [(UIView *)self->_scrollContainerView setAutoresizesSubviews:0];
  [(UIView *)self->_contentView addSubview:self->_scrollContainerView];
  double v96 = -[MKAnnotationContainerView initWithFrame:]([MKAnnotationContainerView alloc], "initWithFrame:", v39, v41, v43, v45);
  annotationContainer = self->_annotationContainer;
  self->_annotationContainer = v96;

  [(VKMapView *)self->_mapView addCustomFeatureDataSource:self->_annotationContainer];
  [(MKAnnotationContainerView *)self->_annotationContainer setAutoresizesSubviews:0];
  [(MKAnnotationContainerView *)self->_annotationContainer setAutoresizingMask:18];
  [(MKAnnotationContainerView *)self->_annotationContainer setDelegate:self];
  [(UIView *)self->_contentView insertSubview:self->_annotationContainer aboveSubview:self->_scrollContainerView];
  double v98 = objc_alloc_init(MKAnnotationManager);
  annotationManager = self->_annotationManager;
  self->_annotationManager = v98;

  [(MKAnnotationManager *)self->_annotationManager setDelegate:self];
  [(MKAnnotationManager *)self->_annotationManager setContainer:self];
  BOOL v100 = objc_alloc_init(MKMapCamera);
  camera = self->_camera;
  self->_camera = v100;

  [(MKMapCamera *)self->_camera _setMapView:self];
  if (!v12) {
    [(UIView *)self->_contentView insertSubview:self->_basicMapView belowSubview:self->_scrollContainerView];
  }
  [(MKMapView *)self addSubview:self->_contentView];
  [(MKMapView *)self setClipsToBounds:1];
  if ([(MKMapView *)self effectiveUserInterfaceLayoutDirection]) {
    int v102 = 4;
  }
  else {
    int v102 = 8;
  }
  self->_int attributionCorner = v102;
  [(MKMapView *)self _setPreferredConfiguration:self->_preferredConfiguration onInit:1];
  [(MKMapView *)self _registerConfigurationObservers];
  double v103 = [[_MKOfflineRegionsOverlayManager alloc] initWithMapView:self];
  offlineRegionsOverlayManager = self->_offlineRegionsOverlayManager;
  self->_offlineRegionsOverlayManager = v103;

  if (!*((unsigned char *)&self->_flags + 9)) {
    -[MKMapView setLayoutMargins:](self, "setLayoutMargins:", v67, v68, v69, v70);
  }
  [(MKMapView *)self _updateAppearanceIfNeeded];
  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();

  double v105 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v105 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
  [v105 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4F43710] object:0];
  [v105 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];
  [v105 addObserver:self selector:sel_applicationWillTerminate_ name:*MEMORY[0x1E4F43718] object:0];
  [v105 addObserver:self selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
  [v105 addObserver:self selector:sel_deviceOrientationDidChange_ name:*MEMORY[0x1E4F437D8] object:0];
  if (!_MKLinkedOnOrAfterReleaseSet(2310)) {
    [v105 addObserver:self selector:sel__willChangeStatusBarFrame_ name:*MEMORY[0x1E4F43700] object:0];
  }
  objc_initWeak((id *)buf, self);
  uint64_t v118 = MEMORY[0x1E4F143A8];
  uint64_t v119 = 3221225472;
  CGRect v120 = __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke_207;
  CGRect v121 = &unk_1E54B88E8;
  objc_copyWeak(&v122, (id *)buf);
  double v106 = MapsFeature_AddBlockListener();
  id shelbyvilleListener = self->_shelbyvilleListener;
  self->_id shelbyvilleListener = v106;

  v108 = [MEMORY[0x1E4F64918] modernManager];
  [v108 addTileGroupObserver:self queue:MEMORY[0x1E4F14428]];

  [(MKMapView *)self setUserInteractionEnabled:1];
  [(MKMapView *)self setMultipleTouchEnabled:1];
  self->_automaticallySnapsToNorth = 1;
  [(MKMapView *)self goToDefaultLocation];
  if (!v12) {
    [(MKMapView *)self _configureGestureRecognizers:v116];
  }
  uint64_t v109 = [[MKRotationFilter alloc] initWithMapLayer:self->_mapView];
  rotationFilter = self->_rotationFilter;
  self->_rotationFilter = v109;

  [(MKRotationFilter *)self->_rotationFilter setDelegate:self];
  [(MKMapGestureController *)self->_gestureController setRotationFilter:self->_rotationFilter];
  [(MKMapView *)self _updateAttribution];
  [(MKMapView *)self _updateAppleLogoVisibility];
  [(MKMapView *)self _stopEffects];
  self->_cachedLookAroundAvailabilitdouble y = 0;
  CGRect v111 = objc_alloc_init(MKUsageCounter);
  usageCounter = self->_usageCounter;
  self->_usageCounter = v111;

  [(MKUsageCounter *)self->_usageCounter count:0];
  [MEMORY[0x1E4F63E30] reportDailyUsageCountType:153];
  [(MKMapView *)self _setVectorKitConsoleEnabled:GEOConfigGetBOOL()];
  _GEOConfigAddDelegateListenerForKey();

  self->_controlBackgroundStyle = 1;
  [(MKMapView *)self _setPitchButtonBackgroundStyle:1];
  self->_userTrackingButtonBackgroundStyle = 1;
  CGRect v113 = MKGetMKMapViewLog();
  if (os_signpost_enabled(v113))
  {
    *(_WORD *)CGRect v117 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v113, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CommonInitialization", (const char *)&unk_18BD3917F, v117, 2u);
  }

  objc_destroyWeak(&v122);
  objc_destroyWeak((id *)buf);

  return self;
}

- (void)_setPreferredConfiguration:(id)a3 onInit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (MKMapConfiguration *)a3;
  if (self->_preferredConfiguration != v6)
  {
    [(MKMapView *)self _unregisterConfigurationObservers];
    BOOL v7 = [(MKMapView *)self _shouldDeselectMapFeatureForNewPreferredConfiguration:v6];
    double v8 = (MKMapConfiguration *)[(MKMapConfiguration *)v6 copy];
    preferredConfiguration = self->_preferredConfiguration;
    self->_preferredConfiguration = v8;

    [(MKMapView *)self _registerConfigurationObservers];
    if (v7)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      BOOL v10 = [(MKMapView *)self selectedAnnotations];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(MKMapView *)self deselectAnnotation:v15 animated:0];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
  [(MKMapView *)self _updateShowsTraffic];
  [(MKMapView *)self _updatePointOfInterestFilter];
  [(MKMapView *)self _updateShowsHiking];
  [(MKMapView *)self _updateCartographicConfigurationOnInit:v4];
}

- (void)_updateShowsTraffic
{
  BOOL v3 = [(MKMapConfiguration *)self->_preferredConfiguration _showsTraffic];
  [(MKBasicMapView *)self->_basicMapView updateStatsForTrafficEnabledTime];
  [(MKBasicMapView *)self->_basicMapView updateStatsForEnablingTraffic:v3];
  mapView = self->_mapView;

  [(VKMapView *)mapView setTrafficEnabled:v3];
}

- (void)_updateShowsHiking
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (objc_opt_respondsToSelector() & 1) != 0
    && [(MKMapConfiguration *)self->_preferredConfiguration _showsHiking];
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0
    && [(MKMapConfiguration *)self->_preferredConfiguration _showsTopographicFeatures];
  id v5 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109376;
    v6[1] = v3;
    __int16 v7 = 1024;
    BOOL v8 = v4;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "MKMapView: Setting hiking feature - showsHiking: %d - withTopographicFeatures: %d", (uint8_t *)v6, 0xEu);
  }

  [(VKMapView *)self->_mapView setShowsHiking:v3 withTopographicFeatures:v4];
}

- (void)_updatePointOfInterestFilter
{
  id v4 = [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
  if ([v4 _includesAllCategories])
  {
    [(VKMapView *)self->_mapView setPointsOfInterestFilter:0];
  }
  else
  {
    BOOL v3 = [v4 _geoPOICategoryFilter];
    [(VKMapView *)self->_mapView setPointsOfInterestFilter:v3];
  }
  [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:8];
}

- (void)_updateCartographicConfigurationOnInit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  +[MKMapConfiguration _cartographicConfigurationForMapConfiguration:self->_preferredConfiguration];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  BOOL v5 = [(MKOverlayContainerView *)self->_overlayContainer requiresModernMap];
  if ((_UIApplicationIsExtension() & 1) != 0
    || ![(MKMapConfiguration *)self->_preferredConfiguration _allowsTerrainModePromotion])
  {
    BOOL v7 = 0;
  }
  else
  {
    MKMapElevationStyle v6 = [(MKMapConfiguration *)self->_preferredConfiguration elevationStyle];
    BOOL v7 = _MKLinkedOnOrAfterReleaseSet(3338);
    if (v6 == MKMapElevationStyleRealistic)
    {
      overlayContainer = self->_overlayContainer;
      if (overlayContainer)
      {
        int v9 = [(MKOverlayContainerView *)overlayContainer supportsElevation];
        int v10 = 1;
      }
      else
      {
        int v10 = 1;
        int v9 = 1;
      }
      goto LABEL_9;
    }
  }
  int v10 = 0;
  int v9 = 0;
LABEL_9:
  unsigned int BOOL = GEOConfigGetBOOL();
  uint64_t v12 = 3;
  if (!v7) {
    uint64_t v12 = *((void *)&v17 + 1);
  }
  if ((v10 & v9) != 0) {
    uint64_t v12 = 1;
  }
  if (v5 | BOOL) {
    uint64_t v13 = BOOL;
  }
  else {
    uint64_t v13 = v12;
  }
  *((void *)&v17 + 1) = v13;
LABEL_17:
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  uint64_t v15 = v19;
  [(MKMapView *)self _setCartographicConfiguration:v14 onInit:v3 animated:1];
}

- (void)_setCartographicConfiguration:(id *)a3 onInit:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  int v9 = MKGetMKMapViewLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapType", (const char *)&unk_18BD3917F, buf, 2u);
  }

  uint64_t v10 = _VKMapTypeForMKCartographicConfiguration(&a3->var0);
  unsigned int v40 = _VKEmphasisForMKCartographicConfiguration(a3);
  uint64_t v11 = _VKTerrainModeForMKCartographicConfiguration((uint64_t)a3);
  unsigned int v41 = _VKMapKitUsageForMKCartographicConfiguration((uint64_t)a3);
  BOOL v12 = _VKMapKitClientModeForMKCartographicConfiguration((uint64_t)a3);
  BOOL v13 = a3->var2 == 1;
  BOOL v14 = [(MKMapView *)self _supportsVKMapType:v10];
  if (v10 == 3) {
    int v15 = 1;
  }
  else {
    int v15 = v10;
  }
  BOOL v16 = v10 != 3 && v13;
  if (v10 == 4) {
    unsigned int v17 = 2;
  }
  else {
    unsigned int v17 = v15;
  }
  BOOL v18 = v10 != 4 && v16;
  if (v14) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = v17;
  }
  if (v14) {
    BOOL v19 = v13;
  }
  else {
    BOOL v19 = v18;
  }
  if (!_MKCartographicConfigurationEquals((uint64_t)&self->_cartographicConfiguration, (uint64_t)a3) || a4)
  {
    BOOL v38 = v12;
    BOOL v39 = v5;
    uint64_t v22 = _MKMapTypeForCartographicConfiguration(&a3->var0);
    *(void *)&self->_flags |= 0x2000000000000uLL;
    double v23 = NSStringFromSelector(sel_mapType);
    [(MKMapView *)self willChangeValueForKey:v23];

    uint64_t v24 = v22;
    long long v25 = *(_OWORD *)&a3->var0;
    long long v26 = *(_OWORD *)&a3->var2;
    long long v27 = *(_OWORD *)&a3->var4;
    *(void *)&self->_cartographicConfiguration.gridOnldouble y = *(void *)&a3->var6;
    *(_OWORD *)&self->_cartographicConfiguration.projection = v26;
    *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage = v27;
    *(_OWORD *)&self->_cartographicConfiguration.style = v25;
    [(MKAnnotationContainerView *)self->_annotationContainer setMapType:v22];
    [(MKBasicMapView *)self->_basicMapView updateStatsForSwitchingToMapType:v10];
    if (!a4) {
      [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:[(MKMapView *)self _canShowFlyover]];
    }
    [(VKMapView *)self->_mapView setEnableGlobe:v19];
    [(VKMapView *)self->_mapView setTerrainMode:v11];
    [(VKMapView *)self->_mapView setMapType:v10 animated:v39];
    [(VKMapView *)self->_mapView setEmphasis:v40 animated:v39];
    [(VKMapView *)self->_mapView setMapKitUsage:v41];
    [(VKMapView *)self->_mapView setMapKitClientMode:v38];
    [(MKAttributionLabel *)self->_attributionLabel setMapType:v22];
    [(MKMapView *)self _layoutAttribution];
    [(MKScaleView *)self->_scaleView setMapType:v22];
    BOOL v28 = [(MKMapView *)self _showsNightMode];
    BOOL v29 = (unint64_t)(v22 - 1) < 4 || v22 == 107;
    uint64_t v30 = v28 || v29;
    [(MKScaleView *)self->_scaleView setUseLightText:v30];
    [(MKMapView *)self _updateAppearanceIfNeeded];
    [(MKMapView *)self _updateIconsShouldAlignToPixels];
    [(MKAnnotationManager *)self->_annotationManager updateVisibleAnnotations];
    *(void *)&self->_flags &= ~0x2000000000000uLL;
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      long long v31 = self->_unsafeDelegate;
    }
    else
    {
      long long v31 = [(MKMapView *)self _safeDelegate];
    }
    MKMapType v32 = v31;
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v34 = self->_unsafeDelegate;
      }
      else
      {
        double v34 = [(MKMapView *)self _safeDelegate];
      }
      double v35 = v34;
      [(MKMapViewDelegate *)v34 mapView:self didChangeMapType:v24];
    }
    double v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 postNotificationName:@"MKMapViewDidChangeMapTypeNotification" object:self];

    CGFloat v37 = NSStringFromSelector(sel_mapType);
    [(MKMapView *)self didChangeValueForKey:v37];

    BOOL v20 = MKGetMKMapViewLog();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)double v42 = 0;
      uint64_t v21 = v42;
      goto LABEL_47;
    }
  }
  else
  {
    [(VKMapView *)self->_mapView setEnableGlobe:v19];
    [(VKMapView *)self->_mapView setTerrainMode:v11];
    [(VKMapView *)self->_mapView setMapType:v10 animated:v5];
    [(VKMapView *)self->_mapView setEmphasis:v40 animated:v5];
    [(VKMapView *)self->_mapView setMapKitUsage:v41];
    [(VKMapView *)self->_mapView setMapKitClientMode:v12];
    BOOL v20 = MKGetMKMapViewLog();
    if (os_signpost_enabled(v20))
    {
      __int16 v43 = 0;
      uint64_t v21 = (uint8_t *)&v43;
LABEL_47:
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapType", (const char *)&unk_18BD3917F, v21, 2u);
    }
  }
}

- (BOOL)_supportsVKMapType:(int)a3
{
  mapView = self->_mapView;
  if (!mapView)
  {
    if ((a3 - 3) > 1)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    goto LABEL_6;
  }
  int v5 = [(VKMapView *)mapView supportsMapType:*(void *)&a3];
  int v6 = v5;
  if ((a3 - 5) >= 0xFFFFFFFE)
  {
    LOBYTE(v5) = 0;
    if (v6)
    {
LABEL_6:
      BOOL v7 = +[MKSystemController sharedInstance];
      char v8 = [v7 supports3DImagery];

      LOBYTE(v5) = v8;
    }
  }
  return v5;
}

- (void)mapLayerDidChangeVisibleRegion
{
  *(void *)&self->_flags |= 0x400000000uLL;
  [(MKMapView *)self _didChangeRegionMidstream:1];
  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    BOOL v3 = self->_unsafeDelegate;
  }
  else
  {
    BOOL v3 = [(MKMapView *)self _safeDelegate];
  }
  id v4 = v3;
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      int v6 = self->_unsafeDelegate;
    }
    else
    {
      int v6 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v7 = v6;
    [(MKMapViewDelegate *)v6 mapViewDidChangeVisibleRegion:self];
  }
  char v8 = [MEMORY[0x1E4F647B8] sharedNoCreate];
  if (v8)
  {
    id v9 = v8;
    [v8 mapView:self viewPortUpdated:-[MKMapView _geoCoordinateRegionForOffline](self)];
    char v8 = v9;
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  *(void *)&self->_uint64_t flags = flags & 0xFFFFFFF7FFFFFBFFLL | 0x400;
  [(MKMapView *)self _didChangeRegionMidstream:0];
  *(void *)p_flags &= ~0x400uLL;
  [(MKMapView *)self _clearFixedUserLocation];
  if (self->_showCalloutAfterRegionChangeBlock)
  {
    int v6 = (void (**)(void))MEMORY[0x18C139AE0]();
    id showCalloutAfterRegionChangeBlock = self->_showCalloutAfterRegionChangeBlock;
    self->_id showCalloutAfterRegionChangeBlock = 0;

    v6[2](v6);
  }
  if ([(MKMapView *)self _automaticallySnapsToNorth] && (flags & 0x100000000000000) != 0)
  {
    [(MKMapView *)self _snapToNorthIfNecessary];
  }
}

- (double)_geoCoordinateRegionForOffline
{
  if (!a1) {
    return 0.0;
  }
  if (GEOConfigGetBOOL()
    && ([a1 _mapLayer],
        float v2 = objc_claimAutoreleasedReturnValue(),
        [v2 mapRegionIgnoringEdgeInsets],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        v3))
  {
    GEOMapRectForMapRegion();
    GEOCoordinateRegionForMapRect();
    double v5 = v4;
  }
  else
  {
    [a1 visibleMapRect];
    *(void *)&double v5 = (unint64_t)MKCoordinateRegionForMapRect(v7);
  }
  return v5;
}

- (void)_clearFixedUserLocation
{
  if ((*(void *)&self->_flags & 0x400) == 0) {
    [(MKUserLocation *)self->_userLocation setFixedLocation:0];
  }
}

- (BOOL)_automaticallySnapsToNorth
{
  return self->_automaticallySnapsToNorth;
}

- (void)_updateAppearanceIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKMapView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 2)
  {
    MKMapType v4 = [(MKMapView *)self mapType];
    BOOL v5 = 0;
    if (v4 - 1 >= 4) {
      BOOL v5 = v4 != 107;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  int v6 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v5) {
      MKMapRect v7 = @"YES";
    }
    else {
      MKMapRect v7 = @"NO";
    }
    char v8 = v7;
    if ([(MKMapView *)self _showsNightMode]) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    uint64_t v10 = v9;
    int v20 = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    double v23 = v10;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "MKMapView: _updateAppearanceIfNeeded shouldShowNightMode : %@ self.showsNightMode : %@", (uint8_t *)&v20, 0x16u);
  }
  if (v5 != [(MKMapView *)self _showsNightMode])
  {
    [(MKMapView *)self _setShowsNightMode:v5];
    if ((*(void *)&self->_flags & 0x10) != 0
      && (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters") & 1) == 0)
    {
      BOOL v11 = [(MKBasicMapView *)self->_basicMapView isInBackground];
      char v12 = [(VKMapView *)self->_mapView rendersInBackground];
      if (!v11 || (v12 & 1) != 0)
      {
        BOOL v14 = [(MKMapView *)self _mapLayer];
        [v14 forceFrame];
      }
      else
      {
        [(VKMapView *)self->_mapView setRendersInBackground:1];
        BOOL v13 = [(MKMapView *)self _mapLayer];
        [v13 forceFrame];

        [(VKMapView *)self->_mapView setRendersInBackground:0];
      }
    }
  }
  MKMapType v15 = [(MKMapView *)self mapType];
  BOOL v16 = [(MKMapView *)self _showsNightMode];
  BOOL v17 = v15 - 1 < 4 || v15 == 107;
  uint64_t v18 = v16 || v17;
  [(MKScaleView *)self->_scaleView setUseLightText:v18];
  [(MKCompassView *)self->_compassView setOverrideUserInterfaceStyle:[(MKMapView *)self _controlsUserInterfaceStyleOverride]];
  appleLogoImageView = self->_appleLogoImageView;
  if (appleLogoImageView) {
    [(MKAppleLogoView *)appleLogoImageView updateForMapType:v15 darkMode:[(MKMapView *)self _showsNightMode]];
  }
}

- (BOOL)_showsNightMode
{
  return [(MKMapView *)self _mapDisplayStyle] == 1;
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle
{
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)[(VKMapView *)self->_mapView mapDisplayStyle];
}

- (void)_registerConfigurationObservers
{
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKMapView;
  -[MKMapView setLayoutMargins:](&v4, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  *((unsigned char *)&self->_flags + 9) = 1;
}

- (void)_unregisterConfigurationObservers
{
}

- (void)_stopEffects
{
}

- (void)_setVectorKitConsoleEnabled:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v5 = 0x8000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFF7FFFFFFFFFLL | v5;
    if (a3)
    {
      int v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E4F42F58]);
      vectorKitDebugView = self->_vectorKitDebugView;
      self->_vectorKitDebugView = v6;

      char v8 = [MEMORY[0x1E4F428B8] blackColor];
      id v9 = [v8 colorWithAlphaComponent:0.5];
      [(UITextView *)self->_vectorKitDebugView setBackgroundColor:v9];

      uint64_t v10 = [MEMORY[0x1E4F428B8] greenColor];
      [(UITextView *)self->_vectorKitDebugView setTextColor:v10];

      BOOL v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
      [(UITextView *)self->_vectorKitDebugView setFont:v11];

      [(UITextView *)self->_vectorKitDebugView setEditable:0];
      [(UITextView *)self->_vectorKitDebugView setAutoresizingMask:34];
      [(MKMapView *)self addSubview:self->_vectorKitDebugView];
    }
    else
    {
      [(UITextView *)self->_vectorKitDebugView removeFromSuperview];
      char v12 = self->_vectorKitDebugView;
      self->_vectorKitDebugView = 0;
    }
    [(MKMapView *)self _currentEnvironmentNameFrame];
    debugCurrentEnvironmentLabel = self->_debugCurrentEnvironmentLabel;
    -[_MKEnvironmentLabel setFrame:](debugCurrentEnvironmentLabel, "setFrame:");
  }
}

- (BOOL)_canShowFlyover
{
  return [(VKMapView *)self->_mapView canShowFlyover];
}

uint64_t __40__MKMapView_deviceOrientationDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHeadingOrientation];
}

- (void)_setShowsScaleDuringZoom:(BOOL)a3
{
}

- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((*(void *)&self->_flags & 0x4000000000) != 0) {
      char v8 = off_1E54B7BD8;
    }
    else {
      char v8 = off_1E54B7BA0;
    }
    id v9 = (objc_class *)*v8;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  BOOL v12 = _MKLinkedOnOrAfterReleaseSet(3852);
  uint64_t v13 = [v7 featureType];
  if (!v13 && !v12)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        BOOL v14 = self->_unsafeDelegate;
      }
      else
      {
        BOOL v14 = [(MKMapView *)self _safeDelegate];
      }
      MKMapType v15 = v14;
    }
    else
    {
      MKMapType v15 = 0;
    }
    char v16 = objc_opt_respondsToSelector();

    if (v16) {
      goto LABEL_24;
    }
LABEL_19:
    uint64_t v10 = [[_MKMapFeatureAnnotationView alloc] initWithAnnotation:v7 reuseIdentifier:0];
    goto LABEL_7;
  }
  if (v13) {
    goto LABEL_19;
  }
LABEL_24:
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v17 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v17 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0) {
    goto LABEL_49;
  }
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      int v20 = self->_unsafeDelegate;
    }
    else
    {
      int v20 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
  __int16 v22 = [(MKMapViewDelegate *)v21 mapView:self viewForAnnotation:v7];

  if (!v22)
  {
LABEL_49:
    id v9 = (objc_class *)_MKPointOfInterestAnnotationView;
LABEL_6:
    uint64_t v10 = (_MKMapFeatureAnnotationView *)[[v9 alloc] initWithAnnotation:v7 reuseIdentifier:0];
    [(_MKMapFeatureAnnotationView *)v10 setMapView:self];
    goto LABEL_7;
  }

LABEL_43:
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v23 = self->_unsafeDelegate;
    }
    else
    {
      double v23 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v24 = 0;
  }
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        long long v26 = self->_unsafeDelegate;
      }
      else
      {
        long long v26 = [(MKMapView *)self _safeDelegate];
      }
      long long v27 = v26;
    }
    else
    {
      long long v27 = 0;
    }
    uint64_t v10 = [(MKMapViewDelegate *)v27 mapView:self viewForAnnotation:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v28 = [v7 clusteringIdentifier];
      uint64_t v29 = [(MKAnnotationView *)v10 clusteringIdentifier];
      if (v29)
      {
        uint64_t v30 = (void *)v29;
        long long v31 = [(MKAnnotationView *)v10 clusteringIdentifier];
        char v32 = [v31 isEqualToString:v28];

        if ((v32 & 1) == 0)
        {
          id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"MKAnnotationView instances for cluster annotations cannot use a different clusteringIdentifier than its annotation." userInfo:0];
          objc_exception_throw(v33);
        }
      }
      [(MKAnnotationView *)v10 setClusteringIdentifier:v28];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_7:

  return v10;
}

- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6
{
  id v7 = objc_msgSend(a3, "viewRepresentation", a4.latitude, a4.longitude, a6);
  if (v7)
  {
    char v8 = v7;
    [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationView:v7];
    id v7 = v8;
  }
}

- (void)_setUseBalloonCalloutsForLabels:(BOOL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Do not use this SPI"];
  }
}

- (void)mapLayerLabelsDidLayout:(id)a3
{
  id v8 = a3;
  id labelsDidLayoutCallback = self->_labelsDidLayoutCallback;
  if (labelsDidLayoutCallback) {
    dispatch_async(MEMORY[0x1E4F14428], labelsDidLayoutCallback);
  }
  uint64_t v5 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
    [v7 _showDeferredSelectionAccessoryForReasonIfNeeded:2];
  }
}

- (void)willMoveToWindow:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    mapView = self->_mapView;
    id v7 = [(MKMapView *)self window];
    if (v4)
    {
      id v8 = [v4 windowScene];
    }
    else
    {
      id v8 = 0;
    }
    int v18 = 134219008;
    char v19 = self;
    __int16 v20 = 2048;
    uint64_t v21 = mapView;
    __int16 v22 = 2048;
    double v23 = v7;
    __int16 v24 = 2048;
    id v25 = v4;
    __int16 v26 = 2048;
    long long v27 = v8;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "willMoveToWindow called; MKMapView: %p | VKMapView: %p | self.window: %p | newWindow: %p | newWindow.windowScene: %p",
      (uint8_t *)&v18,
      0x34u);
    if (v4) {
  }
    }
  uint64_t v9 = _onscreenMapViews;
  uint64_t v10 = [(MKMapView *)self window];

  if (!v4 || v10)
  {
    BOOL v11 = [(MKMapView *)self window];

    if (!v4 && v11)
    {
      --_onscreenMapViews;
      [(MKMapView *)self _stopEffects];
    }
  }
  else
  {
    ++_onscreenMapViews;
    [(MKMapView *)self _startEffects];
  }
  if ((*(void *)&self->_flags & 0x1000000000) == 0)
  {
    if (v9 > 0 || _onscreenMapViews < 1)
    {
      if (v9 >= 1 && _onscreenMapViews <= 0)
      {
        BOOL v14 = +[MKSystemController sharedInstance];
        int v15 = [v14 overrideBlurStyle];

        if (v15)
        {
          char v16 = (void *)MEMORY[0x1E4F430A8];
          BOOL v17 = [MEMORY[0x1E4F42948] currentDevice];
          objc_msgSend(v16, "setAllBackdropViewsToGraphicsQuality:", objc_msgSend(v17, "_graphicsQuality"));
        }
      }
    }
    else
    {
      BOOL v12 = +[MKSystemController sharedInstance];
      int v13 = [v12 overrideBlurStyle];

      if (v13) {
        [MEMORY[0x1E4F430A8] setAllBackdropViewsToGraphicsQuality:10];
      }
    }
  }
  [(MKMapView *)self _unregisterSceneLifecycleNotifications];
  [(MKMapView *)self _forceManifestUpdateIfNecessary];
}

- (void)_startEffects
{
  unint64_t suspendedEffectsCount = self->_suspendedEffectsCount;
  if (suspendedEffectsCount)
  {
    self->_unint64_t suspendedEffectsCount = suspendedEffectsCount - 1;
    [(MKMapView *)self _updateEffects];
  }
}

- (void)_forceManifestUpdateIfNecessary
{
  if (_forceManifestUpdateIfNecessary_once != -1) {
    dispatch_once(&_forceManifestUpdateIfNecessary_once, &__block_literal_global_241);
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  [(MKMapView *)&v3 didMoveToSuperview];
  [(MKMapView *)self updateLayoutGuides];
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)MKMapView;
  [(MKMapView *)&v8 didMoveToWindow];
  objc_super v3 = [(MKMapView *)self window];

  if (v3)
  {
    [(MKMapView *)self _registerSceneLifecycleNotifications];
    [(MKMapView *)self _updateShowHeadingIndicator];
    id v4 = [(MKMapView *)self window];
    uint64_t v5 = [v4 windowScene];
    unint64_t v6 = [v5 activationState];

    if (v6 <= 1) {
      [(MKMapView *)self _issueDatasetCheckinCall];
    }
  }
  id v7 = [(UIImageView *)self->_attributionBadgeView superview];

  if (v7) {
    [(MKMapView *)self _updateAttribution];
  }
  [(MKMapView *)self updateLayoutGuides];
}

- (void)updateLayoutGuides
{
  [(MKMapView *)self _clearLayoutGuides];
  if ((*(void *)&self->_flags & 0x400000000000000) != 0)
  {
    objc_super v3 = [(UIView *)self _findNearestViewController];
    if (v3)
    {
      id v8 = v3;
      id v4 = [v3 topLayoutGuide];
      id topLayoutGuide = self->_topLayoutGuide;
      self->_id topLayoutGuide = v4;

      unint64_t v6 = [v8 bottomLayoutGuide];
      id bottomLayoutGuide = self->_bottomLayoutGuide;
      self->_id bottomLayoutGuide = v6;

      [self->_topLayoutGuide addObserver:self forKeyPath:@"bounds" options:0 context:0];
      [self->_bottomLayoutGuide addObserver:self forKeyPath:@"bounds" options:0 context:0];
      objc_super v3 = v8;
    }
  }
}

- (void)_clearLayoutGuides
{
  if ((*(void *)&self->_flags & 0x400000000000000) != 0)
  {
    [self->_topLayoutGuide removeObserver:self forKeyPath:@"bounds"];
    [self->_bottomLayoutGuide removeObserver:self forKeyPath:@"bounds"];
    id topLayoutGuide = self->_topLayoutGuide;
    self->_id topLayoutGuide = 0;

    id bottomLayoutGuide = self->_bottomLayoutGuide;
    self->_id bottomLayoutGuide = 0;
  }
}

- (void)_registerSceneLifecycleNotifications
{
  objc_super v3 = [(MKMapView *)self window];
  id v8 = [v3 windowScene];

  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x1E4F43CA8] object:v8];

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__sceneDidActivate_ name:*MEMORY[0x1E4F43C78] object:v8];

    unint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4F43C88] object:v8];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__sceneDidFinishSuspensionSnapshot_ name:*MEMORY[0x1E4F44138] object:v8];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  [(MKMapView *)&v3 safeAreaInsetsDidChange];
  [(MKMapView *)self _updateInsetsWithForce:1];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  [(MKMapView *)&v3 layoutMarginsDidChange];
  [(MKMapView *)self _updateInsetsWithForce:0];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKMapView *)self frame];
  if (v9 == width && v8 == height)
  {
    v15.receiver = self;
    v15.super_class = (Class)MKMapView;
    -[MKMapView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(MKMapView *)self _sizeWillChange];
    [(MKMapView *)self centerCoordinate];
    double v12 = v11;
    double v14 = v13;
    v16.receiver = self;
    v16.super_class = (Class)MKMapView;
    -[MKMapView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    -[MKMapView _sizeDidChangeWithCenterCoordinate:](self, "_sizeDidChangeWithCenterCoordinate:", v12, v14);
  }
  [(MKMapView *)self _updateHeadingOrientation];
  [(MKMapView *)self _updateInsetsWithForce:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapView;
  [(MKMapView *)&v3 layoutSubviews];
  [(MKMapView *)self _updateInsetsWithForce:1];
}

- (void)_updateInsets
{
  unint64_t flags = (unint64_t)self->_flags;
  if ((flags & 0x10000000000) != 0)
  {
    [(MKMapView *)self _edgeInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    goto LABEL_21;
  }
  double v5 = *MEMORY[0x1E4F437F8];
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if ((flags & 0x400000000000000) == 0)
  {
    if ((flags & 0x800000000000000) == 0) {
      goto LABEL_21;
    }
LABEL_20:
    [(MKMapView *)self layoutMargins];
    double v5 = v5 + v40;
    double v7 = v7 + v41;
    double v11 = v11 + v42;
    double v9 = v9 + v43;
    goto LABEL_21;
  }
  double v12 = [(UIView *)self _findNearestViewController];
  if (v12)
  {
    double v13 = [(MKMapView *)self window];
    double v14 = [v13 windowScene];
    objc_super v15 = [v14 statusBarManager];
    [v15 statusBarFrame];
    -[MKMapView convertRect:fromView:](self, "convertRect:fromView:", 0);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;

    double MaxY = 0.0;
    if (fabs(v23) >= 0.000001)
    {
      v45.origin.CGFloat x = v17;
      v45.origin.CGFloat y = v19;
      v45.size.CGFloat width = v21;
      v45.size.CGFloat height = v23;
      double MaxY = CGRectGetMaxY(v45);
    }
    id v25 = [v12 topLayoutGuide];
    [v25 length];
    double v27 = v26;

    uint64_t v28 = [v12 bottomLayoutGuide];
    [v28 length];
    double v30 = v29;

    long long v31 = [v12 view];
    [v31 bounds];
    CGFloat v32 = CGRectGetMaxY(v46) - v30;
    -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v31, 0.0, v27);
    double v5 = v33;
    -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v31, 0.0, v32);
    double v35 = v34;
    [(MKMapView *)self bounds];
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    if (v5 <= CGRectGetMinY(v47)
      || (v48.origin.CGFloat x = x, v48.origin.y = y, v48.size.width = width, v48.size.height = height, v5 >= CGRectGetMaxY(v48)))
    {
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      if (MaxY <= CGRectGetMinY(v49))
      {
        double v5 = 0.0;
      }
      else
      {
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.CGFloat width = width;
        v50.size.CGFloat height = height;
        double v5 = 0.0;
        if (MaxY < CGRectGetMaxY(v50)) {
          double v5 = MaxY;
        }
      }
    }
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double v11 = 0.0;
    double v9 = 0.0;
    if (v35 > CGRectGetMinY(v51))
    {
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      if (v35 < CGRectGetMaxY(v52))
      {
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        double v9 = CGRectGetMaxY(v53) - v35;
      }
    }

    double v7 = 0.0;
  }

  if ((*(void *)&self->_flags & 0x800000000000000) != 0) {
    goto LABEL_20;
  }
LABEL_21:

  -[MKMapView _setEdgeInsets:explicit:](self, "_setEdgeInsets:explicit:", (flags >> 40) & 1, v5, v7, v9, v11);
}

- (void)_updateInsetsWithForce:(BOOL)a3
{
  if (!a3 && (*(void *)&self->_flags & 0x1000000) != 0) {
    self->_hasPendingEdgeInsetsChange = 1;
  }
  else {
    [(MKMapView *)self _updateInsets];
  }
}

- (void)_updateHeadingOrientation
{
  if (self->_internal && [(MKMapView *)self _showHeadingIndicator])
  {
    int64_t v3 = [(MKMapView *)self _interfaceOrientation];
    locationManager = self->_locationManager;
    [(MKLocationManager *)locationManager setHeadingOrientation:v3];
  }
}

- (void)_updateShowHeadingIndicator
{
  BOOL v3 = [(MKMapView *)self _showHeadingIndicator];
  double v4 = [(MKMapView *)self window];
  double v5 = [v4 windowScene];
  unint64_t v6 = [v5 activationState];

  double v7 = [(MKMapView *)self window];

  if (v7
    && v6 <= 1
    && ([(MKMapView *)self _alwaysShowHeadingIndicator]
     || [(MKMapView *)self _showHeadingIndicatorForStepping]
     || self->_userTrackingMode == 2)
    && [(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation])
  {
    BOOL v8 = [(MKLocationManager *)self->_locationManager isHeadingServicesAvailable];
    [(MKMapView *)self _setShowHeadingIndicator:v8];
    if (!v3 && v8)
    {
      [(MKMapView *)self _updateHeadingOrientation];
      id v9 = [MEMORY[0x1E4F42948] currentDevice];
      [v9 beginGeneratingDeviceOrientationNotifications];
      goto LABEL_13;
    }
  }
  else
  {
    [(MKMapView *)self _setShowHeadingIndicator:0];
    LOBYTE(v8) = 0;
  }
  if (v8 || !v3) {
    return;
  }
  id v9 = [MEMORY[0x1E4F42948] currentDevice];
  [v9 endGeneratingDeviceOrientationNotifications];
LABEL_13:
}

- (BOOL)_showHeadingIndicator
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (void)_setShowHeadingIndicator:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if ((((flags & 0x8000) == 0) ^ a3)) {
    return;
  }
  BOOL v4 = a3;
  uint64_t v6 = 0x8000;
  if (!a3) {
    uint64_t v6 = 0;
  }
  *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
  *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFF7FFFLL | v6;
  id v7 = [(MKMapView *)self userLocationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = 0;
      goto LABEL_10;
    }
    id v8 = [v7 _mkUserLocationView];
  }
  id v9 = v8;
LABEL_10:

  [v9 setShouldDisplayHeading:v4];
  if (v4)
  {
    [(MKMapView *)self _startTrackingHeading];
    id v10 = [(MKLocationManager *)self->_locationManager heading];
  }
  else
  {
    [(MKMapView *)self _stopTrackingHeading];
    id v10 = 0;
  }
  -[MKMapView _updateHeading:animated:](self, "_updateHeading:animated:", v10, [MEMORY[0x1E4F39CF8] disableActions] ^ 1);
}

- (BOOL)_updateRotationSupported
{
  int v3 = [(MKLocationManager *)self->_locationManager isHeadingServicesAvailable];
  if (v3)
  {
    BOOL v4 = [(MKMapView *)self _rotationPossible];
    uint64_t flags = (uint64_t)self->_flags;
    char v6 = v4 ^ ((flags & 0x1000) == 0);
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = 4096;
      if (!v4) {
        uint64_t v7 = 0;
      }
      *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
      *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFFEFFFLL | v7;
      if (!v4 && [(MKMapView *)self userTrackingMode] == MKUserTrackingModeFollowWithHeading) {
        [(MKMapView *)self setUserTrackingMode:1];
      }
    }
    LOBYTE(v3) = v6 ^ 1;
  }
  return v3;
}

- (BOOL)_rotationPossible
{
  int v3 = [(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation];
  if (v3)
  {
    mapView = self->_mapView;
    LOBYTE(v3) = [(VKMapView *)mapView canRotate];
  }
  return v3;
}

- (BOOL)_alwaysShowHeadingIndicator
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (void)locationManagerUpdatedHeading:(id)a3
{
  id v17 = a3;
  BOOL v4 = [(MKMapView *)self _useVehicleHeading];
  double v5 = v17;
  if (!v4)
  {
    char v6 = v17;
    if ((*(void *)&self->_flags & 2) != 0)
    {
      [(MKMapView *)self _updateLocationConsole];
      char v6 = v17;
    }
    uint64_t v7 = [v6 heading];
    [v7 headingAccuracy];
    double v9 = v8;

    if (v9 >= 0.0)
    {
      uint64_t v12 = *(void *)&self->_flags & 0x8040;
      double v13 = [v17 heading];
      if (v12 == 0x8000)
      {
        [(MKMapView *)self _updateHeading:v13 animated:1];
LABEL_16:

        double v5 = v17;
        goto LABEL_17;
      }
      double v14 = v17;
      objc_super v15 = v13;
LABEL_15:
      [v14 setThrottledHeading:v15];
      goto LABEL_16;
    }
    id v10 = [(MKMapView *)self userLocationView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v13 = 0;
        goto LABEL_14;
      }
      id v11 = [v10 _mkUserLocationView];
    }
    double v13 = v11;
LABEL_14:

    double v16 = [v17 heading];
    [v16 headingAccuracy];
    objc_msgSend(v13, "setHeadingAccuracy:");

    double v14 = v17;
    objc_super v15 = 0;
    goto LABEL_15;
  }
LABEL_17:
}

- (void)_updateHeadingIndicatorAnimated:(BOOL)a3
{
  BOOL v4 = [(MKUserLocation *)self->_userLocation heading];
  if (v4)
  {
    id v8 = v4;
    id v5 = [(MKMapView *)self userLocationView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v7 = 0;
        goto LABEL_8;
      }
      id v6 = [v5 _mkUserLocationView];
    }
    uint64_t v7 = v6;
LABEL_8:

    [v8 headingAccuracy];
    objc_msgSend(v7, "setHeadingAccuracy:");
    [v7 setHeading:self->_heading];

    BOOL v4 = v8;
  }
}

- (void)_updateHeading:(id)a3 animated:(BOOL)a4
{
  id v21 = a3;
  [v21 heading];
  *(float *)&double v5 = v5;
  float v6 = roundf(*(float *)&v5);
  [(MKLocationManager *)self->_locationManager headingUpdateTimeInterval];
  double v8 = v7;
  double v9 = [(MKMapView *)self userLocation];
  [v9 setExpectedHeadingUpdateInterval:v8];

  if (v21)
  {
    [v21 headingAccuracy];
    double v11 = v10;
    id v12 = [(MKMapView *)self userLocationView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v14 = 0;
        goto LABEL_8;
      }
      id v13 = [v12 _mkUserLocationView];
    }
    double v14 = v13;
LABEL_8:

    [v14 setHeadingAccuracy:v11];
  }
  objc_super v15 = [(MKMapView *)self userLocation];
  [v15 setHeading:v21];

  if (v6 != -1.0 && vabdd_f64(v6, self->_heading) >= 0.001)
  {
    self->_heading = v6;
    [(MKMapView *)self _updateHeadingIndicatorAnimated:1];
    if ((*(void *)&self->_flags & 0x4000000000000000) != 0)
    {
      if (qword_1EB315C90 != -1) {
        dispatch_once(&qword_1EB315C90, &__block_literal_global_12);
      }
      if (_MergedGlobals_131)
      {
        double v16 = self->_unsafeDelegate;
      }
      else
      {
        double v16 = [(MKMapView *)self _safeDelegate];
      }
      id v17 = v16;
      double v18 = [(MKMapView *)self userLocation];
      [(MKMapViewDelegate *)v17 mapView:self didUpdateUserLocation:v18];
    }
    CGFloat v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:0x1ED91A628 object:self];

    double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 postNotificationName:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:self];
  }
}

- (MKUserLocation)userLocation
{
  userLocation = self->_userLocation;
  if (!userLocation)
  {
    int v3 = self;
    BOOL v4 = objc_alloc_init(MKUserLocation);
    double v5 = v3->_userLocation;
    v3->_userLocation = v4;

    userLocation = v3->_userLocation;
  }

  return userLocation;
}

- (void)_updateShouldDisplayEffects
{
  if ([(MKMapView *)self effectsEnabled]) {
    uint64_t v3 = (*(void *)&self->_flags >> 43) & 1;
  }
  else {
    uint64_t v3 = 0;
  }
  id v6 = [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
LABEL_8:
    double v5 = v4;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 _mkUserLocationView];
    goto LABEL_8;
  }
  double v5 = 0;
LABEL_10:

  [v5 setEffectsEnabled:v3];
}

- (BOOL)effectsEnabled
{
  if (self->_suspendedEffectsCount) {
    LOBYTE(v2) = 0;
  }
  else {
    return (*(void *)&self->_flags >> 4) & 1;
  }
  return v2;
}

- (MKAnnotationView)userLocationView
{
  return [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
}

- (void)_startTrackingHeading
{
  if (![(MKMapView *)self _useVehicleHeading])
  {
    locationManager = self->_locationManager;
    [(MKLocationManager *)locationManager startHeadingUpdateWithObserver:self];
  }
}

- (BOOL)_showHeadingIndicatorForStepping
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (int64_t)_interfaceOrientation
{
  uint64_t v3 = [MEMORY[0x1E4F42FF8] viewControllerForView:self];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 interfaceOrientation];
  }
  else
  {
    id v6 = [(MKMapView *)self window];
    double v7 = [v6 windowScene];
    int64_t v5 = [v7 interfaceOrientation];
  }
  return v5;
}

- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 animated:(BOOL)a6
{
}

- (void)setShowsTraffic:(BOOL)showsTraffic
{
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (void)_setShowsTrafficIncidents:(BOOL)a3
{
}

- (void)_setLoadLookAroundAvailability:(BOOL)a3
{
}

- (void)_setInactive:(BOOL)a3
{
}

- (UITapGestureRecognizer)_selectingTapGestureRecognizer
{
  return self->_selectingTapGestureRecognizer;
}

- (UITapGestureRecognizer)_nonselectingTapGestureRecognizer
{
  return self->_nonselectingTapGestureRecognizer;
}

- (void)_addPersistentVectorOverlay:(id)a3
{
}

- (void)goToDefaultLocation
{
  uint64_t v3 = MKGetMKMapViewLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GoToDefaultLocation", (const char *)&unk_18BD3917F, buf, 2u);
  }

  if ([(MKMapView *)self userTrackingMode] == MKUserTrackingModeNone
    || ![(MKMapView *)self hasUserLocation])
  {
    double v4 = MKDefaultCoordinateRegion();
    if (v5 < -180.0 || v5 > 180.0 || v4 < -90.0 || v4 > 90.0 || v6 < 0.0 || v6 > 180.0 || v7 < 0.0 || v7 > 360.0)
    {
      *(void *)&self->_flags |= 0x8000000000000uLL;
      [(MKMapView *)self _displayWorld];
      *(void *)&self->_flags &= ~0x8000000000000uLL;
    }
    else
    {
      *(void *)&self->_flags |= 0x8000000000000uLL;
      -[MKMapView setRegion:animated:](self, "setRegion:animated:", 0);
      *(void *)&self->_flags &= ~0x8000000000000uLL;
      double v8 = MKGetMKMapViewLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)double v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GoToDefaultLocation", (const char *)&unk_18BD3917F, v9, 2u);
      }
    }
  }
}

- (void)_setZoomScale:(double)a3 centerMapPoint:(id)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  v27.CGFloat x = var0;
  v27.CGFloat y = var1;
  CLLocationCoordinate2D v14 = MKCoordinateForMapPoint(v27);
  if (a3 == -1.0)
  {
    BOOL v18 = 0;
  }
  else
  {
    double v15 = log2(a3) + 21.0;
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = 0.0;
    }
    [(MKMapView *)self _zoomLevel];
    BOOL v18 = vabdd_f64(v16, v17) >= 1.0e-12;
  }
  if (v14.longitude == -180.0 && v14.latitude == -180.0)
  {
    BOOL v19 = 0;
  }
  else
  {
    [(MKMapView *)self centerCoordinate];
    BOOL v19 = vabdd_f64(v14.latitude, v20) >= 0.00000000999999994;
    if (vabdd_f64(v14.longitude, v21) >= 0.00000000999999994) {
      BOOL v19 = 1;
    }
  }
  if (v18 || v19)
  {
    if ([(MKMapView *)self _mustWaitUntilSized])
    {
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __75__MKMapView__setZoomScale_centerMapPoint_duration_timingFunction_animated___block_invoke;
      v24[3] = &unk_1E54B8A10;
      objc_copyWeak(v25, &location);
      v25[1] = *(id *)&a3;
      v25[2] = *(id *)&var0;
      v25[3] = *(id *)&var1;
      v25[4] = *(id *)&a5;
      [(MKMapView *)self _addSetRegionBlock:v24];
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    else
    {
      double v22 = -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", v14.latitude, v14.longitude, a3);
      if (a5 < 0.0 && v7)
      {
        [(VKMapView *)self->_mapView durationToAnimateToMapRegion:v22];
        a5 = v23;
      }
      [(MKMapView *)self _goToMapRegion:v22 duration:v13 timingFunction:v7 animated:0 completionHandler:a5];
    }
  }
}

- (void)setCamera:(MKMapCamera *)camera
{
  double v4 = camera;
  [(MKMapView *)self _clearGestureRecognizers];
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __23__MKMapView_setCamera___block_invoke;
    v5[3] = &unk_1E54B8C68;
    objc_copyWeak(&v7, &location);
    double v6 = v4;
    [(MKMapView *)self _addSetRegionBlock:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MKMapView *)self _setCamera:v4];
  }
}

- (void)_setCamera:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    -[MKMapView _setCamera:duration:timingCurve:completionHandler:](self, "_setCamera:duration:timingCurve:completionHandler:", v8, [MEMORY[0x1E4F42FF0] _currentAnimationCurve], v6, v7);
  }
  else
  {
    [(MKMapView *)self _setCamera:v8 duration:0 timing:v6 completionHandler:0.0];
  }
}

- (void)_setCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6
{
  double v16 = (MKMapCamera *)a3;
  id v10 = a5;
  id v11 = a6;
  if (v16)
  {
    if ([(MKMapCamera *)v16 _validate])
    {
      camera = self->_camera;
      if (camera != v16)
      {
        [(MKMapCamera *)camera _setMapView:0];
        id v13 = (MKMapCamera *)[(MKMapCamera *)v16 copy];
        CLLocationCoordinate2D v14 = self->_camera;
        self->_camera = v13;

        [(MKMapCamera *)self->_camera _setMapView:self];
        [(MKMapView *)self _updateFromCamera:self->_camera duration:v10 timing:v11 completionHandler:a4];
      }
    }
  }
  else
  {
    double v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"camera parameter should not be nil" userInfo:0];
    [v15 raise];
  }
}

- (void)_setCamera:(id)a3
{
}

- (void)setRegion:(MKCoordinateRegion)region animated:(BOOL)animated
{
  BOOL v4 = animated;
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__MKMapView_setRegion_animated___block_invoke;
    v21[3] = &unk_1E54B8A10;
    objc_copyWeak(v22, location);
    v22[1] = *(id *)&latitude;
    v22[2] = *(id *)&longitude;
    v22[3] = *(id *)&latitudeDelta;
    v22[4] = *(id *)&longitudeDelta;
    [(MKMapView *)self _addSetRegionBlock:v21];
    objc_destroyWeak(v22);
    objc_destroyWeak(location);
  }
  else
  {
    [(MKMapView *)self region];
    if (vabdd_f64(latitude, v13) >= 0.00000000999999994
      || vabdd_f64(longitude, v10) >= 0.00000000999999994
      || vabdd_f64(latitudeDelta, v11) >= 0.00000000999999994
      || vabdd_f64(longitudeDelta, v12) >= 0.00000000999999994)
    {
      if (longitude < -180.0
        || longitude > 180.0
        || latitude < -90.0
        || latitude > 90.0
        || latitudeDelta < 0.0
        || latitudeDelta > 180.0
        || longitudeDelta < 0.0
        || longitudeDelta > 360.0)
      {
        double v16 = NSString;
        double v17 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
        BOOL v18 = [v16 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v17, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

        id v20 = [v16 stringWithFormat:@"Invalid Region %@", v18];

        BOOL v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
        [v19 raise];
      }
      else
      {
        -[MKMapView _zoomLevelForRegion:includeAccessoryPadding:](self, "_zoomLevelForRegion:includeAccessoryPadding:", 0, latitude, longitude, latitudeDelta, longitudeDelta);
        -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", v4, latitude, longitude, v15);
      }
    }
    else
    {
      CLLocationCoordinate2D v14 = MKGetMKMapViewLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_DEBUG, "MKMapView: setRegion:animated: requested region is equal to existing region", (uint8_t *)location, 2u);
      }
    }
  }
}

- (BOOL)_mustWaitUntilSized
{
  [(MKMapView *)self bounds];
  if (v3 <= 0.0) {
    return 1;
  }
  [(MKMapView *)self bounds];
  return v4 <= 0.0;
}

- (MKCoordinateRegion)region
{
  [(MKMapView *)self centerCoordinate];
  double v4 = v3;
  double v6 = v5;
  [(MKMapView *)self visibleMapRect];
  MKCoordinateRegion result = MKCoordinateRegionForMapRect(v9);
  double v7 = v4;
  double v8 = v6;
  result.center.double longitude = v8;
  result.center.double latitude = v7;
  return result;
}

- ($FD8927DAD66E183363B3D9E862D46D99)_zoomRegionForMapRect:(SEL)a3 edgePadding:(id)a4 maxZoomLevel:(UIEdgeInsets)a5 minZoomLevel:(int64_t)a6
{
  double bottom = a5.bottom;
  double right = a5.right;
  double top = a5.top;
  double left = a5.left;
  double var0 = a4.var1.var0;
  double var1 = a4.var1.var1;
  double v36 = a4.var0.var1;
  double v33 = a4.var0.var0;
  if (a7 == -1) {
    [(MKMapView *)self _minimumZoomLevel];
  }
  else {
    double v9 = (double)a7;
  }
  double v32 = v9;
  if (a6 == -1) {
    [(MKMapView *)self _maximumZoomLevel];
  }
  else {
    double v10 = (double)a6;
  }
  double v31 = v10;
  [(MKMapView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(MKMapView *)self _edgeInsets];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  MKMapPoint v27 = +[MKSystemController sharedInstance];
  if ([v27 supports3DMaps])
  {
    int v28 = 0;
  }
  else
  {
    double v29 = [MEMORY[0x1E4FB3A58] sharedPlatform];
    int v28 = [v29 supportsHiResRTT] ^ 1;
  }
  double v43 = 0.0;
  double v44 = 0.0;
  uint64_t v42 = 0;
  v41[0] = 0.0;
  v41[1] = 0.0;

  _scaleForMapRect(&v43, (double *)&v42, v41, v28, v12 + v22, v14 + v20, v16 - (v22 + v26), v18 - (v20 + v24), v33, v36, var0, var1, top, left, bottom, right, v32, v31);
  v45.CGFloat x = v43;
  v45.CGFloat y = fmin(fmax(v44, 0.0), 268435456.0);
  MKCoordinateForMapPoint(v45);
  return result;
}

- (double)_zoomLevelForRegion:(id *)a3 includeAccessoryPadding:(BOOL)a4
{
  double v41 = v6;
  double v42 = v7;
  double v39 = v4;
  double v40 = v5;
  double v10 = +[MKSystemController sharedInstance];
  if ([v10 supports3DMaps])
  {

LABEL_4:
    GEOMapRectForCoordinateRegion();
    -[MKMapView _zoomLevelForMapRect:includeAccessoryPadding:](self, "_zoomLevelForMapRect:includeAccessoryPadding:", a3);
    return result;
  }
  double v11 = [MEMORY[0x1E4FB3A58] sharedPlatform];
  int v12 = [v11 supportsHiResRTT];

  if (v12) {
    goto LABEL_4;
  }
  [(MKMapView *)self _minimumZoomLevel];
  uint64_t v15 = (uint64_t)v14;
  [(MKMapView *)self _maximumZoomLevel];
  uint64_t v17 = (uint64_t)v16;
  [(MKMapView *)self bounds];
  double v19 = v18;
  double v21 = v20;
  [(MKMapView *)self _edgeInsets];
  if (v17 > v15)
  {
    double v37 = (v21 - (v22 + v24)) * 0.5;
    double v38 = (v19 - (v23 + v25)) * 0.5;
    while (1)
    {
      double v26 = MKTilePointForCoordinate(v39, v40, (double)v17);
      double v28 = v27;
      double v29 = v27 - v37;
      double v30 = v37 + v27;
      MKCoordinateForTilePoint(v26 - v38, v27, (double)v17);
      double v32 = v31;
      MKCoordinateForTilePoint(v38 + v26, v28, (double)v17);
      double v34 = v33;
      double v35 = MKCoordinateForTilePoint(v26, v29, (double)v17);
      if (v35 - MKCoordinateForTilePoint(v26, v30, (double)v17) + 0.0001 >= v41 && v34 - v32 + 0.0001 >= v42) {
        break;
      }
      if (--v17 <= v15) {
        return (double)v15;
      }
    }
  }
  return (double)v17;
}

- (id)_mapRegionWithCenterCoordinate:(CLLocationCoordinate2D)a3 zoomScale:(double)a4
{
  double v4 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (a4 == -1.0)
  {
    [(MKMapView *)self _zoomScale];
    double v4 = v8;
  }
  double v9 = MKTilePointForCoordinate(latitude, longitude, 21.0);
  double v11 = v10;
  [(MKMapView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  [(MKMapView *)self _edgeInsets];
  double v20 = (v15 - (v18 + v19)) / v4 * 0.5;
  double v21 = v11 - v20;
  double v22 = v11 + v20;
  if (v11 - v20 >= 0.0)
  {
    if (v22 > 268435456.0) {
      double v21 = v21 - (v22 + -268435456.0);
    }
  }
  else
  {
    double v22 = v22 - v21;
  }
  double v23 = (v13 - (v16 + v17)) / v4 * 0.5;
  double v24 = v9 + v23;
  v31.CGFloat x = v9 - v23;
  v31.CGFloat y = fmax(v21, 0.0);
  double v25 = fmin(v22, 268435456.0);
  CLLocationCoordinate2D v26 = MKCoordinateForMapPoint(v31);
  v32.CGFloat x = v24;
  v32.CGFloat y = v25;
  CLLocationCoordinate2D v27 = MKCoordinateForMapPoint(v32);
  id v28 = objc_alloc_init(MEMORY[0x1E4F64700]);
  [v28 setNorthLat:v26.latitude];
  [v28 setWestLng:v26.longitude];
  [v28 setSouthLat:v27.latitude];
  [v28 setEastLng:v27.longitude];

  return v28;
}

- (double)_goToCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  [(MKMapView *)self centerCoordinate];
  double v11 = v10;
  double v13 = v12;
  [(MKMapView *)self _zoomLevel];
  double v15 = v14;
  double v16 = vabdd_f64(latitude, v11);
  if (v16 >= 0.00000000999999994
    || vabdd_f64(longitude, v13) >= 0.00000000999999994
    || (double v17 = 0.0, vabdd_f64(a4, v14) >= 0.00001))
  {
    double v18 = [(MKMapView *)self window];

    if (!v18) {
      BOOL v5 = 0;
    }
    double v17 = 0.0;
    if (([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG] & 1) == 0)
    {
      if (self->_userTrackingMode && (v16 >= 0.00000000999999994 || vabdd_f64(longitude, v13) >= 0.00000000999999994))
      {
        [(MKUserLocation *)self->_userLocation coordinate];
        if ((vabdd_f64(latitude, v20) >= 0.00000000999999994 || vabdd_f64(longitude, v19) >= 0.00000000999999994)
          && (*(void *)&self->_flags & 0x8000000000000) == 0)
        {
          [(MKMapView *)self setUserTrackingMode:0];
        }
      }
      double v21 = -1.0;
      if (a4 != -1.0)
      {
        [(MKMapView *)self _boundedZoomLevel:a4];
        double v21 = v22;
      }
      int64_t v23 = [(MKMapView *)self _roundedZoomLevel];
      signed int v24 = llround(v21);
      if (v23 != v24 && v5)
      {
        if (v23 >= v24) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = v23;
        }
        [(MKMapView *)self centerCoordinate];
        double v29 = MKTilePointForCoordinate(v27, v28, (double)v26);
        double v31 = v30;
        cameraBoundarCGFloat y = self->_cameraBoundary;
        double v33 = latitude;
        double v34 = longitude;
        if (cameraBoundary) {
          -[MKMapCameraBoundary _clampedCoordinateForCoordinate:](cameraBoundary, "_clampedCoordinateForCoordinate:", latitude, longitude);
        }
        double v35 = MKTilePointForCoordinate(v33, v34, (double)v26);
        if (sqrt((v35 - v29) * (v35 - v29) + (v36 - v31) * (v36 - v31)) > 1000.0)
        {
          double v37 = -1.0;
          if (v21 == -1.0 || vabdd_f64(v15, v21) < 0.00001) {
            goto LABEL_36;
          }
          double v38 = 1.0 / exp2(21.0 - v21);
          goto LABEL_32;
        }
      }
      long double v39 = exp2(21.0 - v21);
      double v37 = -1.0;
      double v38 = 1.0 / v39;
      if (v21 == -1.0)
      {
        if (!v5) {
          goto LABEL_36;
        }
      }
      else if (!v5)
      {
        if (vabdd_f64(v15, v21) < 0.00001)
        {
LABEL_36:
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __54__MKMapView__goToCenterCoordinate_zoomLevel_animated___block_invoke;
          v43[3] = &unk_1E54B8AB0;
          v43[4] = self;
          *(double *)&v43[5] = v37;
          *(double *)&v43[6] = latitude;
          *(double *)&v43[7] = longitude;
          v43[8] = 0;
          char v44 = 0;
          [MEMORY[0x1E4F42FF0] performWithoutAnimation:v43];
          return v17;
        }
LABEL_32:
        double v37 = v38;
        goto LABEL_36;
      }
      if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
      {
        [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
        double v17 = v40;
        double v41 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
      }
      else
      {
        double v41 = 0;
        double v17 = -1.0;
      }
      -[MKMapView _setZoomScale:centerCoordinate:duration:timingFunction:animated:](self, "_setZoomScale:centerCoordinate:duration:timingFunction:animated:", v41, 1, v38, latitude, longitude, v17);
      if ((*(void *)&self->_flags & 1) == 0) {
        double v17 = 0.0;
      }
    }
  }
  return v17;
}

- (double)_zoomLevelForMapRect:(id)a3 includeAccessoryPadding:(BOOL)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  if (a4)
  {
    [(MKAnnotationContainerView *)self->_annotationContainer accessoryPadding];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F437F8];
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  [(MKMapView *)self _minimumZoomLevel];
  double v17 = v16;
  [(MKMapView *)self _maximumZoomLevel];
  uint64_t v19 = (int)vcvtpd_s64_f64(v18);

  -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", v19, (int)v17, v6, v5, var0, var1, v9, v11, v13, v15);
  return result;
}

- (double)_boundedZoomLevel:(double)a3
{
  [(MKMapView *)self _minimumZoomLevel];
  if (v5 >= a3)
  {
    [(MKMapView *)self _minimumZoomLevel];
    a3 = v6;
  }
  [(MKMapView *)self _maximumZoomLevel];
  if (a3 < v7) {
    return a3;
  }

  [(MKMapView *)self _maximumZoomLevel];
  return result;
}

- (double)_minimumZoomLevel
{
  [(VKMapView *)self->_mapView topDownMinimumZoomLevelForTileSize:128];
  return result;
}

- (double)_maximumZoomLevel
{
  [(VKMapView *)self->_mapView maximumZoomLevelForTileSize:128];
  return result;
}

- (int64_t)_roundedZoomLevel
{
  [(MKMapView *)self _zoomLevel];
  [(MKMapView *)self _boundedZoomLevel:round(v3)];
  return (uint64_t)v4;
}

- (void)_updateFromCamera:(id)a3 duration:(double)a4 timing:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = (MKMapCamera *)a3;
  id v10 = a5;
  double v11 = (void (**)(id, void))a6;
  if (self->_camera == v26)
  {
    [(MKMapCamera *)v26 pitch];
    if (v12 != 0.0)
    {
      double v13 = +[MKSystemController sharedInstance];
      char v14 = [v13 supportsPitchAPI];

      if ((v14 & 1) == 0)
      {
        if (_updateFromCamera_duration_timing_completionHandler__onceToken != -1) {
          dispatch_once(&_updateFromCamera_duration_timing_completionHandler__onceToken, &__block_literal_global_18);
        }
        [(MKMapCamera *)v26 setPitch:0.0];
      }
    }
    double v15 = self->_mapView;
    [(MKMapCamera *)v26 pitch];
    if (v16 != 0.0 && ([(VKMapView *)v15 isPitchable] & 1) == 0) {
      [(MKMapCamera *)v26 setPitch:0.0];
    }
    *(void *)&self->_flags |= 0x800000000uLL;
    [(MKMapCamera *)v26 centerCoordinate];
    [(MKMapCamera *)v26 centerCoordinate];
    VKLocationCoordinate2DMake();
    double v18 = v17;
    double v20 = v19;
    [(MKMapCamera *)v26 altitude];
    double v22 = v21;
    [(MKMapCamera *)v26 heading];
    double v24 = v23;
    [(MKMapCamera *)v26 pitch];
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](v15, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", v10, v11, v18, v20, v22, v24, v25, a4);
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }
}

void __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained _resumeUserInteraction];
    double v5 = v7;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      double v5 = v7;
    }
  }
}

- (void)_resumeUserInteraction
{
  unint64_t userInteractionDisabledCount = self->_userInteractionDisabledCount;
  if (userInteractionDisabledCount)
  {
    unint64_t v4 = userInteractionDisabledCount - 1;
    self->_unint64_t userInteractionDisabledCount = v4;
    [(UIView *)self->_contentView setUserInteractionEnabled:v4 == 0];
    [(MKMapView *)self _updateScrollingAndGestures];
  }
}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 timingFunction:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (!v9) {
    a4 = 0.0;
  }
  [(MKMapView *)self _clearGestureRecognizers];
  if (v9)
  {
    double v16 = (void *)MEMORY[0x1E4F42FF0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke;
    v27[3] = &unk_1E54B8248;
    id v28 = v13;
    double v29 = self;
    [v16 performWithoutAnimation:v27];
  }
  [(MKMapView *)self _suspendUserInteraction];
  if (v14)
  {
    double v17 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_2;
    v25[3] = &unk_1E54B8A38;
    id v7 = &v26;
    id v26 = v14;
  }
  else
  {
    double v17 = 0;
  }
  double v18 = (void *)MEMORY[0x18C139AE0](v17);
  objc_initWeak(&location, self);
  mapView = self->_mapView;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_3;
  v21[3] = &unk_1E54B8A60;
  objc_copyWeak(&v23, &location);
  id v20 = v15;
  id v22 = v20;
  [(VKMapView *)mapView setMapRegion:v13 pitch:v18 yaw:v21 duration:0.0 timingCurve:0.0 completion:a4];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  if (v14) {
}
  }

- (void)_updateScrollingAndGestures
{
  [(MKMapGestureController *)self->_gestureController setScrollEnabled:[(MKMapView *)self isScrollEnabled]];
  [(MKMapGestureController *)self->_gestureController setZoomEnabled:[(MKMapView *)self isZoomEnabled]];
  [(MKMapGestureController *)self->_gestureController setRotationEnabled:[(MKMapView *)self isRotateEnabled]];
  [(MKMapGestureController *)self->_gestureController setTiltEnabled:[(MKMapView *)self isPitchEnabled]];

  [(MKMapView *)self _updateFallbackTileLoading];
}

- (BOOL)isZoomEnabled
{
  return (*(void *)&self->_flags >> 20) & 1;
}

- (BOOL)isScrollEnabled
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (BOOL)isRotateEnabled
{
  return (*(void *)&self->_flags >> 31) & 1;
}

- (void)_updateFallbackTileLoading
{
  BOOL v3 = (*(void *)&self->_flags & 0x102000) != 0
    || [(MKMapView *)self isRotateEnabled]
    || [(MKMapView *)self isPitchEnabled];
  int v4 = [(MKMapView *)self isUserInteractionEnabled];
  uint64_t v5 = 0;
  if (v3 && v4) {
    uint64_t v5 = (*(void *)&self->_flags >> 54) & 1;
  }
  mapView = self->_mapView;

  [(VKMapView *)mapView setShouldLoadFallbackTiles:v5];
}

- (void)_clearGestureRecognizers
{
}

- (void)_suspendUserInteraction
{
  ++self->_userInteractionDisabledCount;
  [(UIView *)self->_contentView setUserInteractionEnabled:0];

  [(MKMapView *)self _updateScrollingAndGestures];
}

uint64_t __54__MKMapView__goToCenterCoordinate_zoomLevel_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setZoomScale:centerCoordinate:duration:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_suspendPropagatingEdgeInsets
{
}

- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 viewRepresentation];
  double v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 annotation];
    userLocation = self->_userLocation;

    if (v9 != userLocation)
    {
LABEL_16:
      double v25 = [(MKMapView *)self vk_mapLayer];
      id v26 = [v8 anchor];
      [v25 addExternalAnchor:v26];

      [(MKAnnotationContainerView *)self->_annotationContainer addAnnotationView:v8 allowAnimation:v4];
      goto LABEL_17;
    }
    uint64_t v11 = [v8 _vkNavigationPuckMarker];
    if (v11)
    {
      double v12 = (void *)v11;
      id v13 = [v8 _vkNavigationPuckMarker];
      id v14 = [(VKMapView *)self->_mapView navigationPuck];

      if (v13 != v14) {
        [v8 _setVKNavigationPuckMarker:0];
      }
    }
    id v15 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v19 = 0;
        goto LABEL_13;
      }
      id v16 = [v15 _mkUserLocationView];
    }
    double v19 = v16;
LABEL_13:

    id v20 = [(MKUserLocation *)self->_userLocation location];
    [v19 updateStateFromLocation:v20 duration:0.0];

    objc_msgSend(v19, "_setShowingPreciseAuthorizedLocation:", -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"));
    BOOL v21 = self->_userTrackingMode == 2;
    objc_msgSend(v19, "setShouldDisplayHeading:", -[MKMapView _showHeadingIndicator](self, "_showHeadingIndicator"));
    [v19 setShouldDisplayInaccurateHeading:v21];
    [v19 setForcesConeIndicator:v21];
    [v19 _setForceHeadingUp:v21];
    id v22 = [(MKUserLocation *)self->_userLocation heading];
    id v23 = v22;
    if (v22)
    {
      [v22 headingAccuracy];
      objc_msgSend(v19, "setHeadingAccuracy:");
      [v23 heading];
      objc_msgSend(v19, "setHeading:");
    }
    [(MKAnnotationContainerView *)self->_annotationContainer setUserLocationView:v15];
    double v24 = [(VKMapView *)self->_mapView navigationPuck];
    [v15 _setVKNavigationPuckMarker:v24];

    goto LABEL_16;
  }
  [(MKMapView *)self _addAnnotationsCustomFeatureStoreIfNeeded];
  annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
  v27[0] = v6;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [(_MKCustomFeatureStore *)annotationsCustomFeatureStore addAnnotations:v18];

LABEL_17:
}

- (double)_vectorKitTileZoomLevelForMapKitZoomLevel:(double)a3
{
  BOOL v4 = [(MKMapView *)self vk_mapLayer];
  [v4 zoomLevelAdjustmentForTileSize:128];
  double v6 = a3 - v5;

  return v6;
}

- (id)vk_mapLayer
{
  return self->_mapView;
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  [(MKMapView *)self _updateShowHeadingIndicator];
  [(MKMapView *)self _updateRotationSupported];
  id v4 = [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 _mkUserLocationView];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  if (v6) {
    objc_msgSend(v6, "_setShowingPreciseAuthorizedLocation:", -[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"));
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"__mapkit_regionSentinel"] & 1) != 0
    || ([v4 isEqualToString:@"__mapkit_edgeInsetsSentinel"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MKMapView;
    BOOL v5 = [(MKMapView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_setCartographicConfiguration:(id *)a3 animated:(BOOL)a4
{
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  uint64_t v8 = *(void *)&a3->var6;
  id v6 = +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:](MKMapConfiguration, "_mapConfigurationWithCartographicConfiguration:", v7, a4);
  [v6 _setInternalStateFromMapConfiguration:self->_preferredConfiguration];
  [(MKMapView *)self setPreferredConfiguration:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"bounds"])
  {
    [(MKMapView *)self _updateInsetsWithForce:1];
  }
  else if ((void *)MKMapConfigurationKVOContext == a6)
  {
    [(MKMapView *)self _setPreferredConfiguration:self->_preferredConfiguration onInit:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKMapView;
    [(MKMapView *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)setPreferredConfiguration:(MKMapConfiguration *)preferredConfiguration
{
}

void __44__MKMapView__forceManifestUpdateIfNecessary__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F64918] modernManager];
  [v0 updateManifest:0 completionHandler:&__block_literal_global_246];
}

- (BOOL)postsMapViewInitialRenderingNotification
{
  return 1;
}

- (void)_unregisterSceneLifecycleNotifications
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43CA8] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43C78] object:0];

  long long v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F43C88] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F44138] object:0];
}

- (void)_updateAttribution
{
  if ((*(void *)&self->_flags & 0x8000000) == 0) {
    goto LABEL_7;
  }
  BOOL v3 = [MEMORY[0x1E4F64918] modernManager];
  id v4 = [v3 activeTileGroup];
  uint64_t v5 = [v4 attributionsCount];

  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = +[MKMapAttributionImage badgeImageForView:self];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    attributionBadgeView = self->_attributionBadgeView;
    if (!attributionBadgeView)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F42AA0]);
      [v7 size];
      double v11 = v10;
      [v7 size];
      objc_super v13 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, v11, v12);
      id v14 = self->_attributionBadgeView;
      self->_attributionBadgeView = v13;

      [(UIImageView *)self->_attributionBadgeView setAutoresizingMask:9];
      [(MKMapView *)self addSubview:self->_attributionBadgeView];
      attributionBadgeView = self->_attributionBadgeView;
    }
    [(UIImageView *)attributionBadgeView setImage:v7];
    [(MKMapView *)self _updateAppleLogoVisibility];
  }
  else
  {
LABEL_7:
    id v15 = self->_attributionBadgeView;
    [(UIImageView *)v15 removeFromSuperview];
    id v16 = self->_attributionBadgeView;
    self->_attributionBadgeView = 0;

    if (v15) {
      [(MKMapView *)self _updateAppleLogoVisibility];
    }
  }
  double v17 = [MEMORY[0x1E4F64918] modernManager];
  double v18 = [v17 activeTileGroup];
  uint64_t v19 = [v18 attributionsCount];

  if (v19)
  {
    id v20 = [MEMORY[0x1E4F64918] modernManager];
    BOOL v21 = [v20 activeTileGroup];
    id v27 = [v21 attributionAtIndex:0];
  }
  else
  {
    id v27 = 0;
  }
  if ((*(void *)&self->_flags & 0x2000000) != 0
    && ([v27 url],
        id v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 length],
        v22,
        v23))
  {
    if (!self->_attributionLabel)
    {
      double v24 = objc_alloc_init(MKAttributionLabel);
      attributionLabel = self->_attributionLabel;
      self->_attributionLabel = v24;

      [(MKAttributionLabel *)self->_attributionLabel setMapType:[(MKMapView *)self mapType]];
      [(MKAttributionLabel *)self->_attributionLabel setDisplayStyle:self->_attributionLinkDisplayStyle];
      [(MKAttributionLabel *)self->_attributionLabel setUserInteractionEnabled:0];
      [(MKAttributionLabel *)self->_attributionLabel sizeToFit];
      [(MKMapView *)self addSubview:self->_attributionLabel];
    }
  }
  else
  {
    [(MKAttributionLabel *)self->_attributionLabel removeFromSuperview];
    id v26 = self->_attributionLabel;
    self->_attributionLabel = 0;
  }
  [(MKMapView *)self _layoutAttribution];
}

- (void)applicationDidBecomeActive:(id)a3
{
  [(MKMapView *)self setSuspended:0];
  [(MKBasicMapView *)self->_basicMapView setMapModeStartTime:CFAbsoluteTimeGetCurrent()];
  [(MKBasicMapView *)self->_basicMapView setTrafficStartTime:CFAbsoluteTimeGetCurrent()];
  id v4 = (void *)MEMORY[0x1E4F63E30];

  [v4 reportDailyUsageCountType:154];
}

- (void)setSuspended:(BOOL)a3
{
  if (((((*(void *)&self->_flags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      [(MKMapView *)self _stopEffects];
      uint64_t v4 = 256;
    }
    else
    {
      [(MKMapView *)self _startEffects];
      uint64_t v4 = 0;
    }
    char v5 = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
    *((unsigned char *)&self->_flags + 8) = v5;
  }
}

- (void)_addCustomFeatureDataSource:(id)a3
{
}

- (void)_setScaleVisibility:(int64_t)a3
{
  if (self->_scaleVisibility != a3)
  {
    self->_scaleVisibilitCGFloat y = a3;
    [(MKMapView *)self _showOrHideScaleIfNecessary:0];
  }
}

- (BOOL)_isUserLocationInView:(BOOL)a3
{
  if (![(MKMapView *)self hasUserLocation]) {
    return 0;
  }
  uint64_t v4 = [(MKAnnotationContainerView *)self->_annotationContainer userLocationView];
  char v5 = v4;
  if (v4
    && ([v4 superview], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, char v8 = [v5 isHidden], v7, (v8 & 1) == 0))
  {
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", self);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(MKMapView *)self bounds];
    v20.origin.CGFloat x = v11;
    v20.origin.CGFloat y = v13;
    v20.size.CGFloat width = v15;
    v20.size.CGFloat height = v17;
    BOOL v9 = CGRectIntersectsRect(v19, v20);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation
{
  BOOL v3 = showsUserLocation;
  if ([(MKMapView *)self showsUserLocation] != showsUserLocation)
  {
    uint64_t v5 = 0x80000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v5;
    uint64_t v6 = MKGetMKMapViewLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager startUpdatingUserLocation", buf, 2u);
      }

      [(MKMapView *)self startUpdatingUserLocation];
    }
    else
    {
      if (v7)
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager stopUpdatingUserLocation", v8, 2u);
      }

      [(MKMapView *)self stopUpdatingUserLocation];
    }
  }
}

- (void)startUpdatingUserLocation
{
  userLocation = self->_userLocation;
  if (!userLocation)
  {
    uint64_t v4 = self;
    uint64_t v5 = objc_alloc_init(MKUserLocation);
    uint64_t v6 = v4->_userLocation;
    v4->_userLocation = v5;

    userLocation = v4->_userLocation;
  }
  BOOL v7 = userLocation;
  BOOL v8 = [(MKUserLocation *)v7 isUpdating];

  if (!v8)
  {
    BOOL v9 = self->_userLocation;
    if (!v9)
    {
      double v10 = self;
      CGFloat v11 = objc_alloc_init(MKUserLocation);
      double v12 = v10->_userLocation;
      v10->_userLocation = v11;

      BOOL v9 = v10->_userLocation;
    }
    CGFloat v13 = v9;
    [(MKUserLocation *)v13 setUpdating:1];

    [(MKLocationManager *)self->_locationManager startLocationUpdateWithObserver:self];
    double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel_locationManagerApprovalDidChange_ name:MKLocationManagerApprovalDidChangeNotification object:0];

    if (qword_1EB315C80 != -1) {
      dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
    }
    if (_MergedGlobals_130)
    {
      CGFloat v15 = self->_unsafeDelegate;
    }
    else
    {
      CGFloat v15 = [(MKMapView *)self _safeDelegate];
    }
    double v16 = v15;
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      if (qword_1EB315C80 != -1) {
        dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
      }
      if (_MergedGlobals_130)
      {
        double v18 = self->_unsafeDelegate;
      }
      else
      {
        double v18 = [(MKMapView *)self _safeDelegate];
      }
      CGRect v19 = v18;
      [(MKMapViewDelegate *)v18 mapViewWillStartLocatingUser:self];
    }
  }
}

- (BOOL)showsUserLocation
{
  return (*(void *)&self->_flags >> 19) & 1;
}

BOOL __54__MKMapView_canPossiblyShowCompassForInternalControl___block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(257);
  byte_1E9153FD9 = !result;
  return result;
}

- (void)setBackdropViewQualityChangingDisabled:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (void)_setLocationPulseEnabled:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v3;
  [(MKMapView *)self _updateShouldDisplayEffects];
}

- (void)mapLayerDidStartLoadingTiles:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      uint64_t v4 = self->_unsafeDelegate;
    }
    else
    {
      uint64_t v4 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        BOOL v7 = self->_unsafeDelegate;
      }
      else
      {
        BOOL v7 = [(MKMapView *)self _safeDelegate];
      }
      BOOL v8 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewWillStartLoadingMap:self];
  }
}

- (void)mapLayerDidFinishLoadingTiles:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      uint64_t v4 = self->_unsafeDelegate;
    }
    else
    {
      uint64_t v4 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        BOOL v7 = self->_unsafeDelegate;
      }
      else
      {
        BOOL v7 = [(MKMapView *)self _safeDelegate];
      }
      BOOL v8 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewDidFinishLoadingMap:self];
  }
}

- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKMapView *)self isPitchEnabled];
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      char v6 = self->_unsafeDelegate;
    }
    else
    {
      char v6 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = v5 & v3;
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v10 = self->_unsafeDelegate;
      }
      else
      {
        double v10 = [(MKMapView *)self _safeDelegate];
      }
      CGFloat v11 = v10;
    }
    else
    {
      CGFloat v11 = 0;
    }
    [(MKMapViewDelegate *)v11 mapView:self canEnter3DModeDidChange:v9];
  }
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"MKMapViewCanEnter3DDidChangeNotification" object:self];
}

- (void)_setAlwaysShowHeadingIndicatorIfSupported:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(MKMapView *)self _shouldSupportAlwaysShowHeadingIndicator];
    p_uint64_t flags = &self->_flags;
    uint64_t flags = (uint64_t)self->_flags;
    if ((v4 ^ ((flags & 0x10000) == 0))) {
      return;
    }
    char v7 = *((unsigned char *)&self->_flags + 8);
    uint64_t v8 = 0x10000;
    if (!v4) {
      uint64_t v8 = 0;
    }
  }
  else
  {
    p_uint64_t flags = &self->_flags;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x10000) == 0) {
      return;
    }
    uint64_t v8 = 0;
    char v7 = *((unsigned char *)&self->_flags + 8);
  }
  *(void *)p_uint64_t flags = flags & 0xFFFFFFFFFFFEFFFFLL | v8;
  *((unsigned char *)p_flags + 8) = v7;

  [(MKMapView *)self _updateShowHeadingIndicator];
}

- (BOOL)_shouldSupportAlwaysShowHeadingIndicator
{
  BOOL v2 = +[MKSystemController sharedInstance];
  char v3 = [v2 supportsAlwaysOnCompass];

  return v3;
}

- (void)setLocationConsoleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKMapView *)self isLocationConsoleEnabled] != a3)
  {
    if (v3)
    {
      BOOL v5 = [[MKDebugLocationConsole alloc] initWithMapView:self];
      debugLocationConsole = self->_debugLocationConsole;
      self->_debugLocationConsole = v5;

      char v7 = self->_debugLocationConsole;
      [(MKMapView *)self addSubview:v7];
    }
    else
    {
      [(MKDebugLocationConsole *)self->_debugLocationConsole removeFromSuperview];
      uint64_t v8 = self->_debugLocationConsole;
      self->_debugLocationConsole = 0;
    }
  }
}

- (BOOL)isLocationConsoleEnabled
{
  return self->_debugLocationConsole != 0;
}

- (BOOL)_shouldDeselectMapFeatureForNewPreferredConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = __67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(self->_preferredConfiguration);
  LOBYTE(v6) = 0;
  if (__67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(v4)
    && (v5 & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    char v7 = [(MKMapView *)self selectedAnnotations];
    uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

uint64_t __67__MKMapView__shouldDeselectMapFeatureForNewPreferredConfiguration___block_invoke(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    long long v5 = 0u;
    long long v6 = 0u;
    long long v4 = 0u;
    if (v1) {
      objc_msgSend(v1, "cartographicConfiguration", v4, v5, v6, v7);
    }
    char isKindOfClass = (_MKMapTypeForCartographicConfiguration((uint64_t *)&v4) & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_setShowsNightMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(MKMapView *)self _showsNightMode] != a3)
  {
    long long v5 = MKGetMKMapViewLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if ([(MKMapView *)self _showsNightMode]) {
        long long v6 = @"YES";
      }
      else {
        long long v6 = @"NO";
      }
      uint64_t v7 = v6;
      if (v3) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      uint64_t v9 = v8;
      int v15 = 138412546;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      double v18 = v9;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "MKMapView: _setShowsNightMode self.showsNightMode : %@ showsNightMode : %@", (uint8_t *)&v15, 0x16u);
    }
    if (!v3 || (MKMapType v10 = [(MKMapView *)self mapType], v10 - 1 >= 4) && v10 != 107)
    {
      unint64_t v11 = [(MKMapView *)self _mapDisplayStyle] & 0xFFFFFFFFFFFFFF00;
      long long v12 = MKGetMKMapViewLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = @"NO";
        if (v3) {
          long long v13 = @"YES";
        }
        long long v14 = v13;
        int v15 = 138412546;
        uint64_t v16 = v14;
        __int16 v17 = 1024;
        LODWORD(v18) = v3;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, "MKMapView: _setShowsNightMode showsNightMode %@, setting style.timePeriod %d", (uint8_t *)&v15, 0x12u);
      }
      [(MKMapView *)self _setMapDisplayStyle:(v11 | v3) & 0xFFFFFFFFFFFFLL];
    }
  }
}

double __29__MKMapView__canShowControls__block_invoke()
{
  *(double *)&qword_1E9154008 = (double)GEOConfigGetInteger();
  double result = (double)GEOConfigGetInteger();
  *(double *)&qword_1E9154010 = result;
  return result;
}

- (void)_setShowsVenues:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x10000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x10000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFEFFFFFFFLL | v4;
    -[VKMapView setShowsVenues:](self->_mapView, "setShowsVenues:");
  }
}

- (void)_issueDatasetCheckinCall
{
  GEOMachAbsoluteTimeGetCurrent();
  if (v2 - *(double *)&_issueDatasetCheckinCall_lastCheckinTime >= 30.0)
  {
    _issueDatasetCheckinCall_lastCheckinTime = *(void *)&v2;
    BOOL v3 = [MEMORY[0x1E4F64710] sharedService];
    id v4 = [v3 ticketForDatasetCheckWithTraits:0];

    [v4 submitWithHandler:&__block_literal_global_407 networkActivity:&__block_literal_global_409];
  }
}

- (void)_setDebugConsoleAdditionalInfoProvider:(id)a3
{
  if (self->_debugConsoleAdditionalInfoProvider != a3)
  {
    id v4 = (void *)[a3 copy];
    id debugConsoleAdditionalInfoProvider = self->_debugConsoleAdditionalInfoProvider;
    self->_id debugConsoleAdditionalInfoProvider = v4;
  }
}

- (void)deviceOrientationDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MKMapView_deviceOrientationDidChange___block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double v11 = MKTilePointForCoordinate(a4.latitude, a4.longitude, 21.0);

  -[MKMapView _setZoomScale:centerMapPoint:duration:animated:](self, "_setZoomScale:centerMapPoint:duration:animated:", v6, a3, v11, v10, a5);
}

- (void)_resumePropagatingEdgeInsets
{
  unint64_t suspendPropagatingEdgeInsetsCount = self->_suspendPropagatingEdgeInsetsCount;
  if (suspendPropagatingEdgeInsetsCount)
  {
    unint64_t v4 = suspendPropagatingEdgeInsetsCount - 1;
    self->_unint64_t suspendPropagatingEdgeInsetsCount = v4;
    if (!v4)
    {
      [(MKMapView *)self _edgeInsets];
      *(float *)&double v5 = v5;
      *(float *)&double v6 = v6;
      *(float *)&double v7 = v7;
      mapView = self->_mapView;
      *(float *)&double v9 = v9;
      -[VKMapView setEdgeInsets:](mapView, "setEdgeInsets:", v5, v6, v7, v9);
    }
  }
}

- (void)_setCompassViewSize:(int64_t)a3 style:(int64_t)a4
{
  if (self->_compassViewSize != a3 || self->_compassViewStyle != a4)
  {
    self->_compassViewSize = a3;
    self->_compassViewStyle = a4;
    compassView = self->_compassView;
    if (compassView) {
      -[MKCompassView setCompassViewSize:style:](compassView, "setCompassViewSize:style:");
    }
    [(MKMapView *)self _updateCompassVisibility];
  }
}

- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4
{
  id v6 = a3;
  char v7 = *((unsigned char *)&self->_flags + 8);
  uint64_t flags = (uint64_t)self->_flags;
  if (a4 == 1 || !(a4 | *(void *)&self->_flags & 0x20))
  {
    *(void *)&self->_uint64_t flags = flags | 0x20;
    *((unsigned char *)&self->_flags + 8) = v7;
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v11 = self->_unsafeDelegate;
    }
    else
    {
      double v11 = [(MKMapView *)self _safeDelegate];
    }
    long long v12 = v11;
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        long long v14 = self->_unsafeDelegate;
      }
      else
      {
        long long v14 = [(MKMapView *)self _safeDelegate];
      }
      double v18 = v14;
      [(MKMapViewDelegate *)v14 mapViewWillStartRenderingMap:self];
    }
  }
  else if (a4 - 2 <= 2)
  {
    if ((flags & 0x10) == 0)
    {
      *(void *)&self->_uint64_t flags = flags | 0x10;
      *((unsigned char *)&self->_flags + 8) = v7;
      [(MKBasicMapView *)self->_basicMapView setHasRenderedSomething:1];
      double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MKMapViewDidFinishInitialRenderNotification" object:self];

      [(MKMapView *)self _updateShouldDisplayEffects];
    }
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v10 = self->_unsafeDelegate;
    }
    else
    {
      double v10 = [(MKMapView *)self _safeDelegate];
    }
    int v15 = v10;
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        __int16 v17 = self->_unsafeDelegate;
      }
      else
      {
        __int16 v17 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v19 = v17;
      [(MKMapViewDelegate *)v17 mapViewDidFinishRenderingMap:self fullyRendered:a4 < 3];

      CGRect v20 = MKGetMKMapViewLog();
      BOOL v21 = v20;
      os_signpost_id_t mapViewDidFinishRenderingSignpostID = self->_mapViewDidFinishRenderingSignpostID;
      if (mapViewDidFinishRenderingSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)double v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v21, OS_SIGNPOST_EVENT, mapViewDidFinishRenderingSignpostID, "mapViewDidFinishRenderingMapFullyRendered", (const char *)&unk_18BD3917F, v24, 2u);
      }
    }
    *(void *)&self->_flags &= ~0x20uLL;
    uint64_t v23 = [MEMORY[0x1E4F647B8] sharedNoCreate];
    if (v23) {
      [v23 mapView:self viewPortUpdated:a4 == 3 showingGrid:-[MKMapView _geoCoordinateRegionForOffline](self)];
    }
  }
}

- (void)_setCanSelectPOIs:(BOOL)a3
{
  BOOL v3 = a3;
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = 0;

  [(VKMapView *)self->_mapView setLabelSelectionFilter:0];
  unint64_t flags = (unint64_t)self->_flags;
  uint64_t v7 = 0x2000000000;
  if (!v3) {
    uint64_t v7 = 0;
  }
  *(void *)&self->_unint64_t flags = flags & 0xFFFFFFDFFFFFFFFFLL | v7;
  mapView = self->_mapView;

  [(VKMapView *)mapView setLabelMarkerSelectionEnabled:v3 | (flags >> 38) & 1];
}

- (void)_clearRouteContext
{
  routeContext = self->_routeContext;
  if (routeContext)
  {
    self->_routeContext = 0;

    unint64_t v4 = self->_mapView;
    [(VKMapView *)v4 setRouteContext:0];
    [(VKMapView *)v4 setRouteLineSplitAnnotation:0];
  }
}

- (void)setDelegate:(id)delegate
{
  unint64_t v4 = (MKMapView **)self;
  if (self)
  {
    if (qword_1EB316210 != -1) {
      dispatch_once(&qword_1EB316210, &__block_literal_global_18_0);
    }
    if (_MergedGlobals_174) {
      self = v4[66];
    }
    else {
      self = (MKMapView *)[v4 _safeDelegate];
    }
  }
  if (self != delegate)
  {
    if (qword_1EB316210 != -1) {
      dispatch_once(&qword_1EB316210, &__block_literal_global_18_0);
    }
    if (_MergedGlobals_174) {
      v4[66] = (MKMapView *)delegate;
    }
    else {
      [v4 _setSafeDelegate:delegate];
    }
    char v5 = objc_opt_respondsToSelector();
    id v6 = v4 + 124;
    uint64_t v7 = 0x1000000000000000;
    if ((v5 & 1) == 0) {
      uint64_t v7 = 0;
    }
    __CFString *v6 = (MKMapView *)((unint64_t)*v6 & 0xEFFFFFFFFFFFFFFFLL | v7);
    char v8 = objc_opt_respondsToSelector();
    uint64_t v9 = 0x2000000000000000;
    if ((v8 & 1) == 0) {
      uint64_t v9 = 0;
    }
    __CFString *v6 = (MKMapView *)((unint64_t)*v6 & 0xDFFFFFFFFFFFFFFFLL | v9);
    char v10 = objc_opt_respondsToSelector();
    uint64_t v11 = 0x4000000000000000;
    if ((v10 & 1) == 0) {
      uint64_t v11 = 0;
    }
    __CFString *v6 = (MKMapView *)((unint64_t)*v6 & 0xBFFFFFFFFFFFFFFFLL | v11);
    char v12 = objc_opt_respondsToSelector();
    unint64_t v13 = 0x8000000000000000;
    if ((v12 & 1) == 0) {
      unint64_t v13 = 0;
    }
    __CFString *v6 = (MKMapView *)(v13 & 0x8000000000000000 | (unint64_t)*v6 & 0x7FFFFFFFFFFFFFFFLL);
    *((unsigned char *)v6 + 8) = (_BYTE)v6[1] & 0xFE | ((objc_opt_respondsToSelector() & 1) != 0);
    if (objc_opt_respondsToSelector()) {
      char v14 = 2;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)v6 + 8) = (_BYTE)v6[1] & 0xFD | v14;
  }
}

- (void)_setSafeDelegate:(id)a3
{
}

- (void)setAttributionCorner:(int)a3
{
  if (a3 == 4 || a3 == 8)
  {
    self->_int attributionCorner = a3;
    [(MKMapView *)self _layoutAttribution];
  }
  else
  {
    BOOL v3 = MKGetMKMapViewLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "On iOS, only BottomLeft and BottomRight are supported locations for attribution.", v4, 2u);
    }
  }
}

- (id)_initWithFrame:(CGRect)a3 gestureRecognizerHostView:(id)a4 showsAttribution:(BOOL)a5 showsAppleLogo:(BOOL)a6 allowsAntialiasing:(BOOL)a7 carDisplayType:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v29.receiver = self;
    v29.super_class = (Class)MKMapView;
    uint64_t v19 = -[MKMapView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
    CGRect v20 = v19;
    if (v19) {
      id v21 = [(MKMapView *)v19 _commonInitFromIB:0 gestureRecognizerHostView:v18 locationManager:0 showsAttribution:v11 showsAppleLogo:v10 allowsAntialiasing:v9 carDisplayType:a8];
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C4A8];
    double v24 = NSString;
    double v25 = self;
    id v26 = NSStringFromSelector(a2);
    id v27 = [v24 stringWithFormat:@"%@ %@", v25, v26];

    [v22 raise:v23, @"%@: MKMapView must be initialized on the main thread.", v27 format];
    CGRect v20 = 0;
  }

  return v20;
}

- (void)mapLayer:(id)a3 canShowFlyoverDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:!a4];
  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    id v6 = self->_unsafeDelegate;
  }
  else
  {
    id v6 = [(MKMapView *)self _safeDelegate];
  }
  uint64_t v7 = v6;
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v9 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v9 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v10 = v9;
    [(MKMapViewDelegate *)v9 mapView:self canShowFlyoverDidChange:v4];
  }
}

- (id)_controlStackView
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  controlStackView = self->_controlStackView;
  if (!controlStackView)
  {
    BOOL v4 = objc_alloc_init(MKPassThroughStackView);
    char v5 = self->_controlStackView;
    self->_controlStackView = &v4->super;

    [(UIStackView *)self->_controlStackView setAlignment:3];
    [(UIStackView *)self->_controlStackView setAxis:1];
    [(UIStackView *)self->_controlStackView setSpacing:10.0];
    [(UIStackView *)self->_controlStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_controlStackView setDistribution:3];
    [(MKMapView *)self addSubview:self->_controlStackView];
    id v6 = [(UIStackView *)self->_controlStackView trailingAnchor];
    uint64_t v7 = [(MKMapView *)self trailingAnchor];
    char v8 = [v6 constraintEqualToAnchor:v7 constant:-11.0];
    controlStackHorizontalPositionConstraint = self->_controlStackHorizontalPositionConstraint;
    self->_controlStackHorizontalPositionConstraint = v8;

    BOOL v10 = [(UIStackView *)self->_controlStackView topAnchor];
    BOOL v11 = [(MKMapView *)self topAnchor];
    char v12 = [v10 constraintEqualToAnchor:v11 constant:11.0];
    controlStackVerticalPositionConstraint = self->_controlStackVerticalPositionConstraint;
    self->_controlStackVerticalPositionConstraint = v12;

    char v14 = [(UIStackView *)self->_controlStackView widthAnchor];
    int v15 = [v14 constraintEqualToConstant:MKCompassViewDiameterForSize(self->_compassViewSize)];
    controlStackWidthConstraint = self->_controlStackWidthConstraint;
    self->_controlStackWidthConstraint = v15;

    __int16 v17 = (void *)MEMORY[0x1E4F28DC8];
    id v18 = self->_controlStackVerticalPositionConstraint;
    v24[0] = self->_controlStackHorizontalPositionConstraint;
    v24[1] = v18;
    v24[2] = self->_controlStackWidthConstraint;
    uint64_t v19 = [(UIStackView *)self->_controlStackView bottomAnchor];
    CGRect v20 = [(MKMapView *)self bottomAnchor];
    id v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
    v24[3] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v22];

    controlStackView = self->_controlStackView;
  }

  return controlStackView;
}

void __44__MKMapView__forceManifestUpdateIfNecessary__block_invoke()
{
  if ((GEOConfigGetBOOL() & 1) != 0
    || ([MEMORY[0x1E4F28B50] mainBundle],
        id v0 = objc_claimAutoreleasedReturnValue(),
        [v0 bundleIdentifier],
        id v1 = objc_claimAutoreleasedReturnValue(),
        int v2 = [v1 isEqualToString:@"com.apple.Maps"],
        v1,
        v0,
        v2)
    && GEOConfigGetBOOL())
  {
    BOOL v3 = dispatch_get_global_queue(17, 0);
    dispatch_async(v3, &__block_literal_global_243);
  }
}

- (void)_setShowsCurrentEnvironmentName:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x800000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v5 = 0x800000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFF7FFFFFFFFFFFLL | v5;
    if (a3)
    {
      id v6 = [_MKEnvironmentLabel alloc];
      uint64_t v7 = -[_MKEnvironmentLabel initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      debugCurrentEnvironmentLabel = self->_debugCurrentEnvironmentLabel;
      self->_debugCurrentEnvironmentLabel = v7;

      [(UIView *)self->_contentView addSubview:self->_debugCurrentEnvironmentLabel];
      [(MKMapView *)self _updateEnvironmentLabelText];
    }
    else
    {
      [(_MKEnvironmentLabel *)self->_debugCurrentEnvironmentLabel removeFromSuperview];
      BOOL v9 = self->_debugCurrentEnvironmentLabel;
      self->_debugCurrentEnvironmentLabel = 0;
    }
  }
}

- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    if (!self)
    {
      uint64_t v5 = 0;
      char v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    self->_cachedLookAroundAvailabilitdouble y = a3;
  }
  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    BOOL v4 = self->_unsafeDelegate;
  }
  else
  {
    BOOL v4 = [(MKMapView *)self _safeDelegate];
  }
  uint64_t v5 = v4;
  char v6 = 0;
LABEL_10:
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (v6)
    {
      char v8 = 0;
    }
    else
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        BOOL v9 = self->_unsafeDelegate;
      }
      else
      {
        BOOL v9 = [(MKMapView *)self _safeDelegate];
      }
      char v8 = v9;
    }
    [(MKMapViewDelegate *)v8 mapView:self didChangeLookAroundAvailability:self->_cachedLookAroundAvailability];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"MKMapViewDidChangeLookAroundAvailabilityNotification" object:self];
}

- (BOOL)_useBalloonCalloutsForLabels
{
  return 1;
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 edgeInsets:(CGSize)a5 region:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  double height = a5.height;
  double width = a5.width;
  unint64_t v11 = +[MKMapView minZoomLevelForMapType:a4 viewSize:a7];
  char v12 = +[MKSystemController sharedInstance];
  if ([v12 supports3DMaps])
  {
    uint64_t v13 = 0;
  }
  else
  {
    char v14 = [MEMORY[0x1E4FB3A58] sharedPlatform];
    uint64_t v13 = [v14 supportsHiResRTT] ^ 1;
  }
  return +[MKMapView _regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:", a4, v13, width, height, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), *(void *)&top, *(void *)&left, *(void *)&bottom, *(void *)&right, v19, v20, v21, v22, (double)v11,
           0x4035000000000000);
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 region:(CGSize)a5
{
  return ($DC1C8D958DDC8D67D0023B74A9319680 *)objc_msgSend(a2, "regionThatFitsMapType:viewSize:edgeInsets:region:", a4, a6, a5.width, a5.height, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), v6, v7, v8, v9);
}

+ (void)setRendersInBackgroundByDefault:(BOOL)a3
{
  _MergedGlobals_53 = a3;
}

void __139__MKMapView__commonInitFromIB_gestureRecognizerHostView_locationManager_showsAttribution_showsAppleLogo_allowsAntialiasing_carDisplayType___block_invoke_207(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateAppearanceIfNeeded];
    id WeakRetained = v2;
  }
}

- (id)_initWithFrame:(CGRect)a3 allowsAntialiasing:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v20.receiver = self;
    v20.super_class = (Class)MKMapView;
    unint64_t v11 = -[MKMapView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
    if (v11) {
      id v12 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v11, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo"), v4, 0);
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C4A8];
    int v15 = NSString;
    char v16 = self;
    __int16 v17 = NSStringFromSelector(a2);
    id v18 = [v15 stringWithFormat:@"%@ %@", v16, v17];

    [v13 raise:v14, @"%@: MKMapView must be initialized on the main thread.", v18 format];
    return 0;
  }
  return v11;
}

- (MKMapView)initWithFrame:(CGRect)a3
{
  return (MKMapView *)-[MKMapView _initWithFrame:allowsAntialiasing:](self, "_initWithFrame:allowsAntialiasing:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C4A8];
    char v16 = NSString;
    __int16 v17 = self;
    id v18 = NSStringFromSelector(a2);
    uint64_t v19 = [v16 stringWithFormat:@"%@ %@", v17, v18];

    [v14 raise:v15, @"%@: MKMapView must be initialized on the main thread.", v19 format];
    objc_super v20 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v23.receiver = self;
  v23.super_class = (Class)MKMapView;
  unint64_t v11 = -[MKMapView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    id v12 = v11;
    if (v10) {
      uint64_t v13 = [[MKLocationManager alloc] initWithCLLocationManager:v10];
    }
    else {
      uint64_t v13 = 0;
    }
    id v21 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v12, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, v13, 1, objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo"), 1, 0);
    __int16 v17 = v12;

    objc_super v20 = v17;
    goto LABEL_9;
  }
  objc_super v20 = 0;
LABEL_10:

  return v20;
}

- (id)initFromIBWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (initFromIBWithFrame__onceToken != -1) {
      dispatch_once(&initFromIBWithFrame__onceToken, &__block_literal_global_220);
    }
    v18.receiver = self;
    v18.super_class = (Class)MKMapView;
    uint64_t v9 = -[MKMapView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
    if (v9) {
      id v10 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v9, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 1, 0, 0, 1, objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo"), 1, 0);
    }
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C4A8];
    uint64_t v13 = NSString;
    uint64_t v14 = self;
    uint64_t v15 = NSStringFromSelector(a2);
    char v16 = [v13 stringWithFormat:@"%@ %@", v14, v15];

    [v11 raise:v12, @"%@: MKMapView must be initialized on the main thread.", v16 format];
    return 0;
  }
  return v9;
}

uint64_t __33__MKMapView_initFromIBWithFrame___block_invoke()
{
  GEODefaultsDisableServer();
  GEONetworkDefaultsDisableServerConnection();
  [MEMORY[0x1E4F64500] disableServerConnection];
  [MEMORY[0x1E4F64918] disableServerConnection];
  id v0 = (void *)MEMORY[0x1E4F64AC8];

  return [v0 useLocalLoader];
}

- (MKMapView)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C4A8];
    uint64_t v12 = NSString;
    uint64_t v13 = self;
    uint64_t v14 = NSStringFromSelector(a2);
    uint64_t v15 = [v12 stringWithFormat:@"%@ %@", v13, v14];

    [v10 raise:v11, @"%@: MKMapView must be initialized on the main thread.", v15 format];
    uint64_t v6 = 0;
    goto LABEL_39;
  }
  v20.receiver = self;
  v20.super_class = (Class)MKMapView;
  uint64_t v6 = [(MKMapView *)&v20 initWithCoder:v5];
  if (v6)
  {
    id v7 = -[MKMapView _commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:](v6, "_commonInitFromIB:gestureRecognizerHostView:locationManager:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo"), 1, 0);
    if ([v5 containsValueForKey:@"MKZoomEnabled"]) {
      -[MKMapView setZoomEnabled:](v6, "setZoomEnabled:", [v5 decodeBoolForKey:@"MKZoomEnabled"]);
    }
    if ([v5 containsValueForKey:@"MKScrollEnabled"]) {
      -[MKMapView setScrollEnabled:](v6, "setScrollEnabled:", [v5 decodeBoolForKey:@"MKScrollEnabled"]);
    }
    if ([v5 containsValueForKey:@"MKShowsUserLocation"]) {
      -[MKMapView setShowsUserLocation:](v6, "setShowsUserLocation:", [v5 decodeBoolForKey:@"MKShowsUserLocation"]);
    }
    if ([v5 containsValueForKey:@"MKDelegate"])
    {
      uint64_t v8 = [v5 decodeObjectForKey:@"MKDelegate"];
      [(MKMapView *)v6 setDelegate:v8];
    }
    if ([v5 containsValueForKey:@"MKPitchButtonVisibility"]) {
      -[MKMapView setPitchButtonVisibility:](v6, "setPitchButtonVisibility:", [v5 decodeIntegerForKey:@"MKPitchButtonVisibility"]);
    }
    if ([v5 containsValueForKey:@"MKPitchEnabled"]) {
      -[MKMapView setPitchEnabled:](v6, "setPitchEnabled:", [v5 decodeBoolForKey:@"MKPitchEnabled"]);
    }
    if ([v5 containsValueForKey:@"MKRotateEnabled"]) {
      -[MKMapView setRotateEnabled:](v6, "setRotateEnabled:", [v5 decodeBoolForKey:@"MKRotateEnabled"]);
    }
    if ([v5 containsValueForKey:@"MKPreferredConfiguration"])
    {
      uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MKPreferredConfiguration"];
      [(MKMapView *)v6 setPreferredConfiguration:v9];
      goto LABEL_32;
    }
    if ([v5 containsValueForKey:@"MKMapType"]) {
      -[MKMapView setMapType:](v6, "setMapType:", [v5 decodeIntegerForKey:@"MKMapType"]);
    }
    if ([v5 containsValueForKey:@"MKPointOfInterestFilter"])
    {
      uint64_t v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MKPointOfInterestFilter"];
    }
    else
    {
      if (![v5 containsValueForKey:@"MKShowsPointsOfInterest"]
        || ([v5 decodeBoolForKey:@"MKShowsPointsOfInterest"] & 1) != 0)
      {
        goto LABEL_28;
      }
      uint64_t v16 = +[MKPointOfInterestFilter filterExcludingAllCategories];
    }
    __int16 v17 = (void *)v16;
    [(MKMapConfiguration *)v6->_preferredConfiguration set_pointOfInterestFilter:v16];

LABEL_28:
    if ([v5 containsValueForKey:@"MKShowsBuildings"]) {
      -[MKMapView setShowsBuildings:](v6, "setShowsBuildings:", [v5 decodeBoolForKey:@"MKShowsBuildings"]);
    }
    if (![v5 containsValueForKey:@"MKShowsTraffic"]) {
      goto LABEL_33;
    }
    uint64_t v18 = [v5 decodeBoolForKey:@"MKShowsTraffic"];
    uint64_t v9 = [(MKMapView *)v6 preferredConfiguration];
    objc_msgSend(v9, "set_showsTraffic:", v18);
LABEL_32:

LABEL_33:
    if ([v5 containsValueForKey:@"MKShowsCompass"]) {
      -[MKMapView setShowsCompass:](v6, "setShowsCompass:", [v5 decodeBoolForKey:@"MKShowsCompass"]);
    }
    if ([v5 containsValueForKey:@"MKShowsScaleKey"]) {
      -[MKMapView setShowsScale:](v6, "setShowsScale:", [v5 decodeBoolForKey:@"MKShowsScaleKey"]);
    }
    if ([v5 containsValueForKey:@"MKShowsUserTrackingButton"]) {
      -[MKMapView setShowsUserTrackingButton:](v6, "setShowsUserTrackingButton:", [v5 decodeBoolForKey:@"MKShowsUserTrackingButton"]);
    }
  }
LABEL_39:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MKMapView;
  id v4 = a3;
  [(MKMapView *)&v9 encodeWithCoder:v4];
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v5 = self->_unsafeDelegate;
    }
    else
    {
      id v5 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, @"MKDelegate", v9.receiver, v9.super_class);

  objc_msgSend(v4, "encodeInteger:forKey:", (int)-[MKMapView mapType](self, "mapType"), @"MKMapType");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isZoomEnabled](self, "isZoomEnabled"), @"MKZoomEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isScrollEnabled](self, "isScrollEnabled"), @"MKScrollEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsUserLocation](self, "showsUserLocation"), @"MKShowsUserLocation");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKMapView pitchButtonVisibility](self, "pitchButtonVisibility"), @"MKPitchButtonVisibility");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isPitchEnabled](self, "isPitchEnabled"), @"MKPitchEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView isRotateEnabled](self, "isRotateEnabled"), @"MKRotateEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsBuildings](self, "showsBuildings"), @"MKShowsBuildings");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsTraffic](self, "showsTraffic"), @"MKShowsTraffic");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsCompass](self, "showsCompass"), @"MKShowsCompass");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsScale](self, "showsScale"), @"MKShowsScaleKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView showsUserTrackingButton](self, "showsUserTrackingButton"), @"MKShowsUserTrackingButton");
  objc_msgSend(v4, "encodeBool:forKey:", -[MKMapView _showsPointsOfInterest](self, "_showsPointsOfInterest"), @"MKShowsPointsOfInterest");
  id v7 = [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
  [v4 encodeObject:v7 forKey:@"MKPointOfInterestFilter"];

  uint64_t v8 = [(MKMapView *)self preferredConfiguration];
  [v4 encodeObject:v8 forKey:@"MKPreferredConfiguration"];
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  internal = self->_internal;
  if (internal) {
    objc_storeWeak((id *)&internal->view, 0);
  }
  MapsFeature_RemoveBlockListener();
  [(VKMapView *)self->_mapView setCameraDelegate:0];
  [(VKMapView *)self->_mapView setMapDelegate:0];
  [(MKLocationManager *)self->_locationManager stopHeadingUpdateWithObserver:self];
  [(MKLocationManager *)self->_locationManager stopLocationUpdateWithObserver:self];
  id v4 = [MEMORY[0x1E4F64918] modernManager];
  [v4 removeTileGroupObserver:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(UITapGestureRecognizer *)self->_selectingTapGestureRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_nonselectingTapGestureRecognizer setDelegate:0];
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
  [(MKAnnotationManager *)self->_annotationManager setDelegate:0];
  [(MKAnnotationManager *)self->_annotationManager setContainer:0];
  annotationContainer = self->_annotationContainer;
  if (annotationContainer->_selectedAnnotationView)
  {
    [(MKAnnotationView *)annotationContainer->_selectedAnnotationView _setSelected:0 animated:0];
    annotationContainer = self->_annotationContainer;
  }
  [(MKAnnotationContainerView *)annotationContainer setDelegate:0];
  [(MKOverlayContainerView *)self->_overlayContainer setDelegate:0];
  [(MKMapGestureController *)self->_gestureController setDelegate:0];
  [(MKMapView *)self set_startEffectsTimer:0];
  [(MKMapCamera *)self->_camera _setMapView:0];
  [(MKMapView *)self _clearLayoutGuides];
  [(MKMapView *)self _unregisterConfigurationObservers];
  v7.receiver = self;
  v7.super_class = (Class)MKMapView;
  [(MKMapView *)&v7 dealloc];
}

- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection:", buf, 2u);
  }

  objc_super v7 = [(MKMapView *)self traitCollection];
  [(MKMapGestureController *)self->_gestureController _setTraitCollection:v7];
  uint64_t v8 = [(MKMapView *)self traitCollection];
  objc_super v9 = [v8 preferredContentSizeCategory];
  id v10 = [v5 preferredContentSizeCategory];
  char v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    mapView = self->_mapView;
    uint64_t v13 = [(MKMapView *)self traitCollection];
    uint64_t v14 = [v13 preferredContentSizeCategory];
    [(VKMapView *)mapView _mapkit_configureLabelSizesForContentSizeCategory:v14];
  }
  uint64_t v15 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(MKMapView *)self traitCollection];
    unint64_t v17 = [v16 userInterfaceStyle];
    if (v17 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<Unknown %ld>", v17);
      uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v18 = off_1E54B8CD0[v17];
    }
    *(_DWORD *)buf = 138412290;
    double v31 = v18;
    _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection: self.traitCollection.userInterfaceStyle : %@", buf, 0xCu);
  }
  uint64_t v19 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unint64_t v20 = [v5 userInterfaceStyle];
    if (v20 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<Unknown %ld>", v20);
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = off_1E54B8CD0[v20];
    }
    *(_DWORD *)buf = 138412290;
    double v31 = v21;
    _os_log_impl(&dword_18BAEC000, v19, OS_LOG_TYPE_INFO, "MKMapView: _traitEnvironment:didChangeTraitCollection: previousTraitCollection.userInterfaceStyle : %@", buf, 0xCu);
  }
  uint64_t v22 = [(MKMapView *)self traitCollection];
  uint64_t v23 = [v22 userInterfaceStyle];
  uint64_t v24 = [v5 userInterfaceStyle];

  if (v23 != v24) {
    [(MKMapView *)self _updateAppearanceIfNeeded];
  }
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  if (lastEffectiveTraitCollectionIsolationQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MKMapView__traitEnvironment_didChangeTraitCollection___block_invoke;
    block[3] = &unk_1E54B8248;
    block[4] = self;
    id v29 = v7;
    dispatch_sync(lastEffectiveTraitCollectionIsolationQueue, block);
    id v26 = [(MKMapView *)self traitCollection];
    int v27 = [v26 hasDifferentColorAppearanceComparedToTraitCollection:v5];

    if (v27) {
      [(MKMapView *)self _invalidateAllOverlayRendererColors];
    }
  }
}

void __56__MKMapView__traitEnvironment_didChangeTraitCollection___block_invoke(uint64_t a1)
{
}

- (void)_withEffectiveTraitCollection:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  lastEffectiveTraitCollectionIsolationQueue = self->_lastEffectiveTraitCollectionIsolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MKMapView__withEffectiveTraitCollection___block_invoke;
  _OWORD v7[3] = &unk_1E54B8200;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(lastEffectiveTraitCollectionIsolationQueue, v7);
  uint64_t v6 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v9[5]];
  v4[2](v4);
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v6];

  _Block_object_dispose(&v8, 8);
}

void __43__MKMapView__withEffectiveTraitCollection___block_invoke(uint64_t a1)
{
}

- (BOOL)showsAttribution
{
  return (*(void *)&self->_flags >> 25) & 1;
}

- (BOOL)_showsAppleLogo
{
  return (*(void *)&self->_flags >> 26) & 1;
}

- (void)setShowsAttribution:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3;
  [(MKMapView *)self _updateAttribution];
}

- (void)_setShowsAppleLogo:(BOOL)a3
{
}

- (void)_setShowsAppleLogo:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo");
  uint64_t v8 = 0x4000000;
  if (((v7 | v4) & v5) == 0) {
    uint64_t v8 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v8;

  [(MKMapView *)self _updateAppleLogoVisibility];
}

- (BOOL)canShowAttributionBadge
{
  return (*(void *)&self->_flags >> 27) & 1;
}

- (void)setCanShowAttributionBadge:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3;
  [(MKMapView *)self _updateAttribution];
}

- (BOOL)_isShowingAttributionBadge
{
  attributionBadgeView = self->_attributionBadgeView;
  if (!attributionBadgeView) {
    return 0;
  }
  uint64_t v3 = [(UIImageView *)attributionBadgeView superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CGRect)attributionBadgeBounds
{
  if ([(MKMapView *)self _isShowingAttributionBadge])
  {
    [(UIImageView *)self->_attributionBadgeView bounds];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_setAttributionLinkDisplayStyle:(int64_t)a3
{
  if (self->_attributionLinkDisplayStyle != a3)
  {
    self->_attributionLinkDisplayStyle = a3;
    attributionLabel = self->_attributionLabel;
    if (attributionLabel)
    {
      -[MKAttributionLabel setDisplayStyle:](attributionLabel, "setDisplayStyle:");
      [(MKAttributionLabel *)self->_attributionLabel sizeToFit];
      [(MKMapView *)self _layoutAttribution];
    }
  }
}

- (void)setCompassViewSize:(int64_t)a3
{
  if (self->_compassViewSize != a3)
  {
    self->_compassViewSize = a3;
    compassView = self->_compassView;
    if (compassView) {
      -[MKCompassView setCompassViewSize:](compassView, "setCompassViewSize:");
    }
    [(MKMapView *)self _updateCompassVisibility];
  }
}

- (void)_setCompassInsetEdges:(unint64_t)a3
{
  self->_compassInsetEdges = a3;
  self->_explicitCompassInsetEdges = 1;
  [(MKMapView *)self _updateControlsPosition:1];
  if (self->_scaleVisibility != 1)
  {
    [(MKMapView *)self _updateScalePosition];
  }
}

void __39__MKMapView__updateAppleLogoVisibility__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setOpacity:0.0];
}

uint64_t __39__MKMapView__updateAppleLogoVisibility__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);

  return [v2 _layoutAttribution];
}

- (CGRect)attributionFrame
{
  attributionLabel = self->_attributionLabel;
  if (attributionLabel)
  {
    [(MKAttributionLabel *)attributionLabel frame];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)urlForMapAttribution
{
  id v2 = [(VKMapView *)self->_mapView attributionsForCurrentRegion];
  double v3 = +[MKMapAttribution attributionUrlFromRegionalAttributions:v2];

  return v3;
}

- (id)mapAttributionWithStringAttributes:(id)a3
{
  return [(MKMapView *)self mapAttributionWithStringAttributes:a3 underlineText:1];
}

- (id)mapAttributionWithStringAttributes:(id)a3 allowMultiLine:(BOOL)a4
{
  return [(MKMapView *)self mapAttributionWithStringAttributes:a3 underlineText:1];
}

- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4 linkAttribution:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = [MKMapAttribution alloc];
  uint64_t v10 = [(VKMapView *)self->_mapView attributionsForCurrentRegion];
  [(MKMapView *)self _currentScreenScale];
  char v11 = -[MKMapAttribution initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:](v9, "initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:", v8, v10, v6, v5);

  return v11;
}

- (id)mapAttributionWithStringAttributes:(id)a3 underlineText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [MKMapAttribution alloc];
  id v8 = [(VKMapView *)self->_mapView attributionsForCurrentRegion];
  [(MKMapView *)self _currentScreenScale];
  objc_super v9 = -[MKMapAttribution initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:](v7, "initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:", v6, v8, v4, 0);

  return v9;
}

- (BOOL)_isVectorKitConsoleEnabled
{
  return (*(void *)&self->_flags >> 39) & 1;
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  [(MKMapView *)self _updateAppearanceIfNeeded];
  [(MKMapView *)self _updateAttribution];
  [(MKMapView *)self _updateEnvironmentLabelText];
  long long v4 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  v5[0] = *(_OWORD *)&self->_cartographicConfiguration.style;
  v5[1] = v4;
  void v5[2] = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  uint64_t v6 = *(void *)&self->_cartographicConfiguration.gridOnly;
  [(MKMapView *)self _setCartographicConfiguration:v5 onInit:0 animated:0];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  double var1 = a3.var1;
  unsigned int var0 = a3.var0;
  if (a3.var0 == MapKitConfig_VectorKitDebugConsoleEnabled && a3.var1 == off_1E91536F0) {
    [(MKMapView *)self _setVectorKitConsoleEnabled:GEOConfigGetBOOL()];
  }
  if (var0 == *MEMORY[0x1E4F7A070] && var1 == *(void **)(MEMORY[0x1E4F7A070] + 8))
  {
    mapView = self->_mapView;
    [(VKMapView *)mapView _mapkit_configureFromDefaults];
  }
  else if (var0 == MapKitConfig_MapTextSize && var1 == off_1E9153150)
  {
    uint64_t v10 = self->_mapView;
    id v12 = [(MKMapView *)self traitCollection];
    char v11 = [v12 preferredContentSizeCategory];
    [(VKMapView *)v10 _mapkit_configureLabelSizesForContentSizeCategory:v11];
  }
}

- (BOOL)showsTraffic
{
  return [(MKMapConfiguration *)self->_preferredConfiguration _showsTraffic];
}

- (void)_removeCustomFeatureDataSource:(id)a3
{
}

- (BOOL)_showsTrafficIncidents
{
  return [(VKMapView *)self->_mapView trafficIncidentsEnabled];
}

- (int64_t)_offlineRegionVisibility
{
  return [(_MKOfflineRegionsOverlayManager *)self->_offlineRegionsOverlayManager visibility];
}

- (void)_setOfflineRegionVisibility:(int64_t)a3
{
}

- (void)_offlineStateDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v4 = objc_msgSend(MEMORY[0x1E4F647B8], "sharedNoCreate", a3);
  BOOL v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 state];
    int v7 = v6;
    if (v6 >= 3u)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v10[0] = 67109120;
        v10[1] = v7;
        _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v10, 8u);
      }
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = (v6 & 7) == 2;
    }
    mapView = self->_mapView;
  }
  else
  {
    mapView = self->_mapView;
    BOOL v8 = 0;
  }
  [(VKMapView *)mapView setOfflineMode:v8];
}

- (void)_addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MKMapView *)self overlayContainer];
  [v10 addInternalOverlay:v9 level:a4 provider:v8];
}

- (BOOL)_localizeLabels
{
  return [(VKMapView *)self->_mapView localizeLabels];
}

- (void)_setLocalizeLabels:(BOOL)a3
{
}

- (BOOL)_showsPointsOfInterest
{
  id v2 = [(MKMapConfiguration *)self->_preferredConfiguration _pointOfInterestFilter];
  double v3 = v2;
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

- (BOOL)showsBuildings
{
  return (*(void *)&self->_flags >> 33) & 1;
}

- (void)setShowsBuildings:(BOOL)showsBuildings
{
  uint64_t v3 = showsBuildings;
  if (_MKLinkedOnOrAfterReleaseSet(3338) || GEOConfigGetBOOL())
  {
    if (self->_cartographicConfiguration.mapkitUsage == 2) {
      uint64_t v3 = v3;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  uint64_t v5 = 0x200000000;
  if (!v3) {
    uint64_t v5 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v5;
  mapView = self->_mapView;

  [(VKMapView *)mapView setShowsBuildings:v3];
}

- (BOOL)_showsRoadLabels
{
  return [(VKMapView *)self->_mapView showsRoadLabels];
}

- (void)_setShowsRoadLabels:(BOOL)a3
{
}

- (BOOL)_showsRoadShields
{
  return [(VKMapView *)self->_mapView showsRoadShields];
}

- (void)_setShowsRoadShields:(BOOL)a3
{
}

- (BOOL)_showsPointLabels
{
  return [(VKMapView *)self->_mapView showsPointLabels];
}

- (void)_setShowsPointLabels:(BOOL)a3
{
}

- (BOOL)_showsLabels
{
  return [(VKMapView *)self->_mapView showsLabels];
}

- (void)_setShowsLabels:(BOOL)a3
{
}

- (BOOL)_showsContourLabels
{
  return [(VKMapView *)self->_mapView showsContourLabels];
}

- (void)_setShowsCountourLabels:(BOOL)a3
{
}

- (BOOL)_showsPhysicalFeatureLabels
{
  return [(VKMapView *)self->_mapView showsPhysicalFeatureLabels];
}

- (void)_setShowsPhysicalFeatureLabels:(BOOL)a3
{
}

- (BOOL)_showsVenues
{
  return (*(void *)&self->_flags >> 28) & 1;
}

- (BOOL)isShowingNoDataPlaceholders
{
  return 0;
}

- (BOOL)showsLiveEVData
{
  return [(VKMapView *)self->_mapView showsLiveEVData];
}

- (void)setSupportedEVConnectorTypes:(id)a3
{
}

- (BOOL)_showsPressedLabelMarkerEffect
{
  return (*(void *)&self->_flags >> 53) & 1;
}

- (void)_setShowsPressedLabelMarkerEffect:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_isHandlingNonselectingTap
{
  id v2 = [(MKMapView *)self _nonselectingTapGestureRecognizer];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (BOOL)rendersInBackground
{
  return [(MKBasicMapView *)self->_basicMapView rendersInBackground];
}

- (void)setRendersInBackground:(BOOL)a3
{
}

- (BOOL)_isShowingFlyover
{
  return [(VKMapView *)self->_mapView isShowingFlyover];
}

- (void)setMapType:(MKMapType)mapType
{
  [(MKMapView *)self _setMapType:mapType animated:1];
  if (mapType)
  {
    usageCounter = self->_usageCounter;
    [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:7];
  }
}

- (void)_setMapType:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v4 = a3;
  if (a3 >= 3 && !_MKLinkedOnOrAfterReleaseSet(1026)) {
    unint64_t v4 = 0;
  }
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _MKCartographicConfigurationForMapType(v4, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  uint64_t v8 = v12;
  unsigned __int8 v6 = +[MKMapConfiguration _mapConfigurationWithCartographicConfiguration:v7];
  [v6 _setInternalStateFromMapConfiguration:self->_preferredConfiguration];
  [(MKMapView *)self setPreferredConfiguration:v6];
}

- (void)_setCartographicConfiguration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var4;
  uint64_t v5 = *(void *)&a3->var6;
  [(MKMapView *)self _setCartographicConfiguration:v4 animated:0];
}

- (void)setSelectableMapFeatures:(MKMapFeatureOptions)selectableMapFeatures
{
  uint64_t v5 = [(MKLabelSelectionFilter *)self->_labelSelectionFilter selectionHandler];
  if (v5)
  {
  }
  else if ([(MKLabelSelectionFilter *)self->_labelSelectionFilter mapFeatureOptions] == selectableMapFeatures)
  {
    return;
  }
  [(VKMapView *)self->_mapView setIsMKRenderingSelectionBalloon:selectableMapFeatures != 0];
  unsigned __int8 v6 = [[MKLabelSelectionFilter alloc] initWithMapFeatureOptions:selectableMapFeatures];
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = v6;

  uint64_t v8 = self->_labelSelectionFilter;
  mapView = self->_mapView;

  [(VKMapView *)mapView setLabelSelectionFilter:v8];
}

- (MKMapFeatureOptions)selectableMapFeatures
{
  return [(MKLabelSelectionFilter *)self->_labelSelectionFilter mapFeatureOptions];
}

- (void)_setLabelSelectionFilter:(id)a3
{
}

- (void)_setLabelSelectionFilter:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (([v8 isEqual:self->_labelSelectionFilter] & 1) == 0)
  {
    unsigned __int8 v6 = (MKLabelSelectionFilter *)[v8 copy];
    labelSelectionFilter = self->_labelSelectionFilter;
    self->_labelSelectionFilter = v6;

    [(MKLabelSelectionFilter *)self->_labelSelectionFilter setMapView:self];
    [(VKMapView *)self->_mapView setLabelSelectionFilter:self->_labelSelectionFilter];
    [(MKMapView *)self _deselectCurrentFeatureAnnotationIfNeededAnimated:v4];
  }
}

- (void)_deselectCurrentFeatureAnnotationIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(MKMapView *)self selectedAnnotations];
  if ([v8 count])
  {
    uint64_t v5 = [v8 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v7 = [v8 objectAtIndexedSubscript:0];
      if (![(MKLabelSelectionFilter *)self->_labelSelectionFilter isFeatureAnnotationSelectable:v7])[(MKMapView *)self deselectAnnotation:v7 animated:v3]; {
    }
      }
  }
}

- (MKMapConfiguration)configuration
{
  return self->_preferredConfiguration;
}

- (void)_updateCartographicConfiguration
{
}

- (void)_setMapDisplayStyle:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  unsigned __int8 v6 = MKGetMKMapViewLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "MKMapView: _setMapDisplayStyle %d", (uint8_t *)v8, 8u);
  }

  uint64_t v7 = v3 & 0xFFFFFFFFFFFFLL;
  [(VKMapView *)self->_mapView setMapDisplayStyle:v7 animated:v5];
  [(MKAnnotationContainerView *)self->_annotationContainer setMapDisplayStyle:v7];
}

- (BOOL)isSuspended
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (BOOL)_isInactive
{
  return [(MKBasicMapView *)self->_basicMapView inactive];
}

- (BOOL)isRegionChanging
{
  if ([(MKMapView *)self _isChangingRegionForGesture]) {
    LOBYTE(v3) = 1;
  }
  else {
    return *(_DWORD *)&self->_flags & 1;
  }
  return v3;
}

- (CGPoint)_centerPoint
{
  [(MKMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MKMapView *)self _edgeInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  v23.origin.double x = v12;
  v23.origin.double y = v14;
  v23.size.double width = v16;
  v23.size.double height = v18;
  CGFloat MidX = CGRectGetMidX(v23);
  v24.origin.double x = v12;
  v24.origin.double y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  double MidY = CGRectGetMidY(v24);
  double v21 = MidX;
  result.double y = MidY;
  result.double x = v21;
  return result;
}

- (double)_mapKitZoomLevelForVectorKitTileZoomLevel:(double)a3
{
  double v4 = [(MKMapView *)self vk_mapLayer];
  [v4 zoomLevelAdjustmentForTileSize:128];
  double v6 = v5 + a3;

  return v6;
}

- (BOOL)_canZoomIn
{
  return [(VKMapView *)self->_mapView canZoomInForTileSize:128];
}

- (BOOL)_canZoomOut
{
  return [(VKMapView *)self->_mapView canZoomOutForTileSize:128];
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKMapView *)self center];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)MKMapView;
  -[MKMapView setCenter:](&v11, sel_setCenter_, x, y);
  if (x != v7 || y != v9) {
    [(MKMapView *)self _updateInsetsWithForce:0];
  }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x2000) == 0) ^ scrollEnabled) & 1) == 0)
  {
    uint64_t v4 = 0x2000;
    if (!scrollEnabled) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFFDFFFLL | v4;
    [(MKMapView *)self _updateScrollingAndGestures];
  }
}

- (void)setZoomEnabled:(BOOL)zoomEnabled
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x100000) == 0) ^ zoomEnabled) & 1) == 0)
  {
    uint64_t v4 = 0x100000;
    if (!zoomEnabled) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFEFFFFFLL | v4;
    [(MKMapView *)self _updateScrollingAndGestures];
  }
}

- (void)setRotateEnabled:(BOOL)rotateEnabled
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((int)flags >= 0) ^ rotateEnabled) & 1) == 0)
  {
    uint64_t v4 = 0x80000000;
    if (!rotateEnabled) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFF7FFFFFFFLL | v4;
    [(MKMapView *)self _updateScrollingAndGestures];
  }
}

- (void)setPitchEnabled:(BOOL)pitchEnabled
{
  BOOL v3 = pitchEnabled;
  double v5 = +[MKSystemController sharedInstance];
  int v6 = [v5 supportsPitchAPI];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v3;
  }
  if (v7)
  {
    p_uint64_t flags = &self->_flags;
    if ((((*(void *)&self->_flags & 0x100000000) == 0) ^ v3)) {
      return;
    }
    BOOL v9 = [(MKMapView *)self _canEnter3DMode];
    uint64_t v10 = 0x100000000;
    if (!v3) {
      uint64_t v10 = 0;
    }
    goto LABEL_14;
  }
  if (qword_1E9153FE8 != -1) {
    dispatch_once(&qword_1E9153FE8, &__block_literal_global_279);
  }
  p_uint64_t flags = &self->_flags;
  if ((*(void *)&self->_flags & 0x100000000) != 0)
  {
    BOOL v9 = [(MKMapView *)self _canEnter3DMode];
    uint64_t v10 = 0;
LABEL_14:
    char v11 = *((unsigned char *)p_flags + 8);
    *(void *)p_uint64_t flags = *(void *)p_flags & 0xFFFFFFFEFFFFFFFFLL | v10;
    *((unsigned char *)p_flags + 8) = v11;
    [(MKMapView *)self _updateScrollingAndGestures];
    BOOL v12 = [(MKMapView *)self _canEnter3DMode];
    if (v9 != v12)
    {
      BOOL v13 = v12;
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        CGFloat v14 = self->_unsafeDelegate;
      }
      else
      {
        CGFloat v14 = [(MKMapView *)self _safeDelegate];
      }
      double v15 = v14;
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          double v17 = self->_unsafeDelegate;
        }
        else
        {
          double v17 = [(MKMapView *)self _safeDelegate];
        }
        CGFloat v18 = v17;
        [(MKMapViewDelegate *)v17 mapView:self canEnter3DModeDidChange:v13];
      }
    }
  }
}

void __29__MKMapView_setPitchEnabled___block_invoke()
{
}

- (BOOL)_panWithMomentum
{
  return [(MKMapGestureController *)self->_gestureController panWithMomentum];
}

- (void)_setPanWithMomentum:(BOOL)a3
{
}

- (void)_setTracePlaybackSpeedMultiplier:(double)a3
{
  id v4 = [(VKMapView *)self->_mapView userLocationAnimator];
  [v4 setTracePlaybackSpeedMultiplier:a3];
}

- (BOOL)hasRenderedSomething
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (BOOL)canRotateForHeading
{
  LODWORD(v3) = [(MKLocationManager *)self->_locationManager isHeadingServicesAvailable];
  if (v3) {
    return (*(void *)&self->_flags >> 12) & 1;
  }
  return v3;
}

- (BOOL)isCurrentlyRotated
{
  BOOL v3 = [(MKMapView *)self canRotateForHeading];
  if (v3)
  {
    [(MKMapCamera *)self->_camera heading];
    LOBYTE(v3) = v4 != 0.0;
  }
  return v3;
}

- (void)setUserTrackingMode:(MKUserTrackingMode)userTrackingMode
{
}

- (void)setUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
  BOOL v4 = animated;
  if (mode == MKUserTrackingModeNone && self->_userTrackingMode == 2) {
    [(MKMapView *)self _snapToTrueNorthAndCallBack:0];
  }
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__MKMapView_setUserTrackingMode_animated___block_invoke;
    _OWORD v7[3] = &unk_1E54B8958;
    objc_copyWeak(v8, &location);
    v8[1] = (id)mode;
    [(MKMapView *)self _addDependentAuxiliaryBlock:v7];
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MKMapView *)self _setUserTrackingMode:mode animated:v4 fromTrackingButton:0];
  }
}

void __42__MKMapView_setUserTrackingMode_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setUserTrackingMode:*(void *)(a1 + 40) animated:0];
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int64_t v7 = a3;
  if (a3 == 2)
  {
    if ([(MKLocationManager *)self->_locationManager isHeadingServicesAvailable]
      && [(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation])
    {
      int64_t v7 = 2;
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  int64_t userTrackingMode = self->_userTrackingMode;
  if (v7 != userTrackingMode)
  {
    if (v7)
    {
      [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
      BOOL v10 = [(MKMapView *)self hasUserLocation];
    }
    else
    {
      BOOL v10 = 0;
    }
    [(VKMapView *)self->_mapView setStaysCenteredDuringPinch:v10];
    self->_int64_t userTrackingMode = v7;
    id v11 = [(MKMapView *)self userLocationView];
    objc_opt_class();
    BOOL v49 = v5;
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v13 = 0;
LABEL_16:

        [v13 setForcesConeIndicator:v7 == 2];
        id v14 = [(MKMapView *)self userLocationView];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v16 = 0;
LABEL_22:

            [v16 _setForceHeadingUp:v7 == 2];
            [(MKMapView *)self _updateShowHeadingIndicator];
            double v17 = (double *)MEMORY[0x1E4F1E6E0];
            if (!v7) {
              double v17 = (double *)MEMORY[0x1E4F1E6D8];
            }
            [(MKLocationManager *)self->_locationManager setDesiredAccuracy:*v17];
            if (!v7 || userTrackingMode)
            {
              if (!v7 && userTrackingMode)
              {
                uint64_t v19 = [(VKMapView *)self->_mapView userLocationAnimator];
                [v19 setBehavior:3];

                [(VKMapView *)self->_mapView setDisplayRate:self->_originalLoopRate];
                self->_preGesturingLoopRate = self->_originalLoopRate;
              }
            }
            else
            {
              CGFloat v18 = [(VKMapView *)self->_mapView userLocationAnimator];
              [v18 setBehavior:2];

              self->_originalLoopRate = [(VKMapView *)self->_mapView displayRate];
              [(VKMapView *)self->_mapView setDisplayRate:0];
            }
            double v20 = -1.0;
            if (v6 && objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
            {
              objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationDuration");
              double v20 = v21;
              uint64_t v22 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
              CGRect v23 = VKAnimationCurveForCAMediaTimingFunction();
            }
            else
            {
              CGRect v23 = 0;
            }
            if (v7 != 2 || userTrackingMode == 2)
            {
              if (!v7)
              {
                if (userTrackingMode) {
                  [(VKMapView *)self->_mapView stopTrackingAnnotation];
                }
                goto LABEL_54;
              }
            }
            else if ([(MKMapView *)self hasUserLocation])
            {
              mapView = self->_mapView;
              double v25 = [(MKMapView *)self userLocation];
              id v26 = mapView;
              int v27 = v25;
              uint64_t v28 = 1;
LABEL_49:
              [(VKMapView *)v26 startTrackingAnnotation:v27 trackHeading:v28 animated:v6 duration:v23 timingFunction:v20];

              goto LABEL_54;
            }
            BOOL v30 = v7 == 2 || userTrackingMode != 2;
            if ((!userTrackingMode || !v30) && [(MKMapView *)self hasUserLocation])
            {
              double v31 = self->_mapView;
              double v25 = [(MKMapView *)self userLocation];
              id v26 = v31;
              int v27 = v25;
              uint64_t v28 = 0;
              goto LABEL_49;
            }
            if (![(MKMapView *)self hasUserLocation]) {
              self->_userTrackingModeShouldAnimate = v6;
            }
LABEL_54:
            id v32 = [(MKMapView *)self userLocationView];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v33 = v32;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                double v34 = 0;
                goto LABEL_60;
              }
              id v33 = [v32 _mkUserLocationView];
            }
            double v34 = v33;
LABEL_60:

            [v34 setShouldDisplayInaccurateHeading:v7 == 2];
            char v35 = *((unsigned char *)&self->_flags + 8);
            if (v35)
            {
              if (qword_1E9154040 != -1) {
                dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
              }
              if (byte_1E9153FDC)
              {
                double v36 = self->_unsafeDelegate;
              }
              else
              {
                double v36 = [(MKMapView *)self _safeDelegate];
              }
              double v37 = v36;
              [(MKMapViewDelegate *)v36 mapView:self didChangeUserTrackingMode:self->_userTrackingMode animated:v6 fromTrackingButton:v49];

              char v35 = *((unsigned char *)&self->_flags + 8);
            }
            if ((v35 & 2) != 0)
            {
              double v38 = [(MKMapView *)self delegate];
              [v38 mapView:self didChangeUserTrackingMode:self->_userTrackingMode animated:v6];
            }
            long double v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v39 postNotificationName:@"MKMapViewUserTrackingModeDidChangeNotification" object:self];

            double v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v40 postNotificationName:@"MKUserTrackingViewModeDidChangeNotification" object:self];

            [(MKMapView *)self _updateIconsShouldAlignToPixels];
            if (self->_userTrackingMode)
            {
              if ((*(void *)&self->_flags & 0x80000) != 0)
              {
                locationManager = self->_locationManager;
                id v50 = 0;
                BOOL v42 = [(MKLocationManager *)locationManager isLocationServicesPossiblyAvailable:&v50];
                id v43 = v50;
                if (!v42)
                {
                  if (qword_1E9154040 != -1) {
                    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
                  }
                  if (byte_1E9153FDC)
                  {
                    char v44 = self->_unsafeDelegate;
                  }
                  else
                  {
                    char v44 = [(MKMapView *)self _safeDelegate];
                  }
                  MKMapPoint v45 = v44;
                  char v46 = objc_opt_respondsToSelector();

                  if (v46)
                  {
                    if (qword_1E9154040 != -1) {
                      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
                    }
                    if (byte_1E9153FDC)
                    {
                      CGRect v47 = self->_unsafeDelegate;
                    }
                    else
                    {
                      CGRect v47 = [(MKMapView *)self _safeDelegate];
                    }
                    CGRect v48 = v47;
                    [(MKMapViewDelegate *)v47 mapView:self didFailToLocateUserWithError:v43];
                  }
                }
              }
              else
              {
                [(MKMapView *)self setShowsUserLocation:1];
              }
            }

            return;
          }
          id v15 = [v14 _mkUserLocationView];
        }
        char v16 = v15;
        goto LABEL_22;
      }
      id v12 = [v11 _mkUserLocationView];
    }
    BOOL v13 = v12;
    goto LABEL_16;
  }
}

- (void)_setShowHeadingIndicatorForStepping:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x20000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFDFFFFLL | v4;
    [(MKMapView *)self _updateShowHeadingIndicator];
  }
}

- (id)_annotationAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4
{
  BOOL v4 = a4;
  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", self->_annotationContainer, a3.x, a3.y);
  BOOL v6 = -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", v4);
  int64_t v7 = v6;
  if (v6)
  {
    double v8 = [v6 annotation];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (BOOL)calloutViewContainsPoint:(CGPoint)a3
{
  -[MKAnnotationContainerView convertPoint:fromView:](self->_annotationContainer, "convertPoint:fromView:", self, a3.x, a3.y);
  annotationContainer = self->_annotationContainer;

  return [(MKAnnotationContainerView *)annotationContainer calloutContainsPoint:"calloutContainsPoint:"];
}

- (BOOL)accessoryViewContainsPoint:(CGPoint)a3
{
  -[MKAnnotationContainerView convertPoint:fromView:](self->_annotationContainer, "convertPoint:fromView:", self, a3.x, a3.y);
  annotationContainer = self->_annotationContainer;

  return -[MKAnnotationContainerView accessoryContainsPoint:](annotationContainer, "accessoryContainsPoint:");
}

- (void)_handleSelectionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(VKMapView *)self->_mapView enableDebugLabelHighlighting])
  {
    mapView = self->_mapView;
    -[VKMapView debugHighlightLabelAtPoint:](mapView, "debugHighlightLabelAtPoint:", x, y);
    return;
  }
  [(MKAttributionLabel *)self->_attributionLabel frame];
  v43.double x = x;
  v43.double y = y;
  if (!CGRectContainsPoint(v45, v43)
    && (([(UIImageView *)self->_attributionBadgeView frame], v44.double x = x,
                                                                     v44.double y = y,
                                                                     !CGRectContainsPoint(v46, v44))
     || !self->_attributionBadgeClickable)
    || ([(MKMapView *)self urlForMapAttribution], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", self->_annotationContainer, x, y);
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 1);
    id v14 = v13;
    if (v13)
    {
      [v13 _selectionPriority];
      if (v15 >= 250.0)
      {
        char v16 = 0;
        goto LABEL_24;
      }
    }
    char v16 = -[VKMapView labelMarkerForSelectionAtPoint:selectableLabelsOnly:](self->_mapView, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", (*(void *)&self->_flags & 0x4000000000) == 0, v10, v12);
    double v17 = [v16 featureAnnotation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      uint64_t v19 = [v18 annotationView];
      int v20 = [v19 isEnabled];

      if (v20)
      {
        uint64_t v21 = [v18 annotationView];

        id v14 = (void *)v21;
      }

LABEL_16:
      char v16 = 0;
      id v22 = 0;
      if (!v14) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
    if (!v16) {
      goto LABEL_31;
    }
    if ((*(void *)&self->_flags & 0x6000000000) != 0)
    {
      int v28 = 1;
      goto LABEL_32;
    }
    if (v17)
    {
      double v31 = [(_MKCustomFeatureStore *)self->_annotationsCustomFeatureStore allAnnotations];
      id v32 = [v16 featureAnnotation];
      int v28 = [v31 containsObject:v32];
    }
    else
    {
LABEL_31:
      int v28 = 0;
    }
LABEL_32:
    BOOL v33 = [(MKLabelSelectionFilter *)self->_labelSelectionFilter selectionEnabled];
    if (v16 && v33)
    {
      double v34 = [v16 featureAnnotation];
      if (v34)
      {

        if ((v28 & 1) == 0) {
          goto LABEL_16;
        }
      }
      else if ((([(MKLabelSelectionFilter *)self->_labelSelectionFilter isLabelSelectable:v16] | v28) & 1) == 0)
      {
        goto LABEL_16;
      }
    }
    else if (!v28)
    {
      goto LABEL_16;
    }
    if (v14 && v16)
    {

      goto LABEL_43;
    }

    if (!v14)
    {
      if (!v16)
      {
        id v22 = 0;
        goto LABEL_17;
      }
LABEL_43:
      id v41 = v16;
      if (([v41 isSelectable] & 1) != 0 || (*(void *)&self->_flags & 0x4000000000) != 0)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          char v35 = self->_unsafeDelegate;
        }
        else
        {
          char v35 = [(MKMapView *)self _safeDelegate];
        }
        double v36 = v35;
        char v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) == 0) {
          goto LABEL_62;
        }
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          double v38 = self->_unsafeDelegate;
        }
        else
        {
          double v38 = [(MKMapView *)self _safeDelegate];
        }
        long double v39 = v38;
        int v40 = [(MKMapViewDelegate *)v38 mapView:self shouldSelectLabelMarker:v41];

        if (v40)
        {
LABEL_62:
          if ([v41 selectionType] == 1) {
            -[MKMapView _startFlyoverTourAnimation:duration:completion:](self, "_startFlyoverTourAnimation:duration:completion:", [v41 animationID], 0, 0.0);
          }
          else {
            [(MKMapView *)self _selectLabelMarker:v41 animated:1];
          }
          id v14 = v41;
          goto LABEL_25;
        }
      }

      id v22 = v41;
LABEL_17:
      id v41 = v22;
      CGRect v23 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
      id v14 = v23;
      if (v23)
      {
        CGRect v24 = [v23 viewRepresentation];
        double v25 = v24;
        annotationManager = self->_annotationManager;
        if (v24)
        {
          int v27 = [v24 annotation];
          [(MKAnnotationManager *)annotationManager deselectAnnotation:v27 animated:1];
        }
        else
        {
          [(MKAnnotationManager *)annotationManager deselectAnnotation:v14 animated:1];
        }
      }
      goto LABEL_25;
    }
LABEL_24:
    id v29 = self->_annotationManager;
    BOOL v30 = [v14 annotation];
    [(MKAnnotationManager *)v29 selectAnnotation:v30 animated:1];

    id v41 = v16;
LABEL_25:

    goto LABEL_26;
  }
  id v41 = (id)v7;
  double v8 = +[MKSystemController sharedInstance];
  [v8 openURL:v41 completionHandler:0];

LABEL_26:
}

- (id)_debugConsoleAdditionalInfoProvider
{
  id v2 = (void *)MEMORY[0x18C139AE0](self->_debugConsoleAdditionalInfoProvider, a2);

  return v2;
}

- (MKDebugLocationConsole)_debugConsole
{
  return self->_debugLocationConsole;
}

- (void)_updateEnvironmentLabelText
{
  if ((*(void *)&self->_flags & 0x800000000000) != 0)
  {
    BOOL v3 = [MEMORY[0x1E4F64918] modernManager];
    id v8 = [v3 activeTileGroup];

    BOOL v4 = NSString;
    BOOL v5 = [v8 environment];
    BOOL v6 = [v4 stringWithFormat:@"%@ - %i", v5, objc_msgSend(v8, "identifier")];

    if ([(MKMapView *)self _isUsingDevResourceStyleSheet])
    {
      uint64_t v7 = [v6 stringByAppendingString:@"- DevResource Style Sheet"];

      BOOL v6 = (void *)v7;
    }
    [(_MKEnvironmentLabel *)self->_debugCurrentEnvironmentLabel setText:v6];
    [(_MKEnvironmentLabel *)self->_debugCurrentEnvironmentLabel sizeToFit];
    [(MKMapView *)self _currentEnvironmentNameFrame];
    -[_MKEnvironmentLabel setFrame:](self->_debugCurrentEnvironmentLabel, "setFrame:");
  }
}

- (BOOL)_isUsingDevResourceStyleSheet
{
  return [(VKMapView *)self->_mapView stylesheetIsDevResource];
}

- (BOOL)_showsCurrentEnvironmentName
{
  return (*(void *)&self->_flags >> 47) & 1;
}

- (CGRect)_currentEnvironmentLabelFrame
{
  [(_MKEnvironmentLabel *)self->_debugCurrentEnvironmentLabel frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)toggleLocationConsole:(id)a3
{
  if ([a3 state] == 3)
  {
    uint64_t v4 = [(MKMapView *)self isLocationConsoleEnabled] ^ 1;
    [(MKMapView *)self setLocationConsoleEnabled:v4];
  }
}

- (BOOL)_isAnimating
{
  return (~*(_DWORD *)&self->_flags & 0x801) == 0;
}

- (void)_willStartZoom:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 0x400000;
  if (a3) {
    uint64_t v5 = 6291456;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFF9FFFFFLL | v5;
  [(MKMapView *)self _showOrHideScaleIfNecessary:0];
  if (v3)
  {
    [(MKMapView *)self _updateIconsShouldAlignToPixels];
  }
}

- (void)_didEndZoom
{
  uint64_t flags = (uint64_t)self->_flags;
  *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFF9FFFFFLL;
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
  [(MKMapView *)self _showOrHideScaleIfNecessary:1];
  if ((flags & 0x200000) == 0) {
    return;
  }
  *(void *)&self->_flags &= ~0x400uLL;
  id v6 = [(MKMapView *)self userLocationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    id v4 = [v6 _mkUserLocationView];
  }
  uint64_t v5 = v4;
LABEL_8:

  [v5 setZoomDirection:0];
}

- (BOOL)_isZooming
{
  return (*(void *)&self->_flags >> 22) & 1;
}

- (BOOL)_isLocationPulseEnabled
{
  return (*(void *)&self->_flags >> 43) & 1;
}

- (BOOL)_shouldSplitRouteLine
{
  return (*(void *)&self->_flags >> 44) & 1;
}

- (void)_setShouldSplitRouteLine:(BOOL)a3
{
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  if (a3)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      uint64_t v5 = self->_unsafeDelegate;
    }
    else
    {
      uint64_t v5 = [(MKMapView *)self _safeDelegate];
    }
    id v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        uint64_t v7 = self->_unsafeDelegate;
      }
      else
      {
        uint64_t v7 = [(MKMapView *)self _safeDelegate];
      }
      id v8 = v7;
      double v9 = [(MKMapViewDelegate *)v7 mapViewCurrentRouteMatch:self];

      if (v9)
      {
        mapView = self->_mapView;
        id v13 = [(MKMapView *)self userLocationView];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          double v11 = [v13 _userLocationProxy];
        }
        else
        {
          double v11 = 0;
        }

        [(VKMapView *)mapView setRouteLineSplitAnnotation:v11];

        return;
      }
    }
    else
    {
    }
  }
  double v12 = self->_mapView;

  [(VKMapView *)v12 setRouteLineSplitAnnotation:0];
}

- (BOOL)_shouldAnimatePositionWithRouteMatch
{
  return (*(void *)&self->_flags >> 45) & 1;
}

- (void)_setShouldAnimatePositionWithRouteMatch:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)_shouldLoadFallbackTiles
{
  return (*(void *)&self->_flags >> 54) & 1;
}

- (void)_setShouldLoadFallbackTiles:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x40000000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x40000000000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFBFFFFFFFFFFFFFLL | v4;
    [(MKMapView *)self _updateFallbackTileLoading];
  }
}

- (void)_annotationViewDragStateChanged:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 userInfo];
  uint64_t v5 = [v4 objectForKey:@"oldValue"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v7 = [v4 objectForKey:@"newValue"];
  uint64_t v8 = [v7 integerValue];

  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v9 = self->_unsafeDelegate;
    }
    else
    {
      double v9 = [(MKMapView *)self _safeDelegate];
    }
    double v10 = v9;
  }
  else
  {
    double v10 = 0;
  }
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v12 = self->_unsafeDelegate;
      }
      else
      {
        double v12 = [(MKMapView *)self _safeDelegate];
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    id v14 = [v20 object];
    [(MKMapViewDelegate *)v13 mapView:self annotationView:v14 didChangeDragState:v8 fromOldState:v6];
  }
  if (!v8)
  {
    if ((*(void *)&self->_flags & 4) == 0)
    {
      float v15 = [v20 object];
      annotationManager = self->_annotationManager;
      double v17 = [v15 annotation];
      [(MKAnnotationManager *)annotationManager selectAnnotation:v17 animated:1];
    }
    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = [v20 object];
    [v18 removeObserver:self name:0x1ED91FFC8 object:v19];
  }
}

- (void)setLabelTextSize:(int64_t)a3
{
  BOOL v5 = a3 != 2;
  uint64_t v6 = [(MKMapView *)self vk_mapLayer];
  uint64_t v7 = v6;
  if (a3 == 1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = v5;
  }
  if (a3 == 1) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 4;
  }
  [v6 setLabelScaleFactor:v8];

  id v10 = [(MKMapView *)self vk_mapLayer];
  [v10 setShieldSize:v9];
}

- (int64_t)labelTextSize
{
  double v2 = [(MKMapView *)self vk_mapLayer];
  unint64_t v3 = [v2 labelScaleFactor];
  if (v3 > 5) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = qword_18BD1AD00[v3];
  }

  return v4;
}

- (BOOL)isWithinHikingBoundary
{
  double v2 = [(MKMapView *)self _mapLayer];
  char v3 = [v2 isCameraInHikingBoundary];

  return v3;
}

- (BOOL)isWithinHikingBufferRegion
{
  double v2 = [(MKMapView *)self _mapLayer];
  char v3 = [v2 isCameraInHikingBufferRegion];

  return v3;
}

- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x18C139AE0](a4, a2);
  id locationIsInHikingContextCallback = self->_locationIsInHikingContextCallback;
  self->_id locationIsInHikingContextCallback = v5;

  VKLocationCoordinate2DMake();
  double v8 = v7;
  double v10 = v9;
  id v11 = [(MKMapView *)self _mapLayer];
  objc_msgSend(v11, "requestHikingContextualRegionDoesIntersectForLocation:", v8, v10);
}

- (id)beginStoppingEffects
{
  [(MKMapView *)self _stopEffects];
  char v3 = [[_MKMapViewSuspendedEffectsToken alloc] initWithOwner:self];

  return v3;
}

- (NSTimer)_startEffectsTimer
{
  return self->_startEffectsTimer;
}

- (void)set_startEffectsTimer:(id)a3
{
  BOOL v5 = (NSTimer *)a3;
  p_startEffectsTimer = &self->_startEffectsTimer;
  if (*p_startEffectsTimer != v5)
  {
    double v7 = v5;
    [(NSTimer *)*p_startEffectsTimer invalidate];
    objc_storeStrong((id *)p_startEffectsTimer, a3);
    BOOL v5 = v7;
  }
}

- (void)showAnnotations:(NSArray *)annotations animated:(BOOL)animated
{
  BOOL v4 = animated;
  BOOL v61 = annotations;
  uint64_t v6 = [(NSArray *)v61 count];
  double v7 = v61;
  if (v6)
  {
    [(MKMapView *)self addAnnotations:v61];
    double v8 = objc_msgSend(MEMORY[0x1E4F64700], "_mapkit_mapRegionEnclosingAnnotations:", v61);
    GEOMapRectForMapRegion();
    double v12 = v9;
    double v13 = v10;
    double v15 = v14;
    double v16 = v11;
    if (v14 == 0.0 || v11 == 0.0)
    {
      MKCoordinateForMapPoint(*(MKMapPoint *)&v9);
      GEOMapPointsPerMeterAtLatitude();
      BOOL v18 = v12 == INFINITY && v13 == INFINITY;
      double v19 = v17 * -100.0;
      double v20 = v12 + v19;
      double v21 = v13 + v19;
      double v22 = v15 - v19 * 2.0;
      double v23 = v16 - v19 * 2.0;
      if (v18)
      {
        double v13 = INFINITY;
      }
      else
      {
        double v16 = v23;
        double v15 = v22;
        double v13 = v21;
      }
      if (v18) {
        double v12 = INFINITY;
      }
      else {
        double v12 = v20;
      }
    }
    [v8 centerLat];
    CLLocationDegrees v25 = v24;
    [v8 centerLng];
    CLLocationCoordinate2D v27 = CLLocationCoordinate2DMake(v25, v26);
    uint64_t v28 = [(MKMapView *)self cameraBoundary];
    double v29 = v13;
    double v30 = v15;
    double v31 = v16;
    double v32 = v12;
    if (v28)
    {
      BOOL v33 = (void *)v28;
      double v34 = [(MKMapView *)self cameraBoundary];
      char v35 = objc_msgSend(v34, "_containsCoordinate:", v27.latitude, v27.longitude);

      double v29 = v13;
      double v30 = v15;
      double v31 = v16;
      double v32 = v12;
      if ((v35 & 1) == 0)
      {
        double v36 = [(MKMapView *)self cameraBoundary];
        objc_msgSend(v36, "_clampedCoordinateForCoordinate:", v27.latitude, v27.longitude);
        double v38 = v37;
        double v40 = v39;

        double v41 = MKTilePointForCoordinate(v38, v40, 21.0);
        double v43 = vabdd_f64(v41, v12);
        double v44 = vabdd_f64(v41, v15 + v12);
        if (v43 <= v44) {
          double v43 = v44;
        }
        double v45 = vabdd_f64(v42, v13);
        double v46 = vabdd_f64(v42, v16 + v13);
        if (v45 <= v46) {
          double v45 = v46;
        }
        double v47 = v43 + v43;
        if (v47 <= v15) {
          double v30 = v15;
        }
        else {
          double v30 = v47;
        }
        if (v45 + v45 <= v16) {
          double v31 = v16;
        }
        else {
          double v31 = v45 + v45;
        }
        double v32 = v41 - v30 * 0.5;
        double v29 = v42 - v31 * 0.5;
      }
    }
    [(MKAnnotationContainerView *)self->_annotationContainer accessoryPadding];
    double v58 = v49;
    double v59 = v48;
    double v57 = v50;
    double v60 = v51;
    -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v32, v29, v30, v31, v48, v49, v50, v51);
    v64.origin.double x = v12;
    v64.origin.double y = v13;
    v64.size.double width = v15;
    v64.size.double height = v16;
    BOOL v52 = MKMapRectContainsRect(v63, v64);
    if (v52) {
      double v53 = v32;
    }
    else {
      double v53 = v12;
    }
    if (v52) {
      double v54 = v29;
    }
    else {
      double v54 = v13;
    }
    if (v52) {
      double v55 = v30;
    }
    else {
      double v55 = v15;
    }
    if (v52) {
      double v56 = v31;
    }
    else {
      double v56 = v16;
    }
    -[MKMapView setVisibleMapRect:edgePadding:animated:](self, "setVisibleMapRect:edgePadding:animated:", v4, v53, v54, v55, v56, v59, v58, v57, v60);
    [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:11];

    double v7 = v61;
  }
}

- (void)_fixUserLocationFromPresentationValue
{
  char v3 = [(MKMapView *)self userLocationView];
  BOOL v4 = [v3 superview];

  if (v4)
  {
    annotationContainer = self->_annotationContainer;
    uint64_t v6 = [(MKMapView *)self userLocationView];
    [(MKAnnotationContainerView *)annotationContainer coordinateForAnnotationView:v6];
    double v8 = v7;
    double v10 = v9;

    if (v10 >= -180.0 && v10 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      double v11 = [(MKMapView *)self userLocation];
      id v22 = [v11 location];

      id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v22 horizontalAccuracy];
      double v14 = v13;
      double v15 = [v22 timestamp];
      double v16 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v8, v10, 0.0, v14, 0.0);

      userLocation = self->_userLocation;
      if (!userLocation)
      {
        BOOL v18 = self;
        double v19 = objc_alloc_init(MKUserLocation);
        double v20 = v18->_userLocation;
        v18->_userLocation = v19;

        userLocation = v18->_userLocation;
      }
      double v21 = userLocation;
      [(MKUserLocation *)v21 setFixedLocation:v16];
    }
  }
}

- (int)_viewIndexForSubview:(id)a3
{
  BOOL v4 = (MKAnnotationContainerView *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = 2;
    }
    else if (self->_annotationContainer == v4)
    {
      int v5 = 3;
    }
    else
    {
      int v5 = 0;
    }
  }

  return v5;
}

- (void)_insertSubview:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 superview];

  if (!v5)
  {
    unsigned int v6 = [(MKMapView *)self _viewIndexForSubview:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v7 = [(UIView *)self->_scrollContainerView subviews];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ([(MKMapView *)self _viewIndexForSubview:v12] > v6)
          {
            [(UIView *)self->_scrollContainerView insertSubview:v4 belowSubview:v12];

            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(UIView *)self->_scrollContainerView addSubview:v4];
  }
LABEL_12:
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKMapView;
  [(MKMapView *)&v5 _populateArchivedSubviews:v4];
  if (self->_contentView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_attributionLabel) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_compassView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_controlStackView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)resumeUserLocationUpdates
{
}

- (void)_selectUserLocationTypeWithDeltaZoomLevel:(double)a3
{
  if (a3 >= 3.0) {
    [(MKMapView *)self _clearFixedUserLocation];
  }
  else {
    [(MKMapView *)self _fixUserLocationFromPresentationValue];
  }
}

- (void)_sizeWillChange
{
  *(void *)&self->_flags |= 0x800000uLL;
  [(MKAnnotationContainerView *)self->_annotationContainer suppressUpdates];
}

- (void)_sizeDidChangeWithCenterCoordinate:(CLLocationCoordinate2D)a3
{
  [(MKMapView *)self _updateContentBounds];
  [(MKMapView *)self _updateScrollContainerView:1 forReason:1];
  [(MKMapView *)self _updateCompassVisibility];
  [(MKMapView *)self _updateTrackingVisibility];
  [(MKMapView *)self _updatePitchButtonVisibility];
  [(MKMapView *)self _showOrHideScaleIfNecessary:1];
  [(MKMapView *)self _updateAppleLogoVisibility];
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    id v4 = (void *)MEMORY[0x1E4F42FF0];
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    void v5[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke;
    v6[3] = &unk_1E54B8188;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke_2;
    _OWORD v5[3] = &unk_1E54B86F0;
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v6, v5);
  }
  else
  {
    [(MKAnnotationContainerView *)self->_annotationContainer stopSuppressingUpdates];
  }
  *(void *)&self->_flags &= ~0x800000uLL;
  [(MKMapView *)self _performWhenSizedBlocks];
  if ((objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters") & 1) == 0) {
    [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationViewsForReason:1];
  }
  if (self->_forceLayoutOnBoundsChange) {
    [(VKMapView *)self->_mapView _forceLayoutForSuspensionSnapShot];
  }
}

uint64_t __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) stopSuppressingUpdates];
  [*(id *)(*(void *)(a1 + 32) + 464) updateAnnotationViewsForReason:1];
  double v2 = *(void **)(*(void *)(a1 + 32) + 464);

  return [v2 suppressUpdates];
}

uint64_t __48__MKMapView__sizeDidChangeWithCenterCoordinate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) stopSuppressingUpdates];
}

- (id)_labelMarkersInCurrentViewport
{
  double v2 = [(MKMapView *)self vk_mapLayer];
  char v3 = [v2 labelMarkers];

  return v3;
}

- (id)_labelMarkersInCurrentViewportForType:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v6 = [(MKMapView *)self vk_mapLayer];
  double v7 = [v6 labelMarkers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 featureType] == a3) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)_forceFrame
{
}

- (BOOL)canShowPitch
{
  BOOL v3 = [(MKMapView *)self _canShowControls];
  if (v3)
  {
    LOBYTE(v3) = [(MKMapView *)self isPitchEnabled];
  }
  return v3;
}

- (BOOL)canShowZoom
{
  BOOL v3 = [(MKMapView *)self _canShowControls];
  if (v3)
  {
    LOBYTE(v3) = [(MKMapView *)self isZoomEnabled];
  }
  return v3;
}

- (BOOL)showsScale
{
  BOOL v3 = _MKLinkedOnOrAfterReleaseSet(1791);
  uint64_t v4 = 2;
  if (v3) {
    uint64_t v4 = 0;
  }
  return self->_scaleVisibility == v4;
}

- (void)setShowsScale:(BOOL)showsScale
{
  BOOL v3 = showsScale;
  BOOL v5 = _MKLinkedOnOrAfterReleaseSet(1791);
  uint64_t v6 = 1;
  if (v3) {
    uint64_t v6 = 2;
  }
  if (v5) {
    uint64_t v7 = !v3;
  }
  else {
    uint64_t v7 = v6;
  }

  [(MKMapView *)self _setScaleVisibility:v7];
}

- (void)_stopPostingScaleUpdateNotifications
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 1336);
    if (v1)
    {
      *(void *)(a1 + 1336) = v1 - 1;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v2 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _scaleUpdateNotificationObserversCount > 0", v2, 2u);
    }
  }
}

- (BOOL)_showsScaleDuringZoom
{
  return self->_scaleVisibility == 0;
}

- (int64_t)_scaleVisibility
{
  return self->_scaleVisibility;
}

- (id)scaleView
{
  if (!self->_scaleView)
  {
    BOOL v3 = objc_alloc_init(MKScaleView);
    scaleView = self->_scaleView;
    self->_scaleView = v3;

    [(MKScaleView *)self->_scaleView setUsedInternallyByMapView:1];
  }
  MKMapType v5 = [(MKMapView *)self mapType];
  [(MKScaleView *)self->_scaleView setMapType:v5];
  BOOL v6 = [(MKMapView *)self _showsNightMode];
  BOOL v7 = v5 - 1 < 4 || v5 == 107;
  uint64_t v8 = v6 || v7;
  [(MKScaleView *)self->_scaleView setUseLightText:v8];
  uint64_t v9 = self->_scaleView;

  return v9;
}

- (BOOL)_shouldDisplayScaleForCurrentRegion
{
  if (qword_1E9154000 != -1) {
    dispatch_once(&qword_1E9154000, &__block_literal_global_331);
  }
  uint64_t v3 = qword_1E9153FF8;
  if ([(MKMapView *)self _isPitched]) {
    return 0;
  }
  if (v3 != 100) {
    return 0;
  }
  [(MKMapView *)self bounds];
  double MidX = CGRectGetMidX(v8);
  [(MKMapView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v9);
  -[MKMapView _distanceFromPoint:toPoint:fromView:withPrecision:](self, "_distanceFromPoint:toPoint:fromView:withPrecision:", self, 0, MidX, MidY, MidX + 1.0, MidY);
  BOOL result = v6 <= 7500.0;
  if (v6 <= 0.0) {
    return 0;
  }
  return result;
}

void __48__MKMapView__shouldDisplayScaleForCurrentRegion__block_invoke()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  qword_1E9153FF8 = [v0 _graphicsQuality];
}

- (BOOL)_canShowAppleLogo
{
  [(MKMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(MKMapView *)self _edgeInsets];
  double v8 = v7;
  double v11 = v6 - (v9 + v10);
  double v13 = v12 + 10.0 + self->_appleLogoImageWidth + self->_attributionInsets.left;
  [(MKAttributionLabel *)self->_attributionLabel bounds];
  double v14 = v4 - (v8 + v13 + CGRectGetWidth(v17) + self->_attributionInsets.right + 10.0);
  double Integer = (double)GEOConfigGetInteger();
  return v11 >= (double)GEOConfigGetInteger() && v14 >= Integer;
}

uint64_t __41__MKMapView__showOrHideScaleIfNecessary___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(*(void *)(result + 32) + 744)) {
      return [*(id *)(result + 40) removeFromSuperview];
    }
  }
  return result;
}

uint64_t __41__MKMapView__showOrHideScaleIfNecessary___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  double v2 = *(void **)(a1 + 32);
  double v3 = 1.0;
  if (!v1) {
    double v3 = 0.0;
  }
  return [v2 setAlpha:v3];
}

- (void)_setCompassSuppressedForFloorPicker:(BOOL)a3
{
  if (self->_compassSuppressedForFloorPicker != a3)
  {
    self->_compassSuppressedForFloorPicker = a3;
    [(MKMapView *)self _updateCompassVisibility];
  }
}

- (void)_stopPostingCompassUpdateNotifications
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 1328);
    if (v1)
    {
      *(void *)(a1 + 1328) = v1 - 1;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v2 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _compassUpdateNotificationObserversCount > 0", v2, 2u);
    }
  }
}

- (double)presentationYaw
{
  double v2 = [(MKMapView *)self _mapLayer];
  [v2 presentationYaw];
  double v4 = v3;

  return v4;
}

- (void)setShowsUserTrackingButton:(BOOL)showsUserTrackingButton
{
  if (self->_showsUserTrackingButton != showsUserTrackingButton)
  {
    self->_showsUserTrackingButton = showsUserTrackingButton;
    [(MKMapView *)self _updateTrackingVisibility];
  }
}

- (void)setPitchButtonVisibility:(MKFeatureVisibility)pitchButtonVisibility
{
  if (self->_pitchButtonVisibility != pitchButtonVisibility)
  {
    self->_pitchButtonVisibilitdouble y = pitchButtonVisibility;
    -[MKPitchButton setVisibility:](self->_pitchButton, "setVisibility:");
    [(MKMapView *)self _updatePitchButtonVisibility];
  }
}

- (BOOL)showsCompass
{
  return self->_showsCompass;
}

- (id)_userTrackingButton
{
  trackingButton = self->_trackingButton;
  if (!trackingButton)
  {
    double v4 = +[MKUserTrackingButton userTrackingButtonWithMapView:self];
    double v5 = self->_trackingButton;
    self->_trackingButton = v4;

    [(MKUserTrackingButton *)self->_trackingButton setBackgroundStyle:self->_userTrackingButtonBackgroundStyle];
    [(MKUserTrackingButton *)self->_trackingButton setTranslatesAutoresizingMaskIntoConstraints:0];
    trackingButton = self->_trackingButton;
  }

  return trackingButton;
}

- (void)_setUserTrackingButtonBackgroundStyle:(unint64_t)a3
{
  if (self->_userTrackingButtonBackgroundStyle != a3)
  {
    self->_userTrackingButtonBackgroundStyle = a3;
    id v4 = [(MKMapView *)self _userTrackingButton];
    [v4 setBackgroundStyle:a3];
  }
}

- (void)_setUserTrackingControlSize:(unint64_t)a3
{
  if (self->_userTrackingControlSize != a3)
  {
    self->_userTrackingControlSize = a3;
    id v4 = [(MKMapView *)self _userTrackingButton];
    [v4 _setControlSize:a3];
  }
}

- (void)_setPitchButtonControlSize:(unint64_t)a3
{
  if (self->_pitchButtonControlSize != a3)
  {
    self->_pitchButtonControlSize = a3;
    id v4 = [(MKMapView *)self _pitchButton];
    [v4 _setControlSize:a3];
  }
}

- (void)_setScaleControlSize:(unint64_t)a3
{
  if (self->_scaleControlSize != a3)
  {
    self->_scaleControlSize = a3;
    id v4 = [(MKMapView *)self scaleView];
    [v4 _setControlSize:a3];
  }
}

- (void)_setControlBackgroundStyle:(unint64_t)a3
{
  self->_controlBackgroundStyle = a3;
  -[MKMapView _setUserTrackingButtonBackgroundStyle:](self, "_setUserTrackingButtonBackgroundStyle:");

  [(MKMapView *)self _setPitchButtonBackgroundStyle:a3];
}

- (void)_setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
  -[MKMapView _setUserTrackingControlSize:](self, "_setUserTrackingControlSize:");
  [(MKMapView *)self _setPitchButtonControlSize:a3];

  [(MKMapView *)self _setScaleControlSize:a3];
}

- (id)compassView
{
  compassView = self->_compassView;
  if (!compassView)
  {
    [(MKMapView *)self _compassDiameter];
    double v5 = -[MKCompassView initWithFrame:]([MKCompassView alloc], "initWithFrame:", 0.0, 0.0, v4, v4);
    double v6 = self->_compassView;
    self->_compassView = v5;

    [(MKCompassView *)self->_compassView setCompassViewSize:self->_compassViewSize style:self->_compassViewStyle];
    [(MKCompassView *)self->_compassView setOverrideUserInterfaceStyle:[(MKMapView *)self _controlsUserInterfaceStyleOverride]];
    [(MKMapGestureController *)self->_gestureController setCompassView:self->_compassView];
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleCompassTap_];
    [v7 setNumberOfTapsRequired:1];
    [v7 setDelegate:self];
    [(MKCompassView *)self->_compassView addGestureRecognizer:v7];

    compassView = self->_compassView;
  }

  return compassView;
}

- (void)_postDidUpdateYawNotification
{
  id v8[2] = *MEMORY[0x1E4F143B8];
  if (self->_compassUpdateNotificationObserversCount)
  {
    double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7[0] = @"MKMapViewDidUpdateYawDegreesKey";
    double v4 = [NSNumber numberWithDouble:self->_lastYaw];
    v7[1] = @"MKMapViewDidUpdateYawVisibleKey";
    v8[0] = v4;
    double v5 = [NSNumber numberWithBool:self->_lastPossiblyVisible];
    v8[1] = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    [v3 postNotificationName:@"MKMapViewDidUpdateYawNotification" object:self userInfo:v6];
  }
}

- (void)_updateCompassPositionClassic
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  [(MKMapView *)self _edgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MKMapView *)self bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] != v11 || v17 != v12)
  {
    double v19 = v11;
    double v20 = v12;
    double rect_8 = v6;
    double rect_24 = v10;
    double v68 = v4;
    double v69 = v8;
    [(MKCompassView *)self->_compassView bounds];
    CGFloat rect = v21;
    CGFloat v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double rect_16 = self->_compassInsets.top;
    double bottom = self->_compassInsets.bottom;
    double left = self->_compassInsets.left;
    double right = self->_compassInsets.right;
    [(MKMapView *)self _compassDiameter];
    BOOL v29 = v25 == v28;
    BOOL v30 = v27 == v28;
    if (v29 && v30) {
      CGFloat v31 = v27;
    }
    else {
      CGFloat v31 = v28;
    }
    if (v29 && v30) {
      CGFloat v32 = v25;
    }
    else {
      CGFloat v32 = v28;
    }
    unint64_t v33 = [(MKMapView *)self _compassInsetEdges];
    CGFloat v70 = v32;
    CGFloat v67 = v23;
    uint64_t v34 = v14;
    uint64_t v35 = v16;
    double v36 = v19;
    double v37 = v20;
    if ((v33 & 2) != 0)
    {
      double v39 = rect_8 + left + CGRectGetMinX(*(CGRect *)&v34);
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v74.origin.double x = rect;
      v74.origin.double y = v23;
      v74.size.double width = v32;
      v74.size.double height = v31;
      double v39 = MaxX - CGRectGetWidth(v74) - right - rect_24;
    }
    double v40 = v31;
    uint64_t v41 = v14;
    uint64_t v42 = v16;
    double v43 = v19;
    double v44 = v20;
    if (v33)
    {
      double v47 = v68 + rect_16 + CGRectGetMinY(*(CGRect *)&v41);
      double v46 = v70;
    }
    else
    {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v41);
      v75.origin.double x = v39;
      v75.origin.double y = v67;
      double v46 = v70;
      v75.size.double width = v70;
      v75.size.double height = v31;
      double v47 = MaxY - CGRectGetHeight(v75) - bottom - v69;
    }
    if ((*(void *)&self->_flags & 0x10000000000) != 0)
    {
      double x = v39;
      double y = v47;
      double height = v40;
      double width = v46;
    }
    else
    {
      -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v33 & 5, v39, v47, v46, v40);
      double x = v76.origin.x;
      double y = v76.origin.y;
      double v50 = v40;
      double width = v76.size.width;
      double height = v76.size.height;
      if (CGRectIsNull(v76))
      {
        double v53 = v46;
        double v54 = v50;
        -[UIView _mapkit_translateRect:ifNeededFromSingleEdge:](self, "_mapkit_translateRect:ifNeededFromSingleEdge:", v33 & 0xA, v39, v47, v53, v50);
        double x = v55;
        double y = v56;
        double width = v57;
        double height = v58;
      }
      else
      {
        double v54 = v50;
      }
      v77.origin.double x = x;
      v77.origin.double y = y;
      v77.size.double width = width;
      v77.size.double height = height;
      if (CGRectIsNull(v77))
      {
        double v59 = MKGetMKMapViewLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v72 = v33;
          _os_log_impl(&dword_18BAEC000, v59, OS_LOG_TYPE_DEBUG, "Could not inset compass from edges %lu", buf, 0xCu);
        }

        double x = v39;
        double y = v47;
        double width = v70;
        double height = v54;
      }
    }
    -[MKCompassView setFrame:](self->_compassView, "setFrame:", x, y, width, height);
  }
}

- (void)_handleCompassTap:(id)a3
{
  double v4 = +[MKMapService sharedService];
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 1040, -[MKMapView currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics"), 0);

  [(MKMapView *)self _snapToTrueNorthAndCallBack:1];
}

uint64_t __55__MKMapView__setCompassVisible_animationAllowed_force___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (!*(unsigned char *)(result + 40))
    {
      double v3 = [*(id *)(*(void *)(result + 32) + 688) layer];
      [v3 removeAnimationForKey:@"controlVisibility"];

      double v4 = *(void **)(*(void *)(v2 + 32) + 688);
      return [v4 removeFromSuperview];
    }
  }
  return result;
}

- (BOOL)compassVisible
{
  return self->_compassVisible;
}

- (id)_commonVisibilityAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v5 = v4;
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  if (v3) {
    float v7 = 0.0;
  }
  else {
    float v7 = 1.0;
  }
  if (v3) {
    float v8 = 1.0;
  }
  else {
    float v8 = 0.0;
  }
  objc_msgSend(v4, "set_mapkit_ID:", v6);
  *(float *)&double v9 = v7;
  double v10 = [NSNumber numberWithFloat:v9];
  [v5 setFromValue:v10];

  *(float *)&double v11 = v8;
  double v12 = [NSNumber numberWithFloat:v11];
  [v5 setToValue:v12];

  [v5 setRemovedOnCompletion:0];
  [v5 setFillMode:*MEMORY[0x1E4F39FA8]];
  if (_MKLinkedOnOrAfterReleaseSet(2824))
  {
    if (v3) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.430000007;
    }
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationDuration");
    [v5 setDuration:v13 * v14];
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
  [v5 setTimingFunction:v15];

  return v5;
}

- (void)snapToNorth:(id)a3
{
  double v4 = self->_mapView;
  if ([(MKMapView *)self userTrackingMode] == MKUserTrackingModeFollowWithHeading) {
    [(MKMapView *)self setUserTrackingMode:1 animated:1];
  }
  *(void *)&self->_flags &= ~0x4000000000000uLL;
  [(VKMapView *)v4 setYaw:1 animated:self->_verticalYawOverride];
}

- (void)_snapToTrueNorthAndCallBack:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = self->_mapView;
  if (v3 && [(MKMapView *)self userTrackingMode] == MKUserTrackingModeFollowWithHeading) {
    [(MKMapView *)self _setUserTrackingMode:1 animated:1 fromTrackingButton:0];
  }
  *(void *)&self->_flags &= ~0x4000000000000uLL;
  [(VKMapView *)v5 setYaw:1 animated:0.0];
}

- (void)_setAutomaticallySnapsToNorth:(BOOL)a3
{
  self->_automaticallySnapsToNorth = a3;
}

- (void)mapLayerDidFailLoadingTiles:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      float v7 = self->_unsafeDelegate;
    }
    else
    {
      float v7 = [(MKMapView *)self _safeDelegate];
    }
    float v8 = v7;
  }
  else
  {
    float v8 = 0;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v10 = self->_unsafeDelegate;
      }
      else
      {
        double v10 = [(MKMapView *)self _safeDelegate];
      }
      double v11 = v10;
    }
    else
    {
      double v11 = 0;
    }
    [(MKMapViewDelegate *)v11 mapViewDidFailLoadingMap:self withError:v6];
  }
}

- (void)mapLayer:(id)a3 selectedLabelMarkerDidCompleteLayout:(id)a4
{
  double v5 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
    [v7 _showDeferredSelectionAccessoryForReasonIfNeeded:1];
    [v7 setNeedsLayout];
  }
}

- (void)mapLayer:(id)a3 labelMarkerDidChangeState:(id)a4
{
  double v5 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
    [v7 setNeedsLayout];
  }
}

- (void)mapLayer:(id)a3 selectedLabelMarkerWillDisappear:(id)a4
{
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4))
  {
    [(MKMapView *)self _deselectLabelMarkerAnimated:1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MKMapView_mapLayer_selectedLabelMarkerWillDisappear___block_invoke;
    block[3] = &unk_1E54B8188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __55__MKMapView_mapLayer_selectedLabelMarkerWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deselectLabelMarkerAnimated:1];
}

- (void)mapLayer:(id)a3 selectedLabelMarkerDidChangeState:(id)a4
{
  id v13 = a4;
  id v5 = [(MKMapView *)self _selectedLabelMarker];

  id v6 = v13;
  if (v5 == v13)
  {
    id v7 = self->_selectedLabelMarkerState;
    float v8 = +[MKMapViewLabelMarkerState stateForLabelMarker:v13];
    selectedLabelMarkerState = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v8;

    if ([(MKMapViewLabelMarkerState *)v7 isVisible]
      || ![(MKMapViewLabelMarkerState *)self->_selectedLabelMarkerState isVisible])
    {
      int v10 = [(MKMapViewLabelMarkerState *)v7 balloonBehavior];
      if (v10 != [(MKMapViewLabelMarkerState *)self->_selectedLabelMarkerState balloonBehavior])
      {
        double v11 = [(MKAnnotationManager *)self->_annotationManager representationForAnnotation:v13];
        id v12 = [v11 viewRepresentation];

        [(MKAnnotationContainerView *)self->_annotationContainer updateCalloutStateForSelectedAnnotationView:v12];
      }
    }
    else
    {
      [(MKAnnotationManager *)self->_annotationManager _annotationDidChangeState:v13 animated:1];
    }

    id v6 = v13;
  }
}

- (void)mapLayer:(id)a3 didUpdateVerticalYawTo:(double)a4
{
  if (self->_verticalYawOverride != a4)
  {
    self->_verticalYawOverride = a4;
    [(MKMapView *)self _updateCompassVisibility];
  }
}

- (void)mapLayerWillStartFlyoverTour:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v4 = self->_unsafeDelegate;
    }
    else
    {
      double v4 = [(MKMapView *)self _safeDelegate];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        id v7 = self->_unsafeDelegate;
      }
      else
      {
        id v7 = [(MKMapView *)self _safeDelegate];
      }
      float v8 = v7;
    }
    else
    {
      float v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewWillStartFlyoverTour:self];
  }
}

- (void)mapLayer:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      char v6 = self->_unsafeDelegate;
    }
    else
    {
      char v6 = [(MKMapView *)self _safeDelegate];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        id v9 = self->_unsafeDelegate;
      }
      else
      {
        id v9 = [(MKMapView *)self _safeDelegate];
      }
      int v10 = v9;
    }
    else
    {
      int v10 = 0;
    }
    [(MKMapViewDelegate *)v10 mapView:self didStopFlyoverTourCompleted:v4];
  }
}

- (void)mapLayer:(id)a3 flyoverTourLabelDidChange:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v7 = self->_unsafeDelegate;
    }
    else
    {
      id v7 = [(MKMapView *)self _safeDelegate];
    }
    char v8 = v7;
  }
  else
  {
    char v8 = 0;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        int v10 = self->_unsafeDelegate;
      }
      else
      {
        int v10 = [(MKMapView *)self _safeDelegate];
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    [(MKMapViewDelegate *)v11 mapView:self flyoverTourLabelDidChange:v6];
  }
}

- (void)mapLayer:(id)a3 willTransitionTo:(int64_t)a4
{
}

- (void)mapLayer:(id)a3 showingFlyoverDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v6 = self->_unsafeDelegate;
    }
    else
    {
      id v6 = [(MKMapView *)self _safeDelegate];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v9 = self->_unsafeDelegate;
      }
      else
      {
        char v9 = [(MKMapView *)self _safeDelegate];
      }
      int v10 = v9;
    }
    else
    {
      int v10 = 0;
    }
    [(MKMapViewDelegate *)v10 mapView:self showingFlyoverDidChange:v4];
  }
}

- (void)mapLayer:(id)a3 flyoverModeDidChange:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v6 = self->_unsafeDelegate;
    }
    else
    {
      id v6 = [(MKMapView *)self _safeDelegate];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v9 = self->_unsafeDelegate;
      }
      else
      {
        char v9 = [(MKMapView *)self _safeDelegate];
      }
      int v10 = v9;
    }
    else
    {
      int v10 = 0;
    }
    [(MKMapViewDelegate *)v10 mapView:self flyoverModeDidChange:v4];
  }
}

- (void)mapLayer:(id)a3 flyoverModeWillChange:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v6 = self->_unsafeDelegate;
    }
    else
    {
      id v6 = [(MKMapView *)self _safeDelegate];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v9 = self->_unsafeDelegate;
      }
      else
      {
        char v9 = [(MKMapView *)self _safeDelegate];
      }
      int v10 = v9;
    }
    else
    {
      int v10 = 0;
    }
    [(MKMapViewDelegate *)v10 mapView:self flyoverModeWillChange:v4];
  }
}

- (void)mapLayer:(id)a3 venueWithFocusDidChange:(id)a4 building:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  if ([v14 venueID])
  {
    char v8 = v14;
  }
  else
  {
    if (!self->_cachedVenueIDWithFocus) {
      goto LABEL_19;
    }

    char v8 = 0;
    id v7 = 0;
  }
  id v14 = v8;
  if ([v8 venueID] != self->_cachedVenueIDWithFocus)
  {
    self->_cachedVenueIDWithFocus = [v14 venueID];
    self->_cachedDisplayedFloorOrdinalForVenueWithFocus = [(VKMapView *)self->_mapView displayedFloorOrdinalForVenueBuilding:v7];
  }
  if (qword_1E9154040 != -1) {
    dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
  }
  if (byte_1E9153FDC)
  {
    char v9 = self->_unsafeDelegate;
  }
  else
  {
    char v9 = [(MKMapView *)self _safeDelegate];
  }
  int v10 = v9;
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v12 = self->_unsafeDelegate;
    }
    else
    {
      id v12 = [(MKMapView *)self _safeDelegate];
    }
    id v13 = v12;
    [(MKMapViewDelegate *)v12 mapView:self didChangeFocusedVenue:v14 focusedBuilding:v7];
  }
LABEL_19:
}

- (void)mapLayer:(id)a3 locationInHikingToolTipRegion:(unint64_t)a4
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v9 mapView:self didGetHikingToolTipRegionId:a4];
  }
}

- (void)mapLayer:(id)a3 location:(id)a4 isInHikingContextualRegion:(BOOL)a5
{
  id locationIsInHikingContextCallback = self->_locationIsInHikingContextCallback;
  if (locationIsInHikingContextCallback)
  {
    BOOL v7 = a5;
    double var1 = a4.var1;
    double var0 = a4.var0;
    id v12 = (void (**)(id, BOOL, double, double))MEMORY[0x18C139AE0](locationIsInHikingContextCallback, a2, a3);
    id v10 = self->_locationIsInHikingContextCallback;
    self->_id locationIsInHikingContextCallback = 0;

    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(var0, var1);
    v12[2](v12, v7, v11.latitude, v11.longitude);
  }
}

- (void)mapLayerWillPerformZoomBounceAnimation
{
  zoomBounceFeedbackGenerator = self->_zoomBounceFeedbackGenerator;
  if (!zoomBounceFeedbackGenerator)
  {
    uint64_t v4 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42C10]);
    id v5 = self->_zoomBounceFeedbackGenerator;
    self->_zoomBounceFeedbackGenerator = v4;

    zoomBounceFeedbackGenerator = self->_zoomBounceFeedbackGenerator;
  }

  [(UINotificationFeedbackGenerator *)zoomBounceFeedbackGenerator notificationOccurred:2];
}

- (void)mapLayerDidFinishInitialTrackingAnimation
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MKMapViewDidFinishInitialUserTrackingModeAnimationNotification" object:self];

  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      uint64_t v4 = self->_unsafeDelegate;
    }
    else
    {
      uint64_t v4 = [(MKMapView *)self _safeDelegate];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        BOOL v7 = self->_unsafeDelegate;
      }
      else
      {
        BOOL v7 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    char v8 = v7;
    [(MKMapViewDelegate *)v7 mapViewDidFinishInitialUserTrackingModeAnimation:self];
  }
}

- (id)mapLayerPresentationForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapView *)self userLocation];

  if (v5 == v4)
  {
    BOOL v7 = [(MKMapView *)self userLocationView];
    char v6 = [v7 _userLocationProxy];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)mapLayerDidBecomePitched:(BOOL)a3
{
  BOOL v3 = a3;
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v5 = self->_unsafeDelegate;
    }
    else
    {
      id v5 = [(MKMapView *)self _safeDelegate];
    }
    char v6 = v5;
  }
  else
  {
    char v6 = 0;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v8 = self->_unsafeDelegate;
      }
      else
      {
        char v8 = [(MKMapView *)self _safeDelegate];
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
    [(MKMapViewDelegate *)v9 mapView:self didBecomePitched:v3];
  }
  if ([(VKMapView *)self->_mapView canShowFlyover]) {
    [(MKMapView *)self mapLayer:self->_mapView showingFlyoverDidChange:v3];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"MKMapViewPitchStateDidChangeNotification" object:self];
}

- (void)mapLayerCanZoomInDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v5 = self->_unsafeDelegate;
    }
    else
    {
      id v5 = [(MKMapView *)self _safeDelegate];
    }
    char v6 = v5;
  }
  else
  {
    char v6 = 0;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v8 = self->_unsafeDelegate;
      }
      else
      {
        char v8 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v8 = 0;
    }
    id v9 = v8;
    [(MKMapViewDelegate *)v8 mapView:self canZoomInDidChange:v3];
  }
}

- (void)mapLayerCanZoomOutDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v5 = self->_unsafeDelegate;
    }
    else
    {
      id v5 = [(MKMapView *)self _safeDelegate];
    }
    char v6 = v5;
  }
  else
  {
    char v6 = 0;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v8 = self->_unsafeDelegate;
      }
      else
      {
        char v8 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v8 = 0;
    }
    id v9 = v8;
    [(MKMapViewDelegate *)v8 mapView:self canZoomOutDidChange:v3];
  }
}

- (void)mapLayerNavigationCameraHasStartedPanning
{
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v3 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v3 = [(MKMapView *)self _safeDelegate];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v6 = self->_unsafeDelegate;
      }
      else
      {
        char v6 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v6 = 0;
    }
    char v7 = v6;
    [(MKMapViewDelegate *)v6 mapViewNavigationCameraHasStartedPanning:self];
  }
}

- (void)mapLayerNavigationCameraHasStoppedPanning
{
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v3 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v3 = [(MKMapView *)self _safeDelegate];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v6 = self->_unsafeDelegate;
      }
      else
      {
        char v6 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v6 = 0;
    }
    char v7 = v6;
    [(MKMapViewDelegate *)v6 mapViewNavigationCameraHasStoppedPanning:self];
  }
}

- (void)mapLayerNavigationCameraDidLeaveDefaultZoom
{
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v3 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v3 = [(MKMapView *)self _safeDelegate];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v6 = self->_unsafeDelegate;
      }
      else
      {
        char v6 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v6 = 0;
    }
    char v7 = v6;
    [(MKMapViewDelegate *)v6 mapViewNavigationCameraDidLeaveDefaultZoom:self];
  }
}

- (void)mapLayerNavigationCameraDidReturnToDefaultZoom
{
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v3 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v3 = [(MKMapView *)self _safeDelegate];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v6 = self->_unsafeDelegate;
      }
      else
      {
        char v6 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v6 = 0;
    }
    char v7 = v6;
    [(MKMapViewDelegate *)v6 mapViewNavigationCameraDidReturnToDefaultZoom:self];
  }
}

- (void)applicationWillResignActive:(id)a3
{
  [(MKMapView *)self setSuspended:1];
  [(MKMapView *)self _dropDraggingAnnotationView:1];
  [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:[(MKMapView *)self _canShowFlyover]];
  basicMapView = self->_basicMapView;

  [(MKBasicMapView *)basicMapView updateStatsForTrafficEnabledTime];
}

- (void)applicationDidEnterBackground:(id)a3
{
  self->_forceLayoutOnBoundsChange = 1;
}

- (void)applicationWillTerminate:(id)a3
{
  [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:[(MKMapView *)self _canShowFlyover]];
  basicMapView = self->_basicMapView;

  [(MKBasicMapView *)basicMapView updateStatsForTrafficEnabledTime];
}

- (void)_sceneDidFinishSuspensionSnapshot:(id)a3
{
  self->_forceLayoutOnBoundsChange = 0;
}

- (CGRect)visibleRectInView:(id)a3
{
  id v4 = a3;
  [(MKMapView *)self bounds];
  objc_msgSend(v4, "convertRect:fromView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)visibleCenteringRectInView:(id)a3
{
  id v4 = a3;
  [(MKMapView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MKMapView *)self _edgeInsets];
  objc_msgSend(v4, "convertRect:fromView:", self, v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (BOOL)annotationContainerIsRotated:(id)a3
{
  if (self->_userTrackingMode == 2) {
    return 1;
  }
  [(VKMapView *)self->_mapView presentationYaw];
  return v4 != 0.0;
}

- (void)annotationContainer:(id)a3 scrollToRevealCalloutWithOffset:(CGPoint)a4 annotationCoordinate:(CLLocationCoordinate2D)a5 completionHandler:(id)a6
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  id v13 = a6;
  double v14 = v13;
  if (*(void *)&self->_flags)
  {
    CGFloat v31 = (void *)[v13 copy];
    id showCalloutAfterRegionChangeBlock = self->_showCalloutAfterRegionChangeBlock;
    self->_id showCalloutAfterRegionChangeBlock = v31;
  }
  else
  {
    if (self->_userTrackingMode >= 1) {
      [(MKMapView *)self setUserTrackingMode:0 animated:0];
    }
    [(MKMapView *)self bounds];
    CGFloat v15 = v68.origin.x;
    CGFloat v16 = v68.origin.y;
    CGFloat width = v68.size.width;
    CGFloat height = v68.size.height;
    if (fabs(x) <= CGRectGetWidth(v68)
      && (v69.origin.double x = v15,
          v69.origin.double y = v16,
          v69.size.CGFloat width = width,
          v69.size.CGFloat height = height,
          fabs(y) <= CGRectGetHeight(v69)))
    {
      [(MKMapView *)self _centerPoint];
      double v37 = x + v36;
      [(MKMapView *)self _centerPoint];
      -[MKMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, v37, y + v38);
      cameraBoundardouble y = self->_cameraBoundary;
      if (cameraBoundary
        && (double v42 = v39, v43 = v40, !-[MKMapCameraBoundary _containsCoordinate:](cameraBoundary, "_containsCoordinate:")))
      {
        -[MKMapCameraBoundary _clampedCoordinateForCoordinate:](self->_cameraBoundary, "_clampedCoordinateForCoordinate:", v42, v43);
        double v49 = v48;
        double v50 = v47;
        double v51 = v42 - v48;
        if (v51 >= 0.0) {
          double v52 = v51;
        }
        else {
          double v52 = -v51;
        }
        if (v43 - v47 >= 0.0) {
          double v53 = v43 - v47;
        }
        else {
          double v53 = -(v43 - v47);
        }
        [(MKMapView *)self region];
        double v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithCoordinateRegion:", v49, v50, v54 + v52 * 2.0, v55 + v53 * 2.0);
        double v57 = [(MKMapView *)self vk_mapLayer];
        double v58 = [(MKMapView *)self vk_mapLayer];
        [v58 pitch];
        double v60 = v59;
        BOOL v61 = [(MKMapView *)self vk_mapLayer];
        [v61 yaw];
        double v63 = v62;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke_2;
        v64[3] = &unk_1E54B89C0;
        id v65 = v14;
        [v57 setMapRegion:v56 pitch:v64 yaw:v60 duration:v63 completion:0.150000006];
      }
      else
      {
        -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, latitude, longitude);
        -[VKMapView panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:](self->_mapView, "panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:", 1, v14, -x, -y, v44, v45, 0.150000006);
      }
    }
    else
    {
      VKLocationCoordinate2DMake();
      double v20 = v19;
      double v22 = v21;
      mapView = self->_mapView;
      [(VKMapView *)mapView altitude];
      double v25 = v24;
      [(VKMapView *)self->_mapView yaw];
      double v27 = v26;
      [(VKMapView *)self->_mapView pitch];
      double v29 = v28;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke;
      v66[3] = &unk_1E54B89C0;
      id v67 = v14;
      -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](mapView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, v66, v20, v22, v25, v27, v29, 0.150000006);
    }
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      BOOL v30 = self->_unsafeDelegate;
    }
    else
    {
      BOOL v30 = [(MKMapView *)self _safeDelegate];
    }
    unint64_t v33 = v30;
    char v34 = objc_opt_respondsToSelector();

    if (v34)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        uint64_t v35 = self->_unsafeDelegate;
      }
      else
      {
        uint64_t v35 = [(MKMapView *)self _safeDelegate];
      }
      double v46 = v35;
      [(MKMapViewDelegate *)v35 mapViewDidScrollToRevealAnnotationCallout:self];
    }
  }
}

uint64_t __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __104__MKMapView_annotationContainer_scrollToRevealCalloutWithOffset_annotationCoordinate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4
{
  int v22 = -1082130432;
  double v6 = [(MKMapView *)self _flattenedAnnotationsForAnnotationViews:a4 maxDisplayPriority:&v22];
  double v7 = [a4 firstObject];
  double v8 = [v7 clusterAnnotationView];

  double v9 = [v8 annotation];
  double v10 = [v9 memberAnnotations];
  int v11 = [v10 isEqualToArray:v6];

  if (v11)
  {
    id v12 = v8;
  }
  else
  {
    id v13 = [(MKMapView *)self delegate];
    int v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0
      || ([(MKMapView *)self delegate],
          CGFloat v15 = objc_claimAutoreleasedReturnValue(),
          [v15 mapView:self clusterAnnotationForMemberAnnotations:v6],
          CGFloat v16 = (MKClusterAnnotation *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v16))
    {
      CGFloat v16 = [[MKClusterAnnotation alloc] initWithMemberAnnotations:v6];
    }
    double v17 = [(MKMapView *)self viewForAnnotation:v16];
    if (!v17)
    {
      double v18 = [a4 firstObject];
      double v19 = [v18 clusteringIdentifier];
      [(MKClusterAnnotation *)v16 setClusteringIdentifier:v19];

      double v17 = [(MKAnnotationManager *)self->_annotationManager addRepresentationForAnnotation:v16];
      LODWORD(v20) = v22;
      [v17 setDisplayPriority:v20];
      [v17 _setHidden:1 forReason:4 animated:0];
    }
    id v12 = v17;
  }

  return v12;
}

- (void)annotationContainer:(id)a3 requestRemovingClusterAnnotationView:(id)a4 updateVisible:(BOOL)a5
{
  BOOL v5 = a5;
  annotationManager = self->_annotationManager;
  objc_msgSend(a4, "annotation", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(MKAnnotationManager *)annotationManager removeAnnotation:v7 updateVisible:v5];
}

- (void)annotationContainerDidFinishMapsTransitionExpanding:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v4 = self->_unsafeDelegate;
    }
    else
    {
      double v4 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        id v7 = self->_unsafeDelegate;
      }
      else
      {
        id v7 = [(MKMapView *)self _safeDelegate];
      }
      double v8 = v7;
    }
    else
    {
      double v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewDidFinishCalloutExpansion:self];
  }
}

- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5
{
  -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a4.latitude, a4.longitude);
  double v8 = v7;
  if (a5)
  {
    [(MKMapView *)self bounds];
    *(void *)a5 = v9;
  }
  return v8;
}

- (void)annotationContainerWillDropPins:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v4 = self->_unsafeDelegate;
    }
    else
    {
      double v4 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v7 = self->_unsafeDelegate;
      }
      else
      {
        double v7 = [(MKMapView *)self _safeDelegate];
      }
      double v8 = v7;
    }
    else
    {
      double v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewWillAnimateInAnnotationViews:self];
  }
}

- (void)annotationContainerDidDropPins:(id)a3
{
  id v9 = a3;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v4 = self->_unsafeDelegate;
    }
    else
    {
      double v4 = [(MKMapView *)self _safeDelegate];
    }
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v7 = self->_unsafeDelegate;
      }
      else
      {
        double v7 = [(MKMapView *)self _safeDelegate];
      }
      double v8 = v7;
    }
    else
    {
      double v8 = 0;
    }
    [(MKMapViewDelegate *)v8 mapViewDidAnimateInAnnotationViews:self];
  }
}

- (void)annotationContainer:(id)a3 annotationView:(id)a4 calloutAccessoryControlTapped:(id)a5
{
  id v20 = a4;
  id v7 = a5;
  double v8 = [v20 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v10 = self->_unsafeDelegate;
      }
      else
      {
        double v10 = [(MKMapView *)self _safeDelegate];
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          CGFloat v15 = self->_unsafeDelegate;
        }
        else
        {
          CGFloat v15 = [(MKMapView *)self _safeDelegate];
        }
        double v18 = v15;
      }
      else
      {
        double v18 = 0;
      }
      double v19 = [v20 annotation];
      [(MKMapViewDelegate *)v18 mapView:self labelMarker:v19 calloutAccessoryControlTapped:v7];

LABEL_38:
    }
  }
  else
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        int v11 = self->_unsafeDelegate;
      }
      else
      {
        int v11 = [(MKMapView *)self _safeDelegate];
      }
      id v13 = v11;
    }
    else
    {
      id v13 = 0;
    }
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          double v17 = self->_unsafeDelegate;
        }
        else
        {
          double v17 = [(MKMapView *)self _safeDelegate];
        }
        double v18 = v17;
      }
      else
      {
        double v18 = 0;
      }
      [(MKMapViewDelegate *)v18 mapView:self annotationView:v20 calloutAccessoryControlTapped:v7];
      goto LABEL_38;
    }
  }
}

- (void)annotationContainer:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
  id v16 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v16 annotation];
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v6 = self->_unsafeDelegate;
      }
      else
      {
        char v6 = [(MKMapView *)self _safeDelegate];
      }
      double v8 = v6;
    }
    else
    {
      double v8 = 0;
    }
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          int v11 = self->_unsafeDelegate;
        }
        else
        {
          int v11 = [(MKMapView *)self _safeDelegate];
        }
        CGFloat v15 = v11;
      }
      else
      {
        CGFloat v15 = 0;
      }
      [(MKMapViewDelegate *)v15 mapView:self calloutPrimaryActionTriggeredForLabelMarker:v5];
    }
LABEL_38:

    goto LABEL_39;
  }
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v7 = self->_unsafeDelegate;
    }
    else
    {
      id v7 = [(MKMapView *)self _safeDelegate];
    }
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = v16;
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v14 = self->_unsafeDelegate;
      }
      else
      {
        char v14 = [(MKMapView *)self _safeDelegate];
      }
      BOOL v5 = v14;
      id v13 = v16;
    }
    else
    {
      BOOL v5 = 0;
    }
    [v5 mapView:self calloutPrimaryActionTriggeredForAnnotationView:v13];
    goto LABEL_38;
  }
LABEL_39:
}

- (void)calloutDidAppearForAnnotationView:(id)a3 inContainer:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v7 = self->_unsafeDelegate;
    }
    else
    {
      id v7 = [(MKMapView *)self _safeDelegate];
    }
    double v8 = v7;
  }
  else
  {
    double v8 = 0;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v10 = self->_unsafeDelegate;
      }
      else
      {
        char v10 = [(MKMapView *)self _safeDelegate];
      }
      int v11 = v10;
    }
    else
    {
      int v11 = 0;
    }
    [(MKMapViewDelegate *)v11 _mapView:self calloutDidAppearForAnnotationView:v12];
  }
}

- (void)_displayWorld
{
  BOOL v3 = [(MKMapView *)self layer];
  [v3 doubleBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.double x = v5;
  v19.origin.double y = v7;
  v19.size.CGFloat width = v9;
  v19.size.CGFloat height = v11;
  CGFloat v12 = CGRectGetWidth(v19) * 0.0000000037252903;
  v20.origin.double x = v5;
  v20.origin.double y = v7;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v11;
  if (v12 <= CGRectGetHeight(v20) * 0.0000000037252903)
  {
    v22.origin.double x = v5;
    v22.origin.double y = v7;
    v22.size.CGFloat width = v9;
    v22.size.CGFloat height = v11;
    double Height = CGRectGetHeight(v22);
  }
  else
  {
    v21.origin.double x = v5;
    v21.origin.double y = v7;
    v21.size.CGFloat width = v9;
    v21.size.CGFloat height = v11;
    double Height = CGRectGetWidth(v21);
  }
  uint64_t v14 = vcvtmd_s64_f64(log2(Height * 0.0000000037252903) + 0.5);
  if (v14 >= -21) {
    uint64_t v15 = v14 + 21;
  }
  else {
    uint64_t v15 = 0;
  }
  [(MKMapView *)self _minimumZoomLevel];
  if (v15 <= (uint64_t)v16)
  {
    [(MKMapView *)self _minimumZoomLevel];
    uint64_t v15 = (uint64_t)v17;
  }

  -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", 0, 30.0, -40.0, (double)v15);
}

- (void)_performActionAsIfGoingToDefaultLocation:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000uLL;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(void *)&self->_flags &= ~0x8000000000000uLL;
}

- (void)_updateFramingUsingSetRegionBlock:(id)a3
{
  double v4 = (void (**)(void))a3;
  if ([(MKMapView *)self _mustWaitUntilSized]) {
    [(MKMapView *)self _addSetRegionBlock:v4];
  }
  else {
    v4[2]();
  }
}

- (NSArray)annotations
{
  uint64_t v2 = [(MKAnnotationManager *)self->_annotationManager annotations];
  BOOL v3 = _filterLabelMarkersPredicate();
  double v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (CGRect)annotationVisibleRect
{
  annotationContainer = self->_annotationContainer;
  [(MKMapView *)self bounds];

  -[MKAnnotationContainerView convertRect:fromView:](annotationContainer, "convertRect:fromView:", self);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (NSSet)annotationsInMapRect:(MKMapRect)mapRect
{
  double v4 = -[MKAnnotationManager annotationsInMapRect:](self->_annotationManager, "annotationsInMapRect:", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height);
  double v5 = _filterLabelMarkersPredicate();
  double v6 = [v4 filteredSetUsingPredicate:v5];

  if (annotationsInMapRect__once != -1) {
    dispatch_once(&annotationsInMapRect__once, &__block_literal_global_442);
  }
  if (!annotationsInMapRect__shouldIncludeUserLocation
    && [v6 containsObject:self->_userLocation])
  {
    double v7 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
    [v7 removeObject:self->_userLocation];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];

    double v6 = (void *)v8;
  }
  [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:16];

  return (NSSet *)v6;
}

BOOL __34__MKMapView_annotationsInMapRect___block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(257);
  annotationsInMapRect__shouldIncludeUserLocation = result;
  return result;
}

- (NSArray)_annotationViews
{
  return [(MKAnnotationManager *)self->_annotationManager annotationRepresentations];
}

- (NSArray)selectedAnnotations
{
  uint64_t v3 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
  if (v3
    && (double v4 = (void *)v3,
        [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation], double v5 = objc_claimAutoreleasedReturnValue(), objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5, v4, (isKindOfClass & 1) == 0))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    CGFloat v9 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
    double v10 = [v9 annotation];
    double v7 = [v8 arrayWithObject:v10];
  }
  else
  {
    if (qword_1E9154020 != -1) {
      dispatch_once(&qword_1E9154020, &__block_literal_global_446);
    }
    if (byte_1E9153FDA)
    {
      double v7 = objc_msgSend(MEMORY[0x1E4F1CA98], "_mapkit_fakeNil");
    }
    else
    {
      double v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return (NSArray *)v7;
}

BOOL __32__MKMapView_selectedAnnotations__block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(1026);
  byte_1E9153FDA = !result;
  return result;
}

- (void)setSelectedAnnotations:(NSArray *)selectedAnnotations
{
  double v7 = selectedAnnotations;
  uint64_t v4 = [(NSArray *)v7 count];
  annotationManager = self->_annotationManager;
  if (v4)
  {
    double v6 = [(NSArray *)v7 objectAtIndex:0];
    [(MKAnnotationManager *)annotationManager selectAnnotation:v6 animated:0];
  }
  else
  {
    [(MKAnnotationManager *)annotationManager deselectAnnotation:0 animated:0];
  }
}

- (BOOL)_canSelectPOIs
{
  return (*(void *)&self->_flags >> 37) & 1;
}

- (BOOL)_canSelectAllLabels
{
  return (*(void *)&self->_flags >> 38) & 1;
}

- (void)_setCanSelectAllLabels:(BOOL)a3
{
  BOOL v3 = a3;
  labelSelectionFilter = self->_labelSelectionFilter;
  self->_labelSelectionFilter = 0;

  [(VKMapView *)self->_mapView setLabelSelectionFilter:0];
  unint64_t flags = (unint64_t)self->_flags;
  uint64_t v7 = 0x4000000000;
  if (!v3) {
    uint64_t v7 = 0;
  }
  *(void *)&self->_unint64_t flags = flags & 0xFFFFFFBFFFFFFFFFLL | v7;
  mapView = self->_mapView;

  [(VKMapView *)mapView setLabelMarkerSelectionEnabled:(flags >> 37) & 1 | v3];
}

- (void)_deselectLabelMarkerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(MKMapView *)self _selectedLabelMarker];

  if (v5)
  {
    annotationManager = self->_annotationManager;
    id v7 = [(MKMapView *)self _selectedLabelMarker];
    [(MKAnnotationManager *)annotationManager deselectAnnotation:v7 animated:v3];
  }
}

- (void)_selectLabelMarker:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v14 = v6;
    id v7 = [(MKMapView *)self _selectedLabelMarker];

    id v6 = v14;
    if (v7 != v14)
    {
      if ([(MKLabelSelectionFilter *)self->_labelSelectionFilter selectionEnabled])
      {
        uint64_t v8 = [[MKMapFeatureAnnotation alloc] initWithVKLabelMarker:v14 isHybridMap:[(MKMapView *)self _isHybridMap]];
        [(MKMapView *)self addAnnotation:v8];
        [(MKMapView *)self _selectAnnotation:v8 animated:v4];
      }
      else
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          CGFloat v9 = self->_unsafeDelegate;
        }
        else
        {
          CGFloat v9 = [(MKMapView *)self _safeDelegate];
        }
        double v10 = v9;
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          if (qword_1E9154040 != -1) {
            dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
          }
          if (byte_1E9153FDC)
          {
            CGFloat v12 = self->_unsafeDelegate;
          }
          else
          {
            CGFloat v12 = [(MKMapView *)self _safeDelegate];
          }
          id v13 = v12;
          [(MKMapViewDelegate *)v12 mapView:self willSelectLabelMarker:v14];
        }
        [(MKMapView *)self addAnnotation:v14];
        [(MKMapView *)self _selectAnnotation:v14 animated:v4];
      }
      id v6 = v14;
    }
  }
}

- (BOOL)_isHybridMap
{
  BOOL v3 = [(MKMapView *)self preferredConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(MKMapView *)self preferredConfiguration];
    BOOL v5 = [v4 elevationStyle] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_labelMarkerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MKMapView *)self vk_mapLayer];
  id v7 = objc_msgSend(v6, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", -[MKMapView _canSelectAllLabels](self, "_canSelectAllLabels") ^ 1, x, y);

  if (v7
    && (([v7 isSelectable] & 1) != 0 || -[MKMapView _canSelectAllLabels](self, "_canSelectAllLabels")))
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MKMapView *)self vk_mapLayer];
  id v6 = [v5 labelMarkerForCustomFeatureAnnotation:v4];

  return v6;
}

- (void)navigationCameraReturnToPuck
{
}

- (void)selectAnnotation:(id)annotation animated:(BOOL)animated
{
}

- (void)deselectAnnotation:(id)annotation animated:(BOOL)animated
{
}

- (void)_addAnnotation:(id)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (MKUserLocation *)a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    if (self->_userLocation == v6)
    {
      NSLog(&cfstr_WarningPassedM.isa, v6);
      [(MKMapView *)self setShowsUserLocation:1];
    }
    else
    {
      [(MKAnnotationManager *)self->_annotationManager addAnnotation:v6 allowAnimation:v4];
    }
    id v7 = v8;
  }
}

- (void)addAnnotation:(id)annotation
{
  [(MKMapView *)self _addAnnotation:annotation allowAnimation:1];
  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:12];
}

- (void)addAnnotations:(NSArray *)annotations
{
  [(MKAnnotationManager *)self->_annotationManager addAnnotations:annotations];
  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:13];
}

- (void)_addAnnotations:(id)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MKMapView *)self _addAnnotation:*(void *)(*((void *)&v11 + 1) + 8 * v10++) allowAnimation:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeAnnotation:(id)annotation
{
  id v4 = annotation;
  if (v4)
  {
    id v6 = v4;
    id v5 = [(MKMapView *)self userLocation];

    id v4 = v6;
    if (v5 != v6)
    {
      [(MKAnnotationManager *)self->_annotationManager removeAnnotation:v6];
      [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:14];
      id v4 = v6;
    }
  }
}

- (void)removeAnnotations:(NSArray *)annotations
{
  long long v11 = annotations;
  id v4 = [(MKMapView *)self userLocation];
  BOOL v5 = [(NSArray *)v11 containsObject:v4];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = [(MKMapView *)self userLocation];
    uint64_t v8 = [v6 arrayWithObject:v7];
    uint64_t v9 = [(NSArray *)v11 arrayByExcludingObjectsInArray:v8];

    uint64_t v10 = (void *)v9;
  }
  else
  {
    uint64_t v10 = v11;
  }
  id v12 = v10;
  [(MKAnnotationManager *)self->_annotationManager removeAnnotations:v10];
  [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:15];
}

- (void)_replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[MKAnnotationManager replaceAnnotation:withAnnotation:](self->_annotationManager, "replaceAnnotation:withAnnotation:");
    }
  }
}

- (void)_addViewsForAnnotations:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(MKAnnotationManager *)self->_annotationManager addRepresentationsForAnnotations:v4];
  }
}

- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier
{
  return (MKAnnotationView *)[(MKAnnotationManager *)self->_annotationManager dequeueReusableAnnotationRepresentationWithIdentifier:identifier];
}

- (MKAnnotationView)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier forAnnotation:(id)annotation
{
  id v6 = identifier;
  id v7 = annotation;
  uint64_t v8 = [(MKAnnotationManager *)self->_annotationManager dequeueReusableAnnotationRepresentationWithIdentifier:v6];
  uint64_t v9 = v8;
  if (v8) {
    [v8 setAnnotation:v7];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to dequeue an annotation view with identifier %@ - must register a class for the identifier", v6 format];
  }

  return (MKAnnotationView *)v9;
}

- (void)registerClass:(Class)viewClass forAnnotationViewWithReuseIdentifier:(NSString *)identifier
{
}

- (MKAnnotationView)viewForAnnotation:(id)annotation
{
  return (MKAnnotationView *)[(MKAnnotationManager *)self->_annotationManager representationForAnnotation:annotation];
}

- (BOOL)_annotationViewsAreAddedImmediately
{
  return [(MKAnnotationManager *)self->_annotationManager annotationRepresentationsAreAddedImmediately];
}

- (void)set_annotationViewsAreAddedImmediately:(BOOL)a3
{
}

- (BOOL)_allowsPopoverWhenNotInWindow
{
  return 1;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)coordinate toPointToView:(UIView *)view
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  usageCounter = self->_usageCounter;
  uint64_t v8 = view;
  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:30];
  -[MKMapView _convertCoordinate:toPointToView:](self, "_convertCoordinate:toPointToView:", v8, latitude, longitude);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)point toCoordinateFromView:(UIView *)view
{
  double y = point.y;
  double x = point.x;
  usageCounter = self->_usageCounter;
  uint64_t v8 = view;
  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:29];
  -[MKMapView _convertPoint:toCoordinateFromView:](self, "_convertPoint:toCoordinateFromView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double longitude = v14;
  result.double latitude = v13;
  return result;
}

- (CGRect)convertRegion:(MKCoordinateRegion)region toRectToView:(UIView *)view
{
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  usageCounter = self->_usageCounter;
  double v10 = view;
  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:32];
  -[MKMapView _convertRegion:toRectToView:](self, "_convertRegion:toRectToView:", v10, latitude, longitude, latitudeDelta, longitudeDelta);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (MKCoordinateRegion)convertRect:(CGRect)rect toRegionFromView:(UIView *)view
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  usageCounter = self->_usageCounter;
  double v10 = view;
  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:31];
  -[MKMapView _convertRect:toRegionFromView:](self, "_convertRect:toRegionFromView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.span.double longitudeDelta = v22;
  result.span.double latitudeDelta = v21;
  result.center.double longitude = v20;
  result.center.double latitude = v19;
  return result;
}

- (void)_enter3DMode
{
  [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:[(MKMapView *)self _canShowFlyover]];
  [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    [v5 mapView:self didPerformPitchAction:1];
  }
  mapView = self->_mapView;

  [(VKMapView *)mapView enter3DMode];
}

- (void)_exit3DMode
{
  [(MKBasicMapView *)self->_basicMapView updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:[(MKMapView *)self _canShowFlyover]];
  [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    [v5 mapView:self didPerformPitchAction:0];
  }
  mapView = self->_mapView;

  [(VKMapView *)mapView exit3DMode];
}

- (void)_enterARMode
{
  [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
  [(VKMapView *)self->_mapView centerCoordinate];
  VKLocationCoordinate2DMake();
  mapView = self->_mapView;

  -[VKMapView enterARModeAtCoordinate:](mapView, "enterARModeAtCoordinate:");
}

- (void)_enterARModeWithLocation:(id)a3
{
  id v13 = a3;
  if (v13 && ([v13 placemark], char v4 = [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
  {
    id v5 = [v13 placemark];
    [v5 coordinate];
    id v6 = [v13 placemark];
    [v6 coordinate];
    VKLocationCoordinate2DMake();
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    [(VKMapView *)self->_mapView centerCoordinate];
    VKLocationCoordinate2DMake();
    double v8 = v11;
    double v10 = v12;
  }
  -[VKMapView enterARModeAtCoordinate:](self->_mapView, "enterARModeAtCoordinate:", v8, v10);
}

- (void)_exitARMode
{
  [(MKMapGestureController *)self->_gestureController stopDynamicAnimations];
  mapView = self->_mapView;

  [(VKMapView *)mapView exitARMode];
}

- (BOOL)_canEnter3DModeFlyover
{
  return [(VKMapView *)self->_mapView canEnter3DModeFlyoverForTileSize:128];
}

- (BOOL)_canEnterNightMode
{
  return [(VKMapView *)self->_mapView supportsNightMode];
}

- (BOOL)_loadLookAroundAvailability
{
  return [(VKMapView *)self->_mapView loadMuninAvailability];
}

- ($FF918C85BF8E73478720C66798E418D4)_userTrackingBehavior
{
  MKCoordinateRegion result = ($FF918C85BF8E73478720C66798E418D4 *)self->_mapView;
  if (result) {
    return ($FF918C85BF8E73478720C66798E418D4 *)[($FF918C85BF8E73478720C66798E418D4 *)result annotationTrackingBehavior];
  }
  *(void *)&retstr->double var0 = 0;
  retstr->double var1 = 0.0;
  *(void *)&retstr->var2 = 0;
  return result;
}

- (void)_setUserTrackingBehavior:(id *)a3
{
  $FF918C85BF8E73478720C66798E418D4 v3 = *a3;
  [(VKMapView *)self->_mapView setAnnotationTrackingBehavior:&v3];
}

- (void)_setApplicationState:(int)a3
{
}

- (int64_t)_displayedSearchResultsType
{
  return [(VKMapView *)self->_mapView displayedSearchResultsType];
}

+ (int64_t)_defaultOverlayLevel
{
  return +[MKOverlayContainerView _defaultOverlayLevel];
}

- (void)_addVectorOverlay:(id)a3
{
}

- (void)_removeVectorOverlay:(id)a3
{
}

- (void)_removePersistentVectorOverlay:(id)a3
{
}

- (void)_willChangeStatusBarFrame:(id)a3
{
  if (!_MKLinkedOnOrAfterReleaseSet(2310))
  {
    char v4 = (void *)MEMORY[0x1E4F42FF0];
    id v5 = [MEMORY[0x1E4F42738] sharedApplication];
    [v5 statusBarOrientationAnimationDuration];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __39__MKMapView__willChangeStatusBarFrame___block_invoke;
    v6[3] = &unk_1E54B8188;
    v6[4] = self;
    objc_msgSend(v4, "animateWithDuration:animations:", v6);
  }
}

uint64_t __39__MKMapView__willChangeStatusBarFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInsetsWithForce:0];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKMapView;
  -[MKMapView setHidden:](&v5, sel_setHidden_);
  if (self->_internal) {
    [(MKBasicMapView *)self->_basicMapView setHidden:v3];
  }
}

- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(MKMapView *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  v37.CGFloat height = v15;
  double rect_8 = v15;
  v37.CGFloat width = v13;
  UIGraphicsBeginImageContextWithOptions(v37, 1, 0.0);
  double v16 = [(MKMapView *)self layer];
  [v16 renderInContext:UIGraphicsGetCurrentContext()];

  double v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CurrentContext = UIGraphicsGetCurrentContext();
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat v19 = CGRectGetHeight(v38);
  CGContextTranslateCTM(CurrentContext, 0.0, v19);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v39.origin.CGFloat x = x;
  CGFloat v32 = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v30 = CGRectGetWidth(v39);
  CGFloat rect = v10;
  v40.origin.CGFloat x = v10;
  v40.origin.CGFloat y = v12;
  v40.size.CGFloat width = v14;
  v40.size.CGFloat height = rect_8;
  double v31 = v30 / CGRectGetWidth(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v20 = CGRectGetHeight(v41);
  v42.origin.CGFloat x = v10;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v14;
  v42.size.CGFloat height = rect_8;
  double v21 = v20 / CGRectGetHeight(v42);
  CGFloat v22 = x;
  if (v31 < v21) {
    double v21 = v31;
  }
  CGFloat v23 = v14 * v21;
  CGFloat v24 = rect_8 * v21;
  v43.origin.CGFloat x = v32;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v25 = CGRectGetWidth(v43);
  v44.origin.CGFloat x = rect;
  v44.origin.CGFloat y = v12;
  v44.size.CGFloat width = v23;
  v44.size.CGFloat height = v24;
  CGFloat v26 = (v25 - CGRectGetWidth(v44)) * 0.5;
  v45.origin.CGFloat x = v22;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v27 = CGRectGetHeight(v45);
  v46.origin.CGFloat x = v26;
  v46.origin.CGFloat y = v12;
  v46.size.CGFloat width = v23;
  v46.size.CGFloat height = v24;
  CGFloat v28 = (v27 - CGRectGetHeight(v46)) * 0.5;
  id rect_8a = v17;
  double v29 = (CGImage *)[rect_8a CGImage];
  v47.origin.CGFloat x = v26;
  v47.origin.CGFloat y = v28;
  v47.size.CGFloat width = v23;
  v47.size.CGFloat height = v24;
  CGContextDrawImage(CurrentContext, v47, v29);
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated
{
  BOOL v4 = animated;
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__MKMapView_setCenterCoordinate_animated___block_invoke;
    _OWORD v14[3] = &unk_1E54B89E8;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&latitude;
    v15[2] = *(id *)&longitude;
    [(MKMapView *)self _addDependentSetRegionBlock:v14];
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    if (longitude < -180.0 || longitude > 180.0 || latitude < -90.0 || latitude > 90.0)
    {
      CGFloat v10 = NSString;
      double v11 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
      id v13 = [v10 stringWithFormat:@"Invalid Coordinate %@", v11];

      CGFloat v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
      [v12 raise];
    }
    else
    {
      double v8 = [(MKMapView *)self camera];
      id v13 = (id)[v8 copy];

      objc_msgSend(v13, "setCenterCoordinate:", latitude, longitude);
      char v9 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
      if (!v4 || (v9 & 1) != 0) {
        [(MKMapView *)self setCamera:v13];
      }
      else {
        [(MKMapView *)self setCamera:v13 animated:1];
      }
    }
  }
}

void __42__MKMapView_setCenterCoordinate_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCenterCoordinate:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
{
  double longitude = centerCoordinate.longitude;
  double latitude = centerCoordinate.latitude;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");

  -[MKMapView setCenterCoordinate:animated:](self, "setCenterCoordinate:animated:", v6, latitude, longitude);
}

void __32__MKMapView_setRegion_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRegion:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setRegion:(MKCoordinateRegion)region
{
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");

  -[MKMapView setRegion:animated:](self, "setRegion:animated:", v8, latitude, longitude, latitudeDelta, longitudeDelta);
}

- (MKCoordinateRegion)regionThatFits:(MKCoordinateRegion)region
{
  CLLocationDegrees longitudeDelta = region.span.longitudeDelta;
  CLLocationDegrees latitudeDelta = region.span.latitudeDelta;
  CLLocationDegrees longitude = region.center.longitude;
  CLLocationDegrees latitude = region.center.latitude;
  MKMapType v4 = [(MKMapView *)self mapType];
  [(MKMapView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:33];
  [(MKMapView *)self _edgeInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(MKMapView *)self _minimumZoomLevel];
  uint64_t v18 = v17;
  [(MKMapView *)self _maximumZoomLevel];
  uint64_t v20 = v19;
  double v21 = +[MKSystemController sharedInstance];
  if ([v21 supports3DMaps])
  {
    uint64_t v22 = 0;
  }
  else
  {
    CGFloat v23 = [MEMORY[0x1E4FB3A58] sharedPlatform];
    uint64_t v22 = [v23 supportsHiResRTT] ^ 1;
  }
  +[MKMapView _regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_regionThatFitsMapType:viewSize:viewInsets:edgePadding:region:minZoomLevel:maxZoomLevel:snapToZoomLevel:", v4, v22, v6, v8, v10, v12, v14, v16, *MEMORY[0x1E4F437F8], *(void *)(MEMORY[0x1E4F437F8] + 8), *(void *)(MEMORY[0x1E4F437F8] + 16), *(void *)(MEMORY[0x1E4F437F8] + 24), *(void *)&latitude, *(void *)&longitude, *(void *)&latitudeDelta, *(void *)&longitudeDelta, v18,
    v20);
  result.span.CLLocationDegrees longitudeDelta = v27;
  result.span.CLLocationDegrees latitudeDelta = v26;
  result.center.CLLocationDegrees longitude = v25;
  result.center.CLLocationDegrees latitude = v24;
  return result;
}

- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets
{
  CGFloat right = insets.right;
  CGFloat bottom = insets.bottom;
  CGFloat left = insets.left;
  CGFloat top = insets.top;
  [(MKMapView *)self _minimumZoomLevel];
  uint64_t v31 = v5;
  [(MKMapView *)self _maximumZoomLevel];
  uint64_t v30 = v6;
  [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:34];
  [(MKMapView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MKMapView *)self _edgeInsets];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  CGFloat v23 = +[MKSystemController sharedInstance];
  if ([v23 supports3DMaps])
  {
    uint64_t v24 = 0;
  }
  else
  {
    double v25 = [MEMORY[0x1E4FB3A58] sharedPlatform];
    uint64_t v24 = [v25 supportsHiResRTT] ^ 1;
  }
  +[MKMapView _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", v24, v8, v10, v12, v14, mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, v16, v18, v20, v22, *(void *)&top, *(void *)&left, *(void *)&bottom, *(void *)&right,
    v31,
    v30);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (MKMapRect)mapRectThatFits:(MKMapRect)mapRect
{
  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

void __75__MKMapView__setZoomScale_centerMapPoint_duration_timingFunction_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setZoomScale:centerMapPoint:duration:timingFunction:animated:", 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_setZoomScale:(double)a3 centerCoordinate:(CLLocationCoordinate2D)a4 duration:(double)a5 timingFunction:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v15 = a6;
  double v13 = MKTilePointForCoordinate(latitude, longitude, 21.0);
  -[MKMapView _setZoomScale:centerMapPoint:duration:timingFunction:animated:](self, "_setZoomScale:centerMapPoint:duration:timingFunction:animated:", v15, v7, a3, v13, v14, a5);
}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5
{
}

- (void)_goToMapRegion:(id)a3 duration:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
}

uint64_t __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke(uint64_t a1)
{
  GEOMapRectForMapRegion();
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 456);

  return objc_msgSend(v2, "showAnnotationsInMapRect:");
}

uint64_t __79__MKMapView__goToMapRegion_duration_timingFunction_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_solveForInput:");
}

- (void)setVisibleMapRect:(MKMapRect)mapRect edgePadding:(UIEdgeInsets)insets animated:(BOOL)animate
{
  BOOL v5 = animate;
  double right = insets.right;
  double bottom = insets.bottom;
  double left = insets.left;
  double top = insets.top;
  double height = mapRect.size.height;
  double width = mapRect.size.width;
  double y = mapRect.origin.y;
  double x = mapRect.origin.x;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(location, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__MKMapView_setVisibleMapRect_edgePadding_animated___block_invoke;
    v29[3] = &unk_1E54B8A88;
    objc_copyWeak(v30, location);
    v30[1] = *(id *)&x;
    v30[2] = *(id *)&y;
    v30[3] = *(id *)&width;
    v30[4] = *(id *)&height;
    v30[5] = *(id *)&top;
    v30[6] = *(id *)&left;
    v30[7] = *(id *)&bottom;
    v30[8] = *(id *)&right;
    [(MKMapView *)self _addSetRegionBlock:v29];
    objc_destroyWeak(v30);
    objc_destroyWeak(location);
  }
  else
  {
    [(MKMapView *)self visibleMapRect];
    BOOL v21 = x == v18 && y == v15 && width == v16 && height == v17;
    if (v21
      && (left == *(double *)(MEMORY[0x1E4F437F8] + 8) ? (BOOL v25 = top == *MEMORY[0x1E4F437F8]) : (BOOL v25 = 0),
          v25 ? (BOOL v26 = right == *(double *)(MEMORY[0x1E4F437F8] + 24)) : (BOOL v26 = 0),
          v26 ? (BOOL v27 = bottom == *(double *)(MEMORY[0x1E4F437F8] + 16)) : (BOOL v27 = 0),
          v27))
    {
      double v28 = MKGetMKMapViewLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_DEBUG, "MKMapView: setVisibleMapRect:edgePadding:animated: requested rect is equal to existing rect", (uint8_t *)location, 2u);
      }
    }
    else
    {
      -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", -1, -1, x, y, width, height, top, left, bottom, right);
      -[MKMapView _goToCenterCoordinate:zoomLevel:animated:](self, "_goToCenterCoordinate:zoomLevel:animated:", v5, v23, v24, v22);
    }
  }
}

void __52__MKMapView_setVisibleMapRect_edgePadding_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (void)_setVisibleMapRect:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = a5;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__MKMapView__setVisibleMapRect_animated_completionHandler___block_invoke;
    v18[3] = &unk_1E54B8A10;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&v9;
    v19[2] = *(id *)&v8;
    v19[3] = *(id *)&var0;
    v19[4] = *(id *)&var1;
    [(MKMapView *)self _addSetRegionBlock:v18 completion:v11];
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView mapRectThatFits:](self, "mapRectThatFits:", v9, v8, var0, var1);
    double v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v12, v13, v14, v15);
    double v17 = 0.0;
    if (v5) {
      -[VKMapView durationToAnimateToMapRegion:](self->_mapView, "durationToAnimateToMapRegion:", v16, 0.0);
    }
    [(MKMapView *)self _goToMapRegion:v16 duration:v5 animated:v11 completionHandler:v17];
  }
}

void __59__MKMapView__setVisibleMapRect_animated_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
}

- (void)_setVisibleMapRect:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = a5;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__MKMapView__setVisibleMapRect_duration_completionHandler___block_invoke;
    v17[3] = &unk_1E54B8A10;
    objc_copyWeak(v18, &location);
    v18[1] = *(id *)&v9;
    v18[2] = *(id *)&v8;
    v18[3] = *(id *)&var0;
    void v18[4] = *(id *)&var1;
    [(MKMapView *)self _addSetRegionBlock:v17 completion:v11];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView mapRectThatFits:](self, "mapRectThatFits:", v9, v8, var0, var1);
    double v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v12, v13, v14, v15);
    [(MKMapView *)self _goToMapRegion:v16 duration:a4 > 0.0 animated:v11 completionHandler:a4];
  }
}

void __59__MKMapView__setVisibleMapRect_duration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
}

- (void)setVisibleMapRect:(MKMapRect)visibleMapRect
{
  double height = visibleMapRect.size.height;
  double width = visibleMapRect.size.width;
  double y = visibleMapRect.origin.y;
  double x = visibleMapRect.origin.x;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  double v9 = *MEMORY[0x1E4F437F8];
  double v10 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);

  -[MKMapView setVisibleMapRect:edgePadding:animated:](self, "setVisibleMapRect:edgePadding:animated:", v8, x, y, width, height, v9, v10, v11, v12);
}

- (void)setVisibleMapRect:(MKMapRect)mapRect animated:(BOOL)animate
{
}

- (double)_defaultAnimationDurationForMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  -[MKMapView _zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:](self, "_zoomRegionForMapRect:edgePadding:maxZoomLevel:minZoomLevel:", -1, -1, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, a4.top, a4.left, a4.bottom, a4.right);
  double v6 = v5;
  double v8 = v7;
  double v9 = -1.0;
  if (v10 != -1.0)
  {
    -[MKMapView _boundedZoomLevel:](self, "_boundedZoomLevel:");
    double v9 = v11;
  }
  double v12 = -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", v6, v8, (double)(1.0 / exp2(21.0 - v9)));
  [(VKMapView *)self->_mapView durationToAnimateToMapRegion:v12];
  double v14 = v13;

  return v14;
}

- (double)_panDurationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return fmin(fmax(sqrt((a4.x - a3.x) * (a4.x - a3.x) + (a4.y - a3.y) * (a4.y - a3.y)) * 0.00156250002, 0.200000003), 1.0);
}

- (double)_zoomScaleForMapRegion:(id)a3
{
  GEOMapRectForMapRegion();
  double v5 = v4;
  double v7 = v6;
  [(VKMapView *)self->_mapView mapRegionBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(MKMapView *)self _edgeInsets];
  CGFloat v17 = v9 + v16;
  CGFloat v19 = v11 + v18;
  CGFloat v21 = v13 - (v16 + v20);
  CGFloat v23 = v15 - (v18 + v22);
  memset(&v27, 0, sizeof(v27));
  [(VKMapView *)self->_mapView presentationYaw];
  CGAffineTransformMakeRotation(&v27, v24 * -0.0174532925);
  CGAffineTransform v26 = v27;
  v28.origin.double x = v17;
  v28.origin.double y = v19;
  v28.size.double width = v21;
  v28.size.double height = v23;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v26);
  double result = v29.size.width / v5;
  if (v29.size.width / v5 >= v29.size.height / v7) {
    double result = v29.size.height / v7;
  }
  if (fabs(result) == INFINITY) {
    return 0.001953125;
  }
  return result;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__MKMapView_setCenterCoordinate_zoomLevel_animated___block_invoke;
    v20[3] = &unk_1E54B8AD8;
    objc_copyWeak(v21, &location);
    v21[1] = *(id *)&latitude;
    v21[2] = *(id *)&longitude;
    v21[3] = *(id *)&a4;
    BOOL v22 = v5;
    [(MKMapView *)self _addSetRegionBlock:v20];
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapView _mapRegionWithCenterCoordinate:zoomScale:](self, "_mapRegionWithCenterCoordinate:zoomScale:", latitude, longitude, (double)(1.0 / exp2(21.0 - a4)));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    double v10 = 0.0;
    if (v5)
    {
      double v11 = [(MKMapView *)self vk_mapLayer];
      [v11 durationToAnimateToMapRegion:v19];
      double v10 = v12;
    }
    double v13 = [(MKMapView *)self vk_mapLayer];
    double v14 = [(MKMapView *)self vk_mapLayer];
    [v14 pitch];
    double v16 = v15;
    CGFloat v17 = [(MKMapView *)self vk_mapLayer];
    [v17 yaw];
    [v13 setMapRegion:v19 pitch:0 yaw:v16 duration:v18 completion:v10];
  }
}

void __52__MKMapView_setCenterCoordinate_zoomLevel_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCenterCoordinate:zoomLevel:animated:", *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (UILayoutGuide)_edgeInsetsLayoutGuide
{
  void v27[4] = *MEMORY[0x1E4F143B8];
  edgeInsetsGuide = self->_edgeInsetsGuide;
  if (!edgeInsetsGuide)
  {
    double v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    BOOL v5 = self->_edgeInsetsGuide;
    self->_edgeInsetsGuide = v4;

    [(UILayoutGuide *)self->_edgeInsetsGuide setIdentifier:@"Edge Insets"];
    double v6 = [(UILayoutGuide *)self->_edgeInsetsGuide topAnchor];
    double v7 = [(MKMapView *)self topAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7 constant:self->_edgeInsets.top];
    edgeInsetsTopConstraint = self->_edgeInsetsTopConstraint;
    self->_edgeInsetsTopConstraint = v8;

    double v10 = [(UILayoutGuide *)self->_edgeInsetsGuide leftAnchor];
    double v11 = [(MKMapView *)self leftAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11 constant:self->_edgeInsets.left];
    edgeInsetsLeftConstraint = self->_edgeInsetsLeftConstraint;
    self->_edgeInsetsLeftConstraint = v12;

    double v14 = [(UILayoutGuide *)self->_edgeInsetsGuide rightAnchor];
    double v15 = [(MKMapView *)self rightAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:-self->_edgeInsets.right];
    edgeInsetsRightConstraint = self->_edgeInsetsRightConstraint;
    self->_edgeInsetsRightConstraint = v16;

    double v18 = [(UILayoutGuide *)self->_edgeInsetsGuide bottomAnchor];
    id v19 = [(MKMapView *)self bottomAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19 constant:-self->_edgeInsets.bottom];
    edgeInsetsBottomConstraint = self->_edgeInsetsBottomConstraint;
    self->_edgeInsetsBottomConstraint = v20;

    [(UIView *)self->_contentView addLayoutGuide:self->_edgeInsetsGuide];
    BOOL v22 = (void *)MEMORY[0x1E4F28DC8];
    CGFloat v23 = self->_edgeInsetsLeftConstraint;
    v27[0] = self->_edgeInsetsTopConstraint;
    v27[1] = v23;
    double v24 = self->_edgeInsetsBottomConstraint;
    void v27[2] = self->_edgeInsetsRightConstraint;
    v27[3] = v24;
    BOOL v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v22 activateConstraints:v25];

    edgeInsetsGuide = self->_edgeInsetsGuide;
  }

  return edgeInsetsGuide;
}

void __37__MKMapView__setEdgeInsets_explicit___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      WeakRetained[124] &= ~0x1000000uLL;
      if (*((unsigned char *)WeakRetained + 1129))
      {
        *((unsigned char *)WeakRetained + 1129) = 0;
        double v4 = WeakRetained;
        [WeakRetained _updateInsetsWithForce:0];
        id WeakRetained = v4;
      }
    }
  }
}

- (id)venueWithID:(unint64_t)a3
{
  return (id)[(VKMapView *)self->_mapView venueWithID:a3];
}

- (VKVenueBuildingFeatureMarker)venueBuildingWithFocus
{
  return (VKVenueBuildingFeatureMarker *)[(VKMapView *)self->_mapView venueBuildingWithFocus];
}

- (void)setDimmingOutsideVenueWithFocus:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VKMapView *)self->_mapView isDimmingBaseMap] != a3)
  {
    mapView = self->_mapView;
    [(VKMapView *)mapView setDimmingBaseMap:v3];
  }
}

- (BOOL)_isDimmingOutsideVenueWithFocus
{
  return [(VKMapView *)self->_mapView isDimmingBaseMap];
}

- (double)zoomToFocusVenue:(id)a3
{
  [(VKMapView *)self->_mapView zoomToRevealVenueFloorplan:a3];
  double v5 = v4;

  [(MKMapView *)self _mapKitZoomLevelForVectorKitTileZoomLevel:v5];
  return result;
}

- (double)zoomToFocusVenueBuilding:(id)a3
{
  [(VKMapView *)self->_mapView zoomToRevealVenueBuildingFloorplan:a3];
  double v5 = v4;

  [(MKMapView *)self _mapKitZoomLevelForVectorKitTileZoomLevel:v5];
  return result;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forBuildingsInVenue:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 venueID] == self->_cachedVenueIDWithFocus) {
    self->_cachedDisplayedFloorOrdinalForVenueWithFocus = v4;
  }
  int v7 = [(MKMapView *)self displayedFloorOrdinalForBuildingsInVenue:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v8 = objc_msgSend(v6, "buildings", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        [(VKMapView *)self->_mapView setDisplayedFloorOrdinal:v4 forVenueBuilding:*(void *)(*((void *)&v18 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if (v7 != v4)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v13 = self->_unsafeDelegate;
    }
    else
    {
      double v13 = [(MKMapView *)self _safeDelegate];
    }
    double v14 = v13;
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v16 = self->_unsafeDelegate;
      }
      else
      {
        double v16 = [(MKMapView *)self _safeDelegate];
      }
      CGFloat v17 = v16;
      [(MKMapViewDelegate *)v16 mapView:self didChangeDisplayedFloorOrdinal:v4 forVenue:v6];
    }
  }
}

- (void)resetDisplayedFloorOrdinalForAllVenues
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VKMapView *)self->_mapView clearVenueBuildingFloorSelections];
  if ([v3 count])
  {
    uint64_t v4 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v24 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "venueID", v24));
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v14), "unsignedLongLongValue", v24);
          double v16 = [(VKMapView *)self->_mapView venueWithID:v15];
          if (v16)
          {
            uint64_t v17 = [(MKMapView *)self displayedFloorOrdinalForBuildingsInVenue:v16];
            uint64_t v18 = v17;
            if (v15 == self->_cachedVenueIDWithFocus) {
              self->_cachedDisplayedFloorOrdinalForVenueWithFocus = v17;
            }
            if (qword_1E9154040 != -1) {
              dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
            }
            if (byte_1E9153FDC)
            {
              long long v19 = self->_unsafeDelegate;
            }
            else
            {
              long long v19 = [(MKMapView *)self _safeDelegate];
            }
            long long v20 = v19;
            char v21 = objc_opt_respondsToSelector();

            if (v21)
            {
              if (qword_1E9154040 != -1) {
                dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
              }
              if (byte_1E9153FDC)
              {
                BOOL v22 = self->_unsafeDelegate;
              }
              else
              {
                BOOL v22 = [(MKMapView *)self _safeDelegate];
              }
              uint64_t v23 = v22;
              [(MKMapViewDelegate *)v22 mapView:self didChangeDisplayedFloorOrdinal:v18 forVenue:v16];
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v12);
    }

    BOOL v3 = v24;
  }
}

- (signed)displayedFloorOrdinalForBuildingsInVenue:(id)a3
{
  uint64_t v4 = [a3 buildings];
  id v5 = [v4 firstObject];

  if (v5) {
    signed __int16 v6 = [(VKMapView *)self->_mapView displayedFloorOrdinalForVenueBuilding:v5];
  }
  else {
    signed __int16 v6 = 0;
  }

  return v6;
}

- (BOOL)displayedFloorIsDefaultForBuildingsInVenue:(id)a3
{
  uint64_t v4 = [a3 buildings];
  id v5 = [v4 firstObject];

  if (v5) {
    char v6 = [(VKMapView *)self->_mapView displayedFloorIsDefaultForVenueBuilding:v5];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (signed)defaultFloorForBuildingsInVenue:(id)a3
{
  uint64_t v4 = [a3 buildings];
  id v5 = [v4 firstObject];

  if (v5) {
    signed __int16 v6 = [(VKMapView *)self->_mapView defaultFloorOrdinalForVenueBuilding:v5];
  }
  else {
    signed __int16 v6 = 0;
  }

  return v6;
}

- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3
{
}

- (void)deselectVenuePoiFeatureId
{
}

- (void)setSelectedTrailId:(unint64_t)a3
{
}

- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
}

- (void)deselectTrails
{
}

- (void)requestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a3
{
  mapView = self->_mapView;
  VKLocationCoordinate2DMake();

  -[VKMapView requestHikingToolTipRegionIDForLocation:](mapView, "requestHikingToolTipRegionIDForLocation:");
}

- (void)_prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __49__MKMapView__prepareFlyoverAnimation_completion___block_invoke;
    void v8[3] = &unk_1E54B8B00;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v7;
    [(MKMapView *)self _addDependentAuxiliaryBlock:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VKMapView *)self->_mapView prepareFlyoverAnimation:v6 completion:v7];
  }
}

void __49__MKMapView__prepareFlyoverAnimation_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _prepareFlyoverAnimation:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_performFlyoverAnimation:(id)a3
{
}

- (void)_performFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke;
    id v15[3] = &unk_1E54B8B28;
    objc_copyWeak(&v17, &location);
    id v16 = v6;
    BOOL v18 = v4;
    [(MKMapView *)self _addDependentAuxiliaryBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v7 = [(MKMapView *)self showsUserLocation];
    BOOL v8 = [(MKMapView *)self isCompassEnabled];
    [(MKMapView *)self setCompassEnabled:0];
    BOOL v9 = [(MKMapView *)self showsScale];
    [(MKMapView *)self setShowsScale:0];
    [(MKMapView *)self setShowsCompass:0];
    [(MKMapView *)self setShowsUserLocation:0];
    mapView = self->_mapView;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke_2;
    v11[3] = &unk_1E54B8B50;
    v11[4] = self;
    BOOL v12 = v8;
    BOOL v13 = v9;
    BOOL v14 = v7;
    [(VKMapView *)mapView startFlyoverAnimation:v6 animateToStart:v4 completion:v11];
  }
}

void __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performFlyoverAnimation:*(void *)(a1 + 32) animateToStart:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __53__MKMapView__performFlyoverAnimation_animateToStart___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompassEnabled:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setShowsScale:*(unsigned __int8 *)(a1 + 41)];
  [*(id *)(a1 + 32) setShowsCompass:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 42);
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 setShowsUserLocation:v2];
}

- (void)_startFlyoverTourAnimation:(unint64_t)a3 duration:(double)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke;
    v23[3] = &unk_1E54B8B78;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a3;
    v25[2] = *(id *)&a4;
    id v24 = v8;
    [(MKMapView *)self _addDependentAuxiliaryBlock:v23];

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v9 = [(MKMapView *)self showsUserLocation];
    BOOL v10 = [(MKMapView *)self showsCompass];
    [(MKMapView *)self setCompassEnabled:0];
    BOOL v11 = [(MKMapView *)self showsScale];
    [(MKMapView *)self setShowsScale:0];
    [(MKMapView *)self setShowsCompass:0];
    [(MKMapView *)self setShowsUserLocation:0];
    BOOL v12 = [[MKMapItemIdentifier alloc] initWithMUID:a3];
    BOOL v13 = +[MKMapService sharedService];
    v27[0] = v12;
    BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    uint64_t v15 = [v13 ticketForIdentifiers:v14 traits:0];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_2;
    v16[3] = &unk_1E54B8BF0;
    double v18 = a4;
    v16[4] = self;
    BOOL v20 = v10;
    BOOL v21 = v11;
    BOOL v22 = v9;
    id v17 = v8;
    unint64_t v19 = a3;
    [v15 submitWithHandler:v16 networkActivity:0];
  }
}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startFlyoverTourAnimation:*(void *)(a1 + 48) duration:*(void *)(a1 + 32) completion:*(double *)(a1 + 56)];
}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 664);
    uint64_t v6 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_6;
    _OWORD v14[3] = &unk_1E54B8BA0;
    void v14[4] = v4;
    char v16 = *(unsigned char *)(a1 + 64);
    __int16 v17 = *(_WORD *)(a1 + 65);
    id v15 = *(id *)(a1 + 40);
    [v5 startFlyoverTourAnimation:v6 animateToStart:1 completion:v14];
  }
  else
  {
    BOOL v7 = [a2 firstObject];
    if ([v7 _hasFlyover])
    {
      double v8 = *(double *)(a1 + 48);
      BOOL v9 = *(void **)(*(void *)(a1 + 32) + 664);
      BOOL v10 = [v7 _flyover];
      if (v8 <= 0.0)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_5;
        v18[3] = &unk_1E54B8BA0;
        BOOL v13 = *(void **)(a1 + 40);
        void v18[4] = *(void *)(a1 + 32);
        char v20 = *(unsigned char *)(a1 + 64);
        __int16 v21 = *(_WORD *)(a1 + 65);
        BOOL v12 = &v19;
        id v19 = v13;
        [v9 startFlyoverAnimation:v10 animateToStart:1 completion:v18];
      }
      else
      {
        double v11 = *(double *)(a1 + 48);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_3;
        v22[3] = &unk_1E54B8BC8;
        v22[4] = *(void *)(a1 + 32);
        BOOL v12 = &v23;
        id v23 = v7;
        char v25 = *(unsigned char *)(a1 + 64);
        __int16 v26 = *(_WORD *)(a1 + 65);
        id v24 = *(id *)(a1 + 40);
        [v9 moveToFlyoverTourStartPosition:v10 duration:v22 completion:v11];

        BOOL v10 = v24;
      }
    }
  }
}

void __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 664);
  BOOL v3 = [*(id *)(a1 + 40) _flyover];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_4;
  _OWORD v4[3] = &unk_1E54B8BA0;
  v4[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 56);
  __int16 v7 = *(_WORD *)(a1 + 57);
  id v5 = *(id *)(a1 + 48);
  [v2 startFlyoverAnimation:v3 animateToStart:0 completion:v4];
}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompassEnabled:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsScale:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(a1 + 32) setShowsCompass:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsUserLocation:*(unsigned __int8 *)(a1 + 50)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompassEnabled:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsScale:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(a1 + 32) setShowsCompass:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsUserLocation:*(unsigned __int8 *)(a1 + 50)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __60__MKMapView__startFlyoverTourAnimation_duration_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompassEnabled:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsScale:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(a1 + 32) setShowsCompass:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setShowsUserLocation:*(unsigned __int8 *)(a1 + 50)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_stopFlyoverAnimation
{
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __34__MKMapView__stopFlyoverAnimation__block_invoke;
    _OWORD v4[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v5, &location);
    [(MKMapView *)self _addDependentAuxiliaryBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    mapView = self->_mapView;
    [(VKMapView *)mapView stopFlyoverAnimation];
  }
}

void __34__MKMapView__stopFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopFlyoverAnimation];
}

- (void)_pauseFlyoverAnimation
{
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __35__MKMapView__pauseFlyoverAnimation__block_invoke;
    _OWORD v4[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v5, &location);
    [(MKMapView *)self _addDependentAuxiliaryBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    id v3 = [(MKMapView *)self vk_mapLayer];
    [v3 pauseFlyoverTourAnimation];
  }
}

void __35__MKMapView__pauseFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pauseFlyoverAnimation];
}

- (void)_resumeFlyoverAnimation
{
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__MKMapView__resumeFlyoverAnimation__block_invoke;
    _OWORD v4[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v5, &location);
    [(MKMapView *)self _addDependentAuxiliaryBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    id v3 = [(MKMapView *)self vk_mapLayer];
    [v3 resumeFlyoverTourAnimation];
  }
}

void __36__MKMapView__resumeFlyoverAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeFlyoverAnimation];
}

- (void)setFlyoverMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MKMapView *)self _mapLayer];
  [v4 setFlyoverMode:v3];
}

- (void)mapLayerWillEnterAR:(id)a3
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v7 mapViewWillEnterAR:self];
  }
}

- (void)mapLayerDidEnterAR:(id)a3
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v7 mapViewDidEnterAR:self];
  }
}

- (void)mapLayerDidExitAR:(id)a3
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v7 mapViewDidExitAR:self];
  }
}

- (void)mapLayer:(id)a3 didEncounterARError:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    [v7 mapView:self didEncounterARError:v8];
  }
}

- (void)mapLayer:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v11 mapView:self arTrackingStateDidChange:a4 reason:a5];
  }
}

- (void)mapLayer:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v9 mapView:self arSessionWasInterrupted:a4];
  }
}

- (void)mapLayer:(id)a3 puckLocationTracingEvent:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_safeDelegate);
    [v7 mapView:self puckLocationTracingEvent:v8];
  }
}

- (void)mapLayerARSessionInterruptionEnded:(id)a3
{
  p_safeDelegate = &self->_safeDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_safeDelegate);
    [v7 mapViewARSessionInterruptionEnded:self];
  }
}

- (void)_addAnnotationsCustomFeatureStoreIfNeeded
{
  if (!self->_annotationsCustomFeatureStore)
  {
    uint64_t v3 = [[_MKCustomFeatureStore alloc] initWithClustering:0];
    annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
    self->_annotationsCustomFeatureStore = v3;

    [(MKMapView *)self _setDisplayedSearchResultsType:1];
    id v5 = self->_annotationsCustomFeatureStore;
    [(MKMapView *)self _addCustomFeatureDataSource:v5];
  }
}

- (void)removeAnnotationRepresentation:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 viewRepresentation];
  if (v5)
  {
    char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:0x1ED91FFC8 object:v5];

    id v7 = [(MKMapView *)self userLocationView];

    if (v5 == v7)
    {
      [(MKAnnotationContainerView *)self->_annotationContainer setUserLocationView:0];
      id v8 = [(VKMapView *)self->_mapView userLocationAnimator];
      [v8 stop];

      [v5 _setVKNavigationPuckMarker:0];
    }
    id v9 = [(MKMapView *)self vk_mapLayer];
    char v10 = [v5 anchor];
    [v9 removeExternalAnchor:v10];

    [(MKAnnotationContainerView *)self->_annotationContainer removeAnnotationView:v5];
  }
  else
  {
    [(MKMapView *)self _addAnnotationsCustomFeatureStoreIfNeeded];
    annotationsCustomFeatureStore = self->_annotationsCustomFeatureStore;
    v13[0] = v4;
    BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(_MKCustomFeatureStore *)annotationsCustomFeatureStore removeAnnotations:v12];
  }
}

- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 viewRepresentation];
  if (v7)
  {
    if ((*(void *)&self->_flags & 0x400000000) != 0)
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__MKMapView_selectAnnotationRepresentation_animated___block_invoke;
      v11[3] = &unk_1E54B8B28;
      objc_copyWeak(&v13, &location);
      id v12 = v6;
      BOOL v14 = v4;
      id v9 = (void *)[v11 copy];
      id selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
      self->_id selectAnnotationViewAfterRedrawBlock = v9;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      [(MKAnnotationContainerView *)self->_annotationContainer selectAnnotationView:v7 animated:v4];
    }
  }
  else
  {
    [(MKMapView *)self _addAnnotationsCustomFeatureStoreIfNeeded];
    id v8 = [(MKMapView *)self _labelMarkerForCustomFeatureAnnotation:v6];
    [(VKMapView *)self->_mapView selectLabelMarker:v8];
  }
}

void __53__MKMapView_selectAnnotationRepresentation_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained selectAnnotationRepresentation:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 viewRepresentation];
  if (v7)
  {
    id selectAnnotationViewAfterRedrawBlock = self->_selectAnnotationViewAfterRedrawBlock;
    self->_id selectAnnotationViewAfterRedrawBlock = 0;

    [(MKAnnotationContainerView *)self->_annotationContainer deselectAnnotationView:v7 animated:v4];
  }
  else
  {
    [(MKMapView *)self _addAnnotationsCustomFeatureStoreIfNeeded];
    [(MKMapView *)self _deselectLabelMarkerAnimated:v4];
  }
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = INFINITY;
  if (a4.var0.var0 == INFINITY && a4.var0.var1 == INFINITY)
  {
    double v10 = INFINITY;
  }
  else
  {
    double v8 = -(a4.var1.var1 * a3);
    double v9 = -(var0 * a3);
    double v10 = a4.var0.var0 + v9;
    double v6 = a4.var0.var1 + v8;
    double var0 = var0 - v9 * 2.0;
    double var1 = a4.var1.var1 - v8 * 2.0;
  }
  v15.size.double width = 268435456.0;
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.double height = 268435456.0;
  double v11 = v10;
  double v12 = var0;
  $FD2884BA735A6398BD92EEF91FE53E55 result = ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(v15, *(MKMapRect *)(&v6 - 1));
  double v13 = v10;
  double v14 = var0;
  result.var1.double var0 = v14;
  result.var0.double var0 = v13;
  return result;
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return [(VKMapView *)self->_mapView shouldHideOffscreenSelectedAnnotation];
}

- (BOOL)_shouldCallAnnotationViewCallback:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [v3 shouldShowCallout];

  return v4;
}

- (void)annotationManager:(id)a3 didSelectAnnotationRepresentation:(id)a4
{
  id v29 = a4;
  id v5 = [v29 viewRepresentation];
  if (!v5)
  {
    [(MKMapView *)self _addAnnotationsCustomFeatureStoreIfNeeded];
    id v7 = [(MKMapView *)self _labelMarkerForCustomFeatureAnnotation:v29];
    [(MKMapView *)self _selectLabelMarker:v7 animated:1];
LABEL_56:

    goto LABEL_57;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = [v5 annotation];
  if (isKindOfClass)
  {
    double v8 = +[MKMapViewLabelMarkerState stateForLabelMarker:v7];
    selectedLabelMarkerState = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v8;

    [(VKMapView *)self->_mapView selectLabelMarker:v7];
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      double v10 = self->_unsafeDelegate;
    }
    else
    {
      double v10 = [(MKMapView *)self _safeDelegate];
    }
    __int16 v17 = v10;
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_56;
    }
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      id v19 = self->_unsafeDelegate;
    }
    else
    {
      id v19 = [(MKMapView *)self _safeDelegate];
    }
    __int16 v21 = v19;
    [(MKMapViewDelegate *)v19 mapView:self didSelectLabelMarker:v7];
    goto LABEL_55;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    double v12 = [v5 annotation];
    double v13 = [v12 marker];

    double v14 = +[MKMapViewLabelMarkerState stateForLabelMarker:v13];
    MKMapRect v15 = self->_selectedLabelMarkerState;
    self->_selectedLabelMarkerState = v14;

    [(VKMapView *)self->_mapView selectLabelMarker:v13];
  }
  if ([(MKMapView *)self _shouldCallAnnotationViewCallback:v5])
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v16 = self->_unsafeDelegate;
      }
      else
      {
        char v16 = [(MKMapView *)self _safeDelegate];
      }
      char v20 = v16;
    }
    else
    {
      char v20 = 0;
    }
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          id v23 = self->_unsafeDelegate;
        }
        else
        {
          id v23 = [(MKMapView *)self _safeDelegate];
        }
        id v24 = v23;
      }
      else
      {
        id v24 = 0;
      }
      [(MKMapViewDelegate *)v24 mapView:self didSelectAnnotationView:v5];
    }
  }
  if (self)
  {
    if (qword_1E9154040 != -1) {
      dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
    }
    if (byte_1E9153FDC)
    {
      char v25 = self->_unsafeDelegate;
    }
    else
    {
      char v25 = [(MKMapView *)self _safeDelegate];
    }
    __int16 v26 = v25;
  }
  else
  {
    __int16 v26 = 0;
  }
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        long long v28 = self->_unsafeDelegate;
      }
      else
      {
        long long v28 = [(MKMapView *)self _safeDelegate];
      }
      id v7 = v28;
    }
    else
    {
      id v7 = 0;
    }
    __int16 v21 = [v5 annotation];
    [v7 mapView:self didSelectAnnotation:v21];
LABEL_55:

    goto LABEL_56;
  }
LABEL_57:
}

- (BOOL)annotationManager:(id)a3 shouldAnimateDeselectionOfAnnotation:(id)a4 forSelectionOfAnnotation:(id)a5
{
  id v5 = a4;
  if (_MKLinkedOnOrAfterReleaseSet(2053))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "viewRepresentation", a3);
  if (!v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v6 = [v4 annotation];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if (v7)
    {
      double v8 = [v4 annotation];
      double v6 = [v8 marker];

      goto LABEL_5;
    }
LABEL_6:
    char v9 = 1;
    goto LABEL_7;
  }
LABEL_5:
  char v9 = [v6 isVisible];

LABEL_7:
  return v9;
}

- (void)annotationManager:(id)a3 willDeselectAnnotationRepresentation:(id)a4
{
  id v22 = a4;
  id v5 = [v22 viewRepresentation];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 annotation],
          double v6 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0))
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          double v8 = self->_unsafeDelegate;
        }
        else
        {
          double v8 = [(MKMapView *)self _safeDelegate];
        }
        id v19 = v8;
      }
      else
      {
        id v19 = 0;
      }
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        if (self)
        {
          if (qword_1E9154040 != -1) {
            dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
          }
          if (byte_1E9153FDC)
          {
            __int16 v21 = self->_unsafeDelegate;
          }
          else
          {
            __int16 v21 = [(MKMapView *)self _safeDelegate];
          }
          char v16 = v21;
        }
        else
        {
          char v16 = 0;
        }
        [v16 _mapView:self willDeselectLabelMarker:v22];
LABEL_58:
      }
    }
    else
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          char v9 = self->_unsafeDelegate;
        }
        else
        {
          char v9 = [(MKMapView *)self _safeDelegate];
        }
        char v11 = v9;
      }
      else
      {
        char v11 = 0;
      }
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        if (self)
        {
          if (qword_1E9154040 != -1) {
            dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
          }
          if (byte_1E9153FDC)
          {
            double v14 = self->_unsafeDelegate;
          }
          else
          {
            double v14 = [(MKMapView *)self _safeDelegate];
          }
          char v16 = v14;
        }
        else
        {
          char v16 = 0;
        }
        [v16 _mapView:self willDeselectAnnotationView:v5];
        goto LABEL_58;
      }
    }
  }
  else
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v10 = self->_unsafeDelegate;
      }
      else
      {
        double v10 = [(MKMapView *)self _safeDelegate];
      }
      double v12 = v10;
    }
    else
    {
      double v12 = 0;
    }
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      char v16 = [(MKMapView *)self _labelMarkerForCustomFeatureAnnotation:v22];
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          __int16 v17 = self->_unsafeDelegate;
        }
        else
        {
          __int16 v17 = [(MKMapView *)self _safeDelegate];
        }
        char v18 = v17;
      }
      else
      {
        char v18 = 0;
      }
      [(MKMapViewDelegate *)v18 _mapView:self willDeselectLabelMarker:v16];

      goto LABEL_58;
    }
  }
}

- (void)annotationManager:(id)a3 didDeselectAnnotationRepresentation:(id)a4
{
  id v5 = a4;
  double v6 = [v5 viewRepresentation];
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v8 = [v6 annotation];
    char v9 = v8;
    if (isKindOfClass)
    {
      id v10 = v8;
      [(VKMapView *)self->_mapView deselectLabelMarker];
      selectedLabelMarkerState = self->_selectedLabelMarkerState;
      self->_selectedLabelMarkerState = 0;

      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        double v12 = self->_unsafeDelegate;
      }
      else
      {
        double v12 = [(MKMapView *)self _safeDelegate];
      }
      char v18 = v12;
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          char v20 = self->_unsafeDelegate;
        }
        else
        {
          char v20 = [(MKMapView *)self _safeDelegate];
        }
        __int16 v26 = v20;
        [(MKMapViewDelegate *)v20 mapView:self didDeselectLabelMarker:v10];
      }
      dispatch_time_t v27 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__MKMapView_annotationManager_didDeselectAnnotationRepresentation___block_invoke;
      block[3] = &unk_1E54B8270;
      block[4] = self;
      id v37 = v10;
      id v38 = v10;
      id v28 = v10;
      dispatch_after(v27, MEMORY[0x1E4F14428], block);

      goto LABEL_74;
    }
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      [(VKMapView *)self->_mapView deselectLabelMarker];
      char v15 = self->_selectedLabelMarkerState;
      self->_selectedLabelMarkerState = 0;
    }
    if ([(MKMapView *)self _shouldCallAnnotationViewCallback:v6])
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          char v16 = self->_unsafeDelegate;
        }
        else
        {
          char v16 = [(MKMapView *)self _safeDelegate];
        }
        char v25 = v16;
      }
      else
      {
        char v25 = 0;
      }
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        if (self)
        {
          if (qword_1E9154040 != -1) {
            dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
          }
          if (byte_1E9153FDC)
          {
            long long v30 = self->_unsafeDelegate;
          }
          else
          {
            long long v30 = [(MKMapView *)self _safeDelegate];
          }
          long long v31 = v30;
        }
        else
        {
          long long v31 = 0;
        }
        [(MKMapViewDelegate *)v31 mapView:self didDeselectAnnotationView:v6];
      }
    }
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        long long v32 = self->_unsafeDelegate;
      }
      else
      {
        long long v32 = [(MKMapView *)self _safeDelegate];
      }
      long long v33 = v32;
    }
    else
    {
      long long v33 = 0;
    }
    char v34 = objc_opt_respondsToSelector();

    if (v34)
    {
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          uint64_t v35 = self->_unsafeDelegate;
        }
        else
        {
          uint64_t v35 = [(MKMapView *)self _safeDelegate];
        }
        id v22 = v35;
      }
      else
      {
        id v22 = 0;
      }
      id v24 = [v6 annotation];
      [v22 mapView:self didDeselectAnnotation:v24];
LABEL_73:
    }
  }
  else
  {
    if (self)
    {
      if (qword_1E9154040 != -1) {
        dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
      }
      if (byte_1E9153FDC)
      {
        char v13 = self->_unsafeDelegate;
      }
      else
      {
        char v13 = [(MKMapView *)self _safeDelegate];
      }
      __int16 v17 = v13;
    }
    else
    {
      __int16 v17 = 0;
    }
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(MKMapView *)self _labelMarkerForCustomFeatureAnnotation:v5];
      if (self)
      {
        if (qword_1E9154040 != -1) {
          dispatch_once(&qword_1E9154040, &__block_literal_global_1877);
        }
        if (byte_1E9153FDC)
        {
          id v23 = self->_unsafeDelegate;
        }
        else
        {
          id v23 = [(MKMapView *)self _safeDelegate];
        }
        id v24 = v23;
      }
      else
      {
        id v24 = 0;
      }
      [v24 mapView:self didDeselectLabelMarker:v22];
      goto LABEL_73;
    }
  }
LABEL_74:
}

void __67__MKMapView_annotationManager_didDeselectAnnotationRepresentation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _selectedLabelMarker];
  id v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 removeAnnotation:v5];
  }
}

void __23__MKMapView_setCamera___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setCamera:*(void *)(a1 + 32) animated:0];
}

- (void)setCamera:(MKMapCamera *)camera animated:(BOOL)animated
{
}

- (void)setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(MKMapView *)self _clearGestureRecognizers];
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _DWORD v10[2] = __50__MKMapView_setCamera_animated_completionHandler___block_invoke;
    v10[3] = &unk_1E54B8B00;
    objc_copyWeak(&v13, &location);
    id v11 = v8;
    id v12 = v9;
    [(MKMapView *)self _addSetRegionBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MKMapView *)self _setCamera:v8 animated:v6 completionHandler:v9];
  }
}

void __50__MKMapView_setCamera_animated_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setCamera:*(void *)(a1 + 32) animated:0 completionHandler:*(void *)(a1 + 40)];
}

- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8
{
}

- (void)setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9
{
  id v16 = a3;
  __int16 v17 = (void (**)(id, uint64_t))a9;
  [(MKMapView *)self _clearGestureRecognizers];
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __106__MKMapView_setCamera_duration_springMass_springStiffness_springDamping_springVelocity_completionHandler___block_invoke;
    v22[3] = &unk_1E54B8C68;
    objc_copyWeak(&v24, &location);
    id v23 = v16;
    [(MKMapView *)self _addSetRegionBlock:v22];
    if (v17) {
      v17[2](v17, 1);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v18 = a5;
    *(float *)&double v19 = a6;
    *(float *)&double v20 = a7;
    *(float *)&double v21 = a8;
    [(MKMapView *)self _setCamera:v16 duration:v17 springMass:a4 springStiffness:v18 springDamping:v19 springVelocity:v20 completionHandler:v21];
  }
}

void __106__MKMapView_setCamera_duration_springMass_springStiffness_springDamping_springVelocity_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setCamera:*(void *)(a1 + 32) animated:0];
}

- (void)setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7
{
  id v12 = a3;
  [(MKMapView *)self _clearGestureRecognizers];
  if ([(MKMapView *)self _mustWaitUntilSized])
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__MKMapView_setCamera_springMass_springStiffness_springDamping_springVelocity___block_invoke;
    v17[3] = &unk_1E54B8C68;
    objc_copyWeak(&v19, &location);
    id v18 = v12;
    [(MKMapView *)self _addSetRegionBlock:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v13 = a4;
    *(float *)&double v14 = a5;
    *(float *)&double v15 = a6;
    *(float *)&double v16 = a7;
    [(MKMapView *)self _setCamera:v12 springMass:v13 springStiffness:v14 springDamping:v15 springVelocity:v16];
  }
}

void __79__MKMapView_setCamera_springMass_springStiffness_springDamping_springVelocity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setCamera:*(void *)(a1 + 32) animated:0];
}

- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange
{
  [(MKMapView *)self setCameraZoomRange:cameraZoomRange animated:0];
  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:9];
}

- (void)setCameraZoomRange:(MKMapCameraZoomRange *)cameraZoomRange animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v10 = cameraZoomRange;
  BOOL v6 = [(MKMapCameraZoomRange *)v10 isEqual:self->_cameraZoomRange];
  char v7 = v10;
  if (!v6)
  {
    if (v10) {
      id v8 = (MKMapCameraZoomRange *)[(MKMapCameraZoomRange *)v10 copy];
    }
    else {
      id v8 = [[MKMapCameraZoomRange alloc] initWithMinCenterCoordinateDistance:-1.0 maxCenterCoordinateDistance:-1.0];
    }
    id v9 = self->_cameraZoomRange;
    self->_cameraZoomRange = v8;

    [(MKMapView *)self _setCameraZoomRange:self->_cameraZoomRange animated:v4];
    [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:9];
    char v7 = v10;
  }
}

- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary
{
}

- (void)setCameraBoundary:(MKMapCameraBoundary *)cameraBoundary animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v8 = cameraBoundary;
  if (![(MKMapCameraBoundary *)v8 isEqual:self->_cameraBoundary])
  {
    BOOL v6 = (MKMapCameraBoundary *)[(MKMapCameraBoundary *)v8 copy];
    char v7 = self->_cameraBoundary;
    self->_cameraBoundardouble y = v6;

    [(MKMapView *)self _setCameraBoundary:self->_cameraBoundary animated:v4];
    [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:10];
  }
}

- (void)startLinearZoomIn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 doubleForKey:@"ZoomingDefault"];
  double v7 = v6;

  gestureController = self->_gestureController;
  if (v3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 4;
  }

  [(MKMapGestureController *)gestureController handleZoomArrowMask:v9 speed:v7];
}

- (void)stopZoomingWithInertia
{
}

- (void)_zoomWithAmount:(double)a3
{
}

- (void)_zoomWithAmount:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(MKBasicMapView *)self->_basicMapView bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MKBasicMapView *)self->_basicMapView edgeInsets];
  CGFloat v16 = v8 + v15;
  CGFloat v18 = v10 + v17;
  CGFloat v20 = v12 - (v15 + v19);
  CGFloat v22 = v14 - (v17 + v21);
  v29.origin.double x = v16;
  v29.origin.double y = v18;
  v29.size.double width = v20;
  v29.size.double height = v22;
  double MidX = CGRectGetMidX(v29);
  v30.origin.double x = v16;
  v30.origin.double y = v18;
  v30.size.double width = v20;
  v30.size.double height = v22;
  double MidY = CGRectGetMidY(v30);
  [(MKMapGestureController *)self->_gestureController startUserInteractionFromExternalGesture];
  mapView = self->_mapView;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __47__MKMapView__zoomWithAmount_completionHandler___block_invoke;
  void v27[3] = &unk_1E54B8630;
  void v27[4] = self;
  id v28 = v6;
  id v26 = v6;
  -[VKMapView zoom:withFocusPoint:completionHandler:](mapView, "zoom:withFocusPoint:completionHandler:", v27, a3, MidX, MidY);
}

uint64_t __47__MKMapView__zoomWithAmount_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 624) stopUserInteractionFromExternalGesture];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_zoomIn
{
}

- (void)_zoomInWithCompletionHandler:(id)a3
{
}

- (void)_zoomOut
{
}

- (void)_zoomOutWithCompletionHandler:(id)a3
{
}

- (void)_startPanningAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKMapGestureController *)self->_gestureController setScrollEnabled:0];
  -[MKBasicMapView convertPoint:fromView:](self->_basicMapView, "convertPoint:fromView:", self, x, y);
  mapView = self->_mapView;

  -[VKMapView startPanningAtPoint:](mapView, "startPanningAtPoint:");
}

- (void)_updatePanWithTranslation:(CGPoint)a3
{
}

- (void)_stopPanningAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKMapView *)self setScrollEnabled:(*(void *)&self->_flags >> 13) & 1];
  [(MKMapGestureController *)self->_gestureController setScrollEnabled:(*(void *)&self->_flags >> 13) & 1];
  -[MKBasicMapView convertPoint:fromView:](self->_basicMapView, "convertPoint:fromView:", self, x, y);
  mapView = self->_mapView;

  -[VKMapView stopPanningAtPoint:](mapView, "stopPanningAtPoint:");
}

- (void)setVehicleState:(id)a3
{
  id v4 = [(MKMapView *)self _mapLayer];
  [v4 setVehicleState:a3.var0];
}

- (void)_clearGesturesAndAnimations
{
  [(MKMapGestureController *)self->_gestureController clearGestureRecognizersInFlight];
  gestureController = self->_gestureController;

  [(MKMapGestureController *)gestureController stopDynamicAnimations];
}

- (int)currentUITargetForAnalytics
{
  return 0;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)zoomIn:(id)a3
{
  if ([(MKMapView *)self isZoomEnabled])
  {
    [(MKMapGestureController *)self->_gestureController zoomIn];
    id v4 = (void *)MEMORY[0x1E4F63E30];
    uint64_t v5 = [(MKMapView *)self currentMapViewTargetForAnalytics];
    id v11 = [(MKMapView *)self mapRegion];
    [(MKMapView *)self _zoomLevel];
    double v7 = v6;
    MKMapType v8 = [(MKMapView *)self mapType];
    uint64_t v9 = 1;
    switch(v8)
    {
      case MKMapTypeStandard:
        break;
      case MKMapTypeSatellite:
      case MKMapTypeSatelliteFlyover:
        uint64_t v9 = 2;
        break;
      case MKMapTypeHybrid:
      case MKMapTypeHybridFlyover:
        uint64_t v9 = 3;
        break;
      default:
        if (v8 == 104) {
          unsigned int v10 = 4;
        }
        else {
          unsigned int v10 = 0;
        }
        if (v8 == 102) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v10;
        }
        break;
    }
    [v4 captureUserAction:1002 target:v5 value:0 mapRegion:v11 zoomLevel:v9 mapType:v7];
  }
}

- (void)zoomOut:(id)a3
{
  if ([(MKMapView *)self isZoomEnabled])
  {
    [(MKMapGestureController *)self->_gestureController zoomOut];
    id v4 = (void *)MEMORY[0x1E4F63E30];
    uint64_t v5 = [(MKMapView *)self currentMapViewTargetForAnalytics];
    id v11 = [(MKMapView *)self mapRegion];
    [(MKMapView *)self _zoomLevel];
    double v7 = v6;
    MKMapType v8 = [(MKMapView *)self mapType];
    uint64_t v9 = 1;
    switch(v8)
    {
      case MKMapTypeStandard:
        break;
      case MKMapTypeSatellite:
      case MKMapTypeSatelliteFlyover:
        uint64_t v9 = 2;
        break;
      case MKMapTypeHybrid:
      case MKMapTypeHybridFlyover:
        uint64_t v9 = 3;
        break;
      default:
        if (v8 == 104) {
          unsigned int v10 = 4;
        }
        else {
          unsigned int v10 = 0;
        }
        if (v8 == 102) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v10;
        }
        break;
    }
    [v4 captureUserAction:1003 target:v5 value:0 mapRegion:v11 zoomLevel:v9 mapType:v7];
  }
}

- (void)_insertSubviewBelowAnnotationContainerView:(id)a3
{
  annotationContainer = self->_annotationContainer;
  id v5 = a3;
  id v6 = [(MKAnnotationContainerView *)annotationContainer superview];
  [v6 insertSubview:v5 belowSubview:self->_annotationContainer];
}

- (MKLocationManager)_locationManager
{
  return self->_locationManager;
}

- (BOOL)_isAttributionBadgeClickable
{
  return self->_attributionBadgeClickable;
}

- (void)_setAttributionBadgeClickable:(BOOL)a3
{
  self->_attributionBadgeClickable = a3;
}

- (MKLabelSelectionFilter)_labelSelectionFilter
{
  return self->_labelSelectionFilter;
}

- (int64_t)_interactionMode
{
  return self->_interactionMode;
}

- (void)_setInteractionMode:(int64_t)a3
{
  self->_interactionMode = a3;
}

- (unint64_t)_currentFlyoverAnimationID
{
  return self->_currentFlyoverAnimationID;
}

- (void)_setCurrentFlyoverAnimationID:(unint64_t)a3
{
  self->_currentFlyoverAnimationID = a3;
}

- (MKMapCameraZoomRange)cameraZoomRange
{
  return self->_cameraZoomRange;
}

- (MKMapCameraBoundary)cameraBoundary
{
  return self->_cameraBoundary;
}

- (BOOL)showsPitchControl
{
  return self->_showsPitchControl;
}

- (void)setShowsPitchControl:(BOOL)showsPitchControl
{
  self->_showsPitchControl = showsPitchControl;
}

- (BOOL)showsZoomControls
{
  return self->_showsZoomControls;
}

- (void)setShowsZoomControls:(BOOL)showsZoomControls
{
  self->_showsZoomControls = showsZoomControls;
}

- (unint64_t)_userTrackingButtonBackgroundStyle
{
  return self->_userTrackingButtonBackgroundStyle;
}

- (unint64_t)_pitchButtonBackgroundStyle
{
  return self->_pitchButtonBackgroundStyle;
}

- (unint64_t)_userTrackingControlSize
{
  return self->_userTrackingControlSize;
}

- (unint64_t)_pitchButtonControlSize
{
  return self->_pitchButtonControlSize;
}

- (unint64_t)_scaleControlSize
{
  return self->_scaleControlSize;
}

- (unint64_t)_controlBackgroundStyle
{
  return self->_controlBackgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (int)attributionCorner
{
  return self->_attributionCorner;
}

- (int64_t)_attributionLinkDisplayStyle
{
  return self->_attributionLinkDisplayStyle;
}

- (BOOL)_isCompassSuppressedForFloorPicker
{
  return self->_compassSuppressedForFloorPicker;
}

- (int64_t)compassViewSize
{
  return self->_compassViewSize;
}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (id)_labelsDidLayoutCallback
{
  return self->_labelsDidLayoutCallback;
}

- (void)_setLabelsDidLayoutCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_labelsDidLayoutCallback, 0);
  objc_storeStrong((id *)&self->_cameraBoundary, 0);
  objc_storeStrong((id *)&self->_cameraZoomRange, 0);
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
  objc_storeStrong((id *)&self->_labelSelectionFilter, 0);
  objc_storeStrong(&self->_locationIsInHikingContextCallback, 0);
  objc_storeStrong((id *)&self->_offlineRegionsOverlayManager, 0);
  objc_storeStrong((id *)&self->_zoomBounceFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarkerState, 0);
  objc_storeStrong((id *)&self->_annotationsCustomFeatureStore, 0);
  objc_storeStrong(&self->_shelbyvilleListener, 0);
  objc_storeStrong((id *)&self->_calloutShowAnimationGroup, 0);
  objc_storeStrong((id *)&self->_edgeInsetsBottomConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsRightConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsLeftConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsTopConstraint, 0);
  objc_storeStrong((id *)&self->_edgeInsetsGuide, 0);
  objc_storeStrong((id *)&self->_longPressedAnnotationView, 0);
  objc_storeStrong((id *)&self->_rotationFilter, 0);
  objc_storeStrong((id *)&self->_lastTraitCollection, 0);
  objc_storeStrong((id *)&self->_lastEffectiveTraitCollectionIsolationQueue, 0);
  objc_storeStrong(&self->_bottomLayoutGuide, 0);
  objc_storeStrong(&self->_topLayoutGuide, 0);
  objc_storeStrong((id *)&self->_vectorKitStyleDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vectorKitDebugView, 0);
  objc_storeStrong(&self->_selectAnnotationViewAfterRedrawBlock, 0);
  objc_storeStrong(&self->_showCalloutAfterRegionChangeBlock, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_navContext, 0);
  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_scrollContainerView, 0);
  objc_storeStrong((id *)&self->_controlStackWidthConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_controlStackView, 0);
  objc_storeStrong((id *)&self->_pitchButton, 0);
  objc_storeStrong((id *)&self->_trackingButton, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_pressedLabelMarker, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_basicMapView, 0);
  objc_storeStrong((id *)&self->_overlayContainer, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_locationConsoleGesture, 0);
  objc_storeStrong((id *)&self->_nonselectingTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectingTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_debugCurrentEnvironmentLabel, 0);
  objc_storeStrong(&self->_debugConsoleAdditionalInfoProvider, 0);
  objc_storeStrong((id *)&self->_debugLocationConsole, 0);
  objc_destroyWeak((id *)&self->_safeDelegate);
  objc_storeStrong((id *)&self->_startEffectsTimer, 0);
  objc_storeStrong((id *)&self->_attributionBadgeView, 0);
  objc_storeStrong(&self->_annotationCoordinateTest, 0);
  objc_storeStrong(&self->_annotationRectTest, 0);
  objc_storeStrong((id *)&self->_appleLogoImageView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_annotationContainer, 0);
  objc_storeStrong((id *)&self->_annotationManager, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_usageCounter, 0);
  objc_storeStrong((id *)&self->_overlayRendererEventDictionary, 0);
  objc_storeStrong((id *)&self->_annotationViewEventSet, 0);

  objc_storeStrong((id *)&self->_whenSizedBlocks, 0);
}

- (unint64_t)_selectedFeatureID
{
  return 0;
}

- (void)_setSelectedFeatureID:(unint64_t)a3
{
  id v4 = [(MKMapView *)self _mapLayer];
  id v5 = v4;
  if (a3) {
    [v4 setSelectedFeatureId:a3];
  }
  else {
    [v4 deselectFeatureId];
  }
}

- (void)stopUpdatingUserLocation
{
  BOOL v3 = MKGetPuckTrackingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v26[0] = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager stopUpdatingUserLocation", (uint8_t *)v26, 2u);
  }

  userLocation = self->_userLocation;
  if (!userLocation)
  {
    id v5 = self;
    id v6 = objc_alloc_init(MKUserLocation);
    double v7 = v5->_userLocation;
    v5->_userLocation = v6;

    userLocation = v5->_userLocation;
  }
  MKMapType v8 = userLocation;
  BOOL v9 = [(MKUserLocation *)v8 isUpdating];

  if (v9)
  {
    [(MKMapView *)self removeUserLocation];
    unsigned int v10 = self;
    id v11 = v10->_userLocation;
    if (!v11)
    {
      double v12 = objc_alloc_init(MKUserLocation);
      double v13 = v10->_userLocation;
      v10->_userLocation = v12;

      id v11 = v10->_userLocation;
    }
    double v14 = v11;

    [(MKUserLocation *)v14 setUpdating:0];
    double v15 = v10->_userLocation;
    if (!v15)
    {
      CGFloat v16 = v10;
      double v17 = objc_alloc_init(MKUserLocation);
      CGFloat v18 = v16->_userLocation;
      v16->_userLocation = v17;

      double v15 = v16->_userLocation;
    }
    double v19 = v15;
    [(MKUserLocation *)v19 setLocation:0];

    [(MKLocationManager *)v10->_locationManager stopLocationUpdateWithObserver:v10];
    CGFloat v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 removeObserver:v10 name:MKLocationManagerApprovalDidChangeNotification object:0];

    if (qword_1EB315C80 != -1) {
      dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
    }
    if (_MergedGlobals_130)
    {
      double v21 = v10->_unsafeDelegate;
    }
    else
    {
      double v21 = [(MKMapView *)v10 _safeDelegate];
    }
    CGFloat v22 = v21;
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      if (qword_1EB315C80 != -1) {
        dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
      }
      if (_MergedGlobals_130)
      {
        id v24 = v10->_unsafeDelegate;
      }
      else
      {
        id v24 = [(MKMapView *)v10 _safeDelegate];
      }
      char v25 = v24;
      [(MKMapViewDelegate *)v24 mapViewDidStopLocatingUser:v10];
    }
  }
}

- (void)_updateLocationConsole
{
}

- (BOOL)_isLocationPropagationEnabled
{
  return (*(void *)&self->_flags >> 41) & 1;
}

- (void)_setLocationPropagationEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t flags = *(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)_clearUserLocationOnLocationReset
{
  return (*(void *)&self->_flags >> 46) & 1;
}

- (void)_setClearUserLocationOnLocationReset:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t flags = *(void *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)_isUserLocationViewCentered:(double)a3
{
  [(MKMapView *)self _centerPoint];

  return -[MKMapView _isPoint:nearUserLocationView:](self, "_isPoint:nearUserLocationView:");
}

- (BOOL)_isPoint:(CGPoint)a3 nearUserLocationView:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  MKMapType v8 = [(MKMapView *)self userLocationView];
  BOOL v9 = v8;
  if (v8 && ([v8 superview], unsigned int v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    basicMapView = self->_basicMapView;
    [v9 _presentationCoordinate];
    -[MKBasicMapView convertCoordinate:toCameraModelPointToView:](basicMapView, "convertCoordinate:toCameraModelPointToView:", self);
    if (sqrt((v12 - x) * (v12 - x) + (v13 - y) * (v13 - y)) >= a4)
    {
      double v15 = self->_basicMapView;
      [v9 coordinate];
      -[MKBasicMapView convertCoordinate:toCameraModelPointToView:](v15, "convertCoordinate:toCameraModelPointToView:", self);
      BOOL v14 = sqrt((v16 - x) * (v16 - x) + (v17 - y) * (v17 - y)) < a4;
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_userLocationWithinVisibleMapBounds
{
  [(MKMapView *)self visibleMapRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(MKMapView *)self userLocationView];
  [v11 coordinate];
  v17.double x = MKTilePointForCoordinate(v12, v13, 21.0);
  v17.double y = v14;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  BOOL v15 = MKMapRectContainsPoint(v18, v17);

  return v15;
}

- (CLLocation)predictedUserLocation
{
  userLocation = self->_userLocation;
  if (!userLocation)
  {
    double v3 = self;
    double v4 = objc_alloc_init(MKUserLocation);
    double v5 = v3->_userLocation;
    v3->_userLocation = v4;

    userLocation = v3->_userLocation;
  }
  double v6 = userLocation;
  double v7 = [(MKUserLocation *)v6 predictedLocation];

  return (CLLocation *)v7;
}

- (void)removeUserLocation
{
  [(MKUserLocation *)self->_userLocation coordinate];
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0 && v3 <= 90.0)
  {
    annotationManager = self->_annotationManager;
    userLocation = self->_userLocation;
    [(MKAnnotationManager *)annotationManager removeAnnotation:userLocation];
  }
}

- (BOOL)ignoreLocationUpdates
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (void)setIgnoreLocationUpdates:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (void)_pauseUserLocationUpdates
{
  [(MKMapView *)self setIgnoreLocationUpdates:1];
  *(void *)&self->_flags |= 0x400uLL;
  id v3 = [(VKMapView *)self->_mapView userLocationAnimator];
  [v3 pause];
}

- (void)_resumeUserLocationUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  [(MKMapView *)self setIgnoreLocationUpdates:0];
  *(void *)&self->_flags &= ~0x400uLL;
  double v5 = [(VKMapView *)self->_mapView userLocationAnimator];
  [v5 resume];

  if (v3)
  {
    [(MKMapView *)self _clearFixedUserLocation];
    if ((*(void *)&self->_flags & 0x80000) != 0)
    {
      double v6 = [(MKLocationManager *)self->_locationManager lastLocation];

      if (v6)
      {
        locationManager = self->_locationManager;
        [(MKMapView *)self locationManagerUpdatedLocation:locationManager];
      }
    }
  }
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v13 = a4;
  id v5 = [(MKMapView *)self userLocationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_5:
    double v7 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 _mkUserLocationView];
    goto LABEL_5;
  }
  double v7 = 0;
LABEL_7:

  [v7 locationManagerFailedToUpdateLocation];
  if (self)
  {
    if (qword_1EB315C80 != -1) {
      dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
    }
    if (_MergedGlobals_130)
    {
      double v8 = self->_unsafeDelegate;
    }
    else
    {
      double v8 = [(MKMapView *)self _safeDelegate];
    }
    double v9 = v8;
  }
  else
  {
    double v9 = 0;
  }
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (self)
    {
      if (qword_1EB315C80 != -1) {
        dispatch_once(&qword_1EB315C80, &__block_literal_global_10);
      }
      if (_MergedGlobals_130)
      {
        id v11 = self->_unsafeDelegate;
      }
      else
      {
        id v11 = [(MKMapView *)self _safeDelegate];
      }
      double v12 = v11;
    }
    else
    {
      double v12 = 0;
    }
    [(MKMapViewDelegate *)v12 mapView:self didFailToLocateUserWithError:v13];
  }
}

- (void)locationManagerDidReset:(id)a3
{
  id v4 = a3;
  if ((*(void *)&self->_flags & 0x400000000000) != 0)
  {
    id v6 = v4;
    if (self->_userLocation)
    {
      if (self->_userTrackingMode && [(MKMapView *)self hasUserLocation]) {
        [(VKMapView *)self->_mapView stopTrackingAnnotation];
      }
      [(MKMapView *)self removeUserLocation];
      [(MKUserLocation *)self->_userLocation reset];
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"MKUserTrackingViewDidResetUserLocationNotification" object:self userInfo:0];
    }
    [(MKMapView *)self _updateLocationConsole];
    id v4 = v6;
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_setUseVehicleHeading:(BOOL)a3
{
  uint64_t flags = (uint64_t)self->_flags;
  if (((((flags & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v6 = 0x40000;
    if (!a3) {
      uint64_t v6 = 0;
    }
    *((unsigned char *)&self->_flags + 8) = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFBFFFFLL | v6;
    -[VKMapView setHasVehicleHeading:](self->_mapView, "setHasVehicleHeading:");
    if ([(MKMapView *)self _showHeadingIndicator])
    {
      locationManager = self->_locationManager;
      if (a3)
      {
        [(MKLocationManager *)locationManager stopHeadingUpdateWithObserver:self];
      }
      else
      {
        [(MKLocationManager *)locationManager startHeadingUpdateWithObserver:self];
      }
    }
  }
}

- (void)pauseUserHeadingUpdates
{
  *(void *)&self->_flags |= 0x40uLL;
}

- (void)resumeUserHeadingUpdates
{
  *(void *)&self->_flags &= ~0x40uLL;
}

- (void)_stopTrackingHeading
{
  [(MKLocationManager *)self->_locationManager stopHeadingUpdateWithObserver:self];
  BOOL v3 = [(MKMapView *)self userLocation];
  [v3 setHeading:0];

  if ((*(void *)&self->_flags & 0x4000000000000000) != 0)
  {
    if (qword_1EB315C90 != -1) {
      dispatch_once(&qword_1EB315C90, &__block_literal_global_12);
    }
    if (_MergedGlobals_131)
    {
      id v4 = self->_unsafeDelegate;
    }
    else
    {
      id v4 = [(MKMapView *)self _safeDelegate];
    }
    id v5 = v4;
    uint64_t v6 = [(MKMapView *)self userLocation];
    [(MKMapViewDelegate *)v5 mapView:self didUpdateUserLocation:v6];
  }
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:0x1ED91A628 object:self];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:self];
}

- (void)_updateCourseForMapViewHeading:(id)a3
{
  id v4 = a3;
  if ([(MKMapView *)self _useVehicleHeading])
  {
    if ([(MKMapView *)self _showHeadingIndicator])
    {
      [(MKLocationManager *)self->_locationManager currentVehicleHeading];
      if (v5 < 0.0)
      {
        [v4 course];
        if (v6 >= 0.0)
        {
          if (objc_msgSend(v4, "_navigation_hasValidCourse"))
          {
            long long v17 = 0u;
            long long v18 = 0u;
            objc_msgSend(v4, "course", 0, 0, 0, 0);
            uint64_t v8 = v7;
            double v9 = [v4 timestamp];
            [v9 timeIntervalSinceReferenceDate];
            uint64_t v11 = v10;

            uint64_t v14 = v8;
            uint64_t v15 = 0;
            uint64_t v16 = v11;
            double v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E5E0]) initWithClientHeading:&v13];
            [(MKMapView *)self _updateHeading:v12 animated:1];
          }
        }
      }
    }
  }
}

- (void)_locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(VKMapView *)self->_mapView userLocationAnimator];
  [v8 updateVehicleHeading:a4];

  if ([(MKMapView *)self _useVehicleHeading])
  {
    BOOL v9 = [(MKMapView *)self _showHeadingIndicator];
    if (a4 >= 0.0 && v9)
    {
      [v7 timeIntervalSinceReferenceDate];
      memset(v12, 0, sizeof(v12));
      double v13 = a4;
      uint64_t v14 = 0;
      uint64_t v15 = v10;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E5E0]) initWithClientHeading:v12];
      [(MKMapView *)self _updateHeading:v11 animated:1];
    }
  }
}

- (double)_durationForCamera:(id)a3
{
  id v4 = a3;
  [(MKMapView *)self _cameraAltitudeClampedToZoomRange:v4];
  double v6 = v5;
  double v7 = v5;
  [(MKMapCamera *)self->_camera altitude];
  BOOL v9 = v6 < v8;
  double v10 = v7;
  if (!v9) {
    [(MKMapCamera *)self->_camera altitude];
  }
  double v11 = 0.0001;
  if (v10 > 0.0001)
  {
    [(MKMapCamera *)self->_camera altitude];
    double v11 = v7;
    if (v6 >= v12)
    {
      [(MKMapCamera *)self->_camera altitude];
      double v11 = v13;
    }
  }
  [(MKMapCamera *)self->_camera altitude];
  if (v6 <= v14)
  {
    [(MKMapCamera *)self->_camera altitude];
    double v7 = v15;
  }
  double v16 = 0.0;
  if (v11 < v7)
  {
    double v17 = 0.0;
    do
    {
      double v17 = v17 + 1.0;
      double v11 = v11 + v11;
    }
    while (v11 < v7);
    double v16 = v17 * 0.25;
  }
  long long v18 = [(MKMapView *)self cameraBoundary];
  if (v18)
  {
    double v19 = [(MKMapView *)self cameraBoundary];
    [v4 centerCoordinate];
    objc_msgSend(v19, "_clampedCoordinateForCoordinate:");
    uint64_t v21 = v20;
    uint64_t v23 = v22;
  }
  else
  {
    [v4 centerCoordinate];
    uint64_t v21 = v24;
    uint64_t v23 = v25;
  }
  uint64_t v44 = v21;
  uint64_t v45 = v23;
  double v26 = fmin(v16, 2.0);

  [(MKMapCamera *)self->_camera centerCoordinate];
  uint64_t v42 = v27;
  uint64_t v43 = v28;
  CLLocationCoordinate2DGetDistanceFrom();
  double v30 = fmin(v29 / fmax(v6, 0.0001) * 0.25, 2.0);
  objc_msgSend(v4, "heading", v42, v43, v44, v45);
  double v32 = v31;
  [(MKMapCamera *)self->_camera heading];
  double v34 = fmod(v32 - v33, 360.0) / 45.0 * 0.25;
  [v4 pitch];
  double v36 = v35;
  [(MKMapCamera *)self->_camera pitch];
  double v38 = vabdd_f64(v36, v37) / 20.0 * 0.25;
  if (v26 <= v30) {
    double v39 = v30;
  }
  else {
    double v39 = v26;
  }
  if (v39 <= v34) {
    double v39 = v34;
  }
  if (v39 > v38) {
    double v38 = v39;
  }
  double v40 = fmax(v38, 0.25);

  return v40;
}

- (double)_cameraAltitudeClampedToZoomRange:(id)a3
{
  id v4 = a3;
  [v4 pitch];
  double v6 = cos(v5);
  double v7 = [(MKMapView *)self cameraZoomRange];
  [v7 minCenterCoordinateDistance];
  double v9 = v6 * v8;

  double v10 = [(MKMapView *)self cameraZoomRange];
  [v10 maxCenterCoordinateDistance];
  double v12 = v11;

  [v4 altitude];
  if (v9 <= v13)
  {
    [v4 altitude];
    double v9 = v14;
  }
  if (v9 >= v6 * v12) {
    double v15 = v6 * v12;
  }
  else {
    double v15 = v9;
  }
  if (v6 * v12 <= 0.0) {
    double v16 = v9;
  }
  else {
    double v16 = v15;
  }

  return v16;
}

- (void)_setCamera:(id)a3 animated:(BOOL)a4
{
}

- (void)_setCamera:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  if (v13)
  {
    double v9 = 0.0;
    if (v6)
    {
      [(MKMapView *)self _durationForCamera:v13];
      double v9 = v10;
    }
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      uint64_t v11 = [MEMORY[0x1E4F42FF0] _currentAnimationCurve];
      [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
      -[MKMapView _setCamera:duration:timingCurve:completionHandler:](self, "_setCamera:duration:timingCurve:completionHandler:", v13, v11, v8);
    }
    else
    {
      [(MKMapView *)self _setCamera:v13 duration:*MEMORY[0x1E4FB3AD8] timing:v8 completionHandler:v9];
    }
  }
  else
  {
    double v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"camera parameter should not be nil" userInfo:0];
    [v12 raise];
  }
}

- (id)_vkTimingFunctionForUIViewAnimationCurve:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = (void *)MEMORY[0x18C139AE0](**((void **)&unk_1E54B9550 + a3), a2);
  }
  id v4 = (void *)MEMORY[0x18C139AE0](v3);

  return v4;
}

- (void)_setCamera:(id)a3 duration:(double)a4 timingCurve:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(MKMapView *)self _vkTimingFunctionForUIViewAnimationCurve:a5];
  [(MKMapView *)self _setCamera:v11 duration:v12 timing:v10 completionHandler:a4];
}

- (void)_setCamera:(id)a3 springMass:(float)a4 springStiffness:(float)a5 springDamping:(float)a6 springVelocity:(float)a7
{
  id v8 = a3;
  [(MKMapView *)self _durationForCamera:v8];
  -[MKMapView _setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:](self, "_setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:", v8, 0);
}

- (void)_setCamera:(id)a3 duration:(double)a4 springMass:(float)a5 springStiffness:(float)a6 springDamping:(float)a7 springVelocity:(float)a8 completionHandler:(id)a9
{
  id v11 = a3;
  VKAnimationCurveSpring();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(MKMapView *)self _setCamera:v11 duration:v12 timing:0 completionHandler:a4];
}

- (void)_setCameraZoomRange:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 minCenterCoordinateDistance];
  double v7 = -1.0;
  double v8 = -1.0;
  if (v9 >= 0.0)
  {
    [v6 minCenterCoordinateDistance];
    double v8 = v10;
  }
  [v6 maxCenterCoordinateDistance];
  if (v11 >= 0.0)
  {
    [v6 maxCenterCoordinateDistance];
    double v7 = v12;
  }
  char v13 = [v6 _bouncesZoom];
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    double v15 = v14;
    double v16 = -[MKMapView _vkTimingFunctionForUIViewAnimationCurve:](self, "_vkTimingFunctionForUIViewAnimationCurve:", [MEMORY[0x1E4F42FF0] _currentAnimationCurve]);
    mapView = self->_mapView;
    double v23 = v8;
    double v24 = v7;
    char v25 = v13;
    memset(v26, 0, sizeof(v26));
    [(VKMapView *)mapView setCenterCoordinateDistanceRange:&v23 duration:v16 timingFunction:v15];
  }
  else
  {
    double v18 = 0.0;
    if (v4)
    {
      double v19 = [(MKMapView *)self camera];
      [(MKMapView *)self _durationForCamera:v19];
      double v18 = v20;
    }
    uint64_t v21 = self->_mapView;
    uint64_t v22 = *MEMORY[0x1E4FB3AD8];
    double v23 = v8;
    double v24 = v7;
    char v25 = v13;
    memset(v26, 0, sizeof(v26));
    [(VKMapView *)v21 setCenterCoordinateDistanceRange:&v23 duration:v22 timingFunction:v18];
  }
}

- (void)_setCameraBoundary:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v21 = v6;
  if (v6)
  {
    if ([v6 _isEmpty])
    {
      char v7 = 1;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
      {
        [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
        double v9 = v8;
        double v10 = -[MKMapView _vkTimingFunctionForUIViewAnimationCurve:](self, "_vkTimingFunctionForUIViewAnimationCurve:", [MEMORY[0x1E4F42FF0] _currentAnimationCurve]);
        mapView = self->_mapView;
        double v12 = [v21 _vkRegionRestriction];
        [(VKMapView *)mapView setRegionRestriction:v12 duration:v10 timingFunction:v9];

LABEL_12:
        if ([(MKMapView *)self userTrackingMode])
        {
          double v17 = [(MKMapView *)self userLocation];
          double v18 = [v17 location];

          if (v18)
          {
            double v19 = [(MKMapView *)self userLocation];
            double v20 = [v19 location];

            [v20 coordinate];
            if ((objc_msgSend(v21, "_containsCoordinate:") & 1) == 0) {
              [(MKMapView *)self setUserTrackingMode:0];
            }
          }
        }
        goto LABEL_17;
      }
      char v7 = 0;
    }
    id v6 = v21;
  }
  else
  {
    char v7 = 1;
  }
  double v13 = 0.0;
  if (v4)
  {
    [(MKMapView *)self _animationDurationWhenSettingCameraBoundary:v21];
    id v6 = v21;
    double v13 = v14;
  }
  double v15 = self->_mapView;
  double v16 = [v6 _vkRegionRestriction];
  [(VKMapView *)v15 setRegionRestriction:v16 duration:*MEMORY[0x1E4FB3AD8] timingFunction:v13];

  if ((v7 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_17:
}

- (double)_animationDurationWhenSettingCameraBoundary:(id)a3
{
  id v4 = a3;
  [(MKMapCamera *)self->_camera centerCoordinate];
  double v24 = v5;
  double v25 = v6;
  double v7 = 0.0;
  if (v4)
  {
    double v8 = v5;
    double v9 = v6;
    if ((objc_msgSend(v4, "_containsCoordinate:") & 1) == 0)
    {
      objc_msgSend(v4, "_clampedCoordinateForCoordinate:", v8, v9);
      uint64_t v22 = v10;
      uint64_t v23 = v11;
      CLLocationCoordinate2DGetDistanceFrom();
      double v13 = v12;
      [(MKMapCamera *)self->_camera altitude];
      double v15 = v14;
      double v16 = 0.0001;
      if (v15 > 0.0001) {
        [(MKMapCamera *)self->_camera altitude];
      }
      double v17 = 0.25;
      double v18 = v13 / v16 * 0.25;
      BOOL v19 = v18 >= 2.0;
      BOOL v20 = v18 > 0.25 || v18 >= 2.0;
      if (v18 <= 0.25) {
        BOOL v19 = 1;
      }
      if (v20) {
        double v17 = 2.0;
      }
      if (v19) {
        double v7 = v17;
      }
      else {
        double v7 = v18;
      }
    }
  }

  return v7;
}

void __75__MKMapView_MKCamera___updateFromCamera_duration_timing_completionHandler___block_invoke()
{
}

- (void)_updateFromCamera:(id)a3
{
}

- (void)_snapToNorthIfNecessary
{
  if (self->_userTrackingMode != 2)
  {
    [(VKMapView *)self->_mapView yaw];
    double v4 = v3 * 3.14159265 / 180.0;
    if (fabs(v4) >= 0.0001)
    {
      double v5 = self->_verticalYawOverride * 3.14159265 / 180.0;
      double v6 = vabdd_f64(v5, v4);
      if (v6 >= 0.0001)
      {
        if (fabs(v5) <= 0.0001 || v6 >= 0.24)
        {
          if (vabdd_f64(0.0, v4) < 0.12)
          {
            [(MKMapView *)self _snapToTrueNorthAndCallBack:1];
          }
        }
        else
        {
          [(MKMapView *)self snapToNorth:0];
        }
      }
    }
  }
}

- (NSArray)_transitLineMarkersInCurrentViewport
{
  uint64_t v2 = [(MKMapView *)self _mapLayer];
  double v3 = [v2 transitLineMarkersInCurrentViewport];

  return (NSArray *)v3;
}

- (id)_transitLineMarkerForIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = [(MKMapView *)self _transitLineMarkersInCurrentViewport];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 mapItemIdentifier];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v14 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = objc_alloc(MEMORY[0x1E4FB3AA0]);
  double v5 = [v4 geoMapItemIdentifier];
  id v14 = (id)[v13 initWithIdentifier:v5];
LABEL_11:
  double v15 = v14;

  return v15;
}

- (void)_selectTransitLineMarker:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [v7 mapItemIdentifier];
    uint64_t v5 = [(MKMapView *)self _transitLineMarkerForIdentifier:v4];

    id v7 = (id)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(MKMapView *)self _mapLayer];
    [v6 selectTransitLineMarker:v7];
  }
}

- (void)_selectTransitLineMarkerWithIdentifier:(id)a3
{
  id v4 = [(MKMapView *)self _transitLineMarkerForIdentifier:a3];
  [(MKMapView *)self _selectTransitLineMarker:v4];
}

- (void)_deselectTransitLineMarker
{
  id v2 = [(MKMapView *)self _mapLayer];
  [v2 deselectTransitLineMarker];
}

- (BOOL)_hasSelectedTransitLines
{
  id v2 = [(MKMapView *)self _mapLayer];
  double v3 = [v2 selectedTransitLineIDs];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_selectedTransitLineIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(MKMapView *)self _mapLayer];
  double v3 = [v2 selectedTransitLineIDs];

  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [MKMapItemIdentifier alloc];
        char v12 = -[MKMapItemIdentifier initWithMUID:](v11, "initWithMUID:", objc_msgSend(v10, "unsignedLongLongValue", (void)v14));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)overlayContainer
{
  overlayContainer = self->_overlayContainer;
  if (!overlayContainer)
  {
    BOOL v4 = -[MKOverlayContainerView initWithFrame:]([MKOverlayContainerView alloc], "initWithFrame:", 0.0, 0.0, 268435456.0, 268435456.0);
    id v5 = self->_overlayContainer;
    self->_overlayContainer = v4;

    [(MKOverlayContainerView *)self->_overlayContainer setDelegate:self];
    uint64_t v6 = self->_overlayContainer;
    [(MKMapView *)self _zoomScale];
    -[MKOverlayContainerView setMapZoomScale:](v6, "setMapZoomScale:");
    [(MKOverlayContainerView *)self->_overlayContainer setMapView:self];
    [(MKMapView *)self _insertSubview:self->_overlayContainer];
    [(MKMapView *)self _updateScrollContainerView:0 forReason:0];
    overlayContainer = self->_overlayContainer;
  }

  return overlayContainer;
}

- (id)createDrawableForOverlay:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (qword_1EB315D20 != -1) {
      dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
    }
    if (_MergedGlobals_136)
    {
      id v5 = self->_unsafeDelegate;
    }
    else
    {
      id v5 = [(MKMapView *)self _safeDelegate];
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self)
    {
      if (qword_1EB315D20 != -1) {
        dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
      }
      if (_MergedGlobals_136)
      {
        uint64_t v8 = self->_unsafeDelegate;
      }
      else
      {
        uint64_t v8 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = 0;
    }
    char v12 = [(MKMapViewDelegate *)v10 mapView:self rendererForOverlay:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v12 _setUsageCounter:self->_usageCounter];
    }
    [(MKMapView *)self _countUsageForRendererIfNeeded:v12];
  }
  else
  {
    if (self)
    {
      if (qword_1EB315D20 != -1) {
        dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
      }
      if (_MergedGlobals_136)
      {
        double v9 = self->_unsafeDelegate;
      }
      else
      {
        double v9 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v11 = v9;
    }
    else
    {
      uint64_t v11 = 0;
    }
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_41;
    }
    if (self)
    {
      if (qword_1EB315D20 != -1) {
        dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
      }
      if (_MergedGlobals_136)
      {
        long long v14 = self->_unsafeDelegate;
      }
      else
      {
        long long v14 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v10 = v14;
    }
    else
    {
      uint64_t v10 = 0;
    }
    char v12 = [(MKMapViewDelegate *)v10 mapView:self viewForOverlay:v4];
  }

LABEL_41:

  return v12;
}

- (void)overlayContainerAddedDrawables:(id)a3
{
  id v19 = a3;
  id v4 = [v19 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (self)
    {
      if (qword_1EB315D20 != -1) {
        dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
      }
      if (_MergedGlobals_136)
      {
        uint64_t v6 = self->_unsafeDelegate;
      }
      else
      {
        uint64_t v6 = [(MKMapView *)self _safeDelegate];
      }
      uint64_t v10 = v6;
    }
    else
    {
      uint64_t v10 = 0;
    }
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = v19;
      if (self)
      {
        if (qword_1EB315D20 != -1) {
          dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
        }
        if (_MergedGlobals_136)
        {
          char v13 = self->_unsafeDelegate;
        }
        else
        {
          char v13 = [(MKMapView *)self _safeDelegate];
        }
        long long v15 = v13;
        id v12 = v19;
      }
      else
      {
        long long v15 = 0;
      }
      [(MKMapViewDelegate *)v15 mapView:self didAddOverlayRenderers:v12];
LABEL_39:
    }
  }
  else
  {
    char v7 = [v19 lastObject];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      if (self)
      {
        if (qword_1EB315D20 != -1) {
          dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
        }
        if (_MergedGlobals_136)
        {
          double v9 = self->_unsafeDelegate;
        }
        else
        {
          double v9 = [(MKMapView *)self _safeDelegate];
        }
        long long v14 = v9;
      }
      else
      {
        long long v14 = 0;
      }
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = v19;
        if (self)
        {
          if (qword_1EB315D20 != -1) {
            dispatch_once(&qword_1EB315D20, &__block_literal_global_23);
          }
          if (_MergedGlobals_136)
          {
            long long v18 = self->_unsafeDelegate;
          }
          else
          {
            long long v18 = [(MKMapView *)self _safeDelegate];
          }
          long long v15 = v18;
          id v17 = v19;
        }
        else
        {
          long long v15 = 0;
        }
        [(MKMapViewDelegate *)v15 mapView:self didAddOverlayViews:v17];
        goto LABEL_39;
      }
    }
  }
}

- ($FD2884BA735A6398BD92EEF91FE53E55)overlayContainerVisibleMapRect:(id)a3
{
  double v3 = [(VKMapView *)self->_mapView mapRegionIgnoringEdgeInsets];
  GEOMapRectForMapRegion();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.var1.double var1 = v15;
  result.var1.double var0 = v14;
  result.var0.double var1 = v13;
  result.var0.double var0 = v12;
  return result;
}

- (void)_invalidateAllOverlayRendererColors
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MKOverlayContainerView *)self->_overlayContainer allDrawables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _updateRenderColors];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addOverlay:(id)overlay
{
  id v4 = overlay;
  uint64_t v5 = [(MKMapView *)self overlayContainer];
  [v5 addOverlay:v4];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:17];
}

- (void)addOverlays:(NSArray *)overlays
{
  id v4 = overlays;
  uint64_t v5 = [(MKMapView *)self overlayContainer];
  [v5 addOverlays:v4];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:19];
}

- (void)addOverlay:(id)overlay level:(MKOverlayLevel)level
{
  id v6 = overlay;
  long long v7 = [(MKMapView *)self overlayContainer];
  [v7 addOverlay:v6 level:level];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:18];
}

- (void)addOverlays:(NSArray *)overlays level:(MKOverlayLevel)level
{
  id v6 = overlays;
  long long v7 = [(MKMapView *)self overlayContainer];
  [v7 addOverlays:v6 level:level];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:20];
}

- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index level:(MKOverlayLevel)level
{
  id v8 = overlay;
  long long v9 = [(MKMapView *)self overlayContainer];
  [v9 insertOverlay:v8 atIndex:index level:level];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:21];
}

- (void)removeOverlay:(id)overlay
{
  [(MKOverlayContainerView *)self->_overlayContainer removeOverlay:overlay];
  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:25];
}

- (void)removeOverlays:(NSArray *)overlays
{
  [(MKOverlayContainerView *)self->_overlayContainer removeOverlays:overlays];
  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:26];
}

- (void)insertOverlay:(id)overlay atIndex:(NSUInteger)index
{
  id v6 = overlay;
  long long v7 = [(MKMapView *)self overlayContainer];
  [v7 insertOverlay:v6 atIndex:index];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:22];
}

- (void)exchangeOverlayAtIndex:(NSUInteger)index1 withOverlayAtIndex:(NSUInteger)index2
{
  long long v7 = [(MKMapView *)self overlayContainer];
  [v7 exchangeOverlayAtIndex:index1 withOverlayAtIndex:index2];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:27];
}

- (void)exchangeOverlay:(id)overlay1 withOverlay:(id)overlay2
{
  id v6 = overlay2;
  id v7 = overlay1;
  id v8 = [(MKMapView *)self overlayContainer];
  [v8 exchangeOverlay:v7 withOverlay:v6];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:28];
}

- (void)insertOverlay:(id)overlay aboveOverlay:(id)sibling
{
  id v6 = sibling;
  id v7 = overlay;
  id v8 = [(MKMapView *)self overlayContainer];
  [v8 insertOverlay:v7 aboveOverlay:v6];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:23];
}

- (void)insertOverlay:(id)overlay belowOverlay:(id)sibling
{
  id v6 = sibling;
  id v7 = overlay;
  id v8 = [(MKMapView *)self overlayContainer];
  [v8 insertOverlay:v7 belowOverlay:v6];

  usageCounter = self->_usageCounter;

  [(MKUsageCounter *)usageCounter countUsageOfTypeIfNeeded:24];
}

- (MKOverlayView)viewForOverlay:(id)overlay
{
  uint64_t v3 = [(MKOverlayContainerView *)self->_overlayContainer drawableForOverlay:overlay];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (MKOverlayView *)v4;
}

- (MKOverlayRenderer)rendererForOverlay:(id)overlay
{
  uint64_t v3 = [(MKOverlayContainerView *)self->_overlayContainer drawableForOverlay:overlay];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (MKOverlayRenderer *)v4;
}

- (NSArray)overlays
{
  return [(MKOverlayContainerView *)self->_overlayContainer overlays];
}

- (NSArray)overlaysInLevel:(MKOverlayLevel)level
{
  return (NSArray *)[(MKOverlayContainerView *)self->_overlayContainer overlaysInLevel:level];
}

- (void)_addSetRegionBlock:(id)a3
{
}

- (void)_addSetRegionBlock:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (whenSizedBlocks)
  {
    uint64_t v8 = [(NSMutableArray *)whenSizedBlocks count];
    if (v8 >= 1)
    {
      unint64_t v9 = v8 + 1;
      do
      {
        long long v10 = [(NSMutableArray *)self->_whenSizedBlocks objectAtIndexedSubscript:v9 - 2];
        if ([v10 type] == 1 || !objc_msgSend(v10, "type"))
        {
          if (![v10 shouldRun]) {
            goto LABEL_13;
          }
          [v10 setShouldRun:0];
        }
        else if ([v10 type] == 2)
        {
          goto LABEL_13;
        }

        --v9;
      }
      while (v9 > 1);
    }
  }
  else
  {
    double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v10 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v11;
LABEL_13:
  }
  uint64_t v12 = self->_whenSizedBlocks;
  double v13 = [[MKWhenSizedBlock alloc] initWithType:0 block:v14 completion:v6];
  [(NSMutableArray *)v12 addObject:v13];
}

- (void)_addDependentSetRegionBlock:(id)a3
{
}

- (void)_addDependentSetRegionBlock:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (!whenSizedBlocks)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v9 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v8;

    whenSizedBlocks = self->_whenSizedBlocks;
  }
  long long v10 = [[MKWhenSizedBlock alloc] initWithType:1 block:v11 completion:v6];
  [(NSMutableArray *)whenSizedBlocks addObject:v10];
}

- (void)_addDependentAuxiliaryBlock:(id)a3
{
  id v8 = a3;
  whenSizedBlocks = self->_whenSizedBlocks;
  if (!whenSizedBlocks)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = self->_whenSizedBlocks;
    self->_whenSizedBlocks = v5;

    whenSizedBlocks = self->_whenSizedBlocks;
  }
  id v7 = [[MKWhenSizedBlock alloc] initWithType:2 block:v8];
  [(NSMutableArray *)whenSizedBlocks addObject:v7];
}

- (void)_performWhenSizedBlocks
{
  whenSizedBlocks = self->_whenSizedBlocks;
  self->_whenSizedBlocks = 0;
  uint64_t v3 = whenSizedBlocks;

  [(NSMutableArray *)v3 makeObjectsPerformSelector:sel_perform];
}

- (void)_createOverlayRendererDictionaryIfNeeded
{
  if (!self->_overlayRendererEventDictionary)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", &unk_1ED97E478, @"MKCircleRenderer", &unk_1ED97E490, @"MKPolylineRenderer", &unk_1ED97E4A8, @"MKMultiPolylineRenderer", &unk_1ED97E4C0, @"MKPolygonRenderer", &unk_1ED97E4D8, @"MKMultiPolygonRenderer", &unk_1ED97E4F0, @"MKTileOverlayRenderer", &unk_1ED97E508, @"MKPathOverlayRenderer", 0);
    uint64_t v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    overlayRendererEventDictionardouble y = self->_overlayRendererEventDictionary;
    self->_overlayRendererEventDictionardouble y = v3;
  }
}

- (void)_countUsageForRendererIfNeeded:(id)a3
{
  id v8 = a3;
  [(MKMapView *)self _createOverlayRendererDictionaryIfNeeded];
  if ([(NSMutableDictionary *)self->_overlayRendererEventDictionary count])
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    id v6 = [(NSMutableDictionary *)self->_overlayRendererEventDictionary objectForKeyedSubscript:v5];
    id v7 = v6;
    if (v6)
    {
      -[MKUsageCounter countUsageOfTypeIfNeeded:](self->_usageCounter, "countUsageOfTypeIfNeeded:", [v6 integerValue]);
      [(NSMutableDictionary *)self->_overlayRendererEventDictionary removeObjectForKey:v5];
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 shouldRasterize]) {
    [(MKUsageCounter *)self->_usageCounter countUsageOfTypeIfNeeded:53];
  }
}

- (NSArray)_visibleTileSets
{
  id v2 = [(MKMapView *)self _mapLayer];
  uint64_t v3 = [v2 visibleTileSets];

  return (NSArray *)v3;
}

- (NSString)_detailedDescription
{
  id v2 = [(MKMapView *)self _mapLayer];
  uint64_t v3 = [v2 detailedDescription];

  return (NSString *)v3;
}

- (NSDictionary)_detailedDescriptionDictionaryRepresentation
{
  id v2 = [(MKMapView *)self _mapLayer];
  uint64_t v3 = [v2 detailedDescriptionDictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (id)_transitLineMarkersForSelectionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MKMapView *)self _mapLayer];
  id v7 = [(MKMapView *)self _mapLayer];
  id v8 = [(MKMapView *)self layer];
  objc_msgSend(v7, "convertPoint:fromLayer:", v8, x, y);
  unint64_t v9 = objc_msgSend(v6, "transitLineMarkersForSelectionAtPoint:");

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_longPressGestureRecognizer != a3) {
    return 1;
  }
  annotationContainer = self->_annotationContainer;
  [a3 locationInView:annotationContainer];
  uint64_t v5 = -[MKAnnotationContainerView annotationViewForPoint:](annotationContainer, "annotationViewForPoint:");
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v8 = 0;
  if (self->_nonselectingTapGestureRecognizer == v6 || self->_selectingTapGestureRecognizer == v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if ((*(void *)&self->_flags & 0x1000000000000000) == 0) {
    goto LABEL_8;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    BOOL v8 = self->_unsafeDelegate;
  }
  else
  {
    BOOL v8 = [(MKMapView *)self _safeDelegate];
  }
  unint64_t v9 = v8;
  int v10 = [(MKMapViewDelegate *)v8 mapView:self shouldReceiveTouch:v7];

  if (v10)
  {
LABEL_8:
    [v7 locationInView:self];
    double v12 = v11;
    double v14 = v13;
    if ([(MKMapView *)self calloutViewContainsPoint:"calloutViewContainsPoint:"]
      || -[MKMapView accessoryViewContainsPoint:](self, "accessoryViewContainsPoint:", v12, v14))
    {
      LOBYTE(v10) = 0;
    }
    else if (self->_selectingTapGestureRecognizer != v6 {
           || ([(VKMapView *)self->_mapView enableDebugLabelHighlighting] & 1) != 0
    }
           || ([(MKAttributionLabel *)self->_attributionLabel frame],
               v24.double x = v12,
               v24.double y = v14,
               CGRectContainsPoint(v26, v24))
           || ([(UIImageView *)self->_attributionBadgeView frame],
               v25.double x = v12,
               v25.double y = v14,
               CGRectContainsPoint(v27, v25))
           && [(MKMapView *)self _isAttributionBadgeClickable])
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 1;
      char v16 = -[MKMapView _annotationAtPoint:avoidCurrent:](self, "_annotationAtPoint:avoidCurrent:", 1, v12, v14);

      if (!v16)
      {
        id v17 = -[MKMapView _labelMarkerAtPoint:](self, "_labelMarkerAtPoint:", v12, v14);
        long long v18 = v17;
        if (v17 && (([v17 isSelectable] & 1) != 0 || (*(void *)&self->_flags & 0x4000000000) != 0))
        {
          if (qword_1EB316030 != -1) {
            dispatch_once(&qword_1EB316030, &__block_literal_global_66);
          }
          if (_MergedGlobals_159)
          {
            id v19 = self->_unsafeDelegate;
          }
          else
          {
            id v19 = [(MKMapView *)self _safeDelegate];
          }
          long long v20 = v19;
          char v21 = objc_opt_respondsToSelector();

          if (v21)
          {
            if (qword_1EB316030 != -1) {
              dispatch_once(&qword_1EB316030, &__block_literal_global_66);
            }
            if (_MergedGlobals_159)
            {
              uint64_t v22 = self->_unsafeDelegate;
            }
            else
            {
              uint64_t v22 = [(MKMapView *)self _safeDelegate];
            }
            uint64_t v23 = v22;
            LOBYTE(v10) = [(MKMapViewDelegate *)v22 mapView:self shouldSelectLabelMarker:v18];
          }
          else
          {
            LOBYTE(v10) = 1;
          }
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
    }
  }

  return v10;
}

- (void)_handleLongPressGesture:(id)a3
{
  id v4 = a3;
  id v33 = v4;
  if ((*(void *)&self->_flags & 0x200) != 0
    && ([v4 state] == 3 || (BOOL v16 = objc_msgSend(v33, "state") == 4, v4 = v33, v16)))
  {
    int v10 = self->_longPressedAnnotationView;
    longPressedAnnotationView = self->_longPressedAnnotationView;
    self->_longPressedAnnotationView = 0;

    if ((*(void *)&self->_flags & 0x10000000000000) != 0)
    {
      [(MKMapView *)self _dropDraggingAnnotationView:0];
    }
    else if ([(MKAnnotationView *)v10 isHighlighted])
    {
      [(MKAnnotationView *)v10 setHighlighted:0];
    }
    *(void *)&self->_flags &= ~0x200uLL;
    [(MKMapGestureController *)self->_gestureController stopUserInteractionFromExternalGesture];
  }
  else
  {
    [v4 locationInView:self->_annotationContainer];
    double v7 = v5;
    double v8 = v6;
    if ((*(void *)&self->_flags & 0x10000000000000) != 0)
    {
      [(MKMapView *)self _edgeInsets];
      -[MKAnnotationContainerView draggingTouchMovedToPoint:edgeInsets:](self->_annotationContainer, "draggingTouchMovedToPoint:edgeInsets:", v7, v8, v20, v21, v22, v23);
      goto LABEL_35;
    }
    -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 0, v5, v6, 10.0);
    unint64_t v9 = (MKAnnotationView *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    if (v9)
    {
      BOOL v11 = [(MKAnnotationView *)v9 isSelected];
      char v12 = *((unsigned char *)&self->_flags + 8);
      uint64_t flags = (uint64_t)self->_flags;
      int v14 = !v11;
      if ((flags & 0x10000000000000) != 0) {
        int v14 = 0;
      }
      if ((flags & 0x200) == 0 || v14)
      {
        *(void *)&self->_uint64_t flags = flags | 0x200;
        *((unsigned char *)&self->_flags + 8) = v12;
        double v15 = self->_longPressedAnnotationView;
        if (v15) {
          BOOL v16 = v15 == v10;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          [(MKAnnotationView *)v15 setHighlighted:0];
        }
        objc_storeStrong((id *)&self->_longPressedAnnotationView, v10);
        if ([v33 state] == 1) {
          [(MKMapGestureController *)self->_gestureController startUserInteractionFromExternalGesture];
        }
        if ([(MKAnnotationView *)v10 isDraggable])
        {
          id v17 = [(MKAnnotationView *)v10 annotation];
          char v18 = objc_opt_respondsToSelector();
        }
        else
        {
          char v18 = 0;
        }
        if ([(MKAnnotationView *)v10 isSelected])
        {
          [(MKAnnotationView *)v10 setHighlighted:1];
          if (v18)
          {
            *(void *)&self->_flags &= ~4uLL;
            CGRect v26 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
            int v27 = [v26 _shouldDeselectWhenDragged];

            if (v27) {
              [(MKAnnotationManager *)self->_annotationManager deselectAnnotation:0 animated:1];
            }
            uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v28 removeObserver:self name:0x1ED91FFC8 object:0];

            double v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v29 addObserver:self selector:sel__annotationViewDragStateChanged_ name:0x1ED91FFC8 object:v10];

            double v30 = [(MKAnnotationView *)v10 annotation];
            [(MKAnnotationManager *)self->_annotationManager setDraggedAnnotation:v30];

            -[MKAnnotationContainerView _liftForDragging:mouseDownPoint:](self->_annotationContainer, "_liftForDragging:mouseDownPoint:", v10, v7, v8);
            *(void *)&self->_flags |= 0x10000000000000uLL;
          }
        }
        else
        {
          annotationManager = self->_annotationManager;
          double v32 = [(MKAnnotationView *)v10 annotation];
          [(MKAnnotationManager *)annotationManager selectAnnotation:v32 animated:1];
        }
      }
    }
    else
    {
      CGPoint v24 = self->_longPressedAnnotationView;
      self->_longPressedAnnotationView = 0;
      CGPoint v25 = v24;

      [(MKAnnotationView *)v25 setHighlighted:0];
    }
  }

LABEL_35:
}

- (void)_handleSelectGestureToSelect:(id)a3
{
  [a3 locationInView:self];

  -[MKMapView _handleSelectionAtPoint:](self, "_handleSelectionAtPoint:");
}

- (void)_handleSelectGestureToDeselect:(id)a3
{
  id v15 = a3;
  if (self)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      id v4 = self->_unsafeDelegate;
    }
    else
    {
      id v4 = [(MKMapView *)self _safeDelegate];
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_20:
    unint64_t v9 = [(MKAnnotationManager *)self->_annotationManager selectedAnnotationRepresentation];
    int v10 = v9;
    if (v9)
    {
      BOOL v11 = [v9 viewRepresentation];
      char v12 = v11;
      annotationManager = self->_annotationManager;
      if (v11)
      {
        int v14 = [v11 annotation];
        [(MKAnnotationManager *)annotationManager deselectAnnotation:v14 animated:1];
      }
      else
      {
        [(MKAnnotationManager *)annotationManager deselectAnnotation:v10 animated:1];
      }
    }
    goto LABEL_26;
  }
  if (self)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      double v6 = self->_unsafeDelegate;
    }
    else
    {
      double v6 = [(MKMapView *)self _safeDelegate];
    }
    double v7 = v6;
  }
  else
  {
    double v7 = 0;
  }
  int v8 = [(MKMapViewDelegate *)v7 mapViewShouldHandleTapToDeselect:self];

  if (v8) {
    goto LABEL_20;
  }
LABEL_26:
}

- (BOOL)_isChangingRegionForGesture
{
  return (*(void *)&self->_flags & 0x60404000) != 0;
}

- (void)gestureControllerWillStartUserInteraction:(id)a3
{
  [(VKMapView *)self->_mapView setGesturing:1];
  self->_preGesturingLoopRate = [(VKMapView *)self->_mapView displayRate];
  [(VKMapView *)self->_mapView setDisplayRate:-1];
  if ((*(void *)&self->_flags & 0x40000000000) != 0) {
    [(MKMapView *)self pauseUserLocationUpdates];
  }
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    id v4 = self->_unsafeDelegate;
  }
  else
  {
    id v4 = [(MKMapView *)self _safeDelegate];
  }
  double v5 = v4;
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      double v7 = self->_unsafeDelegate;
    }
    else
    {
      double v7 = [(MKMapView *)self _safeDelegate];
    }
    int v8 = v7;
    [(MKMapViewDelegate *)v7 mapViewDidStartUserInteraction:self];
  }
}

- (void)gestureControllerDidStopUserInteraction:(id)a3
{
  id v10 = a3;
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;
  }
  [(VKMapView *)self->_mapView setGesturing:0];
  [(VKMapView *)self->_mapView setDisplayRate:self->_preGesturingLoopRate];
  if ((*(void *)&self->_flags & 0x40000000000) != 0) {
    [(MKMapView *)self resumeUserLocationUpdates];
  }
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    double v5 = self->_unsafeDelegate;
  }
  else
  {
    double v5 = [(MKMapView *)self _safeDelegate];
  }
  char v6 = v5;
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      int v8 = self->_unsafeDelegate;
    }
    else
    {
      int v8 = [(MKMapView *)self _safeDelegate];
    }
    unint64_t v9 = v8;
    [(MKMapViewDelegate *)v8 mapViewDidStopUserInteraction:self];
  }
}

- (void)gestureControllerWillStartPanning:(id)a3
{
  id v10 = a3;
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    double v5 = self->_unsafeDelegate;
  }
  else
  {
    double v5 = [(MKMapView *)self _safeDelegate];
  }
  char v6 = v5;
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      int v8 = self->_unsafeDelegate;
    }
    else
    {
      int v8 = [(MKMapView *)self _safeDelegate];
    }
    unint64_t v9 = v8;
    [(MKMapViewDelegate *)v8 mapView:self willStartRespondingToGesture:0 animated:0];
  }
  *(void *)&self->_flags |= 0x4000uLL;
  [(MKMapView *)self _updateIconsShouldAlignToPixels];
}

- (void)gestureControllerDidStopPanning:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) != 0)
  {
    id v18 = v6;
    char v8 = *((unsigned char *)&self->_flags + 8);
    if (a4)
    {
      *(void *)&self->_uint64_t flags = flags | 8;
      *((unsigned char *)&self->_flags + 8) = v8;
      [(MKMapView *)self _updateIconsShouldAlignToPixels];
LABEL_29:
      id v6 = v18;
      goto LABEL_30;
    }
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFFBFF7;
    *((unsigned char *)&self->_flags + 8) = v8;
    [(MKMapView *)self _updateIconsShouldAlignToPixels];
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      unint64_t v9 = self->_unsafeDelegate;
    }
    else
    {
      unint64_t v9 = [(MKMapView *)self _safeDelegate];
    }
    id v10 = v9;
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        char v12 = self->_unsafeDelegate;
      }
      else
      {
        char v12 = [(MKMapView *)self _safeDelegate];
      }
      int v14 = v12;
      [(MKMapViewDelegate *)v12 mapView:self didStopRespondingToGesture:0 zoomDirection:0 zoomGestureType:0 didDecelerate:0 tiltDirection:0];
LABEL_28:

      goto LABEL_29;
    }
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      double v13 = self->_unsafeDelegate;
    }
    else
    {
      double v13 = [(MKMapView *)self _safeDelegate];
    }
    id v15 = v13;
    char v16 = objc_opt_respondsToSelector();

    id v6 = v18;
    if (v16)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v17 = self->_unsafeDelegate;
      }
      else
      {
        id v17 = [(MKMapView *)self _safeDelegate];
      }
      int v14 = v17;
      [(MKMapViewDelegate *)v17 mapView:self didStopRespondingToGesture:0 zoomDirection:0 didDecelerate:0 tiltDirection:0];
      goto LABEL_28;
    }
  }
LABEL_30:
}

- (void)gestureControllerDidStopPanningDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    id v16 = v4;
    char v6 = *((unsigned char *)&self->_flags + 8);
    *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFFFFFBFF7;
    *((unsigned char *)&self->_flags + 8) = v6;
    [(MKMapView *)self _updateIconsShouldAlignToPixels];
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v7 = self->_unsafeDelegate;
    }
    else
    {
      char v7 = [(MKMapView *)self _safeDelegate];
    }
    char v8 = v7;
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v10 = self->_unsafeDelegate;
      }
      else
      {
        id v10 = [(MKMapView *)self _safeDelegate];
      }
      char v12 = v10;
      [(MKMapViewDelegate *)v10 mapView:self didStopRespondingToGesture:0 zoomDirection:0 zoomGestureType:0 didDecelerate:1 tiltDirection:0];
LABEL_26:

      id v4 = v16;
      goto LABEL_27;
    }
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v11 = self->_unsafeDelegate;
    }
    else
    {
      char v11 = [(MKMapView *)self _safeDelegate];
    }
    double v13 = v11;
    char v14 = objc_opt_respondsToSelector();

    id v4 = v16;
    if (v14)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v15 = self->_unsafeDelegate;
      }
      else
      {
        id v15 = [(MKMapView *)self _safeDelegate];
      }
      char v12 = v15;
      [(MKMapViewDelegate *)v15 mapView:self didStopRespondingToGesture:0 zoomDirection:0 didDecelerate:1 tiltDirection:0];
      goto LABEL_26;
    }
  }
LABEL_27:
}

- (void)gestureControllerWillStartZooming:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    char v7 = self->_unsafeDelegate;
  }
  else
  {
    char v7 = [(MKMapView *)self _safeDelegate];
  }
  char v8 = v7;
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      id v10 = self->_unsafeDelegate;
    }
    else
    {
      id v10 = [(MKMapView *)self _safeDelegate];
    }
    char v11 = v10;
    [(MKMapViewDelegate *)v10 mapView:self willStartRespondingToGesture:1 animated:v4];
  }
  if ((*(void *)&self->_flags & 0x400000) == 0) {
    [(MKMapView *)self _willStartZoom:v4];
  }
}

- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 willDecelerate:(BOOL)a5
{
}

- (void)gestureControllerDidStopZooming:(id)a3 direction:(int64_t)a4 type:(int64_t)a5 willDecelerate:(BOOL)a6
{
  id v10 = a3;
  if ((*(void *)&self->_flags & 0x400000) != 0 && !a6)
  {
    id v20 = v10;
    [(MKMapView *)self _didEndZoom];
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v11 = self->_unsafeDelegate;
    }
    else
    {
      char v11 = [(MKMapView *)self _safeDelegate];
    }
    id v12 = v11;
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        char v14 = self->_unsafeDelegate;
      }
      else
      {
        char v14 = [(MKMapView *)self _safeDelegate];
      }
      id v16 = v14;
      [(MKMapViewDelegate *)v14 mapView:self didStopRespondingToGesture:1 zoomDirection:a4 zoomGestureType:a5 didDecelerate:0 tiltDirection:0];
LABEL_27:

      id v10 = v20;
      goto LABEL_28;
    }
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      id v15 = self->_unsafeDelegate;
    }
    else
    {
      id v15 = [(MKMapView *)self _safeDelegate];
    }
    id v17 = v15;
    char v18 = objc_opt_respondsToSelector();

    id v10 = v20;
    if (v18)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v19 = self->_unsafeDelegate;
      }
      else
      {
        id v19 = [(MKMapView *)self _safeDelegate];
      }
      id v16 = v19;
      [(MKMapViewDelegate *)v19 mapView:self didStopRespondingToGesture:1 zoomDirection:a4 didDecelerate:0 tiltDirection:0];
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4
{
}

- (void)gestureControllerDidStopZoomingDecelerating:(id)a3 direction:(int64_t)a4 type:(int64_t)a5
{
  [(MKMapView *)self _didEndZoom];
  if (self)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v8 = self->_unsafeDelegate;
    }
    else
    {
      char v8 = [(MKMapView *)self _safeDelegate];
    }
    char v9 = v8;
  }
  else
  {
    char v9 = 0;
  }
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (self)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        char v11 = self->_unsafeDelegate;
      }
      else
      {
        char v11 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      char v11 = 0;
    }
    id v16 = v11;
    [(MKMapViewDelegate *)v11 mapView:self didStopRespondingToGesture:1 zoomDirection:a4 zoomGestureType:a5 didDecelerate:1 tiltDirection:0];
LABEL_36:

    return;
  }
  if (self)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      id v12 = self->_unsafeDelegate;
    }
    else
    {
      id v12 = [(MKMapView *)self _safeDelegate];
    }
    char v13 = v12;
  }
  else
  {
    char v13 = 0;
  }
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (self)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v15 = self->_unsafeDelegate;
      }
      else
      {
        id v15 = [(MKMapView *)self _safeDelegate];
      }
    }
    else
    {
      id v15 = 0;
    }
    id v16 = v15;
    [(MKMapViewDelegate *)v15 mapView:self didStopRespondingToGesture:1 zoomDirection:a4 didDecelerate:1 tiltDirection:0];
    goto LABEL_36;
  }
}

- (void)gestureControllerWillStartTwoFingerLongPress:(id)a3
{
  id v13 = a3;
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;

    uint64_t flags = *(void *)p_flags;
  }
  char v7 = *((unsigned char *)&self->_flags + 8);
  *(void *)p_uint64_t flags = flags | 0x200000000000000;
  *((unsigned char *)&self->_flags + 8) = v7;
  [(MKMapView *)self _showOrHideScaleIfNecessary:0];
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    char v8 = self->_unsafeDelegate;
  }
  else
  {
    char v8 = [(MKMapView *)self _safeDelegate];
  }
  char v9 = v8;
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v11 = self->_unsafeDelegate;
    }
    else
    {
      char v11 = [(MKMapView *)self _safeDelegate];
    }
    id v12 = v11;
    [(MKMapViewDelegate *)v11 mapView:self willStartRespondingToGesture:4 animated:0];
  }
}

- (void)gestureControllerDidStopTwoFingerLongPress:(id)a3
{
  *(void *)&self->_flags &= ~0x200000000000000uLL;
  [(MKMapView *)self _showOrHideScaleIfNecessary:1];
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    BOOL v4 = self->_unsafeDelegate;
  }
  else
  {
    BOOL v4 = [(MKMapView *)self _safeDelegate];
  }
  double v5 = v4;
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v7 = self->_unsafeDelegate;
    }
    else
    {
      char v7 = [(MKMapView *)self _safeDelegate];
    }
    id v12 = v7;
    [(MKMapViewDelegate *)v7 mapView:self didStopRespondingToGesture:4 zoomDirection:0 zoomGestureType:0 didDecelerate:0 tiltDirection:0];
LABEL_26:

    return;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    char v8 = self->_unsafeDelegate;
  }
  else
  {
    char v8 = [(MKMapView *)self _safeDelegate];
  }
  char v9 = v8;
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v11 = self->_unsafeDelegate;
    }
    else
    {
      char v11 = [(MKMapView *)self _safeDelegate];
    }
    id v12 = v11;
    [(MKMapViewDelegate *)v11 mapView:self didStopRespondingToGesture:4 zoomDirection:0 didDecelerate:0 tiltDirection:0];
    goto LABEL_26;
  }
}

- (void)gestureControllerWillStartRotating:(id)a3
{
  id v10 = a3;
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    double v5 = self->_unsafeDelegate;
  }
  else
  {
    double v5 = [(MKMapView *)self _safeDelegate];
  }
  char v6 = v5;
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v8 = self->_unsafeDelegate;
    }
    else
    {
      char v8 = [(MKMapView *)self _safeDelegate];
    }
    char v9 = v8;
    [(MKMapViewDelegate *)v8 mapView:self willStartRespondingToGesture:2 animated:0];
  }
  *(void *)&self->_flags |= 0x100000020000000uLL;
  if (self->_userTrackingMode == 2) {
    [(MKMapView *)self _setUserTrackingMode:1 animated:1 fromTrackingButton:0];
  }
}

- (void)gestureControllerDidStopRotating:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x20000000) != 0)
    {
      id v24 = v6;
      char v8 = *((unsigned char *)&self->_flags + 8);
      *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFDFFFFFFFLL;
      *((unsigned char *)&self->_flags + 8) = v8;
      [(VKMapView *)self->_mapView yaw];
      double v10 = v9;
      long double verticalYawOverride = self->_verticalYawOverride;
      double v12 = fmod(v9, 360.0);
      if (v10 >= 0.0) {
        double v13 = v12;
      }
      else {
        double v13 = v12 + 360.0;
      }
      double v14 = fmod(verticalYawOverride, 360.0);
      if (verticalYawOverride < 0.0) {
        double v14 = v14 + 360.0;
      }
      if (vabdd_f64(v13, v14) > 180.0)
      {
        if (v13 >= v14) {
          double v14 = v14 + 360.0;
        }
        else {
          double v13 = v13 + 360.0;
        }
      }
      *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | ((unint64_t)(vabdd_f64(v14, v13) > 0.1) << 50);
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v15 = self->_unsafeDelegate;
      }
      else
      {
        id v15 = [(MKMapView *)self _safeDelegate];
      }
      id v16 = v15;
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        if (qword_1EB316030 != -1) {
          dispatch_once(&qword_1EB316030, &__block_literal_global_66);
        }
        if (_MergedGlobals_159)
        {
          char v18 = self->_unsafeDelegate;
        }
        else
        {
          char v18 = [(MKMapView *)self _safeDelegate];
        }
        id v20 = v18;
        [(MKMapViewDelegate *)v18 mapView:self didStopRespondingToGesture:2 zoomDirection:0 zoomGestureType:0 didDecelerate:0 tiltDirection:0];
LABEL_36:

        id v6 = v24;
        goto LABEL_37;
      }
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v19 = self->_unsafeDelegate;
      }
      else
      {
        id v19 = [(MKMapView *)self _safeDelegate];
      }
      double v21 = v19;
      char v22 = objc_opt_respondsToSelector();

      id v6 = v24;
      if (v22)
      {
        if (qword_1EB316030 != -1) {
          dispatch_once(&qword_1EB316030, &__block_literal_global_66);
        }
        if (_MergedGlobals_159)
        {
          double v23 = self->_unsafeDelegate;
        }
        else
        {
          double v23 = [(MKMapView *)self _safeDelegate];
        }
        id v20 = v23;
        [(MKMapViewDelegate *)v23 mapView:self didStopRespondingToGesture:2 zoomDirection:0 didDecelerate:0 tiltDirection:0];
        goto LABEL_36;
      }
    }
  }
LABEL_37:
}

- (void)gestureControllerWillStartTilting:(id)a3
{
  id v10 = a3;
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
    [(VKLabelMarker *)self->_pressedLabelMarker setLabelPressed:0];
    pressedLabelMarker = self->_pressedLabelMarker;
    self->_pressedLabelMarker = 0;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    double v5 = self->_unsafeDelegate;
  }
  else
  {
    double v5 = [(MKMapView *)self _safeDelegate];
  }
  id v6 = v5;
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v8 = self->_unsafeDelegate;
    }
    else
    {
      char v8 = [(MKMapView *)self _safeDelegate];
    }
    long double v9 = v8;
    [(MKMapViewDelegate *)v8 mapView:self willStartRespondingToGesture:3 animated:0];
  }
  *(void *)&self->_flags |= 0x40000000uLL;
}

- (void)gestureControllerDidStopTilting:(id)a3 willDecelerate:(BOOL)a4 tiltDirection:(int64_t)a5
{
  id v8 = a3;
  if (!a4)
  {
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x40000000) != 0)
    {
      id v20 = v8;
      char v10 = *((unsigned char *)&self->_flags + 8);
      *(void *)&self->_uint64_t flags = flags & 0xFFFFFFFFBFFFFFFFLL;
      *((unsigned char *)&self->_flags + 8) = v10;
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        char v11 = self->_unsafeDelegate;
      }
      else
      {
        char v11 = [(MKMapView *)self _safeDelegate];
      }
      double v12 = v11;
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        if (qword_1EB316030 != -1) {
          dispatch_once(&qword_1EB316030, &__block_literal_global_66);
        }
        if (_MergedGlobals_159)
        {
          double v14 = self->_unsafeDelegate;
        }
        else
        {
          double v14 = [(MKMapView *)self _safeDelegate];
        }
        id v16 = v14;
        [(MKMapViewDelegate *)v14 mapView:self didStopRespondingToGesture:3 zoomDirection:0 zoomGestureType:0 didDecelerate:0 tiltDirection:a5];
LABEL_27:

        id v8 = v20;
        goto LABEL_28;
      }
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        id v15 = self->_unsafeDelegate;
      }
      else
      {
        id v15 = [(MKMapView *)self _safeDelegate];
      }
      char v17 = v15;
      char v18 = objc_opt_respondsToSelector();

      id v8 = v20;
      if (v18)
      {
        if (qword_1EB316030 != -1) {
          dispatch_once(&qword_1EB316030, &__block_literal_global_66);
        }
        if (_MergedGlobals_159)
        {
          id v19 = self->_unsafeDelegate;
        }
        else
        {
          id v19 = [(MKMapView *)self _safeDelegate];
        }
        id v16 = v19;
        [(MKMapViewDelegate *)v19 mapView:self didStopRespondingToGesture:3 zoomDirection:0 didDecelerate:0 tiltDirection:a5];
        goto LABEL_27;
      }
    }
  }
LABEL_28:
}

- (void)gestureControllerDidStopTiltingDecelerating:(id)a3
{
  id v13 = a3;
  *(void *)&self->_flags &= ~0x40000000uLL;
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    BOOL v4 = self->_unsafeDelegate;
  }
  else
  {
    BOOL v4 = [(MKMapView *)self _safeDelegate];
  }
  double v5 = v4;
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v7 = self->_unsafeDelegate;
    }
    else
    {
      char v7 = [(MKMapView *)self _safeDelegate];
    }
    long double v9 = v7;
    [(MKMapViewDelegate *)v7 mapView:self didStopRespondingToGesture:3 zoomDirection:0 zoomGestureType:0 didDecelerate:1 tiltDirection:0];
LABEL_25:

    goto LABEL_26;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    id v8 = self->_unsafeDelegate;
  }
  else
  {
    id v8 = [(MKMapView *)self _safeDelegate];
  }
  char v10 = v8;
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      double v12 = self->_unsafeDelegate;
    }
    else
    {
      double v12 = [(MKMapView *)self _safeDelegate];
    }
    long double v9 = v12;
    [(MKMapViewDelegate *)v12 mapView:self didStopRespondingToGesture:3 zoomDirection:0 didDecelerate:1 tiltDirection:0];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)gestureControllerDidStopRotatingDecelerating:(id)a3
{
  *(void *)&self->_flags &= ~0x20000000uLL;
  [(VKMapView *)self->_mapView yaw];
  double v5 = v4;
  long double verticalYawOverride = self->_verticalYawOverride;
  double v7 = fmod(v4, 360.0);
  if (v5 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = v7 + 360.0;
  }
  double v9 = fmod(verticalYawOverride, 360.0);
  if (verticalYawOverride < 0.0) {
    double v9 = v9 + 360.0;
  }
  if (vabdd_f64(v8, v9) > 180.0)
  {
    if (v8 >= v9) {
      double v9 = v9 + 360.0;
    }
    else {
      double v8 = v8 + 360.0;
    }
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | ((unint64_t)(vabdd_f64(v9, v8) > 0.1) << 50);
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    char v10 = self->_unsafeDelegate;
  }
  else
  {
    char v10 = [(MKMapView *)self _safeDelegate];
  }
  char v11 = v10;
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      id v13 = self->_unsafeDelegate;
    }
    else
    {
      id v13 = [(MKMapView *)self _safeDelegate];
    }
    char v18 = v13;
    [(MKMapViewDelegate *)v13 mapView:self didStopRespondingToGesture:2 zoomDirection:0 zoomGestureType:0 didDecelerate:1 tiltDirection:0];
LABEL_35:

    return;
  }
  if (qword_1EB316030 != -1) {
    dispatch_once(&qword_1EB316030, &__block_literal_global_66);
  }
  if (_MergedGlobals_159)
  {
    double v14 = self->_unsafeDelegate;
  }
  else
  {
    double v14 = [(MKMapView *)self _safeDelegate];
  }
  id v15 = v14;
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v17 = self->_unsafeDelegate;
    }
    else
    {
      char v17 = [(MKMapView *)self _safeDelegate];
    }
    char v18 = v17;
    [(MKMapViewDelegate *)v17 mapView:self didStopRespondingToGesture:2 zoomDirection:0 didDecelerate:1 tiltDirection:0];
    goto LABEL_35;
  }
}

- (BOOL)gestureController:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(void *)&self->_flags & 0x1000000000000000) != 0)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      double v9 = self->_unsafeDelegate;
    }
    else
    {
      double v9 = [(MKMapView *)self _safeDelegate];
    }
    char v10 = v9;
    char v8 = [(MKMapViewDelegate *)v9 mapView:self shouldReceiveTouch:v7];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (double)gestureController:(id)a3 shouldWaitForNextTapForDuration:(double)a4 afterTouch:(id)a5
{
  id v7 = a5;
  char v8 = v7;
  if ((*(void *)&self->_flags & 0x2000000000000000) != 0)
  {
    [v7 locationInView:self->_annotationContainer];
    double v9 = -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self->_annotationContainer, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 1);
    if (v9)
    {
      if (qword_1EB316030 != -1) {
        dispatch_once(&qword_1EB316030, &__block_literal_global_66);
      }
      if (_MergedGlobals_159)
      {
        char v10 = self->_unsafeDelegate;
      }
      else
      {
        char v10 = [(MKMapView *)self _safeDelegate];
      }
      char v11 = v10;
      [(MKMapViewDelegate *)v10 mapView:self shouldDelayTapResponse:v8 onAnnotationView:v9 forDuration:a4];
      a4 = v12;
    }
  }

  return a4;
}

- (CGPoint)gestureController:(id)a3 focusPointForPoint:(CGPoint)a4 gestureKind:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (self)
  {
    if (qword_1EB316030 != -1) {
      dispatch_once(&qword_1EB316030, &__block_literal_global_66);
    }
    if (_MergedGlobals_159)
    {
      char v10 = self->_unsafeDelegate;
    }
    else
    {
      char v10 = [(MKMapView *)self _safeDelegate];
    }
    char v11 = v10;
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MKMapViewDelegate mapView:focusPointForPoint:gesture:](v11, "mapView:focusPointForPoint:gesture:", self, a5, x, y);
      double x = v12;
      double y = v13;
    }
  }
  else
  {
    char v11 = 0;
  }

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGRect)gestureControllerSignificantViewFrame:(id)a3
{
  [(MKMapView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MKMapView *)self _edgeInsets];
  double v13 = v7 + v12;
  double v16 = v9 - (v14 + v15);
  double v18 = v11 - (v12 + v17);
  double v19 = v5 + v14;
  double v20 = v13;
  double v21 = v16;
  result.size.double height = v18;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_setRouteContextForRoute:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    double v6 = 0;
  }
  if ([v6 count]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(MKMapView *)self _setRouteContextForRoutes:v6 selectedRouteIndex:v7];
}

- (void)_setRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v8 = a3;
  if (-[MKMapView _shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:](self, "_shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:"))
  {
    double v6 = objc_alloc_init(MKRouteContextBuilder);
    uint64_t v7 = [(MKRouteContextBuilder *)v6 buildRouteContextForRoutes:v8 selectedRouteIndex:a4];
    [(MKMapView *)self _setRouteContext:v7];
  }
}

- (BOOL)_shouldUpdateSelectedRouteFromRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  if ([v24 count] <= a4)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [v24 objectAtIndexedSubscript:a4];
  }
  uint64_t v7 = [v24 count];
  BOOL v22 = v6 != 0;
  id v8 = [(VKRouteContext *)self->_routeContext routeInfo];
  double v9 = [v8 route];
  if (v9 == v6)
  {
    double v10 = [(VKRouteContext *)self->_routeContext alternateRoutes];
    uint64_t v11 = [v10 count];

    if (v7 - v22 == v11)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v24;
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(obj);
            }
            double v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (v16 != v6)
            {
              double v17 = [(VKRouteContext *)self->_routeContext alternateRoutes];
              double v18 = [v17 objectAtIndexedSubscript:v13];

              double v19 = [v18 route];
              BOOL v20 = v16 == v19;

              if (!v20)
              {

                goto LABEL_20;
              }
              ++v13;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      LOBYTE(v22) = 0;
    }
  }
  else
  {
  }
LABEL_20:

  return v22;
}

- (void)_setRouteContext:(id)a3
{
  id v5 = a3;
  id v14 = v5;
  if (v5 && self->_routeContext)
  {
    double v6 = [v5 routeInfo];
    uint64_t v7 = [v6 route];
    id v8 = [v7 uniqueRouteID];
    double v9 = [(VKRouteContext *)self->_routeContext routeInfo];
    double v10 = [v9 route];
    uint64_t v11 = [v10 uniqueRouteID];
    char v12 = [v8 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }
  objc_storeStrong((id *)&self->_routeContext, a3);
  uint64_t v13 = self->_mapView;
  [(VKMapView *)v13 setRouteContext:self->_routeContext];
  if ((v12 & 1) == 0) {
    [(VKMapView *)v13 setRouteLineSplitAnnotation:0];
  }
}

- (id)_routeInfoForRoute:(id)a3
{
  BOOL v3 = [(VKRouteContext *)self->_routeContext _routeInfoForRoute:a3];

  return v3;
}

- (void)_setRouteContextInspectedSegmentIndex:(unint64_t)a3 inspectedStepIndex:(unint64_t)a4
{
}

- (void)_setRouteContextAnnotationText:(id)a3 etaType:(int64_t)a4 tollCurrency:(unsigned __int8)a5 advisoryStyleAttributes:(id)a6 forRoute:(id)a7
{
}

- (void)_setRouteContextAnnotationTexts:(id)a3 forLegsInRoute:(id)a4
{
}

- (void)_setRouteContextAnnotationFocus:(BOOL)a3 forRoute:(id)a4
{
}

- (void)_setAlternateRouteContextAnnotationETAComparison:(unsigned __int8)a3 forRoute:(id)a4
{
}

- (void)_updateWaypointCaptions
{
  [(VKRouteContext *)self->_routeContext _updateWaypointCaptions];
  mapView = self->_mapView;

  [(VKMapView *)mapView forceLayout];
}

- (BOOL)canBecomeFocused
{
  id v2 = [(MKMapView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != 3;

  return v3;
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (id)focusEffect
{
  return 0;
}

- (void)setCustomOverrideInterfaceStyle:(int64_t)a3
{
  -[MKMapView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:");
  if (a3)
  {
    [(MKMapView *)self _updateAppearanceIfNeeded];
  }
}

- (void)zoomControlMinusPressed:(id)a3
{
}

- (void)zoomControlPlusPressed:(id)a3
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 anyObject];
  double v9 = [v8 key];
  uint64_t v10 = [v9 keyCode];
  BOOL v11 = (unint64_t)(v10 - 45) > 0x25 || ((1 << (v10 - 45)) & 0x3C00000003) == 0;
  if (v11 || ![(MKMapGestureController *)self->_gestureController keyDown:v8])
  {
    v12.receiver = self;
    v12.super_class = (Class)MKMapView;
    [(MKMapView *)&v12 pressesBegan:v6 withEvent:v7];
  }
}

- (BOOL)_pressEnded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  uint64_t v6 = [v5 keyCode];
  BOOL v8 = (unint64_t)(v6 - 45) <= 0x25
    && ((1 << (v6 - 45)) & 0x3C00000003) != 0
    && [(MKMapGestureController *)self->_gestureController keyUp:v4];

  return v8;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 anyObject];
  if (![(MKMapView *)self _pressEnded:v8])
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMapView;
    [(MKMapView *)&v9 pressesEnded:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 anyObject];
  if (![(MKMapView *)self _pressEnded:v8])
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMapView;
    [(MKMapView *)&v9 pressesCancelled:v6 withEvent:v7];
  }
}

- (id)delegate
{
  if (self)
  {
    id v2 = (id *)self;
    if (qword_1EB316210 != -1) {
      dispatch_once(&qword_1EB316210, &__block_literal_global_18_0);
    }
    if (_MergedGlobals_174)
    {
      return v2[66];
    }
    else
    {
      return (id)[v2 _safeDelegate];
    }
  }
  return self;
}

- (id)_flattenedAnnotationsForAnnotationViews:(id)a3 maxDisplayPriority:(float *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  size_t v6 = [a3 count];
  id v7 = (id *)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a3;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  unint64_t v9 = 0x1E914D000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      uint64_t v32 = v10;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(char **)(*((void *)&v39 + 1) + 8 * v13);
        double v15 = *(void **)&v14[*(int *)(v9 + 3308)];
        if (!v15) {
          double v15 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v13) annotation];
        }
        if ([v15 _isMKClusterAnnotation])
        {
          double v16 = (void *)[v15 memberAnnotations];
          size_t v6 = v6 + [v16 count] - 1;
          id v7 = (id *)malloc_type_realloc(v7, 8 * v6, 0x80040B8603338uLL);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = v12;
            uint64_t v20 = *(void *)v36;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v16);
                }
                BOOL v22 = [(MKMapView *)self viewForAnnotation:*(void *)(*((void *)&v35 + 1) + 8 * v21)];
                if (v22)
                {
                  v7[v11++] = v22;
                }
                else
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: memberView != nil", buf, 2u);
                  }
                  --v6;
                }
                ++v21;
              }
              while (v18 != v21);
              uint64_t v23 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
              uint64_t v18 = v23;
            }
            while (v23);
            unint64_t v9 = 0x1E914D000;
            uint64_t v12 = v19;
            uint64_t v10 = v32;
          }
        }
        else
        {
          v7[v11++] = v14;
        }
        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v10);
  }
  qsort_b(v7, v6, 8uLL, &__block_literal_global_101);
  [*v7 displayPriority];
  *(_DWORD *)a4 = v24;
  uint64_t v25 = 0;
  if (v6)
  {
    long long v26 = MEMORY[0x1E4F14500];
    long long v27 = v7;
    do
    {
      uint64_t v28 = *((void *)*v27 + 80);
      if (v28 || (uint64_t v28 = [*v27 annotation]) != 0)
      {
        v7[v25++] = (id)v28;
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18BAEC000, v26, OS_LOG_TYPE_FAULT, "Assertion failed: annotation != nil", buf, 2u);
      }
      ++v27;
      --v6;
    }
    while (v6);
  }
  double v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v25];
  free(v7);
  return v29;
}

uint64_t __82__MKMapView_MKNonARC___flattenedAnnotationsForAnnotationViews_maxDisplayPriority___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = *(float *)(*(void *)a2 + 648);
  float v4 = *(float *)(*(void *)a3 + 648);
  if (v3 > v4) {
    return 0xFFFFFFFFLL;
  }
  if (v3 < v4) {
    return 1;
  }
  return *(void *)a2 - *(void *)a3;
}

- (CGPoint)_convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  size_t v6 = self->_mapView;
  id v7 = a4;
  VKLocationCoordinate2DMake();
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(MKMapView *)self layer];
  -[VKMapView convertCoordinate:toPointToLayer:](v6, "convertCoordinate:toPointToLayer:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", v7, v14, v16);
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CLLocationCoordinate2D)_convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = self->_mapView;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", a4, x, y);
  double v10 = v9;
  double v12 = v11;
  double v13 = [(MKMapView *)self layer];
  -[VKMapView convertPoint:toCoordinateFromLayer:](v8, "convertPoint:toCoordinateFromLayer:", v13, v10, v12);
  CLLocationDegrees v15 = v14;
  CLLocationDegrees v17 = v16;

  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v15, v17);
  double longitude = v20.longitude;
  double latitude = v20.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CGPoint)_convertMapPoint:(id)a3 toPointToView:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v8 = self->_mapView;
  id v9 = a4;
  double v10 = [(MKMapView *)self layer];
  -[VKMapView convertMapPoint:toPointToLayer:](v8, "convertMapPoint:toPointToLayer:", v10, var0, var1);
  double v12 = v11;
  double v14 = v13;

  -[MKMapView convertPoint:toView:](self, "convertPoint:toView:", v9, v12, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_convertPoint:(CGPoint)a3 toMapPointFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = self->_mapView;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", a4, x, y);
  double v10 = v9;
  double v12 = v11;
  double v13 = [(MKMapView *)self layer];
  -[VKMapView convertPoint:toMapPointFromLayer:](v8, "convertPoint:toMapPointFromLayer:", v13, v10, v12);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double var1 = v19;
  result.double var0 = v18;
  return result;
}

- (CGRect)_convertRegion:(id *)a3 toRectToView:(id)a4
{
  id v5 = a3;
  GEOMapRectForCoordinateRegion();
  -[MKMapView _convertMapRect:toRectToView:](self, "_convertMapRect:toRectToView:", v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_convertRect:(SEL)a3 toRegionFromView:(CGRect)a4
{
  -[MKMapView _convertRect:toMapRectFromView:](self, "_convertRect:toMapRectFromView:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

  MKCoordinateRegionForMapRect(*(MKMapRect *)&v5);
  return result;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_convertRect:(CGRect)a3 toMapRectFromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v38[8] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;
  double v14 = y + height;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, x, y + height);
  double v16 = v15;
  double v18 = v17;
  double v19 = x + width;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, v19, y);
  double v21 = v20;
  double v23 = v22;
  -[MKMapView _convertPoint:toMapPointFromView:](self, "_convertPoint:toMapPointFromView:", v9, v19, v14);
  double v25 = v24;
  double v27 = v26;

  double v28 = 0.0;
  BOOL v30 = v11 == -1.0 || v13 == -1.0;
  if (v30
    || (v16 != -1.0 ? (BOOL v31 = v18 == -1.0) : (BOOL v31 = 1),
        !v31 ? (char v32 = 0) : (char v32 = 1),
        v32 || (v21 != -1.0 ? (BOOL v33 = v23 == -1.0) : (BOOL v33 = 1), !v33 ? (v34 = 0) : (v34 = 1), v34)))
  {
    double v37 = INFINITY;
  }
  else
  {
    double v37 = INFINITY;
    if (v25 != -1.0 && v27 != -1.0)
    {
      *(double *)long long v38 = v11;
      *(double *)&v38[1] = v13;
      *(double *)&v38[2] = v16;
      *(double *)&v38[3] = v18;
      *(double *)&v38[4] = v21;
      *(double *)&v38[5] = v23;
      *(double *)&v38[6] = v25;
      *(double *)&v38[7] = v27;
      double v37 = MKMapRectBoundingMapPoints((uint64_t)v38, 4);
      goto LABEL_28;
    }
  }
  double v35 = INFINITY;
  double v36 = 0.0;
LABEL_28:
  result.var1.double var1 = v36;
  result.var1.double var0 = v28;
  result.var0.double var1 = v35;
  result.var0.double var0 = v37;
  return result;
}

- (CGRect)_convertMapRect:(id)a3 toRectToView:(id)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  v57[8] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  double v10 = v6 + var1;
  double v11 = v7 + var0;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v7, v6);
  double v13 = v12;
  double v15 = v14;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v7, v10);
  double v17 = v16;
  double v19 = v18;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v11, v6);
  double v21 = v20;
  double v23 = v22;
  -[MKMapView _convertMapPoint:toPointToView:](self, "_convertMapPoint:toPointToView:", v9, v11, v10);
  double v26 = fabs(v15);
  double v27 = fabs(v17);
  double v28 = fabs(v19);
  double v29 = fabs(v21);
  double v30 = fabs(v23);
  double v31 = fabs(v24);
  double v32 = fabs(v25);
  if (fabs(v13) == INFINITY
    || v26 == INFINITY
    || v27 == INFINITY
    || v28 == INFINITY
    || v29 == INFINITY
    || v30 == INFINITY
    || v31 == INFINITY
    || v32 == INFINITY)
  {
    float64_t v46 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    float64x2_t v55 = *(float64x2_t *)(MEMORY[0x1E4F1DB20] + 16);
    float64_t v56 = *MEMORY[0x1E4F1DB20];
  }
  else
  {
    uint64_t v47 = 0;
    *(double *)double v57 = v13;
    *(double *)&v57[1] = v15;
    *(double *)&v57[2] = v17;
    *(double *)&v57[3] = v19;
    *(double *)&v57[4] = v21;
    *(double *)&v57[5] = v23;
    *(double *)&v57[6] = v24;
    *(double *)&v57[7] = v25;
    float64x2_t v48 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    float64x2_t v49 = (float64x2_t)vdupq_n_s64(0xFFF0000000000000);
    do
    {
      float64x2_t v50 = *(float64x2_t *)&v57[v47];
      float64x2_t v48 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v48, v50), (int8x16_t)v50, (int8x16_t)v48);
      float64x2_t v49 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v50, v49), (int8x16_t)v50, (int8x16_t)v49);
      v47 += 2;
    }
    while (v47 != 8);
    float64x2_t v55 = vsubq_f64(v49, v48);
    float64_t v46 = v48.f64[1];
    float64_t v56 = v48.f64[0];
  }

  double v52 = v55.f64[0];
  double v51 = v56;
  double v53 = v55.f64[1];
  double v54 = v46;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v54;
  result.origin.double x = v51;
  return result;
}

- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromView:(id)a5 withPrecision:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  double v13 = self->_mapView;
  id v14 = a5;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v11, v10);
  double v16 = v15;
  double v18 = v17;
  -[MKMapView convertPoint:fromView:](self, "convertPoint:fromView:", v14, x, y);
  double v20 = v19;
  double v22 = v21;

  double v23 = [(MKMapView *)self layer];
  -[VKMapView distanceFromPoint:toPoint:fromLayer:withPrecision:](v13, "distanceFromPoint:toPoint:fromLayer:withPrecision:", v23, a6 == 1, v16, v18, v20, v22);
  double v25 = v24;

  return v25;
}

+ ($DC1C8D958DDC8D67D0023B74A9319680)_regionThatFitsMapType:(SEL)a3 viewSize:(unint64_t)a4 viewInsets:(CGSize)a5 edgePadding:(UIEdgeInsets)a6 region:(UIEdgeInsets)a7 minZoomLevel:(id *)a8 maxZoomLevel:(double)a9 snapToZoomLevel:(double)a10
{
  CGFloat top = a6.top;
  double height = a5.height;
  double width = a5.width;
  if (a10 >= -180.0)
  {
    CGFloat left = a6.left;
    if (a10 <= 180.0)
    {
      CGFloat right = a6.right;
      CGFloat bottom = a6.bottom;
      if (a9 >= -90.0
        && a9 <= 90.0
        && v23 >= 0.0
        && v23 <= 180.0
        && v24 >= 0.0
        && v24 <= 360.0
        && a5.width - (a6.left + a6.right) - (a7.left + a7.right) > 0.0
        && a5.height - (a6.top + a6.bottom) - (a7.top + a7.bottom) > 0.0)
      {
        double v18 = result;
        GEOMapRectForCoordinateRegion();
        -[$DC1C8D958DDC8D67D0023B74A9319680 _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](v18, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", a8, 0.0, 0.0, width, height, v19, v20, v21, v22, *(void *)&top, *(void *)&left, *(void *)&bottom, *(void *)&right, *(void *)&a7.top, *(void *)&a7.left, *(void *)&a7.bottom, *(void *)&a7.right,
          v25,
          v26);
        MKCoordinateRegionForMapRect(v27);
      }
    }
  }
  return result;
}

+ (long)_mapRectThatFitsViewBounds:(double)a3 mapRect:(double)a4 viewInsets:(double)a5 edgePadding:(double)a6 minZoomLevel:(double)a7 maxZoomLevel:(double)a8 snapToZoomLevel:(uint64_t)a9
{
  if (a5 == INFINITY && a6 == INFINITY) {
    return INFINITY;
  }
  double v41[2] = v29;
  v41[3] = v28;
  v41[4] = v26;
  v41[5] = v27;
  double v31 = a3 - (a13 + a15);
  if (v31 - (a17 + a19) > 0.0)
  {
    double v32 = a4 - (a12 + a14);
    if (v32 - (a16 + a18) > 0.0)
    {
      double v33 = ceil(a20);
      double v34 = floor(a21);
      if (!a11)
      {
        double v33 = a20;
        double v34 = a21;
      }
      double v35 = *MEMORY[0x1E4F1DAD8];
      double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v41[0] = 0.0;
      v41[1] = 0.0;
      double v40 = 0.0;
      v39[0] = 0.0;
      v39[1] = 0.0;
      _scaleForMapRect(v41, &v40, v39, a11, v35, v36, v31, v32, a5, a6, a7, a8, a16, a17, a18, a19, v33, v34);
      long double v37 = v31 * 0.5 / (1.0 / exp2(21.0 - v40));
      return v41[0] - v37;
    }
  }
  return a5;
}

+ (unint64_t)minZoomLevelForMapType:(unint64_t)a3 viewSize:(CGSize)a4
{
  CGFloat v4 = a4.width * 0.0000000037252903;
  double v5 = a4.height * 0.0000000037252903;
  if (v4 <= v5) {
    CGFloat v4 = v5;
  }
  double v6 = ceil(log2(v4)) + 21.0;
  if (v6 <= 0.0) {
    return (unint64_t)0.0;
  }
  return (unint64_t)v6;
}

@end