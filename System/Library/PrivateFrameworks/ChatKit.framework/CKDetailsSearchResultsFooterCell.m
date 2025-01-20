@interface CKDetailsSearchResultsFooterCell
+ (double)desiredZPosition;
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (CALayer)bottomHairline;
- (CALayer)topHairline;
- (CKDetailsSearchResultsFooterCell)initWithFrame:(CGRect)a3;
- (CKDetailsSearchResultsFooterCellDelegate)delegate;
- (NSString)sectionIdentifier;
- (NSString)title;
- (UIEdgeInsets)marginInsets;
- (UITableView)tableView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)layoutSubviews;
- (void)setBottomHairline:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopHairline:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CKDetailsSearchResultsFooterCell

+ (id)supplementaryViewType
{
  return @"SearchDetailsFooterSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"SearchDetailsResultsFooter";
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKDetailsSearchResultsFooterCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKDetailsSearchResultsFooterCell;
  v7 = -[CKDetailsSearchResultsFooterCell initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 0, x, y, width, height);
    [v8 setDataSource:v7];
    [v8 setDelegate:v7];
    [v8 setAlwaysBounceVertical:0];
    [v8 setAlwaysBounceHorizontal:0];
    [v8 setScrollEnabled:0];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"DetailsFooter"];
    [v8 setSeparatorStyle:0];
    [(CKDetailsSearchResultsFooterCell *)v7 setTableView:v8];
    v9 = [(CKDetailsSearchResultsFooterCell *)v7 contentView];
    [v9 addSubview:v8];

    if (CKIsRunningInMacCatalyst())
    {
      v10 = +[CKUIBehavior sharedBehaviors];
      v11 = [v10 theme];
      v12 = [v11 detailsHeaderFooterContentViewBackgroundColor];
      [v8 setBackgroundColor:v12];

      v13 = [(CKDetailsSearchResultsFooterCell *)v7 contentView];
      v14 = +[CKUIBehavior sharedBehaviors];
      v15 = [v14 theme];
      v16 = [v15 detailsHeaderFooterContentViewBackgroundColor];
      [v13 setBackgroundColor:v16];

      v17 = [(CKDetailsSearchResultsFooterCell *)v7 backgroundView];
      v18 = +[CKUIBehavior sharedBehaviors];
      v19 = [v18 theme];
      v20 = [v19 detailsHeaderFooterContentViewBackgroundColor];
      [v17 setBackgroundColor:v20];
    }
  }
  return v7;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    v6 = [(CKDetailsSearchResultsFooterCell *)self tableView];
    [v6 reloadData];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CKDetailsSearchResultsFooterCell;
  [(CKDetailsSearchResultsFooterCell *)&v14 layoutSubviews];
  [(CKDetailsSearchResultsFooterCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKDetailsSearchResultsFooterCell *)self tableView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CKDetailsSearchResultsFooterCell *)self contentView];
  v13 = [v12 layer];
  [v13 setCornerRadius:10.0];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  v13 = [(CKDetailsSearchResultsFooterCell *)self tableView];
  v21.origin.double x = v6;
  v21.origin.double y = v8;
  v21.size.double width = v10;
  v21.size.double height = v12;
  objc_msgSend(v13, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  double v15 = v14;

  v16 = +[CKUIBehavior sharedBehaviors];
  [v16 searchResultsTitleHeaderDetailsTopPadding];
  double v18 = v15 + v17;

  objc_msgSend(v4, "setFrame:", v6, v8, v10, v18);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  double v5 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"DetailsFooter", a4);
  double v6 = [v5 textLabel];
  double v7 = [(CKDetailsSearchResultsFooterCell *)self title];
  [v6 setText:v7];

  double v8 = [v5 textLabel];
  double v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = [v9 theme];
  double v11 = [v10 appTintColor];
  [v8 setTextColor:v11];

  CGFloat v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [v12 theme];
  double v14 = [v13 detailsHeaderFooterContentViewBackgroundColor];
  [v5 setBackgroundColor:v14];

  double v15 = [v5 contentView];
  v16 = +[CKUIBehavior sharedBehaviors];
  double v17 = [v16 theme];
  double v18 = [v17 detailsHeaderFooterContentViewBackgroundColor];
  [v15 setBackgroundColor:v18];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  double v7 = [(CKDetailsSearchResultsFooterCell *)self delegate];
  [v7 searchDetailsFooterCellShowAllTapped:self];

  [v8 deselectRowAtIndexPath:v6 animated:1];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (CKDetailsSearchResultsFooterCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDetailsSearchResultsFooterCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end