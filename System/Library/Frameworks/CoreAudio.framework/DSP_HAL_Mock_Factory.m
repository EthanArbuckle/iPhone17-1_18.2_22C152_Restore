@interface DSP_HAL_Mock_Factory
- (DSP_HAL_Mock_Factory)init;
- (DSP_HAL_Mock_PropertySet)libraryProperties;
- (double)createProcessor:withHost:;
- (id)createProcessor:(id)a3 withHost:(id)a4;
- (int)featureFlag;
- (uint64_t)createProcessor:withHost:;
- (void)createProcessor:withHost:;
- (void)dealloc;
- (void)setFeatureFlag:(int)a3;
- (void)setLibraryProperties:(id)a3;
@end

@implementation DSP_HAL_Mock_Factory

- (void).cxx_destruct
{
}

- (void)setLibraryProperties:(id)a3
{
}

- (DSP_HAL_Mock_PropertySet)libraryProperties
{
  return self->_libraryProperties;
}

- (int)featureFlag
{
  return self->_featureFlag;
}

- (id)createProcessor:(id)a3 withHost:(id)a4
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_alloc_init(DSP_HAL_Mock_IOProcessor);
  [(DSP_HAL_Mock_IOProcessor *)v6 setHostCallbacks:v5];
  [(DSP_HAL_Mock_IOProcessor *)v6 setFeatureFlag:[(DSP_HAL_Mock_Factory *)self featureFlag]];
  v8[0] = &unk_1F146B7A8;
  v8[3] = v8;
  [(DSP_HAL_Mock_IOProcessor *)v6 setTestHookFetcher:v8];
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v8);

  return v6;
}

- (void)createProcessor:withHost:
{
}

- (uint64_t)createProcessor:withHost:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z49-[DSP_HAL_Mock_Factory createProcessor:withHost:]E3$_4"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (double)createProcessor:withHost:
{
  uint64_t v2 = gMockTestHooks;
  if (gMockTestHooks)
  {
    std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::__value_func[abi:ne180100]((uint64_t)a1, gMockTestHooks);
    std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 2), v2 + 32);
    std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(a1 + 4), v2 + 64);
    std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 6), v2 + 96);
    std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::__value_func[abi:ne180100]((uint64_t)(a1 + 8), v2 + 128);
  }
  else
  {
    double result = 0.0;
    a1[8] = 0u;
    a1[9] = 0u;
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

- (void)setFeatureFlag:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_featureFlag = a3;
  id v4 = [(DSP_HAL_Mock_Factory *)self libraryProperties];
  [v4 configureForFeatureFlag:v3];
}

- (void)dealloc
{
  libraryProperties = self->_libraryProperties;
  self->_libraryProperties = 0;

  v4.receiver = self;
  v4.super_class = (Class)DSP_HAL_Mock_Factory;
  [(DSP_HAL_Mock_Factory *)&v4 dealloc];
}

- (DSP_HAL_Mock_Factory)init
{
  v7.receiver = self;
  v7.super_class = (Class)DSP_HAL_Mock_Factory;
  uint64_t v2 = [(DSP_HAL_Mock_Factory *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_featureFlag = 97;
    objc_super v4 = objc_alloc_init(DSP_HAL_Mock_PropertySet);
    libraryProperties = v3->_libraryProperties;
    v3->_libraryProperties = v4;

    [(DSP_HAL_Mock_PropertySet *)v3->_libraryProperties configureForFeatureFlag:v3->_featureFlag];
  }
  return v3;
}

@end