@interface DCActivityViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)ignoreAttachmentsForCopyToPasteboard;
- (BOOL)inhibitPDFGenerationForActivityType:(id)a3;
- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 documentInfoCollection:(id)a4;
- (ICDocCamDocumentInfoCollection)documentInfoCollection;
- (ICDocCamImageCache)imageCache;
- (id)activityTypesThatInhibitPDFGeneration;
- (void)_performActivity:(id)a3;
- (void)setDocumentInfoCollection:(id)a3;
- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3;
- (void)setImageCache:(id)a3;
@end

@implementation DCActivityViewController

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  BOOL v6 = [(DCActivityViewController *)self inhibitPDFGenerationForActivityType:v5];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)DCActivityViewController;
    [(DCActivityViewController *)&v11 _performActivity:v4];
  }
  else
  {
    v7 = [(DCActivityViewController *)self documentInfoCollection];
    v8 = [(DCActivityViewController *)self imageCache];
    v9 = [(DCActivityViewController *)self view];
    v10 = [v9 window];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__DCActivityViewController__performActivity___block_invoke;
    v12[3] = &unk_2642A9D10;
    v12[4] = self;
    id v13 = v4;
    +[DCDocCamPDFGenerator generatePDFsIfNecessaryForDocumentInfoCollection:v7 imageCache:v8 displayWindow:v10 presentingViewController:self completionHandler:v12];
  }
}

void __45__DCActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [*(id *)(a1 + 32) documentInfoCollection];
    char v6 = [v2 writeGalleryPDFDataToPasteboardIfNecessaryForActivity:v4 documentInfoCollection:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v9.receiver = *(id *)(a1 + 32);
      v9.super_class = (Class)DCActivityViewController;
      objc_msgSendSuper2(&v9, sel__performActivity_, v7);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    [v8 _cancel];
  }
}

- (BOOL)inhibitPDFGenerationForActivityType:(id)a3
{
  id v4 = a3;
  if ([(DCActivityViewController *)self ignoreAttachmentsForCopyToPasteboard]
    && ([v4 isEqualToString:*MEMORY[0x263F1CFB0]] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [(DCActivityViewController *)self activityTypesThatInhibitPDFGeneration];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 documentInfoCollection:(id)a4
{
  id v5 = a4;
  char v6 = [a3 activityType];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F1CFB0]];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v9 = +[DCDocCamPDFGenerator pdfURLForDocumentInfoCollection:v5];
    v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v12 = v11;
    if (v10)
    {
      [v11 setObject:v10 forKey:*MEMORY[0x263F01AC8]];
      [v8 addObject:v12];
    }
    id v13 = [MEMORY[0x263F1C840] generalPasteboard];
    [v13 setItems:v8];
  }
  return v7;
}

- (id)activityTypesThatInhibitPDFGeneration
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.documentcamera.markup";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (BOOL)ignoreAttachmentsForCopyToPasteboard
{
  return self->_ignoreAttachmentsForCopyToPasteboard;
}

- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3
{
  self->_ignoreAttachmentsForCopyToPasteboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
}

@end