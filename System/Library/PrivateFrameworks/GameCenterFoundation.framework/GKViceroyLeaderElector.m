@interface GKViceroyLeaderElector
- (BOOL)haveAllHostScores;
- (BOOL)hostScoreForQuery;
- (BOOL)needHostScore;
- (BOOL)selectHostIfRequestedAndAllScored;
- (GKTransportMatchDataDelegate)matchDataDelegate;
- (GKViceroyLeaderElector)initWithMatchDataDelegate:(id)a3;
- (NSDictionary)networkStatistics;
- (NSMutableDictionary)hostScores;
- (NSString)localPlayerPeerID;
- (id)chooseHostCompletion;
- (void)addHostScore:(int)a3 forPlayer:(id)a4;
- (void)calculateHostScore;
- (void)chooseBestHostingPlayerWithCompletionHandler:(id)a3;
- (void)networkStatisticsDidChange:(id)a3 localPlayerPeerID:(id)a4;
- (void)receivedChooseHostData:(id)a3 fromPlayerID:(id)a4;
- (void)sendHostScoreAsQuery:(BOOL)a3;
- (void)setChooseHostCompletion:(id)a3;
- (void)setHostScoreForQuery:(BOOL)a3;
- (void)setHostScores:(id)a3;
- (void)setLocalPlayerPeerID:(id)a3;
- (void)setMatchDataDelegate:(id)a3;
- (void)setNeedHostScore:(BOOL)a3;
- (void)setNetworkStatistics:(id)a3;
@end

@implementation GKViceroyLeaderElector

- (GKViceroyLeaderElector)initWithMatchDataDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKViceroyLeaderElector;
  v5 = [(GKViceroyLeaderElector *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_matchDataDelegateWeak, v4);
  }

  return v6;
}

- (void)chooseBestHostingPlayerWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    v5 = [(GKViceroyLeaderElector *)self matchDataDelegate];
    v6 = v5;
    if (self->_chooseHostCompletion
      || v5 && ([v5 expectedPlayerCount] || !objc_msgSend(v6, "currentPlayerCount")))
    {
      v4[2](v4, 0);
    }
    else
    {
      v7 = self;
      objc_sync_enter(v7);
      if (!v7->_hostScores)
      {
        objc_super v8 = [MEMORY[0x1E4F1CA60] dictionary];
        [(GKViceroyLeaderElector *)v7 setHostScores:v8];
      }
      objc_sync_exit(v7);

      [(GKViceroyLeaderElector *)v7 setChooseHostCompletion:v4];
      [(GKViceroyLeaderElector *)v7 calculateHostScore];
      if (![(GKViceroyLeaderElector *)v7 selectHostIfRequestedAndAllScored])
      {
        if (v7->_needHostScore) {
          [(GKViceroyLeaderElector *)v7 setHostScoreForQuery:1];
        }
        else {
          [(GKViceroyLeaderElector *)v7 sendHostScoreAsQuery:1];
        }
        dispatch_time_t v9 = dispatch_time(0, 15000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke;
        block[3] = &unk_1E646D7F0;
        block[4] = v7;
        dispatch_after(v9, MEMORY[0x1E4F14428], block);
      }
    }
  }
}

void __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[2])
  {
    v3 = v1;
    objc_sync_enter(v3);
    if (*(void *)(*(void *)(a1 + 32) + 24))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E646D7F0;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    objc_sync_exit(v3);
  }
}

uint64_t __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    (*(void (**)(uint64_t, void))(result + 16))(result, 0);
    v3 = *(void **)(a1 + 32);
    return [v3 setChooseHostCompletion:0];
  }
  return result;
}

- (void)networkStatisticsDidChange:(id)a3 localPlayerPeerID:(id)a4
{
  id v6 = a4;
  [(GKViceroyLeaderElector *)self setNetworkStatistics:a3];
  [(GKViceroyLeaderElector *)self setLocalPlayerPeerID:v6];

  if (self->_needHostScore)
  {
    [(GKViceroyLeaderElector *)self calculateHostScore];
    [(GKViceroyLeaderElector *)self sendHostScoreAsQuery:self->_hostScoreForQuery];
    [(GKViceroyLeaderElector *)self selectHostIfRequestedAndAllScored];
    [(GKViceroyLeaderElector *)self setNeedHostScore:0];
    [(GKViceroyLeaderElector *)self setHostScoreForQuery:0];
  }
}

- (void)receivedChooseHostData:(id)a3 fromPlayerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = v6;
  uint64_t v8 = *(unsigned int *)[v17 bytes];
  if ((unint64_t)[v17 length] < 5)
  {
    int v14 = 1;
    if (v7)
    {
LABEL_8:
      v15 = [(GKViceroyLeaderElector *)self matchDataDelegate];
      v16 = [v15 playerFromID:v7];
      [(GKViceroyLeaderElector *)self addHostScore:v8 forPlayer:v16];
    }
  }
  else
  {
    dispatch_time_t v9 = (void *)MEMORY[0x1E4F1C9B8];
    id v10 = v17;
    objc_msgSend(v9, "dataWithBytes:length:", objc_msgSend(v10, "bytes") + 4, objc_msgSend(v10, "length") - 4);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v17 options:0 format:0 error:0];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 objectForKey:@"query"];
      int v14 = [v13 BOOLValue];
    }
    else
    {
      int v14 = 1;
    }

    if (v7) {
      goto LABEL_8;
    }
  }
  [(GKViceroyLeaderElector *)self calculateHostScore];
  if (v14) {
    [(GKViceroyLeaderElector *)self sendHostScoreAsQuery:0];
  }
  [(GKViceroyLeaderElector *)self selectHostIfRequestedAndAllScored];
}

- (void)addHostScore:(int)a3 forPlayer:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    hostScores = v7->_hostScores;
    if (!hostScores)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(GKViceroyLeaderElector *)v7 setHostScores:v9];

      hostScores = v7->_hostScores;
    }
    v13[0] = v6;
    id v10 = [NSNumber numberWithInteger:a3];
    v13[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v12 = [v6 referenceKey];
    [(NSMutableDictionary *)hostScores setObject:v11 forKey:v12];

    objc_sync_exit(v7);
  }
}

- (BOOL)haveAllHostScores
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableDictionary *)v2->_hostScores count];
  id v4 = [(GKViceroyLeaderElector *)v2 matchDataDelegate];
  LOBYTE(v3) = v3 == [v4 currentPlayerCountIncludingLocalPlayer];

  objc_sync_exit(v2);
  return v3;
}

- (BOOL)selectHostIfRequestedAndAllScored
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_chooseHostCompletion)
  {
    BOOL v3 = [(GKViceroyLeaderElector *)self haveAllHostScores];
    if (v3)
    {
      id v4 = +[GKLocalPlayer localPlayer];
      v5 = [v4 referenceKey];
      id v6 = self;
      objc_sync_enter(v6);
      p_isa = (id *)&v6->super.isa;
      id v7 = [(NSMutableDictionary *)v6->_hostScores objectForKey:v5];
      uint64_t v8 = [v7 objectAtIndex:1];
      uint64_t v9 = [v8 integerValue];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      obj = v6->_hostScores;
      uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            int v14 = [p_isa[3] objectForKey:v13];

            id v7 = v14;
            v15 = [v14 objectAtIndex:1];
            uint64_t v16 = [v15 integerValue];

            if (v16 > v9 || v16 == v9 && [v5 caseInsensitiveCompare:v13] == -1)
            {
              uint64_t v17 = [v7 objectAtIndex:0];

              id v18 = v13;
              id v4 = (void *)v17;
              v5 = v18;
              uint64_t v9 = v16;
            }
          }
          uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      [p_isa setHostScores:0];
      objc_sync_exit(p_isa);

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__GKViceroyLeaderElector_selectHostIfRequestedAndAllScored__block_invoke;
      block[3] = &unk_1E646EC80;
      block[4] = p_isa;
      id v24 = v4;
      id v19 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

uint64_t __59__GKViceroyLeaderElector_selectHostIfRequestedAndAllScored__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 16);
  if (v1)
  {
    uint64_t v2 = result;
    BOOL v3 = [*(id *)(result + 40) internal];
    id v4 = [v3 playerID];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

    v5 = *(void **)(v2 + 32);
    return [v5 setChooseHostCompletion:0];
  }
  return result;
}

- (void)calculateHostScore
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v48 = +[GKLocalPlayer local];
  v47 = [v48 referenceKey];
  BOOL v3 = self;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)v3->_hostScores objectForKey:v47];

  objc_sync_exit(v3);
  if (!v4)
  {
    networkStatistics = v3->_networkStatistics;
    if (networkStatistics
      && v3->_localPlayerPeerID
      && (v49 = v3,
          -[NSDictionary objectForKey:](networkStatistics, "objectForKey:"),
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v6 objectForKey:@"GKSStatsLinks"],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v71 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v57;
        double v50 = 0.0;
        double v51 = 0.0;
        double v11 = 0.0;
        double v12 = 0.0;
        double v13 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v57 != v10) {
              objc_enumerationMutation(v8);
            }
            v15 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v56 + 1) + 8 * i), v47);
            uint64_t v16 = [v15 objectForKey:@"GKSStatsSendBWE"];
            [v16 doubleValue];
            double v18 = v17;

            id v19 = [v15 objectForKey:@"GKSStatsRecvBWE"];
            [v19 doubleValue];
            double v21 = v20;

            v22 = [v15 objectForKey:@"GKSStatsSendPLR"];
            [v22 doubleValue];
            double v24 = v23;

            long long v25 = [v15 objectForKey:@"GKSStatsRecvPLR"];
            [v25 doubleValue];
            double v27 = v26;

            long long v28 = [v15 objectForKey:@"GKSStatsRTT"];
            [v28 doubleValue];
            double v30 = v29;

            double v13 = v13 + v18;
            double v12 = v12 + v21;
            double v11 = v11 + v24;
            double v50 = v50 + v30;
            double v51 = v51 + v27;
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v71 count:16];
        }
        while (v9);
      }
      else
      {
        double v50 = 0.0;
        double v51 = 0.0;
        double v11 = 0.0;
        double v12 = 0.0;
        double v13 = 0.0;
      }

      unint64_t v31 = [v8 count];
      if (v31 < 2)
      {
        double v33 = v50;
        double v32 = v51;
      }
      else
      {
        double v13 = v13 / (double)v31;
        double v12 = v12 / (double)v31;
        double v11 = v11 / (double)v31;
        double v32 = v51 / (double)v31;
        double v33 = v50 / (double)v31;
      }
      v34 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v35 = GKOSLoggers();
        v34 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219264;
        *(void *)v62 = (uint64_t)((double)(uint64_t)((double)(uint64_t)((v12 + v13) * 0.3 + 0.0) - (v32 + v11) * 0.3)
                                 + v33 * -0.4);
        *(_WORD *)&v62[8] = 2048;
        *(double *)&v62[10] = v13;
        __int16 v63 = 2048;
        double v64 = v12;
        __int16 v65 = 2048;
        double v66 = v11;
        __int16 v67 = 2048;
        double v68 = v32;
        __int16 v69 = 2048;
        double v70 = v33;
        _os_log_impl(&dword_1C2D22000, v34, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Host score %ld  (sendBandwidth = %f, receiveBandwidth = %f, sendLoss = %f, receiveLoss = %f, rtt = %f)", buf, 0x3Eu);
      }
      -[GKViceroyLeaderElector addHostScore:forPlayer:](v49, "addHostScore:forPlayer:", (uint64_t)((double)(uint64_t)((double)(uint64_t)((v12 + v13) * 0.3 + 0.0) - (v32 + v11) * 0.3) + v33 * -0.4), v48, v47);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v36 = [(GKViceroyLeaderElector *)v49 matchDataDelegate];
      v37 = [v36 guestPlayers];

      uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v53 != v39) {
              objc_enumerationMutation(v37);
            }
            v41 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            [(GKViceroyLeaderElector *)v49 addHostScore:0 forPlayer:v41];
            v42 = os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              id v43 = GKOSLoggers();
              v42 = os_log_GKGeneral;
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              v44 = v42;
              v45 = [v41 internal];
              v46 = [v45 playerID];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v62 = 0;
              *(_WORD *)&v62[4] = 2112;
              *(void *)&v62[6] = v46;
              _os_log_impl(&dword_1C2D22000, v44, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Added host score of %i for guest player = %@", buf, 0x12u);
            }
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v38);
      }

      [(GKViceroyLeaderElector *)v49 selectHostIfRequestedAndAllScored];
    }
    else
    {
      -[GKViceroyLeaderElector setNeedHostScore:](v3, "setNeedHostScore:", 1, v47);
    }
  }
}

- (void)sendHostScoreAsQuery:(BOOL)a3
{
  BOOL v3 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  hostScores = v4->_hostScores;
  id v6 = +[GKLocalPlayer localPlayer];
  id v7 = [v6 referenceKey];
  id v8 = [(NSMutableDictionary *)hostScores objectForKey:v7];

  objc_sync_exit(v4);
  if (v8)
  {
    double v23 = @"query";
    uint64_t v9 = [NSNumber numberWithBool:v3];
    v24[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

    double v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:0];
    double v12 = [v8 objectAtIndex:1];
    int v13 = [v12 integerValue];

    int v20 = v13;
    int v14 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v20 length:4];
    [v14 appendData:v11];
    v15 = [(GKViceroyLeaderElector *)v4 matchDataDelegate];
    id v19 = 0;
    [v15 sendPacketDataToAll:v14 packetType:4 dataMode:0 error:&v19];
    id v16 = v19;

    if (v16)
    {
      double v17 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v18 = GKOSLoggers();
        double v17 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Failed to enqueue GKMatchChooseHostPacketType send to all, error %@", buf, 0xCu);
      }
    }
  }
}

- (id)chooseHostCompletion
{
  return self->_chooseHostCompletion;
}

- (void)setChooseHostCompletion:(id)a3
{
}

- (NSMutableDictionary)hostScores
{
  return self->_hostScores;
}

- (void)setHostScores:(id)a3
{
}

- (BOOL)hostScoreForQuery
{
  return self->_hostScoreForQuery;
}

- (void)setHostScoreForQuery:(BOOL)a3
{
  self->_hostScoreForQuery = a3;
}

- (NSString)localPlayerPeerID
{
  return self->_localPlayerPeerID;
}

- (void)setLocalPlayerPeerID:(id)a3
{
  self->_localPlayerPeerID = (NSString *)a3;
}

- (BOOL)needHostScore
{
  return self->_needHostScore;
}

- (void)setNeedHostScore:(BOOL)a3
{
  self->_needHostScore = a3;
}

- (NSDictionary)networkStatistics
{
  return self->_networkStatistics;
}

- (void)setNetworkStatistics:(id)a3
{
}

- (GKTransportMatchDataDelegate)matchDataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matchDataDelegateWeak);

  return (GKTransportMatchDataDelegate *)WeakRetained;
}

- (void)setMatchDataDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_matchDataDelegateWeak);
  objc_storeStrong((id *)&self->_networkStatistics, 0);
  objc_storeStrong((id *)&self->_hostScores, 0);

  objc_storeStrong(&self->_chooseHostCompletion, 0);
}

@end