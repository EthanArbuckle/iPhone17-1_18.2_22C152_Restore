@interface NTKParmesanPicayuneView
- (NTKParmesanPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (id)_fontForScale:(int64_t)a3 typeface:(unint64_t)a4 numerals:(unint64_t)a5 aodProgress:(double)a6;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPaddingInsets:(UIEdgeInsets)a3;
- (void)setState:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation NTKParmesanPicayuneView

- (NTKParmesanPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKParmesanPicayuneView;
  id v8 = [(CLKUITimeView *)&v22 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F32180]);
    uint64_t v11 = objc_msgSend_initWithTimeLabelOptions_forDevice_clockTimer_(v9, v10, 0, (uint64_t)v6, v7);
    v12 = (void *)*((void *)v8 + 70);
    *((void *)v8 + 70) = v11;

    objc_msgSend_addSubview_(v8, v13, *((void *)v8 + 70), v14);
    v15 = [NTKParmesanPicayuneStackedTimeView alloc];
    uint64_t v17 = objc_msgSend_initWithDevice_clockTimer_(v15, v16, (uint64_t)v6, (uint64_t)v7);
    v18 = (void *)*((void *)v8 + 71);
    *((void *)v8 + 71) = v17;

    objc_msgSend_addSubview_(v8, v19, *((void *)v8 + 71), v20);
  }

  return (NTKParmesanPicayuneView *)v8;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)NTKParmesanPicayuneView;
  [(NTKParmesanPicayuneView *)&v67 layoutSubviews];
  id v6 = objc_msgSend_device(self, v3, v4, v5);
  sub_246B5E520(v6, (uint64_t)v66);
  double v7 = v66[0];
  objc_msgSend_paddingInsets(self, v8, v9, v10);
  double v12 = v11;

  objc_msgSend_frame(self->_timeLabel, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  objc_msgSend_bounds(self, v20, v21, v22);
  double Width = CGRectGetWidth(v68);
  objc_msgSend_paddingInsets(self, v24, v25, v26);
  double v28 = v27;
  objc_msgSend_opticalInsets(self->_timeLabel, v29, v30, v31);
  double v33 = v32;
  v37 = objc_msgSend_configuration(self, v34, v35, v36);
  uint64_t v41 = objc_msgSend_numerals(v37, v38, v39, v40);

  if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v42, v41, v43))
  {
    objc_msgSend_bounds(self, v44, v45, v46);
    objc_msgSend_setFrame_(self->_timeLabel, v48, v49, v50, Width - v28 - v17 + v33, v47 * 0.5 - v19 * 0.5, v17, v19);
  }
  else
  {
    double v54 = v7 - v12;
    objc_msgSend_bounds(self, v44, v45, v46);
    double Height = CGRectGetHeight(v69);
    objc_msgSend__lastLineBaseline(self->_timeLabel, v56, v57, v58);
    objc_msgSend_setFrame_(self->_timeLabel, v60, v61, v62, Width - v28 - v17 + v33, Height - v59 - v54, v17, v19);
  }
  objc_msgSend_bounds(self, v51, v52, v53);
  objc_msgSend_setFrame_(self->_stackedTimeView, v63, v64, v65);
}

- (void)setPaddingInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v11.receiver = self;
  v11.super_class = (Class)NTKParmesanPicayuneView;
  -[CLKUITimeView setPaddingInsets:](&v11, sel_setPaddingInsets_);
  objc_msgSend_setPaddingInsets_(self->_stackedTimeView, v8, v9, v10, top, left, bottom, right);
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)NTKParmesanPicayuneView;
  [(CLKUITimeView *)&v73 setConfiguration:v4];
  uint64_t v8 = objc_msgSend_scale(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_typeface(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_numerals(v4, v13, v14, v15);
  double v18 = objc_msgSend__fontForScale_typeface_numerals_aodProgress_(self, v17, v8, v12, v16, 0.0);
  if (objc_msgSend_scale(v4, v19, v20, v21) == 3)
  {
    id v24 = objc_alloc_init(MEMORY[0x263F32170]);
    objc_msgSend_setTimeLabelFont_(v24, v25, (uint64_t)v18, v26);
    double v27 = NSNumber;
    uint64_t v31 = objc_msgSend_numerals(v4, v28, v29, v30);
    v34 = objc_msgSend_numberWithUnsignedInteger_(v27, v32, v31, v33);
    objc_msgSend_setForcedNumberSystem_(v24, v35, (uint64_t)v34, v36);

    uint64_t v40 = objc_msgSend_timeLabelColor(v4, v37, v38, v39);
    objc_msgSend_setTimeLabelColor_(v24, v41, (uint64_t)v40, v42);

    objc_msgSend_setConfiguration_(self->_stackedTimeView, v43, (uint64_t)v24, v44);
    objc_msgSend_setHidden_(self->_timeLabel, v45, 1, v46);
    objc_msgSend_setPaused_(self->_timeLabel, v47, 1, v48);
    objc_msgSend_setHidden_(self->_stackedTimeView, v49, 0, v50);
    objc_msgSend_setState_(self->_stackedTimeView, v51, 0, v52);
  }
  else
  {
    objc_msgSend_setFont_(self->_timeLabel, v22, (uint64_t)v18, v23);
    uint64_t v56 = objc_msgSend_numerals(v4, v53, v54, v55);
    objc_msgSend_setForcedNumberSystem_(self->_timeLabel, v57, v56, v58);
    uint64_t v62 = objc_msgSend_timeLabelColor(v4, v59, v60, v61);
    objc_msgSend_setTextColor_(self->_timeLabel, v63, (uint64_t)v62, v64);

    objc_msgSend_setHidden_(self->_timeLabel, v65, 0, v66);
    objc_msgSend_setPaused_(self->_timeLabel, v67, 0, v68);
    objc_msgSend_setHidden_(self->_stackedTimeView, v69, 1, v70);
    objc_msgSend_setState_(self->_stackedTimeView, v71, 1, v72);
  }
}

- (void)setState:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKParmesanPicayuneView;
  -[CLKUITimeView setState:](&v16, sel_setState_);
  if (a3 == 1)
  {
    objc_msgSend_setPaused_(self->_timeLabel, v5, 1, v7);
  }
  else
  {
    if (a3) {
      return;
    }
    int isHidden = objc_msgSend_isHidden(self->_timeLabel, v5, v6, v7);
    timeLabel = self->_timeLabel;
    if (isHidden)
    {
      objc_msgSend_setPaused_(timeLabel, v8, 1, v9);
      objc_msgSend_setState_(self->_stackedTimeView, v12, 0, v13);
      return;
    }
    objc_msgSend_setPaused_(timeLabel, v8, 0, v9);
  }
  objc_msgSend_setState_(self->_stackedTimeView, v14, 1, v15);
}

- (void)setOverrideDate:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKParmesanPicayuneView;
  id v4 = a3;
  [(CLKUITimeView *)&v13 setOverrideDate:v4];
  uint64_t v8 = objc_msgSend_timeFormatter(self->_timeLabel, v5, v6, v7, v13.receiver, v13.super_class);
  objc_msgSend_setOverrideDate_(v8, v9, (uint64_t)v4, v10);

  objc_msgSend_setOverrideDate_(self->_stackedTimeView, v11, (uint64_t)v4, v12);
}

- (id)_fontForScale:(int64_t)a3 typeface:(unint64_t)a4 numerals:(unint64_t)a5 aodProgress:(double)a6
{
  double v37 = 0.0;
  long long v36 = 0u;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  uint64_t v9 = objc_msgSend_device(self, a2, a3, a4, 0);
  sub_246B5E520(v9, (uint64_t)v34);

  if (a3 == 3)
  {
    double v10 = *(double *)&v34[1];
    sub_246C2C018();
    double v12 = v11;
    objc_super v13 = (double *)v35 + a5;
  }
  else
  {
    double v10 = *((double *)v34 + 1);
    sub_246C2C018();
    double v12 = v14;
    objc_super v13 = (double *)&v34[1] + a5 + 1;
  }
  double v15 = *v13;
  objc_super v16 = [NTKParmesanFontAttributes alloc];
  uint64_t v20 = objc_msgSend_initWithWeight_width_soft_grad_(v16, v17, v18, v19, v12, v15, *((double *)&v36 + 1), v37);
  uint64_t v26 = objc_msgSend_activeDictionary(v20, v21, v22, v23);
  switch(a4)
  {
    case 2uLL:
      uint64_t v27 = objc_msgSend_tokyoFontDescriptorWithAttributes_(NTKParmesanFontLoader, v24, (uint64_t)v26, v25);
      goto LABEL_10;
    case 1uLL:
      uint64_t v27 = objc_msgSend_newyorkFontDescriptorWithAttributes_(NTKParmesanFontLoader, v24, (uint64_t)v26, v25);
      goto LABEL_10;
    case 0uLL:
      uint64_t v27 = objc_msgSend_softFontDescriptorWithAttributes_(NTKParmesanFontLoader, v24, (uint64_t)v26, v25);
LABEL_10:
      double v28 = (void *)v27;
      goto LABEL_12;
  }
  double v28 = 0;
LABEL_12:
  if (objc_msgSend_isPartiallySupported_(NTKParmesanNumeralsEditOption, v24, a5, v25)) {
    objc_msgSend_numericSoftFontOfSize_weight_(MEMORY[0x263F57A80], v29, v30, v31, v10 * 0.5, *MEMORY[0x263F81828]);
  }
  else {
  double v32 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263F81708], v29, (uint64_t)v28, v31, v10);
  }

  return v32;
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_traitCollection(self, v6, v7, v8);
  uint64_t active = objc_msgSend_activeAppearance(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_activeAppearance(v5, v14, v15, v16);

  if (active != v17)
  {
    objc_msgSend_traitCollection(self, v18, v19, v20);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activeAppearance(v24, v21, v22, v23);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedTimeView, 0);

  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end