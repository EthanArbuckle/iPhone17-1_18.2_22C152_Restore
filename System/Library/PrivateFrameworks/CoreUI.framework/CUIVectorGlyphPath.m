@interface CUIVectorGlyphPath
+ (CUIVectorGlyphPathElementLength)realloc_length_array:(CUIVectorGlyphPathElementLength *)a3 withNewCount:(unint64_t)a4;
+ (CUIVectorGlyphPathLengthData)emptyData;
+ (float)realloc_float_array:(float *)a3 withNewCount:(unint64_t)a4;
+ (id)_createAdoptingPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4;
+ (id)createConcatenatingPaths:(id)a3;
+ (id)createFromSubpaths:(id)a3 indices:(id)a4;
+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframeProvider:(id)a4;
+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4;
+ (unint64_t)realloc_long_array:(unint64_t *)a3 withNewCount:(unint64_t)a4;
+ (void)extendClipStrokeKeyframes:(id)a3 withKeyframes:(id)a4 subpathOffset:(float)a5;
- (CUIVectorGlyphPathLengthData)computeLengthData;
- (CUIVectorGlyphPathLengthData)lengthData;
- (NSData)clipStrokeKeyframes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCopyApplyingTransform:(CGAffineTransform *)a3;
- (id)createSubpaths;
- (id)path;
- (int64_t)subpathCount;
- (void)dealloc;
@end

@implementation CUIVectorGlyphPath

uint64_t __34__CUIVectorGlyphPath_subpathCount__block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*a2 == 4)
  {
    if (*(unsigned char *)(v2 + 24))
    {
      ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
      uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    }
    *(unsigned char *)(v2 + 24) = 0;
  }
  else if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
  }
  return result;
}

- (void)dealloc
{
  CGPathRelease((CGPathRef)self->_path);
  self->_path = 0;

  self->_clipStrokeKeyframes = 0;
  subpathLengths = self->_lengthData.subpathLengths;
  if (subpathLengths) {
    free(subpathLengths);
  }
  elementLengths = self->_lengthData.elementLengths;
  if (elementLengths) {
    free(elementLengths);
  }
  elementToSubpath = self->_lengthData.elementToSubpath;
  if (elementToSubpath) {
    free(elementToSubpath);
  }
  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphPath;
  [(CUIVectorGlyphPath *)&v6 dealloc];
}

+ (id)createConcatenatingPaths:(id)a3
{
  Mutable = CGPathCreateMutable();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    float v10 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        CGPathAddPath(Mutable, 0, (CGPathRef)[v12 path]);
        if ([v12 clipStrokeKeyframes])
        {
          if (!v8) {
            id v8 = +[NSMutableData data];
          }
          id v13 = [v12 clipStrokeKeyframes];
          *(float *)&double v14 = v10;
          [a1 extendClipStrokeKeyframes:v8 withKeyframes:v13 subpathOffset:v14];
        }
        float v10 = v10 + (float)(uint64_t)[v12 subpathCount];
      }
      id v7 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  id v15 = [a1 _createAdoptingPath:Mutable clipStrokeKeyframes:v8];
  CGPathRelease(Mutable);
  return v15;
}

- (id)path
{
  return self->_path;
}

- (NSData)clipStrokeKeyframes
{
  return self->_clipStrokeKeyframes;
}

- (int64_t)subpathCount
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  path = (const CGPath *)self->_path;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__CUIVectorGlyphPath_subpathCount__block_invoke;
  v5[3] = &unk_1E5A5F208;
  v5[4] = v10;
  v5[5] = &v6;
  CGPathApplyWithBlock(path, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v3;
}

+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4
{
  uint64_t v7 = objc_opt_new();
  *(void *)(v7 + 56) = MEMORY[0x1A62305F0](a3);
  *(void *)(v7 + 64) = [a4 copy];
  if (a1)
  {
    [a1 emptyData];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  *(_OWORD *)(v7 + 40) = v11;
  *(_OWORD *)(v7 + 24) = v10;
  *(_OWORD *)(v7 + 8) = v9;
  return (id)v7;
}

+ (id)_createAdoptingPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4
{
  uint64_t v7 = objc_opt_new();
  *(void *)(v7 + 56) = CGPathRetain(a3);
  *(void *)(v7 + 64) = a4;
  if (a1)
  {
    [a1 emptyData];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  *(_OWORD *)(v7 + 40) = v11;
  *(_OWORD *)(v7 + 24) = v10;
  *(_OWORD *)(v7 + 8) = v9;
  return (id)v7;
}

+ (CUIVectorGlyphPathLengthData)emptyData
{
  *(_OWORD *)&retstr->elementLengths = 0u;
  *(_OWORD *)&retstr->numSubpaths = 0u;
  *(_OWORD *)&retstr->totalLength = 0u;
  retstr->totalLength = -1.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CUIVectorGlyphPath createWithPath:self->_path clipStrokeKeyframes:self->_clipStrokeKeyframes];
}

+ (void)extendClipStrokeKeyframes:(id)a3 withKeyframes:(id)a4 subpathOffset:(float)a5
{
  if ([a4 length] && objc_msgSend(a4, "length") && objc_msgSend(a4, "length"))
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = 0;
      objc_msgSend(a3, "appendBytes:length:", (char *)objc_msgSend(a4, "bytes") + v8, 8);
      objc_msgSend(a4, "getBytes:range:", (char *)&v9 + 4, v8 + 8, 4);
      objc_msgSend(a4, "getBytes:range:", &v9, v8 + 12, 4);
      *(float *)&uint64_t v9 = *(float *)&v9 + a5;
      *((float *)&v9 + 1) = *((float *)&v9 + 1) + a5;
      [a3 appendBytes:(char *)&v9 + 4 length:4];
      [a3 appendBytes:&v9 length:4];
      v8 += 16;
    }
    while (v8 < (unint64_t)[a4 length]);
  }
}

void __39__CUIVectorGlyphPath_computeLengthData__block_invoke(void *a1, int *a2)
{
  int v4 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
  unint64_t v6 = *(void *)(*(void *)(a1[8] + 8) + 24);
  if (*(void *)(*(void *)(a1[7] + 8) + 24) + 1 > v6)
  {
    unint64_t v7 = (unint64_t)((double)v6 * 1.5);
    *(void *)(*(void *)(a1[9] + 8) + 24) = objc_msgSend((id)objc_opt_class(), "realloc_length_array:withNewCount:", *(void *)(*(void *)(a1[9] + 8) + 24), v7);
    *(void *)(*(void *)(a1[10] + 8) + 24) = objc_msgSend((id)objc_opt_class(), "realloc_long_array:withNewCount:", *(void *)(*(void *)(a1[10] + 8) + 24), v7);
    *(void *)(*(void *)(a1[8] + 8) + 24) = v7;
  }
  int v8 = *a2;
  float v9 = 0.0;
  long long v10 = (double *)*((void *)a2 + 1);
  switch(v8)
  {
    case 0:
      *(_OWORD *)(*(void *)(a1[11] + 8) + 32) = *(_OWORD *)v10;
      goto LABEL_11;
    case 1:
      float v9 = CGPathLineLength(*(double *)(*(void *)(a1[12] + 8) + 32), *(double *)(*(void *)(a1[12] + 8) + 40), *v10, v10[1]);
      *(float *)(*(void *)(a1[5] + 8) + 24) = *(float *)(*(void *)(a1[5] + 8) + 24) + v9;
LABEL_11:
      long long v19 = *(CGPoint **)(a1[12] + 8);
      CGPoint v20 = *(CGPoint *)v10;
      goto LABEL_17;
    case 2:
      CGPathQuadraticLength(*(double *)(*(void *)(a1[12] + 8) + 32), *(double *)(*(void *)(a1[12] + 8) + 40), *v10, v10[1], v10[2], v10[3]);
      float v9 = v21;
      *(float *)(*(void *)(a1[5] + 8) + 24) = *(float *)(*(void *)(a1[5] + 8) + 24) + v9;
      long long v19 = *(CGPoint **)(a1[12] + 8);
      CGPoint v20 = (CGPoint)*((_OWORD *)v10 + 1);
      goto LABEL_17;
    case 3:
      float v9 = CGPathCubicLength(*(double *)(*(void *)(a1[12] + 8) + 32), *(double *)(*(void *)(a1[12] + 8) + 40), *v10, v10[1], v10[2], v10[3], v10[4], v10[5]);
      *(float *)(*(void *)(a1[5] + 8) + 24) = *(float *)(*(void *)(a1[5] + 8) + 24) + v9;
      long long v19 = *(CGPoint **)(a1[12] + 8);
      CGPoint v20 = (CGPoint)*((_OWORD *)v10 + 2);
      goto LABEL_17;
    case 4:
      unint64_t v11 = *(void *)(*(void *)(a1[13] + 8) + 24);
      if (*(void *)(*(void *)(a1[6] + 8) + 24) + 1 > v11)
      {
        unint64_t v12 = (unint64_t)((double)v11 * 1.5);
        *(void *)(*(void *)(a1[14] + 8) + 24) = objc_msgSend((id)objc_opt_class(), "realloc_float_array:withNewCount:", *(void *)(*(void *)(a1[14] + 8) + 24), v12);
        *(void *)(*(void *)(a1[13] + 8) + 24) = v12;
      }
      uint64_t v13 = *(void *)(a1[11] + 8);
      double v14 = *(double *)(v13 + 32);
      uint64_t v15 = *(void *)(a1[12] + 8);
      double v16 = *(double *)(v15 + 32);
      if (vabdd_f64(v14, v16) >= 2.22044605e-16)
      {
        double v18 = *(double *)(v15 + 40);
        double v17 = *(double *)(v13 + 40);
      }
      else
      {
        double v17 = *(double *)(v13 + 40);
        double v18 = *(double *)(v15 + 40);
        float v9 = 0.0;
        if (vabdd_f64(v17, v18) < 2.22044605e-16) {
          goto LABEL_16;
        }
      }
      float v9 = CGPathLineLength(v16, v18, v14, v17);
LABEL_16:
      *(float *)(*(void *)(a1[5] + 8) + 24) = v9 + *(float *)(*(void *)(a1[5] + 8) + 24);
      *(_DWORD *)(*(void *)(*(void *)(a1[14] + 8) + 24) + 4 * v5) = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      *(float *)(*(void *)(a1[15] + 8) + 24) = *(float *)(*(void *)(a1[5] + 8) + 24)
                                                   + *(float *)(*(void *)(a1[15] + 8) + 24);
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
      *(_OWORD *)(*(void *)(a1[12] + 8) + 32) = *(_OWORD *)(*(void *)(a1[11] + 8) + 32);
      long long v19 = *(CGPoint **)(a1[11] + 8);
      CGPoint v20 = CGPointZero;
LABEL_17:
      v19[2] = v20;
LABEL_18:
      uint64_t v22 = *(void *)(*(void *)(a1[9] + 8) + 24) + 8 * *(void *)(*(void *)(a1[7] + 8) + 24);
      *(_DWORD *)uint64_t v22 = v4;
      *(float *)(v22 + 4) = v9;
      *(void *)(*(void *)(*(void *)(a1[10] + 8) + 24) + 8 * (*(void *)(*(void *)(a1[7] + 8) + 24))++) = v5;
      return;
    default:
      goto LABEL_18;
  }
}

+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframeProvider:(id)a4
{
  uint64_t v6 = objc_opt_new();
  *(void *)(v6 + 56) = MEMORY[0x1A62305F0](a3);
  *(void *)(v6 + 64) = 0;
  [(id)v6 computeLengthData];
  long long v7 = v10;
  long long v8 = v11;
  *(_OWORD *)(v6 + 40) = v12;
  *(_OWORD *)(v6 + 24) = v8;
  *(_OWORD *)(v6 + 8) = v7;
  *(void *)(v6 + 64) = (id)(*((uint64_t (**)(id, uint64_t))a4 + 2))(a4, v6);
  return (id)v6;
}

- (CUIVectorGlyphPathLengthData)computeLengthData
{
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 6;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 50;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  v36 = 0;
  v36 = malloc_type_calloc(6uLL, 4uLL, 0x100004052888210uLL);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  v32 = 0;
  v32 = malloc_type_calloc(v46[3], 8uLL, 0x100004000313F17uLL);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  v28 = 0;
  v28 = malloc_type_calloc(v46[3], 8uLL, 0x100004000313F17uLL);
  uint64_t v21 = 0;
  uint64_t v22 = (float *)&v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3010000000;
  v17[3] = &unk_1A13C9C2D;
  CGPoint v18 = CGPointZero;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3010000000;
  v15[3] = &unk_1A13C9C2D;
  CGPoint v16 = v18;
  path = (const CGPath *)self->_path;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __39__CUIVectorGlyphPath_computeLengthData__block_invoke;
  v14[3] = &unk_1E5A5F1E0;
  v14[6] = &v41;
  v14[7] = &v37;
  v14[8] = &v45;
  v14[9] = &v29;
  v14[4] = self;
  v14[5] = v19;
  v14[10] = &v25;
  v14[11] = v15;
  v14[12] = v17;
  v14[13] = v49;
  v14[14] = &v33;
  v14[15] = &v21;
  CGPathApplyWithBlock(path, v14);
  id v6 = objc_msgSend((id)objc_opt_class(), "realloc_float_array:withNewCount:", v34[3], v42[3]);
  v34[3] = (uint64_t)v6;
  id v7 = objc_msgSend((id)objc_opt_class(), "realloc_length_array:withNewCount:", v30[3], v38[3]);
  v30[3] = (uint64_t)v7;
  long long v8 = (unint64_t *)objc_msgSend((id)objc_opt_class(), "realloc_long_array:withNewCount:", v26[3], v38[3]);
  v26[3] = (uint64_t)v8;
  *(_OWORD *)&retstr->totalLength = 0u;
  *(_OWORD *)&retstr->elementLengths = 0u;
  *(_OWORD *)&retstr->numSubpaths = 0u;
  retstr->totalLength = v22[6];
  unint64_t v9 = v42[3];
  if (v9) {
    long long v10 = (float *)v34[3];
  }
  else {
    long long v10 = 0;
  }
  retstr->subpathLengths = v10;
  unint64_t v11 = v38[3];
  if (v11)
  {
    long long v12 = (CUIVectorGlyphPathElementLength *)v30[3];
  }
  else
  {
    long long v12 = 0;
    long long v8 = 0;
  }
  retstr->elementLengths = v12;
  retstr->elementToSubpath = v8;
  retstr->numSubpaths = v9;
  retstr->numElements = v11;
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);
  return result;
}

+ (unint64_t)realloc_long_array:(unint64_t *)a3 withNewCount:(unint64_t)a4
{
  result = (unint64_t *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:@"FailedRealloc" format:@"Requested size was not available"];
    return a3;
  }
  return result;
}

+ (CUIVectorGlyphPathElementLength)realloc_length_array:(CUIVectorGlyphPathElementLength *)a3 withNewCount:(unint64_t)a4
{
  result = (CUIVectorGlyphPathElementLength *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:@"FailedRealloc" format:@"Requested size was not available"];
    return a3;
  }
  return result;
}

+ (float)realloc_float_array:(float *)a3 withNewCount:(unint64_t)a4
{
  result = (float *)malloc_type_realloc(a3, 4 * a4, 0x100004052888210uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:@"FailedRealloc" format:@"Requested size was not available"];
    return a3;
  }
  return result;
}

- (CUIVectorGlyphPathLengthData)lengthData
{
  p_subpathLengths = &self->subpathLengths;
  if (*(float *)&self->subpathLengths >= 0.0)
  {
    long long v6 = *(_OWORD *)&self->elementToSubpath;
    *(_OWORD *)&retstr->totalLength = *(_OWORD *)p_subpathLengths;
    *(_OWORD *)&retstr->elementLengths = v6;
    *(_OWORD *)&retstr->numSubpaths = *(_OWORD *)&self->numElements;
  }
  else
  {
    *(_OWORD *)&retstr->elementLengths = 0u;
    *(_OWORD *)&retstr->numSubpaths = 0u;
    *(_OWORD *)&retstr->totalLength = 0u;
    self = (CUIVectorGlyphPathLengthData *)[(CUIVectorGlyphPathLengthData *)self computeLengthData];
    long long v5 = *(_OWORD *)&retstr->elementLengths;
    *(_OWORD *)p_subpathLengths = *(_OWORD *)&retstr->totalLength;
    *((_OWORD *)p_subpathLengths + 1) = v5;
    *((_OWORD *)p_subpathLengths + 2) = *(_OWORD *)&retstr->numSubpaths;
  }
  return self;
}

+ (id)createFromSubpaths:(id)a3 indices:(id)a4
{
  Mutable = CGPathCreateMutable();
  id v8 = [a3 count];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [a4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v22;
    float v13 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(a4);
        }
        id v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) integerValue];
        if (v15 < v8)
        {
          id v16 = [a3 objectAtIndex:v15];
          CGPathAddPath(Mutable, 0, (CGPathRef)[v16 path]);
          if ([v16 clipStrokeKeyframes])
          {
            if (!v11) {
              id v11 = +[NSMutableData data];
            }
            id v17 = [v16 clipStrokeKeyframes];
            *(float *)&double v18 = v13;
            [a1 extendClipStrokeKeyframes:v11 withKeyframes:v17 subpathOffset:v18];
          }
          float v13 = v13 + 1.0;
        }
      }
      id v10 = [a4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  id v19 = [a1 _createAdoptingPath:Mutable clipStrokeKeyframes:v11];
  CGPathRelease(Mutable);
  return v19;
}

- (id)createCopyApplyingTransform:(CGAffineTransform *)a3
{
  int v4 = (const CGPath *)MEMORY[0x1A6230620](self->_path, a3);
  id v5 = +[CUIVectorGlyphPath _createAdoptingPath:v4 clipStrokeKeyframes:self->_clipStrokeKeyframes];
  CGPathRelease(v4);
  return v5;
}

- (id)createSubpaths
{
  path = (const CGPath *)self->_path;
  id v4 = +[NSMutableDictionary dictionary];
  clipStrokeKeyframes = self->_clipStrokeKeyframes;
  if (clipStrokeKeyframes && [(NSData *)clipStrokeKeyframes length])
  {
    unint64_t v6 = 0;
    do
    {
      LODWORD(v14[0]) = 0;
      float v15 = 0.0;
      -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", v14, v6 + 8, 4);
      -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", &v15, v6 + 12, 4);
      float v8 = floorf(*(float *)v14);
      if (v8 == floorf(v15))
      {
        *(float *)&double v7 = v8;
        id v9 = +[NSNumber numberWithFloat:v7];
        id v10 = [v4 objectForKey:v9];
        if (!v10)
        {
          id v10 = +[NSMutableData data];
          [v4 setObject:v10 forKey:v9];
        }
        objc_msgSend(v10, "appendBytes:length:", (char *)-[NSData bytes](self->_clipStrokeKeyframes, "bytes") + v6, 8);
        -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", v14, v6 + 8, 4);
        -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", &v15, v6 + 12, 4);
        *(float *)double v14 = *(float *)v14 - v8;
        float v15 = v15 - v8;
        [v10 appendBytes:v14 length:4];
        [v10 appendBytes:&v15 length:4];
      }
      v6 += 16;
    }
    while (v6 < [(NSData *)self->_clipStrokeKeyframes length]);
  }
  if (!path) {
    return 0;
  }
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __36__CUIVectorGlyphPath_createSubpaths__block_invoke;
  v13[3] = &unk_1E5A5F230;
  v13[5] = v4;
  v13[6] = v14;
  v13[4] = v11;
  CGPathApplyWithBlock(path, v13);
  _Block_object_dispose(v14, 8);
  return v11;
}

void __36__CUIVectorGlyphPath_createSubpaths__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(_DWORD *)a2 == 4) {
      return;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGPathCreateMutable();
  }
  switch(*(_DWORD *)a2)
  {
    case 0:
      id v4 = *(CGPath **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v5 = *(double **)(a2 + 8);
      CGFloat v6 = *v5;
      CGFloat v7 = v5[1];
      CGPathMoveToPoint(v4, 0, v6, v7);
      break;
    case 1:
      float v8 = *(CGPath **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v9 = *(double **)(a2 + 8);
      CGFloat v10 = *v9;
      CGFloat v11 = v9[1];
      CGPathAddLineToPoint(v8, 0, v10, v11);
      break;
    case 2:
      uint64_t v12 = *(CGPath **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      float v13 = *(double **)(a2 + 8);
      CGFloat v14 = *v13;
      CGFloat v15 = v13[1];
      CGFloat v16 = v13[2];
      CGFloat v17 = v13[3];
      CGPathAddQuadCurveToPoint(v12, 0, v14, v15, v16, v17);
      break;
    case 3:
      double v18 = *(CGPath **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v19 = *(double **)(a2 + 8);
      CGFloat v20 = *v19;
      CGFloat v21 = v19[1];
      CGFloat v22 = v19[2];
      CGFloat v23 = v19[3];
      CGFloat v24 = v19[4];
      CGFloat v25 = v19[5];
      CGPathAddCurveToPoint(v18, 0, v20, v21, v22, v23, v24, v25);
      break;
    case 4:
      v26 = *(CGPath **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v26)
      {
        CGPathCloseSubpath(v26);
        *(float *)&double v27 = (float)(unint64_t)[*(id *)(a1 + 32) count];
        id v28 = +[CUIVectorGlyphPath _createAdoptingPath:clipStrokeKeyframes:](CUIVectorGlyphPath, "_createAdoptingPath:clipStrokeKeyframes:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27)));
        CGPathRelease(*(CGPathRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
        [*(id *)(a1 + 32) addObject:v28];

        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
      break;
    default:
      return;
  }
}

@end