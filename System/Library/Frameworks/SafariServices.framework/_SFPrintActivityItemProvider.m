@interface _SFPrintActivityItemProvider
- (BOOL)canVendPDFRepresentation;
- (BOOL)hasReservedPrintInteractionController;
- (NSItemProvider)pdfItemProvider;
- (_SFPrintActivityItemProvider)initWithPrintController:(id)a3 webView:(id)a4;
- (_SFPrintController)printController;
- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItems:(id)a3;
- (id)item;
- (void)setCanVendPDFRepresentation:(BOOL)a3;
@end

@implementation _SFPrintActivityItemProvider

- (_SFPrintActivityItemProvider)initWithPrintController:(id)a3 webView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)_SFPrintActivityItemProvider;
  v10 = [(_SFActivityItemProvider *)&v14 initWithPlaceholderItem:v9 URL:0 pageTitle:0 webView:v8];

  if (v10 && [v7 setUpPrintController])
  {
    objc_storeStrong((id *)&v10->_printController, a3);
    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F435A0]];
    [(_SFActivityItemProvider *)v10 setExcludedActivityTypes:v11];

    v12 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)item
{
  printPageRenderer = self->_printPageRenderer;
  if (!printPageRenderer)
  {
    [(_SFPrintController *)self->_printController updatePrintInfo];
    v4 = [(_SFPrintController *)self->_printController printRenderer];
    v5 = self->_printPageRenderer;
    self->_printPageRenderer = v4;

    printPageRenderer = self->_printPageRenderer;
  }

  return printPageRenderer;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  if (self->_canVendPDFRepresentation)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v5 = (void *)getLPLinkMetadataClass_softClass_0;
    uint64_t v25 = getLPLinkMetadataClass_softClass_0;
    if (!getLPLinkMetadataClass_softClass_0)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getLPLinkMetadataClass_block_invoke_0;
      v20 = &unk_1E5C723B0;
      v21 = &v22;
      __getLPLinkMetadataClass_block_invoke_0((uint64_t)&v17);
      v5 = (void *)v23[3];
    }
    v6 = v5;
    _Block_object_dispose(&v22, 8);
    id v7 = objc_alloc_init(v6);
    if (v7)
    {
      id v8 = [(_SFActivityItemProvider *)self url];
      [v7 setOriginalURL:v8];

      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2050000000;
      v9 = (void *)getLPFileMetadataClass_softClass_0;
      uint64_t v25 = getLPFileMetadataClass_softClass_0;
      if (!getLPFileMetadataClass_softClass_0)
      {
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        v19 = __getLPFileMetadataClass_block_invoke_0;
        v20 = &unk_1E5C723B0;
        v21 = &v22;
        __getLPFileMetadataClass_block_invoke_0((uint64_t)&v17);
        v9 = (void *)v23[3];
      }
      v10 = v9;
      _Block_object_dispose(&v22, 8);
      id v11 = objc_alloc_init(v10);
      v12 = [(_SFPrintController *)self->_printController suggestedPDFFileName];
      [v11 setName:v12];

      [v11 setType:*MEMORY[0x1E4F22668]];
      [v7 setSpecialization:v11];
      v13 = [v7 specialization];
      linkPreviewFileMetadata = self->_linkPreviewFileMetadata;
      self->_linkPreviewFileMetadata = v13;

      id v15 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSItemProvider)pdfItemProvider
{
  if (self->_canVendPDFRepresentation)
  {
    pdfItemProvider = self->_pdfItemProvider;
    if (!pdfItemProvider)
    {
      id v4 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E4F28D78]);
      v5 = self->_pdfItemProvider;
      self->_pdfItemProvider = v4;

      v6 = self->_pdfItemProvider;
      uint64_t v7 = *MEMORY[0x1E4F22668];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke;
      v11[3] = &unk_1E5C767D8;
      v11[4] = self;
      [(NSItemProvider *)v6 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v11];
      id v8 = [(_SFPrintController *)self->_printController suggestedPDFFileName];
      [(NSItemProvider *)self->_pdfItemProvider setSuggestedName:v8];

      pdfItemProvider = self->_pdfItemProvider;
    }
    v9 = pdfItemProvider;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (self->_canVendPDFRepresentation)
  {
    id v4 = [(_SFPrintActivityItemProvider *)self pdfItemProvider];
    v9[0] = v4;
    v5 = [(_SFPrintActivityItemProvider *)self item];
    v9[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  }
  else
  {
    id v4 = [(_SFPrintActivityItemProvider *)self item];
    id v8 = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  }

  return v6;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(_SFActivityItemProvider *)self excludedActivityTypes];
  char v7 = [v6 containsObject:v5];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = *MEMORY[0x1E4F435C8];
    v18[0] = *MEMORY[0x1E4F43600];
    v18[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v12 = [v9 setWithArray:v11];

    if (self->_canVendPDFRepresentation && ([v12 containsObject:v5] & 1) == 0)
    {
      v13 = [(_SFPrintActivityItemProvider *)self pdfItemProvider];
      uint64_t v17 = v13;
      objc_super v14 = &v17;
    }
    else
    {
      v13 = [(_SFPrintActivityItemProvider *)self item];
      v16 = v13;
      objc_super v14 = &v16;
    }
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }

  return v8;
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (BOOL)hasReservedPrintInteractionController
{
  return self->_hasReservedPrintInteractionController;
}

- (BOOL)canVendPDFRepresentation
{
  return self->_canVendPDFRepresentation;
}

- (void)setCanVendPDFRepresentation:(BOOL)a3
{
  self->_canVendPDFRepresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_linkPreviewFileMetadata, 0);
  objc_storeStrong((id *)&self->_pdfItemProvider, 0);

  objc_storeStrong((id *)&self->_printPageRenderer, 0);
}

@end