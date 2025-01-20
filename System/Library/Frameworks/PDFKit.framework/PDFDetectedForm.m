@interface PDFDetectedForm
- (PDFDetectedForm)initWithPage:(id)a3 displayBox:(int64_t)a4;
- (id).cxx_construct;
- (id)detectedFormFieldAtIndex:(unint64_t)a3;
- (id)detectedFormFieldNearestPoint:(CGPoint)a3;
- (int64_t)_classifyRect:(CGRect)a3;
- (int64_t)displayBox;
- (unint64_t)count;
- (vector<const)_collectGlyphEntriesInDisplayList:(PDFDetectedForm *)self medianGlyphHeight:(SEL)a3;
- (void)_insertFieldRect:(const CGRect *)a3 ofKind:(int64_t)a4;
@end

@implementation PDFDetectedForm

- (PDFDetectedForm)initWithPage:(id)a3 displayBox:(int64_t)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PDFDetectedForm;
  v7 = [(PDFDetectedForm *)&v39 init];
  if (!v7)
  {
LABEL_18:
    v8 = v7;
    goto LABEL_19;
  }
  v8 = (PDFDetectedForm *)[v6 createDisplayListForFormDetection];
  v38[1] = v8;
  if (v8)
  {
    v7->_displayBox = a4;
    [v6 boundsForBox:a4];
    double v10 = v9;
    double v12 = v11;
    [v6 boundsForBox:0];
    double v14 = v13;
    double v16 = v15;
    v38[0] = 0;
    [(PDFDetectedForm *)v7 _collectGlyphEntriesInDisplayList:v8 medianGlyphHeight:v38];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3321888768;
    v27 = __43__PDFDetectedForm_initWithPage_displayBox___block_invoke;
    v28 = &unk_26C515300;
    double v30 = v10 - v14;
    double v31 = v12 - v16;
    v17 = v7;
    v29 = v17;
    uint64_t v32 = v38[0];
    v34 = 0;
    uint64_t v35 = 0;
    __p = 0;
    std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(&__p, v36, (uint64_t)v37, (v37 - (unsigned char *)v36) >> 3);
    CGDisplayListEnumerateEntriesWithOptions();
    begin = v17->_rows.__begin_;
    end = v17->_rows.__end_;
    if (begin == end) {
      goto LABEL_12;
    }
    do
    {
      PDFDetectedFormRow::mergeFields(begin);
      begin = (PDFDetectedFormRow *)((char *)begin + 32);
    }
    while (begin != end);
    v20 = v17->_rows.__begin_;
    v21 = v17->_rows.__end_;
    if (v21 == v20)
    {
LABEL_12:
      unint64_t v22 = 0;
    }
    else
    {
      unint64_t v22 = 0;
      do
      {
        v23 = (id *)*((void *)v21 - 3);
        if (v23 != *((id **)v21 - 2))
        {
          do
            objc_msgSend(*v23++, "setIndex:", v22++, v25, v26, v27, v28, v29, *(void *)&v30, *(void *)&v31, v32);
          while (v23 != *((id **)v21 - 2));
          v20 = v17->_rows.__begin_;
        }
        v21 = (PDFDetectedFormRow *)((char *)v21 - 32);
      }
      while (v21 != v20);
    }
    v17->_fieldCount = v22;
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }

    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    CFRelease(v8);
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

void __43__PDFDetectedForm_initWithPage_displayBox___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  CGDisplayListEntryGetBoundingBox();
  if (!CGRectIsEmpty(v34))
  {
    if (CGDisplayListEntryGetType() == 2)
    {
      uint64_t Path = CGDisplayListEntryPathGetPath();
      if (Path)
      {
        v3 = (const CGPath *)Path;
        CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
        v28.origin = (CGPoint)*MEMORY[0x263F001A0];
        v28.size = v4;
        if (CGPathIsLine() && v32.scale.height == v32.rotation)
        {
          v28.origin = (CGPoint)v32.scale;
          v28.size = (CGSize)COERCE_UNSIGNED_INT64(v32.horizontalShear - v32.scale.width);
        }
        else if (CGPathIsRect(v3, &recta))
        {
          CGRect v28 = recta;
        }
        if (!CGRectIsNull(v28))
        {
          CGRect v35 = CGRectOffset(v28, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
          CGFloat x = v35.origin.x;
          CGFloat y = v35.origin.y;
          CGFloat width = v35.size.width;
          CGFloat height = v35.size.height;
          CGRect v28 = v35;
          uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_classifyRect:");
          uint64_t v10 = v9;
          if (v9)
          {
            if (v9 != 1) {
              goto LABEL_22;
            }
            v36.origin.CGFloat x = x;
            v36.origin.CGFloat y = y;
            v36.size.CGFloat width = width;
            v36.size.CGFloat height = height;
            CGFloat MidY = CGRectGetMidY(v36);
            v28.origin.CGFloat y = MidY;
            v28.size.CGFloat height = 0.0;
            double v12 = *(double *)(a1 + 56);
            double v13 = objc_opt_new();
            uint64_t v14 = *(void *)(a1 + 64);
            uint64_t v15 = *(void *)(a1 + 72);
            if (v14 != v15)
            {
              double v16 = ceil(v12);
              do
              {
                CGDisplayListEntryGetBoundingBox();
                v42.origin.CGFloat x = x;
                v42.origin.CGFloat y = MidY;
                v42.size.CGFloat width = width;
                v42.size.CGFloat height = v16;
                CGRect v38 = CGRectIntersection(v37, v42);
                CGFloat v17 = v38.origin.x;
                CGFloat v18 = v38.origin.y;
                CGFloat v19 = v38.size.width;
                CGFloat v20 = v38.size.height;
                if (!CGRectIsNull(v38))
                {
                  v39.origin.CGFloat x = v17;
                  v39.origin.CGFloat y = v18;
                  v39.size.CGFloat width = v19;
                  v39.size.CGFloat height = v20;
                  CGRect v40 = CGRectIntegral(v39);
                  objc_msgSend(v13, "addIndexesInRange:", (unint64_t)v40.origin.x, (unint64_t)v40.size.width);
                }
                v14 += 8;
              }
              while (v14 != v15);
            }
            v41.size.CGFloat height = 0.0;
            v41.origin.CGFloat x = x;
            v41.origin.CGFloat y = MidY;
            v41.size.CGFloat width = width;
            double v21 = CGRectGetWidth(v41);
            BOOL v22 = v21 - (double)(unint64_t)[v13 count] >= 20.0;

            if (v22) {
LABEL_22:
            }
              [*(id *)(a1 + 32) _insertFieldRect:&v28 ofKind:v10];
          }
        }
      }
    }
    else if (CGDisplayListEntryGetType() == 1)
    {
      long long v31 = 0u;
      memset(&recta, 0, sizeof(recta));
      CGDisplayListEntryGlyphsGetCTM();
      long long v29 = 0u;
      memset(&v28, 0, sizeof(v28));
      CGDisplayListEntryGlyphsGetFTM();
      memset(&v32, 0, sizeof(v32));
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformConcat(&transform, &t1, &t2);
      CGAffineTransformDecompose(&v32, &transform);
      if (fabs(v32.rotation) <= 2.22044605e-14)
      {
        if (CGDisplayListEntryGlyphsGetFont())
        {
          __int16 v24 = 95;
          CGGlyph glyphs = 0;
          CGFontGetGlyphsForUnichars();
        }
      }
    }
  }
}

- (id)detectedFormFieldNearestPoint:(CGPoint)a3
{
  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  if (begin == end) {
    goto LABEL_20;
  }
  double x = a3.x;
  unint64_t v6 = (end - begin) >> 5;
  v7 = (double *)self->_rows.__begin_;
  do
  {
    unint64_t v8 = v6 >> 1;
    uint64_t v9 = &v7[4 * (v6 >> 1)];
    double v11 = *v9;
    uint64_t v10 = v9 + 4;
    v6 += ~(v6 >> 1);
    if (v11 < a3.y) {
      v7 = v10;
    }
    else {
      unint64_t v6 = v8;
    }
  }
  while (v6);
  if (v7 == (double *)end)
  {
    begin = (PDFDetectedFormRow *)((char *)end - 32);
  }
  else if (v7 != (double *)begin)
  {
    begin = (PDFDetectedFormRow *)v7;
    if (vabdd_f64(a3.y, *v7) >= vabdd_f64(a3.y, *(v7 - 4))) {
      begin = (PDFDetectedFormRow *)(v7 - 4);
    }
  }
  if (*((void *)begin + 2) == *((void *)begin + 1)
    || vabdd_f64(a3.y, *(double *)begin) > 20.0
    || (double v12 = PDFDetectedFormRow::fieldNearestXCoordinate(begin, a3.x), *((id **)begin + 2) == v12))
  {
LABEL_20:
    id v18 = 0;
  }
  else
  {
    id v13 = *v12;
    [v13 minX];
    if (x >= v14 && ([v13 maxX], x < v15)
      || ([v13 minX], vabdd_f64(x, v16) <= 20.0)
      || ([v13 maxX], vabdd_f64(x, v17) <= 20.0))
    {
      id v18 = v13;
    }
    else
    {
      id v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)count
{
  return self->_fieldCount;
}

- (id)detectedFormFieldAtIndex:(unint64_t)a3
{
  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  if (end == begin)
  {
LABEL_7:
    id v8 = 0;
    goto LABEL_9;
  }
  unint64_t v5 = 0;
  while (1)
  {
    unint64_t v6 = a3 - v5;
    if (a3 >= v5) {
      break;
    }
    v5 += (uint64_t)(*((void *)end - 2) - *((void *)end - 3)) >> 3;
LABEL_6:
    end = (PDFDetectedFormRow *)((char *)end - 32);
    if (end == begin) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = *((void *)end - 3);
  v5 += (*((void *)end - 2) - v7) >> 3;
  if (v5 <= a3) {
    goto LABEL_6;
  }
  id v8 = *(id *)(v7 + 8 * v6);
LABEL_9:

  return v8;
}

- (void)_insertFieldRect:(const CGRect *)a3 ofKind:(int64_t)a4
{
  double MidY = CGRectGetMidY(*a3);
  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  p_rows = (uint64_t *)&self->_rows;
  if (end == begin)
  {
    begin = end;
  }
  else
  {
    unint64_t v11 = (end - begin) >> 5;
    do
    {
      unint64_t v12 = v11 >> 1;
      id v13 = (double *)((char *)begin + 32 * (v11 >> 1));
      double v15 = *v13;
      double v14 = (PDFDetectedFormRow *)(v13 + 4);
      v11 += ~(v11 >> 1);
      if (v15 < MidY) {
        begin = v14;
      }
      else {
        unint64_t v11 = v12;
      }
    }
    while (v11);
  }
  if (end == begin || *(double *)begin != MidY)
  {
    double v17 = MidY;
    memset(v18, 0, sizeof(v18));
    begin = (PDFDetectedFormRow *)std::vector<PDFDetectedFormRow>::insert(p_rows, (uint64_t)begin, (uint64_t)&v17);
    CGFloat v19 = (void **)v18;
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v19);
  }
  double v16 = -[PDFDetectedFormField initWithRect:andKind:]([PDFDetectedFormField alloc], "initWithRect:andKind:", a4, a3->origin.x, a3->origin.y, a3->size.width, a3->size.height);
  PDFDetectedFormRow::insertField(begin, v16);
}

- (vector<const)_collectGlyphEntriesInDisplayList:(PDFDetectedForm *)self medianGlyphHeight:(SEL)a3
{
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x4812000000;
  v23 = __Block_byref_object_copy__3;
  __int16 v24 = __Block_byref_object_dispose__3;
  uint64_t v25 = &unk_21442F44B;
  v27[0] = 0;
  v27[1] = 0;
  uint64_t v26 = v27;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x4812000000;
  double v14 = __Block_byref_object_copy__49;
  double v15 = __Block_byref_object_dispose__50;
  double v16 = &unk_21442F44B;
  id v18 = 0;
  uint64_t v19 = 0;
  __p = 0;
  unint64_t NumberOfEntriesOfType = CGDisplayListGetNumberOfEntriesOfType();
  std::vector<CGDisplayListEntry const*>::reserve(&__p, NumberOfEntriesOfType);
  CGDisplayListEnumerateEntriesWithOptions();
  unint64_t v8 = v21[8];
  if (v8)
  {
    CGRect v28 = (double *)v21[6];
    std::__advance[abi:ne180100]<std::__tree_const_iterator<double,std::__tree_node<double,void *> *,long>>((void **)&v28, v8 >> 1);
    *a5 = v28[4];
  }
  uint64_t v9 = v12;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(retstr, (const void *)v9[6], v9[7], (v9[7] - v9[6]) >> 3);
  _Block_object_dispose(&v11, 8);
  if (__p)
  {
    id v18 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v20, 8);
  std::__tree<double>::destroy((uint64_t)&v26, v27[0]);
  return result;
}

void __71__PDFDetectedForm__collectGlyphEntriesInDisplayList_medianGlyphHeight___block_invoke(uint64_t a1, uint64_t a2)
{
  if (CGDisplayListEntryGetType() == 1)
  {
    CGDisplayListEntryGetBoundingBox();
    if (!CGRectIsEmpty(v37))
    {
      float64x2_t v35 = 0u;
      CGVector translation = (CGVector)0;
      float64x2_t scale = 0u;
      CGDisplayListEntryGlyphsGetCTM();
      memset(&v33, 0, sizeof(v33));
      CGDisplayListEntryGlyphsGetFTM();
      memset(&v32, 0, sizeof(v32));
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformConcat(&v32, &t1, &t2);
      Font = (CGFont *)CGDisplayListEntryGlyphsGetFont();
      CGDisplayListEntryGlyphsGetScale();
      double v6 = v5;
      FontBBodouble x = CGFontGetFontBBox(Font);
      double width = FontBBox.size.width;
      double height = FontBBox.size.height;
      double UnitsPerEm = (double)CGFontGetUnitsPerEm(Font);
      CGAffineTransform transform = v32;
      memset(&v29, 0, sizeof(v29));
      CGAffineTransformDecompose(&v29, &transform);
      if (fabs(v29.rotation) > 2.22044605e-14)
      {
        *(float64x2_t *)&v26.a = scale;
        *(float64x2_t *)&v26.c = v35;
        *(CGVector *)&v26.tdouble x = translation;
        CGAffineTransformDecompose(&v27, &v26);
        CGAffineTransformComponents v29 = v27;
        CGAffineTransformMakeScale((CGAffineTransform *)&v27, fabs(v27.scale.width), fabs(v27.scale.height));
        float64x2_t scale = (float64x2_t)v27.scale;
        float64x2_t v35 = *(float64x2_t *)&v27.horizontalShear;
        CGVector translation = v27.translation;
        CGAffineTransformComponents v25 = v33;
        CGAffineTransformDecompose(&v27, (CGAffineTransform *)&v25);
        CGAffineTransformComponents v29 = v27;
        CGAffineTransformMakeScale((CGAffineTransform *)&v27, fabs(v27.scale.width), fabs(v27.scale.height));
        CGAffineTransformComponents v33 = v27;
      }
      CGAffineTransformMakeScale((CGAffineTransform *)&v27, v6 / UnitsPerEm * v33.scale.width, v6 / UnitsPerEm * v33.rotation);
      CGAffineTransform v32 = (CGAffineTransform)v27;
      v27.float64x2_t scale = (CGSize)vmlaq_n_f64(vmulq_n_f64(v35, height * v27.rotation + v27.scale.height * width), scale, height * v27.horizontalShear + v27.scale.width * width);
      std::__tree<double>::__emplace_unique_key_args<double,double const&>((uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48), &v27.scale.height, (uint64_t *)&v27.scale.height);
      uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = (void *)v10[7];
      unint64_t v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        uint64_t v14 = v10[6];
        uint64_t v15 = ((uint64_t)v11 - v14) >> 3;
        if ((unint64_t)(v15 + 1) >> 61) {
          std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v12 - v14;
        uint64_t v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
          uint64_t v17 = v15 + 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(v10 + 8), v18);
        }
        else {
          uint64_t v19 = 0;
        }
        uint64_t v20 = &v19[8 * v15];
        double v21 = &v19[8 * v18];
        *(void *)uint64_t v20 = a2;
        uint64_t v13 = v20 + 8;
        v23 = (char *)v10[6];
        uint64_t v22 = (char *)v10[7];
        if (v22 != v23)
        {
          do
          {
            uint64_t v24 = *((void *)v22 - 1);
            v22 -= 8;
            *((void *)v20 - 1) = v24;
            v20 -= 8;
          }
          while (v22 != v23);
          uint64_t v22 = (char *)v10[6];
        }
        v10[6] = v20;
        v10[7] = v13;
        v10[8] = v21;
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *uint64_t v11 = a2;
        uint64_t v13 = v11 + 1;
      }
      v10[7] = v13;
    }
  }
}

- (int64_t)_classifyRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetWidth(a3);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v14);
  if (v8 <= 2.0 && v7 >= 20.0) {
    return 1;
  }
  double v10 = v7 / v8;
  if (v8 >= 16.0 && v10 > 3.0) {
    return 2;
  }
  if (v10 > 1.0 || v10 < 0.75 || v8 > 24.0 || v8 < 16.0) {
    return 0;
  }
  else {
    return 2;
  }
}

- (int64_t)displayBox
{
  return self->_displayBox;
}

- (void).cxx_destruct
{
  p_rows = &self->_rows;
  std::vector<PDFDetectedFormRow>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_rows);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end