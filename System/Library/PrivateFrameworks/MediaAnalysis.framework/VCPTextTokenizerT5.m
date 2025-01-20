@interface VCPTextTokenizerT5
- (VCPTextTokenizerT5)init;
- (id).cxx_construct;
- (id)encode:(id)a3;
@end

@implementation VCPTextTokenizerT5

- (VCPTextTokenizerT5)init
{
  v4.receiver = self;
  v4.super_class = (Class)VCPTextTokenizerT5;
  if ([(VCPTextTokenizer *)&v4 init]) {
    operator new();
  }
  v2 = (VCPTextTokenizerT5 *)0;

  return v2;
}

- (id)encode:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"<s>"] && (int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Input text should not contain BOS token!", buf, 2u);
    }
  }
  v6 = [v4 lowercaseString];
  *(void *)buf = 0;
  v20 = 0;
  uint64_t v21 = 0;
  value = self->_processor.__ptr_.__value_;
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  if ((v17 & 0x80u) == 0) {
    v9 = __p;
  }
  else {
    v9 = (void **)__p[0];
  }
  if ((v17 & 0x80u) == 0) {
    unint64_t v10 = v17;
  }
  else {
    unint64_t v10 = (unint64_t)__p[1];
  }
  (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, unint64_t, uint8_t *))(*(void *)value + 144))(&v18, value, v9, v10, buf);
  if ((char)v17 < 0) {
    operator delete(__p[0]);
  }
  v11 = [MEMORY[0x1E4F1CA48] array];
  if (!v18)
  {
    v12 = *(unsigned int **)buf;
    for (i = v20; v12 != i; ++v12)
    {
      v14 = [NSNumber numberWithInt:*v12];
      [v11 addObject:v14];
    }
  }
  [v11 insertObject:&unk_1F15EB820 atIndex:0];
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v18);
  if (*(void *)buf)
  {
    v20 = *(unsigned int **)buf;
    operator delete(*(void **)buf);
  }

  return v11;
}

- (void).cxx_destruct
{
  value = self->_processor.__ptr_.__value_;
  self->_processor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end