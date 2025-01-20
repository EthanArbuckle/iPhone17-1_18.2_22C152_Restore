id MAPSGetCameraLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_C308 != -1) {
    dispatch_once(&qword_C308, &stru_8160);
  }
  v0 = (void *)qword_C300;

  return v0;
}

void sub_3054(id a1)
{
  qword_C300 = (uint64_t)os_log_create("com.apple.Maps", "Camera");

  _objc_release_x1();
}

id MAPSGetCollectionsLog()
{
  if (qword_C318 != -1) {
    dispatch_once(&qword_C318, &stru_8180);
  }
  v0 = (void *)qword_C310;

  return v0;
}

void sub_30EC(id a1)
{
  qword_C310 = (uint64_t)os_log_create("com.apple.Maps", "Collections");

  _objc_release_x1();
}

id MAPSGetContainerVCLog()
{
  if (qword_C328 != -1) {
    dispatch_once(&qword_C328, &stru_81A0);
  }
  v0 = (void *)qword_C320;

  return v0;
}

void sub_3184(id a1)
{
  qword_C320 = (uint64_t)os_log_create("com.apple.Maps", "ContainerVC");

  _objc_release_x1();
}

id MAPSGetCuratedCollectionsLog()
{
  if (qword_C338 != -1) {
    dispatch_once(&qword_C338, &stru_81C0);
  }
  v0 = (void *)qword_C330;

  return v0;
}

void sub_321C(id a1)
{
  qword_C330 = (uint64_t)os_log_create("com.apple.Maps", "CuratedCollections");

  _objc_release_x1();
}

id MAPSGetEVOnboardingLog()
{
  if (qword_C348 != -1) {
    dispatch_once(&qword_C348, &stru_81E0);
  }
  v0 = (void *)qword_C340;

  return v0;
}

void sub_32B4(id a1)
{
  qword_C340 = (uint64_t)os_log_create("com.apple.Maps", "EVOnboarding");

  _objc_release_x1();
}

id MAPSGetLightLevelProvidingLog()
{
  if (qword_C358 != -1) {
    dispatch_once(&qword_C358, &stru_8200);
  }
  v0 = (void *)qword_C350;

  return v0;
}

void sub_334C(id a1)
{
  qword_C350 = (uint64_t)os_log_create("com.apple.Maps", "LightLevelProviding");

  _objc_release_x1();
}

id MAPSGetMapModeLog()
{
  if (qword_C368 != -1) {
    dispatch_once(&qword_C368, &stru_8220);
  }
  v0 = (void *)qword_C360;

  return v0;
}

void sub_33E4(id a1)
{
  qword_C360 = (uint64_t)os_log_create("com.apple.Maps", "MapMode");

  _objc_release_x1();
}

id MAPSGetMapsActivityLog()
{
  if (qword_C378 != -1) {
    dispatch_once(&qword_C378, &stru_8240);
  }
  v0 = (void *)qword_C370;

  return v0;
}

void sub_347C(id a1)
{
  qword_C370 = (uint64_t)os_log_create("com.apple.Maps", "MapsActivity");

  _objc_release_x1();
}

id MAPSGetMapsAssertLog()
{
  if (qword_C388 != -1) {
    dispatch_once(&qword_C388, &stru_8260);
  }
  v0 = (void *)qword_C380;

  return v0;
}

void sub_3514(id a1)
{
  qword_C380 = (uint64_t)os_log_create("com.apple.Maps", "MapsAssert");

  _objc_release_x1();
}

id MAPSGetMapsChromeLog()
{
  if (qword_C398 != -1) {
    dispatch_once(&qword_C398, &stru_8280);
  }
  v0 = (void *)qword_C390;

  return v0;
}

void sub_35AC(id a1)
{
  qword_C390 = (uint64_t)os_log_create("com.apple.Maps", "MapsChrome");

  _objc_release_x1();
}

id MAPSGetMapsDefaultLog()
{
  if (qword_C3A8 != -1) {
    dispatch_once(&qword_C3A8, &stru_82A0);
  }
  v0 = (void *)qword_C3A0;

  return v0;
}

void sub_3644(id a1)
{
  qword_C3A0 = (uint64_t)os_log_create("com.apple.Maps", "MapsDefault");

  _objc_release_x1();
}

id MAPSGetMapsLaunchLog()
{
  if (qword_C3B8 != -1) {
    dispatch_once(&qword_C3B8, &stru_82C0);
  }
  v0 = (void *)qword_C3B0;

  return v0;
}

void sub_36DC(id a1)
{
  qword_C3B0 = (uint64_t)os_log_create("com.apple.Maps", "MapsLaunch");

  _objc_release_x1();
}

id MAPSGetMapsNotificationsLog()
{
  if (qword_C3C8 != -1) {
    dispatch_once(&qword_C3C8, &stru_82E0);
  }
  v0 = (void *)qword_C3C0;

  return v0;
}

void sub_3774(id a1)
{
  qword_C3C0 = (uint64_t)os_log_create("com.apple.Maps", "MapsNotifications");

  _objc_release_x1();
}

id MAPSGetMapsPerformanceLog()
{
  if (qword_C3D8 != -1) {
    dispatch_once(&qword_C3D8, &stru_8300);
  }
  v0 = (void *)qword_C3D0;

  return v0;
}

void sub_380C(id a1)
{
  qword_C3D0 = (uint64_t)os_log_create("com.apple.Maps", "MapsPerformance");

  _objc_release_x1();
}

id MAPSGetLookAroundLog()
{
  if (qword_C3E8 != -1) {
    dispatch_once(&qword_C3E8, &stru_8320);
  }
  v0 = (void *)qword_C3E0;

  return v0;
}

void sub_38A4(id a1)
{
  qword_C3E0 = (uint64_t)os_log_create("com.apple.Maps", "LookAround");

  _objc_release_x1();
}

id MAPSGetNavigationLog()
{
  if (qword_C3F8 != -1) {
    dispatch_once(&qword_C3F8, &stru_8340);
  }
  v0 = (void *)qword_C3F0;

  return v0;
}

void sub_393C(id a1)
{
  qword_C3F0 = (uint64_t)os_log_create("com.apple.Maps", "Navigation");

  _objc_release_x1();
}

id MAPSGetNavigationBannersLog()
{
  if (qword_C408 != -1) {
    dispatch_once(&qword_C408, &stru_8360);
  }
  v0 = (void *)qword_C400;

  return v0;
}

void sub_39D4(id a1)
{
  qword_C400 = (uint64_t)os_log_create("com.apple.Maps", "NavigationBanners");

  _objc_release_x1();
}

id MAPSGetNearbyTransitLog()
{
  if (qword_C418 != -1) {
    dispatch_once(&qword_C418, &stru_8380);
  }
  v0 = (void *)qword_C410;

  return v0;
}

void sub_3A6C(id a1)
{
  qword_C410 = (uint64_t)os_log_create("com.apple.Maps", "NearbyTransit");

  _objc_release_x1();
}

id MAPSGetOfflineLog()
{
  if (qword_C428 != -1) {
    dispatch_once(&qword_C428, &stru_83A0);
  }
  v0 = (void *)qword_C420;

  return v0;
}

void sub_3B04(id a1)
{
  qword_C420 = (uint64_t)os_log_create("com.apple.Maps", "Offline");

  _objc_release_x1();
}

id MAPSGetPlaceCardLog()
{
  if (qword_C438 != -1) {
    dispatch_once(&qword_C438, &stru_83C0);
  }
  v0 = (void *)qword_C430;

  return v0;
}

void sub_3B9C(id a1)
{
  qword_C430 = (uint64_t)os_log_create("com.apple.Maps", "PlaceCard");

  _objc_release_x1();
}

id MAPSGetPPTLog()
{
  if (qword_C448 != -1) {
    dispatch_once(&qword_C448, &stru_83E0);
  }
  v0 = (void *)qword_C440;

  return v0;
}

void sub_3C34(id a1)
{
  qword_C440 = (uint64_t)os_log_create("com.apple.Maps", "PPT");

  _objc_release_x1();
}

id MAPSGetPreferencesSyncLog()
{
  if (qword_C458 != -1) {
    dispatch_once(&qword_C458, &stru_8400);
  }
  v0 = (void *)qword_C450;

  return v0;
}

void sub_3CCC(id a1)
{
  qword_C450 = (uint64_t)os_log_create("com.apple.Maps", "PreferencesSync");

  _objc_release_x1();
}

id MAPSGetPrintLog()
{
  if (qword_C468 != -1) {
    dispatch_once(&qword_C468, &stru_8420);
  }
  v0 = (void *)qword_C460;

  return v0;
}

void sub_3D64(id a1)
{
  qword_C460 = (uint64_t)os_log_create("com.apple.Maps", "Print");

  _objc_release_x1();
}

id MAPSGetRAPLayoutLog()
{
  if (qword_C478 != -1) {
    dispatch_once(&qword_C478, &stru_8440);
  }
  v0 = (void *)qword_C470;

  return v0;
}

void sub_3DFC(id a1)
{
  qword_C470 = (uint64_t)os_log_create("com.apple.Maps", "RAPLayout");

  _objc_release_x1();
}

id MAPSGetRAPNavigationLog()
{
  if (qword_C488 != -1) {
    dispatch_once(&qword_C488, &stru_8460);
  }
  v0 = (void *)qword_C480;

  return v0;
}

void sub_3E94(id a1)
{
  qword_C480 = (uint64_t)os_log_create("com.apple.Maps", "RAPNavigation");

  _objc_release_x1();
}

id MAPSGetRAPSubmissionLog()
{
  if (qword_C498 != -1) {
    dispatch_once(&qword_C498, &stru_8480);
  }
  v0 = (void *)qword_C490;

  return v0;
}

void sub_3F2C(id a1)
{
  qword_C490 = (uint64_t)os_log_create("com.apple.Maps", "RAPSubmission");

  _objc_release_x1();
}

id MAPSGetRecentsLog()
{
  if (qword_C4A8 != -1) {
    dispatch_once(&qword_C4A8, &stru_84A0);
  }
  v0 = (void *)qword_C4A0;

  return v0;
}

void sub_3FC4(id a1)
{
  qword_C4A0 = (uint64_t)os_log_create("com.apple.Maps", "Recents");

  _objc_release_x1();
}

id MAPSGetRouteCreationLog()
{
  if (qword_C4B8 != -1) {
    dispatch_once(&qword_C4B8, &stru_84C0);
  }
  v0 = (void *)qword_C4B0;

  return v0;
}

void sub_405C(id a1)
{
  qword_C4B0 = (uint64_t)os_log_create("com.apple.Maps", "RouteCreation");

  _objc_release_x1();
}

id MAPSGetRoutePlanningLog()
{
  if (qword_C4C8 != -1) {
    dispatch_once(&qword_C4C8, &stru_84E0);
  }
  v0 = (void *)qword_C4C0;

  return v0;
}

void sub_40F4(id a1)
{
  qword_C4C0 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanning");

  _objc_release_x1();
}

id MAPSGetRoutePlanningFeatureDiscoveryLog()
{
  if (qword_C4D8 != -1) {
    dispatch_once(&qword_C4D8, &stru_8500);
  }
  v0 = (void *)qword_C4D0;

  return v0;
}

void sub_418C(id a1)
{
  qword_C4D0 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningFeatureDiscovery");

  _objc_release_x1();
}

id MAPSGetSearchACLog()
{
  if (qword_C4E8 != -1) {
    dispatch_once(&qword_C4E8, &stru_8520);
  }
  v0 = (void *)qword_C4E0;

  return v0;
}

void sub_4224(id a1)
{
  qword_C4E0 = (uint64_t)os_log_create("com.apple.Maps", "SearchAC");

  _objc_release_x1();
}

id MAPSGetSearchACFindMyLog()
{
  if (qword_C4F8 != -1) {
    dispatch_once(&qword_C4F8, &stru_8540);
  }
  v0 = (void *)qword_C4F0;

  return v0;
}

void sub_42BC(id a1)
{
  qword_C4F0 = (uint64_t)os_log_create("com.apple.Maps", "SearchACFindMy");

  _objc_release_x1();
}

id MAPSGetSearchHomeLog()
{
  if (qword_C508 != -1) {
    dispatch_once(&qword_C508, &stru_8560);
  }
  v0 = (void *)qword_C500;

  return v0;
}

void sub_4354(id a1)
{
  qword_C500 = (uint64_t)os_log_create("com.apple.Maps", "SearchHome");

  _objc_release_x1();
}

id MAPSGetSharedTripLog()
{
  if (qword_C518 != -1) {
    dispatch_once(&qword_C518, &stru_8580);
  }
  v0 = (void *)qword_C510;

  return v0;
}

void sub_43EC(id a1)
{
  qword_C510 = (uint64_t)os_log_create("com.apple.Maps", "SharedTrip");

  _objc_release_x1();
}

id MAPSGetSharingLog()
{
  if (qword_C528 != -1) {
    dispatch_once(&qword_C528, &stru_85A0);
  }
  v0 = (void *)qword_C520;

  return v0;
}

void sub_4484(id a1)
{
  qword_C520 = (uint64_t)os_log_create("com.apple.Maps", "Sharing");

  _objc_release_x1();
}

id MAPSGetShortcutsLog()
{
  if (qword_C538 != -1) {
    dispatch_once(&qword_C538, &stru_85C0);
  }
  v0 = (void *)qword_C530;

  return v0;
}

void sub_451C(id a1)
{
  qword_C530 = (uint64_t)os_log_create("com.apple.Maps", "Shortcuts");

  _objc_release_x1();
}

id MAPSGetTileStateCaptureLog()
{
  if (qword_C548 != -1) {
    dispatch_once(&qword_C548, &stru_85E0);
  }
  v0 = (void *)qword_C540;

  return v0;
}

void sub_45B4(id a1)
{
  qword_C540 = (uint64_t)os_log_create("com.apple.Maps", "TileStateCapture");

  _objc_release_x1();
}

id MAPSGetTransitLog()
{
  if (qword_C558 != -1) {
    dispatch_once(&qword_C558, &stru_8600);
  }
  v0 = (void *)qword_C550;

  return v0;
}

void sub_464C(id a1)
{
  qword_C550 = (uint64_t)os_log_create("com.apple.Maps", "Transit");

  _objc_release_x1();
}

id MAPSGetTransitPayLog()
{
  if (qword_C568 != -1) {
    dispatch_once(&qword_C568, &stru_8620);
  }
  v0 = (void *)qword_C560;

  return v0;
}

void sub_46E4(id a1)
{
  qword_C560 = (uint64_t)os_log_create("com.apple.Maps", "TransitPay");

  _objc_release_x1();
}

id MAPSGetTransitSchedulesLog()
{
  if (qword_C578 != -1) {
    dispatch_once(&qword_C578, &stru_8640);
  }
  v0 = (void *)qword_C570;

  return v0;
}

void sub_477C(id a1)
{
  qword_C570 = (uint64_t)os_log_create("com.apple.Maps", "TransitSchedules");

  _objc_release_x1();
}

id MAPSGetUserProfileLog()
{
  if (qword_C588 != -1) {
    dispatch_once(&qword_C588, &stru_8660);
  }
  v0 = (void *)qword_C580;

  return v0;
}

void sub_4814(id a1)
{
  qword_C580 = (uint64_t)os_log_create("com.apple.Maps", "UserProfile");

  _objc_release_x1();
}

id MAPSGetVehicleDisambiguatorLog()
{
  if (qword_C598 != -1) {
    dispatch_once(&qword_C598, &stru_8680);
  }
  v0 = (void *)qword_C590;

  return v0;
}

void sub_48AC(id a1)
{
  qword_C590 = (uint64_t)os_log_create("com.apple.Maps", "VehicleDisambiguator");

  _objc_release_x1();
}

id MAPSGetVirtualGarageLog()
{
  if (qword_C5A8 != -1) {
    dispatch_once(&qword_C5A8, &stru_86A0);
  }
  v0 = (void *)qword_C5A0;

  return v0;
}

void sub_4944(id a1)
{
  qword_C5A0 = (uint64_t)os_log_create("com.apple.Maps", "VirtualGarage");

  _objc_release_x1();
}

id MAPSGetWeatherLog()
{
  if (qword_C5B8 != -1) {
    dispatch_once(&qword_C5B8, &stru_86C0);
  }
  v0 = (void *)qword_C5B0;

  return v0;
}

void sub_49DC(id a1)
{
  qword_C5B0 = (uint64_t)os_log_create("com.apple.Maps", "Weather");

  _objc_release_x1();
}

id MAPSGetXPCLog()
{
  if (qword_C5C8 != -1) {
    dispatch_once(&qword_C5C8, &stru_86E0);
  }
  v0 = (void *)qword_C5C0;

  return v0;
}

void sub_4A74(id a1)
{
  qword_C5C0 = (uint64_t)os_log_create("com.apple.Maps", "XPC");

  _objc_release_x1();
}

id MAPSGetUGCBAAUtilitiesLog()
{
  if (qword_C5D8 != -1) {
    dispatch_once(&qword_C5D8, &stru_8700);
  }
  v0 = (void *)qword_C5D0;

  return v0;
}

void sub_4B0C(id a1)
{
  qword_C5D0 = (uint64_t)os_log_create("com.apple.Maps", "UGCBAAUtilities");

  _objc_release_x1();
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_C5E8 != -1) {
    dispatch_once(&qword_C5E8, &stru_8720);
  }
  v0 = (void *)qword_C5E0;

  return v0;
}

void sub_4BA4(id a1)
{
  qword_C5E0 = (uint64_t)os_log_create("com.apple.Maps", "IncidentsReporting");

  _objc_release_x1();
}

id MAPSGetWatermarkingLog()
{
  if (qword_C5F8 != -1) {
    dispatch_once(&qword_C5F8, &stru_8740);
  }
  v0 = (void *)qword_C5F0;

  return v0;
}

void sub_4C3C(id a1)
{
  qword_C5F0 = (uint64_t)os_log_create("com.apple.Maps", "Watermarking");

  _objc_release_x1();
}

id MAPSGetWaypointRequestLog()
{
  if (qword_C608 != -1) {
    dispatch_once(&qword_C608, &stru_8760);
  }
  v0 = (void *)qword_C600;

  return v0;
}

void sub_4CD4(id a1)
{
  qword_C600 = (uint64_t)os_log_create("com.apple.Maps", "WaypointRequest");

  _objc_release_x1();
}

id MAPSGetWebBundleLog()
{
  if (qword_C618 != -1) {
    dispatch_once(&qword_C618, &stru_8780);
  }
  v0 = (void *)qword_C610;

  return v0;
}

void sub_4D6C(id a1)
{
  qword_C610 = (uint64_t)os_log_create("com.apple.Maps", "WebBundle");

  _objc_release_x1();
}

id MAPSGetRAPRecordsManagerLog()
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_87A0);
  }
  v0 = (void *)qword_C620;

  return v0;
}

void sub_4E04(id a1)
{
  qword_C620 = (uint64_t)os_log_create("com.apple.Maps", "RAPRecordsManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoAttributionLog()
{
  if (qword_C638 != -1) {
    dispatch_once(&qword_C638, &stru_87C0);
  }
  v0 = (void *)qword_C630;

  return v0;
}

void sub_4E9C(id a1)
{
  qword_C630 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoAttribution");

  _objc_release_x1();
}

id MAPSGetSearchResultsImpressionsLog()
{
  if (qword_C648 != -1) {
    dispatch_once(&qword_C648, &stru_87E0);
  }
  v0 = (void *)qword_C640;

  return v0;
}

void sub_4F34(id a1)
{
  qword_C640 = (uint64_t)os_log_create("com.apple.Maps", "SearchResultsImpressions");

  _objc_release_x1();
}

id MAPSGetSearchRedoLog()
{
  if (qword_C658 != -1) {
    dispatch_once(&qword_C658, &stru_8800);
  }
  v0 = (void *)qword_C650;

  return v0;
}

void sub_4FCC(id a1)
{
  qword_C650 = (uint64_t)os_log_create("com.apple.Maps", "SearchRedo");

  _objc_release_x1();
}

id MAPSGetStaleTimeBug_105865770Log()
{
  if (qword_C668 != -1) {
    dispatch_once(&qword_C668, &stru_8820);
  }
  v0 = (void *)qword_C660;

  return v0;
}

void sub_5064(id a1)
{
  qword_C660 = (uint64_t)os_log_create("com.apple.Maps", "StaleTimeBug_105865770");

  _objc_release_x1();
}

id MAPSGetCustomPOIsControllerLog()
{
  if (qword_C678 != -1) {
    dispatch_once(&qword_C678, &stru_8840);
  }
  v0 = (void *)qword_C670;

  return v0;
}

void sub_50FC(id a1)
{
  qword_C670 = (uint64_t)os_log_create("com.apple.Maps", "CustomPOIsController");

  _objc_release_x1();
}

id MAPSGetPOSIXSignalsLog()
{
  if (qword_C688 != -1) {
    dispatch_once(&qword_C688, &stru_8860);
  }
  v0 = (void *)qword_C680;

  return v0;
}

void sub_5194(id a1)
{
  qword_C680 = (uint64_t)os_log_create("com.apple.Maps", "POSIXSignals");

  _objc_release_x1();
}

id MAPSGetCoalescingSchedulerLog()
{
  if (qword_C698 != -1) {
    dispatch_once(&qword_C698, &stru_8880);
  }
  v0 = (void *)qword_C690;

  return v0;
}

void sub_522C(id a1)
{
  qword_C690 = (uint64_t)os_log_create("com.apple.Maps", "CoalescingScheduler");

  _objc_release_x1();
}

id MAPSGetDeviceConnectionLog()
{
  if (qword_C6A8 != -1) {
    dispatch_once(&qword_C6A8, &stru_88A0);
  }
  v0 = (void *)qword_C6A0;

  return v0;
}

void sub_52C4(id a1)
{
  qword_C6A0 = (uint64_t)os_log_create("com.apple.Maps", "DeviceConnection");

  _objc_release_x1();
}

id MAPSGetDictationLog()
{
  if (qword_C6B8 != -1) {
    dispatch_once(&qword_C6B8, &stru_88C0);
  }
  v0 = (void *)qword_C6B0;

  return v0;
}

void sub_535C(id a1)
{
  qword_C6B0 = (uint64_t)os_log_create("com.apple.Maps", "Dictation");

  _objc_release_x1();
}

id MAPSGetElevationGraphLog()
{
  if (qword_C6C8 != -1) {
    dispatch_once(&qword_C6C8, &stru_88E0);
  }
  v0 = (void *)qword_C6C0;

  return v0;
}

void sub_53F4(id a1)
{
  qword_C6C0 = (uint64_t)os_log_create("com.apple.Maps", "ElevationGraph");

  _objc_release_x1();
}

id MAPSGetIncidentReportingLog()
{
  if (qword_C6D8 != -1) {
    dispatch_once(&qword_C6D8, &stru_8900);
  }
  v0 = (void *)qword_C6D0;

  return v0;
}

void sub_548C(id a1)
{
  qword_C6D0 = (uint64_t)os_log_create("com.apple.Maps", "IncidentReporting");

  _objc_release_x1();
}

id MAPSGetLightLevelLog()
{
  if (qword_C6E8 != -1) {
    dispatch_once(&qword_C6E8, &stru_8920);
  }
  v0 = (void *)qword_C6E0;

  return v0;
}

void sub_5524(id a1)
{
  qword_C6E0 = (uint64_t)os_log_create("com.apple.Maps", "LightLevel");

  _objc_release_x1();
}

id MAPSGetMapRegionLog()
{
  if (qword_C6F8 != -1) {
    dispatch_once(&qword_C6F8, &stru_8940);
  }
  v0 = (void *)qword_C6F0;

  return v0;
}

void sub_55BC(id a1)
{
  qword_C6F0 = (uint64_t)os_log_create("com.apple.Maps", "MapRegion");

  _objc_release_x1();
}

id MAPSGetNavigationSimulationPromptLog()
{
  if (qword_C708 != -1) {
    dispatch_once(&qword_C708, &stru_8960);
  }
  v0 = (void *)qword_C700;

  return v0;
}

void sub_5654(id a1)
{
  qword_C700 = (uint64_t)os_log_create("com.apple.Maps", "NavigationSimulationPrompt");

  _objc_release_x1();
}

id MAPSGetNavIndicatorsLog()
{
  if (qword_C718 != -1) {
    dispatch_once(&qword_C718, &stru_8980);
  }
  v0 = (void *)qword_C710;

  return v0;
}

void sub_56EC(id a1)
{
  qword_C710 = (uint64_t)os_log_create("com.apple.Maps", "NavIndicators");

  _objc_release_x1();
}

id MAPSGetProactiveTrayLog()
{
  if (qword_C728 != -1) {
    dispatch_once(&qword_C728, &stru_89A0);
  }
  v0 = (void *)qword_C720;

  return v0;
}

void sub_5784(id a1)
{
  qword_C720 = (uint64_t)os_log_create("com.apple.Maps", "ProactiveTray");

  _objc_release_x1();
}

id MAPSGetRAPPresenterLog()
{
  if (qword_C738 != -1) {
    dispatch_once(&qword_C738, &stru_89C0);
  }
  v0 = (void *)qword_C730;

  return v0;
}

void sub_581C(id a1)
{
  qword_C730 = (uint64_t)os_log_create("com.apple.Maps", "RAPPresenter");

  _objc_release_x1();
}

id MAPSGetRoutePlanningOutlineLog()
{
  if (qword_C748 != -1) {
    dispatch_once(&qword_C748, &stru_89E0);
  }
  v0 = (void *)qword_C740;

  return v0;
}

void sub_58B4(id a1)
{
  qword_C740 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningOutline");

  _objc_release_x1();
}

id MAPSGetStatusIndicatorLog()
{
  if (qword_C758 != -1) {
    dispatch_once(&qword_C758, &stru_8A00);
  }
  v0 = (void *)qword_C750;

  return v0;
}

void sub_594C(id a1)
{
  qword_C750 = (uint64_t)os_log_create("com.apple.Maps", "StatusIndicator");

  _objc_release_x1();
}

id MAPSGetTransitNavigationLog()
{
  if (qword_C768 != -1) {
    dispatch_once(&qword_C768, &stru_8A20);
  }
  v0 = (void *)qword_C760;

  return v0;
}

void sub_59E4(id a1)
{
  qword_C760 = (uint64_t)os_log_create("com.apple.Maps", "TransitNavigation");

  _objc_release_x1();
}

id MAPSGetTurnAlertsLog()
{
  if (qword_C778 != -1) {
    dispatch_once(&qword_C778, &stru_8A40);
  }
  v0 = (void *)qword_C770;

  return v0;
}

void sub_5A7C(id a1)
{
  qword_C770 = (uint64_t)os_log_create("com.apple.Maps", "TurnAlerts");

  _objc_release_x1();
}

id MAPSGetUGCCallToActionViewProviderLog()
{
  if (qword_C788 != -1) {
    dispatch_once(&qword_C788, &stru_8A60);
  }
  v0 = (void *)qword_C780;

  return v0;
}

void sub_5B14(id a1)
{
  qword_C780 = (uint64_t)os_log_create("com.apple.Maps", "UGCCallToActionViewProvider");

  _objc_release_x1();
}

id MAPSGetUGCPhotoDownloadManagerLog()
{
  if (qword_C798 != -1) {
    dispatch_once(&qword_C798, &stru_8A80);
  }
  v0 = (void *)qword_C790;

  return v0;
}

void sub_5BAC(id a1)
{
  qword_C790 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoDownloadManager");

  _objc_release_x1();
}

id MAPSGetUGCReviewedPlacesManagerLog()
{
  if (qword_C7A8 != -1) {
    dispatch_once(&qword_C7A8, &stru_8AA0);
  }
  v0 = (void *)qword_C7A0;

  return v0;
}

void sub_5C44(id a1)
{
  qword_C7A0 = (uint64_t)os_log_create("com.apple.Maps", "UGCReviewedPlacesManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoViewerDataProviderLog()
{
  if (qword_C7B8 != -1) {
    dispatch_once(&qword_C7B8, &stru_8AC0);
  }
  v0 = (void *)qword_C7B0;

  return v0;
}

void sub_5CDC(id a1)
{
  qword_C7B0 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoViewerDataProvider");

  _objc_release_x1();
}

id MAPSGetCarBlurViewLog()
{
  if (qword_C7C8 != -1) {
    dispatch_once(&qword_C7C8, &stru_8AE0);
  }
  v0 = (void *)qword_C7C0;

  return v0;
}

void sub_5D74(id a1)
{
  qword_C7C0 = (uint64_t)os_log_create("com.apple.Maps", "CarBlurView");

  _objc_release_x1();
}

id MAPSGetCarCardsLog()
{
  if (qword_C7D8 != -1) {
    dispatch_once(&qword_C7D8, &stru_8B00);
  }
  v0 = (void *)qword_C7D0;

  return v0;
}

void sub_5E0C(id a1)
{
  qword_C7D0 = (uint64_t)os_log_create("com.apple.Maps", "CarCards");

  _objc_release_x1();
}

id MAPSGetCarClusterSuggestionLog()
{
  if (qword_C7E8 != -1) {
    dispatch_once(&qword_C7E8, &stru_8B20);
  }
  v0 = (void *)qword_C7E0;

  return v0;
}

void sub_5EA4(id a1)
{
  qword_C7E0 = (uint64_t)os_log_create("com.apple.Maps", "CarClusterSuggestion");

  _objc_release_x1();
}

id MAPSGetCarCompressionLog()
{
  if (qword_C7F8 != -1) {
    dispatch_once(&qword_C7F8, &stru_8B40);
  }
  v0 = (void *)qword_C7F0;

  return v0;
}

void sub_5F3C(id a1)
{
  qword_C7F0 = (uint64_t)os_log_create("com.apple.Maps", "CarCompression");

  _objc_release_x1();
}

id MAPSGetCarFocusLog()
{
  if (qword_C808 != -1) {
    dispatch_once(&qword_C808, &stru_8B60);
  }
  v0 = (void *)qword_C800;

  return v0;
}

void sub_5FD4(id a1)
{
  qword_C800 = (uint64_t)os_log_create("com.apple.Maps", "CarFocus");

  _objc_release_x1();
}

id MAPSGetCarInstrumentClusterLog()
{
  if (qword_C818 != -1) {
    dispatch_once(&qword_C818, &stru_8B80);
  }
  v0 = (void *)qword_C810;

  return v0;
}

void sub_606C(id a1)
{
  qword_C810 = (uint64_t)os_log_create("com.apple.Maps", "CarInstrumentCluster");

  _objc_release_x1();
}

id MAPSGetCarGuidanceLog()
{
  if (qword_C828 != -1) {
    dispatch_once(&qword_C828, &stru_8BA0);
  }
  v0 = (void *)qword_C820;

  return v0;
}

void sub_6104(id a1)
{
  qword_C820 = (uint64_t)os_log_create("com.apple.Maps", "CarGuidance");

  _objc_release_x1();
}

id MAPSGetCarMapWidgetLog()
{
  if (qword_C838 != -1) {
    dispatch_once(&qword_C838, &stru_8BC0);
  }
  v0 = (void *)qword_C830;

  return v0;
}

void sub_619C(id a1)
{
  qword_C830 = (uint64_t)os_log_create("com.apple.Maps", "CarMapWidget");

  _objc_release_x1();
}

id MAPSGetCarPlayLog()
{
  if (qword_C848 != -1) {
    dispatch_once(&qword_C848, &stru_8BE0);
  }
  v0 = (void *)qword_C840;

  return v0;
}

void sub_6234(id a1)
{
  qword_C840 = (uint64_t)os_log_create("com.apple.Maps", "CarPlay");

  _objc_release_x1();
}

id MAPSGetCarRouteGeniusLog()
{
  if (qword_C858 != -1) {
    dispatch_once(&qword_C858, &stru_8C00);
  }
  v0 = (void *)qword_C850;

  return v0;
}

void sub_62CC(id a1)
{
  qword_C850 = (uint64_t)os_log_create("com.apple.Maps", "CarRouteGenius");

  _objc_release_x1();
}

id MAPSGetCarSessionControllerLog()
{
  if (qword_C868 != -1) {
    dispatch_once(&qword_C868, &stru_8C20);
  }
  v0 = (void *)qword_C860;

  return v0;
}

void sub_6364(id a1)
{
  qword_C860 = (uint64_t)os_log_create("com.apple.Maps", "CarSessionController");

  _objc_release_x1();
}

id MAPSGetCarSmallWidgetLog()
{
  if (qword_C878 != -1) {
    dispatch_once(&qword_C878, &stru_8C40);
  }
  v0 = (void *)qword_C870;

  return v0;
}

void sub_63FC(id a1)
{
  qword_C870 = (uint64_t)os_log_create("com.apple.Maps", "CarSmallWidget");

  _objc_release_x1();
}

id MAPSGetCompanionControllerLog()
{
  if (qword_C888 != -1) {
    dispatch_once(&qword_C888, &stru_8C60);
  }
  v0 = (void *)qword_C880;

  return v0;
}

void sub_6494(id a1)
{
  qword_C880 = (uint64_t)os_log_create("com.apple.Maps", "CompanionController");

  _objc_release_x1();
}

id MAPSGetHydrateGeoMapItemLog()
{
  if (qword_C898 != -1) {
    dispatch_once(&qword_C898, &stru_8C80);
  }
  v0 = (void *)qword_C890;

  return v0;
}

void sub_652C(id a1)
{
  qword_C890 = (uint64_t)os_log_create("com.apple.Maps", "HydrateGeoMapItem");

  _objc_release_x1();
}

id MAPSGetIdleTimerLog()
{
  if (qword_C8A8 != -1) {
    dispatch_once(&qword_C8A8, &stru_8CA0);
  }
  v0 = (void *)qword_C8A0;

  return v0;
}

void sub_65C4(id a1)
{
  qword_C8A0 = (uint64_t)os_log_create("com.apple.Maps", "IdleTimer");

  _objc_release_x1();
}

id MAPSGetPedestrianARLog()
{
  if (qword_C8B8 != -1) {
    dispatch_once(&qword_C8B8, &stru_8CC0);
  }
  v0 = (void *)qword_C8B0;

  return v0;
}

void sub_665C(id a1)
{
  qword_C8B0 = (uint64_t)os_log_create("com.apple.Maps", "PedestrianAR");

  _objc_release_x1();
}

id MAPSGetPuckTrackingLog()
{
  if (qword_C8C8 != -1) {
    dispatch_once(&qword_C8C8, &stru_8CE0);
  }
  v0 = (void *)qword_C8C0;

  return v0;
}

void sub_66F4(id a1)
{
  qword_C8C0 = (uint64_t)os_log_create("com.apple.Maps", "PuckTracking");

  _objc_release_x1();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_fullColorSymbolProvider(void *a1, const char *a2, ...)
{
  return [a1 fullColorSymbolProvider];
}

id objc_msgSend_symbolProvider(void *a1, const char *a2, ...)
{
  return [a1 symbolProvider];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}