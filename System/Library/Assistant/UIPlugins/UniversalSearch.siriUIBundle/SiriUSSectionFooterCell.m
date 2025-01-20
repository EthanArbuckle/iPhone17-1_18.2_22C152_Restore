@interface SiriUSSectionFooterCell
- (SiriUSSectionFooterCell)initWithPunchOut:(id)a3;
@end

@implementation SiriUSSectionFooterCell

- (SiriUSSectionFooterCell)initWithPunchOut:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SiriUSSectionFooterCell;
  v5 = [(SiriUSSectionFooterCell *)&v26 init];
  if (v5)
  {
    v23 = +[SiriUIAttributionImage attributionImageFromAppPunchOut:v4];
    id v6 = objc_alloc_init((Class)UIImageView);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(SiriUSSectionFooterCell *)v5 contentView];
    [v7 addSubview:v6];

    [(SiriUSSectionFooterCell *)v5 setBackgroundView:0];
    v8 = +[UIColor clearColor];
    [(SiriUSSectionFooterCell *)v5 setBackgroundColor:v8];

    v9 = +[NSMutableArray array];
    v10 = [(SiriUSSectionFooterCell *)v5 contentView];
    CFStringRef v29 = @"minimumCellHeight";
    v11 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[26]];
    v30 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v13 = _NSDictionaryOfVariableBindings(@"contentView", v10, 0);
    v14 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentView(>=minimumCellHeight)]" options:0 metrics:v12 views:v13];
    [v9 addObjectsFromArray:v14];

    CFStringRef v27 = @"spacing";
    v15 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[34]];
    v28 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v17 = _NSDictionaryOfVariableBindings(@"attributionImageView", v6, 0);
    v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[attributionImageView]-spacing-|" options:0 metrics:v16 views:v17];
    [v9 addObjectsFromArray:v18];

    v19 = _NSDictionaryOfVariableBindings(@"contentView, attributionImageView", v10, v6, 0);
    v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[contentView]-(<=1)-[attributionImageView]", 1024, 0, v19);
    [v9 addObjectsFromArray:v20];

    +[NSLayoutConstraint activateConstraints:v9];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_294C;
    v24[3] = &unk_82F8;
    id v25 = v6;
    id v21 = v6;
    [v23 getLogoWithCompletion:v24];
  }
  return v5;
}

@end