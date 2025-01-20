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
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10003A0A8;
  v16 = sub_10003A0B8;
  id v17 = 0;
  id v5 = objc_alloc_init((Class)NSFileCoordinator);
  v6 = [(BDSSharedDataFile *)self url];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A0C0;
  v10[3] = &unk_100260E78;
  v10[4] = &v12;
  id v11 = 0;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:&v11 byAccessor:v10];
  id v7 = v11;

  if (a3 && v7) {
    *a3 = v7;
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10003A0A8;
  v23 = sub_10003A0B8;
  id v24 = 0;
  id v7 = objc_alloc_init((Class)NSFileCoordinator);
  id v8 = [(BDSSharedDataFile *)self url];
  objc_super v9 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003A2D8;
  v14[3] = &unk_100260EA0;
  v16 = &v25;
  id v10 = v6;
  id v15 = v10;
  id v17 = &v19;
  [v7 coordinateWritingItemAtURL:v8 options:0 error:&obj byAccessor:v14];
  objc_storeStrong(v9, obj);

  if (a4)
  {
    id v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (BOOL)remove:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10003A0A8;
  v18 = sub_10003A0B8;
  id v19 = 0;
  id v5 = objc_alloc_init((Class)NSFileCoordinator);
  id v6 = [(BDSSharedDataFile *)self url];
  id v8 = (id *)(v15 + 5);
  id v7 = (void *)v15[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A4E4;
  v12[3] = &unk_100260EC8;
  v12[4] = &v20;
  v12[5] = &v14;
  id obj = v7;
  [v5 coordinateWritingItemAtURL:v6 options:1 error:&obj byAccessor:v12];
  objc_storeStrong(v8, obj);

  if (a3)
  {
    objc_super v9 = (void *)v15[5];
    if (v9) {
      *a3 = v9;
    }
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end