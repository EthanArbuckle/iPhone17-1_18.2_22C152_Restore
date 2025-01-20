@interface SNDSPGraphInterpreter
- (SNDSPGraphInterpreter)init;
- (id).cxx_construct;
@end

@implementation SNDSPGraphInterpreter

- (SNDSPGraphInterpreter)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SNDSPGraphInterpreter;
  v2 = [(SNDSPGraphInterpreter *)&v12 init];
  if (!v2) {
    return 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = sub_1DCB6E770;
  v10 = &unk_1E6CA8178;
  v3 = v2;
  v11 = v3;
  v13 = &unk_1F37F7C20;
  char v14 = 0;
  v15 = &v13;
  v4 = v8;
  char v6 = ((uint64_t (*)(void *, uint64_t))v9)(v4, v5);

  sub_1DCB5D2E0(&v13);
  if ((v6 & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  value = self->_interpreter.__ptr_.__value_;
  self->_interpreter.__ptr_.__value_ = 0;
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