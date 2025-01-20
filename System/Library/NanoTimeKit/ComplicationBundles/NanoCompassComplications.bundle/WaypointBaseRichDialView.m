@interface WaypointBaseRichDialView
- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3;
- (UIImageView)waypointView;
- (UIView)needleView;
- (WaypointRichComplicationTicksView)ticksView;
- (id)_defaultSmartWaypointImage;
- (id)_defaultWaypointImage;
- (id)_deletedWaypointImage;
- (id)_pointSizeConfigurationForSymbol:(id)a3;
- (id)_symbolSizeAdjustmentsForDevice:(id)a3;
- (id)_tickColorForWaypointColor:(id)a3;
- (id)_waypointImageForSymbol:(id)a3;
- (id)_waypointPrivacyRedactionImage;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (void)_configureSampleTemplateWithImageProvider:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setNeedleView:(id)a3;
- (void)setTicksView:(id)a3;
- (void)setWaypointView:(id)a3;
@end

@implementation WaypointBaseRichDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)WaypointBaseRichDialView;
  v5 = [(WaypointBaseRichDialView *)&v44 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 69);
    *((void *)v5 + 69) = v6;

    objc_msgSend__layoutConstantsForDevice_(v5, v8, (uint64_t)v4, v9);
    *(_OWORD *)(v5 + 472) = v39;
    long long v10 = v40;
    long long v11 = v41;
    long long v12 = v42;
    *((void *)v5 + 67) = v43;
    *(_OWORD *)(v5 + 504) = v11;
    *(_OWORD *)(v5 + 520) = v12;
    *(_OWORD *)(v5 + 488) = v10;
    uint64_t v15 = objc_msgSend__symbolSizeAdjustmentsForDevice_(v5, v13, (uint64_t)v4, v14);
    v16 = (void *)*((void *)v5 + 68);
    *((void *)v5 + 68) = v15;

    v20 = objc_msgSend_needleView(v5, v17, v18, v19);
    objc_msgSend_addSubview_(v5, v21, (uint64_t)v20, v22);

    v26 = objc_msgSend_ticksView(v5, v23, v24, v25);
    v30 = objc_msgSend_needleView(v5, v27, v28, v29);
    objc_msgSend_insertSubview_belowSubview_(v5, v31, (uint64_t)v26, (uint64_t)v30);

    v35 = objc_msgSend_waypointView(v5, v32, v33, v34);
    objc_msgSend_addSubview_(v5, v36, (uint64_t)v35, v37);
  }
  return v5;
}

- (UIView)needleView
{
  needleView = self->_needleView;
  if (!needleView)
  {
    id v4 = NanoCompassWaypointDefaultColor();
    v8 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v5, v6, v7, self->_layoutConstants.needleHeight);
    long long v10 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v9, @"triangle.fill", (uint64_t)v8);
    long long v12 = objc_msgSend_imageWithTintColor_renderingMode_(v10, v11, (uint64_t)v4, 1);

    id v13 = objc_alloc(MEMORY[0x263F1C6D0]);
    v16 = (UIImageView *)objc_msgSend_initWithImage_(v13, v14, (uint64_t)v12, v15);
    needleImageView = self->_needleImageView;
    self->_needleImageView = v16;

    double dialDiameter = self->_layoutConstants.dialDiameter;
    id v19 = objc_alloc(MEMORY[0x263F1CB60]);
    v23 = (UIView *)objc_msgSend_initWithFrame_(v19, v20, v21, v22, 0.0, 0.0, dialDiameter, dialDiameter);
    uint64_t v24 = self->_needleView;
    self->_needleView = v23;

    objc_msgSend_addSubview_(self->_needleView, v25, (uint64_t)self->_needleImageView, v26);
    UIRectGetCenter();
    objc_msgSend_setCenter_(self->_needleImageView, v27, v28, v29);

    needleView = self->_needleView;
  }

  return needleView;
}

- (WaypointRichComplicationTicksView)ticksView
{
  ticksView = self->_ticksView;
  if (!ticksView)
  {
    id v4 = [WaypointRichComplicationTicksView alloc];
    started = (WaypointRichComplicationTicksView *)objc_msgSend_initWithLargeTickCount_smallTickCountPerLargeTick_largeTickSize_smallTickSize_dialRange_startAngle_(v4, v5, 4, 10, self->_layoutConstants.largeTickSize.width, self->_layoutConstants.largeTickSize.height, self->_layoutConstants.smallTickSize.width, self->_layoutConstants.smallTickSize.height, 6.28318531, 0.0);
    uint64_t v7 = self->_ticksView;
    self->_ticksView = started;

    long long v11 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v8, v9, v10, 0.701960784, 1.0);
    objc_msgSend_setLargeTickColor_(self->_ticksView, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v14, v15, v16);
    uint64_t v21 = objc_msgSend_colorWithAlphaComponent_(v17, v18, v19, v20, 0.400000006);
    objc_msgSend_setSmallTickColor_(self->_ticksView, v22, (uint64_t)v21, v23);

    objc_msgSend_setFrame_(self->_ticksView, v24, v25, v26, 0.0, 0.0, self->_layoutConstants.dialDiameter, self->_layoutConstants.dialDiameter);
    ticksView = self->_ticksView;
  }

  return ticksView;
}

- (UIImageView)waypointView
{
  waypointView = self->_waypointView;
  if (!waypointView)
  {
    double v4 = self->_layoutConstants.symbolSize - self->_layoutConstants.symbolMargin;
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v9 = (UIImageView *)objc_msgSend_initWithFrame_(v5, v6, v7, v8, 0.0, 0.0, v4, v4);
    uint64_t v10 = self->_waypointView;
    self->_waypointView = v9;

    objc_msgSend_setContentMode_(self->_waypointView, v11, 4, v12);
    uint64_t v16 = objc_msgSend__defaultWaypointImage(self, v13, v14, v15);
    objc_msgSend_setImage_(self->_waypointView, v17, (uint64_t)v16, v18);

    waypointView = self->_waypointView;
  }

  return waypointView;
}

- (id)monochromeAccentViews
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_needleView(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_ticksView(self, v6, v7, v8, v5);
  v17[1] = v9;
  uint64_t v13 = objc_msgSend_waypointView(self, v10, v11, v12);
  v17[2] = v13;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v17, 3);

  return v15;
}

- (id)monochromeOtherViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v263.receiver = self;
  v263.super_class = (Class)WaypointBaseRichDialView;
  [(NanoCompassBaseRichView *)&v263 configureWithImageProvider:v6 reason:a4];
  uint64_t v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"showSampleData", v12);
  int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  if (!v17)
  {
    uint64_t v21 = objc_msgSend_metadata(v6, v18, v19, v20);
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"heading", v23);

    uint64_t v28 = objc_msgSend_null(MEMORY[0x263EFF9D0], v25, v26, v27);
    int isEqual = objc_msgSend_isEqual_(v24, v29, (uint64_t)v28, v30);

    if (isEqual)
    {

      uint64_t v24 = 0;
    }
    v35 = objc_msgSend_metadata(v6, v32, v33, v34);
    v38 = objc_msgSend_objectForKeyedSubscript_(v35, v36, @"waypoint", v37);

    long long v42 = objc_msgSend_null(MEMORY[0x263EFF9D0], v39, v40, v41);
    int v45 = objc_msgSend_isEqual_(v38, v43, (uint64_t)v42, v44);

    if (v45)
    {

      v38 = 0;
    }
    v49 = objc_msgSend_metadata(v6, v46, v47, v48);
    v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, @"location", v51);

    v56 = objc_msgSend_null(MEMORY[0x263EFF9D0], v53, v54, v55);
    int v59 = objc_msgSend_isEqual_(v52, v57, (uint64_t)v56, v58);

    v260 = v24;
    if (v59)
    {

      v52 = 0;
    }
    v63 = objc_msgSend_metadata(v6, v60, v61, v62);
    v66 = objc_msgSend_objectForKeyedSubscript_(v63, v64, @"nodata", v65);
    char v70 = objc_msgSend_BOOLValue(v66, v67, v68, v69);

    v74 = objc_msgSend_metadata(v6, v71, v72, v73);
    v77 = objc_msgSend_objectForKeyedSubscript_(v74, v75, @"inactive", v76);
    int v259 = objc_msgSend_BOOLValue(v77, v78, v79, v80);

    v84 = objc_msgSend_metadata(v6, v81, v82, v83);
    v87 = objc_msgSend_objectForKeyedSubscript_(v84, v85, @"alwayson", v86);
    int v91 = objc_msgSend_BOOLValue(v87, v88, v89, v90);

    v95 = objc_msgSend_metadata(v6, v92, v93, v94);
    v98 = objc_msgSend_objectForKeyedSubscript_(v95, v96, @"smart", v97);
    int v102 = objc_msgSend_BOOLValue(v98, v99, v100, v101);

    v106 = objc_msgSend_metadata(v6, v103, v104, v105);
    v109 = objc_msgSend_objectForKeyedSubscript_(v106, v107, @"showPrivacyRedaction", v108);
    int v113 = objc_msgSend_BOOLValue(v109, v110, v111, v112);

    if (v70) {
      goto LABEL_17;
    }
    int v117 = v259;
    if (!v38) {
      int v117 = 1;
    }
    if (!v260) {
      int v117 = 1;
    }
    if (!v52) {
      int v117 = 1;
    }
    if ((v117 | v91))
    {
LABEL_17:
      v118 = objc_msgSend_needleView(self, v114, v115, v116);
      objc_msgSend_setHidden_(v118, v119, 1, v120);

      v124 = objc_msgSend_ticksView(self, v121, v122, v123);
      objc_msgSend_setProgress_(v124, v125, v126, v127, 0.0);

      if (!v38)
      {
        if (v102)
        {
          v131 = objc_msgSend__defaultSmartWaypointImage(self, v128, v129, v130);
          v135 = objc_msgSend_waypointView(self, v132, v133, v134);
          objc_msgSend_setImage_(v135, v136, (uint64_t)v131, v137);
          v138 = v260;
        }
        else
        {
          v138 = v260;
          if (v113) {
            objc_msgSend__waypointPrivacyRedactionImage(self, v128, v129, v130);
          }
          else {
          v131 = objc_msgSend__deletedWaypointImage(self, v128, v129, v130);
          }
          v135 = objc_msgSend_waypointView(self, v245, v246, v247);
          objc_msgSend_setImage_(v135, v248, (uint64_t)v131, v249);
        }

        v217 = objc_msgSend_ticksView(self, v250, v251, v252);
        objc_msgSend_setProgress_(v217, v253, v254, v255, 0.0);
LABEL_40:

        objc_msgSend_setNeedsLayout(self, v256, v257, v258);
        goto LABEL_41;
      }
    }
    else
    {
      v139 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v114, v115, v116, self->_layoutConstants.needleHeight);
      v141 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v140, @"triangle.fill", (uint64_t)v139);
      v145 = objc_msgSend_labelColor(v38, v142, v143, v144);
      v147 = objc_msgSend_imageWithTintColor_renderingMode_(v141, v146, (uint64_t)v145, 1);

      objc_msgSend_setImage_(self->_needleImageView, v148, (uint64_t)v147, v149);
      v153 = objc_msgSend_needleView(self, v150, v151, v152);
      objc_msgSend_setHidden_(v153, v154, 0, v155);

      v159 = objc_msgSend_rawLocation(v52, v156, v157, v158);
      v163 = objc_msgSend_location(v38, v160, v161, v162);
      double v164 = bearingBetweenLocationsInDegree(v159, v163);

      objc_msgSend_heading(v260, v165, v166, v167);
      double v172 = v164 - v171;
      if (v172 < 0.0) {
        double v172 = v172 + 360.0;
      }
      float v173 = v172;
      int v174 = llroundf(v173);
      v175 = objc_msgSend_ticksView(self, v168, v169, v170);
      v180 = v175;
      if (v174 > 180)
      {
        LODWORD(v179) = -1.0;
        objc_msgSend_setProgressDirection_(v175, v176, v177, v178, v179);

        float v184 = (float)(360 - v174);
      }
      else
      {
        LODWORD(v179) = 1.0;
        objc_msgSend_setProgressDirection_(v175, v176, v177, v178, v179);

        float v184 = (float)v174;
      }
      float v185 = v184 / 360.0;
      v186 = objc_msgSend_ticksView(self, v181, v182, v183);
      *(float *)&double v187 = v185;
      objc_msgSend_setProgress_(v186, v188, v189, v190, v187);

      v194 = objc_msgSend_labelColor(v38, v191, v192, v193);
      v197 = objc_msgSend__tickColorForWaypointColor_(self, v195, (uint64_t)v194, v196);
      v201 = objc_msgSend_ticksView(self, v198, v199, v200);
      objc_msgSend_setHighlightColor_(v201, v202, (uint64_t)v197, v203);

      CGAffineTransformMakeRotation(&v262, (double)v174 * 3.14159265 / 180.0);
      v207 = objc_msgSend_needleView(self, v204, v205, v206);
      CGAffineTransform v261 = v262;
      objc_msgSend_setTransform_(v207, v208, (uint64_t)&v261, v209);
    }
    v210 = objc_msgSend_symbol(v38, v128, v129, v130);

    if (v210)
    {
      v217 = objc_msgSend_labelColor(v38, v211, v212, v213);
      v138 = v260;
      if (v260) {
        char v218 = v259;
      }
      else {
        char v218 = 1;
      }
      if ((v218 & 1) != 0 || !v52)
      {
        uint64_t v219 = NanoCompassWaypointDefaultColor();

        v217 = (void *)v219;
      }
      v220 = objc_msgSend_symbol(v38, v214, v215, v216);
      v223 = objc_msgSend__waypointImageForSymbol_(self, v221, (uint64_t)v220, v222);

      v225 = objc_msgSend_imageWithTintColor_renderingMode_(v223, v224, (uint64_t)v217, 1);
      v229 = objc_msgSend_waypointView(self, v226, v227, v228);
      objc_msgSend_setImage_(v229, v230, (uint64_t)v225, v231);
    }
    else
    {
      v232 = objc_msgSend__defaultWaypointImage(self, v211, v212, v213);
      v236 = objc_msgSend_waypointView(self, v233, v234, v235);
      objc_msgSend_setImage_(v236, v237, (uint64_t)v232, v238);

      v217 = objc_msgSend_ticksView(self, v239, v240, v241);
      objc_msgSend_setProgress_(v217, v242, v243, v244, 0.0);
      v138 = v260;
    }
    goto LABEL_40;
  }
  objc_msgSend__configureSampleTemplateWithImageProvider_(self, v18, (uint64_t)v6, v20);
LABEL_41:
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)WaypointBaseRichDialView;
  [(WaypointBaseRichDialView *)&v31 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  uint64_t v13 = objc_msgSend_needleView(self, v10, v11, v12);
  objc_msgSend_setCenter_(v13, v14, v15, v16, v7, v9);

  uint64_t v20 = objc_msgSend_ticksView(self, v17, v18, v19);
  objc_msgSend_setCenter_(v20, v21, v22, v23, v7, v9);

  uint64_t v27 = objc_msgSend_waypointView(self, v24, v25, v26);
  objc_msgSend_setCenter_(v27, v28, v29, v30, v7, v9);
}

- (id)_pointSizeConfigurationForSymbol:(id)a3
{
  uint64_t v5 = objc_msgSend_valueForKey_(self->_symbolSizeAdjustments, a2, (uint64_t)a3, v3);
  double v9 = v5;
  if (v5) {
    objc_msgSend_doubleValue(v5, v6, v7, v8);
  }
  else {
    double v10 = 0.0;
  }
  uint64_t v11 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v6, v7, v8, v10 + self->_layoutConstants.symbolSize);

  return v11;
}

- (void)_configureSampleTemplateWithImageProvider:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_metadata(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"symbol", v10);

  uint64_t v15 = objc_msgSend_metadata(v4, v12, v13, v14);

  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"color", v17);

  uint64_t v22 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v19, v20, v21, self->_layoutConstants.needleHeight);
  uint64_t v24 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v23, @"triangle.fill", (uint64_t)v22);
  uint64_t v26 = objc_msgSend_imageWithTintColor_renderingMode_(v24, v25, (uint64_t)v18, 1);

  objc_msgSend_setImage_(self->_needleImageView, v27, (uint64_t)v26, v28);
  v32 = objc_msgSend_needleView(self, v29, v30, v31);
  objc_msgSend_setHidden_(v32, v33, 0, v34);

  v38 = objc_msgSend_ticksView(self, v35, v36, v37);
  LODWORD(v39) = 1.0;
  objc_msgSend_setProgressDirection_(v38, v40, v41, v42, v39);

  v46 = objc_msgSend_ticksView(self, v43, v44, v45);
  LODWORD(v47) = 0.125;
  objc_msgSend_setProgress_(v46, v48, v49, v50, v47);

  v53 = objc_msgSend__tickColorForWaypointColor_(self, v51, (uint64_t)v18, v52);
  v57 = objc_msgSend_ticksView(self, v54, v55, v56);
  objc_msgSend_setHighlightColor_(v57, v58, (uint64_t)v53, v59);

  CGAffineTransformMakeRotation(&v78, 0.785398163);
  v63 = objc_msgSend_needleView(self, v60, v61, v62);
  CGAffineTransform v77 = v78;
  objc_msgSend_setTransform_(v63, v64, (uint64_t)&v77, v65);

  uint64_t v68 = objc_msgSend__waypointImageForSymbol_(self, v66, (uint64_t)v11, v67);
  char v70 = objc_msgSend_imageWithTintColor_renderingMode_(v68, v69, (uint64_t)v18, 1);
  v74 = objc_msgSend_waypointView(self, v71, v72, v73);
  objc_msgSend_setImage_(v74, v75, (uint64_t)v70, v76);
}

- (id)_tickColorForWaypointColor:(id)a3
{
  id v3 = a3;
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v8 = v3;
  if (objc_msgSend_getHue_saturation_brightness_alpha_(v3, v4, (uint64_t)&v13, (uint64_t)&v12, &v11, &v10))
  {
    uint64_t v8 = objc_msgSend_colorWithHue_saturation_brightness_alpha_(MEMORY[0x263F1C550], v5, v6, v7, v13, v12 * 0.8, v11 * 0.9, v10);
  }

  return v8;
}

- (id)_defaultWaypointImage
{
  defaultWaypointImage = self->_defaultWaypointImage;
  if (!defaultWaypointImage)
  {
    id v4 = NanoCompassWaypointDefaultColor();
    uint64_t v8 = objc_msgSend_idealizedWaypoint(NCWaypoint, v5, v6, v7);
    double v12 = objc_msgSend_symbol(v8, v9, v10, v11);

    uint64_t v15 = objc_msgSend__waypointImageForSymbol_(self, v13, (uint64_t)v12, v14);
    objc_msgSend_imageWithTintColor_renderingMode_(v15, v16, (uint64_t)v4, 1);
    uint64_t v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_defaultWaypointImage;
    self->_defaultWaypointImage = v17;

    defaultWaypointImage = self->_defaultWaypointImage;
  }

  return defaultWaypointImage;
}

- (id)_defaultSmartWaypointImage
{
  defaultSmartWaypointImage = self->_defaultSmartWaypointImage;
  if (!defaultSmartWaypointImage)
  {
    id v4 = NanoCompassWaypointDefaultColor();
    uint64_t v7 = objc_msgSend__waypointImageForSymbol_(self, v5, @"pin.point.of.interest.2.fill", v6);
    objc_msgSend_imageWithTintColor_renderingMode_(v7, v8, (uint64_t)v4, 1);
    double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_defaultSmartWaypointImage;
    self->_defaultSmartWaypointImage = v9;

    defaultSmartWaypointImage = self->_defaultSmartWaypointImage;
  }

  return defaultSmartWaypointImage;
}

- (id)_deletedWaypointImage
{
  deletedWaypointImage = self->_deletedWaypointImage;
  if (!deletedWaypointImage)
  {
    id v4 = NanoCompassWaypointDefaultColor();
    uint64_t v7 = objc_msgSend__waypointImageForSymbol_(self, v5, @"pin.point.of.interest.slash.fill", v6);
    objc_msgSend_imageWithTintColor_renderingMode_(v7, v8, (uint64_t)v4, 1);
    double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_deletedWaypointImage;
    self->_deletedWaypointImage = v9;

    deletedWaypointImage = self->_deletedWaypointImage;
  }

  return deletedWaypointImage;
}

- (id)_waypointPrivacyRedactionImage
{
  waypointPrivacyRedactionImage = self->_waypointPrivacyRedactionImage;
  if (!waypointPrivacyRedactionImage)
  {
    id v4 = NanoCompassWaypointDefaultColor();
    uint64_t v7 = objc_msgSend__waypointImageForSymbol_(self, v5, @"pin.point.of.interest.fill", v6);
    objc_msgSend_imageWithTintColor_renderingMode_(v7, v8, (uint64_t)v4, 1);
    double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_waypointPrivacyRedactionImage;
    self->_waypointPrivacyRedactionImage = v9;

    waypointPrivacyRedactionImage = self->_waypointPrivacyRedactionImage;
  }

  return waypointPrivacyRedactionImage;
}

- (id)_waypointImageForSymbol:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(self->_waypointSymbolCache, v5, (uint64_t)v4, v6);
  uint64_t v10 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    double v12 = objc_msgSend__pointSizeConfigurationForSymbol_(self, v8, (uint64_t)v4, v9);
    objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v13, (uint64_t)v4, (uint64_t)v12);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(self->_waypointSymbolCache, v14, (uint64_t)v11, (uint64_t)v4);
  }

  return v11;
}

- (id)_symbolSizeAdjustmentsForDevice:(id)a3
{
  return (id)objc_msgSend_dictionary(NSDictionary, a2, (uint64_t)a3, v3);
}

- (void)setNeedleView:(id)a3
{
}

- (void)setTicksView:(id)a3
{
}

- (void)setWaypointView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointView, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_needleView, 0);
  objc_storeStrong((id *)&self->_waypointSymbolCache, 0);
  objc_storeStrong((id *)&self->_symbolSizeAdjustments, 0);
  objc_storeStrong((id *)&self->_needleImageView, 0);
  objc_storeStrong((id *)&self->_waypointPrivacyRedactionImage, 0);
  objc_storeStrong((id *)&self->_deletedWaypointImage, 0);
  objc_storeStrong((id *)&self->_defaultSmartWaypointImage, 0);

  objc_storeStrong((id *)&self->_defaultWaypointImage, 0);
}

- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3
{
  objc_opt_class();
  result = ($F19C7D1BACA455C0923872420114D4F8 *)NSRequestConcreteImplementation();
  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var3.height = 0u;
  *(_OWORD *)&retstr->var4.height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return result;
}

@end