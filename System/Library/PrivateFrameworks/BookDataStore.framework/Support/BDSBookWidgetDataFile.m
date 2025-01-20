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
  if (qword_1002974A0 != -1) {
    dispatch_once(&qword_1002974A0, &stru_10025F8F0);
  }
  v2 = (void *)qword_1002974A8;
  return v2;
}

- (BDSBookWidgetDataFile)init
{
  v7.receiver = self;
  v7.super_class = (Class)BDSBookWidgetDataFile;
  v2 = [(BDSBookWidgetDataFile *)&v7 init];
  if (v2)
  {
    v3 = +[BDSBookWidgetDataFile defaultDataURL];
    v4 = [[BDSSharedDataFile alloc] initWithURL:v3];
    dataFile = v2->_dataFile;
    v2->_dataFile = v4;
  }
  return v2;
}

- (id)load
{
  v2 = [(BDSBookWidgetDataFile *)self dataFile];
  id v11 = 0;
  v3 = [v2 load:&v11];
  id v4 = v11;

  if (v4)
  {
    v5 = sub_10000D068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001E400C();
    }
LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
    v5 = sub_10000D068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Didn't find current widget data file, starting fresh.", buf, 2u);
    }
    id v4 = 0;
    goto LABEL_4;
  }
  id v10 = 0;
  v6 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v3 error:&v10];
  id v4 = v10;
  v8 = sub_10000D068();
  v5 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E3FA4();
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 count];
    *(_DWORD *)buf = 134218242;
    id v13 = v9;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading %lu widget datas read from disk: %@", buf, 0x16u);
  }
LABEL_5:

  return v6;
}

- (void)save:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 setOutputFormat:200];
  [v5 encodeObject:v4 forKey:NSKeyedArchiveRootObjectKey];

  v6 = [v5 encodedData];
  objc_super v7 = [(BDSBookWidgetDataFile *)self dataFile];
  id v17 = 0;
  unsigned int v8 = [v7 save:v6 error:&v17];
  id v9 = v17;

  id v10 = sub_10000D068();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully updated current widget data file.", buf, 2u);
    }
LABEL_10:

    id v14 = v9;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001E40DC();
  }

  v12 = [(BDSBookWidgetDataFile *)self dataFile];
  id v15 = v9;
  unsigned __int8 v13 = [v12 remove:&v15];
  id v14 = v15;

  if ((v13 & 1) == 0)
  {
    id v11 = sub_10000D068();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001E4074();
    }
    id v9 = v14;
    goto LABEL_10;
  }
LABEL_11:
}

+ (NSURL)defaultDataURL
{
  if (qword_1002974B8 != -1) {
    dispatch_once(&qword_1002974B8, &stru_10025F910);
  }
  v2 = (void *)qword_1002974B0;
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