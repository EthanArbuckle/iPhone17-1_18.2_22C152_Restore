@interface TIKeyboardListControllerTable
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5;
- (void)addEditingChangeHandler:(id)a3;
- (void)dealloc;
@end

@implementation TIKeyboardListControllerTable

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardListControllerTable;
  [(TIKeyboardListControllerTable *)&v3 dealloc];
}

- (void)addEditingChangeHandler:(id)a3
{
  if (!self->_todoList) {
    self->_todoList = (NSMutableArray *)(id)[MEMORY[0x263EFF980] array];
  }
  id v5 = (id)[a3 copy];
  [(NSMutableArray *)self->_todoList addObject:v5];
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardListControllerTable;
  [(TIKeyboardListControllerTable *)&v15 _setEditing:a3 animated:a4 forced:a5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  todoList = self->_todoList;
  uint64_t v7 = [(NSMutableArray *)todoList countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(todoList);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))();
      }
      uint64_t v8 = [(NSMutableArray *)todoList countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
  [(NSMutableArray *)self->_todoList removeAllObjects];
}

@end