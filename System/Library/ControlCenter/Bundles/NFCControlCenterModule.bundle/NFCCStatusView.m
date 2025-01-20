@interface NFCCStatusView
- (NFCCStatusView)initWithFrame:(CGRect)a3;
- (id)_makePromptLabelWrapper;
- (int64_t)moduleState;
- (void)_contentSizeCategoryDidChange;
- (void)_moduleStateDidChangeAnimated:(BOOL)a3;
- (void)_setUp;
- (void)_updateUnsupportedTagPromptLabelWithFont:(id)a3;
- (void)didMoveToWindow;
- (void)setModuleState:(int64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOrientationIfNeeded;
@end

@implementation NFCCStatusView

- (NFCCStatusView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFCCStatusView;
  v3 = -[NFCCStatusView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NFCCStatusView *)v3 _setUp];
    v5 = v4;
  }

  return v4;
}

- (void)_setUp
{
  v3 = (PKGlyphView *)[objc_alloc((Class)PKGlyphView) initWithStyle:3];
  glyphView = self->_glyphView;
  self->_glyphView = v3;

  v5 = self->_glyphView;
  v6 = +[UIScreen mainScreen];
  [v6 scale];
  -[PKGlyphView updateRasterizationScale:](v5, "updateRasterizationScale:");

  v62 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:1 scale:36.0];
  v61 = +[UIColor colorWithWhite:0.745098039 alpha:1.0];
  objc_super v7 = +[UIImage systemImageNamed:@"exclamationmark" withConfiguration:v62];
  v8 = [v7 _flatImageWithColor:v61];

  v9 = self->_glyphView;
  id v60 = v8;
  id v10 = [v60 CGImage];
  [v60 alignmentRectInsets];
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](v9, "setCustomImage:withAlignmentEdgeInsets:", v10);
  [(PKGlyphView *)self->_glyphView setState:9 animated:0 completionHandler:0];
  [(PKGlyphView *)self->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NFCCStatusView *)self addSubview:self->_glyphView];
  v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  promptLabelContainerView = self->_promptLabelContainerView;
  self->_promptLabelContainerView = v11;

  [(UIView *)self->_promptLabelContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NFCCStatusView *)self addSubview:self->_promptLabelContainerView];
  v13 = [(NFCCStatusView *)self _makePromptLabelWrapper];
  scanTagPromptLabelWrapper = self->_scanTagPromptLabelWrapper;
  self->_scanTagPromptLabelWrapper = v13;

  v15 = _BCSLocalizedString();
  v16 = [(NFCCWrappedLabel *)self->_scanTagPromptLabelWrapper label];
  [v16 setText:v15];

  v17 = [(UIView *)self->_promptLabelContainerView bottomAnchor];
  v18 = [(NFCCWrappedLabel *)self->_scanTagPromptLabelWrapper bottomAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  scanTagPromptLabelBottomConstraint = self->_scanTagPromptLabelBottomConstraint;
  self->_scanTagPromptLabelBottomConstraint = v19;

  v21 = [(NFCCStatusView *)self _makePromptLabelWrapper];
  unavailablePromptLabelWrapper = self->_unavailablePromptLabelWrapper;
  self->_unavailablePromptLabelWrapper = v21;

  v23 = _BCSLocalizedString();
  v24 = [(NFCCWrappedLabel *)self->_unavailablePromptLabelWrapper label];
  [v24 setText:v23];

  v25 = [(UIView *)self->_promptLabelContainerView bottomAnchor];
  v26 = [(NFCCWrappedLabel *)self->_unavailablePromptLabelWrapper bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  unavailablePromptLabelBottomConstraint = self->_unavailablePromptLabelBottomConstraint;
  self->_unavailablePromptLabelBottomConstraint = v27;

  v29 = [(NFCCStatusView *)self _makePromptLabelWrapper];
  unsupportedTagPromptLabelWrapper = self->_unsupportedTagPromptLabelWrapper;
  self->_unsupportedTagPromptLabelWrapper = v29;

  v31 = [(UIView *)self->_promptLabelContainerView bottomAnchor];
  v32 = [(NFCCWrappedLabel *)self->_unsupportedTagPromptLabelWrapper bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  unsupportedTagPromptLabelBottomConstraint = self->_unsupportedTagPromptLabelBottomConstraint;
  self->_unsupportedTagPromptLabelBottomConstraint = v33;

  [(NFCCStatusView *)self _moduleStateDidChangeAnimated:0];
  v35 = [(UIView *)self->_promptLabelContainerView topAnchor];
  v36 = [(PKGlyphView *)self->_glyphView bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  glyphViewPromptLabelSpacingConstraint = self->_glyphViewPromptLabelSpacingConstraint;
  self->_glyphViewPromptLabelSpacingConstraint = v37;

  [(NFCCStatusView *)self _contentSizeCategoryDidChange];
  v59 = [(PKGlyphView *)self->_glyphView centerXAnchor];
  v58 = [(NFCCStatusView *)self centerXAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v63[0] = v57;
  v56 = [(PKGlyphView *)self->_glyphView topAnchor];
  v55 = [(NFCCStatusView *)self topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:36.0];
  v63[1] = v54;
  v53 = [(PKGlyphView *)self->_glyphView widthAnchor];
  v52 = [v53 constraintEqualToConstant:63.0];
  v63[2] = v52;
  v51 = [(PKGlyphView *)self->_glyphView heightAnchor];
  v50 = [v51 constraintEqualToConstant:63.0];
  v63[3] = v50;
  v49 = [(UIView *)self->_promptLabelContainerView leadingAnchor];
  v39 = [(NFCCStatusView *)self leadingAnchor];
  v40 = [v49 constraintEqualToAnchor:v39 constant:16.0];
  v41 = self->_glyphViewPromptLabelSpacingConstraint;
  v63[4] = v40;
  v63[5] = v41;
  v42 = [(NFCCStatusView *)self trailingAnchor];
  v43 = [(UIView *)self->_promptLabelContainerView trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43 constant:16.0];
  v63[6] = v44;
  v45 = [(NFCCStatusView *)self bottomAnchor];
  v46 = [(UIView *)self->_promptLabelContainerView bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:40.0];
  v63[7] = v47;
  v48 = +[NSArray arrayWithObjects:v63 count:8];
  +[NSLayoutConstraint activateConstraints:v48];
}

- (id)_makePromptLabelWrapper
{
  v3 = -[NFCCWrappedLabel initWithFrame:]([NFCCWrappedLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NFCCWrappedLabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_promptLabelContainerView addSubview:v3];
  v4 = [(NFCCWrappedLabel *)v3 label];
  [v4 setTextAlignment:1];
  [v4 setNumberOfLines:0];
  v15 = [(NFCCWrappedLabel *)v3 leadingAnchor];
  v14 = [(UIView *)self->_promptLabelContainerView leadingAnchor];
  v5 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v5;
  v6 = [(NFCCWrappedLabel *)v3 topAnchor];
  objc_super v7 = [(UIView *)self->_promptLabelContainerView topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v16[1] = v8;
  v9 = [(UIView *)self->_promptLabelContainerView trailingAnchor];
  id v10 = [(NFCCWrappedLabel *)v3 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v16[2] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:3];
  +[NSLayoutConstraint activateConstraints:v12];

  return v3;
}

- (void)didMoveToWindow
{
  v18.receiver = self;
  v18.super_class = (Class)NFCCStatusView;
  [(NFCCStatusView *)&v18 didMoveToWindow];
  v3 = [(NFCCStatusView *)self window];

  if (v3)
  {
    v4 = [(NFCCStatusView *)self visualStylingProviderForCategory:1];
    p_visualStylingProvider = &self->_visualStylingProvider;
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      objc_super v7 = [(NFCCWrappedLabel *)self->_scanTagPromptLabelWrapper label];
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v7];

      v8 = *p_visualStylingProvider;
      v9 = [(NFCCWrappedLabel *)self->_unavailablePromptLabelWrapper label];
      [(MTVisualStylingProvider *)v8 stopAutomaticallyUpdatingView:v9];

      id v10 = *p_visualStylingProvider;
      v11 = [(NFCCWrappedLabel *)self->_unsupportedTagPromptLabelWrapper label];
      [(MTVisualStylingProvider *)v10 stopAutomaticallyUpdatingView:v11];

      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      v12 = *p_visualStylingProvider;
      v13 = [(NFCCWrappedLabel *)self->_scanTagPromptLabelWrapper label];
      [(MTVisualStylingProvider *)v12 automaticallyUpdateView:v13 withStyle:1];

      v14 = *p_visualStylingProvider;
      v15 = [(NFCCWrappedLabel *)self->_unavailablePromptLabelWrapper label];
      [(MTVisualStylingProvider *)v14 automaticallyUpdateView:v15 withStyle:1];

      v16 = *p_visualStylingProvider;
      v17 = [(NFCCWrappedLabel *)self->_unsupportedTagPromptLabelWrapper label];
      [(MTVisualStylingProvider *)v16 automaticallyUpdateView:v17 withStyle:1];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCStatusView;
  id v4 = a3;
  [(NFCCStatusView *)&v9 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  v6 = [(NFCCStatusView *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(NFCCStatusView *)self _contentSizeCategoryDidChange];
  }
}

- (void)updateOrientationIfNeeded
{
  id interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != [UIApp activeInterfaceOrientation])
  {
    [(NFCCStatusView *)self _contentSizeCategoryDidChange];
  }
}

- (void)_contentSizeCategoryDidChange
{
  v3 = [(NFCCStatusView *)self traitCollection];
  id v10 = [v3 preferredContentSizeCategory];

  id v4 = [UIApp activeInterfaceOrientation];
  self->_id interfaceOrientation = (int64_t)v4;
  if (sub_780C((NSString *)v10, (uint64_t)v4))
  {
    v5 = UIContentSizeCategoryAccessibilityLarge;

    v6 = v5;
  }
  else
  {
    v6 = (NSString *)v10;
  }
  v11 = v6;
  objc_super v7 = +[UIFont bsui_preferredFontForTextStyle:UIFontTextStyleBody hiFontStyle:8 contentSizeCategory:v6];
  unsigned __int8 v8 = [(NFCCWrappedLabel *)self->_scanTagPromptLabelWrapper label];
  [v8 setFont:v7];

  objc_super v9 = [(NFCCWrappedLabel *)self->_unavailablePromptLabelWrapper label];
  [v9 setFont:v7];

  [(NFCCStatusView *)self _updateUnsupportedTagPromptLabelWithFont:v7];
  [v7 _scaledValueForValue:30.0];
  -[NSLayoutConstraint setConstant:](self->_glyphViewPromptLabelSpacingConstraint, "setConstant:");
}

- (void)_updateUnsupportedTagPromptLabelWithFont:(id)a3
{
  id v4 = a3;
  id v15 = +[UIImageSymbolConfiguration configurationWithFont:v4 scale:2];
  v5 = +[UIImage systemImageNamed:@"exclamationmark.circle" withConfiguration:v15];
  v6 = +[NSTextAttachment textAttachmentWithImage:v5];
  id v7 = objc_alloc((Class)NSAttributedString);
  unsigned __int8 v8 = _BCSLocalizedString();
  id v9 = [v7 initWithString:v8];

  id v10 = objc_alloc_init((Class)NSMutableAttributedString);
  v11 = +[NSAttributedString attributedStringWithAttachment:v6];
  [v10 appendAttributedString:v11];

  id v12 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v10 appendAttributedString:v12];

  [v10 appendAttributedString:v9];
  v13 = [(NFCCWrappedLabel *)self->_unsupportedTagPromptLabelWrapper label];
  [v13 setAttributedText:v10];

  v14 = [(NFCCWrappedLabel *)self->_unsupportedTagPromptLabelWrapper label];
  [v14 setFont:v4];
}

- (void)setModuleState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_moduleState != a3)
  {
    self->_moduleState = a3;
    [(NFCCStatusView *)self _moduleStateDidChangeAnimated:a4];
  }
}

- (void)_moduleStateDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  glyphView = self->_glyphView;
  unint64_t v6 = self->_moduleState - 1;
  if (v6 > 2) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = qword_BC38[v6];
  }
  [(PKGlyphView *)glyphView setState:v7 animated:v3 completionHandler:0];
  int64_t moduleState = self->_moduleState;
  BOOL v9 = moduleState == 3;
  uint64_t v10 = v9 ^ (moduleState != 4);
  BOOL v11 = moduleState == 4;
  [(NSLayoutConstraint *)self->_scanTagPromptLabelBottomConstraint setActive:v10];
  [(NSLayoutConstraint *)self->_unavailablePromptLabelBottomConstraint setActive:v9];
  [(NSLayoutConstraint *)self->_unsupportedTagPromptLabelBottomConstraint setActive:v11];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_766C;
  v13[3] = &unk_C4D8;
  v13[4] = self;
  char v14 = v10;
  BOOL v15 = v9;
  BOOL v16 = v11;
  id v12 = objc_retainBlock(v13);
  if (v3) {
    +[UIView _animateUsingSpringInteractive:0 animations:v12 completion:0];
  }
  else {
    +[UIView _performWithoutRetargetingAnimations:v12];
  }
}

- (int64_t)moduleState
{
  return self->_moduleState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphViewPromptLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_unsupportedTagPromptLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_unavailablePromptLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scanTagPromptLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_unsupportedTagPromptLabelWrapper, 0);
  objc_storeStrong((id *)&self->_unavailablePromptLabelWrapper, 0);
  objc_storeStrong((id *)&self->_scanTagPromptLabelWrapper, 0);
  objc_storeStrong((id *)&self->_promptLabelContainerView, 0);

  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end