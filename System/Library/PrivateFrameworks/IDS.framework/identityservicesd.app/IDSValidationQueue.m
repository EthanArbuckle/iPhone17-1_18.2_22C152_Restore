@interface IDSValidationQueue
- (BOOL)isBuildingContextForSubsystem:(int64_t)a3;
- (BOOL)shouldUseAbsinthe;
- (IDSPushHandler)pushHandler;
- (IDSValidationQueue)initWithPushHandler:(id)a3 validationMessageSendBlock:(id)a4;
- (IDSValidationQueue)initWithValidationMessageSendBlock:(id)a3;
- (NSMutableDictionary)validationInfoByMechanism;
- (id)_validationInfoForSubsystem:(int64_t)a3 createIfNil:(BOOL)a4;
- (id)validationMessageSendBlock;
- (int64_t)_mechanismForSubsystem:(int64_t)a3;
- (void)__cleanupValidationInfoForSubsystemMechanism:(int64_t)a3;
- (void)__failValidationQueueForSubsystemMechanism:(int64_t)a3;
- (void)__failValidationQueueWithErrorResponseCode:(int64_t)a3 forSubsystemMechanism:(int64_t)a4;
- (void)__flushValidationQueueForSubsystemMechanism:(int64_t)a3;
- (void)__purgeCachedCertsForSubsystemMechanism:(int64_t)a3;
- (void)__queueValidationMessage:(id)a3 subsystem:(int64_t)a4 sendBlock:(id)a5;
- (void)__removeFromQueue:(id)a3 subsystem:(int64_t)a4;
- (void)_sendAbsintheValidationCertRequestIfNeededForSubsystem:(int64_t)a3;
- (void)_sendBAAValidationRequestIfNeededForSubsystem:(int64_t)a3;
- (void)_sendValidationRequestForSubsystem:(int64_t)a3;
- (void)buildValidationCredentialsIfNeededForSubsystem:(int64_t)a3;
- (void)clearQueueForSubsystem:(int64_t)a3;
- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3;
- (void)queueBuildingValidationDataIfNecessaryForMessage:(id)a3 subsystem:(int64_t)a4 withQueueCompletion:(id)a5 sendBlock:(id)a6;
- (void)removeFromQueue:(id)a3 subsystem:(int64_t)a4;
- (void)setPushHandler:(id)a3;
- (void)setShouldUseAbsinthe:(BOOL)a3;
- (void)setValidationInfoByMechanism:(id)a3;
- (void)setValidationMessageSendBlock:(id)a3;
@end

@implementation IDSValidationQueue

- (IDSValidationQueue)initWithValidationMessageSendBlock:(id)a3
{
  id v4 = a3;
  v5 = +[IDSPushHandler sharedInstance];
  v6 = [(IDSValidationQueue *)self initWithPushHandler:v5 validationMessageSendBlock:v4];

  return v6;
}

- (IDSValidationQueue)initWithPushHandler:(id)a3 validationMessageSendBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSValidationQueue;
  v9 = [(IDSValidationQueue *)&v15 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    validationInfoByMechanism = v9->_validationInfoByMechanism;
    v9->_validationInfoByMechanism = v10;

    id v12 = objc_retainBlock(v8);
    id validationMessageSendBlock = v9->_validationMessageSendBlock;
    v9->_id validationMessageSendBlock = v12;

    objc_storeStrong((id *)&v9->_pushHandler, a3);
    v9->_shouldUseAbsinthe = 1;
  }

  return v9;
}

- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3
{
}

- (void)removeFromQueue:(id)a3 subsystem:(int64_t)a4
{
}

- (void)clearQueueForSubsystem:(int64_t)a3
{
  int64_t v5 = -[IDSValidationQueue _mechanismForSubsystem:](self, "_mechanismForSubsystem:");
  v6 = [(IDSValidationQueue *)self validationInfoByMechanism];
  id v7 = +[NSNumber numberWithInteger:v5];
  id v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [v8 validationContextQueue];

  if (v9)
  {
    v10 = [v8 validationContextQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100339ED4;
    v13[3] = &unk_100989450;
    v13[4] = a3;
    v11 = objc_msgSend(v10, "__imArrayByFilteringWithBlock:", v13);
    id v12 = [v11 mutableCopy];
    [v8 setValidationContextQueue:v12];
  }
}

- (void)queueBuildingValidationDataIfNecessaryForMessage:(id)a3 subsystem:(int64_t)a4 withQueueCompletion:(id)a5 sendBlock:(id)a6
{
  id v10 = a3;
  v11 = (void (**)(id, void))a5;
  id v12 = a6;
  v13 = +[IMLockdownManager sharedInstance];
  unsigned int v14 = [v13 isExpired];

  if (v14)
  {
    objc_super v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not doing absinthe validation", buf, 2u);
    }

    goto LABEL_11;
  }
  if (!v10
    || ([v10 conformsToProtocol:&OBJC_PROTOCOL___IDSAbsintheSignedMessage] & 1) != 0)
  {
    if (![(IDSValidationQueue *)self shouldUseAbsinthe])
    {
      v16 = +[NSData __imDataWithRandomBytes:10];
      [v10 setValidationData:v16];
      if (v11) {
        v11[2](v11, 0);
      }
      goto LABEL_49;
    }
    v16 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a4 createIfNil:1];
    v17 = [v16 validateContextDate];

    if (v17)
    {
      v18 = [v16 validateContextDate];
      [v18 timeIntervalSinceNow];
      double v20 = fabs(v19);

      v21 = [v16 validateContextTTL];
      [v21 doubleValue];
      if (v22 <= 30.0)
      {
        double v25 = 120.0;
      }
      else
      {
        v23 = [v16 validateContextTTL];
        [v23 doubleValue];
        double v25 = v24 + -30.0;
      }
      v26 = +[IMRGLog registration];
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v20 <= v25)
      {
        if (v27)
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&buf[4] = v20;
          __int16 v46 = 2048;
          double v47 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  Validation context has interval remaining: %f   timeout is: %f", buf, 0x16u);
        }
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  Validation info is too old, removing it", buf, 2u);
        }

        [(IDSValidationQueue *)self __cleanupValidationInfoForSubsystemMechanism:a4];
      }
    }
    if ([v16 validationContext] || objc_msgSend(v16, "validationContextDisabled"))
    {
      if (v10)
      {
        if ([v16 validationContextDisabled])
        {
          v28 = +[NSData data];
LABEL_34:
          [v10 setValidationData:v28];
          v38 = +[IMRGLog registration];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "  Validation data: %@", buf, 0xCu);
          }

          v39 = +[IMRGLog registration];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "  Successfully signed: %@", buf, 0xCu);
          }

          v40 = [v16 validationSession];

          if (v40)
          {
            if (+[IDSValidationSession isSigningSupported])
            {
              v41 = [v16 validationSession];
              unsigned int v42 = [v41 isInitializedForSigning];

              if (v42)
              {
                v43 = [v16 validationSession];
                [v10 setSigningSession:v43];
              }
            }
          }
          if (!v11) {
            goto LABEL_49;
          }
          uint64_t v44 = 0;
          goto LABEL_48;
        }
        *(void *)buf = 0;
        sub_100585D24((uint64_t)[v16 validationContext], 0, 0, (uint64_t)buf);
        uint64_t v30 = v29;
        v28 = +[NSData dataWithBytes:*(void *)buf length:0];
        if (*(void *)buf) {
          sub_100584004(*(uint64_t *)buf);
        }
        if (!v30) {
          goto LABEL_34;
        }
        v31 = +[IMRGLog warning];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          sub_10071F584(v30, v31, v32, v33, v34, v35, v36, v37);
        }

        [(IDSValidationQueue *)self __failValidationQueueForSubsystemMechanism:a4];
        [(IDSValidationQueue *)self __cleanupValidationInfoForSubsystemMechanism:a4];

        goto LABEL_45;
      }
    }
    else if (v10)
    {
LABEL_45:
      [(IDSValidationQueue *)self __queueValidationMessage:v10 subsystem:a4 sendBlock:v12];
    }
    [(IDSValidationQueue *)self _sendValidationRequestForSubsystem:a4];
    if (!v11)
    {
LABEL_49:

      goto LABEL_50;
    }
    uint64_t v44 = 1;
LABEL_48:
    v11[2](v11, v44);
    goto LABEL_49;
  }
LABEL_11:
  if (v11) {
    v11[2](v11, 0);
  }
LABEL_50:
}

- (void)buildValidationCredentialsIfNeededForSubsystem:(int64_t)a3
{
  id v4 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:1];
  if (![v4 validationContext] && (objc_msgSend(v4, "isBuildingContext") & 1) == 0)
  {
    int64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Warming validation credentials", v6, 2u);
    }

    [(IDSValidationQueue *)self queueBuildingValidationDataIfNecessaryForMessage:0 subsystem:0 withQueueCompletion:0 sendBlock:0];
  }
}

- (BOOL)isBuildingContextForSubsystem:(int64_t)a3
{
  v3 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:0];
  unsigned __int8 v4 = [v3 isBuildingContext];

  return v4;
}

- (void)__removeFromQueue:(id)a3 subsystem:(int64_t)a4
{
  id v6 = a3;
  id v10 = [[IDSValidationQueueItem alloc] initWithMessage:v6 subsystem:a4 sendBlock:0];

  id v7 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a4 createIfNil:0];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 validationContextQueue];
    [v9 removeObject:v10];
  }
}

- (void)__queueValidationMessage:(id)a3 subsystem:(int64_t)a4 sendBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[IDSValidationQueueItem alloc] initWithMessage:v8 subsystem:a4 sendBlock:v9];

  v11 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a4 createIfNil:1];
  id v12 = [v11 validationContextQueue];

  if (!v12)
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    [v11 setValidationContextQueue:v13];
  }
  unsigned int v14 = [v11 validationContextQueue];
  unsigned __int8 v15 = [v14 containsObject:v10];

  if ((v15 & 1) == 0)
  {
    v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adding message to validate to the queue: %@", (uint8_t *)&v18, 0xCu);
    }

    v17 = [v11 validationContextQueue];
    [v17 addObject:v10];
  }
}

- (void)__failValidationQueueForSubsystemMechanism:(int64_t)a3
{
}

- (void)__failValidationQueueWithErrorResponseCode:(int64_t)a3 forSubsystemMechanism:(int64_t)a4
{
  int64_t v5 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a4 createIfNil:0];
  id v6 = +[IMRGLog warning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_10071F5F0(v5, v6);
  }

  id v7 = [v5 validationContextQueue];
  id v8 = [v7 count];

  if (v8)
  {
    id v19 = v5;
    id v9 = [v5 validationContextQueue];
    id v10 = [v9 _copyForEnumerating];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        unsigned __int8 v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) message];
          v17 = [v16 completionBlock];
          if (v17)
          {
            int v18 = +[NSError errorWithDomain:@"IDSAppleIDSRegistrationErrorDomain" code:a3 userInfo:0];
            ((void (**)(void, void *, void *, int64_t, void))v17)[2](v17, v16, v18, a3, 0);
          }
          unsigned __int8 v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    int64_t v5 = v19;
    [v19 setValidationContextQueue:0];
  }
}

- (void)__flushValidationQueueForSubsystemMechanism:(int64_t)a3
{
  unsigned __int8 v4 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:0];
  int64_t v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 validationContextQueue];
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Flushing validation queue: %@", buf, 0xCu);
  }
  id v7 = [v4 validationContextQueue];
  id v19 = v4;
  [v4 setValidationContextQueue:0];
  id v8 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        dispatch_group_enter(v8);
        uint64_t v14 = [v13 message];
        id v15 = [v13 subsystem];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10033AC78;
        v23[3] = &unk_100980D88;
        v23[4] = v13;
        double v24 = v8;
        v16 = [v13 sendBlock];
        [(IDSValidationQueue *)self queueBuildingValidationDataIfNecessaryForMessage:v14 subsystem:v15 withQueueCompletion:v23 sendBlock:v16];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  v17 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033ADC8;
  block[3] = &unk_10097E4D0;
  id v22 = v19;
  id v18 = v19;
  dispatch_group_notify(v8, v17, block);
}

- (void)__cleanupValidationInfoForSubsystemMechanism:(int64_t)a3
{
  v3 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:0];
  unsigned __int8 v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "  Cleaning up validation info", v5, 2u);
  }

  if ([v3 validationContext])
  {
    sub_1005841F0((uint64_t)[v3 validationContext]);
    [v3 setValidationContext:0];
  }
  [v3 setValidateContextTTL:0];
  [v3 setValidateContextDate:0];
  [v3 setValidationContextDisabled:0];
  [v3 setValidationSession:0];
}

- (void)__purgeCachedCertsForSubsystemMechanism:(int64_t)a3
{
  id v6 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:0];
  int64_t v5 = [v6 validationSession];
  objc_msgSend(v5, "purgeCachedCertsForSubsystemMechanism:", -[IDSValidationQueue _mechanismForSubsystem:](self, "_mechanismForSubsystem:", a3));
}

- (void)_sendValidationRequestForSubsystem:(int64_t)a3
{
  int64_t v5 = -[IDSValidationQueue _mechanismForSubsystem:](self, "_mechanismForSubsystem:");
  if (v5 == 1)
  {
    [(IDSValidationQueue *)self _sendBAAValidationRequestIfNeededForSubsystem:a3];
  }
  else if (!v5)
  {
    [(IDSValidationQueue *)self _sendAbsintheValidationCertRequestIfNeededForSubsystem:a3];
  }
}

- (void)_sendBAAValidationRequestIfNeededForSubsystem:(int64_t)a3
{
  int64_t v5 = [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:1];
  if ([v5 isBuildingContext])
  {
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We're in the process of BAA validation.", v8, 2u);
    }
  }
  else
  {
    [v5 setIsBuildingContext:1];
    id v7 = im_primary_queue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10033B0DC;
    v9[3] = &unk_100989478;
    id v10 = v5;
    uint64_t v11 = self;
    int64_t v12 = a3;
    +[IDSValidationSession validationSessionOnQueue:v7 mechanism:1 withCompletion:v9];

    id v6 = v10;
  }
}

- (void)_sendAbsintheValidationCertRequestIfNeededForSubsystem:(int64_t)a3
{
  [(IDSValidationQueue *)self _validationInfoForSubsystem:a3 createIfNil:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10033B448;
  v12[3] = &unk_1009894F0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  uint64_t v14 = self;
  int64_t v15 = a3;
  id v6 = objc_retainBlock(v12);
  if ([v5 isBuildingContext])
  {
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We're in the process of absinthe validation.", buf, 2u);
    }
  }
  else
  {
    [v5 setIsBuildingContext:1];
    [v5 setValidationContextDisabled:0];
    id v7 = objc_alloc_init(IDSValidationCertificateMessage);
    [v7 setCompletionBlock:v6];
    [v7 setTimeout:36000.0];
    id v8 = [(IDSPushHandler *)self->_pushHandler pushToken];
    [v7 setPushToken:v8];

    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(IDSPushHandler *)self->_pushHandler pushToken];
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending cert request request   push token: %@", buf, 0xCu);
    }
    uint64_t v11 = [(IDSValidationQueue *)self validationMessageSendBlock];
    ((void (**)(void, NSObject *))v11)[2](v11, v7);
  }
}

- (int64_t)_mechanismForSubsystem:(int64_t)a3
{
  return a3 == 2;
}

- (id)_validationInfoForSubsystem:(int64_t)a3 createIfNil:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(IDSValidationQueue *)self _mechanismForSubsystem:a3];
  id v7 = [(IDSValidationQueue *)self validationInfoByMechanism];
  id v8 = +[NSNumber numberWithInteger:v6];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    id v9 = objc_alloc_init(IDSValidationInfo);
    uint64_t v11 = [(IDSValidationQueue *)self validationInfoByMechanism];
    int64_t v12 = +[NSNumber numberWithInteger:v6];
    [v11 setObject:v9 forKeyedSubscript:v12];
  }

  return v9;
}

- (id)validationMessageSendBlock
{
  return self->_validationMessageSendBlock;
}

- (void)setValidationMessageSendBlock:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (BOOL)shouldUseAbsinthe
{
  return self->_shouldUseAbsinthe;
}

- (void)setShouldUseAbsinthe:(BOOL)a3
{
  self->_shouldUseAbsinthe = a3;
}

- (NSMutableDictionary)validationInfoByMechanism
{
  return self->_validationInfoByMechanism;
}

- (void)setValidationInfoByMechanism:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationInfoByMechanism, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);

  objc_storeStrong(&self->_validationMessageSendBlock, 0);
}

@end