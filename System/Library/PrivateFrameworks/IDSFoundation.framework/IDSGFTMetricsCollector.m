@interface IDSGFTMetricsCollector
- (BOOL)isInitiator;
- (IDSGFTMetricsCollector)init;
- (IDSGFTMetricsLocalJoin)localJoin;
- (NSSet)activeParticipantURIs;
- (NSString)conversationID;
- (id)begin:(id)a3 uniqueID:(id)a4;
- (id)begin:(id)a3 uniqueID:(id)a4 withClass:(Class)a5;
- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4;
- (id)createLinkCycle;
- (id)error:(id)a3;
- (id)getOrCreateMKICycleFor:(id)a3;
- (id)joinCycleForToken:(id)a3;
- (id)keyValueDelivery;
- (id)localDidJoin;
- (id)request:(id)a3;
- (id)uniqueError:(id)a3;
- (void)allocbindResponseForProtocolStack:(id)a3;
- (void)allocbindResponseFromInterface:(id)a3;
- (void)annotate:(id)a3 block:(id)a4;
- (void)annotate:(id)a3 withEvent:(id)a4;
- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5;
- (void)clientChannelConnected;
- (void)connectQRServer;
- (void)didConnectUnderlyingE2ELink;
- (void)didConnectUnderlyingRelayLink;
- (void)didCreateMKM:(id)a3;
- (void)didFailConnectionOfType:(id)a3;
- (void)didMitigateCollision:(BOOL)a3;
- (void)didSendJoin;
- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4;
- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4;
- (void)flushPendingNowKnownMKMs;
- (void)globalLinkStart;
- (void)hasConvergence;
- (void)hasGoaway;
- (void)hasRealloc;
- (void)hasSentCompoundPacket;
- (void)linkConnectedUsingFakeTLS;
- (void)linkConnectedUsingHTTP2;
- (void)linkConnectedUsingQUIC;
- (void)linkConnectedUsingTCPSTUN;
- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3;
- (void)mapMKI:(id)a3 toPushToken:(id)a4;
- (void)membershipChange;
- (void)participantIdChanged;
- (void)participantIdUnknown;
- (void)quicAllocbindRequest;
- (void)quicAllocbindResponse;
- (void)receivedKMOverPushFromToken:(id)a3;
- (void)receivedKMOverPushViaCacheForToken:(id)a3;
- (void)receivedKMOverQRFromToken:(id)a3;
- (void)receivedKMOverQUICFromToken:(id)a3;
- (void)receivedUnknownKMOverPushViaCache:(id)a3;
- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3;
- (void)remoteDidBecomeActive:(id)a3;
- (void)remoteDidJoin:(id)a3;
- (void)selectedLocalInterface:(id)a3;
- (void)sendAllocationRequest;
- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4;
- (void)sendRatchetedKMtoAVCForToken:(id)a3;
- (void)serverShortMKICacheMiss;
- (void)setActiveParticipantURIs:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)stunAllocbindRequest;
- (void)stunAllocbindResponse;
- (void)tcpAllocbindRequest;
- (void)tcpAllocbindResponse;
- (void)transactionIDMismatchDetected;
- (void)useGecko;
- (void)willSendAllocbindRequestThroughInterface:(id)a3;
- (void)willSendJoin;
@end

@implementation IDSGFTMetricsCollector

- (IDSGFTMetricsCollector)init
{
  v16.receiver = self;
  v16.super_class = (Class)IDSGFTMetricsCollector;
  v2 = [(IDSGFTMetricsCollector *)&v16 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_referencePointsByType)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      referencePointsByType = v3->_referencePointsByType;
      v3->_referencePointsByType = (NSMutableDictionary *)Mutable;
    }
    if (!v3->_annotatorsByEventType)
    {
      CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      annotatorsByEventType = v3->_annotatorsByEventType;
      v3->_annotatorsByEventType = (NSMutableDictionary *)v6;
    }
    v8 = objc_alloc_init(IDSGFTMetricsAnonymizer);
    anonymizer = v3->_anonymizer;
    v3->_anonymizer = v8;

    uint64_t v13 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v10, v11, v12);
    activeParticipantURIs = v3->_activeParticipantURIs;
    v3->_activeParticipantURIs = (NSSet *)v13;

    *(void *)&v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)begin:(id)a3 uniqueID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_begin_uniqueID_withClass_(self, v9, (uint64_t)v7, v10, v6, v8);

  return v11;
}

- (id)begin:(id)a3 uniqueID:(id)a4 withClass:(Class)a5
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v11 = a4;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], v9, v10, v12);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v16 = objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v14, (uint64_t)v8, v15);

  if (!v16)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    objc_msgSend_setObject_forKeyedSubscript_(self->_referencePointsByType, v20, (uint64_t)Mutable, v21, v8);
  }
  v22 = objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v17, (uint64_t)v8, v18);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v11, v24);

  if (!v25)
  {
    id v26 = [a5 alloc];
    anonymizer = self->_anonymizer;
    v51[0] = @"i";
    v30 = objc_msgSend_numberWithBool_(NSNumber, v28, self->_isInitiator, v29);
    v51[1] = @"aps";
    v52[0] = v30;
    v31 = NSNumber;
    uint64_t v35 = objc_msgSend_count(self->_activeParticipantURIs, v32, v33, v34);
    v38 = objc_msgSend_numberWithUnsignedInteger_(v31, v36, v35, v37);
    v52[1] = v38;
    v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)v52, v40, v51, 2);
    v25 = objc_msgSend_initWithFromType_fromUniqueID_anonymizer_templateDictionary_(v26, v42, (uint64_t)v8, v43, v11, anonymizer, v41);

    v46 = objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v44, (uint64_t)v8, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v46, v47, (uint64_t)v25, v48, v11);
  }
  os_unfair_lock_unlock(p_lock);
  id v49 = v25;

  return v49;
}

- (void)annotate:(id)a3 block:(id)a4
{
  id v20 = a3;
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(self->_annotatorsByEventType, v8, (uint64_t)v20, v9);

  if (!v10)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_setObject_forKeyedSubscript_(self->_annotatorsByEventType, v14, (uint64_t)v13, v15, v20);
  }
  objc_super v16 = objc_msgSend_objectForKeyedSubscript_(self->_annotatorsByEventType, v11, (uint64_t)v20, v12);
  v17 = _Block_copy(v7);

  objc_msgSend_addObject_(v16, v18, (uint64_t)v17, v19);
  os_unfair_lock_unlock(p_lock);
}

- (void)annotate:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = ids_monotonic_time();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = sub_19DAFADD4;
  objc_super v16 = &unk_1E5975220;
  id v17 = v6;
  double v18 = v8;
  id v9 = v6;
  uint64_t v10 = _Block_copy(&v13);
  objc_msgSend_annotate_block_(self, v11, (uint64_t)v7, v12, v10, v13, v14, v15, v16);
}

- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4
{
  BOOL v160 = a4;
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  objc_msgSend_flushPendingNowKnownMKMs(self, a2, a4, a3);
  v172 = self;
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = objc_msgSend_Metrics(IDSFoundationLog, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v207 = a3;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "GFTMetrics: collecting metrics with timeBase %f", buf, 0xCu);
  }

  objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12);
  id v171 = (id)objc_claimAutoreleasedReturnValue();
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  obuint64_t j = v172->_referencePointsByType;
  uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v196, v14, v205, 16);
  if (v157)
  {
    uint64_t v156 = *(void *)v197;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v197 != v156) {
          objc_enumerationMutation(obj);
        }
        uint64_t v158 = v17;
        uint64_t v18 = *(void *)(*((void *)&v196 + 1) + 8 * v17);
        v166 = objc_msgSend_objectForKeyedSubscript_(v172->_annotatorsByEventType, v15, v18, v16, lock);
        v174 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v19, v20, v21);
        v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v22, v23, v24);
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v162 = (id)v18;
        objc_msgSend_objectForKeyedSubscript_(v172->_referencePointsByType, v26, v18, 0.0);
        id v159 = (id)objc_claimAutoreleasedReturnValue();
        v173 = v25;
        uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v27, (uint64_t)&v192, v28, v204, 16);
        if (!v164)
        {
          id v175 = 0;
          goto LABEL_48;
        }
        id v175 = 0;
        uint64_t v161 = *(void *)v193;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v193 != v161) {
              objc_enumerationMutation(v159);
            }
            uint64_t v169 = v31;
            uint64_t v32 = *(void *)(*((void *)&v192 + 1) + 8 * v31);
            uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v172->_referencePointsByType, v29, (uint64_t)v162, v30);
            v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, v32, v35);

            if (v166)
            {
              long long v190 = 0u;
              long long v191 = 0u;
              long long v188 = 0u;
              long long v189 = 0u;
              id v38 = v166;
              uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v188, v40, v203, 16);
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v189;
                do
                {
                  for (uint64_t i = 0; i != v42; ++i)
                  {
                    if (*(void *)v189 != v43) {
                      objc_enumerationMutation(v38);
                    }
                    (*(void (**)(void))(*(void *)(*((void *)&v188 + 1) + 8 * i) + 16))();
                  }
                  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v45, (uint64_t)&v188, v46, v203, 16);
                }
                while (v42);
              }
            }
            v167 = v36;
            v47 = objc_msgSend_collectForTimeBase_anonymize_(v36, v37, v160, a3);
            long long v184 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v184, 0.0, v202, 16);
            if (v49)
            {
              uint64_t v52 = v49;
              uint64_t v53 = *(void *)v185;
              do
              {
                for (uint64_t j = 0; j != v52; ++j)
                {
                  if (*(void *)v185 != v53) {
                    objc_enumerationMutation(v47);
                  }
                  v55 = *(void **)(*((void *)&v184 + 1) + 8 * j);
                  v56 = objc_msgSend_objectForKeyedSubscript_(v55, v50, @"toID", v51);
                  v59 = objc_msgSend_objectForKeyedSubscript_(v55, v57, @"fromID", v58);
                  if ((objc_msgSend_isEqual_(v56, v60, @"IDSGFTMetricsWildcard", v61) & 1) != 0
                    || objc_msgSend_isEqual_(v59, v62, @"IDSGFTMetricsWildcard", v63))
                  {
                    v65 = objc_msgSend_objectForKeyedSubscript_(v55, v62, @"events", v63);
                    if (objc_msgSend_isEqual_(v56, v66, @"IDSGFTMetricsWildcard", v67)
                      && objc_msgSend_isEqual_(v59, v68, @"IDSGFTMetricsWildcard", v69))
                    {
                      v70 = v175;
                      id v175 = v65;
                    }
                    else if (objc_msgSend_isEqual_(v59, v68, @"IDSGFTMetricsWildcard", v69))
                    {
                      v73 = objc_msgSend_objectForKeyedSubscript_(v174, v71, (uint64_t)v56, v72);

                      if (!v73)
                      {
                        v77 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v74, v75, v76);
                        objc_msgSend_setObject_forKeyedSubscript_(v174, v78, (uint64_t)v77, v79, v56);
                      }
                      v70 = objc_msgSend_objectForKeyedSubscript_(v174, v74, (uint64_t)v56, v76);
                      objc_msgSend_addObjectsFromArray_(v70, v80, (uint64_t)v65, v81);
                      v25 = v173;
                    }
                    else
                    {
                      if (!objc_msgSend_isEqual_(v56, v71, @"IDSGFTMetricsWildcard", v72)) {
                        goto LABEL_42;
                      }
                      v84 = objc_msgSend_objectForKeyedSubscript_(v25, v82, (uint64_t)v59, v83);

                      if (!v84)
                      {
                        v88 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v85, v86, v87);
                        objc_msgSend_setObject_forKeyedSubscript_(v25, v89, (uint64_t)v88, v90, v59);
                      }
                      v70 = objc_msgSend_objectForKeyedSubscript_(v25, v85, (uint64_t)v59, v87);
                      objc_msgSend_addObjectsFromArray_(v70, v91, (uint64_t)v65, v92);
                    }
                  }
                  else
                  {
                    v65 = objc_msgSend_mutableCopy(v55, v62, v64, v63);
                    v95 = objc_msgSend_numberWithBool_(NSNumber, v93, v172->_isInitiator, v94);
                    objc_msgSend_setObject_forKeyedSubscript_(v65, v96, (uint64_t)v95, v97, @"i");

                    objc_msgSend_addObject_(v171, v98, (uint64_t)v65, v99);
                  }
LABEL_42:
                }
                uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v184, v51, v202, 16);
              }
              while (v52);
            }

            uint64_t v31 = v169 + 1;
          }
          while (v169 + 1 != v164);
          uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v29, (uint64_t)&v192, v30, v204, 16);
        }
        while (v164);
LABEL_48:

        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v163 = v171;
        v102 = v174;
        v103 = v175;
        uint64_t v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v100, (uint64_t)&v180, v101, v201, 16);
        if (v168)
        {
          uint64_t v165 = *(void *)v181;
          do
          {
            uint64_t v106 = 0;
            do
            {
              if (*(void *)v181 != v165) {
                objc_enumerationMutation(v163);
              }
              v107 = *(void **)(*((void *)&v180 + 1) + 8 * v106);
              uint64_t v108 = objc_msgSend_objectForKeyedSubscript_(v107, v104, @"toID", v105);
              v112 = objc_msgSend_objectForKeyedSubscript_(v107, v109, @"fromID", v110);
              if (v103)
              {
                v114 = objc_msgSend_objectForKeyedSubscript_(v107, v111, @"events", v113);
                objc_msgSend_addObjectsFromArray_(v114, v115, (uint64_t)v103, v116);
              }
              v117 = objc_msgSend_objectForKeyedSubscript_(v25, v111, (uint64_t)v112, v113);

              if (v117)
              {
                v120 = objc_msgSend_objectForKeyedSubscript_(v107, v118, @"events", v119);
                v123 = objc_msgSend_objectForKeyedSubscript_(v25, v121, (uint64_t)v112, v122);
                objc_msgSend_addObjectsFromArray_(v120, v124, (uint64_t)v123, v125);
              }
              v126 = objc_msgSend_objectForKeyedSubscript_(v102, v118, v108, v119);

              if (v126)
              {
                v129 = objc_msgSend_objectForKeyedSubscript_(v107, v127, @"events", v128);
                v132 = objc_msgSend_objectForKeyedSubscript_(v102, v130, v108, v131);
                objc_msgSend_addObjectsFromArray_(v129, v133, (uint64_t)v132, v134);
              }
              v170 = (void *)v108;
              long long v178 = 0u;
              long long v179 = 0u;
              long long v176 = 0u;
              long long v177 = 0u;
              v135 = objc_msgSend_objectForKeyedSubscript_(v107, v127, @"events", 0.0);
              uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v136, (uint64_t)&v176, v137, v200, 16);
              if (v138)
              {
                uint64_t v141 = v138;
                uint64_t v142 = *(void *)v177;
                do
                {
                  for (uint64_t k = 0; k != v141; ++k)
                  {
                    if (*(void *)v177 != v142) {
                      objc_enumerationMutation(v135);
                    }
                    v144 = *(void **)(*((void *)&v176 + 1) + 8 * k);
                    v145 = objc_msgSend_objectForKeyedSubscript_(v144, v139, @"interval", v140);
                    v148 = objc_msgSend_objectForKeyedSubscript_(v144, v146, @"name", v147);
                    objc_msgSend_setObject_forKeyedSubscript_(v107, v149, (uint64_t)v145, v150, v148);
                  }
                  uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v139, (uint64_t)&v176, v140, v200, 16);
                }
                while (v141);
              }

              objc_msgSend_removeObjectForKey_(v107, v151, @"events", v152);
              ++v106;
              v25 = v173;
              v102 = v174;
              v103 = v175;
            }
            while (v106 != v168);
            uint64_t v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v104, (uint64_t)&v180, v105, v201, 16);
          }
          while (v168);
        }

        uint64_t v17 = v158 + 1;
      }
      while (v158 + 1 != v157);
      uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v196, v16, v205, 16);
    }
    while (v157);
  }

  os_unfair_lock_unlock(lock);
  return v171;
}

- (void)flushPendingNowKnownMKMs
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  locuint64_t k = &self->_unknownMKMFlushLock;
  os_unfair_lock_lock(&self->_unknownMKMFlushLock);
  id v6 = objc_msgSend_copy(self->_unknownMKMReceiptTimes, v3, v4, v5);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v43, v9, v51, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v44;
    uint64_t v14 = 138412546;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(self->_pushTokensByMKIs, v11, v16, *(double *)&v14);
        double v21 = objc_msgSend_Metrics(IDSFoundationLog, v18, v19, v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v48 = v16;
          __int16 v49 = 2112;
          v50 = v17;
          _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "GFTMetrics: mkm %@ -> token %@", buf, 0x16u);
        }

        if (v17)
        {
          if ((objc_msgSend_isNull(v17, v22, v23, v24) & 1) == 0)
          {
            objc_msgSend_removeObjectForKey_(self->_unknownMKMReceiptTimes, v25, v16, v26);
            double v29 = objc_msgSend_objectForKeyedSubscript_(v7, v27, v16, v28);
            objc_msgSend_doubleValue(v29, v30, v31, v32);
            double v34 = v33;

            double v37 = objc_msgSend_joinCycleForToken_(self, v35, (uint64_t)v17, v36);
            objc_msgSend_receivedKMOverPushViaCacheAtTime_(v37, v38, v39, v34);

            lastMembershipChange = self->_lastMembershipChange;
            if (lastMembershipChange) {
              objc_msgSend_receivedKMOverPushViaCacheForToken_atTime_(lastMembershipChange, v40, (uint64_t)v17, v34);
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v43, *(double *)&v14, v51, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(lock);
}

- (id)joinCycleForToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_begin_uniqueID_withClass_(self, v6, @"ra", v7, v4, v5);

  return v8;
}

- (id)error:(id)a3
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"err.%@", v3, a3);
  double v8 = objc_msgSend_begin_uniqueID_(self, v6, (uint64_t)v5, v7, &stru_1EEFDAD58);

  return v8;
}

- (id)uniqueError:(id)a3
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"err.%@", v3, a3);
  id v6 = NSNumber;
  uint64_t v7 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v7;
  uint64_t v10 = objc_msgSend_numberWithInt_(v6, v8, v7, v9);
  uint64_t v13 = objc_msgSend_begin_uniqueID_(self, v11, (uint64_t)v5, v12, v10);

  return v13;
}

- (id)localDidJoin
{
  objc_msgSend_annotate_withEvent_(self, a2, @"ra", v2, @"lj");
  objc_msgSend_annotate_withEvent_(self, v4, @"kvd", v5, @"lj");
  double v9 = objc_msgSend_localJoin(self, v6, v7, v8);
  objc_msgSend_join(v9, v10, v11, v12);
  return v9;
}

- (id)keyValueDelivery
{
  return (id)objc_msgSend_begin_uniqueID_(self, a2, @"kvd", v2, &unk_1EF028CC0);
}

- (void)remoteDidJoin:(id)a3
{
  double v5 = objc_msgSend_joinCycleForToken_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_remoteDidJoin(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, @"kvd", v10, @"rj");
  objc_msgSend_annotate_withEvent_(self, v11, @"lj", v12, @"rj");
}

- (void)remoteDidBecomeActive:(id)a3
{
  objc_msgSend_joinCycleForToken_(self, a2, (uint64_t)a3, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteDidBecomeActive(v12, v5, v6, v7);
  objc_msgSend_annotate_withEvent_(self, v8, @"kvd", v9, @"ra");
  objc_msgSend_annotate_withEvent_(self, v10, @"lj", v11, @"ra");
}

- (IDSGFTMetricsLocalJoin)localJoin
{
  uint64_t v4 = objc_opt_class();
  return (IDSGFTMetricsLocalJoin *)objc_msgSend_begin_uniqueID_withClass_(self, v3, @"lj", v5, &unk_1EF028CC0, v4);
}

- (void)willSendJoin
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willSendJoin(v7, v4, v5, v6);
}

- (void)didSendJoin
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didSendJoin(v7, v4, v5, v6);
}

- (void)connectQRServer
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectQRServer(v7, v4, v5, v6);
}

- (void)participantIdChanged
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantIdChanged(v7, v4, v5, v6);
}

- (void)participantIdUnknown
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantIdUnknown(v7, v4, v5, v6);
}

- (void)serverShortMKICacheMiss
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverShortMKICacheMiss(v7, v4, v5, v6);
}

- (void)selectedLocalInterface:(id)a3
{
  id v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedLocalInterface_(v10, v8, (uint64_t)v4, v9);
}

- (void)sendAllocationRequest
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendAllocationRequest(v7, v4, v5, v6);
}

- (void)useGecko
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_useGecko(v7, v4, v5, v6);
}

- (void)globalLinkStart
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_globalLinkStart(v7, v4, v5, v6);
}

- (void)willSendAllocbindRequestThroughInterface:(id)a3
{
  id v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willSendAllocbindRequestThroughInterface_(v10, v8, (uint64_t)v4, v9);
}

- (void)stunAllocbindRequest
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stunAllocbindRequest(v7, v4, v5, v6);
}

- (void)stunAllocbindResponse
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stunAllocbindResponse(v7, v4, v5, v6);
}

- (void)tcpAllocbindRequest
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tcpAllocbindRequest(v7, v4, v5, v6);
}

- (void)tcpAllocbindResponse
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tcpAllocbindResponse(v7, v4, v5, v6);
}

- (void)quicAllocbindRequest
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quicAllocbindRequest(v7, v4, v5, v6);
}

- (void)quicAllocbindResponse
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quicAllocbindResponse(v7, v4, v5, v6);
}

- (void)allocbindResponseFromInterface:(id)a3
{
  id v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allocbindResponseFromInterface_(v10, v8, (uint64_t)v4, v9);
}

- (void)allocbindResponseForProtocolStack:(id)a3
{
  id v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allocbindResponseForProtocolStack_(v10, v8, (uint64_t)v4, v9);
}

- (void)clientChannelConnected
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientChannelConnected(v7, v4, v5, v6);
}

- (void)didConnectUnderlyingRelayLink
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didConnectUnderlyingRelayLink(v7, v4, v5, v6);
}

- (void)didConnectUnderlyingE2ELink
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didConnectUnderlyingE2ELink(v7, v4, v5, v6);
}

- (void)linkConnectedUsingQUIC
{
  uint64_t v5 = objc_msgSend_localJoin(self, a2, v2, v3);
  objc_msgSend_linkConnectedUsingQUIC(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, @"ra", v10, @"cl-quic");
}

- (void)linkConnectedUsingHTTP2
{
  uint64_t v5 = objc_msgSend_localJoin(self, a2, v2, v3);
  objc_msgSend_linkConnectedUsingHTTP2(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, @"ra", v10, @"cl-h2");
}

- (void)linkConnectedUsingTCPSTUN
{
  uint64_t v5 = objc_msgSend_localJoin(self, a2, v2, v3);
  objc_msgSend_linkConnectedUsingTCPSTUN(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, @"ra", v10, @"cl-tcp");
}

- (void)linkConnectedUsingFakeTLS
{
  uint64_t v5 = objc_msgSend_localJoin(self, a2, v2, v3);
  objc_msgSend_linkConnectedUsingFakeTLS(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, @"ra", v10, @"cl-tls");
}

- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_localJoin(self, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedWithH2FallbackEnabled_(v7, v5, v4, v6);
}

- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4
{
  id v6 = a4;
  double v10 = objc_msgSend_localJoin(self, v7, v8, v9);
  objc_msgSend_firstIncomingPacketTime_forMKI_(v10, v11, (uint64_t)v6, a3);

  uint64_t v14 = IDSGetUUIDDataFromNSUUID(v6, v12, v13);

  objc_msgSend_getOrCreateMKICycleFor_(self, v15, (uint64_t)v14, v16);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_receivedFirstPacketTime_(v19, v17, v18, a3);
}

- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4
{
  id v6 = a4;
  objc_msgSend_localJoin(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstOutgoingPacketTime_forMKI_(v11, v10, (uint64_t)v6, a3);
}

- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  objc_msgSend_localJoin(self, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avcReceiveMKMTime_forMKI_isGeneratedLocally_(v13, v12, (uint64_t)v8, a3, v5);
}

- (void)hasSentCompoundPacket
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasSentCompoundPacket(v7, v4, v5, v6);
}

- (void)hasConvergence
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasConvergence(v7, v4, v5, v6);
}

- (void)hasRealloc
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasRealloc(v7, v4, v5, v6);
}

- (void)hasGoaway
{
  objc_msgSend_localJoin(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasGoaway(v7, v4, v5, v6);
}

- (void)didCreateMKM:(id)a3
{
  id v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didCreateMKM_(v10, v8, (uint64_t)v4, v9);
}

- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_msgSend_localJoin(self, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMKMToAVC_isGeneratedLocally_(v12, v10, (uint64_t)v6, v11, v4);
}

- (void)receivedKMOverPushFromToken:(id)a3
{
  id v14 = a3;
  id v6 = objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  objc_msgSend_receivedKMOverPush(v6, v7, v8, v9);

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    objc_msgSend_receivedKMOverPushFromToken_(v11, v12, (uint64_t)v14, v13);
  }
}

- (void)receivedKMOverPushViaCacheForToken:(id)a3
{
  id v14 = a3;
  id v6 = objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  objc_msgSend_receivedKMOverPushViaCache(v6, v7, v8, v9);

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    objc_msgSend_receivedKMOverPushViaCacheForToken_(v11, v12, (uint64_t)v14, v13);
  }
}

- (void)receivedUnknownKMOverPushViaCache:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (!self->_unknownMKMReceiptTimes)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    unknownMKMReceiptTimes = self->_unknownMKMReceiptTimes;
    self->_unknownMKMReceiptTimes = Mutable;
  }
  uint64_t v8 = NSNumber;
  double v9 = ids_monotonic_time();
  id v12 = objc_msgSend_numberWithDouble_(v8, v10, v11, v9);
  objc_msgSend_setObject_forKeyedSubscript_(self->_unknownMKMReceiptTimes, v13, (uint64_t)v12, v14, v5);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend_flushPendingNowKnownMKMs(self, v15, v16, v17);
}

- (void)mapMKI:(id)a3 toPushToken:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  pushTokensByMKIs = self->_pushTokensByMKIs;
  if (!pushTokensByMKIs)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v11 = self->_pushTokensByMKIs;
    self->_pushTokensByMKIs = Mutable;

    pushTokensByMKIs = self->_pushTokensByMKIs;
  }
  objc_msgSend_setObject_forKeyedSubscript_(pushTokensByMKIs, v7, (uint64_t)v6, v8, v15);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_flushPendingNowKnownMKMs(self, v12, v13, v14);
}

- (void)receivedKMOverQRFromToken:(id)a3
{
  id v14 = a3;
  id v6 = objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  objc_msgSend_receivedKMOverQR(v6, v7, v8, v9);

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    objc_msgSend_receivedKMOverQRFromToken_(v11, v12, (uint64_t)v14, v13);
  }
}

- (void)receivedKMOverQUICFromToken:(id)a3
{
  id v14 = a3;
  id v6 = objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  objc_msgSend_receivedKMOverQUIC(v6, v7, v8, v9);

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    objc_msgSend_receivedKMOverQUICFromToken_(v11, v12, (uint64_t)v14, v13);
  }
}

- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3
{
  id v14 = a3;
  id v6 = objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  objc_msgSend_receivedUnverifiedKMOverQUIC(v6, v7, v8, v9);

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    objc_msgSend_receivedUnverifiedKMOverQUICFromToken_(v11, v12, (uint64_t)v14, v13);
  }
}

- (void)sendRatchetedKMtoAVCForToken:(id)a3
{
  id v8 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v5 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    objc_msgSend_sendRatchetedKMtoAVCForToken_(v5, v6, (uint64_t)v8, v7);
  }
}

- (void)membershipChange
{
  BOOL v4 = NSNumber;
  uint64_t v5 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v5;
  id v6 = objc_msgSend_numberWithInt_(v4, a2, v5, v2);
  uint64_t v7 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v8, @"mc", v9, v6, v7);
  id v10 = (IDSGFTMetricsMembershipChange *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  lastMembershipChange = self->_lastMembershipChange;
  self->_lastMembershipChange = v10;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)request:(id)a3
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"req-%@", v3, a3);
  id v6 = NSNumber;
  uint64_t v7 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v7;
  id v10 = objc_msgSend_numberWithInt_(v6, v8, v7, v9);
  uint64_t v11 = objc_opt_class();
  id v14 = objc_msgSend_begin_uniqueID_withClass_(self, v12, (uint64_t)v5, v13, v10, v11);

  return v14;
}

- (id)createLinkCycle
{
  BOOL v4 = NSNumber;
  uint64_t v5 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v5;
  id v6 = objc_msgSend_numberWithInt_(v4, a2, v5, v2);
  uint64_t v7 = objc_opt_class();
  id v10 = objc_msgSend_begin_uniqueID_withClass_(self, v8, @"l", v9, v6, v7);

  return v10;
}

- (id)getOrCreateMKICycleFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend_begin_uniqueID_withClass_(self, v6, @"mki", v7, v4, v5);

  return v8;
}

- (void)didMitigateCollision:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_error_(self, a2, @"nwLink", v3);
  id v8 = v5;
  if (v4) {
    objc_msgSend_event_(v5, v6, @"collisionMitigationSucceeded", v7);
  }
  else {
    objc_msgSend_event_(v5, v6, @"collisionMitigationFailed", v7);
  }
}

- (void)didFailConnectionOfType:(id)a3
{
  id v4 = a3;
  objc_msgSend_uniqueError_(self, v5, @"nwLinkConnectionFailure", v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(v9, v7, (uint64_t)v4, v8);
}

- (void)transactionIDMismatchDetected
{
  objc_msgSend_error_(self, a2, @"nwLink", v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(v5, v3, @"transactionIDMismatch", v4);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  self->_conversationID = (NSString *)a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (NSSet)activeParticipantURIs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setActiveParticipantURIs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeParticipantURIs, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
  objc_storeStrong((id *)&self->_annotatorsByEventType, 0);
  objc_storeStrong((id *)&self->_lastMembershipChange, 0);
  objc_storeStrong((id *)&self->_unknownMKMReceiptTimes, 0);
  objc_storeStrong((id *)&self->_pushTokensByMKIs, 0);
  objc_storeStrong((id *)&self->_referencePointsByType, 0);
}

@end