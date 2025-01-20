@interface CSAddressingViewController
- (CSAddressingViewController)initWithViewModel:(id)a3 userDidClickPrimaryButton:(id)a4 userDidClickSecondaryButton:(id)a5 userDidClickShowContactPicker:(id)a6 userDidChangeAddresses:(id)a7;
- (void)updateWithViewModel:(id)a3;
@end

@implementation CSAddressingViewController

- (CSAddressingViewController)initWithViewModel:(id)a3 userDidClickPrimaryButton:(id)a4 userDidClickSecondaryButton:(id)a5 userDidClickShowContactPicker:(id)a6 userDidChangeAddresses:(id)a7
{
  v61[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v60.receiver = self;
  v60.super_class = (Class)CSAddressingViewController;
  v17 = [(CSAddressingViewController *)&v60 initWithNibName:0 bundle:0];
  if (v17)
  {
    id v59 = v13;
    v18 = [_TtC14CloudSharingUI21AddressingViewFactory alloc];
    [v12 headerImageData];
    v19 = id v56 = v16;
    [v12 headerTitle];
    v20 = id v57 = v15;
    [v12 loadingText];
    v21 = id v58 = v14;
    v22 = [v12 supplementaryText];
    v23 = [v12 userInfoText];
    v24 = [v12 primaryButtonText];
    v25 = [v12 secondaryButtonText];
    uint64_t v26 = [(AddressingViewFactory *)v18 initWithHeaderImageData:v19 headerTitle:v20 loadingText:v21 supplementaryText:v22 userInfoText:v23 primaryButtonText:v24 secondaryButtonText:v25 userDidClickPrimaryButton:v59 userDidClickSecondaryButton:v58 userDidClickShowContactPicker:v57 userDidChangeAddresses:v56];
    id v55 = v12;
    addressingViewFactory = v17->_addressingViewFactory;
    v17->_addressingViewFactory = (_TtC14CloudSharingUI21AddressingViewFactory *)v26;

    v28 = [(AddressingViewFactory *)v17->_addressingViewFactory viewController];
    [(CSAddressingViewController *)v17 addChildViewController:v28];
    v29 = [v28 view];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v30 = [(CSAddressingViewController *)v17 view];
    v31 = [v28 view];
    [v30 addSubview:v31];

    v45 = (void *)MEMORY[0x263F08938];
    v54 = [(CSAddressingViewController *)v17 view];
    v52 = [v54 widthAnchor];
    v53 = [v28 view];
    v51 = [v53 widthAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v61[0] = v50;
    v49 = [(CSAddressingViewController *)v17 view];
    v47 = [v49 heightAnchor];
    v48 = [v28 view];
    v46 = [v48 heightAnchor];
    v44 = [v47 constraintEqualToAnchor:v46];
    v61[1] = v44;
    v43 = [(CSAddressingViewController *)v17 view];
    v41 = [v43 leftAnchor];
    v42 = [v28 view];
    v32 = [v42 leftAnchor];
    v33 = [v41 constraintEqualToAnchor:v32];
    v61[2] = v33;
    v34 = [(CSAddressingViewController *)v17 view];
    v35 = [v34 topAnchor];
    v36 = [v28 view];
    v37 = [v36 topAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    v61[3] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
    [v45 activateConstraints:v39];

    id v14 = v58;
    id v15 = v57;

    id v12 = v55;
    id v16 = v56;

    id v13 = v59;
  }

  return v17;
}

- (void)updateWithViewModel:(id)a3
{
  addressingViewFactory = self->_addressingViewFactory;
  id v4 = a3;
  id v11 = [v4 headerImageData];
  v5 = [v4 headerTitle];
  v6 = [v4 loadingText];
  v7 = [v4 supplementaryText];
  v8 = [v4 userInfoText];
  v9 = [v4 primaryButtonText];
  v10 = [v4 secondaryButtonText];

  [(AddressingViewFactory *)addressingViewFactory updateWithHeaderImageData:v11 headerTitle:v5 loadingText:v6 supplementaryText:v7 userInfoText:v8 primaryButtonText:v9 secondaryButtonText:v10];
}

- (void).cxx_destruct
{
}

@end