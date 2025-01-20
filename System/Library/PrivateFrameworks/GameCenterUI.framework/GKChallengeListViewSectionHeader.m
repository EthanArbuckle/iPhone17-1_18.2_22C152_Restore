@interface GKChallengeListViewSectionHeader
- (BOOL)wantsSecondaryLabel;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (UILabel)secondaryLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)secondaryLabelTapGesture;
- (id)secondaryLabelTapHandler;
- (void)awakeFromNib;
- (void)secondaryLabelTapped:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelTapGesture:(id)a3;
- (void)setSecondaryLabelTapHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setWantsSecondaryLabel:(BOOL)a3;
@end

@implementation GKChallengeListViewSectionHeader

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)GKChallengeListViewSectionHeader;
  [(GKChallengeListViewSectionHeader *)&v5 awakeFromNib];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_secondaryLabelTapped_];
  [(GKChallengeListViewSectionHeader *)self setSecondaryLabelTapGesture:v3];
  v4 = [(GKChallengeListViewSectionHeader *)self secondaryLabel];
  [v4 addGestureRecognizer:v3];
}

- (void)secondaryLabelTapped:(id)a3
{
  v3 = [(GKChallengeListViewSectionHeader *)self secondaryLabelTapHandler];
  v3[2]();
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (BOOL)wantsSecondaryLabel
{
  return self->_wantsSecondaryLabel;
}

- (void)setWantsSecondaryLabel:(BOOL)a3
{
  self->_wantsSecondaryLabel = a3;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (id)secondaryLabelTapHandler
{
  return self->_secondaryLabelTapHandler;
}

- (void)setSecondaryLabelTapHandler:(id)a3
{
}

- (UITapGestureRecognizer)secondaryLabelTapGesture
{
  return self->_secondaryLabelTapGesture;
}

- (void)setSecondaryLabelTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelTapGesture, 0);
  objc_storeStrong(&self->_secondaryLabelTapHandler, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_destroyWeak((id *)&self->_leadingConstraint);
  objc_destroyWeak((id *)&self->_trailingConstraint);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end