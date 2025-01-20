@interface MFListUnsubscribeHandler_iOS
+ (id)log;
- (EDOutgoingMessageRepository)outgoingMessageRepository;
- (MFListUnsubscribeHandler_iOS)initWithOutgoingMessageRepository:(id)a3;
- (void)ignoreWithCommand:(id)a3 completion:(id)a4;
- (void)unsubscribeMailtoWithCommand:(id)a3 completion:(id)a4;
@end

@implementation MFListUnsubscribeHandler_iOS

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007149C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BB58 != -1) {
    dispatch_once(&qword_10016BB58, block);
  }
  v2 = (void *)qword_10016BB50;

  return v2;
}

- (MFListUnsubscribeHandler_iOS)initWithOutgoingMessageRepository:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFListUnsubscribeHandler_iOS;
  v6 = [(MFListUnsubscribeHandler_iOS *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outgoingMessageRepository, a3);
  }

  return v7;
}

- (void)ignoreWithCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFListUnsubscribeHandler_iOS *)self scheduler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000716C0;
  v11[3] = &unk_10013C458;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performBlock:v11];
}

- (void)unsubscribeMailtoWithCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFListUnsubscribeHandler_iOS *)self scheduler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007183C;
  v11[3] = &unk_10013C458;
  id v9 = v6;
  id v12 = v9;
  id v13 = self;
  id v10 = v7;
  id v14 = v10;
  [v8 performBlock:v11];
}

- (EDOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void).cxx_destruct
{
}

@end