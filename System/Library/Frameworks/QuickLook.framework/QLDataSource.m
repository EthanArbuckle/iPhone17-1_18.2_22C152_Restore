@interface QLDataSource
- (QLDataSource)initWithPreviewItems:(id)a3;
- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
@end

@implementation QLDataSource

- (QLDataSource)initWithPreviewItems:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLDataSource;
  v6 = [(QLDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_previewItems, a3);
    v8 = v7;
  }

  return v7;
}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  previewItems = self->_previewItems;
  id v8 = a4;
  id v11 = [(NSArray *)previewItems objectAtIndexedSubscript:a3];
  v9 = [(NSArray *)self->_previewItems objectAtIndexedSubscript:a3];
  objc_super v10 = [v9 fetcher];
  (*((void (**)(id, id, void *))a4 + 2))(v8, v11, v10);
}

- (void).cxx_destruct
{
}

@end