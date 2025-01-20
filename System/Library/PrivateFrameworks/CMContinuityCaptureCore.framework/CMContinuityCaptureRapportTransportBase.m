@interface CMContinuityCaptureRapportTransportBase
- (CMContinuityCaptureRapportTransportBase)initWithRapportDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5;
- (id)incomingStreamRequestHandler;
- (void)_bindClock:(unint64_t)a3 peerAddress:(id)a4 retries:(int64_t)a5 completion:(id)a6;
- (void)_enqueueResponse:(id)a3 identifier:(id)a4;
- (void)createTimeSyncClockWithPeerAddress:(id)a3 completion:(id)a4;
- (void)disposeTimeSyncClock;
- (void)enqueueResponse:(id)a3 identifier:(id)a4;
- (void)resetDevice:(id)a3;
- (void)setIncomingStreamRequestHandler:(id)a3;
- (void)setTaskDelegate:(id)a3;
@end

@implementation CMContinuityCaptureRapportTransportBase

- (CMContinuityCaptureRapportTransportBase)initWithRapportDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureRapportTransportBase;
  v12 = [(CMContinuityCaptureRapportTransportBase *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_device, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_clockIdentifier = *MEMORY[0x263F7F278];
    v14 = v13;
  }

  return v13;
}

- (void)setIncomingStreamRequestHandler:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  uint64_t v5 = MEMORY[0x237DFB780](v4);

  id incomingStreamRequestHandler = obj->_incomingStreamRequestHandler;
  obj->_id incomingStreamRequestHandler = (id)v5;

  objc_sync_exit(obj);
}

- (id)incomingStreamRequestHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x237DFB780](v2->_incomingStreamRequestHandler);
  objc_sync_exit(v2);

  id v4 = (void *)MEMORY[0x237DFB780](v3);
  return v4;
}

- (void)resetDevice:(id)a3
{
}

- (void)setTaskDelegate:(id)a3
{
  id obj = a3;
  if ([(CMContinuityCaptureTransportRapportDevice *)self->_device remote]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : can't update task delegate for client", self format];
  }
  objc_storeWeak((id *)&self->_delegate, obj);
}

- (void)enqueueResponse:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__CMContinuityCaptureRapportTransportBase_enqueueResponse_identifier___block_invoke;
  v11[3] = &unk_264C99198;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureRapportTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _enqueueResponse:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_enqueueResponse:(id)a3 identifier:(id)a4
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v9 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
      BOOL v11 = v10 == 0;

      if (v11) {
        goto LABEL_22;
      }
      id v12 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_22;
      }
      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
        objc_super v16 = [v6 objectForKeyedSubscript:@"ContinuityCaptureGID"];
        *(_DWORD *)buf = 138544130;
        v141 = self;
        __int16 v142 = 2114;
        *(void *)v143 = v7;
        *(_WORD *)&v143[8] = 2114;
        unint64_t v144 = (unint64_t)v15;
        __int16 v145 = 2114;
        v146 = v16;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueResponse identifier:%{public}@ selector %{public}@ gid %{public}@", buf, 0x2Au);
      }
      v17 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
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
                goto LABEL_23;
              }
              v25 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v26 = objc_opt_isKindOfClass();

              if ((v26 & 1) == 0) {
                goto LABEL_23;
              }
              v27 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v28 = objc_opt_isKindOfClass();

              if ((v28 & 1) == 0) {
                goto LABEL_23;
              }
              v29 = [v19 objectAtIndexedSubscript:2];
              objc_opt_class();
              char v30 = objc_opt_isKindOfClass();

              if ((v30 & 1) == 0 || [(CMContinuityCaptureTransportRapportDevice *)self->_device remote]) {
                goto LABEL_23;
              }
              v31 = (void *)MEMORY[0x263F08928];
              uint64_t v32 = objc_opt_class();
              v33 = [v19 objectAtIndexedSubscript:0];
              id v132 = 0;
              v34 = [v31 unarchivedObjectOfClass:v32 fromData:v33 error:&v132];
              id v23 = v132;

              if (v34)
              {
                v35 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  v36 = [v19 objectAtIndexedSubscript:1];
                  int v37 = [v36 unsignedIntValue];
                  *(_DWORD *)buf = 138543874;
                  v141 = self;
                  __int16 v142 = 2114;
                  *(void *)v143 = v34;
                  *(_WORD *)&v143[8] = 1024;
                  LODWORD(v144) = v37;
                  _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);
                }
                v38 = [(CMContinuityCaptureRapportTransportBase *)self incomingStreamRequestHandler];

                if (v38)
                {
                  v39 = [(CMContinuityCaptureRapportTransportBase *)self incomingStreamRequestHandler];
                  v39[2](v39, 1);
                }
                v40 = [v19 objectAtIndexedSubscript:1];
                unsigned int v41 = [v40 unsignedIntValue];
                v129[0] = MEMORY[0x263EF8330];
                v129[1] = 3221225472;
                v129[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_389;
                v129[3] = &unk_264C996D8;
                objc_copyWeak(&v131, &location);
                id v42 = v34;
                id v130 = v42;
                [WeakRetained startStream:v42 option:v41 completion:v129];

                objc_destroyWeak(&v131);
              }
              else
              {
                v123 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                }
              }
              goto LABEL_61;
            case 1:
              if ([v19 count] == 3)
              {
                v80 = [v19 objectAtIndexedSubscript:0];
                objc_opt_class();
                char v81 = objc_opt_isKindOfClass();

                if (v81)
                {
                  v82 = [v19 objectAtIndexedSubscript:1];
                  objc_opt_class();
                  char v83 = objc_opt_isKindOfClass();

                  if (v83)
                  {
                    v84 = [v19 objectAtIndexedSubscript:2];
                    objc_opt_class();
                    char v85 = objc_opt_isKindOfClass();

                    if ((v85 & 1) != 0 && ![(CMContinuityCaptureTransportRapportDevice *)self->_device remote])
                    {
                      v86 = CMContinuityCaptureLog(2);
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                      {
                        v87 = [v19 objectAtIndexedSubscript:0];
                        int v88 = [v87 unsignedIntValue];
                        v89 = [v19 objectAtIndexedSubscript:1];
                        int v90 = [v89 unsignedIntValue];
                        *(_DWORD *)buf = 138543874;
                        v141 = self;
                        __int16 v142 = 1024;
                        *(_DWORD *)v143 = v88;
                        *(_WORD *)&v143[4] = 1024;
                        *(_DWORD *)&v143[6] = v90;
                        _os_log_impl(&dword_235FC2000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);
                      }
                      v91 = [(CMContinuityCaptureRapportTransportBase *)self incomingStreamRequestHandler];

                      if (v91)
                      {
                        v92 = [(CMContinuityCaptureRapportTransportBase *)self incomingStreamRequestHandler];
                        v92[2](v92, 0);
                      }
                      v93 = [v19 objectAtIndexedSubscript:0];
                      unsigned int v94 = [v93 unsignedIntValue];
                      v95 = [v19 objectAtIndexedSubscript:1];
                      unsigned int v96 = [v95 unsignedIntValue];
                      v126[0] = MEMORY[0x263EF8330];
                      v126[1] = 3221225472;
                      v126[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_390;
                      v126[3] = &unk_264C996D8;
                      objc_copyWeak(&v128, &location);
                      id v19 = v19;
                      id v127 = v19;
                      [WeakRetained stopStream:v94 option:v96 completion:v126];

                      objc_destroyWeak(&v128);
                    }
                  }
                }
              }
              goto LABEL_23;
            case 2:
              if (!v19) {
                goto LABEL_23;
              }
              if ([v19 count] != 2) {
                goto LABEL_23;
              }
              v105 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v106 = objc_opt_isKindOfClass();

              if ((v106 & 1) == 0) {
                goto LABEL_23;
              }
              v107 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v108 = objc_opt_isKindOfClass();

              if ((v108 & 1) == 0) {
                goto LABEL_23;
              }
              id v9 = [v19 objectAtIndexedSubscript:0];
              if ([v9 isEqualToString:@"kCMContinuityCaptureEventConnectionDisconnect"])
              {
                v109 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v141 = self;
                  __int16 v142 = 2114;
                  *(void *)v143 = WeakRetained;
                  _os_log_impl(&dword_235FC2000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted for %{public}@", buf, 0x16u);
                }

                v110 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1009 userInfo:0];
                [WeakRetained connectionInterrupted:v110 forDevice:self->_device];
              }
              else
              {
                v113 = [v19 objectAtIndexedSubscript:1];
                unsigned int v114 = [v113 unsignedIntValue];
                v138 = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
                v115 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
                v139 = v115;
                v116 = [NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
                [WeakRetained postEvent:v9 entity:v114 data:v116];
              }
              goto LABEL_24;
            case 3:
              if ([v19 count])
              {
                v111 = [v19 objectAtIndexedSubscript:0];
              }
              else
              {
                v111 = 0;
              }
              if ((unint64_t)[v19 count] < 2)
              {
                v117 = 0;
              }
              else
              {
                v117 = [v19 objectAtIndexedSubscript:1];
              }
              if ((unint64_t)[v19 count] < 3)
              {
                v118 = 0;
              }
              else
              {
                v118 = [v19 objectAtIndexedSubscript:2];
              }
              v119 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                v120 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v118, "unsignedLongLongValue"));
                *(_DWORD *)buf = 138544130;
                v141 = self;
                __int16 v142 = 2112;
                *(void *)v143 = v111;
                *(_WORD *)&v143[8] = 2112;
                unint64_t v144 = (unint64_t)v117;
                __int16 v145 = 2112;
                v146 = v120;
                _os_log_impl(&dword_235FC2000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);
              }
              objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v111, "unsignedLongLongValue"), objc_msgSend(v117, "unsignedLongLongValue"), objc_msgSend(v118, "unsignedLongLongValue"));

              goto LABEL_23;
            case 4:
              v112 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v141 = self;
                _os_log_impl(&dword_235FC2000, v112, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
              }

              [WeakRetained handleSynchronizeAudioClockCompletion];
              goto LABEL_23;
            case 5:
              if (!v19) {
                goto LABEL_23;
              }
              if ([v19 count] != 2) {
                goto LABEL_23;
              }
              v69 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v70 = objc_opt_isKindOfClass();

              if ((v70 & 1) == 0) {
                goto LABEL_23;
              }
              v71 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v72 = objc_opt_isKindOfClass();

              if ((v72 & 1) == 0) {
                goto LABEL_23;
              }
              v73 = (void *)MEMORY[0x263F08928];
              uint64_t v74 = objc_opt_class();
              v75 = [v19 objectAtIndexedSubscript:0];
              id v136 = 0;
              v76 = [v73 unarchivedObjectOfClass:v74 fromData:v75 error:&v136];
              id v23 = v136;

              if (v76)
              {
                v77 = [v19 objectAtIndexedSubscript:1];
                unsigned int v78 = [v77 unsignedIntValue];

                v79 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  v141 = self;
                  __int16 v142 = 2112;
                  *(void *)v143 = v76;
                  *(_WORD *)&v143[8] = 2048;
                  unint64_t v144 = v78;
                  _os_log_impl(&dword_235FC2000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
                }

                v133[0] = MEMORY[0x263EF8330];
                v133[1] = 3221225472;
                v133[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke;
                v133[3] = &unk_264C99B40;
                objc_copyWeak(v135, &location);
                id v134 = v76;
                v135[1] = (id)v78;
                [WeakRetained captureStillImage:v134 entity:v78 completion:v133];

                objc_destroyWeak(v135);
              }
              else
              {
                v122 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                }
              }
              goto LABEL_61;
            case 6:
            case 7:
              goto LABEL_26;
            case 8:
              if (v19)
              {
                if ([v19 count] == 2)
                {
                  v97 = [v19 objectAtIndexedSubscript:0];
                  objc_opt_class();
                  char v98 = objc_opt_isKindOfClass();

                  if (v98)
                  {
                    v99 = [v19 objectAtIndexedSubscript:1];
                    objc_opt_class();
                    char v100 = objc_opt_isKindOfClass();

                    if (v100)
                    {
                      v101 = [v19 objectAtIndexedSubscript:0];
                      v102 = [v19 objectAtIndexedSubscript:1];
                      unsigned int v103 = [v102 unsignedIntValue];

                      v104 = CMContinuityCaptureLog(2);
                      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v141 = self;
                        __int16 v142 = 2112;
                        *(void *)v143 = v101;
                        *(_WORD *)&v143[8] = 2048;
                        unint64_t v144 = v103;
                        _os_log_impl(&dword_235FC2000, v104, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                      }

                      [WeakRetained enqueueReactionEffect:v101 entity:v103];
                    }
                  }
                }
              }
              goto LABEL_23;
            default:
              goto LABEL_47;
          }
        }
        if ([v7 isEqualToString:@"ContinuityCaptureControl"])
        {
          v43 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
          uint64_t v44 = [v43 unsignedIntegerValue];

          if (v44 == 2)
          {
            if ([v19 count] == 2)
            {
              v62 = [v19 objectAtIndexedSubscript:0];
              objc_opt_class();
              char v63 = objc_opt_isKindOfClass();

              if (v63)
              {
                v64 = [v19 objectAtIndexedSubscript:1];
                objc_opt_class();
                char v65 = objc_opt_isKindOfClass();

                if (v65)
                {
                  v66 = [v19 objectAtIndexedSubscript:0];
                  unsigned int v67 = [v66 unsignedIntValue];
                  v68 = [v19 objectAtIndexedSubscript:1];
                  [WeakRetained handleAVCNegotiation:v67 data:v68];
                }
              }
            }
          }
          else if (v44 == 1)
          {
            if (v19)
            {
              if ([v19 count] == 1)
              {
                v45 = [v19 objectAtIndexedSubscript:0];
                objc_opt_class();
                char v46 = objc_opt_isKindOfClass();

                if (v46)
                {
                  v47 = (void *)MEMORY[0x263F08928];
                  uint64_t v48 = objc_opt_class();
                  v49 = [v19 objectAtIndexedSubscript:0];
                  id v125 = 0;
                  v24 = [v47 unarchivedObjectOfClass:v48 fromData:v49 error:&v125];
                  id v23 = v125;

                  if (v24)
                  {
                    v50 = CMContinuityCaptureLog(2);
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v141 = self;
                      __int16 v142 = 2114;
                      *(void *)v143 = v24;
                      _os_log_impl(&dword_235FC2000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
                    }

                    [WeakRetained setValueForControl:v24 completion:&__block_literal_global_394];
                    id v9 = 0;
                    goto LABEL_26;
                  }
                  v121 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
                  }

                  goto LABEL_61;
                }
              }
            }
          }
        }
        else if ([v7 isEqualToString:@"ContinuityCaptureData"])
        {
          v51 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
          uint64_t v52 = [v51 unsignedIntegerValue];

          id v9 = 0;
          if (v52 || !v19)
          {
LABEL_47:
            id v23 = 0;
            v24 = 0;
            goto LABEL_26;
          }
          if ([v19 count] == 2)
          {
            v53 = [v19 objectAtIndexedSubscript:0];
            objc_opt_class();
            char v54 = objc_opt_isKindOfClass();

            if (v54)
            {
              v55 = [v19 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v56 = objc_opt_isKindOfClass();

              if (v56)
              {
                v57 = (void *)MEMORY[0x263F08928];
                uint64_t v58 = objc_opt_class();
                v59 = [v19 objectAtIndexedSubscript:0];
                id v124 = 0;
                v60 = [v57 unarchivedObjectOfClass:v58 fromData:v59 error:&v124];
                id v23 = v124;

                if (v60)
                {
                  v61 = [v19 objectAtIndexedSubscript:1];
                  objc_msgSend(WeakRetained, "didCaptureStillImage:entity:", v60, -[NSObject unsignedIntValue](v61, "unsignedIntValue"));
                }
                else
                {
                  v61 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.4();
                  }
                }

LABEL_61:
                id v9 = 0;
                goto LABEL_25;
              }
            }
          }
        }
      }
      else
      {
LABEL_22:
        id v19 = 0;
      }
LABEL_23:
      id v9 = 0;
    }
    else
    {
      id v19 = 0;
    }
LABEL_24:
    id v23 = 0;
LABEL_25:
    v24 = 0;
LABEL_26:
    objc_destroyWeak(&location);

    goto LABEL_27;
  }
  id v19 = 0;
  id v9 = 0;
  id v23 = 0;
LABEL_27:
}

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [*(id *)(a1 + 32) setError:a2];
    [v5[3] didCaptureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];
    id WeakRetained = v5;
  }
}

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_389(uint64_t a1, uint64_t a2)
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

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_390(uint64_t a1, uint64_t a2)
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

- (void)createTimeSyncClockWithPeerAddress:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(CMContinuityCaptureTransportRapportDevice *)self->_device deviceModelType];
  __int16 v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = self;
    __int16 v20 = 2113;
    id v21 = v6;
    __int16 v22 = 2048;
    int64_t v23 = v8;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ create timesync for %{private}@ remoteType %ld", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  BOOL v10 = FigGetCFPreferenceBooleanWithDefault() != 0;
  __int16 v11 = (void *)MEMORY[0x263F7F258];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke;
  v14[3] = &unk_264C9AA30;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v7;
  id v16 = v12;
  BOOL v18 = v10;
  id v13 = v6;
  id v15 = v13;
  [v11 notifyWhenClockManagerIsAvailable:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v20 = WeakRetained;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TSClockManager is Available", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x263F7F258] sharedClockManager];
    [v5 addClient:WeakRetained];

    id v6 = [MEMORY[0x263F7F258] sharedClockManager];
    id v18 = 0;
    [v6 addgPTPServicesWithError:&v18];
    id v7 = v18;

    if (v7)
    {
      int64_t v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_cold_1((uint64_t)WeakRetained, v7);
      }

      __int16 v9 = WeakRetained[1];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_402;
      block[3] = &unk_264C9A508;
      id v17 = *(id *)(a1 + 40);
      dispatch_async(v9, block);
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x263F7F268];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2;
      v11[3] = &unk_264C9AA30;
      objc_copyWeak(&v14, v2);
      char v15 = *(unsigned char *)(a1 + 56);
      id v13 = *(id *)(a1 + 40);
      id v12 = *(id *)(a1 + 32);
      [v10 notifyWhengPTPManagerIsAvailable:v11];

      objc_destroyWeak(&v14);
    }
  }
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_402(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870212 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138543362;
    id v25 = WeakRetained;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ gPTPManager is Available", buf, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    uint64_t v23 = *MEMORY[0x263F7F278];
    BOOL v5 = *(unsigned char *)(a1 + 56) == 0;
    id v6 = [MEMORY[0x263F7F268] sharedgPTPManager];
    id v7 = v6;
    if (!v5)
    {
      uint64_t v8 = [v6 systemDomainClockIdentifier];
      uint64_t v23 = v8;

      __int16 v9 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 48));
        *(_DWORD *)buf = 138543362;
        id v25 = v10;
        _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Using system domain clock", buf, 0xCu);
      }
LABEL_8:
      uint64_t v11 = *(void *)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_405;
      v17[3] = &unk_264C9AA08;
      objc_copyWeak(&v19, (id *)(a1 + 48));
      id v18 = *(id *)(a1 + 40);
      [v4 _bindClock:v8 peerAddress:v11 retries:10 completion:v17];

      objc_destroyWeak(&v19);
      goto LABEL_13;
    }
    id v22 = 0;
    [v6 addPTPInstance:&v23 error:&v22];
    id v12 = v22;

    id v13 = CMContinuityCaptureLog(2);
    id v14 = v13;
    if (!v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_loadWeakRetained((id *)(a1 + 48));
        *(_DWORD *)buf = 138543618;
        id v25 = v16;
        __int16 v26 = 2048;
        uint64_t v27 = v23;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Allocated clock %llu", buf, 0x16u);
      }
      uint64_t v8 = v23;
      v4[4] = v23;
      goto LABEL_8;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_cold_1((id *)(a1 + 48), v12);
    }

    char v15 = v4[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_404;
    block[3] = &unk_264C9A508;
    id v21 = *(id *)(a1 + 40);
    dispatch_async(v15, block);
  }
LABEL_13:
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_404(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870212 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_405(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_406;
    block[3] = &unk_264C9A9E0;
    id v8 = v3;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_406(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    && (id v2 = [[CMContinuityCaptureTimeSyncClock alloc] initWithClock:*(void *)(a1 + 32)]) != 0)
  {
    id v3 = v2;
    [(CMContinuityCaptureTimeSyncClock *)v2 startEmittingHeartBeatSignposts];
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    BOOL v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_406_cold_1(a1, v5);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v3 = (CMContinuityCaptureTimeSyncClock *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870212 userInfo:0];
    id v4 = *(void (**)(void))(v6 + 16);
  }
  v4();
}

- (void)disposeTimeSyncClock
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_clockIdentifier != *MEMORY[0x263F7F278])
  {
    id v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clockIdentifier = self->_clockIdentifier;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v9 = 2048;
      unint64_t v10 = clockIdentifier;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ disposing timesync for %lld", buf, 0x16u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    BOOL v5 = (void *)MEMORY[0x263F7F258];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke;
    v6[3] = &unk_264C990F8;
    objc_copyWeak(&v7, (id *)buf);
    [v5 notifyWhenClockManagerIsAvailable:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F7F268];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke_2;
  v2[3] = &unk_264C990F8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 notifyWhengPTPManagerIsAvailable:v2];
  objc_destroyWeak(&v3);
}

void __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *MEMORY[0x263F7F278];
    if (WeakRetained[4] != *MEMORY[0x263F7F278])
    {
      id v4 = [MEMORY[0x263F7F268] sharedgPTPManager];
      uint64_t v5 = v2[4];
      id v10 = 0;
      [v4 removePTPInstanceWithIdentifier:v5 error:&v10];
      id v6 = v10;

      if (v6)
      {
        id v7 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = v2[4];
          __int16 v9 = [v6 localizedDescription];
          *(_DWORD *)buf = 138543874;
          id v12 = v2;
          __int16 v13 = 2048;
          uint64_t v14 = v8;
          __int16 v15 = 2114;
          id v16 = v9;
          _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed deallocate clock %lld with error %{public}@", buf, 0x20u);
        }
      }
      void v2[4] = v3;
    }
  }
}

- (void)_bindClock:(unint64_t)a3 peerAddress:(id)a4 retries:(int64_t)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void))a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  memset(v47, 0, sizeof(v47));
  memset(v38, 170, 20);
  v37[3] = (id)0xAAAAAAAAAAAAAAAALL;
  if (([v10 getCString:v47 maxLength:64 encoding:4] & 1) == 0)
  {
    __int16 v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:]((uint64_t)self);
    }
    goto LABEL_10;
  }
  int v12 = StringToSockAddr();
  if (v12)
  {
    __int16 v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      id v42 = self;
      __int16 v43 = 2113;
      unint64_t v44 = (unint64_t)v10;
      __int16 v45 = 1024;
      LODWORD(v46) = v12;
      uint64_t v14 = "%{public}@ Failed to parse peer address %{private}@. Error: %{errno}d";
LABEL_39:
      _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  int v15 = SockAddrConvertToIPv6();
  if (v15)
  {
    __int16 v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      id v42 = self;
      __int16 v43 = 2113;
      unint64_t v44 = (unint64_t)v10;
      __int16 v45 = 1024;
      LODWORD(v46) = v15;
      uint64_t v14 = "%{public}@ Failed to convert peer address %{private}@ to IPv6. Error: %{errno}d";
      goto LABEL_39;
    }
LABEL_10:

    v11[2](v11, 0);
    goto LABEL_11;
  }
  id v16 = [MEMORY[0x263F7F258] sharedClockManager];
  uint64_t v17 = [v16 clockWithClockIdentifier:a3];

  if (v17)
  {
    id v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v17 grandmasterIdentity];
      *(_DWORD *)buf = 138543874;
      id v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      __int16 v45 = 2048;
      uint64_t v46 = v19;
      _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock %llu available, grandmaster %llu", buf, 0x20u);
    }

    __int16 v33 = 0;
    memset(v40, 170, sizeof(v40));
    if (if_indextoname(v38[2], v40)
      && ([NSString stringWithCString:v40 encoding:4],
          (__int16 v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v21 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v42 = self;
        __int16 v43 = 2114;
        unint64_t v44 = (unint64_t)v20;
        _os_log_impl(&dword_235FC2000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Binding clock to %{public}@", buf, 0x16u);
      }

      id v32 = 0;
      char v22 = [v17 addUnicastUDPv6EtEPortOnInterfaceNamed:v20 withDestinationAddress:v38 allocatedPortNumber:&v33 error:&v32];
      id v23 = v32;
      if (v22)
      {
        uint64_t v24 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = self;
          _os_log_impl(&dword_235FC2000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock binding completed.", buf, 0xCu);
        }

        ((void (**)(id, void *))v11)[2](v11, v17);
      }
      else
      {
        char v30 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = [v23 localizedDescription];
          *(_DWORD *)buf = 138543875;
          id v42 = self;
          __int16 v43 = 2113;
          unint64_t v44 = (unint64_t)v10;
          __int16 v45 = 2114;
          uint64_t v46 = (uint64_t)v31;
          _os_log_error_impl(&dword_235FC2000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add UDPv6 peer address %{private}@. Error: %{public}@", buf, 0x20u);
        }
        v11[2](v11, 0);
      }
    }
    else
    {
      id v25 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:]((uint64_t)self);
      }

      v11[2](v11, 0);
      __int16 v20 = 0;
      id v23 = 0;
    }
  }
  else if (a5)
  {
    __int16 v26 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock %llu not available, retry with delay", buf, 0x16u);
    }

    dispatch_time_t v27 = dispatch_time(0, 100000000);
    uint64_t v28 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__CMContinuityCaptureRapportTransportBase__bindClock_peerAddress_retries_completion___block_invoke;
    block[3] = &unk_264C9AA58;
    objc_copyWeak(v37, &location);
    v37[1] = (id)a3;
    id v35 = v10;
    v37[2] = (id)a5;
    v36 = v11;
    dispatch_after(v27, v28, block);

    objc_destroyWeak(v37);
  }
  else
  {
    v29 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:]();
    }

    v11[2](v11, 0);
  }

LABEL_11:
  objc_destroyWeak(&location);
}

void __85__CMContinuityCaptureRapportTransportBase__bindClock_peerAddress_retries_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _bindClock:*(void *)(a1 + 56) peerAddress:*(void *)(a1 + 32) retries:*(void *)(a1 + 64) - 1 completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingStreamRequestHandler, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3_1(&dword_235FC2000, v2, v3, "%{public}@ TimeSync addgPTPServices Error %{public}@", v4, v5, v6, v7, 2u);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_cold_1(id *a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  id v10 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3_1(&dword_235FC2000, v4, v5, "%{public}@ Failed allocate clock with error %{public}@", v6, v7, v8, v9, 2u);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_406_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_235FC2000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create time sync clock, Stream setup requires valid time sync clock.", v4, 0xCu);
}

- (void)_bindClock:peerAddress:retries:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Exhausted all retries to acquire clock %llu");
}

- (void)_bindClock:(uint64_t)a1 peerAddress:retries:completion:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138543619;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v1, v2, "%{public}@ Failed to derive ifname from cifname for peer address %{private}@", (void)v3, DWORD2(v3));
}

- (void)_bindClock:(uint64_t)a1 peerAddress:retries:completion:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138543619;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v1, v2, "%{public}@ Failed to get peer address %{private}@", (void)v3, DWORD2(v3));
}

@end