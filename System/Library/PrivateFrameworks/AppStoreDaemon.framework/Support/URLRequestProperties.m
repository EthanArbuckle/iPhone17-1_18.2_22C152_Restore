@interface URLRequestProperties
- (URLRequestProperties)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation URLRequestProperties

- (URLRequestProperties)init
{
  v7.receiver = self;
  v7.super_class = (Class)URLRequestProperties;
  v2 = [(URLRequestProperties *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.URLRequestProperties", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_KBSyncType = 0;
    v2->_requestMethod = 2;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1000182C8;
  v13 = sub_100017D20;
  v14 = [+[URLRequestProperties allocWithZone:](URLRequestProperties, "allocWithZone:") init];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003656A8;
  block[3] = &unk_100528828;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_requestBodyData, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bagURL, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end