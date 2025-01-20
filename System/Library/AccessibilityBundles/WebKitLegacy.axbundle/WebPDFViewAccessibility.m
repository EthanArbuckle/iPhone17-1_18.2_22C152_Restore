@interface WebPDFViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)hasSpaces:(CGPDFTextString *)a3;
- (id)_accessibilityPages;
- (id)accessibilityContainer;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityHitTest:(CGPoint)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation WebPDFViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WebPDFView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityPages
{
  v2 = self;
  v3 = (void *)MEMORY[0x263F81490];
  v4 = [(WebPDFViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (v4) {
    goto LABEL_99;
  }
  v4 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
  [(WebPDFViewAccessibility *)v2 _accessibilitySetRetainedValue:v4 forKey:*v3];
  v5 = (CGPDFDocument *)[(WebPDFViewAccessibility *)v2 doc];
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v5);
  if (!NumberOfPages) {
    goto LABEL_99;
  }
  size_t v7 = NumberOfPages;
  size_t v8 = 1;
  v69 = v4;
  v70 = v2;
  v71 = v5;
  size_t v68 = NumberOfPages;
  do
  {
    Page = CGPDFDocumentGetPage(v5, v8);
    uint64_t v10 = CGPDFPageCopyTextString();
    if (!v10) {
      goto LABEL_98;
    }
    uint64_t v11 = v10;
    v12 = v4;
    uint64_t Length = CGPDFTextStringGetLength();
    BOOL v14 = [(WebPDFViewAccessibility *)v2 hasSpaces:v11];
    double v15 = 0.0900000036;
    if (v14) {
      double v15 = 1.0;
    }
    double v72 = v15;
    v16 = malloc_type_calloc(1uLL, 4 * Length, 0x1000040BDFB0063uLL);
    v17 = (unint64_t *)malloc_type_calloc(1uLL, 16 * Length, 0x100004000313F17uLL);
    v18 = (CGRect *)malloc_type_calloc(1uLL, Length << 6, 0x1000040E0EAB150uLL);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    CGFloat x = BoxRect.origin.x;
    CGFloat y = BoxRect.origin.y;
    CGFloat height = BoxRect.size.height;
    CGFloat width = BoxRect.size.width;
    int v21 = CGPDFPageGetRotationAngle(Page) % 360;
    if (v21 >= 0) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v21 + 360;
    }
    uint64_t v88 = 0;
    uint64_t v23 = CGPDFTextStringGetLength();
    v86 = v17;
    v87 = v16;
    v85 = v18;
    gXFormRange = 0;
    qword_268C86FB0 = 0;
    size_t v73 = v8;
    uint64_t v74 = v22;
    if (v22) {
      BOOL v24 = v22 == 180;
    }
    else {
      BOOL v24 = 1;
    }
    int v25 = !v24;
    int v78 = v25;
    gBoundsRange = 0;
    qword_268C86FC0 = 0;
    uint64_t v80 = v23;
    uint64_t v26 = 0;
    if (v23 < 1)
    {
      v63 = v18;
      v4 = v12;
LABEL_95:
      v5 = v71;
      goto LABEL_97;
    }
    unint64_t v27 = 0;
    v28 = v18;
    char v79 = 0;
    unint64_t v29 = 2 * Length;
    BOOL v30 = 1;
    double v76 = x;
    double v77 = 0.0;
    v31 = v17;
    v83 = (char *)v28;
    ptr = v17;
    v32 = v28;
    double v33 = 0.0;
    double v34 = 0.0;
    v35 = v16;
    double v75 = y;
    do
    {
      if (v26 + 5 > v29)
      {
        v16 = malloc_type_realloc(v16, 4 * v29, 0x1000040BDFB0063uLL);
        v36 = (char *)malloc_type_realloc(ptr, 16 * v29, 0x100004000313F17uLL);
        v35 = &v16[v26];
        v83 = (char *)malloc_type_realloc(v83, v29 << 6, 0x1000040E0EAB150uLL);
        ptr = (unint64_t *)v36;
        v31 = (unint64_t *)&v36[8 * v26];
        v86 = v31;
        v87 = v35;
        v32 = (CGRect *)&v83[32 * v26];
        v85 = v32;
        v29 *= 2;
      }
      if (gBoundsRange > v27 || !v27 || qword_268C86FC0 + gBoundsRange <= v27)
      {
        CGPDFTextStringGetBBoxForIndex();
        gBounds_1 = v37;
        gBounds_2 = v38;
        gBounds_3 = v39;
      }
      double v90 = 0.0;
      uint64_t v91 = 0;
      if (gXFormRange > v27 || !v27 || qword_268C86FB0 + gXFormRange <= v27)
      {
        CGPDFTextStringGetTransformForIndex();
        *(CGAffineTransform *)gXForm = v89;
        gXFormIsIdentitCGFloat y = CGAffineTransformIsIdentity(&v89);
      }
      CGPDFTextStringGetPositionForIndex();
      double v42 = v40;
      double v43 = *(double *)&gBounds_3;
      double v44 = v41 + *(double *)&gBounds_1;
      if (v90 == 0.0) {
        double v45 = *(double *)&gBounds_2;
      }
      else {
        double v45 = v90;
      }
      if (!gXFormIsIdentity)
      {
        CGAffineTransform v89 = *(CGAffineTransform *)gXForm;
        double v46 = v41 + *(double *)&gBounds_1;
        double v47 = v45;
        uint64_t v48 = gBounds_3;
        CGRect v94 = CGRectApplyAffineTransform(*(CGRect *)&v40, &v89);
        double v42 = v94.origin.x;
        double v44 = v94.origin.y;
        double v45 = v94.size.width;
        double v43 = v94.size.height;
      }
      v95.origin.CGFloat x = v42;
      v95.origin.CGFloat y = v44;
      v95.size.CGFloat width = v45;
      v95.size.CGFloat height = v43;
      v96.origin.CGFloat x = x;
      v96.origin.CGFloat y = y;
      v96.size.CGFloat height = height;
      v96.size.CGFloat width = width;
      if (CGRectIntersectsRect(v95, v96))
      {
        CharacterAtIndeCGFloat x = CGPDFTextStringGetCharacterAtIndex();
        if (!CharacterAtIndex)
        {
          v55 = v32;
          double v51 = v34;
          double v53 = v77;
          goto LABEL_87;
        }
        __int16 v50 = CharacterAtIndex;
        if (v78) {
          double v51 = v42;
        }
        else {
          double v51 = v44;
        }
        if ((v79 & 1) == 0)
        {
          if (v78) {
            double v53 = v44;
          }
          else {
            double v53 = v42;
          }
LABEL_75:
          *v35++ = v50;
          v87 = v35;
          *v31++ = v27;
          v86 = v31;
          v32->origin.CGFloat x = v42;
          v32->origin.CGFloat y = v44;
          v32->size.CGFloat width = v45;
          v32->size.CGFloat height = v43;
          v55 = v32 + 1;
          v85 = v32 + 1;
          uint64_t v62 = v88;
          uint64_t v26 = ++v88;
          char v79 = 1;
          if (!v30 && v62 >= 1)
          {
            BOOL v30 = 0;
            char v79 = 1;
            if (v74 > 179)
            {
              if (v74 == 180)
              {
                BOOL v30 = 0;
                v32[-1].size.CGFloat width = v32[-1].size.width + v32[-1].origin.x - (v45 + v42);
                v32[-1].origin.CGFloat x = v45 + v42;
                goto LABEL_86;
              }
              if (v74 == 270)
              {
                BOOL v30 = 0;
                v32[-1].size.CGFloat height = v32[-1].size.height + v32[-1].origin.y - v44 - v43;
                v32[-1].origin.CGFloat y = v43 + v44;
                goto LABEL_86;
              }
            }
            else
            {
              if (!v74)
              {
                BOOL v30 = 0;
                v32[-1].size.CGFloat width = v32[-1].size.width + v42 - (v32[-1].origin.x + v32[-1].size.width);
                goto LABEL_86;
              }
              if (v74 == 90)
              {
                BOOL v30 = 0;
                v32[-1].size.CGFloat height = v32[-1].size.height + v44 - (v32[-1].origin.y + v32[-1].size.height);
LABEL_86:
                char v79 = 1;
              }
            }
          }
LABEL_87:
          if (v78) {
            double v33 = v43;
          }
          else {
            double v33 = v45;
          }
          double v77 = v33 + v53;
          v32 = v55;
          double v34 = v51;
          CGFloat y = v75;
          CGFloat x = v76;
          goto LABEL_91;
        }
        if (v78) {
          double v52 = v45;
        }
        else {
          double v52 = v43;
        }
        if (v78) {
          double v53 = v44;
        }
        else {
          double v53 = v42;
        }
        BOOL v54 = v51 > v34 + v52 || v51 < v34 + v52 * -0.25 || v33 + v53 < v77;
        if (v35 <= v16)
        {
          NSLog(&cfstr_WeShouldnTBeHe.isa);
        }
        else
        {
          if (v54)
          {
            if (*(v35 - 1) != 32) {
              insertChar(32, &v87, &v86, &v85, &v88, v74, -1);
            }
            insertChar(10, &v87, &v86, &v85, &v88, v74, -1);
            int v56 = 1;
            goto LABEL_74;
          }
          if (v53 > v77 + v33 * v72 && *(v35 - 1) != 32)
          {
            unsigned int v57 = 0;
            LODWORD(v89.a) = 0;
            int v58 = (unsigned __int16)*(v35 - 1);
            if ((v58 - 12352) >= 0xC0 && (unsigned __int16)(v58 + 155) >= 0x3Bu)
            {
              unsigned int Script = uscript_getScript();
              if (Script > 0x16) {
                unsigned int v57 = 1;
              }
              else {
                unsigned int v57 = (0x2DFFFFu >> Script) & 1;
              }
            }
            if ((LODWORD(v89.a) = 0, int v60 = CGPDFTextStringGetCharacterAtIndex(), (v60 - 12352) >= 0xC0)
              && (unsigned __int16)(v60 + 155) >= 0x3Bu
              && ((unsigned int v61 = uscript_getScript(), v61 > 0x16) || ((1 << v61) & 0x520000) == 0)
              || v57)
            {
              insertChar(32, &v87, &v86, &v85, &v88, v74, -2);
              int v56 = 1;
LABEL_73:
              double v51 = v34;
LABEL_74:
              BOOL v30 = v56 != 0;
              v31 = v86;
              v35 = v87;
              v32 = v85;
              goto LABEL_75;
            }
          }
        }
        int v56 = 0;
        goto LABEL_73;
      }
LABEL_91:
      ++v27;
    }
    while (v80 != v27);
    size_t v7 = v68;
    v4 = v69;
    if (v26 >= 1)
    {
      v16 = malloc_type_realloc(v16, 2 * v26, 0x1000040BDFB0063uLL);
      v17 = (unint64_t *)malloc_type_realloc(ptr, 8 * v26, 0x100004000313F17uLL);
      v63 = malloc_type_realloc(v83, 32 * v26, 0x1000040E0EAB150uLL);
      v2 = v70;
      goto LABEL_95;
    }
    v2 = v70;
    v5 = v71;
    v63 = v83;
    v17 = ptr;
LABEL_97:
    v64 = [NSString stringWithCharacters:v16 length:v26];
    free(v16);
    free(v17);
    free(v63);
    CGPDFTextStringRelease();
    v65 = (void *)[objc_allocWithZone((Class)UIAccessibilityPDFElement) initWithAccessibilityContainer:v2];
    size_t v8 = v73;
    [v65 setPage:v73 - 1];
    [v65 setPageCount:v7];
    [v65 setAccessibilityLabel:v64];
    [v4 addObject:v65];

LABEL_98:
    ++v8;
  }
  while (v8 <= v7);
LABEL_99:
  id v66 = v4;

  return v66;
}

- (id)accessibilityContainer
{
  v2 = self;
  if (v2)
  {
    v3 = v2;
    while (([(WebPDFViewAccessibility *)v3 isMemberOfClass:NSClassFromString(&cfstr_Webview.isa)] & 1) == 0)
    {
      v4 = [(WebPDFViewAccessibility *)v3 superview];

      v3 = v4;
      if (!v4) {
        goto LABEL_11;
      }
    }
    v5 = [(WebPDFViewAccessibility *)v3 accessibilityContainer];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v5;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_11:

  return v4;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  -[WebPDFViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", 0, a3.x, a3.y);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  uint64_t v8 = [(WebPDFViewAccessibility *)self accessibilityElementCount];
  if (v8 < 1)
  {
LABEL_5:
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [(WebPDFViewAccessibility *)self accessibilityElementAtIndex:v10];
      [v11 frame];
      v14.CGFloat x = v5;
      v14.CGFloat y = v7;
      if (CGRectContainsPoint(v15, v14)) {
        break;
      }

      if (v9 == ++v10) {
        goto LABEL_5;
      }
    }
  }

  return v11;
}

- (int64_t)accessibilityElementCount
{
  v2 = [(WebPDFViewAccessibility *)self _accessibilityPages];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  double v4 = [(WebPDFViewAccessibility *)self _accessibilityPages];
  CGFloat v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(WebPDFViewAccessibility *)self _accessibilityPages];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (BOOL)hasSpaces:(CGPDFTextString *)a3
{
  unint64_t Length = CGPDFTextStringGetLength();
  if (Length >= 0x200) {
    unint64_t v4 = 512;
  }
  else {
    unint64_t v4 = Length;
  }
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = -1;
    BOOL v7 = 1;
    do
    {
      CharacterAtIndeCGFloat x = CGPDFTextStringGetCharacterAtIndex();
      uint64_t v9 = v5;
      if (CharacterAtIndex == 32)
      {
        uint64_t v9 = v6;
        if ((v6 & 0x8000000000000000) == 0) {
          break;
        }
      }
      BOOL v7 = ++v5 < v4;
      uint64_t v6 = v9;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v7;
}

@end