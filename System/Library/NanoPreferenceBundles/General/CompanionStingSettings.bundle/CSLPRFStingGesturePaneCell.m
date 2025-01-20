@interface CSLPRFStingGesturePaneCell
+ (double)preferredCellHeight;
- (CSLPRFStingGesturePaneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_imageForSymbolName:(id)a3 weight:(int64_t)a4 color:(id)a5;
- (void)_setChordArrowVisible:(BOOL)a3;
- (void)_setSymbol:(id)a3;
- (void)layoutSubviews;
@end

@implementation CSLPRFStingGesturePaneCell

- (CSLPRFStingGesturePaneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CSLPRFStingGesturePaneCell;
  v9 = [(CSLPRFStingGesturePaneCell *)&v27 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(CSLPRFStingGesturePaneCell *)v9 contentView];
    v12 = +[UIColor blackColor];
    [v11 setBackgroundColor:v12];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v14 = +[UIImage imageNamed:@"watchCase" inBundle:v13 compatibleWithTraitCollection:0];
    watchCaseImage = v10->_watchCaseImage;
    v10->_watchCaseImage = (UIImage *)v14;

    v16 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v10->_watchCaseImage];
    watchCaseView = v10->_watchCaseView;
    v10->_watchCaseView = v16;

    v18 = [(CSLPRFStingGesturePaneCell *)v10 contentView];
    [v18 addSubview:v10->_watchCaseView];

    v19 = +[UIColor cslprf_stingColor];
    v20 = [(CSLPRFStingGesturePaneCell *)v10 _imageForSymbolName:@"arrow.right" weight:4 color:v19];

    v21 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v20];
    stingArrowView = v10->_stingArrowView;
    v10->_stingArrowView = v21;

    v23 = [(CSLPRFStingGesturePaneCell *)v10 contentView];
    [v23 addSubview:v10->_stingArrowView];

    v24 = [v8 propertyForKey:@"CSLPRFStingGesturePaneCellSymbolName"];
    [(CSLPRFStingGesturePaneCell *)v10 _setSymbol:v24];
    v25 = [v8 propertyForKey:@"CSLPRFStingGesturePaneCellHasChordArrow"];
    -[CSLPRFStingGesturePaneCell _setChordArrowVisible:](v10, "_setChordArrowVisible:", [v25 BOOLValue]);
  }
  return v10;
}

- (id)_imageForSymbolName:(id)a3 weight:(int64_t)a4 color:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[UIImageSymbolConfiguration configurationWithPointSize:a4 weight:24.0];
  v10 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v7];

  v11 = [v9 configurationByApplyingConfiguration:v10];
  v12 = +[UIImage _systemImageNamed:v8 withConfiguration:v11];

  return v12;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CSLPRFStingGesturePaneCell;
  [(CSLPRFStingGesturePaneCell *)&v20 layoutSubviews];
  [(CSLPRFStingGesturePaneCell *)self center];
  double v4 = v3;
  [(UIImageView *)self->_watchCaseView center];
  -[UIImageView setCenter:](self->_watchCaseView, "setCenter:", v4, v5 + 5.0);
  [(UIImageView *)self->_watchCaseView center];
  double v7 = v6;
  [(UIImageView *)self->_watchCaseView center];
  [(UIImageView *)self->_actionSymbolView setCenter:v7];
  [(UIImageView *)self->_watchCaseView frame];
  double v9 = v8;
  [(UIImageView *)self->_stingArrowView frame];
  double v11 = v9 - v10 * 0.5 + -3.0;
  [(UIImageView *)self->_watchCaseView frame];
  -[UIImageView setCenter:](self->_stingArrowView, "setCenter:", v11, v12 + 69.0);
  [(UIImageView *)self->_watchCaseView frame];
  double v14 = v13;
  [(UIImageView *)self->_watchCaseView frame];
  double v16 = v14 + v15;
  [(UIImageView *)self->_sideButtonArrowView bounds];
  double v18 = v16 + v17 * 0.5 + 3.0;
  [(UIImageView *)self->_watchCaseView frame];
  -[UIImageView setCenter:](self->_sideButtonArrowView, "setCenter:", v18, v19 + 78.0);
}

+ (double)preferredCellHeight
{
  return 130.0;
}

- (void)_setSymbol:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = +[UIColor cslprf_stingColor];
    id v9 = [(CSLPRFStingGesturePaneCell *)self _imageForSymbolName:v4 weight:6 color:v5];

    double v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v9];
    actionSymbolView = self->_actionSymbolView;
    self->_actionSymbolView = v6;

    double v8 = [(CSLPRFStingGesturePaneCell *)self contentView];
    [v8 addSubview:self->_actionSymbolView];
  }
}

- (void)_setChordArrowVisible:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[UIColor systemWhiteColor];
    uint64_t v9 = [(CSLPRFStingGesturePaneCell *)self _imageForSymbolName:@"arrow.left" weight:4 color:v4];

    double v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v9];
    sideButtonArrowView = self->_sideButtonArrowView;
    self->_sideButtonArrowView = v5;

    double v7 = [(CSLPRFStingGesturePaneCell *)self contentView];
    [v7 addSubview:self->_sideButtonArrowView];

    double v8 = (UIImageView *)v9;
  }
  else
  {
    [(UIImageView *)self->_sideButtonArrowView removeFromSuperview];
    double v8 = self->_sideButtonArrowView;
    self->_sideButtonArrowView = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchCaseImage, 0);
  objc_storeStrong((id *)&self->_sideButtonArrowView, 0);
  objc_storeStrong((id *)&self->_stingArrowView, 0);
  objc_storeStrong((id *)&self->_actionSymbolView, 0);

  objc_storeStrong((id *)&self->_watchCaseView, 0);
}

@end