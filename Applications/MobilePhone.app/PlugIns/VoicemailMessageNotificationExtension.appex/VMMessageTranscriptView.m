@interface VMMessageTranscriptView
- (BOOL)hideAccessoryViews;
- (BOOL)shouldShowFeedbackTextView;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSLayoutConstraint)feedbackTextViewBottomLayoutConstraint;
- (NSLayoutConstraint)feedbackTextViewLeadingLayoutConstraint;
- (NSLayoutConstraint)feedbackTextViewTopLayoutConstraint;
- (NSLayoutConstraint)feedbackTextViewTrailingLayoutConstraint;
- (NSLayoutConstraint)indicatorViewCenterXLayoutConstraint;
- (NSLayoutConstraint)indicatorViewTopLayoutConstraint;
- (NSLayoutConstraint)textViewBottomLayoutConstraint;
- (NSLayoutConstraint)textViewFirstBaselineLayoutConstraint;
- (NSLayoutConstraint)textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint;
- (NSLayoutConstraint)textViewLastBaselineLayoutConstraint;
- (NSLayoutConstraint)textViewLeadingLayoutConstraint;
- (NSLayoutConstraint)textViewTrailingLayoutConstraint;
- (NSLayoutConstraint)titleLabelFirstBaselineLayoutConstraint;
- (NSLayoutConstraint)titleLabelLastBaselineLayoutConstraint;
- (NSLayoutConstraint)titleLabelLeadingLayoutConstraint;
- (NSLayoutConstraint)titleLabelTopLayoutConstraint;
- (NSLayoutConstraint)titleLabelTrailingLayoutConstraint;
- (TUFeatureFlags)featureFlags;
- (UIActivityIndicatorView)indicatorView;
- (UILabel)titleLabel;
- (UITextView)feedbackTextView;
- (UITextView)textView;
- (VMMessageTranscriptViewDelegate)delegate;
- (VMMessageTranscriptViewModel)viewModel;
- (double)indicatorViewTopLayoutConstraintConstant;
- (double)textViewFirstBaselineLayoutConstraintConstant;
- (double)textViewLastBaselineLayoutConstraintConstant;
- (double)textViewLineHeight;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (void)_refreshAttributedText;
- (void)commonInit;
- (void)handleFeedbackTextViewTapGesture:(id)a3;
- (void)handleTextViewTapGesture:(id)a3;
- (void)loadConstraints;
- (void)openFeedbackURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackTextView:(id)a3;
- (void)setFeedbackTextViewBottomLayoutConstraint:(id)a3;
- (void)setFeedbackTextViewLeadingLayoutConstraint:(id)a3;
- (void)setFeedbackTextViewTopLayoutConstraint:(id)a3;
- (void)setFeedbackTextViewTrailingLayoutConstraint:(id)a3;
- (void)setHideAccessoryViews:(BOOL)a3;
- (void)setIndicatorView:(id)a3;
- (void)setIndicatorViewCenterXLayoutConstraint:(id)a3;
- (void)setIndicatorViewTopLayoutConstraint:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewBottomLayoutConstraint:(id)a3;
- (void)setTextViewFirstBaselineLayoutConstraint:(id)a3;
- (void)setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:(id)a3;
- (void)setTextViewLastBaselineLayoutConstraint:(id)a3;
- (void)setTextViewLeadingLayoutConstraint:(id)a3;
- (void)setTextViewTrailingLayoutConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelFirstBaselineLayoutConstraint:(id)a3;
- (void)setTitleLabelLastBaselineLayoutConstraint:(id)a3;
- (void)setTitleLabelLeadingLayoutConstraint:(id)a3;
- (void)setTitleLabelTopLayoutConstraint:(id)a3;
- (void)setTitleLabelTrailingLayoutConstraint:(id)a3;
- (void)setViewModel:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraintsConstants;
@end

@implementation VMMessageTranscriptView

- (void)commonInit
{
  v43.receiver = self;
  v43.super_class = (Class)VMMessageTranscriptView;
  [(VMMessageTranscriptView *)&v43 commonInit];
  [(VMMessageTranscriptView *)self setClipsToBounds:1];
  v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
  featureFlags = self->_featureFlags;
  self->_featureFlags = v3;

  id v5 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:0];
  [(UILabel *)self->_titleLabel setLineBreakMode:4];
  [(UILabel *)self->_titleLabel setTextAlignment:4];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE" value:&stru_10005E8B0 table:@"VoicemailUI"];
  [(UILabel *)self->_titleLabel setText:v12];

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setUserInteractionEnabled:0];
  [(VMMessageTranscriptView *)self addSubview:self->_titleLabel];
  v13 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, y, width, height];
  textView = self->_textView;
  self->_textView = v13;

  v15 = +[UIColor clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v15];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[UITextView setContentInset:](self->_textView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  [(UITextView *)self->_textView setDataDetectorTypes:-1];
  [(UITextView *)self->_feedbackTextView setDelaysContentTouches:0];
  [(UITextView *)self->_textView setEditable:0];
  [(VMMessageTranscriptView *)self textViewLineHeight];
  -[UITextView setLineHeight:](self->_textView, "setLineHeight:");
  [(UITextView *)self->_textView setScrollEnabled:0];
  v19 = [(UITextView *)self->_textView textContainer];
  [v19 setLineBreakMode:4];

  v20 = [(UITextView *)self->_textView textContainer];
  [v20 setLineFragmentPadding:0.0];

  v21 = [(UITextView *)self->_textView textContainer];
  [v21 setMaximumNumberOfLines:0];

  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);
  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView setUserInteractionEnabled:1];
  [(UITextView *)self->_textView setTextAlignment:4];
  [(VMMessageTranscriptView *)self addSubview:self->_textView];
  if (CPIsInternalDevice())
  {
    id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTextViewTapGesture:"];
    [v22 setNumberOfTouchesRequired:2];
    [(VMMessageTranscriptView *)self addGestureRecognizer:v22];
  }
  v23 = (UITextView *)objc_alloc_init((Class)UITextView);
  feedbackTextView = self->_feedbackTextView;
  self->_feedbackTextView = v23;

  v25 = +[UIColor clearColor];
  [(UITextView *)self->_feedbackTextView setBackgroundColor:v25];

  -[UITextView setContentInset:](self->_feedbackTextView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  [(UITextView *)self->_feedbackTextView setDataDetectorTypes:2];
  [(UITextView *)self->_feedbackTextView setDelaysContentTouches:0];
  [(UITextView *)self->_feedbackTextView setEditable:0];
  NSAttributedStringKey v45 = NSForegroundColorAttributeName;
  v26 = +[UIColor systemBlueColor];
  v46 = v26;
  v27 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  [(UITextView *)self->_feedbackTextView setLinkTextAttributes:v27];

  [(UITextView *)self->_feedbackTextView setScrollEnabled:0];
  [(UITextView *)self->_feedbackTextView setSelectable:0];
  v28 = [(UITextView *)self->_feedbackTextView textContainer];
  [v28 setLineFragmentPadding:0.0];

  v29 = [(UITextView *)self->_feedbackTextView textContainer];
  [v29 setMaximumNumberOfLines:0];

  -[UITextView setTextContainerInset:](self->_feedbackTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);
  [(UITextView *)self->_feedbackTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_feedbackTextView setTextAlignment:4];
  [(VMMessageTranscriptView *)self addSubview:self->_feedbackTextView];
  id v30 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleFeedbackTextViewTapGesture:"];
  [(UITextView *)self->_feedbackTextView addGestureRecognizer:v30];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v31 = [(UITextView *)self->_feedbackTextView gestureRecognizers];
  id v32 = [v31 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v36 setEnabled:0];
        }
      }
      id v33 = [v31 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v33);
  }

  v37 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  indicatorView = self->_indicatorView;
  self->_indicatorView = v37;

  [(UIActivityIndicatorView *)self->_indicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_indicatorView setUserInteractionEnabled:0];
  [(VMMessageTranscriptView *)self addSubview:self->_indicatorView];
}

- (void)loadConstraints
{
  v3 = [(VMMessageTranscriptView *)self indicatorView];
  v4 = [v3 topAnchor];
  id v5 = [(VMMessageTranscriptView *)self topAnchor];
  [(VMMessageTranscriptView *)self indicatorViewTopLayoutConstraintConstant];
  v6 = [v4 constraintEqualToAnchor:v5];

  v7 = NSStringFromSelector("indicatorViewTopLayoutConstraint");
  [v6 setIdentifier:v7];

  [v6 setActive:1];
  [(VMMessageTranscriptView *)self setIndicatorViewTopLayoutConstraint:v6];
  v8 = [(VMMessageTranscriptView *)self indicatorView];
  v9 = [v8 centerXAnchor];
  v10 = [(VMMessageTranscriptView *)self centerXAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];

  v12 = NSStringFromSelector("indicatorViewCenterXLayoutConstraint");
  [v11 setIdentifier:v12];

  [v11 setActive:1];
  [(VMMessageTranscriptView *)self setIndicatorViewCenterXLayoutConstraint:v11];
  v13 = [(VMMessageTranscriptView *)self titleLabel];
  v14 = [v13 firstBaselineAnchor];
  v15 = [(VMMessageTranscriptView *)self indicatorView];
  v16 = [v15 bottomAnchor];
  [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraintConstant];
  v17 = [v14 constraintEqualToAnchor:v16];

  v18 = NSStringFromSelector("titleLabelTopLayoutConstraint");
  [v17 setIdentifier:v18];

  LODWORD(v19) = 1.0;
  [v17 setPriority:v19];
  [v17 setActive:1];
  [(VMMessageTranscriptView *)self setTitleLabelTopLayoutConstraint:v17];
  v20 = [(VMMessageTranscriptView *)self titleLabel];
  v21 = [v20 firstBaselineAnchor];
  id v22 = [(VMMessageTranscriptView *)self topAnchor];
  [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraintConstant];
  v23 = [v21 constraintEqualToAnchor:v22];

  v24 = NSStringFromSelector("titleLabelFirstBaselineLayoutConstraint");
  [v23 setIdentifier:v24];

  LODWORD(v25) = 1148829696;
  [v23 setPriority:v25];
  [v23 setActive:1];
  [(VMMessageTranscriptView *)self setTitleLabelFirstBaselineLayoutConstraint:v23];
  v26 = [(VMMessageTranscriptView *)self titleLabel];
  v27 = [v26 leadingAnchor];
  v28 = [(VMMessageTranscriptView *)self leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];

  id v30 = NSStringFromSelector("titleLabelLeadingLayoutConstraint");
  [v29 setIdentifier:v30];

  [v29 setActive:1];
  [(VMMessageTranscriptView *)self setTitleLabelLeadingLayoutConstraint:v29];
  v31 = [(VMMessageTranscriptView *)self trailingAnchor];
  id v32 = [(VMMessageTranscriptView *)self titleLabel];
  id v33 = [v32 trailingAnchor];
  uint64_t v34 = [v31 constraintGreaterThanOrEqualToAnchor:v33];

  v35 = NSStringFromSelector("titleLabelTrailingLayoutConstraint");
  [v34 setIdentifier:v35];

  [v34 setActive:1];
  [(VMMessageTranscriptView *)self setTitleLabelTrailingLayoutConstraint:v34];
  v36 = [(VMMessageTranscriptView *)self textView];
  v37 = [v36 leadingAnchor];
  v38 = [(VMMessageTranscriptView *)self leadingAnchor];
  long long v39 = [v37 constraintEqualToAnchor:v38];

  long long v40 = NSStringFromSelector("textViewLeadingLayoutConstraint");
  [v39 setIdentifier:v40];

  [v39 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewLeadingLayoutConstraint:v39];
  long long v41 = [(VMMessageTranscriptView *)self trailingAnchor];
  long long v42 = [(VMMessageTranscriptView *)self textView];
  objc_super v43 = [v42 trailingAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];

  NSAttributedStringKey v45 = NSStringFromSelector("textViewTrailingLayoutConstraint");
  [v44 setIdentifier:v45];

  [v44 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewTrailingLayoutConstraint:v44];
  v46 = [(VMMessageTranscriptView *)self textView];
  v47 = [v46 firstBaselineAnchor];
  v48 = [(VMMessageTranscriptView *)self titleLabel];
  v49 = [v48 lastBaselineAnchor];
  [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraintConstant];
  v50 = [v47 constraintEqualToAnchor:v49];

  LODWORD(v51) = 1148829696;
  [v50 setPriority:v51];
  v52 = NSStringFromSelector("textViewFirstBaselineLayoutConstraint");
  [v50 setIdentifier:v52];

  [v50 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewFirstBaselineLayoutConstraint:v50];
  v53 = [(VMMessageTranscriptView *)self feedbackTextView];
  v54 = [v53 topAnchor];
  v55 = [(VMMessageTranscriptView *)self textView];
  v56 = [v55 lastBaselineAnchor];
  [(VMMessageTranscriptView *)self textViewLastBaselineLayoutConstraintConstant];
  v57 = [v54 constraintGreaterThanOrEqualToAnchor:v56];

  v58 = NSStringFromSelector("textViewLastBaselineLayoutConstraint");
  [v57 setIdentifier:v58];

  [v57 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewLastBaselineLayoutConstraint:v57];
  v59 = [(VMMessageTranscriptView *)self textView];
  v60 = [v59 firstBaselineAnchor];
  v61 = [(VMMessageTranscriptView *)self topAnchor];
  [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraintConstant];
  v62 = [v60 constraintEqualToAnchor:v61];

  LODWORD(v63) = 1.0;
  [v62 setPriority:v63];
  v64 = NSStringFromSelector("textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint");
  [v62 setIdentifier:v64];

  [v62 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:v62];
  v65 = [(VMMessageTranscriptView *)self bottomAnchor];
  v66 = [(VMMessageTranscriptView *)self textView];
  v67 = [v66 lastBaselineAnchor];
  [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraintConstant];
  v68 = [v65 constraintEqualToAnchor:v67];

  LODWORD(v69) = 1.0;
  [v68 setPriority:v69];
  v70 = NSStringFromSelector("textViewBottomLayoutConstraint");
  [v68 setIdentifier:v70];

  [v68 setActive:1];
  [(VMMessageTranscriptView *)self setTextViewBottomLayoutConstraint:v68];
  v71 = [(VMMessageTranscriptView *)self feedbackTextView];
  v72 = [v71 leadingAnchor];
  v73 = [(VMMessageTranscriptView *)self leadingAnchor];
  v74 = [v72 constraintGreaterThanOrEqualToAnchor:v73];

  v75 = NSStringFromSelector("feedbackTextViewLeadingLayoutConstraint");
  [v74 setIdentifier:v75];

  [v74 setActive:1];
  [(VMMessageTranscriptView *)self setFeedbackTextViewLeadingLayoutConstraint:v74];
  v76 = [(VMMessageTranscriptView *)self trailingAnchor];
  v77 = [(VMMessageTranscriptView *)self feedbackTextView];
  v78 = [v77 trailingAnchor];
  v79 = [v76 constraintGreaterThanOrEqualToAnchor:v78];

  v80 = NSStringFromSelector("feedbackTextViewTrailingLayoutConstraint");
  [v79 setIdentifier:v80];

  [v79 setActive:1];
  [(VMMessageTranscriptView *)self setFeedbackTextViewTrailingLayoutConstraint:v79];
  v81 = [(VMMessageTranscriptView *)self textViewLastBaselineLayoutConstraint];
  [(VMMessageTranscriptView *)self setFeedbackTextViewTopLayoutConstraint:v81];

  v82 = [(VMMessageTranscriptView *)self bottomAnchor];
  v83 = [(VMMessageTranscriptView *)self feedbackTextView];
  v84 = [v83 lastBaselineAnchor];
  [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraintConstant];
  v85 = [v82 constraintEqualToAnchor:v84];

  v86 = NSStringFromSelector("feedbackTextViewBottomLayoutConstraint");
  [v85 setIdentifier:v86];

  [v85 setActive:1];
  [(VMMessageTranscriptView *)self setFeedbackTextViewBottomLayoutConstraint:v85];
  v87.receiver = self;
  v87.super_class = (Class)VMMessageTranscriptView;
  [(VMMessageTranscriptView *)&v87 loadConstraints];
}

- (void)updateConstraintsConstants
{
  v33.receiver = self;
  v33.super_class = (Class)VMMessageTranscriptView;
  [(VMMessageTranscriptView *)&v33 updateConstraintsConstants];
  [(VMMessageTranscriptView *)self _refreshAttributedText];
  [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraintConstant];
  double v4 = v3;
  id v5 = [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraint];
  [v5 setConstant:v4];

  [(VMMessageTranscriptView *)self indicatorViewTopLayoutConstraintConstant];
  double v7 = v6;
  v8 = [(VMMessageTranscriptView *)self indicatorViewTopLayoutConstraint];
  [v8 setConstant:v7];

  [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraintConstant];
  double v10 = v9;
  v11 = [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraint];
  [v11 setConstant:v10];

  [(VMMessageTranscriptView *)self textViewLastBaselineLayoutConstraintConstant];
  double v13 = v12;
  v14 = [(VMMessageTranscriptView *)self textViewLastBaselineLayoutConstraint];
  [v14 setConstant:v13];

  [(VMMessageTranscriptView *)self textViewLineHeight];
  double v16 = v15;
  v17 = [(VMMessageTranscriptView *)self textView];
  [v17 setLineHeight:v16];

  [(VMMessageTranscriptView *)self bounds];
  double Width = CGRectGetWidth(v34);
  double v19 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v19 _setPreferredMaxLayoutWidth:Width];

  v20 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v20 _preferredMaxLayoutWidth];
  double v22 = v21;
  v23 = [(VMMessageTranscriptView *)self textView];
  [v23 _setPreferredMaxLayoutWidth:v22];

  v24 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v24 _preferredMaxLayoutWidth];
  double v26 = v25;
  v27 = [(VMMessageTranscriptView *)self titleLabel];
  [v27 setPreferredMaxLayoutWidth:v26];

  uint64_t v28 = [(VMMessageTranscriptView *)self isAccessiblityConstraintsEnabled] ^ 1;
  v29 = [(VMMessageTranscriptView *)self titleLabel];
  [v29 setNumberOfLines:v28];

  id v30 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v30 sizeToFit];

  v31 = [(VMMessageTranscriptView *)self textView];
  [v31 sizeToFit];

  id v32 = [(VMMessageTranscriptView *)self titleLabel];
  [v32 sizeToFit];
}

- (void)setViewModel:(id)a3
{
  id v5 = (VMMessageTranscriptViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(VMMessageTranscriptViewModel *)self->_viewModel setTintColorDelegate:self];
    [(VMMessageTranscriptView *)self _refreshAttributedText];
    uint64_t v6 = [(VMMessageTranscriptViewModel *)v23 isTranscribing] ^ 1;
    double v7 = [(VMMessageTranscriptView *)self indicatorView];
    [v7 setHidden:v6];

    v8 = [(VMMessageTranscriptView *)self featureFlags];
    unsigned int v9 = [v8 voicemailSearchEnabled];

    BOOL v10 = [(VMMessageTranscriptViewModel *)v23 isTranscribing];
    BOOL v11 = v10;
    if (v9) {
      BOOL v11 = v10 || [(VMMessageTranscriptView *)self hideAccessoryViews];
    }
    double v12 = [(VMMessageTranscriptView *)self feedbackTextView];
    [v12 setHidden:v11];

    unsigned int v13 = [(VMMessageTranscriptViewModel *)v23 isTranscribing];
    v14 = [(VMMessageTranscriptView *)self indicatorView];
    double v15 = v14;
    if (v13)
    {
      [v14 startAnimating];

      double v16 = [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraint];
      LODWORD(v17) = 1.0;
      [v16 setPriority:v17];

      v18 = [(VMMessageTranscriptView *)self titleLabelTopLayoutConstraint];
      double v19 = v18;
      LODWORD(v20) = 1148829696;
    }
    else
    {
      [v14 stopAnimating];

      double v21 = [(VMMessageTranscriptView *)self titleLabelFirstBaselineLayoutConstraint];
      LODWORD(v22) = 1148829696;
      [v21 setPriority:v22];

      v18 = [(VMMessageTranscriptView *)self titleLabelTopLayoutConstraint];
      double v19 = v18;
      LODWORD(v20) = 1.0;
    }
    [v18 setPriority:v20];

    [(VMMessageTranscriptView *)self setNeedsUpdateConstraints];
    id v5 = v23;
  }
}

- (void)setHideAccessoryViews:(BOOL)a3
{
  if (self->_hideAccessoryViews != a3)
  {
    self->_hideAccessoryViews = a3;
    if (a3)
    {
      double v4 = [(VMMessageTranscriptView *)self featureFlags];
      unsigned int v5 = [v4 voicemailSearchEnabled];

      if (v5) {
        [(VMMessageTranscriptView *)self loadConstraints];
      }
      uint64_t v6 = [(VMMessageTranscriptView *)self titleLabel];
      [v6 setHidden:1];

      double v7 = [(VMMessageTranscriptView *)self feedbackTextView];
      [v7 setHidden:1];

      v8 = [(VMMessageTranscriptView *)self textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint];
      LODWORD(v9) = 1148829696;
      [v8 setPriority:v9];

      BOOL v10 = [(VMMessageTranscriptView *)self textViewBottomLayoutConstraint];
      LODWORD(v11) = 1148829696;
      [v10 setPriority:v11];

      double v12 = [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraint];
      id v20 = v12;
      LODWORD(v13) = 1.0;
    }
    else
    {
      v14 = [(VMMessageTranscriptView *)self titleLabel];
      [v14 setHidden:0];

      double v15 = [(VMMessageTranscriptView *)self feedbackTextView];
      [v15 setHidden:0];

      double v16 = [(VMMessageTranscriptView *)self textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint];
      LODWORD(v17) = 1.0;
      [v16 setPriority:v17];

      v18 = [(VMMessageTranscriptView *)self textViewBottomLayoutConstraint];
      LODWORD(v19) = 1.0;
      [v18 setPriority:v19];

      double v12 = [(VMMessageTranscriptView *)self textViewFirstBaselineLayoutConstraint];
      id v20 = v12;
      LODWORD(v13) = 1148829696;
    }
    [v12 setPriority:v13];
  }
}

- (BOOL)shouldShowFeedbackTextView
{
  if (PHVoicemailFeedbackReportingAvailable())
  {
    double v3 = [(VMMessageTranscriptView *)self feedbackTextView];
    double v4 = [v3 attributedText];
    if ([v4 length])
    {
      unsigned int v5 = [(VMMessageTranscriptView *)self viewModel];
      unsigned int v6 = [v5 donated] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)handleFeedbackTextViewTapGesture:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v15;
    if ([v4 state] == (id)3)
    {
      unsigned int v5 = [(VMMessageTranscriptView *)self feedbackTextView];
      [v4 locationInView:v5];
      double v7 = v6;
      double v9 = v8;

      BOOL v10 = [(VMMessageTranscriptView *)self feedbackTextView];
      double v11 = [v10 closestPositionToPoint:v7 v9];

      double v12 = [(VMMessageTranscriptView *)self feedbackTextView];
      double v13 = [v12 textStylingAtPosition:v11 inDirection:0];
      v14 = [v13 objectForKey:NSLinkAttributeName];

      if (v14) {
        [(VMMessageTranscriptView *)self openFeedbackURL:v14];
      }
    }
  }

  _objc_release_x1();
}

- (void)handleTextViewTapGesture:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v8;
    unsigned int v5 = [(VMMessageTranscriptView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(VMMessageTranscriptView *)self delegate];
      [v7 messageTranscriptView:self didReceiveTapGesture:v4];
    }
  }

  _objc_release_x1();
}

- (void)openFeedbackURL:(id)a3
{
  id v25 = [a3 absoluteString];
  id v4 = +[VMMessageTranscriptViewModel neutralFeedbackURL];
  unsigned int v5 = [v4 absoluteString];
  unsigned __int8 v6 = [v25 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = +[VMMessageTranscriptViewModel negativeFeedbackURL];
    double v9 = [v8 absoluteString];
    unsigned __int8 v10 = [v25 isEqualToString:v9];

    if (v10)
    {
      uint64_t v7 = 1;
    }
    else
    {
      double v11 = +[VMMessageTranscriptViewModel positiveFeedbackURL];
      double v12 = [v11 absoluteString];
      unsigned int v13 = [v25 isEqualToString:v12];

      if (v13) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 0;
      }
    }
  }
  v14 = [(VMMessageTranscriptView *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(VMMessageTranscriptView *)self delegate];
    [v16 messageTranscriptView:self didReportFeedback:v7];
  }
  double v17 = [(VMMessageTranscriptView *)self feedbackTextView];
  v18 = [v17 attributedText];
  id v19 = [v18 mutableCopy];

  id v20 = [v19 length];
  double v21 = +[NSBundle mainBundle];
  double v22 = [v21 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_REPORTED" value:&stru_10005E8B0 table:@"VoicemailUI"];
  [v19 replaceCharactersInRange:0 withString:v20];

  [v19 removeAttribute:NSLinkAttributeName range:0, [v19 length]];
  v23 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v23 setAttributedText:v19];

  v24 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v24 sizeToFit];
}

- (double)indicatorViewTopLayoutConstraintConstant
{
  return 30.0;
}

- (double)textViewFirstBaselineLayoutConstraintConstant
{
  v2 = +[UIFont voicemailHeadlineShortFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)textViewLastBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)textViewLineHeight
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:22.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  v2 = +[UIFont voicemailCaptionRegularFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    unsigned int v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:24.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 24.0;
  }

  return v7;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VMMessageTranscriptView;
  [(VMMessageTranscriptView *)&v3 tintColorDidChange];
  [(VMMessageTranscriptView *)self _refreshAttributedText];
}

- (void)_refreshAttributedText
{
  objc_super v3 = [(VMMessageTranscriptView *)self viewModel];
  double v4 = [v3 localizedAttributedFeedbackText];
  unsigned int v5 = [(VMMessageTranscriptView *)self feedbackTextView];
  [v5 setAttributedText:v4];

  double v6 = [(VMMessageTranscriptView *)self viewModel];
  double v7 = [v6 localizedAttributedText];
  id v8 = [(VMMessageTranscriptView *)self textView];
  [v8 setAttributedText:v7];

  id v11 = [(VMMessageTranscriptView *)self viewModel];
  double v9 = [v11 localizedAttributedTitle];
  unsigned __int8 v10 = [(VMMessageTranscriptView *)self titleLabel];
  [v10 setAttributedText:v9];
}

- (VMMessageTranscriptViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMMessageTranscriptViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VMMessageTranscriptViewModel)viewModel
{
  return self->_viewModel;
}

- (UITextView)feedbackTextView
{
  return self->_feedbackTextView;
}

- (void)setFeedbackTextView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)hideAccessoryViews
{
  return self->_hideAccessoryViews;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
}

- (NSLayoutConstraint)feedbackTextViewTopLayoutConstraint
{
  return self->_feedbackTextViewTopLayoutConstraint;
}

- (void)setFeedbackTextViewTopLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)feedbackTextViewBottomLayoutConstraint
{
  return self->_feedbackTextViewBottomLayoutConstraint;
}

- (void)setFeedbackTextViewBottomLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)feedbackTextViewLeadingLayoutConstraint
{
  return self->_feedbackTextViewLeadingLayoutConstraint;
}

- (void)setFeedbackTextViewLeadingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)feedbackTextViewTrailingLayoutConstraint
{
  return self->_feedbackTextViewTrailingLayoutConstraint;
}

- (void)setFeedbackTextViewTrailingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)indicatorViewCenterXLayoutConstraint
{
  return self->_indicatorViewCenterXLayoutConstraint;
}

- (void)setIndicatorViewCenterXLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)indicatorViewTopLayoutConstraint
{
  return self->_indicatorViewTopLayoutConstraint;
}

- (void)setIndicatorViewTopLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTopLayoutConstraint
{
  return self->_titleLabelTopLayoutConstraint;
}

- (void)setTitleLabelTopLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelFirstBaselineLayoutConstraint
{
  return self->_titleLabelFirstBaselineLayoutConstraint;
}

- (void)setTitleLabelFirstBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLastBaselineLayoutConstraint
{
  return self->_titleLabelLastBaselineLayoutConstraint;
}

- (void)setTitleLabelLastBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLeadingLayoutConstraint
{
  return self->_titleLabelLeadingLayoutConstraint;
}

- (void)setTitleLabelLeadingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingLayoutConstraint
{
  return self->_titleLabelTrailingLayoutConstraint;
}

- (void)setTitleLabelTrailingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewFirstBaselineLayoutConstraint
{
  return self->_textViewFirstBaselineLayoutConstraint;
}

- (void)setTextViewFirstBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewLastBaselineLayoutConstraint
{
  return self->_textViewLastBaselineLayoutConstraint;
}

- (void)setTextViewLastBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewLeadingLayoutConstraint
{
  return self->_textViewLeadingLayoutConstraint;
}

- (void)setTextViewLeadingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewTrailingLayoutConstraint
{
  return self->_textViewTrailingLayoutConstraint;
}

- (void)setTextViewTrailingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint
{
  return self->_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint;
}

- (void)setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewBottomLayoutConstraint
{
  return self->_textViewBottomLayoutConstraint;
}

- (void)setTextViewBottomLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorViewCenterXLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_feedbackTextView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end