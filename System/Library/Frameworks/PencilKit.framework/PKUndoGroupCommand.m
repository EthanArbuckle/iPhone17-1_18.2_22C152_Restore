@interface PKUndoGroupCommand
- (NSArray)commands;
- (PKUndoGroupCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 commands:(id)a5;
- (id)invertedInDrawing:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKUndoGroupCommand

- (PKUndoGroupCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 commands:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKUndoGroupCommand;
  v9 = [(PKUndoCommand *)&v13 initWithDrawingUUID:a3 actionName:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    commands = v9->_commands;
    v9->_commands = (NSArray *)v10;
  }
  return v9;
}

- (id)invertedInDrawing:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(PKUndoGroupCommand *)self commands];
  v7 = [v6 reverseObjectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) invertedInDrawing:v4];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_super v13 = [PKUndoGroupCommand alloc];
  v14 = [(PKUndoCommand *)self drawingUUID];
  v15 = [(PKUndoCommand *)self actionName];
  v16 = [(PKUndoGroupCommand *)v13 initWithDrawingUUID:v14 actionName:v15 commands:v5];

  return v16;
}

- (void)applyToDrawing:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(PKUndoGroupCommand *)self commands];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) applyToDrawing:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)commands
{
  return self->_commands;
}

- (void).cxx_destruct
{
}

@end