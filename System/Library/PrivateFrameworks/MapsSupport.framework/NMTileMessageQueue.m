@interface NMTileMessageQueue
- (BOOL)removeAllForRequestIdentifier:(id)a3;
- (BOOL)removeMessageForRequestIdentifier:(id)a3;
- (BOOL)removeReplyForRequestIdentifier:(id)a3;
- (NMTileMessageQueue)init;
- (void)dequeueMessageIfPossible:(id)a3 orReply:(id)a4;
- (void)enqueueMessage:(id)a3 options:(id)a4 reply:(id)a5;
- (void)enqueueReply:(id)a3 forMessage:(id)a4 options:(id)a5;
@end

@implementation NMTileMessageQueue

- (NMTileMessageQueue)init
{
  v11.receiver = self;
  v11.super_class = (Class)NMTileMessageQueue;
  v2 = [(NMMessageQueue *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSLock);
    v4 = *(void **)(v2 + 89);
    *(void *)(v2 + 89) = v3;

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = *(void **)(v2 + 73);
    *(void *)(v2 + 73) = v5;

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = *(void **)(v2 + 81);
    *(void *)(v2 + 81) = v7;

    v9 = v2;
  }

  return (NMTileMessageQueue *)v2;
}

- (void)enqueueMessage:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = sub_100012624(v8);
  if (v11)
  {
    [*(id *)((char *)&self->_requestIdentifierToReply + 1) lock];
    v12 = [*(id *)(&self->super._paused + 1) objectForKeyedSubscript:v11];

    if (!v12)
    {
      v13 = +[NSMutableArray array];
      [*(id *)(&self->super._paused + 1) setObject:v13 forKeyedSubscript:v11];
    }
    v14 = [*(id *)(&self->super._paused + 1) objectForKeyedSubscript:v11];
    [v14 addObject:v8];

    [*(id *)((char *)&self->_requestIdentifierToReply + 1) unlock];
  }
  v15.receiver = self;
  v15.super_class = (Class)NMTileMessageQueue;
  [(NMMessageQueue *)&v15 enqueueMessage:v8 options:v9 reply:v10];
}

- (void)enqueueReply:(id)a3 forMessage:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = sub_100012624(v9);
  if (v11)
  {
    [*(id *)((char *)&self->_requestIdentifierToReply + 1) lock];
    [*(id *)((char *)&self->_requestIdentifierToMessages + 1) setObject:v8 forKeyedSubscript:v11];
    [*(id *)((char *)&self->_requestIdentifierToReply + 1) unlock];
  }
  v12.receiver = self;
  v12.super_class = (Class)NMTileMessageQueue;
  [(NMMessageQueue *)&v12 enqueueReply:v8 forMessage:v9 options:v10];
}

- (void)dequeueMessageIfPossible:(id)a3 orReply:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012868;
  v10[3] = &unk_100081538;
  objc_super v11 = self;
  id v12 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000129B0;
  v8[3] = &unk_100081560;
  v8[4] = v11;
  id v9 = a4;
  v7.receiver = v11;
  v7.super_class = (Class)NMTileMessageQueue;
  id v5 = v9;
  id v6 = v12;
  [(NMMessageQueue *)&v7 dequeueMessageIfPossible:v10 orReply:v8];
}

- (BOOL)removeMessageForRequestIdentifier:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) lock];
  id v5 = [*(id *)(&self->super._paused + 1) objectForKey:v4];
  [*(id *)(&self->super._paused + 1) removeObjectForKey:v4];
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) unlock];
  if (v5)
  {
    id v6 = sub_100053F94();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Removing enqueued message for request identifier: %{private}@", buf, 0xCu);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        objc_super v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          -[NMMessageQueue removeMessage:](self, "removeMessage:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
          objc_super v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  return v5 != 0;
}

- (BOOL)removeReplyForRequestIdentifier:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) lock];
  id v5 = [*(id *)((char *)&self->_requestIdentifierToMessages + 1) objectForKey:v4];
  [*(id *)((char *)&self->_requestIdentifierToMessages + 1) removeObjectForKey:v4];
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) unlock];
  if (v5)
  {
    id v6 = sub_100053F94();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138477827;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Removing enqueued reply for request identifier: %{private}@", (uint8_t *)&v8, 0xCu);
    }

    [(NMMessageQueue *)self removeReply:v5];
  }

  return v5 != 0;
}

- (BOOL)removeAllForRequestIdentifier:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) lock];
  uint64_t v5 = [*(id *)(&self->super._paused + 1) objectForKey:v4];
  uint64_t v6 = [*(id *)((char *)&self->_requestIdentifierToMessages + 1) objectForKey:v4];
  [*(id *)(&self->super._paused + 1) removeObjectForKey:v4];
  [*(id *)((char *)&self->_requestIdentifierToMessages + 1) removeObjectForKey:v4];
  [*(id *)((char *)&self->_requestIdentifierToReply + 1) unlock];
  if (v5 | v6)
  {
    id v7 = sub_100053F94();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Removing enqueued messages/reply for request identifier: %{private}@", buf, 0xCu);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = (id)v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[NMMessageQueue removeMessage:](self, "removeMessage:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [(NMMessageQueue *)self removeReply:v6];
  }

  return (v5 | v6) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_requestIdentifierToReply + 1), 0);
  objc_storeStrong((id *)((char *)&self->_requestIdentifierToMessages + 1), 0);

  objc_storeStrong((id *)(&self->super._paused + 1), 0);
}

@end