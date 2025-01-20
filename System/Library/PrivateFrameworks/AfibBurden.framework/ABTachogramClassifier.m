@interface ABTachogramClassifier
- (ABTachogramClassifier)init;
- (id).cxx_construct;
- (id)classifyTachogram:(id)a3;
- (void)logToFileForTacho:(const void *)a3 withClassification:(id)a4;
@end

@implementation ABTachogramClassifier

- (ABTachogramClassifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABTachogramClassifier;
  if ([(ABTachogramClassifier *)&v3 init])
  {
    espresso_enable_autoinitialize();
    operator new();
  }

  return 0;
}

- (id)classifyTachogram:(id)a3
{
  v43[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33 = 0;
  unint64_t v34 = 0;
  unint64_t v35 = 0;
  v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x6012000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = "";
  memset(v43, 0, 24);
  v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x4812000000;
  v27 = __Block_byref_object_copy__302;
  v28 = __Block_byref_object_dispose__303;
  v29 = "";
  v31 = 0;
  uint64_t v32 = 0;
  __p = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __43__ABTachogramClassifier_classifyTachogram___block_invoke;
  v23[3] = &unk_265221450;
  v23[4] = &v24;
  v23[5] = &v37;
  [v4 _enumerateHeartbeatDataWithBlock:v23];
  uint64_t v5 = (uint64_t)(v25 + 6);
  if (v25[6] != v25[7])
  {
    v6 = v38;
    v7 = (uint64_t *)(v38 + 6);
    v8 = v38[7];
    if (v8 >= v38[8])
    {
      uint64_t v9 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v7, v5);
    }
    else
    {
      std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)v7, v5);
      uint64_t v9 = (uint64_t)(v8 + 3);
    }
    v6[7] = (const unsigned __int8 **)v9;
    v25[7] = v25[6];
  }
  if (v38[6] == v38[7])
  {
    v17 = ab_get_framework_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ABTachogramClassifier classifyTachogram:](v17);
    }

    v18 = 0;
  }
  else
  {
    v10 = [v4 UUID];
    [v10 getUUIDBytes:v38 + 10];

    v11 = ab_get_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v4 UUID];
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v12;
      _os_log_impl(&dword_2477CF000, v11, OS_LOG_TYPE_DEFAULT, "Classifying tachogram with UUID : %@", (uint8_t *)buf, 0xCu);
    }
    [v4 _startTimestamp];
    uint64_t v14 = (uint64_t)(v38 + 6);
    v38[9] = (const unsigned __int8 **)v13;
    unint64_t v15 = v34;
    if (v34 >= v35)
    {
      uint64_t v16 = std::vector<Tellurium::tellurium_input_t>::__push_back_slow_path<Tellurium::tellurium_input_t const&>((uint64_t *)&v33, v14);
    }
    else
    {
      std::vector<Tellurium::tellurium_input_t>::__construct_one_at_end[abi:ne180100]<Tellurium::tellurium_input_t const&>((uint64_t)&v33, v14);
      uint64_t v16 = v15 + 48;
    }
    unint64_t v34 = v16;
    Tellurium::tellurium_classifier_t::tellurium_classifier_process((uint64_t)self->_classifier.__ptr_.__value_, &v33);
    Tellurium::tellurium_classifier_t::tellurium_get_outputs((Tellurium::tellurium_classifier_t *)self->_classifier.__ptr_.__value_, (uint64_t)buf);
    if (*((void *)&buf[0] + 1) - *(void *)&buf[0] == 17)
    {
      v19 = objc_opt_new();
      if (v19)
      {
        v20 = [v4 UUID];
        [v19 setUuid:v20];

        v21 = [v4 startDate];
        [v19 setDate:v21];

        [v19 setAFibDetected:*(unsigned __int8 *)(*(void *)&buf[0] + 16)];
        [(ABTachogramClassifier *)self logToFileForTacho:v38 + 6 withClassification:v19];
        v19 = v19;
        v18 = v19;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v19 = ab_get_framework_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        [(ABTachogramClassifier *)(void *)buf + 1 classifyTachogram:v19];
      }
      v18 = 0;
    }

    if (*(void *)&buf[0])
    {
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
    }
  }
  _Block_object_dispose(&v24, 8);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v37, 8);
  v24 = (void **)v43;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v24);
  v37 = &v33;
  std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);

  return v18;
}

uint64_t __43__ABTachogramClassifier_classifyTachogram___block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void *)(v5 + 48);
    uint64_t v8 = *(void *)(v5 + 56);
    uint64_t v6 = v5 + 48;
    if (v8 != v7)
    {
      uint64_t v9 = *(uint64_t **)(*(void *)(a1 + 40) + 8);
      v10 = v9 + 6;
      unint64_t v11 = v9[7];
      if (v11 >= v9[8])
      {
        uint64_t v12 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v10, v6);
      }
      else
      {
        std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)v10, v6);
        uint64_t v12 = v11 + 24;
      }
      v9[7] = v12;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 48);
    }
  }
  double v13 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = (double *)v13[7];
  unint64_t v15 = v13[8];
  if ((unint64_t)v14 >= v15)
  {
    v17 = (double *)v13[6];
    uint64_t v18 = v14 - v17;
    if ((unint64_t)(v18 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v19 = v15 - (void)v17;
    unint64_t v20 = (uint64_t)(v15 - (void)v17) >> 2;
    if (v20 <= v18 + 1) {
      unint64_t v20 = v18 + 1;
    }
    if (v19 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v20;
    }
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v13 + 8), v21);
      v17 = (double *)v13[6];
      uint64_t v14 = (double *)v13[7];
    }
    else
    {
      v22 = 0;
    }
    v23 = (double *)&v22[8 * v18];
    v24 = &v22[8 * v21];
    double *v23 = a3;
    uint64_t v16 = v23 + 1;
    while (v14 != v17)
    {
      uint64_t v25 = *((void *)v14-- - 1);
      *((void *)v23-- - 1) = v25;
    }
    v13[6] = v23;
    v13[7] = v16;
    v13[8] = v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v14 = a3;
    uint64_t v16 = v14 + 1;
  }
  v13[7] = v16;
  return 1;
}

- (void)logToFileForTacho:(const void *)a3 withClassification:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  int out_token = -1;
  notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
  uint64_t state64 = 0;
  notify_get_state(out_token, &state64);
  if (state64)
  {
    uint64_t v6 = ab_get_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = state64;
      _os_log_impl(&dword_2477CF000, v6, OS_LOG_TYPE_DEFAULT, "ABTachogramClassifier : logging to file. notifyState is set to %llu", (uint8_t *)buf, 0xCu);
    }

    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v36 = *MEMORY[0x263F080A8];
    v37[0] = *MEMORY[0x263F08088];
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    id v31 = 0;
    char v9 = [v7 createDirectoryAtPath:@"/var/mobile/Library/Logs/AfBHIDDiagnostics/" withIntermediateDirectories:1 attributes:v8 error:&v31];
    id v10 = v31;

    if (v9)
    {
      std::to_string(__p, state64);
      unint64_t v11 = std::string::insert(__p, 0, "process_tacho_");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      buf[0].__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&buf[0].__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      double v13 = std::string::append(buf, ".json");
      long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      std::string::size_type v30 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)v29 = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
      [@"/var/mobile/Library/Logs/AfBHIDDiagnostics/" UTF8String];
      std::operator+<char>();
      std::ofstream::basic_ofstream((uint64_t *)buf);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v26, 0, 0, 0, 2);
      uint64_t v15 = *(void *)a3;
      uint64_t v16 = *((void *)a3 + 1);
      if (*(void *)a3 != v16)
      {
        do
        {
          __p[0].__r_.__value_.__s.__data_[0] = 0;
          __p[0].__r_.__value_.__l.__size_ = 0;
          nlohmann::detail::external_constructor<(nlohmann::detail::value_t)2>::construct<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<double>,0>((uint64_t)__p, v15);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v26, (uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&__p[0].__r_.__value_.__l.__size_, __p[0].__r_.__value_.__s.__data_[0]);
          v15 += 24;
        }
        while (v15 != v16);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v24, 0, 0, 0, 1);
      v17 = [v5 uuid];
      id v18 = [v17 UUIDString];
      v23 = (char *)[v18 UTF8String];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>((uint64_t)v24, "uuid", &v23, (uint64_t)__p);

      unint64_t v19 = [v5 date];
      [v19 timeIntervalSince1970];
      v23 = v20;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>((uint64_t)v24, "startDate", (uint64_t *)&v23, (uint64_t)__p);

      LOBYTE(v23) = [v5 aFibDetected];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>((uint64_t)v24, "afibDetected", (unsigned __int8 *)&v23, (uint64_t)__p);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v24, "pulseSequences", (uint64_t)v26, (uint64_t)__p);
      nlohmann::operator<<((uint64_t *)buf, (uint64_t)v24);
      __p[0].__r_.__value_.__s.__data_[0] = 10;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)__p, 1);
      notify_cancel(out_token);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v25, v24[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v27, v26[0]);
      buf[0].__r_.__value_.__r.__words[0] = *MEMORY[0x263F8C2B0];
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words
                                + *(void *)(buf[0].__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x263F8C2B0] + 24);
      MEMORY[0x24C55DC00](&buf[0].__r_.__value_.__r.__words[1]);
      std::ostream::~ostream();
      MEMORY[0x24C55DCC0](&v35);
      if (v28 < 0) {
        operator delete(v27[1]);
      }
      if (SHIBYTE(v30) < 0) {
        operator delete(v29[0]);
      }
    }
    else
    {
      unint64_t v21 = ab_get_framework_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ABTachogramClassifier logToFileForTacho:withClassification:]((uint64_t)v10, v21);
      }

      notify_cancel(out_token);
    }
  }
  else
  {
    notify_cancel(out_token);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)classifyTachogram:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2477CF000, log, OS_LOG_TYPE_FAULT, "pulse times inside HKHeartbeatSeriesSample is empty", v1, 2u);
}

- (void)classifyTachogram:(os_log_t)log .cold.2(void *a1, void *a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*a1 - *a2) / 17;
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_2477CF000, log, OS_LOG_TYPE_FAULT, "Unexpected length of output classifications received from TelluriumForBeryllium computation. Expected : 1, Observed : %lu", (uint8_t *)&v4, 0xCu);
}

- (void)logToFileForTacho:(uint64_t)a1 withClassification:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2477CF000, a2, OS_LOG_TYPE_ERROR, "failed to create directory: %@", (uint8_t *)&v2, 0xCu);
}

@end