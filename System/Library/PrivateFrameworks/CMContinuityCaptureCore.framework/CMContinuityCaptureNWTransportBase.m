@interface CMContinuityCaptureNWTransportBase
- (CMContinuityCaptureNWTransportBase)initWithDevice:(id)a3;
- (ContinuityCaptureTaskDelegate)taskDelegate;
- (void)createTimeSyncClock:(id)a3;
- (void)enqueueResponse:(id)a3 identifier:(id)a4;
- (void)handleRequest:(id)a3;
- (void)scheduleReadForConnection:(id)a3 dataTillNow:(id)a4;
- (void)setTaskDelegate:(id)a3;
@end

@implementation CMContinuityCaptureNWTransportBase

- (CMContinuityCaptureNWTransportBase)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureNWTransportBase;
  v6 = [(CMContinuityCaptureNWTransportBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (ContinuityCaptureTaskDelegate)taskDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContinuityCaptureTaskDelegate *)WeakRetained;
}

- (void)setTaskDelegate:(id)a3
{
}

- (void)createTimeSyncClock:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263F7F258];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke;
  v7[3] = &unk_264C99700;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 notifyWhenClockManagerIsAvailable:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = WeakRetained;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TSClockManager is Available", buf, 0xCu);
    }

    id v5 = [MEMORY[0x263F7F258] sharedClockManager];
    [v5 addClient:WeakRetained];

    id v6 = [MEMORY[0x263F7F258] sharedClockManager];
    id v15 = 0;
    [v6 addgPTPServicesWithError:&v15];
    id v7 = v15;

    if (v7)
    {
      id v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_cold_1((uint64_t)WeakRetained, v7, v8);
      }

      uint64_t v9 = *(void *)(a1 + 32);
      v10 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870212 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      v11 = (void *)MEMORY[0x263F7F268];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_10;
      v12[3] = &unk_264C99700;
      objc_copyWeak(&v14, v2);
      id v13 = *(id *)(a1 + 32);
      [v11 notifyWhengPTPManagerIsAvailable:v12];

      objc_destroyWeak(&v14);
    }
  }
}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_10(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v8 = 138543362;
    id v9 = WeakRetained;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ gPTPManager is Available", (uint8_t *)&v8, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    id v5 = [MEMORY[0x263F7F268] sharedgPTPManager];
    uint64_t v6 = [v5 systemDomainClockIdentifier];

    id v7 = [[CMContinuityCaptureTimeSyncClock alloc] initWithClockIdentifier:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enqueueResponse:(id)a3 identifier:(id)a4
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v9 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
    if (v9)
    {
      uint64_t v10 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
      BOOL v11 = v10 == 0;

      if (v11) {
        goto LABEL_20;
      }
      v12 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_20;
      }
      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
        v16 = [v6 objectForKeyedSubscript:@"ContinuityCaptureGID"];
        *(_DWORD *)buf = 138544130;
        v136 = self;
        __int16 v137 = 2114;
        *(void *)v138 = v7;
        *(_WORD *)&v138[8] = 2114;
        unint64_t v139 = (unint64_t)v15;
        __int16 v140 = 2114;
        v141 = v16;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueResponse identifier:%{public}@ selector %{public}@ gid %{public}@", buf, 0x2Au);
      }
      id v17 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18)
      {
        id v19 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
        if ([v7 isEqualToString:@"ContinuityCaptureCommand"])
        {
          v20 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
          uint64_t v21 = [v20 unsignedIntegerValue];

          id v9 = 0;
          uint64_t v22 = v21 - 1;
          id v23 = 0;
          v24 = 0;
          switch(v22)
          {
            case 0:
              if ([v19 count] != 3) {
                goto LABEL_21;
              }
              v25 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v26 = objc_opt_isKindOfClass();

              if ((v26 & 1) == 0) {
                goto LABEL_21;
              }
              v27 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v28 = objc_opt_isKindOfClass();

              if ((v28 & 1) == 0) {
                goto LABEL_21;
              }
              v29 = [v19 objectAtIndexedSubscript:2];
              objc_opt_class();
              char v30 = objc_opt_isKindOfClass();

              if ((v30 & 1) == 0 || [(CMContinuityCaptureTransportNWDevice *)self->_device remote]) {
                goto LABEL_21;
              }
              v31 = (void *)MEMORY[0x263F08928];
              uint64_t v32 = objc_opt_class();
              v33 = [v19 objectAtIndexedSubscript:0];
              id v127 = 0;
              v34 = [v31 unarchivedObjectOfClass:v32 fromData:v33 error:&v127];
              id v23 = v127;

              if (v34)
              {
                v35 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  v36 = [v19 objectAtIndexedSubscript:1];
                  int v37 = [v36 unsignedIntValue];
                  *(_DWORD *)buf = 138543874;
                  v136 = self;
                  __int16 v137 = 2114;
                  *(void *)v138 = v34;
                  *(_WORD *)&v138[8] = 1024;
                  LODWORD(v139) = v37;
                  _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);
                }
                v38 = [v19 objectAtIndexedSubscript:1];
                unsigned int v39 = [v38 unsignedIntValue];
                v124[0] = MEMORY[0x263EF8330];
                v124[1] = 3221225472;
                v124[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_22;
                v124[3] = &unk_264C996D8;
                objc_copyWeak(&v126, &location);
                id v40 = v34;
                id v125 = v40;
                [WeakRetained startStream:v40 option:v39 completion:v124];

                objc_destroyWeak(&v126);
              }
              else
              {
                v118 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                }
              }
              goto LABEL_59;
            case 1:
              if ([v19 count] == 3)
              {
                v78 = [v19 objectAtIndexedSubscript:0];
                objc_opt_class();
                char v79 = objc_opt_isKindOfClass();

                if (v79)
                {
                  v80 = [v19 objectAtIndexedSubscript:1];
                  objc_opt_class();
                  char v81 = objc_opt_isKindOfClass();

                  if (v81)
                  {
                    v82 = [v19 objectAtIndexedSubscript:2];
                    objc_opt_class();
                    char v83 = objc_opt_isKindOfClass();

                    if ((v83 & 1) != 0 && ![(CMContinuityCaptureTransportNWDevice *)self->_device remote])
                    {
                      v84 = CMContinuityCaptureLog(2);
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                      {
                        v85 = [v19 objectAtIndexedSubscript:0];
                        int v86 = [v85 unsignedIntValue];
                        v87 = [v19 objectAtIndexedSubscript:1];
                        int v88 = [v87 unsignedIntValue];
                        *(_DWORD *)buf = 138543874;
                        v136 = self;
                        __int16 v137 = 1024;
                        *(_DWORD *)v138 = v86;
                        *(_WORD *)&v138[4] = 1024;
                        *(_DWORD *)&v138[6] = v88;
                        _os_log_impl(&dword_235FC2000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);
                      }
                      v89 = [v19 objectAtIndexedSubscript:0];
                      unsigned int v90 = [v89 unsignedIntValue];
                      v91 = [v19 objectAtIndexedSubscript:1];
                      unsigned int v92 = [v91 unsignedIntValue];
                      v121[0] = MEMORY[0x263EF8330];
                      v121[1] = 3221225472;
                      v121[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_23;
                      v121[3] = &unk_264C996D8;
                      objc_copyWeak(&v123, &location);
                      id v19 = v19;
                      id v122 = v19;
                      [WeakRetained stopStream:v90 option:v92 completion:v121];

                      objc_destroyWeak(&v123);
                    }
                  }
                }
              }
              goto LABEL_21;
            case 2:
              if (!v19) {
                goto LABEL_21;
              }
              if ([v19 count] != 2) {
                goto LABEL_21;
              }
              v101 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v102 = objc_opt_isKindOfClass();

              if ((v102 & 1) == 0) {
                goto LABEL_21;
              }
              v103 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v104 = objc_opt_isKindOfClass();

              if ((v104 & 1) == 0) {
                goto LABEL_21;
              }
              id v9 = [v19 objectAtIndexedSubscript:0];
              if ([v9 isEqualToString:@"kCMContinuityCaptureEventConnectionDisconnect"])
              {
                v105 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v136 = self;
                  __int16 v137 = 2114;
                  *(void *)v138 = WeakRetained;
                  _os_log_impl(&dword_235FC2000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted for %{public}@", buf, 0x16u);
                }
              }
              else
              {
                v108 = [v19 objectAtIndexedSubscript:1];
                unsigned int v109 = [v108 unsignedIntValue];
                v133 = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
                v110 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
                v134 = v110;
                v111 = [NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                [WeakRetained postEvent:v9 entity:v109 data:v111];
              }
              goto LABEL_22;
            case 3:
              if ([v19 count])
              {
                v106 = [v19 objectAtIndexedSubscript:0];
              }
              else
              {
                v106 = 0;
              }
              if ((unint64_t)[v19 count] < 2)
              {
                v112 = 0;
              }
              else
              {
                v112 = [v19 objectAtIndexedSubscript:1];
              }
              if ((unint64_t)[v19 count] < 3)
              {
                v113 = 0;
              }
              else
              {
                v113 = [v19 objectAtIndexedSubscript:2];
              }
              v114 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                v115 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v113, "unsignedLongLongValue"));
                *(_DWORD *)buf = 138544130;
                v136 = self;
                __int16 v137 = 2112;
                *(void *)v138 = v106;
                *(_WORD *)&v138[8] = 2112;
                unint64_t v139 = (unint64_t)v112;
                __int16 v140 = 2112;
                v141 = v115;
                _os_log_impl(&dword_235FC2000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);
              }
              objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v106, "unsignedLongLongValue"), objc_msgSend(v112, "unsignedLongLongValue"), objc_msgSend(v113, "unsignedLongLongValue"));

              goto LABEL_21;
            case 4:
              v107 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v136 = self;
                _os_log_impl(&dword_235FC2000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
              }

              [WeakRetained handleSynchronizeAudioClockCompletion];
              goto LABEL_21;
            case 5:
              if (!v19) {
                goto LABEL_21;
              }
              if ([v19 count] != 2) {
                goto LABEL_21;
              }
              v67 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v68 = objc_opt_isKindOfClass();

              if ((v68 & 1) == 0) {
                goto LABEL_21;
              }
              v69 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v70 = objc_opt_isKindOfClass();

              if ((v70 & 1) == 0) {
                goto LABEL_21;
              }
              v71 = (void *)MEMORY[0x263F08928];
              uint64_t v72 = objc_opt_class();
              v73 = [v19 objectAtIndexedSubscript:0];
              id v131 = 0;
              v74 = [v71 unarchivedObjectOfClass:v72 fromData:v73 error:&v131];
              id v23 = v131;

              if (v74)
              {
                v75 = [v19 objectAtIndexedSubscript:1];
                unsigned int v76 = [v75 unsignedIntValue];

                v77 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  v136 = self;
                  __int16 v137 = 2112;
                  *(void *)v138 = v74;
                  *(_WORD *)&v138[8] = 2048;
                  unint64_t v139 = v76;
                  _os_log_impl(&dword_235FC2000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
                }

                v128[0] = MEMORY[0x263EF8330];
                v128[1] = 3221225472;
                v128[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke;
                v128[3] = &unk_264C99B40;
                objc_copyWeak(v130, &location);
                id v129 = v74;
                v130[1] = (id)v76;
                [WeakRetained captureStillImage:v129 entity:v76 completion:v128];

                objc_destroyWeak(v130);
              }
              else
              {
                v117 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                }
              }
              goto LABEL_59;
            case 6:
            case 7:
              goto LABEL_24;
            case 8:
              if (v19)
              {
                if ([v19 count] == 2)
                {
                  v93 = [v19 objectAtIndexedSubscript:0];
                  objc_opt_class();
                  char v94 = objc_opt_isKindOfClass();

                  if (v94)
                  {
                    v95 = [v19 objectAtIndexedSubscript:1];
                    objc_opt_class();
                    char v96 = objc_opt_isKindOfClass();

                    if (v96)
                    {
                      v97 = [v19 objectAtIndexedSubscript:0];
                      v98 = [v19 objectAtIndexedSubscript:1];
                      unsigned int v99 = [v98 unsignedIntValue];

                      v100 = CMContinuityCaptureLog(2);
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v136 = self;
                        __int16 v137 = 2112;
                        *(void *)v138 = v97;
                        *(_WORD *)&v138[8] = 2048;
                        unint64_t v139 = v99;
                        _os_log_impl(&dword_235FC2000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                      }

                      [WeakRetained enqueueReactionEffect:v97 entity:v99];
                    }
                  }
                }
              }
              goto LABEL_21;
            default:
              goto LABEL_45;
          }
        }
        if ([v7 isEqualToString:@"ContinuityCaptureControl"])
        {
          v41 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
          uint64_t v42 = [v41 unsignedIntegerValue];

          if (v42 == 2)
          {
            if ([v19 count] == 2)
            {
              v60 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v61 = objc_opt_isKindOfClass();

              if (v61)
              {
                v62 = [v19 objectAtIndexedSubscript:1];
                objc_opt_class();
                char v63 = objc_opt_isKindOfClass();

                if (v63)
                {
                  v64 = [v19 objectAtIndexedSubscript:0];
                  unsigned int v65 = [v64 unsignedIntValue];
                  v66 = [v19 objectAtIndexedSubscript:1];
                  [WeakRetained handleAVCNegotiation:v65 data:v66];
                }
              }
            }
          }
          else if (v42 == 1)
          {
            if (v19)
            {
              if ([v19 count] == 1)
              {
                v43 = [v19 objectAtIndexedSubscript:0];
                objc_opt_class();
                char v44 = objc_opt_isKindOfClass();

                if (v44)
                {
                  v45 = (void *)MEMORY[0x263F08928];
                  uint64_t v46 = objc_opt_class();
                  v47 = [v19 objectAtIndexedSubscript:0];
                  id v120 = 0;
                  v24 = [v45 unarchivedObjectOfClass:v46 fromData:v47 error:&v120];
                  id v23 = v120;

                  if (v24)
                  {
                    v48 = CMContinuityCaptureLog(2);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v136 = self;
                      __int16 v137 = 2114;
                      *(void *)v138 = v24;
                      _os_log_impl(&dword_235FC2000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
                    }

                    [WeakRetained setValueForControl:v24 completion:&__block_literal_global_23];
                    id v9 = 0;
                    goto LABEL_24;
                  }
                  v116 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                  }

                  goto LABEL_59;
                }
              }
            }
          }
        }
        else if ([v7 isEqualToString:@"ContinuityCaptureData"])
        {
          v49 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
          uint64_t v50 = [v49 unsignedIntegerValue];

          id v9 = 0;
          if (v50 || !v19)
          {
LABEL_45:
            id v23 = 0;
            v24 = 0;
            goto LABEL_24;
          }
          if ([v19 count] == 2)
          {
            v51 = [v19 objectAtIndexedSubscript:0];
            objc_opt_class();
            char v52 = objc_opt_isKindOfClass();

            if (v52)
            {
              v53 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v54 = objc_opt_isKindOfClass();

              if (v54)
              {
                v55 = (void *)MEMORY[0x263F08928];
                uint64_t v56 = objc_opt_class();
                v57 = [v19 objectAtIndexedSubscript:0];
                id v119 = 0;
                v58 = [v55 unarchivedObjectOfClass:v56 fromData:v57 error:&v119];
                id v23 = v119;

                if (v58)
                {
                  v59 = [v19 objectAtIndexedSubscript:1];
                  objc_msgSend(WeakRetained, "didCaptureStillImage:entity:", v58, -[NSObject unsignedIntValue](v59, "unsignedIntValue"));
                }
                else
                {
                  v59 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.4();
                  }
                }

LABEL_59:
                id v9 = 0;
                goto LABEL_23;
              }
            }
          }
        }
      }
      else
      {
LABEL_20:
        id v19 = 0;
      }
LABEL_21:
      id v9 = 0;
    }
    else
    {
      id v19 = 0;
    }
LABEL_22:
    id v23 = 0;
LABEL_23:
    v24 = 0;
LABEL_24:
    objc_destroyWeak(&location);

    goto LABEL_25;
  }
  id v19 = 0;
  id v9 = 0;
  id v23 = 0;
LABEL_25:
}

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(a1 + 32) setError:a2];
    [v5[2] didCaptureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];
    id WeakRetained = v5;
  }
}

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream %@ Error %@", (uint8_t *)&v7, 0x20u);
  }
}

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_23(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream for Identifier %@ Error %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)scheduleReadForConnection:(id)a3 dataTillNow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  id v8 = objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__CMContinuityCaptureNWTransportBase_scheduleReadForConnection_dataTillNow___block_invoke;
  v10[3] = &unk_264C9AB18;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  CMContinuityCaptureReceiveDataFromNWConnection(v9, v7, self, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __76__CMContinuityCaptureNWTransportBase_scheduleReadForConnection_dataTillNow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Recieved Data %@", buf, 0x16u);
    }
    if (v3 && (unint64_t)[v3 length] >= 8)
    {
      if ([v3 length])
      {
        unint64_t v8 = 0;
        while (1)
        {
          uint64_t v9 = [v3 length] - v8;
          if (v9 < 1)
          {
LABEL_17:
            id v7 = 0;
            goto LABEL_21;
          }
          if ((unint64_t)v9 <= 7) {
            break;
          }
          id v10 = v3;
          unint64_t v11 = *(void *)([v10 bytes] + v8);
          id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v13 = v10;
          unint64_t v14 = [v13 bytes] + v8;
          id v15 = v12;
          if (v9 < v11) {
            goto LABEL_20;
          }
          v16 = (void *)[v12 initWithBytes:v14 length:v11];
          if (v16)
          {
            id v17 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = objc_loadWeakRetained((id *)(a1 + 40));
              *(_DWORD *)buf = 138412546;
              id v21 = v18;
              __int16 v22 = 2112;
              id v23 = v16;
              _os_log_impl(&dword_235FC2000, v17, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Recieved Packet %@", buf, 0x16u);
            }
            [WeakRetained handleRequest:v16];
          }
          v8 += v11;

          if (v8 >= [v13 length]) {
            goto LABEL_17;
          }
        }
        id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
        unint64_t v14 = [v3 bytes] + v8;
        id v15 = v19;
LABEL_20:
        id v7 = (id)[v15 initWithBytes:v14 length:v9];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = v3;
    }
LABEL_21:
    [WeakRetained scheduleReadForConnection:*(void *)(a1 + 32) dataTillNow:v7];
  }
}

- (void)handleRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 bytes];
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 + 1 length:*v4 - 8];
  id v6 = (void *)MEMORY[0x263F08928];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v18 = 0;
  unint64_t v14 = [v6 unarchivedObjectOfClasses:v13 fromData:v5 error:&v18];
  id v15 = v18;

  v16 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%@ NW response %@", buf, 0x16u);
  }

  if (v14)
  {
    id v17 = [v14 objectForKeyedSubscript:@"identifier"];
    if (v17) {
      [(CMContinuityCaptureNWTransportBase *)self enqueueResponse:v14 identifier:v17];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_235FC2000, a3, OS_LOG_TYPE_ERROR, "%{public}@ TimeSync addgPTPServices Error %{public}@", (uint8_t *)&v6, 0x16u);
}

@end