@interface OSLogEventLocalStore
- (void)prepareWithCompletionHandler:(id)a3;
@end

@implementation OSLogEventLocalStore

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke_2(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:6];
  id v93 = 0;
  v6 = +[_OSLogCollectionReference localDBRefWithError:&v93];
  id v7 = v93;
  v8 = v7;
  if (!v6)
  {
    if (!v7)
    {
      v8 = _OSLogError(6);
    }
    v4[2](v4, 0, v8);
    goto LABEL_37;
  }
  id v9 = v5;
  v10 = self;
  objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
  progressHandler = (void (**)(id, void))v10->super._progressHandler;

  if (progressHandler)
  {
    [v9 fractionCompleted];
    progressHandler[2](progressHandler, 0);
  }

  v12 = [v6 timesyncReference];
  int v13 = [v12 fileDescriptor];

  uint64_t v14 = _timesync_db_openat(v13, ".");
  if (!v14)
  {
    uint64_t v43 = *__error();
    uint64_t v44 = 12;
LABEL_32:
    v45 = _OSLogPOSIXError(v44, v43);
    v4[2](v4, 0, v45);

    [v6 close];
    goto LABEL_37;
  }
  uint64_t v15 = v14;
  id v16 = v9;
  v17 = v10;
  objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);
  v18 = (void (**)(id, void))v10->super._progressHandler;

  if (v18)
  {
    [v16 fractionCompleted];
    v18[2](v18, 0);
  }

  uint64_t v92 = 0;
  v19 = [v6 diagnosticsDirectoryReference];

  if (!v19)
  {
LABEL_11:
    id v24 = v16;
    v25 = v17;
    objc_msgSend(v24, "setCompletedUnitCount:", objc_msgSend(v24, "completedUnitCount") + 1);
    v26 = (void (**)(id, void))v10->super._progressHandler;

    if (v26)
    {
      [v24 fractionCompleted];
      v26[2](v26, 0);
    }

    v27 = NSTemporaryDirectory();
    v28 = v27;
    if (v27)
    {
      v90 = 0;
      asprintf(&v90, "%slsfw-tmp-XXXXXXX.tracev3", (const char *)[v27 UTF8String]);
      if (v90)
      {
        v88 = v19;
        int v29 = mkstemps(v90, 8);
        if (v29 == -1)
        {
          free(v90);
          v19 = v88;
        }
        else
        {
          unlink(v90);
          v30 = fdopen(v29, "w+");
          free(v90);
          v31 = v30;
          v19 = v88;
          if (v31)
          {
            v81 = v28;
            v82 = v31;
            int v32 = fileno(v31);
            v33 = [(OSLogEventStore *)v25 _relativeFilePaths];

            if (v33) {
              uint64_t v34 = 0;
            }
            else {
              uint64_t v34 = 3;
            }
            unsigned int v86 = v32;
            if ((OSLogCaptureInflightBuffersToFile(v32, v34, 0) & 1) == 0)
            {
              fclose(v82);
              unsigned int v86 = -1;
            }
            id v35 = v24;
            v36 = v25;
            objc_msgSend(v35, "setCompletedUnitCount:", objc_msgSend(v35, "completedUnitCount") + 1);
            v37 = (void (**)(id, void))v10->super._progressHandler;
            v79 = v36;

            if (v37)
            {
              [v35 fractionCompleted];
              v37[2](v37, 0);
            }

            v38 = [[_OSLogEventStoreMetadata alloc] initWithCollection:v6 localStorePlist:v88 liveDataDescriptor:v86];
            v39 = [[OSLogEventSource alloc] initWithCollection:v6 metadata:v38 timesync:v15];
            [v35 becomeCurrentWithPendingUnitCount:1];
            v40 = [v6 diagnosticsDirectoryReference];

            v28 = v81;
            v84 = v39;
            v85 = v38;
            if (v40)
            {
              v41 = v79;
              v42 = [(OSLogEventStore *)v79 _relativeFilePaths];

              if (v42)
              {
                [(OSLogEventStore *)v79 addFilesToSource:v39 forCollection:v6 withProgress:v35];
              }
              else
              {
                v54 = [(OSLogEventStore *)v79 _progressHandler];
                char v55 = _enumerateArchiveIntoSource(v39, v6, v54, v4);

                if ((v55 & 1) == 0)
                {
                  fclose(v82);
                  v19 = v88;
                  v68 = v84;
                  v59 = v85;
LABEL_56:

                  goto LABEL_36;
                }
              }
            }
            else
            {
              v41 = v79;
              v49 = [(OSLogEventStore *)v79 _progressHandler];

              if (v49)
              {
                v78 = [MEMORY[0x1E4F28F90] currentProgress];
                v50 = [(OSLogEventStore *)v79 _progressHandler];
                [v78 fractionCompleted];
                double v52 = v51;
                v53 = _OSLogPOSIXError(18, 2);
                ((void (**)(void, void *, double))v50)[2](v50, v53, v52);
              }
            }
            [v35 resignCurrent];
            id v56 = v35;
            v57 = v41;
            objc_msgSend(v56, "setCompletedUnitCount:", objc_msgSend(v56, "completedUnitCount"));
            v58 = (void (**)(id, void))v10->super._progressHandler;

            if (v58)
            {
              [v56 fractionCompleted];
              v58[2](v58, 0);
            }

            v59 = v85;
            if (v86 == -1)
            {
LABEL_53:
              id v75 = v56;
              v76 = v57;
              objc_msgSend(v75, "setCompletedUnitCount:", objc_msgSend(v75, "completedUnitCount") + 1);
              v77 = (void (**)(id, void))v10->super._progressHandler;

              if (v77)
              {
                [v75 fractionCompleted];
                v77[2](v77, 0);
              }

              v68 = v84;
              ((void (**)(id, OSLogEventSource *, void *))v4)[2](v4, v84, 0);
              v19 = v88;
              goto LABEL_56;
            }
            v80 = v57;
            uint64_t v60 = _os_trace_mmap();
            fclose(v82);
            v61 = [_OSLogChunkMemory alloc];
            v62 = [(_OSLogChunkMemory *)v61 initWithBytes:v60 size:v92 deallocator:&__block_literal_global_185];
            id v89 = 0;
            v63 = [[_OSLogIndexFile alloc] initWithChunkStore:v62 error:&v89];
            id v64 = v89;
            v87 = v64;
            if (v63)
            {
              [(OSLogEventSource *)v84 _insertIndexFile:v63];
LABEL_52:

              v59 = v85;
              v57 = v80;
              goto LABEL_53;
            }
            v65 = v64;
            v83 = (FILE *)v62;
            v66 = [v64 domain];
            v67 = v66;
            if (v66 == (void *)*MEMORY[0x1E4F28798])
            {
              uint64_t v69 = [v65 code];

              v62 = (_OSLogChunkMemory *)v83;
              if (v69 == 34) {
                goto LABEL_52;
              }
            }
            else
            {

              v62 = (_OSLogChunkMemory *)v83;
            }
            v70 = [(OSLogEventStore *)v80 _progressHandler];

            if (v70)
            {
              v71 = [(OSLogEventStore *)v80 _progressHandler];
              [v56 fractionCompleted];
              double v73 = v72;
              v74 = _OSLogInternalError(17, v87);
              ((void (**)(void, void *, double))v71)[2](v71, v74, v73);

              v62 = (_OSLogChunkMemory *)v83;
            }
            goto LABEL_52;
          }
        }
      }
    }
    v47 = __error();
    v48 = _OSLogPOSIXError(7, *v47);
    v4[2](v4, 0, v48);

    [v6 close];
LABEL_36:

    goto LABEL_37;
  }
  v20 = [v6 diagnosticsDirectoryReference];
  [v20 fileDescriptor];

  uint64_t v21 = _os_trace_mmap_at();
  if (!v21)
  {
    uint64_t v43 = *__error();
    uint64_t v44 = 5;
    goto LABEL_32;
  }
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v21 length:v92 deallocator:&__block_literal_global_180];
  v91 = 0;
  uint64_t v23 = [MEMORY[0x1E4F28F98] propertyListWithData:v22 options:0 format:0 error:&v91];
  if (v23)
  {
    v19 = (void *)v23;

    goto LABEL_11;
  }
  v46 = _OSLogInternalError(5, v91);
  v4[2](v4, 0, v46);

  [v6 close];
LABEL_37:
}

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end