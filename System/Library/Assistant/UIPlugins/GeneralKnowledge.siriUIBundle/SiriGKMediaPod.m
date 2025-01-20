@interface SiriGKMediaPod
- (NSMutableArray)viewArray;
- (UIEdgeInsets)edgeInsets;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (id)footerView;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
- (void)setViewArray:(id)a3;
@end

@implementation SiriGKMediaPod

- (int64_t)viewCount
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)viewAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_viewArray objectAtIndexedSubscript:a3];
}

- (double)minimumInteritemSpacing
{
  char IsPad = SiriUIDeviceIsPad();
  double v3 = 9.0;
  int v4 = SiriUIIsCompactWidth();
  if ((IsPad & 1) == 0)
  {
    if (SiriUIIsLargePhoneLayout()) {
      double v3 = 14.0;
    }
    else {
      double v3 = 9.0;
    }
  }
  double result = 14.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (double)minimumLineSpacing
{
  char IsPad = SiriUIDeviceIsPad();
  double v3 = 9.0;
  int v4 = SiriUIIsCompactWidth();
  if ((IsPad & 1) == 0)
  {
    if (SiriUIIsLargePhoneLayout()) {
      double v3 = 14.0;
    }
    else {
      double v3 = 9.0;
    }
  }
  double result = 14.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  int IsPad = SiriUIDeviceIsPad();
  int v3 = SiriUIIsCompactWidth();
  if (IsPad)
  {
    double v4 = 9.0;
    if (!v3) {
      double v4 = 14.0;
    }
  }
  else
  {
    SiriUIIsLargePhoneLayout();
    double v4 = 16.0;
  }
  double v5 = 16.0;
  double v6 = 16.0;
  double v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (int64_t)keylineType
{
  return 0;
}

- (id)footerView
{
  return +[SiriUIKeyline keylineWithDefaultInsets];
}

- (NSMutableArray)viewArray
{
  return self->_viewArray;
}

- (void)setViewArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end