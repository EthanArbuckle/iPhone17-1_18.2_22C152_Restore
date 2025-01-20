@interface HMDSContext
+ (id)logCategory;
- (HMDSContext)initWithHomeManager:(id)a3 homes:(id)a4;
- (HMDSContext)initWithHomes:(id)a3;
- (HMHomeManager)homeManager;
- (NSArray)homes;
- (id)cancelInvitation:(id)a3;
- (id)removeSimpleLabelAccessCode:(id)a3 fromHome:(id)a4;
- (id)removeUser:(id)a3 fromHome:(id)a4;
- (id)simpleLabelAccessCodesForHome:(id)a3;
- (unint64_t)dataSyncState;
- (unint64_t)status;
@end

@implementation HMDSContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homes, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (NSArray)homes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 8, 1);
}

- (id)cancelInvitation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NAFuture);
  v5 = [v4 errorOnlyCompletionHandlerAdapter];
  [v3 cancelInviteWithCompletionHandler:v5];

  return v4;
}

- (id)removeUser:(id)a3 fromHome:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NAFuture);
  v8 = [v7 errorOnlyCompletionHandlerAdapter];
  [v5 removeUserWithoutConfirmation:v6 completionHandler:v8];

  return v7;
}

- (id)removeSimpleLabelAccessCode:(id)a3 fromHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NAFuture);
  v9 = [v6 createAccessCodeManager];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7A7C;
  v14[3] = &unk_C790;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  [v9 removeSimpleLabelAccessCode:v7 completion:v14];

  v11 = v15;
  id v12 = v10;

  return v12;
}

- (id)simpleLabelAccessCodesForHome:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NAFuture);
  id v5 = [v3 createAccessCodeManager];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7CA4;
  v8[3] = &unk_C768;
  id v6 = v4;
  id v9 = v6;
  [v5 fetchHomeAccessCodesWithCompletion:v8];

  return v6;
}

- (HMDSContext)initWithHomes:(id)a3
{
  return [(HMDSContext *)self initWithHomeManager:0 homes:a3];
}

- (HMDSContext)initWithHomeManager:(id)a3 homes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSContext;
  id v9 = [(HMDSContext *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeManager, a3);
    objc_storeStrong((id *)&v10->_homes, a4);
    v10->_dataSyncState = (unint64_t)[v7 dataSyncState];
    v10->_status = (unint64_t)[v7 status];
  }

  return v10;
}

+ (id)logCategory
{
  if (qword_11DE8 != -1) {
    dispatch_once(&qword_11DE8, &stru_C7D0);
  }
  v2 = (void *)qword_11DF0;

  return v2;
}

@end