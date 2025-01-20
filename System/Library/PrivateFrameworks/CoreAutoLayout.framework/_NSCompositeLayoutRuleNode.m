@interface _NSCompositeLayoutRuleNode
- (NSArray)_childRuleNodes;
- (NSString)debugDescription;
- (uint64_t)childNodesCreatingIfNecessary;
- (void)_addChildRuleNode:(id)a3;
- (void)_removeChildRuleNode:(id)a3;
- (void)dealloc;
@end

@implementation _NSCompositeLayoutRuleNode

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutRuleNode;
  [(_NSLayoutRuleNode *)&v3 dealloc];
}

- (uint64_t)childNodesCreatingIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 24);
    if (!result)
    {
      result = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
      *(void *)(v1 + 24) = result;
    }
  }
  return result;
}

- (NSString)debugDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(_NSLayoutRuleNode *)self description];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  childNodes = self->_childNodes;
  uint64_t v5 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(childNodes);
        }
        id v3 = (id)[v3 stringByAppendingFormat:@"\n    %@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringByAppendingFormat:@"\n</%@>", NSStringFromClass(v9)];
}

- (NSArray)_childRuleNodes
{
  if (self->_childNodes) {
    return &self->_childNodes->super;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_addChildRuleNode:(id)a3
{
  v4 = (void *)-[_NSCompositeLayoutRuleNode childNodesCreatingIfNecessary]((uint64_t)self);
  [v4 addObject:a3];
}

- (void)_removeChildRuleNode:(id)a3
{
}

@end