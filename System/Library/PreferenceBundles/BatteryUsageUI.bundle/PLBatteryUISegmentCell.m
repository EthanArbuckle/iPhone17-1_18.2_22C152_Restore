@interface PLBatteryUISegmentCell
- (BOOL)checkIfFontFits:(id)a3 withSegment1:(id)a4 andSegment2:(id)a5;
- (BOOL)clearGraph;
- (BOOL)requiresTopSeparator;
- (UIView)topSeparator;
- (id)getFittingPreferredFontFromSegment1:(id)a3 andSegment2:(id)a4;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setClearGraph:(BOOL)a3;
- (void)setRequiresTopSeparator:(BOOL)a3;
- (void)setTopSeparator:(id)a3;
@end

@implementation PLBatteryUISegmentCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLBatteryUISegmentCell;
  id v4 = a3;
  [(PLBatteryUISegmentCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"PLBatteryUIGraphClearGraphKey", v7.receiver, v7.super_class);
  -[PLBatteryUISegmentCell setClearGraph:](self, "setClearGraph:", [v5 BOOLValue]);

  v6 = [v4 propertyForKey:@"PLBatteryUIGraphRequiresTopSeparatorKey"];

  -[PLBatteryUISegmentCell setRequiresTopSeparator:](self, "setRequiresTopSeparator:", [v6 BOOLValue]);
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PLBatteryUISegmentCell;
  [(PLBatteryUISegmentCell *)&v28 layoutSubviews];
  if ([(PLBatteryUISegmentCell *)self requiresTopSeparator])
  {
    uint64_t v3 = [(PLBatteryUISegmentCell *)self topSeparator];
    if (!v3 || (id v4 = (void *)v3, v5 = [(PLBatteryUISegmentCell *)self clearGraph], v4, v5))
    {
      v6 = [(PLBatteryUISegmentCell *)self topSeparator];

      if (v6)
      {
        objc_super v7 = [(PLBatteryUISegmentCell *)self topSeparator];
        [v7 removeFromSuperview];
      }
      id v8 = objc_alloc((Class)UIView);
      [(PLBatteryUISegmentCell *)self frame];
      double v10 = v9;
      v11 = +[UIScreen mainScreen];
      [v11 scale];
      id v13 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, v10, 1.0 / v12);
      [(PLBatteryUISegmentCell *)self setTopSeparator:v13];

      v14 = [(PLBatteryUISegmentCell *)self separatorColor];
      v15 = [(PLBatteryUISegmentCell *)self topSeparator];
      [v15 setBackgroundColor:v14];

      v16 = [(PLBatteryUISegmentCell *)self topSeparator];
      [(PLBatteryUISegmentCell *)self addSubview:v16];
    }
  }
  v17 = +[UIColor systemBlueColor];
  [(PLBatteryUISegmentCell *)self setTintColor:v17];

  v18 = [(PLBatteryUISegmentCell *)self control];
  [v18 frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  v27 = [(PLBatteryUISegmentCell *)self control];
  objc_msgSend(v27, "setFrame:", v20 + 10.0, v22 + 4.0, v24 + -20.0, v26);
}

- (id)getFittingPreferredFontFromSegment1:(id)a3 andSegment2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v8 pointSize];
  for (double i = v9; i > 0.0; double i = i + -0.5)
  {
    v11 = [v8 fontWithSize:i];
    unsigned __int8 v12 = [(PLBatteryUISegmentCell *)self checkIfFontFits:v11 withSegment1:v6 andSegment2:v7];

    if (v12) {
      break;
    }
  }
  id v13 = [v8 fontWithSize:i];

  return v13;
}

- (BOOL)checkIfFontFits:(id)a3 withSegment1:(id)a4 andSegment2:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PLBatteryUISegmentCell *)self control];
  [v11 frame];
  double v13 = v12;
  if (v8)
  {
    double v14 = v12 * 0.5;

    +[PLBatteryUIUtilities getOneLineWidthOfText:v9 withFont:v10];
    double v16 = v15;

    +[PLBatteryUIUtilities getOneLineWidthOfText:v8 withFont:v10];
    double v18 = v17;

    BOOL v19 = v18 <= v14 && v16 <= v14;
  }
  else
  {

    +[PLBatteryUIUtilities getOneLineWidthOfText:v9 withFont:v10];
    double v21 = v20;

    BOOL v19 = v21 <= v13;
  }

  return v19;
}

- (UIView)topSeparator
{
  return (UIView *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTopSeparator:(id)a3
{
}

- (BOOL)clearGraph
{
  return self->_clearGraph;
}

- (void)setClearGraph:(BOOL)a3
{
  self->_clearGraph = a3;
}

- (BOOL)requiresTopSeparator
{
  return self->_requiresTopSeparator;
}

- (void)setRequiresTopSeparator:(BOOL)a3
{
  self->_requiresTopSeparator = a3;
}

- (void).cxx_destruct
{
}

@end