@interface MSPSenderStrategy
+ (BOOL)_supportsEvent:(unint64_t)a3;
+ (BOOL)_validateState:(id)a3 forEvent:(unint64_t)a4;
- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4;
- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4;
- (MSPSenderStrategy)init;
- (NSSet)participants;
- (void)_setState:(id)a3;
- (void)addParticipants:(id)a3;
- (void)removeParticipants:(id)a3;
@end

@implementation MSPSenderStrategy

- (MSPSenderStrategy)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSPSenderStrategy;
  v2 = [(MSPSenderStrategy *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    participants = v2->_participants;
    v2->_participants = v3;
  }
  return v2;
}

- (void)_setState:(id)a3
{
  self->_state = (GEOSharedNavState *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)addParticipants:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      objc_super v6 = NSString;
      v7 = self;
      v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543875;
    v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 count];
    __int16 v13 = 2113;
    id v14 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[%{public}@] add %lu participants: %{private}@", buf, 0x20u);
  }
  [(NSMutableSet *)self->_participants addObjectsFromArray:v4];
}

- (void)removeParticipants:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  uint64_t v6 = [v5 count];
  if (v6 != [v4 count])
  {
    v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      if (self)
      {
        v8 = NSString;
        v9 = self;
        v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];
      }
      else
      {
        v10 = @"<nil>";
      }
      *(_DWORD *)buf = 138543619;
      v17 = v10;
      __int16 v18 = 2113;
      uint64_t v19 = (uint64_t)v4;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_FAULT, "[%{public}@] - found duplicate handles in array to remove: %{private}@", buf, 0x16u);
    }
  }
  if ([(NSMutableSet *)self->_participants intersectsSet:v5])
  {
    __int16 v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = NSString;
      __int16 v13 = self;
      id v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];

      uint64_t v15 = [v5 count];
      *(_DWORD *)buf = 138543875;
      v17 = v14;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      __int16 v20 = 2113;
      v21 = v5;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_INFO, "[%{public}@] remove %lu participants: %{private}@", buf, 0x20u);
    }
    [(NSMutableSet *)self->_participants minusSet:v5];
  }
}

- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(NSMutableSet *)self->_participants containsObject:v5];
  if (v6)
  {
    v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSString;
      v9 = self;
      v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

      *(_DWORD *)buf = 138543619;
      __int16 v13 = v10;
      __int16 v14 = 2113;
      id v15 = v5;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] remove participant: %{private}@", buf, 0x16u);
    }
    [(NSMutableSet *)self->_participants removeObject:v5];
  }

  return v6;
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return 0;
}

+ (BOOL)_validateState:(id)a3 forEvent:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 hasGroupIdentifier])
  {
    BOOL v6 = 1;
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if (![v5 hasEtaInfo] || !objc_msgSend(v5, "hasWaypointInfos")) {
          goto LABEL_13;
        }
        char v7 = [v5 hasTransportType];
        goto LABEL_15;
      case 5uLL:
        if (![v5 hasRouteInfo]) {
          goto LABEL_13;
        }
        v8 = [v5 routeInfo];
        if (![v8 coordinatesCount])
        {
          v9 = [v5 routeInfo];
          BOOL v6 = [v9 routingPathLegsCount] != 0;
        }
        break;
      case 7uLL:
        char v7 = [v5 hasArrived];
        goto LABEL_15;
      case 8uLL:
        if (![v5 hasEtaInfo]) {
          goto LABEL_13;
        }
        char v7 = [v5 hasWaypointInfos];
        goto LABEL_15;
      case 9uLL:
        char v7 = [v5 hasClosed];
LABEL_15:
        BOOL v6 = v7;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_13:
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(id)objc_opt_class() _supportsEvent:a4])
  {
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  if (([(id)objc_opt_class() _validateState:v6 forEvent:a4] & 1) == 0)
  {
    uint64_t v12 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        __int16 v13 = NSString;
        __int16 v14 = self;
        id v15 = [v13 stringWithFormat:@"%@<%p>", objc_opt_class(), v14];
      }
      else
      {
        id v15 = @"<nil>";
      }
      if (a4 > 9) {
        uint64_t v16 = @"(none)";
      }
      else {
        uint64_t v16 = off_1E617C670[a4];
      }
      *(_DWORD *)buf = 138543875;
      v21 = v15;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2113;
      uint64_t v25 = (uint64_t)v6;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@: incoming state failed validation: %{private}@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if ([(NSMutableSet *)self->_participants count])
  {
    char v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSString;
      v9 = self;
      v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

      if (a4 > 9) {
        __int16 v11 = @"(none)";
      }
      else {
        __int16 v11 = off_1E617C670[a4];
      }
      uint64_t v18 = [(NSMutableSet *)self->_participants count];
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      __int16 v22 = 2114;
      v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ (%lu participants)", buf, 0x20u);
    }
  }
  [(MSPSenderStrategy *)self _setState:v6];
  BOOL v17 = 1;
LABEL_21:

  return v17;
}

- (NSSet)participants
{
  return &self->_participants->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end