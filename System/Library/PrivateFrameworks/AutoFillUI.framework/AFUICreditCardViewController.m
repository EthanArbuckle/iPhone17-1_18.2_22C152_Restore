@interface AFUICreditCardViewController
+ (id)dateStringTextContentType:(id)a3 date:(id)a4 placeholderHint:(id)a5;
- (AFCreditCard)creditCard;
- (AFUICreditCardViewController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5 modalUIDelegate:(id)a6 suggestions:(id)a7;
- (AFUIModalUIDelegate)modalUIDelegate;
- (BOOL)hasSuggestions;
- (NSArray)suggestions;
- (NSMutableArray)creditCards;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (UIButton)manageCreditCardsButton;
- (UILabel)selectedCellLabel;
- (UITableView)myTableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)cardIconNameForCreditCard:(id)a3;
- (id)createSectionHeaderViewWithTitle:(id)a3 iconName:(id)a4;
- (id)performTextOperations;
- (id)processSuggestions:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_openSettings;
- (void)cancelButtonTapped:(id)a3;
- (void)handleTextInsertion:(id)a3;
- (void)manageCreditCardsButtonTapped:(id)a3;
- (void)setCreditCard:(id)a3;
- (void)setCreditCards:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setHasSuggestions:(BOOL)a3;
- (void)setManageCreditCardsButton:(id)a3;
- (void)setModalPresentationStyleForDevice;
- (void)setModalUIDelegate:(id)a3;
- (void)setMyTableView:(id)a3;
- (void)setPerformTextOperations:(id)a3;
- (void)setSelectedCellLabel:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation AFUICreditCardViewController

- (AFUICreditCardViewController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5 modalUIDelegate:(id)a6 suggestions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AFUICreditCardViewController;
  v18 = [(AFUICreditCardViewController *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_documentState, a4);
    objc_storeStrong((id *)&v19->_documentTraits, a3);
    uint64_t v20 = MEMORY[0x24C589E40](v15);
    id performTextOperations = v19->_performTextOperations;
    v19->_id performTextOperations = (id)v20;

    objc_storeWeak((id *)&v19->_modalUIDelegate, v16);
    uint64_t v22 = [v17 copy];
    suggestions = v19->_suggestions;
    v19->_suggestions = (NSArray *)v22;
  }
  return v19;
}

- (id)processSuggestions:(id)a3
{
  id v23 = a3;
  uint64_t v3 = [v23 count];
  [MEMORY[0x263EFF980] array];
  unint64_t v21 = v3;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [v23 objectAtIndex:v4];
      v6 = [v5 creditCardPayload];
      v7 = (void *)[v6 mutableCopy];

      uint64_t v8 = [v7 objectForKey:@"cc-name"];
      v9 = [v7 objectForKey:@"cc-number"];
      uint64_t v10 = [v7 objectForKey:@"cc-exp"];
      if (v10)
      {
        v11 = +[AFUICreditCardViewController dateStringTextContentType:@"cc-exp" date:v10 placeholderHint:0];
        [v7 setObject:v11 forKey:@"cc-exp"];
      }
      v12 = [v7 objectForKey:@"cc-exp"];
      id v13 = [v7 objectForKey:@"cc-csc"];
      id v14 = [v7 objectForKey:@"cc-type"];
      id v15 = [v5 title];
      [v5 subTitle];
      id v16 = v25 = (void *)v10;
      v24 = v5;
      id v17 = (void *)v8;
      v18 = [[AFCreditCard alloc] initWithName:v8 number:v9 expiration:v12 securityCode:v13 type:v14 nickname:v15 suffix:v16];
      [v22 addObject:v18];

      ++v4;
    }
    while ((double)(int)v4 < (double)v21);
  }
  [(AFUICreditCardViewController *)self setHasSuggestions:v21 != 0];

  return v22;
}

+ (id)dateStringTextContentType:(id)a3 date:(id)a4 placeholderHint:(id)a5
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x263EFF8F0];
  id v8 = a4;
  id v9 = [v7 alloc];
  uint64_t v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v11 = [v10 components:12 fromDate:v8];

  if ([v6 isEqualToString:@"cc-exp"])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02ld/%02ld", objc_msgSend(v11, "month"), objc_msgSend(v11, "year") % 100);
    id v14 = LABEL_8:;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"cc-exp-month"])
  {
    v12 = NSString;
    uint64_t v13 = [v11 month];
LABEL_7:
    objc_msgSend(v12, "stringWithFormat:", @"%02ld", v13, v16);
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"cc-exp-year"])
  {
    v12 = NSString;
    uint64_t v13 = [v11 year];
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

- (void)setModalPresentationStyleForDevice
{
  uint64_t v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 keyWindow];
  id v5 = [v4 traitCollection];

  if ([v5 userInterfaceIdiom] != 1) {
    [(AFUICreditCardViewController *)self setModalPresentationStyle:0];
  }
}

- (void)viewDidLoad
{
  v120[4] = *MEMORY[0x263EF8340];
  v114.receiver = self;
  v114.super_class = (Class)AFUICreditCardViewController;
  [(AFUICreditCardViewController *)&v114 viewDidLoad];
  [(AFUICreditCardViewController *)self setModalPresentationStyleForDevice];
  id v3 = objc_initWeak(&location, self);
  uint64_t v4 = [(AFUICreditCardViewController *)self processSuggestions:self->_suggestions];
  [(AFUICreditCardViewController *)self setCreditCards:v4];

  id v5 = [(AFUICreditCardViewController *)self myTableView];
  [v5 reloadData];

  v111 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v111 setTitle:@"Cancel" forState:0];
  [v111 addTarget:self action:sel_cancelButtonTapped_ forControlEvents:64];
  id v6 = [MEMORY[0x263F82760] systemFontOfSize:18.0];
  v7 = [v111 titleLabel];
  [v7 setFont:v6];

  [v111 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [(AFUICreditCardViewController *)self view];
  [v8 addSubview:v111];

  id v109 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v109 setText:@"AutoFill Credit Card"];
  [v109 setTextAlignment:1];
  id v9 = [MEMORY[0x263F82760] boldSystemFontOfSize:18.0];
  [v109 setFont:v9];

  [v109 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = [(AFUICreditCardViewController *)self view];
  [v10 addSubview:v109];

  id v110 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v110 setText:@"Choose a credit card to AutoFill."];
  [v110 setTextAlignment:1];
  v11 = [MEMORY[0x263F82760] systemFontOfSize:13.0];
  [v110 setFont:v11];

  [v110 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(AFUICreditCardViewController *)self view];
  [v12 addSubview:v110];

  id v13 = objc_alloc(MEMORY[0x263F82C78]);
  id v14 = objc_msgSend(v13, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AFUICreditCardViewController *)self setMyTableView:v14];

  id v15 = [(AFUICreditCardViewController *)self myTableView];
  [v15 setDataSource:self];

  uint64_t v16 = [(AFUICreditCardViewController *)self myTableView];
  [v16 setDelegate:self];

  id v17 = [(AFUICreditCardViewController *)self myTableView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(AFUICreditCardViewController *)self view];
  v19 = [(AFUICreditCardViewController *)self myTableView];
  [v18 addSubview:v19];

  id v20 = objc_alloc_init(MEMORY[0x263F828E0]);
  [(AFUICreditCardViewController *)self setSelectedCellLabel:v20];

  unint64_t v21 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v21 setTextAlignment:1];

  id v22 = [MEMORY[0x263F825C8] blackColor];
  id v23 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v23 setTextColor:v22];

  v24 = [MEMORY[0x263F82760] systemFontOfSize:16.0];
  objc_super v25 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v25 setFont:v24];

  v26 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(AFUICreditCardViewController *)self view];
  v28 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v27 addSubview:v28];

  id v112 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v112 setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = [(AFUICreditCardViewController *)self view];
  [v29 addSubview:v112];

  v81 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_8];
  [v112 setBackgroundColor:v81];
  uint64_t v30 = [(AFUICreditCardViewController *)self modalPresentationStyle];
  v80 = (void *)MEMORY[0x263F08938];
  if (v30)
  {
    v102 = [v112 centerXAnchor];
    v105 = [(AFUICreditCardViewController *)self view];
    v99 = [v105 centerXAnchor];
    v96 = [v102 constraintEqualToAnchor:v99];
    v119[0] = v96;
    v91 = [v112 widthAnchor];
    v93 = [(AFUICreditCardViewController *)self view];
    v89 = [v93 widthAnchor];
    v87 = [v91 constraintEqualToAnchor:v89 multiplier:0.825];
    v119[1] = v87;
    v84 = [v112 heightAnchor];
    v85 = [(AFUICreditCardViewController *)self view];
    v83 = [v85 heightAnchor];
    v82 = [v84 constraintEqualToAnchor:v83 multiplier:0.643];
    v119[2] = v82;
    v31 = [v112 topAnchor];
    v32 = [(AFUICreditCardViewController *)self view];
    v33 = [v32 topAnchor];
    v34 = [v31 constraintEqualToAnchor:v33 constant:10.0];
    v119[3] = v34;
    v35 = [v112 bottomAnchor];
    v36 = [(AFUICreditCardViewController *)self view];
    v37 = [v36 bottomAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    v119[4] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:5];
    [v80 activateConstraints:v39];
  }
  else
  {
    v102 = [v112 topAnchor];
    v105 = [(AFUICreditCardViewController *)self view];
    v99 = [v105 topAnchor];
    v96 = [v102 constraintEqualToAnchor:v99];
    v120[0] = v96;
    v91 = [v112 leadingAnchor];
    v93 = [(AFUICreditCardViewController *)self view];
    v89 = [v93 leadingAnchor];
    v87 = [v91 constraintEqualToAnchor:v89];
    v120[1] = v87;
    v84 = [v112 trailingAnchor];
    v85 = [(AFUICreditCardViewController *)self view];
    v83 = [v85 trailingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v120[2] = v82;
    v31 = [v112 bottomAnchor];
    v32 = [(AFUICreditCardViewController *)self view];
    v33 = [v32 bottomAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v120[3] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:4];
    [v80 activateConstraints:v35];
  }

  v40 = [v112 layer];
  [v40 setCornerRadius:10.0];

  v41 = [v112 layer];
  [v41 setMasksToBounds:1];

  [v112 addSubview:v111];
  [v112 addSubview:v109];
  [v112 addSubview:v110];
  v42 = [(AFUICreditCardViewController *)self myTableView];
  [v112 addSubview:v42];

  v43 = [(AFUICreditCardViewController *)self selectedCellLabel];
  [v112 addSubview:v43];

  v44 = (void *)MEMORY[0x263F08938];
  v45 = [v110 topAnchor];
  v46 = [v112 topAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:10.0];
  v118[0] = v47;
  v48 = [v110 centerXAnchor];
  v49 = [v112 centerXAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v118[1] = v50;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:2];
  [v44 activateConstraints:v51];

  v94 = (void *)MEMORY[0x263F08938];
  v106 = [v111 topAnchor];
  v103 = [v110 bottomAnchor];
  v100 = [v106 constraintEqualToAnchor:v103 constant:20.0];
  v117[0] = v100;
  v97 = [v111 leadingAnchor];
  v52 = [v112 leadingAnchor];
  v53 = [v97 constraintEqualToAnchor:v52 constant:25.0];
  v117[1] = v53;
  v54 = [v109 centerYAnchor];
  v55 = [v111 centerYAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  v117[2] = v56;
  v57 = [v109 centerXAnchor];
  v58 = [v112 centerXAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  v117[3] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:4];
  [v94 activateConstraints:v60];

  v86 = (void *)MEMORY[0x263F08938];
  v107 = [(AFUICreditCardViewController *)self myTableView];
  v104 = [v107 topAnchor];
  v101 = [v109 bottomAnchor];
  v98 = [v104 constraintEqualToAnchor:v101 constant:20.0];
  v116[0] = v98;
  v95 = [(AFUICreditCardViewController *)self myTableView];
  v92 = [v95 leadingAnchor];
  v90 = [v112 leadingAnchor];
  v88 = [v92 constraintEqualToAnchor:v90 constant:20.0];
  v116[1] = v88;
  v61 = [(AFUICreditCardViewController *)self myTableView];
  v62 = [v61 trailingAnchor];
  v63 = [v112 trailingAnchor];
  v64 = [v62 constraintEqualToAnchor:v63 constant:-20.0];
  v116[2] = v64;
  v65 = [(AFUICreditCardViewController *)self myTableView];
  v66 = [v65 bottomAnchor];
  v67 = [v112 bottomAnchor];
  v68 = [v66 constraintEqualToAnchor:v67 constant:0.0];
  v116[3] = v68;
  v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:4];
  [v86 activateConstraints:v69];

  v70 = (void *)MEMORY[0x263F08938];
  v108 = [(AFUICreditCardViewController *)self selectedCellLabel];
  v71 = [v108 topAnchor];
  v72 = [(AFUICreditCardViewController *)self myTableView];
  v73 = [v72 bottomAnchor];
  v74 = [v71 constraintEqualToAnchor:v73 constant:10.0];
  v115[0] = v74;
  v75 = [(AFUICreditCardViewController *)self selectedCellLabel];
  v76 = [v75 centerXAnchor];
  v77 = [v112 centerXAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  v115[1] = v78;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:2];
  [v70 activateConstraints:v79];

  objc_destroyWeak(&location);
}

id __43__AFUICreditCardViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
  }

  return v2;
}

- (void)cancelButtonTapped:(id)a3
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v7 = [v6 count];

  if (v7 == a4)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(AFUICreditCardViewController *)self creditCards];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];

    id v8 = [v10 nickname];
  }

  return v8;
}

- (id)createSectionHeaderViewWithTitle:(id)a3 iconName:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F82E00];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = [(AFUICreditCardViewController *)self myTableView];
  [v10 bounds];
  v11 = objc_msgSend(v9, "initWithFrame:", 0.0, 0.0);

  id v12 = objc_alloc(MEMORY[0x263F828E0]);
  id v13 = [(AFUICreditCardViewController *)self myTableView];
  [v13 bounds];
  id v15 = objc_msgSend(v12, "initWithFrame:", 16.0, 0.0, v14 + -60.0, 44.0);

  uint64_t v16 = [MEMORY[0x263F82760] boldSystemFontOfSize:20.0];
  [v15 setFont:v16];

  id v17 = [MEMORY[0x263F825C8] labelColor];
  [v15 setTextColor:v17];

  [v15 setText:v8];
  [v11 addSubview:v15];
  id v18 = objc_alloc(MEMORY[0x263F82828]);
  v19 = [(AFUICreditCardViewController *)self myTableView];
  [v19 bounds];
  unint64_t v21 = objc_msgSend(v18, "initWithFrame:", v20 + -85.0, 6.0, 36.0, 30.0);

  id v22 = (void *)MEMORY[0x263F827E8];
  id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v22 imageNamed:v7 inBundle:v23 compatibleWithTraitCollection:0];

  [v21 setImage:v24];
  [v21 setContentMode:1];
  [v11 addSubview:v21];

  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v7 = [v6 count];

  if (v7 == a4)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(AFUICreditCardViewController *)self creditCards];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];

    v11 = [v10 nickname];
    id v12 = [(AFUICreditCardViewController *)self cardIconNameForCreditCard:v10];
    id v8 = [(AFUICreditCardViewController *)self createSectionHeaderViewWithTitle:v11 iconName:v12];
  }

  return v8;
}

- (id)cardIconNameForCreditCard:(id)a3
{
  id v3 = [a3 type];
  if ([v3 isEqualToString:@"Visa"])
  {
    uint64_t v4 = @"CreditCardVisa";
  }
  else if ([v3 isEqualToString:@"Discover"])
  {
    uint64_t v4 = @"CreditCardDiscover";
  }
  else if ([v3 isEqualToString:@"American Express"])
  {
    uint64_t v4 = @"CreditCardAmex";
  }
  else if ([v3 isEqualToString:@"JCB"])
  {
    uint64_t v4 = @"CreditCardJCB";
  }
  else if ([v3 isEqualToString:@"Mastercard"])
  {
    uint64_t v4 = @"CreditCardMasterCard";
  }
  else
  {
    uint64_t v4 = @"CreditCardGeneric";
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v15 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x263F825C8];
    id v6 = v15;
    uint64_t v7 = [v5 labelColor];
    id v8 = [v6 textLabel];
    [v8 setTextColor:v7];

    id v9 = [MEMORY[0x263F82760] boldSystemFontOfSize:17.0];
    uint64_t v10 = [v6 textLabel];
    [v10 setFont:v9];

    v11 = [v6 textLabel];
    id v12 = [v11 text];

    id v13 = [v12 capitalizedString];
    double v14 = [v6 textLabel];

    [v14 setText:v13];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v6 = [v5 count];

  double result = 44.0;
  if (v6 == a4) {
    return 0.0;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [v12 section];
  uint64_t v6 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    id v8 = [(AFUICreditCardViewController *)self creditCards];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));

    switch([v12 row])
    {
      case 0:
        uint64_t v10 = [v9 name];
        goto LABEL_7;
      case 1:
        uint64_t v10 = [v9 number];
        goto LABEL_7;
      case 2:
        uint64_t v10 = [v9 expiration];
        goto LABEL_7;
      case 3:
        uint64_t v10 = [v9 securityCode];
LABEL_7:
        v11 = (void *)v10;
        [(AFUICreditCardViewController *)self handleTextInsertion:v10];

        break;
      default:
        break;
    }
  }
}

- (void)handleTextInsertion:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F63758];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v5 forKey:@"textToAssert"];
  uint64_t v7 = [v10 keyboardOutput];
  [v7 setCustomInfo:v6];

  id v8 = [(AFUICreditCardViewController *)self documentTraits];
  [v10 _assertOrInsertText:v5 documentTraits:v8];

  id v9 = [(AFUICreditCardViewController *)self performTextOperations];
  ((void (**)(void, id))v9)[2](v9, v10);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  objc_msgSend(a4, "section", a3);
  id v5 = [(AFUICreditCardViewController *)self creditCards];
  [v5 count];

  return 44.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(AFUICreditCardViewController *)self creditCards];
  int64_t v4 = [v3 count] + 1;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v6 = [v5 count];

  if (v6 == a4) {
    return 1;
  }
  else {
    return 4;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 section];
  id v9 = [(AFUICreditCardViewController *)self creditCards];
  uint64_t v10 = [v9 count];

  if (v8 == v10)
  {
    v11 = [v7 dequeueReusableCellWithIdentifier:@"ButtonCell"];

    if (v11) {
      goto LABEL_16;
    }
    v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"ButtonCell"];
    id v12 = [MEMORY[0x263F824E8] buttonWithType:1];
    [v12 setTitle:@"Manage Credit Cards..." forState:0];
    [v12 addTarget:self action:sel_manageCreditCardsButtonTapped_ forControlEvents:64];
    objc_msgSend(v12, "setFrame:", -405.0, 0.0, 1000.0, 44.0);
    id v13 = [v11 contentView];
    [v13 addSubview:v12];
  }
  else
  {
    v11 = [v7 dequeueReusableCellWithIdentifier:@"CreditCardCell"];

    if (!v11)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"CreditCardCell"];
      [v11 setSelectionStyle:0];
    }
    double v14 = [(AFUICreditCardViewController *)self creditCards];
    id v12 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    switch([v6 row])
    {
      case 0:
        id v15 = [v11 textLabel];
        [v15 setText:@"Name on Card"];

        uint64_t v16 = [v12 name];
        uint64_t v17 = [v16 uppercaseString];
        goto LABEL_9;
      case 1:
        id v18 = [v11 textLabel];
        [v18 setText:@"Card Number"];

        v19 = NSString;
        uint64_t v16 = [v12 suffix];
        uint64_t v17 = [v19 stringWithFormat:@"•••• •••• •••• %@", v16];
LABEL_9:
        double v20 = (void *)v17;
        unint64_t v21 = [v11 detailTextLabel];
        [v21 setText:v20];

        goto LABEL_11;
      case 2:
        id v22 = [v11 textLabel];
        [v22 setText:@"Expiration"];

        uint64_t v16 = [v12 expiration];
        double v20 = [v11 detailTextLabel];
        [v20 setText:v16];
LABEL_11:

        goto LABEL_13;
      case 3:
        id v23 = [v11 textLabel];
        [v23 setText:@"Security Code"];

        uint64_t v16 = [v11 detailTextLabel];
        [v16 setText:@"•••"];
LABEL_13:

        break;
      default:
        break;
    }
    v24 = [MEMORY[0x263F825C8] labelColor];
    objc_super v25 = [v11 textLabel];
    [v25 setTextColor:v24];

    id v13 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    v26 = [v11 detailTextLabel];
    [v26 setTextColor:v13];
  }
LABEL_16:

  return v11;
}

- (void)_openSettings
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)getSFSafariCreditCardStoreClass_softClass;
  uint64_t v8 = getSFSafariCreditCardStoreClass_softClass;
  if (!getSFSafariCreditCardStoreClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getSFSafariCreditCardStoreClass_block_invoke;
    v4[3] = &unk_265249370;
    v4[4] = &v5;
    __getSFSafariCreditCardStoreClass_block_invoke((uint64_t)v4);
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);
  [v3 showCreditCardSettings];
}

- (void)manageCreditCardsButtonTapped:(id)a3
{
  [(AFUICreditCardViewController *)self _openSettings];

  [(AFUICreditCardViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (UITableView)myTableView
{
  return self->_myTableView;
}

- (void)setMyTableView:(id)a3
{
}

- (UIButton)manageCreditCardsButton
{
  return self->_manageCreditCardsButton;
}

- (void)setManageCreditCardsButton:(id)a3
{
}

- (UILabel)selectedCellLabel
{
  return self->_selectedCellLabel;
}

- (void)setSelectedCellLabel:(id)a3
{
}

- (NSMutableArray)creditCards
{
  return self->_creditCards;
}

- (void)setCreditCards:(id)a3
{
}

- (AFCreditCard)creditCard
{
  return self->_creditCard;
}

- (void)setCreditCard:(id)a3
{
}

- (BOOL)hasSuggestions
{
  return self->_hasSuggestions;
}

- (void)setHasSuggestions:(BOOL)a3
{
  self->_hasSuggestions = a3;
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (id)performTextOperations
{
  return self->_performTextOperations;
}

- (void)setPerformTextOperations:(id)a3
{
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalUIDelegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setModalUIDelegate:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_modalUIDelegate);
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_creditCard, 0);
  objc_storeStrong((id *)&self->_creditCards, 0);
  objc_storeStrong((id *)&self->_selectedCellLabel, 0);
  objc_storeStrong((id *)&self->_manageCreditCardsButton, 0);
  objc_storeStrong((id *)&self->_myTableView, 0);
  objc_storeStrong(&self->_textOperationsHandler, 0);
  objc_storeStrong((id *)&self->_documentState, 0);

  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end