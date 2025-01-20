@interface SNTunableDSPGraphHost
- (SNTunableDSPGraphHost)initWithGraph:(id)a3 error:(id *)a4;
- (id).cxx_construct;
@end

@implementation SNTunableDSPGraphHost

- (SNTunableDSPGraphHost)initWithGraph:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SNTunableDSPGraphHost;
  v7 = [(SNTunableDSPGraphHost *)&v22 init];
  if (v7)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3812000000;
    v18 = sub_1DCB44E00;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    v19 = sub_1DCB44E10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1DCB44E48;
    v12[3] = &unk_1E6CA77E8;
    v14 = &v15;
    id v13 = v6;
    if (sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a4))
    {
      v8 = (AUProcessingBlock_DSPGraph *)v16[6];
      v16[6] = 0;
      value = v7->_tuningHost.__ptr_.__value_;
      v7->_tuningHost.__ptr_.__value_ = v8;
      if (value) {
        (*(void (**)(AUProcessingBlock_DSPGraph *))(*(void *)value + 8))(value);
      }
    }
    else
    {

      v7 = 0;
    }

    _Block_object_dispose(&v15, 8);
    uint64_t v10 = v21;
    uint64_t v21 = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  value = self->_tuningHost.__ptr_.__value_;
  self->_tuningHost.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end