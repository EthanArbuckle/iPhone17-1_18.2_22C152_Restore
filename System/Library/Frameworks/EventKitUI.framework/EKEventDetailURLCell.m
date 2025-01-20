@interface EKEventDetailURLCell
+ (Class)_SGSuggestionsServiceClass;
- (BOOL)update;
- (BOOL)updateLink;
- (EKEventDetailURLCell)initWithEvent:(id)a3 launchInfo:(id)a4 editable:(BOOL)a5 style:(int64_t)a6;
- (EKEventDetailURLCell)initWithEvent:(id)a3 url:(id)a4 editable:(BOOL)a5 style:(int64_t)a6;
- (id)_URLTitleView;
- (id)_URLView;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutSubviews;
- (void)updateLinkWithLaunchInfo;
- (void)updateLinkWithURL;
- (void)updateWithURL:(id)a3 launchInfo:(id)a4;
@end

@implementation EKEventDetailURLCell

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (EKEventDetailURLCell)initWithEvent:(id)a3 url:(id)a4 editable:(BOOL)a5 style:(int64_t)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  v12 = [(EKEventDetailCell *)&v16 initWithEvent:a3 editable:v7 style:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a4);
    launchInfo = v13->_launchInfo;
    v13->_launchInfo = 0;
  }
  return v13;
}

- (EKEventDetailURLCell)initWithEvent:(id)a3 launchInfo:(id)a4 editable:(BOOL)a5 style:(int64_t)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  v12 = [(EKEventDetailCell *)&v16 initWithEvent:a3 editable:v7 style:a6];
  v13 = v12;
  if (v12)
  {
    url = v12->_url;
    v12->_url = 0;

    objc_storeStrong((id *)&v13->_launchInfo, a4);
  }

  return v13;
}

- (void)updateWithURL:(id)a3 launchInfo:(id)a4
{
  v6 = (NSURL *)a3;
  BOOL v7 = (SGSuggestedEventLaunchInfo *)a4;
  url = self->_url;
  self->_url = v6;
  v9 = v6;

  launchInfo = self->_launchInfo;
  self->_launchInfo = v7;

  [(EKEventDetailURLCell *)self update];
}

- (BOOL)update
{
  BOOL v3 = [(EKEventDetailURLCell *)self updateLink];
  URLTitleView = self->_URLTitleView;
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)URLTitleView setFont:v6];

  BOOL v7 = self->_URLTitleView;
  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v7 setTextColor:v8];

  URLView = self->_URLView;
  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v5];
  [(UITextView *)URLView setFont:v10];

  id v11 = self->_URLView;
  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UITextView *)v11 setTextColor:v12];

  return v3;
}

- (BOOL)updateLink
{
  if (self->_launchInfo)
  {
    [(EKEventDetailURLCell *)self updateLinkWithLaunchInfo];
  }
  else
  {
    if (!self->_url) {
      return 0;
    }
    [(EKEventDetailURLCell *)self updateLinkWithURL];
  }
  return 1;
}

- (void)updateLinkWithURL
{
  BOOL v3 = [(EKEvent *)self->super._event URL];

  if (v3)
  {
    v4 = [(EKEvent *)self->super._event URL];
    CUIKGetAttributedStringForEventDetailWithURL();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    v6 = [(EKEventDetailURLCell *)self _URLView];
    [v6 setAttributedText:v7];
  }
  else
  {
    id v7 = [(EKEventDetailURLCell *)self _URLView];
    [v7 setAttributedText:0];
  }
  uint64_t v5 = v7;
LABEL_6:
}

- (void)updateLinkWithLaunchInfo
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [NSString stringWithFormat:@"calshow://launchSuggestedEvent"];
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = [(SGSuggestedEventLaunchInfo *)self->_launchInfo localizedShowInString];
  uint64_t v10 = *MEMORY[0x1E4FB0720];
  v11[0] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v5 initWithString:v6 attributes:v7];

  v9 = [(EKEventDetailURLCell *)self _URLView];
  [v9 setAttributedText:v8];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailURLCell;
  [(EKUITableViewCell *)&v4 layoutSubviews];
  [(EKEventDetailURLCell *)self bounds];
  [(EKEventDetailURLCell *)self _layoutForWidth:self->_lastLayoutPosition position:v3];
}

- (void)_layoutForWidth:(double)a3 position:(int)a4
{
  id v53 = [(EKEventDetailURLCell *)self _URLTitleView];
  id v7 = [(EKEventDetailURLCell *)self contentView];
  [v7 addSubview:v53];

  v8 = [(EKEventDetailURLCell *)self _URLView];
  v9 = [(EKEventDetailURLCell *)self contentView];
  [v9 addSubview:v8];

  [(EKEventDetailCell *)self detailsLeftInset];
  double v11 = v10;
  [v53 sizeToFit];
  double v12 = v11;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    [(EKEventDetailURLCell *)self safeAreaInsets];
    double v14 = a3 - v13;
    [(EKEventDetailURLCell *)self safeAreaInsets];
    double v16 = v14 - v15;
    [(EKEventDetailCell *)self detailsLeftInset];
    double v18 = v16 - v17;
    [v53 frame];
    double v12 = v18 - v19;
  }
  [v53 frame];
  objc_msgSend(v53, "setFrame:", v12, 11.0);
  [v8 contentInset];
  double v21 = v20;
  if (a4 == 5)
  {
    double v22 = 0.0 - v20;
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    [v53 frame];
    double v25 = v24;
    [(id)objc_opt_class() detailsPostLabelSpace];
    double v27 = v25 + v26;
    double v28 = a3 - v27;
    double v29 = v11 + v27;
    if (IsLeftToRight) {
      double v11 = v29;
    }
    else {
      a3 = v28;
    }
  }
  else
  {
    uint64_t v30 = *MEMORY[0x1E4FB28C8];
    v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v31 capHeight];
    double v33 = v32;
    v34 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v30];
    [v34 _leading];
    double v36 = v33 + v35;
    v37 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v30];
    [v37 descender];
    double v39 = -(v38 - v36 * 1.5);
    v40 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v30];
    [v40 _leading];
    CalRoundToScreenScale(v39 - v41);
    double v22 = v21 + v42 + 11.0;
  }
  [(EKEventDetailURLCell *)self safeAreaInsets];
  double v44 = a3 - v43;
  [(EKEventDetailURLCell *)self safeAreaInsets];
  double v46 = v44 - v45 - v11;
  [(EKEventDetailCell *)self detailsLeftInset];
  double v48 = v46 - v47;
  [v8 contentInset];
  double v50 = v48 - v49;
  objc_msgSend(v8, "sizeThatFits:", v50, 1000.0);
  objc_msgSend(v8, "setFrame:", v11, v22, v50, v51);
  if (a4 == 5)
  {
    if (CalInterfaceIsLeftToRight()) {
      uint64_t v52 = 2;
    }
    else {
      uint64_t v52 = 0;
    }
  }
  else
  {
    uint64_t v52 = 4;
  }
  [v8 setTextAlignment:v52];
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  -[EKEventDetailCell layoutForWidth:position:](&v16, sel_layoutForWidth_position_);
  self->_lastLayoutPosition = v4;
  [(EKEventDetailURLCell *)self _layoutForWidth:v4 position:a3];
  [(EKEventDetailURLCell *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(EKEventDetailURLCell *)self _URLView];
  [v13 frame];
  CGFloat MaxY = CGRectGetMaxY(v17);
  double v15 = CalCeilToScreenScale(MaxY + -3.0);

  -[EKEventDetailURLCell setFrame:](self, "setFrame:", v8, v10, v12, v15);
}

- (id)_URLTitleView
{
  URLTitleView = self->_URLTitleView;
  if (!URLTitleView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_URLTitleView;
    self->_URLTitleView = v5;

    double v7 = self->_URLTitleView;
    double v8 = EventKitUIBundle();
    double v9 = [v8 localizedStringForKey:@"URL" value:&stru_1F0CC2140 table:0];
    [(UILabel *)v7 setText:v9];

    [(UILabel *)self->_URLTitleView setBackgroundColor:0];
    double v10 = self->_URLTitleView;
    double v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v10 setHighlightedTextColor:v11];

    [(UILabel *)self->_URLTitleView setOpaque:0];
    URLTitleView = self->_URLTitleView;
  }

  return URLTitleView;
}

- (id)_URLView
{
  URLView = self->_URLView;
  if (!URLView)
  {
    id v4 = [EKTextViewWithLabelTextMetrics alloc];
    id v5 = -[EKTextViewWithLabelTextMetrics initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_URLView;
    self->_URLView = v5;

    double v7 = self->_URLView;
    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v7 setBackgroundColor:v8];

    [(UITextView *)self->_URLView setTextAlignment:2];
    [(UITextView *)self->_URLView setOpaque:0];
    [(UITextView *)self->_URLView setAutoresizingMask:2];
    [(UITextView *)self->_URLView setDelegate:self];
    URLView = self->_URLView;
  }

  return URLView;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v7 = a5;
  double v8 = [a4 link];
  double v9 = v8;
  double v10 = v7;
  if (v8)
  {
    double v11 = [v8 absoluteString];
    int v12 = [v11 isEqualToString:@"calshow://launchSuggestedEvent"];

    if (v12)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke;
      v17[3] = &unk_1E608AAE0;
      v17[4] = self;
      double v10 = [MEMORY[0x1E4FB13F0] actionWithHandler:v17];
    }
    else
    {
      double v10 = v7;
      if (+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI])
      {
        double v13 = (void *)MEMORY[0x1E4FB13F0];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_34;
        v15[3] = &unk_1E608AAE0;
        id v16 = v9;
        double v10 = [v13 actionWithHandler:v15];
      }
    }
  }

  return v10;
}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 launchAppForSuggestedEventUsingLaunchInfo:*(void *)(*(void *)(a1 + 32) + 1144) withCompletion:&__block_literal_global_53];
}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    double v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "Failed to open suggested event: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_34(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:&__block_literal_global_39];
}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_2_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    uint64_t v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL in OOP UI: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_URLView, 0);

  objc_storeStrong((id *)&self->_URLTitleView, 0);
}

@end