@interface BDSBookWidgetReadingHistoryDataFile
+ (BDSBookWidgetReadingHistoryDataFile)sharedInstance;
+ (NSURL)defaultDataURL;
- (BDSBookWidgetReadingHistoryDataFile)init;
- (BDSSharedDataFile)dataFile;
- (id)load;
- (void)save:(id)a3;
@end

@implementation BDSBookWidgetReadingHistoryDataFile

+ (BDSBookWidgetReadingHistoryDataFile)sharedInstance
{
  if (qword_1002973F0 != -1) {
    dispatch_once(&qword_1002973F0, &stru_10025F790);
  }
  v2 = (void *)qword_1002973F8;
  return (BDSBookWidgetReadingHistoryDataFile *)v2;
}

- (BDSBookWidgetReadingHistoryDataFile)init
{
  v7.receiver = self;
  v7.super_class = (Class)BDSBookWidgetReadingHistoryDataFile;
  v2 = [(BDSBookWidgetReadingHistoryDataFile *)&v7 init];
  if (v2)
  {
    v3 = +[BDSBookWidgetReadingHistoryDataFile defaultDataURL];
    v4 = [[BDSSharedDataFile alloc] initWithURL:v3];
    dataFile = v2->_dataFile;
    v2->_dataFile = v4;
  }
  return v2;
}

- (id)load
{
  v2 = [(BDSBookWidgetReadingHistoryDataFile *)self dataFile];
  id v11 = 0;
  v3 = [v2 load:&v11];
  id v4 = v11;

  if (v4)
  {
    v5 = sub_10000D068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001E3E04();
    }
LABEL_4:
    v6 = 0;
    goto LABEL_14;
  }
  if (!v3)
  {
    v5 = sub_10000D068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Didn't find widget reading history data file, starting fresh.", buf, 2u);
    }
    goto LABEL_4;
  }
  id v10 = 0;
  v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
  v5 = v10;
  objc_super v7 = sub_10000D068();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loaded widget reading history data read from disk: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1001E3D9C();
  }

LABEL_14:
  return v6;
}

- (void)save:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 setOutputFormat:200];
  [v5 encodeObject:v4 forKey:NSKeyedArchiveRootObjectKey];

  v6 = [v5 encodedData];
  objc_super v7 = [(BDSBookWidgetReadingHistoryDataFile *)self dataFile];
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
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully saved widget reading history data.", buf, 2u);
    }
LABEL_10:

    id v14 = v9;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001E3ED4();
  }

  v12 = [(BDSBookWidgetReadingHistoryDataFile *)self dataFile];
  id v15 = v9;
  unsigned __int8 v13 = [v12 remove:&v15];
  id v14 = v15;

  if ((v13 & 1) == 0)
  {
    id v11 = sub_10000D068();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001E3E6C();
    }
    id v9 = v14;
    goto LABEL_10;
  }
LABEL_11:
}

+ (NSURL)defaultDataURL
{
  if (qword_100297408 != -1) {
    dispatch_once(&qword_100297408, &stru_10025F7B0);
  }
  v2 = (void *)qword_100297400;
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