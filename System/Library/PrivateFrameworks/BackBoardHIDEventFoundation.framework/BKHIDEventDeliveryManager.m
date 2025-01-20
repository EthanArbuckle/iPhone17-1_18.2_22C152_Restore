@interface BKHIDEventDeliveryManager
- (BKHIDEventBufferingHIDSystem)bufferingDispatcher;
- (BKHIDEventDeliveryManager)init;
- (BKHIDEventDeliveryManager)initWithObserverService:(id)a3;
- (BKHIDEventDeliveryResolutionObserver)resolutionObserver;
- (BKSHIDEventAuthenticationOriginator)authenticationOriginator;
- (BKSHIDEventDisplay)mainDisplay;
- (NSDictionary)currentBuffersPerDispatchTarget;
- (id)_lock_clientWithPID:(int)a3 createIfNeeded:;
- (id)_lock_destinationsForEvent:(void *)a3 sender:;
- (id)_lock_destinationsForKeyCommand:(void *)a3 sender:(void *)a4 transcript:;
- (id)_lock_processDescriptionForPID:(uint64_t)a1;
- (id)_lock_resolveDeferringChainForPID:(void *)a3 display:(void *)a4 environment:(void *)a5 dispatchingTarget:(void *)a6 getTargetOrder:;
- (id)_lock_resolveEventDescriptor:(void *)a3 senderDescriptor:(void *)a4 transcript:;
- (id)_test_deliveryRootForIdentifier:(id)a3;
- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3;
- (id)deliveryGraphDescription;
- (id)descriptionOfResolutionPathForEventDescriptor:(id)a3 senderDescriptor:(id)a4;
- (id)descriptionOfResolutionPathForKeyCommand:(id)a3 senderDescriptor:(id)a4;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 sender:(id)a4;
- (id)destinationsForKeyCommand:(id)a3 sender:(id)a4;
- (id)destinationsStartingFromPID:(int)a3 deferringPredicate:(id)a4;
- (id)sequenceForFirstEvent:(__IOHIDEvent *)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7;
- (id)sequenceForKeyCommand:(id)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7;
- (void)_fireTimeoutForPID:(int)a3 bufferingPredicates:(id)a4 client:(id)a5;
- (void)_lock_notifyObserversForReason:(void *)a3 chainsMayUpdate:;
- (void)_lock_setDeferringRules:(int)a3 forClientWithPID:;
- (void)_lock_setDispatchingRoots:(int)a3 forClientWithPID:;
- (void)_lock_setEventBufferingPredicates:(uint64_t)a3 forClientWithPID:;
- (void)_lock_setKeyCommandRoots:(int)a3 forClientWithPID:;
- (void)_lock_setKeyCommandsRegistrations:(int)a3 forClientWithPID:;
- (void)_recursiveAppendNodes:(unint64_t *)a3 index:(void *)a4 toGraphDescription:;
- (void)dealloc;
- (void)forceSelectDeferringTarget:(id)a3 forEnvironment:(id)a4 forClientWithPID:(int)a5;
- (void)processDidTerminate:(int)a3;
- (void)reevaluateBufferingWithContext:(id)a3;
- (void)selectDeferringPredicate:(id)a3 forClientWithPID:(int)a4;
- (void)setActiveUIResponders:(id)a3 forClientWithPID:(int)a4;
- (void)setBufferingDispatcher:(id)a3;
- (void)setDeferringRules:(id)a3 forClientWithPID:(int)a4;
- (void)setDispatchingRoots:(id)a3 forClientWithPID:(int)a4;
- (void)setEventBufferingPredicates:(id)a3 forClientWithPID:(int)a4;
- (void)setKeyCommandRoots:(id)a3 forClientWithPID:(int)a4;
- (void)setKeyCommandsRegistrations:(id)a3 forClientWithPID:(int)a4;
- (void)setMainDisplay:(id)a3;
- (void)setResolutionObserver:(id)a3;
@end

@implementation BKHIDEventDeliveryManager

- (void)reevaluateBufferingWithContext:(id)a3
{
  v3 = self;
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  id v119 = a3;
  os_unfair_lock_lock(p_lock);
  p_isa = (id *)&v3->super.isa;
  locuint64_t k = p_lock;
  if (v3)
  {
    os_unfair_lock_assert_owner(p_lock);
    id v123 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v126 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v128 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v132 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    *(_OWORD *)v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    obuint64_t j = v3->_deliveryRoots;
    uint64_t v124 = [(NSMutableArray *)obj countByEnumeratingWithState:v182 objects:v186 count:16];
    if (!v124) {
      goto LABEL_67;
    }
    uint64_t v122 = *(void *)v183;
    do
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v125 = v5;
        if (*(void *)v183 != v122)
        {
          objc_enumerationMutation(obj);
          uint64_t v5 = v125;
        }
        uint64_t v6 = *(void *)(*(void *)&v182[8] + 8 * v5);
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        if (v6) {
          v7 = *(void **)(v6 + 32);
        }
        else {
          v7 = 0;
        }
        id v127 = [v7 allValues];
        uint64_t v134 = [v127 countByEnumeratingWithState:&v166 objects:&v178 count:16];
        if (v134)
        {
          id v8 = 0;
          id v130 = *(id *)v167;
          while (1)
          {
            uint64_t v9 = 0;
            do
            {
              if (*(id *)v167 != v130) {
                objc_enumerationMutation(v127);
              }
              v10 = *(void **)(*((void *)&v166 + 1) + 8 * v9);
              id v11 = v132;
              v12 = v10;
              id v146 = v11;
              uint64_t v137 = v9;
              v136 = v10;
              if (v10) {
                v12 = (void *)v10[4];
              }
              id v13 = v12;
              v14 = [v13 firstObject];
              id v139 = v8;
              if (v14) {
                uint64_t v15 = v14[3];
              }
              else {
                uint64_t v15 = 0;
              }

              v16 = [NSNumber numberWithInt:v15];
              [v146 addObject:v16];

              v17 = [(BSMutableIntegerMap *)v3->_bufferingPredicatesByPID objectForKey:(int)v15];
              long long v170 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v173 = 0u;
              id v141 = v13;
              uint64_t v148 = [v141 countByEnumeratingWithState:&v170 objects:v194 count:16];
              if (!v148)
              {
                id v160 = 0;
                char v155 = 0;
                goto LABEL_49;
              }
              id v160 = 0;
              char v155 = 0;
              os_log_t log = *(os_log_t *)v171;
              do
              {
                uint64_t v18 = 0;
                do
                {
                  if (*(os_log_t *)v171 != log) {
                    objc_enumerationMutation(v141);
                  }
                  v19 = *(void **)(*((void *)&v170 + 1) + 8 * v18);
                  if (v19) {
                    v19 = (void *)v19[2];
                  }
                  v150 = v19;
                  v20 = [v150 predicate];
                  *(_OWORD *)v187 = 0u;
                  long long v188 = 0u;
                  long long v189 = 0u;
                  long long v190 = 0u;
                  id v163 = v17;
                  uint64_t v21 = [v163 countByEnumeratingWithState:v187 objects:v191 count:16];
                  uint64_t v152 = v18;
                  if (v21)
                  {
                    uint64_t v22 = v21;
                    uint64_t v157 = v15;
                    uint64_t v23 = *(void *)v188;
                    do
                    {
                      for (uint64_t i = 0; i != v22; ++i)
                      {
                        if (*(void *)v188 != v23) {
                          objc_enumerationMutation(v163);
                        }
                        v25 = *(void **)(*(void *)&v187[8] + 8 * i);
                        v26 = [v20 environment];
                        v27 = [v20 display];
                        v28 = [v20 token];
                        id v29 = v25;
                        id v30 = v27;
                        id v31 = v28;
                        id v32 = v26;
                        v33 = [v29 environment];
                        int v34 = [v32 isEqual:v33];

                        if (v34)
                        {
                          v35 = [v29 display];
                          if (_BKHIDEventDeferringDisplayMatch(v35, v30))
                          {
                            v36 = [v29 token];
                            if (!v36 || BSEqualObjects())
                            {

                              v37 = BKLogEventDeliveryBuffering();
                              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 138543618;
                                v175 = v20;
                                __int16 v176 = 2114;
                                *(void *)v177 = v29;
                                _os_log_debug_impl(&dword_1CFDE2000, v37, OS_LOG_TYPE_DEBUG, "  BUFFER: rule:%{public}@ is match with bufferingPredicate:%{public}@", buf, 0x16u);
                              }

                              id v38 = v160;
                              if (!v160)
                              {
                                id v38 = [MEMORY[0x1E4F1CA80] set];
                              }
                              v39 = [NSNumber numberWithInt:v157];
                              id v160 = v38;
                              [v38 addObject:v39];
                              char v155 = 1;
                              goto LABEL_43;
                            }
                          }
                        }

                        v39 = BKLogEventDeliveryBuffering();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138543618;
                          v175 = v20;
                          __int16 v176 = 2114;
                          *(void *)v177 = v29;
                          _os_log_debug_impl(&dword_1CFDE2000, v39, OS_LOG_TYPE_DEBUG, "  BUFFER: rule:%{public}@ is NO match with bufferingPredicate:%{public}@", buf, 0x16u);
                        }
LABEL_43:
                      }
                      uint64_t v22 = [v163 countByEnumeratingWithState:v187 objects:v191 count:16];
                    }
                    while (v22);
                  }

                  v40 = [v150 target];
                  uint64_t v15 = [v40 pid];

                  v41 = [NSNumber numberWithInt:v15];
                  [v146 addObject:v41];

                  v3 = (BKHIDEventDeliveryManager *)p_isa;
                  v17 = [p_isa[10] objectForKey:(int)v15];

                  uint64_t v18 = v152 + 1;
                }
                while (v152 + 1 != v148);
                uint64_t v148 = [v141 countByEnumeratingWithState:&v170 objects:v194 count:16];
              }
              while (v148);
LABEL_49:

              id v8 = v160;
              v42 = v136;
              if (v136) {
                v42 = (void *)v136[2];
              }
              id v43 = v42;
              if ([v8 count]) {
                [v128 setObject:v8 forKey:v43];
              }
              if (v155)
              {
                [v126 addObject:v43];
                v44 = BKLogEventDeliveryBuffering();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  [MEMORY[0x1E4F4F720] descriptionForRootObject:v8];
                  v46 = id v45 = v8;
                  *(_DWORD *)v194 = 138543618;
                  *(void *)v195 = v46;
                  *(_WORD *)&v195[8] = 2114;
                  *(void *)&v195[10] = v43;
                  _os_log_debug_impl(&dword_1CFDE2000, v44, OS_LOG_TYPE_DEBUG, "  BUFFER: --> we should buffer this target at the request of %{public}@: %{public}@", v194, 0x16u);

                  id v8 = v45;
                }
              }
              else
              {
                v44 = BKLogEventDeliveryBuffering();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v194 = 138543362;
                  *(void *)v195 = v43;
                  _os_log_debug_impl(&dword_1CFDE2000, v44, OS_LOG_TYPE_DEBUG, "  BUFFER: --> we should NOT buffer this target: %{public}@", v194, 0xCu);
                }
              }

              uint64_t v9 = v137 + 1;
            }
            while (v137 + 1 != v134);
            uint64_t v47 = [v127 countByEnumeratingWithState:&v166 objects:&v178 count:16];
            uint64_t v134 = v47;
            if (!v47)
            {

              break;
            }
          }
        }

        uint64_t v5 = v125 + 1;
      }
      while (v125 + 1 != v124);
      uint64_t v48 = [(NSMutableArray *)obj countByEnumeratingWithState:v182 objects:v186 count:16];
      uint64_t v124 = v48;
    }
    while (v48);
LABEL_67:

    v49 = (void *)[v126 mutableCopy];
    buffersByDispatchTarget = v3->_buffersByDispatchTarget;
    if (buffersByDispatchTarget)
    {
      v51 = [(NSMutableDictionary *)buffersByDispatchTarget allKeys];
      [v49 addObjectsFromArray:v51];
    }
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v161 = v49;
    uint64_t v53 = [v161 countByEnumeratingWithState:&v170 objects:v194 count:16];
    v158 = v52;
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v164 = *(void *)v171;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v171 != v164) {
            objc_enumerationMutation(v161);
          }
          v56 = *(void **)(*((void *)&v170 + 1) + 8 * j);
          v57 = BKLogEventDeliveryBuffering();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            int v74 = [v126 containsObject:v56];
            *(_DWORD *)v191 = 138543618;
            *(void *)&v191[4] = v56;
            *(_WORD *)&v191[12] = 1024;
            *(_DWORD *)&v191[14] = v74;
            _os_log_debug_impl(&dword_1CFDE2000, v57, OS_LOG_TYPE_DEBUG, "  BUFFER: --> eval target: %{public}@ enable:%{BOOL}u", v191, 0x12u);
          }

          int v58 = [v126 containsObject:v56];
          v59 = [v128 objectForKey:v56];
          id v60 = v56;
          id v61 = v59;
          id v62 = v123;
          id v63 = v52;
          v64 = [p_isa[7] objectForKey:v60];
          v65 = v64;
          if (v64) {
            int v66 = 0;
          }
          else {
            int v66 = v58;
          }
          if ((v58 & 1) != 0 || !v64)
          {
            if (v66)
            {
LABEL_90:
              if (!p_isa[7])
              {
                id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                id v72 = p_isa[7];
                p_isa[7] = v71;
              }
              v65 = [[BKHIDEventBuffer alloc] initWithDispatchTarget:v60];
              [p_isa[7] setObject:v65 forKey:v60];
              [(BKHIDEventBuffer *)v65 setBufferingPIDs:v61];
              v73 = BKLogEventDeliveryBuffering();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v187 = 138543362;
                *(void *)&v187[4] = v65;
                _os_log_impl(&dword_1CFDE2000, v73, OS_LOG_TYPE_DEFAULT, "adding buffer %{public}@", v187, 0xCu);
              }

              [v63 setObject:v65 forKey:v60];
            }
            else
            {
              if (!v64) {
                goto LABEL_98;
              }
              [(BKHIDEventBuffer *)v64 setBufferingPIDs:v61];
            }

            goto LABEL_98;
          }
          [v62 addObject:v64];
          [p_isa[7] removeObjectForKey:v60];
          v67 = [(BKHIDEventBuffer *)v65 bufferingPIDs];
          *(void *)v191 = MEMORY[0x1E4F143A8];
          *(void *)&v191[8] = 3221225472;
          *(void *)&v191[16] = __109__BKHIDEventDeliveryManager__lock_enableBuffering_dispatchTarget_ownerPIDs_buffersToDrain_targetToNewBuffer___block_invoke;
          v192 = &unk_1E6870F70;
          v193 = p_isa;
          char v68 = objc_msgSend(v67, "bs_containsObjectPassingTest:", v191);

          if ((v68 & 1) == 0)
          {
            [(BKHIDEventBuffer *)v65 setAllBufferingClientsTerminated:1];
            v69 = BKLogEventDeliveryBuffering();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v187 = 0;
              _os_log_debug_impl(&dword_1CFDE2000, v69, OS_LOG_TYPE_DEBUG, "  BUFFER: all clients terminated", v187, 2u);
            }
          }
          v70 = BKLogEventDeliveryBuffering();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v187 = 138543362;
            *(void *)&v187[4] = v65;
            _os_log_impl(&dword_1CFDE2000, v70, OS_LOG_TYPE_DEFAULT, "removing buffer %{public}@", v187, 0xCu);
          }

          id v52 = v158;
          if (v66) {
            goto LABEL_90;
          }
LABEL_98:
        }
        uint64_t v54 = [v161 countByEnumeratingWithState:&v170 objects:v194 count:16];
      }
      while (v54);
    }

    long long v189 = 0u;
    long long v190 = 0u;
    *(_OWORD *)v187 = 0u;
    long long v188 = 0u;
    id v75 = v123;
    uint64_t v76 = [v75 countByEnumeratingWithState:v187 objects:v191 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v188;
      do
      {
        for (uint64_t k = 0; k != v77; ++k)
        {
          if (*(void *)v188 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = *(void **)(*(void *)&v187[8] + 8 * k);
          v81 = [v80 bufferingPIDs];
          int v82 = [v81 intersectsSet:v132];

          v83 = BKLogEventDeliveryBuffering();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            v84 = (void *)MEMORY[0x1E4F4F720];
            v85 = [v80 bufferingPIDs];
            v86 = [v84 descriptionForRootObject:v85];
            v87 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v132];
            *(_DWORD *)buf = 138543874;
            v175 = v86;
            __int16 v176 = 1024;
            *(_DWORD *)v177 = v82;
            *(_WORD *)&v177[4] = 2114;
            *(void *)&v177[6] = v87;
            _os_log_debug_impl(&dword_1CFDE2000, v83, OS_LOG_TYPE_DEBUG, "  BUFFER: --> %{public}@ intersects:(%{BOOL}u) %{public}@", buf, 0x1Cu);
          }
          if ((v82 & 1) == 0) {
            [v80 setAllBufferingClientsTerminated:1];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:v187 objects:v191 count:16];
      }
      while (v77);
    }

    if ([v158 count]) {
      id v88 = v158;
    }
    else {
      id v88 = 0;
    }
    v3 = (BKHIDEventDeliveryManager *)p_isa;
  }
  else
  {
    id v88 = 0;
    id v75 = 0;
  }
  id v89 = v88;
  os_unfair_lock_unlock(lock);
  v90 = [NSString stringWithFormat:@"reevaluate (%@)", v119];

  id v131 = v75;
  id v91 = v89;
  id v129 = v90;
  if (v3)
  {
    os_unfair_lock_assert_not_owner(lock);
    v156 = v3->_bufferingDispatcher;
    unint64_t v92 = 0x1E4F1C000uLL;
    if ([v131 count])
    {
      v93 = BKLogEventDeliveryBuffering();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        int v94 = [v131 count];
        *(_DWORD *)v194 = 67109378;
        *(_DWORD *)v195 = v94;
        *(_WORD *)&v195[4] = 2114;
        *(void *)&v195[6] = v129;
        _os_log_impl(&dword_1CFDE2000, v93, OS_LOG_TYPE_DEFAULT, "draining %d buffers (%{public}@)", v194, 0x12u);
      }
    }
    if ([v91 count]) {
      [(BKHIDEventBufferingHIDSystem *)v156 bufferingDidAddNewBuffers:v91];
    }
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v140 = v131;
    uint64_t v95 = [v140 countByEnumeratingWithState:&v178 objects:v194 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v179;
      uint64_t v133 = *(void *)v179;
      id v135 = v91;
      do
      {
        id v98 = 0;
        uint64_t v138 = v96;
        do
        {
          if (*(void *)v179 != v97) {
            objc_enumerationMutation(v140);
          }
          v99 = *(void **)(*((void *)&v178 + 1) + 8 * (void)v98);
          [(BKHIDEventBufferingHIDSystem *)v156 bufferWillBeginDraining:v99];
          v159 = v99;
          LOBYTE(v99) = [v99 hasEvents];
          loga = BKLogEventDeliveryBuffering();
          BOOL v100 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
          if (v99)
          {
            id v142 = v98;
            if (v100)
            {
              *(_DWORD *)v182 = 134217984;
              *(void *)&v182[4] = v159;
              _os_log_impl(&dword_1CFDE2000, loga, OS_LOG_TYPE_DEFAULT, "BUFFER: --> will drain %p ", v182, 0xCu);
            }

            v101 = [v159 drainAllEvents];
            v102 = [v159 dispatchTarget];
            id v151 = objc_alloc_init(*(Class *)(v92 + 2656));
            long long v170 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v173 = 0u;
            loga = v101;
            uint64_t v149 = [loga countByEnumeratingWithState:&v170 objects:v191 count:16];
            if (v149)
            {
              uint64_t v147 = *(void *)v171;
              do
              {
                uint64_t v103 = 0;
                do
                {
                  if (*(void *)v171 != v147) {
                    objc_enumerationMutation(loga);
                  }
                  uint64_t v154 = v103;
                  v104 = *(void **)(*((void *)&v170 + 1) + 8 * v103);
                  uint64_t v105 = [v104 event];
                  id v162 = [v104 additionalContext];
                  v165 = [v104 sender];
                  v106 = [v104 sequence];
                  uint64_t v107 = [v106 keyCommand];
                  v108 = [v151 objectForKey:v106];
                  if (!v108)
                  {
                    v109 = [v165 senderDescriptor];
                    if (v107) {
                      [p_isa destinationsForKeyCommand:v107 sender:v109];
                    }
                    else {
                    v108 = [p_isa destinationsForEvent:v105 sender:v109];
                    }

                    [v151 setObject:v108 forKey:v106];
                  }
                  v153 = (void *)v107;
                  long long v189 = 0u;
                  long long v190 = 0u;
                  *(_OWORD *)v187 = 0u;
                  long long v188 = 0u;
                  id v110 = v108;
                  uint64_t v111 = [v110 countByEnumeratingWithState:v187 objects:v186 count:16];
                  if (v111)
                  {
                    uint64_t v112 = v111;
                    uint64_t v113 = *(void *)v188;
                    do
                    {
                      for (uint64_t m = 0; m != v112; ++m)
                      {
                        if (*(void *)v188 != v113) {
                          objc_enumerationMutation(v110);
                        }
                        v115 = *(void **)(*(void *)&v187[8] + 8 * m);
                        v116 = [v115 dispatchingTarget];
                        int v117 = [v116 isEqual:v102];

                        if (v117) {
                          [(BKHIDEventBufferingHIDSystem *)v156 buffer:v159 drainEvent:v105 withContext:v162 sender:v165 sequence:v106 toResolution:v115];
                        }
                      }
                      uint64_t v112 = [v110 countByEnumeratingWithState:v187 objects:v186 count:16];
                    }
                    while (v112);
                  }

                  uint64_t v103 = v154 + 1;
                }
                while (v154 + 1 != v149);
                uint64_t v149 = [loga countByEnumeratingWithState:&v170 objects:v191 count:16];
              }
              while (v149);
            }

            v118 = BKLogEventDeliveryBuffering();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v182 = 134217984;
              *(void *)&v182[4] = v159;
              _os_log_debug_impl(&dword_1CFDE2000, v118, OS_LOG_TYPE_DEBUG, "BUFFER: --> did drain %p", v182, 0xCu);
            }

            unint64_t v92 = 0x1E4F1C000;
            uint64_t v97 = v133;
            id v91 = v135;
            uint64_t v96 = v138;
            id v98 = v142;
          }
          else if (v100)
          {
            *(_DWORD *)v182 = 134217984;
            *(void *)&v182[4] = v159;
            _os_log_impl(&dword_1CFDE2000, loga, OS_LOG_TYPE_DEFAULT, "BUFFER: --> %p empty", v182, 0xCu);
          }

          [(BKHIDEventBufferingHIDSystem *)v156 bufferDidFinishDraining:v159];
          [v159 invalidate];
          id v98 = (char *)v98 + 1;
        }
        while (v98 != (id)v96);
        uint64_t v96 = [v140 countByEnumeratingWithState:&v178 objects:v194 count:16];
      }
      while (v96);
    }
  }
}

void __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v30];
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (id *)v5;
    uint64_t v9 = v8;
    v10 = 0;
    if (v7 && v8)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v28 = v9;
      id v12 = v9[4];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (v17) {
              v17 = (void *)v17[2];
            }
            uint64_t v18 = v17;
            v19 = [v18 target];
            [v11 addObject:v19];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v14);
      }
      uint64_t v20 = objc_msgSend(v12, "lastObject", v28);
      uint64_t v21 = (void *)v20;
      if (v20) {
        uint64_t v22 = *(void **)(v20 + 16);
      }
      else {
        uint64_t v22 = 0;
      }
      id v23 = v22;
      v24 = [v23 predicate];
      v25 = [v24 display];

      id v26 = objc_alloc(MEMORY[0x1E4F4F298]);
      id v27 = v29[1];
      v10 = (void *)[v26 initWithIdentity:v27 compatibilityDisplay:v25 path:v11];

      uint64_t v9 = v29;
    }

    [*(id *)(*(void *)(a1 + 40) + 112) deliveryChainDidUpdate:v10 forIdentity:v30 reason:*(void *)(a1 + 48)];
  }
}

- (void)setEventBufferingPredicates:(id)a3 forClientWithPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_locuint64_t k = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKHIDEventDeliveryManager _lock_setEventBufferingPredicates:forClientWithPID:]((uint64_t)self, v7, v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setDeferringRules:(id)a3 forClientWithPID:(int)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKHIDEventDeliveryManager _lock_setDeferringRules:forClientWithPID:]((uint64_t)self, v7, a4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setDeferringRules:(int)a3 forClientWithPID:
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__BKHIDEventDeliveryManager__lock_setDeferringRules_forClientWithPID___block_invoke;
    v6[3] = &unk_1E6870F28;
    int v9 = a3;
    id v7 = v5;
    uint64_t v8 = a1;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:](a1, @"setDeferringRules", v6);
    if ([*(id *)(a1 + 80) count]) {
      [*(id *)(a1 + 120) requestBufferReevaluationWithContext:0];
    }
  }
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Must have a valid senderDescriptor"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      int v22 = 138544642;
      uint64_t v23 = (uint64_t)v19;
      __int16 v24 = 2114;
      v25 = v21;
      __int16 v26 = 2048;
      id v27 = self;
      __int16 v28 = 2114;
      id v29 = @"BKHIDEventDeliveryManager.m";
      __int16 v30 = 1024;
      int v31 = 730;
      __int16 v32 = 2114;
      long long v33 = v18;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v22, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDE9648);
  }
  uint64_t v8 = v7;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = -[BKHIDEventDeliveryManager _lock_destinationsForEvent:sender:]((uint64_t)self, (uint64_t)a3, v8);
  os_unfair_lock_unlock(p_lock);
  unsigned int Type = IOHIDEventGetType();
  if (Type > 0x1F
    || ((1 << Type) & 0x82309000) == 0
    && (Type != 1
     || (IntegerValue = IOHIDEventGetIntegerValue(), uint64_t v14 = IOHIDEventGetIntegerValue(), IntegerValue != 65292)
     && (IntegerValue != 65280 || v14 != 59)))
  {
    uint64_t v15 = BKLogEventDelivery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      IOHIDEventGetType();
      uint64_t Name = IOHIDEventTypeGetName();
      v17 = _BKResolutionDescriptionForLogging(v10, 1);
      int v22 = 138543618;
      uint64_t v23 = Name;
      __int16 v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1CFDE2000, v15, OS_LOG_TYPE_DEFAULT, "destinations for %{public}@ event: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }

  return v10;
}

- (id)_lock_destinationsForEvent:(void *)a3 sender:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    unint64_t v6 = *(void *)(a1 + 40);
    if ((v6 >> IOHIDEventGetType()))
    {
      id v7 = [MEMORY[0x1E4F4F2B0] descriptorForHIDEvent:a2];
      uint64_t v8 = [*(id *)(a1 + 104) objectForKey:v5];
      uint64_t v9 = [v8 objectForKey:v7];
      if (v9)
      {
        v10 = (void *)v9;
      }
      else
      {
        id v11 = BKLogEventDeliveryMatching();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          IOHIDEventGetType();
          int v15 = 138543362;
          uint64_t Name = IOHIDEventTypeGetName();
          _os_log_impl(&dword_1CFDE2000, v11, OS_LOG_TYPE_DEFAULT, "cache miss for %{public}@ event", (uint8_t *)&v15, 0xCu);
        }

        id v12 = -[BKHIDEventDeliveryManager _lock_resolveEventDescriptor:senderDescriptor:transcript:](a1, v7, v5, 0);
        if ([v12 count])
        {
          id v13 = v12;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F1CAD0] set];
        }
        v10 = v13;
        if (!v8)
        {
          uint64_t v8 = objc_opt_new();
          [*(id *)(a1 + 104) setObject:v8 forKey:v5];
        }
        [v8 setObject:v12 forKey:v7];
      }
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_lock_resolveEventDescriptor:(void *)a3 senderDescriptor:(void *)a4 transcript:
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v72 = a2;
  id v71 = a3;
  id v70 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    id v66 = [MEMORY[0x1E4F1CA80] set];
    char v7 = [v72 hidEventType];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v82 = a1;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v77 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (v77)
    {
      char v67 = 0;
      uint64_t v75 = *(void *)v91;
      uint64_t v76 = 1 << v7;
      v65 = v84;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v91 != v75) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v90 + 1) + 8 * v8);
          if (v9) {
            uint64_t v10 = v9[6];
          }
          else {
            uint64_t v10 = 0;
          }
          if ((v10 & v76) != 0)
          {
            uint64_t v79 = v8;
            id v11 = v9;
            id v12 = v72;
            id v13 = v71;
            v80 = v12;
            char v14 = [v12 hidEventType];
            uint64_t v78 = v9;
            if (v9) {
              int v15 = (void *)v11[2];
            }
            else {
              int v15 = 0;
            }
            id v16 = v15;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v94 objects:v99 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              v73 = v11;
              uint64_t v20 = 1 << v14;
              uint64_t v21 = *(void *)v95;
              while (2)
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v95 != v21) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                  uint64_t v24 = [v23 predicateEventTypeMask];
                  if (v24 == 1 || (v24 & v20) != 0)
                  {
                    __int16 v26 = [v23 predicate];
                    id v27 = [v26 senderDescriptors];
                    int v28 = _BKHIDEventSenderMatchesSenderSet(v13, v27, *(void **)(v82 + 16));

                    if (v28 && ([v26 specifiesDescriptor:v80] & 1) != 0)
                    {
                      id v29 = v23;

                      goto LABEL_28;
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v94 objects:v99 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
              id v29 = 0;
LABEL_28:
              id v11 = v73;
            }
            else
            {
              id v29 = 0;
            }

            if (v29)
            {
              __int16 v30 = [v13 associatedDisplay];
              if (!v30)
              {
                __int16 v30 = [MEMORY[0x1E4F4F2D0] nullDisplay];
              }
              int v31 = [v29 target];
              v81 = [v31 deferringEnvironment];
              __int16 v32 = (void *)[objc_alloc(MEMORY[0x1E4F4F268]) initWithDisplay:v30 environment:v81];
              if (v78) {
                long long v33 = (void *)v11[4];
              }
              else {
                long long v33 = 0;
              }
              uint64_t v34 = v11;
              id v35 = v33;
              uint64_t v36 = [v35 objectForKey:v32];
              id v37 = v35;
              int v74 = v31;
              if (v36)
              {
                id v38 = (void *)v36;
              }
              else
              {
                id v39 = objc_alloc(MEMORY[0x1E4F4F268]);
                v40 = [MEMORY[0x1E4F4F2D0] nullDisplay];
                uint64_t v41 = [v39 initWithDisplay:v40 environment:v81];

                id v38 = [v35 objectForKey:v41];
                __int16 v32 = (void *)v41;
              }
              v42 = -[BKEventDeliveryChain resolutionPath]((uint64_t)v38);
              id v43 = [v42 lastObject];

              v44 = v35;
              if (v43)
              {
                [v66 addObject:v43];
                if (v70)
                {
                  char v68 = v30;
                  id v45 = (id *)-[BKGraphDescription initWithTopLevelCount:target:]([BKGraphDescription alloc], 1, v70);
                  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  uint64_t v47 = NSString;
                  if (v78)
                  {
                    uint64_t v48 = v45;
                    v49 = v34;
                    id v50 = (id)v34[1];
                    v51 = [v47 stringWithFormat:@"%@: %@", v50, v29, v65];
                    [v46 addObject:v51];

                    uint64_t v58 = v49[1];
                    id v45 = v48;
                  }
                  else
                  {
                    id v62 = [NSString stringWithFormat:@"%@: %@", 0, v29];
                    [v46 addObject:v62];

                    uint64_t v58 = 0;
                  }
                  -[BKGraphDescription appendNode:](v45, @"%@", v52, v53, v54, v55, v56, v57, v58);
                  v83[0] = MEMORY[0x1E4F143A8];
                  v83[1] = 3221225472;
                  v84[0] = __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke;
                  v84[1] = &unk_1E6870EB8;
                  v85 = v45;
                  id v86 = v38;
                  id v87 = v29;
                  uint64_t v88 = v82;
                  id v89 = v46;
                  id v59 = v46;
                  id v60 = v45;
                  -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v60, 1, v83);
                  [v70 writeString:@"\nRules: "];
                  id v61 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v59];
                  [v70 writeString:v61];

                  [v70 writeString:@"\n\n"];
                  __int16 v30 = v68;
                  v44 = v37;
                }
              }
              char v67 = 1;
            }

            uint64_t v8 = v79;
          }
          ++v8;
        }
        while (v8 != v77);
        uint64_t v63 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
        uint64_t v77 = v63;
      }
      while (v63);
    }
    else
    {
      char v67 = 0;
    }

    if (v70 && (v67 & 1) == 0) {
      [v70 writeString:@"no matching dispatch rules"];
    }
  }
  else
  {
    id v66 = 0;
  }

  return v66;
}

- (void)_lock_notifyObserversForReason:(void *)a3 chainsMayUpdate:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  uint64_t v41 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v46 = a1;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v67;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v67 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v66 + 1) + 8 * v11);
        if (v12) {
          uint64_t v13 = *(void *)(v12 + 32);
        }
        else {
          uint64_t v13 = 0;
        }
        [v5 addEntriesFromDictionary:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v66 objects:v82 count:16];
      uint64_t v9 = v14;
    }
    while (v14);
  }

  v41[2]();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = *(id *)(v46 + 32);
  uint64_t v47 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
  if (v47)
  {
    uint64_t v43 = *(void *)v63;
    v44 = v6;
    id v45 = v5;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(*((void *)&v62 + 1) + 8 * v15);
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __60__BKHIDEventDeliveryManager__lock_rebuildRootDeliveryPaths___block_invoke;
        v78[3] = &unk_1E6870FC0;
        v78[4] = v46;
        id v49 = v17;
        id v51 = v17;
        id v79 = v51;
        id v48 = v18;
        id v50 = v18;
        id v80 = v50;
        uint64_t v19 = (void (**)(void, void, void))MEMORY[0x1D25E04D0](v78);
        uint64_t v52 = v15;
        if (v16) {
          uint64_t v20 = (void *)*((void *)v16 + 2);
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = v20;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v55 = v21;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v84 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v75;
          uint64_t v53 = *(void *)v75;
          do
          {
            uint64_t v25 = 0;
            uint64_t v54 = v23;
            do
            {
              if (*(void *)v75 != v24) {
                objc_enumerationMutation(v55);
              }
              __int16 v26 = *(void **)(*((void *)&v74 + 1) + 8 * v25);
              id v27 = [v26 predicate];
              int v28 = [v27 senderDescriptors];
              id v29 = [v26 target];
              if (v29)
              {
                if (v28)
                {
                  long long v72 = 0u;
                  long long v73 = 0u;
                  long long v70 = 0u;
                  long long v71 = 0u;
                  id v30 = v28;
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v83 count:16];
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    uint64_t v33 = *(void *)v71;
                    do
                    {
                      for (uint64_t i = 0; i != v32; ++i)
                      {
                        if (*(void *)v71 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        ((void (**)(void, void, void *))v19)[2](v19, *(void *)(*((void *)&v70 + 1) + 8 * i), v29);
                      }
                      uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v83 count:16];
                    }
                    while (v32);
                  }

                  uint64_t v24 = v53;
                  uint64_t v23 = v54;
                }
                else
                {
                  ((void (**)(void, void, void *))v19)[2](v19, 0, v29);
                }
              }

              ++v25;
            }
            while (v25 != v23);
            uint64_t v23 = [v55 countByEnumeratingWithState:&v74 objects:v84 count:16];
          }
          while (v23);
        }
        if (v16)
        {
          objc_storeStrong((id *)v16 + 4, v49);
          objc_storeStrong((id *)v16 + 5, v48);
        }

        id v6 = v44;
        id v5 = v45;
        if (v16) {
          uint64_t v35 = *((void *)v16 + 4);
        }
        else {
          uint64_t v35 = 0;
        }
        [v44 addEntriesFromDictionary:v35];
        uint64_t v15 = v52 + 1;
      }
      while (v52 + 1 != v47);
      uint64_t v36 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      uint64_t v47 = v36;
    }
    while (v36);
  }

  if (([v5 isEqual:v6] & 1) == 0)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke;
    v58[3] = &unk_1E6870FE8;
    id v37 = v5;
    id v59 = v37;
    uint64_t v60 = v46;
    id v38 = v40;
    id v61 = v38;
    [v6 enumerateKeysAndObjectsUsingBlock:v58];
    id v39 = [v6 allKeys];
    [v37 removeObjectsForKeys:v39];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke_2;
    v56[3] = &unk_1E6871010;
    v56[4] = v46;
    id v57 = v38;
    [v37 enumerateKeysAndObjectsUsingBlock:v56];
  }
}

void __60__BKHIDEventDeliveryManager__lock_rebuildRootDeliveryPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 deferringEnvironment];
  uint64_t v9 = [v7 pid];
  uint64_t v10 = [v6 associatedDisplay];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F4F2D0] nullDisplay];
  }
  uint64_t v11 = -[BKEventDeferringGraph deferringPathForPID:environment:display:dispatchTarget:](*(void *)(*(void *)(a1 + 32) + 64), v9, v8, v10, v7);
  uint64_t v12 = [BKEventDeliveryChain alloc];
  id v13 = v10;
  id v14 = v8;
  id v15 = v7;
  id v24 = v6;
  id v16 = v11;
  if (v12
    && (v25.receiver = v12,
        v25.super_class = (Class)BKEventDeliveryChain,
        (uint64_t v12 = (BKEventDeliveryChain *)objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    id v17 = v13;
    if (!v13)
    {
      id v17 = [MEMORY[0x1E4F4F2D0] nullDisplay];
    }
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F4F268]) initWithDisplay:v17 environment:v14];
    identity = v12->_identity;
    v12->_identity = (BKSEventDeferringChainIdentity *)v18;

    objc_storeStrong((id *)&v12->_dispatchTarget, a3);
    objc_storeStrong((id *)&v12->_senderDescriptor, a2);
    objc_storeStrong((id *)&v12->_deferringPath, v11);
  }
  else
  {
    id v17 = v13;
  }

  uint64_t v20 = *(void **)(a1 + 40);
  if (v12) {
    id v21 = v12->_identity;
  }
  else {
    id v21 = 0;
  }
  uint64_t v22 = v21;
  [v20 setObject:v12 forKey:v22];

  uint64_t v23 = -[BKEventDeliveryChain resolutionPath]((uint64_t)v12);
  [*(id *)(a1 + 48) addObject:v23];
}

void __70__BKHIDEventDeliveryManager__lock_setDeferringRules_forClientWithPID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sortedArrayUsingSelector:sel_weightedDeferringRuleCompare_];
  v3 = objc_msgSend(v2, "bs_reverse");
  uint64_t v4 = BKLogEventDelivery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    id v6 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v3];
    *(_DWORD *)buf = 67109378;
    int v24 = v5;
    __int16 v25 = 2114;
    __int16 v26 = v6;
    _os_log_impl(&dword_1CFDE2000, v4, OS_LOG_TYPE_DEFAULT, "new deferring rules for pid:%d: %{public}@", buf, 0x12u);
  }
  [*(id *)(*(void *)(a1 + 40) + 72) setObject:v3 forKey:*(int *)(a1 + 48)];
  uint64_t v7 = -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](*(void *)(a1 + 40), *(_DWORD *)(a1 + 48), 1);
  uint64_t v8 = (void *)v7;
  if (v7) {
    objc_storeStrong((id *)(v7 + 40), v3);
  }
  [*(id *)(*(void *)(a1 + 40) + 104) removeAllObjects];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 64);
  uint64_t v10 = *(unsigned int *)(a1 + 48);
  id v11 = v3;
  if (v9)
  {
    uint64_t v12 = *(void **)(v9 + 16);
    id v13 = [NSNumber numberWithInt:v10];
    [v12 setObject:v11 forKey:v13];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = *(id *)(v9 + 24);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:buf count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[BKEventDeferringGraph _setRules:forPID:toDisplay:](v9, v11, v10, *(void **)(*((void *)&v19 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:buf count:16];
      }
      while (v16);
    }
  }
}

- (void)_lock_setEventBufferingPredicates:(uint64_t)a3 forClientWithPID:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    id v6 = BKLogEventDelivery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v5];
      *(_DWORD *)buf = 67109378;
      int v25 = a3;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "new buffering predicates for pid:%d: %{public}@", buf, 0x12u);
    }
    uint64_t v8 = [*(id *)(a1 + 80) objectForKey:(int)a3];
    int v9 = BSEqualSets();
    uint64_t v10 = BKLogEventDelivery();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109378;
        int v25 = a3;
        __int16 v26 = 2114;
        id v27 = v5;
        _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "pid:%d no change to buffering predicates: %{public}@", buf, 0x12u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109378;
        int v25 = a3;
        __int16 v26 = 2114;
        id v27 = v5;
        _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "pid:%d new buffering predicates: %{public}@", buf, 0x12u);
      }

      uint64_t v12 = [v5 count];
      uint64_t v13 = -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, v12 != 0);
      uint64_t v10 = v13;
      if (v13)
      {
        id v14 = *(id *)(v13 + 64);
        [v14 invalidate];
        Class isa = v10[8].isa;
        v10[8].Class isa = 0;
      }
      uint64_t v16 = *(void **)(a1 + 80);
      if (v12)
      {
        [v16 setObject:v5 forKey:(int)a3];
        id v17 = objc_alloc(MEMORY[0x1E4F4F6F0]);
        uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"BKHIDEventDeliveryManager buffer predicate pid:%d", a3);
        long long v19 = (void *)[v17 initWithIdentifier:v18];

        -[BKHIDEventDeliveryClient setBufferTimer:]((uint64_t)v10, v19);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __80__BKHIDEventDeliveryManager__lock_setEventBufferingPredicates_forClientWithPID___block_invoke;
        v20[3] = &unk_1E6870F98;
        v20[4] = a1;
        int v23 = a3;
        id v21 = v5;
        long long v22 = v10;
        [v19 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v20 queue:8.0 handler:1.0];
      }
      else
      {
        [v16 removeObjectForKey:(int)a3];
      }
      [*(id *)(a1 + 120) requestBufferReevaluationWithContext:0];
    }
  }
}

- (id)_lock_clientWithPID:(int)a3 createIfNeeded:
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v6 = a2;
    p_Class isa = [*(id *)(a1 + 88) objectForKey:a2];
    if (p_isa) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a3 == 0;
    }
    if (!v8)
    {
      int v9 = objc_alloc_init(BKHIDEventDeliveryClient);
      p_Class isa = (id *)&v9->super.isa;
      if (v9)
      {
        v9->_pid = a2;
        uint64_t v10 = BSProcessDescriptionForPID();
        objc_storeStrong(p_isa + 2, v10);
      }
      else
      {
        uint64_t v10 = BSProcessDescriptionForPID();
      }

      [*(id *)(a1 + 88) setObject:p_isa forKey:v6];
    }
  }
  else
  {
    p_Class isa = 0;
  }

  return p_isa;
}

BOOL __109__BKHIDEventDeliveryManager__lock_enableBuffering_dispatchTarget_ownerPIDs_buffersToDrain_targetToNewBuffer___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKey:", (int)objc_msgSend(a2, "intValue"));
  v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[8] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingDispatcher, 0);
  objc_storeStrong((id *)&self->_resolutionObserver, 0);
  objc_storeStrong((id *)&self->_destinationCacheBySender, 0);
  objc_storeStrong((id *)&self->_allObserverResolutions, 0);
  objc_storeStrong((id *)&self->_clientsByPID, 0);
  objc_storeStrong((id *)&self->_bufferingPredicatesByPID, 0);
  objc_storeStrong((id *)&self->_deferringRulesByPID, 0);
  objc_storeStrong((id *)&self->_deferringGraph, 0);
  objc_storeStrong((id *)&self->_buffersByDispatchTarget, 0);
  objc_storeStrong((id *)&self->_keyCommandDeliveryRoots, 0);
  objc_storeStrong((id *)&self->_deliveryRoots, 0);
  objc_storeStrong((id *)&self->_authenticationOriginator, 0);

  objc_storeStrong((id *)&self->_mainDisplay, 0);
}

- (void)setBufferingDispatcher:(id)a3
{
}

- (BKHIDEventBufferingHIDSystem)bufferingDispatcher
{
  return self->_bufferingDispatcher;
}

- (void)setResolutionObserver:(id)a3
{
}

- (BKHIDEventDeliveryResolutionObserver)resolutionObserver
{
  return self->_resolutionObserver;
}

- (void)_fireTimeoutForPID:(int)a3 bufferingPredicates:(id)a4 client:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  [(BSMutableIntegerMap *)self->_bufferingPredicatesByPID removeObjectForKey:a3];
  [(BKHIDEventBufferingHIDSystem *)self->_bufferingDispatcher requestBufferReevaluationWithContext:0];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v10 = BKLogEventDelivery();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v8];
    v12[0] = 67109378;
    v12[1] = a3;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "buffering timed out for pid:%d: %{public}@", (uint8_t *)v12, 0x12u);
  }
  -[BKHIDEventDeliveryClient setBufferTimer:]((uint64_t)v9, 0);
}

- (id)_test_deliveryRootForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_deliveryRoots;
  uint64_t v6 = (void *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (v9) {
          uint64_t v10 = v9[1];
        }
        else {
          uint64_t v10 = 0;
        }
        if (objc_msgSend(v4, "isEqualToString:", v10, (void)v13))
        {
          uint64_t v6 = v9;
          goto LABEL_15;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = (void *)v11;
    }
    while (v11);
  }
LABEL_15:

  return v6;
}

- (id)descriptionOfResolutionPathForKeyCommand:(id)a3 senderDescriptor:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = objc_alloc_init(BKStringTranscriptTarget);
  id v9 = objc_alloc_init(BKEventGraphDescriptionAccumulator);
  -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v9, @"input key command: %@", v10, v11, v12, v13, v14, v15, (char)v6);
  id v16 = -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v6, v7, v9);
  os_unfair_lock_unlock(&self->_lock);
  id v17 = v8;
  if (v9)
  {
    uint64_t v18 = [BKGraphDescription alloc];
    topLevel = v9->_topLevel;
    if (topLevel) {
      subnodes = topLevel->_subnodes;
    }
    else {
      subnodes = 0;
    }
    id v21 = -[BKGraphDescription initWithTopLevelCount:target:](v18, [(NSMutableArray *)subnodes count], v17);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v22 = v9->_topLevel;
    if (v22) {
      long long v22 = (_BKGraphStructureNode *)v22->_subnodes;
    }
    int v23 = v22;
    uint64_t v24 = [(_BKGraphStructureNode *)v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          -[BKEventGraphDescriptionAccumulator _recursiveAppendNode:toDescription:]((uint64_t)v9, *(void **)(*((void *)&v30 + 1) + 8 * i), v21);
        }
        uint64_t v25 = [(_BKGraphStructureNode *)v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v25);
    }
  }
  uint64_t v28 = [(BKStringTranscriptTarget *)v17 build];

  return v28;
}

- (id)_lock_destinationsForKeyCommand:(void *)a3 sender:(void *)a4 transcript:
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  id v182 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v158 = v7;
    v177 = [v7 associatedDisplay];
    if (!v177)
    {
      v177 = [MEMORY[0x1E4F4F2D0] nullDisplay];
    }
    id v9 = [MEMORY[0x1E4F1CA80] set];
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    obuint64_t j = *(id *)(a1 + 48);
    uint64_t v159 = [obj countByEnumeratingWithState:&v220 objects:v232 count:16];
    id v160 = v9;
    if (v159)
    {
      uint64_t v157 = *(void *)v221;
      uint64_t v178 = (uint64_t)v8;
      uint64_t v179 = a1;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v221 != v157) {
            objc_enumerationMutation(obj);
          }
          uint64_t v162 = v10;
          uint64_t v11 = *(void *)(*((void *)&v220 + 1) + 8 * v10);
          uint64_t v12 = BKLogEventDeliveryMatching();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v234 = v11;
            _os_log_debug_impl(&dword_1CFDE2000, v12, OS_LOG_TYPE_DEBUG, "KCMD: examine root %{public}@", buf, 0xCu);
          }

          if (v8)
          {
            if (v11) {
              uint64_t v19 = *(void *)(v11 + 8);
            }
            else {
              LOBYTE(v19) = 0;
            }
            -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"key command root: %@", v13, v14, v15, v16, v17, v18, v19);
          }
          if (v11) {
            long long v20 = *(void **)(v11 + 16);
          }
          else {
            long long v20 = 0;
          }
          id v21 = v20;
          id v161 = [v21 predicate];
          long long v22 = [v161 senderDescriptors];
          int v23 = _BKHIDEventSenderMatchesSenderSet(v158, v22, *(void **)(a1 + 16));

          if (!v23) {
            goto LABEL_113;
          }
          uint64_t v24 = [v21 targets];
          v187 = [MEMORY[0x1E4F1CA48] array];
          long long v169 = [MEMORY[0x1E4F1CA48] array];
          long long v216 = 0u;
          long long v217 = 0u;
          long long v218 = 0u;
          long long v219 = 0u;
          id v163 = v24;
          uint64_t v165 = [v163 countByEnumeratingWithState:&v216 objects:v231 count:16];
          if (!v165) {
            goto LABEL_105;
          }
          uint64_t v164 = *(void *)v217;
          id v170 = v21;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v217 != v164) {
                objc_enumerationMutation(v163);
              }
              uint64_t v166 = v25;
              uint64_t v26 = *(void **)(*((void *)&v216 + 1) + 8 * v25);
              id v27 = BKLogEventDeliveryMatching();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)v234 = v26;
                _os_log_debug_impl(&dword_1CFDE2000, v27, OS_LOG_TYPE_DEBUG, "KCMD: examine key command target %{public}@", buf, 0xCu);
              }

              long long v168 = -[BKEventGraphDescriptionAccumulator pushSection](v8);
              -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"dispatch target: %@", v28, v29, v30, v31, v32, v33, (char)v26);
              uint64_t v34 = [v26 pid];
              uint64_t v35 = [v26 deferringEnvironment];
              id v215 = 0;
              long long v184 = v35;
              __int16 v176 = v26;
              id v36 = -[BKHIDEventDeliveryManager _lock_resolveDeferringChainForPID:display:environment:dispatchingTarget:getTargetOrder:](a1, v34, v177, v35, v26, &v215);
              id v37 = v215;
              long long v211 = 0u;
              long long v212 = 0u;
              long long v213 = 0u;
              long long v214 = 0u;
              id v167 = v37;
              id v171 = [v37 reverseObjectEnumerator];
              uint64_t v174 = [v171 countByEnumeratingWithState:&v211 objects:v230 count:16];
              if (!v174) {
                goto LABEL_102;
              }
              uint64_t v173 = *(void *)v212;
              uint64_t v38 = 0xFFFFFFFFLL;
LABEL_27:
              uint64_t v39 = 0;
              uint64_t v40 = v38;
              while (1)
              {
                if (*(void *)v212 != v173) {
                  objc_enumerationMutation(v171);
                }
                uint64_t v175 = v39;
                uint64_t v41 = *(void **)(*((void *)&v211 + 1) + 8 * v39);
                v42 = _BKDeferringTargetForResolutionTranscript(v41);
                -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"%@", v43, v44, v45, v46, v47, v48, (char)v42);

                id v49 = -[BKEventGraphDescriptionAccumulator pushSection](v8);
                id v50 = BKLogEventDeliveryMatching();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v234 = v41;
                  _os_log_debug_impl(&dword_1CFDE2000, v50, OS_LOG_TYPE_DEBUG, "KCMD: examine deferring target %{public}@", buf, 0xCu);
                }

                uint64_t v51 = [v41 pid];
                if (v40 != v51) {
                  break;
                }
                uint64_t v52 = BKLogEventDeliveryMatching();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v234 = v41;
                  _os_log_debug_impl(&dword_1CFDE2000, v52, OS_LOG_TYPE_DEBUG, "KCMD:  dropping prior target %{public}@", buf, 0xCu);
                }

                uint64_t v38 = v40;
LABEL_96:

                uint64_t v39 = v175 + 1;
                uint64_t v40 = v38;
                if (v175 + 1 == v174)
                {
                  uint64_t v131 = [v171 countByEnumeratingWithState:&v211 objects:v230 count:16];
                  uint64_t v174 = v131;
                  if (!v131) {
                    goto LABEL_102;
                  }
                  goto LABEL_27;
                }
              }
              uint64_t v53 = v51;
              uint64_t v54 = [*(id *)(a1 + 88) objectForKey:(int)v51];
              long long v172 = (void *)v54;
              if (v54) {
                id v55 = *(void **)(v54 + 48);
              }
              else {
                id v55 = 0;
              }
              long long v188 = v41;
              id v56 = v55;
              id v57 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
              long long v207 = 0u;
              long long v208 = 0u;
              long long v209 = 0u;
              long long v210 = 0u;
              id v58 = v56;
              uint64_t v59 = [v58 countByEnumeratingWithState:&v207 objects:v229 count:16];
              uint64_t v183 = v53;
              if (v59)
              {
                uint64_t v60 = v59;
                char v61 = 0;
                uint64_t v62 = *(void *)v208;
                do
                {
                  for (uint64_t i = 0; i != v60; ++i)
                  {
                    if (*(void *)v208 != v62) {
                      objc_enumerationMutation(v58);
                    }
                    long long v64 = [*(id *)(*((void *)&v207 + 1) + 8 * i) deferringEnvironment];
                    char v65 = [v64 isEqual:v57];

                    v61 |= v65 ^ 1;
                  }
                  uint64_t v60 = [v58 countByEnumeratingWithState:&v207 objects:v229 count:16];
                }
                while (v60);
              }
              else
              {
                char v61 = 0;
              }

              long long v205 = 0u;
              long long v206 = 0u;
              long long v203 = 0u;
              long long v204 = 0u;
              id v180 = v58;
              long long v66 = v188;
              uint64_t v186 = [v180 countByEnumeratingWithState:&v203 objects:v228 count:16];
              if (v186)
              {
                uint64_t v185 = *(void *)v204;
                long long v181 = v49;
                do
                {
                  uint64_t v67 = 0;
                  do
                  {
                    if (*(void *)v204 != v185) {
                      objc_enumerationMutation(v180);
                    }
                    long long v68 = *(void **)(*((void *)&v203 + 1) + 8 * v67);
                    long long v69 = BKLogEventDeliveryMatching();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543618;
                      *(void *)v234 = v68;
                      *(_WORD *)&v234[8] = 2114;
                      *(void *)&v234[10] = v182;
                      _os_log_debug_impl(&dword_1CFDE2000, v69, OS_LOG_TYPE_DEBUG, "KCMD: examine registration %{public}@ looking for %{public}@", buf, 0x16u);
                    }

                    long long v70 = [v68 deferringEnvironment];
                    uint64_t v191 = v67;
                    if (v61)
                    {
                      long long v71 = v68;
                      int v72 = [v184 isEqual:v70];
                      long long v73 = BKLogEventDeliveryMatching();
                      BOOL v74 = os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG);
                      if (!v72)
                      {
                        if (v74)
                        {
                          *(_DWORD *)buf = 138543618;
                          *(void *)v234 = v184;
                          *(_WORD *)&v234[8] = 2114;
                          *(void *)&v234[10] = v70;
                          _os_log_debug_impl(&dword_1CFDE2000, v73, OS_LOG_TYPE_DEBUG, "KCMD: environment mismatch want:%{public}@ got:%{public}@", buf, 0x16u);
                        }

                        goto LABEL_89;
                      }
                      if (v74)
                      {
                        *(_DWORD *)buf = 138543362;
                        *(void *)v234 = v70;
                        _os_log_debug_impl(&dword_1CFDE2000, v73, OS_LOG_TYPE_DEBUG, "KCMD: environment %{public}@", buf, 0xCu);
                      }

                      -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"%@", v75, v76, v77, v78, v79, v80, (char)v70);
                      long long v68 = v71;
                    }
                    if (v8)
                    {
                      v81 = _BKDeferringTargetForResolutionTranscript(v66);
                      -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"target: %@ environment:%@", v82, v83, v84, v85, v86, v87, (char)v81);
                    }
                    long long v189 = v70;
                    id v88 = v182;
                    long long v190 = v68;
                    id v89 = [v68 keyCommands];
                    long long v224 = 0u;
                    long long v225 = 0u;
                    long long v226 = 0u;
                    long long v227 = 0u;
                    id v90 = v89;
                    uint64_t v91 = [v90 countByEnumeratingWithState:&v224 objects:buf count:16];
                    if (v91)
                    {
                      uint64_t v92 = v91;
                      id v93 = 0;
                      uint64_t v94 = 0;
                      uint64_t v95 = *(void *)v225;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v92; ++j)
                        {
                          if (*(void *)v225 != v95) {
                            objc_enumerationMutation(v90);
                          }
                          long long v97 = *(void **)(*((void *)&v224 + 1) + 8 * j);
                          v94 |= [v97 describes:v88];
                          if (v94)
                          {
                            id v93 = v97;
                            if (v94 == 3)
                            {

                              id v98 = v93;
                              id v8 = (id *)v178;
                              id v49 = v181;
                              uint64_t v100 = v190;
                              v101 = BKLogEventDeliveryMatching();
                              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                              {
                                v102 = [v190 deferringEnvironment];
                                *(_DWORD *)buf = 67109378;
                                *(_DWORD *)v234 = v183;
                                *(_WORD *)&v234[4] = 2114;
                                *(void *)&v234[6] = v102;
                                _os_log_impl(&dword_1CFDE2000, v101, OS_LOG_TYPE_DEFAULT, "KCMD: match in pid:%d %{public}@", buf, 0x12u);

                                uint64_t v100 = v190;
                              }

                              if (v178)
                              {
                                uint64_t v154 = [v100 deferringEnvironment];
                                -[BKEventGraphDescriptionAccumulator appendSubnode:](v178, @"complete match in pid:%d %@ [%@]", v103, v104, v105, v106, v107, v108, v183);
                              }
                              v109 = (void *)MEMORY[0x1E4F4F288];
                              v192[0] = MEMORY[0x1E4F143A8];
                              v192[1] = 3221225472;
                              v192[2] = __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke_166;
                              v192[3] = &unk_1E6870E68;
                              id v193 = v177;
                              uint64_t v194 = v179;
                              id v195 = v184;
                              uint64_t v196 = v188;
                              v197 = v176;
                              id v110 = [v109 build:v192];
                              [v187 addObject:v110];

                              uint64_t v111 = v193;
                              goto LABEL_83;
                            }
                          }
                        }
                        uint64_t v92 = [v90 countByEnumeratingWithState:&v224 objects:buf count:16];
                        if (v92) {
                          continue;
                        }
                        break;
                      }

                      id v98 = v93;
                      id v8 = (id *)v178;
                      id v49 = v181;
                      v99 = v190;
                      if (v94 == 1)
                      {
                        if (v178)
                        {
                          char v155 = [v190 deferringEnvironment];
                          -[BKEventGraphDescriptionAccumulator appendSubnode:](v178, @"partial match in pid:%d %@ [%@]", v121, v122, v123, v124, v125, v126, v183);
                        }
                        id v127 = (void *)MEMORY[0x1E4F4F288];
                        v198[0] = MEMORY[0x1E4F143A8];
                        v198[1] = 3221225472;
                        v198[2] = __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke;
                        v198[3] = &unk_1E6871218;
                        id v199 = v177;
                        id v200 = v184;
                        v201 = v188;
                        v202 = v176;
                        id v128 = [v127 build:v198];
                        [v169 addObject:v128];

                        uint64_t v111 = v199;
                        goto LABEL_83;
                      }
                      if (!v94) {
                        goto LABEL_79;
                      }
                    }
                    else
                    {

                      id v98 = 0;
                      id v49 = v181;
                      v99 = v68;
LABEL_79:
                      uint64_t v112 = BKLogEventDeliveryMatching();
                      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v113 = [v99 deferringEnvironment];
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v234 = v183;
                        *(_WORD *)&v234[4] = 2114;
                        *(void *)&v234[6] = v113;
                        _os_log_impl(&dword_1CFDE2000, v112, OS_LOG_TYPE_DEFAULT, "KCMD: no match in pid:%d %{public}@", buf, 0x12u);

                        v99 = v190;
                      }

                      if (v8)
                      {
                        uint64_t v111 = [v99 deferringEnvironment];
                        -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, @"no match in pid:%d %@", v114, v115, v116, v117, v118, v119, v183);
LABEL_83:
                      }
                    }
                    uint64_t v120 = [v187 count];

                    long long v66 = v188;
                    long long v70 = v189;
                    if (v120)
                    {

                      goto LABEL_95;
                    }
LABEL_89:

                    uint64_t v67 = v191 + 1;
                  }
                  while (v191 + 1 != v186);
                  uint64_t v129 = [v180 countByEnumeratingWithState:&v203 objects:v228 count:16];
                  uint64_t v186 = v129;
                }
                while (v129);
              }
LABEL_95:

              -[BKEventGraphDescriptionAccumulator popSection:]((uint64_t)v8, v49);
              uint64_t v130 = [v187 count];

              a1 = v179;
              id v21 = v170;
              uint64_t v38 = v183;
              if (!v130) {
                goto LABEL_96;
              }

LABEL_102:
              -[BKEventGraphDescriptionAccumulator popSection:]((uint64_t)v8, v168);
              uint64_t v132 = [v187 count];

              if (v132) {
                goto LABEL_105;
              }
              uint64_t v25 = v166 + 1;
            }
            while (v166 + 1 != v165);
            uint64_t v165 = [v163 countByEnumeratingWithState:&v216 objects:v231 count:16];
          }
          while (v165);
LABEL_105:

          if ([v187 count])
          {
            uint64_t v133 = BKLogEventDeliveryMatching();
            if (!os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v134 = v187;
              goto LABEL_111;
            }
            uint64_t v134 = v187;
            id v135 = _BKResolutionDescriptionForLogging(v187, 0);
            *(_DWORD *)buf = 138543362;
            *(void *)v234 = v135;
            v136 = v133;
            uint64_t v137 = "  ->completeDestinations:%{public}@";
LABEL_117:
            _os_log_debug_impl(&dword_1CFDE2000, v136, OS_LOG_TYPE_DEBUG, v137, buf, 0xCu);

            goto LABEL_111;
          }
          if ([v169 count])
          {
            uint64_t v133 = BKLogEventDeliveryMatching();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v134 = v169;
              id v135 = _BKResolutionDescriptionForLogging(v169, 0);
              *(_DWORD *)buf = 138543362;
              *(void *)v234 = v135;
              v136 = v133;
              uint64_t v137 = "  ->partialDestinations:%{public}@";
              goto LABEL_117;
            }
            uint64_t v134 = v169;
LABEL_111:

            [v160 addObjectsFromArray:v134];
          }

LABEL_113:
          uint64_t v10 = v162 + 1;
          id v9 = v160;
        }
        while (v162 + 1 != v159);
        uint64_t v138 = [obj countByEnumeratingWithState:&v220 objects:v232 count:16];
        uint64_t v159 = v138;
      }
      while (v138);
    }

    id v7 = v158;
    if (v8)
    {
      if ([v9 count])
      {
        v145 = _BKResolutionDescriptionForLogging(v9, 1);
        -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v8, @"complete: %@", v146, v147, v148, v149, v150, v151, (char)v145);

        id v9 = v160;
      }
      else
      {
        -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v8, @"no matching key commands", v139, v140, v141, v142, v143, v144, v153);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_lock_resolveDeferringChainForPID:(void *)a3 display:(void *)a4 environment:(void *)a5 dispatchingTarget:(void *)a6 getTargetOrder:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    id v13 = a5;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v14 = -[BKEventDeferringGraph deferringPathForPID:environment:display:dispatchTarget:](*(void *)(a1 + 64), a2, v12, v11, v13);

    uint64_t v15 = [v14 lastObject];
    unint64_t v16 = 0x1E4F4F000uLL;
    if (!v15) {
      goto LABEL_10;
    }
    uint64_t v17 = (void *)v15;
    uint64_t v30 = a6;
    id v31 = v12;
    id v18 = *(id *)(v15 + 16);
    id v19 = objc_alloc_init(MEMORY[0x1E4F4F360]);
    long long v20 = [v18 predicate];
    id v21 = [v20 environment];
    [v19 setEnvironment:v21];

    if (v18)
    {
      long long v22 = [v18 target];
      int v23 = [v18 predicate];
      uint64_t v24 = [v23 display];

      if (!v24)
      {
        uint64_t v24 = [MEMORY[0x1E4F4F2D0] nullDisplay];
      }
      uint64_t v25 = objc_msgSend(v22, "pid", v30);
      [v19 setDisplay:v24];
      [v19 setPid:v25];
      uint64_t v26 = [v22 token];
      [v19 setToken:v26];

      unint64_t v16 = 0x1E4F4F000;
    }

    a6 = v30;
    id v12 = v31;
    if (v19)
    {
      if (v30)
      {
        objc_msgSend(v14, "bs_map:", &__block_literal_global_178);
        *uint64_t v30 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_10:
      id v19 = objc_alloc_init(*(Class *)(v16 + 864));
      if (!v11)
      {
        id v11 = [MEMORY[0x1E4F4F2D0] nullDisplay];
      }
      objc_msgSend(v19, "setEnvironment:", v12, v30);
      [v19 setDisplay:v11];
      [v19 setPid:a2];
      [v19 setToken:0];
      if (a6)
      {
        id v27 = (void *)[MEMORY[0x1E4F4F368] new];
        [v27 setPid:a2];
        v32[0] = v27;
        *a6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      }
    }
    uint64_t v28 = -[BKHIDEventDeliveryManager _lock_processDescriptionForPID:](a1, objc_msgSend(v19, "pid", v30));
    [v19 setProcessDescription:v28];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDisplay:v3];
  [v5 setEnvironment:*(void *)(a1 + 40)];
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 48), "pid"));
  id v4 = [*(id *)(a1 + 48) token];
  [v5 setToken:v4];

  [v5 setDispatchingTarget:*(void *)(a1 + 56)];
}

void __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16);
  }
  id v5 = a2;
  [v5 setDisplay:v3];
  [v5 setEnvironment:*(void *)(a1 + 48)];
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 56), "pid"));
  id v4 = [*(id *)(a1 + 56) token];
  [v5 setToken:v4];

  [v5 setDispatchingTarget:*(void *)(a1 + 64)];
}

- (id)_lock_processDescriptionForPID:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v4 = [*(id *)(a1 + 88) objectForKey:a2];
    id v5 = (void *)v4;
    if (!v4 || (id v6 = *(id *)(v4 + 16)) == 0)
    {
      BSProcessDescriptionForPID();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      -[BKHIDEventDeliveryClient setProcessDescription:]((uint64_t)v5, v6);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __116__BKHIDEventDeliveryManager__lock_resolveDeferringChainForPID_display_environment_dispatchingTarget_getTargetOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 16);
  }
  else {
    v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = [v3 target];

  return v4;
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = objc_alloc_init(BKStringTranscriptTarget);
  deferringGraph = self->_deferringGraph;
  id v8 = v5;
  id v9 = v6;
  if (deferringGraph)
  {
    uint64_t v10 = -[BKEventDeferringGraph _dictionaryWithGraphToIdentityMapping]((uint64_t)deferringGraph);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__BKEventDeferringGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke;
    v13[3] = &unk_1E6871540;
    id v14 = v8;
    uint64_t v15 = v9;
    unint64_t v16 = deferringGraph;
    [v10 enumerateKeysAndObjectsUsingBlock:v13];
  }
  os_unfair_lock_unlock(p_lock);
  id v11 = [(BKStringTranscriptTarget *)v9 build];

  return v11;
}

- (id)deliveryGraphDescription
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = objc_alloc_init(BKStringTranscriptTarget);
  -[BKEventDeferringGraph logGraphToTarget:]((uint64_t)self->_deferringGraph, v4);
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  deliveryRoots = self->_deliveryRoots;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__BKHIDEventDeliveryManager_deliveryGraphDescription__block_invoke;
  v18[3] = &unk_1E6870E40;
  id v19 = v5;
  id v7 = v5;
  [v7 appendCollection:deliveryRoots withName:0 itemBlock:v18];
  id v8 = [v7 description];
  [(BKStringTranscriptTarget *)v4 writeString:v8];

  [(BKStringTranscriptTarget *)v4 writeString:@"\n"];
  deferringGraph = self->_deferringGraph;
  if (deferringGraph)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F4F720];
    pidToRules = deferringGraph->_pidToRules;
    id v12 = v4;
    id v13 = [(NSMutableDictionary *)pidToRules allValues];
    id v14 = objc_msgSend(v13, "bs_flatten");
    uint64_t v15 = [v10 descriptionForRootObject:v14];
    [(BKStringTranscriptTarget *)v12 writeString:v15];
  }
  os_unfair_lock_unlock(p_lock);
  unint64_t v16 = [(BKStringTranscriptTarget *)v4 build];

  return v16;
}

void __53__BKHIDEventDeliveryManager_deliveryGraphDescription__block_invoke(uint64_t a1, id *a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    a2 = (id *)a2[2];
    id v4 = v3[1];
  }
  else
  {
    id v4 = 0;
  }
  id v6 = a2;
  id v5 = (id)[v2 appendObject:a2 withName:v4];
}

- (id)descriptionOfResolutionPathForEventDescriptor:(id)a3 senderDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = objc_alloc_init(BKStringTranscriptTarget);
  id v9 = -[BKHIDEventDeliveryManager _lock_resolveEventDescriptor:senderDescriptor:transcript:]((uint64_t)self, v6, v7, v8);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v10 = [(BKStringTranscriptTarget *)v8 build];

  return v10;
}

void __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke(uint64_t a1)
{
  id v3 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2) {
    v2 = (void *)v2[3];
  }
  id v4 = v2;
  -[BKGraphDescription appendNode:](v3, @"%@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  id v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke_2;
  v15[3] = &unk_1E6870EB8;
  id v16 = v11;
  id v17 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = *(void **)(a1 + 64);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = v14;
  -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v16, 1, v15);
}

void __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = *(id **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) target];
  -[BKGraphDescription appendNode:](v2, @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  uint64_t v10 = *(void **)(a1 + 48);
  if (v10) {
    uint64_t v10 = (void *)v10[4];
  }
  id v11 = v10;
  unint64_t v21 = 0;
  -[BKHIDEventDeliveryManager _recursiveAppendNodes:index:toGraphDescription:](*(void *)(a1 + 56), v11, &v21, *(void **)(a1 + 32));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 64) addObject:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)_recursiveAppendNodes:(unint64_t *)a3 index:(void *)a4 toGraphDescription:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    unint64_t v9 = *a3;
    if (v9 < [v7 count])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__BKHIDEventDeliveryManager__recursiveAppendNodes_index_toGraphDescription___block_invoke;
      v10[3] = &unk_1E6870E90;
      id v11 = v7;
      uint64_t v14 = a3;
      id v12 = v8;
      uint64_t v13 = a1;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v12, 1, v10);
    }
  }
}

uint64_t __76__BKHIDEventDeliveryManager__recursiveAppendNodes_index_toGraphDescription___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectAtIndex:**(void **)(a1 + 56)];
  -[BKEventDeferringNode appendGraphDescription:]((uint64_t)v2, *(void **)(a1 + 40));

  ++**(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);

  return -[BKHIDEventDeliveryManager _recursiveAppendNodes:index:toGraphDescription:](v3, v4);
}

- (BKSHIDEventAuthenticationOriginator)authenticationOriginator
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  authenticationOriginator = self->_authenticationOriginator;
  if (!authenticationOriginator)
  {
    uint64_t v5 = (BKSHIDEventAuthenticationOriginator *)objc_alloc_init(MEMORY[0x1E4F4F278]);
    uint64_t v6 = self->_authenticationOriginator;
    self->_authenticationOriginator = v5;

    authenticationOriginator = self->_authenticationOriginator;
  }
  id v7 = authenticationOriginator;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)destinationsForKeyCommand:(id)a3 sender:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  unint64_t v9 = -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v6, v7, 0);
  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = BKLogEventDelivery();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = _BKResolutionDescriptionForLogging(v9, 1);
    int v13 = 138543874;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    long long v18 = v11;
    _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "destinationsForKeyCommand:%{public}@ sender:%{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (id)destinationsStartingFromPID:(int)a3 deferringPredicate:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 <= 0)
  {
    id v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pid > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v37 = NSStringFromSelector(a2);
      uint64_t v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      *(void *)char v65 = v37;
      *(_WORD *)&v65[8] = 2114;
      *(void *)&v65[10] = v39;
      *(_WORD *)&v65[18] = 2048;
      *(void *)&v65[20] = self;
      *(_WORD *)&v65[28] = 2114;
      *(void *)&v65[30] = @"BKHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 746;
      __int16 v68 = 2114;
      long long v69 = v36;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF4144);
  }
  id v7 = v6;
  if (!v6)
  {
    uint64_t v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"predicate != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = NSStringFromSelector(a2);
      v42 = (objc_class *)objc_opt_class();
      uint64_t v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138544642;
      *(void *)char v65 = v41;
      *(_WORD *)&v65[8] = 2114;
      *(void *)&v65[10] = v43;
      *(_WORD *)&v65[18] = 2048;
      *(void *)&v65[20] = self;
      *(_WORD *)&v65[28] = 2114;
      *(void *)&v65[30] = @"BKHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 747;
      __int16 v68 = 2114;
      long long v69 = v40;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF4244);
  }
  id v49 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v46 = [v7 environment];
  uint64_t v44 = [v7 display];
  int v45 = a3;
  uint64_t v8 = [(BSMutableIntegerMap *)self->_clientsByPID objectForKey:a3];
  unint64_t v9 = (void *)v8;
  if (v8 && (id v10 = *(id *)(v8 + 24)) != 0)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v11 = v10;
    uint64_t v52 = [v11 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v52)
    {
      obuint64_t j = v11;
      uint64_t v50 = *(void *)v59;
      uint64_t v51 = v9;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v59 != v50) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v58 + 1) + 8 * v12);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          uint64_t v53 = v12;
          if (v13) {
            int v13 = (void *)v13[5];
          }
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v55 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = [*(id *)(*((void *)&v54 + 1) + 8 * i) lastObject];
                long long v20 = [v19 environment];
                unint64_t v21 = [v7 environment];
                int v22 = [v20 isEqual:v21];

                if (v22)
                {
                  uint64_t v23 = [v7 token];
                  if (!v23) {
                    goto LABEL_23;
                  }
                  uint64_t v24 = (void *)v23;
                  uint64_t v25 = [v7 token];
                  uint64_t v26 = [v19 token];
                  int v27 = BSEqualObjects();

                  if (v27)
                  {
LABEL_23:
                    [v49 addObject:v19];

                    goto LABEL_24;
                  }
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          uint64_t v12 = v53 + 1;
          unint64_t v9 = v51;
        }
        while (v53 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v52);
      id v11 = obj;
    }
    uint64_t v28 = v11;
  }
  else
  {
    uint64_t v29 = -[BKHIDEventDeliveryManager _lock_resolveDeferringChainForPID:display:environment:dispatchingTarget:getTargetOrder:]((uint64_t)self, a3, v44, v46, 0, 0);
    if (v29) {
      [v49 addObject:v29];
    }
    uint64_t v30 = (void *)v29;
    id v31 = BKLogEventDeliveryMatching();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)char v65 = v30;
      _os_log_debug_impl(&dword_1CFDE2000, v31, OS_LOG_TYPE_DEBUG, " resolved directly: %{public}@", buf, 0xCu);
    }

    uint64_t v28 = 0;
    id v11 = v30;
  }

  uint64_t v32 = -[BKHIDEventDeliveryManager _lock_processDescriptionForPID:]((uint64_t)self, v45);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v33 = BKLogEventDelivery();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = _BKResolutionDescriptionForLogging(v49, 1);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)char v65 = v45;
    *(_WORD *)&v65[4] = 2114;
    *(void *)&v65[6] = v32;
    *(_WORD *)&v65[14] = 2114;
    *(void *)&v65[16] = v7;
    *(_WORD *)&v65[24] = 2114;
    *(void *)&v65[26] = v34;
    _os_log_impl(&dword_1CFDE2000, v33, OS_LOG_TYPE_DEFAULT, "destinations startingFromPID:%d (%{public}@) predicate:%{public}@: %{public}@", buf, 0x26u);
  }

  return v49;
}

- (void)forceSelectDeferringTarget:(id)a3 forEnvironment:(id)a4 forClientWithPID:(int)a5
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  os_unfair_lock_unlock(p_lock);
}

- (void)selectDeferringPredicate:(id)a3 forClientWithPID:(int)a4
{
  p_locuint64_t k = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  id v7 = v6;
  uint64_t v8 = v7;
  if (self)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __77__BKHIDEventDeliveryManager__lock_selectDeferringPredicate_forClientWithPID___block_invoke;
    uint64_t v12 = &unk_1E68718D8;
    int v13 = self;
    id v14 = v7;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:]((uint64_t)self, @"select", &v9);
    [(NSMutableDictionary *)self->_destinationCacheBySender removeAllObjects];
  }

  os_unfair_lock_unlock(p_lock);
}

void __77__BKHIDEventDeliveryManager__lock_selectDeferringPredicate_forClientWithPID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    v2 = (objc_class *)MEMORY[0x1E4F4F268];
    id v3 = *(id *)(a1 + 40);
    id v4 = [v2 alloc];
    uint64_t v5 = [v3 display];
    id v6 = [v3 environment];
    id v24 = (id)[v4 initWithDisplay:v5 environment:v6];

    id v7 = [*(id *)(v1 + 8) objectForKey:v24];
    uint64_t v8 = [v3 token];

    id v9 = v8;
    if (v7)
    {
      uint64_t v10 = BKLogEventDelivery();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v9;
        _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "selectDeferringPathForToken:%{public}@", buf, 0xCu);
      }

      uint64_t v11 = [v7[8] objectForKey:v9];
      if (v11)
      {
        uint64_t v12 = (id *)v11;
        int v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:]((uint64_t)v7, v12, v13);
        id v14 = [v13 lastObject];
        uint64_t v15 = v14;
        if (v14)
        {
          uint64_t v16 = v14;

          uint64_t v12 = v16;
        }
        [v7[3] removeAllObjects];
        uint64_t v17 = 0;
        do
        {
          long long v18 = v17;
          id v19 = v12[2];
          uint64_t v17 = [v19 identity];

          [v7[3] addObject:v17];
          id v20 = v12[3];
          uint64_t v21 = [v20 firstObject];

          uint64_t v12 = (id *)v21;
        }
        while (v21);
        int v22 = BKLogEventDelivery();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = v7[3];
          *(_DWORD *)buf = 138543362;
          id v26 = v23;
          _os_log_impl(&dword_1CFDE2000, v22, OS_LOG_TYPE_DEFAULT, "selected nodes now: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        int v13 = BKLogEventDelivery();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v9;
          _os_log_error_impl(&dword_1CFDE2000, v13, OS_LOG_TYPE_ERROR, "selection target not found: %{public}@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) deliveryChainDidUpdate:0 forIdentity:a2 reason:*(void *)(a1 + 40)];
}

- (void)setActiveUIResponders:(id)a3 forClientWithPID:(int)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    -[BKEventDeferringGraph setActiveUIResponderPredicates:forPID:]((uint64_t)self->_deferringGraph, v6, a4);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)sequenceForFirstEvent:(__IOHIDEvent *)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v35 = v12;
  int v13 = [v12 senderDescriptorForEventType:IOHIDEventGetType()];
  id v14 = -[BKHIDEventDeliveryManager _lock_destinationsForEvent:sender:]((uint64_t)self, (uint64_t)a3, v13);

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v23 = [v22 dispatchingTarget];
        id v24 = [(NSMutableDictionary *)self->_buffersByDispatchTarget objectForKey:v23];
        if (v24)
        {
          uint64_t v25 = v16;
          id v26 = v24;
        }
        else
        {
          uint64_t v25 = v15;
          id v26 = v22;
        }
        [v25 addObject:v26];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v19);
  }

  uint64_t v27 = [[BKHIDEventDeliverySequence alloc] initWithProcessor:v34 dispatcher:v33 senderInfo:v35 additionalContext:v32 keyCommand:0 deliveryManager:self resolutions:v15 buffers:v16];
  os_unfair_lock_unlock(lock);
  uint64_t v28 = BKLogEventDelivery();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    IOHIDEventGetType();
    uint64_t Name = IOHIDEventTypeGetName();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = Name;
    __int16 v42 = 2114;
    uint64_t v43 = v27;
    _os_log_impl(&dword_1CFDE2000, v28, OS_LOG_TYPE_DEFAULT, "sequence starting with %{public}@ event: %{public}@", buf, 0x16u);
  }

  return v27;
}

- (id)sequenceForKeyCommand:(id)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  os_unfair_lock_lock(&self->_lock);
  id v17 = [v13 senderDescriptorForEventType:3];
  uint64_t v18 = -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v12, v17, 0);

  long long v39 = v18;
  if ([v18 count])
  {
    id v34 = v15;
    id v37 = v12;
    id v38 = v16;
    id v35 = v14;
    id v36 = v13;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v27 = [v26 dispatchingTarget];
          uint64_t v28 = [(NSMutableDictionary *)self->_buffersByDispatchTarget objectForKey:v27];
          if (v28)
          {
            uint64_t v29 = v20;
            uint64_t v30 = v28;
          }
          else
          {
            uint64_t v29 = v19;
            uint64_t v30 = v26;
          }
          [v29 addObject:v30];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v23);
    }

    id v15 = v34;
    id v14 = v35;
    id v13 = v36;
    id v12 = v37;
    id v31 = [[BKHIDEventDeliverySequence alloc] initWithProcessor:v35 dispatcher:v34 senderInfo:v36 additionalContext:v38 keyCommand:v37 deliveryManager:self resolutions:v19 buffers:v20];
    os_unfair_lock_unlock(&self->_lock);
    id v32 = BKLogEventDelivery();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v45 = v37;
      __int16 v46 = 2114;
      uint64_t v47 = v31;
      _os_log_impl(&dword_1CFDE2000, v32, OS_LOG_TYPE_DEFAULT, "sequence starting with key command %{public}@: %{public}@", buf, 0x16u);
    }

    id v16 = v38;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v31 = 0;
  }

  return v31;
}

void __80__BKHIDEventDeliveryManager__lock_setEventBufferingPredicates_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  [v3 _fireTimeoutForPID:v2 bufferingPredicates:v4 client:v5];
  [v6 invalidate];
}

- (void)setKeyCommandsRegistrations:(id)a3 forClientWithPID:(int)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v27 = self;
  self = (BKHIDEventDeliveryManager *)((char *)self + 8);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)self);
  locuint64_t k = (os_unfair_lock_s *)self;
  os_unfair_lock_lock((os_unfair_lock_t)self);
  uint64_t v28 = (void *)[v5 mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "keyCommands", lock, v27);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v48 count:16];
        if (!v12)
        {
          id v14 = 0;
          uint64_t v18 = v11;
          goto LABEL_20;
        }
        uint64_t v13 = v12;
        id v14 = 0;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v11);
            }
            id v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (([v17 isRoutableKeyCommand] & 1) == 0)
            {
              if (!v14) {
                id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              }
              [v14 addObject:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v48 count:16];
        }
        while (v13);

        if (v14)
        {
          [v28 removeObject:v9];
          uint64_t v18 = (void *)[v11 mutableCopy];
          [v18 minusSet:v14];
          id v19 = (void *)[v9 mutableCopy];
          [v19 setKeyCommands:v18];
          [v28 addObject:v19];

          id v11 = v19;
LABEL_20:

          id v11 = v18;
        }
        id v20 = [v9 deferringEnvironment];
        id v21 = [v9 deferringToken];
        if ([v14 count])
        {
          uint64_t v22 = BKLogEventDelivery();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = [MEMORY[0x1E4F4F2E0] _descriptionForKeyCommandCollection:v14];
            *(_DWORD *)buf = 67109378;
            int v41 = a4;
            __int16 v42 = 2114;
            long long v43 = v25;
            _os_log_error_impl(&dword_1CFDE2000, v22, OS_LOG_TYPE_ERROR, "ignoring non-routable key commands for pid:%d %{public}@", buf, 0x12u);
          }
        }
        uint64_t v23 = BKLogEventDelivery();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [MEMORY[0x1E4F4F2E0] _descriptionForKeyCommandCollection:v11];
          *(_DWORD *)buf = 67109890;
          int v41 = a4;
          __int16 v42 = 2114;
          long long v43 = v20;
          __int16 v44 = 2114;
          id v45 = v21;
          __int16 v46 = 2114;
          uint64_t v47 = v24;
          _os_log_impl(&dword_1CFDE2000, v23, OS_LOG_TYPE_DEFAULT, "new key command registrations for pid:%d env:%{public}@ token:%{public}@ %{public}@", buf, 0x26u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v7);
  }

  -[BKHIDEventDeliveryManager _lock_setKeyCommandsRegistrations:forClientWithPID:]((uint64_t)v27, v28, a4);
  os_unfair_lock_unlock(lock);
}

- (void)_lock_setKeyCommandsRegistrations:(int)a3 forClientWithPID:
{
  if (a1)
  {
    uint64_t v6 = (const os_unfair_lock *)(a1 + 8);
    id v7 = a2;
    os_unfair_lock_assert_owner(v6);
    -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, 1);
    uint64_t v8 = (id *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      objc_storeStrong(v8 + 6, a2);
    }
  }
}

- (void)setKeyCommandRoots:(id)a3 forClientWithPID:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke;
  v10[3] = &unk_1E6870E18;
  id v8 = v7;
  id v11 = v8;
  [v8 appendCollection:v6 withName:0 itemBlock:v10];
  id v9 = BKLogEventDelivery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = a4;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, "new key command dispatching rules for pid:%d: %{public}@", buf, 0x12u);
  }

  -[BKHIDEventDeliveryManager _lock_setKeyCommandRoots:forClientWithPID:]((uint64_t)self, v6, a4);
  os_unfair_lock_unlock(&self->_lock);
}

void __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 reason];
  id v6 = [v5 _stringRepresentation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_2;
  v8[3] = &unk_1E6870DF0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v7 = v3;
  [v4 appendCustomFormatWithName:v6 block:v8];
}

- (void)_lock_setKeyCommandRoots:(int)a3 forClientWithPID:
{
  if (a1)
  {
    id v5 = (const os_unfair_lock *)(a1 + 8);
    id v6 = a2;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(v6, "bs_map:", &__block_literal_global_210);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, 1);
    id v8 = (id *)v7;
    if (v7)
    {
      id v9 = *(id *)(v7 + 32);
      if (v9) {
        [*(id *)(a1 + 48) removeObjectsInArray:v9];
      }
      objc_storeStrong(v8 + 4, obj);
    }
    else
    {
      id v9 = 0;
    }
    if ([obj count]) {
      [*(id *)(a1 + 48) addObjectsFromArray:obj];
    }
  }
}

_BKHIDKeyCommandDeliveryRoot *__71__BKHIDEventDeliveryManager__lock_setKeyCommandRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(_BKHIDKeyCommandDeliveryRoot);
  uint64_t v4 = NSString;
  uint64_t v5 = [v2 seed];
  id v6 = [v2 reason];
  id v8 = [v4 stringWithFormat:@"%u-%@", v5, v6];
  if (v3) {
    objc_setProperty_nonatomic_copy(v3, v7, v8, 8);
  }

  id v9 = [v2 rule];
  if (v3) {
    objc_storeStrong((id *)&v3->_dispatchingRule, v9);
  }

  return v3;
}

void __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rule];
  id v3 = [v2 predicate];

  uint64_t v4 = [v3 senderDescriptors];
  _BKDescribeSenderSet(*(void **)(a1 + 40), v4);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) rule];
  uint64_t v7 = [v6 targets];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_3;
  v8[3] = &unk_1E6870DC8;
  id v9 = *(id *)(a1 + 40);
  [v5 appendCollection:v7 withName:@"targets" itemBlock:v8];
}

id __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0 skipIfNil:0];
}

- (void)setDispatchingRoots:(id)a3 forClientWithPID:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke;
  v10[3] = &unk_1E6870DA0;
  id v8 = v7;
  id v11 = v8;
  [v8 appendCollection:v6 withName:0 itemBlock:v10];
  id v9 = BKLogEventDelivery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = a4;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, "new dispatching rulesets for pid:%d: %{public}@", buf, 0x12u);
  }

  -[BKHIDEventDeliveryManager _lock_setDispatchingRoots:forClientWithPID:]((id *)&self->super.isa, v6, a4);
  os_unfair_lock_unlock(&self->_lock);
}

void __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 rules];
  id v6 = [v4 reason];

  uint64_t v7 = [v6 _stringRepresentation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke_2;
  v8[3] = &unk_1E6870D78;
  id v9 = *(id *)(a1 + 32);
  [v3 appendCollection:v5 withName:v7 itemBlock:v8];
}

- (void)_lock_setDispatchingRoots:(int)a3 forClientWithPID:
{
  if (a1)
  {
    uint64_t v5 = (const os_unfair_lock *)(a1 + 1);
    id v6 = a2;
    os_unfair_lock_assert_owner(v5);
    uint64_t v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_195);

    uint64_t v8 = -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:]((uint64_t)a1, a3, 1);
    id v9 = (void *)v8;
    if (v8) {
      id v10 = *(void **)(v8 + 24);
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke_2;
    uint64_t v18 = &unk_1E6870F00;
    id v12 = v11;
    id v19 = v12;
    id v20 = a1;
    id v13 = v9;
    id v21 = v13;
    id v14 = v7;
    id v22 = v14;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:]((uint64_t)a1, @"setDispatchingRoots", &v15);
    objc_msgSend(a1[13], "removeAllObjects", v15, v16, v17, v18);
    if ([a1[10] count]) {
      [a1[15] requestBufferReevaluationWithContext:0];
    }
  }
}

void __72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "removeObjectsInArray:");
  }
  uint64_t v2 = *(void *)(v1 + 48);
  if (v2) {
    objc_storeStrong((id *)(v2 + 24), *(id *)(v1 + 56));
  }
  if ([*(id *)(v1 + 56) count]) {
    [*(id *)(*(void *)(v1 + 40) + 32) addObjectsFromArray:*(void *)(v1 + 56)];
  }
  *(void *)(*(void *)(v1 + 40) + 40) = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = *(id *)(*(void *)(v1 + 40) + 32);
  uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v76 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v62;
    uint64_t v43 = v1;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v62 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v61 + 1) + 8 * v4);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v45 = v5;
        if (v5) {
          uint64_t v5 = (void *)v5[2];
        }
        uint64_t v46 = v4;
        uint64_t v49 = v5;
        uint64_t v6 = [v49 countByEnumeratingWithState:&v57 objects:v75 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = 0;
          uint64_t v9 = *(void *)v58;
          uint64_t v47 = *(void *)v58;
          do
          {
            uint64_t v10 = 0;
            location = (id *)v7;
            do
            {
              if (*(void *)v58 != v9) {
                objc_enumerationMutation(v49);
              }
              id v11 = *(void **)(*((void *)&v57 + 1) + 8 * v10);
              id v12 = [v11 predicate];
              id v13 = [v12 senderDescriptors];

              if ([v13 count])
              {
                uint64_t v51 = v11;
                long long v55 = 0u;
                long long v56 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                id v14 = v13;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v74 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v54;
                  do
                  {
                    for (uint64_t i = 0; i != v16; ++i)
                    {
                      if (*(void *)v54 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      id v19 = [*(id *)(*((void *)&v53 + 1) + 8 * i) associatedDisplay];
                      if (!v19)
                      {
                        id v19 = [MEMORY[0x1E4F4F2D0] nullDisplay];
                      }
                      [v3 addObject:v19];
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v74 count:16];
                  }
                  while (v16);
                  uint64_t v9 = v47;
                  uint64_t v7 = (uint64_t)location;
                }
                id v11 = v51;
              }
              else
              {
                id v14 = [MEMORY[0x1E4F4F2D0] nullDisplay];
                [v3 addObject:v14];
              }

              v8 |= [v11 predicateEventTypeMask];
              ++v10;
            }
            while (v10 != v7);
            uint64_t v7 = [v49 countByEnumeratingWithState:&v57 objects:v75 count:16];
          }
          while (v7);
        }
        else
        {
          uint64_t v8 = 0;
        }

        if (v8) {
          uint64_t v20 = -1;
        }
        else {
          uint64_t v20 = v8;
        }
        if (v45) {
          v45[6] = v20;
        }
        uint64_t v1 = v43;
        *(void *)(*(void *)(v43 + 40) + 40) |= v20;
        uint64_t v4 = v46 + 1;
      }
      while (v46 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v76 count:16];
    }
    while (v44);
  }

  uint64_t v21 = *(void *)(*(void *)(v1 + 40) + 64);
  id v50 = v3;
  if (v21)
  {
    id v22 = (void *)[*(id *)(v21 + 24) mutableCopy];
    uint64_t v23 = v22;
    if (v22) {
      [v22 minusSet:v50];
    }
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v24 = *(id *)(v21 + 8);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v71 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v70 + 1) + 8 * j);
          uint64_t v30 = [v29 display];
          int v31 = [v23 containsObject:v30];

          if (v31) {
            [v52 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v26);
    }

    [*(id *)(v21 + 8) removeObjectsForKeys:v52];
    long long v32 = (void *)[v50 mutableCopy];
    long long v33 = v32;
    if (*(void *)(v21 + 24)) {
      objc_msgSend(v32, "minusSet:");
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v34 = v33;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v67;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v67 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v66 + 1) + 8 * k);
          long long v40 = *(void **)(v21 + 16);
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __43__BKEventDeferringGraph_setSenderDisplays___block_invoke;
          v65[3] = &unk_1E68715F0;
          v65[4] = v21;
          v65[5] = v39;
          [v40 enumerateKeysAndObjectsUsingBlock:v65];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v66 objects:v77 count:16];
      }
      while (v36);
    }

    objc_storeStrong((id *)(v21 + 24), v3);
  }
}

_BKHIDEventDeliveryRoot *__72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(_BKHIDEventDeliveryRoot);
  uint64_t v4 = NSString;
  uint64_t v5 = [v2 seed];
  uint64_t v6 = [v2 reason];
  uint64_t v8 = [v4 stringWithFormat:@"%u-%@", v5, v6];
  if (v3) {
    objc_setProperty_nonatomic_copy(v3, v7, v8, 8);
  }

  uint64_t v9 = [v2 rules];
  if (v3) {
    objc_storeStrong((id *)&v3->_dispatchingRules, v9);
  }

  return v3;
}

void __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 predicate];
  uint64_t v5 = [v4 senderDescriptors];
  _BKDescribeSenderSet(*(void **)(a1 + 32), v5);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v4 descriptors];
  id v8 = v6;
  id v9 = v7;
  if ([v9 count])
  {
    uint64_t v21 = v8;
    id v22 = v5;
    id v23 = v3;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v15), "hidEventType"));
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___BKDescribeEventDescriptors_block_invoke;
    v24[3] = &unk_1E68718D8;
    id v8 = v21;
    id v25 = v21;
    id v26 = v10;
    id v17 = v10;
    [v25 sameLine:v24];

    uint64_t v5 = v22;
    id v3 = v23;
  }

  [*(id *)(a1 + 32) appendRightArrow];
  uint64_t v18 = *(void **)(a1 + 32);
  id v19 = [v3 target];
  id v20 = (id)[v18 appendObject:v19 withName:0 skipIfNil:0];
}

- (void)processDidTerminate:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v12 = [(BSMutableIntegerMap *)self->_clientsByPID objectForKey:a3];
  if (v12)
  {
    uint64_t v6 = v12;
    os_unfair_lock_assert_owner(p_lock);
    uint64_t v7 = *((unsigned int *)v6 + 3);
    id v8 = BKLogEventDelivery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1CFDE2000, v8, OS_LOG_TYPE_DEFAULT, "pid:%d terminated", buf, 8u);
    }

    v6[8] = 1;
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    -[BKHIDEventDeliveryManager _lock_setDispatchingRoots:forClientWithPID:]((id *)&self->super.isa, MEMORY[0x1E4F1CBF0], v7);
    -[BKHIDEventDeliveryManager _lock_setKeyCommandRoots:forClientWithPID:]((uint64_t)self, v9, v7);
    -[BKHIDEventDeliveryManager _lock_setDeferringRules:forClientWithPID:]((uint64_t)self, v9, v7);
    -[BKEventDeferringGraph setActiveUIResponderPredicates:forPID:]((uint64_t)self->_deferringGraph, v9, v7);
    -[BKHIDEventDeliveryManager _lock_setKeyCommandsRegistrations:forClientWithPID:]((uint64_t)self, 0, v7);
    -[BKHIDEventDeliveryManager _lock_setEventBufferingPredicates:forClientWithPID:]((uint64_t)self, 0, v7);
    deferringGraph = self->_deferringGraph;
    if (deferringGraph)
    {
      identityToGraph = deferringGraph->_identityToGraph;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __45__BKEventDeferringGraph_processDidTerminate___block_invoke;
      uint64_t v16 = &__block_descriptor_36_e81_v32__0__BKSEventDeferringChainIdentity_8__BKEventDeferringEnvironmentGraph_16_B24l;
      int v17 = v7;
      [(NSMutableDictionary *)identityToGraph enumerateKeysAndObjectsUsingBlock:buf];
    }
    [v6 invalidate];
    [(BSMutableIntegerMap *)self->_clientsByPID removeObjectForKey:(int)v7];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BKSHIDEventDisplay)mainDisplay
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_mainDisplay;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setMainDisplay:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (BKSHIDEventDisplay *)a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
  }
  mainDisplay = self->_mainDisplay;
  p_mainDisplay = &self->_mainDisplay;
  if (mainDisplay != v4)
  {
    id v8 = BKLogEventDelivery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1CFDE2000, v8, OS_LOG_TYPE_DEFAULT, "main display is now: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)p_mainDisplay, v4);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)currentBuffersPerDispatchTarget
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_buffersByDispatchTarget copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (void)dealloc
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(BSMutableIntegerMap *)self->_clientsByPID enumerateWithBlock:&__block_literal_global_286];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)BKHIDEventDeliveryManager;
  [(BKHIDEventDeliveryManager *)&v4 dealloc];
}

uint64_t __36__BKHIDEventDeliveryManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (BKHIDEventDeliveryManager)initWithObserverService:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKHIDEventDeliveryManager;
  uint64_t v6 = [(BKHIDEventDeliveryManager *)&v25 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    id v8 = objc_alloc_init(BKEventDeferringGraph);
    deferringGraph = v7->_deferringGraph;
    v7->_deferringGraph = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    deliveryRoots = v7->_deliveryRoots;
    v7->_deliveryRoots = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    keyCommandDeliveryRoots = v7->_keyCommandDeliveryRoots;
    v7->_keyCommandDeliveryRoots = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    clientsByPID = v7->_clientsByPID;
    v7->_clientsByPID = (BSMutableIntegerMap *)v14;

    uint64_t v16 = objc_opt_new();
    deferringRulesByPID = v7->_deferringRulesByPID;
    v7->_deferringRulesByPID = (BSMutableIntegerMap *)v16;

    uint64_t v18 = objc_opt_new();
    bufferingPredicatesByPID = v7->_bufferingPredicatesByPID;
    v7->_bufferingPredicatesByPID = (BSMutableIntegerMap *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    destinationCacheBySender = v7->_destinationCacheBySender;
    v7->_destinationCacheBySender = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v7->_resolutionObserver, a3);
    uint64_t v22 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    mainDisplay = v7->_mainDisplay;
    v7->_mainDisplay = (BKSHIDEventDisplay *)v22;
  }
  return v7;
}

- (BKHIDEventDeliveryManager)init
{
  objc_super v4 = [NSString stringWithFormat:@"Use initWithObserverService:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKHIDEventDeliveryManager.m";
    __int16 v17 = 1024;
    int v18 = 287;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKHIDEventDeliveryManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end