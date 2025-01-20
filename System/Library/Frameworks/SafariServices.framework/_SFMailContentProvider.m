@interface _SFMailContentProvider
- (BOOL)_canProvideContentType:(int64_t)a3;
- (BOOL)restrictAddingPDFContent;
- (_SFMailContentProviderDataSource)dataSource;
- (id)_preferentiallyOrderedAvailableContentTypes;
- (id)_preferentiallyOrderedContentTypes;
- (int64_t)_bestContentTypeForPreferredContentType:(int64_t)a3;
- (int64_t)_defaultPreferredContentType;
- (void)_getPDFDataWithCompletionHandler:(id)a3;
- (void)_getReaderContentWithCompletionHandler:(id)a3;
- (void)_getWebArchiveDataWithCompletion:(id)a3;
- (void)getMailComposeViewControllerWithMailToURL:(id)a3 contentURL:(id)a4 preferredContentType:(int64_t)a5 completionHandler:(id)a6;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)prepareMailComposeViewController:(id)a3 withMailToURL:(id)a4 contentURL:(id)a5 preferredContentType:(int64_t)a6 completionHandler:(id)a7;
- (void)setDataSource:(id)a3;
- (void)setRestrictAddingPDFContent:(BOOL)a3;
@end

@implementation _SFMailContentProvider

- (void)prepareMailComposeViewController:(id)a3 withMailToURL:(id)a4 contentURL:(id)a5 preferredContentType:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  v14 = (void (**)(void))a7;
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = (void (**)(void))&__block_literal_global_43;
  }
  [v12 setKeyboardVisible:1];
  if (v13)
  {
    v16 = NSString;
    v17 = objc_msgSend(v13, "safari_userVisibleString");
    v18 = [v16 stringWithFormat:@"\n%@", v17];
    [v12 setMessageBody:v18 isHTML:0];
  }
  if (a4
    || (unint64_t v19 = [(_SFMailContentProvider *)self _bestContentTypeForPreferredContentType:a6], v19 < 2))
  {
    v15[2](v15);
  }
  else
  {
    if (v19 == 2)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2;
      v24[3] = &unk_1E5C76E50;
      id v25 = v12;
      v26 = v15;
      [(_SFMailContentProvider *)self _getReaderContentWithCompletionHandler:v24];

      v20 = v25;
      goto LABEL_14;
    }
    if (v19 == 3)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_48;
      v21[3] = &unk_1E5C76E78;
      id v22 = v12;
      v23 = v15;
      [(_SFMailContentProvider *)self _getPDFDataWithCompletionHandler:v21];

      v20 = v22;
LABEL_14:
    }
  }
}

- (void)getMailComposeViewControllerWithMailToURL:(id)a3 contentURL:(id)a4 preferredContentType:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([getMFMailComposeViewControllerClass() canSendMail])
  {
    id v13 = (void *)[objc_alloc((Class)getMFMailComposeViewControllerClass()) initWithURL:v10];
    [v13 setMailComposeDelegate:self];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __118___SFMailContentProvider_getMailComposeViewControllerWithMailToURL_contentURL_preferredContentType_completionHandler___block_invoke;
    v15[3] = &unk_1E5C73300;
    id v16 = v13;
    id v17 = v12;
    id v14 = v13;
    [(_SFMailContentProvider *)self prepareMailComposeViewController:v14 withMailToURL:v10 contentURL:v11 preferredContentType:a5 completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (id)_preferentiallyOrderedContentTypes
{
  v2 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
  if (!_preferentiallyOrderedContentTypes_contentTypes)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:&unk_1EFBDF958];
    v4 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
    _preferentiallyOrderedContentTypes_contentTypes = v3;

    v2 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
  }

  return v2;
}

- (id)_preferentiallyOrderedAvailableContentTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_SFMailContentProvider *)self _preferentiallyOrderedContentTypes];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (-[_SFMailContentProvider _canProvideContentType:](self, "_canProvideContentType:", objc_msgSend(v10, "integerValue", (void)v13)))
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];

  return v11;
}

- (int64_t)_bestContentTypeForPreferredContentType:(int64_t)a3
{
  id v5 = [(_SFMailContentProvider *)self _preferentiallyOrderedAvailableContentTypes];
  if (a3)
  {
LABEL_4:
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    char v8 = [v5 containsObject:v7];

    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  int64_t v6 = [(_SFMailContentProvider *)self _defaultPreferredContentType];
  if (v6)
  {
    a3 = v6;
    goto LABEL_4;
  }
LABEL_5:
  v9 = [v5 firstObject];
  id v10 = v9;
  if (v9) {
    a3 = [v9 integerValue];
  }
  else {
    a3 = 0;
  }

LABEL_9:
  return a3;
}

- (BOOL)_canProvideContentType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v7 = WeakRetained;
  switch(a3)
  {
    case 3:
      if (self->_restrictAddingPDFContent)
      {
        char v3 = 0;
      }
      else
      {
        v9 = [WeakRetained webViewForMailContentProvider:self];
        char v3 = [v9 _isDisplayingPDF];
      }
      break;
    case 2:
      char v3 = [WeakRetained readerViewIsVisibleForMailContentProvider:self];
      break;
    case 1:
      char v8 = [WeakRetained webViewForMailContentProvider:self];
      char v3 = v8 != 0;

      break;
  }

  return v3 & 1;
}

- (int64_t)_defaultPreferredContentType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = [WeakRetained webViewForMailContentProvider:self];
  if ([v4 _isDisplayingPDF])
  {
    int64_t v5 = 3;
  }
  else if ([WeakRetained readerViewIsVisibleForMailContentProvider:self])
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_getReaderContentWithCompletionHandler:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v7 = [WeakRetained readerControllerForMailContentProvider:self];

  [v7 collectReaderContentForMailWithCompletion:v5];
}

- (void)_getPDFDataWithCompletionHandler:(id)a3
{
  v9 = (void (**)(id, void *, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained webViewForMailContentProvider:self];

  if ([v5 _isDisplayingPDF])
  {
    int64_t v6 = [v5 _dataForDisplayedPDF];
    id v7 = objc_msgSend(v5, "_sf_suggestedFilename");
    char v8 = objc_msgSend(v7, "safari_ensurePathExtension:", @"pdf");
    v9[2](v9, v6, v8);
  }
  else
  {
    v9[2](v9, 0, 0);
  }
}

- (void)_getWebArchiveDataWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v6 = [WeakRetained webViewForMailContentProvider:self];

  id v7 = objc_alloc(MEMORY[0x1E4F18D40]);
  char v8 = [v6 URL];
  v9 = (void *)[v7 initWithURL:v8 MIMEType:*MEMORY[0x1E4F789E8] expectedContentLength:0 textEncodingName:0];

  id v10 = [v9 suggestedFilename];
  id v11 = objc_msgSend(v10, "safari_ensurePathExtension:", @"webarchive");

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59___SFMailContentProvider__getWebArchiveDataWithCompletion___block_invoke;
  v14[3] = &unk_1E5C76EA0;
  id v15 = v11;
  id v16 = v4;
  id v12 = v11;
  id v13 = v4;
  [v6 _getWebArchiveDataWithCompletionHandler:v14];
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v5 = [v8 presentingViewController];
  if (v5) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = v8;
  }
  id v7 = v6;

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (_SFMailContentProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (_SFMailContentProviderDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)restrictAddingPDFContent
{
  return self->_restrictAddingPDFContent;
}

- (void)setRestrictAddingPDFContent:(BOOL)a3
{
  self->_restrictAddingPDFContent = a3;
}

- (void).cxx_destruct
{
}

@end