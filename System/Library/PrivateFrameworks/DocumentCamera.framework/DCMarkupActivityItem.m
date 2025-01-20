@interface DCMarkupActivityItem
- (DCMarkupActivityItem)initWithDocumentInfo:(id)a3 imageCache:(id)a4;
- (ICDocCamDocumentInfo)documentInfo;
- (ICDocCamImageCache)imageCache;
- (void)setDocumentInfo:(id)a3;
- (void)setImageCache:(id)a3;
@end

@implementation DCMarkupActivityItem

- (DCMarkupActivityItem)initWithDocumentInfo:(id)a3 imageCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DCMarkupActivityItem;
  v8 = [(DCMarkupActivityItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(DCMarkupActivityItem *)v8 setDocumentInfo:v6];
    [(DCMarkupActivityItem *)v9 setImageCache:v7];
  }

  return v9;
}

- (ICDocCamDocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end