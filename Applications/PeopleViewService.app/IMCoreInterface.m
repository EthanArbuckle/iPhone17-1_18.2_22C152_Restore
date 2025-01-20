@interface IMCoreInterface
+ (id)checkWithWait:(id)a3 service:(id)a4;
+ (id)logHandle;
+ (void)checkAndClear:(id)a3 service:(id)a4;
+ (void)clearUnreadFor:(id)a3 andPhone:(id)a4;
- (IMCoreInterface)init;
- (void)grabUnreadFor:(id)a3 completionHandler:(id)a4;
@end

@implementation IMCoreInterface

+ (id)logHandle
{
  if (qword_100026B88[0] != -1) {
    dispatch_once(qword_100026B88, &stru_100020D90);
  }
  v2 = (void *)qword_100026B80;

  return v2;
}

+ (void)checkAndClear:(id)a3 service:(id)a4
{
  id v12 = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = v6;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];

  v9 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.people.checkAndClear", v9);
  IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();
}

+ (void)clearUnreadFor:(id)a3 andPhone:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (v6 && [v6 length]) {
    +[IMCoreInterface checkAndClear:v6 service:IMSPIiMessageService];
  }
  if (v5 && [v5 length])
  {
    +[IMCoreInterface checkAndClear:v5 service:IMSPIiMessageService];
    +[IMCoreInterface checkAndClear:v5 service:IMSPISMSService];
  }
}

+ (id)checkWithWait:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)AAFPromise);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004F24;
  v12[3] = &unk_100020E20;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = [v7 initWithBlock:v12];

  return v10;
}

- (IMCoreInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMCoreInterface;
  return [(IMCoreInterface *)&v3 init];
}

- (void)grabUnreadFor:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  id v6 = [objc_alloc((Class)AAFPromise) initWithValue:&__NSArray0__struct];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  id v22 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      id v7 = 0;
      id v8 = v6;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v7);
        [v8 then:v19];
        v25 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100005620;
        v32[3] = &unk_100020E48;
        v32[4] = v9;
        v24 = ((void (**)(void, void *))v25)[2](v25, v32);
        id v10 = [v24 then];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100005730;
        v31[3] = &unk_100020E48;
        v31[4] = v9;
        v23 = ((void (**)(void, void *))v10)[2](v10, v31);
        id v11 = [v23 then];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100005840;
        v30[3] = &unk_100020E48;
        v30[4] = v9;
        id v12 = ((void (**)(void, void *))v11)[2](v11, v30);
        id v13 = [v12 then];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000594C;
        v29[3] = &unk_100020E48;
        v29[4] = v9;
        id v14 = ((void (**)(void, void *))v13)[2](v13, v29);
        v15 = [v14 then];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100005A58;
        v28[3] = &unk_100020E48;
        v28[4] = v9;
        ((void (**)(void, void *))v15)[2](v15, v28);
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        id v7 = (char *)v7 + 1;
        id v8 = v6;
      }
      while (v22 != v7);
      id v22 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v22);
  }

  v16 = [v6 then];
  v17 = ((void (**)(void, Block_layout *))v16)[2](v16, &stru_100020E88);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100005D84;
  v26[3] = &unk_100020ED8;
  id v27 = v19;
  id v18 = v19;
  [v17 onComplete:v26];
}

@end