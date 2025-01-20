@interface HUFaceRecognitionAddPersonSearchBar
+ (BOOL)requiresConstraintBasedLayout;
- (HUFaceRecognitionAddPersonSearchBar)init;
- (NSArray)constraints;
- (UIImageView)faceCropView;
- (UITextField)searchTextField;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HUFaceRecognitionAddPersonSearchBar

- (HUFaceRecognitionAddPersonSearchBar)init
{
  v14.receiver = self;
  v14.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  v2 = [(HUFaceRecognitionAddPersonSearchBar *)&v14 init];
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    faceCropView = v2->_faceCropView;
    v2->_faceCropView = v3;

    [(UIImageView *)v2->_faceCropView setClipsToBounds:1];
    [(HUFaceRecognitionAddPersonSearchBar *)v2 addSubview:v2->_faceCropView];
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E4F42F10]);
    searchTextField = v2->_searchTextField;
    v2->_searchTextField = v5;

    [(UITextField *)v2->_searchTextField setAutocapitalizationType:1];
    [(UITextField *)v2->_searchTextField setAutocorrectionType:1];
    [(UITextField *)v2->_searchTextField setClearButtonMode:0];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextField *)v2->_searchTextField setFont:v7];

    v8 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonNameCellUnknownPerson", @"HUFaceRecognitionPersonNameCellUnknownPerson", 1);
    [(UITextField *)v2->_searchTextField setPlaceholder:v8];

    [(UITextField *)v2->_searchTextField setReturnKeyType:9];
    [(HUFaceRecognitionAddPersonSearchBar *)v2 addSubview:v2->_searchTextField];
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    separatorView = v2->_separatorView;
    v2->_separatorView = v9;

    v11 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v2->_separatorView setBackgroundColor:v11];

    [(HUFaceRecognitionAddPersonSearchBar *)v2 addSubview:v2->_separatorView];
    v12 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(HUFaceRecognitionAddPersonSearchBar *)v2 setBackgroundColor:v12];
  }
  return v2;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  [(HUFaceRecognitionAddPersonSearchBar *)&v16 layoutSubviews];
  v3 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
  [v3 bounds];
  double v5 = v4 * 0.5;
  v6 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
  v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  double v10 = 1.0 / v9;

  [(HUFaceRecognitionAddPersonSearchBar *)self bounds];
  double v12 = v11;
  double v14 = v13 - v10;
  v15 = [(HUFaceRecognitionAddPersonSearchBar *)self separatorView];
  objc_msgSend(v15, "setFrame:", 0.0, v14, v12, v10);
}

- (void)updateConstraints
{
  v53[9] = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  [(HUFaceRecognitionAddPersonSearchBar *)&v52 updateConstraints];
  v3 = [(HUFaceRecognitionAddPersonSearchBar *)self constraints];

  if (!v3)
  {
    double v4 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v5 = [(HUFaceRecognitionAddPersonSearchBar *)self searchTextField];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v51 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v49 = [v51 leadingAnchor];
    v50 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    v48 = [v50 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v53[0] = v47;
    v46 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v45 = [v46 heightAnchor];
    v44 = [v45 constraintEqualToConstant:44.0];
    v53[1] = v44;
    v43 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v41 = [v43 widthAnchor];
    v42 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v40 = [v42 heightAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v53[2] = v39;
    v38 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v36 = [v38 topAnchor];
    v37 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    v35 = [v37 topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v53[3] = v34;
    v33 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v31 = [v33 bottomAnchor];
    v32 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    v30 = [v32 bottomAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v53[4] = v29;
    v28 = [(HUFaceRecognitionAddPersonSearchBar *)self searchTextField];
    v26 = [v28 leadingAnchor];
    v27 = [(HUFaceRecognitionAddPersonSearchBar *)self faceCropView];
    v25 = [v27 trailingAnchor];
    v24 = [v26 constraintEqualToSystemSpacingAfterAnchor:v25 multiplier:1.0];
    v53[5] = v24;
    v23 = [(HUFaceRecognitionAddPersonSearchBar *)self searchTextField];
    v21 = [v23 trailingAnchor];
    v22 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    v20 = [v22 trailingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v53[6] = v19;
    v18 = [(HUFaceRecognitionAddPersonSearchBar *)self searchTextField];
    v17 = [v18 topAnchor];
    v6 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    v7 = [v6 topAnchor];
    v8 = [v17 constraintEqualToAnchor:v7];
    v53[7] = v8;
    double v9 = [(HUFaceRecognitionAddPersonSearchBar *)self searchTextField];
    double v10 = [v9 bottomAnchor];
    double v11 = [(HUFaceRecognitionAddPersonSearchBar *)self layoutMarginsGuide];
    double v12 = [v11 bottomAnchor];
    double v13 = [v10 constraintEqualToAnchor:v12];
    v53[8] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:9];
    [(HUFaceRecognitionAddPersonSearchBar *)self setConstraints:v14];

    v15 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v16 = [(HUFaceRecognitionAddPersonSearchBar *)self constraints];
    [v15 activateConstraints:v16];
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (UIImageView)faceCropView
{
  return self->_faceCropView;
}

- (UITextField)searchTextField
{
  return self->_searchTextField;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);

  objc_storeStrong((id *)&self->_faceCropView, 0);
}

@end