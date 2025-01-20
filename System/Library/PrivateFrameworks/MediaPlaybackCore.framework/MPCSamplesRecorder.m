@interface MPCSamplesRecorder
- (BOOL)isStoringSamples;
- (MPCFirstFailureDetector)firstFailureDetector;
- (MPCSamplesRecorder)initWithRecordID:(id)a3 modelID:(id)a4 firstFailureDetector:(id)a5 shouldStoreSamples:(BOOL)a6 delegate:(id)a7;
- (MPCSamplesRecorderDelegate)delegate;
- (NSMutableArray)samples;
- (NSString)modelID;
- (NSString)recordID;
- (double)max;
- (double)mean;
- (double)min;
- (double)rms;
- (id)description;
- (id)dictionaryRepresentation;
- (id)flushSamplesToCSVDataWithHeader:(BOOL)a3;
- (int)glitches;
- (int)numberOfSamples;
- (int)thermalLevel;
- (void)recordSample:(id)a3;
@end

@implementation MPCSamplesRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFailureDetector, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (MPCFirstFailureDetector)firstFailureDetector
{
  return self->_firstFailureDetector;
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (BOOL)isStoringSamples
{
  return self->_storingSamples;
}

- (int)thermalLevel
{
  return self->_thermalLevel;
}

- (int)glitches
{
  return self->_glitches;
}

- (double)rms
{
  return self->_rms;
}

- (double)mean
{
  return self->_mean;
}

- (double)max
{
  return self->_max;
}

- (double)min
{
  return self->_min;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (MPCSamplesRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCSamplesRecorderDelegate *)WeakRetained;
}

- (id)flushSamplesToCSVDataWithHeader:(BOOL)a3
{
  if ([(MPCSamplesRecorder *)self isStoringSamples])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__2298;
    v14 = __Block_byref_object_dispose__2299;
    id v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MPCSamplesRecorder_flushSamplesToCSVDataWithHeader___block_invoke;
    block[3] = &unk_2643BF148;
    BOOL v9 = a3;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(accessQueue, block);
    id v6 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __54__MPCSamplesRecorder_flushSamplesToCSVDataWithHeader___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "count"));
  v3 = v2;
  if (*(unsigned char *)(v1 + 48))
  {
    v4 = [NSString stringWithFormat:@"Number,State,Level,Time [ms],Thermal"];
    [v3 addObject:v4];
  }
  else
  {
    [v2 addObject:&stru_26CBCA930];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [*(id *)(v1 + 32) samples];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v22 = v1;
    v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
        uint64_t v12 = NSString;
        uint64_t v13 = [v11 number];
        uint64_t v14 = [v11 state];
        [v11 level];
        uint64_t v16 = v15;
        [v11 time];
        v7 = objc_msgSend(v12, "stringWithFormat:", @"%d,%ld,%3.2f,%3.2f,%d", v13, v14, v16, v17, objc_msgSend(v11, "thermalLevel"));

        [v3 addObject:v7];
        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);

    uint64_t v1 = v22;
  }

  v18 = [v3 componentsJoinedByString:@"\n"];
  uint64_t v19 = [v18 dataUsingEncoding:134217984 allowLossyConversion:1];
  uint64_t v20 = *(void *)(*(void *)(v1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  [*(id *)(*(void *)(v1 + 32) + 104) removeAllObjects];
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2298;
  v11 = __Block_byref_object_dispose__2299;
  id v12 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:7];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__MPCSamplesRecorder_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_2643C67A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__MPCSamplesRecorder_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = (double)*(int *)(v2 + 8);
  [*(id *)(v2 + 112) samplingTime];
  double v5 = v4 * v3 / 1000.0;
  uint64_t v6 = [NSNumber numberWithDouble:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:@"duration"];

  uint64_t v7 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v7 forKeyedSubscript:@"max"];

  uint64_t v8 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:@"mean"];

  uint64_t v9 = [NSNumber numberWithDouble:sqrt(*(double *)(*(void *)(a1 + 32) + 96))];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:@"sigma"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(*(void *)(a1 + 32) + 64) forKeyedSubscript:@"MLModel"];
  uint64_t v10 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 36)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKeyedSubscript:@"glitches"];

  v11 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v11 forKeyedSubscript:@"thermal"];

  id v12 = [NSNumber numberWithDouble:(double)*(int *)(*(void *)(a1 + 32) + 36) * 3600.0 / v5];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v12 forKeyedSubscript:@"FPH"];

  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 112) singleSampleFailure];

  if (v13)
  {
    uint64_t v14 = NSNumber;
    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 112) singleSampleFailure];
    [v15 startTime];
    uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:@"TFSF"];
  }
  uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 112) multiSamplesFailure];

  if (v17)
  {
    v18 = NSNumber;
    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 112) multiSamplesFailure];
    [v19 startTime];
    uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v20 forKeyedSubscript:@"TFMF"];

    v21 = NSNumber;
    id v23 = [*(id *)(*(void *)(a1 + 32) + 112) multiSamplesFailure];
    [v23 duration];
    uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v22 forKeyedSubscript:@"DFMF"];
  }
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2298;
  uint64_t v10 = __Block_byref_object_dispose__2299;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__MPCSamplesRecorder_description__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__MPCSamplesRecorder_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v2 stringWithFormat:@"<%@: %p - RecordID:%@ - ModelID:%@ - mean: %2.5fms - std: %2.5fms - min: %2.5fms - max: %2.5fms - samples: %d - glitches: %d - thermal level: %d>", v3, v4, *(void *)(v4 + 56), *(void *)(v4 + 64), *(void *)(v4 + 88), sqrt(*(double *)(v4 + 96)), *(void *)(v4 + 72), *(void *)(v4 + 80), *(unsigned int *)(v4 + 8), *(unsigned int *)(v4 + 36), *(unsigned int *)(v4 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int)numberOfSamples
{
  return self->_k;
}

- (void)recordSample:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__MPCSamplesRecorder_recordSample___block_invoke;
  v7[3] = &unk_2643C5EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __35__MPCSamplesRecorder_recordSample___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isStoringSamples])
  {
    uint64_t v2 = [*(id *)(a1 + 32) samples];
    [v2 addObject:*(void *)(a1 + 40)];

    uint64_t v3 = [*(id *)(a1 + 32) samples];
    unint64_t v4 = [v3 count];

    if (v4 >= 0x191)
    {
      uint64_t v5 = [*(id *)(a1 + 32) delegate];
      [v5 samplesRecorderHasNewSamples:*(void *)(a1 + 32)];
    }
  }
  id v6 = [*(id *)(a1 + 32) firstFailureDetector];
  int v7 = [v6 processSample:*(void *)(a1 + 40)];

  if (v7)
  {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) time];
      int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
      int v23 = 134218240;
      uint64_t v24 = v10;
      __int16 v25 = 1024;
      int v26 = v9;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[AP] - Rendering limit exceeded [no audio] - time:%3.2fms - total: %d", (uint8_t *)&v23, 0x12u);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) thermalLevel];
  [*(id *)(a1 + 40) time];
  double v12 = v11;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(int **)(a1 + 32);
  double v14 = 1.0 / (double)v13[2];
  [v13 mean];
  uint64_t v15 = *(void *)(a1 + 32);
  double v17 = v12 - v16;
  double v18 = v16 + (v12 - v16) * v14;
  double v19 = *(double *)(v15 + 16) + v17 * (v12 - v18);
  *(double *)(v15 + 88) = v18;
  *(double *)(*(void *)(a1 + 32) + 16) = v19;
  *(double *)(*(void *)(a1 + 32) + 96) = v14 * v19;
  [*(id *)(a1 + 32) min];
  *(double *)(*(void *)(a1 + 32) + 72) = fmin(v20, v12);
  uint64_t result = [*(id *)(a1 + 32) max];
  *(double *)(*(void *)(a1 + 32) + 80) = fmax(v22, v12);
  return result;
}

- (MPCSamplesRecorder)initWithRecordID:(id)a3 modelID:(id)a4 firstFailureDetector:(id)a5 shouldStoreSamples:(BOOL)a6 delegate:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MPCSamplesRecorder;
  double v16 = [(MPCSamplesRecorder *)&v27 init];
  double v17 = v16;
  if (v16)
  {
    v16->_glitches = 0;
    uint64_t v18 = [v12 copy];
    recordID = v17->_recordID;
    v17->_recordID = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    modelID = v17->_modelID;
    v17->_modelID = (NSString *)v20;

    v17->_mean = 0.0;
    v17->_rms = 0.0;
    *(_OWORD *)&v17->_min = xmmword_21BEF1610;
    v17->_k = 0;
    v17->_storingSamples = v8;
    if (v8)
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:500];
      samples = v17->_samples;
      v17->_samples = (NSMutableArray *)v22;
    }
    objc_storeStrong((id *)&v17->_firstFailureDetector, a5);
    objc_storeWeak((id *)&v17->_delegate, v15);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.MediaPlaybackCore/Suntory.samplesRecorderQueue", 0);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v24;
  }
  return v17;
}

@end