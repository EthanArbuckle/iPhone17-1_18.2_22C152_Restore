@interface _EAROnDeviceEndpointerInfo
- (_EAROnDeviceEndpointerInfo)initWithConfig:(id)a3;
- (id).cxx_construct;
- (id)getEndpointerExtraDelayFrequencyForTask:(id)a3;
- (id)getEndpointerThresholdForClientModelVersion:(unsigned int)a3 task:(id)a4;
@end

@implementation _EAROnDeviceEndpointerInfo

- (_EAROnDeviceEndpointerInfo)initWithConfig:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EAROnDeviceEndpointerInfo;
  v5 = [(_EAROnDeviceEndpointerInfo *)&v19 init];
  if (!v5)
  {
LABEL_14:
    v10 = v5;
    goto LABEL_15;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v4];

  if (v7)
  {
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v18);
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v17 = 0;
    }
    memset(v15, 0, sizeof(v15));
    memset(v13, 0, sizeof(v13));
    int v14 = 1065353216;
    quasar::SystemConfig::readJsonFile((uint64_t)v18, (uint64_t)__p, v15, (uint64_t)v13, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v13);
    *(void *)&v13[0] = v15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v13);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
    uint64_t HybridClientConfigs = quasar::SystemConfig::getHybridClientConfigs((quasar::SystemConfig *)v18);
    if (v5 + 8 != (char *)HybridClientConfigs)
    {
      std::__tree<std::__value_type<int,std::map<std::string,double>>,std::__map_value_compare<int,std::__value_type<int,std::map<std::string,double>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::map<std::string,double>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,std::map<std::string,double>>,std::__tree_node<std::__value_type<int,std::map<std::string,double>>,void *> *,long>>((uint64_t **)v5 + 1, *(uint64_t **)HybridClientConfigs, (uint64_t *)(HybridClientConfigs + 8));
      std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)v5 + 4, *(void **)(HybridClientConfigs + 24), (void *)(HybridClientConfigs + 32));
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v18);
    goto LABEL_14;
  }
  v9 = EARLogger::QuasarOSLogger(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[_EAROnDeviceEndpointerInfo initWithConfig:]((uint64_t)v4, v9);
  }

  v10 = 0;
LABEL_15:

  return v10;
}

- (id)getEndpointerThresholdForClientModelVersion:(unsigned int)a3 task:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  left = (char *)self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_;
  v8 = left;
  if (!left) {
    goto LABEL_11;
  }
  v11 = p_pair1;
  do
  {
    int v12 = *((_DWORD *)v8 + 8);
    BOOL v13 = v12 < (int)a3;
    if (v12 >= (int)a3) {
      int v14 = (void **)v8;
    }
    else {
      int v14 = (void **)(v8 + 8);
    }
    if (!v13) {
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *)v8;
    }
    v8 = (char *)*v14;
  }
  while (*v14);
  if (v11 == p_pair1 || SLODWORD(v11[4].__value_.__left_) > (signed int)a3) {
    goto LABEL_11;
  }
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v22 = 0;
  }
  uint64_t v18 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v11[5], (const void **)__p);
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  if (&v11[6] != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *)v18) {
    goto LABEL_26;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "*");
  id v6 = (id)std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v11[5], (const void **)__p);
  uint64_t v19 = (uint64_t)v6;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  BOOL v20 = v18 == v19;
  uint64_t v18 = v19;
  if (v20)
  {
LABEL_11:
    v15 = EARLogger::QuasarOSLogger((EARLogger *)v6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_EAROnDeviceEndpointerInfo getEndpointerThresholdForClientModelVersion:task:](a3, v15);
    }

    v16 = 0;
  }
  else
  {
LABEL_26:
    v16 = [NSNumber numberWithDouble:*(double *)(v18 + 56)];
  }

  return v16;
}

- (id)getEndpointerExtraDelayFrequencyForTask:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v14 = 0;
  }
  uint64_t v6 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (const void **)__p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  if (&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, int>, void *>>> *)v6) {
    goto LABEL_10;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "*");
  int v7 = (EARLogger *)std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (const void **)__p);
  v8 = v7;
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  BOOL v9 = v6 == (void)v8;
  uint64_t v6 = (uint64_t)v8;
  if (v9)
  {
    int v12 = EARLogger::QuasarOSLogger(v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_EAROnDeviceEndpointerInfo getEndpointerExtraDelayFrequencyForTask:]((uint64_t)v5, v12);
    }

    v10 = 0;
  }
  else
  {
LABEL_10:
    v10 = [NSNumber numberWithInt:*(unsigned int *)(v6 + 56)];
  }

  return v10;
}

- (void).cxx_destruct
{
  p_hybridClientConfigs = &self->_hybridClientConfigs;
  std::__tree<std::string>::destroy((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (char *)self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency.__tree_.__pair1_.__value_.__left_);
  left = self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_.__value_.__left_;
  std::__tree<std::__value_type<int,std::map<std::string,double>>,std::__map_value_compare<int,std::__value_type<int,std::map<std::string,double>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::map<std::string,double>>>>::destroy((uint64_t)p_hybridClientConfigs, left);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Configuration file %@ does not exist", (uint8_t *)&v2, 0xCu);
}

- (void)getEndpointerThresholdForClientModelVersion:(int)a1 task:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "EndpointerThreshold does not exist for clientModelVersion %u", (uint8_t *)v2, 8u);
}

- (void)getEndpointerExtraDelayFrequencyForTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "EndpointerExtraDelayFrequency does not exist for task %@ and there is no default value returning nil", (uint8_t *)&v2, 0xCu);
}

@end