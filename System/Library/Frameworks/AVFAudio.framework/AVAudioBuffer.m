@interface AVAudioBuffer
- (AVAudioBuffer)initWithFormat:(id)a3 byteCapacity:(unsigned int)a4;
- (AVAudioBuffer)initWithPCMFormat:(id)a3 byteCapacity:(unsigned int)a4 bufferListNoCopy:(const AudioBufferList *)a5 deallocator:(id)a6;
- (AVAudioFormat)format;
- (AudioBufferList)mutableAudioBufferList;
- (const)audioBufferList;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unsigned)byteCapacity;
- (unsigned)byteLength;
- (void)dealloc;
- (void)setByteLength:(unsigned int)a3;
@end

@implementation AVAudioBuffer

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[AVAudioBuffer allocWithZone:a3] initWithFormat:*(void *)self->_impl byteCapacity:*((unsigned int *)self->_impl + 10)];
  impl = v4->_impl;
  v6 = self->_impl;
  if (*((unsigned char *)v6 + 56)) {
    v7 = (_DWORD *)(v6[6] + 48);
  }
  else {
    v7 = (_DWORD *)v6[12];
  }
  if (*((unsigned char *)impl + 56)) {
    uint64_t v8 = impl[6] + 48;
  }
  else {
    uint64_t v8 = impl[12];
  }
  if (*v7)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      *(_DWORD *)(v8 + v9 * 4 + 12) = v7[v9 + 3];
      memcpy(*(void **)(v8 + v9 * 4 + 16), *(const void **)&v7[v9 + 4], v7[v9 + 3]);
      ++v10;
      v9 += 4;
    }
    while (v10 < *v7);
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@@%p: %d/%d bytes>", NSStringFromClass(v4), self, -[AVAudioBuffer byteLength](self, "byteLength"), -[AVAudioBuffer byteCapacity](self, "byteCapacity")];
}

- (AudioBufferList)mutableAudioBufferList
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 88))
  {
    if (*((unsigned char *)impl + 56)) {
      v4 = (unsigned int *)(*((void *)impl + 6) + 48);
    }
    else {
      v4 = (unsigned int *)*((void *)impl + 12);
    }
    unint64_t v6 = (16 * *v4) | 8;
    unint64_t v8 = *((void *)impl + 8);
    v7 = (unsigned char *)*((void *)impl + 9);
    if (v6 <= (unint64_t)&v7[-v8])
    {
      if (v6 < (unint64_t)&v7[-v8])
      {
        v7 = (unsigned char *)(v8 + v6);
        *((void *)impl + 9) = v8 + v6;
      }
    }
    else
    {
      uint64_t v9 = *((void *)impl + 10);
      if (v9 - (uint64_t)v7 >= v6 - (unint64_t)&v7[-v8])
      {
        v14 = (char *)(v6 + v8);
        bzero(*((void **)impl + 9), v6 - (void)&v7[-v8]);
        *((void *)impl + 9) = v6 + v8;
      }
      else
      {
        unint64_t v10 = v9 - v8;
        uint64_t v11 = 2 * v10;
        if (2 * v10 <= v6) {
          uint64_t v11 = (16 * *v4) | 8;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v12 = v11;
        }
        v13 = operator new(v12);
        v18 = &v13[v12];
        v14 = &v13[v6];
        bzero(&v7[(void)v13 - v8], v6 - (void)&v7[-v8]);
        if (v7 == (unsigned char *)v8)
        {
          v13 = &v7[(void)v13 - v8];
        }
        else
        {
          v15 = &v7[~v8];
          do
          {
            char v16 = *--v7;
            (v15--)[(void)v13] = v16;
          }
          while (v7 != (unsigned char *)v8);
          v7 = (unsigned char *)*((void *)impl + 8);
        }
        *((void *)impl + 8) = v13;
        *((void *)impl + 9) = v14;
        *((void *)impl + 10) = v18;
        if (v7)
        {
          operator delete(v7);
          v14 = (char *)*((void *)impl + 9);
        }
      }
      unint64_t v8 = *((void *)impl + 8);
      v7 = v14;
    }
    memcpy((void *)v8, v4, (size_t)&v7[-v8]);
  }
  else
  {
    if (*((unsigned char *)impl + 56)) {
      v5 = (unsigned int *)(*((void *)impl + 6) + 48);
    }
    else {
      v5 = (unsigned int *)*((void *)impl + 12);
    }
    std::vector<char>::vector(&v19, (16 * *v5) | 8);
    memcpy(v19.__begin_, v5, v19.__end_ - v19.__begin_);
    std::optional<CA::BufferList>::operator=[abi:ne180100]<CA::BufferList,void>((uint64_t)self->_impl + 64, (uint64_t)&v19);
    if (v19.__begin_)
    {
      v19.__end_ = v19.__begin_;
      operator delete(v19.__begin_);
    }
  }
  return (AudioBufferList *)*((void *)self->_impl + 8);
}

- (const)audioBufferList
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 56)) {
    return (const AudioBufferList *)(*((void *)impl + 6) + 48);
  }
  else {
    return (const AudioBufferList *)*((void *)impl + 12);
  }
}

- (void)setByteLength:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl[10] < a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      v15 = "AVAudioBuffer.mm";
      __int16 v16 = 1024;
      int v17 = 178;
      __int16 v18 = 2080;
      std::vector<char> v19 = "-[AVAudioBuffer setByteLength:]";
      __int16 v20 = 2080;
      v21 = "length <= _imp->_byteCapacity";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "length <= _imp->_byteCapacity");
    impl = self->_impl;
  }
  if (*((unsigned char *)impl + 56)) {
    v7 = (unsigned int *)(*((void *)impl + 6) + 48);
  }
  else {
    v7 = (unsigned int *)*((void *)impl + 12);
  }
  uint64_t v8 = *v7;
  if (v8)
  {
    uint64_t v9 = v7 + 3;
    do
    {
      *uint64_t v9 = a3;
      v9 += 4;
      --v8;
    }
    while (v8);
  }
}

- (unsigned)byteLength
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 56)) {
    uint64_t v3 = impl[6] + 48;
  }
  else {
    uint64_t v3 = impl[12];
  }
  return *(_DWORD *)(v3 + 12);
}

- (unsigned)byteCapacity
{
  return *((_DWORD *)self->_impl + 10);
}

- (AVAudioFormat)format
{
  return *(AVAudioFormat **)self->_impl;
}

- (void)dealloc
{
  impl = (id *)self->_impl;
  if (impl)
  {

    v4 = self->_impl;
    if (v4[56])
    {
      ExtendedAudioBufferList_Destroy();
      v4[56] = 0;
    }
    else if (self->_deallocator)
    {
      uint64_t v8 = (unsigned int *)*((void *)v4 + 12);
      std::vector<char>::vector(&v14, (16 * *v8) | 8);
      memcpy(v14.__begin_, v8, v14.__end_ - v14.__begin_);
      (*((void (**)(void))self->_deallocator + 2))();
      _Block_release(self->_deallocator);
      uint64_t v9 = self->_impl;
      if (*((unsigned char *)v9 + 120))
      {
        unint64_t v10 = (void *)v9[12];
        if (v10)
        {
          v9[13] = v10;
          operator delete(v10);
        }
        *((unsigned char *)v9 + 120) = 0;
      }
      if (v14.__begin_)
      {
        v14.__end_ = v14.__begin_;
        operator delete(v14.__begin_);
      }
    }
    free(*((void **)self->_impl + 1));
    v5 = self->_impl;
    if (*((unsigned char *)v5 + 88))
    {
      unint64_t v6 = (void *)v5[8];
      if (v6)
      {
        v5[9] = v6;
        operator delete(v6);
        v7 = self->_impl;
        *((unsigned char *)v5 + 88) = 0;
        v5 = v7;
        if (!v7) {
          goto LABEL_25;
        }
      }
      else
      {
        *((unsigned char *)v5 + 88) = 0;
      }
    }
    if (*((unsigned char *)v5 + 120))
    {
      uint64_t v11 = (void *)v5[12];
      if (v11)
      {
        v5[13] = v11;
        operator delete(v11);
      }
    }
    if (*((unsigned char *)v5 + 88))
    {
      __int16 v12 = (void *)v5[8];
      if (v12)
      {
        v5[9] = v12;
        operator delete(v12);
      }
    }
    if (*((unsigned char *)v5 + 56)) {
      ExtendedAudioBufferList_Destroy();
    }
    MEMORY[0x19F3ABB30](v5, 0x10B2C40CBA57F67);
  }
LABEL_25:
  v13.receiver = self;
  v13.super_class = (Class)AVAudioBuffer;
  [(AVAudioBuffer *)&v13 dealloc];
}

- (AVAudioBuffer)initWithPCMFormat:(id)a3 byteCapacity:(unsigned int)a4 bufferListNoCopy:(const AudioBufferList *)a5 deallocator:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AVAudioBuffer;
  if ([(AVAudioBuffer *)&v18 init])
  {
    uint64_t v8 = [a3 streamDescription];
    long long v9 = *(_OWORD *)(v8 + 16);
    long long v15 = *(_OWORD *)v8;
    long long v16 = v9;
    uint64_t v17 = *(void *)(v8 + 32);
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      unint64_t v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136316418;
        *(void *)&buf[1] = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        v23 = "AVAudioBuffer.mm";
        __int16 v24 = 1024;
        int v25 = 136;
        __int16 v26 = 2080;
        v27 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        __int16 v28 = 2080;
        v29 = "isPCMFormat(fmt)";
        _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "isPCMFormat(fmt)");
    }
    if ((BYTE12(v15) & 0x20) != 0) {
      int v11 = HIDWORD(v16);
    }
    else {
      int v11 = 1;
    }
    if (!a5)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      __int16 v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136316418;
        *(void *)&buf[1] = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        v23 = "AVAudioBuffer.mm";
        __int16 v24 = 1024;
        int v25 = 138;
        __int16 v26 = 2080;
        v27 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        __int16 v28 = 2080;
        v29 = "bufferList != nullptr";
        _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "bufferList != nullptr");
    }
    if (a5->mNumberBuffers != v11)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      objc_super v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136316418;
        *(void *)&buf[1] = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        v23 = "AVAudioBuffer.mm";
        __int16 v24 = 1024;
        int v25 = 139;
        __int16 v26 = 2080;
        v27 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        __int16 v28 = 2080;
        v29 = "bufferList->mNumberBuffers == numBuffers";
        _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "bufferList->mNumberBuffers == numBuffers");
    }
    operator new();
  }
  return 0;
}

- (AVAudioBuffer)initWithFormat:(id)a3 byteCapacity:(unsigned int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVAudioBuffer;
  if ([(AVAudioBuffer *)&v6 init])
  {
    [a3 streamDescription];
    operator new();
  }
  return 0;
}

@end