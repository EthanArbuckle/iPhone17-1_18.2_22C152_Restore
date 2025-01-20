@interface AXVisualElementGrouper
- (AXVisualElementGrouper)initWithHeuristics:(int64_t)a3;
- (double)maximumDistanceForAligningEdges;
- (double)maximumNeighbourDistance;
- (id)_groupablesForItems:(id)a3;
- (void)setMaximumDistanceForAligningEdges:(double)a3;
- (void)setMaximumNeighbourDistance:(double)a3;
@end

@implementation AXVisualElementGrouper

- (AXVisualElementGrouper)initWithHeuristics:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXVisualElementGrouper;
  v4 = -[AXElementGrouper initWithHeuristics:](&v9, sel_initWithHeuristics_);
  v5 = v4;
  if (v4) {
    BOOL v6 = (unint64_t)a3 > 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    double v7 = dbl_1BA6A62D8[a3];
    [(AXVisualElementGrouper *)v4 setMaximumNeighbourDistance:dbl_1BA6A62C0[a3]];
    [(AXVisualElementGrouper *)v5 setMaximumDistanceForAligningEdges:v7];
  }
  return v5;
}

- (id)_groupablesForItems:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (!v6)
  {
    v14 = v60;
    goto LABEL_55;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v13 = *(void *)v85;
  CGFloat v72 = v11;
  CGFloat v73 = v12;
  CGFloat v74 = y;
  CGFloat v75 = *MEMORY[0x1E4F1DB20];
  v14 = v60;
  do
  {
    uint64_t v15 = 0;
    do
    {
      double r1 = v12;
      if (*(void *)v85 != v13) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v84 + 1) + 8 * v15);
      [v16 frame];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      double v22 = v21;
      double v24 = v23;
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.width = v12;
      v92.size.height = v11;
      v111.origin.CGFloat y = v74;
      v111.origin.CGFloat x = v75;
      v111.size.height = v72;
      v111.size.width = v73;
      if (CGRectEqualToRect(v92, v111))
      {
        [v5 addObject:v16];
        double v11 = v24;
        CGFloat v12 = v22;
        CGFloat y = v20;
        CGFloat x = v18;
        goto LABEL_49;
      }
      v93.origin.CGFloat x = v18;
      CGFloat v65 = v20;
      v93.origin.CGFloat y = v20;
      v93.size.width = v22;
      v93.size.height = v24;
      CGFloat Height = CGRectGetHeight(v93);
      CGFloat v26 = v18;
      CGFloat v76 = v18;
      double v27 = Height;
      v94.origin.CGFloat x = v26;
      v94.origin.CGFloat y = v20;
      v94.size.width = v22;
      v94.size.height = v24;
      double Width = CGRectGetWidth(v94);
      if (v27 >= Width) {
        double v29 = Width;
      }
      else {
        double v29 = v27;
      }
      v95.origin.CGFloat x = x;
      v95.origin.CGFloat y = y;
      v95.size.width = v12;
      v95.size.height = v11;
      double v30 = CGRectGetHeight(v95);
      v96.origin.CGFloat x = x;
      v96.origin.CGFloat y = y;
      v96.size.width = v12;
      v96.size.height = v11;
      double v31 = CGRectGetWidth(v96);
      if (v30 < v31) {
        double v31 = v30;
      }
      double v32 = (v29 + v31) * 0.5;
      [(AXVisualElementGrouper *)self maximumDistanceForAligningEdges];
      if (v33 >= v32) {
        double v33 = v32;
      }
      double v67 = v33;
      v97.origin.CGFloat x = x;
      v97.origin.CGFloat y = y;
      v97.size.width = v12;
      v97.size.height = v11;
      double MinX = CGRectGetMinX(v97);
      v98.origin.CGFloat x = v76;
      v98.origin.CGFloat y = v65;
      v98.size.width = v22;
      v98.size.height = v24;
      double v66 = vabdd_f64(MinX, CGRectGetMinX(v98));
      v99.origin.CGFloat x = x;
      v99.origin.CGFloat y = y;
      v99.size.width = v12;
      v99.size.height = v11;
      double MaxX = CGRectGetMaxX(v99);
      v100.origin.CGFloat x = v76;
      v100.origin.CGFloat y = v65;
      v100.size.width = v22;
      v100.size.height = v24;
      double v64 = vabdd_f64(MaxX, CGRectGetMaxX(v100));
      v101.origin.CGFloat x = x;
      v101.origin.CGFloat y = y;
      v101.size.width = v12;
      v101.size.height = v11;
      double MinY = CGRectGetMinY(v101);
      v102.origin.CGFloat x = v76;
      v102.origin.CGFloat y = v65;
      v102.size.width = v22;
      v102.size.height = v24;
      CGFloat v62 = v11;
      double v63 = vabdd_f64(MinY, CGRectGetMinY(v102));
      double v71 = x;
      v103.origin.CGFloat x = x;
      v103.origin.CGFloat y = y;
      v103.size.width = v12;
      v103.size.height = v11;
      double MaxY = CGRectGetMaxY(v103);
      v104.origin.CGFloat x = v76;
      v104.origin.CGFloat y = v65;
      v104.size.width = v22;
      v104.size.height = v24;
      double v35 = vabdd_f64(MaxY, CGRectGetMaxY(v104));
      BOOL v36 = v64 < v67 && v66 < v67;
      BOOL v37 = v35 < v67 && v63 < v67;
      if ([v16 isGroup])
      {
        CGFloat v38 = v71;
        CGFloat v39 = v76;
        if (![v16 canBeGroupedWithOtherGroupables] || !v36 && !v37) {
          goto LABEL_46;
        }
      }
      else
      {
        CGFloat v38 = v71;
        CGFloat v39 = v76;
        if (!v36 && !v37) {
          goto LABEL_46;
        }
      }
      if (v8 != 2 && v37)
      {
        [(AXVisualElementGrouper *)self maximumNeighbourDistance];
        if (v41 >= v22 + v22) {
          double v42 = v22 + v22;
        }
        else {
          double v42 = v41;
        }
        v105.origin.CGFloat x = v38;
        v105.origin.CGFloat y = y;
        v105.size.height = v62;
        v105.size.width = r1;
        v112.origin.CGFloat x = v39;
        v112.origin.CGFloat y = v65;
        v112.size.width = v22;
        v112.size.height = v24;
        CGRect v106 = CGRectUnion(v105, v112);
        double v43 = vabdd_f64(v106.size.width, r1);
        double v44 = v22 + v42;
      }
      else
      {
        if (v8 == 1 || !v36)
        {
LABEL_46:
          if ([v5 count]) {
            [v60 addObject:v5];
          }
          uint64_t v48 = [MEMORY[0x1E4F1CA48] arrayWithObject:v16];

          uint64_t v8 = 0;
          v5 = (void *)v48;
          double v11 = v24;
          CGFloat v12 = v22;
          CGFloat y = v65;
          CGFloat x = v39;
          goto LABEL_49;
        }
        [(AXVisualElementGrouper *)self maximumNeighbourDistance];
        if (v46 >= v24 + v24) {
          double v47 = v24 + v24;
        }
        else {
          double v47 = v46;
        }
        v107.origin.CGFloat x = v38;
        v107.origin.CGFloat y = y;
        v107.size.width = r1;
        v107.size.height = v11;
        v113.origin.CGFloat x = v39;
        v113.origin.CGFloat y = v65;
        v113.size.width = v22;
        v113.size.height = v24;
        CGRect v108 = CGRectUnion(v107, v113);
        double v43 = vabdd_f64(v108.size.height, v11);
        double v44 = v24 + v47;
      }
      if (v43 >= v44) {
        goto LABEL_46;
      }
      v109.origin.CGFloat x = v38;
      v109.origin.CGFloat y = y;
      v109.size.height = v62;
      v109.size.width = r1;
      v114.origin.CGFloat x = v39;
      v114.origin.CGFloat y = v65;
      v114.size.width = v22;
      v114.size.height = v24;
      CGRect v110 = CGRectUnion(v109, v114);
      CGFloat x = v110.origin.x;
      CGFloat y = v110.origin.y;
      CGFloat v12 = v110.size.width;
      double v11 = v110.size.height;
      [v5 addObject:v16];
      if (!v8)
      {
        if (!v36 || v37) {
          uint64_t v8 = v37 && !v36;
        }
        else {
          uint64_t v8 = 2;
        }
      }
LABEL_49:
      ++v15;
    }
    while (v7 != v15);
    uint64_t v49 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
    uint64_t v7 = v49;
  }
  while (v49);
LABEL_55:

  if ([v5 count]) {
    [v14 addObject:v5];
  }
  if ([v14 count] == 1)
  {
    id v50 = [v14 lastObject];
    v83.receiver = self;
    v83.super_class = (Class)AXVisualElementGrouper;
    v51 = [(AXElementGrouper *)&v83 _groupablesForItems:v50];
  }
  else
  {
    v51 = [MEMORY[0x1E4F1CA48] array];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v50 = v14;
    uint64_t v52 = [v50 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v80 != v54) {
            objc_enumerationMutation(v50);
          }
          v56 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([v56 count] == 1)
          {
            v57 = [v56 firstObject];
            [v51 addObject:v57];
          }
          else
          {
            v78.receiver = self;
            v78.super_class = (Class)AXVisualElementGrouper;
            v57 = [(AXElementGrouper *)&v78 _groupablesForItems:v56];
            v58 = +[AXElementGroup groupWithElements:v57];
            [v58 setUserDefinedScanningBehaviorTraits:16];
            [v51 addObject:v58];
          }
        }
        uint64_t v53 = [v50 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v53);
      v14 = v60;
    }
  }

  return v51;
}

- (double)maximumNeighbourDistance
{
  return self->_maximumNeighbourDistance;
}

- (void)setMaximumNeighbourDistance:(double)a3
{
  self->_maximumNeighbourDistance = a3;
}

- (double)maximumDistanceForAligningEdges
{
  return self->_maximumDistanceForAligningEdges;
}

- (void)setMaximumDistanceForAligningEdges:(double)a3
{
  self->_maximumDistanceForAligningEdges = a3;
}

@end