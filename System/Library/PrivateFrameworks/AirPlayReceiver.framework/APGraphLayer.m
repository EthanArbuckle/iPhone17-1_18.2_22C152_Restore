@interface APGraphLayer
+ (CGColor)copyGraphColorWithIndex:(int)a3;
- (APGraphLayer)init;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setUpGraph:(int)a3 min:(float)a4 max:(float)a5 numValues:(int)a6;
- (void)setUpGraphs:(int)a3;
- (void)updateValue:(int)a3 value:(float)a4;
@end

@implementation APGraphLayer

- (void)drawInContext:(CGContext *)a3
{
  v68[10] = *MEMORY[0x263EF8340];
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
  double width = ClipBoundingBox.size.width;
  double height = ClipBoundingBox.size.height;
  CGContextRef c = a3;
  CGRect v70 = CGContextGetClipBoundingBox(a3);
  CGFloat x = v70.origin.x;
  double y = v70.origin.y;
  double v8 = v70.size.width;
  double v9 = v70.size.height;
  uint64_t NumGraphs = self->_NumGraphs;
  if ((int)NumGraphs < 2)
  {
    int v14 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    Mins = self->_Mins;
    while (!Mins || Mins[v11] == Mins[v11 + 1])
    {
      Maxes = self->_Maxes;
      if (Maxes)
      {
        if (Maxes[v11] != Maxes[v11 + 1]) {
          break;
        }
      }
      if (NumGraphs - 1 == ++v11) {
        goto LABEL_12;
      }
    }
    int v14 = v11 + 1;
  }
  if (v14 == NumGraphs)
  {
LABEL_12:
    int v63 = NumGraphs - 1;
    double v15 = 0.0;
  }
  else
  {
    int v63 = 0;
    double v9 = v70.size.height + -24.0;
    double v15 = 12.0;
    double y = v70.origin.y + 12.0;
  }
  v16 = (CGColor *)CGColorCreateWithRGB();
  CGContextSetFillColorWithColor(a3, v16);
  v71.origin.CGFloat x = x;
  v71.origin.double y = y;
  v71.size.double width = v8;
  v71.size.double height = v9;
  CGContextFillRect(a3, v71);
  CFRelease(v16);
  v17 = (double *)v68;
  uint64_t v18 = -3;
  do
  {
    *(v17 - 2) = 0.0;
    double v19 = v15 + v9 * (float)(v18 + 4) * 0.25;
    *(v17 - 1) = v19;
    double *v17 = v8;
    v17[1] = v19;
    v17 += 4;
  }
  while (!__CFADD__(v18++, 1));
  v21 = (CGColor *)CGColorCreateWithRGB();
  CGContextSetStrokeColorWithColor(a3, v21);
  CGContextStrokeLineSegments(a3, &points, 6uLL);
  CFRelease(v21);
  if (self->_Lines && self->_NumValues && self->_Values)
  {
    int v22 = self->_NumGraphs;
    if (v22 >= 1)
    {
      uint64_t v23 = 0;
      double v24 = v9 + -1.0 + v15;
      double v25 = -(v9 + -2.0);
      do
      {
        int v26 = self->_NumValues[v23];
        if (v26 >= 2)
        {
          v27 = self->_Values[v23];
          if (v27)
          {
            v28 = self->_Mins;
            if (v28) {
              float v29 = v28[v23];
            }
            else {
              float v29 = 0.0;
            }
            v30 = self->_Maxes;
            if (v30) {
              float v31 = v30[v23];
            }
            else {
              float v31 = 1.0;
            }
            uint64_t v32 = 0;
            uint64_t v33 = (v26 - 1);
            double v34 = v8 / (double)(int)v33;
            int v35 = self->_StartIndex[v23];
            v36 = self->_Lines + 1;
            double v37 = v25 / (float)(v31 - v29);
            do
            {
              int v38 = (v35 + (int)v32) % v26;
              double v39 = (float)(int)v32;
              v36[-1].CGFloat x = v34 * v39;
              v36[-1].double y = v24 + v37 * (float)(v27[v38] - v29);
              v36->CGFloat x = v34 + v34 * v39;
              v36->double y = v24 + v37 * (float)(v27[(v38 + 1) % v26] - v29);
              ++v32;
              v36 += 2;
            }
            while (v33 != v32);
            v40 = +[APGraphLayer copyGraphColorWithIndex:v23];
            CGContextSetStrokeColorWithColor(a3, v40);
            CGContextStrokeLineSegments(a3, self->_Lines, (2 * v33));
            CFRelease(v40);
            int v22 = self->_NumGraphs;
          }
        }
        ++v23;
      }
      while (v23 < v22);
    }
    CGAffineTransformMakeScale(&v66, 1.0, -1.0);
    CGContextSetTextMatrix(a3, &v66);
    if (self->_Font == (__CTFont *)*MEMORY[0x263EFFD08])
    {
      v41 = CTFontCreateWithName(@"Helvetica", 12.0, 0);
      self->_Font = v41;
      CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x263F039A0], v41);
    }
    int v42 = self->_NumGraphs;
    if (v42 > v63)
    {
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      kedouble y = (void *)*MEMORY[0x263F03C60];
      uint64_t v43 = v42 - 1;
      double PenOffsetForFlush = 0.0;
      double v45 = 0.0;
      do
      {
        v46 = self->_Mins;
        if (v46) {
          float v47 = v46[v43];
        }
        else {
          float v47 = 0.0;
        }
        v48 = self->_Maxes;
        if (v48) {
          float v49 = v48[v43];
        }
        else {
          float v49 = 1.0;
        }
        if (v63) {
          v50 = (CGColor *)CGColorCreateWithRGB();
        }
        else {
          v50 = +[APGraphLayer copyGraphColorWithIndex:(v42 - 1)];
        }
        cf = v50;
        CFDictionarySetValue(self->_TextAttributes, key, v50);
        CFStringRef v51 = CFStringCreateWithFormat(alloc, 0, @"%1.1f", v49);
        CFStringRef v52 = CFStringCreateWithFormat(alloc, 0, @"%1.1f", v47);
        CFAttributedStringRef v53 = CFAttributedStringCreate(alloc, v51, self->_TextAttributes);
        CFAttributedStringRef v54 = CFAttributedStringCreate(alloc, v52, self->_TextAttributes);
        v55 = CTLineCreateWithAttributedString(v53);
        v56 = CTLineCreateWithAttributedString(v54);
        CGRect ImageBounds = CTLineGetImageBounds(v55, c);
        double v57 = ImageBounds.size.width;
        double v58 = ImageBounds.size.height;
        CGRect v73 = CTLineGetImageBounds(v56, c);
        if (v42 == self->_NumGraphs)
        {
          double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v55, 1.0, width);
          double v45 = CTLineGetPenOffsetForFlush(v56, 1.0, width);
        }
        else
        {
          double PenOffsetForFlush = PenOffsetForFlush + v57 * -1.25;
          double v45 = v45 + v73.size.width * -1.25;
        }
        if (v45 < PenOffsetForFlush) {
          double PenOffsetForFlush = v45;
        }
        CGContextSetTextPosition(c, PenOffsetForFlush, v58 + v58 * 0.25);
        CTLineDraw(v55, c);
        CGContextSetTextPosition(c, PenOffsetForFlush, height + v58 * -0.25);
        CTLineDraw(v56, c);
        CFRelease(v53);
        CFRelease(v55);
        CFRelease(v51);
        CFRelease(v54);
        CFRelease(v56);
        CFRelease(v52);
        CFRelease(cf);
        --v42;
      }
      while (v43-- > v63);
    }
  }
}

- (void)dealloc
{
  Lines = self->_Lines;
  if (Lines) {
    free(Lines);
  }
  Mins = self->_Mins;
  if (Mins) {
    free(Mins);
  }
  Maxes = self->_Maxes;
  if (Maxes) {
    free(Maxes);
  }
  NumValues = self->_NumValues;
  if (NumValues) {
    free(NumValues);
  }
  Values = self->_Values;
  if (Values)
  {
    int NumGraphs = self->_NumGraphs;
    if (NumGraphs >= 1)
    {
      for (uint64_t i = 0; i < NumGraphs; ++i)
      {
        v10 = self->_Values[i];
        if (v10)
        {
          free(v10);
          int NumGraphs = self->_NumGraphs;
        }
      }
      Values = self->_Values;
    }
    free(Values);
  }
  StartIndeCGFloat x = self->_StartIndex;
  if (StartIndex) {
    free(StartIndex);
  }
  Font = self->_Font;
  if (Font) {
    BOOL v13 = Font == (__CTFont *)*MEMORY[0x263EFFD08];
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    CFRelease(Font);
  }
  TextAttributes = self->_TextAttributes;
  if (TextAttributes) {
    CFRelease(TextAttributes);
  }
  v15.receiver = self;
  v15.super_class = (Class)APGraphLayer;
  [(APGraphLayer *)&v15 dealloc];
}

- (APGraphLayer)init
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F03C60];
  keys[0] = *(void **)MEMORY[0x263F039A0];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x263EFFD08];
  values[0] = v3;
  values[1] = v3;
  v9.receiver = self;
  v9.super_class = (Class)APGraphLayer;
  v4 = [(APGraphLayer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_Values = 0;
    v4->_Mins = 0;
    v4->_Maxes = 0;
    v4->_NumValues = 0;
    v4->_int NumGraphs = 0;
    v4->_MaxLength = 0;
    v4->_Lines = 0;
    v4->_Font = (__CTFont *)v3;
    v4->_StartIndeCGFloat x = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
  }
  return v5;
}

- (void)updateValue:(int)a3 value:(float)a4
{
  if (self->_NumGraphs > a3)
  {
    Maxes = self->_Maxes;
    if (Maxes[a3] < a4) {
      a4 = Maxes[a3];
    }
    Mins = self->_Mins;
    if (a4 < Mins[a3]) {
      a4 = Mins[a3];
    }
    StartIndeCGFloat x = self->_StartIndex;
    uint64_t v7 = StartIndex[a3];
    self->_Values[a3][v7] = a4;
    StartIndex[a3] = ((int)v7 + 1) % self->_NumValues[a3];
  }
}

- (void)setUpGraph:(int)a3 min:(float)a4 max:(float)a5 numValues:(int)a6
{
  uint64_t v10 = a3;
  if (self->_NumValues[a3] == a6) {
    goto LABEL_5;
  }
  uint64_t v11 = self->_Values[a3];
  if (v11) {
    free(v11);
  }
  self->_Values[v10] = (float *)malloc_type_malloc(4 * a6, 0x100004052888210uLL);
  if (self->_Values[v10])
  {
LABEL_5:
    if (self->_MaxLength < a6)
    {
      Lines = self->_Lines;
      if (Lines) {
        free(Lines);
      }
      self->_Lines = (CGPoint *)malloc_type_malloc(32 * a6, 0x238A610FuLL);
      self->_MaxLength = a6;
    }
    if (a6 >= 1)
    {
      BOOL v13 = self->_Values[v10];
      uint64_t v14 = a6;
      do
      {
        *v13++ = a4;
        --v14;
      }
      while (v14);
    }
    self->_Mins[v10] = a4;
    self->_Maxes[v10] = a5;
    self->_NumValues[v10] = a6;
    self->_StartIndex[v10] = 0;
  }
}

- (void)setUpGraphs:(int)a3
{
  if (self->_NumGraphs != a3)
  {
    Mins = self->_Mins;
    if (Mins) {
      free(Mins);
    }
    self->_Mins = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    Maxes = self->_Maxes;
    if (Maxes) {
      free(Maxes);
    }
    self->_Maxes = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    NumValues = self->_NumValues;
    if (NumValues) {
      free(NumValues);
    }
    self->_NumValues = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    Values = self->_Values;
    if (Values) {
      free(Values);
    }
    self->_Values = (float **)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    if (a3 >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        self->_Mins[v9] = 0.0;
        self->_Maxes[v9] = 0.0;
        self->_NumValues[v9] = 0;
        self->_Values[v9++] = 0;
      }
      while (a3 != v9);
    }
    StartIndeCGFloat x = self->_StartIndex;
    if (StartIndex) {
      free(StartIndex);
    }
    self->_StartIndeCGFloat x = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    self->_int NumGraphs = a3;
  }
}

+ (CGColor)copyGraphColorWithIndex:(int)a3
{
  RGB = (CGColorSpace *)CGColorSpaceGetRGB();

  return CGColorCreate(RGB, &copyGraphColorWithIndex__graphColors[4 * a3]);
}

@end