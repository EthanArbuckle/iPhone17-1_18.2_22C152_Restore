@interface MLReporterUtils
+ (BOOL)archiveModelDetails:(const void *)a3 withName:(const void *)a4 toArchive:(void *)a5 error:(id *)a6;
+ (id)hashFileAt:(id)a3 error:(id *)a4;
@end

@implementation MLReporterUtils

+ (BOOL)archiveModelDetails:(const void *)a3 withName:(const void *)a4 toArchive:(void *)a5 error:(id *)a6
{
  if (*((void *)a3 + 2))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "analytics");
    v9 = OArchive::nestedArchive((char *)a5, (uint64_t)__p);
    v20[0] = *v9;
    v10 = (std::__shared_weak_count *)*((void *)v9 + 2);
    uint64_t v21 = *((void *)v9 + 1);
    v22 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v23, (void *)v9 + 3);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    operator<<((uint64_t)v20, (uint64_t *)a4);
    operator<<((uint64_t)v20, *((void *)a3 + 2));
    v13 = *(char **)a3;
    v11 = (char *)a3 + 8;
    v12 = v13;
    if (v13 != v11)
    {
      do
      {
        operator<<((uint64_t)v20, (uint64_t *)v12 + 4);
        operator<<((uint64_t)v20, (uint64_t *)v12 + 7);
        v14 = (char *)*((void *)v12 + 1);
        if (v14)
        {
          do
          {
            v15 = v14;
            v14 = *(char **)v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            v15 = (char *)*((void *)v12 + 2);
            BOOL v16 = *(void *)v15 == (void)v12;
            v12 = v15;
          }
          while (!v16);
        }
        v12 = v15;
      }
      while (v15 != v11);
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v23[1]);
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  return 1;
}

+ (id)hashFileAt:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x19F3C29E0]();
    id v7 = [v5 path];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
    Archiver::MMappedFile::MMappedFile((uint64_t)v12, (long long *)__p);
    if (v16 < 0) {
      operator delete(__p[0]);
    }

    if (*(void *)len >= 0xFFFFFFFFuLL)
    {
      v10 = +[MLModelErrorUtils IOErrorWithFormat:@"Input file too large to hash"];
      Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v12);
      v9 = 0;
    }
    else
    {
      CC_SHA256(data, len[0], (unsigned __int8 *)__p);
      v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:32];
      v9 = [v8 base64EncodedStringWithOptions:0];

      Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v12);
      v10 = 0;
    }
  }
  else
  {
    v9 = 0;
    v10 = +[MLModelErrorUtils IOErrorWithFormat:@"fileURL is nil"];
  }
  if (a4) {
    *a4 = v10;
  }

  return v9;
}

@end