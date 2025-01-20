@interface MFEmailSnippetComposeView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)reuseIdentifier;
- (BOOL)_loadSubjectForReference:(id)a3;
- (BOOL)_shouldDisplayField:(id)a3;
- (BOOL)_shouldDisplayField:(id)a3 withHeader:(id)a4 removeIfNotDisplayed:(BOOL)a5;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (CGRect)_frameForBodyTextWithSize:(CGSize)a3 startingAt:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFEmailSnippetComposeView)initWithFrame:(CGRect)a3;
- (MFEmailSnippetComposeViewDelegate)composeViewDelegate;
- (SAEmailEmail)email;
- (double)_roundToPixel:(double)a3;
- (double)desiredHeight;
- (id)_recipientsFromArray:(id)a3;
- (id)draftURL;
- (void)_repopulateFields;
- (void)_setupAndAddLabel:(id)a3 isHeader:(BOOL)a4;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)setComposeViewDelegate:(id)a3;
- (void)setEmail:(id)a3;
- (void)updateConstraints;
@end

@implementation MFEmailSnippetComposeView

- (void)_setupAndAddLabel:(id)a3 isHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v10 setFont:v6];

  v7 = +[UIColor siriui_textColor];
  [v10 setColor:v7];

  v8 = +[UIColor clearColor];
  [v10 setBackgroundColor:v8];

  if (v4) {
    [v10 sizeToFit];
  }
  v9 = [(MFEmailSnippetComposeView *)self contentView];
  [v9 addSubview:v10];
}

- (MFEmailSnippetComposeView)initWithFrame:(CGRect)a3
{
  v46.receiver = self;
  v46.super_class = (Class)MFEmailSnippetComposeView;
  v3 = -[MFEmailSnippetComposeView initWithFrame:](&v46, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    toHeader = v3->_toHeader;
    v3->_toHeader = v8;

    id v10 = v3->_toHeader;
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 siriUILocalizedStringForKey:@"TO_HEADER" table:@"Assistant"];
    [(UILabel *)v10 setText:v12];

    [(UILabel *)v3->_toHeader setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1148846080;
    [(UILabel *)v3->_toHeader setContentCompressionResistancePriority:0 forAxis:v13];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_toHeader isHeader:1];
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    ccHeader = v3->_ccHeader;
    v3->_ccHeader = v14;

    v16 = v3->_ccHeader;
    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 siriUILocalizedStringForKey:@"CC_HEADER" table:@"Assistant"];
    [(UILabel *)v16 setText:v18];

    [(UILabel *)v3->_ccHeader setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v3->_ccHeader setContentCompressionResistancePriority:0 forAxis:v19];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_ccHeader isHeader:1];
    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bccHeader = v3->_bccHeader;
    v3->_bccHeader = v20;

    v22 = v3->_bccHeader;
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 siriUILocalizedStringForKey:@"BCC_HEADER" table:@"Assistant"];
    [(UILabel *)v22 setText:v24];

    [(UILabel *)v3->_bccHeader setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v25) = 1148846080;
    [(UILabel *)v3->_bccField setContentCompressionResistancePriority:0 forAxis:v25];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_bccHeader isHeader:1];
    v26 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subjectHeader = v3->_subjectHeader;
    v3->_subjectHeader = v26;

    v28 = v3->_subjectHeader;
    v29 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = [v29 siriUILocalizedStringForKey:@"SUBJECT_HEADER" table:@"Assistant"];
    [(UILabel *)v28 setText:v30];

    [(UILabel *)v3->_subjectHeader setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v3->_subjectHeader setContentCompressionResistancePriority:0 forAxis:v31];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_subjectHeader isHeader:1];
    v32 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    toField = v3->_toField;
    v3->_toField = v32;

    [(UILabel *)v3->_toField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_toField isHeader:0];
    v34 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    ccField = v3->_ccField;
    v3->_ccField = v34;

    [(UILabel *)v3->_ccField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_ccField isHeader:0];
    v36 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bccField = v3->_bccField;
    v3->_bccField = v36;

    [(UILabel *)v3->_bccField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_bccField isHeader:0];
    v38 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subjectField = v3->_subjectField;
    v3->_subjectField = v38;

    [(UILabel *)v3->_subjectField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_subjectField isHeader:0];
    uint64_t v40 = +[SiriUIKeyline keylineWithKeylineType:1];
    subjectDivider = v3->_subjectDivider;
    v3->_subjectDivider = (SiriUIKeyline *)v40;

    [(SiriUIKeyline *)v3->_subjectDivider setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [(MFEmailSnippetComposeView *)v3 contentView];
    [v42 addSubview:v3->_subjectDivider];

    v43 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bodyText = v3->_bodyText;
    v3->_bodyText = v43;

    [(UILabel *)v3->_bodyText setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFEmailSnippetComposeView *)v3 _setupAndAddLabel:v3->_bodyText isHeader:0];
    [(UILabel *)v3->_bodyText setNumberOfLines:0];
  }
  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

- (double)_roundToPixel:(double)a3
{
  id v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v5;

  if (v6 > 0.0)
  {
    float v7 = v6 * a3;
    return roundf(v7) / v6;
  }
  return a3;
}

- (CGRect)_frameForBodyTextWithSize:(CGSize)a3 startingAt:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
  double v9 = width - v8;
  [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
  -[UILabel sizeThatFits:](self->_bodyText, "sizeThatFits:", v9 - v10, height);
  double v12 = v11;
  double v14 = v13;
  [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
  double v16 = v15;
  [(MFEmailSnippetComposeView *)self _roundToPixel:-1.5];
  double v18 = sub_8384(v17) + a4;
  double v19 = v16;
  double v20 = v12;
  double v21 = v14;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v18;
  result.origin.x = v19;
  return result;
}

- (BOOL)_shouldDisplayField:(id)a3
{
  id v4 = (UILabel *)a3;
  double v5 = [(UILabel *)v4 text];
  if ([v5 length] || self->_subjectField == v4)
  {
    char v6 = 1;
  }
  else if (self->_toField == v4)
  {
    double v8 = [(UILabel *)self->_ccField text];
    char v6 = [v8 length] == 0;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldDisplayField:(id)a3 withHeader:(id)a4 removeIfNotDisplayed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(MFEmailSnippetComposeView *)self _shouldDisplayField:v8];
  if (!v10 && v5)
  {
    [v8 removeFromSuperview];
    [v9 removeFromSuperview];
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 0.0;
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_toField])
  {
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v6 = v7 + 0.0;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_ccField])
  {
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v6 = v6 + v8;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_bccField])
  {
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v6 = v6 + v9;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_subjectField])
  {
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v6 = v6 + v10;
  }
  double v11 = sub_8384(v6 + 22.0);
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_bodyText])
  {
    -[MFEmailSnippetComposeView _frameForBodyTextWithSize:startingAt:](self, "_frameForBodyTextWithSize:startingAt:", width, height, 0.0);
    double v13 = v11 + v12;
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v11 = v13 + v14 + sub_8384(5.0);
  }
  double v15 = width;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)updateConstraints
{
  v106.receiver = self;
  v106.super_class = (Class)MFEmailSnippetComposeView;
  [(MFEmailSnippetComposeView *)&v106 updateConstraints];
  v104 = [(MFEmailSnippetComposeView *)self contentView];
  v3 = [(MFEmailSnippetComposeView *)self contentView];
  id v4 = [v3 constraints];
  [v104 removeConstraints:v4];

  v105 = +[NSMutableArray array];
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_toField withHeader:self->_toHeader removeIfNotDisplayed:1])
  {
    BOOL v5 = +[NSMutableArray arrayWithCapacity:5];
    [(UILabel *)self->_toHeader sizeToFit];
    [(UILabel *)self->_toField sizeToFit];
    toHeader = self->_toHeader;
    double v7 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v9 = +[NSLayoutConstraint constraintWithItem:toHeader attribute:11 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:sub_8384(v8)];
    [v5 addObject:v9];

    double v10 = self->_toHeader;
    double v11 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    double v13 = +[NSLayoutConstraint constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:v12];
    [v5 addObject:v13];

    double v14 = +[NSLayoutConstraint constraintWithItem:self->_toField attribute:10 relatedBy:0 toItem:self->_toHeader attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v14];

    toField = self->_toField;
    double v16 = self->_toHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:8.0];
    double v18 = +[NSLayoutConstraint constraintWithItem:toField attribute:5 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:v17];
    [v5 addObject:v18];

    double v19 = self->_toField;
    double v20 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v22 = +[NSLayoutConstraint constraintWithItem:v19 attribute:6 relatedBy:-1 toItem:v20 attribute:6 multiplier:1.0 constant:-v21];
    [v5 addObject:v22];

    [v105 addObjectsFromArray:v5];
    v23 = self->_toHeader;
  }
  else
  {
    v23 = 0;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_ccField withHeader:self->_ccHeader removeIfNotDisplayed:1])
  {
    [(UILabel *)self->_ccHeader sizeToFit];
    [(UILabel *)self->_ccField sizeToFit];
    v24 = +[NSMutableArray arrayWithCapacity:5];
    ccHeader = self->_ccHeader;
    if (v23)
    {
      [(MFEmailSnippetComposeView *)self _roundToPixel:23.0];
      uint64_t v27 = 4;
      v28 = v23;
    }
    else
    {
      v28 = [(MFEmailSnippetComposeView *)self contentView];
      [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
      uint64_t v27 = 3;
    }
    v29 = +[NSLayoutConstraint constraintWithItem:ccHeader attribute:11 relatedBy:0 toItem:v28 attribute:v27 multiplier:1.0 constant:sub_8384(v26)];
    [v24 addObject:v29];

    if (!v23) {
    v30 = self->_ccHeader;
    }
    double v31 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v33 = +[NSLayoutConstraint constraintWithItem:v30 attribute:5 relatedBy:0 toItem:v31 attribute:5 multiplier:1.0 constant:v32];
    [v24 addObject:v33];

    v34 = +[NSLayoutConstraint constraintWithItem:self->_ccField attribute:10 relatedBy:0 toItem:self->_ccHeader attribute:10 multiplier:1.0 constant:0.0];
    [v24 addObject:v34];

    ccField = self->_ccField;
    v36 = self->_ccHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:8.0];
    v38 = +[NSLayoutConstraint constraintWithItem:ccField attribute:5 relatedBy:0 toItem:v36 attribute:6 multiplier:1.0 constant:v37];
    [v24 addObject:v38];

    v39 = self->_ccField;
    uint64_t v40 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v42 = +[NSLayoutConstraint constraintWithItem:v39 attribute:6 relatedBy:-1 toItem:v40 attribute:6 multiplier:1.0 constant:-v41];
    [v24 addObject:v42];

    [v105 addObjectsFromArray:v24];
    v43 = self->_ccHeader;

    v23 = v43;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_bccField withHeader:self->_bccHeader removeIfNotDisplayed:1])
  {
    [(UILabel *)self->_bccHeader sizeToFit];
    [(UILabel *)self->_bccField sizeToFit];
    v44 = +[NSMutableArray arrayWithCapacity:5];
    bccHeader = self->_bccHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:23.0];
    v47 = +[NSLayoutConstraint constraintWithItem:bccHeader attribute:11 relatedBy:0 toItem:v23 attribute:4 multiplier:1.0 constant:sub_8384(v46)];
    [v44 addObject:v47];

    v48 = self->_bccHeader;
    v49 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v51 = +[NSLayoutConstraint constraintWithItem:v48 attribute:5 relatedBy:0 toItem:v49 attribute:5 multiplier:1.0 constant:v50];
    [v44 addObject:v51];

    v52 = +[NSLayoutConstraint constraintWithItem:self->_bccField attribute:10 relatedBy:0 toItem:self->_bccHeader attribute:10 multiplier:1.0 constant:0.0];
    [v44 addObject:v52];

    bccField = self->_bccField;
    v54 = self->_bccHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:8.0];
    v56 = +[NSLayoutConstraint constraintWithItem:bccField attribute:5 relatedBy:0 toItem:v54 attribute:6 multiplier:1.0 constant:v55];
    [v44 addObject:v56];

    v57 = self->_bccField;
    v58 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v60 = +[NSLayoutConstraint constraintWithItem:v57 attribute:6 relatedBy:-1 toItem:v58 attribute:6 multiplier:1.0 constant:-v59];
    [v44 addObject:v60];

    [v105 addObjectsFromArray:v44];
    v61 = self->_bccHeader;

    v23 = v61;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_subjectField withHeader:self->_subjectHeader removeIfNotDisplayed:1])
  {
    [(UILabel *)self->_subjectHeader sizeToFit];
    [(UILabel *)self->_subjectField sizeToFit];
    v62 = +[NSMutableArray arrayWithCapacity:9];
    subjectHeader = self->_subjectHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:23.0];
    v65 = +[NSLayoutConstraint constraintWithItem:subjectHeader attribute:11 relatedBy:0 toItem:v23 attribute:4 multiplier:1.0 constant:sub_8384(v64)];
    [v62 addObject:v65];

    v66 = self->_subjectHeader;
    v67 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v69 = +[NSLayoutConstraint constraintWithItem:v66 attribute:5 relatedBy:0 toItem:v67 attribute:5 multiplier:1.0 constant:v68];
    [v62 addObject:v69];

    v70 = +[NSLayoutConstraint constraintWithItem:self->_subjectField attribute:10 relatedBy:0 toItem:self->_subjectHeader attribute:10 multiplier:1.0 constant:0.0];
    [v62 addObject:v70];

    subjectField = self->_subjectField;
    v72 = self->_subjectHeader;
    [(MFEmailSnippetComposeView *)self _roundToPixel:8.0];
    v74 = +[NSLayoutConstraint constraintWithItem:subjectField attribute:5 relatedBy:0 toItem:v72 attribute:6 multiplier:1.0 constant:v73];
    [v62 addObject:v74];

    v75 = self->_subjectField;
    v76 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v78 = +[NSLayoutConstraint constraintWithItem:v75 attribute:6 relatedBy:-1 toItem:v76 attribute:6 multiplier:1.0 constant:-v77];
    [v62 addObject:v78];

    subjectDivider = self->_subjectDivider;
    v80 = [(MFEmailSnippetComposeView *)self contentView];
    v81 = +[NSLayoutConstraint constraintWithItem:subjectDivider attribute:5 relatedBy:0 toItem:v80 attribute:5 multiplier:1.0 constant:0.0];
    [v62 addObject:v81];

    v82 = self->_subjectDivider;
    v83 = [(MFEmailSnippetComposeView *)self contentView];
    v84 = +[NSLayoutConstraint constraintWithItem:v82 attribute:6 relatedBy:0 toItem:v83 attribute:6 multiplier:1.0 constant:0.0];
    [v62 addObject:v84];

    v85 = +[NSLayoutConstraint constraintWithItem:self->_subjectDivider attribute:3 relatedBy:0 toItem:self->_subjectHeader attribute:4 multiplier:1.0 constant:10.0];
    [v62 addObject:v85];

    v86 = +[NSLayoutConstraint constraintWithItem:self->_subjectDivider attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.5];
    [v62 addObject:v86];

    [v105 addObjectsFromArray:v62];
    v87 = self->_subjectDivider;

    v23 = (UILabel *)v87;
  }
  if ([(MFEmailSnippetComposeView *)self _shouldDisplayField:self->_bodyText withHeader:0 removeIfNotDisplayed:1])
  {
    [(UILabel *)self->_bodyText sizeToFit];
    v88 = +[NSMutableArray array];
    bodyText = self->_bodyText;
    [(MFEmailSnippetComposeView *)self _roundToPixel:25.0];
    double v91 = sub_8384(v90);
    v92 = [(UILabel *)self->_bodyText font];
    [v92 capHeight];
    v94 = +[NSLayoutConstraint constraintWithItem:bodyText attribute:3 relatedBy:0 toItem:v23 attribute:4 multiplier:1.0 constant:v91 - v93];
    [v88 addObject:v94];

    v95 = self->_bodyText;
    v96 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v98 = +[NSLayoutConstraint constraintWithItem:v95 attribute:5 relatedBy:0 toItem:v96 attribute:5 multiplier:1.0 constant:v97];
    [v88 addObject:v98];

    v99 = self->_bodyText;
    v100 = [(MFEmailSnippetComposeView *)self contentView];
    [(MFEmailSnippetComposeView *)self _roundToPixel:15.0];
    v102 = +[NSLayoutConstraint constraintWithItem:v99 attribute:6 relatedBy:0 toItem:v100 attribute:6 multiplier:1.0 constant:-v101];
    [v88 addObject:v102];

    [v105 addObjectsFromArray:v88];
  }
  v103 = [(MFEmailSnippetComposeView *)self contentView];
  [v103 addConstraints:v105];
}

- (double)desiredHeight
{
  -[MFEmailSnippetComposeView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  return v2;
}

- (id)_recipientsFromArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "length", (void)v14))
        {
          double v10 = MFLocalizedAddressSeparator();
          [v4 appendString:v10];
        }
        double v11 = [v9 displayText];
        if (![v11 length])
        {
          uint64_t v12 = [v9 data];

          double v11 = (void *)v12;
        }
        if ([v11 length]) {
          [v4 appendString:v11];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_repopulateFields
{
  id v14 = [(SAEmailEmail *)self->_email recipientsTo];
  id v3 = -[MFEmailSnippetComposeView _recipientsFromArray:](self, "_recipientsFromArray:");

  id v15 = v3;
  -[UILabel setText:](self->_toField, "setText:");
  id v4 = [(SAEmailEmail *)self->_email recipientsCc];
  id v5 = [(MFEmailSnippetComposeView *)self _recipientsFromArray:v4];

  id v6 = v5;
  [(UILabel *)self->_ccField setText:v6];
  uint64_t v7 = [(SAEmailEmail *)self->_email recipientsBcc];
  double v8 = [(MFEmailSnippetComposeView *)self _recipientsFromArray:v7];

  id v9 = v8;
  [(UILabel *)self->_bccField setText:v9];
  subjectField = self->_subjectField;
  double v11 = [(SAEmailEmail *)self->_email subject];
  [(UILabel *)subjectField setText:v11];

  bodyText = self->_bodyText;
  double v13 = [(SAEmailEmail *)self->_email message];
  [(UILabel *)bodyText setText:v13];

  if (qword_1F030 != -1) {
    dispatch_once(&qword_1F030, &stru_18718);
  }
  [(MFEmailSnippetComposeView *)self setNeedsLayout];
}

- (BOOL)_loadSubjectForReference:(id)a3
{
  id v4 = a3;
  id v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  searchCompleted = self->_searchCompleted;
  self->_searchCompleted = v5;

  id v7 = objc_alloc((Class)MSCriterion);
  id v8 = [v7 initWithType:MSCriterionTypeMessageReference qualifier:MSCriterionQualifierContains expression:v4];
  id v9 = +[NSArray arrayWithObject:MSResultsKeySubject];
  double v10 = +[MSSearch findMessageData:v9 matchingCriterion:v8 options:0 delegate:self];

  if (v10)
  {
    double v11 = self->_searchCompleted;
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    BOOL v13 = dispatch_semaphore_wait(v11, v12) == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  [v10 cancel];
  id v14 = self->_searchCompleted;
  self->_searchCompleted = 0;

  return v13;
}

- (void)setEmail:(id)a3
{
  p_email = (id *)&self->_email;
  id v11 = a3;
  if (*p_email != v11) {
    objc_storeStrong((id *)&self->_email, a3);
  }
  id v6 = [v11 type];
  int64_t v7 = +[MFAssistantEmail MSSendTypeForSAEMailType:v6];

  if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v8 = [v11 referenceId];
    if (![(MFEmailSnippetComposeView *)self _loadSubjectForReference:v8])
    {
LABEL_12:

      goto LABEL_13;
    }
    if (v7 == 2)
    {
      uint64_t v9 = 4;
    }
    else
    {
      if (v7 != 3)
      {
        double v10 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = 6;
    }
    double v10 = +[MFComposeTypeFactory subjectFromSubject:self->_subjectResult withComposeType:v9];
LABEL_11:
    [*p_email setSubject:v10];

    goto LABEL_12;
  }
LABEL_13:
  [(MFEmailSnippetComposeView *)self _repopulateFields];
}

- (id)draftURL
{
  id v3 = +[NSURL ef_defaultAllowedCharacterSet];
  id v4 = [(SAEmailEmail *)self->_email recipientsTo];
  id v5 = MFCommentedEmailsFromSAPersonAttributes(v4);
  id v6 = [v5 componentsJoinedByString:@","];
  v38 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  int64_t v7 = [(SAEmailEmail *)self->_email recipientsCc];
  id v8 = MFCommentedEmailsFromSAPersonAttributes(v7);
  uint64_t v9 = [v8 componentsJoinedByString:@","];
  double v37 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  double v10 = [(SAEmailEmail *)self->_email recipientsBcc];
  id v11 = MFCommentedEmailsFromSAPersonAttributes(v10);
  dispatch_time_t v12 = [v11 componentsJoinedByString:@","];
  BOOL v13 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  id v14 = [(SAEmailEmail *)self->_email subject];
  id v15 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  long long v16 = [(SAEmailEmail *)self->_email message];
  long long v17 = objc_msgSend(v16, "ef_stringByAddingPercentEscapesUsingEncoding:", 4);

  double v18 = [(SAEmailEmail *)self->_email type];
  int64_t v19 = +[MFAssistantEmail MSSendTypeForSAEMailType:v18];

  if (v19 == 2)
  {
    id v20 = EMAppleMailReplyURLScheme;
    uint64_t v21 = [(SAEmailEmail *)self->_email referenceId];
    goto LABEL_5;
  }
  if (v19 == 3)
  {
    id v20 = EMAppleMailForwardURLScheme;
    uint64_t v21 = [(SAEmailEmail *)self->_email referenceId];
LABEL_5:
    v22 = (void *)v21;
    v23 = v20;
    goto LABEL_7;
  }
  v23 = 0;
  v22 = 0;
LABEL_7:
  if ([v23 length])
  {
    id v24 = objc_alloc((Class)NSMutableString);
    double v25 = [v22 resourceSpecifier];
    double v26 = [v25 stringByAddingPercentEncodingWithAllowedCharacters:v3];
    id v27 = [v24 initWithFormat:@"%@:%@", v23, v26];

    if ([v38 length])
    {
      [v27 appendFormat:@"?%@=%@", ECMessageHeaderKeyTo, v38];
      int v28 = 1;
    }
    else
    {
      int v28 = 0;
    }
  }
  else
  {
    id v29 = objc_alloc((Class)NSMutableString);
    id v30 = [v29 initWithFormat:@"%@:", EMMailToURLScheme];
    if ([v38 length]) {
      [v30 appendString:v38];
    }
    int v28 = 0;
    id v27 = v30;
  }
  if ([v37 length])
  {
    if (v28) {
      double v31 = "&";
    }
    else {
      double v31 = "?";
    }
    [v27 appendFormat:@"%s%@=%@", v31, ECMessageHeaderKeyCC, v37];
    int v28 = 1;
  }
  if ([v13 length])
  {
    if (v28) {
      double v32 = "&";
    }
    else {
      double v32 = "?";
    }
    [v27 appendFormat:@"%s%@=%@", v32, ECMessageHeaderKeyBCC, v13];
    int v28 = 1;
  }
  if ([v15 length])
  {
    if (v28) {
      v33 = "&";
    }
    else {
      v33 = "?";
    }
    [v27 appendFormat:@"%s%@=%@", v33, @"subject", v15];
    int v28 = 1;
  }
  if ([v17 length])
  {
    if (v28) {
      v34 = "&";
    }
    else {
      v34 = "?";
    }
    [v27 appendFormat:@"%s%@=%@", v34, @"body", v17];
  }
  v35 = +[NSURL URLWithString:v27];

  return v35;
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v5 = a4;
  id v6 = [v5 lastObject];
  int64_t v7 = [v6 objectForKey:MSResultsKeySubject];
  id v8 = (NSString *)[v7 copy];
  subjectResult = self->_subjectResult;
  self->_subjectResult = v8;

  return 0;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
}

- (SAEmailEmail)email
{
  return self->_email;
}

- (MFEmailSnippetComposeViewDelegate)composeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeViewDelegate);

  return (MFEmailSnippetComposeViewDelegate *)WeakRetained;
}

- (void)setComposeViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composeViewDelegate);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_subjectDivider, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_subjectHeader, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_bccHeader, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_ccHeader, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_toHeader, 0);
  objc_storeStrong((id *)&self->_subjectResult, 0);
  objc_storeStrong((id *)&self->_searchCompleted, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end