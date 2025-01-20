@interface AXMapsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMapsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_435);
  }
  id v2 = [MEMORY[0x263F21388] sharedInstance];
  [v2 addHandler:&__block_literal_global_921 forFramework:@"StoreKitUI"];
}

void __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_439 withPreValidationHandler:&__block_literal_global_522 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_531];
}

uint64_t __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MapsAppDelegate"];
  [v2 validateClass:@"MapsApp"];
  [v2 validateClass:@"DirectionsStepTableViewCell"];
  [v2 validateClass:@"MKMapView"];
  [v2 validateClass:@"NavSignView"];
  [v2 validateClass:@"RouteAnnotationsConfiguration"];
  [v2 validateClass:@"SettingsTableViewController"];
  [v2 validateClass:@"MapsThemeLabel"];
  [v2 validateClass:@"MapsThemeMultiPartLabel"];
  [v2 validateClass:@"IOSChromeViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_mapLayer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchResult", @"infoCardTitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchResult", @"locationTitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteAnnotationsConfiguration", @"selectedRoute", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchResult", @"appearance", "I", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIApplication", @"sharedMapsDelegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsAppDelegate", @"chromeViewController", "@", 0);
  [v2 validateClass:@"RouteAnnotationsController"];
  [v2 validateClass:@"IOSChromeViewController" isKindOfClass:@"IOSBasedChromeViewController"];
  [v2 validateClass:@"IOSBasedChromeViewController" hasProperty:@"routeAnnotationsController" withType:"@"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteAnnotationsController", @"configuration", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteAnnotationsConfiguration", @"routeMarkerOptions", "Q", 0);
  [v2 validateClass:@"MapsUserLocationView"];
  [v2 validateClass:@"LookAroundPuckViewController"];

  return 1;
}

uint64_t __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"Maps"];
  [v2 setValidationTargetName:@"Maps Accessibility Bundle"];

  return MEMORY[0x270F09468]();
}

void __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MapsAppDelegateAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsNavigationButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsToolbarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsSegmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DirectionsStartEndTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DirectionsStepTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabelListViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsAppAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchResultAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavSignViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavTrayHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIMapsImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransitRouteTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsUIPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsUICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchResultTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavSignLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TwoLinesTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ContainerHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InfoCardViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransportTypeSegmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IOSFloatingControlsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsUISwitchAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SettingsTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PlaceCardViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsLargerHitTargetButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ContaineeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RAPInstructionIncorrectViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LocationRefinementViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RAPCheckmarkTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MKMapViewAccessibility__Maps__MapKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsThemeTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RouteOverviewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ActionCoordinatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeatherConditionsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoutePlanningOverviewViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PassThroughViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BrowseImageManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GuidanceLaneViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VenueFloorPickerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VenueFloorViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavActionCoordinatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeatherStackViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AirQualityConditionsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavIdleTimeoutTimerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ModalCardHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"POIAnnotationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FlyoverTrayHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ShortcutsRowCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CollectionTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CardButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ActionValidationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LookAroundFloatingButtonsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LookAroundPuckViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ShortcutsRowTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SectionHeaderOutlineCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TwoLinesOutlineCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TwoLineOutlineCellButtonAccessoryModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SectionHeaderOutlineCellAccessoryModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchHomeBrowseCategoryCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QuerySuggestionCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TwoLineCollectionViewListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TwoLinesContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CuratedCollectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CuratedCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PublisherHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CollectionsFilterCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransitDirectionsInstructionsStepViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransitDirectionsInstructionsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCGlyphButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCPOIEnrichmentHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCPOIEnrichmentModalHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCAddPhotoCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsDebugCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsDebugCollectionHeaderFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VehiclePickerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EditVehicleViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VehicleDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VehicleCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VehicleColorPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapsUserLocationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VLFCalloutViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VLFFailureViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VLFScanningInstructionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavTrayStackedLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IOSBasedChromeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"StepTrayHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RouteStepManeuverViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCRatingCategoryLikeDislikeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MapViewModeGridButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCPhotoThumbnailCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIDropShadowViewAccessibility_Maps_AppKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UserProfilePersonalizationLinkCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PedestrianARArrowGuidanceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PedestrianARInstructionContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavSignManeuverCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GuidanceManeuverViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavManeuverReroutingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavSignListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UGCRatingCategoryCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavAudioControlViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavTrayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavIndicatorsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NonSelectableCollectionViewListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeOrthogonalSectionTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ManeuverBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransitDestinationBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoutePlanningRefinementBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AccessibilityNodeAccessibility__Maps__SwiftUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CollectionSubHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoutePlanningWaypointCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeCuratedCollectionsTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoutePlanningAddStopCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TransitSchedulesStopViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VoiceVolumeControlViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NavTrayWaypointCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AllRefinementsMultiSelectElementCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MyShortcutsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LibraryPlacesViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoutePlanningOverviewRouteCreationCellAccessibility" canInteractWithTargetClass:1];
}

uint64_t __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __43__AXMapsGlue_accessibilityInitializeBundle__block_invoke_6()
{
  id v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ios.StoreKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

@end