@interface CNAvatarCardActionCell
+ (id)cellNibForActions;
+ (id)cellNibForContacts;
- (BOOL)gestureActivated;
- (BOOL)moreHighlighted;
- (BOOL)swipped;
- (BOOL)transitioning;
- (CNAvatarCardHighlightView)defaultHighlightView;
- (CNAvatarCardHighlightView)moreHighlightView;
- (CNQuickAction)action;
- (NSLayoutConstraint)expandButtonWidthConstraint;
- (NSLayoutConstraint)moreHighlightViewHiddingConstraint;
- (NSLayoutConstraint)pageControlLeadingConstraint;
- (NSLayoutConstraint)punchOutLeftConstraint;
- (NSLayoutConstraint)translatingViewLeadingConstraint;
- (UIButton)expandButton;
- (UIImageView)actionImageView;
- (UILabel)moreLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIPageControl)pageControl;
- (UIView)separatorView;
- (UIView)translatingView;
- (double)initialTranslatingViewLeadingConstraintConstant;
- (double)lastScrollDirectionTimestamp;
- (int64_t)context;
- (unint64_t)lastScrollDirection;
- (void)_updateFonts;
- (void)_updateHighlightAnimated:(BOOL)a3;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)reloadData;
- (void)setAction:(id)a3;
- (void)setActionImageView:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDefaultHighlightView:(id)a3;
- (void)setExpandButton:(id)a3;
- (void)setExpandButtonWidthConstraint:(id)a3;
- (void)setGestureActivated:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setInitialTranslatingViewLeadingConstraintConstant:(double)a3;
- (void)setLastScrollDirection:(unint64_t)a3;
- (void)setLastScrollDirectionTimestamp:(double)a3;
- (void)setMoreHighlightView:(id)a3;
- (void)setMoreHighlightViewHiddingConstraint:(id)a3;
- (void)setMoreHighlighted:(BOOL)a3;
- (void)setMoreLabel:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlLeadingConstraint:(id)a3;
- (void)setPunchOutLeftConstraint:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSwipped:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setTranslatingView:(id)a3;
- (void)setTranslatingViewLeadingConstraint:(id)a3;
- (void)startTrackingWithGestureRecognizer:(id)a3;
- (void)stopTrackingWithGestureRecognizer:(id)a3;
- (void)trackHighlight:(id)a3;
@end

@implementation CNAvatarCardActionCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreHighlightViewHiddingConstraint, 0);
  objc_storeStrong((id *)&self->_expandButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pageControlLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_translatingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_punchOutLeftConstraint, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_translatingView, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_moreHighlightView, 0);
  objc_storeStrong((id *)&self->_defaultHighlightView, 0);
  objc_storeStrong((id *)&self->_actionImageView, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setGestureActivated:(BOOL)a3
{
  self->_gestureActivated = a3;
}

- (BOOL)gestureActivated
{
  return self->_gestureActivated;
}

- (void)setLastScrollDirectionTimestamp:(double)a3
{
  self->_lastScrollDirectionTimestamp = a3;
}

- (double)lastScrollDirectionTimestamp
{
  return self->_lastScrollDirectionTimestamp;
}

- (void)setLastScrollDirection:(unint64_t)a3
{
  self->_lastScrollDirection = a3;
}

- (unint64_t)lastScrollDirection
{
  return self->_lastScrollDirection;
}

- (void)setInitialTranslatingViewLeadingConstraintConstant:(double)a3
{
  self->_initialTranslatingViewLeadingConstraintConstant = a3;
}

- (double)initialTranslatingViewLeadingConstraintConstant
{
  return self->_initialTranslatingViewLeadingConstraintConstant;
}

- (void)setMoreHighlightViewHiddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)moreHighlightViewHiddingConstraint
{
  return self->_moreHighlightViewHiddingConstraint;
}

- (void)setExpandButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)expandButtonWidthConstraint
{
  return self->_expandButtonWidthConstraint;
}

- (void)setPageControlLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageControlLeadingConstraint
{
  return self->_pageControlLeadingConstraint;
}

- (void)setTranslatingViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)translatingViewLeadingConstraint
{
  return self->_translatingViewLeadingConstraint;
}

- (void)setPunchOutLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)punchOutLeftConstraint
{
  return self->_punchOutLeftConstraint;
}

- (void)setExpandButton:(id)a3
{
}

- (UIButton)expandButton
{
  return self->_expandButton;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setTranslatingView:(id)a3
{
}

- (UIView)translatingView
{
  return self->_translatingView;
}

- (void)setMoreLabel:(id)a3
{
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setPageControl:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setMoreHighlightView:(id)a3
{
}

- (CNAvatarCardHighlightView)moreHighlightView
{
  return self->_moreHighlightView;
}

- (void)setDefaultHighlightView:(id)a3
{
}

- (CNAvatarCardHighlightView)defaultHighlightView
{
  return self->_defaultHighlightView;
}

- (void)setActionImageView:(id)a3
{
}

- (UIImageView)actionImageView
{
  return self->_actionImageView;
}

- (void)setMoreHighlighted:(BOOL)a3
{
  self->_moreHighlighted = a3;
}

- (BOOL)moreHighlighted
{
  return self->_moreHighlighted;
}

- (void)setSwipped:(BOOL)a3
{
  self->_swipped = a3;
}

- (BOOL)swipped
{
  return self->_swipped;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setAction:(id)a3
{
}

- (CNQuickAction)action
{
  return self->_action;
}

- (void)trackHighlight:(id)a3
{
  id v11 = a3;
  if ([v11 state] == 1 || objc_msgSend(v11, "state") == 2)
  {
    [v11 locationInView:self];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    [(CNAvatarCardActionCell *)self bounds];
    CGFloat y = v14.origin.y;
    CGFloat height = v14.size.height;
    v15.origin.x = CGRectGetMaxX(v14) + -120.0;
    v15.size.width = 120.0;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat height = height;
    v13.x = v5;
    v13.CGFloat y = v7;
    BOOL v10 = CGRectContainsPoint(v15, v13);
    if (v10 != [(CNAvatarCardActionCell *)self moreHighlighted])
    {
      [(CNAvatarCardActionCell *)self setMoreHighlighted:v10];
      [(CNAvatarCardActionCell *)self _updateHighlightAnimated:1];
    }
  }
}

- (void)stopTrackingWithGestureRecognizer:(id)a3
{
}

- (void)startTrackingWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  [v4 addTarget:self action:sel_trackHighlight_];
  [(CNAvatarCardActionCell *)self trackHighlight:v4];

  [(CNAvatarCardActionCell *)self reloadData];
}

- (void)reloadData
{
  v56[2] = *MEMORY[0x1E4F143B8];
  if ([(CNAvatarCardActionCell *)self context] == 3)
  {
    v3 = [(CNAvatarCardActionCell *)self actionImageView];
    [v3 setImage:0];
  }
  else
  {
    id v4 = [(CNAvatarCardActionCell *)self action];
    CGFloat v5 = [v4 image];
    double v6 = [(CNAvatarCardActionCell *)self actionImageView];
    [v6 setImage:v5];

    v3 = +[CNUIColorRepository navigationListActionIconFillColorRegular];
    CGFloat v7 = [(CNAvatarCardActionCell *)self actionImageView];
    [v7 setTintColor:v3];
  }
  if ([(CNAvatarCardActionCell *)self context] == 3
    && ([(CNAvatarCardActionCell *)self action],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isBackAction],
        v8,
        !v9))
  {
    v31 = [(CNAvatarCardActionCell *)self action];
    v32 = objc_msgSend(v31, "titleForContext:", -[CNAvatarCardActionCell context](self, "context"));
    v33 = [(CNAvatarCardActionCell *)self titleLabel];
    [v33 setText:v32];

    v34 = [(CNAvatarCardActionCell *)self action];
    v35 = objc_msgSend(v34, "subtitleForContext:", -[CNAvatarCardActionCell context](self, "context"));
  }
  else
  {
    v55[0] = *MEMORY[0x1E4FB06F8];
    BOOL v10 = [(CNAvatarCardActionCell *)self titleLabel];
    id v11 = [v10 font];
    v56[0] = v11;
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v55[1] = *MEMORY[0x1E4FB0700];
    CGPoint v13 = [(CNAvatarCardActionCell *)self titleLabel];
    CGRect v14 = [v13 textColor];
    v56[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

    v16 = [(CNAvatarCardActionCell *)self action];
    v17 = objc_msgSend(v16, "titleForContext:", -[CNAvatarCardActionCell context](self, "context"));

    v18 = [(CNAvatarCardActionCell *)self action];
    v19 = objc_msgSend(v18, "subtitleForContext:", -[CNAvatarCardActionCell context](self, "context"));

    id v20 = v17;
    v54 = (void *)v15;
    if ([v19 length])
    {
      v21 = [NSString stringWithFormat:@"%@  %@", v20, v19, v15];

      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v21 attributes:v15];
      v23 = [(CNAvatarCardActionCell *)self subtitleLabel];
      v24 = [v23 textColor];
      [v22 addAttribute:v12, v24, objc_msgSend(v20, "length") + objc_msgSend(@"%@  %@", "length") - 4, objc_msgSend(v19, "length") value range];
    }
    else
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20 attributes:v15];
      v21 = v20;
    }
    [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
    double v26 = v25;
    v27 = [(CNAvatarCardActionCell *)self titleLabel];
    v28 = [v27 layer];

    if (v26 <= 0.0
      || ([v28 animationForKey:@"kCATransitionFade"],
          v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v29))
    {
      if (v26 == 0.0)
      {
        v30 = [v28 animationForKey:@"kCATransitionFade"];

        if (v30) {
          [v28 removeAnimationForKey:@"kCATransitionFade"];
        }
      }
    }
    else
    {
      v36 = [MEMORY[0x1E4F39D18] animation];
      v37 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v36 setTimingFunction:v37];

      [v36 setType:*MEMORY[0x1E4F3A5B8]];
      [v36 setDuration:v26];
      [v28 addAnimation:v36 forKey:@"kCATransitionFade"];
    }
    v38 = [(CNAvatarCardActionCell *)self titleLabel];
    [v38 setAttributedText:v22];

    v35 = 0;
  }
  v39 = [(CNAvatarCardActionCell *)self subtitleLabel];
  [v39 setText:v35];

  v40 = [(CNAvatarCardActionCell *)self pageControl];
  [v40 setNumberOfPages:1];

  v41 = [(CNAvatarCardActionCell *)self action];
  int v42 = [v41 isBackAction];

  if (v42)
  {
    v43 = +[CNUIColorRepository orbActionCellBackgroundColor];
    [(CNAvatarCardActionCell *)self setBackgroundColor:v43];
  }
  else
  {
    [(CNAvatarCardActionCell *)self setBackgroundColor:0];
  }
  v44 = objc_opt_class();
  v45 = [(CNAvatarCardActionCell *)self action];
  if (objc_opt_isKindOfClass()) {
    v46 = v45;
  }
  else {
    v46 = 0;
  }

  if (v46)
  {
    uint64_t v47 = 0;
  }
  else
  {
    v44 = [(CNAvatarCardActionCell *)self action];
    uint64_t v47 = [v44 isBackAction] ^ 1;
  }
  v48 = [(CNAvatarCardActionCell *)self expandButton];
  [v48 setHidden:v47];

  if (!v46) {
  v49 = [(CNAvatarCardActionCell *)self expandButton];
  }
  int v50 = [v49 isHidden];

  v51 = [(CNAvatarCardActionCell *)self expandButtonWidthConstraint];
  v52 = v51;
  double v53 = 66.0;
  if (v50) {
    double v53 = 20.0;
  }
  [v51 setConstant:v53];
}

- (void)_updateHighlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(CNAvatarCardActionCell *)self defaultHighlightView];
  objc_msgSend(v5, "setHighlighted:animated:", -[CNAvatarCardActionCell isHighlighted](self, "isHighlighted"), v3);

  double v6 = [(CNAvatarCardActionCell *)self action];
  int v7 = [v6 isBackAction];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CNAvatarCardActionCell__updateHighlightAnimated___block_invoke;
  v12[3] = &unk_1E5499510;
  char v13 = v7;
  v12[4] = self;
  v8 = _Block_copy(v12);
  int v9 = v8;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.2];
  }
  else {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  if ([(CNAvatarCardActionCell *)self isHighlighted]) {
    uint64_t v10 = [(CNAvatarCardActionCell *)self moreHighlighted] | v7;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [(CNAvatarCardActionCell *)self expandButton];
  [v11 setHighlighted:v10];
}

void __51__CNAvatarCardActionCell__updateHighlightAnimated___block_invoke(uint64_t a1)
{
  long long v2 = *MEMORY[0x1E4F1DAB8];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v11.c = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v11.tx = v4;
  if (*(unsigned char *)(a1 + 40))
  {
    *(_OWORD *)&v10.a = v2;
    *(_OWORD *)&v10.c = v3;
    *(_OWORD *)&v10.tx = v4;
    CGAffineTransformRotate(&v11, &v10, 3.14149265);
  }
  CGAffineTransform v9 = v11;
  CGFloat v5 = [*(id *)(a1 + 32) expandButton];
  CGAffineTransform v8 = v9;
  [v5 setTransform:&v8];

  if ([*(id *)(a1 + 32) isHighlighted]) {
    double v6 = 0.75;
  }
  else {
    double v6 = 0.55;
  }
  int v7 = [*(id *)(a1 + 32) actionImageView];
  [v7 setAlpha:v6];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardActionCell;
  [(CNAvatarCardActionCell *)&v4 prepareForReuse];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CNAvatarCardActionCell_prepareForReuse__block_invoke;
  v3[3] = &unk_1E549B488;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __41__CNAvatarCardActionCell_prepareForReuse__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFonts];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)CNAvatarCardActionCell;
  -[CNAvatarCardActionCell setHighlighted:animated:](&v6, sel_setHighlighted_animated_, a3);
  [(CNAvatarCardActionCell *)self _updateHighlightAnimated:v4];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)awakeFromNib
{
  v12.receiver = self;
  v12.super_class = (Class)CNAvatarCardActionCell;
  [(CNAvatarCardActionCell *)&v12 awakeFromNib];
  [(CNAvatarCardActionCell *)self setSelectionStyle:0];
  long long v3 = [(CNAvatarCardActionCell *)self translatingViewLeadingConstraint];
  [v3 constant];
  -[CNAvatarCardActionCell setInitialTranslatingViewLeadingConstraintConstant:](self, "setInitialTranslatingViewLeadingConstraintConstant:");

  [(CNAvatarCardActionCell *)self setPreservesSuperviewLayoutMargins:0];
  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  -[CNAvatarCardActionCell setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E4FB2848], v5, v6, v7);
  -[CNAvatarCardActionCell setSeparatorInset:](self, "setSeparatorInset:", v4, v5, v6, v7);
  CGAffineTransform v8 = +[CNUIColorRepository navigationListCellTitleTextColorRegular];
  [(UILabel *)self->_titleLabel setTextColor:v8];

  CGAffineTransform v9 = +[CNUIColorRepository navigationListCellSubtitleTextColorRegular];
  [(UILabel *)self->_subtitleLabel setTextColor:v9];

  [(CNAvatarCardActionCell *)self _updateFonts];
  expandButton = self->_expandButton;
  if (expandButton)
  {
    CGAffineTransform v11 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForNavigationListChevron");
    [(UIButton *)expandButton setImage:v11 forState:0];
  }
}

- (void)_updateFonts
{
  long long v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:2];
  double v5 = [v3 fontWithDescriptor:v4 size:0.0];
  double v6 = [(CNAvatarCardActionCell *)self titleLabel];
  [v6 setFont:v5];

  double v7 = (void *)MEMORY[0x1E4FB08E0];
  id v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0 options:2];
  CGAffineTransform v8 = [v7 fontWithDescriptor:v10 size:0.0];
  CGAffineTransform v9 = [(CNAvatarCardActionCell *)self subtitleLabel];
  [v9 setFont:v8];
}

+ (id)cellNibForContacts
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CNAvatarCardActionCell_cellNibForContacts__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellNibForContacts_onceToken != -1) {
    dispatch_once(&cellNibForContacts_onceToken, block);
  }
  long long v2 = (void *)cellNibForContacts_nib;

  return v2;
}

void __44__CNAvatarCardActionCell_cellNibForContacts__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB19F8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 nibWithNibName:@"CNAvatarCardActionCell-Contact-OrbHW" bundle:v3];
  long long v2 = (void *)cellNibForContacts_nib;
  cellNibForContacts_nib = v1;
}

+ (id)cellNibForActions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CNAvatarCardActionCell_cellNibForActions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellNibForActions_onceToken != -1) {
    dispatch_once(&cellNibForActions_onceToken, block);
  }
  long long v2 = (void *)cellNibForActions_nib;

  return v2;
}

void __43__CNAvatarCardActionCell_cellNibForActions__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB19F8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 nibWithNibName:@"CNAvatarCardActionCell-Expand-OrbHW" bundle:v3];
  long long v2 = (void *)cellNibForActions_nib;
  cellNibForActions_nib = v1;
}

@end