@interface _SFURLTextPreviewViewController
- (NSURL)URL;
- (_SFURLTextPreviewView)previewView;
- (_SFURLTextPreviewViewController)initWithURL:(id)a3;
- (id)_activatedElementInfo;
- (id)_linkActions;
- (id)_previewHeader;
- (void)_setActivatedElementInfo:(id)a3;
- (void)_setLinkActions:(id)a3;
- (void)loadView;
- (void)setPreviewView:(id)a3;
- (void)setURL:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _SFURLTextPreviewViewController

- (_SFURLTextPreviewViewController)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFURLTextPreviewViewController;
  v6 = [(_SFURLTextPreviewViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  v41[7] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)_SFURLTextPreviewViewController;
  [(_SFURLTextPreviewViewController *)&v40 loadView];
  v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v4 = [(_SFURLTextPreviewViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [[_SFURLTextPreviewView alloc] initWithURL:self->_URL];
  previewView = self->_previewView;
  self->_previewView = v5;

  v7 = [(_SFURLTextPreviewViewController *)self view];
  [v7 addSubview:self->_previewView];

  v8 = [[_SFLinkPreviewHeader alloc] initWithMinimumPreviewUI:0];
  previewHeader = self->_previewHeader;
  self->_previewHeader = v8;

  [(_SFLinkPreviewHeader *)self->_previewHeader setLinkPreviewEnabled:0];
  objc_super v10 = [(_SFURLTextPreviewViewController *)self view];
  [v10 addSubview:self->_previewHeader];

  [(_SFLinkPreviewHeader *)self->_previewHeader setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_SFURLTextPreviewView *)self->_previewView setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(_SFLinkPreviewHeader *)self->_previewHeader leadingAnchor];
  v39 = [(_SFURLTextPreviewViewController *)self view];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v41[0] = v36;
  v34 = [(_SFLinkPreviewHeader *)self->_previewHeader trailingAnchor];
  v35 = [(_SFURLTextPreviewViewController *)self view];
  v33 = [v35 trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v41[1] = v32;
  v30 = [(_SFLinkPreviewHeader *)self->_previewHeader topAnchor];
  v31 = [(_SFURLTextPreviewViewController *)self view];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v41[2] = v28;
  v25 = [(_SFURLTextPreviewView *)self->_previewView leadingAnchor];
  v26 = [(_SFURLTextPreviewViewController *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:16.0];
  v41[3] = v23;
  v21 = [(_SFURLTextPreviewView *)self->_previewView trailingAnchor];
  v22 = [(_SFURLTextPreviewViewController *)self view];
  v11 = [v22 trailingAnchor];
  v12 = [v21 constraintEqualToAnchor:v11 constant:-16.0];
  v41[4] = v12;
  v13 = [(_SFURLTextPreviewView *)self->_previewView topAnchor];
  v14 = [(_SFLinkPreviewHeader *)self->_previewHeader bottomAnchor];
  v15 = [v13 constraintEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];
  v41[5] = v15;
  v16 = [(_SFURLTextPreviewViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [(_SFURLTextPreviewView *)self->_previewView bottomAnchor];
  v19 = [v17 constraintEqualToSystemSpacingBelowAnchor:v18 multiplier:1.0];
  v41[6] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:7];
  [v27 activateConstraints:v20];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_SFURLTextPreviewViewController;
  [(_SFURLTextPreviewViewController *)&v9 viewWillLayoutSubviews];
  v3 = [(_SFURLTextPreviewViewController *)self view];
  [v3 frame];
  if (v4 == 0.0) {
    double v5 = 375.0;
  }
  else {
    double v5 = v4;
  }

  v6 = [(_SFURLTextPreviewViewController *)self view];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v5, 0.0);
  double v8 = v7;

  -[_SFURLTextPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v8);
}

- (void)_setLinkActions:(id)a3
{
}

- (id)_linkActions
{
  return self->_linkActions;
}

- (void)_setActivatedElementInfo:(id)a3
{
}

- (id)_activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (id)_previewHeader
{
  return self->_previewHeader;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (_SFURLTextPreviewView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_previewHeader, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);

  objc_storeStrong((id *)&self->_linkActions, 0);
}

@end