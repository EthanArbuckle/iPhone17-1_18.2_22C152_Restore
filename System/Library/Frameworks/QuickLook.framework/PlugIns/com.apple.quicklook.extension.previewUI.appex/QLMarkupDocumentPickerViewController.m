@interface QLMarkupDocumentPickerViewController
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation QLMarkupDocumentPickerViewController

- (void)presentationControllerDidDismiss:(id)a3
{
  v4 = [(QLMarkupDocumentPickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLMarkupDocumentPickerViewController *)self delegate];
    [v6 documentPickerWasCancelled:self];
  }
}

@end