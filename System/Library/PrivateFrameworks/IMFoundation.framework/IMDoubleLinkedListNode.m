@interface IMDoubleLinkedListNode
- (IMDoubleLinkedListNode)initWithObject:(id)a3;
- (IMDoubleLinkedListNode)next;
- (IMDoubleLinkedListNode)prev;
- (id)object;
- (void)orphan;
- (void)removeFromList;
- (void)setNext:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation IMDoubleLinkedListNode

- (IMDoubleLinkedListNode)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDoubleLinkedListNode;
  v6 = [(IMDoubleLinkedListNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (void)removeFromList
{
  prev = self->_prev;
  v4 = self->_next;
  v13 = prev;
  objc_msgSend_setNext_(v13, v5, (uint64_t)v4, v6);
  objc_msgSend_setPrev_(v4, v7, (uint64_t)v13, v8);

  objc_msgSend_setNext_(self, v9, 0, v10);
  objc_msgSend_setPrev_(self, v11, 0, v12);
}

- (void)orphan
{
  objc_msgSend_setNext_(self, a2, 0, v2);
  objc_msgSend_setPrev_(self, v4, 0, v5);
  objc_msgSend_setObject_(self, v6, 0, v7);
}

- (IMDoubleLinkedListNode)prev
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrev:(id)a3
{
}

- (IMDoubleLinkedListNode)next
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNext:(id)a3
{
}

- (id)object
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_prev, 0);
}

@end