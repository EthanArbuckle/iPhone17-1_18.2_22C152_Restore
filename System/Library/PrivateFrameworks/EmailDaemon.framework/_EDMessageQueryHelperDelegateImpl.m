@interface _EDMessageQueryHelperDelegateImpl
- (EMMessageQueryHelperObserver_xpc)observer;
- (_EDMessageQueryHelperDelegateImpl)initWithMessageQueryHelperObserver:(id)a3 didFindAllMessagesBlock:(id)a4;
- (id)didFindAllMessagesBlock;
- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5;
- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5;
- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5;
- (void)queryHelper:(id)a3 didAddMessages:(id)a4;
- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4;
- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5;
- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5;
- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5;
- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6;
- (void)queryHelperDidFindAllMessages:(id)a3;
- (void)queryHelperDidFinishRemoteSearch:(id)a3;
- (void)queryHelperNeedsRestart:(id)a3;
- (void)setDidFindAllMessagesBlock:(id)a3;
@end

@implementation _EDMessageQueryHelperDelegateImpl

- (_EDMessageQueryHelperDelegateImpl)initWithMessageQueryHelperObserver:(id)a3 didFindAllMessagesBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EDMessageQueryHelperDelegateImpl;
  v9 = [(_EDMessageQueryHelperDelegateImpl *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    v11 = _Block_copy(v8);
    id didFindAllMessagesBlock = v10->_didFindAllMessagesBlock;
    v10->_id didFindAllMessagesBlock = v11;
  }
  return v10;
}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  id v8 = a4;
  id v7 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v7 queryHelperConversationIDDidChangeForMessages:v8 fromConversationID:a5];
}

- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5
{
  id v8 = a4;
  id v7 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v7 queryHelperBusinessIDDidChangeForMessages:v8 fromBusinessID:a5];
}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  id v7 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v7 queryHelperConversationNotificationLevelDidChangeForConversation:a4 conversationID:a5];
}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  id v6 = a4;
  v5 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v5 queryHelperDidAddMessages:v6];
}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  id v6 = a4;
  v5 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v5 queryHelperDidDeleteMessages:v6];
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  id v7 = a4;
  id v6 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v6 queryHelperDidFindMessages:v7];
}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v8 queryHelperDidUpdateMessages:v9 forKeyPaths:v7];
}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  id v7 = a4;
  id v6 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v6 queryHelperMessageFlagsDidChangeForMessages:v7];
}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  id v11 = a4;
  id v9 = a5;
  v10 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v10 queryHelperObjectIDDidChangeForMessage:v11 oldObjectID:v9 oldConversationID:a6];
}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  v4 = [(_EDMessageQueryHelperDelegateImpl *)self didFindAllMessagesBlock];
  v4[2]();

  id v5 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v5 queryHelperDidFindAllMessages];
}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  id v3 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v3 queryHelperDidFinishRemoteSearch];
}

- (void)queryHelperNeedsRestart:(id)a3
{
  id v3 = [(_EDMessageQueryHelperDelegateImpl *)self observer];
  [v3 queryHelperNeedsRestart];
}

- (EMMessageQueryHelperObserver_xpc)observer
{
  return self->_observer;
}

- (id)didFindAllMessagesBlock
{
  return self->_didFindAllMessagesBlock;
}

- (void)setDidFindAllMessagesBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFindAllMessagesBlock, 0);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end