@interface PDFPageLayerTile
- (BOOL)hasContent;
- (BOOL)isWorking;
- (CGRect)rootViewFrame;
- (PDFPageLayerTile)initWithFrame:(CGRect)a3 forPageLayer:(id)a4 withRenderingTransform:(CGAffineTransform *)a5 tileContentsScale:(double)a6 generationID:(int)a7;
- (PDFRenderingProperties)renderingProperties;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)hasStartedWork;
- (void)recievePDFTileSurface:(id)a3;
- (void)setRenderingProperties:(id)a3;
- (void)setRootViewFrame:(CGRect)a3;
@end

@implementation PDFPageLayerTile

- (PDFPageLayerTile)initWithFrame:(CGRect)a3 forPageLayer:(id)a4 withRenderingTransform:(CGAffineTransform *)a5 tileContentsScale:(double)a6 generationID:(int)a7
{
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDFPageLayerTile;
  v12 = [(PDFPageLayerTile *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(PDFPageLayerTile *)v12 setFrame:PDFRectToCGRect(v12)];
    [(PDFPageLayerTile *)v13 setContentsOpaque:1];
    [(PDFPageLayerTile *)v13 setContents:0];
    pageSurface = v13->pageSurface;
    v13->pageSurface = 0;

    objc_storeWeak((id *)&v13->pageLayer, v11);
    long long v16 = *(_OWORD *)&a5->c;
    long long v15 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&v13->renderingTransform.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v13->renderingTransform.c = v16;
    *(_OWORD *)&v13->renderingTransform.tx = v15;
    v13->generationID = a7;
    atomic_store(0, (unsigned __int8 *)&v13->isWorking);
    atomic_store(0, (unsigned __int8 *)&v13->hasContent);
    v13->tileContentsScale = a6;
    [(PDFPageLayerTile *)v13 setContentsScale:a6];
    [(PDFPageLayerTile *)v13 setContentsGravity:*MEMORY[0x263F15DF0]];
    [(PDFPageLayerTile *)v13 setEdgeAntialiasingMask:0];
    [(PDFPageLayerTile *)v13 setMinificationFilter:*MEMORY[0x263F15D28]];
    [(PDFPageLayerTile *)v13 setMagnificationFilter:*MEMORY[0x263F15CC8]];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"Generation %d", v13->generationID);
    [(PDFPageLayerTile *)v13 setName:v17];
  }
  return v13;
}

- (void)dealloc
{
  if (self->pageSurface)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v3 = +[PDFTilePool sharedPool];
    [v3 releasePDFTileSurface:self->pageSurface];

    [(PDFPageLayerTile *)self setContents:0];
    [MEMORY[0x263F158F8] commit];
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFPageLayerTile;
  [(PDFPageLayerTile *)&v4 dealloc];
}

- (void)hasStartedWork
{
}

- (BOOL)isWorking
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->isWorking);
  return v2 & 1;
}

- (BOOL)hasContent
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->hasContent);
  return v2 & 1;
}

- (void)recievePDFTileSurface:(id)a3
{
  v8 = (char *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->pageLayer);
  if (WeakRetained)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    objc_storeStrong((id *)&self->pageSurface, a3);
    uint64_t type = self->pageSurface->type;
    if (type <= 2) {
      [(PDFPageLayerTile *)self setContents:*(void *)&v8[*off_264204400[type]]];
    }
    atomic_store(0, (unsigned __int8 *)&self->isWorking);
    atomic_store(1u, (unsigned __int8 *)&self->hasContent);
    [(PDFPageLayerTile *)self setName:@"PDFPageLayerTile [Image Set]"];
    [MEMORY[0x263F158F8] commit];
    [WeakRetained tileDrawingComplete:self];
  }
  else
  {
    v7 = +[PDFTilePool sharedPool];
    [v7 releasePDFTileSurface:v8];
  }
}

- (void)drawInContext:(CGContext *)a3
{
  [(PDFPageLayerTile *)self hasStartedWork];
  CGContextSetRGBFillColor(a3, 1.0, 1.0, 1.0, 1.0);
  CGRect ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  CGRect v15 = CGRectIntegral(ClipBoundingBox);
  CGContextFillRect(a3, v15);
  CGAffineTransform renderingTransform = self->renderingTransform;
  CGContextSetCTM();
  BOOL v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:0];
  BOOL v6 = +[PDFPage shouldHideAnnotationsForThisThread];
  +[PDFPage setShouldHideAnnotationsForThisThread:1];
  BOOL v7 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread];
  +[PDFPage setExcludingAKAnnotationRenderingForThisThread:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->pageLayer);
  v9 = [WeakRetained page];
  uint64_t v10 = [v9 copyDisplayList];
  if (v10)
  {
    id v11 = (const void *)v10;
    CGDisplayListDrawInContext();
    CFRelease(v11);
  }
  else
  {
    v12 = [(PDFPageLayerTile *)self renderingProperties];
    objc_msgSend(v9, "drawWithBox:toContext:", objc_msgSend(v12, "displayBox"), a3);
  }
  +[PDFPage setExcludingAKAnnotationRenderingForThisThread:v7];
  +[PDFPage setShouldHideAnnotationsForThisThread:v6];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v5];
  atomic_store(0, (unsigned __int8 *)&self->isWorking);
  atomic_store(1u, (unsigned __int8 *)&self->hasContent);
  [WeakRetained tileDrawingComplete:self];
}

- (PDFRenderingProperties)renderingProperties
{
  return (PDFRenderingProperties *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRenderingProperties:(id)a3
{
}

- (CGRect)rootViewFrame
{
  objc_copyStruct(v6, &self->_rootViewFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRootViewFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rootViewFrame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingProperties, 0);
  objc_storeStrong((id *)&self->pageSurface, 0);

  objc_destroyWeak((id *)&self->pageLayer);
}

@end