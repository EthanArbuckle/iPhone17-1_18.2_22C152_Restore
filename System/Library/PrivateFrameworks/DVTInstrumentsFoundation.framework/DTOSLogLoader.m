@interface DTOSLogLoader
+ (id)heartbeatPredicate;
+ (void)heartbeat;
- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4;
- (DTOSLogLoader)init;
- (DTOSLogLoaderDelegate)delegate;
- (NSError)failureReason;
- (id).cxx_construct;
- (id)_setupLoggedStreamForNextChunk:(id)a3;
- (id)_stackReferenceForRepeatedString:(id)a3;
- (id)_stackReferenceForRepeatedUUID:(id)a3;
- (id)ticketToFetchData:(id)a3 window:(double)a4;
- (id)ticketToPrepare:(id)a3 configuration:(id)a4;
- (id)ticketToStartStream:(id)a3;
- (id)ticketToStopStream:(id)a3;
- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4;
- (void)_handleRecord:(id)a3;
- (void)_performResetOnOutputStream;
- (void)_prepareAgentToExecute:(id)a3 withTicket:(id)a4;
- (void)_setupCommonStreamParameters:(id)a3;
- (void)_setupLiveStream:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation DTOSLogLoader

+ (id)heartbeatPredicate
{
  return [MEMORY[0x263F08A98] predicateWithFormat:@"processIdentifier == %d AND subsystem == 'com.apple.dt.Instruments' AND category == 'heartbeat'", getpid()];
}

+ (void)heartbeat
{
  if (qword_268707F18 != -1) {
    dispatch_once(&qword_268707F18, &unk_26E515F70);
  }
  v2 = qword_268707F10;
  if (os_log_type_enabled((os_log_t)qword_268707F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23087D000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat", v3, 2u);
  }
}

- (DTOSLogLoader)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.dt.os_log-loader", 0);
  v19.receiver = self;
  v19.super_class = (Class)DTOSLogLoader;
  v4 = [(XRMobileAgentQueueStop *)&v19 initWithDispatchQueue:v3 funnelTarget:v3];
  v5 = v4;
  if (v4)
  {
    pthread_cond_init(&v4->_stateChanged, 0);
    pthread_mutex_init(&v5->_stateLock, 0);
    pthread_mutex_lock(&v5->_stateLock);
    sub_2308A3A4C(v5);
    uint64_t v6 = objc_opt_new();
    pushedProcessesByPid = v5->_pushedProcessesByPid;
    v5->_pushedProcessesByPid = (XRIntKeyedDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    repeatedStrings = v5->_repeatedStrings;
    v5->_repeatedStrings = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    repeatedUUIDs = v5->_repeatedUUIDs;
    v5->_repeatedUUIDs = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    repeatedPlaceholders = v5->_repeatedPlaceholders;
    v5->_repeatedPlaceholders = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:50];
    argReferenceConstants = v5->_argReferenceConstants;
    v5->_argReferenceConstants = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    pidToExecNameMapping = v5->_pidToExecNameMapping;
    v5->_pidToExecNameMapping = (XRIntKeyedDictionary *)v16;

    pthread_mutex_unlock(&v5->_stateLock);
  }

  return v5;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_stateLock);
  pthread_cond_destroy(&self->_stateChanged);
  v3.receiver = self;
  v3.super_class = (Class)DTOSLogLoader;
  [(DTOSLogLoader *)&v3 dealloc];
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    char v9 = [v8 needsHold];
    if (v9)
    {
      uint64_t v10 = [(XRMobileAgentQueueStop *)self _funnelQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308A3CF4;
      block[3] = &unk_264B8E540;
      id v13 = v8;
      id v14 = v6;
      v15 = self;
      dispatch_async(v10, block);
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)ticketToStartStream:(id)a3
{
  objc_super v3 = objc_opt_new();
  return v3;
}

- (id)ticketToPrepare:(id)a3 configuration:(id)a4
{
  id v4 = a4;
  v5 = objc_opt_new();
  [v5 setConfiguration:v4];

  return v5;
}

- (id)ticketToFetchData:(id)a3 window:(double)a4
{
  v5 = objc_opt_new();
  [v5 setWindowInSeconds:a4];
  return v5;
}

- (id)ticketToStopStream:(id)a3
{
  objc_super v3 = objc_opt_new();
  return v3;
}

- (void)_prepareAgentToExecute:(id)a3 withTicket:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 prepareAgent:v7 loader:self];
  }
}

- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 escortAgent:v7 loader:self];
  }
}

- (id)_stackReferenceForRepeatedString:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    char v9 = 0;
    goto LABEL_9;
  }
  v5 = [(NSMutableDictionary *)self->_repeatedStrings objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_7;
  }
  v5 = (_DWORD *)objc_opt_new();
  value = self->_tableLoader.__ptr_.__value_;
  id v7 = v4;
  unsigned int v8 = sub_2308A408C((size_t)value, (char *)[v7 UTF8String], 0xFFFFFFFFFFFFFFFFLL);
  v5[2] = v8;
  if (v8 >= 0x10000)
  {
    [(NSMutableDictionary *)self->_repeatedStrings setObject:v5 forKeyedSubscript:v7];
LABEL_7:
    v5 = v5;
    char v9 = v5;
    goto LABEL_8;
  }
  char v9 = 0;
LABEL_8:

LABEL_9:
  return v9;
}

- (id)_stackReferenceForRepeatedUUID:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_9;
  }
  v5 = [(NSMutableDictionary *)self->_repeatedUUIDs objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_7;
  }
  v9[0] = 0;
  v9[1] = 0;
  [v4 getUUIDBytes:v9];
  v5 = (_DWORD *)objc_opt_new();
  unsigned int v6 = sub_2308A4238((uint64_t)self->_tableLoader.__ptr_.__value_, v9);
  v5[2] = v6;
  if (v6 >= 0x10000)
  {
    [(NSMutableDictionary *)self->_repeatedUUIDs setObject:v5 forKeyedSubscript:v4];
LABEL_7:
    v5 = v5;
    id v7 = v5;
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_8:

LABEL_9:
  return v7;
}

- (void)_handleRecord:(id)a3
{
  uint64_t v270 = *MEMORY[0x263EF8340];
  id v237 = a3;
  p_stateLocuint64_t k = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  self->_didHandleRecord = 1;
  id v4 = [v237 subsystem];
  if ([v4 isEqualToString:@"com.apple.dt.Instruments"])
  {
    v5 = [v237 category];
    int v6 = [v5 isEqualToString:@"heartbeat"];

    if (v6)
    {
      if (self->_slackInMachTimeUnits)
      {
        unint64_t v7 = [v237 machContinuousTimestamp];
        unint64_t slackInMachTimeUnits = self->_slackInMachTimeUnits;
        BOOL v9 = v7 >= slackInMachTimeUnits;
        unint64_t v10 = v7 - slackInMachTimeUnits;
        if (!v9) {
          unint64_t v10 = 0;
        }
        if (self->_lastMachTime < v10) {
          self->_lastMachTime = v10;
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v236 = [v237 type];
  if (v236 == 1536 || [(DTOSLogLoaderConfiguration *)self->_configuration signpostConfig] != 1)
  {
    if (!self->_deserializedEventStream
      || (endTime = self->_endTime,
          [v237 date],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [(NSDate *)endTime compare:v12],
          v12,
          v13 != -1))
    {
      if (self->_ignoreNextRecord)
      {
        if (self->_encoder._state != 5) {
          self->_ignoreNextRecord = 0;
        }
LABEL_333:
        pthread_mutex_unlock(p_stateLock);
        goto LABEL_334;
      }
      if (self->_liveStream
        && !self->_calledForHelp
        && (uint64_t)(*(void *)(*((void *)self->_tableLoader.__ptr_.__value_ + 2) + 24)
                   - *(void *)(*((void *)self->_tableLoader.__ptr_.__value_ + 2) + 16)) <= 2047)
      {
        self->_calledForHelp = 1;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained logLoaderNeedsFetchNow:self];
      }
      value = self->_tableLoader.__ptr_.__value_;
      if (*(_DWORD *)(*((void *)value + 2) + 64) >= 0x13890000u)
      {
        [(DTOSLogLoader *)self _performResetOnOutputStream];
        value = self->_tableLoader.__ptr_.__value_;
      }
      sub_2308A6B94((uint64_t)value, 1);
      uint64_t v16 = [v237 threadIdentifier];
      int v17 = [v237 processIdentifier];
      uint64_t v263 = v16;
      int v264 = v17;
      v18 = sub_2308AC30C(&self->_pushedThreadsAndProcesses.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&v263);
      objc_super v19 = v18;
      v247 = self;
      if (v18)
      {
        id v20 = (id)v18[4];
        id v21 = (id)v19[5];
        v228 = (unsigned __int16 *)v20;
        v233 = (unsigned __int16 *)v21;
      }
      else
      {
        uint64_t v22 = v17;
        v234 = [(XRIntKeyedDictionary *)self->_pushedProcessesByPid objectAtIndexedSubscript:v17];
        if (!v234)
        {
          uint64_t v23 = objc_opt_new();
          StackReference topOfStackRef = self->_encoder._topOfStackRef;
          v24 = self->_tableLoader.__ptr_.__value_;
          LODWORD(v267) = v17;
          uint64_t v25 = *((void *)v24 + 2);
          *(void *)(v25 + 32) = &v267;
          *(void *)(v25 + 40) = (char *)&v267 + 4;
          sub_2308AACB8((uint64_t)v24);
          sub_2308A44FC((uint64_t)self->_tableLoader.__ptr_.__value_, &self->_deviceSessionRef._generation);
          sub_2308A46DC((uint64_t)self->_tableLoader.__ptr_.__value_, (unsigned int *)&topOfStackRef._generation);
          *(_DWORD *)(v23 + 8) = *(_DWORD *)(*((void *)self->_tableLoader.__ptr_.__value_ + 2) + 64);
          [(XRIntKeyedDictionary *)self->_pushedProcessesByPid setObject:v23 atIndexedSubscript:v17];
          if ([(DTOSLogLoaderConfiguration *)self->_configuration trackPidToExecNameMapping])
          {
            v26 = [v237 process];
            [(XRIntKeyedDictionary *)self->_pidToExecNameMapping setObject:v26 atIndexedSubscript:v22];
          }
          v234 = (unsigned __int16 *)v23;
        }
        v27 = (_DWORD *)objc_opt_new();
        StackReference topOfStackRef = self->_encoder._topOfStackRef;
        v28 = self->_tableLoader.__ptr_.__value_;
        *(void *)&long long v267 = v16;
        uint64_t v29 = *((void *)v28 + 2);
        *(void *)(v29 + 32) = &v267;
        *(void *)(v29 + 40) = (char *)&v267 + 8;
        sub_2308AACB8((uint64_t)v28);
        sub_2308A44FC((uint64_t)self->_tableLoader.__ptr_.__value_, v234 + 4);
        sub_2308A46DC((uint64_t)self->_tableLoader.__ptr_.__value_, (unsigned int *)&topOfStackRef._generation);
        v27[2] = *(_DWORD *)(*((void *)self->_tableLoader.__ptr_.__value_ + 2) + 64);
        v30 = v27;
        v31 = v234;
        *(void *)&long long v267 = &v263;
        v32 = sub_2308AC3D0((uint64_t)&self->_pushedThreadsAndProcesses, (uint64_t)&v263, (uint64_t)&unk_2309497FA, (_OWORD **)&v267);
        v33 = (void *)v32[4];
        v228 = v30;
        v32[4] = v30;

        v34 = (void *)v32[5];
        v32[5] = v31;

        v233 = v31;
      }
      sub_2308A6B94((uint64_t)self->_tableLoader.__ptr_.__value_, 2);
      v223 = [v237 signpostName];
      v219 = [v237 formatString];
      if ([v219 length])
      {
        v232 = [(DTOSLogLoader *)self _stackReferenceForRepeatedString:v219];
      }
      else
      {
        v232 = 0;
      }
      v35 = [v237 subsystem];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        uint64_t v37 = [v237 sender];
        v38 = (void *)v37;
        if (v37) {
          v39 = (__CFString *)v37;
        }
        else {
          v39 = @"Default";
        }
        v225 = v39;

        [(DTOSLogLoader *)self _stackReferenceForRepeatedString:v225];
      }
      else
      {
        v225 = [v237 subsystem];
        [(DTOSLogLoader *)self _stackReferenceForRepeatedString:v225];
      }
      v231 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = [v237 category];
      v41 = (void *)v40;
      if (v40) {
        v42 = (__CFString *)v40;
      }
      else {
        v42 = @"Default";
      }
      v224 = v42;

      v43 = self;
      v230 = [(DTOSLogLoader *)self _stackReferenceForRepeatedString:v224];
      v212 = [v237 senderImagePath];
      -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:");
      v221 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      v213 = [v237 processImagePath];
      -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:");
      v222 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      if ([(DTOSLogLoaderConfiguration *)self->_configuration columnInclusions])
      {
        v44 = [v237 senderImageUUID];
        v215 = [(DTOSLogLoader *)self _stackReferenceForRepeatedUUID:v44];
        v45 = [v237 sender];
        v216 = [(DTOSLogLoader *)self _stackReferenceForRepeatedString:v45];

        v43 = self;
      }
      else
      {
        v215 = 0;
        v216 = 0;
      }
      if (([(DTOSLogLoaderConfiguration *)v43->_configuration columnInclusions] & 2) != 0)
      {
        v46 = [v237 timeZone];
        v47 = [v46 name];
        v217 = [(DTOSLogLoader *)v43 _stackReferenceForRepeatedString:v47];

        v43 = self;
      }
      else
      {
        v217 = 0;
      }
      uint64_t v48 = [v237 machContinuousTimestamp];
      unint64_t machTimeAdjustment = v43->_machTimeAdjustment;
      v50 = [v237 decomposedMessage];
      v241 = v50;
      if (v50) {
        unint64_t v51 = [v50 placeholderCount];
      }
      else {
        unint64_t v51 = 0;
      }
      v52 = [v241 literalPrefixAtIndex:v51];
      v214 = v52;
      if (v52 && [v52 length])
      {
        v226 = [(DTOSLogLoader *)v43 _stackReferenceForRepeatedString:v214];
      }
      else
      {
        v226 = 0;
      }
      unint64_t v229 = machTimeAdjustment + v48;
      unint64_t v242 = v51;
      while (v51 > [(NSMutableArray *)v43->_argReferenceConstants count])
      {
        argReferenceConstants = v43->_argReferenceConstants;
        v54 = objc_opt_new();
        [(NSMutableArray *)argReferenceConstants addObject:v54];

        v43 = self;
        unint64_t v51 = v242;
      }
      if (v51)
      {
        id v227 = 0;
        unint64_t v55 = 0;
        unint64_t v218 = v51;
        while (1)
        {
          uint64_t v243 = [(NSMutableArray *)v43->_argReferenceConstants objectAtIndexedSubscript:v55];
          v56 = [v241 placeholderAtIndex:v55];
          long long v260 = 0u;
          long long v261 = 0u;
          long long v258 = 0u;
          long long v259 = 0u;
          v238 = v56;
          v57 = [v56 tokens];
          uint64_t v58 = [v57 countByEnumeratingWithState:&v258 objects:v269 count:16];
          unint64_t v240 = v55;
          if (v58)
          {
            v245 = 0;
            v59 = 0;
            uint64_t v60 = *(void *)v259;
            do
            {
              for (uint64_t i = 0; i != v58; ++i)
              {
                if (*(void *)v259 != v60) {
                  objc_enumerationMutation(v57);
                }
                uint64_t v62 = *(void *)(*((void *)&v258 + 1) + 8 * i);
                v63 = [(NSMutableDictionary *)v247->_repeatedPlaceholders objectForKeyedSubscript:v62];
                if (v63
                  || (v63 = [[DTOSLogArgumentPlaceholderDescription alloc] initWithPlaceholderToken:v62], [(NSMutableDictionary *)v247->_repeatedPlaceholders setObject:v63 forKeyedSubscript:v62], v63))
                {
                  if (v59 || [(DTOSLogArgumentPlaceholderDescription *)v63 placeholderKind] != 2)
                  {
                    if (!v245)
                    {
                      if ([(DTOSLogArgumentPlaceholderDescription *)v63 placeholderKind] == 1)
                      {
                        v245 = [(DTOSLogArgumentPlaceholderDescription *)v63 placeholderObjectValue];
                      }
                      else
                      {
                        v245 = 0;
                      }
                    }
                  }
                  else
                  {
                    v59 = [(DTOSLogArgumentPlaceholderDescription *)v63 placeholderObjectValue];
                  }
                }
              }
              uint64_t v58 = [v57 countByEnumeratingWithState:&v258 objects:v269 count:16];
            }
            while (v58);
          }
          else
          {
            v245 = 0;
            v59 = 0;
          }

          v64 = [v241 argumentAtIndex:v240];
          if (!v238) {
            goto LABEL_123;
          }
          v65 = [v241 literalPrefixAtIndex:v240];
          uint64_t v66 = [(DTOSLogLoader *)v247 _stackReferenceForRepeatedString:v65];
          v67 = *(void **)(v243 + 24);
          *(void *)(v243 + 24) = v66;

          v68 = *(void **)(v243 + 16);
          *(void *)(v243 + 16) = 0;

          v69 = *(void **)(v243 + 8);
          *(void *)(v243 + 8) = 0;

          v70 = *(void **)(v243 + 32);
          *(void *)(v243 + 32) = 0;

          *(unsigned char *)(v243 + 50) = 0;
          *(_WORD *)(v243 + 48) = 0;
          v71 = v59;
          if (v59) {
            goto LABEL_84;
          }
          if (v240 <= 0x12) {
            break;
          }
          [NSString stringWithFormat:@"arg%d", v240];
          id v72 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
          v73 = v72;
          uint64_t v74 = [(DTOSLogLoader *)v247 _stackReferenceForRepeatedString:v72];
          v75 = *(void **)(v243 + 32);
          *(void *)(v243 + 32) = v74;

          v76 = v245;
          v77 = v247;
          if (v76) {
            goto LABEL_86;
          }
          uint64_t v85 = [v64 category];
          if (v85 != 1)
          {
            if (v85 == 2)
            {
              v76 = @"string";
              goto LABEL_86;
            }
            if (v85 == 3)
            {
              v86 = [v64 objectRepresentation];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                v76 = @"data";
              }
              else {
                v76 = @"string";
              }
LABEL_103:
              v77 = v247;
              goto LABEL_86;
            }
LABEL_131:
            v76 = 0;
            goto LABEL_86;
          }
          uint64_t v98 = [v64 scalarCategory];
          if ((unint64_t)(v98 - 3) < 2)
          {
            v76 = @"fixed-decimal";
          }
          else
          {
            if ((unint64_t)(v98 - 1) > 1) {
              goto LABEL_131;
            }
            v99 = [v238 rawString];
            char v100 = [v99 isEqualToString:@"%p"];

            v76 = @"address";
            v77 = v247;
            if ((v100 & 1) == 0)
            {
              v101 = [v238 rawString];
              if ([v101 containsString:@"x"])
              {

                v76 = @"uint64-hex-lowercase";
              }
              else
              {
                v102 = [v238 rawString];
                int v103 = [v102 containsString:@"X"];

                if (v103) {
                  v76 = @"uint64-hex-lowercase";
                }
                else {
                  v76 = @"uint64";
                }
              }
              goto LABEL_103;
            }
          }
LABEL_86:
          if ([v64 availability] == 2)
          {

            v76 = @"private";
            v77 = v247;
          }
          else if (!v76)
          {
            int v78 = 0;
            goto LABEL_90;
          }
          int v78 = XREngineeringTypeIDForMnemonic();
LABEL_90:
          uint64_t v79 = [(DTOSLogLoader *)v77 _stackReferenceForRepeatedString:v76];
          v80 = *(void **)(v243 + 8);
          *(void *)(v243 + 8) = v79;

          *(_WORD *)(v243 + 48) = v78;
          if (!*(void *)(v243 + 8) || !v64) {
            goto LABEL_122;
          }
          uint64_t v81 = [v64 category];
          if (v81 == 3)
          {
            if (v78 != 163 || [v64 category] != 3) {
              goto LABEL_122;
            }
            v82 = [v64 objectRepresentation];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_121;
            }
            id v88 = v82;
            BOOL v89 = [(DTOSLogLoaderConfiguration *)v247->_configuration enableBacktraceReplacement];
            if (v227) {
              BOOL v90 = 0;
            }
            else {
              BOOL v90 = v89;
            }
            if (v90)
            {
              id v227 = v88;
              *(unsigned char *)(v243 + 50) = 1;
              --v218;
            }
            unint64_t v91 = [v88 length];
            id v84 = v88;
            uint64_t v92 = [v84 bytes];
            if (v91 >= 0x14)
            {
              uint64_t v93 = v92;
              if (v91 / 0x14 <= 1) {
                unint64_t v94 = 1;
              }
              else {
                unint64_t v94 = v91 / 0x14;
              }
              do
              {
                long long v95 = *(_OWORD *)v93;
                int v268 = *(_DWORD *)(v93 + 16);
                long long v267 = v95;
                v96 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v267];
                id v97 = [(DTOSLogLoader *)v247 _stackReferenceForRepeatedUUID:v96];

                v93 += 20;
                --v94;
              }
              while (v94);
            }
            v82 = v84;
            goto LABEL_120;
          }
          if (v81 != 2 || v78 == 193) {
            goto LABEL_122;
          }
          v82 = [v64 objectRepresentation];
          if ((unint64_t)[v82 length] >= 0x11)
          {
            uint64_t v83 = [(DTOSLogLoader *)v247 _stackReferenceForRepeatedString:v82];
            id v84 = *(id *)(v243 + 16);
            *(void *)(v243 + 16) = v83;
LABEL_120:
          }
LABEL_121:

LABEL_122:
LABEL_123:

          unint64_t v55 = v240 + 1;
          v43 = v247;
          if (v240 + 1 == v242) {
            goto LABEL_137;
          }
        }
        v71 = *(&off_264B8E560 + v240);
LABEL_84:
        id v72 = v71;
        goto LABEL_85;
      }
      id v227 = 0;
      unint64_t v218 = 0;
LABEL_137:
      v104 = [(DTOSLogLoader *)v43 _stackReferenceForRepeatedString:@"narrative-text"];
      StackReference topOfStackRef = (StackReference)v104[2];

      if (v223)
      {
        v105 = v247;
        -[DTOSLogLoader _stackReferenceForRepeatedString:](v247, "_stackReferenceForRepeatedString:");
        v246 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v246 = 0;
        v105 = v247;
      }
      unint64_t v106 = v242;
      v107 = [v237 backtrace];
      if (v107)
      {
        v244 = v107;
        v108 = [v107 frames];
        BOOL v109 = (unint64_t)[v108 count] < 2;

        if (!v109)
        {
          if (v227)
          {
            char v220 = 0;
            BOOL v239 = 1;
          }
          else
          {
            long long v257 = 0u;
            long long v255 = 0u;
            long long v256 = 0u;
            long long v254 = 0u;
            [v244 frames];
            v111 = v110 = v247;
            uint64_t v112 = [v111 countByEnumeratingWithState:&v254 objects:v266 count:16];
            if (v112)
            {
              uint64_t v113 = *(void *)v255;
              do
              {
                for (uint64_t j = 0; j != v112; ++j)
                {
                  if (*(void *)v255 != v113) {
                    objc_enumerationMutation(v111);
                  }
                  v115 = [*(id *)(*((void *)&v254 + 1) + 8 * j) imageUUID];
                  id v116 = [(DTOSLogLoader *)v110 _stackReferenceForRepeatedUUID:v115];

                  v110 = v247;
                }
                uint64_t v112 = [v111 countByEnumeratingWithState:&v254 objects:v266 count:16];
              }
              while (v112);
            }

            BOOL v239 = 0;
            char v220 = 0;
          }
          v105 = v247;
          unint64_t v106 = v242;
LABEL_155:
          sub_2308A6B94((uint64_t)v105->_tableLoader.__ptr_.__value_, 100);
          if (v106)
          {
            uint64_t v117 = 0;
            while (1)
            {
              v118 = [v241 placeholderAtIndex:v117];
              v119 = [v241 argumentAtIndex:v117];
              uint64_t v120 = [(NSMutableArray *)v105->_argReferenceConstants objectAtIndexedSubscript:v117];
              uint64_t v121 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              unsigned int v253 = *(_DWORD *)(*(void *)(v121 + 16) + 64);
              if (!*(unsigned char *)(v120 + 50)) {
                break;
              }
LABEL_168:

              ++v117;
              unint64_t v106 = v242;
              v105 = v247;
              if (v242 == v117) {
                goto LABEL_197;
              }
            }
            if (!v118 || !v119)
            {
              sub_2308A4644(v121);
LABEL_167:
              uint64_t v126 = objc_opt_new();
              v127 = *(void **)(v120 + 40);
              *(void *)(v120 + 40) = v126;

              *(_DWORD *)(*(void *)(v120 + 40) + 8) = *(_DWORD *)(*((void *)v247->_tableLoader.__ptr_.__value_ + 2)
                                                                    + 64);
              goto LABEL_168;
            }
            int v122 = *(unsigned __int16 *)(v120 + 48);
            uint64_t v123 = *(void *)(v120 + 8);
            if (v123) {
              sub_2308A44FC(v121, (unsigned __int16 *)(v123 + 8));
            }
            else {
              sub_2308A4644(v121);
            }
            if (*(_WORD *)(v120 + 48) == 248)
            {
              uint64_t v124 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              LODWORD(v267) = 0;
              uint64_t v125 = *(void *)(v124 + 16);
              *(void *)(v125 + 32) = &v267;
              *(void *)(v125 + 40) = (char *)&v267 + 4;
              sub_2308AACB8(v124);
LABEL_166:
              sub_2308A46DC((uint64_t)v105->_tableLoader.__ptr_.__value_, &v253);
              goto LABEL_167;
            }
            uint64_t v128 = [v119 category];
            if ((unint64_t)(v128 - 2) >= 2)
            {
              if (v128)
              {
                if (v128 == 1)
                {
                  unint64_t v129 = [v119 scalarType] - 13;
                  uint64_t v130 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                  if (v129 > 1)
                  {
                    *(void *)&long long v267 = [v119 unsignedInt64Value];
                  }
                  else
                  {
                    [v119 doubleValue];
                    *(void *)&long long v267 = v131;
                  }
                  uint64_t v132 = *(void *)(v130 + 16);
                  *(void *)(v132 + 32) = &v267;
                  *(void *)(v132 + 40) = (char *)&v267 + 8;
                  sub_2308AACB8(v130);
                }
              }
              else
              {
                sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
              }
              goto LABEL_166;
            }
            uint64_t v133 = *(void *)(v120 + 16);
            if (v133)
            {
              sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned __int16 *)(v133 + 8));
              goto LABEL_166;
            }
            v134 = [v119 objectRepresentation];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v135 = v134;
              v136 = v135;
              if (v122 == 163)
              {
                sub_2308A4310((uint64_t *)v105, v135);
              }
              else
              {
                if (v122 != 135 || (v105 = v247, [v135 length] != 16))
                {
                  uint64_t v140 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                  id v141 = v136;
                  sub_2308A6C68(v140, (char *)[v141 bytes], [v141 length]);
LABEL_194:

                  goto LABEL_195;
                }
                long long v267 = 0uLL;
                [v136 getBytes:&v267 length:16];
                sub_2308A4238((uint64_t)v247->_tableLoader.__ptr_.__value_, (unint64_t *)&v267);
              }
            }
            else
            {
              if (!v134)
              {
                sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
LABEL_195:

                v105 = v247;
                goto LABEL_166;
              }
              v137 = [v134 description];
              v136 = v137;
              if (v137)
              {
                if (v122 != 193)
                {
                  size_t v142 = (size_t)v105->_tableLoader.__ptr_.__value_;
                  id v141 = v137;
                  sub_2308A6D8C(v142, (char *)[v141 UTF8String], 0xFFFFFFFFFFFFFFFFLL);
                  goto LABEL_194;
                }
                v138 = [v137 dataUsingEncoding:4];
                uint64_t v211 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                id v139 = v138;
                sub_2308A6C68(v211, (char *)[v139 bytes], [v139 length]);
              }
              else
              {
                sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
              }
            }
            id v141 = v136;
            goto LABEL_194;
          }
LABEL_197:
          v143 = v105->_tableLoader.__ptr_.__value_;
          *((_DWORD *)v143 + 6) = *(_DWORD *)(*((void *)v143 + 2) + 64);
          *((unsigned char *)v143 + 8) = 1;
          uint64_t v144 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
          *(void *)&long long v267 = v229;
          uint64_t v145 = *(void *)(v144 + 16);
          *(void *)(v145 + 32) = &v267;
          *(void *)(v145 + 40) = (char *)&v267 + 8;
          sub_2308AACB8(v144);
          sub_2308A6E00((uint64_t)v105->_tableLoader.__ptr_.__value_);
          v105->_lastMachTime = v229;
          uint64_t v146 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
          if (v233) {
            sub_2308A44FC(v146, v233 + 4);
          }
          else {
            sub_2308A4644(v146);
          }
          uint64_t v147 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
          if (v228) {
            sub_2308A44FC(v147, v228 + 4);
          }
          else {
            sub_2308A4644(v147);
          }
          if (v236 == 1536)
          {
            unint64_t v148 = [v237 signpostType];
            if (v148 < 3)
            {
              v149 = off_264B8E8C8[v148];
LABEL_218:
              sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned __int16 *)((char *)v105 + *v149));
LABEL_219:
              uint64_t v151 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              if (v232) {
                sub_2308A44FC(v151, v232 + 4);
              }
              else {
                sub_2308A4644(v151);
              }
              if (v239)
              {
                sub_2308A4310((uint64_t *)v105, v227);
              }
              else if (v220)
              {
                sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
              }
              else
              {
                unsigned int v253 = *(_DWORD *)(*((void *)v105->_tableLoader.__ptr_.__value_ + 2) + 64);
                long long v249 = 0u;
                long long v250 = 0u;
                long long v251 = 0u;
                long long v252 = 0u;
                v152 = [v244 frames];
                uint64_t v153 = [v152 countByEnumeratingWithState:&v249 objects:v265 count:16];
                if (v153)
                {
                  uint64_t v154 = *(void *)v250;
                  do
                  {
                    for (uint64_t k = 0; k != v153; ++k)
                    {
                      if (*(void *)v250 != v154) {
                        objc_enumerationMutation(v152);
                      }
                      v156 = *(void **)(*((void *)&v249 + 1) + 8 * k);
                      unsigned int v248 = *(_DWORD *)(*((void *)v247->_tableLoader.__ptr_.__value_ + 2) + 64);
                      v157 = [v156 imageUUID];
                      v158 = [(DTOSLogLoader *)v247 _stackReferenceForRepeatedUUID:v157];

                      uint64_t v159 = (uint64_t)v247->_tableLoader.__ptr_.__value_;
                      if (v158) {
                        sub_2308A44FC(v159, v158 + 4);
                      }
                      else {
                        sub_2308A4644(v159);
                      }
                      if ((unint64_t)[v156 imageOffset] >> 32)
                      {
                        sub_2308A4644((uint64_t)v247->_tableLoader.__ptr_.__value_);
                      }
                      else
                      {
                        int v160 = [v156 imageOffset];
                        uint64_t v161 = (uint64_t)v247->_tableLoader.__ptr_.__value_;
                        LODWORD(v267) = v160;
                        uint64_t v162 = *(void *)(v161 + 16);
                        *(void *)(v162 + 32) = &v267;
                        *(void *)(v162 + 40) = (char *)&v267 + 4;
                        sub_2308AACB8(v161);
                      }
                      sub_2308A46DC((uint64_t)v247->_tableLoader.__ptr_.__value_, &v248);
                    }
                    uint64_t v153 = [v152 countByEnumeratingWithState:&v249 objects:v265 count:16];
                  }
                  while (v153);
                }

                v105 = v247;
                sub_2308A46DC((uint64_t)v247->_tableLoader.__ptr_.__value_, &v253);
                unint64_t v106 = v242;
              }
              uint64_t v163 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              if (v231) {
                sub_2308A44FC(v163, v231 + 4);
              }
              else {
                sub_2308A4644(v163);
              }
              uint64_t v164 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              if (v230) {
                sub_2308A44FC(v164, v230 + 4);
              }
              else {
                sub_2308A4644(v164);
              }
              uint64_t v165 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              if (v221) {
                sub_2308A44FC(v165, v221 + 4);
              }
              else {
                sub_2308A4644(v165);
              }
              uint64_t v166 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              if (v222) {
                sub_2308A44FC(v166, v222 + 4);
              }
              else {
                sub_2308A4644(v166);
              }
              unsigned int v253 = *(_DWORD *)(*((void *)v105->_tableLoader.__ptr_.__value_ + 2) + 64);
              if (v106)
              {
                uint64_t v167 = 0;
                do
                {
                  uint64_t v168 = [(NSMutableArray *)v105->_argReferenceConstants objectAtIndexedSubscript:v167];
                  v169 = (void *)v168;
                  if (!*(unsigned char *)(v168 + 50))
                  {
                    if (*(void *)(v168 + 24))
                    {
                      uint64_t v170 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      LODWORD(v267) = *(_DWORD *)(*(void *)(v170 + 16) + 64);
                      sub_2308A44FC(v170, &topOfStackRef._generation);
                      sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned __int16 *)(v169[3] + 8));
                      sub_2308A46DC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned int *)&v267);
                    }
                    uint64_t v171 = v169[5];
                    uint64_t v172 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                    if (v171) {
                      sub_2308A44FC(v172, (unsigned __int16 *)(v171 + 8));
                    }
                    else {
                      sub_2308A4644(v172);
                    }
                  }

                  ++v167;
                  unint64_t v106 = v242;
                  v105 = v247;
                }
                while (v242 != v167);
              }
              if (v226)
              {
                uint64_t v173 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                LODWORD(v267) = *(_DWORD *)(*(void *)(v173 + 16) + 64);
                sub_2308A44FC(v173, &topOfStackRef._generation);
                sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, v226 + 4);
                sub_2308A46DC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned int *)&v267);
                uint64_t v174 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
              }
              else
              {
                uint64_t v174 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                if (!v218)
                {
                  sub_2308A4644(v174);
LABEL_265:
                  if (v236 != 1536)
                  {
LABEL_278:
                    if ([(DTOSLogLoaderConfiguration *)v105->_configuration columnInclusions])
                    {
                      uint64_t v180 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      if (v215) {
                        sub_2308A44FC(v180, v215 + 4);
                      }
                      else {
                        sub_2308A4644(v180);
                      }
                      uint64_t v181 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      *(void *)&long long v267 = [v237 senderImageOffset];
                      uint64_t v182 = *(void *)(v181 + 16);
                      *(void *)(v182 + 32) = &v267;
                      *(void *)(v182 + 40) = (char *)&v267 + 8;
                      sub_2308AACB8(v181);
                      uint64_t v183 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      if (v216) {
                        sub_2308A44FC(v183, v216 + 4);
                      }
                      else {
                        sub_2308A4644(v183);
                      }
                    }
                    if (([(DTOSLogLoaderConfiguration *)v105->_configuration columnInclusions] & 2) != 0)
                    {
                      uint64_t v184 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      if (v217) {
                        sub_2308A44FC(v184, v217 + 4);
                      }
                      else {
                        sub_2308A4644(v184);
                      }
                      uint64_t v185 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      v186 = [v237 date];
                      [v186 timeIntervalSince1970];
                      *(void *)&long long v267 = v187;
                      uint64_t v188 = *(void *)(v185 + 16);
                      *(void *)(v188 + 32) = &v267;
                      *(void *)(v188 + 40) = (char *)&v267 + 8;
                      sub_2308AACB8(v185);

                      v105 = v247;
                      unint64_t v106 = v242;
                    }
                    sub_2308A6E98(v105->_tableLoader.__ptr_.__value_, 2 * (v236 == 1536));
                    ++v105->_rowsSent;
                    if (v106)
                    {
                      uint64_t v189 = 0;
                      do
                      {
                        v190 = [v241 placeholderAtIndex:v189];
                        v191 = [v241 argumentAtIndex:v189];
                        uint64_t v192 = [(NSMutableArray *)v105->_argReferenceConstants objectAtIndexedSubscript:v189];
                        if (*(unsigned char *)(v192 + 50)) {
                          BOOL v193 = 1;
                        }
                        else {
                          BOOL v193 = v190 == 0;
                        }
                        if (!v193 && v191 != 0)
                        {
                          v195 = v105->_tableLoader.__ptr_.__value_;
                          *((_DWORD *)v195 + 6) = *(_DWORD *)(*((void *)v195 + 2) + 64);
                          *((unsigned char *)v195 + 8) = 1;
                          uint64_t v196 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          *(void *)&long long v267 = v229;
                          uint64_t v197 = *(void *)(v196 + 16);
                          *(void *)(v197 + 32) = &v267;
                          *(void *)(v197 + 40) = (char *)&v267 + 8;
                          sub_2308AACB8(v196);
                          sub_2308A6E00((uint64_t)v105->_tableLoader.__ptr_.__value_);
                          uint64_t v198 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          if (v233) {
                            sub_2308A44FC(v198, v233 + 4);
                          }
                          else {
                            sub_2308A4644(v198);
                          }
                          sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, v228 + 4);
                          uint64_t v199 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          if (v232) {
                            sub_2308A44FC(v199, v232 + 4);
                          }
                          else {
                            sub_2308A4644(v199);
                          }
                          uint64_t v200 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          if (v231) {
                            sub_2308A44FC(v200, v231 + 4);
                          }
                          else {
                            sub_2308A4644(v200);
                          }
                          uint64_t v201 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          if (v230) {
                            sub_2308A44FC(v201, v230 + 4);
                          }
                          else {
                            sub_2308A4644(v201);
                          }
                          uint64_t v202 = *(void *)(v192 + 32);
                          uint64_t v203 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                          if (v202) {
                            sub_2308A44FC(v203, (unsigned __int16 *)(v202 + 8));
                          }
                          else {
                            sub_2308A4644(v203);
                          }
                          uint64_t v204 = *(void *)(v192 + 40);
                          if (v204)
                          {
                            uint64_t v205 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                            LODWORD(v267) = *(_DWORD *)(*(void *)(v205 + 16) + 64);
                            sub_2308A44FC(v205, (unsigned __int16 *)(v204 + 8));
                            sub_2308A46DC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned int *)&v267);
                          }
                          else
                          {
                            sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
                          }
                          v206 = v105->_tableLoader.__ptr_.__value_;
                          if (v236 == 1536)
                          {
                            *(void *)&long long v267 = [v237 signpostIdentifier];
                            uint64_t v207 = *((void *)v206 + 2);
                            *(void *)(v207 + 32) = &v267;
                            *(void *)(v207 + 40) = (char *)&v267 + 8;
                            sub_2308AACB8((uint64_t)v206);
                            uint64_t v208 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                            if (v246) {
                              sub_2308A44FC(v208, v246 + 4);
                            }
                            else {
                              sub_2308A4644(v208);
                            }
                            v206 = v105->_tableLoader.__ptr_.__value_;
                            unsigned int v209 = 3;
                          }
                          else
                          {
                            unsigned int v209 = 1;
                          }
                          sub_2308A6E98(v206, v209);
                          ++v105->_rowsSent;
                        }

                        ++v189;
                        v105 = v247;
                      }
                      while (v242 != v189);
                    }
                    sub_2308AAF04(*((void *)v105->_tableLoader.__ptr_.__value_ + 2), (v218 << 8) | 0x6A, v218, 0);
                    uint64_t v210 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                    if (**(_DWORD **)(v210 + 16) == 5) {
                      v105->_ignoreNextRecord = 1;
                    }
                    sub_2308A6B94(v210, 200);
                    if (!v105->_slackInMachTimeUnits && v105->_lastMachTime < v229) {
                      v105->_lastMachTime = v229;
                    }

                    goto LABEL_333;
                  }
                  uint64_t v175 = [v237 signpostScope];
                  switch(v175)
                  {
                    case 192:
                      v176 = &OBJC_IVAR___DTOSLogLoader__systemScopeRef;
                      break;
                    case 128:
                      v176 = &OBJC_IVAR___DTOSLogLoader__processScopeRef;
                      break;
                    case 64:
                      v176 = &OBJC_IVAR___DTOSLogLoader__threadScopeRef;
                      break;
                    default:
                      sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
LABEL_275:
                      uint64_t v177 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      *(void *)&long long v267 = [v237 signpostIdentifier];
                      uint64_t v178 = *(void *)(v177 + 16);
                      *(void *)(v178 + 32) = &v267;
                      *(void *)(v178 + 40) = (char *)&v267 + 8;
                      sub_2308AACB8(v177);
                      uint64_t v179 = (uint64_t)v105->_tableLoader.__ptr_.__value_;
                      if (v246) {
                        sub_2308A44FC(v179, v246 + 4);
                      }
                      else {
                        sub_2308A4644(v179);
                      }
                      goto LABEL_278;
                  }
                  sub_2308A44FC((uint64_t)v105->_tableLoader.__ptr_.__value_, (unsigned __int16 *)((char *)v105 + *v176));
                  goto LABEL_275;
                }
              }
              sub_2308A46DC(v174, &v253);
              goto LABEL_265;
            }
          }
          else
          {
            uint64_t v150 = [v237 logType];
            if (v150 <= 1)
            {
              if (!v150)
              {
                v149 = &OBJC_IVAR___DTOSLogLoader__defaultLevelRef;
                goto LABEL_218;
              }
              if (v150 == 1)
              {
                v149 = &OBJC_IVAR___DTOSLogLoader__infoLevelRef;
                goto LABEL_218;
              }
            }
            else
            {
              switch(v150)
              {
                case 2:
                  v149 = &OBJC_IVAR___DTOSLogLoader__debugLevelRef;
                  goto LABEL_218;
                case 16:
                  v149 = &OBJC_IVAR___DTOSLogLoader__errorLevelRef;
                  goto LABEL_218;
                case 17:
                  v149 = &OBJC_IVAR___DTOSLogLoader__faultLevelRef;
                  goto LABEL_218;
              }
            }
          }
          sub_2308A4644((uint64_t)v105->_tableLoader.__ptr_.__value_);
          goto LABEL_219;
        }

        v105 = v247;
        unint64_t v106 = v242;
      }
      v244 = 0;
      BOOL v239 = v227 != 0;
      char v220 = 1;
      goto LABEL_155;
    }
    [(OSLogEventStreamBase *)self->_deserializedEventStream invalidate];
  }
LABEL_22:
  pthread_mutex_unlock(p_stateLock);
LABEL_334:
}

- (void)_performResetOnOutputStream
{
  sub_2308A7B90((uint64_t)self->_tableLoader.__ptr_.__value_);
  objc_super v3 = MEMORY[0x263EF8438];
  id v4 = MEMORY[0x263EF8438];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_23093D440();
  }

  v5 = (char *)operator new(0x58uLL);
  uint64_t v112 = v5 + 88;
  uint64_t v113 = v5 + 88;
  *((_OWORD *)v5 + 2) = xmmword_264B8E618;
  *((_OWORD *)v5 + 3) = *(_OWORD *)&off_264B8E628;
  *((_OWORD *)v5 + 4) = xmmword_264B8E638;
  *((void *)v5 + 10) = "message";
  *(_OWORD *)v5 = xmmword_264B8E5F8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)&off_264B8E608;
  __p = v5;
  int v6 = (char *)operator new(0x70uLL);
  unint64_t v106 = v6 + 112;
  v110 = v6 + 112;
  *((_OWORD *)v6 + 4) = xmmword_264B8E690;
  *((_OWORD *)v6 + 5) = *(_OWORD *)&off_264B8E6A0;
  *((_OWORD *)v6 + 6) = xmmword_264B8E6B0;
  *(_OWORD *)int v6 = xmmword_264B8E650;
  *((_OWORD *)v6 + 1) = *(_OWORD *)&off_264B8E660;
  *((_OWORD *)v6 + 2) = xmmword_264B8E670;
  *((_OWORD *)v6 + 3) = *(_OWORD *)&off_264B8E680;
  v104 = v6;
  if ([(DTOSLogLoaderConfiguration *)self->_configuration columnInclusions])
  {
    unint64_t v7 = v112;
    if (v112 >= v113)
    {
      uint64_t v9 = (v112 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v9 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v10 = (v113 - (unsigned char *)__p) >> 2;
      if (v10 <= v9 + 1) {
        unint64_t v10 = v9 + 1;
      }
      if ((unint64_t)(v113 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      if (v11) {
        uint64_t v12 = (char *)sub_2308AC8DC((uint64_t)&v113, v11);
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = &v12[8 * v9];
      id v14 = &v12[8 * v11];
      *(void *)uint64_t v13 = "sender-image-uuid";
      unsigned int v8 = v13 + 8;
      uint64_t v16 = (char *)__p;
      v15 = v112;
      if (v112 != __p)
      {
        do
        {
          uint64_t v17 = *((void *)v15 - 1);
          v15 -= 8;
          *((void *)v13 - 1) = v17;
          v13 -= 8;
        }
        while (v15 != v16);
        v15 = (char *)__p;
      }
      __p = v13;
      uint64_t v112 = v8;
      uint64_t v113 = v14;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      *(void *)uint64_t v112 = "sender-image-uuid";
      unsigned int v8 = v7 + 8;
    }
    uint64_t v112 = v8;
    if (v8 >= v113)
    {
      uint64_t v19 = (v8 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v19 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v20 = (v113 - (unsigned char *)__p) >> 2;
      if (v20 <= v19 + 1) {
        unint64_t v20 = v19 + 1;
      }
      if ((unint64_t)(v113 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v20;
      }
      if (v21) {
        uint64_t v22 = (char *)sub_2308AC8DC((uint64_t)&v113, v21);
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v23 = &v22[8 * v19];
      v24 = &v22[8 * v21];
      *(void *)uint64_t v23 = "sender-image-offset";
      v18 = v23 + 8;
      v26 = (char *)__p;
      uint64_t v25 = v112;
      if (v112 != __p)
      {
        do
        {
          uint64_t v27 = *((void *)v25 - 1);
          v25 -= 8;
          *((void *)v23 - 1) = v27;
          v23 -= 8;
        }
        while (v25 != v26);
        uint64_t v25 = (char *)__p;
      }
      __p = v23;
      uint64_t v112 = v18;
      uint64_t v113 = v24;
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      *(void *)unsigned int v8 = "sender-image-offset";
      v18 = v8 + 8;
    }
    uint64_t v112 = v18;
    if (v18 >= v113)
    {
      uint64_t v29 = (v18 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v29 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v30 = (v113 - (unsigned char *)__p) >> 2;
      if (v30 <= v29 + 1) {
        unint64_t v30 = v29 + 1;
      }
      if ((unint64_t)(v113 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        v32 = (char *)sub_2308AC8DC((uint64_t)&v113, v31);
      }
      else {
        v32 = 0;
      }
      v33 = &v32[8 * v29];
      v34 = &v32[8 * v31];
      *(void *)v33 = "sender-image-name";
      v28 = v33 + 8;
      BOOL v36 = (char *)__p;
      v35 = v112;
      if (v112 != __p)
      {
        do
        {
          uint64_t v37 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v33 - 1) = v37;
          v33 -= 8;
        }
        while (v35 != v36);
        v35 = (char *)__p;
      }
      __p = v33;
      uint64_t v112 = v28;
      uint64_t v113 = v34;
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      *(void *)v18 = "sender-image-name";
      v28 = v18 + 8;
    }
    uint64_t v112 = v28;
    if (v106 >= v110)
    {
      uint64_t v39 = (v106 - v104) >> 3;
      if ((unint64_t)(v39 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v40 = (v110 - v104) >> 2;
      if (v40 <= v39 + 1) {
        unint64_t v40 = v39 + 1;
      }
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v41 = v40;
      }
      if (v41) {
        v42 = (char *)sub_2308AC8DC((uint64_t)&v110, v41);
      }
      else {
        v42 = 0;
      }
      v43 = &v42[8 * v39];
      v44 = &v42[8 * v41];
      *(void *)v43 = "sender-image-uuid";
      v38 = v43 + 8;
      v45 = v106;
      if (v106 != v104)
      {
        do
        {
          uint64_t v46 = *((void *)v45 - 1);
          v45 -= 8;
          *((void *)v43 - 1) = v46;
          v43 -= 8;
        }
        while (v45 != v104);
        v45 = v104;
      }
      v104 = v43;
      v110 = v44;
      if (v45) {
        operator delete(v45);
      }
    }
    else
    {
      *(void *)unint64_t v106 = "sender-image-uuid";
      v38 = v106 + 8;
    }
    v107 = v38;
    if (v38 >= v110)
    {
      uint64_t v48 = (v38 - v104) >> 3;
      if ((unint64_t)(v48 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v49 = (v110 - v104) >> 2;
      if (v49 <= v48 + 1) {
        unint64_t v49 = v48 + 1;
      }
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v50 = v49;
      }
      if (v50) {
        unint64_t v51 = (char *)sub_2308AC8DC((uint64_t)&v110, v50);
      }
      else {
        unint64_t v51 = 0;
      }
      v52 = &v51[8 * v48];
      v53 = &v51[8 * v50];
      *(void *)v52 = "sender-image-offset";
      v47 = v52 + 8;
      v54 = v107;
      if (v107 != v104)
      {
        do
        {
          uint64_t v55 = *((void *)v54 - 1);
          v54 -= 8;
          *((void *)v52 - 1) = v55;
          v52 -= 8;
        }
        while (v54 != v104);
        v54 = v104;
      }
      v104 = v52;
      v110 = v53;
      if (v54) {
        operator delete(v54);
      }
    }
    else
    {
      *(void *)v38 = "sender-image-offset";
      v47 = v38 + 8;
    }
    v108 = v47;
    if (v47 >= v110)
    {
      uint64_t v57 = (v47 - v104) >> 3;
      if ((unint64_t)(v57 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v58 = (v110 - v104) >> 2;
      if (v58 <= v57 + 1) {
        unint64_t v58 = v57 + 1;
      }
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v59 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v59 = v58;
      }
      if (v59) {
        uint64_t v60 = (char *)sub_2308AC8DC((uint64_t)&v110, v59);
      }
      else {
        uint64_t v60 = 0;
      }
      v61 = &v60[8 * v57];
      uint64_t v62 = &v60[8 * v59];
      *(void *)v61 = "sender-image-name";
      v56 = v61 + 8;
      v63 = v108;
      if (v108 != v104)
      {
        do
        {
          uint64_t v64 = *((void *)v63 - 1);
          v63 -= 8;
          *((void *)v61 - 1) = v64;
          v61 -= 8;
        }
        while (v63 != v104);
        v63 = v104;
      }
      v104 = v61;
      v110 = v62;
      if (v63) {
        operator delete(v63);
      }
    }
    else
    {
      *(void *)v47 = "sender-image-name";
      v56 = v47 + 8;
    }
    unint64_t v106 = v56;
  }
  if (([(DTOSLogLoaderConfiguration *)self->_configuration columnInclusions] & 2) != 0)
  {
    v65 = v112;
    if (v112 >= v113)
    {
      uint64_t v67 = (v112 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v67 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v68 = (v113 - (unsigned char *)__p) >> 2;
      if (v68 <= v67 + 1) {
        unint64_t v68 = v67 + 1;
      }
      if ((unint64_t)(v113 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v69 = v68;
      }
      if (v69) {
        v70 = (char *)sub_2308AC8DC((uint64_t)&v113, v69);
      }
      else {
        v70 = 0;
      }
      v71 = &v70[8 * v67];
      id v72 = &v70[8 * v69];
      *(void *)v71 = "timezone-name";
      uint64_t v66 = v71 + 8;
      uint64_t v74 = (char *)__p;
      v73 = v112;
      if (v112 != __p)
      {
        do
        {
          uint64_t v75 = *((void *)v73 - 1);
          v73 -= 8;
          *((void *)v71 - 1) = v75;
          v71 -= 8;
        }
        while (v73 != v74);
        v73 = (char *)__p;
      }
      __p = v71;
      uint64_t v112 = v66;
      uint64_t v113 = v72;
      if (v73) {
        operator delete(v73);
      }
    }
    else
    {
      *(void *)uint64_t v112 = "timezone-name";
      uint64_t v66 = v65 + 8;
    }
    uint64_t v112 = v66;
    if (v66 >= v113)
    {
      uint64_t v77 = (v66 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v77 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v78 = (v113 - (unsigned char *)__p) >> 2;
      if (v78 <= v77 + 1) {
        unint64_t v78 = v77 + 1;
      }
      if ((unint64_t)(v113 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v79 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v79 = v78;
      }
      if (v79) {
        v80 = (char *)sub_2308AC8DC((uint64_t)&v113, v79);
      }
      else {
        v80 = 0;
      }
      uint64_t v81 = &v80[8 * v77];
      v82 = &v80[8 * v79];
      *(void *)uint64_t v81 = "unix-time-interval";
      v76 = v81 + 8;
      id v84 = (char *)__p;
      uint64_t v83 = v112;
      if (v112 != __p)
      {
        do
        {
          uint64_t v85 = *((void *)v83 - 1);
          v83 -= 8;
          *((void *)v81 - 1) = v85;
          v81 -= 8;
        }
        while (v83 != v84);
        uint64_t v83 = (char *)__p;
      }
      __p = v81;
      uint64_t v112 = v76;
      uint64_t v113 = v82;
      if (v83) {
        operator delete(v83);
      }
    }
    else
    {
      *(void *)uint64_t v66 = "unix-time-interval";
      v76 = v66 + 8;
    }
    uint64_t v112 = v76;
    if (v106 >= v110)
    {
      uint64_t v87 = (v106 - (char *)v105) >> 3;
      if ((unint64_t)(v87 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v88 = (v110 - (char *)v105) >> 2;
      if (v88 <= v87 + 1) {
        unint64_t v88 = v87 + 1;
      }
      if ((unint64_t)(v110 - (char *)v105) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v89 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v89 = v88;
      }
      if (v89) {
        BOOL v90 = (char *)sub_2308AC8DC((uint64_t)&v110, v89);
      }
      else {
        BOOL v90 = 0;
      }
      unint64_t v91 = &v90[8 * v87];
      uint64_t v92 = &v90[8 * v89];
      *(void *)unint64_t v91 = "timezone-name";
      v86 = v91 + 8;
      uint64_t v93 = (const char **)v106;
      if (v106 != (char *)v105)
      {
        do
        {
          uint64_t v94 = (uint64_t)*--v93;
          *((void *)v91 - 1) = v94;
          v91 -= 8;
        }
        while (v93 != v105);
        uint64_t v93 = v105;
      }
      v105 = (const char **)v91;
      v110 = v92;
      if (v93) {
        operator delete(v93);
      }
    }
    else
    {
      *(void *)unint64_t v106 = "timezone-name";
      v86 = v106 + 8;
    }
    BOOL v109 = (const char **)v86;
    if (v86 >= v110)
    {
      uint64_t v96 = (v86 - (char *)v105) >> 3;
      if ((unint64_t)(v96 + 1) >> 61) {
        sub_23089D164();
      }
      unint64_t v97 = (v110 - (char *)v105) >> 2;
      if (v97 <= v96 + 1) {
        unint64_t v97 = v96 + 1;
      }
      if ((unint64_t)(v110 - (char *)v105) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v98 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v98 = v97;
      }
      if (v98) {
        v99 = (char *)sub_2308AC8DC((uint64_t)&v110, v98);
      }
      else {
        v99 = 0;
      }
      char v100 = (const char **)&v99[8 * v96];
      v101 = &v99[8 * v98];
      *char v100 = "unix-time-interval";
      int v95 = v100 + 8;
      v102 = v109;
      if (v109 != v105)
      {
        do
        {
          int v103 = *--v102;
          *--char v100 = v103;
        }
        while (v102 != v105);
        v102 = v105;
      }
      v105 = v100;
      v110 = v101;
      if (v102) {
        operator delete(v102);
      }
    }
    else
    {
      *(void *)v86 = "unix-time-interval";
      int v95 = v86 + 8;
    }
    LODWORD(v106) = v95;
  }
  sub_2308A7C3C(self->_tableLoader.__ptr_.__value_, 0, (uint64_t)"os-log", 6, 0, 0, (const char **)__p, ((v112 - __p) >> 3));
  sub_2308A7C3C(self->_tableLoader.__ptr_.__value_, 1u, (uint64_t)"os-log-arg", 10, 0, 0, (const char **)off_264B8E6C0, 8u);
  sub_2308A7C3C(self->_tableLoader.__ptr_.__value_, 2u, (uint64_t)"os-signpost", 11, 0, 0, v105, ((v106 - v105) >> 3));
  sub_2308A7C3C(self->_tableLoader.__ptr_.__value_, 3u, (uint64_t)"os-signpost-arg", 15, 0, 0, (const char **)off_264B8E700, 0xAu);
  self->_deviceSessionRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "TODO", 0xFFFFFFFFFFFFFFFFLL);
  self->_defaultLevelRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Default", 0xFFFFFFFFFFFFFFFFLL);
  self->_debugLevelRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Debug", 0xFFFFFFFFFFFFFFFFLL);
  self->_infoLevelRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Info", 0xFFFFFFFFFFFFFFFFLL);
  self->_errorLevelRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Error", 0xFFFFFFFFFFFFFFFFLL);
  self->_faultLevelRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Fault", 0xFFFFFFFFFFFFFFFFLL);
  self->_beginRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Begin", 0xFFFFFFFFFFFFFFFFLL);
  self->_emitRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Event", 0xFFFFFFFFFFFFFFFFLL);
  self->_endRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "End", 0xFFFFFFFFFFFFFFFFLL);
  self->_threadScopeRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Thread", 0xFFFFFFFFFFFFFFFFLL);
  self->_processScopeRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "Process", 0xFFFFFFFFFFFFFFFFLL);
  self->_systemScopeRef = (StackReference)sub_2308A408C((size_t)self->_tableLoader.__ptr_.__value_, "System", 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableDictionary *)self->_repeatedStrings removeAllObjects];
  [(NSMutableDictionary *)self->_repeatedUUIDs removeAllObjects];
  [(NSMutableArray *)self->_argReferenceConstants removeAllObjects];
  [(XRIntKeyedDictionary *)self->_pushedProcessesByPid removeAllObjects];
  sub_2308AC914((uint64_t)&self->_pushedThreadsAndProcesses);
  if (v105) {
    operator delete(v105);
  }
  if (__p)
  {
    uint64_t v112 = (char *)__p;
    operator delete(__p);
  }
}

- (void)_setupCommonStreamParameters:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = (OSLogEventLiveStream *)a3;
  unint64_t v5 = [(DTOSLogLoaderConfiguration *)self->_configuration signpostConfig];
  if (v5)
  {
    if (v5 == 1)
    {
      BOOL v7 = self->_liveStream == v4;
      uint64_t v6 = 1012;
      uint64_t v8 = 500;
    }
    else
    {
      uint64_t v6 = 212;
      BOOL v7 = v5 == 2;
      uint64_t v8 = 215;
    }
    if (v7) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v6;
    }
  }
  else
  {
    uint64_t v9 = 247;
  }
  char v10 = [(DTOSLogLoaderConfiguration *)self->_configuration loaderExclusions];
  char v11 = [(DTOSLogLoaderConfiguration *)self->_configuration loaderExclusions];
  uint64_t v12 = v9 & 0x3F6;
  if ((v10 & 1) == 0) {
    uint64_t v12 = v9;
  }
  if ((v11 & 2) != 0) {
    uint64_t v13 = v12 & 0x3F5;
  }
  else {
    uint64_t v13 = v12;
  }
  id v14 = [(DTOSLogLoaderConfiguration *)self->_configuration filterPredicate];
  [(OSLogEventLiveStream *)v4 setFilterPredicate:v14];
  v15 = [(OSLogEventLiveStream *)v4 filterPredicate];

  [(DTOSLogLoaderConfiguration *)self->_configuration setFilterPredicate:v15];
  if (v15)
  {
    if (self->_liveStream == v4)
    {
      uint64_t v17 = +[DTOSLogLoader heartbeatPredicate];
      v18 = (void *)MEMORY[0x263F08730];
      v22[0] = v15;
      v22[1] = v17;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      uint64_t v16 = [v18 orPredicateWithSubpredicates:v19];
    }
    else
    {
      uint64_t v16 = v15;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  [(OSLogEventLiveStream *)v4 setFilterPredicate:v16];
  [(OSLogEventLiveStream *)v4 setFlags:v13];
  [(OSLogEventLiveStream *)v4 setTarget:MEMORY[0x263EF83A0]];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2308A8128;
  v21[3] = &unk_264B8E758;
  v21[4] = self;
  [(OSLogEventLiveStream *)v4 setEventHandler:v21];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2308A8398;
  v20[3] = &unk_264B8E7A8;
  v20[4] = self;
  [(OSLogEventLiveStream *)v4 setInvalidationHandler:v20];
}

- (id)_setupLoggedStreamForNextChunk:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DTOSLogLoaderConfiguration *)self->_configuration signpostConfig];
  switch(v5)
  {
    case 0uLL:
      goto LABEL_4;
    case 1uLL:
      uint64_t v6 = [objc_alloc(MEMORY[0x263F52750]) initWithSource:v4 skipNonSignpostFiles:1];
      goto LABEL_6;
    case 2uLL:
LABEL_4:
      uint64_t v6 = [objc_alloc(MEMORY[0x263F52750]) initWithSource:v4];
LABEL_6:
      BOOL v7 = (void *)v6;
      goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:
  objc_storeStrong((id *)&self->_loggedStream, v7);
  [(DTOSLogLoader *)self _setupCommonStreamParameters:v7];

  return v7;
}

- (void)_setupLiveStream:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (OSLogEventLiveStream *)[objc_alloc(MEMORY[0x263F52740]) initWithLiveSource:v4];
  liveStream = self->_liveStream;
  self->_liveStream = v5;

  objc_initWeak(&location, self);
  BOOL v7 = self->_liveStream;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2308A88F8;
  v10[3] = &unk_264B8E7D0;
  objc_copyWeak(&v11, &location);
  [(OSLogEventLiveStream *)v7 setDroppedEventHandler:v10];
  [(DTOSLogLoader *)self _setupCommonStreamParameters:self->_liveStream];
  if (mach_timebase_info(&info)) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = 5000000 * (unint64_t)info.denom / info.numer;
  }
  self->_unint64_t slackInMachTimeUnits = v8;
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  p_stateLocuint64_t k = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  self->_workingBufferCanBeReplaced = 0;
  pthread_cond_signal(&self->_stateChanged);
  pthread_mutex_unlock(p_stateLock);
}

- (NSError)failureReason
{
  return self->_failureReason;
}

- (DTOSLogLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DTOSLogLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pidToExecNameMapping, 0);
  objc_storeStrong((id *)&self->_argReferenceConstants, 0);
  objc_storeStrong((id *)&self->_repeatedPlaceholders, 0);
  objc_storeStrong((id *)&self->_repeatedUUIDs, 0);
  objc_storeStrong((id *)&self->_repeatedStrings, 0);
  sub_2308AC9B8((uint64_t)&self->_pushedThreadsAndProcesses);
  objc_storeStrong((id *)&self->_pushedProcessesByPid, 0);
  objc_storeStrong((id *)&self->_workingBuffer, 0);
  objc_storeStrong((id *)&self->_agentWaitingForEvents, 0);
  value = self->_tableLoader.__ptr_.__value_;
  self->_tableLoader.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(DTOSLogTableLoader *))(*(void *)value + 16))(value);
  }
  objc_storeStrong((id *)&self->_lastFetchTicket, 0);
  objc_storeStrong((id *)&self->_agentWaitingForStop, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_liveStream, 0);
  objc_storeStrong((id *)&self->_liveEventStore, 0);
  objc_storeStrong((id *)&self->_loggedStream, 0);
  objc_storeStrong((id *)&self->_loggedEventStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_deserializedEventStream, 0);
}

- (id).cxx_construct
{
  *((void *)self + 32) = 0;
  *((_DWORD *)self + 66) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 34) = 0;
  *((_DWORD *)self + 82) = 0;
  *((_DWORD *)self + 92) = 0;
  *((_DWORD *)self + 93) = 0;
  *((_DWORD *)self + 94) = 0;
  *((_DWORD *)self + 95) = 0;
  *((_DWORD *)self + 96) = 0;
  *((_DWORD *)self + 97) = 0;
  *((_DWORD *)self + 98) = 0;
  *((_DWORD *)self + 99) = 0;
  *((_DWORD *)self + 100) = 0;
  *((_DWORD *)self + 101) = 0;
  *((_DWORD *)self + 102) = 0;
  *((_DWORD *)self + 103) = 0;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *((_DWORD *)self + 114) = 1065353216;
  return self;
}

@end