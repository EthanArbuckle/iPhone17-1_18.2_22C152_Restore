@interface EKCalendarChooserCellLayoutManager
+ (id)sharedLayoutManagerForStyle:(int64_t)a3;
- (BOOL)rect:(CGRect)a3 trailsOtherRect:(CGRect)a4 byDistance:(double *)a5;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (EKCalendarChooserCellLayoutManager)initWithCellStyle:(int64_t)a3;
- (double)defaultDetailTextLabelFontSizeForCell:(id)a3;
- (double)defaultTextLabelFontSizeForCell:(id)a3;
- (id)defaultDetailTextLabelFontForCell:(id)a3;
- (id)defaultTextLabelFontForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7;
@end

@implementation EKCalendarChooserCellLayoutManager

+ (id)sharedLayoutManagerForStyle:(int64_t)a3
{
  v5 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
  if (!sharedLayoutManagerForStyle__sLayoutManagers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
    sharedLayoutManagerForStyle__sLayoutManagers = v6;

    v5 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
  }
  v8 = [NSNumber numberWithInteger:a3];
  v9 = [v5 objectForKey:v8];

  if (!v9)
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithCellStyle:a3];
    v10 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
    v11 = [NSNumber numberWithInteger:a3];
    [v10 setObject:v9 forKey:v11];
  }

  return v9;
}

- (EKCalendarChooserCellLayoutManager)initWithCellStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCellLayoutManager;
  v4 = [(EKCalendarChooserCellLayoutManager *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1D10] layoutManagerForTableViewCellStyle:a3];
    id realLayoutManager = v4->_realLayoutManager;
    v4->_id realLayoutManager = (id)v5;
  }
  return v4;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [self->_realLayoutManager textRectForCell:v8 rowWidth:v5 forSizing:a4];
  double v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([v8 showCheckmarksOnLeft] & 1) != 0 || objc_msgSend(v8, "showsColorDot")))
  {
    [v8 textLeadingIndent];
    double v18 = v17;
    if (CalInterfaceIsLeftToRight())
    {
      double v14 = v14 - (v18 - v10);
      double v10 = v18;
    }
    else
    {
      v19 = [v8 contentView];
      [v19 bounds];
      double MaxX = CGRectGetMaxX(v27);
      v28.origin.x = v10;
      v28.origin.y = v12;
      v28.size.width = v14;
      v28.size.height = v16;
      double v21 = MaxX - CGRectGetMaxX(v28);

      double v14 = v14 - (v18 - v21);
      v22 = [v8 contentView];
      [v22 bounds];
      double v10 = CGRectGetMaxX(v29) - v14 - v18;
    }
  }

  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  [self->_realLayoutManager defaultTextLabelFontSizeForCell:a3];
  return result;
}

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  [self->_realLayoutManager defaultDetailTextLabelFontSizeForCell:a3];
  return result;
}

- (id)detailTextLabelForCell:(id)a3
{
  return (id)[self->_realLayoutManager detailTextLabelForCell:a3];
}

- (id)defaultTextLabelFontForCell:(id)a3
{
  return (id)[self->_realLayoutManager defaultTextLabelFontForCell:a3];
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  return (id)[self->_realLayoutManager defaultDetailTextLabelFontForCell:a3];
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  [self->_realLayoutManager getTextLabelRect:a3 detailTextLabelRect:a4 forCell:v12 rowWidth:v7 forSizing:a6];
  [(EKCalendarChooserCellLayoutManager *)self textRectForCell:v12 rowWidth:v7 forSizing:a6];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  char v22 = IsLeftToRight;
  if (a3)
  {
    CGFloat y = a3->origin.y;
    CGFloat height = a3->size.height;
    if (IsLeftToRight)
    {
      v36.origin.double x = a3->origin.x;
      v36.origin.CGFloat y = a3->origin.y;
      v36.size.double width = v18;
      v36.size.CGFloat height = a3->size.height;
      CGRect v37 = CGRectOffset(v36, v14 - a3->origin.x, 0.0);
      double x = v37.origin.x;
      CGFloat y = v37.origin.y;
      CGFloat height = v37.size.height;
    }
    else
    {
      [v12 textLeadingIndent];
      double v27 = v26;
      CGRect v28 = [v12 contentView];
      [v28 bounds];
      double x = v29 - v18 - v27;

      v37.size.double width = v18;
    }
    a3->origin.double x = x;
    a3->origin.CGFloat y = y;
    a3->size.double width = v37.size.width;
    a3->size.CGFloat height = height;
  }
  if (a4)
  {
    double v30 = a4->origin.x;
    double v31 = a4->origin.y;
    double width = a4->size.width;
    double v33 = a4->size.height;
    double v35 = 0.0;
    if (-[EKCalendarChooserCellLayoutManager rect:trailsOtherRect:byDistance:](self, "rect:trailsOtherRect:byDistance:", &v35, v14, v16, v18, v20, v30, v31, width, v33))
    {
      double v34 = v35;
      if ((v22 & 1) == 0)
      {
        double v34 = -v35;
        double v35 = -v35;
      }
      v38.origin.double x = v30;
      v38.origin.CGFloat y = v31;
      v38.size.double width = width;
      v38.size.CGFloat height = v33;
      *a4 = CGRectOffset(v38, v34, 0.0);
    }
  }
}

- (BOOL)rect:(CGRect)a3 trailsOtherRect:(CGRect)a4 byDistance:(double *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  double v13 = a3.origin.x;
  if (CalInterfaceIsLeftToRight())
  {
    double v14 = v13 - x;
  }
  else
  {
    v17.origin.double x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v17);
    v18.origin.double x = v13;
    v18.origin.CGFloat y = v12;
    v18.size.CGFloat width = v11;
    v18.size.CGFloat height = v10;
    double v14 = MaxX - CGRectGetMaxX(v18);
  }
  *a5 = v14;
  return v14 > 0.0;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  [self->_realLayoutManager intrinsicContentSizeForCell:a3 rowWidth:a4];
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (void).cxx_destruct
{
}

@end