@interface BDSBookWidgetDataFile
+ (NSURL)defaultDataURL;
+ (id)sharedInstance;
- (BDSBookWidgetDataFile)init;
- (BDSSharedDataFile)dataFile;
- (id)load;
- (void)save:(id)a3;
@end

@implementation BDSBookWidgetDataFile

+ (id)sharedInstance
{
  if (qword_26AD77618 != -1) {
    dispatch_once(&qword_26AD77618, &unk_26E971D90);
  }
  v2 = (void *)qword_26AD77630;
  return v2;
}

- (BDSBookWidgetDataFile)init
{
  v21.receiver = self;
  v21.super_class = (Class)BDSBookWidgetDataFile;
  v9 = [(BDSBookWidgetDataFile *)&v21 init];
  if (v9)
  {
    v10 = objc_msgSend_defaultDataURL(BDSBookWidgetDataFile, v2, v3, v4, v5, v6, v7, v8);
    v11 = [BDSSharedDataFile alloc];
    uint64_t v18 = objc_msgSend_initWithURL_(v11, v12, (uint64_t)v10, v13, v14, v15, v16, v17);
    dataFile = v9->_dataFile;
    v9->_dataFile = (BDSSharedDataFile *)v18;
  }
  return v9;
}

- (id)load
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_dataFile(self, a2, v2, v3, v4, v5, v6, v7);
  id v36 = 0;
  uint64_t v15 = objc_msgSend_load_(v8, v9, (uint64_t)&v36, v10, v11, v12, v13, v14);
  id v16 = v36;

  if (v16)
  {
    uint64_t v17 = BDSWidgetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2361FAB50();
    }
LABEL_4:
    uint64_t v18 = 0;
    goto LABEL_5;
  }
  if (!v15)
  {
    uint64_t v17 = BDSWidgetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2360BC000, v17, OS_LOG_TYPE_DEFAULT, "Didn't find current widget data file, starting fresh.", buf, 2u);
    }
    id v16 = 0;
    goto LABEL_4;
  }
  v20 = (void *)MEMORY[0x263F08928];
  uint64_t v21 = objc_opt_class();
  id v35 = 0;
  uint64_t v18 = objc_msgSend_unarchivedArrayOfObjectsOfClass_fromData_error_(v20, v22, v21, (uint64_t)v15, (uint64_t)&v35, v23, v24, v25);
  id v16 = v35;
  v26 = BDSWidgetLog();
  uint64_t v17 = v26;
  if (!v18)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_2361FAAE8();
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = objc_msgSend_count(v18, v27, v28, v29, v30, v31, v32, v33);
    *(_DWORD *)buf = 134218242;
    uint64_t v38 = v34;
    __int16 v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_2360BC000, v17, OS_LOG_TYPE_DEFAULT, "Loading %lu widget datas read from disk: %@", buf, 0x16u);
  }
LABEL_5:

  return v18;
}

- (void)save:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F08910];
  id v5 = a3;
  id v6 = [v4 alloc];
  inited = objc_msgSend_initRequiringSecureCoding_(v6, v7, 1, v8, v9, v10, v11, v12);
  objc_msgSend_setOutputFormat_(inited, v14, 200, v15, v16, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(inited, v20, (uint64_t)v5, *MEMORY[0x263F081D0], v21, v22, v23, v24);

  uint64_t v32 = objc_msgSend_encodedData(inited, v25, v26, v27, v28, v29, v30, v31);
  v40 = objc_msgSend_dataFile(self, v33, v34, v35, v36, v37, v38, v39);
  id v68 = 0;
  int v46 = objc_msgSend_save_error_(v40, v41, (uint64_t)v32, (uint64_t)&v68, v42, v43, v44, v45);
  id v47 = v68;

  v48 = BDSWidgetLog();
  v49 = v48;
  if (v46)
  {
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2360BC000, v49, OS_LOG_TYPE_DEFAULT, "Successfully updated current widget data file.", buf, 2u);
    }
LABEL_10:

    id v65 = v47;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_2361FAC20();
  }

  v57 = objc_msgSend_dataFile(self, v50, v51, v52, v53, v54, v55, v56);
  id v66 = v47;
  char v64 = objc_msgSend_remove_(v57, v58, (uint64_t)&v66, v59, v60, v61, v62, v63);
  id v65 = v66;

  if ((v64 & 1) == 0)
  {
    v49 = BDSWidgetLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_2361FABB8();
    }
    id v47 = v65;
    goto LABEL_10;
  }
LABEL_11:
}

+ (NSURL)defaultDataURL
{
  if (qword_268854B58 != -1) {
    dispatch_once(&qword_268854B58, &unk_26E971DB0);
  }
  uint64_t v2 = (void *)qword_268854B50;
  return (NSURL *)v2;
}

- (BDSSharedDataFile)dataFile
{
  return self->_dataFile;
}

- (void).cxx_destruct
{
}

@end