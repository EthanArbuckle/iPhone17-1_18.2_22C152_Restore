@interface IXSPromisedInMemoryData
+ (BOOL)supportsSecureCoding;
- (IXSPromisedInMemoryData)initWithCoder:(id)a3;
- (IXSPromisedInMemoryData)initWithSeed:(id)a3 data:(id)a4 error:(id *)a5;
- (NSData)data;
- (id)updatedPromiseWithData:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXSPromisedInMemoryData

- (IXSPromisedInMemoryData)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXSPromisedInMemoryData;
  return [(IXSOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)IXSPromisedInMemoryData;
  [(IXSOwnedDataPromise *)&v6 encodeWithCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedInMemoryData)initWithSeed:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IXSPromisedInMemoryData;
  v10 = [(IXSOwnedDataPromise *)&v26 initWithSeed:v8 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100044124;
  v24 = sub_100044134;
  id v25 = 0;
  v12 = [(IXSDataPromise *)v10 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004413C;
  block[3] = &unk_1000E9208;
  v17 = v11;
  id v18 = v9;
  v19 = &v20;
  dispatch_sync(v12, block);

  v13 = (void *)v21[5];
  if (!v13)
  {

    _Block_object_dispose(&v20, 8);
LABEL_7:
    v14 = v11;
    goto LABEL_8;
  }
  if (a5) {
    *a5 = v13;
  }

  _Block_object_dispose(&v20, 8);
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)updatedPromiseWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(IXSDataPromise *)self seed];
  id v8 = objc_alloc_init(IXPromisedInMemoryDataSeed);
  id v9 = [v7 name];
  [(IXDataPromiseSeed *)v8 setName:v9];

  -[IXDataPromiseSeed setCreatorIdentifier:](v8, "setCreatorIdentifier:", [v7 creatorIdentifier]);
  -[IXDataPromiseSeed setTotalBytesNeededOnDisk:](v8, "setTotalBytesNeededOnDisk:", [v6 length]);
  id v15 = 0;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithSeed:v8 data:v6 error:&v15];

  id v11 = v15;
  v12 = v11;
  if (v10)
  {
    v13 = +[IXSDataPromiseManager sharedInstance];
    [v13 registerPromise:v10];
  }
  else if (a4)
  {
    *a4 = v11;
  }

  return v10;
}

- (NSData)data
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSOwnedDataPromise *)self stagedPath];
  id v11 = 0;
  v5 = +[NSData dataWithContentsOfURL:v4 options:3 error:&v11];
  id v6 = v11;

  if (!v5)
  {
    v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(IXSOwnedDataPromise *)self stagedPath];
      id v9 = [v8 path];
      *(_DWORD *)buf = 136315650;
      v13 = "-[IXSPromisedInMemoryData data]";
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to read data from %@ : %@", buf, 0x20u);
    }
  }

  return (NSData *)v5;
}

@end