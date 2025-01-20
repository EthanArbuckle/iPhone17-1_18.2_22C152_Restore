@interface HKGraphSeriesSecondaryRenderContext
- (HKGraphSeriesSecondaryRenderContext)init;
- (void)addOffScreenRegionAtLocation:(double)a3 color:(id)a4 aboveScreen:(BOOL)a5;
- (void)addOffScreenRegionWithStartLocation:(double)a3 endLocation:(double)a4 color:(id)a5 aboveScreen:(BOOL)a6;
- (void)drawInAxisRect:(CGRect)a3 backgroundColor:(id)a4 renderContext:(CGContext *)a5;
@end

@implementation HKGraphSeriesSecondaryRenderContext

- (HKGraphSeriesSecondaryRenderContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKGraphSeriesSecondaryRenderContext;
  v2 = [(HKGraphSeriesSecondaryRenderContext *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aboveScreenRegions = v2->_aboveScreenRegions;
    v2->_aboveScreenRegions = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    belowScreenRegions = v2->_belowScreenRegions;
    v2->_belowScreenRegions = v5;
  }
  return v2;
}

- (void)addOffScreenRegionWithStartLocation:(double)a3 endLocation:(double)a4 color:(id)a5 aboveScreen:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v12 = objc_alloc_init(_HKGraphSeriesSecondaryRenderContextOffScreenRegion);
  [(_HKGraphSeriesSecondaryRenderContextOffScreenRegion *)v12 setStart:a3];
  [(_HKGraphSeriesSecondaryRenderContextOffScreenRegion *)v12 setEnd:a4];
  [(_HKGraphSeriesSecondaryRenderContextOffScreenRegion *)v12 setColor:v10];

  uint64_t v11 = 16;
  if (v6) {
    uint64_t v11 = 8;
  }
  [*(id *)((char *)&self->super.isa + v11) addObject:v12];
}

- (void)addOffScreenRegionAtLocation:(double)a3 color:(id)a4 aboveScreen:(BOOL)a5
{
}

- (void)drawInAxisRect:(CGRect)a3 backgroundColor:(id)a4 renderContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  CGContextSaveGState(a5);
  double v12 = HKUIOnePixel();
  CGContextSetLineWidth(a5, v12 + v12);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v55);
  double v14 = HKUIOnePixel();
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v56);
  double v42 = HKUIOnePixel();
  if (v11)
  {
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    CGFloat v16 = CGRectGetWidth(v58);
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGFloat v17 = CGRectGetMinY(v59);
    CGContextSetFillColorWithColor(a5, (CGColorRef)[v11 CGColor]);
    v60.origin.CGFloat y = 0.0;
    v60.origin.CGFloat x = MinX;
    v60.size.CGFloat width = v16;
    v60.size.CGFloat height = v17;
    CGContextFillRect(a5, v60);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v18 = self->_aboveScreenRegions;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    double v21 = MinY - (2.0 - v14);
    uint64_t v22 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        objc_msgSend(v24, "start", *(void *)&v42);
        double v26 = v25;
        [v24 end];
        double v28 = v27;
        id v29 = [v24 color];
        CGContextSetFillColorWithColor(a5, (CGColorRef)[v29 CGColor]);

        v61.size.CGFloat width = v28 - v26;
        v61.size.CGFloat height = 2.0;
        v61.origin.CGFloat x = v26;
        v61.origin.CGFloat y = v21;
        CGContextFillRect(a5, v61);
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v20);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v30 = self->_belowScreenRegions;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    double v33 = MaxY - v42;
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v30);
        }
        v36 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        objc_msgSend(v36, "start", *(void *)&v42);
        double v38 = v37;
        [v36 end];
        double v40 = v39;
        id v41 = [v36 color];
        CGContextSetFillColorWithColor(a5, (CGColorRef)[v41 CGColor]);

        v62.size.CGFloat width = v40 - v38;
        v62.size.CGFloat height = 2.0;
        v62.origin.CGFloat x = v38;
        v62.origin.CGFloat y = v33;
        CGContextFillRect(a5, v62);
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v32);
  }

  CGContextRestoreGState(a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_belowScreenRegions, 0);
  objc_storeStrong((id *)&self->_aboveScreenRegions, 0);
}

@end