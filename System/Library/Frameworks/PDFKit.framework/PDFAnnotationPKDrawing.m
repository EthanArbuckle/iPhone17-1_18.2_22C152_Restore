@interface PDFAnnotationPKDrawing
- (PDFAnnotationPKDrawing)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4;
- (PDFAnnotationPKDrawing)initWithPKDrawing:(id)a3 bounds:(CGRect)a4;
- (PKDrawing)drawing;
- (__CFDictionary)dictionaryRef;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)setDrawing:(id)a3;
@end

@implementation PDFAnnotationPKDrawing

- (PDFAnnotationPKDrawing)initWithPKDrawing:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PDFAnnotationPKDrawing;
  v11 = [(PDFAnnotation *)&v18 initWithBounds:@"/Square", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24) forType withProperties];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_drawing, a3);
    v13 = (AKInkAnnotation *)objc_alloc_init((Class)AKInkAnnotationClass());
    akInkAnnotation = v12->_akInkAnnotation;
    v12->_akInkAnnotation = v13;

    -[AKInkAnnotation setRectangle:](v12->_akInkAnnotation, "setRectangle:", x, y, width, height);
    [(AKInkAnnotation *)v12->_akInkAnnotation setDrawing:v12->_drawing];
    -[PDFAnnotation setBounds:](v12, "setBounds:", x, y, width, height);
    v15 = objc_alloc_init(PDFBorder);
    [(PDFBorder *)v15 setLineWidth:0.0];
    [(PDFAnnotation *)v12 setValue:v15 forAnnotationKey:@"/Border"];
    v16 = [MEMORY[0x263F825C8] clearColor];
    [(PDFAnnotation *)v12 setValue:v16 forAnnotationKey:@"/C"];
    [(PDFAnnotation *)v12 setValue:v16 forAnnotationKey:@"/IC"];
    [(PDFAnnotation *)v12 setReadOnlyAnnotation:1];
    [(PDFAnnotation *)v12 setLocked:1];
    [(PDFAnnotation *)v12 setContentsLocked:1];
  }
  return v12;
}

- (void)setDrawing:(id)a3
{
  p_drawing = &self->_drawing;
  objc_storeStrong((id *)&self->_drawing, a3);
  id v6 = a3;
  [(AKInkAnnotation *)self->_akInkAnnotation setDrawing:*p_drawing];
}

- (PDFAnnotationPKDrawing)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PDFAnnotationPKDrawing;
  v5 = [(PDFAnnotation *)&v13 initWithCGPDFAnnotation:a3 forPage:a4];
  if (v5)
  {
    id v6 = +[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:a3 andDictionary:CGPDFAnnotationGetCGPDFDictionary()];
    AKInkAnnotationClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
      goto LABEL_6;
    }
    akInkAnnotation = v5->_akInkAnnotation;
    v5->_akInkAnnotation = (AKInkAnnotation *)v6;
    id v8 = v6;

    uint64_t v9 = [(AKInkAnnotation *)v5->_akInkAnnotation drawing];
    drawing = v5->_drawing;
    v5->_drawing = (PKDrawing *)v9;
  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
}

- (__CFDictionary)dictionaryRef
{
  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationPKDrawing;
  v3 = [(PDFAnnotation *)&v5 dictionaryRef];
  if (v3) {
    +[PDFAKAnnotationSerializationHelper addAKAnnotation:self->_akInkAnnotation toAnnotationDictionary:v3];
  }
  return v3;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);

  objc_storeStrong((id *)&self->_akInkAnnotation, 0);
}

@end