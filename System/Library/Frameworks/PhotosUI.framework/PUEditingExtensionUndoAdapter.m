@interface PUEditingExtensionUndoAdapter
- (NSUndoManager)undoManager;
- (PUEditingExtensionUndoAdapter)initWithButtonHost:(id)a3;
- (PUEditingExtensionUndoButtonHost)buttonHost;
- (void)_registerForUndoManagerNotifications:(id)a3;
- (void)_unregisterForUndoManagerNotifications:(id)a3;
- (void)_updateButtonState;
- (void)performRedo;
- (void)performUndo;
- (void)setUndoManager:(id)a3;
@end

@implementation PUEditingExtensionUndoAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);

  objc_storeStrong((id *)&self->_buttonHost, 0);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (PUEditingExtensionUndoButtonHost)buttonHost
{
  return self->_buttonHost;
}

- (void)_updateButtonState
{
  id v4 = [(PUEditingExtensionUndoAdapter *)self buttonHost];
  v3 = [(PUEditingExtensionUndoAdapter *)self undoManager];
  objc_msgSend(v4, "setUndoEnabled:redoEnabled:", objc_msgSend(v3, "canUndo"), objc_msgSend(v3, "canRedo"));
}

- (void)_unregisterForUndoManagerNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F08620] object:v5];
  [v6 removeObserver:self name:*MEMORY[0x263F08638] object:v5];
  [v6 removeObserver:self name:*MEMORY[0x263F08630] object:v5];
}

- (void)_registerForUndoManagerNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel__updateButtonState name:*MEMORY[0x263F08620] object:v5];
  [v6 addObserver:self selector:sel__updateButtonState name:*MEMORY[0x263F08638] object:v5];
  [v6 addObserver:self selector:sel__updateButtonState name:*MEMORY[0x263F08630] object:v5];
}

- (void)performRedo
{
}

void __44__PUEditingExtensionUndoAdapter_performRedo__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) undoManager];
  [v1 redo];
}

- (void)performUndo
{
}

void __44__PUEditingExtensionUndoAdapter_performUndo__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) undoManager];
  [v1 undo];
}

- (void)setUndoManager:(id)a3
{
  id v5 = (NSUndoManager *)a3;
  undoManager = self->_undoManager;
  if (undoManager != v5)
  {
    v8 = v5;
    if (undoManager) {
      -[PUEditingExtensionUndoAdapter _unregisterForUndoManagerNotifications:](self, "_unregisterForUndoManagerNotifications:");
    }
    objc_storeStrong((id *)&self->_undoManager, a3);
    v7 = [(PUEditingExtensionUndoAdapter *)self buttonHost];
    [v7 setShowUndoRedo:v8 != 0];

    id v5 = (NSUndoManager *)[(PUEditingExtensionUndoAdapter *)self _updateButtonState];
    if (v8) {
      id v5 = (NSUndoManager *)[(PUEditingExtensionUndoAdapter *)self _registerForUndoManagerNotifications:v8];
    }
  }

  MEMORY[0x270F9A758](v5);
}

- (PUEditingExtensionUndoAdapter)initWithButtonHost:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditingExtensionUndoAdapter;
  id v6 = [(PUEditingExtensionUndoAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_buttonHost, a3);
  }

  return v7;
}

@end