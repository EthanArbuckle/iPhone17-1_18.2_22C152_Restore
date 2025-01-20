@interface BWGraph
+ (void)initialize;
- (BOOL)_prepareNodesWithConfigurationChanges:(uint64_t)a1;
- (BOOL)_resolveFormats:(id *)a3;
- (BOOL)_resolveRetainedBufferCounts:(uint64_t)a1;
- (BOOL)addNode:(id)a3 error:(id *)a4;
- (BOOL)clientExpectsCameraMountedInLandscapeOrientation;
- (BOOL)commitConfigurationWithID:(int64_t)a3 error:(id *)a4;
- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5;
- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6;
- (BOOL)deferredNodePrepareEnabled;
- (BOOL)isRunningForContinuityCapture;
- (BOOL)memoryAnalyticsReportingEnabled;
- (BOOL)removeNode:(id)a3;
- (BOOL)resumesConnectionsAsNodesArePrepared;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BOOL)stopSources:(id *)a3;
- (BOOL)supportsLiveReconfiguration;
- (BWGraph)init;
- (BWGraph)initWithConfigurationQueuePriority:(unsigned int)a3;
- (BWGraphStatusDelegate)statusDelegate;
- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload;
- (BWMemoryPool)memoryPool;
- (NSObject)_newDispatchGroupForSinksToBecomeLiveWithConfigurationID:(uint64_t)a1;
- (NSObject)_newDispatchGroupForSinksToTransitionToState:(uint64_t)a1;
- _logActiveNodesAfterGraphStopTimeout;
- (dispatch_time_t)_graphStateTransitionTimeout;
- (id)_breadthFirstEnumerator;
- (id)_depthFirstEnumeratorWithVertexOrdering:(int)a3;
- (id)_reverseBreadthFirstEnumerator;
- (id)_reverseDepthFirstEnumeratorWithVertexOrdering:(int)a3;
- (id)_sinkNodes;
- (id)_sourceNodes;
- (id)clientApplicationID;
- (id)dotString;
- (id)modeDescription;
- (id)osStatePropertyList;
- (id)sourceDescription;
- (int)clientPID;
- (int)errorStatus;
- (int)graphStateTransitionTimeoutSeconds;
- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5;
- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6;
- (uint64_t)_bypassInputConnectionsForNodes:(uint64_t)result;
- (uint64_t)_getNodesToPrepareSeriallyBeforeGraphStart:(uint64_t *)a3 concurrentlyBeforeGraphStart:(uint64_t *)a4 duringGraphStart:(void *)a5 afterGraphStart:;
- (uint64_t)_logActiveSinkNodesAfterGraphStopTimeout;
- (uint64_t)_makeParentConfigurationChangesLive;
- (uint64_t)_resolveVideoRetainedBufferCountsForOutput:(uint64_t)a3 forAttachedMediaKey:(void *)a4 outputsWithSharedPools:;
- (uint64_t)_resumeInputConnectionsForNodes:(uint64_t)a3 eventsOnly:;
- (uint64_t)_setMemoryPoolFlushAssertion;
- (uint64_t)_suspendInputConnectionsForNodes:(uint64_t)a3 messageCachingAllowed:(void *)a4 bypassedNodes:;
- (uint64_t)_timedOutWaitingForOperationToCompleteWithDescription:(uint64_t)result;
- (void)_nodesInSubgraphOfSinkNode:(void *)a1;
- (void)_stopSourcesUsingDispatchGroup:(uint64_t)a1;
- (void)_waitForSourceNodesToStart;
- (void)_waitForStartOrCommitToComplete;
- (void)beginConfiguration;
- (void)cancelDeferredNodePrepare;
- (void)cancelDeferredSourceNodeStart;
- (void)dealloc;
- (void)enableBypassUntilPreparedForNode:(id)a3 deferredPreparePriority:(int)a4;
- (void)enableConcurrentPrepareForNode:(id)a3;
- (void)enableDeferredPrepareForNodesNotInPathOfSinkNode:(id)a3;
- (void)enableDeferredStartForSourceNode:(id)a3 mustStartAfterNonDeferred:(BOOL)a4;
- (void)notifyWhenNonDeferredSourceNodesHaveStarted:(id)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3;
- (void)setClientPID:(int)a3;
- (void)setErrorStatus:(int)a3;
- (void)setGraphStateTransitionTimeoutSeconds:(int)a3;
- (void)setMemoryAnalyticsReportingEnabled:(BOOL)a3;
- (void)setMemoryPool:(id)a3;
- (void)setModeDescription:(id)a3;
- (void)setResumesConnectionsAsNodesArePrepared:(BOOL)a3;
- (void)setSourceDescription:(id)a3;
- (void)setStatusDelegate:(id)a3;
- (void)startDeferredNodePrepareIfNeededWithCompletionHandler:(id)a3;
- (void)startDeferredSourceNodesIfNeeded;
- (void)statePropertyListForNodes:(uint64_t)a3 verbose:;
- (void)waitForNonDeferredSourceNodesToStart;
- (void)waitForStartOrCommitToComplete;
@end

@implementation BWGraph

uint64_t __116__BWGraph__getNodesToPrepareSeriallyBeforeGraphStart_concurrentlyBeforeGraphStart_duringGraphStart_afterGraphStart___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = [a2 deferredPreparePriority];
  if (v5 > (int)[a3 deferredPreparePriority]) {
    return -1;
  }
  int v7 = [a2 deferredPreparePriority];
  return v7 < (int)[a3 deferredPreparePriority];
}

- (BOOL)_resolveFormats:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  BOOL v4 = 1;
  id v5 = [(BWGraph *)self _reverseDepthFirstEnumeratorWithVertexOrdering:1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    v9 = @"Sink";
    v38 = a3;
    uint64_t v34 = *(void *)v48;
    id v35 = v5;
    v33 = @"Sink";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        v39 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ((__CFString *)objc_msgSend(v39, "nodeType", v33, v34, v35) != v9)
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          obuint64_t j = (id)[v39 outputs];
          uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
          if (v42)
          {
            uint64_t v41 = *(void *)v44;
            uint64_t v36 = i;
            uint64_t v37 = v7;
            while (2)
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v44 != v41) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "connection"), "input");
                if (v13)
                {
                  v14 = (void *)v13;
                  v15 = (void *)[v12 specifiedAttachedMediaKeys];
                  v16 = (void *)[v14 specifiedAttachedMediaKeys];
                  if ([v15 count] || objc_msgSend(v16, "count"))
                  {
                    int v17 = [v12 _passthroughModeForUnspecifiedAttachedMedia];
                    int v18 = [v14 _passthroughModeForUnspecifiedAttachedMedia];
                    long long v55 = 0u;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v58 = 0u;
                    uint64_t v19 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
                    if (v19)
                    {
                      uint64_t v20 = v19;
                      uint64_t v21 = *(void *)v56;
                      char v22 = 1;
                      do
                      {
                        for (uint64_t k = 0; k != v20; ++k)
                        {
                          if (*(void *)v56 != v21) {
                            objc_enumerationMutation(v15);
                          }
                          int v24 = [v16 containsObject:*(void *)(*((void *)&v55 + 1) + 8 * k)];
                          if (v18) {
                            int v25 = 1;
                          }
                          else {
                            int v25 = v24;
                          }
                          if (!v25) {
                            char v22 = 0;
                          }
                        }
                        uint64_t v20 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
                      }
                      while (v20);
                    }
                    else
                    {
                      char v22 = 1;
                    }
                    long long v53 = 0u;
                    long long v54 = 0u;
                    long long v51 = 0u;
                    long long v52 = 0u;
                    uint64_t v26 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
                    if (v26)
                    {
                      uint64_t v27 = v26;
                      uint64_t v28 = *(void *)v52;
                      do
                      {
                        for (uint64_t m = 0; m != v27; ++m)
                        {
                          if (*(void *)v52 != v28) {
                            objc_enumerationMutation(v16);
                          }
                          int v30 = [v15 containsObject:*(void *)(*((void *)&v51 + 1) + 8 * m)];
                          if (v17) {
                            int v31 = 1;
                          }
                          else {
                            int v31 = v30;
                          }
                          if (!v31) {
                            char v22 = 0;
                          }
                        }
                        uint64_t v27 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
                      }
                      while (v27);
                    }
                    if ((v22 & 1) == 0) {
                      goto LABEL_49;
                    }
                  }
                  if (!objc_msgSend((id)objc_msgSend(v12, "connection"), "resolveCommonBufferFormat"))
                  {
LABEL_49:
                    BOOL v4 = 0;
                    if (v38) {
                      id *v38 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-666 userInfo:0];
                    }
                    return v4;
                  }
                }
                else
                {
                  [v39 nodeType];
                }
              }
              uint64_t v8 = v34;
              id v5 = v35;
              v9 = v33;
              uint64_t i = v36;
              uint64_t v7 = v37;
              uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v59 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
      BOOL v4 = 1;
    }
    while (v7);
  }
  return v4;
}

- (id)_sinkNodes
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_sinkNodes];
}

- (void)enableDeferredStartForSourceNode:(id)a3 mustStartAfterNonDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5470)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't enable deferred start while running" userInfo:0]);
  }
  if (v4)
  {
    deferredStartSourceNodesThatMustStartAfterNonDeferred = self->_deferredStartSourceNodesThatMustStartAfterNonDeferred;
    if (!deferredStartSourceNodesThatMustStartAfterNonDeferred)
    {
      deferredStartSourceNodesThatMustStartAfterNonDeferred = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_deferredStartSourceNodesThatMustStartAfterNonDeferred = deferredStartSourceNodesThatMustStartAfterNonDeferred;
    }
    if ((-[NSMutableArray containsObject:](deferredStartSourceNodesThatMustStartAfterNonDeferred, "containsObject:", a3, v11, v12) & 1) == 0)[(NSMutableArray *)self->_deferredStartSourceNodesThatMustStartAfterNonDeferred addObject:a3]; {
  }
    }
  deferredStartSourceNodes = self->_deferredStartSourceNodes;
  if (!deferredStartSourceNodes)
  {
    deferredStartSourceNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_deferredStartSourceNodes = deferredStartSourceNodes;
  }
  if ((-[NSMutableArray containsObject:](deferredStartSourceNodes, "containsObject:", a3, v11, v12) & 1) == 0)
  {
    v10 = self->_deferredStartSourceNodes;
    if (v4) {
      [(NSMutableArray *)v10 addObject:a3];
    }
    else {
      [(NSMutableArray *)v10 insertObject:a3 atIndex:0];
    }
  }
}

- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5
{
  return [(BWGraph *)self connectOutput:a3 toInput:a4 pipelineStage:a5 deferredAttach:0];
}

- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6
{
  if (a3 && a4)
  {
    if (!self->_running
      && self->_beingConfigured
      && -[BWGraph connectOutput:toInput:pipelineStage:deferredAttach:](self, "connectOutput:toInput:pipelineStage:deferredAttach:"))
    {
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return -12782;
    }
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
}

- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6
{
  if (self->_running)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    uint64_t v12 = @"Can't currently add connections while running";
    goto LABEL_16;
  }
  if (!self->_beingConfigured)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    uint64_t v12 = @"Can't connect nodes outside of a begin/commit block";
    goto LABEL_16;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = @"Output can't be nil";
    goto LABEL_16;
  }
  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = @"Input can't be nil";
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0, a6));
  }
  BOOL v7 = a6;
  uint64_t v8 = [[BWNodeConnection alloc] initWithOutput:a3 input:a4 pipelineStage:a5];
  [(NSMutableArray *)self->_connections addObject:v8];

  if (v7)
  {
    return [(BWNodeConnection *)v8 deferredAttach];
  }
  else
  {
    return [(BWNodeConnection *)v8 attach];
  }
}

- (BOOL)addNode:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3A8];
    char v22 = @"Can't add a nil node";
    goto LABEL_32;
  }
  if (self->_running)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3A8];
    char v22 = @"Can't currently add nodes while running";
    goto LABEL_32;
  }
  if (!self->_beingConfigured)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3A8];
    char v22 = @"Can't add nodes outside of a begin/commit block";
LABEL_32:
    objc_exception_throw((id)[v20 exceptionWithName:v21 reason:v22 userInfo:0]);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = (void *)[a3 outputs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v27 + 1) + 8 * i) consumer])
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        char v22 = @"Can't add a node with outputs which already have consumers";
        goto LABEL_32;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  }
  while (v8);
LABEL_12:
  [a3 setGraph:self];
  [(NSMutableArray *)self->_nodes addObject:a3];
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", @"Source"))
  {
    uint64_t v11 = 16;
    goto LABEL_16;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", @"Sink"))
  {
    uint64_t v11 = 24;
LABEL_16:
    [*(id *)((char *)&self->super.isa + v11) addObject:a3];
  }
  if (self->_supportsLiveReconfiguration)
  {
    char v12 = [a3 supportsLiveReconfiguration];
    if (self->_supportsLiveReconfiguration) {
      BOOL v13 = v12;
    }
    else {
      BOOL v13 = 0;
    }
    self->_supportsLiveReconfiguration = v13;
  }
  if (self->_memoryPool)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = objc_msgSend(a3, "outputs", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * j) setMemoryPool:self->_memoryPool];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
  }
  return 1;
}

- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5
{
  return [(BWGraph *)self safelyConnectOutput:a3 toInput:a4 pipelineStage:a5 deferredAttach:0];
}

- (void)setStatusDelegate:(id)a3
{
  self->_statusDelegate = (BWGraphStatusDelegate *)a3;
}

- (void)setMemoryPool:(id)a3
{
}

- (int)errorStatus
{
  return self->_errorStatus;
}

- (BOOL)commitConfigurationWithID:(int64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  if (!self->_beingConfigured)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3A8];
    uint64_t v16 = @"Graph is not being configured, no configuration to commit";
    goto LABEL_24;
  }
  if (self->_commitGroup)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    uint64_t v16 = @"Shouldn't have a commit group";
LABEL_24:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v16 userInfo:0]);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  nodes = self->_nodes;
  uint64_t v8 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(nodes);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setConfigurationID:a3];
      }
      uint64_t v9 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
  [(BWGraph *)self _resolveFormats:&v21];
  if (v21) {
    goto LABEL_21;
  }
  -[BWGraph _resolveRetainedBufferCounts:]((uint64_t)self);
  if (v21) {
    goto LABEL_21;
  }
  [(BWGraph *)self statusDelegate];
  if (objc_opt_respondsToSelector()) {
    [(BWGraphStatusDelegate *)[(BWGraph *)self statusDelegate] graphDidResolveRetainedBufferCounts:self];
  }
  self->_inflightConfigurationID = a3;
  if (self->_running)
  {
    -[BWGraph _prepareNodesWithConfigurationChanges:]((uint64_t)self);
    if (!v21)
    {
      -[BWGraph _makeParentConfigurationChangesLive]((uint64_t)self);
      self->_commitGroup = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToBecomeLiveWithConfigurationID:]((uint64_t)self, a3);
      goto LABEL_17;
    }
LABEL_21:
    FigDebugAssert3();
  }
LABEL_17:
  self->_beingConfigured = 0;
  char v12 = v21;
  if (a4 && v21) {
    *a4 = v21;
  }
  return v12 == 0;
}

- (BWGraphStatusDelegate)statusDelegate
{
  return self->_statusDelegate;
}

- (uint64_t)_getNodesToPrepareSeriallyBeforeGraphStart:(uint64_t *)a3 concurrentlyBeforeGraphStart:(uint64_t *)a4 duringGraphStart:(void *)a5 afterGraphStart:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  if ([*(id *)(result + 80) count])
  {
    long long v52 = a2;
    long long v53 = a5;
    long long v54 = a4;
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA80] set];
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] set];
    char v12 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:*(void *)(v9 + 16)];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    BOOL v13 = *(void **)(v9 + 80);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v77 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "unionSet:", -[BWGraph _nodesInSubgraphOfSinkNode:]((void *)v9, *(void **)(*((void *)&v76 + 1) + 8 * i)));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }
      while (v15);
    }
    long long v51 = a3;
    objc_msgSend(v12, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(v9 + 48)));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v18 = *(void **)(v9 + 32);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v83 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          if (![v23 pipelineStage]) {
            objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(v23, "input"), "node"));
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v83 count:16];
      }
      while (v20);
    }
    v59 = v12;
    long long v56 = v10;
    [v12 unionSet:v10];
    long long v24 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(v9 + 56)];
    uint64_t v50 = v9;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", (id)objc_msgSend(*(id *)(v9 + 40), "copy"), @"PrimaryFormat");
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v57 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v69 != v57) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v68 + 1) + 8 * k);
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v29 = (void *)[v24 objectForKeyedSubscript:v28];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v65;
            do
            {
              for (uint64_t m = 0; m != v31; ++m)
              {
                if (*(void *)v65 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void **)(*((void *)&v64 + 1) + 8 * m);
                objc_msgSend(v11, "addObject:", objc_msgSend(v34, "node"));
                objc_msgSend(v11, "addObject:", objc_msgSend(gr_findParentOutputOfOutputWithSharedPool(v34, v28, 0), "node"));
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v31);
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v82 count:16];
      }
      while (v26);
    }
    [v59 unionSet:v11];
    uint64_t v58 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v55 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v36 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (*(void *)(v50 + 64)) {
      uint64_t v37 = *(void *)(v50 + 64);
    }
    else {
      uint64_t v37 = MEMORY[0x1E4F1CBF0];
    }
    v38 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v37];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v39 = *(void **)(v50 + 8);
    result = [v39 countByEnumeratingWithState:&v60 objects:v80 count:16];
    if (result)
    {
      uint64_t v40 = result;
      uint64_t v41 = *(void *)v61;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v61 != v41) {
            objc_enumerationMutation(v39);
          }
          uint64_t v43 = *(void *)(*((void *)&v60 + 1) + 8 * v42);
          int v44 = [v59 containsObject:v43];
          long long v45 = v36;
          if (v44)
          {
            char v46 = [v38 containsObject:v43];
            long long v45 = (void *)v35;
            if ((v46 & 1) == 0)
            {
              if (([v56 containsObject:v43] & 1) != 0
                || (v47 = [v11 containsObject:v43], long long v45 = (void *)v55, v47))
              {
                long long v45 = (void *)v58;
              }
            }
          }
          [v45 addObject:v43];
          ++v42;
        }
        while (v40 != v42);
        result = [v39 countByEnumeratingWithState:&v60 objects:v80 count:16];
        uint64_t v40 = result;
      }
      while (result);
    }
    if (*(unsigned char *)(v50 + 89)) {
      result = [v36 sortUsingComparator:&__block_literal_global_102];
    }
    if (v52) {
      *long long v52 = v58;
    }
    if (v51) {
      *long long v51 = v35;
    }
    if (v53) {
      *long long v53 = v36;
    }
    a4 = v54;
    if (!v54) {
      return result;
    }
LABEL_70:
    *a4 = v55;
    return result;
  }
  long long v48 = *(void **)(v9 + 8);
  result = [*(id *)(v9 + 64) count];
  if (result)
  {
    long long v48 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(v9 + 8)];
    result = [v48 removeObjectsInArray:*(void *)(v9 + 64)];
    if (!a3) {
      goto LABEL_64;
    }
    uint64_t v49 = *(void *)(v9 + 64);
  }
  else
  {
    if (!a3) {
      goto LABEL_64;
    }
    uint64_t v49 = MEMORY[0x1E4F1CBF0];
  }
  *a3 = v49;
LABEL_64:
  if (a2) {
    *a2 = (uint64_t)v48;
  }
  if (a5) {
    *a5 = MEMORY[0x1E4F1CBF0];
  }
  if (a4)
  {
    uint64_t v55 = MEMORY[0x1E4F1CBF0];
    goto LABEL_70;
  }
  return result;
}

- (BOOL)_resolveRetainedBufferCounts:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 40) removeAllObjects];
    [*(id *)(a1 + 56) removeAllObjects];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(obj);
          }
          v3 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) output];
          if ([v3 mediaType] == 1986618469
            || [v3 mediaType] == 1885564004)
          {
            -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:](a1, v3, @"PrimaryFormat", *(void **)(a1 + 40));
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            BOOL v4 = (void *)[v3 specifiedAttachedMediaKeys];
            uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
            if (v5)
            {
              uint64_t v6 = v5;
              uint64_t v7 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v6; ++j)
                {
                  if (*(void *)v25 != v7) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                  uint64_t v10 = (void *)[*(id *)(a1 + 56) objectForKeyedSubscript:v9];
                  if (!v10)
                  {
                    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
                    [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v9];
                  }
                  -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:](a1, v3, v9, v10);
                }
                uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
              }
              while (v6);
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v19);
    }
    gr_addRetainCountsOfOutputsWithSharedPoolsForAttachedMediaToParentNodeOutputs(*(void **)(a1 + 40), @"PrimaryFormat");
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = *(void **)(a1 + 56);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v13; ++k)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          gr_addRetainCountsOfOutputsWithSharedPoolsForAttachedMediaToParentNodeOutputs((void *)[*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * k)], *(void *)(*((void *)&v20 + 1) + 8 * k));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v13);
    }
  }
  return a1 != 0;
}

- (uint64_t)_resolveVideoRetainedBufferCountsForOutput:(uint64_t)a3 forAttachedMediaKey:(void *)a4 outputsWithSharedPools:
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t v8 = objc_msgSend(a2, "mediaPropertiesForAttachedMediaKey:");
  if (!v8) {
    -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:]();
  }
  uint64_t v9 = (void *)v8;
  int v10 = [a2 _passthroughModeForAttachedMediaKey:a3];
  if (!v10) {
    goto LABEL_6;
  }
  if (v10 == 2)
  {
    [a4 addObject:a2];
LABEL_6:
    int v13 = 0;
    if (*(unsigned char *)(v7 + 192)) {
      int v11 = gr_countOfBuffersRetainedOutsideEmitCallbackOfOutput(a2, a3, 0);
    }
    else {
      int v11 = gr_countOfBuffersRetainedOutsideEmitCallbackOfOutputWithDelay(a2, a3, 0, 0, 0, &v13);
    }
    int v12 = v11;
    [v9 resolvedRetainedBufferCount];
    return [v9 setResolvedRetainedBufferCount:(v13 + v12)];
  }
  return [v9 setResolvedRetainedBufferCount:0];
}

- (void)setSourceDescription:(id)a3
{
  self->_sourceDescription = (NSString *)[a3 copy];
}

- (void)setModeDescription:(id)a3
{
  self->_modeDescription = (NSString *)[a3 copy];
}

- (void)enableBypassUntilPreparedForNode:(id)a3 deferredPreparePriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "inputs"), "count");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "outputs"), "count");
  if (v7 != 1 || v8 != 1)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ Bypass only works for single input with single output nodes.", a3];
    goto LABEL_13;
  }
  int v9 = objc_msgSend((id)objc_msgSend(a3, "input"), "passthroughMode");
  int v10 = objc_msgSend((id)objc_msgSend(a3, "output"), "passthroughMode");
  if (v9 != 1 || v10 != 1)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ Bypass only works for pass through nodes. ", a3];
LABEL_13:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  nodesToBypassUntilPrepared = self->_nodesToBypassUntilPrepared;
  if (!nodesToBypassUntilPrepared)
  {
    nodesToBypassUntilPrepared = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_nodesToBypassUntilPrepared = nodesToBypassUntilPrepared;
  }
  if (([(NSMutableArray *)nodesToBypassUntilPrepared containsObject:a3] & 1) == 0)
  {
    [(NSMutableArray *)self->_nodesToBypassUntilPrepared addObject:a3];
    [a3 setDeferredPreparePriority:v4];
  }
}

- (BWMemoryPool)memoryPool
{
  return self->_memoryPool;
}

- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload
{
  return self->_memoryAnalyticsPayload;
}

void __43__BWGraph_startDeferredSourceNodesIfNeeded__block_invoke(uint64_t a1)
{
  v11[27] = *(id *)MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1A6272C70]();
  v11[0] = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 104) containsObject:*(void *)(a1 + 40)])
  {
    if (dword_1EB4C5470)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 136), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (dword_1EB4C5470)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 40), "start:", v11, v6, v8);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 128));
  if (v11[0])
  {
    objc_msgSend(*(id *)(a1 + 32), "setErrorStatus:", objc_msgSend(v11[0], "code"));
    uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
LABEL_11:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_12;
  }
  if (dword_1EB4C5470)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "graph:didStartSourceNode:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(v11[0], "code", v7, v9));
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 152));
}

- (BOOL)start:(id *)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSMutableArray *)self->_sourceNodes count];
  if (!self->_running && v6)
  {
    if (self->_beingConfigured) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't start running while in the middle of a begin/commit block" userInfo:0]);
    }
    unint64_t v7 = v6;
    if (FigDebugIsInternalBuild())
    {
      if (dword_1EB4C5470) {
        goto LABEL_8;
      }
    }
    else if (dword_1EB4C5470)
    {
LABEL_8:
      unsigned int v86 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v83 = 0;
    id v84 = 0;
    v81 = 0;
    v82 = 0;
    -[BWGraph _getNodesToPrepareSeriallyBeforeGraphStart:concurrentlyBeforeGraphStart:duringGraphStart:afterGraphStart:]((uint64_t)self, (uint64_t *)&v84, (uint64_t *)&v83, (uint64_t *)&v82, &v81);

    self->_nodesToPrepareAfterGraphStart = (NSArray *)v81;
    -[BWGraph _suspendInputConnectionsForNodes:messageCachingAllowed:bypassedNodes:]((uint64_t)self, v81, self->_resumesConnectionsAsNodesArePrepared, self->_nodesToBypassUntilPrepared);
    -[BWGraph _suspendInputConnectionsForNodes:messageCachingAllowed:bypassedNodes:]((uint64_t)self, v82, 0, 0);
    -[BWGraph _bypassInputConnectionsForNodes:]((uint64_t)self, self->_nodesToBypassUntilPrepared);
    if ([v83 count])
    {
      uint64_t v9 = dispatch_group_create();
      int v10 = FigDispatchQueueCreateWithPriority();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __17__BWGraph_start___block_invoke;
      block[3] = &unk_1E5C24430;
      block[4] = v83;
      dispatch_group_async(v9, v10, block);
    }
    else
    {
      uint64_t v9 = 0;
    }
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v11 = v84;
    uint64_t v12 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v76, v92, 16, v54, v56);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v77 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * i) prepareForCurrentConfigurationToBecomeLive];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v76 objects:v92 count:16];
      }
      while (v13);
    }
    if (v9)
    {
      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
    outputsWithSharedPoolsForAttachedMedia = self->_outputsWithSharedPoolsForAttachedMedia;
    gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia(self->_outputsWithSharedPools, @"PrimaryFormat");
    *(_OWORD *)v90 = 0u;
    memset(v89, 0, sizeof(v89));
    uint64_t v17 = [(NSMutableDictionary *)outputsWithSharedPoolsForAttachedMedia countByEnumeratingWithState:v89 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v89[2];
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v89[2] != v19) {
            objc_enumerationMutation(outputsWithSharedPoolsForAttachedMedia);
          }
          gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia((void *)[(NSMutableDictionary *)outputsWithSharedPoolsForAttachedMedia objectForKeyedSubscript:*(void *)(v89[1] + 8 * j)], *(void *)(v89[1] + 8 * j));
        }
        uint64_t v18 = [(NSMutableDictionary *)outputsWithSharedPoolsForAttachedMedia countByEnumeratingWithState:v89 objects:v93 count:16];
      }
      while (v18);
    }
    uint64_t v59 = [v82 count];
    if (!v59) {
      [(BWGraphStatusDelegate *)[(BWGraph *)self statusDelegate] graphDidPrepareNodes:self];
    }
    self->_startGroup = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)self, 1);
    [(BWGraph *)self setErrorStatus:0];
    long long v21 = &unk_1EB4C5000;
    if ([v81 count]) {
      dispatch_group_enter((dispatch_group_t)self->_startGroup);
    }
    self->_sourceNodesStartGroup = (OS_dispatch_group *)dispatch_group_create();
    self->_nonDeferredSourceNodesStartGroup = (OS_dispatch_group *)dispatch_group_create();
    if ([(NSMutableArray *)self->_deferredStartSourceNodes count])
    {
      if (v7 <= [(NSMutableArray *)self->_deferredStartSourceNodes count])
      {
        uint64_t v57 = v3;
        LODWORD(v55) = 0;
        FigDebugAssert3();
      }
      unint64_t v58 = v7 - [(NSMutableArray *)self->_deferredStartSourceNodes count];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = self->_deferredStartSourceNodes;
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v72 objects:v91 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v73;
        uint64_t v60 = *(void *)v73;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v73 != v24) {
              objc_enumerationMutation(obj);
            }
            if (v21[284])
            {
              long long v26 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              unsigned int v86 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              long long v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v28 = v86;
              if (os_log_type_enabled(v27, type)) {
                unsigned int v29 = v28;
              }
              else {
                unsigned int v29 = v28 & 0xFFFFFFFE;
              }
              if (v29)
              {
                int clientPID = self->_clientPID;
                uint64_t v31 = v23;
                clientApplicationID = self->_clientApplicationID;
                uint64_t v33 = [v26 nodeSubType];
                uint64_t v34 = [v26 name];
                LODWORD(v89[0]) = 136316674;
                *(void *)((char *)v89 + 4) = "-[BWGraph start:]";
                WORD2(v89[1]) = 2048;
                *(void *)((char *)&v89[1] + 6) = self;
                HIWORD(v89[2]) = 1026;
                LODWORD(v89[3]) = clientPID;
                uint64_t v24 = v60;
                WORD2(v89[3]) = 2114;
                *(void *)((char *)&v89[3] + 6) = clientApplicationID;
                uint64_t v23 = v31;
                long long v21 = (_DWORD *)&unk_1EB4C5000;
                HIWORD(v89[4]) = 2048;
                v89[5] = v26;
                *(_WORD *)v90 = 2112;
                *(void *)&v90[2] = v33;
                *(_WORD *)&v90[10] = 2114;
                *(void *)&v90[12] = v34;
                LODWORD(v57) = 68;
                uint64_t v55 = v89;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            dispatch_group_enter((dispatch_group_t)self->_startGroup);
            dispatch_group_enter((dispatch_group_t)self->_sourceNodesStartGroup);
          }
          uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v72 objects:v91 count:16];
        }
        while (v23);
      }
      unint64_t v7 = v58;
    }
    for (; v7; --v7)
    {
      dispatch_group_enter((dispatch_group_t)self->_sourceNodesStartGroup);
      dispatch_group_enter((dispatch_group_t)self->_nonDeferredSourceNodesStartGroup);
    }
    if (!v59) {
      -[BWGraph _setMemoryPoolFlushAssertion]((uint64_t)self);
    }
    uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", self->_deferredStartSourceNodes, v55, v57);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    sourceNodes = self->_sourceNodes;
    uint64_t v37 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v68 objects:v88 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v69 != v39) {
            objc_enumerationMutation(sourceNodes);
          }
          uint64_t v41 = *(void *)(*((void *)&v68 + 1) + 8 * m);
          if (([v35 containsObject:v41] & 1) == 0)
          {
            sourceStartQueue = self->_sourceStartQueue;
            startGroup = self->_startGroup;
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __17__BWGraph_start___block_invoke_88;
            v67[3] = &unk_1E5C24458;
            v67[4] = self;
            v67[5] = v41;
            dispatch_group_async(startGroup, sourceStartQueue, v67);
          }
        }
        uint64_t v38 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v68 objects:v88 count:16];
      }
      while (v38);
    }
    if (v59)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      int v44 = v82;
      uint64_t v45 = [v82 countByEnumeratingWithState:&v63 objects:v87 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v64;
        do
        {
          for (uint64_t n = 0; n != v46; ++n)
          {
            if (*(void *)v64 != v47) {
              objc_enumerationMutation(v44);
            }
            if (self) {
              [*(id *)(*((void *)&v63 + 1) + 8 * n) prepareForCurrentConfigurationToBecomeLive];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v63 objects:v87 count:16];
        }
        while (v46);
      }
      [(BWGraphStatusDelegate *)[(BWGraph *)self statusDelegate] graphDidPrepareNodes:self];
      -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:]((uint64_t)self, (uint64_t)v82, 0);
      -[BWGraph _setMemoryPoolFlushAssertion]((uint64_t)self);
    }
    BOOL v49 = 1;
    self->_running = 1;
    long long v51 = self->_sourceStartQueue;
    uint64_t v50 = self->_startGroup;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __17__BWGraph_start___block_invoke_96;
    v62[3] = &unk_1E5C24430;
    v62[4] = self;
    dispatch_group_notify(v50, v51, v62);
    return v49;
  }
  FigDebugAssert3();
  long long v53 = (void *)BWSignalErrorAt();
  BOOL v49 = v53 == 0;
  if (a3 && v53)
  {
    BOOL v49 = 0;
    *a3 = v53;
  }
  return v49;
}

- (uint64_t)_suspendInputConnectionsForNodes:(uint64_t)a3 messageCachingAllowed:(void *)a4 bypassedNodes:
{
  obuint64_t j = a2;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    result = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v9 = objc_msgSend(v8, "inputs", obj);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v17;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v9);
                }
                objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "connection"), "suspendWithMessageCachingAllowed:bypassed:", a3, objc_msgSend(a4, "containsObject:", v8));
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v11);
          }
          ++v7;
        }
        while (v7 != v6);
        result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_bypassInputConnectionsForNodes:(uint64_t)result
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(a2);
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "input"), "connection"), "connectBypassInput");
        }
        while (v3 != v5);
        result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setErrorStatus:(int)a3
{
  self->_errorStatus = a3;
}

- (BOOL)isRunningForContinuityCapture
{
  return self->_runningForContinuityCapture;
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (void)setMemoryAnalyticsReportingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_memoryAnalyticsReportingEnabled != a3)
  {

    if (v3) {
      uint64_t v5 = objc_alloc_init(BWMemoryAnalyticsPayload);
    }
    else {
      uint64_t v5 = 0;
    }
    self->_memoryAnalyticsPayload = v5;
  }
  self->_memoryAnalyticsReportingEnabled = v3;
}

- (NSObject)_newDispatchGroupForSinksToTransitionToState:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = [*(id *)(a1 + 24) count];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      dispatch_group_enter(v4);
      --v6;
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v7 = *(void **)(a1 + 24);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        if (a2)
        {
          if (a2 == 1)
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke;
            v15[3] = &unk_1E5C24430;
            v15[4] = v4;
            [v12 notifyWhenActive:v15];
          }
        }
        else
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke_2;
          v14[3] = &unk_1E5C24430;
          v14[4] = v4;
          [v12 notifyWhenIdle:v14];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v4;
}

- (void)enableDeferredPrepareForNodesNotInPathOfSinkNode:(id)a3
{
  deferredPreparePrioritySinks = self->_deferredPreparePrioritySinks;
  if (!deferredPreparePrioritySinks)
  {
    deferredPreparePrioritySinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_deferredPreparePrioritySinks = deferredPreparePrioritySinks;
  }
  if (([(NSMutableArray *)deferredPreparePrioritySinks containsObject:a3] & 1) == 0)
  {
    uint64_t v6 = self->_deferredPreparePrioritySinks;
    [(NSMutableArray *)v6 addObject:a3];
  }
}

- (void)enableConcurrentPrepareForNode:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->_nodesToPrepareConcurrently, "containsObject:") & 1) == 0)
  {
    nodesToPrepareConcurrently = self->_nodesToPrepareConcurrently;
    if (!nodesToPrepareConcurrently)
    {
      nodesToPrepareConcurrently = (NSMutableArray *)objc_opt_new();
      self->_nodesToPrepareConcurrently = nodesToPrepareConcurrently;
    }
    [(NSMutableArray *)nodesToPrepareConcurrently addObject:a3];
  }
}

- (uint64_t)_setMemoryPoolFlushAssertion
{
  if (result)
  {
    v1 = (void *)result;
    *(void *)(result + 248) = [*(id *)(result + 200) newFlushAssertion:@"GraphStart"];
    result = [v1 deferredNodePrepareEnabled];
    if ((result & 1) == 0)
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __39__BWGraph__setMemoryPoolFlushAssertion__block_invoke;
      v2[3] = &unk_1E5C24430;
      v2[4] = v1;
      return [v1 notifyWhenNonDeferredSourceNodesHaveStarted:v2];
    }
  }
  return result;
}

- (BOOL)deferredNodePrepareEnabled
{
  return [(NSMutableArray *)self->_deferredPreparePrioritySinks count] != 0;
}

- (void)notifyWhenNonDeferredSourceNodesHaveStarted:(id)a3
{
  if (a3)
  {
    if (self->_nonDeferredSourceNodesStartGroup) {
      dispatch_group_notify((dispatch_group_t)self->_nonDeferredSourceNodesStartGroup, (dispatch_queue_t)self->_sourceStartQueue, a3);
    }
    else {
      (*((void (**)(id))a3 + 2))(a3);
    }
  }
}

- (void)beginConfiguration
{
  if (self->_beingConfigured)
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3A8];
    uint64_t v4 = @"Can't begin a new configuration when the existing configuration hasn't been committed";
    goto LABEL_10;
  }
  self->_beingConfigured = 1;
  if (!self->_running) {
    return;
  }
  if (!self->_supportsLiveReconfiguration)
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3A8];
    uint64_t v4 = @"Graph doesn't support live reconfiguration, but beginConfiguration was called while running";
LABEL_10:
    objc_exception_throw((id)[v2 exceptionWithName:v3 reason:v4 userInfo:0]);
  }
  -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);
}

void __65__BWGraph_startDeferredNodePrepareIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6272C70]();
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v29 = v2;
    uint64_t v6 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (*(unsigned char *)(*(void *)(a1 + 40) + 88))
        {
          int v15 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          long long v16 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v15, (int)(objc_msgSend(*(id *)(a1 + 32), "count") - v15));
          if (*(unsigned char *)(a1 + 56))
          {
            long long v17 = v16;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v49 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v39;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v39 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                  long long v34 = 0u;
                  long long v35 = 0u;
                  long long v36 = 0u;
                  long long v37 = 0u;
                  long long v23 = (void *)[v22 inputs];
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v48 count:16];
                  if (v24)
                  {
                    uint64_t v25 = v24;
                    uint64_t v26 = *(void *)v35;
                    do
                    {
                      for (uint64_t k = 0; k != v25; ++k)
                      {
                        if (*(void *)v35 != v26) {
                          objc_enumerationMutation(v23);
                        }
                        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "connection"), "resumeForEventsOnly:", 1);
                      }
                      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v48 count:16];
                    }
                    while (v25);
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v49 count:16];
              }
              while (v19);
            }
          }
          uint64_t v14 = 1;
          goto LABEL_41;
        }
        if (*MEMORY[0x1E4F1EB90] == 1)
        {
          gr_sprintNode((const char *)&v47, *(void **)(*((void *)&v42 + 1) + 8 * i));
          if (*MEMORY[0x1E4F1EBA8] == 1) {
            kdebug_trace();
          }
        }
        [v8 prepareForCurrentConfigurationToBecomeLive];
        if (*(unsigned char *)(a1 + 56))
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v9 = (void *)[v8 inputs];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v46 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v31;
            do
            {
              for (uint64_t m = 0; m != v11; ++m)
              {
                if (*(void *)v31 != v12) {
                  objc_enumerationMutation(v9);
                }
                objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * m), "connection"), "resumeForEventsOnly:", 0);
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v46 count:16];
            }
            while (v11);
          }
        }
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    uint64_t v14 = 0;
LABEL_41:
    v2 = v29;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!*(unsigned char *)(a1 + 56)) {
    -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:](*(void *)(a1 + 40), *(void *)(a1 + 32), v14);
  }

  *(void *)(*(void *)(a1 + 40) + 248) = 0;
  uint64_t v28 = *(void *)(a1 + 48);
  if (v28) {
    (*(void (**)(void))(v28 + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 152));
}

- (uint64_t)_resumeInputConnectionsForNodes:(uint64_t)a3 eventsOnly:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:a2];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = (void *)[v4 _reverseDepthFirstEnumeratorWithVertexOrdering:0];
    result = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
          if ([v5 containsObject:v10])
          {
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            uint64_t v11 = objc_msgSend(v10, "inputs", 0);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v17;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v17 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "connection"), "resumeForEventsOnly:", a3);
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
              }
              while (v13);
            }
          }
          ++v9;
        }
        while (v9 != v7);
        result = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
        uint64_t v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_nodesInSubgraphOfSinkNode:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a1, "_reverseDepthFirstEnumeratorWithVertexOrdering:", 0, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "nodeType"), "isEqualToString:", @"Sink")) {
          BOOL v8 = v11 == a2;
        }
        if (v8) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v4;
}

- (id)_reverseDepthFirstEnumeratorWithVertexOrdering:(int)a3
{
  uint64_t v3 = [[BWReverseDepthFirstEnumerator alloc] initWithGraph:self vertexOrdering:*(void *)&a3];
  return v3;
}

void __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke(uint64_t a1)
{
}

- (void)startDeferredSourceNodesIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5470)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!self->_haveStartedOrCancelledDeferredSourceNodes)
  {
    if ([(NSMutableArray *)self->_deferredStartSourceNodes count])
    {
      self->_haveStartedOrCancelledDeferredSourceNodes = 1;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      obuint64_t j = self->_deferredStartSourceNodes;
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v13 != v6) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            uint64_t v9 = FigDispatchQueueCreateWithPriority();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __43__BWGraph_startDeferredSourceNodesIfNeeded__block_invoke;
            block[3] = &unk_1E5C24458;
            block[4] = self;
            void block[5] = v8;
            dispatch_async(v9, block);
          }
          uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v18 count:16];
        }
        while (v5);
      }
    }
  }
}

- (void)setClientPID:(int)a3
{
  self->_int clientPID = a3;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientatiouint64_t n = a3;
}

- (void)setClientApplicationID:(id)a3
{
  uint64_t v5 = (NSString *)[a3 copy];
  self->_clientApplicationID = v5;
  BOOL v6 = [(NSString *)v5 isEqualToString:0x1EFA55C00]
    || [(NSString *)self->_clientApplicationID isEqualToString:0x1EFA558C0];
  self->_runningForContinuityCapture = v6;
}

- (BOOL)memoryAnalyticsReportingEnabled
{
  return self->_memoryAnalyticsReportingEnabled;
}

- (BWGraph)init
{
  return [(BWGraph *)self initWithConfigurationQueuePriority:13];
}

- (void)setResumesConnectionsAsNodesArePrepared:(BOOL)a3
{
  self->_resumesConnectionsAsNodesArePrepared = a3;
}

- (BWGraph)initWithConfigurationQueuePriority:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)BWGraph;
  uint64_t v4 = [(BWGraph *)&v7 init];
  if (v4)
  {
    if (dword_1EB4C5470)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4->_nodes = (NSMutableArray *)objc_opt_new();
    v4->_sourceNodes = (NSMutableArray *)objc_opt_new();
    v4->_sinkNodes = (NSMutableArray *)objc_opt_new();
    v4->_connections = (NSMutableArray *)objc_opt_new();
    v4->_outputsWithSharedPools = (NSMutableArray *)objc_opt_new();
    v4->_outputsWithSharedPoolsForAttachedMedia = (NSMutableDictionary *)objc_opt_new();
    v4->_supportsLiveReconfiguratiouint64_t n = 1;
    v4->_classicRetainedBufferCount = 0;
    v4->_graphStateTransitionTimeoutSeconds = 10;
    v4->_configurationQueuePriority = a3;
    v4->_sourceStartQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v4;
}

void __39__BWGraph__setMemoryPoolFlushAssertion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  qword_1E96B67B8 = (uint64_t)"Crashing on graph deallocation before audio source stop has been completed";
  __break(1u);
}

- (BOOL)removeNode:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't remove a nil node" userInfo:0]);
  }
  [a3 setGraph:self];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = (void *)[a3 inputs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "connection"), "detach");
        if (-[NSMutableArray containsObject:](self->_connections, "containsObject:", [v10 connection]))-[NSMutableArray removeObject:](self->_connections, "removeObject:", objc_msgSend(v10, "connection")); {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = objc_msgSend(a3, "outputs", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        objc_msgSend((id)objc_msgSend(v16, "connection"), "detach");
        if (-[NSMutableArray containsObject:](self->_connections, "containsObject:", [v16 connection]))-[NSMutableArray removeObject:](self->_connections, "removeObject:", objc_msgSend(v16, "connection")); {
      }
        }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", @"Source"))
  {
    uint64_t v17 = 16;
LABEL_24:
    [*(id *)((char *)&self->super.isa + v17) removeObject:a3];
    goto LABEL_25;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", @"Sink"))
  {
    uint64_t v17 = 24;
    goto LABEL_24;
  }
LABEL_25:
  [(NSMutableArray *)self->_nodes removeObject:a3];
  return 1;
}

- (void)startDeferredNodePrepareIfNeededWithCompletionHandler:(id)a3
{
  if ([(NSMutableArray *)self->_deferredPreparePrioritySinks count])
  {
    if ([(NSArray *)self->_nodesToPrepareAfterGraphStart count])
    {
      nodesToPrepareAfterGraphStart = self->_nodesToPrepareAfterGraphStart;
      self->_nodesToPrepareAfterGraphStart = 0;
      BOOL resumesConnectionsAsNodesArePrepared = self->_resumesConnectionsAsNodesArePrepared;
      uint64_t v7 = FigDispatchQueueCreateWithPriority();
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65__BWGraph_startDeferredNodePrepareIfNeededWithCompletionHandler___block_invoke;
      v8[3] = &unk_1E5C2B518;
      v8[4] = nodesToPrepareAfterGraphStart;
      v8[5] = self;
      BOOL v9 = resumesConnectionsAsNodesArePrepared;
      v8[6] = a3;
      dispatch_async(v7, v8);
    }
  }
}

- (void)cancelDeferredNodePrepare
{
  if (dword_1EB4C5470)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running && [(NSMutableArray *)self->_deferredPreparePrioritySinks count])
  {
    self->_deferredNodePrepareCancelled = 1;
    NSUInteger v4 = [(NSArray *)self->_nodesToPrepareAfterGraphStart count];
    if (v4)
    {
      uint64_t v6 = (void *)MEMORY[0x1A6272C70](v4, v5);
      nodesToPrepareAfterGraphStart = self->_nodesToPrepareAfterGraphStart;
      self->_nodesToPrepareAfterGraphStart = 0;
      -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:]((uint64_t)self, (uint64_t)nodesToPrepareAfterGraphStart, 1);

      dispatch_group_leave((dispatch_group_t)self->_startGroup);
    }
  }
}

- (void)cancelDeferredSourceNodeStart
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5470)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running)
  {
    if ([(NSMutableArray *)self->_deferredStartSourceNodes count])
    {
      if (!self->_haveStartedOrCancelledDeferredSourceNodes)
      {
        self->_haveStartedOrCancelledDeferredSourceNodes = 1;
        long long v8 = 0u;
        long long v9 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        deferredStartSourceNodes = self->_deferredStartSourceNodes;
        uint64_t v5 = [(NSMutableArray *)deferredStartSourceNodes countByEnumeratingWithState:&v8 objects:v14 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v9;
          while (1)
          {
            if (*(void *)v9 != v7) {
              objc_enumerationMutation(deferredStartSourceNodes);
            }
            dispatch_group_leave((dispatch_group_t)self->_startGroup);
            dispatch_group_leave((dispatch_group_t)self->_sourceNodesStartGroup);
            if (!--v6)
            {
              uint64_t v6 = [(NSMutableArray *)deferredStartSourceNodes countByEnumeratingWithState:&v8 objects:v14 count:16];
              if (!v6) {
                break;
              }
            }
          }
        }
      }
    }
  }
}

void __17__BWGraph_start___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6272C70]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) prepareForCurrentConfigurationToBecomeLive];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __17__BWGraph_start___block_invoke_88(uint64_t a1)
{
  v12[16] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  if (dword_1EB4C5470)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EB90] == 1)
  {
    gr_sprintNode((const char *)v12, *(void **)(a1 + 40));
    if (*v3 == 1) {
      kdebug_trace();
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "start:", &v11, v7, v9);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 128));
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 136));
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setErrorStatus:", objc_msgSend(v11, "code"));
    uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*v3 == 1)
    {
      [v11 code];
LABEL_15:
      kdebug_trace();
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureStream"), "suspended");
    }
    if (dword_1EB4C5470)
    {
      uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (*v3 == 1) {
      goto LABEL_15;
    }
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "graph:didStartSourceNode:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(v11, "code", v8, v10));
}

uint64_t __17__BWGraph_start___block_invoke_96(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) statusDelegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 errorStatus];
  return [v2 graph:v3 didFinishStartingWithError:v4];
}

- (BOOL)stop:(id *)a3
{
  if (dword_1EB4C5470)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_beingConfigured) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't stop running while in the middle of a begin/commit block" userInfo:0]);
  }
  -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);

  self->_sourceNodesStartGroup = 0;
  self->_nonDeferredSourceNodesStartGroup = 0;
  sinkNodesIdleGroupForParallelGraphRebuild = self->_sinkNodesIdleGroupForParallelGraphRebuild;
  if (!sinkNodesIdleGroupForParallelGraphRebuild) {
    sinkNodesIdleGroupForParallelGraphRebuild = -[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)self, 0);
  }
  -[BWGraph _stopSourcesUsingDispatchGroup:]((uint64_t)self, sinkNodesIdleGroupForParallelGraphRebuild);
  dispatch_time_t v6 = -[BWGraph _graphStateTransitionTimeout]((dispatch_time_t)self);
  intptr_t v7 = dispatch_group_wait(sinkNodesIdleGroupForParallelGraphRebuild, v6);

  self->_sinkNodesIdleGroupForParallelGraphRebuild = 0;
  if (v7)
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWGraph _logActiveNodesAfterGraphStopTimeout](self);
    -[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]((uint64_t)self);
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Timed out waiting for the capture graph to stop. Please file a radar against %s.", FigCaptureGetFrameworkRadarComponentName());
    -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:]((uint64_t)self, v9);
  }
  if (self->_memoryAnalyticsReportingEnabled)
  {
    [(BWMemoryAnalyticsPayload *)self->_memoryAnalyticsPayload setPeakFootprintDifference:[+[FigCaptureMemoryReporter sharedInstance] peakFootprintSinceReset]];
    [+[FigCaptureMemoryReporter sharedInstance] resetPeakFootprint];
    [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:self->_memoryAnalyticsPayload];

    self->_memoryAnalyticsPayload = 0;
  }
  *(_WORD *)&self->_haveStartedOrCancelledDeferredSourceNodes = 0;
  self->_deferredNodePrepareCancelled = 0;
  return 1;
}

- (void)_waitForStartOrCommitToComplete
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_time_t v1 = a1;
    v2 = (id *)(a1 + 152);
    uint64_t v3 = *(void *)(a1 + 160);
    if (*(void *)(a1 + 152))
    {
      uint64_t v4 = *(NSObject **)(a1 + 152);
      if (v3) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Shouldn't have both a start group and commit group" userInfo:0]);
      }
    }
    else
    {
      uint64_t v4 = *(NSObject **)(a1 + 160);
      if (!v3) {
        return;
      }
    }
    long long v33 = (id *)(a1 + 160);
    uint64_t v34 = *(void *)(a1 + 152);
    if (dword_1EB4C5470)
    {
      unsigned int v51 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_time_t v6 = -[BWGraph _graphStateTransitionTimeout](v1);
    if (dispatch_group_wait(v4, v6))
    {
      dispatch_time_t v39 = v1;
      long long v32 = v2;
      if (v34)
      {
        unsigned int v51 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        intptr_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = *(id *)(v1 + 24);
        uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v69 count:16];
        if (v40)
        {
          uint64_t v37 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v47 != v37) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              unsigned int v51 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              id v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v12 = v51;
              if (os_log_type_enabled(v11, type)) {
                unsigned int v13 = v12;
              }
              else {
                unsigned int v13 = v12 & 0xFFFFFFFE;
              }
              if (v13)
              {
                int v14 = *(_DWORD *)(v39 + 216);
                uint64_t v15 = *(void *)(v39 + 208);
                uint64_t v16 = [v10 nodeSubType];
                uint64_t v17 = [v10 name];
                uint64_t v18 = [v10 currentStateDebugString];
                int v53 = 136316930;
                uint64_t v54 = "-[BWGraph _waitForStartOrCommitToComplete]";
                __int16 v55 = 2048;
                dispatch_time_t v56 = v39;
                __int16 v57 = 1026;
                int v58 = v14;
                __int16 v59 = 2114;
                uint64_t v60 = v15;
                __int16 v61 = 2048;
                long long v62 = v10;
                __int16 v63 = 2112;
                uint64_t v64 = v16;
                __int16 v65 = 2114;
                uint64_t v66 = v17;
                __int16 v67 = 2114;
                uint64_t v68 = v18;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v69 count:16];
          }
          while (v40);
          dispatch_time_t v1 = v39;
        }
        long long v19 = @"Timed out waiting for capture graph start to complete. Please file a radar against %s.";
      }
      else
      {
        unsigned int v51 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id obja = *(id *)(v1 + 24);
        uint64_t v41 = [obja countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v41)
        {
          uint64_t v38 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v43 != v38) {
                objc_enumerationMutation(obja);
              }
              long long v21 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              unsigned int v51 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              long long v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v23 = v51;
              if (os_log_type_enabled(v22, type)) {
                unsigned int v24 = v23;
              }
              else {
                unsigned int v24 = v23 & 0xFFFFFFFE;
              }
              if (v24)
              {
                int v25 = *(_DWORD *)(v39 + 216);
                uint64_t v26 = *(void *)(v39 + 208);
                uint64_t v27 = [v21 nodeSubType];
                uint64_t v28 = [v21 name];
                uint64_t v29 = [v21 currentStateDebugString];
                int v53 = 136316930;
                uint64_t v54 = "-[BWGraph _waitForStartOrCommitToComplete]";
                __int16 v55 = 2048;
                dispatch_time_t v56 = v39;
                __int16 v57 = 1026;
                int v58 = v25;
                __int16 v59 = 2114;
                uint64_t v60 = v26;
                __int16 v61 = 2048;
                long long v62 = v21;
                __int16 v63 = 2112;
                uint64_t v64 = v27;
                __int16 v65 = 2114;
                uint64_t v66 = v28;
                __int16 v67 = 2114;
                uint64_t v68 = v29;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            uint64_t v41 = [obja countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v41);
          dispatch_time_t v1 = v39;
        }
        long long v19 = @"Timed out waiting for capture graph commit to complete. Please file a radar against %s.";
      }
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", v19, FigCaptureGetFrameworkRadarComponentName());
      -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:](v1, v30);
      v2 = v32;
    }
    if (v34) {
      long long v31 = v2;
    }
    else {
      long long v31 = v33;
    }

    *long long v31 = 0;
  }
}

- (void)_stopSourcesUsingDispatchGroup:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = FigDispatchQueueCreateWithPriority();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = *(void **)(a1 + 16);
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
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __42__BWGraph__stopSourcesUsingDispatchGroup___block_invoke;
          v11[3] = &unk_1E5C24458;
          v11[4] = a1;
          v11[5] = v10;
          dispatch_group_async(a2, v4, v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (dispatch_time_t)_graphStateTransitionTimeout
{
  if (result)
  {
    dispatch_time_t v1 = result;
    if (FigCaptureIsDebuggerOrSlowAllocationPathEnabled())
    {
      return -1;
    }
    else
    {
      int64_t v2 = 1000000000 * *(int *)(v1 + 240);
      return dispatch_time(0, v2);
    }
  }
  return result;
}

- _logActiveNodesAfterGraphStopTimeout
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  int *v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __CFString *v63;
  _DWORD *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  os_log_type_t type;
  unsigned int v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  int v85;
  const char *v86;
  __int16 v87;
  _DWORD *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  unsigned char v107[128];
  unsigned char v108[128];
  unsigned char v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E4F143B8];
  uint64_t v64 = result;
  if (result)
  {
    id v83 = 0u;
    id v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obuint64_t j = (id)[result _depthFirstEnumeratorWithVertexOrdering:0];
    result = (_DWORD *)[obj countByEnumeratingWithState:&v81 objects:v109 count:16];
    uint64_t v50 = result;
    if (result)
    {
      long long v49 = *(void *)v82;
      do
      {
        dispatch_time_t v1 = 0;
        do
        {
          if (*(void *)v82 != v49) {
            objc_enumerationMutation(obj);
          }
          unsigned int v51 = v1;
          int64_t v2 = *(void **)(*((void *)&v81 + 1) + 8 * v1);
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v80 = 0u;
          uint64_t v70 = v2;
          uint64_t v3 = objc_msgSend(v2, "inputs", v45);
          uint64_t v4 = [v3 countByEnumeratingWithState:&v77 objects:v108 count:16];
          if (v4)
          {
            uint64_t v5 = v4;
            uint64_t v6 = *(void *)v78;
            __int16 v55 = *(void *)v78;
            int v58 = v3;
            do
            {
              uint64_t v7 = 0;
              __int16 v61 = v5;
              do
              {
                if (*(void *)v78 != v6) {
                  objc_enumerationMutation(v3);
                }
                uint64_t v8 = *(void **)(*((void *)&v77 + 1) + 8 * v7);
                if (objc_msgSend(v8, "liveFormat", v46, v47))
                {
                  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "connection"), "output");
                  uint64_t v10 = [v9 liveFormat];
                  if (v9 && v10 == 0)
                  {
                    long long v76 = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    long long v13 = v76;
                    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                      long long v14 = v13;
                    }
                    else {
                      long long v14 = v13 & 0xFFFFFFFE;
                    }
                    if (v14)
                    {
                      uint64_t v66 = v64[54];
                      uint64_t v68 = *((void *)v64 + 26);
                      __int16 v65 = [v70 nodeType];
                      long long v15 = [v70 nodeSubType];
                      uint64_t v16 = [v70 name];
                      uint64_t v17 = gr_logStringForInput(v8);
                      uint64_t v18 = gr_logStringForOutput(v9, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "node"), "outputs"), "indexOfObject:", v9));
                      uint64_t v85 = 136317442;
                      unsigned int v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                      v87 = 2048;
                      v88 = v64;
                      v89 = 1026;
                      v90 = v66;
                      v91 = 2114;
                      v92 = v68;
                      v93 = 2048;
                      uint64_t v94 = v70;
                      v95 = 2112;
                      v96 = v65;
                      v97 = 2112;
                      v98 = v15;
                      uint64_t v6 = v55;
                      uint64_t v3 = v58;
                      v99 = 2114;
                      v100 = v16;
                      v101 = 2114;
                      v102 = v17;
                      v103 = 2114;
                      v104 = v18;
                      LODWORD(v47) = 98;
                      long long v46 = &v85;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    uint64_t v5 = v61;
                  }
                }
                ++v7;
              }
              while (v5 != v7);
              uint64_t v5 = [v3 countByEnumeratingWithState:&v77 objects:v108 count:16];
            }
            while (v5);
          }
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          uint64_t v54 = (id)objc_msgSend(v70, "outputs", v46);
          long long v69 = [v54 countByEnumeratingWithState:&v71 objects:v107 count:16];
          if (v69)
          {
            long long v19 = 0;
            __int16 v67 = *(void *)v72;
            do
            {
              long long v20 = 0;
              int v53 = v19;
              do
              {
                if (*(void *)v72 != v67) {
                  objc_enumerationMutation(v54);
                }
                long long v21 = *(void **)(*((void *)&v71 + 1) + 8 * v20);
                long long v22 = objc_msgSend(v21, "liveFormat", v45);
                unsigned int v23 = [v21 indexOfInputWhichDrivesThisOutput];
                unsigned int v24 = objc_msgSend((id)objc_msgSend(v21, "node"), "inputs");
                if ((v23 & 0x80000000) != 0 || (int v25 = v24, [v24 count] <= (unint64_t)v23))
                {
                  if (!v22) {
                    goto LABEL_53;
                  }
                  objc_opt_class();
                  long long v36 = &stru_1EFA403E0;
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v37 = NSString;
                    long long v45 = (int *)objc_opt_class();
                    long long v36 = (__CFString *)[v37 stringWithFormat:@" Possible bug in -[%@ stop:]."];
                  }
                  long long v76 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  uint64_t v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  dispatch_time_t v39 = v76;
                  if (os_log_type_enabled(v38, type)) {
                    uint64_t v40 = v39;
                  }
                  else {
                    uint64_t v40 = v39 & 0xFFFFFFFE;
                  }
                  if (v40)
                  {
                    __int16 v57 = v64[54];
                    uint64_t v60 = *((void *)v64 + 26);
                    __int16 v63 = v36;
                    uint64_t v41 = [v70 nodeType];
                    long long v42 = [v70 nodeSubType];
                    long long v43 = [v70 name];
                    long long v44 = gr_logStringForOutput(v21, v19 + v20);
                    uint64_t v85 = 136317442;
                    unsigned int v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                    v87 = 2048;
                    v88 = v64;
                    v89 = 1026;
                    v90 = v57;
                    v91 = 2114;
                    v92 = v60;
                    v93 = 2048;
                    uint64_t v94 = v70;
                    long long v19 = v53;
                    v95 = 2112;
                    v96 = v41;
                    v97 = 2112;
                    v98 = v42;
                    v99 = 2114;
                    v100 = v43;
                    v101 = 2114;
                    v102 = v44;
                    v103 = 2112;
                    v104 = (uint64_t)v63;
                    LODWORD(v47) = 98;
                    long long v45 = &v85;
LABEL_51:
                    _os_log_send_and_compose_impl();
                  }
LABEL_52:
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  goto LABEL_53;
                }
                uint64_t v26 = (void *)[v25 objectAtIndexedSubscript:v23];
                uint64_t v27 = [v26 liveFormat];
                if (v22) {
                  uint64_t v28 = v27 == 0;
                }
                else {
                  uint64_t v28 = 0;
                }
                if (v28)
                {
                  long long v76 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  uint64_t v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  long long v30 = v76;
                  if (os_log_type_enabled(v29, type)) {
                    long long v31 = v30;
                  }
                  else {
                    long long v31 = v30 & 0xFFFFFFFE;
                  }
                  if (v31)
                  {
                    __int16 v59 = v64[54];
                    long long v62 = *((void *)v64 + 26);
                    dispatch_time_t v56 = [v70 nodeType];
                    long long v52 = [v70 nodeSubType];
                    long long v32 = [v70 name];
                    long long v33 = gr_logStringForInput(v26);
                    uint64_t v34 = gr_logStringForOutput(v21, v19 + v20);
                    long long v35 = objc_opt_class();
                    uint64_t v85 = 136317698;
                    unsigned int v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                    v87 = 2048;
                    v88 = v64;
                    v89 = 1026;
                    v90 = v59;
                    v91 = 2114;
                    v92 = v62;
                    v93 = 2048;
                    uint64_t v94 = v70;
                    v95 = 2112;
                    v96 = v56;
                    v97 = 2112;
                    v98 = v52;
                    v99 = 2114;
                    v100 = v32;
                    v101 = 2114;
                    v102 = v33;
                    v103 = 2114;
                    v104 = v34;
                    long long v19 = v53;
                    v105 = 2112;
                    v106 = v35;
                    LODWORD(v47) = 108;
                    long long v45 = &v85;
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
LABEL_53:
                ++v20;
              }
              while (v69 != v20);
              long long v19 = (v19 + v20);
              long long v69 = [v54 countByEnumeratingWithState:&v71 objects:v107 count:16];
            }
            while (v69);
          }
          dispatch_time_t v1 = v51 + 1;
        }
        while ((void *)(v51 + 1) != v50);
        result = (_DWORD *)[obj countByEnumeratingWithState:&v81 objects:v109 count:16];
        uint64_t v50 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_logActiveSinkNodesAfterGraphStopTimeout
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = result;
  if (result)
  {
    unsigned int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = *(id *)(v21 + 24);
    result = [obj countByEnumeratingWithState:&v32 objects:v59 count:16];
    uint64_t v19 = result;
    if (result)
    {
      uint64_t v18 = *(void *)v33;
      do
      {
        uint64_t v2 = 0;
        do
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = v2;
          uint64_t v3 = *(void **)(*((void *)&v32 + 1) + 8 * v2);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v22 = (id)objc_msgSend(v3, "inputs", v15, v16);
          uint64_t v4 = [v22 countByEnumeratingWithState:&v28 objects:v58 count:16];
          if (v4)
          {
            uint64_t v5 = v4;
            uint64_t v27 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v5; ++i)
              {
                if (*(void *)v29 != v27) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                if (objc_msgSend(v3, "isActive", v15, v16))
                {
                  unsigned int v37 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v9 = v37;
                  if (os_log_type_enabled(v8, type)) {
                    unsigned int v10 = v9;
                  }
                  else {
                    unsigned int v10 = v9 & 0xFFFFFFFE;
                  }
                  if (v10)
                  {
                    int v25 = *(_DWORD *)(v21 + 216);
                    uint64_t v26 = *(void *)(v21 + 208);
                    uint64_t v24 = [v3 nodeSubType];
                    uint64_t v23 = [v3 name];
                    uint64_t v11 = [v3 currentStateDebugString];
                    uint64_t v12 = gr_logStringForInput(v7);
                    uint64_t v13 = [v7 liveFormat];
                    int v38 = 136317442;
                    long long v14 = "live";
                    if (!v13) {
                      long long v14 = "EOD";
                    }
                    dispatch_time_t v39 = "-[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]";
                    __int16 v40 = 2048;
                    uint64_t v41 = v21;
                    __int16 v42 = 1026;
                    int v43 = v25;
                    __int16 v44 = 2114;
                    uint64_t v45 = v26;
                    __int16 v46 = 2048;
                    long long v47 = v3;
                    __int16 v48 = 2112;
                    uint64_t v49 = v24;
                    __int16 v50 = 2114;
                    uint64_t v51 = v23;
                    __int16 v52 = 2114;
                    uint64_t v53 = v11;
                    __int16 v54 = 2114;
                    uint64_t v55 = v12;
                    __int16 v56 = 2080;
                    __int16 v57 = v14;
                    LODWORD(v16) = 98;
                    long long v15 = &v38;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
              uint64_t v5 = [v22 countByEnumeratingWithState:&v28 objects:v58 count:16];
            }
            while (v5);
          }
          uint64_t v2 = v20 + 1;
        }
        while (v20 + 1 != v19);
        result = [obj countByEnumeratingWithState:&v32 objects:v59 count:16];
        uint64_t v19 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_timedOutWaitingForOperationToCompleteWithDescription:(uint64_t)result
{
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    WriteStackshotReport();
    result = [a2 UTF8String];
    qword_1E96B67B8 = result;
    __break(1u);
  }
  return result;
}

- (BOOL)stopSources:(id *)a3
{
  if (self->_beingConfigured) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can't stop running while in the middle of a begin/commit block" userInfo:0]);
  }
  -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);

  self->_sourceNodesStartGroup = 0;
  self->_nonDeferredSourceNodesStartGroup = 0;
  self->_sinkNodesIdleGroupForParallelGraphRebuild = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)self, 0);
  uint64_t v4 = dispatch_group_create();
  -[BWGraph _stopSourcesUsingDispatchGroup:]((uint64_t)self, v4);
  dispatch_time_t v5 = -[BWGraph _graphStateTransitionTimeout]((dispatch_time_t)self);
  intptr_t v6 = dispatch_group_wait(v4, v5);

  if (v6)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWGraph _logActiveNodesAfterGraphStopTimeout](self);
    -[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]((uint64_t)self);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Timed out waiting for the capture graph to stop. Please file a radar against %s.", FigCaptureGetFrameworkRadarComponentName());
    -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:]((uint64_t)self, v8);
  }

  self->_sourceNodes = 0;
  self->_haveStartedOrCancelledDeferredSourceNodes = 0;
  self->_deferredNodePrepareCancelled = 0;
  return 1;
}

- (void)waitForNonDeferredSourceNodesToStart
{
  nonDeferredSourceNodesStartGroup = self->_nonDeferredSourceNodesStartGroup;
  if (nonDeferredSourceNodesStartGroup) {
    dispatch_group_wait(nonDeferredSourceNodesStartGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (BOOL)_prepareNodesWithConfigurationChanges:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = *(void **)(a1 + 8);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v7 hasNonLiveConfigurationChanges]) {
            [v7 prepareForCurrentConfigurationToBecomeLive];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  return a1 != 0;
}

- (uint64_t)_makeParentConfigurationChangesLive
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    dispatch_time_t v1 = *(void **)(result + 8);
    result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v7;
      while (2)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v7 != v3) {
            objc_enumerationMutation(v1);
          }
          uint64_t v5 = *(void **)(*((void *)&v6 + 1) + 8 * v4);
          if ([v5 hasNonLiveConfigurationChanges]) {
            return [v5 makeCurrentConfigurationLive];
          }
          ++v4;
        }
        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (NSObject)_newDispatchGroupForSinksToBecomeLiveWithConfigurationID:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = [*(id *)(a1 + 24) count];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      dispatch_group_enter(v4);
      --v6;
    }
    while (v6);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v7 = *(void **)(a1 + 24);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __68__BWGraph__newDispatchGroupForSinksToBecomeLiveWithConfigurationID___block_invoke;
        v14[3] = &unk_1E5C2B560;
        v14[4] = v4;
        void v14[5] = a2;
        [v12 notifyWhenConfigurationID:a2 becomesLive:v14];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return v4;
}

- (void)waitForStartOrCommitToComplete
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_running)
  {
    if (dword_1EB4C5470)
    {
      int v16 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWGraph startDeferredNodePrepareIfNeededWithCompletionHandler:](self, "startDeferredNodePrepareIfNeededWithCompletionHandler:", 0, v9, v10);
    [(BWGraph *)self startDeferredSourceNodesIfNeeded];
    -[BWGraph _waitForSourceNodesToStart]((dispatch_time_t)self);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    sourceNodes = self->_sourceNodes;
    uint64_t v5 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(sourceNodes);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) makeOutputsLiveIfNeeded];
        }
        uint64_t v6 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v6);
    }
    -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);
  }
}

- (void)_waitForSourceNodesToStart
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 128);
    if (v2)
    {
      if (dword_1EB4C5470)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v2 = *(NSObject **)(a1 + 128);
      }
      dispatch_time_t v4 = -[BWGraph _graphStateTransitionTimeout](a1);
      if (dispatch_group_wait(v2, v4))
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Timed out waiting for capture graph source nodes start to complete. Please file a radar against %s.", FigCaptureGetFrameworkRadarComponentName());
        -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:](a1, v5);
      }

      *(void *)(a1 + 128) = 0;
    }
  }
}

- (BOOL)supportsLiveReconfiguration
{
  return self->_supportsLiveReconfiguration;
}

- (id)dotString
{
  return 0;
}

- (id)clientApplicationID
{
  return self->_clientApplicationID;
}

- (int)clientPID
{
  return self->_clientPID;
}

- (id)modeDescription
{
  return self->_modeDescription;
}

- (id)sourceDescription
{
  return self->_sourceDescription;
}

- (id)_sourceNodes
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_sourceNodes];
}

- (id)_depthFirstEnumeratorWithVertexOrdering:(int)a3
{
  uint64_t v3 = [[BWDepthFirstEnumerator alloc] initWithGraph:self vertexOrdering:*(void *)&a3];
  return v3;
}

- (id)_breadthFirstEnumerator
{
  uint64_t v2 = [[BWBreadthFirstEnumerator alloc] initWithGraph:self];
  return v2;
}

- (id)_reverseBreadthFirstEnumerator
{
  uint64_t v2 = [[BWReverseBreadthFirstEnumerator alloc] initWithGraph:self];
  return v2;
}

void __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke_2(uint64_t a1)
{
}

void __68__BWGraph__newDispatchGroupForSinksToBecomeLiveWithConfigurationID___block_invoke(uint64_t a1)
{
}

uint64_t __42__BWGraph__stopSourcesUsingDispatchGroup___block_invoke(uint64_t a1)
{
  v7[27] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (dword_1EB4C5470)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "stop:", v7, v5, v6);
  if (v7[0] || dword_1EB4C5470)
  {
    dispatch_time_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (id)osStatePropertyList
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_nodes, 1), @"nodes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_sourceNodes, 0), @"sourceNodes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_sinkNodes, 0), @"sinkNodes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_nodesToBypassUntilPrepared, 0), @"nodesToBypassUntilPrepared");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_nodesToPrepareConcurrently, 0), @"nodesToPrepareConcurrently");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_nodesToPrepareAfterGraphStart, 0), @"nodesToPrepareAfterGraphStart");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_deferredPreparePrioritySinks, 0), @"deferredPreparePrioritySinks");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_deferredStartSourceNodes, 0), @"deferredStartSourceNodes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWGraph statePropertyListForNodes:verbose:]((uint64_t)self, self->_deferredStartSourceNodesThatMustStartAfterNonDeferred, 0), @"deferredStartSourceNodesThatMustStartAfterNonDeferred");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_deferredNodePrepareCancelled), @"deferredNodePrepareCancelled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_haveStartedOrCancelledDeferredSourceNodes), @"haveStartedOrCancelledDeferredSourceNodes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_resumesConnectionsAsNodesArePrepared), @"resumesConnectionsAsNodesArePrepared");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_running), @"running");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_beingConfigured), @"beingConfigured");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_inflightConfigurationID), @"inflightConfigurationID");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_supportsLiveReconfiguration), @"supportsLiveReconfiguration");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_errorStatus), @"errorStatus");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_clientPID), @"clientPID");
  [v3 setObject:self->_modeDescription forKeyedSubscript:@"modeDescription"];
  [v3 setObject:self->_sourceDescription forKeyedSubscript:@"sourceDescription"];
  return v3;
}

- (void)statePropertyListForNodes:(uint64_t)a3 verbose:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 osStatePropertyListWithVerbose:a3];
        if (!v11) {
          uint64_t v11 = [NSString stringWithFormat:@"Error getting node state for node '%@'", v10];
        }
        [v5 addObject:v11];
      }
      uint64_t v7 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

- (int)graphStateTransitionTimeoutSeconds
{
  return self->_graphStateTransitionTimeoutSeconds;
}

- (void)setGraphStateTransitionTimeoutSeconds:(int)a3
{
  self->_graphStateTransitionTimeoutSeconds = a3;
}

- (BOOL)resumesConnectionsAsNodesArePrepared
{
  return self->_resumesConnectionsAsNodesArePrepared;
}

- (void)_resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:.cold.1()
{
}

@end