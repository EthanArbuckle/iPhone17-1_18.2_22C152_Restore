@interface WaypointRichComplicationTicksView
- (UIColor)highlightColor;
- (UIColor)largeTickColor;
- (UIColor)smallTickColor;
- (WaypointRichComplicationTicksView)initWithLargeTickCount:(int64_t)a3 smallTickCountPerLargeTick:(int64_t)a4 largeTickSize:(CGSize)a5 smallTickSize:(CGSize)a6 dialRange:(double)a7 startAngle:(double)a8;
- (float)progress;
- (float)progressDirection;
- (void)_updateTicksRotationTransform;
- (void)layoutSubviews;
- (void)setHighlightColor:(id)a3;
- (void)setLargeTickColor:(id)a3;
- (void)setLargeTicksTransformAngle:(double)a3;
- (void)setProgress:(float)a3;
- (void)setProgressDirection:(float)a3;
- (void)setSmallTickColor:(id)a3;
@end

@implementation WaypointRichComplicationTicksView

- (WaypointRichComplicationTicksView)initWithLargeTickCount:(int64_t)a3 smallTickCountPerLargeTick:(int64_t)a4 largeTickSize:(CGSize)a5 smallTickSize:(CGSize)a6 dialRange:(double)a7 startAngle:(double)a8
{
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.height;
  double v14 = a5.width;
  v249.receiver = self;
  v249.super_class = (Class)WaypointRichComplicationTicksView;
  v19 = -[WaypointRichComplicationTicksView initWithFrame:](&v249, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v19)
  {
    v20 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v16, v17, v18);
    objc_msgSend_setBackgroundColor_(v19, v21, (uint64_t)v20, v22);

    v19->_progress = 1.0;
    v19->_progressDirection = 1.0;
    v26 = objc_msgSend_layer(v19, v23, v24, v25);
    v19->_largeTickCount = a3;
    v19->_smallTickCountPerLargeTick = a4;
    uint64_t v27 = objc_opt_new();
    largeTicksReplicatorLayer = v19->_largeTicksReplicatorLayer;
    v19->_largeTicksReplicatorLayer = (CAReplicatorLayer *)v27;

    uint64_t v29 = *MEMORY[0x263F15AA8];
    objc_msgSend_setFillMode_(v19->_largeTicksReplicatorLayer, v30, *MEMORY[0x263F15AA8], v31);
    objc_msgSend_setInstanceCount_(v19->_largeTicksReplicatorLayer, v32, a3, v33);
    v34 = v19->_largeTicksReplicatorLayer;
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v35, v36, v37);
    id v38 = objc_claimAutoreleasedReturnValue();
    uint64_t v42 = objc_msgSend_CGColor(v38, v39, v40, v41);
    objc_msgSend_setInstanceColor_(v34, v43, v42, v44);

    v45 = v19->_largeTicksReplicatorLayer;
    CATransform3DMakeRotation(&v248, a8, 0.0, 0.0, 1.0);
    objc_msgSend_setTransform_(v45, v46, (uint64_t)&v248, v47);
    v48 = v19->_largeTicksReplicatorLayer;
    objc_msgSend_clearColor(MEMORY[0x263F1C550], v49, v50, v51);
    id v52 = objc_claimAutoreleasedReturnValue();
    uint64_t v56 = objc_msgSend_CGColor(v52, v53, v54, v55);
    objc_msgSend_setBackgroundColor_(v48, v57, v56, v58);

    objc_msgSend_addSublayer_(v26, v59, (uint64_t)v19->_largeTicksReplicatorLayer, v60);
    uint64_t v61 = objc_opt_new();
    largeTickLayer = v19->_largeTickLayer;
    v19->_largeTickLayer = (CALayer *)v61;

    v63 = v19->_largeTickLayer;
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v64, v65, v66);
    id v67 = objc_claimAutoreleasedReturnValue();
    uint64_t v71 = objc_msgSend_CGColor(v67, v68, v69, v70);
    objc_msgSend_setBackgroundColor_(v63, v72, v71, v73);

    objc_msgSend_setBounds_(v19->_largeTickLayer, v74, v75, v76, 0.0, 0.0, v14, v13);
    objc_msgSend_setCornerRadius_(v19->_largeTickLayer, v77, v78, v79, v14 * 0.5);
    objc_msgSend_addSublayer_(v19->_largeTicksReplicatorLayer, v80, (uint64_t)v19->_largeTickLayer, v81);
    uint64_t v82 = objc_opt_new();
    highlightedLargeTicksReplicatorLayer = v19->_highlightedLargeTicksReplicatorLayer;
    v19->_highlightedLargeTicksReplicatorLayer = (CAReplicatorLayer *)v82;

    objc_msgSend_setFillMode_(v19->_highlightedLargeTicksReplicatorLayer, v84, v29, v85);
    objc_msgSend_setInstanceCount_(v19->_highlightedLargeTicksReplicatorLayer, v86, a3, v87);
    v88 = v19->_highlightedLargeTicksReplicatorLayer;
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v89, v90, v91);
    id v92 = objc_claimAutoreleasedReturnValue();
    uint64_t v96 = objc_msgSend_CGColor(v92, v93, v94, v95);
    objc_msgSend_setInstanceColor_(v88, v97, v96, v98);

    v99 = v19->_highlightedLargeTicksReplicatorLayer;
    CATransform3DMakeRotation(&v247, a8, 0.0, 0.0, 1.0);
    objc_msgSend_setTransform_(v99, v100, (uint64_t)&v247, v101);
    v102 = v19->_highlightedLargeTicksReplicatorLayer;
    objc_msgSend_clearColor(MEMORY[0x263F1C550], v103, v104, v105);
    id v106 = objc_claimAutoreleasedReturnValue();
    uint64_t v110 = objc_msgSend_CGColor(v106, v107, v108, v109);
    objc_msgSend_setBackgroundColor_(v102, v111, v110, v112);

    objc_msgSend_insertSublayer_above_(v26, v113, (uint64_t)v19->_highlightedLargeTicksReplicatorLayer, (uint64_t)v19->_largeTicksReplicatorLayer);
    uint64_t v114 = objc_opt_new();
    highlightedLargeTickLayer = v19->_highlightedLargeTickLayer;
    v19->_highlightedLargeTickLayer = (CALayer *)v114;

    v116 = v19->_highlightedLargeTickLayer;
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v117, v118, v119);
    id v120 = objc_claimAutoreleasedReturnValue();
    uint64_t v124 = objc_msgSend_CGColor(v120, v121, v122, v123);
    objc_msgSend_setBackgroundColor_(v116, v125, v124, v126);

    objc_msgSend_setBounds_(v19->_highlightedLargeTickLayer, v127, v128, v129, 0.0, 0.0, v14, v13);
    objc_msgSend_setCornerRadius_(v19->_highlightedLargeTickLayer, v130, v131, v132, v14 * 0.5);
    objc_msgSend_addSublayer_(v19->_highlightedLargeTicksReplicatorLayer, v133, (uint64_t)v19->_highlightedLargeTickLayer, v134);
    v19->_largeTickPositionY = v13 * 0.5;
    if (width != *MEMORY[0x263F001B0] || height != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      uint64_t v138 = objc_opt_new();
      smallTicksReplicatorLayer = v19->_smallTicksReplicatorLayer;
      v19->_smallTicksReplicatorLayer = (CAReplicatorLayer *)v138;

      objc_msgSend_setFillMode_(v19->_smallTicksReplicatorLayer, v140, v29, v141);
      objc_msgSend_setInstanceCount_(v19->_smallTicksReplicatorLayer, v142, v19->_smallTickCountPerLargeTick * a3, v143);
      v144 = v19->_smallTicksReplicatorLayer;
      objc_msgSend_whiteColor(MEMORY[0x263F1C550], v145, v146, v147);
      id v148 = objc_claimAutoreleasedReturnValue();
      uint64_t v152 = objc_msgSend_CGColor(v148, v149, v150, v151);
      objc_msgSend_setInstanceColor_(v144, v153, v152, v154);

      v155 = v19->_smallTicksReplicatorLayer;
      CATransform3DMakeRotation(&v246, a8, 0.0, 0.0, 1.0);
      objc_msgSend_setTransform_(v155, v156, (uint64_t)&v246, v157);
      v158 = v19->_smallTicksReplicatorLayer;
      objc_msgSend_clearColor(MEMORY[0x263F1C550], v159, v160, v161);
      id v162 = objc_claimAutoreleasedReturnValue();
      uint64_t v166 = objc_msgSend_CGColor(v162, v163, v164, v165);
      objc_msgSend_setBackgroundColor_(v158, v167, v166, v168);

      uint64_t v169 = objc_opt_new();
      smallTickLayer = v19->_smallTickLayer;
      v19->_smallTickLayer = (CALayer *)v169;

      v171 = v19->_smallTickLayer;
      objc_msgSend_whiteColor(MEMORY[0x263F1C550], v172, v173, v174);
      id v175 = objc_claimAutoreleasedReturnValue();
      uint64_t v179 = objc_msgSend_CGColor(v175, v176, v177, v178);
      objc_msgSend_setBackgroundColor_(v171, v180, v179, v181);

      objc_msgSend_setBounds_(v19->_smallTickLayer, v182, v183, v184, 0.0, 0.0, width, height);
      objc_msgSend_setCornerRadius_(v19->_smallTickLayer, v185, v186, v187, width * 0.5);
      objc_msgSend_addSublayer_(v19->_smallTicksReplicatorLayer, v188, (uint64_t)v19->_smallTickLayer, v189);
      v19->_smallTickPositionY = height * 0.5;
      uint64_t v190 = objc_opt_new();
      highlightedSmallTicksReplicatorLayer = v19->_highlightedSmallTicksReplicatorLayer;
      v19->_highlightedSmallTicksReplicatorLayer = (CAReplicatorLayer *)v190;

      objc_msgSend_setFillMode_(v19->_highlightedSmallTicksReplicatorLayer, v192, v29, v193);
      objc_msgSend_setInstanceCount_(v19->_highlightedSmallTicksReplicatorLayer, v194, v19->_smallTickCountPerLargeTick * a3, v195);
      v196 = v19->_highlightedSmallTicksReplicatorLayer;
      objc_msgSend_whiteColor(MEMORY[0x263F1C550], v197, v198, v199);
      id v200 = objc_claimAutoreleasedReturnValue();
      uint64_t v204 = objc_msgSend_CGColor(v200, v201, v202, v203);
      objc_msgSend_setInstanceColor_(v196, v205, v204, v206);

      v207 = v19->_highlightedSmallTicksReplicatorLayer;
      CATransform3DMakeRotation(&v245, a8, 0.0, 0.0, 1.0);
      objc_msgSend_setTransform_(v207, v208, (uint64_t)&v245, v209);
      v210 = v19->_highlightedSmallTicksReplicatorLayer;
      objc_msgSend_clearColor(MEMORY[0x263F1C550], v211, v212, v213);
      id v214 = objc_claimAutoreleasedReturnValue();
      uint64_t v218 = objc_msgSend_CGColor(v214, v215, v216, v217);
      objc_msgSend_setBackgroundColor_(v210, v219, v218, v220);

      uint64_t v221 = objc_opt_new();
      highlightedSmallTickLayer = v19->_highlightedSmallTickLayer;
      v19->_highlightedSmallTickLayer = (CALayer *)v221;

      v223 = v19->_highlightedSmallTickLayer;
      objc_msgSend_whiteColor(MEMORY[0x263F1C550], v224, v225, v226);
      id v227 = objc_claimAutoreleasedReturnValue();
      uint64_t v231 = objc_msgSend_CGColor(v227, v228, v229, v230);
      objc_msgSend_setBackgroundColor_(v223, v232, v231, v233);

      objc_msgSend_setBounds_(v19->_highlightedSmallTickLayer, v234, v235, v236, 0.0, 0.0, width, height);
      objc_msgSend_setCornerRadius_(v19->_highlightedSmallTickLayer, v237, v238, v239, width * 0.5);
      objc_msgSend_addSublayer_(v19->_highlightedSmallTicksReplicatorLayer, v240, (uint64_t)v19->_highlightedSmallTickLayer, v241);
      objc_msgSend_insertSublayer_below_(v26, v242, (uint64_t)v19->_highlightedSmallTicksReplicatorLayer, (uint64_t)v19->_highlightedLargeTicksReplicatorLayer);
      objc_msgSend_insertSublayer_below_(v26, v243, (uint64_t)v19->_smallTicksReplicatorLayer, (uint64_t)v19->_largeTicksReplicatorLayer);
    }
    objc_msgSend_setLargeTicksTransformAngle_(v19, v135, v136, v137, a7 / (double)a3);
  }
  return v19;
}

- (void)setLargeTickColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_largeTickColor = (void **)&self->_largeTickColor;
  if (self->_largeTickColor != v5)
  {
    double v14 = v5;
    objc_storeStrong((id *)&self->_largeTickColor, a3);
    largeTicksReplicatorLayer = self->_largeTicksReplicatorLayer;
    uint64_t v11 = objc_msgSend_CGColor(*p_largeTickColor, v8, v9, v10);
    objc_msgSend_setInstanceColor_(largeTicksReplicatorLayer, v12, v11, v13);
    v5 = v14;
  }
}

- (void)setSmallTickColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_smallTickColor = (void **)&self->_smallTickColor;
  if (self->_smallTickColor != v5)
  {
    double v14 = v5;
    objc_storeStrong((id *)&self->_smallTickColor, a3);
    smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
    uint64_t v11 = objc_msgSend_CGColor(*p_smallTickColor, v8, v9, v10);
    objc_msgSend_setInstanceColor_(smallTicksReplicatorLayer, v12, v11, v13);
    v5 = v14;
  }
}

- (void)setHighlightColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_highlightColor = (void **)&self->_highlightColor;
  if (self->_highlightColor != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    highlightedLargeTicksReplicatorLayer = self->_highlightedLargeTicksReplicatorLayer;
    uint64_t v11 = objc_msgSend_CGColor(*p_highlightColor, v8, v9, v10);
    objc_msgSend_setInstanceColor_(highlightedLargeTicksReplicatorLayer, v12, v11, v13);
    highlightedSmallTicksReplicatorLayer = self->_highlightedSmallTicksReplicatorLayer;
    uint64_t v18 = objc_msgSend_CGColor(*p_highlightColor, v15, v16, v17);
    objc_msgSend_setInstanceColor_(highlightedSmallTicksReplicatorLayer, v19, v18, v20);
    v5 = v21;
  }
}

- (void)setProgress:(float)a3
{
  float progress = self->_progress;
  if (progress == a3) {
    return;
  }
  if (progress >= a3) {
    float v7 = 0.05;
  }
  else {
    float v7 = 0.25;
  }
  self->_float progress = a3;
  int64_t largeTickCount = self->_largeTickCount;
  largeTickLayer = self->_largeTickLayer;
  if (!largeTickCount)
  {
    objc_msgSend_setHidden_(largeTickLayer, a2, 1, v3);
    highlightedLargeTickLayer = self->_highlightedLargeTickLayer;
    goto LABEL_10;
  }
  objc_msgSend_setHidden_(largeTickLayer, a2, 0, v3);
  objc_msgSend_setInstanceCount_(self->_largeTicksReplicatorLayer, v10, largeTickCount, v11);
  highlightedLargeTickLayer = self->_highlightedLargeTickLayer;
  if (self->_progress == 0.0)
  {
LABEL_10:
    objc_msgSend_setHidden_(highlightedLargeTickLayer, v12, 1, v13);
    goto LABEL_11;
  }
  objc_msgSend_setHidden_(highlightedLargeTickLayer, v12, 0, v13);
  objc_msgSend_setInstanceCount_(self->_highlightedLargeTicksReplicatorLayer, v15, (uint64_t)(float)((float)((float)(a3 * (float)largeTickCount) + 1.0) + 0.1), v16);
LABEL_11:
  if (self->_smallTicksReplicatorLayer)
  {
    uint64_t v19 = self->_smallTickCountPerLargeTick * self->_largeTickCount;
    smallTickLayer = self->_smallTickLayer;
    if (v19)
    {
      objc_msgSend_setHidden_(smallTickLayer, v17, 0, v18);
      objc_msgSend_setInstanceCount_(self->_smallTicksReplicatorLayer, v21, v19, v22);
    }
    else
    {
      objc_msgSend_setHidden_(smallTickLayer, v17, 1, v18);
    }
  }
  if (self->_highlightedSmallTicksReplicatorLayer)
  {
    float v23 = self->_progress;
    uint64_t v24 = (uint64_t)(float)(v7
                         + (float)((float)((float)(v23 * (float)self->_largeTickCount)
                                         * (float)self->_smallTickCountPerLargeTick)
                                 + 1.0));
    highlightedSmallTickLayer = self->_highlightedSmallTickLayer;
    if (!v24 || v23 == 0.0)
    {
      objc_msgSend_setHidden_(highlightedSmallTickLayer, v17, 1, v18);
    }
    else
    {
      objc_msgSend_setHidden_(highlightedSmallTickLayer, v17, 0, v18);
      highlightedSmallTicksReplicatorLayer = self->_highlightedSmallTicksReplicatorLayer;
      objc_msgSend_setInstanceCount_(highlightedSmallTicksReplicatorLayer, v26, v24, v27);
    }
  }
}

- (void)setProgressDirection:(float)a3
{
  BOOL v3 = a3 < 0.0;
  float v4 = 1.0;
  if (v3) {
    float v4 = -1.0;
  }
  if (self->_progressDirection != v4)
  {
    self->_progressDirection = v4;
    MEMORY[0x270F9A6D0]();
  }
}

- (void)setLargeTicksTransformAngle:(double)a3
{
  if (self->_largeTicksTransformAngle != a3)
  {
    self->_largeTicksTransformAngle = a3;
    MEMORY[0x270F9A6D0]();
  }
}

- (void)_updateTicksRotationTransform
{
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], a2, 1, v2);
  double v4 = self->_largeTicksTransformAngle * self->_progressDirection;
  largeTicksReplicatorLayer = self->_largeTicksReplicatorLayer;
  CATransform3DMakeRotation(&v22, v4, 0.0, 0.0, 1.0);
  objc_msgSend_setInstanceTransform_(largeTicksReplicatorLayer, v6, (uint64_t)&v22, v7);
  highlightedLargeTicksReplicatorLayer = self->_highlightedLargeTicksReplicatorLayer;
  CATransform3DMakeRotation(&v21, v4, 0.0, 0.0, 1.0);
  objc_msgSend_setInstanceTransform_(highlightedLargeTicksReplicatorLayer, v9, (uint64_t)&v21, v10);
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    CATransform3DMakeRotation(&v20, v4 / (double)self->_smallTickCountPerLargeTick, 0.0, 0.0, 1.0);
    objc_msgSend_setInstanceTransform_(smallTicksReplicatorLayer, v14, (uint64_t)&v20, v15);
  }
  highlightedSmallTicksReplicatorLayer = self->_highlightedSmallTicksReplicatorLayer;
  if (highlightedSmallTicksReplicatorLayer)
  {
    CATransform3DMakeRotation(&v19, v4 / (double)self->_smallTickCountPerLargeTick, 0.0, 0.0, 1.0);
    objc_msgSend_setInstanceTransform_(highlightedSmallTicksReplicatorLayer, v17, (uint64_t)&v19, v18);
  }
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v11, 0, v12);
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)WaypointRichComplicationTicksView;
  [(WaypointRichComplicationTicksView *)&v55 layoutSubviews];
  v6 = objc_msgSend_layer(self, v3, v4, v5);
  objc_msgSend_bounds(v6, v7, v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = v14 * 0.5;
  double v19 = v16 * 0.5;
  objc_msgSend_setPosition_(self->_largeTicksReplicatorLayer, v20, v21, v22, v14 * 0.5, v16 * 0.5);
  objc_msgSend_setBounds_(self->_largeTicksReplicatorLayer, v23, v24, v25, v11, v13, v15, v17);
  objc_msgSend_setPosition_(self->_largeTickLayer, v26, v27, v28, v18, self->_largeTickPositionY);
  objc_msgSend_setPosition_(self->_highlightedLargeTicksReplicatorLayer, v29, v30, v31, v18, v19);
  objc_msgSend_setBounds_(self->_highlightedLargeTicksReplicatorLayer, v32, v33, v34, v11, v13, v15, v17);
  objc_msgSend_setPosition_(self->_highlightedLargeTickLayer, v35, v36, v37, v18, self->_largeTickPositionY);
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    objc_msgSend_setPosition_(smallTicksReplicatorLayer, v38, v39, v40, v18, v19);
    objc_msgSend_setBounds_(self->_smallTicksReplicatorLayer, v42, v43, v44, v11, v13, v15, v17);
    objc_msgSend_setPosition_(self->_smallTickLayer, v45, v46, v47, v18, self->_smallTickPositionY);
  }
  highlightedSmallTicksReplicatorLayer = self->_highlightedSmallTicksReplicatorLayer;
  if (highlightedSmallTicksReplicatorLayer)
  {
    objc_msgSend_setPosition_(highlightedSmallTicksReplicatorLayer, v38, v39, v40, v18, v19);
    objc_msgSend_setBounds_(self->_highlightedSmallTicksReplicatorLayer, v49, v50, v51, v11, v13, v15, v17);
    objc_msgSend_setPosition_(self->_highlightedSmallTickLayer, v52, v53, v54, v18, self->_smallTickPositionY);
  }
}

- (UIColor)largeTickColor
{
  return self->_largeTickColor;
}

- (UIColor)smallTickColor
{
  return self->_smallTickColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (float)progress
{
  return self->_progress;
}

- (float)progressDirection
{
  return self->_progressDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_smallTickColor, 0);
  objc_storeStrong((id *)&self->_largeTickColor, 0);
  objc_storeStrong((id *)&self->_highlightedSmallTickLayer, 0);
  objc_storeStrong((id *)&self->_highlightedSmallTicksReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_highlightedLargeTickLayer, 0);
  objc_storeStrong((id *)&self->_highlightedLargeTicksReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_smallTickLayer, 0);
  objc_storeStrong((id *)&self->_smallTicksReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_largeTickLayer, 0);

  objc_storeStrong((id *)&self->_largeTicksReplicatorLayer, 0);
}

@end