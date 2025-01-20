@interface MarrsSiriNLUTypesConverter
+ (QRInteraction)toPluginInteraction:(QRInteraction *__return_ptr)retstr;
+ (QRRequest)toPluginRequestObj:(SEL)a3;
+ (QRToken)internalTokentoPluginToken:(QRToken *__return_ptr)retstr;
+ (QRToken)toPluginToken:(QRToken *__return_ptr)retstr;
+ (QRUtterance)toPluginUtterance:(QRUtterance *__return_ptr)retstr;
+ (Uuid)toPluginUuid:(id)a3;
+ (basic_string<char,)NSString2StdString:(std::allocator<char>> *__return_ptr)retstr;
+ (id)StdVectorStdString2NSMutableArrayNSString:()vector<std:(std::allocator<std::string>> *)a3 :string;
+ (id)fromPluginHypothesis:(QRHypothesis *)a3;
+ (id)fromPluginInteraction:(QRInteraction *)a3;
+ (id)fromPluginResponseObj:(const void *)a3;
+ (id)fromPluginResponsePtr:(const void *)a3;
+ (id)fromPluginToken:(QRToken *)a3;
+ (id)fromPluginUtterance:(QRUtterance *)a3;
+ (id)fromPluginUuid:(Uuid)a3;
+ (id)internalTokenfromPluginToken:(QRToken *)a3;
+ (id)stdString2NSString:()basic_string<char;
+ (int)fromPluginRepetitionType:(int)a3;
+ (int)fromPluginRewriteType:(int)a3;
+ (int)toPluginRequester:(int)a3;
+ (unique_ptr<marrs::qr::orchestration::QRRequest,)toPluginRequestPtr:(id)a3;
+ (vector<std::string,)NSMutableArrayNSString2StdVectorStdString:(id)a2;
@end

@implementation MarrsSiriNLUTypesConverter

+ (id)fromPluginResponseObj:(const void *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = *((void *)a3 + 1);
  v12 = (unsigned int *)a3;
  if (*(void *)a3 != v5)
  {
    uint64_t v6 = *(void *)a3 + 16;
    do
    {
      long long v17 = *(_OWORD *)(v6 - 16);
      if (*(char *)(v6 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v6, *(void *)(v6 + 8));
      }
      else {
        std::string v18 = *(std::string *)v6;
      }
      uint64_t v7 = v6 - 16;
      uint64_t v19 = *(void *)(v6 + 24);
      int v20 = *(_DWORD *)(v6 + 32);
      long long v13 = v17;
      int v8 = SHIBYTE(v18.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v18;
      }
      uint64_t v15 = v19;
      int v16 = v20;
      v9 = +[MarrsSiriNLUTypesConverter fromPluginHypothesis:&v13];
      [v4 addObject:v9];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v8 < 0) {
LABEL_14:
        }
          operator delete(v18.__r_.__value_.__l.__data_);
      }
      else if (v8 < 0)
      {
        goto LABEL_14;
      }
      v6 += 56;
    }
    while (v7 + 56 != v5);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FA2A40]);
  [v10 setRewriteHypotheses:v4];
  objc_msgSend(v10, "setRepetitionType:", +[MarrsSiriNLUTypesConverter fromPluginRepetitionType:](MarrsSiriNLUTypesConverter, "fromPluginRepetitionType:", v12[6]));

  return v10;
}

+ (id)fromPluginResponsePtr:(const void *)a3
{
  v4 = objc_opt_new();
  long long v13 = a3;
  uint64_t v5 = **(void **)a3;
  uint64_t v6 = *(void *)(*(void *)a3 + 8);
  if (v5 != v6)
  {
    uint64_t v7 = v5 + 16;
    do
    {
      long long v18 = *(_OWORD *)(v7 - 16);
      if (*(char *)(v7 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
      }
      else {
        std::string v19 = *(std::string *)v7;
      }
      uint64_t v8 = v7 - 16;
      uint64_t v20 = *(void *)(v7 + 24);
      int v21 = *(_DWORD *)(v7 + 32);
      long long v14 = v18;
      int v9 = SHIBYTE(v19.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v19;
      }
      uint64_t v16 = v20;
      int v17 = v21;
      id v10 = +[MarrsSiriNLUTypesConverter fromPluginHypothesis:&v14];
      [v4 addObject:v10];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v9 < 0) {
LABEL_14:
        }
          operator delete(v19.__r_.__value_.__l.__data_);
      }
      else if (v9 < 0)
      {
        goto LABEL_14;
      }
      v7 += 56;
    }
    while (v8 + 56 != v6);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4FA2A40]);
  [v11 setRewriteHypotheses:v4];
  objc_msgSend(v11, "setRepetitionType:", +[MarrsSiriNLUTypesConverter fromPluginRepetitionType:](MarrsSiriNLUTypesConverter, "fromPluginRepetitionType:", *(unsigned int *)(*(void *)v13 + 24)));

  return v11;
}

+ (QRRequest)toPluginRequestObj:(SEL)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  unint64_t v40 = 0;
  unint64_t v41 = 0;
  id v24 = a4;
  uint64_t v5 = [v24 originalInteractions];
  std::vector<marrs::qr::orchestration::QRInteraction>::reserve(&v39, [v5 count]);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v24 originalInteractions];
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  unint64_t v7 = 0x1EC6FD000uLL;
  if (v6)
  {
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        [(id)(v7 + 1440) toPluginInteraction:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        unint64_t v10 = v40;
        if (v40 >= v41)
        {
          unint64_t v12 = v7;
          uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v40 - v39) >> 4);
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) > 0x249249249249249) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v41 - v39) >> 4) > v14) {
            unint64_t v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v41 - v39) >> 4);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v41 - v39) >> 4)) >= 0x124924924924924) {
            unint64_t v15 = 0x249249249249249;
          }
          else {
            unint64_t v15 = v14;
          }
          v42[4] = (void **)&v41;
          if (v15) {
            unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>>(v15);
          }
          else {
            uint64_t v16 = 0;
          }
          unint64_t v17 = v15 + 112 * v13;
          v42[0] = (void **)v15;
          v42[1] = (void **)v17;
          v42[3] = (void **)(v15 + 112 * v16);
          *(void *)unint64_t v17 = 0;
          *(void *)(v17 + 8) = 0;
          *(void *)(v17 + 16) = 0;
          *(_OWORD *)unint64_t v17 = v26;
          *(void *)(v17 + 16) = v27;
          long long v26 = 0uLL;
          uint64_t v27 = 0;
          *(void *)(v17 + 24) = 0;
          *(void *)(v17 + 32) = 0;
          *(void *)(v17 + 40) = 0;
          *(_OWORD *)(v17 + 24) = v28;
          *(void *)(v17 + 40) = v29;
          long long v28 = 0uLL;
          uint64_t v29 = 0;
          *(void *)(v17 + 48) = 0;
          *(void *)(v17 + 56) = 0;
          *(void *)(v17 + 64) = 0;
          *(_OWORD *)(v17 + 48) = v30;
          *(void *)(v17 + 64) = v31;
          long long v30 = 0uLL;
          uint64_t v31 = 0;
          long long v18 = __p;
          *(void *)(v17 + 88) = v33;
          *(_OWORD *)(v17 + 72) = v18;
          uint64_t v33 = 0;
          long long __p = 0uLL;
          *(_OWORD *)(v17 + 96) = v34;
          v42[2] = (void **)(v17 + 112);
          std::vector<marrs::qr::orchestration::QRInteraction>::__swap_out_circular_buffer(&v39, v42);
          unint64_t v19 = v40;
          std::__split_buffer<marrs::qr::orchestration::QRInteraction>::~__split_buffer((uint64_t)v42);
          unint64_t v40 = v19;
          unint64_t v7 = v12;
          if (SHIBYTE(v33) < 0) {
            operator delete((void *)__p);
          }
        }
        else
        {
          *(void *)(v40 + 16) = 0;
          *(void *)(v10 + 24) = 0;
          *(void *)unint64_t v10 = 0;
          *(void *)(v10 + 8) = 0;
          *(_OWORD *)unint64_t v10 = v26;
          *(void *)(v10 + 16) = v27;
          long long v26 = 0uLL;
          uint64_t v27 = 0;
          *(void *)(v10 + 32) = 0;
          *(void *)(v10 + 40) = 0;
          *(_OWORD *)(v10 + 24) = v28;
          long long v28 = 0uLL;
          *(void *)(v10 + 40) = v29;
          *(void *)(v10 + 48) = 0;
          uint64_t v29 = 0;
          *(void *)(v10 + 56) = 0;
          *(void *)(v10 + 64) = 0;
          *(_OWORD *)(v10 + 48) = v30;
          *(void *)(v10 + 64) = v31;
          long long v30 = 0uLL;
          uint64_t v31 = 0;
          long long v11 = __p;
          *(void *)(v10 + 88) = v33;
          *(_OWORD *)(v10 + 72) = v11;
          uint64_t v33 = 0;
          long long __p = 0uLL;
          *(_OWORD *)(v10 + 96) = v34;
          unint64_t v40 = v10 + 112;
        }
        v42[0] = (void **)&v30;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v42);
        v42[0] = (void **)&v28;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v42);
        v42[0] = (void **)&v26;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v42);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v6);
  }

  uint64_t v20 = [v24 cdmRequestId];
  retstr->var0 = objc_msgSend((id)(v7 + 1440), "toPluginRequester:", objc_msgSend(v20, "requester"));
  retstr->var1.var0 = 0;
  retstr->var1.var1 = 0;
  retstr->var1.var2.var0 = 0;
  uint64_t v21 = v39;
  uint64_t v22 = v40;
  *(void *)&long long v26 = &retstr->var1;
  BYTE8(v26) = 0;
  if (v40 != v39)
  {
    std::vector<marrs::qr::orchestration::QRInteraction>::__vallocate[abi:ne180100](&retstr->var1.var0, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v40 - v39) >> 4));
    retstr->var1.var1 = (QRInteraction *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*>((uint64_t)&retstr->var1.var2, v21, v22, (uint64_t)retstr->var1.var1);
  }

  *(void *)&long long v26 = &v39;
  std::vector<marrs::qr::orchestration::QRInteraction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);

  return result;
}

+ (unique_ptr<marrs::qr::orchestration::QRRequest,)toPluginRequestPtr:(id)a3
{
}

+ (int)toPluginRequester:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)fromPluginHypothesis:(QRHypothesis *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA2A48]);
  uint64_t v5 = +[MarrsSiriNLUTypesConverter fromPluginUuid:](MarrsSiriNLUTypesConverter, "fromPluginUuid:", a3->var0.var0, a3->var0.var1);
  [v4 setAsrId:v5];

  if (*((char *)&a3->var1.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&__p, a3->var1.var0.var0.var0.var1.var0, a3->var1.var0.var0.var0.var1.var1);
  }
  else {
    __rep __p = a3->var1.var0.var0;
  }
  uint64_t v6 = +[MarrsSiriNLUTypesConverter stdString2NSString:&__p];
  [v4 setUtterance:v6];

  if (*((char *)&__p.var0.var1 + 23) < 0) {
    operator delete(__p.var0.var1.var0);
  }
  objc_msgSend(v4, "setConfidence:", *(double *)a3->var1.var0.var1.var0, *(_OWORD *)__p.var0.var0.var0, *((void *)&__p.var0.var1 + 2));
  objc_msgSend(v4, "setRewriteType:", +[MarrsSiriNLUTypesConverter fromPluginRewriteType:](MarrsSiriNLUTypesConverter, "fromPluginRewriteType:", LODWORD(a3->var1.var0.var1.var0[1])));
  return v4;
}

+ (id)fromPluginInteraction:(QRInteraction *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v20 = a3;
  unint64_t v5 = 0x1EC6FD000uLL;
  var1 = a3->var0.var1;
  uint64_t v22 = (void *)v4;
  if (a3->var0.var0 != var1)
  {
    p_var1 = &a3->var0.var0->var1;
    do
    {
      long long v32 = *(_OWORD *)&p_var1[-1].var0.var1.var0[1];
      if (*((char *)&p_var1->var0.var0.var0.var1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v33, p_var1->var0.var0.var0.var1.var0, p_var1->var0.var0.var0.var1.var1);
      }
      else
      {
        long long v7 = *(_OWORD *)p_var1->var0.var0.var0.var0.var0;
        v33.__r_.__value_.__r.__words[2] = *((void *)&p_var1->var0.var0.var0.var1 + 2);
        *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v8 = &p_var1[-1].var0.var1.var0[1];
      uint64_t v34 = 0;
      v35[0] = 0;
      v35[1] = 0;
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v34, p_var1->var0.var1.var0[0], p_var1->var0.var1.var0[1], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(p_var1->var0.var1.var0[1] - p_var1->var0.var1.var0[0]) >> 5));
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v36, (uint64_t)p_var1[1].var0.var0.var0.var1.var0, p_var1[1].var0.var0.var0.var1.var1, 0xCCCCCCCCCCCCCCCDLL* ((uint64_t)(p_var1[1].var0.var0.var0.var1.var1 - (unint64_t)p_var1[1].var0.var0.var0.var1.var0) >> 5));
      unint64_t v39 = p_var1[1].var0.var1.var0[0];
      unint64_t v9 = v5;
      unint64_t v10 = (void *)(v5 + 1440);
      long long v44 = v32;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v45, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
      }
      else {
        std::string v45 = v33;
      }
      memset(v46, 0, sizeof(v46));
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(v46, v34, v35[0], 0xCCCCCCCCCCCCCCCDLL * ((v35[0] - v34) >> 5));
      memset(v47, 0, 24);
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(v47, v36, v37, 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 5));
      v47[3] = v39;
      long long v11 = [v10 fromPluginUtterance:&v44];
      [v22 addObject:v11];

      v48[0] = (void **)v47;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      v48[0] = (void **)v46;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      v48[0] = (void **)&v36;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      v48[0] = (void **)&v34;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      unint64_t v5 = v9;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v33.__r_.__value_.__l.__data_);
      }
      p_var1 += 2;
    }
    while (v8 + 12 != (unint64_t *)var1);
  }
  unint64_t v12 = objc_opt_new();
  uint64_t v13 = v20;
  var0 = (const marrs::qr::orchestration::QRToken *)v20->var2.var0;
  for (uint64_t i = v20->var2.var1;
        var0 != (const marrs::qr::orchestration::QRToken *)i;
        var0 = (const marrs::qr::orchestration::QRToken *)((char *)var0 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken((std::string *)&v32, var0);
    marrs::qr::orchestration::QRToken::QRToken(&v24, (const marrs::qr::orchestration::QRToken *)&v32);
    uint64_t v16 = [(id)(v5 + 1440) fromPluginToken:&v24];
    [v12 addObject:v16];

    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    v48[0] = (void **)&v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v48);
    if (v26 < 0) {
      operator delete(v25);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
    if (v43 < 0) {
      operator delete(v42);
    }
    if (v41 < 0) {
      operator delete(v40);
    }
    v48[0] = (void **)v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v48);
    if (SHIBYTE(v34) < 0) {
      operator delete((void *)v33.__r_.__value_.__l.__size_);
    }
    if (v33.__r_.__value_.__s.__data_[7] < 0) {
      operator delete((void *)v32);
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4FA2A50]);
  [v17 setOriginalUtterances:v22];
  [v17 setSiriResponses:v12];
  if (*((char *)&v20->var3.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v23, v20->var3.var0.var0.var0.var1.var0, v20->var3.var0.var0.var0.var1.var1);
  }
  else {
    std::string v23 = (std::string)v20->var3.var0.var0;
  }
  long long v18 = objc_msgSend((id)(v5 + 1440), "stdString2NSString:", &v23, v20);
  [v17 setLocale:v18];

  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  [v17 setTap2edit:LOBYTE(v13->var3.var0.var1.var0[0])];
  [v17 setStartTimestamp:v13->var3.var0.var1.var0[1]];

  return v17;
}

+ (QRInteraction)toPluginInteraction:(QRInteraction *__return_ptr)retstr
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v53 = 0;
  v54 = 0;
  unint64_t v55 = 0;
  id v34 = v1;
  v3 = [v34 originalUtterances];
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 > 0x2AAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    __p[2] = &v55;
    v35[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRUtterance>>(v4);
    v35[1] = (char *)v35[0] + (unint64_t)v54;
    __p[0] = (char *)v35[0] + (unint64_t)v54;
    __p[1] = (char *)v35[0] + 96 * v5;
    std::vector<marrs::qr::orchestration::QRUtterance>::__swap_out_circular_buffer((uint64_t *)&v53, v35);
    std::__split_buffer<marrs::qr::orchestration::QRUtterance>::~__split_buffer((uint64_t)v35);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [v34 originalUtterances];
  std::string v33 = retstr;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v6);
        }
        +[MarrsSiriNLUTypesConverter toPluginUtterance:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        unint64_t v10 = v54;
        if ((unint64_t)v54 >= v55)
        {
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v54 - v53) >> 5);
          unint64_t v14 = v13 + 1;
          if (v13 + 1 > 0x2AAAAAAAAAAAAAALL) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v55 - (void)v53) >> 5) > v14) {
            unint64_t v14 = 0x5555555555555556 * ((uint64_t)(v55 - (void)v53) >> 5);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)v53) >> 5) >= 0x155555555555555) {
            unint64_t v15 = 0x2AAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v15 = v14;
          }
          v61 = &v55;
          uint64_t v16 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRUtterance>>(v15);
          unint64_t v17 = (unint64_t)&v16[12 * v13];
          v57 = v16;
          unint64_t v58 = v17;
          v60 = &v16[12 * v18];
          *(_OWORD *)unint64_t v17 = *(_OWORD *)v35;
          long long v19 = *(_OWORD *)__p;
          *(void **)(v17 + 32) = __p[2];
          *(_OWORD *)(v17 + 16) = v19;
          memset(__p, 0, sizeof(__p));
          *(void *)(v17 + 40) = 0;
          *(void *)(v17 + 48) = 0;
          *(void *)(v17 + 56) = 0;
          *(_OWORD *)(v17 + 40) = *(_OWORD *)v37;
          *(void *)(v17 + 56) = *(void *)&v37[16];
          memset(v37, 0, sizeof(v37));
          *(void *)(v17 + 64) = 0;
          *(void *)(v17 + 72) = 0;
          *(void *)(v17 + 80) = 0;
          *(_OWORD *)(v17 + 64) = *(_OWORD *)v38;
          *(void *)(v17 + 80) = *(void *)&v38[16];
          memset(v38, 0, sizeof(v38));
          *(void *)(v17 + 88) = v39;
          unint64_t v59 = v17 + 96;
          std::vector<marrs::qr::orchestration::QRUtterance>::__swap_out_circular_buffer((uint64_t *)&v53, &v57);
          unint64_t v12 = v54;
          std::__split_buffer<marrs::qr::orchestration::QRUtterance>::~__split_buffer((uint64_t)&v57);
        }
        else
        {
          *(_OWORD *)v54 = *(_OWORD *)v35;
          long long v11 = *(_OWORD *)__p;
          *((void **)v10 + 4) = __p[2];
          *((void *)v10 + 5) = 0;
          *((_OWORD *)v10 + 1) = v11;
          memset(__p, 0, sizeof(__p));
          *((void *)v10 + 6) = 0;
          *((void *)v10 + 7) = 0;
          *(_OWORD *)(v10 + 40) = *(_OWORD *)v37;
          *(_OWORD *)uint64_t v37 = 0uLL;
          *((void *)v10 + 7) = *(void *)&v37[16];
          *((void *)v10 + 8) = 0;
          *(void *)&v37[16] = 0;
          *((void *)v10 + 9) = 0;
          *((void *)v10 + 10) = 0;
          *((_OWORD *)v10 + 4) = *(_OWORD *)v38;
          *((void *)v10 + 10) = *(void *)&v38[16];
          memset(v38, 0, sizeof(v38));
          *((void *)v10 + 11) = v39;
          unint64_t v12 = v10 + 96;
        }
        v54 = v12;
        v57 = (void **)v38;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](&v57);
        v57 = (void **)v37;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](&v57);
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v7);
  }

  v57 = 0;
  unint64_t v58 = 0;
  unint64_t v59 = 0;
  uint64_t v20 = [v34 siriResponses];
  std::vector<marrs::qr::orchestration::QRToken>::reserve((uint64_t *)&v57, [v20 count]);

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v21 = [v34 siriResponses];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v21);
        }
        +[MarrsSiriNLUTypesConverter internalTokentoPluginToken:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        unint64_t v25 = v58;
        if (v58 >= v59)
        {
          unint64_t v58 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>((uint64_t *)&v57, (long long *)v35);
          if (SHIBYTE(v44) < 0) {
            operator delete((void *)v43);
          }
        }
        else
        {
          long long v26 = *(_OWORD *)v35;
          *(void **)(v58 + 16) = __p[0];
          *(_OWORD *)unint64_t v25 = v26;
          v35[1] = 0;
          __p[0] = 0;
          v35[0] = 0;
          uint64_t v27 = *(void *)v37;
          *(_OWORD *)(v25 + 24) = *(_OWORD *)&__p[1];
          *(void *)(v25 + 40) = v27;
          *(void *)(v25 + 48) = 0;
          __p[2] = 0;
          *(void *)uint64_t v37 = 0;
          __p[1] = 0;
          *(void *)(v25 + 56) = 0;
          *(void *)(v25 + 64) = 0;
          *(_OWORD *)(v25 + 48) = *(_OWORD *)&v37[8];
          *(void *)(v25 + 64) = *(void *)v38;
          *(void *)&v37[8] = 0;
          *(void *)&v37[16] = 0;
          *(void *)uint64_t v38 = 0;
          long long v28 = *(_OWORD *)&v38[8];
          *(_OWORD *)(v25 + 88) = v39;
          *(_OWORD *)(v25 + 72) = v28;
          long long v29 = v40;
          *(void *)(v25 + 120) = v41;
          *(_OWORD *)(v25 + 104) = v29;
          uint64_t v41 = 0;
          long long v40 = 0uLL;
          *(unsigned char *)(v25 + 128) = v42;
          long long v30 = v43;
          *(void *)(v25 + 152) = v44;
          *(_OWORD *)(v25 + 136) = v30;
          uint64_t v44 = 0;
          long long v43 = 0uLL;
          unint64_t v58 = v25 + 160;
        }
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        v56 = (void **)&v37[8];
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v56);
        if ((v37[7] & 0x80000000) != 0) {
          operator delete(__p[1]);
        }
        if (SHIBYTE(__p[0]) < 0) {
          operator delete(v35[0]);
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v62 count:16];
    }
    while (v22);
  }

  v33->var0.var0 = 0;
  v33->var0.var1 = 0;
  v33->var0.var2.var0 = 0;
  std::vector<marrs::qr::orchestration::QRUtterance>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRUtterance*,marrs::qr::orchestration::QRUtterance*>(v33, v53, v54, 0xAAAAAAAAAAAAAAABLL * ((v54 - v53) >> 5));
  *(_OWORD *)&v33->var1.var0 = 0u;
  *(_OWORD *)&v33->var1.var2.var0 = 0u;
  *(_OWORD *)&v33->var2.var1 = 0u;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v33->var2.var0, (uint64_t)v57, v58, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v58 - (void)v57) >> 5));
  char v31 = [v34 locale];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v31];
  LOBYTE(v33->var3.var0.var1.var0[0]) = [v34 tap2edit];
  v33->var3.var0.var1.var0[1] = [v34 startTimestamp];

  v35[0] = &v57;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
  v35[0] = &v53;
  std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);

  return result;
}

+ (id)fromPluginUtterance:(QRUtterance *)a3
{
  unint64_t v4 = objc_opt_new();
  uint64_t v5 = (const marrs::qr::orchestration::QRToken *)a3->var1.var0.var1.var0[0];
  for (unint64_t i = a3->var1.var0.var1.var0[1];
        v5 != (const marrs::qr::orchestration::QRToken *)i;
        uint64_t v5 = (const marrs::qr::orchestration::QRToken *)((char *)v5 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken(&v33, v5);
    marrs::qr::orchestration::QRToken::QRToken(&v25, (const marrs::qr::orchestration::QRToken *)&v33);
    uint64_t v7 = +[MarrsSiriNLUTypesConverter internalTokenfromPluginToken:&v25];
    [v4 addObject:v7];

    if (v32 < 0) {
      operator delete(__p);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    uint64_t v41 = (void **)&v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v27 < 0) {
      operator delete(v26);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
    if (v40 < 0) {
      operator delete(v39);
    }
    if (v38 < 0) {
      operator delete(v37);
    }
    uint64_t v41 = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v35 < 0) {
      operator delete(v34);
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v8 = objc_opt_new();
  var0 = (const marrs::qr::orchestration::QRToken *)a3[1].var0.var0;
  for (unint64_t j = a3[1].var0.var1;
        var0 != (const marrs::qr::orchestration::QRToken *)j;
        var0 = (const marrs::qr::orchestration::QRToken *)((char *)var0 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken(&v33, var0);
    marrs::qr::orchestration::QRToken::QRToken(&v17, (const marrs::qr::orchestration::QRToken *)&v33);
    long long v11 = +[MarrsSiriNLUTypesConverter fromPluginToken:&v17];
    [v8 addObject:v11];

    if (v24 < 0) {
      operator delete(v23);
    }
    if (v22 < 0) {
      operator delete(v21);
    }
    uint64_t v41 = (void **)&v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v19 < 0) {
      operator delete(v18);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
    if (v40 < 0) {
      operator delete(v39);
    }
    if (v38 < 0) {
      operator delete(v37);
    }
    uint64_t v41 = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v35 < 0) {
      operator delete(v34);
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4FA2A60]);
  unint64_t v13 = +[MarrsSiriNLUTypesConverter fromPluginUuid:](MarrsSiriNLUTypesConverter, "fromPluginUuid:", a3->var0.var0, a3->var0.var1);
  [v12 setAsrId:v13];

  if (*((char *)&a3->var1.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&v16, a3->var1.var0.var0.var0.var1.var0, a3->var1.var0.var0.var0.var1.var1);
  }
  else {
    __rep v16 = a3->var1.var0.var0;
  }
  unint64_t v14 = +[MarrsSiriNLUTypesConverter stdString2NSString:&v16];
  [v12 setUtterance:v14];

  if (*((char *)&v16.var0.var1 + 23) < 0) {
    operator delete(v16.var0.var1.var0);
  }
  objc_msgSend(v12, "setNluInternalTokens:", v4, *(_OWORD *)v16.var0.var0.var0, *((void *)&v16.var0.var1 + 2));
  [v12 setAsrUtteranceTokens:v8];
  [v12 setConfidence:*(double *)&a3[1].var1.var0.var0.var0.var1.var1];

  return v12;
}

+ (QRUtterance)toPluginUtterance:(QRUtterance *__return_ptr)retstr
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  unint64_t v56 = 0;
  unint64_t v57 = 0;
  id v30 = v1;
  v3 = [v30 nluInternalTokens];
  std::vector<marrs::qr::orchestration::QRToken>::reserve(&v55, [v3 count]);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v4 = [v30 nluInternalTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v52 != v6) {
          objc_enumerationMutation(v4);
        }
        +[MarrsSiriNLUTypesConverter internalTokentoPluginToken:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        unint64_t v8 = v56;
        if (v56 >= v57)
        {
          unint64_t v56 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>(&v55, (long long *)v38);
          if (SHIBYTE(v50) < 0) {
            operator delete((void *)__p);
          }
        }
        else
        {
          long long v9 = *(_OWORD *)v38;
          *(void *)(v56 + 16) = v39;
          *(_OWORD *)unint64_t v8 = v9;
          v38[1] = 0;
          uint64_t v39 = 0;
          v38[0] = 0;
          uint64_t v10 = v41;
          *(_OWORD *)(v8 + 24) = v40;
          *(void *)(v8 + 40) = v10;
          *(void *)(v8 + 48) = 0;
          uint64_t v41 = 0;
          long long v40 = 0uLL;
          *(void *)(v8 + 56) = 0;
          *(void *)(v8 + 64) = 0;
          *(_OWORD *)(v8 + 48) = v42;
          *(void *)(v8 + 64) = v43;
          long long v42 = 0uLL;
          uint64_t v43 = 0;
          long long v11 = v44;
          *(_OWORD *)(v8 + 88) = v45;
          *(_OWORD *)(v8 + 72) = v11;
          long long v12 = v46;
          *(void *)(v8 + 120) = v47;
          *(_OWORD *)(v8 + 104) = v12;
          uint64_t v47 = 0;
          long long v46 = 0uLL;
          *(unsigned char *)(v8 + 128) = v48;
          long long v13 = __p;
          *(void *)(v8 + 152) = v50;
          *(_OWORD *)(v8 + 136) = v13;
          uint64_t v50 = 0;
          long long __p = 0uLL;
          unint64_t v56 = v8 + 160;
        }
        if (SHIBYTE(v47) < 0) {
          operator delete((void *)v46);
        }
        char v35 = (void **)&v42;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v35);
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        if (SHIBYTE(v39) < 0) {
          operator delete(v38[0]);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v5);
  }

  char v35 = 0;
  unint64_t v36 = 0;
  unint64_t v37 = 0;
  unint64_t v14 = [v30 asrUtteranceTokens];
  std::vector<marrs::qr::orchestration::QRToken>::reserve((uint64_t *)&v35, [v14 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v15 = [v30 asrUtteranceTokens];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v59 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v15);
        }
        +[MarrsSiriNLUTypesConverter toPluginToken:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        unint64_t v19 = v36;
        if (v36 >= v37)
        {
          unint64_t v36 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>((uint64_t *)&v35, (long long *)v38);
          if (SHIBYTE(v50) < 0) {
            operator delete((void *)__p);
          }
        }
        else
        {
          long long v20 = *(_OWORD *)v38;
          *(void *)(v36 + 16) = v39;
          *(_OWORD *)unint64_t v19 = v20;
          v38[1] = 0;
          uint64_t v39 = 0;
          v38[0] = 0;
          uint64_t v21 = v41;
          *(_OWORD *)(v19 + 24) = v40;
          *(void *)(v19 + 40) = v21;
          *(void *)(v19 + 48) = 0;
          uint64_t v41 = 0;
          long long v40 = 0uLL;
          *(void *)(v19 + 56) = 0;
          *(void *)(v19 + 64) = 0;
          *(_OWORD *)(v19 + 48) = v42;
          *(void *)(v19 + 64) = v43;
          long long v42 = 0uLL;
          uint64_t v43 = 0;
          long long v22 = v44;
          *(_OWORD *)(v19 + 88) = v45;
          *(_OWORD *)(v19 + 72) = v22;
          long long v23 = v46;
          *(void *)(v19 + 120) = v47;
          *(_OWORD *)(v19 + 104) = v23;
          uint64_t v47 = 0;
          long long v46 = 0uLL;
          *(unsigned char *)(v19 + 128) = v48;
          long long v24 = __p;
          *(void *)(v19 + 152) = v50;
          *(_OWORD *)(v19 + 136) = v24;
          uint64_t v50 = 0;
          long long __p = 0uLL;
          unint64_t v36 = v19 + 160;
        }
        if (SHIBYTE(v47) < 0) {
          operator delete((void *)v46);
        }
        unint64_t v58 = (void **)&v42;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v58);
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        if (SHIBYTE(v39) < 0) {
          operator delete(v38[0]);
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v59 count:16];
    }
    while (v16);
  }

  std::string v25 = [v30 asrId];
  retstr->var0.var0 = +[MarrsSiriNLUTypesConverter toPluginUuid:v25];
  retstr->var0.var1 = v26;
  char v27 = [v30 utterance];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v27];
  retstr->var1.var0.var1.var0[0] = 0;
  retstr->var1.var0.var1.var0[1] = 0;
  retstr->var1.var0.var1.var0[2] = 0;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(retstr->var1.var0.var1.var0, v55, v56, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - v55) >> 5));
  retstr[1].var0.var0 = 0;
  retstr[1].var0.var1 = 0;
  retstr[1].var1.var0.var0.var0.var1.var0 = 0;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&retstr[1].var0.var0, (uint64_t)v35, v36, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - (void)v35) >> 5));
  [v30 confidence];
  retstr[1].var1.var0.var0.var0.var1.var1 = v28;

  v38[0] = &v35;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
  v38[0] = &v55;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);

  return result;
}

+ (id)internalTokenfromPluginToken:(QRToken *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA2AC0]);
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  }
  else {
    std::string var0 = (std::string)a3->var0.var0.var0;
  }
  uint64_t v5 = +[MarrsSiriNLUTypesConverter stdString2NSString:&var0];
  [v4 setValue:v5];

  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(var0.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0) {
    std::string::__init_copy_ctor_external(&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  }
  else {
    std::string var1 = (std::string)a3->var0.var0.var1;
  }
  uint64_t v6 = +[MarrsSiriNLUTypesConverter stdString2NSString:&var1];
  [v4 setCleanValue:v6];

  if (SHIBYTE(var1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(var1.__r_.__value_.__l.__data_);
  }
  memset(&v9, 0, sizeof(v9));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v9, (long long *)a3[1].var0.var0.var0.var0.var1.var0, (long long *)a3[1].var0.var0.var0.var0.var1.var1, 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(a3[1].var0.var0.var0.var0.var1.var1 - (unint64_t)a3[1].var0.var0.var0.var0.var1.var0) >> 3));
  uint64_t v7 = +[MarrsSiriNLUTypesConverter StdVectorStdString2NSMutableArrayNSString:&v9];
  [v4 setNormalizedValues:v7];

  long long v12 = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  [v4 setIsSignificant:LOBYTE(a3[1].var0.var0.var1.var0[0])];
  [v4 setIsWhitespace:BYTE1(a3[1].var0.var0.var1.var0[0])];
  return v4;
}

+ (id)fromPluginToken:(QRToken *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA2A58]);
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  }
  else {
    std::string var0 = (std::string)a3->var0.var0.var0;
  }
  uint64_t v5 = +[MarrsSiriNLUTypesConverter stdString2NSString:&var0];
  [v4 setValue:v5];

  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(var0.__r_.__value_.__l.__data_);
  }
  [v4 setStartIndex:LODWORD(a3[1].var0.var0.var1.var0[1])];
  [v4 setEndIndex:LODWORD(a3[1].var0.var0.var1.var0[2])];
  [v4 setAsrConfidence:*(double *)&a3[2].var0.var0.var0.var0.var1.var0];
  if (SHIBYTE(a3[2].var0.var0.var1.var0[0]) < 0) {
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)a3[2].var0.var0.var0.var0.var1.var1, *((void *)&a3[2].var0.var0.var0.var0.var1 + 2));
  }
  else {
    std::string __p = *(std::string *)((char *)&a3[2].var0.var0.var0 + 8);
  }
  uint64_t v6 = +[MarrsSiriNLUTypesConverter stdString2NSString:&__p];
  [v4 setPhoneSequence:v6];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  objc_msgSend(v4, "setRemoveSpaceAfter:", LOBYTE(a3[2].var0.var0.var1.var0[1]), *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  return v4;
}

+ (QRToken)internalTokentoPluginToken:(QRToken *__return_ptr)retstr
{
  id v3 = v1;
  id v4 = [v3 value];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v4];
  uint64_t v5 = [v3 cleanValue];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v5];
  uint64_t v6 = [v3 normalizedValues];
  +[MarrsSiriNLUTypesConverter NSMutableArrayNSString2StdVectorStdString:v6];
  marrs::qr::orchestration::QRToken::QRToken((std::string *)retstr, &v11, &__p, v8, [v3 isSignificant], objc_msgSend(v3, "isWhitespace"));
  long long v13 = v8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);

  if (v10 < 0) {
    operator delete((void *)__p);
  }

  if (v12 < 0) {
    operator delete((void *)v11);
  }

  retstr[1].var0.var0.var1.var0[1] = (int)[v3 begin];
  retstr[1].var0.var0.var1.var0[2] = (int)[v3 end];
  retstr[2].var0.var0.var0.var0.var1.std::string var0 = (char *)0x408F400000000000;
  MEMORY[0x1CB786A80](&retstr[2].var0.var0.var0.var0.var1.var1, "");
  LOBYTE(retstr[2].var0.var0.var1.var0[1]) = 0;

  return result;
}

+ (QRToken)toPluginToken:(QRToken *__return_ptr)retstr
{
  id v3 = v1;
  id v4 = [v3 value];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v4];
  marrs::qr::orchestration::QRToken::QRToken((std::string *)retstr, (long long *)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }

  retstr[1].var0.var0.var1.var0[1] = [v3 startIndex];
  retstr[1].var0.var0.var1.var0[2] = [v3 endIndex];
  [v3 asrConfidence];
  retstr[2].var0.var0.var0.var0.var1.std::string var0 = v5;
  uint64_t v6 = [v3 phoneSequence];
  +[MarrsSiriNLUTypesConverter NSString2StdString:v6];
  p_std::string var1 = (void **)&retstr[2].var0.var0.var0.var0.var1.var1;
  if (SHIBYTE(retstr[2].var0.var0.var1.var0[0]) < 0) {
    operator delete(*p_var1);
  }
  *(_OWORD *)p_std::string var1 = *(_OWORD *)__p;
  retstr[2].var0.var0.var1.var0[0] = v10;
  HIBYTE(v10) = 0;
  LOBYTE(__p[0]) = 0;

  LOBYTE(retstr[2].var0.var0.var1.var0[1]) = [v3 removeSpaceAfter];
  return result;
}

+ (id)fromPluginUuid:(Uuid)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
  [v5 setLowInt:var1];
  [v5 setHighInt:var0];
  return v5;
}

+ (Uuid)toPluginUuid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 highInt];
  uint64_t v5 = [v3 lowInt];

  unint64_t v6 = v4;
  unint64_t v7 = v5;
  result.unint64_t var1 = v7;
  result.unint64_t var0 = v6;
  return result;
}

+ (int)fromPluginRewriteType:(int)a3
{
  return a3 == 1;
}

+ (int)fromPluginRepetitionType:(int)a3
{
  if (a3 >= 4) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (id)StdVectorStdString2NSMutableArrayNSString:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  uint64_t v4 = objc_opt_new();
  unint64_t var0 = (std::string *)a3->var0;
  unint64_t var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      if (SHIBYTE(var0->__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v11, var0->__r_.__value_.__l.__data_, var0->__r_.__value_.__l.__size_);
      }
      else {
        std::string v11 = *var0;
      }
      int v7 = SHIBYTE(v11.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v11;
      }
      unint64_t v8 = +[MarrsSiriNLUTypesConverter stdString2NSString:&__p];
      [v4 addObject:v8];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v7 < 0) {
LABEL_13:
        }
          operator delete(v11.__r_.__value_.__l.__data_);
      }
      else if (v7 < 0)
      {
        goto LABEL_13;
      }
      ++var0;
    }
    while (var0 != var1);
  }
  return v4;
}

+ (id)stdString2NSString:()basic_string<char
{
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    unint64_t var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  return (id)[NSString stringWithUTF8String:var0];
}

+ (vector<std::string,)NSMutableArrayNSString2StdVectorStdString:(id)a2
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = v5;
  retstr->unint64_t var1 = 0;
  retstr->var2.unint64_t var0 = 0;
  retstr->unint64_t var0 = 0;
  if (v5)
  {
    std::vector<std::string>::reserve((std::vector<std::string> *)retstr, [v5 count]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          +[MarrsSiriNLUTypesConverter NSString2StdString:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          unint64_t var1 = (char *)retstr->var1;
          unint64_t var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            unint64_t v13 = v12 + 1;
            if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v14 > v13) {
              unint64_t v13 = 2 * v14;
            }
            if (v14 >= 0x555555555555555) {
              unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v15 = v13;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->var2;
            if (v15) {
              unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v15);
            }
            else {
              uint64_t v16 = 0;
            }
            uint64_t v17 = (std::string *)(v15 + 24 * v12);
            __v.__first_ = (std::__split_buffer<std::string>::pointer)v15;
            __v.__begin_ = v17;
            __v.__end_cap_.__value_ = (std::string *)(v15 + 24 * v16);
            v17->__r_.__value_.__r.__words[2] = v22;
            *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            std::string::size_type v22 = 0;
            *(_OWORD *)std::string __p = 0uLL;
            __v.__end_ = v17 + 1;
            std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
            uint64_t v18 = retstr->var1;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            retstr->unint64_t var1 = v18;
          }
          else
          {
            *((void *)var1 + 2) = v22;
            *(_OWORD *)unint64_t var1 = *(_OWORD *)__p;
            retstr->unint64_t var1 = var1 + 24;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
  }
  return result;
}

+ (basic_string<char,)NSString2StdString:(std::allocator<char>> *__return_ptr)retstr
{
  id v3 = v1;
  id v5 = v3;
  if (v3) {
    std::string::basic_string[abi:ne180100]<0>(retstr, (char *)[v3 UTF8String]);
  }
  else {
    std::string::basic_string[abi:ne180100]<0>(retstr, "");
  }

  return result;
}

@end