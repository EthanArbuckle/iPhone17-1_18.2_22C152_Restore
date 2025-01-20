@interface MLSaver
+ (BOOL)copyModelAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 compilerOptions:(id)a5 error:(id *)a6;
+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 error:(id *)a5;
+ (BOOL)saveModelToAssetAtURL:(id)a3 model:(id)a4 error:(id *)a5;
@end

@implementation MLSaver

+ (BOOL)copyModelAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  v10 = [v9 URLForDirectory:99 inDomain:1 appropriateForURL:v8 create:1 error:&v22];
  id v11 = v22;
  if (v10)
  {
    v12 = [v7 lastPathComponent];
    v13 = [v10 URLByAppendingPathComponent:v12 isDirectory:1];

    id v21 = v11;
    char v14 = [v9 copyItemAtURL:v7 toURL:v13 error:&v21];
    id v15 = v21;

    if (v14)
    {
      id v20 = v15;
      char v16 = [v9 replaceItemAtURL:v8 withItemAtURL:v13 backupItemName:0 options:0 resultingItemURL:0 error:&v20];
      id v17 = v20;

      if (v16)
      {
        [v9 removeItemAtURL:v10 error:0];
        BOOL v18 = 1;
      }
      else
      {
        if (a5)
        {
          *a5 = +[MLModelErrorUtils errorWithCode:3, v17, @"Failed to replace model from %@ to %@", v13, v8 underlyingError format];
        }
        [v9 removeItemAtURL:v10 error:0];
        BOOL v18 = 0;
      }
      id v15 = v17;
    }
    else
    {
      if (a5)
      {
        *a5 = +[MLModelErrorUtils errorWithCode:3, v15, @"Failed to copy model from %@ to %@", v7, v13 underlyingError format];
      }
      [v9 removeItemAtURL:v10 error:0];
      BOOL v18 = 0;
    }

    id v11 = v15;
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:3 underlyingError:v11 format:@"Failed to create a working directory URL"];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 compilerOptions:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 conformsToProtocol:&unk_1EF136088])
  {
    if ([v8 saveModelToSpecification:a6]) {
      operator new();
    }
  }
  else if (a6)
  {
    *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"model does not implement protocol MLModelSpecificationSaver"];
  }

  return 0;
}

+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 error:(id *)a5
{
  return +[MLSaver saveModelToArchive:a3 model:a4 compilerOptions:0 error:a5];
}

+ (BOOL)saveModelToAssetAtURL:(id)a3 model:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = NSString;
  id v11 = v8;
  v12 = objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
  if (v12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 fileSystemRepresentation]);
    OArchive::OArchive((uint64_t)v17, (uint64_t)__p, 0);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    char v13 = [a1 saveModelToArchive:v17 model:v9 error:a5];
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v19);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"URL has nil fileSystemRepresentation"];
    char v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

@end