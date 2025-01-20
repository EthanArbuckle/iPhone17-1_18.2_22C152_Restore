@interface AXMVisionEngine
+ (BOOL)supportsSecureCoding;
- (AXMSequenceRequestManager)sequenceRequestManager;
- (AXMService)axMediaUtilsService;
- (AXMTaskDispatcher)taskDispatcher;
- (AXMVisionEngine)initWithCoder:(id)a3;
- (AXMVisionEngine)initWithIdentifier:(id)a3;
- (AXMVisionEngineCache)cache;
- (BOOL)_queue_activeEvaluationNodesExclusivelyUseVisionFramework:(id)a3;
- (BOOL)_queue_nodeIdentifierExists:(id)a3;
- (BOOL)_queue_shouldContinueWithoutResultHandlers:(id)a3;
- (BOOL)_queue_shouldEvaluateNode:(id)a3 withOptions:(id)a4;
- (BOOL)areDiagnosticsEnabled;
- (BOOL)canAddEvaluationNode:(id)a3;
- (BOOL)canAddEvaluationNodeClass:(Class)a3;
- (BOOL)canAddSourceNode:(id)a3;
- (BOOL)canAddSourceNodeClass:(Class)a3;
- (BOOL)disableResultLogging;
- (BOOL)engineWillAcceptTiggerWithSource:(id)a3;
- (BOOL)imageRegistrationFilteringEnabled;
- (BOOL)isCachingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEngine:(id)a3;
- (BOOL)nodeIdentifierExists:(id)a3;
- (BOOL)prioritySchedulingAllowMultipleNodeExecution;
- (BOOL)prioritySchedulingEnabled;
- (NSArray)evaluationNodes;
- (NSArray)sourceNodes;
- (NSString)identifier;
- (id)_queue_activeEvaluationNodesForOptions:(id)a3 applyPriorityScheduling:(BOOL)a4 prioritySchedulingAllowMultipleNodeExecution:(BOOL)a5;
- (id)_queue_evaluationNodeWithIdentifier:(id)a3;
- (id)_queue_makeUniqueIdentifierForNode:(Class)a3;
- (id)_queue_sourceNodeWithIdentifier:(id)a3;
- (id)axmDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)evaluationNodeWithIdentifier:(id)a3;
- (id)makeUniqueIdentifierForNode:(Class)a3;
- (id)resultHandlers;
- (id)sourceNodeWithIdentifier:(id)a3;
- (int64_t)cacheSize;
- (int64_t)maximumQueueSize;
- (int64_t)minimumImageRegistrationSignalLevel;
- (unint64_t)hash;
- (unint64_t)thresholdPriority;
- (void)_commonInit;
- (void)_invokeFullQueueResultHandlersForContext:(id)a3;
- (void)_invokeResultHandlers:(id)a3 withError:(id)a4;
- (void)_invokeResultHandlers:(id)a3 withResult:(id)a4;
- (void)_queue_addResultHandler:(id)a3;
- (void)_queue_evaluateWithSource:(id)a3 context:(id)a4;
- (void)_queue_handleEvaluatedContext:(id)a3 result:(id)a4 error:(id)a5;
- (void)_queue_logEvaluatedResult:(id)a3;
- (void)_queue_remotelyEvaluateWithSource:(id)a3 context:(id)a4;
- (void)_queue_removeAllResultHandlers;
- (void)_queue_removeResultHandler:(id)a3;
- (void)addEvaluationNode:(id)a3;
- (void)addResultHandler:(id)a3;
- (void)addSourceNode:(id)a3;
- (void)addSourceNodes:(id)a3 evaluationNodes:(id)a4;
- (void)axMediaUtilitiesService:(id)a3 eventOccurred:(int64_t)a4;
- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4;
- (void)disableResultCaching;
- (void)dispatcher:(id)a3 handleTask:(id)a4;
- (void)enableResultCachingWithCacheSize:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)insertEvaluationNode:(id)a3 atIndex:(int64_t)a4;
- (void)insertSourceNode:(id)a3 atIndex:(int64_t)a4;
- (void)prewarmEngine;
- (void)purgeResources:(id)a3;
- (void)removeAllEvaluationNodes;
- (void)removeAllResultHandlers;
- (void)removeAllSourceNodes;
- (void)removeEvaluationNode:(id)a3;
- (void)removeResultHandler:(id)a3;
- (void)removeSourceNode:(id)a3;
- (void)setAxMediaUtilsService:(id)a3;
- (void)setCache:(id)a3;
- (void)setDiagnosticsEnabled:(BOOL)a3;
- (void)setDisableResultLogging:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageRegistrationFilteringEnabled:(BOOL)a3;
- (void)setMaximumQueueSize:(int64_t)a3;
- (void)setMinimumImageRegistrationSignalLevel:(int64_t)a3;
- (void)setPrioritySchedulingAllowMultipleNodeExecution:(BOOL)a3;
- (void)setPrioritySchedulingEnabled:(BOOL)a3;
- (void)setSequenceRequestManager:(id)a3;
- (void)setTaskDispatcher:(id)a3;
- (void)setThresholdPriority:(unint64_t)a3;
- (void)triggerWithSource:(id)a3 context:(id)a4;
- (void)updateEngineConfiguration:(id)a3;
@end

@implementation AXMVisionEngine

- (AXMVisionEngine)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMVisionEngine;
  v5 = [(AXMVisionEngine *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(AXMVisionEngine *)v5 _commonInit];
    [(AXMVisionEngine *)v6 setIdentifier:v4];
  }

  return v6;
}

- (void)_commonInit
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("AXMVisionEngine", v3);
  queue = self->_queue;
  self->_queue = v4;

  v6 = [MEMORY[0x1E4F1CA48] array];
  queue_sourceNodes = self->_queue_sourceNodes;
  self->_queue_sourceNodes = v6;

  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  queue_evaluationNodes = self->_queue_evaluationNodes;
  self->_queue_evaluationNodes = v8;

  v10 = [MEMORY[0x1E4F1CA48] array];
  queue_resultHandlers = self->_queue_resultHandlers;
  self->_queue_resultHandlers = v10;

  v12 = [(AXMVisionEngineNode *)[AXMImageRegistrationNode alloc] initWithIdentifier:@"AXMImgRegistration"];
  queue_imageRegistrationNode = self->_queue_imageRegistrationNode;
  self->_queue_imageRegistrationNode = v12;

  if ((AXMIsRunningInServiceProcess() & 1) == 0)
  {
    v14 = objc_alloc_init(AXMService);
    [(AXMVisionEngine *)self setAxMediaUtilsService:v14];

    v15 = [(AXMVisionEngine *)self axMediaUtilsService];
    [v15 setDelegate:self];
  }
  *(_OWORD *)&self->_maximumQueueSize = xmmword_1B58AC900;
  v16 = [[AXMTaskDispatcher alloc] initWithIdentifier:@"AXMVisionEngine" delegate:self];
  [(AXMVisionEngine *)self setTaskDispatcher:v16];

  v17 = objc_alloc_init(AXMSequenceRequestManager);
  [(AXMVisionEngine *)self setSequenceRequestManager:v17];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXMVisionEngine *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AXMVisionEngine *)self isEqualToEngine:v4];
  }

  return v5;
}

- (BOOL)isEqualToEngine:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(AXMVisionEngine *)self identifier];
    v6 = [v4 identifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(AXMVisionEngine *)self sourceNodes];
      uint64_t v8 = [v7 count];
      v9 = [v4 sourceNodes];
      if (v8 == [v9 count])
      {
        v10 = [(AXMVisionEngine *)self evaluationNodes];
        uint64_t v11 = [v10 count];
        v12 = [v4 evaluationNodes];
        BOOL v13 = v11 == [v12 count];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(AXMVisionEngine *)self identifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(AXMVisionEngine *)self sourceNodes];
  uint64_t v6 = [v5 count] ^ v4;
  v7 = [(AXMVisionEngine *)self evaluationNodes];
  unint64_t v8 = v6 ^ [v7 count];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionEngine)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AXMVisionEngine;
  BOOL v5 = [(AXMVisionEngine *)&v29 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(AXMVisionEngine *)v5 _commonInit];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    [(AXMVisionEngine *)v6 setIdentifier:v7];

    -[AXMVisionEngine setMaximumQueueSize:](v6, "setMaximumQueueSize:", [v4 decodeIntegerForKey:@"QueueSize"]);
    -[AXMVisionEngine setDiagnosticsEnabled:](v6, "setDiagnosticsEnabled:", [v4 decodeBoolForKey:@"diagnosticsEnabled"]);
    -[AXMVisionEngine setPrioritySchedulingEnabled:](v6, "setPrioritySchedulingEnabled:", [v4 decodeBoolForKey:@"prioritySchedulingEnabled"]);
    -[AXMVisionEngine setPrioritySchedulingAllowMultipleNodeExecution:](v6, "setPrioritySchedulingAllowMultipleNodeExecution:", [v4 decodeBoolForKey:@"prioritySchedulingAllowMultipleNodeExecution"]);
    -[AXMVisionEngine setThresholdPriority:](v6, "setThresholdPriority:", [v4 decodeIntegerForKey:@"thresholdPriority"]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v8 = AXMSecureCodingClasses();
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SourceNodes"];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          [(AXMVisionEngine *)v6 addSourceNode:*(void *)(*((void *)&v25 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v11);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = AXMSecureCodingClasses();
    v15 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, @"EvaluationNodes", 0);

    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          [(AXMVisionEngine *)v6 addEvaluationNode:*(void *)(*((void *)&v21 + 1) + 8 * v19++)];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v17);
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AXMVisionEngine *)self identifier];
  [v7 encodeObject:v4 forKey:@"Identifier"];

  BOOL v5 = [(AXMVisionEngine *)self sourceNodes];
  [v7 encodeObject:v5 forKey:@"SourceNodes"];

  uint64_t v6 = [(AXMVisionEngine *)self evaluationNodes];
  [v7 encodeObject:v6 forKey:@"EvaluationNodes"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize"), @"QueueSize");
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine areDiagnosticsEnabled](self, "areDiagnosticsEnabled"), @"diagnosticsEnabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine prioritySchedulingEnabled](self, "prioritySchedulingEnabled"), @"prioritySchedulingEnabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine prioritySchedulingAllowMultipleNodeExecution](self, "prioritySchedulingAllowMultipleNodeExecution"), @"prioritySchedulingAllowMultipleNodeExecution");
  objc_msgSend(v7, "encodeInteger:forKey:", -[AXMVisionEngine thresholdPriority](self, "thresholdPriority"), @"thresholdPriority");
}

- (BOOL)_queue_shouldContinueWithoutResultHandlers:(id)a3
{
  id v4 = a3;
  if ([(AXMVisionEngine *)self isCachingEnabled])
  {
    BOOL v5 = [v4 cacheKey];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_queue_remotelyEvaluateWithSource:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = AXMediaLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_INFO, "Queueing remote evaluation of %@", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1BA9A10B0]();
  if (self->_queue_shouldNotifyServiceOfEngineConfigChange)
  {
    self->_queue_shouldNotifyServiceOfEngineConfigChange = 0;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke;
  v14[3] = &unk_1E6117268;
  v14[4] = self;
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  uint64_t v17 = v10;
  dispatch_async(v11, v14);
}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) axMediaUtilsService];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2;
  v9[3] = &unk_1E6117240;
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  id v12 = *(id *)(a1 + 48);
  [v2 visionEngine:v4 evaluateSource:v7 context:v5 options:v6 result:v9];
}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_INFO, "Received remote evaluation for %@", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2_cold_1();
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(NSObject **)(v9 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_67;
  v13[3] = &unk_1E6117218;
  v13[4] = v9;
  id v14 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v6;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, v13);
}

uint64_t __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvaluatedContext:result:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (BOOL)_queue_shouldEvaluateNode:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 shouldEvaluate:v6]) {
    goto LABEL_43;
  }
  if ([v6 detectText])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectScenes])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectObjects])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectNSFW])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectSignificantEvents])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectModelClassifications])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectCaptions])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectFaces])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectTraits])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectHorizon])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectRectangles])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectProminentObjects])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if ([v6 detectIconClass])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_42;
    }
  }
  if [v6 detectBrailleEdges] && (objc_opt_class(), (objc_opt_isKindOfClass())
    || [v6 detectAXElements] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [v6 detectAesthetics] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [v6 detectMADCaptions] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [v6 detectMADScenes] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [v6 detectMADFace] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [v6 detectMADText] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_42:
    BOOL v7 = 1;
  }
  else
  {
LABEL_43:
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_queue_activeEvaluationNodesForOptions:(id)a3 applyPriorityScheduling:(BOOL)a4 prioritySchedulingAllowMultipleNodeExecution:(BOOL)a5
{
  BOOL v33 = a5;
  BOOL v5 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v9 = self->_queue_evaluationNodes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v14 isEnabled]
          && [(AXMVisionEngine *)self _queue_shouldEvaluateNode:v14 withOptions:v7])
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v11);
  }

  if (v5)
  {
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v15 = AXMediaLogEnginePriority();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = [(AXMVisionEngine *)self thresholdPriority];
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = v16;
      _os_log_impl(&dword_1B57D5000, v15, OS_LOG_TYPE_DEFAULT, "engine threshold priority: %ld", buf, 0xCu);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v17);
          }
          long long v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          [v23 boostEffectivePriority];
          long long v24 = AXMediaLogEnginePriority();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            long long v25 = [(id)objc_opt_class() title];
            uint64_t v26 = [v23 effectivePriority];
            *(_DWORD *)buf = 134218498;
            unint64_t v43 = (unint64_t)v23;
            __int16 v44 = 2112;
            v45 = v25;
            __int16 v46 = 2048;
            uint64_t v47 = v26;
            _os_log_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_DEFAULT, "   node <%p> :'%@'. boosted priority:%ld", buf, 0x20u);
          }
          unint64_t v27 = [v23 effectivePriority];
          if (v27 >= [(AXMVisionEngine *)self thresholdPriority])
          {
            if (v33)
            {
              [v32 addObject:v23];
            }
            else if (v20)
            {
              unint64_t v28 = [v23 effectivePriority];
              if (v28 > [v20 effectivePriority])
              {
                id v29 = v23;

                id v20 = v29;
              }
            }
            else
            {
              id v20 = v23;
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v19);

      if (!v33 && v20) {
        [v32 addObject:v20];
      }
    }
    else
    {

      id v20 = 0;
    }
    [v32 enumerateObjectsUsingBlock:&__block_literal_global_5];
    id v8 = v32;

    v30 = AXMediaLogEnginePriority();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v8;
      _os_log_impl(&dword_1B57D5000, v30, OS_LOG_TYPE_DEFAULT, "highest priority node(s): %@", buf, 0xCu);
    }
  }

  return v8;
}

uint64_t __127__AXMVisionEngine__queue_activeEvaluationNodesForOptions_applyPriorityScheduling_prioritySchedulingAllowMultipleNodeExecution___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetEffectivePriority];
}

- (void)_queue_logEvaluatedResult:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 features];

    if (v5)
    {
      id v6 = [v4 features];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        id v8 = [MEMORY[0x1E4F1CA48] array];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v9 = [v4 features];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) description];
              if (v14) {
                [v8 addObject:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
          }
          while (v11);
        }

        id v15 = AXMediaLogResults();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.4();
        }

        unint64_t v16 = AXMediaLogResults();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.6(v4);
        }

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = v8;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
              long long v23 = AXMediaLogResults();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v35 = v22;
                _os_log_debug_impl(&dword_1B57D5000, v23, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
          }
          while (v19);
        }

        long long v24 = AXMediaLogResults();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.5(v4, v24);
        }

        long long v25 = AXMediaLogResults();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.4();
        }
      }
      else
      {
        id v17 = AXMediaLogResults();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[AXMVisionEngine _queue_logEvaluatedResult:]();
        }
      }
    }
    else
    {
      id v17 = AXMediaLogResults();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[AXMVisionEngine _queue_logEvaluatedResult:]();
      }
    }
  }
  else
  {
    id v17 = AXMediaLogResults();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngine _queue_logEvaluatedResult:]();
    }
  }
}

- (BOOL)_queue_activeEvaluationNodesExclusivelyUseVisionFramework:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "requiresVisionFramework", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)_queue_evaluateWithSource:(id)a3 context:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x1BA9A10B0]();
  group = dispatch_group_create();
  if (([v7 sourceProvidesResults] & 1) == 0)
  {
    uint64_t v9 = [v7 analysisOptions];
    long long v10 = [(AXMVisionEngine *)self _queue_activeEvaluationNodesForOptions:v9 applyPriorityScheduling:[(AXMVisionEngine *)self prioritySchedulingEnabled] prioritySchedulingAllowMultipleNodeExecution:[(AXMVisionEngine *)self prioritySchedulingAllowMultipleNodeExecution]];

    if ([(AXMVisionEngine *)self prioritySchedulingEnabled]
      && !-[AXMVisionEngine prioritySchedulingAllowMultipleNodeExecution](self, "prioritySchedulingAllowMultipleNodeExecution")&& (unint64_t)[v10 count] >= 2)
    {
      long long v11 = AXMediaLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[AXMVisionEngine _queue_evaluateWithSource:context:]();
      }
    }
    if ([v10 count])
    {
      long long v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = [v7 analysisOptions];
        *(_DWORD *)buf = 138412290;
        v52 = v13;
        _os_log_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_INFO, "Will begin image evaluation. %@", buf, 0xCu);
      }
      long long v26 = v8;

      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_99;
      block[3] = &unk_1E6117218;
      id v15 = v7;
      id v46 = v15;
      uint64_t v47 = self;
      id v16 = v10;
      id v48 = v16;
      id v27 = v6;
      id v49 = v6;
      dispatch_group_async(group, queue, block);
      if ([(AXMVisionEngine *)self imageRegistrationFilteringEnabled])
      {
        id v17 = self->_queue;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_3;
        v41[3] = &unk_1E6117320;
        id v44 = &__block_literal_global_93;
        id v42 = v15;
        unint64_t v43 = self;
        dispatch_group_async(group, v17, v41);
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = v16;
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            long long v23 = self->_queue;
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4;
            v33[3] = &unk_1E6117348;
            v33[4] = self;
            id v34 = v15;
            uint64_t v35 = v22;
            id v36 = &__block_literal_global_93;
            dispatch_group_async(group, v23, v33);
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v19);
      }

      BOOL v8 = v26;
      id v6 = v27;
    }
  }
  long long v24 = self->_queue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_103;
  v30[3] = &unk_1E6116F08;
  id v25 = v7;
  id v31 = v25;
  long long v32 = self;
  dispatch_group_notify(group, v24, v30);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = AXMediaLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_cold_1();
  }

  id v7 = [v4 pipelineMetric];
  BOOL v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  long long v10 = NSStringFromClass(v9);
  long long v11 = [v8 stringWithFormat:@"Evaluate %@", v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_97;
  v14[3] = &unk_1E61172D0;
  id v15 = v4;
  id v16 = v5;
  id v12 = v5;
  id v13 = v4;
  [v7 measure:v11 execute:v14];
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) error];

  if (v4)
  {
    id v5 = AXMediaLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_97_cold_1(a1, (id *)(a1 + 32), v5);
    }
  }
  else if ([*(id *)(a1 + 40) validateVisionKitSoftLinkSymbols])
  {
    [*(id *)(a1 + 40) evaluate:*(void *)(a1 + 32) metrics:v3];
  }
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_99(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pipelineMetric];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_2;
  v6[3] = &unk_1E61172F8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v2 measure:@"Create Image" execute:v6];
}

uint64_t __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEvaluationExclusivelyUsesVisionFramework:", objc_msgSend(*(id *)(a1 + 40), "_queue_activeEvaluationNodesExclusivelyUseVisionFramework:", *(void *)(a1 + 48)));
  v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 produceImage:v3];
}

uint64_t __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], *(void *)(a1[5] + 32));
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) imageRegistrationFilteringEnabled]
    || (uint64_t v2 = [*(id *)(a1 + 40) imageRegistrationState],
        v2 >= [*(id *)(a1 + 32) minimumImageRegistrationSignalLevel]))
  {
    uint64_t v3 = AXMediaLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_2(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_1((id *)(a1 + 48));
    }

    id v5 = [*(id *)(a1 + 40) auxiliaryDetectors];
    id v6 = (void *)[v5 copy];

    while ([v6 count])
    {
      [*(id *)(a1 + 40) removeAllAuxiliaryDetectors];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      id v12 = [*(id *)(a1 + 40) auxiliaryDetectors];
      id v6 = (void *)[v12 copy];
    }
  }
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_103(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) result];
  if (([*(id *)(a1 + 40) disableResultLogging] & 1) == 0)
  {
    uint64_t v2 = AXMediaLogResults();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3) {
      objc_msgSend(*(id *)(a1 + 40), "_queue_logEvaluatedResult:", v8);
    }
  }
  uint64_t v6 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(v6 + 8);
  id v7 = [v4 error];
  objc_msgSend(v5, "_queue_handleEvaluatedContext:result:error:", v4, v8, v7);
}

- (void)_queue_handleEvaluatedContext:(id)a3 result:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 didFinishProcessingContext];
  if ([(AXMVisionEngine *)self isCachingEnabled])
  {
    uint64_t v11 = [v8 cacheKey];

    if (v11)
    {
      id v12 = [(AXMVisionEngine *)self cache];
      long long v13 = [v8 cacheKey];
      [v12 setResult:v9 forKey:v13];
    }
  }
  long long v14 = [v9 features];
  uint64_t v15 = [v14 count];

  if (v10)
  {
    long long v16 = AXMediaLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngine _queue_handleEvaluatedContext:result:error:]();
    }

    id v17 = [v8 resultHandlers];
    [(AXMVisionEngine *)self _invokeResultHandlers:v17 withError:v10];
LABEL_13:

    goto LABEL_14;
  }
  if (v15 > 0 || [v8 shouldCallCompletionHandlersForEmptyResultSet])
  {
    uint64_t v18 = AXMediaLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngine _queue_handleEvaluatedContext:result:error:]();
    }

    id v17 = [v8 resultHandlers];
    [(AXMVisionEngine *)self _invokeResultHandlers:v17 withResult:v9];
    goto LABEL_13;
  }
LABEL_14:
  [(AXMTask *)self->_queue_currentTask markAsComplete:v10 == 0];
  queue_currentTask = self->_queue_currentTask;
  self->_queue_currentTask = 0;
}

- (NSArray)sourceNodes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AXMVisionEngine_sourceNodes__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__AXMVisionEngine_sourceNodes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)canAddSourceNode:(id)a3
{
  uint64_t v3 = objc_opt_class();

  return [v3 isSupported];
}

- (BOOL)canAddSourceNodeClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(objc_class *)a3 isSupported];
}

- (void)addSourceNode:(id)a3
{
  id v4 = a3;
  if ([(AXMVisionEngine *)self canAddSourceNode:v4])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__AXMVisionEngine_addSourceNode___block_invoke;
    v7[3] = &unk_1E6116F08;
    uint64_t v8 = v4;
    id v9 = self;
    dispatch_sync(queue, v7);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = AXMediaLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionEngine addSourceNode:]();
    }
  }
}

uint64_t __33__AXMVisionEngine_addSourceNode___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isConnected])
  {
    uint64_t v2 = AXMediaLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) connect:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 40) + 16) addObject:*(void *)(a1 + 32)];
}

- (void)insertSourceNode:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(AXMVisionEngine *)self canAddSourceNode:v6])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AXMVisionEngine_insertSourceNode_atIndex___block_invoke;
    block[3] = &unk_1E6117370;
    id v10 = v6;
    id v11 = self;
    int64_t v12 = a4;
    dispatch_sync(queue, block);
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionEngine addSourceNode:]();
    }
  }
}

uint64_t __44__AXMVisionEngine_insertSourceNode_atIndex___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isConnected])
  {
    uint64_t v2 = AXMediaLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) connect:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 40) + 16) insertObject:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
}

- (void)removeSourceNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__AXMVisionEngine_removeSourceNode___block_invoke;
  v7[3] = &unk_1E6116F08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __36__AXMVisionEngine_removeSourceNode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) disconnect];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);

  return [v3 removeObject:v2];
}

- (void)removeAllSourceNodes
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AXMVisionEngine_removeAllSourceNodes__block_invoke;
  block[3] = &unk_1E6117090;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __39__AXMVisionEngine_removeAllSourceNodes__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "disconnect", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (NSArray)evaluationNodes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__0;
  long long v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AXMVisionEngine_evaluationNodes__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __34__AXMVisionEngine_evaluationNodes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)canAddEvaluationNode:(id)a3
{
  uint64_t v3 = objc_opt_class();

  return [v3 isSupported];
}

- (BOOL)canAddEvaluationNodeClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(objc_class *)a3 isSupported];
}

- (void)addEvaluationNode:(id)a3
{
  id v4 = a3;
  if ([(AXMVisionEngine *)self canAddEvaluationNode:v4])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__AXMVisionEngine_addEvaluationNode___block_invoke;
    v7[3] = &unk_1E6116F08;
    uint64_t v8 = v4;
    long long v9 = self;
    dispatch_sync(queue, v7);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = AXMediaLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMVisionEngine addEvaluationNode:]();
    }
  }
}

uint64_t __37__AXMVisionEngine_addEvaluationNode___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isConnected])
  {
    uint64_t v2 = AXMediaLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) connect:*(void *)(a1 + 40)];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 24);
  if (isKindOfClass) {
    return [v5 insertObject:v4 atIndex:0];
  }
  else {
    return [v5 addObject:v4];
  }
}

- (void)insertEvaluationNode:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(AXMVisionEngine *)self canAddEvaluationNode:v6])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AXMVisionEngine_insertEvaluationNode_atIndex___block_invoke;
    block[3] = &unk_1E6117370;
    long long v10 = v6;
    id v11 = self;
    int64_t v12 = a4;
    dispatch_sync(queue, block);
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionEngine insertEvaluationNode:atIndex:]();
    }
  }
}

uint64_t __48__AXMVisionEngine_insertEvaluationNode_atIndex___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isConnected])
  {
    uint64_t v2 = AXMediaLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) connect:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 40) + 24) insertObject:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
}

- (void)removeEvaluationNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AXMVisionEngine_removeEvaluationNode___block_invoke;
  v7[3] = &unk_1E6116F08;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __40__AXMVisionEngine_removeEvaluationNode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) disconnect];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 24);

  return [v3 removeObject:v2];
}

- (void)removeAllEvaluationNodes
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXMVisionEngine_removeAllEvaluationNodes__block_invoke;
  block[3] = &unk_1E6117090;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__AXMVisionEngine_removeAllEvaluationNodes__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "disconnect", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (void)addSourceNodes:(id)a3 evaluationNodes:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        [(AXMVisionEngine *)self addSourceNode:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
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
        -[AXMVisionEngine addEvaluationNode:](self, "addEvaluationNode:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)sourceNodeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AXMVisionEngine_sourceNodeWithIdentifier___block_invoke;
  block[3] = &unk_1E6117398;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__AXMVisionEngine_sourceNodeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_sourceNodeWithIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)evaluationNodeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AXMVisionEngine_evaluationNodeWithIdentifier___block_invoke;
  block[3] = &unk_1E6117398;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__AXMVisionEngine_evaluationNodeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_evaluationNodeWithIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_sourceNodeWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_queue_sourceNodes;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_queue_evaluationNodeWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_queue_evaluationNodes;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)makeUniqueIdentifierForNode:(Class)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  char v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AXMVisionEngine_makeUniqueIdentifierForNode___block_invoke;
  block[3] = &unk_1E61173C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__AXMVisionEngine_makeUniqueIdentifierForNode___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_makeUniqueIdentifierForNode:", *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_makeUniqueIdentifierForNode:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"AXM" withString:&stru_1F0E72D10];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"Node" withString:&stru_1F0E72D10];

  uint64_t v7 = 0;
  uint64_t v8 = 1;
  do
  {
    uint64_t v9 = v7;
    uint64_t v7 = [NSString stringWithFormat:@"%@-%ld", v6, v8];

    ++v8;
  }
  while ([(AXMVisionEngine *)self _queue_nodeIdentifierExists:v7]);

  return v7;
}

- (BOOL)nodeIdentifierExists:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXMVisionEngine_nodeIdentifierExists___block_invoke;
  block[3] = &unk_1E6117398;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __40__AXMVisionEngine_nodeIdentifierExists___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_nodeIdentifierExists:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_nodeIdentifierExists:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_queue_sourceNodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) identifier];
      char v11 = [v10 isEqualToString:v4];

      if (v11) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_queue_evaluationNodes;
  uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v5);
      }
      long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "identifier", (void)v18);
      char v16 = [v15 isEqualToString:v4];

      if (v16) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v12) = 1;
  }
LABEL_19:

  return v12;
}

- (id)resultHandlers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AXMVisionEngine_resultHandlers__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__AXMVisionEngine_resultHandlers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addResultHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__AXMVisionEngine_addResultHandler___block_invoke;
    v7[3] = &unk_1E6116A50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __36__AXMVisionEngine_addResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addResultHandler:", *(void *)(a1 + 40));
}

- (void)_queue_addResultHandler:(id)a3
{
  queue_resultHandlers = self->_queue_resultHandlers;
  id v4 = (id)MEMORY[0x1BA9A1340](a3, a2);
  [(NSMutableArray *)queue_resultHandlers addObject:v4];
}

- (void)removeResultHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__AXMVisionEngine_removeResultHandler___block_invoke;
    v7[3] = &unk_1E6116A50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __39__AXMVisionEngine_removeResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeResultHandler:", *(void *)(a1 + 40));
}

- (void)_queue_removeResultHandler:(id)a3
{
  queue_resultHandlers = self->_queue_resultHandlers;
  id v4 = (id)MEMORY[0x1BA9A1340](a3, a2);
  [(NSMutableArray *)queue_resultHandlers removeObject:v4];
}

- (void)removeAllResultHandlers
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AXMVisionEngine_removeAllResultHandlers__block_invoke;
  block[3] = &unk_1E6117090;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __42__AXMVisionEngine_removeAllResultHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllResultHandlers");
}

- (void)_queue_removeAllResultHandlers
{
}

- (void)_invokeResultHandlers:(id)a3 withError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_invokeResultHandlers:(id)a3 withResult:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)isCachingEnabled
{
  uint64_t v2 = [(AXMVisionEngine *)self cache];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)cacheSize
{
  uint64_t v2 = [(AXMVisionEngine *)self cache];
  int64_t v3 = [v2 cacheSize];

  return v3;
}

- (void)enableResultCachingWithCacheSize:(int64_t)a3
{
  id v4 = [[AXMVisionEngineCache alloc] initWithCacheSize:a3];
  [(AXMVisionEngine *)self setCache:v4];
}

- (void)disableResultCaching
{
}

- (void)updateEngineConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(2, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke;
    v6[3] = &unk_1E61173E8;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_2;
  block[3] = &unk_1E6117090;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_3;
  block[3] = &unk_1E6117090;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VisionEngineConfigurationDidChange" object:*(void *)(a1 + 32)];
}

- (void)prewarmEngine
{
  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_121);
}

- (void)purgeResources:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)[&__block_literal_global_123 copy];
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__AXMVisionEngine_purgeResources___block_invoke_2;
  v7[3] = &unk_1E6116A50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __34__AXMVisionEngine_purgeResources___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) requiresVisionFramework])
        {

          uint64_t v37 = 0;
          long long v38 = &v37;
          uint64_t v39 = 0x2020000000;
          id v6 = (id *)getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr;
          uint64_t v40 = getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr;
          if (!getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr)
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_block_invoke;
            uint64_t v35 = &unk_1E6116AD8;
            id v36 = &v37;
            id v7 = (void *)VisionLibrary_3();
            id v8 = dlsym(v7, "VNRequestHandlerCleanupOption_AllPipelines");
            *(void *)(v36[1] + 24) = v8;
            getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr = *(void *)(v36[1] + 24);
            id v6 = (id *)v38[3];
          }
          _Block_object_dispose(&v37, 8);
          if (!v6) {
            goto LABEL_25;
          }
          id v9 = *v6;
          v41[0] = v9;
          uint64_t v37 = 0;
          long long v38 = &v37;
          uint64_t v39 = 0x2020000000;
          uint64_t v10 = (id *)getVNCleanupLevel_CompleteSymbolLoc_ptr;
          uint64_t v40 = getVNCleanupLevel_CompleteSymbolLoc_ptr;
          if (!getVNCleanupLevel_CompleteSymbolLoc_ptr)
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __getVNCleanupLevel_CompleteSymbolLoc_block_invoke;
            uint64_t v35 = &unk_1E6116AD8;
            id v36 = &v37;
            long long v11 = (void *)VisionLibrary_3();
            long long v12 = dlsym(v11, "VNCleanupLevel_Complete");
            *(void *)(v36[1] + 24) = v12;
            getVNCleanupLevel_CompleteSymbolLoc_ptr = *(void *)(v36[1] + 24);
            uint64_t v10 = (id *)v38[3];
          }
          _Block_object_dispose(&v37, 8);
          if (!v10) {
            goto LABEL_25;
          }
          id v13 = *v10;
          id v42 = v13;
          uint64_t v37 = 0;
          long long v38 = &v37;
          uint64_t v39 = 0x2020000000;
          long long v14 = (id *)getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr;
          uint64_t v40 = getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr;
          if (!getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr)
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_block_invoke;
            uint64_t v35 = &unk_1E6116AD8;
            id v36 = &v37;
            long long v15 = (void *)VisionLibrary_3();
            uint64_t v16 = dlsym(v15, "VNRequestHandlerCleanupOption_ImageBuffers");
            *(void *)(v36[1] + 24) = v16;
            getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr = *(void *)(v36[1] + 24);
            long long v14 = (id *)v38[3];
          }
          _Block_object_dispose(&v37, 8);
          if (!v14) {
            goto LABEL_25;
          }
          id v17 = *v14;
          v41[1] = v17;
          uint64_t v37 = 0;
          long long v38 = &v37;
          uint64_t v39 = 0x2020000000;
          long long v18 = (id *)getVNCleanupPurgeAllSymbolLoc_ptr;
          uint64_t v40 = getVNCleanupPurgeAllSymbolLoc_ptr;
          if (!getVNCleanupPurgeAllSymbolLoc_ptr)
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __getVNCleanupPurgeAllSymbolLoc_block_invoke;
            uint64_t v35 = &unk_1E6116AD8;
            id v36 = &v37;
            long long v19 = (void *)VisionLibrary_3();
            long long v20 = dlsym(v19, "VNCleanupPurgeAll");
            *(void *)(v36[1] + 24) = v20;
            getVNCleanupPurgeAllSymbolLoc_ptr = *(void *)(v36[1] + 24);
            long long v18 = (id *)v38[3];
          }
          _Block_object_dispose(&v37, 8);
          if (!v18)
          {
LABEL_25:
            __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
            __break(1u);
          }
          id v43 = *v18;
          long long v21 = (void *)MEMORY[0x1E4F1C9E8];
          id v22 = v43;
          long long v23 = [v21 dictionaryWithObjects:&v42 forKeys:v41 count:2];

          uint64_t v37 = 0;
          long long v38 = &v37;
          uint64_t v39 = 0x2050000000;
          long long v24 = (void *)getVNImageRequestHandlerClass_softClass;
          uint64_t v40 = getVNImageRequestHandlerClass_softClass;
          if (!getVNImageRequestHandlerClass_softClass)
          {
            uint64_t v32 = MEMORY[0x1E4F143A8];
            uint64_t v33 = 3221225472;
            id v34 = __getVNImageRequestHandlerClass_block_invoke;
            uint64_t v35 = &unk_1E6116AD8;
            id v36 = &v37;
            __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v32);
            long long v24 = (void *)v38[3];
          }
          id v25 = v24;
          _Block_object_dispose(&v37, 8);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __34__AXMVisionEngine_purgeResources___block_invoke_3;
          v26[3] = &unk_1E6117410;
          id v27 = *(id *)(a1 + 40);
          [v25 requestForcedCleanupWithOptions:v23 completion:v26];

          return;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v44 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __34__AXMVisionEngine_purgeResources___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)axmDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (self->_prioritySchedulingEnabled) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  int64_t maximumQueueSize = self->_maximumQueueSize;
  unint64_t thresholdPriority = self->_thresholdPriority;
  identifier = self->_identifier;
  int64_t v10 = [(AXMVisionEngine *)self cacheSize];
  if ([(AXMVisionEngine *)self areDiagnosticsEnabled]) {
    long long v11 = @"Y";
  }
  else {
    long long v11 = @"N";
  }
  long long v12 = [v3 stringWithFormat:@"%@<%p>: ID:'%@' [PriorSched:%@ threshhold:%lu] maxQueueSize:%ld cacheSize:%ld metrics:%@", v5, self, identifier, v6, thresholdPriority, maximumQueueSize, v10, v11];

  return v12;
}

- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28E78] axmIndentationString:a4];
  id v8 = [(AXMVisionEngine *)self axmDescription];
  [v6 appendFormat:@"%@%@\n", v7, v8];

  id v9 = [(AXMVisionEngine *)self sourceNodes];
  if ([v9 count])
  {
    [v6 appendFormat:@"%@Source Nodes:\n", v7];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v14++) axmAppendRecursiveDescription:v6 withIndentation:a4 + 1];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }
  }
  long long v15 = [(AXMVisionEngine *)self evaluationNodes];
  if ([v15 count])
  {
    [v6 appendFormat:@"%@Evaluation Nodes:\n", v7];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      int64_t v20 = a4 + 1;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v21++) axmAppendRecursiveDescription:v6 withIndentation:v20];
        }
        while (v18 != v21);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }
  }
}

- (void)dispatcher:(id)a3 handleTask:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AXMVisionEngine_dispatcher_handleTask___block_invoke;
  v8[3] = &unk_1E6116F08;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __41__AXMVisionEngine_dispatcher_handleTask___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = v2;
  uint64_t v4 = [v3 source];
  id v5 = [v3 context];
  id v6 = [*(id *)(a1 + 40) sequenceRequestManager];
  [v5 setSequenceRequestManager:v6];

  [v5 addResultHandlers:*(void *)(*(void *)(a1 + 40) + 40)];
  id v7 = [v5 resultHandlers];
  if ([v7 count])
  {
  }
  else
  {
    char v8 = objc_msgSend(*(id *)(a1 + 40), "_queue_shouldContinueWithoutResultHandlers:", v5);

    if ((v8 & 1) == 0)
    {
      [v3 markAsComplete:0];
      goto LABEL_13;
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (*(void *)(v9 + 56))
  {
    id v10 = AXMediaLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __41__AXMVisionEngine_dispatcher_handleTask___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(v9 + 56), v2);
  [v5 willBeginProcessingContext];
  if ([v4 shouldProcessRemotely] && (AXMIsRunningInServiceProcess() & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_remotelyEvaluateWithSource:context:", v4, v5);
  }
  else {
    objc_msgSend(*(id *)(a1 + 40), "_queue_evaluateWithSource:context:", v4, v5);
  }
LABEL_13:
}

- (void)axMediaUtilitiesService:(id)a3 eventOccurred:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AXMVisionEngine_axMediaUtilitiesService_eventOccurred___block_invoke;
  v5[3] = &unk_1E6117438;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __57__AXMVisionEngine_axMediaUtilitiesService_eventOccurred___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: event occurred: %d", (uint8_t *)v9, 8u);
  }

  if ((unint64_t)(*(void *)(a1 + 40) - 1) <= 2)
  {
    uint64_t v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: service indicated it went invalid. clearing client-side tasks", (uint8_t *)v9, 2u);
    }

    id v5 = [*(id *)(a1 + 32) taskDispatcher];
    id v6 = (id)[v5 unscheduleAllTasks];

    [*(id *)(*(void *)(a1 + 32) + 56) markAsComplete:0];
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;
  }
}

- (void)triggerWithSource:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1BA9A10B0]();
  if (v7)
  {
    if (v6)
    {
      if (([v7 sourceProvidesResults] & 1) == 0)
      {
        int64_t v9 = [(AXMVisionEngine *)self maximumQueueSize];
        uint64_t v10 = [(AXMVisionEngine *)self taskDispatcher];
        uint64_t v11 = v10;
        if (v9)
        {
          uint64_t v12 = [v10 count];
          int64_t v13 = [(AXMVisionEngine *)self maximumQueueSize];

          if (v12 >= v13)
          {
            uint64_t v14 = AXMediaLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              int64_t v35 = [(AXMVisionEngine *)self maximumQueueSize];
              _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: ignoring task since queue is full (int64_t maximumQueueSize = %ld)", buf, 0xCu);
            }

            [(AXMVisionEngine *)self _invokeFullQueueResultHandlersForContext:v7];
            goto LABEL_29;
          }
        }
        else
        {
          id v28 = v7;
          id v29 = v6;
          uint64_t v17 = [v10 unscheduleAllTasks];

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v36 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v31 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(id *)(*((void *)&v30 + 1) + 8 * i);
                long long v24 = [v23 context];
                if ([v24 sourceProvidesResults])
                {
                  long long v25 = [(AXMVisionEngine *)self taskDispatcher];
                  [v25 scheduleTask:v23];
                }
                else
                {
                  long long v26 = AXMediaLogCommon();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B57D5000, v26, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: canceling queued task to replace with newer incoming task", buf, 2u);
                  }

                  long long v25 = [v23 context];

                  [(AXMVisionEngine *)self _invokeFullQueueResultHandlersForContext:v25];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v36 count:16];
            }
            while (v20);
          }

          id v7 = v28;
          id v6 = v29;
        }
      }
      id v16 = +[_AXMVisionEngineAnalysisTask itemWithSource:v6 context:v7];
      long long v27 = [(AXMVisionEngine *)self taskDispatcher];
      [v27 scheduleTask:v16];

LABEL_28:
      goto LABEL_29;
    }
LABEL_12:
    id v16 = AXMediaLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[AXMVisionEngine triggerWithSource:context:]();
    }
    goto LABEL_28;
  }
  long long v15 = AXMediaLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[AXMVisionEngine triggerWithSource:context:]();
  }

  if (!v6) {
    goto LABEL_12;
  }
LABEL_29:
}

- (void)_invokeFullQueueResultHandlersForContext:(id)a3
{
  id v14 = a3;
  if ([v14 shouldCallCompletionHandlersForEngineBusyError])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [v14 resultHandlers];
    [v4 addObjectsFromArray:v5];

    uint64_t v12 = _AXMMakeError(1, @"Engine queue is at capacity", v6, v7, v8, v9, v10, v11, v13);
    [(AXMVisionEngine *)self _invokeResultHandlers:v4 withError:v12];
  }
}

- (BOOL)engineWillAcceptTiggerWithSource:(id)a3
{
  uint64_t v4 = [(AXMVisionEngine *)self taskDispatcher];
  uint64_t v5 = [v4 count];
  BOOL v6 = v5 < [(AXMVisionEngine *)self maximumQueueSize]
    || [(AXMVisionEngine *)self maximumQueueSize] == 0;

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)maximumQueueSize
{
  return self->_maximumQueueSize;
}

- (void)setMaximumQueueSize:(int64_t)a3
{
  self->_int64_t maximumQueueSize = a3;
}

- (BOOL)prioritySchedulingEnabled
{
  return self->_prioritySchedulingEnabled;
}

- (void)setPrioritySchedulingEnabled:(BOOL)a3
{
  self->_prioritySchedulingEnabled = a3;
}

- (BOOL)prioritySchedulingAllowMultipleNodeExecution
{
  return self->_prioritySchedulingAllowMultipleNodeExecution;
}

- (void)setPrioritySchedulingAllowMultipleNodeExecution:(BOOL)a3
{
  self->_prioritySchedulingAllowMultipleNodeExecution = a3;
}

- (unint64_t)thresholdPriority
{
  return self->_thresholdPriority;
}

- (void)setThresholdPriority:(unint64_t)a3
{
  self->_unint64_t thresholdPriority = a3;
}

- (BOOL)imageRegistrationFilteringEnabled
{
  return self->_imageRegistrationFilteringEnabled;
}

- (void)setImageRegistrationFilteringEnabled:(BOOL)a3
{
  self->_imageRegistrationFilteringEnabled = a3;
}

- (int64_t)minimumImageRegistrationSignalLevel
{
  return self->_minimumImageRegistrationSignalLevel;
}

- (void)setMinimumImageRegistrationSignalLevel:(int64_t)a3
{
  self->_minimumImageRegistrationSignalLevel = a3;
}

- (AXMVisionEngineCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (BOOL)areDiagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (BOOL)disableResultLogging
{
  return self->_disableResultLogging;
}

- (void)setDisableResultLogging:(BOOL)a3
{
  self->_disableResultLogging = a3;
}

- (AXMService)axMediaUtilsService
{
  return self->_axMediaUtilsService;
}

- (void)setAxMediaUtilsService:(id)a3
{
}

- (AXMTaskDispatcher)taskDispatcher
{
  return self->_taskDispatcher;
}

- (void)setTaskDispatcher:(id)a3
{
}

- (AXMSequenceRequestManager)sequenceRequestManager
{
  return self->_sequenceRequestManager;
}

- (void)setSequenceRequestManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, 0);
  objc_storeStrong((id *)&self->_taskDispatcher, 0);
  objc_storeStrong((id *)&self->_axMediaUtilsService, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue_currentTask, 0);
  objc_storeStrong((id *)&self->_queue_resultHandlers, 0);
  objc_storeStrong((id *)&self->_queue_imageRegistrationNode, 0);
  objc_storeStrong((id *)&self->_queue_evaluationNodes, 0);
  objc_storeStrong((id *)&self->_queue_sourceNodes, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B57D5000, v1, OS_LOG_TYPE_ERROR, "Recived error for remote evaluation: %@\nSource: %@", v2, 0x16u);
}

- (void)_queue_logEvaluatedResult:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1B57D5000, v0, v1, "Did not produce result features. Result was nil", v2, v3, v4, v5, v6);
}

- (void)_queue_logEvaluatedResult:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1B57D5000, v0, v1, "Did not produce result features. Features was nil", v2, v3, v4, v5, v6);
}

- (void)_queue_logEvaluatedResult:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1B57D5000, v0, v1, "Did not produce result features. Feature list was empty", v2, v3, v4, v5, v6);
}

- (void)_queue_logEvaluatedResult:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1B57D5000, v0, v1, "------------------------------------------------------", v2, v3, v4, v5, v6);
}

- (void)_queue_logEvaluatedResult:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 detectedFeatureDescriptionWithOptions:MEMORY[0x1E4F1CC08]];
  uint64_t v5 = [a1 detectedTextDescription];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "Resulting speakable description. [features:'%@'] [text:'%@']", v6, 0x16u);
}

- (void)_queue_logEvaluatedResult:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 features];
  [v1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "Did produce result with %lu features:", v4, v5, v6, v7, v8);
}

- (void)_queue_evaluateWithSource:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "With priority scheduling, there can be at most 1 evaluation node per cycle", v2, v3, v4, v5, v6);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_cold_1()
{
  uint64_t v0 = [(id)objc_opt_class() title];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v1, v2, "Will run detector: %@", v3, v4, v5, v6, v7);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_97_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint8_t v7 = [*a2 error];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_ERROR, "Will not run detector '%@' due to previous error set in context: %@", v8, 0x16u);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_1(id *a1)
{
  uint64_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "Finish evalute block: %@", v4, v5, v6, v7, v8);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "Start evalute block: %@", v4, v5, v6, v7, v8);
}

- (void)_queue_handleEvaluatedContext:result:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1B57D5000, v0, v1, "Invoking remote result handler for result", v2, v3, v4, v5, v6);
}

- (void)_queue_handleEvaluatedContext:result:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_DEBUG, "Invoking remote result handler for error: %@", v1, 0xCu);
}

- (void)addSourceNode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B57D5000, v0, v1, "Cannot add source node. %@", v2, v3, v4, v5, v6);
}

void __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Cannot add a node that is already connected", v2, v3, v4, v5, v6);
}

- (void)addEvaluationNode:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Cannot add evaluation node. %@", v1, 0xCu);
}

- (void)insertEvaluationNode:atIndex:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B57D5000, v0, v1, "Cannot add evaluation node. %@", v2, v3, v4, v5, v6);
}

void __41__AXMVisionEngine_dispatcher_handleTask___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Current task is not nil but we're resetting it", v2, v3, v4, v5, v6);
}

- (void)triggerWithSource:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "A source must be provided", v2, v3, v4, v5, v6);
}

- (void)triggerWithSource:context:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "A context must be provided", v2, v3, v4, v5, v6);
}

@end