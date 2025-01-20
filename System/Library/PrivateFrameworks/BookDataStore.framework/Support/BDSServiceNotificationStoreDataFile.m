@interface BDSServiceNotificationStoreDataFile
+ (NSURL)defaultDataURL;
+ (id)sharedInstance;
- (BDSServiceNotificationStoreDataFile)init;
- (BDSSimpleDataFile)dataFile;
- (id)load;
- (void)save:(id)a3;
@end

@implementation BDSServiceNotificationStoreDataFile

+ (id)sharedInstance
{
  if (qword_100297518 != -1) {
    dispatch_once(&qword_100297518, &stru_10025FD30);
  }
  v2 = (void *)qword_100297520;
  return v2;
}

- (BDSServiceNotificationStoreDataFile)init
{
  v7.receiver = self;
  v7.super_class = (Class)BDSServiceNotificationStoreDataFile;
  v2 = [(BDSServiceNotificationStoreDataFile *)&v7 init];
  if (v2)
  {
    v3 = +[BDSServiceNotificationStoreDataFile defaultDataURL];
    v4 = [[BDSSimpleDataFile alloc] initWithURL:v3];
    dataFile = v2->_dataFile;
    v2->_dataFile = v4;
  }
  return v2;
}

- (id)load
{
  v2 = [(BDSServiceNotificationStoreDataFile *)self dataFile];
  id v11 = 0;
  v3 = [v2 load:&v11];
  id v4 = v11;

  if (v4)
  {
    v5 = sub_1000063E8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001E47E4();
    }
LABEL_4:
    v6 = 0;
    goto LABEL_14;
  }
  if (!v3)
  {
    v5 = sub_1000063E8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Didn't find notification store data file, starting fresh.", buf, 2u);
    }
    goto LABEL_4;
  }
  id v10 = 0;
  v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
  v5 = v10;
  objc_super v7 = sub_1000063E8();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loaded notification store data read from disk: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1001E477C();
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
  objc_super v7 = [(BDSServiceNotificationStoreDataFile *)self dataFile];
  id v17 = 0;
  unsigned int v8 = [v7 save:v6 error:&v17];
  id v9 = v17;

  id v10 = sub_1000063E8();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully saved notification store data.", buf, 2u);
    }
LABEL_10:

    id v14 = v9;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001E48B4();
  }

  v12 = [(BDSServiceNotificationStoreDataFile *)self dataFile];
  id v15 = v9;
  unsigned __int8 v13 = [v12 remove:&v15];
  id v14 = v15;

  if ((v13 & 1) == 0)
  {
    id v11 = sub_1000063E8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001E484C();
    }
    id v9 = v14;
    goto LABEL_10;
  }
LABEL_11:
}

+ (NSURL)defaultDataURL
{
  if (qword_100297530 != -1) {
    dispatch_once(&qword_100297530, &stru_10025FD50);
  }
  v2 = (void *)qword_100297528;
  return (NSURL *)v2;
}

- (BDSSimpleDataFile)dataFile
{
  return self->_dataFile;
}

- (void).cxx_destruct
{
}

@end