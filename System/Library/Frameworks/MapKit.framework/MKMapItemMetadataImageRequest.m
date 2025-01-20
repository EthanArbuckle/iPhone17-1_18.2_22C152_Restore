@interface MKMapItemMetadataImageRequest
+ (id)requestWithMapItem:(id)a3 info:(id)a4;
- (GEOPhotoInfo)info;
- (id)imageHandler;
- (id)url;
- (void)handleData:(id)a3;
- (void)handleError:(id)a3;
- (void)setImageHandler:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation MKMapItemMetadataImageRequest

+ (id)requestWithMapItem:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MKMapItemMetadataImageRequest);
  [(MKMapItemMetadataImageRequest *)v7 setInfo:v5];

  [(MKMapItemMetadataRequest *)v7 setMapItem:v6];

  return v7;
}

- (id)url
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(MKMapItemMetadataImageRequest *)self info];
  v4 = [v3 url];
  id v5 = [v2 URLWithString:v4];

  return v5;
}

- (void)handleData:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A80] imageWithData:v4];
    id v6 = (void *)v5;
    imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, uint64_t, void))self->_imageHandler;
    if (!imageHandler) {
      goto LABEL_8;
    }
    if (v5)
    {
      imageHandler[2](self->_imageHandler, self, v5, 0);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, uint64_t, void))self->_imageHandler;
  if (imageHandler)
  {
LABEL_6:
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKMapItemMetadataImageRequestErrorDomain" code:0 userInfo:0];
    ((void (**)(id, MKMapItemMetadataImageRequest *, uint64_t, void *))imageHandler)[2](imageHandler, self, 0, v8);
  }
  id v6 = 0;
LABEL_8:
  [(MKMapItemMetadataImageRequest *)self setImageHandler:0];
}

- (void)handleError:(id)a3
{
  imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, void, id))self->_imageHandler;
  if (imageHandler) {
    imageHandler[2](imageHandler, self, 0, a3);
  }

  [(MKMapItemMetadataImageRequest *)self setImageHandler:0];
}

- (GEOPhotoInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (id)imageHandler
{
  return self->_imageHandler;
}

- (void)setImageHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageHandler, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end