@interface PDFPageRange
- (BOOL)isEqual:(id)a3;
- (PDFPageRange)initWithPage:(id)a3 range:(_NSRange)a4;
- (_NSRange)range;
- (id)description;
- (id)page;
- (void)setPage:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation PDFPageRange

- (PDFPageRange)initWithPage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDFPageRange;
  v8 = [(PDFPageRange *)&v13 init];
  if (v8)
  {
    v9 = objc_alloc_init(PDFPageRangePrivate);
    v10 = v8->_private;
    v8->_private = v9;

    objc_storeWeak((id *)&v8->_private->page, v7);
    v11 = v8->_private;
    v11->range.NSUInteger location = location;
    v11->range.NSUInteger length = length;
  }

  return v8;
}

- (id)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);

  return WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (_NSRange)range
{
  v2 = self->_private;
  NSUInteger location = v2->range.location;
  NSUInteger length = v2->range.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_private->range = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 page];
  v6 = [(PDFPageRange *)self page];

  if (v5 == v6)
  {
    uint64_t v8 = [v4 range];
    uint64_t v10 = v9;
    BOOL v7 = v8 == [(PDFPageRange *)self range] && v10 == v11;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v4 = NSString;
  v5 = [WeakRetained document];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"Page index = %ld Range = (%ld, %ld]\n"), objc_msgSend(v5, "indexForPage:", WeakRetained), self->_private->range.location, self->_private->range.length;

  return v6;
}

- (void).cxx_destruct
{
}

@end