@interface IMMessagesToTrack
+ (id)sharedInstance;
- (IMMessagesToTrack)init;
- (NSMutableOrderedSet)recentMessageIDs;
- (OS_dispatch_queue)internalQueue;
- (unint64_t)currentNumberOfMessages;
- (unint64_t)maxNumberOfMessages;
- (void)addMessagesID:(id)a3;
- (void)containsMessageID:(id)a3 completion:(id)a4;
- (void)setInternalQueue:(id)a3;
- (void)setRecentMessageIDs:(id)a3;
@end

@implementation IMMessagesToTrack

+ (id)sharedInstance
{
  if (qword_1EBE2B8D8 != -1) {
    dispatch_once(&qword_1EBE2B8D8, &unk_1F3391C00);
  }
  v2 = (void *)qword_1EBE2BA18;

  return v2;
}

- (IMMessagesToTrack)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMMessagesToTrack;
  v2 = [(IMMessagesToTrack *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", -[IMMessagesToTrack maxNumberOfMessages](v2, "maxNumberOfMessages"));
    recentMessageIDs = v2->_recentMessageIDs;
    v2->_recentMessageIDs = (NSMutableOrderedSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.private.Messages.IMMessagesToTrack", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)addMessagesID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1D980C8B8;
    v7[3] = &unk_1E6B73218;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
}

- (void)containsMessageID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      internalQueue = self->_internalQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D980CA58;
      block[3] = &unk_1E6B73AD8;
      id v12 = v7;
      block[4] = self;
      id v11 = v6;
      dispatch_async(internalQueue, block);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (unint64_t)maxNumberOfMessages
{
  return 50;
}

- (unint64_t)currentNumberOfMessages
{
  v2 = [(IMMessagesToTrack *)self recentMessageIDs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMutableOrderedSet)recentMessageIDs
{
  return self->_recentMessageIDs;
}

- (void)setRecentMessageIDs:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_recentMessageIDs, 0);
}

@end