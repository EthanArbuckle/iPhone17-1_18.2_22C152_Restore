@interface UIBarButtonItem
- (BOOL)doc_isLegacyOverflowBarButtonItem;
- (CGRect)_doc_ipi_rectForPresenting;
- (UIView)_doc_ipi_viewForPresenting;
- (void)_doc_ipi_triggerActionForEvent:(id)a3;
@end

@implementation UIBarButtonItem

- (UIView)_doc_ipi_viewForPresenting
{
  return (UIView *)[(UIBarButtonItem *)self _viewForPresenting];
}

- (CGRect)_doc_ipi_rectForPresenting
{
  [(UIBarButtonItem *)self _rectForPresenting];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_doc_ipi_triggerActionForEvent:(id)a3
{
}

- (BOOL)doc_isLegacyOverflowBarButtonItem
{
  return 0;
}

@end