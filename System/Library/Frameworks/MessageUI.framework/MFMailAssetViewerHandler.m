@interface MFMailAssetViewerHandler
- (MFMailAssetViewerHandler)initWithAttachmentContext:(id)a3 delegate:(id)a4;
- (MFMailAssetViewerHandlerDelegate)delegate;
- (MFMailQLAttachmentContext)attachmentContext;
- (NSURL)editedURL;
- (id)description;
- (void)launchAssetViewerForItem:(id)a3 editContent:(BOOL)a4 requireCopy:(BOOL)a5 completion:(id)a6;
- (void)launchAssetViewerForURL:(id)a3 editContent:(BOOL)a4 requireCopy:(BOOL)a5 completion:(id)a6;
@end

@implementation MFMailAssetViewerHandler

- (MFMailAssetViewerHandler)initWithAttachmentContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMailAssetViewerHandler;
  v9 = [(MFMailAssetViewerHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentContext, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%p>: %@", self, self->_attachmentContext];
}

- (void)launchAssetViewerForURL:(id)a3 editContent:(BOOL)a4 requireCopy:(BOOL)a5 completion:(id)a6
{
  id v7 = (void (**)(id, void *))a6;
  v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
  v7[2](v7, v6);
}

- (void)launchAssetViewerForItem:(id)a3 editContent:(BOOL)a4 requireCopy:(BOOL)a5 completion:(id)a6
{
  id v7 = (void (**)(id, void *))a6;
  v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
  v7[2](v7, v6);
}

- (NSURL)editedURL
{
  return self->_editedURL;
}

- (MFMailQLAttachmentContext)attachmentContext
{
  return self->_attachmentContext;
}

- (MFMailAssetViewerHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailAssetViewerHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachmentContext, 0);

  objc_storeStrong((id *)&self->_editedURL, 0);
}

@end