@interface CPSpacerFinder
- (CPSpacerFinder)initWithContentZone:(id)a3;
- (id)spacers;
- (void)assessQuality;
- (void)dealloc;
- (void)determineValidity;
- (void)dispose;
- (void)finalize;
- (void)findSpacers;
- (void)initializeJunctions;
- (void)initializeSegmentations;
- (void)splitTextLines;
@end

@implementation CPSpacerFinder

- (id)spacers
{
  id result = self->spacers;
  if (!result)
  {
    id result = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->spacers = (NSMutableArray *)result;
    unint64_t count = self->spacerSequence.count;
    if (count)
    {
      unint64_t v5 = 0;
      int v6 = 0;
      do
      {
        v7 = self->spacerSequence.ordered[v5];
        if (*((unsigned char *)v7 + 56))
        {
          v8 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:v7 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [(NSMutableArray *)self->spacers addObject:v8];

          *((_DWORD *)v7 + 15) = v6++;
          unint64_t count = self->spacerSequence.count;
        }
        ++v5;
      }
      while (v5 < count);
      return self->spacers;
    }
  }
  return result;
}

- (void)splitTextLines
{
  [(CPSpacerFinder *)self spacers];
  [(CPSpacerFinder *)self assessQuality];
  [(CPSpacerFinder *)self determineValidity];
  id v3 = [(CPZone *)self->contentZone textLinesInZone];
  int v19 = [(NSMutableArray *)self->spacers count];
  if (!self->segmentationCount) {
    return;
  }
  uint64_t v4 = 0;
  v18 = v3;
  do
  {
    segmentations = self->segmentations;
    uint64_t v22 = v4;
    v20 = &segmentations[v4];
    p_var1 = &v20->var1;
    if (!v20->var1) {
      goto LABEL_18;
    }
    unint64_t v6 = 0;
    p_var2 = &segmentations[v4].var2;
    do
    {
      v7 = *p_var2;
      uint64_t v8 = *((void *)*p_var2 + 9 * v6 + 5);
      if (!v8) {
        goto LABEL_17;
      }
      uint64_t v9 = (uint64_t)v7 + 72 * v6;
      v10 = (CGRect *)(v9 + 8);
      v11 = (unsigned char *)(v9 + 48);
      v12 = (_DWORD *)(v9 + 52);
      while (1)
      {
        uint64_t v13 = *(void *)(v8 + 48);
        if (v13)
        {
          if (*(unsigned char *)(v13 + 170)) {
            break;
          }
        }
LABEL_14:
        uint64_t v8 = *(void *)(v8 + 40);
        if (!v8) {
          goto LABEL_17;
        }
      }
      if (!CGRectIntersectsRect(*v10, *(CGRect *)v8))
      {
        if (*(unsigned char *)(v13 + 168))
        {
          if (*(unsigned char *)(v8 + 56))
          {
            CGRect v24 = CGRectNull;
            objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->spacers, "objectAtIndex:", *(unsigned int *)(v8 + 60)), "getValue:", &v24);
            if (CGRectIntersectsRect(*v10, v24))
            {
              unsigned char *v11 = 1;
              _DWORD *v12 = *(_DWORD *)(v8 + 60);
            }
          }
        }
        goto LABEL_14;
      }
      *((unsigned char *)v7 + 72 * v6 + 64) = 1;
      unsigned char *v11 = 0;
      _DWORD *v12 = *(_DWORD *)(v8 + 60);
LABEL_17:
      ++v6;
    }
    while (v6 < *p_var1);
LABEL_18:
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    memset(&v24, 0, sizeof(v24));
    *(void *)&v24.origin.y = segmentations[v22].var2;
    HIDWORD(v24.size.width) = *p_var1;
    BYTE8(v25) = 0;
    v24.size.height = 0.0;
    *(void *)&long long v25 = 0;
    *(void *)&long long v26 = v18;
    *((void *)&v26 + 1) = v20->var0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    [*((id *)&v26 + 1) removeTextLines:v18 whereTrue:isSplitBySpacer passing:&v24];
    unsigned int v14 = [v18 count];
    unsigned int v15 = v14;
    if (BYTE8(v25) && v14 >= 2) {
      *((void *)&v26 + 1) = [v18 objectAtIndex:v14 - 2];
    }
    *(void *)&double v16 = recordPreviousInlineInfo((uint64_t)&v24).n128_u64[0];
    if (*(void *)&v24.size.height && v15) {
      *((void *)&v26 + 1) = objc_msgSend(v18, "objectAtIndex:", v15 - 1, v16);
    }
    *(void *)&double v17 = recordPreviousInlineInfo((uint64_t)&v24).n128_u64[0];
    if (v19) {
      objc_msgSend(*((id *)&v26 + 1), "setRightSpacerIndex:", (v19 - 1), v17);
    }
    uint64_t v4 = v22 + 1;
  }
  while (v22 + 1 < (unint64_t)self->segmentationCount);
}

- (void)determineValidity
{
  if (self->segmentationCount)
  {
    v2 = self;
    uint64_t v3 = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    p_spacerSequence = &self->spacerSequence;
    do
    {
      segmentations = v2->segmentations;
      uint64_t v108 = v3;
      unint64_t v5 = &segmentations[v3];
      uint64_t v6 = [v5->var0 wordArray];
      p_var0 = &v5->var0;
      unint64_t var1 = v5->var1;
      uint64_t v116 = v6;
      p_unint64_t var1 = &v5->var1;
      if (!v5->var1) {
        goto LABEL_143;
      }
      unint64_t v8 = 0;
      int v9 = 0;
      int v10 = 0;
      v11 = &segmentations[v108];
      var2 = v11->var2;
      p_var2 = &v11->var2;
      uint64_t v13 = 0;
      int v14 = *(_DWORD *)var2 + 1;
      char v15 = 1;
      do
      {
        v123 = v13;
        char v122 = v15;
        int v16 = v9;
        int v17 = v14;
        v18 = *p_var2;
        int v19 = (unsigned int *)((char *)*p_var2 + 72 * v8);
        unint64_t v126 = v8 + 1;
        if (v8 + 1 >= var1) {
          int v127 = [*p_var0 wordCount];
        }
        else {
          int v127 = v19[18] + 1;
        }
        int v128 = v17;
        uint64_t v20 = (v17 - v16);
        uint64_t v121 = v116 + 48 * *v19;
        uint64_t v21 = *((void *)v18 + 9 * v8 + 5);
        v124 = v18;
        unint64_t v125 = v8;
        if (!v21)
        {
          if (v20 == 1) {
            [*p_var0 charSequence];
          }
          LODWORD(v23) = 0;
          uint64_t v22 = 0;
LABEL_73:
          int v14 = v127;
          int v9 = v128;
          unint64_t v75 = v126;
          goto LABEL_76;
        }
        unsigned int v111 = *v19;
        int v110 = v10;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v24 = (uint64_t)v18 + 72 * v8;
        long long v25 = (CGRect *)(v24 + 8);
        v129 = (CFTypeRef *)(v24 + 56);
        v119 = (double *)(v24 + 24);
        v120 = (CGFloat *)(v24 + 16);
        v118 = (double *)(v24 + 32);
        do
        {
          uint64_t v26 = *(void *)(v21 + 48);
          if (v26 && *(unsigned char *)(v26 + 170))
          {
            CGRect v139 = CGRectIntersection(*v25, *(CGRect *)v21);
            CGFloat x = v139.origin.x;
            if (v139.origin.x != INFINITY && v139.origin.y != INFINITY)
            {
              CGFloat y = v139.origin.y;
              CGFloat width = v139.size.width;
              double height = v139.size.height;
              uint64_t v32 = v20;
              uint64_t v33 = v23;
              id v34 = [(CPZone *)v2->contentZone graphicsInZone];
              unint64_t v35 = [v34 count];
              if (!v35) {
                goto LABEL_57;
              }
              uint64_t v136 = v22;
              uint64_t v36 = 0;
              double v37 = height * 0.05;
              double v137 = height * 0.01;
              BOOL v38 = 1;
              do
              {
                v39 = (void *)[v34 objectAtIndex:v36];
                [v39 renderedBounds];
                if (v43 < height + height)
                {
                  v146.origin.CGFloat x = v40;
                  v146.origin.CGFloat y = v41;
                  double v44 = v42;
                  double v45 = v43;
                  v140.origin.CGFloat x = x;
                  v140.origin.CGFloat y = y;
                  v140.size.CGFloat width = width;
                  v140.size.double height = height;
                  v146.size.CGFloat width = v44;
                  v146.size.double height = v45;
                  CGRect v141 = CGRectIntersection(v140, v146);
                  if (v141.origin.x != INFINITY && v141.origin.y != INFINITY && (v45 <= v37 || v141.size.height > v37))
                  {
                    BOOL v48 = v44 > v137 && v141.size.width <= v137;
                    double v49 = v44 * 0.5;
                    BOOL v50 = v48 || v141.size.width < v49;
                    if (!v50
                      && (objc_msgSend(v39, "isVisible", v49, v141.origin.y, v141.size.width, v141.size.height) & 1) != 0)
                    {
                      break;
                    }
                  }
                }
                BOOL v38 = ++v36 < v35;
              }
              while (v35 != v36);
              v2 = self;
              uint64_t v22 = v136;
              if (!v38) {
                goto LABEL_57;
              }
              [*p_var0 maximumWordGap];
              float v52 = v51;
              [*p_var0 medianFontSize];
              if (*v129) {
                goto LABEL_38;
              }
              double v112 = v53;
              float v113 = v52;
              double v54 = v25->origin.x;
              CGFloat v55 = *v120;
              double v138 = *v119;
              double v56 = *v118;
              id v57 = [(CPZone *)self->contentZone graphicsInZone];
              uint64_t v58 = [v57 count];
              if (v58)
              {
                uint64_t v59 = 0;
                CGFloat v132 = 0.0;
                double v134 = 0.0;
                CGFloat v131 = INFINITY;
                double v135 = INFINITY;
                do
                {
                  v60 = (void *)[v57 objectAtIndex:v59];
                  [v60 renderedBounds];
                  if (v64 < v56 + v56)
                  {
                    v147.origin.CGFloat x = v61;
                    v147.origin.CGFloat y = v62;
                    v147.size.CGFloat width = v63;
                    v147.size.double height = v64;
                    v142.origin.CGFloat x = v54;
                    v142.origin.CGFloat y = v55;
                    v142.size.CGFloat width = v138;
                    v142.size.double height = v56;
                    CGRect v143 = CGRectIntersection(v142, v147);
                    CGFloat v65 = v143.origin.x;
                    if (v143.origin.x != INFINITY && v143.origin.y != INFINITY)
                    {
                      CGFloat v67 = v143.origin.y;
                      CGFloat v68 = v143.size.width;
                      CGFloat v69 = v143.size.height;
                      if ([v60 isVisible])
                      {
                        Mutable = (__CFArray *)*v129;
                        if (!*v129)
                        {
                          Mutable = CFArrayCreateMutable(allocator, 0, 0);
                          CFTypeRef *v129 = Mutable;
                        }
                        CFArrayAppendValue(Mutable, v60);
                        v144.size.CGFloat width = v134;
                        v144.origin.CGFloat x = v135;
                        v144.origin.CGFloat y = v131;
                        v144.size.double height = v132;
                        v148.origin.CGFloat x = v65;
                        v148.origin.CGFloat y = v67;
                        v148.size.CGFloat width = v68;
                        v148.size.double height = v69;
                        CGRect v145 = CGRectUnion(v144, v148);
                        double v135 = v145.origin.x;
                        CGFloat v131 = v145.origin.y;
                        double v134 = v145.size.width;
                        CGFloat v132 = v145.size.height;
                      }
                    }
                  }
                  ++v59;
                }
                while (v58 != v59);
              }
              else
              {
                double v134 = 0.0;
                double v135 = INFINITY;
              }
              v2 = self;
              uint64_t v22 = v136;
              if (*v129)
              {
                double v71 = v112 * v113 + v112 * v113;
                if (v135 > v71 + v54 || v135 + v134 < v54 + v138 - v71)
                {
                  CFRelease(*v129);
                  CFTypeRef *v129 = 0;
                  goto LABEL_57;
                }
LABEL_38:
                excludeSpacerFromBounds((uint64_t)p_spacerSequence, v21, v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
                uint64_t v23 = v33;
              }
              else
              {
LABEL_57:
                uint64_t v23 = (v33 + 1);
                uint64_t v22 = preferredSpacer(v22, v21);
              }
              uint64_t v20 = v32;
            }
          }
          uint64_t v21 = *(void *)(v21 + 40);
        }
        while (v21);
        if (v20 != 1) {
          goto LABEL_73;
        }
        int v72 = v23;
        uint64_t v73 = [*p_var0 charSequence];
        if (!v22)
        {
          int v14 = v127;
          int v9 = v128;
          unint64_t v75 = v126;
          goto LABEL_75;
        }
        uint64_t v74 = *(void *)(v22 + 48);
        int v14 = v127;
        int v9 = v128;
        unint64_t v75 = v126;
        if (!v74) {
          goto LABEL_75;
        }
        if (!*(_DWORD *)(v74 + 44)) {
          goto LABEL_75;
        }
        v76 = (void *)v73;
        double v77 = *(double *)(v74 + 88);
        double v78 = *(double *)(v74 + 96);
        double v79 = *(double *)(v74 + 104);
        double v80 = *(double *)(v74 + 112);
        if (fabs(CGIntervalIntersection(v77, v78, v79, v80)) != INFINITY) {
          goto LABEL_75;
        }
        double v81 = *(double *)(v74 + 152);
        if (v81 >= v79 + v80) {
          goto LABEL_75;
        }
        unsigned int v82 = *(_DWORD *)(v116 + 48 * v111 + 4);
        if (v82 >= 5)
        {
          if (v82 <= 7)
          {
            unsigned int v99 = v82 - 1;
            while (v99 != -1)
            {
              uint64_t v100 = [v76 charAtIndex:v99 + *(_DWORD *)v121];
              --v99;
              if (*(unsigned __int16 *)(v100 + 72) <= 0x30u) {
                goto LABEL_117;
              }
            }
          }
          if (!isConsistentWithNarrowWordsCommon((double *)v121, v77, v78, v79, v80))
          {
LABEL_75:
            LODWORD(v23) = v72;
            goto LABEL_76;
          }
        }
LABEL_117:
        if (v72 != 1)
        {
          LODWORD(v23) = v72;
          if (v72 && v110 == 1) {
            excludeSpacerFromBounds((uint64_t)p_spacerSequence, (uint64_t)v123, *(double *)v22, *(double *)(v22 + 8), *(double *)(v22 + 16), *(double *)(v22 + 24));
          }
          goto LABEL_76;
        }
        uint64_t v101 = *(void *)(v22 + 48);
        LODWORD(v81) = *(_DWORD *)(v101 + 44);
        double v102 = (double)*(unint64_t *)&v81;
        unsigned int v103 = *(_DWORD *)(v101 + 36);
        if ((double)v103 * 0.5 <= v102
          && (unsigned int v104 = *(_DWORD *)(v101 + 80) + v103, v105 = *(_DWORD *)(v101 + 32), v104 >= v105))
        {
          LODWORD(v102) = *(_DWORD *)(v101 + 76);
          double v102 = (double)*(unint64_t *)&v102;
          BOOL v106 = (double)v105 * 0.75 > v102;
        }
        else
        {
          BOOL v106 = 1;
        }
        if (v110 != 1)
        {
          if (v110) {
            BOOL v107 = 1;
          }
          else {
            BOOL v107 = v125 == 0;
          }
          if (!v107) {
            LOBYTE(v106) = 1;
          }
          if (v106)
          {
            LODWORD(v23) = 1;
          }
          else
          {
            *(unsigned char *)(v101 + 168) = 1;
            excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
            LODWORD(v23) = 0;
            uint64_t v22 = 0;
          }
          goto LABEL_76;
        }
        if (!v106)
        {
          if (preferredSpacer((uint64_t)v123, v22) == v22) {
            goto LABEL_140;
          }
          *(unsigned char *)(v101 + 168) = 1;
LABEL_139:
          excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, *v123, v123[1], v123[2], v123[3]);
          LODWORD(v23) = 0;
          uint64_t v22 = 0;
          goto LABEL_76;
        }
        if (canSeparateWordRight((uint64_t)v123, v102)) {
          goto LABEL_141;
        }
        if (preferredSpacer((uint64_t)v123, v22) != v22) {
          goto LABEL_139;
        }
LABEL_140:
        excludeSpacerFromBounds((uint64_t)p_spacerSequence, (uint64_t)v123, *(double *)v22, *(double *)(v22 + 8), *(double *)(v22 + 16), *(double *)(v22 + 24));
LABEL_141:
        LODWORD(v23) = 1;
LABEL_76:
        if (v14 - v9 != 1)
        {
          if (!v22)
          {
LABEL_95:
            char v15 = 0;
            goto LABEL_112;
          }
LABEL_89:
          if (v23 == 1)
          {
            uint64_t v83 = *(void *)(v22 + 48);
            if (!v83) {
              __assert_rtn("canSplitJunctionWithSpacer", "CPSpacerFinder.m", 741, "stats->quality");
            }
            goto LABEL_91;
          }
          goto LABEL_111;
        }
        if (!v22) {
          goto LABEL_95;
        }
        uint64_t v83 = *(void *)(v22 + 48);
        if (!v83) {
          goto LABEL_89;
        }
        if (!*(_DWORD *)(v83 + 56)) {
          goto LABEL_89;
        }
        double v84 = *(double *)(v83 + 120);
        double v85 = *(double *)(v83 + 128);
        double v86 = *(double *)(v83 + 136);
        double v87 = *(double *)(v83 + 144);
        if (fabs(CGIntervalIntersection(v84, v85, v86, v87)) != INFINITY) {
          goto LABEL_89;
        }
        double v88 = *(double *)(v83 + 160);
        if (v88 <= v84
          || *(_DWORD *)(v121 + 52) >= 5u
          && !isConsistentWithNarrowWordsCommon((double *)(v121 + 48), v84, v85, v86, v87))
        {
          goto LABEL_89;
        }
        if (v75 != *p_var1 || v23 != 1) {
          goto LABEL_89;
        }
        if ((canSeparateWordRight(v22, v88) & 1) == 0)
        {
          excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, *((double *)v124 + 9 * v125 + 1), *((double *)v124 + 9 * v125 + 2), *((double *)v124 + 9 * v125 + 3), *((double *)v124 + 9 * v125 + 4));
          uint64_t v22 = 0;
          LODWORD(v23) = 0;
          goto LABEL_95;
        }
LABEL_91:
        unsigned int v89 = *(_DWORD *)(v83 + 32);
        if (v89 < 4)
        {
          uint64_t v96 = (uint64_t)v124 + 72 * v125;
          v92 = (double *)(v96 + 24);
          double v93 = *(double *)(v96 + 32);
          double v94 = 1.0;
          double v90 = 0.0;
          if (v93 > 0.0) {
            goto LABEL_97;
          }
        }
        else
        {
          double v90 = ((double)v89 + -3.0) / 5.0;
          uint64_t v91 = (uint64_t)v124 + 72 * v125;
          v92 = (double *)(v91 + 24);
          double v93 = *(double *)(v91 + 32);
          double v94 = 1.0;
          if (v93 > 0.0)
          {
            if (v90 >= 1.0)
            {
              double v95 = *(double *)(v22 + 16);
              goto LABEL_98;
            }
LABEL_97:
            double v95 = v90 * *(double *)(v22 + 16) + (v94 - v90) * *v92;
LABEL_98:
            double v94 = v95 / (v93 * 0.5);
          }
        }
        unsigned int v97 = *(_DWORD *)(v22 + 32);
        if ((v97 < 2
           || (v97 < 6 ? (BOOL v98 = v89 >= 3) : (BOOL v98 = 1), !v98 || v90 + v94 < 1.0 || *(double *)(v22 + 24) < v93 + v93))
          && *v92 < v93 * 100.0
          || (LODWORD(v23) = 1, !((v123 == 0) | v122 & 1)) && v89 == 1)
        {
          char v15 = 0;
          *(unsigned char *)(v83 + 170) = 0;
          LODWORD(v23) = 1;
          goto LABEL_112;
        }
LABEL_111:
        char v15 = 1;
LABEL_112:
        unint64_t var1 = *p_var1;
        uint64_t v13 = (double *)v22;
        unint64_t v8 = v75;
        int v10 = v23;
      }
      while (v75 < var1);
LABEL_143:
      uint64_t v3 = v108 + 1;
    }
    while (v108 + 1 < (unint64_t)v2->segmentationCount);
  }
}

- (void)assessQuality
{
  unsigned int count = self->spacerSequence.count;
  if (count)
  {
    uint64_t v3 = self;
    self->qualityEntries = ($0E7C6181E695A4EE4B83C13AD15AF82E *)malloc_type_malloc(176 * count, 0x10000401EC9425BuLL);
    if (v3->segmentationCount)
    {
      uint64_t v4 = 0;
      int v103 = 0;
      unsigned int v89 = v3;
      while (1)
      {
        segmentations = v3->segmentations;
        uint64_t v6 = &segmentations[v4];
        uint64_t v7 = [v6->var0 wordArray];
        p_double var0 = &v6->var0;
        unint64_t var1 = v6->var1;
        p_unint64_t var1 = &v6->var1;
        uint64_t v88 = v4;
        if (v6->var1) {
          break;
        }
LABEL_120:
        uint64_t v4 = v88 + 1;
        if (v88 + 1 >= (unint64_t)v3->segmentationCount) {
          return;
        }
      }
      uint64_t v9 = v7;
      unint64_t v10 = 0;
      int v11 = 0;
      p_var2 = &segmentations[v4].var2;
      int v12 = *(_DWORD *)*p_var2 + 1;
      uint64_t v93 = v7;
      while (1)
      {
        uint64_t v13 = *p_var2;
        int v14 = (unsigned int *)((char *)*p_var2 + 72 * v10);
        unsigned int v15 = *v14;
        int v16 = v10 + 1 >= var1 ? [*p_var0 wordCount] : v14[18] + 1;
        uint64_t v102 = v9 + 48 * v15;
        int v17 = v12 - v11;
        int v96 = v16;
        unint64_t v94 = v10 + 1;
        if (v12 - v11 == 1)
        {
          uint64_t v18 = [*p_var0 charSequence];
          unsigned int v19 = *(_DWORD *)(v9 + 48 * v15 + 4);
          if (v19 < 5)
          {
LABEL_17:
            char v20 = 1;
          }
          else if (v19 <= 7)
          {
            uint64_t v21 = (void *)v18;
            unsigned int v22 = v19 - 1;
            while (1)
            {
              char v20 = v22 != -1;
              if (v22 == -1) {
                break;
              }
              uint64_t v23 = [v21 charAtIndex:v22 + *(_DWORD *)v102];
              --v22;
              if (*(unsigned __int16 *)(v23 + 72) <= 0x30u) {
                goto LABEL_17;
              }
            }
          }
          else
          {
            char v20 = 0;
          }
          int v16 = v96;
        }
        else
        {
          char v20 = 0;
        }
        int v24 = v16 - v12;
        LOBYTE(v25) = v16 - v12 == 1 && *(_DWORD *)(v102 + 52) < 5u;
        uint64_t v26 = *((void *)v13 + 9 * v10 + 5);
        int v95 = v12;
        if (v26) {
          break;
        }
        uint64_t v3 = v89;
LABEL_119:
        uint64_t v9 = v93;
        unint64_t var1 = *p_var1;
        unint64_t v10 = v94;
        int v11 = v95;
        int v12 = v96;
        if (v94 >= var1) {
          goto LABEL_120;
        }
      }
      p_var13 = 0;
      char v28 = 0;
      uint64_t v29 = v93 + 48 * v15;
      int v101 = *(_DWORD *)(v29 + 12) & 0xA;
      int v99 = *(_DWORD *)(v102 + 56);
      int v100 = *(_DWORD *)(v102 + 60) & 5;
      double v30 = *(double *)(v29 + 16);
      double v31 = v30 + *(double *)(v29 + 32);
      double v32 = *(double *)(v102 + 64);
      double v33 = v32 + *(double *)(v102 + 80);
      if (v17 == 1) {
        double v34 = *(double *)(v29 + 16);
      }
      else {
        double v34 = v30 + *(double *)(v29 + 32);
      }
      double v98 = v34;
      uint64_t v35 = (uint64_t)v13 + 72 * v10 + 8;
      unsigned int v97 = (double *)(v93 + 48 * v15 + 40);
      if (v24 == 1) {
        double v36 = v32 + *(double *)(v102 + 80);
      }
      else {
        double v36 = *(double *)(v102 + 64);
      }
      uint64_t v3 = v89;
      while (1)
      {
        CGFloat v37 = *(double *)v35;
        CGFloat v38 = *(double *)(v35 + 8);
        v106.size.float64_t width = *(CGFloat *)(v35 + 16);
        v106.size.float64_t height = *(CGFloat *)(v35 + 24);
        v106.origin.CGFloat x = *(CGFloat *)v35;
        v106.origin.CGFloat y = v38;
        float64_t height = v106.size.height;
        float64_t width = v106.size.width;
        if (CGRectIntersectsRect(v106, *(CGRect *)v26)) {
          break;
        }
LABEL_116:
        uint64_t v26 = *(void *)(v26 + 40);
        if (!v26) {
          goto LABEL_119;
        }
      }
      v39 = *($0E7C6181E695A4EE4B83C13AD15AF82E **)(v26 + 48);
      if (!v39)
      {
        qualityEntries = v89->qualityEntries;
        v39 = &qualityEntries[v103];
        *(void *)(v26 + 48) = v39;
        CGSize v52 = *(CGSize *)(v35 + 16);
        v39->var0.origin = *(CGPoint *)v35;
        v39->var0.size = v52;
        v39->unint64_t var1 = 1;
        v39->var2 = v17 == 1;
        v39->var3 = v24 == 1;
        double v53 = &v39->var14.var0;
        if (v20)
        {
          *double v53 = v30;
          double v54 = &qualityEntries[v103];
          v54->var14.unint64_t var1 = 0.0;
          v54->var15.double var0 = v31;
          v54->var15.unint64_t var1 = 0.0;
          int v55 = 1;
          uint64_t v56 = 1;
        }
        else
        {
          int v55 = 0;
          *(_OWORD *)double v53 = CGIntervalNull;
          qualityEntries[v103].var15 = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
          uint64_t v56 = 0;
        }
        *(void *)&v39->var4 = v56;
        v39->var6 = v55;
        id v57 = &qualityEntries[v103];
        uint64_t v58 = &v57->var16.var0;
        if (v25)
        {
          *uint64_t v58 = v32;
          uint64_t v59 = &qualityEntries[v103];
          v59->var16.unint64_t var1 = 0.0;
          v59->var17.double var0 = v33;
          v59->var17.unint64_t var1 = 0.0;
          int v60 = 1;
          uint64_t v61 = 1;
        }
        else
        {
          int v60 = 0;
          *(_OWORD *)uint64_t v58 = CGIntervalNull;
          qualityEntries[v103].var17 = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
          uint64_t v61 = 0;
        }
        *(void *)&v57->var7 = v61;
        v57->var9 = v60;
        CGFloat v62 = &qualityEntries[v103];
        v62->var18 = v98;
        v62->var19 = v36;
        v62->var10 = v99 > 1;
        if (v101) {
          BOOL v63 = 1;
        }
        else {
          BOOL v63 = *(double *)v26 - v31 <= *v97 * 0.1;
        }
        qualityEntries[v103].var11 = v63;
        if (v100) {
          BOOL v65 = 1;
        }
        else {
          BOOL v65 = v32 - (*(double *)v26 + *(double *)(v26 + 16)) <= *(double *)(v102 + 88) * 0.1;
        }
        v66 = &qualityEntries[v103];
        v66->var12 = v65;
        v66->var13 = v28 & 1;
        ++v103;
        *(_WORD *)&v66->var20 = 0;
        v66->var22 = 1;
        if ((v28 & 1) == 0) {
          goto LABEL_114;
        }
        if (!p_var13) {
          goto LABEL_115;
        }
LABEL_113:
        ++*p_var13;
        char v28 = 1;
        p_var13 = 0;
        goto LABEL_116;
      }
      if (v24 == 1 && *(_DWORD *)(v102 + 52) <= 4u)
      {
        uint64_t v64 = *(void *)(v26 + 40);
        if (!v64)
        {
LABEL_54:
          int v25 = 1;
          goto LABEL_35;
        }
        while (1)
        {
          v107.origin.CGFloat x = v37;
          v107.origin.CGFloat y = v38;
          v107.size.float64_t height = height;
          v107.size.float64_t width = width;
          if (CGRectIntersectsRect(v107, *(CGRect *)v64))
          {
            if (*(void *)(v64 + 48)) {
              break;
            }
          }
          uint64_t v64 = *(void *)(v64 + 40);
          if (!v64) {
            goto LABEL_54;
          }
        }
      }
      int v25 = 0;
LABEL_35:
      v40.f64[0] = width;
      v41.f64[0] = *(float64_t *)v35;
      v41.f64[1] = v39->var0.origin.y;
      v40.f64[1] = v39->var0.size.height;
      v42.f64[0] = v39->var0.size.width;
      v43.f64[0] = v39->var0.origin.x;
      v43.f64[1] = *(float64_t *)(v35 + 8);
      v42.f64[1] = height;
      float64x2_t v44 = vaddq_f64(v41, v40);
      float64x2_t v45 = vaddq_f64(v43, v42);
      float64x2_t v46 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v41, v43), *(int8x16_t *)v35, (int8x16_t)v39->var0.origin);
      int8x16_t v47 = (int8x16_t)vcgtq_f64(v45, v44);
      v41.f64[0] = v44.f64[0];
      v41.f64[1] = v45.f64[1];
      v45.f64[1] = v44.f64[1];
      v39->var0.origin = (CGPoint)v46;
      v39->var0.size = (CGSize)vsubq_f64((float64x2_t)vbslq_s8(v47, (int8x16_t)v41, (int8x16_t)v45), v46);
      unsigned int v48 = v39->var1;
      unsigned int v49 = v48 + 1;
      v39->unint64_t var1 = v48 + 1;
      if (v17 == 1) {
        ++v39->var2;
      }
      if (v24 == 1) {
        ++v39->var3;
      }
      v20 &= v28 ^ 1;
      if (v20)
      {
        ++v39->var4;
        if (v39->var6)
        {
          int v50 = v49 - v39->var5;
        }
        else
        {
          v39->var5 = v48;
          int v50 = 1;
        }
        v39->var6 = v50;
        double var0 = v39->var14.var0;
        double v68 = 0.0;
        double v69 = v30;
        double v70 = 0.0;
        if (fabs(var0) != INFINITY)
        {
          double v71 = v39->var14.var1;
          double v70 = -v71;
          if (v71 >= 0.0)
          {
            double v70 = v39->var14.var1;
            double v71 = -0.0;
          }
          double v69 = var0 + v71;
          double v72 = v70 + v69;
          if (v69 <= v30)
          {
            if (v72 < v30) {
              double v70 = v30 - v69;
            }
          }
          else
          {
            double v70 = v72 - v30;
            double v69 = v30;
          }
        }
        v39->var14.double var0 = v69;
        v39->var14.unint64_t var1 = v70;
        double v73 = v39->var15.var0;
        double v74 = v31;
        if (fabs(v73) != INFINITY)
        {
          double v75 = v39->var15.var1;
          double v68 = -v75;
          if (v75 >= 0.0)
          {
            double v68 = v39->var15.var1;
            double v75 = -0.0;
          }
          double v74 = v73 + v75;
          double v76 = v68 + v74;
          if (v74 <= v31)
          {
            if (v76 < v31) {
              double v68 = v31 - v74;
            }
          }
          else
          {
            double v68 = v76 - v31;
            double v74 = v31;
          }
        }
        v39->var15.double var0 = v74;
        v39->var15.unint64_t var1 = v68;
      }
      if (v25)
      {
        ++v39->var7;
        if (v39->var9)
        {
          int v77 = v49 - v39->var8;
        }
        else
        {
          v39->var8 = v48;
          int v77 = 1;
        }
        v39->var9 = v77;
        double v78 = v39->var16.var0;
        double v79 = 0.0;
        double v80 = v32;
        double v81 = 0.0;
        if (fabs(v78) != INFINITY)
        {
          double v82 = v39->var16.var1;
          double v81 = -v82;
          if (v82 >= 0.0)
          {
            double v81 = v39->var16.var1;
            double v82 = -0.0;
          }
          double v80 = v78 + v82;
          double v83 = v81 + v80;
          if (v80 <= v32)
          {
            if (v83 < v32) {
              double v81 = v32 - v80;
            }
          }
          else
          {
            double v81 = v83 - v32;
            double v80 = v32;
          }
        }
        v39->var16.double var0 = v80;
        v39->var16.unint64_t var1 = v81;
        double v84 = v39->var17.var0;
        double v85 = v33;
        if (fabs(v84) != INFINITY)
        {
          double v86 = v39->var17.var1;
          double v79 = -v86;
          if (v86 >= 0.0)
          {
            double v79 = v39->var17.var1;
            double v86 = -0.0;
          }
          double v85 = v84 + v86;
          double v87 = v79 + v85;
          if (v85 <= v33)
          {
            if (v87 < v33) {
              double v79 = v33 - v85;
            }
          }
          else
          {
            double v79 = v87 - v33;
            double v85 = v33;
          }
        }
        v39->var17.double var0 = v85;
        v39->var17.unint64_t var1 = v79;
      }
      if (v17 != 1 && v39->var18 < v31) {
        v39->var18 = v31;
      }
      if (v24 != 1 && v39->var19 > v32) {
        v39->var19 = v32;
      }
      if (v99 >= 2) {
        ++v39->var10;
      }
      if (v101 || *(double *)v26 - v31 <= *v97 * 0.1) {
        ++v39->var11;
      }
      if (v100 || v32 - (*(double *)v26 + *(double *)(v26 + 16)) <= *(double *)(v102 + 88) * 0.1) {
        ++v39->var12;
      }
      if ((v28 & 1) == 0)
      {
LABEL_114:
        p_var13 = &v39->var13;
LABEL_115:
        char v28 = 1;
        goto LABEL_116;
      }
      ++v39->var13;
      if (!p_var13) {
        goto LABEL_115;
      }
      goto LABEL_113;
    }
  }
}

- (void)findSpacers
{
  [(CPSpacerFinder *)self initializeSegmentations];
  [(CPSpacerFinder *)self initializeJunctions];
  double x = self->textBounds.origin.x;
  double y = self->textBounds.origin.y;
  BOOL v5 = x == INFINITY || y == INFINITY;
  if (v5
    || ((double v6 = self->zoneBounds.origin.x, v6 != INFINITY) ? (v7 = self->zoneBounds.origin.y == INFINITY) : (v7 = 1), v7))
  {
    unsigned int v8 = 0;
  }
  else
  {
    CGFloat height = self->textBounds.size.height;
    double v10 = x - v6;
    if (x - v6 > 0.0) {
      double x = self->zoneBounds.origin.x;
    }
    v42[27] = 0;
    *(_WORD *)&v42[25] = 0;
    unsigned int segmentationCount = self->segmentationCount;
    *(double *)&long long v39 = x;
    *((double *)&v39 + 1) = y;
    double v40 = fmax(v10, 0.0);
    p_spacerSequence = *($4456F195E26435C2C968A1EC1E69351F **)&height;
    *(_DWORD *)float64x2_t v42 = segmentationCount;
    memset(&v42[4], 0, 20);
    unsigned int v8 = 1;
    v42[24] = 1;
    *(_DWORD *)&v42[28] = 0;
    addSpacer((uint64_t)&self->spacerSequence, 0, &v39);
  }
  if (self->segmentationCount)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = &self->segmentations[v12];
      if (objc_msgSend(v13->var0, "wordCount", y))
      {
        uint64_t v14 = [v13->var0 firstWord];
        long long v15 = *(_OWORD *)(v14 + 32);
        long long v44 = *(_OWORD *)(v14 + 16);
        long long v45 = v15;
        double v40 = 0.0;
        *(void *)&v42[8] = 0;
        *(void *)&long long v39 = v12;
        *((void *)&v39 + 1) = v13;
        p_spacerSequence = &self->spacerSequence;
        *(void *)float64x2_t v42 = v8;
        *(_OWORD *)&v42[16] = v44;
        long long v43 = v15;
        int v16 = objc_msgSend(v13->var0, "wordCount", v12, v13, 0, &self->spacerSequence);
        id var0 = v13->var0;
        if (v16 == 1)
        {
          uint64_t v18 = [var0 firstWord];
          [v13->var0 charSequence];
          segmentTextLine(0, v18, 0, v19, (uint64_t)&v39);
        }
        else
        {
          [var0 mapToWordPairsWithIndex:segmentTextLine passing:&v39];
        }
        uint64_t count = self->spacerSequence.count;
        if (*(_DWORD *)v42 < count)
        {
          uint64_t v21 = count - *(unsigned int *)v42;
          unsigned int v22 = &self->spacerSequence.ordered[*(unsigned int *)v42];
          do
          {
            if (!*((unsigned char *)*v22 + 56)) {
              ++*((_DWORD *)*v22 + 8);
            }
            ++v22;
            --v21;
          }
          while (v21);
        }
      }
      ++v12;
    }
    while (v12 < self->segmentationCount);
    [v13->var0 bounds];
    uint64_t v25 = self->spacerSequence.count;
    if (v25)
    {
      double v26 = v23 + v24;
      ordered = self->spacerSequence.ordered;
      do
      {
        char v28 = *ordered;
        if (*ordered && !*((unsigned char *)v28 + 56))
        {
          double v29 = v26 - *((double *)v28 + 1);
          if (*((double *)v28 + 3) < v29) {
            *((double *)v28 + 3) = v29;
          }
          *((unsigned char *)v28 + 56) = 1;
        }
        ++ordered;
        --v25;
      }
      while (v25);
    }
  }
  if (v8)
  {
    uint64_t v30 = self->spacerSequence.count;
    CGFloat v31 = self->textBounds.origin.y;
    CGFloat v32 = self->textBounds.size.height;
    CGFloat v33 = self->textBounds.origin.x + self->textBounds.size.width;
    double v34 = fmax(self->zoneBounds.origin.x + self->zoneBounds.size.width - v33, 0.0);
    v42[27] = 0;
    *(_WORD *)&v42[25] = 0;
    unsigned int v35 = self->segmentationCount;
    *(CGFloat *)&long long v39 = v33;
    *((CGFloat *)&v39 + 1) = v31;
    double v40 = v34;
    p_spacerSequence = *($4456F195E26435C2C968A1EC1E69351F **)&v32;
    *(_DWORD *)float64x2_t v42 = v35;
    memset(&v42[4], 0, 20);
    v42[24] = 1;
    *(_DWORD *)&v42[28] = 0;
    addSpacer((uint64_t)&self->spacerSequence, v30, &v39);
    if (self->segmentationCount)
    {
      uint64_t v36 = 0;
      unint64_t v37 = 0;
      do
      {
        id v38 = self->segmentations[v36].var0;
        [v38 setLeftSpacerIndex:0];
        [v38 setRightSpacerIndex:v30];
        ++v37;
        ++v36;
      }
      while (v37 < self->segmentationCount);
    }
  }
}

- (void)initializeJunctions
{
  unsigned int segmentationCount = self->segmentationCount;
  self->spacerSequence.allocatedSize = segmentationCount;
  if (segmentationCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      segmentations = self->segmentations;
      if ([segmentations[v4].var0 isMonospaced])
      {
        p_size_t var1 = (uint64_t)&segmentations[v4].var1;
        uint64_t v19 = 0;
        objc_msgSend(segmentations[v4].var0, "monospaceWidth", p_var1, 0);
        uint64_t v19 = v7;
        id var0 = segmentations[v4].var0;
        uint64_t v9 = countJunctionsMonospaced;
        p_p_size_t var1 = &p_var1;
      }
      else
      {
        p_p_size_t var1 = (uint64_t *)&segmentations[v4].var1;
        id var0 = segmentations[v4].var0;
        uint64_t v9 = countJunctions;
      }
      [var0 mapToWordPairs:v9 passing:p_p_var1];
      int v11 = &segmentations[v4];
      size_t var1 = v11->var1;
      if (var1)
      {
        uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(var1, 0x48uLL, 0x102004029F24FBBuLL);
        unsigned int v14 = v11->var1;
      }
      else
      {
        unsigned int v14 = 0;
        uint64_t v13 = 0;
      }
      v11->var2 = v13;
      unsigned int segmentationCount = self->spacerSequence.allocatedSize + v14;
      self->spacerSequence.allocatedSize = segmentationCount;
      ++v5;
      ++v4;
    }
    while (v5 < self->segmentationCount);
  }
  if (self->textBounds.origin.x != INFINITY
    && self->textBounds.origin.y != INFINITY
    && self->zoneBounds.origin.x != INFINITY
    && self->zoneBounds.origin.y != INFINITY)
  {
    self->spacerSequence.allocatedSize = ++segmentationCount;
  }
  if (segmentationCount)
  {
    unsigned int v17 = 2 * segmentationCount;
    self->spacerSequence.allocatedSize = v17;
    self->spacerSequence.stats = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc((unint64_t)v17 << 6, 0x10A00403DB86E81uLL);
    self->spacerSequence.ordered = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(self->spacerSequence.allocatedSize, 8uLL, 0x2004093837F09uLL);
  }
}

- (void)initializeSegmentations
{
  id v3 = [(CPZone *)self->contentZone textLinesInZone];
  unsigned int v4 = [v3 count];
  self->size_t segmentationCount = v4;
  if (v4)
  {
    segmentations = ($54B00B245656622C10B7392301C15C5B *)malloc_type_calloc(v4, 0x18uLL, 0x10A00406B6A53AFuLL);
    self->segmentations = segmentations;
    if (self->segmentationCount)
    {
      uint64_t v6 = 0;
      size_t v7 = 0;
      do
      {
        unsigned int v8 = (void *)[v3 objectAtIndex:v7];
        self->segmentations[v6].id var0 = v8;
        [v8 bounds];
        v15.origin.double x = v9;
        v15.origin.double y = v10;
        v15.size.float64_t width = v11;
        v15.size.CGFloat height = v12;
        self->textBounds = CGRectUnion(self->textBounds, v15);
        ++v7;
        size_t segmentationCount = self->segmentationCount;
        ++v6;
      }
      while (v7 < segmentationCount);
      segmentations = self->segmentations;
    }
    else
    {
      size_t segmentationCount = 0;
    }
    qsort(segmentations, segmentationCount, 0x18uLL, (int (__cdecl *)(const void *, const void *))compareSegmentationsBottomAscendingLeftDescending);
  }
}

- (void)dealloc
{
  [(CPSpacerFinder *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPSpacerFinder;
  [(CPSpacerFinder *)&v3 dealloc];
}

- (void)finalize
{
  [(CPSpacerFinder *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPSpacerFinder;
  [(CPSpacerFinder *)&v3 finalize];
}

- (void)dispose
{
  if (self->contentZone)
  {
    free(self->qualityEntries);
    if (self->segmentationCount)
    {
      unint64_t v3 = 0;
      do
      {
        segmentations = self->segmentations;
        uint64_t var1 = segmentations[v3].var1;
        if (var1)
        {
          uint64_t v6 = 0;
          uint64_t v7 = 72 * var1;
          do
          {
            unsigned int v8 = *(const void **)((char *)self->segmentations[v3].var2 + v6 + 56);
            if (v8) {
              CFRelease(v8);
            }
            v6 += 72;
          }
          while (v7 != v6);
          segmentations = self->segmentations;
        }
        free(segmentations[v3++].var2);
      }
      while (v3 < self->segmentationCount);
    }
    free(self->segmentations);
    free(self->spacerSequence.ordered);
    free(self->spacerSequence.stats);
    self->contentZone = 0;
  }
}

- (CPSpacerFinder)initWithContentZone:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CPSpacerFinder;
  unsigned int v4 = [(CPSpacerFinder *)&v15 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->contentZone = (CPZone *)a3;
    [a3 zoneBounds];
    v5->zoneBounds.origin.double x = v6;
    v5->zoneBounds.origin.double y = v7;
    v5->zoneBounds.size.float64_t width = v8;
    v5->zoneBounds.size.CGFloat height = v9;
    if (([a3 hasBorders] & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a3, "charactersInZone"), "bounds");
      v16.origin.double x = v10;
      v16.origin.double y = v11;
      v16.size.float64_t width = v12;
      v16.size.CGFloat height = v13;
      v5->zoneBounds = CGRectUnion(v5->zoneBounds, v16);
    }
    v5->textBounds = CGRectNull;
  }
  return v5;
}

@end