@interface HUIHeadphoneLevelGroup
- (BOOL)isRTL;
- (HUIHeadphoneLevelGroup)init;
- (NSMutableArray)inactiveLevels;
- (NSMutableArray)levels;
- (unint64_t)pipFlagIndex;
- (void)dealloc;
- (void)layoutLevels;
- (void)layoutSubviews;
- (void)setInactiveLevels:(id)a3;
- (void)setLevels:(id)a3;
- (void)updateWithExposure:(double)a3 withThreshold:(unint64_t)a4;
@end

@implementation HUIHeadphoneLevelGroup

- (HUIHeadphoneLevelGroup)init
{
  v24[1] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)HUIHeadphoneLevelGroup;
  v2 = [(HUIHeadphoneLevelGroup *)&v23 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_updateConstraints name:*MEMORY[0x263F83428] object:0];

    v2->_isRTL = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUIHeadphoneLevelGroup semanticContentAttribute](v2, "semanticContentAttribute")) == 1;
    BOOL v4 = [(HUIHeadphoneLevelGroup *)v2 isRTL];
    uint64_t v5 = 12;
    if (v4) {
      uint64_t v5 = 5;
    }
    v2->_pipFlagIndex = v5;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    levels = v2->_levels;
    v2->_levels = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    inactiveLevels = v2->_inactiveLevels;
    v2->_inactiveLevels = (NSMutableArray *)v8;

    uint64_t v10 = *MEMORY[0x263F15D50];
    int v11 = 18;
    do
    {
      v12 = objc_opt_new();
      [v12 setAccessibilityIdentifier:@"Pill"];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      v13 = [v12 layer];
      v14 = [MEMORY[0x263F157C8] filterWithType:v10];
      [v13 setCompositingFilter:v14];

      v15 = [v12 layer];
      id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
      objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

      [(HUIHeadphoneLevelGroup *)v2 addSubview:v12];
      [(NSMutableArray *)v2->_inactiveLevels addObject:v12];
      v17 = objc_opt_new();
      [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HUIHeadphoneLevelGroup *)v2 addSubview:v17];
      [(NSMutableArray *)v2->_levels addObject:v17];

      --v11;
    }
    while (v11);
    v18 = (void *)MEMORY[0x263F08938];
    v19 = [(HUIHeadphoneLevelGroup *)v2 heightAnchor];
    v20 = [v19 constraintEqualToConstant:34.0];
    v24[0] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [v18 activateConstraints:v21];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUIHeadphoneLevelGroup;
  [(HUIHeadphoneLevelGroup *)&v4 dealloc];
}

- (void)layoutSubviews
{
  *(void *)&v17[5] = *MEMORY[0x263EF8340];
  int v3 = Layout;
  [(HUIHeadphoneLevelGroup *)self frame];
  if (v4 == 316.0)
  {
    qword_2681558E8 = 0x3FF0000000000000;
    uint64_t v5 = &xmmword_226B9A138;
LABEL_11:
    long long v10 = v5[1];
    Layout = *v5;
    *(_OWORD *)&qword_2681558C8 = v10;
    xmmword_2681558D8 = v5[2];
    goto LABEL_12;
  }
  [(HUIHeadphoneLevelGroup *)self frame];
  if (v6 == 290.0)
  {
    qword_2681558E8 = 0x3FF0000000000000;
    uint64_t v5 = &xmmword_226B9A0C8;
    goto LABEL_11;
  }
  [(HUIHeadphoneLevelGroup *)self frame];
  if (v7 == 306.0)
  {
    qword_2681558E8 = 0x3FF0000000000000;
    uint64_t v5 = &xmmword_226B9A100;
    goto LABEL_11;
  }
  [(HUIHeadphoneLevelGroup *)self frame];
  if (v8 == 281.0)
  {
    qword_2681558E8 = 0x3FF0000000000000;
    uint64_t v5 = &xmmword_226B9A090;
    goto LABEL_11;
  }
  [(HUIHeadphoneLevelGroup *)self frame];
  if (v9 == 248.0)
  {
LABEL_10:
    qword_2681558E8 = 0x3FF0000000000000;
    uint64_t v5 = &layouts;
    goto LABEL_11;
  }
  if (!v3)
  {
    v13 = HCLogSoundMeter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      [(HUIHeadphoneLevelGroup *)self frame];
      *(_DWORD *)buf = 134217984;
      *(void *)v17 = v14;
      _os_log_impl(&dword_226B65000, v13, OS_LOG_TYPE_INFO, "Unknown headphone level width (%f). Falling back to 320", buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_12:
  v15.receiver = self;
  v15.super_class = (Class)HUIHeadphoneLevelGroup;
  [(HUIHeadphoneLevelGroup *)&v15 layoutSubviews];
  int v11 = HCLogSoundMeter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v17[0] = v3;
    LOWORD(v17[1]) = 1024;
    *(_DWORD *)((char *)&v17[1] + 2) = Layout;
    _os_log_impl(&dword_226B65000, v11, OS_LOG_TYPE_INFO, "Layout headphone level group for size %i -> %i", buf, 0xEu);
  }

  [(HUIHeadphoneLevelGroup *)self layoutLevels];
  if (v3 != Layout)
  {
    v12 = [(HUIHeadphoneLevelGroup *)self superview];
    [v12 setNeedsLayout];
  }
}

- (void)layoutLevels
{
  [(HUIHeadphoneLevelGroup *)self bounds];
  CGFloat v3 = (CGRectGetWidth(v9) + *((double *)&Layout + 1) * -18.0 + *(double *)&qword_2681558D0 * -17.0) * 0.5;
  unint64_t v4 = [(HUIHeadphoneLevelGroup *)self pipFlagIndex];
  uint64_t v5 = [(HUIHeadphoneLevelGroup *)self inactiveLevels];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke;
  v8[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v8[4] = v4;
  *(CGFloat *)&v8[5] = v3;
  [v5 enumerateObjectsUsingBlock:v8];

  double v6 = [(HUIHeadphoneLevelGroup *)self levels];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke_2;
  v7[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v7[4] = v4;
  *(CGFloat *)&v7[5] = v3;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 layer];
  [v5 setMasksToBounds:1];

  double v6 = [v8 layer];
  [v6 setCornerRadius:*((double *)&xmmword_2681558D8 + 1)];

  double v7 = *(double *)&xmmword_2681558D8;
  if (*(void *)(a1 + 32) == a3) {
    double v7 = *(double *)&xmmword_2681558D8 * 0.5;
  }
  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 40) + (double)a3 * *((double *)&Layout + 1) + (double)a3 * *(double *)&qword_2681558D0, v7);
}

void __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [v7 layer];
  [v5 setCornerRadius:*((double *)&xmmword_2681558D8 + 1)];

  double v6 = *(double *)&xmmword_2681558D8;
  if (*(void *)(a1 + 32) == a3) {
    double v6 = *(double *)&xmmword_2681558D8 * 0.5;
  }
  objc_msgSend(v7, "setFrame:", *(double *)(a1 + 40) + (double)a3 * *((double *)&Layout + 1) + (double)a3 * *(double *)&qword_2681558D0, v6);
}

- (void)updateWithExposure:(double)a3 withThreshold:(unint64_t)a4
{
  if (a3 <= 20.0)
  {
    float v7 = a3 / 20.0;
  }
  else
  {
    float v6 = (a3 + -20.0) / 90.0;
    float v7 = (float)(v6 * 17.0) + 1.0;
  }
  id v8 = [(HUIHeadphoneLevelGroup *)self levels];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HUIHeadphoneLevelGroup_updateWithExposure_withThreshold___block_invoke;
  v9[3] = &unk_2647CDD00;
  float v10 = v7;
  v9[4] = self;
  v9[5] = a4;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __59__HUIHeadphoneLevelGroup_updateWithExposure_withThreshold___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v10 = a2;
  int v5 = [*(id *)(a1 + 32) isRTL];
  unint64_t v6 = 17 - a3;
  if (!v5) {
    unint64_t v6 = a3;
  }
  float v7 = *(float *)(a1 + 48) - (float)v6;
  if (v7 < 0.0) {
    float v7 = 0.0;
  }
  float v8 = fminf(v7, 1.0);
  [v10 setAlpha:v8];
  if (v8 > 0.0)
  {
    CGRect v9 = colorForThreshold(*(void *)(a1 + 40));
    [v10 setBackgroundColor:v9];
  }
}

- (NSMutableArray)inactiveLevels
{
  return self->_inactiveLevels;
}

- (void)setInactiveLevels:(id)a3
{
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (unint64_t)pipFlagIndex
{
  return self->_pipFlagIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_inactiveLevels, 0);
}

@end