@interface CSJournalProcessor
- (BOOL)isComplete;
- (BOOL)isProtectedIndex;
- (BOOL)processNext:(id)a3 startingBatch:(id)a4 endingBatch:(id)a5 completion:(id)a6;
- (BOOL)setupFromSpotlightDaemonJournalWithParentFd:(int)a3;
- (BOOL)setupFromTopLevelJournalWithParentFd:(int)a3;
- (BOOL)setupWithParentFd:(int)a3 name:(id)a4;
- (BOOL)writeUpdaterProgressToStoreWithIndexType:(int)a3 UUID:(const char *)a4 serialNumber:(unint64_t)a5 error:(id)a6;
- (CSJournalProcessor)init;
- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 indexType:(int)a5 journalNumber:(unint64_t)a6 journalCookie:(id)a7 name:(id)a8;
- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 indexType:(int)a6 journalIno:(unint64_t)a7 dev:(int)a8 journalNumber:(unint64_t)a9 journalCookie:(const char *)a10 journalName:(const char *)a11;
- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 msg:(id)a6;
- (id)completionHandler;
- (id)description;
- (id)initFromSpotlightDaemonWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 msg:(id)a6;
- (int)linkFileAtPath:(char *)a3 parentFd:(int)a4 fileName:(const char *)a5;
- (int)retainJournalFd;
- (int)retainProcessedFd;
- (int)retainTocFd;
- (void)_processOffsetAtOffset:(int64_t)a3 startingBatch:(id)a4 endingBatch:(id)a5 completion:(id)a6;
- (void)cooldown;
- (void)dealloc;
- (void)deleteFiles;
- (void)markComplete:(int64_t)a3 processingDone:(BOOL)a4;
- (void)releaseJournalFd;
- (void)releaseProcessedFd;
- (void)releaseTocFd;
- (void)retainJournalUsingFd:(int)a3;
- (void)setCompletionHandler:(id)a3;
- (void)warmup;
@end

@implementation CSJournalProcessor

- (BOOL)writeUpdaterProgressToStoreWithIndexType:(int)a3 UUID:(const char *)a4 serialNumber:(unint64_t)a5 error:(id)a6
{
  uint64_t v10 = +[SKGUpdaterStore instanceForIndexType:*(void *)&a3];
  v11 = (void *)v10;
  if (a4 && !a6 && v10)
  {
    eventListener = self->_eventListener;
    if (eventListener) {
      delegate = eventListener->_delegate;
    }
    else {
      delegate = 0;
    }
    objc_msgSend(v11, "writeUpdaterStatus:UUID:serialNumber:", -[CSEventListenerDelegate eventType](delegate, "eventType"), a4, a5);
  }

  return 0;
}

- (void)_processOffsetAtOffset:(int64_t)a3 startingBatch:(id)a4 endingBatch:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = a6;
  eventListener = self->_eventListener;
  if (eventListener) {
    eventListener = (CSEventListener *)eventListener->_delegate;
  }
  v97 = eventListener;
  id v14 = [(CSEventListener *)eventListener eventType];
  unsigned int indexType = self->_indexType;
  int v15 = [(CSJournalProcessor *)self retainTocFd];
  v100 = v11;
  v101 = v10;
  if (v15 == -1)
  {
    unsigned int err = self->_err;
    if (err) {
      uint64_t v21 = err;
    }
    else {
      uint64_t v21 = 0xFFFFFFFFLL;
    }
    ((void (*)(NSObject *, id, void, uint64_t, int64_t))v12[2].isa)(v12, v14, indexType, v21, a3);
    goto LABEL_20;
  }
  unsigned int v98 = v14;
  unsigned int v16 = [(CSJournalProcessor *)self retainJournalFd];
  if (v16 == -1)
  {
    [(CSJournalProcessor *)self releaseTocFd];
    unsigned int v22 = self->_err;
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0xFFFFFFFFLL;
    }
    ((void (*)(NSObject *, id, void, uint64_t, int64_t))v12[2].isa)(v12, (id)v98, indexType, v23, a3);
    goto LABEL_20;
  }
  memset(&v126, 0, sizeof(v126));
  int v96 = v15;
  if (fstat(v15, &v126))
  {
    v17 = sub_100050698();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000A1ADC();
    }

    [(CSJournalProcessor *)self releaseTocFd];
    [(CSJournalProcessor *)self releaseJournalFd];
    unsigned int v18 = self->_err;
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
LABEL_11:
    ((void (*)(NSObject *, id, void, uint64_t, int64_t))v12[2].isa)(v12, (id)v98, indexType, v19, a3);
    goto LABEL_20;
  }
  size_t v24 = (v126.st_size + vm_page_size - 1) & -(uint64_t)vm_page_size;
  v25 = (char *)mmap(0, v24, 1, 1, v96, 0);
  if (v25 == (char *)-1)
  {
    v79 = sub_100050698();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_1000A1884();
    }

    [(CSJournalProcessor *)self releaseTocFd];
    [(CSJournalProcessor *)self releaseJournalFd];
    unsigned int v80 = self->_err;
    if (v80) {
      uint64_t v19 = v80;
    }
    else {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    goto LABEL_11;
  }
  v26 = self->_eventListener;
  if (v26)
  {
    excludedBundleHashes = v26->_excludedBundleHashes;
    int v28 = (LOBYTE(v26->_eventFlags) >> 3) & 1;
    v26 = (CSEventListener *)v26->_includedBundleHashes;
    char v29 = v28;
  }
  else
  {
    excludedBundleHashes = 0;
    char v29 = 0;
  }
  unint64_t v95 = (unint64_t)excludedBundleHashes;
  char v94 = v29;
  v93 = v26;
  makeThreadId();
  unsigned int v92 = v16;
  v30 = v25;
  uint64_t v31 = 0;
  v32 = v12;
  while (1)
  {
    int64_t v33 = a3;
    v90 = v32;
    if (!v32)
    {
      v78 = 0;
      v76 = v30;
      uint64_t v77 = v31;
      goto LABEL_94;
    }
    if (a3 < 0)
    {
      uint64_t v81 = v31;
      v82 = sub_100050698();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_1000A18F8();
      }

      v76 = v30;
      uint64_t v77 = v81;
      goto LABEL_93;
    }
    unsigned int v91 = v31;
    a3 += 32;
    if (v33 + 32 <= v126.st_size)
    {
      off_t st_size = v126.st_size;
      goto LABEL_34;
    }
    if (fstat(v96, &v126))
    {
      v84 = sub_100050698();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        sub_1000A1A74();
      }

LABEL_91:
      v76 = v30;
LABEL_92:
      uint64_t v77 = v91;
LABEL_93:
      v78 = v90;
LABEL_94:
      uint64_t v85 = v77;
      munmap(v76, v126.st_size);
      v86 = v78;
      goto LABEL_95;
    }
    if (v126.st_size < a3) {
      goto LABEL_91;
    }
    off_t st_size = v126.st_size;
    if (((v126.st_size + vm_page_size - 1) & -(uint64_t)vm_page_size) > v24) {
      break;
    }
LABEL_34:
    char v125 = 0;
    size_t v88 = v24;
    v89 = v30;
    v124[0] = v30;
    v124[1] = st_size;
    v124[2] = 0;
    uint64_t v122 = 1;
    v123 = v124;
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    *(_DWORD *)v129 = 0;
    *(_DWORD *)buf = 0;
    unint64_t v121 = 0;
    long long v36 = sMappingExceptionCallbacks[1];
    *(_OWORD *)&v116.st_dev = sMappingExceptionCallbacks[0];
    *(_OWORD *)&v116.st_uid = v36;
    timespec v37 = (timespec)sMappingExceptionCallbacks[3];
    v116.st_atimespec = (timespec)sMappingExceptionCallbacks[2];
    v116.st_mtimespec = v37;
    uint64_t v38 = setThreadIdAndInfo();
    *(_DWORD *)buf = HIDWORD(v38);
    *(_DWORD *)v129 = v38;
    unint64_t v121 = __PAIR64__(v39, v40);
    uint64_t v41 = threadData[9 * v38 + 1];
    uint64_t v42 = v41 + 320 * HIDWORD(v38);
    *(unsigned char *)(v42 + 216) = 0;
    int v43 = *(_DWORD *)(v42 + 312);
    v44 = *(void (**)(void))(v42 + 224);
    if (v44) {
      v44(*(void *)(v41 + 320 * HIDWORD(v38) + 288));
    }
    v116.st_dev = *(_DWORD *)v129;
    unsigned int v120 = *(_DWORD *)buf;
    unint64_t v119 = v121;
    if (_setjmp((int *)v42))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A1A30(&v117, v118);
      }
      *(_DWORD *)(v42 + 312) = v43;
      CIOnThreadCleanUpReset();
      dropThreadId();
      CICleanUpReset();
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      int v49 = 0;
    }
    else
    {
      uint64_t v50 = *(void *)&v30[v33];
      uint64_t v51 = *(void *)&v30[v33 + 8];
      uint64_t v52 = *(void *)&v30[v33 + 16];
      uint64_t v54 = *(unsigned int *)&v30[v33 + 24];
      int v53 = *(_DWORD *)&v30[v33 + 28];
      char v125 = 1;
      uint64_t v55 = threadData[9 * v116.st_dev + 1];
      unsigned int v56 = v120;
      uint64_t v57 = v55 + 320 * v120;
      *(_DWORD *)(v57 + 312) = v43;
      v58 = *(void (**)(void))(v57 + 232);
      if (v58) {
        v58(*(void *)(v55 + 320 * v56 + 288));
      }
      dropThreadId();
      uint64_t v46 = v50;
      uint64_t v48 = v52;
      uint64_t v45 = v54;
      uint64_t v47 = v51;
      int v49 = v53;
    }
    if (!v125)
    {
      v83 = sub_100050698();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        sub_1000A19C8();
      }

      v76 = v89;
      goto LABEL_92;
    }
    char v59 = v94;
    if ((v49 & 4) != 0) {
      char v59 = 0;
    }
    if ((v59 & 1) == 0)
    {
      if (!((unint64_t)v93 | v95)) {
        goto LABEL_55;
      }
      v60 = +[NSNumber numberWithUnsignedInt:v45];
      if ((!v93 || [(CSEventListener *)v93 containsObject:v60])
        && (!v95 || ![(id)v95 containsObject:v60]))
      {

LABEL_55:
        memset(&v116, 0, sizeof(v116));
        if (fstat(v92, &v116) == -1)
        {
          uint64_t v66 = *__error();
          v67 = sub_100050698();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v129 = 67109378;
            *(_DWORD *)&v129[4] = v66;
            *(_WORD *)&v129[8] = 2112;
            *(void *)&v129[10] = self;
            _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "### journal stat err %d - %@", v129, 0x12u);
          }

          int v65 = 3;
          a3 = v33;
          uint64_t v62 = v66;
LABEL_63:
          v68 = v90;
        }
        else
        {
          if (v116.st_size < (unint64_t)(v48 + v47))
          {
            v64 = sub_100050698();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v129 = 134218498;
              *(void *)&v129[4] = v116.st_size;
              *(_WORD *)&v129[12] = 2048;
              *(void *)&v129[14] = v48 + v47;
              *(_WORD *)&v129[22] = 2112;
              v130 = self;
              _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "### journal journal size %lld expected %llu - %@", v129, 0x20u);
            }

            uint64_t v62 = 22;
            int v65 = 3;
            a3 = v33;
            goto LABEL_63;
          }
          *(void *)v129 = 0;
          *(void *)&v129[8] = v129;
          *(void *)&v129[16] = 0x2020000000;
          LOBYTE(v130) = 0;
          v102[0] = _NSConcreteStackBlock;
          v102[1] = 3221225472;
          v102[2] = sub_100011A0C;
          v102[3] = &unk_1000DB390;
          unsigned int v114 = indexType;
          uint64_t v108 = v47;
          uint64_t v109 = v48;
          int v110 = v45;
          int v111 = v49;
          uint64_t v107 = v46;
          v102[4] = self;
          v112 = v97;
          id v103 = v101;
          unsigned int v115 = v98;
          id v104 = v100;
          int64_t v113 = a3;
          v69 = v90;
          v105 = v69;
          v106 = v129;
          +[SKGJournalReader processJournalRecordWithFd:v92 atOffset:v47 withSize:v48 usingBlock:v102];
          v68 = v69;
          if (*(unsigned char *)(*(void *)&v129[8] + 24))
          {
            v70 = v69;
            int v71 = 0;
            v68 = 0;
            goto LABEL_70;
          }
          if (+[CSEventListenerTasksManager isTaskCancelled:v98 indexType:indexType])
          {
            v70 = sub_100050698();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              id v72 = [(CSEventListener *)v97 taskName];
              id v73 = [v72 UTF8String];
              *(_DWORD *)buf = 136315138;
              id v128 = v73;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "### Not processing next journal entry for %s because task is cancelled", buf, 0xCu);
            }
            int v71 = 3;
LABEL_70:
            int v65 = v71;
          }
          else
          {
            int v65 = 0;
          }

          _Block_object_dispose(v129, 8);
          uint64_t v62 = v91;
        }
        int v61 = v65;
        v63 = v68;
        goto LABEL_73;
      }
    }
    int v61 = 2;
    uint64_t v62 = v91;
    v63 = v90;
LABEL_73:
    v74 = v63;
    uint64_t v31 = v62;
    int v75 = v61;
    size_t v24 = v88;
    v76 = v89;
    v30 = v89;
    int64_t v33 = a3;
    uint64_t v77 = v31;
    v78 = v74;
    v32 = v74;
    if (v75 == 3) {
      goto LABEL_94;
    }
  }
  munmap(v30, v24);
  size_t v24 = (v126.st_size + vm_page_size - 1) & -(uint64_t)vm_page_size;
  v35 = (char *)mmap(0, v24, 1, 1, v96, 0);
  if (v35 != (char *)-1)
  {
    v30 = v35;
    off_t st_size = v126.st_size;
    goto LABEL_34;
  }
  v87 = sub_100050698();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
    sub_1000A1960();
  }

  v86 = v90;
  uint64_t v85 = v91;
LABEL_95:
  [(CSJournalProcessor *)self releaseJournalFd];
  [(CSJournalProcessor *)self releaseTocFd];
  if (v86)
  {
    ((void (*)(NSObject *, void, void, uint64_t, int64_t))v86[2].isa)(v86, v98, indexType, v85, v33);
    v12 = v86;
  }
  else
  {
    v12 = 0;
  }
LABEL_20:
}

- (int)retainJournalFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int journal_fd = self->_journal_fd;
  if (journal_fd != -1
    || (int journal_fd = openat(self->_parentFD, self->_journal_name, 0), self->_int journal_fd = journal_fd, journal_fd != -1))
  {
    ++self->_journal_fd_retain_count;
  }
  os_unfair_lock_unlock(p_lock);
  return journal_fd;
}

- (void)releaseJournalFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int journal_fd = self->_journal_fd;
  if (journal_fd != -1)
  {
    int v5 = self->_journal_fd_retain_count - 1;
    self->_journal_fd_retain_count = v5;
    if (!v5)
    {
      self->_int journal_fd = -1;
      close(journal_fd);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)releaseTocFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int toc_fd = self->_toc_fd;
  if (toc_fd != -1)
  {
    int v5 = self->_toc_fd_retain_count - 1;
    self->_toc_fd_retain_count = v5;
    if (!v5)
    {
      self->_int toc_fd = -1;
      close(toc_fd);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (int)retainProcessedFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int processed_fd = self->_processed_fd;
  if (processed_fd != -1
    || (int processed_fd = openat(self->_parentFD, self->_processed_name, 514, 384),
        self->_int processed_fd = processed_fd,
        processed_fd != -1))
  {
    ++self->_processed_fd_retain_count;
  }
  os_unfair_lock_unlock(p_lock);
  return processed_fd;
}

- (void)releaseProcessedFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int processed_fd = self->_processed_fd;
  if (processed_fd != -1)
  {
    int v5 = self->_processed_fd_retain_count - 1;
    self->_processed_fd_retain_count = v5;
    if (!v5)
    {
      self->_int processed_fd = -1;
      close(processed_fd);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)warmup
{
  if (self->_warmedup)
  {
    self->_warmupFailCtr = 0;
    return;
  }
  unsigned int v3 = [(CSJournalProcessor *)self retainTocFd];
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v4 = -1;
  int v31 = -1;
  if (v3 == -1) {
    goto LABEL_25;
  }
  unsigned int v5 = [(CSJournalProcessor *)self retainJournalFd];
  *((_DWORD *)v29 + 6) = v5;
  if (*__error() == 1)
  {
    unsigned int v6 = [(CSJournalProcessor *)self isProtectedIndex];
    unsigned int v7 = *((_DWORD *)v29 + 6) == -1 ? v6 : 0;
    if (v7 == 1)
    {
      bzero(__s, 0x464uLL);
      if (fcntl(self->_parentFD, 50, __s) == -1 || (size_t v8 = strlen(__s)) == 0)
      {
        v12 = sub_100050698();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unsigned int v16 = __error();
          sub_1000A1824(v16, &self->_parentFD, buf, v12);
        }
      }
      else
      {
        __snprintf_chk(&__s[v8], 1024 - v8, 0, 0xFFFFFFFFFFFFFFFFLL, "/%s", self->_journal_name);
        v9 = +[NSString stringWithUTF8String:__s];
        id v10 = dispatch_group_create();
        dispatch_group_enter(v10);
        id v11 = +[CSSearchableIndex defaultSearchableIndex];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100059F64;
        v24[3] = &unk_1000DB320;
        v27 = &v28;
        v12 = v9;
        v25 = v12;
        v13 = v10;
        v26 = v13;
        [v11 _openJournalFile:v12 completionHandler:v24];

        dispatch_time_t v14 = dispatch_time(0, 10000000000);
        if (dispatch_group_wait(v13, v14))
        {
          int v15 = sub_100050698();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v33 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "### timeout openning journal file (%@) from searchd, continuing to wait", buf, 0xCu);
          }
        }
      }

      if ((v29[3] & 0x80000000) == 0) {
        -[CSJournalProcessor retainJournalUsingFd:](self, "retainJournalUsingFd:");
      }
    }
  }
  if (*((_DWORD *)v29 + 6) == -1)
  {
    int v4 = -1;
LABEL_25:
    if (*__error() == 24) {
      __assert_rtn("-[CSJournalProcessor warmup]", "CSEventListenerManager.m", 1578, "errno != EMFILE");
    }
    unsigned int v18 = sub_100050698();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      journal_name = self->_journal_name;
      int v20 = *((_DWORD *)v29 + 6);
      int v21 = *__error();
      unsigned int v22 = __error();
      uint64_t v23 = strerror(*v22);
      *(_DWORD *)__s = 136316418;
      v35 = journal_name;
      __int16 v36 = 1024;
      unsigned int v37 = v3;
      __int16 v38 = 1024;
      int v39 = v20;
      __int16 v40 = 1024;
      int v41 = v4;
      __int16 v42 = 1024;
      int v43 = v21;
      __int16 v44 = 2080;
      uint64_t v45 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to warmup journal:%s tfd:%d jfd:%d pfd:%d error:%d(%s)", (uint8_t *)__s, 0x2Eu);
    }

    if (v3 != -1) {
      [(CSJournalProcessor *)self releaseTocFd];
    }
    if (*((_DWORD *)v29 + 6) != -1) {
      [(CSJournalProcessor *)self releaseJournalFd];
    }
    if (v4 != -1) {
      [(CSJournalProcessor *)self releaseProcessedFd];
    }
    ++self->_warmupFailCtr;
    goto LABEL_35;
  }
  unsigned int v17 = [(CSJournalProcessor *)self retainProcessedFd];
  int v4 = v17;
  if (*((_DWORD *)v29 + 6) == -1 || v17 == -1) {
    goto LABEL_25;
  }
  self->_warmedup = 1;
  self->_warmupFailCtr = 0;
LABEL_35:
  _Block_object_dispose(&v28, 8);
}

- (BOOL)processNext:(id)a3 startingBatch:(id)a4 endingBatch:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->_active)
  {
    int v16 = [(CSJournalProcessor *)self retainTocFd];
    if (v16 == -1)
    {
      int v21 = sub_100050698();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v31 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "### ignored journal - failed retainTocFd - %@", buf, 0xCu);
      }
    }
    else
    {
      int64_t toc_processed = self->_toc_processed;
      int64_t toc_file_size = self->_toc_file_size;
      if (toc_file_size > toc_processed
        || (off_t v19 = lseek(v16, 0, 2), toc_file_size = v19, v19 < 1)
        || (self->_int64_t toc_file_size = v19, v19 >= toc_processed))
      {
        if (toc_processed != toc_file_size)
        {
          self->_active = 1;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10000BEA0;
          v25[3] = &unk_1000DB3E0;
          v25[4] = self;
          int64_t v29 = toc_processed;
          id v26 = v11;
          id v27 = v12;
          id v28 = v13;
          uint64_t v23 = objc_retainBlock(v25);
          if (+[CSEventListenerTasksManager turboMode])
          {
            size_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v23);

            uint64_t v23 = v24;
          }
          dispatch_async(v10, v23);

          goto LABEL_5;
        }
        int64_t toc_file_size = toc_processed;
      }
      else
      {
        self->_int64_t toc_processed = v19;
      }
      [(CSJournalProcessor *)self releaseTocFd];
      int v20 = sub_100050698();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        int v31 = (CSJournalProcessor *)toc_file_size;
        __int16 v32 = 2048;
        int64_t v33 = toc_file_size;
        __int16 v34 = 2112;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "### ignored journal at: %lld file size: %lld - startOffset == fileSize - %@. We're probably at the end of the file.", buf, 0x20u);
      }
    }
    BOOL v15 = 0;
    goto LABEL_20;
  }
  dispatch_time_t v14 = sub_100050698();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v31 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "### ignored journal - already active - %@", buf, 0xCu);
  }

LABEL_5:
  BOOL v15 = 1;
LABEL_20:

  return v15;
}

- (int)retainTocFd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int toc_fd = self->_toc_fd;
  if (toc_fd != -1 || (int toc_fd = openat(self->_parentFD, self->_toc_name, 0), self->_int toc_fd = toc_fd, toc_fd != -1)) {
    ++self->_toc_fd_retain_count;
  }
  os_unfair_lock_unlock(p_lock);
  return toc_fd;
}

- (BOOL)isComplete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_err || self->_complete && self->_toc_processed >= self->_toc_complete_size;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)setupFromTopLevelJournalWithParentFd:(int)a3
{
  if (a3 == -1
    || !self->_dev
    || (unint64_t journalIno = self->_journalIno) == 0
    || (unint64_t journalNumber = self->_journalNumber) == 0
    || (journal_orig_name = self->_journal_orig_name) == 0
    || (journal_cookie = self->_journal_cookie) == 0
    || !self->_key)
  {
    int v10 = -1;
    return v10 == 0;
  }
  memset(v29, 0, sizeof(v29));
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.journal", journal_orig_name, journal_cookie, journalIno, journalNumber);
  bzero(v14, 0x400uLL);
  bzero(v13, 0x400uLL);
  sub_10000F120(self->_indexType, self->_journal_cookie, self->_journal_orig_name, self->_journalNumber, self->_dev, self->_journalIno, v13);
  sub_10000F060(self->_indexType, self->_journal_cookie, self->_journal_orig_name, self->_journalNumber, self->_dev, v14);
  if ([(CSJournalProcessor *)self linkFileAtPath:v13 parentFd:self->_parentFD fileName:__str] == -1)
  {
    id v12 = sub_100050698();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  self->_journal_name = strdup(__str);
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.toc", self->_journal_orig_name, self->_journal_cookie, self->_journalIno, self->_journalNumber);
  if ([(CSJournalProcessor *)self linkFileAtPath:v14 parentFd:self->_parentFD fileName:__str] == -1)
  {
    id v12 = sub_100050698();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_18:
    }
      sub_1000A1774();
LABEL_19:

    int v10 = *__error();
    return v10 == 0;
  }
  self->_toc_name = strdup(__str);
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.processed", self->_journal_orig_name, self->_journal_cookie, self->_journalIno, self->_journalNumber);
  int v8 = openat(self->_parentFD, __str, 514, 384);
  if (v8 != -1) {
    close(v8);
  }
  v9 = strdup(__str);
  int v10 = 0;
  self->_processed_name = v9;
  return v10 == 0;
}

- (int)linkFileAtPath:(char *)a3 parentFd:(int)a4 fileName:(const char *)a5
{
  if (!a3) {
    return -1;
  }
  int result = -1;
  if (a5 && a4 != -1 && *a3 && *a5)
  {
    memset(&v20, 0, sizeof(v20));
    if (stat(a3, &v20) == -1)
    {
      BOOL v15 = sub_100050698();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000A1BCC();
      }
      goto LABEL_22;
    }
    dev_t st_dev = v20.st_dev;
    __darwin_ino64_t st_ino = v20.st_ino;
    bzero(__s, 0x400uLL);
    if (fcntl(a4, 50, __s) == -1 || (size_t v12 = strlen(__s)) == 0)
    {
      BOOL v15 = sub_100050698();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000A1C50(a4, v15);
      }
      goto LABEL_22;
    }
    snprintf(&__s[v12], 1024 - v12, "/%s", a5);
    if (stat(__s, &v20) == -1)
    {
      int v13 = link(a3, __s);
      dispatch_time_t v14 = sub_100050698();
      BOOL v15 = v14;
      if (v13 == -1)
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          return -1;
        }
        int v19 = *__error();
        *(_DWORD *)buf = 138413058;
        long long v22 = self;
        __int16 v23 = 1024;
        *(_DWORD *)long long v24 = v19;
        *(_WORD *)&void v24[4] = 2080;
        *(void *)&v24[6] = a3;
        __int16 v25 = 2080;
        *(void *)long long v26 = __s;
        long long v16 = "### %@ error %d creating hardlink %s to %s";
        long long v17 = v15;
        uint32_t v18 = 38;
LABEL_31:
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
        goto LABEL_22;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v22 = a3;
        __int16 v23 = 2080;
        *(void *)long long v24 = __s;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "### created hardlink %s to %s", buf, 0x16u);
      }
    }
    if (stat(__s, &v20) == -1)
    {
      BOOL v15 = sub_100050698();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000A1CEC();
      }
      goto LABEL_22;
    }
    if (v20.st_dev == st_dev && v20.st_ino == st_ino) {
      return 0;
    }
    BOOL v15 = sub_100050698();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138413314;
    long long v22 = self;
    __int16 v23 = 1024;
    *(_DWORD *)long long v24 = st_dev;
    *(_WORD *)&void v24[4] = 2048;
    *(void *)&v24[6] = st_ino;
    __int16 v25 = 1024;
    *(_DWORD *)long long v26 = v20.st_dev;
    *(_WORD *)&v26[4] = 2048;
    *(void *)&v26[6] = v20.st_ino;
    long long v16 = "### %@ error %d:%lld != %d:%lld";
    long long v17 = v15;
    uint32_t v18 = 44;
    goto LABEL_31;
  }
  return result;
}

- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 msg:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_time_t v14 = [(CSJournalProcessor *)self init];
  BOOL v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_key, a5);
    v15->_parentFD = v9;
    v15->_unsigned int indexType = sub_10000F9BC((uint64_t)v13);
    v15->_unint64_t journalNumber = sub_10000F9B0((uint64_t)v13);
    long long v16 = (const char *)sub_10000F9C8((uint64_t)v13);
    v15->_journal_orig_name = strdup(v16);
    long long v17 = (const char *)sub_10000F9A4((uint64_t)v13);
    v15->_journal_cookie = strdup(v17);
    objc_storeStrong((id *)&v15->_eventListener, a4);
    v15->_dev = sub_10000F880((uint64_t)v13);
    v15->_unint64_t journalIno = sub_10000F874((uint64_t)v13);
    v15->_lock._os_unfair_lock_opaque = 0;
    v15->_toc_retry_counter = 0;
    if (![(CSJournalProcessor *)v15 setupFromTopLevelJournalWithParentFd:v9])
    {

      BOOL v15 = 0;
    }
  }

  return v15;
}

- (CSJournalProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSJournalProcessor;
  int result = [(CSJournalProcessor *)&v3 init];
  if (result)
  {
    result->_parentFD = -1;
    result->_int journal_fd = -1;
    result->_int toc_fd = -1;
    result->_int processed_fd = -1;
  }
  return result;
}

- (id)description
{
  BOOL complete = self->_complete;
  id v4 = objc_alloc((Class)NSString);
  uint64_t v5 = objc_opt_class();
  eventListener = self->_eventListener;
  if (complete)
  {
    if (eventListener) {
      eventListener = (CSEventListener *)eventListener->_delegate;
    }
    unsigned int v7 = eventListener;
    id v8 = objc_msgSend(v4, "initWithFormat:", @"<%@:%p:%u; n: %llu pfd: %d offset: %lld sz: %lld csz: %lld err: %d (%@)>",
           v5,
           self,
           [(CSEventListener *)v7 eventType],
           self->_journalNumber,
           self->_parentFD,
           self->_toc_processed,
           self->_toc_file_size,
           self->_toc_complete_size,
           self->_err,
           self->_key);
  }
  else
  {
    if (eventListener) {
      eventListener = (CSEventListener *)eventListener->_delegate;
    }
    unsigned int v7 = eventListener;
    id v8 = objc_msgSend(v4, "initWithFormat:", @"<%@:%p:%u; n: %llu pfd: %d offset: %lld sz: %lld err: %d (%@)>",
           v5,
           self,
           [(CSEventListener *)v7 eventType],
           self->_journalNumber,
           self->_parentFD,
           self->_toc_processed,
           self->_toc_file_size,
           self->_err,
           self->_key,
           v11);
  }
  uint64_t v9 = v8;

  return v9;
}

- (BOOL)isProtectedIndex
{
  return (self->_indexType < 5u) & (0x16u >> self->_indexType);
}

- (BOOL)setupWithParentFd:(int)a3 name:(id)a4
{
  id v6 = a4;
  memset(&v39, 0, sizeof(v39));
  if (fstat(a3, &v39) == -1)
  {
LABEL_33:
    int v32 = *__error();
    goto LABEL_34;
  }
  dev_t st_dev = v39.st_dev;
  strncpy(__dst, (const char *)[v6 fileSystemRepresentation], 0xFFuLL);
  size_t v8 = strlen(__dst);
  uint64_t v9 = 0;
  int v10 = &__dst[v8];
  uint64_t v11 = &__dst[v8 - 1];
  do
  {
    id v12 = v9;
    if (v11 <= __dst)
    {
      if (v9) {
        goto LABEL_12;
      }
      goto LABEL_32;
    }
    uint64_t v9 = v11;
    int v14 = *v11--;
    int v13 = v14;
  }
  while ((v14 - 48) < 0xA);
  if (v13 != 95 || v12 == 0) {
    goto LABEL_32;
  }
LABEL_12:
  __endptr = 0;
  unint64_t v16 = strtoll(v12, &__endptr, 0);
  if (!v16)
  {
LABEL_32:
    int v32 = -1;
    goto LABEL_34;
  }
  long long v17 = 0;
  self->_unint64_t journalNumber = v16;
  uint32_t v18 = v12 - 2;
  do
  {
    int v19 = v17;
    if (v18 <= __dst)
    {
      if (!v17) {
        goto LABEL_32;
      }
      goto LABEL_23;
    }
    long long v17 = v18;
    int v21 = *(unsigned __int8 *)v18--;
    int v20 = v21;
  }
  while ((v21 - 48) < 0xA);
  if (v20 != 95 || v19 == 0) {
    goto LABEL_32;
  }
LABEL_23:
  uint64_t v23 = strtoll(v19, &__endptr, 0);
  if (!v23) {
    goto LABEL_32;
  }
  long long v59 = 0u;
  memset(v60, 0, sizeof(v60));
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
  *(_OWORD *)__str = 0u;
  snprintf(__str, 0xFFuLL, "/.vol/%u/%llu", st_dev, v23);
  long long v24 = +[NSString stringWithUTF8String:__str];
  key = self->_key;
  self->_key = v24;

  snprintf(v10, 255 - v8, ".journal");
  self->_journal_name = strdup(__dst);
  __dst[v8] = 0;
  snprintf(v10, 255 - v8, ".toc");
  int v26 = openat(a3, __dst, 0);
  if (v26 == -1) {
    goto LABEL_33;
  }
  int v27 = v26;
  self->_int64_t toc_file_size = lseek(v26, 0, 2);
  close(v27);
  self->_toc_name = strdup(__dst);
  *int v10 = 0;
  snprintf(v10, 255 - v8, ".processed");
  int v28 = openat(self->_parentFD, __dst, 514, 384);
  if (v28 != -1)
  {
    int v29 = v28;
    int64_t __buf = 0;
    self->_int64_t toc_processed = 0;
    if (pread(v28, &__buf, 8uLL, 0) == 8)
    {
      if (__buf < 0 || __buf > self->_toc_file_size)
      {
        memset(&v36, 0, sizeof(v36));
        int v30 = fstat(v29, &v36);
        int v31 = sub_10000BE40();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          int64_t v41 = __buf;
          __int16 v42 = 2048;
          off_t st_size = v36.st_size;
          __int16 v44 = 1024;
          int v45 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "### Invalid processed offset (%lld) read from processed file. DebugInfo : (size = %lld, stat_unsigned int err = %d)", buf, 0x1Cu);
        }

        self->_int64_t toc_processed = 0;
      }
      else
      {
        self->_int64_t toc_processed = __buf;
      }
    }
    close(v29);
  }
  v35 = strdup(__dst);
  int v32 = 0;
  self->_processed_name = v35;
  *int v10 = 0;
LABEL_34:
  BOOL v33 = v32 == 0;

  return v33;
}

- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 indexType:(int)a5 journalNumber:(unint64_t)a6 journalCookie:(id)a7 name:(id)a8
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  uint32_t v18 = [(CSJournalProcessor *)self init];
  int v19 = v18;
  if (v18)
  {
    v18->_parentFD = v13;
    v18->_unsigned int indexType = a5;
    objc_storeStrong((id *)&v18->_eventListener, a4);
    v19->_unint64_t journalNumber = a6;
    v19->_journal_cookie = strdup((const char *)[v16 UTF8String]);
    v19->_loaded = 1;
    v19->_lock._os_unfair_lock_opaque = 0;
    v19->_toc_retry_counter = 0;
    if (![(CSJournalProcessor *)v19 setupWithParentFd:v13 name:v17])
    {

      int v19 = 0;
    }
  }

  return v19;
}

- (BOOL)setupFromSpotlightDaemonJournalWithParentFd:(int)a3
{
  if (a3 == -1
    || !self->_dev
    || (unint64_t journalIno = self->_journalIno) == 0
    || (unint64_t journalNumber = self->_journalNumber) == 0
    || (journal_orig_name = self->_journal_orig_name) == 0
    || (journal_cookie = self->_journal_cookie) == 0
    || !self->_key)
  {
    int v10 = -1;
    return v10 == 0;
  }
  memset(v29, 0, sizeof(v29));
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.journal", journal_orig_name, journal_cookie, journalIno, journalNumber);
  bzero(v14, 0x400uLL);
  bzero(v13, 0x400uLL);
  sub_10003540C(self->_indexType, self->_journal_orig_name, self->_journalNumber, v13);
  sub_100035488(self->_indexType, self->_journal_orig_name, self->_journalNumber, v14);
  if ([(CSJournalProcessor *)self linkFileAtPath:v13 parentFd:self->_parentFD fileName:__str] == -1)
  {
    id v12 = sub_100050698();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  self->_journal_name = strdup(__str);
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.toc", self->_journal_orig_name, self->_journal_cookie, self->_journalIno, self->_journalNumber);
  if ([(CSJournalProcessor *)self linkFileAtPath:v14 parentFd:self->_parentFD fileName:__str] == -1)
  {
    id v12 = sub_100050698();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_18:
    }
      sub_1000A1774();
LABEL_19:

    int v10 = *__error();
    return v10 == 0;
  }
  self->_toc_name = strdup(__str);
  snprintf(__str, 0xFFuLL, "evt_%s_%s_%llu_%llu.processed", self->_journal_orig_name, self->_journal_cookie, self->_journalIno, self->_journalNumber);
  int v8 = openat(self->_parentFD, __str, 514, 384);
  if (v8 != -1) {
    close(v8);
  }
  uint64_t v9 = strdup(__str);
  int v10 = 0;
  self->_processed_name = v9;
  return v10 == 0;
}

- (id)initFromSpotlightDaemonWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 msg:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(CSJournalProcessor *)self init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_key, a5);
    v15->_parentFD = v9;
    v15->_unsigned int indexType = sub_10000F9BC((uint64_t)v13);
    v15->_unint64_t journalNumber = sub_10000F9B0((uint64_t)v13);
    long long v16 = (const char *)sub_10000F9C8((uint64_t)v13);
    v15->_journal_orig_name = strdup(v16);
    long long v17 = (const char *)sub_10000F9A4((uint64_t)v13);
    v15->_journal_cookie = strdup(v17);
    objc_storeStrong((id *)&v15->_eventListener, a4);
    v15->_dev = sub_10000F880((uint64_t)v13);
    v15->_unint64_t journalIno = sub_10000F874((uint64_t)v13);
    v15->_lock._os_unfair_lock_opaque = 0;
    v15->_toc_retry_counter = 0;
    if (![(CSJournalProcessor *)v15 setupFromSpotlightDaemonJournalWithParentFd:v9])
    {

      id v15 = 0;
    }
  }

  return v15;
}

- (CSJournalProcessor)initWithParentFd:(int)a3 eventListener:(id)a4 key:(id)a5 indexType:(int)a6 journalIno:(unint64_t)a7 dev:(int)a8 journalNumber:(unint64_t)a9 journalCookie:(const char *)a10 journalName:(const char *)a11
{
  uint64_t v16 = *(void *)&a3;
  id v18 = a4;
  id v19 = a5;
  long long v20 = [(CSJournalProcessor *)self init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_key, a5);
    v21->_parentFD = v16;
    v21->_unsigned int indexType = a6;
    v21->_unint64_t journalNumber = a9;
    v21->_journal_orig_name = strdup(a11);
    v21->_journal_cookie = strdup(a10);
    objc_storeStrong((id *)&v21->_eventListener, a4);
    v21->_dev = a8;
    v21->_unint64_t journalIno = a7;
    v21->_lock._os_unfair_lock_opaque = 0;
    v21->_toc_retry_counter = 0;
    if (![(CSJournalProcessor *)v21 setupFromTopLevelJournalWithParentFd:v16])
    {

      long long v21 = 0;
    }
  }

  return v21;
}

- (void)dealloc
{
  toc_name = (char *)self->_toc_name;
  if (toc_name) {
    free(toc_name);
  }
  journal_name = (char *)self->_journal_name;
  if (journal_name) {
    free(journal_name);
  }
  journal_orig_name = (char *)self->_journal_orig_name;
  if (journal_orig_name) {
    free(journal_orig_name);
  }
  journal_cookie = (char *)self->_journal_cookie;
  if (journal_cookie) {
    free(journal_cookie);
  }
  processed_name = (char *)self->_processed_name;
  if (processed_name) {
    free(processed_name);
  }
  v8.receiver = self;
  v8.super_class = (Class)CSJournalProcessor;
  [(CSJournalProcessor *)&v8 dealloc];
}

- (void)retainJournalUsingFd:(int)a3
{
  if (a3 < 0 || self->_journal_fd != -1) {
    sub_1000A17F8();
  }
  os_unfair_lock_lock(&self->_lock);
  int v5 = self->_journal_fd_retain_count + 1;
  self->_int journal_fd = a3;
  self->_journal_fd_retain_count = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)markComplete:(int64_t)a3 processingDone:(BOOL)a4
{
  int64_t v5 = a3;
  if (!a3)
  {
    int v7 = [(CSJournalProcessor *)self retainTocFd];
    if (v7 == -1)
    {
      int64_t v5 = 0;
    }
    else
    {
      off_t v8 = lseek(v7, 0, 2);
      int64_t v5 = v8 & ~(v8 >> 63);
      [(CSJournalProcessor *)self releaseTocFd];
    }
  }
  os_unfair_lock_lock(&self->_lock);
  self->_toc_complete_size = v5;
  self->_BOOL complete = 1;
  self->_processingDone = a4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)cooldown
{
  if (self->_warmedup)
  {
    self->_warmedup = 0;
    [(CSJournalProcessor *)self releaseTocFd];
    [(CSJournalProcessor *)self releaseJournalFd];
    [(CSJournalProcessor *)self releaseProcessedFd];
  }
}

- (void)deleteFiles
{
  int v3 = unlinkat(self->_parentFD, self->_journal_name, 2048);
  id v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (v3 == -1) {
      int v3 = *__error();
    }
    journal_name = self->_journal_name;
    int v12 = 67109634;
    int v13 = v3;
    __int16 v14 = 2112;
    id v15 = self;
    __int16 v16 = 2080;
    long long v17 = journal_name;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "### unlink (%d) %@ - %s ", (uint8_t *)&v12, 0x1Cu);
  }

  int v6 = unlinkat(self->_parentFD, self->_toc_name, 2048);
  int v7 = sub_100050698();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6 == -1) {
      int v6 = *__error();
    }
    toc_name = self->_toc_name;
    int v12 = 67109634;
    int v13 = v6;
    __int16 v14 = 2112;
    id v15 = self;
    __int16 v16 = 2080;
    long long v17 = toc_name;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "### unlink (%d) %@ - %s ", (uint8_t *)&v12, 0x1Cu);
  }

  int v9 = unlinkat(self->_parentFD, self->_processed_name, 2048);
  int v10 = sub_100050698();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9 == -1) {
      int v9 = *__error();
    }
    processed_name = self->_processed_name;
    int v12 = 67109634;
    int v13 = v9;
    __int16 v14 = 2112;
    id v15 = self;
    __int16 v16 = 2080;
    long long v17 = processed_name;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "### unlink (%d) %@ - %s ", (uint8_t *)&v12, 0x1Cu);
  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_itemHandler, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end