@interface GAXAccessibilityFeatureManager
- ($DE71691BB3011260155645AE0E7AB3CC)_currentFeatureSet;
- ($DE71691BB3011260155645AE0E7AB3CC)_loadUserPreferredSet;
- ($DE71691BB3011260155645AE0E7AB3CC)overrideAXFeatureSet;
- (AXAccessQueueTimer)updateTimer;
- (BOOL)_hasSavedUserPreferredFeatures;
- (BOOL)hasAccessibilityTripleClickOptions;
- (BOOL)isRestoring;
- (GAXAccessibilityFeatureManager)init;
- (NSMutableArray)updateQueue;
- (id)_accessibilityTripleClickOptions;
- (id)_updateBlocksForFeatureSet:(id)a3;
- (id)_updateBlocksForFeatures:(unint64_t)a3 setEnabled:(BOOL)a4;
- (void)_processNextUpdateBlockInQueue;
- (void)_saveCurrentAXFeaturesAsUserPreferredSetIfNecessary;
- (void)_saveCurrentFeatureSetAsUserPreferredSet;
- (void)configureAXFeatures:(unint64_t)a3 enabled:(BOOL)a4;
- (void)overrideAccessibiltyFeaturesWithFeatureSet:(id)a3;
- (void)restoreAccessibilityFeatures;
- (void)setOverrideAXFeatureSet:(id)a3;
- (void)setRestoring:(BOOL)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUpdateTimer:(id)a3;
@end

@implementation GAXAccessibilityFeatureManager

- (GAXAccessibilityFeatureManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)GAXAccessibilityFeatureManager;
  v2 = [(GAXAccessibilityFeatureManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)AXAccessQueueTimer);
    v4 = +[AXAccessQueue mainAccessQueue];
    id v5 = [v3 initWithTargetAccessQueue:v4];

    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(GAXAccessibilityFeatureManager *)v2 setUpdateTimer:v5];
  }
  return v2;
}

- (BOOL)hasAccessibilityTripleClickOptions
{
  v2 = [(GAXAccessibilityFeatureManager *)self _accessibilityTripleClickOptions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_saveCurrentAXFeaturesAsUserPreferredSetIfNecessary
{
  unsigned __int8 v3 = [(GAXAccessibilityFeatureManager *)self _hasSavedUserPreferredFeatures];
  v4 = GAXLogCommon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      sub_29AF8();
    }
  }
  else
  {
    if (v5) {
      sub_29B2C();
    }

    [(GAXAccessibilityFeatureManager *)self _saveCurrentFeatureSetAsUserPreferredSet];
  }
}

- (void)overrideAccessibiltyFeaturesWithFeatureSet:(id)a3
{
  [(GAXAccessibilityFeatureManager *)self setRestoring:0];
  BOOL v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_29B60();
  }

  [(GAXAccessibilityFeatureManager *)self _saveCurrentAXFeaturesAsUserPreferredSetIfNecessary];
  v6 = [(GAXAccessibilityFeatureManager *)self _updateBlocksForFeatureSet:*(unsigned int *)&a3];
  [(GAXAccessibilityFeatureManager *)self setUpdateQueue:v6];

  [(GAXAccessibilityFeatureManager *)self _processNextUpdateBlockInQueue];
}

- (void)restoreAccessibilityFeatures
{
  unsigned __int8 v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_29B94();
  }

  if ([(GAXAccessibilityFeatureManager *)self _hasSavedUserPreferredFeatures])
  {
    [(GAXAccessibilityFeatureManager *)self setRestoring:1];
    v4 = [(GAXAccessibilityFeatureManager *)self _updateBlocksForFeatureSet:[(GAXAccessibilityFeatureManager *)self _loadUserPreferredSet]];
    [(GAXAccessibilityFeatureManager *)self setUpdateQueue:v4];

    [(GAXAccessibilityFeatureManager *)self _processNextUpdateBlockInQueue];
  }
  else
  {
    BOOL v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "No saved preferred features, no need to restore anything.", v6, 2u);
    }
  }
}

- (void)configureAXFeatures:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(GAXAccessibilityFeatureManager *)self isRestoring])
  {
    [(GAXAccessibilityFeatureManager *)self _saveCurrentAXFeaturesAsUserPreferredSetIfNecessary];
    id v9 = [(GAXAccessibilityFeatureManager *)self _updateBlocksForFeatures:a3 setEnabled:v4];
    objc_super v7 = [(GAXAccessibilityFeatureManager *)self updateQueue];

    if (v7)
    {
      id v8 = [(GAXAccessibilityFeatureManager *)self updateQueue];
      [v8 addObjectsFromArray:v9];
    }
    else
    {
      id v8 = [v9 mutableCopy];
      [(GAXAccessibilityFeatureManager *)self setUpdateQueue:v8];
    }

    [(GAXAccessibilityFeatureManager *)self _processNextUpdateBlockInQueue];
  }
}

- (BOOL)_hasSavedUserPreferredFeatures
{
  v2 = +[GAXSettings sharedInstance];
  unsigned __int8 v3 = [v2 savedAccessibilityFeatures];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_saveCurrentFeatureSetAsUserPreferredSet
{
  unsigned int v2 = [(GAXAccessibilityFeatureManager *)self _currentFeatureSet];
  id v16 = +[GAXSettings sharedInstance];
  unsigned __int8 v3 = +[NSMutableDictionary dictionary];
  BOOL v4 = +[NSNumber numberWithUnsignedInt:v2 & 1];
  [v3 setObject:v4 forKeyedSubscript:@"AXFeatureIDVoiceOver"];

  BOOL v5 = +[NSNumber numberWithUnsignedInt:(v2 >> 1) & 1];
  [v3 setObject:v5 forKeyedSubscript:@"AXFeatureIDZoom"];

  v6 = +[NSNumber numberWithUnsignedInt:(v2 >> 2) & 1];
  [v3 setObject:v6 forKeyedSubscript:@"AXFeatureIDInvertColors"];

  objc_super v7 = +[NSNumber numberWithUnsignedInt:(v2 >> 4) & 1];
  [v3 setObject:v7 forKeyedSubscript:@"AXFeatureIDAssistiveTouch"];

  id v8 = +[NSNumber numberWithUnsignedInt:(v2 >> 6) & 1];
  [v3 setObject:v8 forKeyedSubscript:@"AXFeatureIDSpeakSelection"];

  id v9 = +[NSNumber numberWithUnsignedInt:(v2 >> 7) & 1];
  [v3 setObject:v9 forKeyedSubscript:@"AXFeatureIDMonoAudio"];

  v10 = +[NSNumber numberWithUnsignedInt:(v2 >> 8) & 1];
  [v3 setObject:v10 forKeyedSubscript:@"AXFeatureIDGuidedAccess"];

  v11 = +[NSNumber numberWithUnsignedInt:(v2 >> 5) & 1];
  [v3 setObject:v11 forKeyedSubscript:@"AXFeatureIDSwitchOver"];

  v12 = +[NSNumber numberWithUnsignedInt:(v2 >> 3) & 1];
  [v3 setObject:v12 forKeyedSubscript:@"AXFeatureIDGrayscale"];

  v13 = +[NSNumber numberWithUnsignedInt:(v2 >> 10) & 1];
  [v3 setObject:v13 forKeyedSubscript:@"AXFeatureIDCommandAndControl"];

  [v16 setSavedAccessibilityFeatures:v3];
  v14 = +[NSMutableArray array];
  v15 = v14;
  if ((v2 & 0x800) != 0)
  {
    [v14 addObject:@"AXFeatureIDVoiceOver"];
    if ((v2 & 0x2000) == 0)
    {
LABEL_3:
      if ((v2 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v2 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  [v15 addObject:@"AXFeatureIDInvertColors"];
  if ((v2 & 0x1000) == 0)
  {
LABEL_4:
    if ((v2 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v15 addObject:@"AXFeatureIDZoom"];
  if ((v2 & 0x80000) == 0)
  {
LABEL_5:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v15 addObject:@"AXFeatureIDReduceWhitePoint"];
  if ((v2 & 0x8000) == 0)
  {
LABEL_6:
    if ((v2 & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v15 addObject:@"AXFeatureIDAssistiveTouch"];
  if ((v2 & 0x20000) == 0)
  {
LABEL_7:
    if ((v2 & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v15 addObject:@"AXFeatureIDGuidedAccess"];
  if ((v2 & 0x40000) == 0)
  {
LABEL_8:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v15 addObject:@"AXFeatureIDHearingAids"];
  if ((v2 & 0x10000) == 0)
  {
LABEL_9:
    if ((v2 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v15 addObject:@"AXFeatureIDSwitchOver"];
  if ((v2 & 0x4000) == 0)
  {
LABEL_10:
    if ((v2 & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  [v15 addObject:@"AXFeatureIDGrayscale"];
  if ((v2 & 0x100000) != 0) {
LABEL_11:
  }
    [v15 addObject:@"AXFeatureIDCommandAndControl"];
LABEL_12:
  [v16 setSavedAccessibilityTripleClickOptions:v15];
}

- ($DE71691BB3011260155645AE0E7AB3CC)_loadUserPreferredSet
{
  unsigned int v2 = +[GAXSettings sharedInstance];
  v42 = v2;
  unsigned __int8 v3 = [v2 savedAccessibilityFeatures];
  BOOL v4 = [v3 objectForKey:@"AXFeatureIDVoiceOver"];
  unsigned int v5 = [v4 BOOLValue];

  v6 = [v3 objectForKey:@"AXFeatureIDZoom"];
  if ([v6 BOOLValue]) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  int v8 = v7 | v5;

  id v9 = [v3 objectForKey:@"AXFeatureIDInvertColors"];
  if ([v9 BOOLValue]) {
    int v10 = 4;
  }
  else {
    int v10 = 0;
  }

  v11 = [v3 objectForKey:@"AXFeatureIDAssistiveTouch"];
  if ([v11 BOOLValue]) {
    int v12 = 16;
  }
  else {
    int v12 = 0;
  }
  int v48 = v8 | v10 | v12;

  v13 = [v3 objectForKey:@"AXFeatureIDSpeakSelection"];
  if ([v13 BOOLValue]) {
    int v14 = 64;
  }
  else {
    int v14 = 0;
  }

  v15 = [v3 objectForKey:@"AXFeatureIDMonoAudio"];
  if ([v15 BOOLValue]) {
    int v16 = 128;
  }
  else {
    int v16 = 0;
  }

  v17 = [v3 objectForKey:@"AXFeatureIDGuidedAccess"];
  if ([v17 BOOLValue]) {
    int v18 = 256;
  }
  else {
    int v18 = 0;
  }
  int v46 = v14 | v16;
  int v47 = v18;

  v19 = [v3 objectForKey:@"AXFeatureIDSwitchOver"];
  if ([v19 BOOLValue]) {
    int v20 = 32;
  }
  else {
    int v20 = 0;
  }
  int v45 = v20;

  v21 = [v3 objectForKey:@"AXFeatureIDGrayscale"];
  if ([v21 BOOLValue]) {
    int v22 = 8;
  }
  else {
    int v22 = 0;
  }
  int v44 = v22;

  v23 = [v3 objectForKey:@"AXFeatureIDReduceWhitePoint"];
  if ([v23 BOOLValue]) {
    int v24 = 512;
  }
  else {
    int v24 = 0;
  }
  int v43 = v24;

  v25 = [v3 objectForKey:@"AXFeatureIDCommandAndControl"];
  if ([v25 BOOLValue]) {
    int v26 = 1024;
  }
  else {
    int v26 = 0;
  }
  int v41 = v26;

  v27 = [v2 savedAccessibilityTripleClickOptions];
  if ([v27 containsObject:@"AXFeatureIDVoiceOver"]) {
    int v28 = 2048;
  }
  else {
    int v28 = 0;
  }
  int v40 = v28;
  if ([v27 containsObject:@"AXFeatureIDInvertColors"]) {
    int v29 = 0x2000;
  }
  else {
    int v29 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDZoom"]) {
    int v30 = 4096;
  }
  else {
    int v30 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDReduceWhitePoint"]) {
    int v31 = 0x80000;
  }
  else {
    int v31 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDAssistiveTouch"]) {
    int v32 = 0x8000;
  }
  else {
    int v32 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDGuidedAccess"]) {
    int v33 = 0x20000;
  }
  else {
    int v33 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDHearingAids"]) {
    int v34 = 0x40000;
  }
  else {
    int v34 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDSwitchOver"]) {
    int v35 = 0x10000;
  }
  else {
    int v35 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDGrayscale"]) {
    int v36 = 0x4000;
  }
  else {
    int v36 = 0;
  }
  if ([v27 containsObject:@"AXFeatureIDCommandAndControl"]) {
    int v37 = 0x100000;
  }
  else {
    int v37 = 0;
  }
  int v38 = v48 | v46 | v47 | v45 | v44 | v43 | v41 | v40 | v29 | v30 | v31 | v32 | v33 | v34 | v35 | v36 | v37;

  return ($DE71691BB3011260155645AE0E7AB3CC)v38;
}

- ($DE71691BB3011260155645AE0E7AB3CC)_currentFeatureSet
{
  int v3 = _AXSVoiceOverTouchEnabled() & 1;
  int v4 = v3 & 0xFFFFFFFD | (2 * (_AXSZoomTouchEnabled() & 1));
  int v5 = v4 & 0xFFFFFFFB | (4 * (_AXSInvertColorsEnabled() & 1));
  int v6 = v5 & 0xFFFFFFF7 | (8 * (_AXSGrayscaleEnabled() & 1));
  LOBYTE(v6) = v6 & 0xEF | (16 * (_AXSAssistiveTouchEnabled() & 1));
  char v7 = _AXSQuickSpeakEnabled();
  __int16 v8 = v6 & 0x9F | ((v7 & 1) << 6) | (_AXSMonoAudioEnabled() << 7);
  __int16 v9 = v8 | ((unsigned __int16)_AXSGuidedAccessEnabled() << 8);
  int v10 = v9 & 0x1FF | (32 * (_AXSAssistiveTouchScannerEnabled() & 1));
  int v11 = v10 | ((_AXSReduceWhitePointEnabled() & 1) << 9);
  int v12 = v11 | ((_AXSCommandAndControlEnabled() & 1) << 10);
  v13 = [(GAXAccessibilityFeatureManager *)self _accessibilityTripleClickOptions];
  if ([v13 containsObject:&off_4D638]) {
    int v14 = 2048;
  }
  else {
    int v14 = 0;
  }
  if ([v13 containsObject:&off_4D650]) {
    int v15 = 0x2000;
  }
  else {
    int v15 = 0;
  }
  if ([v13 containsObject:&off_4D668]) {
    int v16 = 4096;
  }
  else {
    int v16 = 0;
  }
  if ([v13 containsObject:&off_4D680]) {
    int v17 = 0x8000;
  }
  else {
    int v17 = 0;
  }
  if ([v13 containsObject:&off_4D698]) {
    int v18 = 0x20000;
  }
  else {
    int v18 = 0;
  }
  if ([v13 containsObject:&off_4D6B0]) {
    int v19 = 0x40000;
  }
  else {
    int v19 = 0;
  }
  if ([v13 containsObject:&off_4D6C8]) {
    int v20 = 0x10000;
  }
  else {
    int v20 = 0;
  }
  if ([v13 containsObject:&off_4D6E0]) {
    int v21 = 0x4000;
  }
  else {
    int v21 = 0;
  }
  int v22 = v14 | v15;
  if ([v13 containsObject:&off_4D6F8]) {
    int v23 = 0x80000;
  }
  else {
    int v23 = 0;
  }
  if ([v13 containsObject:&off_4D710]) {
    int v24 = 0x100000;
  }
  else {
    int v24 = 0;
  }
  int v25 = v12 | v22 | v16 | v17 | v18 | v19 | v20 | v21 | v23 | v24;

  return ($DE71691BB3011260155645AE0E7AB3CC)v25;
}

- (id)_updateBlocksForFeatures:(unint64_t)a3 setEnabled:(BOOL)a4
{
  char v5 = a3;
  int v6 = objc_opt_new();
  if (v5)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_3A3C;
    v21[3] = &unk_489A8;
    BOOL v22 = a4;
    id v9 = [v21 copy];
    [v6 addObject:v9];

    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_3A44;
  v19[3] = &unk_489A8;
  BOOL v20 = a4;
  id v10 = [v19 copy];
  [v6 addObject:v10];

  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3A4C;
  v17[3] = &unk_489A8;
  BOOL v18 = a4;
  id v11 = [v17 copy];
  [v6 addObject:v11];

  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3A54;
  v15[3] = &unk_489A8;
  BOOL v16 = a4;
  int v12 = objc_retainBlock(v15);
  [v6 addObject:v12];

  if ((v5 & 4) != 0)
  {
LABEL_6:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_3A5C;
    v13[3] = &unk_489A8;
    BOOL v14 = a4;
    id v7 = [v13 copy];
    [v6 addObject:v7];
  }
LABEL_7:

  return v6;
}

- (id)_updateBlocksForFeatureSet:(id)a3
{
  int v4 = +[NSMutableArray array];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_3FD4;
  v59[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v60 = a3;
  char v5 = objc_retainBlock(v59);
  id v6 = [v5 copy];

  id v7 = objc_retainBlock(v6);
  [v4 addObject:v7];

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_4144;
  v57[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v58 = a3;
  __int16 v8 = objc_retainBlock(v57);

  id v9 = [v8 copy];
  id v10 = objc_retainBlock(v9);
  [v4 addObject:v10];

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_4150;
  v55[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v56 = a3;
  id v11 = objc_retainBlock(v55);

  id v12 = [v11 copy];
  id v13 = objc_retainBlock(v12);
  [v4 addObject:v13];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_415C;
  v53[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v54 = a3;
  BOOL v14 = objc_retainBlock(v53);

  id v15 = [v14 copy];
  id v16 = objc_retainBlock(v15);
  [v4 addObject:v16];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_4168;
  v51[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v52 = a3;
  int v17 = objc_retainBlock(v51);

  id v18 = [v17 copy];
  id v19 = objc_retainBlock(v18);
  [v4 addObject:v19];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_4174;
  v49[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v50 = a3;
  BOOL v20 = objc_retainBlock(v49);

  id v21 = [v20 copy];
  id v22 = objc_retainBlock(v21);
  [v4 addObject:v22];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_4180;
  v47[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v48 = a3;
  int v23 = objc_retainBlock(v47);

  id v24 = [v23 copy];
  id v25 = objc_retainBlock(v24);
  [v4 addObject:v25];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_418C;
  v45[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v46 = a3;
  int v26 = objc_retainBlock(v45);

  id v27 = [v26 copy];
  id v28 = objc_retainBlock(v27);
  [v4 addObject:v28];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_4198;
  v43[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v44 = a3;
  int v29 = objc_retainBlock(v43);

  id v30 = [v29 copy];
  id v31 = objc_retainBlock(v30);
  [v4 addObject:v31];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_41A4;
  v41[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v42 = a3;
  int v32 = objc_retainBlock(v41);

  id v33 = [v32 copy];
  id v34 = objc_retainBlock(v33);
  [v4 addObject:v34];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_41B0;
  v39[3] = &unk_489C8;
  $DE71691BB3011260155645AE0E7AB3CC v40 = a3;
  int v35 = objc_retainBlock(v39);

  id v36 = [v35 copy];
  id v37 = objc_retainBlock(v36);
  [v4 addObject:v37];

  return v4;
}

- (void)_processNextUpdateBlockInQueue
{
  int v3 = [(GAXAccessibilityFeatureManager *)self updateTimer];
  [v3 cancel];

  int v4 = [(GAXAccessibilityFeatureManager *)self updateQueue];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(GAXAccessibilityFeatureManager *)self updateQueue];
    id v7 = [v6 objectAtIndex:0];

    v7[2](v7);
    __int16 v8 = [(GAXAccessibilityFeatureManager *)self updateQueue];
    [v8 removeObjectAtIndex:0];

    id v9 = [(GAXAccessibilityFeatureManager *)self updateTimer];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_4360;
    v13[3] = &unk_48928;
    void v13[4] = self;
    [v9 afterDelay:v13 processBlock:1.0];
  }
  else
  {
    id v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_29BC8(self, v10);
    }

    if ([(GAXAccessibilityFeatureManager *)self isRestoring])
    {
      id v11 = +[GAXSettings sharedInstance];
      [v11 setSavedAccessibilityFeatures:0];

      id v12 = +[GAXSettings sharedInstance];
      [v12 setSavedAccessibilityTripleClickOptions:0];
    }
    [(GAXAccessibilityFeatureManager *)self setRestoring:0];
  }
}

- (id)_accessibilityTripleClickOptions
{
  unsigned int v2 = (void *)_AXSTripleClickCopyOptions();
  if (!v2)
  {
    unsigned int v2 = +[NSArray array];
  }

  return v2;
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- ($DE71691BB3011260155645AE0E7AB3CC)overrideAXFeatureSet
{
  return ($DE71691BB3011260155645AE0E7AB3CC)self->_overrideAXFeatureSet;
}

- (void)setOverrideAXFeatureSet:(id)a3
{
  self->_overrideAXFeatureSet = ($A8E2FEBF70B0B20DEB8173A88FCF829A)a3;
}

- (NSMutableArray)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (AXAccessQueueTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end