@interface PKHoverSettings
+ (BOOL)allowDoubleTapOnlyWithPencilHover;
+ (BOOL)isHoverActive;
+ (BOOL)isHoverEnabled;
+ (id)keyPathsForValuesAffectingToolShadowMaxOpacity;
+ (id)keyPathsForValuesAffectingToolShadowMaxOpacityInDrawingCanvas;
+ (id)sharedSettings;
+ (void)checkIfHoverIsEnabled:(id)a3;
+ (void)checkIfHoverIsSupported:(id)a3;
+ (void)forceHoverSupported;
+ (void)prewarmIfNecessary;
- (BOOL)_shouldSaveSettings;
- (BOOL)avoidSwitchingToolsOutsideHoverRange;
- (BOOL)increasedContrastEnabled;
- (BOOL)noiseIsHeightBased;
- (BOOL)scribbleCommitOnLift;
- (BOOL)scribbleFlashCursorActive;
- (BOOL)scribbleFocusActive;
- (BOOL)scribbleHoverStrongActive;
- (BOOL)scribbleIBeamActive;
- (BOOL)scribbleLineBreakHandling;
- (BOOL)scribbleLineBreakMultiLineEnabled;
- (BOOL)scribbleShowWritableElementsActive;
- (BOOL)showDebugLayer;
- (BOOL)snapToShapeActive;
- (BOOL)supportTouchPad;
- (BOOL)toolIndicatorActive;
- (BOOL)toolPreviewActive;
- (BOOL)toolPreviewActiveForTesting;
- (BOOL)toolPreviewShouldWaitForHoverAndHold;
- (BOOL)toolShadowActive;
- (BOOL)toolShadowActiveOnOldPencils;
- (BOOL)toolShadowActiveOutsideNotes;
- (BOOL)toolShadowLocationWorkaround;
- (BOOL)toolSwitchIndicatorActive;
- (BOOL)tooltipsActive;
- (PKHoverSettings)init;
- (double)altitudeJitterNoise;
- (double)altitudeOffsetNoise;
- (double)azimuthJitterNoise;
- (double)azimuthOffsetNoise;
- (double)deactivateExtraDistance;
- (double)erasePreviewAlphaFactor;
- (double)extraHoverPreviewDelay;
- (double)hoverAndHoldActionTimeInterval;
- (double)hoverAndHoldTriggerTimeInterval;
- (double)inactivityTimeInterval;
- (double)maxZDistance;
- (double)predictionTimeInterval;
- (double)screenEdgeSizeInMillimeters;
- (double)scribbleLineBreakMultiLineDelay;
- (double)toolPreviewAzimuthTiltMaxZDistance;
- (double)toolPreviewFadeOutDistance;
- (double)toolPreviewMaxZDistance;
- (double)toolShadowFadeInDistance;
- (double)toolShadowMaxBlurRadius;
- (double)toolShadowMaxOpacity;
- (double)toolShadowMaxOpacityForIncreasedContrast;
- (double)toolShadowMaxOpacityInDrawingCanvas;
- (double)toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast;
- (double)toolShadowMaxOpacityInDrawingCanvasNormal;
- (double)toolShadowMaxOpacityNormal;
- (double)toolShadowMovementSpeedHideThreshold;
- (double)weightedAverageAltitudeFactor;
- (double)weightedAverageAzimuthFactor;
- (double)weightedAverageLocationFactor;
- (id)settingsDictionaryRepresentation;
- (int)altitudeBuckets;
- (int)azimuthBuckets;
- (int)scribbleLineBreakMultiLineMaxLines;
- (int64_t)debugCursorType;
- (unint64_t)numFramesExtraLatency;
- (unint64_t)numFramesReduceFramerate;
- (void)_darkerSystemColorsStatusDidChange:(id)a3;
- (void)_loadDefaultValues;
- (void)_scheduleSavingSettingsSoon;
- (void)dealloc;
- (void)loadSettingsFromDictionary:(id)a3;
- (void)loadSettingsFromUserDefaults;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetToDefaultValues;
- (void)saveSettingsToUserDefaults;
- (void)setAltitudeBuckets:(int)a3;
- (void)setAltitudeJitterNoise:(double)a3;
- (void)setAltitudeOffsetNoise:(double)a3;
- (void)setAvoidSwitchingToolsOutsideHoverRange:(BOOL)a3;
- (void)setAzimuthBuckets:(int)a3;
- (void)setAzimuthJitterNoise:(double)a3;
- (void)setAzimuthOffsetNoise:(double)a3;
- (void)setDeactivateExtraDistance:(double)a3;
- (void)setDebugCursorType:(int64_t)a3;
- (void)setErasePreviewAlphaFactor:(double)a3;
- (void)setExtraHoverPreviewDelay:(double)a3;
- (void)setHoverAndHoldActionTimeInterval:(double)a3;
- (void)setHoverAndHoldTriggerTimeInterval:(double)a3;
- (void)setInactivityTimeInterval:(double)a3;
- (void)setIncreasedContrastEnabled:(BOOL)a3;
- (void)setMaxZDistance:(double)a3;
- (void)setNoiseIsHeightBased:(BOOL)a3;
- (void)setNumFramesExtraLatency:(unint64_t)a3;
- (void)setNumFramesReduceFramerate:(unint64_t)a3;
- (void)setPredictionTimeInterval:(double)a3;
- (void)setScreenEdgeSizeInMillimeters:(double)a3;
- (void)setScribbleCommitOnLift:(BOOL)a3;
- (void)setScribbleFlashCursorActive:(BOOL)a3;
- (void)setScribbleFocusActive:(BOOL)a3;
- (void)setScribbleHoverStrongActive:(BOOL)a3;
- (void)setScribbleIBeamActive:(BOOL)a3;
- (void)setScribbleLineBreakHandling:(BOOL)a3;
- (void)setScribbleLineBreakMultiLineDelay:(double)a3;
- (void)setScribbleLineBreakMultiLineEnabled:(BOOL)a3;
- (void)setScribbleLineBreakMultiLineMaxLines:(int)a3;
- (void)setScribbleShowWritableElementsActive:(BOOL)a3;
- (void)setShowDebugLayer:(BOOL)a3;
- (void)setSnapToShapeActive:(BOOL)a3;
- (void)setSupportTouchPad:(BOOL)a3;
- (void)setToolIndicatorActive:(BOOL)a3;
- (void)setToolPreviewActive:(BOOL)a3;
- (void)setToolPreviewActiveForTesting:(BOOL)a3;
- (void)setToolPreviewAzimuthTiltMaxZDistance:(double)a3;
- (void)setToolPreviewFadeOutDistance:(double)a3;
- (void)setToolPreviewMaxZDistance:(double)a3;
- (void)setToolPreviewShouldWaitForHoverAndHold:(BOOL)a3;
- (void)setToolShadowActive:(BOOL)a3;
- (void)setToolShadowActiveOnOldPencils:(BOOL)a3;
- (void)setToolShadowActiveOutsideNotes:(BOOL)a3;
- (void)setToolShadowFadeInDistance:(double)a3;
- (void)setToolShadowLocationWorkaround:(BOOL)a3;
- (void)setToolShadowMaxBlurRadius:(double)a3;
- (void)setToolShadowMaxOpacityForIncreasedContrast:(double)a3;
- (void)setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:(double)a3;
- (void)setToolShadowMaxOpacityInDrawingCanvasNormal:(double)a3;
- (void)setToolShadowMaxOpacityNormal:(double)a3;
- (void)setToolShadowMovementSpeedHideThreshold:(double)a3;
- (void)setToolSwitchIndicatorActive:(BOOL)a3;
- (void)setTooltipsActive:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWeightedAverageAltitudeFactor:(double)a3;
- (void)setWeightedAverageAzimuthFactor:(double)a3;
- (void)setWeightedAverageLocationFactor:(double)a3;
@end

@implementation PKHoverSettings

+ (void)prewarmIfNecessary
{
  if (+[PKHoverSettings isHoverActive])
  {
    +[PKSettingsDaemon prewarmServiceConnectionIfNeeded];
  }
}

+ (BOOL)isHoverActive
{
  return (sForceHoverSupportedForTesting & 1) != 0 || PKMaxHoverHeight() > 0.0;
}

void __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke(uint64_t a1)
{
  BOOL v2 = PKMaxHoverHeight() > 0.0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke_2;
  v3[3] = &unk_1E64C6B68;
  id v4 = *(id *)(a1 + 32);
  BOOL v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)checkIfHoverIsSupported:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke;
  block[3] = &unk_1E64C6060;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (void)checkIfHoverIsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PKHoverSettings_checkIfHoverIsEnabled___block_invoke;
  v7[3] = &unk_1E64C67B8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__PKHoverSettings_checkIfHoverIsEnabled___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) isHoverEnabled];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__PKHoverSettings_checkIfHoverIsEnabled___block_invoke_2;
  v3[3] = &unk_1E64C6B68;
  id v4 = *(id *)(a1 + 32);
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __41__PKHoverSettings_checkIfHoverIsEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedSettings
{
  if (qword_1EB3C62B0 != -1) {
    dispatch_once(&qword_1EB3C62B0, &__block_literal_global_85);
  }
  char v2 = (void *)_MergedGlobals_159;

  return v2;
}

void __33__PKHoverSettings_sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(PKHoverSettings);
  v1 = (void *)_MergedGlobals_159;
  _MergedGlobals_159 = (uint64_t)v0;
}

- (PKHoverSettings)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKHoverSettings;
  char v2 = [(PKHoverSettings *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
    pencilDefaults = v2->_pencilDefaults;
    v2->_pencilDefaults = (NSUserDefaults *)v3;

    [(PKHoverSettings *)v2 _loadDefaultValues];
    [(PKHoverSettings *)v2 loadSettingsFromUserDefaults];
    if (![(PKHoverSettings *)v2 _shouldSaveSettings])
    {
      [(NSUserDefaults *)v2->_pencilDefaults addObserver:v2 forKeyPath:@"HoverDefaultsV14" options:1 context:&kKVOContext];
      v2->_didAddObserver = 1;
    }
    v2->_increasedContrastEnabled = UIAccessibilityDarkerSystemColorsEnabled();
    char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__darkerSystemColorsStatusDidChange_ name:*MEMORY[0x1E4FB2438] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_didAddObserver) {
    [(NSUserDefaults *)self->_pencilDefaults removeObserver:self forKeyPath:@"HoverDefaultsV14" context:kKVOContext];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKHoverSettings;
  [(PKHoverSettings *)&v4 dealloc];
}

+ (void)forceHoverSupported
{
  sForceHoverSupportedForTesting = 1;
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  BOOL v4 = UIAccessibilityDarkerSystemColorsEnabled();

  [(PKHoverSettings *)self setIncreasedContrastEnabled:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kKVOContext == a6 && [v10 isEqualToString:@"HoverDefaultsV14"])
  {
    [(PKHoverSettings *)self loadSettingsFromUserDefaults];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKHoverSettings;
    [(PKHoverSettings *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)_shouldSaveSettings
{
  char v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.Preferences"];

  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKHoverSettings;
  [(PKHoverSettings *)&v5 setValue:a3 forKey:a4];
  if ([(PKHoverSettings *)self _shouldSaveSettings]) {
    [(PKHoverSettings *)self _scheduleSavingSettingsSoon];
  }
}

+ (BOOL)isHoverEnabled
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isHoverActive] && (uint64_t v2 = IOHIDEventSystemClientCreateWithType()) != 0)
  {
    uint64_t v3 = (__IOHIDEventSystemClient *)v2;
    v18[0] = @"PrimaryUsagePage";
    v18[1] = @"PrimaryUsage";
    v19[0] = &unk_1F200E928;
    v19[1] = &unk_1F200E940;
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    IOHIDEventSystemClientSetMatching();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CFArrayRef v5 = IOHIDEventSystemClientCopyServices(v3);
    uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v13 + 1) + 8 * i), @"HoverDisabled");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v11 = objc_msgSend(v10, "BOOLValue", (void)v13) ^ 1;

            goto LABEL_14;
          }
        }
        uint64_t v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v11) = 0;
LABEL_14:

    CFRelease(v3);
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

+ (BOOL)allowDoubleTapOnlyWithPencilHover
{
  v21[2] = *MEMORY[0x1E4F143B8];
  int v2 = [a1 isHoverActive];
  if (v2)
  {
    uint64_t v3 = IOHIDEventSystemClientCreateWithType();
    if (v3)
    {
      char v4 = (__IOHIDEventSystemClient *)v3;
      v20[0] = @"PrimaryUsagePage";
      v20[1] = @"PrimaryUsage";
      v21[0] = &unk_1F200E958;
      v21[1] = &unk_1F200E970;
      CFArrayRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      IOHIDEventSystemClientSetMatching();
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      CFArrayRef v6 = IOHIDEventSystemClientCopyServices(v4);
      uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            int v11 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v15 + 1) + 8 * v10), @"GesturesOnlyWhileHoveringEnabled");
            if (v11)
            {
              long long v13 = v11;
              int v12 = objc_msgSend(v11, "BOOLValue", (void)v15);

              goto LABEL_13;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      int v12 = 0;
LABEL_13:

      CFRelease(v4);
    }
    else
    {
      int v12 = 0;
    }
    LOBYTE(v2) = v12 != 0;
  }
  return v2;
}

- (id)settingsDictionaryRepresentation
{
  v87[54] = *MEMORY[0x1E4F143B8];
  v86[0] = @"showDebugLayer";
  v85 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings showDebugLayer](self, "showDebugLayer"));
  v87[0] = v85;
  v86[1] = @"supportTouchPad";
  v84 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings supportTouchPad](self, "supportTouchPad"));
  v87[1] = v84;
  v86[2] = @"debugCursorType";
  v83 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKHoverSettings debugCursorType](self, "debugCursorType"));
  v87[2] = v83;
  v86[3] = @"tooltipsActive";
  v82 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings tooltipsActive](self, "tooltipsActive"));
  v87[3] = v82;
  v86[4] = @"snapToShapeActive";
  v81 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings snapToShapeActive](self, "snapToShapeActive"));
  v87[4] = v81;
  v86[5] = @"toolIndicatorActive";
  v80 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolIndicatorActive](self, "toolIndicatorActive"));
  v87[5] = v80;
  v86[6] = @"toolShadowActive";
  v79 = [NSNumber numberWithBool:self->_toolShadowActive];
  v87[6] = v79;
  v86[7] = @"toolShadowActiveOutsideNotes";
  v78 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolShadowActiveOutsideNotes](self, "toolShadowActiveOutsideNotes"));
  v87[7] = v78;
  v86[8] = @"toolShadowLocationWorkaround";
  v77 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolShadowLocationWorkaround](self, "toolShadowLocationWorkaround"));
  v87[8] = v77;
  v86[9] = @"toolShadowActiveOnOldPencils";
  v76 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolShadowActiveOnOldPencils](self, "toolShadowActiveOnOldPencils"));
  v87[9] = v76;
  v86[10] = @"toolShadowMaxOpacityNormal";
  uint64_t v3 = NSNumber;
  [(PKHoverSettings *)self toolShadowMaxOpacityNormal];
  v75 = objc_msgSend(v3, "numberWithDouble:");
  v87[10] = v75;
  v86[11] = @"toolShadowMaxOpacityForIncreasedContrast";
  char v4 = NSNumber;
  [(PKHoverSettings *)self toolShadowMaxOpacityForIncreasedContrast];
  v74 = objc_msgSend(v4, "numberWithDouble:");
  v87[11] = v74;
  v86[12] = @"toolShadowMaxOpacityInDrawingCanvasNormal";
  CFArrayRef v5 = NSNumber;
  [(PKHoverSettings *)self toolShadowMaxOpacityInDrawingCanvasNormal];
  v73 = objc_msgSend(v5, "numberWithDouble:");
  v87[12] = v73;
  v86[13] = @"toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast";
  CFArrayRef v6 = NSNumber;
  [(PKHoverSettings *)self toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast];
  v72 = objc_msgSend(v6, "numberWithDouble:");
  v87[13] = v72;
  v86[14] = @"toolShadowMaxBlurRadius";
  uint64_t v7 = NSNumber;
  [(PKHoverSettings *)self toolShadowMaxBlurRadius];
  v71 = objc_msgSend(v7, "numberWithDouble:");
  v87[14] = v71;
  v86[15] = @"toolShadowFadeInDistance";
  uint64_t v8 = NSNumber;
  [(PKHoverSettings *)self toolShadowFadeInDistance];
  v70 = objc_msgSend(v8, "numberWithDouble:");
  v87[15] = v70;
  v86[16] = @"toolShadowMovementSpeedHideThreshold";
  uint64_t v9 = NSNumber;
  [(PKHoverSettings *)self toolShadowMovementSpeedHideThreshold];
  v69 = objc_msgSend(v9, "numberWithDouble:");
  v87[16] = v69;
  v86[17] = @"toolPreviewShouldWaitForHoverAndHold";
  v68 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolPreviewShouldWaitForHoverAndHold](self, "toolPreviewShouldWaitForHoverAndHold"));
  v87[17] = v68;
  v86[18] = @"toolSwitchIndicatorActive";
  v67 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings toolSwitchIndicatorActive](self, "toolSwitchIndicatorActive"));
  v87[18] = v67;
  v86[19] = @"avoidSwitchingToolsOutsideHoverRange";
  v66 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings avoidSwitchingToolsOutsideHoverRange](self, "avoidSwitchingToolsOutsideHoverRange"));
  v87[19] = v66;
  v86[20] = @"screenEdgeSizeInMillimeters";
  uint64_t v10 = NSNumber;
  [(PKHoverSettings *)self screenEdgeSizeInMillimeters];
  v65 = objc_msgSend(v10, "numberWithDouble:");
  v87[20] = v65;
  v86[21] = @"maxZDistance";
  int v11 = NSNumber;
  [(PKHoverSettings *)self maxZDistance];
  v64 = objc_msgSend(v11, "numberWithDouble:");
  v87[21] = v64;
  v86[22] = @"erasePreviewAlphaFactor";
  int v12 = NSNumber;
  [(PKHoverSettings *)self erasePreviewAlphaFactor];
  v63 = objc_msgSend(v12, "numberWithDouble:");
  v87[22] = v63;
  v86[23] = @"toolPreviewMaxZDistance";
  long long v13 = NSNumber;
  [(PKHoverSettings *)self toolPreviewMaxZDistance];
  v62 = objc_msgSend(v13, "numberWithDouble:");
  v87[23] = v62;
  v86[24] = @"toolPreviewFadeOutDistance";
  long long v14 = NSNumber;
  [(PKHoverSettings *)self toolPreviewFadeOutDistance];
  v61 = objc_msgSend(v14, "numberWithDouble:");
  v87[24] = v61;
  v86[25] = @"toolPreviewAzimuthTiltMaxZDistance";
  long long v15 = NSNumber;
  [(PKHoverSettings *)self toolPreviewAzimuthTiltMaxZDistance];
  v60 = objc_msgSend(v15, "numberWithDouble:");
  v87[25] = v60;
  v86[26] = @"deactivateExtraDistance";
  long long v16 = NSNumber;
  [(PKHoverSettings *)self deactivateExtraDistance];
  v59 = objc_msgSend(v16, "numberWithDouble:");
  v87[26] = v59;
  v86[27] = @"predictionTimeInterval";
  long long v17 = NSNumber;
  [(PKHoverSettings *)self predictionTimeInterval];
  v58 = objc_msgSend(v17, "numberWithDouble:");
  v87[27] = v58;
  v86[28] = @"extraHoverPreviewDelay";
  long long v18 = NSNumber;
  [(PKHoverSettings *)self extraHoverPreviewDelay];
  v57 = objc_msgSend(v18, "numberWithDouble:");
  v87[28] = v57;
  v86[29] = @"inactivityTimeInterval";
  v19 = NSNumber;
  [(PKHoverSettings *)self inactivityTimeInterval];
  v56 = objc_msgSend(v19, "numberWithDouble:");
  v87[29] = v56;
  v86[30] = @"hoverAndHoldTriggerTimeInterval";
  v20 = NSNumber;
  [(PKHoverSettings *)self hoverAndHoldTriggerTimeInterval];
  v55 = objc_msgSend(v20, "numberWithDouble:");
  v87[30] = v55;
  v86[31] = @"hoverAndHoldActionTimeInterval";
  v21 = NSNumber;
  [(PKHoverSettings *)self hoverAndHoldActionTimeInterval];
  v54 = objc_msgSend(v21, "numberWithDouble:");
  v87[31] = v54;
  v86[32] = @"numFramesExtraLatency";
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKHoverSettings numFramesExtraLatency](self, "numFramesExtraLatency"));
  v87[32] = v53;
  v86[33] = @"numFramesReduceFramerate";
  v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKHoverSettings numFramesReduceFramerate](self, "numFramesReduceFramerate"));
  v87[33] = v52;
  v86[34] = @"weightedAverageAltitudeFactor";
  v22 = NSNumber;
  [(PKHoverSettings *)self weightedAverageAltitudeFactor];
  v51 = objc_msgSend(v22, "numberWithDouble:");
  v87[34] = v51;
  v86[35] = @"weightedAverageAzimuthFactor";
  v23 = NSNumber;
  [(PKHoverSettings *)self weightedAverageAzimuthFactor];
  v50 = objc_msgSend(v23, "numberWithDouble:");
  v87[35] = v50;
  v86[36] = @"weightedAverageLocationFactor";
  v24 = NSNumber;
  [(PKHoverSettings *)self weightedAverageLocationFactor];
  v49 = objc_msgSend(v24, "numberWithDouble:");
  v87[36] = v49;
  v86[37] = @"scribbleFocusActive";
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleFocusActive](self, "scribbleFocusActive"));
  v87[37] = v48;
  v86[38] = @"scribbleFlashCursorActive";
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleFlashCursorActive](self, "scribbleFlashCursorActive"));
  v87[38] = v47;
  v86[39] = @"scribbleShowWritableElementsActive";
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleShowWritableElementsActive](self, "scribbleShowWritableElementsActive"));
  v87[39] = v46;
  v86[40] = @"scribbleHoverStrongActive";
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleHoverStrongActive](self, "scribbleHoverStrongActive"));
  v87[40] = v45;
  v86[41] = @"scribbleCommitOnLift";
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleCommitOnLift](self, "scribbleCommitOnLift"));
  v87[41] = v44;
  v86[42] = @"scribbleLineBreakHandling";
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleLineBreakHandling](self, "scribbleLineBreakHandling"));
  v87[42] = v43;
  v86[43] = @"scribbleLineBreakMultiLineDelay";
  v25 = NSNumber;
  [(PKHoverSettings *)self scribbleLineBreakMultiLineDelay];
  v42 = objc_msgSend(v25, "numberWithDouble:");
  v87[43] = v42;
  v86[44] = @"scribbleLineBreakMultiLineEnabled";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleLineBreakMultiLineEnabled](self, "scribbleLineBreakMultiLineEnabled"));
  v87[44] = v41;
  v86[45] = @"scribbleLineBreakMultiLineMaxLines";
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[PKHoverSettings scribbleLineBreakMultiLineMaxLines](self, "scribbleLineBreakMultiLineMaxLines"));
  v87[45] = v26;
  v86[46] = @"scribbleIBeamActive";
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings scribbleIBeamActive](self, "scribbleIBeamActive"));
  v87[46] = v27;
  v86[47] = @"noiseIsHeightBased";
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[PKHoverSettings noiseIsHeightBased](self, "noiseIsHeightBased"));
  v87[47] = v28;
  v86[48] = @"azimuthJitterNoise";
  v29 = NSNumber;
  [(PKHoverSettings *)self azimuthJitterNoise];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  v87[48] = v30;
  v86[49] = @"altitudeJitterNoise";
  v31 = NSNumber;
  [(PKHoverSettings *)self altitudeJitterNoise];
  v32 = objc_msgSend(v31, "numberWithDouble:");
  v87[49] = v32;
  v86[50] = @"azimuthOffsetNoise";
  v33 = NSNumber;
  [(PKHoverSettings *)self azimuthOffsetNoise];
  v34 = objc_msgSend(v33, "numberWithDouble:");
  v87[50] = v34;
  v86[51] = @"altitudeOffsetNoise";
  v35 = NSNumber;
  [(PKHoverSettings *)self altitudeOffsetNoise];
  v36 = objc_msgSend(v35, "numberWithDouble:");
  v87[51] = v36;
  v86[52] = @"azimuthBuckets";
  v37 = objc_msgSend(NSNumber, "numberWithInt:", -[PKHoverSettings azimuthBuckets](self, "azimuthBuckets"));
  v87[52] = v37;
  v86[53] = @"altitudeBuckets";
  v38 = objc_msgSend(NSNumber, "numberWithInt:", -[PKHoverSettings altitudeBuckets](self, "altitudeBuckets"));
  v87[53] = v38;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:54];

  return v39;
}

- (void)loadSettingsFromDictionary:(id)a3
{
  id v112 = a3;
  if (v112)
  {
    char v4 = [v112 objectForKeyedSubscript:@"showDebugLayer"];

    if (v4)
    {
      CFArrayRef v5 = [v112 objectForKeyedSubscript:@"showDebugLayer"];
      -[PKHoverSettings setShowDebugLayer:](self, "setShowDebugLayer:", [v5 BOOLValue]);
    }
    CFArrayRef v6 = [v112 objectForKeyedSubscript:@"supportTouchPad"];

    if (v6)
    {
      uint64_t v7 = [v112 objectForKeyedSubscript:@"supportTouchPad"];
      -[PKHoverSettings setSupportTouchPad:](self, "setSupportTouchPad:", [v7 BOOLValue]);
    }
    uint64_t v8 = [v112 objectForKeyedSubscript:@"debugCursorType"];

    if (v8)
    {
      uint64_t v9 = [v112 objectForKeyedSubscript:@"debugCursorType"];
      -[PKHoverSettings setDebugCursorType:](self, "setDebugCursorType:", [v9 integerValue]);
    }
    uint64_t v10 = [v112 objectForKeyedSubscript:@"tooltipsActive"];

    if (v10)
    {
      int v11 = [v112 objectForKeyedSubscript:@"tooltipsActive"];
      -[PKHoverSettings setTooltipsActive:](self, "setTooltipsActive:", [v11 BOOLValue]);
    }
    int v12 = [v112 objectForKeyedSubscript:@"snapToShapeActive"];

    if (v12)
    {
      long long v13 = [v112 objectForKeyedSubscript:@"snapToShapeActive"];
      -[PKHoverSettings setSnapToShapeActive:](self, "setSnapToShapeActive:", [v13 BOOLValue]);
    }
    long long v14 = [v112 objectForKeyedSubscript:@"toolIndicatorActive"];

    if (v14)
    {
      long long v15 = [v112 objectForKeyedSubscript:@"toolIndicatorActive"];
      -[PKHoverSettings setToolIndicatorActive:](self, "setToolIndicatorActive:", [v15 BOOLValue]);
    }
    long long v16 = [v112 objectForKeyedSubscript:@"toolShadowActive"];

    if (v16)
    {
      long long v17 = [v112 objectForKeyedSubscript:@"toolShadowActive"];
      -[PKHoverSettings setToolShadowActive:](self, "setToolShadowActive:", [v17 BOOLValue]);
    }
    long long v18 = [v112 objectForKeyedSubscript:@"toolShadowActiveOutsideNotes"];

    if (v18)
    {
      v19 = [v112 objectForKeyedSubscript:@"toolShadowActiveOutsideNotes"];
      -[PKHoverSettings setToolShadowActiveOutsideNotes:](self, "setToolShadowActiveOutsideNotes:", [v19 BOOLValue]);
    }
    v20 = [v112 objectForKeyedSubscript:@"toolShadowLocationWorkaround"];

    if (v20)
    {
      v21 = [v112 objectForKeyedSubscript:@"toolShadowLocationWorkaround"];
      -[PKHoverSettings setToolShadowLocationWorkaround:](self, "setToolShadowLocationWorkaround:", [v21 BOOLValue]);
    }
    v22 = [v112 objectForKeyedSubscript:@"toolShadowActiveOnOldPencils"];

    if (v22)
    {
      v23 = [v112 objectForKeyedSubscript:@"toolShadowActiveOnOldPencils"];
      -[PKHoverSettings setToolShadowActiveOnOldPencils:](self, "setToolShadowActiveOnOldPencils:", [v23 BOOLValue]);
    }
    v24 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityNormal"];

    if (v24)
    {
      v25 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityNormal"];
      [v25 doubleValue];
      -[PKHoverSettings setToolShadowMaxOpacityNormal:](self, "setToolShadowMaxOpacityNormal:");
    }
    v26 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityForIncreasedContrast"];

    if (v26)
    {
      v27 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityForIncreasedContrast"];
      [v27 doubleValue];
      -[PKHoverSettings setToolShadowMaxOpacityForIncreasedContrast:](self, "setToolShadowMaxOpacityForIncreasedContrast:");
    }
    v28 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityInDrawingCanvasNormal"];

    if (v28)
    {
      v29 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityInDrawingCanvasNormal"];
      [v29 doubleValue];
      -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasNormal:](self, "setToolShadowMaxOpacityInDrawingCanvasNormal:");
    }
    v30 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast"];

    if (v30)
    {
      v31 = [v112 objectForKeyedSubscript:@"toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast"];
      [v31 doubleValue];
      -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:](self, "setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:");
    }
    v32 = [v112 objectForKeyedSubscript:@"toolShadowFadeInDistance"];

    if (v32)
    {
      v33 = [v112 objectForKeyedSubscript:@"toolShadowFadeInDistance"];
      [v33 doubleValue];
      -[PKHoverSettings setToolShadowFadeInDistance:](self, "setToolShadowFadeInDistance:");
    }
    v34 = [v112 objectForKeyedSubscript:@"toolShadowMaxBlurRadius"];

    if (v34)
    {
      v35 = [v112 objectForKeyedSubscript:@"toolShadowMaxBlurRadius"];
      [v35 doubleValue];
      -[PKHoverSettings setToolShadowMaxBlurRadius:](self, "setToolShadowMaxBlurRadius:");
    }
    v36 = [v112 objectForKeyedSubscript:@"toolShadowMovementSpeedHideThreshold"];

    if (v36)
    {
      v37 = [v112 objectForKeyedSubscript:@"toolShadowMovementSpeedHideThreshold"];
      [v37 doubleValue];
      -[PKHoverSettings setToolShadowMovementSpeedHideThreshold:](self, "setToolShadowMovementSpeedHideThreshold:");
    }
    v38 = [v112 objectForKeyedSubscript:@"toolPreviewShouldWaitForHoverAndHold"];

    if (v38)
    {
      v39 = [v112 objectForKeyedSubscript:@"toolPreviewShouldWaitForHoverAndHold"];
      -[PKHoverSettings setToolPreviewShouldWaitForHoverAndHold:](self, "setToolPreviewShouldWaitForHoverAndHold:", [v39 BOOLValue]);
    }
    v40 = [v112 objectForKeyedSubscript:@"toolSwitchIndicatorActive"];

    if (v40)
    {
      v41 = [v112 objectForKeyedSubscript:@"toolSwitchIndicatorActive"];
      -[PKHoverSettings setToolSwitchIndicatorActive:](self, "setToolSwitchIndicatorActive:", [v41 BOOLValue]);
    }
    v42 = [v112 objectForKeyedSubscript:@"avoidSwitchingToolsOutsideHoverRange"];

    if (v42)
    {
      v43 = [v112 objectForKeyedSubscript:@"avoidSwitchingToolsOutsideHoverRange"];
      -[PKHoverSettings setAvoidSwitchingToolsOutsideHoverRange:](self, "setAvoidSwitchingToolsOutsideHoverRange:", [v43 BOOLValue]);
    }
    v44 = [v112 objectForKeyedSubscript:@"screenEdgeSizeInMillimeters"];

    if (v44)
    {
      v45 = [v112 objectForKeyedSubscript:@"screenEdgeSizeInMillimeters"];
      [v45 doubleValue];
      -[PKHoverSettings setScreenEdgeSizeInMillimeters:](self, "setScreenEdgeSizeInMillimeters:");
    }
    v46 = [v112 objectForKeyedSubscript:@"maxZDistance"];

    if (v46)
    {
      v47 = [v112 objectForKeyedSubscript:@"maxZDistance"];
      [v47 doubleValue];
      -[PKHoverSettings setMaxZDistance:](self, "setMaxZDistance:");
    }
    v48 = [v112 objectForKeyedSubscript:@"erasePreviewAlphaFactor"];

    if (v48)
    {
      v49 = [v112 objectForKeyedSubscript:@"erasePreviewAlphaFactor"];
      [v49 doubleValue];
      -[PKHoverSettings setErasePreviewAlphaFactor:](self, "setErasePreviewAlphaFactor:");
    }
    v50 = [v112 objectForKeyedSubscript:@"toolPreviewMaxZDistance"];

    if (v50)
    {
      v51 = [v112 objectForKeyedSubscript:@"toolPreviewMaxZDistance"];
      [v51 doubleValue];
      -[PKHoverSettings setToolPreviewMaxZDistance:](self, "setToolPreviewMaxZDistance:");
    }
    v52 = [v112 objectForKeyedSubscript:@"toolPreviewFadeOutDistance"];

    if (v52)
    {
      v53 = [v112 objectForKeyedSubscript:@"toolPreviewFadeOutDistance"];
      [v53 doubleValue];
      -[PKHoverSettings setToolPreviewFadeOutDistance:](self, "setToolPreviewFadeOutDistance:");
    }
    v54 = [v112 objectForKeyedSubscript:@"toolPreviewAzimuthTiltMaxZDistance"];

    if (v54)
    {
      v55 = [v112 objectForKeyedSubscript:@"toolPreviewAzimuthTiltMaxZDistance"];
      [v55 doubleValue];
      -[PKHoverSettings setToolPreviewAzimuthTiltMaxZDistance:](self, "setToolPreviewAzimuthTiltMaxZDistance:");
    }
    v56 = [v112 objectForKeyedSubscript:@"deactivateExtraDistance"];

    if (v56)
    {
      v57 = [v112 objectForKeyedSubscript:@"deactivateExtraDistance"];
      [v57 doubleValue];
      -[PKHoverSettings setDeactivateExtraDistance:](self, "setDeactivateExtraDistance:");
    }
    v58 = [v112 objectForKeyedSubscript:@"predictionTimeInterval"];

    if (v58)
    {
      v59 = [v112 objectForKeyedSubscript:@"predictionTimeInterval"];
      [v59 doubleValue];
      -[PKHoverSettings setPredictionTimeInterval:](self, "setPredictionTimeInterval:");
    }
    v60 = [v112 objectForKeyedSubscript:@"extraHoverPreviewDelay"];

    if (v60)
    {
      v61 = [v112 objectForKeyedSubscript:@"extraHoverPreviewDelay"];
      [v61 doubleValue];
      -[PKHoverSettings setExtraHoverPreviewDelay:](self, "setExtraHoverPreviewDelay:");
    }
    v62 = [v112 objectForKeyedSubscript:@"inactivityTimeInterval"];

    if (v62)
    {
      v63 = [v112 objectForKeyedSubscript:@"inactivityTimeInterval"];
      [v63 doubleValue];
      -[PKHoverSettings setInactivityTimeInterval:](self, "setInactivityTimeInterval:");
    }
    v64 = [v112 objectForKeyedSubscript:@"hoverAndHoldTriggerTimeInterval"];

    if (v64)
    {
      v65 = [v112 objectForKeyedSubscript:@"hoverAndHoldTriggerTimeInterval"];
      [v65 doubleValue];
      -[PKHoverSettings setHoverAndHoldTriggerTimeInterval:](self, "setHoverAndHoldTriggerTimeInterval:");
    }
    v66 = [v112 objectForKeyedSubscript:@"hoverAndHoldActionTimeInterval"];

    if (v66)
    {
      v67 = [v112 objectForKeyedSubscript:@"hoverAndHoldActionTimeInterval"];
      [v67 doubleValue];
      -[PKHoverSettings setHoverAndHoldActionTimeInterval:](self, "setHoverAndHoldActionTimeInterval:");
    }
    v68 = [v112 objectForKeyedSubscript:@"numFramesExtraLatency"];

    if (v68)
    {
      v69 = [v112 objectForKeyedSubscript:@"numFramesExtraLatency"];
      -[PKHoverSettings setNumFramesExtraLatency:](self, "setNumFramesExtraLatency:", [v69 integerValue]);
    }
    v70 = [v112 objectForKeyedSubscript:@"numFramesReduceFramerate"];

    if (v70)
    {
      v71 = [v112 objectForKeyedSubscript:@"numFramesReduceFramerate"];
      -[PKHoverSettings setNumFramesReduceFramerate:](self, "setNumFramesReduceFramerate:", [v71 integerValue]);
    }
    v72 = [v112 objectForKeyedSubscript:@"weightedAverageLocationFactor"];

    if (v72)
    {
      v73 = [v112 objectForKeyedSubscript:@"weightedAverageLocationFactor"];
      [v73 doubleValue];
      -[PKHoverSettings setWeightedAverageLocationFactor:](self, "setWeightedAverageLocationFactor:");
    }
    v74 = [v112 objectForKeyedSubscript:@"weightedAverageAzimuthFactor"];

    if (v74)
    {
      v75 = [v112 objectForKeyedSubscript:@"weightedAverageAzimuthFactor"];
      [v75 doubleValue];
      -[PKHoverSettings setWeightedAverageAzimuthFactor:](self, "setWeightedAverageAzimuthFactor:");
    }
    v76 = [v112 objectForKeyedSubscript:@"weightedAverageAltitudeFactor"];

    if (v76)
    {
      v77 = [v112 objectForKeyedSubscript:@"weightedAverageAltitudeFactor"];
      [v77 doubleValue];
      -[PKHoverSettings setWeightedAverageAltitudeFactor:](self, "setWeightedAverageAltitudeFactor:");
    }
    v78 = [v112 objectForKeyedSubscript:@"scribbleFocusActive"];

    if (v78)
    {
      v79 = [v112 objectForKeyedSubscript:@"scribbleFocusActive"];
      -[PKHoverSettings setScribbleFocusActive:](self, "setScribbleFocusActive:", [v79 BOOLValue]);
    }
    v80 = [v112 objectForKeyedSubscript:@"scribbleFlashCursorActive"];

    if (v80)
    {
      v81 = [v112 objectForKeyedSubscript:@"scribbleFlashCursorActive"];
      -[PKHoverSettings setScribbleFlashCursorActive:](self, "setScribbleFlashCursorActive:", [v81 BOOLValue]);
    }
    v82 = [v112 objectForKeyedSubscript:@"scribbleShowWritableElementsActive"];

    if (v82)
    {
      v83 = [v112 objectForKeyedSubscript:@"scribbleShowWritableElementsActive"];
      -[PKHoverSettings setScribbleShowWritableElementsActive:](self, "setScribbleShowWritableElementsActive:", [v83 BOOLValue]);
    }
    v84 = [v112 objectForKeyedSubscript:@"scribbleHoverStrongActive"];

    if (v84)
    {
      v85 = [v112 objectForKeyedSubscript:@"scribbleHoverStrongActive"];
      -[PKHoverSettings setScribbleHoverStrongActive:](self, "setScribbleHoverStrongActive:", [v85 BOOLValue]);
    }
    v86 = [v112 objectForKeyedSubscript:@"scribbleCommitOnLift"];

    if (v86)
    {
      v87 = [v112 objectForKeyedSubscript:@"scribbleCommitOnLift"];
      -[PKHoverSettings setScribbleCommitOnLift:](self, "setScribbleCommitOnLift:", [v87 BOOLValue]);
    }
    v88 = [v112 objectForKeyedSubscript:@"scribbleLineBreakHandling"];

    if (v88)
    {
      v89 = [v112 objectForKeyedSubscript:@"scribbleLineBreakHandling"];
      -[PKHoverSettings setScribbleLineBreakHandling:](self, "setScribbleLineBreakHandling:", [v89 BOOLValue]);
    }
    v90 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineDelay"];

    if (v90)
    {
      v91 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineDelay"];
      [v91 doubleValue];
      -[PKHoverSettings setScribbleLineBreakMultiLineDelay:](self, "setScribbleLineBreakMultiLineDelay:");
    }
    v92 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineEnabled"];

    if (v92)
    {
      v93 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineEnabled"];
      -[PKHoverSettings setScribbleLineBreakMultiLineEnabled:](self, "setScribbleLineBreakMultiLineEnabled:", [v93 BOOLValue]);
    }
    v94 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineMaxLines"];

    if (v94)
    {
      v95 = [v112 objectForKeyedSubscript:@"scribbleLineBreakMultiLineMaxLines"];
      -[PKHoverSettings setScribbleLineBreakMultiLineMaxLines:](self, "setScribbleLineBreakMultiLineMaxLines:", [v95 intValue]);
    }
    v96 = [v112 objectForKeyedSubscript:@"scribbleIBeamActive"];

    if (v96)
    {
      v97 = [v112 objectForKeyedSubscript:@"scribbleIBeamActive"];
      -[PKHoverSettings setScribbleIBeamActive:](self, "setScribbleIBeamActive:", [v97 BOOLValue]);
    }
    v98 = [v112 objectForKeyedSubscript:@"azimuthJitterNoise"];

    if (v98)
    {
      v99 = [v112 objectForKeyedSubscript:@"azimuthJitterNoise"];
      [v99 doubleValue];
      -[PKHoverSettings setAzimuthJitterNoise:](self, "setAzimuthJitterNoise:");
    }
    v100 = [v112 objectForKeyedSubscript:@"altitudeJitterNoise"];

    if (v100)
    {
      v101 = [v112 objectForKeyedSubscript:@"altitudeJitterNoise"];
      [v101 doubleValue];
      -[PKHoverSettings setAltitudeJitterNoise:](self, "setAltitudeJitterNoise:");
    }
    v102 = [v112 objectForKeyedSubscript:@"azimuthOffsetNoise"];

    if (v102)
    {
      v103 = [v112 objectForKeyedSubscript:@"azimuthOffsetNoise"];
      [v103 doubleValue];
      -[PKHoverSettings setAzimuthOffsetNoise:](self, "setAzimuthOffsetNoise:");
    }
    v104 = [v112 objectForKeyedSubscript:@"altitudeOffsetNoise"];

    if (v104)
    {
      v105 = [v112 objectForKeyedSubscript:@"altitudeOffsetNoise"];
      [v105 doubleValue];
      -[PKHoverSettings setAltitudeOffsetNoise:](self, "setAltitudeOffsetNoise:");
    }
    v106 = [v112 objectForKeyedSubscript:@"azimuthBuckets"];

    if (v106)
    {
      v107 = [v112 objectForKeyedSubscript:@"azimuthBuckets"];
      -[PKHoverSettings setAzimuthBuckets:](self, "setAzimuthBuckets:", [v107 intValue]);
    }
    v108 = [v112 objectForKeyedSubscript:@"altitudeBuckets"];

    if (v108)
    {
      v109 = [v112 objectForKeyedSubscript:@"altitudeBuckets"];
      -[PKHoverSettings setAltitudeBuckets:](self, "setAltitudeBuckets:", [v109 intValue]);
    }
    v110 = [v112 objectForKeyedSubscript:@"noiseIsHeightBased"];

    if (v110)
    {
      v111 = [v112 objectForKeyedSubscript:@"noiseIsHeightBased"];
      -[PKHoverSettings setNoiseIsHeightBased:](self, "setNoiseIsHeightBased:", [v111 BOOLValue]);
    }
  }
}

- (void)loadSettingsFromUserDefaults
{
  id v3 = [(NSUserDefaults *)self->_pencilDefaults dictionaryForKey:@"HoverDefaultsV14"];
  [(PKHoverSettings *)self loadSettingsFromDictionary:v3];
}

- (void)saveSettingsToUserDefaults
{
  if ([(PKHoverSettings *)self _shouldSaveSettings])
  {
    id v3 = [(PKHoverSettings *)self settingsDictionaryRepresentation];
    [(NSUserDefaults *)self->_pencilDefaults setObject:v3 forKey:@"HoverDefaultsV14"];
  }
}

- (void)resetToDefaultValues
{
  [(PKHoverSettings *)self _loadDefaultValues];

  [(PKHoverSettings *)self saveSettingsToUserDefaults];
}

- (void)_loadDefaultValues
{
  [(PKHoverSettings *)self setShowDebugLayer:0];
  [(PKHoverSettings *)self setSupportTouchPad:0];
  [(PKHoverSettings *)self setDebugCursorType:1];
  [(PKHoverSettings *)self setTooltipsActive:0];
  [(PKHoverSettings *)self setSnapToShapeActive:0];
  [(PKHoverSettings *)self setToolIndicatorActive:0];
  [(PKHoverSettings *)self setToolShadowActive:1];
  [(PKHoverSettings *)self setToolShadowLocationWorkaround:1];
  [(PKHoverSettings *)self setToolShadowActiveOutsideNotes:1];
  [(PKHoverSettings *)self setToolShadowActiveOnOldPencils:0];
  [(PKHoverSettings *)self setToolShadowMovementSpeedHideThreshold:-1.0];
  [(PKHoverSettings *)self setToolPreviewShouldWaitForHoverAndHold:0];
  [(PKHoverSettings *)self setToolShadowMaxOpacityNormal:0.05];
  [(PKHoverSettings *)self setToolShadowMaxOpacityForIncreasedContrast:0.1];
  [(PKHoverSettings *)self setToolShadowMaxOpacityInDrawingCanvasNormal:0.05];
  [(PKHoverSettings *)self setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:0.1];
  [(PKHoverSettings *)self setToolShadowMaxBlurRadius:25.0];
  [(PKHoverSettings *)self setToolShadowFadeInDistance:10.0];
  [(PKHoverSettings *)self setToolSwitchIndicatorActive:1];
  [(PKHoverSettings *)self setAvoidSwitchingToolsOutsideHoverRange:1];
  [(PKHoverSettings *)self setMaxZDistance:20.0];
  [(PKHoverSettings *)self setErasePreviewAlphaFactor:0.2];
  [(PKHoverSettings *)self setScreenEdgeSizeInMillimeters:0.0];
  [(PKHoverSettings *)self setToolPreviewMaxZDistance:12.0];
  [(PKHoverSettings *)self setToolPreviewFadeOutDistance:2.5];
  [(PKHoverSettings *)self setToolPreviewAzimuthTiltMaxZDistance:25.0];
  [(PKHoverSettings *)self setDeactivateExtraDistance:5.0];
  [(PKHoverSettings *)self setPredictionTimeInterval:0.0166666667];
  [(PKHoverSettings *)self setExtraHoverPreviewDelay:0.0];
  [(PKHoverSettings *)self setInactivityTimeInterval:5.0];
  [(PKHoverSettings *)self setScribbleFocusActive:0];
  [(PKHoverSettings *)self setScribbleFlashCursorActive:0];
  [(PKHoverSettings *)self setScribbleShowWritableElementsActive:0];
  [(PKHoverSettings *)self setScribbleHoverStrongActive:0];
  [(PKHoverSettings *)self setScribbleCommitOnLift:1];
  [(PKHoverSettings *)self setScribbleLineBreakHandling:1];
  [(PKHoverSettings *)self setScribbleLineBreakMultiLineDelay:1.0];
  [(PKHoverSettings *)self setScribbleLineBreakMultiLineEnabled:1];
  [(PKHoverSettings *)self setScribbleLineBreakMultiLineMaxLines:80];
  [(PKHoverSettings *)self setScribbleIBeamActive:1];
  [(PKHoverSettings *)self setHoverAndHoldTriggerTimeInterval:0.2];
  [(PKHoverSettings *)self setHoverAndHoldActionTimeInterval:0.5];
  [(PKHoverSettings *)self setWeightedAverageAltitudeFactor:4.0];
  [(PKHoverSettings *)self setWeightedAverageAzimuthFactor:0.0];
  [(PKHoverSettings *)self setWeightedAverageLocationFactor:0.0];
  [(PKHoverSettings *)self setNumFramesExtraLatency:0];
  [(PKHoverSettings *)self setNoiseIsHeightBased:1];
  [(PKHoverSettings *)self setAltitudeJitterNoise:0.0];
  [(PKHoverSettings *)self setAzimuthJitterNoise:0.0];
  [(PKHoverSettings *)self setAltitudeOffsetNoise:0.0];
  [(PKHoverSettings *)self setAzimuthOffsetNoise:0.0];
  [(PKHoverSettings *)self setNumFramesReduceFramerate:0];
  [(PKHoverSettings *)self setAzimuthBuckets:0];
  [(PKHoverSettings *)self setAltitudeBuckets:0];

  [(PKHoverSettings *)self setToolPreviewActiveForTesting:1];
}

- (void)_scheduleSavingSettingsSoon
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__scheduledSaveSettingsTriggered object:0];

  [(PKHoverSettings *)self performSelector:sel__scheduledSaveSettingsTriggered withObject:0 afterDelay:0.1];
}

- (BOOL)toolShadowActive
{
  if ((sForceHoverSupportedForTesting & 1) == 0 && !_os_feature_enabled_impl()
    || !self->_toolShadowActive)
  {
    return 0;
  }

  return [(PKHoverSettings *)self toolPreviewActive];
}

- (BOOL)toolShadowActiveOnOldPencils
{
  if (!self->_toolShadowActiveOnOldPencils || ![(PKHoverSettings *)self toolPreviewActive]) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (double)toolShadowMaxOpacity
{
  if ([(PKHoverSettings *)self increasedContrastEnabled])
  {
    [(PKHoverSettings *)self toolShadowMaxOpacityForIncreasedContrast];
  }
  else
  {
    [(PKHoverSettings *)self toolShadowMaxOpacityNormal];
  }
  return result;
}

- (double)toolShadowMaxOpacityInDrawingCanvas
{
  if ([(PKHoverSettings *)self increasedContrastEnabled])
  {
    [(PKHoverSettings *)self toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast];
  }
  else
  {
    [(PKHoverSettings *)self toolShadowMaxOpacityInDrawingCanvasNormal];
  }
  return result;
}

+ (id)keyPathsForValuesAffectingToolShadowMaxOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"increasedContrastEnabled", @"toolShadowMaxOpacityNormal", @"toolShadowMaxOpacityForIncreasedContrast", 0);
}

+ (id)keyPathsForValuesAffectingToolShadowMaxOpacityInDrawingCanvas
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"increasedContrastEnabled", @"toolShadowMaxOpacityInDrawingCanvasNormal", @"toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast", 0);
}

- (BOOL)toolPreviewActive
{
  if (sForceHoverSupportedForTesting == 1) {
    return [(PKHoverSettings *)self toolPreviewActiveForTesting];
  }
  else {
    return [MEMORY[0x1E4FB1A80] prefersHoverToolPreview];
  }
}

- (void)setToolPreviewActive:(BOOL)a3
{
  if (sForceHoverSupportedForTesting == 1) {
    [(PKHoverSettings *)self setToolPreviewActiveForTesting:a3];
  }
  else {
    +[PKSettingsDaemon setPrefersPencilHoverPreviewEnabled:a3 withCompletion:0];
  }
}

- (BOOL)showDebugLayer
{
  return self->_showDebugLayer;
}

- (void)setShowDebugLayer:(BOOL)a3
{
  self->_showDebugLayer = a3;
}

- (BOOL)supportTouchPad
{
  return self->_supportTouchPad;
}

- (void)setSupportTouchPad:(BOOL)a3
{
  self->_supportTouchPad = a3;
}

- (int64_t)debugCursorType
{
  return self->_debugCursorType;
}

- (void)setDebugCursorType:(int64_t)a3
{
  self->_debugCursorType = a3;
}

- (BOOL)tooltipsActive
{
  return self->_tooltipsActive;
}

- (void)setTooltipsActive:(BOOL)a3
{
  self->_tooltipsActive = a3;
}

- (BOOL)snapToShapeActive
{
  return self->_snapToShapeActive;
}

- (void)setSnapToShapeActive:(BOOL)a3
{
  self->_snapToShapeActive = a3;
}

- (double)erasePreviewAlphaFactor
{
  return self->_erasePreviewAlphaFactor;
}

- (void)setErasePreviewAlphaFactor:(double)a3
{
  self->_erasePreviewAlphaFactor = a3;
}

- (BOOL)toolIndicatorActive
{
  return self->_toolIndicatorActive;
}

- (void)setToolIndicatorActive:(BOOL)a3
{
  self->_toolIndicatorActive = a3;
}

- (BOOL)avoidSwitchingToolsOutsideHoverRange
{
  return self->_avoidSwitchingToolsOutsideHoverRange;
}

- (void)setAvoidSwitchingToolsOutsideHoverRange:(BOOL)a3
{
  self->_avoidSwitchingToolsOutsideHoverRange = a3;
}

- (void)setToolShadowActive:(BOOL)a3
{
  self->_toolShadowActive = a3;
}

- (void)setToolShadowActiveOnOldPencils:(BOOL)a3
{
  self->_toolShadowActiveOnOldPencils = a3;
}

- (BOOL)toolShadowActiveOutsideNotes
{
  return self->_toolShadowActiveOutsideNotes;
}

- (void)setToolShadowActiveOutsideNotes:(BOOL)a3
{
  self->_toolShadowActiveOutsideNotes = a3;
}

- (BOOL)toolShadowLocationWorkaround
{
  return self->_toolShadowLocationWorkaround;
}

- (void)setToolShadowLocationWorkaround:(BOOL)a3
{
  self->_toolShadowLocationWorkaround = a3;
}

- (double)toolShadowMaxOpacityNormal
{
  return self->_toolShadowMaxOpacityNormal;
}

- (void)setToolShadowMaxOpacityNormal:(double)a3
{
  self->_toolShadowMaxOpacityNormal = a3;
}

- (double)toolShadowMaxOpacityForIncreasedContrast
{
  return self->_toolShadowMaxOpacityForIncreasedContrast;
}

- (void)setToolShadowMaxOpacityForIncreasedContrast:(double)a3
{
  self->_toolShadowMaxOpacityForIncreasedContrast = a3;
}

- (double)toolShadowMaxOpacityInDrawingCanvasNormal
{
  return self->_toolShadowMaxOpacityInDrawingCanvasNormal;
}

- (void)setToolShadowMaxOpacityInDrawingCanvasNormal:(double)a3
{
  self->_toolShadowMaxOpacityInDrawingCanvasNormal = a3;
}

- (double)toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast
{
  return self->_toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast;
}

- (void)setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:(double)a3
{
  self->_toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast = a3;
}

- (double)toolShadowMaxBlurRadius
{
  return self->_toolShadowMaxBlurRadius;
}

- (void)setToolShadowMaxBlurRadius:(double)a3
{
  self->_toolShadowMaxBlurRadius = a3;
}

- (double)toolShadowMovementSpeedHideThreshold
{
  return self->_toolShadowMovementSpeedHideThreshold;
}

- (void)setToolShadowMovementSpeedHideThreshold:(double)a3
{
  self->_toolShadowMovementSpeedHideThreshold = a3;
}

- (double)toolShadowFadeInDistance
{
  return self->_toolShadowFadeInDistance;
}

- (void)setToolShadowFadeInDistance:(double)a3
{
  self->_toolShadowFadeInDistance = a3;
}

- (BOOL)toolPreviewShouldWaitForHoverAndHold
{
  return self->_toolPreviewShouldWaitForHoverAndHold;
}

- (void)setToolPreviewShouldWaitForHoverAndHold:(BOOL)a3
{
  self->_toolPreviewShouldWaitForHoverAndHold = a3;
}

- (BOOL)toolSwitchIndicatorActive
{
  return self->_toolSwitchIndicatorActive;
}

- (void)setToolSwitchIndicatorActive:(BOOL)a3
{
  self->_toolSwitchIndicatorActive = a3;
}

- (double)screenEdgeSizeInMillimeters
{
  return self->_screenEdgeSizeInMillimeters;
}

- (void)setScreenEdgeSizeInMillimeters:(double)a3
{
  self->_screenEdgeSizeInMillimeters = a3;
}

- (double)maxZDistance
{
  return self->_maxZDistance;
}

- (void)setMaxZDistance:(double)a3
{
  self->_maxZDistance = a3;
}

- (double)toolPreviewMaxZDistance
{
  return self->_toolPreviewMaxZDistance;
}

- (void)setToolPreviewMaxZDistance:(double)a3
{
  self->_toolPreviewMaxZDistance = a3;
}

- (double)toolPreviewFadeOutDistance
{
  return self->_toolPreviewFadeOutDistance;
}

- (void)setToolPreviewFadeOutDistance:(double)a3
{
  self->_toolPreviewFadeOutDistance = a3;
}

- (double)toolPreviewAzimuthTiltMaxZDistance
{
  return self->_toolPreviewAzimuthTiltMaxZDistance;
}

- (void)setToolPreviewAzimuthTiltMaxZDistance:(double)a3
{
  self->_toolPreviewAzimuthTiltMaxZDistance = a3;
}

- (double)deactivateExtraDistance
{
  return self->_deactivateExtraDistance;
}

- (void)setDeactivateExtraDistance:(double)a3
{
  self->_deactivateExtraDistance = a3;
}

- (double)predictionTimeInterval
{
  return self->_predictionTimeInterval;
}

- (void)setPredictionTimeInterval:(double)a3
{
  self->_predictionTimeInterval = a3;
}

- (double)extraHoverPreviewDelay
{
  return self->_extraHoverPreviewDelay;
}

- (void)setExtraHoverPreviewDelay:(double)a3
{
  self->_extraHoverPreviewDelay = a3;
}

- (double)inactivityTimeInterval
{
  return self->_inactivityTimeInterval;
}

- (void)setInactivityTimeInterval:(double)a3
{
  self->_inactivityTimeInterval = a3;
}

- (double)hoverAndHoldTriggerTimeInterval
{
  return self->_hoverAndHoldTriggerTimeInterval;
}

- (void)setHoverAndHoldTriggerTimeInterval:(double)a3
{
  self->_hoverAndHoldTriggerTimeInterval = a3;
}

- (double)hoverAndHoldActionTimeInterval
{
  return self->_hoverAndHoldActionTimeInterval;
}

- (void)setHoverAndHoldActionTimeInterval:(double)a3
{
  self->_hoverAndHoldActionTimeInterval = a3;
}

- (unint64_t)numFramesExtraLatency
{
  return self->_numFramesExtraLatency;
}

- (void)setNumFramesExtraLatency:(unint64_t)a3
{
  self->_numFramesExtraLatency = a3;
}

- (unint64_t)numFramesReduceFramerate
{
  return self->_numFramesReduceFramerate;
}

- (void)setNumFramesReduceFramerate:(unint64_t)a3
{
  self->_numFramesReduceFramerate = a3;
}

- (double)weightedAverageAltitudeFactor
{
  return self->_weightedAverageAltitudeFactor;
}

- (void)setWeightedAverageAltitudeFactor:(double)a3
{
  self->_weightedAverageAltitudeFactor = a3;
}

- (double)weightedAverageAzimuthFactor
{
  return self->_weightedAverageAzimuthFactor;
}

- (void)setWeightedAverageAzimuthFactor:(double)a3
{
  self->_weightedAverageAzimuthFactor = a3;
}

- (double)weightedAverageLocationFactor
{
  return self->_weightedAverageLocationFactor;
}

- (void)setWeightedAverageLocationFactor:(double)a3
{
  self->_weightedAverageLocationFactor = a3;
}

- (BOOL)scribbleFocusActive
{
  return self->_scribbleFocusActive;
}

- (void)setScribbleFocusActive:(BOOL)a3
{
  self->_scribbleFocusActive = a3;
}

- (BOOL)scribbleFlashCursorActive
{
  return self->_scribbleFlashCursorActive;
}

- (void)setScribbleFlashCursorActive:(BOOL)a3
{
  self->_scribbleFlashCursorActive = a3;
}

- (BOOL)scribbleShowWritableElementsActive
{
  return self->_scribbleShowWritableElementsActive;
}

- (void)setScribbleShowWritableElementsActive:(BOOL)a3
{
  self->_scribbleShowWritableElementsActive = a3;
}

- (BOOL)scribbleHoverStrongActive
{
  return self->_scribbleHoverStrongActive;
}

- (void)setScribbleHoverStrongActive:(BOOL)a3
{
  self->_scribbleHoverStrongActive = a3;
}

- (BOOL)scribbleCommitOnLift
{
  return self->_scribbleCommitOnLift;
}

- (void)setScribbleCommitOnLift:(BOOL)a3
{
  self->_scribbleCommitOnLift = a3;
}

- (BOOL)scribbleLineBreakHandling
{
  return self->_scribbleLineBreakHandling;
}

- (void)setScribbleLineBreakHandling:(BOOL)a3
{
  self->_scribbleLineBreakHandling = a3;
}

- (BOOL)scribbleLineBreakMultiLineEnabled
{
  return self->_scribbleLineBreakMultiLineEnabled;
}

- (void)setScribbleLineBreakMultiLineEnabled:(BOOL)a3
{
  self->_scribbleLineBreakMultiLineEnabled = a3;
}

- (int)scribbleLineBreakMultiLineMaxLines
{
  return self->_scribbleLineBreakMultiLineMaxLines;
}

- (void)setScribbleLineBreakMultiLineMaxLines:(int)a3
{
  self->_scribbleLineBreakMultiLineMaxLines = a3;
}

- (double)scribbleLineBreakMultiLineDelay
{
  return self->_scribbleLineBreakMultiLineDelay;
}

- (void)setScribbleLineBreakMultiLineDelay:(double)a3
{
  self->_scribbleLineBreakMultiLineDelay = a3;
}

- (BOOL)scribbleIBeamActive
{
  return self->_scribbleIBeamActive;
}

- (void)setScribbleIBeamActive:(BOOL)a3
{
  self->_scribbleIBeamActive = a3;
}

- (double)azimuthJitterNoise
{
  return self->_azimuthJitterNoise;
}

- (void)setAzimuthJitterNoise:(double)a3
{
  self->_azimuthJitterNoise = a3;
}

- (double)altitudeJitterNoise
{
  return self->_altitudeJitterNoise;
}

- (void)setAltitudeJitterNoise:(double)a3
{
  self->_altitudeJitterNoise = a3;
}

- (double)azimuthOffsetNoise
{
  return self->_azimuthOffsetNoise;
}

- (void)setAzimuthOffsetNoise:(double)a3
{
  self->_azimuthOffsetNoise = a3;
}

- (double)altitudeOffsetNoise
{
  return self->_altitudeOffsetNoise;
}

- (void)setAltitudeOffsetNoise:(double)a3
{
  self->_altitudeOffsetNoise = a3;
}

- (BOOL)noiseIsHeightBased
{
  return self->_noiseIsHeightBased;
}

- (void)setNoiseIsHeightBased:(BOOL)a3
{
  self->_noiseIsHeightBased = a3;
}

- (int)azimuthBuckets
{
  return self->_azimuthBuckets;
}

- (void)setAzimuthBuckets:(int)a3
{
  self->_azimuthBuckets = a3;
}

- (int)altitudeBuckets
{
  return self->_altitudeBuckets;
}

- (void)setAltitudeBuckets:(int)a3
{
  self->_altitudeBuckets = a3;
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)toolPreviewActiveForTesting
{
  return self->_toolPreviewActiveForTesting;
}

- (void)setToolPreviewActiveForTesting:(BOOL)a3
{
  self->_toolPreviewActiveForTesting = a3;
}

- (void).cxx_destruct
{
}

@end