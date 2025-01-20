@interface _ANECloneHelper
+ (BOOL)shouldSkipCloneFor:(id)a3 isEncryptedModel:(BOOL)a4;
+ (id)cloneIfWritable:(id)a3 isEncryptedModel:(BOOL)a4 cloneDirectory:(id)a5;
@end

@implementation _ANECloneHelper

+ (BOOL)shouldSkipCloneFor:(id)a3 isEncryptedModel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 modelURL];
  id v25 = 0;
  id v24 = 0;
  unsigned int v8 = [v7 getResourceValue:&v25 forKey:NSURLVolumeIsRootFileSystemKey error:&v24];
  id v9 = v25;
  id v10 = v24;

  if (v8 && [v9 BOOLValue])
  {
    v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100031788();
    }
    LOBYTE(v12) = 1;
    BOOL v13 = 1;
    id v14 = v10;
  }
  else
  {
    v15 = [v6 modelURL];
    id v23 = 0;
    id v22 = 0;
    unsigned int v12 = [v15 getResourceValue:&v23 forKey:NSURLVolumeIsReadOnlyKey error:&v22];
    v11 = v23;
    id v14 = v22;

    if (v12 && [v11 BOOLValue])
    {
      v16 = +[_ANELog common];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100031824();
      }

      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  if (v4)
  {
    v17 = +[_ANELog common];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000316EC();
    }

    BOOL v13 = 1;
  }
  if ((v12 & 1) == 0)
  {
    v18 = +[_ANELog common];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = [v6 modelURL];
      *(_DWORD *)buf = 138412802;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ getResourceValue:forKey:error: FAILED. err=%@", buf, 0x20u);
    }
  }

  return v13;
}

+ (id)cloneIfWritable:(id)a3 isEncryptedModel:(BOOL)a4 cloneDirectory:(id)a5
{
  BOOL v6 = a4;
  id v9 = (char *)a3;
  id v10 = a5;
  unsigned int v12 = +[_ANELog common];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v52 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v69 = v52;
    __int16 v70 = 2112;
    v71 = v9;
    __int16 v72 = 2112;
    id v73 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@: START: model=%@ : cloneDirectory=%@", buf, 0x20u);
  }
  unsigned int v13 = [a1 shouldSkipCloneFor:v9 isEncryptedModel:v6];
  id v14 = +[_ANELog common];
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = NSStringFromSelector(a2);
      v17 = [v9 modelURL];
      *(_DWORD *)buf = 138412546;
      v69 = v16;
      __int16 v70 = 2112;
      v71 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: modelURL=%@. Skipping copyfile()", buf, 0x16u);
    }
    v18 = [v9 modelURL];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10003196C();
    }

    v19 = +[NSFileManager defaultManager];
    char v67 = 0;
    v20 = [v9 modelURL];
    v21 = [v20 path];
    unsigned __int8 v22 = [v19 fileExistsAtPath:v21 isDirectory:&v67];

    if (v22)
    {
      aSelector = a2;
      id v23 = [v9 modelURL];
      id v24 = [v23 path];

      if (!v67)
      {
        id v25 = [v9 modelURL];
        v26 = [v25 path];
        uint64_t v27 = [v26 stringByDeletingLastPathComponent];

        id v24 = (void *)v27;
      }
      uint64_t v28 = +[_ANEHashEncoding hexStringForString:v24];
      uint64_t v29 = [v24 lastPathComponent];
      v60 = (void *)v28;
      __int16 v30 = [v10 stringByAppendingPathComponent:v28];
      v62 = (void *)v29;
      id v31 = [v30 stringByAppendingPathComponent:v29];
      id v66 = 0;
      LOBYTE(v28) = [v19 removeItemAtPath:v31 error:&v66];
      id v32 = v66;
      v64 = v30;
      if ((v28 & 1) == 0)
      {
        v33 = +[_ANELog common];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v34;
          __int16 v70 = 2112;
          v71 = v31;
          __int16 v72 = 2112;
          id v73 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@: %@ could not be removed err=%@", buf, 0x20u);

          __int16 v30 = v64;
        }
      }
      id v65 = v32;
      unsigned __int8 v35 = [v19 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v65];
      v36 = v65;

      if ((v35 & 1) == 0)
      {
        v37 = +[_ANELog common];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v38;
          __int16 v70 = 2112;
          v71 = (const char *)v64;
          __int16 v72 = 2112;
          id v73 = v36;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@: %@ could not be created err=%@", buf, 0x20u);
        }
      }
      v63 = v11;
      id v61 = v24;
      v39 = (const char *)[v61 UTF8String];
      v40 = v31;
      v41 = (const char *)[v40 UTF8String];
      v42 = copyfile_state_alloc();
      v43 = +[_ANELog common];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v58 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        v69 = v58;
        __int16 v70 = 2080;
        v71 = v39;
        __int16 v72 = 2080;
        id v73 = (id)v41;
        __int16 v74 = 1024;
        int v75 = 819214;
        _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%@: --> Calling copyfile(src:%s, dst:%s, flags:0x%x)", buf, 0x26u);
      }
      int v44 = copyfile(v39, v41, v42, 0xC800Eu);
      copyfile_state_free(v42);
      if (v44 < 0)
      {
        v45 = +[_ANELog common];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v54 = NSStringFromSelector(aSelector);
          int v55 = *__error();
          v56 = __error();
          v57 = strerror(*v56);
          *(_DWORD *)buf = 138413570;
          v69 = v54;
          __int16 v70 = 2080;
          v71 = v39;
          __int16 v72 = 2080;
          id v73 = (id)v41;
          __int16 v74 = 1024;
          int v75 = 819214;
          __int16 v76 = 1024;
          int v77 = v55;
          __int16 v78 = 2080;
          v79 = v57;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@: copyfile(%s, %s, %o) FAILED with (%d : %s)", buf, 0x36u);
        }
        v18 = 0;
        v11 = v63;
      }
      else
      {
        +[NSFileManager ane_addWriteModeForPath:v40];
        v45 = [v40 copy];
        if (!v67)
        {
          v46 = [v9 modelURL];
          v47 = [v46 path];
          v48 = [v47 lastPathComponent];

          uint64_t v49 = [v40 stringByAppendingPathComponent:v48];

          v45 = v49;
        }
        +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v45, 0, v58);
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v50 = +[_ANELog common];
        v11 = v63;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          v53 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v53;
          __int16 v70 = 2112;
          v71 = v18;
          __int16 v72 = 2112;
          id v73 = v45;
          _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%@: END: modelURL=%@ : dstNameAfterClone=%@", buf, 0x20u);

          v11 = v63;
        }
      }
    }
    else
    {
      v36 = +[_ANELog common];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000318C0();
      }
      v18 = 0;
    }
  }

  return v18;
}

@end