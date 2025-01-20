@interface CPLPrequeliteType
+ (id)dataType;
+ (id)dateType;
+ (id)integerType;
+ (id)stringType;
- (CPLPrequeliteType)initWithTypeName:(const char *)a3 defaultValue:(id)a4 objcClass:(Class)a5;
- (Class)objcClass;
- (NSData)sql;
- (NSString)description;
- (id)_bindableValueForValue:(id)a3;
- (id)_valueForBindableValue:(id)a3;
- (id)defaultValueForNull;
- (id)rawInjectionForValue:(id)a3;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation CPLPrequeliteType

+ (id)integerType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019AAB8;
  block[3] = &unk_1002763B0;
  block[4] = a1;
  if (qword_1002DC008 != -1) {
    dispatch_once(&qword_1002DC008, block);
  }
  v2 = (void *)qword_1002DC000;
  return v2;
}

+ (id)dataType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019ABC4;
  block[3] = &unk_1002763B0;
  block[4] = a1;
  if (qword_1002DC018 != -1) {
    dispatch_once(&qword_1002DC018, block);
  }
  v2 = (void *)qword_1002DC010;
  return v2;
}

+ (id)stringType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019ACCC;
  block[3] = &unk_1002763B0;
  block[4] = a1;
  if (qword_1002DC028 != -1) {
    dispatch_once(&qword_1002DC028, block);
  }
  v2 = (void *)qword_1002DC020;
  return v2;
}

+ (id)dateType
{
  if (qword_1002DC038 != -1) {
    dispatch_once(&qword_1002DC038, &stru_10027F580);
  }
  v2 = (void *)qword_1002DC030;
  return v2;
}

- (CPLPrequeliteType)initWithTypeName:(const char *)a3 defaultValue:(id)a4 objcClass:(Class)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteType;
  v10 = [(CPLPrequeliteType *)&v14 init];
  if (v10)
  {
    uint64_t v11 = +[PQLRawInjection rawInjection:a3 length:strlen(a3)];
    injection = v10->_injection;
    v10->_injection = (PQLRawInjection *)v11;

    v10->_objcClass = a5;
    objc_storeStrong(&v10->_defaultValue, a4);
  }

  return v10;
}

- (Class)objcClass
{
  return self->_objcClass;
}

- (NSData)sql
{
  return (NSData *)[(PQLRawInjection *)self->_injection sql];
}

- (id)defaultValueForNull
{
  return self->_defaultValue;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(PQLRawInjection *)self->_injection sql];
  id v5 = [v3 initWithData:v4 encoding:4];
  v6 = +[NSString stringWithFormat:@"<SQLType %@>", v5];

  return (NSString *)v6;
}

- (id)_bindableValueForValue:(id)a3
{
  id v5 = a3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        Class objcClass = self->_objcClass;
        *(_DWORD *)buf = 138413058;
        v13 = self;
        __int16 v14 = 2112;
        Class v15 = objcClass;
        __int16 v16 = 2112;
        id v17 = (id)objc_opt_class();
        __int16 v18 = 2112;
        id v19 = v5;
        id v9 = v17;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid value for %@ (%@): %@ '%@'", buf, 0x2Au);
      }
    }
    v10 = +[NSAssertionHandler currentHandler];
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/PrequeliteStore/CPLPrequeliteUtilites.m"];
    [v10 handleFailureInMethod:a2, self, v11, 103, @"Invalid value for %@ (%@): %@ '%@'", self, self->_objcClass, objc_opt_class(), v5 object file lineNumber description];

    abort();
  }
  return v5;
}

- (id)_valueForBindableValue:(id)a3
{
  id v5 = a3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        Class objcClass = self->_objcClass;
        *(_DWORD *)buf = 138413058;
        v13 = self;
        __int16 v14 = 2112;
        Class v15 = objcClass;
        __int16 v16 = 2112;
        id v17 = (id)objc_opt_class();
        __int16 v18 = 2112;
        id v19 = v5;
        id v9 = v17;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid value for %@ (%@): %@ '%@'", buf, 0x2Au);
      }
    }
    v10 = +[NSAssertionHandler currentHandler];
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/PrequeliteStore/CPLPrequeliteUtilites.m"];
    [v10 handleFailureInMethod:a2, self, v11, 108, @"Invalid value for %@ (%@): %@ '%@'", self, self->_objcClass, objc_opt_class(), v5 object file lineNumber description];

    abort();
  }
  return v5;
}

- (id)rawInjectionForValue:(id)a3
{
  id v5 = a3;
  if ([(objc_class *)self->_objcClass isSubclassOfClass:objc_opt_class()]) {
    sub_1001D25C8(a2, (uint64_t)self);
  }
  v6 = [(CPLPrequeliteType *)self _bindableValueForValue:v5];

  Class objcClass = self->_objcClass;
  if (objcClass == (Class)objc_opt_class())
  {
    id v11 = +[PQLNameInjection nameWithString:v6];
  }
  else
  {
    id v8 = objc_alloc((Class)PQLRawInjection);
    id v9 = [v6 description];
    v10 = [v9 dataUsingEncoding:4];
    id v11 = [v8 initWithData:v10];
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_injection, 0);
}

@end