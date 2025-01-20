@interface ASDRingBufferInputStream
- (ASDManagedRingBuffer)ringBuffer;
- (ASDRingBufferInputStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (ASDRingBufferInputStream)initWithRingBuffer:(id)a3 withPlugin:(id)a4;
- (id).cxx_construct;
- (id)readInputBlock;
- (void)setPhysicalFormat:(id)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation ASDRingBufferInputStream

- (ASDRingBufferInputStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x263EFF940] exceptionWithName:@"UnavailableMethod" reason:@"Method is unavailable" userInfo:0];
  objc_exception_throw(v5);
}

- (ASDRingBufferInputStream)initWithRingBuffer:(id)a3 withPlugin:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDRingBufferInputStream;
  v8 = [(ASDStream *)&v11 initWithDirection:1768845428 withPlugin:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_ringBuffer, a3);
  }

  return v9;
}

- (void)startStream
{
  v6.receiver = self;
  v6.super_class = (Class)ASDRingBufferInputStream;
  [(ASDStream *)&v6 startStream];
  if (!self->_bufferList.__ptr_.__value_)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"ASDRingBufferStream.mm" lineNumber:155 description:@"Format must be set before starting stream"];
  }
  id v4 = [(ASDRingBufferInputStream *)self ringBuffer];
  [v4 startReader];
}

- (void)stopStream
{
  v4.receiver = self;
  v4.super_class = (Class)ASDRingBufferInputStream;
  [(ASDStream *)&v4 stopStream];
  v3 = [(ASDRingBufferInputStream *)self ringBuffer];
  [v3 stopReader];
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDRingBufferInputStream;
  [(ASDStream *)&v5 setPhysicalFormat:v4];
  if (v4) {
    [v4 audioStreamBasicDescription];
  }
  operator new();
}

- (id)readInputBlock
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6;
  v7[4] = __Block_byref_object_dispose__6;
  id v8 = [(ASDRingBuffer *)self->_ringBuffer readWithZerosBlock];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = &self->_bufferList;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ASDRingBufferInputStream_readInputBlock__block_invoke;
  v5[3] = &unk_2647735D8;
  v5[4] = v6;
  v5[5] = v7;
  v3 = (void *)MEMORY[0x22A63F100](v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);

  return v3;
}

uint64_t __42__ASDRingBufferInputStream_readInputBlock__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  ASDBufferList::setBufferListFromData(**(ASDBufferList ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a4, a2);
  int v5 = (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  int v6 = v5;
  if ((v5 + 2) < 5) {
    return 0;
  }
  if ((v5 - 3) >= 2)
  {
    if (CALog_DefaultScope)
    {
      id v8 = *(id *)CALog_DefaultScope;
    }
    else
    {
      id v8 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315650;
    v15 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
    __int16 v16 = 1024;
    int v17 = 213;
    __int16 v18 = 2080;
    v19 = "-[ASDRingBufferInputStream readInputBlock]_block_invoke";
    v10 = "%s:%d:%s: Unknown audio ring buffer error";
    objc_super v11 = v8;
    uint32_t v12 = 28;
  }
  else
  {
    if (CALog_DefaultScope)
    {
      id v8 = *(id *)CALog_DefaultScope;
    }
    else
    {
      id v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315906;
    v15 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
    __int16 v16 = 1024;
    int v17 = 208;
    __int16 v18 = 2080;
    v19 = "-[ASDRingBufferInputStream readInputBlock]_block_invoke";
    __int16 v20 = 1024;
    int v21 = v6;
    v10 = "%s:%d:%s: Audio ring buffer error %d";
    objc_super v11 = v8;
    uint32_t v12 = 34;
  }
  _os_log_impl(&dword_225CD5000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_15:

  return 2003329396;
}

- (ASDManagedRingBuffer)ringBuffer
{
  return self->_ringBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringBuffer, 0);
  value = self->_bufferList.__ptr_.__value_;
  self->_bufferList.__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<ASDBufferList>::operator()[abi:ne180100]((uint64_t)&self->_bufferList, (uint64_t)value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 35) = 0;
  return self;
}

@end