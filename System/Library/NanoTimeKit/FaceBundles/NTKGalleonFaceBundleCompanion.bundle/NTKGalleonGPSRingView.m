@interface NTKGalleonGPSRingView
- (BOOL)gpsRingEnabled;
- (CGRect)_ringFrame;
- (NTKGalleonColorPalette)palette;
- (NTKGalleonGPSRingView)initWithFrame:(CGRect)a3 device:(id)a4;
- (double)_easeInCurveWithFraction:(double)a3;
- (double)_fontSize;
- (double)altitude;
- (double)getRingDiameter;
- (double)incline;
- (double)latency;
- (double)minimumRingThickness;
- (double)ringThickness;
- (unint64_t)bezelStyle;
- (void)_layoutCurvedLabel:(id)a3 top:(BOOL)a4;
- (void)_positionDotsForCenterAngle:(double)a3 leftDot:(id)a4 rightDot:(id)a5;
- (void)_positionRingViews;
- (void)_setupStrings;
- (void)_updateCurvedLabel:(id)a3 withString:(id)a4 top:(BOOL)a5;
- (void)_updateElevationColors;
- (void)_updateLabelVisibility;
- (void)_updateLatLongColors;
- (void)_updateRingThickness;
- (void)applyTransitionFraction:(double)a3 fromBezelStyle:(unint64_t)a4 toBezelStyle:(unint64_t)a5;
- (void)applyTritiumFraction:(double)a3;
- (void)layoutSubviews;
- (void)locationUnavailable;
- (void)locationUpdated:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setAltitude:(double)a3 approximate:(BOOL)a4;
- (void)setBezelStyle:(unint64_t)a3;
- (void)setIncline:(double)a3;
- (void)setLatency:(double)a3;
- (void)setPalette:(id)a3;
@end

@implementation NTKGalleonGPSRingView

- (NTKGalleonGPSRingView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v264.receiver = self;
  v264.super_class = (Class)NTKGalleonGPSRingView;
  v11 = -[NTKGalleonGPSRingView initWithFrame:](&v264, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_device = (void **)&v11->_device;
    objc_storeStrong((id *)&v11->_device, a4);
    v12->_bezelStyle = 0;
    v12->_ringFraction = 1.0;
    v12->_latLongFraction = 1.0;
    v12->_elevationFraction = 0.0;
    v12->_tritiumFraction = 0.0;
    v17 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v14, v15, v16);
    v12->_usesMetric = objc_msgSend_usesMetricSystem(v17, v18, v19, v20);

    objc_msgSend__setupStrings(v12, v21, v22, v23);
    uint64_t v24 = objc_opt_new();
    elevationFormatter = v12->_elevationFormatter;
    v12->_elevationFormatter = (NSNumberFormatter *)v24;

    objc_msgSend_setNumberStyle_(v12->_elevationFormatter, v26, 1, v27);
    objc_msgSend_setMaximumFractionDigits_(v12->_elevationFormatter, v28, 0, v29);
    objc_msgSend_setRoundingMode_(v12->_elevationFormatter, v30, 2, v31);
    v32 = (void *)MEMORY[0x263EFD198];
    v36 = objc_msgSend_galleonFontDescriptor(NTKGalleonFaceView, v33, v34, v35);
    objc_msgSend__fontSize(v12, v37, v38, v39);
    uint64_t v42 = objc_msgSend_fontWithDescriptor_size_(v32, v40, (uint64_t)v36, v41);
    font = v12->_font;
    v12->_font = (CLKFont *)v42;

    if (qword_2691D5A68 != -1) {
      dispatch_once(&qword_2691D5A68, &unk_26FB12710);
    }
    id v44 = (id)qword_2691D5A60;
    uint64_t v48 = objc_msgSend_layer(MEMORY[0x263F157E8], v45, v46, v47);
    ringLayer = v12->_ringLayer;
    v12->_ringLayer = (CALayer *)v48;

    v50 = v12->_ringLayer;
    objc_msgSend_ringThickness(v12, v51, v52, v53);
    objc_msgSend_setBorderWidth_(v50, v54, v55, v56);
    objc_msgSend_setCornerCurve_(v12->_ringLayer, v57, *MEMORY[0x263F15A10], v58);
    objc_msgSend_setMasksToBounds_(v12->_ringLayer, v59, 1, v60);
    v61 = v12->_ringLayer;
    objc_msgSend_orangeColor(MEMORY[0x263F1C550], v62, v63, v64);
    id v65 = objc_claimAutoreleasedReturnValue();
    uint64_t v69 = objc_msgSend_CGColor(v65, v66, v67, v68);
    objc_msgSend_setBorderColor_(v61, v70, v69, v71);

    objc_msgSend_setActions_(v12->_ringLayer, v72, (uint64_t)v44, v73);
    id v74 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v12, v75, v76, v77);
    uint64_t v81 = objc_msgSend_initWithFrame_(v74, v78, v79, v80);
    ringView = v12->_ringView;
    v12->_ringView = (UIView *)v81;

    v83 = v12->_ringView;
    v87 = objc_msgSend_yellowColor(MEMORY[0x263F1C550], v84, v85, v86);
    objc_msgSend_setBackgroundColor_(v83, v88, (uint64_t)v87, v89);

    v93 = objc_msgSend_layer(v12->_ringView, v90, v91, v92);
    objc_msgSend_addSublayer_(v93, v94, (uint64_t)v12->_ringLayer, v95);

    objc_msgSend_addSubview_(v12, v96, (uint64_t)v12->_ringView, v97);
    id v98 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v12, v99, v100, v101);
    uint64_t v105 = objc_msgSend_initWithFrame_(v98, v102, v103, v104);
    latLongView = v12->_latLongView;
    v12->_latLongView = (UIView *)v105;

    v110 = objc_msgSend_layer(v12->_latLongView, v107, v108, v109);
    objc_msgSend_setActions_(v110, v111, (uint64_t)v44, v112);

    objc_msgSend_addSubview_(v12, v113, (uint64_t)v12->_latLongView, v114);
    id v115 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v12, v116, v117, v118);
    uint64_t v122 = objc_msgSend_initWithFrame_(v115, v119, v120, v121);
    elevationView = v12->_elevationView;
    v12->_elevationView = (UIView *)v122;

    v127 = objc_msgSend_layer(v12->_elevationView, v124, v125, v126);
    objc_msgSend_setActions_(v127, v128, (uint64_t)v44, v129);

    objc_msgSend_setHidden_(v12->_elevationView, v130, 1, v131);
    objc_msgSend_addSubview_(v12, v132, (uint64_t)v12->_elevationView, v133);
    sub_246B41CB0(*p_device);
    uint64_t v135 = v134;
    v258[0] = MEMORY[0x263EF8330];
    v258[1] = 3221225472;
    v258[2] = sub_246B41DBC;
    v258[3] = &unk_2651F8F20;
    uint64_t v260 = 0;
    uint64_t v261 = 0;
    id v257 = v44;
    id v259 = v257;
    uint64_t v262 = v135;
    uint64_t v263 = v135;
    v136 = (void (**)(void))MEMORY[0x24C5428F0](v258);
    uint64_t v137 = v136[2]();
    leftLatLongDotLayer = v12->_leftLatLongDotLayer;
    v12->_leftLatLongDotLayer = (CALayer *)v137;

    v142 = objc_msgSend_layer(v12->_latLongView, v139, v140, v141);
    objc_msgSend_addSublayer_(v142, v143, (uint64_t)v12->_leftLatLongDotLayer, v144);

    uint64_t v145 = ((void (*)(void (**)(void)))v136[2])(v136);
    rightLatLongDotLayer = v12->_rightLatLongDotLayer;
    v12->_rightLatLongDotLayer = (CALayer *)v145;

    v150 = objc_msgSend_layer(v12->_latLongView, v147, v148, v149);
    objc_msgSend_addSublayer_(v150, v151, (uint64_t)v12->_rightLatLongDotLayer, v152);

    v153 = *p_device;
    id v154 = objc_alloc(MEMORY[0x263F08C38]);
    v157 = objc_msgSend_initWithUUIDString_(v154, v155, @"DAB81146-4105-445B-94AD-14033A199AC4", v156);
    char v160 = objc_msgSend_supportsCapability_(v153, v158, (uint64_t)v157, v159);

    if ((v160 & 1) == 0)
    {
      uint64_t v161 = ((void (*)(void (**)(void)))v136[2])(v136);
      leftInclElevDotLayer = v12->_leftInclElevDotLayer;
      v12->_leftInclElevDotLayer = (CALayer *)v161;

      v166 = objc_msgSend_layer(v12->_elevationView, v163, v164, v165);
      objc_msgSend_addSublayer_(v166, v167, (uint64_t)v12->_leftInclElevDotLayer, v168);

      uint64_t v169 = ((void (*)(void (**)(void)))v136[2])(v136);
      rightInclElevDotLayer = v12->_rightInclElevDotLayer;
      v12->_rightInclElevDotLayer = (CALayer *)v169;

      v174 = objc_msgSend_layer(v12->_elevationView, v171, v172, v173);
      objc_msgSend_addSublayer_(v174, v175, (uint64_t)v12->_rightInclElevDotLayer, v176);
    }
    uint64_t v177 = objc_opt_new();
    coordinatesLabel = v12->_coordinatesLabel;
    v12->_coordinatesLabel = (CLKUICurvedLabel *)v177;

    objc_msgSend_setTracking_(v12->_coordinatesLabel, v179, v180, v181, 40.0);
    v182 = v12->_coordinatesLabel;
    v186 = objc_msgSend_grayColor(MEMORY[0x263F1C550], v183, v184, v185);
    objc_msgSend_setTextColor_(v182, v187, (uint64_t)v186, v188);

    objc_msgSend_setFont_(v12->_coordinatesLabel, v189, (uint64_t)v12->_font, v190);
    objc_msgSend_addSubview_(v12->_latLongView, v191, (uint64_t)v12->_coordinatesLabel, v192);
    v12->_latencdouble y = 1.79769313e308;
    uint64_t v193 = objc_opt_new();
    timestampLabel = v12->_timestampLabel;
    v12->_timestampLabel = (CLKUICurvedLabel *)v193;

    objc_msgSend_setTracking_(v12->_timestampLabel, v195, v196, v197, 75.0);
    v198 = v12->_timestampLabel;
    v202 = objc_msgSend_grayColor(MEMORY[0x263F1C550], v199, v200, v201);
    objc_msgSend_setTextColor_(v198, v203, (uint64_t)v202, v204);

    objc_msgSend_setFont_(v12->_timestampLabel, v205, (uint64_t)v12->_font, v206);
    objc_msgSend_setText_(v12->_timestampLabel, v207, (uint64_t)v12->_timestampUpdating, v208);
    objc_msgSend_addSubview_(v12->_latLongView, v209, (uint64_t)v12->_timestampLabel, v210);
    v12->_altitude = 1.79769313e308;
    uint64_t v211 = objc_opt_new();
    elevationLabel = v12->_elevationLabel;
    v12->_elevationLabel = (CLKUICurvedLabel *)v211;

    v213 = v12->_elevationLabel;
    v217 = objc_msgSend_grayColor(MEMORY[0x263F1C550], v214, v215, v216);
    objc_msgSend_setTextColor_(v213, v218, (uint64_t)v217, v219);

    objc_msgSend_setFont_(v12->_elevationLabel, v220, (uint64_t)v12->_font, v221);
    objc_msgSend_setText_(v12->_elevationLabel, v222, (uint64_t)v12->_elevationUnknown, v223);
    if ((v160 & 1) == 0)
    {
      v12->_incline = 1.79769313e308;
      uint64_t v226 = objc_opt_new();
      inclineLabel = v12->_inclineLabel;
      v12->_inclineLabel = (CLKUICurvedLabel *)v226;

      v228 = v12->_inclineLabel;
      v232 = objc_msgSend_grayColor(MEMORY[0x263F1C550], v229, v230, v231);
      objc_msgSend_setTextColor_(v228, v233, (uint64_t)v232, v234);

      objc_msgSend_setFont_(v12->_inclineLabel, v235, (uint64_t)v12->_font, v236);
      objc_msgSend_setText_(v12->_inclineLabel, v237, (uint64_t)v12->_inclineUnknown, v238);
      objc_msgSend_addSubview_(v12->_elevationView, v239, (uint64_t)v12->_inclineLabel, v240);
    }
    objc_msgSend_addSubview_(v12->_elevationView, v224, (uint64_t)v12->_elevationLabel, v225);
    v244 = objc_msgSend_layer(v12, v241, v242, v243);
    objc_msgSend_setMasksToBounds_(v244, v245, 1, v246);

    v250 = objc_msgSend_layer(v12, v247, v248, v249);
    objc_msgSend_setActions_(v250, v251, (uint64_t)v257, v252);

    objc_msgSend_locationUpdated_(v12, v253, 0, v254);
    v255 = v12;
  }
  return v12;
}

- (double)_fontSize
{
  int IsTallScript = CLKLanguageIsTallScript();
  double result = 10.0;
  if (IsTallScript) {
    return 9.0;
  }
  return result;
}

- (void)_setupStrings
{
  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_GPS_RING_LAT_LONG_FORMAT", @"%@   %@");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  gpsCoordinatesFormat = self->_gpsCoordinatesFormat;
  self->_gpsCoordinatesFormat = v3;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v5, @"GALLEON_GPS_RING_LAT_LONG_UNKNOWN", @"LATITUDE --°--‘--“   LONGITUDE --°--‘--“ ");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  gpsCoordinatesUnknown = self->_gpsCoordinatesUnknown;
  self->_gpsCoordinatesUnknown = v6;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v8, @"GALLEON_GPS_RING_TIMESTAMP_FORMAT", @"UPDATED %@MINS AGO");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampFormat = self->_timestampFormat;
  self->_timestampFormat = v9;

  uint64_t v13 = objc_msgSend_rangeOfString_(self->_timestampFormat, v11, @"%ld", v12);
  if (v14)
  {
    objc_msgSend_stringByReplacingCharactersInRange_withString_(self->_timestampFormat, v14, v13, (uint64_t)v14, @"%@");
    uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = self->_timestampFormat;
    self->_timestampFormat = v15;
  }
  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v14, @"GALLEON_GPS_RING_TIMESTAMP_ONE_MIN", @"UPDATED 1MIN AGO");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampOneMinute = self->_timestampOneMinute;
  self->_timestampOneMinute = v17;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v19, @"GALLEON_GPS_RING_TIMESTAMP_NO_UPDATE", @"POSITION UNKNOWN");
  uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampNoUpdate = self->_timestampNoUpdate;
  self->_timestampNoUpdate = v20;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v22, @"GALLEON_GPS_RING_TIMESTAMP_RECENT", @"JUST UPDATED");
  uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampJustUpdated = self->_timestampJustUpdated;
  self->_timestampJustUpdated = v23;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v25, @"GALLEON_GPS_RING_TIMESTAMP_NOT_AVAILABLE", @"POSITION UNAVAILABLE");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampNotAvailable = self->_timestampNotAvailable;
  self->_timestampNotAvailable = v26;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v28, @"GALLEON_GPS_RING_TIMESTAMP_UPDATING", @"UPDATING…");
  uint64_t v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  timestampUpdating = self->_timestampUpdating;
  self->_timestampUpdating = v29;

  device = self->_device;
  id v32 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v35 = objc_msgSend_initWithUUIDString_(v32, v33, @"DAB81146-4105-445B-94AD-14033A199AC4", v34);
  LOBYTE(device) = objc_msgSend_supportsCapability_(device, v36, (uint64_t)v35, v37);

  if ((device & 1) == 0)
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v38, @"GALLEON_GPS_RING_INCLINE_FORMAT", @"INCLINE %@");
    uint64_t v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    inclineFormat = self->_inclineFormat;
    self->_inclineFormat = v39;

    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v41, @"GALLEON_GPS_RING_INCLINE_UNKNOWN", @"UNKNOWN INCLINE");
    uint64_t v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    inclineUnknown = self->_inclineUnknown;
    self->_inclineUnknown = v42;
  }
  if (self->_usesMetric) {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v38, @"GALLEON_GPS_RING_ELEVATION_FORMAT_METRIC", @"ELEVATION %@");
  }
  else {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v38, @"GALLEON_GPS_RING_ELEVATION_FORMAT_US", @"ELEVATION %@");
  }
  id v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  elevationFormat = self->_elevationFormat;
  self->_elevationFormat = v44;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v46, @"GALLEON_GPS_RING_ELEVATION_UNKNOWN", @"UNKNOWN ELEVATION");
  uint64_t v47 = (NSString *)objc_claimAutoreleasedReturnValue();
  elevationUnknown = self->_elevationUnknown;
  self->_elevationUnknown = v47;

  objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v49, @"GALLEON_GPS_RING_ELEVATION_APPROXIMATE_FORMAT", @"~%@");
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  elevationApproximateFormat = self->_elevationApproximateFormat;
  self->_elevationApproximateFormat = v50;

  MEMORY[0x270F9A758](v50, elevationApproximateFormat);
}

- (void)layoutSubviews
{
  v88.receiver = self;
  v88.super_class = (Class)NTKGalleonGPSRingView;
  [(NTKGalleonGPSRingView *)&v88 layoutSubviews];
  double v3 = sub_246B41CB0(self->_device);
  objc_msgSend_bounds(self, v4, v5, v6);
  CGRect v90 = CGRectInset(v89, 0.25, 0.25);
  double x = v90.origin.x;
  double y = v90.origin.y;
  double width = v90.size.width;
  double height = v90.size.height;
  double v11 = v90.size.width * 0.5 - v3 + 2.0;
  double v12 = v90.size.width * 0.5 + -2.0;
  self->_ringCenterRadius = (v12 + v11) * 0.5;
  sub_246B41CB0(self->_device);
  self->_dotRadiansStandoff = v13 * 3.0 / (self->_ringCenterRadius * 3.14159265 + self->_ringCenterRadius * 3.14159265);
  objc_msgSend__positionRingViews(self, v14, v15, v16);
  objc_msgSend__positionDotsForCenterAngle_leftDot_rightDot_(self, v17, (uint64_t)self->_leftLatLongDotLayer, (uint64_t)self->_rightLatLongDotLayer, 1.04719755);
  device = self->_device;
  id v19 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v22 = objc_msgSend_initWithUUIDString_(v19, v20, @"DAB81146-4105-445B-94AD-14033A199AC4", v21);
  uint64_t v25 = objc_msgSend_supportsCapability_(device, v23, (uint64_t)v22, v24);

  if ((v25 & 1) == 0) {
    objc_msgSend__positionDotsForCenterAngle_leftDot_rightDot_(self, v26, (uint64_t)self->_leftInclElevDotLayer, (uint64_t)self->_rightInclElevDotLayer, 1.57079633);
  }
  sub_246B41CB0(self->_device);
  double v28 = v27 * 0.5;
  objc_msgSend_setCornerRadius_(self->_leftLatLongDotLayer, v29, v30, v31, v27 * 0.5);
  objc_msgSend_setCornerRadius_(self->_rightLatLongDotLayer, v32, v33, v34, v28);
  if ((v25 & 1) == 0)
  {
    objc_msgSend_setCornerRadius_(self->_leftInclElevDotLayer, v35, v36, v37, v28);
    objc_msgSend_setCornerRadius_(self->_rightInclElevDotLayer, v38, v39, v40, v28);
  }
  p_coordinatesLabel = (uint64_t *)&self->_coordinatesLabel;
  objc_msgSend_setFrame_(self->_coordinatesLabel, v35, v36, v37, x, y, width, height);
  objc_msgSend_setClipsToBounds_(self->_coordinatesLabel, v42, 0, v43);
  objc_msgSend_setCircleRadius_(self->_coordinatesLabel, v44, v45, v46, v11);
  objc_msgSend_setCenterAngle_(self->_coordinatesLabel, v47, v48, v49, 0.0);
  p_timestampLabel = (uint64_t *)&self->_timestampLabel;
  objc_msgSend_setFrame_(self->_timestampLabel, v51, v52, v53, x, y, width, height);
  objc_msgSend_setCircleRadius_(self->_timestampLabel, v54, v55, v56, v12);
  objc_msgSend_setCenterAngle_(self->_timestampLabel, v57, v58, v59, 0.0);
  objc_msgSend_setInterior_(self->_timestampLabel, v60, 1, v61);
  p_elevationLabel = (uint64_t *)&self->_elevationLabel;
  objc_msgSend_setFrame_(self->_elevationLabel, v63, v64, v65, x, y, width, height);
  objc_msgSend_setClipsToBounds_(self->_elevationLabel, v66, 0, v67);
  objc_msgSend_setCircleRadius_(self->_elevationLabel, v68, v69, v70, v11);
  objc_msgSend_setCenterAngle_(self->_elevationLabel, v71, v72, v73, 0.0);
  if ((v25 & 1) == 0)
  {
    objc_msgSend_setFrame_(self->_inclineLabel, v74, v75, v76, x, y, width, height);
    objc_msgSend_setCircleRadius_(self->_inclineLabel, v77, v78, v79, v12);
    objc_msgSend_setCenterAngle_(self->_inclineLabel, v80, v81, v82, 0.0);
    objc_msgSend_setInterior_(self->_inclineLabel, v83, 1, v84);
    objc_msgSend__layoutCurvedLabel_top_(self, v85, *p_coordinatesLabel, 1);
    p_coordinatesLabel = (uint64_t *)&self->_timestampLabel;
    p_timestampLabel = (uint64_t *)&self->_elevationLabel;
    p_elevationLabel = (uint64_t *)&self->_inclineLabel;
  }
  objc_msgSend__layoutCurvedLabel_top_(self, v74, *p_coordinatesLabel, v25);
  objc_msgSend__layoutCurvedLabel_top_(self, v86, *p_timestampLabel, v25 ^ 1);
  objc_msgSend__layoutCurvedLabel_top_(self, v87, *p_elevationLabel, v25);
}

- (void)_positionDotsForCenterAngle:(double)a3 leftDot:(id)a4 rightDot:(id)a5
{
  double v7 = 4.71238898 - a3;
  double v8 = a3 + 4.71238898;
  id v28 = a5;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_bounds(self, v10, v11, v12);
  double v14 = MEMORY[0x24C542570](v13);
  double v16 = v15;
  sub_246B41CB0(self->_device);
  double v18 = v17;
  __double2 v19 = __sincos_stret(v7);
  double ringCenterRadius = self->_ringCenterRadius;
  __double2 v21 = __sincos_stret(v8);
  objc_msgSend_setFrame_(v9, v22, v23, v24, v14 + v19.__cosval * ringCenterRadius - v18 * 0.5, v16 - v19.__sinval * ringCenterRadius - v18 * 0.5, v18, v18);

  objc_msgSend_setFrame_(v28, v25, v26, v27, v14 + v21.__cosval * ringCenterRadius - v18 * 0.5, v16 - v21.__sinval * ringCenterRadius - v18 * 0.5, v18, v18);
}

- (double)ringThickness
{
  double v3 = sub_246B41CB0(self->_device);
  return v4 * (1.0 - self->_ringFraction) + v3 * self->_ringFraction;
}

- (double)minimumRingThickness
{
  sub_246B41CB0(self->_device);
  return v2;
}

- (void)setPalette:(id)a3
{
  id v32 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  ringLayer = self->_ringLayer;
  objc_msgSend_gpsRingBackgroundColor(v32, v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_CGColor(v9, v10, v11, v12);
  objc_msgSend_setBorderColor_(ringLayer, v14, v13, v15);

  ringView = self->_ringView;
  uint64_t v20 = objc_msgSend_outerRingBackgroundColor(v32, v17, v18, v19);
  objc_msgSend_setBackgroundColor_(ringView, v21, (uint64_t)v20, v22);

  if ((objc_msgSend_isHidden(self->_latLongView, v23, v24, v25) & 1) == 0) {
    objc_msgSend__updateLatLongColors(self, v26, v27, v28);
  }
  if ((objc_msgSend_isHidden(self->_elevationView, v26, v27, v28) & 1) == 0) {
    objc_msgSend__updateElevationColors(self, v29, v30, v31);
  }
}

- (void)_updateLatLongColors
{
  leftLatLongDotLayer = self->_leftLatLongDotLayer;
  objc_msgSend_gpsRingDotColor(self->_palette, a2, v2, v3);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_CGColor(v6, v7, v8, v9);
  objc_msgSend_setBackgroundColor_(leftLatLongDotLayer, v11, v10, v12);

  rightLatLongDotLayer = self->_rightLatLongDotLayer;
  objc_msgSend_gpsRingDotColor(self->_palette, v14, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_CGColor(v17, v18, v19, v20);
  objc_msgSend_setBackgroundColor_(rightLatLongDotLayer, v22, v21, v23);

  coordinatesLabel = self->_coordinatesLabel;
  uint64_t v28 = objc_msgSend_gpsRingTextColor(self->_palette, v25, v26, v27);
  objc_msgSend_setTextColor_(coordinatesLabel, v29, (uint64_t)v28, v30);

  timestampLabel = self->_timestampLabel;
  objc_msgSend_gpsRingTextColor(self->_palette, v32, v33, v34);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(timestampLabel, v35, (uint64_t)v37, v36);
}

- (void)setIncline:(double)a3
{
  if (self->_incline != a3)
  {
    self->_incline = a3;
    device = self->_device;
    id v6 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v9 = objc_msgSend_initWithUUIDString_(v6, v7, @"DAB81146-4105-445B-94AD-14033A199AC4", v8);
    LOBYTE(device) = objc_msgSend_supportsCapability_(device, v10, (uint64_t)v9, v11);

    if ((device & 1) == 0)
    {
      if (a3 >= 1.79769313e308)
      {
        double v14 = self->_inclineUnknown;
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v12, (uint64_t)self->_inclineFormat, v13, *(void *)&a3);
        double v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      obj = v14;
      if ((objc_msgSend_isEqualToString_(v14, v15, (uint64_t)self->_currentInclineText, v16) & 1) == 0)
      {
        objc_storeStrong((id *)&self->_currentInclineText, obj);
        objc_msgSend__updateCurvedLabel_withString_top_(self, v17, (uint64_t)self->_inclineLabel, (uint64_t)obj, 0);
      }
    }
  }
}

- (void)_updateElevationColors
{
  elevationLabel = self->_elevationLabel;
  id v6 = objc_msgSend_gpsRingTextColor(self->_palette, a2, v2, v3);
  objc_msgSend_setTextColor_(elevationLabel, v7, (uint64_t)v6, v8);

  device = self->_device;
  id v10 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v13 = objc_msgSend_initWithUUIDString_(v10, v11, @"DAB81146-4105-445B-94AD-14033A199AC4", v12);
  LOBYTE(device) = objc_msgSend_supportsCapability_(device, v14, (uint64_t)v13, v15);

  if ((device & 1) == 0)
  {
    inclineLabel = self->_inclineLabel;
    uint64_t v20 = objc_msgSend_gpsRingTextColor(self->_palette, v16, v17, v18);
    objc_msgSend_setTextColor_(inclineLabel, v21, (uint64_t)v20, v22);

    leftInclElevDotLayer = self->_leftInclElevDotLayer;
    objc_msgSend_gpsRingDotColor(self->_palette, v24, v25, v26);
    id v27 = objc_claimAutoreleasedReturnValue();
    uint64_t v31 = objc_msgSend_CGColor(v27, v28, v29, v30);
    objc_msgSend_setBackgroundColor_(leftInclElevDotLayer, v32, v31, v33);

    rightInclElevDotLayer = self->_rightInclElevDotLayer;
    objc_msgSend_gpsRingDotColor(self->_palette, v35, v36, v37);
    id v44 = objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_CGColor(v44, v38, v39, v40);
    objc_msgSend_setBackgroundColor_(rightInclElevDotLayer, v42, v41, v43);
  }
}

- (void)locationUnavailable
{
  objc_msgSend__updateCurvedLabel_withString_top_(self, a2, (uint64_t)self->_coordinatesLabel, (uint64_t)self->_gpsCoordinatesUnknown, 1);
  objc_msgSend__updateCurvedLabel_withString_top_(self, v3, (uint64_t)self->_timestampLabel, (uint64_t)self->_timestampNotAvailable, 0);
  self->_locationUnavailable = 1;
}

- (void)locationUpdated:(id)a3
{
  if (a3)
  {
    uint64_t v5 = NTKLocationComponentStringsShowSecondsAndLatLongTitle();
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x263F57908], v7);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v5, v9, *MEMORY[0x263F57910], v10);
    objc_msgSend_stringWithFormat_(NSString, v12, (uint64_t)self->_gpsCoordinatesFormat, v13, v8, v11);
    uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_setAltitude_(self, a2, 0, v3, 1.79769313e308);
    objc_msgSend_setLatency_(self, v15, v16, v17, 1.79769313e308);
    uint64_t v18 = self->_gpsCoordinatesUnknown;
  }
  self->_locationUnavailable = 0;
  objc_msgSend__updateCurvedLabel_withString_top_(self, v14, (uint64_t)self->_coordinatesLabel, (uint64_t)v18, 1);
}

- (void)setAltitude:(double)a3
{
}

- (void)setAltitude:(double)a3 approximate:(BOOL)a4
{
  if (self->_altitude != a3)
  {
    self->_altitude = a3;
    if (a3 >= 1.79769313e308)
    {
      uint64_t v19 = self->_elevationUnknown;
    }
    else
    {
      BOOL v6 = a4;
      elevationFormatter = self->_elevationFormatter;
      uint64_t v8 = objc_msgSend_numberWithDouble_(NSNumber, a2, a4, v4);
      uint64_t v11 = objc_msgSend_stringFromNumber_(elevationFormatter, v9, (uint64_t)v8, v10);

      objc_msgSend_stringWithFormat_(NSString, v12, (uint64_t)self->_elevationFormat, v13, v11);
      double v14 = (const char *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        obja = (char *)v14;
        uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v14, (uint64_t)self->_elevationApproximateFormat, v15, v14);

        double v14 = (const char *)v16;
      }
      objb = (NSString *)v14;

      uint64_t v19 = objb;
    }
    obj = v19;
    if ((objc_msgSend_isEqualToString_(v19, v17, (uint64_t)self->_currentElevationText, v18) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentElevationText, obj);
      objc_msgSend__updateCurvedLabel_withString_top_(self, v20, (uint64_t)self->_elevationLabel, (uint64_t)obj, 1);
    }
  }
}

- (void)setLatency:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  latencdouble y = self->_latency;
  BOOL v8 = floor(a3) != floor(latency);
  int v10 = a3 != 1.79769313e308 && latency == 1.79769313e308 || v8;
  if (latency == a3) {
    return;
  }
  self->_latencdouble y = a3;
  if (a3 >= 1.79769313e308)
  {
    uint64_t v11 = 608;
  }
  else if (a3 >= 1.0)
  {
    if (!v10) {
      return;
    }
    if ((uint64_t)a3 != 1)
    {
      uint64_t v13 = objc_msgSend_localizedStringWithFormat_(NSString, v5, @"%ld", v6, (uint64_t)a3);
      objc_msgSend_stringWithFormat_(NSString, v14, (uint64_t)self->_timestampFormat, v15, v13);
      uint64_t v17 = (const char *)objc_claimAutoreleasedReturnValue();

      uint64_t v12 = v17;
      if (!v17) {
        return;
      }
      goto LABEL_13;
    }
    uint64_t v11 = 600;
  }
  else
  {
    uint64_t v11 = 616;
  }
  uint64_t v12 = (const char *)*(id *)((char *)&self->super.super.super.isa + v11);
  if (!v12) {
    return;
  }
LABEL_13:
  uint64_t v16 = (char *)v12;
  objc_msgSend__updateCurvedLabel_withString_top_(self, v12, (uint64_t)self->_timestampLabel, (uint64_t)v12, 0);
}

- (void)_updateCurvedLabel:(id)a3 withString:(id)a4 top:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  objc_msgSend_setText_(v11, v8, (uint64_t)a4, v9);
  objc_msgSend__layoutCurvedLabel_top_(self, v10, (uint64_t)v11, v5);
}

- (void)_layoutCurvedLabel:(id)a3 top:(BOOL)a4
{
  id v6 = a3;
  objc_msgSend_bounds(self, v7, v8, v9);
  CGRect v34 = CGRectInset(v33, (v33.size.width - v33.size.width) * 0.5, (v33.size.height - v33.size.width) * 0.5);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  objc_msgSend_sizeToFit(v6, v14, v15, v16);
  double v31 = 0.0;
  double v32 = 0.0;
  long long v30 = *MEMORY[0x263F00148];
  uint64_t TextCenter_startAngle_endAngle = objc_msgSend_getTextCenter_startAngle_endAngle_(v6, v17, (uint64_t)&v30, (uint64_t)&v32, &v31);
  double v19 = MEMORY[0x24C542570](TextCenter_startAngle_endAngle, x, y, width, height);
  double v20 = v19 - *(double *)&v30;
  double v22 = v21 - *((double *)&v30 + 1);
  objc_msgSend_frame(v6, v23, v24, v25);
  objc_msgSend_setFrame_(v6, v26, v27, v28, v20, v22);

  if (!a4)
  {
    double v31 = fabs(v31);
    double v32 = fabs(v32);
    objc_msgSend__positionDotsForCenterAngle_leftDot_rightDot_(self, v29, (uint64_t)self->_leftLatLongDotLayer, (uint64_t)self->_rightLatLongDotLayer, fmax((v32 - v31) * 0.5 + self->_dotRadiansStandoff, 1.04719755));
  }
}

- (void)setBezelStyle:(unint64_t)a3
{
  self->_bezelStyle = a3;
  double v5 = 0.0;
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  self->_latLongFraction = v6;
  if (a3 == 1) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  self->_elevationFraction = v7;
  if (a3 != 2) {
    double v5 = 1.0;
  }
  self->_ringFraction = v5;
  objc_msgSend__updateLabelVisibility(self, a2, a3, v3);

  MEMORY[0x270F9A6D0](self, sel__updateRingThickness, v8, v9);
}

- (BOOL)gpsRingEnabled
{
  return self->_bezelStyle != 2;
}

- (double)getRingDiameter
{
  objc_msgSend_frame(self->_ringView, a2, v2, v3);
  return v4;
}

- (void)applyTransitionFraction:(double)a3 fromBezelStyle:(unint64_t)a4 toBezelStyle:(unint64_t)a5
{
  CLKInterpolateBetweenFloatsClipped();
  self->_ringFraction = v6;
  CLKInterpolateBetweenFloatsClipped();
  self->_latLongFraction = v7;
  CLKInterpolateBetweenFloatsClipped();
  self->_elevationFraction = v8;
  objc_msgSend__updateLabelVisibility(self, v9, v10, v11);

  MEMORY[0x270F9A6D0](self, sel__updateRingThickness, v12, v13);
}

- (void)_updateLabelVisibility
{
  if (self->_bezelStyle == 1) {
    BOOL v5 = (NTKHasRegionalGeoRestrictions() & 1) != 0 || self->_locationUnavailable;
  }
  else {
    BOOL v5 = 0;
  }
  int isHidden = objc_msgSend_isHidden(self->_latLongView, a2, v2, v3);
  int v10 = objc_msgSend_isHidden(self->_elevationView, v7, v8, v9);
  double elevationFraction = self->_elevationFraction;
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  if (v5)
  {
    double latLongFraction = self->_latLongFraction;
    double v17 = v14 + -0.5;
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    double latLongFraction = v18;
    double v17 = 0.5;
    double elevationFraction = v15;
  }
  objc_msgSend_setHidden_(self->_latLongView, v12, latLongFraction == 0.0, v13);
  objc_msgSend_setHidden_(self->_elevationView, v19, elevationFraction == 0.0, v20);
  if (isHidden && (objc_msgSend_isHidden(self->_latLongView, v21, v22, v23) & 1) == 0) {
    objc_msgSend__updateLatLongColors(self, v21, v22, v23);
  }
  if (v10 && (objc_msgSend_isHidden(self->_elevationView, v21, v22, v23) & 1) == 0) {
    objc_msgSend__updateElevationColors(self, v21, v22, v23);
  }
  if (latLongFraction + -0.5 <= 0.0) {
    objc_msgSend_setAlpha_(self->_latLongView, v21, v22, v23, 0.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_latLongView, v21, v22, v23, latLongFraction + -0.5 + latLongFraction + -0.5);
  }
  device = self->_device;
  id v25 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v28 = objc_msgSend_initWithUUIDString_(v25, v26, @"DAB81146-4105-445B-94AD-14033A199AC4", v27);
  LOBYTE(device) = objc_msgSend_supportsCapability_(device, v29, (uint64_t)v28, v30);

  if ((device & 1) == 0)
  {
    double v34 = v17 + v17;
    if (v17 <= 0.0) {
      double v34 = 0.0;
    }
    objc_msgSend_setAlpha_(self->_inclineLabel, v31, v32, v33, v34);
  }
  if (elevationFraction + -0.5 <= 0.0) {
    double v35 = 0.0;
  }
  else {
    double v35 = elevationFraction + -0.5 + elevationFraction + -0.5;
  }
  elevationView = self->_elevationView;

  objc_msgSend_setAlpha_(elevationView, v31, v32, v33, v35);
}

- (void)applyTritiumFraction:(double)a3
{
  self->_tritiumFraction = a3;
  objc_msgSend__updateLabelVisibility(self, a2, v3, v4);
}

- (CGRect)_ringFrame
{
  double v3 = sub_246B41CB0(self->_device);
  objc_msgSend_ringThickness(self, v4, v5, v6);
  double v8 = v3 - v7;
  objc_msgSend_bounds(self, v9, v10, v11);
  if (v8 != 0.0) {
    *(CGRect *)&CGFloat v12 = CGRectInset(*(CGRect *)&v12, v8, v8);
  }
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_positionRingViews
{
  objc_msgSend_bounds(self, a2, v2, v3);
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat height = v51.size.height;
  double MidX = CGRectGetMidX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v52);
  objc_msgSend__ringFrame(self, v11, v12, v13);
  CGFloat v14 = v53.origin.x;
  CGFloat v15 = v53.origin.y;
  CGFloat v16 = v53.size.width;
  CGFloat v17 = v53.size.height;
  CGRect v54 = CGRectInset(v53, -1.0, -1.0);
  CGFloat v47 = v54.origin.y;
  CGFloat v48 = v54.origin.x;
  CGFloat v45 = v54.size.height;
  CGFloat v46 = v54.size.width;
  objc_msgSend_setBounds_(self->_ringView, v18, v19, v20);
  objc_msgSend_setCenter_(self->_ringView, v21, v22, v23, MidX, MidY);
  ringLayer = self->_ringLayer;
  v55.origin.CGFloat x = v14;
  v55.origin.CGFloat y = v15;
  v55.size.CGFloat width = v16;
  v55.size.CGFloat height = v17;
  double v25 = CGRectGetWidth(v55);
  v56.origin.CGFloat x = v14;
  v56.origin.CGFloat y = v15;
  v56.size.CGFloat width = v16;
  v56.size.CGFloat height = v17;
  CGFloat v26 = CGRectGetHeight(v56);
  objc_msgSend_setBounds_(ringLayer, v27, v28, v29, 1.0, 1.0, v25, v26);
  objc_msgSend_setPosition_(self->_ringLayer, v30, v31, v32, MidX, MidY);
  uint64_t v33 = self->_ringLayer;
  v57.origin.CGFloat x = v14;
  v57.origin.CGFloat y = v15;
  v57.size.CGFloat width = v16;
  v57.size.CGFloat height = v17;
  CGFloat v34 = CGRectGetWidth(v57);
  objc_msgSend_setCornerRadius_(v33, v35, v36, v37, v34 * 0.5);
  objc_msgSend_layer(self->_ringView, v38, v39, v40);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  v58.origin.CGFloat y = v47;
  v58.origin.CGFloat x = v48;
  v58.size.CGFloat height = v45;
  v58.size.CGFloat width = v46;
  CGFloat v41 = CGRectGetWidth(v58);
  objc_msgSend_setCornerRadius_(v49, v42, v43, v44, v41 * 0.5);
}

- (void)_updateRingThickness
{
  objc_msgSend__positionRingViews(self, a2, v2, v3);
  ringLayer = self->_ringLayer;
  objc_msgSend_ringThickness(self, v6, v7, v8);

  objc_msgSend_setBorderWidth_(ringLayer, v9, v10, v11);
}

- (double)_easeInCurveWithFraction:(double)a3
{
  return (sin((a3 + -0.5) * 3.14159265) + 1.0) * 0.5;
}

- (NTKGalleonColorPalette)palette
{
  return self->_palette;
}

- (unint64_t)bezelStyle
{
  return self->_bezelStyle;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)incline
{
  return self->_incline;
}

- (double)latency
{
  return self->_latency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_currentInclineText, 0);
  objc_storeStrong((id *)&self->_currentElevationText, 0);
  objc_storeStrong((id *)&self->_elevationApproximateFormat, 0);
  objc_storeStrong((id *)&self->_elevationUnknown, 0);
  objc_storeStrong((id *)&self->_elevationFormat, 0);
  objc_storeStrong((id *)&self->_inclineUnknown, 0);
  objc_storeStrong((id *)&self->_inclineFormat, 0);
  objc_storeStrong((id *)&self->_timestampUpdating, 0);
  objc_storeStrong((id *)&self->_timestampNotAvailable, 0);
  objc_storeStrong((id *)&self->_timestampJustUpdated, 0);
  objc_storeStrong((id *)&self->_timestampNoUpdate, 0);
  objc_storeStrong((id *)&self->_timestampOneMinute, 0);
  objc_storeStrong((id *)&self->_timestampFormat, 0);
  objc_storeStrong((id *)&self->_gpsCoordinatesUnknown, 0);
  objc_storeStrong((id *)&self->_gpsCoordinatesFormat, 0);
  objc_storeStrong((id *)&self->_elevationFormatter, 0);
  objc_storeStrong((id *)&self->_inclineLabel, 0);
  objc_storeStrong((id *)&self->_elevationLabel, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_coordinatesLabel, 0);
  objc_storeStrong((id *)&self->_rightInclElevDotLayer, 0);
  objc_storeStrong((id *)&self->_leftInclElevDotLayer, 0);
  objc_storeStrong((id *)&self->_rightLatLongDotLayer, 0);
  objc_storeStrong((id *)&self->_leftLatLongDotLayer, 0);
  objc_storeStrong((id *)&self->_elevationView, 0);
  objc_storeStrong((id *)&self->_latLongView, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end