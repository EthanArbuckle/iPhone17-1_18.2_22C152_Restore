@interface AVTCategorySegmentedControl
- (AVTCategorySegmentedControl)initWithItems:(id)a3;
@end

@implementation AVTCategorySegmentedControl

- (AVTCategorySegmentedControl)initWithItems:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AVTCategorySegmentedControl;
  v3 = [(AVTCategorySegmentedControl *)&v20 initWithItems:a3];
  v4 = v3;
  if (v3)
  {
    [(AVTCategorySegmentedControl *)v3 setSelectedSegmentIndex:0];
    id v5 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [(AVTCategorySegmentedControl *)v4 setBackgroundImage:v5 forState:0 barMetrics:0];

    id v6 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [(AVTCategorySegmentedControl *)v4 setBackgroundImage:v6 forState:1 barMetrics:0];

    id v7 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [(AVTCategorySegmentedControl *)v4 setDividerImage:v7 forLeftSegmentState:0 rightSegmentState:0 barMetrics:0];

    uint64_t v25 = *MEMORY[0x263F1C238];
    uint64_t v8 = v25;
    v9 = [MEMORY[0x263F1C658] systemFontOfSize:18.0];
    v27[0] = v9;
    uint64_t v26 = *MEMORY[0x263F1C240];
    uint64_t v10 = v26;
    v11 = +[AVTUIColorRepository attributeTitleTextColor];
    v27[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v25 count:2];
    [(AVTCategorySegmentedControl *)v4 setTitleTextAttributes:v12 forState:0];

    v23[0] = v8;
    v13 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    v23[1] = v10;
    v24[0] = v13;
    v14 = +[AVTUIColorRepository attributeTitleTextColor];
    v24[1] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [(AVTCategorySegmentedControl *)v4 setTitleTextAttributes:v15 forState:4];

    v21[0] = v8;
    v16 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    v21[1] = v10;
    v22[0] = v16;
    v17 = +[AVTUIColorRepository attributeTitleTextColor];
    v22[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [(AVTCategorySegmentedControl *)v4 setTitleTextAttributes:v18 forState:1];
  }
  return v4;
}

@end