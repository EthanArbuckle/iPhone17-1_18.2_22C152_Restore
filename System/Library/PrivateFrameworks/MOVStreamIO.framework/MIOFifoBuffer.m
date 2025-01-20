@interface MIOFifoBuffer
- (BOOL)enqueue:(id)a3;
- (BOOL)prohibitDropping;
- (MIOFifoBuffer)initWithCapacity:(unint64_t)a3;
- (id)dequeue;
- (unint64_t)capacity;
- (unint64_t)usage;
- (void)dealloc;
- (void)emptyFifoBuffer;
- (void)setProhibitDropping:(BOOL)a3;
@end

@implementation MIOFifoBuffer

- (MIOFifoBuffer)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIOFifoBuffer;
  v4 = [(MIOFifoBuffer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &v4->_queue);
  }
  return v5;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)usage
{
  return CMSimpleQueueGetCount(self->_queue);
}

- (void)dealloc
{
  [(MIOFifoBuffer *)self emptyFifoBuffer];
  queue = self->_queue;
  if (queue) {
    CFRelease(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOFifoBuffer;
  [(MIOFifoBuffer *)&v4 dealloc];
}

- (void)emptyFifoBuffer
{
  v2 = self;
  while ([(MIOFifoBuffer *)self usage])
  {
    id v3 = [(MIOFifoBuffer *)v2 dequeue];
    self = v2;
  }
}

- (BOOL)enqueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  id v6 = v4;
  LOBYTE(queue) = CMSimpleQueueEnqueue(queue, v6) == 0;

  return (char)queue;
}

- (id)dequeue
{
  v2 = (void *)CMSimpleQueueDequeue(self->_queue);

  return v2;
}

- (BOOL)prohibitDropping
{
  return self->_prohibitDropping;
}

- (void)setProhibitDropping:(BOOL)a3
{
  self->_prohibitDropping = a3;
}

- (void).cxx_destruct
{
}

@end