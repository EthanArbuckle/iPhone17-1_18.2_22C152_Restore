@interface IDSMadridAckTracker
- (IDSMadridAckTrackerDelegate)delegate;
- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6;
- (void)addBlockToAggregateMessage:(id)a3 forURIs:(id)a4 messageQueue:(id)a5 guid:(id)a6;
- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4;
- (void)setDelegate:(id)a3;
- (void)trackMMLMessages:(id)a3 forURIs:(id)a4 messageQueue:(id)a5;
- (void)trackMessages:(id)a3 forURIs:(id)a4 messageQueue:(id)a5;
@end

@implementation IDSMadridAckTracker

- (void)trackMMLMessages:(id)a3 forURIs:(id)a4 messageQueue:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v8;
  id v26 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v43;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v9;
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
        v11 = [v10 identifier];
        [(IDSMadridAckTracker *)self addBlockToMMLMessage:v10 guid:v11];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v28 = [v10 aggregateMessages];
        id v32 = [v28 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v32)
        {
          uint64_t v31 = *(void *)v39;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v39 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = v12;
              v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
              v14 = [v30 objectForKey:v13];
              id v15 = objc_alloc_init((Class)NSMutableSet);
              v16 = [v13 messageID];
              [(IDSMadridAckTracker *)self addBlockToAggregateMessage:v13 forURIs:v14 messageQueue:v29 guid:v16];

              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              v17 = [v13 individualPeerMessages];
              id v18 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v35;
                do
                {
                  for (i = 0; i != v19; i = (char *)i + 1)
                  {
                    if (*(void *)v35 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                    v23 = [v13 messageID];
                    [(IDSMadridAckTracker *)self addBlockToAggregatableMessage:v22 forURIs:v14 trackingSet:v15 guid:v23];
                  }
                  id v19 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v19);
              }

              uint64_t v12 = v33 + 1;
            }
            while ((id)(v33 + 1) != v32);
            id v32 = [v28 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v32);
        }

        uint64_t v9 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v26);
  }
}

- (void)trackMessages:(id)a3 forURIs:(id)a4 messageQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v24 = a5;
  overallSendTimestamp = self->_overallSendTimestamp;
  self->_overallSendTimestamp = 0;

  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v12;
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        v14 = [v13 messageID];
        [(IDSMadridAckTracker *)self addBlockToAggregateMessage:v13 forURIs:v9 messageQueue:v24 guid:v14];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v15 = [v13 individualPeerMessages];
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v21 = [v13 messageID];
              [(IDSMadridAckTracker *)self addBlockToAggregatableMessage:v20 forURIs:v9 trackingSet:v11 guid:v21];
            }
            id v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v17);
        }

        uint64_t v12 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }
}

- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10040D9C4;
  v8[3] = &unk_100985CB8;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v5 setCompletionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)addBlockToAggregateMessage:(id)a3 forURIs:(id)a4 messageQueue:(id)a5 guid:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = [v10 wantsResponse];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10040DF58;
  v18[3] = &unk_10098CD00;
  objc_copyWeak(&v23, &location);
  id v15 = v13;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  v21 = self;
  unsigned __int8 v24 = v14;
  id v17 = v12;
  id v22 = v17;
  [v10 setCompletionBlock:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  unsigned __int8 v14 = +[NSString stringGUID];
  [v11 addObject:v14];
  id v15 = [v13 completionBlock];
  id v16 = [v15 copy];

  id v17 = [v13 targetPeerID];
  uint64_t v18 = [v13 targetToken];
  id v19 = [v17 URIByAddingPushToken:v18];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10040E6BC;
  v27[3] = &unk_10098CD28;
  id v28 = v12;
  id v29 = v19;
  long long v30 = self;
  id v31 = v11;
  id v32 = v14;
  id v33 = v10;
  id v34 = v16;
  id v20 = v16;
  id v21 = v10;
  id v22 = v14;
  id v23 = v11;
  id v24 = v19;
  id v25 = v12;
  uint64_t v26 = objc_retainBlock(v27);
  [v13 setCompletionBlock:v26];
}

- (IDSMadridAckTrackerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_overallSendTimestamp, 0);
}

@end