@interface HDIDSMessageCenter
+ (id)createPersistentDictionaryWithURL:(id)a3;
- (HDIDSMessageCenter)initWithIDSServiceIdentifier:(id)a3 persistentDictionary:(id)a4 queue:(id)a5 daemon:(id)a6;
- (HDIDSMessageCenterDelegate)delegate;
- (IDSService)idsService;
- (NSString)serviceIdentifier;
- (id)_pbMappingForMessageID:(uint64_t)a1;
- (id)deviceForFromID:(id)a3;
- (id)nanoSyncDevices;
- (void)_handleError:(void *)a3 context:;
- (void)_logPrefix;
- (void)_updateExpireTimerWithTimestamp:(uint64_t)a1;
- (void)addErrorHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)addRequestHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)addResponseHandler:(SEL)a3 forMessageID:(unsigned __int16)a4;
- (void)cancelPendingRequestsWithMessageID:(unsigned __int16)a3 device:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5;
- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4;
- (void)resume;
- (void)sendRequest:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation HDIDSMessageCenter

- (id)nanoSyncDevices
{
  v2 = [(HDIDSMessageCenter *)self idsService];
  v3 = [v2 devices];

  return v3;
}

- (IDSService)idsService
{
  return self->_service;
}

- (void)sendRequest:(id)a3
{
  id v5 = a3;
  v6 = [v5 toParticipant];

  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 319, @"Invalid parameter not satisfying: %@", @"request.toParticipant != nil" object file lineNumber description];
  }
  v7 = [v5 idsIdentifier];

  if (v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HDIDSMessageCenter.m" lineNumber:320 description:@"You cannot call sendRequest twice for the same request object"];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HDIDSMessageCenter_sendRequest___block_invoke;
  block[3] = &unk_1E62F4978;
  id v13 = v5;
  SEL v14 = a2;
  block[4] = self;
  id v9 = v5;
  dispatch_async(queue, block);
}

void __34__HDIDSMessageCenter_sendRequest___block_invoke(uint64_t a1)
{
  v91[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  if (v1) {
    return;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    v66 = *(const char **)(a1 + 48);
    uint64_t v67 = *(void *)(a1 + 32);
    v68 = NSStringFromSelector(v66);
    [v65 handleFailureInMethod:v66, v67, @"HDIDSMessageCenter.m", 326, @"Cannot use %@ until -resume is used", v68 object file lineNumber description];
  }
  __int16 v74 = [*(id *)(a1 + 40) messageID];
  char v75 = [*(id *)(a1 + 40) priority];
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v4 = [*(id *)(a1 + 40) data];
  id v5 = objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 3);

  [v5 appendBytes:&v74 length:3];
  v6 = [*(id *)(a1 + 40) data];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [*(id *)(a1 + 40) data];
    [v5 appendData:v8];
  }
  unint64_t v9 = [*(id *)(a1 + 40) priority];
  if (v9 > 2) {
    uint64_t v10 = 200;
  }
  else {
    uint64_t v10 = qword_1BD340958[v9];
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 40) sendTimeout];
  if (v12 > 0.0)
  {
    id v13 = NSNumber;
    [*(id *)(a1 + 40) sendTimeout];
    SEL v14 = objc_msgSend(v13, "numberWithDouble:");
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
  }
  if ([*(id *)(a1 + 40) doNotCompress]) {
    [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F6A980]];
  }
  if ([*(id *)(a1 + 40) forceLocalDelivery]) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9B0]];
  }
  if ([*(id *)(a1 + 40) queueOnly1])
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%hu", objc_msgSend(*(id *)(a1 + 40), "messageID"));
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6A9E8]];
  }
  v16 = *(void **)(*(void *)(a1 + 32) + 64);
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  v18 = [v16 objectForKey:v17];

  v19 = *(void **)(*(void *)(a1 + 32) + 56);
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  *(void *)&long long v70 = [v19 objectForKey:v20];

  *((void *)&v70 + 1) = v18;
  if (v18) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A998]];
  }
  if ([*(id *)(a1 + 40) nonWaking]) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9D0]];
  }
  v21 = [*(id *)(a1 + 40) toParticipant];
  v22 = [v21 destinationIdentifier];

  v23 = [*(id *)(a1 + 40) toParticipant];
  id newValue = [v23 deviceIdentifier];

  if (v22)
  {
    v24 = *(void **)(*(void *)(a1 + 32) + 40);
    v25 = [MEMORY[0x1E4F1CAD0] setWithObject:v22];
    id v72 = 0;
    id v73 = 0;
    LOBYTE(v24) = [v24 sendData:v5 toDestinations:v25 priority:v10 options:v11 identifier:&v73 error:&v72];
    id v26 = v73;
    id v27 = v72;

    if (v24)
    {
      v28 = v5;
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(void **)(a1 + 32);
        v31 = v29;
        v32 = -[HDIDSMessageCenter _logPrefix](v30);
        LODWORD(v30) = [*(id *)(a1 + 40) messageID];
        HDStringFromHDIDSPriority([*(id *)(a1 + 40) priority]);
        v34 = id v33 = v27;
        uint64_t v35 = [v28 length];
        *(_DWORD *)buf = 138544642;
        v77 = v32;
        __int16 v78 = 2114;
        id v79 = v26;
        __int16 v80 = 1024;
        int v81 = (int)v30;
        __int16 v82 = 2114;
        v83 = v34;
        __int16 v84 = 2114;
        v85 = v22;
        __int16 v86 = 2048;
        uint64_t v87 = v35;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ outgoing request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes)", buf, 0x3Au);

        id v27 = v33;
      }
      char v36 = 1;
      goto LABEL_30;
    }
  }
  else
  {
    v37 = NSString;
    v38 = [*(id *)(a1 + 40) toParticipant];
    v39 = [v38 description];
    v40 = [v37 stringWithFormat:@"missing destination device identifer for %@", v39];

    uint64_t v90 = *MEMORY[0x1E4F28568];
    v91[0] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HDIDSErrorDomain" code:3 userInfo:v41];

    id v26 = 0;
  }
  _HKInitializeLogging();
  v42 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v60 = *(void **)(a1 + 32);
    log = v42;
    v61 = -[HDIDSMessageCenter _logPrefix](v60);
    int v62 = [*(id *)(a1 + 40) messageID];
    v63 = HDStringFromHDIDSPriority([*(id *)(a1 + 40) priority]);
    v28 = v5;
    uint64_t v64 = [v5 length];
    *(_DWORD *)buf = 138544898;
    v77 = v61;
    __int16 v78 = 2114;
    id v79 = v26;
    __int16 v80 = 1024;
    int v81 = v62;
    __int16 v82 = 2114;
    v83 = v63;
    __int16 v84 = 2114;
    v85 = v22;
    __int16 v86 = 2048;
    uint64_t v87 = v64;
    __int16 v88 = 2114;
    id v89 = v27;
    _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "%{public}@ outgoing request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes) error: %{public}@", buf, 0x44u);
  }
  else
  {
    v28 = v5;
  }
  char v36 = 0;
LABEL_30:
  v43 = v27;
  v44 = objc_alloc_init(HDIDSMessagePersistentContext);
  unsigned __int16 v45 = [*(id *)(a1 + 40) messageID];
  if (v44)
  {
    v44->_messageID = v45;
    objc_setProperty_nonatomic_copy(v44, v46, v26, 16);
    objc_setProperty_nonatomic_copy(v44, v47, newValue, 24);
    v48 = [*(id *)(a1 + 40) persistentUserInfo];
    objc_storeStrong((id *)&v44->_userInfo, v48);

    v49 = [MEMORY[0x1E4F1C9C8] date];
    objc_storeStrong((id *)&v44->_date, v49);

    v44->_fromRequest = 1;
  }
  else
  {
    [*(id *)(a1 + 40) persistentUserInfo];

    [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v50 = *(void *)(a1 + 40);
  if (v50)
  {
    objc_storeWeak((id *)(v50 + 72), *(id *)(a1 + 32));
    v52 = *(void **)(a1 + 40);
    if (v52) {
      objc_setProperty_nonatomic_copy(v52, v51, v26, 32);
    }
  }
  if (v26)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    char v54 = objc_opt_respondsToSelector();

    if (v54)
    {
      id v55 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
      [v55 messageCenter:*(void *)(a1 + 32) didResolveIDSIdentifierForRequest:*(void *)(a1 + 40)];
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "didSendRequest:deviceID:type:length:", v26, newValue, objc_msgSend(*(id *)(a1 + 40), "messageID"), objc_msgSend(v28, "length"));
    if (v36)
    {
      if (v70 != 0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [*(id *)(a1 + 40) responseTimeout];
        if (v57 <= 0.0) {
          double v58 = 3600.0;
        }
        else {
          [*(id *)(a1 + 40) responseTimeout];
        }
        double v59 = Current + v58;
        [*(id *)(*(void *)(a1 + 32) + 80) setObject:v44 forKey:v26 expires:v59];
        -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(void *)(a1 + 32), v59);
      }
    }
    else
    {
      -[HDIDSMessageCenter _handleError:context:](*(void *)(a1 + 32), v43, v44);
      [*(id *)(*(void *)(a1 + 32) + 80) didReceiveError:v43 forMessageID:v26];
    }
  }
  else if ((v36 & 1) == 0)
  {
    -[HDIDSMessageCenter _handleError:context:](*(void *)(a1 + 32), v43, v44);
  }
}

- (void)_logPrefix
{
  unsigned __int8 v1 = a1;
  if (a1)
  {
    v2 = NSString;
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    unsigned __int8 v1 = [v2 stringWithFormat:@"%@: \"%@\"", v4, v1[3]];
  }

  return v1;
}

- (void)_updateExpireTimerWithTimestamp:(uint64_t)a1
{
  if (a1)
  {
    double v4 = *(double *)(a1 + 88);
    if (v4 == 0.0 || v4 > a2)
    {
      double v6 = a2 - CFAbsoluteTimeGetCurrent();
      double v7 = v6 * 1000000000.0;
      v8 = *(NSObject **)(a1 + 96);
      BOOL v9 = v6 < 0.0;
      double v10 = 0.0;
      if (!v9) {
        double v10 = v7;
      }
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)v10);
      dispatch_source_set_timer(v8, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      *(double *)(a1 + 88) = a2;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v17 = a5;
  id v10 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(HDIDSPersistentDictionary *)self->_persistentContextStore objectForKey:v17];
    id v13 = (void *)v12;
    if (v12)
    {
      if (a6)
      {
        if (!*(unsigned char *)(v12 + 8)
          || (responseHandlers = self->_responseHandlers,
              [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v12 + 10)],
              v15 = objc_claimAutoreleasedReturnValue(),
              [(NSMutableDictionary *)responseHandlers objectForKey:v15],
              v16 = objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              !v16))
        {
          [(HDIDSPersistentDictionary *)self->_persistentContextStore removeObjectForKey:v17];
        }
        [(HDIDSPersistentDictionary *)self->_persistentContextStore didFinishSending:v13[2]];
      }
      else
      {
        if (!v10)
        {
          id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HDIDSErrorDomain" code:3 userInfo:0];
        }
        [(HDIDSPersistentDictionary *)self->_persistentContextStore didReceiveError:v10 forMessageID:v13[2]];
        -[HDIDSMessageCenter _handleError:context:]((uint64_t)self, v10, v13);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  queue = self->_queue;
  v16 = (IDSService *)a3;
  dispatch_assert_queue_V2(queue);
  service = self->_service;

  if (service == v16)
  {
    v18 = [(HDIDSMessageCenter *)self deviceForFromID:v13];
    v19 = [HDIDSParticipant alloc];
    if (v18) {
      v20 = [(HDIDSParticipant *)v19 initWithDevice:v18];
    }
    else {
      v20 = [(HDIDSParticipant *)v19 initWithIdentifier:v13];
    }
    v21 = v20;
    v22 = [(HDIDSParticipant *)v20 deviceIdentifier];
    v23 = [v14 incomingResponseIdentifier];

    unint64_t v24 = [v12 length];
    if (v23)
    {
      if (v24 >= 2)
      {
        v25 = v12;
        id v26 = v18;
        v131 = v22;
        v124 = v21;
        v119 = v25;
        id v27 = v25;
        unsigned int v120 = *(unsigned __int16 *)[v27 bytes];
        v28 = objc_msgSend(v27, "subdataWithRange:", 2, objc_msgSend(v27, "length") - 2);
        persistentContextStore = self->_persistentContextStore;
        v30 = [v14 incomingResponseIdentifier];
        uint64_t v31 = [(HDIDSPersistentDictionary *)persistentContextStore objectForKey:v30];

        _HKInitializeLogging();
        v32 = (id)*MEMORY[0x1E4F29FA8];
        uint64_t v126 = v31;
        id obj = v28;
        v122 = v26;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = -[HDIDSMessageCenter _logPrefix](self);
          v34 = [v14 incomingResponseIdentifier];
          if (v31) {
            uint64_t v35 = *(void **)(v31 + 16);
          }
          else {
            uint64_t v35 = 0;
          }
          id v36 = v35;
          *(_DWORD *)buf = 138544642;
          v135 = v33;
          __int16 v136 = 2114;
          *(void *)v137 = v34;
          *(_WORD *)&v137[8] = 2114;
          *(void *)&v137[10] = v35;
          *(_WORD *)&v137[18] = 1024;
          *(_DWORD *)&v137[20] = v120;
          __int16 v138 = 2114;
          id v139 = v13;
          __int16 v140 = 2048;
          uint64_t v141 = [v27 length];
          _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming response %{public}@ to request %{public}@ messageID:%u from %{public}@ (%tu bytes)", buf, 0x3Au);

          uint64_t v31 = v126;
          v28 = obj;
        }

        if (v31)
        {
          v37 = self->_persistentContextStore;
          v38 = [v14 outgoingResponseIdentifier];
          id v39 = *(id *)(v126 + 16);
          uint64_t v40 = [v27 length];
          v22 = v131;
          [(HDIDSPersistentDictionary *)v37 didReceiveResponse:v38 toRequest:v39 deviceID:v131 type:v120 length:v40];

          v41 = self->_persistentContextStore;
          v42 = [v14 incomingResponseIdentifier];
          [(HDIDSPersistentDictionary *)v41 removeObjectForKey:v42];

          v21 = v124;
          uint64_t v43 = v126;
          if (*(unsigned __int16 *)(v126 + 10) != v120)
          {
            _HKInitializeLogging();
            v44 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v106 = v44;
              v107 = -[HDIDSMessageCenter _logPrefix](self);
              int v108 = *(unsigned __int16 *)(v126 + 10);
              v109 = [v14 incomingResponseIdentifier];
              *(_DWORD *)buf = 138544130;
              v135 = v107;
              __int16 v136 = 1024;
              *(_DWORD *)v137 = v120;
              *(_WORD *)&v137[4] = 1024;
              *(_DWORD *)&v137[6] = v108;
              *(_WORD *)&v137[10] = 2114;
              *(void *)&v137[12] = v109;
              _os_log_error_impl(&dword_1BCB7D000, v106, OS_LOG_TYPE_ERROR, "%{public}@ unexpected message ID (%u != %u) for message %{public}@", buf, 0x22u);

              v22 = v131;
              uint64_t v43 = v126;
            }
          }
          id v12 = v119;
          if (!*(unsigned char *)(v43 + 8))
          {
            _HKInitializeLogging();
            unsigned __int16 v45 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v110 = v45;
              v111 = -[HDIDSMessageCenter _logPrefix](self);
              uint64_t v112 = *(void *)(v126 + 16);
              *(_DWORD *)buf = 138543618;
              v135 = v111;
              __int16 v136 = 2114;
              *(void *)v137 = v112;
              _os_log_error_impl(&dword_1BCB7D000, v110, OS_LOG_TYPE_ERROR, "%{public}@ unexpected response %{public}@", buf, 0x16u);

              uint64_t v43 = v126;
            }
          }
          responseHandlers = self->_responseHandlers;
          SEL v47 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v43 + 10)];
          v48 = [(NSMutableDictionary *)responseHandlers objectForKey:v47];

          v18 = v122;
          if (v48)
          {
            SEL aSelector = 0;
            v49 = v48;
            [v48 getValue:&aSelector];
            uint64_t v50 = objc_alloc_init(HDIDSIncomingResponse);
            v51 = v50;
            v52 = (id *)v126;
            if (v50)
            {
              objc_storeWeak((id *)&v50->_messageCenter, self);
              objc_storeStrong((id *)&v51->_fromParticipant, v124);
              v51->_messageID = *(_WORD *)(v126 + 10);
              objc_storeStrong((id *)&v51->_data, obj);
            }
            uint64_t v53 = -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)self, *(unsigned __int16 *)(v126 + 10));
            char v54 = (void *)v53;
            if (v53)
            {
              id v55 = *(objc_class **)(v53 + 16);
              if (v55)
              {
                v56 = (void *)[[v55 alloc] initWithData:obj];
                id v57 = v56;
                if (v51) {
                  objc_storeStrong((id *)&v51->_pbResponse, v56);
                }

                v52 = (id *)v126;
              }
            }
            double v58 = [v14 outgoingResponseIdentifier];
            v60 = v58;
            if (v51)
            {
              objc_setProperty_nonatomic_copy(v51, v59, v58, 32);

              objc_setProperty_nonatomic_copy(v51, v61, v52[2], 40);
              objc_storeStrong((id *)&v51->_requestSent, v52[5]);
              objc_storeStrong((id *)&v51->_requestPersistentUserInfo, v52[4]);
            }
            else
            {
            }
            _HKInitializeLogging();
            int v62 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
            {
              log = v62;
              v117 = -[HDIDSMessageCenter _logPrefix](self);
              v99 = [v14 outgoingResponseIdentifier];
              v100 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138413058;
              v135 = v117;
              __int16 v136 = 2112;
              *(void *)v137 = v99;
              *(_WORD *)&v137[8] = 1024;
              *(_DWORD *)&v137[10] = v120;
              *(_WORD *)&v137[14] = 2112;
              *(void *)&v137[16] = v100;
              _os_log_debug_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_DEBUG, "%@ dispatching incoming response %@ with message id %u to '%@'", buf, 0x26u);

              v18 = v122;
              v52 = (id *)v126;
            }
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained performSelector:aSelector withObject:v51];

            v21 = v124;
            v22 = v131;
          }
          else
          {
            v49 = 0;
            _HKInitializeLogging();
            v94 = (void *)*MEMORY[0x1E4F29FA8];
            v52 = (id *)v126;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v113 = v94;
              v114 = -[HDIDSMessageCenter _logPrefix](self);
              *(_DWORD *)buf = 138543618;
              v135 = v114;
              __int16 v136 = 1024;
              *(_DWORD *)v137 = v120;
              _os_log_error_impl(&dword_1BCB7D000, v113, OS_LOG_TYPE_ERROR, "%{public}@ no registered response handler for message: %hu", buf, 0x12u);

              v52 = (id *)v126;
            }
          }

          v28 = obj;
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v90 = (void *)*MEMORY[0x1E4F29FA8];
          v21 = v124;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v91 = v90;
            v92 = -[HDIDSMessageCenter _logPrefix](self);
            v93 = [v14 incomingResponseIdentifier];
            *(_DWORD *)buf = 138543874;
            v135 = v92;
            __int16 v136 = 1024;
            *(_DWORD *)v137 = v120;
            *(_WORD *)&v137[4] = 2114;
            *(void *)&v137[6] = v93;
            _os_log_impl(&dword_1BCB7D000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find context for message: %hu identifier %{public}@", buf, 0x1Cu);
          }
          v52 = 0;
          v22 = v131;
          v18 = v26;
          id v12 = v119;
        }
LABEL_55:
      }
    }
    else if (v24 >= 3)
    {
      v132 = v22;
      id v64 = v12;
      v65 = (unsigned __int16 *)[v64 bytes];
      unsigned int v121 = *v65;
      unint64_t v127 = *((unsigned __int8 *)v65 + 2);
      _HKInitializeLogging();
      v66 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = v66;
        v68 = -[HDIDSMessageCenter _logPrefix](self);
        [v14 outgoingResponseIdentifier];
        v69 = v123 = v18;
        HDStringFromHDIDSPriority(v127);
        long long v70 = v125 = v21;
        *(_DWORD *)buf = 138544642;
        v135 = v68;
        __int16 v136 = 2114;
        *(void *)v137 = v69;
        *(_WORD *)&v137[8] = 1024;
        *(_DWORD *)&v137[10] = v121;
        *(_WORD *)&v137[14] = 2114;
        *(void *)&v137[16] = v70;
        __int16 v138 = 2114;
        id v139 = v13;
        __int16 v140 = 2048;
        uint64_t v141 = [v64 length];
        _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming request %{public}@ messageID:%u pri:%{public}@ from %{public}@ (%tu bytes)", buf, 0x3Au);

        v18 = v123;
        v21 = v125;
      }
      v71 = self->_persistentContextStore;
      id v72 = [v14 outgoingResponseIdentifier];
      -[HDIDSPersistentDictionary didReceiveRequest:deviceID:type:length:](v71, "didReceiveRequest:deviceID:type:length:", v72, v132, v121, [v64 length]);

      id v73 = objc_alloc_init(HDIDSIncomingRequest);
      __int16 v74 = v73;
      if (v73)
      {
        objc_storeWeak((id *)&v73->_messageCenter, self);
        objc_storeStrong((id *)&v74->_fromParticipant, v21);
        v74->_messageID = v121;
      }
      obja = v74;
      if ([v14 expectsPeerResponse])
      {
        char v75 = [v14 outgoingResponseIdentifier];

        if (!v75)
        {
          v76 = [MEMORY[0x1E4F28B00] currentHandler];
          [v76 handleFailureInMethod:a2 object:self file:@"HDIDSMessageCenter.m" lineNumber:684 description:@"*** IDS BUG! idsContext must have an outgoingResponseIdentifier or expectsPeerResponse must be false."];
        }
      }
      v77 = [v14 outgoingResponseIdentifier];
      id v79 = v77;
      v28 = obja;
      if (obja)
      {
        objc_setProperty_nonatomic_copy(obja, v78, v77, 32);

        obja->_priority = v127;
        obja->_expectsResponse = [v14 expectsPeerResponse];
      }
      else
      {

        [v14 expectsPeerResponse];
      }
      response = objc_msgSend(v64, "subdataWithRange:", 3, objc_msgSend(v64, "length") - 3);
      if (obja)
      {
        objc_storeStrong((id *)&obja->_data, response);

        int v81 = objc_alloc_init(HDIDSOutgoingResponse);
        __int16 v82 = v81;
        v22 = v132;
        if (v81)
        {
          v81->_messageID = obja->_messageID;
          [(HDIDSOutgoingResponse *)v81 setPriority:obja->_priority];
          objc_storeStrong((id *)&v82->_toParticipant, obja->_fromParticipant);
          objc_setProperty_nonatomic_copy(v82, v83, obja->_idsIdentifier, 48);
          id v84 = objc_loadWeakRetained((id *)&obja->_messageCenter);
          objc_storeStrong((id *)&v82->_messageCenter, v84);

          v82->_requestMessageID = obja->_messageID;
        }
        else
        {
          [0 setPriority:obja->_priority];
        }
        response = obja->_response;
        obja->_response = v82;
      }
      else
      {
        v22 = v132;
      }

      requestHandlers = self->_requestHandlers;
      __int16 v86 = [NSNumber numberWithUnsignedShort:v121];
      uint64_t v87 = [(NSMutableDictionary *)requestHandlers objectForKeyedSubscript:v86];

      if (v87)
      {
        v52 = v87;
        SEL aSelector = 0;
        [v87 getValue:&aSelector];
        _HKInitializeLogging();
        __int16 v88 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          v101 = v88;
          -[HDIDSMessageCenter _logPrefix](self);
          v102 = v128 = v52;
          v103 = [v14 outgoingResponseIdentifier];
          NSStringFromSelector(aSelector);
          v105 = v104 = v18;
          *(_DWORD *)buf = 138413058;
          v135 = v102;
          __int16 v136 = 2112;
          *(void *)v137 = v103;
          *(_WORD *)&v137[8] = 1024;
          *(_DWORD *)&v137[10] = v121;
          *(_WORD *)&v137[14] = 2112;
          *(void *)&v137[16] = v105;
          _os_log_debug_impl(&dword_1BCB7D000, v101, OS_LOG_TYPE_DEBUG, "%@ dispatching incoming request %@ with message id %u to '%@'", buf, 0x26u);

          v22 = v132;
          v18 = v104;
          v28 = obja;

          v52 = v128;
        }
        id v89 = objc_loadWeakRetained((id *)&self->_delegate);
        [v89 performSelector:aSelector withObject:v28];
      }
      else
      {
        id v95 = objc_loadWeakRetained((id *)&self->_delegate);
        char v96 = objc_opt_respondsToSelector();

        if (v96)
        {
          id v97 = objc_loadWeakRetained((id *)&self->_delegate);
          [v97 messageCenter:self didReceiveUnknownRequest:obja];

          v52 = 0;
          v22 = v132;
        }
        else
        {
          if (obja) {
            obja->_expectsResponse = 0;
          }
          _HKInitializeLogging();
          v98 = (void *)*MEMORY[0x1E4F29FA8];
          v22 = v132;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v115 = v98;
            v116 = -[HDIDSMessageCenter _logPrefix](self);
            *(_DWORD *)buf = 138543618;
            v135 = v116;
            __int16 v136 = 1024;
            *(_DWORD *)v137 = v121;
            _os_log_error_impl(&dword_1BCB7D000, v115, OS_LOG_TYPE_ERROR, "%{public}@ received a message of type %u for which no request handler was registered.", buf, 0x12u);
          }
          v52 = 0;
        }
      }
      goto LABEL_55;
    }
  }
}

- (id)deviceForFromID:(id)a3
{
  id v4 = a3;
  id v5 = [(HDIDSMessageCenter *)self idsService];
  double v6 = [v5 deviceForFromID:v4];

  if (!v6)
  {
    double v7 = [(HDIDSMessageCenter *)self idsService];
    double v6 = [v7 linkedDeviceForFromID:v4 withRelationship:2];
  }

  return v6;
}

- (id)_pbMappingForMessageID:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    v3 = [NSNumber numberWithUnsignedShort:a2];
    id v4 = [v2 objectForKeyedSubscript:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __36__HDIDSMessageCenter__sendResponse___block_invoke(uint64_t a1)
{
  v102[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  if ((v1 & 1) == 0)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 40))
    {
      id v73 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v74 = *(const char **)(a1 + 56);
      uint64_t v75 = *(void *)(a1 + 32);
      v76 = NSStringFromSelector(v74);
      [v73 handleFailureInMethod:v74, v75, @"HDIDSMessageCenter.m", 435, @"Cannot use %@ until -resume is used", v76 object file lineNumber description];
    }
    __int16 v84 = *(_WORD *)(a1 + 64);
    v3 = (void *)MEMORY[0x1E4F1CA58];
    id v4 = [*(id *)(a1 + 40) data];
    id v5 = objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 2);

    [v5 appendBytes:&v84 length:2];
    double v6 = [*(id *)(a1 + 40) data];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [*(id *)(a1 + 40) data];
      [v5 appendData:v8];
    }
    unint64_t v9 = [*(id *)(a1 + 40) priority];
    if (v9 > 2) {
      uint64_t v10 = 200;
    }
    else {
      uint64_t v10 = qword_1BD340958[v9];
    }
    unsigned __int8 v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 40) sendTimeout];
    if (v12 > 0.0)
    {
      id v13 = NSNumber;
      [*(id *)(a1 + 40) sendTimeout];
      id v14 = objc_msgSend(v13, "numberWithDouble:");
      [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
    }
    [v11 setObject:*(void *)(a1 + 48) forKeyedSubscript:*MEMORY[0x1E4F6A9D8]];
    if ([*(id *)(a1 + 40) doNotCompress]) {
      [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F6A980]];
    }
    if ([*(id *)(a1 + 40) forceLocalDelivery]) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9B0]];
    }
    v15 = *(void **)(*(void *)(a1 + 32) + 56);
    v16 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 64)];
    __int16 v80 = [v15 objectForKey:v16];

    id v17 = [*(id *)(a1 + 40) toParticipant];
    v18 = [v17 destinationIdentifier];

    v19 = [*(id *)(a1 + 40) toParticipant];
    v20 = [v19 deviceIdentifier];

    int v81 = v5;
    if (v18)
    {
      v21 = *(void **)(*(void *)(a1 + 32) + 40);
      v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
      id v82 = 0;
      id v83 = 0;
      char v23 = [v21 sendData:v5 toDestinations:v22 priority:v10 options:v11 identifier:&v83 error:&v82];
      id v24 = v83;
      id v25 = v82;

      if (v23)
      {
        _HKInitializeLogging();
        id v26 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(a1 + 32);
          v29 = v26;
          v30 = -[HDIDSMessageCenter _logPrefix](v28);
          int v31 = *(unsigned __int16 *)(a1 + 64);
          v32 = v11;
          id v33 = v18;
          id v34 = v25;
          uint64_t v35 = *(void *)(a1 + 48);
          HDStringFromHDIDSPriority([*(id *)(a1 + 40) priority]);
          id v36 = loga = v20;
          uint64_t v37 = [v81 length];
          *(_DWORD *)buf = 138544898;
          __int16 v86 = v30;
          __int16 v87 = 2114;
          id v88 = v24;
          __int16 v89 = 2114;
          uint64_t v90 = v35;
          id v25 = v34;
          v18 = v33;
          unsigned __int8 v11 = v32;
          __int16 v91 = 1024;
          int v92 = v31;
          __int16 v93 = 2114;
          v94 = v36;
          __int16 v95 = 2114;
          char v96 = v18;
          __int16 v97 = 2048;
          uint64_t v98 = v37;
          _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ outgoing response %{public}@ to request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes)", buf, 0x44u);

          v20 = loga;
        }
        char v38 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      id v39 = [NSString stringWithFormat:@"missing device identifer in request %@", *(void *)(a1 + 48)];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v102[0] = v39;
      uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
      id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HDIDSErrorDomain" code:3 userInfo:v40];

      id v24 = 0;
    }
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v66 = *(void **)(a1 + 32);
      logb = v41;
      uint64_t v67 = -[HDIDSMessageCenter _logPrefix](v66);
      int v68 = *(unsigned __int16 *)(a1 + 64);
      v69 = v20;
      uint64_t v70 = *(void *)(a1 + 48);
      v71 = HDStringFromHDIDSPriority([*(id *)(a1 + 40) priority]);
      uint64_t v72 = [v81 length];
      *(_DWORD *)buf = 138545154;
      __int16 v86 = v67;
      __int16 v87 = 2114;
      id v88 = v24;
      __int16 v89 = 2114;
      uint64_t v90 = v70;
      v20 = v69;
      __int16 v91 = 1024;
      int v92 = v68;
      __int16 v93 = 2114;
      v94 = v71;
      __int16 v95 = 2114;
      char v96 = v18;
      __int16 v97 = 2048;
      uint64_t v98 = v72;
      __int16 v99 = 2114;
      id v100 = v25;
      _os_log_error_impl(&dword_1BCB7D000, logb, OS_LOG_TYPE_ERROR, "%{public}@ outgoing response %{public}@ to request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes) error: %{public}@", buf, 0x4Eu);
    }
    char v38 = 0;
LABEL_24:
    v42 = *(void **)(a1 + 40);
    if (v42) {
      objc_setProperty_nonatomic_copy(v42, v27, v24, 48);
    }
    uint64_t v43 = objc_alloc_init(HDIDSMessagePersistentContext);
    unsigned __int16 v45 = v43;
    if (v43)
    {
      v43->_messageID = *(_WORD *)(a1 + 64);
      objc_setProperty_nonatomic_copy(v43, v44, v24, 16);
      v46 = v20;
      objc_setProperty_nonatomic_copy(v45, v47, v20, 24);
      v48 = [*(id *)(a1 + 40) persistentUserInfo];
      objc_storeStrong((id *)&v45->_userInfo, v48);

      v49 = [MEMORY[0x1E4F1C9C8] date];
      objc_storeStrong((id *)&v45->_date, v49);

      v45->_fromRequest = 0;
      if (v24)
      {
LABEL_28:
        os_log_t log = v11;
        uint64_t v50 = v18;
        v51 = v25;
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
        char v53 = objc_opt_respondsToSelector();

        if (v53)
        {
          id v54 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
          [v54 messageCenter:*(void *)(a1 + 32) didResolveIDSIdentifierForResponse:*(void *)(a1 + 40)];
        }
        id v55 = *(void **)(*(void *)(a1 + 32) + 80);
        uint64_t v56 = *(void *)(a1 + 48);
        uint64_t v57 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v58 = [v81 length];
        double v59 = v55;
        v60 = v46;
        [v59 didSendResponse:v24 toRequest:v56 deviceID:v46 type:v57 length:v58];
        if (v38)
        {
          SEL v61 = v81;
          id v25 = v51;
          v18 = v50;
          unsigned __int8 v11 = log;
          if (v80)
          {
            [*(id *)(a1 + 40) sendTimeout];
            if (v62 <= 0.0)
            {
              double v64 = 3600.0;
            }
            else
            {
              [*(id *)(a1 + 40) sendTimeout];
              double v64 = v63;
            }
            double v65 = v64 + CFAbsoluteTimeGetCurrent();
            [*(id *)(*(void *)(a1 + 32) + 80) setObject:v45 forKey:v24 expires:v65];
            -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(void *)(a1 + 32), v65);
          }
        }
        else
        {
          id v25 = v51;
          -[HDIDSMessageCenter _handleError:context:](*(void *)(a1 + 32), v51, v45);
          [*(id *)(*(void *)(a1 + 32) + 80) didReceiveError:v51 forMessageID:v24];
          SEL v61 = v81;
          v18 = v50;
          unsigned __int8 v11 = log;
        }
LABEL_40:

        return;
      }
    }
    else
    {
      v46 = v20;
      [*(id *)(a1 + 40) persistentUserInfo];

      [MEMORY[0x1E4F1C9C8] date];
      if (v24) {
        goto LABEL_28;
      }
    }
    v60 = v46;
    SEL v61 = v81;
    if ((v38 & 1) == 0) {
      -[HDIDSMessageCenter _handleError:context:](*(void *)(a1 + 32), v25, v45);
    }
    goto LABEL_40;
  }
}

+ (id)createPersistentDictionaryWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [[HDIDSPersistentDictionary alloc] initWithURL:v3 objectClass:objc_opt_class()];

  return v4;
}

- (HDIDSMessageCenter)initWithIDSServiceIdentifier:(id)a3 persistentDictionary:(id)a4 queue:(id)a5 daemon:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 158, @"Invalid parameter not satisfying: %@", @"persistentDictionary != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 157, @"Invalid parameter not satisfying: %@", @"serviceIdentifier != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 159, @"Invalid parameter not satisfying: %@", @"queue != NULL" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)HDIDSMessageCenter;
  v15 = [(HDIDSMessageCenter *)&v39 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_daemon, v14);
    uint64_t v17 = [v11 copy];
    serviceIdentifier = v16->_serviceIdentifier;
    v16->_serviceIdentifier = (NSString *)v17;

    uint64_t v19 = [(NSString *)v16->_serviceIdentifier stringByReplacingOccurrencesOfString:@"com.apple.private.alloy." withString:&stru_1F1728D60];
    shortServiceIdentifier = v16->_shortServiceIdentifier;
    v16->_shortServiceIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_queue, a5);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = v21;

    char v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errorHandlers = v16->_errorHandlers;
    v16->_errorHandlers = v23;

    id v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    responseHandlers = v16->_responseHandlers;
    v16->_responseHandlers = v25;

    id v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pbMapping = v16->_pbMapping;
    v16->_pbMapping = v27;

    objc_storeStrong((id *)&v16->_persistentContextStore, a4);
    objc_initWeak(&location, v16);
    dispatch_source_t v29 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v16->_queue);
    expireTimer = v16->_expireTimer;
    v16->_expireTimer = (OS_dispatch_source *)v29;

    int v31 = v16->_expireTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __85__HDIDSMessageCenter_initWithIDSServiceIdentifier_persistentDictionary_queue_daemon___block_invoke;
    handler[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v31, handler);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)addRequestHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v12 = a3;
  if (self->_service)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 221, @"Cannot use %@ after using -resume", v11, v12 object file lineNumber description];
  }
  requestHandlers = self->_requestHandlers;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v12 objCType:":"];
  v8 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)requestHandlers setObject:v7 forKey:v8];
}

- (void)addResponseHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v12 = a3;
  if (self->_service)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 233, @"Cannot use %@ after using -resume", v11, v12 object file lineNumber description];
  }
  responseHandlers = self->_responseHandlers;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v12 objCType:":"];
  v8 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)responseHandlers setObject:v7 forKey:v8];
}

- (void)addErrorHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  SEL v12 = a3;
  if (self->_service)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 227, @"Cannot use %@ after using -resume", v11, v12 object file lineNumber description];
  }
  errorHandlers = self->_errorHandlers;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v12 objCType:":"];
  v8 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)errorHandlers setObject:v7 forKey:v8];
}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v11 = objc_alloc_init(HDIDSPBMapping);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestClass, a3);
    objc_storeStrong((id *)&v11->_responseClass, a4);
  }
  pbMapping = self->_pbMapping;
  uint64_t v10 = [NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)pbMapping setObject:v11 forKeyedSubscript:v10];
}

- (void)setDelegate:(id)a3
{
}

- (void)resume
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if (v4)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 290, @"Invalid parameter not satisfying: %@", @"atomic_load(&_invalidated) == false" object file lineNumber description];
  }
  if (self->_service)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 291, @"Cannot use %@ after using -resume", v11 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  double v6 = [WeakRetained IDSServiceWithIdentifier:self->_serviceIdentifier];
  service = self->_service;
  self->_service = v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__HDIDSMessageCenter_resume__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __28__HDIDSMessageCenter_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 120)];
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 96), 0, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);

  dispatch_resume(v2);
}

void __85__HDIDSMessageCenter_initWithIDSServiceIdentifier_persistentDictionary_queue_daemon___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[15]);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v2 = [MEMORY[0x1E4F1CA48] array];
    dispatch_queue_t v3 = WeakRetained[10];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__HDIDSMessageCenter__expireMessages__block_invoke;
    v24[3] = &unk_1E630A788;
    id v26 = sel__expireMessages;
    v24[4] = WeakRetained;
    CFAbsoluteTime v27 = Current;
    id v4 = v2;
    id v25 = v4;
    [v3 enumerateObjectsSortedByExpirationDate:v24];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v21;
      uint64_t v10 = (os_log_t *)MEMORY[0x1E4F29FA8];
      *(void *)&long long v7 = 138412546;
      long long v17 = v7;
      id v18 = v5;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          SEL v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"HDIDSErrorDomain", 2, 0, v17);
          _HKInitializeLogging();
          os_log_t v14 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
          {
            v15 = v14;
            v16 = -[HDIDSMessageCenter _logPrefix](WeakRetained);
            *(_DWORD *)buf = v17;
            dispatch_source_t v29 = v16;
            __int16 v30 = 2112;
            int v31 = v12;
            _os_log_debug_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEBUG, "%@ expire: %@", buf, 0x16u);

            id v5 = v18;
          }
          -[HDIDSMessageCenter _handleError:context:]((uint64_t)WeakRetained, v13, v12);

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v8);
    }
  }
}

- (void)dealloc
{
  [(HDIDSMessageCenter *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDIDSMessageCenter;
  [(HDIDSMessageCenter *)&v3 dealloc];
}

- (void)invalidate
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u) & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HDIDSMessageCenter_invalidate__block_invoke;
    block[3] = &unk_1E62F3208;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __32__HDIDSMessageCenter_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;
}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDIDSMessageCenter_obliterateWithReason_preserveCopy___block_invoke;
  block[3] = &unk_1E62FF4F8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __56__HDIDSMessageCenter_obliterateWithReason_preserveCopy___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) obliterateWithReason:*(void *)(a1 + 40) preserveCopy:*(unsigned __int8 *)(a1 + 48)];
}

void __37__HDIDSMessageCenter__expireMessages__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4, double a5)
{
  id v13 = a2;
  id v9 = a3;
  if (v13)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HDIDSMessageCenter.m", 258, @"Invalid parameter not satisfying: %@", @"obj != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HDIDSMessageCenter.m", 257, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_12:
  SEL v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HDIDSMessageCenter.m", 259, @"Invalid parameter not satisfying: %@", @"stop != NULL" object file lineNumber description];

LABEL_4:
  if (*(double *)(a1 + 56) <= a5)
  {
    -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(void *)(a1 + 32), a5);
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (void)_handleError:(void *)a3 context:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    if (v6)
    {
      if (v6[2])
      {
        objc_msgSend(*(id *)(a1 + 80), "removeObjectForKey:");
        [*(id *)(a1 + 80) didReceiveError:v5 forMessageID:v6[2]];
      }
      uint64_t v7 = *((unsigned __int16 *)v6 + 5);
    }
    else
    {
      long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__handleError_context_, a1, @"HDIDSMessageCenter.m", 517, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

      uint64_t v7 = 0;
    }
    id v8 = *(void **)(a1 + 56);
    id v9 = [NSNumber numberWithUnsignedShort:v7];
    id v10 = [v8 objectForKey:v9];

    if (v10)
    {
      BOOL v11 = [v5 userInfo];
      SEL v12 = (void *)[v11 mutableCopy];

      [v12 setObject:v6 forKey:@"HDIDSContext"];
      id v13 = (void *)MEMORY[0x1E4F28C58];
      os_log_t v14 = [v5 domain];
      v15 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v5, "code"), v12);

      uint64_t v18 = 0;
      [v10 getValue:&v18];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      [WeakRetained performSelector:v18 withObject:v15];
    }
  }
}

- (void)cancelPendingRequestsWithMessageID:(unsigned __int16)a3 device:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 542, @"Invalid parameter not satisfying: %@", @"device != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HDIDSMessageCenter_cancelPendingRequestsWithMessageID_device___block_invoke;
  block[3] = &unk_1E630A7D8;
  id v12 = v7;
  SEL v13 = a2;
  unsigned __int16 v14 = a3;
  block[4] = self;
  id v9 = v7;
  dispatch_async(queue, block);
}

void __64__HDIDSMessageCenter_cancelPendingRequestsWithMessageID_device___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 40))
    {
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v23 = *(const char **)(a1 + 48);
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = NSStringFromSelector(v23);
      [v22 handleFailureInMethod:v23, v24, @"HDIDSMessageCenter.m", 548, @"Cannot use %@ until -resume is used", v25 object file lineNumber description];

      uint64_t v3 = *(void *)(a1 + 32);
    }
    id v4 = *(void **)(v3 + 80);
    uint64_t v5 = *(unsigned __int16 *)(a1 + 56);
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hd_deviceIdentifier");
    id v7 = [v4 messageIDsForPendingOutgoingMessagesWithType:v5 deviceID:v6];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      id v12 = (os_log_t *)MEMORY[0x1E4F29FA8];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v15 = *(void **)(*(void *)(a1 + 32) + 40);
          id v26 = 0;
          char v16 = [v15 cancelIdentifier:v14 error:&v26];
          id v17 = v26;
          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            os_log_t v18 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = *(void **)(a1 + 32);
              long long v20 = v18;
              long long v21 = -[HDIDSMessageCenter _logPrefix](v19);
              *(_DWORD *)buf = 138543874;
              v32 = v21;
              __int16 v33 = 2114;
              uint64_t v34 = v14;
              __int16 v35 = 2114;
              id v36 = v17;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to cancel request %{public}@: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v10);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) didCancel:v8];
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  uint64_t v11 = (IDSService *)a3;
  dispatch_assert_queue_V2(queue);
  service = self->_service;

  if (service == v11)
  {
    _HKInitializeLogging();
    SEL v13 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      v15 = -[HDIDSMessageCenter _logPrefix](self);
      serviceIdentifier = self->_serviceIdentifier;
      id v17 = objc_msgSend(v8, "hd_shortDescription");
      int v21 = 138543874;
      long long v22 = v15;
      __int16 v23 = 2114;
      uint64_t v24 = serviceIdentifier;
      __int16 v25 = 2114;
      id v26 = v17;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ active paired IDSDevice for %{public}@ did switch: %{public}@", (uint8_t *)&v21, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 messageCenter:self activeDeviceDidChange:v8 acknowledgementHandler:v9];
    }
  }
}

- (HDIDSMessageCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDIDSMessageCenterDelegate *)WeakRetained;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_persistentContextStore, 0);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_shortServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end