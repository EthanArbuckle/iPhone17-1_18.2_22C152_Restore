@interface GAXRectangleShapeRecognizer
+ (BOOL)needsRotatedFingerPathToMinimizeBoundsArea;
+ (double)_maximumMarginOfErrorForPath:(id)a3;
+ (id)smoothPathForFingerPath:(id)a3 probabilityOfMatch:(double *)a4;
+ (void)_copyRectanglePointsContextsFromPath:(id)a3;
@end

@implementation GAXRectangleShapeRecognizer

+ (void)_copyRectanglePointsContextsFromPath:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 boundsCenter];
  double v13 = v12;
  double v62 = v14;
  v75.origin.x = v5;
  v75.origin.y = v7;
  v75.size.width = v9;
  v75.size.height = v11;
  double MinX = CGRectGetMinX(v75);
  v76.origin.x = v5;
  v76.origin.y = v7;
  v76.size.width = v9;
  v76.size.height = v11;
  double MaxX = CGRectGetMaxX(v76);
  v77.origin.x = v5;
  v77.origin.y = v7;
  v77.size.width = v9;
  v77.size.height = v11;
  CGFloat MinY = CGRectGetMinY(v77);
  v78.origin.x = v5;
  v78.origin.y = v7;
  v78.size.width = v9;
  v78.size.height = v11;
  CGFloat MaxY = CGRectGetMaxY(v78);
  GAX_CGPointGetAngleFormedBySegmentToPoint(v13, v62, MinX);
  uint64_t v61 = v19;
  GAX_CGPointGetAngleFormedBySegmentToPoint(v13, v62, MaxX);
  uint64_t v21 = v20;
  GAX_CGPointGetAngleFormedBySegmentToPoint(v13, v62, MaxX);
  uint64_t v23 = v22;
  GAX_CGPointGetAngleFormedBySegmentToPoint(v13, v62, MinX);
  BOOL v24 = 1;
  v74[0] = 1;
  v74[1] = v61;
  v74[2] = v21;
  v74[3] = 2;
  v74[4] = v21;
  v74[5] = v23;
  v74[6] = 3;
  v74[7] = v23;
  v74[8] = v25;
  v74[9] = 4;
  v74[10] = v25;
  v74[11] = 0x400921FB54442D18;
  v74[12] = 4;
  v74[13] = 0xC00921FB54442D18;
  v74[14] = v61;
  uint64_t v72 = 0;
  v73[0] = 1;
  *(double *)&v73[1] = MinX;
  *(CGFloat *)&v73[2] = MinY;
  *(double *)&v73[3] = MaxX;
  *(CGFloat *)&v73[4] = MinY;
  v73[5] = 2;
  *(double *)&v73[6] = MaxX;
  *(CGFloat *)&v73[7] = MinY;
  *(double *)&v73[8] = MaxX;
  *(CGFloat *)&v73[9] = MaxY;
  v73[10] = 3;
  *(double *)&v73[11] = MaxX;
  *(CGFloat *)&v73[12] = MaxY;
  *(double *)&v73[13] = MinX;
  *(CGFloat *)&v73[14] = MaxY;
  v73[15] = 4;
  *(double *)&v73[16] = MinX;
  *(CGFloat *)&v73[17] = MaxY;
  *(double *)&v73[18] = MinX;
  *(CGFloat *)&v73[19] = MinY;
  uint64_t v69 = 0;
  long long v71 = 0u;
  if (AXCArrayCreate())
  {
    unint64_t v26 = 0;
    do
    {
      unint64_t v27 = v26;
      if (v26 == 3) {
        break;
      }
      uint64_t v28 = qword_45918[v26 + 1];
      uint64_t v29 = AXCArrayCreate();
      *(&v69 + v28) = v29;
      unint64_t v26 = v27 + 1;
    }
    while (v29);
    BOOL v24 = v27 < 3;
  }
  v30 = (const void *)AXCArrayCreate();
  v31 = v30;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 1;
  v60 = v3;
  if (!v24 && v30)
  {
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_22088;
    v64[3] = &unk_5D970;
    *(double *)&v64[5] = v13;
    *(double *)&v64[6] = v62;
    v64[7] = 5;
    v64[8] = v74;
    v64[4] = &v65;
    v64[9] = &v69;
    v64[10] = v30;
    [v3 enumerateElementsUsingBlock:v64];
    v32 = (const void *)*(&v69 + v66[3]);
    uint64_t Count = AXCArrayGetCount();
    if (Count)
    {
      uint64_t v34 = 0;
      for (unint64_t i = 0; i != Count; ++i)
      {
        if (i >= AXCArrayGetCount())
        {
          AXCArrayGetCount();
          _AXAssert();
        }
        long long v63 = *(_OWORD *)(_AXCArrayGetUnderlyingArray() + v34);
        uint64_t v36 = AXCArrayGetCount();
        _AXCArrayPrepareForInsertingElementAtIndex();
        *(_OWORD *)(_AXCArrayGetUnderlyingArray() + 16 * v36) = v63;
        v34 += 16;
      }
    }
    if (v32) {
      CFRelease(v32);
    }
    uint64_t v37 = 0;
    v38 = v66;
    *(&v69 + v66[3]) = (uint64_t)v31;
    uint64_t v39 = v38[3];
    do
    {
      if (v39 == qword_45918[v37]) {
        goto LABEL_19;
      }
      ++v37;
    }
    while (v37 != 4);
    LOBYTE(v37) = 0;
LABEL_19:
    v31 = 0;
    unint64_t v40 = 0;
    while (1)
    {
      uint64_t v41 = qword_45918[((_BYTE)v40 + (_BYTE)v37) & 3];
      unint64_t v42 = AXCArrayGetCount();
      if (v42)
      {
        if (!AXCArrayGetCount())
        {
          AXCArrayGetCount();
          _AXAssert();
        }
        _AXCArrayGetUnderlyingArray();
        for (uint64_t j = 0; j != 20; j += 5)
        {
          if (v41 == v73[j]) {
            break;
          }
        }
        AX_CGPointGetDistanceToPoint();
        AX_CGPointGetDistanceToPoint();
        AX_CGPointGetDistanceToPoint();
        double v45 = v44;
        if (v44 > 0.0)
        {
          uint64_t v46 = 0;
          unint64_t v47 = 0;
          while (1)
          {
            if (v47 >= AXCArrayGetCount())
            {
              AXCArrayGetCount();
              _AXAssert();
            }
            uint64_t UnderlyingArray = _AXCArrayGetUnderlyingArray();
            uint64_t v49 = *(void *)(UnderlyingArray + v46);
            uint64_t v50 = *(void *)(UnderlyingArray + v46 + 8);
            AX_CGPointGetDistanceToPoint();
            double v52 = v51;
            if (!v31)
            {
              v31 = (const void *)AXCArrayCreate();
              if (!v31) {
                goto LABEL_41;
              }
            }
            uint64_t v53 = AXCArrayGetCount();
            _AXCArrayPrepareForInsertingElementAtIndex();
            uint64_t v54 = _AXCArrayGetUnderlyingArray() + 32 * v53;
            *(void *)uint64_t v54 = v49;
            *(void *)(v54 + 8) = v50;
            ++v47;
            *(void *)(v54 + 16) = v41;
            *(double *)(v54 + 24) = v52 / v45;
            v46 += 16;
            if (v47 >= v42) {
              goto LABEL_35;
            }
          }
        }
        if (v31)
        {
          CFRelease(v31);
          goto LABEL_40;
        }
      }
LABEL_35:
      if (v40++ > 2) {
        goto LABEL_41;
      }
    }
  }
  if (v30)
  {
    CFRelease(v30);
LABEL_40:
    v31 = 0;
  }
LABEL_41:
  for (uint64_t k = 0; k != 4; ++k)
  {
    uint64_t v57 = qword_45918[k];
    v58 = (const void *)*(&v69 + v57);
    if (v58)
    {
      CFRelease(v58);
      *(&v69 + v57) = 0;
    }
  }
  _Block_object_dispose(&v65, 8);

  return (void *)v31;
}

+ (double)_maximumMarginOfErrorForPath:(id)a3
{
  return (log((double)(unint64_t)[a3 numberOfElements]) + -1.62448075) * 0.0738300619;
}

+ (id)smoothPathForFingerPath:(id)a3 probabilityOfMatch:(double *)a4
{
  id v6 = a3;
  id v7 = [a1 _copyRectanglePointsContextsFromPath:v6];
  if (v7)
  {
    double v8 = v7;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    uint64_t Count = AXCArrayGetCount();
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    if (Count)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      while (2)
      {
        if (v16 >= AXCArrayGetCount())
        {
          uint64_t v46 = AXCArrayGetCount();
          unint64_t v47 = v16;
          double v45 = v8;
          _AXAssert();
        }
        uint64_t UnderlyingArray = _AXCArrayGetUnderlyingArray();
        v18 = (double *)(UnderlyingArray + v15);
        uint64_t v19 = *(void *)(UnderlyingArray + v15 + 16);
        double v20 = *(double *)(UnderlyingArray + v15 + 24);
        switch(v19)
        {
          case 1:
          case 3:
            v18 = (double *)(UnderlyingArray + 32 * v16 + 8);
            goto LABEL_8;
          case 2:
          case 4:
LABEL_8:
            double v21 = *v18;
            goto LABEL_9;
          default:
            double v21 = 0.0;
            if ((unint64_t)(v19 - 1) >= 4) {
              goto LABEL_10;
            }
LABEL_9:
            uint64_t v22 = (double *)(&v50 + v19);
            double v23 = *v22 + v21 * v20;
            double v24 = v20 + v22[1];
            *uint64_t v22 = v23;
            v22[1] = v24;
LABEL_10:
            ++v16;
            v15 += 32;
            if (Count != v16) {
              continue;
            }
            double v14 = *((double *)&v51 + 1);
            double v13 = *((double *)&v52 + 1);
            double v12 = *((double *)&v53 + 1);
            double v11 = *((double *)&v54 + 1);
            break;
        }
        break;
      }
    }
    uint64_t v25 = 0;
    if (v14 > 0.0 && v13 > 0.0 && v12 > 0.0 && v11 > 0.0)
    {
      uint64_t v25 = 0;
      double v26 = *(double *)&v52 / v13;
      double v27 = *(double *)&v54 / v11;
      if (v26 > *(double *)&v54 / v11)
      {
        double v28 = *(double *)&v51 / v14;
        double v29 = *(double *)&v53 / v12;
        if (v29 > *(double *)&v51 / v14)
        {
          CGFloat v30 = v26 - v27;
          CGFloat v31 = v29 - v28;
          v56.origin.x = *(double *)&v54 / v11;
          v56.origin.y = *(double *)&v51 / v14;
          v56.size.width = v26 - v27;
          v56.size.height = v31;
          CGRectGetMinX(v56);
          v57.origin.x = v27;
          v57.origin.y = v28;
          v57.size.width = v30;
          v57.size.height = v31;
          CGRectGetMaxX(v57);
          v58.origin.x = v27;
          v58.origin.y = v28;
          v58.size.width = v30;
          v58.size.height = v31;
          CGRectGetMinY(v58);
          v59.origin.x = v27;
          v59.origin.y = v28;
          v59.size.width = v30;
          v59.size.height = v31;
          CGRectGetMaxY(v59);
          v60.origin.x = v27;
          v60.origin.y = v28;
          v60.size.width = v30;
          v60.size.height = v31;
          CGFloat Width = CGRectGetWidth(v60);
          v61.origin.x = v27;
          v61.origin.y = v28;
          double v48 = v31;
          double v49 = v30;
          v61.size.width = v30;
          v61.size.height = v31;
          double Height = CGRectGetHeight(v61);
          double v34 = 0.0;
          if (Count)
          {
            double v35 = Height;
            uint64_t v36 = 0;
            for (unint64_t i = 0; i != Count; ++i)
            {
              if (i >= AXCArrayGetCount())
              {
                uint64_t v46 = AXCArrayGetCount();
                unint64_t v47 = i;
                double v45 = v8;
                _AXAssert();
              }
              uint64_t v38 = _AXCArrayGetUnderlyingArray();
              double v39 = *(double *)(v38 + v36 + 24);
              switch(*(void *)(v38 + v36 + 16))
              {
                case 1:
                case 3:
                  double v40 = Width;
                  break;
                case 2:
                case 4:
                  double v40 = v35;
                  break;
                default:
                  double v40 = 0.0;
                  break;
              }
              AX_CGPointGetDistanceToPoint();
              double Height = v41 / v40;
              double v34 = v34 + Height * v39;
              v36 += 32;
            }
          }
          objc_msgSend(a1, "_maximumMarginOfErrorForPath:", v6, Height, v45, v46, v47);
          uint64_t v25 = 0;
          if (v42 <= 0.0)
          {
            double v10 = 0.0;
          }
          else
          {
            double v43 = v42;
            double v10 = 0.0;
            if (v34 < v42)
            {
              uint64_t v25 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v27, v28, v49, v48);
              double v10 = 1.0 - v34 / v43;
            }
          }
        }
      }
    }
    CFRelease(v8);
    if (a4) {
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v25 = 0;
    double v10 = 0.0;
    if (a4) {
LABEL_36:
    }
      *a4 = v10;
  }

  return v25;
}

+ (BOOL)needsRotatedFingerPathToMinimizeBoundsArea
{
  return 1;
}

@end