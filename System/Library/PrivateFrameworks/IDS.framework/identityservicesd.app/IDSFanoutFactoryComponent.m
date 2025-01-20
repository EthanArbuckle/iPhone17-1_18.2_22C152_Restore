@interface IDSFanoutFactoryComponent
- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8;
- (id)runIndividuallyWithInput:(id)a3;
- (void)addMessage:(id)a3 toFanout:(id)a4;
- (void)setExpiration:(id)a3 onFanout:(id)a4 withMessage:(id)a5;
@end

@implementation IDSFanoutFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v76 = objc_alloc_init((Class)NSMutableArray);
  id v84 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v4 guid];
  v6 = [v4 prioritizedTokenList];
  v7 = [v6 prioritizedTokens];

  v74 = v7;
  id v83 = v4;
  v73 = (void *)v5;
  if ([v7 count])
  {
    v8 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v109 = v5;
      __int16 v110 = 2112;
      id v111 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "GUID %@ Prioritizing tokens %@", buf, 0x16u);
    }

    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id obj = [v4 aggregatableMessages];
    id v11 = [obj countByEnumeratingWithState:&v104 objects:v118 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v105;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v105 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          v16 = [v15 targetToken];
          v17 = [v16 rawToken];
          unsigned int v18 = [v74 containsObject:v17];

          if (v18) {
            v19 = v10;
          }
          else {
            v19 = v9;
          }
          [v19 addObject:v15];
        }
        id v12 = [obj countByEnumeratingWithState:&v104 objects:v118 count:16];
      }
      while (v12);
    }

    v20 = [v10 arrayByAddingObjectsFromArray:v9];

    id v4 = v83;
  }
  else
  {
    v20 = [v4 aggregatableMessages];
  }
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v72 = v20;
  id obja = [v72 countByEnumeratingWithState:&v100 objects:v117 count:16];
  if (obja)
  {
    uint64_t v78 = *(void *)v101;
    uint64_t v21 = 1;
    do
    {
      for (j = 0; j != obja; j = (char *)j + 1)
      {
        if (*(void *)v101 != v78) {
          objc_enumerationMutation(v72);
        }
        v23 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
        v24 = [v23 command];
        v25 = v24;
        if (v24)
        {
          v26 = v24;
        }
        else
        {
          v27 = [v4 messageToSend];
          v28 = [v27 additionalDictionary];
          v26 = [v28 objectForKey:@"c"];
        }
        v29 = [v84 objectForKey:v26];
        if (([v4 forceOnePerFanout] & 1) != 0
          || ([v29 hasSpaceForAggregatableMessage:v23] & 1) == 0)
        {
          if (v29)
          {
            id v30 = [v29 copy];
            [v76 addObject:v30];
          }
          v31 = [v4 messageToSend];
          v32 = [v4 service];
          v33 = [v4 fromIdentity];
          uint64_t v34 = -[IDSFanoutFactoryComponent createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:](self, "createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:", v31, v32, v33, [v4 maxSize], v21, v23);

          ++v21;
          if (v26) {
            v35 = v26;
          }
          else {
            v35 = &off_1009D0B88;
          }
          [v84 setObject:v34 forKey:v35];
          v29 = (void *)v34;
          id v4 = v83;
        }
        v36 = [v23 expirationDate];
        v37 = [v4 messageToSend];
        [(IDSFanoutFactoryComponent *)self setExpiration:v36 onFanout:v29 withMessage:v37];

        [(IDSFanoutFactoryComponent *)self addMessage:v23 toFanout:v29];
      }
      id obja = [v72 countByEnumeratingWithState:&v100 objects:v117 count:16];
    }
    while (obja);
  }

  v38 = [v84 allValues];
  [v76 addObjectsFromArray:v38];

  v39 = +[IDSFoundationLog delivery];
  v40 = v73;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = [v76 count];
    *(_DWORD *)buf = 138412546;
    uint64_t v109 = (uint64_t)v73;
    __int16 v110 = 2048;
    id v111 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "GUID %@ Constructed %lu fanouts", buf, 0x16u);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v71 = v76;
  id v77 = [v71 countByEnumeratingWithState:&v96 objects:v116 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v97;
    *(void *)&long long v42 = 138412802;
    long long v70 = v42;
    do
    {
      for (id k = 0; k != v77; id k = (char *)k + 1)
      {
        if (*(void *)v97 != v75) {
          objc_enumerationMutation(v71);
        }
        v44 = *(void **)(*((void *)&v96 + 1) + 8 * (void)k);
        id v45 = objc_alloc_init((Class)NSMutableArray);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        v46 = [v44 individualPeerMessages];
        id v47 = [v46 countByEnumeratingWithState:&v92 objects:v115 count:16];
        if (!v47)
        {

          v56 = &IDSRegistrationPropertySupportsAVLess_ptr;
LABEL_56:
          objc_msgSend(v44, "setWantsCertifiedDelivery:", 1, v70);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          v57 = [v44 individualPeerMessages];
          id v58 = [v57 countByEnumeratingWithState:&v88 objects:v114 count:16];
          if (v58)
          {
            id v59 = v58;
            uint64_t v60 = *(void *)v89;
            do
            {
              for (m = 0; m != v59; m = (char *)m + 1)
              {
                if (*(void *)v89 != v60) {
                  objc_enumerationMutation(v57);
                }
                [*(id *)(*((void *)&v88 + 1) + 8 * (void)m) setWantsCertifiedDelivery:0];
              }
              id v59 = [v57 countByEnumeratingWithState:&v88 objects:v114 count:16];
            }
            while (v59);
          }

          goto LABEL_64;
        }
        id v48 = v47;
        v79 = v44;
        id objb = k;
        uint64_t v49 = *(void *)v93;
        unsigned __int8 v50 = 1;
        do
        {
          for (n = 0; n != v48; n = (char *)n + 1)
          {
            if (*(void *)v93 != v49) {
              objc_enumerationMutation(v46);
            }
            v52 = *(void **)(*((void *)&v92 + 1) + 8 * (void)n);
            v53 = objc_msgSend(v52, "targetPeerID", v70);
            v54 = [v52 targetToken];
            v55 = [v53 URIByAddingPushToken:v54];

            if (v55) {
              [v45 addObject:v55];
            }
            if (v50) {
              unsigned __int8 v50 = [v52 wantsCertifiedDelivery];
            }
            else {
              unsigned __int8 v50 = 0;
            }
          }
          id v48 = [v46 countByEnumeratingWithState:&v92 objects:v115 count:16];
        }
        while (v48);

        v40 = v73;
        v56 = &IDSRegistrationPropertySupportsAVLess_ptr;
        v44 = v79;
        id k = objb;
        if (v50) {
          goto LABEL_56;
        }
LABEL_64:
        v62 = [v56[288] delivery];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = [v44 chunkNumber];
          *(_DWORD *)buf = v70;
          uint64_t v109 = (uint64_t)v40;
          __int16 v110 = 2112;
          id v111 = v63;
          __int16 v112 = 2048;
          v113 = v44;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "GUID %@ finished constructing fanout %@ %p", buf, 0x20u);
        }
        v64 = [v44 chunkNumber];
        v65 = [v45 description];
        id v85 = v40;
        v86 = v64;
        v87 = v65;
        id v66 = v65;
        id v67 = v64;
        cut_dispatch_log_queue();

        id v4 = v83;
      }
      id v77 = [v71 countByEnumeratingWithState:&v96 objects:v116 count:16];
    }
    while (v77);
  }

  [v4 setAggregateMessages:v71];
  v68 = +[CUTUnsafePromise fulfilledPromiseWithValue:v4];

  return v68;
}

- (void)addMessage:(id)a3 toFanout:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v5 addAggregatableMessage:v8];
  v6 = [v8 encryptionType];
  v7 = [v5 encryptionType];

  if (v6 == v7) {
    [v8 setEncryptionType:0];
  }
}

- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  v17 = [[IDSPeerAggregateMessage alloc] initWithPeerMessage:v13 service:v16 fromIdentity:v15 maxSize:a6];

  unsigned int v18 = +[NSNumber numberWithInteger:a7];
  [(IDSPeerAggregateMessage *)v17 setChunkNumber:v18];

  v19 = [v14 encryptionType];

  if (v19)
  {
    v20 = [v14 encryptionType];
    [(IDSPeerAggregateMessage *)v17 setEncryptionType:v20];
  }
  uint64_t v21 = [(IDSPeerAggregateMessage *)v17 additionalDictionary];
  id v22 = [v21 mutableCopy];
  v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v25 = v24;

  v26 = [v13 messageBody];
  v27 = [v26 objectForKey:IDSCommandKey];

  v28 = [v14 command];

  if (v28)
  {
    v29 = [v14 command];
    [v25 setObject:v29 forKey:@"c"];

    if (v27)
    {
      id v30 = [v13 additionalDictionary];
      v31 = [v30 objectForKey:@"c"];
      [v25 setObject:v31 forKey:@"oC"];
    }
  }
  if (([v27 isEqualToNumber:&off_1009D0BA0] & 1) == 0)
  {
    v32 = [v13 deliveryMinimumTimeDelay];
    if (v32)
    {
    }
    else
    {
      v33 = [v13 deliveryMinimumTime];

      if (!v33) {
        goto LABEL_15;
      }
    }
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v34 = _IDSScheduledSendVersionNumber();
    [v25 setObject:v34 forKey:@"sv"];
  }
LABEL_15:
  [(IDSPeerAggregateMessage *)v17 setAdditionalDictionary:v25];

  return v17;
}

- (void)setExpiration:(id)a3 onFanout:(id)a4 withMessage:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v15)
  {
    [v15 timeIntervalSinceNow];
    if (v9 > 0.0)
    {
      [v15 timeIntervalSinceNow];
      double v11 = v10;
      [v8 timeout];
      if (v11 < v12)
      {
        [v7 timeout];
        if (v13 == 0.0 || ([v7 timeout], v11 < v14)) {
          [v7 setTimeout:v11];
        }
      }
    }
  }
}

@end