@interface OSALogHelper
+ (BOOL)createForSubmissionWithXPCRequest:(id)a3 forReply:(id)a4;
+ (void)instantiate;
+ (void)triggerUrgentSubmission;
@end

@implementation OSALogHelper

+ (BOOL)createForSubmissionWithXPCRequest:(id)a3 forReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v8 = qword_1000262B8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004FAC;
  v12[3] = &unk_100021190;
  id v13 = v7;
  id v14 = v6;
  v15 = &v17;
  id v16 = a1;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);
  LOBYTE(v6) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

+ (void)instantiate
{
  if (qword_1000262B0 != -1) {
    dispatch_once(&qword_1000262B0, &stru_100021118);
  }
}

+ (void)triggerUrgentSubmission
{
  if (qword_1000262C8 != -1) {
    dispatch_once(&qword_1000262C8, &stru_1000211B0);
  }
  v2 = qword_1000262C0;
  if (qword_1000262C0)
  {
    dispatch_async(v2, &stru_1000211D0);
  }
}

@end