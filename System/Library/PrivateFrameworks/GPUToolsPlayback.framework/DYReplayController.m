@interface DYReplayController
+ (id)sharedController;
- (BOOL)_handleArchiveLoadingForPlaybackRequest:(id)a3 replyKind:(int)a4;
- (BOOL)_loadArchives:(id)a3 error:(id *)a4;
- (BOOL)informReady;
- (BOOL)initializeTransportWith:(id)a3;
- (BOOL)playbackArchive:(id)a3;
- (DYCaptureArchiveStack)archiveStack;
- (DYPlaybackEngine)playbackEngine;
- (DYReplayController)init;
- (DYReplayControllerSupport)replayControllerSupport;
- (DYTransport)transport;
- (DYTransportMessage)replayMessage;
- (DYTransportSource)source;
- (NSMutableArray)experiments;
- (NSMutableDictionary)profileInfo;
- (OS_dispatch_queue)queue;
- (id)_archiveDirectory;
- (id)_playbackCurrentArchiveAndExperiments;
- (id)_popMessage;
- (id)_replayerControllerSupportForCaptureStore:(id)a3;
- (id)origSourceMessageHandler;
- (id)profileBlockBackgroundQueue;
- (id)profileBlockQueue;
- (void)_beginDebugArchive;
- (void)_deleteAllArchives;
- (void)_displayPlaybackEngine;
- (void)_endPlayback;
- (void)_messageLoop;
- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5;
- (void)_processMessage:(id)a3;
- (void)_pushMessage:(id)a3;
- (void)_recursivePlaybackWithFuture:(id)a3 usingExperiment:(id)a4 withToplevelFuture:(id)a5;
- (void)dealloc;
- (void)setArchiveStack:(id)a3;
- (void)setExperiments:(id)a3;
- (void)setOrigSourceMessageHandler:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setProfileInfo:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplayControllerSupport:(id)a3;
- (void)setReplayMessage:(id)a3;
- (void)setSource:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation DYReplayController

- (id)profileBlockQueue
{
  return self->_profileBlockQueue;
}

- (id)profileBlockBackgroundQueue
{
  return self->_profileBlockBackgroundQueue;
}

- (DYReplayController)init
{
  v27.receiver = self;
  v27.super_class = (Class)DYReplayController;
  v2 = [(DYReplayController *)&v27 init];
  v3 = v2;
  if (v2)
  {
    v4 = NSString;
    v5 = [NSString stringWithUTF8String:object_getClassName(v2)];
    id v6 = [v4 stringWithFormat:@"gputools.%@.%p", v5, v3];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    [(DYReplayController *)v3 setQueue:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F3F958]);
    [(DYReplayController *)v3 setArchiveStack:v8];

    v9 = NSString;
    v10 = [NSString stringWithUTF8String:object_getClassName(v3)];
    id v11 = [v9 stringWithFormat:@"gputools.%@.%p.%@", v10, v3, @"messageLock"];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    messageLock = v3->_messageLock;
    v3->_messageLock = (OS_dispatch_queue *)v12;

    v14 = NSString;
    v15 = [NSString stringWithUTF8String:object_getClassName(v3)];
    id v16 = [v14 stringWithFormat:@"gputools.%@.%p.%@", v15, v3, @"messageProcessingQueue"];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    messageProcessingQueue = v3->_messageProcessingQueue;
    v3->_messageProcessingQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = v19;

    uint64_t v21 = objc_opt_new();
    profileBlockQueue = v3->_profileBlockQueue;
    v3->_profileBlockQueue = (DYReplayControllerQueue *)v21;

    uint64_t v23 = objc_opt_new();
    profileBlockBackgroundQueue = v3->_profileBlockBackgroundQueue;
    v3->_profileBlockBackgroundQueue = (DYReplayControllerQueue *)v23;

    v25 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v3 = [(DYReplayController *)self origSourceMessageHandler];
  v4 = [(DYReplayController *)self source];
  [v4 setMessageHandler:v3];

  [(DYReplayController *)self setQueue:0];
  v5.receiver = self;
  v5.super_class = (Class)DYReplayController;
  [(DYReplayController *)&v5 dealloc];
}

+ (id)sharedController
{
  return 0;
}

- (BOOL)initializeTransportWith:(id)a3
{
  id v4 = a3;
  objc_super v5 = DYGetGlobalClientTransport();
  [(DYReplayController *)self setTransport:v5];

  id v6 = [(DYReplayController *)self transport];

  if (v6
    && (DYGetGlobalTransportSource(),
        dispatch_queue_t v7 = objc_claimAutoreleasedReturnValue(),
        [(DYReplayController *)self setSource:v7],
        v7,
        [(DYReplayController *)self source],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [(DYReplayController *)self source];
    [v9 suspend];

    v10 = [(DYReplayController *)self source];
    id v11 = [v10 messageHandler];
    dispatch_queue_t v12 = (void *)[v11 copy];
    [(DYReplayController *)self setOrigSourceMessageHandler:v12];

    objc_initWeak(&location, self);
    uint64_t v17 = MEMORY[0x263EF8330];
    objc_copyWeak(&v18, &location);
    v13 = [(DYReplayController *)self source];
    [v13 setMessageHandler:&v17];

    v14 = [(DYReplayController *)self source];
    [v14 resume];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    BOOL v15 = 1;
  }
  else
  {
    _DYOLog();
    BOOL v15 = 0;
  }

  return v15;
}

void __46__DYReplayController_initializeTransportWith___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pushMessage:v3];
}

- (BOOL)informReady
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = DYGetInterposeVersion();
  uint64_t v5 = v4;
  id v6 = (void *)MEMORY[0x263F3F9E8];
  v17[0] = @"version";
  dispatch_queue_t v7 = [NSNumber numberWithInt:*MEMORY[0x263F3FA18]];
  v18[0] = v7;
  v17[1] = @"interpose-feature-version";
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  v18[1] = v8;
  v17[2] = @"interpose-patch-version";
  v9 = [NSString stringWithUTF8String:v5];
  v18[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  id v11 = [v6 messageWithKind:4096 attributes:v10];

  dispatch_queue_t v12 = [(DYReplayController *)self transport];
  id v16 = 0;
  char v13 = [v12 send:v11 error:&v16];
  id v14 = v16;

  if ((v13 & 1) == 0) {
    _DYOLog();
  }

  return v13;
}

- (BOOL)playbackArchive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
  id v18 = 0;
  BOOL v6 = [(DYReplayController *)self _loadArchives:v5 error:&v18];
  id v7 = v18;

  if (v6)
  {
    id v8 = [(DYReplayController *)self archiveStack];
    v9 = [(DYReplayController *)self _replayerControllerSupportForCaptureStore:v8];
    [(DYReplayController *)self setReplayControllerSupport:v9];

    v10 = [(DYReplayController *)self replayControllerSupport];
    id v11 = [(DYReplayController *)self archiveStack];
    dispatch_queue_t v12 = [v10 createArchivePlaybackEngineWithCaptureStore:v11];
    [(DYReplayController *)self setPlaybackEngine:v12];

    [(DYReplayController *)self _displayPlaybackEngine];
    char v13 = [(DYReplayController *)self playbackEngine];
    id v14 = [v13 playback];

    BOOL v15 = [(DYReplayController *)self queue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __38__DYReplayController_playbackArchive___block_invoke;
    void v17[3] = &unk_2653392C8;
    v17[4] = self;
    [v14 notifyOnQueue:v15 handler:v17];

    [v14 waitUntilResolved];
  }

  return v6;
}

uint64_t __38__DYReplayController_playbackArchive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaybackEngine:0];
}

- (id)_popMessage
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  messageLock = self->_messageLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__DYReplayController__popMessage__block_invoke;
  v5[3] = &unk_265339588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(messageLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__DYReplayController__popMessage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v6 removeObjectAtIndex:0];
  }
  return result;
}

- (void)_pushMessage:(id)a3
{
  id v4 = a3;
  messageLock = self->_messageLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__DYReplayController__pushMessage___block_invoke;
  v7[3] = &unk_2653395D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(messageLock, v7);
}

void __35__DYReplayController__pushMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) kind] == 4106)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(v2 + 24);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__DYReplayController__pushMessage___block_invoke_2;
    v8[3] = &unk_2653395B0;
    v8[4] = v2;
    id v4 = [MEMORY[0x263F08A98] predicateWithBlock:v8];
    [v3 filterUsingPredicate:v4];
  }
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(NSObject **)(v5 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__DYReplayController__pushMessage___block_invoke_3;
  v7[3] = &unk_2653392C8;
  void v7[4] = v5;
  dispatch_async(v6, v7);
}

uint64_t __35__DYReplayController__pushMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 kind];
  switch(v4)
  {
    case 1026:
      uint64_t v5 = [*(id *)(a1 + 32) transport];
      id v6 = [MEMORY[0x263F3F9E8] messageWithKind:1026 attributes:0 payload:0];
      [v5 send:v6 inReplyTo:v3 error:0];
      break;
    case 4106:
      uint64_t v5 = [*(id *)(a1 + 32) transport];
      id v7 = (void *)MEMORY[0x263F3F9E8];
      id v6 = [NSNumber numberWithBool:1];
      id v8 = [v7 messageWithKind:4105 objectPayload:v6];
      [v5 send:v8 inReplyTo:v3 error:0];

      break;
    case 4121:
      uint64_t v5 = [*(id *)(a1 + 32) transport];
      id v6 = [MEMORY[0x263F3F9E8] messageWithKind:4121 attributes:0 payload:0];
      [v5 send:v6 inReplyTo:v3 error:0];
      break;
    default:
      uint64_t v9 = 1;
      goto LABEL_9;
  }

  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __35__DYReplayController__pushMessage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _messageLoop];
}

- (void)_messageLoop
{
  id v3 = [(DYReplayController *)self _popMessage];
  if (v3
    || [(DYReplayControllerQueue *)self->_profileBlockQueue count]
    || [(DYReplayControllerQueue *)self->_profileBlockBackgroundQueue count])
  {
    p_profileBlockQueue = &self->_profileBlockQueue;
    p_profileBlockBackgroundQueue = &self->_profileBlockBackgroundQueue;
    uint64_t v6 = 0xFFFFFFFFLL;
    while (1)
    {
      if (v3)
      {
        if (v6 != -1)
        {
          id v7 = [(DYReplayController *)self playbackEngine];
          [v7 playbackToFunction:v6 withLoops:0];
        }
        [(DYReplayController *)self _processMessage:v3];
        uint64_t v6 = 0xFFFFFFFFLL;
      }
      else
      {
        if ([(DYReplayControllerQueue *)*p_profileBlockQueue count]) {
          id v8 = &self->_profileBlockQueue;
        }
        else {
          id v8 = &self->_profileBlockBackgroundQueue;
        }
        uint64_t v9 = *v8;
        v10 = [(DYReplayControllerQueue *)v9 front];
        [(DYReplayControllerQueue *)v9 dequeBlock];
        if (v6 == -1)
        {
          id v11 = [(DYReplayController *)self playbackEngine];
          uint64_t v6 = [v11 targetFunctionIndex];
        }
        v10[2](v10);
        if (![(DYReplayControllerQueue *)*p_profileBlockQueue count]
          && ![(DYReplayControllerQueue *)*p_profileBlockBackgroundQueue count]
          && v6 != -1)
        {
          dispatch_queue_t v12 = [(DYReplayController *)self playbackEngine];
          [v12 playbackToFunction:v6 withLoops:0];

          uint64_t v6 = 0xFFFFFFFFLL;
        }
      }
      uint64_t v13 = [(DYReplayController *)self _popMessage];

      id v3 = (void *)v13;
      if (!v13)
      {
        id v3 = 0;
        if (![(DYReplayControllerQueue *)*p_profileBlockQueue count])
        {
          id v3 = 0;
          if (![(DYReplayControllerQueue *)*p_profileBlockBackgroundQueue count]) {
            break;
          }
        }
      }
    }
  }
}

- (void)_processMessage:(id)a3
{
  uint64_t v176 = *MEMORY[0x263EF8340];
  id v155 = a3;
  int v4 = [v155 kind];
  if (v4 > 4097)
  {
    v154 = self;
    switch(v4)
    {
      case 4098:
        if (![(DYReplayController *)self _handleArchiveLoadingForPlaybackRequest:v155 replyKind:4100])goto LABEL_54; {
        [(DYReplayController *)self setReplayMessage:v155];
        }
        uint64_t v5 = [v155 attributeForKey:*MEMORY[0x263F3FA30]];
        id obj = (id)v5;
        if (v5)
        {
          uint64_t v6 = (void *)MEMORY[0x263F3F9E0];
          id v7 = (void *)MEMORY[0x263EFFA08];
          uint64_t v8 = objc_opt_class();
          uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
          id v169 = 0;
          v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v169];
          id v11 = v169;

          if (v10)
          {
            dispatch_queue_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v10];
            [(DYReplayController *)self setExperiments:v12];
          }
        }
        else
        {
          id v11 = 0;
        }
        uint64_t v136 = *MEMORY[0x263F3FE90];
        v137 = [v155 attributeForKey:*MEMORY[0x263F3FE90]];
        uint64_t v138 = *MEMORY[0x263F3FE88];
        v139 = [v155 attributeForKey:*MEMORY[0x263F3FE88]];
        v159 = v139;
        if (v137)
        {
          v140 = objc_opt_new();
          [(DYReplayController *)self setProfileInfo:v140];

          v141 = [(DYReplayController *)self profileInfo];
          [v141 setObject:v137 forKey:v136];
        }
        else
        {
          if (![v139 count]) {
            goto LABEL_63;
          }
          v142 = objc_opt_new();
          [(DYReplayController *)self setProfileInfo:v142];

          v141 = [(DYReplayController *)self profileInfo];
          [v141 setObject:v159 forKey:v138];
        }

LABEL_63:
        v143 = [(DYReplayController *)self _playbackCurrentArchiveAndExperiments];
        [v143 waitUntilResolved];
        v144 = [(DYReplayController *)self profileInfo];
        BOOL v145 = v144 == 0;

        if (v145)
        {
          v148 = [(DYReplayController *)self transport];
          v153 = (void *)MEMORY[0x263F3F9E8];
          v150 = [NSNumber numberWithBool:1];
          v151 = [v153 messageWithKind:4100 objectPayload:v150];
          v152 = [(DYReplayController *)self replayMessage];
          [v148 send:v151 inReplyTo:v152 error:0];
        }
        else
        {
          v146 = (void *)MEMORY[0x263F08910];
          v147 = [v143 result];
          id v168 = v11;
          v148 = [v146 archivedDataWithRootObject:v147 requiringSecureCoding:1 error:&v168];
          id v149 = v168;

          v150 = [(DYReplayController *)self transport];
          v151 = [MEMORY[0x263F3F9E8] messageWithKind:4100 objectPayload:v148];
          v152 = [(DYReplayController *)self replayMessage];
          [v150 send:v151 inReplyTo:v152 error:0];
          id v11 = v149;
        }

        [(DYReplayController *)self setReplayMessage:0];
        [(DYReplayController *)self setExperiments:0];
        [(DYReplayController *)self setProfileInfo:0];

        goto LABEL_54;
      case 4099:
      case 4100:
      case 4101:
      case 4105:
      case 4113:
      case 4117:
      case 4118:
      case 4123:
      case 4124:
      case 4125:
        goto LABEL_49;
      case 4102:
        [(DYReplayController *)self _deleteAllArchives];
        v22 = [(DYReplayController *)self transport];
        uint64_t v23 = [MEMORY[0x263F3F9E8] messageWithKind:4102];
        [v22 send:v23 inReplyTo:v155 error:0];
        goto LABEL_52;
      case 4103:
        if (![(DYReplayController *)self _handleArchiveLoadingForPlaybackRequest:v155 replyKind:4105])goto LABEL_54; {
        v101 = [(DYReplayController *)self transport];
        }
        v102 = (void *)MEMORY[0x263F3F9E8];
        v103 = [NSNumber numberWithBool:1];
        v104 = [v102 messageWithKind:4105 objectPayload:v103];
        [v101 send:v104 inReplyTo:v155 error:0];

        [(DYReplayController *)self _beginDebugArchive];
        id v82 = v155;
LABEL_44:
        [(DYReplayController *)self setReplayMessage:v82];
        goto LABEL_54;
      case 4104:
        [(DYReplayController *)self _endPlayback];
        id v82 = 0;
        goto LABEL_44;
      case 4106:
        v92 = [(DYReplayController *)self replayControllerSupport];
        v93 = [(DYReplayController *)self playbackEngine];
        int v94 = [v92 isDebugPlaybackEngine:v93];

        if (v94)
        {
          v95 = [(DYReplayController *)self transport];
          v96 = (void *)MEMORY[0x263F3F9E8];
          v97 = [NSNumber numberWithBool:1];
          v98 = [v96 messageWithKind:4105 objectPayload:v97];
          [v95 send:v98 inReplyTo:v155 error:0];

          v99 = [v155 objectPayload];
          unint64_t v100 = [v99 unsignedLongLongValue];

          v22 = [(DYReplayController *)self playbackEngine];
          [v22 playbackToFunction:v100 subCommandIndex:HIDWORD(v100) withLoops:0];
          goto LABEL_53;
        }
        v22 = [(DYReplayController *)self transport];
        v127 = (void *)MEMORY[0x263F3F9E8];
        uint64_t v23 = [NSNumber numberWithBool:0];
        v71 = [v127 messageWithKind:4105 objectPayload:v23];
        [v22 send:v71 inReplyTo:v155 error:0];
        goto LABEL_51;
      case 4107:
        v113 = [(DYReplayController *)self transport];
        v114 = (void *)MEMORY[0x263F3F9E8];
        v115 = [NSNumber numberWithBool:1];
        v116 = [v114 messageWithKind:4105 objectPayload:v115];
        [v113 send:v116 inReplyTo:v155 error:0];

        v117 = [(DYReplayController *)self replayControllerSupport];
        v118 = [v155 objectPayload];
        uint64_t v119 = [v118 BOOLValue];
        v120 = [(DYReplayController *)self playbackEngine];
        [v117 enableDebugWireframePresent:v119 playbackEngine:v120];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4108:
        v105 = [(DYReplayController *)self transport];
        v106 = (void *)MEMORY[0x263F3F9E8];
        v107 = [NSNumber numberWithBool:1];
        v108 = [v106 messageWithKind:4105 objectPayload:v107];
        [v105 send:v108 inReplyTo:v155 error:0];

        v109 = [(DYReplayController *)self replayControllerSupport];
        v110 = [v155 objectPayload];
        uint64_t v111 = [v110 BOOLValue];
        v112 = [(DYReplayController *)self playbackEngine];
        [v109 enableDebugDrawCallPresent:v111 playbackEngine:v112];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4109:
        v44 = [(DYReplayController *)self transport];
        v45 = (void *)MEMORY[0x263F3F9E8];
        v46 = [NSNumber numberWithBool:1];
        v47 = [v45 messageWithKind:4105 objectPayload:v46];
        [v44 send:v47 inReplyTo:v155 error:0];

        v48 = [(DYReplayController *)self replayControllerSupport];
        v49 = [v155 objectPayload];
        [v49 floatValue];
        int v51 = v50;
        v52 = [(DYReplayController *)self playbackEngine];
        LODWORD(v53) = v51;
        [v48 setDebugWireframeLineWidth:v52 playbackEngine:v53];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4110:
        v54 = [(DYReplayController *)self transport];
        v55 = (void *)MEMORY[0x263F3F9E8];
        v56 = [NSNumber numberWithBool:1];
        v57 = [v55 messageWithKind:4105 objectPayload:v56];
        [v54 send:v57 inReplyTo:v155 error:0];

        v58 = [(DYReplayController *)self replayControllerSupport];
        v59 = [v155 objectPayload];
        uint64_t v60 = [v59 unsignedIntValue];
        v61 = [(DYReplayController *)self playbackEngine];
        [v58 setWireframeLineColor:v60 playbackEngine:v61];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4111:
        v62 = [(DYReplayController *)self transport];
        v63 = (void *)MEMORY[0x263F3F9E8];
        v64 = [NSNumber numberWithBool:1];
        v65 = [v63 messageWithKind:4105 objectPayload:v64];
        [v62 send:v65 inReplyTo:v155 error:0];

        v66 = [(DYReplayController *)self replayControllerSupport];
        v67 = [v155 objectPayload];
        v68 = [(DYReplayController *)self playbackEngine];
        [v66 disableDebugFunctions:v67 playbackEngine:v68];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4112:
        v83 = [(DYReplayController *)self transport];
        v84 = (void *)MEMORY[0x263F3F9E8];
        v85 = [NSNumber numberWithBool:1];
        v86 = [v84 messageWithKind:4105 objectPayload:v85];
        [v83 send:v86 inReplyTo:v155 error:0];

        v87 = [(DYReplayController *)self replayControllerSupport];
        v88 = [v155 objectPayload];
        v89 = [(DYReplayController *)self playbackEngine];
        [v87 enableDebugFunctions:v88 playbackEngine:v89];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4114:
        v69 = [(DYReplayController *)self replayMessage];

        if (!v69)
        {
          v128 = [v155 plistPayload];
          id v174 = 0;
          BOOL v129 = [(DYReplayController *)self _loadArchives:v128 error:&v174];
          id v130 = v174;

          v131 = [(DYReplayController *)self transport];
          v132 = (void *)MEMORY[0x263F3F9E8];
          v133 = DYDictionaryFromError();
          v134 = [NSNumber numberWithBool:v129];
          v135 = [v132 messageWithKind:4114 attributes:v133 objectPayload:v134];
          [v131 send:v135 inReplyTo:v155 error:0];

          goto LABEL_54;
        }
        v22 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:2048 userInfo:0];
        uint64_t v23 = [(DYReplayController *)self transport];
        v70 = (void *)MEMORY[0x263F3F9E8];
        v71 = DYDictionaryFromError();
        v72 = [NSNumber numberWithBool:0];
        v73 = [v70 messageWithKind:4100 attributes:v71 objectPayload:v72];
        [v23 send:v73 inReplyTo:v155 error:0];

LABEL_51:
LABEL_52:

        break;
      case 4115:
        v158 = objc_opt_new();
        v26 = [(DYReplayController *)self archiveStack];
        objc_super v27 = [v26 allObjects];

        long long v172 = 0u;
        long long v173 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        id obja = v27;
        uint64_t v28 = [obja countByEnumeratingWithState:&v170 objects:v175 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v171;
          CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v171 != v29) {
                objc_enumerationMutation(obja);
              }
              v32 = *(void **)(*((void *)&v170 + 1) + 8 * i);
              v33 = (__CFString *)CFUUIDCreateString(v30, (CFUUIDRef)[v32 uuid]);
              if (!v33) {
                __assert_rtn("-[DYReplayController _processMessage:]", ", 0, "uuidString"");
              }
              id v34 = objc_alloc(NSDictionary);
              v35 = [v32 path];
              v36 = [v35 lastPathComponent];
              v37 = objc_msgSend(v34, "initWithObjectsAndKeys:", v36, @"filename", v33, @"uuid", 0);

              [v158 addObject:v37];
            }
            uint64_t v28 = [obja countByEnumeratingWithState:&v170 objects:v175 count:16];
          }
          while (v28);
        }

        v38 = [(DYReplayController *)v154 transport];
        v39 = [MEMORY[0x263F3F9E8] messageWithKind:4115 attributes:0 plistPayload:v158];
        [v38 send:v39 inReplyTo:v155 error:0];

        goto LABEL_54;
      case 4116:
        v90 = (void *)MEMORY[0x263F3F9E8];
        v91 = [(DYReplayController *)self _archiveDirectory];
        v22 = [v90 messageWithKind:4116 attributes:0 stringPayload:v91];

        uint64_t v23 = [(DYReplayController *)self transport];
        [v23 send:v22 inReplyTo:v155 error:0];
        goto LABEL_52;
      case 4119:
        v42 = [(DYReplayController *)self replayControllerSupport];
        v43 = [(DYReplayController *)self playbackEngine];
        v166[0] = MEMORY[0x263EF8330];
        v166[1] = 3221225472;
        v166[2] = __38__DYReplayController__processMessage___block_invoke;
        v166[3] = &unk_265339600;
        v166[4] = self;
        id v167 = v155;
        [v42 generateThumbnailsWithPlaybackEngine:v43 forMessage:v167 onReady:v166];

        goto LABEL_54;
      case 4120:
        v40 = [(DYReplayController *)self replayControllerSupport];
        v41 = [(DYReplayController *)self playbackEngine];
        v162[0] = MEMORY[0x263EF8330];
        v162[1] = 3221225472;
        v162[2] = __38__DYReplayController__processMessage___block_invoke_3;
        v162[3] = &unk_265339600;
        v162[4] = self;
        id v163 = v155;
        [v40 generateDependencyGraphThumbnailsWithPlaybackEngine:v41 forMessage:v163 onReady:v162];

        goto LABEL_54;
      case 4121:
        goto LABEL_11;
      case 4122:
        v74 = [(DYReplayController *)self transport];
        v75 = (void *)MEMORY[0x263F3F9E8];
        v76 = [NSNumber numberWithBool:1];
        v77 = [v75 messageWithKind:4105 objectPayload:v76];
        [v74 send:v77 inReplyTo:v155 error:0];

        v78 = [(DYReplayController *)self replayControllerSupport];
        v79 = [v155 objectPayload];
        uint64_t v80 = [v79 BOOLValue];
        v81 = [(DYReplayController *)self playbackEngine];
        [v78 enableDebugOutlinePresent:v80 playbackEngine:v81];

        v22 = [(DYReplayController *)self playbackEngine];
        uint64_t v23 = [(DYReplayController *)self playbackEngine];
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4126:
        v24 = [(DYReplayController *)self replayControllerSupport];
        v25 = [(DYReplayController *)self playbackEngine];
        v160[0] = MEMORY[0x263EF8330];
        v160[1] = 3221225472;
        v160[2] = __38__DYReplayController__processMessage___block_invoke_4;
        v160[3] = &unk_265339600;
        v160[4] = self;
        id v161 = v155;
        [v24 generatePixelHistoryWithPlaybackEngine:v25 forMessage:v161 onReady:v160];

        goto LABEL_54;
      default:
        if (v4 != 4611) {
          goto LABEL_49;
        }
        v22 = [(DYReplayController *)self transport];
        uint64_t v23 = [MEMORY[0x263F3F9E8] messageWithKind:4611];
        [v22 send:v23 inReplyTo:v155 error:0];
        goto LABEL_52;
    }
    goto LABEL_53;
  }
  if (v4 == 1026)
  {
LABEL_11:
    BOOL v15 = [v155 attributes];
    id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F3FEC0]];
    unint64_t v17 = [v16 unsignedLongLongValue];

    if (v17 != -1)
    {
      id v18 = [(DYReplayController *)self playbackEngine];
      unint64_t v19 = HIDWORD(v17);
      if ([v18 currentFunctionIndex] == v17)
      {
        v20 = [(DYReplayController *)self playbackEngine];
        int v21 = [v20 targetSubCommandIndex];

        if (v21 == HIDWORD(v17)) {
          goto LABEL_49;
        }
      }
      else
      {
      }
      v121 = [(DYReplayController *)self playbackEngine];
      [v121 setTargetFunctionIndex:v17];

      v122 = [(DYReplayController *)self playbackEngine];
      [v122 setTargetSubCommandIndex:v19];

      v123 = [(DYReplayController *)self playbackEngine];
      v124 = [(DYReplayController *)self playbackEngine];
      uint64_t v125 = [v124 targetFunctionIndex];
      v126 = [(DYReplayController *)self playbackEngine];
      objc_msgSend(v123, "playbackToFunction:subCommandIndex:withLoops:", v125, objc_msgSend(v126, "targetSubCommandIndex"), 0);
    }
LABEL_49:
    v22 = [(DYReplayController *)self origSourceMessageHandler];
    ((void (**)(void, id))v22)[2](v22, v155);
LABEL_53:

    goto LABEL_54;
  }
  if (v4 != 1030) {
    goto LABEL_49;
  }
  uint64_t v13 = [(DYReplayController *)self replayControllerSupport];
  id v14 = [(DYReplayController *)self playbackEngine];
  v164[0] = MEMORY[0x263EF8330];
  v164[1] = 3221225472;
  v164[2] = __38__DYReplayController__processMessage___block_invoke_2;
  v164[3] = &unk_265339600;
  v164[4] = self;
  id v165 = v155;
  [v13 generateShaderDebuggerTraceForMessage:v165 playbackEngine:v14 onReady:v164];

LABEL_54:
}

void __38__DYReplayController__processMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F3F9E8] messageWithKind:4119 objectPayload:a2];
  id v3 = [*(id *)(a1 + 32) transport];
  [v3 send:v4 inReplyTo:*(void *)(a1 + 40) error:0];
}

void __38__DYReplayController__processMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F3F9E8] messageWithKind:1030 objectPayload:a2];
  id v3 = [*(id *)(a1 + 32) transport];
  [v3 send:v4 inReplyTo:*(void *)(a1 + 40) error:0];
}

void __38__DYReplayController__processMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F3F9E8] messageWithKind:4120 objectPayload:a2];
  id v3 = [*(id *)(a1 + 32) transport];
  [v3 send:v4 inReplyTo:*(void *)(a1 + 40) error:0];
}

void __38__DYReplayController__processMessage___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F3F9E8] messageWithKind:4126 objectPayload:a2];
  id v3 = [*(id *)(a1 + 32) transport];
  [v3 send:v4 inReplyTo:*(void *)(a1 + 40) error:0];
}

- (void)_displayPlaybackEngine
{
}

- (id)_archiveDirectory
{
  return 0;
}

- (id)_replayerControllerSupportForCaptureStore:(id)a3
{
  return 0;
}

- (BOOL)_loadArchives:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[DYReplayController _loadArchives:error:]", ", 0, "filenames"");
  }
  id v7 = [(DYReplayController *)self archiveStack];
  [v7 close];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v20 = v6;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAbsolutePath", v20))
        {
          id v12 = v11;
        }
        else
        {
          uint64_t v13 = [(DYReplayController *)self _archiveDirectory];
          id v12 = [v13 stringByAppendingPathComponent:v11];
        }
        id v14 = objc_alloc(MEMORY[0x263F3F950]);
        BOOL v15 = [NSURL fileURLWithPath:v12];
        id v16 = (void *)[v14 initWithURL:v15 options:0 error:a4];

        if (!v16)
        {

          BOOL v18 = 0;
          goto LABEL_15;
        }
        unint64_t v17 = [(DYReplayController *)self archiveStack];
        [v17 push:v16];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (void)_deleteAllArchives
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(DYReplayController *)self replayMessage];

  if (!v3)
  {
    id v4 = [(DYReplayController *)self archiveStack];
    [v4 close];
  }
  uint64_t v5 = objc_opt_new();
  id v6 = NSURL;
  id v7 = [(DYReplayController *)self _archiveDirectory];
  uint64_t v8 = [v6 fileURLWithPath:v7];

  [v5 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "pathExtension", (void)v16);
        BOOL v15 = [v14 caseInsensitiveCompare:@"gputrace"] == 0;

        if (v15) {
          [v5 removeItemAtURL:v13 error:0];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_endPlayback
{
  id v3 = [(DYReplayController *)self replayControllerSupport];
  [v3 endPlayback];

  [(DYReplayController *)self setPlaybackEngine:0];
}

- (BOOL)_handleArchiveLoadingForPlaybackRequest:(id)a3 replyKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(DYReplayController *)self replayMessage];

  if (!v7)
  {
    BOOL v15 = [v6 stringPayload];
    if (v15)
    {
      long long v16 = [MEMORY[0x263EFF8C0] arrayWithObject:v15];
      id v30 = 0;
      BOOL v17 = [(DYReplayController *)self _loadArchives:v16 error:&v30];
      id v8 = v30;

      if (!v17)
      {
        long long v18 = (void *)MEMORY[0x263F3F9E8];
        long long v19 = DYDictionaryFromError();
        id v20 = [NSNumber numberWithBool:0];
        uint64_t v21 = [v18 messageWithKind:v4 attributes:v19 objectPayload:v20];

        long long v22 = [(DYReplayController *)self transport];
        [v22 send:v21 inReplyTo:v6 error:0];
        goto LABEL_10;
      }
    }
    else
    {
      id v8 = 0;
    }
    long long v23 = [(DYReplayController *)self archiveStack];
    uint64_t v24 = [v23 size];

    if (v24)
    {
      BOOL v14 = 1;
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v25 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:2049 userInfo:0];

    v26 = (void *)MEMORY[0x263F3F9E8];
    uint64_t v27 = DYDictionaryFromError();
    uint64_t v28 = [NSNumber numberWithBool:0];
    uint64_t v21 = [v26 messageWithKind:v4 attributes:v27 objectPayload:v28];

    long long v22 = [(DYReplayController *)self transport];
    [v22 send:v21 inReplyTo:v6 error:0];
    id v8 = (id)v25;
LABEL_10:

    BOOL v14 = 0;
    goto LABEL_11;
  }
  id v8 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:2048 userInfo:0];
  id v9 = (void *)MEMORY[0x263F3F9E8];
  uint64_t v10 = DYDictionaryFromError();
  uint64_t v11 = [NSNumber numberWithBool:0];
  id v12 = [v9 messageWithKind:v4 attributes:v10 objectPayload:v11];

  uint64_t v13 = [(DYReplayController *)self transport];
  [v13 send:v12 inReplyTo:v6 error:0];

  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (id)_playbackCurrentArchiveAndExperiments
{
  id v3 = [(DYReplayController *)self archiveStack];
  if ([v3 empty]) {
    __assert_rtn("-[DYReplayController _playbackCurrentArchiveAndExperiments]", ", 0, "![self.archiveStack empty]"");
  }

  uint64_t v4 = [MEMORY[0x263F3F9D0] future];
  uint64_t v5 = [(DYReplayController *)self experiments];

  if (v5) {
    [(DYReplayController *)self _recursivePlaybackWithFuture:0 usingExperiment:0 withToplevelFuture:v4];
  }
  else {
    [(DYReplayController *)self _playbackArchiveWithExperiment:0 passingFuture:v4 resolvingFuture:1];
  }
  return v4;
}

- (void)_recursivePlaybackWithFuture:(id)a3 usingExperiment:(id)a4 withToplevelFuture:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [(DYReplayController *)self experiments];
    [v10 removeObjectAtIndex:0];
  }
  uint64_t v11 = [(DYReplayController *)self experiments];
  if ([v11 count])
  {
    id v12 = [(DYReplayController *)self experiments];
    uint64_t v13 = [v12 objectAtIndex:0];

    BOOL v14 = (void *)v13;
  }
  else
  {
    id v12 = v8;
    BOOL v14 = 0;
  }

  if (v17)
  {
    char v15 = [v17 BOOLResult];
    if (!v14) {
      goto LABEL_12;
    }
  }
  else
  {
    char v15 = 1;
    if (!v14) {
      goto LABEL_12;
    }
  }
  if (v15)
  {
    [(DYReplayController *)self _playbackArchiveWithExperiment:v14 passingFuture:v9 resolvingFuture:0];
    goto LABEL_13;
  }
LABEL_12:
  long long v16 = [NSNumber numberWithBool:1];
  [v9 setResult:v16];

LABEL_13:
}

- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(DYReplayController *)self archiveStack];
  if ([v10 empty]) {
    __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]", ", 0, "![self.archiveStack empty]"");
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke;
  block[3] = &unk_2653395D8;
  block[4] = self;
  id v11 = v8;
  id v30 = v11;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v12 = [(DYReplayController *)self replayControllerSupport];
  uint64_t v13 = [(DYReplayController *)self playbackEngine];
  BOOL v14 = [v12 experimentResultsGeneratorForPlaybackEngine:v13];

  [v14 begin];
  char v15 = [(DYReplayController *)self playbackEngine];
  long long v16 = [v15 playback];

  id v17 = [(DYReplayController *)self queue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke_2;
  v22[3] = &unk_265339628;
  id v18 = v14;
  id v23 = v18;
  id v19 = v11;
  id v24 = v19;
  uint64_t v25 = self;
  BOOL v28 = a5;
  id v20 = v9;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  [v21 notifyOnQueue:v17 handler:v22];
}

uint64_t __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 archiveStack];
  uint64_t v4 = [v2 _replayerControllerSupportForCaptureStore:v3];
  [*(id *)(a1 + 32) setReplayControllerSupport:v4];

  uint64_t v5 = [*(id *)(a1 + 32) replayControllerSupport];
  id v6 = [*(id *)(a1 + 32) archiveStack];
  id v7 = [v5 createOverridingPlaybackEngineWithCaptureStore:v6 experiment:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPlaybackEngine:v7];

  id v8 = *(void **)(a1 + 32);
  return [v8 _displayPlaybackEngine];
}

uint64_t __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 end];
    id v3 = [MEMORY[0x263F3F9E8] messageWithKind:4099 objectPayload:*(void *)(a1 + 40)];
    if (!v3) {
      __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]_block_invoke_2", ", 0, "result_message"");
    }
    uint64_t v4 = [*(id *)(a1 + 48) replayMessage];
    if (!v4) {
      __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]_block_invoke_2", ", 0, "self.replayMessage"");
    }

    uint64_t v5 = [*(id *)(a1 + 48) transport];
    id v6 = [*(id *)(a1 + 48) replayMessage];
    [v5 send:v3 inReplyTo:v6 error:0];
  }
  [*(id *)(a1 + 48) _endPlayback];
  if (*(unsigned char *)(a1 + 72))
  {
    id v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    return [v7 resolveWithFuture:v8];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    return [v10 _recursivePlaybackWithFuture:v12 usingExperiment:v11 withToplevelFuture:v13];
  }
}

- (void)_beginDebugArchive
{
  id v3 = [(DYReplayController *)self archiveStack];
  if ([v3 empty]) {
    __assert_rtn("-[DYReplayController _beginDebugArchive]", ", 0, "![self.archiveStack empty]"");
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__DYReplayController__beginDebugArchive__block_invoke;
  block[3] = &unk_2653392C8;
  block[4] = self;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __40__DYReplayController__beginDebugArchive__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 archiveStack];
  uint64_t v4 = [v2 _replayerControllerSupportForCaptureStore:v3];
  [*(id *)(a1 + 32) setReplayControllerSupport:v4];

  uint64_t v5 = [*(id *)(a1 + 32) replayControllerSupport];
  id v6 = [*(id *)(a1 + 32) archiveStack];
  id v7 = [v5 createDebugPlaybackEngineWithCaptureStore:v6];
  [*(id *)(a1 + 32) setPlaybackEngine:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 _displayPlaybackEngine];
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
}

- (DYTransport)transport
{
  return self->transport;
}

- (void)setTransport:(id)a3
{
}

- (DYTransportSource)source
{
  return self->source;
}

- (void)setSource:(id)a3
{
}

- (DYTransportMessage)replayMessage
{
  return self->replayMessage;
}

- (void)setReplayMessage:(id)a3
{
}

- (id)origSourceMessageHandler
{
  return self->origSourceMessageHandler;
}

- (void)setOrigSourceMessageHandler:(id)a3
{
}

- (DYCaptureArchiveStack)archiveStack
{
  return self->archiveStack;
}

- (void)setArchiveStack:(id)a3
{
}

- (DYPlaybackEngine)playbackEngine
{
  return self->playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (DYReplayControllerSupport)replayControllerSupport
{
  return self->replayControllerSupport;
}

- (void)setReplayControllerSupport:(id)a3
{
}

- (NSMutableArray)experiments
{
  return self->experiments;
}

- (void)setExperiments:(id)a3
{
}

- (NSMutableDictionary)profileInfo
{
  return self->profileInfo;
}

- (void)setProfileInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileInfo, 0);
  objc_storeStrong((id *)&self->experiments, 0);
  objc_storeStrong((id *)&self->replayControllerSupport, 0);
  objc_storeStrong((id *)&self->playbackEngine, 0);
  objc_storeStrong((id *)&self->archiveStack, 0);
  objc_storeStrong(&self->origSourceMessageHandler, 0);
  objc_storeStrong((id *)&self->replayMessage, 0);
  objc_storeStrong((id *)&self->source, 0);
  objc_storeStrong((id *)&self->transport, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->_profileBlockBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_profileBlockQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_messageLock, 0);
}

@end