@interface MSPSharedTripGroupSession
- (BOOL)_isValidParticipant:(id)a3;
- (BOOL)_joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5;
- (BOOL)_leaveLiveMode:(id *)a3;
- (BOOL)_sendChunkMessage:(id)a3 to:(id)a4 packet:(id)a5 options:(id)a6 error:(id *)a7;
- (BOOL)inLiveMode;
- (BOOL)joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5;
- (BOOL)leaveLiveModeForced:(id *)a3;
- (BOOL)leaveLiveModeIfNeeded:(id *)a3;
- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)sendCommand:(id)a3 fromHandle:(id)a4 fromAccountID:(id)a5 error:(id *)a6;
- (BOOL)sessionIsAliveAfterRemovingSharingIdentifiers:(id)a3;
- (MSPSharedTripGroupSession)initWithService:(id)a3 groupID:(id)a4 initiator:(BOOL)a5 initiatorIdentifier:(id)a6;
- (MSPSharedTripGroupSessionDelegate)delegate;
- (NSArray)accountIdentifiers;
- (NSString)identifier;
- (NSString)initiatorDisplayName;
- (NSString)initiatorIdentifier;
- (id)_currentRoutePath;
- (void)_sharingEnded;
- (void)_sharingEndedWithError:(id)a3;
- (void)addSharingWith:(id)a3;
- (void)dealloc;
- (void)participantDidJoin:(id)a3;
- (void)participantDidLeave:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitiatorDisplayName:(id)a3;
@end

@implementation MSPSharedTripGroupSession

- (MSPSharedTripGroupSession)initWithService:(id)a3 groupID:(id)a4 initiator:(BOOL)a5 initiatorIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MSPSharedTripGroupSession;
  v14 = [(MSPSharedTripGroupSession *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_initiator = a5;
    objc_storeStrong((id *)&v14->_groupID, a4);
    objc_storeStrong((id *)&v15->_sharingIDSService, a3);
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    identifiers = v15->_identifiers;
    v15->_identifiers = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_initiatorIdentifier, a6);
    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    liveModeParticipantIdentifiers = v15->_liveModeParticipantIdentifiers;
    v15->_liveModeParticipantIdentifiers = (NSMutableSet *)v18;

    if (!v15->_initiator)
    {
      id v20 = [NSString stringWithFormat:@"com.apple.mapspushd.ETAReceiving.%@", v15->_groupID];
      [v20 UTF8String];
      uint64_t v21 = os_transaction_create();
      transaction = v15->_transaction;
      v15->_transaction = (OS_os_transaction *)v21;
    }
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[GS] group dealloc %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripGroupSession;
  [(MSPSharedTripGroupSession *)&v4 dealloc];
}

- (NSString)identifier
{
  return self->_groupID;
}

- (NSArray)accountIdentifiers
{
  v2 = [self->_sharingIDSService aliases];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (BOOL)joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  ++self->_nbClients;
  id v8 = a4;
  id v9 = a3;
  v10 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [NSNumber numberWithUnsignedInteger:self->_nbClients];
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "[GS] joinLiveMode nbClients %@", (uint8_t *)&v14, 0xCu);
  }
  BOOL v12 = [(MSPSharedTripGroupSession *)self _joinLiveModeFromHandle:v9 fromAccountID:v8 error:a5];

  return v12;
}

- (BOOL)leaveLiveModeIfNeeded:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  --self->_nbClients;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [NSNumber numberWithUnsignedInteger:self->_nbClients];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] leaveLiveModeIfNeeded nbClients %@", (uint8_t *)&v8, 0xCu);
  }
  return self->_nbClients || [(MSPSharedTripGroupSession *)self leaveLiveModeForced:a3];
}

- (BOOL)leaveLiveModeForced:(id *)a3
{
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] leaveLiveModeForced", v8, 2u);
  }

  BOOL v6 = [(MSPSharedTripGroupSession *)self _leaveLiveMode:a3];
  if (v6) {
    [(MSPSharedTripGroupSession *)self _sharingEnded];
  }
  return v6;
}

- (BOOL)_joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!self->_joined)
  {
    if (![(MSPSharedTripGroupSession *)self sendCommand:0x1F11F74D0 fromHandle:v9 fromAccountID:v10 error:a5])
    {
      BOOL v12 = 0;
      goto LABEL_7;
    }
    self->_joined = 1;
    objc_storeStrong((id *)&self->_joinedFromHandle, a3);
    objc_storeStrong((id *)&self->_joinedFromAccountIdentifier, a4);
    id v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[GS] _joinLiveMode from accountID %@", (uint8_t *)&v14, 0xCu);
    }
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (BOOL)_leaveLiveMode:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_joined)
  {
LABEL_6:
    LOBYTE(v4) = 1;
    return v4;
  }
  BOOL v4 = [(MSPSharedTripGroupSession *)self sendCommand:0x1F11F74F0 fromHandle:self->_joinedFromHandle fromAccountID:self->_joinedFromAccountIdentifier error:a3];
  if (v4)
  {
    v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      joinedFromHandle = self->_joinedFromHandle;
      int v9 = 138412290;
      id v10 = joinedFromHandle;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] _leaveLivemode from handle %@", (uint8_t *)&v9, 0xCu);
    }

    self->_joined = 0;
    uint64_t v7 = self->_joinedFromHandle;
    self->_joinedFromHandle = 0;

    goto LABEL_6;
  }
  return v4;
}

- (BOOL)inLiveMode
{
  return self->_joined;
}

- (void)addSharingWith:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] addSharingWith %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 count]) {
    [(NSMutableSet *)self->_identifiers addObjectsFromArray:v4];
  }
}

- (BOOL)sessionIsAliveAfterRemovingSharingIdentifiers:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] removeSharingWith %@", (uint8_t *)&v10, 0xCu);
  }

  if (![(NSMutableSet *)self->_identifiers count]) {
    goto LABEL_8;
  }
  if ([v4 count])
  {
    identifiers = self->_identifiers;
    id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    [(NSMutableSet *)identifiers minusSet:v7];

    if (![(NSMutableSet *)self->_identifiers count])
    {
      [(MSPSharedTripGroupSession *)self _sharingEnded];
LABEL_8:
      BOOL v8 = 0;
      goto LABEL_9;
    }
  }
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)_sharingEnded
{
}

- (void)_sharingEndedWithError:(id)a3
{
  id v4 = a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[GS] _sharingEnded", v8, 2u);
  }

  liveModeParticipantIdentifiers = self->_liveModeParticipantIdentifiers;
  self->_liveModeParticipantIdentifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained groupSessionEnded:self withError:v4];
}

- (BOOL)sendCommand:(id)a3 fromHandle:(id)a4 fromAccountID:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_initiatorIdentifier];
  id v13 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v12;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "[GS] sendCommand: %@ to destination: %@ (from account: %@, handle: %@)", buf, 0x2Au);
  }

  int v14 = self->_sharingIDSService;
  uint64_t v29 = 0x1F11F74B0;
  id v30 = v9;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v16 = *MEMORY[0x1E4F6A9B8];
  v27[0] = *MEMORY[0x1E4F6A960];
  v27[1] = v16;
  v28[0] = MEMORY[0x1E4F1CC38];
  v28[1] = v10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v18 = [(IDSService *)v14 _msp_accountFromIdentifier:v11];
  id v25 = 0;
  id v26 = 0;
  [(IDSService *)v14 sendMessage:v15 fromAccount:v18 toDestinations:v12 priority:300 options:v17 identifier:&v26 error:&v25];
  id v19 = v26;
  id v20 = v25;

  uint64_t v21 = MSPGetSharedTripLog();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v20;
      _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_ERROR, "[GS] sendCommand error: %{public}@", buf, 0xCu);
    }

    if (a6) {
      *a6 = v20;
    }
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v19;
      _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_INFO, "[GS] sent command messageUUID: %{public}@", buf, 0xCu);
    }
  }
  return v20 == 0;
}

- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 error:(id *)a5
{
  return [(MSPSharedTripGroupSession *)self sendChunkedMessage:a3 to:a4 options:0 error:a5];
}

- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v49 = a5;
  uint64_t v12 = self->_groupID;
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  v48 = self;
  sharingIDSService = self->_sharingIDSService;
  id v15 = [v11 allObjects];
  uint64_t v16 = [sharingIDSService _msp_removeSelfFrom:v15];
  v17 = [v13 setWithArray:v16];

  v50 = v17;
  if (![v17 count])
  {
    uint64_t v34 = [v11 count];
    __int16 v35 = MSPGetSharedTripLog();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        *(_WORD *)buf = 0;
        __int16 v37 = "[GS] trying to send message without destinations after removing self";
LABEL_33:
        _os_log_impl(&dword_1B87E5000, v35, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }
    }
    else if (v36)
    {
      *(_WORD *)buf = 0;
      __int16 v37 = "[GS] trying to send message without destinations";
      goto LABEL_33;
    }

    v66[0] = *MEMORY[0x1E4F28228];
    *(void *)buf = @"No contact handles provided";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v66 count:1];
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = 11;
    goto LABEL_35;
  }
  if (!v12)
  {
    id v38 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v38, OS_LOG_TYPE_ERROR, "[GS] trying to send message without a groupID", buf, 2u);
    }

    v66[0] = *MEMORY[0x1E4F28228];
    *(void *)buf = @"No IDS group ID";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v66 count:1];
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = 15;
LABEL_35:
    id v22 = [v40 errorWithDomain:@"com.apple.Maps.SharedTrip" code:v41 userInfo:v39];

    if (!a6) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  if (!v10)
  {
    v42 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v42, OS_LOG_TYPE_ERROR, "[GS] trying to send message without any message data", buf, 2u);
    }

    v66[0] = *MEMORY[0x1E4F28228];
    *(void *)buf = @"No data for IDS message";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v66 count:1];
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = 16;
    goto LABEL_35;
  }
  v44 = a6;
  id v45 = v11;
  unint64_t v18 = [v10 length];
  unint64_t v53 = (v18 - 1) / 0x2710 + 1;
  id v19 = [MEMORY[0x1E4F29128] UUID];
  v51 = [v19 UUIDString];

  if ((v18 - 1) >> 4 >= 0x271)
  {
    id v20 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219011;
      *(double *)&uint8_t buf[4] = (float)((float)v18 * 0.00097656);
      __int16 v58 = 2048;
      unint64_t v59 = (v18 - 1) / 0x2710 + 1;
      __int16 v60 = 2048;
      uint64_t v61 = 0x4023880000000000;
      __int16 v62 = 2113;
      double v63 = *(double *)&v50;
      __int16 v64 = 2114;
      id v65 = v49;
      _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_INFO, "[GS] will send %#.3lfkB message in %lu chunks (up to %#.1lfkB each)\n\tdestinations: %{private}@\n\toptions: %{public}@", buf, 0x34u);
    }
  }
  uint64_t v21 = 0;
  id v22 = 0;
  uint64_t v23 = 0;
  uint64_t v47 = *MEMORY[0x1E4F28228];
  v46 = v12;
  do
  {
    if (v18 >= 0x2710) {
      uint64_t v24 = 10000;
    }
    else {
      uint64_t v24 = v18;
    }
    id v25 = objc_msgSend(v10, "subdataWithRange:", v21, v24);
    if (v25)
    {
      v52 = v22;
      v55[0] = 0x1F11F7410;
      id v26 = [NSNumber numberWithUnsignedInteger:v53];
      v56[0] = v26;
      v55[1] = 0x1F11F7430;
      v27 = [NSNumber numberWithUnsignedInteger:v23];
      v56[1] = v27;
      v56[2] = v25;
      v55[2] = 0x1F11F7490;
      v55[3] = 0x1F11F7470;
      v55[4] = 0x1F11F7450;
      v56[3] = v12;
      v56[4] = v51;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:5];

      uint64_t v29 = [v28 plistData];
      id v30 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        unint64_t v31 = [v29 length];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v23 + 1;
        uint64_t v12 = v46;
        __int16 v58 = 2048;
        unint64_t v59 = v53;
        __int16 v60 = 2114;
        uint64_t v61 = (uint64_t)v51;
        __int16 v62 = 2048;
        double v63 = (float)((float)v31 * 0.00097656);
        _os_log_impl(&dword_1B87E5000, v30, OS_LOG_TYPE_INFO, "[GS] - chunked-message %lu/%lu: UUID: %{public}@ data length %.3fkB", buf, 0x2Au);
      }

      id v54 = v52;
      [(MSPSharedTripGroupSession *)v48 _sendChunkMessage:v29 to:v50 packet:v28 options:v49 error:&v54];
      id v22 = v54;
    }
    else
    {
      v28 = v22;
      id v32 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1B87E5000, v32, OS_LOG_TYPE_ERROR, "[GS] - trying to send message chunk %lu without any packet data", buf, 0xCu);
      }

      v66[0] = v47;
      *(void *)buf = @"No data for IDS message";
      __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v66 count:1];
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:16 userInfo:v33];
    }
    ++v23;
    v21 += 10000;
    v18 -= 10000;
  }
  while (v53 != v23);

  a6 = v44;
  id v11 = v45;
  if (v44)
  {
LABEL_36:
    if (v22) {
      *a6 = v22;
    }
  }
LABEL_38:

  return v22 == 0;
}

- (BOOL)_sendChunkMessage:(id)a3 to:(id)a4 packet:(id)a5 options:(id)a6 error:(id *)a7
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_sendChunkMessage", (const char *)&unk_1B8876199, buf, 2u);
  }

  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F6AB90], "_msp_IDSIdentifierFor:", self->_initiatorIdentifier);
  if (v16)
  {
    if (v14) {
      v17 = (void *)[v14 mutableCopy];
    }
    else {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    }
    id v22 = v17;
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A960]];
    [v22 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F6A9B8]];
    uint64_t v23 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F6A9F0]];
      id v25 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F6A9F8]];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v24;
      __int16 v35 = 2112;
      id v36 = v25;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v12;
      _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_INFO, "[GS] sendChunkMessage (requiring %@, lacking %@, packet %@, destinations %@)", buf, 0x2Au);
    }
    id v26 = self->_sharingIDSService;
    v27 = [(IDSService *)v26 _msp_currentAccount];
    id v32 = 0;
    id v33 = 0;
    [(IDSService *)v26 sendData:v31 fromAccount:v27 toDestinations:v12 priority:300 options:v22 identifier:&v33 error:&v32];
    id v21 = v33;
    id v20 = v32;
  }
  else
  {
    unint64_t v18 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_ERROR, "[GS] sendChunkMessage failing on invalid account (packet: %@, destinations %@)", buf, 0x16u);
    }

    v41[0] = *MEMORY[0x1E4F28228];
    *(void *)buf = @"Invalid account for sharing";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v41 count:1];
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:5 userInfo:v19];

    id v21 = 0;
  }
  v28 = MSPGetSharedTripLog();
  uint64_t v29 = v28;
  if (v20)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_ERROR, "[GS] sendChunkMessage error: %{public}@", buf, 0xCu);
    }

    if (a7) {
      *a7 = v20;
    }
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_INFO, "[GS] sent chunk messageUUID: %{public}@", buf, 0xCu);
    }
  }
  return v20 == 0;
}

- (id)_currentRoutePath
{
  v2 = +[MSPMapsPaths mapsApplicationContainerPaths];
  v3 = [v2 cacheDirectory];

  id v4 = [NSString stringWithFormat:@"route.data"];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (BOOL)_isValidParticipant:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@":"];
  int v6 = [v5 lastObject];
  id v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    identifiers = self->_identifiers;
    *(_DWORD *)buf = 138412802;
    id v26 = v4;
    __int16 v27 = 2112;
    v28 = v6;
    __int16 v29 = 2112;
    id v30 = identifiers;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[GS] _validParticipant %@ -> %@ in %@", buf, 0x20u);
  }

  if ([v6 length])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = (void *)[(NSMutableSet *)self->_identifiers copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v19 = v5;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) componentsSeparatedByString:@":"];
          id v15 = [v14 lastObject];
          char v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            BOOL v17 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      BOOL v17 = 0;
LABEL_14:
      v5 = v19;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)participantDidJoin:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"/"];
  int v6 = [v5 lastObject];
  if ([(MSPSharedTripGroupSession *)self _isValidParticipant:v6])
  {
    int v7 = [(NSMutableSet *)self->_liveModeParticipantIdentifiers containsObject:v4];
    BOOL v8 = MSPGetSharedTripLog();
    id WeakRetained = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        uint64_t v10 = "[GS] participant already present %@";
LABEL_7:
        _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[GS] participantDidJoin %@", (uint8_t *)&v11, 0xCu);
      }

      [(NSMutableSet *)self->_liveModeParticipantIdentifiers addObject:v4];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained groupSession:self participantDidJoin:v4];
    }
  }
  else
  {
    id WeakRetained = MSPGetSharedTripLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      uint64_t v10 = "[GS] participantDidJoin discard invalid %@";
      goto LABEL_7;
    }
  }
}

- (void)participantDidLeave:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"/"];
  int v6 = [v5 lastObject];
  if (![(MSPSharedTripGroupSession *)self _isValidParticipant:v6])
  {
    id WeakRetained = MSPGetSharedTripLog();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v11 = 138412290;
    id v12 = v6;
    uint64_t v10 = "[GS] participantDidLeave discard invalid %@";
LABEL_10:
    _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_11;
  }
  char v7 = [(NSMutableSet *)self->_liveModeParticipantIdentifiers containsObject:v4];
  BOOL v8 = MSPGetSharedTripLog();
  id WeakRetained = v8;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v11 = 138412290;
    id v12 = v4;
    uint64_t v10 = "[GS] participant not present %@";
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[GS] participantDidLeave %@", (uint8_t *)&v11, 0xCu);
  }

  [(NSMutableSet *)self->_liveModeParticipantIdentifiers removeObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained groupSession:self participantDidLeave:v4];
LABEL_11:
}

- (NSString)initiatorIdentifier
{
  return self->_initiatorIdentifier;
}

- (NSString)initiatorDisplayName
{
  return self->_initiatorDisplayName;
}

- (void)setInitiatorDisplayName:(id)a3
{
}

- (MSPSharedTripGroupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSharedTripGroupSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initiatorDisplayName, 0);
  objc_storeStrong((id *)&self->_initiatorIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_sharingIDSService, 0);
  objc_storeStrong((id *)&self->_liveModeParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_joinedFromAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_joinedFromHandle, 0);
}

@end