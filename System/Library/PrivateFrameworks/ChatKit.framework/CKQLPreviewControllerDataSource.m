@interface CKQLPreviewControllerDataSource
- (NSArray)previewItems;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)setPreviewItems:(id)a3;
@end

@implementation CKQLPreviewControllerDataSource

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  v3 = [(CKQLPreviewControllerDataSource *)self previewItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v6 = [(CKQLPreviewControllerDataSource *)self previewItems];
  unint64_t v7 = [v6 count];

  if (v7 >= a4)
  {
    v9 = [(CKQLPreviewControllerDataSource *)self previewItems];
    v8 = [v9 objectAtIndex:a4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setPreviewItems:(id)a3
{
  id v4 = a3;
  previewItems = self->_previewItems;
  p_previewItems = &self->_previewItems;
  id v9 = v4;
  if (-[NSArray isEqualToArray:](previewItems, "isEqualToArray:"))
  {
    unint64_t v7 = v9;
  }
  else
  {
    v8 = (void *)[v9 copy];

    objc_storeStrong((id *)p_previewItems, v8);
    unint64_t v7 = v8;
  }
}

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (void).cxx_destruct
{
}

@end