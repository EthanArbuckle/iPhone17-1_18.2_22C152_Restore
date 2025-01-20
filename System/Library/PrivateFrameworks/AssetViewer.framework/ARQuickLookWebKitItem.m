@interface ARQuickLookWebKitItem
- (ARQuickLookPreviewItem)previewItem;
- (ARQuickLookWebKitItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 previewItem:(id)a6;
- (ARQuickLookWebKitItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6 previewItem:(id)a7;
- (ARQuickLookWebKitItemDelegate)delegate;
- (NSDictionary)additionalParameters;
- (NSString)urlFragment;
- (id)previewOptions;
- (void)handleMessageFromCustomExtension:(id)a3 completionHandler:(id)a4;
- (void)setAdditionalParameters:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewItem:(id)a3;
- (void)setUrlFragment:(id)a3;
@end

@implementation ARQuickLookWebKitItem

- (ARQuickLookWebKitItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 previewItem:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ARQuickLookWebKitItem;
  v12 = [(ARQuickLookWebKitItem *)&v16 initWithDataProvider:a3 contentType:a4 previewTitle:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItem, a6);
    additionalParameters = v13->_additionalParameters;
    v13->_additionalParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

- (ARQuickLookWebKitItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6 previewItem:(id)a7
{
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ARQuickLookWebKitItem;
  v14 = [(ARQuickLookWebKitItem *)&v18 initWithPreviewItemProvider:a3 contentType:a4 previewTitle:a5 fileSize:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_previewItem, a7);
    additionalParameters = v15->_additionalParameters;
    v15->_additionalParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v15;
}

- (id)previewOptions
{
  v4 = [(ARQuickLookWebKitItem *)self additionalParameters];
  v5 = [v4 objectForKeyedSubscript:@"ARQLPrivateSourceAppKey"];

  if (v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v6 = [(ARQuickLookWebKitItem *)self additionalParameters];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:@"WebKit" forKeyedSubscript:@"ARQLPrivateSourceAppKey"];
  v8 = [(ARQuickLookWebKitItem *)self urlFragment];
  [v7 setObject:v8 forKeyedSubscript:@"ARQLPrivateURLFragment"];

  v9 = [(ARQuickLookWebKitItem *)self previewItem];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(ARQuickLookWebKitItem *)self previewItem];
    id v12 = (id)objc_msgSend((id)objc_msgSend(v11, "performSelector:", sel_previewOptions), "mutableCopy");

    [v12 addEntriesFromDictionary:v7];
  }
  else
  {
    id v12 = v7;
  }

  return v12;
}

- (void)handleMessageFromCustomExtension:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  NSLog(&cfstr_Arqlwebkititem.isa, v6);
  v5 = [(ARQuickLookWebKitItem *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 previewItem:self didReceiveMessage:v6];
  }
}

- (ARQuickLookWebKitItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARQuickLookWebKitItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)urlFragment
{
  return self->_urlFragment;
}

- (void)setUrlFragment:(id)a3
{
}

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
}

- (ARQuickLookPreviewItem)previewItem
{
  return self->_previewItem;
}

- (void)setPreviewItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_urlFragment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end