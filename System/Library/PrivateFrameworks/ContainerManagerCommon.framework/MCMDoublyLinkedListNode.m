@interface MCMDoublyLinkedListNode
- (MCMDoublyLinkedListNode)initWithKey:(id)a3 data:(id)a4;
- (MCMDoublyLinkedListNode)next;
- (MCMDoublyLinkedListNode)prev;
- (id)data;
- (id)key;
- (void)setData:(id)a3;
- (void)setKey:(id)a3;
- (void)setNext:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation MCMDoublyLinkedListNode

- (id)data
{
  return self->_data;
}

- (void)setKey:(id)a3
{
  p_key = &self->_key;

  objc_storeStrong(p_key, a3);
}

- (void)setData:(id)a3
{
  p_data = &self->_data;

  objc_storeStrong(p_data, a3);
}

- (id)key
{
  return self->_key;
}

- (void)setPrev:(id)a3
{
  p_prev = &self->_prev;

  objc_storeWeak((id *)p_prev, a3);
}

- (MCMDoublyLinkedListNode)prev
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prev);

  return (MCMDoublyLinkedListNode *)WeakRetained;
}

- (MCMDoublyLinkedListNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  p_next = &self->_next;

  objc_storeStrong((id *)p_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_destroyWeak((id *)&self->_prev);
  objc_storeStrong(&self->_key, 0);

  objc_storeStrong(&self->_data, 0);
}

- (MCMDoublyLinkedListNode)initWithKey:(id)a3 data:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCMDoublyLinkedListNode;
  v8 = [(MCMDoublyLinkedListNode *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MCMDoublyLinkedListNode *)v8 setKey:v6];
    [(MCMDoublyLinkedListNode *)v9 setData:v7];
  }

  return v9;
}

@end