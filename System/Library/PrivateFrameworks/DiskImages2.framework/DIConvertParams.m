@interface DIConvertParams
+ (BOOL)isUDIFWithFormat:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)convertWithError:(id *)a3;
- (BOOL)inPlaceConversion;
- (BOOL)passphrase;
- (BOOL)prepareParamsForSquashWithError:(id *)a3;
- (BOOL)prepareParamsWithError:(id *)a3;
- (BOOL)shouldPerformInplaceSquash;
- (BOOL)shouldValidateShadows;
- (BOOL)useFormatMappingInfo;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4;
- (BOOL)validateSquashFormats;
- (DIBaseParams)outputParams;
- (DIConvertParams)initWithCoder:(id)a3;
- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5;
- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6;
- (DIURL)outputURL;
- (NSArray)shadowURLs;
- (NSString)certificate;
- (NSString)publicKey;
- (id)copyUpdatedOutputURLWithError:(id *)a3;
- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4;
- (id)initForInplaceWithURL:(id)a3 error:(id *)a4;
- (int64_t)outputFormat;
- (unint64_t)conversionMethod;
- (unint64_t)encryptionMethod;
- (unint64_t)maxRawUDIFRunSize;
- (unint64_t)sparseBundleBandSize;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setCertificate:(id)a3;
- (void)setConversionMethod:(unint64_t)a3;
- (void)setEncryptionMethod:(unint64_t)a3;
- (void)setMaxRawUDIFRunSize:(unint64_t)a3;
- (void)setOutputFormat:(int64_t)a3;
- (void)setOutputParams:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPassphrase:(BOOL)a3;
- (void)setPublicKey:(id)a3;
- (void)setShouldValidateShadows:(BOOL)a3;
- (void)setSparseBundleBandSize:(unint64_t)a3;
- (void)setUseFormatMappingInfo:(BOOL)a3;
@end

@implementation DIConvertParams

- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v7 = [v5 isFileURL]
    && (stat((const char *)[v5 fileSystemRepresentation], &v9)
     || !FileDescriptor::is_device((FileDescriptor *)&v9, v6))
    || +[DIError failWithPOSIXCode:22 description:@"Output of disk image conversion must be a file" error:a4];

  return v7;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263EFF8C0] array];
  v11 = [(DIConvertParams *)self initWithInputURL:v8 outputURL:v9 shadowURLs:v10 error:a5];

  return v11;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(DIBaseParams *)self initWithURL:v10 error:a6];
  v14 = v13;
  if (v13)
  {
    if (![(DIConvertParams *)v13 validateFileWithURL:v11 error:a6])
    {
      v17 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v14->_shadowURLs, a5);
    v15 = +[DIURL newDIURLWithNSURL:v11];
    outputURL = v14->_outputURL;
    v14->_outputURL = v15;

    v14->_sparseBundleBandSize = 0x4000000;
  }
  v17 = v14;
LABEL_6:

  return v17;
}

- (id)initForInplaceWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(DIBaseParams *)self initWithURL:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    if (![(DIConvertParams *)v7 validateFileWithURL:v6 error:a4])
    {
      id v9 = 0;
      goto LABEL_6;
    }
    [(DIConvertParams *)v8 setConversionMethod:1];
  }
  id v9 = v8;
LABEL_6:

  return v9;
}

- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 inputURL];
  v14.receiver = self;
  v14.super_class = (Class)DIConvertParams;
  id v8 = [(DIBaseParams *)&v14 initWithURL:v7 error:a4];

  if (v8)
  {
    id v9 = [v6 inputURL];
    BOOL v10 = [(DIConvertParams *)v8 validateFileWithURL:v9 error:a4];

    if (!v10)
    {
      id v12 = 0;
      goto LABEL_6;
    }
    id v11 = [v6 diskImageParamsXPC];
    [(DIBaseParams *)v8 setDiskImageParamsXPC:v11];

    [(DIConvertParams *)v8 setConversionMethod:1];
  }
  id v12 = v8;
LABEL_6:

  return v12;
}

- (BOOL)inPlaceConversion
{
  return [(DIConvertParams *)self conversionMethod] == 1;
}

- (BOOL)validateSquashFormats
{
  int64_t v3 = [(DIConvertParams *)self outputFormat];
  if (v3 == 8 || v3 == 1)
  {
    v4 = [(DIBaseParams *)self diskImageParamsXPC];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)shouldPerformInplaceSquash
{
  v27[131] = *MEMORY[0x263EF8340];
  if (![(DIConvertParams *)self validateSquashFormats]) {
    return 0;
  }
  int64_t v3 = [(DIConvertParams *)self outputURL];
  v4 = [v3 URLByDeletingLastPathComponent];

  id v5 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 fileSystemRepresentation]);
  int v6 = FileDescriptorWrapper::open_file((uint64_t)&__p, 0);
  FileLocal::FileLocal((FileLocal *)v22, v6, 0, 0);
  if (v21 < 0) {
    operator delete(__p);
  }
  BOOL v7 = [(DIBaseParams *)self diskImageParamsXPC];
  id v8 = [v7 backendXPC];
  id v9 = v8;
  if (v8)
  {
    [v8 backend];
  }
  else
  {
    uint64_t v15 = 0;
    v16 = 0;
  }
  get_sink_backend((uint64_t)&v15, &v17);
  std::dynamic_pointer_cast[abi:ne180100]<FileLocal,Backend>(&v17, &__p);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  if (__p && FileLocal::mounted_on_same_fs((FileDescriptor **)__p, v22, v11))
  {
    id v12 = [(DIConvertParams *)self shadowURLs];
    if ([v12 count])
    {
      v13 = [(DIBaseParams *)self diskImageParamsXPC];
      char v10 = [v13 mountedOnAPFS];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  v22[0] = (const FileDescriptor *)&unk_26CF41300;
  v24 = &unk_26CF413E0;
  v25 = &unk_26CF41418;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v27);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }

  return v10;
}

- (BOOL)prepareParamsForSquashWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v5 = *__error();
  if (DIForwardLogs())
  {
    int v6 = getDIOSLog();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v37 = 51;
    __int16 v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v35) = 18;
    v34 = buf;
    BOOL v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    id v8 = getDIOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v37 = 51;
      __int16 v38 = 2080;
      v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
      _os_log_impl(&dword_21E237000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Performing in-place squash optimization", buf, 0x12u);
    }
  }
  *__error() = v5;
  id v9 = [(DIConvertParams *)self copyUpdatedOutputURLWithError:a3];
  if (!v9) {
    goto LABEL_15;
  }
  if (!+[DICreateParams eraseIfExistingWithURL:v9 error:a3])
  {
    int v27 = *__error();
    if (!DIForwardLogs())
    {
      v30 = getDIOSLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v37 = 51;
        __int16 v38 = 2080;
        v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl(&dword_21E237000, v30, OS_LOG_TYPE_ERROR, "%.*s: Failed to erase output URL", buf, 0x12u);
      }

      goto LABEL_29;
    }
    v28 = getDIOSLog();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v37 = 51;
    __int16 v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
LABEL_25:
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v29);
      free(v29);
    }
LABEL_29:
    BOOL v26 = 0;
    *__error() = v27;
    goto LABEL_30;
  }
  char v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [(DIBaseParams *)self inputURL];
  char v12 = [v10 copyItemAtURL:v11 toURL:v9 error:a3];

  if ((v12 & 1) == 0)
  {
    int v27 = *__error();
    if (!DIForwardLogs())
    {
      v32 = getDIOSLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v37 = 51;
        __int16 v38 = 2080;
        v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl(&dword_21E237000, v32, OS_LOG_TYPE_ERROR, "%.*s: Failed to copy source disk image to temporary URL", buf, 0x12u);
      }

      goto LABEL_29;
    }
    v31 = getDIOSLog();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v37 = 51;
    __int16 v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    if (v29) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  v13 = [[DIBaseParams alloc] initWithURL:v9 error:a3];
  [(DIConvertParams *)self setOutputParams:v13];

  objc_super v14 = [(DIConvertParams *)self outputParams];
  char v15 = [v14 openExistingImageWithFlags:2 error:a3];

  if ((v15 & 1) == 0)
  {
LABEL_15:
    BOOL v26 = 0;
    goto LABEL_30;
  }
  v16 = [(NSArray *)self->_shadowURLs objectAtIndex:0];
  id v17 = +[DIURL newDIURLWithNSURL:v16];
  [(DIBaseParams *)self setInputURL:v17];

  v18 = [(DIBaseParams *)self inputURL];
  v19 = [v18 path];
  if (!v19)
  {

    goto LABEL_32;
  }
  v20 = (void *)MEMORY[0x263F08BA0];
  char v21 = [(DIBaseParams *)self inputURL];
  v22 = [v20 componentsWithURL:v21 resolvingAgainstBaseURL:1];
  LODWORD(v20) = v22 == 0;

  if (v20)
  {
LABEL_32:
    BOOL v26 = +[DIError failWithPOSIXCode:22, @"Malformed URL format", a3, v34, v35 description error];
    goto LABEL_30;
  }
  v23 = [MEMORY[0x263EFF980] arrayWithArray:self->_shadowURLs];
  [v23 removeObjectAtIndex:0];
  v24 = [(DIBaseParams *)self shadowChain];
  char v25 = [v24 addShadowURLs:v23 error:a3];

  if (v25)
  {
    [(DIBaseParams *)self setDiskImageParamsXPC:0];
    BOOL v26 = [(DIBaseParams *)self openExistingImageWithFlags:0 error:a3];
  }
  else
  {
    BOOL v26 = 0;
  }

LABEL_30:
  return v26;
}

- (BOOL)prepareParamsWithError:(id *)a3
{
  if ([(DIConvertParams *)self inPlaceConversion])
  {
    return [(DIBaseParams *)self openExistingImageWithFlags:2 error:a3];
  }
  char v6 = 0;
  if (![(DIBaseParams *)self openExistingImageWithFlags:0 error:a3]) {
    return v6;
  }
  if (![(DIConvertParams *)self shouldPerformInplaceSquash])
  {
    [(DIConvertParams *)self setConversionMethod:0];
    BOOL v7 = [(DIBaseParams *)self shadowChain];
    char v6 = [v7 addShadowURLs:self->_shadowURLs error:a3];

    return v6;
  }
  [(DIConvertParams *)self setConversionMethod:2];
  return [(DIConvertParams *)self prepareParamsForSquashWithError:a3];
}

- (DIConvertParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIConvertParams;
  int v5 = [(DIBaseParams *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_conversionMethod = [v4 decodeIntegerForKey:@"conversionMethod"];
    v5->_outputFormat = [v4 decodeIntegerForKey:@"outputFormat"];
    v5->_maxRawUDIFRunSize = [v4 decodeIntegerForKey:@"maxRawUDIFRunSize"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputParams"];
    outputParams = v5->_outputParams;
    v5->_outputParams = (DIBaseParams *)v6;

    v5->_useFormatMappingInfo = [v4 decodeBoolForKey:@"useFormatMappingInfo"];
  }

  return v5;
}

- (BOOL)shouldValidateShadows
{
  v2 = [(DIBaseParams *)self shadowChain];
  char v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DIBaseParams *)self shadowChain];
  [v4 setShouldValidate:v3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIConvertParams;
  [(DIBaseParams *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams conversionMethod](self, "conversionMethod"), @"conversionMethod");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams outputFormat](self, "outputFormat"), @"outputFormat");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize"), @"maxRawUDIFRunSize");
  int v5 = [(DIConvertParams *)self outputParams];
  [v4 encodeObject:v5 forKey:@"outputParams"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DIConvertParams useFormatMappingInfo](self, "useFormatMappingInfo"), @"useFormatMappingInfo");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DIConvertParams;
  if (!-[DIBaseParams validateDeserializationWithError:](&v10, sel_validateDeserializationWithError_)) {
    return 0;
  }
  uint64_t v5 = [(DIConvertParams *)self outputParams];
  if (!v5) {
    return 1;
  }
  objc_super v6 = (void *)v5;
  BOOL v7 = [(DIConvertParams *)self outputParams];
  char v8 = [v7 validateDeserializationWithError:a3];

  return v8;
}

- (id)copyUpdatedOutputURLWithError:(id *)a3
{
  v30[131] = *MEMORY[0x263EF8340];
  id v4 = [(DIBaseParams *)self inputURL];
  if (([v4 isFileURL] & 1) == 0)
  {

LABEL_18:
    [(DIConvertParams *)self outputURL];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [(DIConvertParams *)self outputURL];
  int v6 = access((const char *)[v5 fileSystemRepresentation], 0);

  if (v6) {
    goto LABEL_18;
  }
  id v7 = [(DIConvertParams *)self outputURL];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
  int v8 = FileDescriptorWrapper::open_file((uint64_t)__p, 0);
  FileLocal::FileLocal((FileLocal *)&v24, v8, 0, 0);
  if (v23 < 0) {
    operator delete(*(void **)__p);
  }

  *(_OWORD *)__p = *(_OWORD *)(v28 + 32);
  [(DIBaseParams *)self backend];
  BOOL v11 = *(void *)__p != (*(uint64_t (**)())(*(void *)v20 + 160))() || *(void *)&__p[8] != v9;
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (!v11)
  {
    int v12 = *__error();
    if (DIForwardLogs())
    {
      v13 = getDIOSLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      *(void *)__p = 0x3104100202;
      *(_WORD *)&__p[8] = 2080;
      *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
      LODWORD(v19) = 18;
      v18 = __p;
      objc_super v14 = (char *)_os_log_send_and_compose_impl();

      if (v14)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      v16 = getDIOSLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)__p = 0x3104100202;
        *(_WORD *)&__p[8] = 2080;
        *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
        _os_log_impl(&dword_21E237000, v16, OS_LOG_TYPE_DEFAULT, "%.*s: Input and output files are the same, using a temporary output file", __p, 0x12u);
      }
    }
    *__error() = v12;
    id v17 = [(DIConvertParams *)self outputURL];
    id v4 = [v17 URLByAppendingPathExtension:@"tmp_convert"];
  }
  v24 = &unk_26CF41300;
  BOOL v26 = &unk_26CF413E0;
  int v27 = &unk_26CF41418;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v30);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  if (v25) {
    std::__shared_weak_count::__release_weak(v25);
  }
  if (v11) {
    goto LABEL_18;
  }
  return v4;
}

- (BOOL)convertWithError:(id *)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (!-[DIConvertParams prepareParamsWithError:](self, "prepareParamsWithError:")) {
    return 0;
  }
  if ([(DIConvertParams *)self outputFormat] >= 1
    && [(DIConvertParams *)self outputFormat] <= 12)
  {
    if ([(DIConvertParams *)self maxRawUDIFRunSize]
      && [(DIConvertParams *)self maxRawUDIFRunSize] < 0x100000)
    {
      id v5 = @"Invalid raw UDIF run size limit";
      return +[DIError failWithPOSIXCode:22 verboseInfo:v5 error:a3];
    }
    if ([(DIConvertParams *)self inPlaceConversion]
      && [(DIConvertParams *)self encryptionMethod])
    {
      id v5 = @"In-place conversion maintains the encryption passphrase and method. It's not allowed to specify encryption arguments";
      return +[DIError failWithPOSIXCode:22 verboseInfo:v5 error:a3];
    }
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__5;
    v71 = __Block_byref_object_dispose__5;
    v72 = objc_alloc_init(DIClient2Controller_XPCHandler);
    int v8 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v66 = 0;
      uint64_t v9 = getDIOSLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v74 = 36;
      __int16 v75 = 2080;
      v76 = "-[DIConvertParams convertWithError:]";
      __int16 v77 = 2114;
      v78 = self;
      LODWORD(v64) = 28;
      v63 = buf;
      objc_super v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      BOOL v11 = getDIOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v74 = 36;
        __int16 v75 = 2080;
        v76 = "-[DIConvertParams convertWithError:]";
        __int16 v77 = 2114;
        v78 = self;
        _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }
    *__error() = v8;
    if (([(id)v68[5] connectWithError:a3] & 1) == 0
      || ![(DIBaseParams *)self prepareImageWithXpcHandler:v68[5] fileMode:2 error:a3])
    {
      goto LABEL_56;
    }
    if ([(DIConvertParams *)self conversionMethod]) {
      goto LABEL_23;
    }
    id v19 = [(DIConvertParams *)self copyUpdatedOutputURLWithError:a3];
    if (!v19) {
      goto LABEL_56;
    }
    if ([(DIConvertParams *)self outputFormat] == 7)
    {
      uint64_t v20 = [(DICreateParams *)[DICreateUDSBParams alloc] initWithURL:v19 error:a3];
      if (!v20) {
        goto LABEL_40;
      }
      [(DICreateUDSBParams *)v20 setSparseBundleBandSize:[(DIConvertParams *)self sparseBundleBandSize]];
    }
    else
    {
      uint64_t v20 = [(DICreateParams *)[DICreateRAWParams alloc] initWithURL:v19 error:a3];
      if (!v20) {
        goto LABEL_40;
      }
    }
    [(DICreateParams *)v20 setEncryptionMethod:[(DIConvertParams *)self encryptionMethod]];
    [(DIBaseParams *)v20 setReadPassphraseFlags:[(DIBaseParams *)self readPassphraseFlags]];
    BOOL v26 = [(DIConvertParams *)self shouldValidateShadows];
    int v27 = [(DIBaseParams *)v20 shadowChain];
    [v27 setShouldValidate:v26];

    [(DICreateParams *)v20 setPassphrase:[(DIConvertParams *)self passphrase]];
    uint64_t v28 = [(DIConvertParams *)self publicKey];
    [(DICreateParams *)v20 setPublicKey:v28];

    v29 = [(DIConvertParams *)self certificate];
    [(DICreateParams *)v20 setCertificate:v29];

    if ([(DICreateParams *)v20 createDiskImageParamsWithError:a3]
      && [(DICreateParams *)v20 createEncryptionWithXPCHandler:v68[5] error:a3])
    {
      [(DIConvertParams *)self setOutputParams:v20];

LABEL_23:
      int v12 = objc_msgSend((id)v68[5], "remoteProxy", v63);
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __36__DIConvertParams_convertWithError___block_invoke;
      v65[3] = &unk_2644A2498;
      v65[4] = &v67;
      [v12 convertWithParams:self reply:v65];

      if ([(id)v68[5] completeCommandWithError:a3])
      {
        if ([(DIConvertParams *)self inPlaceConversion]) {
          goto LABEL_27;
        }
        v13 = [(DIConvertParams *)self outputParams];
        BOOL v14 = v13 == 0;

        if (v14) {
          goto LABEL_27;
        }
        char v15 = [(DIConvertParams *)self outputURL];
        v16 = [(DIConvertParams *)self outputParams];
        id v17 = [v16 inputURL];
        char v18 = [v15 isEqual:v17];

        if (v18) {
          goto LABEL_27;
        }
        int v41 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v66 = 0;
          v42 = getDIOSLog();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          v43 = [(DIConvertParams *)self outputParams];
          v44 = [v43 inputURL];
          v45 = [v44 path];
          v46 = [(DIConvertParams *)self outputURL];
          v47 = [v46 path];
          *(_DWORD *)buf = 68158467;
          int v74 = 36;
          __int16 v75 = 2080;
          v76 = "-[DIConvertParams convertWithError:]";
          __int16 v77 = 2113;
          v78 = v45;
          __int16 v79 = 2113;
          v80 = v47;
          v48 = (char *)_os_log_send_and_compose_impl();

          if (v48)
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v48);
            free(v48);
          }
        }
        else
        {
          v49 = getDIOSLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = [(DIConvertParams *)self outputParams];
            v51 = [v50 inputURL];
            v52 = [v51 path];
            v53 = [(DIConvertParams *)self outputURL];
            v54 = [v53 path];
            *(_DWORD *)buf = 68158467;
            int v74 = 36;
            __int16 v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            __int16 v77 = 2113;
            v78 = v52;
            __int16 v79 = 2113;
            v80 = v54;
            _os_log_impl(&dword_21E237000, v49, OS_LOG_TYPE_DEFAULT, "%.*s: Moving %{private}@ to %{private}@", buf, 0x26u);
          }
        }
        *__error() = v41;
        v55 = [MEMORY[0x263F08850] defaultManager];
        v56 = [(DIConvertParams *)self outputURL];
        char v57 = [v55 removeItemAtURL:v56 error:a3];

        if (v57)
        {
          v58 = [MEMORY[0x263F08850] defaultManager];
          v59 = [(DIConvertParams *)self outputParams];
          v60 = [v59 inputURL];
          v61 = [(DIConvertParams *)self outputURL];
          char v62 = [v58 moveItemAtURL:v60 toURL:v61 error:a3];

          if (v62)
          {
LABEL_27:
            BOOL v6 = 1;
LABEL_57:
            _Block_object_dispose(&v67, 8);

            return v6;
          }
        }
      }
      else
      {
        char v21 = [(DIConvertParams *)self outputParams];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          int v23 = *__error();
          if (DIForwardLogs())
          {
            uint64_t v66 = 0;
            v24 = getDIOSLog();
            os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 68157954;
            int v74 = 36;
            __int16 v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            char v25 = (char *)_os_log_send_and_compose_impl();

            if (v25)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v25);
              free(v25);
            }
          }
          else
          {
            v30 = getDIOSLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68157954;
              int v74 = 36;
              __int16 v75 = 2080;
              v76 = "-[DIConvertParams convertWithError:]";
              _os_log_impl(&dword_21E237000, v30, OS_LOG_TYPE_ERROR, "%.*s: Due to the conversion error, erasing the output file", buf, 0x12u);
            }
          }
          *__error() = v23;
          v31 = [(DIConvertParams *)self outputParams];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v33 = [(DIConvertParams *)self outputParams];
            [v33 onErrorCleanup];
          }
          else
          {
            v34 = [(DIConvertParams *)self outputURL];
            uint64_t v35 = [(DIConvertParams *)self outputParams];
            v36 = [v35 inputURL];
            char v37 = [v34 isEqual:v36];

            if ((v37 & 1) == 0)
            {
              __int16 v38 = [MEMORY[0x263F08850] defaultManager];
              v39 = [(DIConvertParams *)self outputParams];
              uint64_t v40 = [v39 inputURL];
              [v38 removeItemAtURL:v40 error:0];
            }
          }
        }
      }
LABEL_56:
      BOOL v6 = 0;
      goto LABEL_57;
    }
LABEL_40:

    goto LABEL_56;
  }
  id v5 = @"Invalid output format argument";
  return +[DIError failWithPOSIXCode:22 verboseInfo:v5 error:a3];
}

uint64_t __36__DIConvertParams_convertWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) signalCommandCompletedWithXpcError:a2];
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)DIConvertParams;
  [(DIBaseParams *)&v5 invalidate];
  BOOL v3 = [(DIConvertParams *)self outputParams];

  if (v3)
  {
    id v4 = [(DIConvertParams *)self outputParams];
    [v4 invalidate];
  }
}

+ (BOOL)isUDIFWithFormat:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 5;
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
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

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (unint64_t)maxRawUDIFRunSize
{
  return self->_maxRawUDIFRunSize;
}

- (void)setMaxRawUDIFRunSize:(unint64_t)a3
{
  self->_maxRawUDIFRunSize = a3;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

- (BOOL)useFormatMappingInfo
{
  return self->_useFormatMappingInfo;
}

- (void)setUseFormatMappingInfo:(BOOL)a3
{
  self->_useFormatMappingInfo = a3;
}

- (DIURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (DIBaseParams)outputParams
{
  return self->_outputParams;
}

- (void)setOutputParams:(id)a3
{
}

- (unint64_t)conversionMethod
{
  return self->_conversionMethod;
}

- (void)setConversionMethod:(unint64_t)a3
{
  self->_conversionMethod = a3;
}

- (NSArray)shadowURLs
{
  return self->_shadowURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowURLs, 0);
  objc_storeStrong((id *)&self->_outputParams, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end