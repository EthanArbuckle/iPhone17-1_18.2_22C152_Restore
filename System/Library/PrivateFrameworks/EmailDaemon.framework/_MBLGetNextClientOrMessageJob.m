@interface _MBLGetNextClientOrMessageJob
- (MBLSingleMessageClient)nextClient;
- (MFMailMessage)nextMessage;
- (NSArray)clients;
- (NSArray)messages;
- (NSArray)viewingMessages;
- (id)initForMBLMailbox:(id)a3;
- (void)run;
- (void)setClients:(id)a3;
- (void)setMessages:(id)a3;
- (void)setViewingMessages:(id)a3;
@end

@implementation _MBLGetNextClientOrMessageJob

- (void)run
{
  v27 = self;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000495F4;
  v50[3] = &unk_10013B1F8;
  id v28 = objc_loadWeakRetained(&self->_messageBodyLoader);
  id v51 = v28;
  v32 = objc_retainBlock(v50);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = -86;
  char v49 = ((uint64_t (*)(void))v32[2])();
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100049680;
  v45[3] = &unk_10013B220;
  v45[4] = v27;
  v45[5] = &v46;
  v31 = objc_retainBlock(v45);
  v30 = +[MailAccount activeAccounts];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = v27->_clients;
  id v2 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v42;
    p_nextClient = (id *)&v27->_nextClient;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v42 != v3) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
      if ((((uint64_t (*)(void *, void *))v31[2])(v31, v6) & 1) == 0)
      {
        v7 = [v6 message];
        v8 = [v7 account];
        unsigned __int8 v9 = [v30 containsObject:v8];

        if (v9) {
          objc_storeStrong(p_nextClient, v6);
        }
        objc_msgSend(v28, "removeSingleMessageClient:", v6, v27);
      }
      *((unsigned char *)v47 + 24) = ((uint64_t (*)(void))v32[2])();
      if (*p_nextClient) {
        break;
      }
      if (v2 == (id)++v5)
      {
        id v2 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v54 count:16];
        if (v2) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v27->_nextClient && !*((unsigned char *)v47 + 24))
  {
    v10 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v11 = v27->_messages;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (!sub_10004973C((uint64_t)objc_msgSend(v10, "addObject:", v15, v27), v15))
          {
            v16 = [v15 account];
            unsigned int v17 = [v30 containsObject:v16];

            if (v17)
            {
              objc_storeStrong((id *)&v27->_nextMessage, v15);
              goto LABEL_26;
            }
          }
        }
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_26:

    v18 = +[NSArray arrayWithArray:v10];
    [v28 _removeNewMessages:v18];

    [v10 removeAllObjects];
    p_nextMessage = (id *)&v27->_nextMessage;
    if (!v27->_nextMessage && !*((unsigned char *)v47 + 24))
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v20 = v27->_viewingMessages;
      id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v52 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        while (2)
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
            objc_msgSend(v10, "addObject:", v24, v27);
            v25 = [v24 account];
            unsigned int v26 = [v30 containsObject:v25];

            if (v26)
            {
              objc_storeStrong(p_nextMessage, v24);
              goto LABEL_38;
            }
          }
          id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v52 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_38:

      [v28 _removeViewingMessages:v10];
    }
  }
  _Block_object_dispose(&v46, 8);
}

- (id)initForMBLMailbox:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MBLGetNextClientOrMessageJob;
  uint64_t v5 = [(_MBLGetNextClientOrMessageJob *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_messageBodyLoader, v4);
  }

  return v6;
}

- (NSArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (MBLSingleMessageClient)nextClient
{
  return self->_nextClient;
}

- (MFMailMessage)nextMessage
{
  return self->_nextMessage;
}

- (NSArray)viewingMessages
{
  return self->_viewingMessages;
}

- (void)setViewingMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewingMessages, 0);
  objc_storeStrong((id *)&self->_nextMessage, 0);
  objc_storeStrong((id *)&self->_nextClient, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_destroyWeak(&self->_messageBodyLoader);
}

@end