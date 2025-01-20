@interface WaypointRichRectangularView
- (BOOL)supportsGossamer;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (id)_alwaysVisibleConstraints;
- (id)_filtersForStyle:(int64_t)a3 fraction:(id)a4;
- (id)_formattedLabelText:(id)a3 direction:(id)a4;
- (id)_threeLineConstraints;
- (id)_twoLineConstraints;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)labelFont;
- (id)smallCapsUnitFont;
- (void)_applyFilters:(id)a3 toViews:(id)a4;
- (void)_configureSampleWaypoint:(id)a3 color:(id)a4;
- (void)_updateForMonochrome:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation WaypointRichRectangularView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v117.receiver = self;
  v117.super_class = (Class)WaypointRichRectangularView;
  v6 = [(WaypointRichRectangularView *)&v117 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }
  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  v11 = objc_msgSend_initWithUUIDString_(v8, v9, @"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E", v10);
  char v14 = objc_msgSend_supportsCapability_(v5, v12, (uint64_t)v11, v13);

  v7->_supportsGossamer = v14;
  uint64_t v15 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_AWAY_TEXT");
  awayText = v7->_awayText;
  v7->_awayText = (NSString *)v15;

  uint64_t v17 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_DOWN_TEXT");
  downText = v7->_downText;
  v7->_downText = (NSString *)v17;

  uint64_t v19 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_UP_TEXT");
  upText = v7->_upText;
  v7->_upText = (NSString *)v19;

  uint64_t v21 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_NO_DISTANCE");
  noDistanceText = v7->_noDistanceText;
  v7->_noDistanceText = (NSString *)v21;

  uint64_t v23 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_NO_ELEVATION");
  noElevationText = v7->_noElevationText;
  v7->_noElevationText = (NSString *)v23;

  v25 = NanoCompassLocalizedString(@"WAYPOINT_COMPLICATION_SMART_WAYPOINT_NAME");
  uint64_t v29 = objc_msgSend_localizedCapitalizedString(v25, v26, v27, v28);
  defaultWaypointName = v7->_defaultWaypointName;
  v7->_defaultWaypointName = (NSString *)v29;

  v31 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_ACTIVATE_TEXT");
  uint64_t v35 = objc_msgSend_localizedCapitalizedString(v31, v32, v33, v34);
  tapToActivateText = v7->_tapToActivateText;
  v7->_tapToActivateText = (NSString *)v35;

  objc_msgSend_screenBounds(v5, v37, v38, v39);
  float v41 = v40 * 0.042;
  v7->_leftMargin = ceilf(v41);
  v7->_lineSpacing = 0.0;
  objc_msgSend_setClipsToBounds_(v7, v42, 1, v43);
  v44 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
  layoutGuide = v7->_layoutGuide;
  v7->_layoutGuide = v44;

  objc_msgSend_addLayoutGuide_(v7, v46, (uint64_t)v7->_layoutGuide, v47);
  v48 = [WaypointRichRectangularCircleDialView alloc];
  uint64_t inited = objc_msgSend_initFullColorImageViewWithDevice_(v48, v49, (uint64_t)v5, v50);
  dialView = v7->_dialView;
  v7->_dialView = (WaypointRichRectangularCircleDialView *)inited;

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7->_dialView, v53, 0, v54);
  objc_msgSend_addSubview_(v7, v55, (uint64_t)v7->_dialView, v56);
  uint64_t v57 = objc_opt_new();
  contentView = v7->_contentView;
  v7->_contentView = (UIView *)v57;

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7->_contentView, v59, 0, v60);
  objc_msgSend_addSubview_(v7, v61, (uint64_t)v7->_contentView, v62);
  uint64_t v63 = objc_opt_new();
  waypointLabel = v7->_waypointLabel;
  v7->_waypointLabel = (UILabel *)v63;

  v68 = objc_msgSend_labelFont(v7, v65, v66, v67);
  objc_msgSend_setFont_(v7->_waypointLabel, v69, (uint64_t)v68, v70);

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7->_waypointLabel, v71, 0, v72);
  objc_msgSend_setAllowsDefaultTighteningForTruncation_(v7->_waypointLabel, v73, 1, v74);
  objc_msgSend_addSubview_(v7->_contentView, v75, (uint64_t)v7->_waypointLabel, v76);
  uint64_t v77 = objc_opt_new();
  line2Label = v7->_line2Label;
  v7->_line2Label = (UILabel *)v77;

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7->_line2Label, v79, 0, v80);
  objc_msgSend_setAllowsDefaultTighteningForTruncation_(v7->_line2Label, v81, 1, v82);
  objc_msgSend_addSubview_(v7->_contentView, v83, (uint64_t)v7->_line2Label, v84);
  uint64_t v85 = objc_opt_new();
  line3Label = v7->_line3Label;
  v7->_line3Label = (UILabel *)v85;

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7->_line3Label, v87, 0, v88);
  objc_msgSend_setAllowsDefaultTighteningForTruncation_(v7->_line3Label, v89, 1, v90);
  objc_msgSend_addSubview_(v7->_contentView, v91, (uint64_t)v7->_line3Label, v92);
  uint64_t v93 = (uint64_t)v7->_defaultWaypointName;
  v94 = NanoCompassAppTintColor();
  objc_msgSend__configureSampleWaypoint_color_(v7, v95, v93, (uint64_t)v94);

  v99 = v7->_dialView;
  if (v99)
  {
    objc_msgSend__layoutConstantsForDevice_(v99, v96, (uint64_t)v5, v98);
  }
  else
  {
    double v116 = 0.0;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
  }
  *(_OWORD *)&v7->_layoutConstants.symbolSize = v112;
  v7->_layoutConstants.blurAmount = v116;
  *(_OWORD *)&v7->_layoutConstants.largeTickSize.height = v114;
  *(_OWORD *)&v7->_layoutConstants.smallTickSize.height = v115;
  *(_OWORD *)&v7->_layoutConstants.dialDiameter = v113;
  uint64_t v100 = objc_msgSend__threeLineConstraints(v7, v96, v97, v98, v112, v113, v114, v115, *(void *)&v116);
  waypointDetailsActivatedConstraints = v7->_waypointDetailsActivatedConstraints;
  v7->_waypointDetailsActivatedConstraints = (NSArray *)v100;

  v102 = (void *)MEMORY[0x263F08938];
  v106 = objc_msgSend__alwaysVisibleConstraints(v7, v103, v104, v105);
  objc_msgSend_activateConstraints_(v102, v107, (uint64_t)v106, v108);

  objc_msgSend_activateConstraints_(MEMORY[0x263F08938], v109, (uint64_t)v7->_waypointDetailsActivatedConstraints, v110);
  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v263 = a3;
  v9 = objc_msgSend_metadata(v263, v6, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"waypoint", v11);

  v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
  int isEqual = objc_msgSend_isEqual_(v12, v17, (uint64_t)v16, v18);

  if (isEqual)
  {

    v12 = 0;
  }
  uint64_t v23 = objc_msgSend_metadata(v263, v20, v21, v22);
  v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"smart", v25);
  int v30 = objc_msgSend_BOOLValue(v26, v27, v28, v29);

  uint64_t v34 = objc_msgSend_metadata(v263, v31, v32, v33);
  v37 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"showSampleData", v36);
  int v41 = objc_msgSend_BOOLValue(v37, v38, v39, v40);

  v45 = objc_msgSend_metadata(v263, v42, v43, v44);
  v48 = v45;
  if (!v41)
  {
    uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"nodata", v47);
    int v262 = objc_msgSend_BOOLValue(v62, v63, v64, v65);

    v69 = objc_msgSend_metadata(v263, v66, v67, v68);
    uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v69, v70, @"inactive", v71);
    int v76 = objc_msgSend_BOOLValue(v72, v73, v74, v75);

    uint64_t v80 = objc_msgSend_metadata(v263, v77, v78, v79);
    v83 = objc_msgSend_objectForKeyedSubscript_(v80, v81, @"alwayson", v82);
    int v87 = objc_msgSend_BOOLValue(v83, v84, v85, v86);

    if (!v12)
    {
      objc_msgSend_setText_(self->_waypointLabel, v88, (uint64_t)self->_defaultWaypointName, v90);
      v145 = NanoCompassAppTintColor();
      objc_msgSend_setTextColor_(self->_waypointLabel, v146, (uint64_t)v145, v147);

      if ((v30 & v76) == 1)
      {
        objc_msgSend_setText_(self->_line2Label, v148, (uint64_t)self->_tapToActivateText, v149);
        v153 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v150, v151, v152);
        objc_msgSend_setTextColor_(self->_line2Label, v154, (uint64_t)v153, v155);

        objc_msgSend_setNumberOfLines_(self->_line2Label, v156, 2, v157);
        objc_msgSend_setHidden_(self->_line2Label, v158, 0, v159);
        objc_msgSend_setHidden_(self->_line3Label, v160, 1, v161);
        p_waypointDetailsActivatedConstraints = (uint64_t *)&self->_waypointDetailsActivatedConstraints;
        objc_msgSend_deactivateConstraints_(MEMORY[0x263F08938], v163, (uint64_t)self->_waypointDetailsActivatedConstraints, v164);
        objc_msgSend__twoLineConstraints(self, v165, v166, v167);
      }
      else
      {
        objc_msgSend_setHidden_(self->_line2Label, v148, 0, v149);
        v176 = objc_msgSend__formattedLabelText_direction_(self, v175, (uint64_t)self->_noDistanceText, (uint64_t)self->_awayText);
        objc_msgSend_setAttributedText_(self->_line2Label, v177, (uint64_t)v176, v178);

        objc_msgSend_setHidden_(self->_line3Label, v179, 0, v180);
        v182 = objc_msgSend__formattedLabelText_direction_(self, v181, (uint64_t)self->_noElevationText, (uint64_t)self->_downText);
        objc_msgSend_setAttributedText_(self->_line3Label, v183, (uint64_t)v182, v184);

        p_waypointDetailsActivatedConstraints = (uint64_t *)&self->_waypointDetailsActivatedConstraints;
        objc_msgSend_deactivateConstraints_(MEMORY[0x263F08938], v185, (uint64_t)self->_waypointDetailsActivatedConstraints, v186);
        objc_msgSend__threeLineConstraints(self, v187, v188, v189);
      uint64_t v168 = };
      v190 = (void *)*p_waypointDetailsActivatedConstraints;
      uint64_t *p_waypointDetailsActivatedConstraints = v168;

      objc_msgSend_activateConstraints_(MEMORY[0x263F08938], v191, *p_waypointDetailsActivatedConstraints, v192);
      objc_msgSend_configureWithImageProvider_reason_(self->_dialView, v193, (uint64_t)v263, a4);
      objc_msgSend_setNeedsLayout(self, v194, v195, v196);
      goto LABEL_28;
    }
    v91 = objc_msgSend_metadata(v263, v88, v89, v90);
    v49 = objc_msgSend_objectForKeyedSubscript_(v91, v92, @"location", v93);

    uint64_t v97 = objc_msgSend_null(MEMORY[0x263EFF9D0], v94, v95, v96);
    int v100 = objc_msgSend_isEqual_(v49, v98, (uint64_t)v97, v99);

    if (v100)
    {

      v49 = 0;
    }
    uint64_t v104 = objc_msgSend_metadata(v263, v101, v102, v103);
    v107 = objc_msgSend_objectForKeyedSubscript_(v104, v105, @"altitude", v106);

    v111 = objc_msgSend_null(MEMORY[0x263EFF9D0], v108, v109, v110);
    int v114 = objc_msgSend_isEqual_(v107, v112, (uint64_t)v111, v113);

    if (v114)
    {

      v107 = 0;
    }
    v118 = objc_msgSend_label(v12, v115, v116, v117);
    v122 = objc_msgSend_localizedCapitalizedString(v118, v119, v120, v121);
    objc_msgSend_setText_(self->_waypointLabel, v123, (uint64_t)v122, v124);

    if (v76)
    {
      v128 = objc_msgSend_labelColor(v12, v125, v126, v127);
      objc_msgSend_setTextColor_(self->_waypointLabel, v129, (uint64_t)v128, v130);

      objc_msgSend_setText_(self->_line2Label, v131, (uint64_t)self->_tapToActivateText, v132);
      v136 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v133, v134, v135);
      objc_msgSend_setTextColor_(self->_line2Label, v137, (uint64_t)v136, v138);

      objc_msgSend_setNumberOfLines_(self->_line2Label, v139, 2, v140);
      objc_msgSend_setHidden_(self->_line2Label, v141, 0, v142);
    }
    else
    {
      if (v49)
      {
        v169 = objc_msgSend_labelColor(v12, v125, v126, v127);
        objc_msgSend_setTextColor_(self->_waypointLabel, v170, (uint64_t)v169, v171);

        char v174 = v87 | v262;
      }
      else
      {
        v197 = NanoCompassWaypointDefaultColor();
        objc_msgSend_setTextColor_(self->_waypointLabel, v198, (uint64_t)v197, v199);

        char v174 = 1;
      }
      objc_msgSend_setNumberOfLines_(self->_line2Label, v172, 1, v173);
      objc_msgSend_setHidden_(self->_line2Label, v200, 0, v201);
      if (v174)
      {
        v205 = objc_msgSend__formattedLabelText_direction_(self, v202, (uint64_t)self->_noDistanceText, (uint64_t)self->_awayText);
        objc_msgSend_setAttributedText_(self->_line2Label, v206, (uint64_t)v205, v207);
      }
      else
      {
        v208 = objc_msgSend_rawLocation(v49, v202, v203, v204);
        v212 = objc_msgSend_location(v12, v209, v210, v211);
        objc_msgSend_distanceFromLocation_(v208, v213, (uint64_t)v212, v214);
        double v216 = v215;

        v205 = formattedDistanceForWaypointComplication(v216);
        v218 = objc_msgSend__formattedLabelText_direction_(self, v217, (uint64_t)v205, (uint64_t)self->_awayText);
        objc_msgSend_setAttributedText_(self->_line2Label, v219, (uint64_t)v218, v220);
      }
      if (v107
        && objc_msgSend_hasReading(v107, v143, v221, v144)
        && ((objc_msgSend_isAltitudePopulated(v12, v143, v222, v144) ^ 1 | v87 | v262) & 1) == 0)
      {
        objc_msgSend_altitudeInMeters(v107, v143, v223, v144);
        double v238 = v237;
        objc_msgSend_altitude(v12, v239, v240, v241);
        double v243 = v242;
        v244 = &OBJC_IVAR___WaypointRichRectangularView__downText;
        if (v242 - v238 > 0.0) {
          v244 = &OBJC_IVAR___WaypointRichRectangularView__upText;
        }
        id v245 = *(id *)((char *)&self->super.super.super.isa + *v244);
        v246 = formattedDistanceForWaypointComplication(vabdd_f64(v243, v238));
        v248 = objc_msgSend__formattedLabelText_direction_(self, v247, (uint64_t)v246, (uint64_t)v245);
        objc_msgSend_setAttributedText_(self->_line3Label, v249, (uint64_t)v248, v250);

        objc_msgSend_setHidden_(self->_line3Label, v251, 0, v252);
        objc_msgSend_deactivateConstraints_(MEMORY[0x263F08938], v253, (uint64_t)self->_waypointDetailsActivatedConstraints, v254);
        objc_msgSend__threeLineConstraints(self, v255, v256, v257);
        v258 = (NSArray *)objc_claimAutoreleasedReturnValue();
        waypointDetailsActivatedConstraints = self->_waypointDetailsActivatedConstraints;
        self->_waypointDetailsActivatedConstraints = v258;

        objc_msgSend_activateConstraints_(MEMORY[0x263F08938], v260, (uint64_t)self->_waypointDetailsActivatedConstraints, v261);
        goto LABEL_26;
      }
    }
    objc_msgSend_setHidden_(self->_line3Label, v143, 1, v144);
    objc_msgSend_deactivateConstraints_(MEMORY[0x263F08938], v224, (uint64_t)self->_waypointDetailsActivatedConstraints, v225);
    objc_msgSend__twoLineConstraints(self, v226, v227, v228);
    v229 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v230 = self->_waypointDetailsActivatedConstraints;
    self->_waypointDetailsActivatedConstraints = v229;

    objc_msgSend_activateConstraints_(MEMORY[0x263F08938], v231, (uint64_t)self->_waypointDetailsActivatedConstraints, v232);
LABEL_26:
    objc_msgSend_configureWithImageProvider_reason_(self->_dialView, v233, (uint64_t)v263, a4);
    objc_msgSend_setNeedsLayout(self, v234, v235, v236);

    goto LABEL_27;
  }
  v49 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"label", v47);

  v53 = objc_msgSend_metadata(v263, v50, v51, v52);
  uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v53, v54, @"color", v55);

  objc_msgSend__configureSampleWaypoint_color_(self, v57, (uint64_t)v49, (uint64_t)v56);
  objc_msgSend_configureWithImageProvider_reason_(self->_dialView, v58, (uint64_t)v263, a4);
  objc_msgSend_setNeedsLayout(self, v59, v60, v61);

LABEL_27:
LABEL_28:
}

- (id)_alwaysVisibleConstraints
{
  v145[13] = *MEMORY[0x263EF8340];
  uint64_t v144 = objc_msgSend_leadingAnchor(self->_layoutGuide, a2, v2, v3);
  v143 = objc_msgSend_leadingAnchor(self, v5, v6, v7);
  uint64_t v142 = objc_msgSend_constraintEqualToAnchor_constant_(v144, v8, (uint64_t)v143, v9, self->_leftMargin);
  v145[0] = v142;
  v141 = objc_msgSend_trailingAnchor(self->_layoutGuide, v10, v11, v12);
  uint64_t v140 = objc_msgSend_trailingAnchor(self, v13, v14, v15);
  v139 = objc_msgSend_constraintEqualToAnchor_constant_(v141, v16, (uint64_t)v140, v17, 0.0);
  v145[1] = v139;
  uint64_t v138 = objc_msgSend_topAnchor(self->_layoutGuide, v18, v19, v20);
  v137 = objc_msgSend_topAnchor(self, v21, v22, v23);
  v136 = objc_msgSend_constraintEqualToAnchor_constant_(v138, v24, (uint64_t)v137, v25, 0.0);
  v145[2] = v136;
  uint64_t v135 = objc_msgSend_bottomAnchor(self->_layoutGuide, v26, v27, v28);
  uint64_t v134 = objc_msgSend_bottomAnchor(self, v29, v30, v31);
  v133 = objc_msgSend_constraintEqualToAnchor_constant_(v135, v32, (uint64_t)v134, v33, 0.0);
  v145[3] = v133;
  uint64_t v132 = objc_msgSend_leadingAnchor(self->_dialView, v34, v35, v36);
  v131 = objc_msgSend_leadingAnchor(self->_layoutGuide, v37, v38, v39);
  uint64_t v130 = objc_msgSend_constraintEqualToAnchor_(v132, v40, (uint64_t)v131, v41);
  v145[4] = v130;
  v129 = objc_msgSend_widthAnchor(self->_dialView, v42, v43, v44);
  v128 = objc_msgSend_constraintEqualToConstant_(v129, v45, v46, v47, self->_layoutConstants.dialDiameter);
  v145[5] = v128;
  uint64_t v127 = objc_msgSend_centerYAnchor(self->_dialView, v48, v49, v50);
  uint64_t v126 = objc_msgSend_centerYAnchor(self->_layoutGuide, v51, v52, v53);
  v125 = objc_msgSend_constraintEqualToAnchor_(v127, v54, (uint64_t)v126, v55);
  v145[6] = v125;
  uint64_t v124 = objc_msgSend_leadingAnchor(self->_contentView, v56, v57, v58);
  v123 = objc_msgSend_trailingAnchor(self->_dialView, v59, v60, v61);
  v122 = objc_msgSend_constraintEqualToAnchor_constant_(v124, v62, (uint64_t)v123, v63, self->_leftMargin);
  v145[7] = v122;
  uint64_t v121 = objc_msgSend_trailingAnchor(self->_contentView, v64, v65, v66);
  uint64_t v120 = objc_msgSend_trailingAnchor(self->_layoutGuide, v67, v68, v69);
  v119 = objc_msgSend_constraintEqualToAnchor_(v121, v70, (uint64_t)v120, v71);
  v145[8] = v119;
  v118 = objc_msgSend_centerYAnchor(self->_contentView, v72, v73, v74);
  uint64_t v117 = objc_msgSend_centerYAnchor(self->_dialView, v75, v76, v77);
  uint64_t v80 = objc_msgSend_constraintEqualToAnchor_(v118, v78, (uint64_t)v117, v79);
  v145[9] = v80;
  uint64_t v84 = objc_msgSend_topAnchor(self->_waypointLabel, v81, v82, v83);
  uint64_t v88 = objc_msgSend_topAnchor(self->_contentView, v85, v86, v87);
  v91 = objc_msgSend_constraintEqualToAnchor_(v84, v89, (uint64_t)v88, v90);
  v145[10] = v91;
  uint64_t v95 = objc_msgSend_leadingAnchor(self->_waypointLabel, v92, v93, v94);
  uint64_t v99 = objc_msgSend_leadingAnchor(self->_contentView, v96, v97, v98);
  uint64_t v102 = objc_msgSend_constraintEqualToAnchor_(v95, v100, (uint64_t)v99, v101);
  v145[11] = v102;
  uint64_t v106 = objc_msgSend_trailingAnchor(self->_waypointLabel, v103, v104, v105);
  uint64_t v110 = objc_msgSend_trailingAnchor(self->_contentView, v107, v108, v109);
  uint64_t v113 = objc_msgSend_constraintEqualToAnchor_(v106, v111, (uint64_t)v110, v112);
  v145[12] = v113;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v114, (uint64_t)v145, 13);
  id v116 = (id)objc_claimAutoreleasedReturnValue();

  return v116;
}

- (id)_twoLineConstraints
{
  v49[4] = *MEMORY[0x263EF8340];
  v48 = objc_msgSend_topAnchor(self->_line2Label, a2, v2, v3);
  uint64_t v47 = objc_msgSend_bottomAnchor(self->_waypointLabel, v5, v6, v7);
  uint64_t v46 = objc_msgSend_constraintEqualToAnchor_constant_(v48, v8, (uint64_t)v47, v9, self->_lineSpacing);
  v49[0] = v46;
  uint64_t v13 = objc_msgSend_leadingAnchor(self->_line2Label, v10, v11, v12);
  uint64_t v17 = objc_msgSend_leadingAnchor(self->_contentView, v14, v15, v16);
  uint64_t v20 = objc_msgSend_constraintEqualToAnchor_(v13, v18, (uint64_t)v17, v19);
  v49[1] = v20;
  v24 = objc_msgSend_trailingAnchor(self->_line2Label, v21, v22, v23);
  uint64_t v28 = objc_msgSend_trailingAnchor(self->_contentView, v25, v26, v27);
  uint64_t v31 = objc_msgSend_constraintEqualToAnchor_(v24, v29, (uint64_t)v28, v30);
  v49[2] = v31;
  uint64_t v35 = objc_msgSend_bottomAnchor(self->_line2Label, v32, v33, v34);
  uint64_t v39 = objc_msgSend_bottomAnchor(self->_contentView, v36, v37, v38);
  v42 = objc_msgSend_constraintEqualToAnchor_(v35, v40, (uint64_t)v39, v41);
  v49[3] = v42;
  uint64_t v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v49, 4);

  return v44;
}

- (id)_threeLineConstraints
{
  v82[7] = *MEMORY[0x263EF8340];
  v81 = objc_msgSend_topAnchor(self->_line2Label, a2, v2, v3);
  uint64_t v80 = objc_msgSend_bottomAnchor(self->_waypointLabel, v5, v6, v7);
  uint64_t v79 = objc_msgSend_constraintEqualToAnchor_constant_(v81, v8, (uint64_t)v80, v9, self->_lineSpacing);
  v82[0] = v79;
  uint64_t v78 = objc_msgSend_leadingAnchor(self->_line2Label, v10, v11, v12);
  uint64_t v77 = objc_msgSend_leadingAnchor(self->_contentView, v13, v14, v15);
  uint64_t v76 = objc_msgSend_constraintEqualToAnchor_(v78, v16, (uint64_t)v77, v17);
  v82[1] = v76;
  uint64_t v75 = objc_msgSend_trailingAnchor(self->_line2Label, v18, v19, v20);
  uint64_t v74 = objc_msgSend_trailingAnchor(self->_contentView, v21, v22, v23);
  uint64_t v73 = objc_msgSend_constraintEqualToAnchor_(v75, v24, (uint64_t)v74, v25);
  v82[2] = v73;
  uint64_t v72 = objc_msgSend_topAnchor(self->_line3Label, v26, v27, v28);
  uint64_t v71 = objc_msgSend_bottomAnchor(self->_line2Label, v29, v30, v31);
  uint64_t v70 = objc_msgSend_constraintEqualToAnchor_constant_(v72, v32, (uint64_t)v71, v33, self->_lineSpacing);
  v82[3] = v70;
  uint64_t v37 = objc_msgSend_leadingAnchor(self->_line3Label, v34, v35, v36);
  uint64_t v41 = objc_msgSend_leadingAnchor(self->_contentView, v38, v39, v40);
  uint64_t v44 = objc_msgSend_constraintEqualToAnchor_(v37, v42, (uint64_t)v41, v43);
  v82[4] = v44;
  v48 = objc_msgSend_trailingAnchor(self->_line3Label, v45, v46, v47);
  uint64_t v52 = objc_msgSend_trailingAnchor(self->_contentView, v49, v50, v51);
  uint64_t v55 = objc_msgSend_constraintEqualToAnchor_(v48, v53, (uint64_t)v52, v54);
  v82[5] = v55;
  v59 = objc_msgSend_bottomAnchor(self->_line3Label, v56, v57, v58);
  uint64_t v63 = objc_msgSend_bottomAnchor(self->_contentView, v60, v61, v62);
  uint64_t v66 = objc_msgSend_constraintEqualToAnchor_(v59, v64, (uint64_t)v63, v65);
  v82[6] = v66;
  uint64_t v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v67, (uint64_t)v82, 7);

  return v68;
}

- (id)labelFont
{
  if (qword_2689213C0 != -1) {
    dispatch_once(&qword_2689213C0, &unk_26EA48E00);
  }
  uint64_t v2 = (void *)qword_2689213B8;

  return v2;
}

- (id)smallCapsUnitFont
{
  if (qword_2689213D0 != -1) {
    dispatch_once(&qword_2689213D0, &unk_26EA48E20);
  }
  uint64_t v2 = (void *)qword_2689213C8;

  return v2;
}

- (id)_formattedLabelText:(id)a3 direction:(id)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v59 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v64 = *MEMORY[0x263F814F0];
  uint64_t v9 = v64;
  uint64_t v13 = objc_msgSend_labelFont(self, v10, v11, v12);
  v65[0] = v13;
  uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v65, (uint64_t)&v64, 1);
  uint64_t v58 = objc_msgSend_initWithString_attributes_(v8, v16, @" ", (uint64_t)v15);

  id v17 = objc_alloc(MEMORY[0x263F086A0]);
  v62[0] = *MEMORY[0x263F81500];
  uint64_t v18 = v62[0];
  uint64_t v22 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v19, v20, v21);
  v62[1] = v9;
  v63[0] = v22;
  uint64_t v26 = objc_msgSend_smallCapsUnitFont(self, v23, v24, v25);
  v63[1] = v26;
  uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v63, (uint64_t)v62, 2);
  uint64_t v30 = objc_msgSend_initWithString_attributes_(v17, v29, (uint64_t)v6, (uint64_t)v28);

  id v31 = objc_alloc(MEMORY[0x263F086A0]);
  v60[0] = v18;
  uint64_t v35 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v32, v33, v34);
  v60[1] = v9;
  v61[0] = v35;
  uint64_t v39 = objc_msgSend_labelFont(self, v36, v37, v38);
  v61[1] = v39;
  uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)v61, (uint64_t)v60, 2);
  uint64_t v43 = objc_msgSend_initWithString_attributes_(v31, v42, (uint64_t)v59, (uint64_t)v41);

  uint64_t v44 = NanoCompassLocalizedString(@"WAYPOINT_RECTANGULAR_COMPLICATION_SWAP_DISTANCE_TEXT_ORDER");
  int v48 = objc_msgSend_BOOLValue(v44, v45, v46, v47);
  if (v48) {
    uint64_t v51 = (uint64_t)v43;
  }
  else {
    uint64_t v51 = (uint64_t)v30;
  }
  if (v48) {
    uint64_t v52 = (uint64_t)v30;
  }
  else {
    uint64_t v52 = (uint64_t)v43;
  }
  objc_msgSend_appendAttributedString_(v7, v49, v51, v50);
  objc_msgSend_appendAttributedString_(v7, v53, (uint64_t)v58, v54);
  objc_msgSend_appendAttributedString_(v7, v55, v52, v56);

  return v7;
}

- (void)_configureSampleWaypoint:(id)a3 color:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_localizedCapitalizedString(a3, v7, v8, v9);
  objc_msgSend_setText_(self->_waypointLabel, v11, (uint64_t)v10, v12);

  objc_msgSend_setTextColor_(self->_waypointLabel, v13, (uint64_t)v6, v14);
  formattedDistanceForWaypointComplication(805.0);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend__formattedLabelText_direction_(self, v15, (uint64_t)v24, (uint64_t)self->_awayText);
  objc_msgSend_setAttributedText_(self->_line2Label, v17, (uint64_t)v16, v18);

  uint64_t v19 = formattedDistanceForWaypointComplication(14.6);
  uint64_t v21 = objc_msgSend__formattedLabelText_direction_(self, v20, (uint64_t)v19, (uint64_t)self->_downText);
  objc_msgSend_setAttributedText_(self->_line3Label, v22, (uint64_t)v21, v23);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateForMonochrome_(self, v6, (uint64_t)v8, v7);
}

- (void)updateMonochromeColor
{
  objc_msgSend__updateForMonochrome_(self, a2, 0, v2);
}

- (void)_updateForMonochrome:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v6 = objc_msgSend__filtersForStyle_fraction_(self, v5, 2, (uint64_t)v4);
  dialView = self->_dialView;
  v18[0] = self->_waypointLabel;
  v18[1] = dialView;
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, (uint64_t)v18, 2);
  objc_msgSend__applyFilters_toViews_(self, v10, (uint64_t)v6, (uint64_t)v9);
  uint64_t v12 = objc_msgSend__filtersForStyle_fraction_(self, v11, 0, (uint64_t)v4);

  line3Label = self->_line3Label;
  v17[0] = self->_line2Label;
  v17[1] = line3Label;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v17, 2);
  objc_msgSend__applyFilters_toViews_(self, v16, (uint64_t)v12, (uint64_t)v15);
}

- (id)_filtersForStyle:(int64_t)a3 fraction:(id)a4
{
  id v6 = a4;
  uint64_t v10 = v6;
  if (v6)
  {
    objc_msgSend_doubleValue(v6, v7, v8, v9);
    if (CLKFloatEqualsFloat())
    {
      uint64_t v14 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_7;
    }
    uint64_t v15 = objc_msgSend_filterProvider(self, v11, v12, v13);
    objc_msgSend_doubleValue(v10, v18, v19, v20);
    uint64_t v17 = objc_msgSend_filtersForView_style_fraction_(v15, v21, (uint64_t)self, a3);
  }
  else
  {
    uint64_t v15 = objc_msgSend_filterProvider(self, v7, v8, v9);
    uint64_t v17 = objc_msgSend_filtersForView_style_(v15, v16, (uint64_t)self, a3);
  }
  uint64_t v14 = (void *)v17;

LABEL_7:

  return v14;
}

- (void)_applyFilters:(id)a3 toViews:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2375C9E94;
  v9[3] = &unk_264CD57F0;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(a4, v7, (uint64_t)v9, v8);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)supportsGossamer
{
  return self->_supportsGossamer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_waypointDetailsActivatedConstraints, 0);
  objc_storeStrong((id *)&self->_tapToActivateText, 0);
  objc_storeStrong((id *)&self->_defaultWaypointName, 0);
  objc_storeStrong((id *)&self->_noElevationText, 0);
  objc_storeStrong((id *)&self->_noDistanceText, 0);
  objc_storeStrong((id *)&self->_upText, 0);
  objc_storeStrong((id *)&self->_downText, 0);
  objc_storeStrong((id *)&self->_awayText, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_line3Label, 0);
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_waypointLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_layoutGuide, 0);
}

@end