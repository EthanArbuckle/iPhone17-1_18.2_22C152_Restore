@interface NCNotificationListDisplayStyleCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)selectionViews;
- (int64_t)_notificationListDisplayStyleSettingForSelectionType:(unint64_t)a3;
- (void)_configureSelectionViewsIfNecessary;
- (void)_layoutSelectionViews;
- (void)layoutSubviews;
- (void)notificationListDisplayStyleSelectionViewDidGetSelected:(id)a3;
- (void)setSelectionViews:(id)a3;
@end

@implementation NCNotificationListDisplayStyleCell

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListDisplayStyleCell;
  [(NCNotificationListDisplayStyleCell *)&v3 layoutSubviews];
  [(NCNotificationListDisplayStyleCell *)self _configureSelectionViewsIfNecessary];
  [(NCNotificationListDisplayStyleCell *)self _layoutSelectionViews];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  [(NCNotificationListDisplayStyleCell *)self _configureSelectionViewsIfNecessary];
  v6 = [(NCNotificationListDisplayStyleCell *)self selectionViews];
  id v7 = [v6 count];

  v8 = [(NCNotificationListDisplayStyleCell *)self selectionViews];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_14548;
  v12[3] = &unk_411F8;
  v12[4] = &v13;
  *(double *)&v12[5] = width / (double)(unint64_t)v7;
  *(double *)&v12[6] = width;
  *(CGFloat *)&v12[7] = height;
  [v8 enumerateObjectsUsingBlock:v12];

  double v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  double v10 = width;
  double v11 = v9;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (void)notificationListDisplayStyleSelectionViewDidGetSelected:(id)a3
{
  id v4 = a3;
  v5 = [(NCNotificationListDisplayStyleCell *)self selectionViews];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_146A8;
  v9[3] = &unk_41220;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = [(NCNotificationListDisplayStyleCell *)self specifier];
  v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NCNotificationListDisplayStyleCell _notificationListDisplayStyleSettingForSelectionType:](self, "_notificationListDisplayStyleSettingForSelectionType:", [v6 selectionType]));
  [v7 performSetterWithValue:v8];
}

- (void)_configureSelectionViewsIfNecessary
{
  objc_super v3 = [(NCNotificationListDisplayStyleCell *)self selectionViews];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    if ([(NCNotificationListDisplayStyleCell *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
    {
      objc_msgSend(&off_44850, "bs_reverse");
      v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &off_44850;
    }
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    double v11 = sub_147D0;
    v12 = &unk_41248;
    uint64_t v13 = self;
    id v14 = v4;
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:&v9];
    id v7 = (NSArray *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
    selectionViews = self->_selectionViews;
    self->_selectionViews = v7;
  }
}

- (void)_layoutSelectionViews
{
  objc_super v3 = [(NCNotificationListDisplayStyleCell *)self selectionViews];

  if (v3)
  {
    [(NCNotificationListDisplayStyleCell *)self bounds];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
    double v8 = CGRectGetWidth(v17);
    double v9 = [(NCNotificationListDisplayStyleCell *)self selectionViews];
    double v10 = v8 / (double)(unint64_t)[v9 count];

    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x4010000000;
    v14[3] = &unk_3DB6E;
    long long v15 = 0u;
    long long v16 = 0u;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGFloat v11 = CGRectGetHeight(v18);
    long long v15 = 0uLL;
    *(double *)&long long v16 = v10;
    *((CGFloat *)&v16 + 1) = v11;
    v12 = [(NCNotificationListDisplayStyleCell *)self selectionViews];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_14A0C;
    v13[3] = &unk_41270;
    v13[4] = v14;
    *(double *)&v13[5] = v10;
    [v12 enumerateObjectsUsingBlock:v13];

    _Block_object_dispose(v14, 8);
  }
}

- (int64_t)_notificationListDisplayStyleSettingForSelectionType:(unint64_t)a3
{
  if (a3 <= 3) {
    return 3 - a3;
  }
  else {
    return 0;
  }
}

- (NSArray)selectionViews
{
  return self->_selectionViews;
}

- (void)setSelectionViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end