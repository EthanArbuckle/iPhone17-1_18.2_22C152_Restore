@interface MRURoutingTableViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isVendorSpecific;
- (BOOL)showChevron;
- (BOOL)showChevronExpanded;
- (CGRect)expandRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRURoutingAccessoryView)routingAccessoryView;
- (MRURoutingSubtitleController)subtitleStateController;
- (MRURoutingSubtitleView)subtitleView;
- (MRURoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MRURoutingTableViewCellDelegate)delegate;
- (MRUSlider)volumeSlider;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeController)volumeController;
- (NSString)protocolName;
- (NSString)title;
- (UIEdgeInsets)contentEdgeInsets;
- (UIImage)iconImage;
- (UIImage)protocolIcon;
- (UIImageView)iconImageView;
- (UIImageView)outlineImageView;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)expandGestureRecognizer;
- (UIView)separatorView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3;
- (void)didTapToExpand;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)routingSubtitleStateController:(id)a3 didUpdateText:(id)a4 icon:(id)a5 accessory:(int64_t)a6;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandGestureRecognizer:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIsVendorSpecific:(BOOL)a3;
- (void)setOutlineImageView:(id)a3;
- (void)setProtocolIcon:(id)a3;
- (void)setProtocolName:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setShowChevron:(BOOL)a3;
- (void)setShowChevronExpanded:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleAccessory:(int64_t)a3;
- (void)setSubtitleView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeSlider:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)transitionToNextVisibleStateWithDuration:(double)a3;
- (void)updateContentSizeCategory;
- (void)updateVisibility;
- (void)updateVisualStyling;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
- (void)volumeControllerDidFinishEqualization:(id)a3;
- (void)volumeControllerWillBeginEqualization:(id)a3;
@end

@implementation MRURoutingTableViewCell

- (MRURoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v42.receiver = self;
  v42.super_class = (Class)MRURoutingTableViewCell;
  v4 = [(MRURoutingTableViewCell *)&v42 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(MRURoutingTableViewCell *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(MRURoutingTableViewCell *)v4 setSelectedBackgroundView:v6];

    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    v8 = [(MRURoutingTableViewCell *)v4 selectedBackgroundView];
    [v8 setBackgroundColor:v7];

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    outlineImageView = v4->_outlineImageView;
    v4->_outlineImageView = v9;

    v11 = +[MRUAssetsProvider collapsedRoutingChevron];
    [(UIImageView *)v4->_outlineImageView setImage:v11];

    v12 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:1 scale:17.0];
    [(UIImageView *)v4->_outlineImageView setPreferredSymbolConfiguration:v12];

    v13 = [(MRURoutingTableViewCell *)v4 contentView];
    [v13 addSubview:v4->_outlineImageView];

    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v14;

    [(UIImageView *)v4->_iconImageView setContentMode:1];
    v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:20.0];
    [(UIImageView *)v4->_iconImageView setPreferredSymbolConfiguration:v16];

    v17 = [(MRURoutingTableViewCell *)v4 contentView];
    [v17 addSubview:v4->_iconImageView];

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v18;

    [(UILabel *)v4->_titleLabel setNumberOfLines:1];
    [(UILabel *)v4->_titleLabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
    v20 = [(MRURoutingTableViewCell *)v4 contentView];
    [v20 addSubview:v4->_titleLabel];

    v21 = objc_alloc_init(MRURoutingSubtitleView);
    subtitleView = v4->_subtitleView;
    v4->_subtitleView = v21;

    v23 = [(MRURoutingTableViewCell *)v4 contentView];
    [v23 addSubview:v4->_subtitleView];

    v24 = objc_alloc_init(MRURoutingAccessoryView);
    routingAccessoryView = v4->_routingAccessoryView;
    v4->_routingAccessoryView = v24;

    v26 = [(MRURoutingTableViewCell *)v4 contentView];
    [v26 addSubview:v4->_routingAccessoryView];

    v27 = objc_alloc_init(MRUSlider);
    volumeSlider = v4->_volumeSlider;
    v4->_volumeSlider = v27;

    -[MRUSlider setHitRectInset:](v4->_volumeSlider, "setHitRectInset:", -10.0, 0.0, -10.0, 10.0);
    [(MRUSlider *)v4->_volumeSlider setExpansionFactor:1.75];
    [(MRUSlider *)v4->_volumeSlider addTarget:v4 action:sel_sliderValueChanged_ forControlEvents:4096];
    [(MRURoutingTableViewCell *)v4 addSubview:v4->_volumeSlider];
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v29;

    v31 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v31];

    v32 = [(MRURoutingTableViewCell *)v4 contentView];
    [v32 addSubview:v4->_separatorView];

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_didTapToExpand];
    expandGestureRecognizer = v4->_expandGestureRecognizer;
    v4->_expandGestureRecognizer = (UITapGestureRecognizer *)v33;

    [(UITapGestureRecognizer *)v4->_expandGestureRecognizer setDelegate:v4];
    [(UITapGestureRecognizer *)v4->_expandGestureRecognizer setEnabled:0];
    v35 = [(MRURoutingTableViewCell *)v4 contentView];
    [v35 addGestureRecognizer:v4->_expandGestureRecognizer];

    v36 = objc_alloc_init(MRURoutingSubtitleController);
    subtitleStateController = v4->_subtitleStateController;
    v4->_subtitleStateController = v36;

    [(MRURoutingSubtitleController *)v4->_subtitleStateController setDelegate:v4];
    v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    v39 = [(MRURoutingTableViewCell *)v4 contentView];
    [v39 addInteraction:v38];

    v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v4 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRURoutingTableViewCell *)v4 updateContentSizeCategory];
    [(MRURoutingTableViewCell *)v4 updateVisibility];
  }
  return v4;
}

- (void)layoutSubviews
{
  v76.receiver = self;
  v76.super_class = (Class)MRURoutingTableViewCell;
  [(MRURoutingTableViewCell *)&v76 layoutSubviews];
  v3 = [(MRURoutingTableViewCell *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;

  id v6 = [(MRURoutingTableViewCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double v17 = v8 + left;
  double v18 = v10 + top;
  double v19 = v12 - (left + self->_contentEdgeInsets.right);
  double v20 = v14 - (top + self->_contentEdgeInsets.bottom);
  double v21 = 28.0 * (double)[(MRURoutingTableViewCell *)self indentationLevel];
  uint64_t v74 = v5;
  v77.origin.CGFloat x = v17;
  v77.origin.CGFloat y = v18;
  v77.size.width = v19;
  v77.size.CGFloat height = v20;
  CGRectGetMinX(v77);
  double v75 = v21;
  v78.origin.CGFloat x = v17;
  v78.origin.CGFloat y = v18;
  v78.size.width = v19;
  v78.size.CGFloat height = v20;
  CGRectGetMaxY(v78);
  v79.origin.CGFloat x = v17;
  v79.origin.CGFloat y = v18;
  v79.size.width = v19;
  v79.size.CGFloat height = v20;
  CGRectGetWidth(v79);
  UIRectInset();
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  -[UIImageView sizeThatFits:](self->_outlineImageView, "sizeThatFits:", v19, v20);
  v80.origin.CGFloat x = v17;
  v80.origin.CGFloat y = v18;
  v80.size.width = v19;
  v80.size.CGFloat height = v20;
  CGRectGetMinX(v80);
  UIRectCenteredYInRect();
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_outlineImageView, "setFrame:");
  if ([(UIImage *)self->_iconImage isSymbolImage]) {
    -[UIImageView sizeThatFits:](self->_iconImageView, "sizeThatFits:", v19, v20);
  }
  v81.origin.CGFloat x = v17;
  v81.origin.CGFloat y = v18;
  v81.size.width = v19;
  v81.size.CGFloat height = v20;
  CGRectGetMinX(v81);
  UIRectCenteredYInRect();
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  UIRectCenteredIntegralRectScale();
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v82.origin.CGFloat x = v23;
  v82.origin.CGFloat y = v25;
  v82.size.width = v27;
  v82.size.CGFloat height = v29;
  CGRectGetWidth(v82);
  UIRectInset();
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  double v35 = v34;
  double v37 = v36;
  -[MRURoutingAccessoryView sizeThatFits:](self->_routingAccessoryView, "sizeThatFits:", v34, v36);
  v83.origin.CGFloat x = v31;
  v83.origin.CGFloat y = v33;
  v83.size.width = v35;
  v83.size.CGFloat height = v37;
  CGRectGetMaxX(v83);
  UIRectCenteredYInRect();
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRURoutingAccessoryView setFrame:](self->_routingAccessoryView, "setFrame:");
  if ([(MRURoutingAccessoryView *)self->_routingAccessoryView state] || v75 > 0.0)
  {
    v84.origin.CGFloat x = v39;
    v84.origin.CGFloat y = v41;
    v84.size.width = v43;
    v84.size.CGFloat height = v45;
    CGRectGetWidth(v84);
    UIRectInset();
    CGFloat v31 = v46;
    CGFloat v33 = v47;
    double v35 = v48;
    double v37 = v49;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v35, v37);
  double v50 = MRUSizeCeilToViewScale(self);
  double v52 = v51;
  -[MRURoutingSubtitleView sizeThatFits:](self->_subtitleView, "sizeThatFits:", v35, v37);
  v85.origin.CGFloat x = v31;
  v85.origin.CGFloat y = v33;
  v85.size.width = v35;
  v85.size.CGFloat height = v37;
  CGFloat v53 = v52;
  CGRectGetHeight(v85);
  if (![(MRURoutingSubtitleController *)self->_subtitleStateController hasText])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
    [WeakRetained isVolumeControlAvailable];
  }
  UIRectInset();
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  UIFloorToScale();
  CGFloat v62 = v61;
  v86.origin.CGFloat x = v56;
  v86.origin.CGFloat y = v62;
  v86.size.width = v58;
  v86.size.CGFloat height = v60;
  double v63 = v75 + CGRectGetMinX(v86);
  v87.origin.CGFloat x = v56;
  v87.origin.CGFloat y = v62;
  v87.size.width = v58;
  v87.size.CGFloat height = v60;
  CGFloat MinY = CGRectGetMinY(v87);
  v88.origin.CGFloat x = v56;
  v88.origin.CGFloat y = v62;
  v88.size.width = v58;
  v88.size.CGFloat height = v60;
  double Width = CGRectGetWidth(v88);
  if (v50 >= Width) {
    double v50 = Width;
  }
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v89.origin.CGFloat x = v63;
  v89.origin.CGFloat y = MinY;
  v89.size.width = v50;
  v89.size.CGFloat height = v53;
  CGRectGetHeight(v89);
  UIRectInset();
  CGFloat x = v90.origin.x;
  CGFloat y = v90.origin.y;
  CGFloat v68 = v90.size.width;
  CGFloat height = v90.size.height;
  CGRectGetMinX(v90);
  v91.origin.CGFloat x = x;
  v91.origin.CGFloat y = y;
  v91.size.width = v68;
  v91.size.CGFloat height = height;
  CGRectGetMinY(v91);
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRURoutingSubtitleView setFrame:](self->_subtitleView, "setFrame:");
  UIRectInset();
  CGFloat v70 = v92.origin.x;
  CGFloat v71 = v92.origin.y;
  CGFloat v72 = v92.size.width;
  CGFloat v73 = v92.size.height;
  CGRectGetMinX(v92);
  v93.origin.CGFloat x = v70;
  v93.origin.CGFloat y = v71;
  v93.size.width = v72;
  v93.size.CGFloat height = v73;
  CGRectGetWidth(v93);
  UIRectCenteredYInRectScale();
  [(MRURoutingTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUSlider setFrame:](self->_volumeSlider, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  MRUSizeCeilToViewScale(self);
  double v7 = v6 + 0.0;
  double v8 = height - v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
  int v10 = [WeakRetained isVolumeControlAvailable];

  if (v10)
  {
    -[MRUSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", width, v8);
    double v7 = v7 + v11;
  }
  else if ([(MRURoutingSubtitleController *)self->_subtitleStateController hasText])
  {
    -[MRURoutingSubtitleView sizeThatFits:](self->_subtitleView, "sizeThatFits:", width, v8);
    double v7 = v7 + v12 + 4.0;
  }
  double v13 = 28.0;
  if (v7 >= 28.0) {
    double v13 = v7;
  }
  double v14 = v13 + 11.0 * 2.0;
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)MRURoutingTableViewCell;
  [(MRURoutingTableViewCell *)&v4 prepareForReuse];
  [(MRURoutingSubtitleView *)self->_subtitleView prepareForReuse];
  [(MRURoutingSubtitleController *)self->_subtitleStateController prepareForReuse];
  v3 = [(MRURoutingSubtitleView *)self->_subtitleView layer];
  [v3 removeAllAnimations];

  [(MRURoutingAccessoryView *)self->_routingAccessoryView setState:0];
  objc_storeWeak((id *)&self->_volumeController, 0);
  [(MRURoutingTableViewCell *)self setIndentationLevel:0];
  self->_showChevron = 0;
  self->_showChevronExpanded = 0;
  [(MRURoutingTableViewCell *)self updateVisibility];
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_iconImageView setImage:v5];
  if ([v5 isSymbolImage]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UIImageView *)self->_iconImageView setContentMode:v6];

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setSubtitle:(id)a3
{
  [(MRURoutingSubtitleView *)self->_subtitleView setText:a3];

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setIcon:(id)a3
{
  [(MRURoutingSubtitleView *)self->_subtitleView setIcon:a3];

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setSubtitleAccessory:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    -[MRURoutingSubtitleView setState:](self->_subtitleView, "setState:");
  }

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  double v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRURoutingTableViewCell *)self updateVisualStyling];
    [(MRURoutingSubtitleView *)self->_subtitleView setStylingProvider:v7];
    [(MRURoutingAccessoryView *)self->_routingAccessoryView setStylingProvider:v7];
    [(MRUSlider *)self->_volumeSlider setStylingProvider:v7];
  }
}

- (void)setShowChevron:(BOOL)a3
{
  if (self->_showChevron != a3)
  {
    self->_showChevron = a3;
    -[UITapGestureRecognizer setEnabled:](self->_expandGestureRecognizer, "setEnabled:");
    [(MRURoutingTableViewCell *)self updateVisibility];
  }
}

- (void)setShowChevronExpanded:(BOOL)a3
{
  if (self->_showChevronExpanded != a3)
  {
    self->_showChevronExpanded = a3;
    if (a3) {
      +[MRUAssetsProvider expandedRoutingChevron];
    }
    else {
    objc_super v4 = +[MRUAssetsProvider collapsedRoutingChevron];
    }
    [(UIImageView *)self->_outlineImageView setImage:v4];

    [(MRURoutingTableViewCell *)self setNeedsLayout];
  }
}

- (void)setVolumeController:(id)a3
{
  p_volumeController = &self->_volumeController;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_volumeController);
  uint64_t v6 = [WeakRetained delegate];

  if (v6 == self)
  {
    id v7 = objc_loadWeakRetained((id *)p_volumeController);
    [v7 setDelegate:0];
  }
  id v8 = objc_storeWeak((id *)p_volumeController, obj);
  [obj setDelegate:self];

  [obj volumeValue];
  -[MRUSlider setValue:](self->_volumeSlider, "setValue:");
  [(MRURoutingTableViewCell *)self updateVisibility];
  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets.double top = 0.0;
  self->_contentEdgeInsets.double left = a3.left;
  self->_contentEdgeInsets.bottom = 0.0;
  self->_contentEdgeInsets.right = a3.right;
  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRURoutingTableViewCell;
  -[MRURoutingTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v5, sel__setShouldHaveFullLengthBottomSeparator_);
  [(UIView *)self->_separatorView setHidden:v3];
}

- (void)didTapToExpand
{
  self->_showChevronExpanded ^= 1u;
  id v3 = [(MRURoutingTableViewCell *)self delegate];
  [v3 routingCellDidTapToExpand:self];
}

- (void)sliderValueChanged:(id)a3
{
  p_volumeController = &self->_volumeController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_volumeController);
  [v4 value];
  int v6 = v5;

  LODWORD(v7) = 1036831949;
  LODWORD(v8) = v6;
  [WeakRetained setVolume:v8 withNotificationDelay:v7];
}

- (void)transitionToNextVisibleStateWithDuration:(double)a3
{
  if ([(MRURoutingSubtitleController *)self->_subtitleStateController canTransitionToNextState])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);

    if (!WeakRetained)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke;
      v7[3] = &unk_1E5F0D7F8;
      v7[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_2;
      v6[3] = &unk_1E5F101D8;
      v6[4] = self;
      *(double *)&v6[5] = a3;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:a3];
    }
  }
}

void __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) subtitleView];
  [v1 setAlpha:0.0];
}

uint64_t __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1064) transitionToNextAvailableState];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1064) text];
  [*(id *)(a1 + 32) setSubtitle:v2];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 1064) icon];
  [*(id *)(a1 + 32) setIcon:v3];

  objc_msgSend(*(id *)(a1 + 32), "setSubtitleAccessory:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "accessory"));
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v4 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_3;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v4];
}

void __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1080));
  if ([WeakRetained isVolumeControlAvailable]) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  id v3 = [*(id *)(a1 + 32) subtitleView];
  [v3 setAlpha:v2];
}

- (void)routingSubtitleStateController:(id)a3 didUpdateText:(id)a4 icon:(id)a5 accessory:(int64_t)a6
{
  id v9 = a5;
  [(MRURoutingTableViewCell *)self setSubtitle:a4];
  [(MRURoutingTableViewCell *)self setIcon:v9];

  [(MRURoutingTableViewCell *)self setSubtitleAccessory:a6];
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  if (([(MRUSlider *)self->_volumeSlider isTracking] & 1) == 0)
  {
    volumeSlider = self->_volumeSlider;
    *(float *)&double v6 = a4;
    [(MRUSlider *)volumeSlider setValue:1 animated:v6];
  }
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  [(MRURoutingTableViewCell *)self updateVisibility];

  [(MRURoutingTableViewCell *)self setNeedsLayout];
}

- (void)volumeControllerWillBeginEqualization:(id)a3
{
}

- (void)volumeControllerDidFinishEqualization:(id)a3
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(MRURoutingTableViewCell *)self contentView];
  [v5 locationInView:v6];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  [(MRURoutingTableViewCell *)self expandRect];
  uint64_t v15 = v8;
  uint64_t v16 = v10;

  return CGRectContainsPoint(*(CGRect *)&v11, *(CGPoint *)&v15);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_showChevron) {
    goto LABEL_4;
  }
  [(MRURoutingTableViewCell *)self expandRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v9 location];
  v26.CGFloat x = v19;
  v26.CGFloat y = v20;
  v27.origin.CGFloat x = v12;
  v27.origin.CGFloat y = v14;
  v27.size.double width = v16;
  v27.size.double height = v18;
  if (CGRectContainsPoint(v27, v26))
  {
    double v21 = (void *)MEMORY[0x1E4FB1AD8];
    [(MRURoutingTableViewCell *)self expandRect];
    objc_msgSend(v21, "regionWithRect:identifier:", @"outline");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    id v22 = v10;
  }
  CGFloat v23 = v22;

  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  int v6 = [v5 isEqual:@"outline"];

  id v7 = objc_alloc(MEMORY[0x1E4FB1D48]);
  id v8 = v7;
  if (v6)
  {
    id v9 = (void *)[v7 initWithView:self->_outlineImageView];
    id v10 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v9];
    double v11 = (void *)MEMORY[0x1E4FB1AE0];
    [(UIImageView *)self->_outlineImageView frame];
    CGRect v18 = CGRectInset(v17, -3.0, -3.0);
    CGFloat v12 = objc_msgSend(v11, "shapeWithRoundedRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    double v13 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v10 shape:v12];
  }
  else
  {
    CGFloat v14 = [(MRURoutingTableViewCell *)self contentView];
    id v9 = (void *)[v8 initWithView:v14];

    id v10 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v9];
    [v10 setPrefersScaledContent:0];
    double v13 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v10 shape:0];
  }

  return v13;
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_titleLabel];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:2 toView:self->_outlineImageView];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_iconImageView];
  stylingProvider = self->_stylingProvider;
  separatorView = self->_separatorView;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:4 toView:separatorView];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingTitleFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (void)updateVisibility
{
  [(UIImageView *)self->_outlineImageView setHidden:!self->_showChevron];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
  if ([WeakRetained isVolumeControlAvailable]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  [(MRUSlider *)self->_volumeSlider setAlpha:v4];

  id v6 = objc_loadWeakRetained((id *)&self->_volumeController);
  if ([v6 isVolumeControlAvailable]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(MRURoutingSubtitleView *)self->_subtitleView setAlpha:v5];
}

- (CGRect)expandRect
{
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MRURoutingTableViewCell semanticContentAttribute](self, "semanticContentAttribute")) == 1)
  {
    [(UIImageView *)self->_iconImageView frame];
    CGFloat MinX = CGRectGetMinX(v18);
    double v4 = [(MRURoutingTableViewCell *)self contentView];
    [v4 bounds];
    CGFloat MinY = CGRectGetMinY(v19);
    id v6 = [(MRURoutingTableViewCell *)self contentView];
    [v6 bounds];
  }
  else
  {
    double v4 = [(MRURoutingTableViewCell *)self contentView];
    [v4 bounds];
    CGFloat MinX = CGRectGetMinX(v20);
    id v6 = [(MRURoutingTableViewCell *)self contentView];
    [v6 bounds];
    CGFloat MinY = CGRectGetMinY(v21);
    [(UIImageView *)self->_iconImageView frame];
  }
  CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v7);
  CGFloat v12 = [(MRURoutingTableViewCell *)self contentView];
  [v12 bounds];
  CGFloat Height = CGRectGetHeight(v22);

  double v14 = MinX;
  double v15 = MinY;
  double v16 = MaxX;
  double v17 = Height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)isVendorSpecific
{
  return self->_isVendorSpecific;
}

- (void)setIsVendorSpecific:(BOOL)a3
{
  self->_isVendorSpecific = a3;
}

- (MRURoutingTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRURoutingTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)protocolIcon
{
  return self->_protocolIcon;
}

- (void)setProtocolIcon:(id)a3
{
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
}

- (MRURoutingSubtitleController)subtitleStateController
{
  return self->_subtitleStateController;
}

- (MRURoutingAccessoryView)routingAccessoryView
{
  return self->_routingAccessoryView;
}

- (MRUVolumeController)volumeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);

  return (MRUVolumeController *)WeakRetained;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)showChevronExpanded
{
  return self->_showChevronExpanded;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)outlineImageView
{
  return self->_outlineImageView;
}

- (void)setOutlineImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MRURoutingSubtitleView)subtitleView
{
  return self->_subtitleView;
}

- (void)setSubtitleView:(id)a3
{
}

- (MRUSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UITapGestureRecognizer)expandGestureRecognizer
{
  return self->_expandGestureRecognizer;
}

- (void)setExpandGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_outlineImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_volumeController);
  objc_storeStrong((id *)&self->_routingAccessoryView, 0);
  objc_storeStrong((id *)&self->_subtitleStateController, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_protocolIcon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end