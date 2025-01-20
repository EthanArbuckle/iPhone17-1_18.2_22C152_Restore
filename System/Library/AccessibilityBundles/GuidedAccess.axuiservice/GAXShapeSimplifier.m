@interface GAXShapeSimplifier
+ (id)smoothPathForFingerPath:(id)a3;
@end

@implementation GAXShapeSimplifier

+ (id)smoothPathForFingerPath:(id)a3
{
  id v3 = [a3 copyBezierPathPointsExcludingControlPoints];
  unint64_t Count = AXCArrayGetCount();
  if (Count < 3)
  {
    v5 = 0;
    goto LABEL_86;
  }
  unint64_t v6 = Count;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  double v9 = 1.79769313e308;
  double v10 = 1.79769313e308;
  do
  {
    if (v8 >= AXCArrayGetCount())
    {
      uint64_t v79 = AXCArrayGetCount();
      unint64_t v80 = v8;
      id v78 = v3;
      _AXAssert();
    }
    uint64_t UnderlyingArray = _AXCArrayGetUnderlyingArray();
    double v12 = *(double *)(UnderlyingArray + v7 + 8);
    if (v12 < v10 || (v12 == v10 ? (BOOL v13 = *(double *)(UnderlyingArray + v7) < v9) : (BOOL v13 = 0), v13))
    {
      double v10 = *(double *)(UnderlyingArray + v7 + 8);
      double v9 = *(double *)(UnderlyingArray + v7);
    }
    ++v8;
    v7 += 16;
  }
  while (v6 != v8);
  v14 = (void *)AXCArrayCreate();
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  for (unint64_t i = 0; i != v6; ++i)
  {
    if (i >= AXCArrayGetCount())
    {
      uint64_t v79 = AXCArrayGetCount();
      unint64_t v80 = i;
      id v78 = v3;
      _AXAssert();
    }
    uint64_t v18 = _AXCArrayGetUnderlyingArray();
    double v19 = *(double *)(v18 + v15);
    double v20 = *(double *)(v18 + v15 + 8);
    if (v20 - v10 == 0.0) {
      long double v21 = 0.0;
    }
    else {
      long double v21 = atan2(v20 - v10, v19 - v9);
    }
    _AXCArrayPrepareForInsertingElementAtIndex();
    uint64_t v22 = _AXCArrayGetUnderlyingArray() + v16;
    *(long double *)uint64_t v22 = v21;
    *(double *)(v22 + 8) = v19;
    *(double *)(v22 + 16) = v20;
    v16 += 24;
    v15 += 16;
  }
  CFRelease(v3);
  AXCArraySort();
  v23 = (void *)AXCArrayCreate();
  if (!AXCArrayGetCount())
  {
    uint64_t v79 = AXCArrayGetCount();
    unint64_t v80 = 0;
    id v78 = v14;
    _AXAssert();
  }
  uint64_t v24 = _AXCArrayGetUnderlyingArray();
  uint64_t v25 = *(void *)v24;
  double v26 = *(double *)(v24 + 8);
  double v27 = *(double *)(v24 + 16);
  _AXCArrayPrepareForInsertingElementAtIndex();
  uint64_t v28 = _AXCArrayGetUnderlyingArray();
  *(void *)uint64_t v28 = v25;
  *(double *)(v28 + 8) = v26;
  *(double *)(v28 + 16) = v27;
  if (v26 != v9 || v27 != v10) {
    _AXAssert();
  }
  unint64_t v29 = AXCArrayGetCount();
  uint64_t v30 = 0;
  for (unint64_t j = 0; j != v6; ++j)
  {
    if (j >= AXCArrayGetCount())
    {
      uint64_t v79 = AXCArrayGetCount();
      unint64_t v80 = j;
      id v78 = v14;
      _AXAssert();
    }
    uint64_t v32 = _AXCArrayGetUnderlyingArray();
    double v34 = *(double *)(v32 + v30);
    double v33 = *(double *)(v32 + v30 + 8);
    double v35 = *(double *)(v32 + v30 + 16);
    unint64_t v36 = v29 - 1;
    if (v29 - 1 >= AXCArrayGetCount())
    {
      uint64_t v79 = AXCArrayGetCount();
      unint64_t v80 = v29 - 1;
      id v78 = v23;
      _AXAssert();
    }
    v37 = (double *)(_AXCArrayGetUnderlyingArray() + 24 * v36);
    double v39 = *v37;
    double v38 = v37[1];
    double v40 = v37[2];
    if (v29 > 1)
    {
      if (v34 != v39) {
        goto LABEL_42;
      }
      if (sqrt((v9 - v33) * (v9 - v33) + (v10 - v35) * (v10 - v35)) > sqrt((v9 - v38) * (v9 - v38)+ (v10 - v40) * (v10 - v40)))
      {
        _AXCArrayPrepareForInsertingElementAtIndex();
        v44 = (double *)(_AXCArrayGetUnderlyingArray() + 24 * v36);
        double *v44 = v34;
        v44[1] = v33;
        v44[2] = v35;
      }
    }
    else if (v34 != v39 || v33 != v38 || v35 != v40)
    {
LABEL_42:
      _AXCArrayPrepareForInsertingElementAtIndex();
      v43 = (double *)(_AXCArrayGetUnderlyingArray() + 24 * v29);
      double *v43 = v34;
      v43[1] = v33;
      v43[2] = v35;
      ++v29;
    }
    v30 += 24;
  }
  CFRelease(v14);
  if (v29 >= 3)
  {
    id v3 = (id)AXCArrayCreate();
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    for (unint64_t k = 0; k != 3; ++k)
    {
      if (k >= AXCArrayGetCount())
      {
        uint64_t v79 = AXCArrayGetCount();
        unint64_t v80 = k;
        id v78 = v23;
        _AXAssert();
      }
      uint64_t v48 = _AXCArrayGetUnderlyingArray();
      uint64_t v49 = *(void *)(v48 + v45 + 8);
      uint64_t v50 = *(void *)(v48 + v45 + 16);
      _AXCArrayPrepareForInsertingElementAtIndex();
      v51 = (void *)(_AXCArrayGetUnderlyingArray() + v46);
      void *v51 = v49;
      v51[1] = v50;
      v46 += 16;
      v45 += 24;
    }
    unint64_t v52 = AXCArrayGetCount();
    unint64_t v53 = v52;
    if (v52 >= v29)
    {
      unint64_t v54 = v52;
    }
    else
    {
      unint64_t v54 = v52;
      do
      {
        if (v54 - 2 >= AXCArrayGetCount())
        {
          uint64_t v79 = AXCArrayGetCount();
          unint64_t v80 = v54 - 2;
          id v78 = v3;
          _AXAssert();
        }
        v55 = (double *)(_AXCArrayGetUnderlyingArray() + 16 * (v54 - 2));
        double v56 = *v55;
        double v57 = v55[1];
        if (v54 - 1 >= AXCArrayGetCount())
        {
          uint64_t v79 = AXCArrayGetCount();
          unint64_t v80 = v54 - 1;
          id v78 = v3;
          _AXAssert();
        }
        v58 = (double *)(_AXCArrayGetUnderlyingArray() + 16 * (v54 - 1));
        double v60 = *v58;
        double v59 = v58[1];
        if (v53 >= AXCArrayGetCount())
        {
          uint64_t v79 = AXCArrayGetCount();
          unint64_t v80 = v53;
          id v78 = v23;
          _AXAssert();
        }
        uint64_t v61 = _AXCArrayGetUnderlyingArray() + 24 * v53;
        double v62 = *(double *)(v61 + 8);
        double v63 = *(double *)(v61 + 16);
        if ((v60 - v56) * (v63 - v57) - (v59 - v57) * (v62 - v56) <= 0.0 && v54 >= 3)
        {
          uint64_t v65 = 16 * v54 - 24;
          do
          {
            if (v54 - 3 >= AXCArrayGetCount())
            {
              uint64_t v79 = AXCArrayGetCount();
              unint64_t v80 = v54 - 3;
              id v78 = v3;
              _AXAssert();
            }
            uint64_t v66 = _AXCArrayGetUnderlyingArray();
            double v67 = *(double *)(v66 + v65 - 24);
            double v68 = *(double *)(v66 + v65 - 16);
            if (v54 - 2 >= AXCArrayGetCount())
            {
              uint64_t v79 = AXCArrayGetCount();
              unint64_t v80 = v54 - 2;
              id v78 = v3;
              _AXAssert();
            }
            --v54;
            uint64_t v69 = _AXCArrayGetUnderlyingArray();
            double v70 = (*(double *)(v69 + v65 - 8) - v67) * (v63 - v68) - (*(double *)(v69 + v65) - v68) * (v62 - v67);
            v65 -= 16;
          }
          while (v70 <= 0.0 && v54 > 2);
        }
        _AXCArrayPrepareForInsertingElementAtIndex();
        v72 = (double *)(_AXCArrayGetUnderlyingArray() + 16 * v54);
        double *v72 = v62;
        v72[1] = v63;
        ++v54;
        ++v53;
      }
      while (v53 != v29);
    }
    CFRelease(v23);
    v5 = objc_opt_new();
    if (!AXCArrayGetCount())
    {
      uint64_t v79 = AXCArrayGetCount();
      unint64_t v80 = 0;
      id v78 = v3;
      _AXAssert();
    }
    v73 = (double *)_AXCArrayGetUnderlyingArray();
    objc_msgSend(v5, "moveToPoint:", *v73, v73[1]);
    if (v54 >= 2)
    {
      uint64_t v74 = 0;
      for (unint64_t m = 1; m != v54; ++m)
      {
        if (m >= AXCArrayGetCount())
        {
          uint64_t v79 = AXCArrayGetCount();
          unint64_t v80 = m;
          id v78 = v3;
          _AXAssert();
        }
        uint64_t v76 = _AXCArrayGetUnderlyingArray();
        objc_msgSend(v5, "addLineToPoint:", *(double *)(v76 + v74 + 16), *(double *)(v76 + v74 + 24));
        v74 += 16;
      }
    }
    objc_msgSend(v5, "closePath", v78, v79, v80);
  }
  else
  {
    v5 = 0;
    id v3 = v23;
  }
LABEL_86:
  CFRelease(v3);

  return v5;
}

@end