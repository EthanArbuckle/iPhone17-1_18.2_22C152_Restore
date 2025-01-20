@interface CPSFullScreenAlertViewController
- (CPAlertTemplate)alert;
- (CPSFullScreenAlertViewController)initWithAlert:(id)a3 alertDelegate:(id)a4 templateEnvironment:(id)a5;
- (NSArray)alertButtons;
- (id)_titleFont;
- (id)preferredFocusEnvironments;
- (void)_viewDidLoad;
- (void)didSelectButton:(id)a3;
- (void)setAlertButtons:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSFullScreenAlertViewController

- (CPSFullScreenAlertViewController)initWithAlert:(id)a3 alertDelegate:(id)a4 templateEnvironment:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)CPSFullScreenAlertViewController;
  v10 = [(CPSBaseTemplateViewController *)&v11 initWithTemplate:location[0] templateDelegate:v13 templateEnvironment:v12];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10) {
    objc_storeStrong((id *)&v15->_alertButtons, MEMORY[0x263EFFA68]);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (CPAlertTemplate)alert
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_21(v3, v4);

  return (CPAlertTemplate *)v5;
}

- (void)_viewDidLoad
{
  v72[9] = *MEMORY[0x263EF8340];
  v71 = self;
  SEL v70 = a2;
  v69.receiver = self;
  v69.super_class = (Class)CPSFullScreenAlertViewController;
  [(CPSBaseTemplateViewController *)&v69 _viewDidLoad];
  id v68 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v3 = v68;
  id v4 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v3, "setBackgroundColor:");

  v67[1] = (id)1;
  v2 = [CPSAbridgableLabel alloc];
  v67[0] = -[CPSAbridgableLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v67[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = v67[0];
  id v6 = [(CPSFullScreenAlertViewController *)v71 _titleFont];
  objc_msgSend(v5, "setFont:");

  [v67[0] setTextAlignment:1];
  id v7 = v67[0];
  id v8 = (id)[MEMORY[0x263F1C550] labelColor];
  objc_msgSend(v7, "setTextColor:");

  [v67[0] setNumberOfLines:4];
  id v9 = v67[0];
  objc_super v11 = [(CPSFullScreenAlertViewController *)v71 alert];
  v10 = [(CPAlertTemplate *)v11 titleVariants];
  objc_msgSend(v9, "setTextVariants:");

  [v68 addSubview:v67[0]];
  id v66 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v66 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v66 setDistribution:1];
  [v66 setAxis:0];
  [v66 setSpacing:20.0];
  [v68 addSubview:v66];
  id v13 = [(CPSFullScreenAlertViewController *)v71 alert];
  id v12 = [(CPAlertTemplate *)v13 actions];
  v59[1] = (id)MEMORY[0x263EF8330];
  int v60 = -1073741824;
  int v61 = 0;
  v62 = __48__CPSFullScreenAlertViewController__viewDidLoad__block_invoke;
  v63 = &unk_2648A4540;
  v64 = v71;
  id v65 = v66;
  -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:");

  v59[0] = objc_alloc_init(MEMORY[0x263F1C778]);
  id v14 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  [v14 addLayoutGuide:v59[0]];

  id v57 = (id)[v59[0] heightAnchor];
  id v56 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v55 = (id)[v56 safeAreaLayoutGuide];
  id v54 = (id)[v55 heightAnchor];
  id v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:multiplier:", 0.15);
  v72[0] = v53;
  id v52 = (id)[v59[0] topAnchor];
  id v51 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v50 = (id)[v51 safeAreaLayoutGuide];
  id v49 = (id)[v50 topAnchor];
  id v48 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
  v72[1] = v48;
  id v47 = (id)[v67[0] topAnchor];
  id v46 = (id)[v59[0] bottomAnchor];
  id v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
  v72[2] = v45;
  id v44 = (id)[v67[0] leftAnchor];
  id v43 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v42 = (id)[v43 safeAreaLayoutGuide];
  id v41 = (id)[v42 leftAnchor];
  id v40 = (id)objc_msgSend(v44, "constraintEqualToAnchor:constant:", 12.0);
  v72[3] = v40;
  id v39 = (id)[v67[0] rightAnchor];
  id v38 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v37 = (id)[v38 safeAreaLayoutGuide];
  id v36 = (id)[v37 rightAnchor];
  id v35 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", -12.0);
  v72[4] = v35;
  id v34 = (id)[v66 bottomAnchor];
  id v33 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v32 = (id)[v33 safeAreaLayoutGuide];
  id v31 = (id)[v32 bottomAnchor];
  id v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", -24.0);
  v72[5] = v30;
  id v29 = (id)[v66 centerXAnchor];
  id v28 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v27 = (id)[v28 safeAreaLayoutGuide];
  id v26 = (id)[v27 centerXAnchor];
  id v25 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
  v72[6] = v25;
  id v24 = (id)[v66 leftAnchor];
  id v23 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v22 = (id)[v23 safeAreaLayoutGuide];
  id v21 = (id)[v22 leftAnchor];
  id v20 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", 12.0);
  v72[7] = v20;
  id v19 = (id)[v66 rightAnchor];
  id v18 = (id)[(CPSFullScreenAlertViewController *)v71 view];
  id v17 = (id)[v18 safeAreaLayoutGuide];
  id v16 = (id)[v17 rightAnchor];
  id v15 = (id)objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", -12.0);
  v72[8] = v15;
  id v58 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:9];

  [MEMORY[0x263F08938] activateConstraints:v58];
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong((id *)&v64, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(v67, 0);
  objc_storeStrong(&v68, 0);
}

void __48__CPSFullScreenAlertViewController__viewDidLoad__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  v19[2] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17[3] = a3;
  v17[2] = a4;
  v17[1] = a1;
  v17[0] = +[CPSAlertButton buttonWithCPAlertAction:location[0]];
  [v17[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17[0] setDelegate:a1[4]];
  id v9 = v17[0];
  id v14 = (id)[v17[0] widthAnchor];
  id v13 = (id)[v14 constraintEqualToConstant:241.0];
  v19[0] = v13;
  id v12 = (id)[v17[0] heightAnchor];
  id v11 = (id)[v12 constraintEqualToConstant:40.0];
  v19[1] = v11;
  id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  objc_msgSend(v9, "addConstraints:");

  [a1[5] addArrangedSubview:v17[0]];
  id v16 = (id)[a1[4] alertButtons];
  id v4 = (id)[v16 arrayByAddingObject:v17[0]];
  id v5 = (void **)((char *)a1[4] + 1032);
  id v6 = *v5;
  CPSFullScreenAlertViewController *v5 = v4;

  objc_storeStrong(v17, 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSFullScreenAlertViewController;
  [(CPSBaseTemplateViewController *)&v4 viewWillAppear:a3];
  id v3 = (id)[(CPSFullScreenAlertViewController *)v7 navigationController];
  [v3 setNavigationBarHidden:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSFullScreenAlertViewController;
  [(CPSBaseTemplateViewController *)&v4 viewWillDisappear:a3];
  id v3 = (id)[(CPSFullScreenAlertViewController *)v7 navigationController];
  [v3 setNavigationBarHidden:0];
}

- (id)_titleFont
{
  v17[1] = *MEMORY[0x263EF8340];
  v13[2] = self;
  v13[1] = (id)a2;
  SEL v6 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D300];
  id v7 = (id)[(CPSFullScreenAlertViewController *)self traitCollection];
  v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  uint64_t v16 = *MEMORY[0x263F1D350];
  id v8 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v17[0] = v8;
  id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, &v16);

  id v9 = v13[0];
  uint64_t v14 = *MEMORY[0x263F1D210];
  id v15 = v12;
  id v10 = (id)[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  id v3 = v13[0];
  v13[0] = v2;

  id v11 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v13[0] size:0.0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v11;
}

- (void)didSelectButton:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_opt_class();
  id v8 = CPSSafeCast_21(v3, location[0]);
  id v7 = (id)[v8 identifier];
  uint64_t v5 = [(CPSBaseTemplateViewController *)v10 templateDelegate];
  char v6 = [(CPTemplateDelegate *)v5 conformsToProtocol:&unk_26DF72840];

  if (v6)
  {
    objc_super v4 = [(CPSBaseTemplateViewController *)v10 templateDelegate];
    [(CPTemplateDelegate *)v4 handleAlertActionForIdentifier:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  return [(CPSFullScreenAlertViewController *)self alertButtons];
}

- (NSArray)alertButtons
{
  return self->_alertButtons;
}

- (void)setAlertButtons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end