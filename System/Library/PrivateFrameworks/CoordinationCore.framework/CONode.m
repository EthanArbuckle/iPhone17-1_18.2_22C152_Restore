@interface CONode
+ (id)descriptionForState:(int64_t)a3;
+ (id)statusFromState:(int64_t)a3;
- (BOOL)hasOutstandingProbe;
- (BOOL)hasOutstandingRequest;
- (BOOL)hasPendingPing;
- (BOOL)isActive;
- (BOOL)isInElectionState;
- (COClusterMemberRoleSnapshot)memberSnapshot;
- (COConstituent)meConstituent;
- (COConstituent)remote;
- (COElectionInfo)lastElectionInfoReceived;
- (COElectionInfo)lastElectionInfoSent;
- (CONode)initWithRecord:(id)a3 executionContext:(id)a4 delegate:(id)a5;
- (CONodeDelegate)delegate;
- (NSString)IDSIdentifier;
- (NSUUID)HomeKitIdentifier;
- (OS_dispatch_source)backoffTimer;
- (double)lastHeard;
- (id)backoffResponse;
- (int64_t)state;
- (unint64_t)backoffBucket;
- (unint64_t)connectionType;
- (unint64_t)discoveryType;
- (unint64_t)totalBackedOffTime;
- (void)_resetElectionRelatedInformation;
- (void)_withLock:(id)a3;
- (void)discoveryRecordAdded:(id)a3;
- (void)discoveryRecordRemoved:(id)a3;
- (void)resetBackoffInformation;
- (void)setBackoffBucket:(unint64_t)a3;
- (void)setBackoffResponse:(id)a3;
- (void)setBackoffTimer:(id)a3;
- (void)setConnectionType:(unint64_t)a3;
- (void)setDiscoveryType:(unint64_t)a3;
- (void)setHomeKitIdentifier:(id)a3;
- (void)setLastElectionInfoReceived:(id)a3;
- (void)setLastElectionInfoSent:(id)a3;
- (void)setLastHeard:(double)a3;
- (void)setMemberSnapshot:(id)a3;
- (void)setOutstandingProbe:(BOOL)a3;
- (void)setPendingPing:(BOOL)a3;
- (void)setRemote:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTotalBackedOffTime:(unint64_t)a3;
@end

@implementation CONode

- (CONode)initWithRecord:(id)a3 executionContext:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CONode;
  v11 = [(CONode *)&v25 init];
  if (v11)
  {
    v12 = [v9 constituentForMe];
    objc_storeStrong((id *)&v11->_meConstituent, v12);
    v13 = [v8 IDSIdentifier];
    uint64_t v14 = [v13 copy];
    IDSIdentifier = v11->_IDSIdentifier;
    v11->_IDSIdentifier = (NSString *)v14;

    v16 = [v8 HomeKitIdentifier];
    uint64_t v17 = [v16 copy];
    HomeKitIdentifier = v11->_HomeKitIdentifier;
    v11->_HomeKitIdentifier = (NSUUID *)v17;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v11->_remote, v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_7;
        }
        uint64_t v19 = 0;
LABEL_6:
        v11->_connectionType = v19;
LABEL_7:
        v20 = objc_alloc_init(COElectionInfo);
        lastElectionInfoSent = v11->_lastElectionInfoSent;
        v11->_lastElectionInfoSent = v20;

        v22 = objc_alloc_init(COElectionInfo);
        lastElectionInfoReceived = v11->_lastElectionInfoReceived;
        v11->_lastElectionInfoReceived = v22;

        goto LABEL_8;
      }
    }
    uint64_t v19 = 1;
    goto LABEL_6;
  }
LABEL_8:

  return v11;
}

- (BOOL)isInElectionState
{
  return [(CONode *)self state] <= 13 && [(CONode *)self state] > 2;
}

- (BOOL)hasOutstandingRequest
{
  int64_t v2 = [(CONode *)self state];
  return v2 == 6 || v2 == 8;
}

- (void)setBackoffTimer:(id)a3
{
  v5 = (OS_dispatch_source *)a3;
  backoffTimer = self->_backoffTimer;
  p_backoffTimer = &self->_backoffTimer;
  v6 = backoffTimer;
  id v9 = v5;
  if (backoffTimer != v5)
  {
    if (v6) {
      dispatch_source_cancel(v6);
    }
    objc_storeStrong((id *)p_backoffTimer, a3);
    if (*p_backoffTimer) {
      dispatch_resume((dispatch_object_t)*p_backoffTimer);
    }
  }
}

- (int64_t)state
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __15__CONode_state__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CONode *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __15__CONode_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)setState:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __19__CONode_setState___block_invoke;
  v3[3] = &unk_2645CD498;
  v3[4] = self;
  v3[5] = a3;
  [(CONode *)self _withLock:v3];
}

uint64_t __19__CONode_setState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

- (void)setMemberSnapshot:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__CONode_setMemberSnapshot___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CONode *)self _withLock:v6];
}

void __28__CONode_setMemberSnapshot___block_invoke(uint64_t a1)
{
}

- (COClusterMemberRoleSnapshot)memberSnapshot
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__16;
  id v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__CONode_memberSnapshot__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CONode *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COClusterMemberRoleSnapshot *)v2;
}

void __24__CONode_memberSnapshot__block_invoke(uint64_t a1)
{
}

- (void)setRemote:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__CONode_setRemote___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CONode *)self _withLock:v6];
}

void __20__CONode_setRemote___block_invoke(uint64_t a1)
{
}

- (COConstituent)remote
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__16;
  id v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __16__CONode_remote__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CONode *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COConstituent *)v2;
}

void __16__CONode_remote__block_invoke(uint64_t a1)
{
}

- (NSUUID)HomeKitIdentifier
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__CONode_HomeKitIdentifier__block_invoke;
  v8[3] = &unk_2645CAE08;
  v8[4] = self;
  v8[5] = &v9;
  [(CONode *)self _withLock:v8];
  v3 = (void *)v10[5];
  if (!v3)
  {
    id v4 = [(CONode *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v4 reconcileNode];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__CONode_HomeKitIdentifier__block_invoke_2;
      v7[3] = &unk_2645CAE08;
      v7[4] = self;
      v7[5] = &v9;
      [(CONode *)self _withLock:v7];
    }

    v3 = (void *)v10[5];
  }
  id v5 = v3;
  _Block_object_dispose(&v9, 8);

  return (NSUUID *)v5;
}

void __27__CONode_HomeKitIdentifier__block_invoke(uint64_t a1)
{
}

void __27__CONode_HomeKitIdentifier__block_invoke_2(uint64_t a1)
{
}

- (void)setHomeKitIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__CONode_setHomeKitIdentifier___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CONode *)self _withLock:v6];
}

void __31__CONode_setHomeKitIdentifier___block_invoke(uint64_t a1)
{
}

- (void)discoveryRecordAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(CONode *)self HomeKitIdentifier];

  if (!v5)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __31__CONode_discoveryRecordAdded___block_invoke;
    id v10 = &unk_2645CAE80;
    uint64_t v11 = self;
    id v12 = v4;
    [(CONode *)self _withLock:&v7];
  }
  unint64_t v6 = [(CONode *)self discoveryType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 |= 2uLL;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v6 |= 1uLL;
      if (![(CONode *)self connectionType]) {
        [(CONode *)self setConnectionType:1];
      }
    }
  }
  [(CONode *)self setDiscoveryType:v6];
}

uint64_t __31__CONode_discoveryRecordAdded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) HomeKitIdentifier];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)discoveryRecordRemoved:(id)a3
{
  if ([a3 producesElectionCapableTransport])
  {
    [(CONode *)self _resetElectionRelatedInformation];
  }
}

- (BOOL)isActive
{
  return [(CONode *)self state] > 4;
}

- (void)resetBackoffInformation
{
  [(CONode *)self setBackoffResponse:0];
  [(CONode *)self setLastElectionInfoReceived:0];
  [(CONode *)self setLastElectionInfoSent:0];
  [(CONode *)self setBackoffBucket:0];
}

- (void)_resetElectionRelatedInformation
{
  [(CONode *)self setLastElectionInfoSent:0];
  [(CONode *)self setLastElectionInfoReceived:0];
  [(CONode *)self setOutstandingProbe:0];
  [(CONode *)self setPendingPing:0];
  [(CONode *)self setDiscoveryType:0];
  [(CONode *)self setConnectionType:0];
  [(CONode *)self resetBackoffInformation];
}

+ (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return 0;
  }
  else {
    return off_2645CD4B8[a3];
  }
}

+ (id)statusFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return @"UNKNOWN";
  }
  else {
    return off_2645CD530[a3];
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (CONodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CONodeDelegate *)WeakRetained;
}

- (COConstituent)meConstituent
{
  return self->_meConstituent;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (COElectionInfo)lastElectionInfoSent
{
  return self->_lastElectionInfoSent;
}

- (void)setLastElectionInfoSent:(id)a3
{
}

- (COElectionInfo)lastElectionInfoReceived
{
  return self->_lastElectionInfoReceived;
}

- (void)setLastElectionInfoReceived:(id)a3
{
}

- (double)lastHeard
{
  return self->_lastHeard;
}

- (void)setLastHeard:(double)a3
{
  self->_lastHeard = a3;
}

- (BOOL)hasOutstandingProbe
{
  return self->_outstandingProbe;
}

- (void)setOutstandingProbe:(BOOL)a3
{
  self->_outstandingProbe = a3;
}

- (BOOL)hasPendingPing
{
  return self->_pendingPing;
}

- (void)setPendingPing:(BOOL)a3
{
  self->_pendingPing = a3;
}

- (unint64_t)backoffBucket
{
  return self->_backoffBucket;
}

- (void)setBackoffBucket:(unint64_t)a3
{
  self->_backoffBucket = a3;
}

- (OS_dispatch_source)backoffTimer
{
  return self->_backoffTimer;
}

- (unint64_t)totalBackedOffTime
{
  return self->_totalBackedOffTime;
}

- (void)setTotalBackedOffTime:(unint64_t)a3
{
  self->_totalBackedOffTime = a3;
}

- (id)backoffResponse
{
  return self->_backoffResponse;
}

- (void)setBackoffResponse:(id)a3
{
}

- (unint64_t)discoveryType
{
  return self->_discoveryType;
}

- (void)setDiscoveryType:(unint64_t)a3
{
  self->_discoveryType = a3;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_connectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backoffResponse, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_lastElectionInfoReceived, 0);
  objc_storeStrong((id *)&self->_lastElectionInfoSent, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_meConstituent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_memberSnapshot, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
}

@end