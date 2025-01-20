@interface _EARContextualData
+ (void)initialize;
- (BOOL)addNamedEntity:(id)a3 metadata:(id)a4;
- (BOOL)containsEntity;
- (_EARContextualData)initWithConfiguration:(id)a3;
- (id).cxx_construct;
- (id)metrics;
- (map<std::string,)getWords;
- (unordered_map<std::string,)getTemplateToAverageCost;
- (unordered_map<std::string,)getTemplateToDeviationCost;
- (void)iterNamedEntitySourceWithApplication:(id)a3 block:(id)a4;
- (void)iterNamedEntitySourceWithApplication:(id)a3 task:(id)a4 block:(id)a5;
- (void)iterRankedContactSourceWithApplication:(id)a3 block:(id)a4;
- (void)iterRankedContactSourceWithApplication:(id)a3 task:(id)a4 block:(id)a5;
@end

@implementation _EARContextualData

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARContextualData)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_EARContextualData;
  v5 = [(_EARContextualData *)&v27 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v6 fileExistsAtPath:v4];

    if (v7)
    {
      if (v4)
      {
        objc_msgSend(v4, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        *(void *)&long long v11 = 0;
      }
      operator new();
    }
    if (quasar::gLogLevel >= 4)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      *(_OWORD *)__p = 0u;
      long long v11 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Contextual data: configuration file does not exist", 50);
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__p);
    }
    v8 = 0;
  }
  else
  {
    v8 = (_EARContextualData *)0;
  }

  return v8;
}

- (BOOL)addNamedEntity:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForKey:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v7 valueForKey:@"category"];
  }
  else
  {
    v9 = 0;
  }

  v10 = [v7 valueForKey:@"language"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = [v7 valueForKey:@"language"];
  }
  else
  {
    long long v11 = 0;
  }

  long long v12 = [v7 valueForKey:@"score"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v7 valueForKey:@"score"];
  }
  else
  {
    long long v13 = 0;
  }

  long long v14 = [v7 valueForKey:@"sourceFramework"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = [v7 valueForKey:@"sourceFramework"];
  }
  else
  {
    long long v15 = 0;
  }

  if ([v6 length] && v15)
  {
    uint64_t v26 = 0;
    int v27 = 0;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)long long v21 = 0u;
    long long v22 = 0u;
    *(_OWORD *)long long v23 = 0u;
    memset(v24, 0, sizeof(v24));
    int v25 = 0;
    if ([v15 intValue] == 1)
    {
      if (v9 && [v11 length])
      {
        if (v6)
        {
          objc_msgSend(v6, "ear_toString");
        }
        else
        {
          long long v28 = 0uLL;
          *(void *)&long long v29 = 0;
        }
        if (SHIBYTE(v21[0]) < 0) {
          operator delete(__p[0]);
        }
        int v25 = objc_msgSend(v9, "intValue", v28, (void)v29);
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          long long v28 = 0uLL;
          *(void *)&long long v29 = 0;
        }
        if (SHIBYTE(v24[3]) < 0) {
          operator delete(v24[1]);
        }
        *(_OWORD *)&v24[1] = v28;
        v24[3] = (void *)v29;
        [v13 doubleValue];
        uint64_t v26 = v18;
        int v17 = 1;
LABEL_42:
        int v27 = v17;
        BOOL v16 = quasar::ContextualData::addNamedEntity((uint64_t **)self->_contextualData.__ptr_, (quasar::ContextualData::NamedEntity *)__p);
        goto LABEL_43;
      }
      if (quasar::gLogLevel >= 4)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v28 = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v28);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v28, (uint64_t)"Contextual data: missing category or language for Portrait named entity", 71);
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v28);
      }
    }
    else if ([v15 intValue] == 2)
    {
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        long long v28 = 0uLL;
        *(void *)&long long v29 = 0;
      }
      if (SHIBYTE(v21[0]) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = v28;
      v21[0] = (void *)v29;
      int v17 = 2;
      goto LABEL_42;
    }
    BOOL v16 = 0;
LABEL_43:
    if (SHIBYTE(v24[3]) < 0) {
      operator delete(v24[1]);
    }
    if (SHIBYTE(v24[0]) < 0) {
      operator delete(v23[0]);
    }
    if (SHIBYTE(v22) < 0) {
      operator delete(v21[1]);
    }
    if (SHIBYTE(v21[0]) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_51;
  }
  if (quasar::gLogLevel >= 4)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v28);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v28, (uint64_t)"Contextual data: invalid contextual named entity data", 53);
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v28);
  }
  BOOL v16 = 0;
LABEL_51:

  return v16;
}

- (void)iterNamedEntitySourceWithApplication:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *))a4;
  ptr = self->_contextualData.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Dictation");
  v9.n128_f64[0] = quasar::ContextualData::getNamedEntityQueryConfig((uint64_t)ptr, &v18, (unsigned __int8 *)__p, (uint64_t)v20);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v19) < 0) {
    operator delete((void *)v18);
  }
  for (i = v21; i; i = (uint64_t *)*i)
  {
    long long v11 = i + 2;
    long long v12 = (void *)MEMORY[0x1B3EA9930](v9);
    if (*((char *)i + 39) < 0) {
      long long v11 = (void *)*v11;
    }
    long long v13 = [NSString stringWithUTF8String:v11];
    long long v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-*((_DWORD *)i + 11)];
    long long v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-*((_DWORD *)i + 12)];
    v7[2](v7, v13, v14, v15);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v20);
}

- (void)iterNamedEntitySourceWithApplication:(id)a3 task:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v26 = a4;
  __n128 v9 = (void (**)(id, id, void *, void *, void))a5;
  ptr = self->_contextualData.__ptr_;
  int v25 = v8;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
  }
  else
  {
    long long v29 = 0uLL;
    uint64_t v30 = 0;
  }
  if (v26)
  {
    objc_msgSend(v26, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v28 = 0;
  }
  v11.n128_f64[0] = quasar::ContextualData::getNamedEntityQueryConfig((uint64_t)ptr, &v29, (unsigned __int8 *)__p, (uint64_t)v31);
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)v29);
  }
  long long v12 = v32;
  if (!v32) {
    goto LABEL_42;
  }
  do
  {
    long long v13 = (void *)MEMORY[0x1B3EA9930](v11);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    quasar::toLower((uint64_t)(v12 + 2), (uint64_t)&v29);
    if (SHIBYTE(v30) < 0)
    {
      if (*((void *)&v29 + 1) == 3)
      {
        BOOL v17 = *(_WORD *)v29 != 27745 || *(unsigned char *)(v29 + 2) != 108;
        operator delete((void *)v29);
        if (!v17)
        {
LABEL_40:
          long long v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-*((_DWORD *)v12 + 11)];
          long long v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-*((_DWORD *)v12 + 12)];
          v9[2](v9, v14, v23, v24, *((int *)v12 + 10));

          goto LABEL_41;
        }
      }
      else
      {
        operator delete((void *)v29);
      }
    }
    else if (SHIBYTE(v30) == 3 && (unsigned __int16)v29 == 27745 && BYTE2(v29) == 108)
    {
      goto LABEL_40;
    }
    long long v29 = 0uLL;
    uint64_t v30 = 0;
    kaldi::SplitStringToVector((const std::string *)(v12 + 2), ",|", 1, (uint64_t)&v29);
    long long v18 = (uint64_t *)*((void *)&v29 + 1);
    for (i = (uint64_t *)v29; i != v18; i += 3)
    {
      if (*((char *)i + 23) < 0)
      {
        if (!i[1]) {
          continue;
        }
        long long v20 = (uint64_t *)*i;
LABEL_37:
        long long v21 = [NSString stringWithUTF8String:v20];
        [v14 addObject:v21];

        continue;
      }
      long long v20 = i;
      if (*((unsigned char *)i + 23)) {
        goto LABEL_37;
      }
    }
    uint64_t v22 = [v14 count];
    __p[0] = &v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    if (v22) {
      goto LABEL_40;
    }
LABEL_41:

    long long v12 = (uint64_t *)*v12;
  }
  while (v12);
LABEL_42:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v31);
}

- (void)iterRankedContactSourceWithApplication:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void))a4;
  ptr = self->_contextualData.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    long long v17 = 0uLL;
    uint64_t v18 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Dictation");
  v9.n128_f64[0] = quasar::ContextualData::getRankedContactQueryConfig((uint64_t)ptr, &v17, (unsigned __int8 *)__p, (uint64_t)v19);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete((void *)v17);
  }
  for (i = v20; i; i = (uint64_t *)*i)
  {
    __n128 v11 = i + 2;
    long long v12 = (void *)MEMORY[0x1B3EA9930](v9);
    if (*((char *)i + 39) < 0) {
      __n128 v11 = (void *)*v11;
    }
    long long v13 = [NSString stringWithUTF8String:v11];
    id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    v7[2](v7, v13, v14, *((unsigned __int8 *)i + 52));
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v19);
}

- (void)iterRankedContactSourceWithApplication:(id)a3 task:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ptr = self->_contextualData.__ptr_;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v19 = 0;
LABEL_6:
  v12.n128_f64[0] = quasar::ContextualData::getRankedContactQueryConfig((uint64_t)ptr, &v20, (unsigned __int8 *)__p, (uint64_t)v22);
  if (SHIBYTE(v19) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v21) < 0) {
    operator delete((void *)v20);
  }
  for (i = v23; i; i = (uint64_t *)*i)
  {
    id v14 = i + 2;
    long long v15 = (void *)MEMORY[0x1B3EA9930](v12);
    if (*((char *)i + 39) < 0) {
      id v14 = (void *)*v14;
    }
    char v16 = [NSString stringWithUTF8String:v14];
    long long v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    (*((void (**)(id, void *, void *, void, void))v10 + 2))(v10, v16, v17, *((unsigned __int8 *)i + 52), *((int *)i + 10));
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v22);
}

- (id)metrics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  ptr = self->_contextualData.__ptr_;
  if (ptr) {
    quasar::ContextualData::getStats((quasar::ContextualData *)ptr);
  }
  id v5 = v3;

  return v5;
}

- (BOOL)containsEntity
{
  ptr = self->_contextualData.__ptr_;
  if (ptr) {
    LOBYTE(ptr) = quasar::ContextualData::containsWords((quasar::ContextualData *)ptr);
  }
  return (char)ptr;
}

- (map<std::string,)getWords
{
  result = (map<std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>> *)self->_contextualData.__ptr_;
  if (result) {
    return (map<std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>> *)quasar::ContextualData::getWords((const void ***)result, (uint64_t *)retstr);
  }
  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.__left_ = 0;
  retstr->var0.var0 = &retstr->var0.var1;
  return result;
}

- (unordered_map<std::string,)getTemplateToAverageCost
{
  result = (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)self->_contextualData.__ptr_;
  if (result) {
    return (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)quasar::ContextualData::getTemplateToAverageCost((quasar::ContextualData *)result, (uint64_t)retstr);
  }
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  return result;
}

- (unordered_map<std::string,)getTemplateToDeviationCost
{
  result = (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)self->_contextualData.__ptr_;
  if (result) {
    return (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)quasar::ContextualData::getTemplateToDeviationCost((quasar::ContextualData *)result, (uint64_t)retstr);
  }
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_contextualData.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end