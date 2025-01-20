@interface HDAnalyticsWriter
- (BOOL)_cleanAnalyticsDirectory:(uint64_t)a1 error:(void *)a2;
- (BOOL)_createAndCleanAnalyticsDirectoryWithError:(uint64_t)a1;
- (BOOL)submitJSONAnalyticsData:(id)a3 bugType:(id)a4 error:(id *)a5;
- (BOOL)submitJSONAnalyticsData:(id)a3 toDirectory:(id)a4 withConfiguration:(id)a5 error:(id *)a6;
- (HDAnalyticsWriter)init;
- (HDAnalyticsWriter)initWithURL:(id)a3;
- (id)URLForAnalyticsFileWithName:(id)a3;
- (id)_encryptAnalyticsData:(void *)a3 withConfig:(uint64_t)a4 error:;
- (id)_serializeAnalyticsData:(uint64_t)a3 errorOut:;
- (id)analyticsFilePathsWithError:(id *)a3;
- (uint64_t)_createAnalyticsDirectory:(void *)a3 error:;
- (uint64_t)_loadCertificateWithError:(uint64_t)a1;
- (uint64_t)_submitJSONAnalyticsData:(void *)a3 bugType:(void *)a4 customDirectory:(void *)a5 configuration:(void *)a6 error:;
@end

@implementation HDAnalyticsWriter

- (HDAnalyticsWriter)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDAnalyticsWriter;
  v5 = [(HDAnalyticsWriter *)&v10 init];
  if (v5)
  {
    v6 = [v4 path];
    uint64_t v7 = [v6 copy];
    analyticsDirectory = v5->_analyticsDirectory;
    v5->_analyticsDirectory = (NSString *)v7;
  }
  return v5;
}

- (HDAnalyticsWriter)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)submitJSONAnalyticsData:(id)a3 bugType:(id)a4 error:(id *)a5
{
  return -[HDAnalyticsWriter _submitJSONAnalyticsData:bugType:customDirectory:configuration:error:]((uint64_t)self, a3, a4, 0, 0, a5);
}

- (uint64_t)_submitJSONAnalyticsData:(void *)a3 bugType:(void *)a4 customDirectory:(void *)a5 configuration:(void *)a6 error:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    if (v13
      && ([MEMORY[0x263F08850] defaultManager],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 fileExistsAtPath:v13 isDirectory:0],
          v15,
          (v16 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Client should ensure submission directory is created before using analytics writer");
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        if (a6) {
          *a6 = v29;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else if (-[HDAnalyticsWriter _createAndCleanAnalyticsDirectoryWithError:](a1, a6))
    {
      v17 = -[HDAnalyticsWriter _serializeAnalyticsData:errorOut:](a1, v11, (uint64_t)a6);
      if (v17)
      {
        if (v14) {
          goto LABEL_10;
        }
        if (*(void *)(a1 + 8) || (-[HDAnalyticsWriter _loadCertificateWithError:](a1, (uint64_t)a6) & 1) != 0)
        {
          v18 = [MEMORY[0x263EFF910] date];
          id v14 = (id)[objc_alloc(MEMORY[0x263F0A430]) initWithChannel:@"DataAnalytics" payloadType:@"JSON" certificate:*(void *)(a1 + 8)];
          [v14 setStartDate:v18];
          [v14 setEndDate:v18];
          [v14 setPayloadIdentifier:@"FOO-Payload"];

LABEL_10:
          v19 = -[HDAnalyticsWriter _encryptAnalyticsData:withConfig:error:](a1, v17, v14, (uint64_t)a6);
          v20 = v19;
          if (!v19)
          {
            unsigned __int8 v40 = 0;
LABEL_36:

            goto LABEL_37;
          }
          v21 = [v19 lastPathComponent];
          v36 = v20;
          uint64_t v22 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v20];
          unint64_t v23 = 0x263EFF000uLL;
          v37 = (void *)v22;
          if (v13)
          {
            v24 = (void *)v22;
            v25 = NSURL;
            v35 = v21;
            uint64_t v26 = [v13 stringByAppendingPathComponent:v21];
            v27 = [v25 fileURLWithPath:v26];

            id v39 = 0;
            LOBYTE(v26) = [v24 writeToURL:v27 options:805306369 error:&v39];
            id v28 = v39;
            if (v26)
            {
              v21 = v35;
              v20 = v36;
LABEL_14:

              unint64_t v23 = 0x263EFF000;
LABEL_24:
              v30 = [*(id *)(v23 + 2608) fileURLWithPath:*(void *)(a1 + 16)];
              v27 = [v30 URLByAppendingPathComponent:v21];

              unsigned __int8 v40 = [v17 writeToURL:v27 options:805306369 error:a6];
LABEL_35:

              goto LABEL_36;
            }
            id v34 = v28;
            objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:underlyingError:", 100, @"Unable to write serialized unencrypted analytics data.", v28);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v35;
            v20 = v36;
            if (v31)
            {
              if (a6) {
                *a6 = v31;
              }
              else {
                _HKLogDroppedError();
              }
            }

            unsigned __int8 v40 = 0;
            v32 = v34;
          }
          else
          {
            if (!v12 || (HDIsUnitTesting() & 1) != 0) {
              goto LABEL_24;
            }
            v27 = [v21 stringByAppendingString:@"X-"];
            id v38 = v20;
            if (HKSubmitAnalyticsFile())
            {
              id v28 = v38;
              goto LABEL_14;
            }
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a6, 100, @"Analytics submission failed for an unknown reason.");
            unsigned __int8 v40 = 0;
            v32 = v38;
          }

          goto LABEL_35;
        }
        id v14 = 0;
      }
      unsigned __int8 v40 = 0;
LABEL_37:

      goto LABEL_38;
    }
  }
  unsigned __int8 v40 = 0;
LABEL_38:

  return v40;
}

- (BOOL)submitJSONAnalyticsData:(id)a3 toDirectory:(id)a4 withConfiguration:(id)a5 error:(id *)a6
{
  return -[HDAnalyticsWriter _submitJSONAnalyticsData:bugType:customDirectory:configuration:error:]((uint64_t)self, a3, 0, a4, a5, a6);
}

- (id)URLForAnalyticsFileWithName:(id)a3
{
  uint64_t v4 = [a3 lastPathComponent];
  v5 = [v4 componentsSeparatedByString:@"X-"];
  v6 = [v5 firstObject];

  uint64_t v7 = [NSURL fileURLWithPath:self->_analyticsDirectory];
  v8 = [v7 URLByAppendingPathComponent:v6];

  return v8;
}

- (id)analyticsFilePathsWithError:(id *)a3
{
  if (!-[HDAnalyticsWriter _cleanAnalyticsDirectory:error:]((uint64_t)self, self->_analyticsDirectory))
  {
    objc_super v10 = 0;
    goto LABEL_14;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F08850]);
  analyticsDirectory = self->_analyticsDirectory;
  id v14 = 0;
  uint64_t v7 = [v5 contentsOfDirectoryAtPath:analyticsDirectory error:&v14];
  id v8 = v14;
  v9 = v8;
  if (v7) {
    goto LABEL_3;
  }
  if ([v8 code] != 260)
  {
    id v11 = v9;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    objc_super v10 = 0;
    goto LABEL_13;
  }
  if ([v9 code] != 260)
  {
LABEL_3:
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__HDAnalyticsWriter_analyticsFilePathsWithError___block_invoke;
    v13[3] = &unk_2643D49C0;
    v13[4] = self;
    objc_super v10 = objc_msgSend(v7, "hk_map:", v13);
  }
  else
  {
    objc_super v10 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_13:

LABEL_14:

  return v10;
}

- (BOOL)_cleanAnalyticsDirectory:(uint64_t)a1 error:(void *)a2
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v24 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08850]);
    [MEMORY[0x263EFF910] date];
    uint64_t v26 = v25 = v4;
    id v5 = [v4 enumeratorAtPath:v3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      uint64_t v9 = *MEMORY[0x263F08008];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
          id v12 = [v5 fileAttributes];
          id v13 = [v12 objectForKeyedSubscript:v9];

          id v14 = v3;
          v15 = [v3 stringByAppendingPathComponent:v11];
          [v26 timeIntervalSinceDate:v13];
          double v17 = v16;
          _HKInitializeLogging();
          v18 = *MEMORY[0x263F09908];
          BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG);
          if (v17 >= 1209600.0)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543362;
              v33 = v15;
              _os_log_debug_impl(&dword_21BFB4000, v18, OS_LOG_TYPE_DEBUG, "Removing analytics file '%{public}@'", buf, 0xCu);
            }
            id v27 = 0;
            char v20 = [v25 removeItemAtPath:v15 error:&v27];
            id v21 = v27;
            if ((v20 & 1) == 0)
            {
              _HKInitializeLogging();
              uint64_t v22 = *MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v33 = v15;
                __int16 v34 = 2114;
                id v35 = v21;
                _os_log_error_impl(&dword_21BFB4000, v22, OS_LOG_TYPE_ERROR, "Error removing analytics file at '%{public}@': %{public}@", buf, 0x16u);
              }
            }
          }
          else if (v19)
          {
            *(_DWORD *)buf = 138543618;
            v33 = v15;
            __int16 v34 = 2114;
            id v35 = v13;
            _os_log_debug_impl(&dword_21BFB4000, v18, OS_LOG_TYPE_DEBUG, "Do not remove analytics file '%{public}@' with modification date %{public}@", buf, 0x16u);
          }

          ++v10;
          id v3 = v14;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v7);
    }
  }
  return v24 != 0;
}

id __49__HDAnalyticsWriter_analyticsFilePathsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 lastPathComponent];
  int v5 = [v4 hasPrefix:@"HealthWrap"];

  if (v5)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathComponent:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_createAndCleanAnalyticsDirectoryWithError:(uint64_t)a1
{
  if (!a1 || !-[HDAnalyticsWriter _createAnalyticsDirectory:error:](a1, *(void **)(a1 + 16), a2)) {
    return 0;
  }
  id v3 = *(void **)(a1 + 16);

  return -[HDAnalyticsWriter _cleanAnalyticsDirectory:error:](a1, v3);
}

- (id)_serializeAnalyticsData:(uint64_t)a3 errorOut:
{
  if (a1)
  {
    id v4 = a2;
    int v5 = objc_opt_new();
    [v5 setObject:&unk_26CC23DA8 forKeyedSubscript:@"schemaVersion"];
    [v5 setObject:v4 forKeyedSubscript:@"data"];

    uint64_t v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:1 error:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_loadCertificateWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  HKHealthWrapDERDataFromString();
  CFDataRef v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    uint64_t v7 = @"Failed to decode base64 certificate data.";
LABEL_7:
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a2, 100, v7);
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  SecCertificateRef v5 = SecCertificateCreateWithData(0, v4);
  *(void *)(a1 + 8) = v5;
  if (!v5)
  {
    uint64_t v7 = @"Failed to create certificate.";
    goto LABEL_7;
  }
  uint64_t v6 = 1;
LABEL_8:

  return v6;
}

- (id)_encryptAnalyticsData:(void *)a3 withConfig:(uint64_t)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = (void *)MEMORY[0x263F0A428];
    id v9 = a3;
    uint64_t v10 = (void *)[v8 newOutputFileURL];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F0A428]) initWithConfiguration:v9];

    if ([v11 startWithOutputFileURL:v10 error:a4]
      && [v11 appendData:v7 error:a4])
    {
      id v12 = [v11 finalizeWithError:a4];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __90__HDAnalyticsWriter__submitJSONAnalyticsData_bugType_customDirectory_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 dataWithContentsOfURL:v3];
  [v4 writeData:v5];
}

- (uint64_t)_createAnalyticsDirectory:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08850]);
    if ([v6 fileExistsAtPath:v5 isDirectory:0])
    {
      uint64_t v7 = 1;
    }
    else
    {
      id v12 = 0;
      uint64_t v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
      id v8 = v12;
      if ((v7 & 1) == 0)
      {
        id v9 = [NSString stringWithFormat:@"Error creating analytics directory %@", v5];
        objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:underlyingError:", 100, v9, v8);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (a3) {
            *a3 = v10;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end