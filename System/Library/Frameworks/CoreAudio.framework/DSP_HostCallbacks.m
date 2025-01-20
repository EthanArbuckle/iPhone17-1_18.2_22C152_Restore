@interface DSP_HostCallbacks
- (DSP_Host_IOProcessor)owner;
- (function<void)mutationRequestListener;
- (function<void)propertyChangeListener;
- (id).cxx_construct;
- (void)notifyClientsOfCustomPropertyChange:(AudioObjectPropertyAddress)a3;
- (void)setMutationRequestListener:(function<void (const DSP_Host_Types::MutationRequestConfiguration)&;
- (void)setOwner:(DSP_Host_IOProcessor *)a3;
- (void)setPropertyChangeListener:(function<void (const AudioObjectPropertyAddress)&;
@end

@implementation DSP_HostCallbacks

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 9) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::~__value_func[abi:ne180100](self->_propertyChangeListener.__f_.__buf_.__lx);

  std::__function::__value_func<void ()(DSP_Host_Types::MutationRequestConfiguration const&)>::~__value_func[abi:ne180100](self->_mutationRequestListener.__f_.__buf_.__lx);
}

- (void)setOwner:(DSP_Host_IOProcessor *)a3
{
  self->_owner = a3;
}

- (DSP_Host_IOProcessor)owner
{
  return self->_owner;
}

- (void)setPropertyChangeListener:(function<void (const AudioObjectPropertyAddress)&
{
  v9[3] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
  p_propertyChangeListener = &self->_propertyChangeListener;
  if (&self->_propertyChangeListener != (function<void (const AudioObjectPropertyAddress &)> *)v7)
  {
    v5 = v8;
    f = (function<void (const AudioObjectPropertyAddress &)> *)self->_propertyChangeListener.__f_.__f_;
    if (v8 == v7)
    {
      if (f == p_propertyChangeListener)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(void *, void *))(*(void *)self->_propertyChangeListener.__f_.__f_ + 24))(self->_propertyChangeListener.__f_.__f_, v7);
        (*(void (**)(void *))(*(void *)self->_propertyChangeListener.__f_.__f_ + 32))(self->_propertyChangeListener.__f_.__f_);
        self->_propertyChangeListener.__f_.__f_ = 0;
        v8 = v7;
        (*(void (**)(void *, function<void (const AudioObjectPropertyAddress &)> *))(v9[0] + 24))(v9, &self->_propertyChangeListener);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, function<void (const AudioObjectPropertyAddress &)> *))(v7[0] + 24))(v7, &self->_propertyChangeListener);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = self->_propertyChangeListener.__f_.__f_;
      }
      self->_propertyChangeListener.__f_.__f_ = p_propertyChangeListener;
    }
    else if (f == p_propertyChangeListener)
    {
      (*(void (**)(function<void (const AudioObjectPropertyAddress &)> *, void *))(*(void *)p_propertyChangeListener->__f_.__buf_.__lx
                                                                                              + 24))(&self->_propertyChangeListener, v7);
      (*(void (**)(void *))(*(void *)self->_propertyChangeListener.__f_.__f_ + 32))(self->_propertyChangeListener.__f_.__f_);
      self->_propertyChangeListener.__f_.__f_ = v8;
      v8 = v7;
    }
    else
    {
      v8 = self->_propertyChangeListener.__f_.__f_;
      self->_propertyChangeListener.__f_.__f_ = v5;
    }
  }
  std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::~__value_func[abi:ne180100](v7);
}

- (function<void)propertyChangeListener
{
  return (function<void (const AudioObjectPropertyAddress &)> *)std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_propertyChangeListener);
}

- (void)setMutationRequestListener:(function<void (const DSP_Host_Types::MutationRequestConfiguration)&
{
  v9[3] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(DSP_Host_Types::MutationRequestConfiguration const&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
  p_mutationRequestListener = &self->_mutationRequestListener;
  if (&self->_mutationRequestListener != (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)v7)
  {
    v5 = v8;
    f = (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)self->_mutationRequestListener.__f_.__f_;
    if (v8 == v7)
    {
      if (f == p_mutationRequestListener)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(void *, void *))(*(void *)self->_mutationRequestListener.__f_.__f_ + 24))(self->_mutationRequestListener.__f_.__f_, v7);
        (*(void (**)(void *))(*(void *)self->_mutationRequestListener.__f_.__f_ + 32))(self->_mutationRequestListener.__f_.__f_);
        self->_mutationRequestListener.__f_.__f_ = 0;
        v8 = v7;
        (*(void (**)(void *, function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *))(v9[0] + 24))(v9, &self->_mutationRequestListener);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *))(v7[0] + 24))(v7, &self->_mutationRequestListener);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = self->_mutationRequestListener.__f_.__f_;
      }
      self->_mutationRequestListener.__f_.__f_ = p_mutationRequestListener;
    }
    else if (f == p_mutationRequestListener)
    {
      (*(void (**)(function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *, void *))(*(void *)p_mutationRequestListener->__f_.__buf_.__lx + 24))(&self->_mutationRequestListener, v7);
      (*(void (**)(void *))(*(void *)self->_mutationRequestListener.__f_.__f_ + 32))(self->_mutationRequestListener.__f_.__f_);
      self->_mutationRequestListener.__f_.__f_ = v8;
      v8 = v7;
    }
    else
    {
      v8 = self->_mutationRequestListener.__f_.__f_;
      self->_mutationRequestListener.__f_.__f_ = v5;
    }
  }
  std::__function::__value_func<void ()(DSP_Host_Types::MutationRequestConfiguration const&)>::~__value_func[abi:ne180100](v7);
}

- (function<void)mutationRequestListener
{
  return (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)std::__function::__value_func<void ()(DSP_Host_Types::MutationRequestConfiguration const&)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_mutationRequestListener);
}

- (void)notifyClientsOfCustomPropertyChange:(AudioObjectPropertyAddress)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  AudioObjectPropertyAddress v5 = a3;
  if ([(DSP_HostCallbacks *)self owner])
  {
    [(DSP_HostCallbacks *)self propertyChangeListener];
    uint64_t v4 = v7;
    std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::~__value_func[abi:ne180100](v6);
    if (v4)
    {
      [(DSP_HostCallbacks *)self propertyChangeListener];
      if (!v7) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, AudioObjectPropertyAddress *))(*(void *)v7 + 48))(v7, &v5);
      std::__function::__value_func<void ()(AudioObjectPropertyAddress const&)>::~__value_func[abi:ne180100](v6);
    }
  }
}

@end