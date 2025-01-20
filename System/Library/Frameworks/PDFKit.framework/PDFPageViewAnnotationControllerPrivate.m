@interface PDFPageViewAnnotationControllerPrivate
@end

@implementation PDFPageViewAnnotationControllerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->activeControls, 0);
  objc_destroyWeak((id *)&self->activeAnnotation);
  objc_destroyWeak((id *)&self->view);
  objc_destroyWeak((id *)&self->page);

  objc_destroyWeak((id *)&self->pageView);
}

@end