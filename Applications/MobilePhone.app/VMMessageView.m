@interface VMMessageView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)shouldDisplayTranscript;
- (BOOL)showsPlayerControls;
- (BOOL)subviewsLayoutConstraintsLoaded;
- (BOOL)subviewsLoaded;
- (NSArray)playerControlsViewLayoutConstraints;
- (NSLayoutConstraint)playerControlsViewBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)playerControlsViewTopAnchorLayoutConstraint;
- (NSLayoutConstraint)transcriptSeparatorViewTopAnchorLayoutConstraint;
- (NSString)localizedDate;
- (NSString)localizedHeadline;
- (NSString)localizedSubheadline;
- (UIView)transcriptSeparatorView;
- (VMMessageHeaderView)headerView;
- (VMMessageTranscriptView)transcriptView;
- (VMMessageView)init;
- (VMMessageView)initWithCoder:(id)a3;
- (VMMessageView)initWithFrame:(CGRect)a3;
- (VMPlayerControlsView)playerControlsView;
- (double)playerControlsViewTopAnchorLayoutConstraintConstant;
- (double)transcriptSeparatorViewTopAnchorLayoutConstraintConstant;
- (void)commonInit;
- (void)loadSubviews;
- (void)loadSubviewsLayoutConstraints;
- (void)setHeaderView:(id)a3;
- (void)setLocalizedDate:(id)a3;
- (void)setLocalizedHeadline:(id)a3;
- (void)setLocalizedSubheadline:(id)a3;
- (void)setPlayerControlsView:(id)a3;
- (void)setPlayerControlsViewBottomAnchorLayoutConstraint:(id)a3;
- (void)setPlayerControlsViewLayoutConstraints:(id)a3;
- (void)setPlayerControlsViewTopAnchorLayoutConstraint:(id)a3;
- (void)setShouldDisplayTranscript:(BOOL)a3;
- (void)setShowsPlayerControls:(BOOL)a3;
- (void)setShowsPlayerControls:(BOOL)a3 animated:(BOOL)a4;
- (void)setSubviewsLayoutConstraintsLoaded:(BOOL)a3;
- (void)setSubviewsLoaded:(BOOL)a3;
- (void)setTranscriptSeparatorView:(id)a3;
- (void)setTranscriptSeparatorViewTopAnchorLayoutConstraint:(id)a3;
- (void)setTranscriptView:(id)a3;
- (void)updateConstraints;
- (void)updateConstraintsConstants;
@end

@implementation VMMessageView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (VMMessageView)init
{
  return -[VMMessageView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (VMMessageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VMMessageView;
  v3 = -[VMMessageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VMMessageView *)v3 commonInit];
  }
  return v4;
}

- (VMMessageView)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)localizedDate
{
  v2 = [(VMMessageView *)self headerView];
  v3 = [v2 localizedDate];

  return (NSString *)v3;
}

- (void)setLocalizedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(VMMessageView *)self headerView];
  [v5 setLocalizedDate:v4];
}

- (NSString)localizedHeadline
{
  v2 = [(VMMessageView *)self headerView];
  v3 = [v2 localizedHeadline];

  return (NSString *)v3;
}

- (void)setLocalizedHeadline:(id)a3
{
  id v4 = a3;
  id v5 = [(VMMessageView *)self headerView];
  [v5 setLocalizedHeadline:v4];
}

- (NSString)localizedSubheadline
{
  v2 = [(VMMessageView *)self headerView];
  v3 = [v2 localizedSubheadline];

  return (NSString *)v3;
}

- (void)setLocalizedSubheadline:(id)a3
{
  id v4 = a3;
  id v5 = [(VMMessageView *)self headerView];
  [v5 setLocalizedSubheadline:v4];
}

- (void)setPlayerControlsView:(id)a3
{
  id v5 = (VMPlayerControlsView *)a3;
  p_playerControlsView = &self->_playerControlsView;
  playerControlsView = self->_playerControlsView;
  v14 = v5;
  if (playerControlsView != v5)
  {
    v8 = [(VMPlayerControlsView *)playerControlsView superview];

    if (v8)
    {
      [(VMMessageView *)self setPlayerControlsViewLayoutConstraints:0];
      [(VMPlayerControlsView *)*p_playerControlsView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_playerControlsView, a3);
    if (*p_playerControlsView)
    {
      [(VMPlayerControlsView *)*p_playerControlsView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v9) = 1148846080;
      [(VMPlayerControlsView *)*p_playerControlsView setContentCompressionResistancePriority:0 forAxis:v9];
      LODWORD(v10) = 1132068864;
      [(VMPlayerControlsView *)*p_playerControlsView setContentCompressionResistancePriority:1 forAxis:v10];
      LODWORD(v11) = 1144750080;
      [(VMPlayerControlsView *)*p_playerControlsView setContentHuggingPriority:0 forAxis:v11];
      LODWORD(v12) = 1148846080;
      [(VMPlayerControlsView *)*p_playerControlsView setContentHuggingPriority:1 forAxis:v12];
      [(VMMessageView *)self addSubview:*p_playerControlsView];
      v13 = [(VMMessageView *)self playerControlsViewLayoutConstraints];
      if (v13) {
        +[NSLayoutConstraint activateConstraints:v13];
      }
    }
  }
}

- (void)setShowsPlayerControls:(BOOL)a3
{
}

- (void)setShowsPlayerControls:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsPlayerControls != a3)
  {
    self->_showsPlayerControls = a3;
    -[VMPlayerControlsView setHidden:](self->_playerControlsView, "setHidden:", !a3, a4);
    [(VMMessageView *)self setNeedsLayout];
    [(VMMessageView *)self layoutIfNeeded];
  }
}

- (void)setShouldDisplayTranscript:(BOOL)a3
{
  if (self->_shouldDisplayTranscript != a3)
  {
    self->_shouldDisplayTranscript = a3;
    transcriptSeparatorView = self->_transcriptSeparatorView;
    if (a3)
    {
      [(UIView *)transcriptSeparatorView setHidden:0];
      [(VMMessageTranscriptView *)self->_transcriptView setHidden:0];
      id v5 = [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraint];
      LODWORD(v6) = 1148829696;
      [v5 setPriority:v6];

      v7 = [(VMMessageView *)self playerControlsViewBottomAnchorLayoutConstraint];
      LODWORD(v8) = 1.0;
    }
    else
    {
      [(UIView *)transcriptSeparatorView setHidden:1];
      [(VMMessageTranscriptView *)self->_transcriptView setHidden:1];
      double v9 = [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraint];
      LODWORD(v10) = 1.0;
      [v9 setPriority:v10];

      v7 = [(VMMessageView *)self playerControlsViewBottomAnchorLayoutConstraint];
      LODWORD(v8) = 1148829696;
    }
    id v11 = v7;
    [v7 setPriority:v8];
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)VMMessageView;
  [(VMMessageView *)&v3 updateConstraints];
  if ([(VMMessageView *)self subviewsLayoutConstraintsLoaded]) {
    [(VMMessageView *)self updateConstraintsConstants];
  }
  else {
    [(VMMessageView *)self loadSubviewsLayoutConstraints];
  }
}

- (void)updateConstraintsConstants
{
  [(VMMessageView *)self playerControlsViewTopAnchorLayoutConstraintConstant];
  double v4 = v3;
  id v5 = [(VMMessageView *)self playerControlsViewTopAnchorLayoutConstraint];
  [v5 setConstant:v4];

  [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraintConstant];
  double v7 = v6;
  double v8 = [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraint];
  [v8 setConstant:v7];

  double v9 = [(VMMessageView *)self headerView];
  [v9 updateConstraintsConstants];

  id v10 = [(VMMessageView *)self transcriptView];
  [v10 updateConstraintsConstants];
}

- (void)commonInit
{
  self->_subviewsLayoutConstraintsLoaded = 0;
  self->_subviewsLoaded = 0;
  self->_showsPlayerControls = 0;
  double v3 = +[UIColor dynamicBackgroundColor];
  [(VMMessageView *)self setBackgroundColor:v3];

  [(VMMessageView *)self loadSubviews];
}

- (void)loadSubviews
{
  if (!self->_subviewsLoaded)
  {
    double v3 = objc_alloc_init(VMMessageHeaderView);
    headerView = self->_headerView;
    self->_headerView = v3;

    [(VMMessageHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1144750080;
    [(VMMessageHeaderView *)self->_headerView setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(VMMessageHeaderView *)self->_headerView setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1132068864;
    [(VMMessageHeaderView *)self->_headerView setContentHuggingPriority:0 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(VMMessageHeaderView *)self->_headerView setContentHuggingPriority:1 forAxis:v8];
    double v9 = objc_alloc_init(VMPlayerControlsView);
    playerControlsView = self->_playerControlsView;
    self->_playerControlsView = v9;

    [(VMPlayerControlsView *)self->_playerControlsView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v11) = 1148846080;
    [(VMPlayerControlsView *)self->_playerControlsView setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(VMPlayerControlsView *)self->_playerControlsView setContentCompressionResistancePriority:1 forAxis:v12];
    LODWORD(v13) = 1132068864;
    [(VMPlayerControlsView *)self->_playerControlsView setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(VMPlayerControlsView *)self->_playerControlsView setContentHuggingPriority:1 forAxis:v14];
    v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    transcriptSeparatorView = self->_transcriptSeparatorView;
    self->_transcriptSeparatorView = v15;

    v17 = +[UIColor systemMidGrayColor];
    [(UIView *)self->_transcriptSeparatorView setBackgroundColor:v17];

    [(UIView *)self->_transcriptSeparatorView setHidden:1];
    [(UIView *)self->_transcriptSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_transcriptSeparatorView setUserInteractionEnabled:0];
    v18 = objc_alloc_init(VMMessageTranscriptView);
    transcriptView = self->_transcriptView;
    self->_transcriptView = v18;

    [(VMMessageTranscriptView *)self->_transcriptView setHidden:1];
    [(VMMessageTranscriptView *)self->_transcriptView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VMMessageView *)self addSubview:self->_headerView];
    [(VMMessageView *)self addSubview:self->_playerControlsView];
    [(VMMessageView *)self addSubview:self->_transcriptSeparatorView];
    [(VMMessageView *)self addSubview:self->_transcriptView];
    self->_subviewsLoaded = 1;
  }
}

- (void)loadSubviewsLayoutConstraints
{
  if (!self->_subviewsLayoutConstraintsLoaded)
  {
    double v3 = [(VMMessageHeaderView *)self->_headerView leadingAnchor];
    double v4 = [(VMMessageView *)self leadingAnchor];
    double v5 = [v3 constraintEqualToAnchor:v4 constant:20.0];
    [v5 setActive:1];

    double v6 = [(VMMessageHeaderView *)self->_headerView trailingAnchor];
    double v7 = [(VMMessageView *)self trailingAnchor];
    double v8 = [v6 constraintLessThanOrEqualToAnchor:v7 constant:-20.0];
    [v8 setActive:1];

    double v9 = [(VMMessageHeaderView *)self->_headerView topAnchor];
    id v10 = [(VMMessageView *)self topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    id v32 = [(VMMessageView *)self playerControlsViewLayoutConstraints];
    if (v32) {
      +[NSLayoutConstraint activateConstraints:v32];
    }
    double v12 = [(UIView *)self->_transcriptSeparatorView leadingAnchor];
    double v13 = [(VMMessageView *)self leadingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [(UIView *)self->_transcriptSeparatorView trailingAnchor];
    v16 = [(VMMessageView *)self trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(UIView *)self->_transcriptSeparatorView heightAnchor];
    v19 = [v18 constraintEqualToConstant:0.5];
    [v19 setActive:1];

    v20 = [(VMMessageTranscriptView *)self->_transcriptView leadingAnchor];
    v21 = [(VMMessageView *)self leadingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:20.0];
    [v22 setActive:1];

    v23 = [(VMMessageTranscriptView *)self->_transcriptView trailingAnchor];
    v24 = [(VMMessageView *)self trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-20.0];
    [v25 setActive:1];

    v26 = [(VMMessageTranscriptView *)self->_transcriptView topAnchor];
    v27 = [(UIView *)self->_transcriptSeparatorView bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v28 setActive:1];

    v29 = [(VMMessageTranscriptView *)self->_transcriptView bottomAnchor];
    v30 = [(VMMessageView *)self bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    self->_subviewsLayoutConstraintsLoaded = 1;
  }
}

- (double)playerControlsViewTopAnchorLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)transcriptSeparatorViewTopAnchorLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = ceil(v3);

  return v4;
}

- (NSArray)playerControlsViewLayoutConstraints
{
  playerControlsViewLayoutConstraints = self->_playerControlsViewLayoutConstraints;
  if (!playerControlsViewLayoutConstraints)
  {
    double v4 = +[NSMutableArray array];
    double v5 = [(VMPlayerControlsView *)self->_playerControlsView topAnchor];
    double v6 = [(VMMessageHeaderView *)self->_headerView dateLabel];
    double v7 = [v6 firstBaselineAnchor];
    [(VMMessageView *)self playerControlsViewTopAnchorLayoutConstraintConstant];
    double v8 = [v5 constraintEqualToAnchor:v7];

    if (v8)
    {
      [(VMMessageView *)self setPlayerControlsViewTopAnchorLayoutConstraint:v8];
      [v4 addObject:v8];
    }
    double v9 = [(VMPlayerControlsView *)self->_playerControlsView leadingAnchor];
    id v10 = [(VMMessageView *)self leadingAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10 constant:20.0];

    if (v11) {
      [v4 addObject:v11];
    }
    double v12 = [(VMPlayerControlsView *)self->_playerControlsView trailingAnchor];
    double v13 = [(VMMessageView *)self trailingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13 constant:-16.0];

    if (v14) {
      [v4 addObject:v14];
    }
    v15 = [(UIView *)self->_transcriptSeparatorView topAnchor];
    v16 = [(VMPlayerControlsView *)self->_playerControlsView bottomAnchor];
    [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraintConstant];
    v17 = [v15 constraintEqualToAnchor:v16];

    if (v17)
    {
      unsigned int v18 = [(VMMessageView *)self shouldDisplayTranscript];
      LODWORD(v19) = 1148829696;
      if (!v18) {
        *(float *)&double v19 = 1.0;
      }
      [v17 setPriority:v19];
      [(VMMessageView *)self setTranscriptSeparatorViewTopAnchorLayoutConstraint:v17];
      [v4 addObject:v17];
    }
    v20 = [(VMPlayerControlsView *)self->_playerControlsView bottomAnchor];
    v21 = [(VMMessageView *)self bottomAnchor];
    [(VMMessageView *)self transcriptSeparatorViewTopAnchorLayoutConstraintConstant];
    v23 = [v20 constraintEqualToAnchor:v21 constant:-v22];

    if (v23)
    {
      unsigned int v24 = [(VMMessageView *)self shouldDisplayTranscript];
      LODWORD(v25) = 1148829696;
      if (v24) {
        *(float *)&double v25 = 1.0;
      }
      [v23 setPriority:v25];
      [(VMMessageView *)self setPlayerControlsViewBottomAnchorLayoutConstraint:v23];
      [v4 addObject:v23];
    }
    if ([v4 count])
    {
      v26 = (NSArray *)[v4 copy];
      v27 = self->_playerControlsViewLayoutConstraints;
      self->_playerControlsViewLayoutConstraints = v26;
    }
    playerControlsViewLayoutConstraints = self->_playerControlsViewLayoutConstraints;
  }

  return playerControlsViewLayoutConstraints;
}

- (void)setPlayerControlsViewLayoutConstraints:(id)a3
{
  p_playerControlsViewLayoutConstraints = (id *)&self->_playerControlsViewLayoutConstraints;
  id v5 = a3;
  if (*p_playerControlsViewLayoutConstraints != v5)
  {
    if (*p_playerControlsViewLayoutConstraints) {
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    }
    objc_storeStrong(p_playerControlsViewLayoutConstraints, a3);
    if (*p_playerControlsViewLayoutConstraints) {
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
    }
  }
}

- (BOOL)shouldDisplayTranscript
{
  return self->_shouldDisplayTranscript;
}

- (BOOL)showsPlayerControls
{
  return self->_showsPlayerControls;
}

- (VMPlayerControlsView)playerControlsView
{
  return self->_playerControlsView;
}

- (VMMessageTranscriptView)transcriptView
{
  return self->_transcriptView;
}

- (void)setTranscriptView:(id)a3
{
}

- (VMMessageHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)transcriptSeparatorView
{
  return self->_transcriptSeparatorView;
}

- (void)setTranscriptSeparatorView:(id)a3
{
}

- (NSLayoutConstraint)playerControlsViewTopAnchorLayoutConstraint
{
  return self->_playerControlsViewTopAnchorLayoutConstraint;
}

- (void)setPlayerControlsViewTopAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)playerControlsViewBottomAnchorLayoutConstraint
{
  return self->_playerControlsViewBottomAnchorLayoutConstraint;
}

- (void)setPlayerControlsViewBottomAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)transcriptSeparatorViewTopAnchorLayoutConstraint
{
  return self->_transcriptSeparatorViewTopAnchorLayoutConstraint;
}

- (void)setTranscriptSeparatorViewTopAnchorLayoutConstraint:(id)a3
{
}

- (BOOL)subviewsLoaded
{
  return self->_subviewsLoaded;
}

- (void)setSubviewsLoaded:(BOOL)a3
{
  self->_subviewsLoaded = a3;
}

- (BOOL)subviewsLayoutConstraintsLoaded
{
  return self->_subviewsLayoutConstraintsLoaded;
}

- (void)setSubviewsLayoutConstraintsLoaded:(BOOL)a3
{
  self->_subviewsLayoutConstraintsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptSeparatorViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_playerControlsViewBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_playerControlsViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_transcriptSeparatorView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_transcriptView, 0);
  objc_storeStrong((id *)&self->_playerControlsView, 0);

  objc_storeStrong((id *)&self->_playerControlsViewLayoutConstraints, 0);
}

@end