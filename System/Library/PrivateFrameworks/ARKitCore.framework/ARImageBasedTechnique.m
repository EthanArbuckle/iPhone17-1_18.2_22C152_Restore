@interface ARImageBasedTechnique
- (ARImageBasedTechnique)init;
- (BOOL)context:(id)a3 matchesFrameReference:(id)a4;
- (id)_fullDescription;
- (id)processData:(id)a3;
- (int64_t)getDeviceOrientationFromImageData:(id)a3;
- (void)pushResultData:(id)a3 forFrame:(__CVBuffer *)a4;
- (void)pushResultData:(id)a3 forFrameReference:(id)a4;
- (void)pushResultData:(id)a3 forTimestamp:(double)a4;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
@end

@implementation ARImageBasedTechnique

- (ARImageBasedTechnique)init
{
  v12.receiver = self;
  v12.super_class = (Class)ARImageBasedTechnique;
  v2 = [(ARTechnique *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pendingResultData = v2->_pendingResultData;
    v2->_pendingResultData = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    pendingFrameReferences = v2->_pendingFrameReferences;
    v2->_pendingFrameReferences = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    pendingRequestContexts = v2->_pendingRequestContexts;
    v2->_pendingRequestContexts = (NSMutableArray *)v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(1);
    pendingRequestsSemaphore = v2->_pendingRequestsSemaphore;
    v2->_pendingRequestsSemaphore = (OS_dispatch_semaphore *)v9;
  }
  return v2;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 timestamp];
    v6 = [(ARTechnique *)self traceKey];
    if (ARTechnique_Image_to_Result_Timestamp_onceToken != -1) {
      dispatch_once(&ARTechnique_Image_to_Result_Timestamp_onceToken, &__block_literal_global_13);
    }
    uint64_t v7 = [(id)ARTechnique_Image_to_Result_Timestamp_keyToCode objectForKeyedSubscript:v6];
    [v7 intValue];

    kdebug_trace();
    v8 = [(ARTechnique *)self traceKey];
    if (ARTechnique_Image_to_Result_Frame_onceToken != -1) {
      dispatch_once(&ARTechnique_Image_to_Result_Frame_onceToken, &__block_literal_global_214);
    }
    dispatch_semaphore_t v9 = [(id)ARTechnique_Image_to_Result_Frame_keyToCode objectForKeyedSubscript:v8];
    [v9 intValue];

    [v5 pixelBuffer];
    kdebug_trace();
  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingRequestsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = [(NSMutableArray *)self->_pendingResultData count];
  if (!v7)
  {
LABEL_9:
    if ((unint64_t)[(NSMutableArray *)self->_pendingRequestContexts count] >= 2)
    {
      v18 = [(NSMutableArray *)self->_pendingRequestContexts firstObject];
      v19 = [v18 imageData];
      [v19 timestamp];
      double v21 = a3 - v20;
      [(ARTechnique *)self requiredTimeInterval];
      double v23 = v22 + v22;

      if (v21 > v23)
      {
        v24 = _ARLogTechnique();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          v27 = [(NSMutableArray *)self->_pendingRequestContexts firstObject];
          v28 = [v27 imageData];
          [v28 timestamp];
          int v41 = 138543874;
          v42 = v26;
          __int16 v43 = 2048;
          v44 = self;
          __int16 v45 = 2048;
          uint64_t v46 = v29;
          _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping timed-out context: %f", (uint8_t *)&v41, 0x20u);
        }
        [(NSMutableArray *)self->_pendingRequestContexts removeObjectAtIndex:0];
      }
    }
    [(NSMutableArray *)self->_pendingRequestContexts addObject:v6];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  if (v7 < 1)
  {
LABEL_6:
    objc_super v12 = _ARLogTechnique();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v6 imageData];
      [v15 timestamp];
      pendingResultData = self->_pendingResultData;
      int v41 = 138544386;
      v42 = v14;
      __int16 v43 = 2048;
      v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = v17;
      __int16 v47 = 2048;
      v48 = (NSMutableArray *)v8;
      __int16 v49 = 2112;
      v50 = pendingResultData;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Enqueuing context (%f) even though %ld results (%@) are pending", (uint8_t *)&v41, 0x34u);
    }
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  while (1)
  {
    v10 = [(NSMutableArray *)self->_pendingFrameReferences objectAtIndexedSubscript:v9];
    BOOL v11 = [(ARImageBasedTechnique *)self context:v6 matchesFrameReference:v10];

    if (v11) {
      break;
    }
    if (v8 == ++v9) {
      goto LABEL_6;
    }
  }
  v30 = [(NSMutableArray *)self->_pendingResultData objectAtIndexedSubscript:v9];
  if (v9)
  {
    v31 = _ARLogTechnique();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      int v41 = 138543874;
      v42 = v33;
      __int16 v43 = 2048;
      v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = v9;
      _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld received result datas - newer data available", (uint8_t *)&v41, 0x20u);
    }
  }
  uint64_t v34 = v9 + 1;
  -[NSMutableArray removeObjectsInRange:](self->_pendingFrameReferences, "removeObjectsInRange:", 0, v34);
  -[NSMutableArray removeObjectsInRange:](self->_pendingResultData, "removeObjectsInRange:", 0, v34);
  if (!v30) {
    goto LABEL_9;
  }
  if ([v30 count] && -[NSMutableArray count](self->_pendingRequestContexts, "count"))
  {
    v35 = _ARLogTechnique();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      uint64_t v38 = [(NSMutableArray *)self->_pendingRequestContexts count];
      pendingRequestContexts = self->_pendingRequestContexts;
      int v41 = 138544130;
      v42 = v37;
      __int16 v43 = 2048;
      v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = v38;
      __int16 v47 = 2112;
      v48 = pendingRequestContexts;
      _os_log_impl(&dword_1B88A2000, v35, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld skipped contexts (%@)", (uint8_t *)&v41, 0x2Au);
    }
    [(NSMutableArray *)self->_pendingRequestContexts removeAllObjects];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
  [(ARImageBasedTechnique *)self prepareResultData:v30 forContext:v6];
  v40 = [(ARTechnique *)self delegate];
  [v40 technique:self didOutputResultData:v30 timestamp:v6 context:a3];

LABEL_15:
}

- (void)pushResultData:(id)a3 forFrameReference:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingRequestsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = [(NSMutableArray *)self->_pendingRequestContexts count];
  if (!v8)
  {
LABEL_9:
    [(NSMutableArray *)self->_pendingResultData addObject:v6];
    [(NSMutableArray *)self->_pendingFrameReferences addObject:v7];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  if (v8 < 1)
  {
LABEL_6:
    objc_super v12 = _ARLogTechnique();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      pendingRequestContexts = self->_pendingRequestContexts;
      int v27 = 138544386;
      v28 = v14;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v6;
      __int16 v33 = 2048;
      uint64_t v34 = (NSMutableArray *)v9;
      __int16 v35 = 2112;
      v36 = pendingRequestContexts;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Enqueuing result data (%@) even though %ld contexts are pending (%@)", (uint8_t *)&v27, 0x34u);
    }
    goto LABEL_9;
  }
  v10 = 0;
  while (1)
  {
    BOOL v11 = [(NSMutableArray *)self->_pendingRequestContexts objectAtIndexedSubscript:v10];
    if ([(ARImageBasedTechnique *)self context:v11 matchesFrameReference:v7]) {
      break;
    }

    if ((char *)v9 == ++v10) {
      goto LABEL_6;
    }
  }
  if (v10)
  {
    v16 = _ARLogTechnique();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = self->_pendingRequestContexts;
      int v27 = 138544130;
      v28 = v18;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2048;
      uint64_t v32 = (uint64_t)v10;
      __int16 v33 = 2112;
      uint64_t v34 = v19;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Result data received, skipped %ld contexts (%@)", (uint8_t *)&v27, 0x2Au);
    }
  }
  -[NSMutableArray removeObjectsInRange:](self->_pendingRequestContexts, "removeObjectsInRange:", 0, v10 + 1);
  if (!v11) {
    goto LABEL_9;
  }
  if ([(NSMutableArray *)self->_pendingResultData count])
  {
    double v20 = _ARLogTechnique();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = (objc_class *)objc_opt_class();
      double v22 = NSStringFromClass(v21);
      uint64_t v23 = [(NSMutableArray *)self->_pendingResultData count];
      pendingResultData = self->_pendingResultData;
      int v27 = 138544130;
      v28 = v22;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2048;
      uint64_t v32 = v23;
      __int16 v33 = 2112;
      uint64_t v34 = pendingResultData;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld skipped result datas (%@)", (uint8_t *)&v27, 0x2Au);
    }
    [(NSMutableArray *)self->_pendingResultData removeAllObjects];
    [(NSMutableArray *)self->_pendingFrameReferences removeAllObjects];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
  [(ARImageBasedTechnique *)self prepareResultData:v6 forContext:v11];
  v25 = [(ARTechnique *)self delegate];
  v26 = [v11 imageData];
  [v26 timestamp];
  objc_msgSend(v25, "technique:didOutputResultData:timestamp:context:", self, v6, v11);

LABEL_10:
}

- (void)pushResultData:(id)a3 forFrame:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = [(ARTechnique *)self traceKey];
  if (ARTechnique_Image_to_Result_FrameEnd_onceToken != -1) {
    dispatch_once(&ARTechnique_Image_to_Result_FrameEnd_onceToken, &__block_literal_global_294);
  }
  uint64_t v8 = [(id)ARTechnique_Image_to_Result_FrameEnd_keyToCode objectForKeyedSubscript:v7];
  [v8 intValue];

  kdebug_trace();
  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:a4];
  [(ARImageBasedTechnique *)self pushResultData:v6 forFrameReference:v9];
}

- (void)pushResultData:(id)a3 forTimestamp:(double)a4
{
  id v6 = a3;
  id v7 = [(ARTechnique *)self traceKey];
  if (ARTechnique_Image_to_Result_TimestampEnd_onceToken != -1) {
    dispatch_once(&ARTechnique_Image_to_Result_TimestampEnd_onceToken, &__block_literal_global_370);
  }
  uint64_t v8 = [(id)ARTechnique_Image_to_Result_TimestampEnd_keyToCode objectForKeyedSubscript:v7];
  [v8 intValue];

  kdebug_trace();
  id v9 = [NSNumber numberWithDouble:a4];
  [(ARImageBasedTechnique *)self pushResultData:v6 forFrameReference:v9];
}

- (BOOL)context:(id)a3 matchesFrameReference:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    double v8 = v7;
    id v9 = [v5 imageData];
    [v9 timestamp];
    char v11 = v8 == v10;
  }
  else
  {
    if (![v6 pointerValue])
    {
      char v11 = 1;
      goto LABEL_7;
    }
    id v9 = [v5 imageData];
    char v11 = objc_msgSend(v9, "matchesPixelBufferPointerRecursively:", objc_msgSend(v6, "pointerValue"));
  }

LABEL_7:
  return v11;
}

- (id)_fullDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v26.receiver = self;
  v26.super_class = (Class)ARImageBasedTechnique;
  id v4 = [(ARTechnique *)&v26 _fullDescription];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  if ([(NSMutableArray *)self->_pendingResultData count])
  {
    id v6 = [(NSMutableArray *)self->_pendingResultData description];
    double v7 = [v6 description];
    double v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
    [v5 appendFormat:@"\tPendingResultData: %@\n", v8];
  }
  else
  {
    [v5 appendFormat:@"\tPendingResultData: None\n"];
  }
  if ([(NSMutableArray *)self->_pendingFrameReferences count])
  {
    id v9 = [(NSMutableArray *)self->_pendingFrameReferences description];
    double v10 = [v9 description];
    char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
    [v5 appendFormat:@"\tPendingFrameReferences: %@\n", v11];
  }
  else
  {
    [v5 appendFormat:@"\tPendingFrameReferences: None\n"];
  }
  if ([(NSMutableArray *)self->_pendingRequestContexts count])
  {
    [v5 appendFormat:@"\tPendingRequestContexts:\n"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = self->_pendingRequestContexts;
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 1;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = [NSString stringWithFormat:@"%d: %@\n", v14 + i, *(void *)(*((void *)&v22 + 1) + 8 * i)];
          v18 = [v17 description];
          v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
          [v5 appendFormat:@"%@", v19];
        }
        uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v14 = (v14 + i);
      }
      while (v13);
    }
  }
  else
  {
    [v5 appendFormat:@"\tPendingRequestContexts: None\n"];
  }
  return v5;
}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 deviceOrientation];
  if ((unint64_t)(v4 - 1) >= 4) {
    -[ARImageBasedTechnique getDeviceOrientationFromImageData:]();
  }
  int64_t v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingRequestContexts, 0);
  objc_storeStrong((id *)&self->_pendingFrameReferences, 0);
  objc_storeStrong((id *)&self->_pendingResultData, 0);
}

- (void)getDeviceOrientationFromImageData:.cold.1()
{
}

@end