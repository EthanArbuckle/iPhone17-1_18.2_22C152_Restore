@interface BRCVolume
- (BOOL)hasCloning;
- (BOOL)hasRenameExcl;
- (BOOL)hasRenameSwap;
- (BOOL)isCaseSensitive;
- (BOOL)isIgnoringOwnership;
- (BOOL)setUpForRelPath:(id)a3 error:(id *)a4;
- (NSNumber)freeSize;
- (NSNumber)totalSize;
- (NSString)fsTypeName;
- (NSString)mountPath;
- (id)description;
- (int)_setUpForStatfs:(statfs *)a3;
- (int)deviceID;
@end

@implementation BRCVolume

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", self->_stfs.f_mntonname);
}

- (int)_setUpForStatfs:(statfs *)a3
{
  uint64_t v12 = 0;
  long long v11 = xmmword_1D3887458;
  int v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (getattrlist(a3->f_mntonname, &v11, v9, 0x24uLL, 0x21u) < 0) {
    return *__error();
  }
  if (strcmp(a3->f_fstypename, "hfs") && (~DWORD1(v9[0]) & 0x180000) != 0) {
    return 19;
  }
  uint32_t f_flags = a3->f_flags;
  if ((f_flags & 0x1001) == 0x1000)
  {
    memcpy(&self->_stfs, a3, sizeof(self->_stfs));
    int result = 0;
    self->_isCaseSensitive = BYTE5(v9[0]) & 1;
    v7.i32[0] = a3->f_flags;
    v7.i32[1] = DWORD2(v9[0]);
    int16x8_t v8 = (int16x8_t)vshlq_u32((uint32x4_t)vzip1q_s32(v7, vdupq_lane_s32(*(int32x2_t *)v7.i8, 1)), (uint32x4_t)xmmword_1D3887440);
    *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v8), (int8x8_t)0x1000100010001);
    *(_DWORD *)&self->_isIgnoringOwnership = vmovn_s16(v8).u32[0];
  }
  else if (f_flags)
  {
    return 30;
  }
  else
  {
    return 19;
  }
  return result;
}

- (NSString)fsTypeName
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", self->_stfs.f_fstypename);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = BRCPrettyPrintBitmap();
  v6 = (void *)v5;
  if (self->_isCaseSensitive) {
    int32x4_t v7 = "YES";
  }
  else {
    int32x4_t v7 = "NO";
  }
  int16x8_t v8 = [v3 stringWithFormat:@"<%@:%p>, device:'%s' mounted-on:'%s' fstype:%s(%@) case-sensitive:%s", v4, self, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename, v5, v7];

  return v8;
}

- (NSNumber)freeSize
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(BRCVolume *)self mountPath];
  uint64_t v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];

  return (NSNumber *)v6;
}

- (NSNumber)totalSize
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(BRCVolume *)self mountPath];
  uint64_t v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F283B0]];

  return (NSNumber *)v6;
}

- (BOOL)setUpForRelPath:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v31 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __35__BRCVolume_setUpForRelPath_error___block_invoke;
  v23 = &unk_1E6993738;
  v24 = self;
  v26 = &v27;
  id v7 = v6;
  id v25 = v7;
  [v7 performOnOpenFileDescriptor:&v20 error:&v31];
  if (v31)
  {
    int16x8_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v20, v21, v22, v23, v24);
    if (v8)
    {
      v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = (BRCVolume *)"-[BRCVolume setUpForRelPath:error:]";
        __int16 v34 = 2080;
        if (!a4) {
          v19 = "(ignored by caller)";
        }
        v35 = v19;
        __int16 v36 = 2112;
        v37 = v8;
        __int16 v38 = 2112;
        v39 = v9;
        _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }
  }
  int v11 = *((_DWORD *)v28 + 6);
  if (v11)
  {
    self->_deviceID = v11;
    brc_bread_crumbs();
    uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] on device: %@%@", buf, 0x16u);
    }

    BOOL v14 = v31 == 0;
  }
  else
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = [v7 absolutePath];
      [(BRCVolume *)v17 setUpForRelPath:buf error:v16];
    }

    BOOL v14 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v14;
}

uint64_t __35__BRCVolume_setUpForRelPath_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&__src, 0, 512);
  if (fstatfs(a2, &__src) < 0) {
    return *__error();
  }
  v3 = *(void **)(a1 + 32);
  memcpy(__dst, &__src, sizeof(__dst));
  uint64_t result = [v3 _setUpForStatfs:__dst];
  if (!result)
  {
    int v5 = [*(id *)(a1 + 40) deviceID];
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
  return result;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (BOOL)isIgnoringOwnership
{
  return self->_isIgnoringOwnership;
}

- (BOOL)hasRenameExcl
{
  return self->_hasRenameExcl;
}

- (BOOL)hasRenameSwap
{
  return self->_hasRenameSwap;
}

- (BOOL)hasCloning
{
  return self->_hasCloning;
}

- (void)setUpForRelPath:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@'s device ID is 0!%@", buf, 0x16u);
}

@end