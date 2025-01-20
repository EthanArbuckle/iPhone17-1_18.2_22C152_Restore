@interface DICommonAttach
+ (BOOL)DI1_attachWithDictionary:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)DI2_attachWithParams:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)defaultDiskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)diskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)diskImageAttach:(id)a3 readOnly:(BOOL)a4 autoMount:(BOOL)a5 BSDName:(id *)a6 error:(id *)a7;
@end

@implementation DICommonAttach

+ (BOOL)DI2_attachWithParams:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v27 = 0;
    v9 = getDIOSLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v29 = 53;
    __int16 v30 = 2080;
    v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
    LODWORD(v25) = 18;
    v24 = buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v29 = 53;
      __int16 v30 = 2080;
      v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
      _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }
  LOBYTE(v12) = 0;
  *__error() = v8;
  if (v7 && a4 && a5)
  {
    v13 = [v7 inputURL];
    v14 = [v13 pathExtension];
    int v15 = [v14 isEqualToString:@"sparseimage"];

    if (v15)
    {
      LOBYTE(v12) = +[DIError failWithPOSIXCode:45 verboseInfo:@"Sparse images are not supported by DI2" error:a5];
    }
    else
    {
      id v26 = 0;
      BOOL v12 = +[DiskImages2 attachWithParams:v7 handle:&v26 error:a5];
      id v16 = v26;
      if (v12)
      {
        int v17 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v27 = 0;
          v18 = getDIOSLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          v19 = objc_msgSend(v16, "BSDName", v24, v25);
          *(_DWORD *)buf = 68158210;
          int v29 = 53;
          __int16 v30 = 2080;
          v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
          __int16 v32 = 2114;
          v33 = v19;
          v20 = (char *)_os_log_send_and_compose_impl();

          if (v20)
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v20);
            free(v20);
          }
        }
        else
        {
          v21 = getDIOSLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [v16 BSDName];
            *(_DWORD *)buf = 68158210;
            int v29 = 53;
            __int16 v30 = 2080;
            v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
            __int16 v32 = 2114;
            v33 = v22;
            _os_log_impl(&dword_21E237000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image attached (with DI2) as %{public}@", buf, 0x1Cu);
          }
        }
        *__error() = v17;
        *a4 = [v16 BSDName];
      }
    }
  }

  return v12;
}

+ (BOOL)DI1_attachWithDictionary:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v8 = *__error();
  if (DIForwardLogs())
  {
    v9 = getDIOSLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v15 = 57;
    __int16 v16 = 2080;
    int v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v15 = 57;
      __int16 v16 = 2080;
      int v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
      _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }
  BOOL v12 = __error();
  BOOL result = 0;
  *BOOL v12 = v8;
  if (a3 && a4)
  {
    if (a5) {
      return +[DIError failWithPOSIXCode:45 verboseInfo:@"Attach with legacy DiskImages framework is not supported on embedded platforms" error:a5];
    }
  }
  return result;
}

+ (BOOL)defaultDiskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  if (a3) {
    return [a1 diskImageAttach:a3 readOnly:0 autoMount:1 BSDName:a4 error:a5];
  }
  else {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"nil URL specified" error:a5];
  }
}

+ (BOOL)diskImageAttach:(id)a3 readOnly:(BOOL)a4 autoMount:(BOOL)a5 BSDName:(id *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (v12)
  {
    int v13 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v42 = 0;
      v14 = getDIOSLog();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      int v15 = [v12 path];
      *(_DWORD *)buf = 68158211;
      int v44 = 67;
      __int16 v45 = 2080;
      v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
      __int16 v47 = 2113;
      v48 = v15;
      LODWORD(v36) = 28;
      v35 = buf;
      __int16 v16 = (char *)_os_log_send_and_compose_impl();

      if (v16)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v16);
        free(v16);
      }
    }
    else
    {
      uint64_t v18 = getDIOSLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v12 path];
        *(_DWORD *)buf = 68158211;
        int v44 = 67;
        __int16 v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        __int16 v47 = 2113;
        v48 = v19;
        _os_log_impl(&dword_21E237000, v18, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
      }
    }
    v20 = __error();
    int *v20 = v13;
    v22 = (void *)MEMORY[0x223C25160](v20, v21);
    id v41 = 0;
    v23 = [[DIAttachParams alloc] initWithURL:v12 error:&v41];
    id v24 = v41;
    id v25 = v24;
    if (v23)
    {
      [(DIAttachParams *)v23 setAutoMount:v9];
      if (v10) {
        uint64_t v26 = 2;
      }
      else {
        uint64_t v26 = 1;
      }
      -[DIAttachParams setFileMode:](v23, "setFileMode:", v26, v35, v36);
      id v39 = v25;
      id v40 = 0;
      char v17 = [a1 diskImageAttach:v23 BSDName:&v40 error:&v39];
      id v27 = v40;
      id v28 = v39;

      id v25 = v28;
    }
    else if ([v24 code] == 45)
    {

      int v29 = *__error();
      if (DIForwardLogs())
      {
        uint64_t v42 = 0;
        __int16 v30 = getDIOSLog();
        os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v44 = 67;
        __int16 v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        v31 = (char *)_os_log_send_and_compose_impl();

        if (v31)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v31);
          free(v31);
        }
      }
      else
      {
        __int16 v32 = getDIOSLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v44 = 67;
          __int16 v45 = 2080;
          v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
          _os_log_impl(&dword_21E237000, v32, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }
      }
      *__error() = v29;
      id v37 = 0;
      id v38 = 0;
      char v17 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", MEMORY[0x263EFFA78], &v38, &v37);
      id v27 = v38;
      id v25 = v37;
    }
    else
    {
      char v17 = 0;
      id v27 = 0;
    }

    if (a7 && (v33 = v25) != 0 || a6 && (v33 = v27, a7 = a6, !v25)) {
      *a7 = v33;
    }
  }
  else
  {
    char v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"nil URL specified" error:a7];
  }

  return v17;
}

+ (BOOL)diskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v38 = 0;
      BOOL v10 = getDIOSLog();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      v11 = [v8 inputURL];
      [v11 path];
      *(_DWORD *)buf = 68158211;
      int v40 = 48;
      __int16 v41 = 2080;
      uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
      __int16 v43 = 2113;
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v14 = getDIOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v8 inputURL];
        __int16 v16 = [v15 path];
        *(_DWORD *)buf = 68158211;
        int v40 = 48;
        __int16 v41 = 2080;
        uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        __int16 v43 = 2113;
        id v44 = v16;
        _os_log_impl(&dword_21E237000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
      }
    }
    char v17 = __error();
    *char v17 = v9;
    v19 = (void *)MEMORY[0x223C25160](v17, v18);
    id v36 = 0;
    id v37 = 0;
    char v20 = objc_msgSend(a1, "DI2_attachWithParams:BSDName:error:", v8, &v37, &v36);
    id v21 = v37;
    id v22 = v36;
    id v23 = v22;
    if (v20)
    {
      char v13 = 1;
    }
    else if ([v22 code] == 45 || objc_msgSend(v23, "code") == 35)
    {

      int v24 = *__error();
      if (DIForwardLogs())
      {
        uint64_t v38 = 0;
        id v25 = getDIOSLog();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v40 = 48;
        __int16 v41 = 2080;
        uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        uint64_t v26 = (char *)_os_log_send_and_compose_impl();

        if (v26)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v26);
          free(v26);
        }
      }
      else
      {
        id v27 = getDIOSLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v40 = 48;
          __int16 v41 = 2080;
          uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
          _os_log_impl(&dword_21E237000, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }
      }
      *__error() = v24;
      id v35 = 0;
      id v28 = [v8 toDI1ParamsWithError:&v35];
      id v29 = v35;
      id v33 = v29;
      id v34 = v21;
      char v13 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", v28, &v34, &v33);
      id v30 = v34;

      id v23 = v33;
      id v21 = v30;
    }
    else
    {
      char v13 = 0;
    }
    if (a5 && (v31 = v23) != 0 || a4 && (v31 = v21, a5 = a4, !v23)) {
      *a5 = v31;
    }
  }
  else
  {
    char v13 = +[DIError failWithPOSIXCode:22 verboseInfo:@"nil params specified" error:a5];
  }

  return v13;
}

@end