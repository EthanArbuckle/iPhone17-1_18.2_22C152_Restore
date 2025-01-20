@interface PKClusteringUtility
+ (CGRect)constrainRect:(CGRect)result;
+ (double)arrayAverage:(id)a3;
+ (double)estimatedWordDistanceForStrokes:(id)a3 lineHeight:(double)a4;
+ (id)_clusteredStrokesWithInitialStrokes:(id)a3 selectionType:(int64_t)a4 visibleStrokes:(id)a5 approximateLineHeight:(double)a6 approximateLineCenter:(double)a7;
+ (id)_geometricBasedStrokeClusteringFromPoint:(CGPoint)a3 visibleStrokes:(id)a4 selectionType:(int64_t)a5 inputType:(int64_t)a6;
+ (id)horizontalDistanceBetweenStrokes:(id)a3 lineHeight:(double)a4;
+ (id)kMeansCluster:(int)a3 values:(id)a4 clusterError:(double)a5 maxIterations:(int)a6;
+ (void)_fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleStrokes:(id)a5 completion:(id)a6;
@end

@implementation PKClusteringUtility

+ (id)horizontalDistanceBetweenStrokes:(id)a3 lineHeight:(double)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v40 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v12 = v6;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
        v14 = v12;
        if (!v13) {
          goto LABEL_26;
        }
        uint64_t v15 = v13;
        uint64_t v16 = *(void *)v43;
        double v17 = 1.79769313e308;
        double v41 = 1.79769313e308;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v43 != v16) {
              objc_enumerationMutation(v12);
            }
            v19 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            if (v11 != v19)
            {
              [v11 _bounds];
              double MidY = CGRectGetMidY(v54);
              [v19 _bounds];
              if (vabdd_f64(CGRectGetMidY(v55), MidY) < a4)
              {
                [v19 _bounds];
                double MidX = CGRectGetMidX(v56);
                [v11 _bounds];
                double v22 = CGRectGetMidX(v57);
                [v11 _bounds];
                double v24 = v23;
                CGFloat v26 = v25;
                CGFloat v28 = v27;
                CGFloat v30 = v29;
                [v19 _bounds];
                double v35 = DKDDistanceToRectFromRect(v24, v26, v28, v30, v31, v32, v33, v34);
                if (MidX <= v22)
                {
                  double v36 = v41;
                  if (v35 < v41) {
                    double v36 = v35;
                  }
                  double v41 = v36;
                }
                else if (v35 < v17)
                {
                  double v17 = v35;
                }
              }
            }
          }
          uint64_t v15 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v15);

        if (v17 != 1.79769313e308)
        {
          v37 = [NSNumber numberWithDouble:v17];
          [v40 addObject:v37];
        }
        double v38 = v41;
        if (v41 != 1.79769313e308)
        {
          v14 = [NSNumber numberWithDouble:v41];
          [v40 addObject:v14];
LABEL_26:

          continue;
        }
      }
      uint64_t v8 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v38);
    }
    while (v8);
  }

  return v40;
}

+ (double)estimatedWordDistanceForStrokes:(id)a3 lineHeight:(double)a4
{
  v4 = +[PKClusteringUtility horizontalDistanceBetweenStrokes:a3 lineHeight:a4];
  double v5 = 7.0;
  if ((unint64_t)[v4 count] >= 2)
  {
    id v6 = [(id)objc_opt_class() kMeansCluster:2 values:v4 clusterError:500 maxIterations:0.5];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v7 sortUsingSelector:sel_compare_];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    [v8 floatValue];
    double v10 = v9;

    v11 = [v7 objectAtIndexedSubscript:1];
    [v11 floatValue];
    double v13 = v12;

    double v5 = (v10 + v13) * 0.5;
  }

  return v5;
}

+ (id)kMeansCluster:(int)a3 values:(id)a4 clusterError:(double)a5 maxIterations:(int)a6
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([v8 count] >= (unint64_t)(int)v7)
  {
    double v10 = [MEMORY[0x1E4F1CA48] array];
    float v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = v7;
    if ((int)v7 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        double v13 = [MEMORY[0x1E4F1CA48] array];
        [v10 addObject:v13];

        v14 = [v8 objectAtIndexedSubscript:v12];
        [v9 setObject:v14 atIndexedSubscript:v12];

        ++v12;
      }
      while (v7 != v12);
    }
    int v47 = 0;
    long long v44 = v10;
    id v45 = v8;
    uint64_t v15 = v10;
    while (1)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      obuint64_t j = v8;
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v49 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v52 != v49) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v20 = v7;
            if ((int)v7 < 1)
            {
              int v22 = 0;
            }
            else
            {
              uint64_t v21 = 0;
              int v22 = 0;
              double v23 = 1.79769313e308;
              do
              {
                [v19 floatValue];
                float v25 = v24;
                CGFloat v26 = [v9 objectAtIndexedSubscript:v21];
                [v26 floatValue];
                double v28 = vabds_f32(v25, v27);

                if (v23 > v28)
                {
                  int v22 = v21;
                  double v23 = v28;
                }
                ++v21;
              }
              while (v11 != v21);
            }
            double v29 = [v15 objectAtIndexedSubscript:v22];
            [v29 addObject:v19];

            uint64_t v7 = v20;
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v17);
      }

      if ((int)v7 < 1)
      {
        long long v42 = v44;
        id v8 = v45;
        goto LABEL_30;
      }
      v50 = v15;
      uint64_t v30 = 0;
      unsigned __int8 v31 = 0;
      do
      {
        double v32 = [v50 objectAtIndexedSubscript:v30];
        +[PKClusteringUtility arrayAverage:v32];
        double v34 = v33;

        double v35 = [v9 objectAtIndexedSubscript:v30];
        [v35 floatValue];
        BOOL v37 = vabdd_f64(v34, v36) < a5;

        v31 |= v37;
        double v38 = [NSNumber numberWithDouble:v34];
        [v9 replaceObjectAtIndex:v30 withObject:v38];

        ++v30;
      }
      while (v11 != v30);
      if ((v31 & (v47 < a6)) == 0) {
        break;
      }
      v39 = [MEMORY[0x1E4F1CA48] array];

      int v40 = v7;
      do
      {
        double v41 = [MEMORY[0x1E4F1CA48] array];
        [v39 addObject:v41];

        --v40;
      }
      while (v40);
      ++v47;
      uint64_t v15 = v39;
      id v8 = v45;
    }
    long long v42 = v50;
    id v8 = v45;
LABEL_30:
  }
  else
  {
    float v9 = 0;
  }

  return v9;
}

+ (double)arrayAverage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "floatValue", (void)v13);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (CGRect)constrainRect:(CGRect)result
{
  double v3 = fmax(result.size.width, 10.0);
  double v4 = fmax(result.size.height, 10.0);
  result.size.height = v4;
  result.size.width = v3;
  return result;
}

+ (void)_fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleStrokes:(id)a5 completion:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  v107 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (v9 >= y) {
    double v13 = y;
  }
  else {
    double v13 = v9;
  }
  if (v9 >= y) {
    double v14 = x;
  }
  else {
    double v14 = v10;
  }
  double v104 = v13;
  double v105 = v14;
  if (v9 >= y) {
    double v15 = v9;
  }
  else {
    double v15 = y;
  }
  double v103 = v15;
  long long v126 = 0u;
  long long v127 = 0u;
  if (v9 >= y) {
    double v16 = v10;
  }
  else {
    double v16 = x;
  }
  double v106 = v16;
  long long v128 = 0uLL;
  long long v129 = 0uLL;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v126 objects:v133 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    if (v9 >= y) {
      double v22 = v10;
    }
    else {
      double v22 = x;
    }
    if (v9 >= y) {
      double v23 = v9;
    }
    else {
      double v23 = y;
    }
    double v110 = v23;
    double v112 = v22;
    if (v9 >= y) {
      double v24 = x;
    }
    else {
      double v24 = v10;
    }
    double v108 = v24;
    if (v9 >= y) {
      double v25 = y;
    }
    else {
      double v25 = v9;
    }
    uint64_t v26 = *(void *)v127;
    double v27 = 1.79769313e308;
    double v28 = 1.79769313e308;
    double v29 = v107;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v127 != v26) {
          objc_enumerationMutation(v17);
        }
        unsigned __int8 v31 = *(void **)(*((void *)&v126 + 1) + 8 * i);
        [v31 _bounds];
        CGFloat v32 = v135.origin.x;
        CGFloat v33 = v135.origin.y;
        CGFloat width = v135.size.width;
        CGFloat height = v135.size.height;
        double MidX = CGRectGetMidX(v135);
        v136.origin.double x = v32;
        v136.origin.double y = v33;
        v136.size.CGFloat width = width;
        v136.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v136);
        double v38 = sqrt((MidY - v25) * (MidY - v25) + (MidX - v108) * (MidX - v108));
        if (v38 < v28)
        {
          id v39 = v31;

          double v28 = v38;
          unint64_t v21 = (unint64_t)v39;
        }
        double v40 = sqrt((MidY - v110) * (MidY - v110) + (MidX - v112) * (MidX - v112));
        if (v40 < v27)
        {
          id v41 = v31;

          double v27 = v40;
          unint64_t v20 = (unint64_t)v41;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v126 objects:v133 count:16];
    }
    while (v19);
  }
  else
  {
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    double v29 = v107;
  }

  if (!(v21 | v20))
  {
    v12[2](v12, v29);
    goto LABEL_81;
  }
  v102 = v12;
  if (v21 || !v20)
  {
    double v43 = v105;
    double v42 = v106;
    double v45 = v103;
    double v44 = v104;
    if (v20 || !v21) {
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v21 = v20;
    double v43 = v105;
    double v42 = v106;
    double v45 = v103;
    double v44 = v104;
  }
  unint64_t v20 = (unint64_t)(id)v21;
  unint64_t v21 = v20;
LABEL_46:
  uint64_t v46 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v21];
  uint64_t v47 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v20];
  [(id)v21 _bounds];
  double v49 = v48;
  [(id)v21 _bounds];
  v111 = (void *)v46;
  v50 = +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:v46 selectionType:3 visibleStrokes:v17 approximateLineHeight:v49 approximateLineCenter:CGRectGetMidY(v137)];
  [(id)v20 _bounds];
  double v52 = v51;
  [(id)v20 _bounds];
  v109 = (void *)v47;
  uint64_t v53 = +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:v47 selectionType:3 visibleStrokes:v17 approximateLineHeight:v52 approximateLineCenter:CGRectGetMidY(v138)];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v113 = v17;
  id v54 = v17;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v122 objects:v132 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v123 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v122 + 1) + 8 * j);
        [v59 _bounds];
        CGFloat v60 = v139.origin.x;
        CGFloat v61 = v139.origin.y;
        CGFloat v62 = v139.size.width;
        CGFloat v63 = v139.size.height;
        CGRectGetMidX(v139);
        v140.origin.double x = v60;
        v140.origin.double y = v61;
        v140.size.CGFloat width = v62;
        v140.size.CGFloat height = v63;
        double v64 = CGRectGetMidY(v140);
        if (v64 > v44 && v64 < v45) {
          [v29 addObject:v59];
        }
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v122 objects:v132 count:16];
    }
    while (v56);
  }

  [v29 minusOrderedSet:v50];
  v66 = v29;
  v67 = (void *)v53;
  [v66 minusOrderedSet:v53];
  v68 = [MEMORY[0x1E4F1CA70] orderedSet];
  v69 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v70 = v50;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v118 objects:v131 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v119;
    do
    {
      for (uint64_t k = 0; k != v72; ++k)
      {
        if (*(void *)v119 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v118 + 1) + 8 * k);
        [v75 _bounds];
        if (v76 > v43) {
          [v68 addObject:v75];
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v118 objects:v131 count:16];
    }
    while (v72);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v77 = v67;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v114 objects:v130 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v115;
    do
    {
      for (uint64_t m = 0; m != v79; ++m)
      {
        if (*(void *)v115 != v80) {
          objc_enumerationMutation(v77);
        }
        v82 = *(void **)(*((void *)&v114 + 1) + 8 * m);
        [v82 _bounds];
        if (v83 < v42) {
          [v69 addObject:v82];
        }
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v114 objects:v130 count:16];
    }
    while (v79);
  }

  +[PKDrawing _boundingBoxForStrokes:v68];
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  CGFloat v89 = v88;
  double v91 = v90;
  +[PKDrawing _boundingBoxForStrokes:v69];
  CGFloat v93 = v92;
  CGFloat v95 = v94;
  CGFloat v97 = v96;
  CGFloat v99 = v98;
  v141.origin.double x = v85;
  v141.origin.double y = v87;
  v141.size.CGFloat width = v89;
  v141.size.CGFloat height = v91;
  CGRectGetMidX(v141);
  v142.origin.double x = v85;
  v142.origin.double y = v87;
  v142.size.CGFloat width = v89;
  v142.size.CGFloat height = v91;
  double v100 = CGRectGetMidY(v142);
  v143.origin.double x = v93;
  v143.origin.double y = v95;
  v143.size.CGFloat width = v97;
  v143.size.CGFloat height = v99;
  CGRectGetMidX(v143);
  v144.origin.double x = v93;
  v144.origin.double y = v95;
  v144.size.CGFloat width = v97;
  v144.size.CGFloat height = v99;
  if (vabdd_f64(v100, CGRectGetMidY(v144)) >= v91)
  {
    double v29 = v107;
    [v107 unionOrderedSet:v68];
    v101 = v69;
    uint64_t v12 = v102;
  }
  else
  {
    [v68 intersectOrderedSet:v69];
    v101 = v68;
    uint64_t v12 = v102;
    double v29 = v107;
  }
  [v29 unionOrderedSet:v101];
  v12[2](v12, v29);

  id v17 = v113;
LABEL_81:
}

+ (id)_geometricBasedStrokeClusteringFromPoint:(CGPoint)a3 visibleStrokes:(id)a4 selectionType:(int64_t)a5 inputType:(int64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    if (a6) {
      double v17 = 10.0;
    }
    else {
      double v17 = 20.0;
    }
    double v18 = 0.0;
    double v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v21, "intersectsPoint:boundsOutset:minimumStrokeThreshold:", x, y, v17, v17))
        {
          [v11 addObject:v21];
          [v21 _bounds];
          double v19 = v19 + v22;
          [v21 _bounds];
          double v18 = v18 + CGRectGetMidY(v52);
          double v23 = [v21 _groupID];

          if (v23)
          {
            double v24 = [v21 _groupID];
            [v12 addObject:v24];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v15);
  }
  else
  {
    double v18 = 0.0;
    double v19 = 0.0;
  }

  if ([v12 count])
  {
    id v38 = v13;
    int64_t v39 = a5;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          uint64_t v31 = objc_msgSend(v30, "_groupID", v38, v39, (void)v40);
          if (v31)
          {
            CGFloat v32 = (void *)v31;
            CGFloat v33 = [v30 _groupID];
            int v34 = [v12 containsObject:v33];

            if (v34) {
              [v11 addObject:v30];
            }
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v27);
    }

    id v13 = v38;
    a5 = v39;
  }
  if (objc_msgSend(v11, "count", v38, v39))
  {
    +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:](PKClusteringUtility, "_clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:", v11, a5, v13, v19 / (double)(unint64_t)[v11 count], v18 / (double)(unint64_t)objc_msgSend(v11, "count"));
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = v11;
  }
  float v36 = v35;

  return v36;
}

+ (id)_clusteredStrokesWithInitialStrokes:(id)a3 selectionType:(int64_t)a4 visibleStrokes:(id)a5 approximateLineHeight:(double)a6 approximateLineCenter:(double)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v67 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v12];
  if (a4 != 1)
  {
    +[PKClusteringUtility estimatedWordDistanceForStrokes:v13 lineHeight:a6];
    double v15 = 3.0;
    int64_t v65 = a4;
    id v66 = v12;
    if (a4 == 3)
    {
      double v16 = -50.0;
    }
    else if (a4 == 2)
    {
      double v16 = -v14;
    }
    else
    {
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        a6 = a6 + a6;
      }
      else {
        a6 = 0.0;
      }
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        double v15 = -10.0;
      }
      else {
        double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        double v16 = -50.0;
      }
      else {
        double v16 = *MEMORY[0x1E4F1DAD8];
      }
    }
    id v68 = v13;
    while (1)
    {
      double v17 = [MEMORY[0x1E4F1CA70] orderedSet];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v18 = v67;
      uint64_t v70 = [v18 countByEnumeratingWithState:&v78 objects:v84 count:16];
      if (v70)
      {
        uint64_t v69 = *(void *)v79;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v79 != v69) {
              objc_enumerationMutation(v18);
            }
            recta[0] = v19;
            unint64_t v20 = *(void **)(*((void *)&v78 + 1) + 8 * v19);
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v21 = v13;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v83 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v75;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v75 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                  if (([v18 containsObject:v26] & 1) == 0)
                  {
                    [v20 _bounds];
                    CGRect v88 = CGRectInset(v87, v16, v15);
                    +[PKClusteringUtility constrainRect:](PKClusteringUtility, "constrainRect:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
                    CGFloat v28 = v27;
                    CGFloat v30 = v29;
                    CGFloat v32 = v31;
                    CGFloat v34 = v33;
                    [v26 _bounds];
                    objc_msgSend(a1, "constrainRect:");
                    v93.origin.double x = v35;
                    v93.origin.double y = v36;
                    v93.size.CGFloat width = v37;
                    v93.size.CGFloat height = v38;
                    v89.origin.double x = v28;
                    v89.origin.double y = v30;
                    v89.size.CGFloat width = v32;
                    v89.size.CGFloat height = v34;
                    BOOL v39 = CGRectIntersectsRect(v89, v93);
                    [v26 _bounds];
                    double v40 = vabdd_f64(a7, CGRectGetMidY(v90));
                    if (v39 && v40 < a6) {
                      objc_msgSend(v17, "addObject:", v26, v40);
                    }
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v74 objects:v83 count:16];
              }
              while (v23);
            }

            uint64_t v19 = recta[0] + 1;
            id v13 = v68;
          }
          while (recta[0] + 1 != v70);
          uint64_t v70 = [v18 countByEnumeratingWithState:&v78 objects:v84 count:16];
        }
        while (v70);
      }

      if (![v17 count]) {
        break;
      }
      long long v42 = [v17 array];
      [v18 addObjectsFromArray:v42];
    }
    if (v65 == 5) {
      [v18 addObjectsFromArray:v13];
    }
    +[PKDrawing _boundingBoxForStrokes:v18];
    recta[0] = v43;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    memset(&recta[1], 0, 32);
    long long v72 = 0u;
    long long v73 = 0u;
    id v50 = v13;
    uint64_t v51 = [v50 countByEnumeratingWithState:&recta[1] objects:v82 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)recta[3];
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)recta[3] != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void **)(recta[2] + 8 * j);
          [v55 _bounds];
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          CGFloat v61 = v60;
          CGFloat v63 = v62;
          *(void *)&v91.origin.double x = recta[0];
          v91.origin.double y = v45;
          v91.size.CGFloat width = v47;
          v91.size.CGFloat height = v49;
          CGRect v92 = CGRectInset(v91, -0.01, -0.01);
          v94.origin.double x = v57;
          v94.origin.double y = v59;
          v94.size.CGFloat width = v61;
          v94.size.CGFloat height = v63;
          if (CGRectContainsRect(v92, v94)) {
            [v18 addObject:v55];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&recta[1] objects:v82 count:16];
      }
      while (v52);
    }

    id v12 = v66;
  }

  return v67;
}

@end