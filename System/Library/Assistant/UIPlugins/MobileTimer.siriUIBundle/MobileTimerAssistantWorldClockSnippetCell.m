@interface MobileTimerAssistantWorldClockSnippetCell
- (MobileTimerAssistantWorldClockSnippetCell)initWithFrame:(CGRect)a3;
- (SAClockObject)clock;
- (id)reuseIdentifier;
- (void)_updateForContentSizeChange;
- (void)setClock:(id)a3;
@end

@implementation MobileTimerAssistantWorldClockSnippetCell

- (MobileTimerAssistantWorldClockSnippetCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MobileTimerAssistantWorldClockSnippetCell;
  v3 = -[MobileTimerAssistantWorldClockSnippetCell initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MobileTimerAssistantWorldClockSnippetCell *)v3 setKeylineType:0];
    id v5 = objc_alloc((Class)MTUIWorldClockCellView);
    [(MobileTimerAssistantWorldClockSnippetCell *)v4 bounds];
    v6 = (MTUIWorldClockCellView *)objc_msgSend(v5, "initWithFrame:");
    clockCellView = v4->_clockCellView;
    v4->_clockCellView = v6;

    v8 = +[UIColor siriui_textColor];
    v9 = [(MTUIWorldClockCellView *)v4->_clockCellView nameLabel];
    [v9 setTextColor:v8];

    v10 = +[UIColor siriui_semiTransparentTextColor];
    v11 = [(MTUIWorldClockCellView *)v4->_clockCellView combinedLabel];
    [v11 setTextColor:v10];

    v12 = +[UIColor siriui_textColor];
    v13 = [(MTUIWorldClockCellView *)v4->_clockCellView digitalClock];
    [v13 setTextColor:v12];

    [(MTUIWorldClockCellView *)v4->_clockCellView setAutoresizingMask:18];
    [(MobileTimerAssistantWorldClockSnippetCell *)v4 textAndAccessoryInsets];
    [(MTUIWorldClockCellView *)v4->_clockCellView setLayoutMargins:"setLayoutMargins:"];
    v14 = [(MobileTimerAssistantWorldClockSnippetCell *)v4 contentView];
    [v14 addSubview:v4->_clockCellView];

    v15 = objc_opt_new();
    v16 = _NSDictionaryOfVariableBindings(@"_clockCellView", v4->_clockCellView, 0);
    v17 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_clockCellView]|" options:0 metrics:0 views:v16];
    [v15 addObjectsFromArray:v17];

    v18 = _NSDictionaryOfVariableBindings(@"_clockCellView", v4->_clockCellView, 0);
    v19 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_clockCellView]|" options:0 metrics:0 views:v18];
    [v15 addObjectsFromArray:v19];

    v20 = [(MTUIWorldClockCellView *)v4->_clockCellView heightAnchor];
    +[MTUIWorldClockCellView defaultHeight];
    v21 = objc_msgSend(v20, "constraintEqualToConstant:");
    [v15 addObject:v21];

    +[NSLayoutConstraint activateConstraints:v15];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v4 selector:"_updateForContentSizeChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v23 = v4;
  }

  return v4;
}

- (id)reuseIdentifier
{
  return @"WCSn";
}

- (void)_updateForContentSizeChange
{
}

- (void)setClock:(id)a3
{
  id v5 = (SAClockObject *)a3;
  p_clock = &self->_clock;
  if (self->_clock != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_clock, a3);
    v7 = [(SAClockObject *)*p_clock cityName];
    v8 = [(MTUIWorldClockCellView *)self->_clockCellView nameLabel];
    [v8 setText:v7];

    v9 = [(SAClockObject *)*p_clock timezoneId];
    v10 = +[NSTimeZone timeZoneWithName:v9];

    [(MTUIWorldClockCellView *)self->_clockCellView setTimeZone:v10];
    [(MobileTimerAssistantWorldClockSnippetCell *)self setNeedsLayout];

    id v5 = v11;
  }
}

- (SAClockObject)clock
{
  return self->_clock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);

  objc_storeStrong((id *)&self->_clockCellView, 0);
}

@end