@interface NPSDomainAccessor
+ (id)nanoMapsDomainAccessor;
@end

@implementation NPSDomainAccessor

+ (id)nanoMapsDomainAccessor
{
  if (qword_CB00 != -1) {
    dispatch_once(&qword_CB00, &stru_8DD8);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_6228;
  v9 = sub_6238;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6240;
  block[3] = &unk_8EA0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_CB08, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

@end