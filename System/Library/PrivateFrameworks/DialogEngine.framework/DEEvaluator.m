@interface DEEvaluator
- (NSString)locale;
- (NSString)propName;
- (NSString)templateDir;
- (NSString)typeName;
- (id)evaluate;
- (id)globalParameters;
- (id)parameters;
- (id)userSettings;
- (void)setGlobalParameters:(id)a3;
- (void)setLocale:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPropName:(id)a3;
- (void)setTemplateDir:(id)a3;
- (void)setTypeName:(id)a3;
- (void)setUserSettings:(id)a3;
@end

@implementation DEEvaluator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userSettings, 0);
  objc_storeStrong(&self->_parameters, 0);
  objc_storeStrong((id *)&self->_propName, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong(&self->_globalParameters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_templateDir, 0);
}

- (void)setUserSettings:(id)a3
{
}

- (id)userSettings
{
  return self->_userSettings;
}

- (void)setParameters:(id)a3
{
}

- (id)parameters
{
  return self->_parameters;
}

- (void)setPropName:(id)a3
{
}

- (NSString)propName
{
  return self->_propName;
}

- (void)setTypeName:(id)a3
{
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setGlobalParameters:(id)a3
{
}

- (id)globalParameters
{
  return self->_globalParameters;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setTemplateDir:(id)a3
{
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (id)evaluate
{
  v60[1] = *MEMORY[0x1E4F143B8];
  v4 = [(DEEvaluator *)self typeName];

  if (v4)
  {
    v6 = [(DEEvaluator *)self propName];

    if (v6)
    {
      v7 = [(DEEvaluator *)self locale];
      if (v7)
      {
        id v2 = [(DEEvaluator *)self locale];
        v8 = (char *)[v2 UTF8String];
      }
      else
      {
        v8 = "";
      }
      std::string::basic_string[abi:ne180100]<0>(v57, v8);
      if (v7) {

      }
      id v10 = [(DEEvaluator *)self typeName];
      std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v10 UTF8String]);

      id v11 = [(DEEvaluator *)self propName];
      std::string::basic_string[abi:ne180100]<0>(v54, (char *)[v11 UTF8String]);

      std::string::basic_string[abi:ne180100]<0>(v53, "{}");
      v12 = objc_opt_new();
      if (v58 >= 0) {
        v13 = v57;
      }
      else {
        v13 = (void *)v57[0];
      }
      uint64_t v14 = [NSString stringWithUTF8String:v13];
      [v12 setObject:v14 forKey:@"locale"];

      v15 = [(DEEvaluator *)self globalParameters];
      LOBYTE(v14) = v15 == 0;

      if ((v14 & 1) == 0)
      {
        v16 = [(DEEvaluator *)self globalParameters];
        [v12 setObject:v16 forKey:@"globalParameters"];
      }
      v17 = [(DEEvaluator *)self parameters];
      BOOL v18 = v17 == 0;

      if (!v18)
      {
        v59 = @"value";
        v19 = [(DEEvaluator *)self parameters];
        v60[0] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
        [v12 setObject:v20 forKey:@"parameters"];
      }
      v21 = [(DEEvaluator *)self templateDir];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        v23 = [(DEEvaluator *)self templateDir];
        [v12 setObject:v23 forKey:@"templateDir"];
      }
      v24 = [(DEEvaluator *)self userSettings];
      BOOL v25 = v24 == 0;

      if (!v25)
      {
        v26 = [(DEEvaluator *)self userSettings];
        [v12 setObject:v26 forKey:@"userSettings"];
      }
      id v52 = 0;
      uint64_t v27 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:3 error:&v52];
      id v41 = v52;

      if (v27)
      {
        id v28 = objc_msgSend([NSString alloc], "initWithData:encoding:", v27, 4, v41);
        MEMORY[0x1C8796900](v53, [v28 UTF8String]);
      }
      std::operator+<char>();
      v29 = std::string::append(&v43, "\" profanityFilter=\"yes\"/></parameters></cat>");
      long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
      std::string::size_type v51 = v29->__r_.__value_.__r.__words[2];
      long long v50 = v30;
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v43.__r_.__value_.__l.__data_);
      }
      uint64_t v31 = v55;
      if ((v55 & 0x80u) != 0) {
        uint64_t v31 = v54[1];
      }
      if (v31) {
        std::operator+<char>();
      }
      else {
        std::string::basic_string[abi:ne180100]<0>(v48, "value");
      }
      std::operator+<char>();
      v32 = std::string::append(&v45, "\">        <all><dialog><var name=\"");
      long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
      v42.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v33;
      v32->__r_.__value_.__l.__size_ = 0;
      v32->__r_.__value_.__r.__words[2] = 0;
      v32->__r_.__value_.__r.__words[0] = 0;
      if ((v49 & 0x80u) == 0) {
        v34 = v48;
      }
      else {
        v34 = (void **)v48[0];
      }
      if ((v49 & 0x80u) == 0) {
        std::string::size_type v35 = v49;
      }
      else {
        std::string::size_type v35 = (std::string::size_type)v48[1];
      }
      v36 = std::string::append(&v42, (const std::string::value_type *)v34, v35);
      long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      v43.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v37;
      v36->__r_.__value_.__l.__size_ = 0;
      v36->__r_.__value_.__r.__words[2] = 0;
      v36->__r_.__value_.__r.__words[0] = 0;
      v38 = std::string::append(&v43, "\"/></dialog></all></cat>");
      long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
      std::string::size_type v47 = v38->__r_.__value_.__r.__words[2];
      long long v46 = v39;
      v38->__r_.__value_.__l.__size_ = 0;
      v38->__r_.__value_.__r.__words[2] = 0;
      v38->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v43.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v42.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v43, "");
      siri::dialogengine::PrepareRequestFromJson(&v44);
    }
    v9 = "No propName specified for the evaluator";
  }
  else
  {
    v9 = "No typeName specified for the evaluator";
  }
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)v9, v5);
  return 0;
}

@end