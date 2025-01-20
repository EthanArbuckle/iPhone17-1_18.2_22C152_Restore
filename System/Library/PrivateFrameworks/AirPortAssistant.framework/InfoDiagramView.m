@interface InfoDiagramView
- (CGPoint)broadbandInPoint;
- (CGPoint)broadbandOutPoint;
- (CGPoint)internetPoint;
- (CGPoint)swapArcControlPoint;
- (CGPoint)swapArcControlPoint1;
- (CGPoint)swapArcControlPoint2;
- (CGPoint)swapArcLineEndPoint;
- (CGPoint)swapArcLineStartPoint;
- (CGPoint)wanConnectedBaseWANPoint;
- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4;
- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4 replacementProductID:(unsigned int)a5;
- (void)commonInit;
- (void)dealloc;
- (void)setWANConnectedBaseLabelString:(id)a3;
- (void)startAnimatingCablingLayer;
- (void)stopAnimatingCablingLayer;
@end

@implementation InfoDiagramView

- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)InfoDiagramView;
  v5 = -[InfoDiagramView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v5;
  if (v5)
  {
    v5->wanBaseProductID = a4;
    v5->replacementProductID = 0;
    objc_msgSend_commonInit(v5, v6, v7);
  }
  return v8;
}

- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4 replacementProductID:(unsigned int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)InfoDiagramView;
  uint64_t v7 = -[InfoDiagramView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v10 = v7;
  if (v7)
  {
    v7->wanBaseProductID = a4;
    v7->replacementProductID = a5;
    objc_msgSend_commonInit(v7, v8, v9);
  }
  return v10;
}

- (void)commonInit
{
  v286[1] = *MEMORY[0x263EF8340];
  unsigned int replacementProductID = self->replacementProductID;
  self->int64_t sizeClass = sub_226905310(self, a2, v2);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self, v4, 0);
  v6 = objc_msgSend_imageForInformationalDiagramNamed_small_(ImageStore, v5, @"Cable-Modem", self->sizeClass == 1);
  uint64_t v7 = [AUImageView alloc];
  uint64_t v9 = (AUImageView *)(id)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6);
  self->broadbandImageView = v9;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v9, v10, 0);
  objc_msgSend_addSubview_(self, v11, (uint64_t)self->broadbandImageView);
  objc_super v12 = (void *)MEMORY[0x263F08938];
  broadbandImageView = self->broadbandImageView;
  objc_msgSend_size(v6, v14, v15);
  uint64_t v18 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v12, v16, (uint64_t)broadbandImageView, 7, 0, 0, 0, 1.0, v17);
  objc_msgSend_addConstraint_(self, v19, v18);
  v20 = (void *)MEMORY[0x263F08938];
  v21 = self->broadbandImageView;
  objc_msgSend_size(v6, v22, v23);
  uint64_t v25 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v20, v24, (uint64_t)v21, 8, 0, 0, 0, 1.0);
  objc_msgSend_addConstraint_(self, v26, v25);
  self->broadbandLabel = objc_alloc_init(AULabel);
  uint64_t v27 = sub_22685D62C(@"BroadbandDeviceOrLAN", @"AirPortSettings");
  objc_msgSend_setText_(self->broadbandLabel, v28, v27);
  objc_msgSend_frame(self->broadbandImageView, v29, v30);
  objc_msgSend_setPreferredMaxLayoutWidth_(self->broadbandLabel, v31, v32, v33);
  sub_22686B3E0(self->broadbandLabel, v34, 13.0);
  objc_msgSend_addSubview_(self, v35, (uint64_t)self->broadbandLabel);
  v36 = (void *)MEMORY[0x263F08938];
  v37 = _NSDictionaryOfVariableBindings(&cfstr_Broadbandlabel.isa, self->broadbandLabel, self->broadbandImageView, 0);
  uint64_t v39 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v36, v38, @"V:|-10-[broadbandLabel]-4-[broadbandImageView]", 512, 0, v37);
  objc_msgSend_addConstraints_(self, v40, v39);
  self->internetLabel = objc_alloc_init(AULabel);
  uint64_t v41 = sub_22685D62C(@"ToInternet", @"AirPortSettings");
  objc_msgSend_setText_(self->internetLabel, v42, v41);
  sub_22686B3E0(self->internetLabel, v43, 13.0);
  objc_msgSend_addSubview_(self, v44, (uint64_t)self->internetLabel);
  uint64_t v46 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v45, (uint64_t)self->internetLabel, 1, 0, self->broadbandLabel, 1, 1.0, 0.0);
  objc_msgSend_addConstraint_(self, v47, v46);
  v48 = (void *)MEMORY[0x263F08938];
  v49 = _NSDictionaryOfVariableBindings(&cfstr_Broadbandimage.isa, self->broadbandImageView, self->internetLabel, 0);
  uint64_t v51 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v48, v50, @"V:[broadbandImageView]-30-[internetLabel]-(>=10)-|", 0, 0, v49);
  objc_msgSend_addConstraints_(self, v52, v51);
  objc_msgSend_sizeToFit(self->internetLabel, v53, v54);
  v56 = objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, v55, self->wanBaseProductID, 0, self->wanBaseProductID != 0, 0, self->sizeClass == 1);
  v57 = [AUImageView alloc];
  v59 = (AUImageView *)(id)objc_msgSend_initWithImage_(v57, v58, (uint64_t)v56);
  p_wanConnectedBaseImageView = (void **)&self->wanConnectedBaseImageView;
  self->wanConnectedBaseImageView = v59;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v59, v61, 0);
  objc_msgSend_addSubview_(self, v62, (uint64_t)self->wanConnectedBaseImageView);
  v63 = (void *)MEMORY[0x263F08938];
  wanConnectedBaseImageView = self->wanConnectedBaseImageView;
  objc_msgSend_size(v56, v65, v66);
  uint64_t v69 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v63, v67, (uint64_t)wanConnectedBaseImageView, 7, 0, 0, 0, 1.0, v68);
  objc_msgSend_addConstraint_(self, v70, v69);
  v71 = (void *)MEMORY[0x263F08938];
  v72 = self->wanConnectedBaseImageView;
  objc_msgSend_size(v56, v73, v74);
  uint64_t v76 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v71, v75, (uint64_t)v72, 8, 0, 0, 0, 1.0);
  objc_msgSend_addConstraint_(self, v77, v76);
  self->wanConnectedBaseLabel = objc_alloc_init(AULabel);
  unsigned int wanBaseProductID = self->wanBaseProductID;
  if (wanBaseProductID)
  {
    v81 = sub_22685D7D0(wanBaseProductID, 1, 0);
    objc_msgSend_setText_(self->wanConnectedBaseLabel, v82, (uint64_t)v81);
  }
  objc_msgSend_frame(*p_wanConnectedBaseImageView, v78, v79);
  objc_msgSend_setPreferredMaxLayoutWidth_(self->wanConnectedBaseLabel, v83, v84, v85);
  sub_22686B3E0(self->wanConnectedBaseLabel, v86, 13.0);
  objc_msgSend_addSubview_(self, v87, (uint64_t)self->wanConnectedBaseLabel);
  objc_msgSend_sizeToFit(self->wanConnectedBaseLabel, v88, v89);
  int64_t sizeClass = self->sizeClass;
  LODWORD(v93) = 1109393408;
  if (sizeClass == 3) {
    *(float *)&double v93 = 35.0;
  }
  if (sizeClass == 2) {
    *(float *)&double v93 = 60.0;
  }
  uint64_t v94 = objc_msgSend_numberWithFloat_(NSNumber, v90, v91, v93);
  v95 = (void *)MEMORY[0x263F08938];
  v285 = @"horizSep";
  v286[0] = v94;
  uint64_t v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v96, (uint64_t)v286, &v285, 1);
  v98 = _NSDictionaryOfVariableBindings(&cfstr_Broadbandimage_0.isa, self->broadbandImageView, *p_wanConnectedBaseImageView, 0);
  uint64_t v100 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v95, v99, @"H:[broadbandImageView]-(>=horizSep)-[wanConnectedBaseImageView]", 65552, v97, v98);
  objc_msgSend_addConstraints_(self, v101, v100);
  if (replacementProductID) {
    v102 = &unk_26DA7DAE8;
  }
  else {
    v102 = &unk_26DA7DB10;
  }
  v103 = (void *)MEMORY[0x263F08938];
  v104 = _NSDictionaryOfVariableBindings(&cfstr_Broadbandimage_1.isa, self->broadbandImageView, 0);
  uint64_t v106 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v103, v105, @"H:|-(10)-[broadbandImageView]", 0x10000, 0, v104);
  objc_msgSend_addConstraints_(self, v107, v106);
  v108 = (void *)MEMORY[0x263F08938];
  v109 = _NSDictionaryOfVariableBindings(&cfstr_Wanconnectedba.isa, *p_wanConnectedBaseImageView, 0);
  uint64_t v111 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v108, v110, @"H:[wanConnectedBaseImageView]-(>=rightMargin)-|", 0x10000, v102, v109);
  objc_msgSend_addConstraints_(self, v112, v111);
  v113 = (void *)MEMORY[0x263F08938];
  v114 = _NSDictionaryOfVariableBindings(&cfstr_Wanconnectedba_0.isa, self->wanConnectedBaseLabel, *p_wanConnectedBaseImageView, 0);
  uint64_t v116 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v113, v115, @"V:|-(10)-[wanConnectedBaseLabel]-4-[wanConnectedBaseImageView]-(>=10)-|", 0, 0, v114);
  objc_msgSend_addConstraints_(self, v117, v116);
  v118 = (void *)MEMORY[0x263F08938];
  v119 = _NSDictionaryOfVariableBindings(&cfstr_Wanconnectedba_1.isa, self->wanConnectedBaseLabel, 0);
  uint64_t v121 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v118, v120, @"H:[wanConnectedBaseLabel]-(>=rightMargin)-|", 0, v102, v119);
  objc_msgSend_addConstraints_(self, v122, v121);
  objc_msgSend_informationDiagramBaseImageCenterOffset_small_(ImageStore, v123, self->wanBaseProductID, self->sizeClass == 1);
  double v125 = v124 + -0.5;
  objc_msgSend_frame(*p_wanConnectedBaseImageView, v126, v127);
  double v129 = v125 * v128;
  uint64_t v131 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v130, (uint64_t)self->wanConnectedBaseLabel, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129);
  objc_msgSend_addConstraint_(self, v132, v131);
  uint64_t v134 = objc_msgSend_insetImageForInformationalDiagram_deviceKind_audioImage_small_(ImageStore, v133, self->wanBaseProductID, 1, 0, self->sizeClass == 1);
  v135 = [AUImageView alloc];
  v137 = (AUImageView *)(id)objc_msgSend_initWithImage_(v135, v136, v134);
  self->insetImageView = v137;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v137, v138, 0);
  objc_msgSend_addSubview_(self, v139, (uint64_t)self->insetImageView);
  v140 = (void *)MEMORY[0x263F08938];
  v283 = @"xOffset";
  v141 = NSNumber;
  objc_msgSend_frame(self->insetImageView, v142, v143);
  double v147 = 85.0;
  if (self->sizeClass == 1) {
    double v147 = 64.0;
  }
  double v148 = v146 + v147;
  *(float *)&double v148 = v148;
  *(float *)&double v148 = -*(float *)&v148;
  uint64_t v284 = objc_msgSend_numberWithFloat_(v141, v144, v145, v148);
  uint64_t v150 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v149, (uint64_t)&v284, &v283, 1);
  v151 = _NSDictionaryOfVariableBindings(&cfstr_Insetimageview.isa, self->insetImageView, *p_wanConnectedBaseImageView, 0);
  uint64_t v153 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v140, v152, @"H:[wanConnectedBaseImageView]-(xOffset)-[insetImageView]", 0x10000, v150, v151);
  objc_msgSend_addConstraints_(self, v154, v153);
  v155 = (void *)MEMORY[0x263F08938];
  v281 = @"yOffset";
  v156 = NSNumber;
  objc_msgSend_frame(self->insetImageView, v157, v158);
  double v162 = 8.0;
  if (self->sizeClass == 1) {
    double v162 = 0.0;
  }
  double v163 = v161 + v162;
  *(float *)&double v163 = v163;
  *(float *)&double v163 = -*(float *)&v163;
  uint64_t v282 = objc_msgSend_numberWithFloat_(v156, v159, v160, v163);
  uint64_t v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v164, (uint64_t)&v282, &v281, 1);
  v166 = _NSDictionaryOfVariableBindings(&cfstr_Insetimageview.isa, self->insetImageView, *p_wanConnectedBaseImageView, 0);
  uint64_t v168 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v155, v167, @"V:[wanConnectedBaseImageView]-(yOffset)-[insetImageView]", 0x10000, v165, v166);
  objc_msgSend_addConstraints_(self, v169, v168);
  if (replacementProductID)
  {
    v171 = objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, v170, self->replacementProductID, 0, 1, 0, self->sizeClass == 1);
    v172 = [AUImageView alloc];
    v174 = (AUImageView *)(id)objc_msgSend_initWithImage_(v172, v173, (uint64_t)v171);
    self->replacementBaseImageView = v174;
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v174, v175, 0);
    objc_msgSend_addSubview_(self, v176, (uint64_t)self->replacementBaseImageView);
    v177 = (void *)MEMORY[0x263F08938];
    replacementBaseImageView = self->replacementBaseImageView;
    objc_msgSend_size(v171, v179, v180);
    uint64_t v183 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v177, v181, (uint64_t)replacementBaseImageView, 7, 0, 0, 0, 1.0, v182);
    objc_msgSend_addConstraint_(self, v184, v183);
    v185 = (void *)MEMORY[0x263F08938];
    v186 = self->replacementBaseImageView;
    objc_msgSend_size(v171, v187, v188);
    uint64_t v190 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v185, v189, (uint64_t)v186, 8, 0, 0, 0, 1.0);
    objc_msgSend_addConstraint_(self, v191, v190);
    v192 = (void *)MEMORY[0x263F08938];
    v193 = _NSDictionaryOfVariableBindings(&cfstr_Wanconnectedba_2.isa, *p_wanConnectedBaseImageView, self->replacementBaseImageView, 0);
    uint64_t v195 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v192, v194, @"V:[wanConnectedBaseImageView]-60-[replacementBaseImageView]", 0, 0, v193);
    objc_msgSend_addConstraints_(self, v196, v195);
    objc_msgSend_informationDiagramBaseImageCenterOffset_small_(ImageStore, v197, self->replacementProductID, self->sizeClass == 1);
    double v199 = v198 + -0.5;
    objc_msgSend_frame(self->replacementBaseImageView, v200, v201);
    double v203 = v199 * v202;
    uint64_t v205 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v204, (uint64_t)self->replacementBaseImageView, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129 - v203);
    objc_msgSend_addConstraint_(self, v206, v205);
    p_replacementBaseLabel = &self->replacementBaseLabel;
    self->replacementBaseLabel = objc_alloc_init(AULabel);
    v208 = sub_22685D7D0(self->replacementProductID, 1, 0);
    objc_msgSend_setText_(self->replacementBaseLabel, v209, (uint64_t)v208);
    objc_msgSend_frame(self->replacementBaseImageView, v210, v211);
    objc_msgSend_setPreferredMaxLayoutWidth_(self->replacementBaseLabel, v212, v213, v214);
    sub_22686B3E0(self->replacementBaseLabel, v215, 13.0);
    objc_msgSend_addSubview_(self, v216, (uint64_t)self->replacementBaseLabel);
    objc_msgSend_sizeToFit(self->replacementBaseLabel, v217, v218);
    v219 = @"V:[replacementBaseImageView][replacementBaseLabel]-(>=10)-|";
    p_wanConnectedBaseImageView = (void **)&self->replacementBaseImageView;
    v220 = @"replacementBaseImageView, replacementBaseLabel";
    uint64_t v222 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v221, (uint64_t)self->replacementBaseLabel, 9, 0, self->replacementBaseImageView, 9, 1.0, v203);
  }
  else
  {
    if (sub_22683C4C8(self->wanBaseProductID) >= 2) {
      v224 = @"EthernetWANPort";
    }
    else {
      v224 = @"EthernetPort";
    }
    uint64_t v225 = sub_22685D62C((uint64_t)v224, @"AirPortSettings");
    v226 = objc_alloc_init(AULabel);
    p_replacementBaseLabel = &self->portLabel;
    self->portLabel = v226;
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v226, v227, 0);
    objc_msgSend_bounds(self->broadbandImageView, v228, v229);
    objc_msgSend_setPreferredMaxLayoutWidth_(self->portLabel, v230, v231, v232);
    objc_msgSend_setNumberOfLines_(self->portLabel, v233, 0);
    objc_msgSend_setText_(self->portLabel, v234, v225);
    sub_22686B3E0(self->portLabel, v235, 13.0);
    objc_msgSend_addSubview_(self, v236, (uint64_t)self->portLabel);
    v219 = @"V:[wanConnectedBaseImageView]-30-[portLabel]-(>=10)-|";
    v220 = @"wanConnectedBaseImageView, portLabel";
    uint64_t v222 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v237, (uint64_t)self->portLabel, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129);
  }
  objc_msgSend_addConstraint_(self, v223, v222);
  v238 = (void *)MEMORY[0x263F08938];
  v239 = _NSDictionaryOfVariableBindings(&v220->isa, *p_wanConnectedBaseImageView, *p_replacementBaseLabel, 0);
  uint64_t v241 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v238, v240, (uint64_t)v219, 0, 0, v239);
  objc_msgSend_addConstraints_(self, v242, v241);
  v243 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  self->fixedCablingFrameView = v243;
  objc_msgSend_setAutoresizingMask_(v243, v244, 2);
  objc_msgSend_addSubview_(self, v245, (uint64_t)self->fixedCablingFrameView);
  v246 = [InfoDiagramCablingLayer alloc];
  id v249 = (id)objc_msgSend_initNoWANLinkFirstFrame(v246, v247, v248);
  objc_msgSend_setDiagramAnchorPointDelegate_(v249, v250, (uint64_t)self);
  objc_msgSend_setIsCompactWidth_(v249, v251, self->sizeClass == 1);
  v254 = objc_msgSend_layer(self->fixedCablingFrameView, v252, v253);
  objc_msgSend_addSublayer_(v254, v255, (uint64_t)v249);
  objc_msgSend_sizeToFit(self->fixedCablingFrameView, v256, v257);
  v258 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  self->animatingCablingFrameView = v258;
  objc_msgSend_setAutoresizingMask_(v258, v259, 2);
  objc_msgSend_addSubview_(self, v260, (uint64_t)self->animatingCablingFrameView);
  v261 = [InfoDiagramCablingLayer alloc];
  id v264 = (id)objc_msgSend_initNoWANLinkLastFrame(v261, v262, v263);
  objc_msgSend_setDiagramAnchorPointDelegate_(v264, v265, (uint64_t)self);
  objc_msgSend_setIsCompactWidth_(v264, v266, self->sizeClass == 1);
  objc_msgSend_setSwapCabling_(v264, v267, self->replacementProductID != 0);
  v270 = objc_msgSend_layer(self->animatingCablingFrameView, v268, v269);
  objc_msgSend_addSublayer_(v270, v271, (uint64_t)v264);
  objc_msgSend_sizeToFit(self->animatingCablingFrameView, v272, v273);
  objc_msgSend_startAnimatingCablingLayer(self, v274, v275);
  LODWORD(v276) = 1148846080;
  objc_msgSend_setContentCompressionResistancePriority_forAxis_(self, v277, 1, v276);
  LODWORD(v278) = 1148846080;
  objc_msgSend_setContentCompressionResistancePriority_forAxis_(self, v279, 0, v278);
}

- (void)dealloc
{
  v4 = objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);
  objc_msgSend_removeAllAnimations(v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)InfoDiagramView;
  [(InfoDiagramView *)&v7 dealloc];
}

- (void)setWANConnectedBaseLabelString:(id)a3
{
  objc_msgSend_setText_(self->wanConnectedBaseLabel, a2, (uint64_t)a3);
  objc_msgSend_sizeToFit(self->wanConnectedBaseLabel, v4, v5);
  wanConnectedBaseLabel = self->wanConnectedBaseLabel;

  objc_msgSend_setNeedsLayout(wanConnectedBaseLabel, v6, v7);
}

- (void)startAnimatingCablingLayer
{
  v4 = objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);
  if (!objc_msgSend_animationForKey_(v4, v5, @"fadeAnimation"))
  {
    v8 = objc_msgSend_layer(self->animatingCablingFrameView, v6, v7);
    objc_msgSend_setOpacity_(v8, v9, v10, 0.0);
    objc_super v12 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v11, @"opacity");
    LODWORD(v13) = 2139095040;
    objc_msgSend_setRepeatCount_(v12, v14, v15, v13);
    objc_msgSend_setAutoreverses_(v12, v16, 1);
    objc_msgSend_setDuration_(v12, v17, v18, 0.5);
    LODWORD(v19) = 1.0;
    uint64_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v20, v21, v19);
    objc_msgSend_setToValue_(v12, v23, v22);
    uint64_t v26 = objc_msgSend_layer(self->animatingCablingFrameView, v24, v25);
    MEMORY[0x270F9A6D0](v26, sel_addAnimation_forKey_, v12);
  }
}

- (void)stopAnimatingCablingLayer
{
  uint64_t v3 = objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);

  MEMORY[0x270F9A6D0](v3, sel_removeAnimationForKey_, @"fadeAnimation");
}

- (CGPoint)internetPoint
{
  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  CGFloat x = v7.origin.x;
  double v4 = CGRectGetMaxY(v7) + 20.0;
  double v5 = x;
  result.y = v4;
  result.CGFloat x = v5;
  return result;
}

- (CGPoint)broadbandInPoint
{
  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  double v8 = 65.5;
  if (self->sizeClass == 1) {
    double v8 = 36.0;
  }
  double v9 = v4 + v8;
  double MaxY = CGRectGetMaxY(*(CGRect *)&v4);
  double v11 = 14.0;
  if (self->sizeClass == 1) {
    double v11 = 10.0;
  }
  double v12 = MaxY - v11;
  double v13 = v9;
  result.y = v12;
  result.CGFloat x = v13;
  return result;
}

- (CGPoint)broadbandOutPoint
{
  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  double v4 = v10.origin.x + dbl_226912F10[self->sizeClass == 1];
  double MaxY = CGRectGetMaxY(v10);
  double v6 = 14.0;
  if (self->sizeClass == 1) {
    double v6 = 10.0;
  }
  double v7 = MaxY - v6;
  double v8 = v4;
  result.y = v7;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)wanConnectedBaseWANPoint
{
  objc_msgSend_frame(self->wanConnectedBaseImageView, a2, v2);
  double v4 = v10.origin.x + dbl_226912F20[self->sizeClass == 1];
  double MaxY = CGRectGetMaxY(v10);
  double v6 = 14.0;
  if (self->sizeClass == 1) {
    double v6 = 11.0;
  }
  double v7 = MaxY - v6;
  double v8 = v4;
  result.y = v7;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)swapArcLineStartPoint
{
  objc_msgSend_frame(self->replacementBaseImageView, a2, v2);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MaxX = CGRectGetMaxX(v19);
  objc_msgSend_informationDiagramBaseImageRightEdgeInset_small_(ImageStore, v9, self->replacementProductID, self->sizeClass == 1);
  double v11 = MaxX - v10 + 10.0;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRectGetMidY(v20);

  double v15 = sub_22686B8F4(v11, v12, v13, v14);
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (CGPoint)swapArcLineEndPoint
{
  objc_msgSend_frame(self->wanConnectedBaseImageView, a2, v2);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MaxX = CGRectGetMaxX(v19);
  objc_msgSend_informationDiagramBaseImageRightEdgeInset_small_(ImageStore, v9, self->wanBaseProductID, self->sizeClass == 1);
  double v11 = MaxX - v10 + 13.0;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRectGetMidY(v20);

  double v15 = sub_22686B8F4(v11, v12, v13, v14);
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (CGPoint)swapArcControlPoint
{
  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  double v5 = v4;
  uint64_t v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11) {
    double v11 = v5;
  }
  double v12 = 50.0;
  if (self->sizeClass == 2) {
    double v12 = 60.0;
  }
  double v13 = v11 + v12;

  double v14 = sub_22686B8F4(v13, v8, v9, v10);
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (CGPoint)swapArcControlPoint1
{
  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  double v5 = v4;
  uint64_t v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11) {
    double v11 = v5;
  }
  double v12 = 40.0;
  if (self->sizeClass == 2) {
    double v12 = 50.0;
  }
  double v13 = v11 + v12;

  double v14 = sub_22686B8F4(v13, v8, v9, v10);
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (CGPoint)swapArcControlPoint2
{
  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  double v5 = v4;
  uint64_t v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11) {
    double v11 = v5;
  }
  double v12 = 40.0;
  if (self->sizeClass == 2) {
    double v12 = 50.0;
  }
  double v13 = v11 + v12;

  double v14 = sub_22686B8F4(v13, v8, v9, v10);
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

@end