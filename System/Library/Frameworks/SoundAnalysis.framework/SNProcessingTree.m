@interface SNProcessingTree
- (BOOL)processBuffer:(id)a3 framePosition:(int64_t)a4 error:(id *)a5;
- (BOOL)setFormat:(SNFormatAndBlockSize *)a3 error:(id *)a4;
- (BOOL)setProcessingContexts:(id)a3 error:(id *)a4;
- (BOOL)writeDSPGraphDotFilesToDirectory:(id)a3 error:(id *)a4;
- (SNProcessingTree)initWithError:(id *)a3;
- (id).cxx_construct;
- (id)clientSampleRateWithError:(id *)a3;
- (id)clientSampleTimeFromSampleTime:(int64_t)a3 fromBox:(id)a4 error:(id *)a5;
- (id)maxFramesPerSliceWithError:(id *)a3;
- (shared_ptr<SoundAnalysis::ProcessingTree>)processingTree;
@end

@implementation SNProcessingTree

- (SNProcessingTree)initWithError:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SNProcessingTree;
  v4 = [(SNProcessingTree *)&v18 init];
  if (v4)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x4012000000;
    v13 = sub_1DCB7130C;
    v14 = sub_1DCB7131C;
    v15 = &unk_1DCC4FB25;
    uint64_t v16 = 0;
    v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1DCB7132C;
    v9[3] = &unk_1E6CA81F0;
    v9[4] = &v10;
    if (sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)a3))
    {
      v6 = (ProcessingTree *)v11[6];
      uint64_t v5 = v11[7];
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      cntrl = (std::__shared_weak_count *)v4->_processingTree.__cntrl_;
      v4->_processingTree.__ptr_ = v6;
      v4->_processingTree.__cntrl_ = (__shared_weak_count *)v5;
      if (cntrl) {
        sub_1DCB44254(cntrl);
      }
    }
    else
    {

      v4 = 0;
    }
    _Block_object_dispose(&v10, 8);
    if (v17) {
      sub_1DCB44254(v17);
    }
  }
  return v4;
}

- (shared_ptr<SoundAnalysis::ProcessingTree>)processingTree
{
  cntrl = self->_processingTree.__cntrl_;
  *v2 = self->_processingTree.__ptr_;
  v2[1] = (ProcessingTree *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ProcessingTree *)self;
  return result;
}

- (BOOL)processBuffer:(id)a3 framePosition:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DCB71498;
  v11[3] = &unk_1E6CA8218;
  v13 = self;
  int64_t v14 = a4;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a5) = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);

  return (char)a5;
}

- (id)maxFramesPerSliceWithError:(id *)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DCB715A0;
  v5[3] = &unk_1E6CA7B78;
  v5[4] = self;
  v3 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v5, (uint64_t)a3);

  return v3;
}

- (BOOL)writeDSPGraphDotFilesToDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DCB71688;
  v9[3] = &unk_1E6CA7CE0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)setProcessingContexts:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DCB717D0;
  v9[3] = &unk_1E6CA7CE0;
  id v10 = v6;
  v11 = self;
  id v7 = v6;
  LOBYTE(a4) = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)setFormat:(SNFormatAndBlockSize *)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  long long v4 = *(_OWORD *)&a3->var0.mBytesPerPacket;
  long long v7 = *(_OWORD *)&a3->var0.mSampleRate;
  long long v8 = v4;
  v6[2] = sub_1DCB71A74;
  v6[3] = &unk_1E6CA8240;
  long long v9 = *(_OWORD *)&a3->var0.mBitsPerChannel;
  v6[4] = self;
  return sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v6, (uint64_t)a4);
}

- (id)clientSampleTimeFromSampleTime:(int64_t)a3 fromBox:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DCB71BAC;
  v12[3] = &unk_1E6CA8268;
  id v13 = v8;
  int64_t v14 = a3;
  v12[4] = self;
  id v9 = v8;
  id v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a5);

  return v10;
}

- (id)clientSampleRateWithError:(id *)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DCB71C9C;
  v5[3] = &unk_1E6CA7B78;
  v5[4] = self;
  v3 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v5, (uint64_t)a3);

  return v3;
}

- (void).cxx_destruct
{
  cntrl = self->_processingTree.__cntrl_;
  if (cntrl) {
    sub_1DCB44254((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end