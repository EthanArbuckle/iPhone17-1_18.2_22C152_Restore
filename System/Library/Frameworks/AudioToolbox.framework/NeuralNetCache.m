@interface NeuralNetCache
+ (id)sharedCache;
- (NeuralNetCache)initWithImpl:()unique_ptr<NeuralNetImpl;
- (id).cxx_construct;
- (unique_ptr<NeuralNetImpl,)impl;
@end

@implementation NeuralNetCache

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (unique_ptr<NeuralNetImpl,)impl
{
  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<NeuralNetImpl, std::default_delete<NeuralNetImpl>>)self;
}

- (NeuralNetCache)initWithImpl:()unique_ptr<NeuralNetImpl
{
  v9.receiver = self;
  v9.super_class = (Class)NeuralNetCache;
  v4 = [(NeuralNetCache *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(NeuralNetImpl **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    value = v4->_impl.__ptr_.__value_;
    v5->_impl.__ptr_.__value_ = v6;
    if (value) {
      (*(void (**)(NeuralNetImpl *))(*(void *)value + 8))(value);
    }
  }
  return v5;
}

+ (id)sharedCache
{
  if (+[NeuralNetCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[NeuralNetCache sharedCache]::onceToken, &__block_literal_global_26251);
  }
  v2 = (void *)sNeuralNetCache;

  return v2;
}

void __29__NeuralNetCache_sharedCache__block_invoke()
{
  if (!sNeuralNetCache)
  {
    sNeuralNetCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
    MEMORY[0x1F41817F8]();
  }
}

@end