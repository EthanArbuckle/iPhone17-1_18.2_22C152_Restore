@interface AMSDoubleLinkedList
- (AMSDoubleLinkedList)init;
- (AMSDoubleLinkedListNode)head;
- (AMSDoubleLinkedListNode)tail;
- (NSArray)allNodes;
- (NSString)listIdentifier;
- (id)appendObject:(id)a3;
- (id)description;
- (id)insertObject:(id)a3;
- (unint64_t)count;
- (void)appendNode:(id)a3;
- (void)insertNode:(id)a3;
- (void)removeAllNodes;
- (void)removeNode:(id)a3;
- (void)setHead:(id)a3;
- (void)setListIdentifier:(id)a3;
- (void)setTail:(id)a3;
@end

@implementation AMSDoubleLinkedList

- (void)removeNode:(id)a3
{
  id v16 = a3;
  v4 = [v16 listIdentifier];
  v5 = [(AMSDoubleLinkedList *)self listIdentifier];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AMSDoubleLinkedListInvalidNode" reason:@"Attempting to remove a node from a list it doesn't belong to." userInfo:0];
    objc_exception_throw(v15);
  }
  v7 = [v16 next];
  v8 = [v16 previous];
  [v7 setPrevious:v8];

  v9 = [v16 previous];
  v10 = [v16 next];
  [v9 setNext:v10];

  id v11 = [(AMSDoubleLinkedList *)self head];

  if (v11 == v16)
  {
    v12 = [v16 next];
    [(AMSDoubleLinkedList *)self setHead:v12];
  }
  id v13 = [(AMSDoubleLinkedList *)self tail];

  if (v13 == v16)
  {
    v14 = [v16 previous];
    [(AMSDoubleLinkedList *)self setTail:v14];
  }
  [v16 setListIdentifier:0];
  --self->_count;
}

- (void)setTail:(id)a3
{
}

- (void)insertNode:(id)a3
{
  id v9 = a3;
  v4 = [v9 listIdentifier];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AMSDoubleLinkedListInvalidNode" reason:@"Attempting to add a node that has already been added to another list." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = [(AMSDoubleLinkedList *)self head];
  [(AMSDoubleLinkedList *)self setHead:v9];
  char v6 = [(AMSDoubleLinkedList *)self tail];

  if (!v6) {
    [(AMSDoubleLinkedList *)self setTail:v9];
  }
  [v9 setPrevious:0];
  [v9 setNext:v5];
  [v5 setPrevious:v9];
  v7 = [(AMSDoubleLinkedList *)self listIdentifier];
  [v9 setListIdentifier:v7];

  ++self->_count;
}

- (AMSDoubleLinkedListNode)tail
{
  return self->_tail;
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (AMSDoubleLinkedListNode)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
}

- (id)insertObject:(id)a3
{
  id v4 = a3;
  v5 = [[AMSDoubleLinkedListNode alloc] initWithObject:v4];

  [(AMSDoubleLinkedList *)self insertNode:v5];
  return v5;
}

- (AMSDoubleLinkedList)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSDoubleLinkedList;
  v2 = [(AMSDoubleLinkedList *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    listIdentifier = v2->_listIdentifier;
    v2->_listIdentifier = (NSString *)v4;
  }
  return v2;
}

- (NSArray)allNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(AMSDoubleLinkedList *)self head];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 next];

      v5 = (void *)v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (void)appendNode:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 listIdentifier];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AMSDoubleLinkedListInvalidNode" reason:@"Attempting to add a node that has already been added to another list." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = [(AMSDoubleLinkedList *)self tail];
  [(AMSDoubleLinkedList *)self setTail:v9];
  uint64_t v6 = [(AMSDoubleLinkedList *)self head];

  if (!v6) {
    [(AMSDoubleLinkedList *)self setHead:v9];
  }
  [v9 setPrevious:v5];
  [v9 setNext:0];
  [v5 setNext:v9];
  objc_super v7 = [(AMSDoubleLinkedList *)self listIdentifier];
  [v9 setListIdentifier:v7];

  ++self->_count;
}

- (id)appendObject:(id)a3
{
  id v4 = a3;
  v5 = [[AMSDoubleLinkedListNode alloc] initWithObject:v4];

  [(AMSDoubleLinkedList *)self appendNode:v5];
  return v5;
}

- (void)removeAllNodes
{
  self->_count = 0;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(AMSDoubleLinkedList *)self allNodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 object];
        [v3 appendFormat:@"%@", v10];

        id v11 = [(AMSDoubleLinkedList *)self tail];

        if (v9 != v11) {
          [v3 appendString:@",\n"];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setListIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end