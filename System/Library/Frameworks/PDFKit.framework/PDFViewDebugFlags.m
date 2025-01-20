@interface PDFViewDebugFlags
- (PDFViewDebugFlags)initWithView:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PDFViewDebugFlags

- (PDFViewDebugFlags)initWithView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDFViewDebugFlags;
  v5 = [(PDFViewDebugFlags *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pdfView, v4);
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 addObserver:v6 forKeyPath:@"PDFKit2_ColorTileEdge" options:1 context:v6];

    v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v8 addObserver:v6 forKeyPath:@"PDFKit2_HighlightDetectedAnnotations" options:1 context:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"PDFKit2_ColorTileEdge" context:self];

  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"PDFKit2_HighlightDetectedAnnotations" context:self];

  v5.receiver = self;
  v5.super_class = (Class)PDFViewDebugFlags;
  [(PDFViewDebugFlags *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)a6 + 1);
    if ([v10 isEqualToString:@"PDFKit2_ColorTileEdge"])
    {
      [WeakRetained forceTileRefresh];
    }
    else if ([v10 isEqualToString:@"PDFKit2_HighlightDetectedAnnotations"])
    {
      v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v14 = [v13 BOOLValue];

      [WeakRetained drawDetectedAnnotationBounds:v14];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PDFViewDebugFlags;
    [(PDFViewDebugFlags *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

- (void).cxx_destruct
{
}

@end