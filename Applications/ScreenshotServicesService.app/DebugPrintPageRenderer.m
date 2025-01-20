@interface DebugPrintPageRenderer
- (CGRect)paperRect;
- (CGRect)printableRect;
- (int64_t)numberOfPages;
- (void)setPaperRect:(CGRect)a3;
- (void)setPrintableRect:(CGRect)a3;
@end

@implementation DebugPrintPageRenderer

- (int64_t)numberOfPages
{
  return 1;
}

- (CGRect)printableRect
{
  double x = self->printableRect.origin.x;
  double y = self->printableRect.origin.y;
  double width = self->printableRect.size.width;
  double height = self->printableRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrintableRect:(CGRect)a3
{
  self->printableRect = a3;
}

- (CGRect)paperRect
{
  double x = self->paperRect.origin.x;
  double y = self->paperRect.origin.y;
  double width = self->paperRect.size.width;
  double height = self->paperRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPaperRect:(CGRect)a3
{
  self->paperRect = a3;
}

@end