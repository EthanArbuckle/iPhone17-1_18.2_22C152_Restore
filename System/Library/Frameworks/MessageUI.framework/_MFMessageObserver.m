@interface _MFMessageObserver
+ (id)sharedObserver;
+ (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4;
+ (void)observeMessageGUID:(id)a3 completion:(id)a4;
+ (void)removeCompletionForMessageGUID:(id)a3;
- (_MFMessageObserver)init;
- (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4;
- (void)observeMessageGUID:(id)a3 completion:(id)a4;
- (void)removeCompletionForMessageGUID:(id)a3;
@end

@implementation _MFMessageObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_426);
  }
  v2 = (void *)sharedObserver_sharedObserver;

  return v2;
}

- (_MFMessageObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MFMessageObserver;
  v2 = [(_MFMessageObserver *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionMap = v2->_completionMap;
    v2->_completionMap = v3;

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    getIMMessageSentDistributedNotification();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)_MFMessageSentCallback, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (void)observeMessageGUID:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [a1 sharedObserver];
  [v7 observeMessageGUID:v8 completion:v6];
}

- (void)observeMessageGUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = _Block_copy(a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionMap, "setObject:forKeyedSubscript:");
}

+ (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [a1 sharedObserver];
  [v6 invokeCompletionForMessageGUID:v7 didSend:v4];
}

- (void)invokeCompletionForMessageGUID:(id)a3 didSend:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionMap, "objectForKeyedSubscript:");
  id v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v4);
    [(_MFMessageObserver *)self removeCompletionForMessageGUID:v8];
  }
}

+ (void)removeCompletionForMessageGUID:(id)a3
{
  id v5 = a3;
  BOOL v4 = [a1 sharedObserver];
  [v4 removeCompletionForMessageGUID:v5];
}

- (void)removeCompletionForMessageGUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end