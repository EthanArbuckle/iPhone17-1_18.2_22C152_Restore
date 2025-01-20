@interface AIAudiogramResultGraphCell
+ (double)cellHeight;
- (AIAudiogramResultGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)isAccessibilityElement;
- (HKAudiogramSample)audiogram;
- (UIViewController)audiogramChart;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramChart:(id)a3;
@end

@implementation AIAudiogramResultGraphCell

+ (double)cellHeight
{
  return 432.0;
}

- (AIAudiogramResultGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v63[4] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)AIAudiogramResultGraphCell;
  id v51 = a4;
  v5 = -[AIAudiogramResultGraphCell initWithStyle:reuseIdentifier:](&v53, sel_initWithStyle_reuseIdentifier_, a3);
  v6 = v5;
  if (v5)
  {
    [(AIAudiogramResultGraphCell *)v5 setSelectionStyle:0];
    v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(AIAudiogramResultGraphCell *)v6 setBackgroundColor:v7];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass_2;
    uint64_t v62 = getHKHealthStoreClass_softClass_2;
    if (!getHKHealthStoreClass_softClass_2)
    {
      uint64_t v54 = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v56 = __getHKHealthStoreClass_block_invoke_2;
      v57 = &unk_265058588;
      v58 = &v59;
      __getHKHealthStoreClass_block_invoke_2((uint64_t)&v54);
      v8 = (void *)v60[3];
    }
    v9 = v8;
    _Block_object_dispose(&v59, 8);
    id v52 = objc_alloc_init(v9);
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v10 = (void *)getHKSampleTypeUpdateControllerClass_softClass_0;
    uint64_t v62 = getHKSampleTypeUpdateControllerClass_softClass_0;
    if (!getHKSampleTypeUpdateControllerClass_softClass_0)
    {
      uint64_t v54 = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v56 = __getHKSampleTypeUpdateControllerClass_block_invoke_0;
      v57 = &unk_265058588;
      v58 = &v59;
      __getHKSampleTypeUpdateControllerClass_block_invoke_0((uint64_t)&v54);
      v10 = (void *)v60[3];
    }
    v11 = v10;
    _Block_object_dispose(&v59, 8);
    v50 = (void *)[[v11 alloc] initWithHealthStore:v52];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v12 = (void *)getHKUnitPreferenceControllerClass_softClass_0;
    uint64_t v62 = getHKUnitPreferenceControllerClass_softClass_0;
    if (!getHKUnitPreferenceControllerClass_softClass_0)
    {
      uint64_t v54 = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v56 = __getHKUnitPreferenceControllerClass_block_invoke_0;
      v57 = &unk_265058588;
      v58 = &v59;
      __getHKUnitPreferenceControllerClass_block_invoke_0((uint64_t)&v54);
      v12 = (void *)v60[3];
    }
    v13 = v12;
    _Block_object_dispose(&v59, 8);
    v49 = (void *)[[v13 alloc] initWithHealthStore:v52];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v14 = (void *)getHKAudiogramChartViewControllerClass_softClass_0;
    uint64_t v62 = getHKAudiogramChartViewControllerClass_softClass_0;
    if (!getHKAudiogramChartViewControllerClass_softClass_0)
    {
      uint64_t v54 = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v56 = __getHKAudiogramChartViewControllerClass_block_invoke_0;
      v57 = &unk_265058588;
      v58 = &v59;
      __getHKAudiogramChartViewControllerClass_block_invoke_0((uint64_t)&v54);
      v14 = (void *)v60[3];
    }
    v15 = v14;
    _Block_object_dispose(&v59, 8);
    v16 = (void *)[[v15 alloc] initWithUnitController:v49 sampleTypeUpdateController:v50 minimumAudiogramHeight:400.0];
    [(AIAudiogramResultGraphCell *)v6 setAudiogramChart:v16];

    v17 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v18 = [v17 view];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(AIAudiogramResultGraphCell *)v6 contentView];
    v20 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v21 = [v20 view];
    [v19 addSubview:v21];

    v32 = (void *)MEMORY[0x263F08938];
    v48 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v47 = [v48 view];
    v45 = [v47 leadingAnchor];
    v46 = [(AIAudiogramResultGraphCell *)v6 contentView];
    v44 = [v46 leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:16.0];
    v63[0] = v43;
    v42 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v41 = [v42 view];
    v39 = [v41 trailingAnchor];
    v40 = [(AIAudiogramResultGraphCell *)v6 contentView];
    v38 = [v40 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:-16.0];
    v63[1] = v37;
    v36 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v35 = [v36 view];
    v33 = [v35 topAnchor];
    v34 = [(AIAudiogramResultGraphCell *)v6 contentView];
    v22 = [v34 topAnchor];
    v23 = [v33 constraintEqualToAnchor:v22];
    v63[2] = v23;
    v24 = [(AIAudiogramResultGraphCell *)v6 audiogramChart];
    v25 = [v24 view];
    v26 = [v25 bottomAnchor];
    v27 = [(AIAudiogramResultGraphCell *)v6 contentView];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28 constant:-16.0];
    v63[3] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:4];
    [v32 activateConstraints:v30];
  }
  return v6;
}

- (void)setAudiogram:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_audiogram, a3);
  v6 = [(AIAudiogramResultGraphCell *)self audiogramChart];
  v7 = v6;
  if (v5)
  {
    v17[0] = v5;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v7 setAudiograms:v8];
  }
  else
  {
    [v6 setAudiograms:MEMORY[0x263EFFA68]];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__AIAudiogramResultGraphCell_setAudiogram___block_invoke;
  v11[3] = &unk_2650586B8;
  v11[4] = self;
  v9 = v11;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v10 = (void (*)(void *))getAXPerformSafeBlockSymbolLoc_ptr;
  v16 = getAXPerformSafeBlockSymbolLoc_ptr;
  if (!getAXPerformSafeBlockSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getAXPerformSafeBlockSymbolLoc_block_invoke;
    v12[3] = &unk_265058588;
    v12[4] = &v13;
    __getAXPerformSafeBlockSymbolLoc_block_invoke((uint64_t)v12);
    v10 = (void (*)(void *))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v10)
  {
    metadataForHKAudiogramSample_cold_1();
    __break(1u);
  }
  v10(v9);
}

void __43__AIAudiogramResultGraphCell_setAudiogram___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audiogramChart];
  [v2 _resetCurrentGraph];

  id v3 = [*(id *)(a1 + 32) audiogramChart];
  [v3 _updateHeaderState];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[AIAudiogramResultGraphCell pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))id v5 = self; {
  else
  }
    id v5 = 0;
  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (UIViewController)audiogramChart
{
  return self->_audiogramChart;
}

- (void)setAudiogramChart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogramChart, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
}

@end