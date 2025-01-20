@interface HACCLiveListenLevelGroup
- (HACCLiveListenLevelGroup)initWithFrame:(CGRect)a3;
- (NSMutableArray)levels;
- (void)layoutSubviews;
- (void)setLevels:(id)a3;
- (void)updateLevel:(double)a3;
@end

@implementation HACCLiveListenLevelGroup

- (HACCLiveListenLevelGroup)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HACCLiveListenLevelGroup;
  v3 = -[HACCLiveListenLevelGroup initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    int v5 = 5;
    do
    {
      id v6 = objc_alloc_init(MEMORY[0x263F15880]);
      id v7 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.25];
      objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

      v8 = [(HACCLiveListenLevelGroup *)v3 layer];
      [v8 addSublayer:v6];

      [v4 addObject:v6];
      --v5;
    }
    while (v5);
    [(HACCLiveListenLevelGroup *)v3 setLevels:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HACCLiveListenLevelGroup;
  [(HACCLiveListenLevelGroup *)&v13 layoutSubviews];
  [(HACCLiveListenLevelGroup *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = [(HACCLiveListenLevelGroup *)self levels];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__HACCLiveListenLevelGroup_layoutSubviews__block_invoke;
  v12[3] = &unk_2647CD5E0;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  [v11 enumerateObjectsUsingBlock:v12];
}

void __42__HACCLiveListenLevelGroup_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F82E00];
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute"));
  uint64_t v9 = (void *)MEMORY[0x263F824C0];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  double v14 = (double)a3;
  if (v8 == 1)
  {
    double v15 = CGRectGetMinX(*(CGRect *)&v10) + 10.0 + v14 * 7.0;
    double v16 = 4.0;
  }
  else
  {
    double v15 = CGRectGetMaxX(*(CGRect *)&v10) + -10.0 + v14 * -7.0;
    double v16 = -4.0;
  }
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", v15 + v14 * v16, CGRectGetMidY(*(CGRect *)(a1 + 40)) + -3.5, 7.0, 7.0, 20.0);
  id v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", objc_msgSend(v17, "CGPath"));
}

- (void)updateLevel:(double)a3
{
  uint64_t v4 = [(HACCLiveListenLevelGroup *)self levels];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__HACCLiveListenLevelGroup_updateLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e29_v32__0__CAShapeLayer_8Q16_B24l;
  *(double *)&v5[4] = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __40__HACCLiveListenLevelGroup_updateLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F825C8];
  if (6 - a3 >= (unint64_t)(int)(*(double *)(a1 + 32) * 5.0)) {
    double v4 = 0.25;
  }
  else {
    double v4 = 1.0;
  }
  id v5 = a2;
  id v6 = [v3 colorWithWhite:1.0 alpha:v4];
  objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end