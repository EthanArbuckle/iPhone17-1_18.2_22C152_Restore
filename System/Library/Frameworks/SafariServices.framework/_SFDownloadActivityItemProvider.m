@interface _SFDownloadActivityItemProvider
- (SFQuickLookDocument)quickLookDocument;
- (_SFDownloadActivityItemProvider)initWithQuickLookDocument:(id)a3 URL:(id)a4 webView:(id)a5;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewControllerApplicationExtensionItem:(id)a3;
- (id)item;
- (id)pageTitle;
- (void)setQuickLookDocument:(id)a3;
@end

@implementation _SFDownloadActivityItemProvider

- (_SFDownloadActivityItemProvider)initWithQuickLookDocument:(id)a3 URL:(id)a4 webView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9
    && ([MEMORY[0x1E4F1C9B8] data],
        v12 = objc_claimAutoreleasedReturnValue(),
        v15.receiver = self,
        v15.super_class = (Class)_SFDownloadActivityItemProvider,
        self = [(_SFActivityItemProvider *)&v15 initWithPlaceholderItem:v12 URL:v10 pageTitle:0 webView:v11], v12, self))
  {
    objc_storeStrong((id *)&self->_quickLookDocument, a3);
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pageTitle
{
  return (id)[(SFQuickLookDocument *)self->_quickLookDocument fileName];
}

- (id)item
{
  [(SFQuickLookDocument *)self->_quickLookDocument saveToFileIfNeeded];
  quickLookDocument = self->_quickLookDocument;

  return (id)[(SFQuickLookDocument *)quickLookDocument savedURLWithProperExtension];
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)[(SFQuickLookDocument *)self->_quickLookDocument inferredUTI];
}

- (id)activityViewControllerApplicationExtensionItem:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v5 = [(SFQuickLookDocument *)self->_quickLookDocument inferredUTI];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82___SFDownloadActivityItemProvider_activityViewControllerApplicationExtensionItem___block_invoke;
  v8[3] = &unk_1E5C760D0;
  v8[4] = self;
  [v4 registerItemForTypeIdentifier:v5 loadHandler:v8];

  v6 = [(SFQuickLookDocument *)self->_quickLookDocument fileName];
  [v4 setSuggestedName:v6];

  return v4;
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (void)setQuickLookDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

@end