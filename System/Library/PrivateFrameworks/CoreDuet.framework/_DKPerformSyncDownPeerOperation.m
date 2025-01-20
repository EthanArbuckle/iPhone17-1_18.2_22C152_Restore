@interface _DKPerformSyncDownPeerOperation
+ (void)_updateEventStatsWithTransportType:(uint64_t)a1;
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:;
- (void)addSyncDownPeerAdditionsOperation;
- (void)addSyncDownPeerDeletionsOperation;
- (void)endOperation;
- (void)main;
- (void)performSyncDownPeer;
@end

@implementation _DKPerformSyncDownPeerOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14 = a3;
  id v23 = a4;
  id v15 = a5;
  id v22 = a6;
  id v16 = a7;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_DKPerformSyncDownPeerOperation;
    v17 = (id *)objc_msgSendSuper2(&v24, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
      uint64_t v19 = objc_opt_new();
      id v20 = v18[42];
      v18[42] = (id)v19;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, self->_peer, self->_policy))
  {
    [(_DKPerformSyncDownPeerOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncDownPeerOperation performSyncDownPeer]((id *)&self->super.super.super.super.isa);
  }
}

- (void)performSyncDownPeer
{
  OUTLINED_FUNCTION_4();
  a30 = v31;
  a31 = v32;
  log = v33;
  uint64_t v35 = v34;
  a19 = *MEMORY[0x1E4F143B8];
  v36 = [(id)objc_opt_class() description];
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v35 + 336), "count"));
  if ([*(id *)(v35 + 304) transportType] == 8) {
    v38 = "up to";
  }
  else {
    v38 = "down from";
  }
  uint64_t v39 = 0x1E9222000;
  v40 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_7_2() me]) {
    v41 = @"pseudo ";
  }
  else {
    v41 = &stru_1EDDE58B8;
  }
  v42 = [(id)OUTLINED_FUNCTION_7_2() identifier];
  v43 = [(id)OUTLINED_FUNCTION_7_2() model];
  if (v43)
  {
    v44 = NSString;
    uint64_t v39 = [(id)OUTLINED_FUNCTION_7_2() model];
    v40 = [v44 stringWithFormat:@" (%@)"];
  }
  v45 = [*(id *)(v35 + 304) name];
  LODWORD(buf) = 138544898;
  *(void *)((char *)&buf + 4) = v36;
  WORD6(buf) = 2112;
  *(void *)((char *)&buf + 14) = v37;
  a14 = 2082;
  a15 = v38;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v42;
  WORD2(a17) = 2114;
  *(void *)((char *)&a17 + 6) = v40;
  HIWORD(a17) = 2114;
  a18 = v45;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Done queuing %@ subordinate operation for sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", (uint8_t *)&buf, 0x48u);

  if (v43)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

+ (void)_updateEventStatsWithTransportType:(uint64_t)a1
{
  self;
  if (_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounterInitialized, &__block_literal_global_17);
  }
  uint64_t v3 = _updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter;
  if (a2 == 1) {
    v4 = @"Rapport";
  }
  else {
    v4 = @"Cloud";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v3, 1, v4);
}

- (void)addSyncDownPeerAdditionsOperation
{
  if (a1)
  {
    uint64_t v3 = -[_DKPerformSyncDownPeerAdditionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerAdditionsOperation alloc], (uint64_t)a1, a1[37], a1[38], a1[39], a1[40], a1[41]);
    if ([a1[42] count])
    {
      v2 = [a1[42] lastObject];
      [v3 addDependency:v2];
    }
    [a1[42] addObject:v3];
  }
}

- (void)addSyncDownPeerDeletionsOperation
{
  if (a1)
  {
    uint64_t v3 = -[_DKPerformSyncDownPeerDeletionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerDeletionsOperation alloc], (uint64_t)a1, a1[37], a1[38], a1[39], a1[40], a1[41]);
    if ([a1[42] count])
    {
      v2 = [a1[42] lastObject];
      [v3 addDependency:v2];
    }
    [a1[42] addObject:v3];
  }
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end