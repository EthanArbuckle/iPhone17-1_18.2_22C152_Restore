@interface MLCustomLayerWrapper
+ (id)coremlShapeToEspressoShape:(id)a3 ndMode:(BOOL)a4;
+ (id)coremlShapesToEspressoShapes:(id)a3 ndMode:(BOOL)a4;
+ (id)espressoShapeToCoremlShape:(id)a3 ndMode:(BOOL)a4;
+ (id)espressoShapesToCoremlShapes:(id)a3 ndMode:(BOOL)a4;
+ (id)espressoTensorToCoremlTensor:(id)a3 ndMode:(BOOL)a4;
+ (id)espressoTensorsToCoremlTensors:(id)a3 ndMode:(BOOL)a4;
+ (id)espressoTensorsToCoremlTensorsGPU:(id)a3;
+ (id)factory;
+ (id)getStrides:(id)a3;
- (BOOL)hasGPUSupport;
- (BOOL)ndMode;
- (MLCustomLayer)customImpl;
- (MLCustomLayerWrapper)initWithParameters:(id)a3;
- (NSString)className;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
- (void)encodeToMetalCommandBuffer:(id)a3 inputTensors:(id)a4 outputTensors:(id)a5;
- (void)setCustomImpl:(id)a3;
- (void)setMappedWeights:(void *)a3 sizeInBytes:(unint64_t)a4;
@end

@implementation MLCustomLayerWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImpl, 0);

  objc_storeStrong((id *)&self->_className, 0);
}

- (void)setCustomImpl:(id)a3
{
}

- (MLCustomLayer)customImpl
{
  return self->_customImpl;
}

- (NSString)className
{
  return self->_className;
}

- (BOOL)ndMode
{
  return self->_ndMode;
}

- (BOOL)hasGPUSupport
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)encodeToMetalCommandBuffer:(id)a3 inputTensors:(id)a4 outputTensors:(id)a5
{
  *(void *)&v28[9] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[MLCustomLayerWrapper espressoTensorsToCoremlTensorsGPU:v9];
  v12 = +[MLCustomLayerWrapper espressoTensorsToCoremlTensorsGPU:v10];
  customImpl = self->_customImpl;
  id v26 = 0;
  char v14 = [(MLCustomLayer *)customImpl encodeToCommandBuffer:v8 inputs:v11 outputs:v12 error:&v26];
  id v15 = v26;
  id v16 = v26;
  if ((v14 & 1) == 0)
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v28 = v18;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "Error evaluating Core ML custom layer \"%s\" on GPU.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v23, (char *)[(NSString *)self->_className UTF8String]);
    v19 = std::string::insert(&v23, 0, "Error evaluating Core ML custom layer \"");
    long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    v24.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    v21 = std::string::append(&v24, "\" on GPU.");
    std::string __p = *v21;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    objc_storeStrong((id *)&v28[1], v15);
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }
}

- (void)setMappedWeights:(void *)a3 sizeInBytes:(unint64_t)a4
{
  *(void *)&v31[9] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    self;
    std::vector<int>::size_type v6 = (*(unsigned __int8 *)a3 << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
    std::vector<int>::vector(&v29, v6);
    if (v6)
    {
      uint64_t v7 = 0;
      std::vector<int>::size_type v8 = v6;
      do
      {
        self;
        v29.__begin_[v7] = bswap32(*(_DWORD *)((char *)a3 + v7 * 4 + 4));
        ++v7;
        --v8;
      }
      while (v8);
      unsigned int v9 = v7 * 4 + 4;
    }
    else
    {
      unsigned int v9 = 4;
    }
    id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    if (v6)
    {
      uint64_t v11 = 0;
      v12 = (char *)a3 + v9;
      do
      {
        v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:v29.__begin_[v11] freeWhenDone:0];
        [v10 setObject:v13 atIndexedSubscript:v11];
        uint64_t v14 = v29.__begin_[v11];

        v12 += v14;
        ++v11;
      }
      while (v6 != v11);
    }
    customImpl = self->_customImpl;
    id v28 = 0;
    char v16 = [(MLCustomLayer *)customImpl setWeightData:v10 error:&v28];
    id v17 = v28;
    id v18 = v28;
    if ((v16 & 1) == 0)
    {
      v19 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [(NSString *)self->_className UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v31 = v20;
        _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Error setting weights in Core ML custom layer \"%s\".", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v25, (char *)[(NSString *)self->_className UTF8String]);
      v21 = std::string::insert(&v25, 0, "Error setting weights in Core ML custom layer \"");
      long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v26.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      std::string v23 = std::string::append(&v26, "\".");
      std::string __p = *v23;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v26.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      objc_storeStrong((id *)&v31[1], v17);
      exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
    }

    if (v29.__begin_)
    {
      v29.__end_ = v29.__begin_;
      operator delete(v29.__begin_);
    }
  }
}

- (MLCustomLayerWrapper)initWithParameters:(id)a3
{
  *(void *)&v40[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"engineName"];
  std::vector<int>::size_type v6 = [v4 objectForKeyedSubscript:@"_internal_NDMode"];
  if (v6
    && ([v4 objectForKeyedSubscript:@"_internal_NDMode"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v6,
        v8))
  {
    self->_ndMode = 1;
    unsigned int v9 = (void *)[v4 mutableCopy];
    [v9 removeObjectForKey:@"_internal_NDMode"];
  }
  else
  {
    unsigned int v9 = 0;
    self->_ndMode = 0;
  }
  v38.receiver = self;
  v38.super_class = (Class)MLCustomLayerWrapper;
  id v10 = [(MLCustomLayerWrapper *)&v38 init];
  uint64_t v11 = v10;
  if (!v10)
  {
LABEL_13:
    uint64_t v14 = v11;
    goto LABEL_14;
  }
  p_className = (id *)&v10->_className;
  objc_storeStrong((id *)&v10->_className, v5);
  Class v13 = NSClassFromString((NSString *)v5);
  uint64_t v14 = v13;
  if (v13)
  {
    if (([(objc_class *)v13 conformsToProtocol:&unk_1EF12FA70] & 1) == 0)
    {
      long long v20 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [*p_className UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v40 = v21;
        _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "Core ML custom Layer implementation '%s' does not conform to the MLCustomLayer protocol'", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v35, (char *)[*p_className UTF8String]);
      long long v22 = std::string::insert(&v35, 0, "Core ML custom Layer implementation '");
      long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
      v36.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v23;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      v22->__r_.__value_.__r.__words[0] = 0;
      std::string v24 = std::string::append(&v36, "' does not conform to the MLCustomLayer protocol'");
      std::string __p = *v24;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v35.__r_.__value_.__l.__data_);
      }
      std::string v25 = *(void **)&v40[1];
      *(void *)&v40[1] = 0;

      exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
    }
    if (v11->_ndMode)
    {
      v34 = 0;
      uint64_t v15 = [[v14 alloc] initWithParameterDictionary:v9 error:&v34];
      char v16 = v34;
    }
    else
    {
      v33 = 0;
      uint64_t v15 = [[v14 alloc] initWithParameterDictionary:v4 error:&v33];
      char v16 = v33;
    }
    id v17 = v16;
    customImpl = v11->_customImpl;
    v11->_customImpl = (MLCustomLayer *)v15;

    if (!v11->_customImpl)
    {
      v27 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [*p_className UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v40 = v28;
        _os_log_error_impl(&dword_19E58B000, v27, OS_LOG_TYPE_ERROR, "Error initializing Core ML custom layer implementation with parameter dictionary for layer \"%s\".", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v35, (char *)[*p_className UTF8String]);
      std::vector<int> v29 = std::string::insert(&v35, 0, "Error initializing Core ML custom layer implementation with parameter dictionary for layer \"");
      long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
      v36.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v30;
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      v31 = std::string::append(&v36, "\".");
      std::string __p = *v31;
      v31->__r_.__value_.__l.__size_ = 0;
      v31->__r_.__value_.__r.__words[2] = 0;
      v31->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v35.__r_.__value_.__l.__data_);
      }
      objc_storeStrong((id *)&v40[1], v17);
      v32 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(v32, (id *)buf);
    }

    goto LABEL_13;
  }
LABEL_14:

  return (MLCustomLayerWrapper *)v14;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  *(void *)&v31[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_customImpl)
  {
    uint64_t v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v31 = v15;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Evaluation on Core ML custom layer \"%s\" called before the layer is constructed.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v27, (char *)[(NSString *)self->_className UTF8String]);
    char v16 = std::string::insert(&v27, 0, "Evaluation on Core ML custom layer \"");
    long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    id v18 = std::string::append(&v28, "\" called before the layer is constructed.");
    std::string __p = *v18;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }
  int v8 = +[MLCustomLayerWrapper espressoTensorsToCoremlTensors:v6 ndMode:self->_ndMode];
  unsigned int v9 = +[MLCustomLayerWrapper espressoTensorsToCoremlTensors:v7 ndMode:self->_ndMode];
  customImpl = self->_customImpl;
  id v26 = 0;
  char v11 = [(MLCustomLayer *)customImpl evaluateOnCPUWithInputs:v8 outputs:v9 error:&v26];
  id v12 = v26;
  id v13 = v26;
  if ((v11 & 1) == 0)
  {
    long long v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v31 = v21;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "Error evaluating Core ML custom layer \"%s\" on CPU.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v27, (char *)[(NSString *)self->_className UTF8String]);
    long long v22 = std::string::insert(&v27, 0, "Error evaluating Core ML custom layer \"");
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    std::string v24 = std::string::append(&v28, "\" on CPU.");
    std::string __p = *v24;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    objc_storeStrong((id *)&v31[1], v12);
    std::string v25 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v25, (id *)buf);
  }
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 objectForKeyedSubscript:@"engineName"];
  className = self->_className;
  self->_className = v8;

  id v10 = +[MLCustomLayerWrapper espressoShapesToCoremlShapes:v6 ndMode:self->_ndMode];
  if (self->_customImpl)
  {
    id v11 = 0;
  }
  else
  {
    id v12 = +[MLCustomLayerWrapper factory];
    id v13 = self->_className;
    id v45 = 0;
    uint64_t v14 = [v12 createCustomLayer:v13 withParameters:v7 error:&v45];
    id v11 = v45;
    customImpl = self->_customImpl;
    self->_customImpl = v14;

    if (!self->_customImpl) {
      goto LABEL_11;
    }
  }
  if (v11)
  {
LABEL_11:
    long long v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v47 = v23;
      _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "Error creating Core ML custom layer implementation from factory for layer \"%s\".", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[(NSString *)self->_className UTF8String]);
    std::string v24 = std::string::insert(&v42, 0, "Error creating Core ML custom layer implementation from factory for layer \"");
    long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    id v26 = std::string::append(&v43, "\".");
    std::string __p = *v26;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v26->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    objc_storeStrong((id *)&v47[4], v11);
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1EF12FA70] & 1) == 0)
  {
    std::string v28 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      std::vector<int> v29 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v47 = v29;
      _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, "Core ML custom Layer implementation '%s' does not conform to the MLCustomLayer protocol.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[(NSString *)self->_className UTF8String]);
    long long v30 = std::string::insert(&v42, 0, "Core ML custom Layer implementation '");
    long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&v43, "' does not conform to the MLCustomLayer protocol");
    std::string __p = *v32;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    v33 = *(void **)&v47[4];
    *(void *)&v47[4] = 0;

    v34 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v34, (id *)buf);
  }
  char v16 = self->_customImpl;
  id v41 = 0;
  long long v17 = [(MLCustomLayer *)v16 outputShapesForInputShapes:v10 error:&v41];
  id v18 = v41;
  id v19 = v41;
  if (!v17 || v19)
  {
    std::string v35 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      std::string v36 = [(NSString *)self->_className UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)v47 = v36;
      _os_log_error_impl(&dword_19E58B000, v35, OS_LOG_TYPE_ERROR, "Error getting Core ML custom layer output shapes for layer \"%s\".", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[(NSString *)self->_className UTF8String]);
    v37 = std::string::insert(&v42, 0, "Error getting Core ML custom layer output shapes for layer \"");
    long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v38;
    v37->__r_.__value_.__l.__size_ = 0;
    v37->__r_.__value_.__r.__words[2] = 0;
    v37->__r_.__value_.__r.__words[0] = 0;
    v39 = std::string::append(&v43, "\".");
    std::string __p = *v39;
    v39->__r_.__value_.__l.__size_ = 0;
    v39->__r_.__value_.__r.__words[2] = 0;
    v39->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (long long *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    objc_storeStrong((id *)&v47[4], v18);
    v40 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v40, (id *)buf);
  }
  long long v20 = +[MLCustomLayerWrapper coremlShapesToEspressoShapes:v17 ndMode:self->_ndMode];

  return v20;
}

+ (id)factory
{
  if (+[MLCustomLayerWrapper factory]::onceToken != -1) {
    dispatch_once(&+[MLCustomLayerWrapper factory]::onceToken, &__block_literal_global_7058);
  }
  v2 = (void *)+[MLCustomLayerWrapper factory]::factory;

  return v2;
}

void __31__MLCustomLayerWrapper_factory__block_invoke()
{
  v0 = objc_alloc_init(MLDefaultCustomLayerFactory);
  v1 = (void *)+[MLCustomLayerWrapper factory]::factory;
  +[MLCustomLayerWrapper factory]::factory = (uint64_t)v0;
}

+ (id)espressoTensorsToCoremlTensors:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    int v8 = [v5 objectAtIndexedSubscript:i];
    unsigned int v9 = +[MLCustomLayerWrapper espressoTensorToCoremlTensor:v8 ndMode:v4];
    [v6 setObject:v9 atIndexedSubscript:i];
  }

  return v6;
}

+ (id)espressoTensorsToCoremlTensorsGPU:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  for (unint64_t i = 0; i < [v3 count]; ++i)
  {
    id v6 = [v3 objectAtIndexedSubscript:i];
    id v7 = [v6 texture];
    [v4 setObject:v7 atIndexedSubscript:i];
  }

  return v4;
}

+ (id)espressoTensorToCoremlTensor:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 shape];
  id v7 = +[MLCustomLayerWrapper espressoShapeToCoremlShape:v6 ndMode:v4];

  int v8 = [v5 shape];
  unsigned int v9 = +[MLCustomLayerWrapper getStrides:v8];

  id v10 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", [v5 rawPointer], v7, 65568, v9, 0, 0);

  return v10;
}

+ (id)getStrides:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "channels")* objc_msgSend(v3, "batch")* objc_msgSend(v3, "height")* objc_msgSend(v3, "width"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "height")* objc_msgSend(v3, "channels", v4)* objc_msgSend(v3, "width"));
  v10[1] = v5;
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "width") * objc_msgSend(v3, "height"));
  v10[2] = v6;
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "width"));
  v10[3] = v7;
  v10[4] = &unk_1EF11A190;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

+ (id)coremlShapesToEspressoShapes:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    int v8 = [v5 objectAtIndexedSubscript:i];
    unsigned int v9 = +[MLCustomLayerWrapper coremlShapeToEspressoShape:v8 ndMode:v4];
    [v6 setObject:v9 atIndexedSubscript:i];
  }

  return v6;
}

+ (id)coremlShapeToEspressoShape:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  if (v4)
  {
    uint64_t v7 = [v5 count];
    [v6 setRank:v7];
    [v6 setWidth:1];
    [v6 setHeight:1];
    [v6 setChannels:1];
    [v6 setBatch:1];
    [v6 setSequence:1];
    if ((int)v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = (v7 - 1);
      uint64_t v10 = (int)v7 - 5;
      uint64_t v22 = (v7 - 4);
      uint64_t v23 = (v7 - 3);
      uint64_t v24 = (v7 - 2);
      do
      {
        if (!v8)
        {
          id v11 = [v5 objectAtIndexedSubscript:v9];
          objc_msgSend(v6, "setWidth:", objc_msgSend(v11, "intValue"));
        }
        if (!(v9 - v24 + v8))
        {
          id v12 = [v5 objectAtIndexedSubscript:v24];
          objc_msgSend(v6, "setHeight:", objc_msgSend(v12, "intValue"));
        }
        if (!(v9 - v23 + v8))
        {
          id v13 = [v5 objectAtIndexedSubscript:v23];
          objc_msgSend(v6, "setChannels:", objc_msgSend(v13, "intValue"));
        }
        if (!(v9 - v22 + v8))
        {
          uint64_t v14 = [v5 objectAtIndexedSubscript:v22];
          objc_msgSend(v6, "setBatch:", objc_msgSend(v14, "intValue"));
        }
        if (v9 + v8 <= v10)
        {
          uint64_t v15 = objc_msgSend(v5, "objectAtIndexedSubscript:");
          objc_msgSend(v6, "setSequence:", objc_msgSend(v6, "sequence") * objc_msgSend(v15, "intValue"));
        }
        --v8;
      }
      while (v9 + v8 + 1 > 0);
    }
  }
  else
  {
    char v16 = [v5 objectAtIndexedSubscript:0];
    objc_msgSend(v6, "setSequence:", objc_msgSend(v16, "intValue"));

    long long v17 = [v5 objectAtIndexedSubscript:1];
    objc_msgSend(v6, "setBatch:", objc_msgSend(v17, "intValue"));

    id v18 = [v5 objectAtIndexedSubscript:2];
    objc_msgSend(v6, "setChannels:", objc_msgSend(v18, "intValue"));

    id v19 = [v5 objectAtIndexedSubscript:3];
    objc_msgSend(v6, "setHeight:", objc_msgSend(v19, "intValue"));

    long long v20 = [v5 objectAtIndexedSubscript:4];
    objc_msgSend(v6, "setWidth:", objc_msgSend(v20, "intValue"));
  }

  return v6;
}

+ (id)espressoShapesToCoremlShapes:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:i];
    uint64_t v9 = +[MLCustomLayerWrapper espressoShapeToCoremlShape:v8 ndMode:v4];
    [v6 setObject:v9 atIndexedSubscript:i];
  }

  return v6;
}

+ (id)espressoShapeToCoremlShape:(id)a3 ndMode:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    switch([v5 rank])
    {
      case 1u:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
        v20[0] = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        break;
      case 2u:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "height"));
        v19[0] = v7;
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
        v19[1] = v9;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
        goto LABEL_8;
      case 3u:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "channels"));
        v18[0] = v7;
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "height"));
        v18[1] = v9;
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
        v18[2] = v10;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
        goto LABEL_7;
      case 4u:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "batch"));
        v17[0] = v7;
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "channels"));
        v17[1] = v9;
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "height"));
        v17[2] = v10;
        id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
        v17[3] = v11;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
        goto LABEL_6;
      default:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "sequence"));
        v16[0] = v7;
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "batch"));
        v16[1] = v9;
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "channels"));
        v16[2] = v10;
        id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "height"));
        v16[3] = v11;
        id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
        v16[4] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
        goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "sequence"));
    v15[0] = v7;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "batch"));
    v15[1] = v9;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "channels"));
    v15[2] = v10;
    id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "height"));
    v15[3] = v11;
    id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "width"));
    v15[4] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
LABEL_5:
    uint64_t v8 = (void *)v13;

LABEL_6:
LABEL_7:

LABEL_8:
  }

  return v8;
}

@end