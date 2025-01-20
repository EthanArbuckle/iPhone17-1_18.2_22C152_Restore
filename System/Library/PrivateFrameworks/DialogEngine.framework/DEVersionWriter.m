@interface DEVersionWriter
+ (BOOL)prepareDirsFor:(id)a3;
+ (id)dataWithHexString:(id)a3;
+ (id)getURLFor:(id)a3 version:(id)a4 base:(id)a5;
+ (id)versionData:(id)a3;
+ (id)versionFile:(id)a3;
+ (id)versionString:(id)a3;
+ (id)versionToString:(id)a3;
- (CC_SHA256state_st)context;
- (DEVersionWriter)init;
- (NSData)version;
- (void)close;
- (void)setContext:(CC_SHA256state_st *)a3;
- (void)setVersion:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEVersionWriter

- (void).cxx_destruct
{
}

- (void)setContext:(CC_SHA256state_st *)a3
{
  long long v3 = *(_OWORD *)a3->count;
  long long v4 = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_context.hash[2] = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_context.hash[6] = v4;
  *(_OWORD *)self->_context.count = v3;
  long long v5 = *(_OWORD *)&a3->wbuf[2];
  long long v6 = *(_OWORD *)&a3->wbuf[6];
  long long v7 = *(_OWORD *)&a3->wbuf[10];
  *(void *)&self->_context.wbuf[14] = *(void *)&a3->wbuf[14];
  *(_OWORD *)&self->_context.wbuf[6] = v6;
  *(_OWORD *)&self->_context.wbuf[10] = v7;
  *(_OWORD *)&self->_context.wbuf[2] = v5;
}

- (CC_SHA256state_st)context
{
  long long v3 = *(_OWORD *)&self->wbuf[14];
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[10];
  *(_OWORD *)&retstr->wbuf[10] = v3;
  *(void *)&retstr->wbuf[14] = *(void *)self[1].hash;
  long long v4 = *(_OWORD *)&self->hash[6];
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[2];
  *(_OWORD *)&retstr->hash[2] = v4;
  long long v5 = *(_OWORD *)&self->wbuf[6];
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[2];
  *(_OWORD *)&retstr->wbuf[2] = v5;
  return self;
}

- (void)setVersion:(id)a3
{
}

- (NSData)version
{
  return self->_version;
}

- (void)close
{
  if (!self->_version)
  {
    long long v3 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    CC_SHA256_Final((unsigned __int8 *)[(NSData *)v3 mutableBytes], &self->_context);
    version = self->_version;
    self->_version = v3;
  }
}

- (void)writeData:(id)a3
{
  id v5 = a3;
  if (!self->_version)
  {
    id v4 = v5;
    CC_SHA256_Update(&self->_context, (const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }
}

- (DEVersionWriter)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEVersionWriter;
  v2 = [(DEVersionWriter *)&v7 init];
  long long v3 = v2;
  if (v2)
  {
    version = v2->_version;
    v2->_version = 0;

    CC_SHA256_Init(&v3->_context);
    id v5 = v3;
  }

  return v3;
}

+ (BOOL)prepareDirsFor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 URLByDeletingLastPathComponent];
    long long v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_super v7 = v6;
    if (v6)
    {
      id v13 = 0;
      char v8 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v13];
      id v9 = v13;
      v10 = v9;
      if (v8)
      {
        BOOL v11 = 1;
LABEL_10:

        goto LABEL_11;
      }
      if (v9) {
        +[DELog error:@"Failed to create dirs for \"%@\": %@", v4, v9];
      }
    }
    else
    {
      v10 = 0;
    }
    BOOL v11 = 0;
    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (id)getURLFor:(id)a3 version:(id)a4 base:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  BOOL v11 = 0;
  if (v7 && v8 && v9)
  {
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
    id v13 = [v12 lastPathComponent];

    v14 = +[DEVersionWriter versionToString:v8];
    if ((unint64_t)[v14 length] > 2)
    {
      id v15 = v10;
      for (uint64_t i = 0; i != 3; ++i)
      {
        v17 = objc_msgSend(v14, "substringWithRange:", i, 1);
        v18 = [v15 URLByAppendingPathComponent:v17 isDirectory:1];

        id v15 = v18;
      }
      v19 = [v18 URLByAppendingPathComponent:v14 isDirectory:1];

      BOOL v11 = [v19 URLByAppendingPathComponent:v13 isDirectory:0];
    }
    else
    {
      +[DELog error:@"Version for \"%@\" too short to generate url", v7];
      BOOL v11 = 0;
    }
  }
  return v11;
}

+ (id)versionFile:(id)a3
{
  id v3 = a3;
  id v4 = [[DEFileReader alloc] initWithURL:v3];
  if (v4)
  {
    id v5 = objc_opt_new();
    +[DEIO copyTo:v5 from:v4];
    long long v6 = [v5 version];
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

+ (id)versionToString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(v3, "length"));
    for (unint64_t i = 0; [v4 length] > i; ++i)
      objc_msgSend(v5, "appendFormat:", @"%02x", *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + i));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)versionString:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = +[DEVersionWriter versionData:v3];

  return v4;
}

+ (id)versionData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 writeData:v3];
  [v4 close];
  id v5 = [v4 version];

  return v5;
}

+ (id)dataWithHexString:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v3 UTF8String]);
  id v4 = 0;
  memset(&v16, 0, sizeof(v16));
  std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  if ((size & 1) == 0)
  {
    if (size)
    {
      for (std::string::size_type i = 0; i < v9; i += 2)
      {
        std::string::basic_string(&__p, &__str, i, 2uLL, (std::allocator<char> *)&v18);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        std::string::value_type v8 = strtol((const char *)p_p, 0, 16);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::string::push_back(&v16, v8);
        std::string::size_type v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v9 = __str.__r_.__value_.__l.__size_;
        }
      }
      unsigned int v10 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      std::string::size_type size = v16.__r_.__value_.__l.__size_;
      std::string::size_type v11 = v16.__r_.__value_.__r.__words[0];
    }
    else
    {
      std::string::size_type v11 = 0;
      unsigned int v10 = 0;
    }
    if ((v10 & 0x80u) == 0) {
      v12 = &v16;
    }
    else {
      v12 = (std::string *)v11;
    }
    if ((v10 & 0x80u) == 0) {
      std::string::size_type v13 = v10;
    }
    else {
      std::string::size_type v13 = size;
    }
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:v13];
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }

  return v4;
}

@end