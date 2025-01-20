@interface _FEDebugLogStack
- (_FEDebugLogNode)rootNode;
- (_FEDebugLogStack)init;
- (id)_topNode;
- (id)popNode;
- (void)addMessage:(id)a3;
- (void)performWithPushedNode:(id)a3 block:(id)a4;
- (void)pushNode:(id)a3;
@end

@implementation _FEDebugLogStack

- (_FEDebugLogStack)init
{
  v7.receiver = self;
  v7.super_class = (Class)_FEDebugLogStack;
  v2 = [(_FEDebugLogStack *)&v7 init];
  if (v2)
  {
    v3 = +[_FEDebugLogNode rootNode];
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithObject:v3];
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v4;
  }
  return v2;
}

- (id)_topNode
{
  return (id)[(NSMutableArray *)self->_stack lastObject];
}

- (_FEDebugLogNode)rootNode
{
  return (_FEDebugLogNode *)[(NSMutableArray *)self->_stack firstObject];
}

- (void)addMessage:(id)a3
{
  id v7 = a3;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 327, @"Invalid parameter not satisfying: %@", @"message != nil && [message isKindOfClass:[_FEDebugLogMessage class]]" object file lineNumber description];
  }
  v5 = [(_FEDebugLogStack *)self _topNode];
  [v5 addMessage:v7];
}

- (void)pushNode:(id)a3
{
  id v7 = a3;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 333, @"Invalid parameter not satisfying: %@", @"node != nil && [node isKindOfClass:[_FEDebugLogNode class]]" object file lineNumber description];
  }
  v5 = [(_FEDebugLogStack *)self _topNode];
  [v5 addMessage:v7];

  [(NSMutableArray *)self->_stack addObject:v7];
}

- (id)popNode
{
  if ((unint64_t)[(NSMutableArray *)self->_stack count] <= 1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_FEDebugLogTree.m" lineNumber:340 description:@"Unable to pop the last node on the stack. This indicates an imbalance in push and pop calls."];
  }
  uint64_t v4 = [(_FEDebugLogStack *)self _topNode];
  [(NSMutableArray *)self->_stack removeLastObject];
  return v4;
}

- (void)performWithPushedNode:(id)a3 block:(id)a4
{
  id v24 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = v24;
  v9 = v7;
  if (v24)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 348, @"Invalid parameter not satisfying: %@", @"node != nil" object file lineNumber description];

    id v8 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x263F08690] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 349, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

  id v8 = v24;
LABEL_3:
  [(_FEDebugLogStack *)self pushNode:v8];
  v9[2](v9);
  id v10 = [(_FEDebugLogStack *)self popNode];
  if (v10 != v24)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    id v14 = v24;
    if (v24)
    {
      v15 = NSString;
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = [v15 stringWithFormat:@"<%@: %p>", v17, v14];
    }
    else
    {
      v18 = @"(nil)";
    }

    id v19 = v10;
    if (v19)
    {
      v20 = NSString;
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];
    }
    else
    {
      v23 = @"(nil)";
    }

    [v13 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 353, @"Imbalanced calls to push and pop. Expected node %@ to be popped but got %@.", v18, v23 object file lineNumber description];
  }
}

- (void).cxx_destruct
{
}

@end