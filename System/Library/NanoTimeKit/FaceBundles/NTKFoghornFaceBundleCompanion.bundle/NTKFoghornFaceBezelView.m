@interface NTKFoghornFaceBezelView
+ (id)_attributedStringForActiveDepth:(double)a3 maxDepth:(double)a4 beyondLimit:(BOOL)a5 inFeet:(BOOL)a6 depthAttributes:(id)a7 depthUnitAttributes:(id)a8 maxDepthAttributes:(id)a9 maxDepthUnitAttributes:(id)a10;
+ (id)_attributedStringForActiveElevation:(double)a3 accuracy:(double)a4 precision:(double)a5 showPrefix:(BOOL)a6 inFeet:(BOOL)a7 valueAttributes:(id)a8 unitAttributes:(id)a9;
+ (id)_attributedStringForBeyondLimitDepth:(double)a3 showPrefix:(BOOL)a4 inFeet:(BOOL)a5 depthAttributes:(id)a6 depthUnitAttributes:(id)a7;
+ (id)_attributedStringForMaxDepth:(double)a3 beyondLimit:(BOOL)a4 inFeet:(BOOL)a5 depthAttributes:(id)a6 depthUnitAttributes:(id)a7;
+ (id)_maxDepthImageAttributesFromMaxDepthAttributes:(id)a3;
+ (id)_stringForDepth:(double)a3 inFeet:(BOOL)a4;
+ (void)drawSnapshotInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 colorPalette:(id)a5 forDevice:(id)a6;
- (BOOL)_needBaseLabelUpdateForDeltaDepthElevation:(double)a3 range:(double)a4;
- (BOOL)_needUpdateForDeltaDepthElevation:(double)a3 range:(double)a4;
- (BOOL)_needUpdateForDeltaSeconds:(double)a3;
- (BOOL)elevationIsValid;
- (BOOL)isSubmerged;
- (BOOL)showingStatusIndicator;
- (NSArray)harmoniaOvernightChangeAboveValues;
- (NSArray)harmoniaOvernightChangeBelowValues;
- (NSArray)harmoniaOvernightMarkers;
- (NSArray)harmoniaOvernightTypicalValues;
- (NSArray)harmoniaTrainingMarkers;
- (NSNumber)harmoniaTrainingValue;
- (NSString)harmoniaOvernightLocalizedSummary;
- (NSString)harmoniaTrainingLocalizedSummary;
- (NTKFoghornFaceBezelView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKFoghornFaceColorPalette)colorPalette;
- (UIColor)depthDecorationColor;
- (UIColor)depthLabelColor;
- (UIColor)depthLimitLabelColor;
- (UIColor)depthLimitMajorTickColor;
- (UIColor)depthLimitMedialTickColor;
- (UIColor)depthLimitMinorTickColor;
- (UIColor)depthMarkerColor;
- (UIColor)depthMaxLabelColor;
- (UIColor)depthMaxMajorTickColor;
- (UIColor)depthMaxMarkerColor;
- (UIColor)depthMaxMedialTickColor;
- (UIColor)depthMaxMinorTickColor;
- (UIColor)depthOverLimitColor;
- (UIColor)harmoniaDotFillColor;
- (UIColor)harmoniaEmphasizedTickColor;
- (UIColor)harmoniaOvernightOutOfRangeColor;
- (UIColor)harmoniaOvernightPartiallyOutOfRangeColor;
- (UIColor)harmoniaOvernightTypicalColor;
- (UIColor)harmoniaTrainingAboveColor;
- (UIColor)harmoniaTrainingBelowColor;
- (UIColor)harmoniaTrainingNearColor;
- (UIColor)harmoniaTrainingWellAboveColor;
- (UIColor)harmoniaTrainingWellBelowColor;
- (UIColor)harmoniaUnitLabelColor;
- (UIColor)inactiveMajorTickColor;
- (UIColor)inactiveMedialTickColor;
- (UIColor)inactiveMinorTickColor;
- (UIColor)majorTickColor;
- (UIColor)medialTickColor;
- (UIColor)minorTickColor;
- (double)elevation;
- (double)elevationAccuracy;
- (double)elevationPrecision;
- (double)seconds;
- (double)secondsEndOfMinuteAnimationDuration;
- (double)submergedDepth;
- (double)submergedDepthLabelLimitFeet;
- (double)submergedDepthLabelLimitMeters;
- (double)submergedDepthLimit;
- (double)submergedDepthMax;
- (double)tritiumProgress;
- (id)_harmoniaOvernightSummaryLabelColor;
- (id)_harmoniaTrainingSummaryLabelColor;
- (int64_t)bezelStyle;
- (unint64_t)harmoniaOvernightChangesThreshold;
- (unint64_t)harmoniaOvernightDataState;
- (unint64_t)harmoniaTrainingDataState;
- (unint64_t)harmoniaTrainingLoadBand;
- (unint64_t)secondsEndOfMinuteAnimationStyle;
- (unint64_t)secondsTritiumAnimationStyle;
- (void)_addConstraints;
- (void)_addSubViews;
- (void)_drawBezelInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 tritiumProgress:(double)a5 alpha:(double)a6;
- (void)_drawDepthBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5;
- (void)_drawElevationBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5;
- (void)_drawHarmoniaBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5;
- (void)_drawSecondsBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5;
- (void)_initPixelsPerValuesForDevice:(id)a3;
- (void)_limitsForElevation:(double)a3 elevationIsValid:(BOOL)a4 limitMeters:(double *)a5 limitFeet:(double *)a6;
- (void)_registerNotifications;
- (void)_transitionBaseLabelFromStyle:(int64_t)a3 toStyle:(int64_t)a4 progress:(double)a5;
- (void)_updateBaseLabel;
- (void)_updateBaseLabelBaslineOffsetForAttributedText:(id)a3;
- (void)_updateBaseLabelForDepthBezel;
- (void)_updateBaseLabelForElevationBezel;
- (void)_updateDepthLimitLabelsWithSubmergedDepthLimitMeters:(double)a3 feet:(double)a4;
- (void)_updateDepthUnits;
- (void)_updateElevationLimitLabelsWithElevation:(double)a3 elevationIsValid:(BOOL)a4;
- (void)_updateHarmoniaSummaryLabelCache:(id *)a3 withString:(id)a4 dataState:(unint64_t)a5;
- (void)_updateLimitLabelCache:(id *)a3 limitFeet:(double)a4 limitMeters:(double)a5 limitsValid:(BOOL)a6;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBezelFromStyle:(int64_t)a3 toStyle:(int64_t)a4 progress:(double)a5;
- (void)setBezelStyle:(int64_t)a3;
- (void)setColorPalette:(id)a3;
- (void)setDepthDecorationColor:(id)a3;
- (void)setDepthLabelColor:(id)a3;
- (void)setDepthLimitLabelColor:(id)a3;
- (void)setDepthLimitMajorTickColor:(id)a3;
- (void)setDepthLimitMedialTickColor:(id)a3;
- (void)setDepthLimitMinorTickColor:(id)a3;
- (void)setDepthMarkerColor:(id)a3;
- (void)setDepthMaxLabelColor:(id)a3;
- (void)setDepthMaxMajorTickColor:(id)a3;
- (void)setDepthMaxMarkerColor:(id)a3;
- (void)setDepthMaxMedialTickColor:(id)a3;
- (void)setDepthMaxMinorTickColor:(id)a3;
- (void)setDepthOverLimitColor:(id)a3;
- (void)setElevation:(double)a3;
- (void)setElevationAccuracy:(double)a3;
- (void)setElevationIsValid:(BOOL)a3;
- (void)setElevationPrecision:(double)a3;
- (void)setHarmoniaDotFillColor:(id)a3;
- (void)setHarmoniaEmphasizedTickColor:(id)a3;
- (void)setHarmoniaOvernightChangeAboveValues:(id)a3;
- (void)setHarmoniaOvernightChangeBelowValues:(id)a3;
- (void)setHarmoniaOvernightChangesThreshold:(unint64_t)a3;
- (void)setHarmoniaOvernightDataState:(unint64_t)a3;
- (void)setHarmoniaOvernightLocalizedSummary:(id)a3;
- (void)setHarmoniaOvernightMarkers:(id)a3;
- (void)setHarmoniaOvernightOutOfRangeColor:(id)a3;
- (void)setHarmoniaOvernightPartiallyOutOfRangeColor:(id)a3;
- (void)setHarmoniaOvernightTypicalColor:(id)a3;
- (void)setHarmoniaOvernightTypicalValues:(id)a3;
- (void)setHarmoniaTrainingAboveColor:(id)a3;
- (void)setHarmoniaTrainingBelowColor:(id)a3;
- (void)setHarmoniaTrainingDataState:(unint64_t)a3;
- (void)setHarmoniaTrainingLoadBand:(unint64_t)a3;
- (void)setHarmoniaTrainingLocalizedSummary:(id)a3;
- (void)setHarmoniaTrainingMarkers:(id)a3;
- (void)setHarmoniaTrainingNearColor:(id)a3;
- (void)setHarmoniaTrainingValue:(id)a3;
- (void)setHarmoniaTrainingWellAboveColor:(id)a3;
- (void)setHarmoniaTrainingWellBelowColor:(id)a3;
- (void)setHarmoniaUnitLabelColor:(id)a3;
- (void)setInactiveMajorTickColor:(id)a3;
- (void)setInactiveMedialTickColor:(id)a3;
- (void)setInactiveMinorTickColor:(id)a3;
- (void)setMajorTickColor:(id)a3;
- (void)setMedialTickColor:(id)a3;
- (void)setMinorTickColor:(id)a3;
- (void)setSeconds:(double)a3;
- (void)setSecondsEndOfMinuteAnimationDuration:(double)a3;
- (void)setSecondsEndOfMinuteAnimationStyle:(unint64_t)a3;
- (void)setSecondsTritiumAnimationStyle:(unint64_t)a3;
- (void)setShowingStatusIndicator:(BOOL)a3;
- (void)setSubmerged:(BOOL)a3;
- (void)setSubmergedDepth:(double)a3;
- (void)setSubmergedDepthLabelLimitFeet:(double)a3;
- (void)setSubmergedDepthLabelLimitMeters:(double)a3;
- (void)setSubmergedDepthLimit:(double)a3;
- (void)setSubmergedDepthMax:(double)a3;
- (void)setToSnapshotValues;
- (void)setTritiumProgress:(double)a3;
@end

@implementation NTKFoghornFaceBezelView

- (void)_initPixelsPerValuesForDevice:(id)a3
{
  double bezelDepthStartAngle = self->_layoutConstants.bezelDepthStartAngle;
  superEllipseGeometry = self->_superEllipseGeometry;
  id v6 = a3;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)superEllipseGeometry, bezelDepthStartAngle);
  self->_depthElevationBezelLength = v7 + v7;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)self->_superEllipseGeometry, 1.57079633);
  self->_pixelsPerSecond = v8 * 4.0 / 60.0;
  objc_msgSend_screenScale(v6, v9, v10, v11);
  double v13 = v12;

  self->_pixelsVisibleChange = 1.0 / (v13 * 4.0);
}

- (NTKFoghornFaceBezelView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v244 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v224.receiver = self;
  v224.super_class = (Class)NTKFoghornFaceBezelView;
  double v13 = -[NTKFoghornFaceBezelView initWithFrame:](&v224, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v10, v11, v12);
    objc_msgSend_setBackgroundColor_(v13, v15, (uint64_t)v14, v16);

    v17 = (double *)(v13 + 408);
    id v223 = v9;
    id v18 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D4D88);
    id WeakRetained = objc_loadWeakRetained(&qword_2691D4D90);
    if (WeakRetained)
    {
      v20 = WeakRetained;
      id v21 = objc_loadWeakRetained(&qword_2691D4D90);
      if (v21 == v18)
      {
        uint64_t v25 = objc_msgSend_version(v18, v22, v23, v24);
        uint64_t v26 = qword_2691D4D98;

        if (v25 == v26)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D4D88);
          long long v237 = xmmword_2691D4D50;
          long long v238 = unk_2691D4D60;
          long long v239 = xmmword_2691D4D70;
          uint64_t v240 = qword_2691D4D80;
          long long v233 = xmmword_2691D4D10;
          long long v234 = unk_2691D4D20;
          long long v235 = xmmword_2691D4D30;
          long long v236 = unk_2691D4D40;
          long long v229 = xmmword_2691D4CD0;
          long long v230 = unk_2691D4CE0;
          long long v231 = xmmword_2691D4CF0;
          long long v232 = unk_2691D4D00;
          long long v225 = xmmword_2691D4C90;
          long long v226 = *(_OWORD *)&qword_2691D4CA0;
          long long v227 = xmmword_2691D4CB0;
          long long v228 = *(_OWORD *)&qword_2691D4CC0;

          *(_OWORD *)(v13 + 600) = v237;
          *(_OWORD *)(v13 + 616) = v238;
          *(_OWORD *)(v13 + 632) = v239;
          *((void *)v13 + 81) = v240;
          *(_OWORD *)(v13 + 536) = v233;
          *(_OWORD *)(v13 + 552) = v234;
          *(_OWORD *)(v13 + 568) = v235;
          *(_OWORD *)(v13 + 584) = v236;
          *(_OWORD *)(v13 + 472) = v229;
          *(_OWORD *)(v13 + 488) = v230;
          *(_OWORD *)(v13 + 504) = v231;
          *(_OWORD *)(v13 + 520) = v232;
          *(_OWORD *)v17 = v225;
          *(_OWORD *)(v13 + 424) = v226;
          *(_OWORD *)(v13 + 440) = v227;
          *(_OWORD *)(v13 + 456) = v228;
          v32 = [NTKSuperEllipseRectGeometry alloc];
          uint64_t v35 = objc_msgSend_initForDevice_tangentialInset_(v32, v33, (uint64_t)v18, v34, *v17);
          v36 = (void *)*((void *)v13 + 82);
          *((void *)v13 + 82) = v35;

          uint64_t v40 = objc_msgSend_foghornDepthBezelLabelFontOfSize_(MEMORY[0x263EFD198], v37, v38, v39, *((double *)v13 + 69));
          v41 = (void *)*((void *)v13 + 96);
          *((void *)v13 + 96) = v40;

          uint64_t v45 = objc_msgSend_foghornDepthBezelLabelFontOfSize_(MEMORY[0x263EFD198], v42, v43, v44, *((double *)v13 + 70));
          v46 = (void *)*((void *)v13 + 97);
          *((void *)v13 + 97) = v45;

          uint64_t v50 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v47, v48, v49, 0.411764711, 0.725490212, 0.964705884, 1.0);
          v51 = (void *)*((void *)v13 + 136);
          *((void *)v13 + 136) = v50;

          objc_storeStrong((id *)v13 + 137, *((id *)v13 + 136));
          objc_storeStrong((id *)v13 + 138, *((id *)v13 + 136));
          uint64_t v55 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v52, v53, v54, 0.176470593, 0.356862754, 0.447058827, 1.0);
          v56 = (void *)*((void *)v13 + 142);
          *((void *)v13 + 142) = v55;

          objc_storeStrong((id *)v13 + 143, *((id *)v13 + 142));
          objc_storeStrong((id *)v13 + 144, *((id *)v13 + 142));
          uint64_t v60 = objc_msgSend_grayColor(MEMORY[0x263F825C8], v57, v58, v59);
          v61 = (void *)*((void *)v13 + 145);
          *((void *)v13 + 145) = v60;

          objc_storeStrong((id *)v13 + 146, *((id *)v13 + 145));
          objc_storeStrong((id *)v13 + 147, *((id *)v13 + 145));
          objc_storeStrong((id *)v13 + 148, *((id *)v13 + 136));
          objc_storeStrong((id *)v13 + 149, *((id *)v13 + 142));
          objc_storeStrong((id *)v13 + 150, *((id *)v13 + 136));
          objc_storeStrong((id *)v13 + 151, *((id *)v13 + 142));
          objc_storeStrong((id *)v13 + 152, *((id *)v13 + 145));
          objc_storeStrong((id *)v13 + 98, *((id *)v13 + 97));
          v222 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v62, v63, v64, 1.0, 0.886274517, 0.356862754, 1.0);
          objc_storeStrong((id *)v13 + 153, v222);
          id v65 = objc_alloc_init(MEMORY[0x263F81650]);
          objc_msgSend_setAlignment_(v65, v66, 1, v67);
          v217 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v68, v69, v70);
          v216 = objc_msgSend_foghornDepthBezelLabelFontOfSize_(MEMORY[0x263EFD198], v71, v72, v73, *((double *)v13 + 70));
          uint64_t v220 = *MEMORY[0x263F814F0];
          uint64_t v74 = *MEMORY[0x263F814F0];
          uint64_t v241 = *MEMORY[0x263F81500];
          uint64_t v219 = v241;
          uint64_t v242 = v74;
          *(void *)&long long v225 = v217;
          *((void *)&v225 + 1) = v216;
          uint64_t v243 = *MEMORY[0x263F81540];
          uint64_t v218 = v243;
          *(void *)&long long v226 = v65;
          v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v75, (uint64_t)&v225, (uint64_t)&v241, 3);
          id v77 = objc_alloc(MEMORY[0x263EFF980]);
          v80 = objc_msgSend_initWithCapacity_(v77, v78, 2, v79);
          v82 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v81, @"FOGHORN_LABEL_FEET", (uint64_t)&stru_26FB0CCF0);
          id v83 = objc_alloc(MEMORY[0x263F086A0]);
          v85 = objc_msgSend_initWithString_attributes_(v83, v84, (uint64_t)v82, (uint64_t)v76);
          objc_msgSend_setObject_atIndexedSubscript_(v80, v86, (uint64_t)v85, 0);

          v88 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v87, @"FOGHORN_LABEL_METERS", (uint64_t)&stru_26FB0CCF0);
          id v89 = objc_alloc(MEMORY[0x263F086A0]);
          v91 = objc_msgSend_initWithString_attributes_(v89, v90, (uint64_t)v88, (uint64_t)v76);
          objc_msgSend_setObject_atIndexedSubscript_(v80, v92, (uint64_t)v91, 1);

          v221 = objc_msgSend_copy(v80, v93, v94, v95);
          *((void *)v13 + 83) = sub_246B0585C(v221);
          *((void *)v13 + 124) = 2;
          v96 = (void *)*((void *)v13 + 125);
          uint64_t v97 = MEMORY[0x263EFFA68];
          *((void *)v13 + 125) = MEMORY[0x263EFFA68];

          v98 = (void *)*((void *)v13 + 126);
          *((void *)v13 + 126) = v97;

          v99 = (void *)*((void *)v13 + 127);
          *((void *)v13 + 127) = v97;

          v100 = (void *)*((void *)v13 + 128);
          *((void *)v13 + 128) = v97;

          v101 = (void *)*((void *)v13 + 130);
          *((void *)v13 + 130) = @" ";

          *((void *)v13 + 131) = 2;
          v102 = (void *)*((void *)v13 + 132);
          *((void *)v13 + 132) = v97;

          v103 = (void *)*((void *)v13 + 135);
          *((void *)v13 + 135) = @" ";

          uint64_t v107 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v104, v105, v106, 0.43, 0.43, 0.44, 1.0);
          v108 = (void *)*((void *)v13 + 155);
          *((void *)v13 + 155) = v107;

          uint64_t v112 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v109, v110, v111);
          v113 = (void *)*((void *)v13 + 156);
          *((void *)v13 + 156) = v112;

          uint64_t v117 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v114, v115, v116);
          v118 = (void *)*((void *)v13 + 157);
          *((void *)v13 + 157) = v117;

          uint64_t v122 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v119, v120, v121, 0.333333343, 0.68235296, 1.0, 1.0);
          v123 = (void *)*((void *)v13 + 158);
          *((void *)v13 + 158) = v122;

          uint64_t v127 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v124, v125, v126, 0.729411781, 0.443137258, 1.0, 1.0);
          v128 = (void *)*((void *)v13 + 159);
          *((void *)v13 + 159) = v127;

          uint64_t v132 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v129, v130, v131, 1.0, 0.423529416, 0.898039222, 1.0);
          v133 = (void *)*((void *)v13 + 160);
          *((void *)v13 + 160) = v132;

          uint64_t v137 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v134, v135, v136, 0.494117647, 0.41568628, 0.843137264, 1.0);
          v138 = (void *)*((void *)v13 + 161);
          *((void *)v13 + 161) = v137;

          uint64_t v142 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v139, v140, v141, 0.509803951, 0.525490224, 1.0, 1.0);
          v143 = (void *)*((void *)v13 + 162);
          *((void *)v13 + 162) = v142;

          uint64_t v147 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v144, v145, v146, 0.333333343, 0.68235296, 1.0, 1.0);
          v148 = (void *)*((void *)v13 + 163);
          *((void *)v13 + 163) = v147;

          uint64_t v152 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v149, v150, v151, 0.729411781, 0.443137258, 1.0, 1.0);
          v153 = (void *)*((void *)v13 + 164);
          *((void *)v13 + 164) = v152;

          uint64_t v157 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v154, v155, v156, 1.0, 0.423529416, 0.898039222, 1.0);
          v158 = (void *)*((void *)v13 + 165);
          *((void *)v13 + 165) = v157;

          id v159 = objc_alloc_init(MEMORY[0x263F81650]);
          objc_msgSend_setAlignment_(v159, v160, 1, v161);
          v215 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v162, v163, v164);
          v168 = objc_msgSend_foghornHarmoniaBezelLabelFontOfSize_(MEMORY[0x263EFD198], v165, v166, v167, *((double *)v13 + 73));
          uint64_t v241 = v219;
          uint64_t v242 = v220;
          *(void *)&long long v225 = v215;
          *((void *)&v225 + 1) = v168;
          uint64_t v243 = v218;
          *(void *)&long long v226 = v159;
          v170 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v169, (uint64_t)&v225, (uint64_t)&v241, 3);
          id v171 = objc_alloc(MEMORY[0x263EFF980]);
          v174 = objc_msgSend_initWithCapacity_(v171, v172, 2, v173);
          v176 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v175, @"FOGHORN_HARMONIA_LABEL_OVERNIGHT", (uint64_t)&stru_26FB0CCF0);
          id v177 = objc_alloc(MEMORY[0x263F086A0]);
          v179 = objc_msgSend_initWithString_attributes_(v177, v178, (uint64_t)v176, (uint64_t)v170);
          objc_msgSend_setObject_atIndexedSubscript_(v174, v180, (uint64_t)v179, 0);

          v182 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v181, @"FOGHORN_HARMONIA_LABEL_TRAINING", (uint64_t)&stru_26FB0CCF0);
          id v183 = objc_alloc(MEMORY[0x263F086A0]);
          v185 = objc_msgSend_initWithString_attributes_(v183, v184, (uint64_t)v182, (uint64_t)v170);
          objc_msgSend_setObject_atIndexedSubscript_(v174, v186, (uint64_t)v185, 1);

          v190 = objc_msgSend_copy(v174, v187, v188, v189);
          *((void *)v13 + 101) = sub_246B0585C(v190);
          objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(v13, v191, (uint64_t)(v13 + 816), *((void *)v13 + 130), *((void *)v13 + 124));
          objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(v13, v192, (uint64_t)(v13 + 840), *((void *)v13 + 135), *((void *)v13 + 131));
          objc_msgSend__initPixelsPerValuesForDevice_(v13, v193, (uint64_t)v18, v194);
          *((void *)v13 + 112) = 0;
          *((void *)v13 + 118) = 0x4044000000000000;
          *((void *)v13 + 119) = 0x4044000000000000;
          *((void *)v13 + 120) = 0x4060400000000000;
          *((void *)v13 + 117) = 0;
          *((void *)v13 + 116) = 0;
          *((void *)v13 + 121) = 0;
          v13[881] = 1;
          *((void *)v13 + 115) = 3;
          *((void *)v13 + 114) = 3;
          *((void *)v13 + 113) = 0x3FE0000000000000;
          objc_msgSend__updateDepthUnits(v13, v195, v196, v197);
          objc_msgSend__addSubViews(v13, v198, v199, v200);
          objc_msgSend__addConstraints(v13, v201, v202, v203);
          objc_msgSend__updateDepthLimitLabelsWithSubmergedDepthLimitMeters_feet_(v13, v204, v205, v206, *((double *)v13 + 119), *((double *)v13 + 120));
          objc_msgSend__updateElevationLimitLabelsWithElevation_elevationIsValid_(v13, v207, v13[881], v208, *((double *)v13 + 121));
          objc_msgSend_setBezelStyle_(v13, v209, 1, v210);
          objc_msgSend__registerNotifications(v13, v211, v212, v213);

          id v9 = v223;
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v27 = objc_storeWeak(&qword_2691D4D90, v18);
    qword_2691D4D98 = objc_msgSend_version(v18, v28, v29, v30);

    sub_246B0D460(v31, v18);
    goto LABEL_7;
  }
LABEL_8:

  return (NTKFoghornFaceBezelView *)v13;
}

- (void)dealloc
{
  depthTextLines = self->_depthTextLines;
  if (depthTextLines)
  {
    CFRelease(depthTextLines);
    self->_depthTextLines = 0;
  }
  harmoniaTextLines = self->_harmoniaTextLines;
  if (harmoniaTextLines)
  {
    CFRelease(harmoniaTextLines);
    self->_harmoniaTextLines = 0;
  }
  line = self->_harmoniaSummaryOvernightLabelCache.line;
  if (line)
  {
    CFRelease(line);
    self->_harmoniaSummaryOvernightLabelCache.line = 0;
  }
  double v8 = self->_harmoniaSummaryTrainingLabelCache.line;
  if (v8)
  {
    CFRelease(v8);
    self->_harmoniaSummaryTrainingLabelCache.line = 0;
  }
  textLines = self->_depthLimitLabelCache.textLines;
  if (textLines)
  {
    CFRelease(textLines);
    self->_depthLimitLabelCache.textLines = 0;
  }
  uint64_t v10 = self->_elevationLimitLabelCache.textLines;
  if (v10)
  {
    CFRelease(v10);
    self->_elevationLimitLabelCache.textLines = 0;
  }
  uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self, v13);

  v14.receiver = self;
  v14.super_class = (Class)NTKFoghornFaceBezelView;
  [(NTKFoghornFaceBezelView *)&v14 dealloc];
}

- (void)_registerNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v6, v5, (uint64_t)self, (uint64_t)sel__updateDepthUnits, *MEMORY[0x263F3F1A8], 0);
}

- (void)_addSubViews
{
  uint64_t v3 = (UILabel *)objc_opt_new();
  double v7 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v4, v5, v6);
  objc_msgSend_setTextColor_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_setNumberOfLines_(v3, v10, 1, v11);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v3, v12, 0, v13);
  objc_msgSend_setLineBreakMode_(v3, v14, 4, v15);
  objc_msgSend_setTextAlignment_(v3, v16, 1, v17);
  objc_msgSend_addSubview_(self, v18, (uint64_t)v3, v19);
  baseLabel = self->_baseLabel;
  self->_baseLabel = v3;
}

- (void)_addConstraints
{
  v42[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_lastBaselineAnchor(self->_baseLabel, a2, v2, v3);
  uint64_t v9 = objc_msgSend_bottomAnchor(self, v6, v7, v8);
  objc_msgSend_constraintEqualToAnchor_constant_(v5, v10, (uint64_t)v9, v11, -2.5);
  uint64_t v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  baseLabelBaselineConstraint = self->_baseLabelBaselineConstraint;
  self->_baseLabelBaselineConstraint = v12;

  objc_super v14 = (void *)MEMORY[0x263F08938];
  id v18 = objc_msgSend_leadingAnchor(self->_baseLabel, v15, v16, v17);
  v22 = objc_msgSend_leadingAnchor(self, v19, v20, v21);
  uint64_t v25 = objc_msgSend_constraintEqualToAnchor_(v18, v23, (uint64_t)v22, v24);
  uint64_t v29 = objc_msgSend_trailingAnchor(self->_baseLabel, v26, v27, v28, v25);
  v33 = objc_msgSend_trailingAnchor(self, v30, v31, v32);
  v36 = objc_msgSend_constraintEqualToAnchor_(v29, v34, (uint64_t)v33, v35);
  v37 = self->_baseLabelBaselineConstraint;
  v42[1] = v36;
  v42[2] = v37;
  uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v42, 3);
  objc_msgSend_activateConstraints_(v14, v40, (uint64_t)v39, v41);
}

+ (id)_stringForDepth:(double)a3 inFeet:(BOOL)a4
{
  double v4 = a3 * 3.2808399;
  if (!a4) {
    double v4 = a3;
  }
  uint64_t v5 = floor(a3) != a3 && !a4;
  return sub_246B0D5E4(v5, 6, v4);
}

+ (id)_attributedStringForBeyondLimitDepth:(double)a3 showPrefix:(BOOL)a4 inFeet:(BOOL)a5 depthAttributes:(id)a6 depthUnitAttributes:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v30[3] = *MEMORY[0x263EF8340];
  double v12 = -a3;
  if (a3 >= 0.0) {
    double v13 = a3;
  }
  else {
    double v13 = v12;
  }
  id v14 = a7;
  id v15 = a6;
  uint64_t v19 = objc_msgSend__stringForDepth_inFeet_(a1, v16, v8, v17, v13);
  uint64_t v20 = @"FOGHORN_BEYOND_METERS";
  if (a3 >= 0.0 && !v9)
  {
    if (v8) {
      objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v18, @"FOGHORN_BEYOND_FEET", (uint64_t)&stru_26FB0CCF0);
    }
    else {
      objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v18, @"FOGHORN_BEYOND_METERS", (uint64_t)&stru_26FB0CCF0);
    }
  }
  else
  {
    if (v8) {
      uint64_t v20 = @"FOGHORN_BEYOND_FEET";
    }
    v22 = @"FOGHORN_BEYOND_NEGATIVE_FEET";
    if (!v8) {
      v22 = @"FOGHORN_BEYOND_NEGATIVE_METERS";
    }
    if (a3 < 0.0) {
      objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v18, (uint64_t)v22, (uint64_t)&stru_26FB0CCF0);
    }
    else {
      objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v18, (uint64_t)v20, (uint64_t)&stru_26FB0CCF0);
    }
  uint64_t v23 = };
  v29[0] = *MEMORY[0x263F577C0];
  v29[1] = @"beyond";
  v30[0] = v15;
  v30[1] = v15;
  v29[2] = @"beyondUnit";
  v30[2] = v14;
  uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v30, (uint64_t)v29, 3);
  uint64_t v27 = objc_msgSend_ntk_attributedStringFromAttributesTable_markdownFormat_(MEMORY[0x263F086A0], v26, (uint64_t)v25, (uint64_t)v23, v19);

  return v27;
}

+ (id)_maxDepthImageAttributesFromMaxDepthAttributes:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  double v4 = objc_msgSend_objectForKeyedSubscript_(a3, a2, *MEMORY[0x263F81500], v3);
  uint64_t v7 = objc_msgSend_configurationWithScale_(MEMORY[0x263F82818], v5, 1, v6);
  BOOL v9 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F827E8], v8, @"arrow.down.to.line", (uint64_t)v7);
  double v12 = objc_msgSend_imageWithTintColor_(v9, v10, (uint64_t)v4, v11);

  id v15 = objc_msgSend_textAttachmentWithImage_(MEMORY[0x263F81678], v13, (uint64_t)v12, v14);
  uint64_t v19 = *MEMORY[0x263F814A0];
  v20[0] = v15;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v20, (uint64_t)&v19, 1);

  return v17;
}

+ (id)_attributedStringForMaxDepth:(double)a3 beyondLimit:(BOOL)a4 inFeet:(BOOL)a5 depthAttributes:(id)a6 depthUnitAttributes:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  void v30[4] = *MEMORY[0x263EF8340];
  id v12 = a6;
  id v13 = a7;
  uint64_t v16 = objc_msgSend__stringForDepth_inFeet_(a1, v14, v8, v15, a3);
  uint64_t v20 = objc_msgSend__maxDepthImageAttributesFromMaxDepthAttributes_(a1, v17, (uint64_t)v12, v18);
  uint64_t v21 = @"FOGHORN_MAXDEPTH_METERS_PLUS";
  if (v8)
  {
    uint64_t v21 = @"FOGHORN_MAXDEPTH_FEET_PLUS";
    v22 = @"FOGHORN_MAXDEPTH_FEET";
  }
  else
  {
    v22 = @"FOGHORN_MAXDEPTH_METERS";
  }
  if (v9) {
    objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v19, (uint64_t)v21, (uint64_t)&stru_26FB0CCF0);
  }
  else {
  uint64_t v23 = objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v19, (uint64_t)v22, (uint64_t)&stru_26FB0CCF0);
  }
  v29[0] = *MEMORY[0x263F577C0];
  v29[1] = @"maxDepthImage";
  v30[0] = v12;
  v30[1] = v20;
  v29[2] = @"maxDepth";
  void v29[3] = @"maxDepthUnit";
  v30[2] = v12;
  v30[3] = v13;
  uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v30, (uint64_t)v29, 4);
  uint64_t v27 = objc_msgSend_ntk_attributedStringFromAttributesTable_markdownFormat_(MEMORY[0x263F086A0], v26, (uint64_t)v25, (uint64_t)v23, v16);

  return v27;
}

+ (id)_attributedStringForActiveElevation:(double)a3 accuracy:(double)a4 precision:(double)a5 showPrefix:(BOOL)a6 inFeet:(BOOL)a7 valueAttributes:(id)a8 unitAttributes:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  v42[3] = *MEMORY[0x263EF8340];
  id v15 = a8;
  id v16 = a9;
  int shouldApproximateAltitude_accuracy_precision = objc_msgSend_shouldApproximateAltitude_accuracy_precision_(NTKFoghornElevationUtilities, v17, v18, v19, a3, a4, a5);
  double v24 = a3 * 3.2808399;
  if (v10) {
    double v25 = a5 * 3.2808399;
  }
  else {
    double v25 = a5;
  }
  if (v10) {
    objc_msgSend_roundedAltitude_accuracy_precision_(NTKFoghornElevationUtilities, v20, v21, v22, a3 * 3.2808399, a4 * 3.2808399, v25, v24);
  }
  else {
    objc_msgSend_roundedAltitude_accuracy_precision_(NTKFoghornElevationUtilities, v20, v21, v22, a3, a4, v25, v24);
  }
  if (fabs(v26) >= 0.00000011920929) {
    double v27 = v26;
  }
  else {
    double v27 = 0.0;
  }
  double v28 = -v27;
  int v29 = v27 < 0.0 || v11;
  if (v27 >= 0.0) {
    double v28 = v27;
  }
  uint64_t v31 = sub_246B0D5E4(0, 2, v28);
  if (v29 == 1 && shouldApproximateAltitude_accuracy_precision != 0)
  {
    if (v27 < 0.0)
    {
      v33 = @"FOGHORN_ELEVATION_APPROXIMATE_NEGATIVE_METERS";
      uint64_t v34 = @"FOGHORN_ELEVATION_APPROXIMATE_NEGATIVE_FEET";
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (shouldApproximateAltitude_accuracy_precision)
  {
LABEL_26:
    v33 = @"FOGHORN_ELEVATION_APPROXIMATE_METERS";
    uint64_t v34 = @"FOGHORN_ELEVATION_APPROXIMATE_FEET";
    goto LABEL_28;
  }
  if (v29 && v27 < 0.0)
  {
    v33 = @"FOGHORN_ELEVATION_NEGATIVE_METERS";
    uint64_t v34 = @"FOGHORN_ELEVATION_NEGATIVE_FEET";
  }
  else
  {
    v33 = @"FOGHORN_ELEVATION_METERS";
    uint64_t v34 = @"FOGHORN_ELEVATION_FEET";
  }
LABEL_28:
  if (v10) {
    objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v30, (uint64_t)v34, (uint64_t)&stru_26FB0CCF0);
  }
  else {
  uint64_t v35 = objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v30, (uint64_t)v33, (uint64_t)&stru_26FB0CCF0);
  }
  v41[0] = *MEMORY[0x263F577C0];
  v41[1] = @"elevation";
  v42[0] = v15;
  v42[1] = v15;
  v41[2] = @"elevationUnit";
  v42[2] = v16;
  v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v42, (uint64_t)v41, 3);
  uint64_t v39 = objc_msgSend_ntk_attributedStringFromAttributesTable_markdownFormat_(MEMORY[0x263F086A0], v38, (uint64_t)v37, (uint64_t)v35, v31);

  return v39;
}

+ (id)_attributedStringForActiveDepth:(double)a3 maxDepth:(double)a4 beyondLimit:(BOOL)a5 inFeet:(BOOL)a6 depthAttributes:(id)a7 depthUnitAttributes:(id)a8 maxDepthAttributes:(id)a9 maxDepthUnitAttributes:(id)a10
{
  BOOL v13 = a6;
  BOOL v14 = a5;
  v41[6] = *MEMORY[0x263EF8340];
  id v18 = a9;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  double v24 = objc_msgSend__stringForDepth_inFeet_(a1, v22, v13, v23, a3);
  double v27 = objc_msgSend__stringForDepth_inFeet_(a1, v25, v13, v26, a4);
  uint64_t v31 = objc_msgSend__maxDepthImageAttributesFromMaxDepthAttributes_(a1, v28, (uint64_t)v18, v29);
  uint64_t v32 = @"FOGHORN_DEPTH_MAXDEPTH_METERS_PLUS";
  if (v13)
  {
    uint64_t v32 = @"FOGHORN_DEPTH_MAXDEPTH_FEET_PLUS";
    v33 = @"FOGHORN_DEPTH_MAXDEPTH_FEET";
  }
  else
  {
    v33 = @"FOGHORN_DEPTH_MAXDEPTH_METERS";
  }
  if (v14) {
    objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v30, (uint64_t)v32, (uint64_t)&stru_26FB0CCF0);
  }
  else {
  uint64_t v34 = objc_msgSend_localizedMarkdownStringForKey_comment_(NTKFoghornFaceBundle, v30, (uint64_t)v33, (uint64_t)&stru_26FB0CCF0);
  }
  v40[0] = *MEMORY[0x263F577C0];
  v40[1] = @"depth";
  v41[0] = v21;
  v41[1] = v21;
  v40[2] = @"depthUnit";
  v40[3] = @"maxDepthImage";
  v41[2] = v20;
  void v41[3] = v31;
  v40[4] = @"maxDepth";
  v40[5] = @"maxDepthUnit";
  v41[4] = v18;
  v41[5] = v19;
  v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v41, (uint64_t)v40, 6);
  uint64_t v38 = objc_msgSend_ntk_attributedStringFromAttributesTable_markdownFormat_(MEMORY[0x263F086A0], v37, (uint64_t)v36, (uint64_t)v34, v24, v27);

  return v38;
}

- (void)_updateDepthUnits
{
  objc_msgSend_formattingManager(MEMORY[0x263F3F150], a2, v2, v3);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = objc_msgSend_unitManager(v27, v5, v6, v7);
  id v12 = objc_msgSend_userDepthHKUnit(v8, v9, v10, v11);
  id v16 = objc_msgSend_unitString(v12, v13, v14, v15);
  id v20 = objc_msgSend_meterUnit(MEMORY[0x263F0A830], v17, v18, v19);
  double v24 = objc_msgSend_unitString(v20, v21, v22, v23);
  self->_useMetricUnitsForDepth = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26);
}

- (void)_updateBaseLabelBaslineOffsetForAttributedText:(id)a3
{
  id v4 = a3;
  objc_msgSend_frame(self, v5, v6, v7);
  objc_msgSend_boundingRectWithSize_options_context_(v4, v8, 8, 0, v9, 2.0);
  double v11 = v10;

  if (v11 < -2.5) {
    UICeilToViewScale();
  }
  baseLabelBaselineConstraint = self->_baseLabelBaselineConstraint;

  MEMORY[0x270F9A6D0](baseLabelBaselineConstraint, sel_setConstant_, v12, v13);
}

- (void)_updateBaseLabelForDepthBezel
{
  v75[2] = *MEMORY[0x263EF8340];
  BOOL useMetricUnitsForDepth = self->_useMetricUnitsForDepth;
  id v4 = self->_baseLabelFont;
  uint64_t v7 = self->_baseLabelUnitFont;
  submergedDepthMadouble x = self->_submergedDepthMax;
  if (self->_submerged)
  {
    double submergedDepth = self->_submergedDepth;
    if (submergedDepth <= self->_submergedDepthLimit)
    {
      id v16 = self->_depthLabelColor;
      depthMaxLabelColor = self->_depthMaxLabelColor;
      uint64_t v30 = v7;
      uint64_t v31 = *MEMORY[0x263F814F0];
      v70[0] = *MEMORY[0x263F81500];
      uint64_t v29 = v70[0];
      v70[1] = v31;
      v71[0] = v16;
      v71[1] = v4;
      uint64_t v32 = NSDictionary;
      v33 = depthMaxLabelColor;
      uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v32, v34, (uint64_t)v71, (uint64_t)v70, 2);
      v68[0] = v29;
      v68[1] = v31;
      v69[0] = v16;
      v69[1] = v30;
      uint64_t v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v69, (uint64_t)v68, 2);
      v66[0] = v29;
      v66[1] = v31;
      v67[0] = v33;
      v67[1] = v4;
      uint64_t v59 = v4;
      v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v67, (uint64_t)v66, 2);
      v64[0] = v29;
      v64[1] = v31;
      v65[0] = v33;
      v65[1] = v30;
      uint64_t v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v65, (uint64_t)v64, 2);
      if (useMetricUnitsForDepth) {
        double submergedDepthLabelLimitMeters = self->_submergedDepthLabelLimitMeters;
      }
      else {
        double submergedDepthLabelLimitMeters = self->_submergedDepthLabelLimitFeet / 3.2808399;
      }
      BOOL v47 = !useMetricUnitsForDepth;
      BOOL v48 = submergedDepthMax > submergedDepthLabelLimitMeters;
      if (submergedDepthMax > submergedDepthLabelLimitMeters) {
        submergedDepthMadouble x = submergedDepthLabelLimitMeters;
      }
      uint64_t v49 = objc_opt_class();

      uint64_t v41 = objc_msgSend__attributedStringForActiveDepth_maxDepth_beyondLimit_inFeet_depthAttributes_depthUnitAttributes_maxDepthAttributes_maxDepthUnitAttributes_(v49, v50, v48, v47, v18, v58, v37, v39, submergedDepth, submergedDepthMax);

      uint64_t v7 = v30;
      id v4 = v59;
      goto LABEL_23;
    }
    depthOverLimitColor = self->_depthOverLimitColor;
    uint64_t v12 = *MEMORY[0x263F814F0];
    v74[0] = *MEMORY[0x263F81500];
    uint64_t v11 = v74[0];
    v74[1] = v12;
    v75[0] = depthOverLimitColor;
    v75[1] = v4;
    uint64_t v13 = NSDictionary;
    uint64_t v14 = depthOverLimitColor;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v15, (uint64_t)v75, (uint64_t)v74, 2);
    id v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v72[0] = v11;
    v72[1] = v12;
    v73[0] = v14;
    v73[1] = v7;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v73, (uint64_t)v72, 2);
    if (useMetricUnitsForDepth) {
      double v19 = self->_submergedDepthLabelLimitMeters;
    }
    else {
      double v19 = self->_submergedDepthLabelLimitFeet / 3.2808399;
    }
    uint64_t v44 = objc_opt_class();

    uint64_t v46 = objc_msgSend__attributedStringForBeyondLimitDepth_showPrefix_inFeet_depthAttributes_depthUnitAttributes_(v44, v45, 0, !useMetricUnitsForDepth, v16, v18, v19);
LABEL_22:
    uint64_t v41 = (void *)v46;
LABEL_23:

    objc_msgSend__updateBaseLabelBaslineOffsetForAttributedText_(self, v56, (uint64_t)v41, v57);
    goto LABEL_24;
  }
  if (submergedDepthMax > 0.0)
  {
    id v20 = self->_depthMaxLabelColor;
    uint64_t v22 = *MEMORY[0x263F814F0];
    v62[0] = *MEMORY[0x263F81500];
    uint64_t v21 = v62[0];
    v62[1] = v22;
    v63[0] = v20;
    v63[1] = v4;
    uint64_t v23 = NSDictionary;
    double v24 = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v23, v25, (uint64_t)v63, (uint64_t)v62, 2);
    id v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v60[0] = v21;
    v60[1] = v22;
    v61[0] = v24;
    v61[1] = v7;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v61, (uint64_t)v60, 2);
    if (useMetricUnitsForDepth) {
      double v27 = self->_submergedDepthLabelLimitMeters;
    }
    else {
      double v27 = self->_submergedDepthLabelLimitFeet / 3.2808399;
    }
    BOOL v51 = !useMetricUnitsForDepth;
    BOOL v52 = submergedDepthMax > v27;
    if (submergedDepthMax <= v27) {
      double v53 = submergedDepthMax;
    }
    else {
      double v53 = v27;
    }
    uint64_t v54 = objc_opt_class();

    uint64_t v46 = objc_msgSend__attributedStringForMaxDepth_beyondLimit_inFeet_depthAttributes_depthUnitAttributes_(v54, v55, v52, v51, v16, v18, v53);
    goto LABEL_22;
  }
  uint64_t v41 = 0;
  objc_msgSend__updateBaseLabelBaslineOffsetForAttributedText_(self, v5, 0, v6);
LABEL_24:
  objc_msgSend_setAttributedText_(self->_baseLabel, v42, (uint64_t)v41, v43);
}

- (void)_updateBaseLabelForElevationBezel
{
  void v68[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], a2, v2, v3);
  BOOL v8 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x263EFF560], v7);
  int v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);

  uint64_t v13 = v12 ^ 1u;
  BOOL elevationIsValid = self->_elevationIsValid;
  uint64_t v15 = self->_baseLabelFont;
  uint64_t v18 = self->_baseLabelUnitFont;
  double v19 = &qword_2691D47D8;
  double v20 = -INFINITY;
  double v21 = INFINITY;
  uint64_t v22 = (double *)&qword_2691D47D8;
  uint64_t v23 = &qword_2691D47D8;
  do
  {
    if (v19 >= (uint64_t *)&OBJC_PROTOCOL___CLKTimeFormatterObserver) {
      break;
    }
    double v25 = *((double *)v19 + 4);
    double v24 = *((double *)v19 + 5);
    if (v24 < v21)
    {
      uint64_t v23 = v19;
      double v21 = *((double *)v19 + 5);
    }
    if (v25 > v20)
    {
      uint64_t v22 = (double *)v19;
      double v20 = *((double *)v19 + 4);
    }
    v19 += 9;
  }
  while (v24 > INFINITY || v25 < INFINITY);
  if ((v12 & 1) == 0)
  {
    double v21 = 3.2808399;
    double v27 = *v22 / 3.2808399;
    double v20 = *((double *)v23 + 1);
    double v28 = v20 / 3.2808399;
    if (elevationIsValid) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v41 = 0;
    objc_msgSend__updateBaseLabelBaslineOffsetForAttributedText_(self, v16, 0, v17, v20, v21);
    goto LABEL_25;
  }
  double v27 = v22[4];
  double v28 = *((double *)v23 + 5);
  if (!elevationIsValid) {
    goto LABEL_23;
  }
LABEL_13:
  double elevation = self->_elevation;
  uint64_t v30 = *MEMORY[0x263F81500];
  if (v28 > elevation || elevation > v27)
  {
    depthOverLimitColor = self->_depthOverLimitColor;
    uint64_t v33 = *MEMORY[0x263F814F0];
    v63[0] = *MEMORY[0x263F81500];
    v63[1] = v33;
    v64[0] = depthOverLimitColor;
    v64[1] = v15;
    uint64_t v34 = NSDictionary;
    uint64_t v35 = depthOverLimitColor;
    BOOL v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v34, v36, (uint64_t)v64, (uint64_t)v63, 2);
    v61[0] = v30;
    v61[1] = v33;
    v62[0] = v35;
    v62[1] = v18;
    double v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v62, (uint64_t)v61, 2);
    if (elevation >= 0.0) {
      double v38 = v27;
    }
    else {
      double v38 = v28;
    }
    uint64_t v39 = objc_opt_class();

    uint64_t v56 = objc_msgSend__attributedStringForBeyondLimitDepth_showPrefix_inFeet_depthAttributes_depthUnitAttributes_(v39, v40, 1, v13, v51, v53, v38);
  }
  else
  {
    elevationAccuracdouble y = self->_elevationAccuracy;
    double elevationPrecision = self->_elevationPrecision;
    depthLabelColor = self->_depthLabelColor;
    uint64_t v47 = *MEMORY[0x263F814F0];
    v67[0] = *MEMORY[0x263F81500];
    v67[1] = v47;
    v68[0] = depthLabelColor;
    v68[1] = v15;
    BOOL v48 = NSDictionary;
    uint64_t v49 = depthLabelColor;
    BOOL v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v48, v50, (uint64_t)v68, (uint64_t)v67, 2);
    v65[0] = v30;
    v65[1] = v47;
    v66[0] = v49;
    v66[1] = v18;
    double v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v66, (uint64_t)v65, 2);
    uint64_t v54 = objc_opt_class();

    uint64_t v56 = objc_msgSend__attributedStringForActiveElevation_accuracy_precision_showPrefix_inFeet_valueAttributes_unitAttributes_(v54, v55, 1, v13, v51, v53, elevation, elevationAccuracy, elevationPrecision);
  }
  uint64_t v41 = (void *)v56;

  objc_msgSend__updateBaseLabelBaslineOffsetForAttributedText_(self, v57, (uint64_t)v41, v58, v59, v60);
LABEL_25:
  objc_msgSend_setAttributedText_(self->_baseLabel, v42, (uint64_t)v41, v43);
}

- (void)_drawSecondsBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5
{
  double v9 = self->_majorTickColor;
  uint64_t v10 = self->_minorTickColor;
  uint64_t v11 = self->_inactiveMajorTickColor;
  uint64_t v15 = self->_inactiveMinorTickColor;
  double seconds = self->_seconds;
  p_layoutConstants = &self->_layoutConstants;
  double bezelActiveWidth = self->_layoutConstants.bezelActiveWidth;
  double bezelInactiveWidth = self->_layoutConstants.bezelInactiveWidth;
  if (seconds > 60.0 - self->_secondsEndOfMinuteAnimationDuration)
  {
    unint64_t secondsEndOfMinuteAnimationStyle = self->_secondsEndOfMinuteAnimationStyle;
    if (secondsEndOfMinuteAnimationStyle == 3)
    {
      CLKInterpolateBetweenFloatsClipped();
      double bezelActiveWidth = v21;
    }
    else if (secondsEndOfMinuteAnimationStyle == 2 || secondsEndOfMinuteAnimationStyle == 1)
    {
      CLKInterpolateBetweenFloatsClipped();
      double seconds = v22;
    }
  }
  if (a4 > 1.0 || fabs(a4 + -1.0) < 0.00000011920929)
  {
    double v24 = v11;

    double v25 = v15;
    double seconds = 0.0;
    double v9 = v24;
    uint64_t v10 = v25;
    double bezelActiveWidth = bezelInactiveWidth;
  }
  else if (a4 > 0.0 && fabs(a4) >= 0.00000011920929)
  {
    unint64_t secondsTritiumAnimationStyle = self->_secondsTritiumAnimationStyle;
    if (secondsTritiumAnimationStyle == 3)
    {
      CLKInterpolateBetweenFloatsClipped();
      double bezelActiveWidth = v26;
    }
    else if (secondsTritiumAnimationStyle == 2 || secondsTritiumAnimationStyle == 1)
    {
      CLKInterpolateBetweenFloatsClipped();
      double seconds = v27;
    }
  }
  if (a5 < 1.0)
  {
    uint64_t v28 = objc_msgSend_colorWithAlphaComponent_(v9, v12, v13, v14, a5);

    uint64_t v32 = objc_msgSend_colorWithAlphaComponent_(v10, v29, v30, v31, a5);

    uint64_t v36 = objc_msgSend_colorWithAlphaComponent_(v11, v33, v34, v35, a5);
    v37 = v11;
    uint64_t v11 = (UIColor *)v36;

    uint64_t v41 = objc_msgSend_colorWithAlphaComponent_(v15, v38, v39, v40, a5);
    v42 = v15;
    uint64_t v15 = (UIColor *)v41;

    double v9 = (UIColor *)v28;
    uint64_t v10 = (UIColor *)v32;
  }
  BOOL showingStatusIndicator = self->_showingStatusIndicator;
  uint64_t v43 = self->_superEllipseGeometry;
  uint64_t v44 = v9;
  uint64_t v45 = v10;
  uint64_t v46 = v11;
  uint64_t v47 = v15;
  __y[0] = 0.0;
  double v48 = modf(seconds + seconds, __y);
  unsigned int v49 = __y[0];
  CGContextSaveGState(a3);
  v101 = v44;
  double v53 = (CGColor *)objc_msgSend_CGColor(v101, v50, v51, v52);
  v100 = v45;
  uint64_t v57 = objc_msgSend_CGColor(v100, v54, v55, v56);
  v99 = v46;
  uint64_t v96 = objc_msgSend_CGColor(v99, v58, v59, v60);
  v98 = v47;
  uint64_t v95 = objc_msgSend_CGColor(v98, v61, v62, v63);
  CGContextSetStrokeColorWithColor(a3, v53);
  CGContextSetLineCap(a3, kCGLineCapRound);
  CGContextSetLineWidth(a3, bezelActiveWidth);
  CGFloat MidX = CGRectGetMidX(p_layoutConstants->bezelOuterRect);
  CGFloat MidY = CGRectGetMidY(p_layoutConstants->bezelOuterRect);
  CGContextTranslateCTM(a3, MidX, MidY);
  int v66 = 0;
  p_bezelMedialLength = &p_layoutConstants->bezelMedialLength;
  p_bezelMinorLength = &p_layoutConstants->bezelMinorLength;
  unsigned int v97 = v49 % 0x78;
  unsigned int v69 = v49 % 0x78 + 1;
  double v70 = 0.0;
  do
  {
    double v71 = 1.57079633 - v70 + 6.28318531;
    if (1.57079633 - v70 >= 0.0) {
      double v71 = 1.57079633 - v70;
    }
    if (v66) {
      uint64_t v72 = (CGColor *)v57;
    }
    else {
      uint64_t v72 = v53;
    }
    CGFloat v105 = 0.0;
    CGFloat v106 = 0.0;
    CGFloat v103 = 0.0;
    CGFloat v104 = 0.0;
    if (v66) {
      uint64_t v73 = &p_layoutConstants->bezelMinorLength;
    }
    else {
      uint64_t v73 = &p_layoutConstants->bezelMedialLength;
    }
    NTKSuperEllipseRectGeometryGetRadialPoints((uint64_t)v43, &v103, &v105, v71, *v73);
    sub_246B0D714(a3, v72, showingStatusIndicator, 1.57079633 - v70, v103, v104, v105, v106, bezelActiveWidth);
    double v70 = v70 + 0.0523598776;
    ++v66;
  }
  while (v69 != v66);
  uint64_t v74 = v43;
  unsigned int v75 = v97 + 1;
  if (v48 <= 0.0)
  {
    BOOL v76 = showingStatusIndicator;
  }
  else
  {
    BOOL v76 = showingStatusIndicator;
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v78 = v77;
    uint64_t v79 = a3;
    CGContextSetLineWidth(a3, v77);
    if (v75) {
      v80 = v98;
    }
    else {
      v80 = v99;
    }
    v81 = v101;
    if (v75)
    {
      v81 = v100;
      v82 = &p_layoutConstants->bezelMinorLength;
    }
    else
    {
      v82 = &p_layoutConstants->bezelMedialLength;
    }
    id v83 = v81;
    v84 = v80;
    a3 = v79;
    v85 = v84;
    MEMORY[0x24C541D90](v48);
    id v86 = objc_claimAutoreleasedReturnValue();
    v90 = (CGColor *)objc_msgSend_CGColor(v86, v87, v88, v89);
    CGFloat v105 = 0.0;
    CGFloat v106 = 0.0;
    CGFloat v103 = 0.0;
    CGFloat v104 = 0.0;
    double v91 = 1.57079633 - v70 + 6.28318531;
    if (1.57079633 - v70 >= 0.0) {
      double v91 = 1.57079633 - v70;
    }
    NTKSuperEllipseRectGeometryGetRadialPoints((uint64_t)v74, &v103, &v105, v91, *v82);

    sub_246B0D714(a3, v90, showingStatusIndicator, 1.57079633 - v70, v103, v104, v105, v106, v78);
    double v70 = v70 + 0.0523598776;
    unsigned int v75 = v97 + 2;
  }
  CGContextSetLineWidth(a3, bezelInactiveWidth);
  if (v75 <= 0x77)
  {
    do
    {
      double v92 = 1.57079633 - v70 + 6.28318531;
      if (1.57079633 - v70 >= 0.0) {
        double v92 = 1.57079633 - v70;
      }
      if (v75) {
        v93 = (CGColor *)v95;
      }
      else {
        v93 = (CGColor *)v96;
      }
      CGFloat v105 = 0.0;
      CGFloat v106 = 0.0;
      CGFloat v103 = 0.0;
      CGFloat v104 = 0.0;
      if (v75) {
        uint64_t v94 = p_bezelMinorLength;
      }
      else {
        uint64_t v94 = p_bezelMedialLength;
      }
      NTKSuperEllipseRectGeometryGetRadialPoints((uint64_t)v74, &v103, &v105, v92, *v94);
      sub_246B0D714(a3, v93, v76, 1.57079633 - v70, v103, v104, v105, v106, bezelInactiveWidth);
      double v70 = v70 + 0.0523598776;
      ++v75;
    }
    while (v75 != 120);
  }
  CGContextRestoreGState(a3);
}

- (void)_drawDepthBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5
{
  BOOL submerged = self->_submerged;
  if (self->_submerged && self->_submergedDepth > self->_submergedDepthLimit)
  {
    uint64_t v155 = self->_depthOverLimitColor;
    objc_msgSend_clearColor(MEMORY[0x263F825C8], v9, v10, v11);
    uint64_t v137 = (UIColor *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0;
    id v16 = v155;
    uint64_t v145 = v155;
    uint64_t v17 = v155;
    v154 = v155;
    uint64_t v147 = v155;
    v149 = v155;
    uint64_t v150 = v155;
    uint64_t v152 = v155;
    uint64_t v18 = v155;
    uint64_t v140 = v155;
    double v19 = v155;
  }
  else
  {
    uint64_t v155 = self->_majorTickColor;
    id v16 = self->_medialTickColor;
    uint64_t v145 = self->_minorTickColor;
    uint64_t v17 = self->_depthMaxMajorTickColor;
    v154 = self->_depthMaxMedialTickColor;
    uint64_t v147 = self->_depthMaxMinorTickColor;
    v149 = self->_depthLimitMajorTickColor;
    uint64_t v150 = self->_depthLimitMedialTickColor;
    uint64_t v152 = self->_depthLimitMinorTickColor;
    uint64_t v18 = self->_depthMarkerColor;
    uint64_t v140 = self->_depthMaxMarkerColor;
    double v19 = self->_depthLimitLabelColor;
    uint64_t v137 = self->_depthDecorationColor;
    uint64_t v15 = 1;
  }
  BOOL v20 = a4 <= 1.0;
  if (fabs(a4 + -1.0) < 0.00000011920929) {
    BOOL v20 = 0;
  }
  char v143 = v20;
  if (!v20)
  {
    uint64_t v135 = self->_depthLimitMajorTickColor;

    uint64_t v132 = self->_depthLimitMedialTickColor;
    double v38 = self->_depthLimitMinorTickColor;

    uint64_t v130 = self->_depthLimitMajorTickColor;
    v128 = self->_depthLimitMedialTickColor;

    uint64_t v126 = self->_depthLimitMinorTickColor;
    v124 = self->_depthLimitMajorTickColor;

    uint64_t v122 = self->_depthLimitMedialTickColor;
    uint64_t v39 = self->_depthLimitMinorTickColor;

    uint64_t v43 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v40, v41, v42);

    objc_msgSend_clearColor(MEMORY[0x263F825C8], v44, v45, v46);
    uint64_t v48 = v47 = v19;

    unsigned int v49 = self->_depthLimitLabelColor;
    uint64_t v37 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v50, v51, v52);
    unsigned __int8 v142 = 0;
    uint64_t v139 = 0;
    uint64_t v155 = v135;
    uint64_t v17 = v130;
    id v16 = v132;
    uint64_t v145 = v38;
    v154 = v128;
    uint64_t v147 = v126;
    v149 = v124;
    uint64_t v150 = v122;
    uint64_t v152 = v39;
    double v26 = (void *)v43;
    uint64_t v30 = (void *)v48;
    double v19 = v49;
    uint64_t v33 = v137;
    goto LABEL_12;
  }
  unsigned __int8 v142 = submerged;
  uint64_t v139 = v15;
  if (a4 <= 0.0)
  {
    double v53 = v137;
    double v26 = v18;
    uint64_t v30 = v140;
    goto LABEL_13;
  }
  double v21 = v155;
  if (fabs(a4) >= 0.00000011920929)
  {
    uint64_t v134 = MEMORY[0x24C541D90](v155, self->_depthLimitMajorTickColor, a4);

    uint64_t v131 = MEMORY[0x24C541D90](v16, self->_depthLimitMedialTickColor, a4);

    uint64_t v129 = MEMORY[0x24C541D90](v145, self->_depthLimitMinorTickColor, a4);

    uint64_t v127 = MEMORY[0x24C541D90](v17, self->_depthLimitMajorTickColor, a4);

    uint64_t v125 = MEMORY[0x24C541D90](v154, self->_depthLimitMedialTickColor, a4);

    uint64_t v123 = MEMORY[0x24C541D90](v147, self->_depthLimitMinorTickColor, a4);

    uint64_t v121 = MEMORY[0x24C541D90](v149, self->_depthLimitMajorTickColor, a4);

    uint64_t v120 = MEMORY[0x24C541D90](v150, v150, a4);

    uint64_t v22 = MEMORY[0x24C541D90](v152, self->_depthLimitMinorTickColor, a4);

    double v26 = objc_msgSend_colorWithAlphaComponent_(self->_depthMarkerColor, v23, v24, v25, 1.0 - a4);

    uint64_t v30 = objc_msgSend_colorWithAlphaComponent_(self->_depthMaxMarkerColor, v27, v28, v29, 1.0 - a4);

    uint64_t v31 = MEMORY[0x24C541D90](v19, self->_depthLimitLabelColor, a4);
    uint64_t v32 = v19;
    double v19 = (UIColor *)v31;

    uint64_t v33 = v137;
    uint64_t v37 = objc_msgSend_colorWithAlphaComponent_(v137, v34, v35, v36, 1.0 - a4);
    uint64_t v155 = (UIColor *)v134;
    id v16 = (UIColor *)v131;
    uint64_t v145 = (UIColor *)v129;
    uint64_t v17 = (UIColor *)v127;
    v154 = (UIColor *)v125;
    uint64_t v147 = (UIColor *)v123;
    v149 = (UIColor *)v121;
    uint64_t v150 = (UIColor *)v120;
    uint64_t v152 = (UIColor *)v22;
LABEL_12:

    double v53 = (void *)v37;
LABEL_13:
    double v21 = v155;
    goto LABEL_14;
  }
  double v53 = v137;
  double v26 = v18;
  uint64_t v30 = v140;
LABEL_14:
  if (a5 >= 1.0)
  {
    CGFloat v103 = a3;
    v98 = v145;
    unint64_t v104 = 0x2691D4000uLL;
    char v105 = v143;
    v101 = v150;
    v102 = v152;
    v99 = v147;
    v100 = v149;
  }
  else
  {
    uint64_t v156 = v21;
    uint64_t v141 = objc_msgSend_colorWithAlphaComponent_(v21, v12, v13, v14, a5);

    uint64_t v157 = objc_msgSend_colorWithAlphaComponent_(v16, v54, v55, v56, a5);

    uint64_t v138 = objc_msgSend_colorWithAlphaComponent_(v145, v57, v58, v59, a5);

    uint64_t v146 = objc_msgSend_colorWithAlphaComponent_(v17, v60, v61, v62, a5);

    uint64_t v136 = objc_msgSend_colorWithAlphaComponent_(v154, v63, v64, v65, a5);

    uint64_t v133 = objc_msgSend_colorWithAlphaComponent_(v147, v66, v67, v68, a5);

    uint64_t v148 = objc_msgSend_colorWithAlphaComponent_(v149, v69, v70, v71, a5);

    uint64_t v75 = objc_msgSend_colorWithAlphaComponent_(v150, v72, v73, v74, a5);

    uint64_t v79 = objc_msgSend_colorWithAlphaComponent_(v152, v76, v77, v78, a5);

    uint64_t v83 = objc_msgSend_colorWithAlphaComponent_(v30, v80, v81, v82, a5);
    v84 = v30;
    uint64_t v30 = (void *)v83;

    objc_msgSend_colorWithAlphaComponent_(v26, v85, v86, v87, a5);
    uint64_t v89 = v88 = v19;

    uint64_t v93 = objc_msgSend_colorWithAlphaComponent_(v88, v90, v91, v92, a5);

    objc_msgSend_colorWithAlphaComponent_(v53, v94, v95, v96, a5);
    double v53 = v97 = v53;

    double v21 = (void *)v141;
    v98 = (void *)v138;
    uint64_t v17 = (UIColor *)v146;
    v154 = (UIColor *)v136;
    v99 = (void *)v133;
    v100 = (void *)v148;
    v101 = (void *)v75;
    v102 = (void *)v79;
    id v16 = (UIColor *)v157;
    double v26 = (void *)v89;
    double v19 = (UIColor *)v93;
    CGFloat v103 = a3;
    unint64_t v104 = 0x2691D4000;
    char v105 = v143;
  }
  uint64_t v151 = v17;
  v153 = v16;
  superEllipseGeometrdouble y = self->_superEllipseGeometry;
  depthTextLines = self->_depthTextLines;
  textLines = self->_depthLimitLabelCache.textLines;
  double submergedDepthLabelLimitFeet = self->_submergedDepthLabelLimitFeet;
  double v110 = *(double *)((char *)&self->super.super.super.isa + *(int *)(v104 + 1440));
  p_layoutConstants = &self->_layoutConstants;
  submergedDepthMadouble x = self->_submergedDepthMax;
  double v113 = -self->_submergedDepthLabelLimitMeters;
  v159[4] = 0;
  v159[8] = 0;
  *(double *)&v159[5] = v113;
  v159[6] = 0x3FF0000000000000;
  v159[7] = 0x50000000ALL;
  v159[0] = 0;
  *(double *)&v159[1] = -submergedDepthLabelLimitFeet;
  v159[2] = 0x4014000000000000;
  v159[3] = 0x200000004;
  v119 = v17;
  v158 = v21;
  v114 = v16;
  uint64_t v115 = v98;
  uint64_t v116 = v101;
  uint64_t v117 = v100;
  v118 = v99;
  sub_246B0D84C(v103, &p_layoutConstants->bezelOuterRect, superEllipseGeometry, depthTextLines, textLines, v21, v114, v98, v110, submergedDepthMax, v119, v154, v99, v100, v101, v102, v26, v30, v19,
    v139,
    v53,
    (uint64_t)v159,
    v142,
    v105);
}

- (void)_drawElevationBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5
{
  BOOL elevationIsValid = self->_elevationIsValid;
  if (self->_elevationIsValid) {
    double elevation = self->_elevation;
  }
  else {
    double elevation = 0.0;
  }
  v149[0] = 0;
  uint64_t v137 = (double *)sub_246B08704(v149, elevation);
  int v13 = v149[0];
  if (!v149[0])
  {
    BOOL v20 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v10, v11, v12);
    uint64_t v23 = objc_msgSend_objectForKey_(v20, v21, *MEMORY[0x263EFF560], v22);
    char v27 = objc_msgSend_BOOLValue(v23, v24, v25, v26);

    if (v27)
    {
      if (elevation >= 0.0) {
        double elevation = v137[4];
      }
      else {
        double elevation = v137[5];
      }
    }
    else
    {
      double v30 = v137[1];
      if (v30 / 3.2808399 < elevation && elevation < *v137 / 3.2808399)
      {
        v149[0] = 1;
        if (elevationIsValid) {
          goto LABEL_7;
        }
LABEL_21:
        v144 = self->_depthMaxMajorTickColor;
        uint64_t v14 = self->_depthMaxMedialTickColor;
        uint64_t v15 = self->_depthMaxMinorTickColor;
        id v16 = self->_depthMaxMajorTickColor;
        uint64_t v138 = self->_depthMaxMedialTickColor;
        uint64_t v130 = self->_depthMaxMinorTickColor;
        uint64_t v17 = self->_depthMaxMajorTickColor;
        uint64_t v18 = self->_depthMaxMedialTickColor;
        uint64_t v133 = self->_depthMaxMinorTickColor;
        objc_msgSend_clearColor(MEMORY[0x263F825C8], v32, v33, v34);
        unsigned __int8 v142 = (UIColor *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clearColor(MEMORY[0x263F825C8], v35, v36, v37);
        double v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (elevation >= 0.0) {
        double elevation = *v137 / 3.2808399;
      }
      else {
        double elevation = v30 / 3.2808399;
      }
    }
  }
  if (!elevationIsValid) {
    goto LABEL_21;
  }
  if (v13)
  {
LABEL_7:
    v144 = self->_majorTickColor;
    uint64_t v14 = self->_medialTickColor;
    uint64_t v15 = self->_minorTickColor;
    id v16 = self->_depthMaxMajorTickColor;
    uint64_t v138 = self->_depthMaxMedialTickColor;
    uint64_t v130 = self->_depthMaxMinorTickColor;
    uint64_t v17 = self->_depthLimitMajorTickColor;
    uint64_t v18 = self->_depthLimitMedialTickColor;
    uint64_t v133 = self->_depthLimitMinorTickColor;
    unsigned __int8 v142 = self->_depthMarkerColor;
    double v19 = self->_depthMaxMarkerColor;
LABEL_22:
    uint64_t v29 = v19;
    depthLimitLabelColor = self->_depthLimitLabelColor;
    goto LABEL_23;
  }
  depthLimitLabelColor = self->_depthOverLimitColor;
  v144 = depthLimitLabelColor;
  uint64_t v14 = depthLimitLabelColor;
  uint64_t v15 = depthLimitLabelColor;
  id v16 = depthLimitLabelColor;
  uint64_t v138 = depthLimitLabelColor;
  uint64_t v130 = depthLimitLabelColor;
  uint64_t v133 = depthLimitLabelColor;
  uint64_t v17 = depthLimitLabelColor;
  uint64_t v18 = depthLimitLabelColor;
  unsigned __int8 v142 = depthLimitLabelColor;
  uint64_t v29 = depthLimitLabelColor;
LABEL_23:
  char v143 = depthLimitLabelColor;
  if (a4 > 1.0 || fabs(a4 + -1.0) < 0.00000011920929)
  {
    v128 = self->_depthLimitMajorTickColor;

    uint64_t v54 = v29;
    uint64_t v145 = self->_depthLimitMedialTickColor;

    uint64_t v126 = self->_depthLimitMinorTickColor;
    uint64_t v44 = self->_depthLimitMajorTickColor;

    uint64_t v43 = self->_depthLimitMedialTickColor;
    uint64_t v139 = self->_depthLimitMinorTickColor;

    uint64_t v131 = self->_depthLimitMajorTickColor;
    v124 = self->_depthLimitMedialTickColor;

    uint64_t v45 = self->_depthLimitMinorTickColor;
    uint64_t v49 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v55, v56, v57);

    uint64_t v29 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v58, v59, v60);

    double v53 = self->_depthLimitLabelColor;
    unsigned __int8 v135 = 0;
    goto LABEL_29;
  }
  unsigned __int8 v135 = elevationIsValid;
  if (a4 > 0.0 && fabs(a4) >= 0.00000011920929)
  {
    MEMORY[0x24C541D90](v144, self->_depthLimitMajorTickColor, a4);
    v128 = (UIColor *)objc_claimAutoreleasedReturnValue();

    uint64_t v41 = v29;
    MEMORY[0x24C541D90](v14, self->_depthLimitMedialTickColor, a4);
    uint64_t v145 = (UIColor *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x24C541D90](v15, self->_depthLimitMinorTickColor, a4);
    uint64_t v126 = (UIColor *)objc_claimAutoreleasedReturnValue();

    uint64_t v42 = MEMORY[0x24C541D90](v16, self->_depthLimitMajorTickColor, a4);

    MEMORY[0x24C541D90](v138, self->_depthLimitMedialTickColor, a4);
    uint64_t v43 = (UIColor *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x24C541D90](v130, self->_depthLimitMinorTickColor, a4);
    uint64_t v139 = (UIColor *)objc_claimAutoreleasedReturnValue();

    uint64_t v44 = (UIColor *)v42;
    MEMORY[0x24C541D90](v17, self->_depthLimitMajorTickColor, a4);
    uint64_t v131 = (UIColor *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x24C541D90](v18, self->_depthLimitMedialTickColor, a4);
    v124 = (UIColor *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x24C541D90](v133, self->_depthLimitMinorTickColor, a4);
    uint64_t v45 = (UIColor *)objc_claimAutoreleasedReturnValue();

    uint64_t v49 = objc_msgSend_colorWithAlphaComponent_(v142, v46, v47, v48, 1.0 - a4);

    uint64_t v29 = objc_msgSend_colorWithAlphaComponent_(v41, v50, v51, v52, 1.0 - a4);

    MEMORY[0x24C541D90](v143, self->_depthLimitLabelColor, a4);
    double v53 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_29:

    uint64_t v62 = v126;
    uint64_t v61 = v128;
    uint64_t v63 = v145;
    uint64_t v64 = v139;
    uint64_t v17 = v131;
    uint64_t v65 = v124;
    int v66 = v45;
    unsigned __int8 v142 = (UIColor *)v49;
    char v143 = v53;
    goto LABEL_31;
  }
  uint64_t v63 = v14;
  uint64_t v62 = v15;
  uint64_t v44 = v16;
  uint64_t v64 = v130;
  int v66 = v133;
  uint64_t v65 = v18;
  uint64_t v43 = v138;
  uint64_t v61 = v144;
LABEL_31:
  if (a5 >= 1.0)
  {
    double v110 = v44;
    v108 = v63;
    v109 = v62;
  }
  else
  {
    uint64_t v67 = v66;
    uint64_t v68 = v64;
    unsigned int v69 = v65;
    uint64_t v146 = v61;
    uint64_t v140 = objc_msgSend_colorWithAlphaComponent_(v61, v38, v39, v40, a5);

    uint64_t v147 = objc_msgSend_colorWithAlphaComponent_(v63, v70, v71, v72, a5);

    uint64_t v76 = objc_msgSend_colorWithAlphaComponent_(v62, v73, v74, v75, a5);

    uint64_t v134 = objc_msgSend_colorWithAlphaComponent_(v44, v77, v78, v79, a5);

    uint64_t v132 = objc_msgSend_colorWithAlphaComponent_(v43, v80, v81, v82, a5);

    uint64_t v129 = objc_msgSend_colorWithAlphaComponent_(v68, v83, v84, v85, a5);

    uint64_t v127 = objc_msgSend_colorWithAlphaComponent_(v17, v86, v87, v88, a5);

    uint64_t v125 = objc_msgSend_colorWithAlphaComponent_(v69, v89, v90, v91, a5);

    uint64_t v95 = objc_msgSend_colorWithAlphaComponent_(v67, v92, v93, v94, a5);

    uint64_t v99 = objc_msgSend_colorWithAlphaComponent_(v29, v96, v97, v98, a5);

    uint64_t v103 = objc_msgSend_colorWithAlphaComponent_(v142, v100, v101, v102, a5);

    uint64_t v107 = objc_msgSend_colorWithAlphaComponent_(v143, v104, v105, v106, a5);

    uint64_t v61 = (void *)v140;
    v108 = (void *)v147;
    v109 = (void *)v76;
    uint64_t v43 = (UIColor *)v132;
    double v110 = (void *)v134;
    uint64_t v64 = (void *)v129;
    uint64_t v65 = (void *)v125;
    int v66 = (void *)v95;
    unsigned __int8 v142 = (UIColor *)v103;
    char v143 = (UIColor *)v107;
    uint64_t v29 = (void *)v99;
    uint64_t v17 = (UIColor *)v127;
  }
  uint64_t v141 = v43;
  superEllipseGeometrdouble y = self->_superEllipseGeometry;
  p_layoutConstants = &self->_layoutConstants;
  depthTextLines = self->_depthTextLines;
  textLines = self->_elevationLimitLabelCache.textLines;
  double v115 = -elevation;
  if (elevation >= 0.0) {
    double v115 = elevation;
  }
  uint64_t v123 = v17;
  uint64_t v122 = v43;
  uint64_t v116 = v66;
  uint64_t v117 = v64;
  v118 = v17;
  v119 = v65;
  uint64_t v148 = v61;
  uint64_t v120 = v108;
  uint64_t v121 = v110;
  sub_246B0D84C(a3, &p_layoutConstants->bezelOuterRect, superEllipseGeometry, depthTextLines, textLines, v61, v108, v109, v115, v115, v110, v122, v64, v123, v65, v66, v142, v29, v143,
    0,
    0,
    (uint64_t)v137,
    v135,
    0);
}

- (id)_harmoniaOvernightSummaryLabelColor
{
  unint64_t dataState = self->_harmoniaSummaryOvernightLabelCache.dataState;
  if (dataState < 4)
  {
    uint64_t v3 = &OBJC_IVAR___NTKFoghornFaceBezelView__harmoniaUnitLabelColor;
LABEL_3:
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *v3);
    goto LABEL_4;
  }
  if (dataState == 4)
  {
    unint64_t harmoniaOvernightChangesThreshold = self->_harmoniaOvernightChangesThreshold;
    if (harmoniaOvernightChangesThreshold <= 2)
    {
      uint64_t v3 = off_2651F6B08[harmoniaOvernightChangesThreshold];
      goto LABEL_3;
    }
  }
LABEL_4:

  return (id)(id)a2;
}

- (id)_harmoniaTrainingSummaryLabelColor
{
  unint64_t dataState = self->_harmoniaSummaryTrainingLabelCache.dataState;
  if (dataState < 4)
  {
    uint64_t v3 = &OBJC_IVAR___NTKFoghornFaceBezelView__harmoniaUnitLabelColor;
LABEL_3:
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *v3);
    goto LABEL_4;
  }
  if (dataState == 4)
  {
    unint64_t harmoniaTrainingLoadBand = self->_harmoniaTrainingLoadBand;
    if (harmoniaTrainingLoadBand <= 4)
    {
      uint64_t v3 = off_2651F6B20[harmoniaTrainingLoadBand];
      goto LABEL_3;
    }
  }
LABEL_4:

  return (id)(id)a2;
}

- (void)_drawHarmoniaBezelInContext:(CGContext *)a3 tritiumProgress:(double)a4 alpha:(double)a5
{
  uint64_t v451 = *MEMORY[0x263EF8340];
  BOOL v8 = self->_harmoniaUnitLabelColor;
  v404 = self->_harmoniaOvernightTypicalColor;
  obuint64_t j = self->_harmoniaOvernightPartiallyOutOfRangeColor;
  v400 = self->_harmoniaOvernightOutOfRangeColor;
  v397 = self->_harmoniaTrainingWellBelowColor;
  v395 = self->_harmoniaTrainingBelowColor;
  v381 = self->_harmoniaTrainingNearColor;
  v376 = self->_harmoniaTrainingAboveColor;
  double v9 = self->_harmoniaTrainingWellAboveColor;
  uint64_t v10 = self->_depthLimitMinorTickColor;
  v372 = self->_harmoniaEmphasizedTickColor;
  v393 = self->_harmoniaDotFillColor;
  v368 = objc_msgSend__harmoniaOvernightSummaryLabelColor(self, v11, v12, v13);
  v406 = objc_msgSend__harmoniaTrainingSummaryLabelColor(self, v14, v15, v16);
  if (a4 > 1.0 || fabs(a4 + -1.0) < 0.00000011920929)
  {
    v365 = self->_harmoniaUnitLabelColor;

    theArrayc = self->_harmoniaOvernightTypicalColor;
    v358 = self->_harmoniaOvernightPartiallyOutOfRangeColor;

    v355 = self->_harmoniaOvernightOutOfRangeColor;
    v352 = self->_harmoniaTrainingWellBelowColor;

    v350 = self->_harmoniaTrainingBelowColor;
    v390 = self->_harmoniaTrainingNearColor;

    uint64_t v35 = self->_harmoniaTrainingAboveColor;
    uint64_t v36 = self->_harmoniaTrainingWellAboveColor;

    uint64_t v37 = self->_depthLimitMinorTickColor;
    uint64_t v23 = self->_harmoniaEmphasizedTickColor;

    uint64_t v34 = objc_msgSend__harmoniaOvernightSummaryLabelColor(self, v38, v39, v40);

    uint64_t v33 = objc_msgSend__harmoniaTrainingSummaryLabelColor(self, v41, v42, v43);
    BOOL v8 = v365;
    obuint64_t j = v358;
    v404 = theArrayc;
    v400 = v355;
    v395 = v350;
    v397 = v352;
    v381 = v390;
    double v9 = v36;
    uint64_t v10 = v37;

    goto LABEL_7;
  }
  if (a4 > 0.0 && fabs(a4) >= 0.00000011920929)
  {
    uint64_t v364 = MEMORY[0x24C541D90](v8, self->_harmoniaUnitLabelColor, a4);

    MEMORY[0x24C541D90](v404, self->_harmoniaOvernightTypicalColor, a4);
    CFArrayRef theArrayb = (CFArrayRef)objc_claimAutoreleasedReturnValue();

    uint64_t v357 = MEMORY[0x24C541D90](obj, self->_harmoniaOvernightPartiallyOutOfRangeColor, a4);

    uint64_t v20 = MEMORY[0x24C541D90](v400, self->_harmoniaOvernightOutOfRangeColor, a4);

    uint64_t v21 = MEMORY[0x24C541D90](v397, self->_harmoniaTrainingWellBelowColor, a4);

    MEMORY[0x24C541D90](v395, self->_harmoniaTrainingBelowColor, a4);
    v354 = (UIColor *)objc_claimAutoreleasedReturnValue();

    uint64_t v389 = MEMORY[0x24C541D90](v381, self->_harmoniaTrainingNearColor, a4);

    uint64_t v386 = MEMORY[0x24C541D90](v376, self->_harmoniaTrainingAboveColor, a4);

    uint64_t v383 = MEMORY[0x24C541D90](v9, self->_harmoniaTrainingWellAboveColor, a4);

    uint64_t v22 = MEMORY[0x24C541D90](v10, self->_depthLimitMinorTickColor, a4);

    MEMORY[0x24C541D90](v372, self->_harmoniaEmphasizedTickColor, a4);
    uint64_t v23 = (UIColor *)objc_claimAutoreleasedReturnValue();

    char v27 = objc_msgSend__harmoniaOvernightSummaryLabelColor(self, v24, v25, v26);
    uint64_t v28 = MEMORY[0x24C541D90](v368, v27, a4);

    uint64_t v32 = objc_msgSend__harmoniaTrainingSummaryLabelColor(self, v29, v30, v31);
    uint64_t v33 = MEMORY[0x24C541D90](v406, v32, a4);

    v407 = (void *)v32;
    BOOL v8 = (UIColor *)v364;
    obuint64_t j = (UIColor *)v357;
    v404 = (UIColor *)theArrayb;
    v400 = (UIColor *)v20;
    v395 = v354;
    v397 = (UIColor *)v21;
    v381 = (UIColor *)v389;
    double v9 = (UIColor *)v383;
    uint64_t v10 = (UIColor *)v22;
    uint64_t v34 = (void *)v28;
    uint64_t v35 = (UIColor *)v386;

LABEL_7:
    v406 = (void *)v33;
    goto LABEL_9;
  }
  uint64_t v34 = v368;
  uint64_t v23 = v372;
  uint64_t v35 = v376;
LABEL_9:
  uint64_t v44 = v8;
  uint64_t v45 = v9;
  if (a5 >= 1.0)
  {
    uint64_t v92 = v393;
    v370 = v34;
    v374 = v23;
    v348 = v45;
    uint64_t v75 = v10;
    v378 = v35;
    v346 = v44;
  }
  else
  {
    uint64_t v46 = objc_msgSend_colorWithAlphaComponent_(v8, v17, v18, v19, a5);

    uint64_t v391 = objc_msgSend_colorWithAlphaComponent_(v404, v47, v48, v49, a5);

    uint64_t v387 = objc_msgSend_colorWithAlphaComponent_(obj, v50, v51, v52, a5);

    uint64_t v384 = objc_msgSend_colorWithAlphaComponent_(v400, v53, v54, v55, a5);

    uint64_t v379 = objc_msgSend_colorWithAlphaComponent_(v397, v56, v57, v58, a5);

    uint64_t v377 = objc_msgSend_colorWithAlphaComponent_(v395, v59, v60, v61, a5);

    uint64_t v373 = objc_msgSend_colorWithAlphaComponent_(v381, v62, v63, v64, a5);

    uint64_t v369 = objc_msgSend_colorWithAlphaComponent_(v35, v65, v66, v67, a5);

    uint64_t v71 = objc_msgSend_colorWithAlphaComponent_(v45, v68, v69, v70, a5);

    uint64_t v75 = objc_msgSend_colorWithAlphaComponent_(v10, v72, v73, v74, a5);

    uint64_t v79 = objc_msgSend_colorWithAlphaComponent_(v393, v76, v77, v78, a5);

    uint64_t v83 = objc_msgSend_colorWithAlphaComponent_(v23, v80, v81, v82, a5);

    uint64_t v87 = objc_msgSend_colorWithAlphaComponent_(v34, v84, v85, v86, a5);

    uint64_t v91 = objc_msgSend_colorWithAlphaComponent_(v406, v88, v89, v90, a5);

    v346 = (void *)v46;
    obuint64_t j = (UIColor *)v387;
    v404 = (UIColor *)v391;
    v400 = (UIColor *)v384;
    v395 = (UIColor *)v377;
    v397 = (UIColor *)v379;
    v381 = (UIColor *)v373;
    v374 = (void *)v83;
    v378 = (void *)v369;
    v348 = (void *)v71;
    uint64_t v92 = (void *)v79;
    v370 = (void *)v87;
    v406 = (void *)v91;
  }
  p_layoutConstants = &self->_layoutConstants;
  theArradouble y = self->_harmoniaTextLines;
  line = self->_harmoniaSummaryOvernightLabelCache.line;
  harmoniaOvernightTypicalValues = self->_harmoniaOvernightTypicalValues;
  harmoniaOvernightChangeAboveValues = self->_harmoniaOvernightChangeAboveValues;
  harmoniaOvernightChangeBelowValues = self->_harmoniaOvernightChangeBelowValues;
  harmoniaOvernightMarkers = self->_harmoniaOvernightMarkers;
  unint64_t harmoniaOvernightChangesThreshold = self->_harmoniaOvernightChangesThreshold;
  v342 = self->_harmoniaSummaryTrainingLabelCache.line;
  harmoniaTrainingMarkers = self->_harmoniaTrainingMarkers;
  unint64_t harmoniaTrainingLoadBand = self->_harmoniaTrainingLoadBand;
  harmoniaTrainingValue = self->_harmoniaTrainingValue;
  v100 = self->_superEllipseGeometry;
  v392 = harmoniaOvernightTypicalValues;
  v394 = harmoniaOvernightChangeAboveValues;
  v388 = harmoniaOvernightChangeBelowValues;
  uint64_t v101 = harmoniaOvernightMarkers;
  v343 = harmoniaTrainingMarkers;
  v380 = harmoniaTrainingValue;
  id v345 = v75;
  id v385 = v92;
  id v356 = v374;
  v405 = v404;
  v366 = obj;
  v367 = v400;
  v347 = v397;
  v351 = v395;
  v359 = v381;
  id v353 = v378;
  id v349 = v348;
  id v102 = v346;
  id v103 = v370;
  id v104 = v406;
  double bezelDepthStartAngle = p_layoutConstants->bezelDepthStartAngle;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)v100, 3.14159265);
  double v107 = v106;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)v100, bezelDepthStartAngle);
  double v109 = v108;
  double v110 = v107 - v108;
  CGFloat MidX = CGRectGetMidX(p_layoutConstants->bezelOuterRect);
  CGFloat MidY = CGRectGetMidY(p_layoutConstants->bezelOuterRect);
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, MidX, MidY);
  double bezelHarmoniaLabelPositionOffset = p_layoutConstants->bezelHarmoniaLabelPositionOffset;
  p_double x = &p_layoutConstants->bezelOuterRect.origin.x;
  double v114 = (p_layoutConstants->bezelHarmoniaMajorTickLength - p_layoutConstants->bezelHarmoniaMinorTickLength) * 0.5;
  ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(theArray, 0);
  id v116 = v102;
  uint64_t v120 = (CGColor *)objc_msgSend_CGColor(v116, v117, v118, v119);
  v398 = v100;
  sub_246B0E7A4(a3, v100, v120, ValueAtIndex, 0, 0, v110 - bezelHarmoniaLabelPositionOffset, v114);
  v408 = objc_opt_new();
  long long v438 = 0u;
  long long v439 = 0u;
  long long v440 = 0u;
  long long v441 = 0u;
  obja = v101;
  uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v121, (uint64_t)&v438, (uint64_t)v450, 16);
  if (v125)
  {
    uint64_t v126 = *(void *)v439;
    do
    {
      for (uint64_t i = 0; i != v125; ++i)
      {
        if (*(void *)v439 != v126) {
          objc_enumerationMutation(obja);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v438 + 1) + 8 * i), v122, v123, v124, harmoniaTrainingLoadBand);
        objc_msgSend_addIndex_(v408, v129, (uint64_t)(float)((float)(v128 * -24.0) + 24.0), v130);
      }
      uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v122, (uint64_t)&v438, (uint64_t)v450, 16);
    }
    while (v125);
  }

  id v131 = v345;
  uint64_t v135 = objc_msgSend_CGColor(v131, v132, v133, v134);
  id v136 = v131;
  uint64_t v140 = objc_msgSend_CGColor(v136, v137, v138, v139);
  double v141 = v109 + v109;
  double v142 = sub_246B0EDEC(a3, &p_layoutConstants->bezelOuterRect.origin.x, v398, v135, v140, v408, v109 + v109, v110);
  id v375 = v103;
  uint64_t v146 = (CGColor *)objc_msgSend_CGColor(v375, v143, v144, v145);
  sub_246B0E7A4(a3, v398, v146, line, 0, 1, bezelHarmoniaLabelPositionOffset + bezelHarmoniaLabelPositionOffset + v110 - bezelHarmoniaLabelPositionOffset + v142, v114);
  uint64_t v147 = (const __CTLine *)CFArrayGetValueAtIndex(theArray, 1);
  id v371 = v116;
  uint64_t v151 = (CGColor *)objc_msgSend_CGColor(v371, v148, v149, v150);
  sub_246B0E7A4(a3, v398, v151, v147, 2, 0, v109 + bezelHarmoniaLabelPositionOffset, v114);
  uint64_t v152 = objc_opt_new();
  long long v436 = 0u;
  long long v437 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  v401 = v343;
  uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v153, (uint64_t)&v434, (uint64_t)v449, 16);
  if (v157)
  {
    uint64_t v158 = *(void *)v435;
    do
    {
      for (uint64_t j = 0; j != v157; ++j)
      {
        if (*(void *)v435 != v158) {
          objc_enumerationMutation(v401);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v434 + 1) + 8 * j), v154, v155, v156, harmoniaTrainingLoadBand);
        objc_msgSend_addIndex_(v152, v161, (uint64_t)(float)((float)(v160 * -24.0) + 24.0), v162);
      }
      uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v154, (uint64_t)&v434, (uint64_t)v449, 16);
    }
    while (v157);
  }

  id v163 = v136;
  uint64_t v167 = objc_msgSend_CGColor(v163, v164, v165, v166);
  CFArrayRef theArraya = (CFArrayRef)v163;
  uint64_t v171 = objc_msgSend_CGColor(theArraya, v168, v169, v170);
  double v172 = -v141;
  double v173 = sub_246B0EDEC(a3, p_x, v398, v167, v171, v152, -v141, v109);
  id v382 = v104;
  id v177 = (CGColor *)objc_msgSend_CGColor(v382, v174, v175, v176);
  sub_246B0E7A4(a3, v398, v177, v342, 2, 1, v109 + bezelHarmoniaLabelPositionOffset - v173 - bezelHarmoniaLabelPositionOffset - bezelHarmoniaLabelPositionOffset, v114);
  id v178 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v182 = objc_msgSend_count(v394, v179, v180, v181);
  uint64_t v186 = objc_msgSend_count(v388, v183, v184, v185);
  uint64_t v190 = objc_msgSend_count(v392, v187, v188, v189);
  v193 = objc_msgSend_initWithCapacity_(v178, v191, v186 + v182 + v190, v192);
  uint64_t v428 = 0;
  v429 = &v428;
  uint64_t v430 = 0x3032000000;
  v431 = sub_246B0EF34;
  v432 = sub_246B0EF44;
  id v433 = 0;
  uint64_t v422 = 0;
  v423 = &v422;
  uint64_t v424 = 0x3032000000;
  v425 = sub_246B0EF34;
  v426 = sub_246B0EF44;
  id v427 = 0;
  v421[0] = MEMORY[0x263EF8330];
  v421[1] = 3221225472;
  v421[2] = sub_246B0EF4C;
  v421[3] = &unk_2651F6AC0;
  v421[4] = &v428;
  v421[5] = &v422;
  uint64_t v194 = (uint64_t (**)(void, void))MEMORY[0x24C542160](v421);
  v195 = v366;
  if (harmoniaOvernightChangesThreshold != 1) {
    v195 = v367;
  }
  uint64_t v196 = v195;
  long long v417 = 0u;
  long long v418 = 0u;
  long long v419 = 0u;
  long long v420 = 0u;
  uint64_t v199 = objc_msgSend_sortedArrayUsingSelector_(v394, v197, (uint64_t)sel_compare_, v198);
  uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v417, (uint64_t)v448, 16);
  if (v201)
  {
    uint64_t v202 = *(void *)v418;
    do
    {
      for (uint64_t k = 0; k != v201; ++k)
      {
        if (*(void *)v418 != v202) {
          objc_enumerationMutation(v199);
        }
        uint64_t v204 = v194[2](v194, *(void *)(*((void *)&v417 + 1) + 8 * k));
        sub_246B0F030(0.7, v204, v196);
        id v205 = objc_claimAutoreleasedReturnValue();
        uint64_t v209 = objc_msgSend_CGColor(v205, v206, v207, v208);
        objc_msgSend_addObject_(v193, v210, v209, v211);
      }
      uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v212, (uint64_t)&v417, (uint64_t)v448, 16);
    }
    while (v201);
  }

  long long v415 = 0u;
  long long v416 = 0u;
  long long v413 = 0u;
  long long v414 = 0u;
  v215 = objc_msgSend_sortedArrayUsingSelector_(v392, v213, (uint64_t)sel_compare_, v214);
  uint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v216, (uint64_t)&v413, (uint64_t)v447, 16);
  if (v217)
  {
    uint64_t v218 = *(void *)v414;
    do
    {
      for (uint64_t m = 0; m != v217; ++m)
      {
        if (*(void *)v414 != v218) {
          objc_enumerationMutation(v215);
        }
        uint64_t v220 = v194[2](v194, *(void *)(*((void *)&v413 + 1) + 8 * m));
        sub_246B0F030(0.7, v220, v405);
        id v221 = objc_claimAutoreleasedReturnValue();
        uint64_t v225 = objc_msgSend_CGColor(v221, v222, v223, v224);
        objc_msgSend_addObject_(v193, v226, v225, v227);
      }
      uint64_t v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v228, (uint64_t)&v413, (uint64_t)v447, 16);
    }
    while (v217);
  }

  long long v411 = 0u;
  long long v412 = 0u;
  long long v409 = 0u;
  long long v410 = 0u;
  long long v231 = objc_msgSend_sortedArrayUsingSelector_(v388, v229, (uint64_t)sel_compare_, v230);
  uint64_t v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v231, v232, (uint64_t)&v409, (uint64_t)v446, 16);
  if (v233)
  {
    uint64_t v234 = *(void *)v410;
    do
    {
      for (uint64_t n = 0; n != v233; ++n)
      {
        if (*(void *)v410 != v234) {
          objc_enumerationMutation(v231);
        }
        uint64_t v236 = v194[2](v194, *(void *)(*((void *)&v409 + 1) + 8 * n));
        sub_246B0F030(0.7, v236, v196);
        id v237 = objc_claimAutoreleasedReturnValue();
        uint64_t v241 = objc_msgSend_CGColor(v237, v238, v239, v240);
        objc_msgSend_addObject_(v193, v242, v241, v243);
      }
      uint64_t v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v231, v244, (uint64_t)&v409, (uint64_t)v446, 16);
    }
    while (v233);
  }

  if (objc_msgSend_count(v193, v245, v246, v247))
  {
    objc_msgSend_floatValue((void *)v429[5], v248, v249, v250);
    float v252 = v251;
    objc_msgSend_floatValue((void *)v423[5], v253, v254, v255);
    float v257 = v256;
    objc_msgSend_floatValue((void *)v429[5], v258, v259, v260);
    sub_246B0F0A8(a3, p_x, v398, v193, v110 + v142 * ((double)(uint64_t)(float)((float)(v252 * -24.0) + 24.0) / 48.0), v142 * ((double)(uint64_t)(float)((float)(v257 * -24.0) + 24.0) / 48.0)- v142 * ((double)(uint64_t)(float)((float)(v261 * -24.0) + 24.0) / 48.0));
  }
  if (v380)
  {
    uint64_t v262 = objc_msgSend_floatValue(v380, v248, v249, v250);
    float v267 = v266;
    switch(harmoniaTrainingLoadBand)
    {
      case 0uLL:
        sub_246B0F030(0.5, v262, v359);
        id v268 = objc_claimAutoreleasedReturnValue();
        uint64_t v443 = objc_msgSend_CGColor(v268, v269, v270, v271);
        sub_246B0F030(0.5, v443, v351);
        id v272 = objc_claimAutoreleasedReturnValue();
        uint64_t v444 = objc_msgSend_CGColor(v272, v273, v274, v275);
        sub_246B0F030(0.5, v444, v347);
        id v276 = objc_claimAutoreleasedReturnValue();
        uint64_t v445 = objc_msgSend_CGColor(v276, v277, v278, v279);
        uint64_t v281 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v280, (uint64_t)&v443, 3);
        goto LABEL_56;
      case 1uLL:
        sub_246B0F030(0.5, v262, v359);
        id v268 = objc_claimAutoreleasedReturnValue();
        uint64_t v443 = objc_msgSend_CGColor(v268, v301, v302, v303);
        sub_246B0F030(0.5, v443, v351);
        id v272 = objc_claimAutoreleasedReturnValue();
        uint64_t v444 = objc_msgSend_CGColor(v272, v304, v305, v306);
        uint64_t v289 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v307, (uint64_t)&v443, 2);
        goto LABEL_60;
      case 2uLL:
        sub_246B0F030(0.5, v262, v359);
        id v268 = objc_claimAutoreleasedReturnValue();
        uint64_t v443 = objc_msgSend_CGColor(v268, v282, v283, v284);
        sub_246B0F030(0.5, v443, v359);
        id v272 = objc_claimAutoreleasedReturnValue();
        uint64_t v444 = objc_msgSend_CGColor(v272, v285, v286, v287);
        uint64_t v289 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v288, (uint64_t)&v443, 2);
        goto LABEL_60;
      case 3uLL:
        sub_246B0F030(0.5, v262, v353);
        id v268 = objc_claimAutoreleasedReturnValue();
        uint64_t v443 = objc_msgSend_CGColor(v268, v308, v309, v310);
        sub_246B0F030(0.5, v443, v359);
        id v272 = objc_claimAutoreleasedReturnValue();
        uint64_t v444 = objc_msgSend_CGColor(v272, v311, v312, v313);
        uint64_t v289 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v314, (uint64_t)&v443, 2);
LABEL_60:
        v300 = (void *)v289;
        goto LABEL_61;
      case 4uLL:
        sub_246B0F030(0.5, v262, v349);
        id v268 = objc_claimAutoreleasedReturnValue();
        uint64_t v443 = objc_msgSend_CGColor(v268, v290, v291, v292);
        sub_246B0F030(0.5, v443, v353);
        id v272 = objc_claimAutoreleasedReturnValue();
        uint64_t v444 = objc_msgSend_CGColor(v272, v293, v294, v295);
        sub_246B0F030(0.5, v444, v359);
        id v276 = objc_claimAutoreleasedReturnValue();
        uint64_t v445 = objc_msgSend_CGColor(v276, v296, v297, v298);
        uint64_t v281 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v299, (uint64_t)&v443, 3);
LABEL_56:
        v300 = (void *)v281;

LABEL_61:
        break;
      default:
        v300 = 0;
        break;
    }
    objc_msgSend_floatValue(&unk_26FB11CE8, v263, v264, v265, harmoniaTrainingLoadBand);
    sub_246B0F0A8(a3, p_x, v398, v300, (double)(uint64_t)(float)((float)(v315 * -24.0) + 24.0) / 48.0, v109 + v173 * ((double)(uint64_t)(float)((float)(v267 * -24.0) + 24.0) / -48.0));
    id v316 = v356;
    uint64_t v320 = objc_msgSend_CGColor(v316, v317, v318, v319);
    objc_msgSend_clearColor(MEMORY[0x263F825C8], v321, v322, v323);
    id v324 = objc_claimAutoreleasedReturnValue();
    uint64_t v328 = objc_msgSend_CGColor(v324, v325, v326, v327);
    v331 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v329, 24, v330);
    sub_246B0EDEC(a3, p_x, v398, v320, v328, v331, v172, v109);
  }
  if (objc_msgSend_count(v394, v248, v249, v250, harmoniaTrainingLoadBand)) {
    sub_246B0F1FC(a3, p_x, v398, v394, v385, v196, v110, v142, 1.0);
  }
  if (objc_msgSend_count(v392, v332, v333, v334)) {
    sub_246B0F1FC(a3, p_x, v398, v392, v385, v405, v110, v142, 1.0);
  }
  if (objc_msgSend_count(v388, v335, v336, v337)) {
    sub_246B0F1FC(a3, p_x, v398, v388, v385, v196, v110, v142, 1.0);
  }
  if (v380)
  {
    v442 = v380;
    v339 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v338, (uint64_t)&v442, 1);
    sub_246B0F1FC(a3, p_x, v398, v339, v385, v382, v109, v173, -1.0);
  }
  CGContextRestoreGState(a3);

  _Block_object_dispose(&v422, 8);
  _Block_object_dispose(&v428, 8);
}

- (void)_drawBezelInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 tritiumProgress:(double)a5 alpha:(double)a6
{
  switch(a4)
  {
    case 1:
      MEMORY[0x270F9A6D0](self, sel__drawSecondsBezelInContext_tritiumProgress_alpha_, a3, a4);
      break;
    case 2:
      MEMORY[0x270F9A6D0](self, sel__drawDepthBezelInContext_tritiumProgress_alpha_, a3, a4);
      break;
    case 3:
      MEMORY[0x270F9A6D0](self, sel__drawElevationBezelInContext_tritiumProgress_alpha_, a3, a4);
      break;
    case 4:
      MEMORY[0x270F9A6D0](self, sel__drawHarmoniaBezelInContext_tritiumProgress_alpha_, a3, a4);
      break;
    default:
      return;
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend_bounds(self, v5, v6, v7);
  CGContextTranslateCTM(CurrentContext, 0.0, v8);
  double transitoryProgress = 1.0;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  int64_t transitoryBezelStyle = self->_transitoryBezelStyle;
  if (transitoryBezelStyle != self->_bezelStyle)
  {
    objc_msgSend__drawBezelInContext_bezelStyle_tritiumProgress_alpha_(self, v10, (uint64_t)CurrentContext, transitoryBezelStyle, 0.0, 1.0 - self->_transitoryProgress);
    double transitoryProgress = self->_transitoryProgress;
    int64_t transitoryBezelStyle = self->_bezelStyle;
  }
  double tritiumProgress = self->_tritiumProgress;

  objc_msgSend__drawBezelInContext_bezelStyle_tritiumProgress_alpha_(self, v10, (uint64_t)CurrentContext, transitoryBezelStyle, tritiumProgress, transitoryProgress);
}

- (void)setToSnapshotValues
{
  objc_msgSend_setSeconds_(self, a2, v2, v3, 30.0);
  objc_msgSend_setSubmergedDepthLimit_(self, v5, v6, v7, 40.0);
  objc_msgSend_setSubmergedDepthLabelLimitMeters_(self, v8, v9, v10, 40.0);
  objc_msgSend_setSubmergedDepthLabelLimitFeet_(self, v11, v12, v13, 130.0);
  objc_msgSend_setSubmergedDepthMax_(self, v14, v15, v16, 30.0);
  objc_msgSend_setSubmergedDepth_(self, v17, v18, v19, 20.0);
  objc_msgSend_setSubmerged_(self, v20, 1, v21);
  objc_msgSend_setElevation_(self, v22, v23, v24, 76.048);
  objc_msgSend_setElevationIsValid_(self, v25, 1, v26);
  objc_msgSend_setElevationPrecision_(self, v27, v28, v29, 0.0);
  objc_msgSend_setHarmoniaOvernightDataState_(self, v30, 4, v31);
  uint64_t v32 = NTKFoghornHarmoniaOvernightMarkersForDataState();
  objc_msgSend_setHarmoniaOvernightMarkers_(self, v33, (uint64_t)v32, v34);

  uint64_t v35 = NTKFoghornHarmoniaSnapshotOvernightTypicalValues();
  objc_msgSend_setHarmoniaOvernightTypicalValues_(self, v36, (uint64_t)v35, v37);

  double v38 = NTKFoghornHarmoniaSnapshotOvernightChangeAboveValues();
  objc_msgSend_setHarmoniaOvernightChangeAboveValues_(self, v39, (uint64_t)v38, v40);

  uint64_t v41 = NTKFoghornHarmoniaSnapshotOvernightChangeBelowValues();
  objc_msgSend_setHarmoniaOvernightChangeBelowValues_(self, v42, (uint64_t)v41, v43);

  objc_msgSend_setHarmoniaOvernightChangesThreshold_(self, v44, 1, v45);
  uint64_t v47 = NTKFoghornHarmoniaLocalizedStringForOvernightChangesCount(1, v46);
  objc_msgSend_setHarmoniaOvernightLocalizedSummary_(self, v48, (uint64_t)v47, v49);

  objc_msgSend_setHarmoniaTrainingDataState_(self, v50, 4, v51);
  objc_msgSend_setHarmoniaTrainingLoadBand_(self, v52, 3, v53);
  uint64_t v54 = NTKFoghornHarmoniaTrainingMarkersForDataState();
  objc_msgSend_setHarmoniaTrainingMarkers_(self, v55, (uint64_t)v54, v56);

  uint64_t v57 = NTKFoghornHarmoniaSnapshotTrainingValue();
  objc_msgSend_setHarmoniaTrainingValue_(self, v58, (uint64_t)v57, v59);

  NTKFoghornHarmoniaLocalizedStringForTrainingLoadBand(3uLL, v60);
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHarmoniaTrainingLocalizedSummary_(self, v61, (uint64_t)v63, v62);
}

+ (void)drawSnapshotInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 colorPalette:(id)a5 forDevice:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  uint64_t v11 = [NTKFoghornFaceBezelView alloc];
  objc_msgSend_screenBounds(v9, v12, v13, v14);
  id v30 = (id)objc_msgSend_initWithFrame_forDevice_(v11, v15, (uint64_t)v9, v16);

  objc_msgSend_setBezelStyle_(v30, v17, a4, v18);
  objc_msgSend_setColorPalette_(v30, v19, (uint64_t)v10, v20);

  objc_msgSend_setToSnapshotValues(v30, v21, v22, v23);
  char v27 = objc_msgSend_layer(v30, v24, v25, v26);
  objc_msgSend_renderInContext_(v27, v28, (uint64_t)a3, v29);
}

- (void)_transitionBaseLabelFromStyle:(int64_t)a3 toStyle:(int64_t)a4 progress:(double)a5
{
  int64_t v5 = a4;
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFFELL;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v8 == 2)
  {
    if (a5 >= 0.5)
    {
      double v10 = a5;
    }
    else
    {
      int64_t v5 = a3;
      double v10 = 1.0 - a5;
    }
  }
  else
  {
    if (v7 != 2 && v8 != 2)
    {
      double v10 = 1.0;
      objc_msgSend_setHidden_(self->_baseLabel, a2, 1, a4, a5);
      goto LABEL_15;
    }
    if (v7 == 2)
    {
      int64_t v5 = a3;
      double v10 = 1.0 - a5;
    }
    else
    {
      double v10 = a5;
    }
  }
  objc_msgSend_setHidden_(self->_baseLabel, a2, 0, a4, a5);
LABEL_15:
  objc_msgSend_setAlpha_(self->_baseLabel, v11, v12, v13, v10);
  if (v5 == 3)
  {
    objc_msgSend__updateBaseLabelForElevationBezel(self, v14, v15, v16);
  }
  else if (v5 == 2)
  {
    MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v15, v16);
  }
}

- (void)setBezelStyle:(int64_t)a3
{
  if (self->_bezelStyle != a3)
  {
    self->_bezelStyle = a3;
    self->_double transitoryProgress = 0.0;
    self->_int64_t transitoryBezelStyle = a3;
    objc_msgSend_setNeedsDisplay(self, a2, a3, v3);
    MEMORY[0x270F9A6D0](self, sel__transitionBaseLabelFromStyle_toStyle_progress_, a3, a3);
  }
}

- (void)setBezelFromStyle:(int64_t)a3 toStyle:(int64_t)a4 progress:(double)a5
{
  self->_double transitoryProgress = a5;
  self->_int64_t transitoryBezelStyle = a3;
  self->_bezelStyle = a4;
  objc_msgSend_setNeedsDisplay(self, a2, a3, a4);

  MEMORY[0x270F9A6D0](self, sel__transitionBaseLabelFromStyle_toStyle_progress_, a3, a4);
}

- (void)setTritiumProgress:(double)a3
{
  if (self->_tritiumProgress != a3)
  {
    self->_double tritiumProgress = a3;
    objc_msgSend_setNeedsDisplay(self, a2, v3, v4);
    int64_t bezelStyle = self->_bezelStyle;
    MEMORY[0x270F9A6D0](self, sel__transitionBaseLabelFromStyle_toStyle_progress_, bezelStyle, 0);
  }
}

- (void)setShowingStatusIndicator:(BOOL)a3
{
  if (self->_showingStatusIndicator != a3)
  {
    self->_BOOL showingStatusIndicator = a3;
    if (self->_bezelStyle == 1) {
      objc_msgSend_setNeedsDisplay(self, a2, a3, v3);
    }
  }
}

- (BOOL)_needUpdateForDeltaSeconds:(double)a3
{
  return fabs(a3) * self->_pixelsPerSecond > self->_pixelsVisibleChange;
}

- (void)setSeconds:(double)a3
{
  if (objc_msgSend__needUpdateForDeltaSeconds_(self, a2, v3, v4, a3 - self->_seconds))
  {
    self->_double seconds = a3;
    if (self->_bezelStyle == 1)
    {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (BOOL)_needUpdateForDeltaDepthElevation:(double)a3 range:(double)a4
{
  return a4 == 0.0 || fabs(a3 / a4) * self->_depthElevationBezelLength > self->_pixelsVisibleChange;
}

- (BOOL)_needBaseLabelUpdateForDeltaDepthElevation:(double)a3 range:(double)a4
{
  double v4 = fabs(a3) * 3.2808399;
  BOOL v5 = fabs(a4) <= 30.0;
  double v6 = 0.1;
  if (!v5) {
    double v6 = 1.0;
  }
  return v4 >= v6;
}

- (void)setSubmergedDepth:(double)a3
{
  double v7 = a3 - self->_submergedDepth;
  char v8 = objc_msgSend__needUpdateForDeltaDepthElevation_range_(self, a2, v3, v4, v7, self->_submergedDepthLimit);
  int v12 = objc_msgSend__needBaseLabelUpdateForDeltaDepthElevation_range_(self, v9, v10, v11, v7, self->_submergedDepthLimit);
  if ((v8 & 1) != 0 || v12)
  {
    self->_double submergedDepth = a3;
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, v13, v14, v15);
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v16, v17);
    }
  }
}

- (void)setSubmergedDepthMax:(double)a3
{
  double v7 = a3 - self->_submergedDepthMax;
  char v8 = objc_msgSend__needUpdateForDeltaDepthElevation_range_(self, a2, v3, v4, v7, self->_submergedDepthLimit);
  int v12 = objc_msgSend__needBaseLabelUpdateForDeltaDepthElevation_range_(self, v9, v10, v11, v7, self->_submergedDepthLimit);
  if ((v8 & 1) != 0 || v12)
  {
    self->_submergedDepthMadouble x = a3;
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, v13, v14, v15);
      if (a3 <= 0.0 && !self->_submerged) {
        objc_msgSend_setHidden_(self->_baseLabel, v16, 1, v17);
      }
      else {
        objc_msgSend_setHidden_(self->_baseLabel, v16, 0, v17);
      }
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v19, v20);
    }
  }
}

- (void)_updateLimitLabelCache:(id *)a3 limitFeet:(double)a4 limitMeters:(double)a5 limitsValid:(BOOL)a6
{
  BOOL v6 = a6;
  v49[3] = *MEMORY[0x263EF8340];
  if (a3->var1 != a4 || a3->var2 != a5 || a3->var3 != a6)
  {
    a3->var1 = a4;
    a3->var2 = a5;
    a3->var3 = a6;
    if (a3->var0)
    {
      CFRelease(a3->var0);
      a3->var0 = 0;
    }
    p_layoutConstants = &self->_layoutConstants;
    if (v6)
    {
      sub_246B0D5E4(0, 6, ceil(fabs(a4)));
      int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_246B0D5E4(0, 6, ceil(fabs(a5)));
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = @"--";
      int v12 = @"--";
    }
    id v14 = objc_alloc_init(MEMORY[0x263F81650]);
    objc_msgSend_setAlignment_(v14, v15, 1, v16);
    uint64_t v20 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v17, v18, v19);
    uint64_t v24 = objc_msgSend_foghornDepthBezelLabelFontOfSize_(MEMORY[0x263EFD198], v21, v22, v23, p_layoutConstants->bezelDepthBaseLabelUnitFontSize);
    uint64_t v25 = *MEMORY[0x263F814F0];
    v48[0] = *MEMORY[0x263F81500];
    v48[1] = v25;
    v49[0] = v20;
    v49[1] = v24;
    v48[2] = *MEMORY[0x263F81540];
    v49[2] = v14;
    char v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v49, (uint64_t)v48, 3);
    id v28 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v31 = objc_msgSend_initWithCapacity_(v28, v29, 2, v30);
    uint64_t v32 = (objc_class *)MEMORY[0x263F086A0];
    uint64_t v33 = v12;
    id v34 = [v32 alloc];
    uint64_t v36 = objc_msgSend_initWithString_attributes_(v34, v35, (uint64_t)v33, (uint64_t)v27);

    objc_msgSend_setObject_atIndexedSubscript_(v31, v37, (uint64_t)v36, 0);
    double v38 = (objc_class *)MEMORY[0x263F086A0];
    uint64_t v39 = v13;
    id v40 = [v38 alloc];
    uint64_t v42 = objc_msgSend_initWithString_attributes_(v40, v41, (uint64_t)v39, (uint64_t)v27);

    objc_msgSend_setObject_atIndexedSubscript_(v31, v43, (uint64_t)v42, 1);
    uint64_t v47 = objc_msgSend_copy(v31, v44, v45, v46);

    a3->var0 = sub_246B0585C(v47);
  }
}

- (void)_updateDepthLimitLabelsWithSubmergedDepthLimitMeters:(double)a3 feet:(double)a4
{
}

- (void)_limitsForElevation:(double)a3 elevationIsValid:(BOOL)a4 limitMeters:(double *)a5 limitFeet:(double *)a6
{
  double v9 = 0.0;
  double v10 = 0.0;
  if (a4)
  {
    uint64_t v11 = (double *)sub_246B08704(&v12, a3);
    if (a3 >= 0.0)
    {
      double v9 = v11[4];
      double v10 = *v11;
    }
    else
    {
      double v9 = -v11[5];
      double v10 = -v11[1];
    }
  }
  *a5 = v9;
  *a6 = v10;
}

- (void)_updateElevationLimitLabelsWithElevation:(double)a3 elevationIsValid:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = 0.0;
  double v8 = 0.0;
  objc_msgSend__limitsForElevation_elevationIsValid_limitMeters_limitFeet_(self, a2, a4, (uint64_t)&v8, &v7, a3);
  objc_msgSend__updateLimitLabelCache_limitFeet_limitMeters_limitsValid_(self, v6, (uint64_t)&self->_elevationLimitLabelCache, v4, v7, v8);
}

- (void)setSubmergedDepthLimit:(double)a3
{
  if (self->_submergedDepthLimit != a3)
  {
    self->_submergedDepthLimit = a3;
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, a2, v3, v4);
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v6, v7);
    }
  }
}

- (void)setSubmergedDepthLabelLimitMeters:(double)a3
{
  if (self->_submergedDepthLabelLimitMeters != a3)
  {
    self->_double submergedDepthLabelLimitMeters = a3;
    objc_msgSend__updateDepthLimitLabelsWithSubmergedDepthLimitMeters_feet_(self, a2, v3, v4);
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, v6, v7, v8);
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v9, v10);
    }
  }
}

- (void)setSubmergedDepthLabelLimitFeet:(double)a3
{
  if (self->_submergedDepthLabelLimitFeet != a3)
  {
    self->_double submergedDepthLabelLimitFeet = a3;
    objc_msgSend__updateDepthLimitLabelsWithSubmergedDepthLimitMeters_feet_(self, a2, v3, v4, self->_submergedDepthLabelLimitMeters);
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, v6, v7, v8);
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v9, v10);
    }
  }
}

- (void)setElevation:(double)a3
{
  double v21 = 0.0;
  double v22 = 0.0;
  objc_msgSend__limitsForElevation_elevationIsValid_limitMeters_limitFeet_(self, a2, self->_elevationIsValid, (uint64_t)&v22, &v21);
  double v5 = a3 - self->_elevation;
  char v9 = objc_msgSend__needUpdateForDeltaDepthElevation_range_(self, v6, v7, v8, v5, v22);
  int v13 = objc_msgSend__needBaseLabelUpdateForDeltaDepthElevation_range_(self, v10, v11, v12, v5, v22);
  if ((v9 & 1) != 0 || v13)
  {
    self->_double elevation = a3;
    objc_msgSend__updateLimitLabelCache_limitFeet_limitMeters_limitsValid_(self, v14, (uint64_t)&self->_elevationLimitLabelCache, self->_elevationIsValid, v21, v22);
    if (self->_bezelStyle == 3)
    {
      objc_msgSend_setNeedsDisplay(self, v15, v16, v17);
      objc_msgSend__updateBaseLabelForElevationBezel(self, v18, v19, v20);
    }
  }
}

- (void)setElevationAccuracy:(double)a3
{
  if (self->_elevationAccuracy != a3)
  {
    self->_elevationAccuracdouble y = a3;
    if (self->_bezelStyle == 3) {
      objc_msgSend__updateBaseLabelForElevationBezel(self, a2, v3, v4);
    }
  }
}

- (void)setElevationPrecision:(double)a3
{
  if (self->_elevationPrecision != a3)
  {
    self->_double elevationPrecision = a3;
    if (self->_bezelStyle == 3) {
      objc_msgSend__updateBaseLabelForElevationBezel(self, a2, v3, v4);
    }
  }
}

- (void)setElevationIsValid:(BOOL)a3
{
  if (self->_elevationIsValid != a3)
  {
    self->_BOOL elevationIsValid = a3;
    objc_msgSend__updateElevationLimitLabelsWithElevation_elevationIsValid_(self, a2, a3, v3, self->_elevation);
    if (self->_bezelStyle == 3)
    {
      objc_msgSend_setNeedsDisplay(self, v5, v6, v7);
      objc_msgSend__updateBaseLabelForElevationBezel(self, v8, v9, v10);
    }
  }
}

- (void)setMajorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_majorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_majorTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setMinorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_minorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minorTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setMedialTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_medialTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_medialTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setInactiveMajorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_inactiveMajorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_inactiveMajorTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setInactiveMedialTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_inactiveMedialTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_inactiveMedialTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setInactiveMinorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_inactiveMinorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_inactiveMinorTickColor, a3);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)setHarmoniaOvernightDataState:(unint64_t)a3
{
  if (self->_harmoniaOvernightDataState != a3)
  {
    self->_harmoniaOvernightDataState = a3;
    objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(self, a2, (uint64_t)&self->_harmoniaSummaryOvernightLabelCache, (uint64_t)self->_harmoniaOvernightLocalizedSummary, a3);
    if (self->_bezelStyle == 4)
    {
      objc_msgSend_setNeedsDisplay(self, v4, v5, v6);
    }
  }
}

- (void)setHarmoniaOvernightMarkers:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightMarkers, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightMarkers, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightTypicalValues:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightTypicalValues, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightTypicalValues, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightChangeAboveValues:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightChangeAboveValues, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightChangeAboveValues, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightChangeBelowValues:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightChangeBelowValues, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightChangeBelowValues, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightChangesThreshold:(unint64_t)a3
{
  if (self->_harmoniaOvernightChangesThreshold != a3)
  {
    self->_unint64_t harmoniaOvernightChangesThreshold = a3;
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, a2, a3, v3);
    }
  }
}

- (void)setHarmoniaOvernightLocalizedSummary:(id)a3
{
  p_harmoniaOvernightLocalizedSummardouble y = (uint64_t *)&self->_harmoniaOvernightLocalizedSummary;
  id v12 = a3;
  if ((objc_msgSend_isEqualToString_((void *)*p_harmoniaOvernightLocalizedSummary, v6, (uint64_t)v12, v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightLocalizedSummary, a3);
    objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(self, v8, (uint64_t)&self->_harmoniaSummaryOvernightLabelCache, *p_harmoniaOvernightLocalizedSummary, self->_harmoniaOvernightDataState);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v9, v10, v11);
    }
  }
}

- (void)setHarmoniaTrainingDataState:(unint64_t)a3
{
  if (self->_harmoniaTrainingDataState != a3)
  {
    self->_harmoniaTrainingDataState = a3;
    objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(self, a2, (uint64_t)&self->_harmoniaSummaryTrainingLabelCache, (uint64_t)self->_harmoniaTrainingLocalizedSummary, a3);
    if (self->_bezelStyle == 4)
    {
      objc_msgSend_setNeedsDisplay(self, v4, v5, v6);
    }
  }
}

- (void)setHarmoniaTrainingMarkers:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingMarkers, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingMarkers, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingLoadBand:(unint64_t)a3
{
  if (self->_harmoniaTrainingLoadBand != a3)
  {
    self->_unint64_t harmoniaTrainingLoadBand = a3;
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, a2, a3, v3);
    }
  }
}

- (void)setHarmoniaTrainingValue:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingValue, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingValue, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingLocalizedSummary:(id)a3
{
  p_harmoniaTrainingLocalizedSummardouble y = (uint64_t *)&self->_harmoniaTrainingLocalizedSummary;
  id v12 = a3;
  if ((objc_msgSend_isEqualToString_((void *)*p_harmoniaTrainingLocalizedSummary, v6, (uint64_t)v12, v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingLocalizedSummary, a3);
    objc_msgSend__updateHarmoniaSummaryLabelCache_withString_dataState_(self, v8, (uint64_t)&self->_harmoniaSummaryTrainingLabelCache, *p_harmoniaTrainingLocalizedSummary, self->_harmoniaTrainingDataState);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v9, v10, v11);
    }
  }
}

- (void)setSubmerged:(BOOL)a3
{
  if (self->_submerged != a3)
  {
    self->_BOOL submerged = a3;
    if (self->_bezelStyle == 2)
    {
      objc_msgSend_setNeedsDisplay(self, a2, a3, v3);
      if (a3) {
        objc_msgSend_setHidden_(self->_baseLabel, v6, 0, v7);
      }
      else {
        objc_msgSend_setHidden_(self->_baseLabel, v6, self->_submergedDepthMax <= 0.0, v7);
      }
      MEMORY[0x270F9A6D0](self, sel__updateBaseLabelForDepthBezel, v8, v9);
    }
  }
}

- (void)setDepthMaxMajorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMaxMajorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMaxMajorTickColor, a3);
    if (self->_bezelStyle == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthMaxMedialTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMaxMedialTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMaxMedialTickColor, a3);
    if (self->_bezelStyle == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthMaxMinorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMaxMinorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMaxMinorTickColor, a3);
    if (self->_bezelStyle == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthLimitMajorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthLimitMajorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthLimitMajorTickColor, a3);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthLimitMedialTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthLimitMedialTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthLimitMedialTickColor, a3);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthLimitMinorTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthLimitMinorTickColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthLimitMinorTickColor, a3);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthMarkerColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMarkerColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMarkerColor, a3);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthMaxMarkerColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMaxMarkerColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMaxMarkerColor, a3);
    if (self->_bezelStyle == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthLimitLabelColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthLimitLabelColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthLimitLabelColor, a3);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setDepthOverLimitColor:(id)a3
{
  id v13 = a3;
  if ((objc_msgSend_isEqual_(v13, v5, (uint64_t)self->_depthOverLimitColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthOverLimitColor, a3);
    objc_msgSend__updateBaseLabel(self, v7, v8, v9);
    if ((self->_bezelStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
      objc_msgSend_setNeedsDisplay(self, v10, v11, v12);
    }
  }
}

- (void)_updateBaseLabel
{
  int64_t bezelStyle = self->_bezelStyle;
  if (bezelStyle == 3)
  {
    objc_msgSend__updateBaseLabelForElevationBezel(self, a2, v2, v3);
  }
  else if (bezelStyle == 2)
  {
    ((void (*)(NTKFoghornFaceBezelView *, char *))MEMORY[0x270F9A6D0])(self, sel__updateBaseLabelForDepthBezel);
  }
}

- (void)setDepthLabelColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthLabelColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthLabelColor, a3);
    objc_msgSend__updateBaseLabel(self, v7, v8, v9);
  }
}

- (void)setDepthMaxLabelColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthMaxLabelColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthMaxLabelColor, a3);
    objc_msgSend__updateBaseLabel(self, v7, v8, v9);
  }
}

- (void)setDepthDecorationColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(v10, v5, (uint64_t)self->_depthDecorationColor, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_depthDecorationColor, a3);
    if (self->_bezelStyle == 2) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaUnitLabelColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaUnitLabelColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaUnitLabelColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaDotFillColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaDotFillColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaDotFillColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaEmphasizedTickColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaEmphasizedTickColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaEmphasizedTickColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightTypicalColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightTypicalColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightTypicalColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightPartiallyOutOfRangeColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightPartiallyOutOfRangeColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightPartiallyOutOfRangeColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaOvernightOutOfRangeColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaOvernightOutOfRangeColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaOvernightOutOfRangeColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingWellBelowColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingWellBelowColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingWellBelowColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingBelowColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingBelowColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingBelowColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingNearColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingNearColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingNearColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingAboveColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingAboveColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingAboveColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)setHarmoniaTrainingWellAboveColor:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend_isEqual_(self->_harmoniaTrainingWellAboveColor, v5, (uint64_t)v10, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_harmoniaTrainingWellAboveColor, a3);
    if (self->_bezelStyle == 4) {
      objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
    }
  }
}

- (void)_updateHarmoniaSummaryLabelCache:(id *)a3 withString:(id)a4 dataState:(unint64_t)a5
{
  v32[3] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = v9;
  if (*(_OWORD *)&a3->var1 != __PAIR128__(a5, (unint64_t)v9))
  {
    a3->var2 = a5;
    objc_storeStrong(&a3->var1, a4);
    if (a3->var0)
    {
      CFRelease(a3->var0);
      a3->var0 = 0;
    }
    p_layoutConstants = &self->_layoutConstants;
    uint64_t v12 = (objc_class *)MEMORY[0x263F81650];
    id v13 = v10;
    id v14 = objc_alloc_init(v12);
    objc_msgSend_setAlignment_(v14, v15, 1, v16);
    uint64_t v20 = objc_msgSend_systemPinkColor(MEMORY[0x263F825C8], v17, v18, v19);
    uint64_t v24 = objc_msgSend_foghornDepthBezelLabelFontOfSize_(MEMORY[0x263EFD198], v21, v22, v23, p_layoutConstants->bezelHarmoniaLabelFontSize);
    uint64_t v25 = *MEMORY[0x263F814F0];
    v31[0] = *MEMORY[0x263F81500];
    v31[1] = v25;
    v32[0] = v20;
    v32[1] = v24;
    v31[2] = *MEMORY[0x263F81540];
    v32[2] = v14;
    char v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v32, (uint64_t)v31, 3);
    id v28 = objc_alloc(MEMORY[0x263F086A0]);
    CFAttributedStringRef v30 = (const __CFAttributedString *)objc_msgSend_initWithString_attributes_(v28, v29, (uint64_t)v13, (uint64_t)v27);

    a3->var0 = CTLineCreateWithAttributedString(v30);
  }
}

- (void)setColorPalette:(id)a3
{
  uint64_t v4 = (NTKFoghornFaceColorPalette *)a3;
  uint64_t v8 = objc_msgSend_bezelMajorTickColor(v4, v5, v6, v7);
  objc_msgSend_setMajorTickColor_(self, v9, (uint64_t)v8, v10);

  id v14 = objc_msgSend_bezelMedialTickColor(v4, v11, v12, v13);
  objc_msgSend_setMedialTickColor_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_bezelMinorTickColor(v4, v17, v18, v19);
  objc_msgSend_setMinorTickColor_(self, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_bezelInactiveMajorTickColor(v4, v23, v24, v25);
  objc_msgSend_setInactiveMajorTickColor_(self, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_bezelInactiveMedialTickColor(v4, v29, v30, v31);
  objc_msgSend_setInactiveMedialTickColor_(self, v33, (uint64_t)v32, v34);

  double v38 = objc_msgSend_bezelInactiveMinorTickColor(v4, v35, v36, v37);
  objc_msgSend_setInactiveMinorTickColor_(self, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_bezelDepthMaxMajorTickColor(v4, v41, v42, v43);
  objc_msgSend_setDepthMaxMajorTickColor_(self, v45, (uint64_t)v44, v46);

  uint64_t v50 = objc_msgSend_bezelDepthMaxMedialTickColor(v4, v47, v48, v49);
  objc_msgSend_setDepthMaxMedialTickColor_(self, v51, (uint64_t)v50, v52);

  uint64_t v56 = objc_msgSend_bezelDepthMaxMinorTickColor(v4, v53, v54, v55);
  objc_msgSend_setDepthMaxMinorTickColor_(self, v57, (uint64_t)v56, v58);

  uint64_t v62 = objc_msgSend_bezelDepthLimitMajorTickColor(v4, v59, v60, v61);
  objc_msgSend_setDepthLimitMajorTickColor_(self, v63, (uint64_t)v62, v64);

  uint64_t v68 = objc_msgSend_bezelDepthLimitMedialTickColor(v4, v65, v66, v67);
  objc_msgSend_setDepthLimitMedialTickColor_(self, v69, (uint64_t)v68, v70);

  uint64_t v74 = objc_msgSend_bezelDepthLimitMinorTickColor(v4, v71, v72, v73);
  objc_msgSend_setDepthLimitMinorTickColor_(self, v75, (uint64_t)v74, v76);

  v80 = objc_msgSend_bezelDepthMarkerColor(v4, v77, v78, v79);
  objc_msgSend_setDepthMarkerColor_(self, v81, (uint64_t)v80, v82);

  uint64_t v86 = objc_msgSend_bezelDepthMaxMarkerColor(v4, v83, v84, v85);
  objc_msgSend_setDepthMaxMarkerColor_(self, v87, (uint64_t)v86, v88);

  uint64_t v92 = objc_msgSend_bezelDepthLabelColor(v4, v89, v90, v91);
  objc_msgSend_setDepthLabelColor_(self, v93, (uint64_t)v92, v94);

  uint64_t v98 = objc_msgSend_bezelDepthMaxLabelColor(v4, v95, v96, v97);
  objc_msgSend_setDepthMaxLabelColor_(self, v99, (uint64_t)v98, v100);

  id v104 = objc_msgSend_bezelDepthLimitLabelColor(v4, v101, v102, v103);
  objc_msgSend_setDepthLimitLabelColor_(self, v105, (uint64_t)v104, v106);

  double v110 = objc_msgSend_bezelDepthDecorationColor(v4, v107, v108, v109);
  objc_msgSend_setDepthDecorationColor_(self, v111, (uint64_t)v110, v112);

  id v116 = objc_msgSend_bezelHarmoniaUnitLabelColor(v4, v113, v114, v115);
  objc_msgSend_setHarmoniaUnitLabelColor_(self, v117, (uint64_t)v116, v118);

  uint64_t v122 = objc_msgSend_bezelHarmoniaEmphasizedTickColor(v4, v119, v120, v121);
  objc_msgSend_setHarmoniaEmphasizedTickColor_(self, v123, (uint64_t)v122, v124);

  float v128 = objc_msgSend_bezelHarmoniaOvernightTypicalColor(v4, v125, v126, v127);
  objc_msgSend_setHarmoniaOvernightTypicalColor_(self, v129, (uint64_t)v128, v130);

  uint64_t v134 = objc_msgSend_bezelHarmoniaOvernightPartiallyOutOfRangeColor(v4, v131, v132, v133);
  objc_msgSend_setHarmoniaOvernightPartiallyOutOfRangeColor_(self, v135, (uint64_t)v134, v136);

  uint64_t v140 = objc_msgSend_bezelHarmoniaOvernightOutOfRangeColor(v4, v137, v138, v139);
  objc_msgSend_setHarmoniaOvernightOutOfRangeColor_(self, v141, (uint64_t)v140, v142);

  uint64_t v146 = objc_msgSend_bezelHarmoniaTrainingWellBelowColor(v4, v143, v144, v145);
  objc_msgSend_setHarmoniaTrainingWellBelowColor_(self, v147, (uint64_t)v146, v148);

  uint64_t v152 = objc_msgSend_bezelHarmoniaTrainingBelowColor(v4, v149, v150, v151);
  objc_msgSend_setHarmoniaTrainingBelowColor_(self, v153, (uint64_t)v152, v154);

  uint64_t v158 = objc_msgSend_bezelHarmoniaTrainingNearColor(v4, v155, v156, v157);
  objc_msgSend_setHarmoniaTrainingNearColor_(self, v159, (uint64_t)v158, v160);

  uint64_t v164 = objc_msgSend_bezelHarmoniaTrainingAboveColor(v4, v161, v162, v163);
  objc_msgSend_setHarmoniaTrainingAboveColor_(self, v165, (uint64_t)v164, v166);

  uint64_t v170 = objc_msgSend_bezelHarmoniaTrainingWellAboveColor(v4, v167, v168, v169);
  objc_msgSend_setHarmoniaTrainingWellAboveColor_(self, v171, (uint64_t)v170, v172);

  colorPalette = self->_colorPalette;
  self->_colorPalette = v4;
}

- (int64_t)bezelStyle
{
  return self->_bezelStyle;
}

- (BOOL)showingStatusIndicator
{
  return self->_showingStatusIndicator;
}

- (double)seconds
{
  return self->_seconds;
}

- (double)secondsEndOfMinuteAnimationDuration
{
  return self->_secondsEndOfMinuteAnimationDuration;
}

- (void)setSecondsEndOfMinuteAnimationDuration:(double)a3
{
  self->_secondsEndOfMinuteAnimationDuratiouint64_t n = a3;
}

- (unint64_t)secondsEndOfMinuteAnimationStyle
{
  return self->_secondsEndOfMinuteAnimationStyle;
}

- (void)setSecondsEndOfMinuteAnimationStyle:(unint64_t)a3
{
  self->_unint64_t secondsEndOfMinuteAnimationStyle = a3;
}

- (unint64_t)secondsTritiumAnimationStyle
{
  return self->_secondsTritiumAnimationStyle;
}

- (void)setSecondsTritiumAnimationStyle:(unint64_t)a3
{
  self->_unint64_t secondsTritiumAnimationStyle = a3;
}

- (double)submergedDepth
{
  return self->_submergedDepth;
}

- (double)submergedDepthMax
{
  return self->_submergedDepthMax;
}

- (double)submergedDepthLimit
{
  return self->_submergedDepthLimit;
}

- (double)submergedDepthLabelLimitMeters
{
  return self->_submergedDepthLabelLimitMeters;
}

- (double)submergedDepthLabelLimitFeet
{
  return self->_submergedDepthLabelLimitFeet;
}

- (double)elevation
{
  return self->_elevation;
}

- (double)elevationAccuracy
{
  return self->_elevationAccuracy;
}

- (double)elevationPrecision
{
  return self->_elevationPrecision;
}

- (BOOL)elevationIsValid
{
  return self->_elevationIsValid;
}

- (unint64_t)harmoniaOvernightDataState
{
  return self->_harmoniaOvernightDataState;
}

- (NSArray)harmoniaOvernightMarkers
{
  return self->_harmoniaOvernightMarkers;
}

- (NSArray)harmoniaOvernightTypicalValues
{
  return self->_harmoniaOvernightTypicalValues;
}

- (NSArray)harmoniaOvernightChangeAboveValues
{
  return self->_harmoniaOvernightChangeAboveValues;
}

- (NSArray)harmoniaOvernightChangeBelowValues
{
  return self->_harmoniaOvernightChangeBelowValues;
}

- (unint64_t)harmoniaOvernightChangesThreshold
{
  return self->_harmoniaOvernightChangesThreshold;
}

- (NSString)harmoniaOvernightLocalizedSummary
{
  return self->_harmoniaOvernightLocalizedSummary;
}

- (unint64_t)harmoniaTrainingDataState
{
  return self->_harmoniaTrainingDataState;
}

- (NSArray)harmoniaTrainingMarkers
{
  return self->_harmoniaTrainingMarkers;
}

- (unint64_t)harmoniaTrainingLoadBand
{
  return self->_harmoniaTrainingLoadBand;
}

- (NSNumber)harmoniaTrainingValue
{
  return self->_harmoniaTrainingValue;
}

- (NSString)harmoniaTrainingLocalizedSummary
{
  return self->_harmoniaTrainingLocalizedSummary;
}

- (UIColor)majorTickColor
{
  return self->_majorTickColor;
}

- (UIColor)medialTickColor
{
  return self->_medialTickColor;
}

- (UIColor)minorTickColor
{
  return self->_minorTickColor;
}

- (UIColor)inactiveMajorTickColor
{
  return self->_inactiveMajorTickColor;
}

- (UIColor)inactiveMedialTickColor
{
  return self->_inactiveMedialTickColor;
}

- (UIColor)inactiveMinorTickColor
{
  return self->_inactiveMinorTickColor;
}

- (BOOL)isSubmerged
{
  return self->_submerged;
}

- (UIColor)depthMaxMajorTickColor
{
  return self->_depthMaxMajorTickColor;
}

- (UIColor)depthMaxMedialTickColor
{
  return self->_depthMaxMedialTickColor;
}

- (UIColor)depthMaxMinorTickColor
{
  return self->_depthMaxMinorTickColor;
}

- (UIColor)depthLimitMajorTickColor
{
  return self->_depthLimitMajorTickColor;
}

- (UIColor)depthLimitMedialTickColor
{
  return self->_depthLimitMedialTickColor;
}

- (UIColor)depthLimitMinorTickColor
{
  return self->_depthLimitMinorTickColor;
}

- (UIColor)depthMarkerColor
{
  return self->_depthMarkerColor;
}

- (UIColor)depthMaxMarkerColor
{
  return self->_depthMaxMarkerColor;
}

- (UIColor)depthLabelColor
{
  return self->_depthLabelColor;
}

- (UIColor)depthMaxLabelColor
{
  return self->_depthMaxLabelColor;
}

- (UIColor)depthLimitLabelColor
{
  return self->_depthLimitLabelColor;
}

- (UIColor)depthOverLimitColor
{
  return self->_depthOverLimitColor;
}

- (UIColor)depthDecorationColor
{
  return self->_depthDecorationColor;
}

- (UIColor)harmoniaUnitLabelColor
{
  return self->_harmoniaUnitLabelColor;
}

- (UIColor)harmoniaDotFillColor
{
  return self->_harmoniaDotFillColor;
}

- (UIColor)harmoniaEmphasizedTickColor
{
  return self->_harmoniaEmphasizedTickColor;
}

- (UIColor)harmoniaOvernightTypicalColor
{
  return self->_harmoniaOvernightTypicalColor;
}

- (UIColor)harmoniaOvernightPartiallyOutOfRangeColor
{
  return self->_harmoniaOvernightPartiallyOutOfRangeColor;
}

- (UIColor)harmoniaOvernightOutOfRangeColor
{
  return self->_harmoniaOvernightOutOfRangeColor;
}

- (UIColor)harmoniaTrainingWellBelowColor
{
  return self->_harmoniaTrainingWellBelowColor;
}

- (UIColor)harmoniaTrainingBelowColor
{
  return self->_harmoniaTrainingBelowColor;
}

- (UIColor)harmoniaTrainingNearColor
{
  return self->_harmoniaTrainingNearColor;
}

- (UIColor)harmoniaTrainingAboveColor
{
  return self->_harmoniaTrainingAboveColor;
}

- (UIColor)harmoniaTrainingWellAboveColor
{
  return self->_harmoniaTrainingWellAboveColor;
}

- (NTKFoghornFaceColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (double)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingWellAboveColor, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingAboveColor, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingNearColor, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingBelowColor, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingWellBelowColor, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightOutOfRangeColor, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightPartiallyOutOfRangeColor, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightTypicalColor, 0);
  objc_storeStrong((id *)&self->_harmoniaEmphasizedTickColor, 0);
  objc_storeStrong((id *)&self->_harmoniaDotFillColor, 0);
  objc_storeStrong((id *)&self->_harmoniaUnitLabelColor, 0);
  objc_storeStrong((id *)&self->_depthDecorationColor, 0);
  objc_storeStrong((id *)&self->_depthOverLimitColor, 0);
  objc_storeStrong((id *)&self->_depthLimitLabelColor, 0);
  objc_storeStrong((id *)&self->_depthMaxLabelColor, 0);
  objc_storeStrong((id *)&self->_depthLabelColor, 0);
  objc_storeStrong((id *)&self->_depthMaxMarkerColor, 0);
  objc_storeStrong((id *)&self->_depthMarkerColor, 0);
  objc_storeStrong((id *)&self->_depthLimitMinorTickColor, 0);
  objc_storeStrong((id *)&self->_depthLimitMedialTickColor, 0);
  objc_storeStrong((id *)&self->_depthLimitMajorTickColor, 0);
  objc_storeStrong((id *)&self->_depthMaxMinorTickColor, 0);
  objc_storeStrong((id *)&self->_depthMaxMedialTickColor, 0);
  objc_storeStrong((id *)&self->_depthMaxMajorTickColor, 0);
  objc_storeStrong((id *)&self->_inactiveMinorTickColor, 0);
  objc_storeStrong((id *)&self->_inactiveMedialTickColor, 0);
  objc_storeStrong((id *)&self->_inactiveMajorTickColor, 0);
  objc_storeStrong((id *)&self->_minorTickColor, 0);
  objc_storeStrong((id *)&self->_medialTickColor, 0);
  objc_storeStrong((id *)&self->_majorTickColor, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingLocalizedSummary, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingValue, 0);
  objc_storeStrong((id *)&self->_harmoniaTrainingMarkers, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightLocalizedSummary, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightChangeBelowValues, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightChangeAboveValues, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightTypicalValues, 0);
  objc_storeStrong((id *)&self->_harmoniaOvernightMarkers, 0);

  objc_storeStrong((id *)&self->_depthLimitLabelFont, 0);
  objc_storeStrong((id *)&self->_baseLabelUnitFont, 0);
  objc_storeStrong((id *)&self->_baseLabelFont, 0);
  objc_storeStrong((id *)&self->_baseLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_baseLabel, 0);

  objc_storeStrong((id *)&self->_superEllipseGeometry, 0);
}

@end