@interface EKEventDetailCell
+ (double)_scaledDistanceCalculatedFromBottomToBaseline:(double)a3;
+ (double)_scaledDistanceCalculatedFromTopFromBaseline:(double)a3;
+ (double)detailsBottomVerticalInset;
+ (double)detailsCellDefaultHeight;
+ (double)detailsPostLabelSpace;
+ (double)detailsTopVerticalInset;
+ (id)_bodyFontAtDefaultSize;
- (BOOL)isEditable;
- (BOOL)needsLayoutForWidth:(double)a3 position:(int)a4;
- (BOOL)update;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKEvent)event;
- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4;
- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5;
- (double)detailsLeftInset;
- (double)detailsRightInset;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutMarginsDidChange;
- (void)setEvent:(id)a3;
@end

@implementation EKEventDetailCell

- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  return [(EKEventDetailCell *)self initWithEvent:a3 editable:a4 style:0];
}

- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5
{
  id v8 = a3;
  v9 = [(EKUITableViewCell *)self initWithStyle:a5 reuseIdentifier:0];
  v10 = v9;
  if (v9)
  {
    v9->_editable = a4;
    [(EKEventDetailCell *)v9 setEvent:v8];
  }

  return v10;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  v5 = (EKEvent *)a3;
  if (self->_event != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_event, a3);
    v5 = v6;
  }
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)update
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(id)objc_opt_class() detailsCellDefaultHeight];
  if (height < v5)
  {
    [(id)objc_opt_class() detailsCellDefaultHeight];
    double height = v6;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  [(EKEventDetailCell *)self setSelectionStyle:[(EKEventDetailCell *)self accessoryType] == 1];
  self->_lastLaidOutWidth = a3;
  self->_lastLaidOutPosition = a4;
}

- (BOOL)needsLayoutForWidth:(double)a3 position:(int)a4
{
  return self->_lastLaidOutWidth != a3 || self->_lastLaidOutPosition != a4;
}

+ (id)_bodyFontAtDefaultSize
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
}

+ (double)_scaledDistanceCalculatedFromTopFromBaseline:(double)a3
{
  double v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  double v6 = [a1 _bodyFontAtDefaultSize];
  [v6 ascender];
  [v5 _scaledValueForValue:v7 + a3];
  double v9 = v8;
  [v5 ascender];
  CalRoundToScreenScale(v9 - v10);
  if (v11 >= a3) {
    a3 = v11;
  }

  return a3;
}

+ (double)_scaledDistanceCalculatedFromBottomToBaseline:(double)a3
{
  double v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  double v6 = [a1 _bodyFontAtDefaultSize];
  [v6 descender];
  [v5 _scaledValueForValue:a3 - v7];
  double v9 = v8;
  [v5 descender];
  CalRoundToScreenScale(v9 + v10);
  if (v11 >= a3) {
    a3 = v11;
  }

  return a3;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailCell;
  [(EKEventDetailCell *)&v3 layoutMarginsDidChange];
  [(EKEventDetailCell *)self setNeedsLayout];
}

- (double)detailsLeftInset
{
  [(EKEventDetailCell *)self layoutMargins];
  double v4 = v3;
  [(EKEventDetailCell *)self safeAreaInsets];
  return v4 - v5;
}

- (double)detailsRightInset
{
  [(EKEventDetailCell *)self layoutMargins];
  double v4 = v3;
  [(EKEventDetailCell *)self safeAreaInsets];
  return v4 - v5;
}

+ (double)detailsTopVerticalInset
{
  [a1 _scaledDistanceCalculatedFromTopFromBaseline:12.0];
  return result;
}

+ (double)detailsBottomVerticalInset
{
  [a1 _scaledDistanceCalculatedFromBottomToBaseline:9.0];
  return result;
}

+ (double)detailsPostLabelSpace
{
  [a1 _scaledDistanceCalculatedFromBottomToBaseline:9.0];
  return result;
}

+ (double)detailsCellDefaultHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  double v3 = 44.0;
  [v2 _scaledValueForValue:44.0];
  CalRoundToScreenScale(v4);
  if (v5 >= 44.0) {
    double v3 = v5;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end