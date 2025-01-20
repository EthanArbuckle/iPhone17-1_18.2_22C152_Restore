@interface MiLoDiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation MiLoDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  if (qword_100008158 != -1) {
    dispatch_once(&qword_100008158, &stru_1000041A8);
  }
  v4 = qword_100008160;
  if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "attachmentForParameters, called with parameters: %@", (uint8_t *)&buf, 0xCu);
  }
  v5 = [v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  v6 = [v3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  unsigned int v7 = [v6 BOOLValue];

  if ([v5 isEqualToString:@"com.apple.TapToRadar"])
  {
    if (v7)
    {
LABEL_7:
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x3032000000;
      v24 = sub_100003224;
      v25 = sub_100003234;
      id v26 = +[NSNumber numberWithBool:1];
      v8 = +[NSMutableArray array];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000323C;
      v18[3] = &unk_100004168;
      p_long long buf = &buf;
      v9 = dispatch_semaphore_create(0);
      v19 = v9;
      id v10 = v8;
      id v20 = v10;
      +[ULConnection exportDatabaseWithReply:v18];
      dispatch_time_t v11 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v9, v11);
      uint64_t v12 = +[NSNumber numberWithBool:0];
      v13 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v12;

      v14 = v20;
      id v15 = v10;

      _Block_object_dispose(&buf, 8);
      goto LABEL_14;
    }
  }
  else if (([v5 isEqualToString:@"com.apple.taptoradard"] ^ 1 | v7))
  {
    goto LABEL_7;
  }
  if (qword_100008158 != -1) {
    dispatch_once(&qword_100008158, &stru_1000041A8);
  }
  v16 = qword_100008160;
  if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "TapToRadar Denied. Called by TapToRadar , and the user denied collecting MicroLocation logs", (uint8_t *)&buf, 2u);
  }
  id v15 = &__NSArray0__struct;
LABEL_14:

  return v15;
}

@end