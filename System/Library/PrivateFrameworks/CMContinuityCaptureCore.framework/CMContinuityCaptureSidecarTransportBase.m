@interface CMContinuityCaptureSidecarTransportBase
- (CMContinuityCaptureSidecarTransportBase)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5;
- (CMContinuityCaptureTransportSidecarDevice)device;
- (NSString)description;
- (id)debugInfo;
- (void)_enqueueResponse:(id)a3 identifier:(id)a4;
- (void)createTimeSyncClockForSession:(id)a3 completion:(id)a4;
- (void)enqueueResponse:(id)a3 identifier:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetDevice:(id)a3;
- (void)setTaskDelegate:(id)a3;
- (void)setupSidecarStreams;
- (void)teardownSidecarStreams;
@end

@implementation CMContinuityCaptureSidecarTransportBase

- (CMContinuityCaptureSidecarTransportBase)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CMContinuityCaptureSidecarTransportBase;
  v12 = [(CMContinuityCaptureSidecarTransportBase *)&v28 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_10;
  }
  objc_storeWeak((id *)&v12->_delegate, v11);
  objc_storeStrong((id *)&v13->_device, a3);
  objc_storeStrong((id *)&v13->_queue, a4);
  uint64_t v14 = CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
  sidebandIdentfiers = v13->_sidebandIdentfiers;
  v13->_sidebandIdentfiers = (NSArray *)v14;

  v16 = [v9 capabilities];
  uint64_t v17 = CMContinuityCaptureMediaIdentfiersForCapabilities(v16);
  mediaIdentfiers = v13->_mediaIdentfiers;
  v13->_mediaIdentfiers = (NSArray *)v17;

  objc_storeStrong((id *)&v13->_device, a3);
  uint64_t v19 = [v9 capabilities];
  if (!v19) {
    goto LABEL_7;
  }
  v20 = (void *)v19;
  v21 = [v9 capabilities];
  v22 = [v21 devicesCapabilities];
  uint64_t v23 = [v22 count];

  if (!v23)
  {
LABEL_7:
    v25 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v9 capabilities];
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      __int16 v31 = 2048;
      v32 = v26;
      _os_log_impl(&dword_235FC2000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid capabilities %p", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (!v13->_queue || !v13->_device)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_11;
  }
  v24 = v13;
LABEL_11:

  return v24;
}

- (void)resetDevice:(id)a3
{
}

- (void)setTaskDelegate:(id)a3
{
  id obj = a3;
  if ([(CMContinuityCaptureTransportSidecarDevice *)self->_device remote]) {
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
  v11[2] = __70__CMContinuityCaptureSidecarTransportBase_enqueueResponse_identifier___block_invoke;
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

void __70__CMContinuityCaptureSidecarTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1)
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
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!WeakRetained) {
    goto LABEL_19;
  }
  id v9 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
  if (!v9)
  {
    id v19 = 0;
    goto LABEL_21;
  }
  id v10 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
  BOOL v11 = v10 == 0;

  if (v11) {
    goto LABEL_19;
  }
  id v12 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_19;
  }
  id v14 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
    v16 = [v6 objectForKeyedSubscript:@"ContinuityCaptureGID"];
    *(_DWORD *)buf = 138544130;
    v139 = self;
    __int16 v140 = 2114;
    *(void *)v141 = v7;
    *(_WORD *)&v141[8] = 2114;
    unint64_t v142 = (unint64_t)v15;
    __int16 v143 = 2114;
    v144 = v16;
    _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueResponse identifier:%{public}@ selector %{public}@ gid %{public}@", buf, 0x2Au);
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"ContinuityCaptureArgs"];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
LABEL_19:
    id v19 = 0;
    goto LABEL_20;
  }
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
          goto LABEL_20;
        }
        v25 = [v19 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) == 0) {
          goto LABEL_20;
        }
        v27 = [v19 objectAtIndexedSubscript:1];
        objc_opt_class();
        char v28 = objc_opt_isKindOfClass();

        if ((v28 & 1) == 0) {
          goto LABEL_20;
        }
        v29 = [v19 objectAtIndexedSubscript:2];
        objc_opt_class();
        char v30 = objc_opt_isKindOfClass();

        if ((v30 & 1) == 0) {
          goto LABEL_20;
        }
        __int16 v31 = [(CMContinuityCaptureSidecarTransportBase *)self device];
        char v32 = [v31 remote];

        if (v32) {
          goto LABEL_20;
        }
        uint64_t v33 = (void *)MEMORY[0x263F08928];
        uint64_t v34 = objc_opt_class();
        v35 = [v19 objectAtIndexedSubscript:0];
        id v130 = 0;
        v36 = [v33 unarchivedObjectOfClass:v34 fromData:v35 error:&v130];
        id v23 = v130;

        if (v36)
        {
          v37 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [v19 objectAtIndexedSubscript:1];
            int v39 = [v38 unsignedIntValue];
            *(_DWORD *)buf = 138543874;
            v139 = self;
            __int16 v140 = 2114;
            *(void *)v141 = v36;
            *(_WORD *)&v141[8] = 1024;
            LODWORD(v142) = v39;
            _os_log_impl(&dword_235FC2000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);
          }
          v40 = [v19 objectAtIndexedSubscript:1];
          unsigned int v41 = [v40 unsignedIntValue];
          v127[0] = MEMORY[0x263EF8330];
          v127[1] = 3221225472;
          v127[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_308;
          v127[3] = &unk_264C996D8;
          objc_copyWeak(&v129, &location);
          id v42 = v36;
          id v128 = v42;
          [WeakRetained startStream:v42 option:v41 completion:v127];

          objc_destroyWeak(&v129);
        }
        else
        {
          v121 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
          }
        }
        goto LABEL_57;
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

              if (v85)
              {
                v86 = [(CMContinuityCaptureSidecarTransportBase *)self device];
                char v87 = [v86 remote];

                if ((v87 & 1) == 0)
                {
                  v88 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    v89 = [v19 objectAtIndexedSubscript:0];
                    int v90 = [v89 unsignedIntValue];
                    v91 = [v19 objectAtIndexedSubscript:1];
                    int v92 = [v91 unsignedIntValue];
                    *(_DWORD *)buf = 138543874;
                    v139 = self;
                    __int16 v140 = 1024;
                    *(_DWORD *)v141 = v90;
                    *(_WORD *)&v141[4] = 1024;
                    *(_DWORD *)&v141[6] = v92;
                    _os_log_impl(&dword_235FC2000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);
                  }
                  v93 = [v19 objectAtIndexedSubscript:0];
                  unsigned int v94 = [v93 unsignedIntValue];
                  v95 = [v19 objectAtIndexedSubscript:1];
                  unsigned int v96 = [v95 unsignedIntValue];
                  v124[0] = MEMORY[0x263EF8330];
                  v124[1] = 3221225472;
                  v124[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_309;
                  v124[3] = &unk_264C996D8;
                  objc_copyWeak(&v126, &location);
                  id v19 = v19;
                  id v125 = v19;
                  [WeakRetained stopStream:v94 option:v96 completion:v124];

                  objc_destroyWeak(&v126);
                }
              }
            }
          }
        }
        goto LABEL_20;
      case 2:
        if (!v19) {
          goto LABEL_20;
        }
        if ([v19 count] != 2) {
          goto LABEL_20;
        }
        v105 = [v19 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v106 = objc_opt_isKindOfClass();

        if ((v106 & 1) == 0) {
          goto LABEL_20;
        }
        v107 = [v19 objectAtIndexedSubscript:1];
        objc_opt_class();
        char v108 = objc_opt_isKindOfClass();

        if ((v108 & 1) == 0) {
          goto LABEL_20;
        }
        id v9 = [v19 objectAtIndexedSubscript:0];
        v109 = [v19 objectAtIndexedSubscript:1];
        unsigned int v110 = [v109 unsignedIntValue];
        v136 = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
        v111 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
        v137 = v111;
        v112 = [NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
        [WeakRetained postEvent:v9 entity:v110 data:v112];

        goto LABEL_21;
      case 3:
        if ([v19 count])
        {
          v113 = [v19 objectAtIndexedSubscript:0];
        }
        else
        {
          v113 = 0;
        }
        if ((unint64_t)[v19 count] < 2)
        {
          v115 = 0;
        }
        else
        {
          v115 = [v19 objectAtIndexedSubscript:1];
        }
        if ((unint64_t)[v19 count] < 3)
        {
          v116 = 0;
        }
        else
        {
          v116 = [v19 objectAtIndexedSubscript:2];
        }
        v117 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          v118 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v116, "unsignedLongLongValue"));
          *(_DWORD *)buf = 138544130;
          v139 = self;
          __int16 v140 = 2112;
          *(void *)v141 = v113;
          *(_WORD *)&v141[8] = 2112;
          unint64_t v142 = (unint64_t)v115;
          __int16 v143 = 2112;
          v144 = v118;
          _os_log_impl(&dword_235FC2000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);
        }
        objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v113, "unsignedLongLongValue"), objc_msgSend(v115, "unsignedLongLongValue"), objc_msgSend(v116, "unsignedLongLongValue"));

        goto LABEL_20;
      case 4:
        v114 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v139 = self;
          _os_log_impl(&dword_235FC2000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
        }

        [WeakRetained handleSynchronizeAudioClockCompletion];
        goto LABEL_20;
      case 5:
        if (!v19) {
          goto LABEL_20;
        }
        if ([v19 count] != 2) {
          goto LABEL_20;
        }
        v69 = [v19 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v70 = objc_opt_isKindOfClass();

        if ((v70 & 1) == 0) {
          goto LABEL_20;
        }
        v71 = [v19 objectAtIndexedSubscript:1];
        objc_opt_class();
        char v72 = objc_opt_isKindOfClass();

        if ((v72 & 1) == 0) {
          goto LABEL_20;
        }
        v73 = (void *)MEMORY[0x263F08928];
        uint64_t v74 = objc_opt_class();
        v75 = [v19 objectAtIndexedSubscript:0];
        id v134 = 0;
        v76 = [v73 unarchivedObjectOfClass:v74 fromData:v75 error:&v134];
        id v23 = v134;

        if (v76)
        {
          v77 = [v19 objectAtIndexedSubscript:1];
          unsigned int v78 = [v77 unsignedIntValue];

          v79 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v139 = self;
            __int16 v140 = 2112;
            *(void *)v141 = v76;
            *(_WORD *)&v141[8] = 2048;
            unint64_t v142 = v78;
            _os_log_impl(&dword_235FC2000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
          }

          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke;
          v131[3] = &unk_264C99B40;
          objc_copyWeak(v133, &location);
          id v132 = v76;
          v133[1] = (id)v78;
          [WeakRetained captureStillImage:v132 entity:v78 completion:v131];

          objc_destroyWeak(v133);
        }
        else
        {
          v120 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
          }
        }
        goto LABEL_57;
      case 6:
      case 7:
        goto LABEL_23;
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
                  v139 = self;
                  __int16 v140 = 2112;
                  *(void *)v141 = v101;
                  *(_WORD *)&v141[8] = 2048;
                  unint64_t v142 = v103;
                  _os_log_impl(&dword_235FC2000, v104, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                }

                [WeakRetained enqueueReactionEffect:v101 entity:v103];
              }
            }
          }
        }
        goto LABEL_20;
      default:
        goto LABEL_43;
    }
  }
  if (![v7 isEqualToString:@"ContinuityCaptureControl"])
  {
    if ([v7 isEqualToString:@"ContinuityCaptureData"])
    {
      v51 = [v6 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
      uint64_t v52 = [v51 unsignedIntegerValue];

      id v9 = 0;
      if (v52 || !v19)
      {
LABEL_43:
        id v23 = 0;
        v24 = 0;
        goto LABEL_23;
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
            id v122 = 0;
            v60 = [v57 unarchivedObjectOfClass:v58 fromData:v59 error:&v122];
            id v23 = v122;

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

            goto LABEL_57;
          }
        }
      }
    }
    goto LABEL_20;
  }
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
    goto LABEL_20;
  }
  if (v44 != 1
    || !v19
    || [v19 count] != 1
    || ([v19 objectAtIndexedSubscript:0],
        v45 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v46 = objc_opt_isKindOfClass(),
        v45,
        (v46 & 1) == 0))
  {
LABEL_20:
    id v9 = 0;
LABEL_21:
    id v23 = 0;
LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  v47 = (void *)MEMORY[0x263F08928];
  uint64_t v48 = objc_opt_class();
  v49 = [v19 objectAtIndexedSubscript:0];
  id v123 = 0;
  v24 = [v47 unarchivedObjectOfClass:v48 fromData:v49 error:&v123];
  id v23 = v123;

  if (!v24)
  {
    v119 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:]();
    }

LABEL_57:
    id v9 = 0;
    goto LABEL_22;
  }
  v50 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v139 = self;
    __int16 v140 = 2114;
    *(void *)v141 = v24;
    _os_log_impl(&dword_235FC2000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
  }

  [WeakRetained setValueForControl:v24 completion:&__block_literal_global_313];
  id v9 = 0;
LABEL_23:
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    id v6 = WeakRetained;
    [*(id *)(a1 + 32) setError:a2];
    v5 = [v6 device];
    [v5 didCaptureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];

    id WeakRetained = v6;
  }
}

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_308(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = CMContinuityCaptureLog(2);
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

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_309(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = CMContinuityCaptureLog(2);
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

- (void)teardownSidecarStreams
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    v5 = self;
    __int16 v6 = 2080;
    int v7 = "-[CMContinuityCaptureSidecarTransportBase teardownSidecarStreams]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v4, 0x16u);
  }

  [(CMContinuityCaptureTransportSidecarDevice *)self->_device teardownStreams];
  self->_pendingTimeSyncCallback = 0;
}

- (void)setupSidecarStreams
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v41 = self;
    __int16 v42 = 2080;
    v43 = "-[CMContinuityCaptureSidecarTransportBase setupSidecarStreams]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v4 = (void *)CFPreferencesCopyAppValue(@"MediaStreamTypeForAudio", @"com.apple.coremedia");
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v5) = [v4 unsignedIntValue];
    __int16 v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v41 = self;
      __int16 v42 = 1024;
      LODWORD(v43) = v5;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ MediaStreamTypeForAudio (SidecarStream setup) %u", buf, 0x12u);
    }

    uint64_t v5 = v5;
  }
  else
  {
    uint64_t v5 = 3;
  }
  int v7 = (void *)CFPreferencesCopyAppValue(@"MediaStreamTypeForVideo", @"com.apple.coremedia");

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v8) = [v7 unsignedIntValue];
    __int16 v9 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v41 = self;
      __int16 v42 = 1024;
      LODWORD(v43) = v8;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ MediaStreamTypeForVideo (SidecarStream setup) %u", buf, 0x12u);
    }

    uint64_t v8 = v8;
  }
  else
  {
    uint64_t v8 = 3;
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke;
  v35[3] = &unk_264C9A250;
  objc_copyWeak(&v36, &location);
  uint64_t v10 = (void *)MEMORY[0x237DFB780](v35);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_325;
  v32[3] = &unk_264C9A2A0;
  objc_copyWeak(&v34, &location);
  id v23 = v10;
  id v33 = v23;
  __int16 v11 = (void *)MEMORY[0x237DFB780](v32);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = self->_sidebandIdentfiers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        [(CMContinuityCaptureSidecarTransportBase *)self setupSidebandSidecarStreamForIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * i) type:2 completion:v11];
      }
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v13);
  }

  uint64_t v22 = v7;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v16 = self->_mediaIdentfiers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if (objc_msgSend(v20, "isEqualToString:", @"ContinuityCaptureMediaMicrophone", v22)) {
          uint64_t v21 = v5;
        }
        else {
          uint64_t v21 = v8;
        }
        [(CMContinuityCaptureSidecarTransportBase *)self setupMediaSidecarStreamForIdentifier:v20 type:v21 completion:v11];
      }
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v17);
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v9 = (id *)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 2));
    uint64_t v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_loadWeakRetained(v7);
      if (v5)
      {
        uint64_t v12 = [v5 identifier];
      }
      else
      {
        uint64_t v12 = 0;
      }
      int v16 = 138543874;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setupStream completion for %@ error %@", (uint8_t *)&v16, 0x20u);
      if (v5) {
    }
      }
    uint64_t v13 = [CMContinuityCaptureTransportDeviceSidecarStream alloc];
    uint64_t v14 = [v5 identifier];
    v15 = [(CMContinuityCaptureTransportDeviceSidecarStream *)v13 initWithSidecarStream:v5 entity:CMContinuityCaptureEntityTypeFromMediaIdentifer(v14) messageDelegate:v9];

    [v9[1] activateStream:v15];
  }
}

void __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v9 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_2;
    block[3] = &unk_264C9A278;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createTimeSyncClockForSession:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6 && !self->_pendingTimeSyncCallback)
  {
    self->_pendingTimeSyncCallback = 1;
    uint64_t v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      __int16 v16 = 2080;
      id v17 = "-[CMContinuityCaptureSidecarTransportBase createTimeSyncClockForSession:completion:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for session %@", buf, 0x20u);
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke;
    v9[3] = &unk_264C9A2F0;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    [v10 timeSyncWithCompletion:v9];

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(a1 + 6);
      *(_DWORD *)buf = 138543874;
      id v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got time sync clockIdentifier %llu from sidecar session. Error: %@", buf, 0x20u);
    }
    __int16 v9 = WeakRetained[2];
    if (v5)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_326;
      block[3] = &unk_264C99148;
      id v10 = (id *)&v17;
      id v17 = WeakRetained;
      dispatch_async(v9, block);
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2;
      v11[3] = &unk_264C9A2C8;
      id v10 = (id *)&v12;
      id v12 = WeakRetained;
      uint64_t v15 = a2;
      id v13 = a1[4];
      id v14 = a1[5];
      dispatch_async(v9, v11);
    }
  }
}

uint64_t __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_326(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2(void *a1)
{
  v2 = a1 + 4;
  *(unsigned char *)(a1[4] + 32) = 0;
  id v3 = [[CMContinuityCaptureTimeSyncClock alloc] initWithClockIdentifier:a1[7]];
  int v4 = v3;
  if (v3)
  {
    [(CMContinuityCaptureTimeSyncClock *)v3 startEmittingHeartBeatSignposts];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2_cold_1(v2, (uint64_t)a1, v5);
    }

    uint64_t v6 = a1[6];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870212 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (id)debugInfo
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureSidecarTransportBase *)self device];
  id v7 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v6, self];

  return (NSString *)v7;
}

- (CMContinuityCaptureTransportSidecarDevice)device
{
  return (CMContinuityCaptureTransportSidecarDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentfiers, 0);
  objc_storeStrong((id *)&self->_sidebandIdentfiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_enqueueResponse:identifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%@ error unarchivedObjectOfClass CMContinuityCaptureStillImageRequest %@");
}

- (void)_enqueueResponse:identifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ error unarchivedObjectOfClass %@");
}

- (void)_enqueueResponse:identifier:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ error unarchivedObjectOfClass CMContinuityCaptureStillImageRequest %@");
}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 40);
  OUTLINED_FUNCTION_2(&dword_235FC2000, a2, a3, "%{public}@ Failed to create time sync clock from session %@, Stream setup requires valid time sync clock.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end