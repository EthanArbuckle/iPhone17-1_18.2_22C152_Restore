@interface CPParagraphMaker
+ (BOOL)line:(id)a3 alignsWith:(id)a4;
- (BOOL)firstWordOf:(id)a3 fits:(id)a4 indent:(double)a5;
- (BOOL)fitsBelow:(id)a3 alignment:(unint64_t)a4 spacing:(double)a5 from:(int)a6;
- (BOOL)isGraphicBetween:(id)a3 and:(id)a4;
- (BOOL)line:(id)a3 isAlignedWith:(id)a4;
- (BOOL)line:(id)a3 isBelow:(id)a4;
- (BOOL)line:(id)a3 isDirectlyBelow:(id)a4;
- (BOOL)spacingOf:(id)a3 and:(id)a4 and:(id)a5 is:(double *)a6;
- (BOOL)styleOf:(id)a3 differsFromStyleOf:(id)a4;
- (id)newInitialParagraphIn:(id)a3;
- (id)paragraphs;
- (int)indexOfUniqueLineBelow:(id)a3 from:(int)a4;
- (int)linesThatOverlapLineAt:(int)a3 between:(double)a4 and:(double)a5 from:(int)a6;
- (int)paragraph:(id)a3 splits:(id)a4;
- (unint64_t)alignmentOf:(id)a3 and:(id)a4;
- (unint64_t)alignmentOf:(id)a3 and:(id)a4 and:(id)a5;
- (void)addCompoundedShapesOn:(id)a3 to:(id)a4;
- (void)addIntersectingParagraph:(id)a3;
- (void)addLinesTo:(id)a3;
- (void)dealloc;
- (void)makeParagraphsIn:(id)a3;
@end

@implementation CPParagraphMaker

- (void)makeParagraphsIn:(id)a3
{
  v5 = (void *)[a3 textLinesInZone];
  int v6 = [v5 count];
  if (v6)
  {
    self->parent = (CPZone *)a3;
    self->page = (CPPage *)[a3 page];
    self->avail = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v5];

    self->paragraphs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v6 == 1)
    {
      v10 = objc_alloc_init(CPParagraph);
      [(CPParagraph *)v10 setAlignment:1];
      [(CPChunk *)v10 add:[(NSMutableArray *)self->avail objectAtIndex:0]];
      [(NSMutableArray *)self->paragraphs addObject:v10];
    }
    else
    {
      self->compoundedShapesOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      -[CPParagraphMaker addCompoundedShapesOn:to:](self, "addCompoundedShapesOn:to:", [a3 page], self->compoundedShapesOnPage);
      int v7 = [a3 hasRotatedCharacters];
      v8 = &selRef_baseLineDescendingApprox_;
      if (!v7) {
        v8 = &selRef_baseLineDescending_;
      }
      [(NSMutableArray *)self->avail sortUsingSelector:*v8];
      while ([(NSMutableArray *)self->avail count])
      {
        self->spacingSet = 0;
        id v9 = [(CPParagraphMaker *)self newInitialParagraphIn:a3];
        if ([a3 hasRotatedCharacters]) {
          [(CPParagraphMaker *)self addIntersectingParagraph:v9];
        }
        else {
          [(NSMutableArray *)self->paragraphs addObject:v9];
        }
        if ([v9 count] == 3) {
          [(CPParagraphMaker *)self addLinesTo:v9];
        }
      }
      self->avail = 0;
    }
  }
}

- (void)addIntersectingParagraph:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a3, "page"), "bounds");
  double v6 = v5;
  double v8 = v7;
  [a3 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  paragraphs = self->paragraphs;
  uint64_t v18 = [(NSMutableArray *)paragraphs countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v38.origin.CGFloat x = v10;
    v38.origin.CGFloat y = v12;
    v38.size.CGFloat width = v14;
    v38.size.CGFloat height = v16;
    CGRect v39 = CGRectInset(v38, v6 * -0.02, v8 * -0.01);
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    uint64_t v24 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(paragraphs);
        }
        v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v26 bounds];
        v41.origin.CGFloat x = v27;
        v41.origin.CGFloat y = v28;
        v41.size.CGFloat width = v29;
        v41.size.CGFloat height = v30;
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        if (CGRectIntersectsRect(v40, v41))
        {
          [v26 addChildrenOf:a3];
          [v26 sortUsingSelector:sel_baseLineDescendingApprox_];
          id v31 = v26;
          [(NSMutableArray *)self->paragraphs removeObject:v26];
          [(CPParagraphMaker *)self addIntersectingParagraph:v26];

          return;
        }
      }
      uint64_t v19 = [(NSMutableArray *)paragraphs countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  [(NSMutableArray *)self->paragraphs addObject:a3];
}

- (void)addCompoundedShapesOn:(id)a3 to:(id)a4
{
  int v7 = [a3 count];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [a3 childAtIndex:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CPParagraphMaker *)self addCompoundedShapesOn:v10 to:a4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [a4 addObject:v10];
        }
      }
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
}

- (void)addLinesTo:(id)a3
{
  uint64_t v5 = [a3 alignment];
  double v6 = (void *)[a3 childAtIndex:1];
  int v7 = (void *)[a3 childAtIndex:2];
  [v6 bounds];
  double v12 = v8;
  if (v10 < 0.0 || v11 < 0.0) {
    *(void *)&double v12 = (unint64_t)CGRectStandardize(*(CGRect *)&v8);
  }
  [a3 bounds];
  double v17 = v13;
  if (v15 < 0.0 || v16 < 0.0) {
    *(void *)&double v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v13);
  }
  [v6 baseline];
  double v19 = v18;
  [v7 baseline];
  double v21 = v19 - v20;
  self->spacingSet = 1;
  self->currentSpacing = v21;
  int v22 = [(NSMutableArray *)self->avail count];
  [v7 baseline];
  double v24 = v23;
  if (v22 < 1)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    while (1)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v25), "baseline");
      if (v26 < v24) {
        break;
      }
      if (v22 == ++v25) {
        return;
      }
    }
  }
  if (v25 != v22)
  {
    uint64_t v27 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v7 from:v25];
    if ((v27 & 0x80000000) == 0)
    {
      uint64_t v28 = v27;
      if ([(NSMutableArray *)self->avail count])
      {
        v78 = 0;
        double v29 = v12 - v17;
        while (1)
        {
          CGFloat v30 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v28];
          if ([(CPParagraphMaker *)self isGraphicBetween:v7 and:v30]) {
            goto LABEL_45;
          }
          [v30 baseline];
          double v32 = v24 - v31;
          if (vabdd_f64(v32, v21) > 2.0)
          {
            if (v32 < v21)
            {
              [a3 bounds];
              double v77 = v42;
              uint64_t v44 = v43;
              double v46 = v45;
              double v48 = v47;
              [v30 bounds];
              double v50 = v49;
              CGFloat v52 = v51;
              double v54 = v53;
              double v56 = v55;
              v57 = objc_msgSend(a3, "childAtIndex:", objc_msgSend(a3, "count") - 2);
              v58 = (void *)[a3 lastChild];
              [v58 rotationAngle];
              double v60 = v59;
              [v57 rotationAngle];
              if (vabdd_f64(v60, v61) <= 0.00872664626)
              {
                if (v54 < 0.0 || v56 < 0.0)
                {
                  v80.origin.CGFloat x = v50;
                  v80.origin.CGFloat y = v52;
                  v80.size.CGFloat width = v54;
                  v80.size.CGFloat height = v56;
                  *(void *)&double v50 = (unint64_t)CGRectStandardize(v80);
                }
                double v62 = v77;
                if (v46 < 0.0 || v48 < 0.0)
                {
                  uint64_t v63 = v44;
                  double v64 = v46;
                  double v65 = v48;
                  *(void *)&double v62 = (unint64_t)CGRectStandardize(*(CGRect *)&v62);
                }
                double v66 = vabdd_f64(v62, v50);
                [a3 bounds];
                if (v69 < 0.0 || v70 < 0.0) {
                  *(CGRect *)(&v69 - 2) = CGRectStandardize(*(CGRect *)&v67);
                }
                if (v66 < v69 * 0.25
                  || [(CPParagraphMaker *)self styleOf:v58 differsFromStyleOf:v30])
                {
                  int v71 = [a3 count];
                  id v72 = a3;
                  [(NSMutableArray *)self->paragraphs removeLastObject];
                  int v73 = v71 - 1;
                  if (v71 != 1)
                  {
                    do
                    {
                      uint64_t v74 = [a3 childAtIndex:0];
                      v75 = objc_alloc_init(CPParagraph);
                      [(CPChunk *)v75 add:v74];
                      [(NSMutableArray *)self->paragraphs addObject:v75];

                      --v73;
                    }
                    while (v73);
                  }
                  uint64_t v76 = [a3 childAtIndex:0];

                  [(NSMutableArray *)self->avail insertObject:v76 atIndex:0];
                }
              }
            }
            goto LABEL_45;
          }
          if ([(CPParagraphMaker *)self line:v30 isAlignedWith:a3]) {
            goto LABEL_25;
          }
          int v33 = [(CPParagraphMaker *)self paragraph:a3 splits:v30];
          if (v33 > 0) {
            break;
          }
          if (([a3 alignment] & 8) == 0) {
            goto LABEL_45;
          }
          if ((-[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", [a3 childAtIndex:1], v30) & 1) == 0)goto LABEL_45; {
          [a3 add:v30];
          }
          [(NSMutableArray *)self->avail removeObjectAtIndex:v28];
          uint64_t v38 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v7 from:v28];
          if ((v38 & 0x80000000) != 0) {
            goto LABEL_45;
          }
          uint64_t v28 = v38;
          [v30 baseline];
          double v40 = v39;
          int v7 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v28];
          [v7 baseline];
          if (vabdd_f64(v40 - v41, v21) > 2.0
            || (-[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", [a3 childAtIndex:1], v7) & 1) == 0)
          {
            goto LABEL_45;
          }
          [a3 setAlignment:1];
LABEL_26:
          if ([(CPParagraphMaker *)self fitsBelow:v7 alignment:v5 spacing:v28 from:v21])
          {
            goto LABEL_45;
          }
          [a3 add:v7];
          [(NSMutableArray *)self->avail removeObjectAtIndex:(int)v28];
          [v7 baseline];
          double v24 = v35;
          if (v78)
          {
            -[NSMutableArray addObject:](self->avail, "addObject:");
            [(NSMutableArray *)self->avail sortUsingSelector:sel_baseLineDescending_];
          }
          uint64_t v28 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v7 from:v28];
          char v36 = [a3 alignment];
          if ((v28 & 0x80000000) != 0 || (v36 & 0x10) != 0)
          {
            if ((v28 & 0x80000000) != 0) {
              goto LABEL_45;
            }
          }
          else if ([a3 alignment])
          {
            uint64_t v37 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v28];
            if ([v37 wordCount])
            {
              if ([(CPParagraphMaker *)self firstWordOf:v37 fits:v7 indent:v29]) {
                goto LABEL_45;
              }
            }
          }
          if (![(NSMutableArray *)self->avail count]) {
            goto LABEL_45;
          }
        }
        int v34 = v33;
        if (v78) {

        }
        v78 = objc_alloc_init(CPTextLine);
        do
        {
          -[CPChunk add:](v78, "add:", [v30 childAtIndex:0]);
          --v34;
        }
        while (v34);
LABEL_25:
        int v7 = v30;
        goto LABEL_26;
      }
    }
    v78 = 0;
LABEL_45:
  }
}

- (int)paragraph:(id)a3 splits:(id)a4
{
  return 0;
}

- (id)newInitialParagraphIn:(id)a3
{
  uint64_t v5 = objc_alloc_init(CPParagraph);
  double v6 = (void *)[(NSMutableArray *)self->avail objectAtIndex:0];
  id v7 = v6;
  [(NSMutableArray *)self->avail removeObjectAtIndex:0];
  [(CPParagraph *)v5 setAlignment:1];
  [(CPChunk *)v5 add:v6];

  if ([a3 hasRotatedCharacters] && -[NSMutableArray count](self->avail, "count"))
  {
    do
    {
      double v8 = (void *)[(NSMutableArray *)self->avail objectAtIndex:0];
      [(CPChunk *)self->page bounds];
      double v10 = v9;
      [(CPChunk *)self->page bounds];
      double v12 = v11;
      [v8 normalizedBounds];
      double v17 = v13;
      if (v15 < 0.0 || v16 < 0.0) {
        *(void *)&double v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v13);
      }
      [v6 normalizedBounds];
      double x = v18;
      double width = v20;
      if (v20 < 0.0 || v21 < 0.0)
      {
        CGRect v128 = CGRectStandardize(*(CGRect *)&v18);
        double x = v128.origin.x;
        double width = v128.size.width;
      }
      [v6 baseline];
      double v25 = v24;
      [v8 baseline];
      if (vabdd_f64(v25, v26) >= v12 * 0.01) {
        break;
      }
      double v27 = v17 - (x + width);
      if (v27 <= 0.0 || v27 >= v10 * 0.02) {
        break;
      }
      [(CPChunk *)v5 add:v8];
      [(NSMutableArray *)self->avail removeObjectAtIndex:0];
      double v6 = v8;
    }
    while ([(NSMutableArray *)self->avail count]);
  }
  uint64_t v29 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v6 from:0];
  if ((v29 & 0x80000000) == 0)
  {
    uint64_t v30 = v29;
    [v6 bounds];
    double v35 = v31;
    if (v33 < 0.0 || v34 < 0.0) {
      *(void *)&double v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
    }
    [v6 bounds];
    if (v38 < 0.0 || v39 < 0.0) {
      *(CGRect *)&double v36 = CGRectStandardize(*(CGRect *)&v36);
    }
    int v40 = [(CPParagraphMaker *)self linesThatOverlapLineAt:v30 between:0 and:v35 from:v36 + v38];
    uint64_t v41 = v40 > 0 ? 0xFFFFFFFFLL : v30;
    if (v40 <= 0)
    {
      uint64_t v42 = v30;
      uint64_t v43 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v30];
      [v6 baseline];
      double v45 = v44;
      [v43 baseline];
      double v127 = v45 - v46;
      [v6 bounds];
      if (v127 < v47 * 4.0)
      {
        uint64_t v126 = 0;
        if (![v6 styleIsUniform:&v126 styleFlags:63487]
          || !objc_msgSend((id)objc_msgSend(v43, "charSequence"), "length"))
        {
          goto LABEL_35;
        }
        double v48 = (void *)[v43 charSequence];
        int v49 = [v48 length];
        uint64_t v50 = 0;
        if (v49)
        {
          do
          {
            uint64_t v51 = [v48 charAtIndex:v50];
            if (CPPDFStyleEqual(v126, *(void *)(v51 + 160), 63487)) {
              break;
            }
            uint64_t v50 = (v50 + 1);
          }
          while (v49 != v50);
        }
        if (v50 != v49)
        {
LABEL_35:
          if (![(CPParagraphMaker *)self isGraphicBetween:v6 and:v43])
          {
            unint64_t v52 = [(CPParagraphMaker *)self alignmentOf:v6 and:v43];
            if (![(CPParagraphMaker *)self fitsBelow:v43 alignment:v52 spacing:v41 from:v127])
            {
              uint64_t v53 = (v41 + 1);
              uint64_t v54 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v43 from:v53];
              if ((v54 & 0x80000000) != 0)
              {
                v75 = 0;
                goto LABEL_81;
              }
              [v43 bounds];
              double v59 = v55;
              if (v57 < 0.0 || v58 < 0.0) {
                *(void *)&double v59 = (unint64_t)CGRectStandardize(*(CGRect *)&v55);
              }
              [v6 bounds];
              double v64 = v60;
              if (v62 < 0.0 || v63 < 0.0) {
                *(void *)&double v64 = (unint64_t)CGRectStandardize(*(CGRect *)&v60);
              }
              [v6 bounds];
              if (v67 < 0.0 || v68 < 0.0) {
                *(CGRect *)&double v65 = CGRectStandardize(*(CGRect *)&v65);
              }
              double v69 = fmin(v59, v64);
              double v70 = v65 + v67;
              [v43 bounds];
              if (v73 < 0.0 || v74 < 0.0) {
                *(CGRect *)&double v71 = CGRectStandardize(*(CGRect *)&v71);
              }
              if ([(CPParagraphMaker *)self linesThatOverlapLineAt:v54 between:v53 and:v69 from:fmax(v70, v71 + v73)] > 0)
              {
                v75 = 0;
                LODWORD(v54) = -1;
LABEL_81:
                int v91 = 0;
                BOOL v92 = v52 != 0;
LABEL_82:
                [(CPParagraph *)v5 setAlignment:v52];
                double v106 = v127;
                if (v127 > 0.0)
                {
                  -[CPParagraph setAlignment:](v5, "setAlignment:", v52, v127);
                  [(CPChunk *)v5 add:v43];
                  if ((v92 & v91) == 1)
                  {
                    [(CPChunk *)v5 add:v75];
                    [(NSMutableArray *)self->avail removeObjectAtIndex:(int)v54];
                  }
                  [(NSMutableArray *)self->avail removeObjectAtIndex:v42];
                }
                int v107 = [(CPObject *)v5 count];
                int v108 = v107;
                if (v107 < 2 || (v52 & 4) != 0 && v107 == 2) {
                  [(CPParagraph *)v5 setAlignment:1];
                }
                if ([v6 hasDropCap]) {
                  [(CPParagraph *)v5 setHasDropCap:1];
                }
                if (v108 == 3)
                {
                  [v6 bounds];
                  double v113 = v111;
                  if (v111 < 0.0 || v112 < 0.0)
                  {
                    *(CGRect *)&double v109 = CGRectStandardize(*(CGRect *)&v109);
                    double v113 = v114;
                  }
                  objc_msgSend(v43, "bounds", v109, v110);
                  if (v117 < 0.0 || v118 < 0.0) {
                    *(CGRect *)(&v116 - 1) = CGRectStandardize(*(CGRect *)&v115);
                  }
                  double v119 = v113 - v117;
                  BOOL v120 = -[CPParagraphMaker firstWordOf:fits:indent:](self, "firstWordOf:fits:indent:", v43, v6, v119, v116);
                  BOOL v121 = [(CPParagraphMaker *)self firstWordOf:v75 fits:v43 indent:v119];
                  if (v120 || v121) {
                    [(CPParagraph *)v5 setAlignment:[(CPParagraph *)v5 alignment] | 0x10];
                  }
                }
                return v5;
              }
              v75 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v54];
              if ([(CPParagraphMaker *)self isGraphicBetween:v43 and:v75]) {
                goto LABEL_81;
              }
              if (![(CPParagraphMaker *)self spacingOf:v6 and:v43 and:v75 is:&v127])
              {
                if (![(CPParagraphMaker *)self styleOf:v6 differsFromStyleOf:v75])
                {
                  [v6 baseline];
                  double v100 = v99;
                  [v43 baseline];
                  double v102 = v100 - v101;
                  [v43 baseline];
                  double v104 = v103;
                  [v75 baseline];
                  if (v102 > v104 - v105 + 1.0) {
                    double v127 = 0.0;
                  }
                }
                goto LABEL_81;
              }
              [v6 bounds];
              double v80 = v76;
              if (v78 < 0.0 || v79 < 0.0) {
                *(void *)&double v80 = (unint64_t)CGRectStandardize(*(CGRect *)&v76);
              }
              [v43 bounds];
              double v85 = v81;
              if (v83 < 0.0 || v84 < 0.0) {
                *(void *)&double v85 = (unint64_t)CGRectStandardize(*(CGRect *)&v81);
              }
              [v75 bounds];
              if (v88 < 0.0 || v89 < 0.0) {
                *(void *)&double v86 = (unint64_t)CGRectStandardize(*(CGRect *)&v86);
              }
              if (vabdd_f64(v80, v85) >= 0.9 || (double v86 = v80 - v86, v86 <= 1.9))
              {
                unint64_t v90 = -[CPParagraphMaker alignmentOf:and:and:](self, "alignmentOf:and:and:", v6, v43, v75, v86);
                int v91 = v90 != 0;
                if (v90) {
                  unint64_t v52 = v90;
                }
                BOOL v92 = v52 != 0;
                if (v90 && v52)
                {
                  unsigned int v93 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v75 from:(v54 + 1)];
                  if ((v93 & 0x80000000) != 0
                    || (v94 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v93],
                        unint64_t v95 = [(CPParagraphMaker *)self alignmentOf:v75 and:v94],
                        [v75 baseline],
                        double v97 = v96,
                        [v94 baseline],
                        v95 != v52)
                    || v97 - v98 + 1.0 >= v127)
                  {
                    BOOL v92 = 1;
                    int v91 = 1;
                  }
                  else
                  {
                    uint64_t v124 = 0;
                    uint64_t v125 = 0;
                    uint64_t v123 = 0;
                    if ([v43 styleIsUniform:&v125 styleFlags:0xFFFFLL]
                      && [v75 styleIsUniform:&v124 styleFlags:0xFFFFLL])
                    {
                      if ([v94 styleIsUniform:&v123 styleFlags:0xFFFFLL]
                        && CPPDFStyleEqual(v125, v124, 0xFFFF))
                      {
                        int v91 = CPPDFStyleEqual(v124, v123, 0xFFFF) ^ 1;
                      }
                      else
                      {
                        int v91 = 1;
                      }
                    }
                    else
                    {
                      int v91 = 0;
                    }
                    BOOL v92 = 1;
                  }
                }
                goto LABEL_82;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (BOOL)fitsBelow:(id)a3 alignment:(unint64_t)a4 spacing:(double)a5 from:(int)a6
{
  unsigned int v10 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:a3 from:(a6 + 1)];
  if ((v10 & 0x80000000) != 0) {
    return 0;
  }
  int v11 = v10;
  double v49 = a5;
  double v12 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v10];
  [a3 bounds];
  double x = v13;
  CGFloat rect = v15;
  double width = v16;
  double v19 = v18;
  [v12 bounds];
  double v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  CGFloat v27 = v23;
  BOOL v28 = v23 < 0.0 || v22 < 0.0;
  if (v28) {
    *(CGRect *)&double v20 = CGRectStandardize(*(CGRect *)&v20);
  }
  double v29 = v20 + v22;
  BOOL v30 = v19 < 0.0 || width < 0.0;
  double v31 = x;
  if (v30)
  {
    v51.origin.double x = x;
    v51.origin.CGFloat y = rect;
    v51.size.double width = width;
    v51.size.CGFloat height = v19;
    *(void *)&double v31 = (unint64_t)CGRectStandardize(v51);
  }
  if (v29 < v31) {
    return 0;
  }
  if (v28)
  {
    v52.origin.double x = v24;
    v52.origin.CGFloat y = v25;
    v52.size.double width = v26;
    v52.size.CGFloat height = v27;
    *(void *)&double v24 = (unint64_t)CGRectStandardize(v52);
  }
  if (v30)
  {
    v53.origin.double x = x;
    v53.origin.CGFloat y = rect;
    v53.size.double width = width;
    v53.size.CGFloat height = v19;
    CGRect v54 = CGRectStandardize(v53);
    double x = v54.origin.x;
    double width = v54.size.width;
  }
  if (v24 > x + width) {
    return 0;
  }
  if (v11 <= a6 + 2) {
    uint64_t v32 = (v11 + 1);
  }
  else {
    uint64_t v32 = (a6 + 2);
  }
  unsigned int v33 = [(CPParagraphMaker *)self indexOfUniqueLineBelow:v12 from:v32];
  if ((v33 & 0x80000000) != 0)
  {
    [a3 baseline];
    double v46 = v45;
    [v12 baseline];
    return v46 - v47 < v49 * 0.9;
  }
  else
  {
    double v34 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v33];
    [a3 baseline];
    double v36 = v35;
    [v12 baseline];
    double v38 = v36 - v37;
    [v12 baseline];
    double v40 = v39;
    [v34 baseline];
    double v42 = v41;
    [a3 bounds];
    if (v38 > v43 * 3.0 || vabdd_f64(v38, v49) < 2.0) {
      return 0;
    }
    BOOL v48 = vabdd_f64(v38, v40 - v42) < 2.0;
    return v38 + 2.0 < v49 && v48;
  }
}

- (BOOL)line:(id)a3 isAlignedWith:(id)a4
{
  unsigned __int8 v6 = [a4 alignment];
  [a3 anchor];
  double v8 = v7;
  [a3 center];
  double v10 = v9;
  [a3 bounds];
  double x = v11;
  double width = v13;
  if (v13 < 0.0 || v14 < 0.0)
  {
    CGRect v38 = CGRectStandardize(*(CGRect *)&v11);
    double x = v38.origin.x;
    double width = v38.size.width;
    if ((v6 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else if ((v6 & 1) == 0)
  {
LABEL_4:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  if ([a4 hasDropCap])
  {
    double v18 = (void *)[a4 childAtIndex:0];
    double v19 = (void *)[a4 childAtIndex:1];
    [v18 anchor];
    double v21 = vabdd_f64(v8, v20);
    [v19 anchor];
    BOOL v17 = vabdd_f64(v8, v22) <= 1.0 || v21 <= 1.0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "anchor");
    BOOL v17 = vabdd_f64(v8, v23) <= 1.0;
  }
LABEL_11:
  double v24 = x + width;
  if ((v6 & 2) != 0)
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "right");
    BOOL v25 = vabdd_f64(v24, v28) <= 1.0;
    if ((v6 & 4) != 0)
    {
LABEL_13:
      objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "center");
      BOOL v27 = vabdd_f64(v10, v26) <= 1.0;
      if ((v6 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v25 = 0;
    if ((v6 & 4) != 0) {
      goto LABEL_13;
    }
  }
  BOOL v27 = 0;
  if ((v6 & 8) == 0)
  {
LABEL_21:
    char v34 = 0;
    goto LABEL_22;
  }
LABEL_17:
  double v29 = (void *)[a4 childAtIndex:1];
  [v29 anchor];
  double v31 = v30;
  [v29 right];
  if (v8 < v31 + -5.0 || v24 > v32 + 10.0) {
    goto LABEL_21;
  }
  if (vabdd_f64(v31, v8) > 1.0 || vabdd_f64(v32, v24) > 3.0)
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "right");
    char v34 = 0;
    if (vabdd_f64(v24, v37) < 1.0) {
      BOOL v25 = 1;
    }
  }
  else
  {
    char v34 = 1;
  }
LABEL_22:
  char v35 = (v17 || v25) | v27 | v34;
  if (v6 & !v17) {
    return v27;
  }
  else {
    return v35;
  }
}

- (unint64_t)alignmentOf:(id)a3 and:(id)a4 and:(id)a5
{
  [a3 anchor];
  double v72 = v8;
  [a4 anchor];
  double v81 = v9;
  [a5 anchor];
  double v80 = v10;
  [a3 bounds];
  if (v13 < 0.0 || v14 < 0.0) {
    *(CGRect *)&double v11 = CGRectStandardize(*(CGRect *)&v11);
  }
  double v78 = v13;
  double v79 = v11;
  [a4 bounds];
  if (v17 < 0.0 || v18 < 0.0) {
    *(CGRect *)&double v15 = CGRectStandardize(*(CGRect *)&v15);
  }
  double v76 = v17;
  double v77 = v15;
  [a5 bounds];
  if (v21 < 0.0 || v22 < 0.0) {
    *(CGRect *)&double v19 = CGRectStandardize(*(CGRect *)&v19);
  }
  double v74 = v21;
  double v75 = v19;
  [a4 bounds];
  double v27 = v25;
  if (v25 < 0.0 || v26 < 0.0)
  {
    *(CGRect *)&double v23 = CGRectStandardize(*(CGRect *)&v23);
    double v27 = v28;
  }
  objc_msgSend(a3, "bounds", v23, v24);
  if (v31 < 0.0 || v32 < 0.0) {
    unint64_t v29 = (unint64_t)CGRectStandardize(*(CGRect *)&v29);
  }
  double v73 = *(double *)&v29;
  [a3 bounds];
  double v37 = v35;
  if (v35 < 0.0 || v36 < 0.0)
  {
    *(CGRect *)&double v33 = CGRectStandardize(*(CGRect *)&v33);
    double v37 = v38;
  }
  objc_msgSend(a4, "bounds", v33, v34);
  double v43 = v39;
  if (v41 < 0.0 || v42 < 0.0) {
    *(void *)&double v43 = (unint64_t)CGRectStandardize(*(CGRect *)&v39);
  }
  [a4 bounds];
  double v48 = v46;
  if (v46 < 0.0 || v47 < 0.0)
  {
    *(CGRect *)&double v44 = CGRectStandardize(*(CGRect *)&v44);
    double v48 = v49;
  }
  objc_msgSend(a5, "bounds", v44, v45);
  double v54 = v50;
  if (v52 < 0.0 || v53 < 0.0) {
    *(void *)&double v54 = (unint64_t)CGRectStandardize(*(CGRect *)&v50);
  }
  double v55 = v48 * 0.5;
  double v56 = v77 + v76;
  [a5 bounds];
  if (v59 < 0.0 || v60 < 0.0) {
    *(CGRect *)(&v59 - 2) = CGRectStandardize(*(CGRect *)&v57);
  }
  double v61 = v43 + v55;
  double v62 = v54 + v59 * 0.5;
  double v63 = vabdd_f64(v79 + v78, v56);
  double v64 = v27 * 0.25;
  uint64_t v65 = vabdd_f64(v81, v80) < 1.0 && vabdd_f64(v72, v81) < v64;
  double v66 = vabdd_f64(v56, v75 + v74);
  if (v63 < v64 && v66 < 2.0) {
    v65 |= 2uLL;
  }
  double v68 = vabdd_f64(v73 + v37 * 0.5, v61);
  uint64_t v69 = v65 | 4;
  if (vabdd_f64(v61, v62) >= 2.0) {
    uint64_t v69 = v65;
  }
  if (v68 >= 2.0) {
    uint64_t v69 = v65;
  }
  if (a5) {
    uint64_t v65 = v69;
  }
  if ((~(_BYTE)v65 & 3) != 0) {
    uint64_t v70 = v65;
  }
  else {
    uint64_t v70 = v65 | 8;
  }
  return v70 | [a3 hasDropCap];
}

- (BOOL)styleOf:(id)a3 differsFromStyleOf:(id)a4
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if ([a3 styleIsUniform:&v7 styleFlags:63487]
    && [a4 styleIsUniform:&v6 styleFlags:63487])
  {
    return CPPDFStyleEqual(v7, v6, 63487) ^ 1;
  }
  else
  {
    return 1;
  }
}

- (unint64_t)alignmentOf:(id)a3 and:(id)a4
{
  [a3 anchor];
  double v47 = v6;
  [a4 anchor];
  double v8 = v7;
  [a3 bounds];
  double x = v9;
  double width = v11;
  if (v11 < 0.0 || v12 < 0.0)
  {
    CGRect v48 = CGRectStandardize(*(CGRect *)&v9);
    double x = v48.origin.x;
    double width = v48.size.width;
  }
  [a4 bounds];
  double v19 = v15;
  double v20 = v17;
  if (v17 < 0.0 || v18 < 0.0)
  {
    CGRect v49 = CGRectStandardize(*(CGRect *)&v15);
    double v19 = v49.origin.x;
    double v20 = v49.size.width;
  }
  [a3 bounds];
  double v25 = v21;
  if (v23 < 0.0 || v24 < 0.0) {
    *(void *)&double v25 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
  }
  [a3 bounds];
  double v30 = v28;
  if (v28 < 0.0 || v29 < 0.0)
  {
    *(CGRect *)&double v26 = CGRectStandardize(*(CGRect *)&v26);
    double v30 = v31;
  }
  objc_msgSend(a4, "bounds", v26, v27);
  double v36 = v32;
  if (v34 < 0.0 || v35 < 0.0) {
    *(void *)&double v36 = (unint64_t)CGRectStandardize(*(CGRect *)&v32);
  }
  [a4 bounds];
  if (v39 < 0.0 || v40 < 0.0) {
    *(CGRect *)(&v39 - 2) = CGRectStandardize(*(CGRect *)&v37);
  }
  double v41 = vabdd_f64(x + width, v19 + v20);
  double v42 = vabdd_f64(v47, v8);
  unint64_t v43 = v42 < 1.0;
  uint64_t v44 = v43 | 2;
  if (v41 >= 2.0) {
    uint64_t v44 = v42 < 1.0;
  }
  uint64_t v45 = v44 | 8;
  if (v42 >= 1.0) {
    uint64_t v45 = 2;
  }
  if (v41 < 2.0) {
    unint64_t v43 = v45;
  }
  if (vabdd_f64(v25 + v30 * 0.5, v36 + v39 * 0.5) >= 2.0) {
    return v43;
  }
  else {
    return v43 | 4;
  }
}

- (BOOL)spacingOf:(id)a3 and:(id)a4 and:(id)a5 is:(double *)a6
{
  [a3 baseline];
  double v10 = v9;
  [a4 baseline];
  double v12 = v10 - v11;
  [a4 baseline];
  double v14 = v13;
  [a5 baseline];
  double v16 = vabdd_f64(v12, v14 - v15);
  if (v16 < 2.0) {
    *a6 = v12;
  }
  return v16 < 2.0;
}

- (int)indexOfUniqueLineBelow:(id)a3 from:(int)a4
{
  LODWORD(v4) = a4;
  int v7 = [(NSMutableArray *)self->avail count];
  int v8 = v7 - v4;
  if (v7 <= (int)v4)
  {
    BOOL v10 = 0;
    double v9 = 0;
  }
  else
  {
    uint64_t v4 = (int)v4;
    while (1)
    {
      double v9 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v4];
      BOOL v10 = [(CPParagraphMaker *)self line:v9 isDirectlyBelow:a3];
      if (v10 || [(CPParagraphMaker *)self line:v9 isBelow:a3]) {
        break;
      }
      ++v4;
      if (!--v8) {
        goto LABEL_9;
      }
    }
  }
  if (v4 == v7)
  {
LABEL_9:
    LODWORD(v4) = -1;
    return v4;
  }
  if (v4 != v7 - 1)
  {
    [v9 baseline];
    int v12 = v4 + 1;
    if ((int)v4 + 1 < v7)
    {
      double v13 = v11;
      uint64_t v14 = v12;
      do
      {
        double v15 = (void *)[(NSMutableArray *)self->avail objectAtIndex:v14];
        [v15 baseline];
        if (vabdd_f64(v13, v16) >= 0.1)
        {
          [v15 bounds];
          if (v19 < 0.0 || v20 < 0.0) {
            *(CGRect *)(&v18 - 1) = CGRectStandardize(*(CGRect *)&v17);
          }
          if (v18 + v20 < v13) {
            return v4;
          }
          if (v10) {
            goto LABEL_25;
          }
          if (!-[CPParagraphMaker line:isDirectlyBelow:](self, "line:isDirectlyBelow:", v15, a3, v18 + v20))
          {
            BOOL v10 = 0;
            goto LABEL_29;
          }
        }
        else
        {
          if (![(CPParagraphMaker *)self line:v15 isDirectlyBelow:a3])
          {
            if (!v10)
            {
              BOOL v10 = 0;
              if ([(CPParagraphMaker *)self line:v15 isBelow:a3]) {
                LODWORD(v4) = -1;
              }
              goto LABEL_29;
            }
LABEL_25:
            BOOL v10 = 1;
            goto LABEL_29;
          }
          if (v10) {
            goto LABEL_9;
          }
        }
        [v15 baseline];
        double v13 = v21;
        BOOL v10 = 1;
        LODWORD(v4) = v12;
LABEL_29:
        ++v14;
        ++v12;
      }
      while (v7 != v12);
    }
  }
  return v4;
}

- (int)linesThatOverlapLineAt:(int)a3 between:(double)a4 and:(double)a5 from:(int)a6
{
  LODWORD(i) = a6;
  int v11 = [(NSMutableArray *)self->avail count];
  int v12 = (void *)[(NSMutableArray *)self->avail objectAtIndex:a3];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v12 bounds];
  double v25 = v22;
  if (v23 < 0.0 || v24 < 0.0)
  {
    *(CGRect *)&double v21 = CGRectStandardize(*(CGRect *)&v21);
    double v25 = v26;
  }
  objc_msgSend(v12, "bounds", v21);
  if (v29 < 0.0 || v30 < 0.0) {
    *(CGRect *)&double v27 = CGRectStandardize(*(CGRect *)&v27);
  }
  int v31 = v11 - i;
  if (v11 > (int)i)
  {
    int v32 = 0;
    double v33 = v28 + v30;
    for (uint64_t i = (int)i; ; ++i)
    {
      if (a3 != i)
      {
        double v34 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", i, v27);
        [v34 bounds];
        if (v37 < 0.0 || v38 < 0.0) {
          *(CGRect *)(&v36 - 1) = CGRectStandardize(*(CGRect *)&v35);
        }
        if (v36 + v38 <= v25) {
          return v32;
        }
        objc_msgSend(v34, "bounds", v36 + v38);
        v64.origin.double x = v39;
        v64.origin.CGFloat y = v40;
        v64.size.double width = v41;
        v64.size.CGFloat height = v42;
        v63.origin.double x = v14;
        v63.origin.CGFloat y = v16;
        v63.size.double width = v18;
        v63.size.CGFloat height = v20;
        if (!CGRectIntersectsRect(v63, v64))
        {
          [v34 bounds];
          if (v45 < 0.0 || v46 < 0.0) {
            *(void *)&double v43 = (unint64_t)CGRectStandardize(*(CGRect *)&v43);
          }
          if (v43 > a4)
          {
            [v34 bounds];
            if (v49 < 0.0 || v50 < 0.0) {
              *(void *)&double v47 = (unint64_t)CGRectStandardize(*(CGRect *)&v47);
            }
            if (v47 < a5) {
              goto LABEL_31;
            }
          }
          [v34 bounds];
          if (v53 < 0.0 || v54 < 0.0) {
            *(CGRect *)&double v51 = CGRectStandardize(*(CGRect *)&v51);
          }
          double v27 = v51 + v53;
          if (v27 > a4)
          {
            [v34 bounds];
            if (v57 < 0.0 || v58 < 0.0) {
              *(CGRect *)&double v55 = CGRectStandardize(*(CGRect *)&v55);
            }
            double v27 = v55 + v57;
            if (v27 < a5)
            {
LABEL_31:
              [v34 bounds];
              if (v60 < 0.0 || v61 < 0.0) {
                *(CGRect *)&double v27 = CGRectStandardize(*(CGRect *)&v27);
              }
              if (v59 < v33) {
                ++v32;
              }
            }
          }
        }
      }
      if (!--v31) {
        return v32;
      }
    }
  }
  return 0;
}

- (BOOL)line:(id)a3 isBelow:(id)a4
{
  int v6 = [a3 leftSpacerIndex];
  if (v6 != [a4 leftSpacerIndex]) {
    return 0;
  }
  int v7 = [a3 rightSpacerIndex];
  if (v7 != [a4 rightSpacerIndex]) {
    return 0;
  }
  [a3 bounds];
  double v12 = v8;
  CGFloat v13 = v9;
  double v14 = v10;
  double v15 = v11;
  if (v10 < 0.0 || v11 < 0.0) {
    *(CGRect *)&double v8 = CGRectStandardize(*(CGRect *)&v8);
  }
  double v16 = v9 + v11;
  objc_msgSend(a4, "baseline", v8);
  if (v16 >= v17) {
    return 0;
  }
  [a4 bounds];
  CGFloat v21 = v20;
  double v23 = v22;
  double v24 = v15 * 6.0;
  double v25 = v22 * 6.0;
  if (v19 >= v25 && v14 >= v24) {
    return 0;
  }
  BOOL v27 = v19 < v25;
  if (v19 >= v25) {
    double width = v19;
  }
  else {
    double width = v25;
  }
  double v29 = (v25 - v19) * 0.5;
  if (!v27) {
    double v29 = 0.0;
  }
  BOOL v30 = v14 < v24;
  if (v14 >= v24) {
    double v31 = v14;
  }
  else {
    double v31 = v15 * 6.0;
  }
  double v32 = (v24 - v14) * 0.5;
  if (!v30) {
    double v32 = 0.0;
  }
  double x = v18 - v29;
  double v34 = v12 - v32;
  BOOL v35 = v15 < 0.0 || v31 < 0.0;
  double v36 = v34;
  double v37 = v31;
  if (v35)
  {
    v49.origin.double x = v34;
    v49.origin.CGFloat y = v13;
    v49.size.double width = v31;
    v49.size.CGFloat height = v15;
    double v38 = v21;
    *(CGRect *)&double v36 = CGRectStandardize(v49);
    CGFloat v21 = v38;
  }
  double v39 = v36 + v37;
  BOOL v40 = v23 < 0.0 || width < 0.0;
  double v41 = x;
  if (v40)
  {
    v50.origin.double x = x;
    v50.origin.CGFloat y = v21;
    v50.size.double width = width;
    v50.size.CGFloat height = v23;
    double v48 = v34;
    double v42 = x;
    double v43 = width;
    double v44 = v21;
    *(void *)&double v41 = (unint64_t)CGRectStandardize(v50);
    CGFloat v21 = v44;
    double width = v43;
    double x = v42;
    double v34 = v48;
  }
  if (v39 < v41) {
    return 0;
  }
  if (v35)
  {
    v51.origin.double x = v34;
    v51.origin.CGFloat y = v13;
    v51.size.double width = v31;
    v51.size.CGFloat height = v15;
    double v45 = v21;
    unint64_t v46 = (unint64_t)CGRectStandardize(v51);
    CGFloat v21 = v45;
    double v34 = *(double *)&v46;
  }
  if (v40)
  {
    v52.origin.double x = x;
    v52.origin.CGFloat y = v21;
    v52.size.double width = width;
    v52.size.CGFloat height = v23;
    CGRect v53 = CGRectStandardize(v52);
    double x = v53.origin.x;
    double width = v53.size.width;
  }
  return v34 <= x + width;
}

- (BOOL)line:(id)a3 isDirectlyBelow:(id)a4
{
  [a3 bounds];
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [a4 bounds];
  double x = v13;
  CGFloat rect = v15;
  double width = v16;
  double v19 = v18;
  BOOL v20 = v12 < 0.0 || v10 < 0.0;
  double v21 = v6;
  double v22 = v10;
  if (v20)
  {
    v28.origin.double x = v6;
    v28.origin.CGFloat y = v8;
    v28.size.double width = v10;
    v28.size.CGFloat height = v12;
    *(CGRect *)&double v21 = CGRectStandardize(v28);
  }
  double v23 = v21 + v22;
  BOOL v24 = v19 < 0.0 || width < 0.0;
  double v25 = x;
  if (v24)
  {
    v29.origin.double x = x;
    v29.origin.CGFloat y = rect;
    v29.size.double width = width;
    v29.size.CGFloat height = v19;
    *(void *)&double v25 = (unint64_t)CGRectStandardize(v29);
  }
  if (v23 < v25) {
    return 0;
  }
  if (v20)
  {
    v30.origin.double x = v6;
    v30.origin.CGFloat y = v8;
    v30.size.double width = v10;
    v30.size.CGFloat height = v12;
    *(void *)&double v6 = (unint64_t)CGRectStandardize(v30);
  }
  if (v24)
  {
    v31.origin.double x = x;
    v31.origin.CGFloat y = rect;
    v31.size.double width = width;
    v31.size.CGFloat height = v19;
    CGRect v32 = CGRectStandardize(v31);
    double x = v32.origin.x;
    double width = v32.size.width;
  }
  return v6 <= x + width;
}

- (BOOL)isGraphicBetween:(id)a3 and:(id)a4
{
  if (!self->parent) {
    return 0;
  }
  compoundedShapesOnPage = self->compoundedShapesOnPage;
  int v7 = [(NSMutableArray *)compoundedShapesOnPage count];
  [a3 bounds];
  double v12 = v9;
  if (v10 < 0.0 || v11 < 0.0)
  {
    *(CGRect *)&double v8 = CGRectStandardize(*(CGRect *)&v8);
    double v12 = v13;
  }
  objc_msgSend(a4, "bounds", v8);
  double v18 = v15;
  double v19 = v17;
  if (v16 < 0.0 || v17 < 0.0)
  {
    *(CGRect *)&double v14 = CGRectStandardize(*(CGRect *)&v14);
    double v18 = v20;
    double v19 = v21;
  }
  objc_msgSend(a3, "bounds", v14);
  double v26 = v22;
  if (v24 < 0.0 || v25 < 0.0) {
    *(void *)&double v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v22);
  }
  [a3 bounds];
  double x = v27;
  double width = v29;
  if (v29 < 0.0 || v30 < 0.0)
  {
    CGRect v56 = CGRectStandardize(*(CGRect *)&v27);
    double x = v56.origin.x;
    double width = v56.size.width;
  }
  [a4 bounds];
  double v37 = v33;
  if (v35 < 0.0 || v36 < 0.0) {
    *(void *)&double v37 = (unint64_t)CGRectStandardize(*(CGRect *)&v33);
  }
  double v38 = x + width;
  [a4 bounds];
  if (v41 < 0.0 || v42 < 0.0) {
    *(CGRect *)&double v39 = CGRectStandardize(*(CGRect *)&v39);
  }
  double v43 = v39 + v41;
  if (v26 >= v37) {
    double v26 = v37;
  }
  double v44 = v38 <= v43 ? v43 : v38;
  if (v7 < 1) {
    return 0;
  }
  uint64_t v45 = 0;
  double v46 = v18 + v19;
  uint64_t v47 = v7;
  while (1)
  {
    double v48 = (void *)[(NSMutableArray *)compoundedShapesOnPage objectAtIndex:v45];
    [v48 right];
    if (v49 >= v26)
    {
      [v48 left];
      if (v50 <= v44)
      {
        [v48 bottom];
        if (v51 <= v12)
        {
          [v48 top];
          if (v52 >= v46)
          {
            [v48 bottom];
            if (v53 >= v46)
            {
              [v48 top];
              if (v54 <= v12) {
                break;
              }
            }
          }
        }
      }
    }
    if (v47 == ++v45) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)firstWordOf:(id)a3 fits:(id)a4 indent:(double)a5
{
  int v8 = [a3 wordCount];
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(a4, "parent"), "bounds");
    if (v11 < 0.0 || v12 < 0.0) {
      *(CGRect *)&double v9 = CGRectStandardize(*(CGRect *)&v9);
    }
    double v13 = v11 - a5;
    objc_msgSend(a4, "bounds", v9, v10);
    if (v16 < 0.0 || v17 < 0.0) {
      *(CGRect *)&double v14 = CGRectStandardize(*(CGRect *)&v14);
    }
    double v18 = v13 - v16;
    uint64_t v19 = objc_msgSend(a3, "wordAtIndex:", 0, v14, v15);
    double v20 = *(void **)(*(void *)(objc_msgSend((id)objc_msgSend(a3, "charSequence"), "charAtIndex:", 0) + 160) + 64);
    double v21 = *(double *)(*(void *)(objc_msgSend((id)objc_msgSend(a3, "charSequence"), "charAtIndex:", 0) + 160) + 72);
    [v20 spaceWidth];
    double v23 = v21 * v22;
    double v24 = *(double *)(v19 + 32);
    double v25 = *(double *)(v19 + 40);
    if (v24 < 0.0 || v25 < 0.0)
    {
      uint64_t v26 = *(void *)(v19 + 16);
      uint64_t v27 = *(void *)(v19 + 24);
      *(CGRect *)(&v24 - 2) = CGRectStandardize(*(CGRect *)(&v24 - 2));
    }
    LOBYTE(v8) = v18 > v23 + v24;
  }
  return v8;
}

- (id)paragraphs
{
  return self->paragraphs;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPParagraphMaker;
  [(CPParagraphMaker *)&v3 dealloc];
}

+ (BOOL)line:(id)a3 alignsWith:(id)a4
{
  return 0;
}

@end