@interface _EARLmBuilder
+ (id)buildLmWithConfig:(id)a3 root:(id)a4 data:(id)a5 dir:(id)a6 shouldStop:(id)a7;
+ (id)generateNgramCountsWithConfig:(id)a3 root:(id)a4 data:(id)a5;
+ (id)loadLmFromDir:(id)a3;
+ (void)removeLmDir:(id)a3;
@end

@implementation _EARLmBuilder

+ (id)buildLmWithConfig:(id)a3 root:(id)a4 data:(id)a5 dir:(id)a6 shouldStop:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v17 = [v16 fileExistsAtPath:v11];

  if (v17)
  {
    if (v11)
    {
      objc_msgSend(v11, "ear_toString");
      if (v12)
      {
LABEL_4:
        objc_msgSend(v12, "ear_toString");
        goto LABEL_10;
      }
    }
    else
    {
      long long buf = 0uLL;
      uint64_t v22 = 0;
      if (v12) {
        goto LABEL_4;
      }
    }
    memset(__p, 0, sizeof(__p));
LABEL_10:
    quasar::makeLmBuildConfig((uint64_t)&buf, (uint64_t)__p);
  }
  v18 = EarLmLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1B1A86000, v18, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  return 0;
}

+ (id)loadLmFromDir:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  LOBYTE(v9) = 0;
  char v10 = 0;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    if (v3)
    {
      objc_msgSend(v3, "ear_toString");
    }
    else
    {
      long long buf = 0uLL;
      uint64_t v12 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    quasar::loadLmFromDirectory((uint64_t)&buf);
  }
  v6 = EarLmLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1B1A86000, v6, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  if (SHIBYTE(v15) < 0) {
    operator delete(v13);
  }

  return 0;
}

+ (void)removeLmDir:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3) {
    objc_msgSend(v3, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::removeLm((uint64_t)__p);
}

+ (id)generateNgramCountsWithConfig:(id)a3 root:(id)a4 data:(id)a5
{
  v12[3] = *(void **)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    memset(v12, 0, 24);
    if (v8) {
      goto LABEL_3;
    }
  }
  memset(__p, 0, sizeof(__p));
LABEL_6:
  quasar::makeLmBuildConfig((uint64_t)v12, (uint64_t)__p);
}

@end