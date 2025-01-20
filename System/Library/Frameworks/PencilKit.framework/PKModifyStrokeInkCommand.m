@interface PKModifyStrokeInkCommand
+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 inks:(id)a5;
- (NSArray)inks;
- (NSArray)oldInks;
- (NSArray)strokes;
- (PKModifyStrokeInkCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 inks:(id)a6 oldInks:(id)a7;
- (id)applyToDrawingReturnInverted:(id)a3;
- (id)description;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKModifyStrokeInkCommand

+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 inks:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "ink", (void)v23);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  v17 = _PencilKitBundle();
  v18 = [v17 localizedStringForKey:@"Modify Stroke Ink" value:@"Modify Stroke Ink" table:@"Localizable"];

  v19 = [PKModifyStrokeInkCommand alloc];
  v20 = [v8 uuid];
  v21 = [(PKModifyStrokeInkCommand *)v19 initWithStrokes:v11 drawingUUID:v20 actionName:v18 inks:v9 oldInks:v10];

  return v21;
}

- (PKModifyStrokeInkCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 inks:(id)a6 oldInks:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKModifyStrokeInkCommand;
  v15 = [(PKUndoCommand *)&v23 initWithDrawingUUID:a4 actionName:a5];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    strokes = v15->_strokes;
    v15->_strokes = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    inks = v15->_inks;
    v15->_inks = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    oldInks = v15->_oldInks;
    v15->_oldInks = (NSArray *)v20;
  }
  return v15;
}

- (id)invertedInDrawing:(id)a3
{
  v4 = [PKModifyStrokeInkCommand alloc];
  v5 = [(PKModifyStrokeInkCommand *)self strokes];
  v6 = [(PKUndoCommand *)self drawingUUID];
  id v7 = [(PKUndoCommand *)self actionName];
  id v8 = [(PKModifyStrokeInkCommand *)v4 initWithStrokes:v5 drawingUUID:v6 actionName:v7 inks:self->_oldInks oldInks:self->_inks];

  return v8;
}

- (void)applyToDrawing:(id)a3
{
  id v9 = a3;
  v4 = [v9 uuid];
  v5 = [(PKUndoCommand *)self drawingUUID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    strokes = self->_strokes;
    id v8 = [(PKModifyStrokeInkCommand *)self inks];
    [v9 setStrokes:strokes inks:v8];
  }
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = [(PKUndoCommand *)self drawingUUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    strokes = self->_strokes;
    id v9 = [(PKModifyStrokeInkCommand *)self inks];
    id v10 = [v4 undoableSetStrokes:strokes inks:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [(PKModifyStrokeInkCommand *)self inks];
  int v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [(PKUndoCommand *)self drawingUUID];
  id v9 = [(PKModifyStrokeInkCommand *)self strokes];
  id v10 = [v3 stringWithFormat:@"<%@ %p ink=%@ drawing=%@ %@>", v5, self, v7, v8, v9];

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (NSArray)inks
{
  return self->_inks;
}

- (NSArray)oldInks
{
  return self->_oldInks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldInks, 0);
  objc_storeStrong((id *)&self->_inks, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end