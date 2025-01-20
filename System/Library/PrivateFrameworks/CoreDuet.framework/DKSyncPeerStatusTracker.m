@interface DKSyncPeerStatusTracker
@end

@implementation DKSyncPeerStatusTracker

void __42___DKSyncPeerStatusTracker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = [[_DKSyncContext alloc] initWithName:@"DEFAULT"];
  uint64_t v2 = [v1 initWithContext:v4];
  v3 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = v2;
}

void __53___DKSyncPeerStatusTracker_syncPeerTransportsStrings__block_invoke()
{
  v3[16] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EDE1E240;
  v2[1] = &unk_1EDE1E258;
  v3[0] = @"none";
  v3[1] = @"Rapport(Pull)";
  v2[2] = &unk_1EDE1E270;
  v2[3] = &unk_1EDE1E288;
  v3[2] = @"Cloud(Down)";
  v3[3] = @"Cloud(Up)";
  v2[4] = &unk_1EDE1E2A0;
  v2[5] = &unk_1EDE1E2B8;
  v3[4] = @"Rapport(Pull) & Cloud(Down)";
  v3[5] = @"Rapport(Pull) & Cloud(Up)";
  v2[6] = &unk_1EDE1E2D0;
  v2[7] = &unk_1EDE1E2E8;
  v3[6] = @"Cloud(Down) & Cloud(Up)";
  v3[7] = @"Rapport(Pull), Cloud(Down) & Cloud(Up)";
  v2[8] = &unk_1EDE1E300;
  v2[9] = &unk_1EDE1E318;
  v3[8] = @"Rapport(Push)";
  v3[9] = @"Rapport(Pull) & Rapport(Push)";
  v2[10] = &unk_1EDE1E330;
  v2[11] = &unk_1EDE1E348;
  v3[10] = @"Rapport(Push) & Cloud(Down)";
  v3[11] = @"Rapport(Push) & Cloud(Up)";
  v2[12] = &unk_1EDE1E360;
  v2[13] = &unk_1EDE1E378;
  v3[12] = @"Rapport(Pull), Rapport(Push) & Cloud(Down)";
  v3[13] = @"Rapport(Pull), Rapport(Push) & Cloud(Up)";
  v2[14] = &unk_1EDE1E390;
  v2[15] = &unk_1EDE1E3A8;
  v3[14] = @"Rapport(Push), Cloud(Down) & Cloud(Up)";
  v3[15] = @"Rapport(Pull), Rapport(Push), Cloud(Down) & Cloud(Up)";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:16];
  id v1 = (void *)syncPeerTransportsStrings_strings;
  syncPeerTransportsStrings_strings = v0;
}

uint64_t __55___DKSyncPeerStatusTracker_addActiveTransports_toPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) | a2;
}

uint64_t __60___DKSyncPeerStatusTracker_removeActiveTransports_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 & ~*(void *)(a1 + 32);
}

uint64_t __41___DKSyncPeerStatusTracker_debugLogPeers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = v4;
  v7 = v6;
  if (v6) {
    v8 = (void *)v6[2];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 sourceDeviceID];
  v11 = v5;
  v12 = v11;
  if (v11) {
    v13 = (void *)v11[2];
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = [v14 sourceDeviceID];
  v16 = (void *)v15;
  if (!v10 || !v15)
  {
    if (!v10 || v15)
    {
      if (v10 || !v15)
      {
        v22 = [v9 identifier];
        v23 = [v14 identifier];
        uint64_t v21 = [v22 compare:v23];

        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  if (!v7)
  {
    uint64_t v17 = 0;
    if (v12) {
      goto LABEL_9;
    }
LABEL_29:
    BOOL v19 = 0;
    if (!v17)
    {
LABEL_13:
      if (v17) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = v19;
      }
      if (!v20) {
        goto LABEL_17;
      }
LABEL_23:
      uint64_t v21 = 1;
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  uint64_t v17 = v7[3];
  if (!v12) {
    goto LABEL_29;
  }
LABEL_9:
  uint64_t v18 = v12[3];
  BOOL v19 = v18 != 0;
  if (!v17 || !v18)
  {
    if (!v17) {
      goto LABEL_13;
    }
LABEL_12:
    if (v19) {
      goto LABEL_13;
    }
LABEL_20:
    uint64_t v21 = -1;
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v21 = [v10 compare:v15];
LABEL_25:

  return v21;
}

@end