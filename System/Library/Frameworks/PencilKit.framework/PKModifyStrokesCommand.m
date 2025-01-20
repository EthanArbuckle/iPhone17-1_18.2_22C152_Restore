@interface PKModifyStrokesCommand
+ (id)commandForErasingAllStrokesInDrawing:(id)a3;
+ (id)commandForErasingStrokes:(id)a3 drawing:(id)a4;
+ (id)commandForMakingStrokeVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5;
+ (id)commandForMakingStrokesVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5;
- (BOOL)hide;
- (NSArray)strokes;
- (PKModifyStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 hiding:(BOOL)a6;
- (id)description;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKModifyStrokesCommand

+ (id)commandForMakingStrokeVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5
{
  BOOL v5 = a5;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = _PencilKitBundle();
  v10 = [v9 localizedStringForKey:@"Stroke" value:@"Stroke" table:@"Localizable"];

  v11 = [PKModifyStrokesCommand alloc];
  v16[0] = v7;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13 = [v8 uuid];
  v14 = [(PKModifyStrokesCommand *)v11 initWithStrokes:v12 drawingUUID:v13 actionName:v10 hiding:v5];

  return v14;
}

+ (id)commandForMakingStrokesVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = _PencilKitBundle();
  v10 = [v9 localizedStringForKey:@"Added strokes" value:@"Added strokes" table:@"Localizable"];

  v11 = [PKModifyStrokesCommand alloc];
  v12 = [v8 uuid];
  v13 = [(PKModifyStrokesCommand *)v11 initWithStrokes:v7 drawingUUID:v12 actionName:v10 hiding:v5];

  return v13;
}

+ (id)commandForErasingAllStrokesInDrawing:(id)a3
{
  id v3 = a3;
  v4 = _PencilKitBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Erase All" value:@"Erase All" table:@"Localizable"];

  v6 = [PKModifyStrokesCommand alloc];
  id v7 = [v3 strokes];
  id v8 = [v3 uuid];
  v9 = [(PKModifyStrokesCommand *)v6 initWithStrokes:v7 drawingUUID:v8 actionName:v5 hiding:1];

  return v9;
}

+ (id)commandForErasingStrokes:(id)a3 drawing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _PencilKitBundle();
  id v8 = [v7 localizedStringForKey:@"Erase" value:@"Erase" table:@"Localizable"];

  v9 = [PKModifyStrokesCommand alloc];
  v10 = [v6 uuid];
  v11 = [(PKModifyStrokesCommand *)v9 initWithStrokes:v5 drawingUUID:v10 actionName:v8 hiding:1];

  return v11;
}

- (PKModifyStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 hiding:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKModifyStrokesCommand;
  v13 = [(PKUndoCommand *)&v17 initWithDrawingUUID:v11 actionName:v12];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    strokes = v13->_strokes;
    v13->_strokes = (NSArray *)v14;

    v13->_hide = a6;
  }

  return v13;
}

- (id)invertedInDrawing:(id)a3
{
  BOOL v4 = [(PKModifyStrokesCommand *)self hide];
  id v5 = [PKModifyStrokesCommand alloc];
  id v6 = [(PKModifyStrokesCommand *)self strokes];
  id v7 = [(PKUndoCommand *)self drawingUUID];
  id v8 = [(PKUndoCommand *)self actionName];
  v9 = [(PKModifyStrokesCommand *)v5 initWithStrokes:v6 drawingUUID:v7 actionName:v8 hiding:!v4];

  return v9;
}

- (void)applyToDrawing:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 uuid];
  id v5 = [(PKUndoCommand *)self drawingUUID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = [(PKModifyStrokesCommand *)self strokes];
    objc_msgSend(v8, "setStrokes:hidden:", v7, -[PKModifyStrokesCommand hide](self, "hide"));
  }
}

- (id)description
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(PKModifyStrokesCommand *)self hide];
  id v7 = [(PKUndoCommand *)self drawingUUID];
  id v8 = [(PKModifyStrokesCommand *)self strokes];
  v9 = [v3 stringWithFormat:@"<%@ %p hide=%d drawing=%@ %@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (BOOL)hide
{
  return self->_hide;
}

- (void).cxx_destruct
{
}

@end