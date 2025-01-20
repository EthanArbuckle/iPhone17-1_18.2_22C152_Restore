@interface MLProgramContainer
+ (BOOL)populateInputNameToShapeMap:(void *)a3 fromContainer:(id)a4 forFunction:(const void *)a5 program:(const void *)a6 withValidation:(BOOL)a7 error:(id *)a8;
+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (shared_ptr<MIL::IRProgram>)loadProgramFromCompiledArchive:(void *)a3 error:(id *)a4;
+ (unique_ptr<MIL::IRProgram,)loadProgramAtURL:(id)a3 error:(id *)a4;
+ (void)updateOptionalDefaultValueParametersInContainer:(id)a3 usingProgram:(const void *)a4 functionName:(id)a5 modelDescription:(id)a6;
@end

@implementation MLProgramContainer

+ (unique_ptr<MIL::IRProgram,)loadProgramAtURL:(id)a3 error:(id *)a4
{
  v6 = v4;
  id v7 = a3;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    v11 = [v7 path];
    std::string::basic_string[abi:ne180100]<0>(&__p, v11);
    CoreML::NNCompiler::Backend::MIL::LoadProgram();
  }
  *a4 = +[MLModelErrorUtils IOErrorWithFormat:@"Error in reading the MIL network."];
  void *v6 = 0;

  return v12;
}

+ (BOOL)populateInputNameToShapeMap:(void *)a3 fromContainer:(id)a4 forFunction:(const void *)a5 program:(const void *)a6 withValidation:(BOOL)a7 error:(id *)a8
{
  BOOL v199 = a7;
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v197 = a4;
  v211[0] = 0;
  v211[1] = 0;
  v209[1] = 0;
  v210 = (uint64_t *)v211;
  v208 = v209;
  v209[0] = 0;
  v201 = (std::string *)a5;
  uint64_t Function = MIL::IRProgram::GetFunction();
  (*(void (**)(const void *))(*(void *)a6 + 40))(a6);
  v217[0] = 0;
  v217[1] = 0;
  v216 = (uint64_t *)v217;
  MIL::Attributes::FlexibleShapeInfo::Make();
  unint64_t __val = Function;
  MIL::Attributes::FlexibleShapeInfo::TryGetDefaultShapes((uint64_t *)&v215, (MIL::Attributes::FlexibleShapeInfo *)v213.__r_.__value_.__l.__data_);
  if (v215.__r_.__value_.__r.__words[0])
  {
    for (i = *(void **)(v215.__r_.__value_.__r.__words[0] + 16); i; i = (void *)*i)
    {
      memset(&v218, 0, sizeof(v218));
      std::vector<int>::reserve(&v218, (uint64_t)(i[6] - i[5]) >> 3);
      uint64_t v12 = i[5];
      uint64_t v13 = i[6];
      if (v12 != v13)
      {
        std::vector<int>::pointer end = v218.__end_;
        value = v218.__end_cap_.__value_;
        std::vector<int>::pointer begin = v218.__begin_;
        do
        {
          uint64_t v17 = (*(uint64_t (**)(void))(**(void **)v12 + 16))();
          if (v17) {
            int v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 48))(v17);
          }
          else {
            int v18 = 1;
          }
          if (end >= value)
          {
            uint64_t v19 = end - begin;
            unint64_t v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 62) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            if (((char *)value - (char *)begin) >> 1 > v20) {
              unint64_t v20 = ((char *)value - (char *)begin) >> 1;
            }
            if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v21);
            }
            else {
              uint64_t v22 = 0;
            }
            v23 = (int *)(v21 + 4 * v19);
            int *v23 = v18;
            v24 = v23 + 1;
            while (end != begin)
            {
              int v25 = *--end;
              *--v23 = v25;
            }
            value = (int *)(v21 + 4 * v22);
            if (begin) {
              operator delete(begin);
            }
            std::vector<int>::pointer begin = v23;
            std::vector<int>::pointer end = v24;
          }
          else
          {
            *end++ = v18;
          }
          v12 += 8;
        }
        while (v12 != v13);
        v218.__end_ = end;
        v218.__end_cap_.__value_ = value;
        v218.__begin_ = begin;
      }
      v214.__r_.__value_.__r.__words[0] = (std::string::size_type)(i + 2);
      v26 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v216, i + 2, (long long **)&v214);
      v27 = (void *)v26[7];
      if (v27)
      {
        v26[8] = (uint64_t)v27;
        operator delete(v27);
        v26[7] = 0;
        v26[8] = 0;
        v26[9] = 0;
      }
      *(std::vector<int> *)(v26 + 7) = v218;
    }
  }
  if (v215.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v215.__r_.__value_.__l.__size_);
  }
  v28 = (MIL::Attributes::FlexibleShapeInfo *)v213.__r_.__value_.__r.__words[0];
  v213.__r_.__value_.__r.__words[0] = 0;
  if (v28)
  {
    MIL::Attributes::FlexibleShapeInfo::~FlexibleShapeInfo(v28);
    MEMORY[0x19F3C1920]();
  }
  v29 = (void *)(*(uint64_t (**)(unint64_t))(*(void *)__val + 128))(__val);
  v30 = (void *)*v29;
  if ((void *)*v29 != v29 + 1)
  {
    v200 = v29 + 1;
    while (1)
    {
      uint64_t v31 = (*(uint64_t (**)(void))(*(void *)v30[7] + 24))(v30[7]);
      if (!v31)
      {
        v32 = (MIL::IRStateValueType *)MIL::IRValueType::TryCastAsStateType((MIL::IRValueType *)v30[7]);
        if (!v32
          || (uint64_t WrappedType = MIL::IRStateValueType::GetWrappedType(v32),
              (uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)WrappedType + 24))(WrappedType)) == 0))
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::operator+<char>();
          v193 = std::string::append(&v215, "' is not of type tensor");
          long long v194 = *(_OWORD *)&v193->__r_.__value_.__l.__data_;
          v218.__end_cap_.__value_ = (int *)v193->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v218.__begin_ = v194;
          v193->__r_.__value_.__l.__size_ = 0;
          v193->__r_.__value_.__r.__words[2] = 0;
          v193->__r_.__value_.__r.__words[0] = 0;
          std::runtime_error::runtime_error(exception, (const std::string *)&v218);
          __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
      }
      if (((*(uint64_t (**)(uint64_t))(*(void *)v31 + 104))(v31) & 1) == 0)
      {
        v171 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v172 = std::string::append(&v215, "' does not have fixed rank");
        long long v173 = *(_OWORD *)&v172->__r_.__value_.__l.__data_;
        v218.__end_cap_.__value_ = (int *)v172->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__begin_ = v173;
        v172->__r_.__value_.__l.__size_ = 0;
        v172->__r_.__value_.__r.__words[2] = 0;
        v172->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v171, (const std::string *)&v218);
        __cxa_throw(v171, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      v34 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 96))(v31);
      uint64_t v36 = *v34;
      uint64_t v35 = v34[1];
      uint64_t v37 = *v34;
      if (*v34 != v35)
      {
        do
        {
          if ((*(unsigned int (**)(void))(**(void **)v36 + 32))())
          {
            v162 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::operator+<char>();
            v163 = std::string::append(&v215, "' consists variadic dimension which is not supported");
            long long v164 = *(_OWORD *)&v163->__r_.__value_.__l.__data_;
            v218.__end_cap_.__value_ = (int *)v163->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v218.__begin_ = v164;
            v163->__r_.__value_.__l.__size_ = 0;
            v163->__r_.__value_.__r.__words[2] = 0;
            v163->__r_.__value_.__r.__words[0] = 0;
            std::runtime_error::runtime_error(v162, (const std::string *)&v218);
            __cxa_throw(v162, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          v36 += 8;
        }
        while (v36 != v35);
        uint64_t v36 = *v34;
        uint64_t v37 = v34[1];
      }
      unint64_t v38 = v37 - v36;
      uint64_t __vala = (v37 - v36) >> 3;
      if (!std::string::compare(v201, "main") && (unint64_t)(((v37 - v36) >> 3) - 6) < 0xFFFFFFFFFFFFFFFBLL)
      {
        v174 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v175 = std::string::append(&v213, "' is ");
        long long v176 = *(_OWORD *)&v175->__r_.__value_.__l.__data_;
        v214.__r_.__value_.__r.__words[2] = v175->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v214.__r_.__value_.__l.__data_ = v176;
        v175->__r_.__value_.__l.__size_ = 0;
        v175->__r_.__value_.__r.__words[2] = 0;
        v175->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v212, __vala);
        if ((v212.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v177 = &v212;
        }
        else {
          v177 = (std::string *)v212.__r_.__value_.__r.__words[0];
        }
        if ((v212.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v212.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v212.__r_.__value_.__l.__size_;
        }
        v179 = std::string::append(&v214, (const std::string::value_type *)v177, size);
        long long v180 = *(_OWORD *)&v179->__r_.__value_.__l.__data_;
        v215.__r_.__value_.__r.__words[2] = v179->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v215.__r_.__value_.__l.__data_ = v180;
        v179->__r_.__value_.__l.__size_ = 0;
        v179->__r_.__value_.__r.__words[2] = 0;
        v179->__r_.__value_.__r.__words[0] = 0;
        v181 = std::string::append(&v215, ", but it should be between 1 and 5");
        long long v182 = *(_OWORD *)&v181->__r_.__value_.__l.__data_;
        v218.__end_cap_.__value_ = (int *)v181->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__begin_ = v182;
        v181->__r_.__value_.__l.__size_ = 0;
        v181->__r_.__value_.__r.__words[2] = 0;
        v181->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v174, (const std::string *)&v218);
        __cxa_throw(v174, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (std::string::compare(v201, "main") && v38 >= 0x29)
      {
        v183 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v184 = std::string::append(&v213, "' is ");
        long long v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
        v214.__r_.__value_.__r.__words[2] = v184->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v214.__r_.__value_.__l.__data_ = v185;
        v184->__r_.__value_.__l.__size_ = 0;
        v184->__r_.__value_.__r.__words[2] = 0;
        v184->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v212, __vala);
        if ((v212.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v186 = &v212;
        }
        else {
          v186 = (std::string *)v212.__r_.__value_.__r.__words[0];
        }
        if ((v212.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v187 = HIBYTE(v212.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v187 = v212.__r_.__value_.__l.__size_;
        }
        v188 = std::string::append(&v214, (const std::string::value_type *)v186, v187);
        long long v189 = *(_OWORD *)&v188->__r_.__value_.__l.__data_;
        v215.__r_.__value_.__r.__words[2] = v188->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v215.__r_.__value_.__l.__data_ = v189;
        v188->__r_.__value_.__l.__size_ = 0;
        v188->__r_.__value_.__r.__words[2] = 0;
        v188->__r_.__value_.__r.__words[0] = 0;
        v190 = std::string::append(&v215, ", but it should be between 0 and 5");
        long long v191 = *(_OWORD *)&v190->__r_.__value_.__l.__data_;
        v218.__end_cap_.__value_ = (int *)v190->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__begin_ = v191;
        v190->__r_.__value_.__l.__size_ = 0;
        v190->__r_.__value_.__r.__words[2] = 0;
        v190->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v183, (const std::string *)&v218);
        __cxa_throw(v183, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v208, v30 + 4, (long long **)&v218)+ 14) = v38 >> 3;
      v39 = v217[0];
      if (!v217[0]) {
        goto LABEL_58;
      }
      v40 = (uint64_t *)v217;
      do
      {
        v41 = v40;
        v42 = v39 + 4;
        BOOL v43 = google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v39 + 4, v30 + 4);
        v44 = v39 + 1;
        if (!v43)
        {
          v44 = v39;
          v40 = v39;
        }
        v39 = (void *)*v44;
      }
      while (*v44);
      if (v40 == (uint64_t *)v217
        || (!v43 ? (v45 = v42) : (v45 = v41 + 4),
            google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v30 + 4, v45)))
      {
LABEL_58:
        uint64_t v47 = *v34;
        uint64_t v46 = v34[1];
        while (v47 != v46)
        {
          if (!(*(uint64_t (**)(void))(**(void **)v47 + 16))())
          {
            v165 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::operator+<char>();
            v166 = std::string::append(&v215, " which has unknown dimensions.");
            long long v167 = *(_OWORD *)&v166->__r_.__value_.__l.__data_;
            v218.__end_cap_.__value_ = (int *)v166->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v218.__begin_ = v167;
            v166->__r_.__value_.__l.__size_ = 0;
            v166->__r_.__value_.__r.__words[2] = 0;
            v166->__r_.__value_.__r.__words[0] = 0;
            std::runtime_error::runtime_error(v165, (const std::string *)&v218);
            __cxa_throw(v165, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          v47 += 8;
        }
        v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
        v48 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218);
        v49 = v48;
        uint64_t v51 = v48[7];
        v50 = (_DWORD *)v48[8];
        uint64_t v52 = (uint64_t)v50 - v51;
        if ((unint64_t)v50 - v51 >= 0x14)
        {
          uint64_t v64 = (v37 - v36) >> 3;
          if ((_DWORD *)((char *)v50 - v51) != (_DWORD *)20) {
            v48[8] = v51 + 20;
          }
        }
        else
        {
          uint64_t v53 = v52 >> 2;
          unint64_t v54 = 5 - (v52 >> 2);
          uint64_t v55 = v48[9];
          if (v54 <= (v55 - (uint64_t)v50) >> 2)
          {
            v66 = &v50[v54];
            uint64_t v67 = 20 - 4 * v53;
            do
            {
              *v50++ = 1;
              v67 -= 4;
            }
            while (v67);
            v48[8] = (uint64_t)v66;
            uint64_t v64 = (v37 - v36) >> 3;
          }
          else
          {
            unint64_t v56 = v55 - v51;
            unint64_t v57 = (v55 - v51) >> 1;
            if (v57 <= 5) {
              unint64_t v57 = 5;
            }
            if (v56 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v58 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v58 = v57;
            }
            v59 = std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v58);
            v61 = (char *)&v59[v53];
            do
              v59[v53++] = 1;
            while (v53 != 5);
            v62 = (char *)v49[7];
            v63 = (char *)v49[8];
            if (v63 == v62)
            {
              uint64_t v64 = (v37 - v36) >> 3;
            }
            else
            {
              uint64_t v64 = (v37 - v36) >> 3;
              do
              {
                int v65 = *((_DWORD *)v63 - 1);
                v63 -= 4;
                *((_DWORD *)v61 - 1) = v65;
                v61 -= 4;
              }
              while (v63 != v62);
            }
            v49[7] = (uint64_t)v61;
            v49[8] = (uint64_t)(v59 + 5);
            v49[9] = (uint64_t)&v59[v60];
            if (v62) {
              operator delete(v62);
            }
          }
        }
        if (v37 == v36)
        {
          int v87 = 1;
        }
        else
        {
          uint64_t v85 = *(void *)(*v34 + 8 * v64 - 8);
          uint64_t v86 = (*(uint64_t (**)(uint64_t))(*(void *)v85 + 16))(v85);
          int v87 = (*(uint64_t (**)(uint64_t))(*(void *)v86 + 48))(v86);
        }
        v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
        *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7]+ 16) = v87;
        if (v38 >= 9)
        {
          uint64_t v88 = *(void *)(*v34 + 8 * v64 - 16);
          uint64_t v89 = (*(uint64_t (**)(uint64_t))(*(void *)v88 + 16))(v88);
          int v90 = (*(uint64_t (**)(uint64_t))(*(void *)v89 + 48))(v89);
          v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
          *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7]+ 12) = v90;
          if (v38 > 0x10)
          {
            uint64_t v91 = *(void *)(*v34 + 8 * v64 - 24);
            uint64_t v92 = (*(uint64_t (**)(uint64_t))(*(void *)v91 + 16))(v91);
            int v93 = (*(uint64_t (**)(uint64_t))(*(void *)v92 + 48))(v92);
            v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
            *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7]+ 8) = v93;
            if (v38 >= 0x19)
            {
              uint64_t v94 = *(void *)(*v34 + 8 * v64 - 32);
              uint64_t v95 = (*(uint64_t (**)(uint64_t))(*(void *)v94 + 16))(v94);
              int v96 = (*(uint64_t (**)(uint64_t))(*(void *)v95 + 48))(v95);
              v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
              *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7]+ 4) = v96;
              if (v38 >= 0x21)
              {
                uint64_t v97 = *(void *)(*v34 + 8 * v64 - 40);
                uint64_t v98 = (*(uint64_t (**)(uint64_t))(*(void *)v97 + 16))(v97);
                int v99 = (*(uint64_t (**)(uint64_t))(*(void *)v98 + 48))(v98);
                v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
                *(_DWORD *)std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7] = v99;
              }
            }
          }
        }
        goto LABEL_156;
      }
      uint64_t v68 = *v34;
      uint64_t v69 = v34[1];
      if ((v69 - *v34) >> 3 != (v40[8] - v40[7]) >> 2) {
        goto LABEL_203;
      }
      if (v69 != v68)
      {
        unint64_t v70 = 0;
        while (1)
        {
          uint64_t v71 = (*(uint64_t (**)(void))(**(void **)(v68 + 8 * v70) + 16))(*(void *)(v68 + 8 * v70));
          if (v71)
          {
            if (*(_DWORD *)(v40[7] + 4 * v70) != (*(unsigned int (**)(uint64_t))(*(void *)v71 + 48))(v71)) {
              break;
            }
          }
          ++v70;
          uint64_t v68 = *v34;
          if (v70 >= (v34[1] - *v34) >> 3) {
            goto LABEL_86;
          }
        }
LABEL_203:
        v168 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v169 = std::string::append(&v215, " doesn't match with declared shape in function");
        long long v170 = *(_OWORD *)&v169->__r_.__value_.__l.__data_;
        v218.__end_cap_.__value_ = (int *)v169->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__begin_ = v170;
        v169->__r_.__value_.__l.__size_ = 0;
        v169->__r_.__value_.__r.__words[2] = 0;
        v169->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v168, (const std::string *)&v218);
        __cxa_throw(v168, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
LABEL_86:
      v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
      v72 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218);
      v73 = v72;
      if (v40 != v72) {
        break;
      }
LABEL_118:
      if (v38 <= 0x27)
      {
        v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
        v105 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218);
        v218.__begin_ = (std::vector<int>::pointer)(v30 + 4);
        v106 = (std::vector<int> *)std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v210, v30 + 4, (long long **)&v218)[7];
        unint64_t v107 = 5 - __vala;
        LODWORD(v218.__begin_) = 1;
        v108 = (char *)v105[8];
        uint64_t v109 = v105[9];
        if (5 - __vala <= (unint64_t)((v109 - (uint64_t)v108) >> 2))
        {
          uint64_t v117 = v108 - (char *)v106;
          if (v107 <= (v108 - (char *)v106) >> 2)
          {
            v120 = (char *)v105[8];
            uint64_t v119 = 5 - __vala;
LABEL_134:
            v121 = &v120[-4 * v107];
            v122 = v120;
            while (v121 < v108)
            {
              int v123 = *(_DWORD *)v121;
              v121 += 4;
              *(_DWORD *)v122 = v123;
              v122 += 4;
            }
            v124 = (char *)v106 + 4 * v107;
            v105[8] = (uint64_t)v122;
            if (v120 != v124) {
              memmove(&v120[-4 * ((v120 - v124) >> 2)], v106, v120 - v124);
            }
            v125 = &v218;
            if (v106 <= &v218)
            {
              if (v105[8] <= (unint64_t)&v218) {
                uint64_t v126 = 0;
              }
              else {
                uint64_t v126 = 5 - __vala;
              }
              v125 = (std::vector<int> *)((char *)&v218 + 4 * v126);
            }
            do
            {
              LODWORD(v106->__begin_) = v125->__begin_;
              v106 = (std::vector<int> *)((char *)v106 + 4);
              --v119;
            }
            while (v119);
            goto LABEL_156;
          }
          uint64_t v118 = 0;
          uint64_t v119 = v117 >> 2;
          v120 = &v108[4 * (v107 - (v117 >> 2))];
          do
          {
            *(_DWORD *)&v108[v118] = v218.__begin_;
            v118 += 4;
          }
          while (20 - 4 * (__vala + v119) != v118);
          v105[8] = (uint64_t)v120;
          if (v108 != (char *)v106) {
            goto LABEL_134;
          }
        }
        else
        {
          uint64_t v110 = v105[7];
          unint64_t v111 = v107 + ((uint64_t)&v108[-v110] >> 2);
          if (v111 >> 62) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v112 = v109 - v110;
          if (v112 >> 1 > v111) {
            unint64_t v111 = v112 >> 1;
          }
          if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v113 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v113 = v111;
          }
          if (v113)
          {
            v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v113);
            uint64_t v116 = v115;
          }
          else
          {
            v114 = 0;
            uint64_t v116 = 0;
          }
          v127 = &v114[4 * (((uint64_t)v106 - v110) >> 2)];
          v128 = &v127[4 * v107];
          uint64_t v129 = 20 - 4 * __vala;
          v130 = v127;
          do
          {
            *(_DWORD *)v130 = v218.__begin_;
            v130 += 4;
            v129 -= 4;
          }
          while (v129);
          v131 = (std::vector<int> *)v105[7];
          if (v131 != v106)
          {
            v132 = v106;
            do
            {
              int value_high = HIDWORD(v132[-1].__end_cap_.__value_);
              v132 = (std::vector<int> *)((char *)v132 - 4);
              *((_DWORD *)v127 - 1) = value_high;
              v127 -= 4;
            }
            while (v132 != v131);
          }
          v134 = (char *)v105[8];
          int64_t v135 = v134 - (char *)v106;
          if (v134 != (char *)v106) {
            memmove(v128, v106, v134 - (char *)v106);
          }
          v136 = (void *)v105[7];
          v105[7] = (uint64_t)v127;
          v105[8] = (uint64_t)&v128[v135];
          v105[9] = (uint64_t)&v114[4 * v116];
          if (v136) {
            operator delete(v136);
          }
        }
      }
LABEL_156:
      v137 = (void *)v30[1];
      if (v137)
      {
        do
        {
          v138 = v137;
          v137 = (void *)*v137;
        }
        while (v137);
      }
      else
      {
        do
        {
          v138 = (void *)v30[2];
          BOOL v139 = *v138 == (void)v30;
          v30 = v138;
        }
        while (!v139);
      }
      v30 = v138;
      if (v138 == v200) {
        goto LABEL_162;
      }
    }
    v75 = v72 + 7;
    v74 = (char *)v72[7];
    v76 = (char *)v40[7];
    v77 = (char *)v40[8];
    size_t v78 = v77 - v76;
    unint64_t v79 = (v77 - v76) >> 2;
    uint64_t v80 = v72[9];
    if (v79 <= (v80 - (uint64_t)v74) >> 2)
    {
      v100 = v77;
      v83 = (void **)(v72 + 8);
      v101 = (unsigned char *)v72[8];
      unint64_t v102 = (v101 - v74) >> 2;
      if (v102 < v79)
      {
        if (v101 != v74)
        {
          memmove((void *)v72[7], v76, v101 - v74);
          v74 = (char *)*v83;
        }
        v103 = &v76[4 * v102];
        size_t v78 = v100 - v103;
        if (v100 == v103) {
          goto LABEL_117;
        }
        v104 = v74;
        goto LABEL_116;
      }
      if (v100 == v76)
      {
LABEL_117:
        *v83 = &v74[v78];
        goto LABEL_118;
      }
    }
    else
    {
      if (v74)
      {
        v72[8] = (uint64_t)v74;
        operator delete(v74);
        uint64_t v80 = 0;
        void *v75 = 0;
        v73[8] = 0;
        v73[9] = 0;
      }
      if ((v78 & 0x8000000000000000) != 0) {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v81 = v80 >> 1;
      if (v80 >> 1 <= v79) {
        uint64_t v81 = (v77 - v76) >> 2;
      }
      if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v82 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v82 = v81;
      }
      std::vector<int>::__vallocate[abi:ne180100](v73 + 7, v82);
      v84 = (char *)v73[8];
      v83 = (void **)(v73 + 8);
      v74 = v84;
      if (v77 == v76) {
        goto LABEL_117;
      }
    }
    v104 = v74;
    v103 = v76;
LABEL_116:
    memmove(v104, v103, v78);
    goto LABEL_117;
  }
LABEL_162:
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v217[0]);
  v140 = v210;
  if (v210 != (uint64_t *)v211)
  {
    do
    {
      v141 = v140 + 4;
      int v142 = *(_DWORD *)(v140[7] + 16);
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3, v140 + 4, (long long **)&v218)+ 14) = v142;
      int v143 = *(_DWORD *)(v140[7] + 12);
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 3, v140 + 4, (long long **)&v218)+ 14) = v143;
      int v144 = *(_DWORD *)(v140[7] + 8);
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 6, v140 + 4, (long long **)&v218)+ 14) = v144;
      int v145 = *(_DWORD *)(v140[7] + 4);
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 9, v140 + 4, (long long **)&v218)+ 14) = v145;
      int v146 = *(_DWORD *)v140[7];
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 12, v140 + 4, (long long **)&v218)+ 14) = v146;
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      int v147 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v208, v140 + 4, (long long **)&v218)+ 14);
      v218.__begin_ = (std::vector<int>::pointer)(v140 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 15, v140 + 4, (long long **)&v218)+ 14) = v147;
      if (v199)
      {
        v148 = [v197 inputLayerNames];
        v149 = v140 + 4;
        if (*((char *)v140 + 55) < 0) {
          v149 = (uint64_t *)*v141;
        }
        v150 = [NSString stringWithUTF8String:v149];
        char v151 = [v148 containsObject:v150];

        if ((v151 & 1) == 0)
        {
          if (a8)
          {
            if (*((char *)v140 + 55) < 0) {
              v141 = (uint64_t *)*v141;
            }
            +[MLModelErrorUtils genericErrorWithFormat:@"MIL program input, '%s', not found in Core ML model inputs", v141];
            BOOL v161 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_223;
          }
LABEL_222:
          BOOL v161 = 0;
          goto LABEL_223;
        }
      }
      v152 = (uint64_t *)v140[1];
      if (v152)
      {
        do
        {
          v153 = v152;
          v152 = (uint64_t *)*v152;
        }
        while (v152);
      }
      else
      {
        do
        {
          v153 = (uint64_t *)v140[2];
          BOOL v139 = *v153 == (void)v140;
          v140 = v153;
        }
        while (!v139);
      }
      v140 = v153;
    }
    while (v153 != (uint64_t *)v211);
  }
  if (!v199) {
    goto LABEL_192;
  }
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  v154 = [v197 inputLayerNames];
  uint64_t v155 = [v154 countByEnumeratingWithState:&v204 objects:v219 count:16];
  if (!v155) {
    goto LABEL_191;
  }
  uint64_t v156 = *(void *)v205;
  do
  {
    for (uint64_t j = 0; j != v155; ++j)
    {
      if (*(void *)v205 != v156) {
        objc_enumerationMutation(v154);
      }
      id v158 = *(id *)(*((void *)&v204 + 1) + 8 * j);
      std::string::basic_string[abi:ne180100]<0>(&v218, (char *)[v158 UTF8String]);
      v159 = v211[0];
      if (!v211[0])
      {
LABEL_184:
        int v160 = 1;
        goto LABEL_186;
      }
      while (google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(&v218, v159 + 4))
      {
LABEL_183:
        v159 = (void *)*v159;
        if (!v159) {
          goto LABEL_184;
        }
      }
      if (google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v159 + 4, &v218))
      {
        ++v159;
        goto LABEL_183;
      }
      int v160 = 0;
LABEL_186:
      if (SHIBYTE(v218.__end_cap_.__value_) < 0) {
        operator delete(v218.__begin_);
      }
      if (v160)
      {
        if (a8)
        {
          *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"Core ML model input, '%@', not found in MIL main program's inputs", v158];
        }

        goto LABEL_222;
      }
    }
    uint64_t v155 = [v154 countByEnumeratingWithState:&v204 objects:v219 count:16];
  }
  while (v155);
LABEL_191:

LABEL_192:
  BOOL v161 = 1;
LABEL_223:
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v209[0]);
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v211[0]);

  return v161;
}

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [a1 loadProgramFromCompiledArchive:a3 error:a7];
  if (!v50)
  {
    int v18 = 0;
    goto LABEL_38;
  }
  v15 = URLOfMILTextInArchive((_MLModelInputArchiver *)a3);
  v16 = [v15 path];
  uint64_t v17 = [a1 containerFromCompiledArchiveCommon:a3 filename:v16 modelVersionInfo:v12 compilerVersionInfo:v13 configuration:v14 error:a7];

  if (!*a7)
  {
    uint64_t v19 = [v17 modelDescription];
    std::string::basic_string[abi:ne180100]<0>(v48, "main");
    MIL::IRProgram::GetFunction();
    std::string::basic_string[abi:ne180100]<0>(&__p, "CoreML_IsRank5ArrayMapping");
    uint64_t Attribute = MIL::IRObject::TryGetAttribute();
    uint64_t v21 = Attribute;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (v21) {
        goto LABEL_7;
      }
    }
    else if (Attribute)
    {
LABEL_7:
      int v22 = MIL::IRValue::GetScalar<BOOL>();
      goto LABEL_10;
    }
    int v22 = 0;
LABEL_10:
    [v17 setNdArrayInterpretation:v22 ^ 1u];
    if (v49 < 0) {
      operator delete(v48[0]);
    }
    [v17 setModelIsMIL:1];
    uint64_t v23 = v50;
    std::string::basic_string[abi:ne180100]<0>(&__p, "train");
    uint64_t v24 = (*(uint64_t (**)(uint64_t, std::string *))(*(void *)v23 + 56))(v23, &__p);
    uint64_t v25 = v24;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (!v25) {
        goto LABEL_17;
      }
    }
    else if (!v24)
    {
LABEL_17:
      std::string::basic_string[abi:ne180100]<0>(v48, "main");
      uint64_t Function = MIL::IRProgram::GetFunction();
      uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)Function + 40))(Function);
      v28 = (long long **)(*(uint64_t (**)(uint64_t))(*(void *)v27 + 88))(v27);
      memset(&__p, 0, sizeof(__p));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, *v28, v28[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v28[1] - (char *)*v28) >> 3));
      if (v49 < 0) {
        operator delete(v48[0]);
      }
      v29 = CoreML::stringArrayToObjC((uint64_t **)&__p);
      [v17 setOutputLayerNames:v29];

      v48[0] = (void **)&__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v48);
      uint64_t v30 = v50;
      uint64_t v31 = [NSString stringWithUTF8String:"main"];
      [a1 updateOptionalDefaultValueParametersInContainer:v17 usingProgram:v30 functionName:v31 modelDescription:v19];

      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
      *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
      v39[0] = 0;
      v39[1] = 0;
      unint64_t v38 = v39;
      v40 = v41;
      v41[0] = 0;
      v43[0] = 0;
      v43[1] = 0;
      v41[1] = 0;
      v42 = v43;
      v44 = v45;
      v45[0] = 0;
      v47[0] = 0;
      v47[1] = 0;
      v45[1] = 0;
      uint64_t v46 = v47;
      std::string::basic_string[abi:ne180100]<0>(v48, "main");
      char v32 = objc_msgSend(a1, "populateInputNameToShapeMap:fromContainer:forFunction:program:withValidation:error:", &__p, v17, v48, v50, objc_msgSend(v17, "modelIsTrainingProgram") ^ 1, a7);
      char v33 = v32;
      if (v49 < 0)
      {
        operator delete(v48[0]);
        if (v33) {
          goto LABEL_21;
        }
      }
      else if (v32)
      {
LABEL_21:
        if (v17 + 1 != (uint64_t **)&__p) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 1, __p.__r_.__value_.__l.__data_, &__p.__r_.__value_.__l.__size_);
        }
        if (v17 + 4 != (uint64_t **)&v38) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 4, v38, v39);
        }
        if (v17 + 7 != (uint64_t **)&v40) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 7, v40, v41);
        }
        if (v17 + 10 != (uint64_t **)&v42) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 10, v42, v43);
        }
        if (v17 + 13 != (uint64_t **)&v44) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 13, v44, v45);
        }
        if (v17 + 16 != (uint64_t **)&v46) {
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 16, v46, v47);
        }
        v34 = neuralNetworkOutputFromArchive(a3);
        uint64_t v35 = (void *)v19;
        [v17 setCompilerOutput:v34];

        int v18 = v17;
        goto LABEL_36;
      }
      int v18 = 0;
      uint64_t v35 = (void *)v19;
LABEL_36:
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v47[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v45[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v43[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v41[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v39[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)__p.__r_.__value_.__l.__size_);

      goto LABEL_37;
    }
    [v17 setModelIsTrainingProgram:1];
    goto LABEL_17;
  }
  int v18 = 0;
LABEL_37:

LABEL_38:
  if (v51) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v51);
  }

  return v18;
}

+ (shared_ptr<MIL::IRProgram>)loadProgramFromCompiledArchive:(void *)a3 error:(id *)a4
{
  v8 = v4;
  if ((*(unsigned int (**)(void, SEL))(**(void **)a3 + 56))(*(void *)a3, a2) == 1)
  {
    v9 = neuralNetworkOutputFromArchive(a3);
    id v14 = v9;
    if (v9)
    {
      [v9 program];
      BOOL v10 = *v8 == 0;
      v9 = v14;
      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      void *v8 = 0;
      v8[1] = 0;
      BOOL v10 = 1;
      if (!a4)
      {
LABEL_10:

        goto LABEL_14;
      }
    }
    if (v10)
    {
      *a4 = +[MLModelErrorUtils IOErrorWithFormat:@"Error in reading the in-memory MIL network."];
      v9 = v14;
    }
    goto LABEL_10;
  }
  v11 = URLOfMILTextInArchive((_MLModelInputArchiver *)a3);
  [a1 loadProgramAtURL:v11 error:a4];
  void *v8 = v15;
  if (v15) {
    operator new();
  }
  v8[1] = 0;

LABEL_14:
  result.__cntrl_ = v13;
  result.__ptr_ = v12;
  return result;
}

+ (void)updateOptionalDefaultValueParametersInContainer:(id)a3 usingProgram:(const void *)a4 functionName:(id)a5 modelDescription:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v8 = a5;
  id v36 = a6;
  id v34 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[v34 UTF8String]);
  MIL::IRProgram::GetFunction();
  v45 = 0;
  uint64_t v46 = 0;
  v44 = &v45;
  std::string::basic_string[abi:ne180100]<0>(__p, "CoreML_InputDefaultValues");
  uint64_t Attribute = MIL::IRObject::TryGetAttribute();
  BOOL v10 = (MIL::IRValue *)Attribute;
  if (SHIBYTE(v50) < 0)
  {
    operator delete(__p[0]);
    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  if (Attribute)
  {
LABEL_5:
    v11 = (MIL::IRDictionaryValue *)MIL::IRValue::AsDictionary(v10);
    id v12 = (void *)MIL::IRDictionaryValue::begin(v11);
    uint64_t v13 = MIL::IRDictionaryValue::end(v11);
    while (1)
    {
      if (v12 == (void *)v13) {
        goto LABEL_20;
      }
      MIL::IRValue::GetScalar<std::string>();
      MIL::IRValue::GetScalar<float>();
      int v15 = v14;
      *(_OWORD *)std::string __p = *(_OWORD *)v47;
      uint64_t v50 = v48;
      v47[1] = 0;
      uint64_t v48 = 0;
      v47[0] = 0;
      int v51 = v14;
      v16 = (char **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&v44, &v52, __p);
      if (*v16) {
        break;
      }
      uint64_t v17 = v16;
      int v18 = (char *)operator new(0x40uLL);
      uint64_t v19 = (std::string *)(v18 + 32);
      char v20 = HIBYTE(v50);
      if (SHIBYTE(v50) < 0)
      {
        std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      }
      else
      {
        *(_OWORD *)&v19->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        *((void *)v18 + 6) = v50;
      }
      *((_DWORD *)v18 + 14) = v15;
      uint64_t v21 = v52;
      *(void *)int v18 = 0;
      *((void *)v18 + 1) = 0;
      *((void *)v18 + 2) = v21;
      *uint64_t v17 = v18;
      if (*v44)
      {
        v44 = (uint64_t **)*v44;
        int v18 = *v17;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v45, (uint64_t *)v18);
      ++v46;
      if (v20 < 0) {
        goto LABEL_9;
      }
LABEL_10:
      if (SHIBYTE(v48) < 0) {
        operator delete(v47[0]);
      }
      id v12 = (void *)*v12;
    }
    if ((v50 & 0x8000000000000000) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    operator delete(__p[0]);
    goto LABEL_10;
  }
LABEL_20:
  if (v43 < 0) {
    operator delete(v42);
  }
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v36 inputDescriptionsByName];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v53 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v28 = [v23 objectForKeyedSubscript:v27];
        int v29 = [v28 isOptional];

        if (v29)
        {
          id v30 = v27;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v30 UTF8String]);
          uint64_t v31 = NSNumber;
          v47[0] = __p;
          LODWORD(v32) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v44, __p, (long long **)v47)+ 14);
          char v33 = [v31 numberWithFloat:v32];
          [v22 setObject:v33 forKeyedSubscript:v30];

          [v37 setObject:&unk_1EF11A610 forKeyedSubscript:v30];
          if (SHIBYTE(v50) < 0) {
            operator delete(__p[0]);
          }
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v53 count:16];
    }
    while (v24);
  }

  [v35 setOptionalInputDefaultValues:v22];
  [v35 setOptionalInputTypes:v37];
  [v35 setHasOptionalInputSequenceConcat:0];

  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)v45);
}

@end