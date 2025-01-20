@interface IntelligentRoutingDiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation IntelligentRoutingDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  v4 = IRLogObject;
  if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension, attachmentForParameters, called with parameters: %@", (uint8_t *)&buf, 0xCu);
  }
  v5 = [v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if ([v5 isEqualToString:@"com.apple.taptoradard"]) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = [v5 isEqualToString:@"com.apple.TapToRadar"] ^ 1;
  }
  v7 = [v3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  unsigned int v8 = [v7 BOOLValue];

  if ((v6 | v8))
  {
    v9 = +[NSMutableArray array];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    v25 = sub_1000031AC;
    v26 = sub_1000031BC;
    id v27 = +[NSNumber numberWithBool:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000031C4;
    v19[3] = &unk_100004160;
    p_long long buf = &buf;
    v10 = dispatch_semaphore_create(0);
    v20 = v10;
    id v11 = v9;
    id v21 = v11;
    +[IRSession databaseExportwithReply:v19];
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v10, v12);
    uint64_t v13 = +[NSNumber numberWithBool:0];
    v14 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v13;

    v15 = v21;
    id v16 = v11;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v17 = IRLogObject;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR)) {
      sub_100003508(v17);
    }
    id v16 = &__NSArray0__struct;
  }

  return v16;
}

@end