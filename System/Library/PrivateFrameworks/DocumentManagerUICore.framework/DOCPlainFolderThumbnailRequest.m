@interface DOCPlainFolderThumbnailRequest
- (DOCPlainFolderThumbnailRequest)initWithDescriptor:(id)a3;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
@end

@implementation DOCPlainFolderThumbnailRequest

- (DOCPlainFolderThumbnailRequest)initWithDescriptor:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 318, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)DOCPlainFolderThumbnailRequest;
  v7 = [(DOCPlainFolderThumbnailRequest *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_descriptor, a3);
  }

  return v8;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  descriptor = self->_descriptor;
  v5 = (void (**)(id, void *, void))a3;
  id v7 = +[DOCThumbnailFolderIcon folderIconForDescriptor:descriptor];
  id v6 = objc_msgSend(v7, "plainFolderImageWithStyle:", -[DOCThumbnailDescriptor style](self->_descriptor, "style"));
  v5[2](v5, v6, 0);
}

- (void).cxx_destruct
{
}

@end