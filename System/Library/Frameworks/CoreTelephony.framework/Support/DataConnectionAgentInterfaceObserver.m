@interface DataConnectionAgentInterfaceObserver
- (BOOL)pathSatisfied;
- (DataConnectionAgentInterfaceObserver)initWithPathSatisfactionObserver:(DataConnectionAgentPathSatisfactionObserver *)a3 domain:(id)a4 agentType:(id)a5 agentClass:(Class)a6 logName:(const char *)a7 uuid:()basic_string<char queue:()std:(std::allocator<char>> *)a8 :char_traits<char> registry:connectionType:;
- (basic_string<char,)agentType;
- (id).cxx_construct;
- (void)dealloc;
- (void)doUpdateInterface:()basic_string<char;
- (void)doUpdateUUID:()basic_string<char;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)slicingSupport:(BOOL)a3;
@end

@implementation DataConnectionAgentInterfaceObserver

- (basic_string<char,)agentType
{
  if (SHIBYTE(result[1].var0) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_10004FC84(retstr, *((void **)&result[1].__r_.__value_.var0.var1+ 2), *(void *)&result[1].__r_.var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *((_OWORD *)&result[1].__r_.__value_.var0.var1 + 1);
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].var0;
  return result;
}

- (DataConnectionAgentInterfaceObserver)initWithPathSatisfactionObserver:(DataConnectionAgentPathSatisfactionObserver *)a3 domain:(id)a4 agentType:(id)a5 agentClass:(Class)a6 logName:(const char *)a7 uuid:()basic_string<char queue:()std:(std::allocator<char>> *)a8 :char_traits<char> registry:connectionType:
{
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)DataConnectionAgentInterfaceObserver;
  v15 = [(DataConnectionAgentInterfaceObserver *)&v27 init];
  v16 = (std::string *)v15;
  v17 = v15;
  if (v15)
  {
    fPathEvaluator = v15->fPathEvaluator;
    v15->fPathEvaluator = 0;

    fAgentEvaluator = v17->fAgentEvaluator;
    v17->fAgentEvaluator = 0;

    v17->fPathSatisfactionObserver = a3;
    v28 = 0;
    long long v29 = 0uLL;
    ctu::cf::assign();
    v20 = v28;
    v30[0] = v29;
    *(void *)((char *)v30 + 7) = *(void *)((char *)&v29 + 7);
    char v21 = HIBYTE(v29);
    if (*((char *)&v17->fDomain.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(v17->fDomain.__r_.__value_.var0.var1.__data_);
    }
    unint64_t v22 = v30[0];
    v17->fDomain.__r_.__value_.var0.var1.__data_ = v20;
    v17->fDomain.__r_.__value_.var0.var1.__size_ = v22;
    *(unint64_t *)((char *)&v17->fDomain.__r_.__value_.var0.var1.__size_ + 7) = *(void *)((char *)v30 + 7);
    *((unsigned char *)&v17->fDomain.__r_.__value_.var0.var1 + 23) = v21;
    v28 = 0;
    long long v29 = 0uLL;
    ctu::cf::assign();
    v23 = v28;
    v30[0] = v29;
    *(void *)((char *)v30 + 7) = *(void *)((char *)&v29 + 7);
    char v24 = HIBYTE(v29);
    if (v17->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
      operator delete(*(void **)&v17->fDomain.__r_.var0);
    }
    int64_t v25 = v30[0];
    *(void *)&v17->fDomain.__r_.var0 = v23;
    v17->fDomain.var0 = v25;
    *(int64_t *)((char *)&v17->fDomain.var0 + 7) = *(void *)((char *)v30 + 7);
    v17->fAgentType.__r_.__value_.var0.var0.__data_[7] = v24;
    v17->fAgentType.__r_.__value_.var0.var1.__size_ = (unint64_t)a6;
    *((_WORD *)&v17->fAgentType.__r_.__value_.var0.var1 + 8) = 0;
    std::string::operator=(v16 + 4, (const std::string *)a8);
    objc_storeStrong((id *)&v16[5].__r_.__value_.__l.__data_, *v31);
    operator new();
  }

  return 0;
}

- (void)doUpdateUUID:()basic_string<char
{
  std::string::operator=((std::string *)&self->fAgentType.__r_.var0, (const std::string *)a3);
}

- (void)slicingSupport:(BOOL)a3
{
  if (self->fUuid.__r_.__value_.var0.var0.__data_[12] != a3)
  {
    self->fUuid.__r_.__value_.var0.var0.__data_[12] = a3;
    data = self->fUuid.__r_.__value_.var0.var1.__data_;
    if (data)
    {
      v5 = sub_100200FB4((id *)data);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315394;
        v7 = "-[DataConnectionAgentInterfaceObserver slicingSupport:]";
        __int16 v8 = 2080;
        uint64_t v9 = asStringBool(a3);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent: slicing support update: %s", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)doUpdateInterface:()basic_string<char
{
  *((_WORD *)&self->fAgentType.__r_.__value_.var0.var1 + 8) = 0;
  fPathEvaluator = self->fPathEvaluator;
  if (fPathEvaluator)
  {
    if (self->fUuid.__r_.__value_.var0.var1.__data_)
    {
      int v6 = sub_100200FB4((id *)self->fUuid.__r_.__value_.var0.var1.__data_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        p_var0 = &self->fAgentType.__r_.var0;
        if (SHIBYTE(self->fAgentClass) < 0) {
          p_var0 = *(int **)p_var0;
        }
        __int16 v8 = [(NWPathEvaluator *)self->fPathEvaluator description];
        uint64_t v9 = [(NWPathEvaluator *)self->fPathEvaluator parameters];
        v10 = [v9 requiredInterface];
        v11 = [v10 interfaceName];
        int v61 = 136315906;
        v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
        __int16 v63 = 2082;
        v64 = p_var0;
        __int16 v65 = 2114;
        uint64_t v66 = (uint64_t)v8;
        __int16 v67 = 2114;
        v68 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s remove pathEvaluator %{public}@ from %{public}@", (uint8_t *)&v61, 0x2Au);
      }
      fPathEvaluator = self->fPathEvaluator;
    }
    [(NWPathEvaluator *)fPathEvaluator removeObserver:self forKeyPath:@"path"];
    v12 = self->fPathEvaluator;
    self->fPathEvaluator = 0;
  }
  fAgentEvaluator = self->fAgentEvaluator;
  if (fAgentEvaluator)
  {
    if (self->fUuid.__r_.__value_.var0.var1.__data_)
    {
      id v14 = sub_100200FB4((id *)self->fUuid.__r_.__value_.var0.var1.__data_);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = &self->fAgentType.__r_.var0;
        if (SHIBYTE(self->fAgentClass) < 0) {
          v15 = *(int **)v15;
        }
        v16 = [(NWPathEvaluator *)self->fAgentEvaluator description];
        v17 = [(NWPathEvaluator *)self->fAgentEvaluator parameters];
        v18 = [v17 requiredInterface];
        v19 = [v18 interfaceName];
        int v61 = 136315906;
        v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
        __int16 v63 = 2082;
        v64 = v15;
        __int16 v65 = 2114;
        uint64_t v66 = (uint64_t)v16;
        __int16 v67 = 2114;
        v68 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s remove agentEvaluator %{public}@ from %{public}@", (uint8_t *)&v61, 0x2Au);
      }
      fAgentEvaluator = self->fAgentEvaluator;
    }
    [(NWPathEvaluator *)fAgentEvaluator removeObserver:self forKeyPath:@"path"];
    v20 = self->fAgentEvaluator;
    self->fAgentEvaluator = 0;
  }
  char v21 = nw_interface_create_with_name();
  unint64_t v22 = nw_parameters_create();
  nw_parameters_require_interface(v22, v21);
  nw_parameters_set_allow_ultra_constrained();
  data = self->fUuid.__r_.__value_.var0.var1.__data_;
  if (data)
  {
    char v24 = sub_100200FB4((id *)data);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v25 = &self->fAgentType.__r_.var0;
      if (SHIBYTE(self->fAgentClass) < 0) {
        int64_t v25 = *(int **)v25;
      }
      p_fDomain = &self->fDomain;
      if (*((char *)&self->fDomain.__r_.__value_.var0.var1 + 23) < 0) {
        p_fDomain = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_fDomain->__r_.__value_.var0.var1.__data_;
      }
      objc_super v27 = &self->fDomain.__r_.var0;
      if (self->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
        objc_super v27 = *(int **)v27;
      }
      v28 = a3;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
        v28 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      }
      int v61 = 136316162;
      v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
      __int16 v63 = 2082;
      v64 = v25;
      __int16 v65 = 2082;
      uint64_t v66 = (uint64_t)p_fDomain;
      __int16 v67 = 2082;
      v68 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v27;
      __int16 v69 = 2082;
      v70 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s DataConnectionAgentInterfaceObserver path domain = %{public}s, type = %{public}s: updating interface to %{public}s", (uint8_t *)&v61, 0x34u);
    }
  }
  id v29 = objc_alloc((Class)NWPathEvaluator);
  v30 = +[NWParameters parametersWithCParameters:v22];
  v31 = (NWPathEvaluator *)[v29 initWithEndpoint:0 parameters:v30];
  v32 = self->fPathEvaluator;
  self->fPathEvaluator = v31;

  v33 = a3;
  if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
    v33 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
  }
  v34 = self->fPathEvaluator;
  v35 = +[NSString stringWithUTF8String:v33];
  [(NWPathEvaluator *)v34 addObserver:self forKeyPath:@"path" options:5 context:v35];

  v36 = self->fUuid.__r_.__value_.var0.var1.__data_;
  if (v36)
  {
    v37 = sub_100200FB4((id *)v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = &self->fAgentType.__r_.var0;
      if (SHIBYTE(self->fAgentClass) < 0) {
        v38 = *(int **)v38;
      }
      uint64_t v39 = [(NWPathEvaluator *)self->fPathEvaluator description];
      v40 = (void *)v39;
      v41 = a3;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
        v41 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      }
      int v61 = 136315906;
      v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
      __int16 v63 = 2082;
      v64 = v38;
      __int16 v65 = 2114;
      uint64_t v66 = v39;
      __int16 v67 = 2082;
      v68 = v41;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s added observer: new pathEvaluator %{public}@ on %{public}s", (uint8_t *)&v61, 0x2Au);
    }
  }
  xpc_object_t v42 = xpc_array_create(0, 0);
  xpc_array_set_string(v42, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
  xpc_object_t v43 = xpc_array_create(0, 0);
  v44 = v43;
  v45 = &self->fDomain.__r_.var0;
  v46 = &self->fDomain.__r_.var0;
  if (self->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
    v46 = *(int **)v45;
  }
  xpc_array_set_string(v43, 0xFFFFFFFFFFFFFFFFLL, (const char *)v46);
  nw_parameters_set_required_netagent_classes();
  v47 = self->fUuid.__r_.__value_.var0.var1.__data_;
  if (v47)
  {
    v48 = sub_100200FB4((id *)v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = &self->fAgentType.__r_.var0;
      if (SHIBYTE(self->fAgentClass) < 0) {
        v49 = *(int **)v49;
      }
      v50 = &self->fDomain;
      if (*((char *)&self->fDomain.__r_.__value_.var0.var1 + 23) < 0) {
        v50 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v50->__r_.__value_.var0.var1.__data_;
      }
      if (self->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
        v45 = *(int **)v45;
      }
      v51 = a3;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
        v51 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      }
      int v61 = 136316162;
      v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
      __int16 v63 = 2082;
      v64 = v49;
      __int16 v65 = 2082;
      uint64_t v66 = (uint64_t)v50;
      __int16 v67 = 2082;
      v68 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v45;
      __int16 v69 = 2082;
      v70 = v51;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s DataConnectionAgentInterfaceObserver agent domain = %{public}s, type = %{public}s: updating interface to %{public}s", (uint8_t *)&v61, 0x34u);
    }
  }
  id v52 = objc_alloc((Class)NWPathEvaluator);
  v53 = +[NWParameters parametersWithCParameters:v22];
  v54 = (NWPathEvaluator *)[v52 initWithEndpoint:0 parameters:v53];
  v55 = self->fAgentEvaluator;
  self->fAgentEvaluator = v54;

  [(NWPathEvaluator *)self->fAgentEvaluator addObserver:self forKeyPath:@"path" options:5 context:0];
  v56 = self->fUuid.__r_.__value_.var0.var1.__data_;
  if (v56)
  {
    v57 = sub_100200FB4((id *)v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = &self->fAgentType.__r_.var0;
      if (SHIBYTE(self->fAgentClass) < 0) {
        v58 = *(int **)v58;
      }
      uint64_t v59 = [(NWPathEvaluator *)self->fAgentEvaluator description];
      v60 = (void *)v59;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
        a3 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      }
      int v61 = 136315906;
      v62 = "-[DataConnectionAgentInterfaceObserver doUpdateInterface:]";
      __int16 v63 = 2082;
      v64 = v58;
      __int16 v65 = 2114;
      uint64_t v66 = v59;
      __int16 v67 = 2082;
      v68 = a3;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#I %s: NWAgent %{public}s added observer: new agentEvaluator %{public}@ on %{public}s", (uint8_t *)&v61, 0x2Au);
    }
  }
}

- (void)dealloc
{
  fPathEvaluator = self->fPathEvaluator;
  if (fPathEvaluator)
  {
    [(NWPathEvaluator *)fPathEvaluator removeObserver:self forKeyPath:@"path"];
    v4 = self->fPathEvaluator;
    self->fPathEvaluator = 0;
  }
  fAgentEvaluator = self->fAgentEvaluator;
  if (fAgentEvaluator)
  {
    [(NWPathEvaluator *)fAgentEvaluator removeObserver:self forKeyPath:@"path"];
    int v6 = self->fAgentEvaluator;
    self->fAgentEvaluator = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DataConnectionAgentInterfaceObserver;
  [(DataConnectionAgentInterfaceObserver *)&v7 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_100200FB4((id *)&self->fPathAvailable);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (BOOL)pathSatisfied
{
  if (!self->fPathEvaluator)
  {
    data = self->fUuid.__r_.__value_.var0.var1.__data_;
    if (!data) {
      return 0;
    }
    v18 = sub_100200FB4((id *)data);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    buf[0] = 136315138;
    *(void *)&buf[1] = "-[DataConnectionAgentInterfaceObserver pathSatisfied]";
    v19 = "#I %s: pathSatisfied check: NO (fPathEvaluator)";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)buf, 0xCu);
    goto LABEL_32;
  }
  fAgentEvaluator = self->fAgentEvaluator;
  if (!fAgentEvaluator)
  {
    v20 = self->fUuid.__r_.__value_.var0.var1.__data_;
    if (!v20) {
      return 0;
    }
    v18 = sub_100200FB4((id *)v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    buf[0] = 136315138;
    *(void *)&buf[1] = "-[DataConnectionAgentInterfaceObserver pathSatisfied]";
    v19 = "#I %s: pathSatisfied check: NO (fAgentEvaluator)";
    goto LABEL_31;
  }
  v4 = [(NWPathEvaluator *)fAgentEvaluator path];
  if ([v4 usesNetworkAgentType:self->fAgentType.__r_.__value_.var0.var1.__size_])
  {

    goto LABEL_5;
  }
  if (LODWORD(self->fUuid.__r_.__value_.var0.var1.__size_))
  {

LABEL_25:
    char v21 = self->fUuid.__r_.__value_.var0.var1.__data_;
    if (!v21) {
      return 0;
    }
    v18 = sub_100200FB4((id *)v21);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    buf[0] = 136315138;
    *(void *)&buf[1] = "-[DataConnectionAgentInterfaceObserver pathSatisfied]";
    v19 = "#I %s: pathSatisfied check: NO (agentAvailable)";
    goto LABEL_31;
  }
  int v24 = self->fUuid.__r_.__value_.var0.var0.__data_[12];

  if (!v24) {
    goto LABEL_25;
  }
LABEL_5:
  v5 = [(NWPathEvaluator *)self->fPathEvaluator path];
  id v6 = [v5 status];

  if (v6 == (id)1)
  {
    *((_WORD *)&self->fAgentType.__r_.__value_.var0.var1 + 8) = 257;
    objc_super v7 = self->fUuid.__r_.__value_.var0.var1.__data_;
    if (v7)
    {
      __int16 v8 = sub_100200FB4((id *)v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        p_var0 = &self->fAgentType.__r_.var0;
        if (SHIBYTE(self->fAgentClass) < 0) {
          p_var0 = *(int **)p_var0;
        }
        p_fDomain = &self->fDomain;
        if (*((char *)&self->fDomain.__r_.__value_.var0.var1 + 23) < 0) {
          p_fDomain = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_fDomain->__r_.__value_.var0.var1.__data_;
        }
        id v11 = &self->fDomain.__r_.var0;
        if (self->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
          id v11 = *(int **)v11;
        }
        uint64_t v12 = asStringBool(self->fUuid.__r_.__value_.var0.var0.__data_[12]);
        int v13 = self->fAgentType.__r_.__value_.var0.var0.__data_[17];
        int v14 = self->fAgentType.__r_.__value_.var0.var0.__data_[16];
        buf[0] = 136316930;
        *(void *)&buf[1] = "-[DataConnectionAgentInterfaceObserver pathSatisfied]";
        __int16 v26 = 2080;
        objc_super v27 = p_var0;
        __int16 v28 = 2080;
        id v29 = p_fDomain;
        __int16 v30 = 2080;
        v31 = v11;
        __int16 v32 = 2080;
        uint64_t v33 = v12;
        __int16 v34 = 1024;
        int v35 = v13;
        __int16 v36 = 1024;
        int v37 = v14;
        __int16 v38 = 1024;
        int v39 = 1;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s: pathSatisfied check: NWAgent %s agent domain = %s, type = %s, fSlicingSupported = %s: fAvailability = %d, check satisfied path = %d, status = %d", (uint8_t *)buf, 0x46u);
      }
    }
    v15 = self;
    sub_100200FB4((id *)&self->fPathAvailable);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    operator new();
  }
  unint64_t v22 = self->fUuid.__r_.__value_.var0.var1.__data_;
  if (v22)
  {
    v18 = sub_100200FB4((id *)v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[DataConnectionAgentInterfaceObserver pathSatisfied]";
      v19 = "#I %s: pathSatisfied check: NO (pathAvailable)";
      goto LABEL_31;
    }
LABEL_32:
  }
  return 0;
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)&self->fUuid, 0);
  v3 = *(void **)&self->fPathAvailable;
  *(void *)&self->fPathAvailable = 0;

  if (SHIBYTE(self->fAgentClass) < 0) {
    operator delete(*(void **)&self->fAgentType.__r_.var0);
  }
  if (self->fAgentType.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)&self->fDomain.__r_.var0);
  }
  if (*((char *)&self->fDomain.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->fDomain.__r_.__value_.var0.var1.__data_);
  }
  objc_storeStrong((id *)&self->fAgentEvaluator, 0);

  objc_storeStrong((id *)&self->fPathEvaluator, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 16) = 0;
  return self;
}

@end