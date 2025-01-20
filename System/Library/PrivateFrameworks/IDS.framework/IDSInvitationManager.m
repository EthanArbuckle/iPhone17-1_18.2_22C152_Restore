@interface IDSInvitationManager
- (BOOL)validateReceivedInvitation:(id)a3;
- (IDSInvitationManager)initWithServiceIdentifier:(id)a3;
- (IDSInvitationManagerDelegate)delegate;
- (IDSService)internal;
- (NSSet)pendingInvitations;
- (NSSet)receivedInvitations;
- (id)validateStrictDecodingForSentInvitation:(id)a3;
- (void)acceptInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6;
- (void)acceptInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5;
- (void)cancelInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5;
- (void)cancelInvitation:(id)a3 serverAcknowledgedBlock:(id)a4;
- (void)cancelInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6;
- (void)declineInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5;
- (void)declineInvitation:(id)a3 serverAcknowledgedBlock:(id)a4;
- (void)declineInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6;
- (void)declineInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5;
- (void)removePendingInvitation:(id)a3;
- (void)removeReceivedInvitation:(id)a3;
- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 options:(id)a6 serverAcknowledgedBlock:(id)a7;
- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 serverAcknowledgedBlock:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingInvitation:(id)a5 withContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingInvitationUpdate:(id)a5 withContext:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setupInvitationsForService:(id)a3;
@end

@implementation IDSInvitationManager

- (IDSInvitationManager)initWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSInvitationManager;
  v5 = [(IDSInvitationManager *)&v11 init];
  if (v5)
  {
    v6 = +[IDSInternalQueueController sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_19193F8C8;
    v8[3] = &unk_1E57291B8;
    v9 = v5;
    id v10 = v4;
    [v6 performBlock:v8 waitUntilDone:1];
  }
  return v5;
}

- (NSSet)pendingInvitations
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193FAB4;
  v8[3] = &unk_1E5729000;
  void v8[4] = self;
  [v3 performBlock:v8 waitUntilDone:1];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(NSMutableDictionary *)self->_pendingInvitations allValues];
  v6 = [v4 setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)receivedInvitations
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193FC0C;
  v8[3] = &unk_1E5729000;
  void v8[4] = self;
  [v3 performBlock:v8 waitUntilDone:1];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(NSMutableDictionary *)self->_receivedInvitations allValues];
  v6 = [v4 setWithArray:v5];

  return (NSSet *)v6;
}

- (void)setupInvitationsForService:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_invitationsLoadedFromDisk)
  {
    v45 = self;
    v5 = +[IDSDaemonController sharedInstance];
    [v5 blockUntilConnected];

    v6 = +[IDSDaemonController sharedInstance];
    v7 = [v6 listener];
    v47 = [v7 pendingInvitationsForService:v4];

    v8 = +[IDSDaemonController sharedInstance];
    v9 = [v8 listener];
    v46 = [v9 receivedInvitationsForService:v4];

    id v10 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v47 allKeys];
      *(_DWORD *)buf = 138412290;
      v62 = v11;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "setupInvitationsForService: Fetched pending invitations from daemon: %@", buf, 0xCu);
    }
    v12 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v46 allKeys];
      *(_DWORD *)buf = 138412290;
      v62 = v13;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "setupInvitationsForService: Fetched received invitations from daemon: %@", buf, 0xCu);
    }
    id v42 = v4;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [v47 allKeys];
    uint64_t v14 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v57;
      uint64_t v17 = *MEMORY[0x1E4F284E8];
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
          id v20 = objc_alloc(MEMORY[0x1E4F28DC0]);
          v21 = [v47 objectForKey:v19];
          id v55 = 0;
          v22 = (void *)[v20 initForReadingFromData:v21 error:&v55];
          id v23 = v55;

          [v22 _enableStrictSecureDecodingMode];
          [v22 setDecodingFailurePolicy:0];
          uint64_t v24 = objc_opt_class();
          id v54 = v23;
          v25 = [v22 decodeTopLevelObjectOfClass:v24 forKey:v17 error:&v54];
          id v26 = v54;

          if (v26)
          {
            v27 = +[IDSLogging IDSService];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v62 = v19;
              __int16 v63 = 2112;
              id v64 = v26;
              _os_log_error_impl(&dword_19190B000, v27, OS_LOG_TYPE_ERROR, "setupInvitationsForService: Failed to unarchive pending invitation {%@} with error {%@}", buf, 0x16u);
            }
          }
          else
          {
            [(NSMutableDictionary *)v45->_pendingInvitations setObject:v25 forKey:v19];
          }

          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v15);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obja = [v46 allKeys];
    uint64_t v28 = [obja countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v51;
      uint64_t v31 = *MEMORY[0x1E4F284E8];
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v50 + 1) + 8 * v32);
          id v34 = objc_alloc(MEMORY[0x1E4F28DC0]);
          v35 = [v46 objectForKey:v33];
          id v49 = 0;
          v36 = (void *)[v34 initForReadingFromData:v35 error:&v49];
          id v37 = v49;

          [v36 _enableStrictSecureDecodingMode];
          [v36 setDecodingFailurePolicy:0];
          uint64_t v38 = objc_opt_class();
          id v48 = v37;
          v39 = [v36 decodeTopLevelObjectOfClass:v38 forKey:v31 error:&v48];
          id v40 = v48;

          if (v40)
          {
            v41 = +[IDSLogging IDSService];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v62 = v33;
              __int16 v63 = 2112;
              id v64 = v40;
              _os_log_error_impl(&dword_19190B000, v41, OS_LOG_TYPE_ERROR, "setupInvitationsForService: Failed to unarchive received invitation {%@} with error {%@}", buf, 0x16u);
            }
          }
          else
          {
            [(NSMutableDictionary *)v45->_receivedInvitations setObject:v39 forKey:v33];
          }

          ++v32;
        }
        while (v29 != v32);
        uint64_t v29 = [obja countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v29);
    }

    v45->_invitationsLoadedFromDisk = 1;
    id v4 = v42;
  }
}

- (id)validateStrictDecodingForSentInvitation:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v24];
  id v5 = v24;
  if (v5)
  {
    id v6 = v5;
    v7 = v3;
  }
  else
  {
    id v23 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v23];
    id v9 = v23;
    [v8 _enableStrictSecureDecodingMode];
    [v8 setDecodingFailurePolicy:0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x1E4F284E8];
    id v22 = v9;
    v7 = [v8 decodeTopLevelObjectOfClass:v10 forKey:v11 error:&v22];
    id v6 = v22;

    if (!v6)
    {
      id v20 = 0;
      goto LABEL_7;
    }
  }
  v12 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_191A2D294();
  }

  v13 = [NSString stringWithFormat:@"Failed to validate strict decoding for invitation"];
  id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v15 = *MEMORY[0x1E4F28568];
  v26[0] = v13;
  uint64_t v16 = *MEMORY[0x1E4F28A50];
  v25[0] = v15;
  v25[1] = v16;
  uint64_t v17 = [v6 userInfo];
  uint64_t v18 = [v17 objectForKey:*MEMORY[0x1E4F28228]];
  v26[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  id v20 = (void *)[v14 initWithDomain:@"com.apple.identityservices.error" code:55 userInfo:v19];

LABEL_7:

  return v20;
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 serverAcknowledgedBlock:(id)a6
{
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 options:(id)a6 serverAcknowledgedBlock:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v34 = a4;
  id v35 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = +[IDSDaemonController sharedInstance];
  [v14 blockUntilConnected];

  uint64_t v15 = [[IDSSentInvitation alloc] initWithDestination:v36 state:1 expirationDate:v34 uniqueID:0 context:v35];
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_191918680;
  v61 = sub_191918560;
  id v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_191918680;
  v55[4] = sub_191918560;
  id v56 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v16 = [(IDSInvitation *)v15 uniqueID];
  id v56 = [v16 UUIDString];

  if (v12)
  {
    id v17 = (id)[v12 mutableCopy];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v18 = [(IDSInvitation *)v15 uniqueID];
  v19 = [v18 UUIDString];
  id v20 = IDSGetUUIDData();
  [v17 setValue:v20 forKey:@"IDSSendMessageOptionUUID"];

  [v17 setValue:&unk_1EE28B238 forKey:@"IDSSendMessageOptionCommand"];
  v21 = [(IDSInvitationManager *)self validateStrictDecodingForSentInvitation:v15];
  if (!v21)
  {
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x2020000000;
    char v51 = -86;
    id v23 = +[IDSInternalQueueController sharedInstance];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_191940A84;
    v40[3] = &unk_1E5729F40;
    v45 = v55;
    id v24 = v13;
    id v44 = v24;
    v40[4] = self;
    v46 = &v48;
    v25 = v15;
    v41 = v25;
    id v42 = v36;
    id v43 = v17;
    v47 = &v57;
    [v23 performBlock:v40 waitUntilDone:1];

    id v26 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v49 + 24)) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      uint64_t v28 = v58[5];
      *(_DWORD *)buf = 138412546;
      id v64 = v27;
      __int16 v65 = 2112;
      uint64_t v66 = v28;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "sendInvitationToDestination: received %@ from IDSService with error {%@}", buf, 0x16u);
    }

    if (*((unsigned char *)v49 + 24))
    {
      pendingInvitations = self->_pendingInvitations;
      uint64_t v30 = [(IDSInvitation *)v25 uniqueID];
      uint64_t v31 = [v30 UUIDString];
      [(NSMutableDictionary *)pendingInvitations setObject:v25 forKey:v31];
    }
    else
    {
      uint64_t v32 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_191A2D2FC();
      }

      if (!v24) {
        goto LABEL_19;
      }
      delegateQueue = self->_delegateQueue;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_191940B9C;
      v37[3] = &unk_1E5729F68;
      id v38 = v24;
      v39 = &v57;
      dispatch_async(delegateQueue, v37);
      uint64_t v30 = v38;
    }

LABEL_19:
    _Block_object_dispose(&v48, 8);
    goto LABEL_20;
  }
  if (v13)
  {
    id v22 = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_191940A6C;
    block[3] = &unk_1E5729880;
    id v54 = v13;
    id v53 = v21;
    dispatch_async(v22, block);
  }
LABEL_20:

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);
}

- (void)cancelInvitation:(id)a3 serverAcknowledgedBlock:(id)a4
{
}

- (void)cancelInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5
{
}

- (void)cancelInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSDaemonController sharedInstance];
  [v14 blockUntilConnected];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = sub_191918680;
  uint64_t v50 = sub_191918560;
  id v51 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_191918680;
  v44[4] = sub_191918560;
  id v45 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = [v10 uniqueID];
  id v45 = [v15 UUIDString];

  if (v12)
  {
    id v16 = (id)[v12 mutableCopy];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v17 = [v10 uniqueID];
  uint64_t v18 = [v17 UUIDString];
  v19 = IDSGetUUIDData();
  [v16 setValue:v19 forKey:@"IDSSendMessageOptionUUID"];

  [v16 setValue:&unk_1EE28B250 forKey:@"IDSSendMessageOptionCommand"];
  [v10 setState:3];
  id v20 = v11;
  if (!v11)
  {
    id v20 = [v10 context];
  }
  [v10 setContext:v20];
  if (!v11) {

  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = -86;
  v21 = +[IDSInternalQueueController sharedInstance];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_191941094;
  v33[3] = &unk_1E5729F90;
  id v37 = v44;
  id v22 = v13;
  id v36 = v22;
  v33[4] = self;
  id v38 = &v40;
  id v23 = v10;
  id v34 = v23;
  id v24 = v16;
  id v35 = v24;
  v39 = &v46;
  [v21 performBlock:v33 waitUntilDone:1];

  v25 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v41 + 24)) {
      id v26 = @"YES";
    }
    else {
      id v26 = @"NO";
    }
    uint64_t v27 = v47[5];
    *(_DWORD *)buf = 138412546;
    id v53 = v26;
    __int16 v54 = 2112;
    uint64_t v55 = v27;
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "cancelInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((unsigned char *)v41 + 24))
  {
    uint64_t v28 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_191A2D364();
    }

    if (v22)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919411DC;
      block[3] = &unk_1E5729F68;
      id v31 = v22;
      uint64_t v32 = &v46;
      dispatch_async(delegateQueue, block);
    }
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(&v46, 8);
}

- (void)acceptInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5
{
}

- (void)acceptInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSDaemonController sharedInstance];
  [v14 blockUntilConnected];

  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = sub_191918680;
  __int16 v54 = sub_191918560;
  id v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_191918680;
  v48[4] = sub_191918560;
  id v49 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = [v10 uniqueID];
  id v49 = [v15 UUIDString];

  if (v12)
  {
    id v16 = (id)[v12 mutableCopy];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v17 = [v10 uniqueID];
  uint64_t v18 = [v17 UUIDString];
  v19 = IDSGetUUIDData();
  [v16 setValue:v19 forKey:@"IDSSendMessageOptionUUID"];

  [v16 setValue:&unk_1EE28B268 forKey:@"IDSSendMessageOptionCommand"];
  [v10 setState:4];
  [v10 setContext:v11];
  id v20 = (void *)MEMORY[0x1E4F6B438];
  v21 = [v10 fromID];
  id v22 = [v20 destinationWithURI:v21];

  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = -86;
  id v23 = +[IDSInternalQueueController sharedInstance];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1919416EC;
  v36[3] = &unk_1E5729F40;
  v41 = v48;
  id v24 = v13;
  id v40 = v24;
  v36[4] = self;
  uint64_t v42 = &v44;
  id v25 = v10;
  id v37 = v25;
  id v26 = v22;
  id v38 = v26;
  id v27 = v16;
  id v39 = v27;
  char v43 = &v50;
  [v23 performBlock:v36 waitUntilDone:1];

  uint64_t v28 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v45 + 24)) {
      uint64_t v29 = @"YES";
    }
    else {
      uint64_t v29 = @"NO";
    }
    uint64_t v30 = v51[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = v29;
    __int16 v58 = 2112;
    uint64_t v59 = v30;
    _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "acceptInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((unsigned char *)v45 + 24))
  {
    id v31 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_191A2D3CC();
    }

    if (v24)
    {
      delegateQueue = self->_delegateQueue;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_19194180C;
      v33[3] = &unk_1E5729F68;
      id v34 = v24;
      id v35 = &v50;
      dispatch_async(delegateQueue, v33);
    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v48, 8);

  _Block_object_dispose(&v50, 8);
}

- (void)declineInvitation:(id)a3 serverAcknowledgedBlock:(id)a4
{
}

- (void)declineInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5
{
}

- (void)declineInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5
{
}

- (void)declineInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSDaemonController sharedInstance];
  [v14 blockUntilConnected];

  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  __int16 v54 = sub_191918680;
  id v55 = sub_191918560;
  id v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_191918680;
  v49[4] = sub_191918560;
  id v50 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = [v10 uniqueID];
  id v50 = [v15 UUIDString];

  if (v12)
  {
    id v16 = (id)[v12 mutableCopy];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v17 = [v10 uniqueID];
  uint64_t v18 = [v17 UUIDString];
  v19 = IDSGetUUIDData();
  [v16 setValue:v19 forKey:@"IDSSendMessageOptionUUID"];

  [v16 setValue:&unk_1EE28B280 forKey:@"IDSSendMessageOptionCommand"];
  [v10 setState:5];
  id v20 = v11;
  if (!v11)
  {
    id v20 = [v10 context];
  }
  [v10 setContext:v20];
  if (!v11) {

  }
  v21 = (void *)MEMORY[0x1E4F6B438];
  id v22 = [v10 fromID];
  id v23 = [v21 destinationWithURI:v22];

  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = -86;
  id v24 = +[IDSInternalQueueController sharedInstance];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_191941D58;
  v37[3] = &unk_1E5729F40;
  uint64_t v42 = v49;
  id v25 = v13;
  id v41 = v25;
  void v37[4] = self;
  char v43 = &v45;
  id v26 = v10;
  id v38 = v26;
  id v27 = v23;
  id v39 = v27;
  id v28 = v16;
  id v40 = v28;
  uint64_t v44 = &v51;
  [v24 performBlock:v37 waitUntilDone:1];

  uint64_t v29 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v46 + 24)) {
      uint64_t v30 = @"YES";
    }
    else {
      uint64_t v30 = @"NO";
    }
    uint64_t v31 = v52[5];
    *(_DWORD *)buf = 138412546;
    __int16 v58 = v30;
    __int16 v59 = 2112;
    uint64_t v60 = v31;
    _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "declineInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((unsigned char *)v46 + 24))
  {
    uint64_t v32 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_191A2D434();
    }

    if (v25)
    {
      delegateQueue = self->_delegateQueue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_191941E78;
      v34[3] = &unk_1E5729F68;
      id v35 = v25;
      id v36 = &v51;
      dispatch_async(delegateQueue, v34);
    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v7 = a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  if (v7) {
    objc_storeStrong((id *)&self->_delegateQueue, a4);
  }
  v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  id v9 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191941F7C;
  v10[3] = &unk_1E5729000;
  v10[4] = self;
  [v9 performBlock:v10 waitUntilDone:1];
}

- (BOOL)validateReceivedInvitation:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_19194237C;
  v28[3] = &unk_1E5729000;
  v28[4] = self;
  [v5 performBlock:v28 waitUntilDone:1];

  if (!v4)
  {
    id v12 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2D49C();
    }
    goto LABEL_28;
  }
  uint64_t v6 = [v4 expirationDate];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [v4 expirationDate];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v8 compare:v9];

    if (v10 == -1)
    {
      id v12 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_191A2D6AC(v4);
      }
      goto LABEL_28;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    pendingInvitations = self->_pendingInvitations;
  }
  else {
    pendingInvitations = self->_receivedInvitations;
  }
  id v13 = [v4 uniqueID];
  id v14 = [v13 UUIDString];
  id v12 = [(NSMutableDictionary *)pendingInvitations objectForKey:v14];

  if ([v4 state] != 1)
  {
    if (!v12)
    {
      v19 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_191A2D4D0(v4);
      }
      goto LABEL_27;
    }
    if (_os_feature_enabled_impl())
    {
      uint64_t v15 = [v12 senderMergeID];

      if (v15)
      {
        id v16 = [v12 senderMergeID];
        id v17 = [v4 senderMergeID];
        char v18 = [v16 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          v19 = +[IDSLogging IDSService];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_191A2D60C(v4);
          }
LABEL_27:

LABEL_28:
          BOOL v26 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        id v20 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v12 senderMergeID];
          id v22 = [v4 senderMergeID];
          *(_DWORD *)buf = 138412546;
          uint64_t v30 = v21;
          __int16 v31 = 2112;
          uint64_t v32 = v22;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Validating Invitation: Stored invitation's sender mergeId {%@} is invalid. Could not compare to received invitation's sender mergeId {%@}", buf, 0x16u);
        }
      }
    }
    id v23 = [v4 uniqueID];
    id v24 = [v12 uniqueID];
    char v25 = [v23 isEqual:v24];

    if ((v25 & 1) == 0)
    {
      v19 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_191A2D56C(v4);
      }
      goto LABEL_27;
    }
  }
  BOOL v26 = 1;
LABEL_29:

  return v26;
}

- (void)service:(id)a3 account:(id)a4 incomingInvitation:(id)a5 withContext:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  if ([(IDSInvitationManager *)self validateReceivedInvitation:v7])
  {
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    uint64_t v10 = [v7 state];
    if (v10 == 3)
    {
      uint64_t v30 = +[IDSDaemonController sharedInstance];
      __int16 v31 = [v7 uniqueID];
      uint64_t v32 = [v31 UUIDString];
      uint64_t v46 = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      id v34 = [(IDSService *)self->_internal accounts];
      id v35 = [v34 anyObject];
      id v36 = [v35 serviceName];
      [v30 removeReceivedInvitation:v33 forService:v36];

      receivedInvitations = self->_receivedInvitations;
      id v38 = [v7 uniqueID];
      id v39 = [v38 UUIDString];
      [(NSMutableDictionary *)receivedInvitations removeObjectForKey:v39];

      uint64_t v40 = [(IDSInvitationManager *)self delegate];
      if (!v40
        || (id v41 = (void *)v40,
            [(IDSInvitationManager *)self delegate],
            uint64_t v42 = objc_claimAutoreleasedReturnValue(),
            char v43 = objc_opt_respondsToSelector(),
            v42,
            v41,
            (v43 & 1) == 0))
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D80C();
        }
        goto LABEL_19;
      }
      uint64_t v44 = [(IDSInvitationManager *)self delegate];
      [v44 manager:self senderDidCancelInvitation:v7];

      char v25 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = [v7 state];
        id v27 = [v7 uniqueID];
        id v28 = [v27 UUIDString];
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = v45;
        __int16 v49 = 2112;
        id v50 = v28;
        uint64_t v29 = "IncomingInvitation: Invitation state %ld. Delivered {%@} to delegate senderDidCancelInvitation";
        goto LABEL_12;
      }
    }
    else
    {
      if (v10 != 1)
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D730(v7);
        }
        goto LABEL_19;
      }
      id v11 = +[IDSDaemonController sharedInstance];
      id v12 = [(IDSService *)self->_internal accounts];
      id v13 = [v12 anyObject];
      id v14 = [v13 serviceName];
      uint64_t v15 = [v7 uniqueID];
      id v16 = [v15 UUIDString];
      [v11 persistReceivedInvitation:v9 forService:v14 withUniqueID:v16];

      id v17 = self->_receivedInvitations;
      char v18 = [v7 uniqueID];
      v19 = [v18 UUIDString];
      [(NSMutableDictionary *)v17 setObject:v7 forKey:v19];

      uint64_t v20 = [(IDSInvitationManager *)self delegate];
      if (!v20
        || (v21 = (void *)v20,
            [(IDSInvitationManager *)self delegate],
            id v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = objc_opt_respondsToSelector(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D7D8();
        }
        goto LABEL_19;
      }
      id v24 = [(IDSInvitationManager *)self delegate];
      [v24 manager:self incomingInvitation:v7];

      char v25 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v7 state];
        id v27 = [v7 uniqueID];
        id v28 = [v27 UUIDString];
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = v26;
        __int16 v49 = 2112;
        id v50 = v28;
        uint64_t v29 = "IncomingInvitation: Invitation state %ld. Delivered {%@} to delegate incomingInvitation";
LABEL_12:
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
LABEL_19:
  }
}

- (void)service:(id)a3 account:(id)a4 incomingInvitationUpdate:(id)a5 withContext:(id)a6
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  if ([(IDSInvitationManager *)self validateReceivedInvitation:v7])
  {
    uint64_t v9 = [v7 state];
    if (v9 == 5)
    {
      uint64_t v30 = +[IDSDaemonController sharedInstance];
      __int16 v31 = [v7 uniqueID];
      uint64_t v32 = [v31 UUIDString];
      uint64_t v46 = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      id v34 = [(IDSService *)self->_internal accounts];
      id v35 = [v34 anyObject];
      id v36 = [v35 serviceName];
      [v30 removePendingInvitation:v33 forService:v36];

      pendingInvitations = self->_pendingInvitations;
      id v38 = [v7 uniqueID];
      id v39 = [v38 UUIDString];
      [(NSMutableDictionary *)pendingInvitations removeObjectForKey:v39];

      uint64_t v40 = [(IDSInvitationManager *)self delegate];
      if (!v40
        || (id v41 = (void *)v40,
            [(IDSInvitationManager *)self delegate],
            uint64_t v42 = objc_claimAutoreleasedReturnValue(),
            char v43 = objc_opt_respondsToSelector(),
            v42,
            v41,
            (v43 & 1) == 0))
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D91C();
        }
        goto LABEL_19;
      }
      uint64_t v44 = [(IDSInvitationManager *)self delegate];
      [v44 manager:self receiverDidDeclineInvitation:v7];

      char v25 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = [v7 state];
        id v27 = [v7 uniqueID];
        id v28 = [v27 UUIDString];
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = v45;
        __int16 v49 = 2112;
        id v50 = v28;
        uint64_t v29 = "IncomingInvitationUpdate: Invitation state %ld. Delivered {%@} to delegate receiverDidDeclineInvitation";
        goto LABEL_12;
      }
    }
    else
    {
      if (v9 != 4)
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D840(v7);
        }
        goto LABEL_19;
      }
      uint64_t v10 = +[IDSDaemonController sharedInstance];
      id v11 = [v7 uniqueID];
      id v12 = [v11 UUIDString];
      v51[0] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      id v14 = [(IDSService *)self->_internal accounts];
      uint64_t v15 = [v14 anyObject];
      id v16 = [v15 serviceName];
      [v10 removePendingInvitation:v13 forService:v16];

      id v17 = self->_pendingInvitations;
      char v18 = [v7 uniqueID];
      v19 = [v18 UUIDString];
      [(NSMutableDictionary *)v17 removeObjectForKey:v19];

      uint64_t v20 = [(IDSInvitationManager *)self delegate];
      if (!v20
        || (v21 = (void *)v20,
            [(IDSInvitationManager *)self delegate],
            id v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = objc_opt_respondsToSelector(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        char v25 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_191A2D8E8();
        }
        goto LABEL_19;
      }
      id v24 = [(IDSInvitationManager *)self delegate];
      [v24 manager:self receiverDidAcceptInvitation:v7];

      char v25 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v7 state];
        id v27 = [v7 uniqueID];
        id v28 = [v27 UUIDString];
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = v26;
        __int16 v49 = 2112;
        id v50 = v28;
        uint64_t v29 = "IncomingInvitationUpdate: Invitation state %ld. Delivered {%@} to delegate receiverDidAcceptInvitation";
LABEL_12:
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
LABEL_19:
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v59 = a4;
  id v14 = a5;
  uint64_t v61 = (uint64_t (*)(uint64_t, uint64_t))a7;
  id v60 = a8;
  uint64_t v15 = +[IDSDaemonController sharedInstance];
  [v15 blockUntilConnected];

  id v16 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    if (v10) {
      id v17 = @"YES";
    }
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v86 = v61;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Identifier {%@}. didSendWithSuccess {%@} with error %@", buf, 0x20u);
  }

  char v18 = [(NSMutableDictionary *)self->_pendingInvitations objectForKey:v14];
  if (v18
    || ([(NSMutableDictionary *)self->_receivedInvitations objectForKey:v14],
        (char v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v86 = sub_191943654;
    v87 = sub_191943680;
    id v88 = 0;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x3032000000;
    v76 = sub_191943654;
    v77 = sub_191943680;
    id v78 = 0;
    v19 = +[IDSInternalQueueController sharedInstance];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = sub_191943688;
    v69[3] = &unk_1E5729FB8;
    v71 = buf;
    v69[4] = self;
    id v57 = v14;
    id v70 = v57;
    v72 = &v73;
    [v19 performBlock:v69 waitUntilDone:1];

    if ([v18 state] == 1)
    {
      if (v61)
      {
        [(NSMutableDictionary *)self->_pendingInvitations removeObjectForKey:v57];
      }
      else
      {
        __int16 v31 = [v60 destinationCorrelationIdentifier];
        [v18 setSenderMergeID:v31];

        uint64_t v32 = [v60 fromID];
        uint64_t v33 = [v32 _stripFZIDPrefix];
        id v34 = [v33 _bestGuessURI];
        [v18 setSelfHandle:v34];

        id v35 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
        id v36 = +[IDSDaemonController sharedInstance];
        id v37 = [(IDSService *)self->_internal accounts];
        id v38 = [v37 anyObject];
        id v39 = [v38 serviceName];
        uint64_t v40 = [v18 uniqueID];
        id v41 = [v40 UUIDString];
        [v36 persistPendingInvitation:v35 forService:v39 withUniqueID:v41];
      }
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v42 = +[IDSLogging IDSService];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v18 state];
          *(_DWORD *)v81 = 138412546;
          id v82 = v57;
          __int16 v83 = 2048;
          uint64_t v84 = v43;
          _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Calling block for invitation with identifier {%@} and state {%ld}", v81, 0x16u);
        }

        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19194372C;
        block[3] = &unk_1E57296F8;
        uint64_t v66 = v61;
        v68 = buf;
        uint64_t v67 = v18;
        dispatch_async(delegateQueue, block);

        uint64_t v45 = v66;
        goto LABEL_32;
      }
      uint64_t v45 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v81 = 138412290;
        id v82 = v57;
LABEL_31:
        _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: No invitation ack block found with identifier {%@}", v81, 0xCu);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (!v61)
    {
      uint64_t v20 = [v18 state];
      if ((unint64_t)(v20 - 4) >= 2)
      {
        if (v20 != 3) {
          goto LABEL_25;
        }
        uint64_t v46 = +[IDSDaemonController sharedInstance];
        uint64_t v47 = [v18 uniqueID];
        uint64_t v48 = [v47 UUIDString];
        v80 = v48;
        __int16 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        id v50 = [(IDSService *)self->_internal accounts];
        uint64_t v51 = [v50 anyObject];
        uint64_t v52 = [v51 serviceName];
        [v46 removePendingInvitation:v49 forService:v52];

        pendingInvitations = self->_pendingInvitations;
        uint64_t v29 = [v18 uniqueID];
        uint64_t v30 = [v29 UUIDString];
        [(NSMutableDictionary *)pendingInvitations removeObjectForKey:v30];
      }
      else
      {
        v21 = +[IDSDaemonController sharedInstance];
        id v22 = [v18 uniqueID];
        char v23 = [v22 UUIDString];
        v79 = v23;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
        char v25 = [(IDSService *)self->_internal accounts];
        uint64_t v26 = [v25 anyObject];
        id v27 = [v26 serviceName];
        [v21 removeReceivedInvitation:v24 forService:v27];

        receivedInvitations = self->_receivedInvitations;
        uint64_t v29 = [v18 uniqueID];
        uint64_t v30 = [v29 UUIDString];
        [(NSMutableDictionary *)receivedInvitations removeObjectForKey:v30];
      }
    }
LABEL_25:
    if (v74[5])
    {
      __int16 v54 = +[IDSLogging IDSService];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [v18 state];
        *(_DWORD *)v81 = 138412546;
        id v82 = v57;
        __int16 v83 = 2048;
        uint64_t v84 = v55;
        _os_log_impl(&dword_19190B000, v54, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Calling block for invitation with identifier {%@} and state {%ld}", v81, 0x16u);
      }

      id v56 = self->_delegateQueue;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = sub_191943760;
      v62[3] = &unk_1E5728DF8;
      id v64 = &v73;
      __int16 v63 = v61;
      dispatch_async(v56, v62);
      uint64_t v45 = v63;
      goto LABEL_32;
    }
    uint64_t v45 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v81 = 138412290;
      id v82 = v57;
      goto LABEL_31;
    }
LABEL_32:

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_33;
  }
  char v18 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_191A2D950();
  }
LABEL_33:
}

- (void)removePendingInvitation:(id)a3
{
  id v9 = a3;
  id v4 = +[IDSDaemonController sharedInstance];
  [v4 blockUntilConnected];

  id v5 = +[IDSDaemonController sharedInstance];
  uint64_t v6 = [(IDSService *)self->_internal accounts];
  id v7 = [v6 anyObject];
  v8 = [v7 serviceName];
  [v5 removePendingInvitation:v9 forService:v8];

  [(NSMutableDictionary *)self->_pendingInvitations removeObjectsForKeys:v9];
}

- (void)removeReceivedInvitation:(id)a3
{
  id v9 = a3;
  id v4 = +[IDSDaemonController sharedInstance];
  [v4 blockUntilConnected];

  id v5 = +[IDSDaemonController sharedInstance];
  uint64_t v6 = [(IDSService *)self->_internal accounts];
  id v7 = [v6 anyObject];
  v8 = [v7 serviceName];
  [v5 removeReceivedInvitation:v9 forService:v8];

  [(NSMutableDictionary *)self->_receivedInvitations removeObjectsForKeys:v9];
}

- (IDSService)internal
{
  return self->_internal;
}

- (IDSInvitationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSInvitationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_receivedInvitations, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_serverAcknowledgedBlockWithInvitationMap, 0);

  objc_storeStrong((id *)&self->_serverAcknowledgedBlockMap, 0);
}

@end