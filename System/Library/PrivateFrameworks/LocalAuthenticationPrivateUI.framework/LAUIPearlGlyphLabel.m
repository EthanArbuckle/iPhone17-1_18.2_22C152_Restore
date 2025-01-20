@interface LAUIPearlGlyphLabel
- (BOOL)inApplicationContext;
- (BOOL)isShimmerEnabled;
- (CGSize)maximumSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LAUIPearlGlyphLabel)init;
- (LAUIPearlGlyphLabel)initWithFrame:(CGRect)a3;
- (LAUIPearlGlyphLabel)initWithStyle:(int64_t)a3;
- (NSString)text;
- (id).cxx_construct;
- (id)_applyVisibilityAnimated:(id *)location;
- (int64_t)style;
- (void)_applyStyle;
- (void)_applyVisibilityAnimated:;
- (void)_applyVisibilityAnimated:(BOOL)a3;
- (void)_updateBoundsSizeAnimated:(BOOL)a3;
- (void)_updateFontAnimated:(BOOL)a3;
- (void)_updateGlyphPaused;
- (void)_updateReduceBlurState;
- (void)_updateText;
- (void)_updateVisibilityAnimated:(BOOL)a3;
- (void)boldTextStatusDidChange:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setInApplicationContext:(BOOL)a3;
- (void)setMaximumSize:(CGSize)a3 animated:(BOOL)a4;
- (void)setShimmerEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setText:(id)a3 animated:(BOOL)a4;
@end

@implementation LAUIPearlGlyphLabel

- (LAUIPearlGlyphLabel)init
{
  return [(LAUIPearlGlyphLabel *)self initWithStyle:0];
}

- (LAUIPearlGlyphLabel)initWithFrame:(CGRect)a3
{
  return -[LAUIPearlGlyphLabel initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIPearlGlyphLabel)initWithStyle:(int64_t)a3
{
  v51[12] = *MEMORY[0x263EF8340];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v47.receiver = self;
  v47.super_class = (Class)LAUIPearlGlyphLabel;
  v8 = -[LAUIPearlGlyphLabel initWithFrame:](&v47, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    *((void *)v8 + 73) = a3;
    v8[576] = 1;
    *(int64x2_t *)(v8 + 600) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *((_OWORD *)v8 + 34) = *(_OWORD *)(v8 + 600);
    v10 = [MEMORY[0x263EFF9D0] null];
    v50[0] = @"position";
    v50[1] = @"bounds";
    v51[0] = v10;
    v51[1] = v10;
    v50[2] = @"transform";
    v50[3] = @"backgroundColor";
    v51[2] = v10;
    v51[3] = v10;
    v50[4] = @"cornerRadius";
    v50[5] = @"contents";
    v51[4] = v10;
    v51[5] = v10;
    v50[6] = @"anchorPoint";
    v50[7] = @"opacity";
    v51[6] = v10;
    v51[7] = v10;
    v50[8] = @"strokeStart";
    v50[9] = @"strokeEnd";
    v51[8] = v10;
    v51[9] = v10;
    v50[10] = @"strokeColor";
    v50[11] = @"fillColor";
    v51[10] = v10;
    v51[11] = v10;
    v44 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:12];

    v11 = [v9 layer];
    [v11 setAllowsGroupOpacity:0];
    id v12 = objc_alloc_init(MEMORY[0x263F1CB60]);
    v13 = (void *)*((void *)v9 + 51);
    *((void *)v9 + 51) = v12;

    v14 = [*((id *)v9 + 51) layer];
    CATransform3DMakeScale(&v46, 1.1, 1.1, 1.0);
    [v14 setTransform:&v46];

    [v9 addSubview:*((void *)v9 + 51)];
    v15 = [*((id *)v9 + 51) layer];

    [v15 setAllowsGroupOpacity:0];
    [v15 setAllowsGroupBlending:0];
    id v16 = objc_alloc_init(MEMORY[0x263F15758]);
    v17 = (void *)*((void *)v9 + 52);
    *((void *)v9 + 52) = v16;

    [*((id *)v9 + 52) setCornerCurve:*MEMORY[0x263F15A20]];
    [*((id *)v9 + 52) setAllowsInPlaceFiltering:1];
    [*((id *)v9 + 52) setActions:v44];
    v18 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v18 setName:@"saturation"];
    [v18 setValue:&unk_26C534178 forKey:@"inputAmount"];
    uint64_t v19 = *MEMORY[0x263F15BC8];
    v20 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v20 setName:@"blur"];
    [v20 setValue:&unk_26C534178 forKey:@"inputRadius"];
    [v20 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    v21 = (void *)*((void *)v9 + 52);
    v49[0] = v18;
    v49[1] = v20;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
    [v21 setFilters:v22];

    [v15 addSublayer:*((void *)v9 + 52)];
    id v23 = objc_alloc_init(MEMORY[0x263F1CB60]);
    v24 = (void *)*((void *)v9 + 53);
    *((void *)v9 + 53) = v23;

    v25 = [*((id *)v9 + 53) layer];

    [*((id *)v9 + 51) addSubview:*((void *)v9 + 53)];
    id v26 = objc_alloc_init(MEMORY[0x263F1C768]);
    v27 = (void *)*((void *)v9 + 54);
    *((void *)v9 + 54) = v26;

    [*((id *)v9 + 54) setTextAlignment:1];
    [*((id *)v9 + 54) setLineBreakMode:4];
    [*((id *)v9 + 53) addSubview:*((void *)v9 + 54)];
    id v28 = objc_alloc_init(MEMORY[0x263F1CB60]);
    v29 = (void *)*((void *)v9 + 55);
    *((void *)v9 + 55) = v28;

    v30 = [*((id *)v9 + 55) layer];

    [v30 setAllowsGroupOpacity:0];
    [v30 setAllowsGroupBlending:0];
    v31 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CD8]];
    [v30 setCompositingFilter:v31];

    [*((id *)v9 + 51) addSubview:*((void *)v9 + 55)];
    v32 = [LAUIPearlGlyphView alloc];
    id v33 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration];
    uint64_t v34 = [(LAUIPearlGlyphView *)v32 initWithConfiguration:v33];
    v35 = (void *)*((void *)v9 + 56);
    *((void *)v9 + 56) = v34;

    v36 = [*((id *)v9 + 56) layer];

    objc_msgSend(*((id *)v9 + 56), "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 30.0, 30.0);
    [*((id *)v9 + 56) setState:2 animated:0];
    [*((id *)v9 + 56) setPaused:1];
    v37 = [MEMORY[0x263F157C8] filterWithType:v19];
    [v37 setValue:&unk_26C534190 forKey:@"inputRadius"];
    [v37 setValue:MEMORY[0x263EFFA80] forKey:@"inputHardEdges"];
    [v37 setValue:MEMORY[0x263EFFA80] forKey:@"inputNormalizeEdges"];
    v48 = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
    [v36 setFilters:v38];

    [*((id *)v9 + 55) addSubview:*((void *)v9 + 56)];
    [v9 _applyStyle];
    v39 = (void *)*((void *)v9 + 52);
    id v40 = [*((id *)v9 + 63) colorWithAlphaComponent:0.0];
    objc_msgSend(v39, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

    [*((id *)v9 + 54) setTextColor:*((void *)v9 + 64)];
    BOOL v41 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
    v9[575] = v41;
    v42 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v44);
    [v42 addObserver:v9 selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
    [v42 addObserver:v9 selector:sel_reduceTransparencyDidChange_ name:*MEMORY[0x263F1CE58] object:0];
    [v42 addObserver:v9 selector:sel_reduceMotionDidChange_ name:*MEMORY[0x263F1CE50] object:0];
    [v42 addObserver:v9 selector:sel_boldTextStatusDidChange_ name:*MEMORY[0x263F1CDD8] object:0];
    [v42 addObserver:v9 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
    [v9 _updateFontAnimated:0];
    [v9 _applyVisibilityAnimated:0];
  }
  return (LAUIPearlGlyphLabel *)v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  visibilityTimer = self->_visibilityTimer;
  if (visibilityTimer)
  {
    dispatch_source_cancel(visibilityTimer);
    double v5 = self->_visibilityTimer;
    self->_visibilityTimer = 0;
  }
  [(LAUIPearlGlyphLabel *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)LAUIPearlGlyphLabel;
  [(LAUIPearlGlyphLabel *)&v6 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3.width, a3.height);
  [v4 scale];
  double v6 = v5;

  double width = self->_currentLabelSize.width;
  double v8 = self->_currentMaximumSize.width;
  double height = self->_currentMaximumSize.height;
  id v10 = [(UILabel *)self->_label font];
  [v10 lineHeight];
  double v12 = v11;
  [v10 leading];
  if (width <= 0.0) {
    double v14 = 0.0;
  }
  else {
    double v14 = width + 12.0 + 12.0;
  }
  double v15 = fmax(v6, 1.0);
  double v16 = ceil(v15 * (v12 + v13)) / v15 + 5.0 + 5.0;

  double v17 = fmin(fmax(v16, 0.0), height);
  double v18 = fmin(fmax(v14, v17), v8);
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)LAUIPearlGlyphLabel;
  [(LAUIPearlGlyphLabel *)&v4 didMoveToWindow];
  v3 = [(LAUIPearlGlyphLabel *)self window];
  self->_inWindow = v3 != 0;

  [(LAUIPearlGlyphLabel *)self _updateText];
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(LAUIPearlGlyphLabel *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)layoutSubviews
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  v185.receiver = self;
  v185.super_class = (Class)LAUIPearlGlyphLabel;
  [(LAUIPearlGlyphLabel *)&v185 layoutSubviews];
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  [(LAUIPearlGlyphLabel *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  double v163 = *MEMORY[0x263F00148];
  BOOL animated = self->_animated;
  if (self->_animated)
  {
    LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v176, 1.0, 199.791, 25.4425, 0.0, 0);
    char m11_low = LOBYTE(v176.m11);
    v194[0] = *(_OWORD *)((char *)&v176.m11 + 1);
    *(_OWORD *)((char *)v194 + 15) = *(_OWORD *)&v176.m13;
    CGFloat m21 = v176.m21;
    long long v184 = *(_OWORD *)&v176.m22;
  }
  else
  {
    char m11_low = 0;
  }
  double v15 = [(UIView *)self->_container layer];
  if (animated)
  {
    v193[0] = v194[0];
    *(_OWORD *)((char *)v193 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v16 = *(id *)&m21;
    long long v183 = v184;
    char v17 = m11_low;
  }
  else
  {
    char v17 = 0;
  }
  id v18 = v15;
  [v18 anchorPoint];
  double v20 = v6 + v19 * v10;
  double v22 = v8 + v21 * v12;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v17;
    *(_OWORD *)((char *)&v176.m11 + 1) = v193[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v193 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v183;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v18, (LAUI_CA_utilities::spring_factory *)&v176, v20, v22, v163, v13, v10, v12);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  double width = self->_currentMaximumSize.width;
  }
  double height = self->_currentMaximumSize.height;
  id v25 = [(UILabel *)self->_label font];
  [v25 lineHeight];
  double v27 = v26;
  [v25 leading];
  double v29 = v28;

  [(CABackdropLayer *)self->_background cornerRadius];
  double v30 = fmax(v4, 1.0);
  double v165 = fmin(fmax(v12, ceil(v30 * (v27 + v29)) / v30 + 5.0 + 5.0), height);
  double v167 = round(v30 * (v165 * 0.5)) / v30;
  if (v31 != v167) {
    [(CABackdropLayer *)self->_background setCornerRadius:v167];
  }
  background = self->_background;
  CGFloat v33 = *MEMORY[0x263F00148];
  CGFloat v34 = *(double *)(MEMORY[0x263F00148] + 8);
  if (animated)
  {
    v192[0] = v194[0];
    *(_OWORD *)((char *)v192 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v35 = *(id *)&m21;
    long long v182 = v184;
    char v36 = m11_low;
  }
  else
  {
    char v36 = 0;
  }
  v37 = background;
  [(CABackdropLayer *)v37 anchorPoint];
  double v38 = fmin(fmax(v10, v165), width);
  double v162 = round(v30 * (v163 + (v10 - v38) * 0.5)) / v30;
  double v164 = v38;
  double v40 = v162 + v39 * v38;
  double v161 = round(v30 * (v13 + (v12 - v165) * 0.5)) / v30;
  double v42 = v161 + v41 * v165;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v36;
    *(_OWORD *)((char *)&v176.m11 + 1) = v192[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v192 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v182;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v37, (LAUI_CA_utilities::spring_factory *)&v176, v40, v42, v33, v34, v164, v165);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  v43 = [(UIView *)self->_glyphContainer layer];
  }
  CGFloat v44 = *MEMORY[0x263F00148];
  CGFloat v45 = *(double *)(MEMORY[0x263F00148] + 8);
  if (animated)
  {
    v191[0] = v194[0];
    *(_OWORD *)((char *)v191 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v46 = *(id *)&m21;
    long long v181 = v184;
    char v47 = m11_low;
  }
  else
  {
    char v47 = 0;
  }
  id v48 = v43;
  [v48 anchorPoint];
  uint64_t v154 = 440;
  double v50 = v162 + v49 * v164;
  double v52 = v161 + v51 * v165;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v47;
    *(_OWORD *)((char *)&v176.m11 + 1) = v191[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v191 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v181;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v48, (LAUI_CA_utilities::spring_factory *)&v176, v50, v52, v44, v45, v164, v165);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  v53 = [(UIView *)self->_labelContainer layer];
  }
  CGFloat v54 = *MEMORY[0x263F001A8];
  CGFloat v55 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v56 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v57 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (animated)
  {
    v190[0] = v194[0];
    *(_OWORD *)((char *)v190 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v58 = *(id *)&m21;
    long long v180 = v184;
    char v59 = m11_low;
  }
  else
  {
    char v59 = 0;
  }
  id v60 = v53;
  [v60 anchorPoint];
  double v62 = round(v30 * (v162 + (v164 - v56) * 0.5)) / v30 + v61 * v56;
  double v64 = round(v30 * (v161 + (v165 - v57) * 0.5)) / v30 + v63 * v57;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v59;
    *(_OWORD *)((char *)&v176.m11 + 1) = v190[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v190 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v180;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v60, (LAUI_CA_utilities::spring_factory *)&v176, v62, v64, v54, v55, v56, v57);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  [(UIView *)self->_labelContainer bounds];
  }
  double v158 = v66;
  double v159 = v65;
  double v156 = v68;
  double v157 = v67;
  id v69 = [(UILabel *)self->_label layer];
  [v69 bounds];
  CGFloat v71 = v70;
  CGFloat v73 = v72;
  double v75 = v74;
  double v77 = v76;
  double v78 = self->_maximumSize.width;
  if (animated)
  {
    v189[0] = v194[0];
    *(_OWORD *)((char *)v189 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v79 = *(id *)&m21;
    long long v179 = v184;
    char v80 = m11_low;
  }
  else
  {
    char v80 = 0;
  }
  id v81 = v69;
  [v81 anchorPoint];
  double v82 = fmin(v75, v78 + -12.0 + -12.0);
  double v84 = round(v30 * (v159 + (v157 - v82) * 0.5)) / v30 + v83 * v82;
  double v86 = round(v30 * (v158 + (v156 - v77) * 0.5)) / v30 + v85 * v77;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v80;
    *(_OWORD *)((char *)&v176.m11 + 1) = v189[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v189 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v179;
    LOBYTE(v176.m24) = 1;
  }
  char v87 = LAUI_CA_utilities::set_layer_geometry(v81, (LAUI_CA_utilities::spring_factory *)&v176, v84, v86, v71, v73, v82, v77);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  if ((v87 & 2) != 0)
  }
    [(UILabel *)self->_label setNeedsDisplay];

  begin = self->_labelSnapshots.__begin_;
  for (i = self->_labelSnapshots.var0; begin != i; ++begin)
  {
    v90 = [(__end_ *)*begin layer];
    [v90 bounds];
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    double v96 = v95;
    double v98 = v97;
    if (animated)
    {
      v188[0] = v194[0];
      *(_OWORD *)((char *)v188 + 15) = *(_OWORD *)((char *)v194 + 15);
      id v69 = *(id *)&m21;
      long long v178 = v184;
      char v99 = m11_low;
    }
    else
    {
      char v99 = 0;
    }
    id v100 = v90;
    [v100 anchorPoint];
    double v102 = v101;
    double v104 = v103;
    LOBYTE(v176.m11) = 0;
    LOBYTE(v176.m24) = 0;
    if (animated)
    {
      LOBYTE(v176.m11) = v99;
      *(_OWORD *)((char *)&v176.m11 + 1) = v188[0];
      *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v188 + 15);
      *(void *)&v176.CGFloat m21 = v69;
      *(_OWORD *)&v176.m22 = v178;
      LOBYTE(v176.m24) = 1;
    }
    LAUI_CA_utilities::set_layer_geometry(v100, (LAUI_CA_utilities::spring_factory *)&v176, round(v30 * (v159 + (v157 - v96) * 0.5)) / v30 + v102 * v96, round(v30 * (v158 + (v156 - v98) * 0.5)) / v30 + v104 * v98, v92, v94, v96, v98);
    if (LOBYTE(v176.m24)) {

    }
    if (animated) {
  }
    }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v154), "bounds", v154);
  double v160 = v105;
  double v107 = v106;
  double v109 = v108;
  double v111 = v110;
  v112 = [(LAUIPearlGlyphView *)self->_glyph layer];
  [v112 bounds];
  double v114 = v113;
  double v116 = v115;
  CGFloat v118 = v117;
  CGFloat v120 = v119;
  if (animated)
  {
    v187[0] = v194[0];
    *(_OWORD *)((char *)v187 + 15) = *(_OWORD *)((char *)v194 + 15);
    id v121 = *(id *)&m21;
    long long v177 = v184;
    char v122 = m11_low;
  }
  else
  {
    char v122 = 0;
  }
  id v123 = v112;
  [v123 anchorPoint];
  double v125 = round(v30 * (v107 + (v160 - v114) * 0.5)) / v30 + v124 * v114;
  double v127 = round(v30 * (v109 + (v111 - v116) * 0.5)) / v30 + v126 * v116;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v122;
    *(_OWORD *)((char *)&v176.m11 + 1) = v187[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v187 + 15);
    *(void *)&v176.CGFloat m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v177;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v123, (LAUI_CA_utilities::spring_factory *)&v176, v125, v127, v120, v118, v114, v116);
  if (LOBYTE(v176.m24)) {

  }
  if (animated) {
  memset(&v176, 0, sizeof(v176));
  }
  CGFloat v128 = round(v30 * (fmax(v160, v111) * 0.83908046)) / v30 / fmax(v114, v116);
  CATransform3DMakeScale(&v176, v128, v128, 1.0);
  CATransform3D v175 = v176;
  char v170 = 0;
  char v174 = 0;
  if (animated)
  {
    char v170 = m11_low;
    *(_OWORD *)v171 = v194[0];
    *(_OWORD *)&v171[15] = *(_OWORD *)((char *)v194 + 15);
    id v172 = *(id *)&m21;
    long long v173 = v184;
    char v174 = 1;
  }
  LAUI_CA_utilities::set_layer_transform(v123, (long long *)&v175, (LAUI_CA_utilities::spring_factory *)&v170);
  if (v174) {

  }
  v129 = self;
  v130 = [(UIView *)self->_container layer];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)self->_masks.__tree_.__begin_node_;
  if (begin_node != &self->_masks.__tree_.__pair1_)
  {
    do
    {
      id v132 = begin_node[4].__value_.__left_;
      id v133 = begin_node[5].__value_.__left_;
      [v133 cornerRadius];
      if (v134 != v167) {
        [v133 setCornerRadius:v167];
      }
      objc_msgSend(v132, "convertRect:fromLayer:", v130, v162, v161, v164, v165);
      double v136 = v135;
      double v138 = v137;
      double v140 = v139;
      double v142 = v141;
      CGFloat v143 = *MEMORY[0x263F00148];
      CGFloat v144 = *(double *)(MEMORY[0x263F00148] + 8);
      if (animated)
      {
        v186[0] = v194[0];
        *(_OWORD *)((char *)v186 + 15) = *(_OWORD *)((char *)v194 + 15);
        v129 = (LAUIPearlGlyphLabel *)*(id *)&m21;
        long long v169 = v184;
        char v145 = m11_low;
      }
      else
      {
        char v145 = 0;
      }
      id v146 = v133;
      [v146 anchorPoint];
      double v148 = v147;
      double v150 = v149;
      LOBYTE(v176.m11) = 0;
      LOBYTE(v176.m24) = 0;
      if (animated)
      {
        LOBYTE(v176.m11) = v145;
        *(_OWORD *)((char *)&v176.m11 + 1) = v186[0];
        *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v186 + 15);
        *(void *)&v176.CGFloat m21 = v129;
        *(_OWORD *)&v176.m22 = v169;
        LOBYTE(v176.m24) = 1;
      }
      LAUI_CA_utilities::set_layer_geometry(v146, (LAUI_CA_utilities::spring_factory *)&v176, v136 + v148 * v140, v138 + v150 * v142, v143, v144, v140, v142);
      if (LOBYTE(v176.m24)) {

      }
      if (animated) {
      left = (LAUIPearlGlyphLabel *)begin_node[1].__value_.__left_;
      }
      if (left)
      {
        do
        {
          v152 = left;
          left = (LAUIPearlGlyphLabel *)left->super.super.super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v152 = (LAUIPearlGlyphLabel *)begin_node[2].__value_.__left_;
          BOOL v153 = v152->super.super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)v152;
        }
        while (!v153);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)v152;
    }
    while (v152 != (LAUIPearlGlyphLabel *)&self->_masks.__tree_.__pair1_);
  }

  if (animated) {
}
  }

- (void)invalidate
{
}

- (BOOL)inApplicationContext
{
  return [(LAUIPearlGlyphView *)self->_glyph inApplicationContext];
}

- (void)setInApplicationContext:(BOOL)a3
{
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    BOOL v4 = a4;
    self->_style = a3;
    [(LAUIPearlGlyphLabel *)self _applyStyle];
    [(LAUIPearlGlyphLabel *)self _applyVisibilityAnimated:v4];
  }
}

- (void)setShimmerEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shimmerEnabled != a3)
  {
    BOOL v4 = a4;
    self->_shimmerEnabled = a3;
    self->_visibleNeedsUpdate = 1;
    [(LAUIPearlGlyphLabel *)self _updateGlyphPaused];
    [(LAUIPearlGlyphLabel *)self _updateVisibilityAnimated:v4];
  }
}

- (void)setText:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = (NSString *)a3;
  if ([(NSString *)v16 length])
  {
    double v6 = v16;
  }
  else
  {

    double v6 = 0;
  }
  text = self->_text;
  if (text == v6
    || (v17 = v6) != 0 && text && (v8 = [(NSString *)text isEqualToString:v6], double v6 = v17, v8))
  {
    BOOL v9 = v4 && self->_textUpdateNeedsAnimation;
    self->_textUpdateNeedsAnimation = v9;
  }
  else
  {
    double v10 = (NSString *)[(NSString *)v6 copy];
    double v11 = self->_text;
    self->_text = v10;

    double v12 = [(UILabel *)self->_label text];
    double v13 = self->_text;
    if (v13 == v12)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      if (v13) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        LOBYTE(v15) = 1;
      }
      else {
        BOOL v15 = ![(NSString *)v13 isEqualToString:v12];
      }
    }
    self->_textNeedsUpdate = v15;
    self->_textUpdateNeedsAnimation = v15 && v4;
    [(LAUIPearlGlyphLabel *)self _updateText];
  }
  MEMORY[0x270F9A758]();
}

- (void)setMaximumSize:(CGSize)a3 animated:(BOOL)a4
{
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (a3.height <= 0.0) {
    a3.double height = 1.79769313e308;
  }
  if (self->_maximumSize.width != a3.width || self->_maximumSize.height != a3.height)
  {
    self->_maximumSize = a3;
    [(LAUIPearlGlyphLabel *)self _updateFontAnimated:a4];
  }
}

- (void)_updateGlyphPaused
{
  glyph = self->_glyph;
  BOOL v4 = !self->_inWindow || !self->_text || !self->_shimmerEnabled;
  [(LAUIPearlGlyphView *)glyph setPaused:v4];
}

- (void)_updateText
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(LAUIPearlGlyphLabel *)self _updateGlyphPaused];
  if ((self->_inWindow || !self->_textUpdateNeedsAnimation) && self->_textNeedsUpdate)
  {
    self->_textNeedsUpdate = 0;
    BOOL textUpdateNeedsAnimation = self->_textUpdateNeedsAnimation;
    if (self->_textUpdateNeedsAnimation)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v32, 1.0, 199.791, 25.4425, 0.0, 0);
      char v4 = v32[0];
      long long v35 = v34;
      v36[0] = *(_OWORD *)&v32[1];
      *(_OWORD *)((char *)v36 + 15) = *(_OWORD *)&v32[16];
      double v21 = v33;
      if (self->_textUpdateNeedsAnimation)
      {
        double v5 = [(UILabel *)self->_label text];
        if (v5)
        {
          double v6 = [(UILabel *)self->_label snapshotViewAfterScreenUpdates:0];
          *(void *)v32 = v6;

          if (v6)
          {
            double v7 = [(UILabel *)self->_label layer];
            uint64_t v8 = [v7 presentationLayer];
            BOOL v9 = (void *)v8;
            if (v8) {
              double v10 = (void *)v8;
            }
            else {
              double v10 = v7;
            }
            id v11 = v10;

            double v12 = [v6 layer];
            [v11 opacity];
            objc_msgSend(v12, "setOpacity:");
            [v11 position];
            objc_msgSend(v12, "setPosition:");
            [v11 bounds];
            objc_msgSend(v12, "setBounds:");
            if (v11) {
              [v11 transform];
            }
            else {
              memset(v31, 0, sizeof(v31));
            }
            [v12 setTransform:v31];
          }
        }
        else
        {
          *(void *)v32 = 0;

          double v6 = 0;
        }
      }
      else
      {
        double v6 = 0;
        *(void *)v32 = 0;
      }
    }
    else
    {
      double v6 = 0;
      char v4 = 0;
      *(void *)v32 = 0;
    }
    [(UILabel *)self->_label setText:self->_text];
    [(UILabel *)self->_label sizeToFit];
    [(LAUIPearlGlyphLabel *)self setNeedsLayout];
    [(LAUIPearlGlyphLabel *)self layoutIfNeeded];
    double v13 = [(UILabel *)self->_label layer];
    [v13 removeAllAnimations];
    [v13 setOpacity:0.0];
    if (textUpdateNeedsAnimation && v6)
    {
      BOOL v14 = [v6 layer];
      [v14 opacity];
      if (v15 > 0.0)
      {
        std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>((char **)&self->_labelSnapshots, (id *)v32);
        [(UIView *)self->_labelContainer insertSubview:*(void *)v32 belowSubview:self->_label];
        [MEMORY[0x263F158F8] begin];
        objc_initWeak(&location, self);
        id v16 = (void *)MEMORY[0x263F158F8];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __34__LAUIPearlGlyphLabel__updateText__block_invoke;
        v27[3] = &unk_26420C900;
        id v28 = *(id *)v32;
        objc_copyWeak(&v29, &location);
        [v16 setCompletionBlock:v27];
        char v22 = v4;
        *(_OWORD *)id v23 = v36[0];
        *(_OWORD *)&v23[15] = *(_OWORD *)((char *)v36 + 15);
        id v24 = v21;
        long long v25 = v35;
        char v26 = 1;
        id v17 = v14;
        [v17 opacity];
        float v19 = v18;
        if (v18 != 0.0)
        {
          [v17 setOpacity:0.0];
          id v20 = LAUI_CA_utilities::add_additive_animation<double>(v17, @"opacity", (LAUI_CA_utilities::spring_factory *)&v22, v19, 0.0);
        }

        if (v26) {
        [MEMORY[0x263F158F8] commit];
        }
        objc_destroyWeak(&v29);

        objc_destroyWeak(&location);
      }
    }
    [(LAUIPearlGlyphLabel *)self _updateVisibilityAnimated:self->_textUpdateNeedsAnimation];

    if (textUpdateNeedsAnimation) {
  }
    }
}

void __34__LAUIPearlGlyphLabel__updateText__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = (char **)(WeakRetained + 60);
    double v5 = (void **)WeakRetained[60];
    char v4 = (void **)WeakRetained[61];
    if (v5 != v4)
    {
      while (*v5 != *(void **)(a1 + 32))
      {
        if (++v5 == v4)
        {
          double v5 = (void **)WeakRetained[61];
          break;
        }
      }
    }
    if (v5 != v4)
    {
      double v10 = WeakRetained;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,UIView * {__strong}*,UIView * {__strong}*,UIView * {__strong}*,0>(v5 + 1, v4, v5);
      double v7 = v6;
      for (i = v3[1]; i != v7; i -= 8)
      {
        BOOL v9 = (void *)*((void *)i - 1);
      }
      v3[1] = v7;
      std::vector<UIView * {__strong}>::shrink_to_fit(v3);
      WeakRetained = v10;
    }
  }
}

- (void)_applyStyle
{
  int64_t style = self->_style;
  if (style == 1)
  {
    BOOL v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v9;

    double v6 = (void *)MEMORY[0x263F1C550];
    double v7 = 0.6;
    double v8 = 1.0;
  }
  else
  {
    if (style) {
      return;
    }
    char v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.45];
    double v5 = self->_backgroundColor;
    self->_backgroundColor = v4;

    double v6 = (void *)MEMORY[0x263F1C550];
    double v7 = 0.8;
    double v8 = 0.0;
  }
  self->_textColor = [v6 colorWithWhite:v8 alpha:v7];
  MEMORY[0x270F9A758]();
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  text = self->_text;
  int v7 = text != 0;
  int visible = self->_visible;
  if (visible != v7 || self->_visibleNeedsUpdate)
  {
    if (text) {
      BOOL v9 = visible == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9) {
      goto LABEL_9;
    }
    if (!text)
    {
      LOBYTE(visibilityTimer) = 0;
      goto LABEL_14;
    }
    visibilityTimer = self->_visibilityTimer;
    if (visibilityTimer) {
LABEL_9:
    }
      LOBYTE(visibilityTimer) = a3;
LABEL_14:
    self->_allowDelayedVisibility = (char)visibilityTimer;
    *(_WORD *)&self->_int visible = v7;
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:](self, "_applyVisibilityAnimated:");
    return;
  }
  if (!self->_visibilityTimer)
  {
    if (a3)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v24, 1.0, 199.791, 25.4425, 0.0, 0);
      char v11 = v24;
      v29[0] = *(_OWORD *)v25;
      *(_OWORD *)((char *)v29 + 15) = *(_OWORD *)&v25[15];
      double v3 = v26;
      long long v28 = v27;
    }
    else
    {
      char v11 = 0;
    }
    double v12 = [(UILabel *)self->_label layer];
    char v19 = 0;
    char v23 = 0;
    if (v4)
    {
      char v19 = v11;
      *(_OWORD *)id v20 = v29[0];
      *(_OWORD *)&v20[15] = *(_OWORD *)((char *)v29 + 15);
      id v21 = v3;
      long long v22 = v28;
      char v23 = 1;
    }
    if (text) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    id v14 = v12;
    [v14 opacity];
    double v16 = v15;
    if (v15 != v13)
    {
      double v17 = 0.0;
      if (text) {
        *(float *)&double v17 = 1.0;
      }
      [v14 setOpacity:v17];
      if (v4) {
        id v18 = LAUI_CA_utilities::add_additive_animation<double>(v14, @"opacity", (LAUI_CA_utilities::spring_factory *)&v19, v16, v13);
      }
    }

    if (v23) {
    [(LAUIPearlGlyphLabel *)self _updateBoundsSizeAnimated:v4];
    }
    if (v4) {
  }
    }
}

- (void)_applyVisibilityAnimated:(BOOL)a3
{
  if (self->_glyph)
  {
    BOOL reduceBlur = self->_reduceBlur;
    BOOL shimmerEnabled = self->_shimmerEnabled;
  }
  else
  {
    BOOL shimmerEnabled = 0;
    BOOL reduceBlur = 1;
  }
  BOOL visible = self->_visible;
  if (a3)
  {
    LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v90, 1.0, 199.791, 25.4425, 0.0, 0);
    long long v85 = v90;
    long long v86 = v91;
    id v87 = v92;
    long long v88 = *(_OWORD *)v93;
    unsigned __int8 v89 = 1;
  }
  else
  {
    LOBYTE(v85) = 0;
    unsigned __int8 v89 = 0;
  }
  [(CABackdropLayer *)self->_background setEnabled:!reduceBlur];
  double v8 = self->_background;
  double v72 = [(CABackdropLayer *)v8 presentationLayer];
  BOOL v9 = [(CABackdropLayer *)v8 valueForKeyPath:@"filters.saturation.inputAmount"];
  int v69 = shimmerEnabled;
  BOOL v71 = visible;
  int v10 = !visible || reduceBlur;
  double v11 = 1.5;
  if (v10) {
    double v11 = 1.0;
  }
  double v12 = [NSNumber numberWithDouble:v11];
  id v13 = v9;
  id v14 = v12;
  float v15 = v14;
  if (v13 == v14)
  {
  }
  else
  {
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
    }
    else
    {
      char v17 = [v13 isEqual:v14];

      if (v17) {
        goto LABEL_23;
      }
    }
    [(CABackdropLayer *)v8 setValue:v15 forKeyPath:@"filters.saturation.inputAmount"];
    if (v89)
    {
      [v13 doubleValue];
      double v19 = v18;
      [v15 doubleValue];
      id v21 = LAUI_CA_utilities::add_additive_animation<double>(v8, @"filters.saturation.inputAmount", (LAUI_CA_utilities::spring_factory *)&v85, v19, v20);
    }
  }
LABEL_23:
  long long v22 = [(CABackdropLayer *)v8 valueForKeyPath:@"filters.blur.inputRadius"];
  int v70 = v10;
  if (v10) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 20;
  }
  char v24 = [NSNumber numberWithInt:v23];
  id v25 = v22;
  id v26 = v24;
  long long v27 = v26;
  if (v25 == v26)
  {

    goto LABEL_35;
  }
  if (v25 && v26)
  {
    char v28 = [v25 isEqual:v26];

    if (v28) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  [(CABackdropLayer *)v8 setValue:v27 forKeyPath:@"filters.blur.inputRadius"];
  if (v89)
  {
    [v25 doubleValue];
    double v30 = v29;
    [v27 doubleValue];
    id v32 = LAUI_CA_utilities::add_additive_animation<double>(v8, @"filters.blur.inputRadius", (LAUI_CA_utilities::spring_factory *)&v85, v30, v31);
  }
LABEL_35:
  CGFloat v33 = (void *)MEMORY[0x263F1C550];
  uint64_t v34 = [v72 backgroundColor];
  if (!v34) {
    uint64_t v34 = [(CABackdropLayer *)v8 backgroundColor];
  }
  long long v35 = [v33 colorWithCGColor:v34];
  backgroundColor = self->_backgroundColor;
  BOOL v68 = a3;
  if (v71)
  {
    if (reduceBlur)
    {
      uint64_t v37 = [(UIColor *)backgroundColor colorWithAlphaComponent:1.0];
    }
    else
    {
      uint64_t v37 = backgroundColor;
    }
  }
  else
  {
    uint64_t v37 = [(UIColor *)backgroundColor colorWithAlphaComponent:0.0];
  }
  double v38 = v37;
  double v39 = v35;
  double v40 = v38;
  double v41 = v40;
  if (v39 == v40)
  {

    animation = v39;
LABEL_51:

    goto LABEL_52;
  }
  if (!v39 || !v40)
  {

    goto LABEL_49;
  }
  char v42 = [(UIColor *)v39 isEqual:v40];

  if ((v42 & 1) == 0)
  {
LABEL_49:
    CGFloat v44 = v41;
    [(CABackdropLayer *)v8 setBackgroundColor:[(UIColor *)v44 CGColor]];
    [(CABackdropLayer *)v8 removeAnimationForKey:@"backgroundColor"];
    if (!v89) {
      goto LABEL_52;
    }
    animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)&v85, &cfstr_Backgroundcolo.isa);
    [animation setAdditive:0];
    objc_msgSend(animation, "setFromValue:", -[UIColor CGColor](v39, "CGColor"));
    objc_msgSend(animation, "setToValue:", -[UIColor CGColor](v44, "CGColor"));
    [(CABackdropLayer *)v8 addAnimation:animation forKey:@"backgroundColor"];
    goto LABEL_51;
  }
LABEL_52:

  textColor = self->_textColor;
  if (self->_reduceBlur)
  {
    [(UIColor *)textColor colorWithAlphaComponent:1.0];
    BOOL v46 = v68;
    int v47 = v70;
    id v48 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v48 = textColor;
    BOOL v46 = v68;
    int v47 = v70;
  }
  double v49 = [(UILabel *)self->_label textColor];
  double v50 = v48;
  double v51 = v50;
  if (v49 == v50)
  {

    goto LABEL_63;
  }
  if (!v50 || !v49)
  {

    goto LABEL_62;
  }
  char v52 = [(UIColor *)v49 isEqual:v50];

  if ((v52 & 1) == 0) {
LABEL_62:
  }
    [(UILabel *)self->_label setTextColor:v51];
LABEL_63:

  v53 = [(UIView *)self->_glyphContainer layer];
  double v54 = (double)v69;
  LOBYTE(v81[0]) = 0;
  char v84 = 0;
  int v55 = v89;
  if (v89)
  {
    v81[0] = v85;
    v81[1] = v86;
    id v82 = v87;
    long long v83 = v88;
    char v84 = 1;
  }
  if (v47) {
    double v54 = 0.0;
  }
  id v56 = v53;
  [v56 opacity];
  double v58 = *(float *)&v57;
  if (v54 != *(float *)&v57)
  {
    *(float *)&double v57 = v54;
    [v56 setOpacity:v57];
    if (v55) {
      id v59 = LAUI_CA_utilities::add_additive_animation<double>(v56, @"opacity", (LAUI_CA_utilities::spring_factory *)v81, v58, v54);
    }
  }

  if (v84) {
  objc_initWeak(&location, self);
  }
  objc_copyWeak(&to, &location);
  LOBYTE(v74) = v71;
  HIBYTE(v74) = v46;
  LOBYTE(v75) = 0;
  char v79 = 0;
  if (v89)
  {
    long long v75 = v85;
    long long v76 = v86;
    id v77 = v87;
    long long v78 = v88;
    char v79 = 1;
  }
  visibilityTimer = self->_visibilityTimer;
  if (visibilityTimer)
  {
    dispatch_source_cancel(visibilityTimer);
    double v61 = self->_visibilityTimer;
    self->_visibilityTimer = 0;
  }
  if (self->_allowDelayedVisibility)
  {
    double v62 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    double v63 = self->_visibilityTimer;
    self->_visibilityTimer = v62;

    double v64 = self->_visibilityTimer;
    dispatch_time_t v65 = dispatch_time(0, 120000000);
    dispatch_source_set_timer(v64, v65, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    double v66 = self->_visibilityTimer;
    *(void *)&long long v90 = MEMORY[0x263EF8330];
    *((void *)&v90 + 1) = 3321888768;
    *(void *)&long long v91 = ___ZZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
    *((void *)&v91 + 1) = &__block_descriptor_112_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2_e5_v8__0l;
    objc_copyWeak(&v92, &to);
    *(_WORD *)double v93 = v74;
    v93[8] = 0;
    char v97 = 0;
    if (v79)
    {
      *(_OWORD *)&v93[8] = v75;
      long long v94 = v76;
      id v95 = v77;
      long long v96 = v78;
      char v97 = 1;
    }
    double v67 = (void *)MEMORY[0x2166A1D50](&v90);
    if (v97) {

    }
    objc_destroyWeak(&v92);
    dispatch_source_set_event_handler(v66, v67);

    dispatch_resume((dispatch_object_t)self->_visibilityTimer);
  }
  else
  {
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:]::$_2::operator()((uint64_t)&to);
  }
  if (v79) {

  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
  if (v89) {
}
  }

- (void)_applyVisibilityAnimated:
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)a1);
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained[70];
    if (v4)
    {
      dispatch_source_cancel(v4);
      double v5 = v3[70];
      v3[70] = 0;
    }
    double v6 = [v3[51] layer];
    if (*(unsigned char *)(a1 + 8))
    {
      long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      *(_OWORD *)&v42.m33 = v7;
      long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      *(_OWORD *)&v42.m43 = v8;
      long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      *(_OWORD *)&v42.m11 = *MEMORY[0x263F15740];
      *(_OWORD *)&v42.m13 = v9;
      long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      *(_OWORD *)&v42.CGFloat m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      *(_OWORD *)&v42.m23 = v10;
    }
    else
    {
      CATransform3DMakeScale(&v42, 1.1, 1.1, 1.0);
    }
    double v11 = (_OWORD *)(a1 + 16);
    LOBYTE(v38[0]) = 0;
    char v41 = 0;
    if (*(unsigned char *)(a1 + 72))
    {
      long long v12 = *(_OWORD *)(a1 + 32);
      v38[0] = *v11;
      v38[1] = v12;
      id v39 = *(id *)(a1 + 48);
      long long v40 = *(_OWORD *)(a1 + 56);
      char v41 = 1;
    }
    LAUI_CA_utilities::set_layer_transform(v6, (long long *)&v42, (LAUI_CA_utilities::spring_factory *)v38);
    if (v41) {

    }
    id v13 = [v3[54] layer];
    unsigned int v14 = *(unsigned __int8 *)(a1 + 8);
    LOBYTE(v34[0]) = 0;
    char v37 = 0;
    int v15 = *(unsigned __int8 *)(a1 + 72);
    if (*(unsigned char *)(a1 + 72))
    {
      long long v16 = *(_OWORD *)(a1 + 32);
      v34[0] = *v11;
      v34[1] = v16;
      id v35 = *(id *)(a1 + 48);
      long long v36 = *(_OWORD *)(a1 + 56);
      char v37 = 1;
    }
    id v17 = v13;
    [v17 opacity];
    double v19 = *(float *)&v18;
    if (*(float *)&v18 != (double)v14)
    {
      *(float *)&double v18 = (float)v14;
      [v17 setOpacity:v18];
      if (v15) {
        id v20 = LAUI_CA_utilities::add_additive_animation<double>(v17, @"opacity", (LAUI_CA_utilities::spring_factory *)v34, v19, (double)v14);
      }
    }

    if (v37) {
    id v21 = [v3[56] layer];
    }
    int v22 = *(unsigned __int8 *)(a1 + 8);
    LOBYTE(v30[0]) = 0;
    char v33 = 0;
    int v23 = *(unsigned __int8 *)(a1 + 72);
    if (*(unsigned char *)(a1 + 72))
    {
      long long v24 = *(_OWORD *)(a1 + 32);
      v30[0] = *v11;
      v30[1] = v24;
      id v31 = *(id *)(a1 + 48);
      long long v32 = *(_OWORD *)(a1 + 56);
      char v33 = 1;
    }
    if (v22) {
      double v25 = 0.35;
    }
    else {
      double v25 = 1.0;
    }
    id v26 = v21;
    objc_msgSend(v26, "opacity", *(void *)&v30[0]);
    double v28 = *(float *)&v27;
    if (v25 != *(float *)&v27)
    {
      *(float *)&double v27 = v25;
      [v26 setOpacity:v27];
      if (v23) {
        id v29 = LAUI_CA_utilities::add_additive_animation<double>(v26, @"opacity", (LAUI_CA_utilities::spring_factory *)v30, v28, v25);
      }
    }

    if (v33) {
    [v3 _updateBoundsSizeAnimated:*(unsigned __int8 *)(a1 + 9)];
    }
    *((unsigned char *)v3 + 570) = 0;
    *((unsigned char *)v3 + 573) = 0;
  }
}

- (id)_applyVisibilityAnimated:(id *)location
{
  if (*((unsigned char *)location + 72)) {

  }
  objc_destroyWeak(location);
  return location;
}

- (void)_updateBoundsSizeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UILabel *)self->_label bounds];
  self->_currentMaximumSize = self->_maximumSize;
  self->_currentLabelSize.double width = v5;
  self->_currentLabelSize.double height = v6;
  long long v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = v8;

  long long v10 = [(LAUIPearlGlyphLabel *)self layer];
  [v10 anchorPoint];
  float64_t v44 = v12;
  float64_t v45 = v11;
  [v10 position];
  float64_t v42 = v14;
  float64_t v43 = v13;
  -[LAUIPearlGlyphLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  float64_t v40 = v16;
  float64_t v41 = v15;
  int8x16_t v39 = *(int8x16_t *)MEMORY[0x263F1D4E8];
  [v10 bounds];
  double v20 = v19;
  double v22 = v21;
  double v23 = fmax(v9, 1.0);
  v24.f64[0] = v45;
  v24.f64[1] = v44;
  __asm { FMOV            V3.2D, #1.0 }
  float64x2_t v29 = vsubq_f64(_Q3, v24);
  v30.f64[0] = v41;
  v30.f64[1] = v40;
  v31.f64[0] = v43;
  v31.f64[1] = v42;
  float64x2_t v32 = vmlsq_f64(v31, v30, v24);
  float64x2_t v33 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  float64x2_t v34 = vmlaq_f64(v31, v30, v29);
  float64x2_t v35 = vaddq_f64(v30, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v30), (int8x16_t)vaddq_f64(vsubq_f64(v32, vdivq_f64(vrndmq_f64(vmulq_n_f64(v32, v23)), v33)), vsubq_f64(vdivq_f64(vrndpq_f64(vmulq_n_f64(v34, v23)), v33), v34)), v39));
  double v36 = v35.f64[1];
  if (v20 != v35.f64[0] || v22 != v35.f64[1])
  {
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    void v49[2] = __49__LAUIPearlGlyphLabel__updateBoundsSizeAnimated___block_invoke;
    v49[3] = &unk_26420C928;
    v49[4] = self;
    v49[5] = v17;
    v49[6] = v18;
    *(double *)&v49[7] = v20;
    *(double *)&v49[8] = v22;
    double v46 = v35.f64[0];
    float64x2_t v50 = v35;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v49];
    if (v3)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v47, 1.0, 199.791, 25.4425, 0.0, 0);
      id v38 = LAUI_CA_utilities::add_additive_animation<CGSize>(v10, @"bounds.size", (LAUI_CA_utilities::spring_factory *)v47, v20, v22, v46, v36);
    }
    [(LAUIPearlGlyphLabel *)self setNeedsLayout];
    [(LAUIPearlGlyphLabel *)self layoutIfNeededAnimated:v3];
  }
}

uint64_t __49__LAUIPearlGlyphLabel__updateBoundsSizeAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)_updateReduceBlurState
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
  if (self->_reduceBlur != v3)
  {
    self->_BOOL reduceBlur = v3;
    [(LAUIPearlGlyphLabel *)self _applyVisibilityAnimated:0];
  }
}

- (void)_updateFontAnimated:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  CGFloat v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  baseFont = self->_baseFont;
  self->_baseFont = v5;

  id v21 = [MEMORY[0x263F1C920] mainScreen];
  [v21 scale];
  double v8 = v7;

  double v22 = self->_baseFont;
  [(UIFont *)v22 lineHeight];
  double v10 = v9;
  [(UIFont *)v22 leading];
  double v11 = fmax(v8, 1.0);
  double v13 = ceil(v11 * (v10 + v12)) / v11 + 5.0 + 5.0;

  double v14 = self->_baseFont;
  double v15 = v14;
  double height = self->_maximumSize.height;
  if (v13 > height && height > 10.0 && v13 > 10.0)
  {
    double v23 = v14;
    uint64_t v19 = [(UIFont *)v14 _fontScaledByScaleFactor:(height + -10.0) / (v13 + -10.0)];

    double v15 = (void *)v19;
  }
  id v24 = v15;
  [(UILabel *)self->_label setFont:v15];
  if (self->_textNeedsUpdate)
  {
    self->_textNeedsUpdate = 1;
  }
  else
  {
    text = self->_text;
    self->_textNeedsUpdate = text != 0;
    if (!text) {
      goto LABEL_15;
    }
  }
  LOBYTE(text) = self->_textUpdateNeedsAnimation || a3;
LABEL_15:
  self->_BOOL textUpdateNeedsAnimation = (char)text;
  [(LAUIPearlGlyphLabel *)self _updateText];
}

- (void)boldTextStatusDidChange:(id)a3
{
}

- (void)contentSizeCategoryDidChange:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isShimmerEnabled
{
  return self->_shimmerEnabled;
}

- (NSString)text
{
  return self->_text;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  p_labelSnapshots = &self->_labelSnapshots;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_labelSnapshots);
  std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy((uint64_t)&self->_masks, (void *)self->_masks.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_glyphContainer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (id).cxx_construct
{
  *((void *)self + 59) = 0;
  *((void *)self + 58) = 0;
  *((void *)self + 57) = (char *)self + 464;
  *((void *)self + 61) = 0;
  *((void *)self + 62) = 0;
  *((void *)self + 60) = 0;
  return self;
}

@end