@interface IDSMessageDeliveryFactory
+ (id)sharedFactory;
- (id)createAPNSMessageDelivery;
- (id)createHTTPMessageDelivery;
@end

@implementation IDSMessageDeliveryFactory

+ (id)sharedFactory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230850;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4C2F8 != -1) {
    dispatch_once(&qword_100A4C2F8, block);
  }
  v2 = (void *)qword_100A4C2F0;

  return v2;
}

- (id)createHTTPMessageDelivery
{
  id v2 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]);

  return v2;
}

- (id)createAPNSMessageDelivery
{
  id v2 = objc_alloc_init((Class)+[FTMessageDelivery APNSMessageDeliveryClass]);

  return v2;
}

@end