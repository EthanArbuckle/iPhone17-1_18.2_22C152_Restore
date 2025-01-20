@interface BWFigVideoCaptureSynchronizedStreamsGroup
+ (void)initialize;
- (BOOL)maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported;
- (BOOL)maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported;
- (BOOL)minimumMasterToSlaveFrameRateRatioSupported;
- (BWFigCaptureSynchronizedStreamsGroup)syncGroup;
- (BWFigVideoCaptureStream)cameraControlsStatisticsMasterStream;
- (BWFigVideoCaptureSynchronizedStreamsGroup)initWithSynchronizedStreamsGroup:(id)a3 activeStreams:(id)a4 readOnly:(BOOL)a5 baseZoomFactorOverrides:(id)a6 clientBaseZoomFactorsByPortType:(id)a7 error:(int *)a8;
- (NSArray)activePortTypes;
- (NSDictionary)baseZoomFactorsByPortType;
- (NSDictionary)clientBaseZoomFactorsByPortType;
- (id)cameraPoseMatrixForPortType:(id)a3;
- (id)cameraViewMatrixForPortType:(id)a3;
- (int)setCameraControlsStatisticsMasterStream:(id)a3;
- (int)setMasterStream:(id)a3 allStreams:(id)a4;
- (uint64_t)_computeBaseZoomFactorsWithOverrides:(void *)a3 clientBaseZoomFactorsByPortType:;
- (uint64_t)_getViewAndPoseMatrices;
- (uint64_t)_slaveConfigurationForStream:(uint64_t)result;
- (uint64_t)_worldPortType;
- (unsigned)minimumMasterToSlaveFrameRateRatio;
- (void)dealloc;
- (void)setBaseZoomFactorsByPortType:(id)a3;
- (void)setMaximumNumberOfEnabledSlaveTimeMachines:(int)a3;
- (void)setMaximumNumberOfSlaveStreamsWithFrameProcessingEnabled:(int)a3;
- (void)setMaximumNumberOfSlaveStreamsWithoutFrameSkipping:(int)a3;
- (void)setMinimumMasterToSlaveFrameRateRatio:(unsigned int)a3;
@end

@implementation BWFigVideoCaptureSynchronizedStreamsGroup

- (void)setMinimumMasterToSlaveFrameRateRatio:(unsigned int)a3
{
  if (!self->_readOnly)
  {
    synchronizedStreamsGroup = self->_synchronizedStreamsGroup;
    uint64_t v4 = *MEMORY[0x1E4F55618];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
    [(BWFigCaptureSynchronizedStreamsGroup *)synchronizedStreamsGroup setProperty:v4 value:v5];
  }
}

- (unsigned)minimumMasterToSlaveFrameRateRatio
{
  id v2 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup getProperty:*MEMORY[0x1E4F55618] error:0];
  return [v2 intValue];
}

- (BOOL)minimumMasterToSlaveFrameRateRatioSupported
{
  id v2 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup supportedProperties];
  return [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F55618]] != 0;
}

- (BWFigVideoCaptureStream)cameraControlsStatisticsMasterStream
{
  return self->_cameraControlsStatisticsMasterStream;
}

- (uint64_t)_slaveConfigurationForStream:(uint64_t)result
{
  v7[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if ([a2 streamingRequiredWhenConfiguredAsSlave]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [a2 visionDataRequiredWhenConfiguredAsSlave];
    }
    uint64_t v4 = [a2 firmwareTimeMachineEnabledWhenConfiguredAsSlave];
    uint64_t v5 = [a2 masterToSlaveFrameRateRatio];
    v6[0] = *MEMORY[0x1E4F550E8];
    v7[0] = [NSNumber numberWithBool:v3];
    v6[1] = *MEMORY[0x1E4F550E0];
    v7[1] = [NSNumber numberWithInt:v5];
    v6[2] = *MEMORY[0x1E4F550D8];
    v7[2] = [NSNumber numberWithInt:(int)v5 > 1];
    v6[3] = *MEMORY[0x1E4F550F0];
    v7[3] = [NSNumber numberWithBool:v4];
    return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  }
  return result;
}

- (BWFigVideoCaptureSynchronizedStreamsGroup)initWithSynchronizedStreamsGroup:(id)a3 activeStreams:(id)a4 readOnly:(BOOL)a5 baseZoomFactorOverrides:(id)a6 clientBaseZoomFactorsByPortType:(id)a7 error:(int *)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int ViewAndPose = 0;
  if ([a4 count])
  {
    v37.receiver = self;
    v37.super_class = (Class)BWFigVideoCaptureSynchronizedStreamsGroup;
    self = [(BWFigVideoCaptureSynchronizedStreamsGroup *)&v37 init];
    if (!self) {
      return self;
    }
    id v31 = a7;
    id v32 = a3;
    v29 = a8;
    id v30 = a6;
    self->_activeStreams = (NSArray *)a4;
    v15 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    char v16 = a4 != 0;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v17 = [a4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      uint64_t v20 = *MEMORY[0x1E4F54820];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(a4);
          }
          v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "addObject:", objc_msgSend(v22, "portType"));
          v16 &= objc_msgSend((id)objc_msgSend(v22, "supportedProperties"), "objectForKeyedSubscript:", v20) != 0;
        }
        uint64_t v18 = [a4 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v18);
    }
    self->_activePortTypes = (NSArray *)[v15 copy];
    v23 = (BWFigCaptureSynchronizedStreamsGroup *)v32;
    self->_synchronizedStreamsGroup = v23;
    if (v23)
    {
      self->_readOnly = a5;
      if ((a5
         || (int ViewAndPose = [(BWFigCaptureSynchronizedStreamsGroup *)v23 setActiveStreams:a4]) == 0)
        && ((v16 & 1) != 0
         || (int ViewAndPose = -[BWFigVideoCaptureSynchronizedStreamsGroup _getViewAndPoseMatrices]((uint64_t)self)) == 0)
        && ([(NSArray *)self->_activeStreams count] < 2
         || (int ViewAndPose = -[BWFigVideoCaptureSynchronizedStreamsGroup _computeBaseZoomFactorsWithOverrides:clientBaseZoomFactorsByPortType:]((uint64_t)self, v30, v31)) == 0))
      {
        if ([(NSArray *)self->_activePortTypes containsObject:*MEMORY[0x1E4F52E00]]
          || (v24 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup supportedProperties], uint64_t v25 = [(NSDictionary *)v24 objectForKeyedSubscript:*MEMORY[0x1E4F555E8]], self->_masterConfigurationSupported = v25 != 0, !v25))
        {
LABEL_24:
          *(void *)&self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping = -1;
          self->_maximumNumberOfEnabledSlaveTimeMachines = -1;
          return self;
        }
        id v26 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup getProperty:*MEMORY[0x1E4F555F0] error:&ViewAndPose];
        if (!ViewAndPose)
        {
          if (self->_masterConfigurationSupported) {
            char v27 = [v26 containsObject:*MEMORY[0x1E4F555B0]];
          }
          else {
            char v27 = 0;
          }
          self->_atomicMasterSlaveReconfigurationSupported = v27;
          goto LABEL_24;
        }
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      int ViewAndPose = -12782;
    }
    a8 = v29;
  }
  else
  {
    FigDebugAssert3();
  }

  self = 0;
  if (a8) {
    *a8 = ViewAndPose;
  }
  return self;
}

- (uint64_t)_computeBaseZoomFactorsWithOverrides:(void *)a3 clientBaseZoomFactorsByPortType:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = (void *)result;
    unsigned int v41 = 0;
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "getProperty:error:", *MEMORY[0x1E4F555D8], &v41), "mutableCopy");
    if (v41)
    {
      FigDebugAssert3();
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v7 = (void *)v5[3];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v38;
        float v11 = 3.4028e38;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v6, "allKeys"), "containsObject:", v13))
            {
              objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v13), "floatValue");
              if (v11 >= v14)
              {
                objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v13), "floatValue");
                float v11 = v15;
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v9);
      }
      else
      {
        float v11 = 3.4028e38;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      char v16 = (void *)v5[2];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = [*(id *)(*((void *)&v33 + 1) + 8 * j) portType];
            objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v21), "floatValue");
            if (*(float *)&v22 == 0.0) {
              *(float *)&double v22 = 1.0;
            }
            *(float *)&double v22 = *(float *)&v22 / v11;
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), v21);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
        }
        while (v18);
      }
      if (a3) {
        v23 = a3;
      }
      else {
        v23 = v6;
      }
      v5[7] = [v23 copy];
      if (a2)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v24 = (void *)[a2 allKeys];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v42 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v30 != v27) {
                objc_enumerationMutation(v24);
              }
              objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * k)), *(void *)(*((void *)&v29 + 1) + 8 * k));
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v42 count:16];
          }
          while (v26);
        }
      }
      v5[6] = [v6 copy];
    }

    return v41;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFigVideoCaptureSynchronizedStreamsGroup;
  [(BWFigVideoCaptureSynchronizedStreamsGroup *)&v3 dealloc];
}

- (NSDictionary)clientBaseZoomFactorsByPortType
{
  return self->_clientBaseZoomFactorsByPortType;
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (NSArray)activePortTypes
{
  return self->_activePortTypes;
}

- (BWFigCaptureSynchronizedStreamsGroup)syncGroup
{
  return self->_synchronizedStreamsGroup;
}

- (void)setMaximumNumberOfEnabledSlaveTimeMachines:(int)a3
{
  if (!self->_readOnly && self->_atomicMasterSlaveReconfigurationSupported)
  {
    uint64_t v4 = *(void *)&a3;
    uint64_t v5 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup supportedProperties];
    uint64_t v6 = *MEMORY[0x1E4F555F8];
    if ([(NSDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F555F8]])
    {
      if (self->_maximumNumberOfEnabledSlaveTimeMachines != v4
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", v6, [NSNumber numberWithInt:v4]))
      {
        self->_maximumNumberOfEnabledSlaveTimeMachines = v4;
      }
    }
  }
}

- (int)setMasterStream:(id)a3 allStreams:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_readOnly)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(a4);
          }
          id v12 = *(id *)(*((void *)&v28 + 1) + 8 * i);
          if (v12 != a3) {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", -[BWFigVideoCaptureSynchronizedStreamsGroup _slaveConfigurationForStream:]((uint64_t)self, *(void **)(*((void *)&v28 + 1) + 8 * i)), objc_msgSend(v12, "portType"));
          }
        }
        uint64_t v9 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
    if (self->_currentMasterStream == a3
      && ([v7 isEqualToDictionary:self->_currentSlaveConfigurationsByPortType] & 1) != 0)
    {
      return 0;
    }
    if (self->_atomicMasterSlaveReconfigurationSupported)
    {
      int v13 = -[BWFigCaptureSynchronizedStreamsGroup setMasterStream:slaveConfigurationsByPortType:](self->_synchronizedStreamsGroup, "setMasterStream:slaveConfigurationsByPortType:", [a3 stream], v7);
      if (v13)
      {
        int v14 = v13;
LABEL_30:
        FigDebugAssert3();
        return v14;
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v15 = [a4 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        uint64_t v18 = *MEMORY[0x1E4F54C10];
        while (2)
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(a4);
            }
            id v20 = *(id *)(*((void *)&v24 + 1) + 8 * j);
            if (v20 != a3)
            {
              int v21 = objc_msgSend((id)objc_msgSend(v20, "stream"), "setProperty:value:", v18, objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "portType")));
              if (v21)
              {
                int v14 = v21;
                goto LABEL_30;
              }
            }
          }
          uint64_t v16 = [a4 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      if (self->_masterConfigurationSupported)
      {
        int v22 = -[BWFigCaptureSynchronizedStreamsGroup setMasterStream:slaveConfigurationsByPortType:](self->_synchronizedStreamsGroup, "setMasterStream:slaveConfigurationsByPortType:", [a3 stream], 0);
        if (v22)
        {
          int v14 = v22;
          goto LABEL_30;
        }
      }
    }

    self->_currentMasterStream = (BWFigVideoCaptureStream *)a3;
    int v14 = 0;
    self->_currentSlaveConfigurationsByPortType = (NSDictionary *)v7;
    return v14;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)setCameraControlsStatisticsMasterStream:(id)a3
{
  if (self->_statsMasterHasBeenSet && self->_cameraControlsStatisticsMasterStream == a3) {
    return 0;
  }
  if (self->_readOnly || !self->_masterConfigurationSupported)
  {
    return FigSignalErrorAt();
  }
  else
  {
    int result = -[BWFigCaptureSynchronizedStreamsGroup setCameraControlsMasterStream:](self->_synchronizedStreamsGroup, "setCameraControlsMasterStream:", [a3 stream]);
    if (!result)
    {
      self->_cameraControlsStatisticsMasterStream = (BWFigVideoCaptureStream *)a3;
      self->_statsMasterHasBeenSet = 1;
    }
  }
  return result;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
  id v5 = (id)[(NSDictionary *)self->_baseZoomFactorsByPortType mutableCopy];
  [v5 addEntriesFromDictionary:a3];

  self->_baseZoomFactorsByPortType = (NSDictionary *)[v5 copy];
}

- (void)setMaximumNumberOfSlaveStreamsWithoutFrameSkipping:(int)a3
{
  if (!self->_readOnly)
  {
    uint64_t v3 = *(void *)&a3;
    if ([(BWFigVideoCaptureSynchronizedStreamsGroup *)self maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported])
    {
      if (self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping != v3
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", *MEMORY[0x1E4F55608], [NSNumber numberWithInt:v3]))
      {
        self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping = v3;
      }
    }
  }
}

- (BOOL)maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported
{
  if (!self->_atomicMasterSlaveReconfigurationSupported) {
    return 0;
  }
  id v2 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup supportedProperties];
  return [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F55608]] != 0;
}

- (void)setMaximumNumberOfSlaveStreamsWithFrameProcessingEnabled:(int)a3
{
  if (!self->_readOnly)
  {
    uint64_t v3 = *(void *)&a3;
    if ([(BWFigVideoCaptureSynchronizedStreamsGroup *)self maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported])
    {
      if (self->_maximumNumberOfSlaveStreamsWithFrameProcessingEnabled != v3
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", *MEMORY[0x1E4F55600], [NSNumber numberWithInt:v3]))
      {
        self->_maximumNumberOfSlaveStreamsWithFrameProcessingEnabled = v3;
      }
    }
  }
}

- (BOOL)maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported
{
  if (!self->_atomicMasterSlaveReconfigurationSupported) {
    return 0;
  }
  id v2 = [(BWFigCaptureSynchronizedStreamsGroup *)self->_synchronizedStreamsGroup supportedProperties];
  return [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F55600]] != 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (uint64_t)_getViewAndPoseMatrices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  unsigned int v24 = 0;
  uint64_t v17 = -[BWFigVideoCaptureSynchronizedStreamsGroup _worldPortType](result);
  memset(v28, 0, sizeof(v28));
  long long v27 = 0u;
  int v26 = 1065353216;
  v28[0] = 1065353216;
  v28[5] = 1065353216;
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v26 length:48];
  uint64_t v16 = (void *)[*(id *)(v1 + 8) getProperty:*MEMORY[0x1E4F555E0] error:&v24];
  if (v24)
  {
    FigDebugAssert3();
    goto LABEL_26;
  }
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = v1;
  obuint64_t j = *(id *)(v1 + 24);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v5) {
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v21;
  uint64_t v8 = *MEMORY[0x1E4F52DD8];
  uint64_t v9 = *MEMORY[0x1E4F52DF8];
  uint64_t v18 = *MEMORY[0x1E4F52E10];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(obj);
      }
      float v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      id v12 = (void *)v2;
      if (([v11 isEqualToString:v8] & 1) == 0)
      {
        id v12 = (void *)v2;
        if ([v11 isEqualToString:v9]) {
          goto LABEL_15;
        }
        id v12 = (void *)v2;
        if ([v11 isEqualToString:v18]) {
          goto LABEL_15;
        }
        if (!objc_msgSend((id)objc_msgSend(v16, "allKeys"), "containsObject:", v11))
        {
          id v12 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v11);
LABEL_15:
          [v3 setObject:0 forKeyedSubscript:v11];
          if (v12) {
            goto LABEL_19;
          }
          goto LABEL_16;
        }
        id v12 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v17);
      }
      [v3 setObject:v12 forKeyedSubscript:v11];
LABEL_16:
      if ([v12 length] == 48) {
        id v12 = BWInvertRowMajorViewMatrixData(v12);
      }
      else {
        id v12 = 0;
      }
LABEL_19:
      [v4 setObject:v12 forKeyedSubscript:v11];
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  }
  while (v6);
LABEL_21:
  uint64_t v13 = [v3 count];
  if (v13) {
    uint64_t v13 = [v3 copy];
  }
  *(void *)(v15 + 32) = v13;
  uint64_t v14 = [v4 count];
  if (v14) {
    uint64_t v14 = [v4 copy];
  }
  *(void *)(v15 + 40) = v14;
LABEL_26:
  if (v24 == -12782) {
    return 0;
  }
  else {
    return v24;
  }
}

- (id)cameraViewMatrixForPortType:(id)a3
{
  return [(NSDictionary *)self->_cameraViewMatricesByPortType objectForKeyedSubscript:a3];
}

- (id)cameraPoseMatrixForPortType:(id)a3
{
  return [(NSDictionary *)self->_cameraPoseMatricesByPortType objectForKeyedSubscript:a3];
}

- (uint64_t)_worldPortType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 8), "streams", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  uint64_t v3 = *MEMORY[0x1E4F52DF8];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = *MEMORY[0x1E4F52E10];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "portType"), "hasPrefix:", @"PortTypeBack"))return *MEMORY[0x1E4F52DD8]; {
        if (FigCFEqual())
        }
          return v3;
        if (FigCFEqual()) {
          return v6;
        }
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v3;
}

@end