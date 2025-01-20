@interface XRZipArchiver
+ (BOOL)flatArchiveFilesAtURLs:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)flatUnarchiveFileAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
@end

@implementation XRZipArchiver

+ (id)flatUnarchiveFileAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v13 = [MEMORY[0x263F08850] v9 v10 v11 v12];
  v18 = [v13 currentDirectoryPath:v14, v15, v16, v17];

  v23 = [MEMORY[0x263F08850] defaultManager:v19 withOptions:v20 error:v21];
  v28 = [v8 performSelector:v24 withObject:v25 withObject:v26 withObject:v27];
  [v23 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:0];

  v34 = [MEMORY[0x263F08850] defaultManager:v30 withOptions:v31 error:v32];
  v39 = [v8 v35:v36 v37:v38];
  char v43 = [v34 changeCurrentDirectoryPath:v40 withOptions:(uint64_t)v39 error:v41];

  if (v43)
  {
    v122[5] = 0;
    uint64_t v47 = archive_read_new();
    archive_read_support_format_all();
    archive_read_support_filter_all();
    v122[0] = MEMORY[0x263EF8330];
    v122[1] = 3221225472;
    v122[2] = sub_23457772C;
    v122[3] = &unk_264BF0B60;
    v122[4] = v47;
    id v120 = v7;
    uint64_t v121 = MEMORY[0x237DC1050](v122);
    [v7 setFoo:v48 bar:v49 baz:v50 qux:v51];
    id v52 = objc_claimAutoreleasedReturnValue();
    [v52 v53:v54 v55:v56];
    uint64_t open_filename = archive_read_open_filename();

    if (open_filename)
    {
      uint64_t v59 = archive_error_string();
      if (v59)
      {
        [NSString stringWithCString:v58 encoding:v59];
        id v65 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = v120;
      }
      else
      {
        id v7 = v120;
        [NSString stringWithFormat:@"Failed to open archive at URL: %@ with code: %d", v60, v61, v120, open_filename];
        id v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      v90 = (void (**)(void))v121;
      if (a5)
      {
        [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"%@", v63, v64, v65];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_21:
      v90[2](v90);
LABEL_22:

      v66 = 0;
    }
    else
    {
      id v65 = 0;
      char v67 = 1;
      while (1)
      {
        int next_header = archive_read_next_header();
        if (next_header == 1)
        {
          (*(void (**)(void))(v121 + 16))();
          id v7 = v120;
          if (v65)
          {
            v66 = [v8 URLByAppendingPathComponent:v92];
            v99 = [MEMORY[0x263F08850] performSelector:v95 withObject:v96 withObject:v97 withObject:v98];
            [v99 changeCurrentDirectoryPath:v100];
          }
          else if (a5)
          {
            [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"Unarchiving file failed at URL: %@", v93, v94, v120];
            v66 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v66 = 0;
          }
          v90 = (void (**)(void))v121;
          goto LABEL_23;
        }
        int v69 = next_header;
        if (v67)
        {
          v70 = v18;
          v71 = NSString;
          uint64_t v72 = archive_entry_pathname();
          v75 = [v71 stringWithCString:v73 encoding:v72];
          v80 = [v75 lastPathComponent:v76, v77, v78, v79];

          id v65 = v80;
          [v65 UTF8String];
          archive_entry_set_pathname();

          v18 = v70;
        }
        if (v69 < 0) {
          break;
        }
        uint64_t v85 = archive_read_extract();
        uint64_t v89 = v85;
        if ((v85 & 0x80000000) != 0)
        {
          uint64_t v112 = archive_error_string();
          if (v112)
          {
            v118 = [NSString stringWithCString:v111 encoding:v112];
            id v7 = v120;
          }
          else
          {
            uint64_t v119 = v89;
            id v7 = v120;
            v118 = [NSString stringWithFormat:@"Failed to extract archive at URL: %@ with code: %d", v113, v114, v120, v119];
          }
          v90 = (void (**)(void))v121;
          if (a5)
          {
            [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"%@", v116, v117, v118];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          (*(void (**)(uint64_t))(v121 + 16))(v121);

          goto LABEL_22;
        }
        char v67 = 0;
        if (v85 == 1)
        {
          id v7 = v120;
          if (a5)
          {
            [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"Encountered end of file when extracting archive at URL: %@", v87, v88, v120];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          v90 = (void (**)(void))v121;
          goto LABEL_21;
        }
      }
      v103 = NSString;
      uint64_t v104 = archive_error_string();
      v110 = [v103 stringWithCString:v105 encoding:v104];
      if (a5)
      {
        [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"%@", v108, v109, v110];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v90 = (void (**)(void))v121;
      (*(void (**)(uint64_t))(v121 + 16))(v121);

      v66 = 0;
      id v7 = v120;
    }
LABEL_23:
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"Cannot unarchive file at URL: %@. Unable to change access output URL: %@", v45, v46, v7, v8];
    v66 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = 0;
  }

  return v66;
}

+ (BOOL)flatArchiveFilesAtURLs:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(&v83, 0, sizeof(v83));
  uint64_t v9 = archive_write_new();
  archive_write_set_format_zip();
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = sub_234577B7C;
  v82[3] = &unk_264BF0B60;
  v82[4] = v9;
  uint64_t v10 = (void *)MEMORY[0x237DC1050](v82);
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = sub_234577B84;
  v79[3] = &unk_264BF0B88;
  uint64_t v11 = v10;
  id v81 = v11;
  id v12 = v8;
  id v80 = v12;
  v13 = (void (**)(void))MEMORY[0x237DC1050](v79);
  [v12 v14:v15 v16:v17];
  id v18 = objc_claimAutoreleasedReturnValue();
  [v18 UTF8String];
  uint64_t v23 = archive_write_open_filename();

  if (v23)
  {
    uint64_t v25 = archive_error_string();
    if (v25) {
      [NSString stringWithCString:v24 encoding:v25];
    }
    else {
    int v69 = [NSString stringWithFormat:@"Failed to open archive for write at URL: %@ with code: %d", v26, v27, v12, v23];
    }
    if (a5)
    {
      [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"%@", v67, v68, v69];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11[2](v11);

    BOOL v65 = 0;
  }
  else
  {
    v73 = v13;
    id v74 = v12;
    v71 = a5;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v28 = v7;
    uint64_t v30 = [v28 countByEnumeratingWithState:v29 objects:&v75 count:16];
    if (v30)
    {
      uint64_t v35 = v30;
      uint64_t v36 = *(void *)v76;
      id v72 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v76 != v36) {
            objc_enumerationMutation(v28);
          }
          uint64_t v38 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          [v38 v31:v32 v33:v34];
          id v39 = objc_claimAutoreleasedReturnValue();
          v44 = (const char *)[v39 UTF8String];
          if (stat(v44, &v83))
          {
            if (v71)
            {
              [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"Cannot access information about file at URL: %@", v46, v47, v38];
              id *v71 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_22:
            v13 = v73;
            v73[2](v73);

            BOOL v65 = 0;
            id v7 = v72;
            id v12 = v74;
            goto LABEL_23;
          }
          archive_entry_new();
          [v39 lastPathComponent:v48, v49, v50, v51];
          id v52 = objc_claimAutoreleasedReturnValue();
          [v52 v53:v54 v55:v56];
          archive_entry_set_pathname();

          archive_entry_set_size();
          archive_entry_set_filetype();
          archive_entry_set_perm();
          archive_write_header();
          id v57 = v39;
          v62 = (const char *)[v57 UTF8String];
          int v63 = open(v62, 0x1000000);
          if (v63 == -1) {
            goto LABEL_22;
          }
          int v64 = v63;
          if (read(v63, v85, 0x2000uLL) >= 1)
          {
            do
              archive_write_data();
            while (read(v64, v85, 0x2000uLL) > 0);
          }
          close(v64);
          archive_entry_free();
        }
        uint64_t v35 = [v28 countByEnumeratingWithState:v31 objects:&v75 count:16];
        id v7 = v72;
        if (v35) {
          continue;
        }
        break;
      }
    }

    v11[2](v11);
    BOOL v65 = 1;
    v13 = v73;
    id v12 = v74;
  }
LABEL_23:

  return v65;
}

@end