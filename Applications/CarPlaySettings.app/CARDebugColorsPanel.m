@interface CARDebugColorsPanel
- (CARDebugColorsPanel)initWithPanelController:(id)a3;
- (NSArray)colorModels;
- (id)cellSpecifier;
- (id)cellSpecifiers;
- (id)phoneView;
- (unint64_t)numberOfColumns;
- (void)_phoneButtonPressed:(id)a3;
- (void)colorViewWasTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARDebugColorsPanel

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D394;
    v8[3] = &unk_100092008;
    objc_copyWeak(&v9, &location);
    v5 = [(CARSettingsCellSpecifier *)v4 initWithTitle:@"Debug Colors" image:0 accessoryType:1 actionBlock:v8];
    v6 = self->_cellSpecifier;
    self->_cellSpecifier = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)phoneView
{
  phoneView = self->_phoneView;
  if (!phoneView)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_phoneView;
    self->_phoneView = v4;

    v23 = [(UIView *)self->_phoneView leftAnchor];
    v6 = [(UIView *)self->_phoneView topAnchor];
    v22 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v24 = self;
    id obj = [(CARDebugColorsPanel *)self colorModels];
    id v25 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = 1000;
      uint64_t v21 = *(void *)v39;
      do
      {
        uint64_t v7 = 0;
        v8 = v6;
        do
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(obj);
          }
          id v9 = [[DebugColorView alloc] initWithModel:*(void *)(*((void *)&v38 + 1) + 8 * v7)];
          [(DebugColorView *)v9 setUserInteractionEnabled:0];
          [(DebugColorView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
          v10 = +[UIButton buttonWithType:0];
          [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v10 setTag:v26 + v7];
          [v10 addSubview:v9];
          [(UIView *)v24->_phoneView addSubview:v10];
          [v10 addTarget:v24 action:"_phoneButtonPressed:" forControlEvents:0x2000];
          v36 = [(DebugColorView *)v9 topAnchor];
          v35 = [v10 topAnchor];
          v34 = [v36 constraintEqualToAnchor:v35];
          v42[0] = v34;
          v33 = [(DebugColorView *)v9 leftAnchor];
          v32 = [v10 leftAnchor];
          v31 = [v33 constraintEqualToAnchor:v32];
          v42[1] = v31;
          v30 = [(DebugColorView *)v9 rightAnchor];
          v29 = [v10 rightAnchor];
          v28 = [v30 constraintEqualToAnchor:v29];
          v42[2] = v28;
          v11 = [(DebugColorView *)v9 bottomAnchor];
          v12 = [v10 bottomAnchor];
          [v11 constraintEqualToAnchor:v12];
          v13 = uint64_t v37 = v7;
          v42[3] = v13;
          v14 = [v10 topAnchor];
          v15 = [v14 constraintEqualToAnchor:v8 constant:10.0];
          v42[4] = v15;
          v16 = [v10 leftAnchor];
          v17 = [v16 constraintEqualToAnchor:v23 constant:10.0];
          v42[5] = v17;
          +[NSArray arrayWithObjects:v42 count:6];
          v18 = v27 = v8;
          [v22 addObjectsFromArray:v18];

          v6 = [v10 bottomAnchor];

          uint64_t v7 = v37 + 1;
          v8 = v6;
        }
        while (v25 != (id)(v37 + 1));
        id v25 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        v26 += v7;
      }
      while (v25);
    }

    +[NSLayoutConstraint activateConstraints:v22];
    phoneView = v24->_phoneView;
  }

  return phoneView;
}

- (void)_phoneButtonPressed:(id)a3
{
  id v4 = a3;
  id v9 = [(CARDebugColorsPanel *)self colorModels];
  v5 = (char *)[v4 tag];

  v6 = [v9 objectAtIndexedSubscript:v5 - 1000];
  uint64_t v7 = [v6 color];
  v8 = [(CARDebugColorsPanel *)self view];
  [v8 setBackgroundColor:v7];
}

- (CARDebugColorsPanel)initWithPanelController:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CARDebugColorsPanel;
  result = [(CARSettingsPanel *)&v47 initWithPanelController:a3];
  if (result)
  {
    v46 = result;
    v45 = +[UIColor labelColor];
    v44 = +[DebugColorModel modelWithColor:v45 name:@"Label"];
    v48[0] = v44;
    v43 = +[UIColor _carSystemPrimaryColor];
    v42 = +[DebugColorModel modelWithColor:v43 name:@"Primary"];
    v48[1] = v42;
    long long v41 = +[UIColor _carSystemSecondaryColor];
    long long v40 = +[DebugColorModel modelWithColor:v41 name:@"Secondary"];
    v48[2] = v40;
    long long v39 = +[UIColor _carSystemTertiaryColor];
    long long v38 = +[DebugColorModel modelWithColor:v39 name:@"Tertiary"];
    v48[3] = v38;
    uint64_t v37 = +[UIColor _carSystemQuaternaryColor];
    v36 = +[DebugColorModel modelWithColor:v37 name:@"Quaternary"];
    v48[4] = v36;
    v35 = +[UIColor _carSystemFocusColor];
    v34 = +[DebugColorModel modelWithColor:v35 name:@"Focus"];
    v48[5] = v34;
    v33 = +[UIColor _carSystemFocusLabelColor];
    v32 = +[DebugColorModel modelWithColor:v33 name:@"Focus Label"];
    v48[6] = v32;
    v31 = +[UIColor _carSystemFocusPrimaryColor];
    v30 = +[DebugColorModel modelWithColor:v31 name:@"Focus Primary"];
    v48[7] = v30;
    v29 = +[UIColor _carSystemFocusSecondaryColor];
    v28 = +[DebugColorModel modelWithColor:v29 name:@"Focus Secondary"];
    v48[8] = v28;
    v27 = +[UIColor tableBackgroundColor];
    uint64_t v26 = +[DebugColorModel modelWithColor:v27 name:@"tableBackgroundColor"];
    v48[9] = v26;
    id v25 = +[UIColor systemRedColor];
    v24 = +[DebugColorModel modelWithColor:v25 name:@"System Red"];
    v48[10] = v24;
    v23 = +[UIColor systemOrangeColor];
    v22 = +[DebugColorModel modelWithColor:v23 name:@"System Orange"];
    v48[11] = v22;
    uint64_t v21 = +[UIColor systemYellowColor];
    v20 = +[DebugColorModel modelWithColor:v21 name:@"System Yellow"];
    v48[12] = v20;
    v19 = +[UIColor systemGreenColor];
    v18 = +[DebugColorModel modelWithColor:v19 name:@"System Green"];
    v48[13] = v18;
    v17 = +[UIColor systemTealColor];
    v16 = +[DebugColorModel modelWithColor:v17 name:@"System Teal"];
    v48[14] = v16;
    id v4 = +[UIColor systemBlueColor];
    v5 = +[DebugColorModel modelWithColor:v4 name:@"System Blue"];
    v48[15] = v5;
    v6 = +[UIColor systemPurpleColor];
    uint64_t v7 = +[DebugColorModel modelWithColor:v6 name:@"System Purple"];
    v48[16] = v7;
    v8 = +[UIColor systemPinkColor];
    id v9 = +[DebugColorModel modelWithColor:v8 name:@"System Pink"];
    v48[17] = v9;
    v10 = +[UIColor whiteColor];
    v11 = +[DebugColorModel modelWithColor:v10 name:@"White"];
    v48[18] = v11;
    v12 = +[UIColor blackColor];
    v13 = +[DebugColorModel modelWithColor:v12 name:@"Black"];
    v48[19] = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:v48 count:20];
    colorModels = v46->_colorModels;
    v46->_colorModels = (NSArray *)v14;

    return v46;
  }
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CARDebugColorsPanel;
  [(CARSettingsCollectionPanel *)&v2 viewDidLoad];
}

- (id)cellSpecifiers
{
  cellSpecifiers = self->_cellSpecifiers;
  if (!cellSpecifiers)
  {
    id v4 = (NSArray *)objc_opt_new();
    v5 = [CARSettingsCellViewSpecifier alloc];
    v6 = -[CarTaitStyleView initWithFrame:]([CarTaitStyleView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    uint64_t v7 = [(CARSettingsCellViewSpecifier *)v5 initWithView:v6 actionBlock:&stru_100092140];

    v17 = v7;
    [(NSArray *)v4 addObject:v7];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(CARDebugColorsPanel *)self colorModels];
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = [[DebugColorView alloc] initWithModel:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [(DebugColorView *)v11 setDelegate:self];
          objc_initWeak(&location, v11);
          v12 = [CARSettingsCellViewSpecifier alloc];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10000E20C;
          v19[3] = &unk_100092008;
          objc_copyWeak(&v20, &location);
          v13 = [(CARSettingsCellViewSpecifier *)v12 initWithView:v11 actionBlock:v19];
          [(NSArray *)v4 addObject:v13];

          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
        id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    p_cellSpecifiers = &self->_cellSpecifiers;
    v15 = *p_cellSpecifiers;
    *p_cellSpecifiers = v4;

    cellSpecifiers = *p_cellSpecifiers;
  }

  return cellSpecifiers;
}

- (unint64_t)numberOfColumns
{
  return 4;
}

- (void)colorViewWasTapped:(id)a3
{
  id v5 = [a3 colorModel];
  id v4 = [v5 color];
  [(CARSettingsCollectionPanel *)self setBackgroundColor:v4];
}

- (NSArray)colorModels
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorModels, 0);
  objc_storeStrong((id *)&self->_cellSpecifiers, 0);
  objc_storeStrong((id *)&self->_phoneView, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end