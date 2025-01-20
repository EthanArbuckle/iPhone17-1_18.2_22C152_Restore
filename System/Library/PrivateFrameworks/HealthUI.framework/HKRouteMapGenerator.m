@interface HKRouteMapGenerator
- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustRectForPolyline:(id)a3 withSize:(CGSize)a4;
- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4;
- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4 offsets:(CGRect)a5;
- (BOOL)useMarkerAnnotations;
- (BOOL)useRelativeColorForSpeed;
- (HKLocationReadings)locationReadings;
- (HKRouteMapGenerator)init;
- (MKMapSnapshotter)runningSnapshotter;
- (UIColor)endPointColor;
- (UIColor)startPointColor;
- (id)_annotationViewWithIsStartPoint:(BOOL)a3;
- (id)_imageWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 onSnapshot:(id)a6;
- (id)relativeColorForSpeed:(double)a3;
- (void)_drawLineFromPointA:(CGPoint)a3 toPointB:(CGPoint)a4 atSpeed:(double)a5 context:(CGContext *)a6 drawDashes:(BOOL)a7 lineWidth:(double)a8;
- (void)_overlayAnnotationView:(id)a3 point:(id)a4 onSnapshot:(id)a5 context:(CGContext *)a6;
- (void)drawLinesWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 context:(CGContext *)a6 pointFromMapPoint:(id)a7;
- (void)setEndPointColor:(id)a3;
- (void)setLocationReadings:(id)a3;
- (void)setRunningSnapshotter:(id)a3;
- (void)setStartPointColor:(id)a3;
- (void)setUseMarkerAnnotations:(BOOL)a3;
- (void)setUseRelativeColorForSpeed:(BOOL)a3;
- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 completion:(id)a6;
- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 offsets:(CGRect)a6 completion:(id)a7;
@end

@implementation HKRouteMapGenerator

- (HKRouteMapGenerator)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKRouteMapGenerator;
  v2 = [(HKRouteMapGenerator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HKRouteMapGenerator *)v2 setUseRelativeColorForSpeed:1];
    [(HKRouteMapGenerator *)v3 setUseMarkerAnnotations:1];
  }
  return v3;
}

- (void)drawLinesWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 context:(CGContext *)a6 pointFromMapPoint:(id)a7
{
  double var1 = a5.var1.var1;
  double var0 = a5.var1.var0;
  double v11 = a5.var0.var1;
  double v12 = a5.var0.var0;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  v14 = (double (**)(void, double, double))a7;
  v67.origin.double x = v12;
  v67.origin.double y = v11;
  v67.size.double width = var0;
  v67.size.double height = var1;
  MKMapRect v68 = MKMapRectInset(v67, var0 * -0.05, var1 * -0.05);
  double y = v68.origin.y;
  double x = v68.origin.x;
  double height = v68.size.height;
  double width = v68.size.width;
  v15 = [(HKRouteMapGenerator *)self locationReadings];
  v16 = [v15 workout];
  v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 workoutActivityType];
    double v19 = 5.0;
    if (v18 == 46) {
      double v19 = 15.0;
    }
  }
  else
  {
    double v19 = 5.0;
  }
  double v52 = v19;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v20 = [(HKRouteMapGenerator *)self locationReadings];
  v21 = [v20 inOrderLocationArrays];

  id obj = v21;
  uint64_t v50 = [v21 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v60 != v49) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v24 = [v23 firstObject];
        v25 = [v24 timestamp];
        [v25 timeIntervalSinceReferenceDate];
        double v27 = v26;

        if ((unint64_t)[v23 count] >= 2)
        {
          unint64_t v28 = 1;
          do
          {
            double v58 = v27;
            v29 = [v23 objectAtIndexedSubscript:v28];
            [v24 coordinate];
            MKMapPoint v30 = MKMapPointForCoordinate(v65);
            [v29 coordinate];
            MKMapPoint v31 = MKMapPointForCoordinate(v66);
            double v32 = v14[2](v14, v30.x, v30.y);
            double v34 = v33;
            double v35 = v14[2](v14, v31.x, v31.y);
            double v37 = v36;
            double v57 = v32;
            double v38 = (v35 - v32) * (v35 - v32) + (v36 - v34) * (v36 - v34);
            if (v38 >= 4.0)
            {
              v70.origin.double x = fmin(v30.x, v31.x);
              v70.origin.double y = fmin(v30.y, v31.y);
              v70.size.double width = vabdd_f64(v30.x, v31.x);
              v70.size.double height = vabdd_f64(v30.y, v31.y);
              v69.origin.double y = y;
              v69.origin.double x = x;
              v69.size.double height = height;
              v69.size.double width = width;
              if (MKMapRectIntersectsRect(v69, v70))
              {
                v39 = [v29 timestamp];
                [v39 timeIntervalSinceReferenceDate];
                double v41 = v40 - v58;

                if (v38 >= a4 * a4 || v41 <= v52)
                {
                  [v29 speed];
                  -[HKRouteMapGenerator _drawLineFromPointA:toPointB:atSpeed:context:drawDashes:lineWidth:](self, "_drawLineFromPointA:toPointB:atSpeed:context:drawDashes:lineWidth:", a6, v41 > v52, v57, v34, v35, v37, v43, a4);
                }
              }
              id v44 = v29;

              v24 = v44;
            }
            v45 = [v29 timestamp];
            [v45 timeIntervalSinceReferenceDate];
            double v27 = v46;

            ++v28;
          }
          while (v28 < [v23 count]);
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v50);
  }
}

- (void)_drawLineFromPointA:(CGPoint)a3 toPointB:(CGPoint)a4 atSpeed:(double)a5 context:(CGContext *)a6 drawDashes:(BOOL)a7 lineWidth:(double)a8
{
  BOOL v9 = a7;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v14 = a3.y;
  CGFloat v15 = a3.x;
  lengths[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v15, v14);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  if (v9)
  {
    lengths[0] = 0.0;
    lengths[1] = a8 + a8;
    CopyByDashingPath = CGPathCreateCopyByDashingPath(Mutable, 0, 0.0, lengths, 2uLL);
    CGContextAddPath(a6, CopyByDashingPath);
    CGContextSetLineWidth(a6, a8);
    CGContextSetLineCap(a6, kCGLineCapRound);
    id v19 = [MEMORY[0x1E4FB1618] grayColor];
    CGContextSetStrokeColorWithColor(a6, (CGColorRef)[v19 CGColor]);

    v20 = a6;
    CGPathDrawingMode v21 = kCGPathStroke;
  }
  else
  {
    CopyByDashingPath = CGPathCreateCopyByStrokingPath(Mutable, 0, a8, kCGLineCapRound, kCGLineJoinRound, 10.0);
    CGContextAddPath(a6, CopyByDashingPath);
    if ([(HKRouteMapGenerator *)self useRelativeColorForSpeed]) {
      [(HKRouteMapGenerator *)self relativeColorForSpeed:a5];
    }
    else {
    id v22 = [MEMORY[0x1E4FB1618] colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
    }
    CGContextSetFillColorWithColor(a6, (CGColorRef)[v22 CGColor]);

    v20 = a6;
    CGPathDrawingMode v21 = kCGPathFill;
  }
  CGContextDrawPath(v20, v21);
  CGPathRelease(CopyByDashingPath);
  CGPathRelease(Mutable);
}

- (id)relativeColorForSpeed:(double)a3
{
  objc_super v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.85];
  v6 = [(HKRouteMapGenerator *)self locationReadings];
  [v6 averageSpeed];
  double v8 = v7;

  BOOL v9 = [(HKRouteMapGenerator *)self locationReadings];
  [v9 topSpeed];
  double v11 = v10;

  double v12 = [(HKRouteMapGenerator *)self locationReadings];
  [v12 bottomSpeed];
  double v14 = v13;

  if (a3 >= 0.0 && v8 != 0.0 && (v8 * 0.9 < a3 ? (BOOL v15 = v8 * 1.1 <= a3) : (BOOL v15 = 1), v15))
  {
    double v16 = (a3 - v14) / (v11 - v14);
    if (v16 >= 0.5)
    {
      double v21 = v16 + -0.5 + v16 + -0.5;
      float64x2_t v18 = vrndaq_f64(vmlaq_n_f64((float64x2_t)xmmword_1E0F05FA0, (float64x2_t)xmmword_1E0F05F90, v21));
      double v19 = v21 * 100.0 + 0.0;
    }
    else
    {
      double v17 = v16 + v16;
      float64x2_t v18 = vrndaq_f64(vmlaq_n_f64((float64x2_t)xmmword_1E0F05FC0, (float64x2_t)xmmword_1E0F05FB0, v16 + v16));
      double v19 = v17 * -48.0 + 48.0;
    }
    int64x2_t v22 = vcvtq_s64_f64(v18);
    id v20 = [MEMORY[0x1E4FB1618] colorWithRed:(double)v22.i64[0] / 255.0 green:(double)v22.i64[1] / 255.0 blue:(double)(uint64_t)round(v19) / 255.0 alpha:0.85];
  }
  else
  {
    id v20 = v5;
  }
  v23 = v20;

  return v23;
}

- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4
{
  -[HKRouteMapGenerator _adjustRectForPolyline:withSize:](self, "_adjustRectForPolyline:withSize:", a3, a4.width, a4.height);
  return ($16D7AD370A23048FF9B6FEBFFE729354)MKMapRectInset(*(MKMapRect *)&v4, v6 * -0.05, v7 * -0.05);
}

- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4 offsets:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  -[HKRouteMapGenerator _adjustRectForPolyline:withSize:](self, "_adjustRectForPolyline:withSize:", a3, a4.width, a4.height);
  double v11 = v9 + v10 * x;
  double v14 = v12 + v13 * y;
  double v15 = v10 - v10 * width;
  double v16 = v13 - v13 * height;
  result.var1.double var1 = v16;
  result.var1.double var0 = v15;
  result.var0.double var1 = v14;
  result.var0.double var0 = v11;
  return result;
}

- ($16D7AD370A23048FF9B6FEBFFE729354)_adjustRectForPolyline:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 boundingMapRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = v6;
  double v16 = (double *)[v15 points];
  double v17 = *v16;
  double v18 = v16[1];
  id v19 = v15;
  uint64_t v20 = [v19 points];
  uint64_t v21 = [v19 pointCount];

  uint64_t v22 = v20 + 16 * v21;
  double v23 = *(double *)(v22 - 16);
  double v24 = fmin(v18, *(double *)(v22 - 8));
  double v25 = 16.0 / width * v12;
  double v26 = fmin(v17, v23);
  float v27 = v25 - (v26 - v8);
  double v28 = fmax(v17, v23);
  *(float *)&double v23 = v25 + v28 - (v8 + v12);
  double v29 = fmaxf(v27, 0.0) * 1.5;
  double v30 = fmaxf(*(float *)&v23, 0.0) * 1.5;
  if (v26 + -32.0 < v8) {
    double v29 = v29 * 1.5;
  }
  double v31 = v8 - v29;
  if (v28 + 32.0 <= v12 + v8 - v29) {
    double v32 = v30;
  }
  else {
    double v32 = v30 * 1.5;
  }
  float v33 = 32.0 / height * v14 - (v24 - v10);
  double v34 = fmaxf(v33, 0.0) * 1.5;
  double v35 = v14 + v34;
  double v36 = v10 - v34;
  double v37 = v12 + v29 + v32;
  result.var1.double var1 = v35;
  result.var1.double var0 = v37;
  result.var0.double var1 = v36;
  result.var0.double var0 = v31;
  return result;
}

- (id)_annotationViewWithIsStartPoint:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_useMarkerAnnotations)
  {
    uint64_t v4 = (HKDotAnnotationView *)[objc_alloc(MEMORY[0x1E4F30F58]) initWithAnnotation:0 reuseIdentifier:0];
    -[MKAnnotationView setBounds:](v4, "setBounds:", 0.0, 0.0, 32.0, 32.0);
    if (v3)
    {
      double v5 = 0.298039216;
      double v6 = 0.850980392;
      double v7 = 0.392156863;
    }
    else
    {
      double v6 = 0.231372549;
      double v7 = 0.188235294;
      double v5 = 1.0;
    }
    double v12 = [MEMORY[0x1E4FB1618] colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
    [(HKDotAnnotationView *)v4 setMarkerTintColor:v12];
  }
  else
  {
    uint64_t v4 = [[HKDotAnnotationView alloc] initWithAnnotation:0 reuseIdentifier:0];
    -[MKAnnotationView setBounds:](v4, "setBounds:", 0.0, 0.0, 20.0, 20.0);
    if (v3)
    {
      double v9 = [(HKRouteMapGenerator *)self startPointColor];

      if (v9) {
        [(HKRouteMapGenerator *)self startPointColor];
      }
      else {
        [MEMORY[0x1E4FB1618] colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
      }
    }
    else
    {
      double v11 = [(HKRouteMapGenerator *)self endPointColor];

      if (v11) {
        [(HKRouteMapGenerator *)self endPointColor];
      }
      else {
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
      }
    uint64_t v10 = };
    double v12 = (void *)v10;
    [(HKDotAnnotationView *)v4 setDotColor:v10];
  }

  return v4;
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 completion:(id)a6
{
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 offsets:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v13 = a3.height;
  double v14 = a3.width;
  id v16 = a5;
  id v17 = a7;
  id v18 = objc_alloc_init(MEMORY[0x1E4F30F40]);
  [v18 setTraitCollection:v16];
  id v19 = [(HKRouteMapGenerator *)self locationReadings];
  uint64_t v20 = [v19 count];

  uint64_t v21 = [(HKRouteMapGenerator *)self locationReadings];
  uint64_t v22 = [v21 allValidLocations];
  double v23 = v22;
  if (v20 == 1)
  {
    double v24 = [v22 firstObject];

    [v24 coordinate];
    MKMapPoint v25 = MKMapPointForCoordinate(v56);
    double v26 = v25.x + -750.0 + -32.0;
    double v27 = v25.y + -750.0 + -32.0;
    double v28 = 1500.0;

    double v29 = 0;
    double v30 = 1500.0;
  }
  else
  {
    id v50 = v17;
    uint64_t v31 = [v22 count];

    double v32 = (char *)malloc_type_malloc(16 * v31, 0x1000040451B5BE8uLL);
    float v33 = v32;
    if (v31)
    {
      uint64_t v34 = 0;
      double v35 = v32 + 8;
      do
      {
        double v36 = [(HKRouteMapGenerator *)self locationReadings];
        double v37 = [v36 allValidLocations];
        double v38 = [v37 objectAtIndexedSubscript:v34];

        [v38 coordinate];
        *(MKMapPoint *)(v35 - 8) = MKMapPointForCoordinate(v57);

        ++v34;
        v35 += 16;
      }
      while (v31 != v34);
    }
    double v29 = [MEMORY[0x1E4F30FF0] polylineWithPoints:v33 count:v31];
    free(v33);
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.double width = width;
    v58.size.double height = height;
    if (CGRectEqualToRect(v58, *MEMORY[0x1E4F1DB20])) {
      -[HKRouteMapGenerator _adjustedMapRectForPolyline:size:](self, "_adjustedMapRectForPolyline:size:", v29, v14, v13);
    }
    else {
      -[HKRouteMapGenerator _adjustedMapRectForPolyline:size:offsets:](self, "_adjustedMapRectForPolyline:size:offsets:", v29, v14, v13, x, y, width, height);
    }
    double v26 = v39;
    double v27 = v40;
    double v28 = v41;
    double v30 = v42;
    id v17 = v50;
  }
  objc_msgSend(v18, "setMapRect:", v26, v27, v28, v30);
  [v18 setMapType:5];
  objc_msgSend(v18, "setSize:", v14, v13);
  [(MKMapSnapshotter *)self->_runningSnapshotter cancel];
  runningSnapshotter = self->_runningSnapshotter;
  self->_runningSnapshotter = 0;

  id v44 = (MKMapSnapshotter *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v18];
  v45 = self->_runningSnapshotter;
  self->_runningSnapshotter = v44;

  double v46 = dispatch_get_global_queue(25, 0);
  objc_initWeak(location, self);
  id v47 = self->_runningSnapshotter;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke;
  v51[3] = &unk_1E6D55C90;
  id v48 = v17;
  id v53 = v48;
  objc_copyWeak(v54, location);
  id v49 = v29;
  id v52 = v49;
  v54[1] = *(id *)&a4;
  v54[2] = *(id *)&v26;
  v54[3] = *(id *)&v27;
  v54[4] = *(id *)&v28;
  v54[5] = *(id *)&v30;
  [(MKMapSnapshotter *)v47 startWithQueue:v46 completionHandler:v51];

  objc_destroyWeak(v54);
  objc_destroyWeak(location);
}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1E4E40740]();
  _HKInitializeLogging();
  double v8 = *MEMORY[0x1E4F29EE8];
  double v9 = *MEMORY[0x1E4F29EE8];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_cold_1((uint64_t)v6, v8);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_DEFAULT, "[routes] Received snapshot back from MKMapSnapshotter: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_303;
    block[3] = &unk_1E6D55C68;
    objc_copyWeak(v15, (id *)(a1 + 48));
    id v12 = *(id *)(a1 + 32);
    v15[1] = *(id *)(a1 + 56);
    long long v10 = *(_OWORD *)(a1 + 80);
    long long v16 = *(_OWORD *)(a1 + 64);
    long long v17 = v10;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v15);
  }
}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_303(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4E40740]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = objc_msgSend(WeakRetained, "_imageWithPolyline:lineWidth:mapRect:onSnapshot:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_imageWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 onSnapshot:(id)a6
{
  double var1 = a5.var1.var1;
  double var0 = a5.var1.var0;
  double v9 = a5.var0.var1;
  double v10 = a5.var0.var0;
  id v13 = a3;
  id v14 = a6;
  id v15 = [v14 image];
  [v15 size];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  uint64_t v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v20 scale];
  CGFloat v22 = v21;
  v50.double width = v17;
  v50.double height = v19;
  UIGraphicsBeginImageContextWithOptions(v50, 0, v22);

  double v23 = [v14 image];
  [v23 size];
  double v25 = v24;
  double v26 = [v14 image];
  [v26 size];
  double v28 = v27;

  double v29 = [v14 image];
  objc_msgSend(v29, "drawInRect:", 0.0, 0.0, v25, v28);

  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v31 = [(HKRouteMapGenerator *)self _annotationViewWithIsStartPoint:1];
  double v32 = [(HKRouteMapGenerator *)self locationReadings];
  uint64_t v33 = [v32 count];

  if (v33 == 1)
  {
    uint64_t v34 = [(HKRouteMapGenerator *)self locationReadings];
    double v35 = [v34 allValidLocations];
    double v36 = [v35 firstObject];
    [v36 coordinate];
    MKMapPoint v37 = MKMapPointForCoordinate(v51);

    -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v31, v14, CurrentContext, v37.x, v37.y);
  }
  else
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __71__HKRouteMapGenerator__imageWithPolyline_lineWidth_mapRect_onSnapshot___block_invoke;
    v47[3] = &unk_1E6D55CB8;
    id v38 = v14;
    id v48 = v38;
    -[HKRouteMapGenerator drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:](self, "drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:", v13, CurrentContext, v47, a4, v10, v9, var0, var1);
    CGContextStrokePath(CurrentContext);
    double v39 = [(HKRouteMapGenerator *)self _annotationViewWithIsStartPoint:0];
    if ([v13 pointCount])
    {
      id v40 = v13;
      double v41 = (double *)[v40 points];
      -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v31, v38, CurrentContext, *v41, v41[1]);
      id v42 = v40;
      uint64_t v43 = [v42 points];
      uint64_t v44 = [v42 pointCount];
      -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v39, v38, CurrentContext, *(double *)(v43 + 16 * v44 - 16), *(double *)(v43 + 16 * v44 - 8));
    }
  }
  v45 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v45;
}

uint64_t __71__HKRouteMapGenerator__imageWithPolyline_lineWidth_mapRect_onSnapshot___block_invoke(uint64_t a1, double a2, double a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  CLLocationCoordinate2D v4 = MKCoordinateForMapPoint(*(MKMapPoint *)&a2);
  return objc_msgSend(v3, "pointForCoordinate:", v4.latitude, v4.longitude);
}

- (void)_overlayAnnotationView:(id)a3 point:(id)a4 onSnapshot:(id)a5 context:(CGContext *)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a5;
  id v11 = a3;
  v25.double x = var0;
  v25.double y = var1;
  CLLocationCoordinate2D v12 = MKCoordinateForMapPoint(v25);
  objc_msgSend(v10, "pointForCoordinate:", v12.latitude, v12.longitude);
  double v14 = v13;
  double v16 = v15;

  [v11 bounds];
  double v17 = v14 - CGRectGetMidX(v26);
  [v11 centerOffset];
  CGFloat v19 = v17 + v18;
  [v11 bounds];
  double v20 = v16 - CGRectGetMidY(v27);
  [v11 centerOffset];
  CGFloat v22 = v20 + v21;
  CGContextSaveGState(a6);
  CGContextTranslateCTM(a6, v19, v22);
  [v11 prepareForSnapshotting];
  double v23 = [v11 layer];

  [v23 renderInContext:a6];
  CGContextRestoreGState(a6);
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
}

- (BOOL)useRelativeColorForSpeed
{
  return self->_useRelativeColorForSpeed;
}

- (void)setUseRelativeColorForSpeed:(BOOL)a3
{
  self->_useRelativeColorForSpeed = a3;
}

- (BOOL)useMarkerAnnotations
{
  return self->_useMarkerAnnotations;
}

- (void)setUseMarkerAnnotations:(BOOL)a3
{
  self->_useMarkerAnnotations = a3;
}

- (UIColor)startPointColor
{
  return self->_startPointColor;
}

- (void)setStartPointColor:(id)a3
{
}

- (UIColor)endPointColor
{
  return self->_endPointColor;
}

- (void)setEndPointColor:(id)a3
{
}

- (MKMapSnapshotter)runningSnapshotter
{
  return self->_runningSnapshotter;
}

- (void)setRunningSnapshotter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningSnapshotter, 0);
  objc_storeStrong((id *)&self->_endPointColor, 0);
  objc_storeStrong((id *)&self->_startPointColor, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "[routes] Error generating snapshot: %@", (uint8_t *)&v2, 0xCu);
}

@end