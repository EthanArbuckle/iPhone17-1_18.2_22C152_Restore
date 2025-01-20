@interface RequesterLocalNotificationTask
- (RequestProtocol)request;
- (RequesterLocalNotificationTask)initWithRequest:(id)a3;
- (id)perform;
@end

@implementation RequesterLocalNotificationTask

- (RequesterLocalNotificationTask)initWithRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RequesterLocalNotificationTask;
  v4 = [(RequesterLocalNotificationTask *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_request, a3);
  }
  return v5;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017794;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(RequesterLocalNotificationTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (RequestProtocol)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end