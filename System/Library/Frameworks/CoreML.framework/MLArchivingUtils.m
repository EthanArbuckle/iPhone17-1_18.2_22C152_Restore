@interface MLArchivingUtils
+ (BOOL)parseModelArchive:(void *)a3 modelType:(int *)a4 compilerVersion:(id *)a5 modelVersion:(id *)a6 error:(id *)a7;
+ (id)codedObjectURLFromInputArchiver:(void *)a3;
+ (id)codedObjectURLFromOutputArchiver:(void *)a3;
@end

@implementation MLArchivingUtils

+ (BOOL)parseModelArchive:(void *)a3 modelType:(int *)a4 compilerVersion:(id *)a5 modelVersion:(id *)a6 error:(id *)a7
{
  operator>>((uint64_t)a3);
  if (a4) {
    *a4 = 0;
  }
  v12 = +[MLModelIOUtils deserializeVersionInfoFromArchive:a3 error:a7];
  v13 = v12;
  if (v12)
  {
    if (a5) {
      *a5 = v12;
    }
    v14 = +[MLModelIOUtils deserializeVersionInfoFromArchive:a3 error:a7];
    v15 = v14;
    BOOL v16 = v14 != 0;
    if (a6 && v14) {
      *a6 = v14;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)codedObjectURLFromInputArchiver:(void *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = NSString;
  uint64_t v5 = *(void *)a3;
  if (*(char *)(*(void *)a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v5 + 8), *(void *)(v5 + 16));
  }
  else
  {
    long long v6 = *(_OWORD *)(v5 + 8);
    __p.__r_.__value_.__r.__words[2] = *(void *)(v5 + 24);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v8 = objc_msgSend(v4, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v9 = [v3 fileURLWithPath:v8 isDirectory:1];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v10 = [v9 URLByAppendingPathComponent:@"CodedObject"];

  return v10;
}

+ (id)codedObjectURLFromOutputArchiver:(void *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = NSString;
  uint64_t v5 = *((void *)a3 + 1);
  if (*(char *)(v5 + 55) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v5 + 32), *(void *)(v5 + 40));
  }
  else {
    std::string __p = *(std::string *)(v5 + 32);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v7 = objc_msgSend(v4, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v8 = [v3 fileURLWithPath:v7 isDirectory:1];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v9 = [v8 URLByAppendingPathComponent:@"CodedObject"];

  return v9;
}

@end