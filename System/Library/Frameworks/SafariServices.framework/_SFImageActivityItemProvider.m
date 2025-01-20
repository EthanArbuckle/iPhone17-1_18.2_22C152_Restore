@interface _SFImageActivityItemProvider
- (_SFImageActivityItemProvider)initWithWebView:(id)a3;
- (id)_imageData;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)item;
@end

@implementation _SFImageActivityItemProvider

- (_SFImageActivityItemProvider)initWithWebView:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9B8] data];
  v14.receiver = self;
  v14.super_class = (Class)_SFImageActivityItemProvider;
  v6 = [(_SFActivityItemProvider *)&v14 initWithPlaceholderItem:v5 URL:0 pageTitle:0 webView:v4];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F43590]];
    [(_SFActivityItemProvider *)v6 setExcludedActivityTypes:v7];

    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F22500];
    v9 = [v4 _MIMEType];
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(v8, v9, 0);
    documentUTI = v6->_documentUTI;
    v6->_documentUTI = &PreferredIdentifierForTag->isa;

    v12 = v6;
  }

  return v6;
}

- (id)item
{
  imageOnlyDocumentData = self->_imageOnlyDocumentData;
  if (!imageOnlyDocumentData)
  {
    id v4 = [(_SFImageActivityItemProvider *)self _imageData];
    v5 = self->_imageOnlyDocumentData;
    self->_imageOnlyDocumentData = v4;

    imageOnlyDocumentData = self->_imageOnlyDocumentData;
  }

  return imageOnlyDocumentData;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return self->_documentUTI;
}

- (id)_imageData
{
  CFStringRef documentUTI = (const __CFString *)self->_documentUTI;
  if (documentUTI && UTTypeConformsTo(documentUTI, (CFStringRef)*MEMORY[0x1E4F225F8]))
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    objc_super v14 = __Block_byref_object_copy__14;
    v15 = __Block_byref_object_dispose__14;
    id v16 = 0;
    id v4 = [(_SFActivityItemProvider *)self webView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42___SFImageActivityItemProvider__imageData__block_invoke;
    v10[3] = &unk_1E5C78698;
    v10[4] = &v17;
    v10[5] = &v11;
    [v4 _getMainResourceDataWithCompletionHandler:v10];

    if (!*((unsigned char *)v18 + 24))
    {
      uint64_t v5 = *MEMORY[0x1E4F1C3A0];
      do
      {
        v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v6 runMode:v5 beforeDate:v7];
      }
      while (!*((unsigned char *)v18 + 24));
    }
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentUTI, 0);

  objc_storeStrong((id *)&self->_imageOnlyDocumentData, 0);
}

@end