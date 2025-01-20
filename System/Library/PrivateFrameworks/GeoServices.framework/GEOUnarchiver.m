@interface GEOUnarchiver
+ (BOOL)decompressBZip2DataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6;
+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6;
+ (BOOL)decompressGZipDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6;
+ (BOOL)unarchiveData:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6;
+ (BOOL)unarchiveDataAtURL:(id)a3 log:(id)a4 inMemoryDataSizeThreshold:(unint64_t)a5 fileVisitor:(id)a6 error:(id *)a7;
+ (BOOL)unarchiveDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6;
+ (id)getContentsOfArchiveAtURL:(id)a3 log:(id)a4 error:(id *)a5;
@end

@implementation GEOUnarchiver

+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 pathExtension];
  if (([v13 containsString:@"2"] & 1) != 0
    || [v13 containsString:@"bz"])
  {
    char v14 = [a1 decompressBZip2DataAtURL:v10 toURL:v11 log:v12 error:a6];
  }
  else
  {
    char v14 = [a1 decompressGZipDataAtURL:v10 toURL:v11 log:v12 error:a6];
  }
  BOOL v15 = v14;

  return v15;
}

+ (BOOL)decompressBZip2DataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int bzerror = 0;
  id v12 = v9;
  v13 = fopen((const char *)[v12 fileSystemRepresentation], "r");
  if (v13)
  {
    char v14 = BZ2_bzReadOpen(&bzerror, v13, 0, 1, 0, 0);
    if (!v14 || bzerror)
    {
      v18 = 0;
      v17 = 0;
      v52 = @"Unable to initilize bzip";
      if ((bzerror & 0xFFFFFFFB) != 0) {
        goto LABEL_23;
      }
      goto LABEL_44;
    }
    id v15 = v10;
    id v16 = v10;
    v17 = fopen((const char *)[v16 fileSystemRepresentation], "w");
    if (v17)
    {
      v18 = malloc_type_malloc(0x2800uLL, 0x2797EFDBuLL);
      if (v18)
      {
        while (!bzerror)
        {
          int v19 = BZ2_bzRead(&bzerror, v14, v18, 10240);
          BOOL v20 = (bzerror & 0xFFFFFFFB) != 0 || v19 == 0;
          if (!v20 && fwrite(v18, v19, 1uLL, v17) != 1)
          {
            int v21 = *__error();
            [NSString stringWithFormat:@"Error while writing to \"%@\"", v16];
            goto LABEL_20;
          }
        }
        if (bzerror == 4)
        {
          BOOL v22 = 1;
          id v10 = v15;
          goto LABEL_29;
        }
        v52 = [NSString stringWithFormat:@"Error while reading bz2 file"];
        id v10 = v15;
        if ((bzerror & 0xFFFFFFFB) == 0) {
          goto LABEL_44;
        }
LABEL_23:
        v49 = v18;
        id v51 = v10;
        v23 = objc_msgSend(NSString, "stringWithCString:encoding:", BZ2_bzerror(v14, &bzerror), 5);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v59 = v52;
          __int16 v60 = 2112;
          *(void *)v61 = v12;
          *(_WORD *)&v61[8] = 1024;
          *(_DWORD *)&v61[10] = bzerror;
          __int16 v62 = 2112;
          v63 = v23;
          _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%@ for \"%@\": %d: %@", buf, 0x26u);
          if (!a6) {
            goto LABEL_26;
          }
        }
        else if (!a6)
        {
LABEL_26:

          v18 = v49;
          id v10 = v51;
LABEL_27:
          v32 = v52;
          goto LABEL_28;
        }
        v24 = v17;
        v25 = a6;
        v26 = (void *)MEMORY[0x1E4F28C58];
        v56[0] = @"BZErrorCode";
        [NSNumber numberWithInt:bzerror];
        v47 = v14;
        v27 = v13;
        v29 = v28 = v11;
        v57[0] = v29;
        v57[1] = v23;
        v56[1] = @"BZErrorString";
        v56[2] = @"File";
        v30 = [v12 path];
        v57[2] = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
        id *v25 = [v26 GEOErrorWithCode:-18 userInfo:v31];
        v17 = v24;

        id v11 = v28;
        v13 = v27;
        char v14 = v47;
        goto LABEL_26;
      }
      int v21 = *__error();
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to malloc %u byte read buffer", 10240);
LABEL_20:
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v21 = *__error();
      v52 = [NSString stringWithFormat:@"Unable to open output file \"%@\"", v16];
      v18 = 0;
    }
    id v10 = v15;
  }
  else
  {
    int v21 = *__error();
    v52 = [NSString stringWithFormat:@"Unable to open input file \"%@\"", v12];
    char v14 = 0;
    v17 = 0;
    v18 = 0;
  }
  if ((bzerror & 0xFFFFFFFB) != 0) {
    goto LABEL_23;
  }
  if (v21)
  {
    v48 = v13;
    id v50 = v12;
    v35 = [NSString stringWithCString:strerror(v21) encoding:5];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v59 = v52;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = v21;
      *(_WORD *)&v61[4] = 2112;
      *(void *)&v61[6] = v35;
      _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%@: %d: %@", buf, 0x1Cu);
      if (!a6) {
        goto LABEL_42;
      }
    }
    else if (!a6)
    {
LABEL_42:

      v13 = v48;
      id v12 = v50;
      goto LABEL_27;
    }
    v36 = (void *)MEMORY[0x1E4F28C58];
    v37 = v11;
    uint64_t v38 = *MEMORY[0x1E4F28798];
    v46 = v17;
    v39 = a6;
    uint64_t v40 = v21;
    v54[0] = *MEMORY[0x1E4F28588];
    v54[1] = @"Input";
    v55[0] = v35;
    v55[1] = v50;
    v54[2] = @"Output";
    v55[2] = v10;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    v41 = v18;
    v42 = v14;
    v44 = id v43 = v10;
    uint64_t v45 = v38;
    id v11 = v37;
    id *v39 = [v36 errorWithDomain:v45 code:v40 userInfo:v44];
    v17 = v46;

    id v10 = v43;
    char v14 = v42;
    v18 = v41;
    goto LABEL_42;
  }
LABEL_44:
  v32 = v52;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v52;
    _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    if (!a6) {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
  if (a6)
  {
LABEL_46:
    *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v52];
  }
LABEL_28:
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v33 removeItemAtURL:v10 error:0];

  BOOL v22 = 0;
LABEL_29:
  if (v14) {
    BZ2_bzReadClose(&bzerror, v14);
  }
  if (v13) {
    fclose(v13);
  }
  if (v17) {
    fclose(v17);
  }
  if (v18) {
    free(v18);
  }

  return v22;
}

+ (BOOL)decompressGZipDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  oslog = a5;
  id v36 = v9;
  id v11 = gzopen((const char *)[v36 fileSystemRepresentation], "r");
  if (v11)
  {
    id v12 = v10;
    v13 = fopen((const char *)[v12 fileSystemRepresentation], "w");
    if (!v13)
    {
      int v16 = *__error();
      v17 = [NSString stringWithFormat:@"Unable to open output file \"%@\"", v12];
      char v14 = 0;
      goto LABEL_26;
    }
    char v14 = malloc_type_malloc(0x2800uLL, 0xD09FD0F2uLL);
    if (!v14)
    {
      int v16 = *__error();
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to malloc %u byte read buffer", 10240);
LABEL_25:
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    while (1)
    {
      unsigned int v15 = gzread(v11, v14, 0x2800u);
      if (!v15)
      {
        BOOL v31 = 1;
        goto LABEL_35;
      }
      if ((v15 & 0x80000000) != 0) {
        break;
      }
      if (fwrite(v14, v15, 1uLL, v13) != 1)
      {
        int v16 = *__error();
        [NSString stringWithFormat:@"Error while writing to \"%@\"", v12];
        goto LABEL_25;
      }
    }
    v17 = @"Failed while reading";
  }
  else
  {
    char v14 = 0;
    v13 = 0;
    v17 = @"Unable to initilize gzip";
  }
  int errnum = 0;
  v18 = gzerror(v11, &errnum);
  if (v18) {
    BOOL v19 = errnum == -1;
  }
  else {
    BOOL v19 = 1;
  }
  char v20 = !v19;
  if (!v19)
  {
    int v21 = [NSString stringWithCString:v18 encoding:5];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v44 = v17;
      __int16 v45 = 2112;
      *(void *)v46 = v36;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)&v46[10] = errnum;
      __int16 v47 = 2112;
      v48 = v21;
      _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "%@ for \"%@\": %d: %@", buf, 0x26u);
      if (!a6)
      {
LABEL_19:

        int v16 = 0;
        if (v20) {
          goto LABEL_31;
        }
LABEL_26:
        if (!v16) {
          goto LABEL_31;
        }
        v26 = [NSString stringWithCString:strerror(v16) encoding:5];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v17;
          __int16 v45 = 1024;
          *(_DWORD *)v46 = v16;
          *(_WORD *)&v46[4] = 2112;
          *(void *)&v46[6] = v26;
          _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "%@: %d: %@", buf, 0x1Cu);
          if (!a6) {
            goto LABEL_30;
          }
        }
        else if (!a6)
        {
LABEL_30:

          goto LABEL_34;
        }
        v35 = a6;
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28798];
        v39[0] = *MEMORY[0x1E4F28588];
        v39[1] = @"Input";
        v40[0] = v26;
        v40[1] = v36;
        v39[2] = @"Output";
        v40[2] = v10;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
        id *v35 = [v27 errorWithDomain:v28 code:v16 userInfo:v29];

        goto LABEL_30;
      }
    }
    else if (!a6)
    {
      goto LABEL_19;
    }
    v33 = (void *)MEMORY[0x1E4F28C58];
    v41[0] = @"BZErrorCode";
    v34 = [NSNumber numberWithInt:errnum];
    v42[0] = v34;
    v42[1] = v21;
    v41[1] = @"BZErrorString";
    v41[2] = @"File";
    BOOL v22 = [v36 path];
    v42[2] = v22;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
    v23 = v17;
    v25 = v24 = a6;
    id *v24 = [v33 GEOErrorWithCode:-18 userInfo:v25];

    a6 = v24;
    v17 = v23;

    goto LABEL_19;
  }
  int v16 = *__error();
  if ((v20 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_31:
  if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    if (!a6) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  *(_DWORD *)buf = 138412290;
  v44 = v17;
  _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  if (a6)
  {
LABEL_33:
    *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v17];
  }
LABEL_34:
  v30 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v30 removeItemAtURL:v10 error:0];

  BOOL v31 = 0;
  if (v11) {
LABEL_35:
  }
    gzclose(v11);
  if (v13) {
    fclose(v13);
  }
  if (v14) {
    free(v14);
  }

  return v31;
}

+ (BOOL)unarchiveData:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (char *)a4;
  id v11 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v40 = v10;
    _os_log_debug_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive to location: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  archive_read_support_filter_bzip2();
  archive_read_support_filter_gzip();
  v13 = NSTemporaryDirectory();
  char v14 = [MEMORY[0x1E4F29128] UUID];
  unsigned int v15 = [v14 UUIDString];
  int v16 = [v13 stringByAppendingPathComponent:v15];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __47__GEOUnarchiver_unarchiveData_toURL_log_error___block_invoke;
  v38[3] = &__block_descriptor_40_e5_v8__0l;
  v38[4] = v12;
  v17 = (void (**)(void))MEMORY[0x18C120660](v38);
  id v18 = v9;
  [v18 bytes];
  [v18 length];
  if (archive_read_open_memory())
  {
    char v20 = NSString;
    uint64_t v21 = archive_error_string();
    if (v21) {
      BOOL v22 = (const char *)v21;
    }
    else {
      BOOL v22 = "<libarchive failed to return an error string>";
    }
    v23 = [v20 stringWithUTF8String:v22];
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v23];
    }
    v17[2](v17);

    char v24 = 0;
    goto LABEL_40;
  }
  v37[1] = 0;
  *(void *)&long long v19 = 138543618;
  long long v36 = v19;
  while (1)
  {
    int next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header != 1)
      {
        uint64_t v30 = archive_error_string();
        if (v30) {
          BOOL v31 = (const char *)v30;
        }
        else {
          BOOL v31 = "<libarchive failed to return an error string>";
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v40 = v31;
          _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
        }
        objc_msgSend(NSString, "stringWithUTF8String:", v31, v36);
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        if (a6)
        {
          *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v26];
        }
        v17[2](v17);
        goto LABEL_38;
      }
      uint64_t v28 = [MEMORY[0x1E4F28CB8] defaultManager];
      v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
      v37[0] = 0;
      char v24 = [v28 moveItemAtURL:v29 toURL:v10 error:v37];
      v26 = (char *)v37[0];

      if ((v24 & 1) == 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v40 = v26;
          _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to move unarchived data to destination: %{public}@", buf, 0xCu);
          if (!a6) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        if (a6) {
LABEL_20:
        }
          *a6 = v26;
      }
LABEL_21:
      v17[2](v17);
      goto LABEL_39;
    }
    v26 = [NSString stringWithUTF8String:archive_entry_pathname()];
    id v27 = [v16 stringByAppendingPathComponent:v26];
    [v27 UTF8String];
    archive_entry_set_pathname();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v36;
      uint64_t v40 = v26;
      __int16 v41 = 2114;
      id v42 = v27;
      _os_log_debug_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);
    }
    if (archive_read_extract()) {
      break;
    }
  }
  uint64_t v32 = archive_error_string();
  if (v32) {
    v33 = (const char *)v32;
  }
  else {
    v33 = "<libarchive failed to return an error string>";
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = v33;
    _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
  }
  v34 = objc_msgSend(NSString, "stringWithUTF8String:", v33, v36);
  if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v34];
  }
  v17[2](v17);

LABEL_38:
  char v24 = 0;
LABEL_39:

LABEL_40:
  return v24;
}

uint64_t __47__GEOUnarchiver_unarchiveData_toURL_log_error___block_invoke()
{
  archive_read_close();

  return archive_read_free();
}

+ (BOOL)unarchiveDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = (char *)a3;
  id v10 = a4;
  id v11 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v9;
    _os_log_debug_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive at location: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  v13 = [v9 pathExtension];
  uint64_t v38 = a6;
  if (([v13 containsString:@"2"] & 1) != 0
    || [v13 containsString:@"bz"])
  {
    archive_read_support_filter_bzip2();
  }
  else
  {
    archive_read_support_filter_gzip();
  }
  char v14 = NSTemporaryDirectory();
  unsigned int v15 = [MEMORY[0x1E4F29128] UUID];
  int v16 = [v15 UUIDString];
  v17 = [v14 stringByAppendingPathComponent:v16];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __52__GEOUnarchiver_unarchiveDataAtURL_toURL_log_error___block_invoke;
  void v40[3] = &__block_descriptor_40_e5_v8__0l;
  v40[4] = v12;
  id v18 = (void (**)(void))MEMORY[0x18C120660](v40);
  long long v19 = v9;
  [v19 fileSystemRepresentation];
  if (archive_read_open_filename())
  {
    uint64_t v21 = NSString;
    uint64_t v22 = archive_error_string();
    if (v22) {
      v23 = (const char *)v22;
    }
    else {
      v23 = "<libarchive failed to return an error string>";
    }
    char v24 = [v21 stringWithUTF8String:v23];
    if (v38)
    {
      *uint64_t v38 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v24];
    }
    v18[2](v18);

    char v25 = 0;
    goto LABEL_44;
  }
  v39[1] = 0;
  *(void *)&long long v20 = 138543618;
  long long v37 = v20;
  while (1)
  {
    int next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header != 1)
      {
        uint64_t v31 = archive_error_string();
        if (v31) {
          uint64_t v32 = (const char *)v31;
        }
        else {
          uint64_t v32 = "<libarchive failed to return an error string>";
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          id v42 = v32;
          _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
        }
        objc_msgSend(NSString, "stringWithUTF8String:", v32, v37);
        id v27 = (char *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          *uint64_t v38 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v27];
        }
        v18[2](v18);
        goto LABEL_42;
      }
      v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
      v39[0] = 0;
      char v25 = [v29 moveItemAtURL:v30 toURL:v10 error:v39];
      id v27 = (char *)v39[0];

      if ((v25 & 1) == 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v27;
          _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to move unarchived data to destination: %{public}@", buf, 0xCu);
          if (!v38) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
        if (v38) {
LABEL_24:
        }
          *uint64_t v38 = v27;
      }
LABEL_25:
      v18[2](v18);
      goto LABEL_43;
    }
    id v27 = [NSString stringWithUTF8String:archive_entry_pathname()];
    id v28 = [v17 stringByAppendingPathComponent:v27];
    [v28 UTF8String];
    archive_entry_set_pathname();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v37;
      id v42 = v27;
      __int16 v43 = 2114;
      id v44 = v28;
      _os_log_debug_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);
    }
    if (archive_read_extract()) {
      break;
    }
  }
  uint64_t v33 = archive_error_string();
  if (v33) {
    v34 = (const char *)v33;
  }
  else {
    v34 = "<libarchive failed to return an error string>";
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    id v42 = v34;
    _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
  }
  v35 = objc_msgSend(NSString, "stringWithUTF8String:", v34, v37);
  if (v38)
  {
    *uint64_t v38 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v35];
  }
  v18[2](v18);

LABEL_42:
  char v25 = 0;
LABEL_43:

LABEL_44:
  return v25;
}

uint64_t __52__GEOUnarchiver_unarchiveDataAtURL_toURL_log_error___block_invoke()
{
  archive_read_close();

  return archive_read_free();
}

+ (BOOL)unarchiveDataAtURL:(id)a3 log:(id)a4 inMemoryDataSizeThreshold:(unint64_t)a5 fileVisitor:(id)a6 error:(id *)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v54 = (void (**)(id, void *, id, void))a6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_debug_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive at location: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = NSTemporaryDirectory();
  char v14 = [MEMORY[0x1E4F29128] UUID];
  unsigned int v15 = [v14 UUIDString];
  int v16 = [v13 stringByAppendingPathComponent:v15];
  v17 = [v12 fileURLWithPath:v16 isDirectory:1];

  uint64_t v18 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  long long v19 = [v10 pathExtension];
  if (([v19 containsString:@"2"] & 1) != 0
    || [v19 containsString:@"bz"])
  {
    archive_read_support_filter_bzip2();
  }
  else
  {
    archive_read_support_filter_gzip();
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __84__GEOUnarchiver_unarchiveDataAtURL_log_inMemoryDataSizeThreshold_fileVisitor_error___block_invoke;
  void v55[3] = &unk_1E53D9680;
  uint64_t v58 = v18;
  id v20 = v17;
  id v56 = v20;
  os_log_t oslog = v11;
  os_log_t v57 = oslog;
  uint64_t v21 = (void (**)(void))MEMORY[0x18C120660](v55);
  id v22 = v10;
  [v22 fileSystemRepresentation];
  if (archive_read_open_filename())
  {
    char v24 = NSString;
    uint64_t v25 = archive_error_string();
    if (v25) {
      v26 = (const char *)v25;
    }
    else {
      v26 = "<libarchive failed to return an error string>";
    }
    id v27 = [v24 stringWithUTF8String:v26];
    if (a7)
    {
      *a7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v27];
    }
    v21[2](v21);

    BOOL v28 = 0;
  }
  else
  {
    id v50 = v22;
    id v51 = v19;
    *(void *)&long long v23 = 138543618;
    long long v49 = v23;
    while (1)
    {
      v29 = (void *)MEMORY[0x18C1203C0]();
      int next_header = archive_read_next_header();
      if (next_header) {
        break;
      }
      uint64_t v31 = [NSString stringWithUTF8String:archive_entry_pathname()];
      unint64_t v32 = archive_entry_size();
      if (a5 && v32 < a5)
      {
        id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v32];
        *(void *)buf = 0;
        uint64_t v59 = 0;
        uint64_t v60 = 0;
        int data_block = archive_read_data_block();
        BOOL v35 = data_block == 1;
        if (data_block != 1 && (data_block & 0x80000000) == 0)
        {
          do
          {
            objc_msgSend(v33, "appendBytes:length:", *(void *)buf, v60, v49);
            int v36 = archive_read_data_block();
            BOOL v35 = v36 == 1;
          }
          while (v36 != 1 && (v36 & 0x80000000) == 0);
        }

        if (!v35)
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to read bytes for archive entry", buf, 2u);
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "GEOErrorWithCode:reason:", -18, @"Failed to read bytes for archive entry", v49);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:
          id v44 = a7;
          id v22 = v50;

          goto LABEL_47;
        }
        v54[2](v54, v31, v33, 0);
      }
      else
      {
        id v37 = v20;
        objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v31, 0, v49);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        id v38 = [v33 path];
        [v38 UTF8String];
        archive_entry_set_pathname();

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v39 = oslog;
          uint64_t v40 = [v33 path];
          *(_DWORD *)buf = v49;
          *(void *)&uint8_t buf[4] = v31;
          __int16 v62 = 2114;
          v63 = v40;
          _os_log_debug_impl(&dword_188D96000, v39, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);
        }
        if (archive_read_extract())
        {
          uint64_t v45 = archive_error_string();
          if (v45) {
            v46 = (const char *)v45;
          }
          else {
            v46 = "<libarchive failed to return an error string>";
          }
          id v20 = v37;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = v46;
            _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
          }
          __int16 v47 = [NSString stringWithUTF8String:v46];
          id v41 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v47];

          goto LABEL_46;
        }
        ((void (**)(id, void *, id, id))v54)[2](v54, v31, 0, v33);
        id v20 = v37;
      }
    }
    if (next_header == 1)
    {
      id v41 = 0;
      BOOL v28 = 1;
      id v22 = v50;
      long long v19 = v51;
      goto LABEL_51;
    }
    uint64_t v42 = archive_error_string();
    if (v42) {
      __int16 v43 = (const char *)v42;
    }
    else {
      __int16 v43 = "<libarchive failed to return an error string>";
    }
    id v22 = v50;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
    }
    uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:", v43, v49);
    id v41 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v31];
    id v44 = a7;
LABEL_47:

    BOOL v28 = 0;
    if (v44)
    {
      long long v19 = v51;
      if (v41)
      {
        id v41 = v41;
        BOOL v28 = 0;
        id *v44 = v41;
      }
    }
    else
    {
      long long v19 = v51;
    }
LABEL_51:
    v21[2](v21);
  }
  return v28;
}

void __84__GEOUnarchiver_unarchiveDataAtURL_log_inMemoryDataSizeThreshold_fileVisitor_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  archive_read_close();
  archive_read_free();
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [*(id *)(a1 + 32) path];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v8;
        _os_log_error_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to clean up temporary directory: %{public}@", buf, 0xCu);
      }
    }
  }
}

+ (id)getContentsOfArchiveAtURL:(id)a3 log:(id)a4 error:(id *)a5
{
  *(void *)((char *)&v53[2] + 2) = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v50 = 0;
  LODWORD(a4) = [v7 getResourceValue:&v50 forKey:*MEMORY[0x1E4F1C5F8] error:a5];
  id v9 = v50;
  id v10 = v9;
  if (!a4)
  {
LABEL_10:
    uint64_t v18 = 0;
    goto LABEL_46;
  }
  size_t v11 = [v9 unsignedLongLongValue];
  id v12 = v7;
  int v13 = open((const char *)[v12 fileSystemRepresentation], 0);
  if (v13 < 0)
  {
    v17 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = __error();
      __int16 v43 = strerror(*v42);
      *(_DWORD *)buf = 138412546;
      *(void *)v52 = v12;
      *(_WORD *)&v52[8] = 2080;
      v53[0] = v43;
      _os_log_error_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "[Unarchiver] Error opening file at %@: %s", buf, 0x16u);
    }

    goto LABEL_10;
  }
  int v14 = v13;
  unsigned int v15 = mmap(0, v11, 1, 2, v13, 0);
  if ((unint64_t)v15 + 1 <= 1)
  {
    int v16 = v8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v39 = *__error();
      uint64_t v40 = __error();
      id v41 = strerror(*v40);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v52 = v14;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v39;
      LOWORD(v53[0]) = 2080;
      *(void *)((char *)v53 + 2) = v41;
      _os_log_error_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "[Unarchiver] Could not memory-map file descriptor: %d with error %d: %s", buf, 0x18u);
    }

    close(v14);
    goto LABEL_10;
  }
  uint64_t v19 = (uint64_t)v15;
  v46 = a5;
  uint64_t v20 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __53__GEOUnarchiver_getContentsOfArchiveAtURL_log_error___block_invoke;
  v48[3] = &__block_descriptor_60_e5_v8__0l;
  v48[4] = v20;
  v48[5] = v19;
  v48[6] = v11;
  int v49 = v14;
  uint64_t v47 = MEMORY[0x18C120660](v48);
  if (archive_read_open_memory())
  {
    uint64_t v21 = NSString;
    uint64_t v22 = archive_error_string();
    if (v22) {
      long long v23 = (const char *)v22;
    }
    else {
      long long v23 = "<libarchive failed to return an error string>";
    }
    char v24 = [v21 stringWithUTF8String:v23];
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-18 reason:v24];
    }
    uint64_t v25 = (void (**)(void))v47;
    (*(void (**)(uint64_t))(v47 + 16))(v47);

    uint64_t v18 = 0;
  }
  else
  {
    os_log_t oslog = v8;
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    while (1)
    {
      v26 = (void *)MEMORY[0x18C1203C0]();
      int next_header = archive_read_next_header();
      if (next_header) {
        break;
      }
      BOOL v28 = [NSString stringWithUTF8String:archive_entry_pathname()];
      uint64_t v29 = archive_entry_size();
      if (archive_read_data_block() || v29)
      {
        uint64_t v36 = archive_error_string();
        if (v36) {
          id v37 = (const char *)v36;
        }
        else {
          id v37 = "<libarchive failed to return an error string>";
        }
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v52 = v37;
          _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_data_block(): %s", buf, 0xCu);
        }
        uint64_t v38 = [NSString stringWithUTF8String:v37];
        id v32 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v38];

        uint64_t v18 = (void *)v38;
        BOOL v35 = v46;
        uint64_t v25 = (void (**)(void))v47;
        goto LABEL_39;
      }
      size_t v30 = -v19;
      if (v19 || v30 >= v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: bufferHasValidOffset", buf, 2u);
        }
        BOOL v35 = v46;
        uint64_t v25 = (void (**)(void))v47;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Invalid file offset within archive", buf, 2u);
        }
        id v32 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Bad file offset within archive"];
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v31 = [[GEOArchiveFileInfo alloc] initWithFilePath:v28 offset:v30 length:v29];
      [v18 addObject:v31];

      archive_read_data_skip();
    }
    if (next_header == 1)
    {
      id v32 = 0;
      id v8 = oslog;
      uint64_t v25 = (void (**)(void))v47;
      goto LABEL_44;
    }
    uint64_t v33 = archive_error_string();
    if (v33) {
      v34 = (const char *)v33;
    }
    else {
      v34 = "<libarchive failed to return an error string>";
    }
    uint64_t v25 = (void (**)(void))v47;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)v52 = v34;
      _os_log_error_impl(&dword_188D96000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
    }
    BOOL v28 = [NSString stringWithUTF8String:v34];
    id v32 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v28];

    BOOL v35 = v46;
LABEL_40:

    uint64_t v18 = 0;
    if (v35)
    {
      id v8 = oslog;
      if (v32)
      {
        id v32 = v32;
        uint64_t v18 = 0;
        id *v35 = v32;
      }
    }
    else
    {
      id v8 = oslog;
    }
LABEL_44:
    v25[2](v25);
  }
LABEL_46:

  return v18;
}

uint64_t __53__GEOUnarchiver_getContentsOfArchiveAtURL_log_error___block_invoke(uint64_t a1)
{
  archive_read_close();
  archive_read_free();
  munmap(*(void **)(a1 + 40), *(void *)(a1 + 48));
  int v2 = *(_DWORD *)(a1 + 56);

  return close(v2);
}

@end