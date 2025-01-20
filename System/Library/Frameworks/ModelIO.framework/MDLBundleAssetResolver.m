@interface MDLBundleAssetResolver
- (BOOL)canResolveAssetNamed:(id)a3;
- (MDLBundleAssetResolver)initWithBundle:(NSString *)path;
- (NSString)path;
- (id)resolveAssetNamed:(id)a3;
- (void)setPath:(NSString *)path;
@end

@implementation MDLBundleAssetResolver

- (MDLBundleAssetResolver)initWithBundle:(NSString *)path
{
  v5 = path;
  v10.receiver = self;
  v10.super_class = (Class)MDLBundleAssetResolver;
  v6 = [(MDLBundleAssetResolver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, path);
    v8 = v7;
  }

  return v7;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_bundle)
  {
    memset(&__str, 0, sizeof(__str));
    id v6 = v4;
    v8 = (char *)objc_msgSend_cStringUsingEncoding_(v6, v7, 4);
    sub_20B07F8E0(&__str, v8);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    v11 = (unsigned __int8 *)p_str + size;
    if (size)
    {
      v12 = p_str;
      v13 = (std::string *)((char *)p_str + size);
      do
      {
        v14 = v12;
        v15 = (unsigned __int8 *)v12;
        while (1)
        {
          int v16 = *v15++;
          if (v16 == 46) {
            break;
          }
          v14 = (std::string *)v15;
          if (v15 == v11)
          {
            v14 = v13;
            goto LABEL_18;
          }
        }
        v12 = (std::string *)((char *)&v14->__r_.__value_.__l.__data_ + 1);
        v13 = v14;
      }
      while (v15 != v11);
    }
    else
    {
      v14 = p_str;
    }
LABEL_18:
    std::string::size_type v18 = (char *)v14 - (char *)p_str;
    if (v14 == (std::string *)v11) {
      std::string::size_type v19 = -1;
    }
    else {
      std::string::size_type v19 = v18;
    }
    memset(&v27, 0, sizeof(v27));
    std::string::basic_string(&v27, &__str, v19 + 1, size, (std::allocator<char> *)&v26);
    std::string::basic_string(&v26, &__str, 0, v19, (std::allocator<char> *)&v29);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    std::string __str = v26;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      objc_msgSend_stringWithCString_encoding_(NSString, v20, (uint64_t)&__str, 4);
    }
    else {
    v22 = objc_msgSend_stringWithCString_encoding_(NSString, v20, (uint64_t)v26.__r_.__value_.__l.__data_, 4);
    }
    if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      objc_msgSend_stringWithCString_encoding_(NSString, v21, (uint64_t)&v27, 4);
    }
    else {
    v23 = objc_msgSend_stringWithCString_encoding_(NSString, v21, (uint64_t)v27.__r_.__value_.__l.__data_, 4);
    }
    v17 = objc_msgSend_URLForResource_withExtension_(self->_bundle, v24, (uint64_t)v22, v23);

    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  id v5 = a3;
  if (v5 && self->_path)
  {
    id v6 = objc_msgSend_resolveAssetNamed_(self, v4, (uint64_t)v5);
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(NSString *)path
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end