@interface NTKParmesanFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needCustomSwatchImageForEditMode:(int64_t)a3;
- (BOOL)_validateEditOption:(id)a3 forMode:(int64_t)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (BOOL)bottomComplicationVisible;
- (BOOL)timeAndComplicationsDimmingIsValid;
- (BOOL)topComplicationVisible;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)_timeKeylineFrameForFrame:(CGRect)a3;
- (CLKTimeFormatter)swatchTimeFormatter;
- (NTKInterpolatedColorPalette)interpolatedStylePalette;
- (NTKInterpolatedColorPalette)interpolatedTimePalette;
- (NTKParmesanColorPalette)stylePalette;
- (NTKParmesanColorPalette)timePalette;
- (NTKParmesanFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKParmesanFaceViewComplicationFactory)parmesanComplicationFactory;
- (NTKParmesanGalleryController)controller;
- (NTKParmesanSwatchManager)swatchManager;
- (double)_contentViewAlphaForEditMode:(int64_t)a3;
- (double)breathingFraction;
- (double)rubberbandingFraction;
- (double)timeAndComplicationsDimming;
- (id)_bottomComplication;
- (id)_colorStyleKeylineViewWithEditOption:(id)a3 slot:(id)a4;
- (id)_compositionKeyForCurrentCompositionWithTimeOption:(unint64_t)a3 numerals:(unint64_t)a4;
- (id)_galleryViewWithComposition:(id)a3 timeOption:(unint64_t)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timePalette:(id)a7 contentEffect:(id)a8;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5;
- (id)_paletteForStyle:(unint64_t)a3;
- (id)_storedPlaceholderName;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6;
- (id)_swatchKeyForStyle:(unint64_t)a3 stylePalette:(id)a4 timePalette:(id)a5 typeface:(unint64_t)a6 numerals:(unint64_t)a7 time:(unint64_t)a8 compositionSwatchKey:(id)a9;
- (id)_swatchKeyForTypeface:(unint64_t)a3 numerals:(unint64_t)a4 palette:(id)a5;
- (id)_timeLabelWithTypeface:(unint64_t)a3 numerals:(unint64_t)a4 palette:(id)a5;
- (id)_topComplication;
- (id)createFaceColorPalette;
- (id)parmesanPalette;
- (unint64_t)_complicationVisibilityForEditMode:(int64_t)a3;
- (unint64_t)_currentComplicationVisibility;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)complicationVisibilityWithTopComplication:(id)a3 bottomComplication:(id)a4;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyContentEffectColorTransitionFraction:(double)a3;
- (void)_applyDataMode;
- (void)_applyFaceState;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTimeEffectStyle;
- (void)_applyTimeEffectStyleTransitionFraction:(double)a3;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_createStylePaletteIfNeeded;
- (void)_createTimePaletteIfNeeded;
- (void)_faceViewTapped:(id)a3;
- (void)_invalidateComplicationViews;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_reloadComplicationAppearance;
- (void)_setupGallery;
- (void)_setupSwatchManagerIfNeeded;
- (void)_setupTimeFormatterIfNeeded;
- (void)_setupTimeView;
- (void)_teardownGallery;
- (void)_teardownTimeView;
- (void)_transitionContentEffectFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 progress:(double)a5;
- (void)_unloadSnapshotContentViews;
- (void)_updateContentEffectWithStyle:(unint64_t)a3;
- (void)_updateContents;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setBottomComplicationVisible:(BOOL)a3;
- (void)setBreathingFraction:(double)a3;
- (void)setController:(id)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setInterpolatedStylePalette:(id)a3;
- (void)setInterpolatedTimePalette:(id)a3;
- (void)setParmesanComplicationFactory:(id)a3;
- (void)setRubberbandingFraction:(double)a3;
- (void)setStylePalette:(id)a3;
- (void)setSwatchManager:(id)a3;
- (void)setSwatchTimeFormatter:(id)a3;
- (void)setTimeAndComplicationsDimming:(double)a3;
- (void)setTimeAndComplicationsDimmingIsValid:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimePalette:(id)a3;
- (void)setTopComplicationVisible:(BOOL)a3;
@end

@implementation NTKParmesanFaceView

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  v10 = objc_msgSend_parmesanComplicationFactory(self, v7, v8, v9);
  objc_msgSend_configureComplicationView_forSlot_(v10, v11, (uint64_t)v44, (uint64_t)v6);

  if (objc_msgSend_isEqualToString_(v6, v12, *MEMORY[0x263F57850], v13))
  {
    if ((!objc_msgSend_isHidden(v44, v14, v15, v16)
       || (objc_msgSend_topComplicationVisible(self, v17, v18, v19) & 1) == 0)
      && ((objc_msgSend_isHidden(v44, v17, v18, v19) & 1) != 0
       || (objc_msgSend_topComplicationVisible(self, v20, v21, v22) & 1) != 0))
    {
      goto LABEL_15;
    }
    int isHidden = objc_msgSend_isHidden(v44, v17, v18, v19);
    objc_msgSend_setTopComplicationVisible_(self, v24, isHidden ^ 1u, v25);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v6, v14, *MEMORY[0x263F57820], v16)
      || (!objc_msgSend_isHidden(v44, v29, v30, v31)
       || (objc_msgSend_bottomComplicationVisible(self, v32, v33, v34) & 1) == 0)
      && ((objc_msgSend_isHidden(v44, v32, v33, v34) & 1) != 0
       || (objc_msgSend_bottomComplicationVisible(self, v35, v36, v37) & 1) != 0))
    {
      goto LABEL_15;
    }
    int v38 = objc_msgSend_isHidden(v44, v32, v33, v34);
    objc_msgSend_setBottomComplicationVisible_(self, v39, v38 ^ 1u, v40);
  }
  if ((objc_msgSend_editing(self, v26, v27, v28) & 1) == 0) {
    objc_msgSend__reloadComplicationAppearance(self, v41, v42, v43);
  }
LABEL_15:
}

- (void)_invalidateComplicationViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v4 reconfigureComplicationViews];
  v3.receiver = self;
  v3.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v3 invalidateComplicationLayout];
}

- (void)_reloadComplicationAppearance
{
  uint64_t v5 = objc_msgSend__currentComplicationVisibility(self, a2, v2, v3);
  objc_msgSend_controller(self, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComplicationVisibility_(v11, v9, v5, v10);
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v37 _applyTransitionFraction:a4 fromComplication:v10 toComplication:v11 slot:a3];
  if (objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x263F57850], v13))
  {
    id v17 = v10;
  }
  else
  {
    objc_msgSend__topComplication(self, v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v17;
  if (objc_msgSend_isEqualToString_(v11, v18, *MEMORY[0x263F57820], v19))
  {
    id v24 = v10;
  }
  else
  {
    objc_msgSend__bottomComplication(self, v21, v22, v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v28 = v24;
  if ((objc_msgSend_editing(self, v25, v26, v27) & 1) == 0)
  {
    uint64_t v30 = objc_msgSend_complicationVisibilityWithTopComplication_bottomComplication_(self, v29, (uint64_t)v20, (uint64_t)v28);
    uint64_t v34 = objc_msgSend_controller(self, v31, v32, v33);
    objc_msgSend_setComplicationVisibility_(v34, v35, v30, v36);
  }
}

- (unint64_t)complicationVisibilityWithTopComplication:(id)a3 bottomComplication:(id)a4
{
  id v5 = a4;
  int isVisible = objc_msgSend_isVisible(a3, v6, v7, v8);
  unsigned int v13 = objc_msgSend_isVisible(v5, v10, v11, v12);

  if (isVisible && (v13 & 1) != 0) {
    return 3;
  }
  if ((isVisible ^ 1 | v13) == 1) {
    return (isVisible ^ 1) & v13;
  }
  return 2;
}

- (unint64_t)_currentComplicationVisibility
{
  id v5 = objc_msgSend__topComplication(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__bottomComplication(self, v6, v7, v8);
  unint64_t v11 = objc_msgSend_complicationVisibilityWithTopComplication_bottomComplication_(self, v10, (uint64_t)v5, (uint64_t)v9);

  return v11;
}

- (id)_topComplication
{
  objc_super v4 = objc_msgSend_delegate(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_faceViewComplicationForSlot_(v4, v5, *MEMORY[0x263F57850], v6);

  return v7;
}

- (id)_bottomComplication
{
  objc_super v4 = objc_msgSend_delegate(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_faceViewComplicationForSlot_(v4, v5, *MEMORY[0x263F57820], v6);

  return v7;
}

- (void)_prepareForEditing
{
  v16.receiver = self;
  v16.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v16 _prepareForEditing];
  uint64_t v6 = objc_msgSend_controller(self, v3, v4, v5);
  objc_msgSend_prepareForEditing(v6, v7, v8, v9);

  unsigned int v13 = objc_msgSend_delegate(self, v10, v11, v12);
  objc_msgSend_faceViewWantsCustomKeylineFramesReloadedForEditMode_(v13, v14, 10, v15);
}

- (void)_cleanupAfterEditing
{
  v10.receiver = self;
  v10.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v10 _cleanupAfterEditing];
  uint64_t v6 = objc_msgSend_controller(self, v3, v4, v5);
  objc_msgSend_cleanupAfterEditing(v6, v7, v8, v9);
}

- (void)_configureForEditMode:(int64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NTKParmesanFaceView;
  -[NTKParmesanFaceView _configureForEditMode:](&v23, sel__configureForEditMode_);
  uint64_t v8 = objc_msgSend_contentView(self, v5, v6, v7);
  objc_msgSend__contentViewAlphaForEditMode_(self, v9, a3, v10);
  objc_msgSend_setAlpha_(v8, v11, v12, v13);

  uint64_t v16 = objc_msgSend__complicationVisibilityForEditMode_(self, v14, a3, v15);
  v20 = objc_msgSend_controller(self, v17, v18, v19);
  objc_msgSend_setComplicationVisibility_(v20, v21, v16, v22);
}

- (unint64_t)_complicationVisibilityForEditMode:(int64_t)a3
{
  if (a3 == 1) {
    return 3;
  }
  else {
    return objc_msgSend__currentComplicationVisibility(self, a2, a3, v3);
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v39.receiver = self;
  v39.super_class = (Class)NTKParmesanFaceView;
  -[NTKParmesanFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v39, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  uint64_t v12 = objc_msgSend_contentView(self, v9, v10, v11);
  objc_msgSend__contentViewAlphaForEditMode_(self, v13, a4, v14);
  objc_msgSend__contentViewAlphaForEditMode_(self, v15, a5, v16);
  sub_246C2C018();
  objc_msgSend_setAlpha_(v12, v17, v18, v19);

  uint64_t v22 = objc_msgSend__complicationVisibilityForEditMode_(self, v20, a4, v21);
  uint64_t v25 = objc_msgSend__complicationVisibilityForEditMode_(self, v23, a5, v24);
  v29 = objc_msgSend_controller(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_galleryView(v29, v30, v31, v32);
  objc_super v37 = objc_msgSend_timeView(v33, v34, v35, v36);
  objc_msgSend_transitionFromComplicationVisibility_toComplicationVisibility_progress_(v37, v38, v22, v25, a3);
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v11 _cleanupAfterTransitionComplicationSlot:a3 selectedComplication:a4];
  uint64_t v8 = objc_msgSend_delegate(self, v5, v6, v7);
  objc_msgSend_faceViewWantsCustomKeylineFramesReloadedForEditMode_(v8, v9, 10, v10);
}

- (double)_contentViewAlphaForEditMode:(int64_t)a3
{
  double result = *MEMORY[0x263F57868];
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v58 = a3;
  id v8 = a5;
  uint64_t v12 = v8;
  switch(a4)
  {
    case 10:
      if (objc_msgSend_isEqualToString_(v8, v9, @"time-color", v11))
      {
        objc_msgSend__applyTimeEffectStyle(self, v13, v14, v15);
      }
      else if (objc_msgSend_isEqualToString_(v12, v13, @"style-color", v15))
      {
        v51 = objc_msgSend_optionForCustomEditMode_slot_(self, v9, 15, 0);
        uint64_t v55 = objc_msgSend_style(v51, v52, v53, v54);

        objc_msgSend__updateContentEffectWithStyle_(self, v56, v55, v57);
      }
      break;
    case 12:
      uint64_t v29 = objc_msgSend_content(v58, v9, v10, v11);
      v20 = objc_msgSend_controller(self, v30, v31, v32);
      objc_msgSend_setContentOption_(v20, v33, v29, v34);
      goto LABEL_7;
    case 13:
      uint64_t v16 = objc_msgSend_typeface(v58, v9, v10, v11);
      v20 = objc_msgSend_controller(self, v17, v18, v19);
      objc_msgSend_setTypeface_(v20, v21, v16, v22);
      goto LABEL_7;
    case 14:
      uint64_t v35 = objc_msgSend_time(v58, v9, v10, v11);
      objc_super v39 = objc_msgSend_controller(self, v36, v37, v38);
      objc_msgSend_setTimeOption_(v39, v40, v35, v41);

      v45 = objc_msgSend_delegate(self, v42, v43, v44);
      objc_msgSend_faceViewWantsCustomKeylineFramesReloadedForEditMode_(v45, v46, 10, v47);

      break;
    case 15:
      uint64_t v48 = objc_msgSend_style(v58, v9, v10, v11);
      objc_msgSend__updateContentEffectWithStyle_(self, v49, v48, v50);
      break;
    case 19:
      uint64_t v23 = objc_msgSend_numeralOption(v58, v9, v10, v11);
      v20 = objc_msgSend_controller(self, v24, v25, v26);
      objc_msgSend_setNumerals_(v20, v27, v23, v28);
LABEL_7:

      break;
    default:
      break;
  }
  objc_msgSend__reloadComplicationAppearance(self, v9, v10, v11);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v116 = a4;
  id v12 = a5;
  id v13 = a7;
  id v17 = v13;
  switch(a6)
  {
    case 10:
      if (objc_msgSend_isEqualToString_(v13, v14, @"time-color", v16))
      {
        v20 = objc_opt_class();
        uint64_t v23 = objc_msgSend_pigmentFromOption_(v20, v21, (uint64_t)v116, v22);
        uint64_t v27 = objc_msgSend_interpolatedTimePalette(self, v24, v25, v26);
        uint64_t v31 = objc_msgSend_fromPalette(v27, v28, v29, v30);
        objc_msgSend_setPigmentEditOption_(v31, v32, (uint64_t)v23, v33);

        uint64_t v34 = objc_opt_class();
        uint64_t v37 = objc_msgSend_pigmentFromOption_(v34, v35, (uint64_t)v12, v36);
        uint64_t v41 = objc_msgSend_interpolatedTimePalette(self, v38, v39, v40);
        v45 = objc_msgSend_toPalette(v41, v42, v43, v44);
        objc_msgSend_setPigmentEditOption_(v45, v46, (uint64_t)v37, v47);

        objc_msgSend__applyTimeEffectStyleTransitionFraction_(self, v48, v49, v50, a3);
      }
      else if (objc_msgSend_isEqualToString_(v17, v18, @"style-color", v19))
      {
        v85 = objc_opt_class();
        v88 = objc_msgSend_pigmentFromOption_(v85, v86, (uint64_t)v116, v87);
        v92 = objc_msgSend_interpolatedStylePalette(self, v89, v90, v91);
        v96 = objc_msgSend_fromPalette(v92, v93, v94, v95);
        objc_msgSend_setPigmentEditOption_(v96, v97, (uint64_t)v88, v98);

        v99 = objc_opt_class();
        v102 = objc_msgSend_pigmentFromOption_(v99, v100, (uint64_t)v12, v101);
        v106 = objc_msgSend_interpolatedStylePalette(self, v103, v104, v105);
        v110 = objc_msgSend_toPalette(v106, v107, v108, v109);
        objc_msgSend_setPigmentEditOption_(v110, v111, (uint64_t)v102, v112);

        objc_msgSend__applyContentEffectColorTransitionFraction_(self, v113, v114, v115, a3);
      }
      break;
    case 13:
      uint64_t v61 = objc_msgSend_typeface(v116, v14, v15, v16);
      uint64_t v65 = objc_msgSend_typeface(v12, v62, v63, v64);
      v59 = objc_msgSend_controller(self, v66, v67, v68);
      objc_msgSend_transitionFromTypeface_toTypeface_progress_(v59, v69, v61, v65, a3);
      goto LABEL_8;
    case 14:
      uint64_t v51 = objc_msgSend_time(v116, v14, v15, v16);
      uint64_t v55 = objc_msgSend_time(v12, v52, v53, v54);
      v59 = objc_msgSend_controller(self, v56, v57, v58);
      objc_msgSend_transitionFromTimeOption_toTimeOption_progress_(v59, v60, v51, v55, a3);
      goto LABEL_8;
    case 15:
      uint64_t v70 = objc_msgSend_style(v116, v14, v15, v16);
      uint64_t v74 = objc_msgSend_style(v12, v71, v72, v73);
      objc_msgSend__transitionContentEffectFromStyle_toStyle_progress_(self, v75, v70, v74, a3);
      break;
    case 19:
      uint64_t v76 = objc_msgSend_numeralOption(v116, v14, v15, v16);
      uint64_t v80 = objc_msgSend_numeralOption(v12, v77, v78, v79);
      v59 = objc_msgSend_controller(self, v81, v82, v83);
      objc_msgSend_transitionFromNumerals_toNumerals_progress_(v59, v84, v76, v80, a3);
LABEL_8:

      break;
    default:
      break;
  }
}

- (CGRect)_timeKeylineFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = objc_msgSend_controller(self, a2, v3, v4);
  id v13 = objc_msgSend_galleryView(v9, v10, v11, v12);
  id v17 = objc_msgSend_timeView(v13, v14, v15, v16);
  objc_msgSend_normalizedKeylineRect(v17, v18, v19, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = x + v22 * width;
  double v30 = y + v24 * height;
  double v31 = width * v26;
  double v32 = height * v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v9 = v6;
  if (a3 != 10) {
    goto LABEL_7;
  }
  if (!objc_msgSend_isEqualToString_(v6, v7, @"time-color", v8))
  {
    if (objc_msgSend_isEqualToString_(v9, v10, @"style-color", v11))
    {
      NTKFaceEditingFullscreenKeylineMargin();
      double v26 = v25;
      NTKKeylineWidth();
      double v28 = -v27;
      objc_msgSend_bounds(self, v29, v30, v31);
      double v24 = -(v28 + v26 * 2.0);
      goto LABEL_6;
    }
LABEL_7:
    v40.receiver = self;
    v40.super_class = (Class)NTKParmesanFaceView;
    [(NTKParmesanFaceView *)&v40 _relativeKeylineFrameForCustomEditMode:a3 slot:v9];
    goto LABEL_8;
  }
  NTKFaceEditingFullscreenKeylineMargin();
  double v13 = v12;
  objc_msgSend_bounds(self, v14, v15, v16);
  objc_msgSend__timeKeylineFrameForFrame_(self, v17, v18, v19);
  double v24 = v13 * -0.5;
LABEL_6:
  CGRect v41 = CGRectInset(*(CGRect *)&v20, v24, v24);
LABEL_8:
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;

  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
  return result;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5
{
  id v8 = a4;
  id v11 = a5;
  if (a3 != 10)
  {
LABEL_6:
    v20.receiver = self;
    v20.super_class = (Class)NTKParmesanFaceView;
    uint64_t v14 = [(NTKParmesanFaceView *)&v20 _keylineViewForCustomEditMode:a3 slot:v8 selectedSlot:v11];
    goto LABEL_7;
  }
  if (!objc_msgSend_isEqualToString_(v8, v9, @"time-color", v10))
  {
    if (objc_msgSend_isEqualToString_(v8, v12, @"style-color", v13))
    {
      uint64_t v16 = objc_msgSend_optionForCustomEditMode_slot_(self, v15, 10, (uint64_t)v11);
      uint64_t v18 = objc_msgSend__colorStyleKeylineViewWithEditOption_slot_(self, v17, (uint64_t)v16, (uint64_t)v8);

      goto LABEL_8;
    }
    goto LABEL_6;
  }
  NTKKeylineCornerRadiusLarge();
  uint64_t v14 = NTKKeylineViewWithContinuousCurveCornerRadius();
LABEL_7:
  uint64_t v18 = (void *)v14;
LABEL_8:

  return v18;
}

- (id)_colorStyleKeylineViewWithEditOption:(id)a3 slot:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v33 _faceViewFrameForEditMode:10 option:a3 slot:a4];
  objc_msgSend__timeKeylineFrameForFrame_(self, v5, v6, v7, 0.0, 0.0);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = (void *)MEMORY[0x263F824C0];
  NTKKeylineCornerRadiusLarge();
  double v21 = objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(v16, v17, v18, v19, v9, v11, v13, v15, v20);
  double v22 = NTKKeylineViewWithFullScreenContinuousCurves();
  double v23 = (void *)MEMORY[0x263F57A10];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_246B600B4;
  v31[3] = &unk_2651FBBB8;
  id v32 = v21;
  id v24 = v21;
  double v27 = objc_msgSend_touchableWithHandler_(v23, v25, (uint64_t)v31, v26);
  objc_msgSend_setTouchable_(v22, v28, (uint64_t)v27, v29);

  return v22;
}

- (void)_createTimePaletteIfNeeded
{
  uint64_t v5 = objc_msgSend_timePalette(self, a2, v2, v3);

  if (!v5)
  {
    double v9 = objc_msgSend_parmesanPalette(self, v6, v7, v8);
    double v13 = objc_msgSend_copy(v9, v10, v11, v12);
    objc_msgSend_setTimePalette_(self, v14, (uint64_t)v13, v15);
  }
  uint64_t v16 = objc_msgSend_interpolatedTimePalette(self, v6, v7, v8);

  if (!v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F57A08]);
    objc_msgSend_timePalette(self, v18, v19, v20);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    double v23 = objc_msgSend_initWithColorPalette_(v17, v21, (uint64_t)v26, v22);
    objc_msgSend_setInterpolatedTimePalette_(self, v24, (uint64_t)v23, v25);
  }
}

- (void)_applyTimeEffectStyle
{
  objc_msgSend__createTimePaletteIfNeeded(self, a2, v2, v3);
  objc_msgSend_optionForCustomEditMode_slot_(self, v5, 10, @"time-color");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    double v9 = objc_msgSend_timePalette(self, v6, v7, v8);
    objc_msgSend_setPigmentEditOption_(v9, v10, (uint64_t)v19, v11);
  }
  uint64_t v12 = objc_msgSend_controller(self, v6, v7, v8);
  uint64_t v16 = objc_msgSend_timePalette(self, v13, v14, v15);
  objc_msgSend_updateTimeEffectStyleWithPalette_(v12, v17, (uint64_t)v16, v18);
}

- (void)_applyTimeEffectStyleTransitionFraction:(double)a3
{
  objc_msgSend_controller(self, a2, v3, v4);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = objc_msgSend_interpolatedTimePalette(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_fromPalette(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_interpolatedTimePalette(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_toPalette(v18, v19, v20, v21);
  objc_msgSend_transitionTimeEffectFromPalette_toPalette_progress_(v24, v23, (uint64_t)v14, (uint64_t)v22, a3);
}

- (void)_createStylePaletteIfNeeded
{
  uint64_t v5 = objc_msgSend_stylePalette(self, a2, v2, v3);

  if (!v5)
  {
    uint64_t v9 = objc_msgSend_parmesanPalette(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);
    objc_msgSend_setStylePalette_(self, v14, (uint64_t)v13, v15);
  }
  uint64_t v16 = objc_msgSend_interpolatedStylePalette(self, v6, v7, v8);

  if (!v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F57A08]);
    objc_msgSend_stylePalette(self, v18, v19, v20);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    double v23 = objc_msgSend_initWithColorPalette_(v17, v21, (uint64_t)v26, v22);
    objc_msgSend_setInterpolatedStylePalette_(self, v24, (uint64_t)v23, v25);
  }
}

- (void)_updateContentEffectWithStyle:(unint64_t)a3
{
  objc_msgSend__createStylePaletteIfNeeded(self, a2, a3, v3);
  objc_msgSend_optionForCustomEditMode_slot_(self, v6, 10, @"style-color");
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    double v10 = objc_msgSend_stylePalette(self, v7, v8, v9);
    objc_msgSend_setPigmentEditOption_(v10, v11, (uint64_t)v26, v12);
  }
  uint64_t v13 = [NTKParmesanGalleryContentEffect alloc];
  id v17 = objc_msgSend_stylePalette(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_initWithStyleOption_palette_(v13, v18, a3, (uint64_t)v17);
  double v23 = objc_msgSend_controller(self, v20, v21, v22);
  objc_msgSend_setContentEffect_(v23, v24, (uint64_t)v19, v25);
}

- (void)_applyContentEffectColorTransitionFraction:(double)a3
{
  uint64_t v5 = objc_msgSend_optionForCustomEditMode_slot_(self, a2, 15, 0);
  uint64_t v9 = objc_msgSend_style(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_interpolatedStylePalette(self, v10, v11, v12);
  objc_msgSend_fromPalette(v13, v14, v15, v16);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  id v17 = [NTKParmesanGalleryContentEffect alloc];
  uint64_t v19 = objc_msgSend_initWithStyleOption_palette_(v17, v18, v9, (uint64_t)v36);
  double v23 = objc_msgSend_interpolatedStylePalette(self, v20, v21, v22);
  double v27 = objc_msgSend_toPalette(v23, v24, v25, v26);

  double v28 = [NTKParmesanGalleryContentEffect alloc];
  uint64_t v30 = objc_msgSend_initWithStyleOption_palette_(v28, v29, v9, (uint64_t)v27);
  uint64_t v34 = objc_msgSend_controller(self, v31, v32, v33);
  objc_msgSend_transitionContentEffectFromEffect_toEffect_progress_(v34, v35, (uint64_t)v19, (uint64_t)v30, a3);
}

- (void)_transitionContentEffectFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 progress:(double)a5
{
  objc_msgSend__paletteForStyle_(self, a2, a3, a4);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [NTKParmesanGalleryContentEffect alloc];
  uint64_t v11 = objc_msgSend_initWithStyleOption_palette_(v9, v10, a3, (uint64_t)v23);
  uint64_t v14 = objc_msgSend__paletteForStyle_(self, v12, a4, v13);
  uint64_t v15 = [NTKParmesanGalleryContentEffect alloc];
  id v17 = objc_msgSend_initWithStyleOption_palette_(v15, v16, a4, (uint64_t)v14);
  uint64_t v21 = objc_msgSend_controller(self, v18, v19, v20);
  objc_msgSend_transitionContentEffectFromEffect_toEffect_progress_(v21, v22, (uint64_t)v11, (uint64_t)v17, a5);
}

- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, @"style-color", v6)
    && (objc_msgSend_optionForCustomEditMode_slot_(self, v7, 15, 0),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = objc_msgSend_style(v8, v9, v10, v11),
        v8,
        (v12 & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    BOOL v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKParmesanFaceView;
    BOOL v13 = [(NTKParmesanFaceView *)&v15 _allowsEditingSliderEditableColorsForSlot:v4];
  }

  return v13;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 13 || a3 == 10;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v9 = v6;
  if (a3 != 10 || !objc_msgSend_isEqualToString_(v6, v7, @"time-color", v8)) {
    goto LABEL_6;
  }
  BOOL v13 = objc_msgSend_controller(self, v10, v11, v12);
  id v17 = objc_msgSend_galleryView(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_timeView(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_layout(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_textAlignment(v25, v26, v27, v28);

  if (v29 == 2)
  {
    unint64_t v30 = 392;
    goto LABEL_7;
  }
  if (!v29)
  {
    unint64_t v30 = 416;
  }
  else
  {
LABEL_6:
    v32.receiver = self;
    v32.super_class = (Class)NTKParmesanFaceView;
    unint64_t v30 = [(NTKParmesanFaceView *)&v32 _keylineLabelAlignmentForCustomEditMode:a3 slot:v9];
  }
LABEL_7:

  return v30;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKParmesanFaceView;
  -[NTKParmesanFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v14, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  if ((unint64_t)a4 > 0xF || ((1 << a4) & 0x8401) == 0)
  {
    objc_msgSend_setBreathingFraction_(self, v8, v9, v10, a3);
    objc_msgSend__applyBreathingAndRubberbanding(self, v11, v12, v13);
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKParmesanFaceView;
  -[NTKParmesanFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v17, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if ((unint64_t)a4 > 0xF || ((1 << a4) & 0x8401) == 0)
  {
    NTKAlphaForRubberBandingFraction();
    objc_msgSend_setAlpha_(self, v8, v9, v10);
    objc_msgSend_setRubberbandingFraction_(self, v11, v12, v13, a3);
    objc_msgSend__applyBreathingAndRubberbanding(self, v14, v15, v16);
  }
}

- (void)_applyBreathingAndRubberbanding
{
  objc_msgSend_breathingFraction(self, a2, v2, v3);
  NTKLargeElementScaleForBreathingFraction();
  double v6 = v5;
  objc_msgSend_rubberbandingFraction(self, v7, v8, v9);
  NTKScaleForRubberBandingFraction();
  CGAffineTransformMakeScale(&v14, v6 * v10, v6 * v10);
  CGAffineTransform v13 = v14;
  objc_msgSend_setTransform_(self, v11, (uint64_t)&v13, v12);
}

- (NTKParmesanFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKParmesanFaceView;
  id v9 = [(NTKParmesanFaceView *)&v17 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    double v10 = [NTKParmesanFaceViewComplicationFactory alloc];
    uint64_t v12 = objc_msgSend_initWithFaceView_device_(v10, v11, (uint64_t)v9, (uint64_t)v8);
    CGAffineTransform v13 = (void *)*((void *)v9 + 110);
    *((void *)v9 + 110) = v12;

    objc_msgSend_setComplicationFactory_(v9, v14, *((void *)v9 + 110), v15);
  }

  return (NTKParmesanFaceView *)v9;
}

- (void)_loadSnapshotContentViews
{
  v25.receiver = self;
  v25.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v25 _loadSnapshotContentViews];
  double v6 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v3, v4, v5);
  objc_msgSend_setBackgroundColor_(self, v7, (uint64_t)v6, v8);

  objc_msgSend__setupGallery(self, v9, v10, v11);
  objc_msgSend__setupTimeView(self, v12, v13, v14);
  objc_msgSend__setupTapControl(self, v15, v16, v17);
  objc_msgSend__updateContents(self, v18, v19, v20);
  v24.receiver = self;
  v24.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v24 invalidateComplicationLayout];
  objc_msgSend_layoutIfNeeded(self, v21, v22, v23);
}

- (void)_unloadSnapshotContentViews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v12 _unloadSnapshotContentViews];
  objc_msgSend__teardownTapControl(self, v3, v4, v5);
  objc_msgSend__teardownTimeView(self, v6, v7, v8);
  objc_msgSend__teardownGallery(self, v9, v10, v11);
}

- (void)_setupGallery
{
  objc_msgSend_currentFaceState(self, a2, v2, v3);
  uint64_t v5 = (_TtC30NTKParmesanFaceBundleCompanion12NTKFaceState *)objc_claimAutoreleasedReturnValue();
  previousFaceState = self->_previousFaceState;
  self->_previousFaceState = v5;

  uint64_t v7 = [NTKParmesanGalleryContentEffect alloc];
  uint64_t v11 = objc_msgSend_parmesanPalette(self, v8, v9, v10);
  id v84 = (id)objc_msgSend_initWithStyleOption_palette_(v7, v12, 0, (uint64_t)v11);

  uint64_t v13 = [NTKParmesanGalleryController alloc];
  objc_msgSend_bounds(self, v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v28 = objc_msgSend_device(self, v25, v26, v27);
  unint64_t v30 = (NTKParmesanGalleryController *)objc_msgSend_initWithFrame_device_faceState_contentEffect_(v13, v29, (uint64_t)v28, (uint64_t)self->_previousFaceState, v84, v18, v20, v22, v24);
  controller = self->_controller;
  self->_controller = v30;

  double v38 = objc_msgSend__storedPlaceholderName(self, v32, v33, v34);
  if (v38) {
    objc_msgSend_setPlaceholderName_(self->_controller, v35, (uint64_t)v38, v37);
  }
  double v39 = objc_msgSend_contentView(self, v35, v36, v37);
  uint64_t v43 = objc_msgSend_galleryView(self->_controller, v40, v41, v42);
  objc_msgSend_addSubview_(v39, v44, (uint64_t)v43, v45);

  parmesanComplicationFactorCGFloat y = self->_parmesanComplicationFactory;
  uint64_t v50 = objc_msgSend_galleryView(self->_controller, v47, v48, v49);
  objc_msgSend_setTransitionDelegate_(v50, v51, (uint64_t)parmesanComplicationFactory, v52);

  v56 = objc_msgSend_complicationContainerView(self, v53, v54, v55);
  objc_msgSend_removeFromSuperview(v56, v57, v58, v59);
  uint64_t v63 = objc_msgSend_galleryView(self->_controller, v60, v61, v62);
  uint64_t v67 = objc_msgSend_complicationVibrantEffectView(v63, v64, v65, v66);
  objc_msgSend_addMaskingSubview_(v67, v68, (uint64_t)v56, v69);

  uint64_t v73 = objc_msgSend_rootContainerView(self, v70, v71, v72);
  v77 = objc_msgSend_galleryView(self->_controller, v74, v75, v76);
  v81 = objc_msgSend_complicationVibrantEffectView(v77, v78, v79, v80);
  objc_msgSend_addSubview_(v73, v82, (uint64_t)v81, v83);
}

- (void)_teardownGallery
{
  uint64_t v5 = objc_msgSend_galleryView(self->_controller, a2, v2, v3);
  objc_msgSend_removeFromSuperview(v5, v6, v7, v8);

  controller = self->_controller;
  self->_controller = 0;
}

- (void)_setupTimeView
{
  uint64_t v5 = objc_msgSend_galleryView(self->_controller, a2, v2, v3);
  objc_msgSend_timeView(v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTimeView_(self, v9, (uint64_t)v11, v10);
}

- (void)_teardownTimeView
{
  objc_msgSend_setTimeView_(self, a2, 0, v2);
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)_applyShowContentForUnadornedSnapshot
{
  v13.receiver = self;
  v13.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v13 _applyShowContentForUnadornedSnapshot];
  double v6 = objc_msgSend_timeView(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_showContentForUnadornedSnapshot(self, v7, v8, v9);
  objc_msgSend_setHidden_(v6, v11, v10, v12);
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v2 layoutSubviews];
}

- (id)_storedPlaceholderName
{
  uint64_t v5 = objc_msgSend_placeholderCustomDataKey(NTKParmesanGalleryPlaceholderDataSource, a2, v2, v3);
  uint64_t v9 = objc_msgSend_delegate(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_faceViewDidRequestCustomDataForKey_(v9, v10, (uint64_t)v5, v11);

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v21 _updateForResourceDirectoryChange:v4];
  uint64_t v8 = objc_msgSend_resourceDirectory(self, v5, v6, v7);
  char v9 = NTKEqualStrings();

  if ((v9 & 1) == 0)
  {
    id v13 = objc_msgSend_logObject(NTKParmesanFaceBundle, v10, v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = objc_msgSend_resourceDirectory(self, v14, v15, v16);
      *(_DWORD *)buf = 138412546;
      id v23 = v4;
      __int16 v24 = 2112;
      objc_super v25 = v17;
      _os_log_impl(&dword_246B51000, v13, OS_LOG_TYPE_DEFAULT, "_updateForResourceDirectoryChange: change resource directory from %@ to %@", buf, 0x16u);
    }
    objc_msgSend__updateContents(self, v18, v19, v20);
  }
}

- (void)_updateContents
{
  controller = self->_controller;
  if (controller)
  {
    uint64_t v6 = objc_msgSend_resourceDirectory(self, a2, v2, v3);
    objc_msgSend_setResourceDirectory_(controller, v7, (uint64_t)v6, v8);

    uint64_t v11 = self->_controller;
    MEMORY[0x270F9A6D0](v11, sel_loadCurrentComposition, v9, v10);
  }
}

- (void)setDataMode:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v3 setDataMode:a3];
}

- (void)_applyDataMode
{
  v6.receiver = self;
  v6.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v6 _applyDataMode];
  objc_msgSend__applyFaceState(self, v3, v4, v5);
}

- (void)_applyFaceState
{
  objc_msgSend_currentFaceState(self, a2, v2, v3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(self->_previousFaceState, v5, (uint64_t)obj, v6) & 1) == 0)
  {
    objc_msgSend_setFaceState_(self->_controller, v7, (uint64_t)obj, v8);
    objc_msgSend_dataMode(self, v9, v10, v11);
    objc_storeStrong((id *)&self->_previousFaceState, obj);
  }
}

- (void)setTimeOffset:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v3 setTimeOffset:a3];
}

- (void)setFrozen:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParmesanFaceView;
  [(NTKParmesanFaceView *)&v3 setFrozen:a3];
}

- (void)_faceViewTapped:(id)a3
{
}

- (NTKParmesanGalleryController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (NTKParmesanFaceViewComplicationFactory)parmesanComplicationFactory
{
  return self->_parmesanComplicationFactory;
}

- (void)setParmesanComplicationFactory:(id)a3
{
}

- (double)breathingFraction
{
  return self->_breathingFraction;
}

- (void)setBreathingFraction:(double)a3
{
  self->_breathingFraction = a3;
}

- (double)rubberbandingFraction
{
  return self->_rubberbandingFraction;
}

- (void)setRubberbandingFraction:(double)a3
{
  self->_rubberbandingFraction = a3;
}

- (NTKParmesanSwatchManager)swatchManager
{
  return self->_swatchManager;
}

- (void)setSwatchManager:(id)a3
{
}

- (CLKTimeFormatter)swatchTimeFormatter
{
  return self->_swatchTimeFormatter;
}

- (void)setSwatchTimeFormatter:(id)a3
{
}

- (NTKParmesanColorPalette)timePalette
{
  return self->_timePalette;
}

- (void)setTimePalette:(id)a3
{
}

- (NTKInterpolatedColorPalette)interpolatedTimePalette
{
  return self->_interpolatedTimePalette;
}

- (void)setInterpolatedTimePalette:(id)a3
{
}

- (NTKParmesanColorPalette)stylePalette
{
  return self->_stylePalette;
}

- (void)setStylePalette:(id)a3
{
}

- (NTKInterpolatedColorPalette)interpolatedStylePalette
{
  return self->_interpolatedStylePalette;
}

- (void)setInterpolatedStylePalette:(id)a3
{
}

- (BOOL)topComplicationVisible
{
  return self->_topComplicationVisible;
}

- (void)setTopComplicationVisible:(BOOL)a3
{
  self->_topComplicationVisible = a3;
}

- (BOOL)bottomComplicationVisible
{
  return self->_bottomComplicationVisible;
}

- (void)setBottomComplicationVisible:(BOOL)a3
{
  self->_bottomComplicationVisible = a3;
}

- (BOOL)timeAndComplicationsDimmingIsValid
{
  return self->_timeAndComplicationsDimmingIsValid;
}

- (void)setTimeAndComplicationsDimmingIsValid:(BOOL)a3
{
  self->_timeAndComplicationsDimmingIsValid = a3;
}

- (double)timeAndComplicationsDimming
{
  return self->_timeAndComplicationsDimming;
}

- (void)setTimeAndComplicationsDimming:(double)a3
{
  self->_timeAndComplicationsDimming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedStylePalette, 0);
  objc_storeStrong((id *)&self->_stylePalette, 0);
  objc_storeStrong((id *)&self->_interpolatedTimePalette, 0);
  objc_storeStrong((id *)&self->_timePalette, 0);
  objc_storeStrong((id *)&self->_swatchTimeFormatter, 0);
  objc_storeStrong((id *)&self->_swatchManager, 0);
  objc_storeStrong((id *)&self->_parmesanComplicationFactory, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_previousFaceState, 0);
}

- (id)createFaceColorPalette
{
  uint64_t v2 = objc_alloc_init(NTKParmesanColorPalette);

  return v2;
}

- (id)parmesanPalette
{
  return (id)((uint64_t (*)(NTKParmesanFaceView *, char *))MEMORY[0x270F9A6D0])(self, sel_faceColorPalette);
}

- (id)_paletteForStyle:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_stylePalette(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_copy(v6, v7, v8, v9);

  uint64_t v14 = objc_msgSend_delegate(self, v11, v12, v13);
  double v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a3, v16);
  objc_super v21 = objc_msgSend_stringValue(v17, v18, v19, v20);
  __int16 v24 = objc_msgSend_faceViewDidRequestCustomDataForKey_(v14, v22, (uint64_t)v21, v23);

  if (!v24
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v25, (uint64_t)v24, v26),
        (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v30 = [NTKParmesanPigmentProviderCoordinator alloc];
    uint64_t v33 = objc_msgSend_initWithSelectedStyle_(v30, v31, a3, v32);
    uint64_t v29 = objc_msgSend_defaultColorOptionForSlot_(v33, v34, @"style-color", v35);
    double v39 = objc_msgSend_JSONObjectRepresentation(v29, v36, v37, v38);
    uint64_t v43 = objc_msgSend_delegate(self, v40, v41, v42);
    v46 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v44, a3, v45);
    uint64_t v50 = objc_msgSend_stringValue(v46, v47, v48, v49);
    objc_msgSend_faceViewDidUpdateCustomData_forKey_(v43, v51, (uint64_t)v39, (uint64_t)v50);
  }
  objc_msgSend_setPigmentEditOption_(v10, v27, (uint64_t)v29, v28);

  return v10;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)(a3 - 12) > 7) {
    return 0;
  }
  else {
    return (id)qword_2651FC578[a3 - 12];
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((objc_msgSend__needCustomSwatchImageForEditMode_(self, v13, a4, v14) & 1) == 0)
  {
    v339.receiver = self;
    v339.super_class = (Class)NTKParmesanFaceView;
    uint64_t v44 = [(NTKParmesanFaceView *)&v339 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11];
LABEL_10:
    uint64_t v45 = (void *)v44;
    goto LABEL_45;
  }
  objc_msgSend__setupSwatchManagerIfNeeded(self, v15, v16, v17);
  objc_msgSend__setupTimeFormatterIfNeeded(self, v18, v19, v20);
  if ((objc_msgSend__validateEditOption_forMode_(self, v21, (uint64_t)v10, a4) & 1) == 0)
  {
    v338.receiver = self;
    v338.super_class = (Class)NTKParmesanFaceView;
    uint64_t v44 = [(NTKParmesanFaceView *)&v338 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11 refreshHandler:v12];
    goto LABEL_10;
  }
  objc_super v25 = 0;
  int64_t v26 = a4 - 13;
  switch(a4)
  {
    case 13:
      uint64_t v27 = objc_msgSend_controller(self, v22, v23, v24);
      uint64_t v31 = objc_msgSend_numerals(v27, v28, v29, v30);

      uint64_t v35 = objc_msgSend_typeface(v10, v32, v33, v34);
      if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v36, v31, v37)) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = v31;
      }
      uint64_t v42 = objc_msgSend_timePalette(self, v38, v39, v40);
      objc_msgSend__swatchKeyForTypeface_numerals_palette_(self, v43, v35, v41, v42);
      goto LABEL_20;
    case 14:
      v46 = objc_msgSend_controller(self, v22, v23, v24);
      uint64_t v326 = objc_msgSend_typeface(v46, v47, v48, v49);

      uint64_t v53 = objc_msgSend_controller(self, v50, v51, v52);
      uint64_t v57 = objc_msgSend_numerals(v53, v54, v55, v56);

      uint64_t v61 = objc_msgSend_controller(self, v58, v59, v60);
      uint64_t v65 = objc_msgSend_contentEffect(v61, v62, v63, v64);
      uint64_t v322 = objc_msgSend_styleOption(v65, v66, v67, v68);

      uint64_t v42 = objc_msgSend__paletteForStyle_(self, v69, v322, v70);
      uint64_t v74 = objc_msgSend_time(v10, v71, v72, v73);
      if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v75, v57, v76))
      {
        uint64_t v57 = 0;
        objc_msgSend__compositionKeyForCurrentCompositionWithTimeOption_numerals_(self, v77, v74, 0);
      }
      else
      {
        objc_msgSend__compositionKeyForCurrentCompositionWithTimeOption_numerals_(self, v77, v74, v57);
      uint64_t v78 = };
      uint64_t v82 = objc_msgSend_timePalette(self, v79, v80, v81);
      objc_super v25 = objc_msgSend__swatchKeyForStyle_stylePalette_timePalette_typeface_numerals_time_compositionSwatchKey_(self, v83, v322, (uint64_t)v42, v82, v326, v57, v74, v78);

      goto LABEL_21;
    case 15:
      id v84 = objc_msgSend_controller(self, v22, v23, v24);
      uint64_t v327 = objc_msgSend_typeface(v84, v85, v86, v87);

      uint64_t v91 = objc_msgSend_controller(self, v88, v89, v90);
      uint64_t v95 = objc_msgSend_numerals(v91, v92, v93, v94);

      uint64_t v99 = objc_msgSend_style(v10, v96, v97, v98);
      uint64_t v42 = objc_msgSend__paletteForStyle_(self, v100, v99, v101);
      uint64_t v105 = objc_msgSend_controller(self, v102, v103, v104);
      uint64_t v109 = objc_msgSend_timeOption(v105, v106, v107, v108);

      int64_t v323 = v26;
      uint64_t v110 = v95;
      uint64_t v112 = objc_msgSend__compositionKeyForCurrentCompositionWithTimeOption_numerals_(self, v111, v109, v95);
      id v116 = objc_msgSend_timePalette(self, v113, v114, v115);
      uint64_t v117 = v110;
      int64_t v26 = v323;
      objc_super v25 = objc_msgSend__swatchKeyForStyle_stylePalette_timePalette_typeface_numerals_time_compositionSwatchKey_(self, v118, v99, (uint64_t)v42, v116, v327, v117, v109, v112);

      goto LABEL_21;
    case 19:
      v119 = objc_msgSend_controller(self, v22, v23, v24);
      uint64_t v123 = objc_msgSend_typeface(v119, v120, v121, v122);

      uint64_t v127 = objc_msgSend_numeralOption(v10, v124, v125, v126);
      if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v128, v127, v129))uint64_t v133 = 0; {
      else
      }
        uint64_t v133 = v123;
      uint64_t v42 = objc_msgSend_timePalette(self, v130, v131, v132);
      objc_msgSend__swatchKeyForTypeface_numerals_palette_(self, v134, v133, v127, v42);
      objc_super v25 = LABEL_20:;
LABEL_21:

      break;
    default:
      break;
  }
  v135 = objc_msgSend_swatchManager(self, v22, v23, v24);
  v139 = objc_msgSend_copy(v12, v136, v137, v138);
  objc_msgSend_setHandler_forKey_(v135, v140, (uint64_t)v139, (uint64_t)v25);

  v143 = objc_msgSend_cachedSwatchForKey_(MEMORY[0x263F57A98], v141, (uint64_t)v25, v142);
  uint64_t v45 = v143;
  if (v143)
  {
    id v146 = v143;
  }
  else
  {
    objc_msgSend_sizeForSwatchStyle_(MEMORY[0x263F579C0], v144, 3, v145);
    switch(v26)
    {
      case 0:
        id v147 = v10;
        uint64_t v151 = objc_msgSend_typeface(v147, v148, v149, v150);
        v155 = objc_msgSend_controller(self, v152, v153, v154);
        uint64_t v159 = objc_msgSend_numerals(v155, v156, v157, v158);

        if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v160, v159, v161))uint64_t v165 = 0; {
        else
        }
          uint64_t v165 = v159;
        v166 = objc_msgSend_timePalette(self, v162, v163, v164);
        objc_msgSend__timeLabelWithTypeface_numerals_palette_(self, v167, v151, v165, v166);
        goto LABEL_41;
      case 1:
        id v328 = v10;
        uint64_t v171 = objc_msgSend_time(v328, v168, v169, v170);
        v175 = objc_msgSend_controller(self, v172, v173, v174);
        uint64_t v179 = objc_msgSend_numerals(v175, v176, v177, v178);

        if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v180, v179, v181))uint64_t v185 = 0; {
        else
        }
          uint64_t v185 = v179;
        uint64_t v317 = v185;
        v186 = objc_msgSend_controller(self, v182, v183, v184);
        uint64_t v324 = objc_msgSend_compositionForCurrentAssetWithTimeOption_numerals_(v186, v187, v171, v185);

        v320 = objc_msgSend_controller(self, v188, v189, v190);
        uint64_t v314 = objc_msgSend_typeface(v320, v191, v192, v193);
        v197 = objc_msgSend_timePalette(self, v194, v195, v196);
        v201 = objc_msgSend_controller(self, v198, v199, v200);
        v205 = objc_msgSend_contentEffect(v201, v202, v203, v204);
        v207 = objc_msgSend__galleryViewWithComposition_timeOption_typeface_numerals_timePalette_contentEffect_(self, v206, v324, v171, v314, v317, v197, v205);

        v208 = (void *)MEMORY[0x263F579C0];
        uint64_t v212 = objc_msgSend_swatchStyle(v328, v209, v210, v211);

        objc_msgSend_sizeForSwatchStyle_(v208, v213, v212, v214);
        uint64_t v216 = v215;
        uint64_t v218 = v217;
        v219 = (void *)v324;
        goto LABEL_36;
      case 2:
        id v325 = v10;
        uint64_t v223 = objc_msgSend_style(v325, v220, v221, v222);
        uint64_t v321 = objc_msgSend__paletteForStyle_(self, v224, v223, v225);
        v229 = objc_msgSend_controller(self, v226, v227, v228);
        uint64_t v318 = objc_msgSend_numerals(v229, v230, v231, v232);

        v236 = objc_msgSend_controller(self, v233, v234, v235);
        uint64_t v240 = objc_msgSend_timeOption(v236, v237, v238, v239);

        v241 = [NTKParmesanGalleryContentEffect alloc];
        v329 = objc_msgSend_initWithStyleOption_palette_(v241, v242, v223, v321);
        int isPartiallySupported = objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v243, v318, v244);
        uint64_t v249 = 3;
        if (!isPartiallySupported) {
          uint64_t v249 = v240;
        }
        uint64_t v315 = v249;
        v319 = objc_msgSend_controller(self, v246, v247, v248);
        v313 = objc_msgSend_currentComposition(v319, v250, v251, v252);
        v316 = objc_msgSend_controller(self, v253, v254, v255);
        uint64_t v312 = objc_msgSend_typeface(v316, v256, v257, v258);
        v262 = objc_msgSend_controller(self, v259, v260, v261);
        uint64_t v266 = objc_msgSend_numerals(v262, v263, v264, v265);
        v270 = objc_msgSend_timePalette(self, v267, v268, v269);
        v207 = objc_msgSend__galleryViewWithComposition_timeOption_typeface_numerals_timePalette_contentEffect_(self, v271, (uint64_t)v313, v315, v312, v266, v270, v329);

        v272 = (void *)MEMORY[0x263F579C0];
        uint64_t v276 = objc_msgSend_swatchStyle(v325, v273, v274, v275);

        objc_msgSend_sizeForSwatchStyle_(v272, v277, v276, v278);
        uint64_t v216 = v279;
        uint64_t v218 = v280;

        v219 = (void *)v321;
LABEL_36:

        uint64_t v281 = 0;
        goto LABEL_42;
      case 6:
        id v147 = v10;
        uint64_t v285 = objc_msgSend_numeralOption(v147, v282, v283, v284);
        v289 = objc_msgSend_controller(self, v286, v287, v288);
        uint64_t v293 = objc_msgSend_typeface(v289, v290, v291, v292);

        if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v294, v285, v295))uint64_t v299 = 0; {
        else
        }
          uint64_t v299 = v293;
        v166 = objc_msgSend_timePalette(self, v296, v297, v298);
        objc_msgSend__timeLabelWithTypeface_numerals_palette_(self, v300, v299, v285, v166);
        v207 = LABEL_41:;

        v301 = (void *)MEMORY[0x263F579C0];
        uint64_t v305 = objc_msgSend_swatchStyle(v147, v302, v303, v304);

        objc_msgSend_sizeForSwatchStyle_(v301, v306, v305, v307);
        uint64_t v216 = v308;
        uint64_t v218 = v309;
        uint64_t v281 = 1;
LABEL_42:
        if (v207)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_246B7B1A0;
          block[3] = &unk_2651FC558;
          uint64_t v335 = v216;
          uint64_t v336 = v218;
          id v331 = v207;
          v332 = self;
          id v333 = v25;
          uint64_t v337 = v281;
          id v334 = v12;
          id v310 = v207;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
        break;
      default:
        break;
    }
  }

LABEL_45:

  return v45;
}

- (id)_compositionKeyForCurrentCompositionWithTimeOption:(unint64_t)a3 numerals:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend_controller(self, a2, a3, a4);
  uint64_t v8 = objc_msgSend_compositionForCurrentAssetWithTimeOption_numerals_(v6, v7, a3, a4);

  if (v8)
  {
    id v12 = objc_msgSend_swatchKey(v8, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = NSString;
    uint64_t v14 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, a3, v11);
    id v12 = objc_msgSend_stringWithFormat_(v13, v15, @"empty-composition-%@", v16, v14);
  }

  return v12;
}

- (id)_swatchKeyForTypeface:(unint64_t)a3 numerals:(unint64_t)a4 palette:(id)a5
{
  uint64_t v7 = NSString;
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v12 = objc_msgSend_numberWithUnsignedInteger_(v8, v10, a3, v11);
  uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v13, a4, v14);
  uint64_t v19 = objc_msgSend_identifier(v9, v16, v17, v18);

  double v22 = objc_msgSend_stringWithFormat_(v7, v20, @"parmesan-typeface-%@-numerals-%@-palette-%@", v21, v12, v15, v19);

  return v22;
}

- (id)_swatchKeyForStyle:(unint64_t)a3 stylePalette:(id)a4 timePalette:(id)a5 typeface:(unint64_t)a6 numerals:(unint64_t)a7 time:(unint64_t)a8 compositionSwatchKey:(id)a9
{
  uint64_t v43 = NSString;
  uint64_t v14 = NSNumber;
  id v15 = a9;
  id v16 = a5;
  id v17 = a4;
  uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(v14, v18, a3, v19);
  uint64_t v24 = objc_msgSend_identifier(v17, v21, v22, v23);

  uint64_t v28 = objc_msgSend_identifier(v16, v25, v26, v27);

  uint64_t v31 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v29, a6, v30);
  uint64_t v34 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v32, a7, v33);
  uint64_t v37 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v35, a8, v36);
  uint64_t v40 = objc_msgSend_stringWithFormat_(v43, v38, @"parmesan-%@-%@-%@-%@-%@-%@-%@", v39, v20, v24, v28, v31, v34, v37, v15);

  return v40;
}

- (id)_timeLabelWithTypeface:(unint64_t)a3 numerals:(unint64_t)a4 palette:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F579C0];
  id v9 = a5;
  objc_msgSend_sizeForSwatchStyle_(v8, v10, 4, v11);
  double v13 = v12;
  double v15 = v14;
  double v16 = *MEMORY[0x263F00148];
  double v17 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v18 = CLKLocaleNumberSystemFromNumeralOption();
  uint64_t v22 = objc_msgSend_swatchTimeFormatter(self, v19, v20, v21);
  objc_msgSend_setForcedNumberSystem_(v22, v23, v18, v24);

  uint64_t v28 = objc_msgSend_swatchTimeFormatter(self, v25, v26, v27);
  uint64_t v29 = NTKIdealizedDate();
  objc_msgSend_setOverrideDate_(v28, v30, (uint64_t)v29, v31);

  uint64_t v32 = [NTKParmesanSwatchTimeLabel alloc];
  uint64_t v36 = objc_msgSend_initWithFrame_(v32, v33, v34, v35, v16, v17, v13, v15);
  uint64_t v37 = [NTKParmesanTimeLayout alloc];
  uint64_t v39 = objc_msgSend_initWithAlignment_scale_(v37, v38, 0, 1);
  uint64_t v43 = objc_msgSend_device(self, v40, v41, v42);
  objc_msgSend_prepareForSwatchWithLayout_typeface_complicationVisibility_palette_numerals_device_(v36, v44, (uint64_t)v39, a3, 0, v9, a4, v43);

  uint64_t v48 = objc_msgSend_swatchTimeFormatter(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_timeText(v48, v49, v50, v51);
  objc_msgSend_setText_(v36, v53, (uint64_t)v52, v54);

  objc_msgSend_setFrame_(v36, v55, v56, v57, v16, v17, v13, v15);
  objc_msgSend_layoutIfNeeded(v36, v58, v59, v60);
  objc_msgSend_setNeedsDisplay(v36, v61, v62, v63);

  return v36;
}

- (id)_galleryViewWithComposition:(id)a3 timeOption:(unint64_t)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timePalette:(id)a7 contentEffect:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  double v17 = [NTKParmesanGalleryView alloc];
  objc_msgSend_bounds(self, v18, v19, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  uint64_t v32 = objc_msgSend_device(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_timeLayout(v16, v33, v34, v35);
  uint64_t v38 = objc_msgSend_initWithFrame_device_typeface_numerals_timeOption_timeLayout_timePalette_(v17, v37, (uint64_t)v32, a5, a6, a4, v36, v15, v22, v24, v26, v28);

  objc_msgSend_setIsGeneratingSwatch_(v38, v39, 1, v40);
  uint64_t v44 = objc_msgSend_timeView(v38, v41, v42, v43);
  uint64_t v45 = NTKIdealizedDate();
  objc_msgSend_setOverrideDate_duration_(v44, v46, (uint64_t)v45, v47, 0.0);

  objc_msgSend_setComposition_(v38, v48, (uint64_t)v16, v49);
  objc_msgSend_setContentEffect_(v38, v50, (uint64_t)v14, v51);

  objc_msgSend_setNeedsLayout(v38, v52, v53, v54);
  objc_msgSend_setNeedsDisplay(v38, v55, v56, v57);

  return v38;
}

- (void)_setupSwatchManagerIfNeeded
{
  uint64_t v5 = objc_msgSend_swatchManager(self, a2, v2, v3);

  if (!v5)
  {
    uint64_t v8 = objc_alloc_init(NTKParmesanSwatchManager);
    objc_msgSend_setSwatchManager_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)_setupTimeFormatterIfNeeded
{
  uint64_t v5 = objc_msgSend_swatchTimeFormatter(self, a2, v2, v3);

  if (!v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFD220]);
    objc_msgSend_setSwatchTimeFormatter_(self, v6, (uint64_t)v8, v7);
  }
}

- (BOOL)_needCustomSwatchImageForEditMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0x14) & (0x8E000u >> a3);
}

- (BOOL)_validateEditOption:(id)a3 forMode:(int64_t)a4
{
  id v5 = a3;
  if (unint64_t)(a4 - 13) <= 6 && ((0x47u >> (a4 - 13)))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
}

@end