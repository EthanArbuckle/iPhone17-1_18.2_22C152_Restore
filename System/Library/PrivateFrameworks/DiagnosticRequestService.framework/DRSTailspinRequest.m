@interface DRSTailspinRequest
+ (BOOL)_shouldScrub;
+ (BOOL)enforceMinTraceBufferDuration;
+ (Class)_moClass;
+ (id)entityName;
+ (id)requiredSystemResourceName;
+ (void)resetEnforceMinTraceBufferDuration;
+ (void)setEnforceMinTraceBufferDuration:(BOOL)a3;
- (BOOL)_dumpTailspinToDirectory:(id)a3;
- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5;
- (BOOL)includeOsLog;
- (BOOL)includeOsSignpost;
- (BOOL)isEqualToRequest:(id)a3;
- (BOOL)scrubbed;
- (DRSTailspinRequest)initWithXPCDict:(id)a3;
- (NSNumber)minMAT;
- (id)_initWithTailspinRequestMO_ON_MOC_QUEUE:(id)a3;
- (id)_tailspinOptions;
- (id)debugDescription;
- (id)logType;
- (id)requestType;
- (unint64_t)expectedType;
- (void)_configureRequestMO:(id)a3;
@end

@implementation DRSTailspinRequest

+ (id)requiredSystemResourceName
{
  return kDRSRequestResourceTailspin;
}

- (id)debugDescription
{
  v3 = [(DRSTailspinRequest *)self minMAT];

  if (v3)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [(DRSTailspinRequest *)self minMAT];
    v6 = (void *)v5;
    v7 = @"-";
    if (v5) {
      v7 = (__CFString *)v5;
    }
    v8 = (__CFString *)[v4 initWithFormat:@"MAT[%@, -"], v7);
  }
  else
  {
    v8 = &stru_26BDF7DE8;
  }
  v9 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)DRSTailspinRequest;
  v10 = [(DRSRequest *)&v16 debugDescription];
  if ([(DRSTailspinRequest *)self includeOsLog]) {
    v11 = @"OSLog";
  }
  else {
    v11 = @"No OSLog";
  }
  BOOL v12 = [(DRSTailspinRequest *)self includeOsSignpost];
  v13 = @"No OSSignpost";
  if (v12) {
    v13 = @"OSSignpost";
  }
  v14 = [v9 stringWithFormat:@"%@ %@ %@ %@", v10, v11, v13, v8];

  return v14;
}

- (void)_configureRequestMO:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSTailspinRequest;
  [(DRSRequest *)&v7 _configureRequestMO:v4];
  id v5 = v4;
  objc_msgSend(v5, "setIncludeOsLog:", -[DRSTailspinRequest includeOsLog](self, "includeOsLog"));
  objc_msgSend(v5, "setIncludeOsSignpost:", -[DRSTailspinRequest includeOsSignpost](self, "includeOsSignpost"));
  v6 = [(DRSTailspinRequest *)self minMAT];
  [v5 setMinMAT:v6];
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSTailspinRequestMO";
}

- (unint64_t)expectedType
{
  return 1;
}

- (DRSTailspinRequest)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSTailspinRequest;
  id v5 = [(DRSRequest *)&v10 initWithXPCDict:v4];
  if (v5)
  {
    v5->_includeOsSignpost = xpc_dictionary_get_BOOL(v4, "IncludeOSSignpost");
    v5->_includeOsLog = xpc_dictionary_get_BOOL(v4, "IncludeOSLog");
    v6 = xpc_dictionary_get_value(v4, "MinMAT");

    if (v6)
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v4, "MinMAT"));
      minMAT = v5->_minMAT;
      v5->_minMAT = (NSNumber *)v7;
    }
    v5->_scrubbed = [(id)objc_opt_class() _shouldScrub];
  }

  return v5;
}

- (id)_initWithTailspinRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRSTailspinRequest;
  id v5 = [(DRSRequest *)&v9 _initWithRequestMO_ON_MOC_QUEUE:v4];
  if (v5)
  {
    v5[145] = [v4 includeOsLog];
    v5[144] = [v4 includeOsSignpost];
    uint64_t v6 = [v4 minMAT];
    uint64_t v7 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v6;

    v5[146] = [v4 scrubbed];
  }

  return v5;
}

+ (BOOL)_shouldScrub
{
  if (_shouldScrub_onceToken != -1) {
    dispatch_once(&_shouldScrub_onceToken, &__block_literal_global_773);
  }
  return (_shouldScrub_shouldScrub & 1) == 0;
}

uint64_t __34__DRSTailspinRequest__shouldScrub__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  _shouldScrub_shouldScrub = result;
  return result;
}

- (id)_tailspinOptions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(DRSTailspinRequest *)self minMAT];

  if (v4)
  {
    id v5 = [(DRSTailspinRequest *)self minMAT];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F8C818]];
  }
  if ([(DRSTailspinRequest *)self includeOsLog]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F8C800]];
  }
  if ([(DRSTailspinRequest *)self includeOsSignpost]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F8C808]];
  }
  if ([(id)objc_opt_class() _shouldScrub]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F8C840]];
  }
  if (([(id)objc_opt_class() enforceMinTraceBufferDuration] & 1) == 0) {
    [v3 setObject:&unk_26BE05760 forKeyedSubscript:*MEMORY[0x263F8C820]];
  }
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F8C7F8]];
  uint64_t v6 = NSString;
  uint64_t v7 = [(DRSRequest *)self teamID];
  v8 = [(DRSRequest *)self issueCategory];
  objc_super v9 = [(DRSRequest *)self issueDescription];
  objc_super v10 = [v6 stringWithFormat:@"%@/%@: %@", v7, v8, v9];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263F8C838]];

  if ([v3 count]) {
    id v11 = v3;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_dumpTailspinToDirectory:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(DRSRequest *)self requestID];
  v8 = [v7 UUIDString];
  objc_super v9 = (void *)[v6 initWithFormat:@"dpTailspin_%@.tailspin", v8];

  objc_super v10 = [v5 stringByAppendingPathComponent:v9];

  id v11 = v10;
  int v12 = open((const char *)[v11 UTF8String], 514, 438);
  if (v12 == -1)
  {
    id v20 = [NSString alloc];
    v21 = __error();
    v22 = objc_msgSend(v20, "initWithFormat:", @"Could not open file handle for new tailspin due to error: %s", strerror(*v21));
    id v44 = 0;
    [(DRSRequest *)self updateToState:4352 errorDescription:v22 errorOut:&v44];
    id v14 = v44;

    objc_super v16 = DPLogHandle_TailspinError();
    if (!os_signpost_enabled(v16))
    {
LABEL_26:
      BOOL v38 = 0;
      goto LABEL_27;
    }
    v23 = [(DRSRequest *)self errorDescription];
    *(_DWORD *)buf = 138543362;
    v47 = v23;
    v24 = "TailspinCreationFailure";
    v25 = "%{public}@";
    v26 = v16;
    goto LABEL_16;
  }
  int v13 = v12;
  id v14 = [(DRSTailspinRequest *)self _tailspinOptions];
  char v15 = tailspin_dump_output_with_options_sync();
  close(v13);
  if ((v15 & 1) == 0)
  {
    [(DRSRequest *)self updateToState:4352 errorDescription:@"Dumping tailspin failed" errorOut:0];
    v27 = DPLogHandle_TailspinError();
    if (os_signpost_enabled(v27))
    {
      v28 = [(DRSRequest *)self errorDescription];
      *(_DWORD *)buf = 138543362;
      v47 = v28;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinCreationFailure", "%{public}@", buf, 0xCu);
    }
    objc_super v16 = [MEMORY[0x263F08850] defaultManager];
    if ([v16 fileExistsAtPath:v11])
    {
      id v43 = 0;
      char v29 = [v16 removeItemAtPath:v11 error:&v43];
      v23 = v43;
      v30 = DPLogHandle_TailspinError();
      BOOL v31 = os_signpost_enabled(v30);
      if (v29)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v47 = v11;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTailspinCleanup", "Removed failed tailspin file: '%{public}@'", buf, 0xCu);
        }
      }
      else if (v31)
      {
        uint64_t v35 = [v23 localizedDescription];
        v36 = (void *)v35;
        v37 = @"Unknown";
        if (v35) {
          v37 = (__CFString *)v35;
        }
        *(_DWORD *)buf = 138543618;
        v47 = v11;
        __int16 v48 = 2114;
        v49 = v37;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTailspinCleanupFailed", "Failed to remove '%{public}@' due to error: %{public}@", buf, 0x16u);
      }
      goto LABEL_25;
    }
    v23 = DPLogHandle_TailspinError();
    if (!os_signpost_enabled(v23))
    {
LABEL_25:

      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543362;
    v47 = v11;
    v24 = "FailedTailspinCleanupNotNecessary";
    v25 = "Nothing to remove at '%{public}@";
    v26 = v23;
LABEL_16:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v24, v25, buf, 0xCu);
    goto LABEL_25;
  }
  objc_super v16 = [[DRSLog alloc] _initWithLogPath:v11 transferOwnership:1];
  if (!v16)
  {
    v32 = DPLogHandle_TailspinError();
    if (os_signpost_enabled(v32))
    {
      v33 = [0 path];
      v34 = [(DRSRequest *)self requestID];
      *(_DWORD *)buf = 138543618;
      v47 = v33;
      __int16 v48 = 2114;
      v49 = v34;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinSizeError", "Could not lookup size of %{public, name=path}@ for Request ID: %{public}@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  v17 = [(DRSRequest *)self logs];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [(DRSRequest *)self logs];
    [v19 addObject:v16];
  }
  else
  {
    v45 = v16;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    [(DRSRequest *)self setLogs:v19];
  }

  v40 = DPLogHandle_Tailspin();
  if (os_signpost_enabled(v40))
  {
    v41 = [(DRSRequest *)self logPath];
    v42 = [(DRSRequest *)self requestID];
    *(_DWORD *)buf = 138543618;
    v47 = v41;
    __int16 v48 = 2114;
    v49 = v42;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinSaved", "Tailspin saved to %{public, name=path}@ for Request ID: %{public}@", buf, 0x16u);
  }
  BOOL v38 = [(DRSRequest *)self updateToState:1 errorDescription:0 errorOut:0];
LABEL_27:

  return v38;
}

- (id)requestType
{
  return @"Tailspin";
}

- (id)logType
{
  v2 = [(DRSRequest *)self logs];
  unint64_t v3 = [v2 count];

  id v4 = kDRLogType_MultipleLogs;
  if (v3 < 2) {
    id v4 = kDRLogType_Tailspin;
  }
  id v5 = *v4;

  return v5;
}

- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5
{
  id v7 = a3;
  switch(a4)
  {
    case 0uLL:
      BOOL v8 = [(DRSTailspinRequest *)self _dumpTailspinToDirectory:v7];
      goto LABEL_13;
    case 1uLL:
      uint64_t v9 = 4096;
      goto LABEL_12;
    case 2uLL:
      uint64_t v9 = 4097;
      goto LABEL_12;
    case 3uLL:
      uint64_t v9 = 4098;
      goto LABEL_12;
    case 4uLL:
      uint64_t v9 = 4099;
      goto LABEL_12;
    case 5uLL:
      uint64_t v9 = 4100;
      goto LABEL_12;
    case 6uLL:
      uint64_t v9 = 4101;
      goto LABEL_12;
    case 7uLL:
      uint64_t v9 = 4102;
      goto LABEL_12;
    case 8uLL:
      uint64_t v9 = 4103;
      goto LABEL_12;
    default:
      uint64_t v9 = 0;
LABEL_12:
      BOOL v8 = [(DRSRequest *)self updateToState:v9 errorDescription:0 errorOut:0];
LABEL_13:
      BOOL v10 = v8;

      return v10;
  }
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DRSTailspinRequest;
  if ([(DRSRequest *)&v18 isEqualToRequest:v4])
  {
    id v5 = v4;
    int v6 = [(DRSTailspinRequest *)self includeOsSignpost];
    if (v6 != [v5 includeOsSignpost]) {
      goto LABEL_6;
    }
    int v7 = [(DRSTailspinRequest *)self includeOsLog];
    if (v7 != [v5 includeOsLog]) {
      goto LABEL_6;
    }
    int v8 = [(DRSTailspinRequest *)self scrubbed];
    if (v8 != [v5 scrubbed]) {
      goto LABEL_6;
    }
    uint64_t v9 = [(DRSTailspinRequest *)self minMAT];
    BOOL v10 = [v5 minMAT];
    char IsNil = _oneIsNil((uint64_t)v9, (uint64_t)v10);

    if ((IsNil & 1) == 0)
    {
      uint64_t v14 = [(DRSTailspinRequest *)self minMAT];
      if (v14)
      {
        char v15 = (void *)v14;
        objc_super v16 = [(DRSTailspinRequest *)self minMAT];
        v17 = [v5 minMAT];
        char v12 = [v16 isEqualToNumber:v17];
      }
      else
      {
        char v12 = 1;
      }
    }
    else
    {
LABEL_6:
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)enforceMinTraceBufferDuration
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = _minBufferDurationQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DRSTailspinRequest_enforceMinTraceBufferDuration__block_invoke;
  block[3] = &unk_263FC97E8;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __51__DRSTailspinRequest_enforceMinTraceBufferDuration__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = gDRSTailspinRequestEnforceMinTraceBufferDuration;
  return result;
}

+ (void)setEnforceMinTraceBufferDuration:(BOOL)a3
{
  id v4 = +[DRSSystemProfile sharedInstance];
  int v5 = [v4 isInternal];

  if (v5)
  {
    int v6 = _minBufferDurationQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DRSTailspinRequest_setEnforceMinTraceBufferDuration___block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v8 = a3;
    dispatch_sync(v6, block);
  }
}

uint64_t __55__DRSTailspinRequest_setEnforceMinTraceBufferDuration___block_invoke(uint64_t result)
{
  gDRSTailspinRequestEnforceMinTraceBufferDuration = *(unsigned char *)(result + 32);
  return result;
}

+ (void)resetEnforceMinTraceBufferDuration
{
  v2 = _minBufferDurationQueue();
  dispatch_sync(v2, &__block_literal_global_788);
}

void __56__DRSTailspinRequest_resetEnforceMinTraceBufferDuration__block_invoke()
{
  gDRSTailspinRequestEnforceMinTraceBufferDuration = 1;
}

- (BOOL)includeOsSignpost
{
  return self->_includeOsSignpost;
}

- (BOOL)includeOsLog
{
  return self->_includeOsLog;
}

- (BOOL)scrubbed
{
  return self->_scrubbed;
}

- (NSNumber)minMAT
{
  return self->_minMAT;
}

- (void).cxx_destruct
{
}

@end