@interface CHPointStrokeFIFO
- (CHDrawing)drawing;
- (CHDrawing)strokes;
- (CHPointStrokeFIFO)initWithFIFO:(id)a3;
- (void)addPoint:(CHPointStrokeFIFO *)self;
- (void)clear;
- (void)flush;
- (void)setDrawing:(id)a3;
- (void)setStrokes:(id)a3;
@end

@implementation CHPointStrokeFIFO

- (CHPointStrokeFIFO)initWithFIFO:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPointStrokeFIFO;
  v5 = [(CHPointFIFO *)&v9 initWithFIFO:v4];
  if (v5)
  {
    v6 = objc_alloc_init(CHDrawing);
    drawing = v5->_drawing;
    v5->_drawing = v6;

    objc_storeStrong((id *)&v5->_strokes, v5->_drawing);
  }

  return v5;
}

- (void)addPoint:(CHPointStrokeFIFO *)self
{
  double v8 = *(double *)&v6;
  objc_msgSend_addPoint_(self->_drawing, a2, v2, v3, v4, v5, vcvtq_f64_f32(v6));
  v9.receiver = self;
  v9.super_class = (Class)CHPointStrokeFIFO;
  [(CHPointFIFO *)&v9 addPoint:v8];
}

- (void)flush
{
  objc_msgSend_endStroke(self->_drawing, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CHPointStrokeFIFO;
  [(CHPointFIFO *)&v7 flush];
}

- (void)clear
{
  objc_msgSend_clear(self->_drawing, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CHPointStrokeFIFO;
  [(CHPointFIFO *)&v7 clear];
}

- (CHDrawing)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end