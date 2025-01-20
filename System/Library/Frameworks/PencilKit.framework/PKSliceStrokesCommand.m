@interface PKSliceStrokesCommand
- (NSDictionary)substrokes;
- (PKSliceStrokesCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 substrokes:(id)a5 strokesHidden:(id)a6 hiding:(BOOL)a7;
- (id)description;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKSliceStrokesCommand

- (PKSliceStrokesCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 substrokes:(id)a5 strokesHidden:(id)a6 hiding:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSliceStrokesCommand;
  v16 = [(PKModifyStrokesCommand *)&v20 initWithStrokes:v15 drawingUUID:v12 actionName:v13 hiding:v7];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    substrokes = v16->_substrokes;
    v16->_substrokes = (NSDictionary *)v17;
  }
  return v16;
}

- (id)invertedInDrawing:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [v16 _rootStrokes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __43__PKSliceStrokesCommand_invertedInDrawing___block_invoke;
        v17[3] = &unk_1E64C9038;
        v17[4] = self;
        id v18 = v4;
        [v9 _visitVisibleSubstrokes:v17 inDrawing:v16];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v10 = [PKSliceStrokesCommand alloc];
  v11 = [(PKUndoCommand *)self drawingUUID];
  id v12 = [(PKUndoCommand *)self actionName];
  id v13 = [(PKModifyStrokesCommand *)self strokes];
  id v14 = [(PKSliceStrokesCommand *)v10 initWithDrawingUUID:v11 actionName:v12 substrokes:v4 strokesHidden:v13 hiding:[(PKModifyStrokesCommand *)self hide] ^ 1];

  return v14;
}

uint64_t __43__PKSliceStrokesCommand_invertedInDrawing___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v7 = [v5 _strokeUUID];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [v5 _substrokes];
    v10 = *(void **)(a1 + 40);
    v11 = [v5 _strokeUUID];
    [v10 setObject:v9 forKeyedSubscript:v11];

    uint64_t v12 = [*(id *)(a1 + 40) count];
    if (v12 == [*(id *)(*(void *)(a1 + 32) + 48) count]) {
      *a3 = 1;
    }
  }

  return 1;
}

- (void)applyToDrawing:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSliceStrokesCommand;
  [(PKModifyStrokesCommand *)&v9 applyToDrawing:v4];
  id v5 = [v4 uuid];
  uint64_t v6 = [(PKUndoCommand *)self drawingUUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = [(PKSliceStrokesCommand *)self substrokes];
    [v4 setStrokeSubstrokes:v8];
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PKUndoCommand *)self drawingUUID];
  int v7 = [(PKSliceStrokesCommand *)self substrokes];
  BOOL v8 = [(PKModifyStrokesCommand *)self hide];
  objc_super v9 = [(PKModifyStrokesCommand *)self strokes];
  v10 = [v3 stringWithFormat:@"<%@ %p drawing=%@ %@ hide=%d %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (NSDictionary)substrokes
{
  return self->_substrokes;
}

- (void).cxx_destruct
{
}

@end