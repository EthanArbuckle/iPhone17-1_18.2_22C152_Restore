@interface SSSPDFPageUndoObject
+ (id)newPageUndoObjectWithPDFPage:(id)a3 index:(int64_t)a4 modificationInfo:(id)a5;
- (PDFPage)page;
- (SSSScreenshotModificationInfo)modificationInfo;
- (int64_t)index;
- (void)setIndex:(int64_t)a3;
- (void)setModificationInfo:(id)a3;
- (void)setPage:(id)a3;
@end

@implementation SSSPDFPageUndoObject

+ (id)newPageUndoObjectWithPDFPage:(id)a3 index:(int64_t)a4 modificationInfo:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_alloc_init(SSSPDFPageUndoObject);
  [(SSSPDFPageUndoObject *)v9 setPage:v8];

  [(SSSPDFPageUndoObject *)v9 setIndex:a4];
  [(SSSPDFPageUndoObject *)v9 setModificationInfo:v7];

  return v9;
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (SSSScreenshotModificationInfo)modificationInfo
{
  return self->_modificationInfo;
}

- (void)setModificationInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationInfo, 0);

  objc_storeStrong((id *)&self->_page, 0);
}

@end