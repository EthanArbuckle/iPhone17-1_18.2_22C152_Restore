@interface APHUDLayer
- (APHUDLayer)init;
- (void)addLine:(__CFString *)a3 withColorIndex:(int)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setValue:(__CFString *)a3 atIndex:(int)a4;
- (void)setValueAtIndex:(int)a3 format:(id)a4;
@end

@implementation APHUDLayer

- (void)drawInContext:(CGContext *)a3
{
  value = (void *)CGColorCreateWithRGB();
  CGAffineTransformMakeScale(&v18, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v18);
  v16 = (void *)*MEMORY[0x263EFFD08];
  if (self->_Font == (__CTFont *)*MEMORY[0x263EFFD08])
  {
    v5 = CTFontCreateWithName(@"Helvetica", 12.0, 0);
    self->_Font = v5;
    CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x263F039A0], v5);
  }
  CFIndex v6 = 0;
  v7 = (const void *)*MEMORY[0x263F03C60];
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (CFArrayGetCount(self->_Labels) > v6)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->_Labels, v6);
    CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(self->_Values, v6);
    v11 = CFArrayGetValueAtIndex(self->_Colors, v6);
    CFDictionarySetValue(self->_TextAttributes, v7, v11);
    CFAttributedStringRef v12 = CFAttributedStringCreate(v8, ValueAtIndex, self->_TextAttributes);
    CFDictionarySetValue(self->_TextAttributes, v7, value);
    CFAttributedStringRef v13 = CFAttributedStringCreate(v8, v10, self->_TextAttributes);
    v14 = CTLineCreateWithAttributedString(v12);
    v15 = CTLineCreateWithAttributedString(v13);
    CGContextSetTextPosition(a3, 0.0, (float)((float)(int)++v6 * 12.0));
    CTLineDraw(v14, a3);
    CGContextSetTextPosition(a3, 60.0, (float)((float)(int)v6 * 12.0));
    CTLineDraw(v15, a3);
    CFRelease(v14);
    CFRelease(v15);
    CFRelease(v12);
    CFRelease(v13);
  }
  CFDictionarySetValue(self->_TextAttributes, v7, v16);
  CFRelease(value);
}

- (void)setValueAtIndex:(int)a3 format:(id)a4
{
  if (CFArrayGetCount(self->_Values) > a3)
  {
    v7 = (void *)[[NSString alloc] initWithFormat:a4 arguments:&v8];
    CFArraySetValueAtIndex(self->_Values, a3, v7);
  }
}

- (void)setValue:(__CFString *)a3 atIndex:(int)a4
{
  if (CFArrayGetCount(self->_Values) > a4)
  {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a3);
    CFArraySetValueAtIndex(self->_Values, a4, Copy);
    CFRelease(Copy);
  }
}

- (void)addLine:(__CFString *)a3 withColorIndex:(int)a4
{
  CFIndex v6 = +[APGraphLayer copyGraphColorWithIndex:*(void *)&a4];
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a3);
  CFArrayAppendValue(self->_Labels, Copy);
  CFArrayAppendValue(self->_Colors, v6);
  CFArrayAppendValue(self->_Values, (const void *)*MEMORY[0x263EFFD08]);
  CFRelease(Copy);

  CFRelease(v6);
}

- (void)dealloc
{
  Font = self->_Font;
  if (Font) {
    BOOL v4 = Font == (__CTFont *)*MEMORY[0x263EFFD08];
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
  Colors = self->_Colors;
  if (Colors) {
    CFRelease(Colors);
  }
  v9.receiver = self;
  v9.super_class = (Class)APHUDLayer;
  [(APHUDLayer *)&v9 dealloc];
}

- (APHUDLayer)init
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F03C60];
  keys[0] = *(void **)MEMORY[0x263F039A0];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x263EFFD08];
  values[0] = v3;
  values[1] = v3;
  v10.receiver = self;
  v10.super_class = (Class)APHUDLayer;
  BOOL v4 = [(APHUDLayer *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_Font = (__CTFont *)v3;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
    uint64_t v8 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    v5->_Labels = CFArrayCreateMutable(v6, 0, MEMORY[0x263EFFF70]);
    v5->_Values = CFArrayCreateMutable(v6, 0, v8);
    v5->_Colors = CFArrayCreateMutable(v6, 0, v8);
  }
  return v5;
}

@end