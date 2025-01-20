@interface CPZoneMaker
- (BOOL)overlap:(id)a3 with:(id)a4;
- (id)newZoneForStraddlersFrom:(id)a3;
- (unsigned)categorizeGraphicsIn:(id)a3;
- (void)addObjectsToStraddler:(id)a3 from:(id)a4;
- (void)addZonesWithBoundaryIn:(id)a3 withBorder:(id)a4;
- (void)cutHorizontalBorders:(id)a3 whereObscuredByShape:(id)a4;
- (void)cutVerticalBorders:(id)a3 whereObscuredByShape:(id)a4;
- (void)dealloc;
- (void)makeZonesIn:(id)a3;
- (void)makeZonesWithBoundaryIn:(id)a3;
- (void)mergeQualifyingRectanglesIn:(id)a3;
- (void)splitByRotatation:(id)a3 inPage:(id)a4;
@end

@implementation CPZoneMaker

- (id)newZoneForStraddlersFrom:(id)a3
{
  v4 = 0;
  uint64_t v5 = [a3 count];
  if (v5)
  {
    unsigned int v6 = v5 - 1;
    do
    {
      uint64_t v7 = v6;
      uint64_t v8 = [a3 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v4)
          {
            v4 = objc_alloc_init(CPZone);
            [(CPChunk *)v4 setShrinksWithChildren:0];
            [(CPZone *)v4 setIsStraddleZone:1];
          }
          [(CPChunk *)v4 add:v8];
          [a3 removeObjectAtIndex:v6];
        }
      }
      --v6;
    }
    while (v7);
  }
  return v4;
}

- (void)addObjectsToStraddler:(id)a3 from:(id)a4
{
  uint64_t v6 = [a4 count];
  if (v6)
  {
    unsigned int v7 = v6 - 1;
    do
    {
      uint64_t v8 = v7;
      uint64_t v9 = [a4 objectAtIndex:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [a3 add:v9];
          [a4 removeObjectAtIndex:v7];
        }
      }
      --v7;
    }
    while (v8);
  }
}

- (void)cutVerticalBorders:(id)a3 whereObscuredByShape:(id)a4
{
  [a4 renderedBounds];
  double v56 = v7;
  CGFloat v57 = v6;
  double v54 = v9;
  double v55 = v8;
  uint64_t v10 = [a4 zOrder];
  if ([a3 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    double v13 = v54;
    BOOL v14 = v54 < 0.0 || v56 < 0.0;
    do
    {
      v15 = objc_msgSend(a3, "objectAtIndex:", v11, v13);
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v56;
      double v24 = v57;
      if (v14)
      {
        v58.size.double width = v56;
        v58.origin.double x = v57;
        v58.size.height = v54;
        v58.origin.y = v55;
        *(CGRect *)&double v24 = CGRectStandardize(v58);
      }
      double v26 = v24 + v25;
      BOOL v27 = v23 < 0.0 || v21 < 0.0;
      if (v27)
      {
        v59.origin.double x = v17;
        v59.origin.y = v19;
        v59.size.double width = v21;
        v59.size.height = v23;
        if (COERCE_DOUBLE(CGRectStandardize(v59)) >= v26) {
          return;
        }
        v60.origin.double x = v17;
        v60.origin.y = v19;
        v60.size.double width = v21;
        v60.size.height = v23;
        CGRect v61 = CGRectStandardize(v60);
        double x = v61.origin.x;
        double width = v61.size.width;
      }
      else
      {
        double x = v17;
        double width = v21;
        if (v17 >= v26) {
          return;
        }
      }
      double v30 = v57;
      if (v14)
      {
        v62.size.double width = v56;
        v62.origin.double x = v57;
        v62.size.height = v54;
        v62.origin.y = v55;
        *(void *)&double v30 = (unint64_t)CGRectStandardize(v62);
      }
      double v31 = v17;
      if (v27)
      {
        v63.origin.double x = v17;
        v63.origin.y = v19;
        v63.size.double width = v21;
        v63.size.height = v23;
        *(void *)&double v31 = (unint64_t)CGRectStandardize(v63);
      }
      if (v30 >= v31 || v26 <= x + width || v10 <= [v15 zOrder]) {
        goto LABEL_42;
      }
      double v34 = v54;
      double v33 = v55;
      if (v14)
      {
        v64.size.double width = v56;
        v64.origin.double x = v57;
        v64.size.height = v54;
        v64.origin.y = v55;
        *(CGRect *)&double v32 = CGRectStandardize(v64);
        double v34 = v35;
      }
      double v36 = v19;
      double v37 = v23;
      if (v27)
      {
        v65.origin.double x = v17;
        double v38 = v33;
        v65.origin.y = v19;
        v65.size.double width = v21;
        v65.size.height = v23;
        *(CGRect *)&double v32 = CGRectStandardize(v65);
        double v36 = v39;
        double v33 = v38;
        double v37 = v40;
      }
      double v41 = v55;
      if (v14)
      {
        v66.size.double width = v56;
        v66.origin.double x = v57;
        double v53 = v33;
        v66.size.height = v54;
        v66.origin.y = v55;
        *(CGRect *)&double v32 = CGRectStandardize(v66);
        double v41 = v42;
        double v33 = v53;
      }
      double v43 = v33 + v34;
      double v44 = v36 + v37;
      if (v27)
      {
        v67.origin.double x = v17;
        v67.origin.y = v19;
        v67.size.double width = v21;
        v67.size.height = v23;
        *(CGRect *)&double v32 = CGRectStandardize(v67);
        if (v41 > v45) {
          goto LABEL_31;
        }
        v68.origin.double x = v17;
        v68.origin.y = v19;
        v68.size.double width = v21;
        v68.size.height = v23;
        *(CGRect *)&double v32 = CGRectStandardize(v68);
        double v19 = v46;
      }
      else if (v41 > v19)
      {
LABEL_31:
        double v47 = v55;
        if (v14)
        {
          v69.size.double width = v56;
          v69.origin.double x = v57;
          v69.size.height = v54;
          v69.origin.y = v55;
          *(CGRect *)&double v32 = CGRectStandardize(v69);
        }
        if (v47 >= v44) {
          goto LABEL_42;
        }
        if (v43 < v44)
        {
          v48 = objc_msgSend(v15, "copy", v32);
          objc_msgSend(v48, "setBounds:", v17, v43, v21, v44 - v43);
          uint64_t v12 = (v12 + 1);
          [v48 addToArray:a3 atIndex:v12];
        }
        double v49 = v55 - v19;
        v50 = v15;
        double v51 = v17;
        double v52 = v19;
LABEL_40:
        objc_msgSend(v50, "setBounds:", v51, v52, v21, v49);
        goto LABEL_42;
      }
      if (v43 > v19)
      {
        if (v43 >= v44)
        {
          objc_msgSend(v15, "removeFromArrayAtIndex:", v12, v32);
          LODWORD(v12) = v12 - 1;
          goto LABEL_42;
        }
        double v49 = v44 - v43;
        v50 = v15;
        double v51 = v17;
        double v52 = v43;
        goto LABEL_40;
      }
LABEL_42:
      uint64_t v12 = (v12 + 1);
      uint64_t v11 = (int)v12;
    }
    while ([a3 count] > (unint64_t)(int)v12);
  }
}

- (void)cutHorizontalBorders:(id)a3 whereObscuredByShape:(id)a4
{
  [a4 renderedBounds];
  double v41 = v7;
  double v42 = v6;
  double v43 = v9;
  CGFloat v44 = v8;
  uint64_t v10 = [a4 zOrder];
  if ([a3 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    double v13 = v43;
    BOOL v14 = v43 < 0.0 || v41 < 0.0;
    do
    {
      v15 = objc_msgSend(a3, "objectAtIndex:", v11, v13);
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v43;
      double v24 = v44;
      if (v14)
      {
        v45.size.double width = v41;
        v45.origin.double x = v42;
        v45.size.double height = v43;
        v45.origin.double y = v44;
        *(CGRect *)(&v24 - 1) = CGRectStandardize(v45);
      }
      double v26 = v24 + v25;
      BOOL v27 = v23 < 0.0 || v21 < 0.0;
      if (v27)
      {
        v46.origin.double x = v17;
        v46.origin.double y = v19;
        v46.size.double width = v21;
        v46.size.double height = v23;
        CGRect v47 = CGRectStandardize(v46);
        if (v47.origin.y >= v26) {
          return;
        }
        v48.origin.double x = v17;
        v48.origin.double y = v19;
        v48.size.double width = v21;
        v48.size.double height = v23;
        CGRect v49 = CGRectStandardize(v48);
        double y = v49.origin.y;
        double height = v49.size.height;
      }
      else
      {
        double y = v19;
        double height = v23;
        if (v19 >= v26) {
          return;
        }
      }
      double v30 = v44;
      if (v14)
      {
        v50.size.double width = v41;
        v50.origin.double x = v42;
        v50.size.double height = v43;
        v50.origin.double y = v44;
        CGRect v51 = CGRectStandardize(v50);
        double v30 = v51.origin.y;
      }
      double v31 = v19;
      if (v27)
      {
        v52.origin.double x = v17;
        v52.origin.double y = v19;
        v52.size.double width = v21;
        v52.size.double height = v23;
        *(CGRect *)(&v31 - 1) = CGRectStandardize(v52);
      }
      if (v30 >= v31 || v26 <= y + height || v10 <= [v15 zOrder]) {
        goto LABEL_38;
      }
      double v33 = v41;
      double v32 = v42;
      if (v14)
      {
        v53.size.double width = v41;
        v53.origin.double x = v42;
        v53.size.double height = v43;
        v53.origin.double y = v44;
        *(CGRect *)&double v32 = CGRectStandardize(v53);
      }
      double v34 = v32 + v33;
      if (v27)
      {
        v54.origin.double x = v17;
        v54.origin.double y = v19;
        v54.size.double width = v21;
        v54.size.double height = v23;
        CGRect v55 = CGRectStandardize(v54);
        double v35 = v55.origin.x + v55.size.width;
        v55.origin.double x = v17;
        v55.origin.double y = v19;
        v55.size.double width = v21;
        v55.size.double height = v23;
        if (v42 > COERCE_DOUBLE(CGRectStandardize(v55))) {
          goto LABEL_27;
        }
        v56.origin.double x = v17;
        v56.origin.double y = v19;
        v56.size.double width = v21;
        v56.size.double height = v23;
        *(void *)&double v17 = (unint64_t)CGRectStandardize(v56);
      }
      else
      {
        double v35 = v17 + v21;
        if (v42 > v17)
        {
LABEL_27:
          double v36 = v42;
          if (v14)
          {
            v57.size.double width = v41;
            v57.origin.double x = v42;
            v57.size.double height = v43;
            v57.origin.double y = v44;
            *(void *)&double v36 = (unint64_t)CGRectStandardize(v57);
          }
          if (v36 >= v35) {
            goto LABEL_38;
          }
          if (v34 < v35)
          {
            double v37 = (void *)[v15 copy];
            objc_msgSend(v37, "setBounds:", v34, v19, v35 - v34, v23);
            uint64_t v12 = (v12 + 1);
            [v37 addToArray:a3 atIndex:v12];
          }
          double v38 = v42 - v17;
          double v39 = v15;
          double v40 = v17;
LABEL_36:
          objc_msgSend(v39, "setBounds:", v40, v19, v38, v23);
          goto LABEL_38;
        }
      }
      if (v34 > v17)
      {
        if (v34 >= v35)
        {
          [v15 removeFromArrayAtIndex:v12];
          LODWORD(v12) = v12 - 1;
          goto LABEL_38;
        }
        double v38 = v35 - v34;
        double v39 = v15;
        double v40 = v34;
        goto LABEL_36;
      }
LABEL_38:
      uint64_t v12 = (v12 + 1);
      uint64_t v11 = (int)v12;
    }
    while ([a3 count] > (unint64_t)(int)v12);
  }
}

- (void)splitByRotatation:(id)a3 inPage:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v6 = [a3 count];
  double v7 = (void *)[a3 charactersInZone];
  if (v7)
  {
    double v8 = v7;
    if ([v7 length])
    {
      int v43 = v6;
      [v8 sortBy:compareByRotation];
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v10 = *(double *)([v8 charAtIndex:0] + 168);
      if (v10 > 350.0) {
        double v10 = v10 + -360.0;
      }
      double v49 = v10;
      [v8 splitToSubsequences:v9 whereTrue:splitRotationZonesCondition passing:&v49];
      if ((unint64_t)[v9 count] < 2)
      {
        [v8 averageRotation];
        double v30 = v29;
        objc_msgSend(a3, "setRotationAngle:");
        __double2 v31 = __sincos_stret(v30);
        int v32 = [v8 length];
        if (v32 >= 1)
        {
          int v33 = v32;
          uint64_t v34 = 0;
          double v35 = -v31.__sinval;
          do
          {
            double v36 = (double *)[v8 charAtIndex:v34];
            double v37 = v36[12];
            double v38 = v36[13];
            v36[12] = v38 * v31.__sinval + v31.__cosval * v37 + 0.0;
            v36[13] = v38 * v31.__cosval + v35 * v37 + 0.0;
            double v39 = v36[14];
            double v40 = v36[15];
            v36[14] = v31.__sinval * v40 + v31.__cosval * v39 + 0.0;
            v36[15] = v31.__cosval * v40 + v35 * v39 + 0.0;
            uint64_t v34 = (v34 + 1);
          }
          while (v33 != v34);
        }
      }
      else
      {
        [a3 setCharactersInZone:0];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v46 != v13) {
                objc_enumerationMutation(v9);
              }
              v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              double v16 = objc_alloc_init(CPZone);
              [(CPObject *)v16 setPage:a4];
              [(CPChunk *)v16 setShrinksWithChildren:0];
              [(CPZone *)v16 setCharactersInZone:v15];
              [v15 averageRotation];
              double v18 = v17;
              -[CPZone setRotationAngle:](v16, "setRotationAngle:");
              __double2 v19 = __sincos_stret(v18);
              int v20 = [v15 length];
              if (v20 >= 1)
              {
                int v21 = v20;
                uint64_t v22 = 0;
                double v23 = -v19.__sinval;
                do
                {
                  double v24 = (double *)[v15 charAtIndex:v22];
                  double v25 = v24[12];
                  double v26 = v24[13];
                  v24[12] = v26 * v19.__sinval + v19.__cosval * v25 + 0.0;
                  v24[13] = v26 * v19.__cosval + v23 * v25 + 0.0;
                  double v27 = v24[14];
                  double v28 = v24[15];
                  v24[14] = v19.__sinval * v28 + v19.__cosval * v27 + 0.0;
                  v24[15] = v19.__cosval * v28 + v23 * v27 + 0.0;
                  uint64_t v22 = (v22 + 1);
                }
                while (v21 != v22);
              }
              [a3 add:v16];
            }
            uint64_t v12 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v12);
        }
      }

      int v6 = v43;
    }
  }
  if (v6 >= 1)
  {
    uint64_t v41 = 0;
    do
    {
      uint64_t v42 = [a3 childAtIndex:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CPZoneMaker *)self splitByRotatation:v42 inPage:a4];
      }
      uint64_t v41 = (v41 + 1);
    }
    while (v6 != v41);
  }
}

- (void)makeZonesWithBoundaryIn:(id)a3
{
  id v3 = a3;
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = [a3 count];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  v164 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  double v7 = objc_alloc_init(CPZoneBorder);
  [(CPZoneBorder *)v7 setSide:1 ofPage:v3];
  [(CPZoneBorder *)v7 addToArray:v5];

  double v8 = objc_alloc_init(CPZoneBorder);
  [(CPZoneBorder *)v8 setSide:2 ofPage:v3];
  [(CPZoneBorder *)v8 addToArray:v6];

  id v9 = objc_alloc_init(CPZoneBorder);
  [(CPZoneBorder *)v9 setSide:3 ofPage:v3];
  [(CPZoneBorder *)v9 addToArray:v5];

  double v10 = objc_alloc_init(CPZoneBorder);
  [(CPZoneBorder *)v10 setSide:4 ofPage:v3];
  [(CPZoneBorder *)v10 addToArray:v6];

  v163 = v5;
  v154 = v3;
  if (v4)
  {
    uint64_t v11 = 0;
    unsigned int v153 = v4;
    do
    {
      uint64_t v12 = (void *)[v3 childAtIndex:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v13 = [v12 zoneGraphicType];
        switch(v13)
        {
          case 3:
            double v17 = (const CGPath *)[v12 path];
            double v18 = v17;
            long long v177 = 0u;
            long long v178 = 0u;
            memset(&v176[8], 0, 48);
            *(void *)v176 = v12;
            if (v17)
            {
              LODWORD(info) = 0;
              CGPathApply(v17, &info, (CGPathApplierFunction)countElements);
              uint64_t v19 = info;
            }
            else
            {
              uint64_t v19 = 0;
            }
            *(_DWORD *)&v176[12] = v19;
            memset(&v176[16], 0, 32);
            *(void *)&v176[48] = malloc_type_malloc(16 * v19, 0x1000040451B5BE8uLL);
            LODWORD(v177) = 0;
            *((void *)&v177 + 1) = v5;
            *(void *)&long long v178 = v6;
            DWORD2(v178) = [v5 count];
            HIDWORD(v178) = [v6 count];
            CGPathApply(v18, v176, (CGPathApplierFunction)findLineSegments);
            free(*(void **)&v176[48]);
            [v164 addObject:v12];
            break;
          case 2:
            [v12 bounds];
            double v21 = v20;
            double v23 = v22;
            double v166 = v24;
            double v160 = v25;
            [v12 renderedBounds];
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;
            [v12 lineWidth];
            uint64_t v34 = 0;
            uint64_t v35 = 0;
            *(double *)v176 = v27;
            *(double *)&v176[8] = v29;
            *(double *)&v176[16] = v27;
            *(double *)&long long v177 = v29;
            *(double *)&v176[24] = v33 + v29;
            *(double *)&v176[40] = v33 + v29;
            *(double *)&v176[32] = v31 + v27;
            *(double *)&v176[48] = v31 + v27;
            double v37 = v36 * 0.5;
            double v156 = v21 + v36 * 0.5;
            double v158 = v23 + v36 * 0.5;
            double v38 = 0.0;
            double v39 = (double *)&v176[8];
            do
            {
              uint64_t v40 = v34 + 1;
              double v41 = *(v39 - 1);
              double v42 = *v39;
              int v43 = (double *)&v176[16 * ((v34 + 1) & 3)];
              double v45 = *v43;
              double v44 = v43[1];
              switch((int)v34)
              {
                case 0:
                  double v38 = fmax(v156 - v41, 0.0);
                  double v41 = v41 + v38 * 0.5;
                  uint64_t v35 = 2;
                  goto LABEL_19;
                case 1:
                  double v38 = fmax(v37 + v42 - v23 - v160, 0.0);
                  double v42 = v42 + v38 * -0.5;
                  uint64_t v35 = 3;
                  goto LABEL_21;
                case 2:
                  double v38 = fmax(v37 + v41 - v21 - v166, 0.0);
                  double v41 = v41 + v38 * -0.5;
                  uint64_t v35 = 4;
LABEL_19:
                  double v45 = v41;
                  break;
                case 3:
                  double v38 = fmax(v158 - v42, 0.0);
                  double v42 = v42 + v38 * 0.5;
                  uint64_t v35 = 1;
LABEL_21:
                  double v44 = v42;
                  break;
                default:
                  break;
              }
              long long v46 = (void *)[v12 copy];
              objc_msgSend(v46, "makeLineFromVertex:toVertex:", v41, v42, v45, v44);
              [v46 setLineWidth:v38];
              long long v47 = [[CPZoneBorder alloc] initWithGraphicObject:v46];

              if (!v47) {
                break;
              }
              long long v48 = objc_alloc_init(CPZoneBorderNeighbor);
              [(CPZoneBorderNeighbor *)v48 setNeighborShape:v12];
              [(CPZoneBorderNeighbor *)v48 setShapeSide:v35];
              [(CPZoneBorder *)v47 addNeighbor:v48];

              double v49 = [(CPZoneBorder *)v47 isHorizontal] ? v163 : v6;
              [(CPZoneBorder *)v47 addToArray:v49];

              v39 += 2;
              uint64_t v34 = v40;
            }
            while (v40 != 4);
            [v164 addObject:v12];
            uint64_t v5 = v163;
            id v3 = v154;
            unsigned int v4 = v153;
            break;
          case 1:
            BOOL v14 = [[CPZoneBorder alloc] initWithGraphicObject:v12];
            if (!v14) {
              goto LABEL_31;
            }
            v15 = v14;
            if ([(CPZoneBorder *)v14 isHorizontal]) {
              double v16 = v5;
            }
            else {
              double v16 = v6;
            }
            [(CPZoneBorder *)v15 addToArray:v16];

            break;
        }
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v11 != v4);
  }
LABEL_31:
  [v5 sortUsingSelector:sel_compareYBounds_];
  [v6 sortUsingSelector:sel_compareXBounds_];
  [v164 sortUsingSelector:sel_compareZ_];
  int v50 = [v164 count];
  if (v50 >= 1)
  {
    unint64_t v51 = v50 + 1;
    do
    {
      CGRect v52 = (void *)[v164 objectAtIndex:(v51 - 2)];
      if ([v52 isUprightRectangle])
      {
        unint64_t v53 = [v52 fillColor];
        if (v53)
        {
          double v61 = (v53 & 0x8000000000000000) != 0
              ? CGTaggedColorGetAlpha(v53, v54, v55, v56, v57, v58, v59, v60)
              : *(double *)(v53 + 8 * *(void *)(v53 + 56) + 56);
          if (v61 >= 1.0)
          {
            [(CPZoneMaker *)self cutHorizontalBorders:v5 whereObscuredByShape:v52];
            [(CPZoneMaker *)self cutVerticalBorders:v6 whereObscuredByShape:v52];
          }
        }
      }
      --v51;
    }
    while (v51 > 1);
  }
  [(CPCharSequence *)self->charactersOnPage map:cutBordersCrossingText passing:v5];
  [(CPCharSequence *)self->charactersOnPage map:cutBordersCrossingText passing:v6];
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v62 = 1;
    int v63 = 1;
    do
    {
      uint64_t v64 = [v5 objectAtIndex:v62];
      if (v63 >= 1)
      {
        CGRect v65 = (void *)v64;
        for (int i = 0; i < v63; ++i)
        {
          uint64_t v67 = [v5 objectAtIndex:i];
          if ([v65 continues:v67])
          {
            [v65 combine:v67];
            --i;
            --v63;
          }
        }
      }
      uint64_t v62 = ++v63;
    }
    while ([v5 count] > (unint64_t)v63);
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v68 = 1;
    int v69 = 1;
    do
    {
      uint64_t v70 = [v6 objectAtIndex:v68];
      if (v69 >= 1)
      {
        v71 = (void *)v70;
        for (int j = 0; j < v69; ++j)
        {
          uint64_t v73 = [v6 objectAtIndex:j];
          if ([v71 continues:v73])
          {
            [v71 combine:v73];
            --j;
            --v69;
          }
        }
      }
      uint64_t v68 = ++v69;
    }
    while ([v6 count] > (unint64_t)v69);
  }
  if ([v5 count])
  {
    uint64_t v74 = 0;
    int v75 = 0;
    do
    {
      v76 = (void *)[v5 objectAtIndex:v74];
      if ([v76 graphicObjectCount] > 0x32 || (objc_msgSend(v76, "bounds"), v77 > 25.0))
      {
        [(CPZoneMaker *)self addZonesWithBoundaryIn:v154 withBorder:v76];
        --v75;
      }
      uint64_t v74 = ++v75;
    }
    while ([v5 count] > (unint64_t)v75);
  }
  if ([v6 count])
  {
    uint64_t v78 = 0;
    int v79 = 0;
    do
    {
      v80 = (void *)[v6 objectAtIndex:v78];
      if ([v80 graphicObjectCount] > 0x32 || (objc_msgSend(v80, "bounds"), v81 > 25.0))
      {
        [(CPZoneMaker *)self addZonesWithBoundaryIn:v154 withBorder:v80];
        --v79;
      }
      uint64_t v78 = ++v79;
    }
    while ([v6 count] > (unint64_t)v79);
  }
  memset(v176, 0, 32);
  if ([v5 count])
  {
    unint64_t v82 = 0;
    do
    {
      v83 = (void *)[v5 objectAtIndex:v82];
      if ([v6 count])
      {
        unint64_t v84 = 0;
        do
        {
          uint64_t v85 = [v6 objectAtIndex:v84];
          if ([v83 intersectsWith:v85 atRect:v176]) {
            +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v83, v85, *(_OWORD *)v176, *(double *)&v176[16], *(double *)&v176[24]);
          }
          ++v84;
        }
        while ([v6 count] > v84);
      }
      ++v82;
    }
    while ([v5 count] > v82);
  }
  if ([v5 count])
  {
    uint64_t v86 = 0;
    int v87 = 0;
    do
    {
      v88 = (void *)[v5 objectAtIndex:v86];
      if ([v88 intersectionCount] <= 1)
      {
        if ([v88 intersectionCount] == 1)
        {
          [v88 removeLooseThreadsStartingFrom:0];
          int v87 = [v5 indexOfObject:v88];
        }
        [v88 removeFromArray];
        --v87;
      }
      uint64_t v86 = ++v87;
    }
    while ([v5 count] > (unint64_t)v87);
  }
  if ([v6 count])
  {
    uint64_t v89 = 0;
    int v90 = 0;
    do
    {
      v91 = (void *)[v6 objectAtIndex:v89];
      if ([v91 intersectionCount] <= 1)
      {
        if ([v91 intersectionCount] == 1)
        {
          [v91 removeLooseThreadsStartingFrom:0];
          int v90 = [v6 indexOfObject:v91];
        }
        [v91 removeFromArray];
        --v90;
      }
      uint64_t v89 = ++v90;
    }
    while ([v6 count] > (unint64_t)v90);
  }
  if ([v5 count])
  {
    unint64_t v92 = 0;
    do
    {
      v93 = (void *)[v5 objectAtIndex:v92];
      [v93 trimToLastIntersections];
      [v93 instantiateVectors];
      ++v92;
    }
    while ([v5 count] > v92);
  }
  if ([v6 count])
  {
    unint64_t v94 = 0;
    do
    {
      v95 = (void *)[v6 objectAtIndex:v94];
      [v95 trimToLastIntersections];
      [v95 instantiateVectors];
      ++v94;
    }
    while ([v6 count] > v94);
  }
  v96 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  while ([v6 count])
  {
    LODWORD(info) = 0;
    uint64_t v97 = [v6 count];
    if (!v97) {
      break;
    }
    uint64_t v98 = 0;
    while (1)
    {
      v99 = (void *)[v6 objectAtIndex:v98];
      if ([v99 hasVectorGoingForward:1 startingAtIndex:&info]) {
        break;
      }
      if (v97 == ++v98) {
        goto LABEL_109;
      }
    }
    v100 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    if ([v99 extractCycleTo:v100 goingForward:1 startingAtIndex:info])
    {
      if (+[CPZoneBorder clockwiseWindingNumberOfShapeWithBorders:v100] <= 0)v101 = &off_1E529ED08; {
      else
      }
        v101 = off_1E529ED00;
      id v102 = objc_alloc_init(*v101);
      [v102 setPage:v154];
      [v102 setShrinksWithChildren:0];
      [v102 setZoneBorders:v100];
      [v96 addObject:v102];
    }
  }
LABEL_109:
  [v96 sortUsingSelector:sel_compareArea_];
  unsigned int v103 = [v96 count];
  unint64_t v104 = v103;
  v105 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v103];
  unsigned int v167 = v103;
  if (v103)
  {
    unint64_t v106 = 0;
    uint64_t v107 = 1;
    do
    {
      uint64_t v108 = [v96 objectAtIndex:v106++];
      uint64_t v109 = v107;
      if (v106 >= v104)
      {
LABEL_114:
        [v105 addObject:v108];
      }
      else
      {
        while (1)
        {
          v110 = (void *)[v96 objectAtIndex:v109];
          if ([v110 contains:v108]) {
            break;
          }
          if (v167 == ++v109) {
            goto LABEL_114;
          }
        }
        [v110 add:v108];
      }
      ++v107;
    }
    while (v106 != v104);
  }
  unint64_t v159 = v104;
  id v174 = 0;
  unsigned int v111 = [(CPCharSequence *)self->charactersOnPage length];
  if (v111)
  {
    unsigned int v112 = v111;
    uint64_t v113 = 0;
    v114 = 0;
    unsigned int v155 = v111;
    do
    {
      while (1)
      {
        v115 = [(CPCharSequence *)self->charactersOnPage charAtIndex:v113];
        findZone(&v115->var0.var0.origin.x, v105, &v174);
        id v116 = v174;
        if (v174) {
          break;
        }
LABEL_122:
        id v174 = 0;
        if (!v114)
        {
          v114 = objc_alloc_init(CPZone);
          [(CPObject *)v114 setPage:v154];
          [(CPZone *)v114 setIsStraddleZone:1];
          [(CPChunk *)v114 setShrinksWithChildren:0];
        }
        [(CPZone *)v114 addPDFChar:v115];
        uint64_t v113 = (v113 + 1);
        if (v113 >= v112) {
          goto LABEL_135;
        }
      }
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v116 = (id)[v116 parent];
        if (!v116) {
          goto LABEL_122;
        }
      }
      v161 = v114;
      info = v116;
      uint64_t v173 = v113;
      LODWORD(v114) = v112 - v113;
      BOOL v117 = [(CPCharSequence *)self->charactersOnPage mapWithIndex:continueZone from:(v113 + 1) length:v112 - v113 - 1 passing:&info];
      BOOL v118 = v117;
      if (v117) {
        v114 = (CPZone *)v114;
      }
      else {
        v114 = (CPZone *)(v173 - v113);
      }
      v119 = (void *)[v116 charactersInZone];
      if (v119)
      {
        v120 = v119;
        unsigned int v157 = [v119 length];
        [(CPCharSequence *)self->charactersOnPage copyToSubsequence:v120 from:v113 length:v114];
        [v116 updatedCharSequenceFrom:v157 length:v114];
      }
      else
      {
        id v121 = [(CPCharSequence *)self->charactersOnPage newSubsequenceFrom:v113 length:v114];
        [v116 setCharactersInZone:v121];
      }
      id v174 = info;
      uint64_t v113 = v173;
      v114 = v161;
      unsigned int v112 = v155;
    }
    while (!v118);
  }
  else
  {
    v114 = 0;
  }
LABEL_135:
  v162 = v114;
  int v122 = [v164 count];
  if (v122 >= 1)
  {
    uint64_t v123 = v122;
    do
    {
      v124 = (void *)[v164 objectAtIndex:(v123 - 1)];
      if ([v96 count])
      {
        unint64_t v125 = 0;
        do
        {
          v126 = (void *)[v96 objectAtIndex:v125];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ([v126 hasNeighborShape:v124])
            {
              [v126 swollenZoneBounds];
              CGFloat v128 = v127;
              CGFloat v130 = v129;
              CGFloat v132 = v131;
              CGFloat v134 = v133;
              [v124 bounds];
              double v139 = v138;
              if (v138 != INFINITY)
              {
                double v140 = v135;
                if (v135 != INFINITY)
                {
                  uint64_t v141 = v136;
                  uint64_t v142 = v137;
                  v180.origin.double x = v128;
                  v180.origin.double y = v130;
                  v180.size.double width = v132;
                  v180.size.double height = v134;
                  if (CGRectContainsRect(v180, *(CGRect *)&v139)) {
                    [v126 add:v124];
                  }
                }
              }
            }
          }
          ++v125;
        }
        while ([v96 count] > v125);
      }
    }
    while (v123-- >= 2);
  }
  v144 = (void *)[v154 newTakeChildren];
  if (v167)
  {
    uint64_t v145 = 0;
    do
    {
      v146 = (void *)[v96 objectAtIndex:v145];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v146 addContentFrom:v144];
      }
      ++v145;
    }
    while (v159 != v145);
  }
  v147 = v162;
  if (v162)
  {
    [(CPZoneMaker *)self addObjectsToStraddler:v162 from:v144];
    v148 = v154;
  }
  else
  {
    v147 = [(CPZoneMaker *)self newZoneForStraddlersFrom:v144];
    v148 = v154;
    if (!v147) {
      goto LABEL_157;
    }
  }
  [v105 addObject:v147];

LABEL_157:
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  uint64_t v149 = [v105 countByEnumeratingWithState:&v168 objects:v175 count:16];
  if (v149)
  {
    uint64_t v150 = v149;
    uint64_t v151 = *(void *)v169;
    do
    {
      for (uint64_t k = 0; k != v150; ++k)
      {
        if (*(void *)v169 != v151) {
          objc_enumerationMutation(v105);
        }
        [(CPZoneMaker *)self splitByRotatation:*(void *)(*((void *)&v168 + 1) + 8 * k) inPage:v148];
      }
      uint64_t v150 = [v105 countByEnumeratingWithState:&v168 objects:v175 count:16];
    }
    while (v150);
  }
  [v148 addChildren:v144];
  [v148 addChildren:v105];
}

- (void)addZonesWithBoundaryIn:(id)a3 withBorder:(id)a4
{
  int v6 = objc_msgSend(a3, "newTakeChildrenAmong:", objc_msgSend(a4, "graphicObjects"));
  double v7 = [CPCompoundGraphic alloc];
  [a4 bounds];
  double v8 = -[CPCompoundGraphic initWithGraphicObjects:withRenderedBounds:](v7, "initWithGraphicObjects:withRenderedBounds:", v6);

  [(CPObject *)v8 recomputeZOrder];
  [a3 add:v8];

  [a4 removeFromArray];
}

- (void)mergeQualifyingRectanglesIn:(id)a3
{
  unsigned int v4 = [a3 count];
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = 0;
    do
    {
      double v7 = (void *)[a3 childAtIndex:v6];
      if (canBeMerged(v7))
      {
        uint64_t v8 = [v7 fillColor];
        if (v8)
        {
          id v9 = (CGColor *)v8;
          [v7 bounds];
          uint64_t v14 = (v6 + 1);
          if (v14 < v5)
          {
            double v15 = v10;
            double v16 = v11;
            double v17 = fmax(v12, v13);
            double v18 = v17 * 0.00000011920929 + 1.17549435e-38 + v17 * 0.00000011920929 + 1.17549435e-38;
            double v55 = v11 + v13 + v18;
            double v56 = v13;
            double v57 = v12;
            double v54 = v15 + v12 + v18;
            while (1)
            {
              uint64_t v19 = objc_msgSend(a3, "childAtIndex:", v14, *(void *)&v54);
              if (canBeMerged(v19))
              {
                double v20 = (CGColor *)[v19 fillColor];
                if (v20)
                {
                  if (CGColorEqualToColor(v9, v20))
                  {
                    [v19 bounds];
                    double v25 = v24;
                    BOOL v27 = vabdd_f64(v15, v24) < v18;
                    double v26 = vabdd_f64(v57, v22);
                    BOOL v27 = v27 && v26 < v18;
                    BOOL v28 = !v27 || v16 > v18 + v21 + v23;
                    if (!v28 && v21 <= v55) {
                      break;
                    }
                    CGFloat v30 = v21;
                    CGFloat v31 = v22;
                    CGFloat v32 = v23;
                    double v33 = vabdd_f64(v56, v23);
                    BOOL v34 = vabdd_f64(v16, v21) < v18 && v33 < v18;
                    BOOL v35 = !v34 || v15 > v18 + v25 + v22;
                    if (!v35 && v25 <= v54) {
                      break;
                    }
                    v58.origin.CGFloat x = v15;
                    v58.origin.CGFloat y = v16;
                    v58.size.CGFloat height = v56;
                    v58.size.CGFloat width = v57;
                    CGRect v59 = CGRectInset(v58, -v18, -v18);
                    v65.origin.CGFloat x = v25;
                    v65.origin.CGFloat y = v30;
                    v65.size.CGFloat width = v31;
                    v65.size.CGFloat height = v32;
                    if (CGRectContainsRect(v59, v65)) {
                      break;
                    }
                    v60.origin.CGFloat x = v25;
                    v60.origin.CGFloat y = v30;
                    v60.size.CGFloat width = v31;
                    v60.size.CGFloat height = v32;
                    CGRect v61 = CGRectInset(v60, -v18, -v18);
                    v66.origin.CGFloat x = v15;
                    v66.origin.CGFloat y = v16;
                    v66.size.CGFloat height = v56;
                    v66.size.CGFloat width = v57;
                    if (CGRectContainsRect(v61, v66)) {
                      break;
                    }
                  }
                }
              }
              uint64_t v14 = (v14 + 1);
              if (v5 == v14) {
                goto LABEL_39;
              }
            }
            [v7 bounds];
            CGFloat v38 = v37;
            CGFloat v40 = v39;
            CGFloat v42 = v41;
            CGFloat v44 = v43;
            [v19 bounds];
            v67.origin.CGFloat x = v45;
            v67.origin.CGFloat y = v46;
            v67.size.CGFloat width = v47;
            v67.size.CGFloat height = v48;
            v62.origin.CGFloat x = v38;
            v62.origin.CGFloat y = v40;
            v62.size.CGFloat width = v42;
            v62.size.CGFloat height = v44;
            CGRect v63 = CGRectUnion(v62, v67);
            CGFloat x = v63.origin.x;
            CGFloat y = v63.origin.y;
            CGFloat width = v63.size.width;
            CGFloat height = v63.size.height;
            Mutable = CGPathCreateMutable();
            v64.origin.CGFloat x = x;
            v64.origin.CGFloat y = y;
            v64.size.CGFloat width = width;
            v64.size.CGFloat height = height;
            CGPathAddRect(Mutable, 0, v64);
            [v7 setPath:Mutable];
            if (Mutable) {
              CFRelease(Mutable);
            }
            [v19 remove];
            --v5;
            LODWORD(v6) = v6 - 1;
          }
        }
      }
LABEL_39:
      uint64_t v6 = (v6 + 1);
    }
    while (v6 < v5);
  }
}

- (unsigned)categorizeGraphicsIn:(id)a3
{
  int v4 = [a3 count];
  if (!v4) {
    return 0;
  }
  int v5 = v4;
  uint64_t v6 = 0;
  unsigned int v7 = 0;
  do
  {
    uint64_t v8 = (void *)[a3 childAtIndex:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v8 isNarrow] && objc_msgSend(v8, "isVisible"))
      {
        [v8 setZoneGraphicType:1];
        ++v7;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v8 canBeContainer]
          && [v8 isVisible])
        {
          if ([v8 isUprightRectangle])
          {
            [v8 setZoneGraphicType:2];
            v7 += 4;
          }
          else
          {
            id v9 = (const CGPath *)[v8 path];
            if (v9)
            {
              double v10 = v9;
              if (!CGPathIsEmpty(v9))
              {
                uint64_t v15 = 256;
                uint64_t v12 = 0x3FF0000000000000;
                long long v13 = 0u;
                long long v14 = 0u;
                CGPathApply(v10, &v12, (CGPathApplierFunction)checkRectilinear);
                if (BYTE1(v15))
                {
                  if ((_BYTE)v15)
                  {
                    [v8 setZoneGraphicType:3];
                    LODWORD(v12) = 0;
                    CGPathApply(v10, &v12, (CGPathApplierFunction)countElements);
                    v7 += v12;
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v6 = (v6 + 1);
  }
  while (v5 != v6);
  return v7;
}

- (void)makeZonesIn:(id)a3
{
  uint64_t v5 = [a3 PDFContext];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(v5 + 2064);
    if (v7)
    {
      uint64_t v8 = -1431655765 * ((unint64_t)(*(void *)(v5 + 2072) - v7) >> 6);

      id v9 = [[CPCharSequence alloc] initWithSizeFor:v8];
      self->charactersOnPage = v9;
      [(CPCharSequence *)v9 addChars:*(void *)(v6 + 2064) length:v8];
      +[CPObjectUtility complexityOfPage:a3];
      float v11 = v10;
      objc_msgSend(a3, "setComplexity:");
      double v12 = v11;
      if (v11 <= 0.8)
      {
        if (-[CPZoneMaker categorizeGraphicsIn:](self, "categorizeGraphicsIn:", a3, v12) > 0x7D0)
        {
          double v17 = objc_alloc_init(CPZone);
          [(CPObject *)v17 setPage:a3];
          [(CPChunk *)v17 setShrinksWithChildren:0];
          [(CPZone *)v17 setIsStraddleZone:1];
          [(CPChunk *)v17 addChildrenOf:a3];
          [(CPZone *)v17 setCharactersInZone:self->charactersOnPage];
          [a3 add:v17];
        }
        else
        {
          [(CPZoneMaker *)self mergeQualifyingRectanglesIn:a3];
          [(CPZoneMaker *)self makeZonesWithBoundaryIn:a3];
        }
        +[CPCompoundGraphicMaker makeCompoundGraphicsInZonesOf:a3];
      }
      else
      {
        long long v13 = objc_msgSend(a3, "newTakeChildren", v12);
        long long v14 = [CPCompoundGraphic alloc];
        [a3 pageCropBox];
        uint64_t v15 = -[CPCompoundGraphic initWithGraphicObjects:withRenderedBounds:](v14, "initWithGraphicObjects:withRenderedBounds:", v13);

        [a3 pageCropBox];
        -[CPChunk setBounds:](v15, "setBounds:");
        double v16 = objc_alloc_init(CPZone);
        [(CPObject *)v16 setPage:a3];
        [(CPChunk *)v16 setShrinksWithChildren:0];
        [(CPZone *)v16 setIsStraddleZone:1];
        [(CPChunk *)v16 add:v15];

        [(CPZone *)v16 setCharactersInZone:self->charactersOnPage];
        [a3 add:v16];
      }
      self->charactersOnPage = 0;
      double v18 = objc_alloc_init(CPBody);
      [(CPChunk *)v18 setShrinksWithChildren:0];
      [(CPChunk *)v18 addChildrenOf:a3];
      [a3 add:v18];
      [a3 setHasZones:1];
      [a3 pageCropBox];
      -[CPChunk setBounds:](v18, "setBounds:");
    }
  }
}

- (BOOL)overlap:(id)a3 with:(id)a4
{
  [a3 top];
  double v7 = v6;
  [a3 bottom];
  double v9 = v8;
  [a4 top];
  double v11 = v10;
  [a4 bottom];
  return v11 >= v9 && v7 >= v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneMaker;
  [(CPZoneMaker *)&v3 dealloc];
}

@end