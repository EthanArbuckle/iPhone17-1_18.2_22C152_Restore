@interface PKStatisticsManager
+ (id)bundleIDCategory;
+ (id)sharedStatisticsManager;
- (uint64_t)recordPencilAction:(uint64_t)result doubleTap:;
- (void)recordAutoMinimizeEnabledDidChange:(uint64_t)a3 type:;
- (void)recordBitmapEraseWithInputType:(uint64_t)a1;
- (void)recordCollaboration:(uint64_t)a1;
- (void)recordColorPanelInvoked:(uint64_t)a1;
- (void)recordColorsChangedBeforeChosen:(uint64_t)a1;
- (void)recordCopyAsTextWithLength:(uint64_t)a1 time:(uint64_t)a2 didShowHUD:(uint64_t)a3 invokedFromSmartSelection:(int)a4;
- (void)recordCreateShapeWithType:(int)a3 fromMenu:(int)a4 multiple:;
- (void)recordDataDetectorItemAdd:(uint64_t)a1;
- (void)recordDataDetectorItemDefaultAction:(uint64_t)a1;
- (void)recordDataDetectorItemMenuAction:(uint64_t)a1;
- (void)recordDataDetectorItemRemove:(uint64_t)a1;
- (void)recordDragAndDropSelection;
- (void)recordDragSelection;
- (void)recordDrawStroke:(uint64_t)a1;
- (void)recordDrawWithFingerToggle:(uint64_t)a1;
- (void)recordHashtagItemActivate;
- (void)recordHashtagItemAdd;
- (void)recordHashtagItemDeactivate;
- (void)recordHashtagItemRemove;
- (void)recordHoverDuration:(uint64_t)a1 onScreenDuration:hoverEdgeDuration:hoverExteriorDuration:sessionDuration:showEffectsEnabled:shadowEnabled:scribbleEnabled:doubleTapOnlyInHoverRangeEnabled:doubleTapsInRange:doubleTapsOutsideRange:deviceIsConnectedToCharger:intentionalHoverDuration:intentionalToolPreviewHoverDuration:countIntentionalHoverActions:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:;
- (void)recordHoverLatency:(uint64_t)a1 mean:max:shadowEnabled:isInPDF:;
- (void)recordHoverToolType:(uint64_t)a3 hoverDuration:(uint64_t)a4 intentionalToolPreviewHoverDuration:(uint64_t)a5 intentionalHoverDuration:(uint64_t)a6 maxIntentionalHoverDuration:(uint64_t)a7 meanIntentionalHoverDuration:(void *)a8 minIntentionalHoverDuration:countIntentionalHoverActions:activepencilminutes:onScreenDuration:settingShowEffectsEnabled:settingSystemShadowEnabled:settingScribbleEnabled:settingDoubleTapInRangeEnabled:bundleID:;
- (void)recordInkPickerNoOp:(uint64_t)a1;
- (void)recordInsertSpaceAddWhitespace:(uint64_t)a1;
- (void)recordInsertSpaceWithType:(uint64_t)a1;
- (void)recordJumpToSettings;
- (void)recordLatency:(uint64_t)a1 mean:max:percentageOverLatencyThreshold:isInPDF:;
- (void)recordMentionItemActivate;
- (void)recordMentionItemAdd;
- (void)recordMentionItemDeactivate;
- (void)recordMentionItemRemove;
- (void)recordNumberOfUndos:(uint64_t)a3 numberOfStrokes:(uint64_t)a4 showEffectsEnabled:(uint64_t)a5 shadowEnabled:(void *)a6 bundleID:;
- (void)recordObjectEraseWithInputType:(uint64_t)a1;
- (void)recordPalettePositionChange:(uint64_t)a3 type:;
- (void)recordPerceivedLatency:(uint64_t)a1 mean:max:isInPDF:;
- (void)recordPixelObjectEraseModeChange:(uint64_t)a1;
- (void)recordRulerInteractionEndedWithType:(uint64_t)a1 angle:(uint64_t)a2;
- (void)recordSelectAllWithStrokeCount:(uint64_t)a1 externalElementsCount:;
- (void)recordShapeEventWithType:(void *)a1 modeString:(void *)a2;
- (void)recordShapeUndoIfNecessary;
- (void)recordShowRuler;
- (void)recordStrokeWithInk:(double)a3 rollAngleDelta:;
- (void)recordTextLineStraightening:(char)a3 withUndo:;
- (void)recordTextLineStraighteningPerSession:(uint64_t)a1 Undos:;
- (void)recordTextLineStraighteningUndoIfNecessary;
- (void)recordTool:(uint64_t)a1;
- (void)recordToolAttributePopoverAppearedForTool:(uint64_t)a1 hadInteraction:(void *)a2;
- (void)recordUndo:(void *)a3 forStrokes:(void *)a4 fallbackInkIdentifier:;
- (void)recordUndoIfNecessary;
- (void)submitRecentRollStroke;
@end

@implementation PKStatisticsManager

+ (id)sharedStatisticsManager
{
  self;
  if (qword_1EB3C6060 != -1) {
    dispatch_once(&qword_1EB3C6060, &__block_literal_global_21);
  }
  v0 = (void *)qword_1EB3C6068;

  return v0;
}

void __46__PKStatisticsManager_sharedStatisticsManager__block_invoke()
{
  v0 = objc_alloc_init(PKStatisticsManager);
  v1 = (void *)qword_1EB3C6068;
  qword_1EB3C6068 = (uint64_t)v0;

  v2 = objc_alloc_init(PKDrawingPaletteStatisticsEventLogger);
  v3 = *(void **)(qword_1EB3C6068 + 64);
  *(void *)(qword_1EB3C6068 + 64) = v2;
}

+ (id)bundleIDCategory
{
  self;
  if (_MergedGlobals_143 != -1) {
    dispatch_once(&_MergedGlobals_143, &__block_literal_global_56);
  }
  v0 = (void *)qword_1EB3C6058;

  return v0;
}

void __39__PKStatisticsManager_bundleIDCategory__block_invoke()
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v0 = (void *)qword_1EB3C6070;
  uint64_t v10 = qword_1EB3C6070;
  if (!qword_1EB3C6070)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getIAUtilityClass_block_invoke;
    v6[3] = &unk_1E64C5478;
    v6[4] = &v7;
    __getIAUtilityClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v7, 8);
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v1 lookupAppBundle:v3];
  v5 = (void *)qword_1EB3C6058;
  qword_1EB3C6058 = v4;
}

- (void)recordDrawStroke:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v5 = (void *)v4;
    if (v4) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v4, (void *)*MEMORY[0x1E4F5C000]);
    }

    v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    uint64_t v7 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    v8 = [v3 ink];
    uint64_t v9 = [v8 identifier];
    uint64_t v10 = (void *)v9;
    v11 = @"unknown";
    if (v9) {
      v11 = (__CFString *)v9;
    }
    v12 = v11;

    v13 = [(__CFString *)v12 stringByReplacingOccurrencesOfString:@"com.apple.ink." withString:&stru_1F1FB2C00];

    v14 = [v3 ink];
    [v14 weight];

    v15 = [v3 ink];
    v16 = [v15 color];
    if (v16)
    {
      v17 = [v3 ink];
      id v18 = [v17 color];
      CGColorGetAlpha((CGColorRef)[v18 CGColor]);
    }
    id v19 = v3;
    uint64_t v20 = [v19 _inputType];
    if (v20)
    {
      if (v20 == 1)
      {
        v21 = @"pencil";
      }
      else
      {
        v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "_inputType"));
        v21 = [v22 stringValue];
      }
    }
    else
    {
      v21 = @"touch";
    }

    v23 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.added"];
    v26 = v13;
    v27 = v21;
    v24 = v21;
    id v25 = v13;
    AnalyticsSendEventLazy();
  }
}

id __40__PKStatisticsManager_recordDrawStroke___block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"tool";
  v7[1] = @"thickness";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v8[1] = v2;
  v7[2] = @"opacity";
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v7[3] = @"input";
  uint64_t v4 = *(void *)(a1 + 40);
  v8[2] = v3;
  v8[3] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

- (void)recordBitmapEraseWithInputType:(uint64_t)a1
{
  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 2) {
      v2 = @"direct";
    }
    else {
      v2 = off_1E64C9648[a2 - 1];
    }
    id v3 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.erase"];
    AnalyticsSendEventLazy();
  }
}

id __54__PKStatisticsManager_recordBitmapEraseWithInputType___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"input";
  v4[1] = @"type";
  v5[0] = v1;
  v5[1] = @"bitmap";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)recordObjectEraseWithInputType:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    if ((unint64_t)(a2 - 1) > 2) {
      v6 = @"direct";
    }
    else {
      v6 = off_1E64C9648[a2 - 1];
    }
    uint64_t v7 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.erase"];
    AnalyticsSendEventLazy();
  }
}

id __54__PKStatisticsManager_recordObjectEraseWithInputType___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"input";
  v4[1] = @"type";
  v5[0] = v1;
  v5[1] = @"object";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)recordLatency:(uint64_t)a1 mean:max:percentageOverLatencyThreshold:isInPDF:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.latency"];
    AnalyticsSendEventLazy();
  }
}

id __85__PKStatisticsManager_recordLatency_mean_max_percentageOverLatencyThreshold_isInPDF___block_invoke(uint64_t a1, double a2)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"frequency";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  id v3 = [NSNumber numberWithFloat:a2];
  v14[0] = v3;
  v13[1] = @"mean";
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  v5 = [NSNumber numberWithFloat:v4];
  v14[1] = v5;
  v13[2] = @"max";
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  v14[2] = v7;
  v13[3] = @"percentageOverThreshold";
  LODWORD(v8) = *(_DWORD *)(a1 + 44);
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  v14[3] = v9;
  v13[4] = @"isInPDF";
  uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (void)recordPerceivedLatency:(uint64_t)a1 mean:max:isInPDF:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.perceivedLatency"];
    AnalyticsSendEventLazy();
  }
}

id __63__PKStatisticsManager_recordPerceivedLatency_mean_max_isInPDF___block_invoke(uint64_t a1, double a2)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"frequency";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  id v3 = [NSNumber numberWithFloat:a2];
  v12[0] = v3;
  v11[1] = @"mean";
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  v5 = [NSNumber numberWithFloat:v4];
  v12[1] = v5;
  v11[2] = @"max";
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  v12[2] = v7;
  v11[3] = @"isInPDF";
  double v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)recordHoverLatency:(uint64_t)a1 mean:max:shadowEnabled:isInPDF:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.hoverLatency"];
    AnalyticsSendEventLazy();
  }
}

id __73__PKStatisticsManager_recordHoverLatency_mean_max_shadowEnabled_isInPDF___block_invoke(uint64_t a1, double a2)
{
  void v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"frequency";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  id v3 = [NSNumber numberWithFloat:a2];
  v13[0] = v3;
  v12[1] = @"mean";
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  v5 = [NSNumber numberWithFloat:v4];
  v13[1] = v5;
  v12[2] = @"max";
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  v13[2] = v7;
  v12[3] = @"shadowEnabled";
  double v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
  v13[3] = v8;
  v12[4] = @"isInPDF";
  uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
  v13[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

- (void)recordHoverDuration:(uint64_t)a1 onScreenDuration:hoverEdgeDuration:hoverExteriorDuration:sessionDuration:showEffectsEnabled:shadowEnabled:scribbleEnabled:doubleTapOnlyInHoverRangeEnabled:doubleTapsInRange:doubleTapsOutsideRange:deviceIsConnectedToCharger:intentionalHoverDuration:intentionalToolPreviewHoverDuration:countIntentionalHoverActions:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"hover"];
    AnalyticsSendEventLazy();
  }
}

id __441__PKStatisticsManager_recordHoverDuration_onScreenDuration_hoverEdgeDuration_hoverExteriorDuration_sessionDuration_showEffectsEnabled_shadowEnabled_scribbleEnabled_doubleTapOnlyInHoverRangeEnabled_doubleTapsInRange_doubleTapsOutsideRange_deviceIsConnectedToCharger_intentionalHoverDuration_intentionalToolPreviewHoverDuration_countIntentionalHoverActions_maxIntentionalHoverDuration_meanIntentionalHoverDuration_minIntentionalHoverDuration___block_invoke(uint64_t a1)
{
  v24[19] = *MEMORY[0x1E4F143B8];
  v23[0] = @"hoverDuration";
  v22 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v24[0] = v22;
  v23[1] = @"hoverExteriorDuration";
  v21 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v24[1] = v21;
  v23[2] = @"hoverEdgeDuration";
  uint64_t v20 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v24[2] = v20;
  v23[3] = @"hoverInteriorDuration";
  id v19 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v24[3] = v19;
  v23[4] = @"onScreenDuration";
  id v18 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v24[4] = v18;
  v23[5] = @"sessionDuration";
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v24[5] = v17;
  v23[6] = @"settingShowEffectsEnabled";
  v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
  v24[6] = v16;
  v23[7] = @"settingScribbleEnabled";
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 145)];
  v24[7] = v15;
  v23[8] = @"settingSystemShadowEnabled";
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 146)];
  v24[8] = v14;
  v23[9] = @"settingDoubleTapInRangeEnabled";
  v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 147)];
  v24[9] = v13;
  v23[10] = @"doubleTapsInRange";
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  v24[10] = v2;
  v23[11] = @"doubleTapsOutsideRange";
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  v24[11] = v3;
  v23[12] = @"connectedToCharger";
  double v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 148)];
  v24[12] = v4;
  v23[13] = @"intentionalHoverDuration";
  v5 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
  v24[13] = v5;
  v23[14] = @"intentionalToolPreviewHoverDuration";
  double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  v24[14] = v6;
  v23[15] = @"countIntentionalHoverActions";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 112)];
  v24[15] = v7;
  v23[16] = @"maxIntentionalHoverDuration";
  double v8 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
  v24[16] = v8;
  v23[17] = @"medianIntentionalHoverDuration";
  uint64_t v9 = [NSNumber numberWithDouble:*(double *)(a1 + 128)];
  v24[17] = v9;
  v23[18] = @"minIntentionalHoverDuration";
  uint64_t v10 = [NSNumber numberWithDouble:*(double *)(a1 + 136)];
  v24[18] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:19];

  return v11;
}

- (void)recordHoverToolType:(uint64_t)a3 hoverDuration:(uint64_t)a4 intentionalToolPreviewHoverDuration:(uint64_t)a5 intentionalHoverDuration:(uint64_t)a6 maxIntentionalHoverDuration:(uint64_t)a7 meanIntentionalHoverDuration:(void *)a8 minIntentionalHoverDuration:countIntentionalHoverActions:activepencilminutes:onScreenDuration:settingShowEffectsEnabled:settingSystemShadowEnabled:settingScribbleEnabled:settingDoubleTapInRangeEnabled:bundleID:
{
  id v10 = a2;
  id v11 = a8;
  if (a1)
  {
    id v12 = v10;
    id v13 = v11;
    AnalyticsSendEventLazy();
  }
}

id __385__PKStatisticsManager_recordHoverToolType_hoverDuration_intentionalToolPreviewHoverDuration_intentionalHoverDuration_maxIntentionalHoverDuration_meanIntentionalHoverDuration_minIntentionalHoverDuration_countIntentionalHoverActions_activepencilminutes_onScreenDuration_settingShowEffectsEnabled_settingSystemShadowEnabled_settingScribbleEnabled_settingDoubleTapInRangeEnabled_bundleID___block_invoke(uint64_t a1)
{
  v19[15] = *MEMORY[0x1E4F143B8];
  v19[0] = *(void *)(a1 + 32);
  v18[0] = @"toolType";
  v18[1] = @"hoverDuration";
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v19[1] = v17;
  v18[2] = @"intentionalToolPreviewHoverDuration";
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v19[2] = v16;
  v18[3] = @"intentionalHoverDuration";
  v15 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v19[3] = v15;
  v18[4] = @"maxIntentionalHoverDuration";
  v14 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v19[4] = v14;
  v18[5] = @"meanIntentionalHoverDuration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  v19[5] = v2;
  v18[6] = @"minIntentionalHoverDuration";
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  v19[6] = v3;
  v18[7] = @"countIntentionalHoverActions";
  double v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 96)];
  v19[7] = v4;
  v18[8] = @"activepencilminutes";
  v5 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  v19[8] = v5;
  v18[9] = @"onScreenDuration";
  double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 112)];
  v19[9] = v6;
  v18[10] = @"settingShowEffectsEnabled";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 120)];
  v19[10] = v7;
  v18[11] = @"settingSystemShadowEnabled";
  double v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 121)];
  v19[11] = v8;
  v18[12] = @"settingScribbleEnabled";
  uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 122)];
  v19[12] = v9;
  v18[13] = @"settingDoubleTapInRangeEnabled";
  id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 123)];
  v18[14] = @"bundleID";
  uint64_t v11 = *(void *)(a1 + 40);
  v19[13] = v10;
  v19[14] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:15];

  return v12;
}

- (void)recordDragSelection
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.drag"];
    AnalyticsSendEventLazy();
  }
}

void *__42__PKStatisticsManager_recordDragSelection__block_invoke()
{
  return &unk_1F200F1F0;
}

- (void)recordDragAndDropSelection
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.drag"];
    AnalyticsSendEventLazy();
  }
}

void *__49__PKStatisticsManager_recordDragAndDropSelection__block_invoke()
{
  return &unk_1F200F218;
}

- (void)recordInkPickerNoOp:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"inkpicker.noOp"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __43__PKStatisticsManager_recordInkPickerNoOp___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  double v4 = @"element";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordColorPanelInvoked:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"colorpicker.invoke"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __47__PKStatisticsManager_recordColorPanelInvoked___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  double v4 = @"action";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordColorsChangedBeforeChosen:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"colorpicker.colors"];
    AnalyticsSendEventLazy();
  }
}

id __55__PKStatisticsManager_recordColorsChangedBeforeChosen___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v4 = @"intermediateColors";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordCollaboration:(uint64_t)a1
{
  if (a1)
  {
    if (a2 >= 3)
    {
      id v3 = [NSNumber numberWithUnsignedInteger:a2];
      v2 = [v3 stringValue];
    }
    else
    {
      v2 = off_1E64C9660[a2];
    }
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"drawing.didCollaborate"];
    double v6 = v2;
    id v5 = v2;
    AnalyticsSendEventLazy();
  }
}

id __43__PKStatisticsManager_recordCollaboration___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  double v4 = @"merge";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordTool:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"stroke.tool"];
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __34__PKStatisticsManager_recordTool___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  double v4 = @"tool";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordUndo:(void *)a3 forStrokes:(void *)a4 fallbackInkIdentifier:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (a1)
  {
    if ([v8 count])
    {
      id v10 = [v8 firstObject];
      uint64_t v11 = [v10 ink];
      id v12 = [v11 identifier];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) ink];
            id v19 = [v18 identifier];
            char v20 = [(__CFString *)v12 isEqual:v19];

            if ((v20 & 1) == 0)
            {

              id v12 = @"mixed";
              goto LABEL_13;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      uint64_t v9 = v12;
    }
    if (!v7)
    {
      v21 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_ERROR, "Action name was not set when recording undo", buf, 2u);
      }

      uint64_t v7 = @"unknown";
    }
    if (v9)
    {
      v22 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"undoAction"];
      uint64_t v7 = v7;
      uint64_t v9 = v9;
      AnalyticsSendEventLazy();
    }
  }
}

id __67__PKStatisticsManager_recordUndo_forStrokes_fallbackInkIdentifier___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"action";
  v4[1] = @"inkType";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)recordNumberOfUndos:(uint64_t)a3 numberOfStrokes:(uint64_t)a4 showEffectsEnabled:(uint64_t)a5 shadowEnabled:(void *)a6 bundleID:
{
  id v8 = a6;
  if (a1 && a3 >= 1)
  {
    uint64_t v9 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"undo"];
    id v10 = v8;
    AnalyticsSendEventLazy();
  }
}

id __101__PKStatisticsManager_recordNumberOfUndos_numberOfStrokes_showEffectsEnabled_shadowEnabled_bundleID___block_invoke(uint64_t a1)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"undoRatePerSession";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v11[0] = v2;
  v10[1] = @"countPencilStrokes";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  double v4 = (void *)v3;
  id v5 = *(__CFString **)(a1 + 32);
  if (!v5) {
    id v5 = @"unknown";
  }
  v11[1] = v3;
  v11[2] = v5;
  v10[2] = @"bundleID";
  v10[3] = @"settingShowEffectsEnabled";
  double v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v11[3] = v6;
  v10[4] = @"settingSystemShadowEnabled";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  void v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (void)recordTextLineStraightening:(char)a3 withUndo:
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v7 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    id v8 = (void *)v7;
    if (v7) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v7, (void *)*MEMORY[0x1E4F5C008]);
    }

    uint64_t v9 = (void *)[v6 mutableCopy];
    if (a3)
    {
      id v10 = @"undo";
    }
    else
    {
      if (!*(void *)(a1 + 24)) {
        goto LABEL_11;
      }
      if (*(double *)(a1 + 32) <= 0.0) {
        goto LABEL_11;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (v11 - *(double *)(a1 + 32) >= 20.0) {
        goto LABEL_11;
      }
      id v10 = @"repeat";
    }
    [v9 setValue:MEMORY[0x1E4F1CC38] forKey:v10];
LABEL_11:
    objc_storeStrong((id *)(a1 + 24), a2);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(a1 + 32) = v12;
    id v13 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"textLineStraightening"];
    id v14 = v9;
    AnalyticsSendEventLazy();
  }
}

id __60__PKStatisticsManager_recordTextLineStraightening_withUndo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)recordTextLineStraighteningUndoIfNecessary
{
  if (a1 && *(void *)(a1 + 24) && *(double *)(a1 + 32) > 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v2 - *(double *)(a1 + 32) < 10.0) {
      -[PKStatisticsManager recordTextLineStraightening:withUndo:](a1, *(void **)(a1 + 24), 1);
    }
    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    *(void *)(a1 + 32) = 0;
  }
}

- (void)recordTextLineStraighteningPerSession:(uint64_t)a1 Undos:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"textLineStraighteningPerSession"];
    AnalyticsSendEventLazy();
  }
}

id __67__PKStatisticsManager_recordTextLineStraighteningPerSession_Undos___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"sessionCount";
  double v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v6[1] = @"undoSessionCount";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)recordCopyAsTextWithLength:(uint64_t)a1 time:(uint64_t)a2 didShowHUD:(uint64_t)a3 invokedFromSmartSelection:(int)a4
{
  if (a1)
  {
    uint64_t v5 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    id v6 = (void *)v5;
    if (v5) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v5, (void *)*MEMORY[0x1E4F5BFD8]);
    }

    uint64_t v7 = @"lasso";
    if (a4) {
      uint64_t v7 = @"smartSelection";
    }
    id v8 = v7;
    uint64_t v9 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.copyAsText"];
    id v10 = v8;
    AnalyticsSendEventLazy();
  }
}

id __92__PKStatisticsManager_recordCopyAsTextWithLength_time_didShowHUD_invokedFromSmartSelection___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"textLength";
  double v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v9[0] = v2;
  v8[1] = @"transcriptionDuration";
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v9[1] = v3;
  v8[2] = @"didShowHUD";
  double v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v8[3] = @"invocationType";
  uint64_t v5 = *(void *)(a1 + 32);
  v9[2] = v4;
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)recordSelectAllWithStrokeCount:(uint64_t)a1 externalElementsCount:
{
  if (a1)
  {
    uint64_t v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.selectAll"];
    AnalyticsSendEventLazy();
  }
}

id __76__PKStatisticsManager_recordSelectAllWithStrokeCount_externalElementsCount___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"strokeCount";
  double v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"externalElementsCount";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)recordInsertSpaceWithType:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    double v4 = (void *)v3;
    if (v3) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E4F5BFE8]);
    }

    if ((a2 - 1) > 2) {
      uint64_t v5 = @"fromLassoDrawAcross";
    }
    else {
      uint64_t v5 = off_1E64C9678[a2 - 1];
    }
    id v6 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.insertSpace"];
    AnalyticsSendEventLazy();
  }
}

id __49__PKStatisticsManager_recordInsertSpaceWithType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  double v4 = @"insertSpaceType";
  v5[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordInsertSpaceAddWhitespace:(uint64_t)a1
{
  if (a1)
  {
    double v2 = @"removeWhitespace";
    if (a2) {
      double v2 = @"addWhitespace";
    }
    uint64_t v3 = v2;
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.insertSpace"];
    id v6 = v3;
    uint64_t v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __54__PKStatisticsManager_recordInsertSpaceAddWhitespace___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = &unk_1F200E700;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (void)recordJumpToSettings
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.openPreferences"];
    AnalyticsSendEventLazy();
  }
}

void *__43__PKStatisticsManager_recordJumpToSettings__block_invoke()
{
  return &unk_1F200F240;
}

- (void)recordDrawWithFingerToggle:(uint64_t)a1
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.toggleDrawWithFinger"];
    AnalyticsSendEventLazy();
  }
}

id __50__PKStatisticsManager_recordDrawWithFingerToggle___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v4 = @"drawWithFingerEnabled";
  id v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordShowRuler
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"ruler.show"];
    AnalyticsSendEventLazy();
  }
}

void *__38__PKStatisticsManager_recordShowRuler__block_invoke()
{
  return &unk_1F200F268;
}

- (void)recordRulerInteractionEndedWithType:(uint64_t)a1 angle:(uint64_t)a2
{
  if (a1)
  {
    double v2 = @"mask";
    if (!a2) {
      double v2 = @"snap";
    }
    uint64_t v3 = v2;
    double v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"ruler.interaction"];
    id v6 = v3;
    uint64_t v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __65__PKStatisticsManager_recordRulerInteractionEndedWithType_angle___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"angle";
  double v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v5[1] = @"type";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (uint64_t)recordPencilAction:(uint64_t)result doubleTap:
{
  if (result)
  {
    id v1 = +[PKPencilDevice activePencil];
    [v1 pencilVersionForAnalytics];

    return AnalyticsSendEventLazy();
  }
  return result;
}

id __52__PKStatisticsManager_recordPencilAction_doubleTap___block_invoke(void *a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"action";
  double v2 = [NSNumber numberWithInteger:a1[4]];
  v9[0] = v2;
  v8[1] = @"pencilVersion";
  uint64_t v3 = [NSNumber numberWithInteger:a1[5]];
  v9[1] = v3;
  v8[2] = @"trigger";
  double v4 = [NSNumber numberWithInteger:a1[6]];
  v9[2] = v4;
  v8[3] = @"bundleId_category";
  uint64_t v5 = +[PKStatisticsManager bundleIDCategory]();
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)recordPalettePositionChange:(uint64_t)a3 type:
{
  if (a1)
  {
    switch(a2)
    {
      case 1:
        uint64_t v3 = @"TopEdge";
        goto LABEL_12;
      case 2:
        uint64_t v3 = @"RightEdge";
        goto LABEL_12;
      case 3:
        uint64_t v3 = @"BottomEdge";
        goto LABEL_12;
      case 4:
        uint64_t v3 = @"LeftEdge";
        goto LABEL_12;
      case 5:
        uint64_t v3 = @"TopLeftCorner";
        goto LABEL_12;
      case 6:
        uint64_t v3 = @"TopRightCorner";
        goto LABEL_12;
      case 7:
        uint64_t v3 = @"BottomRightCorner";
        goto LABEL_12;
      case 8:
        uint64_t v3 = @"BottomLeftCorner";
LABEL_12:
        int v4 = 1;
        break;
      default:
        int v4 = 0;
        uint64_t v3 = 0;
        break;
    }
    uint64_t v5 = @"drawing";
    unint64_t v6 = a3 - 1;
    if (a3 != 1) {
      uint64_t v5 = 0;
    }
    if (a3 == 2) {
      uint64_t v5 = @"ucb";
    }
    uint64_t v7 = v5;
    if (v6 <= 1)
    {
      if (v4)
      {
        id v8 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.moved"];
        uint64_t v9 = v7;
        AnalyticsSendEventLazy();
      }
    }
  }
}

id __56__PKStatisticsManager_recordPalettePositionChange_type___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"paletteType";
  v4[1] = @"position";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)recordAutoMinimizeEnabledDidChange:(uint64_t)a3 type:
{
  if (a1)
  {
    uint64_t v3 = @"drawing";
    if (a3 != 1) {
      uint64_t v3 = 0;
    }
    if (a3 == 2) {
      uint64_t v3 = @"ucb";
    }
    int v4 = v3;
    if (v4)
    {
      uint64_t v5 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.autominimize"];
      unint64_t v6 = v4;
      AnalyticsSendEventLazy();
    }
  }
}

id __63__PKStatisticsManager_recordAutoMinimizeEnabledDidChange_type___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"enabled";
  double v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"paletteType";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)recordPixelObjectEraseModeChange:(uint64_t)a1
{
  if (a1)
  {
    double v2 = @"bitmap";
    if (a2 == 1) {
      double v2 = @"object";
    }
    uint64_t v3 = v2;
    int v4 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.eraser.typeSelected"];
    unint64_t v6 = v3;
    uint64_t v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __56__PKStatisticsManager_recordPixelObjectEraseModeChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v4 = @"eraserType";
  v5[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordToolAttributePopoverAppearedForTool:(uint64_t)a1 hadInteraction:(void *)a2
{
  id v3 = a2;
  int v4 = v3;
  if (a1 && v3)
  {
    uint64_t v5 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"palette.attributePopover.appear"];
    id v6 = v4;
    AnalyticsSendEventLazy();
  }
}

id __80__PKStatisticsManager_recordToolAttributePopoverAppearedForTool_hadInteraction___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"userInteraction";
  v6[0] = v1;
  v5[0] = @"toolName";
  double v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)recordShapeEventWithType:(void *)a1 modeString:(void *)a2
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"shape"];
  id v6 = v3;
  id v7 = v4;
  AnalyticsSendEventLazy();
}

id __59__PKStatisticsManager_recordShapeEventWithType_modeString___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"shapeType";
  v4[1] = @"mode";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)recordCreateShapeWithType:(int)a3 fromMenu:(int)a4 multiple:
{
  if (a1)
  {
    uint64_t v8 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    uint64_t v9 = (void *)v8;
    if (v8) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v8, (void *)*MEMORY[0x1E4F5BFF8]);
    }

    if ((unint64_t)(a2 - 1) > 0xC) {
      id v10 = @"Undefined";
    }
    else {
      id v10 = off_1E64C9690[a2 - 1];
    }
    double v11 = *(void **)(a1 + 8);
    uint64_t v12 = @"multiple";
    if (!a4) {
      uint64_t v12 = v10;
    }
    *(void *)(a1 + 8) = v12;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(a1 + 16) = v13;
    if (a3) {
      id v14 = @"fromMenu";
    }
    else {
      id v14 = @"fromStroke";
    }
    -[PKStatisticsManager recordShapeEventWithType:modeString:](v10, v14);
  }
}

- (void)recordShapeUndoIfNecessary
{
  if (a1 && *(void *)(a1 + 8) && *(double *)(a1 + 16) > 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v2 - *(double *)(a1 + 16) < 5.0) {
      -[PKStatisticsManager recordShapeEventWithType:modeString:](*(void **)(a1 + 8), @"undo");
    }
    id v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    *(void *)(a1 + 16) = 0;
  }
}

- (void)recordUndoIfNecessary
{
  if (a1)
  {
    if (*(void *)(a1 + 40)) {
      *(unsigned char *)(a1 + 56) = 1;
    }
    -[PKStatisticsManager recordShapeUndoIfNecessary](a1);
    -[PKStatisticsManager recordTextLineStraighteningUndoIfNecessary](a1);
  }
}

- (void)recordDataDetectorItemAdd:(uint64_t)a1
{
  if (a1)
  {
    double v2 = [a2 scannerResult];
    uint64_t v3 = [v2 type];
    id v4 = (void *)v3;
    uint64_t v5 = @"unknown";
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    id v6 = v5;

    id v7 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"datadetector"];
    uint64_t v8 = v6;
    AnalyticsSendEventLazy();
  }
}

id __49__PKStatisticsManager_recordDataDetectorItemAdd___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"add";
  v5[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordDataDetectorItemRemove:(uint64_t)a1
{
  if (a1)
  {
    double v2 = [a2 scannerResult];
    uint64_t v3 = [v2 type];
    id v4 = (void *)v3;
    uint64_t v5 = @"unknown";
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    id v6 = v5;

    id v7 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"datadetector"];
    uint64_t v8 = v6;
    AnalyticsSendEventLazy();
  }
}

id __52__PKStatisticsManager_recordDataDetectorItemRemove___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"remove";
  v5[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordDataDetectorItemDefaultAction:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    uint64_t v3 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    id v4 = (void *)v3;
    if (v3) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E4F5BFE0]);
    }

    uint64_t v5 = [v2 scannerResult];

    uint64_t v6 = [v5 type];
    id v7 = (void *)v6;
    uint64_t v8 = @"unknown";
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    uint64_t v9 = v8;

    id v10 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"datadetector"];
    double v11 = v9;
    AnalyticsSendEventLazy();
  }
}

id __59__PKStatisticsManager_recordDataDetectorItemDefaultAction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"action";
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordDataDetectorItemMenuAction:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    uint64_t v3 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    id v4 = (void *)v3;
    if (v3) {
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E4F5BFE0]);
    }

    uint64_t v5 = [v2 scannerResult];

    uint64_t v6 = [v5 type];
    id v7 = (void *)v6;
    uint64_t v8 = @"unknown";
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    uint64_t v9 = v8;

    id v10 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"datadetector"];
    double v11 = v9;
    AnalyticsSendEventLazy();
  }
}

id __56__PKStatisticsManager_recordDataDetectorItemMenuAction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"menu";
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordHashtagItemAdd
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"hashtag"];
    AnalyticsSendEventLazy();
  }
}

void *__43__PKStatisticsManager_recordHashtagItemAdd__block_invoke()
{
  return &unk_1F200F290;
}

- (void)recordHashtagItemRemove
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"hashtag"];
    AnalyticsSendEventLazy();
  }
}

void *__46__PKStatisticsManager_recordHashtagItemRemove__block_invoke()
{
  return &unk_1F200F2B8;
}

- (void)recordHashtagItemActivate
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"hashtag"];
    AnalyticsSendEventLazy();
  }
}

void *__48__PKStatisticsManager_recordHashtagItemActivate__block_invoke()
{
  return &unk_1F200F2E0;
}

- (void)recordHashtagItemDeactivate
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"hashtag"];
    AnalyticsSendEventLazy();
  }
}

void *__50__PKStatisticsManager_recordHashtagItemDeactivate__block_invoke()
{
  return &unk_1F200F308;
}

- (void)recordMentionItemAdd
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"mention"];
    AnalyticsSendEventLazy();
  }
}

void *__43__PKStatisticsManager_recordMentionItemAdd__block_invoke()
{
  return &unk_1F200F330;
}

- (void)recordMentionItemRemove
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"mention"];
    AnalyticsSendEventLazy();
  }
}

void *__46__PKStatisticsManager_recordMentionItemRemove__block_invoke()
{
  return &unk_1F200F358;
}

- (void)recordMentionItemActivate
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"mention"];
    AnalyticsSendEventLazy();
  }
}

void *__48__PKStatisticsManager_recordMentionItemActivate__block_invoke()
{
  return &unk_1F200F380;
}

- (void)recordMentionItemDeactivate
{
  if (a1)
  {
    id v1 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"mention"];
    AnalyticsSendEventLazy();
  }
}

void *__50__PKStatisticsManager_recordMentionItemDeactivate__block_invoke()
{
  return &unk_1F200F3A8;
}

- (void)submitRecentRollStroke
{
  recentRollStrokeInk = self->_recentRollStrokeInk;
  if (recentRollStrokeInk)
  {
    [(PKInk *)recentRollStrokeInk _isFountainPenInk];
    id v4 = self->_recentRollStrokeInk;
    self->_recentRollStrokeInk = 0;

    AnalyticsSendEventLazy();
  }
}

id __45__PKStatisticsManager_submitRecentRollStroke__block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"pencilStrokeUndone";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = @"barrelRollMaxDegrees";
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v9[1] = v3;
  v8[2] = @"toolSelected";
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v9[2] = v4;
  v8[3] = @"bundleId_category";
  uint64_t v5 = +[PKStatisticsManager bundleIDCategory]();
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)recordStrokeWithInk:(double)a3 rollAngleDelta:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1
    && a3 > 0.0
    && (([v5 _isFountainPenInkV2] & 1) != 0 || objc_msgSend(v6, "_isMarkerInk")))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKStatisticsManager_recordStrokeWithInk_rollAngleDelta___block_invoke;
    block[3] = &unk_1E64C9610;
    block[4] = a1;
    id v8 = v6;
    double v9 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__PKStatisticsManager_recordStrokeWithInk_rollAngleDelta___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  id v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v4 = v2;
  if (v1)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v1 selector:sel_submitRecentRollStroke object:0];
    [(id)v1 submitRecentRollStroke];
    objc_storeStrong((id *)(v1 + 40), v2);
    *(void *)(v1 + 48) = v3;
    *(unsigned char *)(v1 + 56) = 0;
    [(id)v1 performSelector:sel_submitRecentRollStroke withObject:0 afterDelay:3.0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);
  objc_storeStrong((id *)&self->_recentRollStrokeInk, 0);
  objc_storeStrong((id *)&self->_recentTextLinesStraightened, 0);

  objc_storeStrong((id *)&self->_recentShapeCreated, 0);
}

@end