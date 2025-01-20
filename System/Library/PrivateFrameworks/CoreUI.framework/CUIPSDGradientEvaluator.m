@interface CUIPSDGradientEvaluator
+ (void)initialize;
- (BOOL)hasEdgePixel;
- (BOOL)isDithered;
- (CUIPSDGradientEvaluator)initWithCoder:(id)a3;
- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillCoefficient:(double)a8;
- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillColor:(_psdGradientColor)a8 dither:(BOOL)a9;
- (_psdGradientColor)_smoothedGradientColorAtLocation:(double)a3;
- (_psdGradientColor)fillColor;
- (double)_smoothedInterpolationOfLocation:(double)a3 betweenLower:(double)a4 upper:(double)a5 scaledMidpoint:(double)a6;
- (double)fillCoefficient;
- (double)smoothingCoefficient;
- (id)_cleanedUpMidpointLocationsFromLocations:(id)a3;
- (id)colorMidpointLocations;
- (id)colorStops;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)opacityMidpointLocations;
- (id)opacityStops;
- (int)blendMode;
- (void)_createOrderedStops:(id *)a3 midpoints:(id *)a4 fromStops:(id)a5 midpoints:(id)a6 edgePixel:(int64_t *)a7;
- (void)customizeForDistance:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendMode:(int)a3;
- (void)setColorStops:(id)a3 midpoints:(id)a4;
- (void)setFillCoefficient:(double)a3;
- (void)setOpacityStops:(id)a3 midpoints:(id)a4;
- (void)setSmoothingCoefficient:(double)a3;
@end

@implementation CUIPSDGradientEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:2];
  }
}

- (id)_cleanedUpMidpointLocationsFromLocations:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) doubleValue];
        if (v9 >= 1.0 || v9 <= 0.0) {
          double v9 = 0.5;
        }
        objc_msgSend(v4, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      }
      id v6 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
  id v11 = [v4 reverseObjectEnumerator];
  v12 = (char *)[v4 count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      v16 = 0;
      v17 = (char *)(v12 - v14);
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) doubleValue];
        if (v18 != 0.5)
        {
          v17 = (char *)(v12 - (unsigned char *)v16);
          return objc_msgSend(v4, "subarrayWithRange:", 0, v17);
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      v12 = v17;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    v17 = v12;
  }
  return objc_msgSend(v4, "subarrayWithRange:", 0, v17);
}

- (void)_createOrderedStops:(id *)a3 midpoints:(id *)a4 fromStops:(id)a5 midpoints:(id)a6 edgePixel:(int64_t *)a7
{
  id v8 = [a6 count];
  v66 = (char *)[a5 count];
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v66];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v10 = [a5 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v10)
  {
    id v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(a5);
        }
        uint64_t v15 = *(void *)(*((void *)&v76 + 1) + 8 * i);
        v16 = [_CUIPSDStopAndMidpointPair alloc];
        if (v12 >= (unint64_t)v8) {
          id v17 = 0;
        }
        else {
          id v17 = [a6 objectAtIndex:v12++];
        }
        double v18 = [(_CUIPSDStopAndMidpointPair *)v16 initWithStop:v15 midpoint:v17];
        [v9 addObject:v18];
      }
      id v11 = [a5 countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v11);
  }
  v19 = v9;
  [v9 sortUsingSelector:sel_compare_];
  if (v66)
  {
    id v20 = objc_msgSend(objc_msgSend(v9, "objectAtIndex:", 0), "stop");
    [v20 location];
    if (v21 != 0.0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = [CUIPSDGradientColorStop alloc];
        [v20 gradientColor];
        long long v27 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v22, "initWithLocation:gradientColor:", 0.0, v23, v24, v25, v26);
      }
      else
      {
        v28 = [CUIPSDGradientOpacityStop alloc];
        [v20 opacity];
        long long v27 = [(CUIPSDGradientOpacityStop *)v28 initWithLocation:0.0 opacity:v29];
      }
      v30 = v27;
      v31 = [[_CUIPSDStopAndMidpointPair alloc] initWithStop:v27 midpoint:0];

      [v9 insertObject:v31 atIndex:0];
    }
    id v32 = objc_msgSend(objc_msgSend(v9, "lastObject"), "stop");
    [v32 location];
    if (v33 != 1.0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [CUIPSDGradientColorStop alloc];
        if ([v32 isDoubleStop]) {
          [v32 leadOutColor];
        }
        else {
          [v32 gradientColor];
        }
        v41 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v34, "initWithLocation:gradientColor:", 1.0, v35, v36, v37, v38);
      }
      else
      {
        v39 = [CUIPSDGradientOpacityStop alloc];
        if ([v32 isDoubleStop]) {
          [v32 leadOutOpacity];
        }
        else {
          [v32 opacity];
        }
        v41 = [(CUIPSDGradientOpacityStop *)v39 initWithLocation:1.0 opacity:v40];
      }
      v42 = v41;
      v43 = [[_CUIPSDStopAndMidpointPair alloc] initWithStop:v41 midpoint:0];

      [v19 addObject:v43];
    }
  }
  id v44 = [v19 count];
  id v45 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v44];
  id v46 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v44];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v47 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v73;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(void *)v73 != v49) {
          objc_enumerationMutation(v19);
        }
        v51 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
        objc_msgSend(v45, "addObject:", objc_msgSend(v51, "stop"));
        [v51 midpoint];
        objc_msgSend(v46, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      }
      id v48 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v48);
  }
  if ((unint64_t)v66 < 3)
  {
    unsigned int v58 = objc_msgSend(objc_msgSend(v45, "firstObject"), "isDoubleStop");
    int64_t v56 = v58;
    unsigned int v59 = objc_msgSend(objc_msgSend(v45, "lastObject"), "isDoubleStop");
    uint64_t v60 = 2;
    if (v58) {
      uint64_t v60 = 3;
    }
    if (v59) {
      int64_t v56 = v60;
    }
  }
  else
  {
    id v52 = [v45 objectAtIndex:1];
    if ((objc_msgSend(objc_msgSend(v45, "firstObject"), "isDoubleStop") & 1) != 0
      || [v52 isDoubleStop]
      && ([v52 location],
          double v54 = v53,
          objc_msgSend(objc_msgSend(v45, "objectAtIndex:", 0), "location"),
          v54 - v55 < 0.02))
    {
      int64_t v56 = 1;
      uint64_t v57 = 3;
    }
    else
    {
      int64_t v56 = 0;
      uint64_t v57 = 2;
    }
    id v61 = [v45 objectAtIndex:v66 - 2];
    if ((objc_msgSend(objc_msgSend(v45, "lastObject"), "isDoubleStop") & 1) != 0
      || [v61 isDoubleStop]
      && (objc_msgSend(objc_msgSend(v45, "lastObject"), "location"),
          double v63 = v62,
          [v61 location],
          v63 - v64 < 0.02))
    {
      int64_t v56 = v57;
    }
  }
  id v65 = [(CUIPSDGradientEvaluator *)self _cleanedUpMidpointLocationsFromLocations:v46];

  *a7 = v56;
  *a3 = v45;
  *a4 = v65;
}

- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillCoefficient:(double)a8
{
  return -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](self, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", a3, a4, a5, a6, 0, a7, 1.0, 1.0, 1.0, a8);
}

- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillColor:(_psdGradientColor)a8 dither:(BOOL)a9
{
  BOOL v9 = a9;
  double alpha = a8.alpha;
  double blue = a8.blue;
  double green = a8.green;
  double red = a8.red;
  v33.receiver = self;
  v33.super_class = (Class)CUIPSDGradientEvaluator;
  v16 = [(CUIPSDGradientEvaluator *)&v33 init];
  if (v16)
  {
    if (![a3 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v16 file:@"CUIPSDGradientEvaluator.m" lineNumber:714 description:@"CUIPSDGradientEvaluator requires at least one color stop for initialization"];
    }
    v17.f64[0] = a7;
    v17.f64[1] = red;
    int8x16_t v18 = (int8x16_t)vcltzq_f64(v17);
    double v19 = 0.0;
    if (alpha >= 0.0) {
      double v19 = alpha;
    }
    *((double *)v16 + 9) = fmin(v19, 1.0);
    __asm { FMOV            V1.2D, #1.0 }
    *(float64x2_t *)(v16 + 40) = vminnmq_f64((float64x2_t)vbicq_s8((int8x16_t)v17, v18), _Q1);
    *(double *)v25.i64 = green;
    *(double *)&v25.i64[1] = blue;
    *(float64x2_t *)(v16 + 56) = vminnmq_f64((float64x2_t)vbicq_s8(v25, (int8x16_t)vcltzq_f64((float64x2_t)v25)), _Q1);
    uint64_t v32 = 0;
    [v16 _createOrderedStops:v16 + 8 midpoints:v16 + 16 fromStops:a3 midpoints:a4 edgePixel:&v32];
    v16[88] = v16[88] & 0xFC | v32 & 3;
    [v16 _createOrderedStops:v16 + 24 midpoints:v16 + 32 fromStops:a5 midpoints:a6 edgePixel:&v32];
    if (v9) {
      char v26 = 16;
    }
    else {
      char v26 = 0;
    }
    v16[88] = v16[88] & 0xE3 | v26 | (4 * (v32 & 3));
  }
  return (CUIPSDGradientEvaluator *)v16;
}

- (CUIPSDGradientEvaluator)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CUIPSDGradientEvaluator;
  id v4 = [(CUIPSDGradientEvaluator *)&v22 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      uint64_t v5 = (uint64_t)[a3 decodeIntegerForKey:@"CUIPSDGradientEvaluatorVersion"];
      v4->colorStops = (NSArray *)[a3 decodeObjectForKey:@"CUIPSDGradientEvaluatorColorStops"];
      v4->colorMidpointLocations = (NSArray *)[a3 decodeObjectForKey:@"CUIPSDGradientEvaluatorColorMidpointLocations"];
      v4->opacityStops = (NSArray *)[a3 decodeObjectForKey:@"CUIPSDGradientEvaluatorOpacityStops"];
      v4->opacityMidpointLocations = (NSArray *)[a3 decodeObjectForKey:@"CUIPSDGradientEvaluatorOpacityMidpointLocations"];
      [a3 decodeDoubleForKey:@"CUIPSDGradientEvaluatorSmoothingCoefficient"];
      v4->smoothingCoefficient = v6;
      [a3 decodeDoubleForKey:@"CUIPSDGradientEvaluatorFillCoefficient"];
      v4->fillColor.double alpha = v7;
      if (v5 <= 1)
      {
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v4->fillColor.double red = _Q0;
        double v10 = 1.0;
      }
      else
      {
        [a3 decodeDoubleForKey:@"CUIPSDGradientEvaluatorFillColorRed"];
        v4->fillColor.double red = v8;
        [a3 decodeDoubleForKey:@"CUIPSDGradientEvaluatorFillColorGreen"];
        v4->fillColor.double green = v9;
        [a3 decodeDoubleForKey:@"CUIPSDGradientEvaluatorFillColorBlue"];
      }
      v4->fillColor.double blue = v10;
      LOBYTE(v4[1].super.isa) = (uint64_t)v4[1].super.isa & 0xFC | [a3 decodeIntegerForKey:@"CUIPSDGradientEvaluatorColorEdgePixel"] & 3;
      LOBYTE(v4[1].super.isa) = (4
                               * ([a3 decodeIntegerForKey:@"CUIPSDGradientEvaluatorOpacityEdgePixel"] & 3)) | (uint64_t)v4[1].super.isa & 0xF3;
    }
    else
    {
      uint64_t v11 = (uint64_t)[a3 versionForClassName:@"CUIPSDGradientEvaluator"];
      double v21 = 0.0;
      int v20 = 0;
      int v19 = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@@@@ddii", &v4->colorStops, &v4->colorMidpointLocations, &v4->opacityStops, &v4->opacityMidpointLocations, &v21, &v4->fillColor.alpha, &v20, &v19);
      v4->smoothingCoefficient = v21;
      LOBYTE(v4[1].super.isa) = (uint64_t)v4[1].super.isa & 0xF0 | v20 & 3 | (4 * (v19 & 3));
      if (v11 < 2)
      {
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v4->fillColor.double red = _Q0;
        v4->fillColor.double blue = 1.0;
      }
      else
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "ddd", &v4->fillColor, &v4->fillColor.green, &v4->fillColor.blue);
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientEvaluator version](CUIPSDGradientEvaluator, "version"), @"CUIPSDGradientEvaluatorVersion");
    [a3 encodeObject:self->colorStops forKey:@"CUIPSDGradientEvaluatorColorStops"];
    [a3 encodeObject:self->colorMidpointLocations forKey:@"CUIPSDGradientEvaluatorColorMidpointLocations"];
    [a3 encodeObject:self->opacityStops forKey:@"CUIPSDGradientEvaluatorOpacityStops"];
    [a3 encodeObject:self->opacityMidpointLocations forKey:@"CUIPSDGradientEvaluatorOpacityMidpointLocations"];
    [a3 encodeDouble:@"CUIPSDGradientEvaluatorSmoothingCoefficient" forKey:self->smoothingCoefficient];
    [a3 encodeDouble:@"CUIPSDGradientEvaluatorFillCoefficient" forKey:self->fillColor.alpha];
    [a3 encodeDouble:@"CUIPSDGradientEvaluatorFillColorRed" forKey:self->fillColor.red];
    [a3 encodeDouble:@"CUIPSDGradientEvaluatorFillColorGreen" forKey:self->fillColor.green];
    [a3 encodeDouble:@"CUIPSDGradientEvaluatorFillColorBlue" forKey:self->fillColor.blue];
    unint64_t isa_low = LOBYTE(self[1].super.isa);
    uint64_t v6 = (isa_low >> 2) & 3;
    [a3 encodeInteger:isa_low & 3 forKey:@"CUIPSDGradientEvaluatorColorEdgePixel"];
    [a3 encodeInteger:v6 forKey:@"CUIPSDGradientEvaluatorOpacityEdgePixel"];
  }
  else
  {
    unsigned int v7 = LOBYTE(self[1].super.isa);
    double smoothingCoefficient = self->smoothingCoefficient;
    int v8 = (v7 >> 2) & 3;
    int v9 = v7 & 3;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@@@@ddiiddd", &self->colorStops, &self->colorMidpointLocations, &self->opacityStops, &self->opacityMidpointLocations, &smoothingCoefficient, &self->fillColor.alpha, &v9, &v8, &self->fillColor, &self->fillColor.green, &self->fillColor.blue);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [+[NSArray allocWithZone:a3] initWithArray:self->colorStops copyItems:1];
  v5[2] = [+[NSArray allocWithZone:a3] initWithArray:self->colorMidpointLocations copyItems:1];
  v5[3] = [+[NSArray allocWithZone:a3] initWithArray:self->opacityStops copyItems:1];
  v5[4] = [+[NSArray allocWithZone:a3] initWithArray:self->opacityMidpointLocations copyItems:1];
  v5[5] = *(void *)&self->smoothingCoefficient;
  long long v6 = *(_OWORD *)&self->fillColor.blue;
  *((_OWORD *)v5 + 3) = *(_OWORD *)&self->fillColor.red;
  *((_OWORD *)v5 + 4) = v6;
  v5[11] = self[1].super.isa;
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientEvaluator;
  [(CUIPSDGradientEvaluator *)&v3 dealloc];
}

- (double)_smoothedInterpolationOfLocation:(double)a3 betweenLower:(double)a4 upper:(double)a5 scaledMidpoint:(double)a6
{
  if (a3 <= a6) {
    double v6 = a3 / (a6 + a6);
  }
  else {
    double v6 = 1.0 - (1.0 - a3) / (1.0 - a6 + 1.0 - a6);
  }
  return a4
       + (self->smoothingCoefficient * (v6 * (v6 * 1.5) + v6 * 0.5 + -(v6 * v6) * v6)
        + (1.0 - self->smoothingCoefficient) * v6)
       * (a5 - a4);
}

- (_psdGradientColor)_smoothedGradientColorAtLocation:(double)a3
{
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  colorStops = self->colorStops;
  id v6 = [(NSArray *)colorStops countByEnumeratingWithState:&v104 objects:v109 count:16];
  if (v6)
  {
    id v7 = 0;
    uint64_t v8 = *(void *)v105;
    uint64_t v9 = -1;
LABEL_3:
    double v10 = 0;
    id v11 = v6;
    uint64_t v12 = v9;
    v9 += (uint64_t)v6;
    id v13 = v7;
    while (1)
    {
      if (*(void *)v105 != v8) {
        objc_enumerationMutation(colorStops);
      }
      id v7 = *(id *)(*((void *)&v104 + 1) + 8 * (void)v10);
      [v7 colorLocation];
      if (v14 >= a3) {
        break;
      }
      double v10 = (char *)v10 + 1;
      id v13 = v7;
      if (v11 == v10)
      {
        id v6 = [(NSArray *)colorStops countByEnumeratingWithState:&v104 objects:v109 count:16];
        if (v6) {
          goto LABEL_3;
        }
        unint64_t v15 = (unint64_t)v11 + v12 - 1;
        goto LABEL_16;
      }
    }
    unint64_t v15 = (unint64_t)v10 + v12;
    if (!v13 || !v7)
    {
      if (v7) {
        unint64_t v15 = 0;
      }
      else {
        --v15;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v15 = -2;
LABEL_16:
    id v13 = [(NSArray *)self->colorStops objectAtIndex:v15];
    id v7 = [(NSArray *)self->colorStops objectAtIndex:v15 + 1];
  }
  [v13 colorLocation];
  double v17 = v16;
  [v7 colorLocation];
  double v19 = v18;
  NSUInteger v20 = [(NSArray *)self->colorStops count];
  unsigned int v21 = [v13 isDoubleStop];
  unsigned int v22 = [v7 isDoubleStop];
  unsigned int v24 = v22;
  double v25 = a3 - v17;
  if (v21)
  {
    BOOL v26 = v17 > a3 && v15 == 0;
    if (v26 || (double v23 = 0.0101, v25 < 0.0101))
    {
      [v13 leadInColor];
LABEL_38:
      double v39 = v43;
      double v40 = v44;
      double v41 = v45;
      double v42 = v46;
      double v98 = v45;
      double v99 = v46;
      double v97 = v44;
      double v33 = v43;
      double v34 = a3;
      goto LABEL_39;
    }
  }
  if (v22)
  {
    BOOL v27 = v19 < a3 && v15 == v20 - 1;
    if (v27 || (double v23 = v19 - a3, v19 - a3 < 0.0101))
    {
      objc_msgSend(v7, "leadOutColor", v23);
      goto LABEL_38;
    }
  }
  double v28 = v19 - v17;
  if (v21) {
    [v13 leadOutColor];
  }
  else {
    [v13 gradientColor];
  }
  double v33 = v29;
  double v97 = v30;
  double v98 = v31;
  double v99 = v32;
  double v34 = v25 / v28;
  if (v24) {
    [v7 leadInColor];
  }
  else {
    [v7 gradientColor];
  }
  double v39 = v35;
  double v40 = v36;
  double v41 = v37;
  double v42 = v38;
LABEL_39:
  id v47 = [(CUIPSDGradientEvaluator *)self colorMidpointLocations];
  double v48 = 0.5;
  if ((unint64_t)[v47 count] > v15)
  {
    objc_msgSend(objc_msgSend(v47, "objectAtIndex:", v15), "doubleValue");
    double v48 = v49;
  }
  [(CUIPSDGradientEvaluator *)self _smoothedInterpolationOfLocation:v34 betweenLower:v33 upper:v39 scaledMidpoint:v48];
  double v51 = v50;
  [(CUIPSDGradientEvaluator *)self _smoothedInterpolationOfLocation:v34 betweenLower:v97 upper:v40 scaledMidpoint:v48];
  double v53 = v52;
  [(CUIPSDGradientEvaluator *)self _smoothedInterpolationOfLocation:v34 betweenLower:v98 upper:v41 scaledMidpoint:v48];
  double v55 = v54;
  [(CUIPSDGradientEvaluator *)self _smoothedInterpolationOfLocation:v34 betweenLower:v99 upper:v42 scaledMidpoint:v48];
  double v57 = v56;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  opacityStops = self->opacityStops;
  id v59 = [(NSArray *)opacityStops countByEnumeratingWithState:&v100 objects:v108 count:16];
  if (v59)
  {
    id v60 = 0;
    uint64_t v61 = *(void *)v101;
    uint64_t v62 = -1;
LABEL_43:
    double v63 = 0;
    id v64 = v59;
    uint64_t v65 = v62;
    v62 += (uint64_t)v59;
    id v66 = v60;
    while (1)
    {
      if (*(void *)v101 != v61) {
        objc_enumerationMutation(opacityStops);
      }
      id v60 = *(id *)(*((void *)&v100 + 1) + 8 * (void)v63);
      [v60 opacityLocation];
      if (v67 >= a3) {
        break;
      }
      double v63 = (char *)v63 + 1;
      id v66 = v60;
      if (v64 == v63)
      {
        id v59 = [(NSArray *)opacityStops countByEnumeratingWithState:&v100 objects:v108 count:16];
        if (v59) {
          goto LABEL_43;
        }
        unint64_t v68 = (unint64_t)v64 + v65 - 1;
        goto LABEL_56;
      }
    }
    unint64_t v68 = (unint64_t)v63 + v65;
    if (!v66 || !v60)
    {
      if (v60) {
        unint64_t v68 = 0;
      }
      else {
        --v68;
      }
      goto LABEL_56;
    }
  }
  else
  {
    unint64_t v68 = -2;
LABEL_56:
    id v66 = [(NSArray *)self->opacityStops objectAtIndex:v68];
    id v60 = [(NSArray *)self->opacityStops objectAtIndex:v68 + 1];
  }
  [v66 opacityLocation];
  double v70 = v69;
  [v60 opacityLocation];
  double v72 = v71;
  NSUInteger v73 = [(NSArray *)self->opacityStops count];
  unsigned int v74 = [v66 isDoubleStop];
  unsigned int v75 = [v60 isDoubleStop];
  unsigned int v77 = v75;
  double v78 = a3 - v70;
  if (v74)
  {
    BOOL v79 = v70 > a3 && v68 == 0;
    if (v79 || (double v76 = 0.0101, v78 < 0.0101))
    {
      [v66 leadInOpacity];
LABEL_77:
      double v83 = v84;
      goto LABEL_78;
    }
  }
  if (v75)
  {
    BOOL v80 = v72 < a3 && v68 == v73 - 1;
    if (v80 || (double v76 = v72 - a3, v72 - a3 < 0.0101))
    {
      objc_msgSend(v60, "leadOutOpacity", v76);
      goto LABEL_77;
    }
  }
  double v81 = v72 - v70;
  if (v74) {
    [v66 leadOutOpacity];
  }
  else {
    [v66 opacity];
  }
  double v83 = v82;
  a3 = v78 / v81;
  if (v77) {
    [v60 leadInOpacity];
  }
  else {
    [v60 opacity];
  }
LABEL_78:
  double v85 = v84;
  id v86 = [(CUIPSDGradientEvaluator *)self opacityMidpointLocations];
  id v87 = [v86 count];
  double v88 = 0.5;
  if ((unint64_t)v87 > v68)
  {
    objc_msgSend(objc_msgSend(v86, "objectAtIndex:", v68), "doubleValue");
    double v88 = v89;
  }
  [(CUIPSDGradientEvaluator *)self _smoothedInterpolationOfLocation:a3 betweenLower:v83 upper:v85 scaledMidpoint:v88];
  double v91 = v57 * v90;
  double v92 = self->fillColor.alpha * (1.0 - v57 * v90);
  double v93 = self->fillColor.red * v92 + v51 * (v57 * v90);
  double v94 = self->fillColor.green * v92 + v53 * v91;
  double v95 = v91 + v92;
  double v96 = v92 * self->fillColor.blue + v55 * v91;
  if (v95 != 0.0)
  {
    double v93 = v93 / v95;
    double v94 = v94 / v95;
    double v96 = v96 / v95;
  }
  result.double alpha = v95;
  result.double blue = v96;
  result.double green = v94;
  result.double red = v93;
  return result;
}

- (id)colorStops
{
  id v2 = [(NSArray *)self->colorStops copy];
  return v2;
}

- (id)colorMidpointLocations
{
  id v2 = [(NSArray *)self->colorMidpointLocations copy];
  return v2;
}

- (id)opacityStops
{
  id v2 = [(NSArray *)self->opacityStops copy];
  return v2;
}

- (id)opacityMidpointLocations
{
  id v2 = [(NSArray *)self->opacityMidpointLocations copy];
  return v2;
}

- (double)smoothingCoefficient
{
  return self->smoothingCoefficient;
}

- (BOOL)isDithered
{
  return (LOBYTE(self[1].super.isa) >> 4) & 1;
}

- (double)fillCoefficient
{
  return self->fillColor.alpha;
}

- (_psdGradientColor)fillColor
{
  double red = self->fillColor.red;
  double green = self->fillColor.green;
  double blue = self->fillColor.blue;
  double alpha = self->fillColor.alpha;
  result.double alpha = alpha;
  result.double blue = blue;
  result.double green = green;
  result.double red = red;
  return result;
}

- (BOOL)hasEdgePixel
{
  return ((uint64_t)self[1].super.isa & 0xF) != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientEvaluator;
  return +[NSString stringWithFormat:@"%@ - color stops: %@, opacity stops: %@", [(CUIPSDGradientEvaluator *)&v3 description], self->colorStops, self->opacityStops];
}

- (void)setColorStops:(id)a3 midpoints:(id)a4
{
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  [(CUIPSDGradientEvaluator *)self _createOrderedStops:&v8 midpoints:&v7 fromStops:a3 midpoints:a4 edgePixel:&v6];
  LOBYTE(self[1].super.isa) = (uint64_t)self[1].super.isa & 0xFC | v6 & 3;

  uint64_t v5 = v7;
  self->colorStops = v8;
  self->colorMidpointLocations = v5;
}

- (void)setOpacityStops:(id)a3 midpoints:(id)a4
{
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  [(CUIPSDGradientEvaluator *)self _createOrderedStops:&v8 midpoints:&v7 fromStops:a3 midpoints:a4 edgePixel:&v6];
  LOBYTE(self[1].super.isa) = (4 * (v6 & 3)) | (uint64_t)self[1].super.isa & 0xF3;

  uint64_t v5 = v7;
  self->opacityStops = v8;
  self->opacityMidpointLocations = v5;
}

- (void)setSmoothingCoefficient:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->double smoothingCoefficient = fmin(a3, 1.0);
}

- (void)setFillCoefficient:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->fillColor.double alpha = fmin(a3, 1.0);
}

- (void)customizeForDistance:(double)a3
{
  if (((uint64_t)self[1].super.isa & 0xF) == 0)
  {
    double v10 = "WARNING: -[CUIPSDGradientEvaluator customizeForDistance:] sent to evaluator that has no edge pixels. The message is a no-op.";
    goto LABEL_5;
  }
  if (a3 == 0.0)
  {
    double v10 = "WARNING: -[CUIPSDGradientEvaluator customizeForDistance:] sent to evaluator with zero distance. The message is a no-op.";
LABEL_5:
    _CUILog(1, (uint64_t)v10, v3, v4, v5, v6, v7, v8, v18);
    return;
  }
  if ([(NSArray *)self->colorStops count] >= 4)
  {
    char isa = (char)self[1].super.isa;
    if (isa)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->colorStops, "objectAtIndex:", 1), "setLocation:", fmin(1.0 / a3, 0.15));
      char isa = (char)self[1].super.isa;
    }
    if ((isa & 2) != 0)
    {
      id v13 = [(NSArray *)self->colorStops objectAtIndex:(char *)[(NSArray *)self->colorStops count] - 2];
      double v14 = 1.0 - 1.0 / a3;
      if (1.0 / a3 >= 0.15) {
        double v14 = 0.85;
      }
      [v13 setLocation:v14];
      char isa = (char)self[1].super.isa;
    }
    if ((isa & 4) != 0)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->opacityStops, "objectAtIndex:", 1), "setLocation:", fmin(1.0 / a3, 0.15));
      char isa = (char)self[1].super.isa;
    }
    if ((isa & 8) != 0)
    {
      id v15 = [(NSArray *)self->opacityStops objectAtIndex:(char *)[(NSArray *)self->opacityStops count] - 2];
      double v16 = 1.0 - 1.0 / a3;
      if (1.0 / a3 >= 0.15) {
        double v16 = 0.85;
      }
      [v15 setLocation:v16];
    }
  }
}

- (int)blendMode
{
  return self->blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->blendMode = a3;
}

@end