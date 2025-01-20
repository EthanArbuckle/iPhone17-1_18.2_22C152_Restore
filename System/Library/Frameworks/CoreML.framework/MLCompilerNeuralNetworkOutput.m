@interface MLCompilerNeuralNetworkOutput
+ (id)outputWithEspressoNetwork:(shared_ptr<Espresso::net>)a3;
+ (id)outputWithMILProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram;
- (MLCompilerNeuralNetworkOutput)initWithEspressoNetwork:(shared_ptr<Espresso::net>)a3;
- (MLCompilerNeuralNetworkOutput)initWithMILProgram:(shared_ptr<MIL::IRProgram>)a3;
- (id).cxx_construct;
- (shared_ptr<Espresso::net>)network;
- (shared_ptr<MIL::IRProgram>)program;
@end

@implementation MLCompilerNeuralNetworkOutput

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_program.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_network.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (shared_ptr<MIL::IRProgram>)program
{
  cntrl = self->_program.__cntrl_;
  *v2 = self->_program.__ptr_;
  v2[1] = (IRProgram *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRProgram *)self;
  return result;
}

- (shared_ptr<Espresso::net>)network
{
  cntrl = self->_network.__cntrl_;
  *v2 = self->_network.__ptr_;
  v2[1] = (net *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (MLCompilerNeuralNetworkOutput)initWithMILProgram:(shared_ptr<MIL::IRProgram>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)MLCompilerNeuralNetworkOutput;
  v4 = [(MLCompilerNeuralNetworkOutput *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(IRProgram **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_program.__cntrl_;
    v5->_program.__ptr_ = v7;
    v5->_program.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (MLCompilerNeuralNetworkOutput)initWithEspressoNetwork:(shared_ptr<Espresso::net>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)MLCompilerNeuralNetworkOutput;
  v4 = [(MLCompilerNeuralNetworkOutput *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(net **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_network.__cntrl_;
    v5->_network.__ptr_ = v7;
    v5->_network.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

+ (id)outputWithMILProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v7 = *(void *)a3.var0.var0;
  if (v7) {
    operator new();
  }
  v8 = 0;
  *(void *)a3.var0.var0 = 0;
  v5 = (void *)[v4 initWithMILProgram:&v7];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v5;
}

+ (id)outputWithEspressoNetwork:(shared_ptr<Espresso::net>)a3
{
  ptr = a3.__ptr_;
  id v4 = objc_alloc((Class)a1);
  v5 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v8 = *(void *)ptr;
  v9 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (void *)[v4 initWithEspressoNetwork:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v6;
}

@end