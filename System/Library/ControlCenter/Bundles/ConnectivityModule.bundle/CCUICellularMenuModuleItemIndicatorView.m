@interface CCUICellularMenuModuleItemIndicatorView
- (CCUICellularMenuModuleItemIndicatorView)init;
- (CGSize)intrinsicContentSize;
- (UILabel)indicatorLabel;
- (double)baseline;
- (double)cornerRadius;
- (double)fontSize;
- (double)minPadding;
- (void)setBaseline:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setIndicatorLabel:(id)a3;
- (void)setMinPadding:(double)a3;
@end

@implementation CCUICellularMenuModuleItemIndicatorView

- (CCUICellularMenuModuleItemIndicatorView)init
{
  v149.receiver = self;
  v149.super_class = (Class)CCUICellularMenuModuleItemIndicatorView;
  v2 = [(CCUICellularMenuModuleItemIndicatorView *)&v149 init];
  v3 = v2;
  if (v2)
  {
    v2->_fontSize = 10.0;
    v2->_cornerRadius = 2.0;
    v2->_minPadding = 3.5;
    v2->_baseline = 3.0;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    indicatorLabel = v3->_indicatorLabel;
    v3->_indicatorLabel = v4;

    v8 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v6, v7);
    v11 = objc_msgSend_systemFontOfSize_(MEMORY[0x263F1C658], v9, v10, v3->_fontSize);
    v13 = objc_msgSend_scaledFontForFont_(v8, v12, (uint64_t)v11);

    v16 = objc_msgSend_fontDescriptor(v13, v14, v15);
    v18 = objc_msgSend_fontDescriptorWithSymbolicTraits_(v16, v17, 2);

    v19 = v3->_indicatorLabel;
    v21 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263F1C658], v20, (uint64_t)v18, 0.0);
    objc_msgSend_setFont_(v19, v22, (uint64_t)v21);

    objc_msgSend_setAdjustsFontForContentSizeCategory_(v3->_indicatorLabel, v23, 1);
    objc_msgSend_setNumberOfLines_(v3->_indicatorLabel, v24, 1);
    v25 = v3->_indicatorLabel;
    v28 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v26, v27);
    objc_msgSend_setTextColor_(v25, v29, (uint64_t)v28);

    objc_msgSend_setTextAlignment_(v3->_indicatorLabel, v30, 1);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v3->_indicatorLabel, v31, 0);
    objc_msgSend_setAdjustsFontForContentSizeCategory_(v3->_indicatorLabel, v32, 1);
    objc_msgSend_addSubview_(v3, v33, (uint64_t)v3->_indicatorLabel);
    v36 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v34, v35);
    objc_msgSend_setBackgroundColor_(v3, v37, (uint64_t)v36);

    v40 = objc_msgSend_layer(v3, v38, v39);
    v43 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v41, v42);
    objc_msgSend_scaledValueForValue_(v43, v44, v45, v3->_cornerRadius);
    objc_msgSend_setCornerRadius_(v40, v46, v47);

    v50 = objc_msgSend_layer(v3, v48, v49);
    objc_msgSend_setMasksToBounds_(v50, v51, 1);

    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v3, v52, 0);
    LODWORD(v53) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(v3, v54, 0, v53);
    LODWORD(v55) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(v3, v56, 1, v55);
    LODWORD(v57) = 1148846080;
    objc_msgSend_setContentHuggingPriority_forAxis_(v3, v58, 0, v57);
    v61 = objc_msgSend_widthAnchor(v3, v59, v60);
    v64 = objc_msgSend_heightAnchor(v3, v62, v63);
    v66 = objc_msgSend_constraintGreaterThanOrEqualToAnchor_multiplier_(v61, v65, (uint64_t)v64, 1.0);
    objc_msgSend_setActive_(v66, v67, 1);

    v70 = objc_msgSend_heightAnchor(v3, v68, v69);
    v73 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v71, v72);
    objc_msgSend_scaledValueForValue_(v73, v74, v75, 13.0);
    v78 = objc_msgSend_constraintGreaterThanOrEqualToConstant_(v70, v76, v77);
    objc_msgSend_setActive_(v78, v79, 1);

    v82 = objc_msgSend_topAnchor(v3, v80, v81);
    v85 = objc_msgSend_topAnchor(v3->_indicatorLabel, v83, v84);
    v88 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v86, v87);
    objc_msgSend_scaledValueForValue_(v88, v89, v90, v3->_minPadding);
    v92 = objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v82, v91, (uint64_t)v85);
    objc_msgSend_setActive_(v92, v93, 1);

    v96 = objc_msgSend_trailingAnchor(v3, v94, v95);
    v99 = objc_msgSend_trailingAnchor(v3->_indicatorLabel, v97, v98);
    v102 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v100, v101);
    objc_msgSend_scaledValueForValue_(v102, v103, v104, v3->_minPadding);
    v106 = objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v96, v105, (uint64_t)v99);
    objc_msgSend_setActive_(v106, v107, 1);

    v110 = objc_msgSend_leadingAnchor(v3->_indicatorLabel, v108, v109);
    v113 = objc_msgSend_leadingAnchor(v3, v111, v112);
    v116 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v114, v115);
    objc_msgSend_scaledValueForValue_(v116, v117, v118, v3->_minPadding);
    v120 = objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v110, v119, (uint64_t)v113);
    objc_msgSend_setActive_(v120, v121, 1);

    v124 = objc_msgSend_bottomAnchor(v3->_indicatorLabel, v122, v123);
    v127 = objc_msgSend_bottomAnchor(v3, v125, v126);
    v130 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v128, v129);
    objc_msgSend_scaledValueForValue_(v130, v131, v132, v3->_minPadding);
    v134 = objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v124, v133, (uint64_t)v127);
    objc_msgSend_setActive_(v134, v135, 1);

    v138 = objc_msgSend_indicatorLabel(v3, v136, v137);
    v141 = objc_msgSend_centerYAnchor(v138, v139, v140);
    v144 = objc_msgSend_centerYAnchor(v3, v142, v143);
    v146 = objc_msgSend_constraintEqualToAnchor_(v141, v145, (uint64_t)v144);
    objc_msgSend_setActive_(v146, v147, 1);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend_intrinsicContentSize(self->_indicatorLabel, a2, v2);
  double v5 = v4;
  double v7 = v6;
  uint64_t v10 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v8, v9);
  objc_msgSend_scaledValueForValue_(v10, v11, v12, self->_minPadding);
  double v14 = v5 + v13 * 2.0;
  v17 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], v15, v16);
  objc_msgSend_scaledValueForValue_(v17, v18, v19, 13.0);
  double v21 = v20;

  if (v7 < v21) {
    double v7 = v21;
  }

  double v22 = v14;
  double v23 = v7;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UILabel)indicatorLabel
{
  return self->_indicatorLabel;
}

- (void)setIndicatorLabel:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)minPadding
{
  return self->_minPadding;
}

- (void)setMinPadding:(double)a3
{
  self->_minPadding = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (void).cxx_destruct
{
}

@end