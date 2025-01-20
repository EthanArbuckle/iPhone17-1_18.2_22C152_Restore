@interface MPCPlaybackEngineEventStream
- (BOOL)performQueryReturningBOOL:(id)a3;
- (MPCPlabackEngineEventStreamTestingDelegate)testingDelegate;
- (MPCPlaybackEngineEvent)lastEvent;
- (MPCPlaybackEngineEventStream)initWithDatabaseCreationBlock:(id)a3;
- (MPCPlaybackEngineEventStream)initWithParameters:(id)a3;
- (NSString)engineID;
- (double)transactionDebounceTime;
- (id)cachedEventWithTypes:(void *)a3 matchingPayload:(void *)a4 cursor:;
- (id)debugDescription;
- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4;
- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4 withTimeout:(double)a5;
- (id)lastEventsWithCount:(int64_t)a3;
- (id)performQueryReturningObject:(id)a3;
- (void)_onQueue_flushAndInvalidate;
- (void)_onQueue_flushIfReady;
- (void)_removeAllDatabasePackages:(uint64_t)a1;
- (void)addConsumer:(id)a3;
- (void)dealloc;
- (void)emitEventType:(id)a3 payload:(id)a4;
- (void)emitEventType:(id)a3 payload:(id)a4 atTime:(id *)a5;
- (void)flushEvents;
- (void)flushEventsWithConsumer:(id)a3 fromTimestamp:(unint64_t)a4 untilTimestamp:(unint64_t)a5;
- (void)invalidate;
- (void)performQuery:(id)a3;
- (void)removeConsumer:(id)a3;
- (void)resetConsumerEventDeliveryToTimestamp:(unint64_t)a3;
- (void)scheduleInvalidation;
- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3;
- (void)setTestingDelegate:(id)a3;
- (void)setTransactionDebounceTime:(double)a3;
- (void)sql;
@end

@implementation MPCPlaybackEngineEventStream

- (void)sql
{
  if (a1)
  {
    v2 = (void *)a1[9];
    if (!v2) {
      v2 = (void *)a1[8];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (MPCPlabackEngineEventStreamTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  return (MPCPlabackEngineEventStreamTestingDelegate *)WeakRetained;
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_112(uint64_t a1)
{
}

uint64_t __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 type];
  uint64_t v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) startEvent];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [*(id *)(a1 + 40) startEvent];
      uint64_t v10 = [v3 compare:v9];

      if (v10 != -1) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = [*(id *)(a1 + 40) endEvent];
    if (!v11) {
      goto LABEL_6;
    }
    v12 = (void *)v11;
    v13 = [*(id *)(a1 + 40) endEvent];
    uint64_t v14 = [v3 compare:v13];

    if (v14 != 1)
    {
LABEL_8:
      uint64_t v6 = 0;
    }
    else
    {
LABEL_6:
      uint64_t v6 = 1;
      if (*(void *)(a1 + 48))
      {
        v15 = (void *)MEMORY[0x263EFF9A0];
        v16 = [v3 payload];
        v17 = objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));

        v18 = [v3 payload];
        _MPCPlaybackEngineEventFlattenPayload(v18, v17, &unk_26CC19640);

        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x2020000000;
        char v28 = 1;
        v19 = *(void **)(a1 + 48);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke_2;
        v22[3] = &unk_2643C39E0;
        id v20 = v17;
        id v23 = v20;
        v24 = &v25;
        [v19 enumerateKeysAndObjectsUsingBlock:v22];
        uint64_t v6 = *((unsigned char *)v26 + 24) != 0;

        _Block_object_dispose(&v25, 8);
      }
    }
  }

  return v6;
}

- (id)cachedEventWithTypes:(void *)a3 matchingPayload:(void *)a4 cursor:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          if (!_MPCPlaybackEngineEventTypeIsCacheable(*(void **)(*((void *)&v22 + 1) + 8 * i)))
          {
            a1 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if (v8)
    {
      v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      _MPCPlaybackEngineEventFlattenPayload(v8, v15, &unk_26CC19628);
    }
    else
    {
      v15 = 0;
    }
    v16 = [*(id *)(a1 + 56) reverseObjectEnumerator];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke;
    v18[3] = &unk_2643C3A08;
    id v19 = v10;
    id v20 = v9;
    id v21 = v15;
    id v10 = v15;
    a1 = objc_msgSend(v16, "msv_firstWhere:", v18);

LABEL_15:
  }

  return (id)a1;
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke(uint64_t a1)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 17))
  {
    v2 = [MEMORY[0x263F08C38] UUID];
    if (*(void *)(a1 + 88) > *(void *)(a1 + 128))
    {
      [*(id *)(a1 + 48) timeIntervalSinceDate:*(void *)(a1 + 56)];
      if (v6 > 60.0)
      {
        v97 = [MEMORY[0x263F08690] currentHandler];
        [v97 handleFailureInMethod:*(void *)(a1 + 152), *(void *)(a1 + 32), @"MPCPlaybackEngineEventStream.m", 411, @"Projected event date is too far in the future: %@ %@ %@", *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(a1 + 64) object file lineNumber description];
      }
      id v7 = *(void **)(*(void *)(a1 + 32) + 96);
      if (!v7
        || ([v7 earlierDate:*(void *)(a1 + 48)],
            id v8 = objc_claimAutoreleasedReturnValue(),
            id v9 = *(void **)(*(void *)(a1 + 32) + 96),
            v8,
            v8 == v9))
      {
        uint64_t v10 = [*(id *)(a1 + 48) dateByAddingTimeInterval:0.1];
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void **)(v11 + 96);
        *(void *)(v11 + 96) = v10;

        [*(id *)(*(void *)(a1 + 32) + 96) timeIntervalSinceNow];
        dispatch_time_t v14 = dispatch_time(0, (uint64_t)(fabs(v13) * 1000000000.0));
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = *(NSObject **)(v15 + 80);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_71;
        block[3] = &unk_2643C5FC8;
        block[4] = v15;
        dispatch_after(v14, v16, block);
      }
    }
    uint64_t v17 = *(void *)(a1 + 32);
    if (!*(void *)(v17 + 72))
    {
      uint64_t v18 = [*(id *)(v17 + 64) transactionWithName:@"event emit" error:0];
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(void **)(v19 + 72);
      *(void *)(v19 + 72) = v18;

      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 32) * 1000000000.0));
      uint64_t v22 = *(void *)(a1 + 32);
      long long v23 = *(NSObject **)(v22 + 80);
      v117[0] = MEMORY[0x263EF8330];
      v117[1] = 3221225472;
      v117[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_2;
      v117[3] = &unk_2643C5FC8;
      v117[4] = v22;
      dispatch_after(v21, v23, v117);
    }
    v103 = MPCPlaybackEngineEventPayloadJSONFromPayload(*(void **)(a1 + 64));
    long long v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 24);
      [*(id *)(a1 + 48) timeIntervalSince1970];
      uint64_t v27 = *(void *)(a1 + 88) + *(void *)(a1 + 96);
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = (uint64_t)v28;
      *(_WORD *)v122 = 2048;
      *(void *)&v122[2] = v27;
      __int16 v123 = 2114;
      v124 = v2;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | emitting event [] continuousTime=%ldns event.id=%{public}@", buf, 0x34u);
    }

    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream_Oversize");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 24);
      [*(id *)(a1 + 48) timeIntervalSince1970];
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = (uint64_t)v32;
      *(_WORD *)v122 = 2114;
      *(void *)&v122[2] = v2;
      __int16 v123 = 2114;
      v124 = v103;
      _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | emitting payload [] event.id=%{public}@ payload=%{public}@", buf, 0x34u);
    }
    v102 = (_OWORD *)(a1 + 72);

    v33 = [*(id *)(*(void *)(a1 + 32) + 72) statementWithString:@"INSERT INTO events (identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload) VALUES (@identifier, @type, @monoAbsolute, @monoContinuous, @monoTimebaseNS, @userNS, @threadPriority, @payload)", 0 error];
    v34 = [v2 msv_UUIDData];
    [v33 bindDataValue:v34 toParameterNamed:@"@identifier"];

    [v33 bindStringValue:*(void *)(a1 + 40) toParameterNamed:@"@type"];
    [v33 bindUInt64Value:*(void *)(a1 + 80) toParameterNamed:@"@monoAbsolute"];
    [v33 bindUInt64Value:*(void *)(a1 + 88) toParameterNamed:@"@monoContinuous"];
    [v33 bindUInt64Value:*(void *)(a1 + 96) toParameterNamed:@"@monoTimebaseNS"];
    [v33 bindUInt64Value:(unint64_t)(*(double *)(a1 + 104) * 1000000000.0) toParameterNamed:@"@userNS"];
    [v33 bindUInt64Value:*(int *)(a1 + 168) toParameterNamed:@"@threadPriority"];
    id v116 = 0;
    [v33 bindJSONValue:v103 toParameterNamed:@"@payload" error:&v116];
    v35 = v116;
    v36 = [*(id *)(a1 + 32) testingDelegate];
    if (v35)
    {
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        uint64_t v38 = *(void *)(a1 + 40);
        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 24);
        [*(id *)(a1 + 48) timeIntervalSince1970];
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = (uint64_t)v40;
        *(_WORD *)v122 = 2114;
        *(void *)&v122[2] = v2;
        __int16 v123 = 2114;
        v124 = v35;
        _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | failed [json bind failure] event.id=%{public}@ error=%{public}@", buf, 0x34u);
      }

      if (v36)
      {
        v41 = MPCPlaybackEngineEventPayloadFromPayloadJSON(v103);
        v42 = [MPCPlaybackEngineEvent alloc];
        uint64_t v43 = *(void *)(a1 + 40);
        uint64_t v44 = *(unsigned int *)(a1 + 168);
        long long v45 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v102;
        *(_OWORD *)&buf[16] = v45;
        *(void *)v122 = *(void *)(a1 + 104);
        v46 = [(MPCPlaybackEngineEvent *)v42 initWithType:v43 payload:v41 monotonicTime:buf threadPriority:v44 identifier:v2];
        [v36 eventStream:*(void *)(a1 + 32) didFailToEmitEvent:v46 error:v35];

        goto LABEL_56;
      }
LABEL_57:

      goto LABEL_58;
    }
    v47 = *(void **)(*(void *)(a1 + 32) + 72);
    id v115 = 0;
    char v48 = [v47 executeStatement:v33 error:&v115];
    v41 = v115;
    if ((v48 & 1) == 0)
    {
      v85 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        uint64_t v86 = *(void *)(a1 + 40);
        uint64_t v87 = *(void *)(*(void *)(a1 + 32) + 24);
        [*(id *)(a1 + 48) timeIntervalSince1970];
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v86;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = (uint64_t)v88;
        *(_WORD *)v122 = 2114;
        *(void *)&v122[2] = v2;
        __int16 v123 = 2114;
        v124 = v41;
        _os_log_impl(&dword_21BB87000, v85, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | failed [insert statement failed] event.id=%{public}@ error=%{public}@", buf, 0x34u);
      }

      if (v36)
      {
        v89 = MPCPlaybackEngineEventPayloadFromPayloadJSON(v103);
        v90 = [MPCPlaybackEngineEvent alloc];
        uint64_t v91 = *(void *)(a1 + 40);
        uint64_t v92 = *(unsigned int *)(a1 + 168);
        long long v93 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v102;
        *(_OWORD *)&buf[16] = v93;
        *(void *)v122 = *(void *)(a1 + 104);
        v94 = [(MPCPlaybackEngineEvent *)v90 initWithType:v91 payload:v89 monotonicTime:buf threadPriority:v92 identifier:v2];
        [v36 eventStream:*(void *)(a1 + 32) didFailToEmitEvent:v94 error:v41];
      }
      [v33 invalidate];
LABEL_56:

      goto LABEL_57;
    }
    v98 = v36;
    v101 = v2;
    v99 = v33;
    [v33 invalidate];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id obj = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v49 = [obj countByEnumeratingWithState:&v111 objects:v120 count:16];
    if (!v49)
    {
      v51 = 0;
      v108 = 0;
      goto LABEL_55;
    }
    uint64_t v50 = v49;
    v51 = 0;
    v108 = 0;
    uint64_t v109 = *(void *)v112;
    uint64_t v105 = *MEMORY[0x263F54E80];
    v104 = v41;
LABEL_24:
    uint64_t v52 = 0;
    uint64_t v106 = v50;
    while (1)
    {
      if (*(void *)v112 != v109) {
        objc_enumerationMutation(obj);
      }
      v53 = *(os_unfair_lock_s **)(*((void *)&v111 + 1) + 8 * v52);
      if ((unint64_t)[(os_unfair_lock_s *)v53 lastEventSuccessTimestamp] > *(void *)(a1 + 160)) {
        break;
      }
LABEL_35:
      v72 = v53 + 2;
      os_unfair_lock_lock(v53 + 2);
      v73 = [(os_unfair_lock_s *)v53 mutatingEventHandlers];
      v74 = [v73 objectForKeyedSubscript:*(void *)(a1 + 40)];

      os_unfair_lock_unlock(v72);
      if (!v51)
      {
        if ((_MPCPlaybackEngineEventTypeIsCacheable(*(void **)(a1 + 40)) & 1) == 0 && !v74)
        {
          v51 = 0;
          goto LABEL_46;
        }
        v75 = MPCPlaybackEngineEventPayloadFromPayloadJSON(v103);
        v76 = [MPCPlaybackEngineEvent alloc];
        uint64_t v77 = *(void *)(a1 + 40);
        uint64_t v78 = *(unsigned int *)(a1 + 168);
        long long v79 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v102;
        *(_OWORD *)&buf[16] = v79;
        *(void *)v122 = *(void *)(a1 + 104);
        v80 = [(MPCPlaybackEngineEvent *)v76 initWithType:v77 payload:v75 monotonicTime:buf threadPriority:v78 identifier:v101];
        uint64_t v81 = *(void *)(a1 + 32);
        v51 = v80;
        if (v81)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v81 + 80));
          v82 = [(MPCPlaybackEngineEvent *)v51 type];
          int IsCacheable = _MPCPlaybackEngineEventTypeIsCacheable(v82);

          if (IsCacheable)
          {
            [*(id *)(v81 + 56) addObject:v51];
            [*(id *)(v81 + 56) sortUsingSelector:sel_compare_];
            if ((unint64_t)[*(id *)(v81 + 56) count] >= 0x65) {
              objc_msgSend(*(id *)(v81 + 56), "removeObjectsInRange:", 0, objc_msgSend(*(id *)(v81 + 56), "count") - 100);
            }
          }
        }

        v84 = [[_MPCPlaybackEngineEventStreamCursor alloc] initWithEventStream:*(void *)(a1 + 32) startEvent:v51 endEvent:0];
        v108 = v84;
        if (!v74) {
          goto LABEL_46;
        }
LABEL_37:
        ((void (**)(void, MPCPlaybackEngineEvent *, _MPCPlaybackEngineEventStreamCursor *))v74)[2](v74, v51, v108);
        goto LABEL_46;
      }
      if (v74) {
        goto LABEL_37;
      }
LABEL_46:

      if (v50 == ++v52)
      {
        uint64_t v50 = [obj countByEnumeratingWithState:&v111 objects:v120 count:16];
        if (!v50)
        {
LABEL_55:

          ++*(void *)(*(void *)(a1 + 32) + 88);
          uint64_t v95 = *(void *)(a1 + 32);
          v96 = *(NSObject **)(v95 + 80);
          v110[0] = MEMORY[0x263EF8330];
          v110[1] = 3221225472;
          v110[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_112;
          v110[3] = &unk_2643C5FC8;
          v110[4] = v95;
          dispatch_async(v96, v110);

          v2 = v101;
          v35 = 0;
          v33 = v99;
          v36 = v98;
          goto LABEL_56;
        }
        goto LABEL_24;
      }
    }
    v54 = [(os_unfair_lock_s *)v53 consumer];
    v55 = *(__CFString **)(a1 + 40);
    v56 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
    if (v55 == @"item-position-jump")
    {
      if (v57)
      {
        uint64_t v100 = *(void *)(a1 + 40);
        uint64_t v63 = *(void *)(*(void *)(a1 + 32) + 24);
        [*(id *)(a1 + 48) timeIntervalSince1970];
        uint64_t v65 = (uint64_t)v64;
        v62 = [(id)objc_opt_class() identifier];
        v66 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"item-jump-identifier"];
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v63;
        v41 = v104;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v100;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v65;
        *(_WORD *)v122 = 2114;
        *(void *)&v122[2] = v62;
        __int16 v123 = 2114;
        v124 = v66;
        _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | subscriber ahead of event [backdated jump event] consumer=%{public}@ jumpIdentifier=%{public}@", buf, 0x34u);

        goto LABEL_33;
      }
    }
    else if (v57)
    {
      uint64_t v58 = *(void *)(a1 + 40);
      uint64_t v59 = *(void *)(*(void *)(a1 + 32) + 24);
      [*(id *)(a1 + 48) timeIntervalSince1970];
      uint64_t v61 = (uint64_t)v60;
      v62 = [(id)objc_opt_class() identifier];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v59;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v61;
      v41 = v104;
      *(_WORD *)v122 = 2114;
      *(void *)&v122[2] = v62;
      _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | subscriber ahead of event [out of order delivery] consumer=%{public}@", buf, 0x2Au);
LABEL_33:
    }
    v67 = (void *)MEMORY[0x263F54EC8];
    uint64_t v68 = *(void *)(a1 + 40);
    v69 = [(id)objc_opt_class() identifier];
    uint64_t v70 = *(void *)(a1 + 64);
    v119[0] = v69;
    v119[1] = v70;
    v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
    [v67 snapshotWithDomain:v105 type:@"Bug" subType:@"EVSSubscriberAheadOfEvent" context:v68 triggerThresholdValues:0 events:v71 completion:0];

    uint64_t v50 = v106;
    goto LABEL_35;
  }
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
    [*(id *)(a1 + 48) timeIntervalSince1970];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = (uint64_t)v5;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ | dropping event [invalidated] time=%{time_t}zd", buf, 0x20u);
  }
LABEL_58:
}

- (void)_onQueue_flushIfReady
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1 && *(uint64_t *)(a1 + 88) <= 0 && (objc_msgSend(*(id *)(a1 + 96), "msv_isFuture") & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v2 = [*(id *)(a1 + 48) count];
    uint64_t v3 = v2;
    if (*(unsigned char *)(a1 + 16) && v2 >= 1)
    {
      uint64_t v4 = [*(id *)(a1 + 48) allObjects];
      double v5 = objc_msgSend(v4, "msv_filter:", &__block_literal_global_23382);
      uint64_t v3 = [v5 count];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (!v3 && !*(unsigned char *)(a1 + 17))
    {
      double v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 88) = 0;
      *(void *)(a1 + 96) = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_onQueue_flush", (void)v12);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

void __53__MPCPlaybackEngineEventStream__invalidateAssertion___block_invoke(uint64_t a1)
{
}

- (BOOL)performQueryReturningBOOL:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__MPCPlaybackEngineEventStream_performQueryReturningBOOL___block_invoke;
  v7[3] = &unk_2643C39B8;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(MPCPlaybackEngineEventStream *)self performQuery:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)performQuery:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__MPCPlaybackEngineEventStream_performQuery___block_invoke;
  v7[3] = &unk_2643C55A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __45__MPCPlaybackEngineEventStream_performQuery___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v4);
  uint64_t v2 = [_MPCPlaybackEngineEventStreamCursor alloc];
  uint64_t v3 = [(_MPCPlaybackEngineEventStreamCursor *)v2 initWithEventStream:*(void *)(a1 + 32) fromNanoSeconds:(void)v5 + *((void *)&v5 + 1) endEvent:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)emitEventType:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  MPCPlaybackEngineEventGetMonotonicTime(v8);
  [(MPCPlaybackEngineEventStream *)self emitEventType:v7 payload:v6 atTime:v8];
}

- (void)emitEventType:(id)a3 payload:(id)a4 atTime:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  double v40 = 0.0;
  long long v38 = 0u;
  uint64x2_t v39 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v38);
  if ((a5->var0 & 1) == 0)
  {
    uint64x2_t v11 = v39;
    *(_OWORD *)&a5->var0 = v38;
    *(uint64x2_t *)&a5->var2 = v11;
    a5->double var4 = v40;
  }
  float64x2_t v22 = (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL);
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(v39), v22)), *(_OWORD *)&v22);
  char v13 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&a5->var2), v23)));
  if (self->_invalidated)
  {
    long long v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      engineID = self->_engineID;
      [v13 timeIntervalSince1970];
      *(_DWORD *)buf = 138543874;
      v42 = engineID;
      __int16 v43 = 2114;
      id v44 = v9;
      __int16 v45 = 2048;
      uint64_t v46 = (uint64_t)v16;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ | dropping event [invalidated] time=%{time_t}zd", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v17 = a5->var2 + a5->var3;
    uint64_t v18 = [(MPCPlaybackEngineEventStream *)self testingDelegate];

    if (!v18) {
      _MPCPlaybackEngineEventStreamValidateSystemTime(v9, v17);
    }
    int v19 = MSVGetCurrentThreadPriority();
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke;
    block[3] = &unk_2643C3990;
    block[4] = self;
    id v25 = v9;
    id v26 = v13;
    long long v21 = *(_OWORD *)&a5->var2;
    long long v29 = *(_OWORD *)&a5->var0;
    long long v30 = v21;
    double var4 = a5->var4;
    long long v32 = v38;
    uint64x2_t v33 = v39;
    double v34 = v40;
    id v27 = v12;
    SEL v35 = a2;
    int v37 = v19;
    id v28 = v10;
    unint64_t v36 = v17;
    dispatch_async(queue, block);
  }
}

uint64_t __58__MPCPlaybackEngineEventStream_performQueryReturningBOOL___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v7 == v9)
  {
  }
  else
  {
    char v8 = [v9 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void __44__MPCPlaybackEngineEventStream_addConsumer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[_MPCPlaybackEngineEventStreamSubscription alloc] initWithConsumer:*(void *)(a1 + 32) eventStream:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 40) + 40) addObject:v2];
  [*(id *)(a1 + 32) subscribeToEventStream:v2];
}

- (NSString)engineID
{
  return self->_engineID;
}

- (void)addConsumer:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    id v7 = [(id)objc_opt_class() identifier];
    *(_DWORD *)buf = 138543874;
    long long v14 = engineID;
    __int16 v15 = 2114;
    double v16 = v7;
    __int16 v17 = 2048;
    id v18 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] addConsumer:<%{public}@: %p>", buf, 0x20u);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__MPCPlaybackEngineEventStream_addConsumer___block_invoke;
  v10[3] = &unk_2643C5EE8;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  dispatch_async(queue, v10);
}

- (MPCPlaybackEngineEventStream)initWithParameters:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke;
  v8[3] = &unk_2643C3958;
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = [(MPCPlaybackEngineEventStream *)v9 initWithDatabaseCreationBlock:v8];

  return v6;
}

- (MPCPlaybackEngineEventStream)initWithDatabaseCreationBlock:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MPCPlaybackEngineEventStream;
  id v5 = [(MPCPlaybackEngineEventStream *)&v28 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCPlaybackEngineEventStream/access", v7);
    id v9 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    id v11 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v10;

    uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    char v13 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v12;

    *((_DWORD *)v5 + 2) = 0;
    uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:101];
    __int16 v15 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v14;

    *((unsigned char *)v5 + 17) = 0;
    *((void *)v5 + 4) = 0x3FF0000000000000;
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_initWeak(&location, v5);
      id v16 = MEMORY[0x263EF83A0];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke;
      handler[3] = &unk_2643C3930;
      objc_copyWeak(&v26, &location);
      notify_register_dispatch("com.apple.mediaplaybackcore.evsdebug", (int *)v5 + 3, MEMORY[0x263EF83A0], handler);

      uint64_t state64 = 0;
      notify_get_state(*((_DWORD *)v5 + 3), &state64);
      __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *((void *)v5 + 3);
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v18;
        __int16 v31 = 1024;
        BOOL v32 = state64 != 0;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] notify_register(\"com.apple.mediaplaybackcore.evsdebug\") | evsdebug flag [initial] evsdebug=%{BOOL}u", buf, 0x12u);
      }

      *((unsigned char *)v5 + 16) = state64 != 0;
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    uint64_t v19 = *((void *)v5 + 10);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke_4;
    block[3] = &unk_2643C55A8;
    id v22 = v5;
    id v23 = v4;
    dispatch_async(v19, block);
  }
  return (MPCPlaybackEngineEventStream *)v5;
}

void __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  -[MPCPlaybackEngineEventStream _removeAllDatabasePackages:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"_MPC_EVS_IN_DOCUMENTS_IS_CLEAN"];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 48) URLsForDirectory:9 inDomains:1];
    id v5 = [v4 lastObject];

    id v6 = [v5 URLByAppendingPathComponent:@"PlaybackEventStreams" isDirectory:1];
    -[MPCPlaybackEngineEventStream _removeAllDatabasePackages:](*(void *)(a1 + 32), v6);
    id v7 = *(void **)(a1 + 48);
    id v12 = 0;
    [v7 removeItemAtURL:v6 error:&v12];
    id v8 = v12;
    if (v8)
    {
      id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v6 path];
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = v10;
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "Failed to remove legacy EVS container folder: %{public}@ error: %{public}@", buf, 0x16u);
      }
    }
    id v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v11 setBool:1 forKey:@"_MPC_EVS_IN_DOCUMENTS_IS_CLEAN"];
  }
}

- (void)_removeAllDatabasePackages:(uint64_t)a1
{
  v46[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v29 = a1;
  if (a1)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v31 = *MEMORY[0x263EFF6A8];
    v46[0] = *MEMORY[0x263EFF6A8];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    id v38 = 0;
    id v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:4 error:&v38];
    id v7 = v38;

    if (v7)
    {
      id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(v29 + 24);
        *(_DWORD *)buf = 138543875;
        uint64_t v41 = v9;
        __int16 v42 = 2113;
        id v43 = v3;
        __int16 v44 = 2114;
        id v45 = v7;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] _removeAllDatabasePackages | unable to list directory [] url=%{private}@ error=%{public}@", buf, 0x20u);
      }
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v6;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v26 = v6;
        id v27 = v3;
        id v7 = 0;
        id v12 = "com.apple.amp.mediaplaybackcore";
        uint64_t v13 = *(void *)v35;
        uint64_t v30 = *(void *)v35;
        do
        {
          uint64_t v14 = 0;
          uint64_t v28 = v11;
          do
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v8);
            }
            __int16 v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
            id v33 = 0;
            objc_msgSend(v15, "getResourceValue:forKey:error:", &v33, v31, 0, v26, v27);
            id v16 = v33;
            if ([v16 BOOLValue])
            {
              id v32 = v7;
              [v4 removeItemAtURL:v15 error:&v32];
              id v17 = v32;

              uint64_t v18 = os_log_create(v12, "PlaybackEventStream");
              uint64_t v19 = v18;
              if (v17)
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  id v20 = v12;
                  long long v21 = v8;
                  id v22 = v4;
                  uint64_t v23 = *(void *)(v29 + 24);
                  long long v24 = objc_msgSend(v17, "msv_description");
                  *(_DWORD *)buf = 138543874;
                  uint64_t v41 = v23;
                  id v4 = v22;
                  id v8 = v21;
                  id v12 = v20;
                  __int16 v42 = 2114;
                  id v43 = v15;
                  __int16 v44 = 2114;
                  id v45 = v24;
                  _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] _removeAllDatabasePackages | removing database package [] url=%{public}@ error=%{public}@", buf, 0x20u);

                  uint64_t v11 = v28;
                }
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v25 = *(void *)(v29 + 24);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v41 = v25;
                  __int16 v42 = 2114;
                  id v43 = v15;
                  _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] _removeAllDatabasePackages | removing database package [] url=%{public}@", buf, 0x16u);
                }
                id v17 = 0;
              }

              id v7 = v17;
              uint64_t v13 = v30;
            }

            ++v14;
          }
          while (v11 != v14);
          uint64_t v11 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v11);
        id v6 = v26;
        id v3 = v27;
      }
      else
      {
        id v7 = 0;
      }
    }
  }
}

void __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 24);
    id v8 = *(void **)(v6 + 64);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_INFO, "[EVS:%{public}@] initWithDatabaseCreationBlock:… | created database [] database=%{public}@", buf, 0x16u);
  }

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 64) transactionWithName:@"schema" error:0];
  id v13 = 0;
  [v9 executeStatementString:@"CREATE TABLE IF NOT EXISTS events(identifier BLOB PRIMARY KEY, type TEXT, monoAbsolute INT, monoContinuous INT, monoTimebaseNS INT, userNS INT, threadPriority INT, payload TEXT, _ns INT UNIQUE GENERATED ALWAYS AS (monoTimebaseNS + monoContinuous) STORED)", &v13 error];
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] initWithDatabaseCreationBlock:… | failed to create table [] error=%{public}@", buf, 0x16u);
    }
  }
  [v9 executeStatementString:@"CREATE UNIQUE INDEX IF NOT EXISTS events_ns ON events (_ns)" error:0];
  [v9 executeStatementString:@"CREATE INDEX IF NOT EXISTS events_type ON events (type, _ns)", 0 error];
  [v9 commit];
}

id __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) engineID];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v6 URLsForDirectory:14 inDomains:1];
  id v8 = [v7 lastObject];

  uint64_t v9 = [v8 URLByAppendingPathComponent:@"com.apple.MediaPlaybackCore.PlaybackEventStreams" isDirectory:1];
  id v10 = [v9 path];
  [v6 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v11 = NSString;
  uint64_t v12 = [*(id *)(a1 + 40) playerID];
  id v13 = [*(id *)(a1 + 40) engineID];
  uint64_t v14 = [v11 stringWithFormat:@"%@-%@.sqlpkg", v12, v13];
  uint64_t v15 = [v9 URLByAppendingPathComponent:v14 isDirectory:1];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke_2;
  block[3] = &unk_2643C6660;
  id v30 = *(id *)(a1 + 32);
  id v16 = v9;
  id v31 = v16;
  id v17 = v6;
  id v32 = v17;
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, block);
  }
  [v17 removeItemAtURL:v15 error:0];
  uint64_t v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v18 setBool:0 forKey:@"_MPC_CLEAR_EVS"];

  uint64_t v19 = [v15 path];
  [v17 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:0];

  id v20 = [v15 URLByAppendingPathComponent:@"Database" isDirectory:0];
  id v28 = 0;
  long long v21 = (void *)[objc_alloc(MEMORY[0x263F54F20]) initWithURL:v20 error:&v28];
  id v22 = v28;
  if (v22 || !v21)
  {
    long long v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v25;
      __int16 v35 = 2114;
      long long v36 = v20;
      __int16 v37 = 2114;
      id v38 = v22;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] initWithParameters:… | unable to create events database [] url=%{public}@ error=%{public}@", buf, 0x20u);
    }

    id v23 = (id)[objc_alloc(MEMORY[0x263F54F20]) initWithMemory];
  }
  else
  {
    id v23 = v21;
  }
  id v26 = v23;

  return v26;
}

- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4 withTimeout:(double)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (!v9)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 357, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v10 = [[_MPCPlaybackEngineEventStreamDeferralAssertion alloc] initWithEventStream:self type:a3 reason:v9 timeout:a5];
  os_unfair_lock_lock(&self->_deferralAssertionsLock);
  [(NSHashTable *)self->_deferralAssertions addObject:v10];
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    engineID = self->_engineID;
    id v13 = [(_MPCPlaybackEngineEventStreamDeferralAssertion *)v10 identifier];
    int v14 = [(NSHashTable *)self->_deferralAssertions count];
    *(_DWORD *)buf = 138544642;
    uint64_t v18 = engineID;
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2048;
    double v22 = a5;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v13;
    __int16 v27 = 1024;
    int v28 = v14;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] eventDeliveryDeferralAssertionOfType:%d reason:… timeout:%g | taking assertion [%{public}@] id=%{public}@ assertionCount=%d", buf, 0x36u);
  }
  os_unfair_lock_unlock(&self->_deferralAssertionsLock);

  return v10;
}

- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4
{
  return [(MPCPlaybackEngineEventStream *)self eventDeliveryDeferralAssertionOfType:a3 forReason:a4 withTimeout:0.0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_nextScheduledFlush, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cachedEvents, 0);
  objc_storeStrong((id *)&self->_deferralAssertions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_engineID, 0);
}

- (void)setTestingDelegate:(id)a3
{
}

- (void)setTransactionDebounceTime:(double)a3
{
  self->_transactionDebounceTime = a3;
}

- (double)transactionDebounceTime
{
  return self->_transactionDebounceTime;
}

- (void)resetConsumerEventDeliveryToTimestamp:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__MPCPlaybackEngineEventStream_resetConsumerEventDeliveryToTimestamp___block_invoke;
  v4[3] = &unk_2643C4F28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __70__MPCPlaybackEngineEventStream_resetConsumerEventDeliveryToTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setLastEventSuccessTimestamp:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__MPCPlaybackEngineEventStream_setMaximumEventDeliveryTimestamp___block_invoke;
  v4[3] = &unk_2643C4F28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __65__MPCPlaybackEngineEventStream_setMaximumEventDeliveryTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setMaximumEventDeliveryTimestamp:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)lastEventsWithCount:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_invalidated)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      engineID = self->_engineID;
      int v17 = 138543618;
      uint64_t v18 = engineID;
      __int16 v19 = 1024;
      int v20 = a3;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] lastEventsWithCount:%d | returning empty [invalidated]", (uint8_t *)&v17, 0x12u);
    }

    long long v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    long long v8 = -[MPCPlaybackEngineEventStream sql](self);
    long long v9 = [v8 statementWithString:@"SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events ORDER BY _ns LIMIT @count", 0 error];

    [v9 bindInt64Value:a3 toParameterNamed:@"@count"];
    long long v10 = -[MPCPlaybackEngineEventStream sql](self);
    uint64_t v11 = [v10 resultsForStatement:v9];

    long long v7 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    uint64_t v12 = [v11 nextObject];
    if (v12)
    {
      id v13 = (void *)v12;
      do
      {
        int v14 = +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v13);
        if (v14) {
          [v7 addObject:v14];
        }

        uint64_t v15 = [v11 nextObject];

        id v13 = (void *)v15;
      }
      while (v15);
    }
    [v9 invalidate];
  }

  return v7;
}

- (MPCPlaybackEngineEvent)lastEvent
{
  id v2 = [(MPCPlaybackEngineEventStream *)self lastEventsWithCount:1];
  uint64_t v3 = [v2 firstObject];

  return (MPCPlaybackEngineEvent *)v3;
}

- (id)performQueryReturningObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__23079;
  uint64_t v15 = __Block_byref_object_dispose__23080;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__MPCPlaybackEngineEventStream_performQueryReturningObject___block_invoke;
  v8[3] = &unk_2643C39B8;
  long long v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(MPCPlaybackEngineEventStream *)self performQuery:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __60__MPCPlaybackEngineEventStream_performQueryReturningObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)flushEventsWithConsumer:(id)a3 fromTimestamp:(unint64_t)a4 untilTimestamp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [[_MPCPlaybackEngineEventStreamSubscription alloc] initWithConsumer:v8 eventStream:self];
  [(_MPCPlaybackEngineEventStreamSubscription *)v9 setLastEventSuccessTimestamp:a4];
  [(_MPCPlaybackEngineEventStreamSubscription *)v9 setMaximumEventDeliveryTimestamp:a5];
  [v8 subscribeToEventStream:v9];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__MPCPlaybackEngineEventStream_flushEventsWithConsumer_fromTimestamp_untilTimestamp___block_invoke;
  block[3] = &unk_2643C5FC8;
  uint64_t v13 = v9;
  uint64_t v11 = v9;
  dispatch_sync(queue, block);
}

void __85__MPCPlaybackEngineEventStream_flushEventsWithConsumer_fromTimestamp_untilTimestamp___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_flush");
  [*(id *)(a1 + 32) cancelSubscription];
  id v2 = [*(id *)(a1 + 32) consumer];
  [v2 unsubscribeFromEventStream:*(void *)(a1 + 32)];
}

- (void)flushEvents
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MPCPlaybackEngineEventStream_flushEvents__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __43__MPCPlaybackEngineEventStream_flushEvents__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "_onQueue_flush", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_71(uint64_t a1)
{
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) commit];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;
}

BOOL __55__MPCPlaybackEngineEventStream__onQueue_isReadyToFlush__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

- (void)removeConsumer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    long long v7 = [(id)objc_opt_class() identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = engineID;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    id v17 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] removeConsumer:<%{public}@: %p>", buf, 0x20u);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__MPCPlaybackEngineEventStream_removeConsumer___block_invoke;
  v10[3] = &unk_2643C5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(queue, v10);
}

void __47__MPCPlaybackEngineEventStream_removeConsumer___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v8 = [v7 consumer];
        id v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v7];
          [v7 cancelSubscription];
          [*(id *)(a1 + 40) unsubscribeFromEventStream:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MPCPlaybackEngineEventStream;
  uint64_t v3 = [(MPCPlaybackEngineEventStream *)&v6 debugDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"\n - Database: %@", self->_database];
  [v4 appendFormat:@"\n - Subscriptions: %@", self->_subscriptions];
  os_unfair_lock_lock(&self->_deferralAssertionsLock);
  [v4 appendFormat:@"\n - Assertions: %@", self->_deferralAssertions];
  os_unfair_lock_unlock(&self->_deferralAssertionsLock);

  return v4;
}

- (void)scheduleInvalidation
{
  if (!self->_invalidated)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__MPCPlaybackEngineEventStream_scheduleInvalidation__block_invoke;
    block[3] = &unk_2643C5FC8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __52__MPCPlaybackEngineEventStream_scheduleInvalidation__block_invoke(uint64_t a1)
{
}

- (void)_onQueue_flushAndInvalidate
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a1 && !*(unsigned char *)(a1 + 17))
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 24);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v3;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] invalidate | invalidating event stream", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    [*(id *)(a1 + 48) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "_onQueue_flush");
          [v9 cancelSubscription];
          long long v10 = [v9 consumer];
          [v10 unsubscribeFromEventStream:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v6);
    }

    *(unsigned char *)(a1 + 17) = 1;
    long long v11 = [*(id *)(a1 + 64) databaseURL];
    long long v12 = (void *)MEMORY[0x21D49E0F0]();
    long long v13 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    __int16 v14 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    if (v11)
    {
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      id v22 = 0;
      [v15 removeItemAtURL:v11 error:&v22];
      id v16 = v22;

      id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      uint64_t v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 24);
          int v20 = objc_msgSend(v16, "msv_description");
          *(_DWORD *)buf = 138543874;
          uint64_t v28 = v19;
          __int16 v29 = 2114;
          id v30 = v11;
          __int16 v31 = 2114;
          id v32 = v20;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] invalidate | removing database [invalidation] url=%{public}@ error=%{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 24);
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v21;
          __int16 v29 = 2114;
          id v30 = v11;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] invalidate | removing database [invalidation] url=%{public}@", buf, 0x16u);
        }
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__MPCPlaybackEngineEventStream_invalidate__block_invoke;
    block[3] = &unk_2643C5FC8;
    void block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __42__MPCPlaybackEngineEventStream_invalidate__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MPCPlaybackEngineEventStream.m" lineNumber:297 description:@"EVS: deallocated before invalidation"];
  }
  notify_cancel(self->_deferralDebugToken);
  v5.receiver = self;
  v5.super_class = (Class)MPCPlaybackEngineEventStream;
  [(MPCPlaybackEngineEventStream *)&v5 dealloc];
}

void __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t state64 = 0;
  notify_get_state(a2, &state64);
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = [WeakRetained engineID];
    *(_DWORD *)buf = 138543618;
    long long v8 = v5;
    __int16 v9 = 1024;
    BOOL v10 = state64 != 0;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] notify_register(\"com.apple.mediaplaybackcore.evsdebug\") | evsdebug flag [notification] evsdebug=%{BOOL}u", buf, 0x12u);
  }
  WeakRetained[16] = state64 != 0;
  [WeakRetained flushEvents];
}

@end