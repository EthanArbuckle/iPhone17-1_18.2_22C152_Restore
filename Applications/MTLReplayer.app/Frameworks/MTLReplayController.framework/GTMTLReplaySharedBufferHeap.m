@interface GTMTLReplaySharedBufferHeap
- (GTMTLReplaySharedBufferHeap)initWithBuffer:(id)a3 resourcePool:(id)a4;
- (id)buffer;
- (void)dealloc;
@end

@implementation GTMTLReplaySharedBufferHeap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePool, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)dealloc
{
  [(GTMTLReplaySharedResourcePool *)self->_resourcePool reclaimBuffer:self->_buffer];
  v3.receiver = self;
  v3.super_class = (Class)GTMTLReplaySharedBufferHeap;
  [(GTMTLReplaySharedBufferHeap *)&v3 dealloc];
}

- (id)buffer
{
  return self->_buffer;
}

- (GTMTLReplaySharedBufferHeap)initWithBuffer:(id)a3 resourcePool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTMTLReplaySharedBufferHeap;
  v9 = [(GTMTLReplaySharedBufferHeap *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_buffer, a3);
    objc_storeStrong((id *)&v10->_resourcePool, a4);
  }

  return v10;
}

@end