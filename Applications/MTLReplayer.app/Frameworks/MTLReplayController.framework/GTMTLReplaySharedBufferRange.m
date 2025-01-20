@interface GTMTLReplaySharedBufferRange
- (GTMTLReplaySharedBufferRange)initWithBuffer:(id)a3;
- (GTMTLReplaySharedBufferRange)initWithHeap:(id)a3 range:(_NSRange)a4;
- (id)data;
- (id)heapBuffer;
- (unint64_t)heapLocation;
- (unint64_t)length;
- (void)contents;
@end

@implementation GTMTLReplaySharedBufferRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heapBuffer, 0);

  objc_storeStrong((id *)&self->_heap, 0);
}

- (id)data
{
  v3 = self->_heap;
  v4 = self->_heapBuffer;
  id v5 = objc_alloc((Class)NSData);
  v6 = v4;
  v7 = (char *)[(MTLBuffer *)v6 contents];
  NSUInteger location = self->_heapRange.location;
  NSUInteger length = self->_heapRange.length;
  v10 = &v7[location];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __36__GTMTLReplaySharedBufferRange_data__block_invoke;
  v15[3] = &unk_7461E8;
  v16 = v6;
  v17 = v3;
  v11 = v3;
  v12 = v6;
  id v13 = [v5 initWithBytesNoCopy:v10 length:length deallocator:v15];

  return v13;
}

id __36__GTMTLReplaySharedBufferRange_data__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) buffer];
}

- (unint64_t)length
{
  return self->_heapRange.length;
}

- (void)contents
{
  return (char *)[(MTLBuffer *)self->_heapBuffer contents] + self->_heapRange.location;
}

- (unint64_t)heapLocation
{
  return self->_heapRange.location;
}

- (id)heapBuffer
{
  return self->_heapBuffer;
}

- (GTMTLReplaySharedBufferRange)initWithHeap:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTMTLReplaySharedBufferRange;
  v9 = [(GTMTLReplaySharedBufferRange *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heap, a3);
    uint64_t v11 = [v8 buffer];
    heapBuffer = v10->_heapBuffer;
    v10->_heapBuffer = (MTLBuffer *)v11;

    v10->_heapRange.NSUInteger location = location;
    v10->_heapRange.NSUInteger length = length;
  }

  return v10;
}

- (GTMTLReplaySharedBufferRange)initWithBuffer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTMTLReplaySharedBufferRange;
  v6 = [(GTMTLReplaySharedBufferRange *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_heapBuffer, a3);
    id v8 = [v5 length];
    v7->_heapRange.NSUInteger location = 0;
    v7->_heapRange.NSUInteger length = (NSUInteger)v8;
  }

  return v7;
}

@end