@interface DOCStaticBadgedFolderThumbnailRequest
- (DOCStaticBadgedFolderThumbnailRequest)initWithFolderType:(unint64_t)a3 descriptor:(id)a4;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
@end

@implementation DOCStaticBadgedFolderThumbnailRequest

- (DOCStaticBadgedFolderThumbnailRequest)initWithFolderType:(unint64_t)a3 descriptor:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DOCStaticBadgedFolderThumbnailRequest;
  v8 = [(DOCStaticBadgedFolderThumbnailRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_folderType = a3;
    objc_storeStrong((id *)&v8->_descriptor, a4);
  }

  return v9;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  descriptor = self->_descriptor;
  v6 = (void (**)(id, void *, void))a3;
  id v9 = +[DOCThumbnailFolderIcon folderIconForDescriptor:descriptor];
  if (!v9)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DOCThumbnailRequest.m" lineNumber:245 description:@"nil folder icon"];
  }
  id v7 = objc_msgSend(v9, "badgedFolderIconForFolderType:style:", self->_folderType, -[DOCThumbnailDescriptor style](self->_descriptor, "style"));
  v6[2](v6, v7, 0);
}

- (void).cxx_destruct
{
}

@end