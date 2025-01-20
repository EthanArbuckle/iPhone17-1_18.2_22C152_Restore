@interface AXNanoTimeKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
+ (void)installNanoTimeKitClasses:(id)a3;
@end

@implementation AXNanoTimeKitGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)installNanoTimeKitClasses:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"NTKMonogramCircularSmallComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKAnalogHandsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKVictoryAnalogBackgroundViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKLauncherComplicationDataSourceAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKComplicationDisplayWrapperViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKFaceColorEditOptionAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKEmptyCircularSmallComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKTimeIntervalLabelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKComplicationAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKComplicationControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKTimeTravelModuleViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKModularTemplateViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUtilityImageAndLabelsComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKCircularSmallSimpleComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKCircularSmallStackTextComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKMoonPhaseTimelineEntryModelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDateComplicationAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKCircularWellnessUtilityComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKModuleViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDensityEditOptionAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKPigmentEditOptionAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKWorldClockComplicationAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDateComplicationLabelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUtilityComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKExtraLargeTimeViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKContainerViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"_NTKKeylinePathViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"_NTKPigmentAddCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKStopwatchComplicationControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKRingsAndDotsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKWorldClockComplicationControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKFaceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDateComplicationControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKComplicationModuleViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKCircularComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKWellnessCircularSmallComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKCircularSmallCircularImageViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKFaceAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKModularSmallActivityTemplateViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKAstronomyFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKVideoListingAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKEnumeratedEditOptionAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKSwissMoonPhaseDailyViewAccessibility" canInteractWithTargetClass:1];
}

+ (void)accessibilityInitializeBundle
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessibilityInitializeBundle_onceToken_0 != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken_0, block);
  }
}

void __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1)
{
  v2 = +[AXValidationManager sharedInstance];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke_4;
  v3[3] = &__block_descriptor_40_e29_v16__0__AXValidationManager_8l;
  v3[4] = *(void *)(a1 + 32);
  [v2 performValidations:&__block_literal_global_415 withPreValidationHandler:&__block_literal_global_575 postValidationHandler:0 safeCategoryInstallationHandler:v3];
}

BOOL __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"NTKFaceView"];
  [(AXValidationManager *)v2 validateClass:@"_KeylineContainerView", @"keylineView", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_KeylineContainerView", @"label", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_KeylineLabel", @"text", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarm", @"hour", "Q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarm", @"minute", "Q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarm", @"isSnoozed", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarm", @"snoozeFireDate", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarmManager", @"nextAlarmSync", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"MTAlarmManager", @"alarmCount", "Q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"numberOfOptionsForCustomEditMode: slot:", "Q", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"indexOfOption: forCustomEditMode: slot:", "Q", "@", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKComplication", @"localizedKeylineLabelText", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"selectedSlotForEditMode:", "@", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"_localizedNameForDynamicSectionCustomEditMode:slot:", "@", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"localizedNameForCustomEditMode:forDevice:", "@", "q", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"_localizedNameForComplicationSlot:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"selectedOptionForCustomEditMode:slot:", "@", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"indexOfOption:forCustomEditMode:slot:", "Q", "@", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceViewController", @"face", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"enumerateComplicationSlotsWithBlock:", "v", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"allVisibleComplicationsForCurrentConfiguration", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFace", @"complicationForSlot:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKComplication", @"localizedDetailText", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKEditOption", @"localizedName", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceView", @"editSpeedForCustomEditMode:slot:", "d", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceView", @"detentTypeForCustomEditMode:slot:", "Q", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditView", @"setForEditMode:numberOfLisaValues:currentValue:valueHeight:animated:detentType:", "v", "q", "Q", "Q", "d", "B", "Q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditView", @"setEditMode:", "v", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceViewController", @"_endTransitionToValue:forEditMode:", "v", "q", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceViewController", @"_transitionFraction:fromValue:toValue:forEditMode:slot:", "v", "d", "q", "q", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceViewController", @"_usesColorPickerForEditMode:", "B", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceViewController", @"_colorPickerConfig", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditColorPickerConfiguration", @"numberOfColors", "Q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditColorPickerConfiguration", @"indexOfColor:", "Q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditColorPickerConfiguration", @"canAddColors", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditColorPickerConfiguration" hasInstanceVariable:@"_legacyColors" withType:"NSMutableArray"];
  [(AXValidationManager *)v2 validateClass:@"NTKFaceEditColorPickerConfiguration", @"indexOfLegacyColor:", "Q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateProtocol:@"NTKComplicationItem" hasMethod:@"ntk_localizedNameWithOptions:forRichComplicationSlot:" isInstanceMethod:1 isRequired:1];

  return 1;
}

BOOL __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AX NanoTimeKit"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AX NanoTimeKit"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __50__AXNanoTimeKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 installSafeCategory:@"NTKFaceEditingTabsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerOffCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerContactCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerAppGroupCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerListCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerFeaturedCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"StarbearPickerHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKAstronomyRichComplicationCornerViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKBlackcombFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDigitalTimeLabelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUtilityFlatComplicationViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKRichComplicationCircularBaseTextViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKRichComplicationRectangularFullViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKOlympusTimeContentViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKBigNumeralsTimeComponentLabelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKNowPlayingIndicatorFullColorProviderAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKNowPlayingIndicatorProviderAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKWorldClockRichComplicationHandsBaseViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDualTimeViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKDigitalFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKAnalogFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextMatchupUpcomingViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextMatchupScoreViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextMatchupCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKExplorerStatusViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKPodcastsTimelineEntryAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKRadioTimelineEntryAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextPhotosDataSourceAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKWorldClockTimelineEntryModelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKStopwatchTimelineEntryAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKAlarmTimelineEntryAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextFaceViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKHeartRateTimelineEntryModelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKEmptyModuleViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKBatteryTimelineEntryModelAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextBaseCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NTKUpNextHeaderViewAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installNanoTimeKitClasses:v3];
}

@end