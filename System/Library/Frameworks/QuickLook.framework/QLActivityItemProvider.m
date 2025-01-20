@interface QLActivityItemProvider
- (QLItem)activityPreviewItem;
- (QLPreviewPrinter)printer;
- (id)_pdfPreviewDataAtURL:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)activityViewControllerPlaceholderItems:(id)a3;
- (id)activityViewControllerSuggestionFileURL:(id)a3;
- (id)mainItem;
- (id)printInfo;
- (void)setActivityPreviewItem:(id)a3;
- (void)setPrinter:(id)a3;
@end

@implementation QLActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_26C8FAD38;
}

- (id)mainItem
{
  v3 = [(QLActivityItemProvider *)self activityPreviewItem];
  v4 = [v3 shareableURL];

  v5 = [(QLActivityItemProvider *)self activityPreviewItem];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 shareableURL];
  }
  else
  {
    v8 = [v5 fetcher];
    v7 = [v8 shareableItem];
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  v5 = [(QLActivityItemProvider *)self mainItem];

  v6 = (NSObject **)MEMORY[0x263F62940];
  if (v5)
  {
    v7 = [(QLActivityItemProvider *)self mainItem];
    [v4 addObject:v7];
  }
  else
  {
    v8 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v8 = *v6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_ERROR, "No URL to pass to activityViewControllerPlaceholderItems. #Sharing", (uint8_t *)&v17, 2u);
    }
  }
  v9 = [(QLActivityItemProvider *)self activityPreviewItem];
  v10 = [v9 previewItemURL];
  v11 = [(QLActivityItemProvider *)self _pdfPreviewDataAtURL:v10];

  if (v11)
  {
    [v4 addObject:v11];
  }
  else
  {
    v14 = [(QLActivityItemProvider *)self mainItem];

    if (v14)
    {
      v15 = [(QLActivityItemProvider *)self printer];

      if (v15)
      {
        v16 = [(QLActivityItemProvider *)self printer];
        [v4 addObject:v16];
      }
    }
  }
  v12 = *v6;
  if (!*v6)
  {
    QLSInitLogging();
    v12 = *v6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEFAULT, "Returning activity items %@ #Sharing", (uint8_t *)&v17, 0xCu);
  }

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:*MEMORY[0x263F1D008]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x263F1CFD0]])
  {
    v8 = [v6 activity];
    v9 = [(QLActivityItemProvider *)self printInfo];
    v10 = [v8 printInteractionController];
    [v10 setPrintInfo:v9];

    v11 = [(QLActivityItemProvider *)self activityPreviewItem];
    v12 = [v11 previewItemURL];
    v13 = [(QLActivityItemProvider *)self _pdfPreviewDataAtURL:v12];

    if (v13)
    {
      id v14 = v13;
LABEL_5:
      v15 = v14;
LABEL_15:

      goto LABEL_16;
    }
    v16 = [(QLItem *)self->_activityPreviewItem previewItemContentType];
    int v17 = [MEMORY[0x263F61090] printableUTIs];
    if ([v17 containsObject:v16])
    {
    }
    else
    {
      v20 = [(QLActivityItemProvider *)self printer];

      if (v20)
      {
        v15 = [(QLActivityItemProvider *)self printer];
LABEL_14:

        goto LABEL_15;
      }
    }
    v15 = 0;
    goto LABEL_14;
  }
  if ([v7 isEqualToString:*MEMORY[0x263F1CFB0]])
  {
    v18 = [(QLActivityItemProvider *)self activityPreviewItem];
    uint64_t v19 = [v18 previewItemURL];
    v8 = [(QLActivityItemProvider *)self _pdfPreviewDataAtURL:v19];

    if (!v8)
    {
      v15 = 0;
LABEL_16:

      if (v15) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v13 = [(id)*MEMORY[0x263F1DBF0] identifier];
    v28 = v13;
    v29[0] = v8;
    id v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    goto LABEL_5;
  }
LABEL_17:
  v15 = [(QLActivityItemProvider *)self mainItem];
LABEL_18:
  v21 = (NSObject **)MEMORY[0x263F62940];
  v22 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v22 = *v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_INFO, "Returning activity item for activity type %@ : %@ #Printing", (uint8_t *)&v24, 0x16u);
  }

  return v15;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return &stru_26C8FAD38;
}

- (id)printInfo
{
  v3 = [(QLActivityItemProvider *)self activityPreviewItem];
  v4 = [v3 previewItemContentType];

  if (v4)
  {
    v5 = [MEMORY[0x263F1D920] typeWithIdentifier:v4];
  }
  else
  {
    v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x263F629B0] isIWorkDocumentType:v4];
  int v7 = [MEMORY[0x263F629B0] isSpreadSheetDocumentType:v4];
  int v8 = [v5 conformsToType:*MEMORY[0x263F1DC38]];
  int v9 = [v5 conformsToType:*MEMORY[0x263F1DB18]];
  v10 = [MEMORY[0x263F61088] printInfo];
  v11 = [(QLActivityItemProvider *)self activityPreviewItem];
  v12 = [v11 previewItemTitle];
  [v10 setJobName:v12];

  v13 = [(QLActivityItemProvider *)self activityPreviewItem];
  id v14 = [v13 previewItemURL];
  v15 = [(QLActivityItemProvider *)self _pdfPreviewDataAtURL:v14];

  if (v15) {
    [v10 setScaleUp:v6];
  }
  if (v9) {
    [v10 setOutputType:1];
  }
  if ((v8 | v6 & v7) == 1) {
    [v10 setOrientation:1];
  }

  return v10;
}

- (id)_pdfPreviewDataAtURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (_pdfPreviewDataAtURL__onceToken != -1)
  {
    dispatch_once(&_pdfPreviewDataAtURL__onceToken, &__block_literal_global);
    if (v5) {
      goto LABEL_3;
    }
LABEL_14:
    int v9 = 0;
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_14;
  }
LABEL_3:
  id v6 = [(id)_pdfPreviewDataAtURL__sharedPDFPreviewCache objectForKey:v5];
  int v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = 0;
  }
  else
  {
    if (!v6)
    {
      v10 = [(QLActivityItemProvider *)self activityPreviewItem];
      v11 = [v10 previewItemContentType];

      if (v11
        && ([MEMORY[0x263F1D920] typeWithIdentifier:v11],
            v12 = objc_claimAutoreleasedReturnValue(),
            QLPreviewCopyEmbeddedPDF(),
            id v6 = (id)objc_claimAutoreleasedReturnValue(),
            v12,
            v6))
      {
        [(id)_pdfPreviewDataAtURL__sharedPDFPreviewCache setObject:v6 forKey:v5];
      }
      else
      {
        v13 = (void *)_pdfPreviewDataAtURL__sharedPDFPreviewCache;
        id v14 = [MEMORY[0x263EFF9D0] null];
        [v13 setObject:v14 forKey:v5];

        id v6 = 0;
      }
    }
    id v6 = v6;
    int v9 = v6;
  }

LABEL_15:

  return v9;
}

uint64_t __47__QLActivityItemProvider__pdfPreviewDataAtURL___block_invoke()
{
  _pdfPreviewDataAtURL__sharedPDFPreviewCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

- (id)activityViewControllerSuggestionFileURL:(id)a3
{
  id v4 = [(QLActivityItemProvider *)self activityPreviewItem];
  uint64_t v5 = [v4 previewItemType];

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v6 = [(QLActivityItemProvider *)self activityPreviewItem];
    int v7 = [v6 shareableURL];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (QLPreviewPrinter)printer
{
  return (QLPreviewPrinter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrinter:(id)a3
{
}

- (QLItem)activityPreviewItem
{
  return (QLItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivityPreviewItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityPreviewItem, 0);

  objc_storeStrong((id *)&self->_printer, 0);
}

@end