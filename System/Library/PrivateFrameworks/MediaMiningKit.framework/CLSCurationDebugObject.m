@interface CLSCurationDebugObject
+ (id)stringForState:(unint64_t)a3;
- (CLSCurationDebugObject)init;
- (NSArray)stateHistory;
- (id)dictionaryRepresentation;
- (id)timestamp;
- (unint64_t)state;
- (void)beginTentativeSection;
- (void)endTentativeSectionWithSuccess:(BOOL)a3;
- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5;
- (void)setState:(unint64_t)a3 withReason:(id)a4 agent:(id)a5 stage:(id)a6;
@end

@implementation CLSCurationDebugObject

- (void).cxx_destruct
{
}

- (NSArray)stateHistory
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (id)timestamp
{
  return 0;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v28 = self;
  uint64_t v4 = [(id)objc_opt_class() stringForState:self->_state];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"state"];
  }
  v25 = (void *)v4;
  v26 = v3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](v28->_stateHistory, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = v28->_stateHistory;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v33[0] = @"state";
        uint64_t v11 = objc_msgSend((id)objc_opt_class(), "stringForState:", objc_msgSend(v10, "state", v25));
        v12 = (void *)v11;
        if (v11) {
          v13 = (__CFString *)v11;
        }
        else {
          v13 = @"Invalid";
        }
        v34[0] = v13;
        v33[1] = @"agent";
        uint64_t v14 = [v10 agent];
        v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = @"Invalid";
        }
        v34[1] = v16;
        v33[2] = @"stage";
        uint64_t v17 = [v10 stage];
        v18 = (void *)v17;
        if (v17) {
          v19 = (__CFString *)v17;
        }
        else {
          v19 = @"Invalid";
        }
        v34[2] = v19;
        v33[3] = @"reason";
        uint64_t v20 = [v10 reason];
        v21 = (void *)v20;
        if (v20) {
          v22 = (__CFString *)v20;
        }
        else {
          v22 = @"Invalid";
        }
        v34[3] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];

        [v5 addObject:v23];
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  [v26 setObject:v5 forKeyedSubscript:@"stateHistory"];
  return v26;
}

- (void)endTentativeSectionWithSuccess:(BOOL)a3
{
  unint64_t tentativeSectionStateHistoryLength = self->_tentativeSectionStateHistoryLength;
  if (tentativeSectionStateHistoryLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v12 = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    v5 = "Can't end a tentative section that didn't begin";
    uint64_t v6 = (uint8_t *)&v12;
LABEL_7:
    _os_log_error_impl(&dword_1D2150000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    return;
  }
  if (tentativeSectionStateHistoryLength > [(NSMutableArray *)self->_stateHistory count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v11 = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    v5 = "Consistency error, state history can't be shorter at the end of a tentative section than at the beginning";
    uint64_t v6 = (uint8_t *)&v11;
    goto LABEL_7;
  }
  if (!a3)
  {
    unint64_t v9 = self->_tentativeSectionStateHistoryLength;
    if (v9 < [(NSMutableArray *)self->_stateHistory count])
    {
      unint64_t v10 = self->_tentativeSectionStateHistoryLength;
      self->_state = self->_stateAtBeginningOfTentativeSection;
      -[NSMutableArray removeObjectsInRange:](self->_stateHistory, "removeObjectsInRange:", v10, [(NSMutableArray *)self->_stateHistory count] - self->_tentativeSectionStateHistoryLength);
    }
  }
  *(_OWORD *)&self->_unint64_t tentativeSectionStateHistoryLength = xmmword_1D21C5210;
}

- (void)beginTentativeSection
{
  if (self->_tentativeSectionStateHistoryLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_stateAtBeginningOfTentativeSection = self->_state;
    self->_unint64_t tentativeSectionStateHistoryLength = [(NSMutableArray *)self->_stateHistory count];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Only one tentative section supported at a time", v2, 2u);
  }
}

- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5
{
  if (self->_state != 4) {
    self->_state = 0;
  }
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [[CLSCurationDebugStateEntry alloc] initWithState:self->_state reason:v10 agent:v9 stage:v8];

  [(NSMutableArray *)self->_stateHistory addObject:v11];
}

- (void)setState:(unint64_t)a3 withReason:(id)a4 agent:(id)a5 stage:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3)
  {
    unint64_t state = self->_state;
    switch(state)
    {
      case 1uLL:
        goto LABEL_5;
      case 4uLL:
        a3 = 4;
        break;
      case 3uLL:
LABEL_5:
        if (a3 == 4)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            __int16 v18 = 0;
            uint64_t v14 = MEMORY[0x1E4F14500];
            v15 = "Algorithms should always be aware of the Required state";
            v16 = (uint8_t *)&v18;
LABEL_10:
            _os_log_error_impl(&dword_1D2150000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
            goto LABEL_13;
          }
          goto LABEL_13;
        }
        break;
    }
    self->_unint64_t state = a3;
    uint64_t v17 = [[CLSCurationDebugStateEntry alloc] initWithState:a3 reason:v10 agent:v11 stage:v12];
    [(NSMutableArray *)self->_stateHistory addObject:v17];

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v14 = MEMORY[0x1E4F14500];
    v15 = "Curation Object can't transition to Unknown state, use resetWithReason to reset it.";
    v16 = buf;
    goto LABEL_10;
  }
LABEL_13:
}

- (CLSCurationDebugObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSCurationDebugObject;
  v2 = [(CLSCurationDebugObject *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stateHistory = v2->_stateHistory;
    v2->_stateHistory = v3;

    v2->_unint64_t tentativeSectionStateHistoryLength = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

+ (id)stringForState:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Invalid State";
  }
  else {
    return off_1E6910440[a3];
  }
}

@end