@interface DEMessagesExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEMessagesExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v27[0] = @"collectionFlags";
  v4 = +[NSNumber numberWithInteger:1023];
  v28[0] = v4;
  v28[1] = @"iMessage Log Dump";
  v27[1] = @"title";
  v27[2] = @"displayFlags";
  v28[2] = &off_100004200;
  v5 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000039B8;
  v24 = sub_1000039C8;
  id v25 = 0;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000039D0;
  v17 = &unk_100004130;
  v19 = &v20;
  v6 = dispatch_semaphore_create(0);
  v18 = v6;
  v7 = objc_retainBlock(&v14);
  v8 = dispatch_get_global_queue(0, 0);
  int v9 = DLCCollectLogsWithCompletionHandler();

  if (!v9)
  {
    v11 = +[DELogging fwHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003ABC(v11);
    }
    goto LABEL_7;
  }
  dispatch_time_t v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v6, v10))
  {
    v11 = +[DELogging fwHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003A78(v11);
    }
LABEL_7:
    v12 = &__NSArray0__struct;
LABEL_8:

    goto LABEL_9;
  }
  if (v21[5])
  {
    v11 = +[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v14, v15, v16, v17);
    v26 = v11;
    v12 = +[NSArray arrayWithObjects:&v26 count:1];
    goto LABEL_8;
  }
  v12 = &__NSArray0__struct;
LABEL_9:

  _Block_object_dispose(&v20, 8);
  return v12;
}

@end