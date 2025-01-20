@interface CompassRichRectangularDialView
- (BOOL)supportsGossamer;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (id)_filtersForStyle:(int64_t)a3 fraction:(id)a4;
- (id)_newLabelWithFont:(id)a3 color:(id)a4 text:(id)a5;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)redactionLabel;
- (void)_applyFilters:(id)a3 toLayers:(id)a4;
- (void)_applyFilters:(id)a3 toViews:(id)a4;
- (void)_createAngles;
- (void)_createBearingTicks;
- (void)_createDirections;
- (void)_createTicks;
- (void)_updateForMonochrome:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CompassRichRectangularDialView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_bearingTicks, 0);
  objc_storeStrong((id *)&self->_ticks, 0);
  objc_storeStrong((id *)&self->_angles, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_wheelContainer, 0);
  objc_storeStrong((id *)&self->_needleShadow, 0);
  objc_storeStrong((id *)&self->_needleView, 0);
  objc_storeStrong((id *)&self->_bearingLabel, 0);
  objc_storeStrong((id *)&self->_directionLabel, 0);

  objc_storeStrong((id *)&self->_headingLabel, 0);
}

- (void)layoutSubviews
{
  v261.receiver = self;
  v261.super_class = (Class)CompassRichRectangularDialView;
  [(CompassRichRectangularDialView *)&v261 layoutSubviews];
  double v260 = 0.0;
  long long v258 = 0u;
  long long v259 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v247 = 0u;
  sub_2375A0048(self->_device, (uint64_t)&v247);
  objc_msgSend_bounds(self, v3, v4, v5);
  CGFloat x = v262.origin.x;
  CGFloat y = v262.origin.y;
  CGFloat width = v262.size.width;
  CGFloat height = v262.size.height;
  double v241 = CGRectGetWidth(v262);
  v263.origin.CGFloat x = x;
  v263.origin.CGFloat y = y;
  v263.size.CGFloat width = width;
  CGFloat v243 = height;
  v263.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v263);
  CGFloat v240 = y;
  double v11 = *(double *)&v249;
  double v242 = *((double *)&v248 + 1);
  int IsRTL = NanoCompassComplicationLayoutIsRTL();
  CGFloat rect = width;
  CGFloat v233 = x;
  double v234 = v10;
  objc_msgSend_frame(self->_headingLabel, v13, v14, v15);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  objc_msgSend_frame(self->_directionLabel, v24, v25, v26);
  double v27 = v264.size.width;
  CGFloat v235 = v264.origin.y;
  CGFloat v236 = v264.origin.x;
  double v238 = v264.size.height;
  double v28 = CGRectGetWidth(v264);
  double v29 = v260;
  v265.origin.CGFloat x = v17;
  v265.origin.CGFloat y = v19;
  v265.size.CGFloat width = v21;
  v265.size.CGFloat height = v23;
  double v30 = CGRectGetWidth(v265);
  objc_msgSend__lastLineBaseline(self->_headingLabel, v31, v32, v33);
  if (IsRTL) {
    double v38 = v241 - v11 - v28 - v29 - v30;
  }
  else {
    double v38 = v11;
  }
  CGFloat v39 = v242 - v37;
  objc_msgSend_setFrame_(self->_headingLabel, v34, v35, v36, v38, v242 - v37, v21, v23);
  v266.origin.CGFloat x = v38;
  v266.origin.CGFloat y = v39;
  v266.size.CGFloat width = v21;
  v266.size.CGFloat height = v23;
  double v40 = CGRectGetWidth(v266);
  double v41 = v260;
  v267.origin.CGFloat y = v235;
  v267.origin.CGFloat x = v236;
  v267.size.CGFloat width = v27;
  v267.size.CGFloat height = v238;
  double v42 = CGRectGetWidth(v267);
  objc_msgSend__lastLineBaseline(self->_directionLabel, v43, v44, v45);
  if (IsRTL) {
    objc_msgSend_setFrame_(self->_directionLabel, v46, v47, v48, v241 - v42 - v11, v242 - v49, v27, v238);
  }
  else {
    objc_msgSend_setFrame_(self->_directionLabel, v46, v47, v48, v11 + v40 + v41, v242 - v49, v27, v238);
  }
  objc_msgSend_frame(self->_bearingLabel, v50, v51, v52);
  double v60 = v58;
  double v61 = v59;
  if ((IsRTL & 1) == 0) {
    double v11 = v241 - CGRectGetWidth(*(CGRect *)&v56) - v11;
  }
  objc_msgSend__lastLineBaseline(self->_bearingLabel, v53, v54, v55);
  objc_msgSend_setFrame_(self->_bearingLabel, v63, v64, v65, v11, v242 - v62, v60, v61);
  int v72 = objc_msgSend_supportsGossamer(self, v66, v67, v68);
  needleView = self->_needleView;
  if (v72)
  {
    double v74 = *((double *)&v258 + 1);
    objc_msgSend_frame(needleView, v69, v70, v71);
    CLKRectCenteredXInRectForDevice();
    double v75 = v268.origin.x;
    double v76 = v268.size.width;
    double v77 = v268.size.height;
    CGFloat v78 = CGRectGetHeight(v268);
    objc_msgSend_setFrame_(self->_needleView, v79, v80, v81, v75, v234 - v74 - v78, v76, v77);
  }
  else
  {
    double v82 = *(double *)&v259;
    objc_msgSend_frame(needleView, v69, v70, v71);
    CLKRectCenteredXInRectForDevice();
    double v83 = v269.origin.x;
    double v84 = v269.size.width;
    double v85 = v269.size.height;
    CGFloat v86 = CGRectGetHeight(v269);
    double v87 = v234 - v82;
    objc_msgSend_setFrame_(self->_needleView, v88, v89, v90, v83, v87 - v86, v84, v85);
    objc_msgSend_frame(self->_needleShadow, v91, v92, v93);
    CLKRectCenteredXInRectForDevice();
    double v94 = v270.origin.x;
    double v95 = v270.size.width;
    double v96 = v270.size.height;
    CGFloat v97 = CGRectGetHeight(v270);
    objc_msgSend_setFrame_(self->_needleShadow, v98, v99, v100, v94, v87 - v97, v95, v96);
  }
  v271.origin.CGFloat x = v233;
  v271.origin.CGFloat y = v240;
  v271.size.CGFloat width = rect;
  v271.size.CGFloat height = v243;
  double v101 = CGRectGetHeight(v271);
  v272.origin.CGFloat x = v233;
  v272.origin.CGFloat y = v240;
  v272.size.CGFloat width = rect;
  v272.size.CGFloat height = v243;
  double v102 = CGRectGetWidth(v272);
  v273.origin.CGFloat x = v233;
  v273.origin.CGFloat y = v240;
  v273.size.CGFloat width = rect;
  v273.size.CGFloat height = v243;
  double v103 = CGRectGetWidth(v273);
  v274.origin.CGFloat x = v233;
  v274.origin.CGFloat y = v240;
  v274.size.CGFloat width = rect;
  v274.size.CGFloat height = v243;
  double v104 = CGRectGetHeight(v274);
  v108 = objc_msgSend_maskView(self->_wheelContainer, v105, v106, v107);
  objc_msgSend_setFrame_(v108, v109, v110, v111, 0.0, 0.0, v103, v104);

  v115 = objc_msgSend_maskView(self->_wheelContainer, v112, v113, v114);
  v119 = objc_msgSend_layer(v115, v116, v117, v118);
  v123 = objc_msgSend_sublayers(v119, v120, v121, v122);

  v126 = objc_msgSend_objectAtIndexedSubscript_(v123, v124, 0, v125);
  objc_msgSend_setFrame_(v126, v127, v128, v129, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 40.0, v101);
  v132 = objc_msgSend_objectAtIndexedSubscript_(v123, v130, 2, v131);
  objc_msgSend_setFrame_(v132, v133, v134, v135, v102 + -40.0, 0.0, 40.0, v101);
  v138 = objc_msgSend_objectAtIndexedSubscript_(v123, v136, 1, v137);
  objc_msgSend_frame(v126, v139, v140, v141);
  double MaxX = CGRectGetMaxX(v275);
  objc_msgSend_frame(v126, v143, v144, v145);
  double MinY = CGRectGetMinY(v276);
  objc_msgSend_frame(v132, v147, v148, v149);
  double MinX = CGRectGetMinX(v277);
  objc_msgSend_frame(v126, v151, v152, v153);
  double v154 = CGRectGetMaxX(v278);
  objc_msgSend_frame(v126, v155, v156, v157);
  CGFloat v158 = CGRectGetHeight(v279);
  objc_msgSend_setFrame_(v138, v159, v160, v161, MaxX, MinY, MinX - v154, v158);
  v280.origin.CGFloat x = v233;
  v280.origin.CGFloat y = v240;
  v280.size.CGFloat width = rect;
  v280.size.CGFloat height = v243;
  CGFloat MidX = CGRectGetMidX(v280);
  v237 = v138;
  v239 = v132;
  double v163 = *(double *)&v251;
  v281.origin.CGFloat x = v233;
  v281.origin.CGFloat y = v240;
  v281.size.CGFloat width = rect;
  v281.size.CGFloat height = v243;
  CGFloat v164 = CGRectGetWidth(v281);
  double v165 = *(double *)&v258;
  double recta = *((double *)&v253 + 1);
  double v166 = *((double *)&v256 + 1);
  v246[1] = 3221225472;
  v246[0] = MEMORY[0x263EF8330];
  v246[2] = sub_2375AD098;
  v246[3] = &unk_264CD57C8;
  v246[4] = self;
  *(CGFloat *)&v246[5] = MidX;
  *(double *)&v246[6] = v164 / v163;
  v167 = (double (**)(void, void))MEMORY[0x237E1C4F0](v246);
  uint64_t v168 = 0;
  double v169 = v234 - v165;
  double v170 = v234 - v166;
  do
  {
    double v171 = v167[2](v167, v168);
    v174 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v172, v168, v173);
    v177 = objc_msgSend_objectForKeyedSubscript_(self->_directions, v175, (uint64_t)v174, v176);
    v181 = v177;
    if (v177)
    {
      objc_msgSend_frame(v177, v178, v179, v180);
      double v182 = v282.size.width;
      double v183 = v282.size.height;
      double v184 = CGRectGetWidth(v282);
      objc_msgSend__lastLineBaseline(v181, v185, v186, v187);
      objc_msgSend_setFrame_(v181, v189, v190, v191, v171 + v184 * -0.5, v169 - v188, v182, v183);
    }
    v192 = objc_msgSend_objectForKeyedSubscript_(self->_angles, v178, (uint64_t)v174, v180);
    v196 = v192;
    if (v192)
    {
      objc_msgSend_frame(v192, v193, v194, v195);
      double v197 = v283.size.width;
      double v198 = v283.size.height;
      double v199 = CGRectGetWidth(v283);
      objc_msgSend__lastLineBaseline(v196, v200, v201, v202);
      objc_msgSend_setFrame_(v196, v204, v205, v206, v171 + v199 * -0.5, recta - v203, v197, v198);
    }
    v207 = objc_msgSend_objectForKeyedSubscript_(self->_ticks, v193, (uint64_t)v174, v195);
    v211 = v207;
    if (v207)
    {
      objc_msgSend_frame(v207, v208, v209, v210);
      CGFloat v212 = v284.origin.y;
      double v213 = v284.size.width;
      double v214 = v284.size.height;
      CGFloat v215 = v171 + CGRectGetWidth(v284) * -0.5;
      v285.origin.CGFloat x = v215;
      v285.origin.CGFloat y = v212;
      v285.size.CGFloat width = v213;
      v285.size.CGFloat height = v214;
      CGFloat v216 = CGRectGetHeight(v285);
      objc_msgSend_setFrame_(v211, v217, v218, v219, v215, v170 - v216, v213, v214);
    }
    v220 = objc_msgSend_objectForKeyedSubscript_(self->_bearingTicks, v208, (uint64_t)v174, v210);
    v224 = v220;
    if (v220)
    {
      objc_msgSend_frame(v220, v221, v222, v223);
      CGFloat v225 = v286.origin.y;
      double v226 = v286.size.width;
      double v227 = v286.size.height;
      CGFloat v228 = v171 + CGRectGetWidth(v286) * -0.5;
      v287.origin.CGFloat x = v228;
      v287.origin.CGFloat y = v225;
      v287.size.CGFloat width = v226;
      v287.size.CGFloat height = v227;
      CGFloat v229 = CGRectGetHeight(v287);
      objc_msgSend_setFrame_(v224, v230, v231, v232, v228, v170 - v229, v226, v227);
    }

    ++v168;
  }
  while (v168 != 360);

  sub_2375A1EA0((uint64_t)&v247);
}

- (id)_newLabelWithFont:(id)a3 color:(id)a4 text:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  CGFloat v10 = objc_opt_new();
  objc_msgSend_setFont_(v10, v11, (uint64_t)v9, v12);

  objc_msgSend_setTextColor_(v10, v13, (uint64_t)v8, v14);
  objc_msgSend_setText_(v10, v15, (uint64_t)v7, v16);

  objc_msgSend_sizeToFit(v10, v17, v18, v19);
  return v10;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)_createBearingTicks
{
  v66[4] = *MEMORY[0x263EF8340];
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  memset(v57, 0, sizeof(v57));
  sub_2375A0048(self->_device, (uint64_t)v57);
  long long v2 = v58;
  long long v3 = v59;
  id v55 = (id)v61;
  uint64_t v56 = (NSDictionary *)objc_opt_new();
  unint64_t v7 = -3;
  do
  {
    HIDWORD(v8) = -286331153 * (unsigned __int16)(v7 + 3);
    LODWORD(v8) = HIDWORD(v8);
    double v9 = *((double *)&v3 + 1);
    if ((v8 >> 1) >= 0x8888889)
    {
      if (-286331153 * (unsigned __int16)(v7 + 3) >= 0x11111112) {
        double v9 = *((double *)&v2 + 1);
      }
      else {
        double v9 = *(double *)&v3;
      }
    }
    CGFloat v10 = objc_msgSend_layer(MEMORY[0x263F15880], v4, v5, v6);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v2, 0.0);
    CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v2, v9);
    objc_msgSend_setPath_(v10, v12, (uint64_t)Mutable, v13);
    id v14 = v55;
    uint64_t v18 = objc_msgSend_CGColor(v14, v15, v16, v17);
    objc_msgSend_setStrokeColor_(v10, v19, v18, v20);
    objc_msgSend_setLineWidth_(v10, v21, v22, v23, *(double *)&v2);
    objc_msgSend_setBounds_(v10, v24, v25, v26, 0.0, 0.0, *(double *)&v2 + *(double *)&v2, v9);
    v65[0] = @"position";
    double v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
    v66[0] = v30;
    v65[1] = @"frame";
    v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v31, v32, v33);
    v66[1] = v34;
    v65[2] = @"bounds";
    double v38 = objc_msgSend_null(MEMORY[0x263EFF9D0], v35, v36, v37);
    v66[2] = v38;
    v65[3] = @"hidden";
    double v42 = objc_msgSend_null(MEMORY[0x263EFF9D0], v39, v40, v41);
    v66[3] = v42;
    uint64_t v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v43, (uint64_t)v66, (uint64_t)v65, 4);
    objc_msgSend_setActions_(v10, v45, (uint64_t)v44, v46);

    objc_msgSend_setHidden_(v10, v47, 1, v48);
    uint64_t v51 = objc_msgSend_numberWithInteger_(NSNumber, v49, v7 + 3, v50);
    objc_msgSend_setObject_forKeyedSubscript_(v56, v52, (uint64_t)v10, (uint64_t)v51);

    CGPathRelease(Mutable);
    v7 += 3;
  }
  while (v7 < 0x165);
  bearingTicks = self->_bearingTicks;
  self->_bearingTicks = v56;

  sub_2375A1EA0((uint64_t)v57);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v217[2] = *MEMORY[0x263EF8340];
  id v192 = a3;
  v215.receiver = self;
  v215.super_class = (Class)CompassRichRectangularDialView;
  uint64_t v5 = [(CompassRichRectangularDialView *)&v215 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_device, a3);
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    CGFloat v10 = objc_msgSend_initWithUUIDString_(v7, v8, @"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E", v9);
    char v13 = objc_msgSend_supportsCapability_(v192, v11, (uint64_t)v10, v12);

    v6->_supportsGossamer = v13;
    objc_msgSend_setClipsToBounds_(v6, v14, 1, v15);
    uint64_t v214 = 0;
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v201 = 0u;
    sub_2375A0048(v6->_device, (uint64_t)&v201);
    uint64_t v16 = objc_opt_new();
    wheelContainer = v6->_wheelContainer;
    v6->_wheelContainer = (UIView *)v16;

    objc_msgSend_addSubview_(v6, v18, (uint64_t)v6->_wheelContainer, v19);
    objc_msgSend__createDirections(v6, v20, v21, v22);
    directions = v6->_directions;
    v199[0] = MEMORY[0x263EF8330];
    v199[1] = 3221225472;
    v199[2] = sub_2375AC834;
    v199[3] = &unk_264CD5758;
    v24 = v6;
    v200 = v24;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(directions, v25, (uint64_t)v199, v26);
    objc_msgSend__createAngles(v24, v27, v28, v29);
    angles = v24->_angles;
    v197[0] = MEMORY[0x263EF8330];
    v197[1] = 3221225472;
    v197[2] = sub_2375AC848;
    v197[3] = &unk_264CD5758;
    v31 = v24;
    double v198 = v31;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(angles, v32, (uint64_t)v197, v33);
    objc_msgSend__createTicks(v31, v34, v35, v36);
    ticks = v31->_ticks;
    v195[0] = MEMORY[0x263EF8330];
    v195[1] = 3221225472;
    v195[2] = sub_2375AC85C;
    v195[3] = &unk_264CD5780;
    double v38 = v31;
    v196 = v38;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(ticks, v39, (uint64_t)v195, v40);
    objc_msgSend__createBearingTicks(v38, v41, v42, v43);
    bearingTicks = v38->_bearingTicks;
    v193[0] = MEMORY[0x263EF8330];
    v193[1] = 3221225472;
    v193[2] = sub_2375AC8C8;
    v193[3] = &unk_264CD5780;
    uint64_t v45 = v38;
    uint64_t v194 = v45;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(bearingTicks, v46, (uint64_t)v193, v47);
    if (objc_msgSend_supportsGossamer(v45, v48, v49, v50))
    {
      id v51 = objc_alloc(MEMORY[0x263F1C6D0]);
      NanoCompassComplicationImageNamed(@"Compass/Rectangular/Needle");
    }
    else
    {
      id v56 = objc_alloc(MEMORY[0x263F1C6D0]);
      v57 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Rectangular/Needle Shadow");
      uint64_t v60 = objc_msgSend_initWithImage_(v56, v58, (uint64_t)v57, v59);
      needleShadow = v45->_needleShadow;
      v45->_needleShadow = (UIImageView *)v60;

      objc_msgSend_addSubview_(v45, v62, (uint64_t)v45->_needleShadow, v63);
      id v51 = objc_alloc(MEMORY[0x263F1C6D0]);
      NanoCompassComplicationImageNamed(@"Compass/Legacy/Rectangular/Needle");
    uint64_t v52 = };
    uint64_t v55 = objc_msgSend_initWithImage_(v51, v53, (uint64_t)v52, v54);
    needleView = v45->_needleView;
    v45->_needleView = (UIImageView *)v55;

    objc_msgSend_addSubview_(v45, v65, (uint64_t)v45->_needleView, v66);
    v69 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v67, v202, v68, v201);
    v73 = objc_msgSend_CLKFontWithMonospacedNumbers(v69, v70, v71, v72);

    uint64_t v74 = objc_opt_new();
    headingLabel = v45->_headingLabel;
    v45->_headingLabel = (UILabel *)v74;

    objc_msgSend_setFont_(v45->_headingLabel, v76, (uint64_t)v73, v77);
    objc_msgSend_setTextColor_(v45->_headingLabel, v78, *((uint64_t *)&v203 + 1), v79);
    objc_msgSend_addSubview_(v45, v80, (uint64_t)v45->_headingLabel, v81);
    uint64_t v82 = objc_opt_new();
    directionLabel = v45->_directionLabel;
    v45->_directionLabel = (UILabel *)v82;

    objc_msgSend_setFont_(v45->_directionLabel, v84, (uint64_t)v73, v85);
    objc_msgSend_setTextColor_(v45->_directionLabel, v86, v204, v87);
    objc_msgSend_addSubview_(v45, v88, (uint64_t)v45->_directionLabel, v89);
    uint64_t v90 = objc_opt_new();
    bearingLabel = v45->_bearingLabel;
    v45->_bearingLabel = (UILabel *)v90;

    objc_msgSend_setFont_(v45->_bearingLabel, v92, (uint64_t)v73, v93);
    objc_msgSend_setTextColor_(v45->_bearingLabel, v94, *((uint64_t *)&v204 + 1), v95);
    objc_msgSend_addSubview_(v45, v96, (uint64_t)v45->_bearingLabel, v97);
    v98 = objc_opt_new();
    objc_msgSend_setMaskView_(v6->_wheelContainer, v99, (uint64_t)v98, v100);

    double v104 = objc_msgSend_maskView(v6->_wheelContainer, v101, v102, v103);
    objc_msgSend_setOpaque_(v104, v105, 0, v106);

    uint64_t v110 = objc_msgSend_maskView(v6->_wheelContainer, v107, v108, v109);
    uint64_t v114 = objc_msgSend_layer(v110, v111, v112, v113);

    uint64_t v118 = objc_msgSend_layer(MEMORY[0x263F157D0], v115, v116, v117);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v119, v120, v121, 0.0, 0.0);
    id v122 = objc_claimAutoreleasedReturnValue();
    v217[0] = objc_msgSend_CGColor(v122, v123, v124, v125);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v126, v127, v128, 0.0, 1.0);
    id v129 = objc_claimAutoreleasedReturnValue();
    v217[1] = objc_msgSend_CGColor(v129, v130, v131, v132);
    uint64_t v134 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v133, (uint64_t)v217, 2);
    objc_msgSend_setColors_(v118, v135, (uint64_t)v134, v136);

    objc_msgSend_setStartPoint_(v118, v137, v138, v139, 0.0, 0.5);
    objc_msgSend_setEndPoint_(v118, v140, v141, v142, 1.0, 0.5);
    objc_msgSend_addSublayer_(v114, v143, (uint64_t)v118, v144);
    uint64_t v148 = objc_msgSend_layer(MEMORY[0x263F157E8], v145, v146, v147);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v149, v150, v151, 0.0, 1.0);
    id v152 = objc_claimAutoreleasedReturnValue();
    uint64_t v156 = objc_msgSend_CGColor(v152, v153, v154, v155);
    objc_msgSend_setBackgroundColor_(v148, v157, v156, v158);

    objc_msgSend_addSublayer_(v114, v159, (uint64_t)v148, v160);
    CGFloat v164 = objc_msgSend_layer(MEMORY[0x263F157D0], v161, v162, v163);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v165, v166, v167, 0.0, 1.0);
    id v168 = objc_claimAutoreleasedReturnValue();
    v216[0] = objc_msgSend_CGColor(v168, v169, v170, v171);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v172, v173, v174, 0.0, 0.0);
    id v175 = objc_claimAutoreleasedReturnValue();
    v216[1] = objc_msgSend_CGColor(v175, v176, v177, v178);
    uint64_t v180 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v179, (uint64_t)v216, 2);
    objc_msgSend_setColors_(v164, v181, (uint64_t)v180, v182);

    objc_msgSend_setStartPoint_(v164, v183, v184, v185, 0.0, 0.5);
    objc_msgSend_setEndPoint_(v164, v186, v187, v188, 1.0, 0.5);
    objc_msgSend_addSublayer_(v114, v189, (uint64_t)v164, v190);

    sub_2375A1EA0((uint64_t)&v201);
  }

  return v6;
}

- (void)_createAngles
{
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  memset(v28, 0, sizeof(v28));
  sub_2375A0048(self->_device, (uint64_t)v28);
  uint64_t v5 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v3, *((uint64_t *)&v30 + 1), v4, *((double *)&v29 + 1), *(double *)&v30);
  id v6 = (id)v31;
  id v7 = (NSDictionary *)objc_opt_new();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_2375ADDFC;
  v25[3] = &unk_264CD5840;
  v25[4] = self;
  id v24 = v5;
  id v26 = v24;
  id v23 = v6;
  id v27 = v23;
  unint64_t v8 = (void (**)(void, void))MEMORY[0x237E1C4F0](v25);
  uint64_t v9 = objc_opt_new();
  objc_msgSend_setNumberStyle_(v9, v10, 0, v11);
  unint64_t v14 = -30;
  do
  {
    uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, v12, v14 + 30, v13);
    uint64_t v18 = objc_msgSend_stringFromNumber_(v9, v16, (uint64_t)v15, v17);
    uint64_t v19 = ((void (**)(void, void *))v8)[2](v8, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v7, v20, (uint64_t)v19, (uint64_t)v15);

    v14 += 30;
  }
  while (v14 < 0x14A);
  angles = self->_angles;
  self->_angles = v7;
  uint64_t v22 = v7;

  sub_2375A1EA0((uint64_t)v28);
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  uint64_t v9 = objc_msgSend_metadata(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"heading", v11);

  uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
  int isEqual = objc_msgSend_isEqual_(v12, v17, (uint64_t)v16, v18);

  if (isEqual)
  {

    uint64_t v12 = 0;
  }
  id v23 = objc_msgSend_metadata(v5, v20, v21, v22);
  id v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"bearing", v25);

  long long v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
  int v33 = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

  if (v33)
  {

    id v26 = 0;
  }
  long long v37 = objc_msgSend_metadata(v5, v34, v35, v36);
  uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v37, v38, @"nodata", v39);
  uint64_t v44 = objc_msgSend_BOOLValue(v40, v41, v42, v43);

  objc_msgSend_setHidden_(self->_headingLabel, v45, 0, v46);
  objc_msgSend_setHidden_(self->_directionLabel, v47, v44, v48);
  objc_msgSend_setHidden_(self->_bearingLabel, v49, v44, v50);
  directions = self->_directions;
  v128[0] = MEMORY[0x263EF8330];
  v128[1] = 3221225472;
  v128[2] = sub_2375ACDE4;
  v128[3] = &unk_264CD57A0;
  char v129 = v44;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(directions, v52, (uint64_t)v128, v53);
  angles = self->_angles;
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = sub_2375ACDF4;
  v126[3] = &unk_264CD57A0;
  char v127 = v44;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(angles, v55, (uint64_t)v126, v56);
  if (v44)
  {
    self->_offset = 0.0;
    uint64_t v60 = objc_msgSend_redactionLabel(self, v57, v58, v59);
    objc_msgSend_setAttributedText_(self->_headingLabel, v61, (uint64_t)v60, v62);

    objc_msgSend_sizeToFit(self->_headingLabel, v63, v64, v65);
  }
  else
  {
    uint64_t v66 = NanoCompassFormattedHeading(v12, 0, 0);
    objc_msgSend_heading(v12, v67, v68, v69);
    uint64_t v74 = NanoCompassFormattedDirection(0, v70, v71, v72, v73);
    objc_msgSend_setText_(self->_headingLabel, v75, (uint64_t)v66, v76);
    objc_msgSend_sizeToFit(self->_headingLabel, v77, v78, v79);
    objc_msgSend_setText_(self->_directionLabel, v80, (uint64_t)v74, v81);
    objc_msgSend_sizeToFit(self->_directionLabel, v82, v83, v84);
    uint64_t v85 = NanoCompassFormattedBearing(v26, 0);
    objc_msgSend_setText_(self->_bearingLabel, v86, (uint64_t)v85, v87);
    objc_msgSend_sizeToFit(self->_bearingLabel, v88, v89, v90);
    int isAccurate = objc_msgSend_isAccurate(v12, v91, v92, v93);
    double v98 = 0.0;
    if (isAccurate) {
      objc_msgSend_heading(v12, v95, v96, v97, 0.0);
    }
    self->_offset = v98;
    objc_msgSend_bearing(v26, v95, v96, v97);
    self->_unint64_t bearingOffset = vcvtmd_u64_f64(v99);
  }
  uint64_t v103 = objc_opt_new();
  if (v26) {
    char v104 = v44;
  }
  else {
    char v104 = 1;
  }
  if ((v104 & 1) == 0)
  {
    objc_msgSend_heading(v12, v100, v101, v102);
    unint64_t v107 = vcvtmd_u64_f64(v106);
    unint64_t bearingOffset = self->_bearingOffset;
    unint64_t v109 = bearingOffset - v107;
    if (bearingOffset >= v107)
    {
      if (v109 > 0xB4)
      {
        objc_msgSend_addIndexesInRange_(v103, v105, 0, v107);
        objc_msgSend_addIndexesInRange_(v103, v110, self->_bearingOffset, 359 - self->_bearingOffset);
        goto LABEL_21;
      }
    }
    else
    {
      if (v107 - bearingOffset <= 0xB4)
      {
        objc_msgSend_addIndexesInRange_(v103, v105, self->_bearingOffset, v107 - bearingOffset);
        goto LABEL_21;
      }
      objc_msgSend_addIndexesInRange_(v103, v105, v107, 359 - v107);
      unint64_t v107 = 0;
      unint64_t v109 = self->_bearingOffset;
    }
    objc_msgSend_addIndexesInRange_(v103, v105, v107, v109);
  }
LABEL_21:
  ticks = self->_ticks;
  v124[0] = MEMORY[0x263EF8330];
  v124[1] = 3221225472;
  v124[2] = sub_2375ACE04;
  v124[3] = &unk_264CD5780;
  id v112 = v103;
  id v125 = v112;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(ticks, v113, (uint64_t)v124, v114);
  bearingTicks = self->_bearingTicks;
  v122[0] = MEMORY[0x263EF8330];
  v122[1] = 3221225472;
  v122[2] = sub_2375ACE6C;
  v122[3] = &unk_264CD5780;
  id v123 = v112;
  id v116 = v112;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(bearingTicks, v117, (uint64_t)v122, v118);
  objc_msgSend_setNeedsLayout(self, v119, v120, v121);
}

- (id)redactionLabel
{
  if (qword_268920F78 != -1) {
    dispatch_once(&qword_268920F78, &unk_26EA48B60);
  }
  long long v2 = (void *)qword_268920F70;

  return v2;
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
  v99[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v6 = objc_msgSend__filtersForStyle_fraction_(self, v5, 2, (uint64_t)v4);
  v99[0] = self->_needleView;
  uint64_t v85 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, (uint64_t)v99, 1);
  CGFloat v86 = (void *)v6;
  objc_msgSend__applyFilters_toViews_(self, v8, v6, (uint64_t)v85);
  CGFloat v10 = objc_msgSend__filtersForStyle_fraction_(self, v9, 0, (uint64_t)v4);
  directionLabel = self->_directionLabel;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)&directionLabel, 1);
  uint64_t v16 = objc_msgSend_allValues(self->_directions, v13, v14, v15);
  uint64_t v19 = objc_msgSend_arrayByAddingObjectsFromArray_(v12, v17, (uint64_t)v16, v18);

  uint64_t v84 = (void *)v19;
  objc_msgSend__applyFilters_toViews_(self, v20, (uint64_t)v10, v19);
  id v24 = objc_msgSend_allValues(self->_ticks, v21, v22, v23);
  objc_msgSend__applyFilters_toLayers_(self, v25, (uint64_t)v10, (uint64_t)v24);

  uint64_t v27 = objc_msgSend__filtersForStyle_fraction_(self, v26, 1, (uint64_t)v4);
  long long v31 = objc_msgSend_allValues(self->_angles, v28, v29, v30);
  uint64_t v83 = (void *)v27;
  objc_msgSend__applyFilters_toViews_(self, v32, v27, (uint64_t)v31);
  long long v34 = objc_msgSend__filtersForStyle_fraction_(self, v33, 3, (uint64_t)v4);
  uint64_t v38 = objc_msgSend_layer(self->_bearingLabel, v35, v36, v37);
  v97[0] = v38;
  uint64_t v42 = objc_msgSend_layer(self->_headingLabel, v39, v40, v41);
  v97[1] = v42;
  uint64_t v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v97, 2);
  uint64_t v48 = objc_msgSend_allValues(self->_bearingTicks, v45, v46, v47);
  id v51 = objc_msgSend_arrayByAddingObjectsFromArray_(v44, v49, (uint64_t)v48, v50);

  objc_msgSend__applyFilters_toLayers_(self, v52, (uint64_t)v34, (uint64_t)v51);
  if (v4)
  {
    sub_2375A0048(self->_device, (uint64_t)v87);
    id v56 = v88;
    sub_2375A1EA0((uint64_t)v87);
    uint64_t v60 = objc_msgSend_filterProvider(self, v57, v58, v59);
    uint64_t v62 = objc_msgSend_colorForView_accented_(v60, v61, (uint64_t)self, 1);

    objc_msgSend_doubleValue(v4, v63, v64, v65);
    id v66 = v56;
    id v67 = v62;
    if (CLKFloatEqualsFloat())
    {
      id v68 = v66;
    }
    else if (CLKFloatEqualsFloat())
    {
      id v68 = v67;
    }
    else
    {
      uint64_t v95 = 0;
      uint64_t v96 = 0;
      uint64_t v93 = 0;
      uint64_t v94 = 0;
      uint64_t v91 = 0;
      uint64_t v92 = 0;
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      objc_msgSend_getRed_green_blue_alpha_(v66, v71, (uint64_t)&v96, (uint64_t)&v95, &v94, &v93);
      objc_msgSend_getRed_green_blue_alpha_(v67, v72, (uint64_t)&v92, (uint64_t)&v91, &v90, &v89);
      CLKInterpolateBetweenFloatsClipped();
      double v74 = v73;
      CLKInterpolateBetweenFloatsClipped();
      double v76 = v75;
      CLKInterpolateBetweenFloatsClipped();
      double v78 = v77;
      CLKInterpolateBetweenFloatsClipped();
      objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v79, v80, v81, v74, v76, v78, v82);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v70 = v68;
  }
  else
  {
    objc_msgSend_filterProvider(self, v53, v54, v55);
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v70 = objc_msgSend_colorForView_accented_(v66, v69, (uint64_t)self, 1);
  }
}

- (id)_filtersForStyle:(int64_t)a3 fraction:(id)a4
{
  id v6 = a4;
  CGFloat v10 = v6;
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
  v9[2] = sub_2375AD708;
  v9[3] = &unk_264CD57F0;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(a4, v7, (uint64_t)v9, v8);
}

- (void)_applyFilters:(id)a3 toLayers:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2375AD8DC;
  v9[3] = &unk_264CD5818;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(a4, v7, (uint64_t)v9, v8);
}

- (void)_createDirections
{
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  memset(v40, 0, sizeof(v40));
  sub_2375A0048(self->_device, (uint64_t)v40);
  id v5 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v3, *((uint64_t *)&v42 + 1), v4, *((double *)&v41 + 1), *(double *)&v42);
  id v6 = *((id *)&v47 + 1);
  uint64_t v7 = (NSDictionary *)objc_opt_new();
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_2375ADDC4;
  v37[3] = &unk_264CD5840;
  v37[4] = self;
  id v8 = v5;
  id v38 = v8;
  id v9 = v6;
  id v39 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x237E1C4F0](v37);
  uint64_t v11 = NanoCompassLocalizedString(@"N");
  uint64_t v12 = ((void (**)(void, void *))v10)[2](v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v13, (uint64_t)v12, (uint64_t)&unk_26EA53818);

  uint64_t v14 = NanoCompassLocalizedString(@"NE");
  uint64_t v15 = ((void (**)(void, void *))v10)[2](v10, v14);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v16, (uint64_t)v15, (uint64_t)&unk_26EA53830);

  uint64_t v17 = NanoCompassLocalizedString(@"E");
  uint64_t v18 = ((void (**)(void, void *))v10)[2](v10, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v18, (uint64_t)&unk_26EA53848);

  uint64_t v20 = NanoCompassLocalizedString(@"SE");
  uint64_t v21 = ((void (**)(void, void *))v10)[2](v10, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v22, (uint64_t)v21, (uint64_t)&unk_26EA53860);

  uint64_t v23 = NanoCompassLocalizedString(@"S");
  id v24 = ((void (**)(void, void *))v10)[2](v10, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v25, (uint64_t)v24, (uint64_t)&unk_26EA53878);

  id v26 = NanoCompassLocalizedString(@"SW");
  uint64_t v27 = ((void (**)(void, void *))v10)[2](v10, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v28, (uint64_t)v27, (uint64_t)&unk_26EA53890);

  uint64_t v29 = NanoCompassLocalizedString(@"W");
  uint64_t v30 = ((void (**)(void, void *))v10)[2](v10, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v31, (uint64_t)v30, (uint64_t)&unk_26EA538A8);

  uint64_t v32 = NanoCompassLocalizedString(@"NW");
  int v33 = ((void (**)(void, void *))v10)[2](v10, v32);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v34, (uint64_t)v33, (uint64_t)&unk_26EA538C0);

  directions = self->_directions;
  self->_directions = v7;
  uint64_t v36 = v7;

  sub_2375A1EA0((uint64_t)v40);
}

- (void)_createTicks
{
  v60[3] = *MEMORY[0x263EF8340];
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  memset(v51, 0, sizeof(v51));
  sub_2375A0048(self->_device, (uint64_t)v51);
  long long v2 = v52;
  long long v3 = v53;
  id v49 = (id)v54;
  uint64_t v50 = (NSDictionary *)objc_opt_new();
  unint64_t v7 = -5;
  do
  {
    HIDWORD(v8) = -286331153 * (unsigned __int16)(v7 + 5);
    LODWORD(v8) = HIDWORD(v8);
    double v9 = *((double *)&v3 + 1);
    if ((v8 >> 1) >= 0x8888889)
    {
      if (-286331153 * (unsigned __int16)(v7 + 5) >= 0x11111112) {
        double v9 = *((double *)&v2 + 1);
      }
      else {
        double v9 = *(double *)&v3;
      }
    }
    id v10 = objc_msgSend_layer(MEMORY[0x263F15880], v4, v5, v6);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v2, 0.0);
    CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v2, v9);
    objc_msgSend_setPath_(v10, v12, (uint64_t)Mutable, v13);
    id v14 = v49;
    uint64_t v18 = objc_msgSend_CGColor(v14, v15, v16, v17);
    objc_msgSend_setStrokeColor_(v10, v19, v18, v20);
    objc_msgSend_setLineWidth_(v10, v21, v22, v23, *(double *)&v2);
    objc_msgSend_setBounds_(v10, v24, v25, v26, 0.0, 0.0, *(double *)&v2 + *(double *)&v2, v9);
    v59[0] = @"position";
    uint64_t v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
    v60[0] = v30;
    v59[1] = @"frame";
    long long v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v31, v32, v33);
    v60[1] = v34;
    v59[2] = @"bounds";
    id v38 = objc_msgSend_null(MEMORY[0x263EFF9D0], v35, v36, v37);
    v60[2] = v38;
    uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)v60, (uint64_t)v59, 3);
    objc_msgSend_setActions_(v10, v41, (uint64_t)v40, v42);

    long long v45 = objc_msgSend_numberWithInteger_(NSNumber, v43, v7 + 5, v44);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v46, (uint64_t)v10, (uint64_t)v45);

    CGPathRelease(Mutable);
    v7 += 5;
  }
  while (v7 < 0x163);
  ticks = self->_ticks;
  self->_ticks = v50;

  sub_2375A1EA0((uint64_t)v51);
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

@end