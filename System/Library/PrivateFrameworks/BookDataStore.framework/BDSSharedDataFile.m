@interface BDSSharedDataFile
- (BDSSharedDataFile)initWithURL:(id)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)save:(id)a3 error:(id *)a4;
- (NSURL)url;
- (id)load:(id *)a3;
@end

@implementation BDSSharedDataFile

- (BDSSharedDataFile)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSSharedDataFile;
  v6 = [(BDSSharedDataFile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (id)load:(id *)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_2360FD914;
  v26 = sub_2360FD924;
  id v27 = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F08830]);
  v13 = objc_msgSend_url(self, v6, v7, v8, v9, v10, v11, v12);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2360FD92C;
  v20[3] = &unk_264CA1F38;
  v20[4] = &v22;
  id v21 = 0;
  objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v5, v14, (uint64_t)v13, 0, (uint64_t)&v21, (uint64_t)v20, v15, v16);
  id v17 = v21;

  if (a3 && v17) {
    *a3 = v17;
  }
  id v18 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v18;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_2360FD914;
  v33 = sub_2360FD924;
  id v34 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263F08830]);
  uint64_t v15 = objc_msgSend_url(self, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2360FDB44;
  v24[3] = &unk_264CA1F60;
  v26 = &v35;
  id v17 = v6;
  id v25 = v17;
  id v27 = &v29;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v7, v18, (uint64_t)v15, 0, (uint64_t)&obj, (uint64_t)v24, v19, v20);
  objc_storeStrong(v16, obj);

  if (a4)
  {
    id v21 = (void *)v30[5];
    if (v21) {
      *a4 = v21;
    }
  }
  char v22 = *((unsigned char *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

- (BOOL)remove:(id *)a3
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_2360FD914;
  v28 = sub_2360FD924;
  id v29 = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F08830]);
  uint64_t v13 = objc_msgSend_url(self, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v15 = (id *)(v25 + 5);
  uint64_t v14 = (void *)v25[5];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2360FDD50;
  v22[3] = &unk_264CA1F88;
  v22[4] = &v30;
  v22[5] = &v24;
  id obj = v14;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v5, v16, (uint64_t)v13, 1, (uint64_t)&obj, (uint64_t)v22, v17, v18);
  objc_storeStrong(v15, obj);

  if (a3)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19) {
      *a3 = v19;
    }
  }
  char v20 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  return v20;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end