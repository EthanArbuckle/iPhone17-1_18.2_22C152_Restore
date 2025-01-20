@interface IDSGetDependentRegistrationsCenter
- (BOOL)_hasReachedMaxNumberOfRetries:(unsigned int)a3;
- (BOOL)getDependentRegistrations:(id)a3 completionBlock:(id)a4;
- (BOOL)shouldReAuthenticateForGDRResultCode:(int64_t)a3 retries:(unsigned int)a4;
- (IDSGetDependentRegistrationsCenter)initWithPushHandler:(id)a3 lockdownManager:(id)a4 heartbeatCenter:(id)a5 ftNetworkSupport:(id)a6 sendMessageHandlerBlock:(id)a7 messageResponseHandlerBlock:(id)a8;
- (void)_submitGDRReponseToAWDWithResultCode:(int64_t)a3 error:(id)a4;
@end

@implementation IDSGetDependentRegistrationsCenter

- (IDSGetDependentRegistrationsCenter)initWithPushHandler:(id)a3 lockdownManager:(id)a4 heartbeatCenter:(id)a5 ftNetworkSupport:(id)a6 sendMessageHandlerBlock:(id)a7 messageResponseHandlerBlock:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)IDSGetDependentRegistrationsCenter;
  v19 = [(IDSGetDependentRegistrationsCenter *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pushHandler, a3);
    objc_storeStrong((id *)&v20->_lockdownManager, a4);
    objc_storeStrong((id *)&v20->_heartbeatCenter, a5);
    objc_storeStrong((id *)&v20->_ftNetworkSupport, a6);
    id v21 = objc_retainBlock(v17);
    id sendMessageHandler = v20->_sendMessageHandler;
    v20->_id sendMessageHandler = v21;

    id v23 = objc_retainBlock(v18);
    id messageResponseHandler = v20->_messageResponseHandler;
    v20->_id messageResponseHandler = v23;
  }
  return v20;
}

- (BOOL)getDependentRegistrations:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v9 = [v6 authenticationCert];

    if (v9)
    {
      if (![(IMLockdownManager *)self->_lockdownManager isExpired])
      {
        id v16 = [v7 copy];

        id v17 = [v6 idsUserID];
        currentGetDependentRegistrations = self->_currentGetDependentRegistrations;
        if (!currentGetDependentRegistrations)
        {
          v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          v20 = self->_currentGetDependentRegistrations;
          self->_currentGetDependentRegistrations = v19;

          currentGetDependentRegistrations = self->_currentGetDependentRegistrations;
        }
        v56 = v8;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v21 = currentGetDependentRegistrations;
        id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v60;
          while (2)
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v60 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "idsUserID", v56);
              unsigned __int8 v27 = [v17 isEqualToIgnoringCase:v26];

              if (v27)
              {
                char v28 = 1;
                goto LABEL_29;
              }
            }
            id v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v59 objects:v67 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
        char v28 = 0;
LABEL_29:

        [(NSMutableSet *)self->_currentGetDependentRegistrations addObject:v6];
        v29 = +[IMRGLog registration];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v64 = v6;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Adding registration %p to getDependent queue", buf, 0xCu);
        }

        if (v16)
        {
          currentGetDependentRegistrationBlocks = self->_currentGetDependentRegistrationBlocks;
          if (!currentGetDependentRegistrationBlocks)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            v32 = self->_currentGetDependentRegistrationBlocks;
            self->_currentGetDependentRegistrationBlocks = Mutable;

            currentGetDependentRegistrationBlocks = self->_currentGetDependentRegistrationBlocks;
          }
          v33 = objc_msgSend(v6, "guid", v56);
          v34 = [(NSMutableDictionary *)currentGetDependentRegistrationBlocks objectForKey:v33];

          if (![v34 count])
          {
            id v35 = objc_alloc_init((Class)NSMutableArray);

            v36 = self->_currentGetDependentRegistrationBlocks;
            v37 = [v6 guid];
            [(NSMutableDictionary *)v36 setObject:v35 forKey:v37];

            v34 = v35;
          }
          id v38 = objc_retainBlock(v16);
          [v34 addObject:v38];

          v39 = +[IMRGLog registration];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = objc_retainBlock(v16);
            *(_DWORD *)buf = 134217984;
            id v64 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Adding completion block %p to getDependent queue", buf, 0xCu);
          }
        }
        v41 = +[IMRGLog registration];
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v42)
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v17;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "We have an outstanding getDependentRegistrations request for userID: %@", buf, 0xCu);
          }
        }
        else
        {
          if (v42)
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v6;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Requesting dependent device info for registration: %@", buf, 0xCu);
          }

          v41 = objc_alloc_init(IDSGetDependentRegistrationMessage);
          v43 = sub_100265CA0(v6);
          [v41 setDSAuthID:v43];

          v44 = [(IDSPushHandler *)self->_pushHandler pushToken];
          [v41 setPushToken:v44];

          v45 = [v6 idsUserID];
          v46 = [v6 authenticationCert];
          v47 = +[IDSRegistrationKeyManager sharedInstance];
          id v48 = [v47 identityPrivateKey];
          v49 = +[IDSRegistrationKeyManager sharedInstance];
          -[NSObject addAuthUserID:certificate:privateKey:publicKey:](v41, "addAuthUserID:certificate:privateKey:publicKey:", v45, v46, v48, [v49 identityPublicKey]);

          IDSAssignPushIdentityToMessage();
          v50 = +[NSDictionary dictionaryWithObject:v6 forKey:@"info"];
          [v41 setUserInfo:v50];

          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10028A86C;
          v58[3] = &unk_1009878C0;
          v58[4] = self;
          [v41 setCompletionBlock:v58];
          v51 = +[IMRGLog registration];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = +[FTDeviceSupport sharedInstance];
            v53 = [v52 deviceInformationString];
            *(_DWORD *)buf = 138412546;
            id v64 = v6;
            __int16 v65 = 2112;
            v66 = v53;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Sending get dependent registration request: %@  (Environment: %@)", buf, 0x16u);
          }
          id sendMessageHandler = (void (**)(id, NSObject *))self->_sendMessageHandler;
          if (sendMessageHandler) {
            sendMessageHandler[2](sendMessageHandler, v41);
          }
        }
        v8 = v57;

        BOOL v15 = 1;
        goto LABEL_49;
      }
      v10 = +[IMRGLog registration];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        if (v7)
        {
          (*((void (**)(id, id, uint64_t, void, void))v7 + 2))(v7, v6, 1, 0, 0);
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      v11 = "*** Lockdown state is expired, not sending dependent registration check";
      v12 = v10;
      uint32_t v13 = 2;
    }
    else
    {
      v10 = +[IMRGLog registration];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      id v64 = v6;
      v11 = "Not getting dependent registrations, we're not authenticated for: %@";
      v12 = v10;
      uint32_t v13 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_13;
  }
  v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not getting dependent registrations, we don't have a registration", buf, 2u);
  }

  if (v7)
  {
    (*((void (**)(id, void, uint64_t, void, void))v7 + 2))(v7, 0, 1, 0, 0);
LABEL_15:
    BOOL v15 = 0;
    id v16 = v7;
LABEL_49:

    goto LABEL_50;
  }
LABEL_16:
  BOOL v15 = 0;
LABEL_50:

  return v15;
}

- (BOOL)_hasReachedMaxNumberOfRetries:(unsigned int)a3
{
  return sub_100289F28() <= a3;
}

- (BOOL)shouldReAuthenticateForGDRResultCode:(int64_t)a3 retries:(unsigned int)a4
{
  unsigned int v5 = ![(IDSGetDependentRegistrationsCenter *)self _hasReachedMaxNumberOfRetries:*(void *)&a4];
  if (a3 == 6005) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)_submitGDRReponseToAWDWithResultCode:(int64_t)a3 error:(id)a4
{
  id v28 = a4;
  id v6 = [v28 domain];
  LODWORD(v7) = [v6 isEqualToString:NSPOSIXErrorDomain];

  v8 = [v28 domain];
  unsigned int v9 = 1;
  if (([v8 isEqualToString:NSURLErrorDomain] & 1) == 0)
  {
    v10 = [v28 domain];
    unsigned int v9 = [v10 isEqualToString:kCFErrorDomainCFNetwork];
  }
  if ([(FTNetworkSupport *)self->_ftNetworkSupport wiFiActiveAndReachable]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  sub_1001BC02C(a3);
  sub_1001BC738(-1);
  char v12 = v9 | v7;
  uint32_t v13 = IMRGLog_ptr;
  if ((v9 | v7))
  {
    v14 = 0;
    if (!v9)
    {
LABEL_8:
      BOOL v15 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 code]);
    if (!v9) {
      goto LABEL_8;
    }
  }
  BOOL v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 code]);
LABEL_11:
  if ((v7 & 1) == 0)
  {
    FTAWDLogRegistrationGetDependentRegistrations();
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  char v27 = v9 | v7;
  int64_t v16 = a3;
  char v17 = v7;
  uint64_t v7 = v11;
  id v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 code]);
  uint32_t v13 = IMRGLog_ptr;
  FTAWDLogRegistrationGetDependentRegistrations();

  uint64_t v11 = v7;
  LOBYTE(v7) = v17;
  a3 = v16;
  char v12 = v27;
  if (v9) {
LABEL_15:
  }

LABEL_16:
  if ((v12 & 1) == 0) {

  }
  id v19 = objc_alloc((Class)IDSRegistrationOperationGetDependentRegistrationsMetric);
  uint64_t v20 = sub_1001BC02C(a3);
  uint64_t v21 = sub_1001BC738(-1);
  if (v12)
  {
    id v22 = 0;
    if (!v9)
    {
LABEL_20:
      id v23 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    id v22 = objc_msgSend(v13[62], "numberWithInteger:", objc_msgSend(v28, "code"));
    if (!v9) {
      goto LABEL_20;
    }
  }
  id v23 = objc_msgSend(v13[62], "numberWithInteger:", objc_msgSend(v28, "code"));
LABEL_23:
  if ((v7 & 1) == 0)
  {
    id v25 = [v19 initWithGuid:0 success:a3 == 0 connectionType:v11 resultCode:v20 registrationType:v21 genericError:v22 URLError:v23 POSIXError:0];
    if (!v9) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  uint64_t v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 code]);
  id v25 = [v19 initWithGuid:0 success:a3 == 0 connectionType:v11 resultCode:v20 registrationType:v21 genericError:v22 URLError:v23 POSIXError:v24];

  if (v9) {
LABEL_27:
  }

LABEL_28:
  if ((v12 & 1) == 0) {

  }
  id v26 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v26 logMetric:v25];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageResponseHandler, 0);
  objc_storeStrong(&self->_sendMessageHandler, 0);
  objc_storeStrong((id *)&self->_ftNetworkSupport, 0);
  objc_storeStrong((id *)&self->_heartbeatCenter, 0);
  objc_storeStrong((id *)&self->_lockdownManager, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_currentGetDependentRegistrations, 0);

  objc_storeStrong((id *)&self->_currentGetDependentRegistrationBlocks, 0);
}

@end