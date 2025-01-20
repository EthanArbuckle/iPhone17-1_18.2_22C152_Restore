@interface CAMZoomPoint
+ (BOOL)_canExtendFromCustomLens:(int64_t)a3 toLens:(int64_t)a4 withIntermediateLens:(int64_t *)a5;
+ (id)displayZoomFactorsFromZoomPoints:(id)a3;
+ (id)significantIndexesInZoomPoints:(id)a3;
+ (id)zoomFactorsFromZoomPoints:(id)a3;
+ (id)zoomPointWithCustomLens:(int64_t)a3 baseZoomPoint:(id)a4;
+ (id)zoomPointWithFactor:(double)a3 displayed:(double)a4;
+ (id)zoomPointsWithFactors:(id)a3 displayZoomFactors:(id)a4 customLensGroup:(id)a5;
- (BOOL)isCustomLens;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToZoomPoint:(id)a3;
- (CAMZoomPoint)baseZoomPoint;
- (CAMZoomPoint)fundamentalZoomPoint;
- (NSArray)allZoomPoints;
- (double)displayFocalLength;
- (double)displayZoomFactor;
- (double)zoomFactor;
- (id)description;
- (int64_t)customLens;
@end

@implementation CAMZoomPoint

+ (id)zoomPointWithFactor:(double)a3 displayed:(double)a4
{
  v6 = (double *)objc_alloc_init((Class)a1);
  v6[4] = 0.0;
  v6[2] = a3;
  v6[3] = a4;
  return v6;
}

+ (BOOL)_canExtendFromCustomLens:(int64_t)a3 toLens:(int64_t)a4 withIntermediateLens:(int64_t *)a5
{
  v8 = +[CAMCaptureCapabilities capabilities];
  uint64_t v9 = [v8 effectiveFocalLengthForCustomLens:a3];
  uint64_t v10 = [v8 effectiveFocalLengthForCustomLens:a4];
  uint64_t v11 = [v8 baseFocalLengthForCustomLens:0];
  uint64_t v12 = [v8 effectiveFocalLengthForCustomLens:0];
  if (v11 == v9 && v12 == v10)
  {
    int64_t v16 = 0;
    BOOL v20 = 1;
    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unint64_t v14 = 0;
  while (1)
  {
    unint64_t v15 = v14;
    if (v14 == 5) {
      break;
    }
    int64_t v16 = CAMCustomLensAllLenses[v14 + 1];
    uint64_t v17 = [v8 baseFocalLengthForCustomLens:v16];
    uint64_t v18 = [v8 effectiveFocalLengthForCustomLens:v16];
    unint64_t v14 = v15 + 1;
    if (v17 == v9 && v18 == v10) {
      goto LABEL_16;
    }
  }
  int64_t v16 = 0;
LABEL_16:
  BOOL v20 = v15 < 5;
  if (a5) {
LABEL_17:
  }
    *a5 = v16;
LABEL_18:

  return v20;
}

+ (id)zoomPointWithCustomLens:(int64_t)a3 baseZoomPoint:(id)a4
{
  id v7 = a4;
  unint64_t v17 = 0;
  int v8 = objc_msgSend(a1, "_canExtendFromCustomLens:toLens:withIntermediateLens:", objc_msgSend(v7, "customLens"), a3, &v17);
  id v9 = 0;
  if (v8)
  {
    id v9 = objc_alloc_init((Class)a1);
    *((void *)v9 + 4) = v17;
    objc_storeStrong((id *)v9 + 1, a4);
    if (v17 > 5) {
      double v10 = NAN;
    }
    else {
      double v10 = dbl_209C79108[v17] / dbl_209C790D8[v17];
    }
    [v7 displayZoomFactor];
    *((double *)v9 + 3) = round(v11 * v10 * 10.0) / 10.0;
    [v7 zoomFactor];
    double v13 = v10 * v12;
    unint64_t v14 = +[CAMCaptureCapabilities capabilities];
    [v14 zoomFactorForCustomLensZoomFactor:v13];
    *((void *)v9 + 2) = v15;
  }
  return v9;
}

+ (id)zoomPointsWithFactors:(id)a3 displayZoomFactors:(id)a4 customLensGroup:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a4;
  id v32 = a5;
  int v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    unint64_t v9 = 0;
    id v31 = v7;
    do
    {
      double v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v31);
      [v10 doubleValue];
      double v12 = v11;
      double v13 = [v33 objectAtIndexedSubscript:v9];
      [v13 doubleValue];
      uint64_t v15 = +[CAMZoomPoint zoomPointWithFactor:v12 displayed:v14];

      [v8 addObject:v15];
      [v15 displayZoomFactor];
      double v17 = v16;
      uint64_t v18 = +[CAMCaptureCapabilities capabilities];
      [v18 wideDisplayZoomFactor];
      double v20 = v19;

      if (v17 == v20)
      {
        v34 = v15;
        id v21 = v15;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v22 = v32;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = [*(id *)(*((void *)&v35 + 1) + 8 * i) integerValue];
              if (v27)
              {
                v28 = +[CAMZoomPoint zoomPointWithCustomLens:v27 baseZoomPoint:v21];
                if (v28)
                {
                  [v8 addObject:v28];
                  id v29 = v28;

                  id v21 = v29;
                }
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v24);
        }

        id v7 = v31;
        uint64_t v15 = v34;
      }

      ++v9;
    }
    while (v9 < [v7 count]);
  }

  return v8;
}

+ (id)zoomFactorsFromZoomPoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = NSNumber;
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "zoomFactor", (void)v13);
        double v11 = objc_msgSend(v10, "numberWithDouble:");
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)displayZoomFactorsFromZoomPoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = NSNumber;
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "displayZoomFactor", (void)v13);
        double v11 = objc_msgSend(v10, "numberWithDouble:");
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)significantIndexesInZoomPoints:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 isCustomLens])
        {
          id v11 = v10;
          double v12 = v11;
          long long v13 = (void *)*((void *)v11 + 1);
          if (v13)
          {
            do
            {
              long long v14 = v13;

              [v4 addObject:v14];
              long long v13 = (void *)v14[1];
              double v12 = v14;
            }
            while (v13);
          }
          else
          {
            long long v14 = v11;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CAMZoomPoint_significantIndexesInZoomPoints___block_invoke;
  v18[3] = &unk_263FA1300;
  id v19 = v4;
  id v15 = v4;
  long long v16 = [v5 indexesOfObjectsPassingTest:v18];

  return v16;
}

uint64_t __47__CAMZoomPoint_significantIndexesInZoomPoints___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CAMZoomPoint *)self isEqualToZoomPoint:v4];

  return v5;
}

- (BOOL)isEqualToZoomPoint:(id)a3
{
  id v4 = (CAMZoomPoint *)a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (v4 == self)
  {
    char v16 = 1;
    goto LABEL_12;
  }
  [(CAMZoomPoint *)self zoomFactor];
  double v7 = v6;
  [(CAMZoomPoint *)v5 zoomFactor];
  if (v7 == v8
    && ([(CAMZoomPoint *)self displayZoomFactor],
        double v10 = v9,
        [(CAMZoomPoint *)v5 displayZoomFactor],
        v10 == v11)
    && (int64_t v12 = [(CAMZoomPoint *)self customLens], v12 == [(CAMZoomPoint *)v5 customLens]))
  {
    long long v13 = [(CAMZoomPoint *)self baseZoomPoint];
    if (v13 == self)
    {
      char v16 = 1;
    }
    else
    {
      long long v14 = [(CAMZoomPoint *)self baseZoomPoint];
      id v15 = [(CAMZoomPoint *)v5 baseZoomPoint];
      char v16 = [v14 isEqualToZoomPoint:v15];
    }
  }
  else
  {
LABEL_8:
    char v16 = 0;
  }
LABEL_12:

  return v16;
}

- (CAMZoomPoint)baseZoomPoint
{
  if (self->_baseZoomPoint) {
    self = self->_baseZoomPoint;
  }
  return self;
}

- (CAMZoomPoint)fundamentalZoomPoint
{
  if (self->_baseZoomPoint)
  {
    v2 = [(CAMZoomPoint *)self->_baseZoomPoint fundamentalZoomPoint];
  }
  else
  {
    v2 = self;
  }
  return v2;
}

- (NSArray)allZoomPoints
{
  id v3 = [MEMORY[0x263EFF980] arrayWithObject:self];
  id v4 = self->_baseZoomPoint;
  if (v4)
  {
    p_isa = (id *)&v4->super.isa;
    do
    {
      [v3 addObject:p_isa];
      double v6 = (id *)p_isa[1];

      p_isa = v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (BOOL)isCustomLens
{
  return [(CAMZoomPoint *)self customLens] != 0;
}

- (id)description
{
  if ([(CAMZoomPoint *)self isCustomLens])
  {
    id v3 = NSString;
    int64_t v4 = [(CAMZoomPoint *)self customLens];
    BOOL v5 = +[CAMCaptureCapabilities capabilities];
    unint64_t v6 = [v5 baseFocalLengthForCustomLens:v4];
    uint64_t v7 = [v5 effectiveFocalLengthForCustomLens:v4];
    if (v6 == v7)
    {
      double v8 = @"Base";
    }
    else
    {
      unint64_t v10 = v7;
      double v11 = NSString;
      if (v6 > 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = dword_209C79170[v6];
      }
      long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"%dmm", v12);
      if (v10 > 3) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = dword_209C79170[v10];
      }
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%dmm", v14);
      double v8 = [v11 stringWithFormat:@"%@ as %@", v13, v15];
    }
    double v9 = [v3 stringWithFormat:@" %@", v8];
  }
  else
  {
    double v9 = &stru_26BD78BA0;
  }
  char v16 = NSString;
  double v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  [(CAMZoomPoint *)self zoomFactor];
  uint64_t v20 = v19;
  [(CAMZoomPoint *)self displayZoomFactor];
  long long v22 = [v16 stringWithFormat:@"<%@: %p; (%.3f, %.1fx)%@>", v18, self, v20, v21, v9];

  return v22;
}

- (double)displayFocalLength
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  if ([(CAMZoomPoint *)self isCustomLens])
  {
    unint64_t v4 = objc_msgSend(v3, "effectiveFocalLengthForCustomLens:", -[CAMZoomPoint customLens](self, "customLens"));
    double v5 = 0.0;
    if (v4 < 4) {
      double v5 = dbl_209C79138[v4];
    }
  }
  else
  {
    [(CAMZoomPoint *)self displayZoomFactor];
    double v7 = v6;
    [v3 superWideDisplayZoomFactor];
    if (v7 == v8)
    {
      uint64_t v9 = [v3 backSuperWideFocalLengthDisplayValue];
    }
    else
    {
      [(CAMZoomPoint *)self displayZoomFactor];
      double v11 = v10;
      [v3 wideDisplayZoomFactor];
      if (v11 == v12)
      {
        uint64_t v9 = [v3 backWideFocalLengthDisplayValue];
      }
      else
      {
        [(CAMZoomPoint *)self displayZoomFactor];
        double v14 = v13;
        [v3 quadraWideDisplayZoomFactor];
        if (v14 == v15)
        {
          uint64_t v9 = [v3 backQuadraWideFocalLengthDisplayValue];
        }
        else
        {
          [(CAMZoomPoint *)self displayZoomFactor];
          double v17 = v16;
          [v3 telephotoDisplayZoomFactor];
          if (v17 != v18)
          {
            double v5 = 0.0;
            goto LABEL_13;
          }
          uint64_t v9 = [v3 backTelephotoFocalLengthDisplayValue];
        }
      }
    }
    double v5 = (double)v9;
  }
LABEL_13:

  return v5;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)displayZoomFactor
{
  return self->_displayZoomFactor;
}

- (int64_t)customLens
{
  return self->_customLens;
}

- (void).cxx_destruct
{
}

@end