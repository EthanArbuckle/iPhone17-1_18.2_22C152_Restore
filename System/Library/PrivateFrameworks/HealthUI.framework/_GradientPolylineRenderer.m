@interface _GradientPolylineRenderer
- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint;
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (_GradientPolylineRenderer)initWithOverlay:(id)a3 locationReadings:(id)a4;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation _GradientPolylineRenderer

- (_GradientPolylineRenderer)initWithOverlay:(id)a3 locationReadings:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_GradientPolylineRenderer;
  v7 = [(MKOverlayPathRenderer *)&v11 initWithOverlay:a3];
  if (v7)
  {
    v8 = objc_alloc_init(HKRouteMapGenerator);
    generator = v7->_generator;
    v7->_generator = v8;

    [(HKRouteMapGenerator *)v7->_generator setLocationReadings:v6];
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint
{
  v2 = [(MKOverlayRenderer *)self overlay];
  [v2 boundingMapRect];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v9 = a3.var0.var1;
  double v10 = a3.var0.var0;
  [(_GradientPolylineRenderer *)self _originMapPoint];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  CGContextSetBlendMode(a5, kCGBlendModeNormal);
  [(MKOverlayPathRenderer *)self applyStrokePropertiesToContext:a5 atZoomScale:a4];
  v16 = [(MKOverlayRenderer *)self overlay];
  CGFloat v17 = MKRoadWidthAtZoomScale(a4);
  generator = self->_generator;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61___GradientPolylineRenderer_drawMapRect_zoomScale_inContext___block_invoke;
  v19[3] = &__block_descriptor_48_e24__CGPoint_dd_24__0___dd_8l;
  v19[4] = v13;
  v19[5] = v15;
  -[HKRouteMapGenerator drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:](generator, "drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:", v16, a5, v19, v17, v10, v9, var0, var1);
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  return 1;
}

- (void).cxx_destruct
{
}

@end