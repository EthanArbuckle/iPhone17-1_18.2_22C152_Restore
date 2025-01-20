@interface ADResultObjectCache
- (BOOL)callIsPossibleForRequestId:(id)a3;
- (BOOL)hasMissingRefContextsForId:(id)a3;
- (BOOL)hasResultObjectsForRequestId:(id)a3;
- (id)_missingReferenceFulfillmentContexts;
- (id)_missingReferenceFulfillmentContextsByRequestId;
- (id)_requestMap;
- (id)commandsForReply:(id)a3 toCommand:(id)a4 missingReferences:(id *)a5;
- (id)commandsForSuccessReplyToCommand:(id)a3;
- (id)objectsForIds:(id)a3 missingReferences:(id *)a4;
- (void)_addObjects:(id)a3 forRequestId:(id)a4 sessionRequestId:(id)a5;
- (void)_removeMissingRefContextsForRequestId:(id)a3;
- (void)_removeMissingReferenceContext:(id)a3;
- (void)addMissingReferencesContext:(id)a3;
- (void)addResultObjects:(id)a3 sessionRequestId:(id)a4;
- (void)clearResultObjectsForAllRequestIdsExcept:(id)a3;
- (void)clearResultObjectsForRequestId:(id)a3;
@end

@implementation ADResultObjectCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingReferenceFulfillmentContextsByRequestId, 0);
  objc_storeStrong((id *)&self->_missingReferenceFulfillmentContexts, 0);
  objc_storeStrong((id *)&self->_requestsWithPhoneCall, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
}

- (id)commandsForSuccessReplyToCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 refId];
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "ad_callbacks"),
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v4, "ad_callbacks");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (![v12 code])
          {
            id v9 = [v12 commandReferences];
            goto LABEL_14;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    if ([v9 count])
    {
      id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
      requestMap = self->_requestMap;
      v16 = [v4 refId];
      v17 = [(NSMutableDictionary *)requestMap objectForKey:v16];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v18 = v9;
      id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = objc_msgSend(v17, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * (void)j), (void)v26);
            if (v23) {
              [v14 addObject:v23];
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v20);
      }
    }
    else
    {
      id v14 = 0;
    }
    if (objc_msgSend(v14, "count", (void)v26)) {
      v24 = v14;
    }
    else {
      v24 = 0;
    }
    id v13 = v24;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)callIsPossibleForRequestId:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"com.apple.siri.nilRequestId";
  }
  unsigned __int8 v6 = [(NSMutableSet *)self->_requestsWithPhoneCall containsObject:v5];

  return v6;
}

- (BOOL)hasResultObjectsForRequestId:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"com.apple.siri.nilRequestId";
  }
  unsigned __int8 v6 = [(NSMutableDictionary *)self->_requestMap objectForKey:v5];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (void)clearResultObjectsForAllRequestIdsExcept:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v13 = [(NSMutableDictionary *)self->_requestMap objectForKey:v12];
          if (v13)
          {
            [v5 setObject:v13 forKey:v12];
            if ([(NSMutableSet *)self->_requestsWithPhoneCall containsObject:v12]) {
              [v6 addObject:v12];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    if (v4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
    if (v4)
    {
LABEL_13:
      id v14 = [objc_alloc((Class)NSSet) initWithArray:v4];
      goto LABEL_16;
    }
  }
  id v14 = 0;
LABEL_16:
  v15 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContextsByRequestId allKeys];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
        if (([v14 containsObject:v20] & 1) == 0) {
          [(ADResultObjectCache *)self _removeMissingRefContextsForRequestId:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
  if ([v5 count]) {
    uint64_t v21 = v5;
  }
  else {
    uint64_t v21 = 0;
  }
  objc_storeStrong((id *)&self->_requestMap, v21);
  if ([v6 count]) {
    v22 = v6;
  }
  else {
    v22 = 0;
  }
  objc_storeStrong((id *)&self->_requestsWithPhoneCall, v22);
}

- (void)_removeMissingReferenceContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestId];
  id v6 = (void *)v5;
  id v7 = @"com.apple.siri.nilRequestId";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v8 = v7;

  id v10 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContexts allKeysForObject:v4];
  [(NSMutableDictionary *)self->_missingReferenceFulfillmentContexts removeObjectsForKeys:v10];
  id v9 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContextsByRequestId objectForKey:v8];

  [v9 removeObject:v4];
}

- (void)_removeMissingRefContextsForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContextsByRequestId objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContexts allKeysForObject:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [(NSMutableDictionary *)self->_missingReferenceFulfillmentContexts removeObjectsForKeys:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_missingReferenceFulfillmentContextsByRequestId removeObjectForKey:v4];
}

- (void)clearResultObjectsForRequestId:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  if (v4) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = @"com.apple.siri.nilRequestId";
  }
  id v7 = (__CFString *)v5;
  -[NSMutableDictionary removeObjectForKey:](self->_requestMap, "removeObjectForKey:");
  [(NSMutableSet *)self->_requestsWithPhoneCall removeObject:v7];
  if (![(NSMutableSet *)self->_requestsWithPhoneCall count])
  {
    requestsWithPhoneCall = self->_requestsWithPhoneCall;
    self->_requestsWithPhoneCall = 0;
  }
  [(ADResultObjectCache *)self _removeMissingRefContextsForRequestId:v7];
}

- (id)objectsForIds:(id)a3 missingReferences:(id *)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_requestMap objectForKey:@"com.apple.siri.nilRequestId"];
  if (!v7)
  {
    id v12 = [v6 copy];
    id v8 = 0;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v21 = a4;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v22 = v6;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v16 = objc_msgSend(v7, "objectForKey:", v15, v21);
        if (v16)
        {
          id v17 = v8;
          uint64_t v18 = v16;
        }
        else
        {
          if (!v12) {
            id v12 = objc_alloc_init((Class)NSMutableArray);
          }
          id v17 = v12;
          uint64_t v18 = v15;
        }
        [v17 addObject:v18];
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  a4 = v21;
  id v6 = v22;
  if (v21) {
LABEL_19:
  }
    *a4 = v12;
LABEL_20:
  id v19 = v8;

  return v19;
}

- (id)commandsForReply:(id)a3 toCommand:(id)a4 missingReferences:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v7;
    __int16 v77 = 2112;
    id v78 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s reply = %@, command = %@", buf, 0x20u);
  }
  uint64_t v10 = [v8 refId];
  if (v10) {
    CFStringRef v11 = (const __CFString *)v10;
  }
  else {
    CFStringRef v11 = @"com.apple.siri.nilRequestId";
  }
  v57 = (__CFString *)v11;
  id v12 = -[NSMutableDictionary objectForKey:](self->_requestMap, "objectForKey:");
  id v55 = v7;
  if (v7) {
    uint64_t v13 = (uint64_t)[v7 resultCallbackCode];
  }
  else {
    uint64_t v13 = -1;
  }
  long long v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2048;
    uint64_t v76 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s replyCode = %ld", buf, 0x16u);
  }
  id v54 = v8;
  objc_msgSend(v8, "ad_callbacks");
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v16)
  {
    id v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v67;
LABEL_13:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v67 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v66 + 1) + 8 * v20);
      id v22 = [v21 code];
      if (v22 == (id)v13) {
        break;
      }
      if (!v18)
      {
        if (v22 == (id)-1) {
          id v18 = v21;
        }
        else {
          id v18 = 0;
        }
      }
      if (v17 == (id)++v20)
      {
        id v17 = [v15 countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (v17) {
          goto LABEL_13;
        }
        goto LABEL_28;
      }
    }
    id v23 = v21;

    if (v23) {
      goto LABEL_30;
    }
    if (v13)
    {
LABEL_26:
      id v18 = v18;
      id v23 = v18;
      goto LABEL_30;
    }
  }
  else
  {
    id v18 = 0;
LABEL_28:

    if (v13) {
      goto LABEL_26;
    }
  }
  id v23 = 0;
LABEL_30:
  v51 = v18;
  long long v24 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s callbackForReply = %@", buf, 0x16u);
  }
  id v52 = v15;
  long long v25 = [v23 commandReferences];
  id v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v25;
  id v27 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v27)
  {
    id v28 = v27;
    id v29 = 0;
    uint64_t v30 = *(void *)v63;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v63 != v30) {
          objc_enumerationMutation(obj);
        }
        long long v32 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v33 = [v12 objectForKey:v32];
        if (v33)
        {
          v34 = v26;
          v35 = v33;
        }
        else
        {
          if (!v29) {
            id v29 = objc_alloc_init((Class)NSMutableArray);
          }
          v34 = v29;
          v35 = v32;
        }
        [v34 addObject:v35];
      }
      id v28 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v28);
  }
  else
  {
    id v29 = 0;
  }

  v50 = v23;
  v36 = [v23 commands];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = [v36 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v59;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v59 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        v42 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
          __int16 v75 = 2112;
          uint64_t v76 = (uint64_t)v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Adding flowCommand %@", buf, 0x16u);
        }
        [v41 setRefId:v57];
        [v26 addObject:v41];
      }
      id v38 = [v36 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v38);
  }
  if ([v29 count])
  {

    v43 = AFSiriLogContextDaemon;
    v45 = v54;
    v44 = v55;
    v47 = v52;
    v46 = v12;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s missingReferences %@", buf, 0x16u);
    }
    id v26 = 0;
  }
  else
  {
    v45 = v54;
    v44 = v55;
    v47 = v52;
    v46 = v12;
  }

  if (a5) {
    *a5 = v29;
  }
  v48 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s callbackCommands = %@", buf, 0x16u);
  }

  return v26;
}

- (void)addResultObjects:(id)a3 sessionRequestId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 objects];
  id v8 = [v7 refId];

  [(ADResultObjectCache *)self _addObjects:v9 forRequestId:v8 sessionRequestId:v6];
}

- (void)_addObjects:(id)a3 forRequestId:(id)a4 sessionRequestId:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v44 = a5;
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = @"com.apple.siri.nilRequestId";
  }
  CFStringRef v11 = [(ADResultObjectCache *)self _requestMap];
  v48 = v10;
  id v47 = [v11 objectForKey:v10];
  if (!v47)
  {
    id v47 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v11, "setObject:forKey:");
  }
  v43 = v11;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v12)
  {
    id v13 = v12;
    v45 = 0;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v17 = objc_msgSend(v16, "aceId", v43);
        if (v17)
        {
          id v18 = [v16 refId];
          uint64_t v19 = v18;
          if (v18)
          {
            if ([v18 isEqualToString:v44])
            {
              [v16 setRefId:v10];
              uint64_t v20 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                long long v59 = "-[ADResultObjectCache _addObjects:forRequestId:sessionRequestId:]";
                __int16 v60 = 2112;
                long long v61 = v10;
                __int16 v62 = 2112;
                id v63 = v44;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Setting refId to %@ from session request %@", buf, 0x20u);
              }
            }
          }
          [v47 setObject:v16 forKey:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            requestsWithPhoneCall = self->_requestsWithPhoneCall;
            if (!requestsWithPhoneCall)
            {
              id v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
              id v23 = self->_requestsWithPhoneCall;
              self->_requestsWithPhoneCall = v22;

              requestsWithPhoneCall = self->_requestsWithPhoneCall;
            }
            [(NSMutableSet *)requestsWithPhoneCall addObject:v10];
          }
          long long v24 = [(NSMutableDictionary *)self->_missingReferenceFulfillmentContexts objectForKey:v17];
          uint64_t v25 = [v24 requestId];
          id v26 = (void *)v25;
          id v27 = @"com.apple.siri.nilRequestId";
          if (v25) {
            id v27 = (__CFString *)v25;
          }
          id v28 = v27;

          if (v24 && [(__CFString *)v10 isEqualToString:v28])
          {
            id v29 = [v24 _mutableResolvedIds];
            [v29 addObject:v17];

            id v30 = v45;
            if (!v45) {
              id v30 = objc_alloc_init((Class)NSMutableSet);
            }
            v45 = v30;
            [v30 addObject:v24];
          }
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v13);
  }
  else
  {
    v45 = 0;
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v31 = v45;
  id v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v50;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        id v37 = objc_msgSend(v36, "resolvedReferences", v43);
        id v38 = [v37 count];
        uint64_t v39 = [v36 missingReferences];
        id v40 = [v39 count];

        if (v38 == v40)
        {
          [v36 setHasBeenFulfilled:1];
          uint64_t v41 = [v36 fulfillmentBlock];
          v42 = (void *)v41;
          if (v41) {
            (*(void (**)(uint64_t))(v41 + 16))(v41);
          }
          [(ADResultObjectCache *)self _removeMissingReferenceContext:v36];
        }
      }
      id v33 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v33);
  }
}

- (BOOL)hasMissingRefContextsForId:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(ADResultObjectCache *)self _missingReferenceFulfillmentContextsByRequestId];
  id v6 = [v5 objectForKey:v4];

  LOBYTE(v4) = [v6 count] != 0;
  return (char)v4;
}

- (void)addMissingReferencesContext:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(ADResultObjectCache *)self _missingReferenceFulfillmentContexts];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = objc_msgSend(v4, "missingReferences", 0);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v4 forKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v10)];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v4 requestId];
  id v12 = (void *)v11;
  id v13 = @"com.apple.siri.nilRequestId";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  uint64_t v14 = v13;

  id v15 = [(ADResultObjectCache *)self _missingReferenceFulfillmentContextsByRequestId];
  id v16 = [v15 objectForKey:v14];
  if (!v16)
  {
    id v16 = objc_alloc_init((Class)NSMutableSet);
    [v15 setObject:v16 forKey:v14];
  }
  [v16 addObject:v4];
}

- (id)_missingReferenceFulfillmentContextsByRequestId
{
  missingReferenceFulfillmentContextsByRequestId = self->_missingReferenceFulfillmentContextsByRequestId;
  if (!missingReferenceFulfillmentContextsByRequestId)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v5 = self->_missingReferenceFulfillmentContextsByRequestId;
    self->_missingReferenceFulfillmentContextsByRequestId = v4;

    missingReferenceFulfillmentContextsByRequestId = self->_missingReferenceFulfillmentContextsByRequestId;
  }
  return missingReferenceFulfillmentContextsByRequestId;
}

- (id)_missingReferenceFulfillmentContexts
{
  missingReferenceFulfillmentContexts = self->_missingReferenceFulfillmentContexts;
  if (!missingReferenceFulfillmentContexts)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v5 = self->_missingReferenceFulfillmentContexts;
    self->_missingReferenceFulfillmentContexts = v4;

    missingReferenceFulfillmentContexts = self->_missingReferenceFulfillmentContexts;
  }
  return missingReferenceFulfillmentContexts;
}

- (id)_requestMap
{
  requestMap = self->_requestMap;
  if (!requestMap)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v5 = self->_requestMap;
    self->_requestMap = v4;

    requestMap = self->_requestMap;
  }
  return requestMap;
}

@end