@interface XRFrameCommutator
+ (id)sharedCommutator;
- (XRFrameCommutator)init;
- (XRFrameCommutator)initWithMinorFrameCount:(unsigned __int8)a3;
- (id).cxx_construct;
- (id)newRing;
- (void)addRing:(id)a3;
- (void)dealloc;
- (void)observedTopOfMajorFrame;
- (void)removeRing:(id)a3;
- (void)setPeriod:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation XRFrameCommutator

+ (id)sharedCommutator
{
  if (qword_2687AA308 != -1) {
    dispatch_once(&qword_2687AA308, &unk_26E752630);
  }
  v2 = (void *)qword_2687AA300;

  return v2;
}

- (XRFrameCommutator)initWithMinorFrameCount:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)XRFrameCommutator;
  if ([(XRFrameCommutator *)&v4 init]) {
    sub_23458FE90();
  }
  return 0;
}

- (XRFrameCommutator)init
{
  return (XRFrameCommutator *)((uint64_t (*)(XRFrameCommutator *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_initWithMinorFrameCount_, 8);
}

- (void)dealloc
{
  p_commutatorImpl = &self->_commutatorImpl;
  value = self->_commutatorImpl.__ptr_.__value_;
  if (value)
  {
    sub_234599188((uint64_t)value);
    v5 = (void **)p_commutatorImpl->__ptr_.__value_;
    p_commutatorImpl->__ptr_.__value_ = 0;
    if (v5) {
      sub_2345900CC((uint64_t)p_commutatorImpl, v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)XRFrameCommutator;
  [(XRFrameCommutator *)&v6 dealloc];
}

- (void)addRing:(id)a3
{
}

- (void)removeRing:(id)a3
{
}

- (id)newRing
{
  v3 = [XRFrameRing alloc];
  uint64_t v6 = *((unsigned __int8 *)self->_commutatorImpl.__ptr_.__value_ + 124);

  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithMinorFrameCount_, v6, v4, v5);
}

- (void)start
{
}

- (void)stop
{
  p_commutatorImpl = &self->_commutatorImpl;
  sub_234599094((uint64_t)self->_commutatorImpl.__ptr_.__value_);
  value = (void **)p_commutatorImpl->__ptr_.__value_;
  p_commutatorImpl->__ptr_.__value_ = 0;
  if (value)
  {
    sub_2345900CC((uint64_t)p_commutatorImpl, value);
  }
}

- (void)observedTopOfMajorFrame
{
  gettimeofday(&v3, 0);
  sub_23459921C((uint64_t)self->_commutatorImpl.__ptr_.__value_, (uint64_t)&v3);
}

- (void)setPeriod:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  value = self->_commutatorImpl.__ptr_.__value_;
  p_commutatorImpl = &self->_commutatorImpl;
  timeval v3 = (void **)value;
  p_commutatorImpl->__ptr_.__value_ = 0;
  if (value) {
    sub_2345900CC((uint64_t)p_commutatorImpl, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end