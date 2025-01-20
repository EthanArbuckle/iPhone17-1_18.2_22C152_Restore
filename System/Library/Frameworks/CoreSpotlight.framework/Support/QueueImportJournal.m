@interface QueueImportJournal
- (BOOL)scanForFiles;
- (QueueImportJournal)initWithPartialPath:(const char *)a3 under:(int)a4 allowModification:(BOOL)a5;
- (id)journalFiles;
- (int)parseError;
- (int64_t)oldestDateAfterRetirement;
- (unint64_t)retirementSerialNumber;
- (void)dealloc;
- (void)noteJournalFile:(const char *)a3 serialNumber:(unint64_t)a4;
- (void)noteRetirementFile:(const char *)a3 serialNumber:(unint64_t)a4;
@end

@implementation QueueImportJournal

- (QueueImportJournal)initWithPartialPath:(const char *)a3 under:(int)a4 allowModification:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)QueueImportJournal;
  v8 = [(QueueImportJournal *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_allowModification = a5;
    v8->_masterFD = a4;
    v8->_journalArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    strlcpy(v9->_partialPath, a3, 0x400uLL);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)QueueImportJournal;
  [(QueueImportJournal *)&v3 dealloc];
}

- (BOOL)scanForFiles
{
  id v3 = +[NSMutableArray array];
  int v22 = -1;
  int v4 = sub_10001D7F8(self->_masterFD, &v22);
  if (v4)
  {
    *(void *)&long long v18 = _NSConcreteStackBlock;
    *((void *)&v18 + 1) = 3221225472;
    v19 = sub_10001BDC8;
    v20 = &unk_100035960;
    id v21 = v3;
    int v5 = sub_100005FFC((uint64_t)self->_partialPath, 0, 0, 0, &v18);
    if (v22 != -1) {
      sub_10001D918(v22);
    }
    if (!v5) {
      [v3 sortUsingComparator:&stru_1000359A0];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v3 countByEnumeratingWithState:&v14 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = v10 + 12;
          uint64_t v12 = *(void *)(v10 + 1040);
          if (*(_DWORD *)(v10 + 8)) {
            [(QueueImportJournal *)self noteRetirementFile:v11 serialNumber:v12];
          }
          else {
            [(QueueImportJournal *)self noteJournalFile:v11 serialNumber:v12];
          }
        }
        id v7 = [v3 countByEnumeratingWithState:&v14 objects:v23 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (unint64_t)retirementSerialNumber
{
  retirement = self->_retirement;
  if (retirement) {
    return retirement->_serialNumber;
  }
  else {
    return -1;
  }
}

- (id)journalFiles
{
  return +[NSArray arrayWithArray:self->_journalArray];
}

- (int)parseError
{
  return self->_parseError;
}

- (void)noteJournalFile:(const char *)a3 serialNumber:(unint64_t)a4
{
  int v5 = [[QueueImportJournalFile alloc] initWithType:0 partialPath:a3 andSerialNumber:a4];
  [(NSMutableArray *)self->_journalArray addObject:v5];
}

- (void)noteRetirementFile:(const char *)a3 serialNumber:(unint64_t)a4
{
  self->_retirement = [[QueueImportJournalFile alloc] initWithType:1 partialPath:a3 andSerialNumber:a4];
  if ((unint64_t)[(NSMutableArray *)self->_journalArray count] >= 2)
  {
    id v6 = (char *)[(NSMutableArray *)self->_journalArray count] - 1;
    while (v6)
    {
      id v7 = [(NSMutableArray *)self->_journalArray objectAtIndexedSubscript:v6--];
      if (v7[130] <= a4)
      {
        journalArray = self->_journalArray;
        -[NSMutableArray removeObjectsInRange:](journalArray, "removeObjectsInRange:", 0, v6 + 1);
        return;
      }
    }
  }
}

- (int64_t)oldestDateAfterRetirement
{
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  int v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  int v63 = 0;
  id v3 = (unsigned int *)malloc_type_malloc(0x10000uLL, 0xDA596507uLL);
  retirement = self->_retirement;
  if (retirement) {
    unint64_t serialNumber = retirement->_serialNumber;
  }
  else {
    unint64_t serialNumber = 0;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obj = self->_journalArray;
  id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v76 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v43 = *(void *)v59;
    v39 = v47;
    v40 = self;
    do
    {
      uint64_t v12 = 0;
      id v42 = v10;
      do
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v58 + 1) + 8 * (void)v12);
        int v14 = sub_10001CFF0(self->_masterFD, (char *)(v13 + 12), 0, v5, v6, v7, v8, v9, (unsigned __int16)v39);
        int v15 = v14;
        if (v14 < 0) {
          goto LABEL_30;
        }
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x2020000000;
        v57[3] = *(void *)(v13 + 1040);
        int v16 = read(v14, v3, 0x4000uLL);
        v56[0] = 0;
        v56[1] = v56;
        v56[2] = 0x3810000000;
        v56[5] = 0;
        v56[6] = 0;
        v56[3] = &unk_1000327BE;
        v56[4] = -1;
        uint64_t v55 = 0;
        memset(v54, 0, sizeof(v54));
        if (v16 < 1)
        {
          uint64_t v18 = v11;
          goto LABEL_29;
        }
        while (1)
        {
          if (v16 <= 8)
          {
            v32 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100026768(&v52, v53);
            }
            goto LABEL_28;
          }
          uint64_t v17 = *v3;
          if (v17 <= 8)
          {
            v33 = logForCSLogCategoryDefault();
            self = v40;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_100026794(&v50, v51);
            }
            goto LABEL_28;
          }
          if (v16 < v17)
          {
            v34 = logForCSLogCategoryDefault();
            self = v40;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_1000267C0(&v48, v49);
            }
            goto LABEL_28;
          }
          uint64_t v18 = v11;
          if (sub_10000AC0C((unsigned __int8 *)v3, (int)v17 - 4, 608135816) != *(unsigned int *)((char *)v3 + v17 - 4))
          {
            v35 = logForCSLogCategoryDefault();
            self = v40;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_1000267EC(&v46, v39);
            }
LABEL_28:
            uint64_t v18 = 1;
            goto LABEL_29;
          }
          uint64_t v20 = v17 - 8;
          uint64_t v21 = 4;
          while (v20)
          {
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_10001C6B0;
            v45[3] = &unk_1000359C8;
            v45[4] = v56;
            v45[5] = v57;
            v45[6] = &v70;
            v45[7] = v64;
            v45[8] = v62;
            v45[9] = &v66;
            v45[10] = serialNumber;
            uint64_t v22 = sub_100022484((uint64_t)v3 + v21, v20, (uint64_t)v54, (uint64_t)v45, v19);
            uint64_t v23 = v22;
            if (v22 <= 0)
            {
              v27 = logForCSLogCategoryDefault();
              self = v40;
              if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                goto LABEL_28;
              }
              *(_DWORD *)buf = 134217984;
              uint64_t v75 = v23;
              v28 = v27;
              v29 = "  [QueueImportJournal oldestDateAfterRetirement ERROR! msgSize <= 0  %ld";
              goto LABEL_42;
            }
            v21 += v22;
            v20 -= v22;
            if (v20 < 0)
            {
              v30 = logForCSLogCategoryDefault();
              BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
              self = v40;
              if (!v31) {
                goto LABEL_28;
              }
              *(_DWORD *)buf = 134217984;
              uint64_t v75 = v20;
              v28 = v30;
              v29 = "  [QueueImportJournal oldestDateAfterRetirement ERROR! msgBytesAvailable < 0  %ld";
LABEL_42:
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
              goto LABEL_28;
            }
          }
          if (v11) {
            break;
          }
          int v24 = v16 - v17;
          __memmove_chk();
          int v25 = read(v15, (char *)v3 + v24, 0x4000 - v24);
          uint64_t v11 = 0;
          int v26 = v25 & ~(v25 >> 31);
          int v16 = v26 + v16 - v17;
          self = v40;
          if ((v26 + v24 < 0) ^ __OFADD__(v26, v24) | (v26 + v24 == 0)) {
            goto LABEL_29;
          }
        }
        self = v40;
LABEL_29:
        close(v15);
        _Block_object_dispose(v56, 8);
        _Block_object_dispose(v57, 8);
        uint64_t v11 = v18;
        id v10 = v42;
LABEL_30:
        if (*((unsigned char *)v67 + 24)) {
          goto LABEL_45;
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v58 objects:v76 count:16];
      id v10 = v36;
    }
    while (v36);
  }
LABEL_45:
  free(v3);
  int64_t v37 = v71[3];
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  return v37;
}

@end