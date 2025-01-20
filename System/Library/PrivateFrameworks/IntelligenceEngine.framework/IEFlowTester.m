@interface IEFlowTester
+ (id)getTestList:(id)a3;
+ (id)getTestList:(id)a3 flowId:(id)a4;
+ (id)runAllTests:(id)a3;
+ (id)runFileTests:(id)a3;
@end

@implementation IEFlowTester

+ (id)runAllTests:(id)a3
{
  IE_GetTemplateDirFromBundle((NSBundle *)a3, v10);
  unint64_t v3 = v11;
  if ((v11 & 0x80u) != 0) {
    unint64_t v3 = (unint64_t)v10[1];
  }
  if (v3)
  {
    memset(v9, 0, sizeof(v9));
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    siri::intelligence::TestSuite::LoadTests((uint64_t *)v9, (uint64_t)v10, (uint64_t)&__p);
    if ((v8[15] & 0x80000000) != 0) {
      operator delete(__p);
    }
    memset(v6, 0, sizeof(v6));
    siri::intelligence::TestRunner::RunTestSuite((const siri::intelligence::TestCase **)v9, (uint64_t)v6, (const siri::intelligence::TestCase ***)&__p);
    v12 = v6;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
    v4 = ConvertTestResults((long long **)v9, (const siri::intelligence::TestResults *)&__p);
    v6[0] = (void **)v8;
    std::vector<siri::intelligence::TestResult>::__destroy_vector::operator()[abi:ne180100](v6);
    __p = (char *)&v9[1] + 8;
    std::vector<siri::intelligence::TestParseError>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    __p = v9;
    std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  else
  {
    v4 = objc_opt_new();
  }
  if ((char)v11 < 0) {
    operator delete(v10[0]);
  }

  return v4;
}

+ (id)runFileTests:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
    siri::intelligence::FindTemplateDir((uint64_t)__p, (uint64_t)v16);
    if (SBYTE7(v13[0]) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v6 = v17;
    if ((v17 & 0x80u) != 0) {
      unint64_t v6 = (unint64_t)v16[1];
    }
    if (v6)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
      siri::intelligence::Configuration::GetFlowIdFromPath((const std::string *)__p, (uint64_t)v14);
      if (SBYTE7(v13[0]) < 0) {
        operator delete(__p[0]);
      }
      memset(v13, 0, sizeof(v13));
      *(_OWORD *)__p = 0u;
      siri::intelligence::TestSuite::LoadTests((uint64_t *)__p, (uint64_t)v16, (uint64_t)v14);
      memset(v9, 0, sizeof(v9));
      siri::intelligence::TestRunner::RunTestSuite((const siri::intelligence::TestCase **)__p, (uint64_t)v9, (const siri::intelligence::TestCase ***)&v10);
      v18 = v9;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
      v7 = ConvertTestResults((long long **)__p, (const siri::intelligence::TestResults *)&v10);
      v9[0] = (void **)&v11;
      std::vector<siri::intelligence::TestResult>::__destroy_vector::operator()[abi:ne180100](v9);
      v10 = (void **)v13 + 1;
      std::vector<siri::intelligence::TestParseError>::__destroy_vector::operator()[abi:ne180100](&v10);
      v10 = __p;
      std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100](&v10);
      if (v15 < 0) {
        operator delete(v14[0]);
      }
    }
    else
    {
      v7 = MakeEmptyTestResults();
    }
    if ((char)v17 < 0) {
      operator delete(v16[0]);
    }
  }
  else
  {
    v7 = MakeEmptyTestResults();
  }

  return v7;
}

+ (id)getTestList:(id)a3 flowId:(id)a4
{
  id v5 = (NSBundle *)a3;
  id v6 = a4;
  IE_GetTemplateDirFromBundle(v5, v33);
  unint64_t v7 = v34;
  if ((v34 & 0x80u) != 0) {
    unint64_t v7 = (unint64_t)v33[1];
  }
  if (v7)
  {
    v20 = objc_opt_new();
    if (v6) {
      v8 = (char *)[v6 UTF8String];
    }
    else {
      v8 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(v31, v8);
    memset(v30, 0, sizeof(v30));
    siri::intelligence::TestSuite::LoadTests((uint64_t *)v30, (uint64_t)v33, (uint64_t)v31);
    memset(&v29, 0, sizeof(v29));
    std::vector<siri::intelligence::TestCase>::__init_with_size[abi:ne180100]<siri::intelligence::TestCase*,siri::intelligence::TestCase*>(&v29, *(const siri::intelligence::TestCase **)&v30[0], *((const siri::intelligence::TestCase **)&v30[0] + 1), 0x86BCA1AF286BCA1BLL * ((uint64_t)(*((void *)&v30[0] + 1) - *(void *)&v30[0]) >> 3));
    std::string::size_type size = v29.__r_.__value_.__l.__size_;
    for (i = (const siri::intelligence::TestCase *)v29.__r_.__value_.__r.__words[0];
          i != (const siri::intelligence::TestCase *)size;
          i = (const siri::intelligence::TestCase *)((char *)i + 152))
    {
      siri::intelligence::TestCase::TestCase(&v22, i);
      v12 = objc_opt_new();
      [v12 setStatus:0];
      [v12 setSummary:&stru_26ED2AF50];
      v13 = NSString;
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v21, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
      }
      else {
        std::string v21 = v23;
      }
      if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v14 = &v21;
      }
      else {
        v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      char v15 = [v13 stringWithUTF8String:v14];
      [v12 setFlowId:v15];

      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      v16 = NSString;
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v21, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
      }
      else {
        std::string v21 = v24;
      }
      if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned __int8 v17 = &v21;
      }
      else {
        unsigned __int8 v17 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      v18 = [v16 stringWithUTF8String:v17];
      [v12 setTestName:v18];

      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      [v20 addObject:v12];

      v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v27;
      std::vector<protobuf::FlowTest_Step>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      if (v26 < 0) {
        operator delete(__p);
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
    }
    v22.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29;
    std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    v9 = MakeEmptyTestResults();
    [v9 setResults:v20];
    v22.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30[1] + 8;
    std::vector<siri::intelligence::TestParseError>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    v22.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
    std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    if (v32 < 0) {
      operator delete(v31[0]);
    }
  }
  else
  {
    v9 = MakeEmptyTestResults();
  }
  if ((char)v34 < 0) {
    operator delete(v33[0]);
  }

  return v9;
}

+ (id)getTestList:(id)a3
{
  id v3 = a3;
  v4 = v3;
  id v18 = v3;
  if (v3)
  {
    id v5 = v3;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 UTF8String]);
    siri::intelligence::FindTemplateDir((uint64_t)&__p, (uint64_t)v32);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    unint64_t v6 = v33;
    if ((v33 & 0x80u) != 0) {
      unint64_t v6 = (unint64_t)v32[1];
    }
    if (v6)
    {
      v19 = objc_opt_new();
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 UTF8String]);
      siri::intelligence::Configuration::GetFlowIdFromPath(&__p, (uint64_t)v30);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      memset(v29, 0, sizeof(v29));
      siri::intelligence::TestSuite::LoadTests((uint64_t *)v29, (uint64_t)v32, (uint64_t)v30);
      memset(&v28, 0, sizeof(v28));
      std::vector<siri::intelligence::TestCase>::__init_with_size[abi:ne180100]<siri::intelligence::TestCase*,siri::intelligence::TestCase*>(&v28, *(const siri::intelligence::TestCase **)&v29[0], *((const siri::intelligence::TestCase **)&v29[0] + 1), 0x86BCA1AF286BCA1BLL * ((uint64_t)(*((void *)&v29[0] + 1) - *(void *)&v29[0]) >> 3));
      std::string::size_type size = v28.__r_.__value_.__l.__size_;
      for (i = (const siri::intelligence::TestCase *)v28.__r_.__value_.__r.__words[0];
            i != (const siri::intelligence::TestCase *)size;
            i = (const siri::intelligence::TestCase *)((char *)i + 152))
      {
        siri::intelligence::TestCase::TestCase(&__p, i);
        v9 = objc_opt_new();
        [v9 setStatus:0];
        [v9 setSummary:&stru_26ED2AF50];
        v10 = NSString;
        if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v20, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
        }
        else {
          std::string v20 = v22;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v11 = &v20;
        }
        else {
          uint64_t v11 = (std::string *)v20.__r_.__value_.__r.__words[0];
        }
        v12 = objc_msgSend(v10, "stringWithUTF8String:", v11, v18);
        [v9 setFlowId:v12];

        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v20.__r_.__value_.__l.__data_);
        }
        v13 = NSString;
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v20, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
        }
        else {
          std::string v20 = v23;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v14 = &v20;
        }
        else {
          v14 = (std::string *)v20.__r_.__value_.__r.__words[0];
        }
        char v15 = [v13 stringWithUTF8String:v14];
        [v9 setTestName:v15];

        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v20.__r_.__value_.__l.__data_);
        }
        v4 = v18;
        [v19 addObject:v9];

        v20.__r_.__value_.__r.__words[0] = (std::string::size_type)&v27;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
        v20.__r_.__value_.__r.__words[0] = (std::string::size_type)&v26;
        std::vector<protobuf::FlowTest_Step>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
        if (v25 < 0) {
          operator delete(v24);
        }
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v23.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v22.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
      std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v16 = MakeEmptyTestResults();
      [v16 setResults:v19];
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29[1] + 8;
      std::vector<siri::intelligence::TestParseError>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
      std::vector<siri::intelligence::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      if (v31 < 0) {
        operator delete(v30[0]);
      }
    }
    else
    {
      v16 = MakeEmptyTestResults();
    }
    if ((char)v33 < 0) {
      operator delete(v32[0]);
    }
  }
  else
  {
    v16 = MakeEmptyTestResults();
  }

  return v16;
}

@end