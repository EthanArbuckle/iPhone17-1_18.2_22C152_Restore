@interface IDSTransactionLogSyncTaskHandler
- (IDSTransactionLogSyncTask)syncTask;
- (IDSTransactionLogSyncTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5;
- (IDSTransactionLogTaskHandlerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)_destinationsInMessages:(id)a3;
- (id)_groupIDsFromMessages:(id)a3;
- (id)_groupsByGroupIDFromGroups:(id)a3;
- (id)_participantsByAliasFromParticipants:(id)a3;
- (id)_transactionMessageFromTransportMessage:(id)a3 groups:(id)a4 participants:(id)a5 accountInfo:(id)a6;
- (id)_transactionMessageFromTransportMessage:(id)a3 withDecryptedPayload:(id)a4 accountInfo:(id)a5;
- (id)_transactionMessageFromTransportMessage:(id)a3 withGroupID:(id)a4 groups:(id)a5 accountInfo:(id)a6;
- (id)_transactionMessageFromTransportMessage:(id)a3 withParticipants:(id)a4 accountInfo:(id)a5;
- (void)_completeWithError:(id)a3;
- (void)_transactionMessagesFromTransportMessages:(id)a3 withParticipants:(id)a4 groups:(id)a5 accountInfo:(id)a6 completion:(id)a7;
- (void)perform;
- (void)qFetchParticipantsFromDeviceMessges:(id)a3 andGroupsFromGroupMessages:(id)a4 completion:(id)a5;
- (void)qIngestMessages:(id)a3 completion:(id)a4;
- (void)qPerformWithToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSyncTask:(id)a3;
@end

@implementation IDSTransactionLogSyncTaskHandler

- (IDSTransactionLogSyncTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSTransactionLogSyncTaskHandler;
  v12 = [(IDSTransactionLogTaskHandler *)&v15 _init];
  v13 = (IDSTransactionLogSyncTaskHandler *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeWeak((id *)&v13->_delegate, v10);
  }

  return v13;
}

- (void)perform
{
  v3 = [(IDSTransactionLogSyncTaskHandler *)self queue];
  dispatch_assert_queue_V2(v3);

  v7 = _os_activity_create(&dword_19190B000, "IDSTransactionLogSync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  v4 = [(IDSTransactionLogSyncTaskHandler *)self delegate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A27B28;
  v5[3] = &unk_1E572DA08;
  v5[4] = self;
  [v4 persistedTokenForTaskHandler:self completion:v5];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)qPerformWithToken:(id)a3
{
  id v4 = a3;
  v5 = +[IDSLogging transactionLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_INFO, "Fetching messages", buf, 2u);
  }

  v6 = [(IDSTransactionLogSyncTaskHandler *)self delegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191A27DBC;
  v7[3] = &unk_1E572DA80;
  v7[4] = self;
  [v6 taskHandler:self messagesFromToken:v4 completion:v7];
}

- (void)qIngestMessages:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "groupID", v25);

        if (v16) {
          v17 = v7;
        }
        else {
          v17 = v8;
        }
        [v17 addObject:v15];
        v18 = [v15 recipientAlias];

        if (v18)
        {
          v19 = [v15 recipientAlias];
          [v9 addObject:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  v20 = [(IDSTransactionLogSyncTaskHandler *)self delegate];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_191A28538;
  v26[3] = &unk_1E572DB20;
  v26[4] = self;
  id v27 = v8;
  id v28 = v7;
  id v29 = v10;
  id v30 = v25;
  id v21 = v25;
  id v22 = v10;
  id v23 = v7;
  id v24 = v8;
  [v20 taskHandler:self accountInfoForAliases:v9 completion:v26];
}

- (void)qFetchParticipantsFromDeviceMessges:(id)a3 andGroupsFromGroupMessages:(id)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[IDSLogging transactionLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_INFO, "Fetching participants/groups for deviceMessges {deviceMessages.count: %ld, groupMessages.count: %ld}", buf, 0x16u);
  }

  uint64_t v12 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v47 = sub_1919187F0;
  v48 = sub_191918618;
  id v49 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1919187F0;
  v44[4] = sub_191918618;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_1919187F0;
  v42[4] = sub_191918618;
  id v43 = 0;
  uint64_t v13 = [(IDSTransactionLogSyncTaskHandler *)self _destinationsInMessages:v8];
  dispatch_group_enter(v12);
  v14 = [(IDSTransactionLogSyncTaskHandler *)self delegate];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_191A28F90;
  v36[3] = &unk_1E572DB48;
  v36[4] = self;
  id v15 = v13;
  id v37 = v15;
  v40 = buf;
  id v16 = v8;
  id v38 = v16;
  v41 = v42;
  v17 = v12;
  v39 = v17;
  [v14 taskHandler:self participantsWithDestinations:v15 completion:v36];

  v18 = [(IDSTransactionLogSyncTaskHandler *)self _groupIDsFromMessages:v9];
  dispatch_group_enter(v17);
  v19 = [(IDSTransactionLogSyncTaskHandler *)self delegate];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_191A2913C;
  v30[3] = &unk_1E572DB48;
  v30[4] = self;
  id v20 = v18;
  id v31 = v20;
  long long v34 = v44;
  id v21 = v9;
  id v32 = v21;
  v35 = v42;
  id v22 = v17;
  long long v33 = v22;
  [v19 taskHandler:self groupsWithGroupIDs:v20 completion:v30];

  id v23 = [(IDSTransactionLogSyncTaskHandler *)self queue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_191A292E8;
  v25[3] = &unk_1E572DB70;
  id v26 = v10;
  id v27 = v42;
  id v28 = buf;
  id v29 = v44;
  id v24 = v10;
  dispatch_group_notify(v22, v23, v25);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_transactionMessagesFromTransportMessages:(id)a3 withParticipants:(id)a4 groups:(id)a5 accountInfo:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v24 = (void (**)(id, void *, void))a7;
  id v15 = [(IDSTransactionLogSyncTaskHandler *)self _groupsByGroupIDFromGroups:a5];
  id v25 = v13;
  id v16 = [(IDSTransactionLogSyncTaskHandler *)self _participantsByAliasFromParticipants:v13];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [(IDSTransactionLogSyncTaskHandler *)self _transactionMessageFromTransportMessage:*(void *)(*((void *)&v26 + 1) + 8 * v22) groups:v15 participants:v16 accountInfo:v14];
        if (v23) {
          [v17 addObject:v23];
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  v24[2](v24, v17, 0);
}

- (IDSTransactionLogTaskHandlerDelegate)delegate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"IDSTransactionLogTaskHandler.m", 278, @"Invalid parameter not satisfying: %@", @"_delegate" object file lineNumber description];
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);

  return (IDSTransactionLogTaskHandlerDelegate *)v6;
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSTransactionLogSyncTaskHandler *)self syncTask];
  [v5 _completeWithError:v4];
}

- (id)_destinationsInMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "destination", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_groupIDsFromMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "groupID", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_groupsByGroupIDFromGroups:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "groupID", (void)v13);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_participantsByAliasFromParticipants:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = objc_msgSend(v10, "aliases", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              [v4 setObject:v10 forKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 groups:(id)a4 participants:(id)a5 accountInfo:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v13 groupID];
  if (v14) {
    [(IDSTransactionLogSyncTaskHandler *)self _transactionMessageFromTransportMessage:v13 withGroupID:v14 groups:v10 accountInfo:v12];
  }
  else {
  long long v15 = [(IDSTransactionLogSyncTaskHandler *)self _transactionMessageFromTransportMessage:v13 withParticipants:v11 accountInfo:v12];
  }

  return v15;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withGroupID:(id)a4 groups:(id)a5 accountInfo:(id)a6
{
  return 0;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withParticipants:(id)a4 accountInfo:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 destination];
  id v12 = [v11 alias];
  id v13 = [v10 objectForKeyedSubscript:v12];

  uint64_t v14 = [v11 pushToken];
  long long v15 = [v13 deviceWithIdentifier:v14];

  if (v15)
  {
    uint64_t v16 = [v8 encryptedPayload];
    long long v17 = [v9 accountIdentity];
    long long v18 = [v8 cypherIdentifier];
    long long v24 = (void *)v16;
    id v25 = 0;
    long long v19 = [v15 verifyAndRevealData:v16 withReceipient:v17 cypherIdentifier:v18 error:&v25];
    id v20 = v25;

    if (v19)
    {
      long long v21 = [(IDSTransactionLogSyncTaskHandler *)self _transactionMessageFromTransportMessage:v8 withDecryptedPayload:v19 accountInfo:v9];
    }
    else
    {
      long long v22 = +[IDSLogging transactionLog];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v20;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Failed to decrypt device message {error: %{public}@}", buf, 0xCu);
      }

      long long v21 = 0;
    }
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withDecryptedPayload:(id)a4 accountInfo:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 senderAlias];
  uint64_t v11 = [v7 recipientAlias];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    id v13 = [v9 accountForAlias:v11];
    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v15 = [v7 payload];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6B040]];

      uint64_t v16 = [v7 payload];
      long long v17 = [v16 objectForKeyedSubscript:@"E"];
      [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6B038]];

      [v14 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6B020]];
      long long v18 = [IDSTransactionLogDictionaryMessage alloc];
      long long v19 = [v13 uniqueID];
      id v20 = [v7 senderAlias];
      [v13 loginID];
      id v30 = v8;
      long long v21 = v31 = v10;
      [v9 serviceName];
      long long v22 = v12;
      v24 = id v23 = v9;
      id v25 = [(IDSTransactionLogDictionaryMessage *)v18 initWithDictionary:v14 accountUniqueID:v19 fromID:v20 loginID:v21 serviceName:v24];

      id v9 = v23;
      id v12 = v22;

      id v8 = v30;
      id v10 = v31;

      goto LABEL_16;
    }
    uint64_t v28 = +[IDSLogging transactionLog];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_191A45BB8(v7, v9, v28);
    }
  }
  else
  {
    id v13 = +[IDSLogging transactionLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v26 = @"NO";
      *(_DWORD *)buf = 138478851;
      long long v33 = v10;
      if (v10) {
        id v27 = @"YES";
      }
      else {
        id v27 = @"NO";
      }
      if (v12) {
        long long v26 = @"YES";
      }
      __int16 v34 = 2113;
      v35 = v12;
      __int16 v36 = 2113;
      id v37 = v7;
      __int16 v38 = 2114;
      v39 = v27;
      __int16 v40 = 2114;
      v41 = v26;
      _os_log_error_impl(&dword_19190B000, v13, OS_LOG_TYPE_ERROR, "Message missing sender/recipient alias {senderAlias: %{private}@, recipientAlias: %{private}@, message: %{private}@, senderAlias==nil: %{public}@, recipientAlias==nil: %{public}@}", buf, 0x34u);
    }
  }
  id v25 = 0;
LABEL_16:

  return v25;
}

- (IDSTransactionLogSyncTask)syncTask
{
  return self->_syncTask;
}

- (void)setSyncTask:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_syncTask, 0);
}

@end