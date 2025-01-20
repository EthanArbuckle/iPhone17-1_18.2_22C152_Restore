@interface BRCLRUDictionary
- (BRCLRUDictionary)initWithMaximumCapacity:(unint64_t)a3;
- (BRCLRUDictionaryNode)head;
- (BRCLRUDictionaryNode)tail;
- (NSMutableDictionary)dictionary;
- (id)allKeys;
- (id)allValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maximumCapacity;
- (void)_addNodeToFront:(id)a3;
- (void)_moveNodeToFront:(id)a3;
- (void)_removeNode:(id)a3;
- (void)_removeNodeFromLinkedList:(id)a3;
- (void)_shrinkToCapacity;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setHead:(id)a3;
- (void)setMaximumCapacity:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setTail:(id)a3;
@end

@implementation BRCLRUDictionary

- (BRCLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (!a3)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLRUDictionary initWithMaximumCapacity:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }

    unint64_t v3 = 1;
  }
  v21.receiver = self;
  v21.super_class = (Class)BRCLRUDictionary;
  v13 = [(BRCLRUDictionary *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
    dictionary = v13->_dictionary;
    v13->_dictionary = (NSMutableDictionary *)v14;

    v13->_maximumCapacity = v3;
    v16 = [[BRCLRUDictionaryNode alloc] initWithKey:0 object:0];
    head = v13->_head;
    v13->_head = v16;

    v18 = [[BRCLRUDictionaryNode alloc] initWithKey:0 object:0];
    tail = v13->_tail;
    v13->_tail = v18;

    [(BRCLRUDictionaryNode *)v13->_head setNext:v13->_tail];
    [(BRCLRUDictionaryNode *)v13->_tail setPrev:v13->_head];
  }
  return v13;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_dictionary count];
}

- (id)allKeys
{
  return (id)[(NSMutableDictionary *)self->_dictionary allKeys];
}

- (id)allValues
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_dictionary, "count"));
  v4 = [(BRCLRUDictionary *)self head];
  v5 = [v4 next];

  if (v5 == self->_tail)
  {
    uint64_t v7 = v5;
  }
  else
  {
    do
    {
      v6 = [(BRCLRUDictionaryNode *)v5 object];
      [v3 addObject:v6];

      uint64_t v7 = [(BRCLRUDictionaryNode *)v5 next];

      v5 = v7;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (void)setMaximumCapacity:(unint64_t)a3
{
  self->_maximumCapacity = a3;
  [(BRCLRUDictionary *)self _shrinkToCapacity];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLRUDictionary objectForKey:]((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v5 = [(BRCLRUDictionary *)self dictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [(BRCLRUDictionary *)self _moveNodeToFront:v6];
    uint64_t v7 = [v6 object];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCLRUDictionary objectForKey:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  uint64_t v8 = [(BRCLRUDictionary *)self dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    [(BRCLRUDictionary *)self _moveNodeToFront:v9];
    [(BRCLRUDictionaryNode *)v9 setObject:v6];
  }
  else
  {
    uint64_t v10 = [(BRCLRUDictionary *)self dictionary];
    uint64_t v11 = [v10 count];
    unint64_t v12 = [(BRCLRUDictionary *)self maximumCapacity];

    if (v11 == v12)
    {
      uint64_t v13 = [(BRCLRUDictionary *)self tail];
      uint64_t v14 = [v13 prev];
      [(BRCLRUDictionary *)self _removeNode:v14];
    }
    uint64_t v9 = [[BRCLRUDictionaryNode alloc] initWithKey:v7 object:v6];
    uint64_t v15 = [(BRCLRUDictionary *)self dictionary];
    [v15 setObject:v9 forKeyedSubscript:v7];

    [(BRCLRUDictionary *)self _addNodeToFront:v9];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(BRCLRUDictionary *)self dictionary];
  id v7 = [v5 objectForKeyedSubscript:v4];

  id v6 = v7;
  if (v7)
  {
    [(BRCLRUDictionary *)self _removeNode:v7];
    id v6 = v7;
  }
}

- (void)removeAllObjects
{
  unint64_t v3 = [(BRCLRUDictionary *)self dictionary];
  [v3 removeAllObjects];

  id v4 = [(BRCLRUDictionary *)self tail];
  v5 = [(BRCLRUDictionary *)self head];
  [v5 setNext:v4];

  id v7 = [(BRCLRUDictionary *)self head];
  id v6 = [(BRCLRUDictionary *)self tail];
  [v6 setPrev:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[BRCLRUDictionary alloc] initWithMaximumCapacity:[(BRCLRUDictionary *)self maximumCapacity]];
  uint64_t v5 = [(NSMutableDictionary *)self->_dictionary mutableCopy];
  dictionary = v4->_dictionary;
  v4->_dictionary = (NSMutableDictionary *)v5;

  uint64_t v7 = [(BRCLRUDictionaryNode *)self->_head copy];
  head = v4->_head;
  v4->_head = (BRCLRUDictionaryNode *)v7;

  uint64_t v9 = [(BRCLRUDictionaryNode *)self->_tail copy];
  tail = v4->_tail;
  v4->_tail = (BRCLRUDictionaryNode *)v9;

  return v4;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>{\n", objc_opt_class(), self];
  id v4 = [(BRCLRUDictionary *)self head];
  uint64_t v5 = [v4 next];

  if (v5 == self->_tail)
  {
    uint64_t v8 = v5;
  }
  else
  {
    do
    {
      id v6 = [(BRCLRUDictionaryNode *)v5 key];
      uint64_t v7 = [(BRCLRUDictionaryNode *)v5 object];
      [v3 appendFormat:@"\t%@ = %@;\n", v6, v7];

      uint64_t v8 = [(BRCLRUDictionaryNode *)v5 next];

      uint64_t v5 = v8;
    }
    while (v8 != self->_tail);
  }

  [v3 appendString:@"}\n"];
  return v3;
}

- (void)_shrinkToCapacity
{
  for (i = self; [(BRCLRUDictionary *)self count] > i->_maximumCapacity; self = i)
  {
    unint64_t v3 = [(BRCLRUDictionary *)i tail];
    id v5 = [v3 prev];

    if (!v5
      || ([(BRCLRUDictionary *)i head], id v4 = (id)objc_claimAutoreleasedReturnValue(), v4, v5 == v4))
    {

      return;
    }
    [(BRCLRUDictionary *)i _removeNode:v5];
  }
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  id v3 = a3;
  id v5 = [v3 prev];
  id v4 = [v3 next];

  [v5 setNext:v4];
  [v4 setPrev:v5];
}

- (void)_removeNode:(id)a3
{
  id v4 = a3;
  [(BRCLRUDictionary *)self _removeNodeFromLinkedList:v4];
  id v6 = [(BRCLRUDictionary *)self dictionary];
  id v5 = [v4 key];

  [v6 removeObjectForKey:v5];
}

- (void)_moveNodeToFront:(id)a3
{
  id v6 = a3;
  id v4 = [(BRCLRUDictionary *)self head];
  id v5 = [v4 next];

  if (v5 != v6)
  {
    [(BRCLRUDictionary *)self _removeNodeFromLinkedList:v6];
    [(BRCLRUDictionary *)self _addNodeToFront:v6];
  }
}

- (void)_addNodeToFront:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCLRUDictionary *)self head];
  id v8 = [v5 next];

  id v6 = [(BRCLRUDictionary *)self head];
  [v6 setNext:v4];

  uint64_t v7 = [(BRCLRUDictionary *)self head];
  [v4 setPrev:v7];

  [v4 setNext:v8];
  [v8 setPrev:v4];
}

- (unint64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (BRCLRUDictionaryNode)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
}

- (BRCLRUDictionaryNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)initWithMaximumCapacity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D353B000, a2, a3, "[CRIT] UNREACHABLE: Initialized with maximumCapacity == 0%@", a5, a6, a7, a8, 2u);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D353B000, a2, a3, "[CRIT] Assertion failed: key != nil%@", a5, a6, a7, a8, 2u);
}

@end