@interface CSLIconPositionsStore
- (CSLIconPositionsStore)init;
- (CSLIconPostionsStoreDelegate)delegate;
- (id)_loadLocalPositionsUsingKey:(id)a3;
- (id)_loadPositionsFromObject:(id)a3 usingKey:(id)a4;
- (id)_loadPositionsUsingKey:(id)a3;
- (id)archivalPositionsObjectForGraph:(id)a3;
- (id)defaultOrderingForConfiguration:(int64_t)a3;
- (id)loadDefaultPositionsForConfiguration:(int64_t)a3;
- (id)loadDefaultPositionsVerticalOnly:(BOOL)a3;
- (id)loadDefaultVerticalOnlyPositions;
- (id)loadLegacyDefaultPositions;
- (id)loadPositions;
- (id)loadTargetPositions;
- (id)orderedBundleIdentifiers;
- (int64_t)deviceConfiguration;
- (void)_saveLocalPositions:(id)a3 usingKey:(id)a4;
- (void)_savePositions:(id)a3 usingKey:(id)a4;
- (void)actionsOnInitialSyncComplete;
- (void)archivePositionsToDiagnostics:(id)a3;
- (void)dealloc;
- (void)initialSyncComplete;
- (void)moveIconsToTopWithBundleIdentifiers:(id)a3;
- (void)positionsChanged;
- (void)resetIconPositionsToConfiguration:(int64_t)a3;
- (void)savePositions:(id)a3;
- (void)saveTargetPositions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSLIconPositionsStore

- (CSLIconPositionsStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLIconPositionsStore;
  v2 = [(CSLIconPositionsStore *)&v9 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1B378, @"CSLIconPositionsChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v2->_initialSyncComplete = 0;
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_1B380, kNPSInitialSyncCompletionDarwinNotification, 0, (CFNotificationSuspensionBehavior)0);
    int v7 = NPSHasCompletedInitialSync();
    v2->_initialSyncComplete = v7;
    if (v7) {
      [(CSLIconPositionsStore *)v2 actionsOnInitialSyncComplete];
    }
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (self->_initialSyncComplete) {
      [(CSLIconPositionsStore *)self actionsOnInitialSyncComplete];
    }
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kNPSInitialSyncCompletionDarwinNotification, 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"CSLIconPositionsChangedNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)CSLIconPositionsStore;
  [(CSLIconPositionsStore *)&v5 dealloc];
}

- (void)initialSyncComplete
{
  if (!self->_initialSyncComplete)
  {
    self->_initialSyncComplete = 1;
    [(CSLIconPositionsStore *)self actionsOnInitialSyncComplete];
  }
}

- (void)actionsOnInitialSyncComplete
{
  id v3 = [(CSLIconPositionsStore *)self delegate];
  [v3 store:self initialSyncComplete:1];
}

- (id)loadDefaultPositionsVerticalOnly:(BOOL)a3
{
  if (a3) {
    [(CSLIconPositionsStore *)self loadDefaultVerticalOnlyPositions];
  }
  else {
  id v3 = [(CSLIconPositionsStore *)self loadLegacyDefaultPositions];
  }

  return v3;
}

- (id)defaultOrderingForConfiguration:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v101[0] = kNanoPhoneBundleIdentifier;
      v101[1] = kMailBundleIdentifier;
      v101[2] = kMessagesAppBundleIdentifier;
      v101[3] = kMindBundleIdentifier;
      v101[4] = kActivityAppBundleIdentifier;
      v101[5] = kSessionTrackerAppBundleIdentifier;
      v101[6] = kSettingsBundleIdentifier;
      v101[7] = kNanoTimerBundleIdentifier;
      v101[8] = kCalendarBundleIdentifier;
      v101[9] = kNanoStopwatchBundleIdentifier;
      v101[10] = kWorldClockBundleIdentifier;
      v101[11] = kMapsAppBundleIdentifier;
      v101[12] = kWeatherBundleIdentifier;
      v101[13] = kNanoAlarmBundleIdentifier;
      v101[14] = kCompassBundleIdentifier;
      v101[15] = kNanoPhotosBundleIdentifier;
      v101[16] = kSleepBundleIdentifier;
      v101[17] = kAudiobooksBundleIdentifier;
      v101[18] = kMusicBundleIdentifier;
      v101[19] = kHeartRhythmBundleIdentifier;
      v101[20] = kHeartAppBundleIdentifier;
      v101[21] = kPodcastsBundleIdentifier;
      v101[22] = kMedicationsBundleIdentifier;
      v101[23] = kVitalsBundleIdentifier;
      v101[24] = kStocksBundleIdentifier;
      v101[25] = kOxygenSaturationBundleIdentifier;
      v101[26] = kNoiseBundleIdentifier;
      v101[27] = kMenstrualCyclesBundleIdentifier;
      v101[28] = kNewsBundleIdentifier;
      v101[29] = kTranslateBundleIdentifier;
      v101[30] = kPassbookBundleIdentifier;
      v101[31] = kCameraBundleIdentifier;
      v101[32] = kHomeBundleIdentifier;
      v101[33] = kTidesBundleIdentifier;
      v101[34] = kCalculatorBundleIdentifier;
      v101[35] = kFindMyItemsBundleIdentifier;
      v101[36] = kFindMyDevicesBundleIdentifier;
      v101[37] = kFindMyPeopleBundleIdentifier;
      v101[38] = kAppStoreBundleIdentifier;
      v101[39] = kVoiceMemosIdentifier;
      v101[40] = kContactsBundleIdentifier;
      v101[41] = kTinCanBundleIdentifier;
      v101[42] = kTipsBundleIdentifier;
      v101[43] = kMemojiEditorBundleIdentifier;
      v101[44] = kRemindersBundleIdentifier;
      v101[45] = kShortcutsBundleIdentifier;
      v101[46] = kNowPlayingAppBundleIdentifer;
      v101[47] = kNanoMusicRecognitionBundleIdentifier;
      v101[48] = kRemoteBundleIdentifier;
      id v3 = v101;
      goto LABEL_7;
    case 1:
      v100[0] = kNanoPhoneBundleIdentifier;
      v100[1] = kMailBundleIdentifier;
      v100[2] = kMessagesAppBundleIdentifier;
      v100[3] = kMindBundleIdentifier;
      v100[4] = kActivityAppBundleIdentifier;
      v100[5] = kSessionTrackerAppBundleIdentifier;
      v100[6] = kSettingsBundleIdentifier;
      v100[7] = kNanoTimerBundleIdentifier;
      v100[8] = kCalendarBundleIdentifier;
      v100[9] = kNanoStopwatchBundleIdentifier;
      v100[10] = kWorldClockBundleIdentifier;
      v100[11] = kMapsAppBundleIdentifier;
      v100[12] = kWeatherBundleIdentifier;
      v100[13] = kNanoAlarmBundleIdentifier;
      v100[14] = kCompassBundleIdentifier;
      v100[15] = kNanoPhotosBundleIdentifier;
      v100[16] = kSleepBundleIdentifier;
      v100[17] = kAudiobooksBundleIdentifier;
      v100[18] = kMusicBundleIdentifier;
      v100[19] = kHeartRhythmBundleIdentifier;
      v100[20] = kHeartAppBundleIdentifier;
      v100[21] = kPodcastsBundleIdentifier;
      v100[22] = kMedicationsBundleIdentifier;
      v100[23] = kVitalsBundleIdentifier;
      v100[24] = kStocksBundleIdentifier;
      v100[25] = kNewsBundleIdentifier;
      v100[26] = kNoiseBundleIdentifier;
      v100[27] = kMenstrualCyclesBundleIdentifier;
      v100[28] = kHomeBundleIdentifier;
      v100[29] = kTranslateBundleIdentifier;
      v100[30] = kPassbookBundleIdentifier;
      v100[31] = kCameraBundleIdentifier;
      v100[32] = kRemindersBundleIdentifier;
      v100[33] = kTidesBundleIdentifier;
      v100[34] = kCalculatorBundleIdentifier;
      v100[35] = kFindMyItemsBundleIdentifier;
      v100[36] = kFindMyDevicesBundleIdentifier;
      v100[37] = kFindMyPeopleBundleIdentifier;
      v100[38] = kAppStoreBundleIdentifier;
      v100[39] = kVoiceMemosIdentifier;
      v100[40] = kContactsBundleIdentifier;
      v100[41] = kTinCanBundleIdentifier;
      v100[42] = kTipsBundleIdentifier;
      v100[43] = kMemojiEditorBundleIdentifier;
      v100[44] = kRemoteBundleIdentifier;
      v100[45] = kShortcutsBundleIdentifier;
      v100[46] = kNowPlayingAppBundleIdentifer;
      v100[47] = kNanoMusicRecognitionBundleIdentifier;
      id v3 = v100;
      uint64_t v4 = 48;
      goto LABEL_13;
    case 2:
      v99[0] = kNanoPhoneBundleIdentifier;
      v99[1] = kMailBundleIdentifier;
      v99[2] = kMessagesAppBundleIdentifier;
      v99[3] = kMindBundleIdentifier;
      v99[4] = kActivityAppBundleIdentifier;
      v99[5] = kSessionTrackerAppBundleIdentifier;
      v99[6] = kSettingsBundleIdentifier;
      v99[7] = kNanoTimerBundleIdentifier;
      v99[8] = kCalendarBundleIdentifier;
      v99[9] = kNanoStopwatchBundleIdentifier;
      v99[10] = kWorldClockBundleIdentifier;
      v99[11] = kMapsAppBundleIdentifier;
      v99[12] = kWeatherBundleIdentifier;
      v99[13] = kNanoAlarmBundleIdentifier;
      v99[14] = kCompassBundleIdentifier;
      v99[15] = kNanoPhotosBundleIdentifier;
      v99[16] = kHeartAppBundleIdentifier;
      v99[17] = kPodcastsBundleIdentifier;
      v99[18] = kMusicBundleIdentifier;
      v99[19] = kContactsBundleIdentifier;
      v99[20] = kNoiseBundleIdentifier;
      v99[21] = kVoiceMemosIdentifier;
      v99[22] = kCalculatorBundleIdentifier;
      v99[23] = kTranslateBundleIdentifier;
      v99[24] = kTipsBundleIdentifier;
      v99[25] = kPassbookBundleIdentifier;
      v99[26] = kTidesBundleIdentifier;
      v99[27] = kRemindersBundleIdentifier;
      v99[28] = kFindMyItemsBundleIdentifier;
      v99[29] = kFindMyDevicesBundleIdentifier;
      v99[30] = kFindMyPeopleBundleIdentifier;
      v99[31] = kAppStoreBundleIdentifier;
      v99[32] = kMemojiEditorBundleIdentifier;
      v99[33] = kTinCanBundleIdentifier;
      v99[34] = kStocksBundleIdentifier;
      v99[35] = kNanoMusicRecognitionBundleIdentifier;
      v99[36] = kNowPlayingAppBundleIdentifer;
      id v3 = v99;
      uint64_t v4 = 37;
      goto LABEL_13;
    case 3:
      v98[0] = kNanoPhoneBundleIdentifier;
      v98[1] = kMailBundleIdentifier;
      v98[2] = kMessagesAppBundleIdentifier;
      v98[3] = kMindBundleIdentifier;
      v98[4] = kActivityAppBundleIdentifier;
      v98[5] = kSessionTrackerAppBundleIdentifier;
      v98[6] = kSettingsBundleIdentifier;
      v98[7] = kNanoTimerBundleIdentifier;
      v98[8] = kCalendarBundleIdentifier;
      v98[9] = kNanoStopwatchBundleIdentifier;
      v98[10] = kWorldClockBundleIdentifier;
      v98[11] = kMapsAppBundleIdentifier;
      v98[12] = kWeatherBundleIdentifier;
      v98[13] = kNanoAlarmBundleIdentifier;
      v98[14] = kCompassBundleIdentifier;
      v98[15] = kNanoPhotosBundleIdentifier;
      v98[16] = kSleepBundleIdentifier;
      v98[17] = kAudiobooksBundleIdentifier;
      v98[18] = kMusicBundleIdentifier;
      v98[19] = kHeartRhythmBundleIdentifier;
      v98[20] = kHeartAppBundleIdentifier;
      v98[21] = kPodcastsBundleIdentifier;
      v98[22] = kMedicationsBundleIdentifier;
      v98[23] = kVitalsBundleIdentifier;
      v98[24] = kStocksBundleIdentifier;
      v98[25] = kOxygenSaturationBundleIdentifier;
      v98[26] = kNoiseBundleIdentifier;
      v98[27] = kMenstrualCyclesBundleIdentifier;
      v98[28] = kNewsBundleIdentifier;
      v98[29] = kTranslateBundleIdentifier;
      v98[30] = kPassbookBundleIdentifier;
      v98[31] = kCameraBundleIdentifier;
      v98[32] = kDepthBundleIdentifier;
      v98[33] = kTidesBundleIdentifier;
      v98[34] = kCalculatorBundleIdentifier;
      v98[35] = kFindMyItemsBundleIdentifier;
      v98[36] = kFindMyDevicesBundleIdentifier;
      v98[37] = kFindMyPeopleBundleIdentifier;
      v98[38] = kAppStoreBundleIdentifier;
      v98[39] = kHomeBundleIdentifier;
      v98[40] = kContactsBundleIdentifier;
      v98[41] = kTinCanBundleIdentifier;
      v98[42] = kTipsBundleIdentifier;
      v98[43] = kMemojiEditorBundleIdentifier;
      v98[44] = kRemindersBundleIdentifier;
      v98[45] = kShortcutsBundleIdentifier;
      v98[46] = kNowPlayingAppBundleIdentifer;
      v98[47] = kNanoMusicRecognitionBundleIdentifier;
      v98[48] = kVoiceMemosIdentifier;
      v98[49] = kRemoteBundleIdentifier;
      id v3 = v98;
      goto LABEL_11;
    case 4:
      v97[0] = kNanoPhoneBundleIdentifier;
      v97[1] = kMailBundleIdentifier;
      v97[2] = kMessagesAppBundleIdentifier;
      v97[3] = kMindBundleIdentifier;
      v97[4] = kActivityAppBundleIdentifier;
      v97[5] = kSessionTrackerAppBundleIdentifier;
      v97[6] = kSettingsBundleIdentifier;
      v97[7] = kNanoTimerBundleIdentifier;
      v97[8] = kCalendarBundleIdentifier;
      v97[9] = kNanoStopwatchBundleIdentifier;
      v97[10] = kWorldClockBundleIdentifier;
      v97[11] = kMapsAppBundleIdentifier;
      v97[12] = kWeatherBundleIdentifier;
      v97[13] = kNanoAlarmBundleIdentifier;
      v97[14] = kCompassBundleIdentifier;
      v97[15] = kNanoPhotosBundleIdentifier;
      v97[16] = kSleepBundleIdentifier;
      v97[17] = kAudiobooksBundleIdentifier;
      v97[18] = kMusicBundleIdentifier;
      v97[19] = kHeartRhythmBundleIdentifier;
      v97[20] = kHeartAppBundleIdentifier;
      v97[21] = kPodcastsBundleIdentifier;
      v97[22] = kMedicationsBundleIdentifier;
      v97[23] = kVitalsBundleIdentifier;
      v97[24] = kStocksBundleIdentifier;
      v97[25] = kNewsBundleIdentifier;
      v97[26] = kNoiseBundleIdentifier;
      v97[27] = kMenstrualCyclesBundleIdentifier;
      v97[28] = kHomeBundleIdentifier;
      v97[29] = kTranslateBundleIdentifier;
      v97[30] = kPassbookBundleIdentifier;
      v97[31] = kCameraBundleIdentifier;
      v97[32] = kDepthBundleIdentifier;
      v97[33] = kTidesBundleIdentifier;
      v97[34] = kCalculatorBundleIdentifier;
      v97[35] = kFindMyItemsBundleIdentifier;
      v97[36] = kFindMyDevicesBundleIdentifier;
      v97[37] = kFindMyPeopleBundleIdentifier;
      v97[38] = kAppStoreBundleIdentifier;
      v97[39] = kRemindersBundleIdentifier;
      v97[40] = kContactsBundleIdentifier;
      v97[41] = kTinCanBundleIdentifier;
      v97[42] = kTipsBundleIdentifier;
      v97[43] = kMemojiEditorBundleIdentifier;
      v97[44] = kRemoteBundleIdentifier;
      v97[45] = kShortcutsBundleIdentifier;
      v97[46] = kNowPlayingAppBundleIdentifer;
      v97[47] = kNanoMusicRecognitionBundleIdentifier;
      v97[48] = kVoiceMemosIdentifier;
      id v3 = v97;
LABEL_7:
      uint64_t v4 = 49;
      goto LABEL_13;
    case 5:
      v96[0] = kNanoPhoneBundleIdentifier;
      v96[1] = kMailBundleIdentifier;
      v96[2] = kMessagesAppBundleIdentifier;
      v96[3] = kMindBundleIdentifier;
      v96[4] = kActivityAppBundleIdentifier;
      v96[5] = kSessionTrackerAppBundleIdentifier;
      v96[6] = kSettingsBundleIdentifier;
      v96[7] = kNanoTimerBundleIdentifier;
      v96[8] = kCalendarBundleIdentifier;
      v96[9] = kNanoStopwatchBundleIdentifier;
      v96[10] = kWorldClockBundleIdentifier;
      v96[11] = kMapsAppBundleIdentifier;
      v96[12] = kWeatherBundleIdentifier;
      v96[13] = kNanoAlarmBundleIdentifier;
      v96[14] = kCompassBundleIdentifier;
      v96[15] = kNanoPhotosBundleIdentifier;
      v96[16] = kHeartAppBundleIdentifier;
      v96[17] = kPodcastsBundleIdentifier;
      v96[18] = kMusicBundleIdentifier;
      v96[19] = kContactsBundleIdentifier;
      v96[20] = kNoiseBundleIdentifier;
      v96[21] = kVoiceMemosIdentifier;
      v96[22] = kCalculatorBundleIdentifier;
      v96[23] = kTranslateBundleIdentifier;
      v96[24] = kTipsBundleIdentifier;
      v96[25] = kPassbookBundleIdentifier;
      v96[26] = kTidesBundleIdentifier;
      v96[27] = kDepthBundleIdentifier;
      v96[28] = kFindMyItemsBundleIdentifier;
      v96[29] = kFindMyDevicesBundleIdentifier;
      v96[30] = kFindMyPeopleBundleIdentifier;
      v96[31] = kAppStoreBundleIdentifier;
      v96[32] = kMemojiEditorBundleIdentifier;
      v96[33] = kRemindersBundleIdentifier;
      v96[34] = kTinCanBundleIdentifier;
      v96[35] = kNanoMusicRecognitionBundleIdentifier;
      v96[36] = kNowPlayingAppBundleIdentifer;
      v96[37] = kStocksBundleIdentifier;
      id v3 = v96;
      uint64_t v4 = 38;
      goto LABEL_13;
    case 6:
      v95[0] = kNanoPhoneBundleIdentifier;
      v95[1] = kMailBundleIdentifier;
      v95[2] = kMessagesAppBundleIdentifier;
      v95[3] = kMindBundleIdentifier;
      v95[4] = kActivityAppBundleIdentifier;
      v95[5] = kSessionTrackerAppBundleIdentifier;
      v95[6] = kSettingsBundleIdentifier;
      v95[7] = kNanoTimerBundleIdentifier;
      v95[8] = kCalendarBundleIdentifier;
      v95[9] = kNanoStopwatchBundleIdentifier;
      v95[10] = kWorldClockBundleIdentifier;
      v95[11] = kMapsAppBundleIdentifier;
      v95[12] = kWeatherBundleIdentifier;
      v95[13] = kNanoAlarmBundleIdentifier;
      v95[14] = kTidesBundleIdentifier;
      v95[15] = kDepthBundleIdentifier;
      v95[16] = kCompassBundleIdentifier;
      v95[17] = kAudiobooksBundleIdentifier;
      v95[18] = kMusicBundleIdentifier;
      v95[19] = kHeartRhythmBundleIdentifier;
      v95[20] = kHeartAppBundleIdentifier;
      v95[21] = kPodcastsBundleIdentifier;
      v95[22] = kSleepBundleIdentifier;
      v95[23] = kVitalsBundleIdentifier;
      v95[24] = kNanoPhotosBundleIdentifier;
      v95[25] = kOxygenSaturationBundleIdentifier;
      v95[26] = kNoiseBundleIdentifier;
      v95[27] = kMenstrualCyclesBundleIdentifier;
      v95[28] = kNewsBundleIdentifier;
      v95[29] = kTranslateBundleIdentifier;
      v95[30] = kMedicationsBundleIdentifier;
      v95[31] = kCameraBundleIdentifier;
      v95[32] = kHomeBundleIdentifier;
      v95[33] = kMandrakeBundleIdentifier;
      v95[34] = kCalculatorBundleIdentifier;
      v95[35] = kFindMyItemsBundleIdentifier;
      v95[36] = kFindMyDevicesBundleIdentifier;
      v95[37] = kFindMyPeopleBundleIdentifier;
      v95[38] = kAppStoreBundleIdentifier;
      v95[39] = kPassbookBundleIdentifier;
      v95[40] = kStocksBundleIdentifier;
      v95[41] = kContactsBundleIdentifier;
      v95[42] = kTipsBundleIdentifier;
      v95[43] = kMemojiEditorBundleIdentifier;
      v95[44] = kRemindersBundleIdentifier;
      v95[45] = kShortcutsBundleIdentifier;
      v95[46] = kNowPlayingAppBundleIdentifer;
      v95[47] = kNanoMusicRecognitionBundleIdentifier;
      v95[48] = kVoiceMemosIdentifier;
      v95[49] = kTinCanBundleIdentifier;
      v95[50] = kRemoteBundleIdentifier;
      id v3 = v95;
      uint64_t v4 = 51;
      goto LABEL_13;
    case 7:
      uint64_t v45 = kNanoPhoneBundleIdentifier;
      uint64_t v46 = kMailBundleIdentifier;
      uint64_t v47 = kMessagesAppBundleIdentifier;
      uint64_t v48 = kMindBundleIdentifier;
      uint64_t v49 = kActivityAppBundleIdentifier;
      uint64_t v50 = kSessionTrackerAppBundleIdentifier;
      uint64_t v51 = kSettingsBundleIdentifier;
      uint64_t v52 = kNanoTimerBundleIdentifier;
      uint64_t v53 = kCalendarBundleIdentifier;
      uint64_t v54 = kNanoStopwatchBundleIdentifier;
      uint64_t v55 = kWorldClockBundleIdentifier;
      uint64_t v56 = kMapsAppBundleIdentifier;
      uint64_t v57 = kWeatherBundleIdentifier;
      uint64_t v58 = kNanoAlarmBundleIdentifier;
      uint64_t v59 = kTidesBundleIdentifier;
      uint64_t v60 = kDepthBundleIdentifier;
      uint64_t v61 = kCompassBundleIdentifier;
      uint64_t v62 = kAudiobooksBundleIdentifier;
      uint64_t v63 = kMusicBundleIdentifier;
      uint64_t v64 = kHeartRhythmBundleIdentifier;
      uint64_t v65 = kHeartAppBundleIdentifier;
      uint64_t v66 = kPodcastsBundleIdentifier;
      uint64_t v67 = kSleepBundleIdentifier;
      uint64_t v68 = kVitalsBundleIdentifier;
      uint64_t v69 = kNanoPhotosBundleIdentifier;
      uint64_t v70 = kNewsBundleIdentifier;
      uint64_t v71 = kNoiseBundleIdentifier;
      uint64_t v72 = kMenstrualCyclesBundleIdentifier;
      uint64_t v73 = kHomeBundleIdentifier;
      uint64_t v74 = kTranslateBundleIdentifier;
      uint64_t v75 = kMedicationsBundleIdentifier;
      uint64_t v76 = kCameraBundleIdentifier;
      uint64_t v77 = kPassbookBundleIdentifier;
      uint64_t v78 = kMandrakeBundleIdentifier;
      uint64_t v79 = kCalculatorBundleIdentifier;
      uint64_t v80 = kFindMyItemsBundleIdentifier;
      uint64_t v81 = kFindMyDevicesBundleIdentifier;
      uint64_t v82 = kFindMyPeopleBundleIdentifier;
      uint64_t v83 = kAppStoreBundleIdentifier;
      uint64_t v84 = kStocksBundleIdentifier;
      uint64_t v85 = kContactsBundleIdentifier;
      uint64_t v86 = kTinCanBundleIdentifier;
      uint64_t v87 = kTipsBundleIdentifier;
      uint64_t v88 = kMemojiEditorBundleIdentifier;
      uint64_t v89 = kRemindersBundleIdentifier;
      uint64_t v90 = kShortcutsBundleIdentifier;
      uint64_t v91 = kNowPlayingAppBundleIdentifer;
      uint64_t v92 = kNanoMusicRecognitionBundleIdentifier;
      uint64_t v93 = kVoiceMemosIdentifier;
      uint64_t v94 = kRemoteBundleIdentifier;
      id v3 = &v45;
LABEL_11:
      uint64_t v4 = 50;
      goto LABEL_13;
    case 8:
      uint64_t v6 = kNanoPhoneBundleIdentifier;
      uint64_t v7 = kMailBundleIdentifier;
      uint64_t v8 = kMessagesAppBundleIdentifier;
      uint64_t v9 = kMindBundleIdentifier;
      uint64_t v10 = kActivityAppBundleIdentifier;
      uint64_t v11 = kSessionTrackerAppBundleIdentifier;
      uint64_t v12 = kSettingsBundleIdentifier;
      uint64_t v13 = kNanoTimerBundleIdentifier;
      uint64_t v14 = kCalendarBundleIdentifier;
      uint64_t v15 = kNanoStopwatchBundleIdentifier;
      uint64_t v16 = kWorldClockBundleIdentifier;
      uint64_t v17 = kMapsAppBundleIdentifier;
      uint64_t v18 = kWeatherBundleIdentifier;
      uint64_t v19 = kNanoAlarmBundleIdentifier;
      uint64_t v20 = kTidesBundleIdentifier;
      uint64_t v21 = kDepthBundleIdentifier;
      uint64_t v22 = kCompassBundleIdentifier;
      uint64_t v23 = kPodcastsBundleIdentifier;
      uint64_t v24 = kMusicBundleIdentifier;
      uint64_t v25 = kNanoPhotosBundleIdentifier;
      uint64_t v26 = kHeartAppBundleIdentifier;
      uint64_t v27 = kVoiceMemosIdentifier;
      uint64_t v28 = kCalculatorBundleIdentifier;
      uint64_t v29 = kNoiseBundleIdentifier;
      uint64_t v30 = kMandrakeBundleIdentifier;
      uint64_t v31 = kPassbookBundleIdentifier;
      uint64_t v32 = kTranslateBundleIdentifier;
      uint64_t v33 = kContactsBundleIdentifier;
      uint64_t v34 = kFindMyItemsBundleIdentifier;
      uint64_t v35 = kFindMyDevicesBundleIdentifier;
      uint64_t v36 = kFindMyPeopleBundleIdentifier;
      uint64_t v37 = kAppStoreBundleIdentifier;
      uint64_t v38 = kMemojiEditorBundleIdentifier;
      uint64_t v39 = kRemindersBundleIdentifier;
      uint64_t v40 = kTinCanBundleIdentifier;
      uint64_t v41 = kNanoMusicRecognitionBundleIdentifier;
      uint64_t v42 = kNowPlayingAppBundleIdentifer;
      uint64_t v43 = kStocksBundleIdentifier;
      uint64_t v44 = kTipsBundleIdentifier;
      id v3 = &v6;
      uint64_t v4 = 39;
LABEL_13:
      +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
        v21,
        v22,
        v23,
        v24,
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42,
        v43,
        v44,
        v45,
        v46,
        v47,
        v48,
        v49,
        v50,
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        v58,
        v59,
        v60,
        v61,
        v62,
        v63,
        v64);
      self = (CSLIconPositionsStore *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (int64_t)deviceConfiguration
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  objc_super v5 = [v4 firstObject];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  unsigned int v7 = [v5 supportsCapability:v6];

  int IsTinker = CSLPairingIsTinker();
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
  unsigned int v10 = [v5 supportsCapability:v9];

  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
  if ([v5 supportsCapability:v11])
  {
    unsigned int v12 = v7 ^ 1;
  }
  else
  {
    id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AB8F4061-4873-40AF-9613-C8A97D0921F2"];
    unsigned int v12 = [v5 supportsCapability:v13] & (v7 ^ 1);
  }
  if (v7)
  {
    uint64_t v14 = 7;
    if (IsTinker) {
      uint64_t v14 = 8;
    }
    BOOL v15 = v10 == 0;
    uint64_t v16 = 6;
LABEL_12:
    if (v15) {
      int64_t v17 = v14;
    }
    else {
      int64_t v17 = v16;
    }
    goto LABEL_20;
  }
  if (v12)
  {
    uint64_t v14 = 4;
    if (IsTinker) {
      uint64_t v14 = 5;
    }
    BOOL v15 = v10 == 0;
    uint64_t v16 = 3;
    goto LABEL_12;
  }
  uint64_t v18 = 1;
  if (IsTinker) {
    uint64_t v18 = 2;
  }
  if (v10) {
    int64_t v17 = 0;
  }
  else {
    int64_t v17 = v18;
  }
LABEL_20:

  return v17;
}

- (id)loadDefaultVerticalOnlyPositions
{
  int64_t v3 = [(CSLIconPositionsStore *)self deviceConfiguration];

  return [(CSLIconPositionsStore *)self loadDefaultPositionsForConfiguration:v3];
}

- (id)loadDefaultPositionsForConfiguration:(int64_t)a3
{
  int64_t v3 = [(CSLIconPositionsStore *)self defaultOrderingForConfiguration:a3];
  id v4 = [[CSLHexAppGraph alloc] initVerticalOnly:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(v4, "addNodeWithBundleIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v9 setDirectPlacementReason:1];
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v4 setLastReorderReason:1];

  return v4;
}

- (id)loadLegacyDefaultPositions
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  int64_t v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
  LODWORD(v3) = [v5 supportsCapability:v6];

  if (v3)
  {
    unsigned int IsTinker = CSLPairingIsTinker();
    CFStringRef v8 = @"DefaultIconPositions-N199";
    CFStringRef v9 = @"DefaultIconPositions-Tinker-N199";
LABEL_3:
    BOOL v10 = IsTinker == 0;
    goto LABEL_6;
  }
  if (!CSLPairingIsTinker())
  {
    if (HKRPShouldInstallOxygenSaturationWatchAppOnPairedWatch())
    {
      long long v13 = @"DefaultIconPositions-OxygenSaturation";
      goto LABEL_9;
    }
    id v29 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AB764CE8-D4DF-4DB6-991C-3A298E380BD1"];
    unsigned __int8 v30 = [v5 supportsCapability:v29];

    if (v30)
    {
      long long v13 = @"DefaultIconPositions-Compass";
      goto LABEL_9;
    }
    unsigned int IsTinker = +[HKHeartRhythmAvailability isElectrocardiogramSupportedOnWatch:v5];
    CFStringRef v8 = @"DefaultIconPositions";
    CFStringRef v9 = @"DefaultIconPositions-EKG";
    goto LABEL_3;
  }
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AB764CE8-D4DF-4DB6-991C-3A298E380BD1"];
  unsigned int v12 = [v5 supportsCapability:v11];

  CFStringRef v8 = @"DefaultIconPositions-TinkerNoCompass";
  CFStringRef v9 = @"DefaultIconPositions-Tinker";
  BOOL v10 = v12 == 0;
LABEL_6:
  if (v10) {
    long long v13 = (__CFString *)v8;
  }
  else {
    long long v13 = (__CFString *)v9;
  }
LABEL_9:
  id v14 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Carousel.internal"];
  BOOL v15 = [v14 valueForKey:@"overrideDefaultIconPositionsFilename"];

  if (v15)
  {
    uint64_t v16 = cslprf_icon_field_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v35 = v15;
      __int16 v36 = 2112;
      CFStringRef v37 = @"plist";
      __int16 v38 = 2112;
      uint64_t v39 = v13;
      __int16 v40 = 2112;
      CFStringRef v41 = @"plist";
      _os_log_impl(&def_1A578, v16, OS_LOG_TYPE_DEFAULT, "override set, using '%@.%@' instead of '%@.%@'", buf, 0x2Au);
    }

    long long v13 = v15;
  }
  int64_t v17 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v18 = [v17 URLForResource:v13 withExtension:@"plist"];

  if (!v18)
  {
    uint64_t v20 = cslprf_icon_field_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_285CC((uint64_t)v13, v20);
    }
    goto LABEL_27;
  }
  id v33 = 0;
  uint64_t v19 = +[NSData dataWithContentsOfURL:v18 options:2 error:&v33];
  uint64_t v20 = v33;
  if (!v19)
  {
    uint64_t v26 = cslprf_icon_field_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_28658();
    }

LABEL_27:
LABEL_28:
    id v23 = [[CSLHexAppGraph alloc] initVerticalOnly:0];
    [v23 setLastReorderReason:6];
    id v27 = [v23 addNodeWithBundleIdentifier:kClockBundleIdentifier];
    goto LABEL_37;
  }
  id v32 = 0;
  uint64_t v21 = +[NSPropertyListSerialization propertyListWithData:v19 options:0 format:0 error:&v32];
  id v22 = v32;

  if (!v21)
  {
    uint64_t v28 = cslprf_icon_field_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_286C0();
    }
    goto LABEL_35;
  }
  id v23 = +[CSLHexAppGraph unarchiveFromPropertyList:v21];
  if (!v23)
  {
    uint64_t v28 = cslprf_icon_field_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_28728(v28);
    }
LABEL_35:

    id v23 = 0;
    goto LABEL_36;
  }
  uint64_t v24 = cslprf_icon_field_log();
  os_log_type_t v25 = os_variant_has_internal_diagnostics() ^ 1;
  if (os_log_type_enabled(v24, v25))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v13;
    _os_log_impl(&def_1A578, v24, v25, "successfully loaded default icon plist (%@)", buf, 0xCu);
  }

  [v23 setLastReorderReason:1];
LABEL_36:

  if (!v23) {
    goto LABEL_28;
  }
LABEL_37:

  return v23;
}

- (id)loadPositions
{
  return [(CSLIconPositionsStore *)self _loadPositionsUsingKey:@"IconPositions"];
}

- (id)loadTargetPositions
{
  return [(CSLIconPositionsStore *)self _loadLocalPositionsUsingKey:@"TargetIconPositions"];
}

- (void)savePositions:(id)a3
{
}

- (void)saveTargetPositions:(id)a3
{
  id v4 = a3;
  id v5 = cslprf_icon_field_log();
  if (os_variant_has_internal_diagnostics()) {
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = "saving";
    if (!v4) {
      uint64_t v7 = "clearing";
    }
    int v8 = 136315138;
    CFStringRef v9 = v7;
    _os_log_impl(&def_1A578, v5, v6, "%s target icon positions", (uint8_t *)&v8, 0xCu);
  }

  [(CSLIconPositionsStore *)self _saveLocalPositions:v4 usingKey:@"TargetIconPositions"];
}

- (void)resetIconPositionsToConfiguration:(int64_t)a3
{
  id v5 = [(CSLIconPositionsStore *)self loadDefaultPositionsForConfiguration:a3];
  [(CSLIconPositionsStore *)self saveTargetPositions:0];
  [(CSLIconPositionsStore *)self savePositions:v5];
  id v4 = [(CSLIconPositionsStore *)self delegate];
  [v4 store:self updatedIconGraph:v5];
}

- (void)moveIconsToTopWithBundleIdentifiers:(id)a3
{
  id v8 = a3;
  id v4 = [(CSLIconPositionsStore *)self loadPositions];
  id v5 = +[NSOrderedSet orderedSetWithArray:v8];
  os_log_type_t v6 = [v5 array];

  [v4 moveNodesToTopWithBundleIdentifiers:v6 forReason:2];
  [(CSLIconPositionsStore *)self saveTargetPositions:0];
  [(CSLIconPositionsStore *)self savePositions:v4];
  uint64_t v7 = [(CSLIconPositionsStore *)self delegate];
  [v7 store:self updatedIconGraph:v4];
}

- (id)orderedBundleIdentifiers
{
  v2 = [(CSLIconPositionsStore *)self loadPositions];
  int64_t v3 = [v2 allNodes];
  id v4 = [v3 sortedArrayUsingComparator:&stru_3CD40];
  id v5 = objc_msgSend(v4, "bs_map:", &stru_3CD80);

  return v5;
}

- (id)_loadPositionsUsingKey:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
  id v6 = [v5 synchronize];
  uint64_t v7 = [(CSLIconPositionsStore *)self _loadPositionsFromObject:v5 usingKey:v4];

  return v7;
}

- (id)_loadLocalPositionsUsingKey:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [(CSLIconPositionsStore *)self _loadPositionsFromObject:v5 usingKey:v4];

  return v6;
}

- (id)_loadPositionsFromObject:(id)a3 usingKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 dictionaryForKey:v6];
  if (!v7) {
    goto LABEL_8;
  }
  id v8 = +[CSLHexAppGraph unarchiveFromDictionaryRepresentation:v7];
  if (!v8)
  {
    BOOL v10 = cslprf_icon_field_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_287D4();
    }

LABEL_8:
    CFStringRef v9 = [v5 dataForKey:v6];
    if (v9)
    {
      id v15 = 0;
      id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v15];
      id v11 = v15;
      if (!v8)
      {
        unsigned int v12 = cslprf_icon_field_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_2876C();
        }
        id v8 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      id v8 = 0;
      id v11 = 0;
    }
    if (os_variant_has_internal_diagnostics())
    {
      unsigned int v12 = cslprf_icon_field_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [v8 abbreviatedDescription];
        *(_DWORD *)buf = 138412546;
        id v17 = v6;
        __int16 v18 = 2114;
        uint64_t v19 = v13;
        _os_log_impl(&def_1A578, v12, OS_LOG_TYPE_DEFAULT, "Successfully loaded local icon position data (%@): %{public}@", buf, 0x16u);
      }
    }
    else
    {
      unsigned int v12 = cslprf_icon_field_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&def_1A578, v12, OS_LOG_TYPE_INFO, "Successfully loaded local icon position data (%@)", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  CFStringRef v9 = cslprf_icon_field_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&def_1A578, v9, OS_LOG_TYPE_INFO, "Successfully loaded icon positions from dictionary with key:(%@)", buf, 0xCu);
  }
LABEL_20:

  return v8;
}

- (void)_savePositions:(id)a3 usingKey:(id)a4
{
  id v11 = a4;
  id v6 = [(CSLIconPositionsStore *)self archivalPositionsObjectForGraph:a3];
  id v7 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
  id v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKey:v11];
  }
  else {
    [v7 removeObjectForKey:v11];
  }
  id v9 = [v8 synchronize];
  BOOL v10 = +[NSSet setWithObject:v11];
  [(NPSManager *)self->_syncManager synchronizeNanoDomain:@"com.apple.Carousel" keys:v10];
}

- (void)_saveLocalPositions:(id)a3 usingKey:(id)a4
{
  id v9 = a4;
  id v6 = [(CSLIconPositionsStore *)self archivalPositionsObjectForGraph:a3];
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKey:v9];
  }
  else {
    [v7 removeObjectForKey:v9];
  }
}

- (id)archivalPositionsObjectForGraph:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasDictionaryRepresentation]) {
      [v4 archiveToDictionaryRepresentation];
    }
    else {
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)positionsChanged
{
  id v3 = [(CSLIconPositionsStore *)self loadPositions];
  id v4 = cslprf_icon_field_log();
  os_log_type_t v5 = os_variant_has_internal_diagnostics() ^ 1;
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [v3 abbreviatedDescription];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&def_1A578, v4, v5, "icon positions changed: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(CSLIconPositionsStore *)self delegate];
  [v7 store:self updatedIconGraph:v3];
}

- (void)archivePositionsToDiagnostics:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Carousel.internal"];
    unsigned __int8 v5 = [v4 BOOLForKey:@"shouldArchiveIconPositions"];

    if (v5)
    {
      id v6 = [v3 archiveToPropertyList];
      if (v6)
      {
        id v30 = 0;
        id v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:&v30];
        id v8 = v30;
        if (v7)
        {
          id v9 = CSLDiagnosticFileURLWithFilename(@"DefaultIconPositions.plist");
          BOOL v10 = [v9 path];
          id v11 = +[NSFileManager defaultManager];
          if ([v11 fileExistsAtPath:v10])
          {
            id v29 = v8;
            unsigned int v12 = [v11 attributesOfItemAtPath:v10 error:&v29];
            id v13 = v29;

            if (v13)
            {
              id v14 = cslprf_icon_field_log();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                sub_2890C();
              }
            }
            else
            {
              id v14 = [v12 objectForKey:NSFileModificationDate];
              [v14 timeIntervalSinceNow];
              if (v16 >= -30.0)
              {
                id v13 = 0;
              }
              else
              {
                id v17 = +[CSLDateLabelStringFormatCache sharedInstance];
                id v27 = [v17 formatDateAsLongYMDHMSNoSpacesWithDate:v14];

                os_log_type_t v25 = +[NSString stringWithFormat:@"DefaultIconPositions-%@.plist", v27];
                CSLDiagnosticFileURLWithFilename(v25);
                uint64_t v26 = v28[1] = 0;
                unsigned __int8 v18 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v9);
                id v13 = 0;
                if (v18)
                {
                  uint64_t v19 = cslprf_icon_field_log();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v20 = [v26 path];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v32 = v20;
                    uint64_t v24 = (void *)v20;
                    _os_log_impl(&def_1A578, v19, OS_LOG_TYPE_DEFAULT, "renamed old icon positions to: %@", buf, 0xCu);
                  }
                }
                else
                {
                  uint64_t v19 = cslprf_icon_field_log();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                    sub_288A4();
                  }
                }
              }
            }

            id v8 = v13;
          }
          v28[0] = v8;
          unsigned __int8 v21 = [v7 writeToURL:v9 options:1 error:v28];
          id v15 = v28[0];

          if (v21)
          {
            id v22 = cslprf_icon_field_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v9 path];
              *(_DWORD *)buf = 138412290;
              uint64_t v32 = (uint64_t)v23;
              _os_log_impl(&def_1A578, v22, OS_LOG_TYPE_DEFAULT, "wrote icon poitions to file:%@", buf, 0xCu);
            }
          }
          else
          {
            id v22 = cslprf_icon_field_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_2883C();
            }
          }
        }
        else
        {
          id v9 = cslprf_icon_field_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_2883C();
          }
          id v15 = v8;
        }
      }
    }
  }
}

- (CSLIconPostionsStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLIconPostionsStoreDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end