@interface SFMailContentProvider
@end

@implementation SFMailContentProvider

uint64_t __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setMessageBody:a2 isHTML:1];
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2_cold_1(v3);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addAttachmentData:a2 mimeType:@"application/pdf" fileName:a3];
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t __118___SFMailContentProvider_getMailComposeViewControllerWithMailToURL_contentURL_preferredContentType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __59___SFMailContentProvider__getWebArchiveDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

void __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Reader content collection failed", v1, 2u);
}

@end