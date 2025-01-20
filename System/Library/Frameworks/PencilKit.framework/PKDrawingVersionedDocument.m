@interface PKDrawingVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
- (BOOL)loadNonInkingStrokes;
- (BOOL)loadUnzippedData:(id)a3;
- (Class)drawingClass;
- (PKDrawingConcrete)drawing;
- (PKDrawingVersionedDocument)initWithDrawing:(id)a3;
- (PKDrawingVersionedDocument)initWithDrawingClass:(Class)a3;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3;
- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4;
- (void)setDrawing:(id)a3;
- (void)setDrawingClass:(Class)a3;
- (void)setLoadNonInkingStrokes:(BOOL)a3;
@end

@implementation PKDrawingVersionedDocument

+ (unsigned)serializationVersion
{
  return 10;
}

+ (unsigned)minimumSupportedVersion
{
  return 10;
}

- (PKDrawingVersionedDocument)initWithDrawingClass:(Class)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDrawingVersionedDocument;
  v4 = [(PKVersionedDocument *)&v6 init];
  objc_storeStrong((id *)&v4->_drawingClass, a3);
  return v4;
}

- (BOOL)loadUnzippedData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDrawingVersionedDocument;
  BOOL v5 = [(PKVersionedDocument *)&v9 loadUnzippedData:v4];
  if (v5 && !self->_drawing)
  {
    objc_super v6 = (PKDrawingConcrete *)objc_alloc_init(self->_drawingClass);
    drawing = self->_drawing;
    self->_drawing = v6;
  }
  return v5;
}

- (PKDrawingVersionedDocument)initWithDrawing:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDrawingVersionedDocument;
  BOOL v5 = [(PKVersionedDocument *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    drawing = v5->_drawing;
    v5->_drawing = (PKDrawingConcrete *)v6;

    uint64_t v8 = objc_opt_class();
    Class drawingClass = v5->_drawingClass;
    v5->_Class drawingClass = (Class)v8;
  }
  return v5;
}

- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKDrawingVersionedDocument *)self drawing];
  uint64_t v6 = [v4 drawing];
  unint64_t v7 = [v5 mergeWithDrawing:v6];

  v9.receiver = self;
  v9.super_class = (Class)PKDrawingVersionedDocument;
  [(PKVersionedDocument *)&v9 mergeWithVersionedDocument:v4];

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v11 = a4;
  Class drawingClass = self->_drawingClass;
  if (a3 < 0xA) {
    unint64_t v7 = (void *)[[drawingClass alloc] initWithLegacyData:v11];
  }
  else {
    unint64_t v7 = objc_msgSend([drawingClass alloc], "initWithV1Data:loadNonInkingStrokes:", v11, -[PKDrawingVersionedDocument loadNonInkingStrokes](self, "loadNonInkingStrokes"));
  }
  uint64_t v8 = v7;
  if (self->_drawing)
  {
    if (!v7) {
      goto LABEL_9;
    }
    drawing = [(PKDrawingVersionedDocument *)self drawing];
    [drawing mergeWithDrawing:v8];
  }
  else
  {
    v10 = v7;
    drawing = self->_drawing;
    self->_drawing = v10;
  }

LABEL_9:
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  id v4 = [(PKDrawingVersionedDocument *)self drawing];
  BOOL v5 = [v4 v1SerializeWithPathData:1 toVersion:a3];

  return v5;
}

- (PKDrawingConcrete)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (BOOL)loadNonInkingStrokes
{
  return self->_loadNonInkingStrokes;
}

- (void)setLoadNonInkingStrokes:(BOOL)a3
{
  self->_loadNonInkingStrokes = a3;
}

- (Class)drawingClass
{
  return self->_drawingClass;
}

- (void)setDrawingClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingClass, 0);

  objc_storeStrong((id *)&self->_drawing, 0);
}

@end