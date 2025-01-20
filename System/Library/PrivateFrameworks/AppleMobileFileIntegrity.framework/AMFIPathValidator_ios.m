@interface AMFIPathValidator_ios
- (AMFIPathValidator_ios)initWithURL:(id)a3;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4 withFlags:(int)a5;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffsetAsNumber:(id)a4 withFlags:(int)a5;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFlags:(int)a4;
- (BOOL)areEntitlementsValidated;
- (BOOL)computedCdHash:(unsigned __int8)a3[20];
- (BOOL)isValid;
- (BOOL)validateWithError:(id *)a3;
- (NSData)profileAuxSig;
- (NSData)profileData;
- (NSError)error;
- (int)isSignerType;
- (unsigned)signerType;
@end

@implementation AMFIPathValidator_ios

- (AMFIPathValidator_ios)initWithURL:(id)a3
{
  return [(AMFIPathValidator_ios *)self initWithURL:a3 withFileOffsetAsNumber:0 withFlags:0];
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFlags:(int)a4
{
  return [(AMFIPathValidator_ios *)self initWithURL:a3 withFileOffsetAsNumber:0 withFlags:*(void *)&a4];
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4
{
  return [(AMFIPathValidator_ios *)self initWithURL:a3 withFileOffset:a4 withFlags:0];
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4 withFlags:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = NSNumber;
  id v9 = a3;
  v10 = [v8 numberWithUnsignedLongLong:a4];
  v11 = [(AMFIPathValidator_ios *)self initWithURL:v9 withFileOffsetAsNumber:v10 withFlags:v5];

  return v11;
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffsetAsNumber:(id)a4 withFlags:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMFIPathValidator_ios;
  v11 = [(AMFIPathValidator_ios *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_offset, a4);
    v12->_bootargs = 0;
    v12->_flags = a5;
    v12->_isValid = 0;
    v12->_validated = 0;
    v12->_signerType = 0;
    v12->_areEntitlementsValidated = 0;
    cdhash = v12->_cdhash;
    v12->_cdhash = 0;

    profileData = v12->_profileData;
    v12->_profileData = 0;

    amfi_interface_query_bootarg_state(&v12->_bootargs);
  }

  return v12;
}

- (BOOL)computedCdHash:(unsigned __int8)a3[20]
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  cdhash = self->_cdhash;
  if (cdhash) {
    [(NSData *)cdhash getBytes:a3 length:20];
  }
  return cdhash != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  self->_validated = 1;
  uint64_t v5 = objc_opt_new();
  v6 = [NSNumber numberWithBool:1];
  [v5 setObject:v6 forKey:*MEMORY[0x263F8C598]];

  v7 = [NSNumber numberWithBool:1];
  [v5 setObject:v7 forKey:*MEMORY[0x263F8C588]];

  offset = self->_offset;
  if (offset) {
    [v5 setObject:offset forKey:*MEMORY[0x263F8C590]];
  }
  [(NSURL *)self->_url path];
  id v9 = MISValidateSignatureAndCopyInfo();
  id v10 = [0 objectForKey:*MEMORY[0x263F8C570]];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  unint64_t v14 = 0x264127000uLL;
  if (v9)
  {
    id v15 = v13;
    objc_super v16 = a3;
    v17 = (void *)MISCopyErrorStringForErrorCode();
    v18 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v31 = [*v33 path];
      cf[0] = 138412802;
      *(void *)&cf[1] = v31;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = v9;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v17;
      _os_log_error_impl(&dword_20DBEC000, v18, OS_LOG_TYPE_ERROR, "%@ not valid: 0x%x: %@", (uint8_t *)cf, 0x1Cu);
    }
    v19 = [[AMFIError alloc] initWithMISError:v9 withURL:self->_url];
    error = self->_error;
    self->_error = &v19->super;

    unint64_t v14 = 0x264127000;
    a3 = v16;
    id v13 = v15;
  }
  else
  {
    id v9 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v32 = [*v33 path];
      cf[0] = 138413058;
      *(void *)&cf[1] = v32;
      __int16 v35 = 2112;
      *(void *)v36 = v5;
      *(_WORD *)&v36[8] = 2112;
      *(void *)&v36[10] = 0;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_error_impl(&dword_20DBEC000, v9, OS_LOG_TYPE_ERROR, "MIS Validation successful, but unexpected info? path: '%@', options: %@, info: %@, cdhash: %@", (uint8_t *)cf, 0x2Au);
    }
    v21 = [[AMFIError alloc] initWithAMFIErrorCode:-401 withURL:self->_url];
    LODWORD(v9) = 0;
    v17 = self->_error;
    self->_error = &v21->super;
  }

  if (self->_flags)
  {
    self->_BOOL isValid = 0;
    v22 = [*(id *)(v14 + 2368) generic];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AMFIPathValidator_ios validateWithError:](v33, v22);
    }

    v23 = [[AMFIError alloc] initWithAMFIErrorCode:-430 withURL:self->_url];
    v24 = self->_error;
    self->_error = &v23->super;
  }
  BOOL isValid = self->_isValid;
  if (self->_isValid || v9 == -402620388)
  {
LABEL_23:
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if ((self->_bootargs & 6) != 0)
  {
    v26 = [*(id *)(v14 + 2368) generic];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = [*v33 path];
      cf[0] = 138412290;
      *(void *)&cf[1] = v27;
      _os_log_impl(&dword_20DBEC000, v26, OS_LOG_TYPE_INFO, "boot-args allow process with invalid signature: %@", (uint8_t *)cf, 0xCu);
    }
    self->_BOOL isValid = 1;
    v28 = self->_error;
    self->_error = 0;

    BOOL isValid = self->_isValid;
    goto LABEL_23;
  }
  BOOL isValid = 0;
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (!isValid)
  {
    *a3 = self->_error;
    BOOL isValid = self->_isValid;
  }
LABEL_26:
  BOOL v29 = isValid;

  return v29;
}

- (BOOL)isValid
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  return self->_isValid;
}

- (BOOL)areEntitlementsValidated
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  return self->_areEntitlementsValidated;
}

- (int)isSignerType
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  return self->_signerType;
}

- (NSData)profileData
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  profileData = self->_profileData;
  return profileData;
}

- (NSData)profileAuxSig
{
  if (!self->_validated) {
    [(AMFIPathValidator_ios *)self validateWithError:0];
  }
  profileAuxSig = self->_profileAuxSig;
  return profileAuxSig;
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)signerType
{
  return self->_signerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileAuxSig, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)validateWithError:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [*a1 path];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20DBEC000, a2, OS_LOG_TYPE_ERROR, "dyld_sim policy is not allowed on iOS: %@", (uint8_t *)&v4, 0xCu);
}

- (void)validateWithError:(NSObject *)a3 .cold.2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 path];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_20DBEC000, a3, OS_LOG_TYPE_ERROR, "Unable to extract signer type? path: '%@', info: '%@'", (uint8_t *)&v6, 0x16u);
}

@end