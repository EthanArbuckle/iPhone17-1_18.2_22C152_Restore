@interface PDFTextPosition
- (PDFTextPosition)initWithOffset:(int64_t)a3 onPage:(id)a4;
- (id)description;
- (id)page;
- (int64_t)offset;
@end

@implementation PDFTextPosition

- (PDFTextPosition)initWithOffset:(int64_t)a3 onPage:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDFTextPosition;
  v7 = [(PDFTextPosition *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_offset = a3;
    objc_storeWeak((id *)&v7->_page, v6);
  }

  return v8;
}

- (int64_t)offset
{
  return self->_offset;
}

- (id)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return WeakRetained;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v4 = NSString;
  int64_t offset = self->_offset;
  id v6 = [WeakRetained document];
  v7 = objc_msgSend(v4, "stringWithFormat:", @"Offset %d on page index %d", offset, objc_msgSend(v6, "indexForPage:", WeakRetained));

  return v7;
}

- (void).cxx_destruct
{
}

@end