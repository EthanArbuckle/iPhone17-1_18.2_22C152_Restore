@interface BCSCoachingMessageView
- (BCSCoachingMessageView)init;
- (BOOL)isContentHidden;
- (BOOL)isObscuredByOverlay;
- (NSString)message;
- (void)layoutSubviews;
- (void)setContentHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setObscuredByOverlay:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BCSCoachingMessageView

- (BCSCoachingMessageView)init
{
  v51[8] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)BCSCoachingMessageView;
  v2 = [(BCSCoachingMessageView *)&v50 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v4 = _BCSLocalizedString();
    [(UILabel *)v3 setText:v4];

    v5 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v3 setTextColor:v5];

    [(UILabel *)v3 setClipsToBounds:0];
    [(UILabel *)v3 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3 setMinimumScaleFactor:0.1];
    [(UILabel *)v3 setLineBreakMode:2];
    [(UILabel *)v3 setTextAlignment:1];
    [(UILabel *)v3 setNumberOfLines:1];
    [(UILabel *)v3 setBaselineAdjustment:1];
    v6 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0]];
    v7 = [v6 fontDescriptorWithSymbolicTraits:2];

    v8 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
    [(UILabel *)v3 setFont:v8];

    fontDescriptor = v2->_fontDescriptor;
    v2->_fontDescriptor = v7;
    v49 = v7;

    [(UILabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    coachingMessageLabel = v2->_coachingMessageLabel;
    v2->_coachingMessageLabel = v3;
    v11 = v3;

    id v12 = objc_alloc(MEMORY[0x263F82E50]);
    v13 = [MEMORY[0x263F824D8] effectWithStyle:2];
    v14 = (UIVisualEffectView *)[v12 initWithEffect:v13];

    [(UIVisualEffectView *)v14 _setContinuousCornerRadius:14.0];
    [(UIVisualEffectView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(UIVisualEffectView *)v14 contentView];
    [v15 addSubview:v11];

    coachingMessageContainerView = v2->_coachingMessageContainerView;
    v2->_coachingMessageContainerView = v14;
    v17 = v14;

    [(BCSCoachingMessageView *)v2 addSubview:v17];
    v18 = [(UILabel *)v11 topAnchor];
    v19 = [(UIVisualEffectView *)v17 topAnchor];
    uint64_t v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
    coachingLabelTopAnchorConstraint = v2->_coachingLabelTopAnchorConstraint;
    v2->_coachingLabelTopAnchorConstraint = (NSLayoutConstraint *)v20;

    v22 = [(UILabel *)v11 bottomAnchor];
    v23 = [(UIVisualEffectView *)v17 bottomAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];
    coachingLabelBottomAnchorConstraint = v2->_coachingLabelBottomAnchorConstraint;
    v2->_coachingLabelBottomAnchorConstraint = (NSLayoutConstraint *)v24;

    v40 = (void *)MEMORY[0x263F08938];
    v38 = v11;
    v48 = [(UILabel *)v11 leadingAnchor];
    v47 = [(UIVisualEffectView *)v17 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:15.0];
    v51[0] = v46;
    v45 = [(UILabel *)v11 trailingAnchor];
    v44 = [(UIVisualEffectView *)v17 trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-15.0];
    v51[1] = v43;
    v51[2] = v2->_coachingLabelTopAnchorConstraint;
    v51[3] = v2->_coachingLabelBottomAnchorConstraint;
    v42 = [(UIVisualEffectView *)v17 leadingAnchor];
    v41 = [(BCSCoachingMessageView *)v2 leadingAnchor];
    v39 = [v42 constraintEqualToAnchor:v41];
    v51[4] = v39;
    v37 = [(UIVisualEffectView *)v17 trailingAnchor];
    v36 = [(BCSCoachingMessageView *)v2 trailingAnchor];
    v26 = [v37 constraintEqualToAnchor:v36];
    v51[5] = v26;
    v27 = [(UIVisualEffectView *)v17 topAnchor];
    v28 = [(BCSCoachingMessageView *)v2 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v51[6] = v29;
    v30 = [(UIVisualEffectView *)v17 bottomAnchor];
    v31 = [(BCSCoachingMessageView *)v2 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v51[7] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:8];
    [v40 activateConstraints:v33];

    v34 = v2;
  }

  return v2;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return [(UILabel *)self->_coachingMessageLabel text];
}

- (void)setHidden:(BOOL)a3
{
  if (((!self->_contentHidden ^ a3) & 1) == 0)
  {
    self->_contentHidden = a3;
    [(BCSCoachingMessageView *)self setNeedsLayout];
  }
}

- (void)setObscuredByOverlay:(BOOL)a3
{
  if (((!self->_obscuredByOverlay ^ a3) & 1) == 0)
  {
    self->_obscuredByOverlay = a3;
    [(BCSCoachingMessageView *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BCSCoachingMessageView;
  id v4 = a3;
  [(BCSCoachingMessageView *)&v11 traitCollectionDidChange:v4];
  v5 = [(BCSCoachingMessageView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    v8 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0]];
    v9 = [v8 fontDescriptorWithSymbolicTraits:2];
    fontDescriptor = self->_fontDescriptor;
    self->_fontDescriptor = v9;

    [(BCSCoachingMessageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)BCSCoachingMessageView;
  [(BCSCoachingMessageView *)&v24 layoutSubviews];
  v3 = [(BCSCoachingMessageView *)self window];
  id v4 = [v3 windowScene];
  if ((unint64_t)([v4 interfaceOrientation] - 3) > 1)
  {
    BOOL v6 = 0;
  }
  else
  {
    v5 = [(BCSCoachingMessageView *)self traitCollection];
    BOOL v6 = [v5 userInterfaceIdiom] == 0;
  }
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 _referenceBounds];
  double v9 = v8;

  double v10 = 4.0;
  if (v9 > 320.0) {
    double v10 = 8.0;
  }
  double v11 = 20.0;
  if (v9 <= 320.0) {
    double v11 = 18.0;
  }
  if (v6) {
    double v12 = 8.0;
  }
  else {
    double v12 = 14.0;
  }
  double v13 = 15.0;
  if (v6)
  {
    double v13 = v10;
    double v14 = v11;
  }
  else
  {
    double v14 = 0.0;
  }
  [(NSLayoutConstraint *)self->_coachingLabelTopAnchorConstraint setConstant:v13];
  [(NSLayoutConstraint *)self->_coachingLabelTopAnchorConstraint constant];
  [(NSLayoutConstraint *)self->_coachingLabelBottomAnchorConstraint setConstant:-v15];
  [(UIVisualEffectView *)self->_coachingMessageContainerView _setContinuousCornerRadius:v12];
  v16 = [(UIFontDescriptor *)self->_fontDescriptor fontAttributes];
  v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F81768]];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 >= v14) {
    double v20 = v14;
  }
  else {
    double v20 = v19;
  }
  v21 = [MEMORY[0x263F81708] fontWithDescriptor:self->_fontDescriptor size:v20];
  [(UILabel *)self->_coachingMessageLabel setFont:v21];

  if (self->_contentHidden) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = self->_obscuredByOverlay && v6;
  }
  v23.receiver = self;
  v23.super_class = (Class)BCSCoachingMessageView;
  [(BCSCoachingMessageView *)&v23 setHidden:v22];
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setContentHidden:(BOOL)a3
{
  self->_contentHidden = a3;
}

- (BOOL)isObscuredByOverlay
{
  return self->_obscuredByOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingLabelBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_coachingLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_coachingMessageLabel, 0);

  objc_storeStrong((id *)&self->_coachingMessageContainerView, 0);
}

@end