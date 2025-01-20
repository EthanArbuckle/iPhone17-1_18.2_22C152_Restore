@interface ASDRingBufferOutputStream
- (ASDManagedRingBuffer)ringBuffer;
- (ASDRingBufferOutputStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (ASDRingBufferOutputStream)initWithRingBuffer:(id)a3 withPlugin:(id)a4;
- (id).cxx_construct;
- (id)writeMixBlock;
- (void)setPhysicalFormat:(id)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation ASDRingBufferOutputStream

- (ASDRingBufferOutputStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x263EFF940] exceptionWithName:@"UnavailableMethod" reason:@"Method is unavailable" userInfo:0];
  objc_exception_throw(v5);
}

- (ASDRingBufferOutputStream)initWithRingBuffer:(id)a3 withPlugin:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDRingBufferOutputStream;
  v8 = [(ASDStream *)&v11 initWithDirection:1869968496 withPlugin:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_ringBuffer, a3);
  }

  return v9;
}

- (void)startStream
{
  if (!self->_bufferList.__ptr_.__value_)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"ASDRingBufferStream.mm" lineNumber:47 description:@"Format must be set before starting stream"];
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDRingBufferOutputStream;
  [(ASDStream *)&v6 startStream];
  v3 = [(ASDRingBufferOutputStream *)self ringBuffer];
  [v3 startWriter];
}

- (void)stopStream
{
  v4.receiver = self;
  v4.super_class = (Class)ASDRingBufferOutputStream;
  [(ASDStream *)&v4 stopStream];
  v3 = [(ASDRingBufferOutputStream *)self ringBuffer];
  [v3 stopWriter];
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDRingBufferOutputStream;
  [(ASDStream *)&v5 setPhysicalFormat:v4];
  if (v4) {
    [v4 audioStreamBasicDescription];
  }
  operator new();
}

- (id)writeMixBlock
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6;
  v7[4] = __Block_byref_object_dispose__6;
  id v8 = [(ASDRingBuffer *)self->_ringBuffer writeBlock];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = &self->_bufferList;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ASDRingBufferOutputStream_writeMixBlock__block_invoke;
  v5[3] = &unk_2647735D8;
  v5[4] = v6;
  v5[5] = v7;
  v3 = (void *)MEMORY[0x22A63F100](v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);

  return v3;
}

uint64_t __42__ASDRingBufferOutputStream_writeMixBlock__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = 2003329396;
  objc_super v6 = **(ASDBufferList ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v6)
  {
    ASDBufferList::setBufferListFromData(v6, a4, a2);
    int v7 = (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
    if ((v7 + 2) > 6)
    {
      if (CALog_DefaultScope)
      {
        v9 = *(id *)CALog_DefaultScope;
      }
      else
      {
        v9 = &_os_log_internal;
        id v11 = &_os_log_internal;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315650;
        v14 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        __int16 v15 = 1024;
        int v16 = 104;
        __int16 v17 = 2080;
        v18 = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
        _os_log_impl(&dword_225CD5000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s: Unknown audio ring buffer error", (uint8_t *)&v13, 0x1Cu);
      }
      goto LABEL_17;
    }
    int v8 = 1 << (v7 + 2);
    if ((v8 & 0x1B) == 0)
    {
      if ((v8 & 0x60) != 0)
      {
        if (CALog_DefaultScope)
        {
          v9 = *(id *)CALog_DefaultScope;
        }
        else
        {
          v9 = &_os_log_internal;
          id v10 = &_os_log_internal;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136315906;
          v14 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
          __int16 v15 = 1024;
          int v16 = 100;
          __int16 v17 = 2080;
          v18 = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
          __int16 v19 = 1024;
          int v20 = v7;
          _os_log_impl(&dword_225CD5000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s: Audio ring buffer error %d", (uint8_t *)&v13, 0x22u);
        }
LABEL_17:

        return v5;
      }
      return 0;
    }
  }
  return v5;
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