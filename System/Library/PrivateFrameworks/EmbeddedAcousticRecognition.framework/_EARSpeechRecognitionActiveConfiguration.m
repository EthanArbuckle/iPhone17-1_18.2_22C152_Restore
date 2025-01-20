@interface _EARSpeechRecognitionActiveConfiguration
+ (id)activeConfigurationForEverything;
+ (id)activeConfigurationForNothing;
- (NSSet)aneContextFilter;
- (NSSet)atypicalSpeechFilter;
- (NSSet)bluetoothDeviceIdFilter;
- (NSSet)cpuContextFilter;
- (NSSet)deviceIdFilter;
- (NSSet)farFieldFilter;
- (NSSet)gpuContextFilter;
- (NSSet)samplingRateFilter;
- (NSSet)taskTypeFilter;
- (SpeechRecognizerActiveConfiguration)speechRecognizerActiveConfiguration;
- (id)_initWithActiveConfiguration:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAneContextFilter:(id)a3;
- (void)setAtypicalSpeechFilter:(id)a3;
- (void)setBluetoothDeviceIdFilter:(id)a3;
- (void)setCpuContextFilter:(id)a3;
- (void)setDeviceIdFilter:(id)a3;
- (void)setFarFieldFilter:(id)a3;
- (void)setGpuContextFilter:(id)a3;
- (void)setSamplingRateFilter:(id)a3;
- (void)setTaskTypeFilter:(id)a3;
@end

@implementation _EARSpeechRecognitionActiveConfiguration

+ (id)activeConfigurationForEverything
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)activeConfigurationForNothing
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setSamplingRateFilter:v3];

  v4 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setTaskTypeFilter:v4];

  v5 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setFarFieldFilter:v5];

  v6 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setDeviceIdFilter:v6];

  v7 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setAneContextFilter:v7];

  v8 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setCpuContextFilter:v8];

  v9 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setGpuContextFilter:v9];

  v10 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setAtypicalSpeechFilter:v10];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(_EARSpeechRecognitionActiveConfiguration *)self samplingRateFilter];
  [v4 setSamplingRateFilter:v5];

  v6 = [(_EARSpeechRecognitionActiveConfiguration *)self taskTypeFilter];
  [v4 setTaskTypeFilter:v6];

  v7 = [(_EARSpeechRecognitionActiveConfiguration *)self farFieldFilter];
  [v4 setFarFieldFilter:v7];

  v8 = [(_EARSpeechRecognitionActiveConfiguration *)self deviceIdFilter];
  [v4 setDeviceIdFilter:v8];

  v9 = [(_EARSpeechRecognitionActiveConfiguration *)self aneContextFilter];
  [v4 setAneContextFilter:v9];

  v10 = [(_EARSpeechRecognitionActiveConfiguration *)self cpuContextFilter];
  [v4 setCpuContextFilter:v10];

  v11 = [(_EARSpeechRecognitionActiveConfiguration *)self gpuContextFilter];
  [v4 setGpuContextFilter:v11];

  v12 = [(_EARSpeechRecognitionActiveConfiguration *)self atypicalSpeechFilter];
  [v4 setAtypicalSpeechFilter:v12];

  return v4;
}

- (id)_initWithActiveConfiguration:(const void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_EARSpeechRecognitionActiveConfiguration;
  v4 = [(_EARSpeechRecognitionActiveConfiguration *)&v14 init];
  if (*((unsigned char *)a3 + 24))
  {
    v5 = EARHelpers::ContainerToNSSet<std::set<unsigned int>>(a3);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setSamplingRateFilter:v5];
  }
  if (*((unsigned char *)a3 + 56))
  {
    v6 = EARHelpers::ContainerToNSSet<std::set<std::string>>((void *)a3 + 4);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setTaskTypeFilter:v6];
  }
  if (*((unsigned char *)a3 + 120))
  {
    v7 = EARHelpers::ContainerToNSSet<std::set<BOOL>>((void *)a3 + 12);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setFarFieldFilter:v7];
  }
  if (*((unsigned char *)a3 + 88))
  {
    v8 = EARHelpers::ContainerToNSSet<std::set<std::string>>((void *)a3 + 8);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setDeviceIdFilter:v8];
  }
  if (*((unsigned char *)a3 + 152))
  {
    v9 = EARHelpers::ContainerToNSSet<std::set<BOOL>>((void *)a3 + 16);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setAtypicalSpeechFilter:v9];
  }
  if (*((unsigned char *)a3 + 184))
  {
    v10 = EARHelpers::ContainerToNSSet<std::set<std::string>>((void *)a3 + 20);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setAneContextFilter:v10];
  }
  if (*((unsigned char *)a3 + 216))
  {
    v11 = EARHelpers::ContainerToNSSet<std::set<std::string>>((void *)a3 + 24);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setCpuContextFilter:v11];
  }
  if (*((unsigned char *)a3 + 248))
  {
    v12 = EARHelpers::ContainerToNSSet<std::set<std::string>>((void *)a3 + 28);
    [(_EARSpeechRecognitionActiveConfiguration *)v4 setGpuContextFilter:v12];
  }
  return v4;
}

- (SpeechRecognizerActiveConfiguration)speechRecognizerActiveConfiguration
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  retstr->var0.var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var1.var0.var0 = 0;
  p_var1 = &retstr->var1;
  retstr->var1.var1 = 0;
  retstr->var2.var0.var0 = 0;
  p_var2 = &retstr->var2;
  retstr->var3.var0.var0 = 0;
  p_var3 = &retstr->var3;
  retstr->var2.var1 = 0;
  retstr->var3.var1 = 0;
  retstr->var4.var0.var0 = 0;
  p_var4 = &retstr->var4;
  retstr->var4.var1 = 0;
  retstr->var5.var0.var0 = 0;
  p_var5 = &retstr->var5;
  retstr->var6.var0.var0 = 0;
  p_var6 = &retstr->var6;
  retstr->var5.var1 = 0;
  retstr->var6.var1 = 0;
  retstr->var7.var0.var0 = 0;
  p_var7 = &retstr->var7;
  retstr->var7.var1 = 0;
  v8 = [(_EARSpeechRecognitionActiveConfiguration *)self samplingRateFilter];

  if (v8)
  {
    [(_EARSpeechRecognitionActiveConfiguration *)self samplingRateFilter];
    v51 = 0;
    uint64_t v52 = 0;
    v50 = (uint64_t *)&v51;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:&v58 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v55;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(id *)(*((void *)&v54 + 1) + 8 * v12);
          unsigned int v53 = [v13 unsignedIntegerValue];
          std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(&v50, &v53, &v53);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:&v58 count:16];
      }
      while (v10);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)retstr, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);
  }
  objc_super v14 = [(_EARSpeechRecognitionActiveConfiguration *)self taskTypeFilter];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    v16 = [(_EARSpeechRecognitionActiveConfiguration *)self taskTypeFilter];
    EARHelpers::StdSetOfStringsFromNSSet(v16, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var1, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);
  }
  v17 = [(_EARSpeechRecognitionActiveConfiguration *)self farFieldFilter];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    id v19 = [(_EARSpeechRecognitionActiveConfiguration *)self farFieldFilter];
    v51 = 0;
    uint64_t v52 = 0;
    v50 = (uint64_t *)&v51;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:&v58 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v55;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(id *)(*((void *)&v54 + 1) + 8 * v23);
          LOBYTE(v53) = [v24 BOOLValue];
          std::__tree<BOOL>::__emplace_unique_key_args<BOOL,BOOL>(&v50, (unsigned __int8 *)&v53, &v53);

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:&v58 count:16];
      }
      while (v21);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)p_var3, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);
  }
  v25 = [(_EARSpeechRecognitionActiveConfiguration *)self deviceIdFilter];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    v27 = [(_EARSpeechRecognitionActiveConfiguration *)self deviceIdFilter];
    EARHelpers::StdSetOfStringsFromNSSet(v27, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var2, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);
  }
  v28 = [(_EARSpeechRecognitionActiveConfiguration *)self atypicalSpeechFilter];
  BOOL v29 = v28 == 0;

  if (!v29)
  {
    id v30 = [(_EARSpeechRecognitionActiveConfiguration *)self atypicalSpeechFilter];
    v51 = 0;
    uint64_t v52 = 0;
    v50 = (uint64_t *)&v51;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:&v58 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v55;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v31);
          }
          id v35 = *(id *)(*((void *)&v54 + 1) + 8 * v34);
          LOBYTE(v53) = [v35 BOOLValue];
          std::__tree<BOOL>::__emplace_unique_key_args<BOOL,BOOL>(&v50, (unsigned __int8 *)&v53, &v53);

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:&v58 count:16];
      }
      while (v32);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)p_var4, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);
  }
  v36 = [(_EARSpeechRecognitionActiveConfiguration *)self aneContextFilter];
  BOOL v37 = v36 == 0;

  if (!v37)
  {
    v38 = [(_EARSpeechRecognitionActiveConfiguration *)self aneContextFilter];
    EARHelpers::StdSetOfStringsFromNSSet(v38, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var5, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);
  }
  v39 = [(_EARSpeechRecognitionActiveConfiguration *)self cpuContextFilter];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    v41 = [(_EARSpeechRecognitionActiveConfiguration *)self cpuContextFilter];
    EARHelpers::StdSetOfStringsFromNSSet(v41, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var6, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);
  }
  v42 = [(_EARSpeechRecognitionActiveConfiguration *)self gpuContextFilter];
  BOOL v43 = v42 == 0;

  if (!v43)
  {
    v45 = [(_EARSpeechRecognitionActiveConfiguration *)self gpuContextFilter];
    EARHelpers::StdSetOfStringsFromNSSet(v45, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var7, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);
  }
  return result;
}

- (id)description
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
  [(_EARSpeechRecognitionActiveConfiguration *)self speechRecognizerActiveConfiguration];
  quasar::operator<<(v10, (uint64_t)__p);
  quasar::SpeechRecognizerActiveConfiguration::~SpeechRecognizerActiveConfiguration((char **)__p);
  v3 = NSString;
  std::stringbuf::str();
  if ((v9 & 0x80u) == 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    unint64_t v5 = v9;
  }
  else {
    unint64_t v5 = (unint64_t)__p[1];
  }
  v6 = objc_msgSend(v3, "ear_stringWithStringView:", v4, v5);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  v10[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v10[1] = MEMORY[0x1E4FBA470] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1B3EA8520](&v12);
  return v6;
}

- (NSSet)samplingRateFilter
{
  return self->_samplingRateFilter;
}

- (void)setSamplingRateFilter:(id)a3
{
}

- (NSSet)taskTypeFilter
{
  return self->_taskTypeFilter;
}

- (void)setTaskTypeFilter:(id)a3
{
}

- (NSSet)farFieldFilter
{
  return self->_farFieldFilter;
}

- (void)setFarFieldFilter:(id)a3
{
}

- (NSSet)deviceIdFilter
{
  return self->_deviceIdFilter;
}

- (void)setDeviceIdFilter:(id)a3
{
}

- (NSSet)bluetoothDeviceIdFilter
{
  return self->_bluetoothDeviceIdFilter;
}

- (void)setBluetoothDeviceIdFilter:(id)a3
{
}

- (NSSet)aneContextFilter
{
  return self->_aneContextFilter;
}

- (void)setAneContextFilter:(id)a3
{
}

- (NSSet)cpuContextFilter
{
  return self->_cpuContextFilter;
}

- (void)setCpuContextFilter:(id)a3
{
}

- (NSSet)gpuContextFilter
{
  return self->_gpuContextFilter;
}

- (void)setGpuContextFilter:(id)a3
{
}

- (NSSet)atypicalSpeechFilter
{
  return self->_atypicalSpeechFilter;
}

- (void)setAtypicalSpeechFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atypicalSpeechFilter, 0);
  objc_storeStrong((id *)&self->_gpuContextFilter, 0);
  objc_storeStrong((id *)&self->_cpuContextFilter, 0);
  objc_storeStrong((id *)&self->_aneContextFilter, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdFilter, 0);
  objc_storeStrong((id *)&self->_deviceIdFilter, 0);
  objc_storeStrong((id *)&self->_farFieldFilter, 0);
  objc_storeStrong((id *)&self->_taskTypeFilter, 0);
  objc_storeStrong((id *)&self->_samplingRateFilter, 0);
}

@end