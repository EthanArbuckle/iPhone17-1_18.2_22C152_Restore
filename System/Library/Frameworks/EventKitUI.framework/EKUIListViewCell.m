@interface EKUIListViewCell
+ (BOOL)drawsBackgroundForEvent:(id)a3;
+ (UIEdgeInsets)adjustedSeparatorInsets;
+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4;
- (BOOL)carplayMode;
- (BOOL)dragPreview;
- (EKUIListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)initForCarplayWithReuseIdentifier:(id)a3;
- (id)initForDragPreview;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation EKUIListViewCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewCell;
  v3 = [(EKUITableViewCell *)&v6 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v3->_carplayMode = 1;
    [(EKUIListViewCell *)v3 setAutomaticallyUpdatesBackgroundConfiguration:0];
  }
  return v4;
}

- (id)initForDragPreview
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewCell;
  v2 = [(EKUITableViewCell *)&v5 initWithStyle:0 reuseIdentifier:0];
  v3 = v2;
  if (v2)
  {
    v2->_dragPreview = 1;
    [(EKUIListViewCell *)v2 setAutomaticallyUpdatesBackgroundConfiguration:0];
  }
  return v3;
}

- (EKUIListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewCell;
  v4 = [(EKUITableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4) {
    [(EKUIListViewCell *)v4 setAutomaticallyUpdatesBackgroundConfiguration:0];
  }
  return v5;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v23 = a3;
  if ([v23 isSelected] && !-[EKUIListViewCell carplayMode](self, "carplayMode"))
  {
    objc_super v6 = [(EKUIListViewCell *)self defaultBackgroundConfiguration];
    v4 = [v6 updatedConfigurationForState:v23];

    LODWORD(v6) = CalInterfaceIsLeftToRight();
    [(EKUIListViewCell *)self safeAreaInsets];
    if (v6) {
      double v9 = v7;
    }
    else {
      double v9 = v8;
    }
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    [(EKUIListViewCell *)self safeAreaInsets];
    if (IsLeftToRight) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
    int v14 = CalInterfaceIsLeftToRight();
    [(EKUIListViewCell *)self layoutMargins];
    if (v14) {
      double v17 = v15;
    }
    else {
      double v17 = v16;
    }
    int v18 = CalInterfaceIsLeftToRight();
    [(EKUIListViewCell *)self layoutMargins];
    if (v18) {
      double v21 = v20;
    }
    else {
      double v21 = v19;
    }
    double v22 = v21 + -8.0;
    [v4 setCornerRadius:6.0];
    objc_msgSend(v4, "setBackgroundInsets:", 4.0, v9 - (v17 + -8.0), 4.0, v13 - v22);
    [v4 setEdgesAddingLayoutMarginsToBackgroundInsets:10];
    [(EKUIListViewCell *)self setBackgroundConfiguration:v4];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1498] clearConfiguration];
    objc_super v5 = [v4 updatedConfigurationForState:v23];
    [(EKUIListViewCell *)self setBackgroundConfiguration:v5];
  }
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (BOOL)drawsBackgroundForEvent:(id)a3
{
  return +[EKUIListViewCellBackground drawsBackgroundForEvent:a3];
}

+ (UIEdgeInsets)adjustedSeparatorInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)carplayMode
{
  return self->_carplayMode;
}

- (BOOL)dragPreview
{
  return self->_dragPreview;
}

@end