@interface DRSSubmittedLogInfo
+ (id)submittedLogInfosFromPaths:(id)a3 sandboxExtensions:(id)a4 transferOwnerships:(id)a5 successOut:(BOOL *)a6;
- (BOOL)transferOwnership;
- (DRSSubmittedLogInfo)initWithPath:(const char *)a3 sandboxExtension:(const char *)a4 transferOwnership:(BOOL)a5;
- (NSString)path;
- (NSString)sandboxExtension;
- (id)debugDescription;
@end

@implementation DRSSubmittedLogInfo

- (DRSSubmittedLogInfo)initWithPath:(const char *)a3 sandboxExtension:(const char *)a4 transferOwnership:(BOOL)a5
{
  v5 = 0;
  if (a3 && a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)DRSSubmittedLogInfo;
    v9 = [(DRSSubmittedLogInfo *)&v15 init];
    if (v9)
    {
      uint64_t v10 = [NSString stringWithUTF8String:a3];
      path = v9->_path;
      v9->_path = (NSString *)v10;

      uint64_t v12 = [NSString stringWithUTF8String:a4];
      sandboxExtension = v9->_sandboxExtension;
      v9->_sandboxExtension = (NSString *)v12;

      v9->_transferOwnership = a5;
    }
    self = v9;
    v5 = self;
  }

  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(DRSSubmittedLogInfo *)self path];
  v5 = [(DRSSubmittedLogInfo *)self sandboxExtension];
  BOOL v6 = [(DRSSubmittedLogInfo *)self transferOwnership];
  v7 = @"Copy";
  if (v6) {
    v7 = @"Transfer";
  }
  v8 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v7];

  return v8;
}

+ (id)submittedLogInfosFromPaths:(id)a3 sandboxExtensions:(id)a4 transferOwnerships:(id)a5 successOut:(BOOL *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  *a6 = 1;
  if (!v9 || !v10 || !v11)
  {
    if (!v9 && !v10 && !v11)
    {
      id v18 = 0;
      goto LABEL_31;
    }
    objc_super v15 = DPLogHandle_RequestError();
    if (!os_signpost_enabled(v15)) {
      goto LABEL_30;
    }
    v19 = @"Available";
    if (v9) {
      v20 = @"Available";
    }
    else {
      v20 = @"Missing";
    }
    if (v10) {
      v21 = @"Available";
    }
    else {
      v21 = @"Missing";
    }
    int v37 = 138543874;
    size_t v38 = (size_t)v20;
    __int16 v39 = 2114;
    size_t v40 = (size_t)v21;
    if (!v12) {
      v19 = @"Missing";
    }
    __int16 v41 = 2114;
    v42 = v19;
    v16 = "SubmittedLogInfoFailure";
    v17 = "Could not generate submitted log info array due to missing input.\n"
          "Paths: %{public}@\n"
          "SandboxExtensions:%{public}@\n"
          "TransferBools:%{public}@";
LABEL_21:
    v22 = v15;
    uint32_t v23 = 32;
LABEL_29:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, (uint8_t *)&v37, v23);
    goto LABEL_30;
  }
  uint64_t v13 = MEMORY[0x21050E4F0](v9);
  uint64_t v14 = MEMORY[0x263EF86D8];
  if (v13 != MEMORY[0x263EF86D8])
  {
    objc_super v15 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v37) = 0;
      v16 = "SubmittedLogInfoFailureUnexpected xpcPathArray type";
      v17 = (const char *)&unk_209EEADD1;
LABEL_28:
      v22 = v15;
      uint32_t v23 = 2;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (MEMORY[0x21050E4F0](v10) != v14)
  {
    objc_super v15 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v37) = 0;
      v16 = "SubmittedLogInfoFailureUnexpected xpcSandboxExtensionsArray type";
      v17 = (const char *)&unk_209EEADD1;
      goto LABEL_28;
    }
LABEL_30:

    id v18 = 0;
    *a6 = 0;
    goto LABEL_31;
  }
  if (MEMORY[0x21050E4F0](v12) != v14)
  {
    objc_super v15 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v37) = 0;
      v16 = "SubmittedLogInfoFailureUnexpected xpcTransferBoolArray type";
      v17 = (const char *)&unk_209EEADD1;
      goto LABEL_28;
    }
    goto LABEL_30;
  }
  size_t count = xpc_array_get_count(v9);
  size_t v26 = xpc_array_get_count(v10);
  size_t v27 = xpc_array_get_count(v12);
  size_t v28 = v27;
  if (count != v26 || count != v27)
  {
    objc_super v15 = DPLogHandle_RequestError();
    if (!os_signpost_enabled(v15)) {
      goto LABEL_30;
    }
    int v37 = 134349568;
    size_t v38 = count;
    __int16 v39 = 2050;
    size_t v40 = v26;
    __int16 v41 = 2050;
    v42 = (__CFString *)v28;
    v16 = "SubmittedLogInfoFailure";
    v17 = "Inconsisted info counts:\nPaths: %{public}zu\nSandbox extensions: %{public}zu\nTransfer BOOLs: %{public}zu\n";
    goto LABEL_21;
  }
  v29 = [MEMORY[0x263EFF980] array];
  if (count)
  {
    size_t v30 = 0;
    while (1)
    {
      v31 = [DRSSubmittedLogInfo alloc];
      string = xpc_array_get_string(v9, v30);
      v33 = xpc_array_get_string(v10, v30);
      uint64_t v34 = [(DRSSubmittedLogInfo *)v31 initWithPath:string sandboxExtension:v33 transferOwnership:xpc_array_get_BOOL(v12, v30)];
      if (!v34) {
        break;
      }
      v35 = (void *)v34;
      [v29 addObject:v34];

      if (count == ++v30) {
        goto LABEL_40;
      }
    }
    v36 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v36))
    {
      LOWORD(v37) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogInfoFailure", "Could not create new submitted log info\n", (uint8_t *)&v37, 2u);
    }

    goto LABEL_47;
  }
LABEL_40:
  if (![v29 count])
  {
LABEL_47:
    id v18 = 0;
    *a6 = 0;
    goto LABEL_48;
  }
  id v18 = v29;
LABEL_48:

LABEL_31:

  return v18;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end