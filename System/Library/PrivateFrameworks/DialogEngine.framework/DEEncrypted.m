@interface DEEncrypted
+ (BOOL)decryptAllFrom:(id)a3 to:(id)a4;
+ (BOOL)decryptFrom:(id)a3 to:(id)a4 allowAllKeys:(BOOL)a5 keyVersion:(id *)a6;
+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5;
+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5 allowAllKeys:(BOOL)a6;
+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 encryptedPb:(void *)a7;
+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 multipart:(BOOL)a7;
+ (BOOL)isPrivateKey:(id)a3 publicKey:(id)a4;
+ (BOOL)isSymmetric:(unint64_t)a3;
+ (BOOL)wrapFrom:(id)a3 to:(id)a4 encryptedPb:(void *)a5 multipart:(BOOL)a6;
+ (id)decrypt:(id)a3;
+ (id)decrypt:(id)a3 allowAllKeys:(BOOL)a4 keyVersion:(id *)a5;
+ (id)decrypt:(id)a3 keyVersion:(id *)a4;
+ (id)decryptAll:(id)a3;
+ (id)decryptFrom:(id)a3 name:(id)a4 base:(id)a5;
+ (id)encrypt:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5 multipart:(BOOL)a6;
+ (id)encryptFrom:(id)a3 name:(id)a4 base:(id)a5 keyId:(unint64_t)a6 privateKey:(id)a7 multipart:(BOOL)a8;
+ (id)getKey:(unint64_t)a3;
+ (id)getKeyWithVersion:(id)a3;
+ (id)getKeyWithVersion:(id)a3 symmetric:(BOOL *)a4;
+ (id)getSymmetricKey:(id)a3 publicKey:(id)a4 symmetricKeyIV:(id *)a5 signature:(id *)a6;
+ (id)getSymmetricKey:(id)a3 symmetricKeyIV:(id)a4 signature:(id)a5;
+ (id)getSymmetricSrc:(id)a3 publicKey:(id)a4;
+ (id)toEnvelope:(BOOL)a3 iv:(id)a4 hmac:(id)a5 keyVersion:(id)a6 payload:(id)a7;
+ (id)versionFile:(id)a3;
@end

@implementation DEEncrypted

+ (BOOL)decryptAllFrom:(id)a3 to:(id)a4
{
  return +[DEEncrypted decryptFrom:a3 to:a4 version:0 allowAllKeys:1];
}

+ (id)decryptAll:(id)a3
{
  v3 = +[DEEncrypted decrypt:a3 allowAllKeys:1 keyVersion:0];
  return v3;
}

+ (id)toEnvelope:(BOOL)a3 iv:(id)a4 hmac:(id)a5 keyVersion:(id)a6 payload:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v31);
  v33 |= 0x80u;
  BOOL v38 = a3;
  id v15 = v11;
  v16 = (void *)[v15 bytes];
  size_t v17 = [v15 length];
  v33 |= 2u;
  std::string::basic_string[abi:ne180100](&__p, v16, v17);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v35, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v18 = v12;
  v19 = (void *)[v18 bytes];
  size_t v20 = [v18 length];
  v33 |= 4u;
  std::string::basic_string[abi:ne180100](&__p, v19, v20);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v36, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v21 = v13;
  v22 = (void *)[v21 bytes];
  size_t v23 = [v21 length];
  v33 |= 8u;
  std::string::basic_string[abi:ne180100](&__p, v22, v23);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v37, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v24 = v14;
  v25 = (void *)[v24 bytes];
  size_t v26 = [v24 length];
  v33 |= 1u;
  std::string::basic_string[abi:ne180100](&__p, v25, v26);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v34, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  if (google::protobuf::MessageLite::SerializeToString((const char *)&v31, &__p))
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
    v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:p_p length:size];
  }
  else
  {
    v29 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v31 = &unk_1F21231A8;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v31);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v32);

  return v29;
}

+ (id)versionFile:(id)a3
{
  id v3 = a3;
  v4 = [DERewindableReader alloc];
  v5 = [[DEFileReader alloc] initWithURL:v3];
  v6 = [(DERewindableReader *)v4 initWithReader:v5];

  if (v6)
  {
    v7 = objc_opt_new();
    if (+[DEEncrypted decryptFrom:v6 to:v7 allowAllKeys:0 keyVersion:0])
    {
      v8 = [v7 version];
    }
    else
    {
      +[DELog error:@"Failed to decrypt from %@", v3];
      v8 = 0;
    }
  }
  else
  {
    +[DELog error:@"Failed to create reader from %@", v3];
    v8 = 0;
  }

  return v8;
}

+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 multipart:(BOOL)a7
{
  BOOL v7 = a7;
  v45[5] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = v14;
  if (v14)
  {
    id v44 = 0;
    id v16 = [v14 URLForDirectory:99 inDomain:1 appropriateForURL:v12 create:1 error:&v44];
    id v17 = v44;
    if (v17)
    {
      +[DELog error:@"Failed create tmp dir for %@: %@", v11, v17];
LABEL_4:
      BOOL v18 = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (!v16)
    {
      +[DELog error:@"Failed create tmp dir for %@", v11];
      id v16 = 0;
      goto LABEL_4;
    }
    v19 = [v16 URLByStandardizingPath];

    BOOL v38 = [v19 URLByAppendingPathComponent:@"tmp" isDirectory:0];
    uint64_t v36 = [v19 URLByAppendingPathComponent:@"wrapped" isDirectory:0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __57__DEEncrypted_encryptFrom_to_keyId_privateKey_multipart___block_invoke;
    v41[3] = &unk_1E651E5F0;
    id v20 = v15;
    id v42 = v20;
    id v16 = v19;
    id v43 = v16;
    v45[0] = v41;
    v45[4] = 0;
    v37 = [[DEFileReader alloc] initWithURL:v11];
    if (!v37)
    {
      +[DELog error:@"Failed to create reader from %@", v11];
      BOOL v18 = 0;
LABEL_26:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v45);
      goto LABEL_27;
    }
    uint64_t v35 = [[DEFileWriter alloc] initWithURL:v38];
    if (!v35)
    {
      +[DELog error:@"Failed to create writer to %@", v38];
      BOOL v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v39);
    if (!+[DEEncrypted encryptFrom:v37 to:v35 keyId:a5 privateKey:v13 encryptedPb:&v39])
    {
      BOOL v18 = 0;
LABEL_24:
      v39 = &unk_1F21231A8;
      siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v39);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v40);
      goto LABEL_25;
    }
    id v21 = [[DEFileReader alloc] initWithURL:v38];
    if (!v21)
    {
      +[DELog error:@"Failed to create reader from %@", v38];
      BOOL v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v22 = [[DEFileWriter alloc] initWithURL:v36];
    uint64_t v34 = v22;
    if (v22)
    {
      if (+[DEEncrypted wrapFrom:v21 to:v22 encryptedPb:&v39 multipart:v7])
      {
        size_t v23 = [v12 path];
        char v24 = [v20 fileExistsAtPath:v23 isDirectory:0];

        if (v24)
        {
LABEL_14:
          BOOL v18 = 1;
LABEL_22:

          goto LABEL_23;
        }
        if (+[DEVersionWriter prepareDirsFor:v12])
        {
          id v26 = [v36 path];
          v27 = (const std::__fs::filesystem::path *)[v26 UTF8String];
          id v28 = [v12 path];
          v29 = (const std::__fs::filesystem::path *)[v28 UTF8String];
          rename(v27, v29, v30);
          LOBYTE(v27) = v31 == 0;

          if (v27) {
            goto LABEL_14;
          }
          uint64_t v32 = *__error();
          int v33 = __error();
          +[DELog error:@"Failed to rename encrypted file from \"%@\" to \"%@\": %d (%s)", v36, v12, v32, strerror(*v33)];
        }
      }
    }
    else
    {
      +[DELog error:@"Failed to create writer no %@", v36];
    }
    BOOL v18 = 0;
    goto LABEL_22;
  }
  BOOL v18 = 0;
LABEL_28:

  return v18;
}

void __57__DEEncrypted_encryptFrom_to_keyId_privateKey_multipart___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;
  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    +[DELog error:@"Failed to remove tmp dir \"%@\": %@", *(void *)(a1 + 40), v5];
  }
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5
{
  return +[DEEncrypted decryptFrom:a3 to:a4 version:a5 allowAllKeys:0];
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5 allowAllKeys:(BOOL)a6
{
  v41[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = v11;
  if (v11)
  {
    id v40 = 0;
    id v13 = [v11 URLForDirectory:99 inDomain:1 appropriateForURL:v9 create:1 error:&v40];
    id v14 = v40;
    if (v14)
    {
      +[DELog error:@"Failed create tmp dir for %@: %@", v8, v14];
LABEL_4:
      BOOL v15 = 0;
LABEL_26:

      goto LABEL_27;
    }
    if (!v13)
    {
      +[DELog error:@"Failed create tmp dir for %@", v8];
      id v13 = 0;
      goto LABEL_4;
    }
    id v16 = [v13 URLByStandardizingPath];

    uint64_t v36 = [v16 URLByAppendingPathComponent:@"tmp" isDirectory:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __51__DEEncrypted_decryptFrom_to_version_allowAllKeys___block_invoke;
    v37[3] = &unk_1E651E5F0;
    id v17 = v12;
    id v38 = v17;
    id v13 = v16;
    id v39 = v13;
    v41[0] = v37;
    void v41[4] = 0;
    BOOL v18 = [DERewindableReader alloc];
    v19 = [[DEFileReader alloc] initWithURL:v8];
    id v20 = [(DERewindableReader *)v18 initWithReader:v19];

    if (!v20)
    {
      +[DELog error:@"Failed to create reader from %@", v8];
      BOOL v15 = 0;
LABEL_25:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v41);
      goto LABEL_26;
    }
    uint64_t v35 = [[DEFileWriter alloc] initWithURL:v36];
    if (!+[DEEncrypted decryptFrom:to:allowAllKeys:keyVersion:](DEEncrypted, "decryptFrom:to:allowAllKeys:keyVersion:", v20))
    {
      +[DELog error:@"Failed to decrypt from %@ to %@", v8, v36];
      BOOL v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v34 = +[DEVersionWriter versionFile:v36];
    if (v10 && ([v10 isEqualToData:v34] & 1) == 0)
    {
      int v31 = @"Failed get expected version in decrypt of file from \"%@\"";
      id v32 = v8;
    }
    else
    {
      id v21 = [v9 path];
      char v22 = [v17 fileExistsAtPath:v21 isDirectory:0];

      if (v22)
      {
LABEL_12:
        BOOL v15 = 1;
LABEL_23:

        goto LABEL_24;
      }
      if (+[DEVersionWriter prepareDirsFor:v9])
      {
        id v23 = [v36 path];
        char v24 = (const std::__fs::filesystem::path *)[v23 UTF8String];
        id v25 = [v9 path];
        id v26 = (const std::__fs::filesystem::path *)[v25 UTF8String];
        rename(v24, v26, v27);
        LOBYTE(v24) = v28 == 0;

        if (v24) {
          goto LABEL_12;
        }
        uint64_t v29 = *__error();
        v30 = __error();
        +[DELog error:@"Failed to rename decrypted file from \"%@\" to \"%@\": %d (%s)", v36, v9, v29, strerror(*v30)];
LABEL_22:
        BOOL v15 = 0;
        goto LABEL_23;
      }
      int v31 = @"Failed to prepare dirs for %@";
      id v32 = v9;
    }
    +[DELog error:](DELog, "error:", v31, v32);
    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_27:

  return v15;
}

void __51__DEEncrypted_decryptFrom_to_version_allowAllKeys___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;
  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    +[DELog error:@"Failed to remove tmp dir \"%@\": %@", *(void *)(a1 + 40), v5];
  }
}

+ (id)decryptFrom:(id)a3 name:(id)a4 base:(id)a5
{
  v41[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  id v11 = 0;
  if (v7 && v8 && v9)
  {
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (!v12)
    {
      id v11 = 0;
LABEL_29:

      goto LABEL_30;
    }
    id v13 = v10;
    id v40 = 0;
    id v14 = [v12 URLForDirectory:99 inDomain:1 appropriateForURL:v13 create:1 error:&v40];
    id v15 = v40;
    if (v15)
    {
      +[DELog error:@"Failed create tmp dir for %@: %@", v7, v15];
LABEL_7:
      id v11 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (!v14)
    {
      +[DELog error:@"Failed create tmp dir for %@", v7];
      id v14 = 0;
      goto LABEL_7;
    }
    id v16 = [v14 URLByStandardizingPath];

    uint64_t v36 = [v16 URLByAppendingPathComponent:@"tmp" isDirectory:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __37__DEEncrypted_decryptFrom_name_base___block_invoke;
    v37[3] = &unk_1E651E5F0;
    id v17 = v12;
    id v38 = v17;
    id v14 = v16;
    id v39 = v14;
    v41[0] = v37;
    void v41[4] = 0;
    BOOL v18 = [DERewindableReader alloc];
    v19 = [[DEFileReader alloc] initWithURL:v7];
    id v20 = [(DERewindableReader *)v18 initWithReader:v19];

    if (!v20)
    {
      +[DELog error:@"Failed to create reader from %@", v7];
      id v11 = 0;
LABEL_27:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v41);
      goto LABEL_28;
    }
    id v21 = [[DEFileWriter alloc] initWithURL:v36];
    uint64_t v35 = v21;
    if (v21)
    {
      if (+[DEEncrypted decryptFrom:v20 to:v21 allowAllKeys:0 keyVersion:0])
      {
        int v33 = +[DEVersionWriter versionFile:v36];
        uint64_t v34 = +[DEVersionWriter getURLFor:version:base:](DEVersionWriter, "getURLFor:version:base:", v8);
        char v22 = [v34 path];
        char v23 = [v17 fileExistsAtPath:v22 isDirectory:0];

        if (v23)
        {
LABEL_14:
          id v11 = v33;
LABEL_25:

          goto LABEL_26;
        }
        if (+[DEVersionWriter prepareDirsFor:v34])
        {
          id v32 = [v36 path];
          char v24 = (const std::__fs::filesystem::path *)[v32 UTF8String];
          id v25 = [v34 path];
          id v26 = (const std::__fs::filesystem::path *)[v25 UTF8String];
          rename(v24, v26, v27);
          LOBYTE(v24) = v28 == 0;

          if (v24) {
            goto LABEL_14;
          }
          uint64_t v29 = *__error();
          v30 = __error();
          +[DELog error:@"Failed to rename decrypted file from \"%@\" to \"%@\": %d (%s)", v36, v34, v29, strerror(*v30)];
        }
        else
        {
          +[DELog error:@"Failed to prepare dirs for %@", v34];
        }
        id v11 = 0;
        goto LABEL_25;
      }
      +[DELog error:@"Failed to decrypt from %@ to %@", v7, v36];
    }
    else
    {
      +[DELog error:@"Failed to create writer no %@", v36];
    }
    id v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:

  return v11;
}

void __37__DEEncrypted_decryptFrom_name_base___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;
  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    +[DELog error:@"Failed to remove tmp dir \"%@\": %@", *(void *)(a1 + 40), v5];
  }
}

+ (id)encryptFrom:(id)a3 name:(id)a4 base:(id)a5 keyId:(unint64_t)a6 privateKey:(id)a7 multipart:(BOOL)a8
{
  BOOL v8 = a8;
  v51[5] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = 0;
  if (v13 && v14 && v15)
  {
    BOOL v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    v19 = v18;
    if (!v18)
    {
      id v17 = 0;
LABEL_36:

      goto LABEL_37;
    }
    id v50 = 0;
    id v20 = [v18 URLForDirectory:99 inDomain:1 appropriateForURL:v15 create:1 error:&v50];
    id v21 = v50;
    if (v21)
    {
      +[DELog error:@"Failed create tmp dir for %@: %@", v13, v21];
LABEL_7:
      id v17 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (!v20)
    {
      +[DELog error:@"Failed create tmp dir for %@", v13];
      id v20 = 0;
      goto LABEL_7;
    }
    v41 = [v20 URLByStandardizingPath];

    id v44 = [v41 URLByAppendingPathComponent:@"tmp" isDirectory:0];
    id v42 = [v41 URLByAppendingPathComponent:@"wrapped" isDirectory:0];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __64__DEEncrypted_encryptFrom_name_base_keyId_privateKey_multipart___block_invoke;
    v47[3] = &unk_1E651E5F0;
    id v38 = v19;
    id v48 = v38;
    id v20 = v41;
    id v49 = v20;
    v51[0] = v47;
    v51[4] = 0;
    id v43 = [[DEFileReader alloc] initWithURL:v13];
    if (!v43)
    {
      +[DELog error:@"Failed to create reader from %@", v13];
      id v17 = 0;
LABEL_34:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v51);
      goto LABEL_35;
    }
    id v40 = [[DEFileWriter alloc] initWithURL:v44];
    if (!v40)
    {
      +[DELog error:@"Failed to create writer to %@", v44];
      id v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
    siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v45);
    if (!+[DEEncrypted encryptFrom:v43 to:v40 keyId:a6 privateKey:v16 encryptedPb:&v45])
    {
      id v17 = 0;
LABEL_32:
      v45 = &unk_1F21231A8;
      siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v45);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v46);
      goto LABEL_33;
    }
    v37 = [[DEFileReader alloc] initWithURL:v44];
    if (!v37)
    {
      +[DELog error:@"Failed to create reader from %@", v44];
      id v17 = 0;
LABEL_31:

      goto LABEL_32;
    }
    char v22 = [[DEFileWriter alloc] initWithURL:v42];
    uint64_t v36 = v22;
    if (v22)
    {
      if (+[DEEncrypted wrapFrom:v37 to:v22 encryptedPb:&v45 multipart:v8])
      {
        uint64_t v34 = +[DEVersionWriter versionFile:v42];
        uint64_t v35 = +[DEVersionWriter getURLFor:version:base:](DEVersionWriter, "getURLFor:version:base:", v14);
        char v23 = [v35 path];
        char v24 = [v38 fileExistsAtPath:v23 isDirectory:0];

        if (v24)
        {
LABEL_17:
          id v17 = v34;
LABEL_29:

          goto LABEL_30;
        }
        if (+[DEVersionWriter prepareDirsFor:v35])
        {
          id v39 = [v42 path];
          id v25 = (const std::__fs::filesystem::path *)[v39 UTF8String];
          id v26 = [v35 path];
          v27 = (const std::__fs::filesystem::path *)[v26 UTF8String];
          rename(v25, v27, v28);
          BOOL v30 = v29 == 0;

          if (v30) {
            goto LABEL_17;
          }
          uint64_t v31 = *__error();
          id v32 = __error();
          +[DELog error:@"Failed to rename encrypted file from \"%@\" to \"%@\": %d (%s)", v42, v35, v31, strerror(*v32)];
        }
        id v17 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      +[DELog error:@"Failed to create writer no %@", v42];
    }
    id v17 = 0;
LABEL_30:

    goto LABEL_31;
  }
LABEL_37:

  return v17;
}

void __64__DEEncrypted_encryptFrom_name_base_keyId_privateKey_multipart___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;
  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    +[DELog error:@"Failed to remove tmp dir \"%@\": %@", *(void *)(a1 + 40), v5];
  }
}

+ (id)encrypt:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5 multipart:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = [[DEDataReader alloc] initWithData:v9];
  id v12 = objc_opt_new();
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v19);
  if (+[DEEncrypted encryptFrom:v11 to:v12 keyId:a4 privateKey:v10 encryptedPb:&v19])
  {
    id v13 = [DEDataReader alloc];
    id v14 = [v12 data];
    id v15 = [(DEDataReader *)v13 initWithData:v14];

    id v16 = objc_opt_new();
    if (+[DEEncrypted wrapFrom:v15 to:v16 encryptedPb:&v19 multipart:v6])
    {
      id v17 = [v16 data];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }
  v19 = &unk_1F21231A8;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v19);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v20);

  return v17;
}

+ (BOOL)wrapFrom:(id)a3 to:(id)a4 encryptedPb:(void *)a5 multipart:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  if (!a6)
  {
    id v11 = [v9 readData];
    id v12 = (void *)[v11 bytes];
    size_t v13 = [v11 length];
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100](&__p, v12, v13);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 3, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  memset(&__p, 0, sizeof(__p));
  BOOL v14 = google::protobuf::MessageLite::SerializeToString((const char *)a5, &__p);
  if (v14)
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
    id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:p_p length:size];
    if (a6)
    {
      BOOL v18 = [[DEMultipartWriter alloc] initWithWriter:v10];
      [(DEMultipartWriter *)v18 writeData:v17];
      [(DEMultipartWriter *)v18 newPart];
      +[DEIO copyTo:v18 from:v9];
      [(DEMultipartWriter *)v18 closeMessage];
    }
    else
    {
      [v10 writeData:v17];
      [v10 close];
    }
  }
  else
  {
    +[DELog error:@"Failed to serialize data to write encrypted blob"];
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v14;
}

+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 encryptedPb:(void *)a7
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  BOOL v14 = 0;
  if (v11 && v12 && a7)
  {
    id v15 = +[DEEncrypted getKey:a5];
    if (v15)
    {
      if (+[DEEncrypted isSymmetric:a5]
        || +[DEEncrypted isPrivateKey:v13 publicKey:v15])
      {
        if (+[DEEncrypted isSymmetric:a5])
        {
          id v47 = v15;
          id v44 = 0;
          id v45 = 0;
        }
        else
        {
          id v49 = 0;
          id v50 = 0;
          id v47 = +[DEEncrypted getSymmetricKey:v13 publicKey:v15 symmetricKeyIV:&v50 signature:&v49];
          id v45 = v50;
          id v44 = v49;
        }
        id v48 = +[DESecurityUtils getRandomIV];
        v46 = [[DEHmac alloc] initWithKey:v47 iv:v48];
        id v16 = [DEMultiWriter alloc];
        v53[0] = v12;
        v53[1] = v46;
        id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
        BOOL v18 = [(DEMultiWriter *)v16 initWithWriters:v17];

        v19 = [[DECryptor alloc] initWithWriter:v18 operation:0 key:v47 iv:v48];
        id v20 = [[DECompressWriter alloc] initWithWriter:v19];

        +[DEIO copyTo:v20 from:v11];
        BOOL v21 = [(DECompressWriter *)v20 compressed];
        id v43 = [(DEHmac *)v46 hmac];
        if (+[DEEncrypted isSymmetric:a5])
        {
          char v22 = 0;
        }
        else
        {
          char v22 = +[DESecurityUtils sign:v43 privateKey:v13];
          if (!v22)
          {
            BOOL v14 = 0;
LABEL_31:

            goto LABEL_32;
          }
        }
        id v42 = +[DEVersionWriter versionData:v15];
        *((_DWORD *)a7 + 4) |= 0x80u;
        *((unsigned char *)a7 + 80) = v21;
        id v23 = v48;
        char v24 = (void *)[v23 bytes];
        size_t v25 = [v23 length];
        *((_DWORD *)a7 + 4) |= 2u;
        std::string::basic_string[abi:ne180100](&__p, v24, v25);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 4, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
        id v26 = v43;
        v27 = (void *)[v26 bytes];
        size_t v28 = [v26 length];
        *((_DWORD *)a7 + 4) |= 4u;
        std::string::basic_string[abi:ne180100](&__p, v27, v28);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 5, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
        id v29 = v42;
        BOOL v30 = (void *)[v29 bytes];
        size_t v31 = [v29 length];
        *((_DWORD *)a7 + 4) |= 8u;
        std::string::basic_string[abi:ne180100](&__p, v30, v31);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 6, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
        if (v45)
        {
          id v32 = v45;
          int v33 = (void *)[v32 bytes];
          size_t v34 = [v32 length];
          *((_DWORD *)a7 + 4) |= 0x10u;
          std::string::basic_string[abi:ne180100](&__p, v33, v34);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 7, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
        }
        if (v44)
        {
          id v35 = v44;
          uint64_t v36 = (void *)[v35 bytes];
          size_t v37 = [v35 length];
          *((_DWORD *)a7 + 4) |= 0x20u;
          std::string::basic_string[abi:ne180100](&__p, v36, v37);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 8, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
        }
        if (v22)
        {
          id v38 = v22;
          id v39 = (void *)[v38 bytes];
          size_t v40 = [v38 length];
          *((_DWORD *)a7 + 4) |= 0x40u;
          std::string::basic_string[abi:ne180100](&__p, v39, v40);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 9, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
        }

        BOOL v14 = 1;
        goto LABEL_31;
      }
    }
    else
    {
      +[DELog error:@"Can't encrypt with nil key"];
    }
    BOOL v14 = 0;
LABEL_32:
  }
  return v14;
}

+ (id)decrypt:(id)a3
{
  uint64_t v3 = +[DEEncrypted decrypt:a3 allowAllKeys:0 keyVersion:0];
  return v3;
}

+ (id)decrypt:(id)a3 keyVersion:(id *)a4
{
  char v4 = +[DEEncrypted decrypt:a3 allowAllKeys:0 keyVersion:a4];
  return v4;
}

+ (id)decrypt:(id)a3 allowAllKeys:(BOOL)a4 keyVersion:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = [DERewindableReader alloc];
  id v9 = [[DEDataReader alloc] initWithData:v7];
  id v10 = [(DERewindableReader *)v8 initWithReader:v9];

  id v11 = objc_opt_new();
  if (+[DEEncrypted decryptFrom:v10 to:v11 allowAllKeys:v6 keyVersion:a5])
  {
    id v12 = [v11 data];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 allowAllKeys:(BOOL)a5 keyVersion:(id *)a6
{
  BOOL v7 = a5;
  v46[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  BOOL v12 = 0;
  if (!v9 || !v10) {
    goto LABEL_46;
  }
  if (([v9 isRewindable] & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_46;
  }
  if (a6) {
    *a6 = 0;
  }
  id v13 = [[DEMultipartReader alloc] initWithReader:v9];
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v43);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v42 = 0;
  if (v13)
  {
    BOOL v14 = [(DEMultipartReader *)v13 readData];
    if (!v14 || ![(DEMultipartReader *)v13 nextPart])
    {
      BOOL v12 = 0;
LABEL_42:

      goto LABEL_43;
    }
    id v15 = v14;
    std::string::basic_string[abi:ne180100](&__dst, (void *)[(DEDataReader *)v15 bytes], [(DEDataReader *)v15 length]);
  }
  else
  {
    id v15 = [v9 readData];
    std::string::basic_string[abi:ne180100](&__dst, (void *)[(DEDataReader *)v15 bytes], [(DEDataReader *)v15 length]);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  *(_OWORD *)__n128 __p = __dst;
  uint64_t v42 = v40;

  if (google::protobuf::MessageLite::ParseFromString(&v43, __p))
  {
    if (v13)
    {
      BOOL v14 = v13;
    }
    else
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      BOOL v14 = [[DEDataReader alloc] initWithData:v16];
    }
    id v38 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v35 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    int v17 = v45;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    LOBYTE(__dst) = 0;
    id v36 = (id)v18;
    size_t v37 = +[DEEncrypted getKeyWithVersion:symmetric:](DEEncrypted, "getKeyWithVersion:symmetric:");
    if (!v37)
    {
      v19 = +[DEVersionWriter versionToString:v36];
      +[DELog error:@"Failed to find key with version %@", v19];
      BOOL v12 = 0;
LABEL_38:

      id v32 = v37;
LABEL_41:

      goto LABEL_42;
    }
    if ((_BYTE)__dst)
    {
      if (v7)
      {
        id v34 = v37;
        goto LABEL_30;
      }
      id v20 = @"Found unsupported key";
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7
        && !+[DESecurityUtils verify:v34 expected:v35 publicKey:v37])
      {
        +[DELog error:@"Failed to verify hmac"];
        BOOL v12 = 0;
LABEL_37:
        v19 = v34;
        goto LABEL_38;
      }
      BOOL v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      char v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      uint64_t v23 = +[DEEncrypted getSymmetricKey:v37 symmetricKeyIV:v21 signature:v22];

      id v34 = (id)v23;
      if (v23)
      {
LABEL_30:
        char v24 = v11;
        if (v17)
        {
          size_t v25 = [[DEDecompressWriter alloc] initWithWriter:v24];

          char v24 = v25;
        }
        id v26 = [[DECryptor alloc] initWithWriter:v24 operation:1 key:v34 iv:v38];

        v27 = [[DEHmac alloc] initWithKey:v34 iv:v38];
        size_t v28 = [DEMultiWriter alloc];
        v46[0] = v26;
        v46[1] = v27;
        id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
        BOOL v30 = [(DEMultiWriter *)v28 initWithWriters:v29];

        +[DEIO copyTo:v30 from:v14];
        size_t v31 = [(DEHmac *)v27 hmac];
        BOOL v12 = +[DEHmac verify:v35 computed:v31];

        if (v12)
        {
          if (a6) {
            *a6 = v36;
          }
        }
        else
        {
          +[DELog error:@"Failed to verify payload"];
        }

        goto LABEL_37;
      }
      id v20 = @"Failed to find key for symmetric decryption";
    }
    id v32 = v37;
    +[DELog error:v20];
    BOOL v12 = 0;
    goto LABEL_41;
  }
  +[DELog error:@"Failed to parse protobuf"];
  BOOL v12 = 0;
LABEL_43:
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  id v43 = &unk_1F21231A8;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v43);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v44);

LABEL_46:
  return v12;
}

+ (id)getSymmetricKey:(id)a3 publicKey:(id)a4 symmetricKeyIV:(id *)a5 signature:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10 && a5 && a6)
  {
    *a5 = 0;
    *a6 = 0;
    id v13 = +[DESecurityUtils getRandomIV];
    if (v13)
    {
      BOOL v14 = +[DEEncrypted getSymmetricSrc:v13 publicKey:v11];
      id v15 = +[DESecurityUtils sign:v14 privateKey:v9];
      if (v15)
      {
        BOOL v12 = +[DESecurityUtils getKeyFromData:v14];
        if (v12)
        {
          *a5 = v13;
          *a6 = v15;
          id v16 = v12;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

+ (id)getSymmetricKey:(id)a3 symmetricKeyIV:(id)a4 signature:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  id v11 = 0;
  if (v7 && v8 && v9)
  {
    BOOL v12 = +[DEEncrypted getSymmetricSrc:v8 publicKey:v7];
    if (+[DESecurityUtils verify:v10 expected:v12 publicKey:v7])
    {
      id v11 = +[DESecurityUtils getKeyFromData:v12];
    }
    else
    {
      id v11 = 0;
    }
  }
  return v11;
}

+ (id)getSymmetricSrc:(id)a3 publicKey:(id)a4
{
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F1CA58] dataWithData:a3];
  [v6 appendData:v5];

  return v6;
}

+ (id)getKeyWithVersion:(id)a3
{
  uint64_t v3 = +[DEEncrypted getKeyWithVersion:a3 symmetric:0];
  return v3;
}

+ (id)getKeyWithVersion:(id)a3 symmetric:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    goto LABEL_14;
  }
  if (a4) {
    *a4 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [&unk_1F212EDE0 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(&unk_1F212EDE0);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) unsignedIntegerValue];
        id v10 = +[DEEncrypted getKey:v9];
        if (v10)
        {
          id v11 = +[DEVersionWriter versionData:v10];
          int v12 = [v11 isEqualToData:v5];

          if (v12)
          {
            if (a4) {
              *a4 = +[DEEncrypted isSymmetric:v9];
            }
            goto LABEL_17;
          }
        }
      }
      uint64_t v6 = [&unk_1F212EDE0 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_14:
    id v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (BOOL)isPrivateKey:(id)a3 publicKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = @"Invalid private key: nil";
  if (!v5 || !v6) {
    goto LABEL_8;
  }
  uint64_t v9 = objc_msgSend(v5, "length", @"Invalid private key: nil");
  if (v9 != [v7 length] + 32)
  {
    id v8 = @"Invalid private key: wrong length";
LABEL_8:
    +[DELog error:v8];
    BOOL v12 = 0;
    goto LABEL_9;
  }
  id v10 = objc_msgSend(v5, "subdataWithRange:", 0, objc_msgSend(v7, "length"));
  char v11 = [v10 isEqualToData:v7];

  if ((v11 & 1) == 0)
  {
    id v8 = @"Invalid private key: invalid prefix";
    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

+ (BOOL)isSymmetric:(unint64_t)a3
{
  return a3 == 2;
}

+ (id)getKey:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[DEVersionWriter dataWithHexString:](DEVersionWriter, "dataWithHexString:", *((void *)&off_1E651E610 + a3 - 1), v3);
  }
  return v5;
}

@end