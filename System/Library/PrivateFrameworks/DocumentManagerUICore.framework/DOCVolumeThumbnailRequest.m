@interface DOCVolumeThumbnailRequest
- (DOCVolumeThumbnailRequest)initWithDescriptor:(id)a3;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
@end

@implementation DOCVolumeThumbnailRequest

- (DOCVolumeThumbnailRequest)initWithDescriptor:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 340, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)DOCVolumeThumbnailRequest;
  v7 = [(DOCVolumeThumbnailRequest *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_descriptor, a3);
  }

  return v8;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F4B540];
  v5 = (void (**)(id, void *, void))a3;
  id v17 = (id)[[v4 alloc] initWithType:@"com.apple.storage-removable"];
  id v6 = objc_alloc(MEMORY[0x263F4B558]);
  [(DOCThumbnailDescriptor *)self->_descriptor size];
  double v8 = v7;
  double v10 = v9;
  [(DOCThumbnailDescriptor *)self->_descriptor scale];
  v12 = objc_msgSend(v6, "initWithSize:scale:", v8, v10, v11);
  v13 = [v17 prepareImageForDescriptor:v12];
  v14 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v15 = [v13 CGImage];
  [(DOCThumbnailDescriptor *)self->_descriptor scale];
  v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v5[2](v5, v16, 0);
}

- (void).cxx_destruct
{
}

@end