@interface ICBaseNoteResultsCollectionViewCell
- (CGRect)estimatedBoundsForLabel:(id)a3;
- (CGRect)estimatedSummaryLabelFrame;
- (CGRect)estimatedTitleLabelFrame;
- (ICBaseNoteResultsCollectionViewCell)initWithCoder:(id)a3;
- (ICBaseNoteResultsCollectionViewCell)initWithFrame:(CGRect)a3;
- (ICNoteResultsCellConfiguration)configuration;
- (ICNoteResultsCollaboratorsBadgeView)collaboratorsBadgeView;
- (NSArray)cloudSharingParticipantNames;
- (NSDictionary)folderAndAccountLabelAttributes;
- (NSDictionary)summaryLabelAttributes;
- (NSDictionary)titleLabelAttributes;
- (double)currentWidth;
- (void)layoutSubviews;
- (void)loadConfigurationDataAndUpdate;
- (void)registerForTraitChanges;
- (void)setCollaboratorsBadgeView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4;
- (void)setCurrentWidth:(double)a3;
- (void)setEstimatedSummaryLabelFrame:(CGRect)a3;
- (void)setEstimatedTitleLabelFrame:(CGRect)a3;
- (void)setFolderAndAccountLabelAttributes:(id)a3;
- (void)setSummaryLabelAttributes:(id)a3;
- (void)setTitleLabelAttributes:(id)a3;
- (void)synchronouslyLoadConfigurationDataAndUpdate;
- (void)updateConfigurationAttributes;
- (void)updateEstimatedLabelFrames;
- (void)updateViewStateProperties;
@end

@implementation ICBaseNoteResultsCollectionViewCell

- (ICBaseNoteResultsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICBaseNoteResultsCollectionViewCell *)v3 commonInit];
  }
  return v4;
}

- (ICBaseNoteResultsCollectionViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  v3 = [(ICBaseNoteResultsCollectionViewCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICBaseNoteResultsCollectionViewCell *)v3 commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  [(ICBaseNoteResultsCollectionViewCell *)&v7 layoutSubviews];
  [(ICBaseNoteResultsCollectionViewCell *)self currentWidth];
  double v4 = v3;
  [(ICBaseNoteResultsCollectionViewCell *)self frame];
  if (v4 != v5)
  {
    [(ICBaseNoteResultsCollectionViewCell *)self updateEstimatedLabelFrames];
    [(ICBaseNoteResultsCollectionViewCell *)self loadConfigurationDataAndUpdate];
  }
  [(ICBaseNoteResultsCollectionViewCell *)self frame];
  [(ICBaseNoteResultsCollectionViewCell *)self setCurrentWidth:v6];
}

- (NSArray)cloudSharingParticipantNames
{
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
  double v4 = [v3 share];
  double v5 = [v4 participants];
  double v6 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
  objc_super v7 = +[CKShareParticipant ic_displayableNames:maximumNamesCount:](CKShareParticipant, "ic_displayableNames:maximumNamesCount:", v5, [v6 displayedAvatarCount]);

  return (NSArray *)v7;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  [(ICBaseNoteResultsCollectionViewCell *)self updateConfigurationAttributes];
  if (([v7 isDataLoaded] & 1) == 0)
  {
    if (v4) {
      [(ICBaseNoteResultsCollectionViewCell *)self synchronouslyLoadConfigurationDataAndUpdate];
    }
    else {
      [(ICBaseNoteResultsCollectionViewCell *)self loadConfigurationDataAndUpdate];
    }
  }
  [(ICBaseNoteResultsCollectionViewCell *)self updateFromConfiguration];
}

- (void)loadConfigurationDataAndUpdate
{
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  BOOL v4 = [v3 searchResult];

  if (v4)
  {
    [(ICBaseNoteResultsCollectionViewCell *)self synchronouslyLoadConfigurationDataAndUpdate];
  }
  else
  {
    double v5 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_AB1C;
    v6[3] = &unk_185D8;
    v6[4] = self;
    [v5 loadDataWithCompletion:v6];
  }
}

- (void)synchronouslyLoadConfigurationDataAndUpdate
{
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  [v3 synchronouslyLoadData];

  [(ICBaseNoteResultsCollectionViewCell *)self updateFromConfiguration];
}

- (void)updateViewStateProperties
{
  double v3 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleHeadline];
  BOOL v4 = [(ICBaseNoteResultsCollectionViewCell *)self titleLabel];
  [v4 setFont:v3];

  double v5 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleSubheadline];
  double v6 = [(ICBaseNoteResultsCollectionViewCell *)self summaryLabel];
  [v6 setFont:v5];

  char v7 = objc_opt_respondsToSelector();
  if (v7)
  {
    v8 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleSubheadline];
    v9 = [(ICBaseNoteResultsCollectionViewCell *)self folderAndAccountLabel];
    [v9 setFont:v8];
  }
  NSAttributedStringKey v29 = NSFontAttributeName;
  v10 = [(ICBaseNoteResultsCollectionViewCell *)self titleLabel];
  v11 = [v10 font];
  v30 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [(ICBaseNoteResultsCollectionViewCell *)self setTitleLabelAttributes:v12];

  v13 = [(ICBaseNoteResultsCollectionViewCell *)self summaryLabel];
  v14 = [v13 textColor];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[UIColor tertiaryLabelColor];
  }
  v17 = v16;

  v27[0] = NSFontAttributeName;
  v18 = [(ICBaseNoteResultsCollectionViewCell *)self summaryLabel];
  v19 = [v18 font];
  v27[1] = NSForegroundColorAttributeName;
  v28[0] = v19;
  v28[1] = v17;
  v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [(ICBaseNoteResultsCollectionViewCell *)self setSummaryLabelAttributes:v20];

  if (v7)
  {
    NSAttributedStringKey v25 = NSFontAttributeName;
    v21 = [(ICBaseNoteResultsCollectionViewCell *)self folderAndAccountLabel];
    v22 = [v21 font];
    v26 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [(ICBaseNoteResultsCollectionViewCell *)self setFolderAndAccountLabelAttributes:v23];
  }
  else
  {
    [(ICBaseNoteResultsCollectionViewCell *)self setFolderAndAccountLabelAttributes:&__NSDictionary0__struct];
  }
  [(ICBaseNoteResultsCollectionViewCell *)self frame];
  [(ICBaseNoteResultsCollectionViewCell *)self setCurrentWidth:v24];
  [(ICBaseNoteResultsCollectionViewCell *)self updateEstimatedLabelFrames];
  [(ICBaseNoteResultsCollectionViewCell *)self updateConfigurationAttributes];
}

- (void)updateEstimatedLabelFrames
{
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self titleLabel];
  [(ICBaseNoteResultsCollectionViewCell *)self estimatedBoundsForLabel:v3];
  -[ICBaseNoteResultsCollectionViewCell setEstimatedTitleLabelFrame:](self, "setEstimatedTitleLabelFrame:");

  id v4 = [(ICBaseNoteResultsCollectionViewCell *)self summaryLabel];
  [(ICBaseNoteResultsCollectionViewCell *)self estimatedBoundsForLabel:v4];
  -[ICBaseNoteResultsCollectionViewCell setEstimatedSummaryLabelFrame:](self, "setEstimatedSummaryLabelFrame:");
}

- (void)setEstimatedTitleLabelFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_estimatedTitleLabelFrame = a3;
  id v7 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  objc_msgSend(v7, "setEstimatedTitleLabelFrame:", x, y, width, height);
}

- (void)setEstimatedSummaryLabelFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_estimatedSummaryLabelFrame = a3;
  id v7 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  objc_msgSend(v7, "setEstimatedSummaryLabelFrame:", x, y, width, height);
}

- (CGRect)estimatedBoundsForLabel:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)updateConfigurationAttributes
{
  id v18 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self titleLabelAttributes];
  id v4 = [(ICBaseNoteResultsCollectionViewCell *)self summaryLabelAttributes];
  double v5 = [(ICBaseNoteResultsCollectionViewCell *)self folderAndAccountLabelAttributes];
  [(ICBaseNoteResultsCollectionViewCell *)self estimatedTitleLabelFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(ICBaseNoteResultsCollectionViewCell *)self estimatedSummaryLabelFrame];
  objc_msgSend(v18, "updateTitleLabelAttributes:summaryLabelAttributes:folderAndAccountLabelAttributes:estimatedTitleLabelFrame:estimatedSummaryLabelFrame:", v3, v4, v5, v7, v9, v11, v13, v14, v15, v16, v17);
}

- (void)registerForTraitChanges
{
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  double v3 = +[NSArray arrayWithObjects:v6 count:3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B260;
  v5[3] = &unk_18500;
  v5[4] = self;
  id v4 = [(ICBaseNoteResultsCollectionViewCell *)self registerForTraitChanges:v3 withHandler:v5];
}

- (ICNoteResultsCollaboratorsBadgeView)collaboratorsBadgeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaboratorsBadgeView);

  return (ICNoteResultsCollaboratorsBadgeView *)WeakRetained;
}

- (void)setCollaboratorsBadgeView:(id)a3
{
}

- (ICNoteResultsCellConfiguration)configuration
{
  return self->_configuration;
}

- (NSDictionary)titleLabelAttributes
{
  return self->_titleLabelAttributes;
}

- (void)setTitleLabelAttributes:(id)a3
{
}

- (NSDictionary)summaryLabelAttributes
{
  return self->_summaryLabelAttributes;
}

- (void)setSummaryLabelAttributes:(id)a3
{
}

- (NSDictionary)folderAndAccountLabelAttributes
{
  return self->_folderAndAccountLabelAttributes;
}

- (void)setFolderAndAccountLabelAttributes:(id)a3
{
}

- (CGRect)estimatedTitleLabelFrame
{
  double x = self->_estimatedTitleLabelFrame.origin.x;
  double y = self->_estimatedTitleLabelFrame.origin.y;
  double width = self->_estimatedTitleLabelFrame.size.width;
  double height = self->_estimatedTitleLabelFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)estimatedSummaryLabelFrame
{
  double x = self->_estimatedSummaryLabelFrame.origin.x;
  double y = self->_estimatedSummaryLabelFrame.origin.y;
  double width = self->_estimatedSummaryLabelFrame.size.width;
  double height = self->_estimatedSummaryLabelFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)currentWidth
{
  return self->_currentWidth;
}

- (void)setCurrentWidth:(double)a3
{
  self->_currentWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, 0);
  objc_storeStrong((id *)&self->_summaryLabelAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_collaboratorsBadgeView);
}

@end