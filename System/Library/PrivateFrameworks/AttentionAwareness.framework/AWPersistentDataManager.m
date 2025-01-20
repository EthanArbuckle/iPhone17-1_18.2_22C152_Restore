@interface AWPersistentDataManager
+ (BOOL)AWPersistentDataExists:(int *)a3;
+ (BOOL)truncateAWPersistentData:(int *)a3 error:(id *)a4;
+ (BOOL)validateAWPersistentDataHeader:(id *)a3;
+ (id)sharedManager;
+ (void)initAWPersistentDataHeader:(id *)a3;
- ($F484E3E6FD0A2BE9213BA906CF92CD29)clientStateWithConnection:(id)a3 index:(int)a4 error:(id *)a5;
- (AWPersistentDataManager)init;
- (BOOL)checkPreconditions:(id *)a3;
- (BOOL)closeWithConnection:(id)a3 index:(int)a4 error:(id *)a5;
- (BOOL)isValidIndexForConnection:(id)a3 index:(int)a4 error:(id *)a5;
- (int)nextFreeIndex;
- (int)openWithConnection:(id)a3 error:(id *)a4;
- (void)loadPersistentData;
@end

@implementation AWPersistentDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- ($F484E3E6FD0A2BE9213BA906CF92CD29)clientStateWithConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if ([(AWPersistentDataManager *)self checkPreconditions:a5]
    && [(AWPersistentDataManager *)self isValidIndexForConnection:v8 index:v6 error:a5])
  {
    v9 = (char *)self->_shm_obj + 88 * (int)v6;
    v10 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)(v9 + 32);
    *((void *)v9 + 13) = absTimeNS();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)closeWithConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(AWPersistentDataManager *)self checkPreconditions:a5]
    && [(AWPersistentDataManager *)self isValidIndexForConnection:v8 index:v6 error:a5])
  {
    shm_obj = self->_shm_obj;
    if (currentLogLevel == 5)
    {
      v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = absTimeNS();
        if (v11 == -1) {
          double v12 = INFINITY;
        }
        else {
          double v12 = (double)v11 / 1000000000.0;
        }
        int v18 = shm_obj[22 * (int)v6 + 28];
        int v24 = 134218496;
        double v25 = v12;
        __int16 v26 = 1024;
        int v27 = v6;
        __int16 v28 = 1024;
        LODWORD(v29) = v18;
        v19 = "%13.5f: AW SHARED MEM: closing index %d for client with pid %d";
        v20 = v10;
        uint32_t v21 = 24;
LABEL_22:
        _os_log_impl(&dword_1B3B4B000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, v21);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_24:
        *(void *)&shm_obj[22 * (int)v6 + 28] = 0;
        *(_OWORD *)&shm_obj[22 * (int)v6 + 20] = 0u;
        *(_OWORD *)&shm_obj[22 * (int)v6 + 24] = 0u;
        *(_OWORD *)&shm_obj[22 * (int)v6 + 12] = 0u;
        *(_OWORD *)&shm_obj[22 * (int)v6 + 16] = 0u;
        *(_OWORD *)&shm_obj[22 * (int)v6 + 8] = 0u;
        BOOL v13 = 1;
        goto LABEL_25;
      }
      v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            v14 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v16 = absTimeNS();
            if (v16 == -1) {
              double v17 = INFINITY;
            }
            else {
              double v17 = (double)v16 / 1000000000.0;
            }
            int v22 = shm_obj[22 * (int)v6 + 28];
            int v24 = 136316162;
            double v25 = *(double *)&v14;
            __int16 v26 = 1024;
            int v27 = 469;
            __int16 v28 = 2048;
            double v29 = v17;
            __int16 v30 = 1024;
            int v31 = v6;
            __int16 v32 = 1024;
            int v33 = v22;
            v19 = "%30s:%-4d: %13.5f: AW SHARED MEM: closing index %d for client with pid %d";
            v20 = v10;
            uint32_t v21 = 40;
            goto LABEL_22;
          }
        }
      }
    }

    goto LABEL_24;
  }
  BOOL v13 = 0;
LABEL_25:

  return v13;
}

- (int)openWithConnection:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(AWPersistentDataManager *)self checkPreconditions:a4])
  {
LABEL_7:
    int v8 = -1;
    goto LABEL_29;
  }
  int v7 = [(AWPersistentDataManager *)self nextFreeIndex];
  if (v7 == -1)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:28 userInfo:0];
    }
    goto LABEL_7;
  }
  int v8 = v7;
  shm_obj = self->_shm_obj;
  int v10 = v7;
  unint64_t v11 = (char *)&shm_obj[22 * v7];
  *((void *)v11 + 14) = 0;
  double v12 = v11 + 112;
  *((_OWORD *)v12 - 2) = 0u;
  *((_OWORD *)v12 - 1) = 0u;
  *((_OWORD *)v12 - 4) = 0u;
  *((_OWORD *)v12 - 3) = 0u;
  *((_OWORD *)v12 - 5) = 0u;
  *((void *)v12 - 1) = absTimeNS();
  *double v12 = [v6 processIdentifier];
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(&v26, 0, sizeof(v26));
  }
  shm_obj[22 * v10 + 29] = audit_token_to_pidversion(&v26);
  if (currentLogLevel == 5)
  {
    BOOL v13 = _AALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = absTimeNS();
      if (v14 == -1) {
        double v15 = INFINITY;
      }
      else {
        double v15 = (double)v14 / 1000000000.0;
      }
      int v20 = *v12;
      *(_DWORD *)buf = 134218496;
      double v28 = v15;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 1024;
      LODWORD(v32) = v20;
      uint32_t v21 = "%13.5f: AW SHARED MEM: opening index %d for client with pid %d";
      int v22 = v13;
      uint32_t v23 = 24;
LABEL_27:
      _os_log_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
LABEL_28:

    goto LABEL_29;
  }
  if (currentLogLevel >= 6)
  {
    BOOL v13 = _AALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v16 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v18 = absTimeNS();
          if (v18 == -1) {
            double v19 = INFINITY;
          }
          else {
            double v19 = (double)v18 / 1000000000.0;
          }
          int v24 = *v12;
          *(_DWORD *)buf = 136316162;
          double v28 = *(double *)&v16;
          __int16 v29 = 1024;
          int v30 = 438;
          __int16 v31 = 2048;
          double v32 = v19;
          __int16 v33 = 1024;
          int v34 = v8;
          __int16 v35 = 1024;
          int v36 = v24;
          uint32_t v21 = "%30s:%-4d: %13.5f: AW SHARED MEM: opening index %d for client with pid %d";
          int v22 = v13;
          uint32_t v23 = 40;
          goto LABEL_27;
        }
      }
    }
    goto LABEL_28;
  }
LABEL_29:

  return v8;
}

- (int)nextFreeIndex
{
  unint64_t v2 = *MEMORY[0x1E4F14B00] - 32;
  if (v2 < 0x58)
  {
LABEL_5:
    LODWORD(v4) = -1;
  }
  else
  {
    uint64_t v4 = 0;
    shm_obj = (char *)self->_shm_obj;
    unint64_t v6 = v2 / 0x58;
    int v7 = (uint64_t *)(shm_obj + 104);
    while (1)
    {
      uint64_t v8 = *v7;
      v7 += 11;
      if (!v8) {
        break;
      }
      if (v6 == ++v4) {
        goto LABEL_5;
      }
    }
  }
  return v4;
}

- (BOOL)isValidIndexForConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  if (a4 < 0 || a4 >= (*MEMORY[0x1E4F14B00] - 32) / 0x58uLL)
  {
    if (!a5) {
      goto LABEL_17;
    }
    uint64_t v13 = 34;
  }
  else
  {
    shm_obj = self->_shm_obj;
    if (*(void *)&shm_obj[22 * a4 + 26])
    {
      int v11 = shm_obj[22 * a4 + 28];
      if (v11 == [v8 processIdentifier])
      {
        int v12 = shm_obj[22 * a4 + 29];
        if (v9) {
          [v9 auditToken];
        }
        else {
          memset(&v16, 0, sizeof(v16));
        }
        if (v12 == audit_token_to_pidversion(&v16))
        {
          BOOL v14 = 1;
          goto LABEL_18;
        }
      }
      if (a5)
      {
        uint64_t v13 = 1;
        goto LABEL_9;
      }
LABEL_17:
      BOOL v14 = 0;
      goto LABEL_18;
    }
    if (!a5) {
      goto LABEL_17;
    }
    uint64_t v13 = 22;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], v13, 0, *(_OWORD *)v16.val, *(_OWORD *)&v16.val[4]);
  BOOL v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v14;
}

- (BOOL)checkPreconditions:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  shm_obj = self->_shm_obj;
  if (a3 && !shm_obj)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
  return shm_obj != 0;
}

- (void)loadPersistentData
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  int v63 = -1;
  int v3 = [(id)objc_opt_class() AWPersistentDataExists:&v63];
  if (currentLogLevel == 5)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      int v11 = "false";
      *(_DWORD *)buf = 134218498;
      double v65 = v6;
      __int16 v66 = 2080;
      *(void *)v67 = "com.apple.AttentionAwareness";
      if (v3) {
        int v11 = "true";
      }
      *(_WORD *)&v67[8] = 2080;
      *(void *)&v67[10] = v11;
      int v12 = "%13.5f: AW SHARED MEM: found %s shm object: %s";
      uint64_t v13 = v4;
      uint32_t v14 = 32;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v4 = _AALog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        int v7 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v9 = absTimeNS();
        if (v9 == -1) {
          double v10 = INFINITY;
        }
        else {
          double v10 = (double)v9 / 1000000000.0;
        }
        double v15 = "false";
        *(_DWORD *)buf = 136316162;
        double v65 = *(double *)&v7;
        __int16 v66 = 1024;
        if (v3) {
          double v15 = "true";
        }
        *(_DWORD *)v67 = 239;
        *(_WORD *)&v67[4] = 2048;
        *(double *)&v67[6] = v10;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "com.apple.AttentionAwareness";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = v15;
        int v12 = "%30s:%-4d: %13.5f: AW SHARED MEM: found %s shm object: %s";
        uint64_t v13 = v4;
        uint32_t v14 = 48;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_24:

        break;
      }
    }
  }
  int v16 = v63;
  if (v3)
  {
    if (v63 != -1) {
      __assert_rtn("-[AWPersistentDataManager loadPersistentData]", "PersistentDataManager.m", 242, "fd == -1");
    }
    int v16 = shm_open("com.apple.AttentionAwareness", 514, 384);
    int v63 = v16;
  }
  if (v16 == -1)
  {
    if (currentLogLevel < 3)
    {
      id v18 = 0;
      goto LABEL_74;
    }
    audit_token_t v26 = _AALog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unint64_t v48 = absTimeNS();
      if (v48 == -1) {
        double v49 = INFINITY;
      }
      else {
        double v49 = (double)v48 / 1000000000.0;
      }
      v54 = __error();
      v55 = strerror(*v54);
      *(_DWORD *)buf = 134218498;
      double v65 = v49;
      __int16 v66 = 2080;
      *(void *)v67 = "com.apple.AttentionAwareness";
      *(_WORD *)&v67[8] = 2080;
      *(void *)&v67[10] = v55;
      _os_log_error_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_ERROR, "%13.5f: AW SHARED MEM: failed to open %s shm object: %s", buf, 0x20u);
    }
    id v18 = 0;
    goto LABEL_73;
  }
  id v62 = 0;
  char v17 = [(id)objc_opt_class() truncateAWPersistentData:&v63 error:&v62];
  id v18 = v62;
  if ((v17 & 1) == 0)
  {
    if (currentLogLevel < 3) {
      goto LABEL_74;
    }
    audit_token_t v26 = _AALog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    unint64_t v27 = absTimeNS();
    if (v27 == -1) {
      double v28 = INFINITY;
    }
    else {
      double v28 = (double)v27 / 1000000000.0;
    }
    *(_DWORD *)buf = 134218498;
    double v65 = v28;
    __int16 v66 = 2080;
    *(void *)v67 = "com.apple.AttentionAwareness";
    *(_WORD *)&v67[8] = 2112;
    *(void *)&v67[10] = v18;
    v56 = "%13.5f: AW SHARED MEM: failed to truncate %s shm object: %@";
    goto LABEL_83;
  }
  double v19 = (void *)MEMORY[0x1E4F14B00];
  int v20 = mmap(0, *MEMORY[0x1E4F14B00], 3, 1, v63, 0);
  self->_shm_obj = v20;
  if (v20 == (void *)-1)
  {
    if (currentLogLevel < 3) {
      goto LABEL_74;
    }
    audit_token_t v26 = _AALog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    unint64_t v29 = absTimeNS();
    if (v29 == -1) {
      double v30 = INFINITY;
    }
    else {
      double v30 = (double)v29 / 1000000000.0;
    }
    v57 = __error();
    v58 = strerror(*v57);
    *(_DWORD *)buf = 134218498;
    double v65 = v30;
    __int16 v66 = 2080;
    *(void *)v67 = "com.apple.AttentionAwareness";
    *(_WORD *)&v67[8] = 2080;
    *(void *)&v67[10] = v58;
    v56 = "%13.5f: AW SHARED MEM: failed to map %s shm object: %s";
LABEL_83:
    _os_log_error_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_ERROR, v56, buf, 0x20u);
    goto LABEL_73;
  }
  uint32_t v21 = (uint64_t *)v20;
  if (v3)
  {
    if ([(id)objc_opt_class() validateAWPersistentDataHeader:v20])
    {
      int v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
      timer = self->_timer;
      self->_timer = v22;

      int v24 = self->_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __45__AWPersistentDataManager_loadPersistentData__block_invoke;
      handler[3] = &unk_1E606AB88;
      handler[4] = self;
      handler[5] = v21;
      dispatch_source_set_event_handler(v24, handler);
      dispatch_time_t v25 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v25, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      dispatch_resume((dispatch_object_t)self->_timer);
      goto LABEL_52;
    }
    if (currentLogLevel >= 3)
    {
      __int16 v31 = _AALog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        unint64_t v59 = absTimeNS();
        if (v59 == -1) {
          double v60 = INFINITY;
        }
        else {
          double v60 = (double)v59 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v65 = v60;
        __int16 v66 = 2080;
        *(void *)v67 = "com.apple.AttentionAwareness";
        _os_log_error_impl(&dword_1B3B4B000, v31, OS_LOG_TYPE_ERROR, "%13.5f: AW SHARED MEM: failed to validate %s shm object", buf, 0x16u);
      }
    }
  }
  [(id)objc_opt_class() initAWPersistentDataHeader:v21];
  if ((unint64_t)(*v19 - 32) >= 0x58)
  {
    unint64_t v32 = 0;
    __int16 v33 = v21 + 4;
    do
    {
      v33[10] = 0;
      *((_OWORD *)v33 + 3) = 0uLL;
      *((_OWORD *)v33 + 4) = 0uLL;
      *((_OWORD *)v33 + 1) = 0uLL;
      *((_OWORD *)v33 + 2) = 0uLL;
      *(_OWORD *)__int16 v33 = 0uLL;
      v33 += 11;
      ++v32;
    }
    while (v32 < (*v19 - 32) / 0x58uLL);
  }
LABEL_52:
  self->_loadAbsTime = absTimeNS();
  if (currentLogLevel == 5)
  {
    audit_token_t v26 = _AALog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v34 = absTimeNS();
      if (v34 == -1) {
        double v35 = INFINITY;
      }
      else {
        double v35 = (double)v34 / 1000000000.0;
      }
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      uint64_t v42 = *v21;
      uint64_t v43 = v21[1];
      unint64_t v44 = (*v19 - 32) / 0x58uLL;
      *(_DWORD *)buf = 134219266;
      double v65 = v35;
      __int16 v66 = 2112;
      *(void *)v67 = v41;
      *(_WORD *)&v67[8] = 2080;
      *(void *)&v67[10] = "com.apple.AttentionAwareness";
      *(_WORD *)&v67[18] = 2048;
      *(void *)&v67[20] = v42;
      *(_WORD *)&v67[28] = 2048;
      *(void *)&v67[30] = v43;
      *(_WORD *)&v67[38] = 2048;
      *(void *)&v67[40] = v44;
      v45 = "%13.5f: AW SHARED MEM: %@ created successfully with %s shm object: shm version %llu, shm size %llu, shm max clients %lu";
      v46 = v26;
      uint32_t v47 = 62;
LABEL_72:
      _os_log_impl(&dword_1B3B4B000, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_74;
    }
    audit_token_t v26 = _AALog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          int v36 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v38 = absTimeNS();
          if (v38 == -1) {
            double v39 = INFINITY;
          }
          else {
            double v39 = (double)v38 / 1000000000.0;
          }
          v50 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v50);
          uint64_t v51 = *v21;
          uint64_t v52 = v21[1];
          unint64_t v53 = (*v19 - 32) / 0x58uLL;
          *(_DWORD *)buf = 136316930;
          double v65 = *(double *)&v36;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = 329;
          *(_WORD *)&v67[4] = 2048;
          *(double *)&v67[6] = v39;
          *(_WORD *)&v67[14] = 2112;
          *(void *)&v67[16] = v41;
          *(_WORD *)&v67[24] = 2080;
          *(void *)&v67[26] = "com.apple.AttentionAwareness";
          *(_WORD *)&v67[34] = 2048;
          *(void *)&v67[36] = v51;
          *(_WORD *)&v67[44] = 2048;
          *(void *)&v67[46] = v52;
          __int16 v68 = 2048;
          unint64_t v69 = v53;
          v45 = "%30s:%-4d: %13.5f: AW SHARED MEM: %@ created successfully with %s shm object: shm version %llu, shm size"
                " %llu, shm max clients %lu";
          v46 = v26;
          uint32_t v47 = 78;
          goto LABEL_72;
        }
      }
    }
  }
LABEL_73:

LABEL_74:
  if (v63 != -1) {
    close(v63);
  }
}

void __45__AWPersistentDataManager_loadPersistentData__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v1 = (uint64_t *)MEMORY[0x1E4F14B00];
  uint64_t v2 = *MEMORY[0x1E4F14B00];
  unint64_t v3 = 0x1EB801000uLL;
  if ((unint64_t)(*MEMORY[0x1E4F14B00] - 32) >= 0x58)
  {
    unint64_t v6 = 0;
    int v4 = 0;
    do
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = v7 + 88 * v6;
      unint64_t v9 = *(void *)(v8 + 104);
      if (v9 && *(void *)(*(void *)(a1 + 32) + 32) > v9)
      {
        int v10 = *(_DWORD *)(v3 + 2856);
        if (v10 == 5)
        {
          int v11 = _AALog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v12 = absTimeNS();
            if (v12 == -1) {
              double v13 = INFINITY;
            }
            else {
              double v13 = (double)v12 / 1000000000.0;
            }
            int v19 = *(_DWORD *)(v7 + 88 * v6 + 112);
            *(_DWORD *)buf = 134218496;
            double v33 = v13;
            __int16 v34 = 1024;
            int v35 = v6;
            __int16 v36 = 1024;
            LODWORD(v37) = v19;
            _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: reclaiming index %d from client with pid %d", buf, 0x18u);
          }
LABEL_24:
        }
        else if (v10 >= 6)
        {
          int v11 = _AALog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_24;
          }
          unint64_t v14 = v3;
          double v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
          for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
                ;
                ++i)
          {
            if (*(i - 1) == 47)
            {
              double v15 = i;
            }
            else if (!*(i - 1))
            {
              unint64_t v17 = absTimeNS();
              if (v17 == -1) {
                double v18 = INFINITY;
              }
              else {
                double v18 = (double)v17 / 1000000000.0;
              }
              int v20 = *(_DWORD *)(v7 + 88 * v6 + 112);
              *(_DWORD *)buf = 136316162;
              double v33 = *(double *)&v15;
              __int16 v34 = 1024;
              int v35 = 291;
              __int16 v36 = 2048;
              uint64_t v37 = *(void *)&v18;
              __int16 v38 = 1024;
              int v39 = v6;
              __int16 v40 = 1024;
              LODWORD(v41) = v20;
              _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AW SHARED MEM: reclaiming index %d from client with pid %d", buf, 0x28u);
              unint64_t v3 = v14;
              v1 = (uint64_t *)MEMORY[0x1E4F14B00];
              goto LABEL_24;
            }
          }
        }
        *(void *)(v8 + 112) = 0;
        *(_OWORD *)(v8 + 80) = 0u;
        *(_OWORD *)(v8 + 96) = 0u;
        *(_OWORD *)(v8 + 48) = 0u;
        *(_OWORD *)(v8 + 64) = 0u;
        *(_OWORD *)(v8 + 32) = 0u;
        ++v4;
        uint64_t v2 = *v1;
      }
      ++v6;
    }
    while (v6 < (v2 - 32) / 0x58uLL);
  }
  else
  {
    int v4 = 0;
  }
  int v21 = *(_DWORD *)(v3 + 2856);
  if (v21 == 5)
  {
    int v22 = _AALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = absTimeNS();
      if (v23 == -1) {
        double v24 = INFINITY;
      }
      else {
        double v24 = (double)v23 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218496;
      double v33 = v24;
      __int16 v34 = 1024;
      int v35 = v4;
      __int16 v36 = 2048;
      uint64_t v37 = 10;
      unint64_t v29 = "%13.5f: AW SHARED MEM: reclaimed %d client entries %llu sec after AW service relaunch";
      double v30 = v22;
      uint32_t v31 = 28;
LABEL_45:
      _os_log_impl(&dword_1B3B4B000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
  }
  else
  {
    if (v21 < 6) {
      return;
    }
    int v22 = _AALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v25 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/PersistentDataManager.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          dispatch_time_t v25 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v27 = absTimeNS();
          if (v27 == -1) {
            double v28 = INFINITY;
          }
          else {
            double v28 = (double)v27 / 1000000000.0;
          }
          *(_DWORD *)buf = 136316162;
          double v33 = *(double *)&v25;
          __int16 v34 = 1024;
          int v35 = 297;
          __int16 v36 = 2048;
          uint64_t v37 = *(void *)&v28;
          __int16 v38 = 1024;
          int v39 = v4;
          __int16 v40 = 2048;
          uint64_t v41 = 10;
          unint64_t v29 = "%30s:%-4d: %13.5f: AW SHARED MEM: reclaimed %d client entries %llu sec after AW service relaunch";
          double v30 = v22;
          uint32_t v31 = 44;
          goto LABEL_45;
        }
      }
    }
  }
}

- (AWPersistentDataManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AWPersistentDataManager;
  uint64_t v2 = [(AWPersistentDataManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (BOOL)truncateAWPersistentData:(int *)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    __assert_rtn("+[AWPersistentDataManager truncateAWPersistentData:error:]", "PersistentDataManager.m", 134, "fildes");
  }
  int v5 = *a3;
  if (*a3 == -1) {
    __assert_rtn("+[AWPersistentDataManager truncateAWPersistentData:error:]", "PersistentDataManager.m", 135, "*fildes != -1");
  }
  memset(&v39, 0, sizeof(v39));
  if (fstat(v5, &v39) == -1)
  {
    if (currentLogLevel < 3) {
      goto LABEL_48;
    }
    int v10 = _AALog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    unint64_t v21 = absTimeNS();
    if (v21 == -1) {
      double v22 = INFINITY;
    }
    else {
      double v22 = (double)v21 / 1000000000.0;
    }
    unint64_t v23 = __error();
    double v24 = strerror(*v23);
    *(_DWORD *)buf = 134218498;
    double v41 = v22;
    __int16 v42 = 2080;
    uint64_t v43 = "com.apple.AttentionAwareness";
    __int16 v44 = 2080;
    v45 = v24;
    dispatch_time_t v25 = "%13.5f: AW SHARED MEM: failed to fstat %s shm object: %s";
    audit_token_t v26 = v10;
    uint32_t v27 = 32;
    goto LABEL_37;
  }
  uint64_t v7 = (off_t *)MEMORY[0x1E4F14B00];
  off_t v8 = *MEMORY[0x1E4F14B00];
  if (v39.st_size && v39.st_size != v8)
  {
    if (shm_unlink("com.apple.AttentionAwareness") == -1)
    {
      if (currentLogLevel < 3) {
        goto LABEL_48;
      }
      unint64_t v12 = _AALog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      unint64_t v13 = absTimeNS();
      if (v13 == -1) {
        double v14 = INFINITY;
      }
      else {
        double v14 = (double)v13 / 1000000000.0;
      }
      double v28 = __error();
      unint64_t v29 = strerror(*v28);
      *(_DWORD *)buf = 134218498;
      double v41 = v14;
      __int16 v42 = 2080;
      uint64_t v43 = "com.apple.AttentionAwareness";
      __int16 v44 = 2080;
      v45 = v29;
      double v30 = "%13.5f: AW SHARED MEM: failed to unlink %s shm object: %s";
    }
    else if (close(*a3) == -1)
    {
      if (currentLogLevel < 3) {
        goto LABEL_48;
      }
      unint64_t v12 = _AALog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      unint64_t v15 = absTimeNS();
      if (v15 == -1) {
        double v16 = INFINITY;
      }
      else {
        double v16 = (double)v15 / 1000000000.0;
      }
      uint32_t v31 = __error();
      unint64_t v32 = strerror(*v31);
      *(_DWORD *)buf = 134218498;
      double v41 = v16;
      __int16 v42 = 2080;
      uint64_t v43 = "com.apple.AttentionAwareness";
      __int16 v44 = 2080;
      v45 = v32;
      double v30 = "%13.5f: AW SHARED MEM: failed to close open fildes for %s shm object: %s";
    }
    else
    {
      int v9 = shm_open("com.apple.AttentionAwareness", 514, 384);
      *a3 = v9;
      if (v9 != -1)
      {
        off_t v8 = *v7;
        goto LABEL_15;
      }
      if (currentLogLevel < 3) {
        goto LABEL_48;
      }
      unint64_t v12 = _AALog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_47:

        goto LABEL_48;
      }
      unint64_t v19 = absTimeNS();
      if (v19 == -1) {
        double v20 = INFINITY;
      }
      else {
        double v20 = (double)v19 / 1000000000.0;
      }
      __int16 v36 = __error();
      uint64_t v37 = strerror(*v36);
      *(_DWORD *)buf = 134218498;
      double v41 = v20;
      __int16 v42 = 2080;
      uint64_t v43 = "com.apple.AttentionAwareness";
      __int16 v44 = 2080;
      v45 = v37;
      double v30 = "%13.5f: AW SHARED MEM: failed to reopen %s shm object: %s";
    }
    _os_log_error_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
    goto LABEL_47;
  }
  if (v39.st_size) {
    return 1;
  }
  int v9 = *a3;
LABEL_15:
  if (ftruncate(v9, v8) != -1) {
    return 1;
  }
  if (currentLogLevel >= 3)
  {
    int v10 = _AALog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_48;
    }
    unint64_t v17 = absTimeNS();
    if (v17 == -1) {
      double v18 = INFINITY;
    }
    else {
      double v18 = (double)v17 / 1000000000.0;
    }
    off_t v33 = *v7;
    __int16 v34 = __error();
    int v35 = strerror(*v34);
    *(_DWORD *)buf = 134218754;
    double v41 = v18;
    __int16 v42 = 2080;
    uint64_t v43 = "com.apple.AttentionAwareness";
    __int16 v44 = 2048;
    v45 = (char *)v33;
    __int16 v46 = 2080;
    uint32_t v47 = v35;
    dispatch_time_t v25 = "%13.5f: AW SHARED MEM: failed to truncate %s shm object to %lu: %s";
    audit_token_t v26 = v10;
    uint32_t v27 = 42;
LABEL_37:
    _os_log_error_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_12;
  }
LABEL_48:
  if (!a4) {
    return 0;
  }
  id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  BOOL result = 0;
  *a4 = v38;
  return result;
}

+ (BOOL)validateAWPersistentDataHeader:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    __assert_rtn("+[AWPersistentDataManager validateAWPersistentDataHeader:]", "PersistentDataManager.m", 99, "hdr");
  }
  if (a3->var0 == 1)
  {
    if (a3->var1 == 32)
    {
      int v4 = (uint64_t *)MEMORY[0x1E4F14B00];
      if (a3->var2 == *MEMORY[0x1E4F14B00])
      {
        if (a3->var3 == 88) {
          return 1;
        }
        if (currentLogLevel >= 3)
        {
          objc_super v6 = _AALog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            unint64_t v13 = absTimeNS();
            if (v13 == -1) {
              double v14 = INFINITY;
            }
            else {
              double v14 = (double)v13 / 1000000000.0;
            }
            unint64_t var3 = a3->var3;
            int v21 = 134218496;
            double v22 = v14;
            __int16 v23 = 2048;
            unint64_t v24 = var3;
            __int16 v25 = 2048;
            uint64_t v26 = 88;
            double v16 = "%13.5f: AW SHARED MEM: unexpected client size %llu, expected %llu";
LABEL_31:
            _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, 0x20u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
      }
      else if (currentLogLevel >= 3)
      {
        objc_super v6 = _AALog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          unint64_t v11 = absTimeNS();
          if (v11 == -1) {
            double v12 = INFINITY;
          }
          else {
            double v12 = (double)v11 / 1000000000.0;
          }
          unint64_t var2 = a3->var2;
          uint64_t v19 = *v4;
          int v21 = 134218496;
          double v22 = v12;
          __int16 v23 = 2048;
          unint64_t v24 = var2;
          __int16 v25 = 2048;
          uint64_t v26 = v19;
          double v16 = "%13.5f: AW SHARED MEM: unexpected shared memory size %llu, expected %llu";
          goto LABEL_31;
        }
LABEL_32:
      }
    }
    else if (currentLogLevel >= 3)
    {
      objc_super v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v9 = absTimeNS();
        if (v9 == -1) {
          double v10 = INFINITY;
        }
        else {
          double v10 = (double)v9 / 1000000000.0;
        }
        unint64_t var1 = a3->var1;
        int v21 = 134218496;
        double v22 = v10;
        __int16 v23 = 2048;
        unint64_t v24 = var1;
        __int16 v25 = 2048;
        uint64_t v26 = 32;
        double v16 = "%13.5f: AW SHARED MEM: unexpected header size %llu, expected %llu";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (currentLogLevel >= 3)
  {
    objc_super v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      unint64_t var0 = a3->var0;
      int v21 = 134218496;
      double v22 = v8;
      __int16 v23 = 2048;
      unint64_t v24 = var0;
      __int16 v25 = 2048;
      uint64_t v26 = 1;
      double v16 = "%13.5f: AW SHARED MEM: unexpected header version %llu, expected %llu";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  return 0;
}

+ (void)initAWPersistentDataHeader:(id *)a3
{
  if (!a3) {
    __assert_rtn("+[AWPersistentDataManager initAWPersistentDataHeader:]", "PersistentDataManager.m", 90, "hdr");
  }
  *(_OWORD *)&a3->unint64_t var0 = xmmword_1B3B87450;
  a3->unint64_t var2 = *MEMORY[0x1E4F14B00];
  a3->unint64_t var3 = 88;
}

+ (BOOL)AWPersistentDataExists:(int *)a3
{
  if (!a3) {
    __assert_rtn("+[AWPersistentDataManager AWPersistentDataExists:]", "PersistentDataManager.m", 77, "fildes");
  }
  int v4 = shm_open("com.apple.AttentionAwareness", 2562, 384);
  *a3 = v4;
  return v4 == -1 && *__error() == 17;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_223);
  }
  uint64_t v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __40__AWPersistentDataManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(AWPersistentDataManager);

  return MEMORY[0x1F41817F8]();
}

@end