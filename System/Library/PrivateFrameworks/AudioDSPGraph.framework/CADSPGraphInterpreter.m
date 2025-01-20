@interface CADSPGraphInterpreter
- (id).cxx_construct;
@end

@implementation CADSPGraphInterpreter

- (id).cxx_construct
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__bucket_list_ = 0u;
  self->_interpreter._vptr$Interpreter = (void **)&unk_26FC98E30;
  self->_interpreter.mGraph.__ptr_.__value_ = 0;
  p_mNewBoxRegistry = &self->_interpreter.mNewBoxRegistry;
  self->_interpreter.mNewBoxRegistry._vptr$Base = (void **)&unk_26FC98E60;
  *(_OWORD *)&self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_interpreter.mNewBoxRegistry.mNewBoxMap.__table_.__p3_.__value_ = 1.0;
  self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__p1_.__value_.__next_ = 0u;
  self->_interpreter.mNewBoxRegistry.mNewBoxMapFromDesc.__table_.__p3_.__value_ = 1.0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__begin_ = 0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__end_ = 0;
  self->_interpreter.mNewBoxRegistry.mRegisteredBoxes.__end_cap_.__value_ = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "gain");
  long long v5 = xmmword_24893BD20;
  int v6 = 0;
  v9[0] = &unk_26FC98EE0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "amul");
  long long v5 = xmmword_24893BD30;
  int v6 = 0;
  v9[0] = &unk_26FC98F28;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "adiv");
  long long v5 = xmmword_24893BD40;
  int v6 = 0;
  v9[0] = &unk_26FC99590;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "amin");
  long long v5 = xmmword_24893BD50;
  int v6 = 0;
  v9[0] = &unk_26FC99BF8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "amax");
  long long v5 = xmmword_24893BD60;
  int v6 = 0;
  v9[0] = &unk_26FC9A1A0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "adif");
  long long v5 = xmmword_24893BD70;
  int v6 = 0;
  v9[0] = &unk_26FC9A748;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "asum");
  long long v5 = xmmword_24893BD80;
  int v6 = 0;
  v9[0] = &unk_26FC9ADB0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "aabs");
  long long v5 = xmmword_24893BD90;
  int v6 = 0;
  v9[0] = &unk_26FC9B418;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "vcgn");
  long long v5 = xmmword_24893BDA0;
  int v6 = 0;
  v9[0] = &unk_26FC9B460;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "dbgn");
  long long v5 = xmmword_24893BDB0;
  int v6 = 0;
  v9[0] = &unk_26FC9B4A8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "copy");
  long long v5 = xmmword_24893BDC0;
  int v6 = 0;
  v9[0] = &unk_26FC9B4F0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "sum");
  long long v5 = xmmword_24893BDD0;
  int v6 = 0;
  v9[0] = &unk_26FC9B538;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mix");
  long long v5 = xmmword_24893BDE0;
  int v6 = 0;
  v9[0] = &unk_26FC9B580;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "average");
  long long v5 = xmmword_24893BDF0;
  int v6 = 0;
  v9[0] = &unk_26FC9B5C8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "test");
  long long v5 = xmmword_24893BE00;
  int v6 = 0;
  v9[0] = &unk_26FC9B610;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "src");
  long long v5 = xmmword_24893BE10;
  int v6 = 0;
  v9[0] = &unk_26FC9B658;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "reblocker");
  long long v5 = xmmword_24893BE20;
  int v6 = 0;
  v9[0] = &unk_26FC9B980;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "freqsrc");
  long long v5 = xmmword_24893BE30;
  int v6 = 0;
  v9[0] = &unk_26FC9BCA8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "fft");
  long long v5 = xmmword_24893BE40;
  int v6 = 0;
  v9[0] = &unk_26FC9BFD0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "join");
  long long v5 = xmmword_24893BE50;
  int v6 = 0;
  v9[0] = &unk_26FC9C018;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "split");
  long long v5 = xmmword_24893BE60;
  int v6 = 0;
  v9[0] = &unk_26FC9C060;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "chancopy");
  long long v5 = xmmword_24893BE70;
  int v6 = 0;
  v9[0] = &unk_26FC9C0A8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "delay");
  long long v5 = xmmword_24893BE80;
  int v6 = 0;
  v9[0] = &unk_26FC9C0F0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "dead");
  long long v5 = xmmword_24893BE90;
  int v6 = 0;
  v9[0] = &unk_26FC9C138;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "constant");
  long long v5 = xmmword_24893BEA0;
  int v6 = 0;
  v9[0] = &unk_26FC9C180;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "dbcontrol");
  long long v5 = xmmword_24893BEB0;
  int v6 = 0;
  v9[0] = &unk_26FC9C1C8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "denormalzero");
  long long v5 = xmmword_24893BEC0;
  int v6 = 0;
  v9[0] = &unk_26FC9C210;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "mantissarandom");
  long long v5 = xmmword_24893BED0;
  int v6 = 0;
  v9[0] = &unk_26FC9C258;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "volumecurve");
  long long v5 = xmmword_24893BEE0;
  int v6 = 0;
  v9[0] = &unk_26FC9C2A0;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "nfnp");
  long long v5 = xmmword_24893BEF0;
  int v6 = 0;
  v9[0] = &unk_26FC9C2E8;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "srlconverter");
  long long v5 = xmmword_24893BF00;
  int v6 = 0;
  v9[0] = &unk_26FC9C330;
  v10 = v9;
  AudioDSPGraph::NewBoxRegistry::add((uint64_t)p_mNewBoxRegistry, (uint64_t)__p, (unsigned int *)&v5, v9);
  std::__function::__value_func<AudioDSPGraph::Box * ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_add", 0x705F5F2Bu, 0, 0, 0);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_subtract", 0x705F5F2Du, 0, 0, 1);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_multiply", 0x705F5F2Au, 0, 0, 2);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_divide", 0x705F5F2Fu, 0, 0, 3);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_negate", 0x705F5F6Eu, 0, 0, 4);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_and", 0x705F2626u, 0, 0, 5);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_or", 0x705F7C7Cu, 0, 0, 6);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_logical_not", 0x705F5F21u, 0, 0, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_equal", 0x705F3D3Du, 0, 0, 9);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_not_equal", 0x705F213Du, 0, 0, 10);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_greater_or_equal", 0x705F3E3Du, 0, 0, 11);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_greater", 0x705F5F3Eu, 0, 0, 12);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_less_or_equal", 0x705F3C3Du, 0, 0, 13);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_less", 0x705F5F3Cu, 0, 0, 14);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_min", 0x705F5F6Du, 0, 0, 15);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_max", 0x705F5F4Du, 0, 0, 16);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "parameter_cast", 0x705F3C2Du, 1, 0, 8);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_add", 0x765F5F2Bu, 1, 1, 0);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_subtract", 0x765F5F2Du, 1, 1, 1);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_multiply", 0x765F5F2Au, 1, 1, 2);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_divide", 0x765F5F2Fu, 1, 1, 3);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_negate", 0x765F5F6Eu, 1, 1, 4);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_and", 0x765F2626u, 1, 1, 5);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_or", 0x765F7C7Cu, 1, 1, 6);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_not", 0x765F5F21u, 1, 1, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_logical_not", 0x765F5F21u, 1, 1, 7);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_equal", 0x765F3D3Du, 1, 1, 9);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_not_equal", 0x765F213Du, 1, 1, 10);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_greater_or_equal", 0x765F3E3Du, 1, 1, 11);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_greater", 0x765F5F3Eu, 1, 1, 12);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_less_or_equal", 0x765F3C3Du, 1, 1, 13);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_less", 0x765F5F3Cu, 1, 1, 14);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_min", 0x765F5F6Du, 1, 1, 15);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_max", 0x765F5F4Du, 1, 1, 16);
  AudioDSPGraph::NewBoxRegistry::NewBoxRegistry(void)::$_0::operator()<char const*,int,AudioDSPGraph::Boxes::CalculationBox::OperatorDomain,AudioDSPGraph::Boxes::CalculationBox::OperatorCodomain,AudioDSPGraph::Boxes::CalculationBox::Operator>((uint64_t)p_mNewBoxRegistry, "property_cast", 0x765F3C2Du, 0, 1, 8);
  *(void *)&self->_interpreter.mPrevious.mFormat.mBitsPerChannel = 0;
  *(_OWORD *)&self->_interpreter.mPrevious.mFormat.mBytesPerPacket = 0u;
  *(_OWORD *)&self->_interpreter.mPrevious.mFormat.mSampleRate = 0u;
  self->_interpreter.mPrevious.mBlockSize = 1;
  self->_interpreter.mPreviousNamed = 0;
  self->_interpreter.mHavePreviousFormat = 0;
  self->_interpreter.mSubsetStack.__end_ = 0;
  self->_interpreter.mSubsetStack.__end_cap_.__value_ = 0;
  self->_interpreter.mSubsetStack.__begin_ = 0;
  return self;
}

- (void).cxx_destruct
{
}

@end