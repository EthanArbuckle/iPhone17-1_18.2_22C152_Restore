@interface CAEvent
+ (id)eventWithName:(id)a3 fields:(id)a4;
- (BOOL)isValidPayload:(id)a3;
- (BOOL)sendPayload:(id)a3;
- (CAEvent)initWithName:(id)a3 fields:(id)a4;
- (NSArray)fields;
- (NSString)name;
- (id)createPayloadFromDictionary:(id)a3;
@end

@implementation CAEvent

- (CAEvent)initWithName:(id)a3 fields:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CAEvent;
  v9 = [(CAEvent *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = (NSArray *)[v8 copy];
    fields = v10->_fields;
    v10->_fields = v11;
  }
  return v10;
}

+ (id)eventWithName:(id)a3 fields:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithName:v7 fields:v6];

  return v8;
}

- (id)createPayloadFromDictionary:(id)a3
{
  PayloadFromDictionary = createPayloadFromDictionary(self->_fields, a3);

  return PayloadFromDictionary;
}

- (BOOL)isValidPayload:(id)a3
{
  id v4 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v39 = self;
  v5 = self->_fields;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (!v6)
  {
    char v9 = 1;
    goto LABEL_22;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v49;
  char v9 = 1;
  do
  {
    v10 = 0;
    do
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v10);
      v12 = [v11 name];
      v13 = [v4 objectForKeyedSubscript:v12];

      if (!v13)
      {
        objc_super v14 = LogIOAnalytics();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          name = v39->_name;
          v16 = [v11 name];
          *(_DWORD *)buf = 138412546;
          v55 = name;
          __int16 v56 = 2112;
          v57 = v16;
          v17 = v14;
          v18 = "[%@] missing field. (%@)";
          uint32_t v19 = 22;
          goto LABEL_18;
        }
LABEL_13:

        goto LABEL_14;
      }
      if (v9)
      {
        if ([v11 isValidValue:v13])
        {
          char v9 = 1;
          goto LABEL_15;
        }
        objc_super v14 = LogIOAnalytics();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v20 = v39->_name;
          v16 = [v11 name];
          *(_DWORD *)buf = 138412802;
          v55 = v20;
          __int16 v56 = 2112;
          v57 = v16;
          __int16 v58 = 2112;
          v59 = v13;
          v17 = v14;
          v18 = "[%@] invalid value for field. (%@, %@)";
          uint32_t v19 = 32;
LABEL_18:
          _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
        }
        goto LABEL_13;
      }
LABEL_14:
      char v9 = 0;
LABEL_15:

      v10 = (char *)v10 + 1;
    }
    while (v7 != v10);
    id v21 = [(NSArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
    id v7 = v21;
  }
  while (v21);
LABEL_22:

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  id v22 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v22)
  {
    id v24 = v22;
    uint64_t v38 = *(void *)v45;
    *(void *)&long long v23 = 138412546;
    long long v36 = v23;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v27 = v39->_fields;
        id v28 = [v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v41;
LABEL_29:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v41 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v31), "name", v36);
            unsigned __int8 v33 = [v26 isEqual:v32];

            if (v33) {
              break;
            }
            if (v29 == (id)++v31)
            {
              id v29 = [v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
              if (v29) {
                goto LABEL_29;
              }
              goto LABEL_35;
            }
          }
        }
        else
        {
LABEL_35:

          v27 = LogIOAnalytics();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v34 = v39->_name;
            *(_DWORD *)buf = v36;
            v55 = v34;
            __int16 v56 = 2112;
            v57 = v26;
            _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "[%@] extra field found! (%@)", buf, 0x16u);
          }
          char v9 = 0;
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v24);
  }

  return v9 & 1;
}

- (BOOL)sendPayload:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = LogIOAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CAEvent sendPayload:]((uint64_t)self, v7);
    }
    goto LABEL_10;
  }
  unsigned __int8 v5 = [(CAEvent *)self isValidPayload:v4];
  id v6 = LogIOAnalytics();
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAEvent sendPayload:]();
    }
LABEL_10:

    BOOL v8 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CAEvent sendPayload:]();
  }

  AnalyticsSendEvent();
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)fields
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)sendPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[%@] dropping invalid payload: (%@)", (uint8_t *)&v3, 0x16u);
}

- (void)sendPayload:.cold.2()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "[%@] sending event: %@", v1, 0x16u);
}

- (void)sendPayload:.cold.3()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "[%@] dropping invalid payload: %@", v1, 0x16u);
}

@end