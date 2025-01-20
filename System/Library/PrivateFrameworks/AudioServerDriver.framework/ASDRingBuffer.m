@interface ASDRingBuffer
- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3;
- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5;
- (ASDStreamFormat)readFormat;
- (ASDStreamFormat)writeFormat;
- (BOOL)isAllocated;
- (id).cxx_construct;
- (id)readBlock;
- (id)readWithZerosBlock;
- (id)writeBlock;
- (int64_t)frameCapacity;
- (void)allocate;
- (void)clear;
- (void)deallocate;
- (void)setAllocated:(BOOL)a3;
- (void)setFrameCapacity:(int64_t)a3;
- (void)setReadFormat:(id)a3;
- (void)setWriteFormat:(id)a3;
@end

@implementation ASDRingBuffer

- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3
{
  return [(ASDRingBuffer *)self initWithFrameCapacity:a3 writeFormat:0 readFormat:0];
}

- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)ASDRingBuffer;
  if ([(ASDRingBuffer *)&v10 init]) {
    operator new();
  }

  return 0;
}

- (void)allocate
{
  value = self->_ringBuffer.__ptr_.__value_;
  v4 = [(ASDRingBuffer *)self readFormat];
  v5 = v4;
  if (v4) {
    [v4 audioStreamBasicDescription];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inSourceFormat, &v9);
  AudioRingBuffer::Allocate(value, (const CAStreamBasicDescription *)&inSourceFormat, [(ASDRingBuffer *)self frameCapacity]);

  v6 = self->_ringBuffer.__ptr_.__value_;
  id v7 = [(ASDRingBuffer *)self writeFormat];
  id v8 = v7;
  if (v7) {
    [v7 audioStreamBasicDescription];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inSourceFormat, &v9);
  AudioRingBuffer::SetInputFormat(v6, &inSourceFormat);

  [(ASDRingBuffer *)self setAllocated:1];
}

- (void)deallocate
{
  AudioRingBuffer::Deallocate(self->_ringBuffer.__ptr_.__value_);
  [(ASDRingBuffer *)self setAllocated:0];
}

- (void)clear
{
}

- (id)writeBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__ASDRingBuffer_writeBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e55_i28__0r__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20l;
  v4[4] = &self->_ringBuffer;
  v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  return v2;
}

uint64_t __27__ASDRingBuffer_writeBlock__block_invoke(uint64_t a1, const AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  v4 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v4) {
    __27__ASDRingBuffer_writeBlock__block_invoke_cold_1();
  }
  v5 = *v4;
  if (!*v4) {
    __27__ASDRingBuffer_writeBlock__block_invoke_cold_2();
  }
  return AudioRingBuffer::Store(v5, a2, a3, a4);
}

- (id)readBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__ASDRingBuffer_readBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e54_i28__0__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20l;
  v4[4] = &self->_ringBuffer;
  v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  return v2;
}

uint64_t __26__ASDRingBuffer_readBlock__block_invoke(uint64_t a1, AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  v4 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v4) {
    __26__ASDRingBuffer_readBlock__block_invoke_cold_1();
  }
  v5 = *v4;
  if (!*v4) {
    __26__ASDRingBuffer_readBlock__block_invoke_cold_2();
  }
  return AudioRingBuffer::Fetch(v5, a2, a3, a4);
}

- (id)readWithZerosBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__ASDRingBuffer_readWithZerosBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e66_i52__0__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20_I28_I36_I44l;
  v4[4] = &self->_ringBuffer;
  v2 = (void *)MEMORY[0x22A63F100](v4, a2);
  return v2;
}

uint64_t __35__ASDRingBuffer_readWithZerosBlock__block_invoke(uint64_t a1, AudioBufferList *a2, signed int a3, uint64_t a4, unsigned int *a5, unsigned int *a6, unsigned int *a7)
{
  id v7 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v7) {
    __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_1();
  }
  id v8 = *v7;
  if (!*v7) {
    __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_2();
  }
  return AudioRingBuffer::FetchAllWithZeroes(v8, a2, a3, a4, a5, a6, a7);
}

- (void)setWriteFormat:(id)a3
{
  objc_storeStrong((id *)&self->_writeFormat, a3);
  if ([(ASDRingBuffer *)self isAllocated])
  {
    [(ASDRingBuffer *)self allocate];
  }
}

- (void)setReadFormat:(id)a3
{
  objc_storeStrong((id *)&self->_readFormat, a3);
  if ([(ASDRingBuffer *)self isAllocated])
  {
    [(ASDRingBuffer *)self allocate];
  }
}

- (int64_t)frameCapacity
{
  return self->_frameCapacity;
}

- (void)setFrameCapacity:(int64_t)a3
{
  self->_frameCapacity = a3;
}

- (ASDStreamFormat)writeFormat
{
  return self->_writeFormat;
}

- (ASDStreamFormat)readFormat
{
  return self->_readFormat;
}

- (BOOL)isAllocated
{
  return self->_allocated;
}

- (void)setAllocated:(BOOL)a3
{
  self->_allocated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readFormat, 0);
  objc_storeStrong((id *)&self->_writeFormat, 0);
  value = self->_ringBuffer.__ptr_.__value_;
  self->_ringBuffer.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

void __27__ASDRingBuffer_writeBlock__block_invoke_cold_1()
{
}

void __27__ASDRingBuffer_writeBlock__block_invoke_cold_2()
{
}

void __26__ASDRingBuffer_readBlock__block_invoke_cold_1()
{
}

void __26__ASDRingBuffer_readBlock__block_invoke_cold_2()
{
}

void __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_1()
{
}

void __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_2()
{
}

@end