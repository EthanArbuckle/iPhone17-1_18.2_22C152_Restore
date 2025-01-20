@interface _FEFocusGroupHistory
- (_FEFocusGroupHistory)init;
- (id)lastFocusedItemForGroupIdentifier:(id)a3;
- (void)_uiktest_clearHistory;
- (void)setLastFocusedItem:(id)a3 forGroupIdentifier:(id)a4;
@end

@implementation _FEFocusGroupHistory

- (_FEFocusGroupHistory)init
{
  v8.receiver = self;
  v8.super_class = (Class)_FEFocusGroupHistory;
  v2 = [(_FEFocusGroupHistory *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A90] pointerFunctionsWithOptions:0];
    v4 = [MEMORY[0x263F08A90] pointerFunctionsWithOptions:517];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyPointerFunctions:v3 valuePointerFunctions:v4 capacity:10];
    groupToItemMap = v2->_groupToItemMap;
    v2->_groupToItemMap = (NSMapTable *)v5;
  }
  return v2;
}

- (id)lastFocusedItemForGroupIdentifier:(id)a3
{
  return [(NSMapTable *)self->_groupToItemMap objectForKey:a3];
}

- (void)setLastFocusedItem:(id)a3 forGroupIdentifier:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_FEFocusGroupHistory.m", 37, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x263F08690] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"_FEFocusGroupHistory.m", 38, @"Invalid parameter not satisfying: %@", @"groupIdentifier" object file lineNumber description];

LABEL_3:
  [(NSMapTable *)self->_groupToItemMap setObject:v10 forKey:v7];
}

- (void)_uiktest_clearHistory
{
}

- (void).cxx_destruct
{
}

@end