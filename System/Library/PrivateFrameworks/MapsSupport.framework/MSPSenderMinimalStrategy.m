@interface MSPSenderMinimalStrategy
+ (BOOL)_supportsEvent:(unint64_t)a3;
+ (double)_etaRefreshIntervalForState:(id)a3;
- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4;
- (MSPSenderMinimalStrategy)initWithGroupSession:(id)a3;
- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4;
- (void)_sendInitialStateIfNeeded;
- (void)_setState:(id)a3;
- (void)addParticipants:(id)a3;
- (void)didFetchCapabilitiesForParticipants:(id)a3;
- (void)removeParticipants:(id)a3;
@end

@implementation MSPSenderMinimalStrategy

- (MSPSenderMinimalStrategy)initWithGroupSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  v3 = [(MSPSenderIDSStrategy *)&v7 initWithGroupSession:a3];
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    participantsNeedingInitialState = v3->_participantsNeedingInitialState;
    v3->_participantsNeedingInitialState = v4;
  }
  return v3;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  v4 = [a3 etaInfo];
  [v4 etaTimestamp];
  v5 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");

  [v5 timeIntervalSinceNow];
  GEOConfigGetDouble();
  GEOConfigGetDouble();
  double v7 = v6;

  return v7;
}

- (void)_setState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSPSenderMinimalStrategy;
  [(MSPSenderStrategy *)&v4 _setState:a3];
  [(MSPSenderMinimalStrategy *)self _sendInitialStateIfNeeded];
}

- (void)_sendInitialStateIfNeeded
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->super.super._participants count]
    && [(NSMutableSet *)self->_participantsNeedingInitialState count])
  {
    v3 = (void *)[(GEOSharedNavState *)self->super.super._state copy];
    char v4 = [(id)objc_opt_class() _validateState:v3 forEvent:3];
    v5 = MSPGetSharedTripLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      v39 = v3;
      if (v6)
      {
        double v7 = NSString;
        v8 = self;
        v9 = [v7 stringWithFormat:@"%@<%p>", objc_opt_class(), v8];

        participantsNeedingInitialState = self->_participantsNeedingInitialState;
        id v11 = v9;
        uint64_t v12 = [(NSMutableSet *)participantsNeedingInitialState count];
        v13 = self->_participantsNeedingInitialState;

        *(_DWORD *)buf = 138543875;
        v46 = v9;
        __int16 v47 = 2048;
        uint64_t v48 = v12;
        __int16 v49 = 2113;
        v50 = (__CFString *)v13;
        _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Need to send initial state to %lu participants: %{private}@", buf, 0x20u);
      }
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_participantsNeedingInitialState, "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v14 = self->_participantsNeedingInitialState;
      uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            v20 = [(MSPSenderIDSStrategy *)self capabilitiesByParticipant];
            v21 = [v20 objectForKeyedSubscript:v19];
            uint64_t v22 = [v21 count];

            if (v22) {
              [v5 addObject:v19];
            }
          }
          uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v16);
      }

      uint64_t v23 = [v5 count];
      v3 = v39;
      if (v23 != [(NSMutableSet *)self->_participantsNeedingInitialState count])
      {
        v24 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = NSString;
          v26 = self;
          v27 = [v25 stringWithFormat:@"%@<%p>", objc_opt_class(), v26];

          id v28 = v27;
          uint64_t v29 = [v5 count];
          uint64_t v30 = [(NSMutableSet *)self->_participantsNeedingInitialState count];

          *(_DWORD *)buf = 138543874;
          v46 = v27;
          __int16 v47 = 2048;
          uint64_t v48 = v29;
          __int16 v49 = 2048;
          v50 = (__CFString *)v30;
          _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_INFO, "[%{public}@] only %lu/%lu participants are currently reachable for initial state", buf, 0x20u);
        }
      }
      if ([v5 count])
      {
        [(NSMutableSet *)self->_participantsNeedingInitialState minusSet:v5];
        [(MSPSenderIDSStrategy *)self _sendUpdatedWaypoints:v39 to:v5];
      }
    }
    else if (v6)
    {
      v31 = NSString;
      v32 = self;
      v33 = [v31 stringWithFormat:@"%@<%p>", objc_opt_class(), v32];

      uint64_t v34 = [(NSMutableSet *)self->_participantsNeedingInitialState count];
      if ([v3 waypointInfosCount]) {
        v35 = @"YES";
      }
      else {
        v35 = @"NO";
      }
      v36 = v35;
      if ([v3 etaInfosCount]) {
        v37 = @"YES";
      }
      else {
        v37 = @"NO";
      }
      v38 = v37;
      *(_DWORD *)buf = 138544130;
      v46 = v33;
      __int16 v47 = 2048;
      uint64_t v48 = v34;
      __int16 v49 = 2114;
      v50 = v36;
      __int16 v51 = 2114;
      v52 = v38;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Need to send initial state to %lu participants, but initial state isn't ready (hasWaypoints: %{public}@, hasETAInfos: %{public}@)", buf, 0x2Au);
    }
  }
}

- (void)addParticipants:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSPSenderMinimalStrategy;
  id v4 = a3;
  [(MSPSenderIDSStrategy *)&v5 addParticipants:v4];
  -[NSMutableSet addObjectsFromArray:](self->_participantsNeedingInitialState, "addObjectsFromArray:", v4, v5.receiver, v5.super_class);

  [(MSPSenderMinimalStrategy *)self _sendInitialStateIfNeeded];
}

- (void)removeParticipants:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  id v4 = a3;
  [(MSPSenderStrategy *)&v7 removeParticipants:v4];
  participantsNeedingInitialState = self->_participantsNeedingInitialState;
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v4, v7.receiver, v7.super_class);

  [(NSMutableSet *)participantsNeedingInitialState minusSet:v6];
}

- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(id)objc_opt_class() _supportsEvent:9]
    && [(NSMutableSet *)self->super.super._participants containsObject:v6])
  {
    objc_super v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSString;
      v9 = self;
      v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] will remove and send stopped with reason: %lu", buf, 0x16u);
    }
    id v11 = (void *)[(GEOSharedNavState *)self->super.super._state copy];
    [v11 setClosed:1];
    [v11 setClosureReason:a4];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v11, "setClosedTimestamp:");
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    [(MSPSenderIDSStrategy *)self _sendStoppedUpdate:v11 to:v12];
  }
  v15.receiver = self;
  v15.super_class = (Class)MSPSenderMinimalStrategy;
  BOOL v13 = [(MSPSenderStrategy *)&v15 removeParticipant:v6 forReason:a4];
  if (v13) {
    [(NSMutableSet *)self->_participantsNeedingInitialState removeObject:v6];
  }

  return v13;
}

- (void)didFetchCapabilitiesForParticipants:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  id v4 = a3;
  [(MSPSenderIDSStrategy *)&v7 didFetchCapabilitiesForParticipants:v4];
  participantsNeedingInitialState = self->_participantsNeedingInitialState;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v4, v7.receiver, v7.super_class);

  LODWORD(participantsNeedingInitialState) = [(NSMutableSet *)participantsNeedingInitialState intersectsSet:v6];
  if (participantsNeedingInitialState) {
    [(MSPSenderMinimalStrategy *)self _sendInitialStateIfNeeded];
  }
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return (a3 < 0xA) & (0x38Fu >> a3);
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MSPSenderMinimalStrategy;
  objc_super v5 = [(MSPSenderIDSStrategy *)&v8 _filteredParticipantsForState:a3 event:a4];
  id v6 = (void *)[v5 mutableCopy];

  [v6 minusSet:self->_participantsNeedingInitialState];

  return v6;
}

- (void).cxx_destruct
{
}

@end