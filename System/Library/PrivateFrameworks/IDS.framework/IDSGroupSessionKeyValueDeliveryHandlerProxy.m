@interface IDSGroupSessionKeyValueDeliveryHandlerProxy
- (IDSGroupSessionKeyValueDeliveryHandler)handler;
- (IDSGroupSessionKeyValueDeliveryHandlerProxy)initWithHandler:(id)a3;
- (NSUUID)handlerUUID;
- (void)handleGroupSessionKeyValues:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHandlerUUID:(id)a3;
@end

@implementation IDSGroupSessionKeyValueDeliveryHandlerProxy

- (IDSGroupSessionKeyValueDeliveryHandlerProxy)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSGroupSessionKeyValueDeliveryHandlerProxy;
  v5 = [(IDSGroupSessionKeyValueDeliveryHandlerProxy *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handler, v4);
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    handlerUUID = v6->_handlerUUID;
    v6->_handlerUUID = (NSUUID *)v7;
  }
  return v6;
}

- (void)handleGroupSessionKeyValues:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = [MEMORY[0x1E4F6B460] GroupSessionKeyValueDelivery];
  uint64_t v7 = v6;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v4;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: received dictionary %@", buf, 0xCu);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v27 = v4;
      uint64_t v10 = *(void *)v39;
      location = (id *)&self->_handler;
      uint64_t v28 = *(void *)v39;
      v29 = v7;
      do
      {
        uint64_t v11 = 0;
        uint64_t v30 = v9;
        do
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
          uint64_t v13 = [v7 objectForKeyedSubscript:v12];
          objc_opt_class();
          v32 = (void *)v13;
          LOBYTE(v13) = objc_opt_isKindOfClass();
          v14 = [MEMORY[0x1E4F6B460] GroupSessionKeyValueDelivery];
          v15 = v14;
          if (v13)
          {
            uint64_t v31 = v11;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v12;
              _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key %@", buf, 0xCu);
            }

            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            v15 = v32;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v48 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v35 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                  objc_opt_class();
                  char v21 = objc_opt_isKindOfClass();
                  v22 = [MEMORY[0x1E4F6B460] GroupSessionKeyValueDelivery];
                  v23 = v22;
                  if (v21)
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v43 = v12;
                      __int16 v44 = 2112;
                      v45 = v20;
                      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key:%@ participantID:%@", buf, 0x16u);
                    }

                    v23 = [v15 objectForKeyedSubscript:v20];
                    objc_opt_class();
                    char v24 = objc_opt_isKindOfClass();
                    v25 = [MEMORY[0x1E4F6B460] GroupSessionKeyValueDelivery];
                    WeakRetained = v25;
                    if (v24)
                    {
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412802;
                        id v43 = v12;
                        __int16 v44 = 2112;
                        v45 = v20;
                        __int16 v46 = 2112;
                        v47 = v23;
                        _os_log_impl(&dword_19190B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key:%@ participantID:%@ data:%@", buf, 0x20u);
                      }

                      WeakRetained = objc_loadWeakRetained(location);
                      -[NSObject handleGroupSessionValue:forKey:participant:](WeakRetained, "handleGroupSessionValue:forKey:participant:", v23, [v12 intValue], objc_msgSend(v20, "unsignedLongLongValue"));
                    }
                    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412802;
                      id v43 = v12;
                      __int16 v44 = 2112;
                      v45 = v20;
                      __int16 v46 = 2112;
                      v47 = v23;
                      _os_log_error_impl(&dword_19190B000, WeakRetained, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: invalid value for key:%@ participantID:%@ value:%@", buf, 0x20u);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v43 = v12;
                    __int16 v44 = 2112;
                    v45 = v20;
                    _os_log_error_impl(&dword_19190B000, v23, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: invalid participantID for key:%@ participantID:%@", buf, 0x16u);
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v48 count:16];
              }
              while (v17);
              uint64_t v10 = v28;
              uint64_t v7 = v29;
              uint64_t v9 = v30;
            }
            uint64_t v11 = v31;
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v43 = v12;
            __int16 v44 = 2112;
            v45 = v32;
            _os_log_error_impl(&dword_19190B000, v15, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: remoteParticipantIDToData is not a dictionary for key:%@ data: %@", buf, 0x16u);
          }

          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v9);
      id v4 = v27;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_191A3F424((uint64_t)v4, v7);
  }
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void)setHandlerUUID:(id)a3
{
}

- (IDSGroupSessionKeyValueDeliveryHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);

  return (IDSGroupSessionKeyValueDeliveryHandler *)WeakRetained;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);

  objc_storeStrong((id *)&self->_handlerUUID, 0);
}

@end