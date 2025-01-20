@interface MUDocumentPickerViewController
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation MUDocumentPickerViewController

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4 = [(UIDocumentPickerViewController *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 documentPickerWasCancelled:self];
    }
  }
  MEMORY[0x270F9A790]();
}

@end