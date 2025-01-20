@interface IDSIMLFanoutFactoryComponent
- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSIMLFanoutFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  id v75 = objc_alloc_init((Class)NSMutableArray);
  id v81 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [v3 guid];
  v5 = [v3 prioritizedTokenList];
  v6 = [v5 prioritizedTokens];

  v73 = v6;
  v82 = v3;
  v72 = (void *)v4;
  if ([v6 count])
  {
    v7 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v110 = v4;
      __int16 v111 = 2112;
      id v112 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GUID %@ Prioritizing tokens %@", buf, 0x16u);
    }

    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v10 = [v3 aggregatableMessages];
    id v11 = [v10 countByEnumeratingWithState:&v100 objects:v108 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v101;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v101 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v100 + 1) + 8 * i);
          v16 = [v15 targetToken];
          v17 = [v16 rawToken];
          unsigned int v18 = [v73 containsObject:v17];

          if (v18) {
            v19 = v9;
          }
          else {
            v19 = v8;
          }
          [v19 addObject:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v100 objects:v108 count:16];
      }
      while (v12);
    }

    v20 = [v9 arrayByAddingObjectsFromArray:v8];

    id v3 = v82;
  }
  else
  {
    v20 = [v3 aggregatableMessages];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v20;
  id v21 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v79 = *(void *)v97;
    uint64_t v23 = 1;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v97 != v79) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
        v26 = [v25 command];
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          v29 = [v3 messageToSend];
          v30 = [v29 additionalDictionary];
          v28 = [v30 objectForKey:@"c"];

          id v3 = v82;
        }

        v31 = [v81 objectForKey:v28];
        if (([v3 forceOnePerFanout] & 1) != 0
          || ([v31 hasSpaceForAggregatableMessage:v25] & 1) == 0)
        {
          if (v31)
          {
            id v32 = [v31 copy];
            [v75 addObject:v32];
          }
          v33 = [v3 messageToSend];
          v34 = [v3 service];
          v35 = [v82 fromIdentity];
          uint64_t v36 = -[IDSIMLFanoutFactoryComponent createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:](self, "createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:", v33, v34, v35, [v82 maxSize], v23, v25);

          id v3 = v82;
          ++v23;
          if (v28) {
            v37 = v28;
          }
          else {
            v37 = &off_1009D10E0;
          }
          [v81 setObject:v36 forKey:v37];
          v31 = (void *)v36;
        }
        v38 = [v3 encryptedTopLevelPayload];
        [v31 setGroupPayload:v38];

        [v31 addAggregatableMessage:v25];
      }
      id v22 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
    }
    while (v22);
  }

  v39 = [v81 allValues];
  [v75 addObjectsFromArray:v39];

  v40 = +[IDSFoundationLog delivery];
  v41 = v72;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = [v75 count];
    *(_DWORD *)buf = 138412546;
    uint64_t v110 = (uint64_t)v72;
    __int16 v111 = 2048;
    id v112 = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GUID %@ Constructed %lu fanouts", buf, 0x16u);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v70 = v75;
  id v76 = [v70 countByEnumeratingWithState:&v92 objects:v106 count:16];
  if (v76)
  {
    uint64_t v74 = *(void *)v93;
    do
    {
      for (k = 0; k != v76; k = (char *)k + 1)
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v70);
        }
        v44 = *(void **)(*((void *)&v92 + 1) + 8 * (void)k);
        id v45 = objc_alloc_init((Class)NSMutableArray);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        v46 = [v44 individualPeerMessages];
        id v47 = [v46 countByEnumeratingWithState:&v88 objects:v105 count:16];
        if (!v47)
        {

          v56 = &IDSRegistrationPropertySupportsAVLess_ptr;
LABEL_56:
          [v44 setWantsCertifiedDelivery:1];
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v57 = v44;
          v58 = [v44 individualPeerMessages];
          id v59 = [v58 countByEnumeratingWithState:&v84 objects:v104 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v85;
            do
            {
              for (m = 0; m != v60; m = (char *)m + 1)
              {
                if (*(void *)v85 != v61) {
                  objc_enumerationMutation(v58);
                }
                [*(id *)(*((void *)&v84 + 1) + 8 * (void)m) setWantsCertifiedDelivery:0];
              }
              id v60 = [v58 countByEnumeratingWithState:&v84 objects:v104 count:16];
            }
            while (v60);
          }

          v44 = v57;
          goto LABEL_64;
        }
        id v48 = v47;
        v78 = v44;
        v80 = k;
        uint64_t v49 = *(void *)v89;
        unsigned __int8 v50 = 1;
        do
        {
          for (n = 0; n != v48; n = (char *)n + 1)
          {
            if (*(void *)v89 != v49) {
              objc_enumerationMutation(v46);
            }
            v52 = *(void **)(*((void *)&v88 + 1) + 8 * (void)n);
            v53 = [v52 targetPeerID];
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
          id v48 = [v46 countByEnumeratingWithState:&v88 objects:v105 count:16];
        }
        while (v48);

        v41 = v72;
        v56 = &IDSRegistrationPropertySupportsAVLess_ptr;
        v44 = v78;
        k = v80;
        if (v50) {
          goto LABEL_56;
        }
LABEL_64:
        v63 = [v56[288] delivery];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [v44 chunkNumber];
          *(_DWORD *)buf = 138412546;
          uint64_t v110 = (uint64_t)v41;
          __int16 v111 = 2112;
          id v112 = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "GUID %@ finished constructing fanout %@", buf, 0x16u);
        }
        v65 = [v44 chunkNumber];
        v66 = +[NSString stringWithFormat:@"GUID %@ Fanout %@ (%@) contains:\n%@", v41, v65, v44, v45];

        v83 = v66;
        id v67 = v66;
        cut_dispatch_log_queue();

        id v3 = v82;
      }
      id v76 = [v70 countByEnumeratingWithState:&v92 objects:v106 count:16];
    }
    while (v76);
  }

  [v3 setAggregateMessages:v70];
  v68 = +[CUTUnsafePromise fulfilledPromiseWithValue:v3];

  return v68;
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

  v19 = [(IDSPeerAggregateMessage *)v17 additionalDictionary];
  id v20 = [v19 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v23 = v22;

  v24 = [v13 messageBody];
  v25 = [v24 objectForKey:IDSCommandKey];

  v26 = [v14 command];

  if (v26)
  {
    v27 = [v14 command];
    [v23 setObject:v27 forKey:@"c"];

    if (v25)
    {
      v28 = [v13 additionalDictionary];
      v29 = [v28 objectForKey:@"c"];
      [v23 setObject:v29 forKey:@"oC"];
    }
  }
  [(IDSPeerAggregateMessage *)v17 setAdditionalDictionary:v23];

  return v17;
}

@end