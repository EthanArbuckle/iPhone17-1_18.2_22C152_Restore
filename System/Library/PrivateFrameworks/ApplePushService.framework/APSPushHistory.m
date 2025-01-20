@interface APSPushHistory
- (APSPushHistory)initWithEnvironment:(id)a3;
- (BOOL)hasPayload:(id)a3 forTopic:(id)a4 tokens:(id)a5;
- (id)_keyForTopic:(id)a3 token:(id)a4;
- (id)timestampForTopic:(id)a3 token:(id)a4;
- (void)_pruneHistory;
- (void)receivedPushWithTopic:(id)a3 token:(id)a4 payload:(id)a5 timestamp:(id)a6;
@end

@implementation APSPushHistory

- (APSPushHistory)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSPushHistory;
  v6 = [(APSPushHistory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v7;
}

- (void)_pruneHistory
{
  id v3 = [(NSMutableDictionary *)self->_history count];
  if ((unint64_t)v3 >= 0x12D)
  {
    unint64_t v4 = (unint64_t)fmax((double)(unint64_t)v3 * 0.3, 5.0);
    id v5 = [(NSMutableDictionary *)self->_history keysSortedByValueUsingComparator:&stru_10012B558];
    id v6 = [v5 count];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        objc_super v9 = [v5 objectAtIndex:i];
        [(NSMutableDictionary *)self->_history removeObjectForKey:v9];
      }
    }
    v10 = +[APSLog pushHistory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(NSMutableDictionary *)self->_history count];
      int v13 = 138412802;
      v14 = self;
      __int16 v15 = 2048;
      id v16 = v6;
      __int16 v17 = 2048;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ _pruneHistory from %lu to %lu.", (uint8_t *)&v13, 0x20u);
    }
  }
  if (![(NSMutableDictionary *)self->_history count])
  {
    history = self->_history;
    self->_history = 0;
  }
}

- (id)_keyForTopic:(id)a3 token:(id)a4
{
  id v5 = a3;
  id v6 = sub_10007EA4C(a4);
  v7 = +[NSString stringWithFormat:@"%@,%@", v5, v6];

  return v7;
}

- (void)receivedPushWithTopic:(id)a3 token:(id)a4 payload:(id)a5 timestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[APSLog pushHistory];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413314;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ receivedPushWithTopic %@ token %@ payload %@ timestamp %@", (uint8_t *)&v21, 0x34u);
  }

  if ([v10 length])
  {
    if ([v11 length])
    {
      id v15 = [v12 length];
      if (v13)
      {
        if (v15)
        {
          id v16 = [(APSPushHistory *)self _keyForTopic:v10 token:v11];
          if (!self->_history)
          {
            __int16 v17 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
            history = self->_history;
            self->_history = v17;
          }
          v19 = sub_10007E88C(v12);
          v20 = [[APSPushRecord alloc] initWithToken:v11 timestamp:v13 payloadHash:v19];
          [(NSMutableDictionary *)self->_history setObject:v20 forKey:v16];
          [(APSPushHistory *)self _pruneHistory];
        }
      }
    }
  }
}

- (id)timestampForTopic:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[APSLog pushHistory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ timestampForTopic? %@ token %@", (uint8_t *)&v13, 0x20u);
  }

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    objc_super v9 = [(APSPushHistory *)self _keyForTopic:v6 token:v7];
    id v10 = [(NSMutableDictionary *)self->_history objectForKey:v9];
    id v11 = [v10 timestamp];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)hasPayload:(id)a3 forTopic:(id)a4 tokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v10;
  int v13 = +[APSLog pushHistory];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v11;
    __int16 v41 = 2112;
    id v42 = v9;
    __int16 v43 = 2112;
    id v44 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ hasPayload? %@ forTopic %@ tokens %@", buf, 0x2Au);
  }

  if ([v11 length] && objc_msgSend(v9, "length") && objc_msgSend(v12, "count"))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v12;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      unsigned __int8 v16 = 0;
      uint64_t v17 = *(void *)v33;
      do
      {
        id v18 = 0;
        id v30 = v15;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = [(APSPushHistory *)self _keyForTopic:v9 token:*(void *)(*((void *)&v32 + 1) + 8 * (void)v18)];
          v20 = [(NSMutableDictionary *)self->_history objectForKey:v19];
          int v21 = [v20 payloadHash];

          if (v21)
          {
            v22 = sub_10007E88C(v11);
            if (v16)
            {
              unsigned __int8 v16 = 1;
            }
            else
            {
              [v20 payloadHash];
              __int16 v23 = self;
              uint64_t v24 = v17;
              id v25 = v9;
              v27 = id v26 = v11;
              unsigned __int8 v16 = [v22 isEqualToData:v27];

              id v11 = v26;
              id v9 = v25;
              uint64_t v17 = v24;
              self = v23;
              id v15 = v30;
            }
          }
          id v18 = (char *)v18 + 1;
        }
        while (v15 != v18);
        id v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }
    else
    {
      unsigned __int8 v16 = 0;
    }

    id v12 = v29;
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end