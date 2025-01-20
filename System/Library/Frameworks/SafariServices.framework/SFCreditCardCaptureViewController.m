@interface SFCreditCardCaptureViewController
@end

@implementation SFCreditCardCaptureViewController

void __68___SFCreditCardCaptureViewController_cameraReader_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 creditCardCaptureViewControllerDidCancel:*(void *)(a1 + 32)];
}

void __57___SFCreditCardCaptureViewController_cameraReaderDidEnd___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 creditCardCaptureViewController:*(void *)(a1 + 32) didCaptureCreditCard:*(void *)(*(void *)(a1 + 32) + 1424)];
}

void __60___SFCreditCardCaptureViewController_cameraReaderDidCancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 creditCardCaptureViewControllerDidCancel:*(void *)(a1 + 32)];
}

@end