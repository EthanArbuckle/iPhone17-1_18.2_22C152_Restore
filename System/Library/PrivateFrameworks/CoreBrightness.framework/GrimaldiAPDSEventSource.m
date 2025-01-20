@interface GrimaldiAPDSEventSource
- (GrimaldiAPDSEventSource)init;
- (NSString)description;
- (int)getCoexFlags:(unsigned int *)a3;
- (int)getGlobalCorrectionFactor:(double *)a3;
- (int)requestEventOn:(id)a3 withNsamples:(unsigned __int8)a4 withCallback:(id)a5;
- (void)dealloc;
@end

@implementation GrimaldiAPDSEventSource

- (int)requestEventOn:(id)a3 withNsamples:(unsigned __int8)a4 withCallback:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v45 = self;
  SEL v44 = a2;
  id v43 = a3;
  unsigned __int8 v42 = a4;
  id v41 = a5;
  int v40 = 0;
  if (a5)
  {
    v36 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    if (v36)
    {
      *v36 = _Block_copy(v41);
      if (*v36)
      {
        v30 = malloc_type_calloc(1uLL, 0x28uLL, 0x1090040653BC2AFuLL);
        if (v30)
        {
          *(void *)v30 = malloc_type_calloc(v42, 4uLL, 0x100004052888210uLL);
          *((void *)v30 + 1) = malloc_type_calloc(v42, 4uLL, 0x100004052888210uLL);
          *((void *)v30 + 2) = malloc_type_calloc(v42, 8uLL, 0x100004000313F17uLL);
          *((void *)v30 + 3) = malloc_type_calloc(v42, 1uLL, 0x100004077774924uLL);
          if (*(void *)v30 && *((void *)v30 + 1) && *((void *)v30 + 2) && *((void *)v30 + 3))
          {
            *((_DWORD *)v30 + 8) = 0;
            *((unsigned char *)v30 + 36) = v42;
            return ApplePhotonDetectorServicesGetLuxAsync();
          }
          v26 = 0;
          if (v45->_logHandle)
          {
            logHandle = v45->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t inited = init_default_corebrightness_log();
            }
            logHandle = inited;
          }
          v26 = logHandle;
          char v25 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            v6 = v26;
            os_log_type_t v7 = v25;
            __os_log_helper_16_0_0(v24);
            _os_log_error_impl(&dword_1BA438000, v6, v7, "Failed to allocate memory for luxInfo member", v24, 2u);
          }
          int v40 = -536870211;
          free(*(void **)v30);
          free(*((void **)v30 + 1));
          free(*((void **)v30 + 2));
          free(*((void **)v30 + 3));
          free(v30);
        }
        else
        {
          v29 = 0;
          if (v45->_logHandle)
          {
            v13 = v45->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v12 = init_default_corebrightness_log();
            }
            v13 = v12;
          }
          v29 = v13;
          char v28 = 16;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v10 = v29;
            os_log_type_t v11 = v28;
            __os_log_helper_16_0_0(v27);
            _os_log_error_impl(&dword_1BA438000, v10, v11, "Failed to allocate memory for luxInfo", v27, 2u);
          }
          int v40 = -536870211;
        }
        _Block_release(*v36);
      }
      else
      {
        os_log_t v32 = 0;
        if (v45->_logHandle)
        {
          v15 = v45->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v14 = init_default_corebrightness_log();
          }
          v15 = v14;
        }
        os_log_t v32 = v15;
        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v47, (uint64_t)v41);
          _os_log_error_impl(&dword_1BA438000, v32, v31, "Failed to copy block from %p", v47, 0xCu);
        }
        int v40 = -536870211;
      }
      free(v36);
      return v40;
    }
    v35 = 0;
    if (v45->_logHandle)
    {
      v19 = v45->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v18 = init_default_corebrightness_log();
      }
      v19 = v18;
    }
    v35 = v19;
    char v34 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v16 = v35;
      os_log_type_t v17 = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_error_impl(&dword_1BA438000, v16, v17, "Failed to allocate memory for APDSCallbackWrapper", v33, 2u);
    }
    return -536870211;
  }
  else
  {
    v39 = 0;
    if (v45->_logHandle)
    {
      v23 = v45->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v22 = init_default_corebrightness_log();
      }
      v23 = v22;
    }
    v39 = v23;
    char v38 = 16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      log = v39;
      os_log_type_t type = v38;
      __os_log_helper_16_0_0(v37);
      _os_log_error_impl(&dword_1BA438000, log, type, "Callback is NULL", v37, 2u);
    }
    return -536870911;
  }
}

- (NSString)description
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (GrimaldiAPDSEventSource)init
{
  uint64_t v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)GrimaldiAPDSEventSource;
  uint64_t v12 = [(GrimaldiAPDSEventSource *)&v10 init];
  if (v12)
  {
    os_log_t v2 = os_log_create((const char *)CBGrimaldiModuleName, "APDSEventSource");
    v12->_logHandle = (OS_os_log *)v2;
    if (v12->_logHandle)
    {
      if (!ApplePhotonDetectorServicesOpen()) {
        return v12;
      }
    }
    else
    {
      v9 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v9 = inited;
      char v8 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v9;
        os_log_type_t type = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v7, 2u);
      }
    }

    return 0;
  }
  return 0;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_apdsHandle) {
    ApplePhotonDetectorServicesClose();
  }

  v2.receiver = v4;
  v2.super_class = (Class)GrimaldiAPDSEventSource;
  [(GrimaldiAPDSEventSource *)&v2 dealloc];
}

- (int)getCoexFlags:(unsigned int *)a3
{
  return ApplePhotonDetectorServicesGetCoex();
}

- (int)getGlobalCorrectionFactor:(double *)a3
{
  return ApplePhotonDetectorServicesGetGlobalCorrectionFactor();
}

@end