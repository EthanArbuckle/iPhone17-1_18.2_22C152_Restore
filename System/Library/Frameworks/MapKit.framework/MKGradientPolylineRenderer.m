@interface MKGradientPolylineRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (MKGradientPolylineRenderer)initWithCoder:(id)a3;
- (NSArray)colors;
- (NSArray)locations;
- (void)_updateColorStops;
- (void)_updateVectorGeometry:(id)a3;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setColors:(NSArray *)colors atLocations:(NSArray *)locations;
@end

@implementation MKGradientPolylineRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_canProvideVectorGeometry
{
  v9.receiver = self;
  v9.super_class = (Class)MKGradientPolylineRenderer;
  unsigned int v3 = [(MKPolylineRenderer *)&v9 _canProvideVectorGeometry];
  if (v3)
  {
    v4 = [(MKGradientPolylineRenderer *)self colors];
    unint64_t v5 = [v4 count];

    if (v5 <= 0x10)
    {
      v6 = [(MKOverlayRenderer *)self overlay];
      char v7 = [v6 _isSelfIntersecting];

      LOBYTE(v3) = v7 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_updateVectorGeometry:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKGradientPolylineRenderer;
  [(MKPolylineRenderer *)&v15 _updateVectorGeometry:v4];
  if ([(NSArray *)self->_locations count] <= 0x10)
  {
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_locations, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_colors;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "CGColor", (void)v11));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }

    [v4 setColorStopColors:v5 locations:self->_locations];
  }
}

- (void)_updateColorStops
{
  v2 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  p_colors = (id *)&self->_colors;
  if ([(NSArray *)self->_colors count]) {
    BOOL v42 = 0;
  }
  else {
    BOOL v42 = [(NSArray *)v2->_externallySetColors count] != 0;
  }
  p_externallySetColors = (id *)&v2->_externallySetColors;
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (![(NSArray *)v2->_externallySetColors count])
  {
    id v16 = *p_colors;
    uint64_t v17 = (NSArray *)MEMORY[0x1E4F1CBF0];
    id *p_colors = (id)MEMORY[0x1E4F1CBF0];

    locations = v2->_locations;
    v2->_locations = v17;
LABEL_36:

    goto LABEL_39;
  }
  p_externallySetLocations = (id *)&v2->_externallySetLocations;
  if (![(NSArray *)v2->_externallySetLocations count])
  {
    objc_storeStrong(p_colors, *p_externallySetColors);
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*p_colors, "count"));
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    [(NSArray *)v36 addObject:&unk_1ED97E208];
    for (unint64_t i = 1; i < [*p_colors count]; ++i)
    {
      v38 = objc_msgSend(NSNumber, "numberWithDouble:", (double)i / (double)(unint64_t)(objc_msgSend(*p_colors, "count") - 1));
      [(NSArray *)v36 addObject:v38];
    }
    locations = v2->_locations;
    v2->_locations = v36;
    goto LABEL_36;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = *p_externallySetLocations;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v51;
    double v9 = -1.0;
    while (2)
    {
      uint64_t v10 = 0;
      double v11 = v9;
      do
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * v10) doubleValue];
        double v9 = v12;
        if (v12 < v11)
        {

          unint64_t v19 = [*p_externallySetColors count];
          if (v19 >= [*p_externallySetLocations count]) {
            v20 = p_externallySetLocations;
          }
          else {
            v20 = p_externallySetColors;
          }
          uint64_t v21 = objc_msgSend(*v20, "count", p_colors);
          v44 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
          if (v21)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              v23 = [NSNumber numberWithUnsignedInteger:j];
              [v44 addObject:v23];
            }
          }
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __47__MKGradientPolylineRenderer__updateColorStops__block_invoke;
          v49[3] = &unk_1E54B9678;
          v49[4] = p_isa;
          [v44 sortUsingComparator:v49];
          v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
          v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v26 = v44;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v46;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v30 = [*(id *)(*((void *)&v45 + 1) + 8 * k) unsignedIntegerValue];
                v31 = [*p_externallySetLocations objectAtIndexedSubscript:v30];
                [v24 addObject:v31];

                v32 = [*p_externallySetColors objectAtIndexedSubscript:v30];
                [v25 addObject:v32];
              }
              uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v54 count:16];
            }
            while (v27);
          }

          id v33 = p_isa[31];
          p_isa[31] = v24;
          id v34 = v24;

          v35 = *v41;
          *v41 = v25;

          goto LABEL_38;
        }
        ++v10;
        double v11 = v12;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unint64_t v13 = [*p_externallySetColors count];
  if (v13 >= [*p_externallySetLocations count])
  {
    objc_storeStrong(p_isa + 31, *p_externallySetLocations);
  }
  else
  {
    uint64_t v14 = objc_msgSend(*p_externallySetLocations, "subarrayWithRange:", 0, objc_msgSend(*p_externallySetColors, "count"));
    id v15 = p_isa[31];
    p_isa[31] = (id)v14;
  }
  objc_storeStrong(p_colors, *p_externallySetColors);
LABEL_38:
  v2 = (MKGradientPolylineRenderer *)p_isa;
LABEL_39:
  [(MKPolylineRenderer *)v2 _setNeedsVectorGeometryUpdate];
  v39 = [p_isa _renderer];
  v40 = v39;
  if (v42) {
    [v39 setNeedsDisplayForReason:1];
  }
  else {
    [v39 setNeedsDisplayForReason:2];
  }
}

uint64_t __47__MKGradientPolylineRenderer__updateColorStops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  uint64_t v7 = [v5 unsignedIntegerValue];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 256) objectAtIndexedSubscript:v6];
  double v9 = [*(id *)(*(void *)(a1 + 32) + 256) objectAtIndexedSubscript:v7];
  uint64_t v10 = [v8 compare:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKGradientPolylineRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKGradientPolylineRenderer;
  id v5 = [(MKPolylineRenderer *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    double v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MKGradientPolylineRendererColors"];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    double v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);

    unint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"MKGradientPolylineRendererLocations"];
    [(MKGradientPolylineRenderer *)v5 setColors:v9 atLocations:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_externallySetColors forKey:@"MKGradientPolylineRendererColors"];
  [v4 encodeObject:self->_externallySetLocations forKey:@"MKGradientPolylineRendererLocations"];
  v5.receiver = self;
  v5.super_class = (Class)MKGradientPolylineRenderer;
  [(MKPolylineRenderer *)&v5 encodeWithCoder:v4];
}

- (NSArray)locations
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = v2->_externallySetLocations;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)colors
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = v2->_externallySetColors;
  objc_sync_exit(v2);

  return v3;
}

- (void)setColors:(NSArray *)colors atLocations:(NSArray *)locations
{
  id v16 = colors;
  uint64_t v6 = locations;
  if ([(NSArray *)v6 count])
  {
    uint64_t v7 = [(NSArray *)v6 count];
    if (v7 != [(NSArray *)v16 count])
    {
      unint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = [NSString stringWithFormat:@"locations.count (%llu) must either == colors.count (%llu), or locations must be empty", -[NSArray count](v6, "count"), -[NSArray count](v16, "count")];
      id v15 = [v13 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];

      objc_exception_throw(v15);
    }
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  [(MKGradientPolylineRenderer *)v8 willChangeValueForKey:@"colors"];
  [(MKGradientPolylineRenderer *)v8 willChangeValueForKey:@"locations"];
  uint64_t v9 = [(NSArray *)v16 copy];
  externallySetColors = v8->_externallySetColors;
  v8->_externallySetColors = (NSArray *)v9;

  uint64_t v11 = [(NSArray *)v6 copy];
  externallySetLocations = v8->_externallySetLocations;
  v8->_externallySetLocations = (NSArray *)v11;

  [(MKGradientPolylineRenderer *)v8 _updateColorStops];
  [(MKGradientPolylineRenderer *)v8 didChangeValueForKey:@"colors"];
  [(MKGradientPolylineRenderer *)v8 didChangeValueForKey:@"locations"];
  objc_sync_exit(v8);
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = v10->_locations;
  v163 = v10->_colors;
  objc_sync_exit(v10);

  v164 = v11;
  if (![(NSArray *)v11 count])
  {
    v189.receiver = v10;
    v189.super_class = (Class)MKGradientPolylineRenderer;
    -[MKPolylineRenderer drawMapRect:zoomScale:inContext:](&v189, sel_drawMapRect_zoomScale_inContext_, a5, v9, v8, var0, var1, a4);
    goto LABEL_128;
  }
  id v12 = [(MKOverlayRenderer *)v10 overlay];
  v177 = (MKMapPoint *)[v12 points];

  unint64_t v13 = [(MKOverlayRenderer *)v10 overlay];
  unint64_t v14 = [v13 pointCount];

  if (v14 >= 2)
  {
    CGContextSaveGState(a5);
    [(MKOverlayRenderer *)v10 contentScaleFactor];
    double v16 = v15;
    [(MKOverlayPathRenderer *)v10 lineWidth];
    double v18 = v17;
    CGLineJoin join = [(MKOverlayPathRenderer *)v10 lineJoin];
    CGLineCap v19 = [(MKOverlayPathRenderer *)v10 lineCap];
    [(MKOverlayPathRenderer *)v10 miterLimit];
    if (v20 <= 0.0) {
      double v21 = 10.0;
    }
    else {
      double v21 = v20;
    }
    if (v18 <= 0.0)
    {
      uint64_t v22 = vcvtmd_s64_f64(log2(a4) + 0.5);
      if (v22 >= -21) {
        uint64_t v23 = (v22 & (v22 >> 63)) + 21;
      }
      else {
        uint64_t v23 = 0;
      }
      double v18 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v23];
    }
    v24 = [(MKOverlayPathRenderer *)v10 lineDashPattern];
    [(MKOverlayPathRenderer *)v10 lineDashPhase];
    CGFloat v26 = v25;
    [(MKOverlayRenderer *)v10 _originMapPoint];
    double v179 = v28;
    double v180 = v27;
    [(MKPolylineRenderer *)v10 strokeStart];
    double v30 = v29;
    [(MKPolylineRenderer *)v10 strokeEnd];
    double v32 = v31;
    double v159 = v16 * (v18 / a4);
    CGContextSetLineWidth(a5, v159);
    CGContextSetLineJoin(a5, join);
    double v156 = v16 * (v21 / a4);
    CGContextSetMiterLimit(a5, v156);
    CGContextSetBlendMode(a5, kCGBlendModeCopy);
    CGLineCap v158 = v19;
    if (v30 > 0.0 || v32 < 1.0)
    {
      id v33 = [(MKOverlayRenderer *)v10 overlay];
      [v33 _mapPointsLength];
      v193.double y = v179;
      v193.double x = v180;
      path = _createClipPath(v177, v14, v159, v19, join, v156, v193, a4, v30, v32, v34);

      if ([v24 count])
      {
        DashedClipPath = _createDashedClipPath(&v177->x, v14, v19, join, v24, v159, v156, v180, v179, a4, v26, v16);
        CGContextAddPath(a5, DashedClipPath);
        CGContextClip(a5);
        CGPathRelease(DashedClipPath);
      }
    }
    else
    {
      if ([v24 count])
      {
        path = _createDashedClipPath(&v177->x, v14, v19, join, v24, v159, v156, v180, v179, a4, v26, v16);
        CGContextAddPath(a5, path);
        goto LABEL_20;
      }
      v36 = [(MKOverlayRenderer *)v10 overlay];
      [v36 _mapPointsLength];
      v194.double y = v179;
      v194.double x = v180;
      path = _createClipPath(v177, v14, v159, v19, join, v156, v194, a4, v30, v32, v37);
    }
    CGContextAddPath(a5, path);
LABEL_20:
    CGContextClip(a5);
    CGContextSaveGState(a5);
    space = CGColorSpaceCreateDeviceRGB();
    double v178 = v32;
    double v172 = v30;
    v146 = v10;
    v147 = v24;
    unint64_t v175 = v14 - 1;
    double x = v177->x;
    double v39 = v177->y;
    p_double y = &v177[1].y;
    uint64_t v41 = 1;
    double v42 = 0.0;
    do
    {
      double v43 = *(p_y - 1);
      double v44 = *p_y;
      ++v41;
      double v42 = v42 + sqrt((v43 - x) * (v43 - x) + 0.0 + (*p_y - v39) * (*p_y - v39));
      p_y += 2;
      double v39 = v44;
      double x = v43;
    }
    while (v14 != v41);
    unint64_t v165 = v14;
    int v187 = 0;
    long long v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    char v157 = 0;
    double v49 = *MEMORY[0x1E4F1DAD8];
    double v48 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v155 = v159 * 0.5;
    uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
    double v51 = 0.0;
    CGContextRef c = a5;
    while (1)
    {
      double v52 = v51 / v42;
      if (v51 / v42 >= v178)
      {
LABEL_124:
        CGContextRestoreGState(a5);
        uint64_t v144 = [(MKOverlayPathRenderer *)v146 strokeColor];
        v145 = (void *)v144;
        if ((_BYTE)v187 && v144)
        {
          CGContextSaveGState(a5);
          CGContextSetBlendMode(a5, kCGBlendModeDestinationOver);
          CGContextSetFillColorWithColor(a5, (CGColorRef)[v145 CGColor]);
          CGContextAddPath(a5, path);
          CGContextFillPath(a5);
          CGContextRestoreGState(a5);
        }
        CGContextRestoreGState(a5);
        CGGradientRelease(v45);
        CGPathRelease(path);
        CGColorSpaceRelease(space);

        goto LABEL_128;
      }
      long long v53 = &v177[v47];
      double v54 = v53->x;
      v191.double x = v180;
      double v183 = v53->x - v180;
      v191.double y = v179;
      double v170 = v53->y;
      double v182 = v170 - v179;
      double v188 = 0.0;
      double v55 = v51;
      unint64_t v186 = _nextSimplifiedPointIndex(v177, v165, v47, a4, v191, &v188);
      double v173 = v55;
      double v51 = v55 + v188;
      double v56 = (v55 + v188) / v42;
      if (v178 >= v52 && v172 <= v56) {
        break;
      }
LABEL_123:
      double v48 = v170 - v179;
      double v49 = v183;
      uint64_t v47 = v186;
      if (v186 >= v175) {
        goto LABEL_124;
      }
    }
    double v58 = 0.0;
    if (v52 < v172 && v56 > v172) {
      double v58 = (v172 - v52) / (v56 - v52);
    }
    double v162 = v54;
    double v60 = 1.0;
    if (v52 < v178 && v56 > v178) {
      double v60 = (v178 - v52) / (v56 - v52);
    }
    p_double x = &v177[v186].x;
    double v63 = p_x[1];
    double v64 = *p_x - v180;
    double v65 = v63 - v179;
    if (v58 > 0.0 || (double v166 = v63 - v179, v167 = *p_x - v180, v184 = v183, y = v170 - v179, v60 < 1.0))
    {
      double v66 = v65 - v182;
      double v67 = v183 + (v64 - v183) * v58;
      double v68 = v182 + (v65 - v182) * v58;
      if (v58 <= 0.0) {
        double v67 = v183;
      }
      CGFloat v184 = v67;
      if (v58 <= 0.0) {
        double v69 = v170 - v179;
      }
      else {
        double v69 = v68;
      }
      double y = v69;
      if (v60 >= 1.0)
      {
        double v166 = v63 - v179;
        double v167 = *p_x - v180;
      }
      else
      {
        double v166 = v63 - v179 - v66 * (1.0 - v60);
        double v167 = v64 - (v64 - v183) * (1.0 - v60);
      }
      double v65 = v63 - v179;
    }
    double v160 = p_x[1];
    double v161 = *p_x;
    if (join == kCGLineJoinRound || !v47 && v175 <= v186)
    {
      if (v175 == v186 || v47 == 0) {
        int v71 = v158;
      }
      else {
        int v71 = 1;
      }
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v184, y);
      CGPathAddLineToPoint(Mutable, 0, v167, v166);
      if (fabs(v58) >= 0.00000011920929) {
        CGLineCap v73 = kCGLineCapButt;
      }
      else {
        CGLineCap v73 = v71;
      }
      if (fabs(v60 + -1.0) >= 0.00000011920929) {
        CGLineCap v74 = kCGLineCapButt;
      }
      else {
        CGLineCap v74 = v71;
      }
      CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, v73, v74, join, v159, v156);
      CGPathRelease(Mutable);
LABEL_96:
      CGContextSaveGState(a5);
      if (join != kCGLineJoinRound) {
        CGContextSetShouldAntialias(a5, 0);
      }
      CGContextAddPath(a5, CopyByStrokingPath);
      v91 = v164;
      uint64_t v92 = [(NSArray *)v91 count];
      uint64_t v93 = 0;
      unint64_t v94 = 0;
      unint64_t v95 = 0;
      while (v95 < [(NSArray *)v91 count])
      {
        v96 = [(NSArray *)v91 objectAtIndexedSubscript:v95];
        [v96 floatValue];
        float v98 = v97;

        double v99 = v98;
        if (v52 >= v99)
        {
          uint64_t v92 = v93 + [(NSArray *)v91 count];
          unint64_t v94 = v95;
        }
        ++v95;
        --v93;
        if (v56 < v99)
        {
          uint64_t v92 = v95 - v94;
          break;
        }
      }

      uint64_t ya = v92;
      if (v92 == 1)
      {
        id v100 = [(NSArray *)v163 objectAtIndexedSubscript:v94];
        v101 = c;
        CGContextSetFillColorWithColor(c, (CGColorRef)[v100 CGColor]);
        CGContextFillPath(c);
      }
      else
      {
        CGContextClip(c);
        if (!v45 || v94 != v50 || v92 != v46)
        {
          CGGradientRelease(v45);
          v102 = v91;
          v185 = v163;
          v103 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v92];
          v104 = (CGFloat *)malloc_type_malloc(8 * v92, 0x100004000313F17uLL);
          unint64_t v105 = v92 + v94 - 1;
          v106 = [(NSArray *)v102 objectAtIndexedSubscript:v105];
          [v106 cgFloatValue];
          double v108 = v107;
          v109 = [(NSArray *)v102 objectAtIndexedSubscript:v94];
          [v109 cgFloatValue];
          double v111 = v110;
          v112 = v104;

          if (v94 <= v105)
          {
            BOOL v113 = 0;
            double v114 = v108 - v111;
            unint64_t v115 = v94;
            do
            {
              v116 = [(NSArray *)v102 objectAtIndexedSubscript:v115];
              [v116 cgFloatValue];
              double v118 = v117;
              v119 = [(NSArray *)v102 objectAtIndexedSubscript:v94];
              [v119 cgFloatValue];
              v112[[v103 count]] = (v118 - v120) / v114;

              id v121 = [(NSArray *)v185 objectAtIndexedSubscript:v115];
              v122 = (CGColor *)[v121 CGColor];

              [v103 addObject:v122];
              if ((_BYTE)v187 == 0 && !v113) {
                BOOL v113 = CGColorGetAlpha(v122) < 1.0;
              }
              ++v115;
            }
            while (v115 <= v105);
          }
          else
          {
            BOOL v113 = 0;
          }
          long long v45 = CGGradientCreateWithColors(space, (CFArrayRef)v103, v112);
          free(v112);
          int v123 = v187;
          if (!(_BYTE)v187) {
            int v123 = v113;
          }
          int v187 = v123;

          uint64_t v46 = ya;
          uint64_t v50 = v94;
        }
        double v124 = v188;
        v125 = v91;
        v126 = [(NSArray *)v125 objectAtIndexedSubscript:v94];
        [v126 cgFloatValue];
        v101 = c;
        double v128 = v127;

        v129 = [(NSArray *)v125 objectAtIndexedSubscript:ya + v94 - 1];
        [v129 cgFloatValue];
        double v130 = v124 * (v52 - v128) / (v56 - v52);
        double v132 = v124 * (v131 - v56) / (v56 - v52);

        double v133 = 1.0 / sqrt((v161 - v162) * (v161 - v162) + 0.0 + (v160 - v170) * (v160 - v170));
        double v134 = (v161 - v162) * v133;
        double v135 = (v160 - v170) * v133;
        double v136 = v161 + v134 * v132;
        double v137 = v160 + v135 * v132;
        double v138 = v170 - v135 * v130;
        double v139 = v162 - v134 * v130 - v180;
        double v140 = v138 - v179;
        double v141 = v136 - v180;
        double v142 = v137 - v179;

        if (((join == kCGLineJoinRound) & v157) != 0) {
          CGGradientDrawingOptions v143 = 2;
        }
        else {
          CGGradientDrawingOptions v143 = 3;
        }
        v190.double x = v139;
        v190.double y = v140;
        v195.double x = v141;
        v195.double y = v142;
        CGContextDrawLinearGradient(c, v45, v190, v195, v143);
        char v157 = 1;
      }
      CGContextRestoreGState(v101);
      CGPathRelease(CopyByStrokingPath);
      double v51 = v173 + v188;
      a5 = c;
      goto LABEL_123;
    }
    BOOL v76 = fabs(v58) < 0.00000011920929 && v47 != 0;
    BOOL v78 = fabs(v60 + -1.0) < 0.00000011920929 && v175 > v186;
    double v153 = v65;
    if (v78)
    {
      v192.double x = v180;
      v192.double y = v179;
      v79 = &v177[_nextSimplifiedPointIndex(v177, v165, v186, a4, v192, 0)].x;
      double v149 = *v79 - v180;
      double v80 = v79[1] - v179;
    }
    else
    {
      double v149 = *MEMORY[0x1E4F1DAD8];
      double v80 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    double v148 = v80;
    CopyByStrokingPath = CGPathCreateMutable();
    double v81 = 1.0 / sqrt((v64 - v183) * (v64 - v183) + 0.0 + (v153 - v182) * (v153 - v182));
    double v82 = (v64 - v183) * v81;
    double v83 = (v153 - v182) * v81;
    double v151 = -v83;
    long double v154 = v83;
    if (v76)
    {
      double v84 = 1.0;
      double v85 = 1.0 / sqrt((v183 - v49) * (v183 - v49) + 0.0 + (v182 - v48) * (v182 - v48));
      long double v86 = (v183 - v49) * v85;
      double v87 = v82;
      _addMiterJoin(CopyByStrokingPath, 1, v184, y, v86, (v182 - v48) * v85, v82, v83, v155);
      goto LABEL_88;
    }
    double v84 = 1.0;
    if ((v158 - 1) >= 2)
    {
      double v87 = (v64 - v183) * v81;
      if (v158) {
        goto LABEL_88;
      }
      double v88 = v184;
      double v89 = y;
      CGPathMoveToPoint(CopyByStrokingPath, 0, v184 + v83 * v155, y - v82 * v155);
    }
    else
    {
      double v88 = v184 - v82 * v159;
      double v89 = y + v151 * v159;
      double v87 = (v64 - v183) * v81;
      CGPathMoveToPoint(CopyByStrokingPath, 0, v88 + v83 * v155, v89 - v82 * v155);
    }
    CGPathAddLineToPoint(CopyByStrokingPath, 0, v88 + v151 * v155, v89 + v87 * v155);
LABEL_88:
    if (v78)
    {
      double v90 = v84 / sqrt((v149 - v64) * (v149 - v64) + 0.0 + (v148 - v153) * (v148 - v153));
      _addMiterJoin(CopyByStrokingPath, 0, v167, v166, v87, v154, (v149 - v64) * v90, (v148 - v153) * v90, v155);
LABEL_95:
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v184 + v154 * v155, y - v87 * v155);
      CGPathCloseSubpath(CopyByStrokingPath);
      goto LABEL_96;
    }
    if ((v158 - 1) >= 2)
    {
      if (v158) {
        goto LABEL_95;
      }
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v151 * v155, v166 + v87 * v155);
    }
    else
    {
      double v167 = v167 + v87 * v159;
      double v166 = v166 + v154 * v159;
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v151 * v155, v166 + v87 * v155);
    }
    CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v154 * v155, v166 - v87 * v155);
    goto LABEL_95;
  }
LABEL_128:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallySetLocations, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_externallySetColors, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end