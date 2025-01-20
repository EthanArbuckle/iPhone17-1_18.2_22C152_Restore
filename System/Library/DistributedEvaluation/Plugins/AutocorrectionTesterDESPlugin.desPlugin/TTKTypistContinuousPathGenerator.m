@interface TTKTypistContinuousPathGenerator
- (CGPoint)_pointOnCurve:(id)a3 atTime:(double)a4;
- (TTKTypistContinuousPathGenerator)initWithParams:(id)a3;
- (double)alpha;
- (id)_generateControlPoints:(id)a3 alpha:(double)a4;
- (id)_generateTouchPointsOnPath:(id)a3 withSegmentTiming:(id)a4;
- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7;
- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8;
- (void)setAlpha:(double)a3;
@end

@implementation TTKTypistContinuousPathGenerator

- (id)_generateTouchPointsOnPath:(id)a3 withSegmentTiming:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  v7 = objc_alloc_init(TIContinuousPath);
  if ([v6 count] != (char *)&def_3B118 + 1)
  {
    v8 = 0;
    uint64_t v9 = 0;
    v20 = v6;
    do
    {
      if ((unint64_t)((unsigned char *)[v6 count] - v8) > 3) {
        v10 = (char *)&dword_4;
      }
      else {
        v10 = (char *)((unsigned char *)[v6 count] - v8);
      }
      v11 = objc_msgSend(v6, "subarrayWithRange:", v8, v10);
      uint64_t v22 = v9;
      v12 = [v21 objectAtIndexedSubscript:v9];
      if ([v12 count])
      {
        unint64_t v13 = 0;
        do
        {
          v14 = [v12 objectAtIndex:v13];
          [v14 doubleValue];
          double v16 = v15;

          self->_currentTimestamp = v16 + self->_currentTimestamp;
          v17 = [TIContinuousPathSample alloc];
          [(TTKTypistContinuousPathGenerator *)self _pointOnCurve:v11 atTime:v16];
          v18 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v17, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1);
          [(TIContinuousPath *)v7 addSample:v18];

          ++v13;
        }
        while (v13 < (unint64_t)[v12 count]);
      }
      uint64_t v9 = v22 + 1;

      v8 += 3;
      id v6 = v20;
    }
    while ((char *)[v20 count] - 1 > v8);
  }

  return v7;
}

- (CGPoint)_pointOnCurve:(id)a3 atTime:(double)a4
{
  id v5 = a3;
  id v6 = (char *)[v5 count];
  if (v6 == (unsigned char *)&def_3B118 + 3)
  {
    v12 = [v5 objectAtIndexedSubscript:0];
    [v12 CGPointValue];
    double v14 = v13;

    double v15 = [v5 objectAtIndexedSubscript:1];
    [v15 CGPointValue];
    double v17 = v16;

    v18 = [v5 objectAtIndexedSubscript:2];
    [v18 CGPointValue];
    double v20 = v19;

    id v21 = [v5 objectAtIndexedSubscript:0];
    [v21 CGPointValue];
    double v23 = v22;

    v24 = [v5 objectAtIndexedSubscript:1];
    [v24 CGPointValue];
    double v26 = v25;

    v27 = [v5 objectAtIndexedSubscript:2];
    [v27 CGPointValue];
    double v29 = v28;

    float v30 = 1.0 - a4;
    double v31 = (float)(v30 * v30);
    double v32 = (1.0 - a4 + 1.0 - a4) * a4;
    double v9 = v32 * v17 + v31 * v14 + a4 * a4 * v20;
    double v11 = v32 * v26 + v31 * v23 + a4 * a4 * v29;
    goto LABEL_9;
  }
  if (v6 == (unsigned char *)&def_3B118 + 2)
  {
    v33 = [v5 objectAtIndexedSubscript:0];
    [v33 CGPointValue];
    double v35 = v34;
    double v37 = v36;

    v38 = [v5 objectAtIndexedSubscript:1];
    [v38 CGPointValue];
    double v40 = v39;
    double v42 = v41;

    double v43 = 1.0 - a4;
    double v9 = v40 * a4 + (1.0 - a4) * v35;
    double v44 = v42 * a4;
LABEL_8:
    double v11 = v44 + v43 * v37;
    goto LABEL_9;
  }
  if (v6 != (unsigned char *)&def_3B118 + 1)
  {
    v45 = [v5 objectAtIndexedSubscript:0];
    [v45 CGPointValue];
    double v74 = v46;

    v47 = [v5 objectAtIndexedSubscript:1];
    [v47 CGPointValue];
    double v73 = v48;

    v49 = [v5 objectAtIndexedSubscript:2];
    [v49 CGPointValue];
    double v72 = v50;

    v51 = [v5 objectAtIndexedSubscript:3];
    [v51 CGPointValue];
    double v71 = v52;

    v53 = [v5 objectAtIndexedSubscript:0];
    [v53 CGPointValue];
    double v70 = v54;

    v55 = [v5 objectAtIndexedSubscript:1];
    [v55 CGPointValue];
    double v69 = v56;

    v57 = [v5 objectAtIndexedSubscript:2];
    [v57 CGPointValue];
    double v59 = v58;

    v60 = [v5 objectAtIndexedSubscript:3];
    [v60 CGPointValue];
    double v37 = v61;

    float v62 = 1.0 - a4;
    double v63 = powf(v62, 3.0);
    double v64 = a4 * 3.0 * (float)(v62 * v62);
    float v65 = a4;
    double v66 = (1.0 - a4) * (float)((float)(v65 * v65) * 3.0);
    double v43 = powf(v65, 3.0);
    double v9 = v64 * v73 + v63 * v74 + v66 * v72 + v43 * v71;
    double v44 = v64 * v69 + v63 * v70 + v66 * v59;
    goto LABEL_8;
  }
  v7 = [v5 objectAtIndexedSubscript:0];
  [v7 CGPointValue];
  double v9 = v8;
  double v11 = v10;

LABEL_9:
  double v67 = v9;
  double v68 = v11;
  result.y = v68;
  result.x = v67;
  return result;
}

- (id)_generateControlPoints:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6 || (id v8 = [v6 count], (uint64_t)v8 < 4))
  {
    double v9 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = (uint64_t)v8;
  v109 = +[UIBezierPath bezierPath];
  double v9 = objc_opt_new();
  double v11 = 0;
  float v12 = a4 + a4;
  float v13 = a4;
  float v107 = v13;
  float v108 = v12;
  do
  {
    double v14 = [v7 objectAtIndex:v11];
    [v14 CGPointValue];
    double v16 = v15;
    double v18 = v17;

    double v19 = [v7 objectAtIndex:v11 + 1];
    [v19 CGPointValue];
    double v21 = v20;
    double v23 = v22;

    v24 = [v7 objectAtIndex:(uint64_t)(v11 + 2) % v10];
    [v24 CGPointValue];
    double v26 = v25;
    double v28 = v27;

    double v29 = [v7 objectAtIndex:((uint64_t)(v11 + 2) % v10 + 1) % v10];
    [v29 CGPointValue];
    double v31 = v30;
    double v33 = v32;

    double v110 = v18;
    double v111 = v16;
    -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v21, v23, v16, v18);
    double v35 = v34;
    double v37 = v36;
    double v118 = v23;
    double v119 = v21;
    -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v26, v28, v21, v23);
    double v39 = v38;
    double v41 = v40;
    double v114 = v33;
    double v115 = v31;
    -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v31, v33, v26, v28);
    double v43 = v42;
    double v45 = v44;
    -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v35, v37, v35, v37);
    *(float *)&double v46 = v46;
    float v47 = sqrtf(*(float *)&v46);
    -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v39, v41, v39, v41);
    *(float *)&double v48 = v48;
    float v49 = sqrtf(*(float *)&v48);
    -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v43, v45, v43, v45);
    double v51 = v50;
    double v116 = v28;
    double v117 = v26;
    float v113 = v49;
    if (fabsf(v47) >= 0.00000011921)
    {
      double v106 = v50;
      float v56 = powf(v47, v108);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v26, v28, v56);
      double v58 = v57;
      double v60 = v59;
      float v61 = powf(v49, v108);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v111, v110, v61);
      -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v58, v60, v62, v63);
      double v65 = v64;
      double v67 = v66;
      float v68 = powf(v47, v107) * 3.0;
      double v69 = (float)(v61 + (float)((float)(v68 * powf(v49, v107)) + (float)(v56 * 2.0)));
      double v52 = v118;
      double v53 = v119;
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v119, v118, v69);
      -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v65, v67, v70, v71);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
      double v51 = v106;
      double v55 = v72;
      double v54 = v73;
    }
    else
    {
      double v52 = v118;
      double v53 = v119;
      double v54 = v118;
      double v55 = v119;
    }
    float v74 = v51;
    float v75 = sqrtf(v74);
    if (fabsf(v75) >= 0.00000011921)
    {
      float v80 = powf(v75, v108);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v53, v52, v80);
      double v82 = v81;
      double v112 = v55;
      double v84 = v83;
      float v85 = powf(v113, v108);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v115, v114, v85);
      -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v82, v84, v86, v87);
      double v89 = v88;
      double v91 = v90;
      float v92 = powf(v75, v107) * 3.0;
      double v93 = (float)(v85 + (float)((float)(powf(v113, v107) * v92) + (float)(v80 * 2.0)));
      double v76 = v116;
      double v77 = v117;
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v117, v116, v93);
      double v95 = v94;
      double v96 = v91;
      double v55 = v112;
      -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v89, v96, v97, v95);
      -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
      double v78 = v98;
      double v79 = v99;
      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      double v76 = v116;
      double v77 = v117;
      double v78 = v117;
      double v79 = v116;
      if (v11) {
        goto LABEL_13;
      }
    }
    objc_msgSend(v109, "moveToPoint:", v119, v118, *(void *)&v106);
    v100 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v119, v118);
    [v9 addObject:v100];

LABEL_13:
    objc_msgSend(v109, "addCurveToPoint:controlPoint1:controlPoint2:", v77, v76, v55, v54, v78, v79, *(void *)&v106);
    v101 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v55, v54);
    v120[0] = v101;
    v102 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v78, v79);
    v120[1] = v102;
    v103 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v77, v76);
    v120[2] = v103;
    v104 = +[NSArray arrayWithObjects:v120 count:3];
    [v9 addObjectsFromArray:v104];

    ++v11;
  }
  while ((unsigned char *)(v10 - 3) != v11);

LABEL_15:

  return v9;
}

- (TTKTypistContinuousPathGenerator)initWithParams:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TTKTypistContinuousPathGenerator;
  id v5 = [(TTKDefaultContinuousPathGenerator *)&v14 initWithParams:v4];
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = [v4 objectForKey:@"ALPHA"];
      if (v7)
      {
        id v8 = [v4 objectForKey:@"ALPHA"];
        [v8 floatValue];
        double v10 = v9;
        if (v9 > 1.0) {
          double v10 = 1.0;
        }
        BOOL v11 = v9 < 0.0;
        double v12 = 0.0;
        if (!v11) {
          double v12 = v10;
        }
        [(TTKTypistContinuousPathGenerator *)v6 setAlpha:v12];
      }
      else
      {
        [(TTKTypistContinuousPathGenerator *)v6 setAlpha:0.5];
      }
    }
    else
    {
      [(TTKTypistContinuousPathGenerator *)v5 setAlpha:0.5];
    }
  }

  return v6;
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return [(TTKTypistContinuousPathGenerator *)self generatePathFromInflectionPoints:a3 timestamp:a4 segmentTiming:a5 keys:a6 string:a7 layout:0.0];
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  float v13 = [v10 objectAtIndexedSubscript:0];
  [v12 addObject:v13];

  [v12 addObjectsFromArray:v10];
  objc_super v14 = objc_msgSend(v10, "objectAtIndexedSubscript:", (char *)objc_msgSend(v10, "count") - 1);
  [v12 addObject:v14];

  if (!v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)TTKTypistContinuousPathGenerator;
    id v11 = [(TTKDefaultContinuousPathGenerator *)&v18 generateTimingArray:v10];
  }
  [(TTKTypistContinuousPathGenerator *)self alpha];
  double v15 = -[TTKTypistContinuousPathGenerator _generateControlPoints:alpha:](self, "_generateControlPoints:alpha:", v12);
  double v16 = [(TTKTypistContinuousPathGenerator *)self _generateTouchPointsOnPath:v15 withSegmentTiming:v11];

  return v16;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end