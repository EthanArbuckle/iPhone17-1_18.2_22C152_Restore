@interface GAXPathInterpolator
- (CGPoint)_pointFromStartingPointAtDistance:(double)a3 inPath:(id)a4;
- (GAXPathInterpolator)init;
- (GAXPathInterpolator)initWithStartingPath:(id)a3 endingPath:(id)a4;
- (UIBezierPath)endingPath;
- (UIBezierPath)startingPath;
- (id)_enhancedByAddingPointsMatchingPath:(id)a3 originalPath:(id)a4;
- (id)interpolatedPathForProgress:(float)a3;
- (void)dealloc;
- (void)interpolationPathElementMappings;
- (void)setEndingPath:(id)a3;
- (void)setInterpolationPathElementMappings:(void *)a3;
- (void)setStartingPath:(id)a3;
@end

@implementation GAXPathInterpolator

- (GAXPathInterpolator)init
{
  v4.receiver = self;
  v4.super_class = (Class)GAXPathInterpolator;
  v2 = [(GAXPathInterpolator *)&v4 init];
  if (v2) {

  }
  return 0;
}

- (GAXPathInterpolator)initWithStartingPath:(id)a3 endingPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GAXPathInterpolator;
  v8 = [(GAXPathInterpolator *)&v14 init];
  if (v8)
  {
    v9 = v8;
    [(GAXPathInterpolator *)v8 setStartingPath:v6];
    [(GAXPathInterpolator *)v9 setEndingPath:v7];
    v10 = (const void *)AXCArrayCreate();
    [(GAXPathInterpolator *)v9 setInterpolationPathElementMappings:v10];
    if (([v6 isEmpty] & 1) == 0
      && (unsigned int v12 = [v7 isEmpty], v10)
      && !v12
      || (v9, v9 = 0, v11 = 0, v10))
    {
      CFRelease(v10);
      v11 = v9;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  [(GAXPathInterpolator *)self setInterpolationPathElementMappings:0];
  v3.receiver = self;
  v3.super_class = (Class)GAXPathInterpolator;
  [(GAXPathInterpolator *)&v3 dealloc];
}

- (void)setInterpolationPathElementMappings:(void *)a3
{
  interpolationPathElementMappings = self->_interpolationPathElementMappings;
  if (interpolationPathElementMappings != a3)
  {
    if (interpolationPathElementMappings) {
      CFRelease(interpolationPathElementMappings);
    }
    if (a3) {
      id v6 = (void *)CFRetain(a3);
    }
    else {
      id v6 = 0;
    }
    self->_interpolationPathElementMappings = v6;
  }
}

- (CGPoint)_pointFromStartingPointAtDistance:(double)a3 inPath:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  v15 = (double *)&v14;
  uint64_t v16 = 0x3010000000;
  v17 = &unk_583BD;
  CGPoint v18 = CGPointZero;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3010000000;
  v12[3] = &unk_583BD;
  CGPoint v13 = v18;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C7C0;
  v10[3] = &unk_5D6C8;
  *(double *)&v10[7] = a3;
  v10[4] = v11;
  v10[5] = &v14;
  v10[6] = v12;
  [v5 enumerateLinePointsContextsUsingBlock:v10];
  double v6 = v15[4];
  double v7 = v15[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)_enhancedByAddingPointsMatchingPath:(id)a3 originalPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x5010000000;
  v16[3] = &unk_583BD;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1C9B0;
  v12[3] = &unk_5D718;
  id v7 = (id)objc_opt_new();
  id v13 = v7;
  v15 = v16;
  id v8 = v5;
  id v14 = v8;
  [v6 enumerateLinePointsContextsUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  _Block_object_dispose(v16, 8);

  return v10;
}

- (id)interpolatedPathForProgress:(float)a3
{
  id v5 = [(GAXPathInterpolator *)self startingPath];
  id v6 = [(GAXPathInterpolator *)self endingPath];
  id v7 = [(GAXPathInterpolator *)self interpolationPathElementMappings];
  uint64_t Count = AXCArrayGetCount();
  if (Count)
  {
    uint64_t v9 = Count;
    v50 = v6;
  }
  else
  {
    id v10 = objc_msgSend(v6, "equivalentPathForDirection:", objc_msgSend(v5, "direction"));

    v11 = [(GAXPathInterpolator *)self _enhancedByAddingPointsMatchingPath:v10 originalPath:v5];
    unsigned int v12 = [(GAXPathInterpolator *)self _enhancedByAddingPointsMatchingPath:v5 originalPath:v10];
    id v13 = v11;

    id v14 = v12;
    uint64_t v65 = 0;
    v66 = (double *)&v65;
    uint64_t v67 = 0x5010000000;
    v68 = &unk_583BD;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 1;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1D0A4;
    v60[3] = &unk_5D740;
    v60[4] = &v65;
    v60[5] = &v61;
    [v13 enumerateLinePointsContextsUsingBlock:v60];
    v15 = v14;
    if (!*((unsigned char *)v62 + 24))
    {
      [v13 boundsCenter];
      double v17 = v16;
      double v19 = v18;
      [v14 boundsCenter];
      uint64_t v21 = v20;
      uint64_t v23 = v22;
      GAX_CGPointGetAngleFormedBySegmentToPoint(v17, v19, v66[4]);
      *((void *)v66 + 7) = v24;
      uint64_t v25 = AXCArrayCreate();
      v26 = (const void *)v25;
      v15 = v14;
      if (v25)
      {
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1D0D4;
        v59[3] = &unk_5D768;
        v59[4] = &v65;
        v59[5] = v21;
        v59[6] = v23;
        v59[7] = v25;
        [v14 enumerateLineSegmentContextsUsingBlock:v59];
        uint64_t v27 = AXCArrayGetCount();
        v15 = v14;
        if (v27)
        {
          uint64_t v28 = 0;
          unint64_t v29 = 0;
          uint64_t v30 = 0;
          double v31 = 1.79769313e308;
          do
          {
            if (v29 >= AXCArrayGetCount())
            {
              uint64_t v48 = AXCArrayGetCount();
              unint64_t v49 = v29;
              v47 = v26;
              _AXAssert();
            }
            uint64_t UnderlyingArray = _AXCArrayGetUnderlyingArray();
            uint64_t v33 = *(void *)(UnderlyingArray + v28 + 32);
            GAX_CGPointGetMiddleOfSegmentToPoint(*(double *)(UnderlyingArray + v28), *(double *)(UnderlyingArray + v28 + 8), *(double *)(UnderlyingArray + v28 + 48));
            AX_CGPointGetDistanceToPoint();
            if (v34 < v31)
            {
              uint64_t v30 = v33;
              double v31 = v34;
            }
            ++v29;
            v28 += 120;
          }
          while (v27 != v29);
          BOOL v35 = v31 >= 1.79769313e308 || v30 == 0;
          v15 = v14;
          if (!v35)
          {
            v15 = [v14 equivalentPathStartingWithElementAtIndex:v30];
          }
        }
        CFRelease(v26);
      }
    }
    objc_msgSend(v13, "length", v47, v48, v49);
    uint64_t v37 = v36;
    [v15 length];
    uint64_t v39 = v38;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1D1CC;
    v52[3] = &unk_5D790;
    id v5 = v13;
    id v53 = v5;
    v54 = self;
    uint64_t v56 = v37;
    uint64_t v57 = v39;
    id v40 = v15;
    id v55 = v40;
    v58 = v7;
    [v5 enumerateElementsUsingBlock:v52];
    uint64_t v9 = AXCArrayGetCount();
    v50 = v40;

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
  }
  v41 = objc_opt_new();
  if (v9)
  {
    uint64_t v42 = 0;
    for (unint64_t i = 0; i != v9; ++i)
    {
      if (i >= AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      uint64_t v44 = _AXCArrayGetUnderlyingArray();
      uint64_t v45 = *(unsigned int *)(v44 + v42);
      if (v45 > 1)
      {
        if (v45 == 4) {
          [v41 closePath];
        }
      }
      else
      {
        objc_msgSend(v41, "appendElementOfType:withSinglePoint:", v45, GAX_CGPointGetInterpolatedPointInSegmentToPoint(*(double *)(v44 + v42 + 8), *(double *)(v44 + v42 + 16), *(double *)(v44 + v42 + 24), *(double *)(v44 + v42 + 32), a3));
      }
      v42 += 40;
    }
  }

  return v41;
}

- (UIBezierPath)startingPath
{
  return self->_startingPath;
}

- (void)setStartingPath:(id)a3
{
}

- (UIBezierPath)endingPath
{
  return self->_endingPath;
}

- (void)setEndingPath:(id)a3
{
}

- (void)interpolationPathElementMappings
{
  return self->_interpolationPathElementMappings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingPath, 0);

  objc_storeStrong((id *)&self->_startingPath, 0);
}

@end