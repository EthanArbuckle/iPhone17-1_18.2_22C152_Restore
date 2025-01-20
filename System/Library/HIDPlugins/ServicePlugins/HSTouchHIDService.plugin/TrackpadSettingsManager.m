@interface TrackpadSettingsManager
+ (int)determineSavedOrientationForDevice:(__MTDevice *)a3;
+ (int)determineSavedOrientationModeForDevice:(__MTDevice *)a3;
+ (void)saveSurfaceOrientationForDevice:(__MTDevice *)a3 orientation:(unsigned int)a4 eraseSetting:(id *)a5[32];
- (BOOL)handleGetProperty:(id)a3;
- (BOOL)handleProperty:(id)a3 value:(id)a4;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (BOOL)notificationCenterActive;
- (BOOL)parserExternallyDisabled;
- (NSMutableDictionary)tpPreferences;
- (TrackpadSettingsManager)initWithDevice:(__MTDevice *)a3 parserOptions:(unsigned int)a4 handler:(id *)a5[32];
- (id)remapUserFacingKey:(id)a3;
- (int)disablingDeviceCount;
- (void)dealloc;
- (void)determineSurfaceOrientationSettings;
- (void)determineTrackpadSettings;
- (void)fetchDefaultPreference;
- (void)setDisablingDeviceCount:(int)a3;
- (void)setNotificationCenterActive:(BOOL)a3;
- (void)setParserExternallyDisabled:(BOOL)a3;
- (void)sync;
@end

@implementation TrackpadSettingsManager

- (TrackpadSettingsManager)initWithDevice:(__MTDevice *)a3 parserOptions:(unsigned int)a4 handler:(id *)a5[32]
{
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TrackpadSettingsManager;
  v10 = [(TrackpadSettingsManager *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_mtDeviceRef = a3;
    v10->_parserOptions = a4;
    v10->_disablingDeviceCount = 0;
    v12 = objc_retainBlock(v9);
    id handlerBlock = v11->_handlerBlock;
    v11->_id handlerBlock = v12;

    v11->_tpSettings.pointing = 1;
    *(_WORD *)&v11->_tpSettings.verticalScrolling = 257;
    v11->_tpSettings.gestureScrollingEnabled = 1;
    *(unsigned int *)((char *)&v11->_tpSettings.scrollAcceleration + 3) = 16843009;
    *(_DWORD *)&v11->_tpSettings.zoomToggle = 16843009;
    *(_DWORD *)&v11->_tpSettings.navigationSwipe4F.h = 16843009;
    *(_WORD *)&v11->_tpSettings.notificationCenter2F = 256;
    [(TrackpadSettingsManager *)v11 fetchDefaultPreference];
    v19[0] = @"TrackpadExternallyDisabled";
    v19[1] = @"TrackpadBasicMode";
    v20[0] = &__kCFBooleanFalse;
    v20[1] = &__kCFBooleanFalse;
    v19[2] = @"TrackpadScroll";
    v19[3] = @"TrackpadHorizScroll";
    v20[2] = &__kCFBooleanFalse;
    v20[3] = &__kCFBooleanFalse;
    v19[4] = @"Clicking";
    v19[5] = @"Dragging";
    v20[4] = &__kCFBooleanFalse;
    v20[5] = &__kCFBooleanFalse;
    v19[6] = @"TrackpadThreeFingerDrag";
    v19[7] = @"DragLock";
    v20[6] = &__kCFBooleanFalse;
    v20[7] = &__kCFBooleanFalse;
    v19[8] = @"TrackpadTwoFingerFromRightEdgeSwipeGesture";
    v19[9] = @"TrackpadRightClick";
    v20[8] = &__kCFBooleanFalse;
    v20[9] = &__kCFBooleanFalse;
    v19[10] = @"TrackpadCornerSecondaryClick";
    v19[11] = @"TrackpadMomentumScroll";
    v20[10] = &__kCFBooleanFalse;
    v20[11] = &__kCFBooleanFalse;
    v19[12] = @"TrackpadPinch";
    v19[13] = @"TrackpadRotate";
    v20[12] = &__kCFBooleanFalse;
    v20[13] = &__kCFBooleanFalse;
    v19[14] = @"TrackpadTwoFingerDoubleTapGesture";
    v19[15] = @"TrackpadThreeFingerTapGesture";
    v20[14] = &__kCFBooleanFalse;
    v20[15] = &__kCFBooleanFalse;
    v19[16] = @"HIDScrollZoomModifierMask";
    v19[17] = @"TrackpadThreeFingerHorizSwipeGesture";
    v20[16] = &__kCFBooleanFalse;
    v20[17] = &__kCFBooleanFalse;
    v19[18] = @"TrackpadThreeFingerVertSwipeGesture";
    v19[19] = @"TrackpadEditing";
    v20[18] = &__kCFBooleanFalse;
    v20[19] = &__kCFBooleanFalse;
    v19[20] = @"CutCopyPaste";
    v19[21] = @"TrackpadFourFingerHorizSwipeGesture";
    v20[20] = &__kCFBooleanFalse;
    v20[21] = &__kCFBooleanFalse;
    v19[22] = @"TrackpadFourFingerVertSwipeGesture";
    v19[23] = @"TrackpadFourFingerPinchGesture";
    v20[22] = &__kCFBooleanFalse;
    v20[23] = &__kCFBooleanFalse;
    v19[24] = @"TrackpadFiveFingerPinchGesture";
    v19[25] = @"FirstClickThreshold";
    v20[24] = &__kCFBooleanFalse;
    v20[25] = &__kCFBooleanFalse;
    v19[26] = @"SecondClickThreshold";
    v19[27] = @"ActuationStrength";
    v20[26] = &__kCFBooleanFalse;
    v20[27] = &__kCFBooleanFalse;
    v19[28] = @"ActuateDetents";
    v19[29] = @"ForceSuppressed";
    v20[28] = &__kCFBooleanFalse;
    v20[29] = &__kCFBooleanFalse;
    v19[30] = @"PrimaryTrackpadCanBeDisabled";
    v19[31] = @"MouseKeysStopsTrackpad";
    v20[30] = &__kCFBooleanTrue;
    v20[31] = &__kCFBooleanTrue;
    v19[32] = @"HIDMouseKeysOn";
    v19[33] = @"HIDTrackpadScrollAcceleration";
    v20[32] = &__kCFBooleanTrue;
    v20[33] = &__kCFBooleanTrue;
    v19[34] = @"HIDScrollReportRate";
    v19[35] = @"Built-In";
    v20[34] = &__kCFBooleanTrue;
    v20[35] = &__kCFBooleanFalse;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:36];
    userPrefDict = v11->_userPrefDict;
    v11->_userPrefDict = (NSDictionary *)v14;

    v16 = v11;
  }

  return v11;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(MouseBridge *)v4 dealloc];
  }
  v5.receiver = self;
  v5.super_class = (Class)TrackpadSettingsManager;
  [(TrackpadSettingsManager *)&v5 dealloc];
}

- (void)sync
{
  [(TrackpadSettingsManager *)self determineTrackpadSettings];
  id handlerBlock = self->_handlerBlock;
  if (handlerBlock)
  {
    v4 = (void (*)(void))*((void *)handlerBlock + 2);
    v4();
  }
}

- (void)fetchDefaultPreference
{
  kern_return_t v4;
  CFMutableDictionaryRef v5;
  BOOL v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *p_super;
  void *v11;
  void *v12;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSMutableDictionary *v21;

  properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  io_registry_entry_t Service = MTDeviceGetService();
  v4 = IORegistryEntryCreateCFProperties(Service, &properties, kCFAllocatorDefault, 0);
  objc_super v5 = properties;
  if (v4) {
    v6 = 1;
  }
  else {
    v6 = properties == 0;
  }
  if (v6)
  {
    MTLoggingPlugin();
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "[Error] ";
      v16 = 2080;
      v17 = "";
      objc_super v18 = 2080;
      v19 = "-[TrackpadSettingsManager fetchDefaultPreference]";
      v20 = 1024;
      LODWORD(v21) = v4;
      _os_log_impl(&def_411C8, &v7->super.super, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Failed to fetch properties: 0x%08x", buf, 0x26u);
    }
  }
  else
  {
    v8 = [(__CFDictionary *)properties objectForKeyedSubscript:@"TrackpadUserPreferences"];
    v7 = (NSMutableDictionary *)v8;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass())
       || ([(__CFDictionary *)v5 objectForKeyedSubscript:@"MultitouchPreferences"],
           v9 = objc_claimAutoreleasedReturnValue(),
           v7,
           (v7 = (NSMutableDictionary *)v9) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = v7;
      p_super = &self->_tpPreferences->super.super;
      self->_tpPreferences = v7;
    }
    else
    {
      p_super = MTLoggingPlugin();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v15 = "[Error] ";
        v16 = 2080;
        v17 = "";
        objc_super v18 = 2080;
        v19 = "-[TrackpadSettingsManager fetchDefaultPreference]";
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&def_411C8, p_super, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Invalid preferences: %@", buf, 0x2Au);
      }
    }

    v11 = [(__CFDictionary *)v5 objectForKeyedSubscript:@"TrackpadThreeFingerDrag"];
    self->_supports3FDrag = [v11 BOOLValue];

    v12 = [(__CFDictionary *)v5 objectForKeyedSubscript:@"TrackpadSecondaryClickCorners"];
    self->_supportsSecondaryClickCorners = [v12 BOOLValue];
  }
}

- (BOOL)handleProperty:(id)a3 value:(id)a4
{
  id v6 = a4;
  v7 = [(TrackpadSettingsManager *)self remapUserFacingKey:a3];
  v8 = [(NSDictionary *)self->_userPrefDict objectForKeyedSubscript:v7];

  if (v8)
  {
    [(NSMutableDictionary *)self->_tpPreferences setObject:v6 forKeyedSubscript:v7];
    [(TrackpadSettingsManager *)self determineTrackpadSettings];
  }
  else
  {
    if (![v7 isEqualToString:@"FlipLeftAndRightEdgeGestures"])
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    self->_tpSettings.notificationCenter2F = [v6 BOOLValue];
  }
  id handlerBlock = (void (**)(id, mt_StandardTrackpadSettings *, uint64_t))self->_handlerBlock;
  if (handlerBlock)
  {
    p_tpSettings = &self->_tpSettings;
    BOOL v11 = 1;
    handlerBlock[2](handlerBlock, p_tpSettings, 1);
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_9:

  return v11;
}

- (BOOL)handleGetProperty:(id)a3
{
  v4 = a3;
  objc_super v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v6 = [(TrackpadSettingsManager *)self remapUserFacingKey:v5];
  v7 = [(NSDictionary *)self->_userPrefDict objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:v6];
    v9 = (void *)v4[5];
    v4[5] = v8;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"MTEventSource"])
  {
    v9 = (void *)v4[5];
    CFStringRef v10 = (const __CFString *)&__kCFBooleanTrue;
LABEL_7:
    v4[5] = v10;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"DeviceTypeHint"])
  {
    v9 = (void *)v4[5];
    CFStringRef v10 = @"Trackpad";
    goto LABEL_7;
  }
  if (![v6 isEqualToString:@"SupportedGestures"]) {
    goto LABEL_9;
  }
  id v12 = [&off_14A130 mutableCopy];
  v13 = v12;
  if (self->_tpSettings.gestureScrollingEnabled) {
    [v12 addObject:@"Scroll"];
  }
  if (HIBYTE(self->_tpSettings.scrollAcceleration)) {
    [v13 addObject:@"Scale"];
  }
  if (self->_tpSettings.zoom) {
    [v13 addObject:@"Rotate"];
  }
  v9 = (void *)v4[5];
  v4[5] = v13;
LABEL_8:

LABEL_9:
  return v7 != 0;
}

- (id)remapUserFacingKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TapToClickEnabled"])
  {
    v4 = @"Clicking";
  }
  else if ([v3 isEqualToString:@"TwoFingersSecondaryClickEnabled"])
  {
    v4 = @"TrackpadRightClick";
  }
  else if ([v3 isEqualToString:@"DoubleTapToDragEnabled"])
  {
    v4 = @"Dragging";
  }
  else if ([v3 isEqualToString:@"DragLockEnabled"])
  {
    v4 = @"DragLock";
  }
  else if ([v3 isEqualToString:@"USBMouseStopsTrackpad"])
  {
    v4 = @"PrimaryTrackpadCanBeDisabled";
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (void)setDisablingDeviceCount:(int)a3
{
  int disablingDeviceCount = self->_disablingDeviceCount;
  if (disablingDeviceCount == a3)
  {
    self->_int disablingDeviceCount = a3;
  }
  else
  {
    self->_int disablingDeviceCount = a3;
    if (!a3 || !disablingDeviceCount)
    {
      [(TrackpadSettingsManager *)self determineTrackpadSettings];
      objc_super v5 = (void (*)(void))*((void *)self->_handlerBlock + 2);
      v5();
    }
  }
}

- (BOOL)parserExternallyDisabled
{
  v2 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadExternallyDisabled"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setParserExternallyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadExternallyDisabled"];
  unsigned int v6 = [v5 BOOLValue];

  v7 = +[NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)self->_tpPreferences setObject:v7 forKeyedSubscript:@"TrackpadExternallyDisabled"];

  if (v6 != v3)
  {
    [(TrackpadSettingsManager *)self determineTrackpadSettings];
    uint64_t v8 = (void (*)(void))*((void *)self->_handlerBlock + 2);
    v8();
  }
}

- (void)setNotificationCenterActive:(BOOL)a3
{
  if (self->_notificationCenterActive != a3)
  {
    self->_notificationCenterActive = a3;
    [(TrackpadSettingsManager *)self determineTrackpadSettings];
    v4 = (void (*)(void))*((void *)self->_handlerBlock + 2);
    v4();
  }
}

- (void)determineTrackpadSettings
{
  BOOL v3 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"MouseKeysStopsTrackpad"];
  if ([v3 BOOLValue])
  {
    v4 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"HIDMouseKeysOn"];
    unsigned int v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned int v5 = 0;
  }

  unsigned int v6 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"Built-In"];
  unsigned int v7 = [v6 BOOLValue];

  if (self->_disablingDeviceCount > 0) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1)
  {
    v9 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"PrimaryTrackpadCanBeDisabled"];
    unsigned int v10 = [v9 BOOLValue];
  }
  else
  {
    unsigned int v10 = 0;
  }
  if ((v5 | v10))
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    id v12 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadExternallyDisabled"];
    unsigned __int8 v11 = [v12 BOOLValue];
  }
  self->_tpSettings.enable = v11 ^ 1;
  v13 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadBasicMode"];
  unsigned int v14 = [v13 BOOLValue];

  self->_tpSettings.pointing = 1;
  if (v14)
  {
    *(_WORD *)&self->_tpSettings.verticalScrolling = 257;
    v15 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadScroll"];
    if ([v15 BOOLValue])
    {
      v16 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadHorizScroll"];
      self->_tpSettings.gestureScrollingEnabled = [v16 BOOLValue];

      id v53 = 0;
    }
    else
    {
      id v53 = 0;
      self->_tpSettings.gestureScrollingEnabled = 0;
    }
  }
  else
  {
    v17 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"Clicking"];
    self->_tpSettings.BOOL tapClick = [v17 BOOLValue];

    BOOL tapClick = self->_tpSettings.tapClick;
    self->_tpSettings.symmetricZoomRotate = tapClick;
    if (tapClick)
    {
      v19 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"Dragging"];
      self->_tpSettings.dragging = [v19 BOOLValue];
      p_dragging = &self->_tpSettings.dragging;
    }
    else
    {
      self->_tpSettings.dragging = 0;
      p_dragging = &self->_tpSettings.dragging;
    }
    if (self->_supports3FDrag)
    {
      v21 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadThreeFingerDrag"];
      self->_tpSettings.multiDragMomentum = [v21 BOOLValue];
      p_multiDragMomentum = &self->_tpSettings.multiDragMomentum;
    }
    else
    {
      self->_tpSettings.multiDragMomentum = 0;
      p_multiDragMomentum = &self->_tpSettings.multiDragMomentum;
    }
    v23 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"DragLock"];
    if ([v23 BOOLValue]) {
      char v24 = *p_dragging || *p_multiDragMomentum;
    }
    else {
      char v24 = 0;
    }
    self->_tpSettings.dragLock = v24;

    v25 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadTwoFingerFromRightEdgeSwipeGesture"];
    id v54 = v25;
    if (v25) {
      char v26 = [v25 intValue] == 3;
    }
    else {
      char v26 = 1;
    }
    self->_tpSettings.dockScale5F = v26;
    v27 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadRightClick"];
    self->_tpSettings.rightClick = [v27 BOOLValue];

    if (self->_supportsSecondaryClickCorners)
    {
      v28 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadCornerSecondaryClick"];
      *(_DWORD *)&self->_tpSettings.forceSuppressed = [v28 intValue];
    }
    else
    {
      *(_DWORD *)&self->_tpSettings.forceSuppressed = 0;
    }
    *(_WORD *)&self->_tpSettings.verticalScrolling = 257;
    v29 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadScroll"];
    if ([v29 BOOLValue])
    {
      v30 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadHorizScroll"];
      self->_tpSettings.gestureScrollingEnabled = [v30 BOOLValue];
    }
    else
    {
      self->_tpSettings.gestureScrollingEnabled = 0;
    }

    v31 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadMomentumScroll"];
    self->_tpSettings.flipLeftAndRightEdgeGestures = [v31 BOOLValue];

    v32 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadPinch"];
    HIBYTE(self->_tpSettings.scrollAcceleration) = [v32 BOOLValue];

    v33 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadRotate"];
    self->_tpSettings.zoom = [v33 BOOLValue];

    v34 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadTwoFingerDoubleTapGesture"];
    self->_tpSettings.rotate = [v34 intValue] == 1;

    v35 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadThreeFingerTapGesture"];

    if (v35) {
      char v36 = [v35 intValue] == 2;
    }
    else {
      char v36 = 1;
    }
    self->_tpSettings.zoomToggle = v36;
    v37 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"HIDScrollZoomModifierMask"];
    self->_tpSettings.restingScroll = [v37 intValue] != 0;

    [(TrackpadSettingsManager *)self determineSurfaceOrientationSettings];
    v38 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadThreeFingerHorizSwipeGesture"];
    LODWORD(v37) = [v38 intValue];

    v39 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadThreeFingerVertSwipeGesture"];
    unsigned int v40 = [v39 intValue];

    self->_tpSettings.navigationSwipe3F.v = v37 == 1;
    HIBYTE(self->_tpSettings.surfaceOrientationMode) = v40 == 1;
    self->_tpSettings.dockSwipe3F.v = v37 == 2;
    self->_tpSettings.navigationSwipe4F.h = v40 == 2;
    v41 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadFourFingerHorizSwipeGesture"];
    LODWORD(v39) = [v41 intValue];

    v42 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadFourFingerVertSwipeGesture"];
    LODWORD(v41) = [v42 intValue];

    self->_tpSettings.navigationSwipe4F.v = v39 == 1;
    self->_tpSettings.navigationSwipe3F.h = v41 == 1;
    self->_tpSettings.dockSwipe4F.v = v39 == 2;
    self->_tpSettings.dockSwipe3F.h = v41 == 2;
    v43 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadFourFingerPinchGesture"];
    self->_tpSettings.showDefinition = [v43 intValue] == 2;

    v44 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"TrackpadFiveFingerPinchGesture"];
    self->_tpSettings.dockScale4F = [v44 intValue] == 2;

    v45 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"FirstClickThreshold"];

    if (v45) {
      unsigned int v46 = [v45 unsignedIntValue];
    }
    else {
      unsigned int v46 = 1;
    }
    *(unsigned int *)((char *)&self->_tpSettings.rightClickZone + 3) = v46;
    v47 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"SecondClickThreshold"];

    if (v47) {
      unsigned int v48 = [v47 unsignedIntValue];
    }
    else {
      unsigned int v48 = 1;
    }
    *(unsigned int *)((char *)&self->_tpSettings.firstClickThreshold + 3) = v48;
    v49 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"ActuationStrength"];

    if (v49) {
      unsigned int v50 = [v49 unsignedIntValue];
    }
    else {
      unsigned int v50 = 1;
    }
    *(unsigned int *)((char *)&self->_tpSettings.secondClickThreshold + 3) = v50;
    id v53 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"ActuateDetents"];

    if (v53) {
      unsigned int v51 = [v53 unsignedIntValue];
    }
    else {
      unsigned int v51 = 1;
    }
    *(unsigned int *)((char *)&self->_tpSettings.actuationStrength + 3) = v51;
    v15 = [(NSMutableDictionary *)self->_tpPreferences objectForKeyedSubscript:@"ForceSuppressed"];
    self->_tpSettings.tapClickWhileResting = [v15 BOOLValue];
  }

  self->_tpSettings.supportsScrollMomentum = 0;
  BOOL v52 = (self->_parserOptions & 4) != 0
     || MTPreferencesGetAppBooleanValue(@"ScrollMomentum", @"com.apple.MultitouchSupport", 0);
  self->_tpSettings.scrollMomentumEnabled = v52;
  self->_tpSettings.pointMomentum = MTPreferencesGetAppBooleanValue(@"PointerInertia", @"com.apple.MultitouchSupport", 0);
  self->_tpSettings.screenZoom = MTPreferencesGetAppBooleanValue(@"SymmetricZoom", @"com.apple.MultitouchSupport", 0);
  self->_tpSettings.edgeNotificationSwipe2F = self->_notificationCenterActive;
}

- (void)determineSurfaceOrientationSettings
{
  if ((self->_parserOptions & 8) != 0)
  {
    unsigned int v3 = [(id)objc_opt_class() determineSavedOrientationModeForDevice:self->_mtDeviceRef];
    *(int *)((char *)&self->_tpSettings.surfaceOrientation + 3) = v3;
    v4 = objc_opt_class();
    mtDeviceRef = self->_mtDeviceRef;
    if (v3 != 1)
    {
      [v4 saveSurfaceOrientationForDevice:mtDeviceRef orientation:0 eraseSetting:1];
      v4 = objc_opt_class();
      mtDeviceRef = self->_mtDeviceRef;
    }
    *(unsigned int *)((char *)&self->_tpSettings.actuateDetents + 3) = [v4 determineSavedOrientationForDevice:mtDeviceRef];
  }
}

+ (int)determineSavedOrientationModeForDevice:(__MTDevice *)a3
{
  if (!a3) {
    return 0;
  }
  IOHIDPreferencesSynchronize();
  unsigned int v6 = (void *)IOHIDPreferencesCopy();
  BOOL AppBooleanValue = MTPreferencesGetAppBooleanValue(@"ForceAutoOrientation", @"com.apple.MultitouchSupport", 0);
  BOOL v9 = [v6 unsignedIntValue] == 1 || AppBooleanValue;

  return v9;
}

+ (int)determineSavedOrientationForDevice:(__MTDevice *)a3
{
  if (a3)
  {
    IOHIDPreferencesSynchronize();
    SavedNameForDevice = (void *)mt_CreateSavedNameForDevice();
    unsigned int v7 = (void *)IOHIDPreferencesCopy();
    unsigned int v8 = v7;
    if (SavedNameForDevice && v7)
    {
      BOOL v9 = [v7 objectForKeyedSubscript:SavedNameForDevice];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 intValue]) {
        [v9 intValue];
      }
    }
  }
  return 0;
}

+ (void)saveSurfaceOrientationForDevice:(__MTDevice *)a3 orientation:(unsigned int)a4 eraseSetting:(id *)a5[32]
{
  if (a3)
  {
    int v6 = (int)a5;
    uint64_t v7 = *(void *)&a4;
    IOHIDPreferencesSynchronize();
    id SavedNameForDevice = (id)mt_CreateSavedNameForDevice();
    id v8 = (id)IOHIDPreferencesCopy();
    if (!v8 && (v6 & 1) == 0) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (SavedNameForDevice)
    {
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v6)
          {
            [v8 removeObjectForKey:SavedNameForDevice];
          }
          else
          {
            BOOL v9 = +[NSNumber numberWithUnsignedInt:v7];
            [v8 setObject:v9 forKeyedSubscript:SavedNameForDevice];
          }
          IOHIDPreferencesSet();
          IOHIDPreferencesSynchronize();
        }
      }
    }
  }
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<mt_StandardTrackpadSettings>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)116,(char)112,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->_tpSettings);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v12 = v5;
  CoderKey v13 = v5;
  CoderKey v10 = v5;
  CoderKey v11 = v5;
  CoderKey v9 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v9);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/TrackpadSettingsManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[TrackpadSettingsManager hsDecode:]();
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  HSUtil::Decoder::decodeCodable<mt_StandardTrackpadSettings>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)116,(char)112,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->_tpSettings);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/TrackpadSettingsManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[TrackpadSettingsManager hsDecode:]();
    }
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_8:
  if (v11.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11.var0);
  }
  var0 = v10.var0;
  v10.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v6;
}

- (int)disablingDeviceCount
{
  return self->_disablingDeviceCount;
}

- (BOOL)notificationCenterActive
{
  return self->_notificationCenterActive;
}

- (NSMutableDictionary)tpPreferences
{
  return self->_tpPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_userPrefDict, 0);

  objc_storeStrong((id *)&self->_tpPreferences, 0);
}

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end