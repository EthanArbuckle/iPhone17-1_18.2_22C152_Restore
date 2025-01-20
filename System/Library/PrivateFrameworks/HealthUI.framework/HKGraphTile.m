@interface HKGraphTile
- (BOOL)hidden;
- (BOOL)tileDisplayedSinceSetNeedsDisplay;
- (CALayer)caLayer;
- (HKGraphTile)initWithParentView:(id)a3 graphViewTileThread:(id)a4;
- (HKGraphTileDrawingDelegate)drawingDelegate;
- (HKGraphViewTileThread)graphViewTileThread;
- (UIView)parentView;
- (_HKGraphTileRenderToImage)currentImageRenderer;
- (double)lastImageAssignmentTime;
- (id)_imageRendererForSize:(CGSize)a3;
- (int64_t)configurationChangedCounter;
- (int64_t)currentColumn;
- (void)_handlePostRenderOperations;
- (void)configureTileWithScreenRect:(CGRect)a3 column:(int64_t)a4;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)prepareTileForReuse;
- (void)refreshTileContent;
- (void)renderTileInBackgroundWithRenderer:(id)a3 tileSize:(CGSize)a4 configurationChangedCounter:(int64_t)a5;
- (void)setCaLayer:(id)a3;
- (void)setConfigurationChangedCounter:(int64_t)a3;
- (void)setCurrentImageRenderer:(id)a3;
- (void)setDrawingDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLastImageAssignmentTime:(double)a3;
@end

@implementation HKGraphTile

- (HKGraphTile)initWithParentView:(id)a3 graphViewTileThread:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKGraphTile;
  v8 = [(HKGraphTile *)&v19 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 scale];
    double v11 = v10;

    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    caLayer = v8->_caLayer;
    v8->_caLayer = v12;

    [(CALayer *)v8->_caLayer setContentsScale:v11];
    -[CALayer setAnchorPoint:](v8->_caLayer, "setAnchorPoint:", 0.0, 0.0);
    [(CALayer *)v8->_caLayer setOpaque:1];
    [(CALayer *)v8->_caLayer setDrawsAsynchronously:1];
    [(CALayer *)v8->_caLayer setDelegate:v8];
    [(CALayer *)v8->_caLayer setContents:0];
    [(CALayer *)v8->_caLayer setContentsFormat:*MEMORY[0x1E4F39E20]];
    v20 = @"contents";
    v14 = [MEMORY[0x1E4F1CA98] null];
    v21[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [(CALayer *)v8->_caLayer setActions:v15];

    v16 = [v6 layer];
    [v16 addSublayer:v8->_caLayer];

    objc_storeWeak((id *)&v8->_graphViewTileThread, v7);
    v8->_currentColumn = -1;
    v8->_tileDisplayedSinceSetNeedsDisplay = 0;
    v8->_configurationChangedCounter = 0;
    objc_storeWeak((id *)&v8->_parentView, v6);
    currentImageRenderer = v8->_currentImageRenderer;
    v8->_currentImageRenderer = 0;

    v8->_lastImageAssignmentTime = 0.0;
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(HKGraphTile *)self currentImageRenderer];
  [(HKGraphTile *)self lastImageAssignmentTime];
  +[_HKGraphTileDelayedRendererReleaseManager handleDelayedRendererRelease:lastAssignmentTime:](_HKGraphTileDelayedRendererReleaseManager, "handleDelayedRendererRelease:lastAssignmentTime:", v3);

  v4 = [(HKGraphTile *)self caLayer];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)HKGraphTile;
  [(HKGraphTile *)&v5 dealloc];
}

- (void)configureTileWithScreenRect:(CGRect)a3 column:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_currentColumn = a4;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  -[CALayer setBounds:](self->_caLayer, "setBounds:", 0.0, 0.0, width, height);
  -[CALayer setPosition:](self->_caLayer, "setPosition:", x, y);
  [MEMORY[0x1E4F39CF8] commit];
  ++self->_configurationChangedCounter;
  [(HKGraphTile *)self refreshTileContent];
}

- (void)prepareTileForReuse
{
  self->_currentColumn = -1;
  [(HKGraphTile *)self setDrawingDelegate:0];
  ++self->_configurationChangedCounter;
}

- (BOOL)hidden
{
  v2 = [(HKGraphTile *)self caLayer];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  objc_super v5 = [(HKGraphTile *)self caLayer];
  [v5 setHidden:v3];

  id v6 = (void *)MEMORY[0x1E4F39CF8];
  [v6 commit];
}

- (void)refreshTileContent
{
  self->_tileDisplayedSinceSetNeedsDispladouble y = 0;
  BOOL v3 = [(HKGraphTile *)self graphViewTileThread];

  if (v3)
  {
    v4 = [(HKGraphTile *)self drawingDelegate];
    objc_super v5 = [(HKGraphTile *)self caLayer];
    [v5 frame];
    objc_msgSend(v4, "createTileRendererWithTileRect:column:", -[HKGraphTile currentColumn](self, "currentColumn"), v6, v7, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    double v10 = [_HKGraphTileBackgroundRenderingContext alloc];
    double v11 = [(HKGraphTile *)self caLayer];
    [v11 bounds];
    v14 = -[_HKGraphTileBackgroundRenderingContext initWithGraphTile:graphViewRenderer:tileSize:configurationChangedCounter:](v10, "initWithGraphTile:graphViewRenderer:tileSize:configurationChangedCounter:", self, v16, [(HKGraphTile *)self configurationChangedCounter], v12, v13);

    v15 = [(HKGraphTile *)self graphViewTileThread];
    [v15 scheduleRedrawUsingRenderer:v14];
  }
  else
  {
    id v16 = [(HKGraphTile *)self caLayer];
    [v16 setNeedsDisplay];
  }
}

- (id)_imageRendererForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(HKGraphTile *)self currentImageRenderer];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(HKGraphTile *)self currentImageRenderer];
    [v8 sizeInPoints];
    if (vabdd_f64(width, v9) <= 0.01)
    {
      double v10 = [(HKGraphTile *)self currentImageRenderer];
      [v10 sizeInPoints];
      double v12 = vabdd_f64(height, v11);

      if (v12 <= 0.01) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  double v13 = [(HKGraphTile *)self currentImageRenderer];

  if (v13)
  {
    v14 = [(HKGraphTile *)self currentImageRenderer];
    [(HKGraphTile *)self lastImageAssignmentTime];
    +[_HKGraphTileDelayedRendererReleaseManager handleDelayedRendererRelease:lastAssignmentTime:](_HKGraphTileDelayedRendererReleaseManager, "handleDelayedRendererRelease:lastAssignmentTime:", v14);

    [(HKGraphTile *)self setCurrentImageRenderer:0];
  }
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  double v17 = v16;

  v18 = -[_HKGraphTileRenderToImage initWithSize:scale:invertedYAxis:]([_HKGraphTileRenderToImage alloc], "initWithSize:scale:invertedYAxis:", 1, width, height, v17);
  [(HKGraphTile *)self setCurrentImageRenderer:v18];

LABEL_8:
  return [(HKGraphTile *)self currentImageRenderer];
}

- (void)renderTileInBackgroundWithRenderer:(id)a3 tileSize:(CGSize)a4 configurationChangedCounter:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKGraphTile.m" lineNumber:191 description:@"HKGraphTile renderTileInBackgroundWithRenderer: is expected to be called from the background thread only"];
  }
  if (height != 0.0 && width != 0.0)
  {
    double v11 = -[HKGraphTile _imageRendererForSize:](self, "_imageRendererForSize:", width, height);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke;
    v15[3] = &unk_1E6D515F0;
    id v16 = v10;
    CFTypeRef v12 = CFRetain((CFTypeRef)[v11 drawToImage:v15]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke_2;
    v14[3] = &unk_1E6D51618;
    v14[4] = self;
    v14[5] = a5;
    v14[6] = v12;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) renderContentToContext:a2];
}

uint64_t __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) configurationChangedCounter];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v4 = [*(id *)(a1 + 32) caLayer];
    [v4 setContents:v3];

    [*(id *)(a1 + 32) setLastImageAssignmentTime:CACurrentMediaTime()];
    CFRelease(*(CFTypeRef *)(a1 + 48));
    objc_super v5 = *(void **)(a1 + 32);
    return [v5 _handlePostRenderOperations];
  }
  return result;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKGraphTile.m" lineNumber:230 description:@"HKGraphTile drawLayer:inContext: should only be called from the main thread"];
  }
  double v7 = [(HKGraphTile *)self drawingDelegate];
  double v8 = [(HKGraphTile *)self caLayer];
  [v8 frame];
  objc_msgSend(v7, "createTileRendererWithTileRect:column:", -[HKGraphTile currentColumn](self, "currentColumn"), v9, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  [v14 renderContentToContext:a4];
  [(HKGraphTile *)self _handlePostRenderOperations];
}

- (void)_handlePostRenderOperations
{
  self->_tileDisplayedSinceSetNeedsDispladouble y = 1;
  id v2 = [(HKGraphTile *)self drawingDelegate];
  [v2 tileRenderDidFinish];
}

- (HKGraphTileDrawingDelegate)drawingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingDelegate);
  return (HKGraphTileDrawingDelegate *)WeakRetained;
}

- (void)setDrawingDelegate:(id)a3
{
}

- (BOOL)tileDisplayedSinceSetNeedsDisplay
{
  return self->_tileDisplayedSinceSetNeedsDisplay;
}

- (int64_t)currentColumn
{
  return self->_currentColumn;
}

- (HKGraphViewTileThread)graphViewTileThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphViewTileThread);
  return (HKGraphViewTileThread *)WeakRetained;
}

- (CALayer)caLayer
{
  return self->_caLayer;
}

- (void)setCaLayer:(id)a3
{
}

- (int64_t)configurationChangedCounter
{
  return self->_configurationChangedCounter;
}

- (void)setConfigurationChangedCounter:(int64_t)a3
{
  self->_configurationChangedCounter = a3;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (_HKGraphTileRenderToImage)currentImageRenderer
{
  return self->_currentImageRenderer;
}

- (void)setCurrentImageRenderer:(id)a3
{
}

- (double)lastImageAssignmentTime
{
  return self->_lastImageAssignmentTime;
}

- (void)setLastImageAssignmentTime:(double)a3
{
  self->_lastImageAssignmentTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImageRenderer, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_caLayer, 0);
  objc_destroyWeak((id *)&self->_graphViewTileThread);
  objc_destroyWeak((id *)&self->_drawingDelegate);
}

@end