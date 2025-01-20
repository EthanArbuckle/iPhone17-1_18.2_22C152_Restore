@interface PDFPageLayerEffectPrivate
@end

@implementation PDFPageLayerEffectPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->noteLayer, 0);
  objc_storeStrong((id *)&self->rootSelectionLayer, 0);
  objc_storeStrong((id *)&self->pdfResult, 0);
  objc_storeStrong((id *)&self->selectionEffectLayers, 0);
  objc_storeStrong((id *)&self->selections, 0);
  objc_storeStrong((id *)&self->markupEffectLayers, 0);
  objc_destroyWeak((id *)&self->annotation);
  objc_storeStrong((id *)&self->uuid, 0);

  objc_destroyWeak((id *)&self->pageLayer);
}

@end