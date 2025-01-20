@interface SHCatalog
+ (BOOL)_validateInstallationID:(id)a3;
- (NSTimeInterval)maximumQuerySignatureDuration;
- (NSTimeInterval)minimumQuerySignatureDuration;
- (SHCatalog)initWithConfiguration:(id)a3 error:(id *)a4;
- (SHCatalogConfiguration)_configuration;
- (id)_createMatcher;
- (id)_createSessionDriver;
@end

@implementation SHCatalog

- (SHCatalog)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = [v6 installationID];
  LOBYTE(v7) = [(id)v7 _validateInstallationID:v8];

  if ((v7 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = *MEMORY[0x263EFF4A0];
    v18 = NSString;
    v19 = [v6 installationID];
    [v18 stringWithFormat:@"%@ is not a valid installation ID", v19];
    v26 = LABEL_10:;
    id v24 = [v16 exceptionWithName:v17 reason:v26 userInfo:0];

LABEL_11:
    objc_exception_throw(v24);
  }
  [v6 streamingBufferDuration];
  if (v9 <= 0.0)
  {
    v20 = (void *)MEMORY[0x263EFF940];
    uint64_t v21 = *MEMORY[0x263EFF4A0];
    v22 = NSString;
    [v6 streamingBufferDuration];
    v19 = objc_msgSend(v22, "stringWithFormat:", @"%f is not a valid buffer duration", v23);
    id v24 = [v20 exceptionWithName:v21 reason:v19 userInfo:0];
    goto LABEL_11;
  }
  v10 = [v6 signatureDurationRange];
  [v10 lowerBound];
  double v12 = v11;

  if (v12 <= 0.0)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = *MEMORY[0x263EFF4A0];
    v25 = NSString;
    v19 = [v6 signatureDurationRange];
    [v25 stringWithFormat:@"%@ is not a valid signature duration range", v19];
    goto LABEL_10;
  }
  v27.receiver = self;
  v27.super_class = (Class)SHCatalog;
  v13 = [(SHCatalog *)&v27 init];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->__configuration, a3);
  }

  return v14;
}

- (NSTimeInterval)minimumQuerySignatureDuration
{
  v2 = [(SHCatalog *)self _configuration];
  v3 = [v2 signatureDurationRange];
  [v3 lowerBound];
  double v5 = v4;

  return v5;
}

- (NSTimeInterval)maximumQuerySignatureDuration
{
  v2 = [(SHCatalog *)self _configuration];
  v3 = [v2 signatureDurationRange];
  [v3 upperBound];
  double v5 = v4;

  return v5;
}

- (id)_createMatcher
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  double v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_createSessionDriver
{
  uint64_t v3 = [SHStreamingSessionDriver alloc];
  [(SHCatalog *)self minimumQuerySignatureDuration];
  double v5 = v4;
  [(SHCatalog *)self maximumQuerySignatureDuration];
  double v7 = v6;
  v8 = [(SHCatalog *)self _configuration];
  [v8 streamingBufferDuration];
  v10 = [(SHStreamingSessionDriver *)v3 initWithMinimumSignatureDuration:v5 maximumSignatureDuration:v7 bufferDuration:v9];

  return v10;
}

+ (BOOL)_validateInstallationID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  double v5 = [v3 whitespaceAndNewlineCharacterSet];
  double v6 = [v4 stringByTrimmingCharactersInSet:v5];

  LOBYTE(v4) = [v6 length] != 0;
  return (char)v4;
}

- (SHCatalogConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
}

@end