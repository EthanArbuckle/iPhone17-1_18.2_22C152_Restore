@interface AKPotrace
+ (CGPath)newCGPathFromPotracePath:(potrace_path_s *)a3;
- (AKPotrace)initWithCGImage:(CGImage *)a3 flipped:(BOOL)a4 whiteIsInside:(BOOL)a5;
- (CGPath)CGPath;
- (double)alphamax;
- (double)opttolerance;
- (int)opticurve;
- (int)turdsize;
- (int)turnpolicy;
- (void)_clearPathIfNecessary;
- (void)_generatePath;
- (void)dealloc;
- (void)setAlphamax:(double)a3;
- (void)setOpticurve:(int)a3;
- (void)setOpttolerance:(double)a3;
- (void)setTurdsize:(int)a3;
- (void)setTurnpolicy:(int)a3;
@end

@implementation AKPotrace

- (AKPotrace)initWithCGImage:(CGImage *)a3 flipped:(BOOL)a4 whiteIsInside:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v44.receiver = self;
  v44.super_class = (Class)AKPotrace;
  v8 = [(AKPotrace *)&v44 init];
  if (!v8) {
    return v8;
  }
  sub_2376DB208();
  v8->_potraceParameters = v9;
  v10 = (potrace_bitmap_s *)malloc_type_malloc(0x18uLL, 0x1010040B3F21DC8uLL);
  v8->_potraceBitmap = v10;
  if (!v10) {
    goto LABEL_27;
  }
  v8->_potraceBitmap->uint64_t var0 = CGImageGetWidth(a3);
  int Height = CGImageGetHeight(a3);
  potraceBitmap = v8->_potraceBitmap;
  unint64_t v13 = (unint64_t)(potraceBitmap->var0 + 63) >> 6;
  potraceBitmap->uint64_t var1 = Height;
  potraceBitmap->uint64_t var2 = v13;
  potraceBitmap->var3 = 0;
  v14 = v8->_potraceBitmap;
  uint64_t var1 = v14->var1;
  uint64_t var2 = v14->var2;
  if ((((unsigned __int128)(var2 * (__int128)var1) >> 64) & 1) != 0
    || (v8->_potraceBitmap->var3 = (unint64_t *)malloc_type_calloc((int)var2 * (uint64_t)(int)var1, 8uLL, 0xC3D59F45uLL), v17 = v8->_potraceBitmap, !v17->var3)|| (uint64_t var0 = v17->var0, v19 = v17->var1, (((unsigned __int128)(v19 * (__int128)var0) >> 64) & 1) != 0))
  {
LABEL_27:
    v25 = 0;
    DeviceGray = 0;
    v22 = 0;
    goto LABEL_28;
  }
  size_t v20 = (int)v19 * (uint64_t)(int)var0;
  v21 = (char *)malloc_type_malloc(v20, 0x38A4B399uLL);
  v22 = v21;
  if (!v21)
  {
    v25 = 0;
    DeviceGray = 0;
    goto LABEL_28;
  }
  memset(v21, 255, v20);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray)
  {
    v25 = 0;
    goto LABEL_28;
  }
  v24 = CGBitmapContextCreate(v22, v8->_potraceBitmap->var0, v8->_potraceBitmap->var1, 8uLL, v8->_potraceBitmap->var0, DeviceGray, 0);
  v25 = v24;
  if (!v24)
  {
LABEL_28:
    char v33 = 0;
    goto LABEL_29;
  }
  if (v6)
  {
    CGContextTranslateCTM(v24, 0.0, (double)v8->_potraceBitmap->var1);
    CGContextScaleCTM(v25, 1.0, -1.0);
  }
  CGFloat Width = (double)CGImageGetWidth(a3);
  v45.size.height = (double)CGImageGetHeight(a3);
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.width = Width;
  CGContextDrawImage(v25, v45, a3);
  v27 = v8->_potraceBitmap;
  uint64_t v28 = v27->var1;
  if ((int)v28 < 1)
  {
    char v33 = 1;
    goto LABEL_29;
  }
  uint64_t v29 = 0;
  int v30 = v27->var0;
  var3 = v27->var3;
  uint64_t v32 = v27->var2;
  char v33 = 1;
  do
  {
    if (v30 < 1) {
      goto LABEL_25;
    }
    unint64_t v34 = 0;
    uint64_t v35 = 0;
    v36 = &var3[v29 * v32];
    v37 = &v22[v29 * v30];
    int v38 = v30;
    do
    {
      unsigned int v39 = *v37;
      if (v5)
      {
        if ((v39 & 0x80) == 0) {
          goto LABEL_20;
        }
      }
      else if (v39 > 0x7E)
      {
        goto LABEL_20;
      }
      v34 |= 0x8000000000000000 >> v35;
LABEL_20:
      if (++v35 == 64)
      {
        uint64_t v35 = 0;
        *v36++ = v34;
        unint64_t v34 = 0;
      }
      ++v37;
      --v38;
    }
    while (v38);
    if (v35) {
      unint64_t *v36 = v34;
    }
LABEL_25:
    ++v29;
  }
  while (v29 != v28);
LABEL_29:
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v25);
  if (v22) {
    free(v22);
  }
  if ((v33 & 1) == 0)
  {
    potraceParameters = v8->_potraceParameters;
    if (potraceParameters)
    {
      j__free(potraceParameters);
      v8->_potraceParameters = 0;
    }
    v41 = v8->_potraceBitmap;
    if (v41)
    {
      free(v41->var3);
      v8->_potraceBitmap->var3 = 0;
      v42 = v8->_potraceBitmap;
      if (v42)
      {
        free(v42);
        v8->_potraceBitmap = 0;
      }
    }

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  [(AKPotrace *)self _clearPathIfNecessary];
  potraceParameters = self->_potraceParameters;
  if (potraceParameters)
  {
    j__free(potraceParameters);
    self->_potraceParameters = 0;
  }
  potraceBitmap = self->_potraceBitmap;
  if (potraceBitmap)
  {
    free(potraceBitmap->var3);
    self->_potraceBitmap->var3 = 0;
    BOOL v5 = self->_potraceBitmap;
    if (v5)
    {
      free(v5);
      self->_potraceBitmap = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AKPotrace;
  [(AKPotrace *)&v6 dealloc];
}

- (CGPath)CGPath
{
  result = self->_cachedPath;
  if (!result)
  {
    [(AKPotrace *)self _generatePath];
    return self->_cachedPath;
  }
  return result;
}

- (int)turdsize
{
  return self->_potraceParameters->var0;
}

- (int)turnpolicy
{
  return self->_potraceParameters->var1;
}

- (double)alphamax
{
  return self->_potraceParameters->var2;
}

- (int)opticurve
{
  return self->_potraceParameters->var3;
}

- (double)opttolerance
{
  return self->_potraceParameters->var4;
}

- (void)setTurdsize:(int)a3
{
  self->_potraceParameters->uint64_t var0 = a3;
}

- (void)setTurnpolicy:(int)a3
{
  self->_potraceParameters->uint64_t var1 = a3;
}

- (void)setAlphamax:(double)a3
{
  self->_potraceParameters->uint64_t var2 = a3;
}

- (void)setOpticurve:(int)a3
{
  self->_potraceParameters->var3 = a3;
}

- (void)setOpttolerance:(double)a3
{
  self->_potraceParameters->var4 = a3;
}

- (void)_clearPathIfNecessary
{
  cachedPath = self->_cachedPath;
  if (cachedPath)
  {
    CGPathRelease(cachedPath);
    self->_cachedPath = 0;
  }
}

- (void)_generatePath
{
  v3 = sub_2376DB258((uint64_t)self->_potraceParameters, (uint64_t)self->_potraceBitmap);
  if (v3)
  {
    v4 = (void **)v3;
    if (*(_DWORD *)v3
      || (BOOL v5 = +[AKPotrace newCGPathFromPotracePath:v3[1]]) == 0)
    {
      NSLog(&cfstr_PathGeneration.isa);
      CGPathRelease(0);
      BOOL v5 = 0;
    }
    sub_2376DB4DC(v4);
  }
  else
  {
    NSLog(&cfstr_PathGeneration.isa);
    CGPathRelease(0);
    BOOL v5 = 0;
  }
  self->_cachedPath = v5;
}

+ (CGPath)newCGPathFromPotracePath:(potrace_path_s *)a3
{
  Mutable = CGPathCreateMutable();
  if (Mutable)
  {
    for (; a3; a3 = a3->var3)
    {
      uint64_t var0 = a3->var2.var0;
      uint64_t var1 = a3->var2.var1;
      uint64_t var2 = a3->var2.var2;
      CGPathMoveToPoint(Mutable, 0, *((CGFloat *)var2 + 6 * (int)var0 - 2), *((CGFloat *)var2 + 6 * (int)var0 - 1));
      if ((int)var0 >= 1)
      {
        v8 = (CGFloat *)((char *)var2 + 24);
        do
        {
          int v10 = *var1++;
          int v9 = v10;
          if (v10 == 1)
          {
            CGPathAddCurveToPoint(Mutable, 0, *(v8 - 3), *(v8 - 2), *(v8 - 1), *v8, v8[1], v8[2]);
          }
          else if (v9 == 2)
          {
            CGPathAddLineToPoint(Mutable, 0, *(v8 - 1), *v8);
            CGPathAddLineToPoint(Mutable, 0, v8[1], v8[2]);
          }
          v8 += 6;
          --var0;
        }
        while (var0);
      }
    }
    MutableCopy = CGPathCreateMutableCopy(Mutable);
  }
  else
  {
    MutableCopy = 0;
  }
  CGPathRelease(Mutable);
  return MutableCopy;
}

@end