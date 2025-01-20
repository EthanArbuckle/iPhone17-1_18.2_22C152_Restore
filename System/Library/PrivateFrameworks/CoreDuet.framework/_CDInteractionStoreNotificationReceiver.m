@interface _CDInteractionStoreNotificationReceiver
- (_CDInteractionStoreNotificationReceiver)init;
- (void)dealloc;
- (void)postPackedMechanisms:(unint64_t)a3;
@end

@implementation _CDInteractionStoreNotificationReceiver

- (_CDInteractionStoreNotificationReceiver)init
{
  v17.receiver = self;
  v17.super_class = (Class)_CDInteractionStoreNotificationReceiver;
  id v2 = [(_CDInteractionStoreNotificationReceiver *)&v17 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    objc_initWeak(&location, v2);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __47___CDInteractionStoreNotificationReceiver_init__block_invoke;
    v14 = &unk_1E560EEE8;
    objc_copyWeak(&v15, &location);
    v9 = (void *)MEMORY[0x192FB31A0](&v11);
    notify_register_dispatch((const char *)objc_msgSend(@"PSStoreChangedNotificationInternal", "UTF8String", v11, v12, v13, v14), (int *)v2 + 2, *((dispatch_queue_t *)v2 + 2), v9);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return (_CDInteractionStoreNotificationReceiver *)v2;
}

- (void)dealloc
{
  int notifierToken = self->_notifierToken;
  if (notifierToken) {
    notify_cancel(notifierToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CDInteractionStoreNotificationReceiver;
  [(_CDInteractionStoreNotificationReceiver *)&v4 dealloc];
}

- (void)postPackedMechanisms:(unint64_t)a3
{
  int v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = self;
  objc_sync_enter(v4);
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = v5;
  if ((v3 & 0x10000) != 0) {
    [v5 addObject:&unk_1EDE1DF88];
  }
  if ((v3 & 2) != 0) {
    [v6 addObject:&unk_1EDE1DFA0];
  }
  if ((v3 & 4) != 0) {
    [v6 addObject:&unk_1EDE1DFB8];
  }
  if ((v3 & 8) != 0) {
    [v6 addObject:&unk_1EDE1DFD0];
  }
  if ((v3 & 0x10) != 0) {
    [v6 addObject:&unk_1EDE1DFE8];
  }
  if ((v3 & 0x20) != 0) {
    [v6 addObject:&unk_1EDE1E000];
  }
  if ((v3 & 0x40) != 0) {
    [v6 addObject:&unk_1EDE1E018];
  }
  if ((v3 & 0x80) != 0) {
    [v6 addObject:&unk_1EDE1E030];
  }
  if ((v3 & 0x100) != 0) {
    [v6 addObject:&unk_1EDE1E048];
  }
  if ((v3 & 0x200) != 0) {
    [v6 addObject:&unk_1EDE1E060];
  }
  if ((v3 & 0x400) != 0) {
    [v6 addObject:&unk_1EDE1E078];
  }
  if ((v3 & 0x800) != 0) {
    [v6 addObject:&unk_1EDE1E090];
  }
  if ((v3 & 0x20000) != 0) {
    [v6 addObject:&unk_1EDE1E0A8];
  }
  dispatch_queue_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9 = @"kPSStoreChangedMechanismsKey";
  v10[0] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v7 postNotificationName:@"PSStoreChangedNotification" object:0 userInfo:v8];

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end