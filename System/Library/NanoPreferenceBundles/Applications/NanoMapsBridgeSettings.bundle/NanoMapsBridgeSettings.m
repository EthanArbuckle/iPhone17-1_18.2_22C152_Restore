id MAPSGetCameraLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_C540 != -1) {
    dispatch_once(&qword_C540, &stru_81B8);
  }
  v0 = (void *)qword_C538;

  return v0;
}

void sub_28C8(id a1)
{
  qword_C538 = (uint64_t)os_log_create("com.apple.Maps", "Camera");

  _objc_release_x1();
}

id MAPSGetCollectionsLog()
{
  if (qword_C550 != -1) {
    dispatch_once(&qword_C550, &stru_81D8);
  }
  v0 = (void *)qword_C548;

  return v0;
}

void sub_2960(id a1)
{
  qword_C548 = (uint64_t)os_log_create("com.apple.Maps", "Collections");

  _objc_release_x1();
}

id MAPSGetContainerVCLog()
{
  if (qword_C560 != -1) {
    dispatch_once(&qword_C560, &stru_81F8);
  }
  v0 = (void *)qword_C558;

  return v0;
}

void sub_29F8(id a1)
{
  qword_C558 = (uint64_t)os_log_create("com.apple.Maps", "ContainerVC");

  _objc_release_x1();
}

id MAPSGetCuratedCollectionsLog()
{
  if (qword_C570 != -1) {
    dispatch_once(&qword_C570, &stru_8218);
  }
  v0 = (void *)qword_C568;

  return v0;
}

void sub_2A90(id a1)
{
  qword_C568 = (uint64_t)os_log_create("com.apple.Maps", "CuratedCollections");

  _objc_release_x1();
}

id MAPSGetEVOnboardingLog()
{
  if (qword_C580 != -1) {
    dispatch_once(&qword_C580, &stru_8238);
  }
  v0 = (void *)qword_C578;

  return v0;
}

void sub_2B28(id a1)
{
  qword_C578 = (uint64_t)os_log_create("com.apple.Maps", "EVOnboarding");

  _objc_release_x1();
}

id MAPSGetLightLevelProvidingLog()
{
  if (qword_C590 != -1) {
    dispatch_once(&qword_C590, &stru_8258);
  }
  v0 = (void *)qword_C588;

  return v0;
}

void sub_2BC0(id a1)
{
  qword_C588 = (uint64_t)os_log_create("com.apple.Maps", "LightLevelProviding");

  _objc_release_x1();
}

id MAPSGetMapModeLog()
{
  if (qword_C5A0 != -1) {
    dispatch_once(&qword_C5A0, &stru_8278);
  }
  v0 = (void *)qword_C598;

  return v0;
}

void sub_2C58(id a1)
{
  qword_C598 = (uint64_t)os_log_create("com.apple.Maps", "MapMode");

  _objc_release_x1();
}

id MAPSGetMapsActivityLog()
{
  if (qword_C5B0 != -1) {
    dispatch_once(&qword_C5B0, &stru_8298);
  }
  v0 = (void *)qword_C5A8;

  return v0;
}

void sub_2CF0(id a1)
{
  qword_C5A8 = (uint64_t)os_log_create("com.apple.Maps", "MapsActivity");

  _objc_release_x1();
}

id MAPSGetMapsAssertLog()
{
  if (qword_C5C0 != -1) {
    dispatch_once(&qword_C5C0, &stru_82B8);
  }
  v0 = (void *)qword_C5B8;

  return v0;
}

void sub_2D88(id a1)
{
  qword_C5B8 = (uint64_t)os_log_create("com.apple.Maps", "MapsAssert");

  _objc_release_x1();
}

id MAPSGetMapsChromeLog()
{
  if (qword_C5D0 != -1) {
    dispatch_once(&qword_C5D0, &stru_82D8);
  }
  v0 = (void *)qword_C5C8;

  return v0;
}

void sub_2E20(id a1)
{
  qword_C5C8 = (uint64_t)os_log_create("com.apple.Maps", "MapsChrome");

  _objc_release_x1();
}

id MAPSGetMapsDefaultLog()
{
  if (qword_C5E0 != -1) {
    dispatch_once(&qword_C5E0, &stru_82F8);
  }
  v0 = (void *)qword_C5D8;

  return v0;
}

void sub_2EB8(id a1)
{
  qword_C5D8 = (uint64_t)os_log_create("com.apple.Maps", "MapsDefault");

  _objc_release_x1();
}

id MAPSGetMapsLaunchLog()
{
  if (qword_C5F0 != -1) {
    dispatch_once(&qword_C5F0, &stru_8318);
  }
  v0 = (void *)qword_C5E8;

  return v0;
}

void sub_2F50(id a1)
{
  qword_C5E8 = (uint64_t)os_log_create("com.apple.Maps", "MapsLaunch");

  _objc_release_x1();
}

id MAPSGetMapsNotificationsLog()
{
  if (qword_C600 != -1) {
    dispatch_once(&qword_C600, &stru_8338);
  }
  v0 = (void *)qword_C5F8;

  return v0;
}

void sub_2FE8(id a1)
{
  qword_C5F8 = (uint64_t)os_log_create("com.apple.Maps", "MapsNotifications");

  _objc_release_x1();
}

id MAPSGetMapsPerformanceLog()
{
  if (qword_C610 != -1) {
    dispatch_once(&qword_C610, &stru_8358);
  }
  v0 = (void *)qword_C608;

  return v0;
}

void sub_3080(id a1)
{
  qword_C608 = (uint64_t)os_log_create("com.apple.Maps", "MapsPerformance");

  _objc_release_x1();
}

id MAPSGetLookAroundLog()
{
  if (qword_C620 != -1) {
    dispatch_once(&qword_C620, &stru_8378);
  }
  v0 = (void *)qword_C618;

  return v0;
}

void sub_3118(id a1)
{
  qword_C618 = (uint64_t)os_log_create("com.apple.Maps", "LookAround");

  _objc_release_x1();
}

id MAPSGetNavigationLog()
{
  if (qword_C630 != -1) {
    dispatch_once(&qword_C630, &stru_8398);
  }
  v0 = (void *)qword_C628;

  return v0;
}

void sub_31B0(id a1)
{
  qword_C628 = (uint64_t)os_log_create("com.apple.Maps", "Navigation");

  _objc_release_x1();
}

id MAPSGetNavigationBannersLog()
{
  if (qword_C640 != -1) {
    dispatch_once(&qword_C640, &stru_83B8);
  }
  v0 = (void *)qword_C638;

  return v0;
}

void sub_3248(id a1)
{
  qword_C638 = (uint64_t)os_log_create("com.apple.Maps", "NavigationBanners");

  _objc_release_x1();
}

id MAPSGetNearbyTransitLog()
{
  if (qword_C650 != -1) {
    dispatch_once(&qword_C650, &stru_83D8);
  }
  v0 = (void *)qword_C648;

  return v0;
}

void sub_32E0(id a1)
{
  qword_C648 = (uint64_t)os_log_create("com.apple.Maps", "NearbyTransit");

  _objc_release_x1();
}

id MAPSGetOfflineLog()
{
  if (qword_C660 != -1) {
    dispatch_once(&qword_C660, &stru_83F8);
  }
  v0 = (void *)qword_C658;

  return v0;
}

void sub_3378(id a1)
{
  qword_C658 = (uint64_t)os_log_create("com.apple.Maps", "Offline");

  _objc_release_x1();
}

id MAPSGetPlaceCardLog()
{
  if (qword_C670 != -1) {
    dispatch_once(&qword_C670, &stru_8418);
  }
  v0 = (void *)qword_C668;

  return v0;
}

void sub_3410(id a1)
{
  qword_C668 = (uint64_t)os_log_create("com.apple.Maps", "PlaceCard");

  _objc_release_x1();
}

id MAPSGetPPTLog()
{
  if (qword_C680 != -1) {
    dispatch_once(&qword_C680, &stru_8438);
  }
  v0 = (void *)qword_C678;

  return v0;
}

void sub_34A8(id a1)
{
  qword_C678 = (uint64_t)os_log_create("com.apple.Maps", "PPT");

  _objc_release_x1();
}

id MAPSGetPreferencesSyncLog()
{
  if (qword_C690 != -1) {
    dispatch_once(&qword_C690, &stru_8458);
  }
  v0 = (void *)qword_C688;

  return v0;
}

void sub_3540(id a1)
{
  qword_C688 = (uint64_t)os_log_create("com.apple.Maps", "PreferencesSync");

  _objc_release_x1();
}

id MAPSGetPrintLog()
{
  if (qword_C6A0 != -1) {
    dispatch_once(&qword_C6A0, &stru_8478);
  }
  v0 = (void *)qword_C698;

  return v0;
}

void sub_35D8(id a1)
{
  qword_C698 = (uint64_t)os_log_create("com.apple.Maps", "Print");

  _objc_release_x1();
}

id MAPSGetRAPLayoutLog()
{
  if (qword_C6B0 != -1) {
    dispatch_once(&qword_C6B0, &stru_8498);
  }
  v0 = (void *)qword_C6A8;

  return v0;
}

void sub_3670(id a1)
{
  qword_C6A8 = (uint64_t)os_log_create("com.apple.Maps", "RAPLayout");

  _objc_release_x1();
}

id MAPSGetRAPNavigationLog()
{
  if (qword_C6C0 != -1) {
    dispatch_once(&qword_C6C0, &stru_84B8);
  }
  v0 = (void *)qword_C6B8;

  return v0;
}

void sub_3708(id a1)
{
  qword_C6B8 = (uint64_t)os_log_create("com.apple.Maps", "RAPNavigation");

  _objc_release_x1();
}

id MAPSGetRAPSubmissionLog()
{
  if (qword_C6D0 != -1) {
    dispatch_once(&qword_C6D0, &stru_84D8);
  }
  v0 = (void *)qword_C6C8;

  return v0;
}

void sub_37A0(id a1)
{
  qword_C6C8 = (uint64_t)os_log_create("com.apple.Maps", "RAPSubmission");

  _objc_release_x1();
}

id MAPSGetRecentsLog()
{
  if (qword_C6E0 != -1) {
    dispatch_once(&qword_C6E0, &stru_84F8);
  }
  v0 = (void *)qword_C6D8;

  return v0;
}

void sub_3838(id a1)
{
  qword_C6D8 = (uint64_t)os_log_create("com.apple.Maps", "Recents");

  _objc_release_x1();
}

id MAPSGetRouteCreationLog()
{
  if (qword_C6F0 != -1) {
    dispatch_once(&qword_C6F0, &stru_8518);
  }
  v0 = (void *)qword_C6E8;

  return v0;
}

void sub_38D0(id a1)
{
  qword_C6E8 = (uint64_t)os_log_create("com.apple.Maps", "RouteCreation");

  _objc_release_x1();
}

id MAPSGetRoutePlanningLog()
{
  if (qword_C700 != -1) {
    dispatch_once(&qword_C700, &stru_8538);
  }
  v0 = (void *)qword_C6F8;

  return v0;
}

void sub_3968(id a1)
{
  qword_C6F8 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanning");

  _objc_release_x1();
}

id MAPSGetRoutePlanningFeatureDiscoveryLog()
{
  if (qword_C710 != -1) {
    dispatch_once(&qword_C710, &stru_8558);
  }
  v0 = (void *)qword_C708;

  return v0;
}

void sub_3A00(id a1)
{
  qword_C708 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningFeatureDiscovery");

  _objc_release_x1();
}

id MAPSGetSearchACLog()
{
  if (qword_C720 != -1) {
    dispatch_once(&qword_C720, &stru_8578);
  }
  v0 = (void *)qword_C718;

  return v0;
}

void sub_3A98(id a1)
{
  qword_C718 = (uint64_t)os_log_create("com.apple.Maps", "SearchAC");

  _objc_release_x1();
}

id MAPSGetSearchACFindMyLog()
{
  if (qword_C730 != -1) {
    dispatch_once(&qword_C730, &stru_8598);
  }
  v0 = (void *)qword_C728;

  return v0;
}

void sub_3B30(id a1)
{
  qword_C728 = (uint64_t)os_log_create("com.apple.Maps", "SearchACFindMy");

  _objc_release_x1();
}

id MAPSGetSearchHomeLog()
{
  if (qword_C740 != -1) {
    dispatch_once(&qword_C740, &stru_85B8);
  }
  v0 = (void *)qword_C738;

  return v0;
}

void sub_3BC8(id a1)
{
  qword_C738 = (uint64_t)os_log_create("com.apple.Maps", "SearchHome");

  _objc_release_x1();
}

id MAPSGetSharedTripLog()
{
  if (qword_C750 != -1) {
    dispatch_once(&qword_C750, &stru_85D8);
  }
  v0 = (void *)qword_C748;

  return v0;
}

void sub_3C60(id a1)
{
  qword_C748 = (uint64_t)os_log_create("com.apple.Maps", "SharedTrip");

  _objc_release_x1();
}

id MAPSGetSharingLog()
{
  if (qword_C760 != -1) {
    dispatch_once(&qword_C760, &stru_85F8);
  }
  v0 = (void *)qword_C758;

  return v0;
}

void sub_3CF8(id a1)
{
  qword_C758 = (uint64_t)os_log_create("com.apple.Maps", "Sharing");

  _objc_release_x1();
}

id MAPSGetShortcutsLog()
{
  if (qword_C770 != -1) {
    dispatch_once(&qword_C770, &stru_8618);
  }
  v0 = (void *)qword_C768;

  return v0;
}

void sub_3D90(id a1)
{
  qword_C768 = (uint64_t)os_log_create("com.apple.Maps", "Shortcuts");

  _objc_release_x1();
}

id MAPSGetTileStateCaptureLog()
{
  if (qword_C780 != -1) {
    dispatch_once(&qword_C780, &stru_8638);
  }
  v0 = (void *)qword_C778;

  return v0;
}

void sub_3E28(id a1)
{
  qword_C778 = (uint64_t)os_log_create("com.apple.Maps", "TileStateCapture");

  _objc_release_x1();
}

id MAPSGetTransitLog()
{
  if (qword_C790 != -1) {
    dispatch_once(&qword_C790, &stru_8658);
  }
  v0 = (void *)qword_C788;

  return v0;
}

void sub_3EC0(id a1)
{
  qword_C788 = (uint64_t)os_log_create("com.apple.Maps", "Transit");

  _objc_release_x1();
}

id MAPSGetTransitPayLog()
{
  if (qword_C7A0 != -1) {
    dispatch_once(&qword_C7A0, &stru_8678);
  }
  v0 = (void *)qword_C798;

  return v0;
}

void sub_3F58(id a1)
{
  qword_C798 = (uint64_t)os_log_create("com.apple.Maps", "TransitPay");

  _objc_release_x1();
}

id MAPSGetTransitSchedulesLog()
{
  if (qword_C7B0 != -1) {
    dispatch_once(&qword_C7B0, &stru_8698);
  }
  v0 = (void *)qword_C7A8;

  return v0;
}

void sub_3FF0(id a1)
{
  qword_C7A8 = (uint64_t)os_log_create("com.apple.Maps", "TransitSchedules");

  _objc_release_x1();
}

id MAPSGetUserProfileLog()
{
  if (qword_C7C0 != -1) {
    dispatch_once(&qword_C7C0, &stru_86B8);
  }
  v0 = (void *)qword_C7B8;

  return v0;
}

void sub_4088(id a1)
{
  qword_C7B8 = (uint64_t)os_log_create("com.apple.Maps", "UserProfile");

  _objc_release_x1();
}

id MAPSGetVehicleDisambiguatorLog()
{
  if (qword_C7D0 != -1) {
    dispatch_once(&qword_C7D0, &stru_86D8);
  }
  v0 = (void *)qword_C7C8;

  return v0;
}

void sub_4120(id a1)
{
  qword_C7C8 = (uint64_t)os_log_create("com.apple.Maps", "VehicleDisambiguator");

  _objc_release_x1();
}

id MAPSGetVirtualGarageLog()
{
  if (qword_C7E0 != -1) {
    dispatch_once(&qword_C7E0, &stru_86F8);
  }
  v0 = (void *)qword_C7D8;

  return v0;
}

void sub_41B8(id a1)
{
  qword_C7D8 = (uint64_t)os_log_create("com.apple.Maps", "VirtualGarage");

  _objc_release_x1();
}

id MAPSGetWeatherLog()
{
  if (qword_C7F0 != -1) {
    dispatch_once(&qword_C7F0, &stru_8718);
  }
  v0 = (void *)qword_C7E8;

  return v0;
}

void sub_4250(id a1)
{
  qword_C7E8 = (uint64_t)os_log_create("com.apple.Maps", "Weather");

  _objc_release_x1();
}

id MAPSGetXPCLog()
{
  if (qword_C800 != -1) {
    dispatch_once(&qword_C800, &stru_8738);
  }
  v0 = (void *)qword_C7F8;

  return v0;
}

void sub_42E8(id a1)
{
  qword_C7F8 = (uint64_t)os_log_create("com.apple.Maps", "XPC");

  _objc_release_x1();
}

id MAPSGetUGCBAAUtilitiesLog()
{
  if (qword_C810 != -1) {
    dispatch_once(&qword_C810, &stru_8758);
  }
  v0 = (void *)qword_C808;

  return v0;
}

void sub_4380(id a1)
{
  qword_C808 = (uint64_t)os_log_create("com.apple.Maps", "UGCBAAUtilities");

  _objc_release_x1();
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_C820 != -1) {
    dispatch_once(&qword_C820, &stru_8778);
  }
  v0 = (void *)qword_C818;

  return v0;
}

void sub_4418(id a1)
{
  qword_C818 = (uint64_t)os_log_create("com.apple.Maps", "IncidentsReporting");

  _objc_release_x1();
}

id MAPSGetWatermarkingLog()
{
  if (qword_C830 != -1) {
    dispatch_once(&qword_C830, &stru_8798);
  }
  v0 = (void *)qword_C828;

  return v0;
}

void sub_44B0(id a1)
{
  qword_C828 = (uint64_t)os_log_create("com.apple.Maps", "Watermarking");

  _objc_release_x1();
}

id MAPSGetWaypointRequestLog()
{
  if (qword_C840 != -1) {
    dispatch_once(&qword_C840, &stru_87B8);
  }
  v0 = (void *)qword_C838;

  return v0;
}

void sub_4548(id a1)
{
  qword_C838 = (uint64_t)os_log_create("com.apple.Maps", "WaypointRequest");

  _objc_release_x1();
}

id MAPSGetWebBundleLog()
{
  if (qword_C850 != -1) {
    dispatch_once(&qword_C850, &stru_87D8);
  }
  v0 = (void *)qword_C848;

  return v0;
}

void sub_45E0(id a1)
{
  qword_C848 = (uint64_t)os_log_create("com.apple.Maps", "WebBundle");

  _objc_release_x1();
}

id MAPSGetRAPRecordsManagerLog()
{
  if (qword_C860 != -1) {
    dispatch_once(&qword_C860, &stru_87F8);
  }
  v0 = (void *)qword_C858;

  return v0;
}

void sub_4678(id a1)
{
  qword_C858 = (uint64_t)os_log_create("com.apple.Maps", "RAPRecordsManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoAttributionLog()
{
  if (qword_C870 != -1) {
    dispatch_once(&qword_C870, &stru_8818);
  }
  v0 = (void *)qword_C868;

  return v0;
}

void sub_4710(id a1)
{
  qword_C868 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoAttribution");

  _objc_release_x1();
}

id MAPSGetSearchResultsImpressionsLog()
{
  if (qword_C880 != -1) {
    dispatch_once(&qword_C880, &stru_8838);
  }
  v0 = (void *)qword_C878;

  return v0;
}

void sub_47A8(id a1)
{
  qword_C878 = (uint64_t)os_log_create("com.apple.Maps", "SearchResultsImpressions");

  _objc_release_x1();
}

id MAPSGetSearchRedoLog()
{
  if (qword_C890 != -1) {
    dispatch_once(&qword_C890, &stru_8858);
  }
  v0 = (void *)qword_C888;

  return v0;
}

void sub_4840(id a1)
{
  qword_C888 = (uint64_t)os_log_create("com.apple.Maps", "SearchRedo");

  _objc_release_x1();
}

id MAPSGetStaleTimeBug_105865770Log()
{
  if (qword_C8A0 != -1) {
    dispatch_once(&qword_C8A0, &stru_8878);
  }
  v0 = (void *)qword_C898;

  return v0;
}

void sub_48D8(id a1)
{
  qword_C898 = (uint64_t)os_log_create("com.apple.Maps", "StaleTimeBug_105865770");

  _objc_release_x1();
}

id MAPSGetCustomPOIsControllerLog()
{
  if (qword_C8B0 != -1) {
    dispatch_once(&qword_C8B0, &stru_8898);
  }
  v0 = (void *)qword_C8A8;

  return v0;
}

void sub_4970(id a1)
{
  qword_C8A8 = (uint64_t)os_log_create("com.apple.Maps", "CustomPOIsController");

  _objc_release_x1();
}

id MAPSGetPOSIXSignalsLog()
{
  if (qword_C8C0 != -1) {
    dispatch_once(&qword_C8C0, &stru_88B8);
  }
  v0 = (void *)qword_C8B8;

  return v0;
}

void sub_4A08(id a1)
{
  qword_C8B8 = (uint64_t)os_log_create("com.apple.Maps", "POSIXSignals");

  _objc_release_x1();
}

id MAPSGetCoalescingSchedulerLog()
{
  if (qword_C8D0 != -1) {
    dispatch_once(&qword_C8D0, &stru_88D8);
  }
  v0 = (void *)qword_C8C8;

  return v0;
}

void sub_4AA0(id a1)
{
  qword_C8C8 = (uint64_t)os_log_create("com.apple.Maps", "CoalescingScheduler");

  _objc_release_x1();
}

id MAPSGetDeviceConnectionLog()
{
  if (qword_C8E0 != -1) {
    dispatch_once(&qword_C8E0, &stru_88F8);
  }
  v0 = (void *)qword_C8D8;

  return v0;
}

void sub_4B38(id a1)
{
  qword_C8D8 = (uint64_t)os_log_create("com.apple.Maps", "DeviceConnection");

  _objc_release_x1();
}

id MAPSGetDictationLog()
{
  if (qword_C8F0 != -1) {
    dispatch_once(&qword_C8F0, &stru_8918);
  }
  v0 = (void *)qword_C8E8;

  return v0;
}

void sub_4BD0(id a1)
{
  qword_C8E8 = (uint64_t)os_log_create("com.apple.Maps", "Dictation");

  _objc_release_x1();
}

id MAPSGetElevationGraphLog()
{
  if (qword_C900 != -1) {
    dispatch_once(&qword_C900, &stru_8938);
  }
  v0 = (void *)qword_C8F8;

  return v0;
}

void sub_4C68(id a1)
{
  qword_C8F8 = (uint64_t)os_log_create("com.apple.Maps", "ElevationGraph");

  _objc_release_x1();
}

id MAPSGetIncidentReportingLog()
{
  if (qword_C910 != -1) {
    dispatch_once(&qword_C910, &stru_8958);
  }
  v0 = (void *)qword_C908;

  return v0;
}

void sub_4D00(id a1)
{
  qword_C908 = (uint64_t)os_log_create("com.apple.Maps", "IncidentReporting");

  _objc_release_x1();
}

id MAPSGetLightLevelLog()
{
  if (qword_C920 != -1) {
    dispatch_once(&qword_C920, &stru_8978);
  }
  v0 = (void *)qword_C918;

  return v0;
}

void sub_4D98(id a1)
{
  qword_C918 = (uint64_t)os_log_create("com.apple.Maps", "LightLevel");

  _objc_release_x1();
}

id MAPSGetMapRegionLog()
{
  if (qword_C930 != -1) {
    dispatch_once(&qword_C930, &stru_8998);
  }
  v0 = (void *)qword_C928;

  return v0;
}

void sub_4E30(id a1)
{
  qword_C928 = (uint64_t)os_log_create("com.apple.Maps", "MapRegion");

  _objc_release_x1();
}

id MAPSGetNavigationSimulationPromptLog()
{
  if (qword_C940 != -1) {
    dispatch_once(&qword_C940, &stru_89B8);
  }
  v0 = (void *)qword_C938;

  return v0;
}

void sub_4EC8(id a1)
{
  qword_C938 = (uint64_t)os_log_create("com.apple.Maps", "NavigationSimulationPrompt");

  _objc_release_x1();
}

id MAPSGetNavIndicatorsLog()
{
  if (qword_C950 != -1) {
    dispatch_once(&qword_C950, &stru_89D8);
  }
  v0 = (void *)qword_C948;

  return v0;
}

void sub_4F60(id a1)
{
  qword_C948 = (uint64_t)os_log_create("com.apple.Maps", "NavIndicators");

  _objc_release_x1();
}

id MAPSGetProactiveTrayLog()
{
  if (qword_C960 != -1) {
    dispatch_once(&qword_C960, &stru_89F8);
  }
  v0 = (void *)qword_C958;

  return v0;
}

void sub_4FF8(id a1)
{
  qword_C958 = (uint64_t)os_log_create("com.apple.Maps", "ProactiveTray");

  _objc_release_x1();
}

id MAPSGetRAPPresenterLog()
{
  if (qword_C970 != -1) {
    dispatch_once(&qword_C970, &stru_8A18);
  }
  v0 = (void *)qword_C968;

  return v0;
}

void sub_5090(id a1)
{
  qword_C968 = (uint64_t)os_log_create("com.apple.Maps", "RAPPresenter");

  _objc_release_x1();
}

id MAPSGetRoutePlanningOutlineLog()
{
  if (qword_C980 != -1) {
    dispatch_once(&qword_C980, &stru_8A38);
  }
  v0 = (void *)qword_C978;

  return v0;
}

void sub_5128(id a1)
{
  qword_C978 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningOutline");

  _objc_release_x1();
}

id MAPSGetStatusIndicatorLog()
{
  if (qword_C990 != -1) {
    dispatch_once(&qword_C990, &stru_8A58);
  }
  v0 = (void *)qword_C988;

  return v0;
}

void sub_51C0(id a1)
{
  qword_C988 = (uint64_t)os_log_create("com.apple.Maps", "StatusIndicator");

  _objc_release_x1();
}

id MAPSGetTransitNavigationLog()
{
  if (qword_C9A0 != -1) {
    dispatch_once(&qword_C9A0, &stru_8A78);
  }
  v0 = (void *)qword_C998;

  return v0;
}

void sub_5258(id a1)
{
  qword_C998 = (uint64_t)os_log_create("com.apple.Maps", "TransitNavigation");

  _objc_release_x1();
}

id MAPSGetTurnAlertsLog()
{
  if (qword_C530 != -1) {
    dispatch_once(&qword_C530, &stru_8A98);
  }
  v0 = (void *)qword_C528;

  return v0;
}

void sub_52F0(id a1)
{
  qword_C528 = (uint64_t)os_log_create("com.apple.Maps", "TurnAlerts");

  _objc_release_x1();
}

id MAPSGetUGCCallToActionViewProviderLog()
{
  if (qword_C9B0 != -1) {
    dispatch_once(&qword_C9B0, &stru_8AB8);
  }
  v0 = (void *)qword_C9A8;

  return v0;
}

void sub_5388(id a1)
{
  qword_C9A8 = (uint64_t)os_log_create("com.apple.Maps", "UGCCallToActionViewProvider");

  _objc_release_x1();
}

id MAPSGetUGCPhotoDownloadManagerLog()
{
  if (qword_C9C0 != -1) {
    dispatch_once(&qword_C9C0, &stru_8AD8);
  }
  v0 = (void *)qword_C9B8;

  return v0;
}

void sub_5420(id a1)
{
  qword_C9B8 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoDownloadManager");

  _objc_release_x1();
}

id MAPSGetUGCReviewedPlacesManagerLog()
{
  if (qword_C9D0 != -1) {
    dispatch_once(&qword_C9D0, &stru_8AF8);
  }
  v0 = (void *)qword_C9C8;

  return v0;
}

void sub_54B8(id a1)
{
  qword_C9C8 = (uint64_t)os_log_create("com.apple.Maps", "UGCReviewedPlacesManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoViewerDataProviderLog()
{
  if (qword_C9E0 != -1) {
    dispatch_once(&qword_C9E0, &stru_8B18);
  }
  v0 = (void *)qword_C9D8;

  return v0;
}

void sub_5550(id a1)
{
  qword_C9D8 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoViewerDataProvider");

  _objc_release_x1();
}

id MAPSGetCarBlurViewLog()
{
  if (qword_C9F0 != -1) {
    dispatch_once(&qword_C9F0, &stru_8B38);
  }
  v0 = (void *)qword_C9E8;

  return v0;
}

void sub_55E8(id a1)
{
  qword_C9E8 = (uint64_t)os_log_create("com.apple.Maps", "CarBlurView");

  _objc_release_x1();
}

id MAPSGetCarCardsLog()
{
  if (qword_CA00 != -1) {
    dispatch_once(&qword_CA00, &stru_8B58);
  }
  v0 = (void *)qword_C9F8;

  return v0;
}

void sub_5680(id a1)
{
  qword_C9F8 = (uint64_t)os_log_create("com.apple.Maps", "CarCards");

  _objc_release_x1();
}

id MAPSGetCarClusterSuggestionLog()
{
  if (qword_CA10 != -1) {
    dispatch_once(&qword_CA10, &stru_8B78);
  }
  v0 = (void *)qword_CA08;

  return v0;
}

void sub_5718(id a1)
{
  qword_CA08 = (uint64_t)os_log_create("com.apple.Maps", "CarClusterSuggestion");

  _objc_release_x1();
}

id MAPSGetCarCompressionLog()
{
  if (qword_CA20 != -1) {
    dispatch_once(&qword_CA20, &stru_8B98);
  }
  v0 = (void *)qword_CA18;

  return v0;
}

void sub_57B0(id a1)
{
  qword_CA18 = (uint64_t)os_log_create("com.apple.Maps", "CarCompression");

  _objc_release_x1();
}

id MAPSGetCarFocusLog()
{
  if (qword_CA30 != -1) {
    dispatch_once(&qword_CA30, &stru_8BB8);
  }
  v0 = (void *)qword_CA28;

  return v0;
}

void sub_5848(id a1)
{
  qword_CA28 = (uint64_t)os_log_create("com.apple.Maps", "CarFocus");

  _objc_release_x1();
}

id MAPSGetCarInstrumentClusterLog()
{
  if (qword_CA40 != -1) {
    dispatch_once(&qword_CA40, &stru_8BD8);
  }
  v0 = (void *)qword_CA38;

  return v0;
}

void sub_58E0(id a1)
{
  qword_CA38 = (uint64_t)os_log_create("com.apple.Maps", "CarInstrumentCluster");

  _objc_release_x1();
}

id MAPSGetCarGuidanceLog()
{
  if (qword_CA50 != -1) {
    dispatch_once(&qword_CA50, &stru_8BF8);
  }
  v0 = (void *)qword_CA48;

  return v0;
}

void sub_5978(id a1)
{
  qword_CA48 = (uint64_t)os_log_create("com.apple.Maps", "CarGuidance");

  _objc_release_x1();
}

id MAPSGetCarMapWidgetLog()
{
  if (qword_CA60 != -1) {
    dispatch_once(&qword_CA60, &stru_8C18);
  }
  v0 = (void *)qword_CA58;

  return v0;
}

void sub_5A10(id a1)
{
  qword_CA58 = (uint64_t)os_log_create("com.apple.Maps", "CarMapWidget");

  _objc_release_x1();
}

id MAPSGetCarPlayLog()
{
  if (qword_CA70 != -1) {
    dispatch_once(&qword_CA70, &stru_8C38);
  }
  v0 = (void *)qword_CA68;

  return v0;
}

void sub_5AA8(id a1)
{
  qword_CA68 = (uint64_t)os_log_create("com.apple.Maps", "CarPlay");

  _objc_release_x1();
}

id MAPSGetCarRouteGeniusLog()
{
  if (qword_CA80 != -1) {
    dispatch_once(&qword_CA80, &stru_8C58);
  }
  v0 = (void *)qword_CA78;

  return v0;
}

void sub_5B40(id a1)
{
  qword_CA78 = (uint64_t)os_log_create("com.apple.Maps", "CarRouteGenius");

  _objc_release_x1();
}

id MAPSGetCarSessionControllerLog()
{
  if (qword_CA90 != -1) {
    dispatch_once(&qword_CA90, &stru_8C78);
  }
  v0 = (void *)qword_CA88;

  return v0;
}

void sub_5BD8(id a1)
{
  qword_CA88 = (uint64_t)os_log_create("com.apple.Maps", "CarSessionController");

  _objc_release_x1();
}

id MAPSGetCarSmallWidgetLog()
{
  if (qword_CAA0 != -1) {
    dispatch_once(&qword_CAA0, &stru_8C98);
  }
  v0 = (void *)qword_CA98;

  return v0;
}

void sub_5C70(id a1)
{
  qword_CA98 = (uint64_t)os_log_create("com.apple.Maps", "CarSmallWidget");

  _objc_release_x1();
}

id MAPSGetCompanionControllerLog()
{
  if (qword_CAB0 != -1) {
    dispatch_once(&qword_CAB0, &stru_8CB8);
  }
  v0 = (void *)qword_CAA8;

  return v0;
}

void sub_5D08(id a1)
{
  qword_CAA8 = (uint64_t)os_log_create("com.apple.Maps", "CompanionController");

  _objc_release_x1();
}

id MAPSGetHydrateGeoMapItemLog()
{
  if (qword_CAC0 != -1) {
    dispatch_once(&qword_CAC0, &stru_8CD8);
  }
  v0 = (void *)qword_CAB8;

  return v0;
}

void sub_5DA0(id a1)
{
  qword_CAB8 = (uint64_t)os_log_create("com.apple.Maps", "HydrateGeoMapItem");

  _objc_release_x1();
}

id MAPSGetIdleTimerLog()
{
  if (qword_CAD0 != -1) {
    dispatch_once(&qword_CAD0, &stru_8CF8);
  }
  v0 = (void *)qword_CAC8;

  return v0;
}

void sub_5E38(id a1)
{
  qword_CAC8 = (uint64_t)os_log_create("com.apple.Maps", "IdleTimer");

  _objc_release_x1();
}

id MAPSGetPedestrianARLog()
{
  if (qword_CAE0 != -1) {
    dispatch_once(&qword_CAE0, &stru_8D18);
  }
  v0 = (void *)qword_CAD8;

  return v0;
}

void sub_5ED0(id a1)
{
  qword_CAD8 = (uint64_t)os_log_create("com.apple.Maps", "PedestrianAR");

  _objc_release_x1();
}

id MAPSGetPuckTrackingLog()
{
  if (qword_CAF0 != -1) {
    dispatch_once(&qword_CAF0, &stru_8D38);
  }
  v0 = (void *)qword_CAE8;

  return v0;
}

void sub_5F68(id a1)
{
  qword_CAE8 = (uint64_t)os_log_create("com.apple.Maps", "PuckTracking");

  _objc_release_x1();
}

void sub_60C4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.NanoMaps.domainAccessor", 0);
  v2 = (void *)qword_CB08;
  qword_CB08 = (uint64_t)v1;

  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = NRPairedDeviceRegistryDeviceDidBecomeActive;
  v5 = +[NSOperationQueue currentQueue];
  id v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:&stru_8E18];

  id v10 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
  v8 = +[NSOperationQueue currentQueue];
  id v9 = [v10 addObserverForName:v7 object:0 queue:v8 usingBlock:&stru_8E58];
}

void sub_61E0(id a1, NSNotification *a2)
{
}

void sub_61F4(id a1)
{
  dispatch_queue_t v1 = (void *)qword_CAF8;
  qword_CAF8 = 0;
}

void sub_6204(id a1, NSNotification *a2)
{
}

void sub_6218(id a1)
{
  dispatch_queue_t v1 = (void *)qword_CAF8;
  qword_CAF8 = 0;
}

uint64_t sub_6228(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6238(uint64_t a1)
{
}

void sub_6240(uint64_t a1)
{
  v2 = (void *)qword_CAF8;
  if (!qword_CAF8)
  {
    id v3 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.NanoMaps"];
    uint64_t v4 = (void *)qword_CAF8;
    qword_CAF8 = (uint64_t)v3;

    v2 = (void *)qword_CAF8;
  }
  v5 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  objc_storeStrong(v5, v2);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__createSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _createSpecifiers];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentQueue(void *a1, const char *a2, ...)
{
  return [a1 currentQueue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_nanoMapsDomainAccessor(void *a1, const char *a2, ...)
{
  return [a1 nanoMapsDomainAccessor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}