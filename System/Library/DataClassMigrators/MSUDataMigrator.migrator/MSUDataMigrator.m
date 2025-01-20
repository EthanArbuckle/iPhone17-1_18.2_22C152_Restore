void debug(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  if (serialLogLevel >= 2) {
    vfprintf(__stderrp, a1, va);
  }
  debugv((uint64_t)a1, (uint64_t)va);
}

void debugv(uint64_t a1, uint64_t a2)
{
  if (log_file)
  {
    v4 = +[NSDate date];
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    [v5 setDateFormat:@"HH:mm:ss"];
    v6 = [v5 stringFromDate:v4];
    id v7 = objc_alloc((Class)NSString);
    v8 = +[NSString stringWithUTF8String:a1];
    id v9 = [v7 initWithFormat:v8 arguments:a2];

    bzero(v11, 0x400uLL);
    v10 = +[NSString stringWithFormat:@"%@: %@", v6, v9];
    [v10 getCString:v11 maxLength:1023 encoding:4];

    fputs(v11, (FILE *)log_file);
  }
}

void error(char *a1, ...)
{
  va_start(va, a1);
  if (serialLogLevel) {
    vfprintf(__stderrp, a1, va);
  }
  debugv((uint64_t)a1, (uint64_t)va);
}

FILE *init_log(int a1, int a2)
{
  serialLogLevel = a2;
  if (a1) {
    v2 = "a+";
  }
  else {
    v2 = "w+";
  }
  result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", v2);
  log_file = (uint64_t)result;
  return result;
}

uint64_t flush_log()
{
  uint64_t result = log_file;
  if (log_file)
  {
    fflush((FILE *)log_file);
    v1 = (FILE *)log_file;
    return fclose(v1);
  }
  return result;
}

char *copy_path_for_booted_os_data()
{
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (!v0)
  {
    printf("%s: Failed to query gestalt for the BootManifestHash\n", "copy_path_for_booted_os_data");
    return 0;
  }
  CFDataRef v1 = v0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v12 = 0u;
  CFIndex Length = CFDataGetLength(v0);
  BytePtr = CFDataGetBytePtr(v1);
  if (!BytePtr)
  {
    printf("%s: Failed to get byte pointer from bootManifestHash data returned by gestalt\n");
LABEL_12:
    CFRelease(v1);
    return 0;
  }
  v4 = BytePtr;
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    printf("%s: Failed to create bootManifestHashString\n");
    goto LABEL_12;
  }
  v6 = Mutable;
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *v4++;
      CFStringAppendFormat(v6, 0, @"%02x", v7);
      --Length;
    }
    while (Length);
  }
  CFStringGetCString(v6, buffer, 512, 0x8000100u);
  if (buffer[0])
  {
    v8 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    id v9 = v8;
    if (v8)
    {
      bzero(v8, 0x400uLL);
      snprintf(v9, 0x3FFuLL, "%s/%s-MSUData", "/private/var/MobileSoftwareUpdate/", buffer);
    }
    else
    {
      printf("%s: Failed to allocate memory for storing the path to the bootedOSData folder\n", "copy_path_for_booted_os_data");
    }
  }
  else
  {
    printf("%s: Failed to get C string representation of bootManifestHash\n", "copy_path_for_booted_os_data");
    id v9 = 0;
  }
  CFRelease(v1);
  CFRelease(v6);
  return v9;
}

uint64_t delete_folder_contents(void *a1)
{
  id v1 = a1;
  v2 = +[NSFileManager defaultManager];
  bzero(v59, 0x400uLL);
  if (v1)
  {
    id v25 = 0;
    v3 = [v2 contentsOfDirectoryAtPath:v1 error:&v25];
    id v4 = v25;
    [v1 getCString:v59 maxLength:1023 encoding:1];
    if (v4)
    {
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      long long v55 = 0uLL;
      long long v56 = 0uLL;
      long long v53 = 0uLL;
      long long v54 = 0uLL;
      long long v51 = 0uLL;
      long long v52 = 0uLL;
      long long v49 = 0uLL;
      long long v50 = 0uLL;
      long long v47 = 0uLL;
      long long v48 = 0uLL;
      long long v45 = 0uLL;
      long long v46 = 0uLL;
      long long v43 = 0uLL;
      long long v44 = 0uLL;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
      long long v39 = 0uLL;
      long long v40 = 0uLL;
      long long v37 = 0uLL;
      long long v38 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      id v5 = [v4 description];
      [v5 getCString:&v27 maxLength:511 encoding:4];

      if ((_BYTE)v27) {
        v6 = (const char *)&v27;
      }
      else {
        v6 = "Unable to parse error reason";
      }
      error("%s: Failed to search folder %s: %s\n", "delete_folder_contents", v59, v6);

      uint64_t v7 = 9;
    }
    else
    {
      long long v23 = 0uLL;
      long long v24 = 0uLL;
      long long v21 = 0uLL;
      long long v22 = 0uLL;
      id obj = v3;
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v7 = 0;
        v10 = 0;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);

            id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v1, v13];
            id v20 = 0;
            [v2 removeItemAtPath:v14 error:&v20];
            id v15 = v20;
            v10 = v15;
            if (v15)
            {
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v16 = [v15 description];
              [v16 getCString:&v27 maxLength:511 encoding:4];

              if ((_BYTE)v27) {
                long long v17 = (const char *)&v27;
              }
              else {
                long long v17 = "Unable to parse error reason";
              }
              error("%s: Failed to delete %s: %s\n", "delete_folder_contents", v59, v17);
              uint64_t v7 = 9;
            }
          }
          id v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
  }
  else
  {
    error("%s: Invalid argument passed as folderpath\n", "delete_folder_contents");
    uint64_t v7 = 22;
  }

  return v7;
}

void reset_msu_earlyboottask_usage_stats()
{
  totalDataMoved = 0;
  totalTimeSpentInFileMoves = 0;
}

void print_msu_earlyboottask_usage_stats()
{
}

uint64_t move_directory_hierarchy(char *a1, const char *a2)
{
  v19[0] = a1;
  v19[1] = 0;
  if (!a1 || !a2)
  {
    error("Invalid argument passed to %s", "move_directory_hierarchy");
    return 22;
  }
  id v4 = fts_open(v19, 20, 0);
  if (!v4)
  {
    uint64_t v13 = __error();
    id v14 = strerror(*v13);
    error("Failed to open source directory hierarchy: %s\n", v14);
    return *__error();
  }
  id v5 = v4;
  v6 = fts_read(v4);
  if (!v6)
  {
LABEL_21:
    uint64_t v17 = 0;
    goto LABEL_22;
  }
  uint64_t v7 = v6;
  while (1)
  {
    if (v7->fts_info == 7)
    {
      error("Got error while traversing source directory %s", a1);
      goto LABEL_21;
    }
    bzero(__str, 0x400uLL);
    size_t v8 = strlen(a1);
    snprintf(__str, 0x3FFuLL, "%s%s", a2, &v7->fts_path[v8]);
    int fts_info = v7->fts_info;
    if ((fts_info - 12) >= 2) {
      break;
    }
    if (copyfile(v7->fts_path, __str, 0, 0x12C000Fu))
    {
      uint64_t v17 = *__error();
      error("Failed to recreate symlink %s at %s: %d\n");
      goto LABEL_22;
    }
LABEL_16:
    uint64_t v7 = fts_read(v5);
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (fts_info != 8)
  {
    if (fts_info == 1 && copyfile(v7->fts_path, __str, 0, 7u))
    {
      long long v16 = __error();
      uint64_t v17 = *v16;
      error("Failed to recreate folder %s at %s: %d\n", v7->fts_path, __str, *v16);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  if (!copyfile(v7->fts_path, __str, 0, 0x13C000Fu))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    totalDataMoved += v7->fts_statp->st_size;
    *(double *)&totalTimeSpentInFileMoves = v12 - v11 + *(double *)&totalTimeSpentInFileMoves;
    goto LABEL_16;
  }
  uint64_t v17 = *__error();
  error("Failed to move regular file %s to %s: %d\n");
LABEL_22:
  fts_close(v5);
  return v17;
}

uint64_t moveFolderContentsIfItExists(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v13 = 0;
  id v5 = +[NSFileManager defaultManager];
  if (v3 && v4)
  {
    bzero(v16, 0x400uLL);
    bzero(v15, 0x400uLL);
    [v3 getCString:v16 maxLength:1023 encoding:4];
    [v4 getCString:v15 maxLength:1023 encoding:4];
    if (!v16[0] || !v15[0]) {
      error("%s: Unable to convert source/destination paths to C strings", "moveFolderContentsIfItExists");
    }
    debug("%s: Checking for source folder at: %s\n", "moveFolderContentsIfItExists", v16);
    [v5 fileExistsAtPath:v3 isDirectory:&v13];
    if (!v13)
    {
      debug("%s: Source folder %s does not exist\n");
      goto LABEL_18;
    }
    debug("%s: Folder exists..Attempting to move to %s\n", "moveFolderContentsIfItExists", v15);
    if ((move_directory_hierarchy(v16, v15) & 0x80000000) == 0)
    {
      id v12 = 0;
      [v5 removeItemAtPath:v3 error:&v12];
      id v6 = v12;
      if (v6)
      {
        uint64_t v7 = v6;
        memset(v14, 0, sizeof(v14));
        size_t v8 = [v6 description];
        [v8 getCString:v14 maxLength:511 encoding:4];

        if (LOBYTE(v14[0])) {
          id v9 = (const char *)v14;
        }
        else {
          id v9 = "Unable to parse error reason";
        }
        error("%s: Failed to remove %s folder(%s)\n", "moveFolderContentsIfItExists", v16, v9);

        goto LABEL_14;
      }
      debug("%s: Successfully moved %s to %s\n");
LABEL_18:
      uint64_t v10 = 1;
      goto LABEL_19;
    }
    error("%s: Failed to move folder contents\n");
  }
  else
  {
    error("%s: Invalid arguments passed to source/destination");
  }
LABEL_14:
  uint64_t v10 = 0;
LABEL_19:

  return v10;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

int *__error(void)
{
  return ___error();
}

void bzero(void *a1, size_t a2)
{
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}