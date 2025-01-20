@interface URLResponseDecoder
- (URLResponseDecoder)init;
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation URLResponseDecoder

- (URLResponseDecoder)init
{
  v9.receiver = self;
  v9.super_class = (Class)URLResponseDecoder;
  v2 = [(URLResponseDecoder *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.URLResponseDecoder", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestProperties = v2->_requestProperties;
    v2->_requestProperties = v6;
  }
  return v2;
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)URLResponseDecoder;
  v5 = [(URLResponseDecoder *)&v12 resultFromResult:a3 error:a4];
  v6 = v5;
  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10023DDE8;
    v9[3] = &unk_1005218C0;
    id v10 = v5;
    v11 = self;
    dispatch_sync(dispatchQueue, v9);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end