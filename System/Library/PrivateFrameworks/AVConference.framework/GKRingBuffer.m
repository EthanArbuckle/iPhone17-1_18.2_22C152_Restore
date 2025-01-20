@interface GKRingBuffer
- (BOOL)store:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5;
- (GKRingBuffer)init;
- (GKRingBuffer)initWithCapacity:(unsigned int)a3 bytesPerFrame:(unsigned int)a4;
- (int)fetch:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5;
- (int)needsNewNumSamples:(unsigned int)a3 timestamp:(unsigned int)a4;
- (void)dealloc;
- (void)increaseCapacity:(unsigned int)a3;
@end

@implementation GKRingBuffer

- (GKRingBuffer)initWithCapacity:(unsigned int)a3 bytesPerFrame:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)GKRingBuffer;
  v6 = [(GKRingBuffer *)&v8 init];
  v6->endTime = 0;
  v6->capacity = a3;
  v6->bytesPerFrame = a4;
  operator new();
}

- (GKRingBuffer)init
{
  return [(GKRingBuffer *)self initWithCapacity:2048 bytesPerFrame:2];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CARingBuffer::Deallocate((CARingBuffer *)self->ringBufRef);
  ringBufRef = self->ringBufRef;
  if (ringBufRef)
  {
    CARingBuffer::~CARingBuffer((CARingBuffer *)self->ringBufRef);
    MEMORY[0x1E4E57980](ringBufRef, 0x1080C400355024FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKRingBuffer;
  [(GKRingBuffer *)&v4 dealloc];
}

- (void)increaseCapacity:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int capacity = self->capacity;
  UInt32 bytesPerFrame = self->bytesPerFrame;
  size_t v7 = bytesPerFrame * capacity;
  uint64_t v8 = (v7 + 15) & 0x1FFFFFFF0;
  uint64_t v9 = (char *)&v14 - v8;
  if (v7) {
    memset((char *)&v14 - v8, 170, v7);
  }
  *(void *)&v14.mNumberBuffers = 0xAAAAAAAA00000001;
  v14.mBuffers[0].mNumberChannels = 1;
  v14.mBuffers[0].mDataByteSize = bytesPerFrame;
  v14.mBuffers[0].mData = v9;
  unsigned int endTime = self->endTime;
  BOOL v11 = endTime >= capacity;
  unsigned int v12 = endTime - capacity;
  if (v11) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  CARingBuffer::Fetch((CARingBuffer *)self->ringBufRef, &v14, capacity, v13);
  CARingBuffer::Deallocate((CARingBuffer *)self->ringBufRef);
  CARingBuffer::Allocate((CARingBuffer *)self->ringBufRef, 1, self->bytesPerFrame, a3);
  CARingBuffer::Store((CARingBuffer *)self->ringBufRef, &v14, self->capacity, v13);
  self->unsigned int capacity = a3;
}

- (BOOL)store:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (2 * a4 > self->capacity) {
    -[GKRingBuffer increaseCapacity:](self, "increaseCapacity:");
  }
  *(void *)&v12.mNumberBuffers = 0xAAAAAAAA00000001;
  UInt32 bytesPerFrame = self->bytesPerFrame;
  v12.mBuffers[0].mNumberChannels = 1;
  v12.mBuffers[0].mDataByteSize = bytesPerFrame;
  v12.mBuffers[0].mData = a3;
  int v10 = CARingBuffer::Store((CARingBuffer *)self->ringBufRef, &v12, a4, a5);
  if (!v10) {
    self->unsigned int endTime = a5 + a4;
  }
  return v10 == 0;
}

- (int)needsNewNumSamples:(unsigned int)a3 timestamp:(unsigned int)a4
{
  unsigned int endTime = self->endTime;
  if (a4 + a3 >= endTime) {
    return a4 + a3 - endTime;
  }
  else {
    return 0;
  }
}

- (int)fetch:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (2 * a4 > self->capacity) {
    -[GKRingBuffer increaseCapacity:](self, "increaseCapacity:");
  }
  unsigned int endTime = self->endTime;
  int result = a5 + a4 - endTime;
  if (a5 + a4 <= endTime)
  {
    *(void *)&v12.mNumberBuffers = 0xAAAAAAAA00000001;
    UInt32 bytesPerFrame = self->bytesPerFrame;
    v12.mBuffers[0].mNumberChannels = 1;
    v12.mBuffers[0].mDataByteSize = bytesPerFrame;
    v12.mBuffers[0].mData = a3;
    if (CARingBuffer::Fetch((CARingBuffer *)self->ringBufRef, &v12, a4, a5)) {
      return -1;
    }
    else {
      return 0;
    }
  }
  return result;
}

@end