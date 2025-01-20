@interface NSFileManager
+ (BOOL)ane_addWriteModeForPath:(id)a3;
+ (BOOL)ane_addWriteModeIfMissing:(id)a3 originalMode:(unsigned __int16)a4;
@end

@implementation NSFileManager

+ (BOOL)ane_addWriteModeIfMissing:(id)a3 originalMode:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  v7 = v6;
  if ((v4 & 0x80) == 0
    && (id v8 = v6,
        chmod((const char *)[v8 fileSystemRepresentation], v4 | 0x80) == -1))
  {
    v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = *__error();
      int v14 = 138413058;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 1024;
      int v19 = v4;
      __int16 v20 = 1024;
      int v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@: fail to chmod (%@) with originalMode=0x%x errno=%{darwin:errno}d", (uint8_t *)&v14, 0x22u);
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)ane_addWriteModeForPath:(id)a3
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  memset(&v20, 0, sizeof(v20));
  id v7 = v5;
  if (stat((const char *)[v7 fileSystemRepresentation], &v20) == -1)
  {
    BOOL v9 = +[_ANELog common];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100032920(a2, (uint64_t)v7, v9);
    }

    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v7, v20.st_mode);
  }
  int v19 = v6;
  v10 = [v6 enumeratorAtPath:v7];
  uint64_t v11 = [v10 nextObject];
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      int v14 = [v7 stringByAppendingPathComponent:v12];
      v15 = [v10 fileAttributes];
      __int16 v16 = [v15 objectForKeyedSubscript:NSFilePosixPermissions];

      v8 &= objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v14, objc_msgSend(v16, "unsignedShortValue"));
      uint64_t v17 = [v10 nextObject];

      v12 = (void *)v17;
    }
    while (v17);
  }

  return v8;
}

@end