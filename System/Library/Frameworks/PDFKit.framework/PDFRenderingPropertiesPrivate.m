@interface PDFRenderingPropertiesPrivate
@end

@implementation PDFRenderingPropertiesPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pageColor, 0);
  objc_destroyWeak((id *)&self->pdfLayerController);

  objc_destroyWeak((id *)&self->pdfView);
}

@end