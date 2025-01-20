@interface DTKTraceTapLocalDelegate
- (BOOL)canFetchWhileArchiving;
- (DTKTraceTapLocalDelegate)initWithConfig:(id)a3;
- (id)_getSessionMetadata;
- (id)validateConfig;
- (unint64_t)_clampBufferSize:(unint64_t)a3;
- (unint64_t)_triggerCount;
- (unint64_t)bufferSizeForConfiguration:(id)a3;
- (void)_sendStackshot;
- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4;
- (void)pause;
- (void)setTap:(id)a3;
- (void)start;
- (void)stop;
- (void)unpause;
@end

@implementation DTKTraceTapLocalDelegate

- (unint64_t)_clampBufferSize:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [v5 integerForKey:@"DTKPTapMaxRAMPercentage"];

  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  unint64_t v8 = [v7 integerForKey:@"DTKPTapMinRAMBytes"];

  uint64_t v9 = DTGetPhysicalMemorySize();
  if (v9)
  {
    uint64_t v10 = sBufferConstants;
    unint64_t v11 = unk_268705D98;
    if ((unint64_t)(v6 - 1) < 0x63) {
      uint64_t v10 = v6;
    }
    unint64_t v13 = v10 * v9;
    unint64_t v12 = (((unint64_t)(v10 * v9) >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64;
    if (unk_268705D98 <= a3) {
      unint64_t v11 = a3;
    }
    if (v8 > a3) {
      unint64_t v11 = v8;
    }
    if (v11 >= v12 >> 2) {
      return v13 / 0x64;
    }
    else {
      return v11;
    }
  }
  else
  {
    v15 = [[DTTapStatusMemo alloc] initWithStatus:2281701376 notice:@"Device reported 0 MB of physical memory"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    [WeakRetained _handleStatusMemo:v15];

    return 0;
  }
}

- (unint64_t)_triggerCount
{
  return [(NSMutableData *)self->_triggerIDs length] >> 2;
}

- (unint64_t)bufferSizeForConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = DTGetCoreCount();
  if (!v5)
  {
    uint64_t v9 = [[DTTapStatusMemo alloc] initWithStatus:2281701376 notice:@"Device reported 0 cores"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    [WeakRetained _handleStatusMemo:v9];
LABEL_19:

    unint64_t v18 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = [v4 bufferMode];
  if (!v6)
  {
    uint64_t v7 = 2 * [v4 pollingInterval];
    char v8 = 1;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    char v8 = 0;
    uint64_t v7 = 1000000000 * qword_268705DA0;
    goto LABEL_9;
  }
  if (v6 != 2)
  {
    v19 = [DTTapStatusMemo alloc];
    v20 = [NSString stringWithFormat:@"Unsupported buffer mode: %lu", [v4 bufferMode]];
    uint64_t v9 = [(DTTapStatusMemo *)v19 initWithStatus:2281701376 notice:v20];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    [WeakRetained _handleStatusMemo:v9];
    goto LABEL_19;
  }
  uint64_t v7 = [v4 windowSize];
  char v8 = 0;
LABEL_9:
  uint64_t v11 = 1000000000;
  if (v7) {
    uint64_t v11 = v7;
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_23088D130;
  v22[3] = &unk_264B8DB60;
  v22[4] = self;
  v22[5] = &v24;
  v22[6] = v11;
  char v23 = v8;
  [v4 enumerateTriggerConfigs:v22];
  uint64_t v12 = v25[3];
  if (DTCoreIs64BitCapable()) {
    char v13 = 6;
  }
  else {
    char v13 = 5;
  }
  v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v14 floatForKey:@"DTKPTapBufferScalingFactor"];
  float v16 = v15;
  unint64_t v17 = 101 * ((v12 * (unint64_t)v5) << v13) / 0x64;

  if (v16 == 0.0) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = (unint64_t)(float)(v16 * (float)v17);
  }
  _Block_object_dispose(&v24, 8);
LABEL_20:

  return v18;
}

- (id)_getSessionMetadata
{
  v3 = objc_opt_new();
  if (self->_triggerIDs)
  {
    id v4 = objc_opt_new();
    unsigned int v5 = [(NSMutableData *)self->_triggerIDs mutableBytes];
    if ([(DTKTraceTapLocalDelegate *)self _triggerCount])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = [NSNumber numberWithInt:v5[v6]];
        [v4 addObject:v7];

        ++v6;
      }
      while (v6 < [(DTKTraceTapLocalDelegate *)self _triggerCount]);
    }
    char v8 = objc_opt_new();
    config = self->_config;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_23088DC7C;
    v19[3] = &unk_264B8DB88;
    id v10 = v8;
    id v20 = v10;
    [(DTKTraceTapConfig *)config enumerateTriggerConfigs:v19];
    uint64_t v11 = [v4 count];
    if (v11 == [v10 count])
    {
      [v3 setObject:v4 forKeyedSubscript:@"triggerIDs"];
      [v3 setObject:v10 forKeyedSubscript:@"triggerUUIDs"];
      [v3 setObject:self->_actionIDsByTriggerIndex forKeyedSubscript:@"actionIDs"];
      if (!self->_usesRawKtraceFile)
      {
        id v18 = 0;
        if (!authorized_ktrace_file(0, (uint64_t)&v18)) {
          [v3 setObject:v18 forKeyedSubscript:@"ktrace"];
        }
      }
    }
    else
    {
      uint64_t v12 = (unsigned __int16)DTKTraceTapMetadataTriggerMismatchStatusCode | 0x80000000;
      char v13 = [DTTapStatusMemo alloc];
      v14 = [NSString stringWithFormat:@"The number of trigger IDs (%lu) does not match the number of trigger UUIDs (%lu)", objc_msgSend(v4, "count"), objc_msgSend(v10, "count")];
      float v15 = [(DTTapStatusMemo *)v13 initWithStatus:v12 notice:v14];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v15];
    }
  }
  return v3;
}

- (DTKTraceTapLocalDelegate)initWithConfig:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTKTraceTapLocalDelegate;
  unint64_t v6 = [(DTKTraceTapLocalDelegate *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v8 = DTKTraceTapLocalEventProducersForConfig(v5);
    localEventProducers = v7->_localEventProducers;
    v7->_localEventProducers = (NSArray *)v8;

    v7->_usesRawKtraceFile = 0;
  }

  return v7;
}

- (id)validateConfig
{
  return 0;
}

- (void)setTap:(id)a3
{
}

- (void)start
{
  p_session = &self->_session;
  if (!self->_session)
  {
    uint64_t v79 = 0;
    v80 = (id *)&v79;
    uint64_t v81 = 0x3032000000;
    v82 = sub_23088E6AC;
    v83 = sub_23088E6BC;
    id v84 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_23088E6C4;
    aBlock[3] = &unk_264B8DBB0;
    aBlock[4] = self;
    uint64_t v7 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    uint64_t v8 = objc_opt_new();
    if (!v8)
    {
      v7[2](v7, @"Failed to create a configuration.");
      char v13 = 0;
LABEL_39:

      _Block_object_dispose(&v79, 8);
      return;
    }
    uint64_t v9 = [(DTKTraceTapConfig *)self->_config providerOptions];
    [v8 setProviderOptions:v9];

    [v8 setCollectionInterval:-[DTKTraceTapConfig collectionInterval](self->_config, "collectionInterval")];
    BOOL v10 = [(DTKTraceTapConfig *)self->_config canUseRawKtraceFile];
    objc_super v11 = off_264B8CC18;
    self->_usesRawKtraceFile = v10;
    if (!v10) {
      objc_super v11 = off_264B8CC20;
    }
    uint64_t v12 = (void *)[objc_alloc(*v11) initWithConfig:v8];
    if (v12)
    {
      char v13 = [[DTKPSession alloc] initWithConfig:v8 andAggregator:v12];
      if (v13)
      {
        [(DTKPSession *)v13 setRecordingPriority:[(DTKTraceTapConfig *)self->_config recordingPriority]];
        unint64_t v14 = [(DTTapConfig *)self->_config bufferMode];
        if (v14 >= 3)
        {
          float v16 = [DTTapStatusMemo alloc];
          unint64_t v17 = [NSString stringWithFormat:@"Unsupported buffer mode: %lu", -[DTTapConfig bufferMode](self->_config, "bufferMode")];
          id v18 = [(DTTapStatusMemo *)v16 initWithStatus:2281701376 notice:v17];

          id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
          [WeakRetained _handleStatusMemo:v18];
        }
        else
        {
          [v8 setCollectionMode:(0x30202u >> (8 * v14)) & 3];
        }
        unint64_t v20 = [(DTKTraceTapConfig *)self->_config bufferSizeOverride];
        if (v20)
        {
          if ([(DTKTraceTapConfig *)self->_config bufferSizeOverrideClamping]) {
            [(DTKTraceTapLocalDelegate *)self _clampBufferSize:v20];
          }
        }
        else
        {
          unint64_t v20 = [(DTKTraceTapLocalDelegate *)self _clampBufferSize:[(DTKTraceTapLocalDelegate *)self bufferSizeForConfiguration:self->_config]];
          if (!v20) {
            goto LABEL_22;
          }
        }
        [v8 setBufferSize:v20];
LABEL_22:
        uint64_t v72 = 0;
        v73 = &v72;
        uint64_t v74 = 0x3032000000;
        v75 = sub_23088E6AC;
        v76 = sub_23088E6BC;
        id v77 = (id)objc_opt_new();
        uint64_t v66 = 0;
        v67 = &v66;
        uint64_t v68 = 0x3032000000;
        v69 = sub_23088E6AC;
        v70 = sub_23088E6BC;
        id v71 = (id)objc_opt_new();
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = sub_23088E6AC;
        v64 = sub_23088E6BC;
        id v65 = (id)objc_opt_new();
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        int v59 = 0;
        config = self->_config;
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = sub_23088E750;
        v48[3] = &unk_264B8DBD8;
        id v49 = v8;
        v50 = self;
        v51 = &v60;
        v52 = &v56;
        v53 = &v79;
        v54 = &v66;
        v55 = &v72;
        [(DTKTraceTapConfig *)config enumerateTriggerConfigs:v48];
        if ([(DTTapConfig *)self->_config bufferMode] != 2)
        {
          if ([(DTTapConfig *)self->_config isDeferredDisplay])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_copyWeak(to, (id *)&self->_tap);
              id v22 = v12;
              v46[0] = MEMORY[0x263EF8330];
              v46[1] = 3221225472;
              v46[2] = sub_23088ED54;
              v46[3] = &unk_264B8DC00;
              objc_copyWeak(&v47, to);
              [v22 setCallback:v46];
              objc_destroyWeak(&v47);

              objc_destroyWeak(to);
            }
          }
        }
        char v23 = v80;
        id obj = v80[5];
        BOOL v24 = [(DTKPSession *)v13 start:&obj];
        objc_storeStrong(v23 + 5, obj);
        if (v24)
        {
          [(NSArray *)self->_localEventProducers enumerateObjectsUsingBlock:&unk_26E515528];
          if (!self->_usesRawKtraceFile) {
            [(DTKTraceTapLocalDelegate *)self _sendStackshot];
          }
          v25 = (NSMutableArray *)objc_opt_new();
          actionIDsByTriggerIndex = self->_actionIDsByTriggerIndex;
          self->_actionIDsByTriggerIndex = v25;

          uint64_t v27 = [MEMORY[0x263EFF990] dataWithLength:4 * *((unsigned int *)v57 + 6)];
          triggerIDs = self->_triggerIDs;
          self->_triggerIDs = v27;

          v29 = [(NSMutableData *)self->_triggerIDs mutableBytes];
          to[0] = 0;
          to[1] = to;
          to[2] = (id)0x2020000000;
          to[3] = 0;
          if ([(id)v73[5] count])
          {
            v30 = (void *)v73[5];
            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            v43[2] = sub_23088EDB0;
            v43[3] = &unk_264B8DC48;
            v43[5] = to;
            v43[6] = v29;
            v43[4] = self;
            [v30 enumerateObjectsUsingBlock:v43];
          }
          if ([(id)v67[5] count])
          {
            v31 = (void *)v67[5];
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = sub_23088EE58;
            v42[3] = &unk_264B8DC70;
            v42[5] = to;
            v42[6] = v29;
            v42[4] = self;
            [v31 enumerateObjectsUsingBlock:v42];
          }
          if ([(id)v61[5] count])
          {
            v32 = (void *)v61[5];
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = sub_23088EF00;
            v41[3] = &unk_264B8DC98;
            v41[5] = to;
            v41[6] = v29;
            v41[4] = self;
            [v32 enumerateObjectsUsingBlock:v41];
          }
          _Block_object_dispose(to, 8);
        }
        else
        {
          v33 = [DTTapStatusMemo alloc];
          v34 = NSString;
          v35 = [v80[5] localizedDescription];
          v36 = [v34 stringWithFormat:@"Failed to start the recording: %@", v35];
          v37 = [(DTTapStatusMemo *)v33 initWithStatus:0x80000000 notice:v36];

          id v38 = objc_loadWeakRetained((id *)&self->_tap);
          [v38 _handleStatusMemo:v37];
        }
        objc_storeStrong((id *)p_session, v13);
        v39 = [(DTKTraceTapLocalDelegate *)self _getSessionMetadata];
        [(DTTapConfig *)self->_config _runningMetadataChanged:v39];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);

        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(&v72, 8);

        goto LABEL_38;
      }
      float v15 = @"Failed to create a Ktrace session.";
    }
    else
    {
      float v15 = @"Failed to create an aggregator";
    }
    v7[2](v7, v15);
    char v13 = 0;
LABEL_38:

    goto LABEL_39;
  }
  id v4 = [DTTapStatusMemo alloc];
  id v5 = [NSString stringWithFormat:@"Tried to start a tap while it's already running"];
  v40 = [(DTTapStatusMemo *)v4 initWithStatus:0x80000000 notice:v5];

  id v6 = objc_loadWeakRetained((id *)&self->_tap);
  [v6 _handleStatusMemo:v40];
}

- (void)stop
{
  if (self->_session)
  {
    [(NSArray *)self->_localEventProducers enumerateObjectsUsingBlock:&unk_26E515BE8];
    session = self->_session;
    id v11 = 0;
    [(DTKPSession *)session stop:&v11];
    id v4 = v11;
    if (v4)
    {
      id v5 = [DTTapStatusMemo alloc];
      id v6 = NSString;
      uint64_t v7 = [v4 localizedDescription];
      uint64_t v8 = [v6 stringWithFormat:@"Failed to stop recording session: %@ ", v7];
      uint64_t v9 = [(DTTapStatusMemo *)v5 initWithStatus:0x80000000 notice:v8];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v9];
    }
    self->_stopWasCalled = 1;
  }
}

- (void)pause
{
  if (self->_usesRawKtraceFile)
  {
    id v3 = 0;
  }
  else
  {
    session = self->_session;
    id v12 = 0;
    BOOL v5 = [(DTKPSession *)session pause:&v12];
    id v3 = v12;
    if (!v5)
    {
      id v6 = [DTTapStatusMemo alloc];
      uint64_t v7 = NSString;
      uint64_t v8 = [v3 localizedDescription];
      uint64_t v9 = [v7 stringWithFormat:@"Failed to pause recording session: %@ ", v8];
      BOOL v10 = [(DTTapStatusMemo *)v6 initWithStatus:0x80000000 notice:v9];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v10];
    }
  }
  [(NSArray *)self->_localEventProducers enumerateObjectsUsingBlock:&unk_26E515C28];
}

- (void)unpause
{
  if (self->_usesRawKtraceFile)
  {
    id v3 = 0;
  }
  else
  {
    session = self->_session;
    id v12 = 0;
    BOOL v5 = [(DTKPSession *)session resume:&v12];
    id v3 = v12;
    if (!v5)
    {
      id v6 = [DTTapStatusMemo alloc];
      uint64_t v7 = NSString;
      uint64_t v8 = [v3 localizedDescription];
      uint64_t v9 = [v7 stringWithFormat:@"Failed to resume recording session: %@ ", v8];
      BOOL v10 = [(DTTapStatusMemo *)v6 initWithStatus:0x80000000 notice:v9];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v10];
    }
  }
  [(NSArray *)self->_localEventProducers enumerateObjectsUsingBlock:&unk_26E515C48];
}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, void *, uint64_t))a4;
  if (a3 == 2) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_opt_new();
  [v8 setTapVersion:0x10000];
  [v8 setIsSession:1];
  [v8 setTriggerCount:-[DTKTraceTapLocalDelegate _triggerCount](self, "_triggerCount")];
  uint64_t v9 = (void *)[(NSMutableData *)self->_triggerIDs copy];
  [v8 setTriggerIDs:v9];

  [v8 setIsRawKtraceFile:self->_usesRawKtraceFile];
  session = self->_session;
  uint64_t v15 = 0;
  id v11 = [(DTKPSession *)session swapOutCurrentDatastream:&v15];
  if ([v11 hasData])
  {
    [v8 setDatastream:v11];
    [v8 setSupportsPeek:1];
    BOOL v13 = a3 == 1 && self->_stopWasCalled;
    [v8 setFinalMemo:v13];
    v6[2](v6, v8, 1);
  }
  else
  {
    unint64_t v14 = [[DTTapHeartbeatMemo alloc] initWithTimestamp:v7];
    v6[2](v6, v14, 1);
  }
}

- (void)_sendStackshot
{
  id v9 = 0;
  int v3 = authorized_stackshot_collect(0, &v9);
  id v4 = v9;
  if (!v3)
  {
    BOOL v5 = objc_opt_new();
    [v5 setIsSession:0];
    [v5 setSupportsPeek:0];
    [v5 setStackshot:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    uint64_t v7 = [WeakRetained memoHandler];
    id v8 = (id)[v7 handleMemo:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEventProducers, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_actionIDsByTriggerIndex, 0);
  objc_storeStrong((id *)&self->_triggerIDs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end