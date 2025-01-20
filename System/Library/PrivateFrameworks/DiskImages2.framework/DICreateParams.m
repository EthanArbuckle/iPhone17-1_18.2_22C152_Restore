@interface DICreateParams
+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)createDiskImageParamsWithError:(id *)a3;
- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4;
- (BOOL)createWithError:(id *)a3;
- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5;
- (BOOL)onErrorCleanup;
- (BOOL)passphrase;
- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4;
- (BOOL)supportsPstack;
- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3;
- (DICreateParams)initWithCoder:(id)a3;
- (DICreateParams)initWithURL:(id)a3 error:(id *)a4;
- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (NSString)certificate;
- (NSString)publicKey;
- (NSString)systemKeychainAccount;
- (unint64_t)encryptionMethod;
- (unint64_t)numBlocks;
- (void)createDiskImageParamsXPC;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificate:(id)a3;
- (void)setEncryptionMethod:(unint64_t)a3;
- (void)setNumBlocks:(unint64_t)a3;
- (void)setPassphrase:(BOOL)a3;
- (void)setPublicKey:(id)a3;
- (void)setSystemKeychainAccount:(id)a3;
@end

@implementation DICreateParams

- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  result = [(DIBaseParams *)&v7 initWithURL:a3 error:a5];
  if (result) {
    result->_numBlocks = a4;
  }
  return result;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DICreateParams)initWithURL:(id)a3 error:(id *)a4
{
  return [(DICreateParams *)self initWithURL:a3 numBlocks:0 error:a4];
}

- (DICreateParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DICreateParams;
  v5 = [(DIBaseParams *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_numBlocks = [v4 decodeInt64ForKey:@"numBlocks"];
    v5->_encryptionMethod = [v4 decodeIntegerForKey:@"encryptionMethod"];
    v5->_passphrase = [v4 decodeBoolForKey:@"passphrase"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificate"];
    certificate = v5->_certificate;
    v5->_certificate = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  [(DIBaseParams *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[DICreateParams numBlocks](self, "numBlocks"), @"numBlocks");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DICreateParams encryptionMethod](self, "encryptionMethod"), @"encryptionMethod");
  objc_msgSend(v4, "encodeBool:forKey:", -[DICreateParams passphrase](self, "passphrase"), @"passphrase");
  v5 = [(DICreateParams *)self publicKey];
  [v4 encodeObject:v5 forKey:@"publicKey"];

  uint64_t v6 = [(DICreateParams *)self certificate];
  [v4 encodeObject:v6 forKey:@"certificate"];
}

- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    v9 = [(DICreateParams *)self certificate];

    if (v9)
    {
      v10 = [(DICreateParams *)self certificate];
      *a4 = [v8 getCertificateWithCertificatePath:v10 error:a5];
    }
    else
    {
      v13 = [(DICreateParams *)self publicKey];

      if (v13)
      {
        unint64_t v15 = 0;
        v14 = [(DICreateParams *)self publicKey];
        convertHexToBytes(v14, &v15);
      }
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Invalid certificate out argument" error:a5];
  }

  return v11;
}

- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([(DICreateParams *)self encryptionMethod])
  {
    if ([(DICreateParams *)self encryptionMethod] == 2) {
      int v6 = 256;
    }
    else {
      int v6 = 128;
    }
    crypto::header::encryption_key_bits_size_t::encryption_key_bits_size_t(&v8, v6);
    operator new();
  }

  return 1;
}

- (void)createDiskImageParamsXPC
{
  exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
  DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Invalid argument, please use one of the DICreateParams derived classes instead", 0x16u);
}

- (BOOL)createDiskImageParamsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = [(DIBaseParams *)self inputURL];
  char v6 = [v5 isFileURL];

  if (v6)
  {
    int v7 = *__error();
    if (DIForwardLogs())
    {
      int v8 = getDIOSLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      [(DIBaseParams *)self inputURL];
      *(_DWORD *)buf = 68158211;
      int v17 = 49;
      __int16 v18 = 2080;
      v19 = "-[DICreateParams createDiskImageParamsWithError:]";
      __int16 v20 = 2113;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (char *)_os_log_send_and_compose_impl();

      if (v9)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v9);
        free(v9);
      }
    }
    else
    {
      BOOL v11 = getDIOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(DIBaseParams *)self inputURL];
        *(_DWORD *)buf = 68158211;
        int v17 = 49;
        __int16 v18 = 2080;
        v19 = "-[DICreateParams createDiskImageParamsWithError:]";
        __int16 v20 = 2113;
        id v21 = v12;
        _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
      }
    }
    *__error() = v7;
    uint64_t v13 = objc_opt_class();
    v14 = [(DIBaseParams *)self inputURL];
    LOBYTE(v13) = [(id)v13 eraseIfExistingWithURL:v14 error:a3];

    if ((v13 & 1) == 0) {
      return 0;
    }
    [(DICreateParams *)self createDiskImageParamsXPC];
    return 1;
  }
  else
  {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"URL must have a file scheme" error:a3];
  }
}

- (BOOL)createWithError:(id *)a3
{
  if ([(DICreateParams *)self numBlocks])
  {
    if ([(DICreateParams *)self createDiskImageParamsWithError:a3])
    {
      if (![(DICreateParams *)self encryptionMethod])
      {
LABEL_7:
        unint64_t v6 = [(DICreateParams *)self numBlocks];
        return [(DICreateParams *)self resizeWithNumBlocks:v6 error:a3];
      }
      id v5 = objc_alloc_init(DIClient2Controller_XPCHandler);
      if ([(DIClient2Controller_XPCHandler *)v5 connectWithError:a3]
        && [(DICreateParams *)self createEncryptionWithXPCHandler:v5 error:a3])
      {

        goto LABEL_7;
      }
    }
    return 0;
  }
  return +[DIError failWithPOSIXCode:22 description:@"Invalid size requested for the new image" error:a3];
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  int v7 = [(DIEncryptionFrontend *)[DIEncryptionCreator alloc] initWithParams:self];
  id v15 = 0;
  BOOL v8 = [(DICreateParams *)self getCertificateWithEncryptionCreator:v7 outCertificate:&v15 error:a4];
  id v9 = v15;
  if (v8)
  {
    BOOL v10 = [(DICreateParams *)self passphrase];
    if (v9) {
      int v11 = v10;
    }
    else {
      int v11 = 1;
    }
    if (v11 != 1 || a3 && *a3)
    {
      v12 = [(DIBaseParams *)self diskImageParamsXPC];
      char v13 = [v12 makeNewImageEncryptedWithPassphrase:a3 certificate:v9 error:a4];
    }
    else
    {
      char v13 = +[DIError failWithPOSIXCode:22 description:@"Passphrase cannot be empty" error:a4];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3
{
  return [(DICreateParams *)self setPassphrase:0 error:a3];
}

- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  -[DICreateParams setNumBlocks:](self, "setNumBlocks:");
  uint64_t v26 = 0;
  int v7 = [(DIBaseParams *)self diskImageParamsXPC];
  BOOL v8 = [(DIBaseParams *)self shadowChain];
  uint64_t v9 = [v8 shouldValidate];
  if (v7)
  {
    [v7 createDiskImageWithCache:0 shadowValidation:v9];
    uint64_t v10 = *(void *)buf;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v26 = v10;
  *(void *)buf = 0;

  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 24))(v26);
  v12 = [(DIBaseParams *)self diskImageParamsXPC];
  uint64_t v13 = [v12 setSizeWithDiskImage:&v26 newSize:v11 * a3];

  if (v13)
  {
    BOOL v14 = +[DIError failWithPOSIXCode:v13 verboseInfo:@"Failed to resize the image" error:a4];
    goto LABEL_17;
  }
  [(DICreateParams *)self setNumBlocks:(*(uint64_t (**)(uint64_t))(*(void *)v26 + 32))(v26)];
  unint64_t v15 = [(DICreateParams *)self numBlocks];
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 24))(v26);
  int v17 = *__error();
  unint64_t v18 = v16 * v15;
  if (DIForwardLogs())
  {
    v19 = getDIOSLog();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 44;
    __int16 v28 = 2080;
    v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
    __int16 v30 = 2048;
    unint64_t v31 = v18;
    __int16 v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    id v21 = getDIOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 44;
      __int16 v28 = 2080;
      v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
      __int16 v30 = 2048;
      unint64_t v31 = v18;
      _os_log_impl(&dword_21E237000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
    }
  }
  *__error() = v17;
  uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v26 + 136))(v26);
  uint64_t v23 = DiskImage::Context::flush(v22);
  if (!v23)
  {
    BOOL v14 = 1;
    if (!v22) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  BOOL v14 = +[DIError failWithPOSIXCode:v23 error:a4];
  if (v22) {
LABEL_16:
  }
    (*(void (**)(void *))(*v22 + 40))(v22);
LABEL_17:
  uint64_t v24 = v26;
  uint64_t v26 = 0;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
  }
  return v14;
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  return !a4
      || +[DIError failWithPOSIXCode:21 verboseInfo:@"The requested URL is an existing folder" error:a5];
}

+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unsigned __int8 v21 = 0;
  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7 isDirectory:&v21];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v5 path];
    char v11 = [v9 isWritableFileAtPath:v10];

    if (v11)
    {
      if ([(id)objc_opt_class() checkExistingFileWithURL:v5 isDirectory:v21 error:a4])
      {
        int v12 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v13 = getDIOSLog();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          BOOL v14 = [v5 path];
          *(_DWORD *)buf = 68158211;
          int v23 = 47;
          __int16 v24 = 2080;
          v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
          __int16 v26 = 2113;
          v27 = v14;
          unint64_t v15 = (char *)_os_log_send_and_compose_impl();

          if (v15)
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v15);
            free(v15);
          }
        }
        else
        {
          int v17 = getDIOSLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = [v5 path];
            *(_DWORD *)buf = 68158211;
            int v23 = 47;
            __int16 v24 = 2080;
            v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
            __int16 v26 = 2113;
            v27 = v18;
            _os_log_impl(&dword_21E237000, v17, OS_LOG_TYPE_DEFAULT, "%.*s: Erasing %{private}@", buf, 0x1Cu);
          }
        }
        *__error() = v12;
        v19 = [MEMORY[0x263F08850] defaultManager];
        char v16 = [v19 removeItemAtURL:v5 error:a4];
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = +[DIError failWithPOSIXCode:13 verboseInfo:@"Image does not have write permissions" error:a4];
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (BOOL)onErrorCleanup
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(DIBaseParams *)self setDiskImageParamsXPC:0];
  int v3 = *__error();
  if (DIForwardLogs())
  {
    id v4 = getDIOSLog();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    id v5 = [(DIBaseParams *)self inputURL];
    [v5 path];
    *(_DWORD *)buf = 68158211;
    int v15 = 32;
    __int16 v16 = 2080;
    int v17 = "-[DICreateParams onErrorCleanup]";
    __int16 v18 = 2113;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    int v7 = getDIOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(DIBaseParams *)self inputURL];
      uint64_t v9 = [v8 path];
      *(_DWORD *)buf = 68158211;
      int v15 = 32;
      __int16 v16 = 2080;
      int v17 = "-[DICreateParams onErrorCleanup]";
      __int16 v18 = 2113;
      id v19 = v9;
      _os_log_impl(&dword_21E237000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Creation failed, erasing %{private}@", buf, 0x1Cu);
    }
  }
  *__error() = v3;
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [(DIBaseParams *)self inputURL];
  char v12 = [v10 removeItemAtURL:v11 error:0];

  return v12;
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (NSString)systemKeychainAccount
{
  return self->_systemKeychainAccount;
}

- (void)setSystemKeychainAccount:(id)a3
{
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_systemKeychainAccount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end