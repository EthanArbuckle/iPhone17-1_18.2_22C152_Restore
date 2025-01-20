@interface HMMTagSessionProcessorList
- (HMMTagSessionProcessorList)initWithWorkQueue:(id)a3;
- (NSArray)processors;
- (id)objectForChildActivity;
- (void)addProcessor:(id)a3;
- (void)removeProcessor:(id)a3;
@end

@implementation HMMTagSessionProcessorList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSArray)processors
{
  return self->_processors;
}

- (id)objectForChildActivity
{
  v3 = [[HMMTagSessionProcessorList alloc] initWithWorkQueue:self->_workQueue];
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HMMTagSessionProcessorList_objectForChildActivity__block_invoke;
  v8[3] = &unk_1E69FD770;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_async(workQueue, v8);
  v6 = v5;

  return v6;
}

void __52__HMMTagSessionProcessorList_objectForChildActivity__block_invoke(uint64_t a1)
{
}

- (void)removeProcessor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  processors = self->_processors;
  id v6 = a3;
  id v9 = [v4 arrayWithArray:processors];
  [v9 removeObjectIdenticalTo:v6];

  v7 = (NSArray *)[v9 copy];
  v8 = self->_processors;
  self->_processors = v7;
}

- (void)addProcessor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  processors = self->_processors;
  id v6 = a3;
  id v9 = [v4 arrayWithArray:processors];
  [v9 addObject:v6];

  v7 = (NSArray *)[v9 copy];
  v8 = self->_processors;
  self->_processors = v7;
}

- (HMMTagSessionProcessorList)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTagSessionProcessorList;
  id v6 = [(HMMTagSessionProcessorList *)&v10 init];
  v7 = v6;
  if (v6)
  {
    processors = v6->_processors;
    v6->_processors = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_storeStrong((id *)&v7->_workQueue, a3);
  }

  return v7;
}

@end