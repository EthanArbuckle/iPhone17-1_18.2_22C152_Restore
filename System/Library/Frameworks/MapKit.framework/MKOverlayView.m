@interface MKOverlayView
- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint;
- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRect;
- (BOOL)_canDrawContent;
- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4;
- (BOOL)_mayExtendOutsideBounds;
- (BOOL)areOverlayResourcesRequired:(id)a3;
- (BOOL)canDrawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale;
- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4;
- (BOOL)overlay:(id)a3 canPossiblyDrawKey:(id *)a4;
- (BOOL)overlayCanProvideCustomTileData:(id)a3;
- (BOOL)overlayCanProvideRasterTileData:(id)a3;
- (BOOL)overlayCanProvideVectorData:(id)a3;
- (BOOL)shouldUseMetalTexture:(id)a3;
- (CGPoint)pointForMapPoint:(MKMapPoint)mapPoint;
- (CGRect)rectForMapRect:(MKMapRect)mapRect;
- (MKMapPoint)mapPointForPoint:(CGPoint)point;
- (MKMapRect)mapRectForRect:(CGRect)rect;
- (MKOverlayView)init;
- (MKOverlayView)initWithCoder:(id)a3;
- (MKOverlayView)initWithFrame:(CGRect)a3;
- (MKOverlayView)initWithOverlay:(id)overlay;
- (id)_mapView;
- (id)_renderer;
- (id)customTileProviderForOverlay:(id)a3;
- (id)overlay;
- (id)rasterTileProviderForOverlay:(id)a3;
- (id)vectorDataForOverlay:(id)a3;
- (void)_forEachMapRectForKey:(id *)a3 withContext:(CGContext *)a4 performBlock:(id)a5;
- (void)_setMapView:(id)a3;
- (void)_updateRenderColors;
- (void)dealloc;
- (void)overlay:(id)a3 drawKey:(id *)a4 inContext:(CGContext *)a5;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect;
- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)set_boundingMapRect:(id)a3;
- (void)set_renderer:(id)a3;
@end

@implementation MKOverlayView

- (void)dealloc
{
  [self->_renderer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MKOverlayView;
  [(MKOverlayView *)&v3 dealloc];
}

- (MKOverlayView)init
{
  return [(MKOverlayView *)self initWithOverlay:0];
}

- (MKOverlayView)initWithCoder:(id)a3
{
  return [(MKOverlayView *)self initWithOverlay:0];
}

- (MKOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(MKOverlayView *)self init];
  v8 = v7;
  if (v7) {
    -[MKOverlayView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (MKOverlayView)initWithOverlay:(id)overlay
{
  id v5 = overlay;
  v16.receiver = self;
  v16.super_class = (Class)MKOverlayView;
  v6 = -[MKOverlayView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    [(MKOverlayView *)v6 setOpaque:0];
    objc_storeStrong((id *)&v7->_overlay, overlay);
    [v5 boundingMapRect];
    v7->_boundingMapRect.origin.double x = v8;
    v7->_boundingMapRect.origin.double y = v9;
    v7->_boundingMapRect.size.double width = v10;
    v7->_boundingMapRect.size.double height = v11;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MapKit.MKOverlayView.isolation", v12);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (void)set_renderer:(id)a3
{
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  -[MKOverlayView mapRectForRect:](self, "mapRectForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[MKOverlayView setNeedsDisplayInMapRect:](self, "setNeedsDisplayInMapRect:");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint
{
  objc_super v3 = [(MKOverlayView *)self layer];
  [v3 position];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(MKOverlayView *)self layer];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = v5 - v10 * 0.5;
  double v14 = v7 - v12 * 0.5;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (id)_mapView
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__8;
  double v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__MKOverlayView__mapView__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__MKOverlayView__mapView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)_setMapView:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__MKOverlayView__setMapView___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

id __29__MKOverlayView__setMapView___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 464), *(id *)(a1 + 40));
}

- (CGPoint)pointForMapPoint:(MKMapPoint)mapPoint
{
  double y = mapPoint.y;
  double x = mapPoint.x;
  [(MKOverlayView *)self _originMapPoint];
  double v6 = x - v5;
  double v8 = y - v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (MKMapPoint)mapPointForPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  [(MKOverlayView *)self _originMapPoint];
  double v6 = x + v5;
  double v8 = y + v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGRect)rectForMapRect:(MKMapRect)mapRect
{
  double height = mapRect.size.height;
  double width = mapRect.size.width;
  double y = mapRect.origin.y;
  double x = mapRect.origin.x;
  [(MKOverlayView *)self _originMapPoint];
  double v8 = -v7;
  double v10 = -v9;
  BOOL v11 = x == INFINITY;
  BOOL v12 = y == INFINITY;
  if (v11 && v12) {
    double v8 = -0.0;
  }
  double v13 = x + v8;
  if (v11 && v12) {
    double v10 = -0.0;
  }
  double v14 = y + v10;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (MKMapRect)mapRectForRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  [(MKOverlayView *)self _originMapPoint];
  BOOL v9 = x == INFINITY;
  BOOL v10 = y == INFINITY;
  if (v9 && v10) {
    double v7 = -0.0;
  }
  double v11 = x + v7;
  if (v9 && v10) {
    double v8 = -0.0;
  }
  double v12 = y + v8;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setNeedsDisplay
{
}

- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect
{
  MKMapRect v3 = mapRect;
  [self->_renderer setNeedsDisplayInRect:&v3 level:-1 reason:1];
}

- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale
{
  MKMapRect v7 = mapRect;
  id renderer = self->_renderer;
  uint64_t v5 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
  if (v5 >= -21) {
    uint64_t v6 = v5 + 19;
  }
  else {
    uint64_t v6 = -2;
  }
  [renderer setNeedsDisplayInRect:&v7 level:v6 reason:1];
}

- (void)set_boundingMapRect:(id)a3
{
  self->_boundingMapRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)a3;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRect
{
  double x = self->_boundingMapRect.origin.x;
  double y = self->_boundingMapRect.origin.y;
  double width = self->_boundingMapRect.size.width;
  double height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (id)_renderer
{
  return self->_renderer;
}

- (BOOL)_mayExtendOutsideBounds
{
  if (qword_1E9154070 != -1) {
    dispatch_once(&qword_1E9154070, &__block_literal_global_29);
  }
  return _MergedGlobals_17;
}

BOOL __40__MKOverlayView__mayExtendOutsideBounds__block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(1540);
  _MergedGlobals_17 = result;
  return result;
}

- (void)_forEachMapRectForKey:(id *)a3 withContext:(CGContext *)a4 performBlock:(id)a5
{
  id v7 = a5;
  [(MKOverlayView *)self _boundingMapRect];
  double v9 = v8;
  double v11 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v17 = __64__MKOverlayView__forEachMapRectForKey_withContext_performBlock___block_invoke;
  v18 = &unk_1E54B9AA8;
  v20 = a3;
  v21 = a4;
  id v12 = v7;
  id v19 = v12;
  LODWORD(a3) = vcvtmd_s64_f64(v9 * 0.0000000037252903);
  int v14 = vcvtpd_s64_f64((v9 + v11) * 0.0000000037252903);
  if ((int)a3 + 1 > v14) {
    int v15 = a3 + 1;
  }
  else {
    int v15 = v14;
  }
  do
  {
    v17((uint64_t)v16, (int)a3);
    a3 = (const $5E5F304956FB491AF6F034FDF0808287 *)(a3 + 1);
  }
  while (v15 != a3);
}

void __64__MKOverlayView__forEachMapRectForKey_withContext_performBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  MKMapRect v3 = *(_DWORD **)(a1 + 40);
  char v4 = v3[2];
  double v5 = 268435456.0 / (double)(1 << v4);
  double v6 = v5 * (double)(*v3 + (a2 << v4));
  double v7 = v5 * (double)(int)v3[1];
  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    id v12 = *(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
    v8.n128_f64[0] = v6;
    v9.n128_f64[0] = v7;
    v10.n128_f64[0] = v5;
    v11.n128_f64[0] = v5;
    v12(v8, v9, v10, v11);
  }
  else
  {
    unint64_t v13 = 0;
    *(double *)v26 = v6;
    *(double *)&v26[1] = v7;
    *(double *)&v26[2] = v5 * 0.5;
    *(double *)&v26[3] = v5 * 0.5;
    double v27 = v5 * 0.5 + v6;
    double v28 = v7;
    double v29 = v5 * 0.5;
    double v30 = v5 * 0.5;
    double v31 = v6;
    double v32 = v5 * 0.5 + v7;
    double v33 = v5 * 0.5;
    double v34 = v5 * 0.5;
    double v35 = v27;
    double v36 = v32;
    double v37 = v5 * 0.5;
    double v38 = v5 * 0.5;
    v24[0] = 0;
    v24[1] = 0;
    __asm { FMOV            V0.2D, #0.5 }
    v25[0] = _Q0;
    v25[1] = xmmword_18BD1B140;
    v25[2] = _Q0;
    v25[3] = xmmword_18BD1B150;
    v25[4] = _Q0;
    v25[5] = _Q0;
    v25[6] = _Q0;
    do
    {
      id v19 = *(CGContext **)(a1 + 48);
      if (v19)
      {
        CGContextSaveGState(v19);
        ClipBoundingBodouble x = CGContextGetClipBoundingBox((CGContextRef)*(void *)(a1 + 48));
        double width = ClipBoundingBox.size.width;
        double height = ClipBoundingBox.size.height;
        double v22 = *(double *)&v24[v13 / 8];
        double v23 = *(double *)&v24[v13 / 8 + 1];
        CGContextTranslateCTM(*(CGContextRef *)(a1 + 48), ClipBoundingBox.size.width * v22, ClipBoundingBox.size.height * v23);
        v42.size.double width = width * *(double *)&v24[v13 / 8 + 2];
        v42.size.double height = height * *((double *)&v25[v13 / 0x10] + 1);
        v42.origin.double x = 0.0;
        v42.origin.double y = 0.0;
        CGContextClipToRect(*(CGContextRef *)(a1 + 48), v42);
        (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)&v26[v13 / 8], *(double *)&v26[v13 / 8 + 1], *(double *)&v26[v13 / 8 + 2], *(double *)&v26[v13 / 8 + 3]);
        CGContextTranslateCTM(*(CGContextRef *)(a1 + 48), -(width * v22), -(height * v23));
        CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
      }
      else
      {
        (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)&v26[v13 / 8], *(double *)&v26[v13 / 8 + 1], *(double *)&v26[v13 / 8 + 2], *(double *)&v26[v13 / 8 + 3]);
      }
      v13 += 32;
    }
    while (v13 != 128);
  }
}

- (BOOL)overlay:(id)a3 canPossiblyDrawKey:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = 0;
  __n128 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MKOverlayView_overlay_canPossiblyDrawKey___block_invoke;
  v8[3] = &unk_1E54B9AD0;
  v8[5] = &v9;
  v8[6] = a4;
  v8[4] = self;
  [(MKOverlayView *)self _forEachMapRectForKey:a4 withContext:0 performBlock:v8];
  LOBYTE(a4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)a4;
}

uint64_t __44__MKOverlayView_overlay_canPossiblyDrawKey___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if ([*(id *)(a1 + 32) _mayExtendOutsideBounds])
  {
    BOOL v10 = a2 == INFINITY && a3 == INFINITY;
    a2 = v10 ? INFINITY : a2 - a4;
    a3 = v10 ? INFINITY : a3 - a5;
    if (!v10)
    {
      a4 = a4 + a4 * 2.0;
      a5 = a5 + a5 * 2.0;
    }
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_canPossiblyDrawMapRect:zoomScale:", a2, a3, a4, a5, (double)(1.0/ exp2((double)(uint64_t)(21- (unint64_t)(*(_DWORD *)(*(void *)(a1 + 48) + 12)+ *(_DWORD *)(*(void *)(a1 + 48) + 8))))));
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  double v7 = exp2((double)(21 - (a4->var3 + a4->var2)));
  objc_opt_class();
  double v8 = 1.0 / v7;
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([(MKOverlayView *)self lineWidth], double v10 = v9 / v8, v10 == 0.0))
  {
    uint64_t v11 = vcvtmd_s64_f64(log2(v8) + 0.5);
    if (v11 >= -21) {
      uint64_t v12 = (v11 & (v11 >> 63)) + 21;
    }
    else {
      uint64_t v12 = 0;
    }
    double v10 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v12] / v8;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __36__MKOverlayView_overlay_canDrawKey___block_invoke;
  v15[3] = &unk_1E54B9AF8;
  *(double *)&v15[6] = v10;
  *(double *)&v15[7] = v8;
  v15[4] = self;
  v15[5] = &v16;
  v15[8] = a4;
  [(MKOverlayView *)self _forEachMapRectForKey:a4 withContext:0 performBlock:v15];
  char v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __36__MKOverlayView_overlay_canDrawKey___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v10 = INFINITY;
  BOOL v11 = a2 == INFINITY && a3 == INFINITY;
  double v12 = INFINITY;
  double v13 = a4;
  double v14 = a5;
  if (!v11)
  {
    double v15 = *(double *)(a1 + 48);
    double v12 = a2 - v15;
    double v10 = a3 - v15;
    double v13 = a4 + v15 * 2.0;
    double v14 = a5 + v15 * 2.0;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_canPossiblyDrawMapRect:zoomScale:", v12, v10, v13, v14, *(double *)(a1 + 56));
  if (result)
  {
    if ([*(id *)(a1 + 32) _mayExtendOutsideBounds])
    {
      if (_MKLinkedOnOrAfterReleaseSet(2567))
      {
        for (uint64_t i = -1; i != 2; ++i)
        {
          for (uint64_t j = -1; j != 2; ++j)
          {
            uint64_t result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", a2 + (double)i * a4, a3 + (double)j * a5, a4, a5, *(double *)(a1 + 56));
            if (result) {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            }
          }
        }
        return result;
      }
      uint64_t result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", v12, v10, v13, v14, *(double *)(a1 + 56));
      if ((result & 1) == 0) {
        return result;
      }
    }
    else
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", a2, a3, a4, a5, (double)(1.0/ exp2((double)(uint64_t)(21- (unint64_t)(*(_DWORD *)(*(void *)(a1 + 64) + 12)+ *(_DWORD *)(*(void *)(a1 + 64) + 8))))));
      if (!result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)overlay:(id)a3 drawKey:(id *)a4 inContext:(CGContext *)a5
{
  long long v17 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  CGContextGetBaseCTM();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v12 = 0u;
  long long v13 = 0u;
  v11[2] = __43__MKOverlayView_overlay_drawKey_inContext___block_invoke;
  v11[3] = &unk_1E54B86C8;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  long long v14 = 0u;
  double v8 = (void (**)(void))MEMORY[0x18C139AE0](v11);
  double v9 = [(MKOverlayView *)self _mapView];
  double v10 = v9;
  if (v9) {
    [v9 _withEffectiveTraitCollection:v8];
  }
  else {
    v8[2](v8);
  }
}

uint64_t __43__MKOverlayView_overlay_drawKey_inContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __43__MKOverlayView_overlay_drawKey_inContext___block_invoke_2;
  double v9 = &unk_1E54B9B20;
  uint64_t v11 = v3;
  uint64_t v12 = v1;
  double v10 = v2;
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = v4;
  long long v15 = *(_OWORD *)(a1 + 88);
  return objc_msgSend(v2, "_forEachMapRectForKey:withContext:performBlock:");
}

void __43__MKOverlayView_overlay_drawKey_inContext___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  CGFloat v10 = 1.0
      / exp2((double)(21
                    - (*(_DWORD *)(*(void *)(a1 + 48) + 12) + *(_DWORD *)(*(void *)(a1 + 48) + 8))));
  objc_msgSend(*(id *)(a1 + 32), "rectForMapRect:", a2, a3, a4, a5);
  CGFloat v12 = -(v11 * v10);
  CGFloat v14 = -(v13 * v10);
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), v12, v14);
  CGContextScaleCTM(*(CGContextRef *)(a1 + 40), v10, v10);
  long long v15 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v21.c = v15;
  *(_OWORD *)&v21.tdouble x = *(_OWORD *)(a1 + 88);
  long long v16 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v20.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v20.c = v16;
  *(_OWORD *)&v20.tdouble x = *(_OWORD *)(a1 + 88);
  CGAffineTransformTranslate(&v21, &v20, v12, v14);
  CGAffineTransform v19 = v21;
  CGAffineTransformScale(&v20, &v19, v10, v10);
  CGAffineTransform v21 = v20;
  CGContextSetBaseCTM();
  long long v17 = *(CGContext **)(a1 + 40);
  [*(id *)(a1 + 32) alpha];
  CGContextSetAlpha(v17, v18);
  objc_msgSend(*(id *)(a1 + 32), "drawMapRect:zoomScale:inContext:", *(void *)(a1 + 40), a2, a3, a4, a5, v10);
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
}

- (BOOL)canDrawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale
{
  double height = mapRect.size.height;
  double width = mapRect.size.width;
  double y = mapRect.origin.y;
  double x = mapRect.origin.x;
  double v8 = [(MKOverlayView *)self overlay];
  [v8 boundingMapRect];
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  BOOL v9 = MKMapRectIntersectsRect(v11, v12);

  return v9;
}

- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  [(MKOverlayView *)self _boundingMapRect];
  double v12 = v7;
  double v13 = v6;
  double v14 = var0;
  double v15 = var1;

  return MKMapRectIntersectsRect(*(MKMapRect *)&v8, *(MKMapRect *)&v12);
}

- (BOOL)overlayCanProvideVectorData:(id)a3
{
  return 0;
}

- (id)vectorDataForOverlay:(id)a3
{
  return 0;
}

- (BOOL)overlayCanProvideRasterTileData:(id)a3
{
  return 0;
}

- (id)rasterTileProviderForOverlay:(id)a3
{
  return 0;
}

- (BOOL)overlayCanProvideCustomTileData:(id)a3
{
  return 0;
}

- (BOOL)areOverlayResourcesRequired:(id)a3
{
  return 0;
}

- (BOOL)shouldUseMetalTexture:(id)a3
{
  return 0;
}

- (id)customTileProviderForOverlay:(id)a3
{
  return 0;
}

- (void)_updateRenderColors
{
}

- (id)overlay
{
  return self->_overlay;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong(&self->_renderer, 0);

  objc_storeStrong((id *)&self->_overlay, 0);
}

@end