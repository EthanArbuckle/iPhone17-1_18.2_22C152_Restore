@interface BUUnarchivingFileCopier
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4;
- (BUFileCopierDelegate)delegate;
- (BUUnarchivingFileCopier)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BUZipFileArchive)zipArchive;
- (void)setDelegate:(id)a3;
- (void)setZipArchive:(id)a3;
@end

@implementation BUUnarchivingFileCopier

- (BUUnarchivingFileCopier)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BUUnarchivingFileCopier;
  v10 = [(BUUnarchivingFileCopier *)&v19 init];
  if (v10)
  {
    id v18 = 0;
    v11 = objc_msgSend_zipArchiveFromURL_options_error_(BUZipFileArchive, v9, (uint64_t)v8, a4, &v18);
    id v12 = v18;
    if (v12)
    {
      p_super = BUZipLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2464((uint64_t)v8, (uint64_t)v12, p_super);
      }
    }
    else
    {
      v14 = v11;
      p_super = &v10->_zipArchive->super.super;
      v10->_zipArchive = v14;
    }

    if (a5) {
      goto LABEL_9;
    }
  }
  else
  {
    id v12 = 0;
    if (a5) {
LABEL_9:
    }
      *a5 = v12;
  }
  if (v12) {
    v15 = 0;
  }
  else {
    v15 = v10;
  }
  v16 = v15;

  return v16;
}

- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4
{
  v6 = objc_msgSend_zipArchive(self, a2, (uint64_t)a3);
  v9 = v6;
  if (v6)
  {
    if (a3) {
      *a3 = objc_msgSend_totalSize(v6, v7, v8);
    }
    if (a4) {
      *a4 = objc_msgSend_entriesCount(v9, v7, v8);
    }
  }

  return v9 != 0;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_zipArchive(self, v7, v8);
  if (v11)
  {
    id v12 = objc_msgSend_delegate(self, v9, v10);
    v15 = objc_msgSend_zipArchive(self, v13, v14);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_21E1E9990;
    v22[3] = &unk_26449E460;
    id v23 = v12;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_21E1E99EC;
    v20[3] = &unk_26449E488;
    id v21 = v23;
    id v16 = v23;
    char Entry = objc_msgSend_extractToURL_error_shouldExtractEntry_didExtractEntry_(v15, v17, (uint64_t)v6, a4, v22, v20);
  }
  else
  {
    char Entry = 0;
  }

  return Entry;
}

- (BUFileCopierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BUFileCopierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BUZipFileArchive)zipArchive
{
  return self->_zipArchive;
}

- (void)setZipArchive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipArchive, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end