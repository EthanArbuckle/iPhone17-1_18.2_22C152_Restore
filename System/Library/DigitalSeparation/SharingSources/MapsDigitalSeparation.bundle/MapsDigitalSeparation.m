id MAPSGetCameraLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_11020 != -1) {
    dispatch_once(&qword_11020, &stru_C228);
  }
  v0 = (void *)qword_11018;

  return v0;
}

void sub_3F00(id a1)
{
  qword_11018 = (uint64_t)os_log_create("com.apple.Maps", "Camera");

  _objc_release_x1();
}

id MAPSGetCollectionsLog()
{
  if (qword_11030 != -1) {
    dispatch_once(&qword_11030, &stru_C248);
  }
  v0 = (void *)qword_11028;

  return v0;
}

void sub_3F98(id a1)
{
  qword_11028 = (uint64_t)os_log_create("com.apple.Maps", "Collections");

  _objc_release_x1();
}

id MAPSGetContainerVCLog()
{
  if (qword_11040 != -1) {
    dispatch_once(&qword_11040, &stru_C268);
  }
  v0 = (void *)qword_11038;

  return v0;
}

void sub_4030(id a1)
{
  qword_11038 = (uint64_t)os_log_create("com.apple.Maps", "ContainerVC");

  _objc_release_x1();
}

id MAPSGetCuratedCollectionsLog()
{
  if (qword_11050 != -1) {
    dispatch_once(&qword_11050, &stru_C288);
  }
  v0 = (void *)qword_11048;

  return v0;
}

void sub_40C8(id a1)
{
  qword_11048 = (uint64_t)os_log_create("com.apple.Maps", "CuratedCollections");

  _objc_release_x1();
}

id MAPSGetEVOnboardingLog()
{
  if (qword_11060 != -1) {
    dispatch_once(&qword_11060, &stru_C2A8);
  }
  v0 = (void *)qword_11058;

  return v0;
}

void sub_4160(id a1)
{
  qword_11058 = (uint64_t)os_log_create("com.apple.Maps", "EVOnboarding");

  _objc_release_x1();
}

id MAPSGetLightLevelProvidingLog()
{
  if (qword_11070 != -1) {
    dispatch_once(&qword_11070, &stru_C2C8);
  }
  v0 = (void *)qword_11068;

  return v0;
}

void sub_41F8(id a1)
{
  qword_11068 = (uint64_t)os_log_create("com.apple.Maps", "LightLevelProviding");

  _objc_release_x1();
}

id MAPSGetMapModeLog()
{
  if (qword_11080 != -1) {
    dispatch_once(&qword_11080, &stru_C2E8);
  }
  v0 = (void *)qword_11078;

  return v0;
}

void sub_4290(id a1)
{
  qword_11078 = (uint64_t)os_log_create("com.apple.Maps", "MapMode");

  _objc_release_x1();
}

id MAPSGetMapsActivityLog()
{
  if (qword_11090 != -1) {
    dispatch_once(&qword_11090, &stru_C308);
  }
  v0 = (void *)qword_11088;

  return v0;
}

void sub_4328(id a1)
{
  qword_11088 = (uint64_t)os_log_create("com.apple.Maps", "MapsActivity");

  _objc_release_x1();
}

id MAPSGetMapsAssertLog()
{
  if (qword_110A0 != -1) {
    dispatch_once(&qword_110A0, &stru_C328);
  }
  v0 = (void *)qword_11098;

  return v0;
}

void sub_43C0(id a1)
{
  qword_11098 = (uint64_t)os_log_create("com.apple.Maps", "MapsAssert");

  _objc_release_x1();
}

id MAPSGetMapsChromeLog()
{
  if (qword_110B0 != -1) {
    dispatch_once(&qword_110B0, &stru_C348);
  }
  v0 = (void *)qword_110A8;

  return v0;
}

void sub_4458(id a1)
{
  qword_110A8 = (uint64_t)os_log_create("com.apple.Maps", "MapsChrome");

  _objc_release_x1();
}

id MAPSGetMapsDefaultLog()
{
  if (qword_110C0 != -1) {
    dispatch_once(&qword_110C0, &stru_C368);
  }
  v0 = (void *)qword_110B8;

  return v0;
}

void sub_44F0(id a1)
{
  qword_110B8 = (uint64_t)os_log_create("com.apple.Maps", "MapsDefault");

  _objc_release_x1();
}

id MAPSGetMapsLaunchLog()
{
  if (qword_110D0 != -1) {
    dispatch_once(&qword_110D0, &stru_C388);
  }
  v0 = (void *)qword_110C8;

  return v0;
}

void sub_4588(id a1)
{
  qword_110C8 = (uint64_t)os_log_create("com.apple.Maps", "MapsLaunch");

  _objc_release_x1();
}

id MAPSGetMapsNotificationsLog()
{
  if (qword_110E0 != -1) {
    dispatch_once(&qword_110E0, &stru_C3A8);
  }
  v0 = (void *)qword_110D8;

  return v0;
}

void sub_4620(id a1)
{
  qword_110D8 = (uint64_t)os_log_create("com.apple.Maps", "MapsNotifications");

  _objc_release_x1();
}

id MAPSGetMapsPerformanceLog()
{
  if (qword_110F0 != -1) {
    dispatch_once(&qword_110F0, &stru_C3C8);
  }
  v0 = (void *)qword_110E8;

  return v0;
}

void sub_46B8(id a1)
{
  qword_110E8 = (uint64_t)os_log_create("com.apple.Maps", "MapsPerformance");

  _objc_release_x1();
}

id MAPSGetLookAroundLog()
{
  if (qword_11100 != -1) {
    dispatch_once(&qword_11100, &stru_C3E8);
  }
  v0 = (void *)qword_110F8;

  return v0;
}

void sub_4750(id a1)
{
  qword_110F8 = (uint64_t)os_log_create("com.apple.Maps", "LookAround");

  _objc_release_x1();
}

id MAPSGetNavigationLog()
{
  if (qword_11110 != -1) {
    dispatch_once(&qword_11110, &stru_C408);
  }
  v0 = (void *)qword_11108;

  return v0;
}

void sub_47E8(id a1)
{
  qword_11108 = (uint64_t)os_log_create("com.apple.Maps", "Navigation");

  _objc_release_x1();
}

id MAPSGetNavigationBannersLog()
{
  if (qword_11120 != -1) {
    dispatch_once(&qword_11120, &stru_C428);
  }
  v0 = (void *)qword_11118;

  return v0;
}

void sub_4880(id a1)
{
  qword_11118 = (uint64_t)os_log_create("com.apple.Maps", "NavigationBanners");

  _objc_release_x1();
}

id MAPSGetNearbyTransitLog()
{
  if (qword_11130 != -1) {
    dispatch_once(&qword_11130, &stru_C448);
  }
  v0 = (void *)qword_11128;

  return v0;
}

void sub_4918(id a1)
{
  qword_11128 = (uint64_t)os_log_create("com.apple.Maps", "NearbyTransit");

  _objc_release_x1();
}

id MAPSGetOfflineLog()
{
  if (qword_11140 != -1) {
    dispatch_once(&qword_11140, &stru_C468);
  }
  v0 = (void *)qword_11138;

  return v0;
}

void sub_49B0(id a1)
{
  qword_11138 = (uint64_t)os_log_create("com.apple.Maps", "Offline");

  _objc_release_x1();
}

id MAPSGetPlaceCardLog()
{
  if (qword_11150 != -1) {
    dispatch_once(&qword_11150, &stru_C488);
  }
  v0 = (void *)qword_11148;

  return v0;
}

void sub_4A48(id a1)
{
  qword_11148 = (uint64_t)os_log_create("com.apple.Maps", "PlaceCard");

  _objc_release_x1();
}

id MAPSGetPPTLog()
{
  if (qword_11160 != -1) {
    dispatch_once(&qword_11160, &stru_C4A8);
  }
  v0 = (void *)qword_11158;

  return v0;
}

void sub_4AE0(id a1)
{
  qword_11158 = (uint64_t)os_log_create("com.apple.Maps", "PPT");

  _objc_release_x1();
}

id MAPSGetPreferencesSyncLog()
{
  if (qword_11170 != -1) {
    dispatch_once(&qword_11170, &stru_C4C8);
  }
  v0 = (void *)qword_11168;

  return v0;
}

void sub_4B78(id a1)
{
  qword_11168 = (uint64_t)os_log_create("com.apple.Maps", "PreferencesSync");

  _objc_release_x1();
}

id MAPSGetPrintLog()
{
  if (qword_11180 != -1) {
    dispatch_once(&qword_11180, &stru_C4E8);
  }
  v0 = (void *)qword_11178;

  return v0;
}

void sub_4C10(id a1)
{
  qword_11178 = (uint64_t)os_log_create("com.apple.Maps", "Print");

  _objc_release_x1();
}

id MAPSGetRAPLayoutLog()
{
  if (qword_11190 != -1) {
    dispatch_once(&qword_11190, &stru_C508);
  }
  v0 = (void *)qword_11188;

  return v0;
}

void sub_4CA8(id a1)
{
  qword_11188 = (uint64_t)os_log_create("com.apple.Maps", "RAPLayout");

  _objc_release_x1();
}

id MAPSGetRAPNavigationLog()
{
  if (qword_111A0 != -1) {
    dispatch_once(&qword_111A0, &stru_C528);
  }
  v0 = (void *)qword_11198;

  return v0;
}

void sub_4D40(id a1)
{
  qword_11198 = (uint64_t)os_log_create("com.apple.Maps", "RAPNavigation");

  _objc_release_x1();
}

id MAPSGetRAPSubmissionLog()
{
  if (qword_111B0 != -1) {
    dispatch_once(&qword_111B0, &stru_C548);
  }
  v0 = (void *)qword_111A8;

  return v0;
}

void sub_4DD8(id a1)
{
  qword_111A8 = (uint64_t)os_log_create("com.apple.Maps", "RAPSubmission");

  _objc_release_x1();
}

id MAPSGetRecentsLog()
{
  if (qword_111C0 != -1) {
    dispatch_once(&qword_111C0, &stru_C568);
  }
  v0 = (void *)qword_111B8;

  return v0;
}

void sub_4E70(id a1)
{
  qword_111B8 = (uint64_t)os_log_create("com.apple.Maps", "Recents");

  _objc_release_x1();
}

id MAPSGetRouteCreationLog()
{
  if (qword_111D0 != -1) {
    dispatch_once(&qword_111D0, &stru_C588);
  }
  v0 = (void *)qword_111C8;

  return v0;
}

void sub_4F08(id a1)
{
  qword_111C8 = (uint64_t)os_log_create("com.apple.Maps", "RouteCreation");

  _objc_release_x1();
}

id MAPSGetRoutePlanningLog()
{
  if (qword_111E0 != -1) {
    dispatch_once(&qword_111E0, &stru_C5A8);
  }
  v0 = (void *)qword_111D8;

  return v0;
}

void sub_4FA0(id a1)
{
  qword_111D8 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanning");

  _objc_release_x1();
}

id MAPSGetRoutePlanningFeatureDiscoveryLog()
{
  if (qword_111F0 != -1) {
    dispatch_once(&qword_111F0, &stru_C5C8);
  }
  v0 = (void *)qword_111E8;

  return v0;
}

void sub_5038(id a1)
{
  qword_111E8 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningFeatureDiscovery");

  _objc_release_x1();
}

id MAPSGetSearchACLog()
{
  if (qword_11200 != -1) {
    dispatch_once(&qword_11200, &stru_C5E8);
  }
  v0 = (void *)qword_111F8;

  return v0;
}

void sub_50D0(id a1)
{
  qword_111F8 = (uint64_t)os_log_create("com.apple.Maps", "SearchAC");

  _objc_release_x1();
}

id MAPSGetSearchACFindMyLog()
{
  if (qword_11210 != -1) {
    dispatch_once(&qword_11210, &stru_C608);
  }
  v0 = (void *)qword_11208;

  return v0;
}

void sub_5168(id a1)
{
  qword_11208 = (uint64_t)os_log_create("com.apple.Maps", "SearchACFindMy");

  _objc_release_x1();
}

id MAPSGetSearchHomeLog()
{
  if (qword_11220 != -1) {
    dispatch_once(&qword_11220, &stru_C628);
  }
  v0 = (void *)qword_11218;

  return v0;
}

void sub_5200(id a1)
{
  qword_11218 = (uint64_t)os_log_create("com.apple.Maps", "SearchHome");

  _objc_release_x1();
}

id MAPSGetSharedTripLog()
{
  if (qword_11230 != -1) {
    dispatch_once(&qword_11230, &stru_C648);
  }
  v0 = (void *)qword_11228;

  return v0;
}

void sub_5298(id a1)
{
  qword_11228 = (uint64_t)os_log_create("com.apple.Maps", "SharedTrip");

  _objc_release_x1();
}

id MAPSGetSharingLog()
{
  if (qword_11240 != -1) {
    dispatch_once(&qword_11240, &stru_C668);
  }
  v0 = (void *)qword_11238;

  return v0;
}

void sub_5330(id a1)
{
  qword_11238 = (uint64_t)os_log_create("com.apple.Maps", "Sharing");

  _objc_release_x1();
}

id MAPSGetShortcutsLog()
{
  if (qword_11250 != -1) {
    dispatch_once(&qword_11250, &stru_C688);
  }
  v0 = (void *)qword_11248;

  return v0;
}

void sub_53C8(id a1)
{
  qword_11248 = (uint64_t)os_log_create("com.apple.Maps", "Shortcuts");

  _objc_release_x1();
}

id MAPSGetTileStateCaptureLog()
{
  if (qword_11260 != -1) {
    dispatch_once(&qword_11260, &stru_C6A8);
  }
  v0 = (void *)qword_11258;

  return v0;
}

void sub_5460(id a1)
{
  qword_11258 = (uint64_t)os_log_create("com.apple.Maps", "TileStateCapture");

  _objc_release_x1();
}

id MAPSGetTransitLog()
{
  if (qword_11270 != -1) {
    dispatch_once(&qword_11270, &stru_C6C8);
  }
  v0 = (void *)qword_11268;

  return v0;
}

void sub_54F8(id a1)
{
  qword_11268 = (uint64_t)os_log_create("com.apple.Maps", "Transit");

  _objc_release_x1();
}

id MAPSGetTransitPayLog()
{
  if (qword_11280 != -1) {
    dispatch_once(&qword_11280, &stru_C6E8);
  }
  v0 = (void *)qword_11278;

  return v0;
}

void sub_5590(id a1)
{
  qword_11278 = (uint64_t)os_log_create("com.apple.Maps", "TransitPay");

  _objc_release_x1();
}

id MAPSGetTransitSchedulesLog()
{
  if (qword_11290 != -1) {
    dispatch_once(&qword_11290, &stru_C708);
  }
  v0 = (void *)qword_11288;

  return v0;
}

void sub_5628(id a1)
{
  qword_11288 = (uint64_t)os_log_create("com.apple.Maps", "TransitSchedules");

  _objc_release_x1();
}

id MAPSGetUserProfileLog()
{
  if (qword_112A0 != -1) {
    dispatch_once(&qword_112A0, &stru_C728);
  }
  v0 = (void *)qword_11298;

  return v0;
}

void sub_56C0(id a1)
{
  qword_11298 = (uint64_t)os_log_create("com.apple.Maps", "UserProfile");

  _objc_release_x1();
}

id MAPSGetVehicleDisambiguatorLog()
{
  if (qword_112B0 != -1) {
    dispatch_once(&qword_112B0, &stru_C748);
  }
  v0 = (void *)qword_112A8;

  return v0;
}

void sub_5758(id a1)
{
  qword_112A8 = (uint64_t)os_log_create("com.apple.Maps", "VehicleDisambiguator");

  _objc_release_x1();
}

id MAPSGetVirtualGarageLog()
{
  if (qword_112C0 != -1) {
    dispatch_once(&qword_112C0, &stru_C768);
  }
  v0 = (void *)qword_112B8;

  return v0;
}

void sub_57F0(id a1)
{
  qword_112B8 = (uint64_t)os_log_create("com.apple.Maps", "VirtualGarage");

  _objc_release_x1();
}

id MAPSGetWeatherLog()
{
  if (qword_112D0 != -1) {
    dispatch_once(&qword_112D0, &stru_C788);
  }
  v0 = (void *)qword_112C8;

  return v0;
}

void sub_5888(id a1)
{
  qword_112C8 = (uint64_t)os_log_create("com.apple.Maps", "Weather");

  _objc_release_x1();
}

id MAPSGetXPCLog()
{
  if (qword_112E0 != -1) {
    dispatch_once(&qword_112E0, &stru_C7A8);
  }
  v0 = (void *)qword_112D8;

  return v0;
}

void sub_5920(id a1)
{
  qword_112D8 = (uint64_t)os_log_create("com.apple.Maps", "XPC");

  _objc_release_x1();
}

id MAPSGetUGCBAAUtilitiesLog()
{
  if (qword_112F0 != -1) {
    dispatch_once(&qword_112F0, &stru_C7C8);
  }
  v0 = (void *)qword_112E8;

  return v0;
}

void sub_59B8(id a1)
{
  qword_112E8 = (uint64_t)os_log_create("com.apple.Maps", "UGCBAAUtilities");

  _objc_release_x1();
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_11300 != -1) {
    dispatch_once(&qword_11300, &stru_C7E8);
  }
  v0 = (void *)qword_112F8;

  return v0;
}

void sub_5A50(id a1)
{
  qword_112F8 = (uint64_t)os_log_create("com.apple.Maps", "IncidentsReporting");

  _objc_release_x1();
}

id MAPSGetWatermarkingLog()
{
  if (qword_11310 != -1) {
    dispatch_once(&qword_11310, &stru_C808);
  }
  v0 = (void *)qword_11308;

  return v0;
}

void sub_5AE8(id a1)
{
  qword_11308 = (uint64_t)os_log_create("com.apple.Maps", "Watermarking");

  _objc_release_x1();
}

id MAPSGetWaypointRequestLog()
{
  if (qword_11320 != -1) {
    dispatch_once(&qword_11320, &stru_C828);
  }
  v0 = (void *)qword_11318;

  return v0;
}

void sub_5B80(id a1)
{
  qword_11318 = (uint64_t)os_log_create("com.apple.Maps", "WaypointRequest");

  _objc_release_x1();
}

id MAPSGetWebBundleLog()
{
  if (qword_11330 != -1) {
    dispatch_once(&qword_11330, &stru_C848);
  }
  v0 = (void *)qword_11328;

  return v0;
}

void sub_5C18(id a1)
{
  qword_11328 = (uint64_t)os_log_create("com.apple.Maps", "WebBundle");

  _objc_release_x1();
}

id MAPSGetRAPRecordsManagerLog()
{
  if (qword_11340 != -1) {
    dispatch_once(&qword_11340, &stru_C868);
  }
  v0 = (void *)qword_11338;

  return v0;
}

void sub_5CB0(id a1)
{
  qword_11338 = (uint64_t)os_log_create("com.apple.Maps", "RAPRecordsManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoAttributionLog()
{
  if (qword_11350 != -1) {
    dispatch_once(&qword_11350, &stru_C888);
  }
  v0 = (void *)qword_11348;

  return v0;
}

void sub_5D48(id a1)
{
  qword_11348 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoAttribution");

  _objc_release_x1();
}

id MAPSGetSearchResultsImpressionsLog()
{
  if (qword_11360 != -1) {
    dispatch_once(&qword_11360, &stru_C8A8);
  }
  v0 = (void *)qword_11358;

  return v0;
}

void sub_5DE0(id a1)
{
  qword_11358 = (uint64_t)os_log_create("com.apple.Maps", "SearchResultsImpressions");

  _objc_release_x1();
}

id MAPSGetSearchRedoLog()
{
  if (qword_11370 != -1) {
    dispatch_once(&qword_11370, &stru_C8C8);
  }
  v0 = (void *)qword_11368;

  return v0;
}

void sub_5E78(id a1)
{
  qword_11368 = (uint64_t)os_log_create("com.apple.Maps", "SearchRedo");

  _objc_release_x1();
}

id MAPSGetStaleTimeBug_105865770Log()
{
  if (qword_11380 != -1) {
    dispatch_once(&qword_11380, &stru_C8E8);
  }
  v0 = (void *)qword_11378;

  return v0;
}

void sub_5F10(id a1)
{
  qword_11378 = (uint64_t)os_log_create("com.apple.Maps", "StaleTimeBug_105865770");

  _objc_release_x1();
}

id MAPSGetCustomPOIsControllerLog()
{
  if (qword_11390 != -1) {
    dispatch_once(&qword_11390, &stru_C908);
  }
  v0 = (void *)qword_11388;

  return v0;
}

void sub_5FA8(id a1)
{
  qword_11388 = (uint64_t)os_log_create("com.apple.Maps", "CustomPOIsController");

  _objc_release_x1();
}

id MAPSGetPOSIXSignalsLog()
{
  if (qword_113A0 != -1) {
    dispatch_once(&qword_113A0, &stru_C928);
  }
  v0 = (void *)qword_11398;

  return v0;
}

void sub_6040(id a1)
{
  qword_11398 = (uint64_t)os_log_create("com.apple.Maps", "POSIXSignals");

  _objc_release_x1();
}

id MAPSGetCoalescingSchedulerLog()
{
  if (qword_113B0 != -1) {
    dispatch_once(&qword_113B0, &stru_C948);
  }
  v0 = (void *)qword_113A8;

  return v0;
}

void sub_60D8(id a1)
{
  qword_113A8 = (uint64_t)os_log_create("com.apple.Maps", "CoalescingScheduler");

  _objc_release_x1();
}

id MAPSGetDeviceConnectionLog()
{
  if (qword_113C0 != -1) {
    dispatch_once(&qword_113C0, &stru_C968);
  }
  v0 = (void *)qword_113B8;

  return v0;
}

void sub_6170(id a1)
{
  qword_113B8 = (uint64_t)os_log_create("com.apple.Maps", "DeviceConnection");

  _objc_release_x1();
}

id MAPSGetDictationLog()
{
  if (qword_113D0 != -1) {
    dispatch_once(&qword_113D0, &stru_C988);
  }
  v0 = (void *)qword_113C8;

  return v0;
}

void sub_6208(id a1)
{
  qword_113C8 = (uint64_t)os_log_create("com.apple.Maps", "Dictation");

  _objc_release_x1();
}

id MAPSGetElevationGraphLog()
{
  if (qword_113E0 != -1) {
    dispatch_once(&qword_113E0, &stru_C9A8);
  }
  v0 = (void *)qword_113D8;

  return v0;
}

void sub_62A0(id a1)
{
  qword_113D8 = (uint64_t)os_log_create("com.apple.Maps", "ElevationGraph");

  _objc_release_x1();
}

id MAPSGetIncidentReportingLog()
{
  if (qword_113F0 != -1) {
    dispatch_once(&qword_113F0, &stru_C9C8);
  }
  v0 = (void *)qword_113E8;

  return v0;
}

void sub_6338(id a1)
{
  qword_113E8 = (uint64_t)os_log_create("com.apple.Maps", "IncidentReporting");

  _objc_release_x1();
}

id MAPSGetLightLevelLog()
{
  if (qword_11400 != -1) {
    dispatch_once(&qword_11400, &stru_C9E8);
  }
  v0 = (void *)qword_113F8;

  return v0;
}

void sub_63D0(id a1)
{
  qword_113F8 = (uint64_t)os_log_create("com.apple.Maps", "LightLevel");

  _objc_release_x1();
}

id MAPSGetMapRegionLog()
{
  if (qword_11410 != -1) {
    dispatch_once(&qword_11410, &stru_CA08);
  }
  v0 = (void *)qword_11408;

  return v0;
}

void sub_6468(id a1)
{
  qword_11408 = (uint64_t)os_log_create("com.apple.Maps", "MapRegion");

  _objc_release_x1();
}

id MAPSGetNavigationSimulationPromptLog()
{
  if (qword_11420 != -1) {
    dispatch_once(&qword_11420, &stru_CA28);
  }
  v0 = (void *)qword_11418;

  return v0;
}

void sub_6500(id a1)
{
  qword_11418 = (uint64_t)os_log_create("com.apple.Maps", "NavigationSimulationPrompt");

  _objc_release_x1();
}

id MAPSGetNavIndicatorsLog()
{
  if (qword_11430 != -1) {
    dispatch_once(&qword_11430, &stru_CA48);
  }
  v0 = (void *)qword_11428;

  return v0;
}

void sub_6598(id a1)
{
  qword_11428 = (uint64_t)os_log_create("com.apple.Maps", "NavIndicators");

  _objc_release_x1();
}

id MAPSGetProactiveTrayLog()
{
  if (qword_11440 != -1) {
    dispatch_once(&qword_11440, &stru_CA68);
  }
  v0 = (void *)qword_11438;

  return v0;
}

void sub_6630(id a1)
{
  qword_11438 = (uint64_t)os_log_create("com.apple.Maps", "ProactiveTray");

  _objc_release_x1();
}

id MAPSGetRAPPresenterLog()
{
  if (qword_11450 != -1) {
    dispatch_once(&qword_11450, &stru_CA88);
  }
  v0 = (void *)qword_11448;

  return v0;
}

void sub_66C8(id a1)
{
  qword_11448 = (uint64_t)os_log_create("com.apple.Maps", "RAPPresenter");

  _objc_release_x1();
}

id MAPSGetRoutePlanningOutlineLog()
{
  if (qword_11460 != -1) {
    dispatch_once(&qword_11460, &stru_CAA8);
  }
  v0 = (void *)qword_11458;

  return v0;
}

void sub_6760(id a1)
{
  qword_11458 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningOutline");

  _objc_release_x1();
}

id MAPSGetStatusIndicatorLog()
{
  if (qword_11470 != -1) {
    dispatch_once(&qword_11470, &stru_CAC8);
  }
  v0 = (void *)qword_11468;

  return v0;
}

void sub_67F8(id a1)
{
  qword_11468 = (uint64_t)os_log_create("com.apple.Maps", "StatusIndicator");

  _objc_release_x1();
}

id MAPSGetTransitNavigationLog()
{
  if (qword_11480 != -1) {
    dispatch_once(&qword_11480, &stru_CAE8);
  }
  v0 = (void *)qword_11478;

  return v0;
}

void sub_6890(id a1)
{
  qword_11478 = (uint64_t)os_log_create("com.apple.Maps", "TransitNavigation");

  _objc_release_x1();
}

id MAPSGetTurnAlertsLog()
{
  if (qword_11490 != -1) {
    dispatch_once(&qword_11490, &stru_CB08);
  }
  v0 = (void *)qword_11488;

  return v0;
}

void sub_6928(id a1)
{
  qword_11488 = (uint64_t)os_log_create("com.apple.Maps", "TurnAlerts");

  _objc_release_x1();
}

id MAPSGetUGCCallToActionViewProviderLog()
{
  if (qword_114A0 != -1) {
    dispatch_once(&qword_114A0, &stru_CB28);
  }
  v0 = (void *)qword_11498;

  return v0;
}

void sub_69C0(id a1)
{
  qword_11498 = (uint64_t)os_log_create("com.apple.Maps", "UGCCallToActionViewProvider");

  _objc_release_x1();
}

id MAPSGetUGCPhotoDownloadManagerLog()
{
  if (qword_114B0 != -1) {
    dispatch_once(&qword_114B0, &stru_CB48);
  }
  v0 = (void *)qword_114A8;

  return v0;
}

void sub_6A58(id a1)
{
  qword_114A8 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoDownloadManager");

  _objc_release_x1();
}

id MAPSGetUGCReviewedPlacesManagerLog()
{
  if (qword_114C0 != -1) {
    dispatch_once(&qword_114C0, &stru_CB68);
  }
  v0 = (void *)qword_114B8;

  return v0;
}

void sub_6AF0(id a1)
{
  qword_114B8 = (uint64_t)os_log_create("com.apple.Maps", "UGCReviewedPlacesManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoViewerDataProviderLog()
{
  if (qword_114D0 != -1) {
    dispatch_once(&qword_114D0, &stru_CB88);
  }
  v0 = (void *)qword_114C8;

  return v0;
}

void sub_6B88(id a1)
{
  qword_114C8 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoViewerDataProvider");

  _objc_release_x1();
}

id MAPSGetCarBlurViewLog()
{
  if (qword_114E0 != -1) {
    dispatch_once(&qword_114E0, &stru_CBA8);
  }
  v0 = (void *)qword_114D8;

  return v0;
}

void sub_6C20(id a1)
{
  qword_114D8 = (uint64_t)os_log_create("com.apple.Maps", "CarBlurView");

  _objc_release_x1();
}

id MAPSGetCarCardsLog()
{
  if (qword_114F0 != -1) {
    dispatch_once(&qword_114F0, &stru_CBC8);
  }
  v0 = (void *)qword_114E8;

  return v0;
}

void sub_6CB8(id a1)
{
  qword_114E8 = (uint64_t)os_log_create("com.apple.Maps", "CarCards");

  _objc_release_x1();
}

id MAPSGetCarClusterSuggestionLog()
{
  if (qword_11500 != -1) {
    dispatch_once(&qword_11500, &stru_CBE8);
  }
  v0 = (void *)qword_114F8;

  return v0;
}

void sub_6D50(id a1)
{
  qword_114F8 = (uint64_t)os_log_create("com.apple.Maps", "CarClusterSuggestion");

  _objc_release_x1();
}

id MAPSGetCarCompressionLog()
{
  if (qword_11510 != -1) {
    dispatch_once(&qword_11510, &stru_CC08);
  }
  v0 = (void *)qword_11508;

  return v0;
}

void sub_6DE8(id a1)
{
  qword_11508 = (uint64_t)os_log_create("com.apple.Maps", "CarCompression");

  _objc_release_x1();
}

id MAPSGetCarFocusLog()
{
  if (qword_11520 != -1) {
    dispatch_once(&qword_11520, &stru_CC28);
  }
  v0 = (void *)qword_11518;

  return v0;
}

void sub_6E80(id a1)
{
  qword_11518 = (uint64_t)os_log_create("com.apple.Maps", "CarFocus");

  _objc_release_x1();
}

id MAPSGetCarInstrumentClusterLog()
{
  if (qword_11530 != -1) {
    dispatch_once(&qword_11530, &stru_CC48);
  }
  v0 = (void *)qword_11528;

  return v0;
}

void sub_6F18(id a1)
{
  qword_11528 = (uint64_t)os_log_create("com.apple.Maps", "CarInstrumentCluster");

  _objc_release_x1();
}

id MAPSGetCarGuidanceLog()
{
  if (qword_11540 != -1) {
    dispatch_once(&qword_11540, &stru_CC68);
  }
  v0 = (void *)qword_11538;

  return v0;
}

void sub_6FB0(id a1)
{
  qword_11538 = (uint64_t)os_log_create("com.apple.Maps", "CarGuidance");

  _objc_release_x1();
}

id MAPSGetCarMapWidgetLog()
{
  if (qword_11550 != -1) {
    dispatch_once(&qword_11550, &stru_CC88);
  }
  v0 = (void *)qword_11548;

  return v0;
}

void sub_7048(id a1)
{
  qword_11548 = (uint64_t)os_log_create("com.apple.Maps", "CarMapWidget");

  _objc_release_x1();
}

id MAPSGetCarPlayLog()
{
  if (qword_11560 != -1) {
    dispatch_once(&qword_11560, &stru_CCA8);
  }
  v0 = (void *)qword_11558;

  return v0;
}

void sub_70E0(id a1)
{
  qword_11558 = (uint64_t)os_log_create("com.apple.Maps", "CarPlay");

  _objc_release_x1();
}

id MAPSGetCarRouteGeniusLog()
{
  if (qword_11570 != -1) {
    dispatch_once(&qword_11570, &stru_CCC8);
  }
  v0 = (void *)qword_11568;

  return v0;
}

void sub_7178(id a1)
{
  qword_11568 = (uint64_t)os_log_create("com.apple.Maps", "CarRouteGenius");

  _objc_release_x1();
}

id MAPSGetCarSessionControllerLog()
{
  if (qword_11580 != -1) {
    dispatch_once(&qword_11580, &stru_CCE8);
  }
  v0 = (void *)qword_11578;

  return v0;
}

void sub_7210(id a1)
{
  qword_11578 = (uint64_t)os_log_create("com.apple.Maps", "CarSessionController");

  _objc_release_x1();
}

id MAPSGetCarSmallWidgetLog()
{
  if (qword_11590 != -1) {
    dispatch_once(&qword_11590, &stru_CD08);
  }
  v0 = (void *)qword_11588;

  return v0;
}

void sub_72A8(id a1)
{
  qword_11588 = (uint64_t)os_log_create("com.apple.Maps", "CarSmallWidget");

  _objc_release_x1();
}

id MAPSGetCompanionControllerLog()
{
  if (qword_115A0 != -1) {
    dispatch_once(&qword_115A0, &stru_CD28);
  }
  v0 = (void *)qword_11598;

  return v0;
}

void sub_7340(id a1)
{
  qword_11598 = (uint64_t)os_log_create("com.apple.Maps", "CompanionController");

  _objc_release_x1();
}

id MAPSGetHydrateGeoMapItemLog()
{
  if (qword_115B0 != -1) {
    dispatch_once(&qword_115B0, &stru_CD48);
  }
  v0 = (void *)qword_115A8;

  return v0;
}

void sub_73D8(id a1)
{
  qword_115A8 = (uint64_t)os_log_create("com.apple.Maps", "HydrateGeoMapItem");

  _objc_release_x1();
}

id MAPSGetIdleTimerLog()
{
  if (qword_115C0 != -1) {
    dispatch_once(&qword_115C0, &stru_CD68);
  }
  v0 = (void *)qword_115B8;

  return v0;
}

void sub_7470(id a1)
{
  qword_115B8 = (uint64_t)os_log_create("com.apple.Maps", "IdleTimer");

  _objc_release_x1();
}

id MAPSGetPedestrianARLog()
{
  if (qword_115D0 != -1) {
    dispatch_once(&qword_115D0, &stru_CD88);
  }
  v0 = (void *)qword_115C8;

  return v0;
}

void sub_7508(id a1)
{
  qword_115C8 = (uint64_t)os_log_create("com.apple.Maps", "PedestrianAR");

  _objc_release_x1();
}

id MAPSGetPuckTrackingLog()
{
  if (qword_115E0 != -1) {
    dispatch_once(&qword_115E0, &stru_CDA8);
  }
  v0 = (void *)qword_115D8;

  return v0;
}

void sub_75A0(id a1)
{
  qword_115D8 = (uint64_t)os_log_create("com.apple.Maps", "PuckTracking");

  _objc_release_x1();
}

id sub_78F0()
{
  if (qword_115F0 != -1) {
    dispatch_once(&qword_115F0, &stru_D078);
  }
  v0 = (void *)qword_115E8;

  return v0;
}

void sub_7944(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_78F0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @"actively sharing";
    if (!v5) {
      CFStringRef v8 = @"not sharing";
    }
    int v9 = 138543362;
    CFStringRef v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "- Fetched active sharing: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_7A4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_78F0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "- Fetched %lu Favorites", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) addObjectsFromArray:v5];
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id sub_7B40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFetchSharedResources:*(void *)(a1 + 40) withErrors:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_8200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  CFStringRef v10 = sub_78F0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "- Stopping active trip sharing with participant", buf, 2u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_8324;
  v14[3] = &unk_CE48;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  objc_msgSend(v9, "_ds_stopSharingWithParticipant:completion:", v11, v14);
}

void sub_8324(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_8368(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v19 = a3;
  id v18 = a4;
  CFStringRef v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = sub_78F0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "- Removing participant from Favorite (if exists)", buf, 2u);
        }

        objc_msgSend(v15, "_ds_stopSharingWithParticipant:", *(void *)(a1 + 32));
      }
      id v12 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  id v20 = 0;
  [v19 saveWithObjects:v9 error:&v20];
  id v17 = v20;
  if (v17) {
    [v18 addObject:v17];
  }
  dispatch_group_leave(v10);
}

void sub_8530(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_78F0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Sharing stopped with specified participant", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_8734(id a1, MSPSharedTripService *a2, NSMutableArray *a3, OS_dispatch_group *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  id v9 = sub_78F0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "- Stopping all active trip sharing", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8844;
  v12[3] = &unk_CE48;
  uint64_t v13 = v6;
  v14 = v7;
  CFStringRef v10 = v7;
  id v11 = v6;
  [(MSPSharedTripService *)v8 _ds_stopSharingWithCompletion:v12];
}

void sub_8844(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_8888(id a1, NSArray *a2, _TtC8MapsSync13MapsSyncStore *a3, NSMutableArray *a4, OS_dispatch_group *a5)
{
  id v8 = a2;
  v28 = a3;
  v27 = a4;
  group = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    id v12 = &dword_0;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v13);
        id v15 = sub_78F0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = v14;
          if (v16)
          {
            id v17 = (objc_class *)objc_opt_class();
            id v18 = NSStringFromClass(v17);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_12;
            }
            id v19 = v12;
            id v20 = v8;
            v21 = [v16 performSelector:"accessibilityIdentifier"];
            long long v22 = v21;
            if (v21 && ![v21 isEqualToString:v18])
            {
              long long v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v22];

              id v8 = v20;
              id v12 = v19;
              uint64_t v11 = v29;
            }
            else
            {

              id v8 = v20;
              id v12 = v19;
              uint64_t v11 = v29;
LABEL_12:
              long long v23 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
            }
          }
          else
          {
            long long v23 = @"<nil>";
          }

          *(_DWORD *)buf = 138543362;
          v36 = v23;
          _os_log_impl(v12, v15, OS_LOG_TYPE_INFO, "- Removing all sharing from Favorite %{public}@", buf, 0xCu);
        }
        objc_msgSend(v14, "_ds_stopSharing");
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v24 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      id v10 = v24;
    }
    while (v24);
  }
  id v30 = 0;
  [(_TtC8MapsSync13MapsSyncStore *)v28 saveWithObjects:v8 error:&v30];
  id v25 = v30;
  if (v25) {
    [(NSMutableArray *)v27 addObject:v25];
  }
  dispatch_group_leave((dispatch_group_t)group);
}

void sub_8B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_78F0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "All sharing stopped", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_8D18(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = sub_78F0();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Cannot load favorites: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Sync store is ready, will now fetch Favorites...", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_8EC8;
    v12[3] = &unk_CF68;
    id v10 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v13 = 0;
    id v14 = v11;
    [v10 _fetchFavoritesWithStore:v6 withCompletion:v12];
  }
}

uint64_t sub_8EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32)) {
    a3 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3);
}

void sub_8FE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = sub_78F0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Error getting trip service: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    unsigned int v9 = [*(id *)(a1 + 32) _shouldReportSharedTripServiceError:v7];
    id v10 = sub_78F0();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Will report error, active sharing status cannot be determined", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (v11)
      {
        id v16 = [v7 code];
        int v17 = 134217984;
        id v18 = v16;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Will not report error, sharing is unlikely to be active based on error code %ld", (uint8_t *)&v17, 0xCu);
      }

      id v10 = v7;
      id v7 = 0;
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = [v5 receivers];
    id v13 = [v12 count];

    id v14 = sub_78F0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Trip-sharing is active, will add service as resource", (uint8_t *)&v17, 2u);
      }
    }
    else if (v15)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Trip-sharing is not active", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_93B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_78F0();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v6;
      unsigned int v9 = "Error fetching Favorites from sync: %{public}@";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_0, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    id v13 = [v5 count];
    unsigned int v9 = "Fetched %lu Favorites from sync";
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

void sub_9708(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_9794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

void sub_9804(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) firstObject];
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    uint64_t v3 = DSSourceNameMaps;
    NSErrorUserInfoKey v7 = NSMultipleUnderlyingErrorsKey;
    id v4 = [*(id *)(a1 + 32) copy];
    id v8 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    uint64_t v6 = +[NSError errorWithDomain:v3 code:0 userInfo:v5];

    v2 = (void *)v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_992C(id a1)
{
  qword_115E8 = (uint64_t)os_log_create("com.apple.Maps", "DigitalSeparation");

  _objc_release_x1();
}

uint64_t MapsSuggestionsLocalizedTitleForShortcutType()
{
  return _MapsSuggestionsLocalizedTitleForShortcutType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_customName(void *a1, const char *a2, ...)
{
  return [a1 customName];
}

id objc_msgSend_fetchContactHandles(void *a1, const char *a2, ...)
{
  return [a1 fetchContactHandles];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isMapsAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isMapsAppInstalled];
}

id objc_msgSend_isPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 isPhoneNumber];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mapItemStorage(void *a1, const char *a2, ...)
{
  return [a1 mapItemStorage];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_receivers(void *a1, const char *a2, ...)
{
  return [a1 receivers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortAddress(void *a1, const char *a2, ...)
{
  return [a1 shortAddress];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_withDefaultStoreWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withDefaultStoreWithBlock:");
}