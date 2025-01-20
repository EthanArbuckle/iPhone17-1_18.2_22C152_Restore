@interface PHCarPlayDialerView
- (PHCarPlayDialerView)initWithFrame:(CGRect)a3;
- (id)_linearFocusMovementSequences;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation PHCarPlayDialerView

- (PHCarPlayDialerView)initWithFrame:(CGRect)a3
{
  v110.receiver = self;
  v110.super_class = (Class)PHCarPlayDialerView;
  v3 = -[PHCarPlayDialerView initWithFrame:](&v110, "initWithFrame:", 0.0, 0.0, 360.0, 180.0);
  if (v3)
  {
    v4 = +[UIColor tableBackgroundColor];
    [(PHCarPlayDialerView *)v3 setBackgroundColor:v4];

    v5 = [PHCarPlayDialerLCDView alloc];
    [(PHCarPlayDialerView *)v3 bounds];
    v6 = -[PHCarPlayDialerLCDView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
    [(PHAbstractDialerView *)v3 setLcdView:v6];

    v7 = [(PHAbstractDialerView *)v3 lcdView];
    [v7 setDelegate:v3];

    v8 = [(PHAbstractDialerView *)v3 lcdView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [PHCarPlayNumberPad alloc];
    v10 = [(PHCarPlayDialerView *)v3 traitCollection];
    v11 = -[PHCarPlayNumberPad initWithUserInterfaceStyle:](v9, "initWithUserInterfaceStyle:", [v10 userInterfaceStyle]);
    [(PHAbstractDialerView *)v3 setPhonePadView:v11];

    v12 = [(PHAbstractDialerView *)v3 phonePadView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = +[UIColor clearColor];
    v14 = [(PHAbstractDialerView *)v3 phonePadView];
    [v14 setBackgroundColor:v13];

    v15 = [(PHAbstractDialerView *)v3 phonePadView];
    [v15 setOpaque:0];

    id v16 = objc_alloc_init((Class)UIView);
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(PHAbstractDialerView *)v3 lcdView];
    [v16 addSubview:v17];

    v18 = [(PHAbstractDialerView *)v3 phonePadView];
    [v16 addSubview:v18];

    [(PHCarPlayDialerView *)v3 addSubview:v16];
    v19 = objc_alloc_init(PHCarPlayDialerCircleButton);
    [(PHCarPlayDialerCircleButton *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = +[UIColor tableBackgroundColor];
    [(PHCarPlayDialerCircleButton *)v19 setTitleColor:v20 forState:0];

    LODWORD(v21) = 1148846080;
    [(PHCarPlayDialerCircleButton *)v19 setContentCompressionResistancePriority:0 forAxis:v21];
    v22 = +[UIImage tpImageForSymbolType:1 textStyle:UIFontTextStyleCallout scale:3 isStaticSize:1];
    [(PHCarPlayDialerCircleButton *)v19 setImage:v22 forState:0];

    v23 = +[UIColor whiteColor];
    [(PHCarPlayDialerCircleButton *)v19 setTintColor:v23];

    [(PHAbstractDialerView *)v3 setCallButton:v19];
    v24 = [(PHAbstractDialerView *)v3 callButton];
    [v16 addSubview:v24];

    v25 = +[UIImage tpImageForSymbolType:23 textStyle:UIFontTextStyleCallout scale:3 isStaticSize:1];
    v26 = +[UIButton systemButtonWithImage:v25 target:0 action:0];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v26 sizeToFit];
    v27 = +[UIColor dynamicCarTertiaryColor];
    [v26 setTintColor:v27];

    [(PHAbstractDialerView *)v3 setDeleteButton:v26];
    v28 = [(PHAbstractDialerView *)v3 deleteButton];
    [v16 addSubview:v28];

    v29 = +[NSLayoutConstraint constraintWithItem:v16 attribute:7 relatedBy:-1 toItem:v3 attribute:7 multiplier:1.0 constant:0.0];
    [(PHCarPlayDialerView *)v3 addConstraint:v29];

    v30 = +[NSLayoutConstraint constraintWithItem:v16 attribute:8 relatedBy:-1 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
    [(PHCarPlayDialerView *)v3 addConstraint:v30];

    v31 = +[NSLayoutConstraint constraintWithItem:v16 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    [(PHCarPlayDialerView *)v3 addConstraint:v31];

    v32 = +[NSLayoutConstraint constraintWithItem:v16 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [(PHCarPlayDialerView *)v3 addConstraint:v32];

    LODWORD(v33) = 1148846080;
    v34 = +[NSLayoutConstraint constraintWithItem:v16 attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:356.0 priority:v33];
    [(PHCarPlayDialerView *)v3 addConstraint:v34];

    LODWORD(v35) = 1144750080;
    v36 = +[NSLayoutConstraint constraintWithItem:v16 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:196.0 priority:v35];
    [(PHCarPlayDialerView *)v3 addConstraint:v36];

    v37 = [(PHAbstractDialerView *)v3 phonePadView];
    v38 = +[NSLayoutConstraint constraintWithItem:v37 attribute:1 relatedBy:0 toItem:v16 attribute:1 multiplier:1.0 constant:12.0];
    [v16 addConstraint:v38];

    v39 = [(PHAbstractDialerView *)v3 phonePadView];
    v40 = +[NSLayoutConstraint constraintWithItem:v39 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
    [v16 addConstraint:v40];

    v41 = [(PHAbstractDialerView *)v3 lcdView];
    v42 = [(PHAbstractDialerView *)v3 phonePadView];
    v43 = +[NSLayoutConstraint constraintWithItem:v41 attribute:1 relatedBy:0 toItem:v42 attribute:2 multiplier:1.0 constant:23.0];
    [v16 addConstraint:v43];

    v44 = [(PHAbstractDialerView *)v3 lcdView];
    v45 = +[NSLayoutConstraint constraintWithItem:v44 attribute:11 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:79.5];
    [v16 addConstraint:v45];

    v46 = [(PHAbstractDialerView *)v3 lcdView];
    v47 = +[NSLayoutConstraint constraintWithItem:v46 attribute:2 relatedBy:0 toItem:v16 attribute:2 multiplier:1.0 constant:-12.0];
    [v16 addConstraint:v47];

    v48 = [(PHAbstractDialerView *)v3 deleteButton];
    v49 = [(PHAbstractDialerView *)v3 callButton];
    v50 = +[NSLayoutConstraint constraintWithItem:v48 attribute:1 relatedBy:1 toItem:v49 attribute:2 multiplier:1.0 constant:8.0];
    [v16 addConstraint:v50];

    v51 = [(PHAbstractDialerView *)v3 deleteButton];
    v52 = +[NSLayoutConstraint constraintWithItem:v51 attribute:2 relatedBy:0 toItem:v16 attribute:2 multiplier:1.0 constant:-12.0];
    [v16 addConstraint:v52];

    v53 = [(PHAbstractDialerView *)v3 deleteButton];
    v54 = [(PHAbstractDialerView *)v3 callButton];
    v55 = +[NSLayoutConstraint constraintWithItem:v53 attribute:10 relatedBy:0 toItem:v54 attribute:10 multiplier:1.0 constant:0.0];
    [v16 addConstraint:v55];

    v56 = [(PHAbstractDialerView *)v3 callButton];
    v57 = +[NSLayoutConstraint constraintWithItem:v56 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:52.0];
    [v16 addConstraint:v57];

    v58 = [(PHAbstractDialerView *)v3 callButton];
    v59 = [(PHAbstractDialerView *)v3 callButton];
    v60 = +[NSLayoutConstraint constraintWithItem:v58 attribute:7 relatedBy:0 toItem:v59 attribute:8 multiplier:1.0 constant:0.0];
    [v16 addConstraint:v60];

    v61 = [(PHAbstractDialerView *)v3 callButton];
    v62 = [(PHAbstractDialerView *)v3 lcdView];
    LODWORD(v63) = 1144750080;
    v64 = +[NSLayoutConstraint constraintWithItem:v61 attribute:3 relatedBy:0 toItem:v62 attribute:11 multiplier:1.0 constant:56.0 priority:v63];
    [v16 addConstraint:v64];

    v65 = [(PHAbstractDialerView *)v3 callButton];
    v66 = +[NSLayoutConstraint constraintWithItem:v65 attribute:4 relatedBy:-1 toItem:v16 attribute:4 multiplier:1.0 constant:-8.0];
    [v16 addConstraint:v66];

    v67 = [(PHAbstractDialerView *)v3 callButton];
    v68 = [(PHAbstractDialerView *)v3 lcdView];
    v69 = +[NSLayoutConstraint constraintWithItem:v67 attribute:9 relatedBy:0 toItem:v68 attribute:9 multiplier:1.0 constant:0.0];
    [v16 addConstraint:v69];

    v70 = [(PHAbstractDialerView *)v3 phonePadView];
    LODWORD(v71) = 1148846080;
    [v70 setContentCompressionResistancePriority:0 forAxis:v71];

    v72 = [(PHAbstractDialerView *)v3 phonePadView];
    LODWORD(v73) = 1148846080;
    [v72 setContentHuggingPriority:0 forAxis:v73];

    v74 = [(PHAbstractDialerView *)v3 lcdView];
    LODWORD(v75) = 1132068864;
    [v74 setContentCompressionResistancePriority:0 forAxis:v75];

    v76 = [(PHAbstractDialerView *)v3 deleteButton];
    LODWORD(v77) = 1148846080;
    [v76 setContentCompressionResistancePriority:0 forAxis:v77];

    id v78 = objc_alloc_init((Class)UIFocusContainerGuide);
    [(PHCarPlayDialerView *)v3 addLayoutGuide:v78];
    v79 = [v78 topAnchor];
    v80 = [(PHAbstractDialerView *)v3 callButton];
    v81 = [v80 topAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    [(PHCarPlayDialerView *)v3 addConstraint:v82];

    v83 = [v78 leftAnchor];
    v84 = [(PHAbstractDialerView *)v3 phonePadView];
    v85 = [v84 rightAnchor];
    v86 = [v83 constraintEqualToAnchor:v85];
    [(PHCarPlayDialerView *)v3 addConstraint:v86];

    v87 = [v78 rightAnchor];
    v88 = [(PHCarPlayDialerView *)v3 rightAnchor];
    v89 = [v87 constraintEqualToAnchor:v88];
    [(PHCarPlayDialerView *)v3 addConstraint:v89];

    v90 = [v78 bottomAnchor];
    v91 = [(PHCarPlayDialerView *)v3 bottomAnchor];
    v92 = [v90 constraintEqualToAnchor:v91];
    [(PHCarPlayDialerView *)v3 addConstraint:v92];

    id v93 = objc_alloc_init((Class)UIFocusContainerGuide);
    [(PHCarPlayDialerView *)v3 addLayoutGuide:v93];
    v94 = [v93 topAnchor];
    v95 = [(PHCarPlayDialerView *)v3 topAnchor];
    v96 = [v94 constraintEqualToAnchor:v95];
    [(PHCarPlayDialerView *)v3 addConstraint:v96];

    v97 = [v93 leftAnchor];
    v98 = [(PHAbstractDialerView *)v3 deleteButton];
    v99 = [v98 leftAnchor];
    v100 = [v97 constraintEqualToAnchor:v99];
    [(PHCarPlayDialerView *)v3 addConstraint:v100];

    v101 = [v93 rightAnchor];
    v102 = [(PHAbstractDialerView *)v3 deleteButton];
    v103 = [v102 rightAnchor];
    v104 = [v101 constraintEqualToAnchor:v103];
    [(PHCarPlayDialerView *)v3 addConstraint:v104];

    v105 = [v93 bottomAnchor];
    v106 = [(PHCarPlayDialerView *)v3 bottomAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    [(PHCarPlayDialerView *)v3 addConstraint:v107];

    v108 = [(PHAbstractDialerView *)v3 phonePadView];
    [v108 _setSpeedBumpEdges:15];
  }
  return v3;
}

- (id)_linearFocusMovementSequences
{
  v3 = [(PHAbstractDialerView *)self phonePadView];
  v4 = [v3 _linearFocusMovementSequences];

  v5 = [v4 firstObject];
  v6 = [v5 items];
  v7 = [(PHAbstractDialerView *)self callButton];
  v15[0] = v7;
  v8 = [(PHAbstractDialerView *)self deleteButton];
  v15[1] = v8;
  v9 = +[NSArray arrayWithObjects:v15 count:2];
  v10 = [v6 arrayByAddingObjectsFromArray:v9];

  v11 = +[_UIFocusLinearMovementSequence sequenceWithItems:v10 loops:0];
  v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];

  return v12;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PHCarPlayDialerView;
  id v6 = a3;
  [(PHCarPlayDialerView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 nextFocusedItem];

  v8 = [(PHAbstractDialerView *)self deleteButton];
  if (v7 == v8) {
    +[UIColor dynamicCarFocusedColor];
  }
  else {
  v9 = +[UIColor dynamicCarTertiaryColor];
  }
  v10 = [(PHAbstractDialerView *)self deleteButton];
  [v10 setTintColor:v9];
}

@end