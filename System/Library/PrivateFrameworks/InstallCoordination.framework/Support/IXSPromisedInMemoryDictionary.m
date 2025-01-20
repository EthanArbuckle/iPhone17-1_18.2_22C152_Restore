@interface IXSPromisedInMemoryDictionary
+ (BOOL)supportsSecureCoding;
- (IXSPromisedInMemoryDictionary)initWithCoder:(id)a3;
- (IXSPromisedInMemoryDictionary)initWithSeed:(id)a3 dictionary:(id)a4 error:(id *)a5;
- (NSDictionary)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXSPromisedInMemoryDictionary

- (IXSPromisedInMemoryDictionary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXSPromisedInMemoryDictionary;
  return [(IXSOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)IXSPromisedInMemoryDictionary;
  [(IXSOwnedDataPromise *)&v6 encodeWithCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedInMemoryDictionary)initWithSeed:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IXSPromisedInMemoryDictionary;
  v10 = [(IXSOwnedDataPromise *)&v26 initWithSeed:v8 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100034C58;
  v24 = sub_100034C68;
  id v25 = 0;
  v12 = [(IXSDataPromise *)v10 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034C70;
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

- (NSDictionary)dictionary
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSOwnedDataPromise *)self stagedPath];
  v5 = +[NSDictionary dictionaryWithContentsOfURL:v4];

  if (!v5)
  {
    objc_super v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(IXSOwnedDataPromise *)self stagedPath];
      id v8 = [v7 path];
      int v10 = 136315650;
      v11 = "-[IXSPromisedInMemoryDictionary dictionary]";
      __int16 v12 = 2112;
      v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to read dictionary from %@ : %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return (NSDictionary *)v5;
}

@end