@interface IKSectionElement
- (IKHeaderElement)header;
- (IKViewElement)footer;
- (NSArray)items;
- (id)applyUpdatesWithElement:(id)a3;
- (id)unboundItemElements;
- (void)appDocumentDidMarkStylesDirty;
@end

@implementation IKSectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  items = self->_items;
  self->_items = 0;
  id v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKSectionElement;
  v6 = [(IKDataSourceElement *)&v8 applyUpdatesWithElement:v5];

  return v6;
}

- (IKHeaderElement)header
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_super v8 = [v7 elementName];
        int v9 = [v8 isEqualToString:@"header"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (IKHeaderElement *)v10;
}

- (NSArray)items
{
  items = self->_items;
  if (!items)
  {
    uint64_t v4 = [(IKSectionElement *)self unboundItemElements];
    uint64_t v5 = self->_items;
    self->_items = v4;

    items = self->_items;
  }
  v6 = [(NSArray *)items count];
  if (v6) {
    v6 = self->_items;
  }
  return v6;
}

- (IKViewElement)footer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_super v8 = [v7 elementName];
        int v9 = [v8 isEqualToString:@"footer"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (IKViewElement *)v10;
}

- (void)appDocumentDidMarkStylesDirty
{
  v4.receiver = self;
  v4.super_class = (Class)IKSectionElement;
  [(IKDataSourceElement *)&v4 appDocumentDidMarkStylesDirty];
  if ([(IKViewElement *)self updateType] >= 3)
  {
    items = self->_items;
    self->_items = 0;
  }
}

- (id)unboundItemElements
{
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_16];
  objc_super v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __39__IKSectionElement_unboundItemElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 elementName];
  if ([v3 isEqualToString:@"header"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [v2 elementName];
    uint64_t v4 = [v5 isEqualToString:@"footer"] ^ 1;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end