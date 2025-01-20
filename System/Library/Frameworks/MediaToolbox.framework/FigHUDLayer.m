@interface FigHUDLayer
- (FigHUDLayer)init;
- (__CFArray)getLabels;
- (__CFArray)getValues;
- (int64_t)addLine:(__CFString *)a3 withColorIndex:(int)a4;
- (int64_t)addLine:(__CFString *)a3 withLabelColorIndex:(int)a4 withValueColorIndex:(int)a5;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)resetLines;
- (void)setFont:(__CFString *)a3 withPointSize:(double)a4;
- (void)setValue:(__CFString *)a3 atIndex:(int)a4;
- (void)setValueAtIndex:(int)a3 format:(id)a4;
@end

@implementation FigHUDLayer

- (FigHUDLayer)init
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  v2 = (void *)*MEMORY[0x1E4F24740];
  keys[0] = *(void **)MEMORY[0x1E4F243F0];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x1E4F1D260];
  values[0] = v3;
  values[1] = v3;
  v10.receiver = self;
  v10.super_class = (Class)FigHUDLayer;
  v4 = [(FigHUDLayer *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_Font = (__CTFont *)v3;
    v4->_FontSize = 24.0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
    v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    v5->_Labels = CFArrayCreateMutable(v6, 0, MEMORY[0x1E4F1D510]);
    v5->_Values = CFArrayCreateMutable(v6, 0, v8);
    v5->_LabelColors = CFArrayCreateMutable(v6, 0, v8);
    v5->_ValueColors = CFArrayCreateMutable(v6, 0, v8);
  }
  return v5;
}

- (void)dealloc
{
  Font = self->_Font;
  if (Font) {
    BOOL v4 = Font == (__CTFont *)*MEMORY[0x1E4F1D260];
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    CFRelease(Font);
  }
  TextAttributes = self->_TextAttributes;
  if (TextAttributes) {
    CFRelease(TextAttributes);
  }
  Labels = self->_Labels;
  if (Labels) {
    CFRelease(Labels);
  }
  Values = self->_Values;
  if (Values) {
    CFRelease(Values);
  }
  LabelColors = self->_LabelColors;
  if (LabelColors) {
    CFRelease(LabelColors);
  }
  ValueColors = self->_ValueColors;
  if (ValueColors) {
    CFRelease(ValueColors);
  }
  v10.receiver = self;
  v10.super_class = (Class)FigHUDLayer;
  [(FigHUDLayer *)&v10 dealloc];
}

- (void)setFont:(__CFString *)a3 withPointSize:(double)a4
{
  Font = self->_Font;
  v8 = (__CTFont *)*MEMORY[0x1E4F1D260];
  if (Font != (__CTFont *)*MEMORY[0x1E4F1D260])
  {
    CFRelease(Font);
    self->_Font = v8;
  }
  self->_FontSize = a4;
  v9 = CTFontCreateWithName(a3, a4, 0);
  self->_Font = v9;
  TextAttributes = self->_TextAttributes;
  v11 = (const void *)*MEMORY[0x1E4F243F0];

  CFDictionarySetValue(TextAttributes, v11, v9);
}

- (void)resetLines
{
  Labels = self->_Labels;
  if (Labels) {
    CFArrayRemoveAllValues(Labels);
  }
  Values = self->_Values;
  if (Values) {
    CFArrayRemoveAllValues(Values);
  }
  LabelColors = self->_LabelColors;
  if (LabelColors) {
    CFArrayRemoveAllValues(LabelColors);
  }
  ValueColors = self->_ValueColors;
  if (ValueColors)
  {
    CFArrayRemoveAllValues(ValueColors);
  }
}

- (int64_t)addLine:(__CFString *)a3 withColorIndex:(int)a4
{
  return [(FigHUDLayer *)self addLine:a3 withLabelColorIndex:*(void *)&a4 withValueColorIndex:0];
}

- (int64_t)addLine:(__CFString *)a3 withLabelColorIndex:(int)a4 withValueColorIndex:(int)a5
{
  CGColorRef v8 = figHUDCGColorCreateWithIndex(a4);
  CGColorRef v9 = figHUDCGColorCreateWithIndex(a5);
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
  CFArrayAppendValue(self->_Labels, Copy);
  CFArrayAppendValue(self->_LabelColors, v8);
  CFArrayAppendValue(self->_Values, (const void *)*MEMORY[0x1E4F1D260]);
  CFArrayAppendValue(self->_ValueColors, v9);
  CFRelease(Copy);
  CFRelease(v8);
  CFRelease(v9);
  return CFArrayGetCount(self->_Labels) - 1;
}

- (__CFArray)getValues
{
  return self->_Values;
}

- (__CFArray)getLabels
{
  return self->_Labels;
}

- (void)setValue:(__CFString *)a3 atIndex:(int)a4
{
  if (CFArrayGetCount(self->_Values) > a4)
  {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
    CFArraySetValueAtIndex(self->_Values, a4, Copy);
    CFRelease(Copy);
  }
}

- (void)setValueAtIndex:(int)a3 format:(id)a4
{
  if (CFArrayGetCount(self->_Values) > a3)
  {
    CFDictionaryRef v7 = (void *)[[NSString alloc] initWithFormat:a4 arguments:&v8];
    CFArraySetValueAtIndex(self->_Values, a3, v7);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  CGAffineTransformMakeScale(&v20, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v20);
  v5 = (void *)*MEMORY[0x1E4F1D260];
  if (self->_Font == (__CTFont *)*MEMORY[0x1E4F1D260])
  {
    CFAllocatorRef v6 = CTFontCreateWithName(@"Helvetica", self->_FontSize, 0);
    self->_Font = v6;
    CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x1E4F243F0], v6);
  }
  if (CFArrayGetCount(self->_Labels) <= 0)
  {
    uint64_t v8 = (const void *)*MEMORY[0x1E4F24740];
  }
  else
  {
    value = v5;
    CFIndex v7 = 0;
    uint64_t v8 = (const void *)*MEMORY[0x1E4F24740];
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->_Labels, v7);
      CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(self->_Values, v7);
      v11 = CFArrayGetValueAtIndex(self->_LabelColors, v7);
      v12 = CFArrayGetValueAtIndex(self->_ValueColors, v7);
      CFDictionarySetValue(self->_TextAttributes, v8, v11);
      CFAttributedStringRef cf = CFAttributedStringCreate(alloc, ValueAtIndex, self->_TextAttributes);
      CFDictionarySetValue(self->_TextAttributes, v8, v12);
      CFAttributedStringRef v13 = CFAttributedStringCreate(alloc, v10, self->_TextAttributes);
      v14 = CTLineCreateWithAttributedString(cf);
      v15 = CTLineCreateWithAttributedString(v13);
      CGContextSetTextPosition(a3, 0.0, self->_FontSize * (double)(int)++v7);
      CTLineDraw(v14, a3);
      [(FigHUDLayer *)self bounds];
      CGContextSetTextPosition(a3, v16 * 0.5, self->_FontSize * (double)(int)v7);
      CTLineDraw(v15, a3);
      CFRelease(v14);
      CFRelease(v15);
      CFRelease(cf);
      CFRelease(v13);
    }
    while (CFArrayGetCount(self->_Labels) > v7);
    v5 = value;
  }
  CFDictionarySetValue(self->_TextAttributes, v8, v5);
}

@end