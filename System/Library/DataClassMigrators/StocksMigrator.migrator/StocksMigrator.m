void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  __os_log_impl(dso, log, type, format, buf, size);
}

int close(int a1)
{
  return _close(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}
v4)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - groupContainers: %@", buf, 0xCu);
    }
    v5 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Preferences/com.apple.stocks.plist"];
    v6 = [v3 URLByAppendingPathComponent:@"Library/Preferences/"];
    v7 = [v3 URLByAppendingPathComponent:@"Library/Preferences/group.com.apple.stocks.plist"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - source: %@", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - destination: %@", buf, 0xCu);
    }
    v8 = [v5 path];
    v9 = [v2 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [v7 path];
      v11 = [v2 fileExistsAtPath:v10];

      if (v11)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - destination file is already present, don't overwrite", buf, 2u);
        }
        v12 = 0;
      }
      else
      {
        v21 = 0;
        v13 = [v2 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v21];
        v14 = v21;
        v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            v23 = v6;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - succeeded createDirectoryAtURL %@", buf, 0xCu);
          }
          v20 = v14;
          v16 = [v2 copyItemAtURL:v5 toURL:v7 error:&v20];
          v12 = v20;

          if (v16)
          {
            v17 = [v7 path];
            v18 = open((const char *)[v17 fileSystemRepresentation], 0, 0);

            if (v18 != -1)
            {
              if (fcntl(v18, 64, 3) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v23 = v7;
                _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - Can't set data protection class C on %@", buf, 0xCu);
              }
              close(v18);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - failed copyItemAtURL %@", buf, 0xCu);
          }
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            v23 = v14;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - failed createDirectoryAtURL %@", buf, 0xCu);
          }
          v12 = v14;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - removing source file", buf, 2u);
      }
      [v2 removeItemAtURL:v5 error:0];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - source file does not exist, nothing to do", buf, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - no groupContainers", buf, 2u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StocksMigrator - Done with Stocks migration...", buf, 2u);
  }

  return 1;
}

@end