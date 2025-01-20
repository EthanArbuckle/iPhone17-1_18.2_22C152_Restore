@interface PDFKitPopupViewPrivate
@end

@implementation PDFKitPopupViewPrivate

- (void).cxx_destruct
{
  objc_destroyWeak(&self->savedFirstResponder);
  objc_storeStrong((id *)&self->contents, 0);
  objc_storeStrong((id *)&self->popupController, 0);
  objc_storeStrong((id *)&self->popupTextViewUndoManager, 0);
  objc_storeStrong((id *)&self->popupTextView, 0);
  objc_destroyWeak((id *)&self->view);
  objc_destroyWeak((id *)&self->pageView);

  objc_destroyWeak((id *)&self->parentAnnotation);
}

@end