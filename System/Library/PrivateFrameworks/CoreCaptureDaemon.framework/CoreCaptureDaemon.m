uint64_t CCPipeInterface::ccfree(CCPipeInterface *this)
{
  uint64_t result;
  uint64_t (*v3)(CCPipeInterface *);
  uint64_t vars8;

  result = CCPipeInterface::freeResources(this);
  if (this)
  {
    v3 = *(uint64_t (**)(CCPipeInterface *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

void CCLogTap::tapLoop(CCLogTap *this)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v2 = (*(uint64_t (**)(void))(**((void **)this + 8) + 72))(*((void *)this + 8));
  uint64_t v3 = coreCaptureOsLog;
  if (!v2)
  {
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = *((_DWORD *)this + 4);
        CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
        v6 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "tapLoop";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 123;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = CStringPtr;
        *(_WORD *)&buf[34] = 2080;
        *(void *)&buf[36] = v6;
        v7 = v3;
LABEL_7:
        _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *((_DWORD *)this + 4);
      v9 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v10 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "tapLoop";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 123;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = v9;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v10;
      v7 = &_os_log_internal;
      goto LABEL_7;
    }
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v11;
      long long v27 = v11;
      long long v24 = v11;
      long long v25 = v11;
      *(_OWORD *)&buf[32] = v11;
      long long v23 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", buf);
      int v12 = glog_fd;
      int v13 = *((_DWORD *)this + 4);
      v14 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v15 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      dprintf(v12, "CCLogTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", "tapLoop", 123, v13, v14, v15);
    }
    if ((*(unsigned int (**)(void))(**((void **)this + 8) + 88))(*((void *)this + 8))) {
      v16 = _logTapInterestCallback_kext;
    }
    else {
      v16 = _logTapInterestCallback_dext;
    }
    (*(void (**)(void, uint64_t (*)(uint64_t, int, void **), CCLogTap *))(**((void **)this + 8)
                                                                                              + 56))(*((void *)this + 8), v16, this);
    return;
  }
  int v17 = v2;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v18, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoop(), Error setting notification port rc[0x%08x]\n", buf, 8u);
LABEL_19:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v19;
    long long v27 = v19;
    long long v24 = v19;
    long long v25 = v19;
    *(_OWORD *)&buf[32] = v19;
    long long v23 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v21, 0, sizeof(v21));
    time_t v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::tapLoop(), Error setting notification port rc[0x%08x]\n", v17);
  }
}

uint64_t CCTap::ccfree(CCTap *this)
{
  uint64_t result = CCTap::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCTap *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

off_t CCLogFile::closeMMAP(CCLogFile *this)
{
  msync(*((void **)this + 157), *((void *)this + 158), 16);
  munmap(*((void **)this + 157), *((void *)this + 158));
  ftruncate(*((_DWORD *)this + 9), *((void *)this + 159));
  off_t result = lseek(*((_DWORD *)this + 9), 0, 2);
  *((void *)this + 157) = 0;
  *((void *)this + 159) = 0;
  *((void *)this + 158) = 0;
  return result;
}

uint64_t CCLogFile::initWithRegistryEntry(CCLogFile *this, CCFormatter *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogFile::initWithRegistryEntry \n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v66 = v6;
    long long v67 = v6;
    long long v64 = v6;
    long long v65 = v6;
    long long v63 = v6;
    *(_OWORD *)&buf[16] = v6;
    long long v62 = v6;
    *(_OWORD *)buf = v6;
    memset(&v59, 0, sizeof(v59));
    v60.__sig = 0xAAAAAAAAAAAAAAAALL;
    time(&v60.__sig);
    localtime_r(&v60.__sig, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogFile::initWithRegistryEntry \n");
  }
  v60.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v60.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!a2)
  {
    uint64_t v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      int v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      int v17 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: Invalid arguments\n", buf, 2u);
LABEL_51:
    if (glog_fd)
    {
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v66 = v30;
      long long v67 = v30;
      long long v64 = v30;
      long long v65 = v30;
      long long v63 = v30;
      *(_OWORD *)&buf[16] = v30;
      long long v62 = v30;
      *(_OWORD *)buf = v30;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: Invalid arguments\n");
    }
    return 0;
  }
  if (pthread_mutexattr_init(&v60))
  {
    uint64_t v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      long long v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      long long v19 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_init failed\n", buf, 2u);
LABEL_54:
    if (glog_fd)
    {
      *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v66 = v31;
      long long v67 = v31;
      long long v64 = v31;
      long long v65 = v31;
      long long v63 = v31;
      *(_OWORD *)&buf[16] = v31;
      long long v62 = v31;
      *(_OWORD *)buf = v31;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_init failed\n");
    }
    return 0;
  }
  if (pthread_mutexattr_settype(&v60, 2))
  {
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
      *(_WORD *)buf = 0;
      tm v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
      *(_WORD *)buf = 0;
      tm v21 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_settype failed\n", buf, 2u);
LABEL_57:
    if (glog_fd)
    {
      *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v66 = v32;
      long long v67 = v32;
      long long v64 = v32;
      long long v65 = v32;
      long long v63 = v32;
      *(_OWORD *)&buf[16] = v32;
      long long v62 = v32;
      *(_OWORD *)buf = v32;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_settype failed\n");
    }
    return 0;
  }
  if (pthread_mutex_init((pthread_mutex_t *)((char *)this + 160), &v60))
  {
    uint64_t v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      long long v23 = v22;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      long long v23 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutex_init failed\n", buf, 2u);
LABEL_60:
    if (glog_fd)
    {
      *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v66 = v33;
      long long v67 = v33;
      long long v64 = v33;
      long long v65 = v33;
      long long v63 = v33;
      *(_OWORD *)&buf[16] = v33;
      long long v62 = v33;
      *(_OWORD *)buf = v33;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutex_init failed\n");
    }
    return 0;
  }
  pthread_mutexattr_destroy(&v60);
  if (CCFile::initWithRegistryEntry(this, a2))
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, @"LogType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFNumberRef v9 = CFProperty;
      if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, (char *)this + 112))
      {
        CFRelease(v9);
        if (*((_DWORD *)this + 28))
        {
          *((_DWORD *)this + 29) = -1;
          int v10 = 2;
          goto LABEL_26;
        }
        CFNumberRef v11 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, @"NumberOfFiles", v7, 0);
        if (v11)
        {
          CFNumberRef v9 = v11;
          int v12 = (_DWORD *)((char *)this + 120);
          if (CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)this + 120))
          {
            CFRelease(v9);
            if (*v12)
            {
              CFNumberRef v13 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, @"FileSize", v7, 0);
              if (v13)
              {
                CFNumberRef v9 = v13;
                if (CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)this + 116))
                {
                  CFRelease(v9);
                  CFNumberRef v14 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, @"FileOptions", v7, 0);
                  if (v14)
                  {
                    CFNumberRef v9 = v14;
                    if (CFNumberGetValue(v14, kCFNumberSInt32Type, (char *)this + 124))
                    {
                      CFRelease(v9);
                      int v10 = *v12 + 1;
LABEL_26:
                      *((_DWORD *)this + 30) = v10;
                      *((_DWORD *)this + 9) = -1;
                      if (CCLogFile::buildFileTables((CFStringRef *)this)) {
                        return 1;
                      }
                      uint64_t v28 = coreCaptureOsLog;
                      if (coreCaptureOsLog)
                      {
                        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_81;
                        }
                        *(_WORD *)buf = 0;
                        v29 = v28;
                      }
                      else
                      {
                        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_81;
                        }
                        *(_WORD *)buf = 0;
                        v29 = &_os_log_internal;
                      }
                      _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry buildFileTables\n", buf, 2u);
LABEL_81:
                      if (glog_fd)
                      {
                        *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
                        *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
                        long long v66 = v45;
                        long long v67 = v45;
                        long long v64 = v45;
                        long long v65 = v45;
                        long long v63 = v45;
                        *(_OWORD *)&buf[16] = v45;
                        long long v62 = v45;
                        *(_OWORD *)buf = v45;
                        memset(&v59, 0, sizeof(v59));
                        time_t v58 = 0xAAAAAAAAAAAAAAAALL;
                        time(&v58);
                        localtime_r(&v58, &v59);
                        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                        dprintf(glog_fd, "%s ", buf);
                        dprintf(glog_fd, "CCLogFile::initWithRegistryEntry buildFileTables\n", v57);
                      }
                      goto LABEL_116;
                    }
                    uint64_t v50 = coreCaptureOsLog;
                    if (coreCaptureOsLog)
                    {
                      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_111;
                      }
                      *(_DWORD *)buf = 136315394;
                      *(void *)&buf[4] = "initWithRegistryEntry";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = 328;
                      v51 = v50;
                    }
                    else
                    {
                      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_111;
                      }
                      *(_DWORD *)buf = 136315394;
                      *(void *)&buf[4] = "initWithRegistryEntry";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = 328;
                      v51 = &_os_log_internal;
                    }
                    _os_log_error_impl(&dword_209928000, v51, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
LABEL_111:
                    if (glog_fd)
                    {
                      *(void *)&long long v56 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      long long v66 = v56;
                      long long v67 = v56;
                      long long v64 = v56;
                      long long v65 = v56;
                      long long v63 = v56;
                      *(_OWORD *)&buf[16] = v56;
                      long long v62 = v56;
                      *(_OWORD *)buf = v56;
                      memset(&v59, 0, sizeof(v59));
                      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
                      time(&v58);
                      localtime_r(&v58, &v59);
                      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                      dprintf(glog_fd, "%s ", buf);
                      int v36 = 328;
                      goto LABEL_113;
                    }
LABEL_115:
                    CFRelease(v9);
                    goto LABEL_116;
                  }
                  uint64_t v48 = coreCaptureOsLog;
                  if (coreCaptureOsLog)
                  {
                    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_108;
                    }
                    *(_DWORD *)buf = 136315650;
                    *(void *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 326;
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = "FileOptions";
                    v49 = v48;
                  }
                  else
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_108;
                    }
                    *(_DWORD *)buf = 136315650;
                    *(void *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 326;
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = "FileOptions";
                    v49 = &_os_log_internal;
                  }
                  _os_log_error_impl(&dword_209928000, v49, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_108:
                  if (glog_fd)
                  {
LABEL_109:
                    *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    long long v66 = v55;
                    long long v67 = v55;
                    long long v64 = v55;
                    long long v65 = v55;
                    long long v63 = v55;
                    *(_OWORD *)&buf[16] = v55;
                    long long v62 = v55;
                    *(_OWORD *)buf = v55;
                    memset(&v59, 0, sizeof(v59));
                    time_t v58 = 0xAAAAAAAAAAAAAAAALL;
                    time(&v58);
                    localtime_r(&v58, &v59);
                    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                    dprintf(glog_fd, "%s ", buf);
                    dprintf(glog_fd, "%s:%06u: Failed reading '%s' from registry\n");
                  }
LABEL_116:
                  CCLogFile::freeResources(this);
                  return 0;
                }
                uint64_t v46 = coreCaptureOsLog;
                if (coreCaptureOsLog)
                {
                  if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 322;
                    v47 = v46;
LABEL_141:
                    _os_log_error_impl(&dword_209928000, v47, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
                  }
                }
                else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "initWithRegistryEntry";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 322;
                  v47 = &_os_log_internal;
                  goto LABEL_141;
                }
                if (!glog_fd) {
                  goto LABEL_115;
                }
                *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v66 = v54;
                long long v67 = v54;
                long long v64 = v54;
                long long v65 = v54;
                long long v63 = v54;
                *(_OWORD *)&buf[16] = v54;
                long long v62 = v54;
                *(_OWORD *)buf = v54;
                memset(&v59, 0, sizeof(v59));
                time_t v58 = 0xAAAAAAAAAAAAAAAALL;
                time(&v58);
                localtime_r(&v58, &v59);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                dprintf(glog_fd, "%s ", buf);
                int v36 = 322;
                goto LABEL_113;
              }
              uint64_t v43 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_102;
                }
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "initWithRegistryEntry";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 320;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = "FileSize";
                v44 = v43;
              }
              else
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_102;
                }
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "initWithRegistryEntry";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 320;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = "FileSize";
                v44 = &_os_log_internal;
              }
              _os_log_error_impl(&dword_209928000, v44, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_102:
              if (glog_fd) {
                goto LABEL_109;
              }
              goto LABEL_116;
            }
            uint64_t v41 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_99;
              }
              *(_WORD *)buf = 0;
              v42 = v41;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_99;
              }
              *(_WORD *)buf = 0;
              v42 = &_os_log_internal;
            }
            _os_log_error_impl(&dword_209928000, v42, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry Number of files can not be 0.\n", buf, 2u);
LABEL_99:
            if (glog_fd)
            {
              *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v66 = v53;
              long long v67 = v53;
              long long v64 = v53;
              long long v65 = v53;
              long long v63 = v53;
              *(_OWORD *)&buf[16] = v53;
              long long v62 = v53;
              *(_OWORD *)buf = v53;
              memset(&v59, 0, sizeof(v59));
              time_t v58 = 0xAAAAAAAAAAAAAAAALL;
              time(&v58);
              localtime_r(&v58, &v59);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "CCLogFile::initWithRegistryEntry Number of files can not be 0.\n");
            }
            goto LABEL_116;
          }
          uint64_t v39 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "initWithRegistryEntry";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 315;
              v40 = v39;
LABEL_135:
              _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "initWithRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 315;
            v40 = &_os_log_internal;
            goto LABEL_135;
          }
          if (!glog_fd) {
            goto LABEL_115;
          }
          *(void *)&long long v52 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v66 = v52;
          long long v67 = v52;
          long long v64 = v52;
          long long v65 = v52;
          long long v63 = v52;
          *(_OWORD *)&buf[16] = v52;
          long long v62 = v52;
          *(_OWORD *)buf = v52;
          memset(&v59, 0, sizeof(v59));
          time_t v58 = 0xAAAAAAAAAAAAAAAALL;
          time(&v58);
          localtime_r(&v58, &v59);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
          dprintf(glog_fd, "%s ", buf);
          int v36 = 315;
LABEL_113:
          int v35 = glog_fd;
          goto LABEL_114;
        }
        uint64_t v37 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_93;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "initWithRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 312;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "NumberOfFiles";
          v38 = v37;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_93;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "initWithRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 312;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "NumberOfFiles";
          v38 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_93:
        if (glog_fd) {
          goto LABEL_109;
        }
        goto LABEL_116;
      }
      uint64_t v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "initWithRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 307;
        long long v27 = v26;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "initWithRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 307;
        long long v27 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v27, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
LABEL_66:
      if (glog_fd)
      {
        *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v66 = v34;
        long long v67 = v34;
        long long v64 = v34;
        long long v65 = v34;
        long long v63 = v34;
        *(_OWORD *)&buf[16] = v34;
        long long v62 = v34;
        *(_OWORD *)buf = v34;
        memset(&v59, 0, sizeof(v59));
        time_t v58 = 0xAAAAAAAAAAAAAAAALL;
        time(&v58);
        localtime_r(&v58, &v59);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
        dprintf(glog_fd, "%s ", buf);
        int v35 = glog_fd;
        int v36 = 307;
LABEL_114:
        dprintf(v35, "%s:%06u: Failed getting number\n", "initWithRegistryEntry", v36);
        goto LABEL_115;
      }
      goto LABEL_115;
    }
    uint64_t v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_63;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "initWithRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 305;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "LogType";
      long long v25 = v24;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_63;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "initWithRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 305;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "LogType";
      long long v25 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v25, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_63:
    if (glog_fd) {
      goto LABEL_109;
    }
    goto LABEL_116;
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 160));
  return 0;
}

void CCPcapngFormatter::~CCPcapngFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t CCPcapngFormatter::ccfree(CCPcapngFormatter *this)
{
  CCPcapngFormatter::freeInterfaceTables(this);

  return CCFormatter::ccfree(this);
}

void CCTap::cleanCaptureDirectories(CFStringRef *this)
{
  v23[2] = *MEMORY[0x263EF8340];
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    int v2 = "/Library/Logs/CoreCapture";
  }
  else {
    int v2 = "/Library/Logs/CrashReporter/CoreCapture";
  }
  v23[0] = v2;
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    uint64_t v3 = "/Library/Logs/CrashReporter/CoreCapture";
  }
  else {
    uint64_t v3 = "/Library/Logs/CoreCapture";
  }
  v23[1] = v3;
  if (this[11])
  {
    uint64_t v4 = 0;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    char v6 = 1;
    do
    {
      char v7 = v6;
      CFMutableStringRef Mutable = CFStringCreateMutable(v5, 512);
      CFNumberRef v9 = (const char *)v23[v4];
      CFStringAppendCString(Mutable, v9, 0);
      if (CFStringGetLength(this[11]))
      {
        CFStringAppendCString(Mutable, "/", 0);
        CFStringAppend(Mutable, this[11]);
      }
      uint64_t v10 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v9;
          CFNumberRef v11 = v10;
LABEL_16:
          _os_log_impl(&dword_209928000, v11, OS_LOG_TYPE_DEFAULT, "cleanCaptureDirectories %s\n", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v9;
        CFNumberRef v11 = &_os_log_internal;
        goto LABEL_16;
      }
      if (glog_fd)
      {
        *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v21 = v12;
        long long v22 = v12;
        long long v19 = v12;
        long long v20 = v12;
        long long v17 = v12;
        long long v18 = v12;
        *(_OWORD *)buf = v12;
        long long v16 = v12;
        memset(&v14, 0, sizeof(v14));
        time_t v13 = 0xAAAAAAAAAAAAAAAALL;
        time(&v13);
        localtime_r(&v13, &v14);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "cleanCaptureDirectories %s\n", v9);
      }
      cleanCaptureDirectory(Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
      char v6 = 0;
      uint64_t v4 = 1;
    }
    while ((v7 & 1) != 0);
  }
}

void CCDataTap::tapLoop(CCDataTap *this)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v2 = (*(uint64_t (**)(void))(**((void **)this + 8) + 72))(*((void *)this + 8));
  uint64_t v3 = coreCaptureOsLog;
  if (!v2)
  {
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = *((_DWORD *)this + 4);
        CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
        char v6 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "tapLoop";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 102;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = CStringPtr;
        *(_WORD *)&buf[34] = 2080;
        *(void *)&buf[36] = v6;
        char v7 = v3;
LABEL_7:
        _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCDataTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *((_DWORD *)this + 4);
      CFNumberRef v9 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      uint64_t v10 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "tapLoop";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 102;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = v9;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v10;
      char v7 = &_os_log_internal;
      goto LABEL_7;
    }
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v11;
      long long v27 = v11;
      long long v24 = v11;
      long long v25 = v11;
      *(_OWORD *)&unsigned char buf[32] = v11;
      long long v23 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&uint8_t buf[16] = v11;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", buf);
      int v12 = glog_fd;
      int v13 = *((_DWORD *)this + 4);
      tm v14 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v15 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      dprintf(v12, "CCDataTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", "tapLoop", 102, v13, v14, v15);
    }
    if ((*(unsigned int (**)(void))(**((void **)this + 8) + 88))(*((void *)this + 8))) {
      long long v16 = _dataTapInterestCallback_kext;
    }
    else {
      long long v16 = _dataTapInterestCallback_dext;
    }
    (*(void (**)(void, uint64_t (*)(uint64_t, int, void **), CCDataTap *))(**((void **)this + 8)
                                                                                               + 56))(*((void *)this + 8), v16, this);
    return;
  }
  int v17 = v2;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    long long v18 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    long long v18 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v18, OS_LOG_TYPE_ERROR, "CCDataTap::tapLoop(), Error setting notification port rc[0x%08x]\n", buf, 8u);
LABEL_19:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v19;
    long long v27 = v19;
    long long v24 = v19;
    long long v25 = v19;
    *(_OWORD *)&unsigned char buf[32] = v19;
    long long v23 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    memset(&v21, 0, sizeof(v21));
    time_t v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::tapLoop(), Error setting notification port rc[0x%08x]\n", v17);
  }
}

void CCTextFormatter::~CCTextFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t isSeedAndiOS(void)
{
  v1[1] = *MEMORY[0x263EF8340];
  if ((gBootArgsParsed & 1) == 0)
  {
    v1[0] = 256;
    if (!sysctlbyname("kern.bootargs", gBootArgs, v1, 0, 0))
    {
      byte_2675F7339 = 0;
      gBootArgsParsed = 1;
      if (strnstr(gBootArgs, "cc.log.seed", 0x100uLL)) {
        isSeedAndiOS(void)::bootArgSet = 1;
      }
    }
  }
  return isSeedAndiOS(void)::bootArgSet;
}

uint64_t CCLogPipeInterface::ccfree(CCLogPipeInterface *this)
{
  CCLogPipeInterface::freeResources((uint64_t)this);
  uint64_t result = CCPipeInterface::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCLogPipeInterface *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

uint64_t CCDataPipeInterface::ccfree(CCDataPipeInterface *this)
{
  CCDataPipeInterface::freeResources((uint64_t)this);
  uint64_t result = CCPipeInterface::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCDataPipeInterface *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

uint64_t CCPcapngFormatter::writeFileHeader(io_registry_entry_t *this)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v2 = (*(uint64_t (**)(io_registry_entry_t *, void *, uint64_t))(*(void *)this + 112))(this, &kSectionHeaderBlock, 28);
  CCPcapngFormatter::buildStreamToInterfaceTable((CCPcapngFormatter *)this);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef cf = (const __CFString *)IORegistryEntryCreateCFProperty(this[3], @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  int Length = CFStringGetLength(cf);
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(this[3], @"Name", v3, 0);
  int v6 = CFStringGetLength(CFProperty);
  if (!this[8]) {
    goto LABEL_20;
  }
  __int16 v7 = v6;
  uint64_t v8 = 0;
  uint64_t v32 = ((Length + 3) & 0xFFFFFFFC) + 4;
  __int16 v33 = Length;
  uint64_t v31 = ((v6 + 3) & 0xFFFFFFFC) + 4;
  int v30 = Length + v31 + 31;
  while (1)
  {
    unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    int v38 = -1431655766;
    int v39 = 0;
    unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
    *(_DWORD *)&v50[256] = -1431655766;
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v50[224] = v9;
    *(_OWORD *)&v50[240] = v9;
    *(_OWORD *)&v50[192] = v9;
    *(_OWORD *)&v50[208] = v9;
    *(_OWORD *)&v50[160] = v9;
    *(_OWORD *)&v50[176] = v9;
    *(_OWORD *)&v50[128] = v9;
    *(_OWORD *)&v50[144] = v9;
    *(_OWORD *)&v50[96] = v9;
    *(_OWORD *)&v50[112] = v9;
    *(_OWORD *)&v50[64] = v9;
    *(_OWORD *)&v50[80] = v9;
    *(_OWORD *)&v50[32] = v9;
    *(_OWORD *)&v50[48] = v9;
    *(_OWORD *)uint64_t v50 = v9;
    *(_OWORD *)&v50[16] = v9;
    uint64_t v10 = *((void *)this + 5);
    if (!v10) {
      break;
    }
    CFStringRef v11 = *(const __CFString **)(v10 + 8 * v8);
    if (!v11) {
      break;
    }
    if (!*((void *)this + 8))
    {
      uint64_t v25 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v8;
          long long v26 = v25;
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        long long v26 = &_os_log_internal;
LABEL_28:
        _os_log_error_impl(&dword_209928000, v26, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeFileHeader Uninitialized fDLTArray, i: %d\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v48 = v28;
        long long v49 = v28;
        long long v46 = v28;
        long long v47 = v28;
        long long v44 = v28;
        long long v45 = v28;
        *(_OWORD *)buf = v28;
        long long v43 = v28;
        memset(&v36, 0, sizeof(v36));
        time_t v35 = 0xAAAAAAAAAAAAAAAALL;
        time(&v35);
        localtime_r(&v35, &v36);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v36);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCPcapngFormatter::writeFileHeader Uninitialized fDLTArray, i: %d\n");
      }
      goto LABEL_20;
    }
    int v12 = CFStringGetLength(v11);
    __int16 v13 = v12;
    uint64_t v14 = ((v12 + 3) & 0xFFFFFFFC) + 4;
    LODWORD(v40) = 1;
    HIDWORD(v40) = ((v30 + v14) & 0xFFFFFFFC) + 8;
    LODWORD(v41) = *(unsigned __int16 *)(*((void *)this + 8) + 2 * v8);
    HIDWORD(v41) = 0x80000;
    uint64_t v15 = (*(uint64_t (**)(io_registry_entry_t *, unint64_t *, uint64_t))(*(void *)this + 112))(this, &v40, 16)+ v2;
    unint64_t v37 = 0x600010009;
    uint64_t v16 = (*(uint64_t (**)(io_registry_entry_t *, unint64_t *, uint64_t))(*(void *)this + 112))(this, &v37, 8);
    *(_WORD *)uint64_t v50 = 2;
    *(_WORD *)&v50[2] = v33;
    memset(&v50[4], 0, 256);
    CFStringGetCString(cf, &v50[4], 256, 0);
    uint64_t v17 = (*(uint64_t (**)(io_registry_entry_t *, unsigned char *, uint64_t))(*(void *)this + 112))(this, v50, v32);
    *(_WORD *)uint64_t v50 = 3;
    uint64_t v18 = v15 + v16 + v17;
    *(_WORD *)&v50[2] = v7;
    memset(&v50[4], 0, 256);
    CFStringGetCString(CFProperty, &v50[4], 256, 0);
    uint64_t v19 = (*(uint64_t (**)(io_registry_entry_t *, unsigned char *, uint64_t))(*(void *)this + 112))(this, v50, v31);
    *(_WORD *)uint64_t v50 = 12;
    uint64_t v20 = v18 + v19;
    *(_WORD *)&v50[2] = v13;
    memset(&v50[4], 0, 256);
    CFStringGetCString(*(CFStringRef *)(*((void *)this + 5) + 8 * v8), &v50[4], 256, 0);
    uint64_t v21 = (*(uint64_t (**)(io_registry_entry_t *, unsigned char *, uint64_t))(*(void *)this + 112))(this, v50, v14);
    uint64_t v22 = v20
        + (*(uint64_t (**)(io_registry_entry_t *, int *, uint64_t))(*(void *)this + 112))(this, &v39, 4);
    int v38 = ((v30 + v14) & 0xFFFFFFFC) + 8;
    uint64_t v2 = v22
       + (*(uint64_t (**)(io_registry_entry_t *, int *, uint64_t))(*(void *)this + 112))(this, &v38, 4)
       + v21;
    if (++v8 >= (unint64_t)this[8]) {
      goto LABEL_20;
    }
  }
  uint64_t v23 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    long long v24 = v23;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    long long v24 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeFileHeader Uninitialized fStreamNameArray, i: %d\n", buf, 8u);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v48 = v27;
    long long v49 = v27;
    long long v46 = v27;
    long long v47 = v27;
    long long v44 = v27;
    long long v45 = v27;
    *(_OWORD *)buf = v27;
    long long v43 = v27;
    memset(&v36, 0, sizeof(v36));
    time_t v35 = 0xAAAAAAAAAAAAAAAALL;
    time(&v35);
    localtime_r(&v35, &v36);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v36);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPcapngFormatter::writeFileHeader Uninitialized fStreamNameArray, i: %d\n");
  }
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2;
}

uint64_t CCServiceMonitor::servicesPublished(uint64_t this, io_iterator_t a2)
{
  uint64_t v2 = (unsigned char *)this;
  *(unsigned char *)(this + 12) = 1;
  if (!shutDownPending)
  {
    usleep(0x186A0u);
    while (1)
    {
      this = IOIteratorNext(a2);
      if (!this) {
        break;
      }
      io_object_t v4 = this;
      (*(void (**)(unsigned char *, uint64_t))(*(void *)v2 + 56))(v2, this);
      IOObjectRelease(v4);
    }
  }
  v2[12] = 0;
  return this;
}

void CCPipeMonitor::cleanCaptureDirectories(CFDictionaryRef *this)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)(this + 10);
  if (pthread_mutex_lock((pthread_mutex_t *)(this + 10)))
  {
    uint64_t v3 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      io_object_t v4 = v3;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      io_object_t v4 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "fMutexCleanDirectories not acquired, bail out\n", buf, 2u);
LABEL_19:
    if (glog_fd)
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v16;
      long long v34 = v16;
      long long v31 = v16;
      long long v32 = v16;
      long long v29 = v16;
      long long v30 = v16;
      *(_OWORD *)buf = v16;
      long long v28 = v16;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "fMutexCleanDirectories not acquired, bail out\n");
    }
    return;
  }
  CFAllocatorRef v5 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (Count)
  {
    CFIndex v7 = Count;
    size_t v8 = 8 * Count;
    long long v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    if (v9)
    {
      uint64_t v10 = v9;
      CFStringRef v11 = (const void **)malloc_type_malloc(v8, 0x80040B8603338uLL);
      if (v11)
      {
        int v12 = v11;
        CFDictionaryGetKeysAndValues(this[7], v10, v11);
        for (uint64_t i = 0; i != v7; ++i)
          (*(void (**)(const void *))(*(void *)v12[i] + 96))(v12[i]);
        pthread_mutex_unlock(v5);
        free(v10);
        uint64_t v14 = v12;
LABEL_11:
        free(v14);
LABEL_12:
        if (!pthread_mutex_unlock(v2)) {
          return;
        }
        uint64_t v15 = coreCaptureOsLog;
        if (!coreCaptureOsLog)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_WORD *)buf = 0;
          uint64_t v17 = &_os_log_internal;
          goto LABEL_30;
        }
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        *(_WORD *)buf = 0;
        goto LABEL_25;
      }
      uint64_t v21 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v22 = v21;
LABEL_51:
          _os_log_error_impl(&dword_209928000, v22, OS_LOG_TYPE_ERROR, "cleanCaptureDirectories:Failed to malloc memory for valueArray", buf, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v22 = &_os_log_internal;
        goto LABEL_51;
      }
      if (glog_fd)
      {
        *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v33 = v24;
        long long v34 = v24;
        long long v31 = v24;
        long long v32 = v24;
        long long v29 = v24;
        long long v30 = v24;
        *(_OWORD *)buf = v24;
        long long v28 = v24;
        memset(&v26, 0, sizeof(v26));
        time_t v25 = 0xAAAAAAAAAAAAAAAALL;
        time(&v25);
        localtime_r(&v25, &v26);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "cleanCaptureDirectories:Failed to malloc memory for valueArray");
      }
      pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
      uint64_t v14 = v10;
      goto LABEL_11;
    }
    uint64_t v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v20 = v19;
LABEL_49:
        _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "cleanCaptureDirectories:Failed to malloc memory for keyArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = &_os_log_internal;
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v23;
      long long v34 = v23;
      long long v31 = v23;
      long long v32 = v23;
      long long v29 = v23;
      long long v30 = v23;
      *(_OWORD *)buf = v23;
      long long v28 = v23;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "cleanCaptureDirectories:Failed to malloc memory for keyArray");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    goto LABEL_12;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
  if (!pthread_mutex_unlock(v2)) {
    return;
  }
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
LABEL_25:
    uint64_t v17 = v15;
    goto LABEL_30;
  }
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_31;
  }
  *(_WORD *)buf = 0;
  uint64_t v17 = &_os_log_internal;
LABEL_30:
  _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::cleanCaptureDirectories - fails to unlock\n", buf, 2u);
LABEL_31:
  if (glog_fd)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v33 = v18;
    long long v34 = v18;
    long long v31 = v18;
    long long v32 = v18;
    long long v29 = v18;
    long long v30 = v18;
    *(_OWORD *)buf = v18;
    long long v28 = v18;
    memset(&v26, 0, sizeof(v26));
    time_t v25 = 0xAAAAAAAAAAAAAAAALL;
    time(&v25);
    localtime_r(&v25, &v26);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::cleanCaptureDirectories - fails to unlock\n");
  }
}

uint64_t CCIOReporterFormatter::refreshSubscriptionsFromStreamRegistry(CCIOReporterFormatter *this)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  io_iterator_t iterator = 0;
  uint64_t v2 = *((unsigned int *)this + 8);
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    io_object_t v4 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    io_object_t v4 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "%s::%s clearing out any previous subscriptions\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v5;
    long long v40 = v5;
    long long v37 = v5;
    long long v38 = v5;
    long long v35 = v5;
    long long v36 = v5;
    *(_OWORD *)buf = v5;
    *(_OWORD *)&uint8_t buf[16] = v5;
    memset(&v32, 0, sizeof(v32));
    time_t v31 = 0xAAAAAAAAAAAAAAAALL;
    time(&v31);
    localtime_r(&v31, &v32);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s clearing out any previous subscriptions\n", "CCIOReporterFormatter", "refreshSubscriptionsFromStreamRegistry");
  }
  int v6 = (const void *)*((void *)this + 6);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 6) = 0;
  }
  CFIndex v7 = (const void *)*((void *)this + 5);
  if (v7)
  {
    CFRelease(v7);
    *((void *)this + 5) = 0;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF70]);
  *((void *)this + 5) = Mutable;
  if (!Mutable)
  {
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      uint64_t v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      uint64_t v14 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray not valid\n", buf, 0x16u);
LABEL_43:
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v39 = v25;
      long long v40 = v25;
      long long v37 = v25;
      long long v38 = v25;
      long long v35 = v25;
      long long v36 = v25;
      *(_OWORD *)buf = v25;
      *(_OWORD *)&uint8_t buf[16] = v25;
      memset(&v32, 0, sizeof(v32));
      time_t v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", buf);
      uint64_t v26 = 3758097085;
      dprintf(glog_fd, "%s::%s channelStreamArray not valid\n");
      return v26;
    }
    return 3758097085;
  }
  if (!MEMORY[0x210507440](v2, "IOService", &iterator))
  {
    uint64_t v15 = IOIteratorNext(iterator);
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v16;
    long long v40 = v16;
    long long v37 = v16;
    long long v38 = v16;
    long long v35 = v16;
    long long v36 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&uint8_t buf[16] = v16;
    if (v15)
    {
      uint64_t v17 = v15;
      do
      {
        uint64_t v18 = IOIteratorNext(iterator);
        MEMORY[0x210507450](v17, buf);
        if (*(void *)buf != 0x6F7065524F494343
          || *(void *)&buf[8] != 0x53676F4C72657472
          || *(void *)&buf[14] != 0x6D616572745367)
        {
          break;
        }
        CCIOReporterFormatter::addRegistryChildToChannelDictionary((CFMutableArrayRef *)this, v17);
        uint64_t v17 = v18;
      }
      while (v18);
    }
  }
  if (CFArrayGetCount(*((CFArrayRef *)this + 5)))
  {
    CFMutableArrayRef v10 = CFArrayCreateMutable(v8, 1, MEMORY[0x263EFFF70]);
    *((void *)this + 6) = v10;
    if (v10)
    {
      if (!CCIOReporterFormatter::shapeIOReportLibraryFriendlyDictionary((CFArrayRef *)this)) {
        return 0;
      }
      uint64_t v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
        int v12 = v11;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
        int v12 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "%s::%s shapeIOReportLibraryFriendlyDictionary failed\n", buf, 0x16u);
LABEL_50:
      uint64_t v26 = 3758097084;
      if (glog_fd)
      {
        *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v39 = v28;
        long long v40 = v28;
        long long v37 = v28;
        long long v38 = v28;
        long long v35 = v28;
        long long v36 = v28;
        *(_OWORD *)buf = v28;
        *(_OWORD *)&uint8_t buf[16] = v28;
        memset(&v32, 0, sizeof(v32));
        time_t v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s shapeIOReportLibraryFriendlyDictionary failed\n");
      }
      return v26;
    }
    uint64_t v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      long long v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      long long v24 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "%s::%s rawStreamAndSubscriptionArray not valid\n", buf, 0x16u);
LABEL_53:
    if (glog_fd)
    {
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v39 = v29;
      long long v40 = v29;
      long long v37 = v29;
      long long v38 = v29;
      long long v35 = v29;
      long long v36 = v29;
      *(_OWORD *)buf = v29;
      *(_OWORD *)&uint8_t buf[16] = v29;
      memset(&v32, 0, sizeof(v32));
      time_t v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", buf);
      uint64_t v26 = 3758097085;
      dprintf(glog_fd, "%s::%s rawStreamAndSubscriptionArray not valid\n");
      return v26;
    }
    return 3758097085;
  }
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    uint64_t v22 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    uint64_t v22 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v22, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray empty\n", buf, 0x16u);
LABEL_47:
  uint64_t v26 = 3758097084;
  if (glog_fd)
  {
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v27;
    long long v40 = v27;
    long long v37 = v27;
    long long v38 = v27;
    long long v35 = v27;
    long long v36 = v27;
    *(_OWORD *)buf = v27;
    *(_OWORD *)&uint8_t buf[16] = v27;
    memset(&v32, 0, sizeof(v32));
    time_t v31 = 0xAAAAAAAAAAAAAAAALL;
    time(&v31);
    localtime_r(&v31, &v32);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s channelStreamArray empty\n");
  }
  return v26;
}

uint64_t CCDataTap::initWithRegistryEntry(CCDataTap *this, CCPipeInterface *a2, CCTap *a3)
{
  io_object_t v3 = a2;
  uint64_t v21 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 18) = 2;
  long long v5 = CCPipeInterface::withRegistryEntry(a2, this, a3);
  if (v5)
  {
    *((void *)this + 8) = v6;
    if (v6)
    {
      CCTap::initWithRegistryEntry(this, v3);
      return 1;
    }
  }
  else
  {
    *((void *)this + 8) = 0;
  }
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v9 = v8;
LABEL_14:
      _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCDataTap::initWithRegistryEntry invalid fPipeInterface\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    long long v9 = &_os_log_internal;
    goto LABEL_14;
  }
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v10;
    long long v20 = v10;
    long long v17 = v10;
    long long v18 = v10;
    long long v15 = v10;
    long long v16 = v10;
    *(_OWORD *)buf = v10;
    long long v14 = v10;
    memset(&v12, 0, sizeof(v12));
    time_t v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataTap::initWithRegistryEntry invalid fPipeInterface\n");
  }
  return 0;
}

uint64_t CCFormatter::writeFileHeader(CCFormatter *this)
{
  return 0;
}

void CCDataTap::~CCDataTap(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t CCDataTap::profileRemoved(CFStringRef *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    io_object_t v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v4;
    long long v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v6 = CFStringGetCStringPtr(this[5], 0);
    CFIndex v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v7;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::profileRemoved, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v8;
    long long v23 = v8;
    long long v20 = v8;
    long long v21 = v8;
    long long v18 = v8;
    long long v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    int v9 = glog_fd;
    long long v10 = CFStringGetCStringPtr(this[5], 0);
    time_t v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCDataTap::profileRemoved, Owner: %s, Name: %s\n", v10, v11);
  }
  CFStringRef v12 = this[8];
  if (v12)
  {
    if (v13) {
      IOConnectCallMethod(v13[22], 7u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return 0;
}

uint64_t CCDataPipeInterface::getUserClientID(CCDataPipeInterface *this)
{
  return 1682991440;
}

void CCXPCService::~CCXPCService(void *this)
{
  if (this) {
    free(this);
  }
}

void CCIOReportDumpQueue::_processorThread(CCIOReportDumpQueue *this)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!theDict) {
    goto LABEL_61;
  }
  long long v46 = (pthread_mutex_t *)((char *)this + 40);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    pthread_mutex_lock(v46);
    if (*((unsigned char *)this + 12)) {
      goto LABEL_71;
    }
    if (!*((unsigned char *)this + 13) && !*((void *)this + 2))
    {
      if (pthread_cond_wait((pthread_cond_t *)((char *)this + 104), v46)) {
        goto LABEL_61;
      }
      if (*((unsigned char *)this + 12))
      {
LABEL_71:
        pthread_mutex_unlock(v46);
        goto LABEL_61;
      }
    }
    pthread_mutex_unlock(v46);
    while (1)
    {
      uint64_t v4 = CCIOReportDumpQueue::dequeue(this);
      if (!v4) {
        break;
      }
      unsigned __int8 v5 = isSeedAndiOS();
      int v6 = CCProfileMonitor::fProfileLoaded;
      CFIndex v7 = CFStringCreateMutable(v3, 512);
      long long v8 = v7;
      if (!v7) {
        goto LABEL_61;
      }
      if ((v5 & (v6 == 0)) != 0) {
        int v9 = "/Library/Logs/CoreCapture";
      }
      else {
        int v9 = "/Library/Logs/CrashReporter/CoreCapture";
      }
      CFStringAppendCString(v7, v9, 0);
      CFStringAppendFormat(v8, 0, @"/%s/%s/", v4, "Data");
      io_registry_entry_t parent = 0;
      MutableCopy = CFStringCreateMutableCopy(v3, 0, v8);
      time_t v11 = MutableCopy;
      if (!MutableCopy)
      {
        uint64_t v27 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "_processorThread";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 189;
            long long v28 = v27;
LABEL_57:
            _os_log_error_impl(&dword_209928000, v28, OS_LOG_TYPE_ERROR, "%s@%d: bail - !hash\n", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "_processorThread";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 189;
          long long v28 = &_os_log_internal;
          goto LABEL_57;
        }
        if (glog_fd)
        {
          *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v57 = v29;
          long long v58 = v29;
          long long v55 = v29;
          long long v56 = v29;
          long long v53 = v29;
          long long v54 = v29;
          *(_OWORD *)buf = v29;
          *(_OWORD *)&uint8_t buf[16] = v29;
          memset(&v50, 0, sizeof(v50));
          time_t v49 = 0xAAAAAAAAAAAAAAAALL;
          time(&v49);
          localtime_r(&v49, &v50);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s@%d: bail - !hash\n", "_processorThread", 189);
        }
        CFRelease(v8);
        goto LABEL_61;
      }
      CFStringAppendFormat(MutableCopy, 0, @"0x%016x", *(unsigned int *)(v4 + 512));
      if (CFSetContainsValue(Mutable, v11))
      {
        io_object_t v12 = *(_DWORD *)(v4 + 512);
        if (v12) {
          IOObjectRelease(v12);
        }
        MEMORY[0x2105075B0](v4, 0x1020C404FABDE88);
        CFRelease(v11);
        CFRelease(v8);
      }
      else
      {
        CFSetAddValue(Mutable, v11);
        CFRelease(v11);
        if (!IORegistryEntryGetParentEntry(*(_DWORD *)(v4 + 512), "IOService", &parent)) {
          operator new();
        }
        if (CFDictionaryGetValue(theDict, v8))
        {
LABEL_24:
          time_t v15 = (const void *)IOReportCopyChannelsForDriver();
          if (v15)
          {
            if (IOReportGetChannelCount() && IOReportMergeChannels())
            {
              uint64_t v30 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "_processorThread";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 254;
                  time_t v31 = v30;
LABEL_67:
                  _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "%s@%d: Problem merging channels\n", buf, 0x12u);
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 254;
                time_t v31 = &_os_log_internal;
                goto LABEL_67;
              }
              if (glog_fd)
              {
                *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v57 = v32;
                long long v58 = v32;
                long long v55 = v32;
                long long v56 = v32;
                long long v53 = v32;
                long long v54 = v32;
                *(_OWORD *)buf = v32;
                *(_OWORD *)&uint8_t buf[16] = v32;
                memset(&v50, 0, sizeof(v50));
                time_t v49 = 0xAAAAAAAAAAAAAAAALL;
                time(&v49);
                localtime_r(&v49, &v50);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s@%d: Problem merging channels\n", "_processorThread", 254);
              }
              CFRelease(v15);
              CFRelease(v8);
              goto LABEL_61;
            }
            CFRelease(v15);
          }
          CFRelease(v8);
          io_object_t v16 = *(_DWORD *)(v4 + 512);
          if (v16) {
            IOObjectRelease(v16);
          }
          MEMORY[0x2105075B0](v4, 0x1020C404FABDE88);
        }
        else
        {
          Aggregate = (const void *)IOReportCreateAggregate();
          if (Aggregate)
          {
            dispatch_time_t v14 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 0x40000000;
            block[2] = ___ZN19CCIOReportDumpQueue16_processorThreadEv_block_invoke;
            block[3] = &__block_descriptor_tmp_1563;
            block[4] = this;
            dispatch_after(v14, MEMORY[0x263EF83A0], block);
            CFDictionarySetValue(theDict, v8, Aggregate);
            CFRelease(Aggregate);
            goto LABEL_24;
          }
          uint64_t v17 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_WORD *)buf = 0;
            long long v18 = v17;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_WORD *)buf = 0;
            long long v18 = &_os_log_internal;
          }
          _os_log_error_impl(&dword_209928000, v18, OS_LOG_TYPE_ERROR, "Unable to create IOReport Aggregate\n", buf, 2u);
LABEL_35:
          if (glog_fd)
          {
            *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v57 = v19;
            long long v58 = v19;
            long long v55 = v19;
            long long v56 = v19;
            long long v53 = v19;
            long long v54 = v19;
            *(_OWORD *)buf = v19;
            *(_OWORD *)&uint8_t buf[16] = v19;
            memset(&v50, 0, sizeof(v50));
            time_t v49 = 0xAAAAAAAAAAAAAAAALL;
            time(&v49);
            localtime_r(&v49, &v50);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "Unable to create IOReport Aggregate\n");
          }
          CFRelease(v8);
        }
      }
    }
    if (*((unsigned char *)this + 13))
    {
      *((unsigned char *)this + 13) = 0;
      CFIndex Count = CFDictionaryGetCount(theDict);
      keys = (void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      if (!keys) {
        goto LABEL_61;
      }
      CFDictionaryGetKeysAndValues(theDict, (const void **)keys, 0);
      if (Count)
      {
        long long v21 = (const void **)keys;
        while (1)
        {
          CFStringRef v22 = (const __CFString *)*v21;
          if (!*v21) {
            break;
          }
          Value = (__CFDictionary *)CFDictionaryGetValue(theDict, *v21);
          if (!Value)
          {
            uint64_t v37 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 288;
                long long v38 = v37;
LABEL_96:
                _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "%s@%d: bail - !allChannels\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 288;
              long long v38 = &_os_log_internal;
              goto LABEL_96;
            }
            if (glog_fd)
            {
              *(void *)&long long v43 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v57 = v43;
              long long v58 = v43;
              long long v55 = v43;
              long long v56 = v43;
              long long v53 = v43;
              long long v54 = v43;
              *(_OWORD *)buf = v43;
              *(_OWORD *)&uint8_t buf[16] = v43;
              memset(&v50, 0, sizeof(v50));
              time_t v49 = 0xAAAAAAAAAAAAAAAALL;
              time(&v49);
              localtime_r(&v49, &v50);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !allChannels\n", "_processorThread", 288);
            }
            goto LABEL_104;
          }
          if ((mkdirRecursive(v22) & 1) == 0)
          {
            uint64_t v33 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 295;
                long long v34 = v33;
LABEL_86:
                _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "%s@%d: bail - !mkdirRecursive\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 295;
              long long v34 = &_os_log_internal;
              goto LABEL_86;
            }
            if (glog_fd)
            {
              *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v57 = v41;
              long long v58 = v41;
              long long v55 = v41;
              long long v56 = v41;
              long long v53 = v41;
              long long v54 = v41;
              *(_OWORD *)buf = v41;
              *(_OWORD *)&uint8_t buf[16] = v41;
              memset(&v50, 0, sizeof(v50));
              time_t v49 = 0xAAAAAAAAAAAAAAAALL;
              time(&v49);
              localtime_r(&v49, &v50);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !mkdirRecursive\n", "_processorThread", 295);
            }
            goto LABEL_104;
          }
          uint64_t v24 = CFStringCreateMutableCopy(v3, 0, v22);
          CFStringRef v25 = v24;
          if (!v24)
          {
            uint64_t v39 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 303;
                long long v40 = v39;
LABEL_101:
                _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "%s@%d: bail - !filePath\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 303;
              long long v40 = &_os_log_internal;
              goto LABEL_101;
            }
            if (glog_fd)
            {
              *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v57 = v44;
              long long v58 = v44;
              long long v55 = v44;
              long long v56 = v44;
              long long v53 = v44;
              long long v54 = v44;
              *(_OWORD *)buf = v44;
              *(_OWORD *)&uint8_t buf[16] = v44;
              memset(&v50, 0, sizeof(v50));
              time_t v49 = 0xAAAAAAAAAAAAAAAALL;
              time(&v49);
              localtime_r(&v49, &v50);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !filePath\n", "_processorThread", 303);
            }
LABEL_104:
            free(keys);
LABEL_61:
            pthread_exit(0);
          }
          CFStringAppendFormat(v24, 0, @"/IOReporters.%s", "xml");
          CCIOReportDumpQueue::doSaveChannels(v26, v25, Value);
          CFRelease(v25);
          CFDictionaryRemoveValue(theDict, v22);
          ++v21;
          if (!--Count) {
            goto LABEL_49;
          }
        }
        uint64_t v35 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "_processorThread";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 281;
            long long v36 = v35;
LABEL_91:
            _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "%s@%d: bail - !saveDir\n", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "_processorThread";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 281;
          long long v36 = &_os_log_internal;
          goto LABEL_91;
        }
        if (glog_fd)
        {
          *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v57 = v42;
          long long v58 = v42;
          long long v55 = v42;
          long long v56 = v42;
          long long v53 = v42;
          long long v54 = v42;
          *(_OWORD *)buf = v42;
          *(_OWORD *)&uint8_t buf[16] = v42;
          memset(&v50, 0, sizeof(v50));
          time_t v49 = 0xAAAAAAAAAAAAAAAALL;
          time(&v49);
          localtime_r(&v49, &v50);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s@%d: bail - !saveDir\n", "_processorThread", 281);
        }
        goto LABEL_104;
      }
LABEL_49:
      free(keys);
      if (Mutable) {
        CFRelease(Mutable);
      }
      CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
    }
  }
}

void sub_20992E17C(_Unwind_Exception *a1)
{
  MEMORY[0x2105075B0](v1, 0x1020C404FABDE88);
  _Unwind_Resume(a1);
}

BOOL getOsVersion(char *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v24 = 0x4100000001;
  size_t v15 = 32;
  int v1 = sysctl(v24, 2u, a1, &v15, 0, 0);
  if (!v1) {
    return v1 == 0;
  }
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    CFAllocatorRef v3 = __error();
    uint64_t v4 = strerror(*v3);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v4;
    unsigned __int8 v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    time_t v11 = __error();
    io_object_t v12 = strerror(*v11);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    unsigned __int8 v5 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v5, OS_LOG_TYPE_ERROR, "getOsVersion %s\n", buf, 0xCu);
LABEL_6:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v6;
    long long v23 = v6;
    long long v20 = v6;
    long long v21 = v6;
    long long v18 = v6;
    long long v19 = v6;
    *(_OWORD *)buf = v6;
    long long v17 = v6;
    memset(&v14, 0, sizeof(v14));
    time_t v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v7 = glog_fd;
    long long v8 = __error();
    int v9 = strerror(*v8);
    dprintf(v7, "getOsVersion %s\n", v9);
  }
  return v1 == 0;
}

uint64_t CCLogPipeInterface::getUserClientID(CCLogPipeInterface *this)
{
  return 1817209168;
}

DIR *pruneDirectoryNDaysDo(const char *a1, int a2, time_t a3, uint64_t a4)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t result = opendir(a1);
  if (result)
  {
    int v9 = result;
    v10.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v10.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v72.st_blksize = v10;
    *(timespec *)v72.st_qspare = v10;
    v72.st_birthtimespec = v10;
    *(timespec *)&v72.st_size = v10;
    v72.st_mtimespec = v10;
    v72.st_ctimespec = v10;
    *(timespec *)&v72.st_uid = v10;
    v72.st_atimespec = v10;
    *(timespec *)&v72.st_dev = v10;
    int v30 = a2;
    int v28 = a2 + 1;
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            time_t v11 = readdir(v9);
            if (!v11) {
              return (DIR *)closedir(v9);
            }
            if (v11->d_type == 4)
            {
              *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v70 = v12;
              long long v71 = v12;
              long long v68 = v12;
              long long v69 = v12;
              long long v66 = v12;
              long long v67 = v12;
              long long v64 = v12;
              long long v65 = v12;
              long long v62 = v12;
              long long v63 = v12;
              long long v60 = v12;
              long long v61 = v12;
              long long v58 = v12;
              long long v59 = v12;
              long long v56 = v12;
              long long v57 = v12;
              long long v54 = v12;
              long long v55 = v12;
              long long v52 = v12;
              long long v53 = v12;
              long long v50 = v12;
              long long v51 = v12;
              long long v48 = v12;
              long long v49 = v12;
              long long v46 = v12;
              long long v47 = v12;
              long long v44 = v12;
              long long v45 = v12;
              long long v42 = v12;
              long long v43 = v12;
              d_name = v11->d_name;
              *(_OWORD *)__str = v12;
              long long v41 = v12;
              if (strcmp(v11->d_name, "."))
              {
                if (strcmp(d_name, "..")) {
                  break;
                }
              }
            }
          }
          __str[snprintf(__str, 0x200uLL, "%s/%s", a1, d_name)] = 0;
          if (!lstat(__str, &v72)) {
            break;
          }
          uint64_t v14 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              size_t v15 = __error();
              io_object_t v16 = strerror(*v15);
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = __str;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = v16;
              long long v17 = v14;
LABEL_28:
              _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "pruneDirectoryNDaysDo lstat failed on %s:\n%s\n", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = __error();
            uint64_t v27 = strerror(*v26);
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = __str;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v27;
            long long v17 = &_os_log_internal;
            goto LABEL_28;
          }
          if (glog_fd)
          {
            *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v38 = v18;
            long long v39 = v18;
            long long v36 = v18;
            long long v37 = v18;
            long long v34 = v18;
            long long v35 = v18;
            *(_OWORD *)buf = v18;
            *(_OWORD *)&uint8_t buf[16] = v18;
            memset(&v32, 0, sizeof(v32));
            time_t v31 = 0xAAAAAAAAAAAAAAAALL;
            time(&v31);
            localtime_r(&v31, &v32);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
            dprintf(glog_fd, "%s ", buf);
            int v19 = glog_fd;
            long long v20 = __error();
            long long v21 = strerror(*v20);
            dprintf(v19, "pruneDirectoryNDaysDo lstat failed on %s:\n%s\n", __str, v21);
          }
        }
        if (difftime(a3, v72.st_mtimespec.tv_sec) >= (double)(86400 * a4)) {
          break;
        }
        if (v30 <= 3) {
          pruneDirectoryNDaysDo(__str, v28, a3, a4);
        }
      }
      CFMutableArrayRef Mutable = CFStringCreateMutable(alloc, 512);
      CFStringAppendCString(Mutable, __str, 0);
      uint64_t v23 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = __str;
        uint64_t v24 = v23;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = __str;
        uint64_t v24 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v24, OS_LOG_TYPE_DEFAULT, "pruneDirectoryNDaysDo %s\n", buf, 0xCu);
LABEL_23:
      if (glog_fd)
      {
        *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v38 = v25;
        long long v39 = v25;
        long long v36 = v25;
        long long v37 = v25;
        long long v34 = v25;
        long long v35 = v25;
        *(_OWORD *)buf = v25;
        *(_OWORD *)&uint8_t buf[16] = v25;
        memset(&v32, 0, sizeof(v32));
        time_t v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "pruneDirectoryNDaysDo %s\n", __str);
      }
      deleteDirectory(Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  return result;
}

uint64_t CCServiceMonitor::servicesTerminated(uint64_t this, io_iterator_t iterator)
{
  uint64_t v2 = (unsigned char *)this;
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(unsigned char *)(this + 12) = 1;
  if (!shutDownPending)
  {
    while (1)
    {
      this = IOIteratorNext(iterator);
      if (!this) {
        break;
      }
      uint64_t v4 = this;
      uint64_t v5 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "servicesTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        long long v6 = v5;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "servicesTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        long long v6 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d registry entry:%u", buf, 0x18u);
LABEL_10:
      if (glog_fd)
      {
        *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v15 = v7;
        long long v16 = v7;
        long long v13 = v7;
        long long v14 = v7;
        long long v11 = v7;
        long long v12 = v7;
        *(_OWORD *)buf = v7;
        *(_OWORD *)&uint8_t buf[16] = v7;
        memset(&v9, 0, sizeof(v9));
        time_t v8 = 0xAAAAAAAAAAAAAAAALL;
        time(&v8);
        localtime_r(&v8, &v9);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%d registry entry:%u", "servicesTerminated", 170, v4);
      }
      (*(void (**)(unsigned char *, uint64_t))(*(void *)v2 + 64))(v2, v4);
      IOObjectRelease(v4);
    }
  }
  v2[12] = 0;
  return this;
}

void ___ZN16CCProfileMonitor21setStreamEventHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Woken up by notifyd.\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v5;
    long long v22 = v5;
    long long v19 = v5;
    long long v20 = v5;
    long long v17 = v5;
    long long v18 = v5;
    *(_OWORD *)buf = v5;
    long long v16 = v5;
    memset(&v14, 0, sizeof(v14));
    time_t v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Woken up by notifyd.\n");
  }
  if (MEMORY[0x210507D60](a2) == MEMORY[0x263EF8708] && MEMORY[0x263EF8720] != MEMORY[0x263EF8708])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x263EF86C8]);
    if (value)
    {
      time_t v8 = value;
      if (MEMORY[0x210507D60]() == MEMORY[0x263EF8798])
      {
        string_ptr = xpc_string_get_string_ptr(v8);
        if (string_ptr)
        {
          if (!strcmp(string_ptr, "com.apple.ManagedConfiguration.profileListChanged"))
          {
            uint64_t v10 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_24;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = "com.apple.ManagedConfiguration.profileListChanged";
              long long v11 = v10;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_24;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = "com.apple.ManagedConfiguration.profileListChanged";
              long long v11 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v11, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler event received:%s\n", buf, 0xCu);
LABEL_24:
            if (glog_fd)
            {
              *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v21 = v12;
              long long v22 = v12;
              long long v19 = v12;
              long long v20 = v12;
              long long v17 = v12;
              long long v18 = v12;
              *(_OWORD *)buf = v12;
              long long v16 = v12;
              memset(&v14, 0, sizeof(v14));
              time_t v13 = 0xAAAAAAAAAAAAAAAALL;
              time(&v13);
              localtime_r(&v13, &v14);
              strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
              dprintf(glog_fd, "%s ", (const char *)buf);
              dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler event received:%s\n", "com.apple.ManagedConfiguration.profileListChanged");
            }
          }
        }
      }
    }
  }
}

BOOL CCFile::initWithRegistryEntry(CCFile *this, CCFormatter *object)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  IOObjectRetain((io_object_t)object);
  *((_DWORD *)this + 16) = object;
  *((_DWORD *)this + 9) = -1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *((void *)this + 9) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *((void *)this + 10) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, @"Name", v4, 0);
  *((void *)this + 11) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, @"Filename", v4, 0);
  *((void *)this + 12) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, @"DirectoryName", v4, 0);
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)object, @"LogDataType", v4, 0);
  *((void *)this + 13) = CFProperty;
  int valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  long long v6 = CCFormatter::withRegistryEntry(object);
  long long v7 = v6;
  *((void *)this + 2) = v6;
  if (v6)
  {
    (*(void (**)(void *, CCFile *, uint64_t (*)(uint64_t)))(*(void *)v6 + 96))(v6, this, CCFile::_doWrite);
    MutableCopy = CFStringCreateMutableCopy(v4, 512, @"/var/log/CoreCapture");
    *((void *)this + 6) = MutableCopy;
    CFStringAppendCString(MutableCopy, "/", 0);
    CFStringAppend(*((CFMutableStringRef *)this + 6), *((CFStringRef *)this + 9));
    CFStringAppendCString(*((CFMutableStringRef *)this + 6), "/", 0);
    CFStringAppend(*((CFMutableStringRef *)this + 6), *((CFStringRef *)this + 10));
    CFStringAppendCString(*((CFMutableStringRef *)this + 6), "/", 0);
    if (mkdirRecursive(*((const __CFString **)this + 6)))
    {
LABEL_17:
      *((void *)this + 7) = 0;
      return v7 != 0;
    }
    CFIndex Length = CFStringGetLength(*((CFStringRef *)this + 6));
    uint64_t v10 = (char *)malloc_type_malloc(Length + 1, 0x91A35A86uLL);
    CFStringRef v11 = (const __CFString *)*((void *)this + 6);
    CFIndex v12 = CFStringGetLength(v11);
    CFStringGetCString(v11, v10, v12 + 1, 0);
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v10;
        tm v14 = v13;
LABEL_22:
        _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCFile::initWithTap Failed to create  %s\n", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v10;
      tm v14 = &_os_log_internal;
      goto LABEL_22;
    }
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v18;
      long long v30 = v18;
      long long v27 = v18;
      long long v28 = v18;
      long long v25 = v18;
      long long v26 = v18;
      *(_OWORD *)buf = v18;
      long long v24 = v18;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCFile::initWithTap Failed to create  %s\n", v10);
    }
    if (v10) {
      free(v10);
    }
    goto LABEL_17;
  }
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    long long v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    long long v16 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "CCFile::initWithTap Failed to create formatter\n", buf, 2u);
LABEL_10:
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v17;
    long long v30 = v17;
    long long v27 = v17;
    long long v28 = v17;
    long long v25 = v17;
    long long v26 = v17;
    *(_OWORD *)buf = v17;
    long long v24 = v17;
    memset(&v21, 0, sizeof(v21));
    time_t v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::initWithTap Failed to create formatter\n");
  }
  return v7 != 0;
}

uint64_t CCLogTap::ccfree(CCLogTap *this)
{
  *((unsigned char *)this + 56) = 1;
  CCTap::freeResources(this);
  uint64_t v2 = *(uint64_t (**)(CCLogTap *))(*(void *)this + 8);

  return v2(this);
}

void ___ZN12CCXPCService15startXPCServiceEv_block_invoke(uint64_t a1, void *a2)
{
}

void CCIOReporterFormatter::~CCIOReporterFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

void CCPipeMonitor::servicePublished(CCPipeMonitor *this, CCTap *entry)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)entry, @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringRef v6 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)entry, @"Name", v4, 0);
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "servicePublished";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = CFStringGetCStringPtr(CFProperty, 0);
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = CFStringGetCStringPtr(v6, 0);
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = entry;
    time_t v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "servicePublished";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = CFStringGetCStringPtr(CFProperty, 0);
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = CFStringGetCStringPtr(v6, 0);
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = entry;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "%s Owner:%s Name:%s entry:%u\n", buf, 0x26u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v23 = v9;
    long long v24 = v9;
    long long v21 = v9;
    long long v22 = v9;
    long long v19 = v9;
    long long v20 = v9;
    *(_OWORD *)buf = v9;
    *(_OWORD *)&uint8_t buf[16] = v9;
    memset(&v17, 0, sizeof(v17));
    time_t v16 = 0xAAAAAAAAAAAAAAAALL;
    time(&v16);
    localtime_r(&v16, &v17);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
    dprintf(glog_fd, "%s ", buf);
    int v10 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(CFProperty, 0);
    CFIndex v12 = CFStringGetCStringPtr(v6, 0);
    dprintf(v10, "%s Owner:%s Name:%s entry:%u\n", "servicePublished", CStringPtr, v12, entry);
  }
  uint64_t v13 = CCTap::withRegistryEntry(entry);
  if (v13)
  {
    tm v14 = v13;
    uint64_t v15 = *((void *)this + 8);
    v14[10] = v15;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 40))(v15);
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 7), (const void *)entry, v14);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 144));
    if (*((void *)this + 9) && CCProfileMonitor::fProfileLoaded)
    {
      (*(void (**)(void *))(*v14 + 72))(v14);
      CCProfileMonitor::applyProfile(*((void *)this + 9), CFProperty, v6);
    }
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v6) {
    CFRelease(v6);
  }
}

const char *CCTextFormatter::getFormatterFileExtension(CCTextFormatter *this)
{
  return "txt";
}

uint64_t mkdirRecursive(const __CFString *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v3 = (char *)malloc_type_malloc(Length + 1, 0x16A3DA63uLL);
  if (!v3) {
    return 0;
  }
  CFAllocatorRef v4 = v3;
  CFIndex v5 = CFStringGetLength(a1);
  CFStringGetCString(a1, v4, v5 + 1, 0);
  CFStringRef v6 = strdup(v4);
  uint64_t v7 = v6;
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v27.st_blksize = v8;
  *(timespec *)v27.st_qspare = v8;
  v27.st_birthtimespec = v8;
  *(timespec *)&v27.st_size = v8;
  v27.st_mtimespec = v8;
  v27.st_ctimespec = v8;
  *(timespec *)&v27.st_uid = v8;
  v27.st_atimespec = v8;
  *(timespec *)&v27.st_dev = v8;
  if (*v6 == 47) {
    long long v9 = v6 + 1;
  }
  else {
    long long v9 = v6;
  }
  while (*v9 != 47)
  {
    if (!*v9)
    {
      uint64_t v10 = 1;
      goto LABEL_30;
    }
LABEL_15:
    ++v9;
  }
  char *v9 = 0;
  if (stat(v7, &v27))
  {
    if (mkdir(v7, 0x1EDu) && (stat(v7, &v27) || (v27.st_mode & 0xF000) != 0x4000))
    {
      uint64_t v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v7;
          CFIndex v12 = v11;
          goto LABEL_33;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v7;
        CFIndex v12 = &_os_log_internal;
LABEL_33:
        _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "CCFile::mkdirRecursive Unable to mkdir on '%s'\n", buf, 0xCu);
      }
      if (glog_fd)
      {
        *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v25 = v15;
        long long v26 = v15;
        long long v23 = v15;
        long long v24 = v15;
        long long v21 = v15;
        long long v22 = v15;
        *(_OWORD *)buf = v15;
        *(_OWORD *)&uint8_t buf[16] = v15;
        memset(&v19, 0, sizeof(v19));
        time_t v18 = 0xAAAAAAAAAAAAAAAALL;
        time(&v18);
        localtime_r(&v18, &v19);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCFile::mkdirRecursive Unable to mkdir on '%s'\n");
      }
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  if ((v27.st_mode & 0xF000) == 0x4000)
  {
LABEL_14:
    char *v9 = 47;
    goto LABEL_15;
  }
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v7;
      tm v14 = v13;
      goto LABEL_35;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v7;
    tm v14 = &_os_log_internal;
LABEL_35:
    _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCFile::mkdirRecursive Unable to create path '%s' as '%s' is not a directory\n", buf, 0x16u);
  }
  if (glog_fd)
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v16;
    long long v26 = v16;
    long long v23 = v16;
    long long v24 = v16;
    long long v21 = v16;
    long long v22 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&uint8_t buf[16] = v16;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::mkdirRecursive Unable to create path '%s' as '%s' is not a directory\n");
  }
LABEL_29:
  uint64_t v10 = 0;
  char *v9 = 47;
LABEL_30:
  free(v7);
  free(v4);
  return v10;
}

uint64_t CCTap::initWithRegistryEntry(CCTap *this, io_object_t object)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 5) = 0;
  IOObjectRetain(object);
  *((_DWORD *)this + 4) = object;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *((void *)this + 5) = IORegistryEntryCreateCFProperty(object, @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *((void *)this + 6) = IORegistryEntryCreateCFProperty(object, @"Name", v4, 0);
  *((void *)this + 11) = IORegistryEntryCreateCFProperty(object, @"DirectoryName", v4, 0);
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)timespec v8 = 0u;
  long long v9 = 0u;
  CFStringRef v5 = (const __CFString *)*((void *)this + 6);
  if (v5
    && CFStringGetCString(v5, buffer, 64, 0)
    && (CFStringRef v6 = (const __CFString *)*((void *)this + 5)) != 0
    && CFStringGetCString(v6, v8, 64, 0))
  {
    snprintf((char *)this + 120, 0x40uLL, "%s:%s", v8, buffer);
  }
  else
  {
    strcpy((char *)this + 120, "com.apple.corecaptured.CCTap");
  }
  pthread_setname_np((const char *)this + 120);
  (*(void (**)(CCTap *))(*(void *)this + 136))(this);
  *((_DWORD *)this + 5) = 1;
  *((unsigned char *)this + 56) = 0;
  *((_WORD *)this + 48) = 0;
  return 1;
}

void deleteDirectory(__CFString *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      CFIndex Length = CFStringGetLength(a1);
      CFAllocatorRef v4 = (char *)malloc_type_malloc(Length + 1, 0x5962114EuLL);
      if (v4)
      {
        CFStringRef v5 = v4;
        CFIndex v6 = CFStringGetLength(a1);
        if (CFStringGetCString(a1, v5, v6 + 1, 0))
        {
          uint64_t v7 = opendir(v5);
          if (v7)
          {
            timespec v8 = v7;
            CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            while (1)
            {
              long long v10 = readdir(v8);
              if (!v10) {
                break;
              }
              long long v11 = v10;
              d_name = v10->d_name;
              if (strcmp(v10->d_name, ".") && strcmp(d_name, ".."))
              {
                CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v9, 512, a1);
                CFStringAppendCString(MutableCopy, "/", 0);
                CFStringAppendCString(MutableCopy, d_name, 0);
                if (v11->d_type == 4)
                {
                  deleteDirectory(MutableCopy);
                }
                else
                {
                  CFIndex v14 = CFStringGetLength(MutableCopy);
                  long long v15 = (char *)malloc_type_malloc(v14 + 1, 0x1FEDAD68uLL);
                  if (v15)
                  {
                    uint64_t v16 = v15;
                    CFIndex v17 = CFStringGetLength(MutableCopy);
                    if (CFStringGetCString(MutableCopy, v16, v17 + 1, 0) == 1) {
                      unlink(v16);
                    }
                    free(v16);
                  }
                }
                if (MutableCopy) {
                  CFRelease(MutableCopy);
                }
              }
            }
            closedir(v8);
            rmdir(v5);
LABEL_19:
            free(v5);
            return;
          }
          uint64_t v26 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_50;
            }
            stat v27 = __error();
            uint64_t v28 = strerror(*v27);
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "deleteDirectory";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 187;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v28;
            long long v29 = v26;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_50;
            }
            long long v37 = __error();
            long long v38 = strerror(*v37);
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "deleteDirectory";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 187;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v38;
            long long v29 = &_os_log_internal;
          }
          _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "%s:%06u: opendir failure - %s\n", buf, 0x1Cu);
LABEL_50:
          if (glog_fd)
          {
            *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v46 = v34;
            long long v47 = v34;
            long long v44 = v34;
            long long v45 = v34;
            long long v42 = v34;
            long long v43 = v34;
            *(_OWORD *)buf = v34;
            *(_OWORD *)&uint8_t buf[16] = v34;
            memset(&v40, 0, sizeof(v40));
            time_t v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", buf);
            int v35 = glog_fd;
            long long v36 = __error();
            strerror(*v36);
            dprintf(v35, "%s:%06u: opendir failure - %s\n");
          }
          goto LABEL_19;
        }
        uint64_t v24 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_47;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "deleteDirectory";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 183;
          long long v25 = v24;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_47;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "deleteDirectory";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 183;
          long long v25 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v25, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
LABEL_47:
        if (glog_fd)
        {
          *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v46 = v33;
          long long v47 = v33;
          long long v44 = v33;
          long long v45 = v33;
          long long v42 = v33;
          long long v43 = v33;
          *(_OWORD *)buf = v33;
          *(_OWORD *)&uint8_t buf[16] = v33;
          memset(&v40, 0, sizeof(v40));
          time_t v39 = 0xAAAAAAAAAAAAAAAALL;
          time(&v39);
          localtime_r(&v39, &v40);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n");
        }
        goto LABEL_19;
      }
      uint64_t v22 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "deleteDirectory";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 180;
        long long v23 = v22;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "deleteDirectory";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 180;
        long long v23 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_43:
      if (glog_fd)
      {
        *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v46 = v32;
        long long v47 = v32;
        long long v44 = v32;
        long long v45 = v32;
        long long v42 = v32;
        long long v43 = v32;
        *(_OWORD *)buf = v32;
        *(_OWORD *)&uint8_t buf[16] = v32;
        memset(&v40, 0, sizeof(v40));
        time_t v39 = 0xAAAAAAAAAAAAAAAALL;
        time(&v39);
        localtime_r(&v39, &v40);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%06u: Allocation failure\n");
      }
      return;
    }
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "deleteDirectory";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      long long v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "deleteDirectory";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      long long v21 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "%s:%06u: Invalid type\n", buf, 0x12u);
LABEL_40:
    if (glog_fd)
    {
      *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v31;
      long long v47 = v31;
      long long v44 = v31;
      long long v45 = v31;
      long long v42 = v31;
      long long v43 = v31;
      *(_OWORD *)buf = v31;
      *(_OWORD *)&uint8_t buf[16] = v31;
      memset(&v40, 0, sizeof(v40));
      time_t v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: Invalid type\n");
    }
    return;
  }
  uint64_t v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "deleteDirectory";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 176;
    tm v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "deleteDirectory";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 176;
    tm v19 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "%s:%06u: Invalid argument\n", buf, 0x12u);
LABEL_37:
  if (glog_fd)
  {
    *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v30;
    long long v47 = v30;
    long long v44 = v30;
    long long v45 = v30;
    long long v42 = v30;
    long long v43 = v30;
    *(_OWORD *)buf = v30;
    *(_OWORD *)&uint8_t buf[16] = v30;
    memset(&v40, 0, sizeof(v40));
    time_t v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%06u: Invalid argument\n");
  }
}

BOOL CCLogTap::initWithRegistryEntry(CFAbsoluteTime *this, CCPipeInterface *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  this[44] = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)this + 18) = 1;
  *((unsigned char *)this + 344) = 0;
  CFStringRef v5 = CCPipeInterface::withRegistryEntry(a2, (CCTap *)this, v4);
  if (!v5)
  {
    this[8] = 0.0;
LABEL_9:
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      CFIndex v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      CFIndex v14 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "(CCLogTap) CCPipeInterface::withRegistryEntry failed\n", buf, 2u);
LABEL_13:
    if (glog_fd)
    {
      *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v15;
      long long v30 = v15;
      long long v27 = v15;
      long long v28 = v15;
      long long v25 = v15;
      long long v26 = v15;
      *(_OWORD *)buf = v15;
      long long v24 = v15;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "(CCLogTap) CCPipeInterface::withRegistryEntry failed\n");
    }
    return 0;
  }
  *((void *)this + 8) = v6;
  if (!v6) {
    goto LABEL_9;
  }
  CCTap::initWithRegistryEntry((CCTap *)this, (io_object_t)a2);
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, @"LogDataType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v8 = CFProperty;
    int Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, this + 26);
    BOOL v10 = Value != 0;
    if (Value)
    {
LABEL_25:
      CFRelease(v8);
      return v10;
    }
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      CFIndex v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      CFIndex v12 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "(CCLogTap) CFNumberGetValue failed\n", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v19;
      long long v30 = v19;
      long long v27 = v19;
      long long v28 = v19;
      long long v25 = v19;
      long long v26 = v19;
      *(_OWORD *)buf = v19;
      long long v24 = v19;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "(CCLogTap) CFNumberGetValue failed\n");
    }
    goto LABEL_25;
  }
  uint64_t v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    CFIndex v17 = v16;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    CFIndex v17 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "(CCLogTap) IORegistryEntryCreateCFProperty failed\n", buf, 2u);
LABEL_20:
  if (glog_fd)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v18;
    long long v30 = v18;
    long long v27 = v18;
    long long v28 = v18;
    long long v25 = v18;
    long long v26 = v18;
    *(_OWORD *)buf = v18;
    long long v24 = v18;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "(CCLogTap) IORegistryEntryCreateCFProperty failed\n");
  }
  return 0;
}

CCLogFile *CCFile::withRegistryEntry(CCFile *this)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = this;
    uint64_t v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = this;
    uint64_t v3 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCFile::withRegistryEntry() entered entry:%u\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v4;
    long long v21 = v4;
    long long v18 = v4;
    long long v19 = v4;
    long long v16 = v4;
    long long v17 = v4;
    *(_OWORD *)buf = v4;
    long long v15 = v4;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::withRegistryEntry() entered entry:%u\n", this);
  }
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"LogType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  unsigned int v6 = valuePtr;
  if (valuePtr < 2) {
    return CCLogFile::withRegistryEntry(this);
  }
  if (valuePtr == 2) {
    return CCDataFile::withRegistryEntry(this);
  }
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      CFAllocatorRef v9 = v8;
LABEL_23:
      _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCFile::withTap Unsupported file type(%d) \n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    CFAllocatorRef v9 = &_os_log_internal;
    goto LABEL_23;
  }
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v10;
    long long v21 = v10;
    long long v18 = v10;
    long long v19 = v10;
    long long v16 = v10;
    long long v17 = v10;
    *(_OWORD *)buf = v10;
    long long v15 = v10;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::withTap Unsupported file type(%d) \n", valuePtr);
  }
  return 0;
}

uint64_t CCXPCService::initWithConfigureAndPipeMonitor(CCXPCService *this, CCConfigure *a2, CCPipeMonitor *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *((void *)this + 2) = a2;
  (*(void (**)(CCConfigure *))(*(void *)a2 + 40))(a2);
  *((void *)this + 3) = a3;
  (*(void (**)(CCPipeMonitor *))(*(void *)a3 + 40))(a3);
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((unsigned char *)this + 48) = 0;
  int v5 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 56), 0);
  if (!v5)
  {
    CCXPCService::startXPCService(this);
    return 1;
  }
  int v6 = v5;
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    uint64_t v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    uint64_t v8 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v8, OS_LOG_TYPE_ERROR, "CCXPCService::initWithConfigureAndPipeMonitor ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v9;
    long long v20 = v9;
    long long v17 = v9;
    long long v18 = v9;
    long long v15 = v9;
    long long v16 = v9;
    *(_OWORD *)buf = v9;
    long long v14 = v9;
    memset(&v12, 0, sizeof(v12));
    time_t v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCXPCService::initWithConfigureAndPipeMonitor ERROR INIT MUTEX: %d\n", v6);
  }
  return 1;
}

uint64_t CCFormatter::registerWriteCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a2;
  return result;
}

BOOL CCProfileMonitor::initWithConfigure(CCProfileMonitor *this, CCConfigure *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v4 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        uint64_t v7 = v6;
LABEL_14:
        _os_log_error_impl(&dword_209928000, v7, OS_LOG_TYPE_ERROR, "CCProfileMonitor::initWithConfigure ERROR INIT MUTEX: %d\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      uint64_t v7 = &_os_log_internal;
      goto LABEL_14;
    }
    if (glog_fd)
    {
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v10;
      long long v22 = v10;
      long long v19 = v10;
      long long v20 = v10;
      long long v17 = v10;
      long long v18 = v10;
      *(_OWORD *)buf = v10;
      long long v16 = v10;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::initWithConfigure ERROR INIT MUTEX: %d\n", v5);
    }
    return 0;
  }
  *((void *)this + 11) = a2;
  (*(void (**)(CCConfigure *))(*(void *)a2 + 40))(a2);
  CCProfileMonitor::setStreamEventHandler(this);
  BOOL v8 = CCProfileMonitor::initializeProfilePort(this);
  if (!v8) {
    CCProfileMonitor::freeResources(this);
  }
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN16CCProfileMonitor17initWithConfigureEP11CCConfigure_block_invoke;
  block[3] = &__block_descriptor_tmp_1284;
  block[4] = this;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
  return v8;
}

uint64_t CCFile::_doWrite(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 184))();
}

void CCLogFile::deleteFile(CCLogFile *this, __CFString *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a2) {
    return;
  }
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = CFStringGetCStringPtr(a2, 0);
      int v4 = v3;
LABEL_7:
      _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "CCLogFile::deleteFile name: %s \n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CFStringGetCStringPtr(a2, 0);
    int v4 = &_os_log_internal;
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v5;
    long long v20 = v5;
    long long v17 = v5;
    long long v18 = v5;
    long long v15 = v5;
    long long v16 = v5;
    *(_OWORD *)buf = v5;
    long long v14 = v5;
    memset(&v12, 0, sizeof(v12));
    time_t v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v6 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    dprintf(v6, "CCLogFile::deleteFile name: %s \n", CStringPtr);
  }
  CFIndex Length = CFStringGetLength(a2);
  dispatch_time_t v9 = (char *)malloc_type_malloc(Length + 1, 0xB9AD6B70uLL);
  CFIndex v10 = CFStringGetLength(a2);
  CFStringGetCString(a2, v9, v10 + 1, 0);
  unlink(v9);
  if (v9) {
    free(v9);
  }
  CFRelease(a2);
}

uint64_t CCIOReportDumpQueue::ccfree(CCIOReportDumpQueue *this)
{
  CCIOReportDumpQueue::stopProcessorThread(this);
  while (1)
  {
    uint64_t v2 = CCIOReportDumpQueue::dequeue(this);
    if (!v2) {
      break;
    }
    uint64_t v3 = v2;
    IOObjectRelease(*(_DWORD *)(v2 + 512));
    MEMORY[0x2105075B0](v3, 0x1020C404FABDE88);
  }
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 104));
  uint64_t result = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 40));
  if (this)
  {
    long long v5 = *(uint64_t (**)(CCIOReportDumpQueue *))(*(void *)this + 8);
    return v5(this);
  }
  return result;
}

uint64_t CCIOReporterFormatter::writeFileHeader(CCIOReporterFormatter *this)
{
  CCIOReporterFormatter::refreshSubscriptionsFromStreamRegistry(this);
  *((_DWORD *)this + 46) = 0;
  uint64_t v2 = *(uint64_t (**)(CCIOReporterFormatter *, const char *, uint64_t))(*(void *)this + 112);

  return v2(this, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<array>\n", 172);
}

uint64_t CCIOReporterFormatter::ccfree(CCIOReporterFormatter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 6);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 6) = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 5);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 5) = 0;
  }

  return CCFormatter::ccfree(this);
}

uint64_t CCLogFile::buildFileTables(CFStringRef *this)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 512, this[6]);
  int v4 = (pthread_mutex_t *)(this + 20);
  pthread_mutex_lock((pthread_mutex_t *)(this + 20));
  CFIndex Length = CFStringGetLength(MutableCopy);
  int v6 = (char *)malloc_type_malloc(Length + 1, 0x51BD4FB3uLL);
  if (!v6)
  {
    uint64_t v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      long long v36 = v35;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      long long v36 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_60:
    if (glog_fd) {
      goto LABEL_75;
    }
    goto LABEL_81;
  }
  uint64_t v7 = v6;
  CFIndex v8 = CFStringGetLength(MutableCopy);
  if (!CFStringGetCString(MutableCopy, v7, v8 + 1, 0))
  {
    uint64_t v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "buildFileTables";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 183;
        long long v38 = v37;
LABEL_87:
        _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 183;
      long long v38 = &_os_log_internal;
      goto LABEL_87;
    }
    if (glog_fd)
    {
      *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v57 = v45;
      long long v58 = v45;
      long long v55 = v45;
      long long v56 = v45;
      long long v53 = v45;
      long long v54 = v45;
      *(_OWORD *)buf = v45;
      *(_OWORD *)&uint8_t buf[16] = v45;
      memset(&v51, 0, sizeof(v51));
      time_t v50 = 0xAAAAAAAAAAAAAAAALL;
      time(&v50);
      localtime_r(&v50, &v51);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n", "buildFileTables", 183);
    }
    long long v46 = v7;
    goto LABEL_80;
  }
  dispatch_time_t v9 = opendir(v7);
  free(v7);
  unsigned int v10 = 0;
  if (v9)
  {
    while (1)
    {
      time_t v11 = readdir(v9);
      if (!v11) {
        break;
      }
      if (v11->d_name[0] != 46) {
        ++v10;
      }
    }
    closedir(v9);
  }
  unsigned int v12 = *((_DWORD *)this + 30);
  if (v12 <= v10) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v12;
  }
  *((_DWORD *)this + 32) = v13;
  if (!v13)
  {
    uint64_t v39 = coreCaptureOsLog;
    if (!coreCaptureOsLog)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_WORD *)buf = 0;
      tm v40 = &_os_log_internal;
      goto LABEL_70;
    }
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_WORD *)buf = 0;
    goto LABEL_52;
  }
  CFStringRef v14 = (const __CFString *)malloc_type_calloc(v13, 8uLL, 0x2004093837F09uLL);
  this[17] = v14;
  if (!v14)
  {
    uint64_t v39 = coreCaptureOsLog;
    if (!coreCaptureOsLog)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_WORD *)buf = 0;
      tm v40 = &_os_log_internal;
LABEL_70:
      _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "CCLogFile::buildFileTables fNumberOfArrayEntries is zero\n", buf, 2u);
LABEL_71:
      if (glog_fd)
      {
        *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v57 = v47;
        long long v58 = v47;
        long long v55 = v47;
        long long v56 = v47;
        long long v53 = v47;
        long long v54 = v47;
        *(_OWORD *)buf = v47;
        *(_OWORD *)&uint8_t buf[16] = v47;
        memset(&v51, 0, sizeof(v51));
        time_t v50 = 0xAAAAAAAAAAAAAAAALL;
        time(&v50);
        localtime_r(&v50, &v51);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogFile::buildFileTables fNumberOfArrayEntries is zero\n");
      }
      goto LABEL_81;
    }
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_WORD *)buf = 0;
LABEL_52:
    tm v40 = v39;
    goto LABEL_70;
  }
  *((_DWORD *)this + 36) = 0;
  CFIndex v15 = CFStringGetLength(MutableCopy);
  long long v16 = (char *)malloc_type_malloc(v15 + 1, 0x508D7C94uLL);
  if (v16)
  {
    long long v17 = v16;
    CFIndex v18 = CFStringGetLength(MutableCopy);
    if (CFStringGetCString(MutableCopy, v17, v18 + 1, 0))
    {
      long long v19 = opendir(v17);
      free(v17);
      if (v19)
      {
        while (1)
        {
          uint64_t v21 = readdir(v19);
          if (!v21) {
            break;
          }
          d_name = v21->d_name;
          if (v21->d_name[0] != 46)
          {
            uint64_t v23 = CFStringCreateMutableCopy(v2, 512, MutableCopy);
            if (v23)
            {
              long long v24 = v23;
              CFStringAppendCString(v23, "/", 0);
              CFStringAppendCString(v24, d_name, 0);
              CFStringRef v25 = this[17];
              uint64_t v26 = *((unsigned int *)this + 36);
              *((_DWORD *)this + 36) = v26 + 1;
              *((void *)&v25->isa + v26) = v24;
            }
          }
        }
        long long v20 = (__CFString *)closedir(v19);
      }
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
      if (v10 >= 2) {
        long long v20 = (__CFString *)CCLogFile::sortByFileName((const __CFString *)this, v10);
      }
      unsigned int v27 = *((_DWORD *)this + 30);
      unint64_t v28 = v10 - v27;
      if (v10 > v27)
      {
        uint64_t v29 = 0;
        do
        {
          CCLogFile::deleteFile((CCLogFile *)v20, *((__CFString **)&this[17]->isa + v29));
          *((void *)&this[17]->isa + v29++) = 0;
        }
        while (v28 != v29);
        if (v28 < v10)
        {
          unsigned int v30 = 0;
          unint64_t v31 = *((unsigned int *)this + 30);
          do
          {
            *((void *)&this[17]->isa + v30) = *((void *)&this[17]->isa + v28);
            if (v28 >= v31) {
              *((void *)&this[17]->isa + v28) = 0;
            }
            ++v28;
            ++v30;
          }
          while (v10 != v28);
        }
      }
      if (*((_DWORD *)this + 28))
      {
        unsigned int v32 = 0;
      }
      else
      {
        unsigned int v33 = *((_DWORD *)this + 30);
        if (v10 >= v33) {
          unsigned int v32 = v33 - 1;
        }
        else {
          unsigned int v32 = v10;
        }
      }
      *((_DWORD *)this + 36) = v32;
      pthread_mutex_unlock((pthread_mutex_t *)(this + 20));
      return 1;
    }
    uint64_t v43 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "buildFileTables";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 212;
        long long v44 = v43;
LABEL_91:
        _os_log_error_impl(&dword_209928000, v44, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 212;
      long long v44 = &_os_log_internal;
      goto LABEL_91;
    }
    if (glog_fd)
    {
      *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v57 = v49;
      long long v58 = v49;
      long long v55 = v49;
      long long v56 = v49;
      long long v53 = v49;
      long long v54 = v49;
      *(_OWORD *)buf = v49;
      *(_OWORD *)&uint8_t buf[16] = v49;
      memset(&v51, 0, sizeof(v51));
      time_t v50 = 0xAAAAAAAAAAAAAAAALL;
      time(&v50);
      localtime_r(&v50, &v51);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n", "buildFileTables", 212);
    }
    long long v46 = v17;
LABEL_80:
    free(v46);
    goto LABEL_81;
  }
  uint64_t v41 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "buildFileTables";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 209;
    long long v42 = v41;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "buildFileTables";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 209;
    long long v42 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v42, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_74:
  if (glog_fd)
  {
LABEL_75:
    *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v57 = v48;
    long long v58 = v48;
    long long v55 = v48;
    long long v56 = v48;
    long long v53 = v48;
    long long v54 = v48;
    *(_OWORD *)buf = v48;
    *(_OWORD *)&uint8_t buf[16] = v48;
    memset(&v51, 0, sizeof(v51));
    time_t v50 = 0xAAAAAAAAAAAAAAAALL;
    time(&v50);
    localtime_r(&v50, &v51);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%06u: Allocation failure\n");
  }
LABEL_81:
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  pthread_mutex_unlock(v4);
  return 0;
}

void CCDaemon::~CCDaemon(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t CCFormatter::doWrite(CCFormatter *this, void *a2)
{
  if (*((void *)this + 3) && (CFAllocatorRef v2 = (uint64_t (*)(void))*((void *)this + 2)) != 0) {
    return v2();
  }
  else {
    return 0;
  }
}

uint64_t CCLogFile::ccfree(CCLogFile *this)
{
  CCLogFile::freeResources(this);
  uint64_t result = CCFile::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCLogFile *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

void CCObject::retain(CCObject *this)
{
  do
  {
    int v1 = *((_DWORD *)this + 2);
    int v2 = v1;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)this + 2, (unsigned int *)&v2, v1 + 1, memory_order_relaxed, memory_order_relaxed);
  }
  while (v2 != v1);
}

atomic_uint *CCObject::release(atomic_uint *this)
{
  do
  {
    atomic_uint v1 = this[2];
    atomic_uint v2 = v1;
    atomic_compare_exchange_strong_explicit(this + 2, (unsigned int *)&v2, v1 - 1, memory_order_relaxed, memory_order_relaxed);
  }
  while (v2 != v1);
  if (v1 == 1) {
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)this + 24))();
  }
  return this;
}

uint64_t CCLogTap::isActive(CCLogTap *this, CFAbsoluteTime a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 4), @"LogPolicy", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  int valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (valuePtr != 1)
  {
    if (*((unsigned char *)this + 345))
    {
      uint64_t v8 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        int v9 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        unsigned int v10 = v8;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        int v16 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v16;
        unsigned int v10 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive tap is fBusy Active 2 entry:%u\n", buf, 8u);
LABEL_23:
      if (glog_fd)
      {
        *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v29 = v17;
        long long v30 = v17;
        long long v27 = v17;
        long long v28 = v17;
        long long v25 = v17;
        long long v26 = v17;
        *(_OWORD *)buf = v17;
        *(_OWORD *)&uint8_t buf[16] = v17;
        memset(&v22, 0, sizeof(v22));
        time_t v21 = 0xAAAAAAAAAAAAAAAALL;
        time(&v21);
        localtime_r(&v21, &v22);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogTap::isActive tap is fBusy Active 2 entry:%u\n");
      }
      return 1;
    }
    if (CFAbsoluteTimeGetCurrent() - *((double *)this + 44) >= a2) {
      return 0;
    }
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v14 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      CFIndex v15 = v13;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v19 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v19;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      CFIndex v15 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v15, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive idle < duration  3 entry:%u duration:%f\n", buf, 0x12u);
LABEL_29:
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v20;
      long long v30 = v20;
      long long v27 = v20;
      long long v28 = v20;
      long long v25 = v20;
      long long v26 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&uint8_t buf[16] = v20;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogTap::isActive idle < duration  3 entry:%u duration:%f\n");
    }
    return 1;
  }
  uint64_t v5 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v6 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v6;
    uint64_t v7 = v5;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v11 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v11;
    uint64_t v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive policy is %d entry:%u\n", buf, 0xEu);
LABEL_14:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v12;
    long long v30 = v12;
    long long v27 = v12;
    long long v28 = v12;
    long long v25 = v12;
    long long v26 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::isActive policy is %d entry:%u\n");
  }
  return 1;
}

void CCLogTap::~CCLogTap(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t CCTap::runDrainThread(CCTap *this, void *a2)
{
  return 0;
}

uint64_t CCConfigure::ccfree(CCConfigure *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
    *((void *)this + 2) = 0;
  }
  uint64_t v3 = *(uint64_t (**)(CCConfigure *))(*(void *)this + 8);

  return v3(this);
}

void CCLogFile::fileDidOpen(CCLogFile *this, unint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2 <= 0x5000000 && (*((_DWORD *)this + 31) & 1) == 0)
  {
    size_t v4 = a2 + 2048;
    ftruncate(*((_DWORD *)this + 9), a2 + 2048);
    uint64_t v5 = mmap(0, v4, 2, 1, *((_DWORD *)this + 9), 0);
    *((void *)this + 157) = v5;
    if (v5 != (void *)-1)
    {
LABEL_15:
      *((void *)this + 159) = 0;
      *((void *)this + 158) = v4;
      return;
    }
    *((void *)this + 157) = 0;
    uint64_t v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "fileDidOpen";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 47;
      uint64_t v7 = v6;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "fileDidOpen";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 47;
      uint64_t v7 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: mmap failed\n", buf, 0x12u);
LABEL_13:
    if (glog_fd)
    {
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v16 = v8;
      long long v17 = v8;
      long long v14 = v8;
      long long v15 = v8;
      long long v12 = v8;
      long long v13 = v8;
      *(_OWORD *)buf = v8;
      *(_OWORD *)&uint8_t buf[16] = v8;
      memset(&v10, 0, sizeof(v10));
      time_t v9 = 0xAAAAAAAAAAAAAAAALL;
      time(&v9);
      localtime_r(&v9, &v10);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d: mmap failed\n", "fileDidOpen", 47);
    }
    goto LABEL_15;
  }
}

void CCPipeMonitor::ccfree(CCPipeMonitor *this)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Entered\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v4;
    long long v43 = v4;
    long long v40 = v4;
    long long v41 = v4;
    long long v38 = v4;
    long long v39 = v4;
    *(_OWORD *)buf = v4;
    long long v37 = v4;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Entered\n");
  }
  if (pthread_mutex_lock((pthread_mutex_t *)((char *)this + 80)))
  {
    uint64_t v5 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v6 = v5;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v6 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Failed to acquire lock\n", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v42 = v13;
      long long v43 = v13;
      long long v40 = v13;
      long long v41 = v13;
      long long v38 = v13;
      long long v39 = v13;
      *(_OWORD *)buf = v13;
      long long v37 = v13;
      memset(&v35, 0, sizeof(v35));
      time_t v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::ccfree Failed to acquire lock\n");
    }
    return;
  }
  uint64_t v7 = *((void *)this + 9);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 48))(v7);
    *((void *)this + 9) = 0;
  }
  CCPipeMonitor::stopPipeMonitor(this);
  uint64_t v8 = *((void *)this + 8);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
    *((void *)this + 8) = 0;
  }
  int v9 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 80));
  if (v9)
  {
    int v10 = v9;
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      long long v12 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to unlock. Error[%d]\n", buf, 8u);
LABEL_29:
    if (glog_fd)
    {
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v42 = v14;
      long long v43 = v14;
      long long v40 = v14;
      long long v41 = v14;
      long long v38 = v14;
      long long v39 = v14;
      *(_OWORD *)buf = v14;
      long long v37 = v14;
      memset(&v35, 0, sizeof(v35));
      time_t v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to unlock. Error[%d]\n", v10);
    }
  }
  int v15 = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 80));
  if (!v15) {
    goto LABEL_40;
  }
  int v16 = v15;
  uint64_t v17 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    uint64_t v18 = v17;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    uint64_t v18 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to destroy lock. Error[%d]\n", buf, 8u);
LABEL_38:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v19;
    long long v43 = v19;
    long long v40 = v19;
    long long v41 = v19;
    long long v38 = v19;
    long long v39 = v19;
    *(_OWORD *)buf = v19;
    long long v37 = v19;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to destroy lock. Error[%d]\n", v16);
  }
LABEL_40:
  int v20 = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 144));
  if (!v20) {
    goto LABEL_49;
  }
  int v21 = v20;
  uint64_t v22 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    uint64_t v23 = v22;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    uint64_t v23 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to destroy fMutex lock. Error[%d]\n", buf, 8u);
LABEL_47:
  if (glog_fd)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v24;
    long long v43 = v24;
    long long v40 = v24;
    long long v41 = v24;
    long long v38 = v24;
    long long v39 = v24;
    *(_OWORD *)buf = v24;
    long long v37 = v24;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to destroy fMutex lock. Error[%d]\n", v21);
  }
LABEL_49:
  uint64_t v25 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    long long v26 = v25;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    long long v26 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v26, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Exit - Destroyed lock\n", buf, 2u);
LABEL_55:
  if (glog_fd)
  {
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v27;
    long long v43 = v27;
    long long v40 = v27;
    long long v41 = v27;
    long long v38 = v27;
    long long v39 = v27;
    *(_OWORD *)buf = v27;
    long long v37 = v27;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Exit - Destroyed lock\n");
  }
  uint64_t v28 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    long long v29 = v28;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    long long v29 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v29, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::ccfree()\n", buf, 2u);
LABEL_63:
  if (glog_fd)
  {
    *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v30;
    long long v43 = v30;
    long long v40 = v30;
    long long v41 = v30;
    long long v38 = v30;
    long long v39 = v30;
    *(_OWORD *)buf = v30;
    long long v37 = v30;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCServiceMonitor::ccfree()\n");
  }
  CCServiceMonitor::freeresources(this);
  (*(void (**)(CCPipeMonitor *))(*(void *)this + 8))(this);
  if (glog_fd)
  {
    close(glog_fd);
    glog_fd = 0;
  }
  uint64_t v31 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    unsigned int v32 = v31;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_73;
    }
    *(_WORD *)buf = 0;
    unsigned int v32 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v32, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Exit\n", buf, 2u);
LABEL_73:
  if (glog_fd)
  {
    *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v33;
    long long v43 = v33;
    long long v40 = v33;
    long long v41 = v33;
    long long v38 = v33;
    long long v39 = v33;
    *(_OWORD *)buf = v33;
    long long v37 = v33;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Exit\n");
  }
}

uint64_t CCLogFile::closeFile(CCLogFile *this)
{
  *((_DWORD *)this + 9) = -1;
  return 1;
}

uint64_t CCFormatter::writeFileFooter(CCFormatter *this)
{
  return 0;
}

uint64_t CCFile::ccfree(CCFile *this)
{
  uint64_t result = CCFile::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCFile *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

CCLogFile *CCLogFile::fileWillClose(CCLogFile *this)
{
  if (*((void *)this + 157)) {
    return (CCLogFile *)CCLogFile::closeMMAP(this);
  }
  return this;
}

void CCDataPipeInterface::~CCDataPipeInterface(void *this)
{
  if (this) {
    free(this);
  }
}

uint64_t CCLogFile::freeResources(CCLogFile *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 160);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  CCLogFile::freeFilePathArray(this);
  pthread_mutex_unlock(v2);

  return pthread_mutex_destroy(v2);
}

ssize_t CCLogFile::doWrite(CCLogFile *this, void *__buf, size_t __nbyte)
{
  ssize_t v3 = __nbyte;
  if (!__nbyte) {
    return v3;
  }
  uint64_t v6 = *((void *)this + 157);
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = *((void *)this + 159);
  if (v7 + __nbyte >= *((void *)this + 158))
  {
    CCLogFile::closeMMAP(this);
    *((unsigned char *)this + 1248) = 1;
LABEL_6:
    ssize_t v3 = write(*((_DWORD *)this + 9), __buf, v3);
    goto LABEL_7;
  }
  memcpy((void *)(v6 + v7), __buf, __nbyte);
  *((void *)this + 159) += v3;
LABEL_7:
  uint64_t v8 = *((void *)this + 19);
  if (v3 >= 1)
  {
    v8 += v3;
    *((void *)this + 19) = v8;
  }
  if (v8 > *((unsigned int *)this + 29)) {
    *((unsigned char *)this + 1248) = 1;
  }
  return v3;
}

uint64_t CCTap::isActive(CCTap *this, double a2)
{
  return 0;
}

uint64_t CCDaemon::ccfree(CCDaemon *this)
{
  uint64_t result = CCDaemon::freeResources(this);
  if (this)
  {
    ssize_t v3 = *(uint64_t (**)(CCDaemon *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

void CCProfileMonitor::profileCallback(CCProfileMonitor *this, int a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  CFDataRef resourceData = 0;
  if (shutDownPending)
  {
    uint64_t v2 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      ssize_t v3 = v2;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      ssize_t v3 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback during shutdown (1) \n", buf, 2u);
LABEL_10:
    if (glog_fd)
    {
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v45 = v8;
      long long v46 = v8;
      long long v43 = v8;
      long long v44 = v8;
      long long v41 = v8;
      long long v42 = v8;
      *(_OWORD *)buf = v8;
      long long v40 = v8;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback during shutdown (1) \n");
    }
    return;
  }
  *((unsigned char *)this + 104) = 1;
  uint64_t v6 = (pthread_mutex_t *)((char *)this + 16);
  if (!pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16)))
  {
    CFURLRef v9 = CFURLCreateWithString(0, @"file:///private/var/Managed%20Preferences/mobile/com.apple.corecapture.configure.plist", 0);
    uint64_t v10 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a2;
      uint64_t v11 = v10;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a2;
      uint64_t v11 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v11, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Entered token:%d\n", buf, 8u);
LABEL_18:
    if (glog_fd)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v45 = v12;
      long long v46 = v12;
      long long v43 = v12;
      long long v44 = v12;
      long long v41 = v12;
      long long v42 = v12;
      *(_OWORD *)buf = v12;
      long long v40 = v12;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback Entered token:%d\n", a2);
    }
    if (shutDownPending)
    {
      uint64_t v13 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        long long v14 = v13;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        long long v14 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v14, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback during shutdown (2) \n", buf, 2u);
LABEL_32:
      if (glog_fd)
      {
        *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v45 = v18;
        long long v46 = v18;
        long long v43 = v18;
        long long v44 = v18;
        long long v41 = v18;
        long long v42 = v18;
        *(_OWORD *)buf = v18;
        long long v40 = v18;
        memset(&v37, 0, sizeof(v37));
        time_t v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback during shutdown (2) \n");
      }
LABEL_34:
      uint64_t v7 = 0;
      goto LABEL_35;
    }
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CFURLCreateDataAndPropertiesFromResource((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, &resourceData, 0, 0, 0))
    {
      if (CCProfileMonitor::fProfileLoaded)
      {
        uint64_t v16 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_56;
          }
          *(_WORD *)buf = 0;
          uint64_t v17 = v16;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_56;
          }
          *(_WORD *)buf = 0;
          uint64_t v17 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback fProfileLoaded is true\n", buf, 2u);
LABEL_56:
        if (glog_fd)
        {
          *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v45 = v27;
          long long v46 = v27;
          long long v43 = v27;
          long long v44 = v27;
          long long v41 = v27;
          long long v42 = v27;
          *(_OWORD *)buf = v27;
          long long v40 = v27;
          memset(&v37, 0, sizeof(v37));
          time_t v36 = 0xAAAAAAAAAAAAAAAALL;
          time(&v36);
          localtime_r(&v36, &v37);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCProfileMonitor::profileCallback fProfileLoaded is true\n");
        }
        goto LABEL_34;
      }
      CFPropertyListRef v22 = CFPropertyListCreateWithData(v15, resourceData, 0, 0, 0);
      uint64_t v7 = v22;
      if (!v22
        || !CFPropertyListIsValid(v22, kCFPropertyListXMLFormat_v1_0)
        || (CFTypeID v23 = CFGetTypeID(v7), v23 != CFDictionaryGetTypeID()))
      {
LABEL_35:
        pthread_mutex_unlock(v6);
        if (v9) {
          CFRelease(v9);
        }
        goto LABEL_37;
      }
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)v7);
      *((void *)this + 12) = Count;
      uint64_t v25 = coreCaptureOsLog;
      if (Count)
      {
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            long long v26 = v25;
LABEL_71:
            _os_log_impl(&dword_209928000, v26, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Loaded \n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          long long v26 = &_os_log_internal;
          goto LABEL_71;
        }
        if (glog_fd)
        {
          *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v45 = v31;
          long long v46 = v31;
          long long v43 = v31;
          long long v44 = v31;
          long long v41 = v31;
          long long v42 = v31;
          *(_OWORD *)buf = v31;
          long long v40 = v31;
          memset(&v37, 0, sizeof(v37));
          time_t v36 = 0xAAAAAAAAAAAAAAAALL;
          time(&v36);
          localtime_r(&v36, &v37);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCProfileMonitor::profileCallback Loaded \n");
        }
        CCPipeMonitor::profileLoaded(*(CFDictionaryRef **)(*((void *)this + 11) + 16));
        *((void *)this + 14) = CFDictionaryCreateCopy(v15, (CFDictionaryRef)v7);
        CCProfileMonitor::applyConfiguration(this, 0, 0);
        CCProfileMonitor::fProfileLoaded = 1;
        *((unsigned char *)this + 105) = 0;
        CFPreferencesFlushCaches();
        goto LABEL_35;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
        long long v30 = v25;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
        long long v30 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v30, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback fProfileLoaded:%d Removed\n", buf, 8u);
LABEL_78:
      if (glog_fd)
      {
        *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v45 = v32;
        long long v46 = v32;
        long long v43 = v32;
        long long v44 = v32;
        long long v41 = v32;
        long long v42 = v32;
        *(_OWORD *)buf = v32;
        long long v40 = v32;
        memset(&v37, 0, sizeof(v37));
        time_t v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback fProfileLoaded:%d Removed\n", CCProfileMonitor::fProfileLoaded);
      }
      uint64_t v33 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        time_t v34 = v33;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        time_t v34 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v34, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Removed\n", buf, 2u);
LABEL_86:
      if (glog_fd)
      {
        *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v45 = v35;
        long long v46 = v35;
        long long v43 = v35;
        long long v44 = v35;
        long long v41 = v35;
        long long v42 = v35;
        *(_OWORD *)buf = v35;
        long long v40 = v35;
        memset(&v37, 0, sizeof(v37));
        time_t v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback Removed\n");
      }
LABEL_64:
      if (!*((unsigned char *)this + 105)) {
        CCProfileMonitor::profileRemoved(this);
      }
      goto LABEL_35;
    }
    uint64_t v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = *((unsigned __int8 *)this + 105);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 183;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = a2;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v40) = CCProfileMonitor::fProfileLoaded;
        WORD2(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 6) = v20;
        int v21 = v19;
LABEL_60:
        _os_log_impl(&dword_209928000, v21, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback:%d removePending token:%d fProfileLoaded:%d fProfileRemoveApplied:%d\n", buf, 0x1Au);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = *((unsigned __int8 *)this + 105);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = 183;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = a2;
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v40) = CCProfileMonitor::fProfileLoaded;
      WORD2(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 6) = v28;
      int v21 = &_os_log_internal;
      goto LABEL_60;
    }
    if (glog_fd)
    {
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v45 = v29;
      long long v46 = v29;
      long long v43 = v29;
      long long v44 = v29;
      long long v41 = v29;
      long long v42 = v29;
      *(_OWORD *)buf = v29;
      long long v40 = v29;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback:%d removePending token:%d fProfileLoaded:%d fProfileRemoveApplied:%d\n", 183, a2, CCProfileMonitor::fProfileLoaded, *((unsigned __int8 *)this + 105));
    }
    uint64_t v7 = 0;
    goto LABEL_64;
  }
  pthread_mutex_unlock(v6);
  uint64_t v7 = 0;
LABEL_37:
  if (resourceData)
  {
    CFRelease(resourceData);
    CFDataRef resourceData = 0;
  }
  if (v7) {
    CFRelease(v7);
  }
  *((unsigned char *)this + 104) = 0;
}

void CCDaemon::shutdown(CCDaemon *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v2 = v1;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v2 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v2, OS_LOG_TYPE_DEFAULT, "CCDaemon::shutdown is fired\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = v3;
    long long v14 = v3;
    long long v11 = v3;
    long long v12 = v3;
    long long v9 = v3;
    long long v10 = v3;
    *(_OWORD *)buf = v3;
    long long v8 = v3;
    memset(&v6, 0, sizeof(v6));
    time_t v5 = 0xAAAAAAAAAAAAAAAALL;
    time(&v5);
    localtime_r(&v5, &v6);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::shutdown is fired\n");
  }
  int v4 = 0;
  atomic_compare_exchange_strong_explicit(&shutDownPending, (unsigned int *)&v4, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v4)
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    pthread_create((pthread_t *)buf, 0, (void *(__cdecl *)(void *))CCDaemon::runShutdownThread, 0);
  }
}

uint64_t CCLogFile::addFile(CCLogFile *this)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 160);
  long long v3 = (CCLogFile *)pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  uint64_t v4 = (*((_DWORD *)this + 36) + 1) % *((_DWORD *)this + 30);
  time_t v5 = *(__CFString **)(*((void *)this + 17) + 8 * v4);
  if (v5)
  {
    CCLogFile::deleteFile(v3, v5);
    *(void *)(*((void *)this + 17) + 8 * v4) = 0;
  }
  if (*((_DWORD *)this + 9) != -1) {
    (*(void (**)(CCLogFile *))(*(void *)this + 88))(this);
  }
  CFIndex Length = CFStringGetLength(*((CFStringRef *)this + 11));
  uint64_t v7 = (char *)malloc_type_malloc(Length + 1, 0x7F3D2BD2uLL);
  CFStringRef v8 = (const __CFString *)*((void *)this + 11);
  CFIndex v9 = CFStringGetLength(v8);
  CFStringGetCString(v8, v7, v9 + 1, 0);
  uint64_t v10 = (*(uint64_t (**)(CCLogFile *, char *))(*(void *)this + 136))(this, v7);
  if (v7) {
    free(v7);
  }
  CFIndex v11 = CFStringGetLength((CFStringRef)v10);
  long long v12 = (std::__fs::filesystem::path *)malloc_type_malloc(v11 + 1, 0x51FC60BDuLL);
  CFIndex v13 = CFStringGetLength((CFStringRef)v10);
  CFStringGetCString((CFStringRef)v10, (char *)v12, v13 + 1, 0);
  uint64_t v14 = isSeedAndiOS();
  if (v14)
  {
    if (deviceUnlockedSinceBoot(v14, v15))
    {
      remove(v12, v16);
      int v17 = open_dprotected_np((const char *)v12, 1538, 3, 0, 420);
      goto LABEL_11;
    }
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      int v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      int v21 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v21, OS_LOG_TYPE_DEFAULT, "CCLogFile::addFile: No log before device first unlocked for PROTECTION_CLASS_C\n", buf, 2u);
LABEL_27:
    if (glog_fd)
    {
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v23;
      long long v34 = v23;
      long long v31 = v23;
      long long v32 = v23;
      long long v29 = v23;
      long long v30 = v23;
      *(_OWORD *)buf = v23;
      long long v28 = v23;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCLogFile::addFile: No log before device first unlocked for PROTECTION_CLASS_C\n");
    }
    goto LABEL_29;
  }
  int v17 = open((const char *)v12, 1538, 420);
LABEL_11:
  *((_DWORD *)this + 9) = v17;
  if (v17 != -1)
  {
    (*(void (**)(CCLogFile *, void))(*(void *)this + 168))(this, *((unsigned int *)this + 29));
    if (v12) {
      free(v12);
    }
    *((unsigned char *)this + 1248) = 0;
    *((void *)this + 19) = 0;
    (*(void (**)(void))(**((void **)this + 2) + 56))(*((void *)this + 2));
    *(void *)(*((void *)this + 17) + 8 * v4) = v10;
    *((_DWORD *)this + 36) = v4;
    uint64_t v10 = 1;
    goto LABEL_33;
  }
  uint64_t v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    uint64_t v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    uint64_t v19 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "CCLogFile::addFile Failed to create %s\n", buf, 0xCu);
LABEL_22:
  if (glog_fd)
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v33 = v22;
    long long v34 = v22;
    long long v31 = v22;
    long long v32 = v22;
    long long v29 = v22;
    long long v30 = v22;
    *(_OWORD *)buf = v22;
    long long v28 = v22;
    memset(&v26, 0, sizeof(v26));
    time_t v25 = 0xAAAAAAAAAAAAAAAALL;
    time(&v25);
    localtime_r(&v25, &v26);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::addFile Failed to create %s\n");
  }
LABEL_29:
  if (v12) {
    free(v12);
  }
  if (v10)
  {
    CFRelease((CFTypeRef)v10);
    uint64_t v10 = 0;
  }
LABEL_33:
  pthread_mutex_unlock(v2);
  return v10;
}

uint64_t CCDataPipeInterface::openUserClient(CCDataPipeInterface *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 22), 1u, 0, 0, 0, 0);
}

void CCProfileMonitor::ccfree(CCProfileMonitor *this)
{
  CCProfileMonitor::freeResources(this);
  if (this)
  {
    uint64_t v2 = *(void (**)(CCProfileMonitor *))(*(void *)this + 8);
    v2(this);
  }
}

__CFString *CCFile::generateFileName(CFStringRef *this, const char *a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  theString = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 512, this[6]);
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v59 = v4;
  long long v60 = v4;
  long long v57 = v4;
  long long v58 = v4;
  long long v55 = v4;
  long long v56 = v4;
  *(_OWORD *)__str = v4;
  long long v54 = v4;
  time_t v20 = 0xAAAAAAAAAAAAAAAALL;
  memset(&v19, 0, sizeof(v19));
  time(&v20);
  localtime_r(&v20, &v19);
  *((_DWORD *)this + 8) = (*((_DWORD *)this + 8) + 1) % 0x3E8u;
  v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v18.__darwin_suseconds_t tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v18, 0);
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v51 = v5;
  long long v52 = v5;
  long long v49 = v5;
  long long v50 = v5;
  long long v47 = v5;
  long long v48 = v5;
  long long v45 = v5;
  long long v46 = v5;
  long long v43 = v5;
  long long v44 = v5;
  long long v41 = v5;
  long long v42 = v5;
  long long v39 = v5;
  long long v40 = v5;
  long long v37 = v5;
  long long v38 = v5;
  long long v35 = v5;
  long long v36 = v5;
  long long v33 = v5;
  long long v34 = v5;
  long long v31 = v5;
  long long v32 = v5;
  long long v29 = v5;
  long long v30 = v5;
  long long v27 = v5;
  long long v28 = v5;
  long long v25 = v5;
  long long v26 = v5;
  long long v23 = v5;
  long long v24 = v5;
  *(_OWORD *)buffer = v5;
  long long v22 = v5;
  CFStringGetCString(this[11], buffer, 512, 0);
  int v6 = v19.tm_year + 1900;
  int v7 = v19.tm_mon + 1;
  int tm_hour = v19.tm_hour;
  int tm_mday = v19.tm_mday;
  int tm_sec = v19.tm_sec;
  int tm_min = v19.tm_min;
  __darwin_suseconds_t tv_usec = v18.tv_usec;
  int v13 = *((_DWORD *)this + 8);
  uint64_t v14 = (const char *)(*((uint64_t (**)(CFStringRef))this[2]->isa + 11))(this[2]);
  snprintf(__str, 0x80uLL, "[%04d-%02d-%02d_%02d,%02d,%02d.%06u]-%s-%03d.%s", v6, v7, tm_mday, tm_hour, tm_min, tm_sec, tv_usec, buffer, v13, v14);
  CFStringRef v15 = this[5];
  if (v15)
  {
    CFRelease(v15);
    this[5] = 0;
  }
  this[5] = CFStringCreateWithCString(v3, __str, 0);
  CFStringAppendCString(theString, __str, 0);
  return theString;
}

uint64_t CCConfigure::initWithPipeMonitor(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  (*(void (**)(uint64_t))(*(void *)a2 + 40))(a2);
  return 1;
}

void CCConfigure::~CCConfigure(void *this)
{
  if (this) {
    free(this);
  }
}

void CCConfigure::CCConfigure(CCConfigure *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71478;
}

{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71478;
}

void *CCConfigure::withPipeMonitor(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x18uLL, 0xEE9A6C17uLL);
  v2[1] = 1;
  *uint64_t v2 = &unk_26BD71478;
  v2[2] = a1;
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  return v2;
}

BOOL CCConfigure::configure(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0xAAAAAAAAAAAAAA01;
  uint64_t v6 = a1;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v9 = a3;
  uint64_t v10 = a4;
  uint64_t v11 = 0;
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  if (a5) {
    long long v12 = *a5;
  }
  else {
    long long v12 = 0uLL;
  }
  return CCConfigure::applyConfiguration(a1, a2, (char *)&v6);
}

BOOL CCConfigure::applyConfiguration(uint64_t a1, CFTypeRef cf, char *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v6 != TypeID)
  {
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_WORD *)buf = 0;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_WORD *)buf = 0;
      long long v12 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "CCConfigure::applyConfiguration Configuration type is not directory\n", buf, 2u);
LABEL_53:
    if (glog_fd)
    {
      *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v47 = v34;
      long long v48 = v34;
      long long v45 = v34;
      long long v46 = v34;
      long long v43 = v34;
      long long v44 = v34;
      *(_OWORD *)buf = v34;
      long long v42 = v34;
      memset(&v40, 0, sizeof(v40));
      time_t v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::applyConfiguration Configuration type is not directory\n");
    }
    return v6 == TypeID;
  }
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)cf);
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = Count;
    uint64_t v10 = v9;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = Count;
    uint64_t v10 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::configure keycount : %ld\n", buf, 0xCu);
LABEL_11:
  if (glog_fd)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v47 = v13;
    long long v48 = v13;
    long long v45 = v13;
    long long v46 = v13;
    long long v43 = v13;
    long long v44 = v13;
    *(_OWORD *)buf = v13;
    long long v42 = v13;
    memset(&v40, 0, sizeof(v40));
    time_t v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::configure keycount : %ld\n", Count);
  }
  if (Count)
  {
    CFTypeID v38 = v6;
    uint64_t v14 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFStringRef v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)cf, v14, v15);
    long long v36 = v14;
    long long v37 = v15;
    if (Count >= 1)
    {
      while (1)
      {
        *(void *)a3 = a1;
        *(_OWORD *)(a3 + 8) = 0u;
        *(_OWORD *)(a3 + 24) = 0u;
        a3[80] = 1;
        uint64_t v16 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          CStringPtr = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = CStringPtr;
          timeval v18 = v16;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          tm v19 = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v19;
          timeval v18 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "CCConfigure::configure key is %s\n", buf, 0xCu);
LABEL_21:
        if (glog_fd)
        {
          *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v47 = v20;
          long long v48 = v20;
          long long v45 = v20;
          long long v46 = v20;
          long long v43 = v20;
          long long v44 = v20;
          *(_OWORD *)buf = v20;
          long long v42 = v20;
          memset(&v40, 0, sizeof(v40));
          time_t v39 = 0xAAAAAAAAAAAAAAAALL;
          time(&v39);
          localtime_r(&v39, &v40);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
          dprintf(glog_fd, "%s ", (const char *)buf);
          int v21 = glog_fd;
          long long v22 = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          dprintf(v21, "CCConfigure::configure key is %s\n", v22);
        }
        long long v23 = *v14;
        CFTypeID v24 = CFStringGetTypeID();
        if (!validCFObjectReference("CCConfigure::applyConfiguration", v23, v24)) {
          goto LABEL_56;
        }
        long long v25 = *v15;
        CFTypeID v26 = CFDictionaryGetTypeID();
        if (!validCFObjectReference("CCConfigure::applyConfiguration", v25, v26)) {
          goto LABEL_56;
        }
        if (CFEqual((CFStringRef)*v14, @"CCConfigureStream")) {
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::streamOwnerCFDictionaryApplier, a3);
        }
        if (CFEqual((CFStringRef)*v14, @"CCConfigurePipe")) {
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::pipeOwnerCFDictionaryApplier, a3);
        }
        if (CFEqual((CFStringRef)*v14, @"CCCaptureDirectory")) {
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::captureDictionaryCFDictionaryApplier, a3);
        }
        if (CFEqual((CFStringRef)*v14, @"CCStart"))
        {
          uint64_t v27 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              long long v28 = v27;
              goto LABEL_37;
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            long long v28 = &_os_log_internal;
LABEL_37:
            _os_log_impl(&dword_209928000, v28, OS_LOG_TYPE_DEFAULT, "CCConfigure::applyConfiguration CCSTART key \n", buf, 2u);
          }
          if (glog_fd)
          {
            *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v47 = v29;
            long long v48 = v29;
            long long v45 = v29;
            long long v46 = v29;
            long long v43 = v29;
            long long v44 = v29;
            *(_OWORD *)buf = v29;
            long long v42 = v29;
            memset(&v40, 0, sizeof(v40));
            time_t v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCConfigure::applyConfiguration CCSTART key \n");
          }
        }
        if (CFEqual((CFStringRef)*v14, @"CCStop"))
        {
          uint64_t v30 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            long long v31 = (CCDaemon *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
            if (v31)
            {
              *(_WORD *)buf = 0;
              long long v32 = v30;
              goto LABEL_46;
            }
          }
          else
          {
            long long v31 = (CCDaemon *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
            if (v31)
            {
              *(_WORD *)buf = 0;
              long long v32 = &_os_log_internal;
LABEL_46:
              _os_log_impl(&dword_209928000, v32, OS_LOG_TYPE_DEFAULT, "CCConfigure::applyConfiguration CCSTOP key  \n", buf, 2u);
            }
          }
          if (glog_fd)
          {
            *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v47 = v33;
            long long v48 = v33;
            long long v45 = v33;
            long long v46 = v33;
            long long v43 = v33;
            long long v44 = v33;
            *(_OWORD *)buf = v33;
            long long v42 = v33;
            memset(&v40, 0, sizeof(v40));
            time_t v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", (const char *)buf);
            long long v31 = (CCDaemon *)dprintf(glog_fd, "CCConfigure::applyConfiguration CCSTOP key  \n");
          }
          CCDaemon::shutdown(v31);
        }
        ++v15;
        ++v14;
        if (!--Count) {
          goto LABEL_56;
        }
      }
    }
    if (v14) {
LABEL_56:
    }
      free(v36);
    CFTypeID v6 = v38;
    if (v37) {
      free(v37);
    }
  }
  return v6 == TypeID;
}

void CCConfigure::captureDictionaryCFDictionaryApplier(const __CFString *this, const void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::captureDictionaryCFDictionaryApplier", this, TypeID)) {
    return;
  }
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::captureDictionaryCFDictionaryApplier", a2, v8)) {
    return;
  }
  a3[1] = this;
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
      uint64_t v10 = v9;
LABEL_8:
      _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDictionaryCFDictionaryApplier dirName: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
    uint64_t v10 = &_os_log_internal;
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v11;
    long long v23 = v11;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    *(_OWORD *)buf = v11;
    long long v17 = v11;
    memset(&v15, 0, sizeof(v15));
    time_t v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::captureDictionaryCFDictionaryApplier dirName: %s\n", CStringPtr);
  }
  a3[2] = @"*";
  a3[3] = @"*";
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::captureDirectoryCFDictionaryApplier, a3);
}

uint64_t CCConfigure::captureDirectoryCFDictionaryApplier(const __CFString *this, const __CFString *a2, CFStringRef *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CStringPtr;
    uint64_t v9 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v10 = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v10;
    uint64_t v9 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Owner: %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v49 = v11;
    long long v50 = v11;
    long long v47 = v11;
    long long v48 = v11;
    long long v45 = v11;
    long long v46 = v11;
    *(_OWORD *)buf = v11;
    long long v44 = v11;
    memset(&v42, 0, sizeof(v42));
    time_t v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v12 = glog_fd;
    long long v13 = CFStringGetCStringPtr(a3[2], 0);
    dprintf(v12, "CCConfigure::captureDirectoryCFDictionaryApplier Owner: %s\n", v13);
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    tm v15 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v15;
    uint64_t v16 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    long long v17 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v17;
    uint64_t v16 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v49 = v18;
    long long v50 = v18;
    long long v47 = v18;
    long long v48 = v18;
    long long v45 = v18;
    long long v46 = v18;
    *(_OWORD *)buf = v18;
    long long v44 = v18;
    memset(&v42, 0, sizeof(v42));
    time_t v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v19 = glog_fd;
    long long v20 = CFStringGetCStringPtr(a3[3], 0);
    dprintf(v19, "CCConfigure::captureDirectoryCFDictionaryApplier Pipe: %s\n", v20);
  }
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    long long v22 = CFStringGetCStringPtr(a3[1], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v22;
    long long v23 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v24 = CFStringGetCStringPtr(a3[1], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v24;
    long long v23 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier dirName: %s\n", buf, 0xCu);
LABEL_23:
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v49 = v25;
    long long v50 = v25;
    long long v47 = v25;
    long long v48 = v25;
    long long v45 = v25;
    long long v46 = v25;
    *(_OWORD *)buf = v25;
    long long v44 = v25;
    memset(&v42, 0, sizeof(v42));
    time_t v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v26 = glog_fd;
    uint64_t v27 = CFStringGetCStringPtr(a3[1], 0);
    dprintf(v26, "CCConfigure::captureDirectoryCFDictionaryApplier dirName: %s\n", v27);
  }
  uint64_t v28 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    long long v29 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v29;
    uint64_t v30 = v28;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    long long v31 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v31;
    uint64_t v30 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v30, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Key: %s\n", buf, 0xCu);
LABEL_31:
  if (glog_fd)
  {
    *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v49 = v32;
    long long v50 = v32;
    long long v47 = v32;
    long long v48 = v32;
    long long v45 = v32;
    long long v46 = v32;
    *(_OWORD *)buf = v32;
    long long v44 = v32;
    memset(&v42, 0, sizeof(v42));
    time_t v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v33 = glog_fd;
    long long v34 = CFStringGetCStringPtr(this, 0);
    dprintf(v33, "CCConfigure::captureDirectoryCFDictionaryApplier Key: %s\n", v34);
  }
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::captureDirectoryCFDictionaryApplier", this, TypeID);
  if (result)
  {
    uint64_t result = CFStringCompare(this, @"CaptureReason", 0);
    if (!result)
    {
      CFTypeID v37 = CFStringGetTypeID();
      uint64_t result = validCFObjectReference("CCConfigure::captureDirectoryCFDictionaryApplier", a2, v37);
      if (result)
      {
        uint64_t v38 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            time_t v39 = v38;
LABEL_41:
            _os_log_impl(&dword_209928000, v39, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier capture\n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          time_t v39 = &_os_log_internal;
          goto LABEL_41;
        }
        if (glog_fd)
        {
          *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v49 = v40;
          long long v50 = v40;
          long long v47 = v40;
          long long v48 = v40;
          long long v45 = v40;
          long long v46 = v40;
          *(_OWORD *)buf = v40;
          long long v44 = v40;
          memset(&v42, 0, sizeof(v42));
          time_t v41 = 0xAAAAAAAAAAAAAAAALL;
          time(&v41);
          localtime_r(&v41, &v42);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCConfigure::captureDirectoryCFDictionaryApplier capture\n");
        }
        return CCConfigure::captureDirectory((uint64_t)*a3, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::captureDirectory(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::captureDirectory", a3, TypeID);
  if (!result) {
    return result;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  v23.length = CFStringGetLength(MutableCopy);
  v23.location = 0;
  CFStringFindAndReplace(MutableCopy, @"/", @"_", v23, 0);
  if (CFStringGetLength(MutableCopy))
  {
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAA00;
    *(void *)buf = MutableCopy;
    *(void *)&v13.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v13.int tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v13, 0);
    *(void *)&buf[8] = *(void *)&v13.tm_sec;
    *(void *)&long long v15 = v13.tm_hour;
    CCPipeMonitor::forEachTapWithDirectory(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 8), (void (*)(CCTap *, void *))_captureTapCallback, buf);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    return BYTE8(v15) != 0;
  }
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = v9;
LABEL_17:
      _os_log_error_impl(&dword_209928000, v10, OS_LOG_TYPE_ERROR, "CCConfigure::capture capture reason can not be NULL\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = &_os_log_internal;
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    long long v16 = v11;
    long long v17 = v11;
    *(_OWORD *)buf = v11;
    long long v15 = v11;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture capture reason can not be NULL\n");
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return 0;
}

uint64_t _captureTapCallback(uint64_t result, char *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buffer[7] = v4;
  long long v19 = v4;
  buffer[5] = v4;
  buffer[6] = v4;
  buffer[3] = v4;
  buffer[4] = v4;
  buffer[1] = v4;
  buffer[2] = v4;
  buffer[0] = v4;
  a2[24] = 1;
  CFStringGetCString(*(CFStringRef *)a2, (char *)buffer, 128, 0);
  long long v19 = *(_OWORD *)(a2 + 8);
  uint64_t v5 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = buffer;
      CFTypeID v6 = v5;
LABEL_7:
      _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "CCConfigure::capture Reason: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = buffer;
    CFTypeID v6 = &_os_log_internal;
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v7;
    long long v17 = v7;
    long long v14 = v7;
    long long v15 = v7;
    long long v12 = v7;
    long long v13 = v7;
    *(_OWORD *)buf = v7;
    long long v11 = v7;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture Reason: %s\n", (const char *)buffer);
  }
  return (*(uint64_t (**)(uint64_t, _OWORD *))(*(void *)v3 + 88))(v3, buffer);
}

void CCConfigure::pipeOwnerCFDictionaryApplier(const __CFString *this, const void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipeOwnerCFDictionaryApplier", this, TypeID)) {
    return;
  }
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipeOwnerCFDictionaryApplier", a2, v8)) {
    return;
  }
  a3[2] = this;
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
      uint64_t v10 = v9;
LABEL_8:
      _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeOwnerCFDictionaryApplier Owner: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
    uint64_t v10 = &_os_log_internal;
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v11;
    long long v23 = v11;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    *(_OWORD *)buf = v11;
    long long v17 = v11;
    memset(&v15, 0, sizeof(v15));
    time_t v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::pipeOwnerCFDictionaryApplier Owner: %s\n", CStringPtr);
  }
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::pipePipeCFDictionaryApplier, a3);
}

void CCConfigure::pipePipeCFDictionaryApplier(const __CFString *this, const void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipePipeCFDictionaryApplier", this, TypeID)) {
    return;
  }
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipePipeCFDictionaryApplier", a2, v8)) {
    return;
  }
  a3[3] = this;
  a3[1] = @"*";
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
      uint64_t v10 = v9;
LABEL_8:
      _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipePipeCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CFStringGetCStringPtr(this, 0);
    uint64_t v10 = &_os_log_internal;
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v11;
    long long v23 = v11;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    *(_OWORD *)buf = v11;
    long long v17 = v11;
    memset(&v15, 0, sizeof(v15));
    time_t v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::pipePipeCFDictionaryApplier Pipe: %s\n", CStringPtr);
  }
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::pipeConfigureCFDictionaryApplier, a3);
}

void CCConfigure::pipeConfigureCFDictionaryApplier(const __CFString *this, const __CFString *a2, CFStringRef *a3, void *a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = CStringPtr;
    uint64_t v9 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v10 = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v10;
    uint64_t v9 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Owner: %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v64 = v11;
    long long v65 = v11;
    long long v62 = v11;
    long long v63 = v11;
    long long v60 = v11;
    long long v61 = v11;
    *(_OWORD *)buf = v11;
    long long v59 = v11;
    memset(&v57, 0, sizeof(v57));
    time_t v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v12 = glog_fd;
    long long v13 = CFStringGetCStringPtr(a3[2], 0);
    dprintf(v12, "CCConfigure::pipeConfigureCFDictionaryApplier Owner: %s\n", v13);
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    tm v15 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v15;
    long long v16 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    long long v17 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v17;
    long long v16 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v64 = v18;
    long long v65 = v18;
    long long v62 = v18;
    long long v63 = v18;
    long long v60 = v18;
    long long v61 = v18;
    *(_OWORD *)buf = v18;
    long long v59 = v18;
    memset(&v57, 0, sizeof(v57));
    time_t v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v19 = glog_fd;
    long long v20 = CFStringGetCStringPtr(a3[3], 0);
    dprintf(v19, "CCConfigure::pipeConfigureCFDictionaryApplier Pipe: %s\n", v20);
  }
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    long long v22 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v22;
    long long v23 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v24 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v24;
    long long v23 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Key: %s\n", buf, 0xCu);
LABEL_23:
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v64 = v25;
    long long v65 = v25;
    long long v62 = v25;
    long long v63 = v25;
    long long v60 = v25;
    long long v61 = v25;
    *(_OWORD *)buf = v25;
    long long v59 = v25;
    memset(&v57, 0, sizeof(v57));
    time_t v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v26 = glog_fd;
    uint64_t v27 = CFStringGetCStringPtr(this, 0);
    dprintf(v26, "CCConfigure::pipeConfigureCFDictionaryApplier Key: %s\n", v27);
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", this, TypeID))
  {
    if (CFStringCompare(this, @"CaptureReason", 0))
    {
      if (CFStringCompare(this, @"LogOptions", 0))
      {
        if (CFStringCompare(this, @"NotifyTimeout", 0))
        {
          if (CFStringCompare(this, @"WatermarkLevel", 0))
          {
            if (CFStringCompare(this, @"Policy", 0))
            {
              uint64_t v29 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_67;
                }
                uint64_t v30 = CFStringGetCStringPtr(this, 0);
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v30;
                long long v31 = v29;
              }
              else
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_67;
                }
                long long v55 = CFStringGetCStringPtr(this, 0);
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v55;
                long long v31 = &_os_log_internal;
              }
              _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "CCConfigure::pipeConfigureCFDictionaryApplier Unsupported Key %s\n", buf, 0xCu);
LABEL_67:
              if (glog_fd)
              {
                *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v64 = v49;
                long long v65 = v49;
                long long v62 = v49;
                long long v63 = v49;
                long long v60 = v49;
                long long v61 = v49;
                *(_OWORD *)buf = v49;
                long long v59 = v49;
                memset(&v57, 0, sizeof(v57));
                time_t v56 = 0xAAAAAAAAAAAAAAAALL;
                time(&v56);
                localtime_r(&v56, &v57);
                strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
                dprintf(glog_fd, "%s ", (const char *)buf);
                int v50 = glog_fd;
                uint64_t v51 = CFStringGetCStringPtr(this, 0);
                dprintf(v50, "CCConfigure::pipeConfigureCFDictionaryApplier Unsupported Key %s\n", v51);
              }
              return;
            }
            CFTypeID v45 = CFNumberGetTypeID();
            if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v45)) {
              return;
            }
            uint64_t v46 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                long long v47 = v46;
LABEL_83:
                _os_log_impl(&dword_209928000, v47, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier pipe policy\n", buf, 2u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              long long v47 = &_os_log_internal;
              goto LABEL_83;
            }
            if (glog_fd)
            {
              *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v64 = v54;
              long long v65 = v54;
              long long v62 = v54;
              long long v63 = v54;
              long long v60 = v54;
              long long v61 = v54;
              *(_OWORD *)buf = v54;
              long long v59 = v54;
              memset(&v57, 0, sizeof(v57));
              time_t v56 = 0xAAAAAAAAAAAAAAAALL;
              time(&v56);
              localtime_r(&v56, &v57);
              strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
              dprintf(glog_fd, "%s ", (const char *)buf);
              dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier pipe policy\n");
            }
            CCConfigure::policy((uint64_t)*a3, (uint64_t)a3, a2);
            return;
          }
          CFTypeID v41 = CFNumberGetTypeID();
          if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v41)) {
            return;
          }
          uint64_t v42 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              long long v43 = v42;
LABEL_77:
              _os_log_impl(&dword_209928000, v43, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier watermark level to notify\n", buf, 2u);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            long long v43 = &_os_log_internal;
            goto LABEL_77;
          }
          if (glog_fd)
          {
            *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v64 = v53;
            long long v65 = v53;
            long long v62 = v53;
            long long v63 = v53;
            long long v60 = v53;
            long long v61 = v53;
            *(_OWORD *)buf = v53;
            long long v59 = v53;
            memset(&v57, 0, sizeof(v57));
            time_t v56 = 0xAAAAAAAAAAAAAAAALL;
            time(&v56);
            localtime_r(&v56, &v57);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier watermark level to notify\n");
          }
          CCConfigure::watermarkLevel((uint64_t)*a3, (uint64_t)a3, a2);
          return;
        }
        CFTypeID v38 = CFNumberGetTypeID();
        if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v38)) {
          return;
        }
        uint64_t v39 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            long long v40 = v39;
LABEL_71:
            _os_log_impl(&dword_209928000, v40, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier notify timeout\n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          long long v40 = &_os_log_internal;
          goto LABEL_71;
        }
        if (glog_fd)
        {
          *(void *)&long long v52 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v64 = v52;
          long long v65 = v52;
          long long v62 = v52;
          long long v63 = v52;
          long long v60 = v52;
          long long v61 = v52;
          *(_OWORD *)buf = v52;
          long long v59 = v52;
          memset(&v57, 0, sizeof(v57));
          time_t v56 = 0xAAAAAAAAAAAAAAAALL;
          time(&v56);
          localtime_r(&v56, &v57);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier notify timeout\n");
        }
        CCConfigure::notifyTimeout((uint64_t)*a3, (uint64_t)a3, a2);
        return;
      }
      CFTypeID v35 = CFStringGetTypeID();
      if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v35)) {
        return;
      }
      uint64_t v36 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          CFTypeID v37 = v36;
LABEL_62:
          _os_log_impl(&dword_209928000, v37, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Configure Log Options\n", buf, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFTypeID v37 = &_os_log_internal;
        goto LABEL_62;
      }
      if (glog_fd)
      {
        *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v64 = v48;
        long long v65 = v48;
        long long v62 = v48;
        long long v63 = v48;
        long long v60 = v48;
        long long v61 = v48;
        *(_OWORD *)buf = v48;
        long long v59 = v48;
        memset(&v57, 0, sizeof(v57));
        time_t v56 = 0xAAAAAAAAAAAAAAAALL;
        time(&v56);
        localtime_r(&v56, &v57);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier Configure Log Options\n");
      }
      CCConfigure::configureLogOptions((uint64_t)*a3, (uint64_t)a3, a2);
      return;
    }
    CFTypeID v32 = CFStringGetTypeID();
    if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v32)) {
      return;
    }
    uint64_t v33 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v34 = v33;
LABEL_52:
        _os_log_impl(&dword_209928000, v34, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier capture\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v34 = &_os_log_internal;
      goto LABEL_52;
    }
    if (glog_fd)
    {
      *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v64 = v44;
      long long v65 = v44;
      long long v62 = v44;
      long long v63 = v44;
      long long v60 = v44;
      long long v61 = v44;
      *(_OWORD *)buf = v44;
      long long v59 = v44;
      memset(&v57, 0, sizeof(v57));
      time_t v56 = 0xAAAAAAAAAAAAAAAALL;
      time(&v56);
      localtime_r(&v56, &v57);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier capture\n");
    }
    CCConfigure::capture((uint64_t)*a3, (uint64_t)a3, a2);
  }
}

uint64_t CCConfigure::capture(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::capture", a3, TypeID);
  if (!result) {
    return result;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  v23.length = CFStringGetLength(MutableCopy);
  v23.location = 0;
  CFStringFindAndReplace(MutableCopy, @"/", @"_", v23, 0);
  if (CFStringGetLength(MutableCopy))
  {
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAA00;
    *(void *)buf = MutableCopy;
    *(void *)&v13.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v13.int tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v13, 0);
    *(void *)&buf[8] = *(void *)&v13.tm_sec;
    *(void *)&long long v15 = v13.tm_hour;
    CCPipeMonitor::forEachTapWithOwnerAndPipe(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 16), *(const __CFString **)(a2 + 24), (void (*)(CCTap *, void *))_captureTapCallback, buf);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    return BYTE8(v15) != 0;
  }
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = v9;
LABEL_17:
      _os_log_error_impl(&dword_209928000, v10, OS_LOG_TYPE_ERROR, "CCConfigure::capture capture reason can not be NULL\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = &_os_log_internal;
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    long long v16 = v11;
    long long v17 = v11;
    *(_OWORD *)buf = v11;
    long long v15 = v11;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture capture reason can not be NULL\n");
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return 0;
}

uint64_t CCConfigure::configureLogOptions(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (TapWithOwnerAndPipe)
  {
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v8;
      long long v34 = v8;
      long long v31 = v8;
      long long v32 = v8;
      long long v29 = v8;
      long long v30 = v8;
      long long buffer = v8;
      long long v28 = v8;
      CFTypeID TypeID = CFStringGetTypeID();
      uint64_t valid = validCFObjectReference("CCConfigure::configureLogOptions", a3, TypeID);
      if (valid)
      {
        CFStringGetCString(a3, (char *)&buffer, 128, 0);
        CCLogTap::configureLogOptions(v7, (uint64_t)&buffer);
      }
      return valid;
    }
  }
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v41 = v11;
  long long v42 = v11;
  long long v39 = v11;
  long long v40 = v11;
  long long v37 = v11;
  long long v38 = v11;
  long long v35 = v11;
  long long v36 = v11;
  long long v33 = v11;
  long long v34 = v11;
  long long v31 = v11;
  long long v32 = v11;
  long long v29 = v11;
  long long v30 = v11;
  long long buffer = v11;
  long long v28 = v11;
  CFStringGetCString(*(CFStringRef *)(a2 + 16), (char *)&buffer, 256, 0);
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[14] = v12;
  v26[15] = v12;
  v26[12] = v12;
  v26[13] = v12;
  v26[10] = v12;
  v26[11] = v12;
  v26[8] = v12;
  v26[9] = v12;
  v26[6] = v12;
  v26[7] = v12;
  v26[4] = v12;
  v26[5] = v12;
  v26[2] = v12;
  v26[3] = v12;
  v26[0] = v12;
  v26[1] = v12;
  CFStringGetCString(*(CFStringRef *)(a2 + 24), (char *)v26, 256, 0);
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = &buffer;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v26;
      uint64_t v14 = v13;
LABEL_10:
      _os_log_impl(&dword_209928000, v14, OS_LOG_TYPE_DEFAULT, "CCConfigure::configureOptions Not found the tap owner:%s, pipe: %s\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = &buffer;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v26;
    uint64_t v14 = &_os_log_internal;
    goto LABEL_10;
  }
  if (glog_fd)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v15;
    long long v25 = v15;
    long long v22 = v15;
    long long v23 = v15;
    long long v20 = v15;
    long long v21 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&uint8_t buf[16] = v15;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfigure::configureOptions Not found the tap owner:%s, pipe: %s\n", (const char *)&buffer, (const char *)v26);
  }
  return 0;
}

uint64_t CCConfigure::notifyTimeout(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  int valuePtr = -1431655766;
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t valid = validCFObjectReference("CCConfigure::notifyTimeout", a3, TypeID);
  if (valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        uint64_t v10 = v9;
LABEL_10:
        _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::notifyTimeout notifyTimeout: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      uint64_t v10 = &_os_log_internal;
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v11;
      long long v23 = v11;
      long long v20 = v11;
      long long v21 = v11;
      long long v18 = v11;
      long long v19 = v11;
      *(_OWORD *)buf = v11;
      long long v17 = v11;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::notifyTimeout notifyTimeout: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setNotifyTimeout(v6, buf);
  }
  return valid;
}

uint64_t CCConfigure::watermarkLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  int valuePtr = -1431655766;
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t valid = validCFObjectReference("CCConfigure::notifyTimeout", a3, TypeID);
  if (valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        uint64_t v10 = v9;
LABEL_10:
        _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::watermarkLevel watermarkLevel: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      uint64_t v10 = &_os_log_internal;
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v11;
      long long v23 = v11;
      long long v20 = v11;
      long long v21 = v11;
      long long v18 = v11;
      long long v19 = v11;
      *(_OWORD *)buf = v11;
      long long v17 = v11;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::watermarkLevel watermarkLevel: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setWatermarkLevel(v6, buf);
  }
  return valid;
}

uint64_t CCConfigure::policy(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  int valuePtr = -1431655766;
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t valid = validCFObjectReference("CCConfigure::policy", a3, TypeID);
  if (valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        uint64_t v10 = v9;
LABEL_10:
        _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::policy policy: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      uint64_t v10 = &_os_log_internal;
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v11;
      long long v23 = v11;
      long long v20 = v11;
      long long v21 = v11;
      long long v18 = v11;
      long long v19 = v11;
      *(_OWORD *)buf = v11;
      long long v17 = v11;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::policy policy: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setPolicy(v6, buf);
  }
  return valid;
}

CFStringRef *CCConfigure::findTapWithOwnerAndPipe(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCPipeMonitor::findTapWithOwnerAndPipe(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 16), *(const __CFString **)(a2 + 24));
  if (!TapWithOwnerAndPipe) {
    return TapWithOwnerAndPipe;
  }
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buffer[14] = v4;
  buffer[15] = v4;
  buffer[12] = v4;
  buffer[13] = v4;
  buffer[10] = v4;
  buffer[11] = v4;
  _OWORD buffer[8] = v4;
  buffer[9] = v4;
  buffer[6] = v4;
  buffer[7] = v4;
  buffer[4] = v4;
  buffer[5] = v4;
  buffer[2] = v4;
  buffer[3] = v4;
  buffer[0] = v4;
  buffer[1] = v4;
  CFStringGetCString(*(CFStringRef *)(a2 + 16), (char *)buffer, 256, 0);
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[14] = v5;
  v19[15] = v5;
  v19[12] = v5;
  v19[13] = v5;
  v19[10] = v5;
  v19[11] = v5;
  v19[8] = v5;
  v19[9] = v5;
  v19[6] = v5;
  v19[7] = v5;
  v19[4] = v5;
  v19[5] = v5;
  v19[2] = v5;
  v19[3] = v5;
  v19[0] = v5;
  v19[1] = v5;
  CFStringGetCString(*(CFStringRef *)(a2 + 24), (char *)v19, 256, 0);
  uint64_t v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v19;
    uint64_t v7 = v6;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v19;
    uint64_t v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCConfigure::findTapWithOwnerAndPipe  found CCTap, Owner: %s, Pipe: %s\n", buf, 0x16u);
LABEL_8:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v8;
    long long v18 = v8;
    long long v15 = v8;
    long long v16 = v8;
    long long v13 = v8;
    long long v14 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v11, 0, sizeof(v11));
    time_t v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    localtime_r(&v10, &v11);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfigure::findTapWithOwnerAndPipe  found CCTap, Owner: %s, Pipe: %s\n", (const char *)buffer, (const char *)v19);
  }
  return TapWithOwnerAndPipe;
}

void CCConfigure::streamOwnerCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamOwnerCFDictionaryApplier", this, TypeID))
  {
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamOwnerCFDictionaryApplier", a2, v8))
    {
      a3[2] = this;
      CFStringRef v9 = (const __CFString *)a3[5];
      if (!v9 || CFEqual(this, v9))
      {
        CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamPipeCFDictionaryApplier, a3);
      }
    }
  }
}

void CCConfigure::streamPipeCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamPipeCFDictionaryApplier", this, TypeID))
  {
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamPipeCFDictionaryApplier", a2, v8))
    {
      a3[3] = this;
      CFStringRef v9 = (const __CFString *)a3[6];
      if (!v9 || CFEqual(this, v9))
      {
        CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamStreamCFDictionaryApplier, a3);
      }
    }
  }
}

void CCConfigure::streamStreamCFDictionaryApplier(CCConfigure *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamStreamCFDictionaryApplier", this, TypeID))
  {
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamStreamCFDictionaryApplier", a2, v8))
    {
      a3[4] = this;
      CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamConfigureCFDictionaryApplier, a3);
    }
  }
}

void CCConfigure::streamConfigureCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamConfigureCFDictionaryApplier", this, TypeID))
  {
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamConfigureCFDictionaryApplier", a2, v8))
    {
      CFComparisonResult v9 = CFStringCompare(this, @"CoreCapture", 0);
      time_t v10 = (void (__cdecl *)(const void *, const void *, void *))CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier;
      if (v9 == kCFCompareEqualTo
        || (CFComparisonResult v11 = CFStringCompare(this, @"Console", 0),
            time_t v10 = (void (__cdecl *)(const void *, const void *, void *))CCConfigure::streamConfigureConsoleCFDictionaryApplier,
            v11 == kCFCompareEqualTo))
      {
        CFDictionaryApplyFunction(a2, v10, a3);
      }
    }
  }
}

uint64_t CCConfigure::streamConfigureConsoleCFDictionaryApplier(const __CFString *this, const void *a2, uint64_t *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::streamConfigureConsoleCFDictionaryApplier", this, TypeID);
  if (result)
  {
    CFTypeID v9 = CFNumberGetTypeID();
    uint64_t result = validCFObjectReference("CCConfigure::streamConfigureConsoleCFDictionaryApplier", a2, v9);
    if (result)
    {
      if (CFStringCompare(this, @"LogFlags", 0))
      {
        uint64_t result = CFStringCompare(this, @"LogLevel", 0);
        if (!result)
        {
          uint64_t v11 = *a3;
          return CCConfigure::setConsoleLevel(v11, (uint64_t)a3, a2);
        }
      }
      else
      {
        uint64_t v10 = *a3;
        return CCConfigure::setConsoleFlags(v10, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setConsoleFlags(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::setConsoleFlags", a3, TypeID);
  if (result)
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
    uint64_t result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        uint64_t v8 = result;
        unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v25 = v9;
        long long v26 = v9;
        long long v23 = v9;
        long long v24 = v9;
        long long v21 = v9;
        long long v22 = v9;
        long long v19 = v9;
        long long v20 = v9;
        long long v17 = v9;
        long long v18 = v9;
        long long v15 = v9;
        long long v16 = v9;
        long long v13 = v9;
        long long v14 = v9;
        *(_OWORD *)long long buffer = v9;
        long long v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        unint64_t v27 = valuePtr;
        CCLogTap::setConsoleLogFlags(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setConsoleLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::setConsoleLevel", a3, TypeID);
  if (result)
  {
    int valuePtr = -1431655766;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    uint64_t result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        uint64_t v8 = result;
        int v27 = -1431655766;
        *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v25 = v9;
        long long v26 = v9;
        long long v23 = v9;
        long long v24 = v9;
        long long v21 = v9;
        long long v22 = v9;
        long long v19 = v9;
        long long v20 = v9;
        long long v17 = v9;
        long long v18 = v9;
        long long v15 = v9;
        long long v16 = v9;
        long long v13 = v9;
        long long v14 = v9;
        *(_OWORD *)long long buffer = v9;
        long long v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        int v27 = valuePtr;
        CCLogTap::setConsoleLogLevel(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

uint64_t CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier(const __CFString *this, const void *a2, uint64_t *a3, void *a4)
{
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier", this, TypeID);
  if (result)
  {
    CFTypeID v9 = CFNumberGetTypeID();
    uint64_t result = validCFObjectReference("CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier", a2, v9);
    if (result)
    {
      if (CFStringCompare(this, @"LogFlags", 0))
      {
        uint64_t result = CFStringCompare(this, @"LogLevel", 0);
        if (!result)
        {
          uint64_t v11 = *a3;
          return CCConfigure::setLevel(v11, (uint64_t)a3, a2);
        }
      }
      else
      {
        uint64_t v10 = *a3;
        return CCConfigure::setFlags(v10, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setFlags(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (TapWithOwnerAndPipe) {
  else
  }
    uint64_t v6 = 0;
  CFTypeID v7 = CFGetTypeID(a3);
  if (v7 == CFNumberGetTypeID())
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
    BOOL v8 = v6 != 0;
    if (v6)
    {
      *(void *)&buffer[256] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&buffer[224] = v9;
      *(_OWORD *)&buffer[240] = v9;
      *(_OWORD *)&buffer[192] = v9;
      *(_OWORD *)&buffer[208] = v9;
      *(_OWORD *)&buffer[160] = v9;
      *(_OWORD *)&buffer[176] = v9;
      *(_OWORD *)&buffer[128] = v9;
      *(_OWORD *)&buffer[144] = v9;
      *(_OWORD *)&buffer[96] = v9;
      *(_OWORD *)&buffer[112] = v9;
      *(_OWORD *)&buffer[64] = v9;
      *(_OWORD *)&buffer[80] = v9;
      *(_OWORD *)&buffer[32] = v9;
      *(_OWORD *)&buffer[48] = v9;
      *(_OWORD *)long long buffer = v9;
      *(_OWORD *)&char buffer[16] = v9;
      CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
      *(void *)&buffer[256] = valuePtr;
      CCLogTap::setLogFlags((uint64_t)v6, buffer);
    }
    return v8;
  }
  CFTypeID v10 = CFGetTypeID(a3);
  if (v10 != CFArrayGetTypeID()) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)a3);
  BOOL v8 = 1;
  if (Count >= 1)
  {
    CFIndex v12 = Count;
    CFIndex v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, v13);
      CFTypeID v15 = CFGetTypeID(ValueAtIndex);
      if (v15 == CFStringGetTypeID())
      {
        CFStringRef v16 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a3, v13);
        CStringPtr = CFStringGetCStringPtr(v16, 0);
        memset(buffer, 170, 0x204uLL);
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        *(_DWORD *)&buffer[512] = 1;
        int v18 = *(unsigned __int8 *)CStringPtr;
        if (v18 == 43)
        {
          long long v19 = CStringPtr + 1;
        }
        else
        {
          if (v18 == 45)
          {
            strlcpy(&buffer[256], CStringPtr + 1, 0x100uLL);
            *(_DWORD *)&buffer[512] = 2;
            if (!v6) {
              goto LABEL_19;
            }
LABEL_18:
            CCLogTap::updateLogFlags((uint64_t)v6, buffer);
            goto LABEL_19;
          }
          long long v19 = CStringPtr;
        }
        strlcpy(&buffer[256], v19, 0x100uLL);
        if (v6) {
          goto LABEL_18;
        }
      }
LABEL_19:
      if (v12 == ++v13) {
        return 1;
      }
    }
  }
  return v8;
}

uint64_t CCConfigure::setLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFNumberGetTypeID();
  uint64_t result = validCFObjectReference("CCConfigure::setLevel", a3, TypeID);
  if (result)
  {
    int valuePtr = -1431655766;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    uint64_t result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        uint64_t v8 = result;
        int v27 = -1431655766;
        *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v25 = v9;
        long long v26 = v9;
        long long v23 = v9;
        long long v24 = v9;
        long long v21 = v9;
        long long v22 = v9;
        long long v19 = v9;
        long long v20 = v9;
        long long v17 = v9;
        long long v18 = v9;
        long long v15 = v9;
        long long v16 = v9;
        long long v13 = v9;
        long long v14 = v9;
        *(_OWORD *)long long buffer = v9;
        long long v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        int v27 = valuePtr;
        CCLogTap::setLogLevel(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

void CCConfigure::profileLoaded(CFDictionaryRef **this)
{
}

void CCConfigure::profileRemoved(CFDictionaryRef **this)
{
}

uint64_t CCOSSerializeFormatter::initWithRegistryEntry(CCOSSerializeFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCOSSerializeFormatter::getFormatterFileExtension(CCOSSerializeFormatter *this)
{
  return "json";
}

uint64_t CCOSSerializeFormatter::writeCommentEntry()
{
  return 0;
}

CFIndex CCOSSerializeFormatter::writeLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a5)
  {
    uint64_t v11 = (char *)malloc_type_malloc(a6 + a4, 0x56CD9DDDuLL);
    memcpy(v11, a3, a4);
    memcpy(&v11[a4], a5, a6);
    a3 = v11;
  }
  else
  {
    uint64_t v11 = 0;
  }
  CFStringRef errorString = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  CFTypeRef v12 = IOCFUnserialize((const char *)a3, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &errorString);
  long long v13 = v12;
  if (!v12)
  {
    uint64_t v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = CStringPtr;
        long long v23 = v21;
LABEL_47:
        _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "Error: %s", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v37 = CFStringGetCStringPtr(errorString, 0);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v37;
      long long v23 = &_os_log_internal;
      goto LABEL_47;
    }
    if (glog_fd)
    {
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v26;
      long long v47 = v26;
      long long v44 = v26;
      long long v45 = v26;
      long long v42 = v26;
      long long v43 = v26;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&uint8_t buf[16] = v26;
      memset(&v39, 0, sizeof(v39));
      time_t v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      int v27 = glog_fd;
      uint64_t v28 = CFStringGetCStringPtr(errorString, 0);
      dprintf(v27, "Error: %s", v28);
    }
    long long v15 = 0;
    goto LABEL_30;
  }
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 != CFArrayGetTypeID())
  {
    uint64_t v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v25 = v24;
LABEL_49:
        _os_log_error_impl(&dword_209928000, v25, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog unsupported root type for JSON Serialization", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v25 = &_os_log_internal;
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v29;
      long long v47 = v29;
      long long v44 = v29;
      long long v45 = v29;
      long long v42 = v29;
      long long v43 = v29;
      *(_OWORD *)buf = v29;
      *(_OWORD *)&uint8_t buf[16] = v29;
      memset(&v39, 0, sizeof(v39));
      time_t v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeFormatter::writeLog unsupported root type for JSON Serialization");
    }
    long long v15 = 0;
LABEL_24:
    uint64_t v30 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      long long v31 = v30;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      long long v31 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog CFDataGetBytePtr() failed", buf, 2u);
LABEL_28:
    if (glog_fd)
    {
      *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v32;
      long long v47 = v32;
      long long v44 = v32;
      long long v45 = v32;
      long long v42 = v32;
      long long v43 = v32;
      *(_OWORD *)buf = v32;
      *(_OWORD *)&uint8_t buf[16] = v32;
      memset(&v39, 0, sizeof(v39));
      time_t v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeFormatter::writeLog CFDataGetBytePtr() failed");
    }
LABEL_30:
    CFIndex v20 = 0;
    goto LABEL_31;
  }
  long long v15 = (const void *)[MEMORY[0x263F08900] dataWithJSONObject:v13 options:1 error:0];
  CFRetain(v15);
  if (!v15) {
    goto LABEL_24;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v15);
  if (!BytePtr) {
    goto LABEL_24;
  }
  long long v17 = BytePtr;
  CFIndex Length = CFDataGetLength((CFDataRef)v15);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(void *)a1 + 112))(a1, v17, Length);
  if (v19 == Length)
  {
    CFIndex v20 = Length;
    goto LABEL_31;
  }
  CFIndex v20 = v19;
  uint64_t v34 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    long long v35 = v34;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    long long v35 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v35, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_42:
  if (glog_fd)
  {
    *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v36;
    long long v47 = v36;
    long long v44 = v36;
    long long v45 = v36;
    long long v42 = v36;
    long long v43 = v36;
    *(_OWORD *)buf = v36;
    *(_OWORD *)&uint8_t buf[16] = v36;
    memset(&v39, 0, sizeof(v39));
    time_t v38 = 0xAAAAAAAAAAAAAAAALL;
    time(&v38);
    localtime_r(&v38, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", Length, v20);
  }
LABEL_31:
  if (v11) {
    free(v11);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v20;
}

void CCOSSerializeFormatter::~CCOSSerializeFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

char *CCOSSerializeFormatter::withRegistryEntry(CCOSSerializeFormatter *this)
{
  io_object_t v1 = this;
  uint64_t v2 = (char *)malloc_type_malloc(0x28uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)uint64_t v2 = &unk_26BD714E0;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCOSSerializeFormatter::writeLogPayload(CCOSSerializeFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCOSSerializeFormatter *, const char *))(*(void *)this + 112))(this, a2);
}

uint64_t CCDaemon::freeResources(CCDaemon *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 72))(v2);
    CCPipeMonitor::cleanCaptureDirectories(*((CFDictionaryRef **)this + 2));
    uint64_t v3 = *((void *)this + 2);
    uint64_t v4 = *(void *)(v3 + 72);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 48))(v4);
      *(void *)(v3 + 72) = 0;
    }
  }
  long long v5 = *((void *)this + 37);
  if (v5)
  {
    dispatch_source_cancel(v5);
    dispatch_release(*((dispatch_object_t *)this + 37));
    *((void *)this + 37) = 0;
  }
  uint64_t v6 = *((void *)this + 5);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 48))(v6);
    *((void *)this + 5) = 0;
  }
  uint64_t v7 = *((void *)this + 3);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 48))(v7);
    *((void *)this + 3) = 0;
  }
  uint64_t v8 = *((void *)this + 4);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
    *((void *)this + 4) = 0;
  }
  uint64_t v9 = *((void *)this + 2);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)v9 + 48))(v9);
    *((void *)this + 2) = 0;
  }
  CFTypeID v10 = (pthread_mutex_t *)((char *)this + 232);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 232));
  if (!*((unsigned char *)this + 208))
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 512, @"/var/log/CoreCapture");
    if (MutableCopy)
    {
      CFTypeRef v12 = MutableCopy;
      deleteDirectory(MutableCopy);
      CFRelease(v12);
    }
  }
  pthread_mutex_unlock(v10);

  return pthread_mutex_destroy(v10);
}

__CFString *CCDaemon::init(CCDaemon *this)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  shutDownPending = 0;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v74 = v2;
  long long v75 = v2;
  long long v72 = v2;
  long long v73 = v2;
  long long v70 = v2;
  long long v71 = v2;
  long long v68 = v2;
  long long v69 = v2;
  long long v66 = v2;
  long long v67 = v2;
  long long v64 = v2;
  long long v65 = v2;
  long long v62 = v2;
  long long v63 = v2;
  *(_OWORD *)__big = v2;
  long long v61 = v2;
  *((unsigned char *)this + 208) = 0;
  size_t v51 = 256;
  if (sysctlbyname("kern.bootargs", __big, &v51, 0, 0)
    || (HIBYTE(v75) = 0, !strnstr(__big, "cc.debug.keepwd", 0x100uLL)))
  {
    if (!*((unsigned char *)this + 208))
    {
      uint64_t result = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 512, @"/var/log/CoreCapture");
      if (!result) {
        return result;
      }
      uint64_t v4 = result;
      deleteDirectory(result);
      CFRelease(v4);
    }
  }
  else
  {
    *((unsigned char *)this + 208) = 1;
  }
  pruneDirectoryOnOSUpgrade();
  _gQueuePrivate = (uint64_t)dispatch_queue_create("com.apple.corecaptured.serial_queue", 0);
  if (!_gQueuePrivate)
  {
    uint64_t v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      long long v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      long long v16 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "CCDaemon::init failed to create com.apple.corecaptured.serial_queue\n", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v20;
      long long v59 = v20;
      long long v56 = v20;
      long long v57 = v20;
      long long v54 = v20;
      long long v55 = v20;
      *(_OWORD *)buf = v20;
      long long v53 = v20;
      memset(&v50, 0, sizeof(v50));
      time_t v49 = 0xAAAAAAAAAAAAAAAALL;
      time(&v49);
      localtime_r(&v49, &v50);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init failed to create com.apple.corecaptured.serial_queue\n");
    }
    return 0;
  }
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  *((void *)this + 37) = v5;
  if (!v5)
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)buf = 0;
      long long v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)buf = 0;
      long long v18 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v18, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create timer dispatch source\n", buf, 2u);
LABEL_44:
    if (glog_fd)
    {
      *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v35;
      long long v59 = v35;
      long long v56 = v35;
      long long v57 = v35;
      long long v54 = v35;
      long long v55 = v35;
      *(_OWORD *)buf = v35;
      long long v53 = v35;
      memset(&v50, 0, sizeof(v50));
      time_t v49 = 0xAAAAAAAAAAAAAAAALL;
      time(&v49);
      localtime_r(&v49, &v50);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init Failed to create timer dispatch source\n");
    }
    return 0;
  }
  uint64_t v6 = v5;
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v6, v7, 0xDF8475800uLL, 0);
  uint64_t v8 = *((void *)this + 37);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN8CCDaemon4initEv_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = this;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*((dispatch_object_t *)this + 37));
  CFMutableDictionaryRef v9 = IOServiceNameMatching("CCPipe");
  *((void *)this + 25) = v9;
  uint64_t v10 = coreCaptureOsLog;
  if (!v9)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      uint64_t v19 = v10;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      uint64_t v19 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "CCDaemon:: No name matching CCPipe service found \n", buf, 2u);
LABEL_50:
    if (glog_fd)
    {
      *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v38;
      long long v59 = v38;
      long long v56 = v38;
      long long v57 = v38;
      long long v54 = v38;
      long long v55 = v38;
      *(_OWORD *)buf = v38;
      long long v53 = v38;
      memset(&v50, 0, sizeof(v50));
      time_t v49 = 0xAAAAAAAAAAAAAAAALL;
      time(&v49);
      localtime_r(&v49, &v50);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon:: No name matching CCPipe service found \n");
    }
    return 0;
  }
  CFDictionaryRef v11 = v9;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    CFIndex Count = CFDictionaryGetCount(v11);
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = Count;
    CFTypeID v14 = v10;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    CFIndex v21 = CFDictionaryGetCount(v11);
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v21;
    CFTypeID v14 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v14, OS_LOG_TYPE_DEFAULT, "CCDaemon::No of matching CCPipe %ld\n", buf, 0xCu);
LABEL_28:
  if (glog_fd)
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v58 = v22;
    long long v59 = v22;
    long long v56 = v22;
    long long v57 = v22;
    long long v54 = v22;
    long long v55 = v22;
    *(_OWORD *)buf = v22;
    long long v53 = v22;
    memset(&v50, 0, sizeof(v50));
    time_t v49 = 0xAAAAAAAAAAAAAAAALL;
    time(&v49);
    localtime_r(&v49, &v50);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v23 = glog_fd;
    CFIndex v24 = CFDictionaryGetCount(*((CFDictionaryRef *)this + 25));
    dprintf(v23, "CCDaemon::No of matching CCPipe %ld\n", v24);
  }
  long long v25 = CCPipeMonitor::withDictionary(*((CCPipeMonitor **)this + 25), v12);
  *((void *)this + 2) = v25;
  if (v25)
  {
    if (*((void *)this + 25))
    {
      CFRelease(*((CFTypeRef *)this + 25));
      *((void *)this + 25) = 0;
      long long v25 = (CCPipeMonitor *)*((void *)this + 2);
    }
    long long v26 = (CCProfileMonitor *)CCConfigure::withPipeMonitor((uint64_t)v25);
    *((void *)this + 4) = v26;
    if (v26)
    {
      uint64_t v28 = CCProfileMonitor::withConfigure(v26, v27);
      *((void *)this + 3) = v28;
      if (v28)
      {
        *(void *)(*((void *)this + 2) + 72) = v28;
        (*(void (**)(char *))(*(void *)v28 + 40))(v28);
        uint64_t v30 = CCXPCService::withConfigureAndPipeMonitor(*((CCXPCService **)this + 4), *((CCConfigure **)this + 2), v29);
        *((void *)this + 5) = v30;
        if (v30)
        {
          if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 232), 0)) {
            return (__CFString *)1;
          }
          uint64_t v31 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_71;
            }
            *(_WORD *)buf = 0;
            long long v32 = v31;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_71;
            }
            *(_WORD *)buf = 0;
            long long v32 = &_os_log_internal;
          }
          _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to initialize mutex\n", buf, 2u);
LABEL_71:
          if (glog_fd)
          {
            *(void *)&long long v46 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v58 = v46;
            long long v59 = v46;
            long long v56 = v46;
            long long v57 = v46;
            long long v54 = v46;
            long long v55 = v46;
            *(_OWORD *)buf = v46;
            long long v53 = v46;
            memset(&v50, 0, sizeof(v50));
            time_t v49 = 0xAAAAAAAAAAAAAAAALL;
            time(&v49);
            localtime_r(&v49, &v50);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCDaemon::init Failed to initialize mutex\n");
          }
          return 0;
        }
        uint64_t v42 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          *(_WORD *)buf = 0;
          long long v43 = v42;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          *(_WORD *)buf = 0;
          long long v43 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v43, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCXPCService\n", buf, 2u);
LABEL_74:
        if (glog_fd)
        {
          *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v58 = v47;
          long long v59 = v47;
          long long v56 = v47;
          long long v57 = v47;
          long long v54 = v47;
          long long v55 = v47;
          *(_OWORD *)buf = v47;
          long long v53 = v47;
          memset(&v50, 0, sizeof(v50));
          time_t v49 = 0xAAAAAAAAAAAAAAAALL;
          time(&v49);
          localtime_r(&v49, &v50);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCDaemon::init Failed to create CCXPCService\n");
        }
        return 0;
      }
      uint64_t v39 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        long long v40 = v39;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        long long v40 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCProfileMonitor\n", buf, 2u);
LABEL_68:
      if (glog_fd)
      {
        *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v58 = v45;
        long long v59 = v45;
        long long v56 = v45;
        long long v57 = v45;
        long long v54 = v45;
        long long v55 = v45;
        *(_OWORD *)buf = v45;
        long long v53 = v45;
        memset(&v50, 0, sizeof(v50));
        time_t v49 = 0xAAAAAAAAAAAAAAAALL;
        time(&v49);
        localtime_r(&v49, &v50);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCDaemon::init Failed to create CCProfileMonitor\n");
      }
      return 0;
    }
    uint64_t v36 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_WORD *)buf = 0;
      long long v37 = v36;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_WORD *)buf = 0;
      long long v37 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v37, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCConfigure\n", buf, 2u);
LABEL_64:
    if (glog_fd)
    {
      *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v44;
      long long v59 = v44;
      long long v56 = v44;
      long long v57 = v44;
      long long v54 = v44;
      long long v55 = v44;
      *(_OWORD *)buf = v44;
      long long v53 = v44;
      memset(&v50, 0, sizeof(v50));
      time_t v49 = 0xAAAAAAAAAAAAAAAALL;
      time(&v49);
      localtime_r(&v49, &v50);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init Failed to create CCConfigure\n");
    }
    return 0;
  }
  uint64_t v33 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v34 = v33;
LABEL_85:
      _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCPipeMonitor\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v34 = &_os_log_internal;
    goto LABEL_85;
  }
  if (glog_fd)
  {
    *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v58 = v41;
    long long v59 = v41;
    long long v56 = v41;
    long long v57 = v41;
    long long v54 = v41;
    long long v55 = v41;
    *(_OWORD *)buf = v41;
    long long v53 = v41;
    memset(&v50, 0, sizeof(v50));
    time_t v49 = 0xAAAAAAAAAAAAAAAALL;
    time(&v49);
    localtime_r(&v49, &v50);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v50);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::init Failed to create CCPipeMonitor\n");
  }
  uint64_t result = (__CFString *)*((void *)this + 25);
  if (result)
  {
    CFRelease(result);
    uint64_t result = 0;
    *((void *)this + 25) = 0;
  }
  return result;
}

void ___ZN8CCDaemon4initEv_block_invoke(uint64_t a1)
{
}

void CCDaemon::activityCheck(CCDaemon *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (shutDownPending
    || *(unsigned char *)(*((void *)this + 3) + 104)
    || *(unsigned char *)(*((void *)this + 5) + 48)
    || (CCPipeMonitor::isActive(*((CFDictionaryRef **)this + 2), 60.0) & 1) != 0)
  {
    return;
  }
  uint64_t v1 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    long long v2 = (CCDaemon *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "activityCheck";
      uint64_t v3 = v1;
LABEL_10:
      _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCDaemon::%s monitor NOT active, shutdown", buf, 0xCu);
    }
  }
  else
  {
    long long v2 = (CCDaemon *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "activityCheck";
      uint64_t v3 = &_os_log_internal;
      goto LABEL_10;
    }
  }
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = v4;
    long long v14 = v4;
    long long v11 = v4;
    long long v12 = v4;
    long long v9 = v4;
    long long v10 = v4;
    *(_OWORD *)buf = v4;
    long long v8 = v4;
    memset(&v6, 0, sizeof(v6));
    time_t v5 = 0xAAAAAAAAAAAAAAAALL;
    time(&v5);
    localtime_r(&v5, &v6);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
    dprintf(glog_fd, "%s ", (const char *)buf);
    long long v2 = (CCDaemon *)dprintf(glog_fd, "CCDaemon::%s monitor NOT active, shutdown", "activityCheck");
  }
  CCDaemon::shutdown(v2);
}

void CCDaemon::runShutdownThread(CCDaemon *this, void *a2)
{
}

void CCDaemon::CCDaemon(CCDaemon *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71580;
}

{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71580;
}

char *CCDaemon::ccstart(CCDaemon *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = (char *)malloc_type_malloc(0x130uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v1 + 28) = 0u;
  *(_OWORD *)(v1 + 44) = 0u;
  *(_OWORD *)(v1 + 60) = 0u;
  *(_OWORD *)(v1 + 76) = 0u;
  *(_OWORD *)(v1 + 92) = 0u;
  *(_OWORD *)(v1 + 108) = 0u;
  *(_OWORD *)(v1 + 124) = 0u;
  *(_OWORD *)(v1 + 140) = 0u;
  *(_OWORD *)(v1 + 156) = 0u;
  *(_OWORD *)(v1 + 172) = 0u;
  *(_OWORD *)(v1 + 188) = 0u;
  *(_OWORD *)(v1 + 204) = 0u;
  *(_OWORD *)(v1 + 220) = 0u;
  *(_OWORD *)(v1 + 236) = 0u;
  *(_OWORD *)(v1 + 252) = 0u;
  *((_DWORD *)v1 + 75) = 0;
  *(_OWORD *)(v1 + 12) = 0u;
  *(_OWORD *)(v1 + 268) = 0u;
  *(_OWORD *)(v1 + 284) = 0u;
  *((_DWORD *)v1 + 2) = 1;
  *(void *)uint64_t v1 = &unk_26BD71580;
  if (CCDaemon::init((CCDaemon *)v1))
  {
    daemonGlbl = (uint64_t)v1;
    return v1;
  }
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v3 = v2;
LABEL_12:
      _os_log_error_impl(&dword_209928000, v3, OS_LOG_TYPE_ERROR, "CCDaemon::ccstart to create CCDaemon\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v3 = &_os_log_internal;
    goto LABEL_12;
  }
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v14 = v4;
    long long v15 = v4;
    long long v12 = v4;
    long long v13 = v4;
    long long v10 = v4;
    long long v11 = v4;
    *(_OWORD *)buf = v4;
    long long v9 = v4;
    memset(&v7, 0, sizeof(v7));
    time_t v6 = 0xAAAAAAAAAAAAAAAALL;
    time(&v6);
    localtime_r(&v6, &v7);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v7);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::ccstart to create CCDaemon\n");
  }
  (*(void (**)(char *))(*(void *)v1 + 48))(v1);
  return 0;
}

void CoreCaptureStop(CCDaemon *this)
{
  if (!shutDownPending) {
    CCDaemon::shutdown(this);
  }
}

uint64_t CCDaemon::setCaptureIdAndReason(uint64_t a1, uint64_t a2, const char *a3)
{
  time_t v6 = (pthread_mutex_t *)(a1 + 232);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
  if (*(void *)a2 != *(void *)(a1 + 56) || *(void *)(a2 + 8) != *(void *)(a1 + 64))
  {
    strlcpy((char *)(a1 + 72), a3, 0x80uLL);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)a2;
  }

  return pthread_mutex_unlock(v6);
}

BOOL CCDaemon::lock(CCDaemon *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 232)) == 0;
}

BOOL CCDaemon::unlock(CCDaemon *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 232)) == 0;
}

void CCDaemon::quiesceAllTaps(CFDictionaryRef **this)
{
}

void CCDaemon::resumeAllTaps(CFDictionaryRef **this)
{
}

void CCDaemon::sysPowerNotificationCallback(CCDaemon *this, void *a2, int a3, intptr_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 <= -536870273)
  {
    if (a3 != -536870315)
    {
      if (a3 != -536870288) {
        return;
      }
LABEL_10:
      CCPipeMonitor::quiesceAllTaps(*(CFDictionaryRef **)(daemonGlbl + 16));
      uint64_t v9 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = a3;
          long long v10 = v9;
LABEL_18:
          _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCDaemon received system sleep notification (0x%x), all cctap quiesced\n", buf, 8u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a3;
        long long v10 = &_os_log_internal;
        goto LABEL_18;
      }
      if (glog_fd)
      {
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v24 = v13;
        long long v25 = v13;
        long long v22 = v13;
        long long v23 = v13;
        long long v20 = v13;
        long long v21 = v13;
        *(_OWORD *)buf = v13;
        long long v19 = v13;
        memset(&v17, 0, sizeof(v17));
        time_t v16 = 0xAAAAAAAAAAAAAAAALL;
        time(&v16);
        localtime_r(&v16, &v17);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCDaemon received system sleep notification (0x%x), all cctap quiesced\n", a3);
      }
      IOAllowPowerChange(gPMConnectRootPort, a4);
      return;
    }
    CCPipeMonitor::quiesceAllTaps(*(CFDictionaryRef **)(daemonGlbl + 16));
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v12 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCDaemon received system shutdown notification, all cctap quiesced\n", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v24 = v15;
      long long v25 = v15;
      long long v22 = v15;
      long long v23 = v15;
      long long v20 = v15;
      long long v21 = v15;
      *(_OWORD *)buf = v15;
      long long v19 = v15;
      memset(&v17, 0, sizeof(v17));
      time_t v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon received system shutdown notification, all cctap quiesced\n");
    }
    return;
  }
  if (a3 == -536870272) {
    goto LABEL_10;
  }
  if (a3 != -536870144) {
    return;
  }
  CCPipeMonitor::resumeAllTapsFromQuiesced(*(CFDictionaryRef **)(daemonGlbl + 16));
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    long long v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    long long v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCDaemon received system wake, all cctap resumed from quiesced state\n", buf, 2u);
LABEL_25:
  if (glog_fd)
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v14;
    long long v25 = v14;
    long long v22 = v14;
    long long v23 = v14;
    long long v20 = v14;
    long long v21 = v14;
    *(_OWORD *)buf = v14;
    long long v19 = v14;
    memset(&v17, 0, sizeof(v17));
    time_t v16 = 0xAAAAAAAAAAAAAAAALL;
    time(&v16);
    localtime_r(&v16, &v17);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon received system wake, all cctap resumed from quiesced state\n");
  }
}

void CCDaemon::enablePowerNotification(CCDaemon *this)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  gPMConnectRootPort = 0;
  uint64_t v2 = (IONotificationPort **)((char *)this + 216);
  uint64_t v3 = (_DWORD *)((char *)this + 224);
  *(void *)((char *)this + 220) = 0;
  *(void *)((char *)this + 212) = 0;
  io_connect_t v4 = IORegisterForSystemPower(0, (IONotificationPortRef *)this + 27, (IOServiceInterestCallback)CCDaemon::sysPowerNotificationCallback, (io_object_t *)this + 56);
  *((_DWORD *)this + 53) = v4;
  if (v4)
  {
    time_t v5 = *v2;
    if (*v2)
    {
      if (*v3)
      {
        gPMConnectRootPort = v4;
        IONotificationPortSetDispatchQueue(v5, MEMORY[0x263EF83A0]);
        uint64_t v6 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          uint64_t v7 = v6;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          uint64_t v7 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCDaemon power notification enabled\n", buf, 2u);
LABEL_16:
        if (glog_fd)
        {
          *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v20 = v11;
          long long v21 = v11;
          long long v18 = v11;
          long long v19 = v11;
          long long v16 = v11;
          long long v17 = v11;
          *(_OWORD *)buf = v11;
          long long v15 = v11;
          memset(&v13, 0, sizeof(v13));
          time_t v12 = 0xAAAAAAAAAAAAAAAALL;
          time(&v12);
          localtime_r(&v12, &v13);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCDaemon power notification enabled\n");
        }
        return;
      }
    }
  }
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = v8;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCDaemon IORegisterForSystemPower failed\n", buf, 2u);
LABEL_11:
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v10;
    long long v21 = v10;
    long long v18 = v10;
    long long v19 = v10;
    long long v16 = v10;
    long long v17 = v10;
    *(_OWORD *)buf = v10;
    long long v15 = v10;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon IORegisterForSystemPower failed\n");
  }
}

void CCDaemon::disablePowerNotification(CCDaemon *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)((char *)this + 212);
  if (!*((_DWORD *)this + 53)) {
    return;
  }
  IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 27), 0);
  IODeregisterForSystemPower((io_object_t *)this + 56);
  IOServiceClose(*((_DWORD *)this + 53));
  IONotificationPortDestroy(*((IONotificationPortRef *)this + 27));
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      io_connect_t v4 = v3;
LABEL_7:
      _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "CCDaemon power notification disabled\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    io_connect_t v4 = &_os_log_internal;
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v14 = v5;
    long long v15 = v5;
    long long v12 = v5;
    long long v13 = v5;
    long long v10 = v5;
    long long v11 = v5;
    *(_OWORD *)buf = v5;
    long long v9 = v5;
    memset(&v7, 0, sizeof(v7));
    time_t v6 = 0xAAAAAAAAAAAAAAAALL;
    time(&v6);
    localtime_r(&v6, &v7);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v7);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon power notification disabled\n");
  }
  gPMConnectRootPort = 0;
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t CCCrashTracerFormatter::initWithRegistryEntry(CCCrashTracerFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCCrashTracerFormatter::getFormatterFileExtension(CCCrashTracerFormatter *this)
{
  return "ips";
}

uint64_t CCCrashTracerFormatter::writeLog(uint64_t a1, uint64_t a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = 0;
  if (a3)
  {
    int v10 = a4;
    if ((a4 & 0xFFFFFFF8) != 0)
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v11 = a3[1];
        long long v12 = a3 + 2;
        if (*a3 <= 1u) {
          v9 += (*(uint64_t (**)(uint64_t, _DWORD *, void))(*(void *)a1 + 112))(a1, a3 + 2, a3[1]);
        }
        int v10 = v10 - v11 - 8;
        a3 = (_DWORD *)((char *)v12 + v11);
      }
      while ((v10 & 0xFFFFFFF8) != 0);
    }
  }
  if (a5) {
    v9 += (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a5, a6);
  }
  return v9;
}

void CCCrashTracerFormatter::~CCCrashTracerFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

void *CCCrashTracerFormatter::withRegistryEntry(CCCrashTracerFormatter *this)
{
  io_object_t v1 = this;
  uint64_t v2 = malloc_type_malloc(0x20uLL, 0xEE9A6C17uLL);
  v2[2] = 0;
  v2[3] = 0;
  v2[1] = 0;
  *((_DWORD *)v2 + 2) = 1;
  *uint64_t v2 = &unk_26BD715E0;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCDataFile::openCaptureFile(_DWORD *a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a2) {
    a2 = "debug_data";
  }
  tm v7 = (__CFString *)(*(uint64_t (**)(_DWORD *, const char *, uint64_t, uint64_t))(*(void *)a1 + 144))(a1, a2, a4, a5);
  mkdirRecursive(v7);
  CFStringAppendCString(v7, "/", 0);
  CFStringAppendCString(v7, a3, 0);
  CFIndex Length = CFStringGetLength(v7);
  uint64_t v9 = (char *)malloc_type_malloc(Length + 1, 0xAEC5040CuLL);
  CFIndex v10 = CFStringGetLength(v7);
  CFStringGetCString(v7, v9, v10 + 1, 0);
  uint64_t v11 = isSeedAndiOS();
  if (v11)
  {
    if (!deviceUnlockedSinceBoot(v11, v12))
    {
      a1[9] = -1;
      goto LABEL_11;
    }
    int v13 = open_dprotected_np(v9, 514, 3, 0, 420);
  }
  else
  {
    int v13 = creat(v9, 0x1A4u);
  }
  a1[9] = v13;
  if (v13 != -1)
  {
    uint64_t v14 = 1;
    if (!v9) {
      goto LABEL_19;
    }
LABEL_18:
    free(v9);
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v9;
    uint64_t v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v9;
    uint64_t v16 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "CCDataFile::open Failed to create %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v17;
    long long v28 = v17;
    long long v25 = v17;
    long long v26 = v17;
    long long v23 = v17;
    long long v24 = v17;
    *(_OWORD *)buf = v17;
    long long v22 = v17;
    memset(&v20, 0, sizeof(v20));
    time_t v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataFile::open Failed to create %s\n", v9);
  }
  uint64_t v14 = 0;
  if (v9) {
    goto LABEL_18;
  }
LABEL_19:
  if (v7) {
    CFRelease(v7);
  }
  return v14;
}

__CFString *CCDataFile::generateFileName(CCDataFile *this, const char *a2)
{
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    io_connect_t v4 = "/Library/Logs/CoreCapture";
  }
  else {
    io_connect_t v4 = "/Library/Logs/CrashReporter/CoreCapture";
  }
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 512);
  CFStringAppendCString(Mutable, v4, 0);
  ++*((_DWORD *)this + 8);
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 9));
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 10));
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppendCString(Mutable, a2, 0);
  return Mutable;
}

uint64_t CCDataFile::rollFile(CCDataFile *this)
{
  return 1;
}

uint64_t CCFile::configureLogOptions()
{
  return 0;
}

uint64_t CCDataFile::closeFile(CCDataFile *this)
{
  *((_DWORD *)this + 9) = -1;
  return 1;
}

uint64_t CCDataFile::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)a1 + 64))(a1, a2, a3, a4, 0, 0);
}

uint64_t CCDataFile::writeLog(uint64_t a1)
{
  return 1;
}

uint64_t CCDataFile::openFile(CCDataFile *this, const char *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFStringRef v3 = (const __CFString *)(*(uint64_t (**)(CCDataFile *, const char *))(*(void *)this + 136))(this, a2);
  mkdirRecursive(v3);
  CFIndex Length = CFStringGetLength(v3);
  long long v5 = (char *)malloc_type_malloc(Length + 1, 0xCE9C643AuLL);
  CFIndex v6 = CFStringGetLength(v3);
  CFStringGetCString(v3, v5, v6 + 1, 0);
  uint64_t v7 = isSeedAndiOS();
  if (v7)
  {
    if (!deviceUnlockedSinceBoot(v7, v8))
    {
      *((_DWORD *)this + 9) = -1;
      goto LABEL_9;
    }
    int v9 = open_dprotected_np(v5, 514, 3, 0, 420);
  }
  else
  {
    int v9 = creat(v5, 0x1A4u);
  }
  *((_DWORD *)this + 9) = v9;
  if (v9 != -1)
  {
    uint64_t v10 = 1;
    if (!v3) {
      goto LABEL_17;
    }
LABEL_16:
    CFRelease(v3);
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v5;
    long long v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v5;
    long long v12 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "CCDataFile::open Failed to create %s\n", buf, 0xCu);
LABEL_13:
  if (glog_fd)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v23 = v13;
    long long v24 = v13;
    long long v21 = v13;
    long long v22 = v13;
    long long v19 = v13;
    long long v20 = v13;
    *(_OWORD *)buf = v13;
    long long v18 = v13;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataFile::open Failed to create %s\n", v5);
  }
  uint64_t v10 = 0;
  if (v3) {
    goto LABEL_16;
  }
LABEL_17:
  if (v5) {
    free(v5);
  }
  return v10;
}

uint64_t CCDataFile::ccfree(CCDataFile *this)
{
  uint64_t result = CCFile::freeResources(this);
  if (this)
  {
    CFStringRef v3 = *(uint64_t (**)(CCDataFile *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

void CCDataFile::~CCDataFile(void *this)
{
  if (this) {
    free(this);
  }
}

CCFile *CCDataFile::withRegistryEntry(CCDataFile *this)
{
  uint64_t v2 = (CCFile *)malloc_type_malloc(0x70uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v2 + 8) = 0u;
  *(_OWORD *)((char *)v2 + 24) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *((void *)v2 + 13) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)uint64_t v2 = &unk_26BD71680;
  if (!CCFile::initWithRegistryEntry(v2, this))
  {
    (*(void (**)(CCFile *))(*(void *)v2 + 48))(v2);
    return 0;
  }
  return v2;
}

uint64_t CCOSSerializeWithIOReporterFormatter::initWithRegistryEntry(CCOSSerializeWithIOReporterFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCOSSerializeWithIOReporterFormatter::getFormatterFileExtension(CCOSSerializeWithIOReporterFormatter *this)
{
  return "xml";
}

uint64_t CCOSSerializeWithIOReporterFormatter::writeCommentEntry()
{
  return 0;
}

CFIndex CCOSSerializeWithIOReporterFormatter::writeLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (a5)
  {
    long long v12 = (char *)malloc_type_malloc(a6 + a4, 0x952164F1uLL);
    memcpy(v12, a3, a4);
    memcpy(&v12[a4], a5, a6);
    a3 = v12;
  }
  else
  {
    long long v12 = 0;
  }
  CFStringRef errorString = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  CFArrayRef v13 = (const __CFArray *)IOCFUnserialize((const char *)a3, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &errorString);
  if (!v13)
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = CStringPtr;
        long long v19 = v17;
LABEL_50:
        _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "Error: %s", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v38 = CFStringGetCStringPtr(errorString, 0);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v38;
      long long v19 = &_os_log_internal;
      goto LABEL_50;
    }
    if (glog_fd)
    {
      *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v47 = v22;
      long long v48 = v22;
      long long v45 = v22;
      long long v46 = v22;
      long long v43 = v22;
      long long v44 = v22;
      *(_OWORD *)buf = v22;
      *(_OWORD *)&uint8_t buf[16] = v22;
      memset(&v40, 0, sizeof(v40));
      time_t v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      int v23 = glog_fd;
      long long v24 = CFStringGetCStringPtr(errorString, 0);
      dprintf(v23, "Error: %s", v24);
    }
    CFDataRef Data = 0;
    goto LABEL_33;
  }
  uint64_t v14 = CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray(a1, v13, a2);
  CFTypeID v15 = CFGetTypeID(v14);
  if (v15 == CFArrayGetTypeID())
  {
    CFDataRef Data = CFPropertyListCreateData(0, v14, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!v14) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v20 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    long long v21 = v20;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    long long v21 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog unsupported root type for JSON Serialization", buf, 2u);
LABEL_19:
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v47 = v25;
    long long v48 = v25;
    long long v45 = v25;
    long long v46 = v25;
    long long v43 = v25;
    long long v44 = v25;
    *(_OWORD *)buf = v25;
    *(_OWORD *)&uint8_t buf[16] = v25;
    memset(&v40, 0, sizeof(v40));
    time_t v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog unsupported root type for JSON Serialization");
  }
  CFDataRef Data = 0;
  if (v14) {
LABEL_22:
  }
    CFRelease(v14);
LABEL_23:
  if (!Data || (BytePtr = CFDataGetBytePtr(Data)) == 0)
  {
    uint64_t v31 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      long long v32 = v31;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      long long v32 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog CFDataGetBytePtr() failed", buf, 2u);
LABEL_31:
    if (glog_fd)
    {
      *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v47 = v33;
      long long v48 = v33;
      long long v45 = v33;
      long long v46 = v33;
      long long v43 = v33;
      long long v44 = v33;
      *(_OWORD *)buf = v33;
      *(_OWORD *)&uint8_t buf[16] = v33;
      memset(&v40, 0, sizeof(v40));
      time_t v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog CFDataGetBytePtr() failed");
    }
LABEL_33:
    CFIndex v30 = 0;
    goto LABEL_34;
  }
  long long v27 = BytePtr;
  CFIndex Length = CFDataGetLength(Data);
  uint64_t v29 = (*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(void *)a1 + 112))(a1, v27, Length);
  if (v29 == Length)
  {
    CFIndex v30 = Length;
    goto LABEL_34;
  }
  CFIndex v30 = v29;
  uint64_t v35 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v30;
    uint64_t v36 = v35;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v30;
    uint64_t v36 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_45:
  if (glog_fd)
  {
    *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v47 = v37;
    long long v48 = v37;
    long long v45 = v37;
    long long v46 = v37;
    long long v43 = v37;
    long long v44 = v37;
    *(_OWORD *)buf = v37;
    *(_OWORD *)&uint8_t buf[16] = v37;
    memset(&v40, 0, sizeof(v40));
    time_t v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", Length, v30);
  }
LABEL_34:
  if (v12) {
    free(v12);
  }
  if (Data) {
    CFRelease(Data);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v30;
}

__CFArray *CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray(int a1, const __CFArray *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF70]);
  for (CFIndex i = 0; i < CFArrayGetCount(a2); ++i)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
    if (!ValueAtIndex || (CFDictionaryRef v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 != CFDictionaryGetTypeID()))
    {
      uint64_t v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = i;
          CFArrayRef v13 = v12;
          goto LABEL_16;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = i;
        CFArrayRef v13 = &_os_log_internal;
LABEL_16:
        _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray  didnt find or wrong type in array at i %ld\n", buf, 0xCu);
      }
      if (glog_fd)
      {
        *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v24 = v14;
        long long v25 = v14;
        long long v22 = v14;
        long long v23 = v14;
        long long v20 = v14;
        long long v21 = v14;
        *(_OWORD *)buf = v14;
        long long v19 = v14;
        memset(&v17, 0, sizeof(v17));
        time_t v16 = 0xAAAAAAAAAAAAAAAALL;
        time(&v16);
        localtime_r(&v16, &v17);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray  didnt find or wrong type in array at i %ld\n", i);
      }
      return Mutable;
    }
    DictionaryWithProcessedIOReporter = CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter(a1, v9, a3);
    CFArrayAppendValue(Mutable, DictionaryWithProcessedIOReporter);
    if (DictionaryWithProcessedIOReporter) {
      CFRelease(DictionaryWithProcessedIOReporter);
    }
  }
  return Mutable;
}

__CFDictionary *CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theDict);
  if (MutableCopy)
  {
    int v6 = CFDictionaryContainsKey(theDict, @"CCIOReportInterests");
    if (v6 == CFDictionaryContainsKey(theDict, @"CCIOReportRdata"))
    {
      int Value = CFDictionaryGetValue(theDict, @"CCIOReportRdata");
      if (Value)
      {
        uint64_t v8 = Value;
        CFTypeID v9 = CFGetTypeID(Value);
        CFTypeID TypeID = CFDataGetTypeID();
        if (v9 != TypeID) {
          uint64_t v8 = 0;
        }
        uint64_t v11 = CFDictionaryGetValue(theDict, @"CCIOReportInterests");
        if (!v11)
        {
          if (v9 != TypeID) {
            return MutableCopy;
          }
          goto LABEL_33;
        }
        uint64_t v12 = v11;
      }
      else
      {
        long long v18 = CFDictionaryGetValue(theDict, @"CCIOReportInterests");
        if (!v18) {
          return MutableCopy;
        }
        uint64_t v12 = v18;
        uint64_t v8 = 0;
      }
      CFTypeID v19 = CFGetTypeID(v12);
      if (v19 == CFArrayGetTypeID()) {
        CFArrayRef v20 = (const __CFArray *)v12;
      }
      else {
        CFArrayRef v20 = 0;
      }
      if (v8 && v20)
      {
        CFErrorRef err = 0;
        Aggregate = (CCOSSerializeWithIOReporterFormatter *)IOReportCreateAggregate();
        if (Aggregate)
        {
          long long v22 = Aggregate;
          if (CCOSSerializeWithIOReporterFormatter::convertInterestsArrayToIOReportLegend(Aggregate, Aggregate, v20))goto LABEL_26; {
          CFDictionaryRef SamplesRaw = (const __CFDictionary *)IOReportCreateSamplesRaw();
          }
          long long v23 = SamplesRaw;
          if (SamplesRaw && CFDictionaryGetCount(SamplesRaw))
          {
LABEL_59:
            if (a3) {
              uint64_t v37 = *(void *)(a3 + 28) & 0xFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v37 = 0;
            }
            addSystemInformationToDict(v23, v37);
            if (v23)
            {
              CFDictionarySetValue(MutableCopy, @"IOReporter", v23);
              CFRelease(v22);
              goto LABEL_64;
            }
LABEL_26:
            long long v23 = v22;
LABEL_64:
            CFRelease(v23);
            CFDictionaryRemoveValue(MutableCopy, @"CCIOReportRkey");
            CFDictionaryRemoveValue(MutableCopy, @"CCIOReportRdata");
            CFDictionaryRemoveValue(MutableCopy, @"CCIOReportInterests");
            return MutableCopy;
          }
          long long v57 = xmmword_209961C78;
          long long v58 = unk_209961C88;
          long long v59 = xmmword_209961C98;
          long long v60 = unk_209961CA8;
          long long v53 = xmmword_209961C38;
          long long v54 = unk_209961C48;
          long long v55 = xmmword_209961C58;
          long long v56 = unk_209961C68;
          long long v49 = xmmword_209961BF8;
          long long v50 = unk_209961C08;
          long long v51 = xmmword_209961C18;
          long long v52 = unk_209961C28;
          *(_OWORD *)long long buffer = *(_OWORD *)"<unknown>";
          memset(&buffer[16], 0, 32);
          long long v48 = unk_209961BE8;
          uint64_t v34 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_57;
            }
            *(_DWORD *)uint64_t v42 = 136315138;
            *(void *)&v42[4] = buffer;
            uint64_t v35 = v34;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_57;
            }
            *(_DWORD *)uint64_t v42 = 136315138;
            *(void *)&v42[4] = buffer;
            uint64_t v35 = &_os_log_internal;
          }
          _os_log_error_impl(&dword_209928000, v35, OS_LOG_TYPE_ERROR, "IOReportCreateSamplesRaw() returned 0 sized dictionary %s", v42, 0xCu);
LABEL_57:
          if (glog_fd)
          {
            *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v45 = v36;
            long long v46 = v36;
            long long v43 = v36;
            long long v44 = v36;
            *(_OWORD *)&v42[32] = v36;
            *(_OWORD *)&v42[48] = v36;
            *(_OWORD *)uint64_t v42 = v36;
            *(_OWORD *)&v42[16] = v36;
            memset(&v40, 0, sizeof(v40));
            time_t v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime(v42, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", v42);
            dprintf(glog_fd, "IOReportCreateSamplesRaw() returned 0 sized dictionary %s", buffer);
          }
          goto LABEL_59;
        }
        uint64_t v28 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)long long buffer = 136315394;
          *(void *)&buffer[4] = "createDictionaryWithProcessedIOReporter";
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = 116;
          uint64_t v29 = v28;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)long long buffer = 136315394;
          *(void *)&buffer[4] = "createDictionaryWithProcessedIOReporter";
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = 116;
          uint64_t v29 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "%s@%d: bail - !legend\n", buffer, 0x12u);
LABEL_46:
        if (glog_fd)
        {
          *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v51 = v32;
          long long v52 = v32;
          long long v49 = v32;
          long long v50 = v32;
          *(_OWORD *)&buffer[32] = v32;
          long long v48 = v32;
          *(_OWORD *)long long buffer = v32;
          *(_OWORD *)&char buffer[16] = v32;
          memset(v42, 0, 56);
          *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v40.tm_sec);
          localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
          strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
          dprintf(glog_fd, "%s ", buffer);
          dprintf(glog_fd, "%s@%d: bail - !legend\n");
        }
        return MutableCopy;
      }
      if ((v8 != 0) == (v20 != 0)) {
        return MutableCopy;
      }
LABEL_33:
      uint64_t v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        *(_WORD *)long long buffer = 0;
        long long v27 = v26;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        *(_WORD *)long long buffer = 0;
        long long v27 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v27, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  rawData or interests not available\n", buffer, 2u);
LABEL_40:
      if (glog_fd)
      {
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v51 = v30;
        long long v52 = v30;
        long long v49 = v30;
        long long v50 = v30;
        *(_OWORD *)&buffer[32] = v30;
        long long v48 = v30;
        *(_OWORD *)long long buffer = v30;
        *(_OWORD *)&char buffer[16] = v30;
        memset(v42, 0, 56);
        *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v40.tm_sec);
        localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
        strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
        dprintf(glog_fd, "%s ", buffer);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  rawData or interests not available\n");
      }
      return MutableCopy;
    }
    uint64_t v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)long long buffer = 136315906;
      *(void *)&buffer[4] = "CCIOReportInterests";
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = CFDictionaryContainsKey(theDict, @"CCIOReportInterests");
      *(_WORD *)&buffer[18] = 2080;
      *(void *)&buffer[20] = "CCIOReportRdata";
      *(_WORD *)&buffer[28] = 1024;
      *(_DWORD *)&buffer[30] = CFDictionaryContainsKey(theDict, @"CCIOReportRdata");
      time_t v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)long long buffer = 136315906;
      *(void *)&buffer[4] = "CCIOReportInterests";
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = CFDictionaryContainsKey(theDict, @"CCIOReportInterests");
      *(_WORD *)&buffer[18] = 2080;
      *(void *)&buffer[20] = "CCIOReportRdata";
      *(_WORD *)&buffer[28] = 1024;
      *(_DWORD *)&buffer[30] = CFDictionaryContainsKey(theDict, @"CCIOReportRdata");
      time_t v16 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  contains %s %d contains %s %d\n", buffer, 0x22u);
LABEL_28:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v51 = v24;
      long long v52 = v24;
      long long v49 = v24;
      long long v50 = v24;
      *(_OWORD *)&buffer[32] = v24;
      long long v48 = v24;
      *(_OWORD *)long long buffer = v24;
      *(_OWORD *)&char buffer[16] = v24;
      memset(v42, 0, 56);
      *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
      dprintf(glog_fd, "%s ", buffer);
      int v25 = glog_fd;
      CFDictionaryContainsKey(theDict, @"CCIOReportInterests");
      CFDictionaryContainsKey(theDict, @"CCIOReportRdata");
      dprintf(v25, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  contains %s %d contains %s %d\n");
    }
    return MutableCopy;
  }
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)long long buffer = 0;
    long long v14 = v13;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)long long buffer = 0;
    long long v14 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  failed to duplicate dictionary\n", buffer, 2u);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v51 = v17;
    long long v52 = v17;
    long long v49 = v17;
    long long v50 = v17;
    *(_OWORD *)&buffer[32] = v17;
    long long v48 = v17;
    *(_OWORD *)long long buffer = v17;
    *(_OWORD *)&char buffer[16] = v17;
    memset(v42, 0, 56);
    *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v40.tm_sec);
    localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  failed to duplicate dictionary\n", v38);
  }
  return MutableCopy;
}

uint64_t CCOSSerializeWithIOReporterFormatter::convertInterestsArrayToIOReportLegend(CCOSSerializeWithIOReporterFormatter *this, __CFDictionary *a2, CFArrayRef theArray)
{
  CFIndex v5 = 0;
  uint64_t v29 = *MEMORY[0x263EF8340];
  while (1)
  {
    if (CFArrayGetCount(theArray) <= v5) {
      return 0;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v5);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v7 = ValueAtIndex;
    CFTypeID v8 = CFGetTypeID(ValueAtIndex);
    CFTypeID TypeID = (CCOSSerializeWithIOReporterFormatter *)CFDictionaryGetTypeID();
    if ((CCOSSerializeWithIOReporterFormatter *)v8 != TypeID) {
      break;
    }
    uint64_t v10 = CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup(TypeID, a2, v7);
    ++v5;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v13 = v12;
          goto LABEL_23;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = &_os_log_internal;
LABEL_23:
        _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  failed to store Channel Description\n", buf, 2u);
      }
      if (glog_fd)
      {
        *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v27 = v17;
        long long v28 = v17;
        long long v25 = v17;
        long long v26 = v17;
        long long v23 = v17;
        long long v24 = v17;
        *(_OWORD *)buf = v17;
        long long v22 = v17;
        memset(&v20, 0, sizeof(v20));
        time_t v19 = 0xAAAAAAAAAAAAAAAALL;
        time(&v19);
        localtime_r(&v19, &v20);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  failed to store Channel Description\n");
      }
      return v11;
    }
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  didnt find or not a dict in array\n", buf, 2u);
LABEL_14:
  uint64_t v11 = 3758097136;
  if (glog_fd)
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v16;
    long long v28 = v16;
    long long v25 = v16;
    long long v26 = v16;
    long long v23 = v16;
    long long v24 = v16;
    *(_OWORD *)buf = v16;
    long long v22 = v16;
    memset(&v20, 0, sizeof(v20));
    time_t v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  didnt find or not a dict in array\n");
  }
  return v11;
}

uint64_t CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup(CCOSSerializeWithIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict)
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  uint64_t v118 = 0;
  uint64_t valuePtr = 0;
  uint64_t v117 = 0;
  int Value = CFDictionaryGetValue(theDict, @"IOReportGroupName");
  if (!Value)
  {
    uint64_t v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportGroupName";
      CFTypeID v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportGroupName";
      CFTypeID v9 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v12;
      long long v126 = v12;
      long long v123 = v12;
      long long v124 = v12;
      long long v122 = v12;
      *(_OWORD *)&cStr[16] = v12;
      long long v121 = v12;
      *(_OWORD *)cStr = v12;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_16;
  }
  CFIndex v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 == CFStringGetTypeID())
  {
    int v7 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = CFGetTypeID(v5);
    uint64_t v11 = v10;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = CFGetTypeID(v5);
    uint64_t v11 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v11, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is %s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_14:
  if (glog_fd)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v125 = v13;
    long long v126 = v13;
    long long v123 = v13;
    long long v124 = v13;
    long long v122 = v13;
    *(_OWORD *)&cStr[16] = v13;
    long long v121 = v13;
    *(_OWORD *)cStr = v13;
    memset(&v116, 0, sizeof(v116));
    time_t v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    int v14 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v5);
    dprintf(v14, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is %s NULL, with type %ld, but has type %ld\n");
  }
LABEL_16:
  int v7 = -536870160;
LABEL_17:
  uint64_t v15 = CFDictionaryGetValue(theDict, @"IOReportSubGroupName");
  if (!v15)
  {
    uint64_t v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportSubGroupName";
      long long v23 = v22;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportSubGroupName";
      long long v23 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v24;
      long long v126 = v24;
      long long v123 = v24;
      long long v124 = v24;
      long long v122 = v24;
      *(_OWORD *)&cStr[16] = v24;
      long long v121 = v24;
      *(_OWORD *)cStr = v24;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_31;
  }
  long long v16 = v15;
  CFTypeID v17 = CFGetTypeID(v15);
  if (v17 == CFStringGetTypeID()) {
    goto LABEL_32;
  }
  uint64_t v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeID v20 = CFGetTypeID(v16);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = TypeID;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v20;
    long long v21 = v18;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    CFTypeID v103 = CFStringGetTypeID();
    CFTypeID v104 = CFGetTypeID(v16);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v103;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v104;
    long long v21 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_29:
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v125 = v25;
    long long v126 = v25;
    long long v123 = v25;
    long long v124 = v25;
    long long v122 = v25;
    *(_OWORD *)&cStr[16] = v25;
    long long v121 = v25;
    *(_OWORD *)cStr = v25;
    memset(&v116, 0, sizeof(v116));
    time_t v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    int v26 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v16);
    dprintf(v26, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_31:
  int v7 = -536870160;
LABEL_32:
  CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DriverID");
  if (v27)
  {
    CFNumberRef v28 = v27;
    CFTypeID v29 = CFGetTypeID(v27);
    if (v29 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v28, kCFNumberLongLongType, &valuePtr);
      if (valuePtr) {
        goto LABEL_54;
      }
      uint64_t v30 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)cStr = 0;
          uint64_t v31 = v30;
LABEL_158:
          _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n", cStr, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)cStr = 0;
        uint64_t v31 = &_os_log_internal;
        goto LABEL_158;
      }
      if (glog_fd)
      {
        *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v125 = v41;
        long long v126 = v41;
        long long v123 = v41;
        long long v124 = v41;
        long long v122 = v41;
        *(_OWORD *)&cStr[16] = v41;
        long long v121 = v41;
        *(_OWORD *)cStr = v41;
        memset(&v116, 0, sizeof(v116));
        time_t v115 = 0xAAAAAAAAAAAAAAAALL;
        time(&v115);
        localtime_r(&v115, &v116);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n");
      }
      int v7 = -536870911;
      goto LABEL_54;
    }
    uint64_t v34 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      CFTypeID v35 = CFNumberGetTypeID();
      CFTypeID v36 = CFGetTypeID(v28);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v35;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v36;
      uint64_t v37 = v34;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      CFTypeID v105 = CFNumberGetTypeID();
      CFTypeID v106 = CFGetTypeID(v28);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v105;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v106;
      uint64_t v37 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v37, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_48:
    int v7 = -536870160;
    if (glog_fd)
    {
      *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v39;
      long long v126 = v39;
      long long v123 = v39;
      long long v124 = v39;
      long long v122 = v39;
      *(_OWORD *)&cStr[16] = v39;
      long long v121 = v39;
      *(_OWORD *)cStr = v39;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      int v40 = glog_fd;
      CFNumberGetTypeID();
      CFGetTypeID(v28);
      dprintf(v40, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_54;
  }
  uint64_t v32 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)cStr = 0;
    long long v33 = v32;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)cStr = 0;
    long long v33 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v33, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n", cStr, 2u);
LABEL_45:
  int v7 = -536870160;
  if (glog_fd)
  {
    *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v125 = v38;
    long long v126 = v38;
    long long v123 = v38;
    long long v124 = v38;
    long long v122 = v38;
    *(_OWORD *)&cStr[16] = v38;
    long long v121 = v38;
    *(_OWORD *)cStr = v38;
    memset(&v116, 0, sizeof(v116));
    time_t v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n");
  }
LABEL_54:
  CFStringRef v42 = (const __CFString *)CFDictionaryGetValue(theDict, @"DriverName");
  if (!v42)
  {
    CFDictionaryRef v45 = IORegistryEntryIDMatching(valuePtr);
    if (v45)
    {
      uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v45);
      if (MatchingService)
      {
        *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v125 = v47;
        long long v126 = v47;
        long long v123 = v47;
        long long v124 = v47;
        long long v122 = v47;
        *(_OWORD *)&cStr[16] = v47;
        long long v121 = v47;
        *(_OWORD *)cStr = v47;
        MEMORY[0x210507450](MatchingService, cStr);
        CFStringRef v43 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0);
        goto LABEL_73;
      }
    }
    uint64_t v52 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)cStr = 0;
      long long v53 = v52;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)cStr = 0;
      long long v53 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v53, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n", cStr, 2u);
LABEL_70:
    if (glog_fd)
    {
      *(void *)&long long v56 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v56;
      long long v126 = v56;
      long long v123 = v56;
      long long v124 = v56;
      long long v122 = v56;
      *(_OWORD *)&cStr[16] = v56;
      long long v121 = v56;
      *(_OWORD *)cStr = v56;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n");
    }
    goto LABEL_72;
  }
  CFStringRef v43 = v42;
  CFTypeID v44 = CFGetTypeID(v42);
  if (v44 != CFStringGetTypeID())
  {
    uint64_t v48 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      CFTypeID v49 = CFStringGetTypeID();
      CFTypeID v50 = CFGetTypeID(v43);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v49;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v50;
      long long v51 = v48;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      CFTypeID v107 = CFStringGetTypeID();
      CFTypeID v108 = CFGetTypeID(v43);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v107;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v108;
      long long v51 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v51, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_67:
    if (glog_fd)
    {
      *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v54;
      long long v126 = v54;
      long long v123 = v54;
      long long v124 = v54;
      long long v122 = v54;
      *(_OWORD *)&cStr[16] = v54;
      long long v121 = v54;
      *(_OWORD *)cStr = v54;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      int v55 = glog_fd;
      CFStringGetTypeID();
      CFGetTypeID(v43);
      dprintf(v55, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj %s is NULL, with type %ld, but has type %ld\n");
    }
LABEL_72:
    CFStringRef v43 = 0;
    int v7 = -536870160;
    goto LABEL_73;
  }
  CFRetain(v43);
LABEL_73:
  long long v57 = CFDictionaryGetValue(theDict, @"IOReportChannelInfo");
  long long v58 = v57;
  if (!v57) {
    goto LABEL_81;
  }
  CFTypeID v59 = CFGetTypeID(v57);
  if (v59 == CFDictionaryGetTypeID()) {
    goto LABEL_81;
  }
  uint64_t v60 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_79;
    }
    CFTypeID v61 = CFDictionaryGetTypeID();
    CFTypeID v62 = CFGetTypeID(v58);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v61;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v62;
    long long v63 = v60;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_79;
    }
    CFTypeID v109 = CFDictionaryGetTypeID();
    CFTypeID v110 = CFGetTypeID(v58);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v109;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v110;
    long long v63 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v63, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_79:
  if (glog_fd)
  {
    *(void *)&long long v64 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v125 = v64;
    long long v126 = v64;
    long long v123 = v64;
    long long v124 = v64;
    long long v122 = v64;
    *(_OWORD *)&cStr[16] = v64;
    long long v121 = v64;
    *(_OWORD *)cStr = v64;
    memset(&v116, 0, sizeof(v116));
    time_t v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    int v65 = glog_fd;
    CFTypeID v66 = CFDictionaryGetTypeID();
    CFTypeID v67 = CFGetTypeID(v58);
    dprintf(v65, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", "IOReportChannelInfo", " NOT", v66, v67);
  }
LABEL_81:
  long long v68 = CFDictionaryGetValue(theDict, @"IOReportChannels");
  long long v69 = v68;
  if (!v68)
  {
    uint64_t v75 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportChannels";
      uint64_t v76 = v75;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportChannels";
      uint64_t v76 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v76, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_90:
    if (glog_fd)
    {
      *(void *)&long long v77 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v77 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v77;
      long long v126 = v77;
      long long v123 = v77;
      long long v124 = v77;
      long long v122 = v77;
      *(_OWORD *)&cStr[16] = v77;
      long long v121 = v77;
      *(_OWORD *)cStr = v77;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_95;
  }
  CFTypeID v70 = CFGetTypeID(v68);
  if (v70 == CFArrayGetTypeID()) {
    goto LABEL_96;
  }
  uint64_t v71 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    CFTypeID v72 = CFArrayGetTypeID();
    CFTypeID v73 = CFGetTypeID(v69);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannels";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v72;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v73;
    long long v74 = v71;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    CFTypeID v111 = CFArrayGetTypeID();
    CFTypeID v112 = CFGetTypeID(v69);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannels";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v111;
    LOWORD(v121) = 2048;
    *(void *)((char *)&v121 + 2) = v112;
    long long v74 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v74, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_93:
  if (glog_fd)
  {
    *(void *)&long long v78 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v78 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v125 = v78;
    long long v126 = v78;
    long long v123 = v78;
    long long v124 = v78;
    long long v122 = v78;
    *(_OWORD *)&cStr[16] = v78;
    long long v121 = v78;
    *(_OWORD *)cStr = v78;
    memset(&v116, 0, sizeof(v116));
    time_t v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    int v79 = glog_fd;
    CFArrayGetTypeID();
    CFGetTypeID(v69);
    dprintf(v79, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n");
  }
LABEL_95:
  int v7 = -536870160;
LABEL_96:
  CFIndex v80 = 0;
  unsigned int v113 = v7;
  if (v7) {
    BOOL v81 = 0;
  }
  else {
    BOOL v81 = a2 != 0;
  }
  while (CFArrayGetCount((CFArrayRef)v69) > v80)
  {
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)v69, v80);
    if (!ValueAtIndex) {
      break;
    }
    CFArrayRef v83 = ValueAtIndex;
    CFTypeID v84 = CFGetTypeID(ValueAtIndex);
    if (v84 != CFArrayGetTypeID() || CFArrayGetCount(v83) < 2) {
      break;
    }
    CFNumberRef v85 = (const __CFNumber *)CFArrayGetValueAtIndex(v83, 0);
    if (v85)
    {
      CFNumberRef v86 = v85;
      CFTypeID v87 = CFGetTypeID(v85);
      if (v87 == CFNumberGetTypeID()) {
        CFNumberGetValue(v86, kCFNumberSInt64Type, &v118);
      }
    }
    CFNumberRef v88 = (const __CFNumber *)CFArrayGetValueAtIndex(v83, 1);
    if (v88)
    {
      CFNumberRef v89 = v88;
      CFTypeID v90 = CFGetTypeID(v88);
      if (v90 == CFNumberGetTypeID()) {
        CFNumberGetValue(v89, kCFNumberSInt64Type, &v117);
      }
    }
    v91 = CFArrayGetValueAtIndex(v83, 2);
    if (v91)
    {
      v92 = v91;
      CFTypeID v93 = CFGetTypeID(v91);
      if (v93 == CFStringGetTypeID()) {
        v94 = v92;
      }
      else {
        v94 = 0;
      }
    }
    else
    {
      v94 = 0;
    }
    uint64_t v96 = v118;
    uint64_t v95 = valuePtr;
    if (valuePtr) {
      BOOL v97 = v81;
    }
    else {
      BOOL v97 = 0;
    }
    uint64_t v98 = v117;
    if (v94 && v97 && v43 && v118 && v117)
    {
      IOReportAddChannelDescription();
      goto LABEL_129;
    }
    uint64_t v99 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_127;
      }
      *(_DWORD *)cStr = 67110400;
      *(_DWORD *)&cStr[4] = a2 != 0;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v95 != 0;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v43 != 0;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v96 != 0;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v98 != 0;
      LOWORD(v121) = 1024;
      *(_DWORD *)((char *)&v121 + 2) = v94 != 0;
      v100 = v99;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_127;
      }
      *(_DWORD *)cStr = 67110400;
      *(_DWORD *)&cStr[4] = a2 != 0;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v95 != 0;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v43 != 0;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v96 != 0;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v98 != 0;
      LOWORD(v121) = 1024;
      *(_DWORD *)((char *)&v121 + 2) = v94 != 0;
      v100 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v100, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", cStr, 0x26u);
LABEL_127:
    if (glog_fd)
    {
      *(void *)&long long v101 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v101 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v125 = v101;
      long long v126 = v101;
      long long v123 = v101;
      long long v124 = v101;
      long long v122 = v101;
      *(_OWORD *)&cStr[16] = v101;
      long long v121 = v101;
      *(_OWORD *)cStr = v101;
      memset(&v116, 0, sizeof(v116));
      time_t v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", a2 != 0, valuePtr != 0, v43 != 0, v118 != 0, v117 != 0, v94 != 0);
    }
LABEL_129:
    uint64_t v117 = 0;
    uint64_t v118 = 0;
    ++v80;
  }
  if (v43) {
    CFRelease(v43);
  }
  return v113;
}

void CCOSSerializeWithIOReporterFormatter::~CCOSSerializeWithIOReporterFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

char *CCOSSerializeWithIOReporterFormatter::withRegistryEntry(CCOSSerializeWithIOReporterFormatter *this)
{
  io_object_t v1 = this;
  uint64_t v2 = (char *)malloc_type_malloc(0x28uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)uint64_t v2 = &unk_26BD71758;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCOSSerializeWithIOReporterFormatter::writeLogPayload(CCOSSerializeWithIOReporterFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCOSSerializeWithIOReporterFormatter *, const char *))(*(void *)this + 112))(this, a2);
}

uint64_t CCDataPipeInterface::wakeupTapLoop(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::freeResources(uint64_t this)
{
  if (*(int *)(this + 80) >= 3)
  {
    uint64_t v1 = this;
    this = IOConnectCallScalarMethod(*(_DWORD *)(this + 88), 2u, 0, 0, 0, 0);
    *(_DWORD *)(v1 + 80) = 1;
  }
  return this;
}

CCPipeInterface *CCDataPipeInterface::withRegistryEntry(CCDataPipeInterface *this, CCTap *a2, CCTap *a3)
{
  io_registry_entry_t v4 = this;
  CFIndex v5 = (CCPipeInterface *)malloc_type_malloc(0x90uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v5 + 8) = 0u;
  *(_OWORD *)((char *)v5 + 24) = 0u;
  *(_OWORD *)((char *)v5 + 40) = 0u;
  *(_OWORD *)((char *)v5 + 56) = 0u;
  *(_OWORD *)((char *)v5 + 72) = 0u;
  *(_OWORD *)((char *)v5 + 88) = 0u;
  *(_OWORD *)((char *)v5 + 104) = 0u;
  *(_OWORD *)((char *)v5 + pthread_setname_np((const char *)this + 120) = 0u;
  *((void *)v5 + 17) = 0;
  *((_DWORD *)v5 + 2) = 1;
  *(void *)CFIndex v5 = &unk_26BD717F8;
  if ((CCPipeInterface::initWithRegistryEntry(v5, v4, a2) & 1) == 0)
  {
    (*(void (**)(CCPipeInterface *))(*(void *)v5 + 48))(v5);
    return 0;
  }
  return v5;
}

uint64_t CCDataPipeInterface::queryMetaData(uint64_t a1, void *inputStruct)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 0;
  size_t v3 = inputStruct[1] + 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 4u, 0, 0, inputStruct, 0x10uLL, 0, &outputCnt, inputStruct, &v3);
}

uint64_t CCDataPipeInterface::readData(uint64_t a1, void *inputStruct)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 0;
  size_t v3 = inputStruct[1] + 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 5u, 0, 0, inputStruct, 0x10uLL, 0, &outputCnt, inputStruct, &v3);
}

uint64_t CCDataPipeInterface::profileLoaded(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 6u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::profileRemoved(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 7u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::capture(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 8u, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
}

void CCDataTap::tapLoopImpl(CCDataTap *this)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 118;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      io_registry_entry_t v4 = v2;
LABEL_6:
      _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d CCDataTap::tapLoopImpl for entry:%u", buf, 0x18u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "tapLoopImpl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 118;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    io_registry_entry_t v4 = &_os_log_internal;
    goto LABEL_6;
  }
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v6;
    long long v26 = v6;
    long long v23 = v6;
    long long v24 = v6;
    long long v21 = v6;
    long long v22 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&uint8_t buf[16] = v6;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%d CCDataTap::tapLoopImpl for entry:%u", "tapLoopImpl", 118, *((_DWORD *)this + 4));
  }
  *((unsigned char *)this + 184) = 1;
  while (1)
  {
    uint64_t v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      CFTypeID v9 = v7;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v10 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v10;
      CFTypeID v9 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d processEvent for entry:%u", buf, 0x18u);
LABEL_16:
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v25 = v11;
      long long v26 = v11;
      long long v23 = v11;
      long long v24 = v11;
      long long v21 = v11;
      long long v22 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&uint8_t buf[16] = v11;
      memset(&v19, 0, sizeof(v19));
      time_t v18 = 0xAAAAAAAAAAAAAAAALL;
      time(&v18);
      localtime_r(&v18, &v19);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d processEvent for entry:%u", "tapLoopImpl", 124, *((_DWORD *)this + 4));
    }
    if (!CCDataTap::processEvent(this)) {
      break;
    }
    pthread_mutex_lock((pthread_mutex_t *)(*((void *)this + 8) + 16));
    int v12 = *((unsigned __int8 *)this + 56);
    pthread_mutex_unlock((pthread_mutex_t *)(*((void *)this + 8) + 16));
    if (v12) {
      break;
    }
    *((CFAbsoluteTime *)this + 24) = CFAbsoluteTimeGetCurrent();
    usleep(0x3E8u);
  }
  *((unsigned char *)this + 184) = 0;
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v14;
      uint64_t v15 = v13;
      goto LABEL_26;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    uint64_t v15 = &_os_log_internal;
LABEL_26:
    _os_log_impl(&dword_209928000, v15, OS_LOG_TYPE_DEFAULT, "CCDataTap::tapLoopImpl exit :%u Exiting taploop\n", buf, 8u);
  }
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v17;
    long long v26 = v17;
    long long v23 = v17;
    long long v24 = v17;
    long long v21 = v17;
    long long v22 = v17;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&uint8_t buf[16] = v17;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::tapLoopImpl exit :%u Exiting taploop\n", *((_DWORD *)this + 4));
  }
}

uint64_t CCDataTap::processEvent(CCDataTap *this)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t __dst = 0;
  uint64_t v66 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  unint64_t v62 = 0;
  if (*((unsigned char *)this + 96))
  {
    uint64_t result = 0;
    *((_WORD *)this + 48) = 256;
    return result;
  }
  if (*((unsigned char *)this + 97)) {
    return 0;
  }
  uint64_t v2 = isSeedAndiOS();
  if (v2 && (deviceUnlockedSinceBoot(v2, v3) & 1) == 0)
  {
    uint64_t v51 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_107;
      }
      *(_WORD *)buf = 0;
      uint64_t v52 = v51;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_107;
      }
      *(_WORD *)buf = 0;
      uint64_t v52 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v52, OS_LOG_TYPE_DEFAULT, "CCDataTap::processEvent() seed build and device hasn't been unlocked since boot - not processing event and waiting for the next.\n", buf, 2u);
LABEL_107:
    if (glog_fd)
    {
      *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v71 = v55;
      long long v72 = v55;
      long long v69 = v55;
      long long v70 = v55;
      *(_OWORD *)&unsigned char buf[32] = v55;
      long long v68 = v55;
      *(_OWORD *)buf = v55;
      *(_OWORD *)&uint8_t buf[16] = v55;
      memset(&v61, 0, sizeof(v61));
      time_t v60 = 0xAAAAAAAAAAAAAAAALL;
      time(&v60);
      localtime_r(&v60, &v61);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCDataTap::processEvent() seed build and device hasn't been unlocked since boot - not processing event and waiting for the next.\n");
    }
    return 0;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(0x1000uLL, 1uLL, 0xCD511FE5uLL);
  if (result)
  {
    int v5 = (void *)result;
    long long v6 = (const char *)(result + 16);
    *(void *)uint64_t result = result + 16;
    *(void *)(result + 8) = 4080;
    uint64_t v7 = (void *)*((void *)this + 8);
    if (v7) {
    long long v57 = v5;
    }
    if (!CCDataPipeInterface::queryMetaData((uint64_t)v7, v5))
    {
      CFTypeID v59 = 0;
      int v8 = 0;
      while (2)
      {
        uint64_t v9 = *(void *)v6;
        int v10 = v6 + 16;
        uint64_t v11 = *((void *)v6 + 1);
        switch(*(void *)v6)
        {
          case 0:
            uint64_t v30 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_67;
              }
              *(_WORD *)buf = 0;
              uint64_t v31 = v30;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_67;
              }
              *(_WORD *)buf = 0;
              uint64_t v31 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v31, OS_LOG_TYPE_DEFAULT, "Invalid Meta Key. Bail.", buf, 2u);
LABEL_67:
            if (glog_fd)
            {
              *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v32;
              long long v72 = v32;
              long long v69 = v32;
              long long v70 = v32;
              *(_OWORD *)&unsigned char buf[32] = v32;
              long long v68 = v32;
              *(_OWORD *)buf = v32;
              *(_OWORD *)&uint8_t buf[16] = v32;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Invalid Meta Key. Bail.");
            }
            unint64_t v33 = v62;
            if (!v62) {
              break;
            }
            uint64_t v34 = malloc_type_malloc(v62 + 16, 0x95CAC9C3uLL);
            *uint64_t v34 = v34 + 2;
            v34[1] = v33;
            BOOL v35 = __dst != 0;
            BOOL v36 = v8 != 0;
            if (v35 && v36) {
              uint64_t v37 = __dst;
            }
            else {
              uint64_t v37 = v63;
            }
            if (v35 && v36) {
              long long v38 = &v66;
            }
            else {
              long long v38 = &v64;
            }
            uint64_t v39 = *v38;
            int v40 = CCFile::withRegistryEntry((CCFile *)*((unsigned int *)this + 4));
            *((void *)this + 4) = v40;
            if (v40)
            {
              if (v41) {
                (*(void (**)(void *, const char *, const char *, uint64_t, uint64_t))(*(void *)v41 + 192))(v41, v8, v59, v37, v39);
              }
              unint64_t v42 = 0;
              while (1)
              {
                uint64_t v43 = coreCaptureOsLog;
                if (coreCaptureOsLog)
                {
                  if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    *(void *)&buf[4] = v8;
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = v59;
                    *(_WORD *)&buf[22] = 2048;
                    *(void *)&buf[24] = v37;
                    *(_WORD *)&unsigned char buf[32] = 2048;
                    *(void *)&buf[34] = v39;
                    CFTypeID v44 = v43;
LABEL_85:
                    _os_log_impl(&dword_209928000, v44, OS_LOG_TYPE_DEFAULT, "Session Name: %s, Blob Name: %s %llu.%llu\n", buf, 0x2Au);
                  }
                }
                else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = v8;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = v59;
                  *(_WORD *)&buf[22] = 2048;
                  *(void *)&buf[24] = v37;
                  *(_WORD *)&unsigned char buf[32] = 2048;
                  *(void *)&buf[34] = v39;
                  CFTypeID v44 = &_os_log_internal;
                  goto LABEL_85;
                }
                if (glog_fd)
                {
                  *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  long long v71 = v45;
                  long long v72 = v45;
                  long long v69 = v45;
                  long long v70 = v45;
                  *(_OWORD *)&unsigned char buf[32] = v45;
                  long long v68 = v45;
                  *(_OWORD *)buf = v45;
                  *(_OWORD *)&uint8_t buf[16] = v45;
                  memset(&v61, 0, sizeof(v61));
                  time_t v60 = 0xAAAAAAAAAAAAAAAALL;
                  time(&v60);
                  localtime_r(&v60, &v61);
                  strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
                  dprintf(glog_fd, "%s ", buf);
                  dprintf(glog_fd, "Session Name: %s, Blob Name: %s %llu.%llu\n", v8, v59, v37, v39);
                }
                long long v46 = this;
                long long v47 = (const void *)*((void *)this + 8);
                if (v47)
                {
                  if (v48) {
                    int Data = CCDataPipeInterface::readData((uint64_t)v48, v34);
                  }
                  else {
                    int Data = 0;
                  }
                  long long v46 = this;
                }
                else
                {
                  int Data = 0;
                }
                (*(void (**)(void, void, void, void, void, void))(**((void **)v46 + 4) + 64))(*((void *)v46 + 4), 0, *v34, v34[1], 0, 0);
                if (!Data)
                {
                  v42 += v34[1];
                  if (v42 < v62) {
                    continue;
                  }
                }
                (*(void (**)(void))(**((void **)this + 4) + 88))(*((void *)this + 4));
                (*(void (**)(void))(**((void **)this + 4) + 48))(*((void *)this + 4));
                *((void *)this + 4) = 0;
                CFTypeID v50 = v57;
                goto LABEL_113;
              }
            }
            uint64_t v53 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              CFTypeID v50 = v57;
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_111;
              }
              *(_WORD *)buf = 0;
              long long v54 = v53;
            }
            else
            {
              CFTypeID v50 = v57;
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_111;
              }
              *(_WORD *)buf = 0;
              long long v54 = &_os_log_internal;
            }
            _os_log_error_impl(&dword_209928000, v54, OS_LOG_TYPE_ERROR, "CCDataTap: Unable to create CCFile.\n", buf, 2u);
LABEL_111:
            if (glog_fd)
            {
              *(void *)&long long v56 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v56;
              long long v72 = v56;
              long long v69 = v56;
              long long v70 = v56;
              *(_OWORD *)&unsigned char buf[32] = v56;
              long long v68 = v56;
              *(_OWORD *)buf = v56;
              *(_OWORD *)&uint8_t buf[16] = v56;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "CCDataTap: Unable to create CCFile.\n");
            }
LABEL_113:
            free(v50);
            free(v34);
            return 1;
          case 1:
            uint64_t v12 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "processEvent";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 196;
                *(_WORD *)&buf[18] = 2048;
                *(void *)&buf[20] = v11;
                *(_WORD *)&buf[28] = 2080;
                *(void *)&buf[30] = v6 + 16;
                uint64_t v13 = v12;
LABEL_31:
                _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "Found SessionName: %s:%d %llu %s\n", buf, 0x26u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 196;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = v6 + 16;
              uint64_t v13 = &_os_log_internal;
              goto LABEL_31;
            }
            if (glog_fd)
            {
              *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v24;
              long long v72 = v24;
              long long v69 = v24;
              long long v70 = v24;
              *(_OWORD *)&unsigned char buf[32] = v24;
              long long v68 = v24;
              *(_OWORD *)buf = v24;
              *(_OWORD *)&uint8_t buf[16] = v24;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found SessionName: %s:%d %llu %s\n", "processEvent", 196, v11, v6 + 16);
            }
            long long v6 = &v10[v11];
            int v8 = v10;
            continue;
          case 2:
            memcpy(&__dst, v6 + 16, *((void *)v6 + 1));
            uint64_t v14 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_38;
              }
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 203;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = __dst;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v66;
              uint64_t v15 = v14;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_38;
              }
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 203;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = __dst;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v66;
              uint64_t v15 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v15, OS_LOG_TYPE_DEFAULT, "Found session timestamp: %s:%d %llu %llu.%llu\n", buf, 0x30u);
LABEL_38:
            if (glog_fd)
            {
              *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v25;
              long long v72 = v25;
              long long v69 = v25;
              long long v70 = v25;
              *(_OWORD *)&unsigned char buf[32] = v25;
              long long v68 = v25;
              *(_OWORD *)buf = v25;
              *(_OWORD *)&uint8_t buf[16] = v25;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found session timestamp: %s:%d %llu %llu.%llu\n");
            }
            goto LABEL_60;
          case 3:
            uint64_t v20 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_53;
              }
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 209;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = v6 + 16;
              long long v21 = v20;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_53;
              }
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 209;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = v6 + 16;
              long long v21 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v21, OS_LOG_TYPE_DEFAULT, "Found blob name: %s:%d %llu %s\n", buf, 0x26u);
LABEL_53:
            long long v6 = &v10[v11];
            CFTypeID v59 = v10;
            if (glog_fd)
            {
              *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v28;
              long long v72 = v28;
              long long v69 = v28;
              long long v70 = v28;
              *(_OWORD *)&unsigned char buf[32] = v28;
              long long v68 = v28;
              *(_OWORD *)buf = v28;
              *(_OWORD *)&uint8_t buf[16] = v28;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob name: %s:%d %llu %s\n", "processEvent", 209, v11, v10);
              CFTypeID v59 = v10;
            }
            continue;
          case 4:
            memcpy(&v63, v6 + 16, *((void *)v6 + 1));
            uint64_t v16 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_43;
              }
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 215;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v63;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v64;
              long long v17 = v16;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_43;
              }
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 215;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v63;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v64;
              long long v17 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "Found blob timestamp: %s:%d %llu %llu.%llu\n", buf, 0x30u);
LABEL_43:
            if (glog_fd)
            {
              *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v26;
              long long v72 = v26;
              long long v69 = v26;
              long long v70 = v26;
              *(_OWORD *)&unsigned char buf[32] = v26;
              long long v68 = v26;
              *(_OWORD *)buf = v26;
              *(_OWORD *)&uint8_t buf[16] = v26;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob timestamp: %s:%d %llu %llu.%llu\n");
            }
            goto LABEL_60;
          case 5:
            memcpy(&v62, v6 + 16, *((void *)v6 + 1));
            uint64_t v22 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_58;
              }
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 221;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v62;
              long long v23 = v22;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_58;
              }
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 221;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v11;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v62;
              long long v23 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "Found blob length: %s:%d %llu %zu\n", buf, 0x26u);
LABEL_58:
            if (glog_fd)
            {
              *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v29;
              long long v72 = v29;
              long long v69 = v29;
              long long v70 = v29;
              *(_OWORD *)&unsigned char buf[32] = v29;
              long long v68 = v29;
              *(_OWORD *)buf = v29;
              *(_OWORD *)&uint8_t buf[16] = v29;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob length: %s:%d %llu %zu\n");
            }
LABEL_60:
            long long v6 = &v10[v11];
            continue;
          default:
            uint64_t v18 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_48;
              }
              *(_DWORD *)buf = 134218498;
              *(void *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "processEvent";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 225;
              tm v19 = v18;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_48;
              }
              *(_DWORD *)buf = 134218498;
              *(void *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "processEvent";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 225;
              tm v19 = &_os_log_internal;
            }
            _os_log_impl(&dword_209928000, v19, OS_LOG_TYPE_DEFAULT, "Unknown type: %llu %s:%d\n", buf, 0x1Cu);
LABEL_48:
            v6 += 16;
            if (glog_fd)
            {
              *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v71 = v27;
              long long v72 = v27;
              long long v69 = v27;
              long long v70 = v27;
              *(_OWORD *)&unsigned char buf[32] = v27;
              long long v68 = v27;
              *(_OWORD *)buf = v27;
              *(_OWORD *)&uint8_t buf[16] = v27;
              memset(&v61, 0, sizeof(v61));
              time_t v60 = 0xAAAAAAAAAAAAAAAALL;
              time(&v60);
              localtime_r(&v60, &v61);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v61);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Unknown type: %llu %s:%d\n", v9, "processEvent", 225);
              long long v6 = v10;
            }
            continue;
        }
        break;
      }
    }
    free(v57);
    return 0;
  }
  return result;
}

uint64_t _dataTapInterestCallback_dext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending) {
    return (*(uint64_t (**)(void))(*(void *)result + 144))();
  }
  return result;
}

uint64_t _dataTapInterestCallback_kext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending) {
    return (*(uint64_t (**)(void))(*(void *)result + 144))();
  }
  return result;
}

uint64_t CCDataTap::capture(uint64_t a1, const void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    uint64_t v7 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v8 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    uint64_t v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v9;
    uint64_t v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCDataTap::capture, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v10;
    long long v26 = v10;
    long long v23 = v10;
    long long v24 = v10;
    long long v21 = v10;
    long long v22 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&uint8_t buf[16] = v10;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    int v11 = glog_fd;
    uint64_t v12 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    uint64_t v13 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v11, "CCDataTap::capture, Owner: %s, Name: %s\n", v12, v13);
  }
  uint64_t v14 = *(const void **)(a1 + 64);
  if (v14) {
  else
  }
    uint64_t v15 = 0;
  *(CFAbsoluteTime *)(a1 + 192) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(a1 + 184) = 1;
  if (v15) {
    uint64_t v16 = IOConnectCallMethod(v15[22], 8u, 0, 0, a2, 0x90uLL, 0, 0, 0, 0);
  }
  else {
    uint64_t v16 = 0;
  }
  *(CFAbsoluteTime *)(a1 + 192) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(a1 + 184) = 0;
  return v16;
}

uint64_t CCDataTap::profileLoaded(CFStringRef *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    uint64_t v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v4;
    int v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    long long v6 = CFStringGetCStringPtr(this[5], 0);
    uint64_t v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v7;
    int v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::profileLoaded, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v8;
    long long v23 = v8;
    long long v20 = v8;
    long long v21 = v8;
    long long v18 = v8;
    long long v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    int v9 = glog_fd;
    long long v10 = CFStringGetCStringPtr(this[5], 0);
    int v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCDataTap::profileLoaded, Owner: %s, Name: %s\n", v10, v11);
  }
  CFStringRef v12 = this[8];
  if (v12)
  {
    if (v13) {
      IOConnectCallMethod(v13[22], 6u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return 0;
}

uint64_t CCDataTap::isActive(CCDataTap *this, CFAbsoluteTime a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 184))
  {
    if (CFAbsoluteTimeGetCurrent() - *((double *)this + 24) >= a2) {
      return 0;
    }
    uint64_t v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      int v9 = v7;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v13 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      int v9 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCDataTap::isActive idle < duration  3 entry:%u duration:%f\n", buf, 0x12u);
LABEL_18:
    if (glog_fd)
    {
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v14;
      long long v23 = v14;
      long long v20 = v14;
      long long v21 = v14;
      long long v18 = v14;
      long long v19 = v14;
      *(_OWORD *)buf = v14;
      *(_OWORD *)&uint8_t buf[16] = v14;
      memset(&v16, 0, sizeof(v16));
      time_t v15 = 0xAAAAAAAAAAAAAAAALL;
      time(&v15);
      localtime_r(&v15, &v16);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCDataTap::isActive idle < duration  3 entry:%u duration:%f\n");
    }
    return 1;
  }
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v4 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    int v5 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v10 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    int v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::isActive tap is fBusy Active 2 entry:%u\n", buf, 8u);
LABEL_12:
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v11;
    long long v23 = v11;
    long long v20 = v11;
    long long v21 = v11;
    long long v18 = v11;
    long long v19 = v11;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::isActive tap is fBusy Active 2 entry:%u\n");
  }
  return 1;
}

uint64_t CCDataTap::ccfree(CCDataTap *this)
{
  uint64_t result = CCTap::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCDataTap *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

CCDataTap *CCDataTap::withRegistryEntry(CCDataTap *this)
{
  uint64_t v2 = (CCDataTap *)malloc_type_malloc(0xC8uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v2 + 8) = 0u;
  *(_OWORD *)((char *)v2 + 24) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *(_OWORD *)((char *)v2 + 104) = 0u;
  *(_OWORD *)((char *)v2 + pthread_setname_np((const char *)this + 120) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *(_OWORD *)((char *)v2 + 152) = 0u;
  *(_OWORD *)((char *)v2 + 168) = 0u;
  *(_OWORD *)((char *)v2 + 184) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)uint64_t v2 = &unk_26BD718C0;
  if ((CCDataTap::initWithRegistryEntry(v2, this, v3) & 1) == 0)
  {
    (*(void (**)(CCDataTap *))(*(void *)v2 + 48))(v2);
    return 0;
  }
  return v2;
}

ssize_t CCFile::doWrite(CCFile *this, void *a2, size_t a3)
{
  return write(*((_DWORD *)this + 9), a2, a3);
}

void CCFile::captureLogRun(CFStringRef *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(this[6]);
  uint64_t v3 = (char *)malloc_type_malloc(Length + 1, 0x9B379E20uLL);
  CFStringRef v4 = this[6];
  CFIndex v5 = CFStringGetLength(v4);
  CFStringGetCString(v4, v3, v5 + 1, 0);
  long long v6 = opendir(v3);
  if (v3) {
    free(v3);
  }
  CFIndex v7 = CFStringGetLength(this[5]);
  int v8 = (char *)malloc_type_malloc(v7 + 1, 0x86CCC2DFuLL);
  CFStringRef v9 = this[5];
  CFIndex v10 = CFStringGetLength(v9);
  CFStringGetCString(v9, v8, v10 + 1, 0);
  uint64_t v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v8;
    CFStringRef v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v8;
    CFStringRef v12 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun Current File %s\n", buf, 0xCu);
LABEL_9:
  if (glog_fd)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v13;
    long long v30 = v13;
    long long v27 = v13;
    long long v28 = v13;
    long long v25 = v13;
    long long v26 = v13;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    memset(&v23, 0, sizeof(v23));
    time_t v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    localtime_r(&v22, &v23);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::captureLogRun Current File %s\n", v8);
  }
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          long long v14 = readdir(v6);
          if (!v14) {
            goto LABEL_24;
          }
          d_name = v14->d_name;
        }
        while (v14->d_name[0] == 46);
        if (!strcmp(v8, d_name)) {
          break;
        }
        ((void (*)(CFStringRef *, const char *))(*this)[3].isa)(this, d_name);
      }
      uint64_t v16 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = d_name;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v8;
          long long v17 = v16;
LABEL_21:
          _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun Skipping current file Dir file %s, Current File %s\n", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = d_name;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v8;
        long long v17 = &_os_log_internal;
        goto LABEL_21;
      }
      if (glog_fd)
      {
        *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v29 = v18;
        long long v30 = v18;
        long long v27 = v18;
        long long v28 = v18;
        long long v25 = v18;
        long long v26 = v18;
        *(_OWORD *)buf = v18;
        *(_OWORD *)&uint8_t buf[16] = v18;
        memset(&v23, 0, sizeof(v23));
        time_t v22 = 0xAAAAAAAAAAAAAAAALL;
        time(&v22);
        localtime_r(&v22, &v23);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCFile::captureLogRun Skipping current file Dir file %s, Current File %s\n", d_name, v8);
      }
    }
  }
LABEL_24:
  if (v8) {
    free(v8);
  }
  if (v6) {
    closedir(v6);
  }
  ((void (*)(CFStringRef *))(*this)[5].isa)(this);
  uint64_t v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    long long v20 = v19;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    long long v20 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v20, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun() Exiting CCFile::captureLogRun \n", buf, 2u);
LABEL_34:
  if (glog_fd)
  {
    *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v21;
    long long v30 = v21;
    long long v27 = v21;
    long long v28 = v21;
    long long v25 = v21;
    long long v26 = v21;
    *(_OWORD *)buf = v21;
    *(_OWORD *)&uint8_t buf[16] = v21;
    memset(&v23, 0, sizeof(v23));
    time_t v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    localtime_r(&v22, &v23);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::captureLogRun() Exiting CCFile::captureLogRun \n");
  }
}

__CFString *CCFile::generateCaptureDirPath(CFStringRef *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    int v8 = "/Library/Logs/CoreCapture";
  }
  else {
    int v8 = "/Library/Logs/CrashReporter/CoreCapture";
  }
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 512);
  CFStringAppendCString(Mutable, v8, 0);
  CFStringAppendCString(Mutable, "/", 0);
  if (CFStringGetLength(a1[12]))
  {
    CFStringAppend(Mutable, a1[12]);
    CFStringAppendCString(Mutable, "/", 0);
  }
  size_t v10 = strlen(a2) + 128;
  uint64_t v11 = (char *)malloc_type_malloc(v10, 0x8118ACF8uLL);
  if (v11)
  {
    CFStringRef v12 = v11;
    memset(v19, 0, 56);
    *(void *)&v18.int tm_sec = a3;
    localtime_r((const time_t *)&v18.tm_sec, (tm *)v19);
    snprintf(v12, v10, "[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", *(_DWORD *)&v19[20] + 1900, *(_DWORD *)&v19[16] + 1, *(_DWORD *)&v19[12], *(_DWORD *)&v19[8], *(_DWORD *)&v19[4], *(_DWORD *)v19, a4, a2);
    CFStringAppendCString(Mutable, v12, 0);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppendCString(Mutable, "Data", 0);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppend(Mutable, a1[9]);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppend(Mutable, a1[10]);
    CFStringAppendCString(Mutable, "/", 0);
    free(v12);
    return Mutable;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v19 = 0;
      long long v14 = v13;
LABEL_19:
      _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCFile::generateCaptureDirPath failed malloc\n", v19, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v19 = 0;
    long long v14 = &_os_log_internal;
    goto LABEL_19;
  }
  if (glog_fd)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v15;
    long long v23 = v15;
    long long v20 = v15;
    long long v21 = v15;
    *(_OWORD *)&v19[32] = v15;
    *(_OWORD *)&v19[48] = v15;
    *(_OWORD *)uint64_t v19 = v15;
    *(_OWORD *)&_OWORD v19[16] = v15;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(v19, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", v19);
    dprintf(glog_fd, "CCFile::generateCaptureDirPath failed malloc\n");
  }
  return 0;
}

uint64_t CCFile::isLogdirExists(CFStringRef *this)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(this[6]);
  uint64_t v3 = (char *)malloc_type_malloc(Length + 1, 0xF305885EuLL);
  CFStringRef v4 = this[6];
  CFIndex v5 = CFStringGetLength(v4);
  CFStringGetCString(v4, v3, v5 + 1, 0);
  memset(&v21, 0, sizeof(v21));
  if (stat(v3, &v21) && (mkdirRecursive(this[6]) & 1) == 0)
  {
    uint64_t v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v3;
      CFStringRef v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v3;
      CFStringRef v9 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCFile::isLogdirExists Failed to create  %s\n", buf, 0xCu);
LABEL_10:
    if (glog_fd)
    {
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v19 = v10;
      long long v20 = v10;
      long long v17 = v10;
      long long v18 = v10;
      long long v15 = v10;
      long long v16 = v10;
      *(_OWORD *)buf = v10;
      long long v14 = v10;
      memset(&v12, 0, sizeof(v12));
      time_t v11 = 0xAAAAAAAAAAAAAAAALL;
      time(&v11);
      localtime_r(&v11, &v12);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCFile::isLogdirExists Failed to create  %s\n", v3);
    }
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_4;
    }
    return v6;
  }
  uint64_t v6 = 1;
  if (v3) {
LABEL_4:
  }
    free(v3);
  return v6;
}

void CCFile::copyFile(CFStringRef *this, const char *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 512, this[6]);
  CFStringAppendCString(MutableCopy, "/", 0);
  CFStringAppendCString(MutableCopy, a2, 0);
  CFMutableStringRef v6 = CFStringCreateMutableCopy(v4, 512, this[7]);
  CFStringAppendCString(v6, "/", 0);
  CFStringAppendCString(v6, a2, 0);
  CFStringAppendCString(v6, ".gz", 0);
  int errnum = 0;
  CFIndex Length = CFStringGetLength(MutableCopy);
  uint64_t v8 = (char *)malloc_type_malloc(Length + 1, 0x999DAE98uLL);
  CFIndex v9 = CFStringGetLength(MutableCopy);
  CFStringGetCString(MutableCopy, v8, v9 + 1, 0);
  CFIndex v10 = CFStringGetLength(v6);
  time_t v11 = (std::__fs::filesystem::path *)malloc_type_malloc(v10 + 1, 0xB49C05FuLL);
  CFIndex v12 = CFStringGetLength(v6);
  CFStringGetCString(v6, (char *)v11, v12 + 1, 0);
  memset(&v53, 0, sizeof(v53));
  if (!stat(v8, &v53)) {
    goto LABEL_10;
  }
  uint64_t v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    long long v14 = v13;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    long long v14 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v14, OS_LOG_TYPE_DEFAULT, "CCFIle::copyFile: Unable to stat source path\n", buf, 2u);
LABEL_8:
  if (glog_fd)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v51 = v15;
    long long v52 = v15;
    long long v49 = v15;
    long long v50 = v15;
    long long v47 = v15;
    long long v48 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&uint8_t buf[16] = v15;
    memset(&v44, 0, sizeof(v44));
    time_t v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFIle::copyFile: Unable to stat source path\n");
  }
LABEL_10:
  off_t st_size = v53.st_size;
  uint64_t v17 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = v11;
    LOWORD(v47) = 2048;
    *(void *)((char *)&v47 + 2) = st_size;
    long long v18 = v17;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = v11;
    LOWORD(v47) = 2048;
    *(void *)((char *)&v47 + 2) = st_size;
    long long v18 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Attempt to write fileName %s, source path:%s, dest path:%s, length: %lld\n", buf, 0x2Au);
LABEL_16:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v51 = v19;
    long long v52 = v19;
    long long v49 = v19;
    long long v50 = v19;
    long long v47 = v19;
    long long v48 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    memset(&v44, 0, sizeof(v44));
    time_t v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::copyFile Attempt to write fileName %s, source path:%s, dest path:%s, length: %lld\n", a2, v8, (const char *)v11, st_size);
  }
  if (ifSeedCreateClassCProtectedFile(v11))
  {
    long long v20 = malloc_type_malloc(0x4000uLL, 0x16EFEA22uLL);
    stat v21 = fopen(v8, "rb");
    if (v21)
    {
      uint64_t v22 = v21;
      off_t v42 = st_size;
      gzFile v23 = gzopen((const char *)v11, "wb");
      if (!v23)
      {
        fclose(v22);
LABEL_41:
        off_t st_size = v42;
LABEL_42:
        if (v20) {
          free(v20);
        }
        goto LABEL_44;
      }
      for (CFIndex i = v23; ; gzwrite(i, v20, v25))
      {
        size_t v25 = fread(v20, 1uLL, 0x4000uLL, v22);
        if (!v25) {
          break;
        }
      }
      int errnum = gzflush(i, 4);
      if (!*__error())
      {
LABEL_40:
        fclose(v22);
        gzclose(i);
        goto LABEL_41;
      }
      uint64_t v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        long long v27 = gzerror(i, &errnum);
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v27;
        long long v28 = v26;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        long long v41 = gzerror(i, &errnum);
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v41;
        long long v28 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v28, OS_LOG_TYPE_ERROR, "%s\n", buf, 0xCu);
LABEL_38:
      if (glog_fd)
      {
        *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v51 = v32;
        long long v52 = v32;
        long long v49 = v32;
        long long v50 = v32;
        long long v47 = v32;
        long long v48 = v32;
        *(_OWORD *)buf = v32;
        *(_OWORD *)&uint8_t buf[16] = v32;
        memset(&v44, 0, sizeof(v44));
        time_t v43 = 0xAAAAAAAAAAAAAAAALL;
        time(&v43);
        localtime_r(&v43, &v44);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
        dprintf(glog_fd, "%s ", buf);
        int v33 = glog_fd;
        uint64_t v34 = gzerror(i, &errnum);
        dprintf(v33, "%s\n", v34);
      }
      goto LABEL_40;
    }
    uint64_t v29 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v8;
      long long v30 = v29;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v8;
      long long v30 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v30, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Failed to open source file:%s\n", buf, 0xCu);
LABEL_35:
    if (glog_fd)
    {
      *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v51 = v31;
      long long v52 = v31;
      long long v49 = v31;
      long long v50 = v31;
      long long v47 = v31;
      long long v48 = v31;
      *(_OWORD *)buf = v31;
      *(_OWORD *)&uint8_t buf[16] = v31;
      memset(&v44, 0, sizeof(v44));
      time_t v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCFile::copyFile Failed to open source file:%s\n", v8);
    }
    goto LABEL_42;
  }
LABEL_44:
  int v35 = stat((const char *)v11, &v53);
  uint64_t v36 = coreCaptureOsLog;
  if (v35)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      uint64_t v37 = v36;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      uint64_t v37 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v37, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Unable to stat dest path\n", buf, 2u);
LABEL_54:
    if (glog_fd)
    {
      *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v51 = v39;
      long long v52 = v39;
      long long v49 = v39;
      long long v50 = v39;
      long long v47 = v39;
      long long v48 = v39;
      *(_OWORD *)buf = v39;
      *(_OWORD *)&uint8_t buf[16] = v39;
      memset(&v44, 0, sizeof(v44));
      time_t v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCFile::copyFile Unable to stat dest path\n");
    }
    goto LABEL_61;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = st_size;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v53.st_size;
    long long v38 = v36;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = st_size;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v53.st_size;
    long long v38 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v38, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Wrote fileName %s with source length: %lld archive length: %lld\n", buf, 0x20u);
LABEL_59:
  if (glog_fd)
  {
    *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v51 = v40;
    long long v52 = v40;
    long long v49 = v40;
    long long v50 = v40;
    long long v47 = v40;
    long long v48 = v40;
    *(_OWORD *)buf = v40;
    *(_OWORD *)&uint8_t buf[16] = v40;
    memset(&v44, 0, sizeof(v44));
    time_t v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::copyFile Wrote fileName %s with source length: %lld archive length: %lld\n");
  }
LABEL_61:
  if (v8) {
    free(v8);
  }
  CFRelease(MutableCopy);
  if (v11) {
    free(v11);
  }
  CFRelease(v6);
}

uint64_t CCFile::captureLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    CFIndex v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    CFIndex v12 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v13;
    long long v40 = v13;
    long long v37 = v13;
    long long v38 = v13;
    long long v36 = v13;
    long long v34 = v13;
    long long v35 = v13;
    *(_OWORD *)buf = v13;
    memset(&v32, 0, sizeof(v32));
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v31);
    localtime_r(v31, &v32);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog\n");
  }
  CFStringRef v14 = *(const __CFString **)(a1 + 56);
  if (!v14)
  {
    stat v21 = (char *)malloc_type_malloc(a6 + a4, 0x548BE6BAuLL);
    memcpy(v21, a3, a4);
    if (a5) {
      memcpy(&v21[a4], a5, a6);
    }
    *(_OWORD *)long long v31 = *(_OWORD *)v21;
    if (daemonGlbl) {
      CCDaemon::setCaptureIdAndReason(daemonGlbl, (uint64_t)v31, v21 + 16);
    }
    uint64_t v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v31[0];
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v31[1];
        *(_WORD *)&buf[14] = 2080;
        *(void *)&long long v34 = v21 + 16;
        gzFile v23 = v22;
LABEL_30:
        _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog Received Capture notice id: %d.%06d, reason = %s\n", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v31[0];
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v31[1];
      *(_WORD *)&buf[14] = 2080;
      *(void *)&long long v34 = v21 + 16;
      gzFile v23 = &_os_log_internal;
      goto LABEL_30;
    }
    if (glog_fd)
    {
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v39 = v26;
      long long v40 = v26;
      long long v37 = v26;
      long long v38 = v26;
      long long v36 = v26;
      long long v34 = v26;
      long long v35 = v26;
      *(_OWORD *)buf = v26;
      memset(&v32, 0, sizeof(v32));
      time_t v30 = 0xAAAAAAAAAAAAAAAALL;
      time(&v30);
      localtime_r(&v30, &v32);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", (const char *)buf);
      time_t v27 = v31[0];
      uint64_t v28 = v31[1];
      dprintf(glog_fd, "CCFile::captureLog Received Capture notice id: %d.%06d, reason = %s\n", LODWORD(v31[0]), LODWORD(v31[1]), v21 + 16);
    }
    else
    {
      time_t v27 = v31[0];
      uint64_t v28 = v31[1];
    }
    writeMetadataFiles(*(const __CFString **)(a1 + 96), v21 + 16, v27, v28);
    uint64_t v25 = CCFile::writeDataFiles((void *)a1);
    free(v21);
    return v25;
  }
  CFIndex Length = CFStringGetLength(v14);
  long long v16 = (char *)malloc_type_malloc(Length + 1, 0xF967EB6DuLL);
  CFStringRef v17 = *(const __CFString **)(a1 + 56);
  CFIndex v18 = CFStringGetLength(v17);
  CFStringGetCString(v17, v16, v18 + 1, 0);
  uint64_t v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v16;
      long long v20 = v19;
LABEL_22:
      _os_log_impl(&dword_209928000, v20, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog Capture(%s) is in progress. Ignoring new one.\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v16;
    long long v20 = &_os_log_internal;
    goto LABEL_22;
  }
  if (glog_fd)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v24;
    long long v40 = v24;
    long long v37 = v24;
    long long v38 = v24;
    long long v36 = v24;
    long long v34 = v24;
    long long v35 = v24;
    *(_OWORD *)buf = v24;
    memset(&v32, 0, sizeof(v32));
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v31);
    localtime_r(v31, &v32);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog Capture(%s) is in progress. Ignoring new one.\n", v16);
  }
  if (v16) {
    free(v16);
  }
  return 0;
}

uint64_t CCFile::writeDataFiles(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CFStringRef v2 = (const __CFString *)(*(uint64_t (**)(void *))(*a1 + 144))(a1);
  a1[7] = v2;
  uint64_t v3 = mkdirRecursive(v2);
  if (v3)
  {
    if (*((_DWORD *)a1 + 9) != -1) {
      (*(void (**)(void *))(*a1 + 112))(a1);
    }
    (*(void (**)(void *))(*a1 + 152))(a1);
    goto LABEL_13;
  }
  CFIndex Length = CFStringGetLength((CFStringRef)a1[7]);
  CFIndex v5 = (char *)malloc_type_malloc(Length + 1, 0xEC1AC0BCuLL);
  CFStringRef v6 = (const __CFString *)a1[7];
  CFIndex v7 = CFStringGetLength(v6);
  CFStringGetCString(v6, v5, v7 + 1, 0);
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v5;
      CFIndex v9 = v8;
LABEL_17:
      _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "CCFile::captureLog Failed to create directory %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v5;
    CFIndex v9 = &_os_log_internal;
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v10;
    long long v22 = v10;
    long long v19 = v10;
    long long v20 = v10;
    long long v17 = v10;
    long long v18 = v10;
    *(_OWORD *)buf = v10;
    long long v16 = v10;
    memset(&v14, 0, sizeof(v14));
    time_t v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog Failed to create directory %s\n", v5);
  }
  if (v5) {
    free(v5);
  }
LABEL_13:
  uint64_t v11 = (const void *)a1[7];
  if (v11)
  {
    CFRelease(v11);
    a1[7] = 0;
  }
  return v3;
}

uint64_t CCFile::freeResources(CCFile *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
    *((void *)this + 2) = 0;
  }
  if (*((_DWORD *)this + 9) != -1)
  {
    (*(void (**)(CCFile *))(*(void *)this + 176))(this);
    close(*((_DWORD *)this + 9));
    *((_DWORD *)this + 9) = -1;
  }
  uint64_t v3 = (const void *)*((void *)this + 6);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 6) = 0;
  }
  CFAllocatorRef v4 = (const void *)*((void *)this + 7);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 7) = 0;
  }
  CFIndex v5 = (const void *)*((void *)this + 9);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 9) = 0;
  }
  CFStringRef v6 = (const void *)*((void *)this + 10);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 10) = 0;
  }
  CFIndex v7 = (const void *)*((void *)this + 11);
  if (v7)
  {
    CFRelease(v7);
    *((void *)this + 11) = 0;
  }
  uint64_t v8 = (const void *)*((void *)this + 12);
  if (v8)
  {
    CFRelease(v8);
    *((void *)this + 12) = 0;
  }
  CFIndex v9 = (const void *)*((void *)this + 13);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 13) = 0;
  }
  long long v10 = (const void *)*((void *)this + 5);
  if (v10)
  {
    CFRelease(v10);
    *((void *)this + 5) = 0;
  }
  uint64_t result = *((unsigned int *)this + 16);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 16) = 0;
  }
  return result;
}

void CCFile::CCFile(CCFile *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71980;
}

uint64_t CCFormatter::initWithRegistryEntry(CCFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 3) = object;
  return 1;
}

uint64_t CCFormatter::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)a1 + 72))(a1, a2, a3, a4, 0, 0);
}

uint64_t CCFormatter::writeLog()
{
  return 0;
}

uint64_t CCFormatter::ccfree(CCFormatter *this)
{
  io_object_t v2 = *((_DWORD *)this + 3);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 3) = 0;
  }
  uint64_t v3 = *(uint64_t (**)(CCFormatter *))(*(void *)this + 8);

  return v3(this);
}

void CCFormatter::CCFormatter(CCFormatter *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71A50;
}

void *CCFormatter::withRegistryEntry(CCFormatter *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"LogDataType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  int valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  int v3 = valuePtr;
  switch(valuePtr)
  {
    case 0:
      CFAllocatorRef v4 = CCPcapngFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 1:
      CFAllocatorRef v4 = CCTextFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 2:
      CFAllocatorRef v4 = CCRawFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 3:
      CFAllocatorRef v4 = CCIOReporterFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 4:
      CFAllocatorRef v4 = CCOSSerializeFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 5:
      CFAllocatorRef v4 = CCOSSerializeWithIOReporterFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 6:
      CFAllocatorRef v4 = CCCrashTracerFormatter::withRegistryEntry(this);
LABEL_12:
      CFIndex v7 = v4;
      if (CFProperty) {
        goto LABEL_13;
      }
      return v7;
    default:
      uint64_t v5 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        CFStringRef v6 = v5;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        CFStringRef v6 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v6, OS_LOG_TYPE_ERROR, "CCFormatter::withLogType Unsupported log data type(%d) \n", buf, 8u);
LABEL_16:
      if (glog_fd)
      {
        *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v19 = v9;
        long long v20 = v9;
        long long v17 = v9;
        long long v18 = v9;
        long long v15 = v9;
        long long v16 = v9;
        *(_OWORD *)buf = v9;
        long long v14 = v9;
        memset(&v11, 0, sizeof(v11));
        time_t v10 = 0xAAAAAAAAAAAAAAAALL;
        time(&v10);
        localtime_r(&v10, &v11);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCFormatter::withLogType Unsupported log data type(%d) \n", valuePtr);
      }
      CFIndex v7 = 0;
      if (CFProperty) {
LABEL_13:
      }
        CFRelease(CFProperty);
      return v7;
  }
}

uint64_t CCFormatter::freeResources(CCFormatter *this)
{
  uint64_t result = *((unsigned int *)this + 3);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 3) = 0;
  }
  return result;
}

uint64_t CCLogPipeInterface::openUserClient(CCLogPipeInterface *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 22), 1u, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::wakeupTapLoop(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::freeResources(uint64_t this)
{
  if (*(int *)(this + 80) >= 3)
  {
    uint64_t v1 = this;
    this = IOConnectCallScalarMethod(*(_DWORD *)(this + 88), 2u, 0, 0, 0, 0);
    *(_DWORD *)(v1 + 80) = 1;
  }
  return this;
}

void CCLogPipeInterface::~CCLogPipeInterface(void *this)
{
  if (this) {
    free(this);
  }
}

CCPipeInterface *CCLogPipeInterface::withRegistryEntry(CCLogPipeInterface *this, CCTap *a2, CCTap *a3)
{
  io_registry_entry_t v4 = this;
  uint64_t v5 = (CCPipeInterface *)malloc_type_malloc(0x90uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v5 + 8) = 0u;
  *(_OWORD *)((char *)v5 + 24) = 0u;
  *(_OWORD *)((char *)v5 + 40) = 0u;
  *(_OWORD *)((char *)v5 + 56) = 0u;
  *(_OWORD *)((char *)v5 + 72) = 0u;
  *(_OWORD *)((char *)v5 + 88) = 0u;
  *(_OWORD *)((char *)v5 + 104) = 0u;
  *(_OWORD *)((char *)v5 + pthread_setname_np((const char *)this + 120) = 0u;
  *((void *)v5 + 17) = 0;
  *((_DWORD *)v5 + 2) = 1;
  *(void *)uint64_t v5 = &unk_26BD71AD8;
  if ((CCPipeInterface::initWithRegistryEntry(v5, v4, a2) & 1) == 0)
  {
    (*(void (**)(CCPipeInterface *))(*(void *)v5 + 48))(v5);
    return 0;
  }
  return v5;
}

uint64_t CCLogPipeInterface::mapPipe(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  io_registry_entry_t v4 = (unsigned int *)MEMORY[0x263EF8960];
  uint64_t result = MEMORY[0x210507360](*(unsigned int *)(a1 + 88), 0, *MEMORY[0x263EF8960], a2, a2 + 8, 1);
  if (!result) {
    return MEMORY[0x210507360](*(unsigned int *)(a1 + 88), 1, *v4, a2 + 16, v6, 1);
  }
  return result;
}

uint64_t CCLogPipeInterface::unmapPipe(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x210507380](*(unsigned int *)(a1 + 88), 0, *MEMORY[0x263EF8960], *a2);
  if (!result)
  {
    JUMPOUT(0x210507380);
  }
  return result;
}

uint64_t CCLogPipeInterface::setLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 4u, 0, 0, inputStruct, 0x108uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::updateLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xDu, 0, 0, inputStruct, 0x204uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setLogLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 5u, 0, 0, inputStruct, 0x104uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setConsoleLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 6u, 0, 0, inputStruct, 0x108uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::updateConsoleLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xEu, 0, 0, inputStruct, 0x204uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setConsoleLogLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 7u, 0, 0, inputStruct, 0x104uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::capture(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 8u, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setNotifyTimeout(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 9u, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setWatermarkLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xAu, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setPolicy(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xBu, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::profileLoaded(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::profileRemoved(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 0xFu, 0, 0, 0, 0, 0, 0, 0, 0);
}

void CCLogTap::tapLoopImpl(CCLogTap *this)
{
  block[6] = *MEMORY[0x263EF8340];
  io_object_t v2 = (uint64_t *)*((void *)this + 8);
  uint64_t v3 = *v2;
  uint64_t v5 = (*(uint64_t (**)(uint64_t *))(v3 + 104))(v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN8CCLogTap11tapLoopImplEv_block_invoke;
  block[3] = &__block_descriptor_tmp_471;
  block[4] = this;
  void block[5] = v4;
  dispatch_async(v5, block);
}

void ___ZN8CCLogTap11tapLoopImplEv_block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v4 = *(_DWORD *)(v2 + 16);
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
    CFStringRef v6 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "tapLoopImpl_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 140;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v4;
    *(_WORD *)&buf[24] = 2080;
    *(void *)&buf[26] = CStringPtr;
    *(_WORD *)&buf[34] = 2080;
    *(void *)&buf[36] = v6;
    CFIndex v7 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v8 = *(_DWORD *)(v2 + 16);
    long long v9 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
    time_t v10 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "tapLoopImpl_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 140;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    *(_WORD *)&buf[24] = 2080;
    *(void *)&buf[26] = v9;
    *(_WORD *)&buf[34] = 2080;
    *(void *)&buf[36] = v10;
    CFIndex v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::%s:%d tapLoopImpl entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v78 = v11;
    long long v79 = v11;
    long long v76 = v11;
    long long v77 = v11;
    *(_OWORD *)&unsigned char buf[32] = v11;
    long long v75 = v11;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    memset(&v73, 0, sizeof(v73));
    time_t v72 = 0xAAAAAAAAAAAAAAAALL;
    time(&v72);
    localtime_r(&v72, &v73);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
    dprintf(glog_fd, "%s ", buf);
    int v12 = glog_fd;
    int v13 = *(_DWORD *)(v2 + 16);
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
    dprintf(v12, "CCLogTap::%s:%d tapLoopImpl entry:%u Owner:%s Name:%s\n", "tapLoopImpl_block_invoke", 140, v13, v14, v15);
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v2 + 64) + 16));
  int v16 = *(unsigned __int8 *)(v2 + 56);
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(v2 + 64) + 16));
  if (!v16)
  {
    __dmb(0xBu);
    *(unsigned char *)(v2 + 345) = 1;
    uint64_t v17 = *(void *)(a1 + 40);
    if (!v17)
    {
      uint64_t v54 = coreCaptureOsLog;
      if (!coreCaptureOsLog)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_75;
        }
LABEL_60:
        int v59 = *(_DWORD *)(v2 + 16);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v59;
        time_t v60 = &_os_log_internal;
LABEL_74:
        _os_log_error_impl(&dword_209928000, v60, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to get pipe interface \n", buf, 8u);
LABEL_75:
        if (glog_fd)
        {
          *(void *)&long long v69 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v69 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v78 = v69;
          long long v79 = v69;
          long long v76 = v69;
          long long v77 = v69;
          *(_OWORD *)&unsigned char buf[32] = v69;
          long long v75 = v69;
          *(_OWORD *)buf = v69;
          *(_OWORD *)&uint8_t buf[16] = v69;
          memset(&v73, 0, sizeof(v73));
          time_t v72 = 0xAAAAAAAAAAAAAAAALL;
          time(&v72);
          localtime_r(&v72, &v73);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to get pipe interface \n");
        }
        goto LABEL_82;
      }
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_75;
      }
      int v65 = *(_DWORD *)(v2 + 16);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v65;
LABEL_73:
      time_t v60 = v54;
      goto LABEL_74;
    }
    int v18 = CCLogPipeInterface::mapPipe(v17, v2 + 184);
    if (!v18)
    {
      if (*(unsigned char *)(v2 + 96))
      {
        *(_WORD *)(v2 + 96) = 256;
      }
      else if (!*(unsigned char *)(v2 + 97) && !*(void *)(v2 + 32))
      {
        uint64_t v19 = isSeedAndiOS();
        if (!v19 || deviceUnlockedSinceBoot(v19, v20))
        {
          uint64_t v21 = CCFile::withRegistryEntry((CCFile *)*(unsigned int *)(v2 + 16));
          *(void *)(v2 + 32) = v21;
          if (v21) {
            (*(void (**)(CCLogFile *, void))(*(void *)v21 + 56))(v21, 0);
          }
        }
      }
      uint64_t v22 = *(void *)(v2 + 32);
      if (!v22 || ((*(uint64_t (**)(uint64_t))(*(void *)v22 + 120))(v22) & 1) != 0)
      {
LABEL_28:
        if (*(unsigned char *)(v2 + 56) || *(unsigned char *)(v2 + 97))
        {
LABEL_39:
          uint64_t v39 = *(void *)(a1 + 40);
          if (v39)
          {
            int v40 = CCLogPipeInterface::unmapPipe(v39, (void *)(v2 + 184));
            if (!v40)
            {
              *(CFAbsoluteTime *)(v2 + 352) = CFAbsoluteTimeGetCurrent();
              *(unsigned char *)(v2 + 345) = 0;
              uint64_t v41 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_47;
                }
                int v42 = *(_DWORD *)(v2 + 16);
                time_t v43 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
                tm v44 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v42;
                *(_WORD *)&buf[8] = 2080;
                *(void *)&buf[10] = v43;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v44;
                long long v45 = v41;
              }
              else
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_47;
                }
                int v46 = *(_DWORD *)(v2 + 16);
                long long v47 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
                long long v48 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v46;
                *(_WORD *)&buf[8] = 2080;
                *(void *)&buf[10] = v47;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v48;
                long long v45 = &_os_log_internal;
              }
              _os_log_impl(&dword_209928000, v45, OS_LOG_TYPE_DEFAULT, "CCLogTap::tapLoop entry:%u Owner:%s Name:%s Exiting taploop\n", buf, 0x1Cu);
LABEL_47:
              if (glog_fd)
              {
                *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v78 = v49;
                long long v79 = v49;
                long long v76 = v49;
                long long v77 = v49;
                *(_OWORD *)&unsigned char buf[32] = v49;
                long long v75 = v49;
                *(_OWORD *)buf = v49;
                *(_OWORD *)&uint8_t buf[16] = v49;
                memset(&v73, 0, sizeof(v73));
                time_t v72 = 0xAAAAAAAAAAAAAAAALL;
                time(&v72);
                localtime_r(&v72, &v73);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
                dprintf(glog_fd, "%s ", buf);
                int v50 = glog_fd;
                int v51 = *(_DWORD *)(v2 + 16);
                long long v52 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
                stat v53 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
                dprintf(v50, "CCLogTap::tapLoop entry:%u Owner:%s Name:%s Exiting taploop\n", v51, v52, v53);
              }
              return;
            }
            int v61 = v40;
            uint64_t v62 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_80;
              }
              int v70 = *(_DWORD *)(v2 + 16);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v70;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v61;
              uint64_t v64 = v62;
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_80;
              }
              int v63 = *(_DWORD *)(v2 + 16);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v63;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v61;
              uint64_t v64 = &_os_log_internal;
            }
            _os_log_error_impl(&dword_209928000, v64, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to unmap pipe with rc[0x%08x]\n", buf, 0xEu);
LABEL_80:
            if (glog_fd)
            {
              *(void *)&long long v71 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v78 = v71;
              long long v79 = v71;
              long long v76 = v71;
              long long v77 = v71;
              *(_OWORD *)&unsigned char buf[32] = v71;
              long long v75 = v71;
              *(_OWORD *)buf = v71;
              *(_OWORD *)&uint8_t buf[16] = v71;
              memset(&v73, 0, sizeof(v73));
              time_t v72 = 0xAAAAAAAAAAAAAAAALL;
              time(&v72);
              localtime_r(&v72, &v73);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to unmap pipe with rc[0x%08x]\n");
            }
            goto LABEL_82;
          }
          uint64_t v54 = coreCaptureOsLog;
          if (!coreCaptureOsLog)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_75;
            }
            goto LABEL_60;
          }
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_75;
          }
          int v68 = *(_DWORD *)(v2 + 16);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v68;
          goto LABEL_73;
        }
        uint64_t v26 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = *(_DWORD *)(v2 + 16);
            uint64_t v28 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
            uint64_t v29 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = "tapLoopImpl_block_invoke";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 182;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v27;
            *(_WORD *)&buf[24] = 2080;
            *(void *)&buf[26] = v28;
            *(_WORD *)&buf[34] = 2080;
            *(void *)&buf[36] = v29;
            time_t v30 = v26;
LABEL_35:
            _os_log_impl(&dword_209928000, v30, OS_LOG_TYPE_DEFAULT, "%s:%d MADHU processEvent entry:%u Owner:%s Name:%s", buf, 0x2Cu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = *(_DWORD *)(v2 + 16);
          tm v32 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
          int v33 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "tapLoopImpl_block_invoke";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 182;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v31;
          *(_WORD *)&buf[24] = 2080;
          *(void *)&buf[26] = v32;
          *(_WORD *)&buf[34] = 2080;
          *(void *)&buf[36] = v33;
          time_t v30 = &_os_log_internal;
          goto LABEL_35;
        }
        if (glog_fd)
        {
          *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v78 = v34;
          long long v79 = v34;
          long long v76 = v34;
          long long v77 = v34;
          *(_OWORD *)&unsigned char buf[32] = v34;
          long long v75 = v34;
          *(_OWORD *)buf = v34;
          *(_OWORD *)&uint8_t buf[16] = v34;
          memset(&v73, 0, sizeof(v73));
          time_t v72 = 0xAAAAAAAAAAAAAAAALL;
          time(&v72);
          localtime_r(&v72, &v73);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
          dprintf(glog_fd, "%s ", buf);
          int v35 = glog_fd;
          int v36 = *(_DWORD *)(v2 + 16);
          long long v37 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 40), 0);
          long long v38 = CFStringGetCStringPtr(*(CFStringRef *)(v2 + 48), 0);
          dprintf(v35, "%s:%d MADHU processEvent entry:%u Owner:%s Name:%s", "tapLoopImpl_block_invoke", 182, v36, v37, v38);
        }
        CCLogTap::processEvent((CCLogTap *)v2);
        goto LABEL_39;
      }
      uint64_t v23 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        long long v24 = v23;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        long long v24 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() isLogdirExists failed\n", buf, 2u);
LABEL_26:
      if (glog_fd)
      {
        *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v78 = v25;
        long long v79 = v25;
        long long v76 = v25;
        long long v77 = v25;
        *(_OWORD *)&unsigned char buf[32] = v25;
        long long v75 = v25;
        *(_OWORD *)buf = v25;
        *(_OWORD *)&uint8_t buf[16] = v25;
        memset(&v73, 0, sizeof(v73));
        time_t v72 = 0xAAAAAAAAAAAAAAAALL;
        time(&v72);
        localtime_r(&v72, &v73);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogTap::tapLoopImpl() isLogdirExists failed\n");
      }
      goto LABEL_28;
    }
    int v55 = v18;
    uint64_t v56 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      int v66 = *(_DWORD *)(v2 + 16);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v66;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v55;
      long long v58 = v56;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      int v57 = *(_DWORD *)(v2 + 16);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v57;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v55;
      long long v58 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v58, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to map pipe with rc[0x%08x]\n", buf, 0xEu);
LABEL_69:
    if (glog_fd)
    {
      *(void *)&long long v67 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v78 = v67;
      long long v79 = v67;
      long long v76 = v67;
      long long v77 = v67;
      *(_OWORD *)&unsigned char buf[32] = v67;
      long long v75 = v67;
      *(_OWORD *)buf = v67;
      *(_OWORD *)&uint8_t buf[16] = v67;
      memset(&v73, 0, sizeof(v73));
      time_t v72 = 0xAAAAAAAAAAAAAAAALL;
      time(&v72);
      localtime_r(&v72, &v73);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v73);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to map pipe with rc[0x%08x]\n");
    }
LABEL_82:
    exit(1);
  }
}

uint64_t CCLogTap::processEvent(CCLogTap *this)
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 4))
  {
    uint64_t v10 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_126;
      }
      int v11 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      int v12 = v10;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_126;
      }
      int v74 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v74;
      int v12 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "%s - no fFile entry:%u", buf, 0x12u);
LABEL_126:
    if (glog_fd)
    {
      *(void *)&long long v75 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v75 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v130 = v75;
      long long v131 = v75;
      long long v128 = v75;
      long long v129 = v75;
      *(_OWORD *)&unsigned char buf[32] = v75;
      *(_OWORD *)&unsigned char buf[48] = v75;
      *(_OWORD *)&uint8_t buf[16] = v75;
      *(_OWORD *)buf = v75;
      memset(&v126, 0, sizeof(v126));
      v123[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v123);
      localtime_r(v123, &v126);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s - no fFile entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
    }
    return 0;
  }
  uint64_t v2 = (atomic_uint *)*((void *)this + 25);
  v2[2] = 1;
  __dmb(0xBu);
  atomic_uint v3 = v2[1];
  if (v3 == *v2)
  {
    int v4 = 0;
    int v119 = 0;
    int v120 = 0;
    int v117 = 0;
    int v118 = 0;
    goto LABEL_4;
  }
  int v119 = 0;
  int v120 = 0;
  int v117 = 0;
  int v118 = 0;
  int v4 = 0;
  while (1)
  {
    if (*((unsigned char *)this + 56) || *((unsigned char *)this + 96)) {
      goto LABEL_4;
    }
    unsigned __int32 v121 = *v2;
    int v125 = 0;
    *(_OWORD *)long long v123 = 0u;
    long long v124 = 0u;
    __dmb(0xBu);
    unint64_t v13 = *((void *)this + 24);
    if (v13 < v121)
    {
      uint64_t v78 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          int v79 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "processEvent";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v121;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v13;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v79;
          uint64_t v80 = v78;
LABEL_153:
          _os_log_error_impl(&dword_209928000, v80, OS_LOG_TYPE_ERROR, "%s Ring offset out of range: %u > %llu entry:%u\n", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v97 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v121;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v13;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v97;
        uint64_t v80 = &_os_log_internal;
        goto LABEL_153;
      }
      if (glog_fd)
      {
        *(void *)&long long v84 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v84 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v84;
        long long v131 = v84;
        long long v128 = v84;
        long long v129 = v84;
        *(_OWORD *)&unsigned char buf[32] = v84;
        *(_OWORD *)&unsigned char buf[48] = v84;
        *(_OWORD *)&uint8_t buf[16] = v84;
        *(_OWORD *)buf = v84;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Ring offset out of range: %u > %llu entry:%u\n", "processEvent", v121, *((void *)this + 24), *((_DWORD *)this + 4));
      }
      return 3758097090;
    }
    uint64_t v14 = *((void *)this + 23) + v121;
    if ((v14 & 3) != 0)
    {
      uint64_t v81 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_141;
        }
        int v82 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 4;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v121;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v82;
        CFArrayRef v83 = v81;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_141;
        }
        int v98 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 4;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v121;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v98;
        CFArrayRef v83 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v83, OS_LOG_TYPE_ERROR, "%s Read Ptr is not multiple of %lu (%d) entry:%u \n", buf, 0x22u);
LABEL_141:
      uint64_t v76 = 3758097086;
      if (glog_fd)
      {
        *(void *)&long long v85 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v85 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v85;
        long long v131 = v85;
        long long v128 = v85;
        long long v129 = v85;
        *(_OWORD *)&unsigned char buf[32] = v85;
        *(_OWORD *)&unsigned char buf[48] = v85;
        *(_OWORD *)&uint8_t buf[16] = v85;
        *(_OWORD *)buf = v85;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Read Ptr is not multiple of %lu (%d) entry:%u \n", "processEvent", 4, v121, *((_DWORD *)this + 4));
      }
      return v76;
    }
    int v15 = *(_DWORD *)v14;
    if (*(_DWORD *)v14 == 80 || v13 - v121 <= 0x23)
    {
      unint64_t v16 = (v121 + 4) % v13;
      ++v4;
      goto LABEL_21;
    }
    long long v21 = *(_OWORD *)v14;
    long long v22 = *(_OWORD *)(v14 + 16);
    int v125 = *(_DWORD *)(v14 + 32);
    *(_OWORD *)long long v123 = v21;
    long long v124 = v22;
    if (v121 != *v2 || v15 != LODWORD(v123[0]))
    {
      uint64_t v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          int v27 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "processEvent";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v27;
          uint64_t v28 = v26;
          goto LABEL_109;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v67 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v67;
        uint64_t v28 = &_os_log_internal;
LABEL_109:
        _os_log_error_impl(&dword_209928000, v28, OS_LOG_TYPE_ERROR, "%s Read pointer moved while copying metadata. Retrying entry:%u\n", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v31;
        long long v131 = v31;
        long long v128 = v31;
        long long v129 = v31;
        *(_OWORD *)&unsigned char buf[32] = v31;
        *(_OWORD *)&unsigned char buf[48] = v31;
        *(_OWORD *)&uint8_t buf[16] = v31;
        *(_OWORD *)buf = v31;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Read pointer moved while copying metadata. Retrying entry:%u\n", "processEvent", *((_DWORD *)this + 4));
      }
      goto LABEL_56;
    }
    if (LODWORD(v123[0]) == 69)
    {
      uint64_t v23 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v24;
          long long v25 = v23;
          goto LABEL_52;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v42;
        long long v25 = &_os_log_internal;
LABEL_52:
        _os_log_impl(&dword_209928000, v25, OS_LOG_TYPE_DEFAULT, "%s - STATE IS EMPTY. CONTINUE entry:%u", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(void *)&long long v43 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v43;
        long long v131 = v43;
        long long v128 = v43;
        long long v129 = v43;
        *(_OWORD *)&unsigned char buf[32] = v43;
        *(_OWORD *)&unsigned char buf[48] = v43;
        *(_OWORD *)&uint8_t buf[16] = v43;
        *(_OWORD *)buf = v43;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s - STATE IS EMPTY. CONTINUE entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
      }
      ++v120;
      goto LABEL_56;
    }
    if (LODWORD(v123[0]) == 82)
    {
      uint64_t v91 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          int v92 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v92;
          CFTypeID v93 = v91;
          goto LABEL_167;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v105 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v105;
        CFTypeID v93 = &_os_log_internal;
LABEL_167:
        _os_log_impl(&dword_209928000, v93, OS_LOG_TYPE_DEFAULT, "%s - STATE IS RESERVED. BREAK entry:%u", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(void *)&long long v106 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v106 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v106;
        long long v131 = v106;
        long long v128 = v106;
        long long v129 = v106;
        *(_OWORD *)&unsigned char buf[32] = v106;
        *(_OWORD *)&unsigned char buf[48] = v106;
        *(_OWORD *)&uint8_t buf[16] = v106;
        *(_OWORD *)buf = v106;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s - STATE IS RESERVED. BREAK entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
      }
      int v5 = 1;
      goto LABEL_5;
    }
    uint64_t v32 = isSeedAndiOS();
    if (v32 && (deviceUnlockedSinceBoot(v32, v33) & 1) == 0)
    {
      uint64_t v102 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          int v103 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v103;
          CFTypeID v104 = v102;
          goto LABEL_187;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v113 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v113;
        CFTypeID v104 = &_os_log_internal;
LABEL_187:
        _os_log_error_impl(&dword_209928000, v104, OS_LOG_TYPE_ERROR, "seed build (or boot-arg) and device hasn't been unlocked since boot. Won't process event and continue when next event is posted entry:%u\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(void *)&long long v109 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v109 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v109;
        long long v131 = v109;
        long long v128 = v109;
        long long v129 = v109;
        *(_OWORD *)&unsigned char buf[32] = v109;
        *(_OWORD *)&unsigned char buf[48] = v109;
        *(_OWORD *)&uint8_t buf[16] = v109;
        *(_OWORD *)buf = v109;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "seed build (or boot-arg) and device hasn't been unlocked since boot. Won't process event and continue when next event is posted entry:%u\n", *((_DWORD *)this + 4));
      }
      goto LABEL_4;
    }
    uint64_t v35 = *((void *)this + 23);
    unint64_t v34 = *((void *)this + 24);
    unint64_t v36 = (v121 + 36) % v34;
    unint64_t v37 = WORD4(v124);
    if (v36 + WORD4(v124) <= v34)
    {
      unint64_t v116 = 0;
      unint64_t v41 = 0;
      goto LABEL_66;
    }
    uint64_t v38 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v39;
        int v40 = v38;
LABEL_62:
        _os_log_impl(&dword_209928000, v40, OS_LOG_TYPE_DEFAULT, "%s - localLogMetadata.payloadLength + logPayloadOffset IS BEYOND RINGSIZE. ADJUST entry:%u", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v44;
      int v40 = &_os_log_internal;
      goto LABEL_62;
    }
    if (glog_fd)
    {
      *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v130 = v45;
      long long v131 = v45;
      long long v128 = v45;
      long long v129 = v45;
      *(_OWORD *)&unsigned char buf[32] = v45;
      *(_OWORD *)&unsigned char buf[48] = v45;
      *(_OWORD *)&uint8_t buf[16] = v45;
      *(_OWORD *)buf = v45;
      memset(&v126, 0, sizeof(v126));
      time_t v122 = 0xAAAAAAAAAAAAAAAALL;
      time(&v122);
      localtime_r(&v122, &v126);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s - localLogMetadata.payloadLength + logPayloadOffset IS BEYOND RINGSIZE. ADJUST entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
    }
    unint64_t v37 = (*((_DWORD *)this + 48) - v36);
    unint64_t v116 = WORD4(v124) - v37;
    unint64_t v41 = *((void *)this + 23);
LABEL_66:
    if (!*((unsigned char *)this + 344))
    {
      *((unsigned char *)this + 344) = 1;
      goto LABEL_71;
    }
    int v46 = HIWORD(v123[0]);
    if (*((unsigned __int16 *)this + 171) == HIWORD(v123[0]))
    {
      uint64_t v100 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v46;
          long long v101 = v100;
          goto LABEL_185;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v46;
        long long v101 = &_os_log_internal;
LABEL_185:
        _os_log_error_impl(&dword_209928000, v101, OS_LOG_TYPE_ERROR, "previous and current sequence numbers are same %u\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(void *)&long long v108 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v108 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v108;
        long long v131 = v108;
        long long v128 = v108;
        long long v129 = v108;
        *(_OWORD *)&unsigned char buf[32] = v108;
        *(_OWORD *)&unsigned char buf[48] = v108;
        *(_OWORD *)&uint8_t buf[16] = v108;
        *(_OWORD *)buf = v108;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "previous and current sequence numbers are same %u\n", HIWORD(v123[0]));
      }
      goto LABEL_4;
    }
    int v47 = *((unsigned __int16 *)this + 170);
    if (v47 != HIWORD(v123[0]))
    {
      uint64_t v115 = v35;
      unint64_t v48 = v36;
      unint64_t v49 = v41;
      unint64_t v50 = v37;
      int v51 = snprintf((char *)this + 212, 0x80uLL, "Dropped Log message expected sequence number = %u, Received %u\n", v47, HIWORD(v123[0]));
      (*(void (**)(void, time_t *, char *, void, void))(**((void **)this + 4) + 72))(*((void *)this + 4), v123, (char *)this + 212, v51, 0);
      unint64_t v37 = v50;
      unint64_t v41 = v49;
      unint64_t v36 = v48;
      uint64_t v35 = v115;
    }
LABEL_71:
    unint64_t v52 = v35 + v36;
    __int16 v53 = HIWORD(v123[0]);
    *((_WORD *)this + 171) = HIWORD(v123[0]);
    *((_WORD *)this + 170) = v53 + 1;
    if (LODWORD(v123[0]) != 87) {
      goto LABEL_83;
    }
    unint64_t v55 = *((void *)this + 23);
    unint64_t v54 = *((void *)this + 24);
    BOOL v56 = v52 < v54 + v55 && v52 >= v55;
    if (!v56 || v41 && (v41 < v55 || v41 >= v54 + v55) || v37 >= v54 || v116 >= v54) {
      break;
    }
    unint64_t v57 = v52;
    unint64_t v58 = v37;
    (*(void (**)(void, time_t *))(**((void **)this + 4) + 64))(*((void *)this + 4), v123);
    ++v117;
    unint64_t v37 = v58;
    unint64_t v52 = v57;
LABEL_83:
    if (LODWORD(v123[0]) != 67) {
      goto LABEL_96;
    }
    unint64_t v59 = v52;
    unint64_t v114 = v37;
    uint64_t v60 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v61 = v60;
LABEL_89:
        _os_log_impl(&dword_209928000, v61, OS_LOG_TYPE_DEFAULT, "Received Capture Event\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v61 = &_os_log_internal;
      goto LABEL_89;
    }
    if (glog_fd)
    {
      *(void *)&long long v62 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v130 = v62;
      long long v131 = v62;
      long long v128 = v62;
      long long v129 = v62;
      *(_OWORD *)&unsigned char buf[32] = v62;
      *(_OWORD *)&unsigned char buf[48] = v62;
      *(_OWORD *)&uint8_t buf[16] = v62;
      *(_OWORD *)buf = v62;
      memset(&v126, 0, sizeof(v126));
      time_t v122 = 0xAAAAAAAAAAAAAAAALL;
      time(&v122);
      localtime_r(&v122, &v126);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Received Capture Event\n");
    }
    if (*((void *)this + 10))
    {
      *(_DWORD *)buf = 0;
      if (!IORegistryEntryGetParentEntry(*((_DWORD *)this + 4), "IOService", (io_registry_entry_t *)buf)) {
        operator new();
      }
    }
    strcpy(buf, "CAPTURE");
    int v63 = (void *)((char *)this + 32);
    (*(void (**)(void, time_t *, unsigned char *, uint64_t, uint64_t))(**((void **)this + 4) + 72))(*((void *)this + 4), v123, buf, 7, 1);
    (*(void (**)(void, time_t *, unint64_t, unint64_t, unint64_t, unint64_t))(*(void *)*v63 + 80))(*v63, v123, v59, v114, v41, v116);
    (*(void (**)(void, time_t *, unsigned char *, uint64_t, uint64_t))(*(void *)*v63 + 72))(*v63, v123, buf, 7, 1);
    ++v118;
LABEL_96:
    if (LODWORD(v123[0]) != 83) {
      goto LABEL_106;
    }
    uint64_t v64 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v65 = v64;
LABEL_102:
        _os_log_impl(&dword_209928000, v65, OS_LOG_TYPE_DEFAULT, "Received Skip Event\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v65 = &_os_log_internal;
      goto LABEL_102;
    }
    if (glog_fd)
    {
      *(void *)&long long v66 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v66 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v130 = v66;
      long long v131 = v66;
      long long v128 = v66;
      long long v129 = v66;
      *(_OWORD *)&unsigned char buf[32] = v66;
      *(_OWORD *)&unsigned char buf[48] = v66;
      *(_OWORD *)&uint8_t buf[16] = v66;
      *(_OWORD *)buf = v66;
      memset(&v126, 0, sizeof(v126));
      time_t v122 = 0xAAAAAAAAAAAAAAAALL;
      time(&v122);
      localtime_r(&v122, &v126);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Received Skip Event\n");
    }
    ++v119;
LABEL_106:
    unint64_t v16 = (unint64_t)(v121 + WORD4(v124) + BYTE10(v124) + 36) % *((void *)this + 24);
    if ((v16 & 3) != 0)
    {
      uint64_t v94 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_172;
        }
        int v95 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v95;
        uint64_t v96 = v94;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_172;
        }
        int v112 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v112;
        uint64_t v96 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v96, OS_LOG_TYPE_ERROR, "Created a bad offset, don't save it! entry:%u", buf, 8u);
LABEL_172:
      if (glog_fd)
      {
        *(void *)&long long v107 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v107 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v107;
        long long v131 = v107;
        long long v128 = v107;
        long long v129 = v107;
        *(_OWORD *)&unsigned char buf[32] = v107;
        *(_OWORD *)&unsigned char buf[48] = v107;
        *(_OWORD *)&uint8_t buf[16] = v107;
        *(_OWORD *)buf = v107;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "Created a bad offset, don't save it! entry:%u", *((_DWORD *)this + 4));
      }
      goto LABEL_4;
    }
LABEL_21:
    unsigned __int32 v17 = v121;
    unsigned __int32 v18 = v121;
    atomic_compare_exchange_strong_explicit(v2, &v18, v16, memory_order_relaxed, memory_order_relaxed);
    if (v18 != v17)
    {
      uint64_t v19 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          long long v20 = v19;
LABEL_59:
          _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "Couldn't update read ptr.\n", buf, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v20 = &_os_log_internal;
        goto LABEL_59;
      }
      if (glog_fd)
      {
        *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v130 = v29;
        long long v131 = v29;
        long long v128 = v29;
        long long v129 = v29;
        *(_OWORD *)&unsigned char buf[32] = v29;
        *(_OWORD *)&unsigned char buf[48] = v29;
        *(_OWORD *)&uint8_t buf[16] = v29;
        *(_OWORD *)buf = v29;
        memset(&v126, 0, sizeof(v126));
        time_t v122 = 0xAAAAAAAAAAAAAAAALL;
        time(&v122);
        localtime_r(&v122, &v126);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "Couldn't update read ptr.\n");
      }
      int v30 = snprintf((char *)this + 212, 0x80uLL, "Couldn't update read ptr. Cannot guarantee integrity of message %d\n", HIWORD(v123[0]));
      (*(void (**)(void, time_t *, char *, void, void))(**((void **)this + 4) + 72))(*((void *)this + 4), v123, (char *)this + 212, v30, 0);
      goto LABEL_56;
    }
    atomic_uint v3 = v2[1];
LABEL_56:
    if (v3 == *v2) {
      goto LABEL_4;
    }
  }
  uint64_t v86 = v37;
  uint64_t v87 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v88 = *((void *)this + 25);
      int v89 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 134219264;
      *(void *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v54;
      *(_WORD *)&unsigned char buf[32] = 2048;
      *(void *)&buf[34] = v86;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = v116;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v89;
      CFTypeID v90 = v87;
      goto LABEL_181;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v110 = *((void *)this + 25);
    int v111 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 134219264;
    *(void *)&buf[4] = v110;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v55;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v54;
    *(_WORD *)&unsigned char buf[32] = 2048;
    *(void *)&buf[34] = v86;
    *(_WORD *)&buf[42] = 2048;
    *(void *)&buf[44] = v116;
    *(_WORD *)&buf[52] = 1024;
    *(_DWORD *)&buf[54] = v111;
    CFTypeID v90 = &_os_log_internal;
LABEL_181:
    _os_log_error_impl(&dword_209928000, v90, OS_LOG_TYPE_ERROR, "Unexpected log parameters ring state3(0x%llx), ring buffer(0x%llx), ring size(%llu), logSize(%lu), logContinueSize(%lu) entry:%u\n", buf, 0x3Au);
  }
  if (glog_fd)
  {
    *(void *)&long long v99 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v99 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v130 = v99;
    long long v131 = v99;
    long long v128 = v99;
    long long v129 = v99;
    *(_OWORD *)&unsigned char buf[32] = v99;
    *(_OWORD *)&unsigned char buf[48] = v99;
    *(_OWORD *)&uint8_t buf[16] = v99;
    *(_OWORD *)buf = v99;
    memset(&v126, 0, sizeof(v126));
    time_t v122 = 0xAAAAAAAAAAAAAAAALL;
    time(&v122);
    localtime_r(&v122, &v126);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Unexpected log parameters ring state3(0x%llx), ring buffer(0x%llx), ring size(%llu), logSize(%lu), logContinueSize(%lu) entry:%u\n", *((void *)this + 25), *((void *)this + 23), *((void *)this + 24), v86, v116, *((_DWORD *)this + 4));
  }
LABEL_4:
  int v5 = 0;
LABEL_5:
  if (*((unsigned char *)this + 96)) {
    *((_WORD *)this + 48) = 256;
  }
  v2[2] = 0;
  uint64_t v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      atomic_uint v7 = *v2;
      int v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v7;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v8;
      long long v9 = v6;
      goto LABEL_112;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    atomic_uint v68 = *v2;
    int v69 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v68;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v69;
    long long v9 = &_os_log_internal;
LABEL_112:
    _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCLogTap::pipeEvent EXIT readOffset : %d entry:%u\n", buf, 0xEu);
  }
  if (glog_fd)
  {
    *(void *)&long long v70 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v70 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v130 = v70;
    long long v131 = v70;
    long long v128 = v70;
    long long v129 = v70;
    *(_OWORD *)&unsigned char buf[32] = v70;
    *(_OWORD *)&unsigned char buf[48] = v70;
    *(_OWORD *)&uint8_t buf[16] = v70;
    *(_OWORD *)buf = v70;
    memset(&v126, 0, sizeof(v126));
    v123[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v123);
    localtime_r(v123, &v126);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::pipeEvent EXIT readOffset : %d entry:%u\n", *v2, *((_DWORD *)this + 4));
  }
  uint64_t v71 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&buf[4] = v120;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v5;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = v117;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v4;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v118;
      *(_WORD *)&unsigned char buf[32] = 1024;
      *(_DWORD *)&buf[34] = v119;
      time_t v72 = v71;
      goto LABEL_120;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)&buf[4] = v120;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v5;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&uint8_t buf[16] = v117;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v4;
    *(_WORD *)&buf[26] = 1024;
    *(_DWORD *)&buf[28] = v118;
    *(_WORD *)&unsigned char buf[32] = 1024;
    *(_DWORD *)&buf[34] = v119;
    time_t v72 = &_os_log_internal;
LABEL_120:
    _os_log_impl(&dword_209928000, v72, OS_LOG_TYPE_DEFAULT, "CCLogTap::pipeEvent Event Count - Empty (%d) Reserved (%d) Written (%d) Padding (%d) Capture (%d) Skip (%d)\n", buf, 0x26u);
  }
  if (glog_fd)
  {
    *(void *)&long long v73 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v73 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v130 = v73;
    long long v131 = v73;
    long long v128 = v73;
    long long v129 = v73;
    *(_OWORD *)&unsigned char buf[32] = v73;
    *(_OWORD *)&unsigned char buf[48] = v73;
    *(_OWORD *)&uint8_t buf[16] = v73;
    *(_OWORD *)buf = v73;
    memset(&v126, 0, sizeof(v126));
    v123[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v123);
    localtime_r(v123, &v126);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v126);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::pipeEvent Event Count - Empty (%d) Reserved (%d) Written (%d) Padding (%d) Capture (%d) Skip (%d)\n", v120, v5, v117, v4, v118, v119);
  }
  return 0;
}

void fillCaptureDescriptionStringFromMetaData(uint64_t a1, char *a2, void *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a5)
  {
    int v12 = (char *)malloc_type_malloc(a6 + a4, 0x199AA8B2uLL);
    memcpy(v12, a3, a4);
    memcpy(&v12[a4], a5, a6);
    a3 = v12;
  }
  else
  {
    int v12 = 0;
  }
  time_t v14 = *a3;
  memset(&v13, 0, sizeof(v13));
  localtime_r(&v14, &v13);
  if (a1) {
    snprintf(a2, 0x200uLL, "%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", a1, (v13.tm_year + 1900), (v13.tm_mon + 1));
  }
  else {
    snprintf(a2, 0x200uLL, "[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", (v13.tm_year + 1900), (v13.tm_mon + 1), v13.tm_mday);
  }
  if (v12) {
    free(v12);
  }
}

uint64_t _logTapInterestCallback_dext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending) {
    return (*(uint64_t (**)(void))(*(void *)result + 144))();
  }
  return result;
}

uint64_t _logTapInterestCallback_kext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending) {
    return (*(uint64_t (**)(void))(*(void *)result + 144))();
  }
  return result;
}

uint64_t CCLogTap::capture(uint64_t a1, const void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    uint64_t v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    atomic_uint v7 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v8 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v9;
    atomic_uint v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::capture, Owner:%s Name:%s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v10;
    long long v26 = v10;
    long long v23 = v10;
    long long v24 = v10;
    long long v21 = v10;
    long long v22 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&uint8_t buf[16] = v10;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    int v11 = glog_fd;
    int v12 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    tm v13 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v11, "CCLogTap::capture, Owner:%s Name:%s\n", v12, v13);
  }
  time_t v14 = *(const void **)(a1 + 64);
  if (v14) {
  else
  }
    uint64_t v15 = 0;
  *(CFAbsoluteTime *)(a1 + 352) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(a1 + 345) = 1;
  if (v15) {
    uint64_t v16 = IOConnectCallMethod(v15[22], 8u, 0, 0, a2, 0x90uLL, 0, 0, 0, 0);
  }
  else {
    uint64_t v16 = 0;
  }
  *(CFAbsoluteTime *)(a1 + 352) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(a1 + 345) = 0;
  return v16;
}

uint64_t CCLogTap::profileRemoved(CFStringRef *this)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    uint64_t v4 = CFStringGetCStringPtr(this[6], 0);
    int v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v5;
    uint64_t v6 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    atomic_uint v7 = CFStringGetCStringPtr(this[5], 0);
    int v8 = CFStringGetCStringPtr(this[6], 0);
    int v9 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v9;
    uint64_t v6 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "CCLogTap::profileRemoved, Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v10;
    long long v25 = v10;
    long long v22 = v10;
    long long v23 = v10;
    long long v20 = v10;
    long long v21 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&uint8_t buf[16] = v10;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v11 = glog_fd;
    int v12 = CFStringGetCStringPtr(this[5], 0);
    tm v13 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v11, "CCLogTap::profileRemoved, Owner:%s Name:%s entry:%u\n", v12, v13, *((_DWORD *)this + 4));
  }
  CFStringRef v14 = this[8];
  if (v14)
  {
    if (v15) {
      IOConnectCallMethod(v15[22], 0xFu, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return 0;
}

uint64_t CCLogTap::profileLoaded(CFStringRef *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    uint64_t v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v4;
    int v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v6 = CFStringGetCStringPtr(this[5], 0);
    atomic_uint v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v7;
    int v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::profileLoaded, Owner:%s Name:%s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v8;
    long long v23 = v8;
    long long v20 = v8;
    long long v21 = v8;
    long long v18 = v8;
    long long v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    int v9 = glog_fd;
    long long v10 = CFStringGetCStringPtr(this[5], 0);
    int v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCLogTap::profileLoaded, Owner:%s Name:%s\n", v10, v11);
  }
  CFStringRef v12 = this[8];
  if (v12)
  {
    if (v13) {
      IOConnectCallMethod(v13[22], 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return 0;
}

char *CCLogTap::withRegistryEntry(CCLogTap *this)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (char *)malloc_type_malloc(0x168uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + pthread_setname_np((const char *)this + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  *(_OWORD *)(v2 + 280) = 0u;
  *(_OWORD *)(v2 + 296) = 0u;
  *(_OWORD *)(v2 + 312) = 0u;
  *(_OWORD *)(v2 + 328) = 0u;
  *(_OWORD *)(v2 + 344) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)uint64_t v2 = &unk_26BD71B88;
  if (CCLogTap::initWithRegistryEntry((CFAbsoluteTime *)v2, this)) {
    return v2;
  }
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = v3;
LABEL_11:
      _os_log_error_impl(&dword_209928000, v4, OS_LOG_TYPE_ERROR, "CCLogTap::withRegistryEntry failed\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v4 = &_os_log_internal;
    goto LABEL_11;
  }
  if (glog_fd)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v15 = v5;
    long long v16 = v5;
    long long v13 = v5;
    long long v14 = v5;
    long long v11 = v5;
    long long v12 = v5;
    *(_OWORD *)buf = v5;
    long long v10 = v5;
    memset(&v8, 0, sizeof(v8));
    time_t v7 = 0xAAAAAAAAAAAAAAAALL;
    time(&v7);
    localtime_r(&v7, &v8);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v8);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::withRegistryEntry failed\n");
  }
  (*(void (**)(char *))(*(void *)v2 + 48))(v2);
  return 0;
}

uint64_t CCLogTap::freeResources(uint64_t this)
{
  *(unsigned char *)(this + 56) = 1;
  return this;
}

mach_port_t *CCLogTap::updateLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::updateLogFlags\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)buf = v6;
    long long v11 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::updateLogFlags\n");
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xDu, 0, 0, a2, 0x204uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::updateConsoleLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::updateConsoleLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::updateConsoleLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xEu, 0, 0, a2, 0x204uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 4u, 0, 0, a2, 0x108uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setLogLevel(uint64_t a1, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setLogLevel Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setLogLevel Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 5u, 0, 0, a2, 0x104uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setConsoleLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setConsoleLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setConsoleLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 6u, 0, 0, a2, 0x108uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setConsoleLogLevel(uint64_t a1, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setConsoleLogLevel Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setConsoleLogLevel Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 7u, 0, 0, a2, 0x104uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setNotifyTimeout(uint64_t a1, const void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::setNotifyTimeout\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)buf = v6;
    long long v11 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::setNotifyTimeout\n");
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 9u, 0, 0, a2, 4uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

mach_port_t *CCLogTap::setWatermarkLevel(uint64_t a1, const void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::setWatermarkLevel\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)buf = v6;
    long long v11 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::setWatermarkLevel\n");
  }
  uint64_t result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result) {
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xAu, 0, 0, a2, 4uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t CCLogTap::setPolicy(uint64_t a1, _DWORD *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    time_t v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    tm v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    int v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    time_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setPolicy, Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v12;
    long long v26 = v12;
    long long v23 = v12;
    long long v24 = v12;
    long long v21 = v12;
    long long v22 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    long long v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    long long v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setPolicy, Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  if (*a2 == 1) {
    (*(void (**)(void))(**(void **)(a1 + 64) + 96))(*(void *)(a1 + 64));
  }
  return IOConnectCallMethod(v16[22], 0xBu, 0, 0, a2, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogTap::configureLogOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::configureLogOptions\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)buf = v6;
    long long v11 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::configureLogOptions\n");
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 104))(result, a2);
  }
  return result;
}

uint64_t CCObject::getRetainCount(CCObject *this)
{
  return *((unsigned __int16 *)this + 4);
}

uint64_t CCObject::ccfree(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

uint64_t CCObject::init(CCObject *this)
{
  return 1;
}

void CCObject::~CCObject(void *this)
{
  if (this) {
    free(this);
  }
}

void CCObject::CCObject(CCObject *this)
{
  *(void *)this = &unk_26BD71C48;
  *((_DWORD *)this + 2) = 1;
}

{
  *(void *)this = &unk_26BD71C48;
  *((_DWORD *)this + 2) = 1;
}

void CCObject::operator delete(void *a1)
{
  if (a1) {
    free(a1);
  }
}

void CCObject::operator new(CCObject *this)
{
  uint64_t v2 = malloc_type_malloc((size_t)this, 0xEE9A6C17uLL);

  bzero(v2, (size_t)this);
}

uint64_t CCPipeInterface::getUserClientID(CCPipeInterface *this)
{
  return 0;
}

uint64_t CCPipeInterface::openUserClient(CCPipeInterface *this)
{
  return 0;
}

uint64_t CCPipeInterface::initWithRegistryEntry(CCPipeInterface *this, io_registry_entry_t a2, CCTap *a3)
{
  kern_return_t v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  long long v18;
  int v20;
  int v21;
  long long v22;
  kern_return_t v23;
  CFAllocatorRef v24;
  CFStringRef CFProperty;
  CFStringRef v26;
  const char *CStringPtr;
  const char *v28;
  NSObject *v29;
  long long v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  time_t v37;
  tm v38;
  unsigned char buf[32];
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  uint64_t v46;

  int v46 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 20) = 0;
  *((_DWORD *)this + 21) = a2;
  int v6 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  if (v6)
  {
    int v7 = v6;
    uint64_t v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      tm v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      tm v9 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_10:
    if (glog_fd)
    {
      *(void *)&uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      int v44 = v18;
      long long v45 = v18;
      int v42 = v18;
      long long v43 = v18;
      int v40 = v18;
      unint64_t v41 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&uint8_t buf[16] = v18;
      memset(&v38, 0, sizeof(v38));
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      time(&v37);
      localtime_r(&v37, &v38);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "ERROR INIT MUTEX: %d\n", v7);
    }
    return 0;
  }
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 13) = a3;
  io_service_t v10 = *((_DWORD *)this + 21);
  task_port_t v11 = *MEMORY[0x263EF8960];
  uint32_t v12 = (*(uint64_t (**)(CCPipeInterface *))(*(void *)this + 128))(this);
  long long v13 = IOServiceOpen(v10, v11, v12, (io_connect_t *)this + 22);
  if (v13)
  {
LABEL_23:
    long long v23 = v13;
    long long v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a2, @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    long long v26 = (const __CFString *)IORegistryEntryCreateCFProperty(a2, @"Name", v24, 0);
    if (coreCaptureOsLog)
    {
      unint64_t v36 = coreCaptureOsLog;
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(CFProperty, 0);
        uint64_t v28 = CFStringGetCStringPtr(v26, 0);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = CStringPtr;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v23;
        long long v29 = v36;
LABEL_35:
        _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "CCPipeInterface::initWithRegistryEntry [pipeOwner: %s, pipeName: %s] Failed to initialize returned %x\n", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      unint64_t v34 = CFStringGetCStringPtr(CFProperty, 0);
      uint64_t v35 = CFStringGetCStringPtr(v26, 0);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v23;
      long long v29 = &_os_log_internal;
      goto LABEL_35;
    }
    if (glog_fd)
    {
      *(void *)&int v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      int v44 = v30;
      long long v45 = v30;
      int v42 = v30;
      long long v43 = v30;
      int v40 = v30;
      unint64_t v41 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&uint8_t buf[16] = v30;
      memset(&v38, 0, sizeof(v38));
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      time(&v37);
      localtime_r(&v37, &v38);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
      dprintf(glog_fd, "%s ", buf);
      long long v31 = glog_fd;
      uint64_t v32 = CFStringGetCStringPtr(CFProperty, 0);
      int v33 = CFStringGetCStringPtr(v26, 0);
      dprintf(v31, "CCPipeInterface::initWithRegistryEntry [pipeOwner: %s, pipeName: %s] Failed to initialize returned %x\n", v32, v33, v23);
    }
    if (v26) {
      CFRelease(v26);
    }
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    CCPipeInterface::freeResources(this);
    return 0;
  }
  *((_DWORD *)this + 20) = 1;
  long long v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    long long v15 = *((_DWORD *)this + 21);
    long long v16 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v15;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v16;
    long long v17 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    long long v20 = *((_DWORD *)this + 21);
    long long v21 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v20;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    long long v17 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::initWithRegistryEntry entry:%u fConnectRef(%u)\n", buf, 0xEu);
LABEL_16:
  if (glog_fd)
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    int v44 = v22;
    long long v45 = v22;
    int v42 = v22;
    long long v43 = v22;
    int v40 = v22;
    unint64_t v41 = v22;
    *(_OWORD *)buf = v22;
    *(_OWORD *)&uint8_t buf[16] = v22;
    memset(&v38, 0, sizeof(v38));
    unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
    time(&v37);
    localtime_r(&v37, &v38);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::initWithRegistryEntry entry:%u fConnectRef(%u)\n", *((_DWORD *)this + 21), *((_DWORD *)this + 22));
  }
  long long v13 = (*(uint64_t (**)(CCPipeInterface *))(*(void *)this + 120))(this);
  if (v13) {
    goto LABEL_23;
  }
  *((_DWORD *)this + 20) = 2;
  return 1;
}

uint64_t CCPipeInterface::freeResources(CCPipeInterface *this)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 16);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  uint64_t v3 = (IONotificationPort *)*((void *)this + 15);
  if (v3) {
    IONotificationPortSetDispatchQueue(v3, 0);
  }
  uint64_t v4 = *((void *)this + 17);
  if (v4)
  {
    long long v5 = &__block_literal_global;
  }
  else
  {
    uint64_t v4 = _gQueuePrivate;
    long long v5 = &__block_literal_global_16;
  }
  dispatch_sync(v4, v5);
  if (*((int *)this + 20) >= 1)
  {
    uint64_t v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *((_DWORD *)this + 21);
        int v8 = *((_DWORD *)this + 22);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v7;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v8;
        tm v9 = v6;
LABEL_14:
        _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::IOServiceClose entry:%u fConnectRef(%d)\n", buf, 0xEu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((_DWORD *)this + 21);
      int v11 = *((_DWORD *)this + 22);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v10;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v11;
      tm v9 = &_os_log_internal;
      goto LABEL_14;
    }
    if (glog_fd)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v24 = v12;
      long long v25 = v12;
      long long v22 = v12;
      long long v23 = v12;
      long long v20 = v12;
      long long v21 = v12;
      *(_OWORD *)buf = v12;
      long long v19 = v12;
      memset(&v17, 0, sizeof(v17));
      time_t v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeInterface::IOServiceClose entry:%u fConnectRef(%d)\n", *((_DWORD *)this + 21), *((_DWORD *)this + 22));
    }
    IOServiceClose(*((_DWORD *)this + 22));
    *((_DWORD *)this + 20) = 0;
  }
  long long v13 = (IONotificationPort *)*((void *)this + 15);
  if (v13) {
    IONotificationPortDestroy(v13);
  }
  long long v14 = *((void *)this + 17);
  if (v14)
  {
    dispatch_release(v14);
    *((void *)this + 17) = 0;
  }
  return pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

uint64_t CCPipeInterface::getDispatchQueue(CCPipeInterface *this)
{
  if (*((void *)this + 17)) {
    return *((void *)this + 17);
  }
  else {
    return _gQueuePrivate;
  }
}

void CCPipeInterface::setDispatchQueue(CCPipeInterface *this)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v39 = xmmword_209961ACE;
  long long v40 = unk_209961ADE;
  long long v41 = xmmword_209961AEE;
  long long v42 = unk_209961AFE;
  long long v35 = xmmword_209961A8E;
  long long v36 = unk_209961A9E;
  long long v37 = xmmword_209961AAE;
  long long v38 = unk_209961ABE;
  long long v31 = xmmword_209961A4E;
  long long v32 = unk_209961A5E;
  long long v33 = xmmword_209961A6E;
  long long v34 = unk_209961A7E;
  strcpy(__dst, "com.apple.corecaptured_");
  uint64_t v28 = unk_209961A26;
  long long v29 = xmmword_209961A2E;
  long long v30 = unk_209961A3E;
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v3 = *((_DWORD *)this + 21);
    int v4 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v3;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v4;
    long long v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v6 = *((_DWORD *)this + 21);
    int v7 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v6;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v7;
    long long v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::setDispatchQueue entry:%u fConnectRef(%d)\n", buf, 0xEu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v8;
    long long v26 = v8;
    long long v23 = v8;
    long long v24 = v8;
    long long v21 = v8;
    long long v22 = v8;
    *(_OWORD *)buf = v8;
    long long v20 = v8;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeInterface::setDispatchQueue entry:%u fConnectRef(%d)\n", *((_DWORD *)this + 21), *((_DWORD *)this + 22));
  }
  if (!*((void *)this + 17))
  {
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 21), @"Name", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFStringRef v10 = CFProperty;
      CFIndex Length = CFStringGetLength(CFProperty);
      long long v12 = (char *)malloc_type_malloc(Length + 1, 0xB725812BuLL);
      if (v12)
      {
        CFIndex v13 = CFStringGetLength(v10);
        if (CFStringGetCString(v10, v12, v13 + 1, 0))
        {
          strlcat(__dst, v12, 0x100uLL);
          *((void *)this + 17) = dispatch_queue_create(__dst, 0);
        }
      }
      CFRelease(v10);
      free(v12);
      if (!*((void *)this + 17))
      {
        uint64_t v14 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_WORD *)buf = 0;
          long long v15 = v14;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_WORD *)buf = 0;
          long long v15 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCPipeInterface::setDispatchQueue failed to create a serial dispatch queue for continuous pipe\n", buf, 2u);
LABEL_20:
        if (glog_fd)
        {
          *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v25 = v16;
          long long v26 = v16;
          long long v23 = v16;
          long long v24 = v16;
          long long v21 = v16;
          long long v22 = v16;
          *(_OWORD *)buf = v16;
          long long v20 = v16;
          memset(&v18, 0, sizeof(v18));
          time_t v17 = 0xAAAAAAAAAAAAAAAALL;
          time(&v17);
          localtime_r(&v17, &v18);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCPipeInterface::setDispatchQueue failed to create a serial dispatch queue for continuous pipe\n");
        }
      }
    }
  }
}

uint64_t CCPipeInterface::isNotificationPortSet(CCPipeInterface *this)
{
  return *((unsigned __int8 *)this + 96);
}

uint64_t CCPipeInterface::setNotificationPort(CCPipeInterface *this)
{
  kern_return_t v3;
  kern_return_t inserted;
  kern_return_t attributes;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  long long v13;
  kern_return_t v15;
  uint64_t v16;
  NSObject *v17;
  kern_return_t v18;
  uint64_t v19;
  NSObject *v20;
  kern_return_t v21;
  uint64_t v22;
  NSObject *v23;
  long long v24;
  long long v25;
  long long v26;
  time_t v27;
  tm v28;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out;
  mach_port_name_t name;
  unsigned char buf[32];
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  uint64_t v39;

  long long v39 = *MEMORY[0x263EF8340];
  port_info_out = -1431655766;
  name = 0;
  port_info_outCnt = -1431655766;
  uint64_t v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  int v3 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name);
  if (!v3)
  {
    inserted = mach_port_insert_right(*v2, name, name, 0x14u);
    if (!inserted)
    {
      port_info_outCnt = 1;
      attributes = mach_port_get_attributes(*v2, name, 1, &port_info_out, &port_info_outCnt);
      if (!attributes)
      {
        port_info_out = 10;
        MEMORY[0x210507900](*v2, name, 1, &port_info_out, 1);
        int v6 = 0;
        if (MEMORY[0x210507370](*((unsigned int *)this + 22), 0, name, 0))
        {
          *((void *)this + 15) = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
        }
        else
        {
          *((unsigned char *)this + 96) = 1;
          *((_DWORD *)this + 23) = name;
        }
        goto LABEL_7;
      }
      long long v21 = attributes;
      long long v22 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v21;
        long long v23 = v22;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v21;
        long long v23 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_get_attributes failed kr[0x%08x]\n", buf, 8u);
LABEL_34:
      int v6 = 3758097084;
      if (glog_fd)
      {
        *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v37 = v26;
        long long v38 = v26;
        long long v35 = v26;
        long long v36 = v26;
        long long v34 = v26;
        *(_OWORD *)&uint8_t buf[16] = v26;
        long long v33 = v26;
        *(_OWORD *)buf = v26;
        memset(&v28, 0, sizeof(v28));
        uint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
        time(&v27);
        localtime_r(&v27, &v28);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_get_attributes failed kr[0x%08x]\n");
      }
      goto LABEL_7;
    }
    tm v18 = inserted;
    long long v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v18;
      long long v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v18;
      long long v20 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_insert_right failed kr[0x%08x]\n", buf, 8u);
LABEL_31:
    int v6 = 3758097103;
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v37 = v25;
      long long v38 = v25;
      long long v35 = v25;
      long long v36 = v25;
      long long v34 = v25;
      *(_OWORD *)&uint8_t buf[16] = v25;
      long long v33 = v25;
      *(_OWORD *)buf = v25;
      memset(&v28, 0, sizeof(v28));
      uint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_insert_right failed kr[0x%08x]\n");
    }
    goto LABEL_7;
  }
  long long v15 = v3;
  long long v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      time_t v17 = v16;
LABEL_37:
      _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_allocate failed kr[0x%08x]\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v15;
    time_t v17 = &_os_log_internal;
    goto LABEL_37;
  }
  if (glog_fd)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v37 = v24;
    long long v38 = v24;
    long long v35 = v24;
    long long v36 = v24;
    long long v34 = v24;
    *(_OWORD *)&uint8_t buf[16] = v24;
    long long v33 = v24;
    *(_OWORD *)buf = v24;
    memset(&v28, 0, sizeof(v28));
    uint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_allocate failed kr[0x%08x]\n", v15);
  }
  int v6 = 3758097085;
LABEL_7:
  int v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    long long v8 = *((unsigned __int8 *)this + 96);
    tm v9 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "setNotificationPort";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 349;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v6;
    *(_WORD *)&buf[30] = 1024;
    LODWORD(v33) = v9;
    CFStringRef v10 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v11 = *((unsigned __int8 *)this + 96);
    long long v12 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "setNotificationPort";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 349;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v11;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v6;
    *(_WORD *)&buf[30] = 1024;
    LODWORD(v33) = v12;
    CFStringRef v10 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s::%d fNotificationPortIsSet:%d rc:%d entry:%u", buf, 0x24u);
LABEL_13:
  if (glog_fd)
  {
    *(void *)&CFIndex v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v37 = v13;
    long long v38 = v13;
    long long v35 = v13;
    long long v36 = v13;
    long long v34 = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    long long v33 = v13;
    *(_OWORD *)buf = v13;
    memset(&v28, 0, sizeof(v28));
    uint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::%s::%d fNotificationPortIsSet:%d rc:%d entry:%u", "setNotificationPort", 349, *((unsigned __int8 *)this + 96), v6, *((_DWORD *)this + 21));
  }
  return v6;
}

uint64_t CCPipeInterface::wakeupTapLoopInternal(CCPipeInterface *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 96)) {
    return 0;
  }
  mach_port_t v2 = *((_DWORD *)this + 23);
  if (!v2) {
    return 0;
  }
  *(void *)&msg.msgh_voucher_port = 0;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&msg.msgh_bits = 0x2000000013;
  msg.msgh_remote_port = v2;
  msg.msgh_local_port = 0;
  uint64_t v3 = mach_msg(&msg, 1, 0x20u, 0, 0, 0, 0);
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "wakeupTapLoopInternal";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 305;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v5;
    int v6 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v7 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "wakeupTapLoopInternal";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 305;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v7;
    int v6 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d mach_msg SEND_MSG kr:%u entry:%u", buf, 0x1Eu);
LABEL_10:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v8;
    long long v20 = v8;
    long long v17 = v8;
    long long v18 = v8;
    long long v15 = v8;
    long long v16 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v11, 0, sizeof(v11));
    time_t v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    localtime_r(&v10, &v11);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::%s:%d mach_msg SEND_MSG kr:%u entry:%u", "wakeupTapLoopInternal", 305, v3, *((_DWORD *)this + 21));
  }
  return v3;
}

uint64_t CCPipeInterface::waitForEvent(CCPipeInterface *this, void (*a2)(void *, int, void **, unsigned int), void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v48 = v6;
  long long v49 = v6;
  *(_OWORD *)reference = v6;
  long long v47 = v6;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 21), @"LogPolicy", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  int valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (valuePtr == 1) {
    (*(void (**)(CCPipeInterface *))(*(void *)this + 96))(this);
  }
  if (*((void *)this + 17)) {
    long long v8 = *((void *)this + 17);
  }
  else {
    long long v8 = _gQueuePrivate;
  }
  if (!*((unsigned char *)this + 96))
  {
    unint64_t v13 = (IONotificationPort *)*((void *)this + 15);
    if (!v13) {
      return 3758097084;
    }
    IONotificationPortSetDispatchQueue(v13, v8);
    reference[1] = (uint64_t)a2;
    *(void *)&long long v47 = a3;
    mach_port_t v14 = *((_DWORD *)this + 22);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 15));
    uint64_t v16 = IOConnectCallAsyncStructMethod(v14, 0, MachPort, reference, 3u, 0, 0, 0, 0);
    if (!v16)
    {
LABEL_39:
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
      if (!*(unsigned char *)(*((void *)this + 13) + 56))
      {
LABEL_48:
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
        return v16;
      }
      uint64_t v29 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_46;
        }
        int v30 = *((_DWORD *)this + 21);
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "waitForEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 248;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v16;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v30;
        long long v31 = v29;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_46;
        }
        int v32 = *((_DWORD *)this + 21);
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "waitForEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 248;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v16;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v32;
        long long v31 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v31, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d rcvd terminate msg:0x%x entry:%u", buf, 0x1Eu);
LABEL_46:
      if (glog_fd)
      {
        *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v44 = v33;
        long long v45 = v33;
        long long v42 = v33;
        long long v43 = v33;
        long long v40 = v33;
        long long v41 = v33;
        *(_OWORD *)buf = v33;
        *(_OWORD *)&uint8_t buf[16] = v33;
        memset(&v37, 0, sizeof(v37));
        time_t v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCPipeInterface::%s:%d rcvd terminate msg:0x%x entry:%u", "waitForEvent", 248, v16, *((_DWORD *)this + 21));
      }
      goto LABEL_48;
    }
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      int v18 = *((unsigned __int8 *)this + 96);
      int v19 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 243;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v18;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v19;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v40) = v16;
      long long v20 = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      int v26 = *((unsigned __int8 *)this + 96);
      int v27 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 243;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v26;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v27;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v40) = v16;
      long long v20 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v20, OS_LOG_TYPE_DEFAULT, "IOConnectCallAsyncStructMethod FAILED CCPipeInterface::%s::%d fNotificationPortIsSet:%d entry:%u kr[0x%08x]", buf, 0x24u);
LABEL_37:
    if (glog_fd)
    {
      *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v44 = v28;
      long long v45 = v28;
      long long v42 = v28;
      long long v43 = v28;
      long long v40 = v28;
      long long v41 = v28;
      *(_OWORD *)buf = v28;
      *(_OWORD *)&uint8_t buf[16] = v28;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "IOConnectCallAsyncStructMethod FAILED CCPipeInterface::%s::%d fNotificationPortIsSet:%d entry:%u kr[0x%08x]", "waitForEvent", 243, *((unsigned __int8 *)this + 96), *((_DWORD *)this + 21), v16);
    }
    goto LABEL_39;
  }
  tm v9 = dispatch_source_create(MEMORY[0x263EF83C8], *((unsigned int *)this + 23), 0, v8);
  *((void *)this + 16) = v9;
  if (v9)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___ZN15CCPipeInterface12waitForEventEPFvPviPS0_jES0__block_invoke;
    handler[3] = &__block_descriptor_tmp_26;
    handler[4] = this;
    void handler[5] = a2;
    handler[6] = a3;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_activate(*((dispatch_object_t *)this + 16));
    if (!*(unsigned char *)(*((void *)this + 13) + 56)) {
      return 0;
    }
    uint64_t v10 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      int v11 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 281;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v11;
      long long v12 = v10;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      int v23 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 281;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v23;
      long long v12 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d rcvd terminate signal entry:%u", buf, 0x18u);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v44 = v24;
      long long v45 = v24;
      long long v42 = v24;
      long long v43 = v24;
      long long v40 = v24;
      long long v41 = v24;
      *(_OWORD *)buf = v24;
      *(_OWORD *)&uint8_t buf[16] = v24;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPipeInterface::%s:%d rcvd terminate signal entry:%u", "waitForEvent", 281, *((_DWORD *)this + 21));
    }
    return 0;
  }
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    long long v22 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    long long v22 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v22, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::dispatch_source_create failed", buf, 2u);
LABEL_32:
  uint64_t v16 = 3758097084;
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v44 = v25;
    long long v45 = v25;
    long long v42 = v25;
    long long v43 = v25;
    long long v40 = v25;
    long long v41 = v25;
    *(_OWORD *)buf = v25;
    *(_OWORD *)&uint8_t buf[16] = v25;
    memset(&v37, 0, sizeof(v37));
    time_t v36 = 0xAAAAAAAAAAAAAAAALL;
    time(&v36);
    localtime_r(&v36, &v37);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::dispatch_source_create failed");
  }
  return v16;
}

uint64_t ___ZN15CCPipeInterface12waitForEventEPFvPviPS0_jES0__block_invoke(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v2;
  v6[1] = v2;
  mach_port_name_t v3 = *(_DWORD *)(v1 + 92);
  if (v3)
  {
    if (!*(unsigned char *)(*(void *)(v1 + 104) + 56))
    {
      uint64_t v4 = result;
      uint64_t v5 = mach_msg((mach_msg_header_t *)v6, 2, 0, 0x20u, v3, 0, 0);
      return (*(uint64_t (**)(void, uint64_t, void, void))(v4 + 40))(*(void *)(v4 + 48), v5, 0, 0);
    }
  }
  return result;
}

void CCPipeInterface::CCPipeInterface(CCPipeInterface *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71C90;
}

CCPipeInterface *CCPipeInterface::withRegistryEntry(CCPipeInterface *this, CCTap *a2, CCTap *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"PipeType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  char valuePtr = -86;
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  int v7 = valuePtr;
  if (valuePtr)
  {
    if (valuePtr == 1)
    {
      long long v8 = CCDataPipeInterface::withRegistryEntry(this, a2, v6);
      goto LABEL_5;
    }
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      long long v12 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "CCPipeInterface::withRegistryEntry Unsupported pipe type(%d) \n", buf, 8u);
LABEL_12:
    if (glog_fd)
    {
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v23 = v13;
      long long v24 = v13;
      long long v21 = v13;
      long long v22 = v13;
      long long v19 = v13;
      long long v20 = v13;
      *(_OWORD *)buf = v13;
      long long v18 = v13;
      memset(&v15, 0, sizeof(v15));
      time_t v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeInterface::withRegistryEntry Unsupported pipe type(%d) \n", valuePtr);
    }
    tm v9 = 0;
    if (CFProperty) {
      goto LABEL_6;
    }
    return v9;
  }
  long long v8 = CCLogPipeInterface::withRegistryEntry(this, a2, v6);
LABEL_5:
  tm v9 = v8;
  if (CFProperty) {
LABEL_6:
  }
    CFRelease(CFProperty);
  return v9;
}

uint64_t CCPipeMonitor::initWithDictionary(CCPipeMonitor *this, CFTypeRef cf)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!coreCaptureOsLog)
  {
    coreCaptureOsLog = (uint64_t)os_log_create("com.apple.corecaptured", "corecapture");
    if (!coreCaptureOsLog)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_209928000, &_os_log_internal, OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to create OS LOG.\n", buf, 2u);
      }
      if (glog_fd)
      {
        *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v28 = v4;
        long long v29 = v4;
        long long v26 = v4;
        long long v27 = v4;
        long long v24 = v4;
        long long v25 = v4;
        *(_OWORD *)buf = v4;
        long long v23 = v4;
        memset(&v21, 0, sizeof(v21));
        time_t v20 = 0xAAAAAAAAAAAAAAAALL;
        time(&v20);
        localtime_r(&v20, &v21);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to create OS LOG.\n");
      }
    }
  }
  *((void *)this + 9) = 0;
  CCServiceMonitor::initWithDictionary(this, cf);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  *((void *)this + 7) = Mutable;
  if (!Mutable)
  {
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = &_os_log_internal;
    }
    _os_log_fault_impl(&dword_209928000, v10, OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to create pipe dictionary.\n", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v28 = v15;
      long long v29 = v15;
      long long v26 = v15;
      long long v27 = v15;
      long long v24 = v15;
      long long v25 = v15;
      *(_OWORD *)buf = v15;
      long long v23 = v15;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to create pipe dictionary.\n");
    }
    return 0;
  }
  Instance = CCIOReportDumpQueue::createInstance(Mutable);
  *((void *)this + 8) = Instance;
  if (!Instance)
  {
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v12 = &_os_log_internal;
    }
    _os_log_fault_impl(&dword_209928000, v12, OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to CCIOReportDumpProcessor.\n", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v28 = v17;
      long long v29 = v17;
      long long v26 = v17;
      long long v27 = v17;
      long long v24 = v17;
      long long v25 = v17;
      *(_OWORD *)buf = v17;
      long long v23 = v17;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to CCIOReportDumpProcessor.\n");
    }
    return 0;
  }
  if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 80), 0))
  {
    if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 144), 0))
    {
      CCServiceMonitor::scanServices((uint64_t)this);
      return 1;
    }
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      time_t v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      time_t v14 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCPipeMonitor::CCPipeMonitor Failed to initialize fMutex\n", buf, 2u);
LABEL_34:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v28 = v19;
      long long v29 = v19;
      long long v26 = v19;
      long long v27 = v19;
      long long v24 = v19;
      long long v25 = v19;
      *(_OWORD *)buf = v19;
      long long v23 = v19;
      memset(&v21, 0, sizeof(v21));
      time_t v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to initialize fMutex\n");
    }
    return 0;
  }
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v8 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v8, OS_LOG_TYPE_ERROR, "CCPipeMonitor::CCPipeMonitor Failed to initialize mutex\n", buf, 2u);
LABEL_27:
  if (glog_fd)
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v16;
    long long v29 = v16;
    long long v26 = v16;
    long long v27 = v16;
    long long v24 = v16;
    long long v25 = v16;
    *(_OWORD *)buf = v16;
    long long v23 = v16;
    memset(&v21, 0, sizeof(v21));
    time_t v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to initialize mutex\n");
  }
  return 0;
}

void CCPipeMonitor::serviceTerminated(CFDictionaryRef *this, io_registry_entry_t entry)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (entry)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(entry, @"Owner", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFStringRef v6 = CFProperty;
      CFStringRef v7 = (const __CFString *)IORegistryEntryCreateCFProperty(entry, @"Name", v4, 0);
      uint64_t v8 = coreCaptureOsLog;
      if (v7)
      {
        CFStringRef v9 = v7;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 340;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = CFStringGetCStringPtr(v6, 0);
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = CFStringGetCStringPtr(v9, 0);
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          uint64_t v10 = v8;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 340;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = CFStringGetCStringPtr(v6, 0);
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = CFStringGetCStringPtr(v9, 0);
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          uint64_t v10 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d Owner:%s Name:%s entry:%u", buf, 0x2Cu);
LABEL_10:
        if (glog_fd)
        {
          *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v46 = v11;
          long long v47 = v11;
          long long v44 = v11;
          long long v45 = v11;
          *(_OWORD *)&unsigned char buf[32] = v11;
          long long v43 = v11;
          *(_OWORD *)buf = v11;
          *(_OWORD *)&uint8_t buf[16] = v11;
          memset(&v41, 0, sizeof(v41));
          time_t v40 = 0xAAAAAAAAAAAAAAAALL;
          time(&v40);
          localtime_r(&v40, &v41);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
          dprintf(glog_fd, "%s ", buf);
          int v12 = glog_fd;
          CStringPtr = CFStringGetCStringPtr(v6, 0);
          time_t v14 = CFStringGetCStringPtr(v9, 0);
          dprintf(v12, "%s:%d Owner:%s Name:%s entry:%u", "serviceTerminated", 340, CStringPtr, v14, entry);
        }
        long long v15 = (pthread_mutex_t *)(this + 18);
        pthread_mutex_lock((pthread_mutex_t *)(this + 18));
        int Value = CFDictionaryGetValue(this[7], (const void *)entry);
        uint64_t v17 = coreCaptureOsLog;
        if (Value)
        {
          long long v18 = Value;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "serviceTerminated";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 350;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = entry;
              long long v19 = v17;
LABEL_21:
              _os_log_impl(&dword_209928000, v19, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::%s:%d Release Tap for entry:%u", buf, 0x18u);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "serviceTerminated";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 350;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = entry;
            long long v19 = &_os_log_internal;
            goto LABEL_21;
          }
          if (glog_fd)
          {
            *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v46 = v23;
            long long v47 = v23;
            long long v44 = v23;
            long long v45 = v23;
            *(_OWORD *)&unsigned char buf[32] = v23;
            long long v43 = v23;
            *(_OWORD *)buf = v23;
            *(_OWORD *)&uint8_t buf[16] = v23;
            memset(&v41, 0, sizeof(v41));
            time_t v40 = 0xAAAAAAAAAAAAAAAALL;
            time(&v40);
            localtime_r(&v40, &v41);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "CCPipeMonitor::%s:%d Release Tap for entry:%u", "serviceTerminated", 350, entry);
          }
          CFDictionaryRemoveValue(this[7], (const void *)entry);
          (*(void (**)(const void *))(*(void *)v18 + 48))(v18);
LABEL_30:
          pthread_mutex_unlock(v15);
          CFRelease(v9);
LABEL_31:
          CFRelease(v6);
          return;
        }
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          time_t v20 = CFStringGetCStringPtr(v6, 0);
          tm v21 = CFStringGetCStringPtr(v9, 0);
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 355;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v20;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v21;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          long long v22 = v17;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          long long v24 = CFStringGetCStringPtr(v6, 0);
          long long v25 = CFStringGetCStringPtr(v9, 0);
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 355;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v24;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v25;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          long long v22 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v22, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::%s:%d Tap corresponding to terminated Pipe not found Owner:%s Name:%s entry:%u", buf, 0x2Cu);
LABEL_28:
        if (glog_fd)
        {
          *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v46 = v26;
          long long v47 = v26;
          long long v44 = v26;
          long long v45 = v26;
          *(_OWORD *)&unsigned char buf[32] = v26;
          long long v43 = v26;
          *(_OWORD *)buf = v26;
          *(_OWORD *)&uint8_t buf[16] = v26;
          memset(&v41, 0, sizeof(v41));
          time_t v40 = 0xAAAAAAAAAAAAAAAALL;
          time(&v40);
          localtime_r(&v40, &v41);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
          dprintf(glog_fd, "%s ", buf);
          int v27 = glog_fd;
          long long v28 = CFStringGetCStringPtr(v6, 0);
          long long v29 = CFStringGetCStringPtr(v9, 0);
          dprintf(v27, "CCPipeMonitor::%s:%d Tap corresponding to terminated Pipe not found Owner:%s Name:%s entry:%u", "serviceTerminated", 355, v28, v29, entry);
        }
        goto LABEL_30;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "serviceTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 337;
        long long v34 = v8;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "serviceTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 337;
        long long v34 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_50:
      if (glog_fd)
      {
        *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v46 = v39;
        long long v47 = v39;
        long long v44 = v39;
        long long v45 = v39;
        *(_OWORD *)&unsigned char buf[32] = v39;
        long long v43 = v39;
        *(_OWORD *)buf = v39;
        *(_OWORD *)&uint8_t buf[16] = v39;
        memset(&v41, 0, sizeof(v41));
        time_t v40 = 0xAAAAAAAAAAAAAAAALL;
        time(&v40);
        localtime_r(&v40, &v41);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "Invalid argument @'%s':%06u", "serviceTerminated", 337);
      }
      goto LABEL_31;
    }
    uint64_t v32 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "serviceTerminated";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 334;
      long long v33 = v32;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "serviceTerminated";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 334;
      long long v33 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v33, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_46:
    if (glog_fd)
    {
      *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v38;
      long long v47 = v38;
      long long v44 = v38;
      long long v45 = v38;
      *(_OWORD *)&unsigned char buf[32] = v38;
      long long v43 = v38;
      *(_OWORD *)buf = v38;
      *(_OWORD *)&uint8_t buf[16] = v38;
      memset(&v41, 0, sizeof(v41));
      time_t v40 = 0xAAAAAAAAAAAAAAAALL;
      time(&v40);
      localtime_r(&v40, &v41);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
      dprintf(glog_fd, "%s ", buf);
      int v36 = glog_fd;
      int v37 = 334;
      goto LABEL_48;
    }
    return;
  }
  uint64_t v30 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "serviceTerminated";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 331;
    long long v31 = v30;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "serviceTerminated";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 331;
    long long v31 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_43:
  if (glog_fd)
  {
    *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v35;
    long long v47 = v35;
    long long v44 = v35;
    long long v45 = v35;
    *(_OWORD *)&unsigned char buf[32] = v35;
    long long v43 = v35;
    *(_OWORD *)buf = v35;
    *(_OWORD *)&uint8_t buf[16] = v35;
    memset(&v41, 0, sizeof(v41));
    time_t v40 = 0xAAAAAAAAAAAAAAAALL;
    time(&v40);
    localtime_r(&v40, &v41);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
    dprintf(glog_fd, "%s ", buf);
    int v36 = glog_fd;
    int v37 = 331;
LABEL_48:
    dprintf(v36, "Invalid argument @'%s':%06u", "serviceTerminated", v37);
  }
}

uint64_t CCPipeMonitor::stopPipeMonitor(CCPipeMonitor *this)
{
  if (!*((void *)this + 7)) {
    return 1;
  }
  long long v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  CFIndex Count = CFDictionaryGetCount(*((CFDictionaryRef *)this + 7));
  if (!Count)
  {
    pthread_mutex_unlock(v2);
    return 1;
  }
  CFIndex v4 = Count;
  size_t v5 = 8 * Count;
  CFStringRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (v6)
  {
    CFStringRef v7 = v6;
    uint64_t v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
    if (v8)
    {
      CFStringRef v9 = v8;
      CFDictionaryGetKeysAndValues(*((CFDictionaryRef *)this + 7), v7, v8);
      for (uint64_t i = 0; i != v4; ++i)
        (*(void (**)(const void *))(*(void *)v9[i] + 48))(v9[i]);
      pthread_mutex_unlock(v2);
      free(v7);
      free(v9);
      return 1;
    }
    free(v7);
  }
  pthread_mutex_unlock(v2);
  return 0;
}

void CCPipeMonitor::~CCPipeMonitor(void *this)
{
  if (this) {
    free(this);
  }
}

CCPipeMonitor *CCPipeMonitor::withDictionary(CCPipeMonitor *this, __CFDictionary *a2)
{
  mach_port_name_t v3 = (CCPipeMonitor *)malloc_type_malloc(0xD0uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v3 + 12) = 0u;
  *(_OWORD *)((char *)v3 + 28) = 0u;
  *(_OWORD *)((char *)v3 + 44) = 0u;
  *(_OWORD *)((char *)v3 + 60) = 0u;
  *(_OWORD *)((char *)v3 + 76) = 0u;
  *(_OWORD *)((char *)v3 + 92) = 0u;
  *(_OWORD *)((char *)v3 + 108) = 0u;
  *(_OWORD *)((char *)v3 + 124) = 0u;
  *(_OWORD *)((char *)v3 + 140) = 0u;
  *(_OWORD *)((char *)v3 + 156) = 0u;
  *(_OWORD *)((char *)v3 + 172) = 0u;
  *(_OWORD *)((char *)v3 + 188) = 0u;
  *((_DWORD *)v3 + 51) = 0;
  *((_DWORD *)v3 + 2) = 1;
  *(void *)mach_port_name_t v3 = &unk_26BD71D80;
  if ((CCPipeMonitor::initWithDictionary(v3, this) & 1) == 0)
  {
    (*(void (**)(CCPipeMonitor *))(*(void *)v3 + 48))(v3);
    return 0;
  }
  return v3;
}

uint64_t CCPipeMonitor::startPipeMonitor(CCPipeMonitor *this)
{
  return 1;
}

uint64_t CCPipeMonitor::isActive(CFDictionaryRef *this, double a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  CCPipeMonitor::cleanCaptureDirectories(this);
  if (*((unsigned char *)this + 12)) {
    return 1;
  }
  size_t v5 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::isActive:no tap found", buf, 2u);
LABEL_27:
    if (glog_fd)
    {
      *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v22;
      long long v34 = v22;
      long long v31 = v22;
      long long v32 = v22;
      long long v29 = v22;
      long long v30 = v22;
      *(_OWORD *)buf = v22;
      long long v28 = v22;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::isActive:no tap found");
    }
    goto LABEL_32;
  }
  uint64_t v7 = Count;
  size_t v8 = 8 * Count;
  CFStringRef v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v9)
  {
    uint64_t v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      long long v19 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "isActive:Failed to malloc memory for keyArray", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v23;
      long long v34 = v23;
      long long v31 = v23;
      long long v32 = v23;
      long long v29 = v23;
      long long v30 = v23;
      *(_OWORD *)buf = v23;
      long long v28 = v23;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "isActive:Failed to malloc memory for keyArray");
    }
LABEL_32:
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  long long v11 = (const void **)malloc_type_malloc(v8, 0x80040B8603338uLL);
  if (!v11)
  {
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        tm v21 = v20;
LABEL_40:
        _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "isActive:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      tm v21 = &_os_log_internal;
      goto LABEL_40;
    }
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v33 = v24;
      long long v34 = v24;
      long long v31 = v24;
      long long v32 = v24;
      long long v29 = v24;
      long long v30 = v24;
      *(_OWORD *)buf = v24;
      long long v28 = v24;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "isActive:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    long long v15 = v10;
    goto LABEL_13;
  }
  int v12 = v11;
  CFDictionaryGetKeysAndValues(this[7], v10, v11);
  if (v7 < 1)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    free(v10);
    long long v15 = v12;
LABEL_13:
    free(v15);
    goto LABEL_14;
  }
  for (uint64_t i = 0; i < v7; ++i)
  {
    char v14 = (*(uint64_t (**)(const void *, double))(*(void *)v12[i] + 64))(v12[i], a2);
    if (v14) {
      break;
    }
  }
  pthread_mutex_unlock(v5);
  free(v10);
  free(v12);
  if (v14) {
    return 1;
  }
LABEL_14:
  lowPriorityActivities();
  return 0;
}

void CCPipeMonitor::forEachTapWithOwnerAndPipe(CFDictionaryRef *this, const __CFString *a2, const __CFString *a3, void (*a4)(CCTap *, void *), void *a5)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  size_t v8 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v46 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      long long v47 = v46;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      long long v47 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v47, OS_LOG_TYPE_DEFAULT, "forEachTapWithOwnerAndPipe:no tap found", buf, 2u);
LABEL_47:
    if (glog_fd)
    {
      *(void *)&long long v52 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v65 = v52;
      long long v66 = v52;
      long long v63 = v52;
      long long v64 = v52;
      long long v61 = v52;
      long long v62 = v52;
      *(_OWORD *)buf = v52;
      *(_OWORD *)&uint8_t buf[16] = v52;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:no tap found");
    }
    goto LABEL_52;
  }
  CFIndex v10 = Count;
  size_t v11 = 8 * Count;
  int v12 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v12)
  {
    uint64_t v48 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      long long v49 = v48;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      long long v49 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v49, OS_LOG_TYPE_ERROR, "forEachTapWithOwnerAndPipe:Failed to malloc memory for keyArray", buf, 2u);
LABEL_50:
    if (glog_fd)
    {
      *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v65 = v53;
      long long v66 = v53;
      long long v63 = v53;
      long long v64 = v53;
      long long v61 = v53;
      long long v62 = v53;
      *(_OWORD *)buf = v53;
      *(_OWORD *)&uint8_t buf[16] = v53;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:Failed to malloc memory for keyArray");
    }
LABEL_52:
    pthread_mutex_unlock(v8);
    return;
  }
  uint64_t v13 = v12;
  char v14 = (const void **)malloc_type_malloc(v11, 0x80040B8603338uLL);
  if (!v14)
  {
    uint64_t v50 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        int v51 = v50;
LABEL_60:
        _os_log_error_impl(&dword_209928000, v51, OS_LOG_TYPE_ERROR, "forEachTapWithOwnerAndPipe:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v51 = &_os_log_internal;
      goto LABEL_60;
    }
    if (glog_fd)
    {
      *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v65 = v54;
      long long v66 = v54;
      long long v63 = v54;
      long long v64 = v54;
      long long v61 = v54;
      long long v62 = v54;
      *(_OWORD *)buf = v54;
      *(_OWORD *)&uint8_t buf[16] = v54;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v8);
    long long v43 = v13;
    goto LABEL_29;
  }
  long long v15 = v14;
  CFDictionaryGetKeysAndValues(this[7], v13, v14);
  uint64_t v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = CFStringGetCStringPtr(a2, 0);
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = CFStringGetCStringPtr(a3, 0);
      uint64_t v17 = v16;
LABEL_32:
      _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "%s Tap Find Tap with Owner:%s Name:%s\n", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = CFStringGetCStringPtr(a2, 0);
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = CFStringGetCStringPtr(a3, 0);
    uint64_t v17 = &_os_log_internal;
    goto LABEL_32;
  }
  unint64_t v55 = v8;
  if (glog_fd)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v65 = v18;
    long long v66 = v18;
    long long v63 = v18;
    long long v64 = v18;
    long long v61 = v18;
    long long v62 = v18;
    *(_OWORD *)buf = v18;
    *(_OWORD *)&uint8_t buf[16] = v18;
    memset(&v59, 0, sizeof(v59));
    time_t v58 = 0xAAAAAAAAAAAAAAAALL;
    time(&v58);
    localtime_r(&v58, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    int v19 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    tm v21 = CFStringGetCStringPtr(a3, 0);
    dprintf(v19, "%s Tap Find Tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", CStringPtr, v21);
  }
  for (uint64_t i = 0; i != v10; ++i)
  {
    long long v23 = (CFStringRef *)v15[i];
    if (!CCTap::findWithOwnerAndPipe(v23, a2, a3)) {
      continue;
    }
    uint64_t v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        time_t v25 = CFStringGetCStringPtr(a2, 0);
        tm v26 = CFStringGetCStringPtr(a3, 0);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v26;
        int v27 = v24;
LABEL_17:
        _os_log_impl(&dword_209928000, v27, OS_LOG_TYPE_DEFAULT, "%s Tap Found tap with Owner:%s Name:%s\n", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = CFStringGetCStringPtr(a2, 0);
      long long v29 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = v29;
      int v27 = &_os_log_internal;
      goto LABEL_17;
    }
    if (glog_fd)
    {
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v65 = v30;
      long long v66 = v30;
      long long v63 = v30;
      long long v64 = v30;
      long long v61 = v30;
      long long v62 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&uint8_t buf[16] = v30;
      memset(&v59, 0, sizeof(v59));
      time_t v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      int v31 = glog_fd;
      long long v32 = CFStringGetCStringPtr(a2, 0);
      long long v33 = CFStringGetCStringPtr(a3, 0);
      dprintf(v31, "%s Tap Found tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", v32, v33);
    }
    a4((CCTap *)v23, a5);
  }
  uint64_t v34 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    uint64_t v35 = v55;
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      int v36 = CFStringGetCStringPtr(a2, 0);
      int v37 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = v37;
      long long v38 = v34;
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v35 = v55;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v44 = CFStringGetCStringPtr(a2, 0);
      long long v45 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = v45;
      long long v38 = &_os_log_internal;
LABEL_34:
      _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "%s CANNOT FIND tap with Owner:%s Name:%s\n", buf, 0x20u);
    }
  }
  if (glog_fd)
  {
    *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v65 = v39;
    long long v66 = v39;
    long long v63 = v39;
    long long v64 = v39;
    long long v61 = v39;
    long long v62 = v39;
    *(_OWORD *)buf = v39;
    *(_OWORD *)&uint8_t buf[16] = v39;
    memset(&v59, 0, sizeof(v59));
    time_t v58 = 0xAAAAAAAAAAAAAAAALL;
    time(&v58);
    localtime_r(&v58, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    int v40 = glog_fd;
    tm v41 = CFStringGetCStringPtr(a2, 0);
    long long v42 = CFStringGetCStringPtr(a3, 0);
    dprintf(v40, "%s CANNOT FIND tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", v41, v42);
  }
  pthread_mutex_unlock(v35);
  free(v13);
  long long v43 = v15;
LABEL_29:
  free(v43);
}

void CCPipeMonitor::forEachTapWithDirectory(CFDictionaryRef *this, const __CFString *a2, void (*a3)(CCTap *, void *), void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  size_t v8 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      int v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      int v19 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v19, OS_LOG_TYPE_DEFAULT, "forEachTapWithDirectory:no tap found", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v24;
      long long v36 = v24;
      long long v33 = v24;
      long long v34 = v24;
      long long v31 = v24;
      long long v32 = v24;
      *(_OWORD *)buf = v24;
      long long v30 = v24;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "forEachTapWithDirectory:no tap found");
    }
    goto LABEL_28;
  }
  CFIndex v10 = Count;
  size_t v11 = 8 * Count;
  int v12 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v12)
  {
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      tm v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      tm v21 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "forEachTapWithDirectory:Failed to malloc memory for keyArray", buf, 2u);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v25;
      long long v36 = v25;
      long long v33 = v25;
      long long v34 = v25;
      long long v31 = v25;
      long long v32 = v25;
      *(_OWORD *)buf = v25;
      long long v30 = v25;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "forEachTapWithDirectory:Failed to malloc memory for keyArray");
    }
LABEL_28:
    pthread_mutex_unlock(v8);
    return;
  }
  uint64_t v13 = v12;
  char v14 = (const void **)malloc_type_malloc(v11, 0x80040B8603338uLL);
  if (v14)
  {
    long long v15 = v14;
    CFDictionaryGetKeysAndValues(this[7], v13, v14);
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v17 = (CCTap *)v15[i];
      if (CCTap::findWithDirectory((CFStringRef *)v17, a2)) {
        a3(v17, a4);
      }
    }
    pthread_mutex_unlock(v8);
    free(v13);
    free(v15);
    return;
  }
  uint64_t v22 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v23 = v22;
LABEL_37:
      _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "forEachTapWithDirectory:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    long long v23 = &_os_log_internal;
    goto LABEL_37;
  }
  if (glog_fd)
  {
    *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v35 = v26;
    long long v36 = v26;
    long long v33 = v26;
    long long v34 = v26;
    long long v31 = v26;
    long long v32 = v26;
    *(_OWORD *)buf = v26;
    long long v30 = v26;
    memset(&v28, 0, sizeof(v28));
    time_t v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "forEachTapWithDirectory:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v8);
  free(v13);
}

CFStringRef *CCPipeMonitor::findTapWithOwnerAndPipe(CFDictionaryRef *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFStringRef v6 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v18 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "findTapWithOwnerAndPipe:no tap found", buf, 2u);
LABEL_22:
    if (glog_fd)
    {
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v34 = v23;
      long long v35 = v23;
      long long v32 = v23;
      long long v33 = v23;
      long long v30 = v23;
      long long v31 = v23;
      *(_OWORD *)buf = v23;
      long long v29 = v23;
      memset(&v27, 0, sizeof(v27));
      time_t v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:no tap found");
    }
    goto LABEL_27;
  }
  CFIndex v8 = Count;
  size_t v9 = 8 * Count;
  CFIndex v10 = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v10)
  {
    uint64_t v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      uint64_t v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      uint64_t v20 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "findTapWithOwnerAndPipe:Failed to malloc memory for keyArray", buf, 2u);
LABEL_25:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v34 = v24;
      long long v35 = v24;
      long long v32 = v24;
      long long v33 = v24;
      long long v30 = v24;
      long long v31 = v24;
      *(_OWORD *)buf = v24;
      long long v29 = v24;
      memset(&v27, 0, sizeof(v27));
      time_t v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:Failed to malloc memory for keyArray");
    }
LABEL_27:
    pthread_mutex_unlock(v6);
    return 0;
  }
  size_t v11 = v10;
  int v12 = (const void **)malloc_type_malloc(v9, 0x80040B8603338uLL);
  if (!v12)
  {
    uint64_t v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v22 = v21;
LABEL_36:
        _os_log_error_impl(&dword_209928000, v22, OS_LOG_TYPE_ERROR, "findTapWithOwnerAndPipe:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v22 = &_os_log_internal;
      goto LABEL_36;
    }
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v34 = v25;
      long long v35 = v25;
      long long v32 = v25;
      long long v33 = v25;
      long long v30 = v25;
      long long v31 = v25;
      *(_OWORD *)buf = v25;
      long long v29 = v25;
      memset(&v27, 0, sizeof(v27));
      time_t v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v6);
    free(v11);
    return 0;
  }
  uint64_t v13 = v12;
  CFDictionaryGetKeysAndValues(this[7], (const void **)v11, v12);
  uint64_t v14 = 0;
  while (1)
  {
    long long v15 = (CFStringRef *)v13[v14];
    if (CCTap::findWithOwnerAndPipe(v15, a2, a3)) {
      break;
    }
    if (v8 == ++v14)
    {
      long long v15 = 0;
      break;
    }
  }
  pthread_mutex_unlock(v6);
  free(v11);
  free(v13);
  return v15;
}

void CCPipeMonitor::profileLoaded(CFDictionaryRef *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "profileLoaded:no tap found", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v18;
      long long v30 = v18;
      long long v27 = v18;
      long long v28 = v18;
      long long v25 = v18;
      long long v26 = v18;
      *(_OWORD *)buf = v18;
      long long v24 = v18;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileLoaded:no tap found");
    }
    goto LABEL_28;
  }
  CFIndex v4 = Count;
  size_t v5 = 8 * Count;
  CFStringRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      long long v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      long long v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "profileLoaded:Failed to malloc memory for keyArray", buf, 2u);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v19;
      long long v30 = v19;
      long long v27 = v19;
      long long v28 = v19;
      long long v25 = v19;
      long long v26 = v19;
      *(_OWORD *)buf = v19;
      long long v24 = v19;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileLoaded:Failed to malloc memory for keyArray");
    }
LABEL_28:
    pthread_mutex_unlock(v2);
    return;
  }
  uint64_t v7 = v6;
  CFIndex v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    size_t v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    for (uint64_t i = 0; i != v4; ++i)
    {
      size_t v11 = v9[i];
      if (v11) {
        (*(void (**)(const void *))(*(void *)v11 + 72))(v11);
      }
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  uint64_t v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = v16;
LABEL_37:
      _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "profileLoaded:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v17 = &_os_log_internal;
    goto LABEL_37;
  }
  if (glog_fd)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v20;
    long long v30 = v20;
    long long v27 = v20;
    long long v28 = v20;
    long long v25 = v20;
    long long v26 = v20;
    *(_OWORD *)buf = v20;
    long long v24 = v20;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "profileLoaded:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

void CCPipeMonitor::profileRemoved(CFDictionaryRef *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "profileRemoved:no tap found", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v18;
      long long v30 = v18;
      long long v27 = v18;
      long long v28 = v18;
      long long v25 = v18;
      long long v26 = v18;
      *(_OWORD *)buf = v18;
      long long v24 = v18;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileRemoved:no tap found");
    }
    goto LABEL_28;
  }
  CFIndex v4 = Count;
  size_t v5 = 8 * Count;
  CFStringRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      long long v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      long long v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "profileRemoved:Failed to malloc memory for keyArray", buf, 2u);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v19;
      long long v30 = v19;
      long long v27 = v19;
      long long v28 = v19;
      long long v25 = v19;
      long long v26 = v19;
      *(_OWORD *)buf = v19;
      long long v24 = v19;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileRemoved:Failed to malloc memory for keyArray");
    }
LABEL_28:
    pthread_mutex_unlock(v2);
    return;
  }
  uint64_t v7 = v6;
  CFIndex v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    size_t v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    for (uint64_t i = 0; i != v4; ++i)
    {
      size_t v11 = v9[i];
      if (v11) {
        (*(void (**)(const void *))(*(void *)v11 + 80))(v11);
      }
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  uint64_t v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = v16;
LABEL_37:
      _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "profileRemoved:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v17 = &_os_log_internal;
    goto LABEL_37;
  }
  if (glog_fd)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v20;
    long long v30 = v20;
    long long v27 = v20;
    long long v28 = v20;
    long long v25 = v20;
    long long v26 = v20;
    *(_OWORD *)buf = v20;
    long long v24 = v20;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "profileRemoved:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

uint64_t CCPipeMonitor::setProfileMonitor(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) = a2;
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
}

uint64_t CCPipeMonitor::releaseProfileMonitor(CCPipeMonitor *this)
{
  uint64_t result = *((void *)this + 9);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 48))(result);
    *((void *)this + 9) = 0;
  }
  return result;
}

void CCPipeMonitor::quiesceAllTaps(CFDictionaryRef *this)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      long long v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      long long v19 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v19, OS_LOG_TYPE_DEFAULT, "quiesceAllTaps:no tap found", buf, 2u);
LABEL_36:
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v24;
      long long v36 = v24;
      long long v33 = v24;
      long long v34 = v24;
      long long v31 = v24;
      long long v32 = v24;
      *(_OWORD *)buf = v24;
      long long v30 = v24;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:no tap found");
    }
    goto LABEL_41;
  }
  uint64_t v4 = Count;
  size_t v5 = 8 * Count;
  CFStringRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    uint64_t v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      time_t v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      time_t v21 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v21, OS_LOG_TYPE_ERROR, "quiesceAllTaps:Failed to malloc memory for keyArray", buf, 2u);
LABEL_39:
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v25;
      long long v36 = v25;
      long long v33 = v25;
      long long v34 = v25;
      long long v31 = v25;
      long long v32 = v25;
      *(_OWORD *)buf = v25;
      long long v30 = v25;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:Failed to malloc memory for keyArray");
    }
LABEL_41:
    pthread_mutex_unlock(v2);
    return;
  }
  uint64_t v7 = v6;
  CFIndex v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (!v8)
  {
    uint64_t v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v23 = v22;
LABEL_49:
        _os_log_error_impl(&dword_209928000, v23, OS_LOG_TYPE_ERROR, "quiesceAllTaps:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v23 = &_os_log_internal;
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v26;
      long long v36 = v26;
      long long v33 = v26;
      long long v34 = v26;
      long long v31 = v26;
      long long v32 = v26;
      *(_OWORD *)buf = v26;
      long long v30 = v26;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v2);
    uint64_t v17 = v7;
    goto LABEL_20;
  }
  size_t v9 = v8;
  CFDictionaryGetKeysAndValues(this[7], v7, v8);
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
      (*(void (**)(const void *))(*(void *)v9[i] + 104))(v9[i]);
    uint64_t v11 = 0;
    int v12 = 100;
    while (1)
    {
      uint64_t v13 = v9[v11];
      if (((*(uint64_t (**)(const void *))(*(void *)v13 + 112))(v13) & 1) == 0) {
        break;
      }
LABEL_11:
      if (++v11 == v4) {
        goto LABEL_19;
      }
    }
    while (--v12)
    {
      usleep(0x186A0u);
      if ((*(unsigned int (**)(const void *))(*(void *)v13 + 112))(v13)) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11 + 1;
      long long v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11 + 1;
      long long v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCDaemon::Not all taps got quiesced, tap %ld was not ready", buf, 0xCu);
LABEL_17:
    if (glog_fd)
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v35 = v16;
      long long v36 = v16;
      long long v33 = v16;
      long long v34 = v16;
      long long v31 = v16;
      long long v32 = v16;
      *(_OWORD *)buf = v16;
      long long v30 = v16;
      memset(&v28, 0, sizeof(v28));
      time_t v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::Not all taps got quiesced, tap %ld was not ready", v11 + 1);
    }
  }
LABEL_19:
  pthread_mutex_unlock(v2);
  free(v7);
  uint64_t v17 = v9;
LABEL_20:
  free(v17);
}

void CCPipeMonitor::resumeAllTapsFromQuiesced(CFDictionaryRef *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  CFIndex Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "resumeAllTapsFromQuiesced:no tap found", buf, 2u);
LABEL_22:
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v18;
      long long v30 = v18;
      long long v27 = v18;
      long long v28 = v18;
      long long v25 = v18;
      long long v26 = v18;
      *(_OWORD *)buf = v18;
      long long v24 = v18;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "resumeAllTapsFromQuiesced:no tap found");
    }
    goto LABEL_27;
  }
  uint64_t v4 = Count;
  size_t v5 = 8 * Count;
  CFStringRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      long long v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      long long v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "resumeAllTapsFromQuiesced:Failed to malloc memory for keyArray", buf, 2u);
LABEL_25:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v29 = v19;
      long long v30 = v19;
      long long v27 = v19;
      long long v28 = v19;
      long long v25 = v19;
      long long v26 = v19;
      *(_OWORD *)buf = v19;
      long long v24 = v19;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "resumeAllTapsFromQuiesced:Failed to malloc memory for keyArray");
    }
LABEL_27:
    pthread_mutex_unlock(v2);
    return;
  }
  uint64_t v7 = v6;
  CFIndex v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    size_t v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    if (v4 >= 1)
    {
      CFIndex v10 = v9;
      do
      {
        uint64_t v11 = (uint64_t)*v10++;
        (*(void (**)(uint64_t))(*(void *)v11 + 120))(v11);
        --v4;
      }
      while (v4);
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  uint64_t v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = v16;
LABEL_35:
      _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "resumeAllTapsFromQuiesced:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v17 = &_os_log_internal;
    goto LABEL_35;
  }
  if (glog_fd)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v20;
    long long v30 = v20;
    long long v27 = v20;
    long long v28 = v20;
    long long v25 = v20;
    long long v26 = v20;
    *(_OWORD *)buf = v20;
    long long v24 = v20;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "resumeAllTapsFromQuiesced:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

uint64_t CCSubmitLogToCrashTracer(const char *a1)
{
  if (!a1 || !funcAddr(a1)) {
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  uint64_t v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  size_t v5 = v4;
  CFRelease(v3);
  CFStringRef v6 = (const char *)objc_msgSend(NSString, "stringWithFormat:", @"%s", a1);
  uint64_t v7 = (uint64_t (*)(__CFString *, void))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
  uint64_t v31 = v6;
  if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer
    || (CFIndex v8 = funcAddr(v6),
        uint64_t v7 = (uint64_t (*)(__CFString *, void))v8,
        (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v8) != 0))
  {
    CFIndex v8 = (void *)v7(@"InverseDeviceID", 0);
    size_t v9 = v8;
    CFIndex v10 = (uint64_t (*)(__CFString *, void))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
    if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer) {
      goto LABEL_11;
    }
  }
  else
  {
    size_t v9 = 0;
  }
  uint64_t v12 = funcAddr((const char *)v8);
  __MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v12;
  if (v12)
  {
    CFIndex v10 = (uint64_t (*)(__CFString *, void))v12;
LABEL_11:
    uint64_t v12 = (void *)v10(@"ProductType", 0);
    uint64_t v13 = v12;
    uint64_t v14 = (uint64_t (*)(__CFString *, void))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
    if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  uint64_t v13 = 0;
LABEL_14:
  long long v15 = funcAddr((const char *)v12);
  __MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v15;
  if (!v15)
  {
    long long v30 = v9;
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  uint64_t v14 = (uint64_t (*)(__CFString *, void))v15;
LABEL_16:
  long long v30 = v9;
  uint64_t v16 = v14(@"UniqueDeviceID", 0);
LABEL_17:
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = [v17 descriptionWithCalendarFormat:@"%Y-%m-%d %H:%M:%S.%F %z"];
  long long v19 = NSString;
  long long v20 = (const void *)_CFCopySystemVersionDictionary();
  time_t v21 = (id)CFMakeCollectable(v20);
  uint64_t v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263EFFAC0]];
  uint64_t v23 = [v21 objectForKeyedSubscript:*MEMORY[0x263EFFAB8]];
  uint64_t v24 = [v21 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
  long long v25 = @"???";
  if (v23) {
    long long v26 = (__CFString *)v23;
  }
  else {
    long long v26 = @"???";
  }
  if (v22) {
    long long v27 = (__CFString *)v22;
  }
  else {
    long long v27 = @"???";
  }
  if (v24) {
    long long v25 = (__CFString *)v24;
  }
  uint64_t v28 = [v19 stringWithFormat:@"\nIncident Identifier:     %@\nCrashReporter Key:       %@\nHardware Model:          %@\nProcess:                 WiFi Firmware\nPath:                    NA\nIdentifier:              WiFi Firmware Trap\nVersion:                 NA\nCode Type:               ARM-32\nRole                     NA\nParent Process:          NA\nCoalition:               NA\n\n\nDate/Time:               %@\nLauch Time:              NA\nOS Version:              %@\nBaseband Version:        NA\nUDID:                    %@\nReport Version:          NA\n", v4, v30, v13, v18, objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ (%@)", v26, v27, v25), v16];
  [NSString stringWithFormat:@"%@\n%@\n", v28, v31];
  uint64_t v11 = OSAWriteLogForSubmission();

  return v11;
}

void *funcAddr(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = (void *)__loadMobileGestalt(void)::image;
  if (!__loadMobileGestalt(void)::image)
  {
    CFAllocatorRef v2 = getenv("DYLD_IMAGE_SUFFIX");
    v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v3.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v6.st_blksize = v3;
    *(timespec *)v6.st_qspare = v3;
    v6.st_birthtimespec = v3;
    *(timespec *)&v6.off_t st_size = v3;
    v6.st_mtimespec = v3;
    v6.st_ctimespec = v3;
    *(timespec *)&v6.st_uid = v3;
    v6.st_atimespec = v3;
    *(timespec *)&v6.st_dev = v3;
    memset(&v5[32], 170, 0x3E0uLL);
    if (!v2)
    {
      uint64_t v4 = "/usr/lib/libMobileGestalt.dylib";
      goto LABEL_8;
    }
    strcpy(v5, "/usr/lib/libMobileGestalt.dylib");
    if (strlcat(v5, v2, 0x400uLL) >= 0x400) {
      return 0;
    }
    if ((stat(v5, &v6) & 0x80000000) == 0)
    {
      uint64_t v4 = v5;
LABEL_8:
      uint64_t result = dlopen(v4, 6);
      __loadMobileGestalt(void)::image = (uint64_t)result;
      if (!result) {
        return result;
      }
      return dlsym(result, "MGCopyAnswer");
    }
    uint64_t result = (void *)__loadMobileGestalt(void)::image;
    if (!__loadMobileGestalt(void)::image) {
      return result;
    }
  }
  return dlsym(result, "MGCopyAnswer");
}

uint64_t ___Z24CCSubmitLogToCrashTracerPKci_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) UTF8String];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v4, objc_msgSend(*(id *)(a1 + 40), "length") + *(int *)(a1 + 48));

  return [a2 writeData:v5];
}

uint64_t CCSubmitBinaryToCrashTracer(uint64_t result)
{
  if (result) {
    return OSAWriteLogForSubmission();
  }
  return result;
}

uint64_t ___Z27CCSubmitBinaryToCrashTracerPKci_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a1 + 32) length:*(int *)(a1 + 40)];

  return [a2 writeData:v3];
}

uint64_t getMaxPreservedCaptures(void)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = 50;
  v12[0] = 50;
  CFStringRef v1 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  CFStringRef v2 = CFStringCreateWithCString(0, "max_preserved_captures", 0);
  CFStringRef v3 = (const __CFString *)CFPreferencesCopyAppValue(v2, v1);
  CFStringRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFTypeID v10 = CFGetTypeID(v4);
      if (v10 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v4, kCFNumberSInt64Type, v12))
      {
        uint64_t v0 = 50;
        goto LABEL_16;
      }
      uint64_t v9 = v12[0];
      goto LABEL_12;
    }
    CFIndex Length = CFStringGetLength(v4);
    uint64_t v7 = (char *)malloc_type_malloc(Length + 1, 0x2E636F62uLL);
    CFIndex v8 = CFStringGetLength(v4);
    CFStringGetCString(v4, v7, v8 + 1, 0);
    uint64_t v9 = strtoll(v7, 0, 10);
    if (!v9)
    {
      if (*__error() != 22 && *__error() != 34)
      {
        uint64_t v9 = 0;
        if (!v7)
        {
LABEL_12:
          if (v9) {
            uint64_t v0 = v9;
          }
          else {
            uint64_t v0 = 0x7FFFFFFFFFFFFFFFLL;
          }
          goto LABEL_16;
        }
LABEL_8:
        free(v7);
        goto LABEL_12;
      }
      uint64_t v9 = 50;
      v12[0] = 50;
    }
    if (!v7) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_16:
  v12[0] = v0;
  if (v1) {
    CFRelease(v1);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v12[0];
}

CFComparisonResult sortByDirectoryName(CFComparisonResult result, __CFString **a2)
{
  if (result >= 2)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    char v5 = 0;
    uint64_t v6 = result - 1;
    do
    {
      while (1)
      {
        uint64_t v7 = (v4 + 1);
        uint64_t result = CFStringCompare(a2[v3], a2[v7], 0);
        if (result != kCFCompareGreaterThan) {
          break;
        }
        CFIndex v8 = a2[v3];
        a2[v3] = a2[v7];
        a2[v7] = v8;
        if (v6 <= v7) {
          uint64_t v3 = 0;
        }
        else {
          uint64_t v3 = (v4 + 1);
        }
        if (v6 > v7) {
          ++v4;
        }
        else {
          int v4 = 0;
        }
        char v5 = v6 > v7;
      }
      char v9 = (v6 > v7) | v5;
      if (v6 <= v7) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = (v4 + 1);
      }
      if (v6 <= v7) {
        int v4 = 0;
      }
      else {
        ++v4;
      }
      v5 &= v6 > v7;
    }
    while ((v9 & 1) != 0);
  }
  return result;
}

void cleanCaptureDirectory(const __CFString *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v3 = (char *)malloc_type_malloc(Length + 1, 0x1C588E77uLL);
  CFIndex v4 = CFStringGetLength(a1);
  CFStringGetCString(a1, v3, v4 + 1, 0);
  char v5 = opendir(v3);
  if (v3) {
    free(v3);
  }
  int64_t v6 = 0;
  if (v5)
  {
    while (1)
    {
      uint64_t v7 = readdir(v5);
      if (!v7) {
        break;
      }
      if (v7->d_name[0] != 46) {
        ++v6;
      }
    }
    closedir(v5);
  }
  uint64_t MaxPreservedCaptures = getMaxPreservedCaptures();
  if (!v6) {
    return;
  }
  uint64_t v9 = v6 - MaxPreservedCaptures;
  if (v6 < MaxPreservedCaptures) {
    return;
  }
  CFTypeID v10 = (__CFString **)malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
  CFIndex v11 = CFStringGetLength(a1);
  uint64_t v12 = (char *)malloc_type_malloc(v11 + 1, 0xEC36869CuLL);
  CFIndex v13 = CFStringGetLength(a1);
  CFStringGetCString(a1, v12, v13 + 1, 0);
  uint64_t v14 = opendir(v12);
  if (v12) {
    free(v12);
  }
  int64_t v15 = 0;
  if (v14)
  {
    BOOL v16 = v6 > 0;
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      uint64_t v18 = readdir(v14);
      if (v18 == 0 || !v16) {
        break;
      }
      if (v18->d_name[0] != 46)
      {
        d_name = v18->d_name;
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v17, 512, a1);
        CFStringAppendCString(MutableCopy, "/", 0);
        CFStringAppendCString(MutableCopy, d_name, 0);
        v10[v15++] = MutableCopy;
        BOOL v16 = v15 < v6;
      }
    }
    closedir(v14);
  }
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    uint64_t v22 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    uint64_t v22 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v22, OS_LOG_TYPE_DEFAULT, "numberOfDirArrayEntries: %lld, readIndex %lld\n", buf, 0x16u);
LABEL_25:
  if (glog_fd)
  {
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v37 = v23;
    long long v38 = v23;
    long long v35 = v23;
    long long v36 = v23;
    long long v33 = v23;
    long long v34 = v23;
    *(_OWORD *)buf = v23;
    *(_OWORD *)&uint8_t buf[16] = v23;
    memset(&v31, 0, sizeof(v31));
    time_t v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "numberOfDirArrayEntries: %lld, readIndex %lld\n", v6, v15);
  }
  if (v6 != v15)
  {
    uint64_t v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      long long v25 = v24;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      long long v25 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v25, OS_LOG_TYPE_DEFAULT, "Incorrect number [numberOfDirArrayEntries: %lld, readIndex %lld] of directory entries. Skip sorting.\n", buf, 0x16u);
LABEL_35:
    if (glog_fd)
    {
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v37 = v26;
      long long v38 = v26;
      long long v35 = v26;
      long long v36 = v26;
      long long v33 = v26;
      long long v34 = v26;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&uint8_t buf[16] = v26;
      memset(&v31, 0, sizeof(v31));
      time_t v30 = 0xAAAAAAAAAAAAAAAALL;
      time(&v30);
      localtime_r(&v30, &v31);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Incorrect number [numberOfDirArrayEntries: %lld, readIndex %lld] of directory entries. Skip sorting.\n", v6, v15);
    }
    goto LABEL_37;
  }
  sortByDirectoryName((CFComparisonResult)v6, v10);
LABEL_37:
  if (v9 >= 1)
  {
    long long v27 = v10;
    do
    {
      uint64_t v28 = *v27++;
      deleteDirectory(v28);
      --v9;
    }
    while (v9);
  }
  if (v15)
  {
    long long v29 = (CFTypeRef *)v10;
    do
    {
      if (*v29) {
        CFRelease(*v29);
      }
      *v29++ = 0;
      --v15;
    }
    while (v15);
  }
  else if (!v10)
  {
    return;
  }
  free(v10);
}

void pruneDirectoryOnOSUpgrade(void)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  memset(__s1, 0, sizeof(__s1));
  memset(buffer, 0, sizeof(buffer));
  CFStringRef v0 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  CFStringRef v1 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_ctl", 0);
  CFStringRef v2 = (const __CFString *)CFPreferencesCopyAppValue(v1, v0);
  CFStringRef v3 = v2;
  if (v2)
  {
    BOOL v4 = CFStringCompare(v2, @"disable", 0) != kCFCompareEqualTo;
    if (!v0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v4 = 1;
  if (v0) {
LABEL_3:
  }
    CFRelease(v0);
LABEL_4:
  if (v1) {
    CFRelease(v1);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (!v4)
  {
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      CFIndex v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      CFIndex v13 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity disabled\n", buf, 2u);
LABEL_25:
    if (glog_fd)
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v16;
      long long v47 = v16;
      long long v44 = v16;
      long long v45 = v16;
      long long v43 = v16;
      *(_OWORD *)&uint8_t buf[16] = v16;
      long long v42 = v16;
      *(_OWORD *)buf = v16;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity disabled\n");
    }
    return;
  }
  if (!getOsVersion((char *)__s1))
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      int64_t v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      int64_t v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "pruneDirectoryOnOSUpgrade: activity enabled; failed to get osversion\n",
      buf,
      2u);
LABEL_39:
    if (glog_fd)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v19;
      long long v47 = v19;
      long long v44 = v19;
      long long v45 = v19;
      long long v43 = v19;
      *(_OWORD *)&uint8_t buf[16] = v19;
      long long v42 = v19;
      *(_OWORD *)buf = v19;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; failed to get osversion\n");
    }
    return;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  CFStringRef v6 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_snapshot", 0);
  CFStringRef v7 = (const __CFString *)CFPreferencesCopyAppValue(v6, v5);
  CFStringRef v8 = v7;
  if (!v7 || (CFTypeID v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
  {
    BOOL v11 = 0;
    if (!v5) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  CFIndex Length = CFStringGetLength(v8);
  BOOL v11 = CFStringGetCString(v8, (char *)buffer, Length + 1, 0) != 0;
  if (v5) {
LABEL_28:
  }
    CFRelease(v5);
LABEL_29:
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (!v11 || strcmp((const char *)__s1, (const char *)buffer) >= 1)
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = buffer;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = __s1;
        uint64_t v18 = v17;
LABEL_43:
        _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity enabled; upgraded from %s to %s\n",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = buffer;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      uint64_t v18 = &_os_log_internal;
      goto LABEL_43;
    }
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v20;
      long long v47 = v20;
      long long v44 = v20;
      long long v45 = v20;
      long long v43 = v20;
      *(_OWORD *)&uint8_t buf[16] = v20;
      long long v42 = v20;
      *(_OWORD *)buf = v20;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; upgraded from %s to %s\n",
        (const char *)buffer,
        (const char *)__s1);
    }
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
      uint64_t v21 = "/Library/Logs/CoreCapture";
    }
    else {
      uint64_t v21 = "/Library/Logs/CrashReporter/CoreCapture";
    }
    v40[0] = (time_t)v21;
    uint64_t v22 = 0;
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
      long long v23 = "/Library/Logs/CrashReporter/CoreCapture";
    }
    else {
      long long v23 = "/Library/Logs/CoreCapture";
    }
    v40[1] = (time_t)v23;
    CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    char v25 = 1;
    while (1)
    {
      char v26 = v25;
      CFMutableArrayRef Mutable = CFStringCreateMutable(v24, 512);
      uint64_t v28 = (const char *)v40[v22];
      CFStringAppendCString(Mutable, v28, 0);
      uint64_t v29 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v28;
          time_t v30 = v29;
LABEL_58:
          _os_log_impl(&dword_209928000, v30, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade %s\n", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v28;
        time_t v30 = &_os_log_internal;
        goto LABEL_58;
      }
      if (glog_fd)
      {
        *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v46 = v31;
        long long v47 = v31;
        long long v44 = v31;
        long long v45 = v31;
        long long v43 = v31;
        *(_OWORD *)&uint8_t buf[16] = v31;
        long long v42 = v31;
        *(_OWORD *)buf = v31;
        memset(&v39, 0, sizeof(v39));
        time_t v38 = 0xAAAAAAAAAAAAAAAALL;
        time(&v38);
        localtime_r(&v38, &v39);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "pruneDirectoryOnOSUpgrade %s\n", v28);
      }
      deleteDirectory(Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
      char v25 = 0;
      uint64_t v22 = 1;
      if ((v26 & 1) == 0) {
        goto LABEL_64;
      }
    }
  }
  uint64_t v35 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = buffer;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      long long v36 = v35;
LABEL_76:
      _os_log_impl(&dword_209928000, v36, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity enabled; snapshot %s, osversion %s\n",
        buf,
        0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = __s1;
    long long v36 = &_os_log_internal;
    goto LABEL_76;
  }
  if (glog_fd)
  {
    *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v37;
    long long v47 = v37;
    long long v44 = v37;
    long long v45 = v37;
    long long v43 = v37;
    *(_OWORD *)&uint8_t buf[16] = v37;
    long long v42 = v37;
    *(_OWORD *)buf = v37;
    memset(&v39, 0, sizeof(v39));
    v40[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v40);
    localtime_r(v40, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; snapshot %s, osversion %s\n",
      (const char *)buffer,
      (const char *)__s1);
  }
LABEL_64:
  CFStringRef v32 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  CFStringRef v33 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_snapshot", 0);
  CFStringRef v34 = CFStringCreateWithCString(0, (const char *)__s1, 0);
  CFPreferencesSetAppValue(v33, v34, v32);
  CFPreferencesAppSynchronize(v32);
  if (v32) {
    CFRelease(v32);
  }
  if (v33) {
    CFRelease(v33);
  }
  if (v34) {
    CFRelease(v34);
  }
}

const char *getSaveLocation(void)
{
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    return "/Library/Logs/CoreCapture";
  }
  else {
    return "/Library/Logs/CrashReporter/CoreCapture";
  }
}

const char *getPossibleSaveLocation(void)
{
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    return "/Library/Logs/CrashReporter/CoreCapture";
  }
  else {
    return "/Library/Logs/CoreCapture";
  }
}

void lowPriorityActivities(void)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  time_t v0 = time(0);
  if (isSeedAndiOS()) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 7;
  }
  CFStringRef v2 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  CFStringRef v3 = CFStringCreateWithCString(0, "prune_dir_days", 0);
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(v3, v2);
  CFStringRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      CFIndex Length = CFStringGetLength(v5);
      CFStringRef v8 = (char *)malloc_type_malloc(Length + 1, 0xB3C15625uLL);
      CFIndex v9 = CFStringGetLength(v5);
      CFStringGetCString(v5, v8, v9 + 1, 0);
      uint64_t v10 = strtol(v8, 0, 10);
      if (v8) {
        free(v8);
      }
      if (*__error() != 22) {
        goto LABEL_16;
      }
      uint64_t v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = v11;
LABEL_41:
          _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "pruneDirectoryNDaysRead strtol EINVAL\n", buf, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = &_os_log_internal;
        goto LABEL_41;
      }
      if (glog_fd)
      {
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v27 = v13;
        long long v28 = v13;
        long long v25 = v13;
        long long v26 = v13;
        long long v23 = v13;
        long long v24 = v13;
        *(_OWORD *)buf = v13;
        long long v22 = v13;
        memset(&v20, 0, sizeof(v20));
        time_t v19 = 0xAAAAAAAAAAAAAAAALL;
        time(&v19);
        localtime_r(&v19, &v20);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "pruneDirectoryNDaysRead strtol EINVAL\n");
      }
      uint64_t v10 = 7;
LABEL_16:
      uint64_t v1 = v10 & ~(v10 >> 63);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v1;
    int64_t v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v1;
    int64_t v15 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v15, OS_LOG_TYPE_DEFAULT, "pruneDirectoryNDaysRead cap %ld\n", buf, 0xCu);
LABEL_29:
  if (glog_fd)
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v16;
    long long v28 = v16;
    long long v25 = v16;
    long long v26 = v16;
    long long v23 = v16;
    long long v24 = v16;
    *(_OWORD *)buf = v16;
    long long v22 = v16;
    memset(&v20, 0, sizeof(v20));
    time_t v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "pruneDirectoryNDaysRead cap %ld\n", v1);
  }
  if (v1)
  {
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
      uint64_t v17 = "/Library/Logs/CoreCapture";
    }
    else {
      uint64_t v17 = "/Library/Logs/CrashReporter/CoreCapture";
    }
    pruneDirectoryNDaysDo(v17, 1, v0, v1);
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
      uint64_t v18 = "/Library/Logs/CrashReporter/CoreCapture";
    }
    else {
      uint64_t v18 = "/Library/Logs/CoreCapture";
    }
    pruneDirectoryNDaysDo(v18, 1, v0, v1);
  }
}

void writeMetadataFiles(const __CFString *a1, const char *a2, time_t a3, uint64_t a4)
{
  v72[1] = *MEMORY[0x263EF8340];
  CFStringRef v8 = (char *)malloc_type_malloc(0x200uLL, 0x83E60817uLL);
  if (!v8)
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      LOWORD(v71.st_dev) = 0;
      int64_t v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      LOWORD(v71.st_dev) = 0;
      int64_t v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCFile::writeMetadataFiles failed malloc\n", (uint8_t *)&v71, 2u);
LABEL_62:
    if (glog_fd)
    {
      v47.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v47.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v71.off_t st_size = v47;
      *(timespec *)&v71.st_blksize = v47;
      v71.st_ctimespec = v47;
      v71.st_birthtimespec = v47;
      v71.st_atimespec = v47;
      v71.st_mtimespec = v47;
      *(timespec *)&v71.st_dev = v47;
      *(timespec *)&v71.st_uid = v47;
      memset(v66, 0, 56);
      *(void *)&valuePtr.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&valuePtr.tm_sec);
      localtime_r((const time_t *)&valuePtr.tm_sec, (tm *)v66);
      strftime((char *)&v71, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v66);
      dprintf(glog_fd, "%s ", (const char *)&v71);
      dprintf(glog_fd, "CCFile::writeMetadataFiles failed malloc\n");
    }
    return;
  }
  CFIndex v9 = v8;
  memset(&v62, 0, sizeof(v62));
  time_t v61 = a3;
  localtime_r(&v61, &v62);
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0) {
    uint64_t v10 = "/Library/Logs/CoreCapture";
  }
  else {
    uint64_t v10 = "/Library/Logs/CrashReporter/CoreCapture";
  }
  if (CFStringGetLength(a1))
  {
    CFIndex Length = CFStringGetLength(a1);
    uint64_t v12 = (char *)malloc_type_malloc(Length + 1, 0x6D3BC9F3uLL);
    CFIndex v13 = CFStringGetLength(a1);
    CFStringGetCString(a1, v12, v13 + 1, 0);
    snprintf(v9, 0x200uLL, "%s/%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s/%s", v10, v12, v62.tm_year + 1900, v62.tm_mon + 1, v62.tm_mday, v62.tm_hour, v62.tm_min, v62.tm_sec, a4, a2, "Metadata");
    if (v12) {
      free(v12);
    }
  }
  else
  {
    snprintf(v9, 0x200uLL, "%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s/%s", v10, v62.tm_year + 1900, v62.tm_mon + 1, v62.tm_mday, v62.tm_hour, v62.tm_min, v62.tm_sec, a4, a2, "Metadata");
  }
  long long v16 = strdup(v9);
  v17.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v17.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v71.st_blksize = v17;
  *(timespec *)v71.st_qspare = v17;
  v71.st_birthtimespec = v17;
  *(timespec *)&v71.off_t st_size = v17;
  v71.st_mtimespec = v17;
  v71.st_ctimespec = v17;
  *(timespec *)&v71.st_uid = v17;
  v71.st_atimespec = v17;
  *(timespec *)&v71.st_dev = v17;
  for (uint64_t i = *v16 == 47; v16[i] != 47; ++i)
  {
    if (!v16[i])
    {
      free(v16);
      if (mkdir(v9, 0x1EDu)) {
        goto LABEL_81;
      }
      *(void *)&valuePtr.int tm_sec = a3;
      *(void *)&valuePtr.int tm_hour = a4;
      CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFNumberRef v21 = CFNumberCreate(v19, kCFNumberSInt64Type, &valuePtr);
      CFDictionarySetValue(Mutable, @"Time secs", v21);
      if (v21) {
        CFRelease(v21);
      }
      CFNumberRef v22 = CFNumberCreate(v19, kCFNumberSInt64Type, &valuePtr.tm_hour);
      CFDictionarySetValue(Mutable, @"Time usecs", v22);
      if (v22) {
        CFRelease(v22);
      }
      memset(&v71, 0, 80);
      memset(v66, 0, 56);
      long long v23 = localtime_r((const time_t *)&valuePtr.tm_sec, (tm *)v66);
      long long v24 = asctime(v23);
      if (v24)
      {
        long long v25 = v24;
        long long v26 = strchr(v24, 10);
        if (v26) {
          *long long v26 = 0;
        }
        strlcpy((char *)&v71, v25, 0x50uLL);
      }
      CFStringRef v27 = CFStringCreateWithCString(0, (const char *)&v71, 0);
      CFDictionarySetValue(Mutable, @"Time localtime", v27);
      if (v27) {
        CFRelease(v27);
      }
      CFStringRef v28 = CFStringCreateWithCString(0, "/System/Library/Extensions/corecapture.kext/Contents/version.plist", 0);
      CFURLRef v29 = CFURLCreateWithFileSystemPath(v19, v28, kCFURLPOSIXPathStyle, 0);
      time_t v30 = CFReadStreamCreateWithFile(v19, v29);
      if (v30)
      {
        long long v31 = v30;
        CFDictionaryRef v32 = CFReadStreamOpen(v30)
            ? (const __CFDictionary *)CFPropertyListCreateWithStream(v19, v31, 0, 2uLL, 0, 0)
            : 0;
        CFReadStreamClose(v31);
        CFRelease(v31);
        if (v32)
        {
          int Value = CFDictionaryGetValue(v32, @"SourceVersion");
          if (Value)
          {
            CFStringRef v34 = Value;
            CFTypeID v35 = CFGetTypeID(Value);
            if (v35 == CFStringGetTypeID()) {
              CFDictionarySetValue(Mutable, @"SourceVersion", v34);
            }
          }
          CFRelease(v32);
        }
      }
      if (v29) {
        CFRelease(v29);
      }
      if (v28) {
        CFRelease(v28);
      }
      CFUUIDRef v36 = CFUUIDCreate(0);
      CFStringRef v37 = CFUUIDCreateString(0, v36);
      CFDictionarySetValue(Mutable, @"UUID", v37);
      if (v37) {
        CFRelease(v37);
      }
      if (v36) {
        CFRelease(v36);
      }
      CFStringRef v38 = CFStringCreateWithCString(0, v9, 0);
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v19, 512, v38);
      CFStringAppendCString(MutableCopy, "/", 0);
      CFStringAppendCString(MutableCopy, "capture.plist", 0);
      writeMetadataFile(Mutable, MutableCopy);
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v38) {
        CFRelease(v38);
      }
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
      *(void *)&valuePtr.tm_isdst = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&valuePtr.int tm_sec = v40;
      *(_OWORD *)&valuePtr.tm_mon = v40;
      v72[0] = 0x200000006;
      size_t v64 = 40;
      if (!sysctl((int *)v72, 2u, &valuePtr, &v64, 0, 0)) {
        goto LABEL_71;
      }
      uint64_t v41 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        long long v42 = __error();
        long long v43 = strerror(*v42);
        v71.st_dev = 136315138;
        *(void *)&v71.st_mode = v43;
        long long v44 = v41;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        tm v59 = __error();
        uint64_t v60 = strerror(*v59);
        v71.st_dev = 136315138;
        *(void *)&v71.st_mode = v60;
        long long v44 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v44, OS_LOG_TYPE_ERROR, "getHwModel %s\n", (uint8_t *)&v71, 0xCu);
LABEL_69:
      if (glog_fd)
      {
        v49.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v49.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&v71.off_t st_size = v49;
        *(timespec *)&v71.st_blksize = v49;
        v71.st_ctimespec = v49;
        v71.st_birthtimespec = v49;
        v71.st_atimespec = v49;
        v71.st_mtimespec = v49;
        *(timespec *)&v71.st_dev = v49;
        *(timespec *)&v71.st_uid = v49;
        memset(v66, 0, 56);
        time_t v63 = 0xAAAAAAAAAAAAAAAALL;
        time(&v63);
        localtime_r(&v63, (tm *)v66);
        strftime((char *)&v71, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v66);
        dprintf(glog_fd, "%s ", (const char *)&v71);
        int v50 = glog_fd;
        int v51 = __error();
        long long v52 = strerror(*v51);
        dprintf(v50, "getHwModel %s\n", v52);
      }
LABEL_71:
      *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v71.st_dev = v53;
      *(_OWORD *)&v71.st_uid = v53;
      getOsVersion((char *)&v71);
      long long v54 = CFDictionaryCreateMutable(v19, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFStringRef v55 = CFStringCreateWithCString(0, (const char *)&valuePtr, 0);
      CFDictionarySetValue(v54, @"hw.model", v55);
      if (v55) {
        CFRelease(v55);
      }
      CFStringRef v56 = CFStringCreateWithCString(0, (const char *)&v71, 0);
      CFDictionarySetValue(v54, @"osversion", v56);
      if (v56) {
        CFRelease(v56);
      }
      CFStringRef v57 = CFStringCreateWithCString(0, v9, 0);
      CFMutableStringRef v58 = CFStringCreateMutableCopy(v19, 512, v57);
      CFStringAppendCString(v58, "/", 0);
      CFStringAppendCString(v58, "system.plist", 0);
      writeMetadataFile(v54, v58);
      if (v54) {
        CFRelease(v54);
      }
      if (v57) {
        CFRelease(v57);
      }
      if (v58) {
        CFRelease(v58);
      }
      goto LABEL_81;
    }
LABEL_20:
    ;
  }
  v16[i] = 0;
  if (stat(v16, &v71))
  {
    mkdir(v16, 0x1EDu);
LABEL_19:
    v16[i] = 47;
    goto LABEL_20;
  }
  if ((v71.st_mode & 0xF000) == 0x4000) {
    goto LABEL_19;
  }
  uint64_t v45 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v66 = 136315394;
      *(void *)&v66[4] = v9;
      *(_WORD *)&v66[12] = 2080;
      *(void *)&v66[14] = v16;
      long long v46 = v45;
      goto LABEL_86;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long v66 = 136315394;
    *(void *)&v66[4] = v9;
    *(_WORD *)&v66[12] = 2080;
    *(void *)&v66[14] = v16;
    long long v46 = &_os_log_internal;
LABEL_86:
    _os_log_error_impl(&dword_209928000, v46, OS_LOG_TYPE_ERROR, "CCFile::mkpath fails to create path '%s' as '%s' is not a directory\n", v66, 0x16u);
  }
  if (glog_fd)
  {
    *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v69 = v48;
    long long v70 = v48;
    long long v67 = v48;
    long long v68 = v48;
    *(_OWORD *)&v66[32] = v48;
    *(_OWORD *)&v66[48] = v48;
    *(_OWORD *)long long v66 = v48;
    *(_OWORD *)&v66[16] = v48;
    memset(&valuePtr, 0, sizeof(valuePtr));
    v72[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v72);
    localtime_r(v72, &valuePtr);
    strftime(v66, 0x80uLL, "%b %d %H:%M:%S", &valuePtr);
    dprintf(glog_fd, "%s ", v66);
    dprintf(glog_fd, "CCFile::mkpath fails to create path '%s' as '%s' is not a directory\n", v9, v16);
  }
  free(v16);
LABEL_81:
  free(v9);
}

void writeMetadataFile(const __CFDictionary *a1, CFStringRef theString)
{
  if (ifSeedCreateClassCProtectedFileAtCFStringPath(theString))
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFURLRef v5 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], theString, kCFURLPOSIXPathStyle, 0);
    CFTypeID v6 = CFWriteStreamCreateWithFile(v4, v5);
    CFStringRef v7 = v6;
    if (v6 && CFWriteStreamOpen(v6)) {
      CFPropertyListWrite(a1, v7, kCFPropertyListXMLFormat_v1_0, 0, 0);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (v7)
    {
      CFWriteStreamClose(v7);
      CFRelease(v7);
    }
  }
}

CFStringRef ifSeedCreateClassCProtectedFileAtCFStringPath(CFStringRef theString)
{
  CFStringRef ClassCProtectedFile = theString;
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    CFStringRef v3 = (std::__fs::filesystem::path *)malloc_type_malloc(Length + 1, 0x6B1CED1CuLL);
    CFIndex v4 = CFStringGetLength(ClassCProtectedFile);
    if (!CFStringGetCString(ClassCProtectedFile, (char *)v3, v4 + 1, 0))
    {
      CFStringRef ClassCProtectedFile = 0;
      if (!v3) {
        return ClassCProtectedFile;
      }
      goto LABEL_4;
    }
    CFStringRef ClassCProtectedFile = (const __CFString *)ifSeedCreateClassCProtectedFile(v3);
    if (v3) {
LABEL_4:
    }
      free(v3);
  }
  return ClassCProtectedFile;
}

uint64_t ifSeedCreateClassCProtectedFile(const std::__fs::filesystem::path *a1)
{
  uint64_t v2 = isSeedAndiOS();
  if (!v2) {
    return 1;
  }
  int v5 = deviceUnlockedSinceBoot(v2, v3);
  uint64_t result = 0;
  if (a1 && v5)
  {
    remove(a1, v4);
    int v7 = open_dprotected_np((const char *)a1, 1538, 3, 0, 420);
    if (v7 < 1) {
      return 0;
    }
    close(v7);
    return 1;
  }
  return result;
}

uint64_t deviceUnlockedSinceBoot(uint64_t a1, std::error_code *a2)
{
  if (deviceUnlockedSinceBoot(void)::deviceUnlockedOnce) {
    return 1;
  }
  remove((const std::__fs::filesystem::path *)"/tmp/cc.locktest", a2);
  int v3 = open_dprotected_np("/tmp/cc.locktest", 1538, 3, 0, 420);
  if (v3 < 1) {
    return 0;
  }
  int v4 = v3;
  if (write(v3, "/tmp/cc.locktest", 0x11uLL) == 17) {
    deviceUnlockedSinceBoot(void)::deviceUnlockedOnce = 1;
  }
  close(v4);
  remove((const std::__fs::filesystem::path *)"/tmp/cc.locktest", v5);
  return deviceUnlockedSinceBoot(void)::deviceUnlockedOnce;
}

uint64_t validCFObjectReference(const char *a1, CFTypeRef cf, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!cf)
  {
    uint64_t v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = a1;
      CFStringRef v8 = v7;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = a1;
      CFStringRef v8 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v8, OS_LOG_TYPE_ERROR, "%s NULL value.\n", buf, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v11;
      long long v22 = v11;
      long long v19 = v11;
      long long v20 = v11;
      long long v17 = v11;
      long long v18 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&uint8_t buf[16] = v11;
      memset(&v15, 0, sizeof(v15));
      time_t v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s NULL value.\n");
    }
    return 0;
  }
  if (CFGetTypeID(cf) == a3) {
    return 1;
  }
  uint64_t v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = CFGetTypeID(cf);
    uint64_t v10 = v9;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = CFGetTypeID(cf);
    uint64_t v10 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v10, OS_LOG_TYPE_ERROR, "%s Unexpected CF object type ID. Expected (%lu), have (%lu) \n", buf, 0x20u);
LABEL_14:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v12;
    long long v22 = v12;
    long long v19 = v12;
    long long v20 = v12;
    long long v17 = v12;
    long long v18 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    memset(&v15, 0, sizeof(v15));
    time_t v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", buf);
    int v13 = glog_fd;
    CFGetTypeID(cf);
    dprintf(v13, "%s Unexpected CF object type ID. Expected (%lu), have (%lu) \n");
  }
  return 0;
}

void addSystemInformationToDict(__CFDictionary *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v5 = Mutable;
    unsigned int v8 = -1431655766;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)uint64_t v10 = v6;
    long long v11 = v6;
    v9[1] = 0xAAAAAAAAAAAAAAAALL;
    add_ull_to_dict("mach-absolute-time", a2, Mutable);
    v9[0] = 0x1700000006;
    size_t v7 = 4;
    if (!sysctl((int *)v9, 2u, &v8, &v7, 0, 0)) {
      add_ull_to_dict("tick-frequency", v8, v5);
    }
    v9[0] = 0x4100000001;
    size_t v7 = 32;
    if (!sysctl((int *)v9, 2u, v12, &v7, 0, 0))
    {
      HIBYTE(v13) = 0;
      add_cstr_to_dict("os-version", v12, v5);
    }
    v9[0] = 0x200000006;
    size_t v7 = 32;
    if (!sysctl((int *)v9, 2u, v10, &v7, 0, 0))
    {
      HIBYTE(v11) = 0;
      add_cstr_to_dict("hw-model", v10, v5);
    }
    if ((gBootArgsParsed & 1) == 0)
    {
      size_t v7 = 256;
      if (!sysctlbyname("kern.bootargs", gBootArgs, &v7, 0, 0)) {
        byte_2675F7339 = 0;
      }
    }
    add_cstr_to_dict("boot-args", gBootArgs, v5);
    add_cftype_to_dict("DeviceInfo", v5, a1);
    CFRelease(v5);
  }
}

void add_ull_to_dict(const char *a1, uint64_t a2, __CFDictionary *a3)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = a2;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, v7);
  if (v5)
  {
    CFNumberRef v6 = v5;
    add_cftype_to_dict(a1, v5, a3);
    CFRelease(v6);
  }
}

void add_cstr_to_dict(const char *a1, char *a2, __CFDictionary *a3)
{
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0);
  if (v5)
  {
    CFStringRef v6 = v5;
    add_cftype_to_dict(a1, v5, a3);
    CFRelease(v6);
  }
}

void add_cftype_to_dict(const char *cStr, const void *a2, __CFDictionary *a3)
{
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionaryAddValue(a3, v5, a2);
    CFRelease(v6);
  }
}

uint64_t CCIOReporterFormatter::initWithRegistryEntry(CCIOReporterFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCIOReporterFormatter::getFormatterFileExtension(CCIOReporterFormatter *this)
{
  return "xml";
}

uint64_t CCIOReporterFormatter::writeCommentEntry()
{
  return 0;
}

CFIndex CCIOReporterFormatter::writeLog(CCIOReporterFormatter *a1, uint64_t a2, const UInt8 *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (!a2 || (CFStringRef v6 = a3) == 0)
  {
    uint64_t v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)long long buffer = 0;
      tm v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)long long buffer = 0;
      tm v15 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog Unexpected log data \n", buffer, 2u);
LABEL_11:
    if (glog_fd)
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v84 = v16;
      long long v85 = v16;
      long long v82 = v16;
      long long v83 = v16;
      long long v80 = v16;
      long long v81 = v16;
      *(_OWORD *)long long buffer = v16;
      *(_OWORD *)&char buffer[16] = v16;
      memset(v74, 0, 56);
      *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog Unexpected log data \n");
    }
    return 0;
  }
  size_t v9 = a4;
  if (a4) {
    goto LABEL_16;
  }
  uint64_t v12 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)long long buffer = 134217984;
    *(void *)&buffer[4] = 0;
    long long v13 = v12;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)long long buffer = 134217984;
    *(void *)&buffer[4] = 0;
    long long v13 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (1) length=%lu\n", buffer, 0xCu);
LABEL_14:
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v84 = v17;
    long long v85 = v17;
    long long v82 = v17;
    long long v83 = v17;
    long long v80 = v17;
    long long v81 = v17;
    *(_OWORD *)long long buffer = v17;
    *(_OWORD *)&char buffer[16] = v17;
    memset(v74, 0, 56);
    *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (1) length=%lu\n", 0);
  }
LABEL_16:
  if (!a5 || a6) {
    goto LABEL_24;
  }
  uint64_t v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)long long buffer = 134217984;
    *(void *)&buffer[4] = 0;
    long long v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)long long buffer = 134217984;
    *(void *)&buffer[4] = 0;
    long long v19 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", buffer, 0xCu);
LABEL_22:
  if (glog_fd)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v84 = v20;
    long long v85 = v20;
    long long v82 = v20;
    long long v83 = v20;
    long long v80 = v20;
    long long v81 = v20;
    *(_OWORD *)long long buffer = v20;
    *(_OWORD *)&char buffer[16] = v20;
    memset(v74, 0, 56);
    *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", 0);
  }
LABEL_24:
  uint64_t v21 = *(unsigned __int16 *)(a2 + 24);
  unint64_t v22 = a6 + v9;
  if (a6 + v9 == v21) {
    goto LABEL_31;
  }
  uint64_t v23 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)long long buffer = 67109632;
    *(_DWORD *)&buffer[4] = v21;
    *(_WORD *)&_OWORD buffer[8] = 2048;
    *(void *)&buffer[10] = v9;
    *(_WORD *)&buffer[18] = 2048;
    *(void *)&buffer[20] = a6;
    long long v24 = v23;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)long long buffer = 67109632;
    *(_DWORD *)&buffer[4] = v21;
    *(_WORD *)&_OWORD buffer[8] = 2048;
    *(void *)&buffer[10] = v9;
    *(_WORD *)&buffer[18] = 2048;
    *(void *)&buffer[20] = a6;
    long long v24 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", buffer, 0x1Cu);
LABEL_29:
  if (glog_fd)
  {
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v84 = v25;
    long long v85 = v25;
    long long v82 = v25;
    long long v83 = v25;
    long long v80 = v25;
    long long v81 = v25;
    *(_OWORD *)long long buffer = v25;
    *(_OWORD *)&char buffer[16] = v25;
    memset(v74, 0, 56);
    *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", *(unsigned __int16 *)(a2 + 24), v9, a6);
  }
LABEL_31:
  if (v22 <= 3)
  {
    uint64_t v26 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)long long buffer = 134217984;
      *(void *)&buffer[4] = v22;
      CFStringRef v27 = v26;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)long long buffer = 134217984;
      *(void *)&buffer[4] = v22;
      CFStringRef v27 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v27, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Insufficient length=%lu to hold IOReporterHeader_t\n", buffer, 0xCu);
LABEL_38:
    if (glog_fd)
    {
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v84 = v29;
      long long v85 = v29;
      long long v82 = v29;
      long long v83 = v29;
      long long v80 = v29;
      long long v81 = v29;
      *(_OWORD *)long long buffer = v29;
      *(_OWORD *)&char buffer[16] = v29;
      memset(v74, 0, 56);
      *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Insufficient length=%lu to hold IOReporterHeader_t\n");
    }
    return 0;
  }
  if (a5)
  {
    CFStringRef v28 = (char *)malloc_type_malloc(a6 + v9, 0x26870536uLL);
    memcpy(v28, v6, v9);
    memcpy(&v28[v9], a5, a6);
    v9 += a6;
    CFStringRef v6 = (const UInt8 *)v28;
  }
  else
  {
    CFStringRef v28 = 0;
  }
  CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v33 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, v6);
  int valuePtr = *(unsigned __int8 *)(a2 + 35);
  CFNumberRef v34 = CFNumberCreate(v32, kCFNumberSInt32Type, &valuePtr);
  CFDataRef v35 = CFDataCreateWithBytesNoCopy(0, v6 + 4, v9 - 4, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFDataRef v36 = v35;
  CFErrorRef err = 0;
  if (!v35 || !CFDataGetLength(v35))
  {
    uint64_t v50 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      *(_WORD *)long long buffer = 0;
      int v51 = v50;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      *(_WORD *)long long buffer = 0;
      int v51 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v51, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Can't copy rawData\n", buffer, 2u);
LABEL_65:
    if (glog_fd)
    {
      *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v84 = v54;
      long long v85 = v54;
      long long v82 = v54;
      long long v83 = v54;
      long long v80 = v54;
      long long v81 = v54;
      *(_OWORD *)long long buffer = v54;
      *(_OWORD *)&char buffer[16] = v54;
      memset(v74, 0, 56);
      *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Can't copy rawData\n");
    }
    goto LABEL_70;
  }
  CFDictionaryRef ChannelsForStreamAndSubscription = CCIOReporterFormatter::getChannelsForStreamAndSubscription(a1, v34, v33);
  if (!ChannelsForStreamAndSubscription || !CFDictionaryGetCount(ChannelsForStreamAndSubscription))
  {
    uint64_t v52 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      *(_WORD *)long long buffer = 0;
      long long v53 = v52;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      *(_WORD *)long long buffer = 0;
      long long v53 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v53, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Didn't find channels\n", buffer, 2u);
LABEL_68:
    if (glog_fd)
    {
      *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v84 = v55;
      long long v85 = v55;
      long long v82 = v55;
      long long v83 = v55;
      long long v80 = v55;
      long long v81 = v55;
      *(_OWORD *)long long buffer = v55;
      *(_OWORD *)&char buffer[16] = v55;
      memset(v74, 0, 56);
      *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Didn't find channels\n");
    }
LABEL_70:
    CFStringRef v56 = 0;
    CFDataRef v44 = 0;
    tm v39 = 0;
    goto LABEL_71;
  }
  CFDictionaryRef SamplesRaw = (const __CFDictionary *)IOReportCreateSamplesRaw();
  tm v39 = SamplesRaw;
  if (SamplesRaw)
  {
    CFIndex Count = CFDictionaryGetCount(SamplesRaw);
    uint64_t v41 = err;
    if (Count && !err)
    {
      addSystemInformationToDict(v39, *(void *)(a2 + 28) & 0xFFFFFFFFFFFFFFLL);
      CFStringRef v42 = CCIOReporterFormatter::writeTimeString((uint64_t)a1, a2);
      if (v42) {
        CFDictionarySetValue(v39, @"Time", v42);
      }
      CFDataRef Data = CFPropertyListCreateData(0, v39, kCFPropertyListXMLFormat_v1_0, 0, 0);
      CFDataRef v44 = Data;
      if (Data)
      {
        if (CFDataGetBytePtr(Data))
        {
          CFIndex Length = CFDataGetLength(v44);
          BytePtr = CFDataGetBytePtr(v44);
          CFIndex v30 = Length - 173;
          ++*((_DWORD *)a1 + 46);
          uint64_t v47 = (*(uint64_t (**)(CCIOReporterFormatter *, const UInt8 *, CFIndex))(*(void *)a1 + 112))(a1, BytePtr + 164, v30);
          if (v47 != v30)
          {
            uint64_t v69 = v47;
            uint64_t v48 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buffer = 134218240;
                *(void *)&buffer[4] = v30;
                *(_WORD *)&buffer[12] = 2048;
                *(void *)&buffer[14] = v69;
                timespec v49 = v48;
LABEL_141:
                _os_log_error_impl(&dword_209928000, v49, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buffer, 0x16u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buffer = 134218240;
              *(void *)&buffer[4] = v30;
              *(_WORD *)&buffer[12] = 2048;
              *(void *)&buffer[14] = v69;
              timespec v49 = &_os_log_internal;
              goto LABEL_141;
            }
            if (glog_fd)
            {
              *(void *)&long long v68 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v84 = v68;
              long long v85 = v68;
              long long v82 = v68;
              long long v83 = v68;
              long long v80 = v68;
              long long v81 = v68;
              *(_OWORD *)long long buffer = v68;
              *(_OWORD *)&char buffer[16] = v68;
              memset(v74, 0, 56);
              *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&v71.tm_sec);
              localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
              strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
              dprintf(glog_fd, "%s ", buffer);
              dprintf(glog_fd, "CCIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", v30, v69);
            }
            CFStringRef v56 = v39;
            CFIndex v30 = v69;
LABEL_125:
            tm v39 = 0;
            if (!v28) {
              goto LABEL_73;
            }
            goto LABEL_72;
          }
LABEL_124:
          CFStringRef v56 = v39;
          goto LABEL_125;
        }
LABEL_117:
        uint64_t v65 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buffer = 0;
            long long v66 = v65;
LABEL_137:
            _os_log_error_impl(&dword_209928000, v66, OS_LOG_TYPE_ERROR, "CFDataGetBytePtr() failed", buffer, 2u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buffer = 0;
          long long v66 = &_os_log_internal;
          goto LABEL_137;
        }
        if (glog_fd)
        {
          *(void *)&long long v67 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v84 = v67;
          long long v85 = v67;
          long long v82 = v67;
          long long v83 = v67;
          long long v80 = v67;
          long long v81 = v67;
          *(_OWORD *)long long buffer = v67;
          *(_OWORD *)&char buffer[16] = v67;
          memset(v74, 0, 56);
          *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v71.tm_sec);
          localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
          strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
          dprintf(glog_fd, "%s ", buffer);
          dprintf(glog_fd, "CFDataGetBytePtr() failed");
        }
        CFIndex v30 = 0;
        goto LABEL_124;
      }
      uint64_t v62 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_115;
        }
        *(_WORD *)long long buffer = 0;
        time_t v63 = v62;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_115;
        }
        *(_WORD *)long long buffer = 0;
        time_t v63 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v63, OS_LOG_TYPE_ERROR, "CFPropertyListCreateData() failed", buffer, 2u);
LABEL_115:
      if (glog_fd)
      {
        *(void *)&long long v64 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v84 = v64;
        long long v85 = v64;
        long long v82 = v64;
        long long v83 = v64;
        long long v80 = v64;
        long long v81 = v64;
        *(_OWORD *)long long buffer = v64;
        *(_OWORD *)&char buffer[16] = v64;
        memset(v74, 0, 56);
        *(void *)&v71.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v71.tm_sec);
        localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
        strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
        dprintf(glog_fd, "%s ", buffer);
        dprintf(glog_fd, "CFPropertyListCreateData() failed");
      }
      goto LABEL_117;
    }
  }
  else
  {
    uint64_t v41 = err;
  }
  long long v90 = xmmword_209961C78;
  long long v91 = unk_209961C88;
  long long v92 = xmmword_209961C98;
  long long v93 = unk_209961CA8;
  long long v86 = xmmword_209961C38;
  long long v87 = unk_209961C48;
  long long v88 = xmmword_209961C58;
  long long v89 = unk_209961C68;
  long long v82 = xmmword_209961BF8;
  long long v83 = unk_209961C08;
  long long v84 = xmmword_209961C18;
  long long v85 = unk_209961C28;
  *(_OWORD *)long long buffer = *(_OWORD *)"<unknown>";
  *(_OWORD *)&char buffer[16] = unk_209961BC8;
  long long v80 = xmmword_209961BD8;
  long long v81 = unk_209961BE8;
  if (v41)
  {
    CFStringRef v57 = CFErrorCopyFailureReason(v41);
    if (v57)
    {
      CFStringRef v58 = v57;
      CFStringGetCString(v57, buffer, 256, 0x8000100u);
      CFRelease(v58);
    }
    CFRelease(err);
  }
  uint64_t v59 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v74 = 0;
      uint64_t v60 = v59;
LABEL_135:
      _os_log_error_impl(&dword_209928000, v60, OS_LOG_TYPE_ERROR, "IOReportCreateSamplesRaw() returned 0 sized dictionary", v74, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v74 = 0;
    uint64_t v60 = &_os_log_internal;
    goto LABEL_135;
  }
  if (glog_fd)
  {
    *(void *)&long long v61 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v77 = v61;
    long long v78 = v61;
    long long v75 = v61;
    long long v76 = v61;
    *(_OWORD *)&v74[48] = v61;
    *(_OWORD *)&v74[16] = v61;
    *(_OWORD *)&v74[32] = v61;
    *(_OWORD *)int v74 = v61;
    memset(&v71, 0, sizeof(v71));
    time_t v70 = 0xAAAAAAAAAAAAAAAALL;
    time(&v70);
    localtime_r(&v70, &v71);
    strftime(v74, 0x80uLL, "%b %d %H:%M:%S", &v71);
    dprintf(glog_fd, "%s ", v74);
    dprintf(glog_fd, "IOReportCreateSamplesRaw() returned 0 sized dictionary");
  }
  CFStringRef v56 = 0;
  CFDataRef v44 = 0;
LABEL_71:
  CFStringRef v42 = 0;
  CFIndex v30 = 0;
  if (v28) {
LABEL_72:
  }
    free(v28);
LABEL_73:
  if (v36) {
    CFRelease(v36);
  }
  if (v42) {
    CFRelease(v42);
  }
  if (v56) {
    CFRelease(v56);
  }
  if (v44) {
    CFRelease(v44);
  }
  if (v39) {
    CFRelease(v39);
  }
  if (v34) {
    CFRelease(v34);
  }
  if (v33) {
    CFRelease(v33);
  }
  return v30;
}

const __CFArray *CCIOReporterFormatter::getChannelsForStreamAndSubscription(CCIOReporterFormatter *this, const __CFNumber *a2, const __CFNumber *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFArrayRef result = (const __CFArray *)*((void *)this + 6);
  if (result)
  {
    for (CFIndex i = 0; ; ++i)
    {
      if (i >= CFArrayGetCount(result)) {
        return 0;
      }
      CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 6), i);
      if (!result) {
        return result;
      }
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      if (v8 != CFDictionaryGetTypeID()) {
        return 0;
      }
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"Id");
      if (!Value) {
        break;
      }
      CFNumberRef v10 = Value;
      CFTypeID v11 = CFGetTypeID(Value);
      if (v11 != CFNumberGetTypeID())
      {
        uint64_t v18 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "Id";
            long long v19 = v18;
            goto LABEL_26;
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "Id";
          long long v19 = &_os_log_internal;
LABEL_26:
          _os_log_impl(&dword_209928000, v19, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  key %s has wrong type in dictionary\n", buf, 0xCu);
        }
        if (glog_fd)
        {
          *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v34 = v21;
          long long v35 = v21;
          long long v32 = v21;
          long long v33 = v21;
          long long v30 = v21;
          long long v31 = v21;
          *(_OWORD *)buf = v21;
          long long v29 = v21;
          memset(&v27, 0, sizeof(v27));
          time_t v26 = 0xAAAAAAAAAAAAAAAALL;
          time(&v26);
          localtime_r(&v26, &v27);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  key %s has wrong type in dictionary\n");
        }
        goto LABEL_29;
      }
      if (CFNumberCompare(v10, a2, 0) == kCFCompareEqualTo)
      {
        CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(v7, @"CCIOReportStream");
        if (!v12
          || (CFArrayRef v13 = v12,
              CFTypeID v14 = CFGetTypeID(v12),
              CFTypeID TypeID = (CCIOReporterFormatter *)CFArrayGetTypeID(),
              (CCIOReporterFormatter *)v14 != TypeID))
        {
          uint64_t v22 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = "CCIOReportStream";
              uint64_t v23 = v22;
              goto LABEL_35;
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "CCIOReportStream";
            uint64_t v23 = &_os_log_internal;
LABEL_35:
            _os_log_impl(&dword_209928000, v23, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  Couldnt find %s\n", buf, 0xCu);
          }
          if (glog_fd)
          {
            *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v34 = v24;
            long long v35 = v24;
            long long v32 = v24;
            long long v33 = v24;
            long long v30 = v24;
            long long v31 = v24;
            *(_OWORD *)buf = v24;
            long long v29 = v24;
            memset(&v27, 0, sizeof(v27));
            time_t v26 = 0xAAAAAAAAAAAAAAAALL;
            time(&v26);
            localtime_r(&v26, &v27);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  Couldnt find %s\n", "CCIOReportStream");
          }
          return 0;
        }
        CFArrayRef result = (const __CFArray *)CCIOReporterFormatter::getChannelsForSubscription(TypeID, v13, a3);
        if (result) {
          return result;
        }
      }
LABEL_29:
      CFArrayRef result = (const __CFArray *)*((void *)this + 6);
    }
    uint64_t v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "Id";
      long long v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "Id";
      long long v17 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v17, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  no key %s in dictionary\n", buf, 0xCu);
LABEL_22:
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v34 = v20;
      long long v35 = v20;
      long long v32 = v20;
      long long v33 = v20;
      long long v30 = v20;
      long long v31 = v20;
      *(_OWORD *)buf = v20;
      long long v29 = v20;
      memset(&v27, 0, sizeof(v27));
      time_t v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  no key %s in dictionary\n");
    }
    goto LABEL_29;
  }
  return result;
}

CFStringRef CCIOReporterFormatter::writeTimeString(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  time_t v7 = *(void *)(a2 + 8);
  memset(v9, 170, 20);
  memset(&v6, 0, sizeof(v6));
  localtime_r(&v7, &v6);
  strftime(v9, 0x14uLL, "%b %d %H:%M:%S", &v6);
  memset(v8, 170, sizeof(v8));
  strftime(v8, 0x10uLL, "%z", &v6);
  int v4 = (char *)(a1 + 56);
  if (snprintf(v4, 0x80uLL, "%s.%06llu %s", v9, *(void *)(a2 + 16), v8)) {
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0x8000100u);
  }
  else {
    return 0;
  }
}

const void *CCIOReporterFormatter::getChannelsForSubscription(CCIOReporterFormatter *this, CFArrayRef theArray, const __CFNumber *a3)
{
  CFIndex v5 = 0;
  uint64_t v37 = *MEMORY[0x263EF8340];
  while (1)
  {
    if (v5 >= CFArrayGetCount(theArray)) {
      goto LABEL_29;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v5);
    if (!ValueAtIndex || (v7 = ValueAtIndex, CFTypeID v8 = CFGetTypeID(ValueAtIndex), v8 != CFDictionaryGetTypeID()))
    {
      uint64_t v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v5;
        CFArrayRef v13 = v12;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v5;
        CFArrayRef v13 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in array at i %ld\n", buf, 0xCu);
LABEL_21:
      if (glog_fd)
      {
        *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v35 = v21;
        long long v36 = v21;
        long long v33 = v21;
        long long v34 = v21;
        long long v31 = v21;
        long long v32 = v21;
        *(_OWORD *)buf = v21;
        *(_OWORD *)&uint8_t buf[16] = v21;
        memset(&v29, 0, sizeof(v29));
        time_t v28 = 0xAAAAAAAAAAAAAAAALL;
        time(&v28);
        localtime_r(&v28, &v29);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in array at i %ld\n");
      }
      goto LABEL_29;
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"CCIOReportInterestSubscriptionIDx");
    if (!Value) {
      break;
    }
    CFNumberRef v10 = Value;
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 != CFNumberGetTypeID()) {
      break;
    }
    if (CFNumberCompare(v10, a3, 0) == kCFCompareEqualTo)
    {
      uint64_t v16 = CFDictionaryGetValue(v7, @"CCIOReportInterests");
      if (v16)
      {
        long long v17 = v16;
        CFTypeID v18 = CFGetTypeID(v16);
        if (v18 == CFDictionaryGetTypeID()) {
          return v17;
        }
      }
      uint64_t v19 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "CCIOReportInterests";
        long long v20 = v19;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "CCIOReportInterests";
        long long v20 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in dict at i %ld for %s\n", buf, 0x16u);
LABEL_27:
      if (glog_fd)
      {
        *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v35 = v23;
        long long v36 = v23;
        long long v33 = v23;
        long long v34 = v23;
        long long v31 = v23;
        long long v32 = v23;
        *(_OWORD *)buf = v23;
        *(_OWORD *)&uint8_t buf[16] = v23;
        memset(&v29, 0, sizeof(v29));
        time_t v28 = 0xAAAAAAAAAAAAAAAALL;
        time(&v28);
        localtime_r(&v28, &v29);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in dict at i %ld for %s\n");
      }
      goto LABEL_29;
    }
    ++v5;
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "CCIOReportInterestSubscriptionIDx";
      tm v15 = v14;
      goto LABEL_42;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "CCIOReportInterestSubscriptionIDx";
    tm v15 = &_os_log_internal;
LABEL_42:
    _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find %s\n", buf, 0xCu);
  }
  if (glog_fd)
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v35 = v22;
    long long v36 = v22;
    long long v33 = v22;
    long long v34 = v22;
    long long v31 = v22;
    long long v32 = v22;
    *(_OWORD *)buf = v22;
    *(_OWORD *)&uint8_t buf[16] = v22;
    memset(&v29, 0, sizeof(v29));
    time_t v28 = 0xAAAAAAAAAAAAAAAALL;
    time(&v28);
    localtime_r(&v28, &v29);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find %s\n");
  }
LABEL_29:
  uint64_t v24 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v25 = v24;
      goto LABEL_38;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    long long v25 = &_os_log_internal;
LABEL_38:
    _os_log_error_impl(&dword_209928000, v25, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didn't find matching subscription\n", buf, 2u);
  }
  if (glog_fd)
  {
    *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v35 = v26;
    long long v36 = v26;
    long long v33 = v26;
    long long v34 = v26;
    long long v31 = v26;
    long long v32 = v26;
    *(_OWORD *)buf = v26;
    *(_OWORD *)&uint8_t buf[16] = v26;
    memset(&v29, 0, sizeof(v29));
    time_t v28 = 0xAAAAAAAAAAAAAAAALL;
    time(&v28);
    localtime_r(&v28, &v29);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didn't find matching subscription\n");
  }
  return 0;
}

uint64_t CCIOReporterFormatter::writeFileFooter(CCIOReporterFormatter *this)
{
  return (*(uint64_t (**)(CCIOReporterFormatter *, const char *, uint64_t))(*(void *)this + 112))(this, "</array>\n</plist>\n", 18);
}

uint64_t CCIOReporterFormatter::addRegistryChildToChannelDictionary(CFMutableArrayRef *this, uint64_t entry)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(entry, @"CCIOReportRkey", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFTypeRef v6 = IORegistryEntryCreateCFProperty(entry, @"Id", v4, 0);
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43[6] = v7;
  v43[7] = v7;
  v43[4] = v7;
  v43[5] = v7;
  v43[2] = v7;
  v43[3] = v7;
  v43[0] = v7;
  v43[1] = v7;
  if (CFProperty)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(CFProperty, @"CCIOReportStream");
    if (Value)
    {
      CFArrayRef v9 = Value;
      CFTypeID v10 = CFGetTypeID(Value);
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t v12 = coreCaptureOsLog;
      if (v10 == TypeID)
      {
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "addRegistryChildToChannelDictionary";
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = CFArrayGetCount(v9);
          CFArrayRef v13 = v12;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "addRegistryChildToChannelDictionary";
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = CFArrayGetCount(v9);
          CFArrayRef v13 = &_os_log_internal;
        }
        _os_log_impl(&dword_209928000, v13, OS_LOG_TYPE_DEFAULT, "%s::%s streams %ld\n", buf, 0x20u);
LABEL_29:
        if (glog_fd)
        {
          *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v41 = v22;
          long long v42 = v22;
          long long v39 = v22;
          long long v40 = v22;
          long long v37 = v22;
          long long v38 = v22;
          *(_OWORD *)buf = v22;
          *(_OWORD *)&uint8_t buf[16] = v22;
          memset(&v35, 0, sizeof(v35));
          time_t v34 = 0xAAAAAAAAAAAAAAAALL;
          time(&v34);
          localtime_r(&v34, &v35);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
          dprintf(glog_fd, "%s ", buf);
          int v23 = glog_fd;
          CFIndex Count = CFArrayGetCount(v9);
          dprintf(v23, "%s::%s streams %ld\n", "CCIOReporterFormatter", "addRegistryChildToChannelDictionary", Count);
        }
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (Mutable)
        {
          long long v26 = Mutable;
          CFDictionarySetValue(Mutable, @"Id", v6);
          CFDictionarySetValue(v26, @"CCIOReportStream", v9);
          CFArrayAppendValue(this[5], v26);
          if (v6) {
            CFRelease(v6);
          }
          uint64_t v20 = 1;
          CFTypeRef v6 = CFProperty;
          CFDictionaryRef CFProperty = v26;
          goto LABEL_45;
        }
        uint64_t v28 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          *(_WORD *)buf = 0;
          tm v29 = v28;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          *(_WORD *)buf = 0;
          tm v29 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  Cant create channelStreamDictionary\n", buf, 2u);
LABEL_42:
        if (glog_fd)
        {
          *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v41 = v30;
          long long v42 = v30;
          long long v39 = v30;
          long long v40 = v30;
          long long v37 = v30;
          long long v38 = v30;
          *(_OWORD *)buf = v30;
          *(_OWORD *)&uint8_t buf[16] = v30;
          memset(&v35, 0, sizeof(v35));
          time_t v34 = 0xAAAAAAAAAAAAAAAALL;
          time(&v34);
          localtime_r(&v34, &v35);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  Cant create channelStreamDictionary\n", v33);
        }
        goto LABEL_44;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        CFTypeID v18 = v12;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        CFTypeID v18 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v18, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  not array\n", buf, 2u);
LABEL_36:
      if (glog_fd)
      {
        *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v41 = v27;
        long long v42 = v27;
        long long v39 = v27;
        long long v40 = v27;
        long long v37 = v27;
        long long v38 = v27;
        *(_OWORD *)buf = v27;
        *(_OWORD *)&uint8_t buf[16] = v27;
        memset(&v35, 0, sizeof(v35));
        time_t v34 = 0xAAAAAAAAAAAAAAAALL;
        time(&v34);
        localtime_r(&v34, &v35);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  not array\n", v32);
      }
      goto LABEL_44;
    }
    uint64_t v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "CCIOReportStream";
      long long v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "CCIOReportStream";
      long long v17 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v17, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  dictionary doesn't contain %s\n", buf, 0xCu);
LABEL_24:
    if (glog_fd)
    {
      *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v41 = v21;
      long long v42 = v21;
      long long v39 = v21;
      long long v40 = v21;
      long long v37 = v21;
      long long v38 = v21;
      *(_OWORD *)buf = v21;
      *(_OWORD *)&uint8_t buf[16] = v21;
      memset(&v35, 0, sizeof(v35));
      time_t v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  dictionary doesn't contain %s\n");
    }
LABEL_44:
    uint64_t v20 = 0;
    if (!v6)
    {
LABEL_46:
      CFRelease(CFProperty);
      return v20;
    }
LABEL_45:
    CFRelease(v6);
    goto LABEL_46;
  }
  MEMORY[0x210507450](entry, v43);
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReportRkey";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v43;
    tm v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReportRkey";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v43;
    tm v15 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v15, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  no %s found in %s\n", buf, 0x16u);
LABEL_19:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v41 = v19;
    long long v42 = v19;
    long long v39 = v19;
    long long v40 = v19;
    long long v37 = v19;
    long long v38 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    memset(&v35, 0, sizeof(v35));
    time_t v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  no %s found in %s\n", "CCIOReportRkey", (const char *)v43);
  }
  uint64_t v20 = 0;
  CFDictionaryRef CFProperty = (const __CFDictionary *)v6;
  if (v6) {
    goto LABEL_46;
  }
  return v20;
}

uint64_t CCIOReporterFormatter::shapeIOReportLibraryFriendlyDictionary(CFArrayRef *this)
{
  CFIndex v2 = 0;
  uint64_t v71 = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef v4 = @"Id";
  while (2)
  {
    if (v2 >= CFArrayGetCount(this[5])) {
      return 0;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(this[5], v2);
    if (!ValueAtIndex || (CFDictionaryRef v6 = ValueAtIndex, v7 = CFGetTypeID(ValueAtIndex), v7 != CFDictionaryGetTypeID()))
    {
      uint64_t v42 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_72;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v2;
        long long v43 = v42;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_72;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v2;
        long long v43 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v43, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray at i %ld not valid\n", buf, 0x20u);
LABEL_72:
      if (glog_fd)
      {
        *(void *)&long long v54 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v69 = v54;
        long long v70 = v54;
        long long v67 = v54;
        long long v68 = v54;
        long long v65 = v54;
        long long v66 = v54;
        *(_OWORD *)buf = v54;
        *(_OWORD *)&uint8_t buf[16] = v54;
        memset(&v63, 0, sizeof(v63));
        time_t v62 = 0xAAAAAAAAAAAAAAAALL;
        time(&v62);
        localtime_r(&v62, &v63);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s channelStreamArray at i %ld not valid\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary", v2);
      }
      return 0;
    }
    CFTypeID v8 = v4;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, v4);
    if (!Value) {
      return 0;
    }
    CFNumberRef v10 = Value;
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 != CFNumberGetTypeID()) {
      return 0;
    }
    CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(v6, @"CCIOReportStream");
    if (v12)
    {
      CFArrayRef v13 = v12;
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == CFArrayGetTypeID())
      {
        CFMutableArrayRef theArray = CFArrayCreateMutable(v3, 1, MEMORY[0x263EFFF70]);
        if (theArray)
        {
          for (CFIndex i = 0; i < CFArrayGetCount(v13); ++i)
          {
            CFDictionaryRef v16 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, i);
            if (!v16 || (CFDictionaryRef v17 = v16, v18 = CFGetTypeID(v16), v18 != CFDictionaryGetTypeID()))
            {
              uint64_t v29 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[22] = 2048;
                  *(void *)&buf[24] = i;
                  long long v30 = v29;
                  goto LABEL_85;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = i;
                long long v30 = &_os_log_internal;
LABEL_85:
                _os_log_error_impl(&dword_209928000, v30, OS_LOG_TYPE_ERROR, "%s::%s didn't find or wrong type in array at i %ld\n", buf, 0x20u);
              }
              uint64_t v39 = 3758097136;
              if (glog_fd)
              {
                *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v40;
                long long v70 = v40;
                long long v67 = v40;
                long long v68 = v40;
                long long v65 = v40;
                long long v66 = v40;
                *(_OWORD *)buf = v40;
                *(_OWORD *)&uint8_t buf[16] = v40;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s didn't find or wrong type in array at i %ld\n");
              }
LABEL_61:
              CFRelease(theArray);
              uint64_t v49 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  uint64_t v50 = v49;
                  goto LABEL_80;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                uint64_t v50 = &_os_log_internal;
LABEL_80:
                _os_log_error_impl(&dword_209928000, v50, OS_LOG_TYPE_ERROR, "%s::%s failed to store description\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(void *)&long long v51 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v51;
                long long v70 = v51;
                long long v67 = v51;
                long long v68 = v51;
                long long v65 = v51;
                long long v66 = v51;
                *(_OWORD *)buf = v51;
                *(_OWORD *)&uint8_t buf[16] = v51;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s failed to store description\n");
              }
              return v39;
            }
            CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v17, @"CCIOReportInterestSubscriptionIDx");
            if (!v19 || (CFNumberRef v20 = v19, v21 = CFGetTypeID(v19), v21 != CFNumberGetTypeID()))
            {
              uint64_t v31 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[22] = 2080;
                  *(void *)&buf[24] = "CCIOReportInterestSubscriptionIDx";
                  LOWORD(v65) = 2048;
                  *(void *)((char *)&v65 + 2) = i;
                  uint64_t v32 = v31;
                  goto LABEL_87;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[22] = 2080;
                *(void *)&buf[24] = "CCIOReportInterestSubscriptionIDx";
                LOWORD(v65) = 2048;
                *(void *)((char *)&v65 + 2) = i;
                uint64_t v32 = &_os_log_internal;
LABEL_87:
                _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s or wrong type in array at i %ld\n", buf, 0x2Au);
              }
              uint64_t v39 = 3758097136;
              if (glog_fd)
              {
                *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v41;
                long long v70 = v41;
                long long v67 = v41;
                long long v68 = v41;
                long long v65 = v41;
                long long v66 = v41;
                *(_OWORD *)buf = v41;
                *(_OWORD *)&uint8_t buf[16] = v41;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s didn't find %s or wrong type in array at i %ld\n");
              }
              goto LABEL_61;
            }
            Aggregate = (__CFDictionary *)IOReportCreateAggregate();
            if (!Aggregate)
            {
              uint64_t v33 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 331;
                  time_t v34 = v33;
                  goto LABEL_92;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 331;
                time_t v34 = &_os_log_internal;
LABEL_92:
                _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "%s@%d: bail - !legend\n", buf, 0x12u);
              }
              uint64_t v39 = 3758097086;
              if (glog_fd)
              {
                *(void *)&long long v46 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v46;
                long long v70 = v46;
                long long v67 = v46;
                long long v68 = v46;
                long long v65 = v46;
                long long v66 = v46;
                *(_OWORD *)buf = v46;
                *(_OWORD *)&uint8_t buf[16] = v46;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s@%d: bail - !legend\n");
              }
              goto LABEL_61;
            }
            int v23 = Aggregate;
            if (CCIOReporterFormatter::storeChannelDescriptionFromStreamAndSubscription(this, Aggregate, v10, v20))
            {
              uint64_t v35 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  long long v36 = v35;
                  goto LABEL_94;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                long long v36 = &_os_log_internal;
LABEL_94:
                _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "%s::%s Failed to create IOReporter library friendly channel list\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v47;
                long long v70 = v47;
                long long v67 = v47;
                long long v68 = v47;
                long long v65 = v47;
                long long v66 = v47;
                *(_OWORD *)buf = v47;
                *(_OWORD *)&uint8_t buf[16] = v47;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s Failed to create IOReporter library friendly channel list\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
              }
              CFRelease(v23);
              uint64_t v39 = 3758097084;
              goto LABEL_61;
            }
            CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (!Mutable)
            {
              uint64_t v37 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  long long v38 = v37;
                  goto LABEL_96;
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                long long v38 = &_os_log_internal;
LABEL_96:
                _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "%s::%s Can't create subscriptionLegendDictionary\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v69 = v48;
                long long v70 = v48;
                long long v67 = v48;
                long long v68 = v48;
                long long v65 = v48;
                long long v66 = v48;
                *(_OWORD *)buf = v48;
                *(_OWORD *)&uint8_t buf[16] = v48;
                memset(&v63, 0, sizeof(v63));
                time_t v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s Can't create subscriptionLegendDictionary\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
              }
              CFRelease(v23);
              uint64_t v39 = 3758097085;
              goto LABEL_61;
            }
            long long v25 = Mutable;
            CFDictionarySetValue(Mutable, @"CCIOReportInterestSubscriptionIDx", v20);
            CFDictionarySetValue(v25, @"CCIOReportInterests", v23);
            CFRelease(v23);
            CFArrayAppendValue(theArray, v25);
            CFRelease(v25);
          }
          long long v26 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (v26)
          {
            long long v27 = v26;
            CFNumberRef v28 = v10;
            CFAllocatorRef v4 = v8;
            CFDictionarySetValue(v26, v8, v28);
            CFDictionarySetValue(v27, @"CCIOReportStream", theArray);
            CFRelease(theArray);
            CFArrayAppendValue(this[6], v27);
            CFRelease(v27);
            CFIndex v2 = i + 1;
            continue;
          }
          uint64_t v58 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "CCIOReporterFormatter";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
              uint64_t v59 = v58;
LABEL_108:
              _os_log_error_impl(&dword_209928000, v59, OS_LOG_TYPE_ERROR, "%s::%s Can't create channelStreamDictionary\n", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "CCIOReporterFormatter";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
            uint64_t v59 = &_os_log_internal;
            goto LABEL_108;
          }
          if (glog_fd)
          {
            *(void *)&long long v60 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v69 = v60;
            long long v70 = v60;
            long long v67 = v60;
            long long v68 = v60;
            long long v65 = v60;
            long long v66 = v60;
            *(_OWORD *)buf = v60;
            *(_OWORD *)&uint8_t buf[16] = v60;
            memset(&v63, 0, sizeof(v63));
            time_t v62 = 0xAAAAAAAAAAAAAAAALL;
            time(&v62);
            localtime_r(&v62, &v63);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "%s::%s Can't create channelStreamDictionary\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
          }
          CFRelease(theArray);
          return 3758097085;
        }
        uint64_t v52 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_82;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
          long long v53 = v52;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_82;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
          long long v53 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v53, OS_LOG_TYPE_ERROR, "%s::%s !subscriptionLegendDictionaryArray\n", buf, 0x16u);
LABEL_82:
        uint64_t v39 = 3758097084;
        if (glog_fd)
        {
          *(void *)&long long v57 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v69 = v57;
          long long v70 = v57;
          long long v67 = v57;
          long long v68 = v57;
          long long v65 = v57;
          long long v66 = v57;
          *(_OWORD *)buf = v57;
          *(_OWORD *)&uint8_t buf[16] = v57;
          memset(&v63, 0, sizeof(v63));
          time_t v62 = 0xAAAAAAAAAAAAAAAALL;
          time(&v62);
          localtime_r(&v62, &v63);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s::%s !subscriptionLegendDictionaryArray\n");
        }
        return v39;
      }
    }
    break;
  }
  uint64_t v44 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = "CCIOReportStream";
    uint64_t v45 = v44;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = "CCIOReportStream";
    uint64_t v45 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v45, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s\n", buf, 0x20u);
LABEL_77:
  uint64_t v39 = 3758097136;
  if (glog_fd)
  {
    *(void *)&long long v56 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v69 = v56;
    long long v70 = v56;
    long long v67 = v56;
    long long v68 = v56;
    long long v65 = v56;
    long long v66 = v56;
    *(_OWORD *)buf = v56;
    *(_OWORD *)&uint8_t buf[16] = v56;
    memset(&v63, 0, sizeof(v63));
    time_t v62 = 0xAAAAAAAAAAAAAAAALL;
    time(&v62);
    localtime_r(&v62, &v63);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s didn't find %s\n");
  }
  return v39;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromStreamAndSubscription(CFArrayRef *this, __CFDictionary *a2, const __CFNumber *a3, const __CFNumber *a4)
{
  CFIndex v5 = 0;
  uint64_t v6 = 0;
  uint64_t v35 = *MEMORY[0x263EF8340];
  while (v5 < CFArrayGetCount(this[5]))
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(this[5], v5);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v8 = ValueAtIndex;
    CFTypeID v9 = CFGetTypeID(ValueAtIndex);
    if (v9 != CFDictionaryGetTypeID()) {
      break;
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v8, @"Id");
    if (!Value)
    {
      uint64_t v15 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = "Id";
          CFDictionaryRef v16 = v15;
          goto LABEL_19;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = "Id";
        CFDictionaryRef v16 = &_os_log_internal;
LABEL_19:
        _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "%s::%s no key %s in dictionary\n", buf, 0x20u);
      }
      if (glog_fd)
      {
        *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v33 = v19;
        long long v34 = v19;
        long long v31 = v19;
        long long v32 = v19;
        long long v29 = v19;
        long long v30 = v19;
        *(_OWORD *)buf = v19;
        *(_OWORD *)&uint8_t buf[16] = v19;
        memset(&v27, 0, sizeof(v27));
        time_t v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s no key %s in dictionary\n");
      }
      goto LABEL_34;
    }
    CFNumberRef v11 = Value;
    CFTypeID v12 = CFGetTypeID(Value);
    if (v12 != CFNumberGetTypeID())
    {
      uint64_t v17 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = "Id";
          CFTypeID v18 = v17;
          goto LABEL_26;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = "Id";
        CFTypeID v18 = &_os_log_internal;
LABEL_26:
        _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "%s::%s key %s has wrong type in dictionary\n", buf, 0x20u);
      }
      if (glog_fd)
      {
        *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v33 = v20;
        long long v34 = v20;
        long long v31 = v20;
        long long v32 = v20;
        long long v29 = v20;
        long long v30 = v20;
        *(_OWORD *)buf = v20;
        *(_OWORD *)&uint8_t buf[16] = v20;
        memset(&v27, 0, sizeof(v27));
        time_t v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s key %s has wrong type in dictionary\n");
      }
      goto LABEL_34;
    }
    if (CFNumberCompare(v11, a3, 0))
    {
      uint64_t v13 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          CFTypeID v14 = v13;
          goto LABEL_31;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        CFTypeID v14 = &_os_log_internal;
LABEL_31:
        _os_log_impl(&dword_209928000, v14, OS_LOG_TYPE_DEFAULT, "%s::%s not a matching Stream id\n", buf, 0x16u);
      }
      if (glog_fd)
      {
        *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v33 = v21;
        long long v34 = v21;
        long long v31 = v21;
        long long v32 = v21;
        long long v29 = v21;
        long long v30 = v21;
        *(_OWORD *)buf = v21;
        *(_OWORD *)&uint8_t buf[16] = v21;
        memset(&v27, 0, sizeof(v27));
        time_t v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s not a matching Stream id\n");
      }
      goto LABEL_34;
    }
    uint64_t v6 = CCIOReporterFormatter::storeChannelDescriptionFromSubscription(0, a2, v8, a4);
    if (!v6) {
      return v6;
    }
LABEL_34:
    ++v5;
  }
  return v6;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromSubscription(CCIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict, const __CFNumber *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"CCIOReportStream");
  if (!Value || (v7 = Value, CFTypeID v8 = CFGetTypeID(Value), v8 != CFArrayGetTypeID()))
  {
    uint64_t v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "CCIOReportStream";
      long long v36 = v35;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "CCIOReportStream";
      long long v36 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s\n", buf, 0x20u);
LABEL_40:
    uint64_t v10 = 3758097136;
    if (glog_fd)
    {
      *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v59 = v37;
      long long v60 = v37;
      long long v57 = v37;
      long long v58 = v37;
      long long v55 = v37;
      long long v56 = v37;
      *(_OWORD *)buf = v37;
      *(_OWORD *)&uint8_t buf[16] = v37;
      memset(&v53, 0, sizeof(v53));
      time_t v52 = 0xAAAAAAAAAAAAAAAALL;
      time(&v52);
      localtime_r(&v52, &v53);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s::%s didn't find %s\n", "CCIOReporterFormatter", "storeChannelDescriptionFromSubscription", "CCIOReportStream");
    }
    return v10;
  }
  CFIndex v9 = 0;
  uint64_t v10 = 3758097136;
  while (1)
  {
    if (v9 >= CFArrayGetCount(v7))
    {
      unint64_t v39 = 0x2675F7000;
      if (v10 == -536870160) {
        goto LABEL_50;
      }
      return v10;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v9);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v12 = ValueAtIndex;
    CFTypeID v13 = CFGetTypeID(ValueAtIndex);
    if (v13 != CFDictionaryGetTypeID()) {
      break;
    }
    CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v12, @"CCIOReportInterestSubscriptionIDx");
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFTypeID v16 = CFGetTypeID(v14);
      if (v16 == CFNumberGetTypeID() && CFNumberCompare(v15, a4, 0) == kCFCompareEqualTo)
      {
        CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v12, @"CCIOReportInterests");
        if (v17)
        {
          CFArrayRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFArrayGetTypeID())
          {
            if (CFArrayGetCount(v18))
            {
              CFIndex v20 = 0;
              while (1)
              {
                if (CFArrayGetCount(v18) <= v20) {
                  goto LABEL_31;
                }
                CFDictionaryRef v21 = (const __CFDictionary *)CFArrayGetValueAtIndex(v18, v20);
                if (!v21) {
                  break;
                }
                CFDictionaryRef v22 = v21;
                CFTypeID v23 = CFGetTypeID(v21);
                CFTypeID TypeID = (CCIOReporterFormatter *)CFDictionaryGetTypeID();
                if ((CCIOReporterFormatter *)v23 != TypeID) {
                  break;
                }
                uint64_t v25 = CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup(TypeID, a2, v22);
                uint64_t v10 = 0;
                ++v20;
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = coreCaptureOsLog;
                  if (coreCaptureOsLog)
                  {
                    unint64_t v28 = 0x2675F7000;
                    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)&buf[4] = "CCIOReporterFormatter";
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                      long long v29 = v27;
                      goto LABEL_35;
                    }
                  }
                  else
                  {
                    unint64_t v28 = 0x2675F7000uLL;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)&buf[4] = "CCIOReporterFormatter";
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                      long long v29 = &_os_log_internal;
LABEL_35:
                      _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "%s::%s failed to store Channel Description\n", buf, 0x16u);
                    }
                  }
                  if (*(_DWORD *)(v28 + 864))
                  {
                    *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    long long v59 = v34;
                    long long v60 = v34;
                    long long v57 = v34;
                    long long v58 = v34;
                    long long v55 = v34;
                    long long v56 = v34;
                    *(_OWORD *)buf = v34;
                    *(_OWORD *)&uint8_t buf[16] = v34;
                    memset(&v53, 0, sizeof(v53));
                    time_t v52 = 0xAAAAAAAAAAAAAAAALL;
                    time(&v52);
                    localtime_r(&v52, &v53);
                    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
                    dprintf(*(_DWORD *)(v28 + 864), "%s ", buf);
                    dprintf(*(_DWORD *)(v28 + 864), "%s::%s failed to store Channel Description\n");
                  }
LABEL_30:
                  uint64_t v10 = v26;
                  goto LABEL_31;
                }
              }
              uint64_t v30 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                unint64_t v31 = 0x2675F7000;
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                  long long v32 = v30;
                  goto LABEL_33;
                }
              }
              else
              {
                unint64_t v31 = 0x2675F7000uLL;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                  long long v32 = &_os_log_internal;
LABEL_33:
                  _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "%s::%s didn't find or not a dict in array\n", buf, 0x16u);
                }
              }
              uint64_t v10 = 3758097136;
              if (!*(_DWORD *)(v31 + 864)) {
                goto LABEL_31;
              }
              *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v59 = v33;
              long long v60 = v33;
              long long v57 = v33;
              long long v58 = v33;
              long long v55 = v33;
              long long v56 = v33;
              *(_OWORD *)buf = v33;
              *(_OWORD *)&uint8_t buf[16] = v33;
              memset(&v53, 0, sizeof(v53));
              time_t v52 = 0xAAAAAAAAAAAAAAAALL;
              time(&v52);
              localtime_r(&v52, &v53);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
              dprintf(glog_fd, "%s ", buf);
              uint64_t v26 = 3758097136;
              dprintf(glog_fd, "%s::%s didn't find or not a dict in array\n");
              goto LABEL_30;
            }
            uint64_t v48 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              unint64_t v39 = 0x2675F7000;
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                uint64_t v49 = v48;
                goto LABEL_79;
              }
            }
            else
            {
              unint64_t v39 = 0x2675F7000uLL;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
                uint64_t v49 = &_os_log_internal;
LABEL_79:
                _os_log_error_impl(&dword_209928000, v49, OS_LOG_TYPE_ERROR, "%s::%s empty array\n", buf, 0x16u);
              }
            }
            if (*(_DWORD *)(v39 + 864))
            {
              *(void *)&long long v51 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v59 = v51;
              long long v60 = v51;
              long long v57 = v51;
              long long v58 = v51;
              long long v55 = v51;
              long long v56 = v51;
              *(_OWORD *)buf = v51;
              *(_OWORD *)&uint8_t buf[16] = v51;
              memset(&v53, 0, sizeof(v53));
              time_t v52 = 0xAAAAAAAAAAAAAAAALL;
              time(&v52);
              localtime_r(&v52, &v53);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
              dprintf(*(_DWORD *)(v39 + 864), "%s ", buf);
              dprintf(*(_DWORD *)(v39 + 864), "%s::%s empty array\n");
            }
            goto LABEL_50;
          }
        }
        uint64_t v46 = coreCaptureOsLog;
        unint64_t v39 = 0x2675F7000uLL;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = "CCIOReporterFormatter";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v9;
            LOWORD(v55) = 2080;
            *(void *)((char *)&v55 + 2) = "CCIOReportInterests";
            long long v47 = v46;
            goto LABEL_77;
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v9;
          LOWORD(v55) = 2080;
          *(void *)((char *)&v55 + 2) = "CCIOReportInterests";
          long long v47 = &_os_log_internal;
LABEL_77:
          _os_log_error_impl(&dword_209928000, v47, OS_LOG_TYPE_ERROR, "%s::%s  didn't find or wrong type in dict at i %ld for %s\n", buf, 0x2Au);
        }
        if (glog_fd)
        {
          *(void *)&long long v50 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v59 = v50;
          long long v60 = v50;
          long long v57 = v50;
          long long v58 = v50;
          long long v55 = v50;
          long long v56 = v50;
          *(_OWORD *)buf = v50;
          *(_OWORD *)&uint8_t buf[16] = v50;
          memset(&v53, 0, sizeof(v53));
          time_t v52 = 0xAAAAAAAAAAAAAAAALL;
          time(&v52);
          localtime_r(&v52, &v53);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s::%s  didn't find or wrong type in dict at i %ld for %s\n");
        }
        goto LABEL_50;
      }
    }
LABEL_31:
    ++v9;
  }
  uint64_t v38 = coreCaptureOsLog;
  unint64_t v39 = 0x2675F7000uLL;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v9;
      long long v40 = v38;
      goto LABEL_72;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v9;
    long long v40 = &_os_log_internal;
LABEL_72:
    _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "%s::%s didn't find or wrong type in array at i %ld\n", buf, 0x20u);
  }
  if (glog_fd)
  {
    *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v59 = v41;
    long long v60 = v41;
    long long v57 = v41;
    long long v58 = v41;
    long long v55 = v41;
    long long v56 = v41;
    *(_OWORD *)buf = v41;
    *(_OWORD *)&uint8_t buf[16] = v41;
    memset(&v53, 0, sizeof(v53));
    time_t v52 = 0xAAAAAAAAAAAAAAAALL;
    time(&v52);
    localtime_r(&v52, &v53);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s didn't find or wrong type in array at i %ld\n");
  }
LABEL_50:
  uint64_t v42 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
      long long v43 = v42;
      goto LABEL_70;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "storeChannelDescriptionFromSubscription";
    long long v43 = &_os_log_internal;
LABEL_70:
    _os_log_error_impl(&dword_209928000, v43, OS_LOG_TYPE_ERROR, "%s::%s didn't find matching subscription\n", buf, 0x16u);
  }
  if (*(_DWORD *)(v39 + 864))
  {
    *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v59 = v44;
    long long v60 = v44;
    long long v57 = v44;
    long long v58 = v44;
    long long v55 = v44;
    long long v56 = v44;
    *(_OWORD *)buf = v44;
    *(_OWORD *)&uint8_t buf[16] = v44;
    memset(&v53, 0, sizeof(v53));
    time_t v52 = 0xAAAAAAAAAAAAAAAALL;
    time(&v52);
    localtime_r(&v52, &v53);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
    dprintf(*(_DWORD *)(v39 + 864), "%s ", buf);
    dprintf(*(_DWORD *)(v39 + 864), "%s::%s didn't find matching subscription\n", "CCIOReporterFormatter", "storeChannelDescriptionFromSubscription");
  }
  return 3758097136;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup(CCIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict)
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  uint64_t v120 = 0;
  uint64_t valuePtr = 0;
  uint64_t v4 = 3758097136;
  uint64_t v119 = 0;
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"IOReportGroupName");
  if (!Value)
  {
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportGroupName";
      uint64_t v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportGroupName";
      uint64_t v10 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v10, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v13;
      long long v128 = v13;
      long long v125 = v13;
      long long v126 = v13;
      long long v124 = v13;
      *(_OWORD *)&cStr[16] = v13;
      long long v123 = v13;
      *(_OWORD *)cStr = v13;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_16;
  }
  uint64_t v6 = Value;
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 == CFStringGetTypeID())
  {
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = CFGetTypeID(v6);
    CFDictionaryRef v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = CFGetTypeID(v6);
    CFDictionaryRef v12 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v12, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_14:
  if (glog_fd)
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v127 = v14;
    long long v128 = v14;
    long long v125 = v14;
    long long v126 = v14;
    long long v124 = v14;
    *(_OWORD *)&cStr[16] = v14;
    long long v123 = v14;
    *(_OWORD *)cStr = v14;
    memset(&v118, 0, sizeof(v118));
    time_t v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    int v15 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v6);
    dprintf(v15, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_16:
  uint64_t v6 = 0;
  uint64_t v8 = 3758097136;
LABEL_17:
  CFTypeID v16 = CFDictionaryGetValue(theDict, @"IOReportSubGroupName");
  if (!v16)
  {
    uint64_t v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportSubGroupName";
      uint64_t v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)cStr = 136315138;
      *(void *)&cStr[4] = "IOReportSubGroupName";
      uint64_t v24 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_26:
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v25;
      long long v128 = v25;
      long long v125 = v25;
      long long v126 = v25;
      long long v124 = v25;
      *(_OWORD *)&cStr[16] = v25;
      long long v123 = v25;
      *(_OWORD *)cStr = v25;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_31;
  }
  CFArrayRef v17 = v16;
  CFTypeID v18 = CFGetTypeID(v16);
  if (v18 == CFStringGetTypeID()) {
    goto LABEL_32;
  }
  uint64_t v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeID v21 = CFGetTypeID(v17);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportSubGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = TypeID;
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = v21;
    CFDictionaryRef v22 = v19;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    CFTypeID v105 = CFStringGetTypeID();
    CFTypeID v106 = CFGetTypeID(v17);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportSubGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v105;
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = v106;
    CFDictionaryRef v22 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v22, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_29:
  if (glog_fd)
  {
    *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v127 = v26;
    long long v128 = v26;
    long long v125 = v26;
    long long v126 = v26;
    long long v124 = v26;
    *(_OWORD *)&cStr[16] = v26;
    long long v123 = v26;
    *(_OWORD *)cStr = v26;
    memset(&v118, 0, sizeof(v118));
    time_t v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    int v27 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v17);
    dprintf(v27, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_31:
  CFArrayRef v17 = 0;
  uint64_t v8 = 3758097136;
LABEL_32:
  CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DriverID");
  if (v28)
  {
    CFNumberRef v29 = v28;
    CFTypeID v30 = CFGetTypeID(v28);
    if (v30 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v29, kCFNumberLongLongType, &valuePtr);
      if (valuePtr) {
        goto LABEL_54;
      }
      uint64_t v31 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)cStr = 0;
          long long v32 = v31;
LABEL_156:
          _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n", cStr, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)cStr = 0;
        long long v32 = &_os_log_internal;
        goto LABEL_156;
      }
      if (glog_fd)
      {
        *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v127 = v42;
        long long v128 = v42;
        long long v125 = v42;
        long long v126 = v42;
        long long v124 = v42;
        *(_OWORD *)&cStr[16] = v42;
        long long v123 = v42;
        *(_OWORD *)cStr = v42;
        memset(&v118, 0, sizeof(v118));
        time_t v117 = 0xAAAAAAAAAAAAAAAALL;
        time(&v117);
        localtime_r(&v117, &v118);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n");
      }
      uint64_t v8 = 3758096385;
      goto LABEL_54;
    }
    uint64_t v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      CFTypeID v36 = CFNumberGetTypeID();
      CFTypeID v37 = CFGetTypeID(v29);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v36;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v37;
      uint64_t v38 = v35;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      CFTypeID v107 = CFNumberGetTypeID();
      CFTypeID v108 = CFGetTypeID(v29);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v107;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v108;
      uint64_t v38 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_48:
    uint64_t v8 = 3758097136;
    if (glog_fd)
    {
      *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v40;
      long long v128 = v40;
      long long v125 = v40;
      long long v126 = v40;
      long long v124 = v40;
      *(_OWORD *)&cStr[16] = v40;
      long long v123 = v40;
      *(_OWORD *)cStr = v40;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      int v41 = glog_fd;
      CFNumberGetTypeID();
      CFGetTypeID(v29);
      dprintf(v41, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_54;
  }
  uint64_t v33 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)cStr = 0;
    long long v34 = v33;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)cStr = 0;
    long long v34 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n", cStr, 2u);
LABEL_45:
  uint64_t v8 = 3758097136;
  if (glog_fd)
  {
    *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v127 = v39;
    long long v128 = v39;
    long long v125 = v39;
    long long v126 = v39;
    long long v124 = v39;
    *(_OWORD *)&cStr[16] = v39;
    long long v123 = v39;
    *(_OWORD *)cStr = v39;
    memset(&v118, 0, sizeof(v118));
    time_t v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n");
  }
LABEL_54:
  CFStringRef v43 = (const __CFString *)CFDictionaryGetValue(theDict, @"DriverName");
  if (!v43)
  {
    CFDictionaryRef v46 = IORegistryEntryIDMatching(valuePtr);
    if (v46)
    {
      uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v46);
      if (MatchingService)
      {
        *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v127 = v48;
        long long v128 = v48;
        long long v125 = v48;
        long long v126 = v48;
        long long v124 = v48;
        *(_OWORD *)&cStr[16] = v48;
        long long v123 = v48;
        *(_OWORD *)cStr = v48;
        MEMORY[0x210507450](MatchingService, cStr);
        CFStringRef v44 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0);
        goto LABEL_73;
      }
    }
    uint64_t v53 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)cStr = 0;
      long long v54 = v53;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)cStr = 0;
      long long v54 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v54, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n", cStr, 2u);
LABEL_70:
    if (glog_fd)
    {
      *(void *)&long long v57 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v57;
      long long v128 = v57;
      long long v125 = v57;
      long long v126 = v57;
      long long v124 = v57;
      *(_OWORD *)&cStr[16] = v57;
      long long v123 = v57;
      *(_OWORD *)cStr = v57;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n");
    }
    goto LABEL_72;
  }
  CFStringRef v44 = v43;
  CFTypeID v45 = CFGetTypeID(v43);
  if (v45 != CFStringGetTypeID())
  {
    uint64_t v49 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      CFTypeID v50 = CFStringGetTypeID();
      CFTypeID v51 = CFGetTypeID(v44);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v50;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v51;
      time_t v52 = v49;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      CFTypeID v109 = CFStringGetTypeID();
      CFTypeID v110 = CFGetTypeID(v44);
      *(_DWORD *)cStr = 136315650;
      *(void *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(void *)&cStr[14] = v109;
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v110;
      time_t v52 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v52, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_67:
    if (glog_fd)
    {
      *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v55;
      long long v128 = v55;
      long long v125 = v55;
      long long v126 = v55;
      long long v124 = v55;
      *(_OWORD *)&cStr[16] = v55;
      long long v123 = v55;
      *(_OWORD *)cStr = v55;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      int v56 = glog_fd;
      CFStringGetTypeID();
      CFGetTypeID(v44);
      dprintf(v56, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
LABEL_72:
    CFStringRef v44 = 0;
    uint64_t v8 = 3758097136;
    goto LABEL_73;
  }
  CFRetain(v44);
LABEL_73:
  long long v58 = CFDictionaryGetValue(theDict, @"IOReportChannelInfo");
  long long v59 = v58;
  if (!v58) {
    goto LABEL_81;
  }
  CFTypeID v60 = CFGetTypeID(v58);
  if (v60 == CFDictionaryGetTypeID()) {
    goto LABEL_81;
  }
  uint64_t v61 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_79;
    }
    CFTypeID v62 = CFDictionaryGetTypeID();
    CFTypeID v63 = CFGetTypeID(v59);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v62;
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = v63;
    long long v64 = v61;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_79;
    }
    CFTypeID v111 = CFDictionaryGetTypeID();
    CFTypeID v112 = CFGetTypeID(v59);
    *(_DWORD *)cStr = 136315906;
    *(void *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(void *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(void *)&cStr[24] = v111;
    LOWORD(v123) = 2048;
    *(void *)((char *)&v123 + 2) = v112;
    long long v64 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v64, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_79:
  if (glog_fd)
  {
    *(void *)&long long v65 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v65 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v127 = v65;
    long long v128 = v65;
    long long v125 = v65;
    long long v126 = v65;
    long long v124 = v65;
    *(_OWORD *)&cStr[16] = v65;
    long long v123 = v65;
    *(_OWORD *)cStr = v65;
    memset(&v118, 0, sizeof(v118));
    time_t v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    int v66 = glog_fd;
    CFTypeID v67 = CFDictionaryGetTypeID();
    CFTypeID v68 = CFGetTypeID(v59);
    dprintf(v66, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", "IOReportChannelInfo", " NOT", v67, v68);
  }
LABEL_81:
  CFArrayRef v69 = (const __CFArray *)CFDictionaryGetValue(theDict, @"IOReportChannels");
  if (v69)
  {
    CFArrayRef v70 = v69;
    CFTypeID v71 = CFGetTypeID(v69);
    if (v71 == CFArrayGetTypeID())
    {
      CFIndex v72 = 0;
      CFStringRef v115 = v44;
      while (1)
      {
        if (CFArrayGetCount(v70) <= v72)
        {
          uint64_t v4 = v8;
          goto LABEL_121;
        }
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v70, v72);
        if (!ValueAtIndex
          || (CFArrayRef v74 = ValueAtIndex, v75 = CFGetTypeID(ValueAtIndex), v75 != CFArrayGetTypeID())
          || CFArrayGetCount(v74) < 2)
        {
          uint64_t v4 = 3758097136;
          goto LABEL_121;
        }
        long long v76 = v17;
        long long v77 = v6;
        CFNumberRef v78 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 0);
        if (v78)
        {
          CFNumberRef v79 = v78;
          CFTypeID v80 = CFGetTypeID(v78);
          if (v80 == CFNumberGetTypeID()) {
            CFNumberGetValue(v79, kCFNumberSInt64Type, &v120);
          }
        }
        CFNumberRef v81 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 1);
        if (v81)
        {
          CFNumberRef v82 = v81;
          CFTypeID v83 = CFGetTypeID(v81);
          if (v83 == CFNumberGetTypeID()) {
            CFNumberGetValue(v82, kCFNumberSInt64Type, &v119);
          }
        }
        long long v84 = CFArrayGetValueAtIndex(v74, 2);
        if (v84)
        {
          long long v85 = v84;
          CFTypeID v86 = CFGetTypeID(v84);
          long long v87 = v86 == CFStringGetTypeID() ? v85 : 0;
        }
        else
        {
          long long v87 = 0;
        }
        uint64_t v88 = v120;
        uint64_t v89 = valuePtr;
        uint64_t v90 = v119;
        if (!a2 || v8 || !valuePtr || !v115 || !v120 || !v119 || !v87) {
          break;
        }
        CFStringRef v44 = v115;
        uint64_t v6 = v77;
        CFArrayRef v17 = v76;
        uint64_t v91 = IOReportAddChannelDescription();
        if (v91)
        {
          uint64_t v4 = v91;
          goto LABEL_122;
        }
        uint64_t v8 = 0;
        uint64_t v119 = 0;
        uint64_t v120 = 0;
        ++v72;
      }
      uint64_t v102 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        uint64_t v4 = 3758097136;
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_130;
        }
        *(_DWORD *)cStr = 67110400;
        *(_DWORD *)&cStr[4] = a2 != 0;
        *(_WORD *)&cStr[8] = 1024;
        *(_DWORD *)&cStr[10] = v89 != 0;
        *(_WORD *)&cStr[14] = 1024;
        *(_DWORD *)&cStr[16] = v115 != 0;
        *(_WORD *)&cStr[20] = 1024;
        *(_DWORD *)&cStr[22] = v88 != 0;
        *(_WORD *)&cStr[26] = 1024;
        *(_DWORD *)&cStr[28] = v90 != 0;
        LOWORD(v123) = 1024;
        *(_DWORD *)((char *)&v123 + 2) = v87 != 0;
        int v103 = v102;
      }
      else
      {
        uint64_t v4 = 3758097136;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_130;
        }
        *(_DWORD *)cStr = 67110400;
        *(_DWORD *)&cStr[4] = a2 != 0;
        *(_WORD *)&cStr[8] = 1024;
        *(_DWORD *)&cStr[10] = v89 != 0;
        *(_WORD *)&cStr[14] = 1024;
        *(_DWORD *)&cStr[16] = v115 != 0;
        *(_WORD *)&cStr[20] = 1024;
        *(_DWORD *)&cStr[22] = v88 != 0;
        *(_WORD *)&cStr[26] = 1024;
        *(_DWORD *)&cStr[28] = v90 != 0;
        LOWORD(v123) = 1024;
        *(_DWORD *)((char *)&v123 + 2) = v87 != 0;
        int v103 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v103, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", cStr, 0x26u);
LABEL_130:
      if (glog_fd)
      {
        *(void *)&long long v104 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v104 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v127 = v104;
        long long v128 = v104;
        CFStringRef v44 = v115;
        long long v125 = v104;
        long long v126 = v104;
        long long v124 = v104;
        *(_OWORD *)&cStr[16] = v104;
        long long v123 = v104;
        *(_OWORD *)cStr = v104;
        memset(&v118, 0, sizeof(v118));
        time_t v117 = 0xAAAAAAAAAAAAAAAALL;
        time(&v117);
        localtime_r(&v117, &v118);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n");
      }
      else
      {
        CFStringRef v44 = v115;
      }
      goto LABEL_121;
    }
    uint64_t v94 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_119;
      }
      CFTypeID v95 = CFArrayGetTypeID();
      CFTypeID v96 = CFGetTypeID(v70);
      *(_DWORD *)cStr = 136315906;
      *(void *)&cStr[4] = "IOReportChannels";
      *(_WORD *)&cStr[12] = 2080;
      *(void *)&cStr[14] = " NOT";
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v95;
      LOWORD(v123) = 2048;
      *(void *)((char *)&v123 + 2) = v96;
      int v97 = v94;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_119;
      }
      CFTypeID v113 = CFArrayGetTypeID();
      CFTypeID v114 = CFGetTypeID(v70);
      *(_DWORD *)cStr = 136315906;
      *(void *)&cStr[4] = "IOReportChannels";
      *(_WORD *)&cStr[12] = 2080;
      *(void *)&cStr[14] = " NOT";
      *(_WORD *)&cStr[22] = 2048;
      *(void *)&cStr[24] = v113;
      LOWORD(v123) = 2048;
      *(void *)((char *)&v123 + 2) = v114;
      int v97 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v97, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_119:
    if (glog_fd)
    {
      *(void *)&long long v99 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v99 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v127 = v99;
      long long v128 = v99;
      long long v125 = v99;
      long long v126 = v99;
      long long v124 = v99;
      *(_OWORD *)&cStr[16] = v99;
      long long v123 = v99;
      *(_OWORD *)cStr = v99;
      memset(&v118, 0, sizeof(v118));
      time_t v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      int v100 = glog_fd;
      CFArrayGetTypeID();
      CFGetTypeID(v70);
      dprintf(v100, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_121;
  }
  uint64_t v92 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_116;
    }
    *(_DWORD *)cStr = 136315138;
    *(void *)&cStr[4] = "IOReportChannels";
    long long v93 = v92;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_116;
    }
    *(_DWORD *)cStr = 136315138;
    *(void *)&cStr[4] = "IOReportChannels";
    long long v93 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v93, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_116:
  if (glog_fd)
  {
    *(void *)&long long v98 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v98 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v127 = v98;
    long long v128 = v98;
    long long v125 = v98;
    long long v126 = v98;
    long long v124 = v98;
    *(_OWORD *)&cStr[16] = v98;
    long long v123 = v98;
    *(_OWORD *)cStr = v98;
    memset(&v118, 0, sizeof(v118));
    time_t v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
  }
LABEL_121:
  if (v44) {
LABEL_122:
  }
    CFRelease(v44);
  return v4;
}

char *CCIOReporterFormatter::withRegistryEntry(CCIOReporterFormatter *this)
{
  io_object_t v1 = this;
  CFIndex v2 = (char *)malloc_type_malloc(0xC0uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + pthread_setname_np((const char *)this + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *((void *)v2 + 23) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)CFIndex v2 = &unk_26BD71E00;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCIOReporterFormatter::writeLogPayload(CCIOReporterFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCIOReporterFormatter *, const char *))(*(void *)this + 112))(this, a2);
}

void CCProfileMonitor::setStreamEventHandler(CCProfileMonitor *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v3 = coreCaptureOsLog;
  if (DarwinNotifyCenter)
  {
    uint64_t v4 = DarwinNotifyCenter;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      CFIndex v5 = v3;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      CFIndex v5 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler \n", buf, 2u);
LABEL_11:
    if (glog_fd)
    {
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v7;
      long long v22 = v7;
      long long v19 = v7;
      long long v20 = v7;
      long long v17 = v7;
      long long v18 = v7;
      *(_OWORD *)buf = v7;
      long long v16 = v7;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler \n");
    }
    CFNotificationCenterAddObserver(v4, this, 0, @"CCDaemonProfile Changed", @"CCDaemonProfile Changed", CFNotificationSuspensionBehaviorDeliverImmediately);
    global_queue = dispatch_get_global_queue(0, 0);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &__block_literal_global_1343);
    uint64_t v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Registered for notification callback.\n", buf, 2u);
LABEL_19:
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v11;
      long long v22 = v11;
      long long v19 = v11;
      long long v20 = v11;
      long long v17 = v11;
      long long v18 = v11;
      *(_OWORD *)buf = v11;
      long long v16 = v11;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Registered for notification callback.\n");
    }
    return;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v6, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Unable to get notification center for configuration reader.", buf, 2u);
LABEL_24:
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v12;
    long long v22 = v12;
    long long v19 = v12;
    long long v20 = v12;
    long long v17 = v12;
    long long v18 = v12;
    *(_OWORD *)buf = v12;
    long long v16 = v12;
    memset(&v14, 0, sizeof(v14));
    time_t v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Unable to get notification center for configuration reader.");
  }
}

BOOL CCProfileMonitor::initializeProfilePort(CCProfileMonitor *this)
{
  v5[5] = *MEMORY[0x263EF8340];
  CFIndex v2 = (int *)((char *)this + 80);
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN16CCProfileMonitor21initializeProfilePortEv_block_invoke;
  v5[3] = &__block_descriptor_tmp_9;
  v5[4] = this;
  return notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", v2, global_queue, v5) == 0;
}

void CCProfileMonitor::freeResources(CCProfileMonitor *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::freeResources Entered\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v4;
    long long v20 = v4;
    long long v17 = v4;
    long long v18 = v4;
    long long v15 = v4;
    long long v16 = v4;
    *(_OWORD *)buf = v4;
    long long v14 = v4;
    memset(&v12, 0, sizeof(v12));
    time_t v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::freeResources Entered\n");
  }
  if (!pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16)))
  {
    CCProfileMonitor::fProfileLoaded = 0;
    int v5 = *((_DWORD *)this + 20);
    if (v5)
    {
      notify_cancel(v5);
      *((_DWORD *)this + 20) = 0;
    }
    uint64_t v6 = *((void *)this + 11);
    if (v6)
    {
      (*(void (**)(uint64_t))(*(void *)v6 + 48))(v6);
      *((void *)this + 11) = 0;
    }
    long long v7 = (const void *)*((void *)this + 14);
    if (v7)
    {
      CFRelease(v7);
      *((void *)this + 14) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
    uint64_t v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::freeResources done\n", buf, 2u);
LABEL_22:
    if (glog_fd)
    {
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v19 = v10;
      long long v20 = v10;
      long long v17 = v10;
      long long v18 = v10;
      long long v15 = v10;
      long long v16 = v10;
      *(_OWORD *)buf = v10;
      long long v14 = v10;
      memset(&v12, 0, sizeof(v12));
      time_t v11 = 0xAAAAAAAAAAAAAAAALL;
      time(&v11);
      localtime_r(&v11, &v12);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::freeResources done\n");
    }
  }
}

void ___ZN16CCProfileMonitor17initWithConfigureEP11CCConfigure_block_invoke(uint64_t a1)
{
}

void CCProfileMonitor::applyConfiguration(CCProfileMonitor *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (shutDownPending)
  {
    uint64_t v3 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      long long v4 = v3;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      long long v4 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration  shutdown pending\n", buf, 2u);
LABEL_19:
    if (glog_fd)
    {
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v27 = v14;
      long long v28 = v14;
      long long v25 = v14;
      long long v26 = v14;
      *(_OWORD *)&unsigned char buf[32] = v14;
      long long v24 = v14;
      *(_OWORD *)buf = v14;
      *(_OWORD *)&uint8_t buf[16] = v14;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCProfileMonitor::applyConfiguration  shutdown pending\n");
    }
    return;
  }
  if (*((void *)this + 14))
  {
    uint64_t v6 = *((void *)this + 12);
    if (v6)
    {
      uint64_t v9 = (const void **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
      long long v10 = (const void **)malloc_type_malloc(8 * *((void *)this + 12), 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(*((CFDictionaryRef *)this + 14), v9, v10);
      if (*((uint64_t *)this + 12) >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          uint64_t v12 = *((void *)this + 11);
          time_t v13 = v10[v11];
          *(void *)&long long v26 = 0xAAAAAAAAAAAAAA01;
          memset(&buf[8], 0, 32);
          *(void *)buf = v12;
          *(void *)&buf[40] = a2;
          long long v24 = (unint64_t)a3;
          long long v25 = 0uLL;
          CCConfigure::applyConfiguration(v12, v13, buf);
          ++v11;
        }
        while (*((void *)this + 12) > v11);
      }
      if (v9) {
        free(v9);
      }
      if (v10)
      {
        free(v10);
      }
      return;
    }
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      long long v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      long long v18 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration profile is already removed or not installed", buf, 2u);
LABEL_36:
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v27 = v20;
      long long v28 = v20;
      long long v25 = v20;
      long long v26 = v20;
      *(_OWORD *)&unsigned char buf[32] = v20;
      long long v24 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&uint8_t buf[16] = v20;
      memset(&v22, 0, sizeof(v22));
      time_t v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCProfileMonitor::applyConfiguration profile is already removed or not installed");
    }
    return;
  }
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    long long v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    long long v16 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration profile is already removed", buf, 2u);
LABEL_31:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v19;
    long long v28 = v19;
    long long v25 = v19;
    long long v26 = v19;
    *(_OWORD *)&unsigned char buf[32] = v19;
    long long v24 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    memset(&v22, 0, sizeof(v22));
    time_t v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCProfileMonitor::applyConfiguration profile is already removed");
  }
}

void CCProfileMonitor::profileRemoved(CCProfileMonitor *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    uint64_t v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    uint64_t v3 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileRemoved Entered %d\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v4;
    long long v18 = v4;
    long long v15 = v4;
    long long v16 = v4;
    long long v13 = v4;
    long long v14 = v4;
    *(_OWORD *)buf = v4;
    long long v12 = v4;
    memset(&v10, 0, sizeof(v10));
    time_t v9 = 0xAAAAAAAAAAAAAAAALL;
    time(&v9);
    localtime_r(&v9, &v10);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::profileRemoved Entered %d\n", CCProfileMonitor::fProfileLoaded);
  }
  CCPipeMonitor::profileRemoved(*(CFDictionaryRef **)(*((void *)this + 11) + 16));
  CCProfileMonitor::fProfileLoaded = 0;
  *((unsigned char *)this + 105) = 1;
  *((void *)this + 12) = 0;
  int v5 = (const void *)*((void *)this + 14);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 14) = 0;
  }
  uint64_t v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    long long v7 = v6;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    long long v7 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileRemoved Exited :%d\n", buf, 8u);
LABEL_17:
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v8;
    long long v18 = v8;
    long long v15 = v8;
    long long v16 = v8;
    long long v13 = v8;
    long long v14 = v8;
    *(_OWORD *)buf = v8;
    long long v12 = v8;
    memset(&v10, 0, sizeof(v10));
    time_t v9 = 0xAAAAAAAAAAAAAAAALL;
    time(&v9);
    localtime_r(&v9, &v10);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::profileRemoved Exited :%d\n", CCProfileMonitor::fProfileLoaded);
  }
}

void ___ZN16CCProfileMonitor21initializeProfilePortEv_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(CCProfileMonitor **)(a1 + 32);
  CFPreferencesFlushCaches();

  CCProfileMonitor::profileCallback(v3, a2);
}

void CCProfileMonitor::~CCProfileMonitor(void *this)
{
  if (this) {
    free(this);
  }
}

void CCProfileMonitor::CCProfileMonitor(CCProfileMonitor *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71EA0;
  *((unsigned char *)this + 105) = 0;
  *((void *)this + 14) = 0;
}

{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71EA0;
  *((unsigned char *)this + 105) = 0;
  *((void *)this + 14) = 0;
}

char *CCProfileMonitor::withConfigure(CCProfileMonitor *this, CCConfigure *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (char *)malloc_type_malloc(0x78uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v3 + 12) = 0u;
  *(_OWORD *)(v3 + 28) = 0u;
  *(_OWORD *)(v3 + 44) = 0u;
  *(_OWORD *)(v3 + 60) = 0u;
  *(_OWORD *)(v3 + 76) = 0u;
  *(_OWORD *)(v3 + 92) = 0u;
  *((_DWORD *)v3 + 27) = 0;
  *((_DWORD *)v3 + 2) = 1;
  *(void *)uint64_t v3 = &unk_26BD71EA0;
  *((void *)v3 + 14) = 0;
  if (CCProfileMonitor::initWithConfigure((CCProfileMonitor *)v3, this)) {
    return v3;
  }
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v5 = v4;
LABEL_11:
      _os_log_error_impl(&dword_209928000, v5, OS_LOG_TYPE_ERROR, "CCProfileMonitor::withPipeMonitor Failed to create CCProlieMonitor\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    int v5 = &_os_log_internal;
    goto LABEL_11;
  }
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    *(_OWORD *)buf = v6;
    long long v11 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::withPipeMonitor Failed to create CCProlieMonitor\n");
  }
  (*(void (**)(char *))(*(void *)v3 + 48))(v3);
  return 0;
}

uint64_t CCProfileMonitor::applyProfile(uint64_t this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!CCProfileMonitor::fProfileLoaded) {
    return this;
  }
  uint64_t v5 = this;
  uint64_t v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = CFStringGetCStringPtr(a2, 0);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = CFStringGetCStringPtr(a3, 0);
      long long v7 = v6;
LABEL_7:
      _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyProfile owner:%s, pipe:%s\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = CFStringGetCStringPtr(a2, 0);
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = CFStringGetCStringPtr(a3, 0);
    long long v7 = &_os_log_internal;
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v8;
    long long v20 = v8;
    long long v17 = v8;
    long long v18 = v8;
    long long v15 = v8;
    long long v16 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&uint8_t buf[16] = v8;
    memset(&v13, 0, sizeof(v13));
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", buf);
    int v9 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    long long v11 = CFStringGetCStringPtr(a3, 0);
    dprintf(v9, "CCProfileMonitor::applyProfile owner:%s, pipe:%s\n", CStringPtr, v11);
  }
  this = pthread_mutex_lock((pthread_mutex_t *)(v5 + 16));
  if (!this)
  {
    CCProfileMonitor::applyConfiguration((CCProfileMonitor *)v5, a2, a3);
    return pthread_mutex_unlock((pthread_mutex_t *)(v5 + 16));
  }
  return this;
}

uint64_t CCRawFormatter::initWithRegistryEntry(CCRawFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCRawFormatter::getFormatterFileExtension(CCRawFormatter *this)
{
  return "bin";
}

uint64_t CCRawFormatter::writeLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a3)
  {
    uint64_t v9 = 0;
    if (!a5) {
      return v9;
    }
    goto LABEL_3;
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a3, a4);
  if (a5) {
LABEL_3:
  }
    v9 += (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a5, a6);
  return v9;
}

void CCRawFormatter::~CCRawFormatter(void *this)
{
  if (this) {
    free(this);
  }
}

void *CCRawFormatter::withRegistryEntry(CCRawFormatter *this)
{
  io_object_t v1 = this;
  uint64_t v2 = malloc_type_malloc(0x20uLL, 0xEE9A6C17uLL);
  v2[2] = 0;
  v2[3] = 0;
  v2[1] = 0;
  *((_DWORD *)v2 + 2) = 1;
  *uint64_t v2 = &unk_26BD71F28;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCServiceMonitor::initWithDictionary(CCServiceMonitor *this, CFTypeRef cf)
{
  *((_DWORD *)this + 4) = 0;
  uint64_t v3 = (mach_port_t *)((char *)this + 16);
  *((void *)this + 3) = 0;
  uint64_t v4 = (IONotificationPort **)((char *)this + 24);
  *((void *)this + 4) = 0;
  uint64_t v5 = (io_iterator_t *)((char *)this + 32);
  *((unsigned char *)this + 40) = 0;
  *((void *)this + 6) = cf;
  *((unsigned char *)this + 12) = 0;
  CFRetain(cf);
  if (MEMORY[0x2105073B0](0, v3)
    || (v6 = IONotificationPortCreate(*v3), (*uint64_t v4 = v6) == 0)
    || (IONotificationPortSetDispatchQueue(v6, MEMORY[0x263EF83A0]),
        CFRetain(*((CFTypeRef *)this + 6)),
        IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 3), "IOServicePublish", *((CFDictionaryRef *)this + 6), (IOServiceMatchingCallback)CCServiceMonitor::servicePublishCallback, this, v5))|| (CFRetain(*((CFTypeRef *)this + 6)), IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 3), "IOServiceTerminate", *((CFDictionaryRef *)this + 6), (IOServiceMatchingCallback)CCServiceMonitor::serviceTerminateCallback, this, v3 + 5)))
  {
    CCServiceMonitor::freeresources(this);
    return 0;
  }
  else
  {
    uint64_t result = 1;
    *((unsigned char *)this + 40) = 1;
  }
  return result;
}

void CCServiceMonitor::freeresources(CCServiceMonitor *this)
{
  io_object_t v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 8) = 0;
  }
  io_object_t v3 = *((_DWORD *)this + 9);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 9) = 0;
  }
  mach_port_name_t v4 = *((_DWORD *)this + 4);
  if (v4)
  {
    mach_port_deallocate(*MEMORY[0x263EF8960], v4);
    *((_DWORD *)this + 4) = 0;
  }
  uint64_t v5 = (const void *)*((void *)this + 6);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 6) = 0;
  }
}

uint64_t CCServiceMonitor::servicesStopListening(CCServiceMonitor *this)
{
  io_object_t v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 8) = 0;
  }
  uint64_t result = *((unsigned int *)this + 9);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

void CCServiceMonitor::ccfree(CCServiceMonitor *this)
{
  CCServiceMonitor::freeresources(this);
  if (this)
  {
    io_object_t v2 = *(void (**)(CCServiceMonitor *))(*(void *)this + 8);
    v2(this);
  }
}

void CCServiceMonitor::CCServiceMonitor(CCServiceMonitor *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD71FC8;
}

uint64_t CCServiceMonitor::scanServices(uint64_t this)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(this + 16)) {
    return this;
  }
  uint64_t v1 = this;
  if (*(unsigned char *)(this + 40))
  {
    *(unsigned char *)(this + 40) = 0;
    CCServiceMonitor::servicesPublished(this, *(_DWORD *)(this + 32));
    io_iterator_t v2 = *(_DWORD *)(v1 + 36);
    return CCServiceMonitor::servicesTerminated(v1, v2);
  }
  io_iterator_t existing = 0;
  uint64_t v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    CFIndex v4 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v4;
    uint64_t v5 = v3;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    CFIndex v6 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v6;
    uint64_t v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(1) is %ld\n", buf, 0xCu);
LABEL_12:
  if (glog_fd)
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v7;
    long long v27 = v7;
    long long v24 = v7;
    long long v25 = v7;
    long long v22 = v7;
    long long v23 = v7;
    *(_OWORD *)buf = v7;
    long long v21 = v7;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v8 = glog_fd;
    CFIndex v9 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
    dprintf(v8, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(1) is %ld\n", v9);
  }
  if (IOServiceGetMatchingServices(*(_DWORD *)(v1 + 16), *(CFDictionaryRef *)(v1 + 48), &existing)) {
    goto LABEL_24;
  }
  uint64_t v10 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      CFIndex v11 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11;
      time_t v12 = v10;
LABEL_20:
      _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(2) is %ld\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    CFIndex v13 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v13;
    time_t v12 = &_os_log_internal;
    goto LABEL_20;
  }
  if (glog_fd)
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v14;
    long long v27 = v14;
    long long v24 = v14;
    long long v25 = v14;
    long long v22 = v14;
    long long v23 = v14;
    *(_OWORD *)buf = v14;
    long long v21 = v14;
    memset(&v18, 0, sizeof(v18));
    time_t v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", (const char *)buf);
    int v15 = glog_fd;
    CFIndex v16 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
    dprintf(v15, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(2) is %ld\n", v16);
  }
  CCServiceMonitor::servicesPublished(v1, existing);
LABEL_24:
  this = existing;
  if (existing) {
    return IOObjectRelease(existing);
  }
  return this;
}

uint64_t CCTap::resumeFromQuiesced(uint64_t this)
{
  if (*(unsigned char *)(this + 97) || *(unsigned char *)(this + 96))
  {
    *(unsigned char *)(this + 97) = 0;
    this = *(void *)(this + 64);
    if (this) {
      return (*(uint64_t (**)(void))(*(void *)this + 80))();
    }
  }
  return this;
}

uint64_t CCTap::isQuiesced(CCTap *this)
{
  return *((unsigned __int8 *)this + 97);
}

uint64_t CCTap::prepareQuiescing(CCTap *this)
{
  *((unsigned char *)this + 96) = 1;
  uint64_t result = *((void *)this + 8);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 80))();
  }
  return result;
}

uint64_t CCTap::capture()
{
  return 0;
}

uint64_t CCTap::profileRemoved(CCTap *this)
{
  return 3758097095;
}

uint64_t CCTap::profileLoaded(CCTap *this)
{
  return 3758097095;
}

uint64_t CCTap::getTapType(CCTap *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t CCTap::freeResources(CCTap *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v3 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "freeResources";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    CFIndex v4 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "freeResources";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    CFIndex v4 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v4, OS_LOG_TYPE_DEFAULT, "CCTap::%s:%d entry:%u", buf, 0x18u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v6;
    long long v23 = v6;
    long long v20 = v6;
    long long v21 = v6;
    long long v18 = v6;
    long long v19 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&uint8_t buf[16] = v6;
    memset(&v16, 0, sizeof(v16));
    time_t v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCTap::%s:%d entry:%u", "freeResources", 139, *((_DWORD *)this + 4));
  }
  uint64_t v7 = *((void *)this + 8);
  if (v7)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 16));
    *((unsigned char *)this + 56) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(*((void *)this + 8) + 16));
    uint64_t v8 = *((void *)this + 8);
    if (v8)
    {
      (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
      *((void *)this + 8) = 0;
    }
  }
  else
  {
    *((unsigned char *)this + 56) = 1;
  }
  uint64_t v9 = *((void *)this + 10);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)v9 + 48))(v9);
    *((void *)this + 10) = 0;
  }
  uint64_t v10 = *((void *)this + 4);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 88))(v10);
    (*(void (**)(void))(**((void **)this + 4) + 48))(*((void *)this + 4));
    *((void *)this + 4) = 0;
  }
  CCTap::freeDirPathArray(this);
  CFIndex v11 = (const void *)*((void *)this + 5);
  if (v11)
  {
    CFRelease(v11);
    *((void *)this + 5) = 0;
  }
  time_t v12 = (const void *)*((void *)this + 6);
  if (v12)
  {
    CFRelease(v12);
    *((void *)this + 6) = 0;
  }
  CFIndex v13 = (const void *)*((void *)this + 11);
  if (v13)
  {
    CFRelease(v13);
    *((void *)this + 11) = 0;
  }
  uint64_t result = *((unsigned int *)this + 4);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 4) = 0;
  }
  return result;
}

void CCTap::freeDirPathArray(CCTap *this)
{
  uint64_t v2 = (void *)*((void *)this + 13);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 14);
    if (v3 < 1) {
      goto LABEL_9;
    }
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      uint64_t v6 = *((void *)this + 13);
      uint64_t v7 = *(const void **)(v6 + 8 * v4);
      if (v7)
      {
        CFRelease(v7);
        uint64_t v3 = *((void *)this + 14);
        *(void *)(*((void *)this + 13) + 8 * v4) = 0;
        uint64_t v6 = *((void *)this + 13);
      }
      *(void *)(v6 + 8 * v4) = 0;
      uint64_t v4 = v5;
    }
    while (v3 > v5++);
    uint64_t v2 = (void *)*((void *)this + 13);
    if (v2)
    {
LABEL_9:
      free(v2);
      *((void *)this + 13) = 0;
    }
    *((void *)this + 14) = 0;
  }
}

void CCTap::CCTap(CCTap *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD72048;
}

void *CCTap::withRegistryEntry(CCTap *this)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"PipeType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  char valuePtr = -86;
  CFStringRef v4 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"Owner", v2, 0);
  CFStringRef v5 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"Name", v2, 0);
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  if (v5)
  {
    if (v4)
    {
      if (CFProperty)
      {
        int v6 = valuePtr;
        uint64_t v7 = coreCaptureOsLog;
        if (valuePtr < 2)
        {
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_17;
            }
            if (v6 == 1) {
              uint64_t v8 = "CCDataTap";
            }
            else {
              uint64_t v8 = "CCLogTap";
            }
            CStringPtr = CFStringGetCStringPtr(v4, 0);
            uint64_t v10 = CFStringGetCStringPtr(v5, 0);
            *(_DWORD *)buf = 136316418;
            *(void *)&buf[4] = "withRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 59;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v8;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = this;
            *(_WORD *)&buf[34] = 2080;
            *(void *)&buf[36] = CStringPtr;
            *(_WORD *)&buf[44] = 2080;
            *(void *)&buf[46] = v10;
            CFIndex v11 = v7;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_17;
            }
            if (v6 == 1) {
              time_t v12 = "CCDataTap";
            }
            else {
              time_t v12 = "CCLogTap";
            }
            CFIndex v13 = CFStringGetCStringPtr(v4, 0);
            long long v14 = CFStringGetCStringPtr(v5, 0);
            *(_DWORD *)buf = 136316418;
            *(void *)&buf[4] = "withRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 59;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v12;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = this;
            *(_WORD *)&buf[34] = 2080;
            *(void *)&buf[36] = v13;
            *(_WORD *)&buf[44] = 2080;
            *(void *)&buf[46] = v14;
            CFIndex v11 = &_os_log_internal;
          }
          _os_log_impl(&dword_209928000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d %s::withRegistryEntry entry:%u Owner:%s Name:%s", buf, 0x36u);
LABEL_17:
          if (glog_fd)
          {
            *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v44 = v15;
            long long v45 = v15;
            long long v42 = v15;
            long long v43 = v15;
            *(_OWORD *)&unsigned char buf[32] = v15;
            *(_OWORD *)&unsigned char buf[48] = v15;
            *(_OWORD *)buf = v15;
            *(_OWORD *)&uint8_t buf[16] = v15;
            memset(&v39, 0, sizeof(v39));
            time_t v38 = 0xAAAAAAAAAAAAAAAALL;
            time(&v38);
            localtime_r(&v38, &v39);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
            dprintf(glog_fd, "%s ", buf);
            int v16 = glog_fd;
            if (valuePtr == 1) {
              time_t v17 = "CCDataTap";
            }
            else {
              time_t v17 = "CCLogTap";
            }
            long long v18 = CFStringGetCStringPtr(v4, 0);
            long long v19 = CFStringGetCStringPtr(v5, 0);
            dprintf(v16, "%s:%d %s::withRegistryEntry entry:%u Owner:%s Name:%s", "withRegistryEntry", 59, v17, this, v18, v19);
          }
          int v20 = valuePtr;
          if (!valuePtr)
          {
            long long v21 = CCLogTap::withRegistryEntry(this);
            goto LABEL_26;
          }
          if (valuePtr == 1)
          {
            long long v21 = CCDataTap::withRegistryEntry(this);
LABEL_26:
            long long v22 = v21;
LABEL_34:
            CFRelease(v4);
LABEL_35:
            CFRelease(v5);
            goto LABEL_36;
          }
          uint64_t v23 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_31;
            }
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v20;
            uint64_t v24 = v23;
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_31;
            }
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v20;
            uint64_t v24 = &_os_log_internal;
          }
          _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCPipe::withOwnerNameCapacity Unsupported pipe type(%d)\n", buf, 8u);
LABEL_31:
          if (glog_fd)
          {
            *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v44 = v25;
            long long v45 = v25;
            long long v42 = v25;
            long long v43 = v25;
            *(_OWORD *)&unsigned char buf[32] = v25;
            *(_OWORD *)&unsigned char buf[48] = v25;
            *(_OWORD *)buf = v25;
            *(_OWORD *)&uint8_t buf[16] = v25;
            memset(&v39, 0, sizeof(v39));
            time_t v38 = 0xAAAAAAAAAAAAAAAALL;
            time(&v38);
            localtime_r(&v38, &v39);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "CCPipe::withOwnerNameCapacity Unsupported pipe type(%d)\n");
          }
LABEL_33:
          long long v22 = 0;
          goto LABEL_34;
        }
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "withRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 56;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = this;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v6;
          uint64_t v33 = v7;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "withRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 56;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = this;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v6;
          uint64_t v33 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v33, OS_LOG_TYPE_ERROR, "%s:%d CCPipe::withOwnerNameCapacity Registry entry:%u Unsupported pipe type(%d)\n", buf, 0x1Eu);
LABEL_66:
        if (glog_fd)
        {
          *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v44 = v37;
          long long v45 = v37;
          long long v42 = v37;
          long long v43 = v37;
          *(_OWORD *)&unsigned char buf[32] = v37;
          *(_OWORD *)&unsigned char buf[48] = v37;
          *(_OWORD *)buf = v37;
          *(_OWORD *)&uint8_t buf[16] = v37;
          memset(&v39, 0, sizeof(v39));
          time_t v38 = 0xAAAAAAAAAAAAAAAALL;
          time(&v38);
          localtime_r(&v38, &v39);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s:%d CCPipe::withOwnerNameCapacity Registry entry:%u Unsupported pipe type(%d)\n");
        }
        goto LABEL_33;
      }
      uint64_t v31 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_63;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 52;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = this;
        long long v32 = v31;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_63;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 52;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = this;
        long long v32 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v32, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
LABEL_63:
      if (glog_fd)
      {
        *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v44 = v36;
        long long v45 = v36;
        long long v42 = v36;
        long long v43 = v36;
        *(_OWORD *)&unsigned char buf[32] = v36;
        *(_OWORD *)&unsigned char buf[48] = v36;
        *(_OWORD *)buf = v36;
        *(_OWORD *)&uint8_t buf[16] = v36;
        memset(&v39, 0, sizeof(v39));
        time_t v38 = 0xAAAAAAAAAAAAAAAALL;
        time(&v38);
        localtime_r(&v38, &v39);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n");
      }
      goto LABEL_33;
    }
    uint64_t v29 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 51;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = this;
        CFTypeID v30 = v29;
LABEL_71:
        _os_log_error_impl(&dword_209928000, v30, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "withRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 51;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = this;
      CFTypeID v30 = &_os_log_internal;
      goto LABEL_71;
    }
    if (glog_fd)
    {
      *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v44 = v35;
      long long v45 = v35;
      long long v42 = v35;
      long long v43 = v35;
      *(_OWORD *)&unsigned char buf[32] = v35;
      *(_OWORD *)&unsigned char buf[48] = v35;
      *(_OWORD *)buf = v35;
      *(_OWORD *)&uint8_t buf[16] = v35;
      memset(&v39, 0, sizeof(v39));
      time_t v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", "withRegistryEntry", 51, this);
    }
    long long v22 = 0;
    goto LABEL_35;
  }
  uint64_t v27 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "withRegistryEntry";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 50;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = this;
    uint64_t v28 = v27;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "withRegistryEntry";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 50;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = this;
    uint64_t v28 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v28, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
LABEL_54:
  if (glog_fd)
  {
    *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v44 = v34;
    long long v45 = v34;
    long long v42 = v34;
    long long v43 = v34;
    *(_OWORD *)&unsigned char buf[32] = v34;
    *(_OWORD *)&unsigned char buf[48] = v34;
    *(_OWORD *)buf = v34;
    *(_OWORD *)&uint8_t buf[16] = v34;
    memset(&v39, 0, sizeof(v39));
    time_t v38 = 0xAAAAAAAAAAAAAAAALL;
    time(&v38);
    localtime_r(&v38, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", "withRegistryEntry", 50, this);
  }
  long long v22 = 0;
  CFStringRef v5 = v4;
  if (v4) {
    goto LABEL_35;
  }
LABEL_36:
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v22;
}

uint64_t CCTap::setIOReportDumpQueue(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  if (a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  }
  return result;
}

uint64_t CCTap::findWithOwnerAndPipe(CFStringRef *this, const __CFString *a2, const __CFString *a3)
{
  if (CFStringCompare(this[5], a2, 0)) {
    BOOL v6 = CFEqual(@"*", a2);
  }
  else {
    BOOL v6 = 1;
  }
  if (CFStringCompare(this[6], a3, 0)) {
    BOOL v7 = CFEqual(@"*", a3);
  }
  else {
    BOOL v7 = 1;
  }
  return v6 & v7;
}

BOOL CCTap::findWithDirectory(CFStringRef *this, const __CFString *a2)
{
  return CFEqual(this[11], a2)
      || CFEqual(@"*", a2);
}

const void *NSJSONSerializationCreateDataWithJSONObject(const void *a1, int a2, void *a3)
{
  uint64_t v3 = (const void *)[MEMORY[0x263F08900] dataWithJSONObject:a1 options:a2 | 1u error:0];
  CFRetain(v3);
  return v3;
}

uint64_t CCTextFormatter::initWithRegistryEntry(CCTextFormatter *this, io_registry_entry_t entry)
{
  *((void *)this + 22) = IORegistryEntryCreateCFProperty(entry, @"LogIdentifier", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *((void *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  IOObjectRetain(entry);
  *((_DWORD *)this + 3) = entry;
  return 1;
}

uint64_t CCTextFormatter::writeLog(char *a1, time_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    uint64_t v11 = CCTextFormatter::writeLogHeader(a1, a2);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a3, a4) + v11;
  if (a5)
  {
    v12 += (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a5, a6);
    uint64_t v13 = a6 + a5;
  }
  else
  {
    uint64_t v13 = a4 + a3;
  }
  if (*(unsigned char *)(v13 - 1) != 10) {
    v12 += (*(uint64_t (**)(char *, const char *, uint64_t))(*(void *)a1 + 112))(a1, "\n", 1);
  }
  return v12;
}

uint64_t CCTextFormatter::writeLogHeader(char *a1, time_t *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  time_t v9 = a2[1];
  memset(v27, 170, 20);
  memset(&v8, 0, sizeof(v8));
  localtime_r(&v9, &v8);
  strftime(v27, 0x14uLL, "%b %d %H:%M:%S", &v8);
  memset(v26, 170, sizeof(v26));
  strftime(v26, 0x10uLL, "%z", &v8);
  unint64_t v4 = *(time_t *)((char *)a2 + 28);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)long long buffer = 0u;
  long long v11 = 0u;
  CCTextFormatter::getLogIdentifier((CCTextFormatter *)a1, HIBYTE(v4), buffer);
  if ((v4 & 0xFFFFFFFFFFFFFFLL) != 0) {
    int v5 = snprintf(a1 + 32, 0x80uLL, "%s.%06llu %s %06llu.%06llu %s<%c>[%u] ", v27, a2[2], v26);
  }
  else {
    int v5 = snprintf(a1 + 32, 0x80uLL, "%s.%06llu %s %s<%c>[%u] ", v27);
  }
  uint64_t v6 = v5;
  (*(void (**)(char *, char *, void))(*(void *)a1 + 112))(a1, a1 + 32, v5);
  return v6;
}

uint64_t CCTextFormatter::getLogIdentifier(CCTextFormatter *this, int a2, char *buffer)
{
  uint64_t v6 = *((void *)this + 20);
  if ((v6 || (CCTextFormatter::buildLogIdentTable((CFStringRef *)this), (uint64_t v6 = *((void *)this + 20)) != 0))
    && (uint64_t v7 = *((unsigned int *)this + 42), v7))
  {
    tm v8 = (unsigned __int8 *)(v6 + 8);
    while (1)
    {
      if (*v8 == a2)
      {
        CFStringRef v9 = (const __CFString *)*((void *)v8 - 1);
        if (v9) {
          break;
        }
      }
      v8 += 16;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    CFStringRef v9 = (const __CFString *)*((void *)this + 22);
  }

  return CFStringGetCString(v9, buffer, 256, 0);
}

BOOL CCTextFormatter::buildLogIdentTable(CFStringRef *this)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  io_iterator_t iterator = -1431655766;
  CCTextFormatter::freeStreamTable((CCTextFormatter *)this);
  MEMORY[0x210507440](*((unsigned int *)this + 3), "IOService", &iterator);
  int v2 = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    io_registry_entry_t v4 = IOIteratorNext(iterator);
    if (!v4) {
      break;
    }
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"Name", v3, 0);
    if (CFProperty)
    {
      ++v2;
      CFRelease(CFProperty);
    }
  }
  IOObjectRelease(iterator);
  size_t v6 = (v2 + 1);
  *((_DWORD *)this + 42) = v6;
  CFStringRef v7 = (const __CFString *)malloc_type_calloc(v6, 0x10uLL, 0x1060040E5A1EACFuLL);
  CFStringRef v8 = v7;
  this[20] = v7;
  if (v7)
  {
    CFStringRef v29 = v7;
    LOBYTE(v7->info) = 0;
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v53 = v9;
    long long v54 = v9;
    long long v51 = v9;
    long long v52 = v9;
    long long v49 = v9;
    long long v50 = v9;
    long long v47 = v9;
    long long v48 = v9;
    long long v45 = v9;
    long long v46 = v9;
    long long v43 = v9;
    long long v44 = v9;
    long long v41 = v9;
    long long v42 = v9;
    long long buffer = v9;
    long long v40 = v9;
    if (CFStringGetCString(this[22], (char *)&buffer, 256, 0))
    {
      this[20]->isa = (void *)CFStringCreateWithCString(v3, (const char *)&buffer, 0);
LABEL_20:
      MEMORY[0x210507440](*((unsigned int *)this + 3), "IOService", &iterator);
      unsigned int v16 = 1;
      while (1)
      {
        do
        {
          io_registry_entry_t v17 = IOIteratorNext(iterator);
          if (!v17)
          {
LABEL_37:
            IOObjectRelease(iterator);
            CFStringRef v8 = v29;
            return v8 != 0;
          }
          io_registry_entry_t v18 = v17;
          CFNumberRef v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v17, @"Id", v3, 0);
          int valuePtr = 0;
        }
        while (!v19);
        CFNumberRef v20 = v19;
        CFNumberGetValue(v19, kCFNumberSInt32Type, &valuePtr);
        uint64_t v21 = (uint64_t)this[20] + 16 * v16;
        *(unsigned char *)(v21 + 8) = valuePtr;
        *(void *)uint64_t v21 = 0;
        CFStringRef v22 = (const __CFString *)IORegistryEntryCreateCFProperty(v18, @"LogIdentifier", v3, 0);
        if (v22) {
          break;
        }
LABEL_33:
        CFRelease(v20);
        if (++v16 >= *((_DWORD *)this + 42)) {
          goto LABEL_37;
        }
      }
      CFStringRef v23 = v22;
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v53 = v24;
      long long v54 = v24;
      long long v51 = v24;
      long long v52 = v24;
      long long v49 = v24;
      long long v50 = v24;
      long long v47 = v24;
      long long v48 = v24;
      long long v45 = v24;
      long long v46 = v24;
      long long v43 = v24;
      long long v44 = v24;
      long long v41 = v24;
      long long v42 = v24;
      long long buffer = v24;
      long long v40 = v24;
      if (CFStringGetCString(v22, (char *)&buffer, 256, 0))
      {
        *((void *)&this[20]->isa + 2 * v16) = CFStringCreateWithCString(v3, (const char *)&buffer, 0);
LABEL_32:
        CFRelease(v23);
        goto LABEL_33;
      }
      uint64_t v25 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        *(_WORD *)long long v34 = 0;
        long long v26 = v25;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        *(_WORD *)long long v34 = 0;
        long long v26 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v26, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", v34, 2u);
LABEL_30:
      if (glog_fd)
      {
        *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v37 = v27;
        long long v38 = v27;
        long long v35 = v27;
        long long v36 = v27;
        *(_OWORD *)&v34[32] = v27;
        *(_OWORD *)&v34[48] = v27;
        *(_OWORD *)long long v34 = v27;
        *(_OWORD *)&v34[16] = v27;
        memset(&v32, 0, sizeof(v32));
        time_t v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(v34, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", v34);
        dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
      }
      goto LABEL_32;
    }
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)long long v34 = 0;
      long long v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)long long v34 = 0;
      long long v13 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", v34, 2u);
LABEL_18:
    if (glog_fd)
    {
      *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v37 = v15;
      long long v38 = v15;
      long long v35 = v15;
      long long v36 = v15;
      *(_OWORD *)&v34[32] = v15;
      *(_OWORD *)&v34[48] = v15;
      *(_OWORD *)long long v34 = v15;
      *(_OWORD *)&v34[16] = v15;
      memset(&v32, 0, sizeof(v32));
      time_t v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(v34, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", v34);
      dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
    }
    goto LABEL_20;
  }
  uint64_t v10 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(buffer) = 0;
    long long v11 = v10;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(buffer) = 0;
    long long v11 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v11, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", (uint8_t *)&buffer, 2u);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v45 = v14;
    long long v46 = v14;
    long long v43 = v14;
    long long v44 = v14;
    long long v41 = v14;
    long long v42 = v14;
    long long buffer = v14;
    long long v40 = v14;
    memset(v34, 0, 56);
    *(void *)&v32.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v32.tm_sec);
    localtime_r((const time_t *)&v32.tm_sec, (tm *)v34);
    strftime((char *)&buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v34);
    dprintf(glog_fd, "%s ", (const char *)&buffer);
    dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
  }
  return v8 != 0;
}

void CCTextFormatter::freeStreamTable(CCTextFormatter *this)
{
  int v2 = (char *)*((void *)this + 20);
  if (v2)
  {
    unint64_t v3 = *((unsigned int *)this + 42);
    if (v3)
    {
      uint64_t v4 = 0;
      for (unint64_t i = 0; i < v3; ++i)
      {
        if (*(void *)&v2[v4])
        {
          CFRelease(*(CFTypeRef *)&v2[v4]);
          int v2 = (char *)*((void *)this + 20);
          *(void *)&v2[v4] = 0;
          unint64_t v3 = *((unsigned int *)this + 42);
        }
        *(void *)&v2[v4] = 0;
        v4 += 16;
      }
    }
    free(v2);
    *((void *)this + 20) = 0;
  }
}

uint64_t CCTextFormatter::ccfree(CCTextFormatter *this)
{
  int v2 = (const void *)*((void *)this + 22);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 22) = 0;
  }
  CCTextFormatter::freeStreamTable(this);

  return CCFormatter::ccfree(this);
}

char *CCTextFormatter::withRegistryEntry(CCTextFormatter *this)
{
  io_registry_entry_t v1 = this;
  int v2 = (char *)malloc_type_malloc(0xB8uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + pthread_setname_np((const char *)this + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)int v2 = &unk_26BD72100;
  *((void *)v2 + 22) = IORegistryEntryCreateCFProperty(v1, @"LogIdentifier", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *((void *)v2 + 20) = 0;
  *((_DWORD *)v2 + 42) = 0;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCTextFormatter::writeLogPayload(CCTextFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCTextFormatter *, const char *))(*(void *)this + 112))(this, a2);
}

unint64_t CCTextFormatter::getLogLevelShortName(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = 0x5344494E57434145uLL >> (8 * a2);
  if (a2 >= 8) {
    LOBYTE(v2) = 45;
  }
  return v2 & 0x7F;
}

uint64_t CCIOReportDumpQueue::stopProcessorThread(CCIOReportDumpQueue *this)
{
  unint64_t v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  *((unsigned char *)this + 12) = 1;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 104));
  pthread_mutex_unlock(v2);
  unint64_t v3 = (_opaque_pthread_t *)*((void *)this + 4);

  return pthread_join(v3, 0);
}

uint64_t CCIOReportDumpQueue::dequeue(CCIOReportDumpQueue *this)
{
  unint64_t v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  uint64_t v3 = *((void *)this + 2);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 520);
    *((void *)this + 2) = v4;
    if (v4) {
      int v5 = (void *)(v4 + 528);
    }
    else {
      int v5 = (void *)((char *)this + 24);
    }
    void *v5 = 0;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void CCIOReportDumpQueue::~CCIOReportDumpQueue(void *this)
{
  if (this) {
    free(this);
  }
}

void CCIOReportDumpQueue::CCIOReportDumpQueue(CCIOReportDumpQueue *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD721A0;
}

{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD721A0;
}

CCIOReportDumpQueue *CCIOReportDumpQueue::createInstance(CCIOReportDumpQueue *this)
{
  io_registry_entry_t v1 = (CCIOReportDumpQueue *)malloc_type_malloc(0x98uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v1 + 12) = 0u;
  *(_OWORD *)((char *)v1 + 28) = 0u;
  *(_OWORD *)((char *)v1 + 44) = 0u;
  *(_OWORD *)((char *)v1 + 60) = 0u;
  *(_OWORD *)((char *)v1 + 76) = 0u;
  *(_OWORD *)((char *)v1 + 92) = 0u;
  *(_OWORD *)((char *)v1 + 108) = 0u;
  *(_OWORD *)((char *)v1 + 124) = 0u;
  *(_OWORD *)((char *)v1 + 136) = 0u;
  *((_DWORD *)v1 + 2) = 1;
  *(void *)io_registry_entry_t v1 = &unk_26BD721A0;
  if (CCIOReportDumpQueue::initInstance(v1))
  {
    (*(void (**)(CCIOReportDumpQueue *))(*(void *)v1 + 48))(v1);
    return 0;
  }
  return v1;
}

uint64_t CCIOReportDumpQueue::initInstance(CCIOReportDumpQueue *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 40), 0);
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      int v5 = v4;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      int v5 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v5, OS_LOG_TYPE_ERROR, "ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_10:
    uint64_t v10 = 3758097084;
    if (glog_fd)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v11;
      long long v23 = v11;
      long long v20 = v11;
      long long v21 = v11;
      long long v18 = v11;
      long long v19 = v11;
      *(_OWORD *)buf = v11;
      long long v17 = v11;
      memset(&v15, 0, sizeof(v15));
      time_t v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "ERROR INIT MUTEX: %d\n");
    }
    return v10;
  }
  int v6 = pthread_cond_init((pthread_cond_t *)((char *)this + 104), 0);
  if (!v6)
  {
    pthread_create((pthread_t *)this + 4, 0, (void *(__cdecl *)(void *))CCIOReportDumpQueue::processorThread, this);
    return 0;
  }
  int v7 = v6;
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    long long v9 = v8;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    long long v9 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v9, OS_LOG_TYPE_ERROR, "ERROR INIT COND: %d\n", buf, 8u);
LABEL_14:
  uint64_t v10 = 3758097084;
  if (glog_fd)
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v12;
    long long v23 = v12;
    long long v20 = v12;
    long long v21 = v12;
    long long v18 = v12;
    long long v19 = v12;
    *(_OWORD *)buf = v12;
    long long v17 = v12;
    memset(&v15, 0, sizeof(v15));
    time_t v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "ERROR INIT COND: %d\n");
  }
  return v10;
}

void CCIOReportDumpQueue::processorThread(CCIOReportDumpQueue *this, void *a2)
{
}

BOOL CCIOReportDumpQueue::enqueue(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 12)) {
    return 0;
  }
  int v5 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  BOOL v2 = *(unsigned char *)(a1 + 12) == 0;
  if (!*(unsigned char *)(a1 + 12))
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6)
    {
      *(void *)(a2 + 520) = 0;
      uint64_t v6 = *(void *)(a1 + 24);
      *(void *)(v6 + 520) = a2;
      *(void *)(a1 + 24) = a2;
    }
    else
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      *(void *)(a2 + 520) = 0;
    }
    *(void *)(a2 + 528) = v6;
    pthread_cond_signal((pthread_cond_t *)(a1 + 104));
  }
  pthread_mutex_unlock(v5);
  return v2;
}

uint64_t ___ZN19CCIOReportDumpQueue16_processorThreadEv_block_invoke(uint64_t a1)
{
  return CCIOReportDumpQueue::signalToSave(*(CCIOReportDumpQueue **)(a1 + 32));
}

void CCIOReportDumpQueue::doSaveChannels(CCIOReportDumpQueue *this, const __CFString *a2, __CFDictionary *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFErrorRef err = 0;
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "doSaveChannels";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 341;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = CFStringGetCStringPtr(a2, 0);
    int v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "doSaveChannels";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 341;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = CFStringGetCStringPtr(a2, 0);
    int v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "%s@%d: Will write to: %s\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v53 = v6;
    long long v54 = v6;
    long long v51 = v6;
    long long v52 = v6;
    long long v49 = v6;
    long long v50 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&uint8_t buf[16] = v6;
    memset(v43, 0, 56);
    *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v40.tm_sec);
    localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
    dprintf(glog_fd, "%s ", buf);
    int v7 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    dprintf(v7, "%s@%d: Will write to: %s\n", "doSaveChannels", 341, CStringPtr);
  }
  if (!IOReportGetChannelCount())
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      long long v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      long long v18 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "No channels found\n", buf, 2u);
LABEL_37:
    if (glog_fd)
    {
      *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v53 = v27;
      long long v54 = v27;
      long long v51 = v27;
      long long v52 = v27;
      long long v49 = v27;
      long long v50 = v27;
      *(_OWORD *)buf = v27;
      *(_OWORD *)&uint8_t buf[16] = v27;
      memset(v43, 0, 56);
      *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "No channels found\n");
    }
    goto LABEL_42;
  }
  uint64_t Subscription = IOReportCreateSubscription();
  if (!Subscription)
  {
    long long v59 = xmmword_209961C78;
    long long v60 = unk_209961C88;
    long long v61 = xmmword_209961C98;
    long long v62 = unk_209961CA8;
    long long v55 = xmmword_209961C38;
    long long v56 = unk_209961C48;
    long long v57 = xmmword_209961C58;
    long long v58 = unk_209961C68;
    long long v51 = xmmword_209961BF8;
    long long v52 = unk_209961C08;
    long long v53 = xmmword_209961C18;
    long long v54 = unk_209961C28;
    *(_OWORD *)buf = *(_OWORD *)"<unknown>";
    *(_OWORD *)&uint8_t buf[16] = unk_209961BC8;
    long long v49 = xmmword_209961BD8;
    long long v50 = unk_209961BE8;
    if (err)
    {
      CFStringRef v19 = CFErrorCopyFailureReason(err);
      if (v19)
      {
        CFStringRef v20 = v19;
        CFStringGetCString(v19, buf, 256, 0x8000100u);
        CFRelease(v20);
      }
      CFRelease(err);
    }
    uint64_t v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)long long v43 = 136315650;
      *(void *)&v43[4] = "doSaveChannels";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 360;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = buf;
      long long v22 = v21;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)long long v43 = 136315650;
      *(void *)&v43[4] = "doSaveChannels";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 360;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = buf;
      long long v22 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v22, OS_LOG_TYPE_ERROR, "%s@%d: Unable to create subscribtion: %s\n", v43, 0x1Cu);
LABEL_40:
    if (glog_fd)
    {
      *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v46 = v28;
      long long v47 = v28;
      long long v44 = v28;
      long long v45 = v28;
      *(_OWORD *)&v43[48] = v28;
      *(_OWORD *)&v43[16] = v28;
      *(_OWORD *)&v43[32] = v28;
      *(_OWORD *)long long v43 = v28;
      memset(&v40, 0, sizeof(v40));
      time_t v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(v43, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", v43);
      dprintf(glog_fd, "%s@%d: Unable to create subscribtion: %s\n");
    }
LABEL_42:
    uint64_t v10 = 0;
    goto LABEL_67;
  }
  uint64_t v10 = (const void *)Subscription;
  uint64_t Samples = IOReportCreateSamples();
  if (Samples)
  {
    long long v12 = (__CFDictionary *)Samples;
    uint64_t v13 = mach_absolute_time();
    addSystemInformationToDict(v12, v13);
    if (!ifSeedCreateClassCProtectedFileAtCFStringPath(a2))
    {
LABEL_66:
      CFRelease(v12);
      goto LABEL_67;
    }
    CFURLRef v14 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, kCFURLPOSIXPathStyle, 0);
    if (v14)
    {
LABEL_49:
      CFDataRef Data = CFPropertyListCreateData(0, v12, kCFPropertyListXMLFormat_v1_0, 0, 0);
      if (Data)
      {
        CFDataRef v32 = Data;
        LODWORD(v39) = -1431655766;
        if (CFURLWriteDataAndPropertiesToResource(v14, Data, 0, (SInt32 *)&v39))
        {
LABEL_63:
          CFRelease(v32);
LABEL_64:
          if (v14) {
            CFRelease(v14);
          }
          goto LABEL_66;
        }
        uint64_t v33 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_WORD *)buf = 0;
          long long v34 = v33;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_WORD *)buf = 0;
          long long v34 = &_os_log_internal;
        }
        _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "Error creating plist...\n", buf, 2u);
LABEL_61:
        if (glog_fd)
        {
          *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v53 = v38;
          long long v54 = v38;
          long long v51 = v38;
          long long v52 = v38;
          long long v49 = v38;
          long long v50 = v38;
          *(_OWORD *)buf = v38;
          *(_OWORD *)&uint8_t buf[16] = v38;
          memset(v43, 0, 56);
          *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v40.tm_sec);
          localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "Error creating plist...\n");
        }
        goto LABEL_63;
      }
      uint64_t v35 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        *(_WORD *)buf = 0;
        long long v36 = v35;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        *(_WORD *)buf = 0;
        long long v36 = &_os_log_internal;
      }
      _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "ERROR: cannot build the XML data\n", buf, 2u);
LABEL_58:
      if (glog_fd)
      {
        *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v53 = v37;
        long long v54 = v37;
        long long v51 = v37;
        long long v52 = v37;
        long long v49 = v37;
        long long v50 = v37;
        *(_OWORD *)buf = v37;
        *(_OWORD *)&uint8_t buf[16] = v37;
        memset(v43, 0, 56);
        *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v40.tm_sec);
        localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "ERROR: cannot build the XML data\n");
      }
      goto LABEL_64;
    }
    uint64_t v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      unsigned int v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      unsigned int v16 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "ERROR: FileURL not created\n", buf, 2u);
LABEL_47:
    if (glog_fd)
    {
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v53 = v30;
      long long v54 = v30;
      long long v51 = v30;
      long long v52 = v30;
      long long v49 = v30;
      long long v50 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&uint8_t buf[16] = v30;
      memset(v43, 0, 56);
      *(void *)&v40.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "ERROR: FileURL not created\n");
    }
    goto LABEL_49;
  }
  long long v59 = xmmword_209961C78;
  long long v60 = unk_209961C88;
  long long v61 = xmmword_209961C98;
  long long v62 = unk_209961CA8;
  long long v55 = xmmword_209961C38;
  long long v56 = unk_209961C48;
  long long v57 = xmmword_209961C58;
  long long v58 = unk_209961C68;
  long long v51 = xmmword_209961BF8;
  long long v52 = unk_209961C08;
  long long v53 = xmmword_209961C18;
  long long v54 = unk_209961C28;
  *(_OWORD *)buf = *(_OWORD *)"<unknown>";
  *(_OWORD *)&uint8_t buf[16] = unk_209961BC8;
  long long v49 = xmmword_209961BD8;
  long long v50 = unk_209961BE8;
  if (err)
  {
    CFStringRef v23 = CFErrorCopyFailureReason(err);
    if (v23)
    {
      CFStringRef v24 = v23;
      CFStringGetCString(v23, buf, 256, 0x8000100u);
      CFRelease(v24);
    }
    CFRelease(err);
  }
  uint64_t v25 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)long long v43 = 136315650;
    *(void *)&v43[4] = "doSaveChannels";
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = 376;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = buf;
    long long v26 = v25;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)long long v43 = 136315650;
    *(void *)&v43[4] = "doSaveChannels";
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = 376;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = buf;
    long long v26 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v26, OS_LOG_TYPE_ERROR, "%s@%d: Unable to create samples: %s\n", v43, 0x1Cu);
LABEL_44:
  if (glog_fd)
  {
    *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v46 = v29;
    long long v47 = v29;
    long long v44 = v29;
    long long v45 = v29;
    *(_OWORD *)&v43[48] = v29;
    *(_OWORD *)&v43[16] = v29;
    *(_OWORD *)&v43[32] = v29;
    *(_OWORD *)long long v43 = v29;
    memset(&v40, 0, sizeof(v40));
    time_t v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(v43, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", v43);
    dprintf(glog_fd, "%s@%d: Unable to create samples: %s\n", "doSaveChannels", 376, buf);
  }
LABEL_67:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v10) {
    CFRelease(v10);
  }
}

uint64_t CCIOReportDumpQueue::signalToSave(CCIOReportDumpQueue *this)
{
  BOOL v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  *((unsigned char *)this + 13) = 1;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 104));

  return pthread_mutex_unlock(v2);
}

uint64_t CCIOReportDumpQueue::startProcessorThread(pthread_t *this)
{
  return pthread_create(this + 4, 0, (void *(__cdecl *)(void *))CCIOReportDumpQueue::processorThread, this);
}

uint64_t CCPcapngFormatter::initWithRegistryEntry(CCPcapngFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 7) = 0;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

const char *CCPcapngFormatter::getFormatterFileExtension(CCPcapngFormatter *this)
{
  return "pcapng";
}

uint64_t CCPcapngFormatter::writeCommentEntry(uint64_t a1, _OWORD *a2, const void *a3, size_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  size_t v8 = -(int)a4 & 3;
  long long v9 = (char *)malloc_type_malloc(a4 + v8 + 12, 0xCDA304C8uLL);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  *(_DWORD *)long long v9 = -1364283730;
  *((_WORD *)v9 + 2) = 1;
  *((_WORD *)v9 + 3) = a4;
  memcpy(v9 + 8, a3, a4);
  unsigned __int16 v11 = a4 + 8;
  bzero(&v10[v11], v8);
  *(_WORD *)&v10[(unsigned __int16)(v11 + v8)] = 0;
  *(_WORD *)&v10[(unsigned __int16)(v11 + v8 + 2)] = 0;
  *(_OWORD *)&v14[12] = *(_OWORD *)((char *)a2 + 12);
  *(_OWORD *)CFURLRef v14 = *a2;
  uint64_t v15 = 0x4000400000000;
  *(_WORD *)&v14[24] = v11 + v8 + 4;
  v14[26] = 0;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, unsigned char *, char *, void, void, void))(*(void *)a1 + 72))(a1, v14, v10, *(unsigned __int16 *)&v14[24], 0, 0);
  free(v10);
  return v12;
}

uint64_t CCPcapngFormatter::writeLog(CCPcapngFormatter *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (a4) {
      goto LABEL_17;
    }
    uint64_t v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0;
      uint64_t v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0;
      uint64_t v13 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v13, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (1) length=%lu\n", buf, 0xCu);
LABEL_15:
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v43 = v18;
      long long v44 = v18;
      long long v41 = v18;
      long long v42 = v18;
      long long v39 = v18;
      long long v40 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&uint8_t buf[16] = v18;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (1) length=%lu\n", 0);
    }
LABEL_17:
    if (!a5 || a6) {
      goto LABEL_25;
    }
    uint64_t v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0;
      CFStringRef v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0;
      CFStringRef v20 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v20, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", buf, 0xCu);
LABEL_23:
    if (glog_fd)
    {
      *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v43 = v21;
      long long v44 = v21;
      long long v41 = v21;
      long long v42 = v21;
      long long v39 = v21;
      long long v40 = v21;
      *(_OWORD *)buf = v21;
      *(_OWORD *)&uint8_t buf[16] = v21;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", 0);
    }
LABEL_25:
    uint64_t v22 = *(unsigned __int16 *)(a2 + 24);
    if (a6 + a4 == v22) {
      goto LABEL_32;
    }
    uint64_t v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v22;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = a6;
      CFStringRef v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v22;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = a6;
      CFStringRef v24 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", buf, 0x1Cu);
LABEL_30:
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v43 = v25;
      long long v44 = v25;
      long long v41 = v25;
      long long v42 = v25;
      long long v39 = v25;
      long long v40 = v25;
      *(_OWORD *)buf = v25;
      *(_OWORD *)&uint8_t buf[16] = v25;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", *(unsigned __int16 *)(a2 + 24), a4, a6);
    }
LABEL_32:
    uint64_t v26 = CCPcapngFormatter::writeLogHeader(this, a2);
    uint64_t v27 = (*(uint64_t (**)(CCPcapngFormatter *, uint64_t, uint64_t))(*(void *)this + 112))(this, a3, a4);
    if (v27 == a4) {
      goto LABEL_39;
    }
    uint64_t v28 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v27;
      long long v29 = v28;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v27;
      long long v29 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Failed to write(1) Length=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_37:
    if (glog_fd)
    {
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v43 = v30;
      long long v44 = v30;
      long long v41 = v30;
      long long v42 = v30;
      long long v39 = v30;
      long long v40 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&uint8_t buf[16] = v30;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog Failed to write(1) Length=%lu, tempLength=%lu\n", a4, v27);
    }
LABEL_39:
    uint64_t v31 = v27 + v26;
    if (!a5) {
      return CCPcapngFormatter::writeLogFooter((uint64_t)this, a2) + v31;
    }
    uint64_t v32 = (*(uint64_t (**)(CCPcapngFormatter *, uint64_t, uint64_t))(*(void *)this + 112))(this, a5, a6);
    if (v32 == a6)
    {
LABEL_47:
      v31 += v32;
      return CCPcapngFormatter::writeLogFooter((uint64_t)this, a2) + v31;
    }
    uint64_t v33 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v32;
      long long v34 = v33;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v32;
      long long v34 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v34, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Failed to write(2) Length=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_45:
    if (glog_fd)
    {
      *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v43 = v35;
      long long v44 = v35;
      long long v41 = v35;
      long long v42 = v35;
      long long v39 = v35;
      long long v40 = v35;
      *(_OWORD *)buf = v35;
      *(_OWORD *)&uint8_t buf[16] = v35;
      memset(&v37, 0, sizeof(v37));
      time_t v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog Failed to write(2) Length=%lu, tempLength=%lu\n", a6, v32);
    }
    goto LABEL_47;
  }
  uint64_t v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v15 = v14;
LABEL_51:
      _os_log_error_impl(&dword_209928000, v15, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Unexpected log data \n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v15 = &_os_log_internal;
    goto LABEL_51;
  }
  if (glog_fd)
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v43 = v16;
    long long v44 = v16;
    long long v41 = v16;
    long long v42 = v16;
    long long v39 = v16;
    long long v40 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&uint8_t buf[16] = v16;
    memset(&v37, 0, sizeof(v37));
    time_t v36 = 0xAAAAAAAAAAAAAAAALL;
    time(&v36);
    localtime_r(&v36, &v37);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPcapngFormatter::writeLog Unexpected log data \n");
  }
  return 0;
}

uint64_t CCPcapngFormatter::writeLogHeader(CCPcapngFormatter *this, uint64_t a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_WORD *)buf = 0;
      long long v38 = v37;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_WORD *)buf = 0;
      long long v38 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v38, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader logMetaData is NULL\n", buf, 2u);
LABEL_48:
    if (glog_fd)
    {
      *(void *)&long long v41 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v56 = v41;
      long long v57 = v41;
      long long v54 = v41;
      long long v55 = v41;
      long long v52 = v41;
      long long v53 = v41;
      *(_OWORD *)buf = v41;
      *(_OWORD *)&uint8_t buf[16] = v41;
      memset(&v44, 0, sizeof(v44));
      time_t v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogHeader logMetaData is NULL\n");
    }
    return 0;
  }
  if (!*((void *)this + 6))
  {
    uint64_t v39 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "writeLogHeader";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 264;
      long long v40 = v39;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "writeLogHeader";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 264;
      long long v40 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v40, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_51:
    if (glog_fd)
    {
      *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v56 = v42;
      long long v57 = v42;
      long long v54 = v42;
      long long v55 = v42;
      long long v52 = v42;
      long long v53 = v42;
      *(_OWORD *)buf = v42;
      *(_OWORD *)&uint8_t buf[16] = v42;
      memset(&v44, 0, sizeof(v44));
      time_t v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Invalid argument @'%s':%06u");
    }
    return 0;
  }
  int v4 = *(_DWORD *)(a2 + 28);
  uint64_t v5 = *((void *)this + 7);
  if (v5)
  {
    uint64_t v6 = *((unsigned int *)this + 8);
    if (v6)
    {
      uint64_t v7 = 0;
      while (*(_DWORD *)(v5 + 4 * v7) != v4)
      {
        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
      goto LABEL_16;
    }
  }
LABEL_8:
  if (!CCPcapngFormatter::searchStreamIdInRegistry(this, v4))
  {
    LODWORD(v7) = 0;
LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = (*(uint64_t (**)(CCPcapngFormatter *))(*(void *)this + 64))(this);
  uint64_t v9 = (*(uint64_t (**)(CCPcapngFormatter *))(*(void *)this + 56))(this) + v8;
  uint64_t v10 = *((void *)this + 7);
  if (v10 && (uint64_t v11 = *((unsigned int *)this + 8), v11))
  {
    uint64_t v7 = 0;
    while (*(_DWORD *)(v10 + 4 * v7) != *(_DWORD *)(a2 + 28))
    {
      if (v11 == ++v7) {
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    LODWORD(v7) = 0;
  }
LABEL_17:
  int v12 = *(unsigned __int16 *)(a2 + 24) + *(unsigned __int8 *)(a2 + 26) + 32;
  int v13 = *(unsigned __int16 *)(a2 + 32);
  uint64_t v14 = v7;
  CFDataRef v15 = *(const __CFData **)(*((void *)this + 6) + 8 * v7);
  if (v15)
  {
    v12 += CFDataGetLength(v15);
    v13 += CFDataGetLength(*(CFDataRef *)(*((void *)this + 6) + 8 * v7));
  }
  uint64_t v16 = *(void *)(a2 + 16) + 1000000 * *(void *)(a2 + 8);
  LODWORD(v45) = 6;
  HIDWORD(v45) = v12;
  int v46 = v7;
  int v47 = HIDWORD(v16);
  int v48 = v16;
  int v49 = v13;
  int v50 = *(unsigned __int16 *)(a2 + 34);
  uint64_t v17 = (*(uint64_t (**)(CCPcapngFormatter *, time_t *, uint64_t))(*(void *)this + 112))(this, &v45, 28);
  if (v17 != 28)
  {
    uint64_t v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v17;
      uint64_t v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v17;
      uint64_t v19 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v19, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader Failed to write. %ld\n", buf, 0xCu);
LABEL_24:
    if (glog_fd)
    {
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v56 = v20;
      long long v57 = v20;
      long long v54 = v20;
      long long v55 = v20;
      long long v52 = v20;
      long long v53 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&uint8_t buf[16] = v20;
      memset(&v44, 0, sizeof(v44));
      time_t v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogHeader Failed to write. %ld\n", v17);
    }
  }
  uint64_t v21 = v17 + v9;
  CFDataRef v22 = *(const __CFData **)(*((void *)this + 6) + 8 * v14);
  if (v22)
  {
    CFIndex Length = CFDataGetLength(v22);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*((void *)this + 6) + 8 * v14));
    uint64_t v25 = (*(uint64_t (**)(CCPcapngFormatter *, const UInt8 *, void))(*(void *)this + 112))(this, BytePtr, (unsigned __int16)Length);
    if (v25 == Length)
    {
LABEL_34:
      v21 += v25;
      return v21;
    }
    uint64_t v26 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      uint64_t v27 = __error();
      uint64_t v28 = strerror(*v27);
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v28;
      long long v29 = v26;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      long long v35 = __error();
      time_t v36 = strerror(*v35);
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v36;
      long long v29 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader fStreamHeaderArray failed to write length %ld. %s\n", buf, 0x16u);
LABEL_32:
    if (glog_fd)
    {
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v56 = v30;
      long long v57 = v30;
      long long v54 = v30;
      long long v55 = v30;
      long long v52 = v30;
      long long v53 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&uint8_t buf[16] = v30;
      memset(&v44, 0, sizeof(v44));
      time_t v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      int v31 = glog_fd;
      uint64_t v32 = __error();
      uint64_t v33 = strerror(*v32);
      dprintf(v31, "CCPcapngFormatter::writeLogHeader fStreamHeaderArray failed to write length %ld. %s\n", v25, v33);
    }
    goto LABEL_34;
  }
  return v21;
}

uint64_t CCPcapngFormatter::writeLogFooter(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      uint64_t v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      uint64_t v14 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v14, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogFooter logMetaData is NULL\n", buf, 2u);
LABEL_21:
    if (glog_fd)
    {
      *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v17;
      long long v27 = v17;
      long long v24 = v17;
      long long v25 = v17;
      long long v22 = v17;
      long long v23 = v17;
      *(_OWORD *)buf = v17;
      *(_OWORD *)&uint8_t buf[16] = v17;
      memset(&v20, 0, sizeof(v20));
      time_t v19 = 0xAAAAAAAAAAAAAAAALL;
      time(&v19);
      localtime_r(&v19, &v20);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogFooter logMetaData is NULL\n");
    }
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (!v3)
  {
    uint64_t v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "writeLogFooter";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 352;
      uint64_t v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "writeLogFooter";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 352;
      uint64_t v16 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_24:
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v18;
      long long v27 = v18;
      long long v24 = v18;
      long long v25 = v18;
      long long v22 = v18;
      long long v23 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&uint8_t buf[16] = v18;
      memset(&v20, 0, sizeof(v20));
      time_t v19 = 0xAAAAAAAAAAAAAAAALL;
      time(&v19);
      localtime_r(&v19, &v20);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Invalid argument @'%s':%06u");
    }
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = 0;
      while (*(_DWORD *)(v5 + 4 * v7) != *(_DWORD *)(a2 + 28))
      {
        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
      uint64_t v5 = v7;
    }
    else
    {
LABEL_8:
      uint64_t v5 = 0;
    }
  }
  *(_DWORD *)buf = 0;
  unsigned int v8 = *(unsigned __int8 *)(a2 + 26);
  int v9 = *(unsigned __int16 *)(a2 + 24) + v8 + 32;
  v20.int tm_sec = v9;
  CFDataRef v10 = *(const __CFData **)(v3 + 8 * v5);
  if (v10)
  {
    v20.int tm_sec = v9 + CFDataGetLength(v10);
    unsigned int v8 = *(unsigned __int8 *)(a2 + 26);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, unsigned char *, void))(*(void *)a1 + 112))(a1, buf, v8);
  return (*(uint64_t (**)(uint64_t, tm *, uint64_t))(*(void *)a1 + 112))(a1, &v20, 4) + v11;
}

BOOL CCPcapngFormatter::searchStreamIdInRegistry(CCPcapngFormatter *this, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  io_iterator_t iterator = -1431655766;
  MEMORY[0x210507440](*((unsigned int *)this + 3), "IOService", &iterator);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    io_registry_entry_t v4 = IOIteratorNext(iterator);
    io_registry_entry_t v5 = v4;
    if (!v4) {
      break;
    }
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, @"Id", v3, 0);
    if (CFProperty)
    {
      CFNumberRef v7 = CFProperty;
      int v9 = -1431655766;
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &v9);
      if (v9 == a2)
      {
        CFRelease(v7);
        break;
      }
      CFRelease(v7);
    }
  }
  IOObjectRelease(iterator);
  return v5 != 0;
}

uint64_t CCPcapngFormatter::buildStreamToInterfaceTable(CCPcapngFormatter *this)
{
  io_registry_entry_t v1 = this;
  uint64_t v96 = *MEMORY[0x263EF8340];
  CCPcapngFormatter::freeInterfaceTables(this);
  io_iterator_t iterator = -1431655766;
  MEMORY[0x210507440](*((unsigned int *)v1 + 3), "IOService", &iterator);
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)v1 + 3), @"Name", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  int v4 = 0;
  CFArrayRef v69 = v1;
  while (1)
  {
    io_registry_entry_t v5 = IOIteratorNext(iterator);
    if (!v5) {
      break;
    }
    CFStringRef v6 = (const __CFString *)IORegistryEntryCreateCFProperty(v5, @"Name", v2, 0);
    if (v6)
    {
      CFStringRef v7 = v6;
      uint64_t v8 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        CStringPtr = CFStringGetCStringPtr(v7, 0);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = CStringPtr;
        CFDataRef v10 = v8;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        uint64_t v11 = CFStringGetCStringPtr(v7, 0);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v11;
        CFDataRef v10 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v10, OS_LOG_TYPE_DEFAULT, "Stream Name is %s\n", (uint8_t *)&buf, 0xCu);
LABEL_12:
      if (glog_fd)
      {
        *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v86 = v12;
        long long v87 = v12;
        long long v84 = v12;
        long long v85 = v12;
        long long v82 = v12;
        long long v83 = v12;
        long long buf = v12;
        long long v81 = v12;
        memset(v75, 0, 56);
        *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v73.tm_sec);
        localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
        strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
        dprintf(glog_fd, "%s ", (const char *)&buf);
        int v13 = glog_fd;
        uint64_t v14 = CFStringGetCStringPtr(v7, 0);
        dprintf(v13, "Stream Name is %s\n", v14);
      }
      ++v4;
      CFRelease(v7);
      io_registry_entry_t v1 = v69;
    }
  }
  *((_DWORD *)v1 + 8) = v4 + 1;
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v4;
      uint64_t v16 = v15;
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v4;
    uint64_t v16 = &_os_log_internal;
LABEL_20:
    _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "CCPcapngFormatter::buildStreamToInterfaceTable numberofStreams : %d\n", (uint8_t *)&buf, 8u);
  }
  if (glog_fd)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v86 = v17;
    long long v87 = v17;
    long long v84 = v17;
    long long v85 = v17;
    long long v82 = v17;
    long long v83 = v17;
    long long buf = v17;
    long long v81 = v17;
    memset(v75, 0, 56);
    *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v73.tm_sec);
    localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
    strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
    dprintf(glog_fd, "%s ", (const char *)&buf);
    dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable numberofStreams : %d\n", *((_DWORD *)v1 + 8) - 1);
  }
  long long v18 = malloc_type_calloc(*((unsigned int *)v1 + 8), 8uLL, 0x2004093837F09uLL);
  *((void *)v1 + 5) = v18;
  if (!v18)
  {
    uint64_t v53 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_101;
      }
      LOWORD(buf) = 0;
      long long v54 = v53;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_101;
      }
      LOWORD(buf) = 0;
      long long v54 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v54, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream name memory\n", (uint8_t *)&buf, 2u);
LABEL_101:
    if (glog_fd)
    {
      *(void *)&long long v61 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v86 = v61;
      long long v87 = v61;
      long long v84 = v61;
      long long v85 = v61;
      long long v82 = v61;
      long long v83 = v61;
      long long buf = v61;
      long long v81 = v61;
      memset(v75, 0, 56);
      *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream name memory\n");
    }
    goto LABEL_112;
  }
  time_t v19 = malloc_type_calloc(*((unsigned int *)v1 + 8), 4uLL, 0x100004052888210uLL);
  *((void *)v1 + 7) = v19;
  if (!v19)
  {
    uint64_t v55 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_104;
      }
      LOWORD(buf) = 0;
      long long v56 = v55;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_104;
      }
      LOWORD(buf) = 0;
      long long v56 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v56, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate Interface ID memory\n", (uint8_t *)&buf, 2u);
LABEL_104:
    if (glog_fd)
    {
      *(void *)&long long v62 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v86 = v62;
      long long v87 = v62;
      long long v84 = v62;
      long long v85 = v62;
      long long v82 = v62;
      long long v83 = v62;
      long long buf = v62;
      long long v81 = v62;
      memset(v75, 0, 56);
      *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate Interface ID memory\n");
    }
    goto LABEL_112;
  }
  tm v20 = malloc_type_calloc(*((unsigned int *)v1 + 8), 8uLL, 0x6004044C4A2DFuLL);
  *((void *)v1 + 6) = v20;
  if (!v20)
  {
    uint64_t v57 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_107;
      }
      LOWORD(buf) = 0;
      uint64_t v58 = v57;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_107;
      }
      LOWORD(buf) = 0;
      uint64_t v58 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v58, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream header memory\n", (uint8_t *)&buf, 2u);
LABEL_107:
    if (glog_fd)
    {
      *(void *)&long long v63 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v63 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v86 = v63;
      long long v87 = v63;
      long long v84 = v63;
      long long v85 = v63;
      long long v82 = v63;
      long long v83 = v63;
      long long buf = v63;
      long long v81 = v63;
      memset(v75, 0, 56);
      *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream header memory\n");
    }
    goto LABEL_112;
  }
  uint64_t v21 = malloc_type_calloc(*((unsigned int *)v1 + 8), 2uLL, 0x1000040BDFB0063uLL);
  *((void *)v1 + 8) = v21;
  if (v21)
  {
    **((_DWORD **)v1 + 7) = 0;
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v94 = v22;
    long long v95 = v22;
    long long v92 = v22;
    long long v93 = v22;
    long long v90 = v22;
    long long v91 = v22;
    long long v88 = v22;
    long long v89 = v22;
    long long v86 = v22;
    long long v87 = v22;
    long long v84 = v22;
    long long v85 = v22;
    long long v82 = v22;
    long long v83 = v22;
    long long buf = v22;
    long long v81 = v22;
    if (CFStringGetCString(@"unknown", (char *)&buf, 256, 0))
    {
      **((void **)v1 + 5) = CFStringCreateWithCString(v2, (const char *)&buf, 0);
      goto LABEL_35;
    }
    uint64_t v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFTypeID v75 = 0;
        long long v24 = v23;
        goto LABEL_87;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFTypeID v75 = 0;
      long long v24 = &_os_log_internal;
LABEL_87:
      _os_log_error_impl(&dword_209928000, v24, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n", v75, 2u);
    }
    if (glog_fd)
    {
      *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v78 = v25;
      long long v79 = v25;
      long long v76 = v25;
      long long v77 = v25;
      *(_OWORD *)&v75[32] = v25;
      *(_OWORD *)&v75[48] = v25;
      *(_OWORD *)CFTypeID v75 = v25;
      *(_OWORD *)&v75[16] = v25;
      memset(&v73, 0, sizeof(v73));
      time_t v72 = 0xAAAAAAAAAAAAAAAALL;
      time(&v72);
      localtime_r(&v72, &v73);
      strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
      dprintf(glog_fd, "%s ", v75);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n");
    }
LABEL_35:
    **((void **)v1 + 6) = 0;
    IOObjectRelease(iterator);
    MEMORY[0x210507440](*((unsigned int *)v1 + 3), "IOService", &iterator);
    unint64_t v70 = 1;
    while (2)
    {
      while (2)
      {
        io_registry_entry_t v26 = IOIteratorNext(iterator);
        if (!v26)
        {
          IOObjectRelease(iterator);
          return 1;
        }
        io_registry_entry_t v27 = v26;
        CFStringRef v28 = (const __CFString *)IORegistryEntryCreateCFProperty(v26, @"Name", v2, 0);
        if (!v28)
        {
          uint64_t v29 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              long long v30 = v29;
              goto LABEL_47;
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            long long v30 = &_os_log_internal;
LABEL_47:
            _os_log_error_impl(&dword_209928000, v30, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable MISSING STREAM NAME\n", (uint8_t *)&buf, 2u);
          }
          if (glog_fd)
          {
            *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v86 = v31;
            long long v87 = v31;
            long long v84 = v31;
            long long v85 = v31;
            long long v82 = v31;
            long long v83 = v31;
            long long buf = v31;
            long long v81 = v31;
            memset(v75, 0, 56);
            *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&v73.tm_sec);
            localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
            strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
            dprintf(glog_fd, "%s ", (const char *)&buf);
            dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable MISSING STREAM NAME\n");
          }
          continue;
        }
        break;
      }
      CFStringRef v32 = v28;
      CFNumberRef v33 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v27, @"Id", v2, 0);
      CFNumberRef v34 = v33;
      int valuePtr = 0;
      if (v33)
      {
        CFNumberGetValue(v33, kCFNumberSInt32Type, &valuePtr);
        goto LABEL_54;
      }
      uint64_t v35 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          time_t v36 = v35;
          goto LABEL_79;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        time_t v36 = &_os_log_internal;
LABEL_79:
        _os_log_error_impl(&dword_209928000, v36, OS_LOG_TYPE_ERROR, "CCPcapngFormatter:: failed to get stream id\n", (uint8_t *)&buf, 2u);
      }
      io_registry_entry_t v1 = v69;
      if (glog_fd)
      {
        *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v86 = v37;
        long long v87 = v37;
        long long v84 = v37;
        long long v85 = v37;
        long long v82 = v37;
        long long v83 = v37;
        long long buf = v37;
        long long v81 = v37;
        memset(v75, 0, 56);
        *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v73.tm_sec);
        localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
        strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
        dprintf(glog_fd, "%s ", (const char *)&buf);
        dprintf(glog_fd, "CCPcapngFormatter:: failed to get stream id\n");
      }
LABEL_54:
      unint64_t v38 = v70;
      if (v70 < *((unsigned int *)v1 + 8))
      {
        *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v94 = v39;
        long long v95 = v39;
        long long v92 = v39;
        long long v93 = v39;
        long long v90 = v39;
        long long v91 = v39;
        long long v88 = v39;
        long long v89 = v39;
        long long v86 = v39;
        long long v87 = v39;
        long long v84 = v39;
        long long v85 = v39;
        long long v82 = v39;
        long long v83 = v39;
        long long buf = v39;
        long long v81 = v39;
        if (CFStringGetCString(v32, (char *)&buf, 256, 0))
        {
          CFStringRef v40 = CFStringCreateWithCString(v2, (const char *)&buf, 0);
          unint64_t v41 = v70;
          *(void *)(*((void *)v1 + 5) + 8 * v70) = v40;
          goto LABEL_63;
        }
        uint64_t v42 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CFTypeID v75 = 0;
            time_t v43 = v42;
            goto LABEL_83;
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CFTypeID v75 = 0;
          time_t v43 = &_os_log_internal;
LABEL_83:
          _os_log_error_impl(&dword_209928000, v43, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n", v75, 2u);
        }
        io_registry_entry_t v1 = v69;
        unint64_t v41 = v70;
        if (glog_fd)
        {
          *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v78 = v44;
          long long v79 = v44;
          long long v76 = v44;
          long long v77 = v44;
          *(_OWORD *)&v75[32] = v44;
          *(_OWORD *)&v75[48] = v44;
          *(_OWORD *)CFTypeID v75 = v44;
          *(_OWORD *)&v75[16] = v44;
          memset(&v73, 0, sizeof(v73));
          time_t v72 = 0xAAAAAAAAAAAAAAAALL;
          time(&v72);
          localtime_r(&v72, &v73);
          strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
          dprintf(glog_fd, "%s ", v75);
          dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n");
          unint64_t v41 = v70;
        }
LABEL_63:
        *(_DWORD *)(*((void *)v1 + 7) + 4 * v41) = valuePtr;
        CFDataRef v45 = (const __CFData *)IORegistryEntryCreateCFProperty(v27, @"StreamHeader", v2, 0);
        CFDataRef v46 = v45;
        CFNumberRef v68 = v34;
        if (v45 && (CFDataGetLength(v45) & 7) != 0)
        {
          uint64_t v47 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)CFTypeID v75 = 0;
              int v48 = v47;
              goto LABEL_81;
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CFTypeID v75 = 0;
            int v48 = &_os_log_internal;
LABEL_81:
            _os_log_error_impl(&dword_209928000, v48, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable: stream specific header not aligned to 64 bits. Dropping.", v75, 2u);
          }
          if (glog_fd)
          {
            *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v78 = v49;
            long long v79 = v49;
            long long v76 = v49;
            long long v77 = v49;
            *(_OWORD *)&v75[32] = v49;
            *(_OWORD *)&v75[48] = v49;
            *(_OWORD *)CFTypeID v75 = v49;
            *(_OWORD *)&v75[16] = v49;
            memset(&v73, 0, sizeof(v73));
            time_t v72 = 0xAAAAAAAAAAAAAAAALL;
            time(&v72);
            localtime_r(&v72, &v73);
            strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
            dprintf(glog_fd, "%s ", v75);
            dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable: stream specific header not aligned to 64 bits. Dropping.");
          }
          CFRelease(v46);
          CFDataRef v46 = 0;
        }
        *(void *)(*((void *)v69 + 6) + 8 * v70) = v46;
        io_registry_entry_t v1 = v69;
        CFNumberRef v50 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v27, @"MiscInfo", v2, 0);
        if (v50)
        {
          CFNumberRef v51 = v50;
          CFNumberGetValue(v50, kCFNumberSInt32Type, v75);
          *(_WORD *)(*((void *)v69 + 8) + 2 * v70) = *(_WORD *)v75;
          CFRelease(v51);
        }
        unint64_t v38 = v70 + 1;
        CFNumberRef v34 = v68;
      }
      unint64_t v70 = v38;
      if (v34) {
        CFRelease(v34);
      }
      CFRelease(v32);
      continue;
    }
  }
  uint64_t v59 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      long long v60 = v59;
      goto LABEL_127;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    long long v60 = &_os_log_internal;
LABEL_127:
    _os_log_error_impl(&dword_209928000, v60, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate dlt memory\n", (uint8_t *)&buf, 2u);
  }
  if (glog_fd)
  {
    *(void *)&long long v64 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v86 = v64;
    long long v87 = v64;
    long long v84 = v64;
    long long v85 = v64;
    long long v82 = v64;
    long long v83 = v64;
    long long buf = v64;
    long long v81 = v64;
    memset(v75, 0, 56);
    *(void *)&v73.int tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v73.tm_sec);
    localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
    strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
    dprintf(glog_fd, "%s ", (const char *)&buf);
    dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate dlt memory\n");
  }
LABEL_112:
  long long v65 = (void *)*((void *)v1 + 5);
  if (v65)
  {
    free(v65);
    *((void *)v1 + 5) = 0;
  }
  int v66 = (void *)*((void *)v1 + 7);
  if (v66)
  {
    free(v66);
    *((void *)v1 + 7) = 0;
  }
  CFTypeID v67 = (void *)*((void *)v1 + 6);
  if (v67)
  {
    free(v67);
    *((void *)v1 + 6) = 0;
  }
  uint64_t result = *((void *)v1 + 8);
  if (result)
  {
    free((void *)result);
    uint64_t result = 0;
    *((void *)v1 + 8) = 0;
  }
  return result;
}

void CCPcapngFormatter::freeInterfaceTables(CCPcapngFormatter *this)
{
  CCPcapngFormatter::freeStreamNameArray(this);
  CFAllocatorRef v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    free(v2);
    *((void *)this + 7) = 0;
  }
  CFAllocatorRef v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    unint64_t v4 = *((unsigned int *)this + 8);
    if (!v4) {
      goto LABEL_10;
    }
    for (unint64_t i = 0; i < v4; ++i)
    {
      CFStringRef v6 = *(const void **)(*((void *)this + 6) + 8 * i);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(*((void *)this + 6) + 8 * i) = 0;
        unint64_t v4 = *((unsigned int *)this + 8);
      }
    }
    CFAllocatorRef v3 = (void *)*((void *)this + 6);
    if (v3)
    {
LABEL_10:
      free(v3);
      *((void *)this + 6) = 0;
    }
  }
  CFStringRef v7 = (void *)*((void *)this + 8);
  if (v7)
  {
    free(v7);
    *((void *)this + 8) = 0;
  }
}

void CCPcapngFormatter::freeStreamNameArray(CCPcapngFormatter *this)
{
  CFAllocatorRef v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    unint64_t v3 = *((unsigned int *)this + 8);
    if (!v3) {
      goto LABEL_8;
    }
    for (unint64_t i = 0; i < v3; *(void *)(v5 + 8 * i++) = 0)
    {
      uint64_t v5 = *((void *)this + 5);
      CFStringRef v6 = *(const void **)(v5 + 8 * i);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(*((void *)this + 5) + 8 * i) = 0;
        uint64_t v5 = *((void *)this + 5);
        unint64_t v3 = *((unsigned int *)this + 8);
      }
    }
    CFAllocatorRef v2 = (void *)*((void *)this + 5);
    if (v2)
    {
LABEL_8:
      free(v2);
      *((void *)this + 5) = 0;
    }
  }
}

char *CCPcapngFormatter::withRegistryEntry(CCPcapngFormatter *this)
{
  io_object_t v1 = this;
  CFAllocatorRef v2 = (char *)malloc_type_malloc(0x48uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(void *)CFAllocatorRef v2 = &unk_26BD72200;
  *((void *)v2 + 5) = 0;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCPcapngFormatter::writeLogPayload(CCPcapngFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCPcapngFormatter *, const char *))(*(void *)this + 112))(this, a2);
}

uint64_t CCPcapngFormatter::streamId2InterfaceId(CCPcapngFormatter *this, int a2, unsigned int *a3)
{
  *a3 = 0;
  uint64_t v3 = *((void *)this + 7);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *((unsigned int *)this + 8);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = 0;
  while (*(_DWORD *)(v3 + 4 * v5) != a2)
  {
    if (v4 == ++v5) {
      return 0;
    }
  }
  *a3 = v5;
  return 1;
}

uint64_t CCXPCService::startXPCService(CCXPCService *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = dispatch_queue_create("com.apple.corecaptured", 0);
  *((void *)this + 5) = v2;
  mach_service = xpc_connection_create_mach_service("com.apple.corecaptured", v2, 1uLL);
  *((void *)this + 4) = mach_service;
  if (mach_service)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___ZN12CCXPCService15startXPCServiceEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_22;
    handler[4] = this;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(*((xpc_connection_t *)this + 4));
    return 1;
  }
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCXPCService::startXPCService() Failed to start XPC service \n", buf, 2u);
LABEL_9:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v6;
    long long v18 = v6;
    long long v15 = v6;
    long long v16 = v6;
    long long v13 = v6;
    long long v14 = v6;
    *(_OWORD *)long long buf = v6;
    long long v12 = v6;
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCXPCService::startXPCService() Failed to start XPC service \n");
  }
  return 1;
}

void CCXPCService::handleConnectionEvent(dispatch_queue_t *this, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (shutDownPending) {
    return;
  }
  uint64_t v4 = MEMORY[0x210507D60](a2);
  if (v4 != MEMORY[0x263EF86F0])
  {
    uint64_t v5 = (const _xpc_type_s *)v4;
    if (v4 != MEMORY[0x263EF8720])
    {
      uint64_t v6 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)&buf[4] = _StringForXPCType(v5);
        CFStringRef v7 = v6;
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)&buf[4] = _StringForXPCType(v5);
        CFStringRef v7 = &_os_log_internal;
      }
      _os_log_impl(&dword_209928000, v7, OS_LOG_TYPE_DEFAULT, "Unexpected event type %s\n", buf, 0xCu);
LABEL_17:
      if (glog_fd)
      {
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v26 = v13;
        long long v27 = v13;
        long long v24 = v13;
        long long v25 = v13;
        long long v22 = v13;
        long long v23 = v13;
        long long v21 = v13;
        *(_OWORD *)long long buf = v13;
        memset(&v19, 0, sizeof(v19));
        time_t v18 = 0xAAAAAAAAAAAAAAAALL;
        time(&v18);
        localtime_r(&v18, &v19);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
        dprintf(glog_fd, "%s ", (const char *)buf);
        int v14 = glog_fd;
        _StringForXPCType(v5);
        dprintf(v14, "Unexpected event type %s\n");
      }
      return;
    }
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    uint64_t v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = string;
      long long v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = string;
      long long v12 = &_os_log_internal;
    }
    _os_log_impl(&dword_209928000, v12, OS_LOG_TYPE_DEFAULT, "Got an XPC error: %s\n", buf, 0xCu);
LABEL_28:
    if (glog_fd)
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v16;
      long long v27 = v16;
      long long v24 = v16;
      long long v25 = v16;
      long long v22 = v16;
      long long v23 = v16;
      long long v21 = v16;
      *(_OWORD *)long long buf = v16;
      memset(&v19, 0, sizeof(v19));
      time_t v18 = 0xAAAAAAAAAAAAAAAALL;
      time(&v18);
      localtime_r(&v18, &v19);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "Got an XPC error: %s\n");
    }
    return;
  }
  uint64_t v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      tm v9 = v8;
LABEL_21:
      _os_log_impl(&dword_209928000, v9, OS_LOG_TYPE_DEFAULT, "Received a connection event\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    tm v9 = &_os_log_internal;
    goto LABEL_21;
  }
  if (glog_fd)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v15;
    long long v27 = v15;
    long long v24 = v15;
    long long v25 = v15;
    long long v22 = v15;
    long long v23 = v15;
    long long v21 = v15;
    *(_OWORD *)long long buf = v15;
    memset(&v19, 0, sizeof(v19));
    time_t v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "Received a connection event\n");
  }
  xpc_retain(a2);
  xpc_connection_set_target_queue((xpc_connection_t)a2, this[5]);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN12CCXPCService21handleConnectionEventEPv_block_invoke;
  handler[3] = &__block_descriptor_tmp_18;
  handler[4] = this;
  void handler[5] = a2;
  xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
  xpc_connection_resume((xpc_connection_t)a2);
}

void ___ZN12CCXPCService21handleConnectionEventEPv_block_invoke(uint64_t a1, void *a2)
{
}

const char *_StringForXPCType(const _xpc_type_s *a1)
{
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF86F0]) {
    return "XPC_TYPE_CONNECTION";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8758]) {
    return "XPC_TYPE_NULL";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF86E0]) {
    return "XPC_TYPE_BOOL";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8738]) {
    return "XPC_TYPE_INT64";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF87A0]) {
    return "XPC_TYPE_UINT64";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8710]) {
    return "XPC_TYPE_DOUBLE";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8700]) {
    return "XPC_TYPE_DATE";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF86F8]) {
    return "XPC_TYPE_DATA";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8798]) {
    return "XPC_TYPE_STRING";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF87A8]) {
    return "XPC_TYPE_UUID";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8728]) {
    return "XPC_TYPE_FD";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8790]) {
    return "XPC_TYPE_SHMEM";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF86D8]) {
    return "XPC_TYPE_ARRAY";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8708]) {
    return "XPC_TYPE_DICTIONARY";
  }
  if (a1 == (const _xpc_type_s *)MEMORY[0x263EF8720]) {
    return "XPC_TYPE_ERROR";
  }
  return "Unknown type";
}

void CCXPCService::handleIncomingMessage(CCXPCService *this, _xpc_connection_s *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v6 = coreCaptureOsLog;
  uint64_t v7 = MEMORY[0x263EF8720];
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = MEMORY[0x210507D60](a3) == MEMORY[0x263EF86F0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = MEMORY[0x210507D60](a3) == v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&uint8_t buf[16] = MEMORY[0x210507D60](a3) == MEMORY[0x263EF8708];
    uint64_t v8 = v6;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = MEMORY[0x210507D60](a3) == MEMORY[0x263EF86F0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = MEMORY[0x210507D60](a3) == v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&uint8_t buf[16] = MEMORY[0x210507D60](a3) == MEMORY[0x263EF8708];
    uint64_t v8 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage: incoming, incomingConnection, XPC_TYPE_CONNECTION, %d, XPC_TYPE_ERROR, %d, XPC_TYPE_DICTIONARY, %d\n", buf, 0x14u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v9;
    long long v88 = v9;
    *(_OWORD *)&unsigned char buf[64] = v9;
    long long v86 = v9;
    *(_OWORD *)&unsigned char buf[32] = v9;
    *(_OWORD *)&unsigned char buf[48] = v9;
    *(_OWORD *)long long buf = v9;
    *(_OWORD *)&uint8_t buf[16] = v9;
    memset(&v82, 0, sizeof(v82));
    *(void *)v89.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v89);
    localtime_r((const time_t *)&v89, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    int v10 = glog_fd;
    BOOL v11 = MEMORY[0x210507D60](a3) == MEMORY[0x263EF86F0];
    BOOL v12 = MEMORY[0x210507D60](a3) == v7;
    uint64_t v13 = MEMORY[0x210507D60](a3);
    dprintf(v10, "CCXPCService::handleIncomingMessage: incoming, incomingConnection, XPC_TYPE_CONNECTION, %d, XPC_TYPE_ERROR, %d, XPC_TYPE_DICTIONARY, %d\n", v11, v12, v13 == MEMORY[0x263EF8708]);
  }
  if (MEMORY[0x210507D60](a3) == v7)
  {
    uint64_t v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        time_t v18 = v17;
LABEL_34:
        _os_log_impl(&dword_209928000, v18, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage release, incomingConnection\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      time_t v18 = &_os_log_internal;
      goto LABEL_34;
    }
    if (glog_fd)
    {
      *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v32;
      long long v88 = v32;
      *(_OWORD *)&unsigned char buf[64] = v32;
      long long v86 = v32;
      *(_OWORD *)&unsigned char buf[32] = v32;
      *(_OWORD *)&unsigned char buf[48] = v32;
      *(_OWORD *)long long buf = v32;
      *(_OWORD *)&uint8_t buf[16] = v32;
      memset(&v82, 0, sizeof(v82));
      *(void *)v89.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v89);
      localtime_r((const time_t *)&v89, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage release, incomingConnection\n");
    }
    CFNumberRef v33 = &__block_literal_global_1753;
    goto LABEL_54;
  }
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v89.val = v14;
  *(_OWORD *)&v89.val[4] = v14;
  xpc_connection_get_audit_token();
  CFErrorRef error = 0;
  uint64_t v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&buf[4] = v89.val[0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v89.val[7];
    long long v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&buf[4] = v89.val[0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v89.val[7];
    long long v16 = &_os_log_internal;
  }
  _os_log_error_impl(&dword_209928000, v16, OS_LOG_TYPE_ERROR, "Token is [0]: 0x%x... [7]:%x \n", buf, 0xEu);
LABEL_17:
  if (glog_fd)
  {
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v19;
    long long v88 = v19;
    *(_OWORD *)&unsigned char buf[64] = v19;
    long long v86 = v19;
    *(_OWORD *)&unsigned char buf[32] = v19;
    *(_OWORD *)&unsigned char buf[48] = v19;
    *(_OWORD *)long long buf = v19;
    *(_OWORD *)&uint8_t buf[16] = v19;
    memset(&v82, 0, sizeof(v82));
    time_t v81 = 0xAAAAAAAAAAAAAAAALL;
    time(&v81);
    localtime_r(&v81, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Token is [0]: 0x%x... [7]:%x \n", v89.val[0], v89.val[7]);
  }
  CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  audit_token_t token = v89;
  long long v21 = SecTaskCreateWithAuditToken(v20, &token);
  if (!v21)
  {
    uint64_t v28 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v29 = v28;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v29 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v29, OS_LOG_TYPE_ERROR, "Entitlement query did not succeed \n", buf, 2u);
LABEL_39:
    if (glog_fd)
    {
      *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v34;
      long long v88 = v34;
      *(_OWORD *)&unsigned char buf[64] = v34;
      long long v86 = v34;
      *(_OWORD *)&unsigned char buf[32] = v34;
      *(_OWORD *)&unsigned char buf[48] = v34;
      *(_OWORD *)long long buf = v34;
      *(_OWORD *)&uint8_t buf[16] = v34;
      memset(&v82, 0, sizeof(v82));
      time_t v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement query did not succeed \n");
    }
    goto LABEL_53;
  }
  long long v22 = v21;
  CFTypeRef v23 = SecTaskCopyValueForEntitlement(v21, @"com.apple.corecapture.manager-access", &error);
  if (!v23)
  {
    uint64_t v30 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      *(_WORD *)long long buf = 0;
      long long v31 = v30;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      *(_WORD *)long long buf = 0;
      long long v31 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v31, OS_LOG_TYPE_ERROR, "Entitlement is NULL \n", buf, 2u);
LABEL_42:
    if (glog_fd)
    {
      *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v35;
      long long v88 = v35;
      *(_OWORD *)&unsigned char buf[64] = v35;
      long long v86 = v35;
      *(_OWORD *)&unsigned char buf[32] = v35;
      *(_OWORD *)&unsigned char buf[48] = v35;
      *(_OWORD *)long long buf = v35;
      *(_OWORD *)&uint8_t buf[16] = v35;
      memset(&v82, 0, sizeof(v82));
      time_t v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement is NULL \n");
    }
LABEL_44:
    uint64_t v36 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_WORD *)long long buf = 0;
      long long v37 = v36;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_WORD *)long long buf = 0;
      long long v37 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v37, OS_LOG_TYPE_ERROR, "Entitlement couldnt be found \n", buf, 2u);
LABEL_48:
    if (glog_fd)
    {
      *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v38;
      long long v88 = v38;
      *(_OWORD *)&unsigned char buf[64] = v38;
      long long v86 = v38;
      *(_OWORD *)&unsigned char buf[32] = v38;
      *(_OWORD *)&unsigned char buf[48] = v38;
      *(_OWORD *)long long buf = v38;
      *(_OWORD *)&uint8_t buf[16] = v38;
      memset(&v82, 0, sizeof(v82));
      time_t v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement couldnt be found \n");
    }
    if (!v23) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v23)) {
    goto LABEL_44;
  }
  int v25 = CFEqual(v23, (CFTypeRef)*MEMORY[0x263EFFB40]);
  uint64_t v26 = coreCaptureOsLog;
  if (!v25)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      *(_WORD *)long long buf = 0;
      long long v39 = v26;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      *(_WORD *)long long buf = 0;
      long long v39 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v39, OS_LOG_TYPE_ERROR, "Entitlement exists, but check failed. \n", buf, 2u);
LABEL_66:
    if (glog_fd)
    {
      *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v42;
      long long v88 = v42;
      *(_OWORD *)&unsigned char buf[64] = v42;
      long long v86 = v42;
      *(_OWORD *)&unsigned char buf[32] = v42;
      *(_OWORD *)&unsigned char buf[48] = v42;
      *(_OWORD *)long long buf = v42;
      *(_OWORD *)&uint8_t buf[16] = v42;
      memset(&v82, 0, sizeof(v82));
      time_t v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement exists, but check failed. \n");
LABEL_68:
      CFRelease(v23);
      CFRelease(v22);
      unint64_t v41 = 0x2675F7000uLL;
      if (v25) {
        goto LABEL_69;
      }
      goto LABEL_53;
    }
LABEL_51:
    CFRelease(v23);
LABEL_52:
    CFRelease(v22);
LABEL_53:
    CFNumberRef v33 = &__block_literal_global_8;
LABEL_54:
    xpc_connection_set_event_handler(a2, v33);
    xpc_connection_cancel(a2);
    xpc_release(a2);
    return;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_62;
    }
    *(_WORD *)long long buf = 0;
    long long v27 = v26;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_62;
    }
    *(_WORD *)long long buf = 0;
    long long v27 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v27, OS_LOG_TYPE_DEFAULT, "Entitlement exists, and check is successful\n", buf, 2u);
LABEL_62:
  if (glog_fd)
  {
    *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v40;
    long long v88 = v40;
    *(_OWORD *)&unsigned char buf[64] = v40;
    long long v86 = v40;
    *(_OWORD *)&unsigned char buf[32] = v40;
    *(_OWORD *)&unsigned char buf[48] = v40;
    *(_OWORD *)long long buf = v40;
    *(_OWORD *)&uint8_t buf[16] = v40;
    memset(&v82, 0, sizeof(v82));
    time_t v81 = 0xAAAAAAAAAAAAAAAALL;
    time(&v81);
    localtime_r(&v81, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Entitlement exists, and check is successful\n");
    goto LABEL_68;
  }
  CFRelease(v23);
  CFRelease(v22);
  unint64_t v41 = 0x2675F7000;
LABEL_69:
  if (shutDownPending) {
    goto LABEL_72;
  }
  *((unsigned char *)this + 48) = 1;
  if (pthread_mutex_lock((pthread_mutex_t *)((char *)this + 56))) {
    goto LABEL_72;
  }
  if (MEMORY[0x210507D60](a3) != MEMORY[0x263EF8708]) {
    goto LABEL_72;
  }
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  if (!remote_connection) {
    goto LABEL_72;
  }
  long long v44 = remote_connection;
  string = xpc_dictionary_get_string(a3, "CCConfig");
  CFDataRef v46 = *(NSObject **)(v41 + 856);
  if (!string)
  {
    if (v46)
    {
      if (!os_log_type_enabled(*(os_log_t *)(v41 + 856), OS_LOG_TYPE_ERROR)) {
        goto LABEL_125;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = "CCConfig";
      long long v49 = v46;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_125;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = "CCConfig";
      long long v49 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v49, OS_LOG_TYPE_ERROR, "CCXPCService::handleIncomingMessage No %s is received\n", buf, 0xCu);
LABEL_125:
    if (glog_fd)
    {
      *(void *)&long long v77 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v77 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v77;
      long long v88 = v77;
      *(_OWORD *)&unsigned char buf[64] = v77;
      long long v86 = v77;
      *(_OWORD *)&unsigned char buf[32] = v77;
      *(_OWORD *)&unsigned char buf[48] = v77;
      *(_OWORD *)long long buf = v77;
      *(_OWORD *)&uint8_t buf[16] = v77;
      memset(&v82, 0, sizeof(v82));
      *(void *)v89.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v89);
      localtime_r((const time_t *)&v89, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage No %s is received\n", "CCConfig");
    }
    goto LABEL_72;
  }
  uint64_t v47 = string;
  if (v46)
  {
    if (!os_log_type_enabled(*(os_log_t *)(v41 + 856), OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_94;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = v47;
    int v48 = v46;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_94;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = v47;
    int v48 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v48, OS_LOG_TYPE_DEFAULT, "CCConfig is %s\n", buf, 0xCu);
LABEL_94:
  if (glog_fd)
  {
    *(void *)&long long v50 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v50;
    long long v88 = v50;
    *(_OWORD *)&unsigned char buf[64] = v50;
    long long v86 = v50;
    *(_OWORD *)&unsigned char buf[32] = v50;
    *(_OWORD *)&unsigned char buf[48] = v50;
    *(_OWORD *)long long buf = v50;
    *(_OWORD *)&uint8_t buf[16] = v50;
    memset(&v82, 0, sizeof(v82));
    *(void *)v89.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v89);
    localtime_r((const time_t *)&v89, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfig is %s\n", v47);
  }
  size_t v51 = strlen(v47);
  CFDataRef v52 = CFDataCreate(v20, (const UInt8 *)v47, v51);
  *(void *)v89.val = 100;
  CFPropertyListRef v53 = CFPropertyListCreateWithData(v20, v52, 0, (CFPropertyListFormat *)&v89, 0);
  long long v54 = v53;
  if (!v53) {
    goto LABEL_129;
  }
  if (!CFPropertyListIsValid(v53, kCFPropertyListXMLFormat_v1_0)) {
    goto LABEL_129;
  }
  CFTypeID v55 = CFGetTypeID(v54);
  if (v55 != CFDictionaryGetTypeID()) {
    goto LABEL_129;
  }
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)v54);
  uint64_t v57 = *(NSObject **)(v41 + 856);
  if (v57)
  {
    if (os_log_type_enabled(*(os_log_t *)(v41 + 856), OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&buf[4] = Count;
      uint64_t v58 = v57;
LABEL_104:
      _os_log_impl(&dword_209928000, v58, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage keycount : %ld\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&buf[4] = Count;
    uint64_t v58 = &_os_log_internal;
    goto LABEL_104;
  }
  if (glog_fd)
  {
    *(void *)&long long v59 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v59 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v59;
    long long v88 = v59;
    *(_OWORD *)&unsigned char buf[64] = v59;
    long long v86 = v59;
    *(_OWORD *)&unsigned char buf[32] = v59;
    *(_OWORD *)&unsigned char buf[48] = v59;
    *(_OWORD *)long long buf = v59;
    *(_OWORD *)&uint8_t buf[16] = v59;
    memset(&v82, 0, sizeof(v82));
    *(void *)token.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&token);
    localtime_r((const time_t *)&token, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCXPCService::handleIncomingMessage keycount : %ld\n", Count);
  }
  if (!Count) {
    goto LABEL_129;
  }
  CFDataRef v78 = v52;
  CFIndex v79 = Count;
  long long v60 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFTypeID v80 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v54, v60, v80);
  uint64_t v61 = 0;
  while (1)
  {
    long long v62 = v60[v61];
    CFTypeID v63 = CFStringGetTypeID();
    if (!validCFObjectReference("CCXPCService::handleIncomingMessage", v62, v63)) {
      break;
    }
    long long v64 = v80[v61];
    CFTypeID v65 = CFDictionaryGetTypeID();
    if ((validCFObjectReference("CCXPCService::handleIncomingMessage", v64, v65) & 1) == 0) {
      goto LABEL_123;
    }
    CFIndex Length = CFStringGetLength((CFStringRef)v60[v61]);
    CFTypeID v67 = (char *)malloc_type_malloc(Length + 1, 0x580F798EuLL);
    CFStringRef v68 = (const __CFString *)v60[v61];
    CFIndex v69 = CFStringGetLength(v68);
    CFStringGetCString(v68, v67, v69 + 1, 0);
    uint64_t v70 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&buf[4] = v67;
        CFTypeID v71 = v70;
LABEL_116:
        _os_log_impl(&dword_209928000, v71, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage Key is %s\n", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = v67;
      CFTypeID v71 = &_os_log_internal;
      goto LABEL_116;
    }
    long long v72 = 0uLL;
    if (glog_fd)
    {
      *(void *)&long long v73 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v73 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v87 = v73;
      long long v88 = v73;
      *(_OWORD *)&unsigned char buf[64] = v73;
      long long v86 = v73;
      *(_OWORD *)&unsigned char buf[32] = v73;
      *(_OWORD *)&unsigned char buf[48] = v73;
      *(_OWORD *)long long buf = v73;
      *(_OWORD *)&uint8_t buf[16] = v73;
      memset(&v82, 0, sizeof(v82));
      *(void *)token.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&token);
      localtime_r((const time_t *)&token, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage Key is %s\n", v67);
      long long v72 = 0uLL;
    }
    uint64_t v74 = *((void *)this + 2);
    CFTypeID v75 = v80[v61];
    *(void *)&long long v86 = 0xAAAAAAAAAAAAAA01;
    *(void *)long long buf = v74;
    *(_OWORD *)&buf[8] = v72;
    *(_OWORD *)&buf[24] = v72;
    *(_OWORD *)&buf[40] = v72;
    *(_OWORD *)&buf[56] = v72;
    *(void *)&buf[72] = 0;
    CCConfigure::applyConfiguration(v74, v75, buf);
    if (v67) {
      free(v67);
    }
    if (v79 == ++v61)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a3);
      xpc_dictionary_set_string(reply, "rc", "rc.ok");
      xpc_connection_send_message(v44, reply);
      xpc_release(reply);
LABEL_123:
      CFDataRef v52 = v78;
      free(v60);
      goto LABEL_128;
    }
  }
  free(v60);
  CFDataRef v52 = v78;
  if (!v80) {
    goto LABEL_129;
  }
LABEL_128:
  free(v80);
LABEL_129:
  if (v52) {
    CFRelease(v52);
  }
  if (v54) {
    CFRelease(v54);
  }
LABEL_72:
  *((unsigned char *)this + 48) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 56));
}

uint64_t CCXPCService::ccfree(CCXPCService *this)
{
  uint64_t result = CCXPCService::freeResources(this);
  if (this)
  {
    uint64_t v3 = *(uint64_t (**)(CCXPCService *))(*(void *)this + 8);
    return v3(this);
  }
  return result;
}

uint64_t CCXPCService::freeResources(CCXPCService *this)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)((char *)this + 56);
  uint64_t result = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 56));
  if (!result)
  {
    uint64_t v4 = *((void *)this + 2);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 48))(v4);
      *((void *)this + 2) = 0;
    }
    uint64_t v5 = *((void *)this + 3);
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 48))(v5);
      *((void *)this + 3) = 0;
    }
    uint64_t v6 = (_xpc_connection_s *)*((void *)this + 4);
    if (v6)
    {
      xpc_connection_cancel(v6);
      xpc_release(*((xpc_object_t *)this + 4));
    }
    *((void *)this + 4) = 0;
    uint64_t v7 = *((void *)this + 5);
    if (v7) {
      dispatch_release(v7);
    }
    *((void *)this + 5) = 0;
    pthread_mutex_unlock(v2);
    return pthread_mutex_destroy(v2);
  }
  return result;
}

void CCXPCService::CCXPCService(CCXPCService *this)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD722B8;
}

{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = &unk_26BD722B8;
}

char *CCXPCService::withConfigureAndPipeMonitor(CCXPCService *this, CCConfigure *a2, CCPipeMonitor *a3)
{
  uint64_t v5 = (char *)malloc_type_malloc(0x78uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v5 + 12) = 0u;
  *(_OWORD *)(v5 + 28) = 0u;
  *(_OWORD *)(v5 + 44) = 0u;
  *(_OWORD *)(v5 + 60) = 0u;
  *(_OWORD *)(v5 + 76) = 0u;
  *(_OWORD *)(v5 + 92) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *((_DWORD *)v5 + 2) = 1;
  *(void *)uint64_t v5 = &unk_26BD722B8;
  CCXPCService::initWithConfigureAndPipeMonitor((CCXPCService *)v5, this, a2);
  return v5;
}

void CCLogFile::cleanupCapturedFiles(CCLogFile *this)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 28) == 1)
  {
    CFIndex Length = CFStringGetLength(*(CFStringRef *)(*((void *)this + 17) + 8 * *((unsigned int *)this + 36)));
    uint64_t v3 = (char *)malloc_type_malloc(Length + 1, 0xBA03DE5DuLL);
    CFStringRef v4 = *(const __CFString **)(*((void *)this + 17) + 8 * *((unsigned int *)this + 36));
    CFIndex v5 = CFStringGetLength(v4);
    CFStringGetCString(v4, v3, v5 + 1, 0);
    uint64_t v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *((_DWORD *)this + 28);
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)&buf[4] = v7;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v3;
        uint64_t v8 = v6;
LABEL_26:
        _os_log_impl(&dword_209928000, v8, OS_LOG_TYPE_DEFAULT, "CCLogFile::cleanupCapturedFiles log type is %d, current file is %s\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *((_DWORD *)this + 28);
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)&buf[4] = v23;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v3;
      uint64_t v8 = &_os_log_internal;
      goto LABEL_26;
    }
    if (glog_fd)
    {
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v32 = v24;
      long long v33 = v24;
      long long v30 = v24;
      long long v31 = v24;
      long long v28 = v24;
      long long v29 = v24;
      *(_OWORD *)long long buf = v24;
      *(_OWORD *)&uint8_t buf[16] = v24;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::cleanupCapturedFiles log type is %d, current file is %s\n", *((_DWORD *)this + 28), v3);
    }
    if (v3) {
      free(v3);
    }
    return;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  unint64_t v9 = *((unsigned int *)this + 30);
  if (v9)
  {
    uint64_t v10 = 0;
    while (1)
    {
      if (v10 != *((_DWORD *)this + 36))
      {
        uint64_t v11 = *((void *)this + 17);
        if (v11)
        {
          CFStringRef v12 = *(const __CFString **)(v11 + 8 * v10);
          if (v12) {
            break;
          }
        }
      }
LABEL_19:
      if (++v10 >= v9) {
        goto LABEL_20;
      }
    }
    uint64_t v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      long long v14 = (CCLogFile *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        CStringPtr = CFStringGetCStringPtr(v12, 0);
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)&buf[4] = v10;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = CStringPtr;
        long long v16 = v13;
LABEL_15:
        _os_log_impl(&dword_209928000, v16, OS_LOG_TYPE_DEFAULT, "CCLogFile::cleanupCapturedFiles() deleting file[%u]: %s\n", buf, 0x12u);
      }
    }
    else
    {
      long long v14 = (CCLogFile *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        uint64_t v17 = CFStringGetCStringPtr(v12, 0);
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)&buf[4] = v10;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v17;
        long long v16 = &_os_log_internal;
        goto LABEL_15;
      }
    }
    if (glog_fd)
    {
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v32 = v18;
      long long v33 = v18;
      long long v30 = v18;
      long long v31 = v18;
      long long v28 = v18;
      long long v29 = v18;
      *(_OWORD *)long long buf = v18;
      *(_OWORD *)&uint8_t buf[16] = v18;
      memset(&v26, 0, sizeof(v26));
      time_t v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", buf);
      int v19 = glog_fd;
      CFAllocatorRef v20 = CFStringGetCStringPtr(*(CFStringRef *)(*((void *)this + 17) + 8 * v10), 0);
      long long v14 = (CCLogFile *)dprintf(v19, "CCLogFile::cleanupCapturedFiles() deleting file[%u]: %s\n", v10, v20);
    }
    CCLogFile::deleteFile(v14, *(__CFString **)(*((void *)this + 17) + 8 * v10));
    *(void *)(*((void *)this + 17) + 8 * v10) = 0;
    unint64_t v9 = *((unsigned int *)this + 30);
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v21 = *((unsigned int *)this + 36);
  if (v21)
  {
    long long v22 = (void *)*((void *)this + 17);
    if (v22)
    {
      *long long v22 = v22[v21];
      *(void *)(*((void *)this + 17) + 8 * v21) = 0;
      *((_DWORD *)this + 36) = 0;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
}

void CCLogFile::freeFilePathArray(CCLogFile *this)
{
  CFAllocatorRef v2 = (CCLogFile *)*((void *)this + 17);
  if (v2)
  {
    if (!*((_DWORD *)this + 32)) {
      goto LABEL_6;
    }
    unint64_t v3 = 0;
    do
    {
      CCLogFile::deleteFile(v2, *(__CFString **)(*((void *)this + 17) + 8 * v3));
      *(void *)(*((void *)this + 17) + 8 * v3++) = 0;
    }
    while (v3 < *((unsigned int *)this + 32));
    CFAllocatorRef v2 = (CCLogFile *)*((void *)this + 17);
    if (v2)
    {
LABEL_6:
      free(v2);
      *((void *)this + 17) = 0;
    }
  }
}

const __CFString *CCLogFile::sortByFileName(const __CFString *this, int a2)
{
  unsigned int v2 = a2 - 1;
  if (a2 != 1)
  {
    CFStringRef v3 = this;
    unsigned int v4 = 0;
    char v5 = 0;
    do
    {
      while (1)
      {
        uint64_t info = v3[4].info;
        this = *(const __CFString **)(info + 8 * v4);
        uint64_t v7 = v4 + 1;
        if (!this) {
          break;
        }
        CFStringRef v8 = *(const __CFString **)(info + 8 * v7);
        if (!v8) {
          break;
        }
        this = (const __CFString *)CFStringCompare(this, v8, 0);
        if (this != (const __CFString *)1) {
          break;
        }
        uint64_t v9 = v3[4].info;
        uint64_t v10 = *(void *)(v9 + 8 * v4);
        *(void *)(v9 + 8 * v4) = *(void *)(v9 + 8 * v7);
        *(void *)(v3[4].info + 8 * v7) = v10;
        char v5 = v7 < v2;
        if (v7 >= v2) {
          unsigned int v4 = 0;
        }
        else {
          ++v4;
        }
      }
      char v11 = (v7 < v2) | v5;
      if (v7 >= v2) {
        unsigned int v4 = 0;
      }
      else {
        ++v4;
      }
      v5 &= v7 < v2;
    }
    while ((v11 & 1) != 0);
  }
  return this;
}

uint64_t CCLogFile::configureLogOptions(uint64_t a1, const char *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = a2;
    char v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = a2;
    char v5 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v5, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Configuration is %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v38 = v6;
    long long v39 = v6;
    long long v36 = v6;
    long long v37 = v6;
    long long v34 = v6;
    long long v35 = v6;
    *(_OWORD *)long long buf = v6;
    long long v33 = v6;
    memset(&v31, 0, sizeof(v31));
    time_t v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Configuration is %s\n", a2);
  }
  uint64_t v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v8 = *(_DWORD *)(a1 + 112);
    int v9 = *(_DWORD *)(a1 + 116);
    int v10 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = v8;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v10;
    char v11 = v7;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v12 = *(_DWORD *)(a1 + 112);
    int v13 = *(_DWORD *)(a1 + 116);
    int v14 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v14;
    char v11 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v11, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Current Log Type:%d, File Size=%u, Max Number Of Files:%u\n", buf, 0x14u);
LABEL_15:
  if (glog_fd)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v38 = v15;
    long long v39 = v15;
    long long v36 = v15;
    long long v37 = v15;
    long long v34 = v15;
    long long v35 = v15;
    *(_OWORD *)long long buf = v15;
    long long v33 = v15;
    memset(&v31, 0, sizeof(v31));
    time_t v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Current Log Type:%d, File Size=%u, Max Number Of Files:%u\n", *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(_DWORD *)(a1 + 120));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 160));
  time_t v30 = 0;
  strlcpy((char *)(a1 + 224), a2, 0x400uLL);
  long long v16 = strtok_r((char *)(a1 + 224), ",", (char **)&v30);
  if (!strcmp(v16, "S"))
  {
    *(void *)(a1 + 112) = 0xFFFFFFFF00000001;
    int v19 = 1;
  }
  else
  {
    *(_DWORD *)(a1 + 112) = 0;
    uint64_t v17 = strtok_r(0, ",", (char **)&v30);
    if (v17) {
      *(_DWORD *)(a1 + 116) = strtol(v17, 0, 0) << 10;
    }
    long long v18 = strtok_r(0, ",", (char **)&v30);
    if (v18) {
      int v19 = strtol(v18, 0, 0);
    }
    else {
      int v19 = *(_DWORD *)(a1 + 120);
    }
  }
  int v20 = v19 + 1;
  *(_DWORD *)(a1 + pthread_setname_np((const char *)this + 120) = v19 + 1;
  uint64_t v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    int v22 = *(_DWORD *)(a1 + 112);
    int v23 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v23;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v20;
    long long v24 = v21;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    int v25 = *(_DWORD *)(a1 + 112);
    int v26 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = v25;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v26;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v20;
    long long v24 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v24, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Configured Log Type:%d, File Size=%u, Max Number Of Files:%u\n", buf, 0x14u);
LABEL_30:
  if (glog_fd)
  {
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v38 = v27;
    long long v39 = v27;
    long long v36 = v27;
    long long v37 = v27;
    long long v34 = v27;
    long long v35 = v27;
    *(_OWORD *)long long buf = v27;
    long long v33 = v27;
    memset(&v31, 0, sizeof(v31));
    time_t v29 = 0xAAAAAAAAAAAAAAAALL;
    time(&v29);
    localtime_r(&v29, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Configured Log Type:%d, File Size=%u, Max Number Of Files:%u\n", *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(_DWORD *)(a1 + 120));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 160));
  CCLogFile::buildFileTables((CFStringRef *)a1);
  return 0;
}

uint64_t CCLogFile::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5 && (*(unsigned char *)(a1 + 124) & 2) != 0) {
    return 1;
  }
  (*(void (**)(void))(**(void **)(a1 + 16) + 80))(*(void *)(a1 + 16));
  if (!*(unsigned char *)(a1 + 1248)) {
    return 1;
  }

  return CCLogFile::addFile((CCLogFile *)a1);
}

uint64_t CCLogFile::writeLog(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 72))(*(void *)(a1 + 16));
  if (!*(unsigned char *)(a1 + 1248)) {
    return 1;
  }

  return CCLogFile::addFile((CCLogFile *)a1);
}

uint64_t CCLogFile::openFile(CCLogFile *this, const char *a2)
{
  if (*((_DWORD *)this + 28))
  {
    CFStringRef v3 = *(const __CFString **)(*((void *)this + 17) + 8 * *((unsigned int *)this + 36));
    if (v3)
    {
      CFIndex Length = CFStringGetLength(v3);
      char v5 = (char *)malloc_type_malloc(Length + 1, 0xF824E4E7uLL);
      CFStringRef v6 = *(const __CFString **)(*((void *)this + 17) + 8 * *((unsigned int *)this + 36));
      CFIndex v7 = CFStringGetLength(v6);
      CFStringGetCString(v6, v5, v7 + 1, 0);
      int v8 = open(v5, 10);
      *((_DWORD *)this + 9) = v8;
      uint64_t v9 = v8 != -1;
      if (v8 != -1) {
        (*(void (**)(CCLogFile *, void))(*(void *)this + 168))(this, *((unsigned int *)this + 29));
      }
      if (v5) {
        free(v5);
      }
    }
    else
    {
      uint64_t v9 = CCLogFile::addFile(this);
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
    *((_DWORD *)this + 36) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
    return v9;
  }
  else
  {
    return CCLogFile::addFile(this);
  }
}

void CCLogFile::~CCLogFile(void *this)
{
  if (this) {
    free(this);
  }
}

CCLogFile *CCLogFile::withRegistryEntry(CCLogFile *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    CFStringRef v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    CFStringRef v3 = &_os_log_internal;
  }
  _os_log_impl(&dword_209928000, v3, OS_LOG_TYPE_DEFAULT, "CCLogFile::withRegistryEntry()\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v4;
    long long v22 = v4;
    long long v19 = v4;
    long long v20 = v4;
    long long v17 = v4;
    long long v18 = v4;
    *(_OWORD *)long long buf = v4;
    long long v16 = v4;
    memset(&v14, 0, sizeof(v14));
    time_t v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::withRegistryEntry()\n");
  }
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, @"LogType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  char valuePtr = -86;
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  int v6 = valuePtr;
  if (valuePtr >= 2)
  {
    uint64_t v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      int v8 = v7;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      int v8 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_209928000, v8, OS_LOG_TYPE_ERROR, "CCLogFile::withRegistryEntry() Invalid log type %d\n", buf, 8u);
LABEL_18:
    if (glog_fd)
    {
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v10;
      long long v22 = v10;
      long long v19 = v10;
      long long v20 = v10;
      long long v17 = v10;
      long long v18 = v10;
      *(_OWORD *)long long buf = v10;
      long long v16 = v10;
      memset(&v14, 0, sizeof(v14));
      time_t v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCLogFile::withRegistryEntry() Invalid log type %d\n", valuePtr);
    }
    return 0;
  }
  uint64_t v9 = (CCLogFile *)malloc_type_malloc(0x500uLL, 0xEE9A6C17uLL);
  bzero((char *)v9 + 8, 0x4F8uLL);
  *((_DWORD *)v9 + 2) = 1;
  *(void *)uint64_t v9 = &unk_26BD72370;
  if ((CCLogFile::initWithRegistryEntry(v9, this) & 1) == 0)
  {
    (*(void (**)(CCLogFile *))(*(void *)v9 + 48))(v9);
    return 0;
  }
  return v9;
}

BOOL CCLogFile::lock(CCLogFile *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160)) == 0;
}

BOOL CCLogFile::unlock(CCLogFile *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160)) == 0;
}

BOOL CCLogFile::locked(CCLogFile *this)
{
  io_object_t v1 = (pthread_mutex_t *)((char *)this + 160);
  int v2 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 160));
  if (!v2) {
    pthread_mutex_unlock(v1);
  }
  return v2 == 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A8](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

uint64_t CFPreferencesFlushCaches()
{
  return MEMORY[0x270EE4CC8]();
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x270EE4D58](plist, format);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x270EE53B0](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

Boolean CFURLWriteDataAndPropertiesToResource(CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32 *errorCode)
{
  return MEMORY[0x270EE5468](url, dataToWrite, propertiesToWrite, errorCode);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

CFTypeRef IOCFUnserialize(const char *buffer, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3EF8](buffer, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncStructMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F28](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, inputStruct, inputStructCnt, outputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

uint64_t IOReportAddChannelDescription()
{
  return MEMORY[0x270F926F0]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x270F92750]();
}

uint64_t IOReportCreateAggregate()
{
  return MEMORY[0x270F92778]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x270F92780]();
}

uint64_t IOReportCreateSamplesRaw()
{
  return MEMORY[0x270F92790]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x270F92798]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x270F927A0]();
}

uint64_t IOReportMergeChannels()
{
  return MEMORY[0x270F927E0]();
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x270F24B58]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl asctime(const tm *a1)
{
  return (char *)MEMORY[0x270ED8600](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

int creat(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED9148](a1, a2);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x270F9C6D0](file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x270F9C6F0](file, errnum);
}

int gzflush(gzFile file, int flush)
{
  return MEMORY[0x270F9C6F8](file, *(void *)&flush);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x270F9C710](a1, a2);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x270F9C728](file, buf, *(void *)&len);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x270EDA1E8](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}