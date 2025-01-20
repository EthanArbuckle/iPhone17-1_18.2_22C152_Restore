@interface BCBrandedHeaderViewController
- (BCBrandedHeaderViewController)initWithBusinessItem:(id)a3;
- (BCBrandedHeaderViewControllerDelegate)delegate;
- (BCSBusinessItem)businessItem;
- (BOOL)_canShowWhileLocked;
- (UIImageView)logoImageView;
- (void)_fetchLogo;
- (void)setDelegate:(id)a3;
- (void)setLogoImageView:(id)a3;
- (void)viewDidLoad;
@end

@implementation BCBrandedHeaderViewController

- (BCBrandedHeaderViewController)initWithBusinessItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCBrandedHeaderViewController;
  v6 = [(BCBrandedHeaderViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_businessItem, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v125[6] = *MEMORY[0x263EF8340];
  v119.receiver = self;
  v119.super_class = (Class)BCBrandedHeaderViewController;
  [(BCBrandedHeaderViewController *)&v119 viewDidLoad];
  v3 = [(BCBrandedHeaderViewController *)self view];
  id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setAccessibilityIgnoresInvertColors:1];
  [v3 addSubview:v4];
  v109 = v4;
  [(BCBrandedHeaderViewController *)self setLogoImageView:v4];
  id v5 = objc_alloc_init(MEMORY[0x263F1C778]);
  [v3 addLayoutGuide:v5];
  id v6 = objc_alloc_init(MEMORY[0x263F1C768]);
  v7 = [(BCBrandedHeaderViewController *)self businessItem];
  v8 = [v7 name];
  [v6 setText:v8];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F1C768]);
  v10 = [(BCBrandedHeaderViewController *)self businessItem];
  LODWORD(v8) = [v10 isVerified];

  if (v8)
  {
    v11 = +[BCShared classBundle]();
    v12 = [v11 localizedStringForKey:@"VERIFIED" value:&stru_26DD2B2A8 table:0];
    [v9 setText:v12];
  }
  v117 = v5;
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v9];
  id v13 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v105 = self;
  v14 = [(BCBrandedHeaderViewController *)self businessItem];
  objc_msgSend(v13, "setHidden:", objc_msgSend(v14, "isVerified") ^ 1);

  [v3 addSubview:v13];
  v15 = [MEMORY[0x263F1C658] boldSystemFontOfSize:20.0];
  v16 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D298]];
  v17 = [v16 scaledFontForFont:v15];
  [v6 setFont:v17];

  [v6 setAdjustsFontForContentSizeCategory:1];
  v18 = [MEMORY[0x263F1C550] labelColor];
  [v6 setTextColor:v18];

  [v6 setNumberOfLines:4];
  [v6 setLineBreakMode:4];
  LODWORD(v19) = *(_DWORD *)"";
  [v6 setContentCompressionResistancePriority:0 forAxis:v19];
  LODWORD(v20) = *(_DWORD *)"";
  [v6 setContentCompressionResistancePriority:1 forAxis:v20];
  LODWORD(v21) = 1148829696;
  [v6 setContentHuggingPriority:0 forAxis:v21];
  v108 = v6;
  LODWORD(v22) = 1148829696;
  [v6 setContentHuggingPriority:1 forAxis:v22];
  uint64_t v23 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];

  if (v9)
  {
    v24 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D270]];
    v25 = [v24 scaledFontForFont:v23];
    [v9 setFont:v25];

    [v9 setAdjustsFontForContentSizeCategory:1];
    v26 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [v9 setTextColor:v26];

    [v9 setNumberOfLines:1];
    [v9 setLineBreakMode:4];
    LODWORD(v27) = 1148829696;
    [v9 setContentCompressionResistancePriority:0 forAxis:v27];
    LODWORD(v28) = 1148829696;
    [v9 setContentCompressionResistancePriority:1 forAxis:v28];
    LODWORD(v29) = 1148829696;
    [v9 setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1148829696;
    [v9 setContentHuggingPriority:1 forAxis:v30];
    v31 = (void *)MEMORY[0x263F1C6C8];
    v32 = [v9 font];
    v33 = [v31 configurationWithFont:v32 scale:1];

    v34 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.seal.fill" withConfiguration:v33];
    v35 = [v34 imageWithRenderingMode:2];

    [v13 setImage:v35];
  }
  v104 = (void *)v23;
  v116 = v9;
  v36 = [v109 layer];
  [v36 setCornerRadius:3.0];

  v37 = [v109 layer];
  [v37 setMasksToBounds:1];

  v38 = [v9 textColor];
  [v13 setTintColor:v38];

  v118 = objc_opt_new();
  v113 = [v109 leadingAnchor];
  v110 = [v3 leadingAnchor];
  v106 = [v113 constraintEqualToAnchor:v110];
  v125[0] = v106;
  v100 = [v109 centerYAnchor];
  v98 = [v3 centerYAnchor];
  v96 = [v100 constraintEqualToAnchor:v98];
  v125[1] = v96;
  v94 = [v109 topAnchor];
  v92 = [v3 topAnchor];
  v90 = [v94 constraintGreaterThanOrEqualToAnchor:v92];
  v125[2] = v90;
  v39 = [v109 bottomAnchor];
  v40 = [v3 bottomAnchor];
  [v39 constraintLessThanOrEqualToAnchor:v40];
  v41 = v103 = v13;
  v125[3] = v41;
  v42 = [v109 widthAnchor];
  v43 = [v42 constraintEqualToConstant:45.0];
  v125[4] = v43;
  v44 = [v109 heightAnchor];
  v45 = [v44 constraintEqualToConstant:45.0];
  v125[5] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:6];
  [v118 addObjectsFromArray:v46];

  v114 = [v117 leadingAnchor];
  v111 = [v109 trailingAnchor];
  v101 = [v114 constraintEqualToAnchor:v111 constant:16.0];
  v124[0] = v101;
  v99 = [v117 trailingAnchor];
  v97 = [v3 trailingAnchor];
  v95 = [v99 constraintEqualToAnchor:v97];
  v124[1] = v95;
  v93 = [v117 centerYAnchor];
  v91 = [v3 centerYAnchor];
  v47 = [v93 constraintEqualToAnchor:v91];
  v124[2] = v47;
  v48 = [v117 topAnchor];
  v49 = [v3 topAnchor];
  v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49];
  v124[3] = v50;
  v51 = [v117 bottomAnchor];
  v107 = v3;
  v52 = [v3 bottomAnchor];
  v53 = [v51 constraintLessThanOrEqualToAnchor:v52];
  v124[4] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v124 count:5];
  [v118 addObjectsFromArray:v54];

  v55 = [v108 leadingAnchor];
  v112 = [v117 leadingAnchor];
  v115 = v55;
  uint64_t v56 = [v55 constraintEqualToAnchor:v112];
  v57 = (void *)v56;
  if (v116)
  {
    v123[0] = v56;
    v58 = [v108 trailingAnchor];
    v59 = [v117 trailingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v123[1] = v60;
    v61 = [v108 topAnchor];
    v62 = [v117 topAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    v123[2] = v63;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v123 count:3];
    [v118 addObjectsFromArray:v64];

    v65 = [v116 leadingAnchor];
    v66 = [v117 leadingAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v122[0] = v67;
    v68 = [v116 topAnchor];
    v69 = [v108 bottomAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:0.0];
    v122[1] = v70;
    v71 = [v116 bottomAnchor];
    v72 = [v117 bottomAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    v122[2] = v73;
    v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:3];
    [v118 addObjectsFromArray:v74];

    v75 = v116;
    v76 = v117;

    v77 = v103;
    v78 = [v103 leadingAnchor];
    v112 = [v116 trailingAnchor];
    v115 = v78;
    v57 = [v78 constraintEqualToAnchor:v112 constant:4.0];
    v121[0] = v57;
    v79 = [v103 trailingAnchor];
    v80 = [v117 trailingAnchor];
    v102 = v79;
    v81 = [v79 constraintLessThanOrEqualToAnchor:v80 constant:4.0];
    v121[1] = v81;
    v82 = [v103 centerYAnchor];
    v83 = [v116 centerYAnchor];
    v84 = [v82 constraintEqualToAnchor:v83];
    v121[2] = v84;
    v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:3];
    [v118 addObjectsFromArray:v85];
  }
  else
  {
    v120[0] = v56;
    v86 = [v108 trailingAnchor];
    v80 = [v117 trailingAnchor];
    v102 = v86;
    v81 = [v86 constraintEqualToAnchor:v80];
    v120[1] = v81;
    v82 = [v108 topAnchor];
    v83 = [v117 topAnchor];
    v84 = [v82 constraintEqualToAnchor:v83];
    v120[2] = v84;
    v85 = [v108 bottomAnchor];
    v87 = [v117 bottomAnchor];
    v88 = [v85 constraintEqualToAnchor:v87];
    v120[3] = v88;
    v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:4];
    [v118 addObjectsFromArray:v89];

    v76 = v117;
    v75 = 0;
    v77 = v103;
  }

  [MEMORY[0x263F08938] activateConstraints:v118];
  [(BCBrandedHeaderViewController *)v105 _fetchLogo];
}

- (void)_fetchLogo
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[BCBrandedHeaderViewController _fetchLogo]";
    _os_log_impl(&dword_228C26000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = [(BCBrandedHeaderViewController *)self delegate];
  objc_initWeak((id *)buf, v4);

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(BCBrandedHeaderViewController *)self businessItem];
    [WeakRetained brandedHeaderViewController:self logoFetchingWillBeginForBusinessItem:v6];
  }
  CFTimeInterval v7 = CACurrentMediaTime();
  id v8 = objc_alloc_init(MEMORY[0x263F2BD28]);
  id v9 = [(BCBrandedHeaderViewController *)self businessItem];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__BCBrandedHeaderViewController__fetchLogo__block_invoke;
  v10[3] = &unk_264851F40;
  objc_copyWeak(&v11, &location);
  v12[1] = *(id *)&v7;
  objc_copyWeak(v12, (id *)buf);
  v10[4] = self;
  [v8 fetchSquareIconDataForBusinessItem:v9 completion:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __43__BCBrandedHeaderViewController__fetchLogo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[BCBrandedHeaderViewController _fetchLogo]_block_invoke";
    __int16 v13 = 2048;
    uint64_t v14 = [v3 length];
    _os_log_impl(&dword_228C26000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched image length %ld", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BCBrandedHeaderViewController__fetchLogo__block_invoke_23;
  block[3] = &unk_264851F18;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v3;
  v10[1] = *(id *)(a1 + 56);
  id v5 = v3;
  objc_copyWeak(v10, (id *)(a1 + 48));
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v10);

  objc_destroyWeak(&v9);
}

void __43__BCBrandedHeaderViewController__fetchLogo__block_invoke_23(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3)
  {
    id v4 = [MEMORY[0x263F1C6B0] imageWithData:*(void *)(a1 + 32)];
    id v5 = [WeakRetained logoImageView];
    [v5 setImage:v4];

    uint64_t v6 = (uint64_t)(CACurrentMediaTime() + *(double *)(a1 + 64) * -1000.0);
    id v7 = [WeakRetained businessItem];
    uint64_t v8 = [v7 bizID];
    id v9 = [WeakRetained businessItem];
    v10 = [v9 messageSubtitle];
    +[BCLogger logEventWithName:@"com.apple.BusinessChatViewService.LogoAppears" businessURI:v8 callToActionText:v10 bizItemReturnedAfterAction:0 latency:v6];
  }
  else
  {
    id v11 = LogCategory_Daemon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[BCBrandedHeaderViewController _fetchLogo]_block_invoke";
      _os_log_impl(&dword_228C26000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch valid image", (uint8_t *)&v15, 0xCu);
    }
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_opt_respondsToSelector())
  {
    __int16 v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v13 businessItem];
    [v12 brandedHeaderViewController:v13 logoFetchingDidFinishForBusinessItem:v14 success:v3 != 0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BCBrandedHeaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCBrandedHeaderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (UIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end