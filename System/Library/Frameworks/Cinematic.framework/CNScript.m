@interface CNScript
+ (void)loadFromAsset:(AVAsset *)asset changes:(CNScriptChanges *)changes progress:(NSProgress *)progress completionHandler:(void *)completionHandler;
- (BOOL)addUserDecision:(CNDecision *)decision;
- (BOOL)removeDetectionTrack:(CNDetectionTrack *)detectionTrack;
- (BOOL)removeUserDecision:(CNDecision *)decision;
- (CMTimeRange)timeRange;
- (CMTimeRange)timeRangeOfTransitionAfterDecision:(SEL)a3;
- (CMTimeRange)timeRangeOfTransitionBeforeDecision:(SEL)a3;
- (CNDecision)decisionAfterTime:(CMTime *)time;
- (CNDecision)decisionAtTime:(CMTime *)time tolerance:(CMTime *)tolerance;
- (CNDecision)decisionBeforeTime:(CMTime *)time;
- (CNDecision)primaryDecisionAtTime:(CMTime *)time;
- (CNDecision)secondaryDecisionAtTime:(CMTime *)time;
- (CNDetectionID)addDetectionTrack:(CNDetectionTrack *)detectionTrack;
- (CNDetectionTrack)detectionTrackForDecision:(CNDecision *)decision;
- (CNDetectionTrack)detectionTrackForID:(CNDetectionID)detectionID;
- (CNScriptChanges)changes;
- (CNScriptChanges)changesTrimmedByTimeRange:(CMTimeRange *)timeRange;
- (CNScriptFrame)frameAtTime:(CMTime *)time tolerance:(CMTime *)tolerance;
- (NSArray)addedDetectionTracks;
- (NSArray)baseDecisionsInTimeRange:(CMTimeRange *)timeRange;
- (NSArray)decisionsInTimeRange:(CMTimeRange *)timeRange;
- (NSArray)framesInTimeRange:(CMTimeRange *)timeRange;
- (NSArray)userDecisionsInTimeRange:(CMTimeRange *)timeRange;
- (OS_dispatch_queue)queue;
- (PTCinematographyScript)internalScript;
- (float)fNumber;
- (id)_initWithInternalScript:(id)a3;
- (void)reloadWithChanges:(CNScriptChanges *)changes;
- (void)removeAllUserDecisions;
- (void)setFNumber:(float)fNumber;
- (void)setInternalScript:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CNScript

- (id)_initWithInternalScript:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNScript;
  v6 = [(CNScript *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalScript, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cinematic.script", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

+ (void)loadFromAsset:(AVAsset *)asset changes:(CNScriptChanges *)changes progress:(NSProgress *)progress completionHandler:(void *)completionHandler
{
  v9 = asset;
  v10 = changes;
  objc_super v11 = progress;
  v12 = completionHandler;
  id v13 = objc_alloc_init(MEMORY[0x263F5F2B8]);
  if (v11)
  {
    v14 = v11;
  }
  else
  {
    v14 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:0];
  }
  v15 = v14;
  v16 = [(CNScriptChanges *)v10 internalChanges];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke;
  v25 = &unk_26517A470;
  v17 = v15;
  v26 = v17;
  id v27 = v13;
  v28 = v9;
  id v29 = v12;
  v18 = v9;
  id v19 = v12;
  id v20 = v13;
  v21 = [v20 loadWithAsset:v18 changesDictionary:v16 completion:&v22];

  if (v21)
  {
    if (![(NSProgress *)v17 totalUnitCount]) {
      -[NSProgress setTotalUnitCount:](v17, "setTotalUnitCount:", [v21 totalUnitCount]);
    }
    [(NSProgress *)v17 addChild:v21 withPendingUnitCount:[(NSProgress *)v17 totalUnitCount]];
  }
}

void __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    id v7 = [[CNScript alloc] _initWithInternalScript:*(void *)(a1 + 40)];
    dispatch_queue_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    v9 = [v5 domain];
    int v10 = [v9 isEqual:*MEMORY[0x263F5F310]];

    if (v10 && (unint64_t v11 = [v6 code] - 2, v11 <= 3)) {
      uint64_t v12 = qword_24327ADA8[v11];
    }
    else {
      uint64_t v12 = 1;
    }
    _CNCinematicError(v12, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = _CNLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke_cold_1();
    }

    dispatch_queue_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v8();
}

- (void)reloadWithChanges:(CNScriptChanges *)changes
{
  v4 = changes;
  id v5 = [(CNScript *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__CNScript_reloadWithChanges___block_invoke;
  v7[3] = &unk_26517A498;
  v7[4] = self;
  dispatch_queue_t v8 = v4;
  v6 = v4;
  dispatch_sync(v5, v7);
}

void __30__CNScript_reloadWithChanges___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) internalScript];
  v2 = [*(id *)(a1 + 40) internalChanges];
  [v3 reloadWithChangesDictionary:v2];
}

- (CNScriptChanges)changes
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__0;
  unint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(CNScript *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __19__CNScript_changes__block_invoke;
  v6[3] = &unk_26517A4E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNScriptChanges *)v4;
}

void __19__CNScript_changes__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __19__CNScript_changes__block_invoke_2;
  v5[3] = &unk_26517A4C0;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = __19__CNScript_changes__block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __19__CNScript_changes__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) internalScript];
  uint64_t v2 = [v1 changesDictionary];

  uint64_t v3 = +[CNScriptChanges _changesFromInternal:v2];

  return v3;
}

- (CNScriptChanges)changesTrimmedByTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__CNScript_changesTrimmedByTimeRange___block_invoke;
  v9[3] = &unk_26517A538;
  v9[4] = self;
  v9[5] = &v13;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v10 = *(_OWORD *)&timeRange->start.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNScriptChanges *)v7;
}

void __38__CNScript_changesTrimmedByTimeRange___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v2;
  v6[2] = __38__CNScript_changesTrimmedByTimeRange___block_invoke_2;
  v6[3] = &unk_26517A510;
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = __38__CNScript_changesTrimmedByTimeRange___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __38__CNScript_changesTrimmedByTimeRange___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) internalScript];
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 changesDictionaryTrimmedByTimeRange:v7];

  id v5 = +[CNScriptChanges _changesFromInternal:v4];

  return v5;
}

- (CMTimeRange)timeRange
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x5010000000;
  uint64_t v13 = "";
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __21__CNScript_timeRange__block_invoke;
  v9[3] = &unk_26517A4E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  long long v6 = v11;
  long long v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->start.epoch = v7;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __21__CNScript_timeRange__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__CNScript_timeRange__block_invoke_2;
  v5[3] = &unk_26517A560;
  v5[4] = *(void *)(a1 + 32);
  __21__CNScript_timeRange__block_invoke_2((uint64_t)v5, v6);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = v6[1];
  __n128 result = (__n128)v6[2];
  *(_OWORD *)(v2 + 32) = v6[0];
  *(_OWORD *)(v2 + 48) = v4;
  *(__n128 *)(v2 + 64) = result;
  return result;
}

void __21__CNScript_timeRange__block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = [*(id *)(a1 + 32) internalScript];
  if (v3)
  {
    long long v4 = v3;
    [v3 timeRange];
    long long v3 = v4;
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
}

- (CNScriptFrame)frameAtTime:(CMTime *)time tolerance:(CMTime *)tolerance
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  long long v7 = [(CNScript *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__CNScript_frameAtTime_tolerance___block_invoke;
  v10[3] = &unk_26517A538;
  v10[4] = self;
  v10[5] = &v13;
  CMTime v11 = *time;
  CMTime v12 = *tolerance;
  dispatch_sync(v7, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNScriptFrame *)v8;
}

void __34__CNScript_frameAtTime_tolerance___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__CNScript_frameAtTime_tolerance___block_invoke_2;
  v5[3] = &unk_26517A588;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v2 = __34__CNScript_frameAtTime_tolerance___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __34__CNScript_frameAtTime_tolerance___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v3 = [v2 frameAtTime:&v8 tolerance:&v6];

  if (v3) {
    id v4 = +[CNScriptFrame _copyFrameFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)framesInTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__CNScript_framesInTimeRange___block_invoke;
  v9[3] = &unk_26517A538;
  v9[4] = self;
  v9[5] = &v13;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v10 = *(_OWORD *)&timeRange->start.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __30__CNScript_framesInTimeRange___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v2;
  v6[2] = __30__CNScript_framesInTimeRange___block_invoke_2;
  _OWORD v6[3] = &unk_26517A5B0;
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = __30__CNScript_framesInTimeRange___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __30__CNScript_framesInTimeRange___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) internalScript];
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 framesInTimeRange:v7];

  id v5 = +[CNScriptFrame _copyFramesFromInternal:v4];

  return v5;
}

- (CNDecision)decisionAtTime:(CMTime *)time tolerance:(CMTime *)tolerance
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  long long v7 = [(CNScript *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__CNScript_decisionAtTime_tolerance___block_invoke;
  v10[3] = &unk_26517A538;
  v10[4] = self;
  v10[5] = &v13;
  CMTime v11 = *time;
  CMTime v12 = *tolerance;
  dispatch_sync(v7, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNDecision *)v8;
}

void __37__CNScript_decisionAtTime_tolerance___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__CNScript_decisionAtTime_tolerance___block_invoke_2;
  v5[3] = &unk_26517A5D8;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v2 = __37__CNScript_decisionAtTime_tolerance___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __37__CNScript_decisionAtTime_tolerance___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  CMTime v10 = *(CMTime *)(a1 + 40);
  uint64_t v3 = [v2 decisionNearestTime:&v10];

  memset(&v10, 0, sizeof(v10));
  if (v3) {
    [v3 time];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTime lhs = *(CMTime *)(a1 + 40);
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v10, &time);
  CMTime lhs = v10;
  CMTime v6 = *(CMTime *)(a1 + 64);
  if (CMTimeCompare(&lhs, &v6) <= 0) {
    id v4 = +[CNDecision _copyDecisionFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)decisionsInTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__CNScript_decisionsInTimeRange___block_invoke;
  v9[3] = &unk_26517A538;
  v9[4] = self;
  v9[5] = &v13;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v10 = *(_OWORD *)&timeRange->start.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __33__CNScript_decisionsInTimeRange___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v2;
  v6[2] = __33__CNScript_decisionsInTimeRange___block_invoke_2;
  _OWORD v6[3] = &unk_26517A5B0;
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = __33__CNScript_decisionsInTimeRange___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __33__CNScript_decisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) internalScript];
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 decisionsInTimeRange:v7];

  id v5 = +[CNDecision _copyDecisionsFromInternal:v4];

  return v5;
}

- (CNDecision)decisionAfterTime:(CMTime *)time
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CNScript_decisionAfterTime___block_invoke;
  block[3] = &unk_26517A628;
  block[4] = self;
  block[5] = &v10;
  CMTime v9 = *time;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __30__CNScript_decisionAfterTime___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__CNScript_decisionAfterTime___block_invoke_2;
  v5[3] = &unk_26517A600;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v2 = __30__CNScript_decisionAfterTime___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __30__CNScript_decisionAfterTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v3 = [v2 decisionAfterTime:&v6];

  if (v3) {
    id v4 = +[CNDecision _copyDecisionFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (CNDecision)decisionBeforeTime:(CMTime *)time
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__CNScript_decisionBeforeTime___block_invoke;
  block[3] = &unk_26517A628;
  block[4] = self;
  block[5] = &v10;
  CMTime v9 = *time;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __31__CNScript_decisionBeforeTime___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__CNScript_decisionBeforeTime___block_invoke_2;
  v5[3] = &unk_26517A600;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v2 = __31__CNScript_decisionBeforeTime___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __31__CNScript_decisionBeforeTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v3 = [v2 decisionBeforeTime:&v6];

  if (v3) {
    id v4 = +[CNDecision _copyDecisionFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)userDecisionsInTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__CNScript_userDecisionsInTimeRange___block_invoke;
  v9[3] = &unk_26517A538;
  v9[4] = self;
  v9[5] = &v13;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v10 = *(_OWORD *)&timeRange->start.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __37__CNScript_userDecisionsInTimeRange___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v2;
  v6[2] = __37__CNScript_userDecisionsInTimeRange___block_invoke_2;
  _OWORD v6[3] = &unk_26517A5B0;
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = __37__CNScript_userDecisionsInTimeRange___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __37__CNScript_userDecisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) internalScript];
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 userDecisionsInTimeRange:v7];

  id v5 = +[CNDecision _copyDecisionsFromInternal:v4];

  return v5;
}

- (NSArray)baseDecisionsInTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [(CNScript *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__CNScript_baseDecisionsInTimeRange___block_invoke;
  v9[3] = &unk_26517A538;
  v9[4] = self;
  v9[5] = &v13;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v10 = *(_OWORD *)&timeRange->start.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __37__CNScript_baseDecisionsInTimeRange___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v2;
  v6[2] = __37__CNScript_baseDecisionsInTimeRange___block_invoke_2;
  _OWORD v6[3] = &unk_26517A5B0;
  v6[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = __37__CNScript_baseDecisionsInTimeRange___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __37__CNScript_baseDecisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) internalScript];
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 baseDecisionsInTimeRange:v7];

  id v5 = +[CNDecision _copyDecisionsFromInternal:v4];

  return v5;
}

- (CNDecision)primaryDecisionAtTime:(CMTime *)time
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CNScript_primaryDecisionAtTime___block_invoke;
  block[3] = &unk_26517A628;
  block[4] = self;
  block[5] = &v10;
  CMTime v9 = *time;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __34__CNScript_primaryDecisionAtTime___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__CNScript_primaryDecisionAtTime___block_invoke_2;
  v5[3] = &unk_26517A600;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v2 = __34__CNScript_primaryDecisionAtTime___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __34__CNScript_primaryDecisionAtTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v3 = [v2 primaryDecisionAtTime:&v6];

  if (v3) {
    id v4 = +[CNDecision _copyDecisionFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (CNDecision)secondaryDecisionAtTime:(CMTime *)time
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CNScript_secondaryDecisionAtTime___block_invoke;
  block[3] = &unk_26517A628;
  block[4] = self;
  block[5] = &v10;
  CMTime v9 = *time;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __36__CNScript_secondaryDecisionAtTime___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__CNScript_secondaryDecisionAtTime___block_invoke_2;
  v5[3] = &unk_26517A600;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v2 = __36__CNScript_secondaryDecisionAtTime___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __36__CNScript_secondaryDecisionAtTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v3 = [v2 secondaryDecisionAtTime:&v6];

  if (v3) {
    id v4 = +[CNDecision _copyDecisionFromInternal:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (CMTimeRange)timeRangeOfTransitionAfterDecision:(SEL)a3
{
  long long v6 = decision;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x5010000000;
  id v18 = "";
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke;
  block[3] = &unk_26517A678;
  uint64_t v13 = v6;
  long long v14 = &v15;
  block[4] = self;
  long long v8 = v6;
  dispatch_sync(v7, block);

  CMTime v9 = v16;
  long long v10 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v15, 8);
  return result;
}

__n128 __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke(void *a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2;
  _OWORD v7[3] = &unk_26517A650;
  uint64_t v2 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v2;
  ((void (*)(_OWORD *__return_ptr, void *))__47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2)(v9, v7);
  uint64_t v3 = *(_OWORD **)(a1[6] + 8);
  long long v5 = v9[1];
  long long v4 = v9[2];
  v3[2] = v9[0];
  v3[3] = v5;
  v3[4] = v4;

  return result;
}

void __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  id v5 = [*(id *)(a1 + 32) internalScript];
  long long v4 = [*(id *)(a1 + 40) internalDecision];
  if (v5)
  {
    [v5 timeRangeOfTransitionAfterDecision:v4];
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
}

- (CMTimeRange)timeRangeOfTransitionBeforeDecision:(SEL)a3
{
  long long v6 = decision;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x5010000000;
  id v18 = "";
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke;
  block[3] = &unk_26517A678;
  uint64_t v13 = v6;
  long long v14 = &v15;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(v7, block);

  CMTime v9 = v16;
  long long v10 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v15, 8);
  return result;
}

__n128 __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke(void *a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2;
  _OWORD v7[3] = &unk_26517A650;
  uint64_t v2 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v2;
  ((void (*)(_OWORD *__return_ptr, void *))__48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2)(v9, v7);
  uint64_t v3 = *(_OWORD **)(a1[6] + 8);
  long long v5 = v9[1];
  long long v4 = v9[2];
  v3[2] = v9[0];
  v3[3] = v5;
  v3[4] = v4;

  return result;
}

void __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  id v5 = [*(id *)(a1 + 32) internalScript];
  long long v4 = [*(id *)(a1 + 40) internalDecision];
  if (v5)
  {
    [v5 timeRangeOfTransitionBeforeDecision:v4];
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
}

- (NSArray)addedDetectionTracks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__0;
  long long v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(CNScript *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__CNScript_addedDetectionTracks__block_invoke;
  _OWORD v6[3] = &unk_26517A4E8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __32__CNScript_addedDetectionTracks__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__CNScript_addedDetectionTracks__block_invoke_2;
  v5[3] = &unk_26517A6A0;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = __32__CNScript_addedDetectionTracks__block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __32__CNScript_addedDetectionTracks__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "internalScript", 0);
  id v4 = [v3 tracks];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isUserCreated])
        {
          long long v10 = +[CNDetectionTrack _trackFromInternal:v9];
          [v2 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v11 = (void *)[v2 copy];

  return v11;
}

- (CNDetectionTrack)detectionTrackForID:(CNDetectionID)detectionID
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  long long v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CNScript_detectionTrackForID___block_invoke;
  block[3] = &unk_26517A6F0;
  block[4] = self;
  void block[5] = &v9;
  void block[6] = detectionID;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (CNDetectionTrack *)v6;
}

void __32__CNScript_detectionTrackForID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__CNScript_detectionTrackForID___block_invoke_2;
  _OWORD v6[3] = &unk_26517A6C8;
  uint64_t v2 = a1[6];
  v6[4] = a1[4];
  void v6[5] = v2;
  uint64_t v3 = __32__CNScript_detectionTrackForID___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __32__CNScript_detectionTrackForID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  uint64_t v3 = [v2 trackForIdentifier:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = +[CNDetectionTrack _trackFromInternal:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (CNDetectionTrack)detectionTrackForDecision:(CNDecision *)decision
{
  uint64_t v4 = decision;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CNScript_detectionTrackForDecision___block_invoke;
  block[3] = &unk_26517A678;
  long long v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (CNDetectionTrack *)v7;
}

void __38__CNScript_detectionTrackForDecision___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CNScript_detectionTrackForDecision___block_invoke_2;
  _OWORD v6[3] = &unk_26517A718;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __38__CNScript_detectionTrackForDecision___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __38__CNScript_detectionTrackForDecision___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  uint64_t v3 = [*(id *)(a1 + 40) internalDecision];
  uint64_t v4 = [v2 trackForDecision:v3];

  if (v4)
  {
    uint64_t v5 = +[CNDetectionTrack _trackFromInternal:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (float)fNumber
{
  uint64_t v7 = 0;
  id v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v3 = [(CNScript *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __19__CNScript_fNumber__block_invoke;
  _OWORD v6[3] = &unk_26517A4E8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __19__CNScript_fNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalScript];
  [v2 userAperture];
  int v4 = v3;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

float __19__CNScript_fNumber__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) internalScript];
  [v1 userAperture];
  float v3 = v2;

  return v3;
}

- (void)setFNumber:(float)fNumber
{
  uint64_t v5 = [(CNScript *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __23__CNScript_setFNumber___block_invoke;
  _OWORD v6[3] = &unk_26517A768;
  v6[4] = self;
  float v7 = fNumber;
  dispatch_sync(v5, v6);
}

void __23__CNScript_setFNumber___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) internalScript];
  LODWORD(v2) = v1;
  [v3 setUserAperture:v2];
}

- (BOOL)addUserDecision:(CNDecision *)decision
{
  int v4 = decision;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__CNScript_addUserDecision___block_invoke;
  block[3] = &unk_26517A678;
  uint64_t v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __28__CNScript_addUserDecision___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __28__CNScript_addUserDecision___block_invoke_2;
  v3[3] = &unk_26517A790;
  double v2 = (void *)a1[5];
  v3[4] = a1[4];
  id v4 = v2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = __28__CNScript_addUserDecision___block_invoke_2((uint64_t)v3);
}

uint64_t __28__CNScript_addUserDecision___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) internalScript];
  id v3 = [*(id *)(a1 + 40) internalDecision];
  uint64_t v4 = [v2 addUserDecision:v3];

  return v4;
}

- (BOOL)removeUserDecision:(CNDecision *)decision
{
  uint64_t v4 = decision;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__CNScript_removeUserDecision___block_invoke;
  block[3] = &unk_26517A678;
  uint64_t v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __31__CNScript_removeUserDecision___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__CNScript_removeUserDecision___block_invoke_2;
  v3[3] = &unk_26517A790;
  double v2 = (void *)a1[5];
  v3[4] = a1[4];
  id v4 = v2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = __31__CNScript_removeUserDecision___block_invoke_2((uint64_t)v3);
}

uint64_t __31__CNScript_removeUserDecision___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) internalScript];
  id v3 = [*(id *)(a1 + 40) internalDecision];
  uint64_t v4 = [v2 removeUserDecision:v3];

  return v4;
}

- (void)removeAllUserDecisions
{
  id v3 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CNScript_removeAllUserDecisions__block_invoke;
  block[3] = &unk_26517A7B8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __34__CNScript_removeAllUserDecisions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) internalScript];
  [v1 removeAllUserDecisions];
}

- (CNDetectionID)addDetectionTrack:(CNDetectionTrack *)detectionTrack
{
  uint64_t v4 = detectionTrack;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CNScript_addDetectionTrack___block_invoke;
  block[3] = &unk_26517A678;
  int v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  CNDetectionID v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __30__CNScript_addDetectionTrack___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __30__CNScript_addDetectionTrack___block_invoke_2;
  v3[3] = &unk_26517A7E0;
  double v2 = (void *)a1[5];
  v3[4] = a1[4];
  id v4 = v2;
  *(void *)(*(void *)(a1[6] + 8) + 24) = __30__CNScript_addDetectionTrack___block_invoke_2((uint64_t)v3);
}

int64_t __30__CNScript_addDetectionTrack___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) internalScript];
  id v3 = [*(id *)(a1 + 40) internalTrack];
  char v4 = [v2 addTrack:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) internalTrack];
    uint64_t v6 = [v5 trackIdentifier];

    return v6;
  }
  else
  {
    return +[CNDetection invalidDetectionID];
  }
}

- (BOOL)removeDetectionTrack:(CNDetectionTrack *)detectionTrack
{
  char v4 = detectionTrack;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(CNScript *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CNScript_removeDetectionTrack___block_invoke;
  block[3] = &unk_26517A678;
  uint64_t v9 = v4;
  int v10 = &v11;
  block[4] = self;
  uint64_t v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __33__CNScript_removeDetectionTrack___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__CNScript_removeDetectionTrack___block_invoke_2;
  v3[3] = &unk_26517A790;
  double v2 = (void *)a1[5];
  v3[4] = a1[4];
  id v4 = v2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = __33__CNScript_removeDetectionTrack___block_invoke_2((uint64_t)v3);
}

uint64_t __33__CNScript_removeDetectionTrack___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) internalScript];
  id v3 = [*(id *)(a1 + 40) internalTrack];
  uint64_t v4 = [v2 removeTrack:v3];

  return v4;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (PTCinematographyScript)internalScript
{
  return (PTCinematographyScript *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalScript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalScript, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_243267000, v1, OS_LOG_TYPE_ERROR, "Error %@: Failed to read script from asset %@", v2, 0x16u);
}

@end