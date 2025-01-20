@interface _CNBufferedObserver
+ (id)bufferObserver:(id)a3 schedulerProvider:(id)a4;
- (_CNBufferedObserver)initWithObserver:(id)a3 scheduler:(id)a4;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
- (void)resume;
@end

@implementation _CNBufferedObserver

- (void)observerDidReceiveResult:(id)a3
{
  id v4 = a3;
  observerScheduler = self->_observerScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___CNBufferedObserver_observerDidReceiveResult___block_invoke;
  v7[3] = &unk_1E569F310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CNSuspendableSchedulerDecorator *)observerScheduler performBlock:v7];
}

+ (id)bufferObserver:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[a4 newSerialSchedulerWithName:@"com.apple.contacts.reactive.replay-subject.observer"];
  v7 = +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:v6];
  id v8 = [[_CNBufferedObserver alloc] initWithObserver:v5 scheduler:v7];

  return v8;
}

- (_CNBufferedObserver)initWithObserver:(id)a3 scheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNBufferedObserver;
  v9 = [(_CNBufferedObserver *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeStrong((id *)&v10->_observerScheduler, a4);
    v11 = v10;
  }

  return v10;
}

- (void)resume
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_observerScheduler, 0);
}

- (void)observerDidComplete
{
  observerScheduler = self->_observerScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42___CNBufferedObserver_observerDidComplete__block_invoke;
  v3[3] = &unk_1E569F9D8;
  v3[4] = self;
  [(CNSuspendableSchedulerDecorator *)observerScheduler performBlock:v3];
}

- (void)observerDidFailWithError:(id)a3
{
  id v4 = a3;
  observerScheduler = self->_observerScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___CNBufferedObserver_observerDidFailWithError___block_invoke;
  v7[3] = &unk_1E569F310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CNSuspendableSchedulerDecorator *)observerScheduler performBlock:v7];
}

@end