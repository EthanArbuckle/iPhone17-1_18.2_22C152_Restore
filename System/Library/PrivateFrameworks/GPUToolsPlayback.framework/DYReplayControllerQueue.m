@interface DYReplayControllerQueue
- (DYReplayControllerQueue)init;
- (id).cxx_construct;
- (id)front;
- (unint64_t)count;
- (void)clear;
- (void)dequeBlock;
- (void)pushBlock:(id)a3;
@end

@implementation DYReplayControllerQueue

- (DYReplayControllerQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYReplayControllerQueue;
  return [(DYReplayControllerQueue *)&v3 init];
}

- (unint64_t)count
{
  return *((void *)self + 6);
}

- (void)pushBlock:(id)a3
{
  id v4 = a3;
  std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::push_back((void *)self + 1, &v4);
}

- (void)dequeBlock
{
}

- (id)front
{
  v2 = (void *)MEMORY[0x253362820](*(void *)(*(void *)(*((void *)self + 2) + ((*((void *)self + 5) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((void *)self + 5) & 0x1FFLL)), a2);
  return v2;
}

- (void)clear
{
  if (*((void *)self + 6))
  {
    objc_super v3 = (int64x2_t *)((char *)self + 8);
    do
      std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::pop_front(v3);
    while (*((void *)self + 6));
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end