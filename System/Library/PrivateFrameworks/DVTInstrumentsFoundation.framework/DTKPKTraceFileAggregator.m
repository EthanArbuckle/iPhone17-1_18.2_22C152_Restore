@interface DTKPKTraceFileAggregator
- (BOOL)stopKtraceSessionWithError:(id *)a3;
- (DTKPKTraceFileAggregator)initWithConfig:(id)a3;
- (id)pause;
- (id)resume;
- (id)start;
- (id)stop;
- (id)swapOutCurrentDatastream:(id *)a3;
- (int)startKtraceSession:(char *)a3 useExisting:(BOOL)a4 outputFileURL:(id *)a5;
@end

@implementation DTKPKTraceFileAggregator

- (DTKPKTraceFileAggregator)initWithConfig:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DTKPKTraceFileAggregator;
  v6 = [(DTKPKTraceFileAggregator *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_kperfSample = 0;
    fileStream = v7->_fileStream;
    v7->_fileStream = 0;

    os_log_t v9 = os_log_create("com.apple.DTServiceHub", "Ktrace File Recording");
    logHandle = v7->_logHandle;
    v7->_logHandle = (OS_os_log *)v9;
  }
  return v7;
}

- (int)startKtraceSession:(char *)a3 useExisting:(BOOL)a4 outputFileURL:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(DTKPConfiguration *)self->_config providerOptions];
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x263EFFA78];
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  unsigned int v29 = 0;
  v13 = +[DTKTraceSessionCreator getDefaultedRemotePath:&v29];
  if (v29 == -1)
  {
    int v18 = 5;
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_signpost_enabled(logHandle))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23087D000, logHandle, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start Operation", "", buf, 2u);
    }
    v15 = objc_opt_new();
    [v15 setProviders:v12];
    v16 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:0x2000];
    [v15 setBitmap:v16];

    [v15 setUseExisting:v6];
    [v15 setCollectionInterval:-[DTKPConfiguration collectionInterval](self->_config, "collectionInterval")];
    *(_DWORD *)buf = -1;
    if (kperf_bless_get() || (int v17 = *(_DWORD *)buf, v17 != getpid()) || geteuid())
    {
      int v18 = 5;
    }
    else
    {
      v24 = [DTKTraceSessionCreator alloc];
      id v28 = 0;
      v25 = [(DTKTraceSessionCreator *)v24 initWithFD:v29 configuration:v15 error:&v28];
      id v26 = v28;
      ktraceSession = self->_ktraceSession;
      self->_ktraceSession = v25;

      if (v25) {
        int v18 = 0;
      }
      else {
        int v18 = 5;
      }
    }
    if (!v6)
    {
      v19 = self->_logHandle;
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23087D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Recording Lifetime", "", buf, 2u);
      }
    }
    if (v18)
    {
      v20 = [MEMORY[0x263F08850] defaultManager];
      [v20 removeItemAtURL:v13 error:0];

      [NSString stringWithFormat:@"Failure: %s", strerror(v18)];
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *a5 = v13;
      v21 = @"Success";
    }
    v22 = self->_logHandle;
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_signpost_emit_with_name_impl(&dword_23087D000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start Operation", "Result: %@", buf, 0xCu);
    }
  }
  return v18;
}

- (BOOL)stopKtraceSessionWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  logHandle = self->_logHandle;
  if (os_signpost_enabled(logHandle))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23087D000, logHandle, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Recording Lifetime", "", buf, 2u);
  }
  BOOL v6 = self->_logHandle;
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23087D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "End Operation", "", buf, 2u);
  }
  ktraceSession = self->_ktraceSession;
  id v17 = 0;
  BOOL v8 = [(DTKTraceSessionCreator *)ktraceSession stopWithError:&v17];
  id v9 = v17;
  v10 = self->_ktraceSession;
  self->_ktraceSession = 0;

  if (a3) {
    char v11 = v8;
  }
  else {
    char v11 = 1;
  }
  if (v11)
  {
    id v12 = 0;
    if (v8)
    {
LABEL_10:
      ktraceURL = (NSURL *)v12;
      id v12 = @"Success";
      goto LABEL_16;
    }
  }
  else
  {
    if (!v9)
    {
      sub_2308DDA0C(@"Failed stoping ktrace session.", -11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v9;
    *a3 = v9;
    id v12 = [v9 localizedDescription];
    if (v8) {
      goto LABEL_10;
    }
  }
  if (!self->_ktraceURL) {
    goto LABEL_17;
  }
  v14 = [MEMORY[0x263F08850] defaultManager];
  [v14 removeItemAtURL:self->_ktraceURL error:0];

  ktraceURL = self->_ktraceURL;
  self->_ktraceURL = 0;
LABEL_16:

LABEL_17:
  v15 = self->_logHandle;
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_signpost_emit_with_name_impl(&dword_23087D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "End Operation", "Result: %@", buf, 0xCu);
  }

  return v8;
}

- (id)pause
{
}

- (id)resume
{
}

- (id)start
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  v38 = self;
  uint64_t v35 = (uint64_t)&v35;
  v36 = &v35;
  v2 = [(DTKPConfiguration *)self->_config triggers];
  uint64_t v3 = [v2 count];

  if ([(DTKPConfiguration *)v38->_config hasEnabledKPCClasses])
  {
    [(DTKPConfiguration *)v38->_config enabledKPCClasses];
    if (kpc_set_counting())
    {
      int v4 = *__error();
      for (i = v36; i != &v35; i = (uint64_t *)i[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(i + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      v10 = [NSString stringWithFormat:@"kpc_set_counting failed (%s).", strerror(v4)];
      uint64_t v11 = sub_2308DDA0C(v10, -6);
LABEL_14:
      id v12 = (void *)v11;
LABEL_55:

      goto LABEL_56;
    }
  }
  if (v3)
  {
    uint64_t v6 = kperf_sample_on();
    v39 = &unk_26E514FB8;
    v40 = &v38;
    v41 = &v39;
    v7 = (uint64_t *)operator new(0x30uLL);
    uint64_t *v7 = 0;
    v7[1] = 0;
    sub_2308DE718((uint64_t)(v7 + 2), (uint64_t)&v39);
    BOOL v8 = v36;
    uint64_t *v7 = (uint64_t)&v35;
    v7[1] = (uint64_t)v8;
    *BOOL v8 = (uint64_t)v7;
    v36 = v7;
    ++v37;
    sub_2308DE8A0(&v39);
    if (v6)
    {
      for (j = v36; j != &v35; j = (uint64_t *)j[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(j + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      v10 = [NSString stringWithFormat:@"kperf_sample_on failed with %d.", v6];
      uint64_t v11 = sub_2308DDA0C(v10, -6);
      goto LABEL_14;
    }
    v38->_kperfSample = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [(DTKPConfiguration *)v38->_config queryCodeSet];
    v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_opt_new();
    }
    v10 = v15;

    [v10 addClass:37];
    if ([(DTKPConfiguration *)v38->_config collectionMode] == 3)
    {
      if (![(DTKPConfiguration *)v38->_config hasEnabledKPCClasses]
        || ([(DTKPConfiguration *)v38->_config enabledKPCClasses], !kpc_set_counting()))
      {
        if (v3)
        {
          uint64_t v24 = kperf_sample_on();
          v39 = &unk_26E515010;
          v40 = &v38;
          v41 = &v39;
          v25 = (uint64_t *)operator new(0x30uLL);
          uint64_t *v25 = 0;
          v25[1] = 0;
          sub_2308DE718((uint64_t)(v25 + 2), (uint64_t)&v39);
          id v26 = v36;
          uint64_t *v25 = (uint64_t)&v35;
          v25[1] = (uint64_t)v26;
          *id v26 = (uint64_t)v25;
          v36 = v25;
          ++v37;
          sub_2308DE8A0(&v39);
          if (v24)
          {
            for (k = v36; k != &v35; k = (uint64_t *)k[1])
            {
              sub_2308DE680((uint64_t)&v39, (uint64_t)(k + 2));
              if (!v41) {
                sub_2308AAD24();
              }
              (*((void (**)(void **))*v41 + 6))(v41);
              sub_2308DE8A0(&v39);
            }
            [NSString stringWithFormat:@"kperf_sample_on failed with %d.", v24];
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v28 = sub_2308DDA0C(v22, -6);
            goto LABEL_53;
          }
          v38->_kperfSample = 1;
        }
        uint64_t v29 = kperf_logging_start();
        v39 = &unk_26E515068;
        v41 = &v39;
        v30 = (uint64_t *)operator new(0x30uLL);
        uint64_t *v30 = 0;
        v30[1] = 0;
        sub_2308DE718((uint64_t)(v30 + 2), (uint64_t)&v39);
        v31 = v36;
        uint64_t *v30 = (uint64_t)&v35;
        v30[1] = (uint64_t)v31;
        uint64_t *v31 = (uint64_t)v30;
        v36 = v30;
        ++v37;
        sub_2308DE8A0(&v39);
        if (!v29)
        {
          id v12 = 0;
          goto LABEL_55;
        }
        for (m = v36; m != &v35; m = (uint64_t *)m[1])
        {
          sub_2308DE680((uint64_t)&v39, (uint64_t)(m + 2));
          if (!v41) {
            sub_2308AAD24();
          }
          (*((void (**)(void **))*v41 + 6))(v41);
          sub_2308DE8A0(&v39);
        }
        [NSString stringWithFormat:@"kperf_logging_start failed with %d.", v29];
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = sub_2308DDA0C(v22, -6);
        goto LABEL_53;
      }
      int v17 = *__error();
      for (n = v36; n != &v35; n = (uint64_t *)n[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(n + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      [NSString stringWithFormat:@"kpc_set_counting failed (%s).", strerror(v17)];
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = sub_2308DDA0C(v22, -6);
    }
    else
    {
      uint64_t v19 = [v10 createFilterMask:0];
      id v34 = 0;
      int v20 = [(DTKPKTraceFileAggregator *)v38 startKtraceSession:v19 useExisting:0 outputFileURL:&v34];
      id v21 = v34;
      id v22 = v34;
      objc_storeStrong((id *)&v38->_ktraceURL, v21);
      +[DTKPKDebugCodeSet releaseFilterMask:v19];
      if (!v20)
      {
        id v12 = 0;
LABEL_54:

        goto LABEL_55;
      }
      for (ii = v36; ii != &v35; ii = (uint64_t *)ii[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(ii + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      uint64_t v28 = sub_2308DDA0C(@"Failed starting ktrace session.", -11);
    }
LABEL_53:
    id v12 = (void *)v28;
    goto LABEL_54;
  }
  for (jj = v36; jj != &v35; jj = (uint64_t *)jj[1])
  {
    sub_2308DE680((uint64_t)&v39, (uint64_t)(jj + 2));
    if (!v41) {
      sub_2308AAD24();
    }
    (*((void (**)(void **))*v41 + 6))(v41);
    sub_2308DE8A0(&v39);
  }
  id v12 = sub_2308DDA0C(@"DTKPKTraceFileAggregator can only work with DTKPKperfConfiguration.", -11);
LABEL_56:
  sub_2308DE60C(&v35);
  return v12;
}

- (id)stop
{
  if ([(DTKPConfiguration *)self->_config collectionMode] == 3)
  {
    uint64_t v3 = [(DTKPConfiguration *)self->_config queryCodeSet];
    [v3 addClass:37];
    uint64_t v4 = [v3 createFilterMask:0];
    id v11 = 0;
    [(DTKPKTraceFileAggregator *)self startKtraceSession:v4 useExisting:1 outputFileURL:&v11];
    id v5 = v11;
    id v6 = v11;
    objc_storeStrong((id *)&self->_ktraceURL, v5);
    +[DTKPKDebugCodeSet releaseFilterMask:v4];

    id v7 = 0;
  }
  else
  {
    id v10 = 0;
    [(DTKPKTraceFileAggregator *)self stopKtraceSessionWithError:&v10];
    id v7 = v10;
  }
  if (self->_kperfSample) {
    kperf_sample_off();
  }
  if ([(DTKPConfiguration *)self->_config hasEnabledKPCClasses]) {
    kpc_set_counting();
  }
  if ([(DTKPConfiguration *)self->_config collectionMode] == 3)
  {
    uint64_t v8 = kperf_logging_stop();
    MEMORY[0x230FC1BF0](v8);
  }
  kperf_reset();
  return v7;
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  if (self->_ktraceURL)
  {
    fileStream = self->_fileStream;
    if (!fileStream)
    {
      id v5 = [[DVTFileStream alloc] initWithURL:self->_ktraceURL];
      id v6 = self->_fileStream;
      self->_fileStream = v5;

      fileStream = self->_fileStream;
    }
    id v7 = fileStream;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_ktraceSession, 0);
  objc_storeStrong((id *)&self->_ktraceURL, 0);
  objc_storeStrong((id *)&self->_fileStream, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end