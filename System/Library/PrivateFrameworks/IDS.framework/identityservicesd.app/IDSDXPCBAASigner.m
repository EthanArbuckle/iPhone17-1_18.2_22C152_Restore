@interface IDSDXPCBAASigner
- (IDSBAASigner)baaSigner;
- (IDSDXPCBAASigner)initWithTopic:(id)a3 queue:(id)a4 connection:(id)a5;
- (NSString)topic;
- (OS_dispatch_queue)queue;
- (void)baaHeadersBySigningData:(id)a3 serverTimestamp:(id)a4 completion:(id)a5;
- (void)purgeBAACertWithCompletion:(id)a3;
- (void)setBaaSigner:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSDXPCBAASigner

- (IDSDXPCBAASigner)initWithTopic:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id obj = a4;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 valueForEntitlement:kIDSRegistrationEntitlement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v18 = [v10 isEqualToString:v7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v19 = 0;
        goto LABEL_21;
      }
      unsigned int v18 = [v10 BOOLValue];
    }
    int v19 = v18;
    goto LABEL_21;
  }
  id v37 = v9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v12)
  {
    id v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v48;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 isEqualToString:v7]) {
          char v14 = 1;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  int v19 = v14 & 1;
  id v9 = v37;
LABEL_21:
  v20 = [v9 valueForEntitlement:kIDSMessagingEntitlement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = v10;
    id v38 = v8;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v22)
    {
      id v23 = v22;
      id v24 = v9;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v19 |= [v27 isEqualToString:v7];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v23);
    }
    else
    {
      id v24 = v9;
    }

    id v9 = v24;
    v10 = v36;
    id v8 = v38;
    v28 = self;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = self;
      if (v19 & 1) != 0 || ([v20 isEqualToString:v7]) {
        goto LABEL_45;
      }
      goto LABEL_39;
    }
    objc_opt_class();
    v28 = self;
    if (objc_opt_isKindOfClass())
    {
      if (v19 & 1) != 0 || ([v20 BOOLValue]) {
        goto LABEL_45;
      }
      goto LABEL_39;
    }
  }
  if (v19)
  {
LABEL_45:
    v42.receiver = v28;
    v42.super_class = (Class)IDSDXPCBAASigner;
    v31 = [(IDSDXPCBAASigner *)&v42 init];
    v32 = v31;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_queue, obj);
      objc_storeStrong((id *)&v32->_topic, a3);
      v33 = (IDSBAASigner *)[objc_alloc((Class)IDSBAASigner) initWithQueue:v32->_queue];
      baaSigner = v32->_baaSigner;
      v32->_baaSigner = v33;
    }
    v28 = v32;
    v30 = v28;
    goto LABEL_48;
  }
LABEL_39:
  v29 = +[IMRGLog registration];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Missing IDS Registration entitlement -- failing creation of IDSDXPCBAASigner collaborator {connection: %@}", buf, 0xCu);
  }

  v30 = 0;
LABEL_48:

  return v30;
}

- (void)baaHeadersBySigningData:(id)a3 serverTimestamp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(IDSDXPCBAASigner *)self baaSigner];
    id v12 = [(IDSDXPCBAASigner *)self topic];
    [v11 headersBySigningData:v8 serverTimestamp:v9 topic:v12 completion:v10];
  }
  else
  {
    id v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100708EB8(v13);
    }
  }
}

- (void)purgeBAACertWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(IDSDXPCBAASigner *)self baaSigner];
  v5 = [(IDSDXPCBAASigner *)self topic];
  [v6 purgeBAACertForTopic:v5 completion:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (IDSBAASigner)baaSigner
{
  return self->_baaSigner;
}

- (void)setBaaSigner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaSigner, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end