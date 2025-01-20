@interface PDFHostViewControllerPrivate
@end

@implementation PDFHostViewControllerPrivate

- (void).cxx_destruct
{
  objc_storeStrong(&self->snapshotCompletion, 0);
  objc_storeStrong(&self->pdfPointerCompletionHandler, 0);
  objc_storeStrong((id *)&self->pointerInteraction, 0);
  objc_storeStrong((id *)&self->panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->pageLabelView, 0);
  objc_storeStrong((id *)&self->password, 0);
  objc_storeStrong((id *)&self->passwordViewController, 0);
  objc_storeStrong((id *)&self->topView, 0);
  objc_destroyWeak((id *)&self->hostViewControllerDelegate);
  objc_destroyWeak((id *)&self->hostScrollView);
  objc_storeStrong((id *)&self->extensionProxy, 0);

  objc_storeStrong((id *)&self->extension, 0);
}

@end