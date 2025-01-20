@interface NTKFoghornTimeView
+ (BOOL)_stuffForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 layoutConstants:(id *)a6 renderRect:(CGRect *)a7 oversizedRect:(CGRect *)a8 showSeconds:(BOOL *)a9;
+ (CGSize)_frameSetterSizeForAttributedString:(id)a3;
+ (CGSize)_getSizesForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 font:(id)a7 showSeconds:(BOOL)a8 metricsRect:(CGRect)a9 hoursSize:(CGSize *)a10 minutesSeparatorSize:(CGSize *)a11 minutesSize:(CGSize *)a12 secondsSize:(CGSize *)a13;
+ (__CTFrame)_CTFrameForFrame:(CGRect)a3 text:(id)a4 textColor:(id)a5 font:(id)a6 forDevice:(id)a7;
+ (id)_hoursMinutesStringFromTimeFormatter:(id)a3;
+ (id)_minutesSeparatorImageWithSize:(CGSize)a3 scale:(double)a4 frame:(CGRect)a5 text:(id)a6 textColor:(id)a7 font:(id)a8 forDevice:(id)a9;
+ (id)_secondsStringFromTimeFormatter:(id)a3;
+ (void)_configureWithMetricBounds:(CGRect)a3 hoursSize:(CGSize)a4 minutesSeparatorSize:(CGSize)a5 minutesSize:(CGSize)a6 secondsSize:(CGSize)a7 textInset:(double)a8 hScale:(double)a9 snappingPolicy:(unint64_t)a10 forDevice:(id)a11 frameStates:(id *)a12;
+ (void)_stringsFromTimeFormatter:(id)a3 showSeconds:(BOOL)a4 hoursString:(id *)a5 blinkerString:(id *)a6 minutesString:(id *)a7 secondsString:(id *)a8;
+ (void)drawSnapshotInContext:(CGContext *)a3 layoutStyle:(unint64_t)a4 inset:(BOOL)a5 minutesColor:(id)a6 secondsColor:(id)a7 forDevice:(id)a8;
- (BOOL)_stuffForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 renderRect:(CGRect *)a6 oversizedRect:(CGRect *)a7 showSeconds:(BOOL *)a8;
- (BOOL)_tritiumOff;
- (BOOL)_tritiumOn;
- (BOOL)isFrozen;
- (BOOL)isInset;
- (CGRect)contentBounds;
- (CGSize)_getLayoutForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 showSeconds:(BOOL)a7 numberOfThinCharacters:(unint64_t)a8 layoutStyle:(unint64_t)a9 inset:(BOOL)a10 tritiumOn:(BOOL)a11 metricsRect:(CGRect)a12;
- (CGSize)_layoutForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 showSeconds:(BOOL)a7 transitoryFontSize:(CGSize)a8 transitoryFontWeight:(double)a9 metricsRect:(CGRect)a10 snapToPixel:(BOOL)a11 toLayoutStyle:(unint64_t)a12 font:(id *)a13 frameStates:(id *)a14;
- (CGSize)_scaleSizeForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 numberOfThinCharacters:(unint64_t)a6;
- (CGSize)_scaleSizeForTimeFormatter:(id)a3 layoutStyle:(unint64_t)a4 inset:(BOOL)a5 tritiumOn:(BOOL)a6;
- (NTKFoghornTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKFoghornTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4 clockTimer:(id)a5;
- (UIColor)minutesColor;
- (UIColor)secondsColor;
- (double)_scaleWeightForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5;
- (id)_getMinutesColor;
- (id)_getSecondsColorWithAlpha:(double)a3;
- (unint64_t)_numberOfThinCharactersForTimeFormatter:(id)a3;
- (unint64_t)animationSnapStyle;
- (unint64_t)animationStyle;
- (unint64_t)layoutStyle;
- (unint64_t)needsDisplayElementMask;
- (void)_cleanupElementFrameStates;
- (void)_drawInContext:(CGContext *)a3 needsDisplayElementMask:(unint64_t)a4;
- (void)_ensureCTFramesForElementMask:(unint64_t)a3 withFont:(id)a4;
- (void)_layoutAndUpdateForTimeFormatter:(double)a3 showSeconds:(double)a4 transitoryFontSize:(double)a5 transitoryFontWeight:(double)a6 metricsRect:(double)a7 snapToPixel:(double)a8 fromLayoutStyle:(uint64_t)a9 toLayoutStyle:(void *)a10 fromInset:(uint64_t)a11 toInset:(unsigned int)a12 fromTritiumOn:(uint64_t)a13 toTritiumOn:(uint64_t)a14 progress:(int)a15 secondsSize:(double)a16 secondsWeight:(unsigned __int8)a17 secondsRenderRect:(unsigned __int8)a18 blinkAlpha:(unsigned __int8)a19 secondsAlpha:(double)a20;
- (void)_layoutAndUpdateForTimeFormatter:(id)a3 showSeconds:(BOOL)a4 layoutStyle:(unint64_t)a5 inset:(BOOL)a6 tritiumOn:(BOOL)a7 metricsRect:(CGRect)a8 blinkAlpha:(double)a9 secondsAlpha:(double)a10;
- (void)_setLayoutFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 fromTritiumOn:(BOOL)a5 toTritiumOn:(BOOL)a6 fromInset:(BOOL)a7 toInset:(BOOL)a8 progress:(double)a9;
- (void)_setNeedsDisplayForElementMask:(unint64_t)a3;
- (void)_setNeedsDisplayInRect:(CGRect)a3;
- (void)_startBlinking;
- (void)_stopBlinking;
- (void)_updateBlinkWithAlpha:(double)a3;
- (void)_updateBlinkerAlphaForSecondFraction:(double)a3;
- (void)_updateBlinking;
- (void)_updateColorsForElementMask:(unint64_t)a3 blinkAlpha:(double)a4 secondsAlpha:(double)a5;
- (void)_updateColorsWithBlinkAlpha:(double)a3 secondsAlpha:(double)a4;
- (void)_updateFrameElement:(unint64_t)a3 frame:(CGRect)a4 text:(id)a5 textColor:(id)a6;
- (void)_updateFrameElementsForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 blinkAlpha:(double)a7 secondsAlpha:(double)a8;
- (void)_updateHoursMinutesSecondsForTimeFormatter:(id)a3 layoutStyle:(unint64_t)a4 tritiumOn:(BOOL)a5 blinkAlpha:(double)a6;
- (void)_updateMinutesSeparatorLayerForTimeFormatter:(id)a3;
- (void)_updateSecondsForTimeFormatter:(id)a3 showSeconds:(BOOL)a4 secondsAlpha:(double)a5;
- (void)_updateShowSeconds;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setAnimationSnapStyle:(unint64_t)a3;
- (void)setAnimationStyle:(unint64_t)a3;
- (void)setFromInset:(BOOL)a3 toInset:(BOOL)a4 progress:(double)a5;
- (void)setFrozen:(BOOL)a3;
- (void)setInset:(BOOL)a3;
- (void)setLayoutFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 progress:(double)a5;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setMinutesColor:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayElementMask:(unint64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSecondsColor:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)timeFormatterReportingLiveTimeDidChange:(id)a3;
- (void)timeFormatterTextDidChange:(id)a3;
@end

@implementation NTKFoghornTimeView

- (NTKFoghornTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (void *)MEMORY[0x263EFCF88];
  id v10 = a4;
  v14 = objc_msgSend_sharedInstance(v9, v11, v12, v13);
  v16 = (NTKFoghornTimeView *)objc_msgSend_initWithFrame_forDevice_clockTimer_(self, v15, (uint64_t)v10, (uint64_t)v14, x, y, width, height);

  return v16;
}

- (NTKFoghornTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4 clockTimer:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v92.receiver = self;
  v92.super_class = (Class)NTKFoghornTimeView;
  v17 = -[NTKFoghornTimeView initWithFrame:](&v92, sel_initWithFrame_, x, y, width, height);
  if (v17)
  {
    v18 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v14, v15, v16);
    objc_msgSend_setBackgroundColor_(v17, v19, (uint64_t)v18, v20);

    objc_storeStrong((id *)&v17->_device, a4);
    id v21 = v12;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D51D0);
    id WeakRetained = objc_loadWeakRetained(&qword_2691D51D8);
    if (WeakRetained)
    {
      v23 = WeakRetained;
      id v24 = objc_loadWeakRetained(&qword_2691D51D8);
      if (v24 == v21)
      {
        uint64_t v28 = objc_msgSend_version(v21, v25, v26, v27);
        uint64_t v29 = qword_2691D51E0;

        if (v28 == v29)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D51D0);
          memcpy(v91, &unk_2691D4E38, sizeof(v91));

          memcpy(&v17->_layoutConstants, v91, sizeof(v17->_layoutConstants));
          v35 = [NTKFoghornFaceFontLoader alloc];
          uint64_t v39 = objc_msgSend_initWithFontSize_(v35, v36, v37, v38, v17->_layoutConstants.fontSize);
          timeDisplayFontLoader = v17->_timeDisplayFontLoader;
          v17->_timeDisplayFontLoader = (NTKFoghornFaceFontLoader *)v39;

          uint64_t v44 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v41, v42, v43);
          minutesColor = v17->_minutesColor;
          v17->_minutesColor = (UIColor *)v44;

          uint64_t v49 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v46, v47, v48, 0.247058824, 0.435294122, 0.580392182, 1.0);
          secondsColor = v17->_secondsColor;
          v17->_secondsColor = (UIColor *)v49;

          id v51 = objc_alloc(MEMORY[0x263EFD220]);
          uint64_t v53 = objc_msgSend_initWithForcesLatinNumbers_clockTimer_(v51, v52, 1, (uint64_t)v13);
          timeFormatter = v17->_timeFormatter;
          v17->_timeFormatter = (CLKTimeFormatter *)v53;

          objc_msgSend_setShowSeconds_(v17->_timeFormatter, v55, 1, v56);
          objc_msgSend_addObserver_(v17->_timeFormatter, v57, (uint64_t)v17, v58);
          uint64_t v61 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v59, @"1", v60);
          thinCharacterSet = v17->_thinCharacterSet;
          v17->_thinCharacterSet = (NSCharacterSet *)v61;

          v63 = [NTKFoghornTimeViewLayer alloc];
          v66 = (NTKFoghornTimeViewLayer *)objc_msgSend_initWithTimeView_(v63, v64, (uint64_t)v17, v65);
          objc_msgSend_screenScale(v21, v67, v68, v69);
          objc_msgSend_setContentsScale_(v66, v70, v71, v72);
          v76 = objc_msgSend_layer(v17, v73, v74, v75);
          objc_msgSend_addSublayer_(v76, v77, (uint64_t)v66, v78);

          minutesSeparatorLayer = v17->_minutesSeparatorLayer;
          v17->_minutesSeparatorLayer = v66;
          v80 = v66;

          objc_msgSend_setOpacity_(v17->_minutesSeparatorLayer, v81, v82, v83, 0.0);
          v17->_animationStyle = 0;
          v17->_animationSnapStyle = 1;
          objc_msgSend_setClearsContextBeforeDrawing_(v17, v84, 0, v85);
          objc_msgSend_setOpaque_(v17, v86, 0, v87);
          objc_msgSend_setLayoutStyle_(v17, v88, 5, v89);
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v30 = objc_storeWeak(&qword_2691D51D8, v21);
    qword_2691D51E0 = objc_msgSend_version(v21, v31, v32, v33);

    sub_246B14C14(v34, v21);
    goto LABEL_7;
  }
LABEL_8:

  return v17;
}

- (void)dealloc
{
  objc_msgSend__cleanupElementFrameStates(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)NTKFoghornTimeView;
  [(NTKFoghornTimeView *)&v5 dealloc];
}

+ (id)_hoursMinutesStringFromTimeFormatter:(id)a3
{
  id v3 = a3;
  objc_msgSend_timeText(v3, v4, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  if (objc_msgSend_showSeconds(v3, v8, v9, v10))
  {
    uint64_t v15 = objc_msgSend_rangeInTimeSubstringFromSecondsSeparatorText(v3, v11, v12, v13);
    v14 = objc_msgSend_substringToIndex_(v7, v16, v15 - 1, v17);
  }

  return v14;
}

+ (id)_secondsStringFromTimeFormatter:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_showSeconds(v3, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_timeText(v3, v7, v8, v9);
    uint64_t v14 = objc_msgSend_rangeInTimeSubstringFromSecondsSeparatorText(v3, v11, v12, v13);
    uint64_t v16 = objc_msgSend_substringWithRange_(v10, v15, v14 - 1, (uint64_t)(v15 + 1));
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (void)_stringsFromTimeFormatter:(id)a3 showSeconds:(BOOL)a4 hoursString:(id *)a5 blinkerString:(id *)a6 minutesString:(id *)a7 secondsString:(id *)a8
{
  BOOL v12 = a4;
  id v42 = a3;
  uint64_t v16 = objc_msgSend_timeText(v42, v13, v14, v15);
  if (objc_msgSend_showSeconds(v42, v17, v18, v19))
  {
    uint64_t v25 = objc_msgSend_rangeInTimeSubstringFromSecondsSeparatorText(v42, v20, v21, v22) - 1;
    if (v12)
    {
      uint64_t v26 = objc_msgSend_substringWithRange_(v16, v23, v25, (uint64_t)(v23 + 1));
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v27 = objc_msgSend_substringToIndex_(v16, v23, v25, v24);

    uint64_t v16 = (void *)v27;
  }
  else
  {
    uint64_t v26 = 0;
  }
  uint64_t v28 = objc_msgSend_blinkerRangeInTimeText(v42, v20, v21, v22);
  uint64_t v30 = (uint64_t)v29;
  uint64_t v32 = objc_msgSend_substringToIndex_(v16, v29, v28, v31);
  uint64_t v34 = objc_msgSend_substringWithRange_(v16, v33, v28, v30);
  uint64_t v37 = objc_msgSend_substringFromIndex_(v16, v35, v28 + v30, v36);
  id v38 = v32;
  *a5 = v38;
  id v39 = v34;
  *a6 = v39;
  id v40 = v37;
  *a7 = v40;
  id v41 = v26;
  *a8 = v41;
}

+ (CGSize)_frameSetterSizeForAttributedString:(id)a3
{
  CFAttributedStringRef v3 = (const __CFAttributedString *)a3;
  v4 = CTFramesetterCreateWithAttributedString(v3);
  CFIndex v8 = objc_msgSend_length(v3, v5, v6, v7);

  v13.double width = 1.79769313e308;
  v12.location = 0;
  v12.length = v8;
  v13.double height = 1.79769313e308;
  CGSize v9 = CTFramesetterSuggestFrameSizeWithConstraints(v4, v12, 0, v13, 0);
  CFRelease(v4);
  double width = v9.width;
  double height = v9.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (CGSize)_getSizesForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 font:(id)a7 showSeconds:(BOOL)a8 metricsRect:(CGRect)a9 hoursSize:(CGSize *)a10 minutesSeparatorSize:(CGSize *)a11 minutesSize:(CGSize *)a12 secondsSize:(CGSize *)a13
{
  BOOL v74 = a8;
  CGFloat height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  v77[3] = *MEMORY[0x263EF8340];
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = objc_alloc_init(MEMORY[0x263F81650]);
  objc_msgSend_setAlignment_(v25, v26, 4, v27);
  uint64_t v31 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v28, v29, v30);
  uint64_t v32 = *MEMORY[0x263F814F0];
  v76[0] = *MEMORY[0x263F81500];
  v76[1] = v32;
  v77[0] = v31;
  v77[1] = v21;
  uint64_t v75 = v21;
  v76[2] = *MEMORY[0x263F81540];
  v77[2] = v25;
  uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v77, (uint64_t)v76, 3);
  id v35 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v37 = objc_msgSend_initWithString_attributes_(v35, v36, (uint64_t)v24, (uint64_t)v34);

  id v38 = objc_alloc(MEMORY[0x263F086A0]);
  id v40 = objc_msgSend_initWithString_attributes_(v38, v39, (uint64_t)v23, (uint64_t)v34);

  id v41 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v43 = objc_msgSend_initWithString_attributes_(v41, v42, (uint64_t)v22, (uint64_t)v34);

  objc_msgSend__frameSetterSizeForAttributedString_(a1, v44, (uint64_t)v37, v45);
  double v47 = v46;
  CGFloat v49 = v48;
  v79.origin.CGFloat x = x;
  v79.origin.CGFloat y = y;
  v79.size.CGFloat width = width;
  v79.size.CGFloat height = height;
  CGFloat v73 = CGRectGetHeight(v79);
  objc_msgSend__frameSetterSizeForAttributedString_(a1, v50, (uint64_t)v40, v51);
  double v53 = v52;
  CGFloat v55 = v54;
  objc_msgSend__frameSetterSizeForAttributedString_(a1, v56, (uint64_t)v43, v57);
  double v59 = v58;
  CGFloat v61 = v60;
  if (v74)
  {
    id v62 = objc_alloc(MEMORY[0x263F086A0]);
    v64 = objc_msgSend_initWithString_attributes_(v62, v63, @":88", (uint64_t)v34);
    objc_msgSend__frameSetterSizeForAttributedString_(a1, v65, (uint64_t)v64, v66);
    double v68 = v67;
    CGFloat v70 = v69;
  }
  else
  {
    double v68 = *MEMORY[0x263F001B0];
    CGFloat v70 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  a10->CGFloat width = v47;
  a10->CGFloat height = v49;
  a11->CGFloat width = v53;
  a11->CGFloat height = v55;
  a12->CGFloat width = v59;
  a12->CGFloat height = v61;
  a13->CGFloat width = v68;
  a13->CGFloat height = v70;

  double v71 = v47 + 0.0 + v53 + v59 + v68;
  double v72 = v73;
  result.CGFloat height = v72;
  result.CGFloat width = v71;
  return result;
}

+ (void)_configureWithMetricBounds:(CGRect)a3 hoursSize:(CGSize)a4 minutesSeparatorSize:(CGSize)a5 minutesSize:(CGSize)a6 secondsSize:(CGSize)a7 textInset:(double)a8 hScale:(double)a9 snappingPolicy:(unint64_t)a10 forDevice:(id)a11 frameStates:(id *)a12
{
  CGFloat width = a7.width;
  uint64_t v13 = *(void *)&a6.width;
  double v26 = a5.width;
  double v14 = a4.width;
  CGFloat height = a3.size.height;
  CGFloat v16 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v27 = *(id *)&a6.height;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = v16;
  v31.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = v16;
  v32.size.CGFloat height = height;
  CGFloat v20 = CGRectGetHeight(v32);
  if (v13)
  {
    CLKCeilForDevice();
    double v22 = v21;
    CLKCeilForDevice();
    CGFloat v20 = v23;
    double MinY = v22 - v23;
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = v16;
    v33.size.CGFloat height = height;
    CGRectGetMinX(v33);
    CLKFloorForDevice();
  }
  else
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = v16;
    v34.size.CGFloat height = height;
    double v24 = CGRectGetMinX(v34) + v29 * v30;
  }
  **(double **)&CGFloat width = v24;
  *(double *)(*(void *)&width + 8) = MinY;
  double v25 = v14 + v24;
  *(double *)(*(void *)&width + 16) = v14;
  *(CGFloat *)(*(void *)&width + 24) = v20;
  *(double *)(*(void *)&width + 56) = sub_246B11218(v13, v27, v14 + v24);
  *(double *)(*(void *)&width + 64) = MinY;
  *(double *)(*(void *)&width + 72) = v26;
  *(CGFloat *)(*(void *)&width + 80) = v20;
  *(double *)(*(void *)&width + 112) = sub_246B11218(v13, v27, v26 + v25);
  *(double *)(*(void *)&width + 120) = MinY;
  *(double *)(*(void *)&width + 128) = a8;
  *(CGFloat *)(*(void *)&width + 136) = v20;
  *(double *)(*(void *)&width + 168) = sub_246B11218(v13, v27, a8 + v26 + v25);
  *(double *)(*(void *)&width + 176) = MinY;
  *(void *)(*(void *)&width + 184) = a12;
  *(CGFloat *)(*(void *)&width + 192) = v20;
}

- (id)_getSecondsColorWithAlpha:(double)a3
{
  v4 = self->_secondsColor;
  CFIndex v8 = v4;
  if (a3 >= 0.0 && a3 < 1.0)
  {
    uint64_t v10 = objc_msgSend_colorWithAlphaComponent_(v4, v5, v6, v7, a3);

    CFIndex v8 = (void *)v10;
  }

  return v8;
}

- (id)_getMinutesColor
{
  uint64_t v2 = self->_minutesColor;

  return v2;
}

- (void)_cleanupElementFrameStates
{
  frameStates = self->_frameStates;
  for (uint64_t i = 32; i != 256; i += 56)
  {
    v4 = *(const void **)((char *)&frameStates->frame.origin.x + i);
    if (v4)
    {
      CFRelease(v4);
      *(CGFloat *)((char *)&frameStates->frame.origin.x + i) = 0.0;
    }
  }
}

- (void)setNeedsDisplay
{
  objc_msgSend__setNeedsDisplayForElementMask_(self, a2, -1, v2);
  v4.receiver = self;
  v4.super_class = (Class)NTKFoghornTimeView;
  [(NTKFoghornTimeView *)&v4 setNeedsDisplay];
}

- (void)_setNeedsDisplayInRect:(CGRect)a3
{
  if (!CGRectIsEmpty(a3))
  {
    objc_msgSend_screenScale(self->_device, v4, v5, v6);
    UIRectIntegralWithScale();
    double x = v7;
    double y = v9;
    double width = v11;
    double height = v13;
    p_dirtyRect = &self->_dirtyRect;
    if (!CGRectIsEmpty(self->_dirtyRect))
    {
      v17.origin.double x = p_dirtyRect->origin.x;
      v17.origin.double y = self->_dirtyRect.origin.y;
      v17.size.double width = self->_dirtyRect.size.width;
      v17.size.double height = self->_dirtyRect.size.height;
      v20.origin.double x = x;
      v20.origin.double y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      CGRect v18 = CGRectUnion(v17, v20);
      double x = v18.origin.x;
      double y = v18.origin.y;
      double width = v18.size.width;
      double height = v18.size.height;
    }
    v21.origin.double x = p_dirtyRect->origin.x;
    v21.origin.double y = self->_dirtyRect.origin.y;
    v21.size.double width = self->_dirtyRect.size.width;
    v21.size.double height = self->_dirtyRect.size.height;
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    if (!CGRectEqualToRect(v19, v21))
    {
      v16.receiver = self;
      v16.super_class = (Class)NTKFoghornTimeView;
      -[NTKFoghornTimeView setNeedsDisplayInRect:](&v16, sel_setNeedsDisplayInRect_, x, y, width, height);
      p_dirtyRect->origin.double x = x;
      self->_dirtyRect.origin.double y = y;
      self->_dirtyRect.size.double width = width;
      self->_dirtyRect.size.double height = height;
    }
  }
}

- (void)_setNeedsDisplayForElementMask:(unint64_t)a3
{
  char v3 = a3;
  CGFloat v6 = *MEMORY[0x263F001A8];
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  if ((a3 & 8) != 0)
  {
    CGFloat x = self->_frameStates[3].frame.origin.x;
    CGFloat y = self->_frameStates[3].frame.origin.y;
    CGFloat width = self->_frameStates[3].frame.size.width;
    CGFloat height = self->_frameStates[3].frame.size.height;
    if (CGRectIsEmpty(*MEMORY[0x263F001A8]))
    {
      uint64_t v9 = 8;
      CGFloat v7 = height;
      CGFloat v8 = width;
      CGFloat v5 = y;
      CGFloat v6 = x;
      if ((v3 & 2) == 0)
      {
LABEL_10:
        if ((v3 & 1) == 0) {
          goto LABEL_11;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v29.origin.CGFloat x = v6;
      v29.origin.CGFloat y = v5;
      v29.size.CGFloat width = v8;
      v29.size.CGFloat height = v7;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      CGRect v30 = CGRectUnion(v29, v41);
      CGFloat v6 = v30.origin.x;
      CGFloat v5 = v30.origin.y;
      CGFloat v8 = v30.size.width;
      CGFloat v7 = v30.size.height;
      uint64_t v9 = 8;
      if ((v3 & 2) == 0) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((a3 & 2) == 0) {
      goto LABEL_10;
    }
  }
  v9 |= 2uLL;
  CGFloat v14 = self->_frameStates[1].frame.origin.x;
  CGFloat v15 = self->_frameStates[1].frame.origin.y;
  CGFloat v16 = self->_frameStates[1].frame.size.width;
  CGFloat v17 = self->_frameStates[1].frame.size.height;
  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v5;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v7;
  if (CGRectIsEmpty(v31))
  {
    CGFloat v7 = v17;
    CGFloat v8 = v16;
    CGFloat v5 = v15;
    CGFloat v6 = v14;
    goto LABEL_10;
  }
  v32.origin.CGFloat x = v6;
  v32.origin.CGFloat y = v5;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v7;
  v42.origin.CGFloat x = v14;
  v42.origin.CGFloat y = v15;
  v42.size.CGFloat width = v16;
  v42.size.CGFloat height = v17;
  CGRect v33 = CGRectUnion(v32, v42);
  CGFloat v6 = v33.origin.x;
  CGFloat v5 = v33.origin.y;
  CGFloat v8 = v33.size.width;
  CGFloat v7 = v33.size.height;
  if ((v3 & 1) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
LABEL_14:
  v9 |= 1uLL;
  CGFloat v18 = self->_frameStates[0].frame.origin.x;
  CGFloat v19 = self->_frameStates[0].frame.origin.y;
  CGFloat v20 = self->_frameStates[0].frame.size.width;
  CGFloat v21 = self->_frameStates[0].frame.size.height;
  v34.origin.CGFloat x = v6;
  v34.origin.CGFloat y = v5;
  v34.size.CGFloat width = v8;
  v34.size.CGFloat height = v7;
  if (CGRectIsEmpty(v34))
  {
    CGFloat v7 = v21;
    CGFloat v8 = v20;
    CGFloat v5 = v19;
    CGFloat v6 = v18;
    if ((v3 & 4) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    v35.origin.CGFloat x = v6;
    v35.origin.CGFloat y = v5;
    v35.size.CGFloat width = v8;
    v35.size.CGFloat height = v7;
    v43.origin.CGFloat x = v18;
    v43.origin.CGFloat y = v19;
    v43.size.CGFloat width = v20;
    v43.size.CGFloat height = v21;
    CGRect v36 = CGRectUnion(v35, v43);
    CGFloat v6 = v36.origin.x;
    CGFloat v5 = v36.origin.y;
    CGFloat v8 = v36.size.width;
    CGFloat v7 = v36.size.height;
    if ((v3 & 4) == 0) {
      goto LABEL_21;
    }
  }
LABEL_18:
  v9 |= 4uLL;
  CGFloat v22 = self->_frameStates[2].frame.origin.x;
  CGFloat v23 = self->_frameStates[2].frame.origin.y;
  CGFloat v24 = self->_frameStates[2].frame.size.width;
  CGFloat v25 = self->_frameStates[2].frame.size.height;
  v37.origin.CGFloat x = v6;
  v37.origin.CGFloat y = v5;
  v37.size.CGFloat width = v8;
  v37.size.CGFloat height = v7;
  if (CGRectIsEmpty(v37))
  {
    CGFloat v7 = v25;
    CGFloat v8 = v24;
    CGFloat v5 = v23;
    CGFloat v6 = v22;
  }
  else
  {
    v38.origin.CGFloat x = v6;
    v38.origin.CGFloat y = v5;
    v38.size.CGFloat width = v8;
    v38.size.CGFloat height = v7;
    v44.origin.CGFloat x = v22;
    v44.origin.CGFloat y = v23;
    v44.size.CGFloat width = v24;
    v44.size.CGFloat height = v25;
    CGRect v39 = CGRectUnion(v38, v44);
    CGFloat v6 = v39.origin.x;
    CGFloat v5 = v39.origin.y;
    CGFloat v8 = v39.size.width;
    CGFloat v7 = v39.size.height;
  }
LABEL_21:
  self->_needsDisplayElementMask |= v9;
  v40.origin.CGFloat x = v6;
  v40.origin.CGFloat y = v5;
  v40.size.CGFloat width = v8;
  v40.size.CGFloat height = v7;
  if (!CGRectIsEmpty(v40))
  {
    MEMORY[0x270F9A6D0](self, sel__setNeedsDisplayInRect_, v26, v27);
  }
}

- (void)_updateFrameElement:(unint64_t)a3 frame:(CGRect)a4 text:(id)a5 textColor:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v19 = a5;
  id v14 = a6;
  CGFloat v15 = &self->_frameStates[a3];
  v15->frame.origin.CGFloat x = x;
  v15->frame.origin.CGFloat y = y;
  v15->frame.size.CGFloat width = width;
  v15->frame.size.CGFloat height = height;
  objc_storeStrong((id *)&v15->text, a5);
  objc_storeStrong((id *)&v15->textColor, a6);
  ctFrame = v15->ctFrame;
  p_ctFrame = &v15->ctFrame;
  CGFloat v16 = ctFrame;
  if (ctFrame)
  {
    CFRelease(v16);
    *p_ctFrame = 0;
  }
}

- (void)_updateSecondsForTimeFormatter:(id)a3 showSeconds:(BOOL)a4 secondsAlpha:(double)a5
{
  if (a4)
  {
    id v7 = a3;
    CGFloat v8 = objc_opt_class();
    objc_msgSend__secondsStringFromTimeFormatter_(v8, v9, (uint64_t)v7, v10);
    CGFloat v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGFloat v15 = &stru_26FB0CCF0;
  }
  double v11 = objc_msgSend__getSecondsColorWithAlpha_(self, a2, (uint64_t)a3, a4, a5);
  objc_msgSend__updateFrameElement_frame_text_textColor_(self, v12, 3, (uint64_t)v15, v11, self->_frameStates[3].frame.origin.x, self->_frameStates[3].frame.origin.y, self->_frameStates[3].frame.size.width, self->_frameStates[3].frame.size.height);
  objc_msgSend__setNeedsDisplayForElementMask_(self, v13, 8, v14);
}

- (void)_updateColorsForElementMask:(unint64_t)a3 blinkAlpha:(double)a4 secondsAlpha:(double)a5
{
  uint64_t v9 = 0;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  CFRange v12 = 0;
  if (a4 >= 1.0 || a4 < 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = a4;
  }
  do
  {
    if (((1 << v11) & a3) != 0)
    {
      switch(v11)
      {
        case 0:
        case 2:
          CGFloat v15 = v19;
          if (!v19)
          {
            CGFloat v15 = objc_msgSend__getMinutesColor(self, a2, a3, v5);
            id v19 = v15;
          }
          goto LABEL_20;
        case 1:
          if (v12)
          {
            CGFloat v15 = v12;
          }
          else
          {
            CGFloat v17 = v19;
            if (!v19)
            {
              CGFloat v17 = objc_msgSend__getMinutesColor(self, a2, a3, v5);
            }
            id v19 = v17;
            CGFloat v15 = objc_msgSend_colorWithAlphaComponent_(v17, a2, a3, v5, v14);
            CFRange v12 = v15;
          }
          goto LABEL_20;
        case 3:
          if (v10)
          {
            CGFloat v15 = v10;
          }
          else
          {
            CGFloat v15 = objc_msgSend__getSecondsColorWithAlpha_(self, a2, a3, v5, a5);
            uint64_t v10 = v15;
          }
LABEL_20:
          id v16 = v15;
          objc_msgSend__updateFrameElement_frame_text_textColor_(self, v18, v11, (uint64_t)self->_frameStates[v9].text, v16, self->_frameStates[v9].frame.origin.x, self->_frameStates[v9].frame.origin.y, self->_frameStates[v9].frame.size.width, self->_frameStates[v9].frame.size.height);
          break;
        default:
          id v16 = 0;
          objc_msgSend__updateFrameElement_frame_text_textColor_(self, a2, v11, (uint64_t)self->_frameStates[v9].text, 0, self->_frameStates[v9].frame.origin.x, self->_frameStates[v9].frame.origin.y, self->_frameStates[v9].frame.size.width, self->_frameStates[v9].frame.size.height);
          break;
      }
    }
    ++v11;
    ++v9;
  }
  while (v11 != 4);
  objc_msgSend__setNeedsDisplayForElementMask_(self, a2, a3, v5);
}

- (void)_updateColorsWithBlinkAlpha:(double)a3 secondsAlpha:(double)a4
{
  objc_msgSend__updateColorsForElementMask_blinkAlpha_secondsAlpha_(self, a2, -1, v4, a3, a4);
}

- (void)_updateBlinkWithAlpha:(double)a3
{
  id v7 = objc_msgSend__getMinutesColor(self, a2, v3, v4);
  id v17 = v7;
  double v11 = 1.0;
  if (a3 < 1.0 && a3 >= 0.0) {
    double v11 = a3;
  }
  double v13 = objc_msgSend_colorWithAlphaComponent_(v7, v8, v9, v10, v11);
  objc_msgSend__updateFrameElement_frame_text_textColor_(self, v14, 1, (uint64_t)self->_frameStates[1].text, v13, self->_frameStates[1].frame.origin.x, self->_frameStates[1].frame.origin.y, self->_frameStates[1].frame.size.width, self->_frameStates[1].frame.size.height);
  objc_msgSend__setNeedsDisplayForElementMask_(self, v15, 2, v16);
}

- (void)_updateFrameElementsForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 blinkAlpha:(double)a7 secondsAlpha:(double)a8
{
  id v46 = a3;
  id v45 = a4;
  id v44 = a5;
  id v14 = a6;
  objc_msgSend__cleanupElementFrameStates(self, v15, v16, v17);
  objc_msgSend__updateColorsWithBlinkAlpha_secondsAlpha_(self, v18, v19, v20, a7, a8);
  CGFloat v24 = objc_msgSend__getMinutesColor(self, v21, v22, v23);
  CGRect v31 = objc_msgSend__getSecondsColorWithAlpha_(self, v25, v26, v27, a8);
  double v32 = 1.0;
  if (a7 < 1.0 && a7 >= 0.0) {
    double v32 = a7;
  }
  CGRect v35 = objc_msgSend_colorWithAlphaComponent_(v24, v28, v29, v30, v32);
  uint64_t v36 = 0;
  CGRect v37 = self;
  do
  {
    CGRect v38 = v46;
    CGRect v39 = v24;
    switch(v36)
    {
      case 0:
        goto LABEL_12;
      case 1:
        CGRect v38 = v45;
        CGRect v39 = v35;
        goto LABEL_12;
      case 2:
        CGRect v38 = v44;
        CGRect v39 = v24;
        goto LABEL_12;
      case 3:
        CGRect v38 = v14;
        CGRect v39 = v31;
LABEL_12:
        id v40 = v38;
        id v41 = v39;
        objc_msgSend__updateFrameElement_frame_text_textColor_(self, v42, v36, (uint64_t)v40, v41, v37->_frameStates[0].frame.origin.x, v37->_frameStates[0].frame.origin.y, v37->_frameStates[0].frame.size.width, v37->_frameStates[0].frame.size.height);
        break;
      default:
        id v40 = 0;
        id v41 = 0;
        objc_msgSend__updateFrameElement_frame_text_textColor_(self, v34, v36, 0, 0, v37->_frameStates[0].frame.origin.x, v37->_frameStates[0].frame.origin.y, v37->_frameStates[0].frame.size.width, v37->_frameStates[0].frame.size.height);
        break;
    }

    ++v36;
    CGRect v37 = (NTKFoghornTimeView *)((char *)v37 + 56);
  }
  while (v36 != 4);
  objc_msgSend__setNeedsDisplayForElementMask_(self, v34, -1, v43);
}

+ (__CTFrame)_CTFrameForFrame:(CGRect)a3 text:(id)a4 textColor:(id)a5 font:(id)a6 forDevice:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v49[3] = *MEMORY[0x263EF8340];
  id v14 = (objc_class *)MEMORY[0x263F81650];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = objc_alloc_init(v14);
  objc_msgSend_setAlignment_(v19, v20, 4, v21);
  uint64_t v22 = *MEMORY[0x263F814F0];
  v48[0] = *MEMORY[0x263F81500];
  v48[1] = v22;
  v49[0] = v17;
  v49[1] = v16;
  v48[2] = *MEMORY[0x263F81540];
  v49[2] = v19;
  CGFloat v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v49, (uint64_t)v48, 3);
  id v25 = objc_alloc(MEMORY[0x263F086A0]);

  CFAttributedStringRef v27 = (const __CFAttributedString *)objc_msgSend_initWithString_attributes_(v25, v26, (uint64_t)v18, (uint64_t)v24);
  objc_msgSend_leading(v16, v28, v29, v30);
  objc_msgSend_ascender(v16, v31, v32, v33);
  objc_msgSend_descender(v16, v34, v35, v36);

  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRectGetHeight(v51);
  CLKRoundForDevice();
  CGFloat v38 = v37;

  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  CGFloat v40 = CGRectGetWidth(v53);
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  v55.size.CGFloat height = CGRectGetHeight(v54);
  v55.origin.CGFloat x = MinX;
  v55.origin.CGFloat y = v38;
  v55.size.CGFloat width = v40;
  id v41 = CGPathCreateWithRect(v55, 0);
  CGRect v42 = CTFramesetterCreateWithAttributedString(v27);
  v50.length = objc_msgSend_length(v27, v43, v44, v45);
  v50.location = 0;
  Frame = CTFramesetterCreateFrame(v42, v50, v41, 0);
  CFRelease(v42);
  CGPathRelease(v41);

  return Frame;
}

- (void)_ensureCTFramesForElementMask:(unint64_t)a3 withFont:(id)a4
{
  int v4 = a3;
  id v22 = a4;
  if (v22)
  {
    uint64_t v6 = 0;
    for (uint64_t i = 0; i != 4; ++i)
    {
      if (((1 << i) & v4) != 0 && !self->_frameStates[v6].ctFrame)
      {
        CGFloat v8 = &self->_frameStates[v6];
        uint64_t v9 = v8->textColor;
        uint64_t v10 = v9;
        text = v8->text;
        if (text) {
          BOOL v12 = v9 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          double v13 = &self->_frameStates[v6];
          double height = v13->frame.size.height;
          double y = v8->frame.origin.y;
          double width = v8->frame.size.width;
          double x = v13->frame.origin.x;
          id v18 = text;
          id v19 = objc_opt_class();
          uint64_t v21 = (__CTFrame *)objc_msgSend__CTFrameForFrame_text_textColor_font_forDevice_(v19, v20, (uint64_t)v18, (uint64_t)v10, v22, self->_device, x, y, width, height);

          self->_frameStates[v6].ctFrame = v21;
        }
      }
      ++v6;
    }
  }
}

- (unint64_t)_numberOfThinCharactersForTimeFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_thinCharacterSet;
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend__hoursMinutesStringFromTimeFormatter_(v6, v7, (uint64_t)v4, v8);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  if (v13)
  {
    uint64_t v16 = v13;
    unint64_t v17 = 0;
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v19 = objc_msgSend_characterAtIndex_(v9, v14, i, v15);
      v17 += objc_msgSend_characterIsMember_(v5, v20, v19, v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

- (CGSize)_scaleSizeForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 numberOfThinCharacters:(unint64_t)a6
{
  uint64_t v6 = a6 != 0;
  if (a6 > 3) {
    uint64_t v6 = 2;
  }
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFFELL;
  if (!a5) {
    unint64_t v7 = a3;
  }
  uint64_t v8 = &self->_layoutConstants.fontSize + 36 * a4 + 6 * v7 + 2 * v6;
  double v9 = v8[1];
  double v10 = v8[2];
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (double)_scaleWeightForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5
{
  unint64_t v5 = a3 & 0x1FFFFFFFFFFFFFFELL;
  if (!a5) {
    unint64_t v5 = a3;
  }
  return self->_layoutConstants.timeFontScaleWeight[a4][v5];
}

- (CGSize)_scaleSizeForTimeFormatter:(id)a3 layoutStyle:(unint64_t)a4 inset:(BOOL)a5 tritiumOn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v11 = objc_msgSend__numberOfThinCharactersForTimeFormatter_(self, a2, (uint64_t)a3, a4);

  objc_msgSend__scaleSizeForLayoutStyle_inset_tritiumOn_numberOfThinCharacters_(self, v10, a4, v7, v6, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)_layoutForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 showSeconds:(BOOL)a7 transitoryFontSize:(CGSize)a8 transitoryFontWeight:(double)a9 metricsRect:(CGRect)a10 snapToPixel:(BOOL)a11 toLayoutStyle:(unint64_t)a12 font:(id *)a13 frameStates:(id *)a14
{
  BOOL v14 = a11;
  BOOL v15 = a7;
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  double v23 = a8.height;
  double v24 = a8.width;
  timeDisplayFontLoader = self->_timeDisplayFontLoader;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  id v31 = a3;
  CGRect v34 = objc_msgSend_foregroundFontWithTypographicSize_weight_horizontalScale_stylisticSet_(timeDisplayFontLoader, v32, 0, v33, v24, v23, a9, 1.0);
  double v54 = 0.0;
  double v55 = 0.0;
  double v52 = 0.0;
  double v53 = 0.0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v35 = objc_opt_class();
  objc_msgSend__getSizesForHoursString_blinkerString_minutesString_secondsString_font_showSeconds_metricsRect_hoursSize_minutesSeparatorSize_minutesSize_secondsSize_(v35, v36, (uint64_t)v31, (uint64_t)v30, v29, v28, v34, v15, x, y, width, height, &v54, &v52, &v50, &v48);
  double v38 = v37;
  double v40 = v39;

  uint64_t v41 = 3;
  if (a12) {
    uint64_t v41 = 1;
  }
  if (v14) {
    uint64_t v42 = v41;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v43 = objc_opt_class();
  objc_msgSend__configureWithMetricBounds_hoursSize_minutesSeparatorSize_minutesSize_secondsSize_textInset_hScale_snappingPolicy_forDevice_frameStates_(v43, v44, v42, (uint64_t)self->_device, a14, x, y, width, height, v54, v55, v52, v53, v50, v51, v48, v49, 0, 0x3FF0000000000000);
  id v45 = v34;
  *a13 = v45;

  double v46 = v38;
  double v47 = v40;
  result.double height = v47;
  result.double width = v46;
  return result;
}

- (CGSize)_getLayoutForHoursString:(id)a3 blinkerString:(id)a4 minutesString:(id)a5 secondsString:(id)a6 showSeconds:(BOOL)a7 numberOfThinCharacters:(unint64_t)a8 layoutStyle:(unint64_t)a9 inset:(BOOL)a10 tritiumOn:(BOOL)a11 metricsRect:(CGRect)a12
{
  BOOL v13 = a7;
  double height = a12.size.height;
  double width = a12.size.width;
  double y = a12.origin.y;
  double x = a12.origin.x;
  v47[0] = 0;
  v47[1] = 0;
  v46[0] = 0;
  v46[1] = 0;
  v45[0] = 0;
  v45[1] = 0;
  v44[0] = 0;
  v44[1] = 0;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  objc_msgSend__scaleSizeForLayoutStyle_inset_tritiumOn_numberOfThinCharacters_(self, v26, a9, a10, a11, a8);
  double v28 = v27;
  double v30 = v29;
  objc_msgSend__scaleWeightForLayoutStyle_inset_tritiumOn_(self, v31, a9, a10, a11);
  uint64_t v35 = objc_msgSend_foregroundFontWithTypographicSize_weight_horizontalScale_stylisticSet_(self->_timeDisplayFontLoader, v32, 0, v33, v28, v30, v34, 1.0);
  uint64_t v36 = objc_opt_class();
  objc_msgSend__getSizesForHoursString_blinkerString_minutesString_secondsString_font_showSeconds_metricsRect_hoursSize_minutesSeparatorSize_minutesSize_secondsSize_(v36, v37, (uint64_t)v25, (uint64_t)v24, v23, v22, v35, v13, x, y, width, height, v47, v46, v45, v44);
  double v39 = v38;
  double v41 = v40;

  double v42 = v39;
  double v43 = v41;
  result.double height = v43;
  result.double width = v42;
  return result;
}

- (void)_layoutAndUpdateForTimeFormatter:(double)a3 showSeconds:(double)a4 transitoryFontSize:(double)a5 transitoryFontWeight:(double)a6 metricsRect:(double)a7 snapToPixel:(double)a8 fromLayoutStyle:(uint64_t)a9 toLayoutStyle:(void *)a10 fromInset:(uint64_t)a11 toInset:(unsigned int)a12 fromTritiumOn:(uint64_t)a13 toTritiumOn:(uint64_t)a14 progress:(int)a15 secondsSize:(double)a16 secondsWeight:(unsigned __int8)a17 secondsRenderRect:(unsigned __int8)a18 blinkAlpha:(unsigned __int8)a19 secondsAlpha:(double)a20
{
  v83[1] = *MEMORY[0x263EF8340];
  id v36 = a10;
  objc_msgSend__setNeedsDisplayForElementMask_((void *)a1, v37, -1, v38);
  double v39 = objc_opt_class();
  id v71 = 0;
  id v72 = 0;
  id v69 = 0;
  id v70 = 0;
  uint64_t v65 = v36;
  objc_msgSend__stringsFromTimeFormatter_showSeconds_hoursString_blinkerString_minutesString_secondsString_(v39, v40, (uint64_t)v36, a11, &v72, &v71, &v70, &v69);
  id v41 = v72;
  id v42 = v71;
  id v43 = v70;
  id v44 = v69;
  id v68 = 0;
  objc_msgSend__layoutForHoursString_blinkerString_minutesString_secondsString_showSeconds_transitoryFontSize_transitoryFontWeight_metricsRect_snapToPixel_toLayoutStyle_font_frameStates_((void *)a1, v45, (uint64_t)v41, (uint64_t)v42, v43, v44, a11, a12, a2, a3, a4, a5, a6, a7, a8, a14, &v68, a1 + 1376);
  double v47 = v46;
  id v48 = v68;
  id v49 = v68;
  objc_storeStrong((id *)(a1 + 1360), v48);
  objc_storeStrong((id *)(a1 + 1368), v48);
  v84.origin.double x = a23;
  v84.origin.double y = a24;
  v84.size.double width = a25;
  v84.size.double height = a26;
  if (CGRectIsEmpty(v84))
  {
    id v64 = v49;
  }
  else
  {
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v82 = 0;
    v83[0] = 0;
    id v67 = v49;
    objc_msgSend__layoutForHoursString_blinkerString_minutesString_secondsString_showSeconds_transitoryFontSize_transitoryFontWeight_metricsRect_snapToPixel_toLayoutStyle_font_frameStates_((void *)a1, v50, (uint64_t)v41, (uint64_t)v42, v43, v44, 1, a12, a20, a21, a22, a23, a24, a25, a26, a14, &v67, v73);
    id v52 = v67;
    id v64 = v67;

    objc_storeStrong((id *)(a1 + 1368), v52);
    uint64_t v53 = 0;
    *(_OWORD *)(a1 + 1544) = v80;
    *(_OWORD *)(a1 + 1560) = v81;
    do
    {

      v53 -= 7;
    }
    while (v53 != -28);
  }
  uint64_t v55 = objc_msgSend__numberOfThinCharactersForTimeFormatter_((void *)a1, v50, (uint64_t)v65, v51);
  if (a15 != a17 || a13 != a14 || a18 != a19)
  {
    BYTE1(v59) = a18;
    LOBYTE(v59) = a15;
    objc_msgSend__getLayoutForHoursString_blinkerString_minutesString_secondsString_showSeconds_numberOfThinCharacters_layoutStyle_inset_tritiumOn_metricsRect_((void *)a1, v54, (uint64_t)v41, (uint64_t)v42, v43, v44, a13 & (a18 ^ 1), v55, a5, a6, a7, a8, a13, v59);
    BYTE1(v60) = a19;
    LOBYTE(v60) = a17;
    objc_msgSend__getLayoutForHoursString_blinkerString_minutesString_secondsString_showSeconds_numberOfThinCharacters_layoutStyle_inset_tritiumOn_metricsRect_((void *)a1, v56, (uint64_t)v41, (uint64_t)v42, v43, v44, a14 & (a19 ^ 1), v55, a5, a6, a7, a8, a14, v60);
    CLKInterpolateBetweenFloatsClipped();
    double v47 = v57;
  }
  if (v47 < a7)
  {
    double v58 = (a7 - v47) * 0.5;
    *(double *)(a1 + 1376) = v58 + *(double *)(a1 + 1376);
    *(double *)(a1 + 1432) = v58 + *(double *)(a1 + 1432);
    *(double *)(a1 + 1488) = v58 + *(double *)(a1 + 1488);
    *(double *)(a1 + 1544) = v58 + *(double *)(a1 + 1544);
  }
  objc_msgSend__updateFrameElementsForHoursString_blinkerString_minutesString_secondsString_blinkAlpha_secondsAlpha_((void *)a1, v54, (uint64_t)v41, (uint64_t)v42, v43, v44, a27, a28);
}

- (void)_layoutAndUpdateForTimeFormatter:(id)a3 showSeconds:(BOOL)a4 layoutStyle:(unint64_t)a5 inset:(BOOL)a6 tritiumOn:(BOOL)a7 metricsRect:(CGRect)a8 blinkAlpha:(double)a9 secondsAlpha:(double)a10
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  BOOL v15 = a7;
  BOOL v16 = a6;
  BOOL v18 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v20 = a3;
  objc_msgSend__scaleSizeForTimeFormatter_layoutStyle_inset_tritiumOn_(self, v21, (uint64_t)v20, a5, v16, v15);
  double v23 = v22;
  double v25 = v24;
  objc_msgSend__scaleWeightForLayoutStyle_inset_tritiumOn_(self, v26, a5, v16, v15);
  double v28 = v27;
  uint64_t v32 = objc_msgSend_logObject(NTKFoghornFaceBundle, v29, v30, v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    double v37 = "-[NTKFoghornTimeView _layoutAndUpdateForTimeFormatter:showSeconds:layoutStyle:inset:tritiumOn:metricsRect:blin"
          "kAlpha:secondsAlpha:]";
    __int16 v38 = 2048;
    double v39 = v23;
    __int16 v40 = 2048;
    double v41 = v25;
    __int16 v42 = 2048;
    double v43 = v28;
    _os_log_debug_impl(&dword_246AFF000, v32, OS_LOG_TYPE_DEBUG, "%s: size = { %f, %f }, weight = %f ", buf, 0x2Au);
  }

  BYTE2(v34) = v15;
  BYTE1(v34) = v15;
  LOBYTE(v34) = v16;
  objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_transitoryFontSize_transitoryFontWeight_metricsRect_snapToPixel_fromLayoutStyle_toLayoutStyle_fromInset_toInset_fromTritiumOn_toTritiumOn_progress_secondsSize_secondsWeight_secondsRenderRect_blinkAlpha_secondsAlpha_(self, v33, (uint64_t)v20, v18, self->_animationSnapStyle != 0, a5, a5, v16, v23, v25, v28, x, y, width, height, 1.0, v34, *MEMORY[0x263F001B0], *(void *)(MEMORY[0x263F001B0] + 8),
    0,
    *MEMORY[0x263F001A8],
    *(void *)(MEMORY[0x263F001A8] + 8),
    *(void *)(MEMORY[0x263F001A8] + 16),
    *(void *)(MEMORY[0x263F001A8] + 24),
    *(void *)&a9,
    *(void *)&a10);
}

+ (id)_minutesSeparatorImageWithSize:(CGSize)a3 scale:(double)a4 frame:(CGRect)a5 text:(id)a6 textColor:(id)a7 font:(id)a8 forDevice:(id)a9
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v17 = a3.height;
  double v18 = a3.width;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  double v24 = objc_opt_new();
  objc_msgSend_setScale_(v24, v25, v26, v27, a4);
  id v28 = objc_alloc(MEMORY[0x263F827A0]);
  uint64_t v31 = objc_msgSend_initWithSize_format_(v28, v29, (uint64_t)v24, v30, v18, v17);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = sub_246B12E9C;
  v40[3] = &unk_2651F6B70;
  CGFloat v45 = x;
  CGFloat v46 = y;
  CGFloat v47 = width;
  CGFloat v48 = height;
  id v49 = a1;
  id v41 = v20;
  id v42 = v21;
  id v43 = v22;
  id v44 = v23;
  id v32 = v23;
  id v33 = v22;
  id v34 = v21;
  id v35 = v20;
  __int16 v38 = objc_msgSend_imageWithActions_(v31, v36, (uint64_t)v40, v37);

  return v38;
}

- (void)_updateMinutesSeparatorLayerForTimeFormatter:(id)a3
{
  unint64_t v5 = self->_font;
  id v6 = a3;
  double v10 = objc_msgSend__getMinutesColor(self, v7, v8, v9);
  uint64_t v11 = objc_opt_class();
  id v52 = 0;
  id v53 = 0;
  id v50 = 0;
  id v51 = 0;
  objc_msgSend__stringsFromTimeFormatter_showSeconds_hoursString_blinkerString_minutesString_secondsString_(v11, v12, (uint64_t)v6, 0, &v53, &v52, &v51, &v50);

  id v13 = v53;
  id v14 = v52;
  id v15 = v51;
  id v16 = v50;
  double x = self->_frameStates[1].frame.origin.x;
  double y = self->_frameStates[1].frame.origin.y;
  double width = self->_frameStates[1].frame.size.width;
  double height = self->_frameStates[1].frame.size.height;
  objc_msgSend_bounds(self, v21, v22, v23);
  objc_msgSend_screenScale(self->_device, v24, v25, v26);
  double v28 = v27;
  double v29 = objc_opt_class();
  uint64_t v31 = objc_msgSend__minutesSeparatorImageWithSize_scale_frame_text_textColor_font_forDevice_(v29, v30, (uint64_t)v14, (uint64_t)v10, v5, self->_device, width, height, v28, 0.0, 0.0, width, height);
  objc_msgSend_begin(MEMORY[0x263F158F8], v32, v33, v34);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v35, 1, v36);
  objc_msgSend_setFrame_(self->_minutesSeparatorLayer, v37, v38, v39, x, y, width, height);
  id v40 = v31;
  uint64_t v44 = objc_msgSend_CGImage(v40, v41, v42, v43);
  objc_msgSend_setContents_(self->_minutesSeparatorLayer, v45, v44, v46);

  objc_msgSend_commit(MEMORY[0x263F158F8], v47, v48, v49);
}

- (void)_updateHoursMinutesSecondsForTimeFormatter:(id)a3 layoutStyle:(unint64_t)a4 tritiumOn:(BOOL)a5 blinkAlpha:(double)a6
{
  BOOL v7 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  memset(v21, 0, sizeof(v21));
  unsigned __int8 v20 = 0;
  BOOL inset = self->_inset;
  if (objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, v12, a4, self->_inset, v7, &v22, v21, &v20))
  {
    objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_layoutStyle_inset_tritiumOn_metricsRect_blinkAlpha_secondsAlpha_(self, v13, (uint64_t)v10, v20, a4, inset, v7, v22, v23, a6, 1.0);
    if (self->_blinkTimerToken) {
      objc_msgSend__updateMinutesSeparatorLayerForTimeFormatter_(self, v16, (uint64_t)v10, v18);
    }
    objc_msgSend__updateBlinking(self, v16, v17, v18);
  }
  else
  {
    uint64_t v19 = objc_msgSend_logObject(NTKFoghornFaceBundle, v13, v14, v15);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[NTKFoghornTimeView _updateHoursMinutesSecondsForTimeFormatter:layoutStyle:tritiumOn:blinkAlpha:]";
      __int16 v26 = 1024;
      int v27 = a4;
      _os_log_impl(&dword_246AFF000, v19, OS_LOG_TYPE_DEFAULT, "%s: encountered unexpected layoutStyle: 0x%02X", buf, 0x12u);
    }
  }
}

+ (void)drawSnapshotInContext:(CGContext *)a3 layoutStyle:(unint64_t)a4 inset:(BOOL)a5 minutesColor:(id)a6 secondsColor:(id)a7 forDevice:(id)a8
{
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = [NTKFoghornTimeView alloc];
  objc_msgSend_screenBounds(v13, v17, v18, v19);
  id v41 = (id)objc_msgSend_initWithFrame_forDevice_(v16, v20, (uint64_t)v13, v21);

  objc_msgSend_setLayoutStyle_(v41, v22, a4, v23);
  objc_msgSend_setMinutesColor_(v41, v24, (uint64_t)v15, v25);

  objc_msgSend_setSecondsColor_(v41, v26, (uint64_t)v14, v27);
  objc_msgSend_setInset_(v41, v28, v10, v29);
  objc_msgSend_setFrozen_(v41, v30, 1, v31);
  id v32 = NTKIdealizedDate();
  objc_msgSend_setOverrideDate_duration_(v41, v33, (uint64_t)v32, v34, 0.0);

  uint64_t v38 = objc_msgSend_layer(v41, v35, v36, v37);
  objc_msgSend_renderInContext_(v38, v39, (uint64_t)a3, v40);
}

- (void)_drawInContext:(CGContext *)a3 needsDisplayElementMask:(unint64_t)a4
{
  char v4 = a4;
  if (self->_inset) {
    double MinX = CGRectGetMinX(self->_layoutConstants.timeRect[0]);
  }
  else {
    double MinX = 0.0;
  }
  objc_msgSend_bounds(self, a2, (uint64_t)a3, a4);
  CGFloat v8 = CGRectGetWidth(v25) - MinX;
  objc_msgSend_bounds(self, v9, v10, v11);
  v27.size.double height = CGRectGetHeight(v26);
  v27.origin.double x = 0.0;
  v27.origin.double y = 0.0;
  v27.size.double width = v8;
  CGContextClipToRect(a3, v27);
  objc_msgSend_begin(MEMORY[0x263F158F8], v12, v13, v14);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v15, 1, v16);
  if ((v4 & 8) != 0 && self->_frameStates[3].frame.size.width > 0.0)
  {
    objc_msgSend__ensureCTFramesForElementMask_withFont_(self, v17, 8, (uint64_t)self->_secondsFont);
    CGContextSaveGState(a3);
    CGFloat MaxY = CGRectGetMaxY(self->_frameStates[3].frame);
    CGContextTranslateCTM(a3, 0.0, MaxY);
    CGContextScaleCTM(a3, 1.0, -1.0);
    CTFrameDraw(self->_frameStates[3].ctFrame, a3);
    CGContextRestoreGState(a3);
  }
  CGFloat v19 = CGRectGetMaxY(self->_frameStates[0].frame);
  CGContextTranslateCTM(a3, 0.0, v19);
  CGContextScaleCTM(a3, 1.0, -1.0);
  if (self->_animationSnapStyle != 2)
  {
    CGContextSetShouldSubpixelPositionFonts(a3, 1);
    CGContextSetShouldSubpixelQuantizeFonts(a3, 0);
    CGContextSetShouldAntialias(a3, 1);
    CGContextSetShouldSmoothFonts(a3, 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend__ensureCTFramesForElementMask_withFont_(self, v20, 2, (uint64_t)self->_font);
    CTFrameDraw(self->_frameStates[1].ctFrame, a3);
  }
  if ((v4 & 5) != 0)
  {
    objc_msgSend__ensureCTFramesForElementMask_withFont_(self, v20, 5, (uint64_t)self->_font);
    CTFrameDraw(self->_frameStates[0].ctFrame, a3);
    CTFrameDraw(self->_frameStates[2].ctFrame, a3);
  }
  uint64_t v23 = (void *)MEMORY[0x263F158F8];

  objc_msgSend_commit(v23, v20, v21, v22);
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend_backgroundColor(self, v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  double v12 = (CGColor *)objc_msgSend_CGColor(v8, v9, v10, v11);
  CGContextSetFillColorWithColor(CurrentContext, v12);

  p_dirtyRect = &self->_dirtyRect;
  if (CGRectIsEmpty(self->_dirtyRect))
  {
    objc_msgSend_bounds(self, v14, v15, v16);
    CGContextFillRect(CurrentContext, v20);
    objc_msgSend__drawInContext_needsDisplayElementMask_(self, v17, (uint64_t)CurrentContext, -1);
  }
  else
  {
    v21.origin.double x = p_dirtyRect->origin.x;
    v21.origin.double y = self->_dirtyRect.origin.y;
    v21.size.double width = self->_dirtyRect.size.width;
    v21.size.double height = self->_dirtyRect.size.height;
    CGContextFillRect(CurrentContext, v21);
    objc_msgSend__drawInContext_needsDisplayElementMask_(self, v18, (uint64_t)CurrentContext, self->_needsDisplayElementMask);
  }
  self->_needsDisplayElementMask = 0;
  CGSize v19 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  p_dirtyRect->origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_dirtyRect.size = v19;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_msgSend_setOverrideDate_(self->_timeFormatter, a2, (uint64_t)a3, v4, a4);

  MEMORY[0x270F9A6D0](self, sel__updateShowSeconds, v6, v7);
}

- (void)setTimeOffset:(double)a3
{
}

- (void)_updateShowSeconds
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend_showSeconds(self->_timeFormatter, a2, v2, v3);
  if (objc_msgSend__tritiumOn(self, v6, v7, v8)) {
    int v12 = 0;
  }
  else {
    int v12 = self->_layoutStyle & 1;
  }
  uint64_t v16 = v12 | objc_msgSend_reportingLiveTime(self->_timeFormatter, v9, v10, v11) ^ 1;
  if (v5 != v16)
  {
    uint64_t v17 = objc_msgSend_logObject(NTKFoghornFaceBundle, v13, v14, v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = @"notShowing";
      if (v5) {
        CGSize v19 = @"showing";
      }
      else {
        CGSize v19 = @"notShowing";
      }
      if (v16) {
        uint64_t v18 = @"showing";
      }
      int v23 = 138412546;
      double v24 = v19;
      __int16 v25 = 2112;
      CGRect v26 = v18;
      _os_log_impl(&dword_246AFF000, v17, OS_LOG_TYPE_DEFAULT, "_updateShowSeconds from: %@ to: %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend_setShowSeconds_(self->_timeFormatter, v20, v16, v21);
    objc_msgSend_setPaused_forReason_(self->_timeFormatter, v22, 0, @"foghornTimeViewTritiumOrLayoutChange");
  }
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    objc_msgSend__updateBlinking(self, a2, a3, v3);
  }
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v21 = a3;
  uint64_t v4 = objc_opt_class();
  objc_msgSend__hoursMinutesStringFromTimeFormatter_(v4, v5, (uint64_t)v21, v6);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(self->_lastHoursMinutesString, v8, (uint64_t)v7, v9))
  {
    if (objc_msgSend_showSeconds(v21, v10, v11, v12)) {
      objc_msgSend__updateSecondsForTimeFormatter_showSeconds_secondsAlpha_(self, v13, (uint64_t)v21, 1, 1.0);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend__tritiumOn(self, v10, v11, v12);
    if (self->_frozen) {
      int v16 = 1;
    }
    else {
      int v16 = v14;
    }
    unint64_t layoutStyle = self->_layoutStyle;
    double v18 = 1.0;
    double v19 = 0.0;
    if (layoutStyle) {
      double v19 = 1.0;
    }
    if (!v16) {
      double v18 = v19;
    }
    objc_msgSend__updateHoursMinutesSecondsForTimeFormatter_layoutStyle_tritiumOn_blinkAlpha_(self, v15, (uint64_t)v21, layoutStyle, v14, v18);
  }
  lastHoursMinutesString = self->_lastHoursMinutesString;
  self->_lastHoursMinutesString = v7;
}

- (void)timeFormatterReportingLiveTimeDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend_reportingLiveTime(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_logObject(NTKFoghornFaceBundle, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    if (v5) {
      uint64_t v10 = @"YES";
    }
    int v14 = 136315394;
    uint64_t v15 = "-[NTKFoghornTimeView timeFormatterReportingLiveTimeDidChange:]";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_246AFF000, v9, OS_LOG_TYPE_DEFAULT, "%s: reportingLiveTime = %@", (uint8_t *)&v14, 0x16u);
  }

  if (v5) {
    objc_msgSend_setNeedsDisplay(self, v11, v12, v13);
  }
}

- (void)_updateBlinkerAlphaForSecondFraction:(double)a3
{
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  double v5 = v4;
  objc_msgSend_begin(MEMORY[0x263F158F8], v6, v7, v8);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v9, 1, v10);
  *(float *)&double v11 = v5;
  objc_msgSend_setOpacity_(self->_minutesSeparatorLayer, v12, v13, v14, v11);
  uint64_t v18 = (void *)MEMORY[0x263F158F8];

  objc_msgSend_commit(v18, v15, v16, v17);
}

- (void)_startBlinking
{
  objc_msgSend__updateMinutesSeparatorLayerForTimeFormatter_(self, a2, (uint64_t)self->_timeFormatter, v2);
  CLKClockTimerDateForNow();
  objc_msgSend__updateBlinkerAlphaForSecondFraction_(self, v4, v5, v6, *(double *)&location[5]);

  objc_msgSend__updateBlinkWithAlpha_(self, v7, v8, v9, 0.0);
  objc_msgSend__setNeedsDisplayForElementMask_(self, v10, -1, v11);
  if (!self->_blinkTimerToken)
  {
    objc_initWeak(location, self);
    uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x263EFCF88], v12, v13, v14);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_246B13C90;
    v19[3] = &unk_2651F6B98;
    objc_copyWeak(&v20, location);
    objc_msgSend_startUpdatesWithUpdateFrequency_withHandler_identificationLog_(v15, v16, 2, (uint64_t)v19, &unk_26FB0CAC8);
    uint64_t v17 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
}

- (void)_stopBlinking
{
  if (self->_blinkTimerToken)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263EFCF88], a2, v2, v3);
    objc_msgSend_stopUpdatesForToken_(v5, v6, (uint64_t)self->_blinkTimerToken, v7);

    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = 0;
  }
  objc_msgSend_begin(MEMORY[0x263F158F8], a2, v2, v3);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v9, 1, v10);
  objc_msgSend_setOpacity_(self->_minutesSeparatorLayer, v11, v12, v13, 0.0);
  objc_msgSend_commit(MEMORY[0x263F158F8], v14, v15, v16);
  objc_msgSend__updateBlinkWithAlpha_(self, v17, v18, v19, 1.0);

  objc_msgSend__setNeedsDisplayForElementMask_(self, v20, -1, v21);
}

- (void)_updateBlinking
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  blinkTimerToken = self->_blinkTimerToken;
  if (self->_frozen || (objc_msgSend__tritiumOff(self, a2, v2, v3) & 1) == 0)
  {
    if (!blinkTimerToken) {
      return;
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = (self->_layoutStyle & 1) == 0;
    if ((blinkTimerToken != 0) == v6) {
      return;
    }
  }
  uint64_t v7 = objc_msgSend_logObject(NTKFoghornFaceBundle, a2, v2, v3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"notBlinking";
    if (blinkTimerToken) {
      uint64_t v9 = @"blinking";
    }
    else {
      uint64_t v9 = @"notBlinking";
    }
    if (v6) {
      uint64_t v8 = @"blinking";
    }
    int v16 = 138412546;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_246AFF000, v7, OS_LOG_TYPE_DEFAULT, "_updateBlinking from: %@ to: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend__stopBlinking(self, v10, v11, v12);
  if (v6) {
    objc_msgSend__startBlinking(self, v13, v14, v15);
  }
}

+ (BOOL)_stuffForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 layoutConstants:(id *)a6 renderRect:(CGRect *)a7 oversizedRect:(CGRect *)a8 showSeconds:(BOOL *)a9
{
  if (a3 > 5)
  {
    BOOL v13 = 0;
    BOOL result = 0;
    CGPoint v23 = (CGPoint)*MEMORY[0x263F001A8];
    CGSize v24 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    a7->origin = (CGPoint)*MEMORY[0x263F001A8];
    a7->size = v24;
    a8->origin = v23;
    a8->size = v24;
  }
  else
  {
    uint64_t v11 = 1 << a3;
    unint64_t v12 = a3 & 0xFFFFFFFFFFFFFFFELL;
    if (!a5) {
      unint64_t v12 = a3;
    }
    BOOL v13 = (v11 & 0x15) == 0 && !a5;
    if ((v11 & 0x15) != 0) {
      unint64_t v14 = a3;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v15 = (char *)a6 + 32 * v14;
    CGFloat x = *((double *)v15 + 85);
    CGFloat y = *((double *)v15 + 86);
    double width = *((double *)v15 + 87);
    CGFloat height = *((double *)v15 + 88);
    double v20 = a6->var4[v14];
    if (!a4)
    {
      CGFloat v21 = -CGRectGetMinX(*(CGRect *)(v15 + 680));
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.double width = width;
      v25.size.CGFloat height = height;
      CGRect v26 = CGRectInset(v25, v21, 0.0);
      CGFloat x = v26.origin.x;
      CGFloat y = v26.origin.y;
      double width = v26.size.width;
      CGFloat height = v26.size.height;
    }
    a7->origin.CGFloat x = x;
    a7->origin.CGFloat y = y;
    a7->size.double width = width;
    a7->size.CGFloat height = height;
    a8->origin.CGFloat x = x;
    a8->origin.CGFloat y = y;
    a8->size.double width = v20 * width;
    a8->size.CGFloat height = height;
    BOOL result = 1;
  }
  *a9 = v13;
  return result;
}

- (BOOL)_stuffForLayoutStyle:(unint64_t)a3 inset:(BOOL)a4 tritiumOn:(BOOL)a5 renderRect:(CGRect *)a6 oversizedRect:(CGRect *)a7 showSeconds:(BOOL *)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  memcpy(__dst, &self->_layoutConstants, sizeof(__dst));
  unint64_t v14 = objc_opt_class();
  memcpy(v17, __dst, sizeof(v17));
  return objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_layoutConstants_renderRect_oversizedRect_showSeconds_(v14, v15, a3, v12, v11, v17, a6, a7, a8);
}

- (CGRect)contentBounds
{
  long long v18 = 0u;
  long long v19 = 0u;
  memset(v17, 0, sizeof(v17));
  char v16 = 0;
  unint64_t layoutStyle = self->_layoutStyle;
  BOOL inset = self->_inset;
  uint64_t v7 = objc_msgSend__tritiumOn(self, a2, v2, v3);
  if (objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, v8, layoutStyle, inset, v7, &v18, v17, &v16))
  {
    double v13 = *((double *)&v18 + 1);
    double v12 = *(double *)&v18;
    double v15 = *((double *)&v19 + 1);
    double v14 = *(double *)&v19;
  }
  else
  {
    objc_msgSend_bounds(self, v9, v10, v11);
  }
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)_setLayoutFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 fromTritiumOn:(BOOL)a5 toTritiumOn:(BOOL)a6 fromInset:(BOOL)a7 toInset:(BOOL)a8 progress:(double)a9
{
  BOOL v9 = a7;
  BOOL v10 = a5;
  v83[0] = 0u;
  CGPoint v82 = (CGPoint)0;
  memset(v81, 0, sizeof(v81));
  unsigned __int8 v80 = 0;
  memset(&v79, 0, sizeof(v79));
  memset(v78, 0, sizeof(v78));
  unsigned __int8 v77 = 0;
  int v14 = a5 ^ a6;
  if (a3 != a4) {
    int v14 = 1;
  }
  if ((v14 | a7 ^ a8) == 1 && fabs(a9) >= 0.00000011920929)
  {
    BOOL v15 = a8;
    BOOL v16 = a6;
    double v18 = fabs(a9 + -1.0);
    if (a9 > 1.0 || v18 < 0.00000011920929)
    {
      objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, a2, a4, a8, a6, &v79, v78, &v77, v18);
      if (v77) {
        double v21 = 1.0;
      }
      else {
        double v21 = 0.0;
      }
      objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_layoutStyle_inset_tritiumOn_metricsRect_blinkAlpha_secondsAlpha_(self, v20, (uint64_t)self->_timeFormatter, v77, a4, v15, v16, *(_OWORD *)&v79.origin, *(_OWORD *)&v79.size, 1.0, v21);
    }
    else
    {
      objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, a2, a3, a7, a5, &v82, v81, &v80, v18);
      objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, v24, a4, v15, v16, &v79, v78, &v77);
      v84.origin = v82;
      v84.size = (CGSize)v83[0];
      CGRectGetMinX(v84);
      CGRectGetMinX(v79);
      CLKInterpolateBetweenFloatsClipped();
      double v26 = v25;
      v85.origin = v82;
      v85.size = (CGSize)v83[0];
      CGRectGetMinY(v85);
      CGRectGetMinY(v79);
      CLKInterpolateBetweenFloatsClipped();
      double v28 = v27;
      v86.origin = v82;
      v86.size = (CGSize)v83[0];
      CGRectGetMaxX(v86);
      CGRectGetMaxX(v79);
      CLKInterpolateBetweenFloatsClipped();
      double v30 = v29;
      v87.origin = v82;
      v87.size = (CGSize)v83[0];
      CGRectGetMaxY(v87);
      CGRectGetMaxY(v79);
      CLKInterpolateBetweenFloatsClipped();
      BOOL v34 = v80 != 0;
      if (v80 || !v77)
      {
        if (!v80 || v77)
        {
          double v35 = 1.0;
          if (!v80) {
            double v35 = 0.0;
          }
          double v71 = v35;
        }
        else
        {
          double v71 = 1.0 - a9;
          BOOL v34 = 1;
        }
      }
      else
      {
        BOOL v34 = 1;
        double v71 = a9;
      }
      double v75 = v28;
      double v76 = v26;
      double v73 = v30 - v26;
      double v74 = v33 - v28;
      uint64_t v36 = objc_msgSend__numberOfThinCharactersForTimeFormatter_(self, v31, (uint64_t)self->_timeFormatter, v32);
      objc_msgSend__scaleSizeForLayoutStyle_inset_tritiumOn_numberOfThinCharacters_(self, v37, a3, v9, v10, v36);
      uint64_t v39 = v38;
      uint64_t v41 = v40;
      objc_msgSend__scaleSizeForLayoutStyle_inset_tritiumOn_numberOfThinCharacters_(self, v42, a4, v15, v16, v36);
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      CLKInterpolateBetweenFloatsClipped();
      double v72 = v47;
      CLKInterpolateBetweenFloatsClipped();
      double v49 = v48;
      objc_msgSend__scaleWeightForLayoutStyle_inset_tritiumOn_(self, v50, a3, v9, v10);
      uint64_t v52 = v51;
      objc_msgSend__scaleWeightForLayoutStyle_inset_tritiumOn_(self, v53, a4, v15, v16);
      uint64_t v55 = v54;
      CLKInterpolateBetweenFloatsClipped();
      double v58 = v57;
      unint64_t animationSnapStyle = self->_animationSnapStyle;
      if (v80 == v77 || self->_animationStyle)
      {
        BYTE2(v70) = v16;
        BYTE1(v70) = v10;
        LOBYTE(v70) = v15;
        objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_transitoryFontSize_transitoryFontWeight_metricsRect_snapToPixel_fromLayoutStyle_toLayoutStyle_fromInset_toInset_fromTritiumOn_toTritiumOn_progress_secondsSize_secondsWeight_secondsRenderRect_blinkAlpha_secondsAlpha_(self, v56, (uint64_t)self->_timeFormatter, v34, animationSnapStyle == 2, a3, a4, v9, v72, v49, v57, v76, v75, v73, v74, a9, v70, *MEMORY[0x263F001B0], *(void *)(MEMORY[0x263F001B0] + 8),
          0,
          *MEMORY[0x263F001A8],
          *(void *)(MEMORY[0x263F001A8] + 8),
          *(void *)(MEMORY[0x263F001A8] + 16),
          *(void *)(MEMORY[0x263F001A8] + 24),
          0x3FF0000000000000,
          *(void *)&v71);
      }
      else
      {
        BOOL v60 = animationSnapStyle == 2;
        if (v80) {
          uint64_t v61 = v39;
        }
        else {
          uint64_t v61 = v44;
        }
        if (v80) {
          uint64_t v62 = v41;
        }
        else {
          uint64_t v62 = v46;
        }
        if (v80) {
          uint64_t v63 = v52;
        }
        else {
          uint64_t v63 = v55;
        }
        id v64 = &v79;
        p_CGFloat y = &v79.origin.y;
        if (v80) {
          p_CGFloat y = &v82.y;
        }
        uint64_t v66 = *(void *)p_y;
        p_size = &v79.size;
        if (v80) {
          p_size = (CGSize *)v83;
        }
        CGFloat width = p_size->width;
        p_CGFloat height = &v79.size.height;
        if (v80)
        {
          p_CGFloat height = (CGFloat *)v83 + 1;
          id v64 = (CGRect *)&v82;
        }
        BYTE2(v70) = v16;
        BYTE1(v70) = v10;
        LOBYTE(v70) = v15;
        objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_transitoryFontSize_transitoryFontWeight_metricsRect_snapToPixel_fromLayoutStyle_toLayoutStyle_fromInset_toInset_fromTritiumOn_toTritiumOn_progress_secondsSize_secondsWeight_secondsRenderRect_blinkAlpha_secondsAlpha_(self, v56, (uint64_t)self->_timeFormatter, 1, v60, a3, a4, v9, v72, v49, v58, v76, v75, v73, v74, a9, v70, v61, v62,
          v63,
          *(void *)&v64->origin.x,
          v66,
          *(void *)&width,
          *(void *)p_height,
          0x3FF0000000000000,
          *(void *)&v71);
      }
    }
  }
  else
  {
    objc_msgSend__stuffForLayoutStyle_inset_tritiumOn_renderRect_oversizedRect_showSeconds_(self, a2, a3, a7, a5, &v82, v81, &v80);
    double v23 = 1.0;
    if (!v80) {
      double v23 = 0.0;
    }
    objc_msgSend__layoutAndUpdateForTimeFormatter_showSeconds_layoutStyle_inset_tritiumOn_metricsRect_blinkAlpha_secondsAlpha_(self, v22, (uint64_t)self->_timeFormatter, v80, a3, v9, v10, v82, v83[0], 1.0, v23);
  }
}

- (void)setLayoutFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 progress:(double)a5
{
  uint64_t v9 = objc_msgSend__tritiumOn(self, a2, a3, a4);
  objc_msgSend__setLayoutFromStyle_toStyle_fromTritiumOn_toTritiumOn_fromInset_toInset_progress_(self, v10, a3, a4, v9, v9, self->_inset, self->_inset, a5);
  double v14 = fabs(a5 + -1.0);
  if (a5 > 1.0 || v14 < 0.00000011920929)
  {
    self->_unint64_t layoutStyle = a4;
    objc_msgSend__stopBlinking(self, v11, v12, v13, v14);
    objc_msgSend__updateBlinking(self, v16, v17, v18);
    MEMORY[0x270F9A6D0](self, sel__updateShowSeconds, v19, v20);
  }
}

- (void)setFromInset:(BOOL)a3 toInset:(BOOL)a4 progress:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = objc_msgSend__tritiumOn(self, a2, a3, a4);
  objc_msgSend__setLayoutFromStyle_toStyle_fromTritiumOn_toTritiumOn_fromInset_toInset_progress_(self, v10, self->_layoutStyle, self->_layoutStyle, v9, v9, v7, v6, a5);
  double v14 = fabs(a5 + -1.0);
  if (a5 > 1.0 || v14 < 0.00000011920929)
  {
    self->_BOOL inset = v6;
    objc_msgSend__stopBlinking(self, v11, v12, v13, v14);
    objc_msgSend__updateBlinking(self, v16, v17, v18);
  }
}

- (void)setLayoutStyle:(unint64_t)a3
{
  if (self->_layoutStyle != a3) {
    objc_msgSend_setLayoutFromStyle_toStyle_progress_(self, a2, a3, a3, 1.0);
  }
}

- (void)setInset:(BOOL)a3
{
  if (self->_inset != a3) {
    objc_msgSend_setFromInset_toInset_progress_(self, a2, a3, a3, 1.0);
  }
}

- (void)setMinutesColor:(id)a3
{
  id v14 = a3;
  if ((objc_msgSend_isEqual_(v14, v5, (uint64_t)self->_minutesColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minutesColor, a3);
    if (self->_frozen || !objc_msgSend__tritiumOff(self, v7, v8, v9))
    {
      objc_msgSend__updateColorsForElementMask_blinkAlpha_secondsAlpha_(self, v7, 7, v9, 1.0, 1.0);
    }
    else
    {
      unint64_t layoutStyle = self->_layoutStyle;
      double v11 = 1.0;
      if ((layoutStyle & 1) == 0) {
        double v11 = 0.0;
      }
      objc_msgSend__updateColorsForElementMask_blinkAlpha_secondsAlpha_(self, v7, 7, v9, v11, 1.0);
      if ((layoutStyle & 1) == 0) {
        objc_msgSend__updateMinutesSeparatorLayerForTimeFormatter_(self, v12, (uint64_t)self->_timeFormatter, v13);
      }
    }
  }
}

- (void)setSecondsColor:(id)a3
{
  id v9 = a3;
  if ((objc_msgSend_isEqual_(v9, v5, (uint64_t)self->_secondsColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondsColor, a3);
    objc_msgSend__updateColorsForElementMask_blinkAlpha_secondsAlpha_(self, v7, 8, v8, 1.0, 1.0);
  }
}

- (BOOL)_tritiumOn
{
  return 0;
}

- (BOOL)_tritiumOff
{
  return 0;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (unint64_t)animationStyle
{
  return self->_animationStyle;
}

- (void)setAnimationStyle:(unint64_t)a3
{
  self->_animationStyle = a3;
}

- (unint64_t)animationSnapStyle
{
  return self->_animationSnapStyle;
}

- (void)setAnimationSnapStyle:(unint64_t)a3
{
  self->_unint64_t animationSnapStyle = a3;
}

- (BOOL)isInset
{
  return self->_inset;
}

- (UIColor)minutesColor
{
  return self->_minutesColor;
}

- (UIColor)secondsColor
{
  return self->_secondsColor;
}

- (unint64_t)needsDisplayElementMask
{
  return self->_needsDisplayElementMask;
}

- (void)setNeedsDisplayElementMask:(unint64_t)a3
{
  self->_needsDisplayElementMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsColor, 0);
  objc_storeStrong((id *)&self->_minutesColor, 0);
  objc_storeStrong((id *)&self->_thinCharacterSet, 0);
  objc_storeStrong((id *)&self->_lastHoursMinutesString, 0);
  objc_storeStrong((id *)&self->_blinkTimerToken, 0);
  unint64_t v3 = 0;
  frameStates = self->_frameStates;
  do
  {

    v3 -= 56;
  }
  while (v3 != -224);
  objc_storeStrong((id *)&self->_secondsFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_minutesSeparatorLayer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_timeDisplayFontLoader, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end