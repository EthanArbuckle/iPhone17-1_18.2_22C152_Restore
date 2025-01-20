@interface ASCompetitionAwardingSource
- (ASCompetitionAwardingSourceDataProvider)dataProvider;
- (NSString)uniqueName;
- (id)_allCompetitionsOrderedByEndDate;
- (id)_queue_earnedInstancesForInterval:(id)a3 selectingCompetitionsUsingFilter:(id)a4;
- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4;
- (id)earnedInstancesForIncrementalInterval:(id)a3;
- (id)initForCreatorDevice:(unsigned __int8)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation ASCompetitionAwardingSource

- (id)initForCreatorDevice:(unsigned __int8)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASCompetitionAwardingSource;
  v4 = [(ASCompetitionAwardingSource *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_creatorDevice = a3;
    uint64_t v6 = HKCreateSerialDispatchQueue();
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (NSString)uniqueName
{
  return (NSString *)@"ActivitySharingCompetitionAwardingSource";
}

- (id)earnedInstancesForIncrementalInterval:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Responding to earned instances for incremental interval: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ASCompetitionAwardingSource_earnedInstancesForIncrementalInterval___block_invoke;
  block[3] = &unk_265216070;
  id v11 = v4;
  p_long long buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(serialQueue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

uint64_t __69__ASCompetitionAwardingSource_earnedInstancesForIncrementalInterval___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_earnedInstancesForInterval:selectingCompetitionsUsingFilter:", *(void *)(a1 + 40), &__block_literal_global_14);
  return MEMORY[0x270F9A758]();
}

uint64_t __69__ASCompetitionAwardingSource_earnedInstancesForIncrementalInterval___block_invoke_2()
{
  return 1;
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  uint64_t v6 = *MEMORY[0x263F23A98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Responding to earned instances for historical interval: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  id v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ASCompetitionAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  block[3] = &unk_265216070;
  id v12 = v5;
  p_long long buf = &buf;
  block[4] = self;
  id v8 = v5;
  dispatch_sync(serialQueue, block);
  id v9 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v9;
}

void __84__ASCompetitionAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(void *a1)
{
  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__ASCompetitionAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2;
  v7[3] = &unk_2652174C0;
  id v8 = v2;
  uint64_t v4 = objc_msgSend(v3, "_queue_earnedInstancesForInterval:selectingCompetitionsUsingFilter:", v8, v7);
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __84__ASCompetitionAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 endDate];
  uint64_t v5 = [*(id *)(a1 + 32) startDate];
  int v6 = objc_msgSend(v4, "hk_isAfterOrEqualToDate:", v5);

  id v7 = [v3 endDate];

  id v8 = [*(id *)(a1 + 32) endDate];
  LODWORD(v3) = objc_msgSend(v7, "hk_isBeforeDate:", v8);

  return v6 & v3;
}

- (id)_queue_earnedInstancesForInterval:(id)a3 selectingCompetitionsUsingFilter:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v53 = a4;
  v61 = [(ASCompetitionAwardingSource *)self _allCompetitionsOrderedByEndDate];
  v62 = [MEMORY[0x263EFF9C0] set];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  id v7 = [WeakRetained friends];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v7;
  uint64_t v54 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v68;
    uint64_t v59 = *MEMORY[0x263F23A90];
    uint64_t v60 = *MEMORY[0x263F0AC18];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v68 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v8;
        id v9 = *(void **)(*((void *)&v67 + 1) + 8 * v8);
        context = (void *)MEMORY[0x24C557C30]();
        ASLoggingInitialize();
        v10 = (void *)*MEMORY[0x263F23A98];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v10;
          id v12 = [v9 UUID];
          v13 = [v9 displayName];
          *(_DWORD *)long long buf = 138543618;
          *(void *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Collecting completed competitions for %{public}@ - %@", buf, 0x16u);
        }
        v57 = v9;
        uint64_t v14 = [v9 completedCompetitions];
        uint64_t v15 = objc_msgSend(v14, "hk_filter:", v53);

        ASLoggingInitialize();
        v16 = (void *)*MEMORY[0x263F23A98];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          uint64_t v18 = [v15 count];
          *(_DWORD *)long long buf = 134217984;
          *(void *)&buf[4] = v18;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu completed competitions", buf, 0xCu);
        }
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v58 = v15;
        uint64_t v19 = [v58 countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v64 != v21) {
                objc_enumerationMutation(v58);
              }
              v23 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              ASLoggingInitialize();
              v24 = (void *)*MEMORY[0x263F23A98];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
              {
                v25 = v24;
                v26 = [v23 UUID];
                uint64_t v27 = [v23 myTotalScore];
                uint64_t v28 = [v23 opponentTotalScore];
                *(_DWORD *)long long buf = 138543874;
                *(void *)&buf[4] = v26;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v27;
                *(_WORD *)&buf[22] = 2048;
                v74 = (void *)v28;
                _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Building earned instance for competition participation: %{public}@, %lu - %lu", buf, 0x20u);
              }
              v29 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
              v30 = [v23 endDate];
              v31 = [v29 components:v60 fromDate:v30];

              id v32 = v23;
              *(void *)long long buf = MEMORY[0x263EF8330];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = ___IndexOfCompetitionInAllCompetitions_block_invoke;
              v74 = &unk_2652174E8;
              id v75 = v32;
              id v33 = v32;
              unint64_t v34 = [v61 indexOfObjectPassingTest:buf];

              v35 = [MEMORY[0x263EFF910] date];
              ASLoggingInitialize();
              v36 = *MEMORY[0x263F23A98];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 134217984;
                *(void *)&buf[4] = v34;
                _os_log_impl(&dword_2474C9000, v36, OS_LOG_TYPE_DEFAULT, "Competition is at index %lu", buf, 0xCu);
              }
              id v37 = objc_alloc_init(MEMORY[0x263F236B8]);
              [v37 setTemplateUniqueName:v59];
              [v37 setEarnedDateComponents:v31];
              [v37 setCreatedDate:v35];
              v38 = (void *)MEMORY[0x263F0A630];
              v39 = [MEMORY[0x263F0A830] countUnit];
              v40 = [v38 quantityWithUnit:v39 doubleValue:(double)v34];
              [v37 setValue:v40];

              [v62 addObject:v37];
              if ([v33 isParticipantWinning:0])
              {
                ASLoggingInitialize();
                v41 = *MEMORY[0x263F23A98];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23A98], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_2474C9000, v41, OS_LOG_TYPE_DEFAULT, "Building earned instance for competition victory", buf, 2u);
                }
                id v42 = objc_alloc_init(MEMORY[0x263F236B8]);
                v43 = [v57 UUID];
                v44 = ASCompetitionVictoryTemplateNameForFriend();
                [v42 setTemplateUniqueName:v44];

                [v42 setEarnedDateComponents:v31];
                [v42 setCreatedDate:v35];
                v45 = (void *)MEMORY[0x263F0A630];
                v46 = [MEMORY[0x263F0A830] countUnit];
                v47 = objc_msgSend(v45, "quantityWithUnit:doubleValue:", v46, (double)objc_msgSend(v33, "victoryBadgeStyle"));
                [v42 setValue:v47];

                [v62 addObject:v42];
              }
            }
            uint64_t v20 = [v58 countByEnumeratingWithState:&v63 objects:v71 count:16];
          }
          while (v20);
        }

        uint64_t v8 = v56 + 1;
      }
      while (v56 + 1 != v54);
      uint64_t v54 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v54);
  }

  v48 = (void *)[v62 copy];
  return v48;
}

- (id)_allCompetitionsOrderedByEndDate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  id v3 = [WeakRetained friends];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v9 = 0;
      v10 = v8;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "completedCompetitions", (void)v14);
        uint64_t v8 = [v10 arrayByAddingObjectsFromArray:v11];

        ++v9;
        v10 = v8;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  }

  id v12 = ASCompetitionsSortedByEndDate();

  return v12;
}

- (ASCompetitionAwardingSourceDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (ASCompetitionAwardingSourceDataProvider *)WeakRetained;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end