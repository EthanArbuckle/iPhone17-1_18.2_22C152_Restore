BOOL sub_2C40(id a1, NSURL *a2, NSError *a3)
{
  NSLog(@"failed to read CarPlay logs directory %@: %@", a2, a3);
  return 1;
}

uint64_t sub_2D60(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(a2, "lastPathComponent"), "isEqualToString:", @"CarPlayApp");
  if ((result & 1) == 0)
  {
    if (objc_msgSend(objc_msgSend(a2, "pathExtension"), "isEqualToString:", @"zip"))
    {
      v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      v6 = +[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", [a2 URLByAppendingPathComponent:@"Info.plist"]);
      v7 = [(NSDictionary *)v6 objectForKey:@"CFBundleVersion"];
      if ([(__CFString *)v7 length]) {
        CFStringRef v8 = v7;
      }
      else {
        CFStringRef v8 = @"?";
      }
      id v9 = [(NSDictionary *)v6 objectForKey:@"CFBundleShortVersionString"];
      if ([v9 length]) {
        CFStringRef v10 = +[NSString stringWithFormat:@"(%@)", v9];
      }
      else {
        CFStringRef v10 = &stru_8788;
      }
      id v11 = [(NSDictionary *)v6 objectForKey:@"Disclaimer"];
      if ([v11 length]) {
        CFStringRef v12 = +[NSString stringWithFormat:@"%@", v11];
      }
      else {
        CFStringRef v12 = &stru_8788;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      +[NSString stringWithFormat:@"%@ %@ %@", v8, v10, v12];
      v5 = *(uint64_t (**)(void))(v13 + 16);
    }
    return v5();
  }
  return result;
}

void sub_3160(uint64_t a1)
{
  [*(id *)(a1 + 32) startAccessingSecurityScopedResource];
  id v2 = objc_alloc_init((Class)NSFileCoordinator);
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3052000000;
  v64[3] = sub_3E60;
  v64[4] = sub_3E70;
  uint64_t v65 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_3E7C;
  v63[3] = &unk_83B0;
  v63[4] = &v66;
  v63[5] = v64;
  [v2 coordinateReadingItemAtURL:v3 options:0 writingItemAtURL:v4 options:0 error:&v65 byAccessor:v63];
  if (*((unsigned char *)v67 + 24)) {
    NSLog(@"moved theme asset");
  }
  else {
    NSLog(@"failed to move theme asset");
  }
  v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) _carplayLibraryURL];
  if (!v5) {
    goto LABEL_23;
  }
  v7 = v6;
  if (!v6) {
    goto LABEL_23;
  }
  if (([v5 isFileURL] & 1) == 0)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v75 = v5;
    id v11 = "ADSUnarchiver: unable to open non-file URL %@.";
    uint32_t v12 = 12;
LABEL_47:
    _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, v11, buf, v12);
    goto LABEL_23;
  }
  int v8 = open((const char *)[v5 fileSystemRepresentation], 4);
  if (v8 < 0)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v22 = __error();
    v23 = strerror(*v22);
    *(_DWORD *)buf = 138412546;
    *(void *)v75 = v5;
    *(_WORD *)&v75[8] = 2082;
    *(void *)&v75[10] = v23;
    id v11 = "ADSUnarchiver: unable to open file %@ - %{public}s.";
    uint32_t v12 = 22;
    goto LABEL_47;
  }
  if (!archive_read_new())
  {
LABEL_15:
    int v10 = 0;
    goto LABEL_16;
  }
  if (archive_read_support_format_zip())
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = archive_error_string();
      *(_DWORD *)buf = 136446210;
      *(void *)v75 = v9;
      _os_log_impl(&dword_0, 0, OS_LOG_TYPE_DEFAULT, "ADSUnarchiver: archive_read unable to set supported formats - %{public}s.", buf, 0xCu);
    }
LABEL_12:
    if (archive_read_free() && os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = archive_error_string();
      *(_DWORD *)buf = 136446210;
      *(void *)v75 = v24;
      _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to free archive_read (leaking) - %{public}s.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  int support_filter_all = archive_read_support_filter_all();
  int v14 = support_filter_all;
  if (support_filter_all != -20 && support_filter_all)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = archive_error_string();
      *(_DWORD *)buf = 136446210;
      *(void *)v75 = v27;
      _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: archive_read unable to set supported compression formats - %{public}s.", buf, 0xCu);
    }
    if (v14 != -20 && v14) {
      goto LABEL_12;
    }
  }
  NSPageSize();
  if (!archive_read_open_fd())
  {
    id v73 = 0;
    v15 = +[NSFileManager defaultManager];
    NSFileAttributeKey v76 = NSFilePosixPermissions;
    v77 = &off_8D78;
    if (!-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 0, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1), &v73)&& (!objc_msgSend(objc_msgSend(v73, "domain"), "isEqualToString:", NSCocoaErrorDomain)|| objc_msgSend(v73, "code") != &stru_1F8.sectname[12]))
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v7;
        *(_WORD *)&v75[8] = 2112;
        *(void *)&v75[10] = v73;
        v18 = "ADSUnarchiver: failed to create directory at %@ - %@.";
        uint32_t v19 = 22;
LABEL_91:
        _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, v18, buf, v19);
      }
LABEL_52:
      int v10 = 0;
LABEL_53:
      if (archive_read_close() && os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = archive_error_string();
        *(_DWORD *)buf = 136446210;
        *(void *)v75 = v31;
        _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to close archive_read - %{public}s.", buf, 0xCu);
      }
      goto LABEL_56;
    }
    if (!archive_write_disk_new()) {
      goto LABEL_52;
    }
    if (archive_write_disk_set_standard_lookup())
    {
      if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      uint64_t v16 = archive_error_string();
      *(_DWORD *)buf = 136446210;
      *(void *)v75 = v16;
      v17 = "ADSUnarchiver: archive_write_disk unable to set lookup functions - %{public}s.";
    }
    else
    {
      if (!archive_write_disk_set_options())
      {
        id v28 = [v7 path];
        id v61 = v28;
        if (v28)
        {
          v30 = realpath_DARWIN_EXTSN((const char *)[v28 fileSystemRepresentation], 0);
          if (v30)
          {
            id v61 = [objc_alloc((Class)NSString) initWithUTF8String:v30];
            free(v30);
          }
          else if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
          {
            v58 = __error();
            v59 = strerror(*v58);
            *(_DWORD *)buf = 138412546;
            *(void *)v75 = v61;
            *(_WORD *)&v75[8] = 2080;
            *(void *)&v75[10] = v59;
            _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to resolve physical path for destination path %@ - %s.", buf, 0x16u);
          }
        }
        else
        {
          id v61 = 0;
        }
        *(void *)&long long v29 = 134218240;
        long long v60 = v29;
        do
        {
          do
          {
            uint64_t v70 = 0;
            int next_header = archive_read_next_header();
            if (next_header)
            {
              if (next_header == 1)
              {
                int v10 = 1;
                goto LABEL_103;
              }
              if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
              {
                uint64_t v50 = archive_error_string();
                *(_DWORD *)buf = 136446210;
                *(void *)v75 = v50;
                v45 = "ADSUnarchiver: archive_read_next_header failed - %{public}s.";
LABEL_89:
                _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);
              }
              goto LABEL_102;
            }
            int v33 = archive_entry_filetype();
            uint64_t v35 = archive_entry_pathname_utf8();
            v36 = (const char *)v35;
            if (!v35)
            {
              if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_101;
              }
              *(_WORD *)buf = 0;
              v51 = "ADSUnarchiver: archive_entry with no path encountered.";
              goto LABEL_116;
            }
            uint64_t v37 = 0;
            do
            {
              uint64_t v38 = v37;
              int v39 = *(unsigned __int8 *)(v35 + v37++);
            }
            while (v39 == 47);
            if (v38 && os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
            {
              size_t v43 = strlen(v36);
              *(_DWORD *)buf = v60;
              *(void *)v75 = v38;
              *(_WORD *)&v75[8] = 2048;
              *(void *)&v75[10] = v43;
              _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
            }
            id v40 = [objc_alloc((Class)NSString) initWithUTF8String:&v36[v38]];
            id v41 = [v40 length];
            if (!v41 && v33 != 0x4000)
            {
              if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_101;
              }
              *(_WORD *)buf = 0;
              v51 = "ADSUnarchiver: archive_entry with no path after sanitization encountered.";
LABEL_116:
              _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, v51, buf, 2u);
LABEL_101:
              goto LABEL_102;
            }
            objc_msgSend(objc_msgSend(v61, "stringByAppendingPathComponent:", v40, v60), "fileSystemRepresentation");
            archive_entry_update_pathname_utf8();
            archive_entry_perm();
            archive_entry_set_perm();
          }
          while (!v41);
          if (archive_write_header())
          {
            int v10 = 0;
            if (os_log_type_enabled(0, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v53 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(void *)v75 = v53;
              v54 = "ADSUnarchiver: archive_write_header failed - %{public}s.";
              goto LABEL_114;
            }
            goto LABEL_103;
          }
          if (!archive_entry_size_is_set() || archive_entry_size() >= 1)
          {
            do
            {
              uint64_t v72 = 0;
              id v73 = 0;
              uint64_t v71 = 0;
              int data_block = archive_read_data_block();
              if (data_block)
              {
                if (data_block == 1) {
                  goto LABEL_83;
                }
                if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v44 = archive_error_string();
                  *(_DWORD *)buf = 136446210;
                  *(void *)v75 = v44;
                  v45 = "ADSUnarchiver: archive_read_data_block failed - %{public}s.";
                  goto LABEL_89;
                }
                goto LABEL_102;
              }
            }
            while ((archive_write_data_block() & 0x8000000000000000) == 0);
            if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
            {
              uint64_t v47 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(void *)v75 = v47;
              v45 = "ADSUnarchiver: archive_write_data_block failed - %{public}s.";
              goto LABEL_89;
            }
            goto LABEL_102;
          }
LABEL_83:
          ;
        }
        while (!archive_write_finish_entry());
        BOOL v56 = os_log_type_enabled(0, OS_LOG_TYPE_DEFAULT);
        int v10 = 0;
        if (v56)
        {
          uint64_t v57 = archive_error_string();
          *(_DWORD *)buf = 136446210;
          *(void *)v75 = v57;
          v54 = "ADSUnarchiver: archive_write_finish_entry failed - %{public}s.";
LABEL_114:
          _os_log_impl(&dword_0, 0, OS_LOG_TYPE_DEFAULT, v54, buf, 0xCu);
LABEL_102:
          int v10 = 0;
        }
LABEL_103:
        if (archive_write_close())
        {
          if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v55 = archive_error_string();
            *(_DWORD *)buf = 136446210;
            *(void *)v75 = v55;
            _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to close archive_write_disk - %{public}s.", buf, 0xCu);
          }
          int v10 = 0;
        }
        if (archive_write_free() && os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = archive_error_string();
          *(_DWORD *)buf = 136446210;
          *(void *)v75 = v52;
          _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to free archive_write_disk (leaking) - %{public}s.", buf, 0xCu);
        }
        goto LABEL_53;
      }
      if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      uint64_t v49 = archive_error_string();
      *(_DWORD *)buf = 136446210;
      *(void *)v75 = v49;
      v17 = "ADSUnarchiver: archive_write_disk unable to set options - %{public}s.";
    }
    _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
LABEL_50:
    if (!archive_write_free() || !os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    uint64_t v48 = archive_error_string();
    *(_DWORD *)buf = 136446210;
    *(void *)v75 = v48;
    v18 = "ADSUnarchiver: unable to free archive_write_disk (leaking) - %{public}s.";
    uint32_t v19 = 12;
    goto LABEL_91;
  }
  if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = archive_error_string();
    *(_DWORD *)buf = 136446210;
    *(void *)v75 = v26;
    _os_log_error_impl(&dword_0, 0, OS_LOG_TYPE_ERROR, "ADSUnarchiver: unable to open archive_read - %{public}s.", buf, 0xCu);
  }
  int v10 = 0;
LABEL_56:
  if (archive_read_free() && os_log_type_enabled(0, OS_LOG_TYPE_FAULT))
  {
    uint64_t v25 = archive_error_string();
    *(_DWORD *)buf = 136446210;
    *(void *)v75 = v25;
    _os_log_fault_impl(&dword_0, 0, OS_LOG_TYPE_FAULT, "ADSUnarchiver: unable to free archive_read (leaking) - %{public}s.", buf, 0xCu);
  }
LABEL_16:
  if (close(v8) && os_log_type_enabled(0, OS_LOG_TYPE_FAULT))
  {
    v20 = __error();
    v21 = strerror(*v20);
    *(_DWORD *)buf = 67240706;
    *(_DWORD *)v75 = v8;
    *(_WORD *)&v75[4] = 2112;
    *(void *)&v75[6] = v5;
    *(_WORD *)&v75[14] = 2082;
    *(void *)&v75[16] = v21;
    _os_log_fault_impl(&dword_0, 0, OS_LOG_TYPE_FAULT, "ADSUnarchiver: unable to close file descriptor %{public}d for %@ (leaking) - %{public}s.", buf, 0x1Cu);
    if (v10) {
      goto LABEL_19;
    }
LABEL_23:
    NSLog(@"failed to unzip theme asset", v60);
    goto LABEL_24;
  }
  if (!v10) {
    goto LABEL_23;
  }
LABEL_19:
  NSLog(@"unzipped theme asset", v60);
  [+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 40) error:0];
LABEL_24:
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3EDC;
  block[3] = &unk_83D8;
  block[4] = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v66, 8);
}

void sub_3E28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_3E60(uint64_t a1, uint64_t a2)
{
}

void sub_3E70(uint64_t a1)
{
}

BOOL sub_3E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL result = [+[NSFileManager defaultManager] copyItemAtURL:a2 toURL:a3 error:*(void *)(*(void *)(a1 + 40) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id sub_3EDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4014(id a1)
{
}

void sub_4C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_4C9C(void *a1, void *a2, const __CFString *a3, int a4)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v7 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", [a2 lastPathComponent], a1[4], 0, 0, 0, 4, 0);
  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  CFStringRef v8 = &stru_8788;
  if (a4) {
    CFStringRef v8 = @"staged";
  }
  if (a3) {
    CFStringRef v8 = a3;
  }
  uint64_t v9 = +[NSString stringWithFormat:@"%@", v8];
  [v7 setProperty:v9 forKey:PSTableCellSubtitleTextKey];
  [v7 setProperty:&off_8D60 forKey:PSAccessoryKey];
  int v10 = (void *)a1[5];

  return [v10 addObject:v7];
}

id sub_4DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[PSSpecifier preferenceSpecifierNamed:a2 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:0];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  objc_msgSend(v5, "setProperty:forKey:", @"doc.zipper", +[ADSSymbolAccessorizedCell leadingSymbolNamePropertyKey](ADSSymbolAccessorizedCell, "leadingSymbolNamePropertyKey"));
  objc_msgSend(v5, "setProperty:forKey:", @"square.and.arrow.up.circle", +[ADSSymbolAccessorizedCell trailingSymbolNamePropertyKey](ADSSymbolAccessorizedCell, "trailingSymbolNamePropertyKey"));
  [v5 setUserInfo:a3];
  [v5 setButtonAction:"_didSelectLogArchiveSpecifier:"];
  id v6 = *(void **)(a1 + 40);

  return [v6 addObject:v5];
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return _NSPageSize();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t archive_entry_filetype()
{
  return _archive_entry_filetype();
}

uint64_t archive_entry_pathname_utf8()
{
  return _archive_entry_pathname_utf8();
}

uint64_t archive_entry_perm()
{
  return _archive_entry_perm();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_entry_size()
{
  return _archive_entry_size();
}

uint64_t archive_entry_size_is_set()
{
  return _archive_entry_size_is_set();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return _archive_entry_update_pathname_utf8();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_fd()
{
  return _archive_read_open_fd();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_zip()
{
  return _archive_read_support_format_zip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 URLByStandardizingPath];
}

id objc_msgSend__carPlayLogsFolderURL(void *a1, const char *a2, ...)
{
  return [a1 _carPlayLogsFolderURL];
}

id objc_msgSend__carplayLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 _carplayLibraryURL];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initDefaultsKeys(void *a1, const char *a2, ...)
{
  return [a1 initDefaultsKeys];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_leadingSymbolNamePropertyKey(void *a1, const char *a2, ...)
{
  return [a1 leadingSymbolNamePropertyKey];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_tableCellBlueTextColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellBlueTextColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_trailingSymbolNamePropertyKey(void *a1, const char *a2, ...)
{
  return [a1 trailingSymbolNamePropertyKey];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}