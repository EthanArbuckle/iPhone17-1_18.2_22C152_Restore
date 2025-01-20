@interface MFHyperlinkEditorViewController
- (BOOL)shouldShowCloseButton;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)preferredContentSize;
- (MFHyperlinkEditorViewController)initWithTitle:(id)a3 text:(id)a4 mode:(unint64_t)a5 shouldShowCloseButton:(BOOL)a6 completion:(id)a7;
- (UIButton)linkEditorCancelButton;
- (UILabel)linkEditorTitle;
- (UITextField)linkEditorTextField;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)completion;
- (unint64_t)mode;
- (void)dismissLinkEditor;
- (void)loadView;
- (void)setCompletion:(id)a3;
- (void)setLinkEditorCancelButton:(id)a3;
- (void)setLinkEditorTextField:(id)a3;
- (void)setLinkEditorTitle:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setShouldShowCloseButton:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MFHyperlinkEditorViewController

- (MFHyperlinkEditorViewController)initWithTitle:(id)a3 text:(id)a4 mode:(unint64_t)a5 shouldShowCloseButton:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MFHyperlinkEditorViewController;
  v15 = [(MFHyperlinkEditorViewController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v17 = [(MFHyperlinkEditorViewController *)v15 linkEditorTitle];
    [v17 setText:v12];

    v18 = [(MFHyperlinkEditorViewController *)v16 linkEditorTextField];
    [v18 setText:v13];

    [(MFHyperlinkEditorViewController *)v16 setMode:a5];
    [(MFHyperlinkEditorViewController *)v16 setShouldShowCloseButton:v8];
    [(MFHyperlinkEditorViewController *)v16 setCompletion:v14];
  }

  return v16;
}

- (CGSize)preferredContentSize
{
  v2 = [(MFHyperlinkEditorViewController *)self view];
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFHyperlinkEditorViewController;
  [(MFHyperlinkEditorViewController *)&v5 viewWillAppear:a3];
  double v4 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v4 setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFHyperlinkEditorViewController;
  [(MFHyperlinkEditorViewController *)&v5 viewDidAppear:a3];
  double v4 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v4 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFHyperlinkEditorViewController;
  [(MFHyperlinkEditorViewController *)&v7 viewWillDisappear:a3];
  double v4 = [(MFHyperlinkEditorViewController *)self completion];
  objc_super v5 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  double v6 = [v5 text];
  ((void (**)(void, void *))v4)[2](v4, v6);
}

- (void)dismissLinkEditor
{
  double v3 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v3 resignFirstResponder];

  [(MFHyperlinkEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (UILabel)linkEditorTitle
{
  linkEditorTitle = self->_linkEditorTitle;
  if (!linkEditorTitle)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    objc_super v5 = self->_linkEditorTitle;
    self->_linkEditorTitle = v4;

    linkEditorTitle = self->_linkEditorTitle;
  }

  return linkEditorTitle;
}

- (UITextField)linkEditorTextField
{
  linkEditorTextField = self->_linkEditorTextField;
  if (!linkEditorTextField)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1D70]);
    objc_super v5 = (UITextField *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_linkEditorTextField;
    self->_linkEditorTextField = v5;

    linkEditorTextField = self->_linkEditorTextField;
  }

  return linkEditorTextField;
}

- (void)loadView
{
  v87[3] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)MFHyperlinkEditorViewController;
  [(MFHyperlinkEditorViewController *)&v86 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v85 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v85 setBackgroundColor:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v5 setSpacing:8.0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAlignment:3];
  [v85 addSubview:v5];
  double v6 = [(MFHyperlinkEditorViewController *)self linkEditorTitle];
  [v6 setTextAlignment:1];

  objc_super v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  double v8 = [(MFHyperlinkEditorViewController *)self linkEditorTitle];
  [v8 setFont:v7];

  if ([(MFHyperlinkEditorViewController *)self shouldShowCloseButton])
  {
    v9 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
    [(MFHyperlinkEditorViewController *)self setLinkEditorCancelButton:v9];

    v10 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    [v10 addTarget:self action:sel_dismissLinkEditor forControlEvents:64];

    v11 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    LODWORD(v12) = 1148846080;
    [v11 setContentCompressionResistancePriority:0 forAxis:v12];

    id v13 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    LODWORD(v14) = 1148846080;
    [v13 setContentCompressionResistancePriority:1 forAxis:v14];

    v15 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    LODWORD(v16) = 1148846080;
    [v15 setContentHuggingPriority:0 forAxis:v16];

    v17 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    LODWORD(v18) = 1148846080;
    [v17 setContentHuggingPriority:1 forAxis:v18];

    id v19 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    objc_super v20 = [MEMORY[0x1E4FB1618] clearColor];
    [v19 setBackgroundColor:v20];

    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v87[0] = v19;
    v21 = [(MFHyperlinkEditorViewController *)self linkEditorTitle];
    v87[1] = v21;
    v22 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    v87[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
    objc_msgSend(v5, "mf_addArrangedSubviews:", v23);

    v24 = v19;
  }
  else
  {
    v21 = [(MFHyperlinkEditorViewController *)self linkEditorTitle];
    [v5 addArrangedSubview:v21];
    v24 = 0;
  }

  v25 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v25 setBorderStyle:3];

  v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v27 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v27 setFont:v26];

  unint64_t v28 = [(MFHyperlinkEditorViewController *)self mode];
  if (v28)
  {
    if (v28 != 1) {
      goto LABEL_9;
    }
    v29 = _EFLocalizedString();
    v30 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
    [v30 setPlaceholder:v29];
  }
  else
  {
    v31 = _EFLocalizedString();
    v32 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
    [v32 setPlaceholder:v31];

    v33 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
    [v33 setKeyboardType:3];

    v29 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
    [v29 setAutocapitalizationType:0];
  }

LABEL_9:
  v34 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  LODWORD(v35) = 1148846080;
  [v34 setContentCompressionResistancePriority:1 forAxis:v35];

  v36 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  LODWORD(v37) = 1148846080;
  [v36 setContentCompressionResistancePriority:0 forAxis:v37];

  v38 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  LODWORD(v39) = 1148846080;
  [v38 setContentHuggingPriority:1 forAxis:v39];

  v40 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  [v85 addSubview:v41];

  [(MFHyperlinkEditorViewController *)self setView:v85];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v43 = [v5 topAnchor];
  v44 = [(MFHyperlinkEditorViewController *)self view];
  v45 = [v44 topAnchor];
  v46 = [v43 constraintEqualToAnchor:v45 constant:16.0];
  [v42 addObject:v46];

  v47 = [v5 leadingAnchor];
  v48 = [(MFHyperlinkEditorViewController *)self view];
  v49 = [v48 layoutMarginsGuide];
  v50 = [v49 leadingAnchor];
  v51 = [v47 constraintEqualToAnchor:v50];
  [v42 addObject:v51];

  v52 = [v5 trailingAnchor];
  v53 = [(MFHyperlinkEditorViewController *)self view];
  v54 = [v53 layoutMarginsGuide];
  v55 = [v54 trailingAnchor];
  v56 = [v52 constraintEqualToAnchor:v55];
  [v42 addObject:v56];

  v57 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  v58 = [v57 topAnchor];
  v59 = [v5 bottomAnchor];
  v60 = [v58 constraintEqualToAnchor:v59 constant:12.0];
  [v42 addObject:v60];

  v61 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  v62 = [v61 leadingAnchor];
  v63 = [(MFHyperlinkEditorViewController *)self view];
  v64 = [v63 layoutMarginsGuide];
  v65 = [v64 leadingAnchor];
  v66 = [v62 constraintEqualToAnchor:v65];
  [v42 addObject:v66];

  v67 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  v68 = [v67 trailingAnchor];
  v69 = [(MFHyperlinkEditorViewController *)self view];
  v70 = [v69 layoutMarginsGuide];
  v71 = [v70 trailingAnchor];
  v72 = [v68 constraintEqualToAnchor:v71];
  [v42 addObject:v72];

  v73 = [(MFHyperlinkEditorViewController *)self linkEditorTextField];
  v74 = [v73 bottomAnchor];
  v75 = [(MFHyperlinkEditorViewController *)self view];
  v76 = [v75 bottomAnchor];
  v77 = [v74 constraintLessThanOrEqualToAnchor:v76 constant:-16.0];
  [v42 addObject:v77];

  v78 = [(MFHyperlinkEditorViewController *)self view];
  v79 = [v78 widthAnchor];
  v80 = [v79 constraintGreaterThanOrEqualToConstant:320.0];
  [v42 addObject:v80];

  if ([(MFHyperlinkEditorViewController *)self shouldShowCloseButton])
  {
    v81 = [v24 widthAnchor];
    v82 = [(MFHyperlinkEditorViewController *)self linkEditorCancelButton];
    v83 = [v82 widthAnchor];
    v84 = [v81 constraintEqualToAnchor:v83];
    [v42 addObject:v84];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v42];
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = [(MFHyperlinkEditorViewController *)self view];
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v6 = v5;
  objc_super v7 = [(MFHyperlinkEditorViewController *)self view];
  [v7 safeAreaInsets];
  double v9 = v6 - v8;

  return v9;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setLinkEditorTitle:(id)a3
{
}

- (void)setLinkEditorTextField:(id)a3
{
}

- (UIButton)linkEditorCancelButton
{
  return self->_linkEditorCancelButton;
}

- (void)setLinkEditorCancelButton:(id)a3
{
}

- (BOOL)shouldShowCloseButton
{
  return self->_shouldShowCloseButton;
}

- (void)setShouldShowCloseButton:(BOOL)a3
{
  self->_shouldShowCloseButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEditorCancelButton, 0);
  objc_storeStrong((id *)&self->_linkEditorTextField, 0);
  objc_storeStrong((id *)&self->_linkEditorTitle, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end