@interface CLKUIMetalBinaryArchive
+ (id)archiveWithName:(id)a3 bundle:(id)a4 device:(id)a5;
- (BOOL)_binaryArchivesFeatureEnabled;
- (BOOL)_hasBinaryArchive;
- (BOOL)_shouldUseBinaryArchives;
- (CLKUIMetalBinaryArchive)initWithName:(id)a3 bundle:(id)a4 device:(id)a5;
- (MTLBinaryArchive)mtlBinaryArchive;
- (id)loadMTLBinaryArchiveNamed:(id)a3 inBundle:(id)a4 forDevice:(id)a5;
- (id)newFunctionInLibrary:(id)a3 withDescriptor:(id)a4;
- (id)newRenderPipelineStateForDevice:(id)a3 withDescriptor:(id)a4;
- (void)logElapsedTimeWithStart:(double)a3 category:(unint64_t)a4 name:(id)a5 usingBinaryArchive:(BOOL)a6;
- (void)setMtlBinaryArchive:(id)a3;
@end

@implementation CLKUIMetalBinaryArchive

- (BOOL)_binaryArchivesFeatureEnabled
{
  return MEMORY[0x1F40C9FB0]("NanoTimeKitExtras", "metal_binary_archives");
}

- (BOOL)_hasBinaryArchive
{
  return self->_mtlBinaryArchive != 0;
}

- (BOOL)_shouldUseBinaryArchives
{
  BOOL v3 = [(CLKUIMetalBinaryArchive *)self _binaryArchivesFeatureEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(CLKUIMetalBinaryArchive *)self _hasBinaryArchive];
  }
  return v3;
}

+ (id)archiveWithName:(id)a3 bundle:(id)a4 device:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CLKUIMetalBinaryArchive alloc] initWithName:v9 bundle:v8 device:v7];

  return v10;
}

- (CLKUIMetalBinaryArchive)initWithName:(id)a3 bundle:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CLKUIMetalBinaryArchive;
  v12 = [(CLKUIMetalBinaryArchive *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_archiveName, a3);
    if (![(CLKUIMetalBinaryArchive *)v13 _binaryArchivesFeatureEnabled])
    {
      v16 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[CLKUIMetalBinaryArchive initWithName:bundle:device:]();
      }
      goto LABEL_8;
    }
    uint64_t v14 = [(CLKUIMetalBinaryArchive *)v13 loadMTLBinaryArchiveNamed:v9 inBundle:v10 forDevice:v11];
    mtlBinaryArchive = v13->_mtlBinaryArchive;
    v13->_mtlBinaryArchive = (MTLBinaryArchive *)v14;

    if (![(CLKUIMetalBinaryArchive *)v13 _hasBinaryArchive])
    {
      v16 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CLKUIMetalBinaryArchive initWithName:bundle:device:]();
      }
LABEL_8:
    }
  }

  return v13;
}

- (id)loadMTLBinaryArchiveNamed:(id)a3 inBundle:(id)a4 forDevice:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CLKUIMetalBinaryArchive *)self _binaryArchivesFeatureEnabled])
  {
    id v11 = [v9 URLForResource:v8 withExtension:@"metallib"];
    if (v11)
    {
      double v12 = CACurrentMediaTime();
      v13 = objc_opt_new();
      [v13 setUrl:v11];
      id v24 = 0;
      uint64_t v14 = (void *)[v10 newBinaryArchiveWithDescriptor:v13 error:&v24];
      id v15 = v24;
      [(CLKUIMetalBinaryArchive *)self logElapsedTimeWithStart:0 category:v8 name:0 usingBinaryArchive:v12];
      if (!v14)
      {
        v16 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v22 = [v9 bundleIdentifier];
          v23 = [v15 localizedDescription];
          *(_DWORD *)buf = 138413570;
          id v26 = v8;
          __int16 v27 = 2112;
          id v28 = v8;
          __int16 v29 = 2112;
          v30 = v22;
          __int16 v31 = 2112;
          v32 = v11;
          __int16 v33 = 2112;
          v34 = v10;
          __int16 v35 = 2112;
          v36 = v23;
          _os_log_fault_impl(&dword_1D3174000, v16, OS_LOG_TYPE_FAULT, "[%@] Error: Found binary archive in bundle but failed to create MTLBinaryArchive; name=(%@) bundle=(%@) url="
            "(%@) device=(%@); error=%@",
            buf,
            0x3Eu);
        }
      }
      v17 = v14;

      objc_super v18 = v17;
    }
    else
    {
      v17 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = [v9 bundleIdentifier];
        *(_DWORD *)buf = 138413058;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v8;
        __int16 v29 = 2112;
        v30 = v21;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_error_impl(&dword_1D3174000, v17, OS_LOG_TYPE_ERROR, "[%@] Failed to find URL for (%@.metallib) in bundle (%@) for device (%@)", buf, 0x2Au);
      }
      objc_super v18 = 0;
    }
  }
  else
  {
    id v11 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v20 = [v9 bundleIdentifier];
      *(_DWORD *)buf = 138413058;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      v30 = v20;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_debug_impl(&dword_1D3174000, v11, OS_LOG_TYPE_DEBUG, "[%@] Tried to load MTLBinaryArchive named (%@) in bundle (%@) for device (%@) BUT the feature isn't enabled", buf, 0x2Au);
    }
    objc_super v18 = 0;
  }

  return v18;
}

- (id)newFunctionInLibrary:(id)a3 withDescriptor:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CLKUIMetalBinaryArchive *)self _binaryArchivesFeatureEnabled])
  {
    if ([(CLKUIMetalBinaryArchive *)self _hasBinaryArchive])
    {
      v26[0] = self->_mtlBinaryArchive;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      [v7 setBinaryArchives:v8];
    }
    else
    {
      id v8 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CLKUIMetalBinaryArchive newFunctionInLibrary:withDescriptor:]();
      }
    }
  }
  double v9 = CACurrentMediaTime();
  id v10 = (void *)[v6 newFunctionWithDescriptor:v7 error:0];
  id v11 = [v7 name];
  [(CLKUIMetalBinaryArchive *)self logElapsedTimeWithStart:2 category:v11 name:[(CLKUIMetalBinaryArchive *)self _shouldUseBinaryArchives] usingBinaryArchive:v9];

  if (!v10)
  {
    double v12 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      archiveName = self->_archiveName;
      if ([(CLKUIMetalBinaryArchive *)self _hasBinaryArchive]) {
        id v15 = @"with";
      }
      else {
        id v15 = @"without";
      }
      v16 = [v7 name];
      v17 = [v6 label];
      int v18 = 138413058;
      v19 = archiveName;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = v17;
      _os_log_fault_impl(&dword_1D3174000, v12, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLFunction %@ a MTLBinaryArchive; function=(%@) library=(%@)",
        (uint8_t *)&v18,
        0x2Au);
    }
  }

  return v10;
}

- (id)newRenderPipelineStateForDevice:(id)a3 withDescriptor:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(CLKUIMetalBinaryArchive *)self _binaryArchivesFeatureEnabled])
  {
LABEL_14:
    v13 = 0;
    id v10 = 0;
    goto LABEL_15;
  }
  if (![(CLKUIMetalBinaryArchive *)self _hasBinaryArchive])
  {
    id v15 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CLKUIMetalBinaryArchive newRenderPipelineStateForDevice:withDescriptor:]();
    }

    goto LABEL_14;
  }
  v41[0] = self->_mtlBinaryArchive;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v7 setBinaryArchives:v8];

  double v9 = CACurrentMediaTime();
  id v30 = 0;
  id v10 = (id)[v6 newRenderPipelineStateWithDescriptor:v7 options:4 reflection:0 error:&v30];
  id v11 = v30;
  double v12 = [v7 label];
  [(CLKUIMetalBinaryArchive *)self logElapsedTimeWithStart:1 category:v12 name:1 usingBinaryArchive:v9];

  if (!v10 || (v13 = 0, v11))
  {
    uint64_t v14 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      archiveName = self->_archiveName;
      __int16 v27 = [v7 label];
      id v28 = [v11 localizedDescription];
      *(_DWORD *)buf = 138413314;
      v32 = archiveName;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      v40 = v28;
      _os_log_fault_impl(&dword_1D3174000, v14, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLRenderPipelineState with a MTLBinaryArchive; state=(%@) shader=(%@) device=(%@); error=%@",
        buf,
        0x34u);
    }
    v13 = v11;
  }
  if (v10 && !v13) {
    goto LABEL_17;
  }
LABEL_15:
  v16 = v10;

  double v17 = CACurrentMediaTime();
  id v29 = 0;
  id v10 = (id)[v6 newRenderPipelineStateWithDescriptor:v7 error:&v29];
  id v18 = v29;

  v19 = [v7 label];
  [(CLKUIMetalBinaryArchive *)self logElapsedTimeWithStart:1 category:v19 name:0 usingBinaryArchive:v17];

  if (v10 && !v18)
  {
LABEL_17:
    id v10 = v10;
    id v18 = 0;
    __int16 v20 = v10;
    goto LABEL_21;
  }
  v21 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    v23 = self->_archiveName;
    __int16 v24 = [v7 label];
    v25 = [v18 localizedDescription];
    *(_DWORD *)buf = 138413314;
    v32 = v23;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    v36 = v24;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    v40 = v25;
    _os_log_fault_impl(&dword_1D3174000, v21, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLRenderPipelineState without a MTLBinaryArchive; state=(%@) shader=(%@) device=(%@); error=%@",
      buf,
      0x34u);
  }
  __int16 v20 = 0;
LABEL_21:

  return v20;
}

- (void)logElapsedTimeWithStart:(double)a3 category:(unint64_t)a4 name:(id)a5 usingBinaryArchive:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  double v11 = (CACurrentMediaTime() - a3) * 1000.0;
  double v12 = @"Binary Archive";
  if (a4 == 1) {
    double v12 = @"Render Pipeline";
  }
  if (a4 == 2) {
    double v12 = @"Function";
  }
  v13 = v12;
  uint64_t v14 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    archiveName = self->_archiveName;
    if (v6) {
      double v17 = @"YES";
    }
    else {
      double v17 = @"NO";
    }
    if ([(CLKUIMetalBinaryArchive *)self _hasBinaryArchive]) {
      id v18 = (__CFString *)self->_archiveName;
    }
    else {
      id v18 = @"nil";
    }
    int v21 = 138413570;
    __int16 v22 = archiveName;
    __int16 v23 = 2048;
    uint64_t v24 = *(void *)&v11;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    double v30 = *(double *)&v17;
    __int16 v31 = 2112;
    v32 = v18;
    _os_log_debug_impl(&dword_1D3174000, v14, OS_LOG_TYPE_DEBUG, "[%@] Took (%g ms) to create the (%@) named (%@); usingBinaryArchive=(%@), archive=(%@)",
      (uint8_t *)&v21,
      0x3Eu);
  }

  if ([(CLKUIMetalBinaryArchive *)self _hasBinaryArchive] && v6 && v11 >= 32.0)
  {
    id v15 = _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_archiveName;
      if ([(CLKUIMetalBinaryArchive *)self _hasBinaryArchive]) {
        __int16 v20 = (__CFString *)self->_archiveName;
      }
      else {
        __int16 v20 = @"nil";
      }
      int v21 = 138413570;
      __int16 v22 = v19;
      __int16 v23 = 2048;
      uint64_t v24 = 0x4040000000000000;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2048;
      double v30 = v11;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_1D3174000, v15, OS_LOG_TYPE_ERROR, "[%@] ERROR: Exceeded (%g ms) using a MTLBinaryArchive to create the (%@) named (%@)! totalDuration=(%g ms), archive=(%@)", (uint8_t *)&v21, 0x3Eu);
    }
  }
}

- (MTLBinaryArchive)mtlBinaryArchive
{
  return self->_mtlBinaryArchive;
}

- (void)setMtlBinaryArchive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlBinaryArchive, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
}

- (void)initWithName:bundle:device:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D3174000, v0, OS_LOG_TYPE_ERROR, "[%@] Created a CLKUIMetalBinaryArchive object with name (%@) but MTLBinaryArchive failed to load", v1, 0x16u);
}

- (void)initWithName:bundle:device:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3174000, v0, v1, "[%@] Created a CLKUIMetalBinaryArchive object with name (%@) but the binary archive feature isn't enabled", v2, v3, v4, v5, v6);
}

- (void)newFunctionInLibrary:withDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3174000, v0, v1, "[%@] Requesting new MTLFunction and binary archives are enabled but the archive is nil; name=(%@)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)newRenderPipelineStateForDevice:withDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3174000, v0, v1, "[%@] Requesting new MTLRenderPipelineState and binary archives are enabled but the archive is nil; name=(%@)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end