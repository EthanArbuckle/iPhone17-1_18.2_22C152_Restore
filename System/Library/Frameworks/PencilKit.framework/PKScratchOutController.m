@interface PKScratchOutController
- (_BYTE)nonTextStrokeIntersectionBetweenAllStrokes:(void *)a3 textStrokesToDelete:(void *)a4 textStrokesToKeep:;
- (id)intersectedStrokesFilteredByCoverageThresholdForStroke:(void *)a3 intersectedStrokes:;
- (id)intersectedStrokesForStroke:(void *)a3 attachmentView:(void *)a4 drawing:;
@end

@implementation PKScratchOutController

- (id)intersectedStrokesForStroke:(void *)a3 attachmentView:(void *)a4 drawing:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v42 = v8;
  if (a1)
  {
    uint64_t v10 = [v8 strokeSpatialCache];
    v11 = (void *)v10;
    if (v10) {
      v12 = *(void **)(v10 + 24);
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    v14 = (void *)[v13 mutableCopy];

    v15 = [MEMORY[0x1E4F1CA80] set];
    v16 = [v7 path];
    v17 = [v16 pointAtIndex:0];
    [v17 location];
    double v19 = v18;
    double v21 = v20;

    v22 = [v7 path];
    uint64_t v23 = [v22 _pointsCount];

    if (v23)
    {
      uint64_t v24 = 0;
      while (1)
      {
        v25 = [v7 path];
        v26 = [v25 pointAtIndex:v24];
        [v26 location];
        double v28 = v27;
        double v30 = v29;

        v31 = objc_msgSend(v9, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v14, v28, v30, v19, v21);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v44 != v34) {
                objc_enumerationMutation(v32);
              }
              [v14 removeObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
          }
          while (v33);
        }

        v36 = [v32 set];
        [v15 unionSet:v36];

        if ((unint64_t)[v15 count] >= 0x1F5
          && (unint64_t)[v7 _pointsCount] > 0x1F4)
        {
          break;
        }
        if ((unint64_t)[v15 count] >= 0x3E9) {
          break;
        }

        ++v24;
        double v19 = v28;
        double v21 = v30;
        if (v24 == v23) {
          goto LABEL_17;
        }
      }
      v39 = os_log_create("com.apple.pencilkit", "Actions");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = [v15 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v48 = v40;
        _os_log_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_DEFAULT, "Scratch Out intersected %lu strokes, cancelling due to too many.", buf, 0xCu);
      }

      id v38 = [MEMORY[0x1E4F1CAD0] set];
    }
    else
    {
LABEL_17:
      if (![v15 count])
      {
        v37 = os_log_create("com.apple.pencilkit", "Actions");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v37, OS_LOG_TYPE_DEFAULT, "Scratch Out intersected 0 strokes.", buf, 2u);
        }
      }
      id v38 = v15;
    }
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (_BYTE)nonTextStrokeIntersectionBetweenAllStrokes:(void *)a3 textStrokesToDelete:(void *)a4 textStrokesToKeep:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    [MEMORY[0x1E4F1CA80] setWithSet:v18];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v13 += [v9 containsObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
      double v16 = (double)v13;
    }
    else
    {
      double v16 = 0.0;
    }

    a1[8] = (double)(unint64_t)[v11 count] * 0.7 <= v16;
    [v11 minusSet:v10];
    [v11 unionSet:v9];
    a1 = [v11 allObjects];
  }

  return a1;
}

- (id)intersectedStrokesFilteredByCoverageThresholdForStroke:(void *)a3 intersectedStrokes:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v42 = a3;
  if (a1)
  {
    v5 = _PKSignpostLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    id v7 = _PKSignpostLog();
    id v8 = v7;
    os_signpost_id_t spid = v6;
    unint64_t v41 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1C48540E6, buf, 2u);
    }

    id v9 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_INFO, "BEGIN \"intersectedStrokesFilteredByCoverage\"", buf, 2u);
    }

    long long v44 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStroke:]((uint64_t)v10, v43);
    uint64_t v69 = 0;
    long long v67 = 0u;
    long long v68 = 0u;
    *(_OWORD *)lineWidth = 0u;
    long long v66 = 0u;
    *(_OWORD *)buf = 0u;
    id v11 = objc_msgSend(v43, "path", -[PKAveragePointGenerator currentStrokePoint]((uint64_t)v10, (double *)buf));
    uint64_t v12 = (const CGPath *)[v11 _newPathRepresentation];
    maskPath = CGPathCreateCopyByStrokingPath(v12, 0, lineWidth[1], kCGLineCapRound, kCGLineJoinRound, 0.0);

    if (maskPath)
    {
      -[PKAveragePointGenerator reset]((uint64_t)v10);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      obCFIndex j = v42;
      uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      if (v13)
      {
        uint64_t v47 = *(void *)v61;
        do
        {
          uint64_t v48 = v13;
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v61 != v47) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            -[PKAveragePointGenerator addStroke:]((uint64_t)v10, v14);
            [(PKAveragePointGenerator *)(uint64_t)v10 currentStrokePoint];
            long long v66 = *(_OWORD *)&transform.tx;
            long long v67 = v57;
            long long v68 = v58;
            uint64_t v69 = v59;
            *(_OWORD *)buf = *(_OWORD *)&transform.a;
            *(_OWORD *)lineWidth = *(_OWORD *)&transform.c;
            memset(&transform, 0, sizeof(transform));
            if (v14) {
              [v14 transform];
            }
            v15 = objc_msgSend(v14, "path", spid);
            double v16 = (const CGPath *)[v15 _newPathRepresentation];

            v17 = CGPathCreateCopyByStrokingPath(v16, &transform, lineWidth[1], kCGLineCapRound, kCGLineJoinRound, 0.0);
            CopyByFlattening = CGPathCreateCopyByFlattening(v17, 1.0);
            long long v19 = CopyByFlattening;
            if (CopyByFlattening)
            {
              __p = 0;
              v54 = 0;
              uint64_t v55 = 0;
              PKPointsFromPath(CopyByFlattening, (const void **)&__p, 6.0, 0.0);
              double v20 = __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke((uint64_t)__p, (uint64_t)v54);
              CopyByIntersectingPath = CGPathCreateCopyByIntersectingPath(v17, maskPath, 1);
              CFArrayRef SeparateComponents = CGPathCreateSeparateComponents(CopyByIntersectingPath, 1);
              CFArrayRef v23 = SeparateComponents;
              double v24 = 0.0;
              if (SeparateComponents)
              {
                CFIndex Count = CFArrayGetCount(SeparateComponents);
                if (Count >= 1)
                {
                  for (CFIndex j = 0; j != Count; ++j)
                  {
                    ValueAtIndex = (const CGPath *)CFArrayGetValueAtIndex(v23, j);
                    uint64_t v50 = 0;
                    uint64_t v51 = 0;
                    uint64_t v52 = 0;
                    PKPointsFromPath(ValueAtIndex, (const void **)&v50, 6.0, 0.0);
                    double v28 = v10;
                    double v29 = (void *)v50;
                    double v30 = __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke(v50, v51);
                    if (v29)
                    {
                      uint64_t v51 = (uint64_t)v29;
                      operator delete(v29);
                    }
                    double v24 = v24 + v30;
                    uint64_t v10 = v28;
                  }
                }
              }
              CFRelease(v23);
              if (v24 / v20 > 0.03) {
                objc_msgSend(v44, "addObject:", v14, v24 / v20);
              }
              CGPathRelease(v16);
              CGPathRelease(v17);
              CGPathRelease(v19);
              CGPathRelease(CopyByIntersectingPath);
              -[PKAveragePointGenerator reset]((uint64_t)v10);
              if (__p)
              {
                v54 = __p;
                operator delete(__p);
              }
            }
            else
            {
              CGPathRelease(v16);
              CGPathRelease(v17);
              CGPathRelease(0);
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
        }
        while (v13);
      }

      CGPathRelease(maskPath);
      v31 = _PKSignpostLog();
      id v32 = v31;
      if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(transform.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C44F8000, v32, OS_SIGNPOST_INTERVAL_END, spid, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1C48540E6, (uint8_t *)&transform, 2u);
      }

      uint64_t v33 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_INFO, "END \"intersectedStrokesFilteredByCoverage\"", (uint8_t *)&transform, 2u);
      }

      uint64_t v34 = (void *)[v44 copy];
    }
    else
    {
      v35 = os_log_create("com.apple.pencilkit", "Actions");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEFAULT, "Could not generate a stroking path for scratch out stroke.", (uint8_t *)&transform, 2u);
      }

      v36 = _PKSignpostLog();
      v37 = v36;
      if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
      {
        LOWORD(transform.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C44F8000, v37, OS_SIGNPOST_INTERVAL_END, v6, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1C48540E6, (uint8_t *)&transform, 2u);
      }

      id v38 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1C44F8000, v38, OS_LOG_TYPE_INFO, "END \"intersectedStrokesFilteredByCoverage\"", (uint8_t *)&transform, 2u);
      }

      uint64_t v34 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v34 = 0;
  }

  return v34;
}

double __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 - a1;
  if (a2 - a1 < 1)
  {
    double result = 0.0;
  }
  else
  {
    unint64_t v3 = v2 >> 4;
    if (v2 >> 4 <= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = v2 >> 4;
    }
    uint64_t v5 = a1 + 16 * v3;
    double v7 = *(double *)(v5 - 16);
    double v6 = *(double *)(v5 - 8);
    id v8 = (double *)(a1 + 8);
    double v9 = 0.0;
    do
    {
      double v11 = *(v8 - 1);
      double v10 = *v8;
      double v9 = v9 + v11 * v6 - *v8 * v7;
      v8 += 2;
      double v7 = v11;
      double v6 = v10;
      --v4;
    }
    while (v4);
    double result = v9 * 0.5;
  }
  if (result < 0.0) {
    return -result;
  }
  return result;
}

@end