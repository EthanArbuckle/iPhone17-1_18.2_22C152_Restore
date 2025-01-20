@interface MFSendLaterHeaderCollectionViewHelper
- (BOOL)updateLayoutMarginsIfNeeded:(UIEdgeInsets)a3;
- (BOOL)updateWidthIfNeeded:(double)a3;
- (BOOL)willContentTruncate;
- (MFSendLaterHeaderCollectionViewHelper)initWithWidth:(double)a3 layoutMargins:(UIEdgeInsets)a4 viewScale:(double)a5;
- (UIEdgeInsets)layoutMargins;
- (double)_widthOfString:(void *)a1;
- (double)longestDateWidth;
- (double)longestTimeWidth;
- (double)sendLaterLabelWidth;
- (double)viewScale;
- (double)width;
- (id)_convertDateToString:(uint64_t)a1;
- (id)_convertTimeToString:(uint64_t)a1;
- (void)precalculateWidthsWithDescription:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLongestDateWidth:(double)a3;
- (void)setLongestTimeWidth:(double)a3;
- (void)setSendLaterLabelWidth:(double)a3;
- (void)setViewScale:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation MFSendLaterHeaderCollectionViewHelper

- (MFSendLaterHeaderCollectionViewHelper)initWithWidth:(double)a3 layoutMargins:(UIEdgeInsets)a4 viewScale:(double)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v12.receiver = self;
  v12.super_class = (Class)MFSendLaterHeaderCollectionViewHelper;
  result = [(MFSendLaterHeaderCollectionViewHelper *)&v12 init];
  if (result)
  {
    result->_layoutMargins.CGFloat top = top;
    result->_layoutMargins.CGFloat left = left;
    result->_layoutMargins.CGFloat bottom = bottom;
    result->_layoutMargins.CGFloat right = right;
    result->_width = a3;
    result->_viewScale = a5;
  }
  return result;
}

- (void)precalculateWidthsWithDescription:(id)a3
{
  id v10 = a3;
  -[MFSendLaterHeaderCollectionViewHelper setSendLaterLabelWidth:](self, "setSendLaterLabelWidth:", -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v10));
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setDay:30];
  [v4 setYear:2888];
  [v4 setHour:12];
  [v4 setMinute:0];
  for (uint64_t i = 1; i != 13; ++i)
  {
    [v4 setMonth:i];
    v6 = -[MFSendLaterHeaderCollectionViewHelper _convertDateToString:]((uint64_t)self, v4);
    double v7 = -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v6);
    [(MFSendLaterHeaderCollectionViewHelper *)self longestDateWidth];
    if (v7 >= v8) {
      double v8 = v7;
    }
    [(MFSendLaterHeaderCollectionViewHelper *)self setLongestDateWidth:v8];
  }
  v9 = -[MFSendLaterHeaderCollectionViewHelper _convertTimeToString:]((uint64_t)self, v4);
  -[MFSendLaterHeaderCollectionViewHelper setLongestTimeWidth:](self, "setLongestTimeWidth:", -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v9));
}

- (double)_widthOfString:(void *)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v11[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3 attributes:v5];
    [v6 size];
    [a1 viewScale];
    UIRoundToScale();
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)_convertDateToString:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v5 = [v4 dateFromComponents:v3];
    v6 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v5 dateStyle:2 timeStyle:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_convertTimeToString:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v5 = [v4 dateFromComponents:v3];
    v6 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v5 dateStyle:0 timeStyle:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)willContentTruncate
{
  [(MFSendLaterHeaderCollectionViewHelper *)self layoutMargins];
  double v4 = v3 + 48.0;
  [(MFSendLaterHeaderCollectionViewHelper *)self layoutMargins];
  double v6 = v4 + v5;
  [(MFSendLaterHeaderCollectionViewHelper *)self sendLaterLabelWidth];
  double v8 = v7;
  [(MFSendLaterHeaderCollectionViewHelper *)self longestDateWidth];
  double v10 = v8 + v9;
  [(MFSendLaterHeaderCollectionViewHelper *)self longestTimeWidth];
  double v12 = v6 + v10 + v11 + 4.0 + 8.0 + 3.0;
  [(MFSendLaterHeaderCollectionViewHelper *)self width];
  return v12 >= v13;
}

- (BOOL)updateLayoutMarginsIfNeeded:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(MFSendLaterHeaderCollectionViewHelper *)self layoutMargins];
  double v9 = left - v8;
  double v10 = -(left - v8);
  if (v9 < 0.0) {
    double v9 = v10;
  }
  if (v9 < 2.22044605e-16)
  {
    [(MFSendLaterHeaderCollectionViewHelper *)self layoutMargins];
    double v12 = right - v11;
    if (right - v11 < 0.0) {
      double v12 = -(right - v11);
    }
    if (v12 < 2.22044605e-16) {
      return 0;
    }
  }
  -[MFSendLaterHeaderCollectionViewHelper setLayoutMargins:](self, "setLayoutMargins:", top, left, bottom, right);
  return 1;
}

- (BOOL)updateWidthIfNeeded:(double)a3
{
  [(MFSendLaterHeaderCollectionViewHelper *)self width];
  double v6 = v5 - a3;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = -v6;
  }
  if (v7 >= 2.22044605e-16) {
    [(MFSendLaterHeaderCollectionViewHelper *)self setWidth:a3];
  }
  return v7 >= 2.22044605e-16;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (double)sendLaterLabelWidth
{
  return self->_sendLaterLabelWidth;
}

- (void)setSendLaterLabelWidth:(double)a3
{
  self->_sendLaterLabelWidth = a3;
}

- (double)longestDateWidth
{
  return self->_longestDateWidth;
}

- (void)setLongestDateWidth:(double)a3
{
  self->_longestDateWidth = a3;
}

- (double)longestTimeWidth
{
  return self->_longestTimeWidth;
}

- (void)setLongestTimeWidth:(double)a3
{
  self->_longestTimeWidth = a3;
}

@end