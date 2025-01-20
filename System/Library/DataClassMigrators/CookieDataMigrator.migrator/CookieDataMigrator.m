uint64_t sub_30BC(void *a1)
{
  NSArray *v2;
  id v3;
  long long v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  const char *v13;
  int *v14;
  id v15;
  uint32_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  long long v24;
  char v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  NSFileAttributeKey v39;
  NSFileProtectionType v40;
  unsigned char v41[128];

  v30 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a1 error:0];
  v3 = [(NSArray *)v2 countByEnumeratingWithState:&v26 objects:v41 count:16];
  if (v3)
  {
    v5 = v3;
    v6 = *(void *)v27;
    v25 = 1;
    *(void *)&v4 = 138412546;
    v24 = v4;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v8, "pathExtension", v24), "isEqualToString:", @"binarycookies"))
        {
          v9 = [a1 stringByAppendingPathComponent:v8];
          v39 = NSFileProtectionKey;
          v40 = NSFileProtectionCompleteUntilFirstUserAuthentication;
          -[NSFileManager setAttributes:ofItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1), [a1 stringByAppendingPathComponent:v8], &v30);
          if (!v30) {
            continue;
          }
          if ([v30 domain] == NSCocoaErrorDomain)
          {
            v14 = (int *)[v30 code];
            if ([v30 domain] == NSCocoaErrorDomain)
            {
              v10 = (char *)[v30 code];
              if (v14 == &dword_4)
              {
LABEL_20:
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  continue;
                }
                v15 = [v30 localizedDescription];
                *(_DWORD *)buf = v24;
                v32 = v9;
                v33 = 2112;
                v34 = v15;
                v13 = "File %@ deleted before protection class was changed. [Error]: %@";
LABEL_22:
                v16 = 22;
LABEL_26:
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, v16);
                continue;
              }
LABEL_23:
              if (v10 == (unsigned char *)&stru_B8.reserved2 + 1)
              {
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  continue;
                }
                v17 = [v30 domain];
                v18 = [v30 code];
                v19 = [v30 localizedDescription];
                *(_DWORD *)buf = 138413058;
                v32 = v9;
                v33 = 2112;
                v34 = v17;
                v35 = 2048;
                v36 = v18;
                v37 = 2112;
                v38 = v19;
                v13 = "File %@ could not be opened since you do not have permissions to view it [Error %@:%ld]: %@";
                v16 = 42;
                goto LABEL_26;
              }
            }
            else if (v14 == &dword_4)
            {
              goto LABEL_20;
            }
          }
          else if ([v30 domain] == NSCocoaErrorDomain)
          {
            v10 = (char *)[v30 code];
            goto LABEL_23;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            v20 = [v30 domain];
            v21 = [v30 code];
            v22 = [v30 localizedDescription];
            *(_DWORD *)buf = 138413058;
            v32 = v9;
            v33 = 2112;
            v34 = v20;
            v35 = 2048;
            v36 = v21;
            v37 = 2112;
            v38 = v22;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to change the data class protection of cookie file %@. [Error %@:%ld]: %@", buf, 0x2Au);
          }
          v25 = 0;
          continue;
        }
        if ([v8 containsString:@"_tmp_"])
        {
          if (objc_msgSend(objc_msgSend(v8, "pathExtension"), "isEqualToString:", @"dat"))
          {
            v11 = [a1 stringByAppendingPathComponent:v8];
            [+[NSFileManager defaultManager] removeItemAtPath:v11 error:&v30];
            v12 = v30;
            if (v30)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                v32 = v11;
                v33 = 2112;
                v34 = v12;
                v13 = "Unabled to delete tmp file at location %@. Error = %@";
                goto LABEL_22;
              }
            }
          }
        }
      }
      v5 = [(NSArray *)v2 countByEnumeratingWithState:&v26 objects:v41 count:16];
      if (!v5) {
        return v25 & 1;
      }
    }
  }
  v25 = 1;
  return v25 & 1;
}

uint64_t sub_353C(void *a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [a1 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v12 = *(void *)v21;
    int v1 = 1;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(a1);
        }
        uint64_t v14 = v2;
        v3 = *(void **)(*((void *)&v20 + 1) + 8 * v2);
        v4 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", [v3 path], 0);
        char v19 = 0;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v16;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v4);
              }
              id v9 = objc_msgSend(objc_msgSend(v3, "path"), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "stringByAppendingString:", @"/Library/Cookies"));
              if ([+[NSFileManager defaultManager] fileExistsAtPath:v9 isDirectory:&v19])
              {
                v1 &= sub_30BC(v9);
              }
            }
            id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
          }
          while (v6);
        }
        uint64_t v2 = v14 + 1;
      }
      while ((id)(v14 + 1) != v13);
      id v13 = [a1 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }
  else
  {
    LOBYTE(v1) = 1;
  }
  return v1 & 1;
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void objc_enumerationMutation(id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}