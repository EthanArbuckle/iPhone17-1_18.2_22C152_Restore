@interface EQKitOverlay
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitOverlay)initWithLayout:(id)a3 scale:(double)a4;
- (NSMutableArray)overlayBoxes;
- (double)scale;
- (id)pLineBoxFrom:(CGPoint)a3 to:(CGPoint)a4 withWithRGBA:(double *)a5 scale:(double)a6;
- (id)pOpticalAlignOverlayBoxesForBox:(id)a3 topLevelBox:(id)a4 minDistance:(double)a5;
- (void)addErasableBounds;
- (void)addOpticalAlignForEdge:(unsigned int)a3 config:(id)a4;
- (void)addOpticalAlignWithMinimumDistance:(double)a3;
- (void)addOverlayBox:(id)a3 offset:(CGPoint)a4;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitOverlay

- (EQKitOverlay)initWithLayout:(id)a3 scale:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)EQKitOverlay;
  v6 = [(EQKitOverlay *)&v12 init];
  if (v6)
  {
    v6->_overlayBoxes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v6->_box = (EQKitBox *)[a3 box];
    [a3 erasableBounds];
    v6->_erasableBounds.origin.y = v7;
    v6->_erasableBounds.size.width = v8;
    v6->_erasableBounds.size.height = v9;
    v6->_scale = a4;
    v6->_erasableBounds.origin.x = v10;
  }
  return v6;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  overlayBoxes = self->_overlayBoxes;
  uint64_t v8 = [(NSMutableArray *)overlayBoxes countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(overlayBoxes);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "renderIntoContext:offset:", a3, x, y);
      }
      uint64_t v9 = [(NSMutableArray *)overlayBoxes countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addOverlayBox:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [EQKitPaddedBox alloc];
  [a3 height];
  double v10 = v9;
  [a3 width];
  double v12 = v11;
  [a3 depth];
  uint64_t v14 = [(EQKitPaddedBox *)v8 initWithBox:a3 height:v10 width:v12 depth:v13 lspace:x voffset:y];
  overlayBoxes = self->_overlayBoxes;

  [(NSMutableArray *)overlayBoxes addObject:v14];
}

- (void)addErasableBounds
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  Mutable = CGPathCreateMutable();
  CGPathAddRect(Mutable, 0, self->_erasableBounds);
  long long v8 = xmmword_2558BE1A0;
  long long v9 = unk_2558BE1B0;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
  v5 = CGColorCreate(v4, (const CGFloat *)&v8);
  CGColorSpaceRelease(v4);
  v6 = [EQKitPathBox alloc];
  uint64_t v7 = -[EQKitPathBox initWithCGPath:height:cgColor:drawingMode:lineWidth:](v6, "initWithCGPath:height:cgColor:drawingMode:lineWidth:", Mutable, v5, 2, 0.0, 1.0 / self->_scale, v8, v9);
  -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", v7, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  CGColorRelease(v5);
  CGPathRelease(Mutable);
}

- (void)addOpticalAlignWithMinimumDistance:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = -[EQKitOverlay pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:](self, "pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:", self->_box, self->_box, a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    long long v8 = (double *)MEMORY[0x263F00148];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), *v8, v8[1]);
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)pLineBoxFrom:(CGPoint)a3 to:(CGPoint)a4 withWithRGBA:(double *)a5 scale:(double)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  id result = CGPathCreateMutable();
  if (result)
  {
    long long v13 = (CGPath *)result;
    CGPathMoveToPoint((CGMutablePathRef)result, 0, v11, v10);
    CGPathAddLineToPoint(v13, 0, x, y);
    uint64_t v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
    uint64_t v15 = CGColorCreate(v14, a5);
    CGColorSpaceRelease(v14);
    v16 = [[EQKitPathBox alloc] initWithCGPath:v13 height:v15 cgColor:2 drawingMode:0.0 lineWidth:1.0 / a6];
    CGColorRelease(v15);
    CGPathRelease(v13);
    return v16;
  }
  return result;
}

- (id)pOpticalAlignOverlayBoxesForBox:(id)a3 topLevelBox:(id)a4 minDistance:(double)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  EQKitPath::QuantizationConfig::QuantizationConfig((EQKitPath::QuantizationConfig *)v48);
  uint64_t v9 = objc_opt_class();
  CGFloat v10 = (void *)EQKitUtilDynamicCast(v9, (uint64_t)a3);
  CGFloat v11 = (void *)[MEMORY[0x263EFF980] array];
  memset(v46, 0, sizeof(v46));
  int v47 = 0;
  memset(v44, 0, sizeof(v44));
  int v45 = 2;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v12 = (void *)[v10 childBoxes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v13)
  {
    char v14 = 0;
    uint64_t v15 = *(void *)v41;
    v16 = (double *)MEMORY[0x263F00148];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v37 = 0u;
        if (a4) {
          [a4 transformFromDescendant:v18];
        }
        if (v14)
        {
          std::vector<EQKit::OpticalKern::Spec::Entry>::resize(v46, 0);
          if (!objc_msgSend(v18, "appendOpticalAlignToSpec:offset:", v46, *(double *)&v39 + v16[1] * *(double *)&v38 + *(double *)&v37 * *v16, *((double *)&v39 + 1) + v16[1] * *((double *)&v38 + 1) + *((double *)&v37 + 1) * *v16))
          {
            char v14 = 1;
            goto LABEL_24;
          }
          EQKit::OpticalKern::Edge::Composite::Composite(v35, v46, v48, 0);
          EQKit::OpticalKern::Edge::Composite::Composite(&v33, v44, v48, 0);
          long long v31 = *(_OWORD *)v16;
          long long v32 = v31;
          __p = 0;
          v29 = 0;
          uint64_t v30 = 0;
          uint64_t v27 = 0;
          int isDistanceSmallerThanThreshold = EQKit::OpticalKern::Edge::Composite::isDistanceSmallerThanThreshold((int *)&v33, (uint64_t)v35, (double *)&v27, (double *)&v31, &__p, a5);
          NSLog(&cfstr_MoveOffsetF.isa, v27);
          uint64_t v20 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)v35, self->_scale);
          if (v20) {
            [v11 addObject:v20];
          }
          uint64_t v21 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)&v33, self->_scale);
          if (v21) {
            [v11 addObject:v21];
          }
          if (isDistanceSmallerThanThreshold)
          {
            v50[0] = xmmword_2558BE1C0;
            v50[1] = unk_2558BE1D0;
            v49[0] = xmmword_2558BE1E0;
            v49[1] = unk_2558BE1F0;
            v23 = (double *)__p;
            v22 = v29;
            while (v23 != v22)
            {
              objc_msgSend(v11, "addObject:", -[EQKitOverlay pLineBoxFrom:to:withWithRGBA:scale:](self, "pLineBoxFrom:to:withWithRGBA:scale:", v50, *v23, v23[1], v23[2], v23[3], self->_scale));
              v22 = v29;
              v23 += 4;
            }
            objc_msgSend(v11, "addObject:", -[EQKitOverlay pLineBoxFrom:to:withWithRGBA:scale:](self, "pLineBoxFrom:to:withWithRGBA:scale:", v49, v31, *(double *)&v32, *((double *)&v32 + 1), self->_scale * 0.5));
          }
          if (__p)
          {
            v29 = (double *)__p;
            operator delete(__p);
          }
          *(void *)&long long v31 = &v34;
          std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
          v33 = (void **)&v36;
          std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100](&v33);
        }
        std::vector<EQKit::OpticalKern::Spec::Entry>::resize(v44, 0);
        char v14 = objc_msgSend(v18, "appendOpticalAlignToSpec:offset:", v44, *(double *)&v39 + v16[1] * *(double *)&v38 + *(double *)&v37 * *v16, *((double *)&v39 + 1) + v16[1] * *((double *)&v38 + 1) + *((double *)&v37 + 1) * *v16);
LABEL_24:
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = EQKitUtilDynamicCast(v24, (uint64_t)v18);
        if (v25) {
          objc_msgSend(v11, "addObjectsFromArray:", -[EQKitOverlay pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:](self, "pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:", v25, a4, a5));
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v13);
  }
  *(void *)&long long v37 = v44;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  *(void *)&long long v37 = v46;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  return v11;
}

- (void)addOpticalAlignForEdge:(unsigned int)a3 config:(id)a4
{
  memset(v27, 0, sizeof(v27));
  unsigned int v28 = a3;
  uint64_t v6 = (double *)MEMORY[0x263F00148];
  -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", v27, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  if ([a4 length])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F08B08] scannerWithString:a4];
    __p = 0;
    uint64_t v25 = 0;
    v26 = 0;
    while (([v7 isAtEnd] & 1) == 0)
    {
      uint64_t v22 = 0;
      char v8 = [v7 scanInteger:&v22];
      uint64_t v9 = v22;
      char v10 = v22 >= 0 ? v8 : 0;
      if ((v10 & 1) == 0) {
        break;
      }
      CGFloat v11 = v25;
      if (v25 >= v26)
      {
        uint64_t v13 = (char *)__p;
        uint64_t v14 = (v25 - (unsigned char *)__p) >> 3;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v26 - (unsigned char *)__p;
        if ((v26 - (unsigned char *)__p) >> 2 > v15) {
          unint64_t v15 = v16 >> 2;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v26, v17);
          uint64_t v13 = (char *)__p;
          CGFloat v11 = v25;
        }
        else
        {
          v18 = 0;
        }
        v19 = (uint64_t *)&v18[8 * v14];
        uint64_t *v19 = v9;
        long long v12 = (char *)(v19 + 1);
        while (v11 != v13)
        {
          uint64_t v20 = *((void *)v11 - 1);
          v11 -= 8;
          *--v19 = v20;
        }
        __p = v19;
        uint64_t v25 = v12;
        v26 = &v18[8 * v17];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *(void *)uint64_t v25 = v22;
        long long v12 = v11 + 8;
      }
      uint64_t v25 = v12;
    }
    if ([v7 isAtEnd]) {
      operator new();
    }
    if (__p)
    {
      uint64_t v25 = (char *)__p;
      operator delete(__p);
    }
  }
  EQKitPath::QuantizationConfig::QuantizationConfig((EQKitPath::QuantizationConfig *)&__p);
  EQKitPath::QuantizationConfig::setThresholdCurveControlPointDistance((uint64_t)&__p, -1.0);
  EQKit::OpticalKern::Edge::Composite::Composite(&v22, v27, &__p, 0);
  uint64_t v21 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)&v22, self->_scale);
  if (v21) {
    -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", v21, *v6, v6[1]);
  }
  v29 = (void **)&v23;
  std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100](&v29);
  __p = v27;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
}

- (NSMutableArray)overlayBoxes
{
  return self->_overlayBoxes;
}

- (EQKitBox)box
{
  return self->_box;
}

- (CGRect)erasableBounds
{
  double x = self->_erasableBounds.origin.x;
  double y = self->_erasableBounds.origin.y;
  double width = self->_erasableBounds.size.width;
  double height = self->_erasableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end