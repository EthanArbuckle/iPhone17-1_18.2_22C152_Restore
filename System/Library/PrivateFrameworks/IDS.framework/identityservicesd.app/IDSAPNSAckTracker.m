@interface IDSAPNSAckTracker
- (IDSAPNSAckTrackerDelegate)delegate;
- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6;
- (void)addBlockToAggregateMessage:(id)a3 guid:(id)a4;
- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4;
- (void)setDelegate:(id)a3;
- (void)trackMMLMessages:(id)a3 forURIs:(id)a4;
- (void)trackMessages:(id)a3 forURIs:(id)a4;
@end

@implementation IDSAPNSAckTracker

- (void)trackMMLMessages:(id)a3 forURIs:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v6;
  id v24 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        v9 = [v8 identifier];
        [(IDSAPNSAckTracker *)self addBlockToMMLMessage:v8 guid:v9];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v26 = [v8 aggregateMessages];
        id v29 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v29)
        {
          uint64_t v28 = *(void *)v36;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = v10;
              v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
              v12 = [v27 objectForKey:v11];
              id v13 = objc_alloc_init((Class)NSMutableSet);
              v14 = [v11 messageID];
              [(IDSAPNSAckTracker *)self addBlockToAggregateMessage:v11 guid:v14];

              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              v15 = [v11 individualPeerMessages];
              id v16 = [v15 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v32;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v32 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                    v21 = [v11 messageID];
                    [(IDSAPNSAckTracker *)self addBlockToAggregatableMessage:v20 forURIs:v12 trackingSet:v13 guid:v21];
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }
                while (v17);
              }

              uint64_t v10 = v30 + 1;
            }
            while ((id)(v30 + 1) != v29);
            id v29 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v29);
        }

        uint64_t v7 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v24);
  }
}

- (void)trackMessages:(id)a3 forURIs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v9;
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v11 = [v10 messageID];
        [(IDSAPNSAckTracker *)self addBlockToAggregateMessage:v10 guid:v11];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v12 = [v10 individualPeerMessages];
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v18 = [v10 messageID];
              [(IDSAPNSAckTracker *)self addBlockToAggregatableMessage:v17 forURIs:v7 trackingSet:v8 guid:v18];
            }
            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v14);
        }

        uint64_t v9 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
}

- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F3ED8;
  v8[3] = &unk_100985F88;
  id v9 = a4;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  [v6 setDeliveryAcknowledgementBlock:v7];
}

- (void)addBlockToAggregateMessage:(id)a3 guid:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F4138;
  v8[3] = &unk_100985F88;
  id v9 = a4;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  [v6 setDeliveryAcknowledgementBlock:v7];
}

- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = +[NSString stringGUID];
  [v11 addObject:v14];
  uint64_t v15 = [v13 targetPeerID];
  id v16 = [v13 targetToken];
  uint64_t v17 = [v15 URIByAddingPushToken:v16];

  long long v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  long long v26 = sub_1001F43CC;
  long long v27 = &unk_100985FB0;
  id v28 = v12;
  id v29 = v17;
  long long v30 = self;
  id v31 = v11;
  id v32 = v14;
  id v33 = v10;
  id v18 = v10;
  id v19 = v14;
  id v20 = v11;
  id v21 = v17;
  id v22 = v12;
  long long v23 = objc_retainBlock(&v24);
  objc_msgSend(v13, "setAckBlock:", v23, v24, v25, v26, v27);
}

- (IDSAPNSAckTrackerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end