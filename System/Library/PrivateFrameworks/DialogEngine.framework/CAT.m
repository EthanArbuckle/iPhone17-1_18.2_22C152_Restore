@interface CAT
+ (BOOL)downloadMorphunDataByLocale:(id)a3;
+ (BOOL)downloadMorphunDataByLocales:(id)a3;
+ (BOOL)runTests:(id)a3;
+ (BOOL)runTests:(id)a3 forLocale:(id)a4;
+ (id)evaluate:(id)a3 propName:(id)a4 parameters:(id)a5 globals:(id)a6;
+ (id)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9;
+ (id)filterProfanity:(id)a3 locale:(id)a4;
+ (id)getBuiltinDialogMetadataCategoryNamesForLocale:(id)a3;
+ (id)getBuiltinDialogMetadataForLocale:(id)a3;
+ (id)getDialogAssetsVersion:(id)a3;
+ (id)getDialogAssetsVersion:(id)a3 enableUpdates:(BOOL)a4;
+ (id)getDialogMetadataCategoryNamesForLocale:(id)a3 locale:(id)a4;
+ (id)getDialogMetadataForLocale:(id)a3 locale:(id)a4;
+ (id)getDialogStateFamily:(id)a3;
+ (id)getDialogStateUseCase:(id)a3;
+ (id)getFallbackLocales:(id)a3;
+ (id)getFallbackLocales:(id)a3 includingNonSiriLocales:(BOOL)a4;
+ (id)getMorphunPath:(id)a3;
+ (id)getMorphunPaths;
+ (id)resolve:(id)a3 propName:(id)a4 parameters:(id)a5 completion:(id)a6;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 completion:(id)a8;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 completion:(id)a7;
+ (void)execute:(id)a3 paramsXML:(id)a4 localeXML:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10;
+ (void)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10;
+ (void)preload;
+ (void)registerBundle:(id)a3;
+ (void)registerBundle:(id)a3 withTemplateDir:(id)a4;
+ (void)registerBundleId:(id)a3 withTemplateDir:(id)a4;
@end

@implementation CAT

+ (id)filterProfanity:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)[v7 UTF8String]);
  siri::dialogengine::RemoveProfanity(&v13, (uint64_t)v11, &v14);
  siri::dialogengine::SpeakableString::ToMultiplexedString((siri::dialogengine::SpeakableString *)&v14, &v27);
  if (v26 < 0) {
    operator delete(__p);
  }
  if (v24 < 0) {
    operator delete(v23);
  }
  if (v22 < 0) {
    operator delete(v21);
  }
  if (v20 < 0) {
    operator delete(v19);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v27;
  }
  else {
    v8 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (void)registerBundleId:(id)a3 withTemplateDir:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)[v7 UTF8String]);
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)v11, (long long *)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
}

+ (void)registerBundle:(id)a3 withTemplateDir:(id)a4
{
  id v6 = a4;
  id v5 = [a3 bundleIdentifier];
  +[CAT registerBundleId:v5 withTemplateDir:v6];
}

+ (void)registerBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resourcePath];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  siri::dialogengine::GetDomainTemplateDir((uint64_t)__p, (uint64_t)v9);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  if (v10 >= 0) {
    id v5 = v9;
  }
  else {
    id v5 = (void **)v9[0];
  }
  id v6 = [NSString stringWithUTF8String:v5];
  +[CAT registerBundle:v3 withTemplateDir:v6];

  if (v10 < 0) {
    operator delete(v9[0]);
  }
}

+ (id)getFallbackLocales:(id)a3 includingNonSiriLocales:(BOOL)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  siri::dialogengine::GetFallbackLocales((uint64_t)__p, &v19);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  id v6 = objc_opt_new();
  uint64_t v7 = v19;
  for (uint64_t i = v20; v7 != i; v7 += 24)
  {
    uint64_t v9 = v7;
    if (*(char *)(v7 + 23) < 0) {
      uint64_t v9 = *(void *)v7;
    }
    char v10 = [NSString stringWithUTF8String:v9];
    [v6 addObject:v10];
  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
    NonSiriFallbackLocales = (uint64_t **)siri::dialogengine::GetNonSiriFallbackLocales();
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    std::string v13 = *NonSiriFallbackLocales;
    for (j = NonSiriFallbackLocales[1]; v13 != j; v13 += 3)
    {
      std::string v14 = v13;
      if (*((char *)v13 + 23) < 0) {
        std::string v14 = (uint64_t *)*v13;
      }
      v15 = [NSString stringWithUTF8String:v14];
      [v6 addObject:v15];
    }
  }
  __p[0] = &v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v6;
}

+ (id)getFallbackLocales:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  siri::dialogengine::GetFallbackLocales((uint64_t)__p, &v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  id v4 = objc_opt_new();
  uint64_t v5 = v12;
  for (uint64_t i = v13; v5 != i; v5 += 24)
  {
    uint64_t v7 = v5;
    if (*(char *)(v5 + 23) < 0) {
      uint64_t v7 = *(void *)v5;
    }
    char v8 = [NSString stringWithUTF8String:v7];
    [v4 addObject:v8];
  }
  __p[0] = &v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v4;
}

+ (id)getDialogStateFamily:(id)a3
{
  id v3 = a3;
  id v4 = [[DEDialogStateFamily alloc] initWithCatId:v3];

  return v4;
}

+ (id)getDialogStateUseCase:(id)a3
{
  id v3 = a3;
  id v4 = [[DEDialogStateUseCase alloc] initWithCatId:v3];

  return v4;
}

+ (id)getBuiltinDialogMetadataCategoryNamesForLocale:(id)a3
{
  id v3 = a3;
  siri::dialogengine::GetSharedTemplateDir(0, (siri::dialogengine::UpdatableDir *)&v6);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v11, v6.__r_.__value_.__l.__data_, v6.__r_.__value_.__l.__size_);
  }
  else {
    std::string v11 = v6;
  }
  v5[0] = &v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v5);
  v5[0] = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&v6, (char *)[v3 UTF8String]);
  siri::dialogengine::GetDialogMetadata((uint64_t)&v11, &v6);
}

+ (id)getDialogMetadataCategoryNamesForLocale:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v9, (char *)[v5 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)[v6 UTF8String]);
  siri::dialogengine::GetDialogMetadata((uint64_t)v9, &v8);
}

+ (id)getBuiltinDialogMetadataForLocale:(id)a3
{
  id v3 = a3;
  siri::dialogengine::GetSharedTemplateDir(0, (siri::dialogengine::UpdatableDir *)&v6);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v11, v6.__r_.__value_.__l.__data_, v6.__r_.__value_.__l.__size_);
  }
  else {
    std::string v11 = v6;
  }
  v5[0] = &v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v5);
  v5[0] = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&v6, (char *)[v3 UTF8String]);
  siri::dialogengine::GetDialogMetadata((uint64_t)&v11, &v6);
}

+ (id)getDialogMetadataForLocale:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v9, (char *)[v5 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)[v6 UTF8String]);
  siri::dialogengine::GetDialogMetadata((uint64_t)v9, &v8);
}

+ (id)getDialogAssetsVersion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = +[DEExecutor bundleTemplateDir:a3];
  id v6 = [v4 fileURLWithPath:v5 isDirectory:1];
  uint64_t v7 = [a1 getDialogAssetsVersion:v6 enableUpdates:1];

  return v7;
}

+ (id)getDialogAssetsVersion:(id)a3 enableUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 path];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 UTF8String]);

  if (v4)
  {
    id v7 = [v5 path];
    std::string::basic_string[abi:ne180100]<0>(v14, (char *)[v7 UTF8String]);
    siri::dialogengine::GetUpdatedTemplateDir((uint64_t)v14, &v16);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v16;
    *((unsigned char *)&v16.__r_.__value_.__s + 23) = 0;
    v16.__r_.__value_.__s.__data_[0] = 0;
    if (v15 < 0) {
      operator delete(v14[0]);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v16, "");
  if ((siri::dialogengine::ReadAssetDeliveryConfig((uint64_t *)&__p, 0, (uint64_t)&v16, 0) & 1) == 0)
  {
    id v8 = [v5 path];
    uint64_t v9 = [v8 UTF8String];
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to read version of dialog in \"%s\"", v10, v9);
  }
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v11 = &v16;
  }
  else {
    std::string v11 = (std::string *)v16.__r_.__value_.__r.__words[0];
  }
  uint64_t v12 = [NSString stringWithUTF8String:v11];
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

+ (BOOL)runTests:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19[0] = 0;
  memset(v20, 0, sizeof(v20));
  id v7 = +[DEExecutor bundleTemplateDir:v5];
  std::string::basic_string[abi:ne180100]<0>(v17, (char *)[v7 UTF8String]);

  std::string::basic_string[abi:ne180100]<0>(v15, "");
  if (v6) {
    std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v6 UTF8String]);
  }
  else {
    std::string::basic_string[abi:ne180100]<0>(v13, "");
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  siri::dialogengine::TestSuite::LoadTests((uint64_t)v19, (uint64_t)v17, (unsigned __int8 *)v15, 0, (unsigned __int8 *)v13);
  if (v12 < 0) {
    operator delete(__p);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  id v8 = std::string::basic_string[abi:ne180100]<0>(v15, "");
  BOOL v9 = siri::dialogengine::TestRunner::RunTestSuite((uint64_t)v8);
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  v17[0] = (char *)&v20[1] + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);
  v17[0] = v20;
  std::vector<siri::dialogengine::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);

  return v9;
}

+ (BOOL)runTests:(id)a3
{
  id v3 = a3;
  v16[0] = 0;
  memset(v17, 0, sizeof(v17));
  id v4 = +[DEExecutor bundleTemplateDir:v3];
  std::string::basic_string[abi:ne180100]<0>(v14, (char *)[v4 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(v12, "");
  std::string::basic_string[abi:ne180100]<0>(v10, "");
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  siri::dialogengine::TestSuite::LoadTests((uint64_t)v16, (uint64_t)v14, (unsigned __int8 *)v12, 0, (unsigned __int8 *)v10);
  if (v9 < 0) {
    operator delete(__p);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  if (v15 < 0) {
    operator delete(v14[0]);
  }

  id v5 = std::string::basic_string[abi:ne180100]<0>(v14, "");
  BOOL v6 = siri::dialogengine::TestRunner::RunTestSuite((uint64_t)v5);
  if (v15 < 0) {
    operator delete(v14[0]);
  }
  v14[0] = (char *)&v17[1] + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  v14[0] = v17;
  std::vector<siri::dialogengine::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);

  return v6;
}

+ (id)getMorphunPaths
{
  v2 = objc_opt_new();
  id v3 = [v2 getAllPaths];

  return v3;
}

+ (id)getMorphunPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v4 getPath:v3];

  return v5;
}

+ (BOOL)downloadMorphunDataByLocales:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  char v5 = [v4 downloadData:v3];

  return v5;
}

+ (BOOL)downloadMorphunDataByLocale:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  v8[0] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  char v6 = [v4 downloadData:v5];

  return v6;
}

+ (id)resolve:(id)a3 propName:(id)a4 parameters:(id)a5 completion:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v37 = a5;
  id v32 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v52, (char *)[v32 UTF8String]);
  std::operator+<char>();
  char v9 = std::string::append(&v49, "\"/></parameters></cat>");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v51 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  id v36 = v34;
  std::string::basic_string[abi:ne180100]<0>(&v48, (char *)[v36 UTF8String]);
  char v11 = std::string::insert(&v48, 0, "value.");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v49.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  std::operator+<char>();
  char v13 = std::string::append(&v47, "\"/></dialog></all></cat>");
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v48.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
  v38 = objc_opt_new();
  [v38 setEnableUpdates:1];
  v31 = objc_opt_new();
  [v31 setObject:v37 forKey:@"value"];
  [v38 setParameters:v31];
  if (v51 >= 0) {
    char v15 = __p;
  }
  else {
    char v15 = (void **)__p[0];
  }
  v35 = [NSString stringWithUTF8String:v15];
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v16 = &v48;
  }
  else {
    char v16 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  v33 = [NSString stringWithUTF8String:v16];
  v40 = objc_msgSend(v38, "executeWithParams:locale:", v35);
  id v39 = (id)objc_opt_new();
  v42 = objc_opt_new();
  v41 = objc_opt_new();
  [v39 setPrint:v42];
  [v39 setSpeak:v41];
  if (v40)
  {
    v17 = [v40 response];
    BOOL v18 = v17 == 0;

    if (!v18)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v19 = [v40 response];
      uint64_t v20 = v19;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v44 != v22) {
              objc_enumerationMutation(v20);
            }
            char v24 = [*(id *)(*((void *)&v43 + 1) + 8 * i) objectForKey:@"content"];
            v25 = v24;
            if (v24)
            {
              char v26 = [v24 objectForKey:@"print"];
              std::string v27 = [v25 objectForKey:@"speak"];
              if (v26) {
                v28 = v26;
              }
              else {
                v28 = &stru_1F2127290;
              }
              [v42 addObject:v28];
              if (v27) {
                v29 = v27;
              }
              else {
                v29 = &stru_1F2127290;
              }
              [v41 addObject:v29];
            }
          }
          uint64_t v19 = v20;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v54 count:16];
        }
        while (v21);
      }
    }
  }

  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[0]);
  }
  if (v53 < 0) {
    operator delete(v52);
  }

  return v39;
}

+ (id)evaluate:(id)a3 propName:(id)a4 parameters:(id)a5 globals:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char v13 = objc_opt_new();
  if (v12)
  {
    long long v14 = [v12 objectForKey:@"locale"];
  }
  else
  {
    long long v14 = 0;
  }
  [v13 setLocale:v14];
  if (v12)
  {

    char v15 = [v12 objectForKey:@"globalParameters"];
  }
  else
  {
    char v15 = 0;
  }
  [v13 setGlobalParameters:v15];
  if (v12)
  {

    char v16 = [v12 objectForKey:@"userSettings"];
  }
  else
  {
    char v16 = 0;
  }
  [v13 setUserSettings:v16];
  if (v12) {

  }
  [v13 setParameters:v11];
  [v13 setTypeName:v9];
  [v13 setPropName:v10];
  v17 = [v13 evaluate];

  return v17;
}

+ (id)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9
{
  id v9 = CATExecutor(a3, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0);
  return v9;
}

+ (void)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10 = CATExecutor(0, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (void)execute:(id)a3 paramsXML:(id)a4 localeXML:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10 = CATExecutor(a3, 0, 0, a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 completion:(id)a7
{
  id v7 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, 0, 0, a7);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 completion:(id)a8
{
  id v8 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9
{
  id v9 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a9);
}

+ (void)preload
{
}

@end