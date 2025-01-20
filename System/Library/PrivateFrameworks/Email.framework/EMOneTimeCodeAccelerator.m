@interface EMOneTimeCodeAccelerator
+ (id)log;
- (EFCancelable)cancelable;
- (EMDaemonInterface)daemonInterface;
- (EMOneTimeCodeAccelerator)initWithDaemonInterface:(id)a3 updateBlock:(id)a4;
- (EMOneTimeCodeAccelerator)initWithUpdateBlock:(id)a3;
- (OS_dispatch_queue)oneTimeCodeQueue;
- (id)updateBlock;
- (void)dealloc;
- (void)deleteOneTimeCodeEmails:(int64_t)a3;
- (void)didEnterOneTimeCodeField;
- (void)didExitOneTimeCodeField;
- (void)didFillOneTimeCode:(int64_t)a3;
- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7 observers:(unint64_t)a8;
- (void)setCancelable:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)startObservingOneTimeCode;
@end

@implementation EMOneTimeCodeAccelerator

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EMOneTimeCodeAccelerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1) {
    dispatch_once(&log_onceToken_30, block);
  }
  v2 = (void *)log_log_30;
  return v2;
}

void __31__EMOneTimeCodeAccelerator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;
}

- (EMOneTimeCodeAccelerator)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EMDaemonInterface);
  v6 = [(EMOneTimeCodeAccelerator *)self initWithDaemonInterface:v5 updateBlock:v4];

  return v6;
}

- (EMOneTimeCodeAccelerator)initWithDaemonInterface:(id)a3 updateBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EMOneTimeCodeAccelerator;
  v9 = [(EMOneTimeCodeAccelerator *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonInterface, a3);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.email.EMOneTimeCodeAccelerator.oneTimeCodeQueue", v12);
    oneTimeCodeQueue = v10->_oneTimeCodeQueue;
    v10->_oneTimeCodeQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = MEMORY[0x1C18A2160](v8);
    id updateBlock = v10->_updateBlock;
    v10->_id updateBlock = (id)v15;

    [(EMOneTimeCodeAccelerator *)v10 startObservingOneTimeCode];
  }

  return v10;
}

- (void)startObservingOneTimeCode
{
  id v5 = [(EMOneTimeCodeAccelerator *)self daemonInterface];
  id v3 = [v5 messageRepository];
  id v4 = [v3 startObservingOneTimeCodes:self];
  [(EMOneTimeCodeAccelerator *)self setCancelable:v4];
}

- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7 observers:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  objc_super v18 = [(EMOneTimeCodeAccelerator *)self oneTimeCodeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__EMOneTimeCodeAccelerator_didReceiveOneTimeCode_timestamp_messageID_subject_senders_observers___block_invoke;
  block[3] = &unk_1E63E5B18;
  id v24 = v16;
  id v25 = v17;
  id v26 = v14;
  id v27 = v15;
  int64_t v29 = a5;
  unint64_t v30 = a8;
  v28 = self;
  id v19 = v15;
  id v20 = v14;
  id v21 = v17;
  id v22 = v16;
  dispatch_async(v18, block);
}

void __96__EMOneTimeCodeAccelerator_didReceiveOneTimeCode_timestamp_messageID_subject_senders_observers___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = +[EMOneTimeCodeAccelerator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:*(void *)(a1 + 32)];
    id v4 = [MEMORY[0x1E4F60E00] partiallyRedactedStringFromArray:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = [*(id *)(a1 + 56) description];
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    int v10 = 138413570;
    id v11 = v3;
    __int16 v12 = 2112;
    dispatch_queue_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "Received one-time code subject: %@, sender: %@, data: %@, timestamp: %@, GlobalMessageID: %lld, Current Observers: %lu", (uint8_t *)&v10, 0x3Eu);
  }
  v9 = [*(id *)(a1 + 64) updateBlock];
  v9[2](v9, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 72));
}

- (void)didEnterOneTimeCodeField
{
  if (_os_feature_enabled_impl())
  {
    id v3 = +[EMOneTimeCodeAccelerator log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "One Time Code field has been entered.", buf, 2u);
    }

    id v4 = [(EMOneTimeCodeAccelerator *)self daemonInterface];
    uint64_t v5 = [v4 fetchController];
    [v5 performFetchForOTC];

    v6 = +[EMOneTimeCodeAccelerator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "Start fetching email with One Time Code", v7, 2u);
    }
  }
}

- (void)didExitOneTimeCodeField
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[EMOneTimeCodeAccelerator log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "One Time Code field has been exited.", v3, 2u);
    }
  }
}

- (void)didFillOneTimeCode:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = +[EMOneTimeCodeAccelerator log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "One Time Code from message with GlobalMessageID: %lld was added to text field", (uint8_t *)&v6, 0xCu);
    }

    [(EMOneTimeCodeAccelerator *)self deleteOneTimeCodeEmails:a3];
  }
}

- (void)deleteOneTimeCodeEmails:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [EMMessageObjectID alloc];
  int v6 = +[EMMailboxScope allMailboxesScope];
  int64_t v7 = [(EMMessageObjectID *)v5 initWithGlobalMessageID:a3 mailboxScope:v6];

  uint64_t v8 = [(EMOneTimeCodeAccelerator *)self daemonInterface];
  v9 = [v8 messageRepository];
  [v9 performOneTimeCodeMessageDeletionWithObjectID:v7 afterDelay:0.0];

  int v10 = +[EMOneTimeCodeAccelerator log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "Used one-time code email with GlobalMessageID %lld is moved to the trash folder", (uint8_t *)&v11, 0xCu);
  }
}

- (void)dealloc
{
  id v3 = [(EMOneTimeCodeAccelerator *)self cancelable];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)EMOneTimeCodeAccelerator;
  [(EMOneTimeCodeAccelerator *)&v4 dealloc];
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (EFCancelable)cancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCancelable:(id)a3
{
}

- (OS_dispatch_queue)oneTimeCodeQueue
{
  return self->_oneTimeCodeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimeCodeQueue, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

@end