@interface SNProcessingContext
- (SNProcessingContext)initWithGraph:(id)a3 sharedProcessingGraph:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (shared_ptr<SoundAnalysis::ProcessingContext>)processingContext;
@end

@implementation SNProcessingContext

- (shared_ptr<SoundAnalysis::ProcessingContext>)processingContext
{
  cntrl = self->_processingContext.__cntrl_;
  *v2 = self->_processingContext.__ptr_;
  v2[1] = (ProcessingContext *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ProcessingContext *)self;
  return result;
}

- (SNProcessingContext)initWithGraph:(id)a3 sharedProcessingGraph:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SNProcessingContext;
  v10 = [(SNProcessingContext *)&v27 init];
  if (v10)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x4012000000;
    v22 = sub_1DCB440C0;
    v23 = sub_1DCB440D0;
    v24 = &unk_1DCC4FB25;
    uint64_t v25 = 0;
    v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1DCB440E0;
    v15[3] = &unk_1E6CA77C0;
    v18 = &v19;
    id v16 = v8;
    id v17 = v9;
    if (sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v15, (uint64_t)a5))
    {
      v12 = (ProcessingContext *)v20[6];
      uint64_t v11 = v20[7];
      if (v11) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
      }
      cntrl = (std::__shared_weak_count *)v10->_processingContext.__cntrl_;
      v10->_processingContext.__ptr_ = v12;
      v10->_processingContext.__cntrl_ = (__shared_weak_count *)v11;
      if (cntrl) {
        sub_1DCB44254(cntrl);
      }
    }
    else
    {

      v10 = 0;
    }

    _Block_object_dispose(&v19, 8);
    if (v26) {
      sub_1DCB44254(v26);
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  cntrl = self->_processingContext.__cntrl_;
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