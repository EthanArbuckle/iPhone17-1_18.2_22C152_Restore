@interface PDFViewControllerPrivate
@end

@implementation PDFViewControllerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->editMenuInteraction, 0);
  objc_destroyWeak((id *)&self->activeAnnotation);
  objc_storeStrong((id *)&self->marqueeEffect, 0);

  objc_destroyWeak((id *)&self->view);
}

@end