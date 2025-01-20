@interface DisplayFilterPageViewController
- (double)pageHeight;
- (int64_t)pageIndex;
- (void)setPageHeight:(double)a3;
- (void)setPageIndex:(int64_t)a3;
@end

@implementation DisplayFilterPageViewController

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(int64_t)a3
{
  self->_pageIndex = a3;
}

- (double)pageHeight
{
  return self->_pageHeight;
}

- (void)setPageHeight:(double)a3
{
  self->_pageHeight = a3;
}

@end