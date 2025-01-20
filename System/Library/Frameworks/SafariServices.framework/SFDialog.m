@interface SFDialog
@end

@implementation SFDialog

uint64_t __100__SFDialog_SafariServicesExtras__redirectDialogWithNavigationResult_promptPolicy_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 > 1)
  {
    if (a2 == 2 || a2 == 0x7FFFFFFFFFFFFFFFLL) {
      return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    }
  }
  else if ((unint64_t)a2 <= 1)
  {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end