@interface IKJSDataSourceView
- (IKJSDataSource)dataSource;
- (IKJSDataSourceViewDelegate)delegate;
- (_NSRange)usedIndexRange;
- (id)initForDataSource:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setUsedIndexRange:(_NSRange)a3;
@end

@implementation IKJSDataSourceView

- (id)initForDataSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKJSDataSourceView;
  v5 = [(IKJSDataSourceView *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_dataSource, v4);
    [v4 addDataSourceView:v6];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained removeDataSourceView:self];

  v4.receiver = self;
  v4.super_class = (Class)IKJSDataSourceView;
  [(IKJSDataSourceView *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.hasDidReset = p_delegate & 1;
}

- (void)setUsedIndexRange:(_NSRange)a3
{
  if (self->_usedIndexRange.location != a3.location || self->_usedIndexRange.length != a3.length)
  {
    self->_usedIndexRange = a3;
    id v4 = [(IKJSDataSourceView *)self dataSource];
    [v4 markDataSourceViewsUpdated];
  }
}

- (void)reset
{
  self->_usedIndexRange.location = 0;
  self->_usedIndexRange.length = 0;
  v3 = [(IKJSDataSourceView *)self dataSource];
  [v3 markDataSourceViewsUpdated];

  if (self->_delegateFlags.hasDidReset)
  {
    id v4 = [(IKJSDataSourceView *)self delegate];
    [v4 didResetUsedIndexRangeForDataSourceView:self];
  }
}

- (IKJSDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (IKJSDataSource *)WeakRetained;
}

- (IKJSDataSourceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKJSDataSourceViewDelegate *)WeakRetained;
}

- (_NSRange)usedIndexRange
{
  NSUInteger length = self->_usedIndexRange.length;
  NSUInteger location = self->_usedIndexRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end