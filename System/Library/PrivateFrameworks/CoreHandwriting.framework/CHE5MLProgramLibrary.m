@interface CHE5MLProgramLibrary
+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3;
+ (id)E5RTProgramLibraryForModelURL:(id)a3 error:(id *)a4;
- (CHE5MLProgramLibrary)initWithModelURL:(id)a3 error:(id *)a4;
- (VisionCoreE5RTProgramLibrary)visionCoreProgramLibrary;
@end

@implementation CHE5MLProgramLibrary

+ (id)E5RTProgramLibraryForModelURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_msgSend_isProgramLibraryAtURL_(MEMORY[0x1E4FB3E88], v6, (uint64_t)v5, v7, v8, v9))
  {
    v14 = objc_msgSend_programLibraryForURL_error_(MEMORY[0x1E4FB3E88], v10, (uint64_t)v5, (uint64_t)a4, v12, v13);
  }
  else if (objc_msgSend_isModelSourceURL_(MEMORY[0x1E4FB3E80], v10, (uint64_t)v5, v11, v12, v13))
  {
    v22 = objc_msgSend_modelSourceFromURL_error_(MEMORY[0x1E4FB3E80], v15, (uint64_t)v5, (uint64_t)a4, v16, v17);
    if (v22)
    {
      v25 = objc_msgSend_E5RTProgramLibraryCompilationOptionsForModelSource_(CHE5MLProgramLibrary, v18, (uint64_t)v22, v19, v20, v21);
      if (v25)
      {
        v14 = objc_msgSend_compileModelSource_options_error_(MEMORY[0x1E4FB3E88], v23, (uint64_t)v22, (uint64_t)v25, (uint64_t)a4, v24);
      }
      else if (a4)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"com.apple.corehandwriting", -1004, 0, v24);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3E90]);
  return v3;
}

- (CHE5MLProgramLibrary)initWithModelURL:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHE5MLProgramLibrary;
  uint64_t v7 = [(CHE5MLProgramLibrary *)&v22 init];
  if (v7)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    if (qword_1EA3CA000 == -1)
    {
      v10 = (id)qword_1EA3C9FC8;
      unint64_t v11 = v9 - 1;
      if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v10 = (id)qword_1EA3C9FC8;
      unint64_t v11 = v9 - 1;
      if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_8;
      }
    }
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CHE5MLLoadProgramLibrary", "", buf, 2u);
    }
LABEL_8:

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v12 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHE5MLLoadProgramLibrary\"", buf, 2u);
    }

    if (v6)
    {
      uint64_t v16 = objc_msgSend_E5RTProgramLibraryForModelURL_error_(CHE5MLProgramLibrary, v13, (uint64_t)v6, (uint64_t)a4, v14, v15);
      if (qword_1EA3CA000 == -1)
      {
        uint64_t v17 = (id)qword_1EA3C9FC8;
        if (v11 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_17;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        uint64_t v17 = (id)qword_1EA3C9FC8;
        if (v11 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_17;
        }
      }
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v17, OS_SIGNPOST_INTERVAL_END, v9, "CHE5MLLoadProgramLibrary", "", buf, 2u);
      }
LABEL_17:

      if (qword_1EA3CA000 == -1)
      {
        v18 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        v18 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
LABEL_20:

          if (v16)
          {
            objc_storeStrong((id *)&v7->_programLibrary, v16);
            uint64_t v19 = v7;
LABEL_31:

            goto LABEL_32;
          }
          if (qword_1EA3CA000 == -1)
          {
            uint64_t v20 = (id)qword_1EA3C9F90[0];
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
LABEL_29:

              uint64_t v16 = 0;
              goto LABEL_30;
            }
          }
          else
          {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            uint64_t v20 = (id)qword_1EA3C9F90[0];
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
          }
          *(_DWORD *)buf = 138412290;
          id v24 = v6;
          _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_ERROR, "Failed to load program library at: %@", buf, 0xCu);
          goto LABEL_29;
        }
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_DEFAULT, "END \"CHE5MLLoadProgramLibrary\"", buf, 2u);
      goto LABEL_20;
    }
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v16 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_30:
        uint64_t v19 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v16 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_ERROR, "Failed to locate E5ML model", buf, 2u);
    goto LABEL_30;
  }
  uint64_t v19 = 0;
LABEL_32:

  return v19;
}

- (VisionCoreE5RTProgramLibrary)visionCoreProgramLibrary
{
  return self->_programLibrary;
}

- (void).cxx_destruct
{
}

@end