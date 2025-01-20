@interface PDFPageViewPrivate
@end

@implementation PDFPageViewPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->detectedFormFieldBoundingBoxesLayer, 0);
  objc_storeStrong((id *)&self->bookmarkLayer, 0);
  objc_storeStrong((id *)&self->backgroundImage, 0);
  objc_storeStrong((id *)&self->backgroundLayer, 0);
  objc_storeStrong((id *)&self->annotationController, 0);
  objc_storeStrong((id *)&self->pageSignatures, 0);
  objc_storeStrong((id *)&self->activeTextStorage, 0);
  objc_storeStrong((id *)&self->activeControls, 0);
  objc_destroyWeak((id *)&self->activeAnnotation);
  objc_storeStrong((id *)&self->pageAnnotationEffects, 0);
  objc_storeStrong((id *)&self->searchLayer, 0);
  objc_destroyWeak((id *)&self->pageLayer);
  objc_destroyWeak((id *)&self->page);
  objc_destroyWeak((id *)&self->renderingProperties);

  objc_destroyWeak((id *)&self->geometryInterface);
}

@end