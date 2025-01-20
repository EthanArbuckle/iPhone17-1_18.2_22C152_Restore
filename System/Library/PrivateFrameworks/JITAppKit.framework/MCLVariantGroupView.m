@interface MCLVariantGroupView
- (BOOL)actionVariant;
- (Class)buttonClass;
- (MCLVariantGroupView)initWithFrame:(CGRect)a3;
- (id)createVariantButton:(Class)a3 type:(int64_t)a4;
- (int64_t)buttonType;
- (int64_t)variantCount;
- (int64_t)variantsPerLine;
- (void)clearVariants;
- (void)reloadData;
- (void)selectItemAtIndex:(int64_t)a3;
- (void)selectVariant:(id)a3;
- (void)setActionVariant:(BOOL)a3;
- (void)setButtonClass:(Class)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setVariantCount:(int64_t)a3;
- (void)setVariantsPerLine:(int64_t)a3;
@end

@implementation MCLVariantGroupView

- (MCLVariantGroupView)initWithFrame:(CGRect)a3
{
  CGRect v14 = a3;
  SEL v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)MCLVariantGroupView;
  v13 = -[MCLVariantGroupView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v3 = (objc_class *)(id)objc_opt_class();
    Class buttonClass = v13->_buttonClass;
    v13->_Class buttonClass = v3;

    v13->_buttonType = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buttons = v13->_buttons;
    v13->_buttons = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buttonConstraints = v13->_buttonConstraints;
    v13->_buttonConstraints = v7;

    v13->_selectedIndex = -1;
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (void)reloadData
{
  v57[2] = *MEMORY[0x263EF8340];
  v56 = self;
  v55[1] = (id)a2;
  if (([(objc_class *)self->_buttonClass isSubclassOfClass:objc_opt_class()] & 1) != 0
    && v56->_variantCount > 0
    && v56->_variantsPerLine > 0)
  {
    if ([(NSMutableArray *)v56->_buttons count]) {
      [(MCLVariantGroupView *)v56 clearVariants];
    }
    v55[0] = 0;
    double v54 = 0.0;
    double v54 = (float)(1.0 / (float)v56->_variantsPerLine);
    double v53 = 0.0;
    double v53 = 8.0 * (double)(v56->_variantsPerLine - 1) / (double)v56->_variantsPerLine;
    while ((unint64_t)[(NSMutableArray *)v56->_buttons count] > v56->_variantCount)
      [(NSMutableArray *)v56->_buttons removeLastObject];
    while (1)
    {
      unint64_t v2 = [(NSMutableArray *)v56->_buttons count];
      if (v2 >= v56->_variantCount) {
        break;
      }
      id v52 = [(MCLVariantGroupView *)v56 createVariantButton:v56->_buttonClass type:v56->_buttonType];
      LODWORD(v3) = 1148846080;
      [v52 setContentCompressionResistancePriority:1 forAxis:v3];
      [(NSMutableArray *)v56->_buttons addObject:v52];
      objc_storeStrong(&v52, 0);
    }
    for (unint64_t i = 0; i < v56->_variantCount; ++i)
    {
      id v50 = (id)[(NSMutableArray *)v56->_buttons objectAtIndexedSubscript:i];
      [(MCLVariantGroupView *)v56 addSubview:v50];
      v46 = v56;
      v57[0] = v50;
      id v48 = (id)[NSNumber numberWithUnsignedInteger:i];
      v57[1] = v48;
      id v47 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
      -[MCLVariantGroupView emitTMLSignal:withArguments:](v46, "emitTMLSignal:withArguments:", @"configureVariant");

      if ([v50 isSelected]) {
        v56->_selectedIndex = i;
      }
      if (i % v56->_variantsPerLine)
      {
        if (v55[0])
        {
          buttonConstraints = v56->_buttonConstraints;
          id v12 = (id)[v50 topAnchor];
          id v11 = (id)[v55[0] topAnchor];
          id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](buttonConstraints, "addObject:");

          v13 = v56->_buttonConstraints;
          id v16 = (id)[v50 leadingAnchor];
          id v15 = (id)[v55[0] trailingAnchor];
          id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 8.0);
          -[NSMutableArray addObject:](v13, "addObject:");

          v17 = v56->_buttonConstraints;
          id v20 = (id)[v50 widthAnchor];
          id v19 = (id)[v55[0] widthAnchor];
          id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v17, "addObject:");

          v21 = v56->_buttonConstraints;
          id v24 = (id)[v50 heightAnchor];
          id v23 = (id)[v55[0] heightAnchor];
          id v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v21, "addObject:");
        }
      }
      else
      {
        if (v55[0])
        {
          v38 = v56->_buttonConstraints;
          id v41 = (id)[v50 topAnchor];
          id v40 = (id)[v55[0] bottomAnchor];
          id v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:", 8.0);
          -[NSMutableArray addObject:](v38, "addObject:");

          v42 = v56->_buttonConstraints;
          id v45 = (id)[v50 heightAnchor];
          id v44 = (id)[v55[0] heightAnchor];
          id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v42, "addObject:");
        }
        else
        {
          v34 = v56->_buttonConstraints;
          id v37 = (id)[v50 topAnchor];
          id v36 = (id)[(MCLVariantGroupView *)v56 topAnchor];
          id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v34, "addObject:");
        }
        v25 = v56->_buttonConstraints;
        id v28 = (id)[v50 leadingAnchor];
        id v27 = (id)[(MCLVariantGroupView *)v56 leadingAnchor];
        id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
        -[NSMutableArray addObject:](v25, "addObject:");

        id v29 = (id)[v50 heightAnchor];
        id v49 = (id)[v29 constraintGreaterThanOrEqualToConstant:80.0];

        LODWORD(v4) = 1144750080;
        [v49 setPriority:v4];
        [(NSMutableArray *)v56->_buttonConstraints addObject:v49];
        v30 = v56->_buttonConstraints;
        id v33 = (id)[v50 widthAnchor];
        id v32 = (id)[(MCLVariantGroupView *)v56 widthAnchor];
        id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:multiplier:constant:", v54, -v53);
        -[NSMutableArray addObject:](v30, "addObject:");

        objc_storeStrong(&v49, 0);
      }
      if (i == v56->_variantCount - 1)
      {
        v5 = v56->_buttonConstraints;
        id v8 = (id)[v50 bottomAnchor];
        id v7 = (id)[(MCLVariantGroupView *)v56 bottomAnchor];
        id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
        -[NSMutableArray addObject:](v5, "addObject:");
      }
      objc_storeStrong(v55, v50);
      objc_storeStrong(&v50, 0);
    }
    [MEMORY[0x263F08938] activateConstraints:v56->_buttonConstraints];
    objc_storeStrong(v55, 0);
  }
}

- (void)clearVariants
{
  self->_selectedIndex = -1;
}

void __36__MCLVariantGroupView_clearVariants__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] removeFromSuperview];
  objc_storeStrong(location, 0);
}

- (id)createVariantButton:(Class)a3 type:(int64_t)a4
{
  v9 = self;
  v8[3] = (id)a2;
  v8[2] = a3;
  v8[1] = (id)a4;
  v8[0] = (id)[(objc_class *)a3 buttonWithType:a4];
  [v8[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = v8[0];
  id v6 = (id)[MEMORY[0x263F825C8] blackColor];
  objc_msgSend(v5, "setTitleColor:forState:");

  [v8[0] addTarget:v9 action:sel_selectVariant_ forControlEvents:64];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (void)selectVariant:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = [(NSMutableArray *)v8->_buttons indexOfObject:location[0]];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && (v6 != v8->_selectedIndex || v8->_actionVariant))
  {
    [(MCLVariantGroupView *)v8 selectItemAtIndex:v6];
    double v3 = v8;
    v9[0] = location[0];
    id v5 = (id)[NSNumber numberWithUnsignedInteger:v6];
    v9[1] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    -[MCLVariantGroupView emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", @"didSelectVariant");
  }
  objc_storeStrong(location, 0);
}

- (void)selectItemAtIndex:(int64_t)a3
{
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  if (self->_selectedIndex >= 0)
  {
    id v5 = (id)[(NSMutableArray *)v8->_buttons objectAtIndexedSubscript:v8->_selectedIndex];
    [v5 setSelected:0];
    objc_storeStrong(&v5, 0);
  }
  if (v6 >= 0)
  {
    unint64_t v3 = v6;
    if (v3 < [(NSMutableArray *)v8->_buttons count])
    {
      id v4 = (id)[(NSMutableArray *)v8->_buttons objectAtIndexedSubscript:v6];
      [v4 setSelected:1];
      v8->_selectedIndex = v6;
      objc_storeStrong(&v4, 0);
    }
  }
}

- (Class)buttonClass
{
  return self->_buttonClass;
}

- (void)setButtonClass:(Class)a3
{
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)variantCount
{
  return self->_variantCount;
}

- (void)setVariantCount:(int64_t)a3
{
  self->_variantCount = a3;
}

- (int64_t)variantsPerLine
{
  return self->_variantsPerLine;
}

- (void)setVariantsPerLine:(int64_t)a3
{
  self->_variantsPerLine = a3;
}

- (BOOL)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(BOOL)a3
{
  self->_actionVariant = a3;
}

- (void).cxx_destruct
{
}

@end