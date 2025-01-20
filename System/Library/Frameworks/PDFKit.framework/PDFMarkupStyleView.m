@interface PDFMarkupStyleView
- (PDFMarkupStyleView)initWithHandler:(id)a3;
@end

@implementation PDFMarkupStyleView

- (PDFMarkupStyleView)initWithHandler:(id)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  id v35 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PDFMarkupStyleView;
  v4 = -[PDFMarkupStyleView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v34 = v4;
    v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = 1;
    while (1)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x263F824E8]), "initWithFrame:", 0.0, 0.0, 33.0, 33.0);
      uint64_t v9 = PDFMarkupMenuColorMenuIconForMarkupStyle(v7 - 1);
      uint64_t v10 = v9;
      if ((unint64_t)(v7 - 1) >= 5)
      {
        if (v7 == 6)
        {
          uint64_t v14 = [MEMORY[0x263F827E8] largeUnderlinePot];
        }
        else
        {
          if (v7 != 7)
          {
            v13 = 0;
            goto LABEL_11;
          }
          uint64_t v14 = [MEMORY[0x263F827E8] largeStrikeOutPot];
        }
        v13 = (void *)v14;
      }
      else
      {
        v11 = (void *)MEMORY[0x263F827E8];
        v12 = PDFMarkupMenuColorForMenuIcon(v9);
        v13 = [v11 largeColorPotForColor:v12];
      }
LABEL_11:
      [v8 setImage:v13 forState:0];
      v15 = PDFMarkupMenuString(v10);
      [v8 setAccessibilityLabel:v15];

      v16 = (void *)MEMORY[0x263F823D0];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __38__PDFMarkupStyleView_initWithHandler___block_invoke;
      v36[3] = &unk_264203E88;
      id v37 = v35;
      uint64_t v38 = v7 - 1;
      v17 = [v16 actionWithHandler:v36];
      [v8 addAction:v17 forControlEvents:64];
      [v8 setTag:v7];
      [v6 addObject:v8];

      if (++v7 == 8)
      {
        v18 = (void *)[objc_alloc(MEMORY[0x263F82BF8]) initWithArrangedSubviews:v6];
        [v18 setAxis:0];
        [v18 setAlignment:3];
        [v18 setDistribution:3];
        [v18 setSpacing:1.0];
        objc_msgSend(v18, "setLayoutMargins:", 0.0, 4.0, 0.0, 4.0);
        [v18 setLayoutMarginsRelativeArrangement:1];
        v5 = v34;
        [(PDFMarkupStyleView *)v34 addSubview:v18];
        [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
        v28 = (void *)MEMORY[0x263F08938];
        v33 = [v18 leadingAnchor];
        v32 = [(PDFMarkupStyleView *)v34 leadingAnchor];
        v31 = [v33 constraintEqualToAnchor:v32];
        v40[0] = v31;
        v30 = [v18 trailingAnchor];
        v29 = [(PDFMarkupStyleView *)v34 trailingAnchor];
        v27 = [v30 constraintEqualToAnchor:v29];
        v40[1] = v27;
        v19 = [v18 topAnchor];
        v20 = [(PDFMarkupStyleView *)v34 topAnchor];
        v21 = [v19 constraintEqualToAnchor:v20];
        v40[2] = v21;
        v22 = [v18 bottomAnchor];
        v23 = [(PDFMarkupStyleView *)v34 bottomAnchor];
        v24 = [v22 constraintEqualToAnchor:v23];
        v40[3] = v24;
        v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
        [v28 activateConstraints:v25];

        break;
      }
    }
  }

  return v5;
}

uint64_t __38__PDFMarkupStyleView_initWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end