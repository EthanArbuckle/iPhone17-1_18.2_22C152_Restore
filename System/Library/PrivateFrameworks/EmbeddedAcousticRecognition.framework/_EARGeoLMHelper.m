@interface _EARGeoLMHelper
- (_EARGeoLMHelper)initWithConfiguration:(id)a3;
- (_EARGeoLMHelper)initWithLocale:(id)a3 config:(id)a4;
- (id).cxx_construct;
- (id)locale;
- (id)regionIdForLatitude:(double)a3 longitude:(double)a4;
- (id)regionIdForLocale:(id)a3 latitude:(double)a4 longitude:(double)a5;
@end

@implementation _EARGeoLMHelper

- (_EARGeoLMHelper)initWithLocale:(id)a3 config:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  if ([(__CFString *)v7 length] && [(__CFString *)v8 length])
  {
    v19.receiver = self;
    v19.super_class = (Class)_EARGeoLMHelper;
    v9 = [(_EARGeoLMHelper *)&v19 init];
    if (v9)
    {
      v10 = EarGeoLMHelperLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_EARGeoLMHelper initWithLocale:config:]();
      }

      objc_storeStrong((id *)&v9->_locale, a3);
      v18 = &unk_1F0A53260;
      operator new();
    }
    self = (_EARGeoLMHelper *)0;
    v12 = self;
  }
  else
  {
    v11 = EarGeoLMHelperLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(__CFString *)v7 length];
      uint64_t v15 = [(__CFString *)v8 length];
      v16 = @"(none)";
      if (v14) {
        v17 = v7;
      }
      else {
        v17 = @"(none)";
      }
      if (v15) {
        v16 = v8;
      }
      int __p = 138412546;
      __p_4 = v17;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_ERROR, "GeoLM: Cannot initialize helper with locale: %@, config: %@", (uint8_t *)&__p, 0x16u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)regionIdForLocale:(id)a3 latitude:(double)a4 longitude:(double)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  v9 = (quasar::Location *)[(__CFString *)v8 isEqualToString:self->_locale];
  if (v9)
  {
    quasar::Location::makeAny(v9, a4, a5);
    v26[0] = v10;
    v26[1] = v11;
    memset(buf, 0, sizeof(buf));
    value = self->_geography.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::Geography::getGeoContext((uint64_t)value, (quasar::Location *)v26, (uint64_t)buf, (uint64_t)__p, &v24);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    v13 = *(uint64_t **)(v24 + 72);
    if (v13 == *(uint64_t **)(v24 + 80))
    {
      v16 = 0;
    }
    else
    {
      if (*((char *)v13 + 23) < 0)
      {
        v13 = (uint64_t *)*v13;
        uint64_t v14 = *(void *)(*(void *)(v24 + 72) + 8);
      }
      else
      {
        uint64_t v14 = *((unsigned __int8 *)v13 + 23);
      }
      v16 = objc_msgSend(NSString, "ear_stringWithStringView:", v13, v14);
      v17 = EarGeoLMHelperLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[_EARGeoLMHelper regionIdForLocale:latitude:longitude:]();
      }
    }
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v15 = EarGeoLMHelperLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      locale = self->_locale;
      uint64_t v20 = [(__CFString *)v8 length];
      v21 = @"(none)";
      if (v20) {
        v21 = v8;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = locale;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_error_impl(&dword_1B1A86000, v15, OS_LOG_TYPE_ERROR, "GeoLM: This helper only supports %@, not %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)locale
{
  return self->_locale;
}

- (_EARGeoLMHelper)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)_EARGeoLMHelper;
    if ([(_EARGeoLMHelper *)&v10 init])
    {
      v6 = EarGeoLMHelperLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[_EARGeoLMHelper initWithConfiguration:]();
      }

      v9 = &unk_1F0A53260;
      operator new();
    }
    self = (_EARGeoLMHelper *)0;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)regionIdForLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  quasar::Location::makeAny((quasar::Location *)self, a3, a4);
  v23[0] = v5;
  v23[1] = v6;
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v22 = 0;
  value = self->_geography.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  quasar::Geography::getGeoContext((uint64_t)value, (quasar::Location *)v23, (uint64_t)v21, (uint64_t)&__p, &v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v8 = *(long long **)(v19 + 72);
  if (v8 == *(long long **)(v19 + 80))
  {
    objc_super v10 = 0;
  }
  else
  {
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v8, *((void *)v8 + 1));
    }
    else
    {
      long long v9 = *v8;
      __p.__r_.__value_.__r.__words[2] = *((void *)v8 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    uint64_t v11 = EarGeoLMHelperLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      uint64_t v14 = objc_msgSend(NSString, "ear_stringWithStringView:", p_p, size, __p.__r_.__value_.__r.__words[0]);
      -[_EARGeoLMHelper regionIdForLatitude:longitude:](v14, buf, v11);
    }

    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v15 = &__p;
    }
    else {
      uint64_t v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v16 = __p.__r_.__value_.__l.__size_;
    }
    objc_super v10 = objc_msgSend(NSString, "ear_stringWithStringView:", v15, v16, __p.__r_.__value_.__r.__words[0]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[0]);
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_geography.__ptr_.__value_;
  p_geography = &self->_geography;
  uint64_t v3 = (uint64_t)value;
  p_geography->__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<quasar::Geography>::operator()[abi:ne180100]((uint64_t)p_geography, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)initWithLocale:config:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "GeoLM: Internal C++ exception: %s", v3, v4, v5, v6, v7);
}

- (void)initWithLocale:config:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "GeoLM: Internal unknown exception", v2, v3, v4, v5, v6);
}

- (void)initWithLocale:config:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1B1A86000, v1, OS_LOG_TYPE_DEBUG, "GeoLM: Initializing helper with locale: %@, config: %@", v2, 0x16u);
}

- (void)regionIdForLocale:latitude:longitude:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1B1A86000, v0, OS_LOG_TYPE_DEBUG, "GeoLM: Resolved regionId: %@", v1, 0xCu);
}

- (void)initWithConfiguration:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1B1A86000, v0, OS_LOG_TYPE_DEBUG, "GeoLM: geo config path: %@", v1, 0xCu);
}

- (void)regionIdForLatitude:(os_log_t)log longitude:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B1A86000, log, OS_LOG_TYPE_DEBUG, "GeoLM: selected regionId: %@", buf, 0xCu);
}

@end