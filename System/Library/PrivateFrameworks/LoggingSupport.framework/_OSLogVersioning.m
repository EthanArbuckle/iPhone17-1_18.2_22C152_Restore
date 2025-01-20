@interface _OSLogVersioning
- (BOOL)checkTimesyncDB:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasEndTimeRef;
- (BOOL)performDestructiveUpdates:(id *)a3;
- (BOOL)repairTimesyncDB:(id *)a3;
- (_OSLogVersioning)initWithCollection:(id)a3 closeOnRelease:(BOOL)a4 error:(id *)a5;
- (_OSLogVersioning)initWithCollection:(id)a3 error:(id *)a4;
- (_OSLogVersioning)initWithURL:(id)a3 error:(id *)a4;
- (int64_t)state;
- (int64_t)version;
- (void)dealloc;
@end

@implementation _OSLogVersioning

- (void).cxx_destruct
{
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasEndTimeRef
{
  return self->_hasEndTimeRef;
}

- (BOOL)repairTimesyncDB:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = 0;
  v4 = self->_lcr;
  v5 = [(_OSLogCollectionReference *)v4 timesyncReference];
  int v6 = [v5 fileDescriptor];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___OSRepairTimesync_block_invoke;
  v10[3] = &unk_1E5A42AB8;
  int v11 = v6;
  v10[4] = &v12;
  v10[5] = &v9;
  _timesync_foreach_reg_file_at(v6, (uint64_t)v10);
  int v7 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  if (v7) {
    _OSLogFailWithPOSIXError((id)v9, a3);
  }
  return v7 == 0;
}

- (BOOL)checkTimesyncDB:(BOOL *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = 0;
  int v6 = self->_lcr;
  int v7 = [(_OSLogCollectionReference *)v6 timesyncReference];
  int v8 = [v7 fileDescriptor];

  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___OSValidateTimesync_block_invoke;
  v12[3] = &unk_1E5A42AB8;
  int v13 = v8;
  v12[4] = &v14;
  v12[5] = &v11;
  _timesync_foreach_reg_file_at(v8, (uint64_t)v12);
  int v9 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  if (v9 < 0) {
    _OSLogFailWithPOSIXError((id)v11, a4);
  }
  else {
    *a3 = v9 != 0;
  }
  return v9 >= 0;
}

- (BOOL)performDestructiveUpdates:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!_os_trace_device_unlocked_since_boot())
  {
    uint64_t v33 = 1;
    v34 = a3;
LABEL_56:
    _OSLogFailWithPOSIXError((id)v33, v34);
    return 0;
  }
  int64_t version = self->_version;
  if (version == -1)
  {
LABEL_68:
    _os_assert_log();
    uint64_t v37 = _os_crash();
    __break(1u);
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v37;
    __break(1u);
    goto LABEL_69;
  }
  if (version <= 4) {
    int64_t v6 = 4;
  }
  else {
    int64_t v6 = self->_version;
  }
  int64_t v42 = v6 + 1;
  v43 = a3;
  do
  {
    if (version == 2)
    {
      v44 = self->_lcr;
      int v7 = [(_OSLogCollectionReference *)v44 diagnosticsDirectoryReference];
      int v8 = [v7 fileDescriptor];

      if (fcntl(v8, 50, v46) == -1)
      {
        __error();
        _os_assumes_log();
      }
      v45[0] = v46;
      v45[1] = 0;
      int v9 = fts_open(v45, 2132, 0);
      if (!v9)
      {
LABEL_58:
        v35 = 0;
        int v10 = -1;
        goto LABEL_61;
      }
      int v10 = openat(v8, "timesync", 0);
      if (v10 == -1)
      {
        if (*__error() != 2)
        {
          int v10 = -1;
LABEL_60:
          v35 = v9;
LABEL_61:
          v36 = __error();
          _OSLogFailWithPOSIXError((id)*v36, v43);
          if (v10 != -1 && close(v10) == -1)
          {
            int v40 = *__error();
            uint64_t v41 = *__error();
            if (v40 == 9)
            {
              qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1E953C318 = v41;
              __break(1u);
            }
            _os_assumes_log();
            __error();
            _os_assert_log();
            BOOL result = _os_crash();
            __break(1u);
            return result;
          }
          if (v9) {
            fts_close(v35);
          }

          return 0;
        }
      }
      else
      {
        int v11 = _os_trace_fdscandir_b();
        if (v11 >= 1)
        {
          uint64_t v12 = 0;
          uint64_t v13 = 8 * v11;
          while (1)
          {
            uint64_t v14 = (const char *)(*v12 + 21);
            if (strcmp(v14, "."))
            {
              if (strcmp(v14, "..") && unlinkat(v10, v14, 0) == -1) {
                break;
              }
            }
            if ((void *)v13 == ++v12) {
              goto LABEL_18;
            }
          }
          __error();
          _os_assert_log();
          _os_crash();
          __break(1u);
          goto LABEL_58;
        }
LABEL_18:
        _os_trace_scandir_free_namelist();
        if (unlinkat(v8, "timesync", 128) == -1)
        {
LABEL_67:
          __error();
          _os_assert_log();
          _os_crash();
          __break(1u);
          goto LABEL_68;
        }
        if (close(v10) == -1)
        {
LABEL_69:
          int v38 = *__error();
          uint64_t v39 = *__error();
          if (v38 == 9)
          {
            qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_1E953C318 = v39;
            __break(1u);
          }
          _os_assumes_log();
          __error();
          _os_assert_log();
          _os_crash();
          __break(1u);
        }
      }
      if (mkdirat(v8, "timesync", 0x1EDu) != -1)
      {
        int v15 = openat(v8, "timesync", 0);
        if (v15 != -1)
        {
          int v16 = v15;
          int v17 = (_DWORD *)_os_trace_zalloc();
          memset(v48, 170, 18);
          *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
          snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
          int v18 = openat(v16, __str, 1537, 420);
          if (v18 < 0)
          {
            free(v17);
            int v17 = 0;
          }
          else
          {
            *int v17 = v18;
            uuid_clear((unsigned __int8 *)v17 + 4);
            *((void *)v17 + 3) = _os_trace_calloc();
            *((_OWORD *)v17 + 2) = xmmword_1A118AD20;
          }
          for (i = fts_read(v9); i; i = fts_read(v9))
          {
            int fts_info = i->fts_info;
            if (fts_info == 8)
            {
              v21 = strrchr(i->fts_name, 46);
              if (v21)
              {
                if (!strcmp(v21, ".tracev3"))
                {
                  v22 = (void *)_os_trace_mmap_at();
                  if (v22)
                  {
                    *(void *)__str = MEMORY[0x1E4F143A8];
                    *(void *)v48 = 0x40000000;
                    *(void *)&v48[8] = ___timesync_convert_tracev3_block_invoke;
                    *(void *)&v48[16] = &__block_descriptor_tmp_70;
                    v49 = v17;
                    munmap(v22, 0);
                  }
                }
              }
            }
            else if (fts_info == 1 && i->fts_level == 1 && !strcmp(i->fts_name, "FaultsAndErrors"))
            {
              fts_set(v9, i, 4);
            }
          }
          fts_close(v9);
          qsort_b(*((void **)v17 + 3), *((void *)v17 + 4), 0x40uLL, &__block_literal_global_73);
          operator new();
        }
        goto LABEL_60;
      }
      __error();
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_67;
    }
  }
  while (version++ != v6);
  v24 = [(_OSLogCollectionReference *)self->_lcr diagnosticsDirectoryReference];
  int v25 = [v24 fileDescriptor];

  uint64_t v26 = openat(v25, "Info.plist", 514, 420);
  if (v26 == -1)
  {
    uint64_t v33 = *__error();
    v34 = v43;
    goto LABEL_56;
  }
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v26 closeOnDealloc:1];
  v28 = [v27 readDataToEndOfFileAndReturnError:0];
  if ([v28 length])
  {
    id v29 = [MEMORY[0x1E4F28F98] propertyListWithData:v28 options:1 format:0 error:v43];
    if (!v29)
    {
LABEL_52:

      return 0;
    }
  }
  else
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:v42];
  [v29 setObject:v30 forKeyedSubscript:@"OSArchiveVersion"];

  v31 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v29 format:100 options:0 error:v43];

  if (!v31)
  {
    v28 = 0;
    goto LABEL_52;
  }
  if (![v27 truncateAtOffset:0 error:v43]
    || ([v27 writeData:v31 error:v43] & 1) == 0)
  {
    v28 = v31;
    goto LABEL_52;
  }
  [v27 closeAndReturnError:0];

  self->_state = (unint64_t)(v6 - 2) < 3;
  self->_int64_t version = v42;
  return 1;
}

- (void)dealloc
{
  if (self->_closeOnRelease) {
    [(_OSLogCollectionReference *)self->_lcr close];
  }
  v3.receiver = self;
  v3.super_class = (Class)_OSLogVersioning;
  [(_OSLogVersioning *)&v3 dealloc];
}

- (_OSLogVersioning)initWithURL:(id)a3 error:(id *)a4
{
  int64_t v6 = +[_OSLogCollectionReference referenceWithURL:error:](_OSLogCollectionReference, "referenceWithURL:error:", a3);
  if (v6)
  {
    self = [(_OSLogVersioning *)self initWithCollection:v6 closeOnRelease:1 error:a4];
    int v7 = self;
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (_OSLogVersioning)initWithCollection:(id)a3 error:(id *)a4
{
  return [(_OSLogVersioning *)self initWithCollection:a3 closeOnRelease:0 error:a4];
}

- (_OSLogVersioning)initWithCollection:(id)a3 closeOnRelease:(BOOL)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_OSLogVersioning;
  int v10 = [(_OSLogVersioning *)&v40 init];
  int v11 = v10;
  if (!v10)
  {
LABEL_40:
    uint64_t v26 = v11;
    goto LABEL_41;
  }
  objc_storeStrong((id *)&v10->_lcr, a3);
  v11->_closeOnRelease = a4;
  id v12 = v9;
  uint64_t v13 = [v12 diagnosticsDirectoryReference];
  int v14 = [v13 fileDescriptor];

  size_t v41 = 0;
  if (fcntl(v14, 50, __s1) == -1) {
    goto LABEL_17;
  }
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  size_t v15 = strlen((const char *)_os_trace_persist_path);
  if (!strncmp(__s1, (const char *)_os_trace_persist_path, v15))
  {
    uint64_t v24 = 0;
LABEL_28:
    v11->_uint64_t version = v24;
    goto LABEL_29;
  }
  int v16 = (void *)_os_trace_mmap_at();
  if (!v16)
  {
    if (*__error() == 2)
    {
      memset(&v53, 0, sizeof(v53));
      if (fstatat(v14, "FaultsAndErrors", &v53, 0) || (v53.st_mode & 0xF000) != 0x4000)
      {
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x2020000000;
        char v51 = 0;
        unint64_t v47 = 0;
        uint64_t v27 = _os_trace_mmap_at();
        uint64_t v28 = v27;
        if (v27)
        {
          unint64_t v29 = v47;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v43 = ___OSIsAncientArchive_block_invoke;
          v44 = &unk_1E5A42A90;
          v45 = &v48;
          uint64_t v46 = v27;
          v30 = v42;
          unint64_t v31 = 0;
          do
          {
            if (v29 - v31 < 0x10) {
              break;
            }
            unint64_t v32 = *(void *)(v28 + v31 + 8);
            if (v29 - 16 - v31 < v32) {
              break;
            }
            if (!((unsigned int (*)(void *))v43)(v30)) {
              break;
            }
            unint64_t v31 = (v31 + v32 + 23) & 0xFFFFFFFFFFFFFFF8;
          }
          while (v31 - 1 < v29);
        }
        int v33 = *((unsigned __int8 *)v49 + 24);
        _Block_object_dispose(&v48, 8);
        uint64_t v24 = -1;
        if (v33) {
          uint64_t v24 = 1;
        }
      }
      else
      {
        uint64_t v24 = 1;
      }
      goto LABEL_28;
    }
LABEL_17:
    int v25 = __error();
    _OSLogFailWithPOSIXError((id)*v25, a5);

    goto LABEL_18;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  int v18 = (void *)[v17 initWithBytesNoCopy:v16 length:v41 freeWhenDone:0];
  v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:0 error:a5];
  munmap(v16, v41);
  if (v19)
  {
    v20 = [v19 objectForKeyedSubscript:@"OSArchiveVersion"];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      v22 = [v19 objectForKeyedSubscript:@"OSArchiveVersion"];
      v11->_uint64_t version = [v22 integerValue];

      v23 = [v19 objectForKeyedSubscript:@"EndTimeRef"];
      v11->_hasEndTimeRef = v23 != 0;

LABEL_29:
      uint64_t version = v11->_version;
      uint64_t v35 = 1;
      if (version)
      {
        uint64_t v36 = 2;
        uint64_t v37 = 3;
        if (version >= 5) {
          uint64_t v37 = 0;
        }
        if (version != -1) {
          uint64_t v36 = v37;
        }
        if ((unint64_t)(version - 3) >= 3) {
          uint64_t v38 = v36;
        }
        else {
          uint64_t v38 = 1;
        }
        if (version != 5) {
          uint64_t v35 = v38;
        }
      }
      v11->_state = v35;
      goto LABEL_40;
    }
  }
  _OSLogFailWithPOSIXError((id)0x16, a5);

LABEL_18:
  uint64_t v26 = 0;
LABEL_41:

  return v26;
}

@end