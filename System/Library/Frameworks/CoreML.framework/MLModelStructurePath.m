@interface MLModelStructurePath
- (BOOL)isEqual:(id)a3;
- (BOOL)isMLProgramOperationPath;
- (BOOL)isNeuralNetworkLayerPath;
- (MLModelStructurePath)initWithCppPath:(Path *)a3;
- (MLModelStructurePath)initWithMLProgramOperationPathComponents:(id)a3 scopedModelNames:(id)a4 error:(id *)a5;
- (MLModelStructurePath)initWithNeuralNetworkLayerName:(id)a3 scopedModelNames:(id)a4;
- (NSArray)components;
- (Path)cppPath;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLModelStructurePath

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_cppPath = &self->_cppPath;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_cppPath);
}

- (Path)cppPath
{
  retstr->m_components.__begin_ = 0;
  retstr->m_components.__end_ = 0;
  retstr->m_components.__end_cap_.__value_ = 0;
  return (Path *)std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)retstr, (uint64_t)self->_cppPath.m_components.__begin_, (uint64_t)self->_cppPath.m_components.__end_, ((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5);
}

- (id)description
{
  v3 = NSString;
  v4 = [(MLModelStructurePath *)self components];
  v5 = [v3 stringWithFormat:@"<MLModelStructurePath: %p> %@", self, v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MLModelStructurePath allocWithZone:a3];
  memset(v7, 0, sizeof(v7));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v7, (uint64_t)self->_cppPath.m_components.__begin_, (uint64_t)self->_cppPath.m_components.__end_, ((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5);
  v5 = [(MLModelStructurePath *)v4 initWithCppPath:v7];
  v8 = (void **)v7;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v5;
}

- (NSArray)components
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5];
  begin = (char *)self->_cppPath.m_components.__begin_;
  for (i = (char *)self->_cppPath.m_components.__end_; begin != i; begin += 32)
  {
    uint64_t v6 = *((unsigned int *)begin + 6);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    v10 = &v9;
    v7 = ((void (*)(char **, char *))off_1EF0E5FB8[v6])(&v10, begin);
    [v3 addObject:v7];
  }

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  [(MLModelStructurePath *)self cppPath];
  uint64_t v2 = v9;
  if (v9 != v10)
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = *(unsigned int *)(v2 + 24);
      if (v4 == -1) {
        break;
      }
      uint64_t v5 = ((uint64_t (*)(char *, uint64_t))off_1EF0E5F70[v4])(&v12, v2);
      uint64_t v6 = *(unsigned int *)(v2 + 24);
      if (v6 == -1) {
        goto LABEL_7;
      }
LABEL_8:
      uint64_t v7 = __ROR8__(v6 + 16, 16);
      v3 ^= (v3 << 6)
          + (v3 >> 2)
          + 2654435769u
          + ((0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v5 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v5 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ v7)))) >> 47))) ^ v6);
      v2 += 32;
      if (v2 == v10) {
        goto LABEL_11;
      }
    }
    uint64_t v5 = 299792458;
LABEL_7:
    uint64_t v6 = -1;
    goto LABEL_8;
  }
  unint64_t v3 = 0;
LABEL_11:
  v11 = (void **)&v9;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v11);
  return v3;
}

- (BOOL)isMLProgramOperationPath
{
  end = self->_cppPath.m_components.__end_;
  return end != self->_cppPath.m_components.__begin_ && *(end - 2) == 4;
}

- (BOOL)isNeuralNetworkLayerPath
{
  end = self->_cppPath.m_components.__end_;
  return end != self->_cppPath.m_components.__begin_ && *(end - 2) == 6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MLModelStructurePath *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4)
      {
        [(MLModelStructurePath *)v4 cppPath];
        uint64_t v6 = v13;
        uint64_t v5 = v14;
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v5 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
      }
      begin = (char *)self->_cppPath.m_components.__begin_;
      end = (char *)self->_cppPath.m_components.__end_;
      if (end - begin == v5 - v6)
      {
        if (begin == end)
        {
          BOOL v7 = 1;
        }
        else
        {
          do
          {
            char v10 = std::operator==[abi:ne180100]<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>((uint64_t)begin, v6);
            BOOL v7 = v10;
            begin += 32;
            v6 += 32;
            if (begin == end) {
              char v11 = 0;
            }
            else {
              char v11 = v10;
            }
          }
          while ((v11 & 1) != 0);
        }
      }
      else
      {
        BOOL v7 = 0;
      }
      v16 = (void **)&v13;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v16);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (MLModelStructurePath)initWithMLProgramOperationPathComponents:(id)a3 scopedModelNames:(id)a4 error:(id *)a5
{
  v99[4] = *(void ***)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  LOBYTE(v82) = 0;
  char v84 = 0;
  id v8 = v6;
  id v75 = v7;
  id v9 = v8;
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  uint64_t v85 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v89;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v89 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v88 + 1) + 8 * v12);
        uint64_t v14 = [NSString stringWithUTF8String:"Type"];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];
        objc_opt_class();
        id v16 = v15;
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
        id v18 = v17;

        if (!v18)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::string::basic_string[abi:ne180100]<0>(&__p, "component");
          std::string::basic_string[abi:ne180100]<0>(v99, "Type");
          std::logic_error::logic_error(exception, &v94);
          __cxa_throw(exception, MEMORY[0x1E4FBA328], MEMORY[0x1E4FBA1B0]);
        }
        v19 = [v77 objectForKeyedSubscript:v18];
        int v20 = [v19 intValue];

        switch(v20)
        {
          case 1:
            int v95 = 0;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 2:
            int v95 = 1;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 3:
            id v28 = v13;
            v29 = [NSString stringWithUTF8String:"Name"];
            v30 = [v28 objectForKeyedSubscript:v29];
            objc_opt_class();
            id v31 = v30;
            if (objc_opt_isKindOfClass()) {
              v32 = v31;
            }
            else {
              v32 = 0;
            }
            id v33 = v32;

            id v34 = v33;
            std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v34 UTF8String]);
            v94.__r_.__value_.__l.__size_ = __p.__r_.__value_.__l.__size_;
            std::string::size_type v35 = __p.__r_.__value_.__r.__words[0];
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7);
            char v36 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            memset(&__p, 0, sizeof(__p));
            v94.__r_.__value_.__r.__words[0] = v35;
            *((unsigned char *)&v94.__r_.__value_.__s + 23) = v36;
            int v95 = 2;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }

            break;
          case 4:
            id v37 = v13;
            v38 = [NSString stringWithUTF8String:"Output"];
            v39 = [v37 objectForKeyedSubscript:v38];
            objc_opt_class();
            id v40 = v39;
            if (objc_opt_isKindOfClass()) {
              v41 = v40;
            }
            else {
              v41 = 0;
            }
            id v42 = v41;

            if (!v42)
            {
              v68 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "Operation");
              std::string::basic_string[abi:ne180100]<0>(v96, "Output");
              std::runtime_error::runtime_error(v68, &__p);
              __cxa_throw(v68, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            id v43 = v42;
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)[v43 UTF8String]);
            v44 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v93 + 7);
            char v45 = HIBYTE(v93);
            v92 = 0;
            long long v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
            *((unsigned char *)&v94.__r_.__value_.__s + 23) = v45;
            int v95 = 4;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0) {
              operator delete(v92);
            }
            goto LABEL_51;
          case 5:
            id v21 = v13;
            v22 = [NSString stringWithUTF8String:"Index"];
            v23 = [v21 objectForKeyedSubscript:v22];
            objc_opt_class();
            id v24 = v23;
            if (objc_opt_isKindOfClass()) {
              v25 = v24;
            }
            else {
              v25 = 0;
            }
            id v26 = v25;

            if (v26) {
              uint64_t v27 = [v26 integerValue];
            }
            else {
              uint64_t v27 = -1;
            }
            v94.__r_.__value_.__r.__words[0] = v27;
            int v95 = 3;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);

            break;
          case 6:
            int v95 = 5;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 7:
            id v37 = v13;
            v46 = [NSString stringWithUTF8String:"Name"];
            v47 = [v37 objectForKeyedSubscript:v46];
            objc_opt_class();
            id v48 = v47;
            if (objc_opt_isKindOfClass()) {
              v49 = v48;
            }
            else {
              v49 = 0;
            }
            id v50 = v49;

            if (!v50)
            {
              v70 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "NeuralNetwork");
              std::string::basic_string[abi:ne180100]<0>(v96, "Name");
              std::runtime_error::runtime_error(v70, &__p);
              __cxa_throw(v70, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            id v43 = v50;
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)[v43 UTF8String]);
            v51 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v93 + 7);
            char v52 = HIBYTE(v93);
            v92 = 0;
            long long v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v51;
            *((unsigned char *)&v94.__r_.__value_.__s + 23) = v52;
            int v95 = 6;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0) {
              operator delete(v92);
            }
            goto LABEL_51;
          case 8:
            int v95 = 7;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
LABEL_35:
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            break;
          case 9:
            id v37 = v13;
            v53 = [NSString stringWithUTF8String:"Name"];
            v54 = [v37 objectForKeyedSubscript:v53];
            objc_opt_class();
            id v55 = v54;
            if (objc_opt_isKindOfClass()) {
              v56 = v55;
            }
            else {
              v56 = 0;
            }
            id v57 = v56;

            if (!v57)
            {
              v69 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "Pipeline");
              std::string::basic_string[abi:ne180100]<0>(v96, "Name");
              std::runtime_error::runtime_error(v69, &__p);
              __cxa_throw(v69, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            id v43 = v57;
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)[v43 UTF8String]);
            v58 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v93 + 7);
            char v59 = HIBYTE(v93);
            v92 = 0;
            long long v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
            *((unsigned char *)&v94.__r_.__value_.__s + 23) = v59;
            int v95 = 8;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0) {
              operator delete(v92);
            }
LABEL_51:

            break;
          default:
            v71 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::string::basic_string[abi:ne180100]<0>(&__p, "component");
            std::string::basic_string[abi:ne180100]<0>(v99, "Type");
            std::logic_error::logic_error(v71, &v94);
            __cxa_throw(v71, MEMORY[0x1E4FBA328], MEMORY[0x1E4FBA1B0]);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v60 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
      uint64_t v10 = v60;
    }
    while (v60);
  }

  if (v86 == v85 || *(_DWORD *)(v86 - 8) != 4)
  {
    v72 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v72, "Not a path to an operation.");
    __cxa_throw(v72, MEMORY[0x1E4FBA328], MEMORY[0x1E4FBA1B0]);
  }
  uint64_t v61 = v85;
  uint64_t v62 = v86;
  if (v86 != v85)
  {
    if (!*(_DWORD *)(v86 - 8))
    {
      v73 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x19F3C1380](v73, "Failed to append path, path must be relative.");
      __cxa_throw(v73, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v98, v61);
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v88, (uint64_t)v98);
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v80, (uint64_t)&v88);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v88);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v98);
      v61 += 32;
    }
    while (v61 != v62);
  }
  v98[0] = (void **)&v85;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v98);

  if (v84)
  {
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__vdeallocate((void **)&v82);
    long long v63 = v80;
    uint64_t v64 = v81;
    uint64_t v81 = 0;
    long long v80 = 0uLL;
  }
  else
  {
    long long v63 = v80;
    uint64_t v64 = v81;
    uint64_t v81 = 0;
    long long v80 = 0uLL;
    char v84 = 1;
  }
  long long v82 = v63;
  uint64_t v83 = v64;
  v98[0] = (void **)&v80;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v98);
  if (v84)
  {
    long long v78 = v82;
    uint64_t v79 = v83;
    uint64_t v83 = 0;
    long long v82 = 0uLL;
    v65 = [(MLModelStructurePath *)self initWithCppPath:&v78];
    v99[0] = (void **)&v78;
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v99);
    if (v84)
    {
      v99[0] = (void **)&v82;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v99);
    }
    self = v65;
  }
  else
  {
    v65 = 0;
  }

  return v65;
}

- (MLModelStructurePath)initWithNeuralNetworkLayerName:(id)a3 scopedModelNames:(id)a4
{
  id v6 = a3;
  int v22 = 5;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)&v13, (uint64_t)v21);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v21);
  id v7 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 UTF8String]);
  v17 = __p;
  *(void *)id v18 = v16;
  *(void *)&v18[7] = *(void *)((char *)&v16 + 7);
  char v8 = HIBYTE(v16);
  long long v16 = 0uLL;
  std::string __p = 0;
  char v19 = v8;
  int v20 = 6;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)&v13, (uint64_t)&v17);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v17);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p);
  }

  long long v11 = v13;
  uint64_t v12 = v14;
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  id v9 = [(MLModelStructurePath *)self initWithCppPath:&v11];
  v21[0] = (void **)&v11;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v21);
  v21[0] = (void **)&v13;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v21);

  return v9;
}

- (MLModelStructurePath)initWithCppPath:(Path *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MLModelStructurePath;
  uint64_t v4 = [(MLModelStructurePath *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__vdeallocate(&v4->_cppPath.m_components.__begin_);
    *(_OWORD *)&v5->_cppPath.m_components.__begin_ = *(_OWORD *)&a3->m_components.__begin_;
    v5->_cppPath.m_components.__end_cap_.__value_ = a3->m_components.__end_cap_.__value_;
    a3->m_components.__begin_ = 0;
    a3->m_components.__end_ = 0;
    a3->m_components.__end_cap_.__value_ = 0;
  }
  return v5;
}

@end