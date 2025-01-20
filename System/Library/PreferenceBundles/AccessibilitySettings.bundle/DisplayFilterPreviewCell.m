@interface DisplayFilterPreviewCell
+ (double)previewCellHeight;
- (DisplayFilterPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)previewImageView;
- (void)layoutSubviews;
- (void)setPreviewImageView:(id)a3;
@end

@implementation DisplayFilterPreviewCell

+ (double)previewCellHeight
{
  v2 = +[UIDevice currentDevice];
  [v2 userInterfaceIdiom];

  return 200.0;
}

- (DisplayFilterPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)DisplayFilterPreviewCell;
  v5 = [(DisplayFilterPreviewCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = +[UIImage imageNamed:@"DisplayFilterPreview" inBundle:v6];
    v8 = +[UIDevice currentDevice];
    [v8 userInterfaceIdiom];

    [v7 size];
    id v11 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v10 * (200.0 / v9), v9 * (200.0 / v9));
    [v11 setImage:v7];
    [(DisplayFilterPreviewCell *)v5 addSubview:v11];
    [(DisplayFilterPreviewCell *)v5 setPreviewImageView:v11];
    v12 = v5;
  }
  return v5;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)DisplayFilterPreviewCell;
  [(DisplayFilterPreviewCell *)&v10 layoutSubviews];
  [(DisplayFilterPreviewCell *)self bounds];
  if (v3 <= v4) {
    double v5 = v3;
  }
  else {
    double v5 = v4;
  }
  double v6 = v5 + -40.0;
  double v7 = (v3 - (v5 + -40.0)) * 0.5;
  double v8 = (v4 - (v5 + -40.0)) * 0.5;
  double v9 = [(DisplayFilterPreviewCell *)self previewImageView];
  objc_msgSend(v9, "setFrame:", v7, v8, v6, v6);
}

- (UIImageView)previewImageView
{
  return self->_previewImageView;
}

- (void)setPreviewImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end