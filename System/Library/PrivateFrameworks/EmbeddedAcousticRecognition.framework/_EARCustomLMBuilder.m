@interface _EARCustomLMBuilder
+ (void)initialize;
- (BOOL)getFstGrammar:(id)a3 overrideFolder:(id)a4 weight:(float)a5 errorOut:(id *)a6;
- (_EARCustomLMBuilder)initWithConfiguration:(id)a3;
- (id).cxx_construct;
@end

@implementation _EARCustomLMBuilder

+ (void)initialize
{
}

- (_EARCustomLMBuilder)initWithConfiguration:(id)a3
{
  id v4 = a3;
  +[_EARQuasarTokenizer tokenizerWithModelRoot:v4];
  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = __p;
  if (value) {
    (*(void (**)(TextTokenizer *))(*(void *)value + 8))(value);
  }
  v6 = objc_msgSend(v4, "stringByAppendingPathComponent:", @"mini.json", 0);
  if (v6) {
    objc_msgSend(v6, "ear_toString");
  }
  operator new();
}

- (BOOL)getFstGrammar:(id)a3 overrideFolder:(id)a4 weight:(float)a5 errorOut:(id *)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  float v13 = a5;
  v9 = (void *)[a3 mutableCopy];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x4812000000;
  v12[3] = __Block_byref_object_copy__9;
  v12[4] = __Block_byref_object_dispose__9;
  v12[5] = &unk_1B27252DB;
  memset(&v12[6], 0, 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68___EARCustomLMBuilder_getFstGrammar_overrideFolder_weight_errorOut___block_invoke;
  v11[3] = &unk_1E5FFE350;
  v11[4] = v12;
  [v9 enumerateObjectsUsingBlock:v11];
  if (v8) {
    objc_msgSend(v8, "ear_toString");
  }
  quasar::CustomLMBuilder::getFstGrammar();
}

- (void).cxx_destruct
{
  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(TextTokenizer *, SEL))(*(void *)value + 8))(value, a2);
  }
  std::unique_ptr<quasar::CustomLMBuilder>::reset[abi:ne180100]((quasar::CustomLMBuilder **)&self->_customLMBuilder, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end