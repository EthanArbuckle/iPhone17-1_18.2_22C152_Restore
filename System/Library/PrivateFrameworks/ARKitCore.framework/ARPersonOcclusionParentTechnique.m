@interface ARPersonOcclusionParentTechnique
- (ARPersonOcclusionParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4;
- (ARTechniqueForwardingStrategy)depthTechniqueProcessingStrategy;
- (BOOL)isEqual:(id)a3;
- (id)processData:(id)a3;
- (id)techniquesToRunWithForwardedDepth:(BOOL)a3;
- (int64_t)optimizationStrategy;
- (void)dealloc;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setDepthTechniqueProcessingStrategy:(id)a3;
- (void)setOptimizationStrategy:(int64_t)a3;
- (void)setTechniques:(id)a3;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
- (void)updatePersonDetectionTechniques;
- (void)updatePrimaryPersonDetectionTechnique;
@end

@implementation ARPersonOcclusionParentTechnique

- (ARPersonOcclusionParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 indexOfObjectPassingTest:&__block_literal_global_54] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (_ARLogTechnique_onceToken_9 != -1) {
      dispatch_once(&_ARLogTechnique_onceToken_9, &__block_literal_global_119);
    }
    v8 = (void *)_ARLogTechnique_logObj_9;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_9, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v24[0] = v13;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v24[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      *(_DWORD *)buf = 138543874;
      v26 = v11;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: This parent technique is designed to contain one of the following person detection techniques: %@", buf, 0x20u);
    }
    v17 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ARPersonOcclusionParentTechnique;
    v18 = [(ARParentTechnique *)&v23 initWithTechniques:v6 delegate:v7];
    if (v18)
    {
      v18->_shouldSkipFramesWhenBusy = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.personocclusion.skipFrameWhenBusy"];
      depthTechniqueProcessingStrategy = v18->_depthTechniqueProcessingStrategy;
      v18->_depthTechniqueProcessingStrategy = 0;

      v18->_detectedPerson = 1;
      v18->_lastDetectedPersonTimeStamp = 0.0;
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
      personDetectionTechniques = v18->_personDetectionTechniques;
      v18->_personDetectionTechniques = (NSHashTable *)v20;

      [(ARPersonOcclusionParentTechnique *)v18 updatePersonDetectionTechniques];
    }
    self = v18;
    v17 = self;
  }

  return v17;
}

uint64_t __64__ARPersonOcclusionParentTechnique_initWithTechniques_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_placeholderDepthBuffer);
  self->_placeholderDepthBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)ARPersonOcclusionParentTechnique;
  [(ARPersonOcclusionParentTechnique *)&v3 dealloc];
}

- (void)setOptimizationStrategy:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_int64_t optimizationStrategy = a3;
  v4 = _ARLogGeneral_19();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int64_t optimizationStrategy = self->_optimizationStrategy;
    int v8 = 138543874;
    v9 = v6;
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2048;
    int64_t v13 = optimizationStrategy;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _int64_t optimizationStrategy = %ld", (uint8_t *)&v8, 0x20u);
  }
  [(ARPersonOcclusionParentTechnique *)self updatePrimaryPersonDetectionTechnique];
}

- (void)setTechniques:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARPersonOcclusionParentTechnique;
  id v4 = a3;
  [(ARParentTechnique *)&v8 setTechniques:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_12, v8.receiver, v8.super_class);
  id v6 = +[ARTechnique techniqueMatchingPredicate:v5 inArray:v4];

  depthTechnique = self->_depthTechnique;
  self->_depthTechnique = v6;

  [(ARPersonOcclusionParentTechnique *)self updatePrimaryPersonDetectionTechnique];
  [(ARPersonOcclusionParentTechnique *)self updatePersonDetectionTechniques];
}

uint64_t __50__ARPersonOcclusionParentTechnique_setTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)techniquesToRunWithForwardedDepth:(BOOL)a3
{
  if (self->_detectedPerson || !self->_optimizationStrategy)
  {
    v8.receiver = self;
    v8.super_class = (Class)ARPersonOcclusionParentTechnique;
    id v4 = [(ARParentTechnique *)&v8 techniques];
  }
  else
  {
    BOOL v6 = a3;
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", self->_primaryPersonDetectionTechnique, 0);
    id v4 = v7;
    if (v6 && self->_depthTechnique) {
      objc_msgSend(v7, "addObject:");
    }
  }
  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonOcclusionParentTechnique;
  [(ARParentTechnique *)&v7 reconfigureFrom:v4];
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[ARPersonOcclusionParentTechnique setOptimizationStrategy:](self, "setOptimizationStrategy:", [v5 optimizationStrategy]);
    BOOL v6 = [v5 depthTechniqueProcessingStrategy];

    [(ARPersonOcclusionParentTechnique *)self setDepthTechniqueProcessingStrategy:v6];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARPersonOcclusionParentTechnique;
  if ([(ARParentTechnique *)&v13 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARPersonOcclusionParentTechnique *)self optimizationStrategy];
    if (v6 == [v5 optimizationStrategy])
    {
      objc_super v7 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
      objc_super v8 = [v5 depthTechniqueProcessingStrategy];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        v9 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
        __int16 v10 = [v5 depthTechniqueProcessingStrategy];
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)processData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(ARParentTechnique *)self techniques];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector() & 1) != 0 && ([v9 isBusy])
        {
          LODWORD(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v6 && (isKindOfClass & 1) == 0 && self->_shouldSkipFramesWhenBusy)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 timestamp];
      kdebug_trace();
    }
    id v11 = v4;
  }
  else
  {
    __int16 v12 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
    if (v12)
    {
      objc_super v13 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
      uint64_t v14 = [v13 shouldProcessData:v4];
    }
    else
    {
      uint64_t v14 = 0;
    }

    v15 = [(ARPersonOcclusionParentTechnique *)self techniquesToRunWithForwardedDepth:v14];
    id v11 = [(ARParentTechnique *)self processData:v4 onTechniques:v15];
  }
  return v11;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
  if (v6)
  {
    uint64_t v7 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
    uint64_t v8 = [v7 shouldRequestResultDataAtTimestamp:v10 context:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [(ARPersonOcclusionParentTechnique *)self techniquesToRunWithForwardedDepth:v8];
  [(ARParentTechnique *)self requestResultDataAtTimestamp:v10 context:v9 onTechniques:a3];
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = (ARTechnique *)a3;
  id v11 = a4;
  id v12 = a6;
  objc_super v13 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
  if (v13)
  {
    uint64_t v14 = [(ARPersonOcclusionParentTechnique *)self depthTechniqueProcessingStrategy];
    uint64_t v15 = [v14 shouldRequestResultDataAtTimestamp:v12 context:a5];
  }
  else
  {
    uint64_t v15 = 0;
  }

  v16 = [(ARPersonOcclusionParentTechnique *)self techniquesToRunWithForwardedDepth:v15];
  if (![(NSHashTable *)self->_personDetectionTechniques containsObject:v10])
  {
    v41.receiver = self;
    v41.super_class = (Class)ARPersonOcclusionParentTechnique;
    [(ARParentTechnique *)&v41 technique:v10 didOutputResultData:v11 timestamp:v12 context:v16 onTechniques:a5];
    goto LABEL_49;
  }
  if (self->_primaryPersonDetectionTechnique == v10)
  {
    if (self->_depthTechnique)
    {
      if (self->_optimizationStrategy)
      {
        if (!self->_detectedPerson)
        {
          p_placeholderDepthBuffer = &self->_placeholderDepthBuffer;
          if (self->_placeholderDepthBuffer
            || (CVPixelBufferCreate(0, 1uLL, 1uLL, 0x66646570u, 0, &self->_placeholderDepthBuffer),
                *p_placeholderDepthBuffer))
          {
            objc_super v23 = [(ARMLDepthData *)[ARPlaceholderMLDepthData alloc] initWithTimestamp:*p_placeholderDepthBuffer depthBuffer:[(ARMLDepthDataSourceProvider *)self->_depthTechnique depthDataSource] source:a5];
            if (v23)
            {
              v24 = v23;
              uint64_t v25 = [v11 arrayByAddingObject:v23];

              id v11 = (id)v25;
            }
          }
        }
      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)ARPersonOcclusionParentTechnique;
  [(ARParentTechnique *)&v40 technique:v10 didOutputResultData:v11 timestamp:v12 context:v16 onTechniques:a5];
  id v11 = v11;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v17 = (id)[v11 countByEnumeratingWithState:&v42 objects:buf count:16];
  double v18 = 0.0;
  if (!v17) {
    goto LABEL_35;
  }
  uint64_t v19 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v43 != v19) {
        objc_enumerationMutation(v11);
      }
      v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v21;
        [v17 timestamp];
        double v18 = v26;
        __int16 v27 = [v17 detectedObjects];
        LODWORD(v17) = [v27 count] != 0;

LABEL_34:
        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v21;
        [v17 timestamp];
        double v18 = v28;
        LODWORD(v17) = [v17 hasSegmentedPeople];
        goto LABEL_34;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v21;
        [v17 timestamp];
        double v18 = v29;
        v30 = [v17 rawDetectionResult];
        if (v30)
        {
          LODWORD(v17) = 1;
        }
        else
        {
          uint64_t v31 = [v17 alignedDetectionResult];
          if (v31)
          {
            LODWORD(v17) = 1;
          }
          else
          {
            v32 = [v17 alignedDetectionResult];
            LODWORD(v17) = v32 != 0;
          }
        }

        goto LABEL_34;
      }
    }
    id v17 = (id)[v11 countByEnumeratingWithState:&v42 objects:buf count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_35:

  double lastDetectedPersonTimeStamp = self->_lastDetectedPersonTimeStamp;
  if (lastDetectedPersonTimeStamp == 0.0)
  {
    self->_double lastDetectedPersonTimeStamp = v18;
    double lastDetectedPersonTimeStamp = v18;
  }
  if (v17)
  {
    if (!self->_detectedPerson)
    {
      v34 = _ARLogGeneral_19();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        __int16 v48 = 2048;
        v49 = self;
        _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: detected a person when there were none", buf, 0x16u);
      }
    }
    self->_detectedPerson = 1;
    self->_double lastDetectedPersonTimeStamp = v18;
  }
  else if (v18 - lastDetectedPersonTimeStamp > 0.5)
  {
    if (self->_detectedPerson)
    {
      v37 = _ARLogGeneral_19();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138543874;
        v47 = v39;
        __int16 v48 = 2048;
        v49 = self;
        __int16 v50 = 2048;
        uint64_t v51 = 0x3FE0000000000000;
        _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: detected no person for %f seconds", buf, 0x20u);
      }
    }
    self->_detectedPerson = 0;
  }
LABEL_49:
}

- (void)updatePersonDetectionTechniques
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_personDetectionTechniques removeAllObjects];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self;
  obuint64_t j = [(ARParentTechnique *)self techniques];
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v6 containsObject:objc_opt_class()])
        {
          [(NSHashTable *)v19->_personDetectionTechniques addObject:v11];
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v12 = v6;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v21 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [v11 techniqueOfClass:*(void *)(*((void *)&v20 + 1) + 8 * j)];

                if (v17)
                {
                  [(NSHashTable *)v19->_personDetectionTechniques addObject:v11];
                  goto LABEL_18;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)updatePrimaryPersonDetectionTechnique
{
  int64_t optimizationStrategy = self->_optimizationStrategy;
  if (optimizationStrategy == 1 || optimizationStrategy == 2)
  {
    uint64_t v4 = objc_opt_class();
    if (v4)
    {
      id v6 = [(ARParentTechnique *)self techniques];
      uint64_t v4 = +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", v4);
      char v5 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  char v5 = 1;
LABEL_7:
  objc_storeStrong((id *)&self->_primaryPersonDetectionTechnique, v4);
  if ((v5 & 1) == 0)
  {
  }
}

- (ARTechniqueForwardingStrategy)depthTechniqueProcessingStrategy
{
  return self->_depthTechniqueProcessingStrategy;
}

- (void)setDepthTechniqueProcessingStrategy:(id)a3
{
}

- (int64_t)optimizationStrategy
{
  return self->_optimizationStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthTechniqueProcessingStrategy, 0);
  objc_storeStrong((id *)&self->_personDetectionTechniques, 0);
  objc_storeStrong((id *)&self->_primaryPersonDetectionTechnique, 0);
  objc_storeStrong((id *)&self->_depthTechnique, 0);
}

@end