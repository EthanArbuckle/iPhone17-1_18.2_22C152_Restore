@interface DIError
+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5;
+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4;
+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)mandatoryArgumentFailWithError:(id *)a3;
+ (NSBundle)frameworkBundle;
+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3;
+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7;
+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4;
+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4;
+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5;
+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
@end

@implementation DIError

+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3
{
  switch(a3)
  {
    case 160:
      id result = @"The disk image format is obsolete. Please convert it to a new format using Disk Utility";
      break;
    case 161:
      id result = @"The disk image format is not supported by this OS";
      break;
    case 162:
    case 163:
    case 164:
      goto LABEL_5;
    case 165:
      id result = @"Failed to mount filesystems";
      break;
    case 166:
      id result = @"Corrupted shadow file(s) chain";
      break;
    default:
      if (a3 == 152)
      {
        id result = @"The disk image is corrupted";
      }
      else
      {
LABEL_5:
        objc_msgSend(NSString, "stringWithFormat:", @"Disk image operation failed with error code %d", a3);
        id result = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return result;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263EFF9A0] dictionary];
  int v15 = [v11 isEqualToString:*MEMORY[0x263F08438]];
  if (a4 >= 0) {
    int64_t v16 = a4;
  }
  else {
    int64_t v16 = -a4;
  }
  if (v15) {
    int64_t v17 = v16;
  }
  else {
    int64_t v17 = a4;
  }
  if (!v12)
  {
    if ([v11 isEqualToString:@"com.apple.DiskImages2.ErrorDomain"]) {
      id v12 = +[DIError copyDefaultLocalizedStringForDIErrorCode:v17];
    }
    else {
      id v12 = 0;
    }
  }
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"(err code %d)", v17);
  if (v12)
  {
    [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08320]];
    if (v13)
    {
      int v19 = *__error();
      if (!DIForwardLogs())
      {
        v26 = getDIOSLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158722;
          int v37 = 62;
          __int16 v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v40 = 2114;
          id v41 = v12;
          __int16 v42 = 2114;
          id v43 = v13;
          __int16 v44 = 2114;
          v45 = v18;
          _os_log_impl(&dword_21E237000, v26, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ - %{public}@ %{public}@", buf, 0x30u);
        }

        goto LABEL_33;
      }
      v20 = getDIOSLog();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158722;
      int v37 = 62;
      __int16 v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v40 = 2114;
      id v41 = v12;
      __int16 v42 = 2114;
      id v43 = v13;
      __int16 v44 = 2114;
      v45 = v18;
      LODWORD(v35) = 48;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21) {
        goto LABEL_19;
      }
      goto LABEL_33;
    }
    int v23 = *__error();
    if (!DIForwardLogs())
    {
      v29 = getDIOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        int v37 = 62;
        __int16 v38 = 2080;
        v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        __int16 v40 = 2114;
        id v41 = v12;
        __int16 v42 = 2114;
        id v43 = v18;
        _os_log_impl(&dword_21E237000, v29, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
      }

      goto LABEL_41;
    }
    v24 = getDIOSLog();
    os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68158466;
    int v37 = 62;
    __int16 v38 = 2080;
    v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    __int16 v40 = 2114;
    id v41 = v12;
    __int16 v42 = 2114;
    id v43 = v18;
    LODWORD(v35) = 38;
    v34 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    if (v25) {
      goto LABEL_29;
    }
  }
  else
  {
    if (v13)
    {
      int v19 = *__error();
      if (!DIForwardLogs())
      {
        v28 = getDIOSLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          int v37 = 62;
          __int16 v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v40 = 2114;
          id v41 = v13;
          __int16 v42 = 2114;
          id v43 = v18;
          _os_log_impl(&dword_21E237000, v28, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
        }

        goto LABEL_33;
      }
      v22 = getDIOSLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158466;
      int v37 = 62;
      __int16 v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v40 = 2114;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v18;
      LODWORD(v35) = 38;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
      {
LABEL_19:
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v21);
        free(v21);
      }
LABEL_33:
      *__error() = v19;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, @"DIErrorVerboseInfo", v34, v35);
      goto LABEL_42;
    }
    int v23 = *__error();
    if (!DIForwardLogs())
    {
      v30 = getDIOSLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        int v37 = 62;
        __int16 v38 = 2080;
        v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        __int16 v40 = 2114;
        id v41 = v11;
        __int16 v42 = 2114;
        id v43 = v18;
        _os_log_impl(&dword_21E237000, v30, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ error %{public}@", buf, 0x26u);
      }

      goto LABEL_41;
    }
    v27 = getDIOSLog();
    os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68158466;
    int v37 = 62;
    __int16 v38 = 2080;
    v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    __int16 v40 = 2114;
    id v41 = v11;
    __int16 v42 = 2114;
    id v43 = v18;
    LODWORD(v35) = 38;
    v34 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    if (v25)
    {
LABEL_29:
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v25);
      free(v25);
    }
  }
LABEL_41:
  *__error() = v23;
LABEL_42:
  v31 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v11, v17, v14, v34, v35);
  v32 = v31;
  if (a7) {
    *a7 = v31;
  }

  return v32;
}

+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4
{
  v4 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:0 verboseInfo:a4 error:0];
  return v4;
}

+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:a4 verboseInfo:0 error:a5];
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:0 verboseInfo:0 error:a4];
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:a4 verboseInfo:0 error:a5];
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08410] code:a3 description:a4 verboseInfo:0 error:a5];
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08410] code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:*MEMORY[0x263F08410] code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4
{
  id v4 = +[DIError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:a3 description:0 verboseInfo:a4 error:0];
  return v4;
}

+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:a3 description:a4 verboseInfo:0 error:a5];
  return 0;
}

+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:a3 description:a4 verboseInfo:0 error:a5];
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:a3 description:0 verboseInfo:a4 error:a5];
  return 0;
}

+ (BOOL)mandatoryArgumentFailWithError:(id *)a3
{
  id v3 = +[DIError errorWithDomain:*MEMORY[0x263F08438] code:22 description:0 verboseInfo:@"A mandatory argument is null in a DiskImages2 API call. Remember to check if init succeeded" error:a3];
  return 0;
}

+ (NSBundle)frameworkBundle
{
  if (+[DIError frameworkBundle]::onceToken != -1) {
    dispatch_once(&+[DIError frameworkBundle]::onceToken, &__block_literal_global_0);
  }
  v2 = (void *)+[DIError frameworkBundle]::_bundle;
  return (NSBundle *)v2;
}

void __26__DIError_frameworkBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x263F086E0];
  id v3 = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/DiskImages2.framework"];
  uint64_t v1 = objc_msgSend(v0, "bundleWithURL:");
  v2 = (void *)+[DIError frameworkBundle]::_bundle;
  +[DIError frameworkBundle]::_bundle = v1;
}

+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  int v11 = *((_DWORD *)a3 + 2);
  if (v11 >= 0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = -v11;
  }
  id v13 = (__CFString *)*MEMORY[0x263F08438];
  if (v12 >= 0x6B) {
    id v13 = @"com.apple.DiskImages2.ErrorDomain";
  }
  v14 = v13;
  int v15 = NSString;
  uint64_t v16 = (*(uint64_t (**)(const void *))(*(void *)a3 + 16))(a3);
  if (v10) {
    [v15 stringWithFormat:@"%@: %s", v10, v16];
  }
  else {
  int64_t v17 = [v15 stringWithUTF8String:v16];
  }
  v18 = +[DIError errorWithDomain:v14 code:v12 description:v9 verboseInfo:v17 error:a6];

  return v18;
}

+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDIException:a3 description:a4 prefix:0 error:a5];
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDIException:a3 description:a4 prefix:0 error:a5];
  return 0;
}

+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDIException:a3 description:0 prefix:a4 error:a5];
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5 = +[DIError errorWithDIException:a3 description:0 prefix:a4 error:a5];
  return 0;
}

@end