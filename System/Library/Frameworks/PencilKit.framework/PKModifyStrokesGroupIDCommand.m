@interface PKModifyStrokesGroupIDCommand
+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 groupID:(id)a5 actionName:(id)a6;
- (NSArray)strokes;
- (NSUUID)groupID;
- (NSUUID)oldGroupID;
- (PKModifyStrokesGroupIDCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 groupID:(id)a6 oldGroupID:(id)a7;
- (id)applyToDrawingReturnInverted:(id)a3;
- (id)description;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKModifyStrokesGroupIDCommand

+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 groupID:(id)a5 actionName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 firstObject];
  v14 = [v13 _groupID];

  v15 = [PKModifyStrokesGroupIDCommand alloc];
  v16 = [v10 uuid];
  v17 = [(PKModifyStrokesGroupIDCommand *)v15 initWithStrokes:v9 drawingUUID:v16 actionName:v12 groupID:v11 oldGroupID:v14];

  return v17;
}

- (PKModifyStrokesGroupIDCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 groupID:(id)a6 oldGroupID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKModifyStrokesGroupIDCommand;
  v17 = [(PKUndoCommand *)&v21 initWithDrawingUUID:v13 actionName:v14 changesVisibleStrokes:0];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    strokes = v17->_strokes;
    v17->_strokes = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_groupID, a6);
    objc_storeStrong((id *)&v17->_oldGroupID, a7);
  }

  return v17;
}

- (id)invertedInDrawing:(id)a3
{
  v4 = [PKModifyStrokesGroupIDCommand alloc];
  v5 = [(PKModifyStrokesGroupIDCommand *)self strokes];
  v6 = [(PKUndoCommand *)self drawingUUID];
  v7 = [(PKUndoCommand *)self actionName];
  v8 = [(PKModifyStrokesGroupIDCommand *)v4 initWithStrokes:v5 drawingUUID:v6 actionName:v7 groupID:self->_oldGroupID oldGroupID:self->_groupID];

  return v8;
}

- (void)applyToDrawing:(id)a3
{
  id v7 = a3;
  v4 = [v7 uuid];
  v5 = [(PKUndoCommand *)self drawingUUID];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [v7 setStrokes:self->_strokes groupID:self->_groupID];
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
    groupID = self->_groupID;
    id v10 = [(PKUndoCommand *)self actionName];
    id v11 = [v4 undoableSetStrokes:strokes groupID:groupID actionName:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [(PKModifyStrokesGroupIDCommand *)self groupID];
  int v7 = [(PKModifyStrokesGroupIDCommand *)self oldGroupID];
  v8 = [(PKUndoCommand *)self drawingUUID];
  id v9 = [(PKModifyStrokesGroupIDCommand *)self strokes];
  id v10 = [v3 stringWithFormat:@"<%@ %p groupID=%@ (old groupID=%@) drawing=%@ %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (NSUUID)groupID
{
  return self->_groupID;
}

- (NSUUID)oldGroupID
{
  return self->_oldGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end