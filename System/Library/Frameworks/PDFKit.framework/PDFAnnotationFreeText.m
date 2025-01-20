@interface PDFAnnotationFreeText
- (NSColor)fontColor;
- (NSFont)font;
- (NSTextAlignment)alignment;
- (PDFAnnotationFreeText)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4;
- (PDFAnnotationFreeText)initWithCoder:(id)a3;
- (__CFDictionary)commonCreateDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (void)commonInit;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignment:(NSTextAlignment)alignment;
- (void)setFont:(NSFont *)font;
- (void)setFontColor:(NSColor *)color;
@end

@implementation PDFAnnotationFreeText

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDFAnnotationFreeText;
  v3 = [(PDFAnnotation *)&v7 copyWithZone:a3];
  if (v3)
  {
    v4 = objc_alloc_init(PDFAnnotationFreeTextPrivateVars);
    v5 = (void *)v3[49];
    v3[49] = v4;
  }
  return v3;
}

- (PDFAnnotationFreeText)initWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    v10.receiver = self;
    v10.super_class = (Class)PDFAnnotationFreeText;
    self = [(PDFAnnotation *)&v10 initWithCoder:v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263F08170];
    v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"%@ - only keyed coders are supported by %@", v8, objc_opt_class() format];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  [(PDFAnnotation *)&v3 encodeWithCoder:a3];
}

- (NSFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)PDFAnnotationFreeText;
  v2 = [(PDFAnnotation *)&v4 font];

  return (NSFont *)v2;
}

- (void)setFont:(NSFont *)font
{
  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  [(PDFAnnotation *)&v3 setFont:font];
}

- (NSColor)fontColor
{
  v4.receiver = self;
  v4.super_class = (Class)PDFAnnotationFreeText;
  v2 = [(PDFAnnotation *)&v4 fontColor];

  return (NSColor *)v2;
}

- (void)setFontColor:(NSColor *)color
{
  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  [(PDFAnnotation *)&v3 setFontColor:color];
}

- (NSTextAlignment)alignment
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Q"];
  NSTextAlignment v3 = [v2 integerValue];

  return v3;
}

- (void)setAlignment:(NSTextAlignment)alignment
{
  id v4 = [NSNumber numberWithInteger:alignment];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/Q"];
}

- (PDFAnnotationFreeText)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationFreeText;
  return [(PDFAnnotation *)&v5 initWithAnnotationDictionary:a3 forPage:a4];
}

- (void)commonInit
{
  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationFreeText;
  [(PDFAnnotation *)&v5 commonInit];
  NSTextAlignment v3 = objc_alloc_init(PDFAnnotationFreeTextPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  [(PDFAnnotation *)self setIsFullyConstructed:0];
  [(PDFAnnotation *)self setType:@"/FreeText"];
  [(PDFAnnotation *)self setIsFullyConstructed:1];
}

- (__CFDictionary)commonCreateDictionaryRef
{
  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  return [(PDFAnnotation *)&v3 commonCreateDictionaryRef];
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PDFAnnotationFreeText;
  [(PDFAnnotation *)&v4 drawWithBox:a3 inContext:a4];
}

- (void).cxx_destruct
{
}

@end