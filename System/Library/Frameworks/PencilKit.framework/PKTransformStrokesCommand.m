@interface PKTransformStrokesCommand
+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransform:(CGAffineTransform *)a5;
+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransforms:(id)a5;
- (CGAffineTransform)strokeTransform;
- (NSArray)strokeTransforms;
- (NSArray)strokes;
- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransform:(CGAffineTransform *)a6;
- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransforms:(id)a6;
- (id)description;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKTransformStrokesCommand

+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransform:(CGAffineTransform *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = _PencilKitBundle();
  v10 = [v9 localizedStringForKey:@"Transform Stroke" value:@"Transform Stroke" table:@"Localizable"];

  v11 = [PKTransformStrokesCommand alloc];
  v12 = [v8 uuid];
  long long v13 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v13;
  v16[2] = *(_OWORD *)&a5->tx;
  v14 = [(PKTransformStrokesCommand *)v11 initWithStrokes:v7 drawingUUID:v12 actionName:v10 strokeTransform:v16];

  return v14;
}

+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransforms:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _PencilKitBundle();
  v11 = [v10 localizedStringForKey:@"Transform Strokes" value:@"Transform Strokes" table:@"Localizable"];

  v12 = [PKTransformStrokesCommand alloc];
  long long v13 = [v8 uuid];
  v14 = [(PKTransformStrokesCommand *)v12 initWithStrokes:v7 drawingUUID:v13 actionName:v11 strokeTransforms:v9];

  return v14;
}

- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransform:(CGAffineTransform *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKTransformStrokesCommand;
  long long v13 = [(PKUndoCommand *)&v19 initWithDrawingUUID:v11 actionName:v12];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    strokes = v13->_strokes;
    v13->_strokes = (NSArray *)v14;

    long long v17 = *(_OWORD *)&a6->c;
    long long v16 = *(_OWORD *)&a6->tx;
    *(_OWORD *)&v13->_strokeTransform.a = *(_OWORD *)&a6->a;
    *(_OWORD *)&v13->_strokeTransform.c = v17;
    *(_OWORD *)&v13->_strokeTransform.tx = v16;
  }

  return v13;
}

- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransforms:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKTransformStrokesCommand;
  uint64_t v14 = [(PKUndoCommand *)&v18 initWithDrawingUUID:v11 actionName:v12];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    strokes = v14->_strokes;
    v14->_strokes = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_strokeTransforms, a6);
  }

  return v14;
}

- (id)invertedInDrawing:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  strokeTransforms = self->_strokeTransforms;
  if (strokeTransforms)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](strokeTransforms, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = self->_strokeTransforms;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          memset(&v23, 0, sizeof(v23));
          if (v11) {
            [v11 CGAffineTransformValue];
          }
          else {
            memset(&v22, 0, sizeof(v22));
          }
          CGAffineTransformInvert(&v23, &v22);
          CGAffineTransform v21 = v23;
          id v12 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&v21];
          [v6 addObject:v12];
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }

    id v13 = [PKTransformStrokesCommand alloc];
    uint64_t v14 = [(PKTransformStrokesCommand *)self strokes];
    uint64_t v15 = [(PKUndoCommand *)self drawingUUID];
    long long v16 = [(PKUndoCommand *)self actionName];
    long long v17 = [(PKTransformStrokesCommand *)v13 initWithStrokes:v14 drawingUUID:v15 actionName:v16 strokeTransforms:v6];
  }
  else
  {
    objc_super v18 = [PKTransformStrokesCommand alloc];
    v6 = [(PKTransformStrokesCommand *)self strokes];
    uint64_t v14 = [(PKUndoCommand *)self drawingUUID];
    uint64_t v15 = [(PKUndoCommand *)self actionName];
    long long v19 = *(_OWORD *)&self->_strokeTransform.c;
    *(_OWORD *)&v28.a = *(_OWORD *)&self->_strokeTransform.a;
    *(_OWORD *)&v28.c = v19;
    *(_OWORD *)&v28.tx = *(_OWORD *)&self->_strokeTransform.tx;
    CGAffineTransformInvert(&v29, &v28);
    long long v17 = [(PKTransformStrokesCommand *)v18 initWithStrokes:v6 drawingUUID:v14 actionName:v15 strokeTransform:&v29];
  }

  return v17;
}

- (void)applyToDrawing:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  v6 = [(PKUndoCommand *)self drawingUUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    if (self->_strokeTransforms)
    {
      uint64_t v8 = [(PKTransformStrokesCommand *)self strokes];
      [v4 transformStrokes:v8 withTransforms:self->_strokeTransforms concat:1];
    }
    else
    {
      uint64_t v8 = [(PKTransformStrokesCommand *)self strokes];
      long long v9 = *(_OWORD *)&self->_strokeTransform.c;
      v10[0] = *(_OWORD *)&self->_strokeTransform.a;
      v10[1] = v9;
      v10[2] = *(_OWORD *)&self->_strokeTransform.tx;
      [v4 transformStrokes:v8 withTransform:v10 concat:1];
    }
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v6 = *(_OWORD *)&self->_strokeTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_strokeTransform.a;
  *(_OWORD *)&transform.c = v6;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_strokeTransform.tx;
  int v7 = NSStringFromCGAffineTransform(&transform);
  uint64_t v8 = [(PKUndoCommand *)self drawingUUID];
  long long v9 = [(PKTransformStrokesCommand *)self strokes];
  id v10 = [v3 stringWithFormat:@"<%@ %p transform=%@ drawing=%@ %@>", v5, self, v7, v8, v9];

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (CGAffineTransform)strokeTransform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (NSArray)strokeTransforms
{
  return self->_strokeTransforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeTransforms, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end