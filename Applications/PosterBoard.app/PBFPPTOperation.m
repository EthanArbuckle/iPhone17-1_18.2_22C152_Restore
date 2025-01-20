@interface PBFPPTOperation
+ (id)operationToAddPosterWithProvider:(id)a3 descriptorIdentifier:(id)a4 completion:(id)a5;
+ (id)operationToDeletePosters:(id)a3;
+ (id)operationToExitPosterSwitcher;
+ (id)operationToFinishTest:(id)a3;
+ (id)operationToPushInToPosterSwitcher;
+ (id)operationToResetSwitcher;
+ (id)operationToScrollToFirstPoster:(BOOL)a3;
+ (id)operationToStartTest:(id)a3;
+ (id)operationToSynthesizeEventsForEventActions:(id)a3;
+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5;
+ (id)operationToWaitForTimeInterval:(double)a3;
+ (void)enqueueOperations:(id)a3;
- (NSString)operationName;
- (PBFPPTOperation)init;
- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4;
- (id)markFinishedTest:(id)a3;
- (id)markStartSubTest:(id)a3 forTestName:(id)a4;
- (id)markStartedTest:(id)a3;
- (void)operationDidFinish;
- (void)operationWillStart;
- (void)setOperationName:(id)a3;
@end

@implementation PBFPPTOperation

+ (id)operationToStartTest:(id)a3
{
  id v4 = a3;
  v5 = +[PBFPPTBlockOperation operationWithBlock:&stru_10000C760];
  v6 = NSStringFromSelector(a2);
  v7 = +[NSString stringWithFormat:@"%@%@", v6, v4];
  [v5 setOperationName:v7];

  id v8 = [v5 markStartedTest:v4];

  return v5;
}

+ (id)operationToFinishTest:(id)a3
{
  id v4 = a3;
  v5 = +[PBFPPTBlockOperation operationWithBlock:&stru_10000C780];
  v6 = NSStringFromSelector(a2);
  v7 = +[NSString stringWithFormat:@"%@%@", v6, v4];
  [v5 setOperationName:v7];

  id v8 = [v5 markFinishedTest:v4];

  return v5;
}

+ (id)operationToWaitForTimeInterval:(double)a3
{
  id v4 = NSStringFromSelector(a2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000536C;
  v7[3] = &unk_10000C7A0;
  *(double *)&v7[4] = a3;
  v5 = +[PBFPPTBlockOperation operationWithName:v4 block:v7];

  return v5;
}

+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = NSStringFromSelector(a2);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005548;
  v15[3] = &unk_10000C7F0;
  id v16 = v8;
  id v17 = v9;
  double v18 = a5;
  id v11 = v9;
  id v12 = v8;
  v13 = +[PBFPPTBlockOperation operationWithName:v10 block:v15];

  return v13;
}

+ (id)operationToSynthesizeEventsForEventActions:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005794;
  v9[3] = &unk_10000C818;
  id v10 = v4;
  id v6 = v4;
  v7 = +[PBFPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

+ (id)operationToResetSwitcher
{
  v3 = +[PosterBoardTestingUtilities posterRackViewController];
  id v4 = NSStringFromSelector(a2);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000591C;
  v8[3] = &unk_10000C530;
  id v9 = v3;
  id v5 = v3;
  id v6 = +[PBFPPTBlockOperation operationWithName:v4 block:v8];

  return v6;
}

+ (id)operationToScrollToFirstPoster:(BOOL)a3
{
  id v5 = +[PosterBoardTestingUtilities posterRackViewController];
  id v6 = NSStringFromSelector(a2);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005AAC;
  v10[3] = &unk_10000C840;
  id v11 = v5;
  BOOL v12 = a3;
  id v7 = v5;
  id v8 = +[PBFPPTBlockOperation operationWithName:v6 block:v10];

  return v8;
}

+ (id)operationToExitPosterSwitcher
{
  v3 = [a1 operationToSynthesizeEventsForEventActions:&stru_10000C6D0];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  return v3;
}

+ (id)operationToPushInToPosterSwitcher
{
  v3 = +[PosterBoardTestingUtilities posterRackViewController];
  id v4 = NSStringFromSelector(a2);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005CAC;
  v8[3] = &unk_10000C530;
  id v9 = v3;
  id v5 = v3;
  id v6 = +[PBFPPTBlockOperation operationWithName:v4 block:v8];

  return v6;
}

+ (id)operationToAddPosterWithProvider:(id)a3 descriptorIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[PosterBoardTestingUtilities posterRackViewController];
  BOOL v12 = [v11 posterExtensionDataStore];
  v13 = NSStringFromSelector(a2);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005F9C;
  v20[3] = &unk_10000C890;
  id v21 = v12;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v12;
  double v18 = +[PBFPPTBlockOperation operationWithName:v13 block:v20];

  return v18;
}

+ (id)operationToDeletePosters:(id)a3
{
  id v4 = a3;
  id v5 = +[PosterBoardTestingUtilities posterRackViewController];
  id v6 = [v5 posterExtensionDataStore];
  id v7 = NSStringFromSelector(a2);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006258;
  v12[3] = &unk_10000C8B8;
  id v13 = v6;
  id v14 = v4;
  id v8 = v6;
  id v9 = v4;
  id v10 = +[PBFPPTBlockOperation operationWithName:v7 block:v12];

  return v10;
}

- (PBFPPTOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)PBFPPTOperation;
  v2 = [(PBFPPTOperation *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = +[NSString stringWithFormat:@"<%@: %p>", v4, v2];
    operationName = v2->_operationName;
    v2->_operationName = (NSString *)v5;
  }
  return v2;
}

- (id)markStartedTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006538;
  v9[3] = &unk_10000C8E0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_retainBlock(v9);
  id startTestBlock = self->_startTestBlock;
  self->_id startTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

- (id)markFinishedTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006720;
  v9[3] = &unk_10000C8E0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_retainBlock(v9);
  id finishTestBlock = self->_finishTestBlock;
  self->_id finishTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

- (id)markStartSubTest:(id)a3 forTestName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006928;
  v13[3] = &unk_10000C908;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = objc_retainBlock(v13);
  id startSubTestBlock = self->_startSubTestBlock;
  self->_id startSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006B38;
  v13[3] = &unk_10000C908;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = objc_retainBlock(v13);
  id finishSubTestBlock = self->_finishSubTestBlock;
  self->_id finishSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (void)operationWillStart
{
  self->_operationStartTime = CFAbsoluteTimeGetCurrent();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (PBFPPTOperation *)self->_operationName;
    if (!operationName) {
      operationName = self;
    }
    int v8 = 138412290;
    id v9 = operationName;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting", (uint8_t *)&v8, 0xCu);
  }
  id startTestBlock = (void (**)(void))self->_startTestBlock;
  if (startTestBlock)
  {
    startTestBlock[2]();
    id v5 = self->_startTestBlock;
    self->_id startTestBlock = 0;
  }
  id startSubTestBlock = (void (**)(void))self->_startSubTestBlock;
  if (startSubTestBlock)
  {
    startSubTestBlock[2]();
    id v7 = self->_startSubTestBlock;
    self->_id startSubTestBlock = 0;
  }
}

- (void)operationDidFinish
{
  self->_operationEndTime = CFAbsoluteTimeGetCurrent();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (PBFPPTOperation *)self->_operationName;
    if (!operationName) {
      operationName = self;
    }
    double v4 = self->_operationEndTime - self->_operationStartTime;
    int v9 = 138412546;
    id v10 = operationName;
    __int16 v11 = 2048;
    double v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' executed in %f seconds", (uint8_t *)&v9, 0x16u);
  }
  id finishSubTestBlock = (void (**)(void))self->_finishSubTestBlock;
  if (finishSubTestBlock)
  {
    finishSubTestBlock[2]();
    id v6 = self->_finishSubTestBlock;
    self->_id finishSubTestBlock = 0;
  }
  id finishTestBlock = (void (**)(void))self->_finishTestBlock;
  if (finishTestBlock)
  {
    finishTestBlock[2]();
    id v8 = self->_finishTestBlock;
    self->_id finishTestBlock = 0;
  }
}

+ (void)enqueueOperations:(id)a3
{
  id v3 = a3;
  id v4 = +[NSOperationQueue mainQueue];
  [v4 addOperations:v3 waitUntilFinished:0];
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong(&self->_startSubTestBlock, 0);
  objc_storeStrong(&self->_finishSubTestBlock, 0);
  objc_storeStrong(&self->_startTestBlock, 0);

  objc_storeStrong(&self->_finishTestBlock, 0);
}

@end