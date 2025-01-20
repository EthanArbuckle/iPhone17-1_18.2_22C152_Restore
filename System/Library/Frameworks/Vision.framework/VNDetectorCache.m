@interface VNDetectorCache
- (VNDetectorCache)init;
- (VNDetectorCacheDelegate)delegate;
- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5;
- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5;
- (id)loadedDetectors;
- (void)_reportEvictedDetectors:(unsigned char *)a1;
- (void)cacheDetector:(id)a3;
- (void)evictAllDetectors;
- (void)evictDetectorsPassingTest:(id)a3;
- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation VNDetectorCache

- (void)cacheDetector:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_detectors, "containsObject:") & 1) == 0)
  {
    uint64_t v4 = [(NSMutableSet *)self->_detectors addObject:v7];
    if (*(unsigned char *)&self->_delegateFlags)
    {
      v5 = (void *)MEMORY[0x1A6257080](v4);
      v6 = [(VNDetectorCache *)self delegate];
      [v6 detectorCache:self didCacheDetector:v7];
    }
  }
}

- (VNDetectorCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VNDetectorCacheDelegate *)WeakRetained;
}

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1A6257080]();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = self->_detectors;
  id v11 = (id)[(NSMutableSet *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v14 canBehaveAsDetectorOfClass:a3 withConfiguration:v8])
        {
          id v11 = v14;
          int v15 = 0;
          goto LABEL_11;
        }
      }
      id v11 = (id)[(NSMutableSet *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  int v15 = 1;
LABEL_11:

  if (v15)
  {
    if (a5)
    {
      v16 = NSString;
      v17 = NSStringFromClass(a3);
      v18 = [v16 stringWithFormat:@"%@ not available", v17];
      *a5 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v18];
    }
    id v11 = 0;
  }

  return v11;
}

- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__VNDetectorCache_releaseDetectorsThatCanBeReplacedByDetectorOfClass_withConfiguration___block_invoke;
  v8[3] = &unk_1E5B1DB20;
  id v9 = v6;
  Class v10 = a3;
  id v7 = v6;
  [(VNDetectorCache *)self evictDetectorsPassingTest:v8];
}

- (void)evictDetectorsPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (unsigned int (**)(id, uint64_t, char *))a3;
  if ([(NSMutableSet *)self->_detectors count])
  {
    v5 = (void *)MEMORY[0x1A6257080]();
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    char v16 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_detectors;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        if (v4[2](v4, v11, &v16)) {
          objc_msgSend(v6, "addObject:", v11, (void)v12);
        }
        if (v16) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v6 count])
    {
      [(NSMutableSet *)self->_detectors minusSet:v6];
      -[VNDetectorCache _reportEvictedDetectors:](self, v6);
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v4;
}

- (VNDetectorCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNDetectorCache;
  v2 = [(VNDetectorCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    detectors = v2->_detectors;
    v2->_detectors = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectors, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __88__VNDetectorCache_releaseDetectorsThatCanBeReplacedByDetectorOfClass_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldBeReplacedByDetectorOfClass:*(void *)(a1 + 40) withConfiguration:*(void *)(a1 + 32)];
}

- (id)loadedDetectors
{
  v2 = [(NSMutableSet *)self->_detectors allObjects];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[VNDetector detectorClassAndConfigurationOptions:0 forDetectorType:v8 options:v9 error:a5];
  if (v10)
  {
    uint64_t v11 = [(VNDetectorCache *)self detectorOfClass:v10 configuredWithOptions:v9 error:a5];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)evictAllDetectors
{
  if ([(NSMutableSet *)self->_detectors count])
  {
    v3 = (void *)MEMORY[0x1A6257080]();
    char v4 = (void *)[(NSMutableSet *)self->_detectors copy];
    [(NSMutableSet *)self->_detectors removeAllObjects];
    -[VNDetectorCache _reportEvictedDetectors:](self, v4);
  }
}

- (void)_reportEvictedDetectors:(unsigned char *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && (a1[16] & 2) != 0)
  {
    char v4 = [a1 delegate];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "detectorCache:didEvictDetector:", a1, *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

@end