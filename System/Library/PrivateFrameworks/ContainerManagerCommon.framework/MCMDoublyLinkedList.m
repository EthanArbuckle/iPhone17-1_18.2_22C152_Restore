@interface MCMDoublyLinkedList
- (MCMDoublyLinkedListNode)head;
- (MCMDoublyLinkedListNode)tail;
- (id)removeFromHead;
- (unint64_t)count;
- (void)addToTail:(id)a3;
- (void)removeAllObjects;
- (void)removeNodeAndAddToTail:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setHead:(id)a3;
- (void)setTail:(id)a3;
@end

@implementation MCMDoublyLinkedList

- (unint64_t)count
{
  return self->_count;
}

- (id)removeFromHead
{
  v3 = [(MCMDoublyLinkedList *)self head];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 next];
    [(MCMDoublyLinkedList *)self setHead:v5];

    v6 = [v4 next];
    [v6 setPrev:0];

    v7 = [(MCMDoublyLinkedList *)self tail];

    if (v4 == v7) {
      [(MCMDoublyLinkedList *)self setTail:0];
    }
    [(MCMDoublyLinkedList *)self setCount:[(MCMDoublyLinkedList *)self count] - 1];
  }
  [v4 setNext:0];
  [v4 setPrev:0];

  return v4;
}

- (void)removeNodeAndAddToTail:(id)a3
{
  id v12 = a3;
  v4 = [v12 prev];
  v5 = [v12 next];
  [v5 setPrev:v4];

  v6 = [v12 next];
  v7 = [v12 prev];
  [v7 setNext:v6];

  id v8 = [(MCMDoublyLinkedList *)self head];

  if (v8 == v12)
  {
    v9 = [v12 next];
    [(MCMDoublyLinkedList *)self setHead:v9];
  }
  id v10 = [(MCMDoublyLinkedList *)self tail];

  if (v10 == v12)
  {
    v11 = [v12 prev];
    [(MCMDoublyLinkedList *)self setTail:v11];
  }
  [v12 setPrev:0];
  [v12 setNext:0];
  [(MCMDoublyLinkedList *)self setCount:[(MCMDoublyLinkedList *)self count] - 1];
  [(MCMDoublyLinkedList *)self addToTail:v12];
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (MCMDoublyLinkedListNode)head
{
  return self->_head;
}

- (void)addToTail:(id)a3
{
  id v4 = a3;
  v5 = [(MCMDoublyLinkedList *)self tail];

  if (v5)
  {
    v6 = [(MCMDoublyLinkedList *)self tail];
    [v6 setNext:v4];

    v7 = [(MCMDoublyLinkedList *)self tail];
    [v4 setPrev:v7];

    [v4 setNext:0];
  }
  else
  {
    [v4 setPrev:0];
    [v4 setNext:0];
    [(MCMDoublyLinkedList *)self setHead:v4];
  }
  [(MCMDoublyLinkedList *)self setTail:v4];

  unint64_t v8 = [(MCMDoublyLinkedList *)self count] + 1;

  [(MCMDoublyLinkedList *)self setCount:v8];
}

- (MCMDoublyLinkedListNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
  p_tail = &self->_tail;

  objc_storeStrong((id *)p_tail, a3);
}

- (void)setHead:(id)a3
{
  p_head = &self->_head;

  objc_storeStrong((id *)p_head, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);

  objc_storeStrong((id *)&self->_head, 0);
}

- (void)removeAllObjects
{
  do
  {
    v3 = [(MCMDoublyLinkedList *)self removeFromHead];
  }
  while (v3);
}

@end