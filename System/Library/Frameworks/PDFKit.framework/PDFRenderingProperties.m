@interface PDFRenderingProperties
- (BOOL)enableBackgroundImages;
- (BOOL)enablePageShadows;
- (BOOL)enableTileUpdates;
- (BOOL)isUsingPDFExtensionView;
- (BOOL)shouldAntiAlias;
- (CGColorSpace)deviceColorSpace;
- (PDFLayerController)pdfLayerController;
- (PDFRenderingProperties)init;
- (PDFView)pdfView;
- (UIColor)pageColor;
- (double)greekingThreshold;
- (double)lineWidthThreshold;
- (double)screenScaleFactor;
- (int64_t)displayBox;
- (int64_t)interpolationQuality;
- (void)_notifyPropertyChanged:(int64_t)a3;
- (void)dealloc;
- (void)setDeviceColorSpace:(CGColorSpace *)a3;
- (void)setDisplayBox:(int64_t)a3;
- (void)setEnableBackgroundImages:(BOOL)a3;
- (void)setEnablePageShadows:(BOOL)a3;
- (void)setEnableTileUpdates:(BOOL)a3;
- (void)setGreekingThreshold:(double)a3;
- (void)setInterpolationQuality:(int64_t)a3;
- (void)setIsUsingPDFExtensionView:(BOOL)a3;
- (void)setLineWidthThreshold:(double)a3;
- (void)setPDFLayerController:(id)a3;
- (void)setPDFView:(id)a3;
- (void)setPageColor:(id)a3;
- (void)setScreenScaleFactor:(double)a3;
- (void)setShouldAntiAlias:(BOOL)a3;
@end

@implementation PDFRenderingProperties

- (PDFRenderingProperties)init
{
  v9.receiver = self;
  v9.super_class = (Class)PDFRenderingProperties;
  v2 = [(PDFRenderingProperties *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFRenderingPropertiesPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->pdfView, 0);
    objc_storeWeak((id *)&v2->_private->pdfLayerController, 0);
    v2->_private->displayBox = 1;
    v2->_private->shouldAntiAlias = 1;
    v2->_private->greekingThreshold = 0.0;
    v2->_private->interpolationQuality = 2;
    v2->_private->lineWidthThreshold = 0.75;
    uint64_t v5 = [MEMORY[0x263F825C8] whiteColor];
    v6 = v2->_private;
    pageColor = v6->pageColor;
    v6->pageColor = (UIColor *)v5;

    v2->_private->enablePageShadows = 1;
    v2->_private->enableTileEdgeColoring = GetDefaultsWriteColorWidgetBackgrounds();
    v2->_private->enableAccessibilityDrawing = GetDefaultsWriteDrawAccessibility();
    v2->_private->screenScaleFactor = PDFScreenGetBackingScaleFactor();
    v2->_private->enableTileUpdates = 1;
    *(_WORD *)&v2->_private->enableBackgroundImages = 1;
    v2->_private->deviceColorSpace = 0;
  }
  return v2;
}

- (void)dealloc
{
  deviceColorSpace = self->_private->deviceColorSpace;
  if (deviceColorSpace) {
    CGColorSpaceRelease(deviceColorSpace);
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFRenderingProperties;
  [(PDFRenderingProperties *)&v4 dealloc];
}

- (void)setPDFView:(id)a3
{
}

- (PDFView)pdfView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);

  return (PDFView *)WeakRetained;
}

- (void)setPDFLayerController:(id)a3
{
}

- (PDFLayerController)pdfLayerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfLayerController);

  return (PDFLayerController *)WeakRetained;
}

- (void)setDisplayBox:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
  {
    v3 = self->_private;
    if (v3->displayBox != a3)
    {
      v3->displayBox = a3;
      [(PDFRenderingProperties *)self _notifyPropertyChanged:0];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"setDisplayBox: %ld out of bounds", a3);
  }
}

- (int64_t)displayBox
{
  return self->_private->displayBox;
}

- (void)setShouldAntiAlias:(BOOL)a3
{
  v3 = self->_private;
  if (v3->shouldAntiAlias != a3)
  {
    v3->shouldAntiAlias = a3;
    [(PDFRenderingProperties *)self _notifyPropertyChanged:1];
  }
}

- (BOOL)shouldAntiAlias
{
  return self->_private->shouldAntiAlias;
}

- (void)setGreekingThreshold:(double)a3
{
  v3 = self->_private;
  if (v3->greekingThreshold != a3)
  {
    v3->greekingThreshold = a3;
    [(PDFRenderingProperties *)self _notifyPropertyChanged:2];
  }
}

- (double)greekingThreshold
{
  return self->_private->greekingThreshold;
}

- (void)setInterpolationQuality:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
  {
    v3 = self->_private;
    if (v3->interpolationQuality != a3)
    {
      v3->interpolationQuality = a3;
      [(PDFRenderingProperties *)self _notifyPropertyChanged:4];
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"setInterpolationQuality: illegal value passed in"];
  }
}

- (int64_t)interpolationQuality
{
  return self->_private->interpolationQuality;
}

- (void)setLineWidthThreshold:(double)a3
{
  v3 = self->_private;
  if (v3->lineWidthThreshold != a3)
  {
    v3->lineWidthThreshold = a3;
    [(PDFRenderingProperties *)self _notifyPropertyChanged:3];
  }
}

- (double)lineWidthThreshold
{
  return self->_private->lineWidthThreshold;
}

- (void)setPageColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  v6 = self->_private;
  pageColor = v6->pageColor;
  p_pageColor = (id *)&v6->pageColor;
  if (pageColor != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong(p_pageColor, a3);
    p_pageColor = (id *)[(PDFRenderingProperties *)self _notifyPropertyChanged:5];
    uint64_t v5 = v9;
  }

  MEMORY[0x270F9A758](p_pageColor, v5);
}

- (UIColor)pageColor
{
  return self->_private->pageColor;
}

- (void)setEnablePageShadows:(BOOL)a3
{
  v3 = self->_private;
  if (v3->enablePageShadows != a3)
  {
    v3->enablePageShadows = a3;
    [(PDFRenderingProperties *)self _notifyPropertyChanged:6];
  }
}

- (BOOL)enablePageShadows
{
  return self->_private->enablePageShadows;
}

- (void)setScreenScaleFactor:(double)a3
{
  self->_private->screenScaleFactor = a3;
}

- (double)screenScaleFactor
{
  return self->_private->screenScaleFactor;
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  self->_private->enableTileUpdates = a3;
}

- (BOOL)enableTileUpdates
{
  return self->_private->enableTileUpdates;
}

- (void)setEnableBackgroundImages:(BOOL)a3
{
  self->_private->enableBackgroundImages = a3;
}

- (BOOL)enableBackgroundImages
{
  return self->_private->enableBackgroundImages;
}

- (void)setIsUsingPDFExtensionView:(BOOL)a3
{
  self->_private->isUsingPDFExtensionView = a3;
}

- (BOOL)isUsingPDFExtensionView
{
  return self->_private->isUsingPDFExtensionView;
}

- (void)setDeviceColorSpace:(CGColorSpace *)a3
{
  uint64_t v5 = self->_private;
  deviceColorSpace = v5->deviceColorSpace;
  if (deviceColorSpace)
  {
    CGColorSpaceRelease(deviceColorSpace);
    uint64_t v5 = self->_private;
  }
  v5->deviceColorSpace = a3;
  v7 = self->_private->deviceColorSpace;
  if (v7)
  {
    CGColorSpaceRetain(v7);
  }
}

- (CGColorSpace)deviceColorSpace
{
  return self->_private->deviceColorSpace;
}

- (void)_notifyPropertyChanged:(int64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"PDFRenderingPropertyKey";
  objc_super v4 = [NSNumber numberWithInteger:a3];
  v8[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"PDFRenderingPropertiesChanged" object:self userInfo:v5];
}

- (void).cxx_destruct
{
}

@end