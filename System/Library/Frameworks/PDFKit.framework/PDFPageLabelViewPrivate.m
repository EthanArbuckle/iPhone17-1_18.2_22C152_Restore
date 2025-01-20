@interface PDFPageLabelViewPrivate
@end

@implementation PDFPageLabelViewPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->visibilityTimer, 0);
  objc_storeStrong((id *)&self->label, 0);

  objc_storeStrong((id *)&self->backdropView, 0);
}

@end