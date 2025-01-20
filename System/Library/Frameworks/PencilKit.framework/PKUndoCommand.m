@interface PKUndoCommand
- (BOOL)changesVisibleStrokes;
- (NSString)actionName;
- (PKDrawingUUID)drawingUUID;
- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4;
- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5;
- (id)applyToDrawingReturnInverted:(id)a3;
- (id)inverted;
- (id)strokes;
- (void)registerWithUndoManager:(id)a3 target:(id)a4 selector:(SEL)a5;
- (void)setActionName:(id)a3;
@end

@implementation PKUndoCommand

- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4
{
  return [(PKUndoCommand *)self initWithDrawingUUID:a3 actionName:a4 changesVisibleStrokes:1];
}

- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKUndoCommand;
  v11 = [(PKUndoCommand *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    actionName = v11->_actionName;
    v11->_actionName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_drawingUUID, a3);
    v11->_changesVisibleStrokes = a5;
  }

  return v11;
}

- (void)registerWithUndoManager:(id)a3 target:(id)a4 selector:(SEL)a5
{
  id v8 = a4;
  id v10 = a3;
  id v9 = [(PKUndoCommand *)self actionName];
  [v10 setActionName:v9];

  [v10 registerUndoWithTarget:v8 selector:a5 object:self];
}

- (id)inverted
{
  return [(PKUndoCommand *)self invertedInDrawing:0];
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  id v4 = a3;
  v5 = [(PKUndoCommand *)self invertedInDrawing:v4];
  [(PKUndoCommand *)self applyToDrawing:v4];

  return v5;
}

- (id)strokes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PKDrawingUUID)drawingUUID
{
  return self->_drawingUUID;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (BOOL)changesVisibleStrokes
{
  return self->_changesVisibleStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionName, 0);

  objc_storeStrong((id *)&self->_drawingUUID, 0);
}

@end