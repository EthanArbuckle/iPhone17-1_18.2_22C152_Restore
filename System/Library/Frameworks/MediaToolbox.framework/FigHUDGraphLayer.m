@interface FigHUDGraphLayer
- (FigHUDGraphLayer)init;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setUpGraph:(int)a3 min:(float)a4 max:(float)a5 numValues:(int)a6;
- (void)setUpGraphs:(int)a3;
- (void)updateValue:(int)a3 value:(float)a4;
- (void)updateValue:(int)a3 value:(float)a4 label:(id)a5;
@end

@implementation FigHUDGraphLayer

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
    valueLabels = self->_valueLabels;
    if (valueLabels) {

    }
    self->_valueLabels = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    if (a3 >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        self->_Mins[v10] = 0.0;
        self->_Maxes[v10] = 0.0;
        self->_NumValues[v10] = 0;
        self->_Values[v10++] = 0;
      }
      while (a3 != v10);
    }
    StartIndex = self->_StartIndex;
    if (StartIndex) {
      free(StartIndex);
    }
    self->_StartIndex = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    self->_NumGraphs = a3;
  }
}

- (void)setUpGraph:(int)a3 min:(float)a4 max:(float)a5 numValues:(int)a6
{
  uint64_t v10 = a3;
  if (self->_NumValues[a3] == a6) {
    goto LABEL_6;
  }
  v11 = self->_Values[a3];
  if (v11) {
    free(v11);
  }
  self->_Values[v10] = (float *)malloc_type_malloc(4 * a6, 0x100004052888210uLL);
  if (self->_Values[v10])
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a6];
    [(NSMutableArray *)self->_valueLabels setObject:v12 atIndexedSubscript:v10];

LABEL_6:
    if (self->_MaxLength < a6)
    {
      Lines = self->_Lines;
      if (Lines) {
        free(Lines);
      }
      self->_Lines = (CGPoint *)malloc_type_malloc(32 * a6, 0x452CBD42uLL);
      self->_MaxLength = a6;
    }
    if (a6 >= 1)
    {
      v14 = self->_Values[v10];
      uint64_t v15 = a6;
      do
      {
        *v14++ = a4;
        --v15;
      }
      while (v15);
    }
    self->_Mins[v10] = a4;
    self->_Maxes[v10] = a5;
    self->_NumValues[v10] = a6;
    self->_StartIndex[v10] = 0;
  }
}

- (void)updateValue:(int)a3 value:(float)a4 label:(id)a5
{
  if (self->_NumGraphs > a3)
  {
    Maxes = self->_Maxes;
    uint64_t v8 = a3;
    if (Maxes[a3] < a4) {
      a4 = Maxes[a3];
    }
    Mins = self->_Mins;
    if (a4 < Mins[a3]) {
      a4 = Mins[a3];
    }
    uint64_t v10 = self->_StartIndex[a3];
    self->_Values[a3][v10] = a4;
    v11 = (void *)[(NSMutableArray *)self->_valueLabels objectAtIndex:a3];
    if (!a5) {
      a5 = (id)[MEMORY[0x1E4F1CA98] null];
    }
    [v11 setObject:a5 atIndexedSubscript:v10];
    self->_StartIndex[v8] = (self->_StartIndex[v8] + 1) % self->_NumValues[v8];
  }
}

- (void)updateValue:(int)a3 value:(float)a4
{
}

- (FigHUDGraphLayer)init
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  v2 = (void *)*MEMORY[0x1E4F24740];
  keys[0] = *(void **)MEMORY[0x1E4F243F0];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x1E4F1D260];
  values[0] = v3;
  values[1] = v3;
  v9.receiver = self;
  v9.super_class = (Class)FigHUDGraphLayer;
  v4 = [(FigHUDGraphLayer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_Values = 0;
    v4->_Mins = 0;
    v4->_Maxes = 0;
    v4->_NumValues = 0;
    v4->_NumGraphs = 0;
    v4->_MaxLength = 0;
    v4->_Lines = 0;
    v4->_Font = (__CTFont *)v3;
    v4->_StartIndex = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
  }
  return v5;
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
        uint64_t v10 = self->_Values[i];
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

  StartIndex = self->_StartIndex;
  if (StartIndex) {
    free(StartIndex);
  }
  Font = self->_Font;
  if (Font) {
    BOOL v13 = Font == (__CTFont *)*MEMORY[0x1E4F1D260];
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
  v15.super_class = (Class)FigHUDGraphLayer;
  [(FigHUDGraphLayer *)&v15 dealloc];
}

- (void)drawInContext:(CGContext *)a3
{
  v3 = a3;
  v78[10] = *MEMORY[0x1E4F143B8];
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
  double width = ClipBoundingBox.size.width;
  double height = ClipBoundingBox.size.height;
  CGRect v80 = CGContextGetClipBoundingBox(v3);
  CGFloat x = v80.origin.x;
  double y = v80.origin.y;
  double v8 = v80.size.width;
  double v9 = v80.size.height;
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
    int v71 = NumGraphs - 1;
    double v15 = 0.0;
  }
  else
  {
    int v71 = 0;
    double v9 = v80.size.height + -24.0;
    double v15 = 12.0;
    double y = v80.origin.y + 12.0;
  }
  CGAffineTransformMakeScale(&v76, 1.0, -1.0);
  CGContextSetTextMatrix(v3, &v76);
  if (self->_Font == (__CTFont *)*MEMORY[0x1E4F1D260])
  {
    v16 = CTFontCreateWithName(@"Helvetica", 12.0, 0);
    self->_Font = v16;
    CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x1E4F243F0], v16);
  }
  v17 = figHUDCGColorCreateWithRGB(0.5, 0.5, 0.5, 0.5);
  CGContextSetFillColorWithColor(v3, v17);
  v81.origin.CGFloat x = x;
  v81.origin.double y = y;
  v81.size.double width = v8;
  v81.size.double height = v9;
  CGContextFillRect(v3, v81);
  CFRelease(v17);
  v18 = (double *)v78;
  uint64_t v19 = -3;
  do
  {
    *(v18 - 2) = 0.0;
    double v20 = v15 + v9 * (float)(v19 + 4) * 0.25;
    *(v18 - 1) = v20;
    double *v18 = v8;
    v18[1] = v20;
    v18 += 4;
  }
  while (!__CFADD__(v19++, 1));
  v22 = figHUDCGColorCreateWithRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetStrokeColorWithColor(v3, v22);
  CGContextStrokeLineSegments(v3, &points, 6uLL);
  CFRelease(v22);
  if (self->_Lines && self->_NumValues && self->_Values)
  {
    int v23 = self->_NumGraphs;
    c = v3;
    if (v23 >= 1)
    {
      uint64_t v24 = 0;
      double v25 = v9 + -2.0;
      double v26 = v9 + -1.0 + v15;
      double v27 = -v25;
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        int v28 = self->_NumValues[v24];
        if (v28 >= 2 && self->_Values[v24])
        {
          v29 = self->_Mins;
          if (v29) {
            float v30 = v29[v24];
          }
          else {
            float v30 = 0.0;
          }
          v31 = self->_Maxes;
          if (v31) {
            float v32 = v31[v24];
          }
          else {
            float v32 = 1.0;
          }
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          uint64_t v35 = (v28 - 1);
          double v36 = v8 / (double)(int)v35;
          double v37 = v27 / (float)(v32 - v30);
          do
          {
            int v38 = self->_NumValues[v24];
            int v39 = ((int)v34 + self->_StartIndex[v24]) % v38;
            int v40 = (v39 + 1) % v38;
            double v41 = (float)(int)v34;
            v42 = &self->_Lines[v33];
            v42->CGFloat x = v36 * v41;
            v43 = self->_Values[v24];
            v42->double y = v26 + v37 * (float)(v43[v39] - v30);
            v42[1].CGFloat x = v36 + v36 * v41;
            v42[1].double y = v26 + v37 * (float)(v43[v40] - v30);
            if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v24), "count") > (unint64_t)v39)
            {
              uint64_t v44 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v24), "objectAtIndex:", v39);
              if (v44)
              {
                CFStringRef v45 = (const __CFString *)v44;
                if (v44 != [MEMORY[0x1E4F1CA98] null])
                {
                  CFAttributedStringRef v46 = CFAttributedStringCreate(alloc, v45, self->_TextAttributes);
                  v47 = CTLineCreateWithAttributedString(v46);
                  [(FigHUDGraphLayer *)self contentsScale];
                  CGContextSetTextPosition(c, self->_Lines[v33].x, (v48 + v48)* (double)((int)([(FigHUDGraphLayer *)self contentsAreFlipped] << 31) >> 31)+ self->_Lines[v33].y);
                  CTLineDraw(v47, c);
                  CFRelease(v46);
                  CFRelease(v47);
                }
              }
            }
            ++v34;
            v33 += 2;
          }
          while (v35 != v34);
          v49 = figHUDCGColorCreateWithIndex(v24);
          double v50 = 1.0;
          if (!v24) {
            double v50 = 2.0;
          }
          v3 = c;
          CGContextSetLineWidth(c, v50);
          CGContextSetStrokeColorWithColor(c, v49);
          CGContextStrokeLineSegments(c, self->_Lines, (2 * v35));
          CFRelease(v49);
          int v23 = self->_NumGraphs;
        }
        ++v24;
      }
      while (v24 < v23);
    }
    CGContextSetLineWidth(v3, 1.0);
    int v51 = self->_NumGraphs;
    if (v51 > v71)
    {
      kedouble y = (void *)*MEMORY[0x1E4F24740];
      CFAllocatorRef v70 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v52 = v51 - 1;
      double PenOffsetForFlush = 0.0;
      double v54 = 0.0;
      do
      {
        v55 = self->_Mins;
        if (v55) {
          float v56 = v55[v52];
        }
        else {
          float v56 = 0.0;
        }
        v57 = self->_Maxes;
        if (v57) {
          float v58 = v57[v52];
        }
        else {
          float v58 = 1.0;
        }
        if (v71) {
          CGColorRef v59 = figHUDCGColorCreateWithRGB(1.0, 1.0, 1.0, 1.0);
        }
        else {
          CGColorRef v59 = figHUDCGColorCreateWithIndex(v51 - 1);
        }
        CGColorRef cf = v59;
        CFDictionarySetValue(self->_TextAttributes, key, v59);
        CFStringRef v60 = CFStringCreateWithFormat(v70, 0, @"%1.1f", v58);
        CFStringRef v61 = CFStringCreateWithFormat(v70, 0, @"%1.1f", v56);
        CFAttributedStringRef v62 = CFAttributedStringCreate(v70, v60, self->_TextAttributes);
        CFAttributedStringRef v63 = CFAttributedStringCreate(v70, v61, self->_TextAttributes);
        v64 = CTLineCreateWithAttributedString(v62);
        v65 = CTLineCreateWithAttributedString(v63);
        CGRect ImageBounds = CTLineGetImageBounds(v64, c);
        double v66 = ImageBounds.size.width;
        double v67 = ImageBounds.size.height;
        CGRect v83 = CTLineGetImageBounds(v65, c);
        if (v51 == self->_NumGraphs)
        {
          double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v64, 1.0, width);
          double v54 = CTLineGetPenOffsetForFlush(v65, 1.0, width);
        }
        else
        {
          double PenOffsetForFlush = PenOffsetForFlush + v66 * -1.25;
          double v54 = v54 + v83.size.width * -1.25;
        }
        if (v54 < PenOffsetForFlush) {
          double PenOffsetForFlush = v54;
        }
        CGContextSetTextPosition(c, PenOffsetForFlush, v67 + v67 * 0.25);
        CTLineDraw(v64, c);
        CGContextSetTextPosition(c, PenOffsetForFlush, height + v67 * -0.25);
        CTLineDraw(v65, c);
        CFRelease(v62);
        CFRelease(v64);
        CFRelease(v60);
        CFRelease(v63);
        CFRelease(v65);
        CFRelease(v61);
        CFRelease(cf);
        --v51;
      }
      while (v52-- > v71);
    }
  }
}

@end