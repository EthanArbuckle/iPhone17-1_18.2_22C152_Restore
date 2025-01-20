@interface DS_TKeyValueObserverGlue
- (DS_TKeyValueObserverGlue)initWithFunctor:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5;
- (DS_TKeyValueObserverGlue)initWithFunctorWithChange:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5;
- (id).cxx_construct;
- (void)initCommon:(const void *)a3 observedKeyPath:(const void *)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DS_TKeyValueObserverGlue

- (DS_TKeyValueObserverGlue)initWithFunctor:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)DS_TKeyValueObserverGlue;
  v8 = [(DS_TKeyValueObserverGlue *)&v10 init];
  std::function<void ()(void)>::operator=(v8->_functor.__f_.__buf_.__lx, (uint64_t)a3);
  [(DS_TKeyValueObserverGlue *)v8 initCommon:a4 observedKeyPath:a5];
  return v8;
}

- (DS_TKeyValueObserverGlue)initWithFunctorWithChange:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)DS_TKeyValueObserverGlue;
  v8 = [(DS_TKeyValueObserverGlue *)&v10 init];
  std::function<void ()(NSDictionary<NSString *,NSObject *> *)>::operator=(v8->_functorWithChange.__f_.__buf_.__lx, (uint64_t)a3);
  [(DS_TKeyValueObserverGlue *)v8 initCommon:a4 observedKeyPath:a5];
  return v8;
}

- (void)initCommon:(const void *)a3 observedKeyPath:(const void *)a4
{
  std::__hash_table<NSObject *,std::hash<std::hash>,std::equal_to<std::hash>,std::allocator<std::hash>>::operator=((uint64_t)&self->_observedObjects, (uint64_t)a3);
  if (&self->_observedKeyPath != a4)
  {
    v6 = *(TString **)a4;
    TString::SetStringRefAsImmutable(&self->_observedKeyPath, v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (operator==((void **)&self->_observedKeyPath.fString.fRef, v10)
    && (id v15 = v11,
        std::__hash_table<NSObject *,std::hash<std::hash>,std::equal_to<std::hash>,std::allocator<std::hash>>::find<std::hash>(&self->_observedObjects.__table_.__bucket_list_.__ptr_.__value_, &v15)))
  {
    f = self->_functor.__f_.__f_;
    if (f)
    {
      (*(void (**)(void *))(*(void *)f + 48))(f);
    }
    else if (self->_functorWithChange.__f_.__f_)
    {
      std::function<void ()(NSDictionary<NSString *,NSObject *> *)>::operator()((uint64_t)&self->_functorWithChange, v12);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)DS_TKeyValueObserverGlue;
    [(DS_TKeyValueObserverGlue *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void).cxx_destruct
{
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&self->_observedKeyPath.fString.fRef);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_observedObjects);
  std::__function::__value_func<void ()(NSDictionary<NSString *,NSObject *> *)>::~__value_func[abi:ne180100](self->_functorWithChange.__f_.__buf_.__lx);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->_functor.__f_.__buf_.__lx);
}

- (id).cxx_construct
{
  self->_functor.__f_.__f_ = 0;
  *(_OWORD *)&self->_functorWithChange.__f_.__f_ = 0u;
  *(_OWORD *)&self->_observedObjects.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0u;
  self->_observedObjects.__table_.__p2_.__value_ = 0;
  *(_DWORD *)self->_anon_70 = 1065353216;
  self->_observedKeyPath.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  return self;
}

@end