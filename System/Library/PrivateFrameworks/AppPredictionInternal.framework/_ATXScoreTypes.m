@interface _ATXScoreTypes
+ (id)aggdStringForScoreInput:(unint64_t)a3;
+ (id)scoreInputsToNames;
+ (id)stringForScoreInput:(unint64_t)a3;
+ (unint64_t)mappingForDayOfWeekDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4;
+ (unint64_t)mappingForTimeOfDayDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4;
+ (unint64_t)mappingForTopRankedCoarseGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4;
+ (unint64_t)mappingForTopRankedGeoHashSignalsWithResolution:(unint64_t)a3 withRank:(unint64_t)a4 forScoreInputCategory:(unint64_t)a5;
+ (unint64_t)mappingForTopRankedSpecificGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4;
+ (unint64_t)mappingForTopRankedZoom7GeoHashSignals:(unint64_t)a3;
+ (unint64_t)scoreInputForString:(id)a3;
+ (void)iterScoreInputsWithBlock:(id)a3;
@end

@implementation _ATXScoreTypes

+ (id)stringForScoreInput:(unint64_t)a3
{
  id result = @"_ATXScoreInputAppInFolder";
  switch(a3)
  {
    case 0uLL:
      id result = @"_ATXScoreInputInstallAge";
      break;
    case 1uLL:
      id result = @"_ATXScoreInputLastSpotlightLaunchAge";
      break;
    case 2uLL:
      id result = @"_ATXScoreInputLastLaunchAge";
      break;
    case 3uLL:
      id result = @"_ATXScoreInputMedianSecondsBetweenLaunches";
      break;
    case 4uLL:
      id result = @"_ATXScoreInputAverageSecondsBetweenLaunches";
      break;
    case 5uLL:
      id result = @"_ATXScoreInputUnlockTime";
      break;
    case 6uLL:
      return result;
    case 7uLL:
      id result = @"_ATXScoreInputFolderPage";
      break;
    case 8uLL:
      id result = @"_ATXScoreInputHasSpringBoardPage";
      break;
    case 9uLL:
      id result = @"_ATXScoreInputSpringBoardPage";
      break;
    case 0xAuLL:
      id result = @"_ATXScoreInputOnSpringBoardDock";
      break;
    case 0xBuLL:
      id result = @"_ATXScoreInputFeedback";
      break;
    case 0xCuLL:
      id result = @"_ATXScoreInputFeedbackConfirms";
      break;
    case 0xDuLL:
      id result = @"_ATXScoreInputFeedbackRejects";
      break;
    case 0xEuLL:
      id result = @"_ATXScoreInputAPRExplicitConfirmRatio";
      break;
    case 0xFuLL:
      id result = @"_ATXScoreInputAPRExplicitRejectRatio";
      break;
    case 0x10uLL:
      id result = @"_ATXScoreInputAPRImplicitConfirmRatio";
      break;
    case 0x11uLL:
      id result = @"_ATXScoreInputAPRImplicitRejectRatio";
      break;
    case 0x12uLL:
      id result = @"_ATXScoreInputAPRSiriKitIntentsRatio";
      break;
    case 0x13uLL:
      id result = @"_ATXScoreInputAPRNonSiriKitIntentsRatio";
      break;
    case 0x14uLL:
      id result = @"_ATXScoreInputAPRTotalExplicitConfirms";
      break;
    case 0x15uLL:
      id result = @"_ATXScoreInputAPRTotalExplicitRejects";
      break;
    case 0x16uLL:
      id result = @"_ATXScoreInputAPRTotalImplicitConfirms";
      break;
    case 0x17uLL:
      id result = @"_ATXScoreInputAPRTotalImplicitRejects";
      break;
    case 0x18uLL:
      id result = @"_ATXScoreInputAPRSiriKitTotalIntents";
      break;
    case 0x19uLL:
      id result = @"_ATXScoreInputAPRNonSiriKitTotalIntents";
      break;
    case 0x1AuLL:
      id result = @"_ATXScoreInputLaunchTimePopularity";
      break;
    case 0x1BuLL:
      id result = @"_ATXScoreInputTimeOfDayPopularity";
      break;
    case 0x1CuLL:
      id result = @"_ATXScoreInputCoarseTimeOfDayPopularity";
      break;
    case 0x1DuLL:
      id result = @"_ATXScoreInputLaunchPopularity";
      break;
    case 0x1EuLL:
      id result = @"_ATXScoreInputSpotlightLaunchTimePopularity";
      break;
    case 0x1FuLL:
      id result = @"_ATXScoreInputSpotlightTimeOfDayPopularity";
      break;
    case 0x20uLL:
      id result = @"_ATXScoreInputSpotlightLaunchPopularity";
      break;
    case 0x21uLL:
      id result = @"_ATXScoreInputDayZeroPoints";
      break;
    case 0x22uLL:
      id result = @"_ATXScoreInputStaticAppPoints";
      break;
    case 0x23uLL:
      id result = @"_ATXScoreInputLaunchDayOfWeekPopularity";
      break;
    case 0x24uLL:
      id result = @"_ATXScoreInputDayOfWeekPopularity";
      break;
    case 0x25uLL:
      id result = @"_ATXScoreInputLaunchSequencePopularity";
      break;
    case 0x26uLL:
      id result = @"_ATXScoreInputLaunchLocationPopularity";
      break;
    case 0x27uLL:
      id result = @"_ATXScoreInputAppLaunchMicroLocationPopularity";
      break;
    case 0x28uLL:
      id result = @"_ATXScoreInputEntropyLaunchPopularity";
      break;
    case 0x29uLL:
      id result = @"_ATXScoreInputEntropyDayOfWeekPopularity";
      break;
    case 0x2AuLL:
      id result = @"_ATXScoreInputEntropyDayOfWeekPopularityByDay";
      break;
    case 0x2BuLL:
      id result = @"_ATXScoreInputEntropyDayOfWeekPopularityByApp";
      break;
    case 0x2CuLL:
      id result = @"_ATXScoreInputDistanceDayOfWeekToLaunchPopularity";
      break;
    case 0x2DuLL:
      id result = @"_ATXScoreInputEntropyTrendingPopularity";
      break;
    case 0x2EuLL:
      id result = @"_ATXScoreInputDistanceTrendingToLaunchPopularity";
      break;
    case 0x2FuLL:
      id result = @"_ATXScoreInputEntropySSIDPopularity";
      break;
    case 0x30uLL:
      id result = @"_ATXScoreInputEntropySSIDPopularityBySSID";
      break;
    case 0x31uLL:
      id result = @"_ATXScoreInputEntropySSIDPopularityByApp";
      break;
    case 0x32uLL:
      id result = @"_ATXScoreInputDistanceSSIDToLaunchPopularity";
      break;
    case 0x33uLL:
      id result = @"_ATXScoreInputAppCount";
      break;
    case 0x34uLL:
      id result = @"_ATXScoreInputDistanceToExplicitLaunchPrediction";
      break;
    case 0x35uLL:
      id result = @"_ATXScoreInputSiriKitIntentParzen";
      break;
    case 0x36uLL:
      id result = @"_ATXScoreInputNonSiriKitIntentParzen";
      break;
    case 0x37uLL:
      id result = @"_ATXScoreInputAppDailyDose";
      break;
    case 0x38uLL:
      id result = @"_ATXScoreInputCurrentDose";
      break;
    case 0x39uLL:
      id result = @"_ATXScoreInputAppDailyDoseRemaining";
      break;
    case 0x3AuLL:
      id result = @"_ATXScoreInputAppDailyDoseSmoothedError";
      break;
    case 0x3BuLL:
      id result = @"_ATXScoreInputTotalNumberOfLaunches";
      break;
    case 0x3CuLL:
      id result = @"_ATXScoreInputTotalNumberOfSpotlightLaunches";
      break;
    case 0x3DuLL:
      id result = @"_ATXScoreInputAirplaneModePopularity";
      break;
    case 0x3EuLL:
      id result = @"_ATXScoreInputTotalNumberOfAirplaneModeLaunches";
      break;
    case 0x3FuLL:
      id result = @"_ATXScoreInputTrendingPopularity";
      break;
    case 0x40uLL:
      id result = @"_ATXScoreInputTotalNumberOfTrendingLaunches";
      break;
    case 0x41uLL:
      id result = @"_ATXScoreInputSSIDPopularity";
      break;
    case 0x42uLL:
      id result = @"_ATXScoreInputTotalNumberOfSSIDLaunches";
      break;
    case 0x43uLL:
      id result = @"_ATXScoreInputOnWifi";
      break;
    case 0x44uLL:
      id result = @"_ATXScoreInputCoreMotionPopularity";
      break;
    case 0x45uLL:
      id result = @"_ATXScoreInputTotalNumberOfCoreMotionLaunches";
      break;
    case 0x46uLL:
      id result = @"_ATXScoreInputMagicalMomentsConfidence";
      break;
    case 0x47uLL:
      id result = @"_ATXScoreInputMagicalMomentsPredictionReason";
      break;
    case 0x48uLL:
      id result = @"_ATXScoreInputMagicalMomentsAnchor";
      break;
    case 0x49uLL:
      id result = @"_ATXScoreInputHeroAppConfidence";
      break;
    case 0x4AuLL:
      id result = @"_ATXScoreInputHeroAppPredictionReason";
      break;
    case 0x4BuLL:
      id result = @"_ATXScoreInputMagicalMomentsHeroAppPredictionIndex";
      break;
    case 0x4CuLL:
      id result = @"_ATXScoreInputMagicalMomentsHeroAppPredictionTotalPredictions";
      break;
    case 0x4DuLL:
      id result = @"_ATXScoreInputMostRecentNotificationAge";
      break;
    case 0x4EuLL:
      id result = @"_ATXScoreInputAppPreferenceBundleBoost";
      break;
    case 0x4FuLL:
      id result = @"_ATXScoreInputAppIntentPartOfWeekPopularity";
      break;
    case 0x50uLL:
      id result = @"_ATXScoreInputAppIntentLaunchPartOfWeekPopularity";
      break;
    case 0x51uLL:
      id result = @"_ATXScoreInputGenreTimeOfDayPopularity";
      break;
    case 0x52uLL:
      id result = @"_ATXScoreInputGenreSequencePopularity";
      break;
    case 0x53uLL:
      id result = @"_ATXScoreInputGenreDayOfWeekPopularity";
      break;
    case 0x54uLL:
      id result = @"_ATXScoreInputGenreSpotlightLaunchPopularity";
      break;
    case 0x55uLL:
      id result = @"_ATXScoreInputTrendingGenrePopularity";
      break;
    case 0x56uLL:
      id result = @"_ATXScoreInputGenreAirplaneModePopularity";
      break;
    case 0x57uLL:
      id result = @"_ATXScoreInputGenreDailyDoseRemaining";
      break;
    case 0x58uLL:
      id result = @"_ATXScoreInputGenreLocationPopularity";
      break;
    case 0x59uLL:
      id result = @"_ATXScoreInputGenreSSIDPopularity";
      break;
    case 0x5AuLL:
      id result = @"_ATXScoreInputApp2VecClusterTimeOfDayPopularity";
      break;
    case 0x5BuLL:
      id result = @"_ATXScoreInputApp2VecClusterSequencePopularity";
      break;
    case 0x5CuLL:
      id result = @"_ATXScoreInputApp2VecClusterDayOfWeekPopularity";
      break;
    case 0x5DuLL:
      id result = @"_ATXScoreInputApp2VecClusterTrendingPopularity";
      break;
    case 0x5EuLL:
      id result = @"_ATXScoreInputApp2VecClusterLocationPopularity";
      break;
    case 0x5FuLL:
      id result = @"_ATXScoreInputApp2VecClusterCount";
      break;
    case 0x60uLL:
      id result = @"_ATXScoreInputSupportsMedia";
      break;
    case 0x61uLL:
      id result = @"_ATXScoreInputAppTimeAndDayOfWeekPopularity";
      break;
    case 0x62uLL:
      id result = @"_ATXScoreInputAppPopularityGivenTimeAndDayOfWeek";
      break;
    case 0x63uLL:
      id result = @"_ATXScoreInputAppPopularityOfTimeAndDayOfWeekGivenApp";
      break;
    case 0x64uLL:
      id result = @"_ATXScoreInputAppTotalNumberOfTimeAndDayOfWeekLaunches";
      break;
    case 0x65uLL:
      id result = @"_ATXScoreInputAppIntentCount";
      break;
    case 0x66uLL:
      id result = @"_ATXScoreInputAppIntentSlotCountForAllAppActions";
      break;
    case 0x67uLL:
      id result = @"_ATXScoreInputAppIntentTotalNumberOfLaunches";
      break;
    case 0x68uLL:
      id result = @"_ATXScoreInputAppIntentTotalNumberOfAirplaneModeLaunches";
      break;
    case 0x69uLL:
      id result = @"_ATXScoreInputAppIntentTotalNumberOfSSIDLaunches";
      break;
    case 0x6AuLL:
      id result = @"_ATXScoreInputAppIntentTotalNumberOfCoreMotionLaunches";
      break;
    case 0x6BuLL:
      id result = @"_ATXScoreInputAppIntentTotalNumberOfTrendingLaunches";
      break;
    case 0x6CuLL:
      id result = @"_ATXScoreInputDayOfWeekBucket";
      break;
    case 0x6DuLL:
      id result = @"_ATXScoreInputTimeOfDayBucket";
      break;
    case 0x6EuLL:
      id result = @"_ATXScoreInputIsDateInWeekendOnDevice";
      break;
    case 0x6FuLL:
      id result = @"_ATXScoreInputAppIntentLaunchPopularity";
      break;
    case 0x70uLL:
      id result = @"_ATXScoreInputAppIntentTrendingPopularity";
      break;
    case 0x71uLL:
      id result = @"_ATXScoreInputAppIntentTimeOfDayPopularity";
      break;
    case 0x72uLL:
      id result = @"_ATXScoreInputAppIntentCoarseTimeOfDayPopularity";
      break;
    case 0x73uLL:
      id result = @"_ATXScoreInputAppIntentDayOfWeekPopularity";
      break;
    case 0x74uLL:
      id result = @"_ATXScoreInputAppIntentUnlockTime";
      break;
    case 0x75uLL:
      id result = @"_ATXScoreInputAppIntentSSIDPopularity";
      break;
    case 0x76uLL:
      id result = @"_ATXScoreInputAppIntentCoreMotionPopularity";
      break;
    case 0x77uLL:
      id result = @"_ATXScoreInputAppIntentAirplaneModePopularity";
      break;
    case 0x78uLL:
      id result = @"_ATXScoreInputAppIntentLaunchLocationPopularity";
      break;
    case 0x79uLL:
      id result = @"_ATXScoreInputAppIntentLaunchMicroLocationPopularity";
      break;
    case 0x7AuLL:
      id result = @"_ATXScoreInputAppIntentLaunchSequencePopularity";
      break;
    case 0x7BuLL:
      id result = @"_ATXScoreInputAppIntentAppLaunchSequencePopularity";
      break;
    case 0x7CuLL:
      id result = @"_ATXScoreInputAppIntentLaunchTimePopularity";
      break;
    case 0x7DuLL:
      id result = @"_ATXScoreInputAppIntentLaunchDayOfWeekPopularity";
      break;
    case 0x7EuLL:
      id result = @"_ATXScoreInputAppIntentLastLaunchAge";
      break;
    case 0x7FuLL:
      id result = @"_ATXScoreInputAppIntentAverageSecondsBetweenAppActions";
      break;
    case 0x80uLL:
      id result = @"_ATXScoreInputAppIntentMedianSecondsBetweenAppActions";
      break;
    case 0x81uLL:
      id result = @"_ATXScoreInputAppIntentDayZeroPoints";
      break;
    case 0x82uLL:
      id result = @"_ATXScoreInputAppIntentStaticPoints";
      break;
    case 0x83uLL:
      id result = @"_ATXScoreInputAppIntentValueScore";
      break;
    case 0x84uLL:
      id result = @"_ATXScoreInputAppCategory";
      break;
    case 0x85uLL:
      id result = @"_ATXScoreInputIntentCategory";
      break;
    case 0x86uLL:
      id result = @"_ATXScoreInputActionKeyCategory";
      break;
    case 0x87uLL:
      id result = @"_ATXScoreInputIntentCategoryFromIntentDefinition";
      break;
    case 0x88uLL:
      id result = @"_ATXScoreInputAppIntentEntropyLaunchPopularity";
      break;
    case 0x89uLL:
      id result = @"_ATXScoreInputAppIntentEntropyDayOfWeekPopularity";
      break;
    case 0x8AuLL:
      id result = @"_ATXScoreInputAppIntentEntropyDayOfWeekPopularityByDay";
      break;
    case 0x8BuLL:
      id result = @"_ATXScoreInputAppIntentEntropyDayOfWeekPopularityByAppIntent";
      break;
    case 0x8CuLL:
      id result = @"_ATXScoreInputAppIntentEntropyTrendingPopularity";
      break;
    case 0x8DuLL:
      id result = @"_ATXScoreInputAppIntentEntropySSIDPopularity";
      break;
    case 0x8EuLL:
      id result = @"_ATXScoreInputAppIntentEntropySSIDPopularityBySSID";
      break;
    case 0x8FuLL:
      id result = @"_ATXScoreInputAppIntentEntropySSIDPopularityByAppIntent";
      break;
    case 0x90uLL:
      id result = @"_ATXScoreInputAppIntentDistanceDayOfWeekToLaunchPopularity";
      break;
    case 0x91uLL:
      id result = @"_ATXScoreInputAppIntentDistanceTrendingToLaunchPopularity";
      break;
    case 0x92uLL:
      id result = @"_ATXScoreInputAppIntentDistanceSSIDToLaunchPopularity";
      break;
    case 0x93uLL:
      id result = @"_ATXScoreInputAppActionConfirmEvents";
      break;
    case 0x94uLL:
      id result = @"_ATXScoreInputAppActionRejectEvents";
      break;
    case 0x95uLL:
      id result = @"_ATXScoreInputTotalAppActionConfirmEvents";
      break;
    case 0x96uLL:
      id result = @"_ATXScoreInputTotalAppActionRejectEvents";
      break;
    case 0x97uLL:
      id result = @"_ATXScoreInputAppForAllIntentsCount";
      break;
    case 0x98uLL:
      id result = @"_ATXScoreInputAppForAllIntentsTotalNumberOfLaunches";
      break;
    case 0x99uLL:
      id result = @"_ATXScoreInputAppForAllIntentsTotalNumberOfAirplaneModeLaunches";
      break;
    case 0x9AuLL:
      id result = @"_ATXScoreInputAppForAllIntentsTotalNumberOfSSIDLaunches";
      break;
    case 0x9BuLL:
      id result = @"_ATXScoreInputAppForAllIntentsTotalNumberOfCoreMotionLaunches";
      break;
    case 0x9CuLL:
      id result = @"_ATXScoreInputAppForAllIntentsTotalNumberOfTrendingLaunches";
      break;
    case 0x9DuLL:
      id result = @"_ATXScoreInputAppForAllIntentsLaunchPopularity";
      break;
    case 0x9EuLL:
      id result = @"_ATXScoreInputAppForAllIntentsTimeOfDayPopularity";
      break;
    case 0x9FuLL:
      id result = @"_ATXScoreInputAppForAllIntentsDayOfWeekPopularity";
      break;
    case 0xA0uLL:
      id result = @"_ATXScoreInputAppForAllIntentsCoarseTimeOfDayPopularity";
      break;
    case 0xA1uLL:
      id result = @"_ATXScoreInputAppForAllIntentsUnlockTime";
      break;
    case 0xA2uLL:
      id result = @"_ATXScoreInputAppForAllIntentsAirplaneModePopularity";
      break;
    case 0xA3uLL:
      id result = @"_ATXScoreInputAppForAllIntentsSSIDPopularity";
      break;
    case 0xA4uLL:
      id result = @"_ATXScoreInputAppForAllIntentsCoreMotionPopularity";
      break;
    case 0xA5uLL:
      id result = @"_ATXScoreInputAppForAllIntentsTrendingPopularity";
      break;
    case 0xA6uLL:
      id result = @"_ATXScoreInputAppForAllIntentsLaunchLocationPopularity";
      break;
    case 0xA7uLL:
      id result = @"_ATXScoreInputAppForAllIntentsLaunchTimePopularity";
      break;
    case 0xA8uLL:
      id result = @"_ATXScoreInputAppForAllIntentsLaunchDayOfWeekPopularity";
      break;
    case 0xA9uLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropyLaunchPopularity";
      break;
    case 0xAAuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularity";
      break;
    case 0xABuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularityByDay";
      break;
    case 0xACuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularityByApp";
      break;
    case 0xADuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropyTrendingPopularity";
      break;
    case 0xAEuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropySSIDPopularity";
      break;
    case 0xAFuLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropySSIDPopularityBySSID";
      break;
    case 0xB0uLL:
      id result = @"_ATXScoreInputAppForAllIntentsEntropySSIDPopularityByApp";
      break;
    case 0xB1uLL:
      id result = @"_ATXScoreInputAppForAllIntentsDistanceSSIDToLaunchPopularity";
      break;
    case 0xB2uLL:
      id result = @"_ATXScoreInputAppForAllIntentsDistanceDayOfWeekToLaunchPopularity";
      break;
    case 0xB3uLL:
      id result = @"_ATXScoreInputAppForAllIntentsDistanceTrendingToLaunchPopularity";
      break;
    case 0xB4uLL:
      id result = @"_ATXScoreInputAppForAllActionsConfirmEvents";
      break;
    case 0xB5uLL:
      id result = @"_ATXScoreInputAppForAllActionsRejectEvents";
      break;
    case 0xB6uLL:
      id result = @"_ATXScoreInputTotalAppForAllActionsConfirmEvents";
      break;
    case 0xB7uLL:
      id result = @"_ATXScoreInputTotalAppForAllActionsRejectEvents";
      break;
    case 0xB8uLL:
      id result = @"_ATXScoreInputSlotCount";
      break;
    case 0xB9uLL:
      id result = @"_ATXScoreInputSlotTotalNumberOfLaunches";
      break;
    case 0xBAuLL:
      id result = @"_ATXScoreInputSlotTotalNumberOfUniqueDaysLaunched";
      break;
    case 0xBBuLL:
      id result = @"_ATXScoreInputSlotLaunchPopularity";
      break;
    case 0xBCuLL:
      id result = @"_ATXScoreInputSlotTimeOfDayPopularity";
      break;
    case 0xBDuLL:
      id result = @"_ATXScoreInputSlotTimeOfDayWithThirtyMinuteWindowPopularity";
      break;
    case 0xBEuLL:
      id result = @"_ATXScoreInputSlotTimeOfDayWithHourWindowPopularity";
      break;
    case 0xBFuLL:
      id result = @"_ATXScoreInputSlotTimeOfDayWithEightHourWindowPopularity";
      break;
    case 0xC0uLL:
      id result = @"_ATXScoreInputSlotDayOfWeekPopularity";
      break;
    case 0xC1uLL:
      id result = @"_ATXScoreInputSlotPartOfWeekPopularity";
      break;
    case 0xC2uLL:
      id result = @"_ATXScoreInputSlotPartOfWeekAndLocationPopularity";
      break;
    case 0xC3uLL:
      id result = @"_ATXScoreInputSlotCoarseTimeOfDayPopularity";
      break;
    case 0xC4uLL:
      id result = @"_ATXScoreInputSlotLocationPopularity";
      break;
    case 0xC5uLL:
      id result = @"_ATXScoreInputSlotCoreMotionPopularity";
      break;
    case 0xC6uLL:
      id result = @"_ATXScoreInputSlotPreviousLocationPopularity";
      break;
    case 0xC7uLL:
      id result = @"_ATXScoreInputSlotTimeAndDayPopularity";
      break;
    case 0xC8uLL:
      id result = @"_ATXScoreInputSlotTimeAndLocationPopularity";
      break;
    case 0xC9uLL:
      id result = @"_ATXScoreInputSlotDayAndLocationPopularity";
      break;
    case 0xCAuLL:
      id result = @"_ATXScoreInputSlotTimeAndDayAndLocationPopularity";
      break;
    case 0xCBuLL:
      id result = @"_ATXScoreInputSlotPreviousLocationAndCoreMotionPopularity";
      break;
    case 0xCCuLL:
      id result = @"_ATXScoreInputSlotPreviousLocationAndLocationPopularity";
      break;
    case 0xCDuLL:
      id result = @"_ATXScoreInputSlotTimeAndPreviousLocationPopularity";
      break;
    case 0xCEuLL:
      id result = @"_ATXScoreInputSlotDayAndPreviousLocationPopularity";
      break;
    case 0xCFuLL:
      id result = @"_ATXScoreInputSlotPartOfWeekAndTimePopularity";
      break;
    case 0xD0uLL:
      id result = @"_ATXScoreInputSlotLaunchTimePopularity";
      break;
    case 0xD1uLL:
      id result = @"_ATXScoreInputSlotLaunchCoarseTimePopularity";
      break;
    case 0xD2uLL:
      id result = @"_ATXScoreInputSlotLaunchDayOfWeekPopularity";
      break;
    case 0xD3uLL:
      id result = @"_ATXScoreInputSlotLaunchPartOfWeekPopularity";
      break;
    case 0xD4uLL:
      id result = @"_ATXScoreInputSlotLaunchPartOfWeekAndLocationPopularity";
      break;
    case 0xD5uLL:
      id result = @"_ATXScoreInputSlotLaunchLocationPopularity";
      break;
    case 0xD6uLL:
      id result = @"_ATXScoreInputSlotLaunchCoreMotionPopularity";
      break;
    case 0xD7uLL:
      id result = @"_ATXScoreInputSlotLaunchPreviousLocationPopularity";
      break;
    case 0xD8uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeAndDayPopularity";
      break;
    case 0xD9uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeAndLocationPopularity";
      break;
    case 0xDAuLL:
      id result = @"_ATXScoreInputSlotLaunchDayAndLocationPopularity";
      break;
    case 0xDBuLL:
      id result = @"_ATXScoreInputSlotLaunchTimeAndDayAndLocationPopularity";
      break;
    case 0xDCuLL:
      id result = @"_ATXScoreInputSlotLaunchPreviousLocationAndCoreMotionPopularity";
      break;
    case 0xDDuLL:
      id result = @"_ATXScoreInputSlotLaunchPreviousLocationAndLocationPopularity";
      break;
    case 0xDEuLL:
      id result = @"_ATXScoreInputSlotLaunchTimeAndPreviousLocationPopularity";
      break;
    case 0xDFuLL:
      id result = @"_ATXScoreInputSlotLaunchDayAndPreviousLocationPopularity";
      break;
    case 0xE0uLL:
      id result = @"_ATXScoreInputSlotLaunchPartOfWeekAndTimePopularity";
      break;
    case 0xE1uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeCount";
      break;
    case 0xE2uLL:
      id result = @"_ATXScoreInputSlotLaunchDayOfWeekCount";
      break;
    case 0xE3uLL:
      id result = @"_ATXScoreInputSlotLaunchPartOfWeekCount";
      break;
    case 0xE4uLL:
      id result = @"_ATXScoreInputSlotLaunchCoarseTimeCount";
      break;
    case 0xE5uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeWithThirtyMinuteWindowCount";
      break;
    case 0xE6uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeWithHourWindowCount";
      break;
    case 0xE7uLL:
      id result = @"_ATXScoreInputSlotLaunchTimeWithEightHourWindowCount";
      break;
    case 0xE8uLL:
      id result = @"_ATXScoreInputSlotLaunchLocationCount";
      break;
    case 0xE9uLL:
      id result = @"_ATXScoreInputSlotLaunchCoreMotionCount";
      break;
    case 0xEAuLL:
      id result = @"_ATXScoreInputSlotLaunchPreviousLocationCount";
      break;
    case 0xEBuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeDecay";
      break;
    case 0xECuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingDayOfWeekDecay";
      break;
    case 0xEDuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingLocationDecay";
      break;
    case 0xEEuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingCoreMotionDecay";
      break;
    case 0xEFuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationDecay";
      break;
    case 0xF0uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekDecay";
      break;
    case 0xF1uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndDayDecay";
      break;
    case 0xF2uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndLocationDecay";
      break;
    case 0xF3uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingDayAndLocationDecay";
      break;
    case 0xF4uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay";
      break;
    case 0xF5uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay";
      break;
    case 0xF6uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay";
      break;
    case 0xF7uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay";
      break;
    case 0xF8uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingDayAndPreviousLocationDecay";
      break;
    case 0xF9uLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay";
      break;
    case 0xFAuLL:
      id result = @"_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay";
      break;
    case 0xFBuLL:
      id result = @"_ATXScoreInputSlotSecondsSinceLastSlot";
      break;
    case 0xFCuLL:
      id result = @"_ATXScoreInputSlotOnlyLaunchedWithinShortTimeSpan";
      break;
    case 0xFDuLL:
      id result = @"_ATXScoreInputSlotTotalNumberOfUndecayedLaunchesForSlot";
      break;
    case 0xFEuLL:
      id result = @"_ATXScoreInputSlotNumberOfUniqueDaysLaunchedForSlot";
      break;
    case 0xFFuLL:
      id result = @"_ATXScoreInputSlotTotalNumberOfLaunchesForSlot";
      break;
    case 0x100uLL:
      id result = @"_ATXScoreInputSlotLOIBoost";
      break;
    case 0x101uLL:
      id result = @"_ATXScoreInputSlotNumberOfParameters";
      break;
    case 0x102uLL:
      id result = @"_ATXScoreInputSlotNumSessionStartsForRootOfApp";
      break;
    case 0x103uLL:
      id result = @"_ATXScoreInputSlotTotalNumSessionsForRootOfApp";
      break;
    case 0x104uLL:
      id result = @"_ATXScoreInputSlotNumDocFreqForRootOfApp";
      break;
    case 0x105uLL:
      id result = @"_ATXScoreInputSlotEntropyForSlotSet";
      break;
    case 0x106uLL:
      id result = @"_ATXScoreInputSlotTotalNumberOfLaunchesForSlotSet";
      break;
    case 0x107uLL:
      id result = @"_ATXScoreInputSlotTimeOfDayBudgetMeanForSlot";
      break;
    case 0x108uLL:
      id result = @"_ATXScoreInputSlotTimeOfDayBudgetStdDevForSlot";
      break;
    case 0x109uLL:
      id result = @"_ATXScoreInputSlotTodaysTimeOfDayBudgetForSlot";
      break;
    case 0x10AuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlot";
      break;
    case 0x10BuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlot";
      break;
    case 0x10CuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalExplicitRejectsForSlotNoDecay";
      break;
    case 0x10DuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForAllSlots";
      break;
    case 0x10EuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForAllSlots";
      break;
    case 0x10FuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay";
      break;
    case 0x110uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmRatio";
      break;
    case 0x111uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmRatioStdDev";
      break;
    case 0x112uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmRatioMean";
      break;
    case 0x113uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmRatioCount";
      break;
    case 0x114uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen";
      break;
    case 0x115uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastConfirmInSpotlight";
      break;
    case 0x116uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInSpotlight";
      break;
    case 0x117uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight";
      break;
    case 0x118uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLastHourInSpotlight";
      break;
    case 0x119uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight";
      break;
    case 0x11AuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight";
      break;
    case 0x11BuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotTodayInSpotlight";
      break;
    case 0x11CuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotTodayInSpotlight";
      break;
    case 0x11DuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInSpotlight";
      break;
    case 0x11EuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotInSpotlight";
      break;
    case 0x11FuLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsPartOfWeekCountInSpotlight";
      break;
    case 0x120uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsDayCountInSpotlight";
      break;
    case 0x121uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsTimeOfDayCountInSpotlight";
      break;
    case 0x122uLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight";
      break;
    case 0x123uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsInSpotlightForAllSlots";
      break;
    case 0x124uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsInSpotlightForAllSlots";
      break;
    case 0x125uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotTodayInLockscreen";
      break;
    case 0x126uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotTodayInLockscreen";
      break;
    case 0x127uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastConfirmInLockscreen";
      break;
    case 0x128uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastRejectInLockscreen";
      break;
    case 0x129uLL:
      id result = @"_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInLockscreen";
      break;
    case 0x12AuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLockscreen";
      break;
    case 0x12BuLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLockscreen";
      break;
    case 0x12CuLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsPartOfWeekCountInLockscreen";
      break;
    case 0x12DuLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsDayCountInLockscreen";
      break;
    case 0x12EuLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsTimeOfDayCountInLockscreen";
      break;
    case 0x12FuLL:
      id result = @"_ATXScoreInputSlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen";
      break;
    case 0x130uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots";
      break;
    case 0x131uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsTodayInLockscreenForAllSlots";
      break;
    case 0x132uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalConfirmsInLockscreenForAllSlots";
      break;
    case 0x133uLL:
      id result = @"_ATXScoreInputSlotFeedbackTotalRejectsInLockscreenForAllSlots";
      break;
    case 0x134uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalConfirmsInSpotlight";
      break;
    case 0x135uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalRejectsInSpotlight";
      break;
    case 0x136uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalConfirmsTodayInLockscreen";
      break;
    case 0x137uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalRejectsTodayInLockscreen";
      break;
    case 0x138uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalConfirmsInLockscreen";
      break;
    case 0x139uLL:
      id result = @"_ATXScoreInputActionFeedbackTotalRejectsInLockscreen";
      break;
    case 0x13AuLL:
      id result = @"_ATXScoreInputActionFeedbackMeanNumberOfSpotlightLaunchesPerDay";
      break;
    case 0x13BuLL:
      id result = @"_ATXScoreInputActionFeedbackMeanNumberOfSpotlightConfirmsPerDay";
      break;
    case 0x13CuLL:
      id result = @"_ATXScoreInputActionLaunchPopularity";
      break;
    case 0x13DuLL:
      id result = @"_ATXScoreInputActionTimeOfDayPopularity";
      break;
    case 0x13EuLL:
      id result = @"_ATXScoreInputActionTimeOfDayWithThirtyMinuteWindowPopularity";
      break;
    case 0x13FuLL:
      id result = @"_ATXScoreInputActionTimeOfDayWithHourWindowPopularity";
      break;
    case 0x140uLL:
      id result = @"_ATXScoreInputActionTimeOfDayWithEightHourWindowPopularity";
      break;
    case 0x141uLL:
      id result = @"_ATXScoreInputActionCoarseTimeOfDayPopularity";
      break;
    case 0x142uLL:
      id result = @"_ATXScoreInputActionDayOfWeekPopularity";
      break;
    case 0x143uLL:
      id result = @"_ATXScoreInputActionPartOfWeekPopularity";
      break;
    case 0x144uLL:
      id result = @"_ATXScoreInputActionPartOfWeekAndLocationPopularity";
      break;
    case 0x145uLL:
      id result = @"_ATXScoreInputActionLocationPopularity";
      break;
    case 0x146uLL:
      id result = @"_ATXScoreInputActionCoreMotionPopularity";
      break;
    case 0x147uLL:
      id result = @"_ATXScoreInputActionPreviousLocationPopularity";
      break;
    case 0x148uLL:
      id result = @"_ATXScoreInputActionPreviousLocationAndCoreMotionPopularity";
      break;
    case 0x149uLL:
      id result = @"_ATXScoreInputActionPreviousLocationAndLocationPopularity";
      break;
    case 0x14AuLL:
      id result = @"_ATXScoreInputActionTimeAndPreviousLocationPopularity";
      break;
    case 0x14BuLL:
      id result = @"_ATXScoreInputActionDayAndPreviousLocationPopularity";
      break;
    case 0x14CuLL:
      id result = @"_ATXScoreInputActionTimeAndDayPopularity";
      break;
    case 0x14DuLL:
      id result = @"_ATXScoreInputActionTimeAndLocationPopularity";
      break;
    case 0x14EuLL:
      id result = @"_ATXScoreInputActionDayAndLocationPopularity";
      break;
    case 0x14FuLL:
      id result = @"_ATXScoreInputActionTimeAndDayAndLocationPopularity";
      break;
    case 0x150uLL:
      id result = @"_ATXScoreInputActionPartOfWeekAndTimePopularity";
      break;
    case 0x151uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeDecay";
      break;
    case 0x152uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayOfWeekDecay";
      break;
    case 0x153uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingLocationDecay";
      break;
    case 0x154uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingCoreMotionDecay";
      break;
    case 0x155uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationDecay";
      break;
    case 0x156uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekDecay";
      break;
    case 0x157uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay";
      break;
    case 0x158uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay";
      break;
    case 0x159uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay";
      break;
    case 0x15AuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay";
      break;
    case 0x15BuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndDayDecay";
      break;
    case 0x15CuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndLocationDecay";
      break;
    case 0x15DuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayAndLocationDecay";
      break;
    case 0x15EuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay";
      break;
    case 0x15FuLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay";
      break;
    case 0x160uLL:
      id result = @"_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay";
      break;
    case 0x161uLL:
      id result = @"_ATXScoreInputRandomSessionValue";
      break;
    case 0x162uLL:
      id result = @"_ATXScoreInputRandomScore";
      break;
    case 0x163uLL:
      id result = @"_ATXScoreInputActionTotalConfirms";
      break;
    case 0x164uLL:
      id result = @"_ATXScoreInputActionTotalRejects";
      break;
    case 0x165uLL:
      id result = @"_ATXScoreInputActionTotalExplicitRejectsNoDecay";
      break;
    case 0x166uLL:
      id result = @"_ATXScoreInputAppSpecificAlpha";
      break;
    case 0x167uLL:
      id result = @"_ATXScoreInputAppSpecificBeta";
      break;
    case 0x168uLL:
      id result = @"_ATXScoreInputGlobalScoreGivenTimeDayLocationAndLastApp";
      break;
    case 0x169uLL:
      id result = @"_ATXScoreInputAppGlobalScoreGivenTimeDayAndLocation";
      break;
    case 0x16AuLL:
      id result = @"_ATXScoreInputAppLOITypeLaunches";
      break;
    case 0x16BuLL:
      id result = @"_ATXScoreInputAppLastAppLaunches";
      break;
    case 0x16CuLL:
      id result = @"_ATXScoreInputAppTimeOfDayLaunches";
      break;
    case 0x16DuLL:
      id result = @"_ATXScoreInputAppDayOfWeekLaunches";
      break;
    case 0x16EuLL:
      id result = @"_ATXScoreInputAppBlendedLOITypePopularity";
      break;
    case 0x16FuLL:
      id result = @"_ATXScoreInputAppBlendedLastAppPopularity";
      break;
    case 0x170uLL:
      id result = @"_ATXScoreInputAppBlendedTimeOfDayPopularity";
      break;
    case 0x171uLL:
      id result = @"_ATXScoreInputAppBlendedDayOfWeekPopularity";
      break;
    case 0x172uLL:
      id result = @"_ATXScoreInputAppBlendedLOITypeSampledPopularity";
      break;
    case 0x173uLL:
      id result = @"_ATXScoreInputAppBlendedLastAppSampledPopularity";
      break;
    case 0x174uLL:
      id result = @"_ATXScoreInputAppBlendedTimeOfDaySampledPopularity";
      break;
    case 0x175uLL:
      id result = @"_ATXScoreInputAppBlendedDayOfWeekSampledPopularity";
      break;
    case 0x176uLL:
      id result = @"_ATXScoreInputActionIsFutureMedia";
      break;
    case 0x177uLL:
      id result = @"_ATXScoreInputActionIsBackgroundExecutable";
      break;
    case 0x178uLL:
      id result = @"_ATXScoreInputActionMotionType";
      break;
    case 0x179uLL:
      id result = @"_ATXScoreInputActionLOIType";
      break;
    case 0x17AuLL:
      id result = @"_ATXScoreInputSlotIsSiriKitIntent";
      break;
    case 0x17BuLL:
      id result = @"_ATXScoreInputSlotIsCustomIntent";
      break;
    case 0x17CuLL:
      id result = @"_ATXScoreInputSlotIsNSUserActivity";
      break;
    case 0x17DuLL:
      id result = @"_ATXScoreInputAppActionScore";
      break;
    case 0x17EuLL:
      id result = @"_ATXScoreInputAppActionLogProbability";
      break;
    case 0x17FuLL:
      id result = @"_ATXScoreInputSlotScore";
      break;
    case 0x180uLL:
      id result = @"_ATXScoreInputSlotLogProbability";
      break;
    case 0x181uLL:
      id result = @"_ATXScoreInputActionHeuristicConfirmEvents";
      break;
    case 0x182uLL:
      id result = @"_ATXScoreInputActionHeuristicConfirmRatio";
      break;
    case 0x183uLL:
      id result = @"_ATXScoreInputTotalActionHeuristicConfirmEvents";
      break;
    case 0x184uLL:
      id result = @"_ATXScoreInputTotalActionHeuristicRejectEvents";
      break;
    case 0x185uLL:
      id result = @"_ATXScoreInputAmbientLightTypePopularity";
      break;
    case 0x186uLL:
      id result = @"_ATXScoreInputAmbientLightTypeLaunchPopularity";
      break;
    case 0x187uLL:
      id result = @"_ATXScoreInputAppIntentAmbientLightTypePopularity";
      break;
    case 0x188uLL:
      id result = @"_ATXScoreInputAppIntentAmbientLightTypeLaunchPopularity";
      break;
    case 0x189uLL:
      id result = @"_ATXScoreInputAppLaunchesCoarseTimePowLocationForAppInContext";
      break;
    case 0x18AuLL:
      id result = @"_ATXScoreInputAppLaunchesCoarseTimePowLocationInContext";
      break;
    case 0x18BuLL:
      id result = @"_ATXScoreInputAppLaunchesCoarseTimePowLocationForApp";
      break;
    case 0x18CuLL:
      id result = @"_ATXScoreInputAppLaunchesCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x18DuLL:
      id result = @"_ATXScoreInputAppConfirmsCoarseTimePowLocationForAppInContext";
      break;
    case 0x18EuLL:
      id result = @"_ATXScoreInputAppConfirmsCoarseTimePowLocationInContext";
      break;
    case 0x18FuLL:
      id result = @"_ATXScoreInputAppConfirmsCoarseTimePowLocationForApp";
      break;
    case 0x190uLL:
      id result = @"_ATXScoreInputAppConfirmsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x191uLL:
      id result = @"_ATXScoreInputAppRejectsCoarseTimePowLocationForAppInContext";
      break;
    case 0x192uLL:
      id result = @"_ATXScoreInputAppRejectsCoarseTimePowLocationInContext";
      break;
    case 0x193uLL:
      id result = @"_ATXScoreInputAppRejectsCoarseTimePowLocationForApp";
      break;
    case 0x194uLL:
      id result = @"_ATXScoreInputAppRejectsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x195uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAppInContext";
      break;
    case 0x196uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationInContext";
      break;
    case 0x197uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForApp";
      break;
    case 0x198uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x199uLL:
      id result = @"_ATXScoreInputAppLaunchesSpecificTimeDowLocationForAppInContext";
      break;
    case 0x19AuLL:
      id result = @"_ATXScoreInputAppLaunchesSpecificTimeDowLocationInContext";
      break;
    case 0x19BuLL:
      id result = @"_ATXScoreInputAppLaunchesSpecificTimeDowLocationForApp";
      break;
    case 0x19CuLL:
      id result = @"_ATXScoreInputAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x19DuLL:
      id result = @"_ATXScoreInputAppConfirmsSpecificTimeDowLocationForAppInContext";
      break;
    case 0x19EuLL:
      id result = @"_ATXScoreInputAppConfirmsSpecificTimeDowLocationInContext";
      break;
    case 0x19FuLL:
      id result = @"_ATXScoreInputAppConfirmsSpecificTimeDowLocationForApp";
      break;
    case 0x1A0uLL:
      id result = @"_ATXScoreInputAppConfirmsSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x1A1uLL:
      id result = @"_ATXScoreInputAppRejectsSpecificTimeDowLocationForAppInContext";
      break;
    case 0x1A2uLL:
      id result = @"_ATXScoreInputAppRejectsSpecificTimeDowLocationInContext";
      break;
    case 0x1A3uLL:
      id result = @"_ATXScoreInputAppRejectsSpecificTimeDowLocationForApp";
      break;
    case 0x1A4uLL:
      id result = @"_ATXScoreInputAppRejectsSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x1A5uLL:
      id result = @"_ATXScoreInputActionsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1A6uLL:
      id result = @"_ATXScoreInputActionsCoarseTimePowLocationInContext";
      break;
    case 0x1A7uLL:
      id result = @"_ATXScoreInputActionsCoarseTimePowLocationForAction";
      break;
    case 0x1A8uLL:
      id result = @"_ATXScoreInputActionsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1A9uLL:
      id result = @"_ATXScoreInputActionConfirmsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1AAuLL:
      id result = @"_ATXScoreInputActionConfirmsCoarseTimePowLocationInContext";
      break;
    case 0x1ABuLL:
      id result = @"_ATXScoreInputActionConfirmsCoarseTimePowLocationForAction";
      break;
    case 0x1ACuLL:
      id result = @"_ATXScoreInputActionConfirmsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1ADuLL:
      id result = @"_ATXScoreInputActionRejectsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1AEuLL:
      id result = @"_ATXScoreInputActionRejectsCoarseTimePowLocationInContext";
      break;
    case 0x1AFuLL:
      id result = @"_ATXScoreInputActionRejectsCoarseTimePowLocationForAction";
      break;
    case 0x1B0uLL:
      id result = @"_ATXScoreInputActionRejectsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1B1uLL:
      id result = @"_ATXScoreInputActionsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1B2uLL:
      id result = @"_ATXScoreInputActionsSpecificTimeDowLocationInContext";
      break;
    case 0x1B3uLL:
      id result = @"_ATXScoreInputActionsSpecificTimeDowLocationForAction";
      break;
    case 0x1B4uLL:
      id result = @"_ATXScoreInputActionsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1B5uLL:
      id result = @"_ATXScoreInputActionConfirmsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1B6uLL:
      id result = @"_ATXScoreInputActionConfirmsSpecificTimeDowLocationInContext";
      break;
    case 0x1B7uLL:
      id result = @"_ATXScoreInputActionConfirmsSpecificTimeDowLocationForAction";
      break;
    case 0x1B8uLL:
      id result = @"_ATXScoreInputActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1B9uLL:
      id result = @"_ATXScoreInputActionRejectsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1BAuLL:
      id result = @"_ATXScoreInputActionRejectsSpecificTimeDowLocationInContext";
      break;
    case 0x1BBuLL:
      id result = @"_ATXScoreInputActionRejectsSpecificTimeDowLocationForAction";
      break;
    case 0x1BCuLL:
      id result = @"_ATXScoreInputActionRejectsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1BDuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket0ForApp";
      break;
    case 0x1BEuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket1ForApp";
      break;
    case 0x1BFuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket2ForApp";
      break;
    case 0x1C0uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket3ForApp";
      break;
    case 0x1C1uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket4ForApp";
      break;
    case 0x1C2uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket5ForApp";
      break;
    case 0x1C3uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket6ForApp";
      break;
    case 0x1C4uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket7ForApp";
      break;
    case 0x1C5uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket8ForApp";
      break;
    case 0x1C6uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket9ForApp";
      break;
    case 0x1C7uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket10ForApp";
      break;
    case 0x1C8uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket11ForApp";
      break;
    case 0x1C9uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket12ForApp";
      break;
    case 0x1CAuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket13ForApp";
      break;
    case 0x1CBuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket14ForApp";
      break;
    case 0x1CCuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket15ForApp";
      break;
    case 0x1CDuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket16ForApp";
      break;
    case 0x1CEuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket17ForApp";
      break;
    case 0x1CFuLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket18ForApp";
      break;
    case 0x1D0uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket19ForApp";
      break;
    case 0x1D1uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket20ForApp";
      break;
    case 0x1D2uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket21ForApp";
      break;
    case 0x1D3uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket22ForApp";
      break;
    case 0x1D4uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket23ForApp";
      break;
    case 0x1D5uLL:
      id result = @"_ATXScoreInputAppLaunchesInTimeBucket24ForApp";
      break;
    case 0x1D6uLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekSundayForApp";
      break;
    case 0x1D7uLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekMondayForApp";
      break;
    case 0x1D8uLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekTuesdayForApp";
      break;
    case 0x1D9uLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekWednesdayForApp";
      break;
    case 0x1DAuLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekThursdayForApp";
      break;
    case 0x1DBuLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekFridayForApp";
      break;
    case 0x1DCuLL:
      id result = @"_ATXScoreInputAppLaunchesOnDayOfWeekSaturdayForApp";
      break;
    case 0x1DDuLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash0ForApp";
      break;
    case 0x1DEuLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash1ForApp";
      break;
    case 0x1DFuLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash2ForApp";
      break;
    case 0x1E0uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash3ForApp";
      break;
    case 0x1E1uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash4ForApp";
      break;
    case 0x1E2uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash5ForApp";
      break;
    case 0x1E3uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash6ForApp";
      break;
    case 0x1E4uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash7ForApp";
      break;
    case 0x1E5uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash8ForApp";
      break;
    case 0x1E6uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHash9ForApp";
      break;
    case 0x1E7uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash0ForApp";
      break;
    case 0x1E8uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash1ForApp";
      break;
    case 0x1E9uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash2ForApp";
      break;
    case 0x1EAuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash3ForApp";
      break;
    case 0x1EBuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash4ForApp";
      break;
    case 0x1ECuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash5ForApp";
      break;
    case 0x1EDuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash6ForApp";
      break;
    case 0x1EEuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash7ForApp";
      break;
    case 0x1EFuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash8ForApp";
      break;
    case 0x1F0uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash9ForApp";
      break;
    case 0x1F1uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash10ForApp";
      break;
    case 0x1F2uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash11ForApp";
      break;
    case 0x1F3uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash12ForApp";
      break;
    case 0x1F4uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash13ForApp";
      break;
    case 0x1F5uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHash14ForApp";
      break;
    case 0x1F6uLL:
      id result = @"_ATXScoreInputAppNumberOfSpecificGeohashesForApp";
      break;
    case 0x1F7uLL:
      id result = @"_ATXScoreInputAppNumberOfCoarseGeohashesForApp";
      break;
    case 0x1F8uLL:
      id result = @"_ATXScoreInputAppEntropyForTimeBuckets";
      break;
    case 0x1F9uLL:
      id result = @"_ATXScoreInputAppEntropyForSpecificGeoHash";
      break;
    case 0x1FAuLL:
      id result = @"_ATXScoreInputAppEntropyForCoarseGeoHash";
      break;
    case 0x1FBuLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHashForAppInContext";
      break;
    case 0x1FCuLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHashForAppInContext";
      break;
    case 0x1FDuLL:
      id result = @"_ATXScoreInputAppLaunchesAtDayOfWeekInContext";
      break;
    case 0x1FEuLL:
      id result = @"_ATXScoreInputAppLaunchesAtDayOfWeekForApp";
      break;
    case 0x1FFuLL:
      id result = @"_ATXScoreInputAppLaunchesAtTimeAndDayForAppInContext";
      break;
    case 0x200uLL:
      id result = @"_ATXScoreInputAppLaunchesAtTimeAndDayInContext";
      break;
    case 0x201uLL:
      id result = @"_ATXScoreInputAppLaunchesAtTimeAndDayForApp";
      break;
    case 0x202uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHashInContext";
      break;
    case 0x203uLL:
      id result = @"_ATXScoreInputAppLaunchesAtCoarseGeoHashForApp";
      break;
    case 0x204uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHashInContext";
      break;
    case 0x205uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSpecificGeoHashForApp";
      break;
    case 0x206uLL:
      id result = @"_ATXScoreInputAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x207uLL:
      id result = @"_ATXScoreInputAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x208uLL:
      id result = @"_ATXScoreInputIsLocationServicesDisabled";
      break;
    case 0x209uLL:
      id result = @"_ATXScoreInputAppLaunchesInTwoHourTimeBucketForAppInContext";
      break;
    case 0x20AuLL:
      id result = @"_ATXScoreInputAppLaunchesInTwoHourTimeBucketInContext";
      break;
    case 0x20BuLL:
      id result = @"_ATXScoreInputAppLaunchesInTwoHourTimeBucketForApp";
      break;
    case 0x20CuLL:
      id result = @"_ATXScoreInputAppConfirmsInTwoHourTimeBucketForAppInContext";
      break;
    case 0x20DuLL:
      id result = @"_ATXScoreInputAppConfirmsInTwoHourTimeBucketInContext";
      break;
    case 0x20EuLL:
      id result = @"_ATXScoreInputAppConfirmsInTwoHourTimeBucketForApp";
      break;
    case 0x20FuLL:
      id result = @"_ATXScoreInputAppRejectsInTwoHourTimeBucketForAppInContext";
      break;
    case 0x210uLL:
      id result = @"_ATXScoreInputAppRejectsInTwoHourTimeBucketInContext";
      break;
    case 0x211uLL:
      id result = @"_ATXScoreInputAppRejectsInTwoHourTimeBucketForApp";
      break;
    case 0x212uLL:
      id result = @"_ATXScoreInputAppConfirmsAtDayOfWeekForAppInContext";
      break;
    case 0x213uLL:
      id result = @"_ATXScoreInputAppConfirmsAtDayOfWeekInContext";
      break;
    case 0x214uLL:
      id result = @"_ATXScoreInputAppConfirmsAtDayOfWeekForApp";
      break;
    case 0x215uLL:
      id result = @"_ATXScoreInputAppRejectsAtDayOfWeekForAppInContext";
      break;
    case 0x216uLL:
      id result = @"_ATXScoreInputAppRejectsAtDayOfWeekInContext";
      break;
    case 0x217uLL:
      id result = @"_ATXScoreInputAppRejectsAtDayOfWeekForApp";
      break;
    case 0x218uLL:
      id result = @"_ATXScoreInputAppConfirmsAtCoarseGeoHashForAppInContext";
      break;
    case 0x219uLL:
      id result = @"_ATXScoreInputAppConfirmsAtCoarseGeoHashInContext";
      break;
    case 0x21AuLL:
      id result = @"_ATXScoreInputAppConfirmsAtCoarseGeoHashForApp";
      break;
    case 0x21BuLL:
      id result = @"_ATXScoreInputAppRejectsAtCoarseGeoHashForAppInContext";
      break;
    case 0x21CuLL:
      id result = @"_ATXScoreInputAppRejectsAtCoarseGeoHashInContext";
      break;
    case 0x21DuLL:
      id result = @"_ATXScoreInputAppRejectsAtCoarseGeoHashForApp";
      break;
    case 0x21EuLL:
      id result = @"_ATXScoreInputAppConfirmsAtSpecificGeoHashForAppInContext";
      break;
    case 0x21FuLL:
      id result = @"_ATXScoreInputAppConfirmsAtSpecificGeoHashInContext";
      break;
    case 0x220uLL:
      id result = @"_ATXScoreInputAppConfirmsAtSpecificGeoHashForApp";
      break;
    case 0x221uLL:
      id result = @"_ATXScoreInputAppRejectsAtSpecificGeoHashForAppInContext";
      break;
    case 0x222uLL:
      id result = @"_ATXScoreInputAppRejectsAtSpecificGeoHashInContext";
      break;
    case 0x223uLL:
      id result = @"_ATXScoreInputAppRejectsAtSpecificGeoHashForApp";
      break;
    case 0x224uLL:
      id result = @"_ATXScoreInputAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x225uLL:
      id result = @"_ATXScoreInputAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x226uLL:
      id result = @"_ATXScoreInputAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x227uLL:
      id result = @"_ATXScoreInputAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x228uLL:
      id result = @"_ATXScoreInputCurrentTimeBucketFromZeroToTwentyFour";
      break;
    case 0x229uLL:
      id result = @"_ATXScoreInputActionsAtDayOfWeekForActionInContext";
      break;
    case 0x22AuLL:
      id result = @"_ATXScoreInputActionsAtDayOfWeekInContext";
      break;
    case 0x22BuLL:
      id result = @"_ATXScoreInputActionsAtDayOfWeekForAction";
      break;
    case 0x22CuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHashForActionInContext";
      break;
    case 0x22DuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHashInContext";
      break;
    case 0x22EuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHashForAction";
      break;
    case 0x22FuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHashForActionInContext";
      break;
    case 0x230uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHashInContext";
      break;
    case 0x231uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHashForAction";
      break;
    case 0x232uLL:
      id result = @"_ATXScoreInputActionsAtTimeOfDayForActionInContext";
      break;
    case 0x233uLL:
      id result = @"_ATXScoreInputActionsAtTimeOfDayInContext";
      break;
    case 0x234uLL:
      id result = @"_ATXScoreInputActionsAtTimeOfDayForAction";
      break;
    case 0x235uLL:
      id result = @"_ATXScoreInputActionConfirmsAtTimeOfDayForActionInContext";
      break;
    case 0x236uLL:
      id result = @"_ATXScoreInputActionConfirmsAtTimeOfDayInContext";
      break;
    case 0x237uLL:
      id result = @"_ATXScoreInputActionConfirmsAtTimeOfDayForAction";
      break;
    case 0x238uLL:
      id result = @"_ATXScoreInputActionRejectsAtTimeOfDayForActionInContext";
      break;
    case 0x239uLL:
      id result = @"_ATXScoreInputActionRejectsAtTimeOfDayInContext";
      break;
    case 0x23AuLL:
      id result = @"_ATXScoreInputActionRejectsAtTimeOfDayForAction";
      break;
    case 0x23BuLL:
      id result = @"_ATXScoreInputActionConfirmsAtDayOfWeekForActionInContext";
      break;
    case 0x23CuLL:
      id result = @"_ATXScoreInputActionConfirmsAtDayOfWeekInContext";
      break;
    case 0x23DuLL:
      id result = @"_ATXScoreInputActionConfirmsAtDayOfWeekForAction";
      break;
    case 0x23EuLL:
      id result = @"_ATXScoreInputActionRejectsAtDayOfWeekForActionInContext";
      break;
    case 0x23FuLL:
      id result = @"_ATXScoreInputActionRejectsAtDayOfWeekInContext";
      break;
    case 0x240uLL:
      id result = @"_ATXScoreInputActionRejectsAtDayOfWeekForAction";
      break;
    case 0x241uLL:
      id result = @"_ATXScoreInputActionConfirmsAtCoarseGeoHashForActionInContext";
      break;
    case 0x242uLL:
      id result = @"_ATXScoreInputActionConfirmsAtCoarseGeoHashInContext";
      break;
    case 0x243uLL:
      id result = @"_ATXScoreInputActionConfirmsAtCoarseGeoHashForAction";
      break;
    case 0x244uLL:
      id result = @"_ATXScoreInputActionRejectsAtCoarseGeoHashForActionInContext";
      break;
    case 0x245uLL:
      id result = @"_ATXScoreInputActionRejectsAtCoarseGeoHashInContext";
      break;
    case 0x246uLL:
      id result = @"_ATXScoreInputActionRejectsAtCoarseGeoHashForAction";
      break;
    case 0x247uLL:
      id result = @"_ATXScoreInputActionConfirmsAtSpecificGeoHashForActionInContext";
      break;
    case 0x248uLL:
      id result = @"_ATXScoreInputActionConfirmsAtSpecificGeoHashInContext";
      break;
    case 0x249uLL:
      id result = @"_ATXScoreInputActionConfirmsAtSpecificGeoHashForAction";
      break;
    case 0x24AuLL:
      id result = @"_ATXScoreInputActionRejectsAtSpecificGeoHashForActionInContext";
      break;
    case 0x24BuLL:
      id result = @"_ATXScoreInputActionRejectsAtSpecificGeoHashInContext";
      break;
    case 0x24CuLL:
      id result = @"_ATXScoreInputActionRejectsAtSpecificGeoHashForAction";
      break;
    case 0x24DuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket0ForAction";
      break;
    case 0x24EuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket1ForAction";
      break;
    case 0x24FuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket2ForAction";
      break;
    case 0x250uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket3ForAction";
      break;
    case 0x251uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket4ForAction";
      break;
    case 0x252uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket5ForAction";
      break;
    case 0x253uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket6ForAction";
      break;
    case 0x254uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket7ForAction";
      break;
    case 0x255uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket8ForAction";
      break;
    case 0x256uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket9ForAction";
      break;
    case 0x257uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket10ForAction";
      break;
    case 0x258uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket11ForAction";
      break;
    case 0x259uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket12ForAction";
      break;
    case 0x25AuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket13ForAction";
      break;
    case 0x25BuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket14ForAction";
      break;
    case 0x25CuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket15ForAction";
      break;
    case 0x25DuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket16ForAction";
      break;
    case 0x25EuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket17ForAction";
      break;
    case 0x25FuLL:
      id result = @"_ATXScoreInputActionsInTimeBucket18ForAction";
      break;
    case 0x260uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket19ForAction";
      break;
    case 0x261uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket20ForAction";
      break;
    case 0x262uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket21ForAction";
      break;
    case 0x263uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket22ForAction";
      break;
    case 0x264uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket23ForAction";
      break;
    case 0x265uLL:
      id result = @"_ATXScoreInputActionsInTimeBucket24ForAction";
      break;
    case 0x266uLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekSundayForAction";
      break;
    case 0x267uLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekMondayForAction";
      break;
    case 0x268uLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekTuesdayForAction";
      break;
    case 0x269uLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekWednesdayForAction";
      break;
    case 0x26AuLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekThursdayForAction";
      break;
    case 0x26BuLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekFridayForAction";
      break;
    case 0x26CuLL:
      id result = @"_ATXScoreInputActionsOnDayOfWeekSaturdayForAction";
      break;
    case 0x26DuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash0ForAction";
      break;
    case 0x26EuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash1ForAction";
      break;
    case 0x26FuLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash2ForAction";
      break;
    case 0x270uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash3ForAction";
      break;
    case 0x271uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash4ForAction";
      break;
    case 0x272uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash5ForAction";
      break;
    case 0x273uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash6ForAction";
      break;
    case 0x274uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash7ForAction";
      break;
    case 0x275uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash8ForAction";
      break;
    case 0x276uLL:
      id result = @"_ATXScoreInputActionsAtCoarseGeoHash9ForAction";
      break;
    case 0x277uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash0ForAction";
      break;
    case 0x278uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash1ForAction";
      break;
    case 0x279uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash2ForAction";
      break;
    case 0x27AuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash3ForAction";
      break;
    case 0x27BuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash4ForAction";
      break;
    case 0x27CuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash5ForAction";
      break;
    case 0x27DuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash6ForAction";
      break;
    case 0x27EuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash7ForAction";
      break;
    case 0x27FuLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash8ForAction";
      break;
    case 0x280uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash9ForAction";
      break;
    case 0x281uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash10ForAction";
      break;
    case 0x282uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash11ForAction";
      break;
    case 0x283uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash12ForAction";
      break;
    case 0x284uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash13ForAction";
      break;
    case 0x285uLL:
      id result = @"_ATXScoreInputActionsAtSpecificGeoHash14ForAction";
      break;
    case 0x286uLL:
      id result = @"_ATXScoreInputActionEntropyForTimeOfDay";
      break;
    case 0x287uLL:
      id result = @"_ATXScoreInputActionEntropyForDayOfWeek";
      break;
    case 0x288uLL:
      id result = @"_ATXScoreInputActionEntropyForCoarseGeoHash";
      break;
    case 0x289uLL:
      id result = @"_ATXScoreInputActionEntropyForSpecificGeoHash";
      break;
    case 0x28AuLL:
      id result = @"_ATXScoreInputActionNumberOfSpecificGeohashesForAction";
      break;
    case 0x28BuLL:
      id result = @"_ATXScoreInputActionNumberOfCoarseGeohashesForAction";
      break;
    case 0x28CuLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHashForAppInContext";
      break;
    case 0x28DuLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHashInContext";
      break;
    case 0x28EuLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHashForApp";
      break;
    case 0x28FuLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash0ForApp";
      break;
    case 0x290uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash1ForApp";
      break;
    case 0x291uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash2ForApp";
      break;
    case 0x292uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash3ForApp";
      break;
    case 0x293uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash4ForApp";
      break;
    case 0x294uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash5ForApp";
      break;
    case 0x295uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash6ForApp";
      break;
    case 0x296uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash7ForApp";
      break;
    case 0x297uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash8ForApp";
      break;
    case 0x298uLL:
      id result = @"_ATXScoreInputAppLaunchesAtZoom7GeoHash9ForApp";
      break;
    case 0x299uLL:
      id result = @"_ATXScoreInputAppEntropyForZoom7GeoHash";
      break;
    case 0x29AuLL:
      id result = @"_ATXScoreInputAppNumberOfZoom7GeohashesForApp";
      break;
    case 0x29BuLL:
      id result = @"_ATXScoreInputAppGeoAssociationScoreAtZoom7";
      break;
    case 0x29CuLL:
      id result = @"_ATXScoreInputAppGeoAssociationScoreAtZoom13";
      break;
    case 0x29DuLL:
      id result = @"_ATXScoreInputAppGeoAssociationScoreAtZoom16";
      break;
    case 0x29EuLL:
      id result = @"_ATXScoreInputAppPartOfWeekAssociationScore";
      break;
    case 0x29FuLL:
      id result = @"_ATXScoreInputAppCoarseTimeAssociationScore";
      break;
    case 0x2A0uLL:
      id result = @"_ATXScoreInputAppLOITypeAssociationScore";
      break;
    case 0x2A1uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSSIDForAppInContext";
      break;
    case 0x2A2uLL:
      id result = @"_ATXScoreInputAppLaunchesAtSSIDForApp";
      break;
    case 0x2A3uLL:
      id result = @"_ATXScoreInputAppLaunchesForCoreMotionForAppInContext";
      break;
    case 0x2A4uLL:
      id result = @"_ATXScoreInputAppLaunchesInAirplaneModeForAppInContext";
      break;
    case 0x2A5uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekForAppInContext";
      break;
    case 0x2A6uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekInContext";
      break;
    case 0x2A7uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekForApp";
      break;
    case 0x2A8uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekForAppInContext";
      break;
    case 0x2A9uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekInContext";
      break;
    case 0x2AAuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekForApp";
      break;
    case 0x2ABuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2ACuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalInContext";
      break;
    case 0x2ADuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalForApp";
      break;
    case 0x2AEuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2AFuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalInContext";
      break;
    case 0x2B0uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalForApp";
      break;
    case 0x2B1uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashForAppInContext";
      break;
    case 0x2B2uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashInContext";
      break;
    case 0x2B3uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashForApp";
      break;
    case 0x2B4uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashForAppInContext";
      break;
    case 0x2B5uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashInContext";
      break;
    case 0x2B6uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashForApp";
      break;
    case 0x2B7uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashForAppInContext";
      break;
    case 0x2B8uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashInContext";
      break;
    case 0x2B9uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashForApp";
      break;
    case 0x2BAuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashForAppInContext";
      break;
    case 0x2BBuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashInContext";
      break;
    case 0x2BCuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashForApp";
      break;
    case 0x2BDuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2BEuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2BFuLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C0uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2C1uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2C2uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C3uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2C4uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2C5uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C6uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2C7uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2C8uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2C9uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2CAuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2CBuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2CCuLL:
      id result = @"_ATXScoreInputHomeScreenTotalLaunchesForApp";
      break;
    case 0x2CDuLL:
      id result = @"_ATXScoreInputHomeScreenTotalLaunchesForAllApps";
      break;
    case 0x2CEuLL:
      id result = @"_ATXScoreInputAppDirectoryTotalLaunchesForApp";
      break;
    case 0x2CFuLL:
      id result = @"_ATXScoreInputAppDirectoryTotalLaunchesForAllApps";
      break;
    case 0x2D0uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekForAppInContext";
      break;
    case 0x2D1uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekInContext";
      break;
    case 0x2D2uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekForApp";
      break;
    case 0x2D3uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsOnDayOfWeekForAppInContext";
      break;
    case 0x2D4uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsOnDayOfWeekInContext";
      break;
    case 0x2D5uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsOnDayOfWeekForApp";
      break;
    case 0x2D6uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2D7uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalInContext";
      break;
    case 0x2D8uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalForApp";
      break;
    case 0x2D9uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2DAuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalInContext";
      break;
    case 0x2DBuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalForApp";
      break;
    case 0x2DCuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashForAppInContext";
      break;
    case 0x2DDuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashInContext";
      break;
    case 0x2DEuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashForApp";
      break;
    case 0x2DFuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashForAppInContext";
      break;
    case 0x2E0uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashInContext";
      break;
    case 0x2E1uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashForApp";
      break;
    case 0x2E2uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashForAppInContext";
      break;
    case 0x2E3uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashInContext";
      break;
    case 0x2E4uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashForApp";
      break;
    case 0x2E5uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashForAppInContext";
      break;
    case 0x2E6uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashInContext";
      break;
    case 0x2E7uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashForApp";
      break;
    case 0x2E8uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2E9uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2EAuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2EBuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2ECuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2EDuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2EEuLL:
      id result = @"_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2EFuLL:
      id result = @"_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2F0uLL:
      id result = @"_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2F1uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2F2uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2F3uLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2F4uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2F5uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2F6uLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2F7uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2F8uLL:
      id result = @"_ATXScoreInputHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2F9uLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FAuLL:
      id result = @"_ATXScoreInputHomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2FBuLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FCuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FDuLL:
      id result = @"_ATXScoreInputAppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2FEuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FFuLL:
      id result = @"_ATXScoreInputAppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x300uLL:
      id result = @"_ATXScoreInputAppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x301uLL:
      id result = @"_ATXScoreInputIsAppClip";
      break;
    case 0x302uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekForActionInContext";
      break;
    case 0x303uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekInContext";
      break;
    case 0x304uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekForAction";
      break;
    case 0x305uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayForActionInContext";
      break;
    case 0x306uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayInContext";
      break;
    case 0x307uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayForAction";
      break;
    case 0x308uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashForActionInContext";
      break;
    case 0x309uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashInContext";
      break;
    case 0x30AuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashForAction";
      break;
    case 0x30BuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashForActionInContext";
      break;
    case 0x30CuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashInContext";
      break;
    case 0x30DuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashForAction";
      break;
    case 0x30EuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext";
      break;
    case 0x30FuLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x310uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationForAction";
      break;
    case 0x311uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext";
      break;
    case 0x312uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x313uLL:
      id result = @"_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction";
      break;
    case 0x314uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekForActionInContext";
      break;
    case 0x315uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekInContext";
      break;
    case 0x316uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekForAction";
      break;
    case 0x317uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayForActionInContext";
      break;
    case 0x318uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayInContext";
      break;
    case 0x319uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayForAction";
      break;
    case 0x31AuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashForActionInContext";
      break;
    case 0x31BuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashInContext";
      break;
    case 0x31CuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashForAction";
      break;
    case 0x31DuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashForActionInContext";
      break;
    case 0x31EuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashInContext";
      break;
    case 0x31FuLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashForAction";
      break;
    case 0x320uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext";
      break;
    case 0x321uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x322uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationForAction";
      break;
    case 0x323uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext";
      break;
    case 0x324uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x325uLL:
      id result = @"_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationForAction";
      break;
    case 0x326uLL:
      id result = @"_ATXScoreInputPOIPopularityForAppInContext";
      break;
    case 0x327uLL:
      id result = @"_ATXScoreInputAppLaunchPopularityAtPOIForAppInContext";
      break;
    case 0x328uLL:
      id result = @"_ATXScoreInputPOICategory";
      break;
    case 0x329uLL:
      id result = @"_ATXScoreInputAppLaunchesAtPOIForAppInContext";
      break;
    case 0x32AuLL:
      id result = @"_ATXScoreInputAppCategoryScore";
      break;
    case 0x32BuLL:
      id result = @"_ATXScoreInputPosteriorProbabilityOfAppGivenMode";
      break;
    case 0x32CuLL:
      id result = @"_ATXScoreInputClassConditionalProbabilityOfModeGivenApp";
      break;
    case 0x32DuLL:
      id result = @"_ATXScoreInputUniqueOccurrencesOfAppInMode";
      break;
    case 0x32EuLL:
      id result = @"_ATXScoreInputLocalOccurrencesOfAppInMode";
      break;
    case 0x32FuLL:
      id result = @"_ATXScoreInputGlobalOccurrencesOfAppInMode";
      break;
    case 0x330uLL:
      id result = @"_ATXScoreInputAppModeEntityScore";
      break;
    case 0x331uLL:
      id result = @"_ATXScoreInputMax";
      break;
    default:
      if (a3 != 0xFFFFFFFF) {
        +[_ATXScoreTypes stringForScoreInput:]((uint64_t)a2, @"_ATXScoreInputAppInFolder");
      }
      id result = @"<Undefined Score Input>";
      break;
  }
  return result;
}

+ (unint64_t)scoreInputForString:(id)a3
{
  id v3 = a3;
  if (scoreInputForString__onceToken != -1) {
    dispatch_once(&scoreInputForString__onceToken, &__block_literal_global_4);
  }
  v4 = [(id)scoreInputForString__scoreInputMap objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 integerValue];
  }
  else {
    unint64_t v6 = 0xFFFFFFFFLL;
  }

  return v6;
}

+ (id)aggdStringForScoreInput:(unint64_t)a3
{
  id result = @"AppInFolder";
  switch(a3)
  {
    case 0uLL:
      id result = @"InstallAge";
      break;
    case 1uLL:
      id result = @"LastSpotlightLaunchAge";
      break;
    case 2uLL:
      id result = @"LastLaunchAge";
      break;
    case 3uLL:
      id result = @"MedianSecondsBetweenLaunches";
      break;
    case 4uLL:
      id result = @"AverageSecondsBetweenLaunches";
      break;
    case 5uLL:
      id result = @"UnlockTime";
      break;
    case 6uLL:
      return result;
    case 7uLL:
      id result = @"FolderPage";
      break;
    case 8uLL:
      id result = @"HasSpringBoardPage";
      break;
    case 9uLL:
      id result = @"SpringBoardPage";
      break;
    case 0xAuLL:
      id result = @"OnSpringBoardDock";
      break;
    case 0xBuLL:
      id result = @"Feedback";
      break;
    case 0xCuLL:
      id result = @"FeedbackConfirms";
      break;
    case 0xDuLL:
      id result = @"FeedbackRejects";
      break;
    case 0xEuLL:
      id result = @"APRExplicitConfirmRatio";
      break;
    case 0xFuLL:
      id result = @"APRExplicitRejectRatio";
      break;
    case 0x10uLL:
      id result = @"APRImplicitConfirmRatio";
      break;
    case 0x11uLL:
      id result = @"APRImplicitRejectRatio";
      break;
    case 0x12uLL:
      id result = @"APRSiriKitIntentsRatio";
      break;
    case 0x13uLL:
      id result = @"APRNonSiriKitIntentsRatio";
      break;
    case 0x14uLL:
      id result = @"APRTotalExplicitConfirms";
      break;
    case 0x15uLL:
      id result = @"APRTotalExplicitRejects";
      break;
    case 0x16uLL:
      id result = @"APRTotalImplicitConfirms";
      break;
    case 0x17uLL:
      id result = @"APRTotalImplicitRejects";
      break;
    case 0x18uLL:
      id result = @"ScoreInputAPRTotalSiriKitIntents";
      break;
    case 0x19uLL:
      id result = @"ScoreInputAPRTotalNonSiriKitIntents";
      break;
    case 0x1AuLL:
      id result = @"LaunchTimePopularity";
      break;
    case 0x1BuLL:
      id result = @"TimeOfDayPopularity";
      break;
    case 0x1CuLL:
      id result = @"CoarseTimeOfDayPopularity";
      break;
    case 0x1DuLL:
      id result = @"LaunchPopularity";
      break;
    case 0x1EuLL:
      id result = @"SpotlightLaunchTimePopularity";
      break;
    case 0x1FuLL:
      id result = @"SpotlightTimeOfDayPopularity";
      break;
    case 0x20uLL:
      id result = @"SpotlightLaunchPopularity";
      break;
    case 0x21uLL:
      id result = @"DayZeroPoints";
      break;
    case 0x22uLL:
      id result = @"StaticAppPoints";
      break;
    case 0x23uLL:
      id result = @"LaunchDayOfWeekPopularity";
      break;
    case 0x24uLL:
      id result = @"DayOfWeekPopularity";
      break;
    case 0x25uLL:
      id result = @"LaunchSequencePopularity";
      break;
    case 0x26uLL:
      id result = @"LaunchLocationPopularity";
      break;
    case 0x27uLL:
      id result = @"AppLaunchMicroLocationPopularity";
      break;
    case 0x28uLL:
      id result = @"EntropyLaunchPopularity";
      break;
    case 0x29uLL:
      id result = @"EntropyDayOfWeekPopularity";
      break;
    case 0x2AuLL:
      id result = @"EntropyDayOfWeekPopularityByDay";
      break;
    case 0x2BuLL:
      id result = @"EntropyDayOfWeekPopularityByApp";
      break;
    case 0x2CuLL:
      id result = @"DistanceDayOfWeekToLaunchPopularity";
      break;
    case 0x2DuLL:
      id result = @"EntropyTrendingPopularity";
      break;
    case 0x2EuLL:
      id result = @"DistanceTrendingToLaunchPopularity";
      break;
    case 0x2FuLL:
      id result = @"EntropySSIDPopularity";
      break;
    case 0x30uLL:
      id result = @"EntropySSIDPopularityBySSID";
      break;
    case 0x31uLL:
      id result = @"EntropySSIDPopularityByApp";
      break;
    case 0x32uLL:
      id result = @"DistanceSSIDToLaunchPopularity";
      break;
    case 0x33uLL:
      id result = @"AppCount";
      break;
    case 0x34uLL:
      id result = @"DistanceToExplicitLaunchPrediction";
      break;
    case 0x35uLL:
      id result = @"SiriKitIntentParzen";
      break;
    case 0x36uLL:
      id result = @"NonSiriKitIntentParzen";
      break;
    case 0x37uLL:
      id result = @"AppDailyDose";
      break;
    case 0x38uLL:
      id result = @"AppCurrentDose";
      break;
    case 0x39uLL:
      id result = @"AppDailyDoseRemaining";
      break;
    case 0x3AuLL:
      id result = @"AppDailyDoseSmoothedError";
      break;
    case 0x3BuLL:
      id result = @"TotalAppNumberOfLaunches";
      break;
    case 0x3CuLL:
      id result = @"TotalAppNumberOfSpotlightLaunches";
      break;
    case 0x3DuLL:
      id result = @"AirplaneModePopularity";
      break;
    case 0x3EuLL:
      id result = @"TotalNumberOfAirplaneModeAppLaunches";
      break;
    case 0x3FuLL:
      id result = @"TrendingPopularity";
      break;
    case 0x40uLL:
      id result = @"TotalNumberOfTrendingAppLaunches";
      break;
    case 0x41uLL:
      id result = @"SSIDPopularity";
      break;
    case 0x42uLL:
      id result = @"TotalNumberOfSSIDAppLaunches";
      break;
    case 0x43uLL:
      id result = @"OnWifi";
      break;
    case 0x44uLL:
      id result = @"CoreMotionPopularity";
      break;
    case 0x45uLL:
      id result = @"TotalNumberOfCoreMotionLaunches";
      break;
    case 0x46uLL:
      id result = @"MagicalMomentsConfidence";
      break;
    case 0x47uLL:
      id result = @"MagicalMomentsPredictionReason";
      break;
    case 0x48uLL:
      id result = @"MagicalMomentsAnchor";
      break;
    case 0x49uLL:
      id result = @"HeroAppConfidence";
      break;
    case 0x4AuLL:
      id result = @"HeroAppPredictionReason";
      break;
    case 0x4BuLL:
      id result = @"MagicalMomentsHeroAppPredictionIndex";
      break;
    case 0x4CuLL:
      id result = @"MagicalMomentsHeroAppPredictionTotalPredictions";
      break;
    case 0x4DuLL:
      id result = @"MostRecentNotificationAge";
      break;
    case 0x4EuLL:
      id result = @"AppPreferenceBundleBoost";
      break;
    case 0x4FuLL:
      id result = @"AppIntentPartOfWeekPopularity";
      break;
    case 0x50uLL:
      id result = @"AppIntentLaunchPartOfWeekPopularity";
      break;
    case 0x51uLL:
      id result = @"GenreTimeOfDayPopularity";
      break;
    case 0x52uLL:
      id result = @"GenreSequencePopularity";
      break;
    case 0x53uLL:
      id result = @"GenreDayOfWeekPopularity";
      break;
    case 0x54uLL:
      id result = @"GenreSpotlightLaunchPopularity";
      break;
    case 0x55uLL:
      id result = @"TrendingGenrePopularity";
      break;
    case 0x56uLL:
      id result = @"GenreAirplaneModePopularity";
      break;
    case 0x57uLL:
      id result = @"GenreDailyDoseRemaining";
      break;
    case 0x58uLL:
      id result = @"GenreLocationPopularity";
      break;
    case 0x59uLL:
      id result = @"GenreSSIDPopularity";
      break;
    case 0x5AuLL:
      id result = @"App2VecClusterTimeOfDayPopularity";
      break;
    case 0x5BuLL:
      id result = @"App2VecClusterSequencePopularity";
      break;
    case 0x5CuLL:
      id result = @"App2VecClusterDayOfWeekPopularity";
      break;
    case 0x5DuLL:
      id result = @"App2VecTrendingPopularity";
      break;
    case 0x5EuLL:
      id result = @"App2VecLocationPopularity";
      break;
    case 0x5FuLL:
      id result = @"App2VecClusterCount";
      break;
    case 0x60uLL:
      id result = @"SupportsMedia";
      break;
    case 0x61uLL:
      id result = @"AppTimeAndDayOfWeekPopularity";
      break;
    case 0x62uLL:
      id result = @"AppPopularityGivenTimeAndDayOfWeek";
      break;
    case 0x63uLL:
      id result = @"AppPopularityOfTimeAndDayOfWeekGivenApp";
      break;
    case 0x64uLL:
      id result = @"AppTotalNumberOfTimeAndDayOfWeekLaunches";
      break;
    case 0x65uLL:
      id result = @"AppIntentCount";
      break;
    case 0x66uLL:
      id result = @"AppIntentSlotCountForAllAppActions";
      break;
    case 0x67uLL:
      id result = @"AppIntentTotalNumberOfLaunches";
      break;
    case 0x68uLL:
      id result = @"AppIntentTotalNumberOfAirplaneModeLaunches";
      break;
    case 0x69uLL:
      id result = @"AppIntentTotalNumberOfSSIDLaunches";
      break;
    case 0x6AuLL:
      id result = @"AppIntentTotalNumberOfCoreMotionLaunches";
      break;
    case 0x6BuLL:
      id result = @"AppIntentTotalNumberOfTrendingLaunches";
      break;
    case 0x6CuLL:
      id result = @"DayOfWeekBucket";
      break;
    case 0x6DuLL:
      id result = @"TimeOfDayBucket";
      break;
    case 0x6EuLL:
      id result = @"IsDateInWeekendOnDevice";
      break;
    case 0x6FuLL:
      id result = @"AppIntentLaunchPopularity";
      break;
    case 0x70uLL:
      id result = @"AppIntentTrendingPopularity";
      break;
    case 0x71uLL:
      id result = @"AppIntentTimeOfDayPopularity";
      break;
    case 0x72uLL:
      id result = @"AppIntentCoarseTimeOfDayPopularity";
      break;
    case 0x73uLL:
      id result = @"AppIntentDayOfWeekPopularity";
      break;
    case 0x74uLL:
      id result = @"AppIntentUnlockTime";
      break;
    case 0x75uLL:
      id result = @"AppIntentSSIDPopularity";
      break;
    case 0x76uLL:
      id result = @"AppIntentCoreMotionPopularity";
      break;
    case 0x77uLL:
      id result = @"AppIntentAirplaneModePopularity";
      break;
    case 0x78uLL:
      id result = @"AppIntentLaunchLocationPopularity";
      break;
    case 0x79uLL:
      id result = @"AppIntentLaunchMicroLocationPopularity";
      break;
    case 0x7AuLL:
      id result = @"AppIntentLaunchSequencePopularity";
      break;
    case 0x7BuLL:
      id result = @"AppIntentAppLaunchSequencePopularity";
      break;
    case 0x7CuLL:
      id result = @"AppIntentLaunchTimePopularity";
      break;
    case 0x7DuLL:
      id result = @"AppIntentLaunchDayOfWeekPopularity";
      break;
    case 0x7EuLL:
      id result = @"AppIntentLastLaunchAge";
      break;
    case 0x7FuLL:
      id result = @"AppIntentAverageSecondsBetweenAppActions";
      break;
    case 0x80uLL:
      id result = @"AppIntentMedianSecondsBetweenAppActions";
      break;
    case 0x81uLL:
      id result = @"AppIntentDayZeroPoints";
      break;
    case 0x82uLL:
      id result = @"AppIntentStaticAppPoints";
      break;
    case 0x83uLL:
      id result = @"AppIntentStaticValueScore";
      break;
    case 0x84uLL:
      id result = @"AppCategory";
      break;
    case 0x85uLL:
      id result = @"IntentCategory";
      break;
    case 0x86uLL:
      id result = @"ActionKeyCategory";
      break;
    case 0x87uLL:
      id result = @"IntentCategoryFromIntentDefinition";
      break;
    case 0x88uLL:
      id result = @"AppIntentEntropyLaunchPopularity";
      break;
    case 0x89uLL:
      id result = @"AppIntentEntropyDayOfWeekPopularity";
      break;
    case 0x8AuLL:
      id result = @"AppIntentEntropyDayOfWeekPopularityByDay";
      break;
    case 0x8BuLL:
      id result = @"AppIntentEntropyDayOfWeekPopularityByAppIntent";
      break;
    case 0x8CuLL:
      id result = @"AppIntentEntropyTrendingPopularity";
      break;
    case 0x8DuLL:
      id result = @"AppIntentEntropySSIDPopularity";
      break;
    case 0x8EuLL:
      id result = @"AppIntentEntropySSIDPopularityBySSID";
      break;
    case 0x8FuLL:
      id result = @"AppIntentEntropySSIDPopularityByAppIntent";
      break;
    case 0x90uLL:
      id result = @"AppIntentDistanceDayOfWeekToLaunchPopularity";
      break;
    case 0x91uLL:
      id result = @"AppIntentDistanceTrendingToLaunchPopularity";
      break;
    case 0x92uLL:
      id result = @"AppIntentDistanceSSIDToLaunchPopularity";
      break;
    case 0x93uLL:
      id result = @"AppActionConfirmEvents";
      break;
    case 0x94uLL:
      id result = @"AppActionRejectEvents";
      break;
    case 0x95uLL:
      id result = @"TotalAppActionConfirmEvents";
      break;
    case 0x96uLL:
      id result = @"TotalAppActionRejectEvents";
      break;
    case 0x97uLL:
      id result = @"AppForAllIntentsCount";
      break;
    case 0x98uLL:
      id result = @"AppForAllIntentsTotalNumberOfLaunches";
      break;
    case 0x99uLL:
      id result = @"AppForAllIntentsTotalNumberOfAirplaneModeLaunches";
      break;
    case 0x9AuLL:
      id result = @"AppForAllIntentsTotalNumberOfSSIDLaunches";
      break;
    case 0x9BuLL:
      id result = @"AppForAllIntentsTotalNumberOfCoreMotionLaunches";
      break;
    case 0x9CuLL:
      id result = @"AppForAllIntentsTotalNumberOfTrendingLaunches";
      break;
    case 0x9DuLL:
      id result = @"AppForAllIntentsLaunchPopularity";
      break;
    case 0x9EuLL:
      id result = @"AppForAllIntentsTimeOfDayPopularity";
      break;
    case 0x9FuLL:
      id result = @"AppForAllIntentsDayOfWeekPopularity";
      break;
    case 0xA0uLL:
      id result = @"AppForAllIntentsCoarseTimeOfDayPopularity";
      break;
    case 0xA1uLL:
      id result = @"AppForAllIntentsUnlockTime";
      break;
    case 0xA2uLL:
      id result = @"AppForAllIntentsAirplaneModePopularity";
      break;
    case 0xA3uLL:
      id result = @"AppForAllIntentsSSIDPopularity";
      break;
    case 0xA4uLL:
      id result = @"AppForAllIntentsCoreMotionPopularity";
      break;
    case 0xA5uLL:
      id result = @"AppForAllIntentsTrendingPopularity";
      break;
    case 0xA6uLL:
      id result = @"AppForAllIntentsLaunchLocationPopularity";
      break;
    case 0xA7uLL:
      id result = @"AppForAllIntentsLaunchTimePopularity";
      break;
    case 0xA8uLL:
      id result = @"AppForAllIntentsLaunchDayOfWeekPopularity";
      break;
    case 0xA9uLL:
      id result = @"AppForAllIntentsEntropyLaunchPopularity";
      break;
    case 0xAAuLL:
      id result = @"AppForAllIntentsEntropyDayOfWeekPopularity";
      break;
    case 0xABuLL:
      id result = @"AppForAllIntentsEntropyDayOfWeekPopularityByDay";
      break;
    case 0xACuLL:
      id result = @"AppForAllIntentsEntropyDayOfWeekPopularityByApp";
      break;
    case 0xADuLL:
      id result = @"AppForAllIntentsEntropyTrendingPopularity";
      break;
    case 0xAEuLL:
      id result = @"AppForAllIntentsEntropySSIDPopularity";
      break;
    case 0xAFuLL:
      id result = @"AppForAllIntentsEntropySSIDPopularityBySSID";
      break;
    case 0xB0uLL:
      id result = @"AppForAllIntentsEntropySSIDPopularityByApp";
      break;
    case 0xB1uLL:
      id result = @"AppForAllIntentsDistanceSSIDToLaunchPopularity";
      break;
    case 0xB2uLL:
      id result = @"AppForAllIntentsDistanceDayOfWeekToLaunchPopularity";
      break;
    case 0xB3uLL:
      id result = @"AppForAllIntentsDistanceTrendingToLaunchPopularity";
      break;
    case 0xB4uLL:
      id result = @"AppForAllActionsConfirmEvents";
      break;
    case 0xB5uLL:
      id result = @"AppForAllActionsRejectEvents";
      break;
    case 0xB6uLL:
      id result = @"TotalAppForAllActionsConfirmEvents";
      break;
    case 0xB7uLL:
      id result = @"TotalAppForAllActionsRejectEvents";
      break;
    case 0xB8uLL:
      id result = @"SlotCount";
      break;
    case 0xB9uLL:
      id result = @"SlotTotalNumberOfLaunches";
      break;
    case 0xBAuLL:
      id result = @"SlotTotalNumberOfUniqueDaysLaunched";
      break;
    case 0xBBuLL:
      id result = @"SlotLaunchPopularity";
      break;
    case 0xBCuLL:
      id result = @"SlotTimeOfDayPopularity";
      break;
    case 0xBDuLL:
      id result = @"SlotTimeOfDayWithThirtyMinuteWindowPopularity";
      break;
    case 0xBEuLL:
      id result = @"SlotTimeOfDayWithHourWindowPopularity";
      break;
    case 0xBFuLL:
      id result = @"SlotTimeOfDayWithEightHourWindowPopularity";
      break;
    case 0xC0uLL:
      id result = @"SlotDayOfWeekPopularity";
      break;
    case 0xC1uLL:
      id result = @"SlotPartOfWeekPopularity";
      break;
    case 0xC2uLL:
      id result = @"SlotPartOfWeekAndLocationPopularity";
      break;
    case 0xC3uLL:
      id result = @"SlotCoarseTimeOfDayPopularity";
      break;
    case 0xC4uLL:
      id result = @"ScoreInputSlotLocationPopularity";
      break;
    case 0xC5uLL:
      id result = @"SlotCoreMotionPopularity";
      break;
    case 0xC6uLL:
      id result = @"SlotPreviousLocationPopularity";
      break;
    case 0xC7uLL:
      id result = @"SlotTimeAndDayPopularity";
      break;
    case 0xC8uLL:
      id result = @"SlotTimeAndLocationPopularity";
      break;
    case 0xC9uLL:
      id result = @"SlotDayAndLocationPopularity";
      break;
    case 0xCAuLL:
      id result = @"SlotTimeAndDayAndLocationPopularity";
      break;
    case 0xCBuLL:
      id result = @"SlotPreviousLocationAndCoreMotionPopularity";
      break;
    case 0xCCuLL:
      id result = @"SlotPreviousLocationAndLocationPopularity";
      break;
    case 0xCDuLL:
      id result = @"SlotTimeAndPreviousLocationPopularity";
      break;
    case 0xCEuLL:
      id result = @"SlotDayAndPreviousLocationPopularity";
      break;
    case 0xCFuLL:
      id result = @"SlotPartOfWeekAndTimePopularity";
      break;
    case 0xD0uLL:
      id result = @"SlotLaunchTimePopularity";
      break;
    case 0xD1uLL:
      id result = @"SlotLaunchCoarseTimePopularity";
      break;
    case 0xD2uLL:
      id result = @"SlotLaunchDayOfWeekPopularity";
      break;
    case 0xD3uLL:
      id result = @"SlotLaunchPartOfWeekPopularity";
      break;
    case 0xD4uLL:
      id result = @"SlotLaunchPartOfWeekAndLocationPopularity";
      break;
    case 0xD5uLL:
      id result = @"SlotLaunchLocationPopularity";
      break;
    case 0xD6uLL:
      id result = @"SlotLaunchCoreMotionPopularity";
      break;
    case 0xD7uLL:
      id result = @"SlotLaunchPreviousLocationPopularity";
      break;
    case 0xD8uLL:
      id result = @"SlotLaunchTimeAndDayPopularity";
      break;
    case 0xD9uLL:
      id result = @"SlotLaunchTimeAndLocationPopularity";
      break;
    case 0xDAuLL:
      id result = @"SlotLaunchDayAndLocationPopularity";
      break;
    case 0xDBuLL:
      id result = @"SlotLaunchTimeAndDayAndLocationPopularity";
      break;
    case 0xDCuLL:
      id result = @"SlotLaunchPreviousLocationAndCoreMotionPopularity";
      break;
    case 0xDDuLL:
      id result = @"SlotLaunchPreviousLocationAndLocationPopularity";
      break;
    case 0xDEuLL:
      id result = @"SlotLaunchTimeAndPreviousLocationPopularity";
      break;
    case 0xDFuLL:
      id result = @"SlotLaunchDayAndPreviousLocationPopularity";
      break;
    case 0xE0uLL:
      id result = @"SlotLaunchPartOfWeekAndTimePopularity";
      break;
    case 0xE1uLL:
      id result = @"SlotLaunchTimeCount";
      break;
    case 0xE2uLL:
      id result = @"SlotLaunchDayOfWeekCount";
      break;
    case 0xE3uLL:
      id result = @"SlotLaunchPartOfWeekCount";
      break;
    case 0xE4uLL:
      id result = @"SlotLaunchCoarseTimeCount";
      break;
    case 0xE5uLL:
      id result = @"SlotLaunchTimeWithThirtyMinuteWindowCount";
      break;
    case 0xE6uLL:
      id result = @"SlotLaunchTimeWithHourWindowCount";
      break;
    case 0xE7uLL:
      id result = @"SlotLaunchTimeWithEightHourWindowCount";
      break;
    case 0xE8uLL:
      id result = @"SlotLaunchLocationCount";
      break;
    case 0xE9uLL:
      id result = @"SlotLaunchCoreMotionCount";
      break;
    case 0xEAuLL:
      id result = @"SlotLaunchPreviousLocationCount";
      break;
    case 0xEBuLL:
      id result = @"SlotTotalLaunchesForSlotUsingTimeDecay";
      break;
    case 0xECuLL:
      id result = @"SlotTotalLaunchesForSlotUsingDayOfWeekDecay";
      break;
    case 0xEDuLL:
      id result = @"SlotTotalLaunchesForSlotUsingLocationDecay";
      break;
    case 0xEEuLL:
      id result = @"SlotTotalLaunchesForSlotUsingCoreMotionDecay";
      break;
    case 0xEFuLL:
      id result = @"SlotTotalLaunchesForSlotUsingPreviousLocationDecay";
      break;
    case 0xF0uLL:
      id result = @"SlotTotalLaunchesForSlotUsingPartOfWeekDecay";
      break;
    case 0xF1uLL:
      id result = @"SlotTotalLaunchesForSlotUsingTimeAndDayDecay";
      break;
    case 0xF2uLL:
      id result = @"SlotTotalLaunchesForSlotUsingTimeAndLocationDecay";
      break;
    case 0xF3uLL:
      id result = @"SlotTotalLaunchesForSlotUsingDayAndLocationDecay";
      break;
    case 0xF4uLL:
      id result = @"SlotTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay";
      break;
    case 0xF5uLL:
      id result = @"SlotTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay";
      break;
    case 0xF6uLL:
      id result = @"SlotTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay";
      break;
    case 0xF7uLL:
      id result = @"SlotTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay";
      break;
    case 0xF8uLL:
      id result = @"SlotTotalLaunchesForSlotUsingDayAndPreviousLocationDecay";
      break;
    case 0xF9uLL:
      id result = @"SlotTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay";
      break;
    case 0xFAuLL:
      id result = @"SlotTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay";
      break;
    case 0xFBuLL:
      id result = @"SlotSecondsSinceLastSlot";
      break;
    case 0xFCuLL:
      id result = @"SlotOnlyLaunchedWithinShortTimeSpan";
      break;
    case 0xFDuLL:
      id result = @"SlotTotalNumberOfUndecayedLaunchesForSlot";
      break;
    case 0xFEuLL:
      id result = @"SlotNumberOfUniqueDaysLaunchedForSlot";
      break;
    case 0xFFuLL:
      id result = @"SlotTotalNumberOfLaunchesForSlot";
      break;
    case 0x100uLL:
      id result = @"SlotLOIBoost";
      break;
    case 0x101uLL:
      id result = @"SlotNumberOfParameters";
      break;
    case 0x102uLL:
      id result = @"SlotNumSessionStartsForRootOfApp";
      break;
    case 0x103uLL:
      id result = @"SlotTotalNumSessionsForRootOfApp";
      break;
    case 0x104uLL:
      id result = @"SlotNumDocFreqForRootOfApp";
      break;
    case 0x105uLL:
      id result = @"SlotEntropyForSlotSet";
      break;
    case 0x106uLL:
      id result = @"SlotTotalNumberOfLaunchesForSlotSet";
      break;
    case 0x107uLL:
      id result = @"SlotTimeOfDayBudgetMeanForSlot";
      break;
    case 0x108uLL:
      id result = @"SlotTimeOfDayBudgetStdDevForSlot";
      break;
    case 0x109uLL:
      id result = @"SlotTodaysTimeOfDayBudgetForSlot";
      break;
    case 0x10AuLL:
      id result = @"SlotFeedbackTotalConfirmsForSlot";
      break;
    case 0x10BuLL:
      id result = @"SlotFeedbackTotalRejectsForSlot";
      break;
    case 0x10CuLL:
      id result = @"SlotFeedbackTotalExplicitRejectsForSlotNoDecay";
      break;
    case 0x10DuLL:
      id result = @"SlotFeedbackTotalConfirmsForAllSlots";
      break;
    case 0x10EuLL:
      id result = @"SlotFeedbackTotalRejectsForAllSlots";
      break;
    case 0x10FuLL:
      id result = @"SlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay";
      break;
    case 0x110uLL:
      id result = @"SlotFeedbackConfirmRatio";
      break;
    case 0x111uLL:
      id result = @"SlotFeedbackConfirmRatioStdDev";
      break;
    case 0x112uLL:
      id result = @"SlotFeedbackConfirmRatioMean";
      break;
    case 0x113uLL:
      id result = @"SlotFeedbackConfirmRatioCount";
      break;
    case 0x114uLL:
      id result = @"SlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen";
      break;
    case 0x115uLL:
      id result = @"SlotFeedbackMinutesSinceLastConfirmInSpotlight";
      break;
    case 0x116uLL:
      id result = @"SlotFeedbackMinutesSinceLastExplicitRejectInSpotlight";
      break;
    case 0x117uLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight";
      break;
    case 0x118uLL:
      id result = @"SlotFeedbackTotalRejectsForSlotInLastHourInSpotlight";
      break;
    case 0x119uLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight";
      break;
    case 0x11AuLL:
      id result = @"SlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight";
      break;
    case 0x11BuLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotTodayInSpotlight";
      break;
    case 0x11CuLL:
      id result = @"SlotFeedbackTotalRejectsForSlotTodayInSpotlight";
      break;
    case 0x11DuLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotInSpotlight";
      break;
    case 0x11EuLL:
      id result = @"SlotFeedbackTotalRejectsForSlotInSpotlight";
      break;
    case 0x11FuLL:
      id result = @"SlotFeedbackConfirmsPartOfWeekCountInSpotlight";
      break;
    case 0x120uLL:
      id result = @"SlotFeedbackConfirmsDayCountInSpotlight";
      break;
    case 0x121uLL:
      id result = @"SlotFeedbackConfirmsTimeOfDayCountInSpotlight";
      break;
    case 0x122uLL:
      id result = @"SlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight";
      break;
    case 0x123uLL:
      id result = @"SlotFeedbackTotalConfirmsInSpotlightForAllSlots";
      break;
    case 0x124uLL:
      id result = @"SlotFeedbackTotalRejectsInSpotlightForAllSlots";
      break;
    case 0x125uLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotTodayInLockscreen";
      break;
    case 0x126uLL:
      id result = @"SlotFeedbackTotalRejectsForSlotTodayInLockscreen";
      break;
    case 0x127uLL:
      id result = @"SlotFeedbackMinutesSinceLastConfirmInLockscreen";
      break;
    case 0x128uLL:
      id result = @"SlotFeedbackMinutesSinceLastRejectInLockscreen";
      break;
    case 0x129uLL:
      id result = @"SlotFeedbackMinutesSinceLastExplicitRejectInLockscreen";
      break;
    case 0x12AuLL:
      id result = @"SlotFeedbackTotalConfirmsForSlotInLockscreen";
      break;
    case 0x12BuLL:
      id result = @"SlotFeedbackTotalRejectsForSlotInLockscreen";
      break;
    case 0x12CuLL:
      id result = @"SlotFeedbackConfirmsPartOfWeekCountInLockscreen";
      break;
    case 0x12DuLL:
      id result = @"SlotFeedbackConfirmsDayCountInLockscreen";
      break;
    case 0x12EuLL:
      id result = @"SlotFeedbackConfirmsTimeOfDayCountInLockscreen";
      break;
    case 0x12FuLL:
      id result = @"SlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen";
      break;
    case 0x130uLL:
      id result = @"SlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots";
      break;
    case 0x131uLL:
      id result = @"SlotFeedbackTotalRejectsTodayInLockscreenForAllSlots";
      break;
    case 0x132uLL:
      id result = @"SlotFeedbackTotalConfirmsInLockscreenForAllSlots";
      break;
    case 0x133uLL:
      id result = @"SlotFeedbackTotalRejectsInLockscreenForAllSlots";
      break;
    case 0x134uLL:
      id result = @"ActionFeedbackTotalConfirmsInSpotlight";
      break;
    case 0x135uLL:
      id result = @"ActionFeedbackTotalRejectsInSpotlight";
      break;
    case 0x136uLL:
      id result = @"ActionFeedbackTotalConfirmsTodayInLockscreen";
      break;
    case 0x137uLL:
      id result = @"ActionFeedbackTotalRejectsTodayInLockscreen";
      break;
    case 0x138uLL:
      id result = @"ActionFeedbackTotalConfirmsInLockscreen";
      break;
    case 0x139uLL:
      id result = @"ActionFeedbackTotalRejectsInLockscreen";
      break;
    case 0x13AuLL:
      id result = @"ActionFeedbackMeanNumberOfSpotlightLaunchesPerDay";
      break;
    case 0x13BuLL:
      id result = @"ActionFeedbackMeanNumberOfSpotlightConfirmsPerDay";
      break;
    case 0x13CuLL:
      id result = @"ActionLaunchPopularity";
      break;
    case 0x13DuLL:
      id result = @"ActionTimeOfDayPopularity";
      break;
    case 0x13EuLL:
      id result = @"ActionTimeOfDayWithThirtyMinuteWindowPopularity";
      break;
    case 0x13FuLL:
      id result = @"ActionTimeOfDayWithHourWindowPopularity";
      break;
    case 0x140uLL:
      id result = @"ActionTimeOfDayWithEightHourWindowPopularity";
      break;
    case 0x141uLL:
      id result = @"ActionCoarseTimeOfDayPopularity";
      break;
    case 0x142uLL:
      id result = @"ActionDayOfWeekPopularity";
      break;
    case 0x143uLL:
      id result = @"ActionPartOfWeekPopularity";
      break;
    case 0x144uLL:
      id result = @"ActionPartOfWeekAndLocationPopularity";
      break;
    case 0x145uLL:
      id result = @"ActionLocationPopularity";
      break;
    case 0x146uLL:
      id result = @"ActionCoreMotionPopularity";
      break;
    case 0x147uLL:
      id result = @"ActionPreviousLocationPopularity";
      break;
    case 0x148uLL:
      id result = @"ActionPreviousLocationAndCoreMotionPopularity";
      break;
    case 0x149uLL:
      id result = @"ActionPreviousLocationAndLocationPopularity";
      break;
    case 0x14AuLL:
      id result = @"ActionTimeAndPreviousLocationPopularity";
      break;
    case 0x14BuLL:
      id result = @"ActionDayAndPreviousLocationPopularity";
      break;
    case 0x14CuLL:
      id result = @"ActionTimeAndDayPopularity";
      break;
    case 0x14DuLL:
      id result = @"ActionTimeAndLocationPopularity";
      break;
    case 0x14EuLL:
      id result = @"ActionDayAndLocationPopularity";
      break;
    case 0x14FuLL:
      id result = @"ActionTimeAndDayAndLocationPopularity";
      break;
    case 0x150uLL:
      id result = @"ActionPartOfWeekAndTimePopularity";
      break;
    case 0x151uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingTimeDecay";
      break;
    case 0x152uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingDayOfWeekDecay";
      break;
    case 0x153uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingLocationDecay";
      break;
    case 0x154uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingCoreMotionDecay";
      break;
    case 0x155uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPreviousLocationDecay";
      break;
    case 0x156uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPartOfWeekDecay";
      break;
    case 0x157uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay";
      break;
    case 0x158uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay";
      break;
    case 0x159uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay";
      break;
    case 0x15AuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay";
      break;
    case 0x15BuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingTimeAndDayDecay";
      break;
    case 0x15CuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingTimeAndLocationDecay";
      break;
    case 0x15DuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingDayAndLocationDecay";
      break;
    case 0x15EuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay";
      break;
    case 0x15FuLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay";
      break;
    case 0x160uLL:
      id result = @"ActionTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay";
      break;
    case 0x161uLL:
      id result = @"RandomSessionValue";
      break;
    case 0x162uLL:
      id result = @"RandomScore";
      break;
    case 0x163uLL:
      id result = @"ActionTotalConfirms";
      break;
    case 0x164uLL:
      id result = @"ActionTotalRejects";
      break;
    case 0x165uLL:
      id result = @"_ATXScoreInputActionTotalExplicitRejectsNoDecay";
      break;
    case 0x166uLL:
      id result = @"AppSpecificAlpha";
      break;
    case 0x167uLL:
      id result = @"AppSpecificBeta";
      break;
    case 0x168uLL:
      id result = @"GlobalScoreGivenTimeDayLocationAndLastApp";
      break;
    case 0x169uLL:
      id result = @"AppGlobalScoreGivenTimeDayAndLocation";
      break;
    case 0x16AuLL:
      id result = @"AppLOITypeLaunches";
      break;
    case 0x16BuLL:
      id result = @"AppLastAppLaunches";
      break;
    case 0x16CuLL:
      id result = @"AppTimeOfDayLaunches";
      break;
    case 0x16DuLL:
      id result = @"AppDayOfWeekLaunches";
      break;
    case 0x16EuLL:
      id result = @"AppBlendedLOITypePopularity";
      break;
    case 0x16FuLL:
      id result = @"AppBlendedLastAppPopularity";
      break;
    case 0x170uLL:
      id result = @"AppBlendedTimeOfDayPopularity";
      break;
    case 0x171uLL:
      id result = @"AppBlendedDayOfWeekPopularity";
      break;
    case 0x172uLL:
      id result = @"AppBlendedLOITypeSampledPopularity";
      break;
    case 0x173uLL:
      id result = @"AppBlendedLastAppSampledPopularity";
      break;
    case 0x174uLL:
      id result = @"AppBlendedTimeOfDaySampledPopularity";
      break;
    case 0x175uLL:
      id result = @"AppBlendedDayOfWeekSampledPopularity";
      break;
    case 0x176uLL:
      id result = @"ActionIsFutureMedia";
      break;
    case 0x177uLL:
      id result = @"ActionIsBackgroundExecutable";
      break;
    case 0x178uLL:
      id result = @"ActionMotionType";
      break;
    case 0x179uLL:
      id result = @"ActionLOIType";
      break;
    case 0x17AuLL:
      id result = @"SlotIsSiriKitIntent";
      break;
    case 0x17BuLL:
      id result = @"SlotIsCustomIntent";
      break;
    case 0x17CuLL:
      id result = @"SlotIsNSUserActivity";
      break;
    case 0x17DuLL:
      id result = @"AppActionScore";
      break;
    case 0x17EuLL:
      id result = @"AppActionLogProbability";
      break;
    case 0x17FuLL:
      id result = @"SlotScore";
      break;
    case 0x180uLL:
      id result = @"SlotLogProbability";
      break;
    case 0x181uLL:
      id result = @"ActionHeuristicConfirmEvents";
      break;
    case 0x182uLL:
      id result = @"ActionHeuristicRejectEvents";
      break;
    case 0x183uLL:
      id result = @"TotalActionHeuristicConfirmEvents";
      break;
    case 0x184uLL:
      id result = @"TotalActionHeuristicRejectEvents";
      break;
    case 0x185uLL:
      id result = @"AmbientLightTypePopularity";
      break;
    case 0x186uLL:
      id result = @"AmbientLightTypeLaunchPopularity";
      break;
    case 0x187uLL:
      id result = @"AppIntentAmbientLightTypePopularity";
      break;
    case 0x188uLL:
      id result = @"AppIntentAmbientLightTypeLaunchPopularity";
      break;
    case 0x189uLL:
      id result = @"AppLaunchesCoarseTimePowLocationForAppInContext";
      break;
    case 0x18AuLL:
      id result = @"AppLaunchesCoarseTimePowLocationInContext";
      break;
    case 0x18BuLL:
      id result = @"AppLaunchesCoarseTimePowLocationForApp";
      break;
    case 0x18CuLL:
      id result = @"AppLaunchesCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x18DuLL:
      id result = @"AppConfirmsCoarseTimePowLocationForAppInContext";
      break;
    case 0x18EuLL:
      id result = @"AppConfirmsCoarseTimePowLocationInContext";
      break;
    case 0x18FuLL:
      id result = @"AppConfirmsCoarseTimePowLocationForApp";
      break;
    case 0x190uLL:
      id result = @"AppConfirmsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x191uLL:
      id result = @"AppRejectsCoarseTimePowLocationForAppInContext";
      break;
    case 0x192uLL:
      id result = @"AppRejectsCoarseTimePowLocationInContext";
      break;
    case 0x193uLL:
      id result = @"AppRejectsCoarseTimePowLocationForApp";
      break;
    case 0x194uLL:
      id result = @"AppRejectsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x195uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAppInContext";
      break;
    case 0x196uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationInContext";
      break;
    case 0x197uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForApp";
      break;
    case 0x198uLL:
      id result = @"_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts";
      break;
    case 0x199uLL:
      id result = @"AppLaunchesSpecificTimeDowLocationForAppInContext";
      break;
    case 0x19AuLL:
      id result = @"AppLaunchesSpecificTimeDowLocationInContext";
      break;
    case 0x19BuLL:
      id result = @"AppLaunchesSpecificTimeDowLocationForApp";
      break;
    case 0x19CuLL:
      id result = @"AppLaunchesSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x19DuLL:
      id result = @"AppConfirmsSpecificTimeDowLocationForAppInContext";
      break;
    case 0x19EuLL:
      id result = @"AppConfirmsSpecificTimeDowLocationInContext";
      break;
    case 0x19FuLL:
      id result = @"AppConfirmsSpecificTimeDowLocationForApp";
      break;
    case 0x1A0uLL:
      id result = @"AppConfirmsSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x1A1uLL:
      id result = @"AppRejectsSpecificTimeDowLocationForAppInContext";
      break;
    case 0x1A2uLL:
      id result = @"AppRejectsSpecificTimeDowLocationInContext";
      break;
    case 0x1A3uLL:
      id result = @"AppRejectsSpecificTimeDowLocationForApp";
      break;
    case 0x1A4uLL:
      id result = @"AppRejectsSpecificTimeDowLocationForAllAppsAndContexts";
      break;
    case 0x1A5uLL:
      id result = @"ActionsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1A6uLL:
      id result = @"ActionsCoarseTimePowLocationInContext";
      break;
    case 0x1A7uLL:
      id result = @"ActionsCoarseTimePowLocationForAction";
      break;
    case 0x1A8uLL:
      id result = @"ActionsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1A9uLL:
      id result = @"ActionConfirmsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1AAuLL:
      id result = @"ActionConfirmsCoarseTimePowLocationInContext";
      break;
    case 0x1ABuLL:
      id result = @"ActionConfirmsCoarseTimePowLocationForAction";
      break;
    case 0x1ACuLL:
      id result = @"ActionConfirmsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1ADuLL:
      id result = @"ActionRejectsCoarseTimePowLocationForActionInContext";
      break;
    case 0x1AEuLL:
      id result = @"ActionRejectsCoarseTimePowLocationInContext";
      break;
    case 0x1AFuLL:
      id result = @"ActionRejectsCoarseTimePowLocationForAction";
      break;
    case 0x1B0uLL:
      id result = @"ActionRejectsCoarseTimePowLocationForAllActionsAndContexts";
      break;
    case 0x1B1uLL:
      id result = @"ActionsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1B2uLL:
      id result = @"ActionsSpecificTimeDowLocationInContext";
      break;
    case 0x1B3uLL:
      id result = @"ActionsSpecificTimeDowLocationForAction";
      break;
    case 0x1B4uLL:
      id result = @"ActionsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1B5uLL:
      id result = @"ActionConfirmsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1B6uLL:
      id result = @"ActionConfirmsSpecificTimeDowLocationInContext";
      break;
    case 0x1B7uLL:
      id result = @"ActionConfirmsSpecificTimeDowLocationForAction";
      break;
    case 0x1B8uLL:
      id result = @"ActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1B9uLL:
      id result = @"ActionRejectsSpecificTimeDowLocationForActionInContext";
      break;
    case 0x1BAuLL:
      id result = @"ActionRejectsSpecificTimeDowLocationInContext";
      break;
    case 0x1BBuLL:
      id result = @"ActionRejectsSpecificTimeDowLocationForAction";
      break;
    case 0x1BCuLL:
      id result = @"ActionRejectsSpecificTimeDowLocationForAllActionsAndContexts";
      break;
    case 0x1BDuLL:
      id result = @"AppLaunchesInTimeBucket0ForApp";
      break;
    case 0x1BEuLL:
      id result = @"AppLaunchesInTimeBucket1ForApp";
      break;
    case 0x1BFuLL:
      id result = @"AppLaunchesInTimeBucket2ForApp";
      break;
    case 0x1C0uLL:
      id result = @"AppLaunchesInTimeBucket3ForApp";
      break;
    case 0x1C1uLL:
      id result = @"AppLaunchesInTimeBucket4ForApp";
      break;
    case 0x1C2uLL:
      id result = @"AppLaunchesInTimeBucket5ForApp";
      break;
    case 0x1C3uLL:
      id result = @"AppLaunchesInTimeBucket6ForApp";
      break;
    case 0x1C4uLL:
      id result = @"AppLaunchesInTimeBucket7ForApp";
      break;
    case 0x1C5uLL:
      id result = @"AppLaunchesInTimeBucket8ForApp";
      break;
    case 0x1C6uLL:
      id result = @"AppLaunchesInTimeBucket9ForApp";
      break;
    case 0x1C7uLL:
      id result = @"AppLaunchesInTimeBucket10ForApp";
      break;
    case 0x1C8uLL:
      id result = @"AppLaunchesInTimeBucket11ForApp";
      break;
    case 0x1C9uLL:
      id result = @"AppLaunchesInTimeBucket12ForApp";
      break;
    case 0x1CAuLL:
      id result = @"AppLaunchesInTimeBucket13ForApp";
      break;
    case 0x1CBuLL:
      id result = @"AppLaunchesInTimeBucket14ForApp";
      break;
    case 0x1CCuLL:
      id result = @"AppLaunchesInTimeBucket15ForApp";
      break;
    case 0x1CDuLL:
      id result = @"AppLaunchesInTimeBucket16ForApp";
      break;
    case 0x1CEuLL:
      id result = @"AppLaunchesInTimeBucket17ForApp";
      break;
    case 0x1CFuLL:
      id result = @"AppLaunchesInTimeBucket18ForApp";
      break;
    case 0x1D0uLL:
      id result = @"AppLaunchesInTimeBucket19ForApp";
      break;
    case 0x1D1uLL:
      id result = @"AppLaunchesInTimeBucket20ForApp";
      break;
    case 0x1D2uLL:
      id result = @"AppLaunchesInTimeBucket21ForApp";
      break;
    case 0x1D3uLL:
      id result = @"AppLaunchesInTimeBucket22ForApp";
      break;
    case 0x1D4uLL:
      id result = @"AppLaunchesInTimeBucket23ForApp";
      break;
    case 0x1D5uLL:
      id result = @"AppLaunchesInTimeBucket24ForApp";
      break;
    case 0x1D6uLL:
      id result = @"AppLaunchesOnDayOfWeekSundayForApp";
      break;
    case 0x1D7uLL:
      id result = @"AppLaunchesOnDayOfWeekMondayForApp";
      break;
    case 0x1D8uLL:
      id result = @"AppLaunchesOnDayOfWeekTuesdayForApp";
      break;
    case 0x1D9uLL:
      id result = @"AppLaunchesOnDayOfWeekWednesdayForApp";
      break;
    case 0x1DAuLL:
      id result = @"AppLaunchesOnDayOfWeekThursdayForApp";
      break;
    case 0x1DBuLL:
      id result = @"AppLaunchesOnDayOfWeekFridayForApp";
      break;
    case 0x1DCuLL:
      id result = @"AppLaunchesOnDayOfWeekSaturdayForApp";
      break;
    case 0x1DDuLL:
      id result = @"AppLaunchesAtCoarseGeoHash0ForApp";
      break;
    case 0x1DEuLL:
      id result = @"AppLaunchesAtCoarseGeoHash1ForApp";
      break;
    case 0x1DFuLL:
      id result = @"AppLaunchesAtCoarseGeoHash2ForApp";
      break;
    case 0x1E0uLL:
      id result = @"AppLaunchesAtCoarseGeoHash3ForApp";
      break;
    case 0x1E1uLL:
      id result = @"AppLaunchesAtCoarseGeoHash4ForApp";
      break;
    case 0x1E2uLL:
      id result = @"AppLaunchesAtCoarseGeoHash5ForApp";
      break;
    case 0x1E3uLL:
      id result = @"AppLaunchesAtCoarseGeoHash6ForApp";
      break;
    case 0x1E4uLL:
      id result = @"AppLaunchesAtCoarseGeoHash7ForApp";
      break;
    case 0x1E5uLL:
      id result = @"AppLaunchesAtCoarseGeoHash8ForApp";
      break;
    case 0x1E6uLL:
      id result = @"AppLaunchesAtCoarseGeoHash9ForApp";
      break;
    case 0x1E7uLL:
      id result = @"AppLaunchesAtSpecificGeoHash0ForApp";
      break;
    case 0x1E8uLL:
      id result = @"AppLaunchesAtSpecificGeoHash1ForApp";
      break;
    case 0x1E9uLL:
      id result = @"AppLaunchesAtSpecificGeoHash2ForApp";
      break;
    case 0x1EAuLL:
      id result = @"AppLaunchesAtSpecificGeoHash3ForApp";
      break;
    case 0x1EBuLL:
      id result = @"AppLaunchesAtSpecificGeoHash4ForApp";
      break;
    case 0x1ECuLL:
      id result = @"AppLaunchesAtSpecificGeoHash5ForApp";
      break;
    case 0x1EDuLL:
      id result = @"AppLaunchesAtSpecificGeoHash6ForApp";
      break;
    case 0x1EEuLL:
      id result = @"AppLaunchesAtSpecificGeoHash7ForApp";
      break;
    case 0x1EFuLL:
      id result = @"AppLaunchesAtSpecificGeoHash8ForApp";
      break;
    case 0x1F0uLL:
      id result = @"AppLaunchesAtSpecificGeoHash9ForApp";
      break;
    case 0x1F1uLL:
      id result = @"AppLaunchesAtSpecificGeoHash10ForApp";
      break;
    case 0x1F2uLL:
      id result = @"AppLaunchesAtSpecificGeoHash11ForApp";
      break;
    case 0x1F3uLL:
      id result = @"AppLaunchesAtSpecificGeoHash12ForApp";
      break;
    case 0x1F4uLL:
      id result = @"AppLaunchesAtSpecificGeoHash13ForApp";
      break;
    case 0x1F5uLL:
      id result = @"AppLaunchesAtSpecificGeoHash14ForApp";
      break;
    case 0x1F6uLL:
      id result = @"AppNumberOfSpecificGeohashesForApp";
      break;
    case 0x1F7uLL:
      id result = @"AppNumberOfCoarseGeohashesForApp";
      break;
    case 0x1F8uLL:
      id result = @"AppEntropyForTimeBuckets";
      break;
    case 0x1F9uLL:
      id result = @"AppEntropyForSpecificGeoHash";
      break;
    case 0x1FAuLL:
      id result = @"AppEntropyForCoarseGeoHash";
      break;
    case 0x1FBuLL:
      id result = @"AppLaunchesAtSpecificGeoHashForAppInContext";
      break;
    case 0x1FCuLL:
      id result = @"AppLaunchesAtCoarseGeoHashForAppInContext";
      break;
    case 0x1FDuLL:
      id result = @"AppLaunchesAtDayOfWeekInContext";
      break;
    case 0x1FEuLL:
      id result = @"AppLaunchesAtDayOfWeekForApp";
      break;
    case 0x1FFuLL:
      id result = @"AppLaunchesAtTimeAndDayForAppInContext";
      break;
    case 0x200uLL:
      id result = @"AppLaunchesAtTimeAndDayInContext";
      break;
    case 0x201uLL:
      id result = @"AppLaunchesAtTimeAndDayForApp";
      break;
    case 0x202uLL:
      id result = @"AppLaunchesAtCoarseGeoHashInContext";
      break;
    case 0x203uLL:
      id result = @"AppLaunchesAtCoarseGeoHashForApp";
      break;
    case 0x204uLL:
      id result = @"AppLaunchesAtSpecificGeoHashInContext";
      break;
    case 0x205uLL:
      id result = @"AppLaunchesAtSpecificGeoHashForApp";
      break;
    case 0x206uLL:
      id result = @"AppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x207uLL:
      id result = @"AppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x208uLL:
      id result = @"IsLocationServicesDisabled";
      break;
    case 0x209uLL:
      id result = @"AppLaunchesInTwoHourTimeBucketForAppInContext";
      break;
    case 0x20AuLL:
      id result = @"AppLaunchesInTwoHourTimeBucketInContext";
      break;
    case 0x20BuLL:
      id result = @"AppLaunchesInTwoHourTimeBucketForApp";
      break;
    case 0x20CuLL:
      id result = @"AppConfirmsInTwoHourTimeBucketForAppInContext";
      break;
    case 0x20DuLL:
      id result = @"AppConfirmsInTwoHourTimeBucketInContext";
      break;
    case 0x20EuLL:
      id result = @"AppConfirmsInTwoHourTimeBucketForApp";
      break;
    case 0x20FuLL:
      id result = @"AppRejectsInTwoHourTimeBucketForAppInContext";
      break;
    case 0x210uLL:
      id result = @"AppRejectsInTwoHourTimeBucketInContext";
      break;
    case 0x211uLL:
      id result = @"AppRejectsInTwoHourTimeBucketForApp";
      break;
    case 0x212uLL:
      id result = @"AppConfirmsAtDayOfWeekForAppInContext";
      break;
    case 0x213uLL:
      id result = @"AppConfirmsAtDayOfWeekInContext";
      break;
    case 0x214uLL:
      id result = @"AppConfirmsAtDayOfWeekForApp";
      break;
    case 0x215uLL:
      id result = @"AppRejectsAtDayOfWeekForAppInContext";
      break;
    case 0x216uLL:
      id result = @"AppRejectsAtDayOfWeekInContext";
      break;
    case 0x217uLL:
      id result = @"AppRejectsAtDayOfWeekForApp";
      break;
    case 0x218uLL:
      id result = @"AppConfirmsAtCoarseGeoHashForAppInContext";
      break;
    case 0x219uLL:
      id result = @"AppConfirmsAtCoarseGeoHashInContext";
      break;
    case 0x21AuLL:
      id result = @"AppConfirmsAtCoarseGeoHashForApp";
      break;
    case 0x21BuLL:
      id result = @"AppRejectsAtCoarseGeoHashForAppInContext";
      break;
    case 0x21CuLL:
      id result = @"AppRejectsAtCoarseGeoHashInContext";
      break;
    case 0x21DuLL:
      id result = @"AppRejectsAtCoarseGeoHashForApp";
      break;
    case 0x21EuLL:
      id result = @"AppConfirmsAtSpecificGeoHashForAppInContext";
      break;
    case 0x21FuLL:
      id result = @"AppConfirmsAtSpecificGeoHashInContext";
      break;
    case 0x220uLL:
      id result = @"AppConfirmsAtSpecificGeoHashForApp";
      break;
    case 0x221uLL:
      id result = @"AppRejectsAtSpecificGeoHashForAppInContext";
      break;
    case 0x222uLL:
      id result = @"AppRejectsAtSpecificGeoHashInContext";
      break;
    case 0x223uLL:
      id result = @"AppRejectsAtSpecificGeoHashForApp";
      break;
    case 0x224uLL:
      id result = @"AppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x225uLL:
      id result = @"AppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x226uLL:
      id result = @"AppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x227uLL:
      id result = @"AppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x228uLL:
      id result = @"CurrentTimeBucketFromZeroToTwentyFour";
      break;
    case 0x229uLL:
      id result = @"ActionsAtDayOfWeekForActionInContext";
      break;
    case 0x22AuLL:
      id result = @"ActionsAtDayOfWeekInContext";
      break;
    case 0x22BuLL:
      id result = @"ActionsAtDayOfWeekForAction";
      break;
    case 0x22CuLL:
      id result = @"ActionsAtCoarseGeoHashForActionInContext";
      break;
    case 0x22DuLL:
      id result = @"ActionsAtCoarseGeoHashInContext";
      break;
    case 0x22EuLL:
      id result = @"ActionsAtCoarseGeoHashForAction";
      break;
    case 0x22FuLL:
      id result = @"ActionsAtSpecificGeoHashForActionInContext";
      break;
    case 0x230uLL:
      id result = @"ActionsAtSpecificGeoHashInContext";
      break;
    case 0x231uLL:
      id result = @"ActionsAtSpecificGeoHashForAction";
      break;
    case 0x232uLL:
      id result = @"ActionsAtTimeOfDayForActionInContext";
      break;
    case 0x233uLL:
      id result = @"ActionsAtTimeOfDayInContext";
      break;
    case 0x234uLL:
      id result = @"ActionsAtTimeOfDayForAction";
      break;
    case 0x235uLL:
      id result = @"ActionConfirmsAtTimeOfDayForActionInContext";
      break;
    case 0x236uLL:
      id result = @"ActionConfirmsAtTimeOfDayInContext";
      break;
    case 0x237uLL:
      id result = @"ActionConfirmsAtTimeOfDayForAction";
      break;
    case 0x238uLL:
      id result = @"ActionRejectsAtTimeOfDayForActionInContext";
      break;
    case 0x239uLL:
      id result = @"ActionRejectsAtTimeOfDayInContext";
      break;
    case 0x23AuLL:
      id result = @"ActionRejectsAtTimeOfDayForAction";
      break;
    case 0x23BuLL:
      id result = @"ActionConfirmsAtDayOfWeekForActionInContext";
      break;
    case 0x23CuLL:
      id result = @"ActionConfirmsAtDayOfWeekInContext";
      break;
    case 0x23DuLL:
      id result = @"ActionConfirmsAtDayOfWeekForAction";
      break;
    case 0x23EuLL:
      id result = @"ActionRejectsAtDayOfWeekForActionInContext";
      break;
    case 0x23FuLL:
      id result = @"ActionRejectsAtDayOfWeekInContext";
      break;
    case 0x240uLL:
      id result = @"ActionRejectsAtDayOfWeekForAction";
      break;
    case 0x241uLL:
      id result = @"ActionConfirmsAtCoarseGeoHashForActionInContext";
      break;
    case 0x242uLL:
      id result = @"ActionConfirmsAtCoarseGeoHashInContext";
      break;
    case 0x243uLL:
      id result = @"ActionConfirmsAtCoarseGeoHashForAction";
      break;
    case 0x244uLL:
      id result = @"ActionRejectsAtCoarseGeoHashForActionInContext";
      break;
    case 0x245uLL:
      id result = @"ActionRejectsAtCoarseGeoHashInContext";
      break;
    case 0x246uLL:
      id result = @"ActionRejectsAtCoarseGeoHashForAction";
      break;
    case 0x247uLL:
      id result = @"ActionConfirmsAtSpecificGeoHashForActionInContext";
      break;
    case 0x248uLL:
      id result = @"ActionConfirmsAtSpecificGeoHashInContext";
      break;
    case 0x249uLL:
      id result = @"ActionConfirmsAtSpecificGeoHashForAction";
      break;
    case 0x24AuLL:
      id result = @"ActionRejectsAtSpecificGeoHashForActionInContext";
      break;
    case 0x24BuLL:
      id result = @"ActionRejectsAtSpecificGeoHashInContext";
      break;
    case 0x24CuLL:
      id result = @"ActionRejectsAtSpecificGeoHashForAction";
      break;
    case 0x24DuLL:
      id result = @"ActionsInTimeBucket0ForAction";
      break;
    case 0x24EuLL:
      id result = @"ActionsInTimeBucket1ForAction";
      break;
    case 0x24FuLL:
      id result = @"ActionsInTimeBucket2ForAction";
      break;
    case 0x250uLL:
      id result = @"ActionsInTimeBucket3ForAction";
      break;
    case 0x251uLL:
      id result = @"ActionsInTimeBucket4ForAction";
      break;
    case 0x252uLL:
      id result = @"ActionsInTimeBucket5ForAction";
      break;
    case 0x253uLL:
      id result = @"ActionsInTimeBucket6ForAction";
      break;
    case 0x254uLL:
      id result = @"ActionsInTimeBucket7ForAction";
      break;
    case 0x255uLL:
      id result = @"ActionsInTimeBucket8ForAction";
      break;
    case 0x256uLL:
      id result = @"ActionsInTimeBucket9ForAction";
      break;
    case 0x257uLL:
      id result = @"ActionsInTimeBucket10ForAction";
      break;
    case 0x258uLL:
      id result = @"ActionsInTimeBucket11ForAction";
      break;
    case 0x259uLL:
      id result = @"ActionsInTimeBucket12ForAction";
      break;
    case 0x25AuLL:
      id result = @"ActionsInTimeBucket13ForAction";
      break;
    case 0x25BuLL:
      id result = @"ActionsInTimeBucket14ForAction";
      break;
    case 0x25CuLL:
      id result = @"ActionsInTimeBucket15ForAction";
      break;
    case 0x25DuLL:
      id result = @"ActionsInTimeBucket16ForAction";
      break;
    case 0x25EuLL:
      id result = @"ActionsInTimeBucket17ForAction";
      break;
    case 0x25FuLL:
      id result = @"ActionsInTimeBucket18ForAction";
      break;
    case 0x260uLL:
      id result = @"ActionsInTimeBucket19ForAction";
      break;
    case 0x261uLL:
      id result = @"ActionsInTimeBucket20ForAction";
      break;
    case 0x262uLL:
      id result = @"ActionsInTimeBucket21ForAction";
      break;
    case 0x263uLL:
      id result = @"ActionsInTimeBucket22ForAction";
      break;
    case 0x264uLL:
      id result = @"ActionsInTimeBucket23ForAction";
      break;
    case 0x265uLL:
      id result = @"ActionsInTimeBucket24ForAction";
      break;
    case 0x266uLL:
      id result = @"ActionsOnDayOfWeekSundayForAction";
      break;
    case 0x267uLL:
      id result = @"ActionsOnDayOfWeekMondayForAction";
      break;
    case 0x268uLL:
      id result = @"ActionsOnDayOfWeekTuesdayForAction";
      break;
    case 0x269uLL:
      id result = @"ActionsOnDayOfWeekWednesdayForAction";
      break;
    case 0x26AuLL:
      id result = @"ActionsOnDayOfWeekThursdayForAction";
      break;
    case 0x26BuLL:
      id result = @"ActionsOnDayOfWeekFridayForAction";
      break;
    case 0x26CuLL:
      id result = @"ActionsOnDayOfWeekSaturdayForAction";
      break;
    case 0x26DuLL:
      id result = @"ActionsAtCoarseGeoHash0ForAction";
      break;
    case 0x26EuLL:
      id result = @"ActionsAtCoarseGeoHash1ForAction";
      break;
    case 0x26FuLL:
      id result = @"ActionsAtCoarseGeoHash2ForAction";
      break;
    case 0x270uLL:
      id result = @"ActionsAtCoarseGeoHash3ForAction";
      break;
    case 0x271uLL:
      id result = @"ActionsAtCoarseGeoHash4ForAction";
      break;
    case 0x272uLL:
      id result = @"ActionsAtCoarseGeoHash5ForAction";
      break;
    case 0x273uLL:
      id result = @"ActionsAtCoarseGeoHash6ForAction";
      break;
    case 0x274uLL:
      id result = @"ActionsAtCoarseGeoHash7ForAction";
      break;
    case 0x275uLL:
      id result = @"ActionsAtCoarseGeoHash8ForAction";
      break;
    case 0x276uLL:
      id result = @"ActionsAtCoarseGeoHash9ForAction";
      break;
    case 0x277uLL:
      id result = @"ActionsAtSpecificGeoHash0ForAction";
      break;
    case 0x278uLL:
      id result = @"ActionsAtSpecificGeoHash1ForAction";
      break;
    case 0x279uLL:
      id result = @"ActionsAtSpecificGeoHash2ForAction";
      break;
    case 0x27AuLL:
      id result = @"ActionsAtSpecificGeoHash3ForAction";
      break;
    case 0x27BuLL:
      id result = @"ActionsAtSpecificGeoHash4ForAction";
      break;
    case 0x27CuLL:
      id result = @"ActionsAtSpecificGeoHash5ForAction";
      break;
    case 0x27DuLL:
      id result = @"ActionsAtSpecificGeoHash6ForAction";
      break;
    case 0x27EuLL:
      id result = @"ActionsAtSpecificGeoHash7ForAction";
      break;
    case 0x27FuLL:
      id result = @"ActionsAtSpecificGeoHash8ForAction";
      break;
    case 0x280uLL:
      id result = @"ActionsAtSpecificGeoHash9ForAction";
      break;
    case 0x281uLL:
      id result = @"ActionsAtSpecificGeoHash10ForAction";
      break;
    case 0x282uLL:
      id result = @"ActionsAtSpecificGeoHash11ForAction";
      break;
    case 0x283uLL:
      id result = @"ActionsAtSpecificGeoHash12ForAction";
      break;
    case 0x284uLL:
      id result = @"ActionsAtSpecificGeoHash13ForAction";
      break;
    case 0x285uLL:
      id result = @"ActionsAtSpecificGeoHash14ForAction";
      break;
    case 0x286uLL:
      id result = @"ActionEntropyForTimeOfDay";
      break;
    case 0x287uLL:
      id result = @"ActionEntropyForDayOfWeek";
      break;
    case 0x288uLL:
      id result = @"ActionEntropyForCoarseGeoHash";
      break;
    case 0x289uLL:
      id result = @"ActionEntropyForSpecificGeoHash";
      break;
    case 0x28AuLL:
      id result = @"ActionNumberOfSpecificGeohashesForAction";
      break;
    case 0x28BuLL:
      id result = @"ActionNumberOfCoarseGeohashesForAction";
      break;
    case 0x28CuLL:
      id result = @"AppLaunchesAtZoom7GeoHashForAppInContext";
      break;
    case 0x28DuLL:
      id result = @"AppLaunchesAtZoom7GeoHashInContext";
      break;
    case 0x28EuLL:
      id result = @"AppLaunchesAtZoom7GeoHashForApp";
      break;
    case 0x28FuLL:
      id result = @"AppLaunchesAtZoom7GeoHash0ForApp";
      break;
    case 0x290uLL:
      id result = @"AppLaunchesAtZoom7GeoHash1ForApp";
      break;
    case 0x291uLL:
      id result = @"AppLaunchesAtZoom7GeoHash2ForApp";
      break;
    case 0x292uLL:
      id result = @"AppLaunchesAtZoom7GeoHash3ForApp";
      break;
    case 0x293uLL:
      id result = @"AppLaunchesAtZoom7GeoHash4ForApp";
      break;
    case 0x294uLL:
      id result = @"AppLaunchesAtZoom7GeoHash5ForApp";
      break;
    case 0x295uLL:
      id result = @"AppLaunchesAtZoom7GeoHash6ForApp";
      break;
    case 0x296uLL:
      id result = @"AppLaunchesAtZoom7GeoHash7ForApp";
      break;
    case 0x297uLL:
      id result = @"AppLaunchesAtZoom7GeoHash8ForApp";
      break;
    case 0x298uLL:
      id result = @"AppLaunchesAtZoom7GeoHash9ForApp";
      break;
    case 0x299uLL:
      id result = @"AppEntropyForZoom7GeoHash";
      break;
    case 0x29AuLL:
      id result = @"AppNumberOfZoom7GeohashesForApp";
      break;
    case 0x29BuLL:
      id result = @"AppGeoAssociationScoreAtZoom7";
      break;
    case 0x29CuLL:
      id result = @"AppGeoAssociationScoreAtZoom13";
      break;
    case 0x29DuLL:
      id result = @"AppGeoAssociationScoreAtZoom16";
      break;
    case 0x29EuLL:
      id result = @"AppPartOfWeekAssociationScore";
      break;
    case 0x29FuLL:
      id result = @"AppCoarseTimeAssociationScore";
      break;
    case 0x2A0uLL:
      id result = @"AppLOITypeAssociationScore";
      break;
    case 0x2A1uLL:
      id result = @"AppLaunchesAtSSIDForAppInContext";
      break;
    case 0x2A2uLL:
      id result = @"AppLaunchesAtSSIDForApp";
      break;
    case 0x2A3uLL:
      id result = @"AppLaunchesForCoreMotionForAppInContext";
      break;
    case 0x2A4uLL:
      id result = @"AppLaunchesInAirplaneModeForAppInContext";
      break;
    case 0x2A5uLL:
      id result = @"HomeScreenAppConfirmsOnDayOfWeekForAppInContext";
      break;
    case 0x2A6uLL:
      id result = @"HomeScreenAppConfirmsOnDayOfWeekInContext";
      break;
    case 0x2A7uLL:
      id result = @"HomeScreenAppConfirmsOnDayOfWeekForApp";
      break;
    case 0x2A8uLL:
      id result = @"HomeScreenAppRejectsOnDayOfWeekForAppInContext";
      break;
    case 0x2A9uLL:
      id result = @"HomeScreenAppRejectsOnDayOfWeekInContext";
      break;
    case 0x2AAuLL:
      id result = @"HomeScreenAppRejectsOnDayOfWeekForApp";
      break;
    case 0x2ABuLL:
      id result = @"HomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2ACuLL:
      id result = @"HomeScreenAppConfirmsInTwoHourTimeIntervalInContext";
      break;
    case 0x2ADuLL:
      id result = @"HomeScreenAppConfirmsInTwoHourTimeIntervalForApp";
      break;
    case 0x2AEuLL:
      id result = @"HomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2AFuLL:
      id result = @"HomeScreenAppRejectsInTwoHourTimeIntervalInContext";
      break;
    case 0x2B0uLL:
      id result = @"HomeScreenAppRejectsInTwoHourTimeIntervalForApp";
      break;
    case 0x2B1uLL:
      id result = @"HomeScreenAppConfirmsAtCoarseGeohashForAppInContext";
      break;
    case 0x2B2uLL:
      id result = @"HomeScreenAppConfirmsAtCoarseGeohashInContext";
      break;
    case 0x2B3uLL:
      id result = @"HomeScreenAppConfirmsAtCoarseGeohashForApp";
      break;
    case 0x2B4uLL:
      id result = @"HomeScreenAppRejectsAtCoarseGeohashForAppInContext";
      break;
    case 0x2B5uLL:
      id result = @"HomeScreenAppRejectsAtCoarseGeohashInContext";
      break;
    case 0x2B6uLL:
      id result = @"HomeScreenAppRejectsAtCoarseGeohashForApp";
      break;
    case 0x2B7uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificGeohashForAppInContext";
      break;
    case 0x2B8uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificGeohashInContext";
      break;
    case 0x2B9uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificGeohashForApp";
      break;
    case 0x2BAuLL:
      id result = @"HomeScreenAppRejectsAtSpecificGeohashForAppInContext";
      break;
    case 0x2BBuLL:
      id result = @"HomeScreenAppRejectsAtSpecificGeohashInContext";
      break;
    case 0x2BCuLL:
      id result = @"HomeScreenAppRejectsAtSpecificGeohashForApp";
      break;
    case 0x2BDuLL:
      id result = @"HomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2BEuLL:
      id result = @"HomeScreenAppConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2BFuLL:
      id result = @"HomeScreenAppConfirmsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C0uLL:
      id result = @"HomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2C1uLL:
      id result = @"HomeScreenAppRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2C2uLL:
      id result = @"HomeScreenAppRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C3uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2C4uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2C5uLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2C6uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2C7uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2C8uLL:
      id result = @"HomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2C9uLL:
      id result = @"HomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2CAuLL:
      id result = @"HomeScreenAppRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2CBuLL:
      id result = @"HomeScreenAppRejectsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2CCuLL:
      id result = @"HomeScreenTotalLaunchesForApp";
      break;
    case 0x2CDuLL:
      id result = @"HomeScreenTotalLaunchesForAllApps";
      break;
    case 0x2CEuLL:
      id result = @"AppDirectoryTotalLaunchesForApp";
      break;
    case 0x2CFuLL:
      id result = @"AppDirectoryTotalLaunchesForAllApps";
      break;
    case 0x2D0uLL:
      id result = @"AppDirectoryConfirmsOnDayOfWeekForAppInContext";
      break;
    case 0x2D1uLL:
      id result = @"AppDirectoryConfirmsOnDayOfWeekInContext";
      break;
    case 0x2D2uLL:
      id result = @"AppDirectoryConfirmsOnDayOfWeekForApp";
      break;
    case 0x2D3uLL:
      id result = @"AppDirectoryRejectsOnDayOfWeekForAppInContext";
      break;
    case 0x2D4uLL:
      id result = @"AppDirectoryRejectsOnDayOfWeekInContext";
      break;
    case 0x2D5uLL:
      id result = @"AppDirectoryRejectsOnDayOfWeekForApp";
      break;
    case 0x2D6uLL:
      id result = @"AppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2D7uLL:
      id result = @"AppDirectoryConfirmsInTwoHourTimeIntervalInContext";
      break;
    case 0x2D8uLL:
      id result = @"AppDirectoryConfirmsInTwoHourTimeIntervalForApp";
      break;
    case 0x2D9uLL:
      id result = @"AppDirectoryRejectsInTwoHourTimeIntervalForAppInContext";
      break;
    case 0x2DAuLL:
      id result = @"AppDirectoryRejectsInTwoHourTimeIntervalInContext";
      break;
    case 0x2DBuLL:
      id result = @"AppDirectoryRejectsInTwoHourTimeIntervalForApp";
      break;
    case 0x2DCuLL:
      id result = @"AppDirectoryConfirmsAtCoarseGeohashForAppInContext";
      break;
    case 0x2DDuLL:
      id result = @"AppDirectoryConfirmsAtCoarseGeohashInContext";
      break;
    case 0x2DEuLL:
      id result = @"AppDirectoryConfirmsAtCoarseGeohashForApp";
      break;
    case 0x2DFuLL:
      id result = @"AppDirectoryRejectsAtCoarseGeohashForAppInContext";
      break;
    case 0x2E0uLL:
      id result = @"AppDirectoryRejectsAtCoarseGeohashInContext";
      break;
    case 0x2E1uLL:
      id result = @"AppDirectoryRejectsAtCoarseGeohashForApp";
      break;
    case 0x2E2uLL:
      id result = @"AppDirectoryConfirmsAtSpecificGeohashForAppInContext";
      break;
    case 0x2E3uLL:
      id result = @"AppDirectoryConfirmsAtSpecificGeohashInContext";
      break;
    case 0x2E4uLL:
      id result = @"AppDirectoryConfirmsAtSpecificGeohashForApp";
      break;
    case 0x2E5uLL:
      id result = @"AppDirectoryRejectsAtSpecificGeohashForAppInContext";
      break;
    case 0x2E6uLL:
      id result = @"AppDirectoryRejectsAtSpecificGeohashInContext";
      break;
    case 0x2E7uLL:
      id result = @"AppDirectoryRejectsAtSpecificGeohashForApp";
      break;
    case 0x2E8uLL:
      id result = @"AppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2E9uLL:
      id result = @"AppDirectoryConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2EAuLL:
      id result = @"AppDirectoryConfirmsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2EBuLL:
      id result = @"AppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2ECuLL:
      id result = @"AppDirectoryRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2EDuLL:
      id result = @"AppDirectoryRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2EEuLL:
      id result = @"AppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext";
      break;
    case 0x2EFuLL:
      id result = @"AppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x2F0uLL:
      id result = @"AppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp";
      break;
    case 0x2F1uLL:
      id result = @"AppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2F2uLL:
      id result = @"AppDirectoryConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2F3uLL:
      id result = @"AppDirectoryConfirmsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2F4uLL:
      id result = @"AppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext";
      break;
    case 0x2F5uLL:
      id result = @"AppDirectoryRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x2F6uLL:
      id result = @"AppDirectoryRejectsAtSpecificTimeDOWLocationForApp";
      break;
    case 0x2F7uLL:
      id result = @"HomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2F8uLL:
      id result = @"HomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2F9uLL:
      id result = @"HomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FAuLL:
      id result = @"HomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2FBuLL:
      id result = @"_ATXScoreInputHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FCuLL:
      id result = @"AppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FDuLL:
      id result = @"AppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x2FEuLL:
      id result = @"AppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x2FFuLL:
      id result = @"AppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate";
      break;
    case 0x300uLL:
      id result = @"AppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate";
      break;
    case 0x301uLL:
      id result = @"IsAppClip";
      break;
    case 0x302uLL:
      id result = @"HomeScreenActionConfirmsOnDayOfWeekForActionInContext";
      break;
    case 0x303uLL:
      id result = @"HomeScreenActionConfirmsOnDayOfWeekInContext";
      break;
    case 0x304uLL:
      id result = @"HomeScreenActionConfirmsOnDayOfWeekForAction";
      break;
    case 0x305uLL:
      id result = @"HomeScreenActionConfirmsAtTimeOfDayForActionInContext";
      break;
    case 0x306uLL:
      id result = @"HomeScreenActionConfirmsAtTimeOfDayInContext";
      break;
    case 0x307uLL:
      id result = @"HomeScreenActionConfirmsAtTimeOfDayForAction";
      break;
    case 0x308uLL:
      id result = @"HomeScreenActionConfirmsAtCoarseGeohashForActionInContext";
      break;
    case 0x309uLL:
      id result = @"HomeScreenActionConfirmsAtCoarseGeohashInContext";
      break;
    case 0x30AuLL:
      id result = @"HomeScreenActionConfirmsAtCoarseGeohashForAction";
      break;
    case 0x30BuLL:
      id result = @"HomeScreenActionConfirmsAtSpecificGeohashForActionInContext";
      break;
    case 0x30CuLL:
      id result = @"HomeScreenActionConfirmsAtSpecificGeohashInContext";
      break;
    case 0x30DuLL:
      id result = @"HomeScreenActionConfirmsAtSpecificGeohashForAction";
      break;
    case 0x30EuLL:
      id result = @"HomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext";
      break;
    case 0x30FuLL:
      id result = @"HomeScreenActionConfirmsAtCoarseTimePOWLocationInContext";
      break;
    case 0x310uLL:
      id result = @"HomeScreenActionConfirmsAtCoarseTimePOWLocationForAction";
      break;
    case 0x311uLL:
      id result = @"HomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext";
      break;
    case 0x312uLL:
      id result = @"HomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x313uLL:
      id result = @"HomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction";
      break;
    case 0x314uLL:
      id result = @"HomeScreenActionRejectsOnDayOfWeekForActionInContext";
      break;
    case 0x315uLL:
      id result = @"HomeScreenActionRejectsOnDayOfWeekInContext";
      break;
    case 0x316uLL:
      id result = @"HomeScreenActionRejectsOnDayOfWeekForAction";
      break;
    case 0x317uLL:
      id result = @"HomeScreenActionRejectsAtTimeOfDayForActionInContext";
      break;
    case 0x318uLL:
      id result = @"HomeScreenActionRejectsAtTimeOfDayInContext";
      break;
    case 0x319uLL:
      id result = @"HomeScreenActionRejectsAtTimeOfDayForAction";
      break;
    case 0x31AuLL:
      id result = @"HomeScreenActionRejectsAtCoarseGeohashForActionInContext";
      break;
    case 0x31BuLL:
      id result = @"HomeScreenActionRejectsAtCoarseGeohashInContext";
      break;
    case 0x31CuLL:
      id result = @"HomeScreenActionRejectsAtCoarseGeohashForAction";
      break;
    case 0x31DuLL:
      id result = @"HomeScreenActionRejectsAtSpecificGeohashForActionInContext";
      break;
    case 0x31EuLL:
      id result = @"HomeScreenActionRejectsAtSpecificGeohashInContext";
      break;
    case 0x31FuLL:
      id result = @"HomeScreenActionRejectsAtSpecificGeohashForAction";
      break;
    case 0x320uLL:
      id result = @"HomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext";
      break;
    case 0x321uLL:
      id result = @"HomeScreenActionRejectsAtCoarseTimePOWLocationInContext";
      break;
    case 0x322uLL:
      id result = @"HomeScreenActionRejectsAtCoarseTimePOWLocationForAction";
      break;
    case 0x323uLL:
      id result = @"HomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext";
      break;
    case 0x324uLL:
      id result = @"HomeScreenActionRejectsAtSpecificTimeDOWLocationInContext";
      break;
    case 0x325uLL:
      id result = @"HomeScreenActionRejectsAtSpecificTimeDOWLocationForAction";
      break;
    case 0x326uLL:
      id result = @"POIPopularityForAppInContext";
      break;
    case 0x327uLL:
      id result = @"AppLaunchPopularityAtPOIForAppInContext";
      break;
    case 0x328uLL:
      id result = @"POICategory";
      break;
    case 0x329uLL:
      id result = @"AppLaunchesAtPOIForAppInContext";
      break;
    case 0x32AuLL:
      id result = @"AppCategoryScore";
      break;
    case 0x32BuLL:
      id result = @"PosteriorProbabilityOfAppGivenMode";
      break;
    case 0x32CuLL:
      id result = @"ClassConditionalProbabilityOfModeGivenApp";
      break;
    case 0x32DuLL:
      id result = @"UniqueOccurrencesOfAppInMode";
      break;
    case 0x32EuLL:
      id result = @"LocalOccurrencesOfAppInMode";
      break;
    case 0x32FuLL:
      id result = @"GlobalOccurrencesOfAppInMode";
      break;
    case 0x330uLL:
      id result = @"AppModeEntityScore";
      break;
    case 0x331uLL:
      id result = @"Max";
      break;
    default:
      if (a3 != 0xFFFFFFFF) {
        +[_ATXScoreTypes aggdStringForScoreInput:]((uint64_t)a2, @"AppInFolder");
      }
      id result = @"Undefined";
      break;
  }
  return result;
}

+ (id)scoreInputsToNames
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:817];
  for (uint64_t i = 0; i != 817; ++i)
  {
    v5 = [a1 aggdStringForScoreInput:i];
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (void)iterScoreInputsWithBlock:(id)a3
{
  id v3 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  uint64_t v4 = 0;
  unsigned __int8 v8 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1D25F6CC0]();
    v3[2](v3, v4, &v8);
    int v6 = v8;
    if (v6) {
      break;
    }
  }
  while (v4++ != 816);
}

+ (unint64_t)mappingForTopRankedGeoHashSignalsWithResolution:(unint64_t)a3 withRank:(unint64_t)a4 forScoreInputCategory:(unint64_t)a5
{
  if (a3 == 2) {
    return +[_ATXScoreTypes mappingForTopRankedZoom7GeoHashSignals:a4];
  }
  if (a3 == 1) {
    return +[_ATXScoreTypes mappingForTopRankedCoarseGeoHashSignals:a4 forScoreInputCategory:a5];
  }
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  return +[_ATXScoreTypes mappingForTopRankedSpecificGeoHashSignals:a4 forScoreInputCategory:a5];
}

+ (unint64_t)mappingForTimeOfDayDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  if (a4 == 1)
  {
    if (a3 >= 0x19)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3487, @"timeOfDay parameter had value %lu. It must be in the 0-%d range.", a3, 25);
    }
    return a3 + 589;
  }
  else if (a4)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a3 >= 0x19)
    {
      unsigned __int8 v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3483, @"timeOfDay parameter had value %lu. It must be in the 0-24 range (using 25 time buckets).", a3);
    }
    return a3 + 445;
  }
}

+ (unint64_t)mappingForDayOfWeekDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  v20[7] = *MEMORY[0x1E4F143B8];
  if (a3 >= 7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3498, @"dayOfWeek parameter had value %lu. It must be in the 0-6 range.", a3);
  }
  if (a4 == 1)
  {
    v17[0] = &unk_1F27EF748;
    v17[1] = &unk_1F27EF778;
    v18[0] = &unk_1F27EF898;
    v18[1] = &unk_1F27EF8B0;
    v17[2] = &unk_1F27EF7A8;
    v17[3] = &unk_1F27EF7D8;
    v18[2] = &unk_1F27EF8C8;
    v18[3] = &unk_1F27EF8E0;
    v17[4] = &unk_1F27EF808;
    v17[5] = &unk_1F27EF838;
    v18[4] = &unk_1F27EF8F8;
    v18[5] = &unk_1F27EF910;
    v17[6] = &unk_1F27EF868;
    v18[6] = &unk_1F27EF928;
    int v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = v18;
    unsigned __int8 v8 = v17;
  }
  else
  {
    if (a4) {
      return 0xFFFFFFFFLL;
    }
    v19[0] = &unk_1F27EF748;
    v19[1] = &unk_1F27EF778;
    v20[0] = &unk_1F27EF760;
    v20[1] = &unk_1F27EF790;
    v19[2] = &unk_1F27EF7A8;
    v19[3] = &unk_1F27EF7D8;
    v20[2] = &unk_1F27EF7C0;
    v20[3] = &unk_1F27EF7F0;
    v19[4] = &unk_1F27EF808;
    v19[5] = &unk_1F27EF838;
    v20[4] = &unk_1F27EF820;
    v20[5] = &unk_1F27EF850;
    v19[6] = &unk_1F27EF868;
    v20[6] = &unk_1F27EF880;
    int v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = v20;
    unsigned __int8 v8 = v19;
  }
  v9 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:7];
  v10 = [NSNumber numberWithUnsignedInteger:a3];
  v11 = [v9 objectForKeyedSubscript:v10];
  unint64_t v12 = (int)[v11 intValue];

  return v12;
}

+ (unint64_t)mappingForTopRankedSpecificGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  v20[15] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    if (a3 >= 0xF)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3555, @"Specific GeoHash rank value %lu outside of expected range (Action Prediction): 0-%d.", a3, 15);
    }
    v17[0] = &unk_1F27EF748;
    v17[1] = &unk_1F27EF778;
    v18[0] = &unk_1F27EFB68;
    v18[1] = &unk_1F27EFB80;
    v17[2] = &unk_1F27EF7A8;
    v17[3] = &unk_1F27EF7D8;
    v18[2] = &unk_1F27EFB98;
    v18[3] = &unk_1F27EFBB0;
    v17[4] = &unk_1F27EF808;
    v17[5] = &unk_1F27EF838;
    v18[4] = &unk_1F27EFBC8;
    v18[5] = &unk_1F27EFBE0;
    v17[6] = &unk_1F27EF868;
    void v17[7] = &unk_1F27EF9E8;
    v18[6] = &unk_1F27EFBF8;
    void v18[7] = &unk_1F27EFC10;
    v17[8] = &unk_1F27EFA18;
    v17[9] = &unk_1F27EFA48;
    v18[8] = &unk_1F27EFC28;
    v18[9] = &unk_1F27EFC40;
    v17[10] = &unk_1F27EFA78;
    v17[11] = &unk_1F27EFAA8;
    v18[10] = &unk_1F27EFC58;
    v18[11] = &unk_1F27EFC70;
    v17[12] = &unk_1F27EFAD8;
    v17[13] = &unk_1F27EFB08;
    v18[12] = &unk_1F27EFC88;
    v18[13] = &unk_1F27EFCA0;
    v17[14] = &unk_1F27EFB38;
    v18[14] = &unk_1F27EFCB8;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned __int8 v8 = v18;
    v9 = v17;
  }
  else
  {
    if (a4) {
      return 0xFFFFFFFFLL;
    }
    if (a3 >= 0xF)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3534, @"Specific GeoHash rank value %lu outside of expected range (App Prediction): 0-%d.", a3, 15);
    }
    v19[0] = &unk_1F27EF748;
    v19[1] = &unk_1F27EF778;
    v20[0] = &unk_1F27EF940;
    v20[1] = &unk_1F27EF958;
    v19[2] = &unk_1F27EF7A8;
    v19[3] = &unk_1F27EF7D8;
    v20[2] = &unk_1F27EF970;
    v20[3] = &unk_1F27EF988;
    v19[4] = &unk_1F27EF808;
    v19[5] = &unk_1F27EF838;
    v20[4] = &unk_1F27EF9A0;
    v20[5] = &unk_1F27EF9B8;
    v19[6] = &unk_1F27EF868;
    void v19[7] = &unk_1F27EF9E8;
    v20[6] = &unk_1F27EF9D0;
    v20[7] = &unk_1F27EFA00;
    v19[8] = &unk_1F27EFA18;
    v19[9] = &unk_1F27EFA48;
    void v20[8] = &unk_1F27EFA30;
    v20[9] = &unk_1F27EFA60;
    v19[10] = &unk_1F27EFA78;
    v19[11] = &unk_1F27EFAA8;
    v20[10] = &unk_1F27EFA90;
    v20[11] = &unk_1F27EFAC0;
    v19[12] = &unk_1F27EFAD8;
    v19[13] = &unk_1F27EFB08;
    v20[12] = &unk_1F27EFAF0;
    v20[13] = &unk_1F27EFB20;
    v19[14] = &unk_1F27EFB38;
    v20[14] = &unk_1F27EFB50;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned __int8 v8 = v20;
    v9 = v19;
  }
  v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:15];
  v11 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v12 = [v10 objectForKeyedSubscript:v11];
  unint64_t v13 = (int)[v12 intValue];

  return v13;
}

+ (unint64_t)mappingForTopRankedCoarseGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  v20[10] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    if (a3 >= 0xA)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3601, @"Coarse GeoHash rank value %lu outside of expected range (Action Prediction): 0-%d.", a3, 10);
    }
    v17[0] = &unk_1F27EF748;
    v17[1] = &unk_1F27EF778;
    v18[0] = &unk_1F27EFDC0;
    v18[1] = &unk_1F27EFDD8;
    v17[2] = &unk_1F27EF7A8;
    v17[3] = &unk_1F27EF7D8;
    v18[2] = &unk_1F27EFDF0;
    v18[3] = &unk_1F27EFE08;
    v17[4] = &unk_1F27EF808;
    v17[5] = &unk_1F27EF838;
    v18[4] = &unk_1F27EFE20;
    v18[5] = &unk_1F27EFE38;
    v17[6] = &unk_1F27EF868;
    void v17[7] = &unk_1F27EF9E8;
    v18[6] = &unk_1F27EFE50;
    void v18[7] = &unk_1F27EFE68;
    v17[8] = &unk_1F27EFA18;
    v17[9] = &unk_1F27EFA48;
    v18[8] = &unk_1F27EFE80;
    v18[9] = &unk_1F27EFE98;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned __int8 v8 = v18;
    v9 = v17;
  }
  else
  {
    if (a4) {
      return 0xFFFFFFFFLL;
    }
    if (a3 >= 0xA)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3585, @"Coarse GeoHash rank value %lu outside of expected range (App Prediction): 0-%d.", a3, 10);
    }
    v19[0] = &unk_1F27EF748;
    v19[1] = &unk_1F27EF778;
    v20[0] = &unk_1F27EFCD0;
    v20[1] = &unk_1F27EFCE8;
    v19[2] = &unk_1F27EF7A8;
    v19[3] = &unk_1F27EF7D8;
    v20[2] = &unk_1F27EFD00;
    v20[3] = &unk_1F27EFD18;
    v19[4] = &unk_1F27EF808;
    v19[5] = &unk_1F27EF838;
    v20[4] = &unk_1F27EFD30;
    v20[5] = &unk_1F27EFD48;
    v19[6] = &unk_1F27EF868;
    void v19[7] = &unk_1F27EF9E8;
    v20[6] = &unk_1F27EFD60;
    v20[7] = &unk_1F27EFD78;
    v19[8] = &unk_1F27EFA18;
    v19[9] = &unk_1F27EFA48;
    void v20[8] = &unk_1F27EFD90;
    v20[9] = &unk_1F27EFDA8;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned __int8 v8 = v20;
    v9 = v19;
  }
  v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:10];
  v11 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v12 = [v10 objectForKeyedSubscript:v11];
  unint64_t v13 = (int)[v12 intValue];

  return v13;
}

+ (unint64_t)mappingForTopRankedZoom7GeoHashSignals:(unint64_t)a3
{
  v13[10] = *MEMORY[0x1E4F143B8];
  if (a3 >= 0xA)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_ATXScoreTypes.m", 3624, @"Coarse GeoHash rank value %lu outside of expected range (App Prediction): 0-%d.", a3, 10);
  }
  v12[0] = &unk_1F27EF748;
  v12[1] = &unk_1F27EF778;
  v13[0] = &unk_1F27EFEB0;
  v13[1] = &unk_1F27EFEC8;
  v12[2] = &unk_1F27EF7A8;
  v12[3] = &unk_1F27EF7D8;
  v13[2] = &unk_1F27EFEE0;
  v13[3] = &unk_1F27EFEF8;
  v12[4] = &unk_1F27EF808;
  v12[5] = &unk_1F27EF838;
  v13[4] = &unk_1F27EFF10;
  v13[5] = &unk_1F27EFF28;
  v12[6] = &unk_1F27EF868;
  v12[7] = &unk_1F27EF9E8;
  v13[6] = &unk_1F27EFF40;
  v13[7] = &unk_1F27EFF58;
  v12[8] = &unk_1F27EFA18;
  v12[9] = &unk_1F27EFA48;
  v13[8] = &unk_1F27EFF70;
  v13[9] = &unk_1F27EFF88;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:10];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  int v6 = [v4 objectForKeyedSubscript:v5];
  int v7 = [v6 intValue];

  return v7;
}

+ (void)stringForScoreInput:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1 object:a2 file:@"_ATXScoreTypes.m" lineNumber:1711 description:@"ATXScoreInput out of range"];

  __break(1u);
}

+ (void)aggdStringForScoreInput:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1 object:a2 file:@"_ATXScoreTypes.m" lineNumber:3441 description:@"Score input out of range"];

  __break(1u);
}

@end