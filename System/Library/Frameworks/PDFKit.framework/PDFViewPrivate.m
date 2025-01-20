@interface PDFViewPrivate
@end

@implementation PDFViewPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->debugFlags, 0);
  objc_storeStrong((id *)&self->tilesSyncTimer, 0);
  objc_storeStrong((id *)&self->findInteraction, 0);
  objc_storeStrong((id *)&self->dragInteraction, 0);
  objc_storeStrong((id *)&self->pageViewControllerOptions, 0);
  objc_storeStrong((id *)&self->documentViewController, 0);
  objc_storeStrong((id *)&self->doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->annotationOver, 0);
  objc_storeStrong((id *)&self->passwordViewController, 0);
  objc_storeStrong((id *)&self->coachMarkManager, 0);
  objc_storeStrong((id *)&self->highlights, 0);
  objc_storeStrong((id *)&self->destinationHistory, 0);
  objc_storeStrong((id *)&self->pagePreloadQueue, 0);
  objc_storeStrong((id *)&self->pageSyncTimer, 0);
  objc_storeStrong((id *)&self->toPage, 0);
  objc_storeStrong((id *)&self->fromPage, 0);
  objc_storeStrong((id *)&self->renderingProperties, 0);
  objc_storeStrong((id *)&self->viewLayout, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->currentSelection, 0);
  objc_storeStrong((id *)&self->controller, 0);
  objc_storeStrong((id *)&self->scrollView, 0);

  objc_storeStrong((id *)&self->document, 0);
}

@end