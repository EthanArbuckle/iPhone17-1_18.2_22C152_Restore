@interface _EARLanguageDetectorAudioBuffer
- (id).cxx_construct;
- (id)_initWithAudioBuffer:(const void *)a3;
- (void)addAudioSampleData:(id)a3;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)endAudio;
@end

@implementation _EARLanguageDetectorAudioBuffer

- (id)_initWithAudioBuffer:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_EARLanguageDetectorAudioBuffer;
  v4 = [(_EARLanguageDetectorAudioBuffer *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(RecogAudioBuffer **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_buffer.__cntrl_;
    v5->_buffer.__ptr_ = v7;
    v5->_buffer.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (void)addAudioSampleData:(id)a3
{
  id v4 = a3;
  (*(void (**)(RecogAudioBuffer *, uint64_t, unint64_t))(*(void *)self->_buffer.__ptr_ + 16))(self->_buffer.__ptr_, [v4 bytes], (unint64_t)objc_msgSend(v4, "length") >> 1);
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  (*(void (**)(RecogAudioBuffer *, const signed __int16 *, unint64_t))(*(void *)self->_buffer.__ptr_
                                                                                       + 16))(self->_buffer.__ptr_, a3, a4);
}

- (void)endAudio
{
}

- (void).cxx_destruct
{
  cntrl = self->_buffer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end