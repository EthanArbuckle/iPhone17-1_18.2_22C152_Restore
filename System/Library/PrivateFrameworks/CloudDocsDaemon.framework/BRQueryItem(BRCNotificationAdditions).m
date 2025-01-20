@interface BRQueryItem(BRCNotificationAdditions)
- (_BYTE)initWithRelPath:()BRCNotificationAdditions error:;
@end

@implementation BRQueryItem(BRCNotificationAdditions)

- (_BYTE)initWithRelPath:()BRCNotificationAdditions error:
{
  id v6 = a3;
  v67.receiver = a1;
  v67.super_class = (Class)BRQueryItem_0;
  v7 = objc_msgSendSuper2(&v67, sel_init);
  if (!v7) {
    goto LABEL_28;
  }
  if ([v6 exists])
  {
    *(void *)&v7[*MEMORY[0x1E4F595E0]] = -1;
    *(void *)&v7[*MEMORY[0x1E4F59610]] = -1;
    if ([v6 isFinderAlias])
    {
      uint64_t v8 = (int)*MEMORY[0x1E4F595D0];
      v7[v8 + 5] = 3;
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      uint64_t v10 = (int)*MEMORY[0x1E4F595F0];
      v11 = *(void **)&v7[v10];
      *(void *)&v7[v10] = v9;
    }
    else if ([v6 isSymLink])
    {
      uint64_t v8 = (int)*MEMORY[0x1E4F595D0];
      v7[v8 + 5] = 4;
    }
    else if ([v6 isDocument])
    {
      uint64_t v8 = (int)*MEMORY[0x1E4F595D0];
      v12 = &v7[v8];
      v7[v8 + 5] = 1;
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      uint64_t v14 = (int)*MEMORY[0x1E4F595F0];
      v15 = *(void **)&v7[v14];
      *(void *)&v7[v14] = v13;

      unint64_t v16 = *(_DWORD *)v12 & 0xFFFFFFF7 | ((unint64_t)v12[4] << 32);
      *(_DWORD *)v12 = *(_DWORD *)v12 & 0xFFFFFFF3 | 4;
      v12[4] = BYTE4(v16);
    }
    else
    {
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      uint64_t v18 = (int)*MEMORY[0x1E4F595F0];
      v19 = *(void **)&v7[v18];
      *(void *)&v7[v18] = v17;

      uint64_t v8 = (int)*MEMORY[0x1E4F595D0];
      v7[v8 + 5] = 0;
    }
    v20 = [v6 appLibrary];
    uint64_t v21 = [v20 appLibraryID];
    uint64_t v22 = (int)*MEMORY[0x1E4F59590];
    v23 = *(void **)&v7[v22];
    *(void *)&v7[v22] = v21;

    if ([v6 isFault])
    {
      uint64_t v24 = [v6 faultDisplayName];
      uint64_t v25 = (int)*MEMORY[0x1E4F595E8];
      v26 = *(void **)&v7[v25];
      *(void *)&v7[v25] = v24;

      uint64_t v27 = [v6 filename];
      uint64_t v28 = (int)*MEMORY[0x1E4F59618];
      v29 = *(void **)&v7[v28];
      *(void *)&v7[v28] = v27;

      if (*(void *)&v7[v25])
      {
LABEL_20:
        uint64_t v40 = (int)*MEMORY[0x1E4F59638];
        v41 = *(void **)&v7[v40];
        *(void *)&v7[v40] = 0;

        uint64_t v42 = (int)*MEMORY[0x1E4F59608];
        v43 = *(void **)&v7[v42];
        *(void *)&v7[v42] = 0;

        v44 = [v6 absolutePath];
        uint64_t v45 = [v44 stringByDeletingLastPathComponent];
        uint64_t v46 = (int)*MEMORY[0x1E4F59600];
        v47 = *(void **)&v7[v46];
        *(void *)&v7[v46] = v45;

        uint64_t v48 = [v6 fileObjectID];
        uint64_t v49 = (int)*MEMORY[0x1E4F595C8];
        v50 = *(void **)&v7[v49];
        *(void *)&v7[v49] = v48;

        uint64_t v51 = [v6 parentFileObjectID];
        uint64_t v52 = (int)*MEMORY[0x1E4F595F8];
        v53 = *(void **)&v7[v52];
        *(void *)&v7[v52] = v51;

        [v7 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F59680]];
        if ([v6 isFile])
        {
          uint64_t v54 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "size"));
          uint64_t v55 = (int)*MEMORY[0x1E4F59628];
          v56 = *(void **)&v7[v55];
          *(void *)&v7[v55] = v54;
        }
        uint64_t v57 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "birthTime"));
        uint64_t v58 = (int)*MEMORY[0x1E4F595A0];
        v59 = *(void **)&v7[v58];
        *(void *)&v7[v58] = v57;

        v60 = &v7[(int)v8];
        unint64_t v61 = *(_DWORD *)v60 & 0xFFEFFFFF | ((unint64_t)v60[4] << 32);
        *(_DWORD *)v60 = *(_DWORD *)v60 & 0xFFEFFBFC | 0x403;
        v60[4] = BYTE4(v61);
        if ([v6 type] == 5)
        {
          v62 = [v6 appLibrary];
          int v63 = [v62 isiCloudDesktopAppLibrary];

          unint64_t v64 = *(unsigned int *)&v7[(int)v8] | ((unint64_t)v7[(int)v8 + 4] << 32);
          if (!v63) {
            v64 |= 0x8000000uLL;
          }
        }
        else
        {
          unint64_t v64 = *(unsigned int *)&v7[(int)v8] | ((unint64_t)v7[(int)v8 + 4] << 32);
        }
        v65 = &v7[(int)v8];
        v65[4] = BYTE4(v64);
        *(_DWORD *)v65 = v64 | 0x20000000;
        goto LABEL_28;
      }
      v30 = brc_bread_crumbs();
      v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[BRQueryItem(BRCNotificationAdditions) initWithRelPath:error:]((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    else
    {
      uint64_t v38 = [v6 filename];
      uint64_t v39 = (int)*MEMORY[0x1E4F595E8];
      v30 = *(void **)&v7[v39];
      *(void *)&v7[v39] = v38;
    }

    goto LABEL_20;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v7 = 0;
LABEL_28:

  return v7;
}

- (void)initWithRelPath:()BRCNotificationAdditions error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D353B000, a2, a3, "[CRIT] Assertion failed: _logicalName != nil%@", a5, a6, a7, a8, 2u);
}

@end