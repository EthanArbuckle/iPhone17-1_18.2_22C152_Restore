@interface AIAudiogramMap
- (AIAudiogramAxis)frequencies;
- (AIAudiogramAxis)hearingLevels;
- (AIAudiogramMap)initWithFrequencies:(id)a3 hearingLevels:(id)a4;
- (CGPoint)_adjustedPointForSlopeWithPoint:(CGPoint)a3;
- (CGPoint)_intersectionOfLinesWithSlope:(double)a3 intercept:(double)a4 slope2:(double)a5 intercept2:(double)a6;
- (NSNumber)frequencyIntercept;
- (NSNumber)frequencySlope;
- (NSNumber)hearingLevelIntercept;
- (NSNumber)hearingLevelSlope;
- (double)_interceptForLineThroughPoint:(CGPoint)a3 withSlope:(double)a4;
- (id)_valueOfPoint:(CGPoint)a3 betweenObject:(id)a4 andObject:(id)a5 onAxis:(unint64_t)a6;
- (id)description;
- (id)frequencyAtPoint:(CGPoint)a3;
- (id)hearingLevelAtPoint:(CGPoint)a3;
- (void)_calculateAxisSlopeAndInterceptForAxisType:(unint64_t)a3;
- (void)setFrequencies:(id)a3;
- (void)setFrequencyIntercept:(id)a3;
- (void)setFrequencySlope:(id)a3;
- (void)setHearingLevelIntercept:(id)a3;
- (void)setHearingLevelSlope:(id)a3;
- (void)setHearingLevels:(id)a3;
@end

@implementation AIAudiogramMap

- (AIAudiogramMap)initWithFrequencies:(id)a3 hearingLevels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AIAudiogramMap;
  v8 = [(AIAudiogramMap *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AIAudiogramMap *)v8 setFrequencies:v6];
    [(AIAudiogramMap *)v9 setHearingLevels:v7];
    [(AIAudiogramMap *)v9 _calculateAxisSlopeAndInterceptForAxisType:0];
    [(AIAudiogramMap *)v9 _calculateAxisSlopeAndInterceptForAxisType:1];
  }

  return v9;
}

- (id)frequencyAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = [(AIAudiogramMap *)self frequencies];
  id v7 = [v6 values];
  int v8 = [v7 count];

  if (v8 > 1)
  {
    -[AIAudiogramMap _adjustedPointForSlopeWithPoint:](self, "_adjustedPointForSlopeWithPoint:", x, y);
    double v14 = v13;
    double v15 = v12;
    if (v13 != x || v12 != y)
    {
      v16 = AXLogAudiogram();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v53.double x = x;
        v53.double y = y;
        v17 = NSStringFromCGPoint(v53);
        v54.double x = v14;
        v54.double y = v15;
        v18 = NSStringFromCGPoint(v54);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_23F0D7000, v16, OS_LOG_TYPE_INFO, "Point %@ was adjusted to %@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v48 = __Block_byref_object_copy__6;
    v49 = __Block_byref_object_dispose__6;
    id v50 = 0;
    v19 = [(AIAudiogramMap *)self frequencies];
    v20 = [v19 values];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __35__AIAudiogramMap_frequencyAtPoint___block_invoke;
    v42[3] = &unk_2650591E8;
    *(double *)&v42[6] = v14;
    *(double *)&v42[7] = v15;
    v42[4] = self;
    v42[5] = buf;
    [v20 enumerateObjectsUsingBlock:v42];

    v21 = *(void **)(*(void *)&buf[8] + 40);
    if (!v21)
    {
      v22 = AXLogAudiogram();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v55.double x = v14;
        v55.double y = v15;
        NSStringFromCGPoint(v55);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = [(AIAudiogramMap *)self frequencies];
        v25 = [v24 maxValue];
        *(_DWORD *)v43 = 138412546;
        id v44 = v23;
        __int16 v45 = 2112;
        v46 = v25;
        _os_log_impl(&dword_23F0D7000, v22, OS_LOG_TYPE_INFO, "Point %@ was after end of frequency range %@", v43, 0x16u);
      }
      v26 = [(AIAudiogramMap *)self frequencies];
      v27 = [v26 values];
      v28 = [v27 objectAtIndex:(v8 - 1)];

      v29 = [(AIAudiogramMap *)self frequencies];
      v30 = [v29 values];
      v31 = [v30 objectAtIndex:(v8 - 2)];

      uint64_t v32 = -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:](self, "_valueOfPoint:betweenObject:andObject:onAxis:", v28, v31, 0, v14, v15);
      v33 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v32;

      v21 = *(void **)(*(void *)&buf[8] + 40);
    }
    v34 = NSNumber;
    [v21 doubleValue];
    uint64_t v36 = [v34 numberWithDouble:round(v35)];
    v37 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v36;

    v38 = AXLogAudiogram();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = *(void **)(*(void *)&buf[8] + 40);
      v56.double x = v14;
      v56.double y = v15;
      v40 = NSStringFromCGPoint(v56);
      *(_DWORD *)v43 = 138412546;
      id v44 = v39;
      __int16 v45 = 2112;
      v46 = v40;
      _os_log_impl(&dword_23F0D7000, v38, OS_LOG_TYPE_INFO, "Returning frequency of %@ from point %@", v43, 0x16u);
    }
    id v11 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v9 = [(AIAudiogramMap *)self frequencies];
    v10 = [v9 minValue];
    id v11 = [v10 numericalValue];
  }
  return v11;
}

void __35__AIAudiogramMap_frequencyAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  double v8 = *(double *)(a1 + 48);
  [v7 center];
  if (v8 <= v9)
  {
    *a4 = 1;
    if (a3)
    {
      v10 = [*(id *)(a1 + 32) frequencies];
      id v11 = [v10 values];
      double v12 = [v11 objectAtIndex:a3 - 1];
    }
    else
    {
      double v13 = AXLogAudiogram();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        double v14 = NSStringFromCGPoint(*(CGPoint *)(a1 + 48));
        double v15 = [*(id *)(a1 + 32) frequencies];
        v16 = [v15 minValue];
        int v23 = 138412546;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "Point %@ was at or before start of frequency range %@", (uint8_t *)&v23, 0x16u);
      }
      v17 = [*(id *)(a1 + 32) frequencies];
      v18 = [v17 values];
      uint64_t v19 = [v18 objectAtIndex:1];

      double v12 = v7;
      id v7 = (id)v19;
    }
    uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_valueOfPoint:betweenObject:andObject:onAxis:", v7, v12, 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (id)hearingLevelAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = [(AIAudiogramMap *)self hearingLevels];
  id v7 = [v6 values];
  int v8 = [v7 count];

  if (v8 > 1)
  {
    -[AIAudiogramMap _adjustedPointForSlopeWithPoint:](self, "_adjustedPointForSlopeWithPoint:", x, y);
    double v13 = v12;
    double v15 = v14;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    __int16 v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    id v47 = 0;
    v16 = [(AIAudiogramMap *)self hearingLevels];
    v17 = [v16 values];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __38__AIAudiogramMap_hearingLevelAtPoint___block_invoke;
    v41[3] = &unk_2650591E8;
    *(double *)&v41[6] = v13;
    *(double *)&v41[7] = v15;
    v41[4] = self;
    v41[5] = &v42;
    [v17 enumerateObjectsUsingBlock:v41];

    if (!v43[5])
    {
      v18 = AXLogAudiogram();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v54.double x = v13;
        v54.double y = v15;
        NSStringFromCGPoint(v54);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [(AIAudiogramMap *)self hearingLevels];
        uint64_t v21 = [v20 maxValue];
        *(_DWORD *)buf = 138412546;
        id v49 = v19;
        __int16 v50 = 2112;
        uint64_t v51 = v21;
        _os_log_impl(&dword_23F0D7000, v18, OS_LOG_TYPE_INFO, "Point %@ was after end of hearing level range %@", buf, 0x16u);
      }
      v22 = [(AIAudiogramMap *)self hearingLevels];
      int v23 = [v22 values];
      v24 = [v23 objectAtIndex:(v8 - 1)];

      __int16 v25 = [(AIAudiogramMap *)self hearingLevels];
      v26 = [v25 values];
      uint64_t v27 = [v26 objectAtIndex:(v8 - 2)];

      uint64_t v28 = -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:](self, "_valueOfPoint:betweenObject:andObject:onAxis:", v24, v27, 1, v13, v15);
      v29 = (void *)v43[5];
      v43[5] = v28;
    }
    v30 = AXLogAudiogram();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)v43[5];
      v55.double x = v13;
      v55.double y = v15;
      uint64_t v32 = NSStringFromCGPoint(v55);
      *(_DWORD *)buf = 138412546;
      id v49 = v31;
      __int16 v50 = 2112;
      uint64_t v51 = v32;
      _os_log_impl(&dword_23F0D7000, v30, OS_LOG_TYPE_INFO, "dB value before rounding is %@ from point %@", buf, 0x16u);
    }
    v33 = NSNumber;
    [(id)v43[5] doubleValue];
    uint64_t v35 = [v33 numberWithDouble:round(v34 / 5.0) * 5.0];
    uint64_t v36 = (void *)v43[5];
    v43[5] = v35;

    v37 = AXLogAudiogram();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (void *)v43[5];
      v56.double x = v13;
      v56.double y = v15;
      v39 = NSStringFromCGPoint(v56);
      *(_DWORD *)buf = 138412546;
      id v49 = v38;
      __int16 v50 = 2112;
      uint64_t v51 = v39;
      _os_log_impl(&dword_23F0D7000, v37, OS_LOG_TYPE_INFO, "Returning hearing level of %@ from point %@", buf, 0x16u);
    }
    id v11 = (id)v43[5];
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    double v9 = [(AIAudiogramMap *)self hearingLevels];
    v10 = [v9 minValue];
    id v11 = [v10 numericalValue];
  }
  return v11;
}

void __38__AIAudiogramMap_hearingLevelAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  double v8 = *(double *)(a1 + 56);
  [v7 center];
  if (v8 >= v9)
  {
    *a4 = 1;
    if (a3)
    {
      v10 = [*(id *)(a1 + 32) hearingLevels];
      id v11 = [v10 values];
      double v12 = [v11 objectAtIndex:a3 - 1];
    }
    else
    {
      double v13 = AXLogAudiogram();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        double v14 = NSStringFromCGPoint(*(CGPoint *)(a1 + 48));
        double v15 = [*(id *)(a1 + 32) hearingLevels];
        v16 = [v15 minValue];
        int v23 = 138412546;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "Point %@ was at or before start of hearing level range %@", (uint8_t *)&v23, 0x16u);
      }
      v17 = [*(id *)(a1 + 32) hearingLevels];
      v18 = [v17 values];
      uint64_t v19 = [v18 objectAtIndex:1];

      double v12 = v7;
      id v7 = (id)v19;
    }
    uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_valueOfPoint:betweenObject:andObject:onAxis:", v7, v12, 1, *(double *)(a1 + 48), *(double *)(a1 + 56));
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (id)_valueOfPoint:(CGPoint)a3 betweenObject:(id)a4 andObject:(id)a5 onAxis:(unint64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (a6)
  {
    [v11 center];
    double v14 = v13;
    [v10 center];
    double v16 = v15;
    [v12 center];
    v18 = NSNumber;
    double v19 = (y - v14) / (v16 - v17);
    uint64_t v20 = [v10 numericalValue];
    [v20 doubleValue];
    double v22 = v21;
    int v23 = [v12 numericalValue];
    [v23 doubleValue];
    double v25 = v22 - v24;
    v26 = [v12 numericalValue];
    [v26 doubleValue];
    uint64_t v28 = [v18 numberWithDouble:v27 + v25 * v19];

LABEL_3:
    goto LABEL_23;
  }
  [v11 center];
  double v30 = x - v29;
  [v10 center];
  double v32 = v31;
  [v12 center];
  double v34 = v30 / (v32 - v33);
  uint64_t v35 = AXLogAudiogram();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[AIAudiogramMap _valueOfPoint:betweenObject:andObject:onAxis:](v35, v34);
  }

  if (v34 == 1.0) {
    goto LABEL_7;
  }
  if (v34 > 0.0 && v34 < 0.4)
  {
    v37 = AXLogAudiogram();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      uint64_t v36 = v12;
      goto LABEL_22;
    }
    v38 = [v12 numericalValue];
    *(_DWORD *)v58 = 138412290;
    *(void *)&v58[4] = v38;
    v39 = "Snapped frequency value down to known value %@";
LABEL_20:
    _os_log_impl(&dword_23F0D7000, v37, OS_LOG_TYPE_INFO, v39, v58, 0xCu);

    goto LABEL_21;
  }
  if (v34 <= 0.6 || v34 >= 1.0)
  {
    if (v34 <= -0.4 || v34 >= 0.0)
    {
      double v44 = fabs(fmod(v34, 1.0));
      __int16 v45 = AXLogAudiogram();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
      if (v44 > 0.6 || v44 < 0.4)
      {
        if (v46)
        {
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_23F0D7000, v45, OS_LOG_TYPE_INFO, "Snapped frequency value outside of known range", v58, 2u);
        }

        double v34 = round(v34);
      }
      else
      {
        if (v46)
        {
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_23F0D7000, v45, OS_LOG_TYPE_INFO, "Could not snap frequency as point was too far from expected marks", v58, 2u);
        }
      }
      id v47 = [v10 numericalValue];
      [v47 doubleValue];
      double v49 = v48;
      __int16 v50 = [v12 numericalValue];
      [v50 doubleValue];
      long double v52 = v49 / v51;

      CGPoint v53 = NSNumber;
      CGPoint v54 = [v12 numericalValue];
      [v54 doubleValue];
      uint64_t v28 = objc_msgSend(v53, "numberWithDouble:", (double)(pow(v52, v34) * v55));

      uint64_t v20 = snapToValidFrequency(v28);
      if (v20)
      {
        CGPoint v56 = AXLogAudiogram();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v58 = 138412546;
          *(void *)&v58[4] = v28;
          *(_WORD *)&v58[12] = 2112;
          *(void *)&v58[14] = v20;
          _os_log_impl(&dword_23F0D7000, v56, OS_LOG_TYPE_INFO, "Snapped frequency value to further validate. %@ -> %@", v58, 0x16u);
        }

        id v57 = v20;
        uint64_t v28 = v57;
      }
      goto LABEL_3;
    }
    v37 = AXLogAudiogram();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    v38 = [v10 numericalValue];
    *(_DWORD *)v58 = 138412290;
    *(void *)&v58[4] = v38;
    v39 = "Snapped frequency value up to known value %@";
    goto LABEL_20;
  }
  uint64_t v42 = AXLogAudiogram();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = [v10 numericalValue];
    *(_DWORD *)v58 = 138412290;
    *(void *)&v58[4] = v43;
    _os_log_impl(&dword_23F0D7000, v42, OS_LOG_TYPE_INFO, "Snapped frequency value up to known value %@", v58, 0xCu);
  }
LABEL_7:
  uint64_t v36 = v10;
LABEL_22:
  uint64_t v28 = objc_msgSend(v36, "numericalValue", *(_OWORD *)v58);
LABEL_23:

  return v28;
}

- (void)_calculateAxisSlopeAndInterceptForAxisType:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = [(AIAudiogramMap *)self hearingLevels];
    id v6 = [v5 values];
  }
  else
  {
    id v7 = [(AIAudiogramMap *)self frequencies];
    double v8 = [v7 values];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __61__AIAudiogramMap__calculateAxisSlopeAndInterceptForAxisType___block_invoke;
    v29[3] = &unk_265059210;
    id v30 = &unk_26F2DB538;
    id v6 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v29);
  }
  if ((unint64_t)[v6 count] > 1)
  {
    double v14 = [v6 firstObject];
    [v14 center];
    double v16 = v15;
    double v18 = v17;

    double v19 = [v6 lastObject];
    [v19 center];
    double v21 = v20;
    double v23 = v22;

    if (v16 == v21)
    {
      double v9 = AXLogAudiogram();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v11 = "Points are perfectly aligned vertically, slope is undefined";
        double v12 = v9;
        uint32_t v13 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      double v24 = (v23 - v18) / (v21 - v16);
      -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v16, v18, v24);
      double v26 = v25;
      double v27 = AXLogAudiogram();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v32 = v24;
        __int16 v33 = 2048;
        double v34 = v26;
        __int16 v35 = 2048;
        unint64_t v36 = a3;
        _os_log_impl(&dword_23F0D7000, v27, OS_LOG_TYPE_DEFAULT, "Calculated slope %f, intercept %f for axis %lu", buf, 0x20u);
      }

      uint64_t v28 = [NSNumber numberWithDouble:v24];
      if (a3)
      {
        [(AIAudiogramMap *)self setHearingLevelSlope:v28];

        double v9 = [NSNumber numberWithDouble:v26];
        [(AIAudiogramMap *)self setHearingLevelIntercept:v9];
      }
      else
      {
        [(AIAudiogramMap *)self setFrequencySlope:v28];

        double v9 = [NSNumber numberWithDouble:v26];
        [(AIAudiogramMap *)self setFrequencyIntercept:v9];
      }
    }
  }
  else
  {
    double v9 = AXLogAudiogram();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v6 count];
      *(_DWORD *)buf = 134217984;
      double v32 = *(double *)&v10;
      id v11 = "Not enough points (%lu) to calculate slope";
      double v12 = v9;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl(&dword_23F0D7000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    }
  }
}

uint64_t __61__AIAudiogramMap__calculateAxisSlopeAndInterceptForAxisType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 numericalValue];
  LODWORD(v2) = [v2 containsObject:v3];

  return v2 ^ 1;
}

- (CGPoint)_adjustedPointForSlopeWithPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v6 = [(AIAudiogramMap *)self hearingLevelSlope];
  if (v6)
  {
    id v7 = [(AIAudiogramMap *)self hearingLevelSlope];
    [v7 doubleValue];
    double v9 = fabs(fabs(atan(v8)) * 180.0 / 3.14159265 + -90.0);
  }
  else
  {
    double v9 = 0.0;
  }

  uint64_t v10 = [(AIAudiogramMap *)self frequencySlope];
  [v10 doubleValue];
  double v12 = fabs(atan(v11)) * 180.0 / 3.14159265;

  BOOL v13 = v12 > 1.0 || v9 > 1.0;
  if (v9 >= 3.0 || (v12 < 3.0 ? (BOOL v14 = !v13) : (BOOL v14 = 0), !v14))
  {
    double v97 = y;
    double v98 = x;
    double v17 = [(AIAudiogramMap *)self frequencies];
    double v18 = [v17 minValue];
    [v18 center];
    double v20 = v19;
    double v95 = v21;

    double v22 = [(AIAudiogramMap *)self frequencies];
    double v23 = [v22 maxValue];
    [v23 center];
    double v25 = v24;

    double v26 = [(AIAudiogramMap *)self hearingLevels];
    double v27 = [v26 minValue];
    [v27 center];
    double v96 = v28;
    double v30 = v29;

    double v31 = [(AIAudiogramMap *)self hearingLevels];
    double v32 = [v31 maxValue];
    [v32 center];
    double v94 = v33;
    double v35 = v34;

    if (v9 < 3.0 || v12 >= 3.0)
    {
      if (v9 >= 3.0 || v12 < 3.0)
      {
        if (v13)
        {
          uint64_t v50 = [(AIAudiogramMap *)self frequencySlope];
          double y = v97;
          CGFloat x = v98;
          if (v50)
          {
            double v51 = (void *)v50;
            long double v52 = [(AIAudiogramMap *)self hearingLevelSlope];

            if (v52)
            {
              CGPoint v53 = [(AIAudiogramMap *)self hearingLevelSlope];
              [v53 doubleValue];
              double v55 = v54;

              -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v55);
              double v57 = v56;
              v58 = [(AIAudiogramMap *)self frequencySlope];
              [v58 doubleValue];
              double v60 = v59;
              v61 = [(AIAudiogramMap *)self frequencyIntercept];
              [v61 doubleValue];
              [(AIAudiogramMap *)self _intersectionOfLinesWithSlope:v60 intercept:v62 slope2:v55 intercept2:v57];
              double v64 = v63;

              v65 = [(AIAudiogramMap *)self frequencySlope];
              [v65 doubleValue];
              double v67 = v66;

              -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v67);
              double v69 = v68;
              v70 = [(AIAudiogramMap *)self hearingLevelSlope];
              [v70 doubleValue];
              double v72 = v71;
              v73 = [(AIAudiogramMap *)self hearingLevelIntercept];
              [v73 doubleValue];
              [(AIAudiogramMap *)self _intersectionOfLinesWithSlope:v72 intercept:v74 slope2:v67 intercept2:v69];
              double y = v75;

              CGFloat x = v64;
            }
          }
        }
        else
        {
          double y = v97;
          CGFloat x = v98;
        }
      }
      else
      {
        uint64_t v42 = [(AIAudiogramMap *)self frequencySlope];
        [v42 doubleValue];
        double v44 = v43;
        if (vabdd_f64(v95, v30) < vabdd_f64(v95, v35))
        {

          __int16 v45 = [(AIAudiogramMap *)self frequencySlope];
          [v45 doubleValue];
          double v47 = -v88;
        }
        else
        {
          double v44 = -v43;

          __int16 v45 = [(AIAudiogramMap *)self frequencySlope];
          [v45 doubleValue];
          double v47 = v46;
        }

        double v89 = (v97 - v30) / (v35 - v30);
        if (fabs(v89 + -0.5) >= 0.05)
        {
          double v90 = atan(v44);
          long double v91 = atan(v47);
          double v92 = tan(v90 + (v91 - v90) * v89);
          CGFloat x = v98;
          -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v92);
          double y = v93 + v92 * ((v96 + v94) * 0.5);
        }
        else
        {
          double y = v97;
          CGFloat x = v98;
        }
      }
    }
    else
    {
      unint64_t v36 = [(AIAudiogramMap *)self hearingLevelSlope];
      [v36 doubleValue];
      double v38 = v37;
      CGFloat x = v98;
      if (vabdd_f64(v96, v20) < vabdd_f64(v96, v25))
      {

        v39 = [(AIAudiogramMap *)self hearingLevelSlope];
        [v39 doubleValue];
        double v41 = -v48;
      }
      else
      {
        double v38 = -v37;

        v39 = [(AIAudiogramMap *)self hearingLevelSlope];
        [v39 doubleValue];
        double v41 = v40;
      }

      double v49 = (v98 - v20) / (v25 - v20);
      if (fabs(v49 + -0.5) >= 0.05)
      {
        double v76 = atan(v38);
        double v77 = atan(v41);
        double v78 = v76 + 3.14159265;
        if (v76 >= 0.0) {
          double v78 = v76;
        }
        if (v77 < 0.0) {
          double v77 = v77 + 3.14159265;
        }
        double v79 = tan(v78 + (v77 - v78) * v49);
        double y = v97;
        -[AIAudiogramMap _interceptForLineThroughPoint:withSlope:](self, "_interceptForLineThroughPoint:withSlope:", v98, v97, v79);
        double v81 = v80;
        v82 = [(AIAudiogramMap *)self frequencySlope];
        [v82 doubleValue];
        double v84 = v83;
        v85 = [(AIAudiogramMap *)self frequencyIntercept];
        [v85 doubleValue];
        [(AIAudiogramMap *)self _intersectionOfLinesWithSlope:v84 intercept:v86 slope2:v79 intercept2:v81];
        CGFloat x = v87;
      }
      else
      {
        double y = v97;
      }
    }
  }
  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.CGFloat x = v15;
  return result;
}

- (double)_interceptForLineThroughPoint:(CGPoint)a3 withSlope:(double)a4
{
  return a3.y - a4 * a3.x;
}

- (CGPoint)_intersectionOfLinesWithSlope:(double)a3 intercept:(double)a4 slope2:(double)a5 intercept2:(double)a6
{
  double v6 = (a4 - a6) / (a5 - a3);
  double v7 = a4 + a3 * v6;
  double v8 = v6;
  result.double y = v7;
  result.CGFloat x = v8;
  return result;
}

- (id)description
{
  double v15 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)AIAudiogramMap;
  BOOL v14 = [(AIAudiogramMap *)&v19 description];
  double v18 = [(AIAudiogramMap *)self frequencies];
  double v17 = [v18 minValue];
  v3 = [v17 numericalValue];
  double v16 = [(AIAudiogramMap *)self frequencies];
  v4 = [v16 maxValue];
  v5 = [v4 numericalValue];
  double v6 = [(AIAudiogramMap *)self hearingLevels];
  double v7 = [v6 minValue];
  double v8 = [v7 numericalValue];
  double v9 = [(AIAudiogramMap *)self hearingLevels];
  uint64_t v10 = [v9 maxValue];
  long double v11 = [v10 numericalValue];
  double v12 = [v15 stringWithFormat:@"%@ Frequency: %@Hz to %@Hz, Hearing Level: %@dB to %@dB", v14, v3, v5, v8, v11];

  return v12;
}

- (AIAudiogramAxis)frequencies
{
  return self->_frequencies;
}

- (void)setFrequencies:(id)a3
{
}

- (AIAudiogramAxis)hearingLevels
{
  return self->_hearingLevels;
}

- (void)setHearingLevels:(id)a3
{
}

- (NSNumber)frequencySlope
{
  return self->_frequencySlope;
}

- (void)setFrequencySlope:(id)a3
{
}

- (NSNumber)hearingLevelSlope
{
  return self->_hearingLevelSlope;
}

- (void)setHearingLevelSlope:(id)a3
{
}

- (NSNumber)frequencyIntercept
{
  return self->_frequencyIntercept;
}

- (void)setFrequencyIntercept:(id)a3
{
}

- (NSNumber)hearingLevelIntercept
{
  return self->_hearingLevelIntercept;
}

- (void)setHearingLevelIntercept:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingLevelIntercept, 0);
  objc_storeStrong((id *)&self->_frequencyIntercept, 0);
  objc_storeStrong((id *)&self->_hearingLevelSlope, 0);
  objc_storeStrong((id *)&self->_frequencySlope, 0);
  objc_storeStrong((id *)&self->_hearingLevels, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
}

- (void)_valueOfPoint:(os_log_t)log betweenObject:(double)a2 andObject:onAxis:.cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_23F0D7000, log, OS_LOG_TYPE_DEBUG, "Finding frequency value. Percent between points = %f", (uint8_t *)&v2, 0xCu);
}

@end