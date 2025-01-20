@interface _EARSpeechModelInfo
+ (void)initialize;
- (NSSet)samplingRates;
- (NSSet)tasks;
- (NSString)acousticModelVersion;
- (NSString)acousticProfileVersion;
- (NSString)language;
- (NSString)phoneSetVersion;
- (NSString)version;
- (_EARSpeechModelInfo)initWithConfig:(id)a3;
- (id).cxx_construct;
- (id)_initWithSpeechModelInfo:(const void *)a3;
@end

@implementation _EARSpeechModelInfo

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (id)_initWithSpeechModelInfo:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_EARSpeechModelInfo;
  v4 = [(_EARSpeechModelInfo *)&v7 init];
  v5 = v4;
  if (v4) {
    quasar::SpeechModelInfo::operator=((uint64_t)&v4->_speechModelInfo, (uint64_t)a3);
  }
  return v5;
}

- (_EARSpeechModelInfo)initWithConfig:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_EARSpeechModelInfo;
  v5 = [(_EARSpeechModelInfo *)&v16 init];
  v6 = v5;
  if (!v5)
  {
LABEL_11:
    v11 = v5;
    goto LABEL_12;
  }
  objc_super v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v4];

  if (v8)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v14 = 0;
    }
    quasar::SpeechRecognizer::GetSpeechModelInfo((uint64_t)__p, v15);
    quasar::SpeechModelInfo::operator=((uint64_t)&v5->_speechModelInfo, (long long *)v15);
    quasar::SpeechModelInfo::~SpeechModelInfo((quasar::SpeechModelInfo *)v15);
    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_11;
  }
  v10 = EARLogger::QuasarOSLogger(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_EARSpeechModelInfo initWithConfig:]();
  }

  v11 = 0;
LABEL_12:

  return v11;
}

- (NSString)version
{
  p_speechModelInfo = &self->_speechModelInfo;
  if (*((char *)&self->_speechModelInfo.version.__r_.__value_.var0.var1 + 23) < 0) {
    p_speechModelInfo = (SpeechModelInfo *)p_speechModelInfo->version.__r_.__value_.var0.var1.__data_;
  }
  return (NSString *)[NSString stringWithUTF8String:p_speechModelInfo];
}

- (NSString)acousticModelVersion
{
  p_var0 = &self->_speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[1].super.isa) < 0) {
    p_var0 = *(int **)p_var0;
  }
  return (NSString *)[NSString stringWithUTF8String:p_var0];
}

- (NSSet)samplingRates
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:*((void *)&self[1]._speechModelInfo.version.__r_.__value_.var0.var1 + 2)];
  data = self[1]._speechModelInfo.version.__r_.__value_.var0.var1.__data_;
  v5 = &self[1]._speechModelInfo.version.__r_.__value_.var0.var0.__data_[8];
  if (data != (char *)&self[1]._speechModelInfo.version.__r_.__value_.var0.var1.__size_)
  {
    do
    {
      v6 = (void *)[objc_alloc(NSNumber) initWithInt:*((unsigned int *)data + 7)];
      [v3 addObject:v6];

      objc_super v7 = (char *)*((void *)data + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          objc_super v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (char *)*((void *)data + 2);
          BOOL v9 = *(void *)v8 == (void)data;
          data = v8;
        }
        while (!v9);
      }
      data = v8;
    }
    while (v8 != v5);
  }
  return (NSSet *)v3;
}

- (NSSet)tasks
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:self[2].super.isa];
  id v4 = *(int64_t **)&self[1]._speechModelInfo.version.__r_.var0;
  p_var0 = &self[1]._speechModelInfo.version.var0;
  if (v4 != &self[1]._speechModelInfo.version.var0)
  {
    do
    {
      v6 = v4 + 4;
      if (*((char *)v4 + 55) < 0) {
        v6 = (void *)*v6;
      }
      objc_super v7 = [NSString stringWithUTF8String:v6];
      [v3 addObject:v7];

      int v8 = (int64_t *)v4[1];
      if (v8)
      {
        do
        {
          BOOL v9 = v8;
          int v8 = (int64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          BOOL v9 = (int64_t *)v4[2];
          BOOL v10 = *v9 == (void)v4;
          id v4 = v9;
        }
        while (!v10);
      }
      id v4 = v9;
    }
    while (v9 != p_var0);
  }
  return (NSSet *)v3;
}

- (NSString)language
{
  p_var0 = &self[2]._speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[3].super.isa) < 0) {
    p_var0 = *(int **)p_var0;
  }
  return (NSString *)[NSString stringWithUTF8String:p_var0];
}

- (NSString)phoneSetVersion
{
  p_speechModelInfo = (__long *)&self[3]._speechModelInfo;
  if (*((char *)&self[3]._speechModelInfo.version.__r_.__value_.var0.var1 + 23) < 0) {
    p_speechModelInfo = (__long *)p_speechModelInfo->__data_;
  }
  return (NSString *)[NSString stringWithUTF8String:p_speechModelInfo];
}

- (NSString)acousticProfileVersion
{
  p_var0 = &self[3]._speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[4].super.isa) < 0) {
    p_var0 = *(int **)p_var0;
  }
  return (NSString *)[NSString stringWithUTF8String:p_var0];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 14) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 26) = 0;
  *((void *)self + 15) = 0;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = (char *)self + 208;
  *((void *)self + 29) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = (char *)self + 232;
  *((void *)self + 32) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = (char *)self + 256;
  return self;
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Unexpected exception while initializing EARSpeechModelInfo from configuration file at %@", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Configuration file %@ does not exist", v2, v3, v4, v5, v6);
}

@end